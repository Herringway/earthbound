module earthbound.bank2F;

import earthbound.bank00;
import earthbound.bank04;
import earthbound.globals;
import earthbound.commondefs;

import std;

immutable ubyte[2048] t = cartesianProduct(iota(8), iota(256)).map!(x => cast(ubyte)(((x[1] ^ 255) >> x[0]) ^ 255)).array;
immutable ubyte[2048] t2 = cartesianProduct(iota(8), iota(256)).map!(x => cast(ubyte)(((x[1] ^ 255) << x[0]) ^ 255)).array;

// $EF0115 - Clear the focused window and do something unknown?
void UnknownEF0115(short arg1) {
	ushort* x10 = WindowStats[WindowTable[arg1]].tilemapBuffer;
	ushort x0E = cast(ushort)(WindowStats[WindowTable[arg1]].height * WindowStats[WindowTable[arg1]].width);
	while (x0E != 0) {
		if (*x10 != 0) {
			UnknownC44E4D(*x10);
		}
		*x10 = 0x0040;
		x10++;
		x0E--;
	}
	Unknown7E9623 = 1;
	UnknownC07C5B();
}

__gshared SpriteGrouping*[463] SpriteGroupingPointers;
