module game;

import std.algorithm : filter;
import std.conv : to;
import std.datetime : SysTime;
import std.experimental.logger;
import std.exception;
import std.file : exists, getTimes, mkdirRecurse, read;
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
import dataloader;
import earthbound.text;

import audio;
import gamepad;
import inputconstants;
import misc;
import sfcdma;
import rendering;

import imgui.sdl;
import ImGui = d_imgui;

enum textCacheFile = "text.cache";
enum extractDoc = "extract.yaml";

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
void main(string[] args) {
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

	try {
		loadRenderer();
		initializeRenderer(settings.video.zoom, settings.video.windowMode, settings.video.keepAspectRatio, settings.advancedDebugging);
		if (settings.advancedDebugging) {
			initializeImgui();
		}
		initAudio(settings.audio.channels, settings.audio.sampleRate);
		initializeGamepad();
	} catch (Exception e) {
		criticalf("Error: %s", e.msg);
		return;
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
	enforce("earthbound.sfc".exists, "Earthbound ROM not found - Place earthbound.sfc in the current directory");
	auto rom = cast(const(ubyte)[])read("earthbound.sfc");
	const detected = detect(rom, "EARTH BOUND          ");
	enforce(detected.matched, "Loaded ROM is not an Earthbound (USA) ROM.");
	if (detected.header) {
		info("Headered ROM detected");
		rom = rom[0x200 .. $];
	}
	loadROMData(rom);

	if (!"data/songs".exists) {
		mkdirRecurse("data/songs");
		buildNSPCFiles(rom);
	}
	if (!"data/sfx".exists) {
		infof("Sound effects not found. No sound effects will play. This is expected until extraction is implemented.");
	}

	loadAudioData();

	bool loadCachedText = !forceCacheRebuild && textCacheFile.exists;

	if (getLastModifiedTime(extractDoc) > getLastModifiedTime(textCacheFile)) {
		loadCachedText = false;
		infof("Text cache out of date");
	}

	if (!loadCachedText) {
		const extractInfo = fromFile!(ExtractInfo, YAML)(extractDoc);
		infof("Building text cache...");
		foreach (textDocFile; extractInfo.text) {
			const textData = parseTextData(rom[textDocFile.offset .. textDocFile.offset + textDocFile.size], textDocFile.offset, extractInfo.renameLabels, extractInfo.text);
			foreach (idx, scriptData; textData) {
				string nextLabel;
				if (idx + 1 < textData.length) {
					nextLabel = textData[idx + 1].keys[0];
				}
				string label = scriptData.keys[0];
				auto script = scriptData.values[0];
				loadText(script, label, nextLabel);
			}
			debug(dumpText) textData.toFile!(YAML, Siryulize.omitInits)(format!"dump/%s.yaml"(textDocFile.name));
			tracef("Loaded text %s", textDocFile.name);
		}
		tracef("Loaded text, saving cache");
		saveTextCache(textCacheFile);
		tracef("Saved text cache");
	} else {
		tracef("Loading text from cache");
		loadTextCache(textCacheFile);
	}

	waitForInterrupt = () { Fiber.yield(); };
	earthbound.commondefs.handleOAMDMA = &sfcdma.handleOAMDMA;
	earthbound.commondefs.handleCGRAMDMA = &sfcdma.handleCGRAMDMA;
	earthbound.commondefs.handleVRAMDMA = &sfcdma.handleVRAMDMA;
	earthbound.commondefs.handleHDMA = &sfcdma.handleHDMA;
	earthbound.commondefs.setFixedColourData = &rendering.setFixedColourData;
	earthbound.commondefs.setBGOffsetX = &rendering.setBGOffsetX;
	earthbound.commondefs.setBGOffsetY = &rendering.setBGOffsetY;
	earthbound.commondefs.drawRect = &rendering.drawRect;
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
				throw t;
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
}
}

Settings getDefaultSettings() {
	Settings defaults;
	defaults.gamepadMapping = getDefaultGamepadMapping();
	defaults.gamepadAxisMapping = getDefaultGamepadAxisMapping();
	defaults.keyboardMapping = getDefaultKeyboardMapping();
	return defaults;
}

struct ExtractInfo {
	string[size_t][string] renameLabels;
	DumpInfo[] text;
}

void buildNSPCFiles(const ubyte[] data) {
	import nspcplay : NSPCWriter, parsePacks, ReleaseTable, VolumeTable;
	import std.algorithm.iteration : map;
	import std.path : buildPath;
	static align(1) struct PackPointer {
		align(1):
		ubyte bank;
		ushort addr;
		uint full() const {
			return addr + ((cast(uint)bank) << 16);
		}
	}
	enum NUM_SONGS = 0xBF;
	enum NUM_PACKS = 0xA9;
	enum packPointerTable = 0x4F947;
	enum packTableOffset = 0x4F70A;
	auto packs = (cast(PackPointer[])(data[packPointerTable .. packPointerTable + NUM_PACKS * PackPointer.sizeof]))
		.map!(x => parsePacks(data[x.full - 0xC00000 .. $]));
	enum SONG_POINTER_TABLE = 0x294A;
	auto bgmPacks = cast(ubyte[3][])data[packTableOffset .. packTableOffset + (ubyte[3]).sizeof * NUM_SONGS];
	auto songPointers = cast(ushort[])packs[1][2].data[SONG_POINTER_TABLE .. SONG_POINTER_TABLE + ushort.sizeof * NUM_SONGS];
	foreach (idx, songPacks; bgmPacks) {
		NSPCWriter writer;
		writer.header.songBase = songPointers[idx];
		writer.header.instrumentBase = 0x6E00;
		writer.header.sampleBase = 0x6C00;
		writer.header.volumeTable = VolumeTable.hal1;
		writer.header.releaseTable = ReleaseTable.hal1;
		if (songPacks[2] == 0xFF) {
			writer.packs ~= packs[1];
		}
		foreach (pack; songPacks) {
			if (pack == 0xFF) {
				continue;
			}
			writer.packs ~= packs[pack];
		}
		tracef("Writing %03X.nspc", idx);
		auto file = File(buildPath("data/songs", format!"%03s.nspc"(idx + 1)), "w").lockingBinaryWriter;
		writer.toBytes(file);
	}
}

auto detect(const scope ubyte[] data, scope string identifier) @safe pure {
	import std.range : only;
    struct Result {
        bool header;
        bool matched;
    }
    foreach (headered, base; zip(only(false, true), only(0xFFB0, 0x101B0))) {
        const checksum = (cast(const ushort[])data[base + 46 .. base + 48])[0];
        const checksumComplement = (cast(const ushort[])data[base + 44 .. base + 46])[0];
        if ((checksum ^ checksumComplement) == 0xFFFF) {
            if (cast(const(char[]))data[base + 16 .. base + 37] == identifier) {
                return Result(headered, true);
            }
        }
    }
    return Result(false, false);
}

bool imguiAteKeyboard() {
	const io = &ImGui.GetIO();
	return io.WantCaptureKeyboard;
}
