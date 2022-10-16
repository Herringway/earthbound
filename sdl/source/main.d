import std.stdio;
import std.experimental.logger;
import std.file : dirEntries, exists, read, SpanMode;
import std.conv : to;
import std.path : baseName, stripExtension;
import std.algorithm : filter;
import std.format : sformat;
import std.range : chain;
import std.typecons : Nullable;
import std.getopt;
import std.string : fromStringz, format, toStringz;
import core.thread : Fiber;

import siryul;

import bindbc.loader;
import bindbc.sdl;

import earthbound.bank00 : start, nmi;
import earthbound.commondefs;
import earthbound.hardware : JOYPAD_1_DATA, JOYPAD_2_DATA;
import earthbound.text;

import audio;
import gamepad;
import misc;
import sfcdma;
import snesdrawframe;
import rendering;

struct VideoSettings {
	WindowMode windowMode;
	uint zoom = 1;
	bool keepAspectRatio = true;
}

struct Settings {
	static struct AudioSettings {
		uint sampleRate = 44100;
		ubyte channels = 2;
	}
	AudioSettings audio;
	VideoSettings video;
	Controller[SDL_GameControllerButton] gamepadMapping;
	Controller[SDL_Scancode] keyboardMapping;
	GameConfig game;
}

void saveGraphicsStateToFile(string filename) {
	File(filename~".vram", "wb").rawWrite(g_frameData.vram);
	File(filename~".cgram", "wb").rawWrite(g_frameData.cgram);
	File(filename~".oam", "wb").rawWrite(g_frameData.oam1);
	File(filename~".oam2", "wb").rawWrite(g_frameData.oam2);
}


void handleNullableOption(alias var)(string, string value) {
	infof("%s", value);
	var = value.to!(typeof(var.get));
}

