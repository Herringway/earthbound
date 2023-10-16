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

	spc.snes_spc.initialize();
	spc.filter = SPC_Filter();
	infof("SDL audio subsystem initialized (%s)", SDL_GetCurrentAudioDriver().fromStringz);
}

void setAudioChannels(ushort count) {
	info("Setting audio channels not yet implemented");
}

void doMusicEffect(short id) {
	// see playSFX for explanation
	static ubyte mask;
	spc.snes_spc.write_port_now(1, id ^ mask);
	mask ^= 0x80;
}

void setStatic(short count) {
	// could do the same thing as playSFX, but not needed
	spc.snes_spc.write_port_now(2, count);
}

void uninitializeAudio() {} //nothing to do here

void stopMusic() {
	spc.snes_spc.write_port_now(0, 0);
}

void playMusic(ushort track) {
	spc.initialized = false;
	spc.snes_spc.load_buffer(loadedSongs[track], 0x500);
	spc.snes_spc.clear_echo();
	spc.filter.clear();
	spc.snes_spc.write_port_now(1, 0xFF);
	while (true) {
		spc.snes_spc.skip(2);
		if (spc.snes_spc.read_port_now(1) == 0) {
			spc.snes_spc.write_port_now(0, track);
			break;
		}
	}
	spc.initialized = true;
}

void playSFX(ubyte id) {
	// the audio program detects a new sound effect when the id is different
	// the MSB is ignored, so we can simply flip the MSB bit every other time to play the same effect twice
	static ubyte mask;
	spc.snes_spc.write_port_now(3, id ^ mask);
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
		// Play into buffer
		spc.snes_spc.play(buffer);

		// Filter samples
		spc.filter.run(buffer);
	} catch (Throwable t) {
		assumeWontThrow(writeDebugDump(t.msg, t.info));
		exit(1);
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
