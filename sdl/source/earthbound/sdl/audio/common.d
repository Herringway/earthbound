module earthbound.sdl.audio.common;

import std.logger;

import earthbound.sdl.audio.emulated;
import earthbound.sdl.audio.nspcplay;

enum AudioMode {
	nspcplay,
	emulated,
}

void function(ubyte) playSFXFunction;
void function(ushort) playMusicExternalFunction;
void function() stopMusicExternalFunction;
void function(ushort) setAudioChannelsFunction;
void function(short) doMusicEffectFunction;
void function(short) setStaticFunction;

struct AudioSettings {
	uint sampleRate = 44100;
	ubyte channels = 2;
	AudioMode mode = AudioMode.nspcplay;
}

AudioMode mode;

void initAudio(AudioSettings settings) {
	mode = settings.mode;
	final switch (settings.mode) {
		case AudioMode.emulated:
			earthbound.sdl.audio.emulated.initAudio(settings.channels, settings.sampleRate);
			playSFXFunction = &earthbound.sdl.audio.emulated.playSFX;
			playMusicExternalFunction = &earthbound.sdl.audio.emulated.playMusic;
			stopMusicExternalFunction = &earthbound.sdl.audio.emulated.stopMusic;
			setAudioChannelsFunction = &earthbound.sdl.audio.emulated.setAudioChannels;
			doMusicEffectFunction = &earthbound.sdl.audio.emulated.doMusicEffect;
			setStaticFunction = &earthbound.sdl.audio.emulated.setStatic;
			info("Loaded audio system: snes_spc");
			break;
		case AudioMode.nspcplay:
			earthbound.sdl.audio.nspcplay.initAudio(settings.channels, settings.sampleRate);
			playSFXFunction = &earthbound.sdl.audio.nspcplay.playSFX;
			playMusicExternalFunction = &earthbound.sdl.audio.nspcplay.playMusic;
			stopMusicExternalFunction = &earthbound.sdl.audio.nspcplay.stopMusic;
			setAudioChannelsFunction = &earthbound.sdl.audio.nspcplay.setAudioChannels;
			doMusicEffectFunction = &earthbound.sdl.audio.nspcplay.doMusicEffect;
			setStaticFunction = &earthbound.sdl.audio.nspcplay.setStatic;
			info("Loaded audio system: nspcplay");
			break;
	}
}

void uninitializeAudio() {
	final switch (mode) {
		case AudioMode.emulated:
			earthbound.sdl.audio.emulated.uninitializeAudio();
			break;
		case AudioMode.nspcplay:
			earthbound.sdl.audio.nspcplay.uninitializeAudio();
			break;
	}
}

void loadAudioData() {
	final switch (mode) {
		case AudioMode.emulated:
			earthbound.sdl.audio.emulated.loadAudioData();
			break;
		case AudioMode.nspcplay:
			earthbound.sdl.audio.nspcplay.loadAudioData();
			break;
	}
}
