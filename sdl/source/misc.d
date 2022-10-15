module misc;

import std.algorithm;
import std.file;
import std.experimental.logger;
import std.path;
import std.range;
import std.string;

import bindbc.sdl;

void SDLError(string fmt) {
	errorf(fmt, SDL_GetError().fromStringz);
}

auto getDataFiles(string type, string pattern) {
	static struct Result {
		DirIterator iterator;
		bool pathExists;
		void popFront() {
			iterator.popFront();
		}
		auto front() {
			return iterator.front;
		}
		bool empty() {
			return !pathExists || iterator.empty;
		}
	}
	const path = buildPath("data", type);
	bool filterFunc(string name) {
		return globMatch(baseName(name), pattern);
	}
	return Result(path.exists ? dirEntries(path, SpanMode.depth) : DirIterator.init, path.exists).map!(x => x.name).filter!filterFunc;
}
