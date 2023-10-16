module game;

import std.algorithm : filter;
import std.conv : to;
import std.datetime : Clock, SysTime;
import std.experimental.logger;
import std.exception;
import std.file : exists, getTimes, mkdirRecurse, read;
import std.format : sformat;
import std.getopt;
import std.path;
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
import dataloader;
import earthbound.text;

import earthbound.assets;
import earthbound.sdl.audio.common;
import earthbound.sdl.debugging;
import earthbound.sdl.gamepad;
import earthbound.sdl.inputconstants;
import earthbound.sdl.misc;
import earthbound.sdl.sfcdma;
import earthbound.sdl.rendering;
import earthbound.sdl.watchdog;

import imgui.sdl;
import ImGui = d_imgui;

struct VideoSettings {
	WindowMode windowMode;
	uint zoom = 1;
	bool keepAspectRatio = true;
	Renderer renderer = Renderer.bsnes;
}

struct Settings {
	AudioSettings audio;
	VideoSettings video;
	Controller[GamePadButton] gamepadMapping;
	AxisMapping[GamePadAxis] gamepadAxisMapping;
	Controller[KeyboardKey] keyboardMapping;
	GameConfig game;
	bool advancedDebugging;
}

void handleNullableOption(alias var)(string, string value) {
	infof("%s", value);
	var = value.to!(typeof(var.get));
}
version(unittest) {} else {
int main(string[] args) {
	if (!"settings.yml".exists) {
		getDefaultSettings().toFile!YAML("settings.yml");
	}
	const settings = fromFile!(Settings, YAML, DeSiryulize.optionalByDefault)("settings.yml");
	bool verbose;
	bool forceAssetExtraction;
	Nullable!bool noIntro;
	Nullable!ubyte autoLoadFile;
	Nullable!bool debugMenu;
	string logFile;
	auto help = getopt(args,
		"verbose|v", "Print extra information", &verbose,
		"logfile|l", "Log to file", &logFile,
		"nointro|n", "Skip intro scenes", &handleNullableOption!noIntro,
		"autoload|a", "Auto-load specified file. Will be created if nonexistent", &handleNullableOption!autoLoadFile,
		"debug|d", "Always boot to debug menu (debug builds only)", &handleNullableOption!debugMenu,
		"forceassetextraction|t", "Force asset extraction", &forceAssetExtraction,
	);
	if (help.helpWanted) {
		defaultGetoptPrinter("Earthbound.", help.options);
		return 2;
	}
	if (logFile) {
		sharedLog = cast(shared)new FileLogger(logFile, LogLevel.info);
	}
	if (verbose) {
		(cast()sharedLog).logLevel = LogLevel.trace;
	}

	try {
		loadRenderer(settings.video.renderer);
		initializeRenderer(settings.video.zoom, settings.video.windowMode, settings.video.keepAspectRatio, settings.advancedDebugging);
		if (settings.advancedDebugging) {
			initializeImgui();
		}
		initAudio(settings.audio);
		initializeGamepad();
	} catch (Exception e) {
		criticalf("Error: %s", e.msg);
		return 3;
	}

	scope(exit) {
		unloadRenderer();
		uninitializeRenderer();
		uninitializeAudio();
		uninitializeGamepad();
		if (settings.advancedDebugging) {
			uninitializeImgui();
		}
	}

	tryExtractAssets("data", forceAssetExtraction);

	loadAssets("data");

	waitForInterrupt = () { Fiber.yield(); };
	earthbound.commondefs.handleOAMDMA = &earthbound.sdl.sfcdma.handleOAMDMA;
	earthbound.commondefs.handleCGRAMDMA = &earthbound.sdl.sfcdma.handleCGRAMDMA;
	earthbound.commondefs.handleVRAMDMA = &earthbound.sdl.sfcdma.handleVRAMDMA;
	earthbound.commondefs.handleHDMA = &earthbound.sdl.sfcdma.handleHDMA;
	earthbound.commondefs.setFixedColourData = &earthbound.sdl.rendering.setFixedColourData;
	earthbound.commondefs.setBGOffsetX = &earthbound.sdl.rendering.setBGOffsetX;
	earthbound.commondefs.setBGOffsetY = &earthbound.sdl.rendering.setBGOffsetY;
	earthbound.commondefs.drawRect = &earthbound.sdl.rendering.drawRect;
	earthbound.commondefs.playSFX = playSFXFunction;
	earthbound.commondefs.playMusicExternal = playMusicExternalFunction;
	earthbound.commondefs.stopMusicExternal = stopMusicExternalFunction;
	earthbound.commondefs.setAudioChannels = setAudioChannelsFunction;
	earthbound.commondefs.doMusicEffect = doMusicEffectFunction;
	earthbound.commondefs.setStatic = setStaticFunction;
	earthbound.commondefs.getControllerState = &earthbound.sdl.gamepad.getControllerState;
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
	startWatchDog();
	bool paused;
	gameLoop: while(true) {
		// pet the dog each frame so it knows we're ok
		watchDog.pet();
		frameStatTracker.startFrame();
		SDL_Event event;
		while(SDL_PollEvent(&event)) {
			if (settings.advancedDebugging) {
				ImGui_ImplSDL2_ProcessEvent(&event);
			}
			switch (event.type) {
				case SDL_QUIT:
					break gameLoop;
				case SDL_KEYDOWN:
				case SDL_KEYUP:
					if (settings.advancedDebugging && imguiAteKeyboard()) {
						break;
					}
					if (auto button = sdlKeyToKeyboardKey(event.key.keysym.scancode) in settings.keyboardMapping) {
						handleButton(*button, event.type == SDL_KEYDOWN, 1);
					}
					break;
				case SDL_CONTROLLERAXISMOTION:
					if (auto axis = sdlAxisToGamePadAxis(cast(SDL_GameControllerAxis)event.caxis.axis) in settings.gamepadAxisMapping) {
						handleAxis(SDL_GameControllerGetPlayerIndex(SDL_GameControllerFromInstanceID(event.caxis.which)), *axis, event.caxis.value);
					}
					break;
				case SDL_CONTROLLERBUTTONUP:
				case SDL_CONTROLLERBUTTONDOWN:
					if (auto button = sdlButtonToGamePadButton(cast(SDL_GameControllerButton)event.cbutton.button) in settings.gamepadMapping) {
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
		frameStatTracker.checkpoint(FrameStatistic.sdlEvents);
		if (input.exit) {
			break gameLoop;
		}
		startFrame();
		if (settings.advancedDebugging) {
			startUIFrame();
		}

		if (!paused || input.step) {
			input.step = false;
			Throwable t = game.call(Fiber.Rethrow.no);
			if(t) {
				writeDebugDump(t.msg, t.info);
				return 1;
			}
			irqNMICommon();
			copyGlobalsToFrameData();
		}
		frameStatTracker.checkpoint(FrameStatistic.gameLogic);
		renderGame();
		frameStatTracker.checkpoint(FrameStatistic.snesDrawFrame);
		renderOverlay();
		frameStatTracker.checkpoint(FrameStatistic.overlay);
		if (settings.advancedDebugging) {
			renderUI();
		}
		frameStatTracker.checkpoint(FrameStatistic.imgui);
		endFrame();
		frameStatTracker.checkpoint(FrameStatistic.sdlRenderer);

		const renderTime = waitForNextFrame(!input.fastForward);
		updateFrameRate();

		if (!settings.advancedDebugging) {
			setTitle(frameRateString);
		}
		if (input.pause) {
			paused = !paused;
			input.pause = false;
		}
		frameStatTracker.endFrame();
	}
	return 0;
}
}

Settings getDefaultSettings() {
	Settings defaults;
	defaults.gamepadMapping = getDefaultGamepadMapping();
	defaults.gamepadAxisMapping = getDefaultGamepadAxisMapping();
	defaults.keyboardMapping = getDefaultKeyboardMapping();
	return defaults;
}

bool imguiAteKeyboard() {
	const io = &ImGui.GetIO();
	return io.WantCaptureKeyboard;
}
