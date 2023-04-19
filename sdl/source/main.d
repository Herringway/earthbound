import std.algorithm : filter;
import std.conv : to;
import std.datetime : SysTime;
import std.experimental.logger;
import std.file : exists, getTimes;
import std.format : sformat;
import std.getopt;
import std.range : chain, drop, front, repeat, zip;
import std.parallelism : parallel;
import std.stdio : File, write, writef, writefln, writeln;
import std.string : fromStringz, format;
import std.typecons : Nullable;
import core.thread : Fiber;

import siryul;

import bindbc.sdl;

import earthbound.bank00 : start, irqNMICommon;
import earthbound.commondefs;
import earthbound.text;

import audio;
import gamepad;
import misc;
import sfcdma;
import rendering;

enum textCacheFile = "text.cache";

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
	AxisMapping[SDL_GameControllerAxis] gamepadAxisMapping;
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
	bool forceCacheRebuild;
	Nullable!bool noIntro;
	Nullable!ubyte autoLoadFile;
	Nullable!bool debugMenu;
	auto help = getopt(args,
		"verbose|v", "Print extra information", &verbose,
		"nointro|n", "Skip intro scenes", &handleNullableOption!noIntro,
		"autoload|a", "Auto-load specified file. Will be created if nonexistent", &handleNullableOption!autoLoadFile,
		"debug|d", "Always boot to debug menu (debug builds only)", &handleNullableOption!debugMenu,
		"forcecacherebuild|t", "Force a text cache rebuild", &forceCacheRebuild,
	);
	if (help.helpWanted) {
		defaultGetoptPrinter("Earthbound.", help.options);
		return;
	}
	if (verbose) {
		(cast()sharedLog).logLevel = LogLevel.trace;
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

	if (!initializeGamepad()) {
		return;
	}
	scope(exit) {
		uninitializeGamepad();
	}

	loadAudioData();

	SysTime _, textCacheTime;
	bool loadCachedText = true;
	if (textCacheFile.exists) {
		getTimes(textCacheFile, _, textCacheTime);
	} else {
		loadCachedText = false;
	}

	foreach (textDocFile; getDataFiles("text", "*.yaml")) {
		SysTime textTime;
		getTimes(textDocFile, _, textTime);
		if (forceCacheRebuild || (textTime > textCacheTime)) {
			tracef("%s is newer than cache, rebuilding", textDocFile);
			loadCachedText = false;
			break;
		}
	}
	if (!loadCachedText) {
		infof("Text files newer than cache, rebuilding...");
		foreach (textDocFile; parallel(getDataFiles("text", "*.yaml"))) {
			const textData = fromFile!(StructuredText[][string][], YAML, DeSiryulize.optionalByDefault)(textDocFile);
			foreach (idx, scriptData; textData) {
				string nextLabel;
				if (idx + 1 < textData.length) {
					nextLabel = textData[idx + 1].keys[0];
				}
				string label = scriptData.keys[0];
				auto script = scriptData.values[0];
				loadText(script, label, nextLabel);
			}
			tracef("Loaded text %s", textDocFile);
		}
		tracef("Loaded text, saving cache");
		saveTextCache(textCacheFile);
		tracef("Saved text cache");
	} else {
		tracef("Loading text from cache");
		loadTextCache(textCacheFile);
	}


	int dumpVramCount = 0;

	waitForInterrupt = () { Fiber.yield(); };
	earthbound.commondefs.handleOAMDMA = &sfcdma.handleOAMDMA;
	earthbound.commondefs.handleCGRAMDMA = &sfcdma.handleCGRAMDMA;
	earthbound.commondefs.handleVRAMDMA = &sfcdma.handleVRAMDMA;
	earthbound.commondefs.handleHDMA = &sfcdma.handleHDMA;
	earthbound.commondefs.setFixedColourData = &rendering.setFixedColourData;
	earthbound.commondefs.setBGOffsetX = &rendering.setBGOffsetX;
	earthbound.commondefs.setBGOffsetY = &rendering.setBGOffsetY;
	earthbound.commondefs.playSFX = &audio.playSFX;
	earthbound.commondefs.setAudioChannels = &audio.setAudioChannels;
	earthbound.commondefs.doMusicEffect = &audio.doMusicEffect;
	earthbound.commondefs.setStatic = &audio.setStatic;
	earthbound.commondefs.getControllerState = &gamepad.getControllerState;
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
	bool paused;
	gameLoop: while(true) {
		SDL_Event event;
		while(SDL_PollEvent(&event)) {
			switch (event.type) {
				case SDL_EventType.SDL_QUIT:
					break gameLoop;
				case SDL_EventType.SDL_KEYDOWN:
				case SDL_EventType.SDL_KEYUP:
					if (auto button = event.key.keysym.scancode in settings.keyboardMapping) {
						handleButton(*button, event.type == SDL_KEYDOWN, 1);
					}
					break;
				case SDL_EventType.SDL_CONTROLLERAXISMOTION:
					if (auto axis = cast(SDL_GameControllerAxis)event.caxis.axis in settings.gamepadAxisMapping) {
						handleAxis(SDL_GameControllerGetPlayerIndex(SDL_GameControllerFromInstanceID(event.caxis.which)), *axis, event.caxis.value);
					}
					break;
				case SDL_EventType.SDL_CONTROLLERBUTTONUP:
				case SDL_EventType.SDL_CONTROLLERBUTTONDOWN:
					if (auto button = cast(SDL_GameControllerButton)event.cbutton.button in settings.gamepadMapping) {
						handleButton(*button, event.type == SDL_CONTROLLERBUTTONDOWN, SDL_GameControllerGetPlayerIndex(SDL_GameControllerFromInstanceID(event.cbutton.which)));
					}
					break;
				case SDL_EventType.SDL_CONTROLLERDEVICEADDED:
					connectGamepad(event.cdevice.which);
					break;

				case SDL_EventType.SDL_CONTROLLERDEVICEREMOVED:
					disconnectGamepad(event.cdevice.which);
					break;
				default: break;
			}
		}
		if (input.exit) {
			break gameLoop;
		}
		startFrame();

		if (!paused || input.step) {
			Throwable t = game.call(Fiber.Rethrow.no);
			if(t) {
				throw t;
			}
			irqNMICommon();
			copyGlobalsToFrameData();
		}
		endFrame();

		const renderTime = waitForNextFrame(!input.fastForward);
		frameTotal += timeSinceFrameStart.total!"msecs";
		if (frameCounter++ == 60) {
			char[30] buffer = 0;
			setTitle(sformat(buffer, "Earthbound: %.4s FPS", 1000.0 / (cast(double)frameTotal / 60.0)));
			frameCounter = 0;
			frameTotal = 0;
		}
		if (input.dumpVram) {
			saveGraphicsStateToFile(format!"gfxstate%03d"(dumpVramCount));
			input.dumpVram = false;
			dumpVramCount += 1;
		}
		if (input.printRegisters) {
			writeln(g_frameData);
			input.printRegisters = false;
		}
		if (input.dumpEntities) {
			printEntities();
			input.dumpEntities = false;
		}
		if (input.pause) {
			paused = !paused;
			input.pause = false;
		}
		if (input.dumpSave) {
			import earthbound.globals;
			import earthbound.bank2F;
			import core.stdc.string;
			SaveData block;
			memcpy(&block.gameState, &gameState, GameState.sizeof);
			memcpy(&block.partyCharacters, &partyCharacters[0], (PartyCharacter[6]).sizeof);
			memcpy(&block.eventFlags, &eventFlags[0], eventFlags.sizeof);
			block.toFile!YAML("save.yaml");
			input.dumpSave = false;
		}
		foreach (idx, ref layer; input.layerTogglePressed) {
			layersDisabled ^= layer << (4 - idx);
			layer = false;
		}
	}
}

