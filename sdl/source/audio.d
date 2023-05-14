module audio;

import std.conv;
import std.experimental.logger;
import std.file;
import std.path;
import std.string;

import nspcplay;
import bindbc.sdl;
import bindbc.sdl.mixer;

import earthbound.commondefs;

import misc;
version(Windows) {
	enum libName = "SDL2_mixer.dll";
} else version (OSX) {
	enum libName = "libSDL2_mixer.dylib";
} else version (Posix) {
	enum libName = "libSDL2_mixer.so";
}

immutable bool[Sfx.max + 1] altChannel = [
	Sfx.onettTrumpetSolo: true,
	Sfx.praying: true,
	Sfx.psiUsed: true,
	Sfx.damageTaken: true,
	Sfx.smaaaash: true,
	Sfx.allyFell: true,
	Sfx.recoverHP: true,
	Sfx.recoverStatus: true,
	Sfx.shield: true,
	Sfx.psiShield: true,
	Sfx.statIncrease: true,
	Sfx.statDecrease: true,
	Sfx.psiHypnosis: true,
	Sfx.psiMagnet: true,
	Sfx.psiParalysis: true,
	Sfx.psiBrainshock: true,
	Sfx.psiRockin1: true,
	Sfx.psiRockin2: true,
	Sfx.psiRockin3: true,
	Sfx.psiFire: true,
	Sfx.counterPSI: true,
	Sfx.enemyPSIUsed: true,
	Sfx.psiFreeze1: true,
	Sfx.psiFreeze2: true,
	Sfx.psiFreezeFinish: true,
	Sfx.hpSucker: true,
	Sfx.psiStarstorm: true,
	Sfx.psiFlash2: true,
	Sfx.psiFlash3: true,
	Sfx.reflectDamage: true,
	Sfx.devilMachineOff: true,
	Sfx.psiDefenseDown: true,
	Sfx.beam: true,
	Sfx.unknown4E: true,
	Sfx.psiParalysisO: true,
	Sfx.psiBrainshockO: true,
	Sfx.spores: true,
	Sfx.afflicted: true,
	Sfx.ouch: true,
	Sfx.unknown56: true,
	Sfx.unknown57: true,
	Sfx.refilled: true,
	Sfx.defensesDestroyed: true,
	Sfx.psiReflected: true,
	Sfx.unknown5E: true,
	Sfx.magicButterfly: true,
	Sfx.ghost: true,
	Sfx.unknown62: true,
	Sfx.shieldKiller: true,
	Sfx.mysteriousTransport: true,
	Sfx.congrats: true,
	Sfx.learnedPSI: true,
	Sfx.pyramid1: true,
	Sfx.pyramid2: true,
	Sfx.pyramid3: true,
	Sfx.pyramid4: true,
	Sfx.pyramid5: true,
	Sfx.pyramidOpened: true,
	Sfx.rapidKnocking: true,
	Sfx.mysterious: true,
	Sfx.mysterious2: true,
	Sfx.itemSold: true,
	Sfx.unknown79: true,
	Sfx.textInput: true,
	Sfx.unknown7B: true,
	Sfx.unknown7C: true,
	Sfx.unknown7D: true,
	Sfx.unknown7E: true,
];

void initAudio(ubyte channels, uint sampleRate) {
    enforceSDLLoaded!("SDL_Mixer", Mix_Linked_Version, libName)(loadSDLMixer());
	enforceSDL(Mix_OpenAudio(sampleRate, SDL_AudioFormat.AUDIO_S16, channels, 4096) != -1, "Could not open audio");
	Mix_HookMusic(&nspcFillBuffer, &nspcplayer);
	int finalSampleRate;
	int finalChannels;
	ushort finalFormat;
	Mix_QuerySpec(&finalSampleRate, &finalFormat, &finalChannels);

	nspcplayer = NSPCPlayer(finalSampleRate);
	infof("SDL audio subsystem initialized (%s)", SDL_GetCurrentAudioDriver().fromStringz);
}

void setAudioChannels(ushort count) {
	info("Setting audio channels not yet implemented");
}

