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
import bindbc.sdl.mixer;

import earthbound.bank00 : start, nmi;
import earthbound.commondefs;
import earthbound.hardware : JOYPAD_1_DATA, JOYPAD_2_DATA;
import earthbound.text;

import nspc;
import gamepad;
import misc;
import sfcdma;
import snesdrawframe;
import snesdrawframedata;

private enum WindowScale = 1;

struct Settings {
	static struct AudioSettings {
		uint sampleRate = 44100;
		ubyte channels = 2;
	}
	AudioSettings audio;
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

bool initAudio(ubyte channels, uint sampleRate) {
	auto result = Mix_OpenAudio(sampleRate, SDL_AudioFormat.AUDIO_S16, channels, 4096) != -1;
	Mix_HookMusic(&nspcFillBuffer, &nspcplayer);
	return result;
}

void stopMusic() {
	nspcplayer.stop();
}

void playMusic(ushort track) {
	nspcplayer.stop();
	if (auto trackData = track in loadedSongs) {
		nspcplayer.loadNSPCFile(*trackData);
		nspcplayer.play();
	}
}

void playSFX(ubyte id) {
	if (id == 0) {
		if(Mix_FadeOutChannel(0, 0) == -1) {
			SDLError("Could not fade out");
		}
	} else {
		if (auto sound = id in loadedSFX) {
			if(Mix_PlayChannel(0, *sound, 0) == -1) {
				SDLError("Could not play sound effect");
			}
		} else {
			tracef("Sound effect %s not loaded, skipping playback", id);
		}
	}
}

Mix_Chunk*[uint] loadedSFX;
ubyte[][uint] loadedSongs;
__gshared NSPCPlayer nspcplayer;

extern (C) void nspcFillBuffer(void* user, ubyte* buf, int bufSize) nothrow {
	import std.exception : assumeWontThrow;
    try {
        (cast(NSPCPlayer*)user).fillBuffer(cast(short[2][])(buf[0 .. bufSize]));
    } catch (Error e) {
        assumeWontThrow(writeln(e));
        throw e;
    }
}

void handleNullableOption(alias var)(string, string value) {
	infof("%s", value);
	var = value.to!(typeof(var.get));
}

void main(string[] args) {
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
	if(!loadSnesDrawFrame()) {
		info("Can't load SnesDrawFrame!");
		return;
	}
	if(loadSDL() < sdlSupport) {
		info("Can't load SDL!");
		return;
	}
	if(loadSDLMixer() < sdlMixerSupport) {
		info("Can't load SDL_Mixer!");
		return;
	}
	if(!initSnesDrawFrame()) {
		info("Error initializing SnesDrawFrame!");
		return;
	}
	info("SnesDrawFrame initialized");

	if(SDL_Init(SDL_INIT_VIDEO) != 0) {
		SDLError("Error initializing SDL: %s");
		return;
	}
	scope(exit) {
	  SDL_Quit();
	}

	const windowFlags = SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE;
	SDL_Window* appWin = SDL_CreateWindow(
		"Earthbound",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		ImgW * WindowScale,
		ImgH * WindowScale,
		windowFlags
	);
	if(appWin is null) {
		SDLError("Error creating SDL window: %s");
		return;
	}
	scope(exit) {
		// Close and destroy the window
		if (appWin !is null) {
			SDL_DestroyWindow(appWin);
		}
	}
	// Prepare to play music
	if (!initAudio(settings.audio.channels, settings.audio.sampleRate)) {
		SDLError("Error initializing audio");
		return;
	}
	infof("SDL audio subsystem initialized (%s)", SDL_GetCurrentAudioDriver().fromStringz);

	const rendererFlags = SDL_RENDERER_ACCELERATED;
	SDL_Renderer* renderer = SDL_CreateRenderer(
		appWin, -1, rendererFlags
	);
	if(renderer is null) {
		SDLError("Error creating SDL renderer: %s");
		return;
	}
	scope(exit) {
		// Close and destroy the renderer
		if (renderer !is null) {
			SDL_DestroyRenderer(renderer);
		}
	}
	info("SDL video & renderer subsystem initialized");

	SDL_Texture* drawTexture = SDL_CreateTexture(
		renderer,
		SDL_PIXELFORMAT_RGB555,
		SDL_TEXTUREACCESS_STREAMING,
		ImgW,
		ImgH
	);
	if(drawTexture is null) {
		SDLError("Error creating SDL texture: %s");
		return;
	}
	scope(exit) {
		// Close and destroy the texture
		if (drawTexture !is null) {
			SDL_DestroyTexture(drawTexture);
		}
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

	if ("data/sfx/".exists) {
		foreach (sfxFile; dirEntries("data/sfx", "*.wav", SpanMode.depth)) {
			try {
				const id = sfxFile.baseName.stripExtension.to!uint;
				loadedSFX[id] = Mix_LoadWAV(sfxFile.name.toStringz);
			} catch (Exception e) {
				errorf("Could not load %s: %s", sfxFile, e.msg);
			}
		}
	}

	if ("data/text/".exists) {
		foreach (textDocFile; dirEntries("data/text", "*.yaml", SpanMode.depth)) {
			const textData = fromFile!(StructuredText[][string], YAML, DeSiryulize.optionalByDefault)(textDocFile);
			foreach (label, script; textData) {
				loadText(script, label);
			}
		}
	}
	tracef("Loaded text");

	int finalSampleRate;
	int finalChannels;
	ushort finalFormat;
	Mix_QuerySpec(&finalSampleRate, &finalFormat, &finalChannels);

	nspcplayer.initialize(finalSampleRate);

	if ("data/songs/".exists) {
		foreach (songFile; dirEntries("data/songs", "*.nspc", SpanMode.depth)) {
			try {
				const id = songFile.baseName.stripExtension.to!uint;
				loadedSongs[id] = cast(ubyte[])read(songFile.name);
			} catch (Exception e) {
				errorf("Could not load %s: %s", songFile, e.msg);
			}
		}
	}

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

	int lastTime;
	waitForInterrupt = () { Fiber.yield(); };
	earthbound.commondefs.handleOAMDMA = &sfcdma.handleOAMDMA;
	earthbound.commondefs.handleCGRAMDMA = &sfcdma.handleCGRAMDMA;
	earthbound.commondefs.handleVRAMDMA = &sfcdma.handleVRAMDMA;
	earthbound.commondefs.handleHDMA = &sfcdma.handleHDMA;
	earthbound.commondefs.setFixedColourData = &snesdrawframedata.setFixedColourData;
	earthbound.commondefs.setBGOffsetX = &snesdrawframedata.setBGOffsetX;
	earthbound.commondefs.setBGOffsetY = &snesdrawframedata.setBGOffsetY;
	earthbound.commondefs.playSFX = &playSFX;
	playMusicExternal = &playMusic;
	stopMusicExternal = &stopMusic;
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

		lastTime = SDL_GetTicks();

		ushort* drawBuffer;
		int drawPitch;
		SDL_LockTexture(drawTexture, null, cast(void**)&drawBuffer, &drawPitch);

		if (step) {
			Throwable t = game.call(Fiber.Rethrow.no);
			if(t) {
				throw t;
			}
			nmi();
			copyGlobalsToFrameData();
		}
		drawFrame(drawBuffer, drawPitch, &g_frameData);
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

		SDL_UnlockTexture(drawTexture);

		SDL_SetRenderDrawColor(renderer, 120, 140, 230, 255);
		SDL_RenderClear(renderer);
		SDL_RenderCopy(renderer, drawTexture, null, null);
		SDL_RenderPresent(renderer);

		int drawTime = SDL_GetTicks() - lastTime;
		if(!fastForward && drawTime < 16) {
			SDL_Delay(16 - drawTime);
		}
		char[30] buffer = 0;
		sformat(buffer, "Earthbound: %s FPS", cast(uint)(1000.0 / (SDL_GetTicks() - lastTime)));
		SDL_SetWindowTitle(appWin, &buffer[0]);
	}
}


Settings getDefaultSettings() {
	Settings defaults;
	defaults.gamepadMapping = getDefaultGamepadMapping();
	defaults.keyboardMapping = getDefaultKeyboardMapping();
	return defaults;
}
