module snesdrawframedata;

import earthbound.hardware;

public struct HDMAWrite {
	ushort vcounter;
	byte addr;
	byte value;
}

public struct SnesDrawFrameData {
align:
	ubyte INIDISP;
	ubyte OBSEL;
	ushort OAMADDR;
	ubyte BGMODE;
	ubyte MOSAIC;
	ubyte BG1SC;
	ubyte BG2SC;
	ubyte BG3SC;
	ubyte BG4SC;
	ubyte BG12NBA;
	ubyte BG34NBA;
	ushort BG1HOFS;
	ushort BG1VOFS;
	ushort BG2HOFS;
	ushort BG2VOFS;
	ushort BG3HOFS;
	ushort BG3VOFS;
	ushort BG4HOFS;
	ushort BG4VOFS;
	ubyte M7SEL;
	ushort M7A;
	ushort M7B;
	ushort M7C;
	ushort M7D;
	ushort M7X;
	ushort M7Y;
	ubyte W12SEL;
	ubyte W34SEL;
	ubyte WOBJSEL;
	ubyte WH0;
	ubyte WH1;
	ubyte WH2;
	ubyte WH3;
	ubyte WBGLOG;
	ubyte WOBJLOG;
	ubyte TM;
	ubyte TS;
	ubyte TMW;
	ubyte TSW;
	ubyte CGWSEL;
	ubyte CGADSUB;
	ubyte FIXED_COLOR_DATA_R;
	ubyte FIXED_COLOR_DATA_G;
	ubyte FIXED_COLOR_DATA_B;
	ubyte SETINI;

	ushort[0x8000] vram;
	ushort[0x100] cgram;
	OAMEntry[128] oam1;
	ubyte[32] oam2;

	ushort numHdmaWrites;
	HDMAWrite[4*8*240] hdmaData;
	void toString(T)(T sink) const {
		import std.format : formattedWrite;
		import std.range : chunks, enumerate, put;
		static immutable sprite1Widths = [8, 8, 8, 16, 16, 32, 16, 16];
		static immutable sprite1Heights = [8, 8, 8, 16, 16, 32, 32, 32];
		static immutable sprite2Widths = [16, 32, 64, 32, 64, 64, 32, 32];
		static immutable sprite2Heights = [16, 32, 64, 32, 64, 64, 64, 32];
		sink.formattedWrite!"Display: Mode %s, screen %s (brightness: %s)\n"(BGMODE & 0b00000111, INIDISP & 0b10000000 ? "Enabled" : "Disabled", INIDISP & 0b00001111);
		sink.formattedWrite!"BG1 - Tilemap: $%04X, Tiles: $%04X, Tile size: %s\n"((BG1SC & 0b11111100) << 9, (BG12NBA & 0b00001111) << 13, !!(BGMODE & 0b10000000) ? "8x8" : "16x16");
		sink.formattedWrite!"BG2 - Tilemap: $%04X, Tiles: $%04X, Tile size: %s\n"((BG2SC & 0b11111100) << 9, (BG12NBA & 0b11110000) << 9, !!(BGMODE & 0b01000000) ? "8x8" : "16x16");
		sink.formattedWrite!"BG3 - Tilemap: $%04X, Tiles: $%04X, Tile size: %s\n"((BG3SC & 0b11111100) << 9, (BG34NBA & 0b00001111) << 13, !!(BGMODE & 0b00100000) ? "8x8" : "16x16");
		sink.formattedWrite!"BG4 - Tilemap: $%04X, Tiles: $%04X, Tile size: %s\n"((BG4SC & 0b11111100) << 9, (BG34NBA & 0b11110000) << 9, !!(BGMODE & 0b00010000) ? "8x8" : "16x16");
		sink.formattedWrite!"OAM: $%04X (name %s), table: $%04X (priority: %s), Sprite sizes: %sx%s, %sx%s\n"(
			(OBSEL & 0b00000111) << 14,
			(OBSEL & 0b00011000) >> 3,
			OAMADDR & 0b0000000111111111,
			!!(OAMADDR & 0b1000000000000000),
			sprite1Widths[(OBSEL & 0b11100000) >> 5],
			sprite1Heights[(OBSEL & 0b11100000) >> 5],
			sprite2Widths[(OBSEL & 0b11100000) >> 5],
			sprite2Heights[(OBSEL & 0b11100000) >> 5]
		);
		sink.formattedWrite!"OAM Table: \n"();
		foreach (id, entry; oam1) {
			if (entry.yCoord >= 0) {
				sink.formattedWrite!"\t% d: %s (%d, %d) palette: %s, flip vertical: %s, flip horizontal: %s, priority: %s\n"(id, entry.startingTile, entry.xCoord, entry.yCoord, entry.palette, entry.flipVertical, entry.flipHorizontal, entry.priority);
			}
		}
		foreach (idx, palette; cgram[].chunks(16).enumerate) {
			if (idx >= 8) {
				sink.formattedWrite!"Sprite palette %s "(idx - 8);
			} else {
				sink.formattedWrite!"BG palette %s "(idx);
			}
			foreach (colour; palette) {
				ubyte red = cast(ubyte)(((colour >> 0) & 0x1F) * 8);
				ubyte green = cast(ubyte)(((colour >> 5) & 0x1F) * 8);
				ubyte blue = cast(ubyte)(((colour >> 10) & 0x1F) * 8);
				sink.formattedWrite("\x1B[38;2;%d;%d;%dm█\x1B[0m", red, green, blue);
			}
			put(sink, "\n");
		}
	}
}