void doMusicEffect(short id) {
	static bool shouldRestoreVolume;
	static bool[8] shouldRestoreChannelVolume;
	static bool shouldRestoreTempo;
	switch (id) {
		case 0:
		case 1:
			if (shouldRestoreVolume) {
				nspcplayer.restoreVolume();
				shouldRestoreVolume = false;
			}
			foreach (idx, ref shouldRestore; shouldRestoreChannelVolume) {
				if (shouldRestore) {
					nspcplayer.restoreChannelVolume(cast(ubyte)idx);
					shouldRestore = false;
				}
			}
			if (shouldRestoreTempo) {
				nspcplayer.restoreTempo();
				shouldRestoreTempo = false;
			}
			nspcplayer.transpose(0);
			break;
		case 2:
			nspcplayer.fade(24, 16);
			shouldRestoreVolume = true;
			break;
		case 3:
			nspcplayer.fade(112, 16);
			shouldRestoreVolume = true;
			break;
		case 4: //no-ops
		case 6:
		case 17:
		case 18:
		case 19:
		case 20:
			break;
		case 5:
			nspcplayer.transpose(14);
			const savedTempo = nspcplayer.tempo;
			nspcplayer.tempo = 200;
			nspcplayer.addTimer(112, (player) {
				player.transpose(0);
				player.restoreTempo();
			});
			break;
		case 7:
			nspcplayer.addTimer(40, (player) {
				player.volume = 160;
			});
			shouldRestoreVolume = true;
			break;
		case 8:
			nspcplayer.addTimer(105, (player) {
				player.volume = 240;
			});
			shouldRestoreVolume = true;
			break;
		case 9:
		case 10:
		case 11:
		case 12:
		case 13:
		case 14:
		case 15:
		case 16:
			static immutable ubyte[5][8] presets = [
				[0, 0, 0, 0, 0],
				[0, 0, 0, 0, 0],
				[0, 0, 0, 0, 120],
				[100, 0, 0, 0, 120],
				[100, 100, 0, 0, 120],
				[100, 100, 0, 0, 120],
				[100, 100, 100, 0, 120],
				[100, 100, 100, 120, 120],
			];
			const selected = presets[id - 9];
			shouldRestoreChannelVolume[0] = true;
			shouldRestoreChannelVolume[1] = true;
			shouldRestoreChannelVolume[2] = true;
			shouldRestoreChannelVolume[3] = true;
			shouldRestoreChannelVolume[4] = true;
			nspcplayer.setChannelVolume(0, selected[0]);
			nspcplayer.setChannelVolume(1, selected[1]);
			nspcplayer.setChannelVolume(2, selected[2]);
			nspcplayer.setChannelVolume(3, selected[3]);
			nspcplayer.setChannelVolume(4, selected[4]);
			break;
		case 21:
			nspcplayer.transpose(16);
			break;
		case 22:
			nspcplayer.transpose(0);
			break;
		case 23:
			shouldRestoreVolume = true;
			nspcplayer.volume = 100;
			break;
		case 24:
			shouldRestoreVolume = true;
			nspcplayer.volume = 240;
			break;
		case 25:
			shouldRestoreChannelVolume[7] = true;
			nspcplayer.setChannelVolume(7, 250);
			break;
		case 26:
			shouldRestoreChannelVolume[7] = true;
			nspcplayer.setChannelVolume(7, 0);
			break;
		case 27:
			shouldRestoreChannelVolume[7] = true;
			nspcplayer.setChannelVolume(7, 90);
			break;
		case 28:
			shouldRestoreChannelVolume[7] = true;
			nspcplayer.setChannelVolume(7, 40);
			break;
		default:
			infof("Music effect %02X not yet implemented", id);
			break;
	}
}

void setStatic(short count) {
	info("Static not yet implemented");
}

void uninitializeAudio() {
	Mix_CloseAudio();
}

void stopMusic() {
	nspcplayer.stop();
}

void playMusic(ushort track) {
	nspcplayer.stop();
	if (auto trackData = track in loadedSongs) {
		nspcplayer.loadSong(*trackData);
		nspcplayer.initialize();
		nspcplayer.play();
	}
}

void playSFX(ubyte id) {
	const channel = altChannel[id];
	if (id == 0) {
		if(Mix_FadeOutChannel(0, 0) == -1) {
			SDLError("Could not fade out");
		}
	} else {
		if (auto sound = id in loadedSFX) {
			if(Mix_PlayChannel(channel, *sound, 0) == -1) {
				SDLError("Could not play sound effect");
			}
		} else {
			tracef("Sound effect %s not loaded, skipping playback", id);
		}
	}
}

private Mix_Chunk*[uint] loadedSFX;
private Song[uint] loadedSongs;
private __gshared NSPCPlayer nspcplayer;

extern (C) void nspcFillBuffer(void* user, ubyte* buf, int bufSize) nothrow {
	import std.exception : assumeWontThrow;
	try {
		(cast(NSPCPlayer*)user).fillBuffer(cast(short[2][])(buf[0 .. bufSize]));
	} catch (Error e) {
		assumeWontThrow(errorf("%s", e));
		throw e;
	}
}

void loadAudioData() {
	import std.parallelism : parallel;
	foreach (sfxFile; getDataFiles("sfx", "*.wav")) {
		try {
			const id = sfxFile.baseName.stripExtension.to!uint;
			loadedSFX[id] = Mix_LoadWAV(sfxFile.toStringz);
			debug(loading) tracef("Loaded sound effect %02X - %s", id, sfxFile);
		} catch (Exception e) {
			errorf("Could not load %s: %s", sfxFile, e.msg);
		}
	}
	tracef("Loaded SFX");
	foreach (songFile; parallel(getDataFiles("songs", "*.nspc"))) {
		try {
			const id = songFile.baseName.stripExtension.to!uint;
			loadedSongs[id] = loadNSPCFile(cast(ubyte[])read(songFile));
			debug(loading) tracef("Loaded song %02X - %s", id, songFile);
		} catch (Exception e) {
			errorf("Could not load %s: %s", songFile, e.msg);
		}
	}
	tracef("Loaded songs");
}