void main(string[] args) {
	uint frameTotal;
	uint frameCounter;
	if (!"settings.yml".exists) {
		getDefaultSettings().toFile!YAML("settings.yml");
	}
	const settings = fromFile!(Settings, YAML, DeSiryulize.optionalByDefault)("settings.yml");
	bool verbose;
	Nullable!bool noIntro;
	Nullable!ubyte autoLoadFile;
	Nullable!bool debugMenu;
	auto help = getopt(args,
		"verbose|v", "Print extra information", &verbose,
		"nointro|n", "Skip intro scenes", &handleNullableOption!noIntro,
		"autoload|a", "Auto-load specified file. Will be created if nonexistent", &handleNullableOption!autoLoadFile,
		"debug|d", "Always boot to debug menu (debug builds only)", &handleNullableOption!debugMenu,
	);
	if (help.helpWanted) {
		defaultGetoptPrinter("Earthbound.", help.options);
		return;
	}
	if (!verbose) {
		sharedLog = new FileLogger(stdout, LogLevel.info);
	} else {
		sharedLog = new FileLogger(stdout, LogLevel.trace);
	}

	if (!loadRenderer()) {
		return;
	}
	scope(exit) {
	  unloadRenderer();
	}
	if (!initializeRenderer(settings.video.zoom, settings.video.windowMode, settings.video.keepAspectRatio)) {
		return;
	}
	scope(exit) {
		uninitializeRenderer();
	}
	// Prepare to play music
	if (!initAudio(settings.audio.channels, settings.audio.sampleRate)) {
		return;
	}
	infof("SDL audio subsystem initialized (%s)", SDL_GetCurrentAudioDriver().fromStringz);
	scope(exit) {
		uninitializeAudio();
	}

	if (SDL_InitSubSystem(SDL_INIT_GAMECONTROLLER) < 0) {
		SDLError("Couldn't initialise controller SDL subsystem: %s");
		return;
	}
	if ("gamecontrollerdb.txt".exists) {
		if (SDL_GameControllerAddMappingsFromFile("gamecontrollerdb.txt") < 0) {
			SDLError("Error loading game controller database");
		} else {
			info("Successfully loaded game controller database");
		}
	}
	SDL_GameControllerEventState(SDL_ENABLE);
	info("SDL game controller subsystem initialized");

	loadAudioData();

	foreach (textDocFile; getDataFiles("text", "*.yaml")) {
		const textData = fromFile!(StructuredText[][string], YAML, DeSiryulize.optionalByDefault)(textDocFile);
		foreach (label, script; textData) {
			loadText(script, label);
		}
	}
	tracef("Loaded text");

	bool run = true, dumpVram = false, pause = false, step = false, fastForward = false, printRegisters = false, dumpEntities = false;
	int dumpVramCount = 0;

	void handleButton(Controller button, bool pressed, uint playerID) {
		final switch (button) {
			case Controller.up, Controller.down, Controller.left, Controller.right, Controller.l, Controller.r, Controller.select, Controller.start, Controller.a, Controller.b, Controller.x, Controller.y, Controller.extra1, Controller.extra2, Controller.extra3, Controller.extra4:
				handleSNESButton(cast(ushort)controllerToPad(button), pressed, playerID);
				break;
			case Controller.fastForward:
				fastForward = pressed;
				break;
			case Controller.pause:
				if (pressed) {
					pause = !pause;
				}
				break;
			case Controller.dumpVRAM:
				dumpVram = pressed;
				break;
			case Controller.printRegisters:
				printRegisters = pressed;
				break;
			case Controller.dumpEntities:
				dumpEntities = pressed;
				break;
			case Controller.skipFrame:
				step = pressed;
				break;
			case Controller.exit:
				run = pressed;
				break;
		}
	}

	waitForInterrupt = () { Fiber.yield(); };
	earthbound.commondefs.handleOAMDMA = &sfcdma.handleOAMDMA;
	earthbound.commondefs.handleCGRAMDMA = &sfcdma.handleCGRAMDMA;
	earthbound.commondefs.handleVRAMDMA = &sfcdma.handleVRAMDMA;
	earthbound.commondefs.handleHDMA = &sfcdma.handleHDMA;
	earthbound.commondefs.setFixedColourData = &rendering.setFixedColourData;
	earthbound.commondefs.setBGOffsetX = &rendering.setBGOffsetX;
	earthbound.commondefs.setBGOffsetY = &rendering.setBGOffsetY;
	earthbound.commondefs.playSFX = &audio.playSFX;
	playMusicExternal = &audio.playMusic;
	stopMusicExternal = &audio.stopMusic;
	earthbound.commondefs.config = settings.game;
	if (!autoLoadFile.isNull) {
		earthbound.commondefs.config.autoLoadFile = autoLoadFile;
	}
	debug if (!debugMenu.isNull) {
		earthbound.commondefs.config.loadDebugMenu = debugMenu.get();
	}
	if (!noIntro.isNull) {
		earthbound.commondefs.config.noIntro = noIntro.get();
	}
	auto game = new Fiber(&start);
	while(run) {
		step = !pause;
		SDL_Event event;
		while(SDL_PollEvent(&event)) {
			switch (event.type) {
				case SDL_EventType.SDL_QUIT:
					run = false;
					break;
				case SDL_EventType.SDL_KEYDOWN:
				case SDL_EventType.SDL_KEYUP:
					if (auto button = event.key.keysym.scancode in settings.keyboardMapping) {
						handleButton(*button, event.type == SDL_KEYDOWN, 1);
					}
					break;
				case SDL_CONTROLLERBUTTONUP:
				case SDL_CONTROLLERBUTTONDOWN:
					if (auto button = cast(SDL_GameControllerButton)event.cbutton.button in settings.gamepadMapping) {
						handleButton(*button, event.type == SDL_CONTROLLERBUTTONDOWN, SDL_GameControllerGetPlayerIndex(SDL_GameControllerFromInstanceID(event.cbutton.which)));
					}
					break;
				case SDL_CONTROLLERDEVICEADDED:
					connectGamepad(event.cdevice.which);
					break;

				case SDL_CONTROLLERDEVICEREMOVED:
					disconnectGamepad(event.cdevice.which);
					break;
				default: break;
			}
		}
		startFrame();

		if (step) {
			Throwable t = game.call(Fiber.Rethrow.no);
			if(t) {
				throw t;
			}
			nmi();
			copyGlobalsToFrameData();
		}
		endFrame();

		const renderTime = waitForNextFrame(!fastForward);
		frameTotal += timeSinceFrameStart.total!"msecs";
		if (frameCounter++ == 60) {
			char[30] buffer = 0;
			setTitle(sformat(buffer, "Earthbound: %.4s FPS", 1000.0 / (cast(double)frameTotal / 60.0)));
			frameCounter = 0;
			frameTotal = 0;
		}
		if (dumpVram) {
			saveGraphicsStateToFile(format!"gfxstate%03d"(dumpVramCount));
			dumpVram = false;
			dumpVramCount += 1;
		}
		if (printRegisters) {
			writeln(g_frameData);
			printRegisters = false;
		}
		if (dumpEntities) {
			import earthbound.globals;
			auto entityEntry = firstEntity;
			while (entityEntry >= 0) {
				const entity = entityEntry / 2;
				writefln!"Entity %d"(entity);
				writefln!"\tVars: [%d, %d, %d, %d, %d, %d, %d, %d]"(entityScriptVar0Table[entity], entityScriptVar1Table[entity], entityScriptVar2Table[entity], entityScriptVar3Table[entity], entityScriptVar4Table[entity], entityScriptVar5Table[entity], entityScriptVar6Table[entity], entityScriptVar7Table[entity]);
				writeln("\tScript: ", cast(ActionScript)entityScriptTable[entity]);
				writeln("\tScript index: ", entityScriptIndexTable[entity]);
				writefln!"\tScreen coords: (%d, %d)"(entityScreenXTable[entity], entityScreenYTable[entity]);
				writefln!"\tAbsolute coords: (%s, %s, %s)"(FixedPoint1616(entityAbsXFractionTable[entity], entityAbsXTable[entity]).asDouble, FixedPoint1616(entityAbsYFractionTable[entity], entityAbsYTable[entity]).asDouble, FixedPoint1616(entityAbsZFractionTable[entity], entityAbsZTable[entity]).asDouble);
				writefln!"\tDelta coords: (%s, %s, %s)"(FixedPoint1616(entityDeltaXFractionTable[entity], entityDeltaXTable[entity]).asDouble, FixedPoint1616(entityDeltaYFractionTable[entity], entityDeltaYTable[entity]).asDouble, FixedPoint1616(entityDeltaZFractionTable[entity], entityDeltaZTable[entity]).asDouble);
				writeln("\tDirection: ", cast(Direction)entityDirections[entity]);
				writeln("\tSize: ", entitySizes[entity]);
				writeln("\tDraw Priority: ", entityDrawPriority[entity]);
				writefln!"\tTick callback flags: %016b"(entityTickCallbackFlags[entity]);
				writefln!"\tAnimation frame: %s"(entityAnimationFrames[entity]);
				writefln!"\tSpritemap flags: %016b"(entitySpriteMapFlags[entity]);
				writefln!"\tCollided objects: %s"(entityCollidedObjects[entity]);
				writefln!"\tObstacle flags: %016b"(entityObstacleFlags[entity]);
				writefln!"\tVRAM address: $%04X"(entityVramAddresses[entity] * 2);
				writefln!"\tSurface flags: %016b"(entitySurfaceFlags[entity]);
				writefln!"\tTPT entry: %s"(entityTPTEntries[entity]);
				writefln!"\tTPT entry sprite: %s"(cast(OverworldSprite)entityTPTEntrySprites[entity]);
				writefln!"\tEnemy ID: %s"(entityEnemyIDs[entity]);
				writeln("\tSleep frames: ", entityScriptSleepFrames[entity]);
				writefln!"\tUnknown7E1A4A: %s"(entityUnknown1A4A[entity]);
				writefln!"\tUnknown7E1A86: %s"(entityUnknown1A86[entity]);
				writefln!"\tUnknown7E284C: %s"(entityUnknown284C[entity]);
				writefln!"\tUnknown7E2916: %s"(entityUnknown2916[entity]);
				writefln!"\tUnknown7E2952: %s"(entityUnknown2952[entity]);
				writefln!"\tUnknown7E2B32: %s"(entityUnknown2B32[entity]);
				writefln!"\tUnknown7E2BE6: %s"(entityUnknown2BE6[entity]);
				writefln!"\tUnknown7E2C22: %s"(entityUnknown2C22[entity]);
				writefln!"\tUnknown7E2C5E: %s"(entityUnknown2C5E[entity]);
				writefln!"\tUnknown7E2D4E: %s"(entityUnknown2D4E[entity]);
				writefln!"\tUnknown7E2D8A: %s"(entityUnknown2D8A[entity]);
				writefln!"\tUnknown7E2DC6: %s"(entityUnknown2DC6[entity]);
				writefln!"\tUnknown7E2E3E: %s"(entityUnknown2E3E[entity]);
				writefln!"\tUnknown7E2E7A: %s"(entityUnknown2E7A[entity]);
				writefln!"\tUnknown7E2EF2: %s"(entityUnknown2EF2[entity]);
				writefln!"\tUnknown7E2FA6: %s"(entityUnknown2FA6[entity]);
				writefln!"\tUnknown7E305A: %s"(entityUnknown305A[entity]);
				writefln!"\tUnknown7E310E: %s"(entityUnknown310E[entity]);
				writefln!"\tUnknown7E3186: %s"(entityUnknown3186[entity]);
				writefln!"\tUnknown7E332A: %s"(entityUnknown332A[entity]);
				writefln!"\tUnknown7E3366: %s"(entityUnknown3366[entity]);
				writefln!"\tUnknown7E33A2: %s"(entityUnknown33A2[entity]);
				writefln!"\tUnknown7E33DE: %s"(entityUnknown33DE[entity]);
				writefln!"\tUnknown7E3456: %s"(entityUnknown3456[entity]);
				entityEntry = entityNextEntityTable[entity];
			}
			writeln("----");
			foreach (sprMap; chain(unknown7E2404[], unknown7E2506[], unknown7E2608[], unknown7E270A[]).filter!(x => x != null)) {
				writefln!"Sprite: %s,%s,%s,%s,%s"(sprMap.unknown0, sprMap.unknown10, sprMap.flags, sprMap.unknown3, sprMap.unknown4);
			}
			dumpEntities = false;
		}
	}
}


Settings getDefaultSettings() {
	Settings defaults;
	defaults.gamepadMapping = getDefaultGamepadMapping();
	defaults.keyboardMapping = getDefaultKeyboardMapping();
	return defaults;
}