Settings getDefaultSettings() {
	Settings defaults;
	defaults.gamepadMapping = getDefaultGamepadMapping();
	defaults.gamepadAxisMapping = getDefaultGamepadAxisMapping();
	defaults.keyboardMapping = getDefaultKeyboardMapping();
	return defaults;
}

void printBorder(string chars, int[] paddings) {
	write(chars.front);
	const connector = chars.drop(1).front;
	foreach (idx, padding; paddings) {
		writef!"%-(%s%)"("─".repeat(padding));
		if (idx != paddings.length - 1) {
			write(connector);
		}
	}
	writeln(chars.drop(2).front);
}
void printEntry(int[] paddings, string[] strs...) {
	foreach (pair; zip(paddings, strs)) {
		writef!"│%*s"(-pair[0], pair[1]);
	}
	writeln("│");
}
void printEntities() {
	import earthbound.globals;
	short entityEntry = firstEntity;
	int[] paddings = [2, 20, 30, 6, 6, 6, 6, 6, 6, 6, 6, 12, 18, 4, 9, 3, 5, 5, 3, 3, 5, 17, 9, 50, 5];
	printBorder("┌┬┐", paddings);
	printEntry(paddings, "ID", "Sprite", "Script", "Var 0", "Var 1", "Var 2", "Var 3", "Var 4", "Var 5", "Var 6", "Var 7", "Scrn Coords", "Abs Coords", "Size", "Direction", "Pri", "VRAM", "Frame", "NPC", "NME", "Colsn", "Tick flags", "Spr Flags", "Surface Flags", "Sleep");
	printBorder("├┼┤", paddings);
	while (entityEntry >= 0) {
		const entity = entityEntry / 2;
		printEntry(paddings,
			format!"%s"(entity),
			format!"%s"(cast(OverworldSprite)entityTPTEntrySprites[entity]),
			format!"%s"(cast(ActionScript)entityScriptTable[entity]),
			format!"%s"(entityScriptVar0Table[entity]),
			format!"%s"(entityScriptVar1Table[entity]),
			format!"%s"(entityScriptVar2Table[entity]),
			format!"%s"(entityScriptVar3Table[entity]),
			format!"%s"(entityScriptVar4Table[entity]),
			format!"%s"(entityScriptVar5Table[entity]),
			format!"%s"(entityScriptVar6Table[entity]),
			format!"%s"(entityScriptVar7Table[entity]),
			format!"%s, %s"(entityScreenXTable[entity], entityScreenYTable[entity]),
			format!"%s, %s, %s"(FixedPoint1616(entityAbsXFractionTable[entity], entityAbsXTable[entity]).asDouble, FixedPoint1616(entityAbsYFractionTable[entity], entityAbsYTable[entity]).asDouble, FixedPoint1616(entityAbsZFractionTable[entity], entityAbsZTable[entity]).asDouble),
			format!"%s"(entitySizes[entity]),
			format!"%s"(cast(Direction)entityDirections[entity]),
			format!"%s"(entityDrawPriority[entity]),
			format!"$%04X"(entityVramAddresses[entity] * 2),
			format!"%s"(entityAnimationFrames[entity]),
			format!"%s"(cast(short)entityTPTEntries[entity]),
			format!"%s"(entityEnemyIDs[entity]),
			format!"%s"(entityCollidedObjects[entity]),
			format!"%s"(printableFlags(cast(EntityTickFlags)(entityTickCallbackFlags[entity] & 0xC000))),
			format!"%s"(printableFlags(cast(SpriteMapFlags)(entitySpriteMapFlags[entity] & 0x8000))),
			format!"%s"(printableFlags(cast(SurfaceFlags)entitySurfaceFlags[entity])),
			format!"%s"(entityScriptSleepFrames[entity]),
		);
		entityEntry = entityNextEntityTable[entity];
	}
	printBorder("└┴┘", paddings);
	int[] paddingsExtra = [2, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 9];
	printBorder("┌┬┐", paddingsExtra);
	printEntry(paddingsExtra, "ID", "1A4A", "1A86", "284C", "2916", "2952", "2B32", "2BE6", "2C22", "2C5E", "2D4E", "2D8A", "2DC6", "2E3E", "2E7A", "2EF2", "2FA6", "305A", "310E", "3186", "332A", "3366", "33A2", "33DE", "3456", "P Buf Idx");
	printBorder("├┼┤", paddingsExtra);
	entityEntry = firstEntity;
	while (entityEntry >= 0) {
		const entity = entityEntry / 2;
		printEntry(paddingsExtra,
			format!"%s"(entity),
			format!"%s"(entityUnknown1A4A[entity]),
			format!"%s"(entityUnknown1A86[entity]),
			format!"%s"(entityUnknown284C[entity]),
			format!"%s"(entityUnknown2916[entity]),
			format!"%s"(entityUnknown2952[entity]),
			format!"%s"(entityUnknown2B32[entity]),
			format!"%s"(entityUnknown2BE6[entity]),
			format!"%s"(entityUnknown2C22[entity]),
			format!"%s"(entityUnknown2C5E[entity]),
			format!"%s"(entityUnknown2D4E[entity]),
			format!"%s"(entityUnknown2D8A[entity]),
			format!"%s"(entityUnknown2DC6[entity]),
			format!"%s"(entityUnknown2E3E[entity]),
			format!"%s"(entityUnknown2E7A[entity]),
			format!"%s"(entityUnknown2EF2[entity]),
			format!"%s"(entityUnknown2FA6[entity]),
			format!"%s"(entityUnknown305A[entity]),
			format!"%s"(entityUnknown310E[entity]),
			format!"%s"(entityUnknown3186[entity]),
			format!"%s"(entityUnknown332A[entity]),
			format!"%s"(entityUnknown3366[entity]),
			format!"%s"(entityUnknown33A2[entity]),
			format!"%s"(entityUnknown33DE[entity]),
			format!"%s"(entityUnknown3456[entity]),
			format!"%s"(partyCharacters[entityScriptVar1Table[entity] % 4].positionIndex),
		);
		entityEntry = entityNextEntityTable[entity];
	}
	printBorder("└┴┘", paddingsExtra);
	int[] paddingsSprites = [5, 5, 10, 8, 8];
	printBorder("┌┬┐", paddingsSprites);
	printEntry(paddingsSprites, "X", "Y", "First Tile", "Flags", "Special");
	printBorder("├┼┤", paddingsSprites);
	foreach (sprMap; chain(unknown7E2404[], unknown7E2506[], unknown7E2608[], unknown7E270A[]).filter!(x => x != null)) {
		printEntry(paddingsSprites,
			format!"%s"(sprMap.xOffset),
			format!"%s"(sprMap.yOffset),
			format!"%s"(sprMap.firstTile),
			format!"%08b"(sprMap.flags),
			format!"%08b"(sprMap.specialFlags),
		);
	}
	printBorder("└┴┘", paddingsSprites);
}
