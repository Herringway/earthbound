module audio;

import std.conv;
import std.experimental.logger;
import std.file;
import std.path;
import std.string;

import nspc;
import bindbc.sdl;
import bindbc.sdl.mixer;

import misc;

bool initAudio(ubyte channels, uint sampleRate) {
	if(loadSDLMixer() < sdlMixerSupport) {
		info("Can't load SDL_Mixer!");
		return false;
	}
	if (Mix_OpenAudio(sampleRate, SDL_AudioFormat.AUDIO_S16, channels, 4096) == -1) {
		return false;
	}
	Mix_HookMusic(&nspcFillBuffer, &nspcplayer);
	int finalSampleRate;
	int finalChannels;
	ushort finalFormat;
	Mix_QuerySpec(&finalSampleRate, &finalFormat, &finalChannels);

	nspcplayer.initialize(finalSampleRate);
	return true;
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

private Mix_Chunk*[uint] loadedSFX;
private ubyte[][uint] loadedSongs;
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
	foreach (sfxFile; getDataFiles("sfx", "*.wav")) {
		try {
			const id = sfxFile.baseName.stripExtension.to!uint;
			loadedSFX[id] = Mix_LoadWAV(sfxFile.toStringz);
		} catch (Exception e) {
			errorf("Could not load %s: %s", sfxFile, e.msg);
		}
	}
	foreach (songFile; getDataFiles("songs", "*.nspc")) {
		try {
			const id = songFile.baseName.stripExtension.to!uint;
			loadedSongs[id] = cast(ubyte[])read(songFile);
		} catch (Exception e) {
			errorf("Could not load %s: %s", songFile, e.msg);
		}
	}
}