public __gshared SnesDrawFrameData g_frameData;

void copyGlobalsToFrameData() {
	g_frameData.INIDISP = INIDISP;
	g_frameData.OBSEL = OBSEL;
	g_frameData.OAMADDR = OAMADDL | OAMADDH << 8;
	g_frameData.BGMODE = BGMODE;
	g_frameData.MOSAIC = MOSAIC;
	g_frameData.BG1SC = BG1SC;
	g_frameData.BG2SC = BG2SC;
	g_frameData.BG3SC = BG3SC;
	g_frameData.BG4SC = BG4SC;
	g_frameData.BG12NBA = BG12NBA;
	g_frameData.BG34NBA = BG34NBA;
	g_frameData.BG1HOFS = BG1HOFS;
	g_frameData.BG1VOFS = BG1VOFS;
	g_frameData.BG2HOFS = BG2HOFS;
	g_frameData.BG2VOFS = BG2VOFS;
	g_frameData.BG3HOFS = BG3HOFS;
	g_frameData.BG3VOFS = BG3VOFS;
	g_frameData.BG4HOFS = BG4HOFS;
	g_frameData.BG4VOFS = BG4VOFS;
	g_frameData.M7SEL = M7SEL;
	g_frameData.M7A = M7A;
	g_frameData.M7B = M7B;
	g_frameData.M7C = M7C;
	g_frameData.M7D = M7D;
	g_frameData.M7X = M7X;
	g_frameData.M7Y = M7Y;
	g_frameData.W12SEL = W12SEL;
	g_frameData.W34SEL = W34SEL;
	g_frameData.WOBJSEL = WOBJSEL;
	g_frameData.WH0 = WH0;
	g_frameData.WH1 = WH1;
	g_frameData.WH2 = WH2;
	g_frameData.WH3 = WH3;
	g_frameData.WBGLOG = WBGLOG;
	g_frameData.WOBJLOG = WOBJLOG;
	g_frameData.TM = TM;
	g_frameData.TS = TD;
	g_frameData.TMW = TMW;
	g_frameData.TSW = TSW;
	g_frameData.CGWSEL = CGWSEL;
	g_frameData.CGADSUB = CGADSUB;
	g_frameData.SETINI = SETINI;
}
