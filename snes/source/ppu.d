module ppu;

import registers;

void writeShortToRegister(ubyte* dest, ushort value) {
	*dest = value & 0xFF;
	*dest = value >> 8;
}

void setFixedColourData(ubyte val) {
	*COLDATA = val;
}

void setBGOffsetX(ubyte layer, ushort x) {
	switch (layer) {
		case 1:
			writeShortToRegister(BG1HOFS, x);
			break;
		case 2:
			writeShortToRegister(BG2HOFS, x);
			break;
		case 3:
			writeShortToRegister(BG3HOFS, x);
			break;
		case 4:
			writeShortToRegister(BG4HOFS, x);
			break;
		default: assert(0);
	}
}

void setBGOffsetY(ubyte layer, ushort y) {
	switch (layer) {
		case 1:
			writeShortToRegister(BG1VOFS, y);
			break;
		case 2:
			writeShortToRegister(BG2VOFS, y);
			break;
		case 3:
			writeShortToRegister(BG3VOFS, y);
			break;
		case 4:
			writeShortToRegister(BG4VOFS, y);
			break;
		default: assert(0);
	}
}
