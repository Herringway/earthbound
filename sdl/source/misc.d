module misc;

import std.experimental.logger;
import std.string;

import bindbc.sdl;

void SDLError(string fmt) {
	errorf(fmt, SDL_GetError().fromStringz);
}
