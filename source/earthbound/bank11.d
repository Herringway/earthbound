/// Sprite bank 1
module earthbound.bank11;

import earthbound.commondefs;

immutable ubyte[][] sprites = loadSpriteData();

immutable(ubyte[])[] loadSpriteData() {
	import std.format : format;
	immutable(ubyte[])[] result;
	static foreach (i; 0 .. 1146) {
		result ~= cast(immutable(ubyte)[])import(format!"overworld_sprites/%04s.gfx"(i));
	}
	return result;
}
