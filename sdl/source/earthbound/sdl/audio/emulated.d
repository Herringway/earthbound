module earthbound.sdl.audio.emulated;

import core.stdc.stdlib : exit;

import std.conv;
import std.exception;
import std.logger;
import std.file;
import std.path;
import std.string;

import nspcplay;
import spc700;
import bindbc.sdl;
import sdl_mixer;

import earthbound.commondefs;

import earthbound.assets;
import earthbound.sdl.debugging;
import earthbound.sdl.misc;

struct AllSPC {
	SNES_SPC snes_spc;
	SPC_Filter filter;
	bool initialized;
	void initialize() {
		snes_spc.initialize();
		filter = SPC_Filter();
	}
	void waitUntilReady() {
		writePort(1, 0xFF);
		while (true) {
			snes_spc.skip(2);
			if (readPort(1) == 0) {
				return;
			}
		}
	}
	void playSong(ubyte[] buffer, ubyte track) {
		initialized = false;
		snes_spc.load_buffer(buffer, 0x500);
		snes_spc.clear_echo();
		filter.clear();
		waitUntilReady();
		writePort(0, track);
		initialized = true;
	}
	void writePort(uint id, ubyte value) {
		snes_spc.write_port_now(id, value);
	}
	ubyte readPort(uint id) {
		return cast(ubyte)snes_spc.read_port_now(id);
	}
	void fillBuffer(short[] buffer) {
		// Play into buffer
		snes_spc.play(buffer);

		// Filter samples
		filter.run(buffer);
	}
}

__gshared AllSPC spc;

void initAudio(ubyte channels, uint sampleRate) {
	enforceSDL(SDL_Init(SDL_INIT_AUDIO) == 0, "Error initializing SDL Audio");
	SDL_AudioSpec want, have;
	want.freq = 32000;
	want.format = AUDIO_S16;
	want.channels = channels;
	want.samples = 512;
	want.callback = &spc700FillBuffer;
	want.userdata = &spc;
	const dev = SDL_OpenAudioDevice(null, 0, &want, &have, 0);
	enforceSDL(dev != 0, "Error opening audio device");
	SDL_PauseAudioDevice(dev, 0);

	spc.initialize();
	infof("SDL audio subsystem initialized (%s)", SDL_GetCurrentAudioDriver().fromStringz);
}

void setAudioChannels(ushort count) {
	info("Setting audio channels not yet implemented");
}

void doMusicEffect(short id) {
	// see playSFX for explanation
	static ubyte mask;
	spc.writePort(1, cast(ubyte)(id ^ mask));
	mask ^= 0x80;
}

void setStatic(short count) {
	// could do the same thing as playSFX, but not needed
	spc.writePort(2, cast(ubyte)count);
}

void uninitializeAudio() {} //nothing to do here

void stopMusic() {
	spc.writePort(0, 0);
}

void playMusic(ushort track) {
	spc.playSong(loadedSongs[track], cast(ubyte)track);
}

void playSFX(ubyte id) {
	// the audio program detects a new sound effect when the id is different
	// the MSB is ignored, so we can simply flip the MSB bit every other time to play the same effect twice
	static ubyte mask;
	spc.writePort(3, cast(ubyte)(id ^ mask));
	mask ^= 0x80;
}

private ubyte[65536][size_t] loadedSongs;

extern (C) void spc700FillBuffer(void* user, ubyte* buf, int bufSize) nothrow {
	auto spc = cast(AllSPC*)user;
	auto buffer = cast(short[])(buf[0 .. bufSize]);
	if (!spc.initialized) {
		return;
	}
	try {
		spc.fillBuffer(buffer);
	} catch (Throwable t) {
		writeDebugDumpOtherThread(t.msg, t.info);
	}
}

void loadSong(size_t index, const ubyte[] data) {
	try {
		loadedSongs[index] = loadNSPCBuffer(data);
		debug(loading) tracef("Loaded song %02X", index);
	} catch (Exception e) {
		errorf("Could not load %s: %s", index, e.msg);
	}
}

ubyte[65536] loadNSPCBuffer(scope const ubyte[] file) @safe {
	import std.bitmanip : read;
	ubyte[65536] buffer;
	const remaining = loadAllSubpacks(buffer[], file[NSPCFileHeader.sizeof .. $]);
	return buffer;
}
