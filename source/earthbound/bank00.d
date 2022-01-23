/// low level stuff, actionscript, overworld code
module earthbound.bank00;

import earthbound.commondefs;
import earthbound.globals;
import earthbound.hardware;
import earthbound.actionscripts;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.bank05;
import earthbound.bank06;
import earthbound.bank07;
import earthbound.bank0F;
import earthbound.bank10;
import earthbound.bank15;
import earthbound.bank17;
import earthbound.bank1C;
import earthbound.bank1F;
import earthbound.bank20;
import earthbound.bank21;
import earthbound.bank2F;
import core.stdc.string;
import core.bitop;
import core.thread : Fiber;
import std.experimental.logger;
import std.format;
import sfcdma;

/// $C00000
short* ClearEntityDrawSortingTable() {
	EntityDrawSorting[] = 0;
	return EntityDrawSorting.ptr;
}

/// $C00013
void OverworldSetupVRAM() {
	UnknownC08D79(9);
	SetBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0);
	SetBG2VRAMLocation(BGTileMapSize.horizontal, 0x5800, 0x2000);
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	SetOAMSize(0x62);
}

/// $C0004B
void OverworldInitialize() {
	OverworldSetupVRAM();
	Unknown7F0000[0] = 0;
	CopyToVram(3, 0, 0, &Unknown7F0000[0]);
	Unknown7E4370 = -1;
	Unknown7E436E = -1;
}

/// $C00085
void LoadTilesetAnim() {
	LoadedAnimatedTileCount = 0;
	if (MapDataWeirdTileAnimationPointerTable[Unknown7E4372].count == 0) {
		return;
	}
	Decomp(&MapDataTileAnimationPointerTable[Unknown7E4372][0], &Unknown7EC000[0]);
	LoadedAnimatedTileCount = MapDataWeirdTileAnimationPointerTable[Unknown7E4372].count;
	for (short i = 0; i < LoadedAnimatedTileCount; i++) {
		OverworldTilesetAnim[i].unknown0 = MapDataWeirdTileAnimationPointerTable[Unknown7E4372].animations[i].unknown0;
		OverworldTilesetAnim[i].framesUntilUpdate = MapDataWeirdTileAnimationPointerTable[Unknown7E4372].animations[i].frameDelay;
		OverworldTilesetAnim[i].frameDelay = MapDataWeirdTileAnimationPointerTable[Unknown7E4372].animations[i].frameDelay;
		OverworldTilesetAnim[i].copySize = MapDataWeirdTileAnimationPointerTable[Unknown7E4372].animations[i].copySize;
		OverworldTilesetAnim[i].sourceOffset = MapDataWeirdTileAnimationPointerTable[Unknown7E4372].animations[i].sourceOffset;
		OverworldTilesetAnim[i].sourceOffset2 = MapDataWeirdTileAnimationPointerTable[Unknown7E4372].animations[i].sourceOffset;
		OverworldTilesetAnim[i].destinationAddress = MapDataWeirdTileAnimationPointerTable[Unknown7E4372].animations[i].destinationAddress;
		OverworldTilesetAnim[i].destinationAddress2 = MapDataWeirdTileAnimationPointerTable[Unknown7E4372].animations[i].destinationAddress;
	}
}

/// $C00172
void AnimateTileset() {
	for (short i = 0; LoadedAnimatedTileCount > i; i++) {
		if (--OverworldTilesetAnim[i].framesUntilUpdate != 0) {
			continue;
		}
		OverworldTilesetAnim[i].framesUntilUpdate = OverworldTilesetAnim[i].frameDelay;
		if (OverworldTilesetAnim[i].destinationAddress2 == OverworldTilesetAnim[i].unknown0) {
			OverworldTilesetAnim[i].destinationAddress2 = 0;
			OverworldTilesetAnim[i].sourceOffset2 = OverworldTilesetAnim[i].sourceOffset;
		}
		CopyToVram(0, OverworldTilesetAnim[i].copySize, OverworldTilesetAnim[i].destinationAddress, &Unknown7EC000[OverworldTilesetAnim[i].sourceOffset2]);
		OverworldTilesetAnim[i].sourceOffset2 += OverworldTilesetAnim[i].copySize;
		OverworldTilesetAnim[i].destinationAddress2++;
	}
}

/// $C0023F
void LoadPaletteAnim() {
	Unknown7E4474 = 0;
	if (palettes[10][0] == 0) {
		return;
	}
	if (MapDataPaletteAnimationPointerTable[palettes[10][0] - 1].count == 0) {
		return;
	}
	Decomp(&MapDataPaletteAnimationPointerTable[palettes[10][0] - 1].ptr[0], &Unknown7EB800[0]);
	for (short i = 0; i < OverworldPaletteAnim.delays.length; i++) {
		OverworldPaletteAnim.delays[i] = 0;
	}
	for (short i = 0; i < MapDataPaletteAnimationPointerTable[palettes[10][0] - 1].count; i++) {
		OverworldPaletteAnim.delays[i] = MapDataPaletteAnimationPointerTable[palettes[10][0] - 1].entries[i];
	}
	OverworldPaletteAnim.timer = OverworldPaletteAnim.delays[0];
	Unknown7E4474 = 1;
	OverworldPaletteAnim.index = 1;
}

/// $C0030F
void AnimatePalette() {
	if (--OverworldPaletteAnim.timer != 0) {
		return;
	}
	if (OverworldPaletteAnim.delays[OverworldPaletteAnim.index] == 0) {
		OverworldPaletteAnim.index = 0;
	}
	OverworldPaletteAnim.timer = OverworldPaletteAnim.delays[OverworldPaletteAnim.index];
	UnknownC0A1F2(OverworldPaletteAnim.index);
	OverworldPaletteAnim.index++;
}

/// $C0035B
ushort UnknownC0035B(ushort a, ushort x, ushort y) {
	return Unknown7F0000[0x8000 + a * 32 + x * 2 + y * 8];
}

/// $C00391
void GetColorAverage(ushort* ptr) {
	ushort x04 = 0;
	ushort x16 = 0;
	ushort x14 = 0;
	ushort x12 = 0;
	ushort* x10 = ptr - 1;
	for (short i = 0; i < 96; i++) {
		ushort x18 = *++x10;
		if ((x18 & 0x7FFF) == 0) {
			continue;
		}
		x04 += x18 & BGR555Mask.Red;
		x14 += (x18 & BGR555Mask.Green) >> 5;
		x16 += (x18 & BGR555Mask.Blue) >> 10;
		x12++;
	}
	Unknown7E43D0 = cast(ushort)((x04 * 8) / x12);
	Unknown7E43D2 = cast(ushort)((x14 * 8) / x12);
	Unknown7E43D4 = cast(ushort)((x16 * 8) / x12);
}

/// $C00434
ushort UnknownC00434(ushort arg1, ushort arg2) {
	if (arg1 == arg2) {
		return arg2;
	} else if (arg1 > arg2) {
		if (arg1 - arg2 > 0) {
			return cast(ushort)(arg1 - 6);
		} else {
			return arg2;
		}
	} else if (arg2 - arg1 > 6) {
		return cast(ushort)(arg1 + 6);
	}
	return arg2;
}

/// $C00480
void UnknownC00480() {
	GetColorAverage(&palettes[2][0]);
	ushort x20 = cast(ushort)((Unknown7E43D0 / Unknown7E43D6) << 8);
	ushort x1E = cast(ushort)((Unknown7E43D2 / Unknown7E43D8) << 8);
	ushort x1C = cast(ushort)((Unknown7E43D4 / Unknown7E43DA) << 8);
	ushort x1A = (x20 + x1E + x1C) / 3;
	if ((x20 <= 0x100) && (x1E <= 0x100) && (x1C <= 0x100)) {
		for (short i = 0x80; i < 0x100; i++) {
			ushort x16, x14, x10, x02, x04, x0E;
			x16 = x14 = palettes[i / 16][i % 16] & BGR555Mask.Red;
			x02 = x10 = (palettes[i / 16][i % 16] & BGR555Mask.Green) >> 5;
			x04 = x0E = (palettes[i / 16][i % 16] & BGR555Mask.Blue) >> 10;
			if ((x16 == x02) && (x02 == x04) && (x04 == x16)) {
				x16 *= x1A;
				x02 *= x1A;
				x04 *= x1A;
			} else {
				x16 *= x20;
				x02 *= x1E;
				x04 *= x1C;
			}
			x14 = UnknownC00434(x14, (x16 >> 8) & 0x1F);
			x02 = UnknownC00434(x10, (x02 >> 8) & 0x1F);
			x0E = UnknownC00434(x0E, (x04 >> 8) & 0x1F);
			palettes[i / 16][i % 16] = cast(ushort)((x0E << 10) | (x02 << 5) | x14);
		}
	}
}

/// $C005E7
void UnknownC005E7() {
	memcpy(&palettes[2][0], &MapPalettePointerTable[1][0], 0xC0);
	GetColorAverage(&palettes[2][0]);
	Unknown7E43D6 = Unknown7E43D0;
	Unknown7E43D8 = Unknown7E43D2;
	Unknown7E43DA = Unknown7E43D4;
}

/// $C0062A
void LoadCollisionData(short tileset) {
	const(ubyte[4][4]*)* x0A = &MapDataTileCollisionPointerTable[tileset][0];
	const(ubyte[4][4])** x06 = &TileCollisionBuffer[0];
	for (short i = 0; i < 0x3C0; i++) {
		*(x06++) = *(x0A++);
	}
}

/// $C0067E
void Function14(short index1, short index2) {
	ushort* x0A = cast(ushort*)&Unknown7F0000[0x8000 + index1 * 32];
	ushort* x06 = cast(ushort*)&Unknown7F0000[0x8000 + index2 * 32];
	for (short i = 0; i < 16; i++) {
		*(x0A++) = *(x06++);
	}
	TileCollisionBuffer[index1] = TileCollisionBuffer[index2];
}

/// $C006F2
void UnknownC006F2(short arg1) {
	const(MapTileEvent)* x06 = &EventControlPointerTable[arg1][0];
	while (true) {
		if (x06.eventFlag == 0) {
			break;
		}
		short x0E = getEventFlag(x06.eventFlag & 0x7FFF);
		short y = x06.count;
		if (x0E == (x06.eventFlag >= EVENT_FLAG_UNSET) ? 1 : 0) {
			const(MapTilePair)* x06_2 = &x06.tiles[0];
			for (short i = y; i != 0; i--) {
				Function14(x06_2.tile1, x06_2.tile2);
				x06_2++;
			}
		} else {
			x06++;
		}
	}
}

/// $C00778
void LoadSpecialSpritePalette() {
	if (palettes[4][0] == 0) {
		return;
	}
	ushort* x10 = &palettes[palettes[4][0]][0];
	for (short i = 0x40; i < 0x50; i++) {
		palettes[8][i] = *(x10++);
	}
}

/// $C007B6
void LoadMapPalette(short arg1, short arg2) {
	const(ubyte)* x16 = &MapPalettePointerTable[arg1][arg2 * 192];
	if (Unknown7EB4EF == 0) {
		while (true) {
			memcpy(&palettes[2][0], x16, 0xC0);
			if (palettes[2][0] == 0) {
				break;
			}
			if (getEventFlag(palettes[2][0] & 0x7FFF) != (palettes[2][0] > EVENT_FLAG_UNSET) ? 1 : 0) {
				break;
			}
			//the original code used palettes[3][0] as a raw near pointer, which isn't possible on most platforms
			x16 = &paletteOffsetToPointer(palettes[3][0])[0];
		}
	} else {
		Decomp(&CompressedPaletteUnknown[0], &Unknown7F0000[0]);
		memcpy(&palettes[2][0], &Unknown7F0000[PhotographerConfigTable[CurPhotoDisplay].creditsMapPalettesOffset], 0xC0);
	}
}

/// $C008C3
void LoadMapAtSector(short x, short y) {
	if ((Unknown7E438A | Unknown7E438C) != 0) {
		x = Unknown7E438A / 32;
		y = Unknown7E438C / 16;
	}
	ubyte x1A = GlobalMapTilesetPaletteData[y][x];
	ubyte x18 = x1A & 7;
	ubyte x04 = x1A >> 3;
	Decomp(&MapDataTileArrangementPtrTable[TilesetTable[x04]][0], &Unknown7F0000[0x8000]);
	LoadCollisionData(TilesetTable[x04]);
	UnknownC006F2(TilesetTable[x04]);
	UnknownC005E7();
	memcpy(&palettes[8][0], &SpriteGroupPalettes[0], 0x100);
	if (x04 != Unknown7E436E) {
		Unknown7E4372 = TilesetTable[x04];
		Decomp(&MapDataTilesetPtrTable[TilesetTable[x04]][0], &Unknown7F0000[0]);
		while (Unknown7E0028.a != 0) { Fiber.yield(); }
		if (Unknown7EB4EF == 0) {
			CopyToVram2(0, 0x7000, 0, &Unknown7F0000[0]);
		} else {
			CopyToVram2(0, 0x4000, 0, &Unknown7F0000[0]);
		}
	}
	while (Unknown7E0028.a != 0) { Fiber.yield(); }
	LoadMapPalette(x04, x18);
	UnknownC00480();
	LoadSpecialSpritePalette();
	if (Unknown7EB4EF == 0) {
		LoadOverlaySprites();
		LoadTilesetAnim();
		LoadPaletteAnim();
	}
	if (Unknown7EB4EF == 0) {
		if (Debug != 0) {
			UnknownEFD9F3();
		} else {
			UnknownC47F87();
		}
		UnknownC0856B(0);
	}
	memcpy(&Unknown7E4476[0], &palettes[2][0], 0x1C0);
	if (Unknown7E4676 != 0) {
		UnknownC496F9();
		memset(&palettes[0][0], 0xFF, 0x200);
	}
	if (Unknown7EB4EF != 0) {
		UnknownC496F9();
		memset(&palettes[1][0], 0, 0x1E0);
	}
	UnknownC0856B(0x18);
	Unknown7E436E = x04;
	Unknown7E4370 = x18;
}

/// $C00AA1
short LoadSectorAttributes(ushort arg1, ushort arg2) {
	CurrentSectorAttributes = MapDataPerSectorAttributesTable[(arg2 &0xFF80) >> 7][arg1 >> 8];
	return CurrentSectorAttributes;
}

/// $C00AC5
void UnknownC00AC5(short x, short y) {
	y /= 4;
	short x16 = x / 4;
	x = x16 & 0xF;
	Unknown7E4390[x] = cast(byte)x16;
	Unknown7E43A0[y & 0xF] = cast(byte)y;
	ubyte x12 = GlobalMapTilesetPaletteData[y / 4][x16 / 8] / 8;
	ushort* x14 = cast(ushort*)&Unknown7EF000.Unknown7EF000[y & 0xF];
	if (y < 0x140) {
		short x10 = x;
		for (short i = 0; i < 16; i++) {
			if ((x16 & 8) == 0) {
				x12 = GlobalMapTilesetPaletteData[y / 4][x16 / 8] / 8;
			}
			if ((x16 < 0x100) && (Unknown7E436E == x12)) {
				x14[x10] = UnknownC0A156(x16, y);
			} else {
				x14[x10] = 0;
			}
			x10 = (x10 + 1) & 0xF;
			x16++;
		}
	}
	for (short i = 0; i < 16; i++) {
		x14[i] = 0;
	}
}

/// $C00BDC
void UnknownC00BDC(short x, short y) {
	x /= 4;
	y /= 4;
	short x18 = x & 0xF;
	Unknown7E43B0[x18] = cast(byte)x;
	short x16 = y & 0xF;
	Unknown7E43C0[x16] = cast(byte)y;
	short x14 = GlobalMapTilesetPaletteData[y / 4][x / 8] / 8;
	ushort* x12 = &Unknown7EF000.Unknown7EF000[x18][0];
	if (x < 0x100) {
		short x10 = cast(short)(x16 * 16);
		for (short i = 0; i < 16; i++) {
			if ((y & 3) == 0) {
				x14 = GlobalMapTilesetPaletteData[y / 4][x / 8] / 8;
			}
			if ((y < 0x140) && (Unknown7E436E == x14)) {
				x12[x10] = UnknownC0A156(x, y);
			} else {
				x12[x10] = 0;
			}
			x10 += 16;
			y++;
		}
	} else {
		for (short i = 0; i < 16; i++) {
			x12[i * 16] = 0;
		}
	}
}

/// $C00CF3
void LoadCollisionRow(short x, short y) {
	ushort* x02 = &Unknown7EF000.Unknown7EF000[(y / 4) & 0xF][0];
	ubyte* x10 = &Unknown7EE000[y & 0x3F][0];
	for (short i = 0; i < 16; i++) {
		const(ubyte[4][4])* x12 = TileCollisionBuffer[*x02];
		x02++;
		x10[0] = (*x12)[y & 3][0];
		x10[1] = (*x12)[y & 3][1];
		x10[2] = (*x12)[y & 3][2];
		x10[3] = (*x12)[y & 3][3];
		x10 += 4;
	}
}

/// $C00D7E
void LoadCollisionColumn(short x, short y) {
	ushort* x02 = &Unknown7EF000.Unknown7EF000[0][(x / 4) & 0xF];
	ubyte* x10 = &Unknown7EE000[0][x & 0x3F];
	for (short i = 0; i < 16; i++) {
		const(ubyte[4][4])* x12 = TileCollisionBuffer[*x02];
		x02 += 16;
		x10[0] = (*x12)[0][x & 3];
		x10[64] = (*x12)[1][x & 3];
		x10[128] = (*x12)[2][x & 3];
		x10[192] = (*x12)[3][x & 3];
		x10 += 256;
	}
}

/// $C00E16
void UnknownC00E16(short x, short y) {
	if (Debug != 0) {
		UnknownEFDFC4(x, y);
	}
	ushort* x1E = cast(ushort*)sbrk(0x100);
	ushort* x1C = &x1E[0x40];
	x--;
	ushort x18 = cast(ushort)((Unknown7EF000.Unknown7EF000[((y / 4) & 0xF)][(x / 4) & 0xF] * 16) + ((y & 3) * 4) + (x & 3));
	short x16 = x & 0x3F;
	for (short i = 0; i < 34; i++) {
		if ((x & 3) == 0) {
			x18 = cast(ushort)((Unknown7EF000.Unknown7EF000[((y / 4) & 0xF)][(x / 4) & 0xF] * 16) + ((y & 3) * 4));
		}
		ushort x12 = (cast(ushort*)&Unknown7F0000)[0x8000 + x18];
		x1E[x16] = x12;
		x18++;
		if ((x12 & 0x3FF) < 0x180) {
			x12 |= 0x2000;
		} else {
			x12 = 0;
		}
		x1C[x16] = x12;
		x16 = (x16 + 1) & 0x3F;
		x++;
	}
	CopyToVram(0, 0x3800 + ((y & 0x1F) * 32), 0x40, cast(ubyte*)&x1E[0]);
	CopyToVram(0, 0x3C00 + ((y & 0x1F) * 32), 0x40, cast(ubyte*)&x1E[0x20]);
	if (Unknown7EB4EF == 0) {
		CopyToVram(0, 0x5800 + ((y & 0x1F) * 32), 0x40, cast(ubyte*)&x1C[0]);
		CopyToVram(0, 0x5C00 + ((y & 0x1F) * 32), 0x40, cast(ubyte*)&x1C[0x20]);
	}
}

/// $C00FCB
void UnknownC00FCB(short x, short y) {
	if (Debug != 0) {
		UnknownEFE07C(x, y);
	}
	ushort* x1E = cast(ushort*)sbrk(0x80);
	ushort* x1C = &x1E[0x20];
	y--;
	ushort x18 = cast(ushort)((Unknown7EF000.Unknown7EF000[((y / 4) & 0xF)][(x / 4) & 0xF] * 16) + ((y & 3) * 4) + (x & 3));
	short x16 = y & 0x1F;
	for (short i = 0; i < 30; i++) {
		if ((y & 3) == 0) {
			x18 = cast(ushort)((Unknown7EF000.Unknown7EF000[((y / 4) & 0xF)][(x / 4) & 0xF] * 16) + (x & 3));
		}
		ushort x12 = (cast(ushort*)&Unknown7F0000)[0x8000 + x18];
		x1E[x16] = x12;
		if ((x12 & 0x3FF) < 0x180) {
			x12 |= 0x2000;
		} else {
			x12 = 0;
		}
		x1C[x16] = x12;
		x18 += 4;
		x16 = (x16 + 1) & 0x1F;
		y++;
	}
	if ((x & 0x3F) <= 0x1F) {
		CopyToVram(0x1B, 0x3800 + (x & 0x3F), 0x40, cast(ubyte*)x1E);
		CopyToVram(0x1B, 0x5800 + (x & 0x3F), 0x40, cast(ubyte*)x1C);
	} else {
		CopyToVram(0x1B, 0x3C00 + (x & 0x1F), 0x40, cast(ubyte*)x1E);
		CopyToVram(0x1B, 0x5C00 + (x & 0x1F), 0x40, cast(ubyte*)x1C);
	}
}

/// $C01181
void UnknownC01181(short arg1, short arg2) {
	ubyte* x12 = cast(ubyte*)sbrk(0x40);
	memset(x12, 0, 0x40);
	CopyToVram(0, 0x40, cast(ushort)(((arg2 & 0x1F) * 32) + 0x3800), x12);
	CopyToVram(0, 0x40, cast(ushort)(((arg2 & 0x1F) * 32) + 0x3C00), x12);
	CopyToVram(0, 0x40, cast(ushort)(((arg2 & 0x1F) * 32) + 0x5800), x12);
	CopyToVram(0, 0x40, cast(ushort)(((arg2 & 0x1F) * 32) + 0x5C00), x12);
}

/// $C0122A
void UnknownC0122A(short arg1, short arg2) {
	ubyte* x12 = cast(ubyte*)sbrk(0x40);
	memset(x12, 0, 0x40);
	arg1 &= 0x3F;
	if (arg1 <= 0x1F) {
		CopyToVram(0x1B, 0x40, cast(ushort)(arg1 + 0x3800), x12);
		CopyToVram(0x1B, 0x40, cast(ushort)(arg1 + 0x5800), x12);
	} else {
		CopyToVram(0x1B, 0x40, cast(ushort)((arg1 & 0x1F) + 0x3C00), x12);
		CopyToVram(0x1B, 0x40, cast(ushort)((arg1 & 0x1F) + 0x5C00), x12);
	}
}

/// $C012ED
void ReloadMapAtPosition(short x, short y) {
	Unknown7E4380 = x;
	Unknown7E437C = x;
	Unknown7E4382 = y;
	Unknown7E437E = y;
	short x14 = x / 8;
	short x02 = y / 8;
	Unknown7E4370 = -1;
	Unknown7E436E = -1;
	LoadMapAtSector(x14 / 32, x02 / 16);
	for (short i = 0; i < 16; i++) {
		Unknown7E43C0[i] = -1;
		Unknown7E43B0[i] = -1;
		Unknown7E43A0[i] = -1;
		Unknown7E4390[i] = -1;
	}
	for (short i = 0; i < 60; i++) {
		UnknownC00AC5(cast(short)(x14 - 32), cast(short)(x02 - 32 + i));
	}
	for (short i = 0; i < 60; i++) {
		LoadCollisionRow(cast(short)(x14 - 32), cast(short)(x02 - 32 + i));
	}
	for (short i = -1; i != 31; i++) {
		UnknownC00E16(cast(short)(x14 - 16), cast(short)(x02 - 14 + i));
	}
	while (Unknown7E0028.a != 0) { Fiber.yield(); }
	BG2_X_POS = cast(short)(Unknown7E4380 - 0x80);
	BG1_X_POS = cast(short)(Unknown7E4380 - 0x80);
	BG2_Y_POS = cast(short)(Unknown7E4382 - 0x70);
	BG1_Y_POS = cast(short)(Unknown7E4382 - 0x70);
	Unknown7E4374 = cast(short)(x14 - 16);
	Unknown7E4376 = cast(short)(x02 - 14);
}

/// $C013F6
void LoadMapAtPosition(short x, short y) {
	UnknownC02194();
	Unknown7E4380 = x;
	Unknown7E437C = x;
	Unknown7E4382 = y;
	Unknown7E437E = y;
	short x02 = x / 8;
	short x12 = y / 8;
	LoadMapAtSector(x02 / 32, x12 / 16);
	if (Unknown7EB4EF == 0) {
		OverworldSetupVRAM();
	}
	for (short i = 0; i < 16; i++) {
		Unknown7E43C0[i] = -1;
		Unknown7E43B0[i] = -1;
		Unknown7E43A0[i] = -1;
		Unknown7E4390[i] = -1;
	}
	for (short i = 0; i < 60; i++) {
		UnknownC00AC5(cast(short)(x02 - 32), cast(short)(x12 - 32 + i));
	}
	for (short i = 0; i < 60; i++) {
		LoadCollisionRow(cast(short)(x02 - 32), cast(short)(x12 - 32 + i));
	}
	while (Unknown7E0028.a != 0) { Fiber.yield(); }
	if (Unknown7EB4EF == 0) {
		TM_MIRROR = 0x17;
	}
	if (Unknown7E4A58 != 0) {
		Unknown7E4A58 = 1;
	}
	BG2_X_POS = cast(short)(Unknown7E4380 - 0x80);
	BG1_X_POS = cast(short)(Unknown7E4380 - 0x80);
	BG2_Y_POS = cast(short)(Unknown7E4382 - 0x70);
	BG1_Y_POS = cast(short)(Unknown7E4382 - 0x70);
	for (short i = -1; i != 31; i++) {
		UnknownC00E16(cast(short)(x02 - 16), cast(short)(x12 - 14 + i));
		UnknownC0255C(cast(short)(x02 - 16), cast(short)(x12 - 14 + i));
	}
	for (short i = -8; i != 40; i++) {
		SpawnHorizontal(cast(short)(x02 - 16), cast(short)(x12 + i));
	}
	if (Unknown7E4A58 != 0) {
		Unknown7E4A58 = -1;
	}
	Unknown7E4374 = cast(short)(x02 - 16);
	Unknown7E4376 = cast(short)(x12 - 14);
}

/// $C01558
void RefreshMapAtPosition(short x, short y) {
	BG2_X_POS = x;
	BG1_X_POS = x;
	BG2_Y_POS = y;
	BG1_Y_POS = y;
	ushort x04 = cast(short)(((x & 0x8000) != 0) ? ((x / 8) | 0xE000) : (x / 8));
	ushort x02 = cast(short)(((y & 0x8000) != 0) ? ((y / 8) | 0xE000) : (y / 8));
	while ((Unknown7E4374 - x04) != 0) {
		if (((Unknown7E4374 - x04) < 0) != 0) {
			Unknown7E4374++;
			UnknownC00BDC(cast(short)(Unknown7E4374 + 41), cast(short)(x02 - 16));
			LoadCollisionColumn(cast(short)(Unknown7E4374 + 41), cast(short)(x02 - 16));
			UnknownC00FCB(cast(short)(Unknown7E4374 + 32), x02);
			UnknownC025CF(cast(short)(Unknown7E4374 + 34), cast(short)(x02 - 1));
			SpawnVertical(cast(short)(Unknown7E4374 + 40), cast(short)(x02 - 8));
		} else {
			Unknown7E4374--;
			UnknownC00BDC(cast(short)(Unknown7E4374 - 16), cast(short)(x02 - 16));
			LoadCollisionColumn(cast(short)(Unknown7E4374 - 16), cast(short)(x02 - 16));
			UnknownC00FCB(cast(short)(Unknown7E4374 - 1), x02);
			UnknownC025CF(cast(short)(Unknown7E4374 - 3), cast(short)(x02 - 1));
			SpawnVertical(cast(short)(Unknown7E4374 - 8), cast(short)(x02 - 8));
		}
	}
	while ((Unknown7E4376 - x02) != 0) {
		if (((Unknown7E4376 - 0x02) < 0) != 0) {
			Unknown7E4376++;
			UnknownC00AC5(cast(short)(x04 - 16), cast(short)(Unknown7E4376 + 41));
			LoadCollisionRow(cast(short)(x04 - 16), cast(short)(Unknown7E4376 + 41));
			UnknownC00E16(x04, cast(short)(Unknown7E4376 + 28));
			UnknownC0255C(x04, cast(short)(Unknown7E4376 + 29));
			SpawnHorizontal(cast(short)(x04 - 8), cast(short)(Unknown7E4376 + 36));
		} else {
			Unknown7E4376--;
			UnknownC00AC5(cast(short)(x04 - 16), cast(short)(Unknown7E4376 - 16));
			LoadCollisionRow(cast(short)(x04 - 16), cast(short)(Unknown7E4376 - 16));
			UnknownC00E16(x04, cast(short)(Unknown7E4376 - 1));
			UnknownC0255C(x04, cast(short)(Unknown7E4376 - 1));
			SpawnHorizontal(cast(short)(x04 - 8), cast(short)(Unknown7E4376 - 8));
		}
	}
	Unknown7E4386 = x;
	Unknown7E4388 = y;
}

/// $C01731
void UnknownC01731(short x, short y) {
	BG2_X_POS = x;
	BG1_X_POS = x;
	BG2_Y_POS = y;
	BG1_Y_POS = y;
	short x0E = x / 8;
	short x02 = y / 8;
	while (Unknown7E4374 - x0E != 0) {
		if (Unknown7E4374 - x0E < 0) {
			Unknown7E4374++;
			UnknownC0122A(cast(short)(Unknown7E4374 + 0x20), x02);
		} else {
			Unknown7E4374--;
			UnknownC0122A(cast(short)(Unknown7E4374 - 1), x02);
		}
	}
	while (Unknown7E4376 - x02 != 0) {
		if (Unknown7E4376 - x02 < 0) {
			Unknown7E4376++;
			UnknownC01181(x0E, cast(short)(Unknown7E4376 + 0x1C));
		} else {
			Unknown7E4376--;
			UnknownC01181(x0E, cast(short)(Unknown7E4376 - 1));
		}
	}
	Unknown7E4386 = x;
	Unknown7E4388 = y;
}

/// $C018F3
void ReloadMap() {
	Unknown7E4370 = -1;
	Unknown7E436E = -1;
	Unknown7E4380 &= 0xFFF8;
	Unknown7E4382 &= 0xFFF8;
	UnknownC08726();
	Unknown7E5DD4 = -1;
	UnknownC068F4(gameState.leaderX.integer, gameState.leaderY.integer);
	UnknownC08D79(9);
	SetBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0);
	SetBG2VRAMLocation(BGTileMapSize.horizontal, 0x5800, 0x2000);
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	SetOAMSize(0x62);
	ReloadMapAtPosition(gameState.leaderX.integer, gameState.leaderY.integer);
	if (gameState.walkingStyle == WalkingStyle.Bicycle) {
		ChangeMusic(Music.Bicycle);
	} else {
		UnknownC069AF();
	}
	TM_MIRROR = 0x17;
	if (Debug != 0) {
		UnknownEFD9F3();
	}
	UnknownC08744();
}

/// $C019B2
void InitializeMap(short x, short y, short direction) {
	UnknownC068F4(x, y);
	LoadMapAtPosition(x, y);
	UnknownC03FA9(x, y, direction);
	UnknownC069AF();
}

/// $C019E2
void UnknownC019E2() {
	for (short i = 0; i < 16; i++) {
		Unknown7E43C0[i] = -1;
		Unknown7E43B0[i] = -1;
		Unknown7E43A0[i] = -1;
		Unknown7E4390[i] = -1;
	}
	short x04 = (BG1_X_POS - 0x80) /8;
	short x10 = (BG1_Y_POS - 0x80) /8;
	for (short i = 0; i < 60; i++) {
		UnknownC00AC5(x04, cast(short)(x10 + i));
	}
	for (short i = 0; i < 60; i++) {
		LoadCollisionRow(x04, cast(short)(x10 + i));
	}
}

/// $C01A63
void UnknownC01A63(short x, short y) {
	UnknownC00E16(x, y);
}

/// $C01A69
void InitializeMiscObjectData() {
	for (short i = 0; i < 0x1E; i++) {
		UNKNOWN_30X2_TABLE_35[i] = 0;
		EntityCollidedObjects[i] = 0xFFFF;
		EntityTPTEntries[i] = 0xFFFF;
	}
}

/// $C01A86
void UnknownC01A86() {
	ubyte* tmpPtr = cast(ubyte*)&SpriteTable7E467E[0];
	for (short i = 0; i < SpriteTable7E467E.sizeof; i++) {
		tmpPtr[i] = 0xFF;
	}
}

/// $C01A9D
short FindFree7E4682(ushort arg1) {
	arg1 /= 5; //convert offset to index
	short x10 = 0;
	Unknown7E4A6A = cast(short)(arg1 * 5);
	Unknown1:
	while (x10 < SpriteTable7E467E.length) {
		if (SpriteTable7E467E[x10].unknown4 == 0xFF) {
			goto Found;
		}
		x10++;
	}
	return -255;
	Found:
	if ((x10 + arg1) < SpriteTable7E467E.length) {
		for (short i = x10; i < x10 + arg1; i++) {
			if (SpriteTable7E467E[i].unknown4 == 0xFF) {
				continue;
			}
			x10 = cast(short)(i + 1);
			goto Unknown1;
		}
		return x10;
	}
	return -254;
}

/// $C01B15
void UnknownC01B15(const(SpriteMap)* arg1) {
	if (arg1 < &SpriteTable7E467E[0]) {
		return;
	}
	//??????????
	if (cast(const(ubyte)*)arg1 > cast(ubyte*)&SpriteTable7E467E.ptr[179] + 1) {
		return;
	}
	short x10 = cast(short)(arg1 - &SpriteTable7E467E[0]);
	short i = 0;
	while(i < 2) {
		ubyte y = SpriteTable7E467E[x10 / SpriteTable7E467E.sizeof].unknown4;
		SpriteTable7E467E[x10 / SpriteMap.sizeof].unknown0 = 0xFF;
		SpriteTable7E467E[x10 / SpriteMap.sizeof].unknown10 = 0xFF;
		SpriteTable7E467E[x10 / SpriteMap.sizeof].unknown11 = 0xFF;
		SpriteTable7E467E[x10 / SpriteMap.sizeof].unknown3 = 0xFF;
		SpriteTable7E467E[x10 / SpriteMap.sizeof].unknown4 = 0xFF;
		x10 += SpriteMap.sizeof;
		if ((y & 0x80) != 0) {
			i++;
		}
	}
}

/// $C01B96
// no idea what's going on here
short UnknownC01B96(short arg1, short arg2) {
	short x;
	outer: for (short i = 0; i <= 0x58 - arg1; i = cast(short)(x + 1)) {
		for (short j = 0; j < arg1; j++) {
			x = cast(short)(i + j);
			if (Unknown7E4A00[i + j] != 0) {
				continue outer;
			}
		}
		for (short j = 0; j < arg1; j++) {
			x = cast(short)(i + j);
			Unknown7E4A00[i + j] = cast(ubyte)arg2 | 0x80;
		}
		return i;
	}
	return -253;
}

/// $C01C11
void AllocSpriteMem(short arg1, ubyte arg2) {
	for (short i = 0; i < 0x58; i++) {
		if (((Unknown7E4A00[i] & 0xFF) == (arg1 | 0x80)) || (arg1 == short.min)) {
			Unknown7E4A00[i] = arg2;
		}
	}
}

/// $C01C52
short UnknownC01C52(short arg1, short arg2, short arg3) {
	short local4 = cast(short)((((arg1 + 1) & 0xFFFE) * ((arg2 + 1) & 0xFFFE)) / 4);
	short local3 = UnknownC01B96(local4, arg3);
	if (local3 < 0) {
		return local3;
	}
	if ((((arg1 + 1) & 0xFFFE) != arg1) || (((arg2 + 1) & 0xFFFE) != arg2)) {
		short local6;
		for (short i = local3; i <local3 + local4; i += local6) {
			local6 = cast(short)(((i + 8) & 0xF8) - i);
			if (local3 + local4 - i < local6) {
				local6 = cast(short)(local3 + local4 - i);
			}
			CopyToVram(3, cast(ushort)(local6 * 64), cast(ushort)(UnknownC42F8C[i] + 0x4000), &UnknownC40BE8[0]);
			CopyToVram(3, cast(ushort)(local6 * 64), cast(ushort)(UnknownC42F8C[i] + 0x4100), &UnknownC40BE8[0]);
		}
	}
	return local3;
}

/// $C01D38
void UnknownC01D38(short arg1, short arg2, short arg3, const(UnknownC42B0DEntry)* arg4) {
	// why???
	SpriteMap* x10 = &SpriteTable7E467E.ptr[arg1 / 5];
	const(UnknownC42B0DSubEntry)* x06 = &arg4.unknown2[0][0];
	for (short i = 0; i < 2; i++) {
		for (short j = 0; j < arg4.unknown0; j++) {
			x10.unknown0 = x06.unknown0;
			x10.unknown10 = cast(ubyte)UnknownC4303C[arg2 + j];
			x10.unknown11 = cast(ubyte)((x06.unknown2 & 0xFE) | ((UnknownC4303C[arg2 + j] >> 8) & 0xFF) | arg3);
			x10.unknown3 = x06.unknown3;
			x10.unknown4 = x06.unknown4;
			x10++;
			x06++;
		}
	}
}

/// $C01DED
short UnknownC01DED(short arg1) {
	Unknown7E467A = SpriteGroupingPointers[arg1].width / 16;
	Unknown7E467C = SpriteGroupingPointers[arg1].height;
	return SpriteGroupingPointers[arg1].unknown2;
}

/// $C01E49
short CreateEntity(short sprite, short actionScript, short index, short x, short y) {
	short result;
	if (Debug != 0) {
		if (sprite == -1) {
			return 0;
		}
	}
	short x02 = UnknownC01DED(sprite);
	short x21 = UnknownC01C52(Unknown7E467A, Unknown7E467C, index);
	while (x21 <= 0) {}
	short x1F = FindFree7E4682(UnknownC42B0D[x02].unknown0 * 10);
	while (x1F <= 0) {}
	NewEntityPriority = 1;
	UnknownC01D38(x1F, x21, SpriteGroupingPointers[sprite].unknown3, &UnknownC42B0D[x02]);
	if (index != -1) {
		EntityAllocationMinSlot = index;
		EntityAllocationMaxSlot = cast(short)(index + 1);
		result = InitEntity(actionScript, x, y);
	} else {
		EntityAllocationMinSlot = 0;
		EntityAllocationMaxSlot = 0x16;
		result = InitEntity(actionScript, x, y);
		AllocSpriteMem(-1, cast(ubyte)(result | 0x80));
	}
	EntitySpriteMapPointers[result] = &SpriteTable7E467E[x1F];
	EntityUnknown2916[result] = UnknownC42B0D[x02].unknown0 * 5;
	EntityUnknown2952[result] = x21;
	EntityVramAddresses[result] = cast(ushort)(UnknownC42F8C[x21] + 0x4000);
	EntityByteWidths[result] = SpriteGroupingPointers[sprite].width;
	EntityTileHeights[result] = SpriteGroupingPointers[sprite].height;
	//UNKNOWN_30X2_TABLE_31[result] = SpriteGroupingPointers[sprite].spriteBank;
	EntityTPTEntrySprites[result] = sprite;
	//EntityGraphicsPointerHigh[result] = &SpriteGroupingPointers[sprite];
	//EntityGraphicsPointerLow[result] = &SpriteGroupingPointers[sprite];
	EntityGraphicsPointers[result] = &SpriteGroupingPointers[sprite].sprites[0];
	if ((Unknown7E467C & 1) != 0) {
		EntityVramAddresses[result] += 0x100;
	}
	EntitySizes[result] = SpriteGroupingPointers[sprite + 1].height;
	Unknown7E3366[result] = SpriteGroupingPointers[sprite].unknown4;
	Unknown7E33A2[result] = SpriteGroupingPointers[sprite].unknown5;
	Unknown7E33DE[result] = SpriteGroupingPointers[sprite].unknown6;
	Unknown7E1A4A[result] = SpriteGroupingPointers[sprite].unknown7;
	Unknown7E332A[result] = UnknownC42AEB[SpriteGroupingPointers[sprite + 1].width];
	UNKNOWN_30X2_TABLE_38[result] = cast(ushort)((UnknownC42B0D[x02].unknown1 <<8) | (UnknownC42B0D[x02].unknown0 - UnknownC42B0D[x02].unknown1));
	UNKNOWN_30X2_TABLE_43[result] = 0xFFFF;
	EntityEnemyIDs[result] = -1;
	EntityTPTEntries[result] = 0xFFFF;
	EntityCollidedObjects[result] = 0xFFFF;
	EntitySurfaceFlags[result] = 0;
	UNKNOWN_30X2_TABLE_45[result] = 0;
	UNKNOWN_30X2_TABLE_44[result] = 0;
	UNKNOWN_30X2_TABLE_41[result] = 0;
	UNKNOWN_30X2_TABLE_35[result] = 0;
	EntityDirections[result] = 0;
	EntityObstacleFlags[result] = 0;
	return result;
}

/// $C020F1
void UnknownC020F1() {
	UnknownC01B15(EntitySpriteMapPointers[CurrentEntitySlot]);
	AllocSpriteMem(CurrentEntitySlot, 0);
	if ((EntityTPTEntries[CurrentEntitySlot] & 0xF000) == 0x8000) {
		OverworldEnemyCount--;
	}
	if (EntityEnemyIDs[CurrentEntitySlot] == EnemyID.MagicButterfly) {
		MagicButterfly = 0;
	}
	EntityTPTEntrySprites[CurrentEntitySlot] = -1;
	EntityTPTEntries[CurrentEntitySlot] = 0xFFFF;
}

/// $C02140
void UnknownC02140(short arg1) {
	UnknownC01B15(EntitySpriteMapPointers[arg1]);
	AllocSpriteMem(arg1, 0);
	if ((EntityTPTEntries[arg1] & 0xF000) == 0x8000) {
		OverworldEnemyCount--;
	}
	if (EntityEnemyIDs[arg1] == EnemyID.MagicButterfly) {
		MagicButterfly = 0;
	}
	EntityTPTEntrySprites[arg1] = -1;
	EntityTPTEntries[arg1] = 0xFFFF;
	UnknownC09C35(arg1);
}

/// $C02194
void UnknownC02194() {
	MagicButterfly = 0;
	Unknown7E4A68 = 0;
	OverworldEnemyCount = 0;
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if ((EntityScriptTable[i] + 1) > 6) {
			UnknownC02140(i);
		}
	}
	for (short i = 0; i < MAX_ENTITIES; i++) {
		EntityCollidedObjects[i] = 0xFFFF;
	}
}

/// $C021E6
void UnknownC021E6() {
	MagicButterfly = 0;
	Unknown7E4A68 = 0;
	OverworldEnemyCount = 0;
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (EntityScriptTable[i] + 1 <= 2) {
			continue;
		}
		if (i == 23) {
			continue;
		}
		UnknownC02140(i);
	}
	UnknownC09C35(23);
}

/// $C0222B
void UnknownC0222B(short x, short y) {
	if (x >= 0x20) {
		return;
	}
	if (y >= 0x28) {
		return;
	}
	if (SpritePlacementPointerTable[y][x] != null) {
		short x24 = SpritePlacementPointerTable[y][x].entries;
		const(SpritePlacement)* x0A = &SpritePlacementPointerTable[y][x].spritePlacements[0];
		for (short i = 0; i < x24; i++) {
			short x20 = x0A.unknown0;
			short x1E = x0A.unknown3;
			short x1C = x0A.unknown2;
			x0A++;
			if ((GlobalMapTilesetPaletteData[((x1C / 8) + (y * 32)) / 16][((x1E / 8) + (x * 32)) / 32] / 8 == Unknown7E436E) && (UnknownC0A21C(x20) == 0)) {
				short x18 = cast(short)((x << 8) + x1E);
				short x16 = cast(short)((y << 8) + x1C);
				short x1A = cast(short)(x18 - BG1_X_POS);
				short xreg = cast(short)(x16 - BG1_Y_POS);
				if (Debug != 0) {
					if ((((pad_state[0] & (PAD_L | PAD_R)) != 0) || (Unknown7E4A58 - 1 != 0)) && ((x1A < 0x100) && (xreg < 0xE0))) {
						continue;
					}
				} else {
					if ((Unknown7E4A58 - 1 != 0) && (x1A < 0x100) && (xreg < 0xE0)) {
						continue;
					}
				}
				if (-64 > x1A) {
					continue;
				}
				if (0x140 <= x1A) {
					continue;
				}
				if (-64 > xreg) {
					continue;
				}
				if (0x140 <= xreg) {
					continue;
				}
				x1A = -1;
				if (Unknown7EB4EF == 0) {
					if ((Debug != 0) && (NPCConfig[x20].appearanceStyle != 0) && (UnknownEFE6CF() != 0) && ((((NPCConfig[x20].appearanceStyle - 2) ^ getEventFlag(NPCConfig[x20].eventFlag)) & 1) == 0)) {
						continue;
					} else if ((NPCConfig[x20].appearanceStyle != 0) && ((((NPCConfig[x20].appearanceStyle - 2) ^ getEventFlag(NPCConfig[x20].eventFlag)) & 1) == 0)) {
						continue;
					}
					if (Debug != 0) {
						if ((ShowNPCFlag == 0) || (NPCConfig[x20].type == 3)) {
							x1A = CreateEntity(NPCConfig[x20].sprite, UnknownEFE6E2(NPCConfig[x20].actionScript), -1, x18, x16);
						}
					} else {
						if ((ShowNPCFlag == 0) || (NPCConfig[x20].type == 3)) {
							x1A = CreateEntity(NPCConfig[x20].sprite, NPCConfig[x20].actionScript, -1, x18, x16);
						}
					}
				} else if (NPCConfig[x20].appearanceStyle == 0) {
					x1A = CreateEntity(NPCConfig[x20].sprite, ActionScript.Unknown799, -1, x18, x16);
				}
				if (x1A != -1) {
					EntityDirections[x1A] = NPCConfig[x20].direction;
					EntityTPTEntries[x1A] = x20;
				}
			}
		}
	}
}

/// $C0255C
void UnknownC0255C(short x, short y) {
	short x12 = void;
	short x14 = short.min;
	if (Unknown7E4A58 == 0) {
		return;
	}
	if (x12 < 0) {
		return;
	}
	short x10 = y / 32;
	for (short i = cast(short)(x - 2); i != x + 36; i++) {
		if (i < 0) {
			continue;
		}
		x12 = i / 32;
		if (x12 == x14) {
			continue;
		}
		UnknownC0222B(x12, x10);
		x14 = x12;
	}
}

/// $C025CF
void UnknownC025CF(short x, short y) {
	short x10 = void;
	short x_ = short.min;
	if (Unknown7E4A58 == 0) {
		return;
	}
	if (x10 < 0) {
		return;
	}
	short x0E = x / 32;
	short x12;
	for (short i = y; i != y + 32; i++) {
		if (i < 0) {
			continue;
		}
		x12 = i / 32;
		if (x12 == x_) {
			continue;
		}
		UnknownC0222B(x0E, x12);
		x_ = x12;
	}
}

/// $C0263D
short UnknownC0263D(short x, short y) {
	if ((x >= 128) && (y >= 160)) {
		return 0;
	}
	return MapEnemyPlacement[y][x];
}

/// $C02668
void UnknownC02668(short arg1, short arg2, short arg3) {
	short x2A;
	const(BattleGroupEnemy)* x0A;
	if ((Debug != 0) && (UnknownEFE759() != 0) && (rand() < 16)) {
		x2A = 0;
		x0A = &BattleEntryPointerTable[0].enemies[0];
	} else if ((++Unknown7E4A7A & 0xF) == 0) {
		short x28 = void;
		switch (MapDataPerSectorAttributesTable[(arg2 * 8) / 16][(arg1 * 8) / 32] & 7) {
			case 0:
				x28 = 2;
				break;
			case 1:
				x28 = 0;
				break;
			case 2:
				x28 = 1;
				break;
			case 3:
				x28 = 0;
				break;
			case 4:
				x28 = 5;
				break;
			case 5:
				x28 = 1;
				break;
			default: break;
		}
		if ((rand() % 100) >= x28) {
			return;
		}
		x2A = 481;
		Unknown7E4A72 = 481;
		x0A = &BattleEntryPointerTable[481].enemies[0];
	} else if (arg3 != 0) {
		if (GlobalMapTilesetPaletteData[(arg2 * 8) / 16][(arg1 * 8) / 32] / 8 == Unknown7E436E) {
			Unknown7E4A6C = arg3;
			short x26 = EnemyPlacementGroupsPointerTable[arg3].eventFlag;
			const(EnemyPlacementGroup)* x22 = EnemyPlacementGroupsPointerTable[arg3].groups.ptr;
			Unknown7E4A70 = EnemyPlacementGroupsPointerTable[arg3].unknown2;
			short x1C = 0;
			if ((x26 != 0) && (getEventFlag(x26) != 0)) {
				Unknown7E4A70 = EnemyPlacementGroupsPointerTable[arg3].unknown3;
				if (EnemyPlacementGroupsPointerTable[arg3].unknown2 != 0) {
					x1C = 8;
				}
			}
			if ((PiracyFlag == 0) && (((rand() * 100) >> 8) >= Unknown7E4A70)) {
				return;
			}
			short x1A = rand() & 7 + x1C;
			short x = 0;
			while (true) {
				x += x22[0].unknown0;
				if (x1A < x) {
					break;
				}
				x22++;
			}
			x2A = x22[0].groupID;
			Unknown7E4A72 = x2A;
			x0A = &BattleEntryPointerTable[x2A].enemies[0];
			for (short i = 0; i != 23; i++) {
				if (EntityScriptTable[i] == -1) {
					continue;
				}
				if (x2A + 0x8000 != EntityTPTEntries[i]) {
					continue;
				}
				if (x1C == UNKNOWN_30X2_TABLE_43[i]) {
					return;
				}
			}
		}
	}
	while ((Unknown7E4A6E = x0A[0].count) != 0) {
		Unknown7E4A76 = EnemyConfigurationTable[x0A[0].enemyID].name[0];
		short x26 = EnemyConfigurationTable[x0A[0].enemyID].overworldSprite;
		Unknown7E4A74 = x26;
		short x16 = EnemyConfigurationTable[x0A[0].enemyID].eventScript;
		if (x16 == 0) {
			x16 = ActionScript.Unknown019;
		}
		while (Unknown7E4A6E-- != 0) {
			if (x0A[0].enemyID == EnemyID.MagicButterfly) {
				if (MagicButterfly != 0) {
					continue;
				}
			}
			if (OverworldEnemyCount == Unknown7E4A5E) {
				Unknown7E4A68++;
				continue;
			}
			Unknown7E4A68 = 0;
			short x14 = CreateEntity(x26, x16, -1, 0, 0);
			short x04;
			short x02;
			for (short i = 0; i != 20; i++) {
				x04 = cast(short)((rand() % Unknown7E4A62) * 8 + arg1 * 8);
				x02 = cast(short)((rand() % Unknown7E4A64) * 8 + arg2 * 8);
				short x12 = UnknownC05F33(x04, x02, x14);
				if ((x12 & 0xD0) != 0) {
					continue;
				}
				if (UnknownC05DE7(x12, x14, x0A[0].enemyID) == 0) {
					goto Unknown28;
				}
			}
			UnknownC02140(x14);
			continue;
			Unknown28:
			EntityAbsXTable[x14] = x04;
			EntityAbsYTable[x14] = x02;
			EntityTPTEntries[x14] = x2A + 0x8000;
			EntityEnemyIDs[x14] = x0A[0].enemyID;
			UNKNOWN_30X2_TABLE_43[x14] = cast(short)(arg2 * 128 + arg1);
			UNKNOWN_30X2_TABLE_41[x14] = 0;
			Unknown7E3186[x14] = rand();
			OverworldEnemyCount++;
			if (x0A[0].enemyID == EnemyID.MagicButterfly) {
				MagicButterfly = 1;
			}
		}
		x0A++;
	}
}

/// $C02A6B
void SpawnHorizontal(short x, short y) {
	if (getEventFlag(EventFlag.UNKNOWN_00B) != 0) {
		return;
	}
	if (getEventFlag(EventFlag.USE_POSTGAME_MUSIC) != 0) {
		return;
	}
	if (Unknown7E4A5A == 0) {
		return;
	}
	if ((y & 7) != 0) {
		return;
	}
	if (((y < -16) ? 0 : y) >= 0x500) {
		return;
	}
	short x14 = x / 8;
	short x12 = ((y < -16) ? 0 : y) / 8;
	for (short i = x14; x14 + 5 > i; i++) {
		short x10 = i;
		Unknown7E4A62 = 8;
		Unknown7E4A64 = 8;
		short x02 = 1;
		Unknown9:
		short x16 = UnknownC0263D(i, x12);
		short tmp = UnknownC0263D(cast(short)(i + 1), x12);
		if ((x16 != 0) && (tmp == x16)) {
			Unknown7E4A62 += 8;
			i++;
			if (++x02 != 6) {
				goto Unknown9;
			}
		}
		while (x02-- != 0) {
			UnknownC02668(x10, x12, x16);
		}
	}
}

/// $C02B55
void SpawnVertical(short x, short y) {
	if (getEventFlag(EventFlag.UNKNOWN_00B) != 0) {
		return;
	}
	if (getEventFlag(EventFlag.USE_POSTGAME_MUSIC) != 0) {
		return;
	}
	if (Unknown7E4A5A == 0) {
		return;
	}
	if ((x & 7) != 0) {
		return;
	}
	if (((x < -16) ? 0 : x) >= 0x400) {
		return;
	}
	short x14 = ((x < -16) ? 0 : x) / 8;
	short x12 = y / 8;
	for (short i = x12; x12 + 5 > i; i++) {
		short x10 = i;
		Unknown7E4A62 = 8;
		Unknown7E4A64 = 8;
		short x02 = 1;
		Unknown9:
		short x18 = UnknownC0263D(x14, i);
		short tmp = UnknownC0263D(x14, cast(short)(i + 1));
		if ((x18 != 0) && (tmp == x18)) {
			Unknown7E4A64 += 8;
			i++;
			if (++x02 != 6) {
				goto Unknown9;
			}
		}
		while (x02-- != 0) {
			UnknownC02668(x14, x10, x18);
		}
	}
}

/// $C02C3E
void UnknownC02C3E() {
	if (PartyCharacters[gameState.playerControlledPartyMembers[0]].afflictions[1] == Status1.Mushroomized) {
		MushroomizedWalkingFlag = 1;
		if (MushroomizationTimer == 0) {
			MushroomizationTimer = 1800;
			MushroomizationModifier = 0;
		}
		if (gameState.walkingStyle == WalkingStyle.Bicycle) {
			UnknownC03CFD();
		}
	} else {
		MushroomizedWalkingFlag = 0;
	}
}

/// $C02C89
void MushroomizationMovementSwap() {
	if (MushroomizationTimer == 0) {
		MushroomizationTimer = 30 * 60;
		MushroomizationModifier = (MushroomizationModifier + 1) & 3;
	}
	MushroomizationTimer--;
	if (MushroomizationModifier == 0) {
		return;
	}
	if (Unknown7E0081 != 0) {
		return;
	}
	pad_press[0] = (pad_press[0] & 0xF0FF) | MushroomizationDirectionRemapTables[MushroomizationModifier - 1][(pad_press[0] >> 8) & 0xF];
	pad_state[0] = (pad_state[0] & 0xF0FF) | MushroomizationDirectionRemapTables[MushroomizationModifier - 1][(pad_state[0] >> 8) & 0xF];
}

/// $C02D29
void UnknownC02D29() {
	EntitySizes[23] = 1;
	Unknown7E9F6B = -1;
	gameState.unknown88 = 0;
	gameState.unknownB0 = 0;
	gameState.unknownB2 = 0;
	gameState.unknownB4 = 0;
	gameState.partyStatus = 0;
	gameState.currentPartyMembers = 0x18;
	for (short i = 0; i < 6; i++) {
		gameState.unknown96[i] = 0;
		Unknown7E5D8C[i] = 0;
	}
	gameState.playerControlledPartyMemberCount = 0;
	gameState.partyCount = 0;
	VelocityStore();
	PajamaFlag = getEventFlag(NessPajamaFlag);
}

/// $C02D8F
uint AdjustPositionHorizontal(short arg1, uint arg2, short arg3) {
	switch (arg3 & SurfaceFlags.DeepWater) {
		case SurfaceFlags.ShallowWater:
			return (((horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * ShallowWaterSpeed.combined) / 256) + arg2;
		case SurfaceFlags.DeepWater:
			return (((horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * DeepWaterSpeed.combined) / 256) + arg2;
		default:
			if (Unknown7E0081 != 0) {
				return horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined + arg2;
			} else if ((gameState.partyStatus == 3) && (gameState.walkingStyle == 0)) {
				return (((horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * SkipSandwichSpeed.combined) / 256) + arg2;
			}
			return horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined + arg2;
	}
}

/// $C03017
uint AdjustPositionVertical(short arg1, uint arg2, short arg3) {
	switch (arg3 & SurfaceFlags.DeepWater) {
		case SurfaceFlags.ShallowWater:
			return (((verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * ShallowWaterSpeed.combined) / 256) + arg2;
		case SurfaceFlags.DeepWater:
			return (((verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * DeepWaterSpeed.combined) / 256) + arg2;
		default:
			if (Unknown7E0081 != 0) {
				return verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined + arg2;
			} else if ((gameState.partyStatus == 3) && (gameState.walkingStyle == 0)) {
				return (((verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * SkipSandwichSpeed.combined) / 256) + arg2;
			}
			return verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined + arg2;
	}
}

/// $C032EC
void UnknownC032EC() {
	short y;
	for (y = 0; (gameState.partyMembers[y] != 0) && (5 > gameState.partyMembers[y]); y++) {}
	gameState.playerControlledPartyMemberCount = cast(ubyte)y;
	if (gameState.partyNPCs[0] != gameState.partyMembers[y]) {
		if (gameState.partyNPCs[1] == gameState.partyMembers[y]) {
			gameState.partyNPCs[0] = gameState.partyNPCs[1];
			gameState.partyNPCHP[0] = gameState.partyNPCHP[1];
			gameState.partyNPCs[1] = gameState.partyMembers[y + 1];
			gameState.partyNPCHP[1] = EnemyConfigurationTable[NPCAITable[gameState.partyMembers[y + 1]].enemyID].hp;
		} else if (gameState.partyNPCs[0] == gameState.partyMembers[y + 1]) {
			gameState.partyNPCs[1] = gameState.partyNPCs[0];
			gameState.partyNPCHP[1] = gameState.partyNPCHP[0];
			gameState.partyNPCs[0] = gameState.partyMembers[y];
			gameState.partyNPCHP[0] = EnemyConfigurationTable[NPCAITable[gameState.partyMembers[y]].enemyID].hp;
		} else {
			gameState.partyNPCs[0] = gameState.partyMembers[y];
			gameState.partyNPCHP[0] = EnemyConfigurationTable[NPCAITable[gameState.partyMembers[y]].enemyID].hp;
			if (gameState.partyNPCs[1] != gameState.partyMembers[y + 1]) {
				gameState.partyNPCs[1] = gameState.partyMembers[y + 1];
				gameState.partyNPCHP[1] = EnemyConfigurationTable[NPCAITable[gameState.partyMembers[y + 1]].enemyID].hp;
			}
		}
	} else if (gameState.partyNPCs[1] != gameState.partyMembers[y + 1]) {
		gameState.partyNPCs[1] = gameState.partyMembers[y + 1];
		gameState.partyNPCHP[1] = EnemyConfigurationTable[NPCAITable[gameState.partyMembers[y + 1]].enemyID].hp;
	}
}

/// $C034D6
void UpdateParty() {
	short[6] local1;
	short[6] local2;
	short[6] local3;
	short[6] local4;
	short partyCount = gameState.partyCount;
	for (short i = 0; i < partyCount; i++) {
		local1[i] = PartyCharacters[gameState.playerControlledPartyMembers[i]].position_index;
	}
	for (short i = 0; i < partyCount; i++) {
		short local9 = gameState.unknown96[i];
		if (local9 >= 5) {
			local9 += 0x300;
		} else {
			short x = PartyCharacters[EntityScriptVar1Table[gameState.unknownA2[i]]].afflictions[0];
			if ((x == Status0.Unconscious) || (x == Status0.Diamondized)) {
				local9 += 0x100;
			}
		}
		local2[i] = local9;
		local3[i] = gameState.unknownA2[i];
		local4[i] = gameState.playerControlledPartyMembers[i];
	}
	for (short i = 0; partyCount - 1 > i; i++) {
		for (short j = 0; partyCount - 1 > j; j++) {
			short local9 = local2[j];
			short local11 = local2[j + 1];
			if (local9 > local11) {
				local2[j] = local11;
				local2[j + 1] = local9;
				short local6 = local3[j];
				local3[j] = local3[j + 1];
				local3[j + 1] = local6;
				short local11_2 = local4[j];
				local4[j] = local4[j + 1];
				local4[j + 1] = local11_2;
			}
		}
	}
	for (short i = 0; i < partyCount; i++) {
		gameState.unknown96[i] = cast(ubyte)local2[i];
		gameState.unknownA2[i] = cast(ubyte)local3[i];
		gameState.playerControlledPartyMembers[i] = cast(ubyte)local4[i];
		PartyCharacters[i].position_index = local1[i];
		EntityScriptVar5Table[i] = gameState.unknownA2[i];
	}
	gameState.currentPartyMembers = gameState.unknownA2[0];
	UnknownC032EC();
	UnknownC02C3E();
	UnknownC47F87();
}

/// $C0369B
short UnknownC0369B(short id) {
	short x18 = 0;
	if (id >= 5) {
		while(true) {
			if (gameState.unknown96[x18] == 0) {
				break;
			}
			if (gameState.unknown96[x18] <= id) {
				break;
			}
			x18++;
		}
	} else {
		while (true) {
			if (gameState.unknown96[x18] == 0) {
				break;
			}
			if (5 <=gameState.unknown96[x18]) {
				break;
			}
			if (gameState.unknown96[x18] > id) {
				break;
			}
			if (PartyCharacters[EntityScriptVar1Table[x18]].afflictions[0] == 1) {
				break;
			}
			x18++;
		}
	}
	if (gameState.unknown96[x18] != 0) {
		for (short i = 5; i != x18 - 1; i--) {
			gameState.unknown96[i] = gameState.unknown96[i - 1];
			gameState.unknownA2[i] = gameState.unknownA2[i - 1];
			gameState.playerControlledPartyMembers[i] = gameState.playerControlledPartyMembers[i - 1];
		}
	}
	gameState.unknown96[x18] = cast(ubyte)id;
	gameState.partyCount++;
	NewEntityVar0 = cast(short)(id - 1);
	short x1A_2 = CharacterInitialEntityData[id - 1].unknown6;
	if (EntityScriptTable[x1A_2] != -1) {
		x1A_2++;
	}
	gameState.unknownA2[x18] = cast(ubyte)x1A_2;
	NewEntityVar1 = cast(short)(x1A_2 - 0x18);
	gameState.playerControlledPartyMembers[x18] = cast(ubyte)NewEntityVar1;
	if (gameState.partyCount == 1) {
		PartyCharacters[NewEntityVar1].position_index = gameState.unknown88;
	} else {
		short x16 = (x18 == 0) ? gameState.unknown88 : PartyCharacters[EntityScriptVar1Table[gameState.unknownA2[x18 - 1]]].position_index;
		PartyCharacters[NewEntityVar1].position_index = x16;
	}
	short x = (PartyCharacters[NewEntityVar1].position_index != 0) ? cast(short)(PartyCharacters[NewEntityVar1].position_index - 1) : 0xFF;
	short x18_2 = (gameState.unknown92 != 3) ? CharacterInitialEntityData[id - 1].overworldSprite : CharacterInitialEntityData[id - 1].lostUnderworldSprite;
	CreateEntity(x18_2, CharacterInitialEntityData[id - 1].actionScript, x1A_2, PlayerPositionBuffer[x].x_coord, PlayerPositionBuffer[x].y_coord);
	EntityScreenXTable[x1A_2] = cast(short)(PlayerPositionBuffer[x].x_coord - BG1_X_POS);
	EntityScreenYTable[x1A_2] = cast(short)(PlayerPositionBuffer[x].y_coord - BG1_Y_POS);
	gameState.currentPartyMembers = CharacterInitialEntityData[gameState.unknown96[0] - 1].unknown6;
	UnknownC09CD7();
	UnknownC032EC();
	gameState.currentPartyMembers = gameState.unknownA2[0];
	UpdateParty();
	EntityPreparedXCoordinate = PlayerPositionBuffer[x].x_coord;
	EntityPreparedYCoordinate = PlayerPositionBuffer[x].y_coord;
	EntityPreparedDirection = EntityDirections[x1A_2];
	return x1A_2;
}

/// $C03903
void UnknownC03903(short id) {
	short i;
	for (i = 0; (gameState.unknown96[i] != id) && (i != 6); i++) {}
	if (i == 6) {
		return;
	}
	short j;
	for (j = i; j < 5; j++) {
		gameState.unknown96[j] = gameState.unknown96[j + 1];
		gameState.unknownA2[j] = gameState.unknownA2[j + 1];
		gameState.playerControlledPartyMembers[j] = gameState.playerControlledPartyMembers[j + 1];
	}
	if (i == 0) {
		PartyCharacters[gameState.playerControlledPartyMembers[0]].position_index = EntityScriptVar1Table[gameState.unknownA2[i]];
	}
	gameState.unknown96[j] = 0;
	gameState.partyCount--;
	EntityAbsXTable[gameState.unknownA2[i]] = EntityPreparedXCoordinate;
	EntityAbsYTable[gameState.unknownA2[i]] = EntityPreparedYCoordinate;
	EntityDirections[gameState.unknownA2[i]] = EntityPreparedDirection;
	UnknownC02140(gameState.unknownA2[i]);
	UnknownC032EC();
	UpdateParty();
}

/// $C039E5
void UnknownC039E5() {
	for (short i = 0; i < 6; i++) {
		if (gameState.unknown96[i] == 0) {
			continue;
		}
		EntityAbsXTable[gameState.unknownA2[i]] = gameState.leaderX.integer;
		EntityAbsYTable[gameState.unknownA2[i]] = gameState.leaderY.integer;
		UnknownC0A254(gameState.unknownA2[i]);
	}
}

/// $C03A24
void UnknownC03A24() {
	gameState.playerControlledPartyMemberCount = 0;
	gameState.partyCount = 0;
	for (short i = 0; i < 6; i++) {
		gameState.unknown96[i] = 0;
		gameState.playerControlledPartyMembers[i] = 0;
		gameState.unknownA2[i] = 0;
	}
	Unknown7E5D7E = 1;
	for (short i = 0; i < 6; i++) {
		if (gameState.partyMembers[i] == 0) {
			break;
		}
		UnknownC0369B(gameState.partyMembers[i]);
	}
	Unknown7E5D7E = 0;
	FootstepSoundID = gameState.unknown92;
	FootstepSoundIDOverride = 0;
}

/// $C03A94
void UnknownC03A94(short arg1) {
	//x1E = arg1
	short x1C;
	short x;
	if ((Unknown7E438A | Unknown7E438C) != 0) {
		x1C = cast(short)(Unknown7E438A * 8);
		x = cast(short)(Unknown7E438C * 8);
	} else {
		x1C = gameState.leaderX.integer;
		x = gameState.leaderY.integer;
	}
	short x1A = LoadSectorAttributes(x1C, x) & 7;
	gameState.unknown92 = x1A;
	FootstepSoundID = cast(short)(x1A * 2);
	FootstepSoundIDOverride = 0;
	if (x1A != 3) {
		gameState.walkingStyle = 0;
	} else {
		gameState.walkingStyle = WalkingStyle.Slowest;
	}
	short x18 = CurrentEntitySlot;
	CurrentEntitySlot = -1;
	for (short i = 0; i < 6; i++) {
		if (gameState.unknown96[i] == 0) {
			continue;
		}
		NewEntityVar0 = EntityScriptVar0Table[gameState.unknownA2[i]];
		NewEntityVar1 = EntityScriptVar1Table[gameState.unknownA2[i]];
		NewEntityVar5 = cast(short)(i * 2);
		short x14 = EntitySpriteMapFlags[gameState.unknownA2[i]];
		short x1A_2 = EntityTickCallbackFlags[gameState.unknownA2[i]];
		UnknownC02140(gameState.unknownA2[i]);
		Unknown7E9F73 = gameState.unknownA2[i];
		short x12;
		if (gameState.unknown92 != 3) {
			x12 = CreateEntity(UnknownC0780F(gameState.unknown96[i] - 1, 0, &PartyCharacters[i]), CharacterInitialEntityData[gameState.unknown96[i] - 1].actionScript, gameState.unknown96[i] - 1, gameState.leaderX.integer, gameState.leaderY.integer);
		} else {
			x12 = CreateEntity(UnknownC0780F(gameState.unknown96[i] - 1, 10, &PartyCharacters[i]), CharacterInitialEntityData[gameState.unknown96[i] - 1].actionScript, gameState.unknown96[i] - 1, gameState.leaderX.integer, gameState.leaderY.integer);
		}
		EntitySpriteMapFlags[gameState.unknownA2[i]] = x14;
		EntityTickCallbackFlags[gameState.unknownA2[i]] = x1A_2;
		EntityDirections[gameState.unknownA2[i]] = arg1;
		EntityAnimationFrames[gameState.unknownA2[i]] = 0;
		UnknownC0A780(x12);
	}
	CurrentEntitySlot = x18;
	UnknownC039E5();
	Unknown7E5DA8 = 0xFFFF;
	short x02 = Unknown7E5D9A;
	Unknown7E5D9A = 0;
	UnknownC05B7B(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers, 4);
	Unknown7E5D9A = x02;
	if (Unknown7E5DA8 != -1) {
		UnknownC07526(Unknown7E5DA8, Unknown7E5DAA);
	}
}

/// $C03C25
void UnknownC03C25() {
	Unknown7E5DDA = 1;
	UnknownC068F4(gameState.leaderX.integer, gameState.leaderY.integer);
	if (Unknown7E5DD6 != Unknown7E5DD4) {
		WaitUntilNextFrame();
		UnknownC069AF();
	}
	Unknown7E5DDA = 0;
}

/// $C03C4B
short UnknownC03C4B() {
	return UnknownC05D8B(gameState.leaderX.integer, gameState.leaderY.integer, 0xC) & 0xC0;
}

/// $C03C5E
void GetOnBicycle() {
	if (gameState.partyCount != 1) {
		return;
	}
	if (gameState.unknown96[0] != 1) {
		return;
	}
	if (Unknown7E5DD8 == 0) {
		ChangeMusic(Music.Bicycle);
	}
	UnknownC02140(0x18);
	gameState.unknown92 = 6;
	gameState.walkingStyle = WalkingStyle.Bicycle;
	PartyCharacters[0].position_index = 0;
	gameState.unknown88 = 0;
	NewEntityVar0 = 0;
	NewEntityVar1 = 0;
	CreateEntity(OverworldSprite.NessBicycle, ActionScript.Unknown002, 0x18, EntityAbsXTable[24], EntityAbsYTable[24]);
	EntityTickCallbackFlags[24] |= 0x8000;
	EntityScriptVar7Table[24] |= 0x3000;
	EntityAnimationFrames[24] = 0;
	EntityDirections[24] = gameState.leaderDirection;
	SetBoundaryBehaviour(0);
	gameState.unknown90 = 1;
	Unknown7E5DBA = 1;
	Unknown7E5D74 = 2;
}

/// $C03CFD
void UnknownC03CFD() {
	if (gameState.walkingStyle != WalkingStyle.Bicycle) {
		return;
	}
	SetBoundaryBehaviour(1);
	if ((BattleDebug == 0) && (Unknown7E5D9A == 0)) {
		UnknownC06A07();
	}
	UnknownC02140(0x18);
	gameState.unknown92 = 0;
	gameState.walkingStyle = 0;
	PartyCharacters[0].position_index = 0;
	gameState.unknown88 = 0;
	if (Unknown7E5D9A == 0) {
		OAMClear();
		UnknownC09466();
		UpdateScreen();
		WaitUntilNextFrame();
	}
	NewEntityVar0 = 0;
	NewEntityVar1 = 0;
	CreateEntity(OverworldSprite.Ness, ActionScript.Unknown002, 0x18, EntityAbsXTable[24], EntityAbsYTable[24]);
	EntityAnimationFrames[24] = 0;
	EntityDirections[24] = gameState.leaderDirection;
	EntityScriptVar7Table[24] |= 0x9000;
	if (Unknown7E5D9A != 0) {
		EntityTickCallbackFlags[24] |= 0xC000;
	}
	WaitUntilNextFrame();
	WaitUntilNextFrame();
	UnknownC0A780(0x18);
	Unknown7E5DBA = 0;
	Unknown7E5D74 = 2;
}

/// $C03E5A
short UnknownC03E5A(short arg1) {
	short x;
	for (x = 0; gameState.unknown96[x] != arg1 + 1; x++) {}
	if (x == 0) {
		return -1;
	}
	return ChosenFourPtrs[EntityScriptVar1Table[gameState.unknownA2[x - 1]]].position_index;
}

/// $C03E9D
short UnknownC03E9D(short arg1) {
	short x0E = UnknownC03E5A(arg1);
	if (x0E < Unknown7E4DC6.position_index) {
		x0E += 0x100;
	}
	return cast(short)(x0E - Unknown7E4DC6.position_index);
}

/// $C03EC3
short UnknownC03EC3(short arg1, short arg2, short arg3, short arg4) {
	short tmp = UnknownC03E9D(arg1);
	if (tmp == arg2) {
		arg3++;
		EntityScriptVar7Table[CurrentEntitySlot] &= 0xEFFF;
	} else if (tmp > arg2) {
		arg3 += arg3;
		EntityScriptVar7Table[CurrentEntitySlot] |= 0x1000;
	}
	return arg3;
}

/// $C03DAA
void UnknownC03DAA() {
	Unknown7E3456[CurrentEntitySlot] = -1;
	EntityScriptVar3Table[CurrentEntitySlot] = 8;
	EntityScriptVar2Table[CurrentEntitySlot] = rand() & 0xF;
	UnknownC0A780(CurrentEntitySlot);
	PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot] + 1].unknown59 = CurrentEntitySlot;
	PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot] + 1].unknown53 = EntityScriptVar0Table[CurrentEntitySlot];
	PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot] + 1].unknown57 = 0;
	PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot] + 1].unknown92 = -1;
	if (PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot] + 1].afflictions[0] == Status0.Unconscious) {
		EntityScriptVar3Table[CurrentEntitySlot] = 16;
	}
	Unknown7E2898 = cast(short)(gameState.currentPartyMembers * 2);
}

/// $C03F1E
void UnknownC03F1E() {
	gameState.unknown88 = 0;
	PlayerPositionBufferEntry* x = &PlayerPositionBuffer[0];
	short y = 2;
	while (--y != 0) {
		x.x_coord = gameState.leaderX.integer;
		x.y_coord = gameState.leaderY.integer;
		x.direction = gameState.leaderDirection;
		x.walking_style = gameState.walkingStyle;
		x.tile_flags = gameState.troddenTileType;
		MiscDebugFlags = 0;
		x.unknown10 = 0;
		x += 255;
	}
	for (short i = 0; i < gameState.partyCount; i++) {
		ChosenFourPtrs[gameState.playerControlledPartyMembers[i]].position_index = 0;
		ChosenFourPtrs[gameState.playerControlledPartyMembers[i]].unknown65 = 0xFFFF;
		ChosenFourPtrs[gameState.playerControlledPartyMembers[i]].unknown55 = 0xFFFF;
		EntityAbsXTable[gameState.unknownA2[i]] = gameState.leaderX.integer;
		EntityAbsYTable[gameState.unknownA2[i]] = gameState.leaderY.integer;
		EntityDirections[gameState.unknownA2[i]] = gameState.leaderDirection;
		EntitySurfaceFlags[gameState.unknownA2[i]] = gameState.troddenTileType;
	}
}

/// $C03FA9
void UnknownC03FA9(short x, short y, short direction) {
	gameState.leaderX.integer = x;
	gameState.leaderY.integer = y;
	gameState.leaderDirection = direction;
	gameState.troddenTileType = UnknownC05F33(x, y, gameState.currentPartyMembers);
	UnknownC03A94(direction);
	UnknownC03F1E();
	for (short i = 0; i < 6; i++) {
		Unknown7E3456[i + 24] = -1;
	}
	Unknown7E9F6B = -1;
	Unknown7E438C = 0;
	Unknown7E438A = 0;
	PajamaFlag = getEventFlag(NessPajamaFlag);
	UnknownC07B52();
}

/// $C0400E
void CenterScreen(short x, short y) {
	RefreshMapAtPosition(cast(short)(x - 0x80), cast(short)(y - 0x70));
}

/// $C0402B
void UnknownC0402B(Unknown7E007DEntry* arg1) {
	UnknownC083E3(arg1);
}

/// $C0404F
short MapInputToDirection(short style) {
	short result = -1;
	if (Unknown7E5D9A != 0) {
		return -1;
	}
	style = AllowedInputDirections[style];
	switch (pad_state[0] & (PAD_UP | PAD_DOWN | PAD_LEFT | PAD_RIGHT)) {
		case PAD_UP:
			if ((style & DirectionMask.Up) != 0) {
				result = Direction.Up;
			}
			break;
		case (PAD_UP | PAD_RIGHT):
			if ((style & DirectionMask.UpRight) != 0) {
				result = Direction.UpRight;
			}
			break;
		case PAD_RIGHT:
			if ((style & DirectionMask.Right) != 0) {
				result = Direction.Right;
			}
			break;
		case (PAD_DOWN | PAD_RIGHT):
			if ((style & DirectionMask.DownRight) != 0) {
				result = Direction.DownRight;
			}
			break;
		case PAD_DOWN:
			if ((style & DirectionMask.Down) != 0) {
				result = Direction.Down;
			}
			break;
		case (PAD_DOWN | PAD_LEFT):
			if ((style & DirectionMask.DownLeft) != 0) {
				result = Direction.DownLeft;
			}
			break;
		case PAD_LEFT:
			if ((style & DirectionMask.Left) != 0) {
				result = Direction.Left;
			}
			break;
		case (PAD_UP | PAD_LEFT):
			if ((style & DirectionMask.UpLeft) != 0) {
				result = Direction.UpLeft;
			}
			break;
		default: break;
	}
	return result;
}

/// $C04116
short UnknownC04116(short direction) {
	short x14 = cast(short)(UnknownC3E148[direction] + gameState.leaderX.integer);
	short x04 = cast(short)(UnknownC3E158[direction] + gameState.leaderY.integer);
	short x12 = Unknown7E5D58;
	Unknown7E5D58 = 1;
	while (true) {
		short x10 = NPCCollisionCheck(x14, x04, gameState.currentPartyMembers);
		if (x10 > 0) {
			CurrentTPTEntry = EntityTPTEntries[x10];
			Unknown7E5D64 = x10;
			break;
		}
		if ((UnknownC05CD7(x14, x04, gameState.currentPartyMembers, direction) & 0x82) != 0x82) {
			break;
		}
		if (UnknownC3E148[direction] != 0) {
			x14 += ((UnknownC3E148[direction] & 0x8000) != 0) ? -8 : 8;
		}
		if (UnknownC3E158[direction] != 0) {
			x04 += ((UnknownC3E158[direction] & 0x8000) != 0) ? -8 : 8;
		}
	}
	Unknown7E5D58 = x12;
	if ((CurrentTPTEntry == -1) || (CurrentTPTEntry == 0)) {
		UnknownC4334A(direction);
	}
	return CurrentTPTEntry;
}

/// $C041E3
short UnknownC041E3() {
	short x10 = cast(short)(gameState.leaderDirection & 0xFFFE);
	short a = UnknownC04116(cast(short)(gameState.leaderDirection & 0xFFFE));
	if ((a != -1) && (a != 0)) {
		return cast(short)(gameState.leaderDirection & 0xFFFE);
	}
	gameState.leaderDirection = (((gameState.leaderDirection & 0xFFFE) + 2) & 7);
	a = UnknownC04116(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = ((gameState.leaderDirection + 4) & 7);
	a = UnknownC04116(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = ((gameState.leaderDirection - 2) & 7);
	a = UnknownC04116(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = x10;
	return -1;
}

/// $C042C2
void UnknownC042C2(short arg1) {
	EntityDirections[arg1] = UnknownC3E168[gameState.leaderDirection];
	UnknownC09907(arg1);
	UnknownC0A443Entry2(arg1);
}

/// $C04279
ushort FindNearbyCheckableTPTEntry() {
	CurrentTPTEntry = -1;
	Unknown7E5D64 = -1;
	short x10 = UnknownC041E3();
	if ((x10 != -1) && (EntityDirections[gameState.currentPartyMembers] != x10)) {
		gameState.leaderDirection = x10;
		EntityDirections[gameState.currentPartyMembers] = x10;
		UnknownC0A780(gameState.currentPartyMembers);
	}
	return CurrentTPTEntry;
}

/// $C042EF
short UnknownC042EF(short direction) {
	short x14 = cast(short)(UnknownC3E148[direction] + gameState.leaderX.integer);
	short x04 = cast(short)(UnknownC3E158[direction] + gameState.leaderY.integer);
	short x12 = Unknown7E5D58;
	Unknown7E5D58 = 1;
	while (true) {
		short x10 = NPCCollisionCheck(x14, x04, gameState.currentPartyMembers);
		if (x10 > 0) {
			CurrentTPTEntry = EntityTPTEntries[x10];
			Unknown7E5D64 = x10;
			break;
		}
		if ((UnknownC05CD7(x14, x04, gameState.currentPartyMembers, direction) & 0x82) != 0x82) {
			break;
		}
		if (UnknownC3E148[direction] != 0) {
			x14 += ((UnknownC3E148[direction] & 0x8000) != 0) ? -8 : 8;
		}
		if (UnknownC3E158[direction] != 0) {
			x04 += ((UnknownC3E158[direction] & 0x8000) != 0) ? -8 : 8;
		}
	}
	Unknown7E5D58 = x12;
	if ((CurrentTPTEntry == 0) || (CurrentTPTEntry == -1)) {
		UnknownC065C2(direction);
	}
	return CurrentTPTEntry;
}

/// $C043BC
short UnknownC043BC() {
	short x10 = cast(short)(gameState.leaderDirection & 0xFFFE);
	short a = UnknownC042EF(cast(short)(gameState.leaderDirection & 0xFFFE));
	if ((a != -1) && (a != 0)) {
		return cast(short)(gameState.leaderDirection & 0xFFFE);
	}
	gameState.leaderDirection = (((gameState.leaderDirection & 0xFFFE) + 2) & 7);
	a = UnknownC042EF(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = ((gameState.leaderDirection + 4) & 7);
	a = UnknownC042EF(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = ((gameState.leaderDirection - 2) & 7);
	a = UnknownC042EF(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = x10;
	return -1;
}

/// $C04452
ushort FindNearbyTalkableTPTEntry() {
	CurrentTPTEntry = -1;
	Unknown7E5D64 = -1;
	short x10 = UnknownC043BC();
	if ((x10 != -1) && (EntityDirections[gameState.currentPartyMembers] != x10)) {
		gameState.leaderDirection = x10;
		EntityDirections[gameState.currentPartyMembers] = x10;
		UnknownC0A780(gameState.currentPartyMembers);
	}
	return CurrentTPTEntry;
}

/// $C0449B
void UnknownC0449B() {
	gameState.unknown90 = 0;
	if (MushroomizedWalkingFlag != 0) {
		MushroomizationMovementSwap();
	}
	short x02 = MapInputToDirection(gameState.walkingStyle);
	if (BattleSwirlCountdown != 0) {
		if (--BattleSwirlCountdown != 0) {
			NPCCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
		} else {
			BattleDebug = -1;
		}
		return;
	}
	if (x02 == -1) {
		NPCCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
		return;
	}
	if (gameState.walkingStyle == WalkingStyle.Stairs) {
		if ((Unknown7E5DC4 == 0x100) || (Unknown7E5DC4 == 0x200)) {
			if (x02 <= Direction.DownRight) {
				x02 = Direction.UpRight;
			} else {
				x02 = Direction.DownLeft;
			}
		} else {
			if (((x02 - 1) & 7) <= Direction.DownRight) {
				x02 = Direction.DownRight;
			} else {
				x02 = Direction.UpLeft;
			}
		}
		if (x02 < Direction.Down) {
			gameState.leaderDirection = Direction.Right;
		} else {
			gameState.leaderDirection = Direction.Left;
		}
	} else if ((MiscDebugFlags & 1) == 0) {
		gameState.leaderDirection = x02;
	}
	Unknown7E2890++;
	gameState.unknown90++;
	short x22 = gameState.troddenTileType;
	FixedPoint1616 x12 = { combined: AdjustPositionHorizontal(x02, gameState.leaderX.combined, x22) };
	FixedPoint1616 x16 = { combined: AdjustPositionVertical(x02, gameState.leaderY.combined, x22) };
	Unknown7E5DA8 = 0xFFFF;
	short x04;
	if ((MiscDebugFlags & 2) == 0) {
		x04 = UnknownC05B7B(x12.integer, x16.integer, gameState.currentPartyMembers, x02);
		if (x02 != Unknown7E5DA6) {
			x12.combined = AdjustPositionHorizontal(Unknown7E5DA6, gameState.leaderX.combined, x22);
			x16.combined = AdjustPositionVertical(Unknown7E5DA6, gameState.leaderY.combined, x22);
		}
	} else if (Unknown7E0081 == 0) {
		x04 = UnknownC05FD1(x12.integer, x16.integer, gameState.currentPartyMembers) & 0x3F;
	} else {
		x04 = 0;
	}
	gameState.troddenTileType = x04;
	short x02_2 = 1;
	NPCCollisionCheck(x12.integer, x16.integer, gameState.currentPartyMembers);
	if (EntityCollidedObjects[23] != -1) {
		x02_2 = 0;
	}
	if ((x04 & 0xC0) != 0) {
		x02_2 = 0;
	}
	if (Unknown7E5DA8 != -1) {
		x02_2 = UnknownC07526(Unknown7E5DA8, Unknown7E5DAA);
	} else if ((gameState.walkingStyle == WalkingStyle.Ladder) || (gameState.walkingStyle == WalkingStyle.Rope)) {
		gameState.walkingStyle = WalkingStyle.Normal;
	}
	if (x02_2 != 0) {
		gameState.leaderX = x12;
		gameState.leaderY = x12;
	} else {
		gameState.unknown90 = 0;
	}
	if (((Unknown7E0002 & 1) == 0) && (Unknown7E5E3C[0].unknown0 != 0)) {
		UnknownC073C0(0);
	}
	if (((Unknown7E0002 & 1) != 0) && (Unknown7E5E3C[1].unknown0 != 0)) {
		UnknownC073C0(1);
	}
	if ((gameState.walkingStyle == WalkingStyle.Ladder) || (gameState.walkingStyle == WalkingStyle.Rope)) {
		gameState.leaderX.integer = cast(short)((Unknown7E5DA8 * 8) + 8);
	}
	if ((Debug != 0) && ((pad_state[0] & PAD_X) != 0)) {
		gameState.leaderX.integer &= 0xFFF8;
		gameState.leaderY.integer &= 0xFFF8;
	}
}

/// $C0476D
void UnknownC0476D() {
	short x04 = 0;
	if ((EntityAbsXTable[Unknown7E9E33] != gameState.leaderX.integer) || (EntityAbsYTable[Unknown7E9E33] != gameState.leaderY.integer) || (EntityAbsXFractionTable[Unknown7E9E33] != gameState.leaderX.fraction) || (EntityAbsYFractionTable[Unknown7E9E33] != gameState.leaderY.fraction)) {
		x04 = 1;
	}
	gameState.leaderX.integer = EntityAbsXTable[Unknown7E9E33];
	gameState.leaderY.integer = EntityAbsYTable[Unknown7E9E33];
	gameState.leaderX.fraction = EntityAbsXFractionTable[Unknown7E9E33];
	gameState.leaderY.fraction = EntityAbsYFractionTable[Unknown7E9E33];
	gameState.leaderDirection = EntityDirections[Unknown7E9E33];
	gameState.unknown90 = x04;
}

/// $C047CF
void UnknownC047CF() {
	if (BattleSwirlFlag != 0) {
		return;
	}
	if (BattleSwirlCountdown != 0) {
		BattleSwirlCountdown--;
		return;
	}
	short x14;
	switch (Unknown7E5DC6 & 0x300) {
		case 0x000:
			x14 = Direction.UpLeft;
			break;
		case 0x200:
			x14 = Direction.DownLeft;
			break;
		case 0x100:
			x14 = Direction.UpRight;
			break;
		case 0x300:
			x14 = Direction.DownRight;
			break;
		default:
			break;
	}
	Unknown7E5DA8 = 0xFFFF;
	UnknownC05B7B(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers, x14);
	if (Unknown7E5DA8 != -1) {
		UnknownC07526(Unknown7E5DA8, Unknown7E5DAA);
	}
	if (1 != 0) { //wat
		gameState.leaderX.combined += horizontalMovementSpeeds[WalkingStyle.Escalator].directionSpeeds[x14 * 4].combined;
		gameState.leaderY.combined += verticalMovementSpeeds[WalkingStyle.Escalator].directionSpeeds[x14 * 4].combined;
	}
	gameState.unknown90 = 1;
}

/// $C048D3
void UnknownC048D3(short arg1) {
	FixedPoint1616 x10;
	FixedPoint1616 x14;
	short x1E = MapInputToDirection(gameState.walkingStyle);
	short x02 = x1E;
	if (BattleSwirlCountdown != 0) {
		if (--BattleSwirlCountdown != 0) {
			NPCCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
			return;
		} else {
			BattleDebug = -1;
			return;
		}
	}
	if ((pad_press[0] & PAD_R) != 0) {
		PlaySfx(Sfx.BicycleBell);
	}
	if ((x1E == -1) || (arg1 != 0)) {
		x1E = gameState.leaderDirection;
	} else {
		NPCCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
		return;
	}
	if ((x1E & 1) != 0) {
		Unknown7E5D5A = 4;
	} else if (Unknown7E5D5A != 0) {
		if (--Unknown7E5D5A != 0) {
			x1E = gameState.leaderDirection;
		} else if (x02 == -1) {
			x1E = gameState.leaderDirection;
		}
	}
	gameState.leaderDirection = x1E;
	x10.combined = gameState.leaderX.combined + horizontalMovementSpeeds[WalkingStyle.Bicycle].directionSpeeds[x1E].combined;
	x14.combined = gameState.leaderY.combined + verticalMovementSpeeds[WalkingStyle.Bicycle].directionSpeeds[x1E].combined;
	Unknown7E5DA8 = 0xFFFF;
	short x1A = UnknownC05CD7(x10.integer, x14.integer, 0x18, x1E);
	NPCCollisionCheck(x10.integer, x14.integer, gameState.currentPartyMembers);
	if (EntityCollidedObjects[23] == -1) {
		gameState.unknown90++;
		Unknown7E2890++;
		if ((x1A & 0xC0) != 0) {
			gameState.unknown90 = 0;
		} else {
			gameState.leaderX.combined = x10.combined;
			gameState.leaderY.combined = x14.combined;
		}
	}
}

/// $C04A7B
void UnknownC04A7B() {
	gameState.unknownB0 = Unknown7E5D7A;
	UnknownC0D19B();
}

/// $C04A88
void UnknownC04A88() {
	Unknown7E5D7C = 12;
	Unknown7E5D7A = gameState.unknownB0;
	gameState.unknownB0 = 3;
	UnknownC0AC0C(2);
	OverworldStatusSuppression = 1;
}

/// $C04AAD
void UnknownC04AAD() {
	if (--Unknown7E5D7C != 0) {
		short x10 = MapInputToDirection(gameState.walkingStyle);
		if (x10 == -1) {
			return;
		}
		for (short i = 0x18; i <= 0x1D; i++) {
			if (EntityScriptTable[i] == -1) {
				continue;
			}
			if (EntityDirections[i] == x10) {
				continue;
			}
			Unknown7E4DC6 = &PartyCharacters[EntityScriptVar1Table[i]];
			if ((PlayerPositionBuffer[Unknown7E4DC6.position_index].walking_style == WalkingStyle.Rope) || (PlayerPositionBuffer[Unknown7E4DC6.position_index].walking_style == WalkingStyle.Ladder)) {
				continue;
			}
			EntityDirections[i] = x10;
			UnknownC0A780(i);
		}
		gameState.leaderDirection = x10;
	} else {
		UnknownC04A7B();
	}
}

/// $C04B53
void UnknownC04B53() {
	short x10;
	if (gameState.walkingStyle != WalkingStyle.Stairs) {
		x10 = gameState.leaderDirection;
	} else {
		x10 = Unknown7E5DCA;
	}
	switch (gameState.unknownB0) {
		case 1:
			gameState.leaderX.combined += horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[x10].combined;
			gameState.leaderY.combined += verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[x10].combined;
			if (--gameState.unknownB2 == 0) {
				gameState.unknownB0 = 0;
				gameState.walkingStyle = gameState.unknownB4;
			}
			gameState.unknown90 = 1;
			break;
		case 2:
			UnknownC0476D();
			break;
		case 3:
			UnknownC04AAD();
			break;
		default:
			break;
	}
}

/// $C04C45
void UnknownC04C45() {
	short x14 = gameState.unknown90;
	gameState.unknown90 = 0;
	if (Unknown7E5D58 != 0) {
		UnknownC07C5B();
		Unknown7E5D58--;
	}
	if ((Debug != 0) && ((pad_state[0] & PAD_X) != 0) && ((Unknown7E0002 & 0xF) != 0)) {
		return;
	}
	ChosenFourPtrs[EntityScriptVar1Table[gameState.currentPartyMembers]].position_index = gameState.unknown88;
	if (gameState.unknownB0 != 0) {
		UnknownC04B53();
	} else {
		switch (gameState.walkingStyle) {
			case WalkingStyle.Escalator:
				UnknownC047CF();
				break;
			case WalkingStyle.Bicycle:
				UnknownC048D3(x14);
				break;
			default:
				UnknownC0449B();
				break;
		}
	}
	short x12 = gameState.unknown88;
	PlayerPositionBufferEntry* x10 = &PlayerPositionBuffer[gameState.unknown88];
	gameState.troddenTileType = UnknownC05F82(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
	if (gameState.unknown90 != 0) {
		x10.x_coord = gameState.leaderX.integer;
		x10.y_coord = gameState.leaderY.integer;
		gameState.unknown88 = cast(short)(x12 + 1);
		CenterScreen(gameState.leaderX.integer, gameState.leaderY.integer);
		Unknown7E4DD4 = 1;
	} else {
		Unknown7E4DD4 = 0;
	}
	x10.tile_flags = gameState.troddenTileType;
	x10.walking_style = gameState.walkingStyle;
	x10.direction = gameState.leaderDirection;
	FootstepSoundIDOverride = 0;
	if ((gameState.troddenTileType & 8) != 0) {
		if ((gameState.troddenTileType & 4) != 0) {
			FootstepSoundIDOverride = 0x10;
		} else {
			FootstepSoundIDOverride = 0x12;
		}
	}
}

/// $C04D78
void UnknownC04D78() {
	if (gameState.unknownB0 == 3) {
		return;
	}
	if (BattleSwirlCountdown != 0) {
		return;
	}
	if (BattleSwirlFlag != 0) {
		return;
	}
	if (BattleDebug != 0) {
		return;
	}
	Unknown7E4DC6 = ChosenFourPtrs[EntityScriptVar1Table[CurrentEntitySlot]];
	EntityDirections[CurrentEntitySlot] = PlayerPositionBuffer[Unknown7E4DC6.position_index].direction;
	EntitySurfaceFlags[CurrentEntitySlot] = PlayerPositionBuffer[Unknown7E4DC6.position_index].tile_flags;
	UnknownC07A56(EntityScriptVar0Table[CurrentEntitySlot], PlayerPositionBuffer[Unknown7E4DC6.position_index].walking_style, CurrentEntitySlot);
	if (gameState.unknown90 == 0) {
		if (PlayerPositionBuffer[Unknown7E4DC6.position_index].walking_style != WalkingStyle.Escalator) {
			return;
		}
	}
	EntityAbsXTable[CurrentEntitySlot] = PlayerPositionBuffer[Unknown7E4DC6.position_index].x_coord;
	EntityAbsYTable[CurrentEntitySlot] = PlayerPositionBuffer[Unknown7E4DC6.position_index].y_coord;
	short x1C = 0;
	short x12 = void;
	if (EntityScriptVar0Table[CurrentEntitySlot] != gameState.unknown96[0]) {
		switch (PlayerPositionBuffer[Unknown7E4DC6.position_index].walking_style) {
			case WalkingStyle.Ladder:
			case WalkingStyle.Rope:
				x12 = 0x1E;
				break;
			case WalkingStyle.Escalator:
				if (gameState.walkingStyle == WalkingStyle.Normal) {
					x1C = 0x1;
				} else {
					x12 = 0x1E;
				}
				break;
			case WalkingStyle.Stairs:
				x12 = 0x18;
				break;
			default:
				if (gameState.unknown92 == 3) {
					x12 = 0x8;
				} else {
					x12 = 0xC;
				}
				break;
		}
	}
	Unknown7E4DC6.unknown65 = PlayerPositionBuffer[Unknown7E4DC6.position_index].walking_style;
	short x1A;
	if ((EntityScriptVar0Table[CurrentEntitySlot] + 1 != gameState.unknown96[0]) && (x1C == 0)) {
		//uh oh, x12 may not have been initialized
		x1A = UnknownC03EC3(EntityScriptVar0Table[CurrentEntitySlot], cast(short)(CharacterSizes[EntityScriptVar0Table[CurrentEntitySlot]] + x12), Unknown7E4DC6.position_index, 2);
	} else {
		x1A = cast(short)(Unknown7E4DC6.position_index + 1);
		EntityScriptVar7Table[CurrentEntitySlot] &= (0xFFFF ^ (1 << 12));
	}
	Unknown7E4DC6.position_index = x1A;
}

/// $C04EF0
void UnknownC04EF0() {
	Unknown7E4DC6 = ChosenFourPtrs[EntityScriptVar1Table[CurrentEntitySlot]];
	EntityDirections[CurrentEntitySlot] = PlayerPositionBuffer[Unknown7E4DC6.position_index].direction;
	EntitySurfaceFlags[CurrentEntitySlot] = PlayerPositionBuffer[Unknown7E4DC6.position_index].tile_flags;
	UnknownC07A56(EntityScriptVar0Table[CurrentEntitySlot], PlayerPositionBuffer[Unknown7E4DC6.position_index].walking_style, CurrentEntitySlot);
}

/// $C04F47
void UnknownC04F47() {
	CurrentTextPalette[0] = Unknown7E5D72;
	TM_MIRROR = 0x17;
	UnknownC0856B(8);
}

/// $C04F60
void UnknownC04F60() {
	if (BattleSwirlCountdown != 0) {
		return;
	}
	if (BattleSwirlFlag != 0) {
		return;
	}
	Unknown7E5D72 = CurrentTextPalette[0];
	CurrentTextPalette[0] = 0x1F;
	TM_MIRROR = 0;
	UnknownC0856B(8);
	ScheduleOverworldTask(1, &UnknownC04F47);
}

/// $C04F9F
void UnknownC04F9F(short arg1) {
	short x10 = arg1;
	PartyCharacter* x0E = ChosenFourPtrs[gameState.playerControlledPartyMembers[x10]];
	if ((x0E.maxHP * 20) / 100 <= x0E.hp.current.integer) {
		if (Unknown7E5D8C[x10] == 0) {
			ShowHPAlert(cast(short)(x0E.unknown53 + 1));
		}
		Unknown7E5D8C[x10] = 1;
	} else {
		Unknown7E5D8C[x10] = 0;
	}
}

/// $C04FFE
ushort UnknownC04FFE() {
	ushort result = 0;
	ushort x02;
	ushort x04;
	ushort x16;
	if (gameState.unknownB0 == 2) {
		return 1;
	}
	if (OverworldStatusSuppression != 0) {
		return 1;
	}
	for(x02 = 0; (gameState.unknown96[x02] != 0) && (gameState.unknown96[x02] <= 4); x02++) {
		Unknown7E4DC6 = ChosenFourPtrs[gameState.playerControlledPartyMembers[x02]];
		const affliction = Unknown7E4DC6.afflictions[0];
		if ((affliction == 1) || (affliction == 2)) {
			continue;
		}
		if (affliction == 5) {
			if (Unknown7E5D66[x02] == 0) {
				Unknown7E5D66[x02] = 0x78;
			} else if (!--Unknown7E5D66[x02]) {
				x04++;
				Unknown7E4DC6.hp.current.integer -= 10;
				Unknown7E4DC6.hp.target -= 10;
				UnknownC04F9F(x02);
			}
		} else if (((affliction < 4) && ((gameState.troddenTileType & 0xC) == 0xC)) || ((affliction >= 4) && (affliction <= 7))) {
			if (Unknown7E5D66[x02] == 0) {
				if (affliction == 4) {
					Unknown7E5D66[x02] = 0x78;
				} else {
					Unknown7E5D66[x02] = 0xF0;
				}
			} else if (!--Unknown7E5D66[x02]) {
				x04++;
				if (affliction == 4) {
					Unknown7E4DC6.hp.current.integer -= 10;
					Unknown7E4DC6.hp.target -= 10;
				} else {
					Unknown7E4DC6.hp.current.integer -= 2;
					Unknown7E4DC6.hp.target -= 2;
				}
				UnknownC04F9F(x02);
			}
		}
		if (Unknown7E4DC6.hp.current.integer <= 0) {
			if (affliction != 1) {
				for (short i = 0; i < 6; i++) {
					Unknown7E4DC6.afflictions[i] = 0;
				}
				Unknown7E4DC6.afflictions[0] = 1;
				Unknown7E4DC6.hp.target = 0;
				Unknown7E4DC6.hp.current.integer = 0;
				EntityScriptVar3Table[Unknown7E4DC6.unknown59] = 0x10;
				x16++;
			}
		} else {
			if (affliction != 2) {
				result += Unknown7E4DC6.hp.current.integer;
			}
		}
	}
	if (x04 != 0) {
		UnknownC04F60();
	}
	if (x16 != 0) {
		Unknown7E4DC4 = 0;
		UpdateParty();
		UnknownC07B52();
		UnknownC09451();
	}
	return result;
}

/// $C05200
void UnknownC05200() {
	if (BattleDebug != 0) {
		return;
	}
	if ((Unknown7E9F6F == 0) && (Unknown7E9F6B != -1)) {
		UnknownC07716();
	} else if (Unknown7E9F6B != -1) {
		UnknownC0777A();
	}
	if (LoadedAnimatedTileCount != 0) {
		AnimateTileset();
	}
	if (Unknown7E4474 != 0) {
		AnimateTileset();
	}
	if (Unknown7E9F2A != 0) {
		ProcessItemTransformations();
	}
	UnknownC04C45();
	const x = gameState.leaderX.integer >> 8;
	const y = gameState.leaderY.integer >> 8;
	if (((x^Unknown7E5D5C) != 0) && ((y^Unknown7E5D5E) != 0)) {
		Unknown7E5D5C = x;
		Unknown7E5D5E = y;
		if (SectorBoundaryBehaviourFlag) {
			UnknownC03C25();
		}
	}
	if ((DadPhoneTimer == 0) && (gameState.unknownB0 != 2)) {
		LoadDadPhone();
	}
	Unknown7E9F6F = 0;
	Unknown7E5D76 = gameState.leaderDirection;
	Unknown7E5D78 = cast(short)(gameState.currentPartyMembers * 2);
	if (gameState.unknown90) {
		Unknown7E0A34 = 1;
	}
}

/// $C052AA
short InitBattleCommon() {
	FadeOutWithMosaic(1, 1, 0);
	short result = BattleRoutine();
	UpdateParty();
	Unknown7E4DC4 = 1;
	BattleDebug = 0;
	return result;
}

/// $C052D4
void UnknownC052D4(short arg1) {
	short x26 = 0xFF;
	gameState.unknown88 = 0xFF;
	short x24 = gameState.leaderX.integer;
	short x22 = gameState.leaderY.integer;
	short x20 = gameState.troddenTileType;
	short x1E = gameState.walkingStyle;
	FixedPoint1616 x12 = { combined: AdjustPositionHorizontal((arg1 + 4) & 7, gameState.leaderX.combined, gameState.troddenTileType) - gameState.leaderX.combined };
	FixedPoint1616 x16 = { combined: AdjustPositionVertical((arg1 + 4) & 7, gameState.leaderY.combined, gameState.troddenTileType) - gameState.leaderY.combined };
	short x1C = 0x100;
	while(x1C != 0) {
		x1C--;
		PlayerPositionBuffer[x1C].x_coord = x24;
		PlayerPositionBuffer[x1C].y_coord = x22;
		PlayerPositionBuffer[x1C].tile_flags = x20;
		PlayerPositionBuffer[x1C].walking_style = x1E;
		PlayerPositionBuffer[x1C].direction = arg1;
		PlayerPositionBuffer[x1C].unknown10 = 0;
		x24 += x12.integer;
		x22 += x16.integer;
	}
	for (short i = 0; i < gameState.partyCount; i++) {
		PartyCharacters[gameState.playerControlledPartyMembers[i]].position_index = x26;
		PartyCharacters[gameState.playerControlledPartyMembers[i]].unknown65 = 0xFFFF;
		PartyCharacters[gameState.playerControlledPartyMembers[i]].unknown55 = 0xFFFF;
		EntityAbsXTable[gameState.unknownA2[i]] = PlayerPositionBuffer[x26].x_coord;
		EntityAbsYTable[gameState.unknownA2[i]] = PlayerPositionBuffer[x26].y_coord;
		EntityDirections[gameState.unknownA2[i]] = PlayerPositionBuffer[x26].direction;
		EntitySurfaceFlags[gameState.unknownA2[i]] = PlayerPositionBuffer[x26].tile_flags;
		x26 -= 16;
	}
}

/// $C0546B
short UnknownC0546B() {
	short x10 = 0;
	for (short i = 0; i != gameState.partyCount; i++) {
		if (gameState.unknown96[i] > 4) {
			continue;
		}
		x10 += PartyCharacters[gameState.unknown96[i]].level;
	}
	return x10;
}

/// $C054C9
short UnknownC054C9(short arg1, short arg2) {
	short y = Unknown7EE000[arg2 & 0x3F][arg1 & 0x3F];
	if ((y & 0x10) != 0) {
		Unknown7E5DA8 = arg1;
		Unknown7E5DAA = arg2;
	}
	return y;
}

/// $C05503
void UnknownC05503(short arg1, short arg2) {
	ushort x10 = cast(ushort)(Unknown7EE000[(Unknown7E5DAE / 8) & 0x3F][(arg1 / 8) & 0x3F] | Unknown7E5DA4);
	short x14 = (arg1 + 7) / 8;
	for (short i = 0; i < UnknownC42AA7[arg2]; i++) {
		x10 |= Unknown7EE000[Unknown7E5DAE / 8][x14 & 0x3F];
		x14++;
	}
	Unknown7E5DA4 = x10;
}

/// $C0559C
void UnknownC0559C(short arg1, short arg2) {
	ushort y = cast(ushort)(Unknown7EE000[((((UnknownC42AC9[arg2] * 8) + Unknown7E5DAE - 1) / 8) & 0x3F)][(arg1 / 8) & 0x3F] | Unknown7E5DA4);
	short x12 = (arg1 + 7) / 8;
	for (short i = 0; i < UnknownC42AA7[arg2]; i++) {
		y |= Unknown7EE000[(((UnknownC42AC9[arg2] * 8) + Unknown7E5DAE - 1) / 8) & 0x3F][x12 & 0x3F];
		x12++;
	}
	Unknown7E5DA4 = y;
}

/// $C05639
void UnknownC05639(short arg1, short arg2) {
	ushort x10 = cast(ushort)(Unknown7EE000[(arg1 / 8) & 0x3F][(Unknown7E5DAC / 8) & 0x3F] | Unknown7E5DA4);
	short x12 = (arg1 + 7) / 8;
	for (short i = 0; i < UnknownC42AC9[arg2]; i++) {
		x10 |= Unknown7EE000[x12 & 0x3F][(Unknown7E5DAC / 8) & 0x3F];
		x12++;
	}
	Unknown7E5DA4 = x10;
}

/// $C056D0
void UnknownC056D0(short arg1, short arg2) {
	ushort y = cast(ushort)(Unknown7EE000[(arg1 / 8) & 0x3F][(((UnknownC42AA7[arg2] * 8) + Unknown7E5DAC - 1) / 8) & 0x3F] | Unknown7E5DA4);
	short x12 = (arg1 + 7) / 8;
	for (short i = 0; i < UnknownC42AC9[arg2]; i++) {
		y |= Unknown7EE000[x12 & 0x3F][(((UnknownC42AA7[arg2] * 8) + Unknown7E5DAC - 1) / 8) & 0x3F];
		x12++;
	}
	Unknown7E5DA4 = y;
}

/// $C05769
short UnknownC05769(short arg1) {
	short x02 = 0;
	short x12 = 0;
	for (short i = 0; i < 6; i++, x02 >>= 2, arg1 >>= 2) {
		if ((arg1 & 1) == 0) {
			continue;
		}
		short x0E = UnknownC054C9((UnknownC200B9[i] + Unknown7E5DAC) / 8, (UnknownC200C5[i] + Unknown7E5DAE) / 8);
		x12 |= x0E;
		if ((x0E & 0xC0) != 0) {
			x02 |= 0x40;
		}
	}
	if (Unknown7E5DB4 == 1) {
		Unknown7E5DA4 = x12;
	}
	return x02;
}

/// $C057E8
short UnknownC057E8() {
	Unknown7E5DA4 = 0;
	Unknown7E5DB4++;
	Unknown7E5DB6 = UnknownC05769(7);
	if ((Unknown7E5DB6 == 7) || (Unknown7E5DB6 == 2)) {
		return -256;
	}
	if (Unknown7E5DB6 == 0) {
		return -1;
	}
	if (Unknown7E5DB6 == 1) {
		return Direction.UpRight;
	}
	if (Unknown7E5DB6 == 4) {
		return Direction.UpLeft;
	}
	if ((Unknown7E5DB6 == 6) && ((Unknown7E5DAC & 7) == 0)) {
		return Direction.UpLeft;
	}
	return -1;
}

/// $C0583C
short UnknownC0583C() {
	Unknown7E5DA4 = 0;
	Unknown7E5DB4++;
	Unknown7E5DB6 = UnknownC05769(0x38);
	if ((Unknown7E5DB6 == 7) || (Unknown7E5DB6 == 0x10)) {
		return -256;
	}
	if (Unknown7E5DB6 == 0) {
		return -1;
	}
	if (Unknown7E5DB6 == 8) {
		return Direction.DownRight;
	}
	if (Unknown7E5DB6 == 0x20) {
		return Direction.DownLeft;
	}
	if ((Unknown7E5DB6 == 0x30) && ((Unknown7E5DAC & 7) == 0)) {
		return Direction.DownLeft;
	}
	return -1;
}

/// $C05890
short UnknownC05890() {
	short x12 = -1;
	short x02 = 0;
	short x10 = 0;
	Unknown7E5DA4 = 0;
	Unknown7E5DB4 = 1;
	short x0E = UnknownC05769(9);
	if (x0E == 0) {
		Unknown7E5DAC -= 4;
		x0E = UnknownC05769(9);
		if (x0E == 0) {
			return Direction.Left;
		}
		x02 = 1;
	}
	if (((x0E & 9) == 9) && ((Unknown7E5DAE & 7) != 0)) {
		if (x02 != 0) {
			return Direction.Left;
		}
		return -1;
	}
	if ((Unknown7EE000[((Unknown7E5DAE - 2) / 8) & 0x3F][((Unknown7E5DAC - 4) / 8) & 0x3F] & 0xC0) != 0) {
		x10 |= 1;
	}
	if ((Unknown7EE000[((Unknown7E5DAE + 9) / 8) & 0x3F][((Unknown7E5DAC - 4) / 8) & 0x3F] & 0xC0) != 0) {
		x10 |= 2;
	}
	switch (x0E) {
		case 9:
			if (x10 == 1) {
				x12 = Direction.DownLeft;
			} else if (x10 == 2) {
				x12 = Direction.UpLeft;
			} else if (x10 == 0) {
				if ((Unknown7E5DAE & 7) < 4) {
					x12 = Direction.UpLeft;
				} else {
					x12 = Direction.DownLeft;
				}
			}
			break;
		case 1:
			if ((x10 & 2) == 0) {
				x12 = Direction.DownLeft;
			}
			break;
		case 8:
			if ((x10 & 1) == 0) {
				x12 = Direction.UpLeft;
			}
			break;
		default: break;
	}
	if ((x02 != 0) && (x12 == -1)) {
		return Direction.Left;
	}
	return x12;
}

/// $C059EF
short UnknownC059EF() {
	short x12 = -1;
	short x02 = 0;
	short x10 = 0;
	Unknown7E5DA4 = 0;
	Unknown7E5DB4 = 1;
	short x0E = UnknownC05769(0x24);
	if (x0E == 0) {
		Unknown7E5DAC += 4;
		x0E = UnknownC05769(36);
		if (x0E == 0) {
			return Direction.Right;
		}
		x02 = 1;
	}
	if (((x0E & 0x24) == 0x24) && ((Unknown7E5DAE & 7) != 0)) {
		if (x02 != 0) {
			return Direction.Right;
		}
		return -1;
	}
	if ((Unknown7EE000[((Unknown7E5DAE - 2) / 8) & 0x3F][((Unknown7E5DAC + 4) / 8) & 0x3F] & 0xC0) != 0) {
		x10 |= 1;
	}
	if ((Unknown7EE000[((Unknown7E5DAE + 9) / 8) & 0x3F][((Unknown7E5DAC + 4) / 8) & 0x3F] & 0xC0) != 0) {
		x10 |= 2;
	}
	switch (x0E) {
		case 0x24:
			if (x10 == 1) {
				x12 = Direction.DownRight;
			} else if (x10 == 2) {
				x12 = Direction.UpRight;
			} else if (x10 == 0) {
				if ((Unknown7E5DAE & 7) < 4) {
					x12 = Direction.UpRight;
				} else {
					x12 = Direction.DownRight;
				}
			}
			break;
		case 0x04:
			if ((x10 & 2) == 0) {
				x12 = Direction.DownRight;
			}
			break;
		case 0x20:
			if ((x10 & 1) == 0) {
				x12 = Direction.UpRight;
			}
			break;
		default: break;
	}
	if ((x02 != 0) && (x12 == -1)) {
		return Direction.Right;
	}
	return x12;
}

/// $C05B4E
short UnknownC05B4E(short arg1) {
	Unknown7E5DA4 = 0;
	Unknown7E5DB4++;
	return (UnknownC05769(UnknownC200D1[arg1 / 2]) != 0) ? -256 : arg1;
}

/// $C05B7B
short UnknownC05B7B(short arg1, short arg2, short arg3, short arg4) {
	Unknown7E5DB8 = 0;
	Unknown7E5DB4 = 0;
	Unknown7E5DA4 = 0;
	Unknown7E5DA6 = arg4;
	Unknown7E5DA2 = arg4;
	Unknown7E5DAC = arg1;
	Unknown7E5DAE = arg2;
	short x12;
	switch (arg4) {
		case Direction.Up:
			x12 = UnknownC057E8();
			if (x12 != -1) {
				break;
			}
			short x10 = Unknown7E5DA8;
			if ((Unknown7E5DAE & 7) < 5) {
				Unknown7E5DAE -= 4;
				short x0E = UnknownC057E8();
				if ((x0E & 0xFF00) != 0xFF00) {
					x12 = x0E;
				}
			}
			Unknown7E5DA8 = x10;
			break;
		case Direction.Down:
			x12 = UnknownC0583C();
			if (x12 != -1) {
				break;
			}
			short x10 = Unknown7E5DA8;
			if ((Unknown7E5DAE & 7) > 3) {
				Unknown7E5DAE += 4;
				short x0E = UnknownC0583C();
				if ((x0E & 0xFF00) != 0xFF00) {
					x12 = x0E;
				}
			}
			Unknown7E5DA8 = x10;
			break;
		case Direction.Left:
			x12 = UnknownC05890();
			break;
		case Direction.Right:
			x12 = UnknownC059EF();
			break;
		case Direction.UpLeft:
		case Direction.UpRight:
		case Direction.DownLeft:
		case Direction.DownRight:
			x12 = UnknownC05B4E(arg4);
			if (x12 != -256) {
				x12 = arg4;
			}
			break;
		default: break;
	}
	if (Unknown7E5D9A != 0) {
		Unknown7E5DA8 = 0xFFFF;
	}
	if ((x12 == -1) || (x12 == -256)) {
		return Unknown7E5DA4;
	}
	Unknown7E5DB8 = (x12 != arg4) ? 1 : 0;
	Unknown7E5DA6 = x12;
	return Unknown7E5DA4 & 0x3F;
}

/// $C05CD7
short UnknownC05CD7(short arg1, short arg2, short arg3, short arg4) {
	Unknown7E5DA4 = 0;
	Unknown7E5DAC = cast(short)(arg1 - UnknownC42A1F[EntitySizes[arg3]]);
	Unknown7E5DAE = cast(short)(arg2 - UnknownC42A41[EntitySizes[arg3]] + UnknownC42AEB[EntitySizes[arg3]]);
	switch(arg4) {
		case 1:
			UnknownC056D0(Unknown7E5DAE, EntitySizes[arg3]);
			goto case;
		case 0:
			UnknownC05503(Unknown7E5DAC, EntitySizes[arg3]);
			break;
		case 3:
			UnknownC0559C(Unknown7E5DAC, EntitySizes[arg3]);
			goto case;
		case 2:
			UnknownC056D0(Unknown7E5DAE, EntitySizes[arg3]);
			break;
		case 5:
			UnknownC05639(Unknown7E5DAE, EntitySizes[arg3]);
			goto case;
		case 4:
			UnknownC0559C(Unknown7E5DAC, EntitySizes[arg3]);
			break;
		case 7:
			UnknownC05503(Unknown7E5DAC, EntitySizes[arg3]);
			goto case;
		case 6:
			UnknownC05639(Unknown7E5DAE, EntitySizes[arg3]);
			break;
		default: break;
	}
	return Unknown7E5DA4;
}

/// $C05D8B
short UnknownC05D8B(short arg1, short arg2, short arg3) {
	short x0E = cast(short)(arg1 - UnknownC42A1F[arg3]);
	Unknown7E5DAC = x0E;
	Unknown7E5DAE = cast(short)(arg2 - UnknownC42A41[arg3] + UnknownC42AEB[arg3]);
	UnknownC05503(x0E, arg3);
	UnknownC0559C(Unknown7E5DAC, arg3);
	UnknownC05639(Unknown7E5DAE, arg3);
	UnknownC056D0(Unknown7E5DAE, arg3);
	return Unknown7E5DA4;
}

/// $C05DE7
short UnknownC05DE7(short arg1, short arg2, short arg3) {
	short x = 0;
	switch (arg1 & 0xC) {
		case 0:
			x = 4;
			break;
		case 4:
			x = 2;
			break;
		case 8:
		case 0xC:
			x = 1;
			break;
		default: break;
	}
	if ((EnemyConfigurationTable[arg3].runFlag & x) != 0) {
		return 0;
	}
	return 0x80;
}

/// $C05E3B
short UnknownC05E3B(short arg1) {
	if (UnknownC09EFF() == 0) {
		return -256;
	}
	EntityObstacleFlags[arg1] = UnknownC05CD7(Unknown7E2848, Unknown7E284A, arg1, EntityDirections[arg1]) & 0xD0;
	return EntityObstacleFlags[arg1];
}

/// $C05E76
short UnknownC05E76() {
	return cast(ubyte)UnknownC05E3B(CurrentEntitySlot);
}

/// $C05E82
short UnknownC05E82() {
	short x0E = UnknownC05E3B(CurrentEntitySlot);
	if (x0E == -256) {
		return 0;
	}
	if (x0E != 0) {
		return 0;
	}
	short x04 = UnknownC05DE7(x0E, CurrentEntitySlot, EntityEnemyIDs[CurrentEntitySlot]);
	EntityObstacleFlags[CurrentEntitySlot] |= x04;
	return x04;
}

/// $C05ECE
short UnknownC05ECE() {
	if (UnknownC09EFF() == 0) {
		return 0;
	}
	short x02 = UnknownC05F82(Unknown7E2848, Unknown7E284A, CurrentEntitySlot) & 0xD0;
	EntityObstacleFlags[CurrentEntitySlot] = x02;
	if (x02 != 0) {
		return 0;
	}
	ushort tmp = x02 | UnknownC05DE7(x02, CurrentEntitySlot, EntityEnemyIDs[CurrentEntitySlot]);
	EntityObstacleFlags[CurrentEntitySlot] = tmp;
	return tmp;
}

/// $C05F33
short UnknownC05F33(short x, short y, short entityID) {
	const size = EntitySizes[entityID];
	Unknown7E5DA4 = 0;
	Unknown7E5DAC = cast(short)(x - UnknownC42A1F[size]);
	Unknown7E5DAE = cast(short)(y - UnknownC42A41[size] + UnknownC42AEB[size]);
	UnknownC05639(Unknown7E5DAE, size);
	UnknownC056D0(Unknown7E5DAE, size);
	return Unknown7E5DA4;
}

/// $C05F82
short UnknownC05F82(short x, short y, short entityID) {
	Unknown7E5DA4 = 0;
	const size = EntitySizes[entityID];
	Unknown7E5DAE = cast(short)(y - UnknownC42A41[size] + UnknownC42AEB[size]);
	Unknown7E5DAC = cast(short)(x + UnknownC42A1F[size]);
	UnknownC05503(Unknown7E5DAC, size);
	UnknownC0559C(Unknown7E5DAC, size);
	return Unknown7E5DA4;
}

/// $C05FD1
short UnknownC05FD1(short arg1, short arg2, short arg3) {
	Unknown7E5DA4 = 0;
	Unknown7E5DA4 = UnknownC054C9(arg1 / 8, (arg2 + 4) / 8);
	return Unknown7E5DA4;
}

/// $C05FF6
short NPCCollisionCheck(short x, short y, short arg3) {
	short result = -1;
	if ((Unknown7E332A[arg3] != 0) && ((MiscDebugFlags & 2) == 0) && (gameState.walkingStyle != WalkingStyle.Escalator) && (Unknown7E0081 == 0)) {
		short x18;
		short x04;
		if ((EntityDirections[arg3] == Direction.Right) || (EntityDirections[arg3] == Direction.Left)) {
			x18 = Unknown7E33DE[arg3];
			x04 = Unknown7E1A4A[arg3];
		} else {
			x18 = Unknown7E3366[arg3];
			x04 = Unknown7E33A2[arg3];
		}
		y -= x04;
		for (short i = 0; i != 0x17; i++) {
			if (EntityScriptTable[i] == -1) {
				continue;
			}
			if (EntityCollidedObjects[i] == 0x8000) {
				continue;
			}
			if ((Unknown7E5D58 != 0) && (EntityTPTEntries[i] + 1 >= 0x8001)){
				continue;
			}
			if (Unknown7E332A[i] == 0) {
				continue;
			}
			short yReg;
			short x10;
			if ((EntityDirections[i] == Direction.Right) || (EntityDirections[i] == Direction.Left)) {
				yReg = Unknown7E33DE[i];
				x10 = Unknown7E1A4A[i];
			} else {
				yReg = Unknown7E3366[i];
				x10 = Unknown7E33A2[i];
			}
			if (EntityAbsYTable[i] - x10 - x04 >= y) {
				continue;
			}
			if (x10 + EntityAbsYTable[i] - x10 <= y) {
				continue;
			}
			if (EntityAbsXTable[i] - yReg - x18 * 2 >= x) {
				continue;
			}
			if (EntityAbsXTable[i] - yReg + yReg * 2 <= y) {
				continue;
			}
			result = i;
			break;
		}

	}
	EntityCollidedObjects[23] = result;
	return result;
}

/// $C0613C
void UnknownC0613C(short arg1, short arg2, short arg3) {
	short x1A;
	if (Unknown7E332A[arg3] != 0) {
		short x18;
		short x04;
		if ((EntityDirections[arg3] == Direction.Right) || (EntityDirections[arg3] == Direction.Left)) {
			x18 = Unknown7E33DE[arg3];
			x04 = Unknown7E1A4A[arg3];
		} else {
			x18 = Unknown7E3366[arg3];
			x04 = Unknown7E33A2[arg3];
		}
		short x16 = cast(short)(arg1 - x18);
		short x14 = cast(short)(x18 * 2);
		short x1C = cast(short)(arg2 - x04);
		for (short i = 0; i < MAX_ENTITIES; i++) {
			if (i == arg3) {
				continue;
			}
			if (i == 0x17) {
				continue;
			}
			if (EntityScriptTable[i] == -1) {
				continue;
			}
			if (EntityCollidedObjects[i] == 0x8000) {
				continue;
			}
			if (Unknown7E332A[i] == 0) {
				continue;
			}
			short y;
			short x10;
			if ((EntityDirections[i] == Direction.Right) || (EntityDirections[i] == Direction.Left)) {
				y = Unknown7E33DE[i];
				x10 = Unknown7E1A4A[i];
			} else {
				y = Unknown7E3366[i];
				x10 = Unknown7E33A2[i];
			}
			if (EntityAbsYTable[i] - x10 - x04 >= x1C) {
				continue;
			}
			if (x10 + EntityAbsYTable[i] - x10 <= x1C) {
				continue;
			}
			if (EntityAbsXTable[i] - y - x14 >= x16) {
				continue;
			}
			if (EntityAbsXTable[i] - y + y * 2 <= x16) {
				continue;
			}
			x1A = i;
			break;
		}
	}
	EntityCollidedObjects[arg3] = x1A;
}

/// $C06267
short UnknownC06267(short arg1, short arg2, short arg3) {
	short x1A = -1;
	if (Unknown7E332A[arg3] != 0) {
		short x02;
		short x16;
		if ((EntityDirections[arg3] == Direction.Right) || (EntityDirections[arg3] == Direction.Left)) {
			x02 = Unknown7E33DE[arg3];
			x16 = Unknown7E1A4A[arg3];
		} else {
			x02 = Unknown7E3366[arg3];
			x16 = Unknown7E33A2[arg3];
		}
		short x04 = cast(short)(arg1 - x02);
		short x18 = cast(short)(x02 * 2);
		short x14 = cast(short)(arg2 - x16);
		if (Unknown7E5D58 == 0) {
			for (short i = 0x18; i < MAX_ENTITIES; i++) {
				if (EntityScriptTable[i] == -1) {
					continue;
				}
				if (EntityCollidedObjects[i] == 0x8000) {
					continue;
				}
				if (Unknown7E332A[i] == 0) {
					continue;
				}
				short x10;
				short x12;
				if ((EntityDirections[i] == Direction.Right) || (EntityDirections[i] == Direction.Left)) {
					x12 = Unknown7E33DE[i];
					x10 = Unknown7E1A4A[i];
				} else {
					x12 = Unknown7E3366[i];
					x10 = Unknown7E33A2[i];
				}
				Unknown7E00C0 = x14;
				if (Unknown7E00C0 <= EntityAbsYTable[i] - x10 - x16) {
					continue;
				}
				if (x14 >= EntityAbsYTable[i] - x10 + x10) {
					continue;
				}
				if (x04 <= EntityAbsXTable[i] - x12 - x18) {
					continue;
				}
				if (x04 >= EntityAbsXTable[i] - x12 + x12 * 2) {
					continue;
				}
				x1A = i;
				goto Unknown26;
			}
		}
		for (short i = 0; i < 0x17; i++) {
			if (i == arg3) {
				continue;
			}
			if (EntityScriptTable[i] == -1) {
				continue;
			}
			if (EntityTPTEntries[i] >= 0x1000) {
				continue;
			}
			if (EntityCollidedObjects[i] == 0x8000) {
				continue;
			}
			if (Unknown7E332A[i] == 0) {
				continue;
			}
			short x10;
			short x12;
			if ((EntityDirections[i] == Direction.Right) || (EntityDirections[i] == Direction.Left)) {
				x12 = Unknown7E33DE[i];
				x10 = Unknown7E1A4A[i];
			} else {
				x12 = Unknown7E3366[i];
				x10 = Unknown7E33A2[i];
			}
			Unknown7E00C0 = x14;
			if (Unknown7E00C0 <= EntityAbsYTable[i] - x10 - x16) {
				continue;
			}
			if (x14 >= EntityAbsYTable[i] - x10 + x10 - 1) {
				continue;
			}
			if (x04 <= EntityAbsXTable[i] - x12 - x18) {
				continue;
			}
			if (x04 >= EntityAbsXTable[i] - x12 + x12 * 2 - 1) {
				continue;
			}
			x1A = i;
			goto Unknown26;
		}
	}
	Unknown26:
	EntityCollidedObjects[arg3] = x1A;
	return x1A;
}

/// $C06478
void UnknownC06478() {
	if (EntityCollidedObjects[CurrentEntitySlot] == 0x8000) {
		return;
	}
	UnknownC09EFFEntry2(CurrentEntitySlot);
	UnknownC06267(Unknown7E2848, Unknown7E284A, CurrentEntitySlot);
}

/// $C064A6
void UnknownC064A6() {
	if (EntityCollidedObjects[CurrentEntitySlot] == 0x8000) {
		return;
	}
	UnknownC09EFFEntry2(CurrentEntitySlot);
	UnknownC0613C(Unknown7E2848, Unknown7E284A, CurrentEntitySlot);
}

/// $C064D4
void UnknownC064D4() {
	NextQueuedInteraction = 0;
	CurrentQueuedInteraction = 0;
	CurrentQueuedInteractionType = -1;
}

/// $C064E3
void UnknownC064E3(short arg1, QueuedInteractionPtr arg2) {
	if (arg1 == CurrentQueuedInteractionType) {
		return;
	}
	QueuedInteractions[NextQueuedInteraction].type = arg1;
	QueuedInteractions[NextQueuedInteraction].ptr = arg2;
	NextQueuedInteraction = (NextQueuedInteraction + 1) & 3;
	Unknown7E5D9A = 1;
}

/// $C06537
short UnknownC06537() {
	return QueuedInteractions[CurrentQueuedInteraction].type;
}

/// $C0654E
QueuedInteractionPtr UnknownC0654E() {
	return QueuedInteractions[CurrentQueuedInteraction].ptr;
}

/// $C06578
void UnknownC06578(short arg1, short arg2) {
	Unknown7E5E06[Unknown7E5E36].unknown0 = arg1;
	Unknown7E5E06[Unknown7E5E36].unknown2 = arg2;
	Unknown7E5E36++;
}

/// $C065A3
void UnknownC065A3() {
	while (Unknown7E5E36 != 0) {
		Unknown7E5E36--;
		CreatePreparedEntitySprite(Unknown7E5E06[Unknown7E5E36].unknown0, Unknown7E5E06[Unknown7E5E36].unknown2);
	}
}

/// $C065C2
void UnknownC065C2(short direction) {
	short x0E = cast(short)((gameState.leaderX.integer / 8) + UnknownC3E230[direction]);
	short x02 = cast(short)((gameState.leaderY.integer / 8) + UnknownC3E240[direction]);
	if (direction == Direction.Left) {
		x0E--;
	}
	short x = UnknownC07477(x0E, x02);
	if (x == -1) {
		x = UnknownC07477(cast(short)(x0E + 1), x02);
	}
	if ((x != -1) && (x != 6)) {
		Unknown7E5DDC = Unknown7E5DBE;
		//Unknown7E5DDE = doorData[Unknown7E5DBC & 0x7FFF]

		//not sure if this is the correct type...
		Unknown7E5DDE = &Unknown7E5DBC.entryA.textPtr[0];
		CurrentTPTEntry = -2;
	}
}

/// $C06662
void ScreenTransition(short arg1, short arg2) {
	short x02 = ScreenTransitionConfigTable[arg1].duration == 0xFF ? 900 : ScreenTransitionConfigTable[arg1].duration;
	UnknownC42631(ScreenTransitionConfigTable[arg1].unknown5, ScreenTransitionConfigTable[arg1].direction * 4);
	if (arg2 == 1) {
		UnknownC0943C();
		UnknownC0DD2C(2);
		if (ScreenTransitionConfigTable[arg1].animationID != 0) {
			UnknownC4A67E(ScreenTransitionConfigTable[arg1].animationID, ScreenTransitionConfigTable[arg1].animationFlags + 2);
		}
		UnknownC4954C(ScreenTransitionConfigTable[arg1].fadeStyle, &palettes[0][0]);
		UnknownC496E7(x02, -1);
		for (short i = 0; i < x02; i++) {
			if (Unknown7E0030 != 0) {
				WaitUntilNextFrame();
			}
			UnknownC426ED();
			OAMClear();
			UnknownC4268A();
			UnknownC426C7();
			UnknownC09466();
			UpdateScreen();
			UnknownC4A7B0();
			WaitUntilNextFrame();
		}
		if (ScreenTransitionConfigTable[arg1].fadeStyle <= 50) {
			UnknownC08726();
		} else {
			memset(&palettes[0][0], 0xFF, 0x200);
			UnknownC0856B(0x18);
			WaitUntilNextFrame();
			Unknown7E4676 = 1;
		}
		UnknownC09451();
	} else {
		short x1D = (ScreenTransitionConfigTable[arg1].fadeStyle <= 50) ? 1 : 0;
		if (x1D != 0) {
			FadeIn(1, 1);
		} else {
			UnknownC496E7(ScreenTransitionConfigTable[arg1].secondaryDuration, -1);
		}
		if (ScreenTransitionConfigTable[arg1].secondaryAnimationID != 0) {
			UnknownC4A67E(ScreenTransitionConfigTable[arg1].secondaryAnimationID, ScreenTransitionConfigTable[arg1].secondaryAnimationFlags);
		}
		for (short i = 0; i < ScreenTransitionConfigTable[arg1].secondaryDuration; i++) {
			if (arg1 == 0) {
				if (Unknown7E0030 != 0) {
					WaitUntilNextFrame();
				}
				UnknownC426ED();
			}
			OAMClear();
			UnknownC09466();
			UnknownC4A7B0();
			UpdateScreen();
			WaitUntilNextFrame();
			if (i == 1) {
				UnknownC0943C();
			}
		}
		if (x1D == 0) {
			UnknownC49740();
		}
	}
	if (CurrentGiygasPhase < GiygasPhase.StartPraying) {
		UnknownC2EAAA();
	}
	UnknownC09451();
	Unknown7E5DAA = 0;
	Unknown7E5DA8 = 0;
}

/// $C068AF
short GetScreenTransitionSoundEffect(short transition, short getStart) {
	if (getStart == 0) {
		return ScreenTransitionConfigTable[transition].endingSoundEffect;
	}
	return ScreenTransitionConfigTable[transition].startSoundEffect;
}

/// $C068F4
void UnknownC068F4(short arg1, short arg2) {
	if (Unknown7E5DD8 != 0) {
		return;
	}
	const(OverworldEventMusic)* x0A = &OverworldEventMusicPointerTable[MapDataPerSectorMusic[arg2 / 128][(arg1 >> 8) & 0xFF]][0];
	while (x0A.flag != 0) {
		if (getEventFlag(x0A.flag & 0x7FFF) == (x0A.flag > 0x8000) ? 1 : 0) {
			break;
		}
		x0A++;
	}
	Unknown7E5E38 = x0A;
	Unknown7E5DD6 = x0A.music;
	if ((Unknown7E5DDA == 0) && (x0A.music != Unknown7E5DD4)) {
		UnknownC0AC0C(2);
	}
}

/// $C069AF
void UnknownC069AF() {
	if (Unknown7E5DD8 != 0) {
		return;
	}
	if (Unknown7E5DD6 == Unknown7E4DD4) {
		return;
	}
	Unknown7E5DD4 = Unknown7E5DD6;
	ChangeMusic(Unknown7E5DD6);
	UnknownC0AC0C(Unknown7E5E38.unknown3);
}

/// $C069ED
void ChangeMusic5DD6() {
	ChangeMusic(Unknown7E5DD6);
}

/// $C069F7
short UnknownC069F7() {
	UnknownC068F4(gameState.leaderX.integer, gameState.leaderY.integer);
	return Unknown7E5DD6;
}

/// $C06A07
void UnknownC06A07() {
	UnknownC068F4(gameState.leaderX.integer, gameState.leaderY.integer);
	ChangeMusic(Unknown7E5DD6);
}

/// $C06A1B
void UnknownC06A1B(const(DoorEntryB)* arg1) {
	if (getEventFlag(arg1.eventFlag & 0x7FFF) == (arg1.eventFlag > EVENT_FLAG_UNSET) ? 1 : 0) {
		UnknownC064E3(0, QueuedInteractionPtr(&arg1.textPtr[0]));
		Unknown7E5DAA = 0;
		Unknown7E5DA8 = 0;
	}
}

/// $C06A8B
void UnknownC06A8B(const(DoorEntryC)*) {
	//you wanted something? too bad!
}

/// $C06A8E
void UnknownC06A8E(const(DoorEntryC)*) {
	//nothing
}

/// $C06A91
void UnknownC06A91(short arg1) {
	if ((gameState.walkingStyle == WalkingStyle.Ladder) || (gameState.walkingStyle == WalkingStyle.Rope)) {
		return;
	}
	if (arg1 == 0) {
		gameState.walkingStyle = WalkingStyle.Ladder;
	} else {
		gameState.walkingStyle = WalkingStyle.Rope;
	}
	gameState.leaderDirection &= 0xFFFE;
	Unknown7E5DC4 = -1;
}

/// $C06ACA
void UnknownC06ACA(const(DoorEntryA)* arg1) {
	if (Unknown7E0A34 == 0) {
		return;
	}
	if (gameState.unknownB0 == 2) {
		return;
	}
	if (Unknown7E5D9A != 0) {
		return;
	}
	if ((BattleSwirlFlag | BattleSwirlCountdown) != 0) {
		return;
	}
	Unknown7E5DC2 = 1;
	QueuedInteractionPtr ptr = { door_ptr: arg1 };
	UnknownC064E3(2, cast(QueuedInteractionPtr)ptr);
	UnknownC07C5B();
}

/// $C06B21
void SpawnBuzzBuzz() {
	DisplayText(TextSpawnBuzzBuzz.ptr);
	UnknownEF0EE8();
}

/// $C06B3D
void UnknownC06B3D() {
	short i;
	for (i = 0; (4 > i) && (CurrentQueuedInteraction != NextQueuedInteraction); CurrentQueuedInteraction = (CurrentQueuedInteraction + 1) & 3, i++) {
		if (UnknownC06537() != 10) {
			continue;
		}
		Unknown7E5E58[i] = UnknownC0654E();
	}
	Unknown7E5E58[i].text_ptr = null;
	for (short j = 0; Unknown7E5E58[j].text_ptr !is null; j++) {
		UnknownC064E3(10, Unknown7E5E58[j]);
	}
}

/// $C06BFF
void DoorTransition(const(DoorEntryA)* arg1) {
	if (arg1.textPtr !is null) {
		UnknownC10004(&arg1.textPtr[0]);
	}
	Unknown7E5DAA = 0;
	Unknown7E5DA8 = 0;
	if (getEventFlag(arg1.eventFlag & 0x7FFF) != (arg1.eventFlag > EVENT_FLAG_UNSET) ? 1 : 0) {
		Unknown7E5DC2 = 0;
		return;
	}
	for (short i = 1; i <= 10; i++) {
		setEventFlag(i, 0);
	}
	UnknownC06B3D();
	UnknownC07C5B();
	PlaySfx(GetScreenTransitionSoundEffect(arg1.unknown10, 1));
	if (Unknown7EB4B6 != 0) {
		FadeOut(1, 1);
	} else {
		ScreenTransition(arg1.unknown10, 1);
	}
	short x02 = cast(short)(arg1.unknown8 * 8);
	short x04 = cast(short)((arg1.unknown6 & 0x3FFF) * 8);
	if (UnknownC3E1D8[arg1.unknown6 >> 14] != 2) {
		x02 += 8;
	}
	if (Debug != 0) {
		if (DebugModeNumber != 6) {
			UnknownC068F4(x02, x04);
		}
		if (Unknown7EB567 == 0) {
			UnknownEFE895(arg1.unknown10);
		}
	} else {
		UnknownC068F4(x02, x04);
	}
	LoadMapAtPosition(x02, x04);
	Unknown7E2890 = 0;
	gameState.walkingStyle = 0;
	UnknownC03FA9(x02, x04, UnknownC3E1D8[arg1.unknown6 >> 14]);
	if ((Debug != 0) && (Unknown7EB567 == 0)) {
		SaveReplaySaveSlot();
	}
	UnknownC069AF();
	UnknownC065A3();
	PlaySfx(GetScreenTransitionSoundEffect(arg1.unknown10, 0));
	if (Unknown7EB4B6 != 0) {
		FadeIn(1, 1);
	} else {
		ScreenTransition(arg1.unknown10, 0);
	}
	Unknown7E5DC4 = -1;
	Unknown7E0A34 = -1;
	SpawnBuzzBuzz();
	Unknown7E5DC2 = 0;
}

/// $C06E02
immutable short[4] UnknownC06E02 = [8, 0, 0, 8];

/// $C06E0A
immutable short[4] UnknownC06E0A = [0, 8, 0, 8];

/// $C06E12
immutable short[4] UnknownC06E12 = [Direction.Left, Direction.Right, Direction.Left, Direction.Right];

/// $C06E2C
void UnknownC06E2C() {
	gameState.walkingStyle = WalkingStyle.Escalator;
	MiscDebugFlags = 0;
	gameState.leaderX.integer = Unknown7E5DD0;
	gameState.leaderY.integer = Unknown7E5DD2;
	gameState.leaderY.fraction = 0;
	gameState.leaderX.fraction = 0;
}

/// $C06E4A
void UnknownC06E4A() {
	Unknown7E5DC4 = -1;
	gameState.walkingStyle = WalkingStyle.Normal;
	MiscDebugFlags = 0;
	Unknown7E5DBA = 0;
	gameState.leaderX.integer = Unknown7E5DD0;
	gameState.leaderY.integer = Unknown7E5DD2;
	gameState.leaderY.fraction = 0;
	gameState.leaderX.fraction = 0;
}

/// $C06E6E
void UnknownC06E6E(ushort arg1, short arg2, short arg3) {
	if (Unknown7E0081 != 0) {
		return;
	}
	UnknownC48C69();
	short x04;
	if ((arg1 & 0x8000) != 0) {
		if (gameState.walkingStyle != WalkingStyle.Escalator) {
			return;
		}
		gameState.walkingStyle = WalkingStyle.Normal;
		MiscDebugFlags = 3;
		x04 = cast(short)((arg2 * 8) + UnknownC06E02[Unknown7E5DC6 >> 8]);
		short x1A = UnknownC48D58(gameState.leaderX.integer, gameState.leaderY.integer, x04, cast(short)(arg3 * 8));
		UnknownC48E6B(UnknownC06E12[Unknown7E5DC6 >> 8], 16);
		ScheduleOverworldTask(cast(short)(x1A + 1), &UnknownC06E4A);
		UnknownC48E95();
		Unknown7E5DC6 = 0;
		Unknown7E5DBA = 1;
	} else {
		if (gameState.walkingStyle == WalkingStyle.Escalator) {
			return;
		}
		Unknown7E5DBA = 1;
		Unknown7E5DC6 = arg1;
		gameState.leaderDirection = UnknownC06E12[arg1 >> 8];
		MiscDebugFlags = 3;
		x04 = cast(short)((arg2 * 8) + UnknownC06E02[arg1 >> 8]);
		ScheduleOverworldTask(UnknownC48D58(gameState.leaderX.integer, gameState.leaderY.integer, x04, cast(short)(arg3 * 8)), &UnknownC06E2C);
		UnknownC48E95();
	}
	Unknown7E5DD0 = x04;
	Unknown7E5DD2 = cast(short)(arg3 * 8);
	Unknown7E5DC4 = -1;
}

/// $C06F82
void UnknownC06F82() {
	short x12 = 0;
	if ((Unknown7E5DC4 == 0) || (Unknown7E5DC4 == 0x100)) {
		if (Unknown7E5DCE - 1 > gameState.leaderY.integer) {
			x12 = 1;
		}
	} else {
		if (Unknown7E5DCE + 1 < gameState.leaderY.integer) {
			x12 = 1;
		}
	}
	if (x12 != 0) {
		gameState.walkingStyle = WalkingStyle.Stairs;
		gameState.leaderX.integer = Unknown7E5DCC;
		gameState.leaderY.integer = Unknown7E5DCE;
		gameState.leaderY.fraction = 0;
		gameState.leaderX.fraction = 0;
	} else {
		ScheduleOverworldTask(1, &UnknownC06F82);
	}
}

/// $C06FED
void UnknownC06FED() {
	short x12 = 0;
	if ((Unknown7E5DC4 == 0) || (Unknown7E5DC4 == 0x100)) {
		if (Unknown7E5DCE < gameState.leaderY.integer) {
			x12 = 1;
		}
	} else {
		if (Unknown7E5DCE > gameState.leaderY.integer) {
			x12 = 1;
		}
	}
	if (x12 != 0) {
		Unknown7E5DC4 = -1;
		gameState.walkingStyle = WalkingStyle.Normal;
		MiscDebugFlags = 0;
		gameState.leaderX.integer = Unknown7E5DCC;
		gameState.leaderY.integer = Unknown7E5DCE;
		gameState.leaderY.fraction = 0;
		gameState.leaderX.fraction = 0;
		Unknown7E5DBA = 0;
	} else {
		ScheduleOverworldTask(1, &UnknownC06FED);
	}
}

/// $C0705F
short UnknownC0705F(ushort arg1) {
	short y = 1;
	switch (arg1) {
		case 0x100:
			if ((gameState.leaderDirection == 0) || ((gameState.leaderDirection & 3) != 0)) {
				y = 0;
			}
			Unknown7E5DCA = Direction.Right;
			break;
		case 0x000:
			if ((gameState.leaderDirection == 0) || ((gameState.leaderDirection & 3) != 0)) {
				y = 0;
			}
			Unknown7E5DCA = Direction.Left;
			break;
		case 0x300:
			if ((gameState.leaderDirection & 7) != 0) {
				y = 0;
			}
			Unknown7E5DCA = Direction.Right;
			break;
		case 0x200:
			if ((gameState.leaderDirection & 7) != 0) {
				y = 0;
			}
			Unknown7E5DCA = Direction.Left;
			break;
		default: break;
	}
	return y;
}

/// $C070CB
void UnknownC070CB(ushort arg1, short arg2, short arg3) {
	if (Unknown7E0081 != 0) {
		return;
	}
	UnknownC48C69();
	short x16;
	short x0E;
	if (gameState.walkingStyle == 0) {
		if (UnknownC0705F(arg1) != 0) {
			return;
		}
		gameState.leaderDirection = Unknown7E5DCA;
		Unknown7E5DB8 = 0;
		MiscDebugFlags = 3;
		Unknown7E5DBA = 1;
		Unknown7E5DC4 = cast(short)(arg1 & 0xFF00);
		x16 = cast(short)((arg2 * 8) + UnknownC3E210[arg1 >> 8]);
		x0E = cast(short)((arg3 * 8) + UnknownC3E218[arg1 >> 8]);
		short x14 = UnknownC48D58(gameState.leaderX.integer, gameState.leaderY.integer, x16, x0E);
		if (x14 == 0) {
			x14++;
		}
		UnknownC48E6B(UnknownC3E200[arg1 >> 8], 6);
		ScheduleOverworldTask(x14, &UnknownC06F82);
	} else {
		x16 = cast(short)((arg2 * 8) + UnknownC3E220[arg1 >> 8]);
		x0E = cast(short)((arg3 * 8) + UnknownC3E228[arg1 >> 8]);
		short x14 = UnknownC48D58(gameState.leaderX.integer, gameState.leaderY.integer, x16, x0E);
		if (x14 == 0) {
			x14++;
		}
		UnknownC48E6B(UnknownC3E208[arg1 >> 8], 12);
		ScheduleOverworldTask(x14, &UnknownC06FED);
	}
	Unknown7E5DCC = x16;
	Unknown7E5DCE = x0E;
	UnknownC48E95();
}

/// $C071E5
void UnknownC071E5(short arg1) {
	Unknown7E5E3C[arg1 - 1].unknown0 = 0;
	gameState.unknownC8[arg1 - 1] = 0;
}

/// $C07213
void UnknownC07213() {
	for (short i = 0; i < 2; i++) {
		if (gameState.unknownC8[i] == 0) {
			continue;
		}
		Unknown7E5E3C[i].unknown0 = gameState.unknownC8[i];
		Unknown7E5E3C[i].unknown2 = MapHotspots[gameState.unknownCA[i]].unknown0;
		Unknown7E5E3C[i].unknown6 = MapHotspots[gameState.unknownCA[i]].unknown4;
		Unknown7E5E3C[i].unknown4 = MapHotspots[gameState.unknownCA[i]].unknown2;
		Unknown7E5E3C[i].unknown8 = MapHotspots[gameState.unknownCA[i]].unknown6;
		Unknown7E5E3C[i].unknown10 = gameState.unknownCC[i];
	}
}

/// $C072CF
void UnknownC072CF(short arg1, short arg2, const(ubyte)* arg3) {
	short x;
	if ((gameState.leaderX.integer > MapHotspots[arg1 - 1].unknown0) && (gameState.leaderX.integer < MapHotspots[arg1 - 1].unknown4) && (gameState.leaderY.integer > MapHotspots[arg1 - 1].unknown2) && (gameState.leaderY.integer < MapHotspots[arg1 - 1].unknown6)) {
		x = 1;
	} else {
		x = 2;
	}
	Unknown7E5E3C[arg1 - 1].unknown0 = x;
	Unknown7E5E3C[arg1 - 1].unknown2 = MapHotspots[arg1 - 1].unknown0;
	Unknown7E5E3C[arg1 - 1].unknown6 = MapHotspots[arg1 - 1].unknown4;
	Unknown7E5E3C[arg1 - 1].unknown4 = MapHotspots[arg1 - 1].unknown2;
	Unknown7E5E3C[arg1 - 1].unknown8 = MapHotspots[arg1 - 1].unknown6;
	Unknown7E5E3C[arg1 - 1].unknown10 = arg3;
	gameState.unknownC8[arg1 - 1] = cast(ubyte)x;
	gameState.unknownCA[arg1 - 1] = cast(ubyte)arg2;
	gameState.unknownCC[arg1 - 1] = arg3;
}

/// $C073C0
void UnknownC073C0(short arg1) {
	// don't ask. I don't know either
	if ((NextQueuedInteraction ^ NextQueuedInteraction) != 0) {
		return;
	}
	if (teleportDestination != 0) {
		return;
	}
	short x12 = Unknown7E5E3C[arg1].unknown0;
	if (x12 == 1) {
		if ((gameState.leaderX.integer >= Unknown7E5E3C[arg1].unknown2) && (gameState.leaderX.integer < Unknown7E5E3C[arg1].unknown6) && (gameState.leaderY.integer >= Unknown7E5E3C[arg1].unknown4) && (gameState.leaderY.integer < Unknown7E5E3C[arg1].unknown8)) {
			return;
		}
	} else {
		if ((gameState.leaderX.integer <= Unknown7E5E3C[arg1].unknown2) || (gameState.leaderX.integer >= Unknown7E5E3C[arg1].unknown6) || (gameState.leaderY.integer <= Unknown7E5E3C[arg1].unknown4) || (gameState.leaderY.integer >= Unknown7E5E3C[arg1].unknown8)) {
			return;
		}
	}
	Unknown7E5E3C[arg1].unknown0 = 0;
	UnknownC064E3(9, QueuedInteractionPtr(Unknown7E5E3C[arg1].unknown10));
	gameState.unknownC8[arg1] = 0;
}

/// $C07477
byte UnknownC07477(short arg1, short arg2) {
	const(SectorDoors)* x0A = &doorConfig[(arg1 / 32) + (arg2 & 0xFFE0)];
	if (x0A.length == 0) {
		return -1;
	}
	const(DoorConfig)* x06 = &x0A.doors[0];
	for (short i = x0A.length; i != 0; x06++, i--) {
		if (x06.unknown1 != (arg1 % 32)) {
			continue;
		}
		if (x06.unknown0 != (arg2 % 32)) {
			continue;
		}
		Unknown7E5DBC = x06.doorPtr;
		Unknown7E5DBE = x06.type;
	}
	return -1;
}

/// $C07526
short UnknownC07526(short arg1, short arg2) {
	short x0E;
	switch (UnknownC07477(arg1, arg2)) {
		case DoorType.Switch:
			UnknownC06A1B(Unknown7E5DBC.entryB);
			x0E = 0;
			break;
		case DoorType.RopeLadder:
			UnknownC06A91(Unknown7E5DBC.unknown3);
			x0E = 1;
			break;
		case DoorType.Door:
			UnknownC06ACA(Unknown7E5DBC.entryA);
			x0E = 0;
			break;
		case DoorType.Escalator:
			UnknownC06E6E(Unknown7E5DBC.unknown3, arg1, arg2);
			x0E = 0;
			break;
		case DoorType.Stairway:
			UnknownC070CB(Unknown7E5DBC.unknown3, arg1, arg2);
			x0E = 1;
			break;
		case DoorType.Object:
		case DoorType.Type7:
			UnknownC06A8B(Unknown7E5DBC.entryC);
			x0E = 0;
			break;
		case DoorType.Person:
			UnknownC06A8E(Unknown7E5DBC.entryC);
			x0E = 0;
			break;
		default: break;
	}
	return x0E;
}

/// $C075DD
void ProcessQueuedInteractions() {
	QueuedInteractionPtr ptr = QueuedInteractions[CurrentQueuedInteraction].ptr;
	CurrentQueuedInteractionType = QueuedInteractions[CurrentQueuedInteraction].type;
	CurrentQueuedInteraction = (CurrentQueuedInteraction + 1) & 3;
	Unknown7E5D58 &= 0xFFFE;
	UnknownC07C5B();
	switch(CurrentQueuedInteractionType) {
		case 2:
			DoorTransition(ptr.door_ptr);
			break;
		case 10:
			UnknownC10004(ptr.text_ptr);
			if (ptr.text_ptr is TextDadCalls.ptr) {
				DadPhoneTimer = 0x697;
				Unknown7E9E56 = 0;
			}
			break;
		case 0:
		case 8:
		case 9:
			UnknownC10004(ptr.text_ptr);
			break;
		default: break;
	}
	Unknown7E5D9A = (CurrentQueuedInteraction != NextQueuedInteraction) ? 1 : 0;
	CurrentQueuedInteractionType = -1;
}

/// $C0769C
void UnknownC0769C() {
	gameState.partyStatus = 0;
	for (short i = 0x18; i <= 0x1D; i++) {
		EntityScriptVar3Table[i] = 8;
	}
}

/// $C076C8
void UnknownC076C8(short arg1) {
	if (gameState.partyStatus == 3) {
		return;
	}
	gameState.partyStatus = 3;
	for (short i = 0x18; i <= 0x1D; i++) {
		EntityScriptVar3Table[i] = 5;
	}
	ScheduleOverworldTask(arg1, &UnknownC0769C);
}

/// $C07716
void UnknownC07716() {
	if ((EntityTickCallbackFlags[gameState.currentPartyMembers] & (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED)) != 0) {
		return;
	}
	if ((EntitySpriteMapFlags[gameState.currentPartyMembers] & 0x8000) != 0) {
		return;
	}
	if (gameState.unknownB0 == 2) {
		return;
	}
	Unknown7E9F6B = CreateEntity(OverworldSprite.MiniGhost, ActionScript.Unknown786, -1, 0, 0);
	EntityAnimationFrames[Unknown7E9F6B] = -1;
	EntityScreenYTable[Unknown7E9F6B] = -256;
	EntityAbsYTable[Unknown7E9F6B] = -256;
	EntityAbsXTable[Unknown7E9F6B] = -256;
}

/// $C0777A
void UnknownC0777A() {
	UnknownC02140(Unknown7E9F6B);
	Unknown7E9F6B = -1;
}

/// $C0778A
void UnknownC0778A() {
	if ((EntityTickCallbackFlags[gameState.currentPartyMembers] & (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED)) != 0) {
		EntityAnimationFrames[CurrentEntitySlot] = -1;
		return;
	}
	FixedPoint1616 x0E = UnknownC41FFF(Unknown7E9F6D, 0x3000);
	EntityAbsXTable[CurrentEntitySlot] = cast(short)(gameState.leaderX.integer + (x0E.integer >> 8));
	EntityAbsYTable[CurrentEntitySlot] = cast(short)(gameState.leaderY.integer - 8 + (x0E.fraction >> 10));
	Unknown7E9F6D += 0x300;
	EntityAnimationFrames[CurrentEntitySlot] = 0;
}

/// $C0780F
short UnknownC0780F(short characterID, short walkingStyle, PartyCharacter* character) {
	short y = 0;
	if ((characterID == 0) && (Unknown7EB4B6 == 0) && (PajamaFlag != 0)) {
		return 0x1B5;
	}
	if (Unknown7E9F73 != -1) {
		Unknown7E2E7A[Unknown7E9F73] = 0;
	}
	if (gameState.partyStatus == 1) {
		if (gameState.unknown92 != 3) {
			return 0xD;
		} else {
			return 0x25;
		}
	}
	switch (character.afflictions[0]) {
		case Status0.Unconscious:
			y = 1;
			break;
		case Status0.Diamondized:
			if (gameState.unknown92 != 3) {
				return 0xC;
			}
			return 0x24;
		case Status0.Nauseous:
			if (Unknown7E9F73 != -1) {
				Unknown7E2E7A[Unknown7E9F73] |= 0x8000;
			}
			break;
		default: break;
	}
	switch (character.afflictions[1]) {
		case Status1.Mushroomized:
			if (Unknown7E9F73 != -1) {
				Unknown7E2E7A[Unknown7E9F73] |= 0x4000;
			}
			break;
		case Status1.Possessed:
			Unknown7E9F6F++;
			break;
		default: break;
	}
	if (gameState.unknown92 == 6) {
			return 7;
	} else if (gameState.unknown92 == 6) {
		if (character.unknown53 == 0) {
			return 6;
		}
	}
	if (y == 0) {
		switch (walkingStyle) {
			case 0:
			case WalkingStyle.Escalator:
			case WalkingStyle.Stairs:
				y = 0;
				break;
			case WalkingStyle.Ghost:
				y = 1;
				break;
			case WalkingStyle.Ladder:
				y = 2;
				break;
			case WalkingStyle.Rope:
				y = 3;
				break;
			default: break;
		}
	}
	if (gameState.unknown92 == 3) {
		y += 4;
		Unknown7E2E7A[Unknown7E9F73] = 0;
	} else if ((gameState.unknown92 == 5) && (y == 0)) {
		y += 6;
	}
	if (gameState.partyStatus == 3) {
		EntityScriptVar3Table[Unknown7E9F73] = 5;
	} else if (character.afflictions[0] == Status0.Unconscious) {
		EntityScriptVar3Table[Unknown7E9F73] = 16;
	} else if ((EntitySurfaceFlags[Unknown7E9F73] & 0xC) == 0xC) {
		EntityScriptVar3Table[Unknown7E9F73] = 24;
	} else if ((EntitySurfaceFlags[Unknown7E9F73] & 8) == 8) {
		EntityScriptVar3Table[Unknown7E9F73] = 16;
	} else {
		EntityScriptVar3Table[Unknown7E9F73] = 8;
	}
	if (character.afflictions[0] == Status0.Paralyzed) {
		EntityScriptVar3Table[Unknown7E9F73] = 56;
	}
	return PartyCharacterGraphicsTable[characterID][y];
}

/// $C079EC
short UnknownC079EC(short arg1) {
	short x = 0;
	if ((arg1 & 0x20) != 0) {
		x = 1;
	} else if ((arg1 & 0x40) != 0) {
		return OverworldSprite.HumanDiamondized;
	}
	short a = PartyCharacterGraphicsTable[(arg1 & 0x1F) - 1][x];
	return (a == 1) ? OverworldSprite.NessPosing : a;
}

/// $C07A31
void UnknownC07A31(short arg1, short arg2) {
	if ((arg2 & 0x80) == 0) {
		return;
	}
	Unknown7E2E7A[arg1] |= 0x4000;
}

/// $C07A56
void UnknownC07A56(short arg1, short arg2, short arg3) {
	short x04 = arg3;
	short x02 = arg2;
	short x16 = arg2;
	short x14 = arg1;
	Unknown7E9F73 = x04;
	short x12 = UnknownC0780F(x14, x02, Unknown7E4DC6);
	if (x12 == -1) {
		EntityAnimationFrames[x04] = x12;
	} else {
		auto x0E = SpriteGroupingPointers[x12];
		//UNKNOWN_30X2_TABLE_31[x04] = x0E.spriteBank;
		EntityGraphicsPointers[x04] = &x0E.sprites[0];
		Unknown7E00C0 = x02;
		x02 = Unknown7E4DC6.unknown55;
		if (Unknown7E00C0 != x02) {
			x02 = x16;
			Unknown7E4DC6.unknown55 = x16;
			EntityScriptVar7Table[x04] |= 1<<15;
		}
		if ((gameState.unknown90 != 0) || (x16 != 0xC)) {
			EntityScriptVar7Table[x04] ^= (1 << 15 | 1 << 14 | 1 << 13);
		} else {
			EntityScriptVar7Table[x04] |= (1 << 14 | 1 << 13);
		}
	}
	if (gameState.unknownB0 == 2) {
		EntityScriptVar7Table[x04] |= 1 << 12;
	}
}

/// $C07B52
void UnknownC07B52() {
	ushort x14 = PartyCharacters[0].position_index;
	for (ushort x12 = 0x18; x12 < 0x1E; x12++) {
		ushort x04 = x12;
		ushort x10 = x12;
		if (EntityScriptTable[x04] != -1) {
			EntityTickCallbackFlags[x04] |= (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
			Unknown7E4DC6 = &PartyCharacters[EntityScriptVar1Table[x04]];
			if ((gameState.currentPartyMembers == x12) || (Unknown7E4DC6.position_index == x14)) {
				UnknownC07A56(EntityScriptVar0Table[x12], gameState.walkingStyle, x12);
				EntityAbsXTable[x12] = gameState.leaderX.integer;
				EntityAbsYTable[x12] = gameState.leaderY.integer;
				if (gameState.partyCount != 1) {
					EntityDirections[x12] = gameState.leaderDirection;
				}
			} else {
				UnknownC07A56(EntityScriptVar0Table[x12], PlayerPositionBuffer[Unknown7E4DC6.position_index].walking_style, x12);
				EntityAbsXTable[x10] = PlayerPositionBuffer[Unknown7E4DC6.position_index].x_coord;
				EntityAbsYTable[x10] = PlayerPositionBuffer[Unknown7E4DC6.position_index].y_coord;
				EntityDirections[x10] = PlayerPositionBuffer[Unknown7E4DC6.position_index].direction;
			}
			EntityScreenXTable[x12] = cast(short)(EntityAbsXTable[x12] - BG1_X_POS);
			EntityScreenYTable[x12] = cast(short)(EntityAbsYTable[x12] - BG1_Y_POS);
			UnknownC0A780(x12);
		}
	}
}

/// $C07C5B
void UnknownC07C5B() {
	if (Unknown7E5D58 == 0) {
		return;
	}
	for (short i = 0x18; i < 0x1E; i++) {
		EntitySpriteMapFlags[i] &= 0x7FFF;
	}
}

/// $C08000
void start() {
	// emulation mode? never heard of it
	NMITIMEN = 0;
	DMAQueueIndex = 0;

	// stack setup would happen here

	INIDISP = 0x80;
	INIDISP_MIRROR = 0x80;
	OBSEL = 0;
	OAMADDL = 0;
	OAMADDH = 0;
	BGMODE = 0;
	MOSAIC = 0;
	BG1SC = 0;
	BG2SC = 0;
	BG3SC = 0;
	BG4SC = 0;
	BG12NBA = 0;
	BG34NBA = 0;
	//yes these are meant to be repeated
	BG1HOFS = 0;
	BG1HOFS = 0;
	BG1VOFS = 0;
	BG1VOFS = 0;
	BG2HOFS = 0;
	BG2HOFS = 0;
	BG2VOFS = 0;
	BG2VOFS = 0;
	BG3HOFS = 0;
	BG3HOFS = 0;
	BG3VOFS = 0;
	BG3VOFS = 0;
	BG4HOFS = 0;
	BG4HOFS = 0;
	BG4VOFS = 0;
	BG4VOFS = 0;
	VMAIN = 0x80;
	VMADDL = 0;
	VMADDH = 0;
	M7SEL = 0;
	//yep, repeating again. kinda
	M7A = 0;
	M7A = 1;
	M7B = 0;
	M7B = 0;
	M7C = 0;
	M7C = 0;
	M7D = 0;
	M7D = 1;
	M7X = 0;
	M7X = 0;
	M7Y = 0;
	M7Y = 0;
	CGADD = 0;
	W12SEL = 0;
	W34SEL = 0;
	WOBJSEL = 0;
	WH0 = 0;
	WH1 = 0;
	WH2 = 0;
	WH3 = 0;
	WBGLOG = 0;
	WOBJLOG = 0;
	TM = 0x1F;
	TD = 0;
	TMW = 0;
	TSW = 0;
	CGWSEL = 0;
	CGADSUB = 0;
	FIXED_COLOUR_DATA = 0xE0;
	SETINI = 0;
	WRMPYA = 0xFF;
	WRMPYA = 0;
	WRMPYB = 0;
	WRDIVL = 0;
	WRDIVH = 0;
	WRDIVB = 0;
	HTIMEL = 0;
	HTIMEH = 0;
	VTIMEL = 0;
	VTIMEH = 0;
	MDMAEN = 0;
	HDMAEN = 0;
	MEMSEL = 1;

	// clearing the heap would happen here

	CurrentHeapAddress = &heap[0][0];
	HeapBaseAddress = &heap[0][0];
	Unknown7E2402 = 0xFFFF;
	RandA = 0x1234;
	RandB = 0x5678;
	NextFrameBufferID = 1;
	IRQCallback = &DefaultIRQCallback;
	UnknownC08B19();
	GameInit();
}

/// $C0814F
void IRQ() {
	if (TIMEUP & 0x80) {
		IRQNMICommon();
	}
}

void NMI() {
	IRQNMICommon();
}

void IRQNMICommon() {
	// a read from RDNMI is required on real hardware during NMI, apparently
	//ubyte __unused = RDNMI;
	HDMAEN = 0;
	INIDISP = 0x80;
	Unknown7E002B++;
	Unknown7E0002++;
	if (NextFrameDisplayID != 0) {
		OAMADDL = 0;
		DMAChannels[0].DMAP = 0;
		DMAChannels[0].A1T = null;
		DMAChannels[0].BBAD = 4;
		DMAChannels[0].A1T = ((NextFrameDisplayID - 1) != 0) ? (&OAM2) : (&OAM1);
		DMAChannels[0].DAS = 0x220;
		MDMAEN = 1;
		handleDma();
		Unknown7E0099 += 0x220;
	}
	if (Unknown7E0030 != 0) {
		// In the original game's source code, we would only DMA part of
		// the palette to save cycles. With the power of modern computers,
		// we can afford to copy 512 bytes always instead of only 256.
		DMAChannels[0].A1T = &palettes;
		CGADD = 0;
		DMAChannels[0].DMAP = 0x00;
		DMAChannels[0].BBAD = 0x22;
		Unknown7E0030 = 0;
		DMAChannels[0].DAS = 0x0200;
		MDMAEN = 1;
		handleDma();
		Unknown7E0099 += 0x0200;
	}
	if ((Unknown7E0028.a != 0) && (--Unknown7E002A < 0)) {
		Unknown7E002A = Unknown7E0028.b;
		ubyte a = 0;
		if (((INIDISP_MIRROR & 0xF) + Unknown7E0028.a) < 0) {
			HDMAEN_MIRROR = 0;
			a = 0x80;
		} else {
			if (((INIDISP_MIRROR & 0xF) + Unknown7E0028.a) < 16) {
				a = cast(ubyte)(((INIDISP_MIRROR & 0xF) + Unknown7E0028.a));
				goto Unknown6;
			}
			a = 15;
		}
		Unknown7E0028.a = 0;
		Unknown6:
		INIDISP_MIRROR = a;
	}
	INIDISP = INIDISP_MIRROR;
	MOSAIC = MOSAIC_MIRROR;
	BG12NBA = BG12NBA_MIRROR;
	WH2 = UNUSED_WH2_MIRROR;
	for (short i = Unknown7E0001; i != DMAQueueIndex; i++) {
		DMAChannels[0].DMAP = DMATable[DMAQueue[i].mode].unknown0;
		DMAChannels[0].BBAD = DMATable[DMAQueue[i].mode].unknown1;
		VMAIN = DMATable[DMAQueue[i].mode].unknown2;
		DMAChannels[0].DAS = DMAQueue[i].size;
		DMAChannels[0].A1T = DMAQueue[i].source;
		//DMAChannels[0].A1B = DMAQueue[i].source bank;
		VMADDL = DMAQueue[i].destination;
		MDMAEN = 1;
		handleDma();
	}
	Unknown7E0001 = DMAQueueIndex;
	if (NextFrameDisplayID != 0) {
		if (NextFrameDisplayID - 1 == 0) {
			BG1HOFS = BG1_X_POS_BUF[0] & 0xFF;
			BG1HOFS = BG1_X_POS_BUF[0] >> 8;
			BG1VOFS = BG1_Y_POS_BUF[0] & 0xFF;
			BG1VOFS = BG1_Y_POS_BUF[0] >> 8;
			BG2HOFS = BG2_X_POS_BUF[0] & 0xFF;
			BG2HOFS = BG2_X_POS_BUF[0] >> 8;
			BG2VOFS = BG2_Y_POS_BUF[0] & 0xFF;
			BG2VOFS = BG2_Y_POS_BUF[0] >> 8;
			BG3HOFS = BG3_X_POS_BUF[0] & 0xFF;
			BG3HOFS = BG3_X_POS_BUF[0] >> 8;
			BG3VOFS = BG3_Y_POS_BUF[0] & 0xFF;
			BG3VOFS = BG3_Y_POS_BUF[0] >> 8;
			BG4HOFS = BG4_X_POS_BUF[0] & 0xFF;
			BG4HOFS = BG4_X_POS_BUF[0] >> 8;
			BG4VOFS = BG4_Y_POS_BUF[0] & 0xFF;
			BG4VOFS = BG4_Y_POS_BUF[0] >> 8;
		} else{
			BG1HOFS = BG1_X_POS_BUF[1] & 0xFF;
			BG1HOFS = BG1_X_POS_BUF[1] >> 8;
			BG1VOFS = BG1_Y_POS_BUF[1] & 0xFF;
			BG1VOFS = BG1_Y_POS_BUF[1] >> 8;
			BG2HOFS = BG2_X_POS_BUF[1] & 0xFF;
			BG2HOFS = BG2_X_POS_BUF[1] >> 8;
			BG2VOFS = BG2_Y_POS_BUF[1] & 0xFF;
			BG2VOFS = BG2_Y_POS_BUF[1] >> 8;
			BG3HOFS = BG3_X_POS_BUF[1] & 0xFF;
			BG3HOFS = BG3_X_POS_BUF[1] >> 8;
			BG3VOFS = BG3_Y_POS_BUF[1] & 0xFF;
			BG3VOFS = BG3_Y_POS_BUF[1] >> 8;
			BG4HOFS = BG4_X_POS_BUF[1] & 0xFF;
			BG4HOFS = BG4_X_POS_BUF[1] >> 8;
			BG4VOFS = BG4_Y_POS_BUF[1] & 0xFF;
			BG4VOFS = BG4_Y_POS_BUF[1] >> 8;
			Unknown7E0061 = BG1_X_POS;
			Unknown7E0063 = BG1_Y_POS;
		}
	}
	NextFrameDisplayID = 0;
	if ((INIDISP_MIRROR & 0x80) == 0) {
		TM = TM_MIRROR;
		TD = TD_MIRROR;
		HDMAEN = HDMAEN_MIRROR;
	}
	ProcessSfxQueue();
	Unknown7E0099 = 0;
	if (Unknown7E0022 == 0) {
		Unknown7E0022++;
		ExecuteIRQCallback();
		Unknown7E0022 = 0;
	}
	HeapBaseAddress = (&heap[0] == HeapBaseAddress) ? (&heap[1][0]) : &heap[0][0];
	CurrentHeapAddress = (&heap[0] == HeapBaseAddress) ? (&heap[1][0]) : &heap[0][0];
	DMATransferFlag = 0;
	Unknown7E00AB = 0;
	Timer++;
}

/// $C083B8
void UnknownC083B8() {
	Unknown7E007B = 0;
}

/// $C083C1
void UnknownC083C1(Unknown7E007DEntry* arg1) {
	Unknown7E0085 = arg1;
	Unknown7E008B = pad_state[0];
	Unknown7E0089 = 1;
	Unknown7E007B |= 0x8000;
}

/// $C083E3
void UnknownC083E3(Unknown7E007DEntry* arg1) {
	if ((Unknown7E007B & 0x4000) != 0) {
		return;
	}
	if (arg1.unknown0 == 0) {
		UnknownC083B8();
	}
	Unknown7E0081 = arg1.unknown0;
	Unknown7E0083 = arg1.unknown1;
	Unknown7E007D = arg1;
	Unknown7E0077[0] = arg1.unknown1;
	Unknown7E0077[1] = arg1.unknown1;
	Unknown7E007B |= 0x4000;
}

/// $C0841B
short TestSRAMSize() {
	//original code tested how large SRAM was by writing to areas beyond retail SRAM and comparing to a value guaranteed to be in SRAM
	//if SRAM is retail-sized, these areas would just be mirrors of the existing SRAM
	return Unknown7E0A36;
}

/// $C0841B
void ReadJoypad() {
	if (Unknown7E007B == 0) {
		goto l1;
	}
	if ((Unknown7E007B & 0x4000) == 0) {
		goto l1;
	}
	if (--Unknown7E0081 != 0) {
		return;
	}
	Unknown7E007D++;
	if (Unknown7E007D[0].unknown0 == 0) {
		goto l0;
	}
	Unknown7E0081 = Unknown7E007D[0].unknown0;
	Unknown7E0077[0] = Unknown7E007D[0].unknown1;
	Unknown7E0077[1] = Unknown7E007D[0].unknown1;
	return;

	l0:
	Unknown7E007B &= 0xBFFF;

	l1:
	Unknown7E0077[1] = JOYPAD_2_DATA;
	Unknown7E0077[0] = JOYPAD_1_DATA;
}

/// $C08456
void UnknownC08456() {
	if ((Unknown7E007B & 0x8000) == 0) {
		return;
	}
	if ((Unknown7E0077[0] | Unknown7E0077[1]) == Unknown7E008B) {
		Unknown7E0089++;
		if (Unknown7E0089 != 0xFF) {
			return;
		}
	}
	Unknown7E0085.unknown0 = cast(ubyte)Unknown7E0089;
	Unknown7E0085.unknown1 = Unknown7E008B;
	Unknown7E0085++;
	Unknown7E008B = Unknown7E0077[0] | Unknown7E0077[1];
	Unknown7E0089 = 0;
	Unknown7E0089++;
	Unknown7E0085.unknown0 = 0;
	if (Unknown7E0085 !is null) { //not sure about this... but what is BPL on a pointer supposed to mean?
		return;
	}
	Unknown7E007B &= 0x7FFF;
}

/// $C08496
void UnknownC08496() {
	while ((HVBJOY & 1) == 1) {}
	ReadJoypad();
	UnknownC08456();
	short x = 1;

	l1:
	Unknown7E0075 = Unknown7E0077[x] & 0xFFF0;
	pad_press[x] = (pad_state[x] ^ 0xFFFF) & Unknown7E0075;
	bool eq = pad_state[x] == Unknown7E0075;
	pad_state[x] = Unknown7E0075;
	if (eq) {
		goto l2;
	}
	pad_held[x] = pad_press[x];
	Unknown7E0071[x] = 0x14;
	goto l4;

	l2:
	if (Unknown7E0071[x] == 0) {
		goto l3;
	}
	pad_held[x] = 0;
	goto l4;

	l3:
	pad_held[x] = Unknown7E0075;
	Unknown7E0071[x] = 3;

	l4:
	if (x-- > 0) {
		goto l1;
	}
	if (Debug == 0) {
		pad_state[0] |= pad_state[1];
		pad_held[0] |= pad_held[1];
		pad_press[0] |= pad_press[1];
	}
	if (pad_press[0] != 0) {
		Unknown7E0A34++;
	}
}

/// $C08501
void ProcessSfxQueue() {
	if (SoundEffectQueueIndex == SoundEffectQueueEndIndex) {
		return;
	}
	APUIO3 = SoundEffectQueue[SoundEffectQueueIndex];
	SoundEffectQueueIndex = (SoundEffectQueueIndex + 1) & 7;
}

/// $C08518
void ExecuteIRQCallback() {
	IRQCallback();
}

/// $C0851B
void DefaultIRQCallback() {
	//nothing
}

/// $C0851C
void SetIRQCallback(void function() arg1) {
	IRQCallback = arg1;
}

/// $C08522
void ResetIRQCallback() {
	IRQCallback = &DefaultIRQCallback;
}

/// $C0856B
void UnknownC0856B(short arg1) {
	Unknown7E0030 = cast(ubyte)arg1;
}

/// $C085B7 - Copy data to VRAM in chunks of 0x1200
void CopyToVram2(ubyte mode, ushort count, ushort address, const(ubyte)* data) {
	DMA_COPY_MODE = mode;
	while (Unknown7E0099 != 0) { Fiber.yield(); }
	DMA_COPY_RAM_SRC = data;
	DMA_COPY_VRAM_DEST = address;
	if (count >= 0x1201) {
		DMA_COPY_SIZE = 0x1200;
		while (count >= 0x1201) {
			while (Unknown7E0099 != 0) { Fiber.yield(); }
			CopyToVramCommon();
			DMA_COPY_RAM_SRC += 0x1200;
			DMA_COPY_VRAM_DEST += 0x900;
			count -= 0x1200;
		}
	}
	DMA_COPY_SIZE = count;
	while (Unknown7E0099 != 0) { Fiber.yield(); }
	CopyToVramCommon();
	while (Unknown7E0099 != 0) { Fiber.yield(); }
}

/// $C08616 - Copy data to VRAM
void CopyToVram(ubyte mode, ushort count, ushort address, const(ubyte)* data) {
	DMA_COPY_MODE = mode;
	DMA_COPY_SIZE = count;
	DMA_COPY_RAM_SRC = data;
	DMA_COPY_VRAM_DEST = address;
	CopyToVramCommon();
}
// this actually splits the address into bank/address parameters, but we don't need that
void CopyToVramAlt(ubyte mode, ushort count, ushort address, const(ubyte)* data) {
	CopyToVram(mode, count, address, data);
}

void CopyToVramCommon() {
	CopyToVramInternal();
}

/// $C0865F
void CopyToVramInternal() {
	// if ((INIDISP_MIRROR & 0x80) != 0) {
	// 	ushort tmp92 = cast(ushort)(DMA_COPY_SIZE + Unknown7E0099);
	// 	if (tmp92 >= 0x1201) {
	// 		while (Unknown7E0099 != 0) { Fiber.yield(); }
	// 		tmp92 = DMA_COPY_SIZE;
	// 	}
	// 	Unknown7E0099 = tmp92;
	// 	Unknown7E00A5 = Unknown7E0001;
	// 	DMAQueue[DMAQueueIndex].mode = DMA_COPY_MODE;
	// 	DMAQueue[DMAQueueIndex].size = DMA_COPY_SIZE;
	// 	DMAQueue[DMAQueueIndex].source = DMA_COPY_RAM_SRC;
	// 	DMAQueue[DMAQueueIndex].destination = DMA_COPY_VRAM_DEST;
	// 	if (DMAQueueIndex + 1 == Unknown7E00A5) {
	// 		while (DMAQueueIndex + 1 == Unknown7E0001) {}
	// 	}
	// 	DMAQueueIndex++;
	// } else {
		// Since we send a complete image of VRAM to the console every frame, we
		// can just overwrite our local VRAM copy - no need to delay
		DMAChannels[1].DMAP = DMATable[DMA_COPY_MODE].unknown0;
		//original assembly relied on DMAP1+BBAD1 being adjacent for a 16-bit write, but we probably shouldn't do that
		DMAChannels[1].BBAD = DMATable[DMA_COPY_MODE].unknown1;
		VMAIN = DMATable[DMA_COPY_MODE].unknown2;
		DMAChannels[1].DAS = DMA_COPY_SIZE;
		DMAChannels[1].A1T = DMA_COPY_RAM_SRC;
		//A1B1 is not really relevant without segmented addressing
		VMADDL = DMA_COPY_VRAM_DEST;
		MDMAEN = 2;
		handleDma();
		CurrentHeapAddress = HeapBaseAddress;
		DMATransferFlag = 0;
	// }
}

/// $C086DE
void* sbrk(ushort i) {
	while (true) {
		if (i + CurrentHeapAddress - heap[0].length < HeapBaseAddress) {
			void* result = CurrentHeapAddress;
			CurrentHeapAddress += i;
			return result;
		}
		while (Unknown7E002B != 0) { Fiber.yield(); }
		Unknown7E002B = 0;
	}
}

/// $C08726
void UnknownC08726() {
	INIDISP_MIRROR = 0x80;
	HDMAEN_MIRROR = 0;
	Unknown7E0028.a = 0;
	Unknown7E002B = 0;
	while (Unknown7E002B != 0) { Fiber.yield(); }
	HDMAEN = 0;
}

/// $C08744
void UnknownC08744() {
	INIDISP_MIRROR = 0x80;
	Unknown7E002B = 0;
	while (Unknown7E002B != 0) { Fiber.yield(); }
}

/// $C08715
void EnableNMIJoypad() {
	Unknown7E001E |= 0x81;
	NMITIMEN = Unknown7E001E;
}

/// $C08756
void WaitUntilNextFrame() {
	// if ((Unknown7E001E & 0xB0) != 0) {
	// 	while (Unknown7E002B == 0) {}
	// 	Unknown7E002B = 0;
	// } else {
	// 	while (HVBJOY < 0) {}
	// 	while (HVBJOY >= 0) {}
	// }
	Fiber.yield();
	Unknown7E002B = 0;
	UnknownC08496();
}

/// $C0878B
void UnknownC0878B(ubyte arg1) {
	do {
		NextFrameDisplayID++;
		WaitUntilNextFrame();
	} while (--arg1 != 0);
}

/// $C0879D
void SetINIDISP(ubyte arg1) {
	INIDISP_MIRROR = arg1 & 0x8F;
}

/// $C087AB
void UnknownC087AB(ubyte arg1) {
	MOSAIC_MIRROR = (((INIDISP_MIRROR ^ 0xFF) << 4) & 0xF0) | arg1;
}

/// $C087CE
void FadeInWithMosaic(short arg1, short arg2, short arg3) {
	Unknown7E0028.a = 0;
	INIDISP_MIRROR = 0;
	while(true) {
		MOSAIC_MIRROR = 0;
		if (INIDISP_MIRROR + arg1 >= 0x0F) {
			break;
		}
		SetINIDISP(cast(ubyte)(INIDISP_MIRROR + arg1));
		if (arg3 != 0) {
			UnknownC087AB(cast(ubyte)arg3);
		}
		UnknownC0878B(cast(ubyte)arg2);
	}
	SetINIDISP(0xF);
}

/// $C08814
void FadeOutWithMosaic(short arg1, short arg2, short arg3) {
	Unknown7E0028.a = 0;
	while (true) {
		MOSAIC_MIRROR = 0;
		if ((INIDISP_MIRROR & 0x80) != 0) {
			break;
		}
		if (INIDISP_MIRROR - arg1 < 0) {
			break;
		}
		SetINIDISP(cast(ubyte)(INIDISP_MIRROR - arg1));
		if (arg3 != 0) {
			UnknownC087AB(cast(ubyte)arg3);
		}
		UnknownC0878B(cast(ubyte)arg2);
	}
	SetINIDISP(0x80);
	HDMAEN_MIRROR = 0;
	Unknown7E002B = 0;
	while (Unknown7E002B != 0) { Fiber.yield(); }
	HDMAEN = 0;
}

/// $C0886C
void FadeIn(ubyte arg1, ubyte arg2) {
	Unknown7E0028.a = arg1;
	Unknown7E0028.b = arg2;
	Unknown7E002A = arg2;
}

/// $C0887A
void FadeOut(ubyte arg1, ubyte arg2) {
	Unknown7E0028.a = cast(ubyte)((arg1^0xFF) + 1);
	Unknown7E0028.b = arg2;
	Unknown7E002A = arg2;
}

/// $C0888B
void UnknownC0888B() {
	while (true) {
		if (Unknown7E0028.a == 0) {
			return;
		}
		OAMClear();
		UpdateScreen();
		WaitUntilNextFrame();
	}
}

/// $C088B1
void OAMClear() {
	Unknown7E2504 = 0;
	Unknown7E2606 = 0;
	Unknown7E2708 = 0;
	Unknown7E280A = 0;
	if (NextFrameBufferID - 1 == 0) {
		OAMAddr = &OAM1[0];
		OAMEndAddr = OAM1.ptr + 128;
		OAMHighTableAddr = &OAM1HighTable[0];
		Unknown7E000A = 0x80;
		for (short i = 0; i < 128; i++) { //original code has this loop unrolled
			OAM1[i].yCoord = -32;
		}
	} else {
		OAMAddr = &OAM2[0];
		OAMEndAddr = OAM2.ptr + 128;
		OAMHighTableAddr = &OAM2HighTable[0];
		Unknown7E000A = 0x80;
		for (short i = 0; i < 128; i++) { //original code has this loop unrolled
			OAM2[i].yCoord = -32;
		}
	}
}

/// $C088A5
ushort UnknownC088A5(ushort arg1) {
	ushort tmp = Unknown7E000B;
	Unknown7E000B = arg1;
	return tmp;
}

/// $C08B19
void UnknownC08B19() {
	Unknown7E0009 = 0;
	OAMClear();
	UpdateScreen();
}

/// $C08B26
void UpdateScreen() {
	UnknownC08B8E();
	if (false /+Actually tests if the DBR is 0xFF, which should never happen+/) while(true) {}
	ubyte Unknown7E000Atmp = Unknown7E000A;
	if (Unknown7E000Atmp != 0x80) {
		// Shift right by two until a bit carries out
		// ...or, shift right by two until a bit is in position 2,
		// then do an extra shift after (so the bit in spot 2 shifts out)
		while ((Unknown7E000Atmp & 2) == 0) {
			Unknown7E000Atmp >>= 2;
		}
		Unknown7E000Atmp >>= 2;
	}
	*OAMHighTableAddr = Unknown7E000Atmp;
	BG1_X_POS_BUF[NextFrameBufferID - 1] = BG1_X_POS;
	BG1_Y_POS_BUF[NextFrameBufferID - 1] = BG1_Y_POS;
	BG2_X_POS_BUF[NextFrameBufferID - 1] = BG2_X_POS;
	BG2_Y_POS_BUF[NextFrameBufferID - 1] = BG2_Y_POS;
	BG3_X_POS_BUF[NextFrameBufferID - 1] = BG3_X_POS;
	BG3_Y_POS_BUF[NextFrameBufferID - 1] = BG3_Y_POS;
	BG4_X_POS_BUF[NextFrameBufferID - 1] = BG4_X_POS;
	BG4_Y_POS_BUF[NextFrameBufferID - 1] = BG4_Y_POS;
	NextFrameDisplayID = NextFrameBufferID;
	NextFrameBufferID ^= 3;
}

/// $C08B8E
void UnknownC08B8E() {
	if (Unknown7E2402 == 0) {
		UnknownC08C53();
	}
	for (short i =0 ; i < Unknown7E2504 / 2; i++) {
		Unknown7E000B = Unknown7E24C4[i];
		UnknownC08CD5(Unknown7E2404[i], Unknown7E2444[i], Unknown7E2484[i]);
	}
	if (Unknown7E2402 == 1) {
		UnknownC08C53();
	}
	for (short i =0 ; i < Unknown7E2606 / 2; i++) {
		Unknown7E000B = Unknown7E25C6[i];
		UnknownC08CD5(Unknown7E2506[i], Unknown7E2546[i], Unknown7E2586[i]);
	}
	if (Unknown7E2402 == 2) {
		UnknownC08C53();
	}
	for (short i =0 ; i < Unknown7E2708 / 2; i++) {
		Unknown7E000B = Unknown7E26C8[i];
		UnknownC08CD5(Unknown7E2608[i], Unknown7E2648[i], Unknown7E2688[i]);
	}
	if (Unknown7E2402 == 3) {
		UnknownC08C53();
	}
	for (short i =0 ; i < Unknown7E280A / 2; i++) {
		Unknown7E000B = Unknown7E27CA[i];
		UnknownC08CD5(Unknown7E270A[i], Unknown7E274A[i], Unknown7E278A[i]);
	}
}

/// $C08C53
void UnknownC08C53() {
	//You Get: Nothing
}

/// $C08C54
void UnknownC08C58F(const(SpriteMap)* arg1, short arg2, short arg3) {
	UnknownC08C58(arg1, arg2, arg3);
}

/// $C08C58
void UnknownC08C58(const(SpriteMap)* arg1, short arg2, short arg3) {
	UnknownC08C65[Unknown7E2400](arg1, arg2, arg3);
}

/// $C08C65
immutable void function(const(SpriteMap)*, short, short)[4] UnknownC08C65 = [
	&UnknownC08C6D,
	&UnknownC08C87,
	&UnknownC08CA1,
	&UnknownC08CBB,
];

/// $C08C6D
void UnknownC08C6D(const(SpriteMap)* arg1, short arg2, short arg3) {
	Unknown7E2404[Unknown7E2504 / 2] = arg1;
	Unknown7E2444[Unknown7E2504 / 2] = arg2;
	Unknown7E2484[Unknown7E2504 / 2] = arg3;
	Unknown7E24C4[Unknown7E2504 / 2] = Unknown7E000B;
	Unknown7E2504 += 2;
}

/// $C08C87
void UnknownC08C87(const(SpriteMap)* arg1, short arg2, short arg3) {
	Unknown7E2506[Unknown7E2606 / 2] = arg1;
	Unknown7E2546[Unknown7E2606 / 2] = arg2;
	Unknown7E2586[Unknown7E2606 / 2] = arg3;
	Unknown7E25C6[Unknown7E2606 / 2] = Unknown7E000B;
	Unknown7E2606 += 2;
}

/// $C08CA1
void UnknownC08CA1(const(SpriteMap)* arg1, short arg2, short arg3) {
	Unknown7E2608[Unknown7E2708 / 2] = arg1;
	Unknown7E2648[Unknown7E2708 / 2] = arg2;
	Unknown7E2688[Unknown7E2708 / 2] = arg3;
	Unknown7E26C8[Unknown7E2708 / 2] = Unknown7E000B;
	Unknown7E2708 += 2;
}

/// $C08CBB
void UnknownC08CBB(const(SpriteMap)* arg1, short arg2, short arg3) {
	Unknown7E270A[Unknown7E280A / 2] = arg1;
	Unknown7E274A[Unknown7E280A / 2] = arg2;
	Unknown7E278A[Unknown7E280A / 2] = arg3;
	Unknown7E27CA[Unknown7E280A / 2] = Unknown7E000B;
	Unknown7E280A += 2;
}

/// $C08CD5 - Draw a SpriteMap list into the OAM buffer
void UnknownC08CD5(const(SpriteMap)* arg1, short xbase, short ybase) {
	short xpos, ypos;
	ubyte abyte;
	bool carry;
	const(SpriteMap)* y = arg1;
	OAMEntry* x = OAMAddr;
	if (x >= OAMEndAddr) {
		return;
	}
	//some DBR manipulation was here
	for(;;y++){
		ypos = cast(byte)y.unknown0;
		if (ypos == -0x80) {
			// This is -1 since we do y++ due to continue
			y = y.unknown1ptr - 1;
			continue;
		}
		ypos += ybase - 1;
		if ((ypos >= 0xE0) || (ypos < -0x20)) {
			if (y.unknown4 >= 0x80) {
				break;
			}
			continue;
		}
		Unknown7E009F = ypos;
		x.startingTile = y.unknown10;
		x.flags = y.unknown11;
		xpos = cast(byte)y.unknown3;
		xpos += xbase;
		x.xCoord = cast(byte)xpos;
		if (xpos >= 0x100 || xpos < -0x100) {
			if (y.unknown4 >= 0x80) {
				break;
			}
			continue;
		}
		abyte = cast(ubyte)(xpos>>8);
		ROL(abyte, carry);
		Unknown7E000A = ROR(Unknown7E000A, carry);
		abyte = y.unknown4;
		ROR(abyte, carry);
		Unknown7E000A = ROR(Unknown7E000A, carry);
		if (carry) {
			OAMHighTableAddr[0] = Unknown7E000A;
			OAMHighTableAddr++;
			Unknown7E000A = 0x80;
		}
		x.yCoord = cast(byte)Unknown7E009F;
		x++;
		if (y.unknown4 >= 0x80 || x >= OAMEndAddr) {
			break;
		}
	}
	OAMAddr = x;
}

/// $C08D79
void UnknownC08D79(ubyte arg1) {
	Unknown7E000F &= 0xF0;
	Unknown7E000F |= arg1;
	BGMODE = Unknown7E000F;
}

/// $C08D92
void SetOAMSize(ubyte arg1) {
	OBSEL_MIRROR = arg1;
	OBSEL = arg1;
}

/// $C08D9E
void SetBG1VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	Unknown7E0011 = arg1 & 3;
	Unknown7E0011 |= ((arg2 >> 8) & 0xFC);
	BG1SC = Unknown7E0011;
	BG12NBA_MIRROR &= 0xF;
	BG1_X_POS = 0;
	BG1_Y_POS = 0;
	BG12NBA_MIRROR |= (arg3 >> 12);
	BG12NBA = BG12NBA_MIRROR;
}

/// $C08DDE
void SetBG2VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	Unknown7E0012 = arg1 & 3;
	Unknown7E0012 |= ((arg2 >> 8) & 0xFC);
	BG2SC = Unknown7E0012;
	BG12NBA_MIRROR &= 0xF;
	BG2_X_POS = 0;
	BG2_Y_POS = 0;
	BG12NBA_MIRROR |= ((arg3 >> 8) & 0xF0);
	BG12NBA = BG12NBA_MIRROR;
}

/// $C08E1C
void SetBG3VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	Unknown7E0013 = arg1 & 3;
	Unknown7E0013 |= ((arg2 >> 8) & 0xFC);
	BG3SC = Unknown7E0013;
	Unknown7E0016 &= 0xF;
	BG3_X_POS = 0;
	BG3_Y_POS = 0;
	Unknown7E0016 |= (arg3 >> 12);
	BG34NBA = Unknown7E0016;
}

/// $C08E5C
void SetBG4VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	Unknown7E0014 = arg1 & 3;
	Unknown7E0014 |= ((arg2 >> 8) & 0xFC);
	BG4SC = Unknown7E0014;
	Unknown7E0016 &= 0xF;
	BG4_X_POS = 0;
	BG4_Y_POS = 0;
	Unknown7E0016 |= ((arg3 >> 8) & 0xF0);
	BG34NBA = Unknown7E0016;
}

/// $C08E9A
ubyte rand() {
	ushort tmp = ror(cast(ushort)((cast(ushort)(RandA << 8) >> 8) * (RandB & 0xFF)), 2);
	RandB = cast(ushort)(((RandA << 8) | (RandB & 0xFF)) + 0x6D);
	ushort tmp2 = ror(cast(ushort)((tmp & 3) + RandA), 1);
	if (((tmp & 3 + RandA) & 1) != 0) {
		tmp2 |= 0x8000;
	}
	RandA = tmp2;
	return ror(tmp, 2) & 0xFF;
}

/// $C08F8B
void UnknownC08F8B() {
	ubyte a = DMAQueueIndex;
	while (Unknown7E0001 != a) {}
}

/// $C08F98
immutable UnknownC08F98Entry[4] UnknownC08F98 = [
	UnknownC08F98Entry(0xFE80, 0x0100, 0x0200),
	UnknownC08F98Entry(0x0000, 0x0000, 0x0100),
	UnknownC08F98Entry(0x0300, 0x0080, 0x0000),
	UnknownC08F98Entry(0x0200, 0x0200, 0x0000)
];

/// $C08FB0
immutable DMATableEntry[6] DMATable = [
	DMATableEntry(0x01, 0x18, 0x80),
	DMATableEntry(0x09, 0x18, 0x80),
	DMATableEntry(0x00, 0x18, 0x00),
	DMATableEntry(0x08, 0x18, 0x00),
	DMATableEntry(0x00, 0x19, 0x80),
	DMATableEntry(0x08, 0x19, 0x80),
];

/// $C08FC2
immutable ubyte[38] UnknownC08FC2 = [ 0x81, 0x39, 0x80, 0x80, 0x39, 0x00, 0x80, 0x3A, 0x80, 0x01, 0x18, 0x81, 0x09, 0x18, 0x81, 0x00, 0x18, 0x01, 0x08, 0x18, 0x01, 0x00, 0x19, 0x81, 0x08, 0x19, 0x81, 0x81, 0x39, 0x81, 0x80, 0x39, 0x01, 0x80, 0x3A, 0x81, 0xEB, 0x98 ];

/// $C0927C
void UnknownC0927C() {
	Unknown7E0A5E = &UnknownC0DB0F;
	FirstEntity = -1;
	EntityNextEntityTable[29] = -1;
	Unknown7E125A[69] = -1;
	Unknown7E0A52 = 0;
	Unknown7E0A54 = 0;
	short x = 0x38;
	do {
		EntityNextEntityTable[x / 2] = cast(short)(x + 2);
		x -= 2;
	} while (x >= 0);

	x = 0x88;
	do {
		Unknown7E125A[x / 2] = cast(short)(x + 2);
		x -= 2;
	} while (x >= 0);

	x = 0x3A;
	do {
		EntityScriptTable[x / 2] = -1;
		x -= 2;
	} while (x >= 0);

	x = 0x3A;
	do {
		EntitySpriteMapFlags[x / 2] = 0;
		EntityTickCallbacks[x / 2] = null;
		x -= 2;
	} while (x >= 0);

	x = 6;
	do {
		Unknown7E1A12[x / 2] = 0;
		Unknown7E1A1A[x / 2] = 0;
		Unknown7E1A22[x / 2] = 0;
		Unknown7E1A32[x / 2] = 0;
		Unknown7E1A2A[x / 2] = 0;
		Unknown7E1A3A[x / 2] = 0;
		Unknown7E1A02[x / 2] = 0;
		Unknown7E1A0A[x / 2] = 0;
		EntityDrawPriority[x / 2] = 0;
		x -= 2;
	} while (x >= 0);
	ClearEntityDrawSortingTable();
	Unknown7E0A60 = 0;
}

/// $C09279
void UnknownC09279() {
	assert(0, "Not used");
}

/// $C09321
short InitEntityWipe(short actionScript, short x, short y) {
	NewEntityPosZ = 0;
	NewEntityVar0 = 0;
	NewEntityVar1 = 0;
	NewEntityVar2 = 0;
	NewEntityVar3 = 0;
	NewEntityVar4 = 0;
	NewEntityVar5 = 0;
	NewEntityVar6 = 0;
	NewEntityVar7 = 0;
	NewEntityPriority = 0;
	EntityAllocationMinSlot = 0;
	EntityAllocationMaxSlot = 0x1E;
	return InitEntity(actionScript, x, y);
}

short InitEntity(short actionScript, short x, short y) {
	EntityAllocationMinSlot *= 2;
	EntityAllocationMaxSlot *= 2;
	bool allocationFailed;
	short newEntity = UnknownC09C02(allocationFailed);
	if (allocationFailed) {
		return 0;
	}
	bool __ignored;
	short newScript = UnknownC09D03(__ignored);
	EntityScriptIndexTable[newEntity / 2] = newScript;
	Unknown7E125A[newScript / 2] = -1;
	EntityMoveCallbacks[newEntity / 2] = &UnknownC09FAEEntry2;
	EntityScreenPositionCallbacks[newEntity / 2] = &UnknownC0A023;
	EntityDrawCallbacks[newEntity / 2] = &UnknownC0A3A4;
	EntityScriptVar0Table[newEntity / 2] = NewEntityVar0;
	EntityScriptVar1Table[newEntity / 2] = NewEntityVar1;
	EntityScriptVar2Table[newEntity / 2] = NewEntityVar2;
	EntityScriptVar3Table[newEntity / 2] = NewEntityVar3;
	EntityScriptVar4Table[newEntity / 2] = NewEntityVar4;
	EntityScriptVar5Table[newEntity / 2] = NewEntityVar5;
	EntityScriptVar6Table[newEntity / 2] = NewEntityVar6;
	EntityScriptVar7Table[newEntity / 2] = NewEntityVar7;
	EntityDrawPriority[newEntity / 2] = NewEntityPriority;
	EntityAbsXFractionTable[newEntity / 2] = 0x8000;
	EntityAbsYFractionTable[newEntity / 2] = 0x8000;
	EntityAbsZFractionTable[newEntity / 2] = 0x8000;
	EntityScreenXTable[newEntity / 2] = x;
	EntityAbsXTable[newEntity / 2] = x;
	EntityScreenYTable[newEntity / 2] = y;
	EntityAbsYTable[newEntity / 2] = y;
	EntityAbsZTable[newEntity / 2] = NewEntityPosZ;
	newEntity = UnknownC09C57(newEntity);
	//Unreachable code?
	/+
	UnknownC09C99();
	short newScript2 = UnknownC09D03(__ignored);
	EntityScriptIndexTable[newEntity / 2] = newScript2;
	Unknown7E125A[newScript2 / 2] = -1;
	+/
	EntityScriptTable[newEntity / 2] = actionScript;
	EntityAnimationFrames[newEntity / 2] = -1;
	EntityDeltaXFractionTable[newEntity / 2] = 0;
	EntityDeltaXTable[newEntity / 2] = 0;
	EntityDeltaYFractionTable[newEntity / 2] = 0;
	EntityDeltaYTable[newEntity / 2] = 0;
	EntityDeltaZFractionTable[newEntity / 2] = 0;
	EntityDeltaZTable[newEntity / 2] = 0;
	return UnknownC092F5Unknown4(&EventScriptPointers[actionScript][0], newEntity);
}

short InitEntityUnknown1(const(ubyte)* pc, short entityID) {
	return InitEntityUnknown1(pc, cast(short)(entityID * 2));
}
short InitEntityUnknown2(const(ubyte)* pc, short entityIndex) {
	if (EntityScriptTable[entityIndex / 2] < 0) {
		while(true) {} //oh no
	}
	entityIndex = UnknownC09C99(entityIndex);
	bool __ignored;
	short newScript = UnknownC09D03(__ignored);
	EntityScriptIndexTable[entityIndex / 2] = newScript;
	Unknown7E125A[newScript / 2] = 0;
	return UnknownC092F5Unknown4(pc, entityIndex);
}

short UnknownC092F5Unknown4(const(ubyte)* pc, short entityIndex) {
	ClearSpriteTickCallback(entityIndex);
	EntityProgramCounters[EntityScriptIndexTable[entityIndex / 2] / 2] = pc;
	EntitySleepFrames[EntityScriptIndexTable[entityIndex / 2] / 2] = 0;
	Unknown7E12E6[EntityScriptIndexTable[entityIndex / 2] / 2] = 0;
	return entityIndex / 2;
}
//actually part of the previous function normally, but whatever
void MovementNOP() {
	//nothin
}

/// $C0943C
void UnknownC0943C() {
	if (FirstEntity < 0) {
		return;
	}
	auto x = FirstEntity;
	do {
		EntityTickCallbackFlags[x] |= (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
		x = EntityNextEntityTable[x];
	} while(x >= 0);
}

/// $C09451
void UnknownC09451() {
	short x = FirstEntity;
	while (x >= 0) {
		EntityTickCallbackFlags[x / 2] &= 0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
		x = EntityNextEntityTable[x / 2];
	}
}

/// $C09466
void UnknownC09466() {
	if (Unknown7E0A60 != 0) {
		return;
	}
	// jump to slowrom
	Unknown7E0A60++;
	if (FirstEntity < 0) {
		Unknown7E0A60 = 0;
		return;
	}
	ActionScript80 = 0;
	ActionScript86 = 0;
	short x = FirstEntity;
	do {
		ActionScript88 = x;
		CurrentEntityOffset = x;
		CurrentEntitySlot = x;
		CurrentEntitySlot /= 2;
		Unknown7E0A56 = EntityNextEntityTable[CurrentEntitySlot];
		UnknownC094D0(Unknown7E0A56,x);
	} while ((x = Unknown7E0A56) >= 0);
	if (FirstEntity < 0) {
		Unknown7E0A60 = 0;
		return;
	}
	x = FirstEntity;
	do {
		CurrentEntitySlot = x;
		CurrentEntitySlot /= 2;
		ActionScript88 = x;
		if ((EntityTickCallbackFlags[CurrentEntitySlot] & OBJECT_MOVE_DISABLED) == 0) {
			EntityMoveCallbacks[CurrentEntitySlot]();
		}
		EntityScreenPositionCallbacks[CurrentEntitySlot]();
		x = EntityNextEntityTable[ActionScript88 / 2];
	} while(x >= 0);
	Unknown7E0A5E();
	Unknown7E0A60 = 0;
}

/// $C09466
void UnknownC094D0(short a, short x) {
	if ((EntityTickCallbackFlags[x / 2] & OBJECT_MOVE_DISABLED) == 0) {
		short y = EntityScriptIndexTable[x / 2];
		do {
			ActionScript8A = y;
			CurrentScriptOffset = y;
			CurrentScriptSlot = y;
			Unknown7E0A58 = Unknown7E125A[y / 2];
			UnknownC09506();
			y = Unknown7E0A58;
		} while (y > 0);
		x = ActionScript88;
	}
	if ((EntityTickCallbackFlags[x / 2] & OBJECT_TICK_DISABLED) == 0) {
		Movement42LoadedPtr = EntityTickCallbacks[x / 2];
		JumpToLoadedMovementPtr();
	}
}

/// $C09506
void UnknownC09506() {
	if (EntitySleepFrames[ActionScript8A / 2] != 0) {
		EntitySleepFrames[ActionScript8A / 2]--;
		return;
	}
	tracef("Entity %2d(%2d): wake up", CurrentEntitySlot, ActionScript8A / 2);
	const(ubyte)* ystart, y = EntityProgramCounters[ActionScript8A / 2];
	//ActionScript82 = EntityProgramCounterBanks[ActionScript8A / 2];
	ActionScript84 = &Unknown7E15A2[ActionScript8A / 2][0];
	do {
		ystart = y;
		ubyte a = (y++)[ActionScript80];
		tracef("Script %2d(%03d): %02x", ActionScript8A / 2, EntityScriptTable[CurrentEntitySlot], a);
		if (a < 0x70) {
			y = MovementControlCodesPointerTable[a](y);
		} else {
			ActionScript90 = a;
			EntitySleepFrames[ActionScript8A / 2] = a & 0xF;
			y = MovementControlCodesPointerTable[0x45 + ((ActionScript90 & 0x70) >> 4)](y);
		}
	} while (EntitySleepFrames[ActionScript8A / 2] == 0);
	tracef("Entity %2d(%2d): sleep for %3d frames", CurrentEntitySlot, ActionScript8A / 2, EntitySleepFrames[ActionScript8A / 2]);
	EntityProgramCounters[ActionScript8A / 2] = y;
	//EntityProgramCounterBanks[ActionScript8A / 2] = ActionScript82;
	EntitySleepFrames[ActionScript8A / 2]--;
}

immutable const(ubyte)* function(const(ubyte)*)[77] MovementControlCodesPointerTable = [
	&MovementCode00,
	&MovementCode01,
	&MovementCode02,
	&MovementCode03,
	&MovementCode04,
	&MovementCode05,
	&MovementCode06,
	&MovementCode07,
	&MovementCode08,
	&MovementCode09,
	&MovementCode0A,
	&MovementCode0B,
	&MovementCode0C,
	&MovementCode0D,
	&MovementCode0E,
	&MovementCode0F,
	&MovementCode10,
	&MovementCode11,
	&MovementCode12,
	&MovementCode13,
	&MovementCode14,
	&MovementCode15,
	&MovementCode16,
	&MovementCode17,
	&MovementCode18,
	&MovementCode19,
	&MovementCode1A,
	&MovementCode1B,
	&MovementCode1C,
	&MovementCode1D,
	&MovementCode1E,
	&MovementCode1F,
	&MovementCode20,
	&MovementCode21,
	&MovementCode22,
	&MovementCode23,
	&MovementCode24,
	&MovementCode25,
	&MovementCode26,
	&MovementCode27,
	&MovementCode28,
	&MovementCode29,
	&MovementCode2A,
	&MovementCode2B,
	&MovementCode2C,
	&MovementCode2D,
	&MovementCode2E,
	&MovementCode2F,
	&MovementCode30,
	&MovementCode31,
	&MovementCode32,
	&MovementCode33,
	&MovementCode34,
	&MovementCode35,
	&MovementCode36,
	&MovementCode37,
	&MovementCode38,
	&MovementCode39,
	&MovementCode3A,
	&MovementCode3B45,
	&MovementCode3C46,
	&MovementCode3D47,
	&MovementCode3E48,
	&MovementCode3F49,
	&MovementCode404A,
	&MovementCode414B,
	&MovementCode424C,
	&MovementCode43,
	&MovementCode44,
	&MovementCode3B45,
	&MovementCode3C46,
	&MovementCode3D47,
	&MovementCode3E48,
	&MovementCode3F49,
	&MovementCode404A,
	&MovementCode414B,
	&MovementCode424C,
];

/// $C095F2 - [00] - End
const(ubyte)* MovementCode00(const(ubyte)* y) {
	tracef("Script %2d(%03d): End", ActionScript8A / 2, EntityScriptTable[CurrentEntitySlot]);
	UnknownC09C3B(ActionScript88);
	EntitySleepFrames[ActionScript8A / 2] = -1;
	Unknown7E0A58 = -1;
	return y;
}

/// $C09603 - [01 XX] - Loop XX times
const(ubyte)* MovementCode01(const(ubyte)* y) {
	return MovementCode0124Common(y[ActionScript80], ActionScript8A, y + 1);
}
const(ubyte)* MovementCode0124Common(short a, short x, const(ubyte)* y) {
	tracef("Script %2d(%03d): Start loop, %3d times", ActionScript8A / 2, EntityScriptTable[CurrentEntitySlot], a);
	ActionScript90 = a;
	ActionScript94 = y;
	ActionScript84[Unknown7E12E6[x / 2] / 3].pc = y;
	ActionScript84[Unknown7E12E6[x / 2] / 3].counter = cast(ubyte)a;
	Unknown7E12E6[x / 2] += 3;
	return y;
}

/// $C09620 - [24] - Loop (Tempvar)
const(ubyte)* MovementCode24(const(ubyte)* y) {
	return MovementCode0124Common(EntityTempvars[ActionScript8A / 2], ActionScript8A, y);
}

/// $C09627 - [02] - Loop End
const(ubyte)* MovementCode02(const(ubyte)* y) {
	ActionScript94 = y;
	if (--ActionScript84[Unknown7E12E6[ActionScript8A / 2] / 3 - 1].counter == 0) {
		tracef("Script %2d(%03d): Finish loop", ActionScript8A / 2, EntityScriptTable[CurrentEntitySlot]);
		Unknown7E12E6[ActionScript8A / 2] -= 3;
		return ActionScript94;
	}
	tracef("Script %2d(%03d): Loop", ActionScript8A / 2, EntityScriptTable[CurrentEntitySlot]);
	return ActionScript84[Unknown7E12E6[ActionScript8A / 2] / 3 - 1].pc;
}

/// $C09649 - [19 NEARPTR] - Short Jump
const(ubyte)* MovementCode19(const(ubyte)* y) {
	return *cast(const(ubyte)**)&y[ActionScript80];
}

/// $C0964D - [03 PTR] - Long Jump
const(ubyte)* MovementCode03(const(ubyte)* y) {
	return *cast(const(ubyte)**)&y[ActionScript80];
}

/// $C09658 - [1A NEARPTR] - Short Call
const(ubyte)* MovementCode1A(const(ubyte)* y) {
	ActionScript8CScript = *cast(const(ubyte)**)&y[ActionScript80];
	ActionScript84[Unknown7E12E6[ActionScript8A / 2] / 3].pc = y + (const(ubyte)*).sizeof;
	Unknown7E12E6[ActionScript8A / 2] += 3;
	return ActionScript8CScript;
}

/// $C0966F - [1B] - Short Return
const(ubyte)* MovementCode1B(const(ubyte)* y) {
	if (Unknown7E12E6[ActionScript8A / 2] == 0) {
		return MovementCode0C(null);
	} else {
		Unknown7E12E6[ActionScript8A / 2] -= 3;
		return ActionScript84[Unknown7E12E6[ActionScript8A / 2] / 3].pc;
	}
}

/// $C09685 - [04 PTR] - Long Call
const(ubyte)* MovementCode04(const(ubyte)* y) {
	ActionScript8CScript = *cast(const(ubyte)**)&y[ActionScript80];
	ActionScript84[Unknown7E12E6[ActionScript8A / 2] / 3].pc = y + (const(ubyte)*).sizeof;
	Unknown7E12E6[ActionScript8A / 2] += 3;
	return ActionScript8CScript;
}

/// $C096AA - [05] - Long Return
const(ubyte)* MovementCode05(const(ubyte)* y) {
	if (Unknown7E12E6[ActionScript8A / 2] == 0) {
		return MovementCode0C(null);
	} else {
		Unknown7E12E6[ActionScript8A / 2] -= 3;
		return ActionScript84[Unknown7E12E6[ActionScript8A / 2] / 3].pc;
	}
}

/// $C096C3 - [06 XX] - Pause XX frames
const(ubyte)* MovementCode06(const(ubyte)* y) {
	EntitySleepFrames[ActionScript8A / 2] = y[ActionScript80];
	return y + 1;
}

/// $C096CF - [3B/45 XX] - Set Animation Frame
const(ubyte)* MovementCode3B45(const(ubyte)* y) {
	EntityAnimationFrames[ActionScript88 / 2] = y[ActionScript80] == 0xFF ? -1 : y[ActionScript80];
	return y + 1;
}

/// $C096E3 - [28 XXXX] - Set X
const(ubyte)* MovementCode28(const(ubyte)* y) {
	EntityAbsXTable[ActionScript88 / 2] = *cast(short*)&y[ActionScript80];
	EntityAbsXFractionTable[ActionScript88 / 2] = 0x8000;
	return y + 2;
}

/// $C096F3 - [29 XXXX] - Set Y
const(ubyte)* MovementCode29(const(ubyte)* y) {
	EntityAbsYTable[ActionScript88 / 2] = *cast(short*)&y[ActionScript80];
	EntityAbsYFractionTable[ActionScript88 / 2] = 0x8000;
	return y + 2;
}

/// $C09703 - [2A XXXX] - Set Z
const(ubyte)* MovementCode2A(const(ubyte)* y) {
	EntityAbsZTable[ActionScript88 / 2] = *cast(short*)&y[ActionScript80];
	EntityAbsZFractionTable[ActionScript88 / 2] = 0x8000;
	return y + 2;
}

/// $C09713
const(ubyte)* MovementCode3F49(const(ubyte)* y) {
	ActionScript90 = *cast(short*)&y[ActionScript80];
	y += 2;
	EntityDeltaXFractionTable[ActionScript88 / 2] = cast(ushort)(ActionScript90 << 8);
	EntityDeltaXTable[ActionScript88 / 2] = ActionScript90 >> 8;
	return y;
}

/// $C09731
const(ubyte)* MovementCode404A(const(ubyte)* y) {
	ActionScript90 = *cast(short*)&y[ActionScript80];
	y += 2;
	EntityDeltaYFractionTable[ActionScript88 / 2] = cast(ushort)(ActionScript90 << 8);
	EntityDeltaYTable[ActionScript88 / 2] = ActionScript90 >> 8;
	return y;
}

/// $C0974F
const(ubyte)* MovementCode414B(const(ubyte)* y) {
	ActionScript90 = *cast(short*)&y[ActionScript80];
	y += 2;
	EntityDeltaZFractionTable[ActionScript88 / 2] = cast(ushort)(ActionScript90 << 8);
	EntityDeltaZTable[ActionScript88 / 2] = ActionScript90 >> 8;
	return y;
}

/// $C0976D
const(ubyte)* MovementCode2E(const(ubyte)* y) {
	ActionScript90 = *cast(short*)&y[ActionScript80];
	auto i = ActionScript88 / 2;
	auto param = FixedPoint1616(cast(ushort)(ActionScript90 << 8), cast(short)(ActionScript90 >> 8));
	auto prev = FixedPoint1616(EntityDeltaXFractionTable[i], EntityDeltaXTable[i]);
	prev.combined += param.combined;
	EntityDeltaXFractionTable[i] = prev.fraction;
	EntityDeltaXTable[i] = prev.integer;
	return y + 2;
}

/// $C09792
const(ubyte)* MovementCode2F(const(ubyte)* y) {
	ActionScript90 = *cast(short*)&y[ActionScript80];
	auto i = ActionScript88 / 2;
	auto param = FixedPoint1616(cast(ushort)(ActionScript90 << 8), cast(short)(ActionScript90 >> 8));
	auto prev = FixedPoint1616(EntityDeltaYFractionTable[i], EntityDeltaYTable[i]);
	prev.combined += param.combined;
	EntityDeltaYFractionTable[i] = prev.fraction;
	EntityDeltaYTable[i] = prev.integer;
	return y + 2;
}

/// $C097B7
const(ubyte)* MovementCode30(const(ubyte)* y) {
	ActionScript90 = *cast(short*)&y[ActionScript80];
	auto i = ActionScript88 / 2;
	auto param = FixedPoint1616(cast(ushort)(ActionScript90 << 8), cast(short)(ActionScript90 >> 8));
	auto prev = FixedPoint1616(EntityDeltaZFractionTable[i], EntityDeltaZTable[i]);
	prev.combined += param.combined;
	EntityDeltaZFractionTable[i] = prev.fraction;
	EntityDeltaZTable[i] = prev.integer;
	return y + 2;
}

/// $C097DC
const(ubyte)* MovementCode31(const(ubyte)* y) {
	ubyte x = (y++)[ActionScript80];
	Unknown7E1A02[x] = *cast(short*)&y[ActionScript80];
	Unknown7E1A12[x] = 0;
	return y + 2;
}

/// $C097EF
const(ubyte)* MovementCode32(const(ubyte)* y) {
	ubyte x = (y++)[ActionScript80];
	Unknown7E1A0A[x] = *cast(short*)&y[ActionScript80];
	Unknown7E1A1A[x] = 0;
	return y + 2;
}

/// $C09802
const(ubyte)* MovementCode33(const(ubyte)* y) {
	ubyte x = (y++)[ActionScript80];
	ActionScript90 = *cast(short*)&y[ActionScript80];
	Unknown7E1A32[x] = cast(short)((ActionScript90 & 0xFF) << 8);
	Unknown7E1A22[x] = cast(short)((ActionScript90 & 0x8000) ? ((ActionScript90 & 0xFF00) | 0xFF) : (ActionScript90 & 0xFF00));
	return y + 2;
}

/// $C09826
const(ubyte)* MovementCode34(const(ubyte)* y) {
	ubyte x = (y++)[ActionScript80];
	ActionScript90 = *cast(short*)&y[ActionScript80];
	Unknown7E1A3A[x] = cast(short)((ActionScript90 & 0xFF) << 8);
	Unknown7E1A2A[x] = cast(short)((ActionScript90 & 0x8000) ? ((ActionScript90 & 0xFF00) | 0xFF) : (ActionScript90 & 0xFF00));
	return y + 2;
}

/// $C0984A
const(ubyte)* MovementCode35(const(ubyte)* y) {
	ubyte x = (y++)[ActionScript80];
	ActionScript90 = *cast(short*)&y[ActionScript80];
	Unknown7E1A32[x] += (ActionScript90 & 0xFF) << 8;
	Unknown7E1A22[x] += (ActionScript90 & 0x8000) ? ((ActionScript90 & 0xFF00) | 0xFF) : (ActionScript90 & 0xFF00);
	return y + 2;
}

/// $C09875
const(ubyte)* MovementCode36(const(ubyte)* y) {
	ubyte x = (y++)[ActionScript80];
	ActionScript90 = *cast(short*)&y[ActionScript80];
	Unknown7E1A3A[x] += (ActionScript90 & 0xFF) << 8;
	Unknown7E1A2A[x] += (ActionScript90 & 0x8000) ? ((ActionScript90 & 0xFF00) | 0xFF) : (ActionScript90 & 0xFF00);
	return y + 2;
}

/// $C098A0
const(ubyte)* MovementCode2B(const(ubyte)* y) {
	EntityAbsXTable[ActionScript88 / 2] += *cast(short*)&y[ActionScript80];
	return y + 2;
}

/// $C098AE
const(ubyte)* MovementCode2C(const(ubyte)* y) {
	EntityAbsYTable[ActionScript88 / 2] += *cast(short*)&y[ActionScript80];
	return y + 2;
}

/// $C098BC
const(ubyte)* MovementCode2D(const(ubyte)* y) {
	EntityAbsZTable[ActionScript88 / 2] += *cast(short*)&y[ActionScript80];
	return y + 2;
}

/// $C098CA
const(ubyte)* MovementCode37(const(ubyte)* y) {
	ubyte x = (y++)[ActionScript80];
	Unknown7E1A02[x] += *cast(short*)&y[ActionScript80];
	return y + 2;
}

/// $C098DE
const(ubyte)* MovementCode38(const(ubyte)* y) {
	ubyte x = (y++)[ActionScript80];
	Unknown7E1A0A[x] += *cast(short*)&y[ActionScript80];
	return y + 2;
}

/// $C098F2
const(ubyte)* MovementCode39(const(ubyte)* y) {
	EntityDeltaXFractionTable[ActionScript88 / 2] = 0;
	EntityDeltaXTable[ActionScript88 / 2] = 0;
	EntityDeltaYFractionTable[ActionScript88 / 2] = 0;
	EntityDeltaYTable[ActionScript88 / 2] = 0;
	EntityDeltaZFractionTable[ActionScript88 / 2] = 0;
	EntityDeltaZTable[ActionScript88 / 2] = 0;
	return y;
}

/// $C09907
void UnknownC09907(short arg1) {
	EntityDeltaXFractionTable[arg1] = 0;
	EntityDeltaXTable[arg1] = 0;
	EntityDeltaYFractionTable[arg1] = 0;
	EntityDeltaYTable[arg1] = 0;
	EntityDeltaZFractionTable[arg1] = 0;
	EntityDeltaZTable[arg1] = 0;
}

/// $C0991C
const(ubyte)* MovementCode3A(const(ubyte)* y) {
	Unknown7E1A32[y[ActionScript80]] = 0;
	Unknown7E1A22[y[ActionScript80]] = 0;
	Unknown7E1A3A[y[ActionScript80]] = 0;
	Unknown7E1A2A[y[ActionScript80]] = 0;
	return y + 1;
}

/// $C09931
const(ubyte)* MovementCode43(const(ubyte)* y) {
	EntityDrawPriority[ActionScript88 / 2] = (y++)[ActionScript80];
	return y;
}

/// $C0993D
const(ubyte)* MovementCode424C(const(ubyte)* y) {
	alias Func = short function(short a, ref const(ubyte)* y);
	Func f = *cast(Func*)&y[ActionScript80];
	ActionScript94 = y + Func.sizeof;
	EntityTempvars[ActionScript8A / 2] = f(EntityTempvars[ActionScript8A / 2], ActionScript94);
	return ActionScript94;
}

/// $C0995D
const(ubyte)* MovementCode0A(const(ubyte)* y) {
	if (EntityTempvars[ActionScript8A / 2] == 0) {
		return *cast(const(ubyte)**)&y[ActionScript80];
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C0996B
const(ubyte)* MovementCode0B(const(ubyte)* y) {
	if (EntityTempvars[ActionScript8A / 2] != 0) {
		return *cast(const(ubyte)**)&y[ActionScript80];
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C09979
const(ubyte)* MovementCode10(const(ubyte)* y) {
	ActionScript90 = EntityTempvars[ActionScript8A / 2];
	ActionScript94 = y + 1;
	if (y[ActionScript80] <= ActionScript90) {
		return ActionScript94 + y[ActionScript80] * (const(ubyte)*).sizeof;
	} else {
		return (cast(const(ubyte)**)ActionScript94)[ActionScript90];
	}
}

/// $C0999E
const(ubyte)* MovementCode11(const(ubyte)* y) {
	ActionScript90 = EntityTempvars[ActionScript8A / 2];
	ActionScript94 = y + 1;
	if (y[ActionScript80] <= ActionScript90) {
		return ActionScript94 + y[ActionScript80] * (const(ubyte)*).sizeof;
	} else {
		ActionScript84[Unknown7E12E6[ActionScript8A / 2] / 3].pc = ActionScript94 + y[ActionScript80] * (const(ubyte)*).sizeof;
		Unknown7E12E6[ActionScript8A / 2] += 3;
		return (cast(const(ubyte)**)ActionScript94)[ActionScript90];
	}
}

/// $C099C3
const(ubyte)* MovementCode0C(const(ubyte)* y) {
	ActionScript94 = y;
	return MovementCode0C13Common(ActionScript8A);
}
const(ubyte)* MovementCode0C13Common(short y) {
	ushort regY = UnknownC09D12(ActionScript88, y);
	EntitySleepFrames[regY / 2] = -1;
	if (EntityScriptIndexTable[ActionScript88 / 2] < 0) {
		MovementCode00(null);
	}
	return ActionScript94;
}

/// $C099DD
const(ubyte)* MovementCode07(const(ubyte)* y) {
	ActionScript94 = y;
	bool carry;
	short regY = UnknownC09D03(carry);
	if (!carry) {
		Unknown7E0A58 = regY;
		Unknown7E125A[regY / 2] = Unknown7E125A[ActionScript8A / 2];
		Unknown7E125A[ActionScript8A / 2] = regY;
		Unknown7E12E6[regY / 2] = 0;
		EntitySleepFrames[regY / 2] = 0;
		EntityProgramCounters[regY / 2] = *cast(const(ubyte)**)&y[ActionScript80];
		///blah blah blah bank
		return y + (const(ubyte)*).sizeof;
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C09A0E
const(ubyte)* MovementCode13(const(ubyte)* y) {
	ActionScript94 = y;
	if (Unknown7E125A[ActionScript8A / 2] >= 0) {
		return MovementCode0C13Common(Unknown7E125A[ActionScript8A / 2]);
	}
	return ActionScript94;
}

/// $C09A1A
const(ubyte)* MovementCode08(const(ubyte)* y) {
	EntityTickCallbacks[ActionScript88 / 2] = *cast(void function()*)&y[ActionScript80];
	y += (const(ubyte)*).sizeof;
	//banks!
	return y;
}

/// $C09A2E
const(ubyte)* MovementCode09(const(ubyte)* y) {
	EntitySleepFrames[ActionScript8A / 2] = -1;
	return y - 1;
}

/// $C09A38
const(ubyte)* MovementCode3C46(const(ubyte)* y) {
	EntityAnimationFrames[ActionScript88 / 2]++;
	return y;
}

/// $C09A3E
const(ubyte)* MovementCode3D47(const(ubyte)* y) {
	EntityAnimationFrames[ActionScript88 / 2]--;
	return y;
}

/// $C09A44
const(ubyte)* MovementCode3E48(const(ubyte)* y) {
	EntityAnimationFrames[ActionScript88 / 2] += cast(byte)y[ActionScript80];
	return y + 1;
}

/// $C09A5C
const(ubyte)* MovementCode18(const(ubyte)* y) {
	ActionScript8CMemory = *cast(ushort**)&y[ActionScript80];
	y += (ushort*).sizeof;
	ubyte x = (y++)[ActionScript80];
	ActionScript90 = (y++)[ActionScript80];
	UnknownC09ABD[x]();
	return y;
}

/// $C09A87
const(ubyte)* MovementCode14(const(ubyte)* y) {
	return MovementCode0D14Common(cast(ushort*)&EntityScriptVarTables[y[ActionScript80]][ActionScript88 / 2], y);
}

/// $C09A97
const(ubyte)* MovementCode27(const(ubyte)* y) {
	return MovementCode0D27Common(cast(ushort*)&EntityTempvars[ActionScript8A / 2], y);
}

/// $C09A9F
const(ubyte)* MovementCode0D(const(ubyte)* y) {
	return MovementCode0D14Common(*cast(ushort**)y[ActionScript80], y + (ushort*).sizeof - 1);
}

const(ubyte)* MovementCode0D14Common(ushort* a, const(ubyte)* y) {
	return MovementCode0D27Common(a, y + 1);
}
const(ubyte)* MovementCode0D27Common(ushort* a, const(ubyte)* y) {
	ActionScript8CMemory = a;
	ubyte x = (y++)[ActionScript80];
	ActionScript90 = *(cast(short*)&y[ActionScript80]);
	y += 2;
	UnknownC09ABD[x]();
	return y;
}

/// $C09ABD
immutable void function()[4] UnknownC09ABD = [
	&UnknownC09AC5,
	&UnknownC09ACC,
	&UnknownC09AD3,
	&UnknownC09ADB,
];

/// $C09AC5
void UnknownC09AC5() {
	ActionScript8CMemory[0] &= ActionScript90;
}

/// $C09ACC
void UnknownC09ACC() {
	ActionScript8CMemory[0] |= ActionScript90;
}

/// $C09AD3
void UnknownC09AD3() {
	ActionScript8CMemory[0] += ActionScript90;
}

/// $C09ADB
void UnknownC09ADB() {
	ActionScript8CMemory[0] ^= ActionScript90;
}

/// $C09AE2
const(ubyte)* MovementCode0E(const(ubyte)* y) {
	EntityScriptVarTables[y[ActionScript80]][ActionScript88 / 2] = *cast(short*)&y[1 + ActionScript80];
	return y + 3;
}

/// $C09AF9
short*[8] EntityScriptVarTables = [
	&EntityScriptVar0Table[0],
	&EntityScriptVar1Table[0],
	&EntityScriptVar2Table[0],
	&EntityScriptVar3Table[0],
	&EntityScriptVar4Table[0],
	&EntityScriptVar5Table[0],
	&EntityScriptVar6Table[0],
	&EntityScriptVar7Table[0],
];

/// $C09B09
const(ubyte)* MovementCode0F(const(ubyte)* y) {
	ClearSpriteTickCallback(ActionScript88);
	return y;
}

/// $C09B0F - [12 NEARPTR XX] - Write XX to memory
const(ubyte)* MovementCode12(const(ubyte)* y) {
	*(*cast(ubyte**)&y[ActionScript80]) = y[(ubyte*).sizeof + ActionScript80];
	return y + (ubyte*).sizeof + ubyte.sizeof;
}

/// $C09B1F - [15 NEARPTR XXXX] - Write XXXX to memory
const(ubyte)* MovementCode15(const(ubyte)* y) {
	*(*cast(ushort**)&y[ActionScript80]) = *cast(ushort*)&y[(ushort*).sizeof + ActionScript80];
	return y + (ushort*).sizeof + ushort.sizeof;
}

/// $C09B2C - [16 NEARPTR] - Break if false
const(ubyte)* MovementCode16(const(ubyte)* y) {
	if (EntityTempvars[ActionScript8A / 2] == 0) {
		y = *cast(const(ubyte)**)&y[ActionScript80];
		Unknown7E12E6[ActionScript8A / 2] -= 3;
		return y;
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C09B44 - [17 NEARPTR] - Break if true
const(ubyte)* MovementCode17(const(ubyte)* y) {
	if (EntityTempvars[ActionScript8A / 2] != 0) {
		y = *cast(const(ubyte)**)&y[ActionScript80];
		Unknown7E12E6[ActionScript8A / 2] -= 3;
		return y;
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C09B4D - [1C PTR] - Set Spritemap
const(ubyte)* MovementCode1C(const(ubyte)* y) {
	// The only stuff that uses this command uses a double pointer for its spritemaps
	EntitySpriteMapPointers[ActionScript88 / 2] = null;
	EntitySpriteMapPointersDptr[ActionScript88 / 2] = *cast(const(SpriteMap*)**)&y[ActionScript80];
	y += (const(SpriteMap*)*).sizeof;
	return y;
}

/// $C09B61 - [1D XXXX] - Write word to tempvar
const(ubyte)* MovementCode1D(const(ubyte)* y) {
	EntityTempvars[ActionScript8A / 2] = *cast(ushort*)&y[ActionScript80];
	return y + ushort.sizeof;
}

/// $C09B6B - [1E NEARPTR] - Write data at address to tempvar
const(ubyte)* MovementCode1E(const(ubyte)* y) {
	EntityTempvars[ActionScript8A / 2] = *(*cast(ushort**)&y[ActionScript80]);
	return y + (ushort*).sizeof;
}

/// $C09B79 - [1F XX] - Write tempvar to var
const(ubyte)* MovementCode1F(const(ubyte)* y) {
	ubyte x = y[ActionScript80];
	ActionScript8CMemory = cast(ushort*)EntityScriptVarTables[x];
	ActionScript8CMemory[0] = EntityTempvars[ActionScript8A / 2];
	return y + 1;
}

/// $C09B91 - [20 XX] - Write var to tempvar
const(ubyte)* MovementCode20(const(ubyte)* y) {
	EntityTempvars[ActionScript8A / 2] = (cast(ushort*)EntityScriptVarTables[y[ActionScript80]])[0];
	return y + 1;
}

/// $C09BA9 - [44] - Sleep for $tempvar frames
const(ubyte)* MovementCode44(const(ubyte)* y) {
	if (EntityTempvars[ActionScript8A / 2] != 0) {
		EntitySleepFrames[ActionScript8A / 2] = EntityTempvars[ActionScript8A / 2];
	}
	return y;
}

/// $C09BB4 - [21 XX] - Sleep for var XX frames
const(ubyte)* MovementCode21(const(ubyte)* y) {
	EntitySleepFrames[ActionScript8A / 2] = (cast(ushort*)EntityScriptVarTables[y[ActionScript80]])[0];
	return y + 1;
}

/// $C09BCC - [26 XX] - Set Animation Frame to Var XX
const(ubyte)* MovementCode26(const(ubyte)* y) {
	EntityAnimationFrames[ActionScript88 / 2] = EntityScriptVarTables[(y++)[ActionScript80]][ActionScript88 / 2];
	return y;
}

/// $C09BE4 - [22 NEARPTR] - Set Draw Callback
const(ubyte)* MovementCode22(const(ubyte)* y) {
	EntityDrawCallbacks[ActionScript88 / 2] = *cast(void function(short, short)*)&y[ActionScript80];
	y += (void function(short)).sizeof;
	return y;
}

/// $C09BEE - [23 NEARPTR] - Set Position Change Callback
const(ubyte)* MovementCode23(const(ubyte)* y) {
	EntityScreenPositionCallbacks[ActionScript88 / 2] = *cast(void function()*)&y[ActionScript80];
	y += (void function()).sizeof;
	return y;
}

/// $C09BF8 - [25 NEARPTR] - Set Physics Callback
const(ubyte)* MovementCode25(const(ubyte)* y) {
	EntityMoveCallbacks[ActionScript88 / 2] = *cast(void function()*)&y[ActionScript80];
	y += (void function()).sizeof;
	return y;
}

/// $C09C02 - allocates an entity slot
short UnknownC09C02(out bool flag) {
	if (Unknown7E0A54 < 0) {
		flag = true;
		return -1; //actually just whatever was in the X register when called
	}
	if (Unknown7E0A52 < 0) {
		flag = true;
		return -1; //actually just whatever was in the X register when called
	}
	short x = Unknown7E0A52;
	short y = -1;
	do {
		if ((x >= EntityAllocationMinSlot) && (x < EntityAllocationMaxSlot)) {
			break;
		}
		y = x;
	} while((x = EntityNextEntityTable[x / 2]) >= 0);
	if (y >= 0) {
		EntityNextEntityTable[y / 2] = EntityNextEntityTable[x / 2];
		flag = false;
		return x;
	} else {
		Unknown7E0A52 = EntityNextEntityTable[x / 2];
		flag = false;
		return x;
	}
}

/// $C09C35
void UnknownC09C35(short arg1) {
	UnknownC09C3B(cast(short)(arg1 * 2));
}

/// $C09C3B
//note: arg1 is passed via X register
void UnknownC09C3B(short arg1) {
	if (EntityScriptTable[arg1 / 2] >= 0) {
		EntityScriptTable[arg1 / 2] = -1;
		ClearSpriteTickCallback(arg1);
		short x = UnknownC09C99(arg1);
		short a = Unknown7E0A54;
		UnknownC09C73(a, x);
		UnknownC09C8F(x);
	}
}

/// $C09C57
short UnknownC09C57(short index) {
	EntityNextEntityTable[index / 2] = -1;
	if (FirstEntity >= 0) {
		short x, y = FirstEntity;
		while ((x = EntityNextEntityTable[y / 2]) >= 0) { y = x; }
		EntityNextEntityTable[y / 2] = index;
		return index;
	} else {
		FirstEntity = index;
		return index;
	}
}

/// $C09C73
void UnknownC09C73(ref short a, ref short x) {
	short y;
	UnknownC09CB5(a, x, y);
	if (y != -1) {
		EntityNextEntityTable[y / 2] = EntityNextEntityTable[x / 2];
	} else {
		FirstEntity = EntityNextEntityTable[x / 2];
	}
	if (x == Unknown7E0A56) {
		Unknown7E0A56 = a;
	}
}

/// $C09C8F
void UnknownC09C8F(short x) {
	EntityNextEntityTable[x / 2] = Unknown7E0A52;
	Unknown7E0A52 = x;
}

/// $C09C99
short UnknownC09C99(short index) {
	if (EntityScriptIndexTable[index / 2] < 0) {
		return index;
	}
	short Unknown7E0A54Copy = Unknown7E0A54;
	short x = index;
	short a = EntityScriptIndexTable[x / 2];
	Unknown7E0A54 = a;
	do {
		x = a;
		a = Unknown7E125A[x / 2];
	} while(a >= 0);
	Unknown7E125A[x / 2] = Unknown7E0A54Copy;
	return index;
}

/// $C09CB5
void UnknownC09CB5(ref short a, ref short x, ref short y) {
	short tmp = x;
	y = -1;
	x = FirstEntity;
	do {
		if (x == tmp) {
			break;
		}
		y = x;
		x = EntityNextEntityTable[x / 2];
	} while(true);
	x = tmp;
}

/// $C09CD7
void UnknownC09CD7() {
	short a = -32768;
	short x = Unknown7E0A52;
	while (x >= 0) {
		short y = EntityNextEntityTable[x / 2];
		EntityNextEntityTable[x / 2] = a;
		x = y;
	}
	x = 0x3A;
	short y = -1;
	do {
		if (EntityNextEntityTable[x / 2] == 0x8000) {
			EntityNextEntityTable[x / 2] = y;
			y = x;
		}
		x -= 2;
	} while (x >= 0);
	Unknown7E0A52 = y;
}

/// $C09D03 - allocates a script slot
short UnknownC09D03(out bool flag) {
	short result = Unknown7E0A54;
	if (result < 0) {
		flag = true;
		return result;
	}
	Unknown7E0A54 = Unknown7E125A[result / 2];
	flag = false;
	return result;
}

/// $C09D12
ushort UnknownC09D12(short x, short y) {
	UnknownC09D1F(x, y);
	Unknown7E125A[y / 2] = Unknown7E0A54;
	Unknown7E0A54 = y;
	return y;
}

/// $C09D1F
void UnknownC09D1F(short x, short y) {
	short tmpX;
	y = UnknownC09D3E(x, y, tmpX);
	if (tmpX != -1) {
		Unknown7E125A[tmpX / 2] = Unknown7E125A[y / 2];
	} else {
		EntityScriptIndexTable[x / 2] = Unknown7E125A[y / 2];
	}
	if (y == Unknown7E0A58) {
		Unknown7E0A58 = Unknown7E125A[y / 2];
	}
}

/// $C09D3E
short UnknownC09D3E(short x, short y, out short finalX) {
	short tmpY = y;
	y = EntityScriptIndexTable[x / 2];
	x = -1;
	while (true) {
		if (y == tmpY) {
			break;
		}
		x = y;
		y = Unknown7E125A[x / 2];
	}
	finalX = x;
	return tmpY;
}

/// $C09D86
ushort MovementDataRead8(ref const(ubyte)* arg1) {
	ushort a = arg1[ActionScript80];
	arg1++;
	return a;
}

/// $C09D94
ushort MovementDataRead16(ref const(ubyte)* arg1) {
	ushort a = *cast(const(ushort)*)&arg1[ActionScript80];
	arg1 += 2;
	return a;
}

/// $C09D99 - Same as MovementDataRead16, but with a short return
ushort MovementDataRead16Copy(ref const(ubyte)* arg1) {
	ushort a = *cast(const(ushort)*)&arg1[ActionScript80];
	arg1 += 2;
	return a;
}

/// does not exist in original game
void* MovementDataReadPtr(ref const(ubyte)* arg1) {
	void* a = *cast(void**)&arg1[ActionScript80];
	arg1 += (void*).sizeof;
	return a;
}

/// $C09D9E
void JumpToLoadedMovementPtr() {
	Movement42LoadedPtr();
}

/// $C09DA1
void ClearSpriteTickCallback(short index) {
	EntityTickCallbacks[index / 2] = &MovementNOP;
}

/// $C09E71
short UnknownC09E71(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16Copy(arg2);
	// InitEntityWipe takes 3 arguments but this code only prepares one of them...
	short x = void;
	ActionScript94 = arg2;
	return InitEntityWipe(tmp, x, cast(short)ActionScript94);
}

/// $C09EFF
short UnknownC09EFF() {
	return UnknownC09EFFCommon(CurrentEntityOffset);
}

/// $C09EFF
short UnknownC09EFFUnusedEntry() {
	return UnknownC09EFFCommon(ActionScript88);
}

/// $C09EFF
short UnknownC09EFFEntry2(short arg1) {
	return UnknownC09EFFCommon(cast(short)(arg1 * 2));
}

//note: arg1 was X register originally
short UnknownC09EFFCommon(short arg1) {
	short y = 0;
	//EntityAbsXFractionTable[arg1 / 2] + EntityDeltaXFractionTable[arg1 / 2]
	Unknown7E2848 = cast(short)(EntityAbsXTable[arg1 / 2] + EntityDeltaXTable[arg1 / 2]);
	if (Unknown7E2848 != EntityAbsXTable[arg1 / 2]) {
		y++;
	}
	//EntityAbsYFractionTable[arg1 / 2] + EntityDeltaYFractionTable[arg1 / 2]
	Unknown7E284A = cast(short)(EntityAbsYTable[arg1 / 2] + EntityDeltaYTable[arg1 / 2]);
	if (Unknown7E284A != EntityAbsYTable[arg1 / 2]) {
		y++;
	}
	return y;
}

/// $C09F3B
void UnknownC09F3BUnusedEntry() {
	CurrentEntityOffset = -1;
	UnknownC09F3BEntry2(-1);
}

/// $C09F3B
void UnknownC09F3BEntry2(short arg1) {
	for (short i = 0; i != 0x3C; i++) {
		EntityUnknown284C[i / 2] = EntityTickCallbackFlags[i / 2];
		i += 2;
	}
	if (FirstEntity < 0) {
		return;
	}
	short x = FirstEntity;
	while (true) {
		if (x != CurrentEntityOffset) {
			EntityTickCallbackFlags[x / 2] |= OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED;
		}
		x = EntityNextEntityTable[x / 2];
		if (x <= 0) {
			break;
		}
	}
}

/// $C09F71
void UnknownC09F71() {
	for (short i = 0; i != 30 * 2; i++) {
		EntityTickCallbackFlags[i / 2] = EntityUnknown284C[i / 2];
		i += 2;
	}
}

/// $C09F82
short ChooseRandom(short, ref const(ubyte)* arg1) {
	ActionScript90 = arg1[ActionScript80];
	ActionScript94 = arg1 + 1;
	ActionScript94 += ActionScript90 * 2;
	return (cast(const(short)*)arg1)[rand() % ActionScript90];
}

/// $C09FA8
short UnknownC09FA8() {
	return cast(short)(rand() << 8);
}

/// $C09FAE
void ActionScriptFadeIn(short, ref const(ubyte)* arg1) {
	ubyte a = (arg1++)[ActionScript80];
	ubyte b = (arg1++)[ActionScript80];
	FadeIn(a, b);
}

/// $C09FAE
void UnknownC09FAEEntry2() {
	UnknownC09FAEEntry3(ActionScript88);
}

/// $C09FB0
void UnknownC09FAEEntry3(short arg1) {
	short i = arg1 / 2;
	FixedPoint1616 pos, delta;

	pos = FixedPoint1616(EntityAbsXFractionTable[i], EntityAbsXTable[i]);
	delta = FixedPoint1616(EntityDeltaXFractionTable[i], EntityDeltaXTable[i]);
	pos.combined += delta.combined;
	EntityAbsXTable[i] = cast(short)pos.integer;
	EntityAbsXFractionTable[i] = pos.fraction;

	pos = FixedPoint1616(EntityAbsYFractionTable[i], EntityAbsYTable[i]);
	delta = FixedPoint1616(EntityDeltaYFractionTable[i], EntityDeltaYTable[i]);
	pos.combined += delta.combined;
	EntityAbsYTable[i] = cast(short)pos.integer;
	EntityAbsYFractionTable[i] = pos.fraction;
}

/// $C09FAE
void ActionScriptFadeOut(short, ref const(ubyte)* arg1) {
	ubyte a = (arg1++)[ActionScript80];
	ubyte b = (arg1++)[ActionScript80];
	FadeOut(a, b);
}

/// $C09F??
void UnknownC09FAEEntry4() {
	//nothing!
}

/// $C09FF1
void UnknownC09FF1() {
	UnknownC09FAEEntry2();
	EntityAbsZFractionTable[ActionScript88 / 2] += EntityDeltaZFractionTable[ActionScript88 / 2];
	EntityAbsZTable[ActionScript88 / 2] += EntityDeltaZTable[ActionScript88 / 2];
	UnknownC0C7DB();
}

/// $C0A00C
void UnknownC0A00C() {
	UnknownC09FAEEntry2();
	EntityAbsZFractionTable[ActionScript88 / 2] += EntityDeltaZFractionTable[ActionScript88 / 2];
	EntityAbsZTable[ActionScript88 / 2] += EntityDeltaZTable[ActionScript88 / 2];
}

/// $C0A023
void UnknownC0A023() {
	EntityScreenXTable[ActionScript88 / 2] = cast(short)(EntityAbsXTable[ActionScript88 / 2] - BG1_X_POS);
	EntityScreenYTable[ActionScript88 / 2] = cast(short)(EntityAbsYTable[ActionScript88 / 2] - BG1_Y_POS);
}

/// $C0A039
void UnknownC0A039() {
	//nothing
}

/// $C0A03A
void UnknownC0A03A() {
	EntityScreenXTable[ActionScript88 / 2] = cast(short)(EntityAbsXTable[ActionScript88 / 2] - BG1_X_POS);
	EntityScreenYTable[ActionScript88 / 2] = cast(short)(EntityAbsYTable[ActionScript88 / 2] - BG1_Y_POS - EntityAbsZTable[ActionScript88 / 2]);
}

/// $C0A055
void UnknownC0A055() {
	EntityScreenXTable[ActionScript88 / 2] = cast(short)(EntityAbsXTable[ActionScript88 / 2] - BG3_X_POS);
	EntityScreenYTable[ActionScript88 / 2] = cast(short)(EntityAbsYTable[ActionScript88 / 2] - BG3_Y_POS);
}

/// $C0A06C
void UnknownC0A06C() {
	EntityScreenXTable[ActionScript88 / 2] = cast(short)(EntityAbsXTable[ActionScript88 / 2] - BG3_X_POS);
	EntityAbsXTable[ActionScript88 / 2] = cast(short)(EntityAbsXTable[ActionScript88 / 2] - BG3_X_POS);
	EntityScreenYTable[ActionScript88 / 2] = cast(short)(EntityAbsYTable[ActionScript88 / 2] - BG3_Y_POS);
	EntityAbsYTable[ActionScript88 / 2] = cast(short)(EntityAbsYTable[ActionScript88 / 2] - BG3_Y_POS);
}

/// $C0A0A0
void UnknownC0A0A0() {
	EntityScreenXTable[ActionScript88 / 2] = cast(short)(EntityAbsXTable[ActionScript88 / 2] - BG3_X_POS);
	EntityScreenYTable[ActionScript88 / 2] = cast(short)(EntityAbsYTable[ActionScript88 / 2] - BG3_Y_POS - EntityAbsZTable[ActionScript88 / 2]);
}

/// $C0A0BB
void UnknownC0A0BB() {
	EntityScreenXTable[ActionScript88 / 2] = EntityAbsXTable[ActionScript88 / 2];
	EntityScreenYTable[ActionScript88 / 2] = EntityAbsYTable[ActionScript88 / 2];
}

/// $C0A0CA
void UnknownC0A0CA(short arg1) {
	while (arg1 < 0) {}
	ActionScript88 = cast(ushort)(arg1 * 2);
	UnknownC0A0E3(ActionScript88, arg1 < 0);
}

/// $C0A0E3
void UnknownC0A0E3(short arg1, bool overflowed) {
	if ((EntitySpriteMapFlags[arg1 / 2] < 0) || overflowed) {
		return;
	}
	ActionScript8C = EntitySpriteMapPointers[arg1 / 2];
	if (EntityAnimationFrames[arg1 / 2] >= 0) {
		EntityDrawCallbacks[arg1 / 2](EntityAnimationFrames[arg1 / 2], arg1);
	}
}

/// $C0A0FA
void UnknownC0A0FA(short arg1, short arg2) {
	Unknown7E000B = ActionScript8E;
	Unknown7E2400 = EntityDrawPriority[arg2 / 2];
	// This uses a double pointer to the spritemap, indexed by the animation frame.
	// Don't use the value in 8C!
	UnknownC08C58(EntitySpriteMapPointersDptr[arg2 / 2][arg1], EntityAbsXTable[arg2 / 2], EntityAbsYTable[arg2 / 2]);
}

/// $C0A11C
void CheckHardware() {
	//AntiPiracyScratchSpace = 0x30;
	//AntiPiracyMirrorTest = 0x31;
	if (false/*AntiPiracyScratchSpace != AntiPiracyMirrorTest*/) {
		DisplayAntiPiracyScreen();
	}
	if ((STAT78 & 0x10) != 0) {
		DisplayFaultyGamepakScreen();
	}
}

/// $C0A1??
short UnknownC0A156F(short x, short y) {
	return UnknownC0A156(x, y);
}

/// $C0A156
short UnknownC0A156(short x, short y) {
	if ((x | y) < 0) {
		return -1;
	}
	if ((x == Unknown7E2888) && (y == Unknown7E288A)) {
		return Unknown7E288C;
	}
	Unknown7E2888 = x;
	Unknown7E288A = y;
	return UnknownC0A1AE[y & 7](MapDataTileTableChunksTable[(y & 4) != 0 ? 10 : 9][(((y / 8) & 0xFF) << 8) | x], y & 7, cast(short)((((y / 8) & 0xFF) << 8) | x));
}

/// $C0A1AE
short function(short, short, short)[8] UnknownC0A1AE = [
	&UnknownC0A1CE4,
	&UnknownC0A1CE3,
	&UnknownC0A1CE2,
	&UnknownC0A1CE,
	&UnknownC0A1CE4,
	&UnknownC0A1CE3,
	&UnknownC0A1CE2,
	&UnknownC0A1CE,
];

/// $C0A1CE
short UnknownC0A1CE(short arg1, short xreg, short yreg) {
	return UnknownC0A1CE2(arg1 / 4, xreg, yreg);
}
short UnknownC0A1CE2(short arg1, short xreg, short yreg) {
	return UnknownC0A1CE3(arg1 / 4, xreg, yreg);
}
short UnknownC0A1CE3(short arg1, short xreg, short yreg) {
	return UnknownC0A1CE4(arg1 / 4, xreg, yreg);
}
short UnknownC0A1CE4(short arg1, short xreg, short yreg) {
	short x08 = (arg1 & 3) << 8;
	Unknown7E288C = MapDataTileTableChunksTable[xreg][yreg] | x08;
	return Unknown7E288C;
}

/// $C0A1F2
void UnknownC0A1F2(short arg1) {
	const(ubyte)* source = cast(const(ubyte)*)UnknownC0A20C[arg1];
	ubyte* destination = cast(ubyte*)&palettes[2][0];
	short bytesLeft = 0xBF;
	while (--bytesLeft >= 0) {
		*(destination++) = *(source++);
	}
	Unknown7E0030 = 8;
}

__gshared const ubyte*[8] UnknownC0A20C;

/// $C0A21C
short UnknownC0A21C(short arg1) {
	short y = FirstEntity;
	while (y >= 0) {
		if (arg1 == EntityTPTEntries[y / 2]) {
			return arg1;
		}
		y = EntityNextEntityTable[y / 2];
	}
	return 0;
}

/// $C0A254
void UnknownC0A254(short arg1) {
	EntityScreenXTable[arg1] = cast(short)(EntityAbsXTable[arg1] - BG1_X_POS);
	EntityScreenYTable[arg1] = cast(short)(EntityAbsYTable[arg1] - BG1_Y_POS);
}

/// $C0A26B
void UnknownC0A26B() {
	if ((ActionScript88 == Unknown7E5D78) || ((EntityScriptVar7Table[ActionScript88 / 2] & 0) != 0) || (Unknown7E5DB8 != 0) || (EntityDirections[ActionScript88 / 2] != Unknown7E5D76) || (UnknownC0A350[EntityDirections[ActionScript88 / 2]](Unknown7E5D78) * 2 != 0)) {
		EntityScreenXTable[ActionScript88 / 2] = cast(short)(EntityAbsXTable[ActionScript88 / 2] - BG1_X_POS);
		EntityScreenYTable[ActionScript88 / 2] = cast(short)(EntityAbsYTable[ActionScript88 / 2] - BG1_Y_POS);
	}
	//return ActionScript88;
}

/// $C0A2AB
immutable short[6] UnknownC0A2AB = [ 0, 17, 32, 47, 62, 77 ];

/// $C0A2B7
short UnknownC0A2B7(short arg1) {
	short a = EntityScreenXTable[arg1 / 2] ^ EntityScreenXTable[ActionScript88 / 2];
	if (a != 0) {
		return a;
	}
	a = cast(short)(EntityAbsYTable[arg1 / 2] - EntityAbsYTable[ActionScript88 / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	a -= UnknownC0A2AB[EntityScriptVar5Table[ActionScript88 / 2]];
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	if (a == 0) {
		return a;
	}
	return cast(short)(a - 1);
}

/// $C0A2E1
short UnknownC0A2E1(short arg1) {
	short a = EntityScreenYTable[arg1 / 2] ^ EntityScreenYTable[ActionScript88 / 2];
	if (a != 0) {
		return a;
	}
	a = cast(short)(EntityAbsXTable[arg1 / 2] - EntityAbsXTable[ActionScript88 / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	a -= UnknownC0A2AB[EntityScriptVar5Table[ActionScript88 / 2]];
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	if (a == 0) {
		return a;
	}
	return cast(short)(a - 1);
}

/// $C0A30B
immutable short[6] UnknownC0A30B = [ 0, 11, 22, 32, 43, 54 ];

/// $C0A317
short UnknownC0A317(short arg1) {
	short a = cast(short)(EntityAbsXTable[arg1 / 2] - EntityAbsXTable[ActionScript88 / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	ActionScript00s = a;
	if (ActionScript00s < UnknownC0A30B[EntityScriptVar5Table[ActionScript88 / 2]]) {
		return ActionScript00s;
	}
	a = cast(short)(EntityAbsYTable[arg1 / 2] - EntityAbsYTable[ActionScript88 / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	a -= ActionScript00s;
	if (a == 0) {
		return a;
	}
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	return cast(short)(a - 1);
}

/// $C0A350
immutable short function(short)[8] UnknownC0A350 = [
	&UnknownC0A2B7,
	&UnknownC0A317,
	&UnknownC0A2E1,
	&UnknownC0A317,
	&UnknownC0A2B7,
	&UnknownC0A317,
	&UnknownC0A2E1,
	&UnknownC0A317,
];

/// $C0A360
void UnknownC0A360() {
	if (UNKNOWN_30X2_TABLE_41[ActionScript88 / 2] >= 0) {
		if ((EntityObstacleFlags[ActionScript88 / 2] & 0xD0) != 0) {
			MovementCode39(null);
			return;
		} else {
			if (EntityCollidedObjects[ActionScript88 / 2] >= 0) {
				return;
			} else {
				return UnknownC0A37ACommon(ActionScript88);
			}
		}
	} else {
		return UnknownC0A37ACommon(ActionScript88);
	}
}

/// $C0A37A
void UnknownC0A37A() {
	UnknownC0A37ACommon(ActionScript88);
}

void UnknownC0A37ACommon(short arg1) {
	UnknownC09FAEEntry3(arg1);
	UnknownC0C7DB();
}

/// $C0A384
void UnknownC0A384() {
	if (UNKNOWN_30X2_TABLE_41[ActionScript88 / 2] <= 0) {
		if ((EntityObstacleFlags[ActionScript88 / 2] & 0xD0) != 0) {
			MovementCode39(null);
		} else {
			if (EntityCollidedObjects[ActionScript88 / 2] <= 0) {
				return;
				//some unreachable code here
			}
		}
	}
	UnknownC09FAEEntry3(ActionScript88);
}

/// $C0A3A4
// originally handwritten assembly, id was actually an offset
void UnknownC0A3A4(short, short id) {
	if ((Unknown7E341A[id / 2] & 1) != 0) {
		ActionScript8C += EntityUnknown2916[id / 2] / 5;
	}
	ActionScript00 = 0x30;
	ActionScript02 = 0x30;
	if ((EntitySurfaceFlags[id /2] & 1) != 0) {
		ActionScript02 = 0x20;
	}
	if ((EntitySurfaceFlags[id / 2] & 2) != 0) {
		ActionScript00 = 0x20;
	}
	short y = 50;
	for (short i = UNKNOWN_30X2_TABLE_38[id / 2] & 0xFF; i >= 0; i--) {
		y++;
		(cast()ActionScript8C[y]).unknown3 = (ActionScript8C[y].unknown3 & 0xCF) | (ActionScript00 & 0xFF);
	}
	for (short i = UNKNOWN_30X2_TABLE_38[ActionScript88 / 2]; i >= 0; i--) {
		y++;
		(cast()ActionScript8C[y]).unknown3 = (ActionScript8C[y].unknown3 & 0xCF) | (ActionScript02 & 0xFF);
	}
	Unknown7E000B = ActionScript8E;
	Unknown7E2400 = EntityDrawPriority[ActionScript88 / 2];
	short Unknown7E2400Copy = Unknown7E2400;
	if ((Unknown7E2400 & 0x8000) != 0) {
		Unknown7E2400 = EntityDrawPriority[Unknown7E2400Copy & 0x3F];
		if ((Unknown7E2400 & 0x4000) == 0) {
			EntityDrawPriority[ActionScript88 / 2] = 0;
		}
	}
	UnknownC0AC43();
	Unknown7E000B = ActionScript8E;
	UnknownC08C58(ActionScript8C, EntityScreenXTable[ActionScript88 / 2], EntityScreenYTable[ActionScript88 / 2]);
}

/// $C0A443
//what a mess
void UnknownC0A443() {
	ActionScript00 = (Unknown7E2890 + CurrentEntitySlot >> 3) & 1;
	ActionScript02 = cast(ubyte)((EntityDirections[ActionScript88 / 2] * 2) | ActionScript00);
	if (((UNKNOWN_30X2_TABLE_40[ActionScript88 / 2] >> 8) | ((UNKNOWN_30X2_TABLE_40[ActionScript88 / 2] &0xFF) << 8) | ActionScript02) == Unknown7E3456[ActionScript88 / 2]) {
		return;
	}
	Unknown7E3456[ActionScript88 / 2] = cast(short)((UNKNOWN_30X2_TABLE_40[ActionScript88 / 2] >> 8) | ((UNKNOWN_30X2_TABLE_40[ActionScript88 / 2] &0xFF) << 8) | ActionScript02);

	UnknownC0A443Unknown10();
}

/// $C0A472
void UnknownC0A472() {
	Unknown7E2892 = (Unknown7E0002 >> 3) & 1;
	UnknownC0A443Unknown10();
}
void UnknownC0A443MovementEntry3() {
	UnknownC0A443Unknown9(ActionScript88);
}
void UnknownC0A443Entry2(short arg1) {
	UnknownC0A443Unknown9(cast(short)(arg1 * 2));
}
void UnknownC0A443Unknown9(short arg1) {
	Unknown7E2892 = EntityAnimationFrames[arg1 / 2];
	UnknownC0A443Entry4(arg1);
}
void UnknownC0A443Entry3() {
	Unknown7E2892 = 0;
	if (UnknownC0C711() != 0) {
		UnknownC0A443Unknown10();
	}
}
void UnknownC0A443MovementEntry1() {
	Unknown7E2892 = 1;
	if (UnknownC0C711() != 0) {
		UnknownC0A443Unknown10();
	}
}
void UnknownC0A443MovementEntry2() {
	Unknown7E2892 = 0;
	UnknownC0A443Unknown10();
}
void UnknownC0A443Unknown10() {
	UnknownC0A443Entry4(ActionScript88);
}
void UnknownC0A443Entry4(short arg1) {
	ActionScript08 = arg1;
	ActionScript00 = cast(ubyte)(EntityTileHeights[arg1 / 2]);
	DMA_COPY_SIZE = EntityByteWidths[arg1 / 2];
	DMA_COPY_VRAM_DEST = EntityVramAddresses[arg1 / 2];
	//x04 = EnttiyGraphicsPointerHigh[arg1 / 2]
	ubyte* x02 = cast(ubyte*)EntityGraphicsPointers[arg1 / 2];
	if (SpriteDirectionMappings4Direction[EntityDirections[arg1 / 2]] != 0) {
		for (short i = SpriteDirectionMappings4Direction[EntityDirections[arg1 / 2]]; i > 0; i--) {
			x02 += 4;
		}
	}
	if (Unknown7E2892 != 0) {
		x02 += 2;
	}
	if (*x02 != 0) {
		return;
	}
	if ((EntitySurfaceFlags[arg1 / 2] & 8) != 0) {
		return;
	}
	Unknown7E0091 = 3;
	DMA_COPY_RAM_SRC = &UnknownC40BE8;
	UnknownC0A56E();
	if (--ActionScript00 == 0) {
		return;
	}
	if ((ActionScript06 & 0x4) != 0) {
		UnknownC0A56E();
		if (--ActionScript00 == 0) {
			return;
		}
	}
	Unknown7E341A[ActionScript08 / 2] = *x02;
	//TODO: rework this
	//DMA_COPY_RAM_SRC = cast(void*)((*x02) & 0xFFF0);
	Unknown7E0091 = 0;
	//DMA_COPY_RAM_SRC + 2 = UNKNOWN_30X2_TABLE_31[arg1 / 2];
	while (true) {
		UnknownC0A56E();
		if (--ActionScript00 == 0) {
			return;
		}
		DMA_COPY_RAM_SRC += DMA_COPY_SIZE;
	}
}

/// $C0A56E
void UnknownC0A56E() {
	if (((((DMA_COPY_SIZE / 2) + DMA_COPY_VRAM_DEST - 1) ^ DMA_COPY_VRAM_DEST) & 0x100) != 0) {
		const(void)* DMA_COPY_RAM_SRCCopy = DMA_COPY_RAM_SRC;
		ushort DMA_COPY_SIZECopy = DMA_COPY_SIZE;
		ushort DMA_COPY_VRAM_DESTCopy = DMA_COPY_VRAM_DEST;
		DMA_COPY_SIZE = cast(ushort)((((DMA_COPY_VRAM_DEST + 0x100) & 0xFF00) - DMA_COPY_VRAM_DEST) * 2);
		CopyToVramCommon();
		DMA_COPY_RAM_SRC += DMA_COPY_SIZE;
		DMA_COPY_VRAM_DEST = cast(ushort)(((DMA_COPY_VRAM_DEST + 0x100) & 0xFF00) + 0x100);
		DMA_COPY_SIZE = cast(ushort)(DMA_COPY_SIZECopy - DMA_COPY_SIZE);
		CopyToVramCommon();
		DMA_COPY_VRAM_DEST = DMA_COPY_VRAM_DESTCopy;
		DMA_COPY_SIZE = DMA_COPY_SIZECopy;
		DMA_COPY_RAM_SRC = DMA_COPY_RAM_SRCCopy;
	} else {
		CopyToVramCommon();
	}
	if ((DMA_COPY_VRAM_DEST & 0x100) == 0) {
		DMA_COPY_VRAM_DEST += 0x100;
		return;
	}
	if (((((((DMA_COPY_SIZE + 0x20) & 0xFFC0) / 2) + DMA_COPY_VRAM_DEST) ^ DMA_COPY_VRAM_DEST) & 0x100) != 0) {
		DMA_COPY_VRAM_DEST = cast(ushort)((((DMA_COPY_SIZE + 0x20) & 0xFFC0) / 2) + DMA_COPY_VRAM_DEST);
	} else {
		DMA_COPY_VRAM_DEST = cast(ushort)((((DMA_COPY_SIZE + 0x20) & 0xFFC0) / 2) + DMA_COPY_VRAM_DEST - 0x100);
	}
}

/// $C0A60B
ushort[12] SpriteDirectionMappings4Direction = [0, 0, 1, 2, 2, 2, 3, 0, 4, 5, 6, 7];

/// $C0A623
ushort[8] SpriteDirectionMappings8Direction = [0, 4, 1, 5, 2, 6, 3, 7];

/// $C0A643
void UnknownC0A643(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	EntityTPTEntries[ActionScript88 / 2] = SetDirection(tmp, arg2);
}

/// $C0A651
short SetDirection8(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead8(arg2);
	ActionScript94 = arg2;
	Unknown7E1A86[ActionScript88 / 2] = SetDirection(tmp, arg2);
	return 0;
}

/// $C0A65F
short SetDirection(short arg1, ref const(ubyte)*) {
	if (UNKNOWN_30X2_TABLE_41[ActionScript88 / 2] >= 0) {
		EntityDirections[ActionScript88 / 2] = arg1;
	}
	return arg1;
}

/// $C0A66D
void UnknownC0A66D(short arg1) {
	EntityDirections[ActionScript88 / 2] = arg1;
}

/// $C0A673
short UnknownC0A673() {
	return EntityDirections[ActionScript88 / 2];
}

/// $C0A679
short SetSurfaceFlags(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead8(arg2);
	ActionScript94 = arg2;
	EntitySurfaceFlags[ActionScript88 / 2] = tmp;
	return 0;
}

/// $C0A685
void UnknownC0A685(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC0A685Entry2(tmp, arg2);
}

/// $C0A685
void UnknownC0A685Entry2(short arg1, ref const(ubyte)* arg2) {
	UNKNOWN_30X2_TABLE_35[ActionScript88 / 2] = arg1;
}

/// $C0A691
short UnknownC0A691() {
	return UNKNOWN_30X2_TABLE_35[ActionScript88 / 2];
}

/// $C0A6A2
void UnknownC0A6A2(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC0CA4E(tmp);
}

/// $C0A6AD
void UnknownC0A6AD(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC0CBD3(tmp);
}

/// $C0A6B8
short UnknownC0A6B8() {
	short tmp = 0;
	if (EntityCollidedObjects[ActionScript88 / 2] >= 0) {
		tmp--;
	}
	return tmp;
}

/// $C0A6DA
short ClearCurrentEntityCollision(short, ref const(ubyte)* arg2) {
	EntityCollidedObjects[ActionScript88 / 2] = 0xFFFF;
	return 0;
}

/// $C0A6D1
short DisableCurrentEntityCollision(short, ref const(ubyte)* arg2) {
	EntityCollidedObjects[ActionScript88 / 2] = 0x8000;
	return 0;
}

/// $C0A6E3
void UnknownC0A6E3() {
	short a;
	Unknown7E2896 = ActionScript88;
	if (((UNKNOWN_30X2_TABLE_40[ActionScript88 / 2] >> 8) | EntityDirections[ActionScript88 / 2]) != Unknown7E3456[ActionScript88 / 2]) {
		Unknown7E3456[ActionScript88 / 2] = (UNKNOWN_30X2_TABLE_40[ActionScript88 / 2] >> 8) | EntityDirections[ActionScript88 / 2];
		return;
	}
	if (EntityScriptVar7Table[ActionScript88 / 2] < 0) {
		EntityScriptVar7Table[ActionScript88 / 2] &= 0x7FFF;
		goto Unknown5;
	}
	if ((EntityScriptVar7Table[ActionScript88 / 2] & 0x2000) != 0) {
		if (EntityAnimationFrames[ActionScript88 / 2] == 0) {
			goto Unknown6;
		} else {
			EntityAnimationFrames[ActionScript88 / 2] = 0;
			goto Unknown5;
		}
	}
	if (BattleSwirlCountdown != 0) {
		goto Unknown6;
	}
	if (--EntityScriptVar2Table[ActionScript88 / 2] >= 0) {
		if (EntityScriptVar2Table[ActionScript88 / 2] != 0) {
			goto Unknown6;
		}
	}
	EntityScriptVar2Table[ActionScript88 / 2] = EntityScriptVar3Table[ActionScript88 / 2];
	EntityAnimationFrames[ActionScript88 / 2] ^= 2;
	if (EntityAnimationFrames[ActionScript88 / 2] != 0) {
		goto Unknown5;
	}
	if (ActionScript88 == Unknown7E2898) {
		goto Unknown5;
	}
	a = FootstepSoundTable[(FootstepSoundIDOverride == 0) ? FootstepSoundID : FootstepSoundIDOverride];
	if ((a != 0) && (Unknown7EB4B6 == 0)) {
		PlaySfx(a);
	}
	Unknown5:
	UnknownC0A794();
	Unknown6:
	if (teleportDestination != 0) {
		return;
	}
	if (Unknown7E5D58 == 0) {
		return;
	}
	if (Unknown7E5D58 < 45) {
		a = Unknown7E5D58 & 3;
	} else if ((Unknown7E5D58 & 1) == 0) {
		a = cast(short)(EntitySpriteMapFlags[ActionScript88 / 2] | 0x8000);
	} else {
		a = EntitySpriteMapFlags[ActionScript88 / 2] & 0x7FFF;
	}
	EntitySpriteMapFlags[ActionScript88 / 2] = a;
}

/// $C0A780
void UnknownC0A780(short arg1) {
	Unknown7E2896 = cast(short)(arg1 * 2);
	UnknownC0A794();
}

/// $C0A794
void UnknownC0A794() {
	ushort x00 = EntityTileHeights[Unknown7E2896 / 2];
	DMA_COPY_SIZE = EntityByteWidths[Unknown7E2896 / 2];
	DMA_COPY_VRAM_DEST = EntityVramAddresses[Unknown7E2896 / 2];
	const(ubyte)* x02 = cast(const(ubyte)*)(EntityGraphicsPointers[Unknown7E2896 / 2] + SpriteDirectionMappings8Direction[EntityDirections[Unknown7E2896 / 2] / 2] * 4 + EntityAnimationFrames[Unknown7E2896 / 2]);
	if (((*x02 & 2) == 0) && ((EntitySurfaceFlags[Unknown7E2896 / 2] & 8) != 0)) {
		Unknown7E0091 = 3;
		DMA_COPY_RAM_SRC = &UnknownC40BE8;
		UnknownC0A56E();
		if (--x00 == 0) {
			return;
		}
		if ((EntitySurfaceFlags[Unknown7E2896 / 2] & 4) != 0) {
			UnknownC0A56E();
			x00--;
			return;
		}
	}
	Unknown7E341A[Unknown7E2896 / 2] = *x02;
	//TODO: figure this out too
	//DMA_COPY_RAM_SRC = (*x02) & 0xFFFE;
	Unknown7E0091 = 0;
	//DMA_COPY_RAM_SRC + 2= UNKNOWN_30X2_TABLE_31[Unknown7E2896 / 2];
	while (true) {
		UnknownC0A56E();
		if (--x00 == 0) {
			break;
		}
		DMA_COPY_RAM_SRC += DMA_COPY_SIZE;
	}
}

/// $C0A82F
short DisableCurrentEntityCollision2(short, ref const(ubyte)* arg2) {
	EntityCollidedObjects[ActionScript88 / 2] = 0x8000;
	return 0;
}

/// $C0A838
short ClearCurrentEntityCollision2(short, ref const(ubyte)* arg2) {
	EntityCollidedObjects[ActionScript88 / 2] = 0xFFFF;
	return 0;
}

/// $C0A841
void UnknownC0A841(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	return PlaySfx(tmp);
}

/// $C0A84C
short UnknownC0A84C(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	return getEventFlag(tmp);
}

/// $C0A857
void UnknownC0A857(short arg1, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	setEventFlag(tmp, arg1);
}

/// $C0A864
void UnknownC0A864(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead8(arg2);
	ActionScript94 = arg2;
	UnknownC46C9B(tmp);
}

/// $C0A86F
void UnknownC0A86F(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC46CC7(tmp);
}

/// $C0A87A
void UnknownC0A87A(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC46CF5(tmp2, tmp);
}

/// $C0A88D
void UnknownC0A88D(short, ref const(ubyte)* arg2) {
	const(ubyte)* tmp = cast(const(ubyte)*)MovementDataReadPtr(arg2);
	ActionScript94 = arg2;
	UnknownC46E4F(tmp);
}

/// $C0A8A0
void UnknownC0A8A0(short, ref const(ubyte)* arg2) {
	const(ubyte)* tmp = cast(const(ubyte)*)MovementDataReadPtr(arg2);
	ActionScript94 = arg2;
	UnknownC466F0(tmp);
}

/// $C0A8B3
void UnknownC0A8B3(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC46C5E(tmp2, tmp);
}

/// $C0A8C6
short UnknownC0A8C6() {
	return UnknownC47143(0, 0);
}

/// $C0A8D1
short UnknownC0A8D1() {
	return UnknownC47143(1, 0);
}

/// $C0A8DC
short UnknownC0A8DC() {
	return UnknownC47143(0, 1);
}

/// $C0A8E7
void UnknownC0A8E7() {
	UnknownC472A8(0);
}

/// $C0A8F7
short ActionScriptPrepareNewEntityAtSelf(short, ref const(ubyte)* arg2) {
	PrepareNewEntityAtExistingEntityLocation(0);
	return 0;
}

/// $C0A8FF
short ActionScriptPrepareNewEntityAtPartyLeader(short, ref const(ubyte)* arg2) {
	PrepareNewEntityAtExistingEntityLocation(1);
	return 0;
}

/// $C0A907
short ActionScriptPrepareNewEntityAtTeleportDestination(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead8(arg2);
	ActionScript94 = arg2;
	PrepareNewEntityAtTeleportDestination(tmp);
	return 0;
}

/// $C0A912
short ActionScriptPrepareNewEntity(short, ref const(ubyte)* arg1) {
	short tmp = MovementDataRead16(arg1);
	ActionScript94 = arg1;
	short tmp2 = MovementDataRead16(arg1);
	ActionScript94 = arg1;
	short tmp3 = MovementDataRead8(arg1);
	ActionScript94 = arg1;
	PrepareNewEntity(tmp3, tmp, tmp2);
	return 0;
}

/// $C0A92D
void UnknownC0A92D(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC46B8D(tmp);
}

/// $C0A938
void UnknownC0A938(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC46BBB(tmp);
}

/// $C0A943
short ActionScriptGetPositionOfPartyMember(short, ref const(ubyte)* arg1) {
	short tmp1 = MovementDataRead8(arg1);
	ActionScript94 = arg1;
	GetPositionOfPartyMember(tmp1);
	return 0;
}

/// $C0A94E
void UnknownC0A94E(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC46984(tmp);
}

/// $C0A959
void UnknownC0A959(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC469F1(tmp);
}

/// $C0A964
void UnknownC0A964(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC47225(tmp, tmp2);
}

/// $C0A977
short MovementLoadBattleBG(short, ref const(ubyte)* arg1) {
	short tmp = MovementDataRead16(arg1);
	ActionScript94 = arg1;
	short tmp2 = MovementDataRead16(arg1);
	ActionScript94 = arg1;
	LoadBackgroundAnimation(tmp, tmp2);
	return 0;
}

/// $C0A98B
short UnknownC0A98B(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	return UnknownC46534(tmp, tmp2);
}

/// $C0A99F
short UnknownC0A99F(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	return UnknownC4ECAD(tmp, tmp2);
}

/// $C0A9B3
void UnknownC0A9B3(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp3 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC4EBAD(tmp, tmp2, tmp3);
}

/// $C0A9CF
void UnknownC0A9CF(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp3 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC4EC05(tmp, tmp2, tmp3);
}

/// $C0A9EB
void UnknownC0A9EB(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp3 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC4EC52(tmp, tmp2, tmp3);
}

/// $C0AA23
void UnknownC0AA23(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp3 = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	UnknownC47765(tmp, tmp2, tmp3);
}

/// $C0AA3F
void UnknownC0AA3F(short arg1, ref const(ubyte)* arg2) {
	short x = (--arg1 == 0) ? 0x33 : 0xB3;
	Unknown7E9E37 = cast(ubyte)MovementDataRead8(arg2);
	ActionScript94 = arg2;
	Unknown7E9E38 = cast(ubyte)MovementDataRead8(arg2);
	ActionScript94 = arg2;
	Unknown7E9E39 = cast(ubyte)MovementDataRead8(arg2);
	ActionScript94 = arg2;
	UnknownC42439(x);
}

/// $C0AA6E
void UnknownC0AA6E(short, ref const(ubyte)* arg2) {
	if (EntityScriptVar0Table[ActionScript88 / 2] == 0) {
		EntityDirections[ActionScript88 / 2] = cast(ubyte)MovementDataRead8(arg2);
		ActionScript94 = arg2;
		Unknown7E2892 = EntityAnimationFrames[ActionScript88 / 2] = cast(ubyte)MovementDataRead8(arg2);
		ActionScript94 = arg2;
		UnknownC0A443Entry4(ActionScript88);
	} else {
		EntityDirections[ActionScript88 / 2] = cast(ubyte)MovementDataRead8(arg2);
		ActionScript94 = arg2;
		Unknown7E2892 = EntityAnimationFrames[ActionScript88 / 2] = cast(ubyte)(MovementDataRead8(arg2) * 2);
		ActionScript94 = arg2;
		UnknownC0A794();
	}
}

/// $C0AAAC
void UnknownC0AAAC() {
	Unknown7E2896 = ActionScript88;
	UnknownC0A794();
}

/// $C0AAB5
void UnknownC0AAB5(short, ref const(ubyte)* arg2) {
	short tmp = MovementDataRead16(arg2);
	ActionScript94 = arg2;
	short tmp2 = MovementDataRead8(arg2);
	ActionScript94 = arg2;
	short tmp3 = MovementDataRead8(arg2);
	ActionScript94 = arg2;
	UnknownC497C0(tmp3, tmp2, tmp);
}

/// $C0AACD
short UnknownC0AACD() {
	return 2;
}

/// $C0AAD5
void UnknownC0AAD5(short, ref const(ubyte)* arg2) {
	ActionScript90 = cast(short)(MovementDataRead8(arg2) + 1);
	ActionScript94 = arg2;
	ActionScript92 = cast(const(ubyte)*)MovementDataReadPtr(arg2);
	ActionScript94 = arg2;
	//offset is just an estimate...
	if (ActionScript84[4].counter == 0) {
		ActionScript84[4].counter = cast(ubyte)ActionScript90;
	}
	if (--ActionScript84[4].counter != 0) {
		ActionScript94 = ActionScript92;
	}
}

/// $C0AAFD
void UnknownC0AAFD() {
	//offset is just an estimate...
	ActionScript84[4].counter = 0;
}

/// $C0AA07
void ActionScriptFadeOutWithMosaic(short, ref const(ubyte)* arg1) {
	short tmp1 = MovementDataRead16(arg1);
	ActionScript94 = arg1;
	short tmp2 = MovementDataRead16(arg1);
	ActionScript94 = arg1;
	short tmp3 = MovementDataRead16(arg1);
	ActionScript94 = arg1;
	FadeOutWithMosaic(tmp1, tmp2, tmp3);
}

/// $C0ABA8
void WaitForSPC700() {
	return; // SPC not currently implemented
	APUIO2 = 0;
	APUIO0 = 0;
	do {
		APUIO0 = 0xFF;
		APUIO1 = 0x00;
	} while ((APUIO0 != 0xAA) || (APUIO1 != 0xBB));
}

/// $C0ABC6
void StopMusic() {
	return; // SPC not currently implemented
	APUIO0 = 0;
	while (UnknownC0AC20() != 0) {}
	CurrentMusicTrack = 0xFFFF;
}

/// $C0ABBD
void UnknownC0ABBD(short arg1) {
	APUIO0 = cast(ubyte)arg1;
}

/// $C0ABC6
//original version had separate bank/addr parameters
void LoadSPC700Data(const(ubyte)* data) {
	return; // SPC not currently implemented
	SPC_DATA_PTR = data;
	//Unknown7E00C8 = bank;
	ushort y = 0;
	ubyte b;
	if ((APUIO0 != 0xAA) || (APUIO1 != 0xBB)) {
		WaitForSPC700();
	}
	Unknown7E001E &= 0x7F;
	NMITIMEN = Unknown7E001E;
	ubyte a = 0xCC;
	ushort x;
	// proceed at your own peril.
	// definitely going to have to triple check this one later
	goto l7;
	l1:
		b = SPC_DATA_PTR[y++];
		a = 0;
		goto l4;
	l2:
		b = SPC_DATA_PTR[y++];
		while (APUIO0 != a) {}
		a++;
	l4:
		APUIO0 = a;
		APUIO1 = b;
		if (--x != 0) {
			goto l2;
		}
		while(APUIO0 != a) {}
		while((a += 3) == 0) {}
	l7:
		ubyte tmpA = a;
		x = cast(ushort)(a | (b << 8));
		if (SPC_DATA_PTR[y] != 0) {
			a = 0;
			b = 5;
		} else {
			y += 2;
			a = SPC_DATA_PTR[y];
			b = SPC_DATA_PTR[y + 1];
			y += 2;
		}
		APUIO2 = a;
		APUIO3 = b;
		APUIO1 = x < 1;
		a = tmpA;
		APUIO0 = a;
		while (APUIO0 != a) {}
		if (x < 1) {
			goto l1;
		}
		while (APUIO0 != 0 || APUIO1 != 0) {}
		Unknown7E001E |= 0x80;
		NMITIMEN = Unknown7E001E;
}

/// $C0ABE0 - Play a sound effect
void PlaySfx(short sfx) {
	if (sfx != 0) {
		SoundEffectQueue[SoundEffectQueueEndIndex] = cast(ubyte)(sfx | Unknown7E1ACA);
		SoundEffectQueueEndIndex = (SoundEffectQueueEndIndex + 1) & 7;
		Unknown7E1ACA ^= 0x80;
		return;
	}
	PlaySfxUnknown();
}
void PlaySfxUnknown() {
	APUIO3 = 0x57;
}

/// $C0AC0C
void UnknownC0AC0C(short arg1) {
	APUIO1 = cast(ubyte)(arg1 | Unknown7E1ACB);
	Unknown7E1ACB ^= 0x80;
}

/// $C0AC20
ubyte UnknownC0AC20() {
	return APUIO0;
}

/// $C0AC2C
immutable ubyte[14] StereoMonoData = [
	0x01, 0x00, 0x31, 0x04, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x31, 0x04, 0x01, 0x00, 0x00,
];

/// $C0AC3A
void UnknownC0AC3A(short arg1) {
	APUIO2 = cast(ubyte)arg1;
}

/// $C0AC43
void UnknownC0AC43() {
	Unknown7E000B = 0xC4;
	ActionScript04 = 0xC4;
	ActionScript00 = ((EntitySurfaceFlags[ActionScript88 / 2] & 1) != 0) ? 5 : 0;
	switch (EntitySurfaceFlags[ActionScript88 / 2] & 0xC) {
		default:
			if (EntityByteWidths[ActionScript88 / 2] == 0x40) {
				ActionScript02Overlay = EntityRippleOverlayPtrs[ActionScript88 / 2];
				if (Unknown7E305A[ActionScript88 / 2] == 0) {
					EntityRippleOverlayPtrs[ActionScript88 / 2] = UnknownC0AD56(&Unknown7E3096[0], Unknown7E305A[ActionScript88 / 2]);
				}
				Unknown7E305A[ActionScript88 / 2]--;
				ActionScript06 = EntityScreenXTable[ActionScript88 / 2];
				UnknownC08C58(Unknown7E3096[ActionScript88 / 2] + ActionScript00, EntityScreenXTable[ActionScript88 / 2], EntityScreenYTable[ActionScript88 / 2]);
			} else {
				ActionScript02Overlay = EntityBigRippleOverlayPtrs[ActionScript88 / 2];
				if (Unknown7E310E[ActionScript88 / 2] == 0) {
					EntityBigRippleOverlayPtrs[ActionScript88 / 2] = UnknownC0AD56(&Unknown7E314A[0], Unknown7E310E[ActionScript88 / 2]);
				}
				Unknown7E310E[ActionScript88 / 2]--;
				ActionScript06 = EntityScreenXTable[ActionScript88 / 2];
				UnknownC08C58(Unknown7E314A[ActionScript88 / 2] + ActionScript00 + ActionScript00, EntityScreenXTable[ActionScript88 / 2], cast(short)(EntityScreenYTable[ActionScript88 / 2] + 8));
			}
			goto case;
		case 0:
			if (Unknown7E2E7A[ActionScript88 / 2] != 0) {
				return;
			}
			if ((Unknown7E2E7A[ActionScript88 / 2] & 0x80) == 0) {
				break;
			}
			goto case;
		case 4:
			if (ActionScript88 >= 46) {
				return;
			}
			ActionScript02Overlay = EntitySweatingOverlayPtrs[ActionScript88 / 2];
			if (Unknown7E2FA6[ActionScript88 / 2] == 0) {
				EntitySweatingOverlayPtrs[ActionScript88 / 2] = UnknownC0AD56(&Unknown7E2FE2[0], Unknown7E2FA6[ActionScript88 / 2]);
			}
			Unknown7E2FA6[ActionScript88 / 2]--;
			ActionScript06 = EntityScreenXTable[ActionScript88 / 2];
			if (Unknown7E2FE2[ActionScript88 / 2] is null) {
				break;
			}
			UnknownC08C58(Unknown7E2FE2[ActionScript88 / 2] + ActionScript00, EntityScreenXTable[ActionScript88 / 2], EntityScreenYTable[ActionScript88 / 2]);
			break;
	}
	if ((Unknown7E2E7A[ActionScript88 / 2] & 0x4000) == 0) {
		return;
	}
	if (ActionScript88 >= 46) {
		return;
	}
	ActionScript02Overlay = EntityMushroomizedOverlayPtrs[ActionScript88 / 2];
	if (Unknown7E2EF2[ActionScript88 / 2] == 0) {
		EntityMushroomizedOverlayPtrs[ActionScript88 / 2] = UnknownC0AD56(&Unknown7E2F2E[0], Unknown7E2EF2[ActionScript88 / 2]);
	}
	Unknown7E2EF2[ActionScript88 / 2]--;
	ActionScript06 = EntityScreenXTable[ActionScript88 / 2];
	UnknownC08C58(Unknown7E2F2E[ActionScript88 / 2] + ActionScript00, EntityScreenXTable[ActionScript88 / 2], EntityScreenYTable[ActionScript88 / 2]);
}

/// $C0AD56
const(OverlayScript)* UnknownC0AD56(const(SpriteMap)** arg1, out ushort frames) {
	ushort y = 0;
	NextCommand:
	if (ActionScript02Overlay[y].command == 1) {
		arg1[ActionScript88 / 2] = ActionScript02Overlay[y++].spriteMap;
		goto NextCommand;
	}
	if (ActionScript02Overlay[y].command == 3) {
		ActionScript02Overlay = ActionScript02Overlay[y++].dest;
		goto NextCommand;
	}
	frames = ActionScript02Overlay[y++].frames;
	ActionScript08 = y;
	return &ActionScript02Overlay[y];
}

/// $C0AD9F
void UnknownC0AD9F() {
	BG3VOFS = BG3_Y_POS & 0xFF;
	BG3VOFS = (BG3_Y_POS >> 8) & 0xFF;
}

/// $C0ADB2
void DoBackgroundDMA(short arg1, short arg2, short arg3) {
	DMAChannels[arg1].BBAD = DMATargetRegisters[arg2];
	DMAChannels[arg1].DMAP = 0x42;
	ubyte* a;
	if (arg3 == 0) {
		short x = 6;
		do {
			// The original game code does 16-bit copy here, which copies
			// one byte too many. Do one byte at a time instead.
			Unknown7E3C32[x] = UnknownC0AE26[x];
			x -= 1;
		} while (x >= 0);
		a = &Unknown7E3C32[0];
	} else {
		short x = 6;
		do {
			Unknown7E3C3C[x] = UnknownC0AE2D[x];
			x -= 1;
		} while (x >= 0);
		a = &Unknown7E3C3C[0];
	}
	DMAChannels[arg1].A1T = a;
	HDMAEN_MIRROR |= DMAFlags[arg1];
}

/// $C0AE16
immutable ubyte[7] DMAFlags = [ 1 << 0, 1 << 1, 1 << 2, 1 << 3, 1 << 4, 1 << 5, 1 << 6];

/// $C0AE26
immutable ubyte[7] UnknownC0AE26 = [ 0xE4, 0x46, 0x3C, 0xFC, 0x0E, 0x3D, 0x00 ];

/// $C0AE2D
immutable ubyte[7] UnknownC0AE2D = [ 0xE4, 0x06, 0x3E, 0xFC, 0xCE, 0x3E, 0x00 ];

/// $C0AE1D
// WMDATA, BG1HOFS, BG2HOFS, BG3HOFS, BG4HOFS, BG1VOFS, BG2VOFS, BG3VOFS, BG4VOFS
immutable ubyte[9] DMATargetRegisters = [ 0x80, 0x0D, 0x0F, 0x11, 0x13, 0x0E, 0x10, 0x12, 0x14 ];

/// $C0AE34
void UnknownC0AE34(short arg1) {
	HDMAEN_MIRROR &= UnknownC0AE44[arg1];
}

/// $C0AE44
immutable ubyte[8] UnknownC0AE44 = [0xFE, 0xFD, 0xFB, 0xF7, 0xEF, 0xDF, 0xBF, 0x7F];

/// $C0AE4C
void LoadBackgroundOffsetParameters(short arg1, short arg2, short arg3) {
	Unknown7E1ACC = arg1;
	Unknown7E1ACE = arg2;
	Unknown7E1AD2 = arg3;
}

/// $C0AE56
void LoadBackgroundOffsetParameters2(short arg1) {
	Unknown7E1AD4 = arg1;
}

/// $C0AE5A
void PrepareBackgroundOffsetTables(short arg1, short arg2, short arg3) {
	short x00 = arg1;
	ubyte x02 = 0;
	ubyte x03 = cast(ubyte)arg3;
	short a = 0;
	short x = 0x1C0;
	short y;
	short x05;
	if (Unknown7E1AD2 != 0) {
		a = 0x1C0;
		x = 0x380;
	}
	short x07 = a;
	short x09 = x;
	if (Unknown7E1ACC >= 2) {
		if (Unknown7E1ACC == 2) {
			goto Unknown7;
		} else {
			goto Unknown10;
		}
	}
	if (Unknown7E1ACE != 0) {
		switch (Unknown7E1ACE - 1) {
			case 0:
				x03 += BG1_Y_POS;
				x05 = BG1_X_POS;
				break;
			case 1:
				x03 += BG2_Y_POS;
				x05 = BG2_X_POS;
				break;
			case 2:
				x03 += BG3_Y_POS;
				x05 = BG3_X_POS;
				break;
			case 3:
				x03 += BG4_Y_POS;
				x05 = BG4_X_POS;
				break;
			default: break;
		}
	} else {
		x05 = Unknown7E1ACE;
	}
	if (Unknown7E1ACC == 0) {
		y = x07;
		do {
			Unknown7E3C46[y / 2] = cast(ushort)(((arg2 * SineLookupTable[x03]) >> 8) + x05);
			x02 += x00;
			y += 2;
		} while (y < x09);
		return;
	} else {
		y = x07;
		do {
			Unknown7E3C46[y / 2] = cast(ushort)(((arg2 * SineLookupTable[x03]) >> 8) + x05);
			x02 += x00;
			Unknown7E3C46[y / 2 + 1] = cast(ushort)(x05 - ((arg2 * SineLookupTable[x03]) >> 8));
			x02 += x00;
			y += 4;
		} while (y < x09);
		return;
	}
	Unknown7:
	if (Unknown7E1ACE != 0) {
		switch (Unknown7E1ACE - 1) {
			case 0:
				x05 = BG1_Y_POS;
				break;
			case 1:
				x05 = BG2_Y_POS;
				break;
			case 2:
				x05 = BG3_Y_POS;
				break;
			case 3:
				x05 = BG4_Y_POS;
				break;
			default: break;
		}
	} else {
		x05 = Unknown7E1ACE;
	}
	x05 = cast(ushort)(x05 << 8);
	y = x07;
	do {
		x05 += Unknown7E1AD4;
		Unknown7E3C46[y / 2] = cast(ushort)((cast(ushort)x05 >> 8) + ((arg2 * SineLookupTable[x03]) >> 8));
		x02 += x00;
		y += 2;
	} while (y < x09);
	return;
	Unknown10:
	if (Unknown7E1ACE != 0) {
		switch (Unknown7E1ACE - 1) {
			case 0:
				x05 = BG1_Y_POS;
				break;
			case 1:
				x05 = BG2_Y_POS;
				break;
			case 2:
				x05 = BG3_Y_POS;
				break;
			case 3:
				x05 = BG4_Y_POS;
				break;
			default: break;
		}
	} else {
		x05 = Unknown7E1ACE;
	}
	x05 = cast(ushort)(x05 << 8);
	y = x07;
	do {
		x05 += Unknown7E1AD4;
		Unknown7E3C46[y / 2] = cast(ushort)((cast(ushort)x05 >> 8) + ((arg2 * SineLookupTable[x03]) >> 8));
		x05 += Unknown7E1AD4;
		Unknown7E3C46[y / 2 + 1] = cast(ushort)((cast(ushort)x05 >> 8) - ((arg2 * SineLookupTable[x03]) >> 8));
		x02 += x00;
		y += 4;
	} while (y < x09);
	return;
}

/// $C0AFCD
void UnknownC0AFCD(short arg1) {
	TM_MIRROR = UnknownC0AFF1[arg1];
	TD_MIRROR = UnknownC0AFFC[arg1];
	CGWSEL = UnknownC0B006[arg1];
	CGADSUB = UnknownC0B010[arg1];
}

/// $C0AFF1
immutable ubyte[11] UnknownC0AFF1 = [0x17, 0x1F, 0x17, 0x17, 0x17, 0x17, 0x15, 0x15, 0x15, 0x15, 0x15];

/// $C0AFFC
immutable ubyte[10] UnknownC0AFFC = [0x00, 0x00, 0x08, 0x08, 0x08, 0x08, 0x02, 0x02, 0x02, 0x02];

/// $C0B006
immutable ubyte[10] UnknownC0B006 = [0x00, 0x00, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02];

/// $C0B010
immutable ubyte[10] UnknownC0B010 = [0x00, 0x00, 0x24, 0x64, 0xA4, 0xE4, 0x21, 0x61, 0xA1, 0xE1];

/// $C0B01A
void SetColData(ubyte red, ubyte green, ubyte blue) {
	FIXED_COLOUR_DATA = (red & 0x1F) | 0x20;
	FIXED_COLOUR_DATA = (green & 0x1F) | 0x40;
	FIXED_COLOUR_DATA = (blue & 0x1F) | 0x80;
}

/// $C0B039
void SetColourAddSubMode(ubyte cgwsel, ubyte cgadsub) {
	CGWSEL = cgwsel;
	CGADSUB = cgadsub;
}

/// $C0B047
void SetWindowMask(ushort arg1, ushort arg2) {
	W12SEL = UnknownC0B0A6[arg1 & 3] & ((arg2 != 0) ? 0xAA : 0xFF);
	W34SEL = UnknownC0B0A6[(arg1>>2) & 3] & ((arg2 != 0) ? 0xAA : 0xFF);
	WOBJSEL = UnknownC0B0A6[(arg1>>4) & 3] & ((arg2 != 0) ? 0xAA : 0xFF);
	TMW = arg1 & 0x1F;
	TSW = arg1 & 0x1F;
	WBGLOG = (arg2 != 0) ? 0 : 0x55;
	WOBJLOG = (arg2 != 0) ? 0 : 0x55;
}

/// $C0B0A6
immutable ubyte[4] UnknownC0B0A6 = [0x00, 0x0F, 0xF0, 0xFF];

/// $C0B0AA
void UnknownC0B0AA() {
	WH0 = 0xFF;
	WH2 = 0xFF;
}

/// $C0B0B8
void UnknownC0B0B8(short arg1, const(ubyte)* arg2) {
	//DMAChannels[arg1].A1B = bank of arg2;
	//DMAChannels[arg1].DASB = bank of arg2;
	DMAChannels[arg1].BBAD = 0x26;
	DMAChannels[arg1].DMAP = *arg2;
	DMAChannels[arg1].A1T = &arg2[1];
	HDMAEN_MIRROR |= DMAFlags[arg1];
}

/// $C0B0EF
void UnknownC0B0EF(ubyte arg1, ubyte arg2) {
	Unknown7E3FC6[0].count = 0x64 | 0x80;
	Unknown7E3FC6[0].ptr = &Unknown7E3FD0[0];
	Unknown7E3FC6[1].count = 0x7C | 0x80;
	Unknown7E3FC6[2].count = 0;
	//DMAChannels[arg1].A1B = 0x7E;
	//DMAChannels[arg1].DASB = 0x7E;
	DMAChannels[arg1].BBAD = 0x26;
	DMAChannels[arg1].DMAP = arg2;
	Unknown7E3FC6[1].ptr = ((arg2 & 4) != 0) ? (&Unknown7E4160[0]) : (&Unknown7E4098[0]);
	DMAChannels[arg1].A1T = &Unknown7E3FC6;
	HDMAEN_MIRROR |= DMAFlags[arg1];
}

/// $C0B149
void UnknownC0B149(short arg1, short arg2, short arg3, short arg4) {
	if (/+(arg2 > 0) && (+/arg2 >= 0x70) {
		short y = 0;
		short a = cast(short)(arg2 - arg4);
		if (a > 0) {
			do {
				*cast(ushort*)Unknown7E3FD0[y] = 0xFF;
				y += 2;
			} while(--a != 0);
			a = 0;
		}
		short x0A = cast(short)(a + arg4);
		short x0C;
		while (true) {
			short x08 = (a == 0) ? arg3 : ((0x80 + arg3 * UnknownC0B2FF[cast(ushort)x0A / cast(ubyte)arg4]) >> 8);
			a = cast(short)(x08 + arg1);
			if (a >= 0) {
				if (a >= 0x100) {
					a = 0xFF;
				}
				x0C = a;
				a = cast(short)(arg1 - x08);
				if (a < 0) {
					a = 0;
				} else if (a >= 0x100) {
					a = 0xFF;
				} else {
					a = cast(ushort)(x0C << 8) | cast(ubyte)a;
				}
			}
			*cast(ushort*)&Unknown7E3FD0[y] = a;
			x0C = cast(short)(x0A * 4);
			if (y + x0C < 0x1C0) {
				*cast(ushort*)&Unknown7E3FD0[y + x0C] = a;
			}
			y += 2;
			if (--x0A < 0) {
				break;
			}
		}
		a = y;
		y = cast(short)(a + arg4 + arg4);
		if (y < 0x1C0) {
			a = 0xFF;
			do {
				*cast(ushort*)Unknown7E3FD0[y] = 0xFF;
				y += 2;
			} while (y < 0x1C0);
		}
	} else {
		short y = 0x1BE;
		short a = 0xE0;
		a = cast(short)(a - arg2 - arg4);
		if (a > 0) {
			do {
				*cast(ushort*)Unknown7E3FD0[y] = 0xFF;
				y -= 2;
			} while (--a != 0);
			a = 0;
		}
		short x0A = cast(short)(a + arg4);
		short x0C;
		while (true) {
			short x08 = (a == 0) ? arg3 : ((0x80 + arg3 * UnknownC0B2FF[cast(ushort)x0A / cast(ubyte)arg4]) >> 8);
			a = cast(short)(x08 + arg1);
			if (a >= 0) {
				if (a >= 0x100) {
					a = 0xFF;
				}
				x0C = a;
				a = cast(short)(arg1 - x08);
				if (a < 0) {
					a = 0;
				} else if (a >= 0x100) {
					a = 0xFF;
				} else {
					a = cast(ushort)(x0C << 8) | cast(ubyte)a;
				}
			}
			*cast(ushort*)&Unknown7E3FD0[y] = a;
			x0C = cast(short)(x0A * 4);
			if (y - x0C >= 0) {
				*cast(ushort*)&Unknown7E3FD0[y - x0C] = a;
			}
			y -= 2;
			if (--x0A < 0) {
				break;
			}
		}
		a = y;
		y = cast(short)(a - arg4 - arg4);
		if (y >= 0) {
			do {
				Unknown7E3FD0[y] = 0xFF;
				y -= 2;
			} while (y >= 0);
		}
	}
}

/// $C0B2FF
immutable byte[256] UnknownC0B2FF = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -3, -3, -3, -3, -3, -3, -3, -4, -4, -4, -4, -4, -5, -5, -5, -5, -5, -6, -6, -6, -6, -6, -7, -7, -7, -7, -8, -8, -8, -8, -9, -9, -9, -9, -10, -10, -10, -11, -11, -11, -12, -12, -12, -12, -13, -13, -13, -14, -14, -15, -15, -15, -16, -16, -16, -17, -17, -17, -18, -18, -19, -19, -20, -20, -20, -21, -21, -22, -22, -23, -23, -23, -24, -24, -25, -25, -26, -26, -27, -27, -28, -28, -29, -29, -30, -30, -31, -31, -32, -33, -33, -34, -34, -35, -35, -36, -37, -37, -38, -38, -39, -40, -40, -41, -42, -42, -43, -44, -44, -45, -46, -46, -47, -48, -49, -49, -50, -51, -52, -52, -53, -54, -55, -55, -56, -57, -58, -59, -59, -60, -61, -62, -63, -64, -65, -65, -66, -67, -68, -69, -70, -71, -72, -73, -74, -75, -76, -77, -78, -79, -80, -81, -82, -83, -84, -86, -87, -88, -89, -90, -91, -93, -94, -95, -96, -97, -99, -100, -101, -103, -104, -105, -107, -108, -110, -111, -113, -114, -116, -117, -119, -120, -122, -123, -125, -127, 127, 126, 124, 122, 120, 118, 116, 114, 112, 110, 108, 106, 104, 102, 99, 97, 94, 92, 89, 86, 83, 81, 77, 74, 71, 67, 63, 59, 55, 50, 45, 39, 32, 23];

/// $C0B425
immutable byte[256] SineLookupTable = [0, 3, 6, 9, 12, 15, 18, 21, 24, 28, 31, 34, 37, 40, 43, 46, 48, 51, 54, 57, 60, 63, 65, 68, 71, 73, 76, 78, 81, 83, 85, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 109, 111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 124, 125, 126, 126, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 126, 126, 125, 124, 124, 123, 122, 121, 120, 119, 118, 117, 115, 114, 112, 111, 109, 108, 106, 104, 102, 100, 98, 96, 94, 92, 90, 88, 85, 83, 81, 78, 76, 73, 71, 68, 65, 63, 60, 57, 54, 51, 48, 46, 43, 40, 37, 34, 31, 28, 24, 21, 18, 15, 12, 9, 6, 3, 0, -3, -6, -9, -12, -15, -18, -21, -24, -28, -31, -34, -37, -40, -43, -46, -48, -51, -54, -57, -60, -63, -65, -68, -71, -73, -76, -78, -81, -83, -85, -88, -90, -92, -94, -96, -98, -100, -102, -104, -106, -108, -109, -111, -112, -114, -115, -117, -118, -119, -120, -121, -122, -123, -124, -124, -125, -126, -126, -127, -127, -127, -127, -127, -127, -127, -127, -127, -127, -127, -126, -126, -125, -124, -124, -123, -122, -121, -120, -119, -118, -117, -115, -114, -112, -111, -109, -108, -106, -104, -102, -100, -98, -96, -94, -92, -90, -88, -85, -83, -81, -78, -76, -73, -71, -68, -65, -63, -60, -57, -54, -51, -48, -46, -43, -40, -37, -34, -31, -28, -24, -21, -18, -15, -12, -9, -6, -3];

/// $C0B400
short Cosine(short arg1, short arg2) {
	return CosineSine(arg1, cast(short)(arg2 - 0x40));
}

/// $C0B40B
short CosineSine(short arg1, short arg2) {
	return (arg1 * SineLookupTable[arg2]) >> 8;
}

/// $C0B525
void FileSelectInit() {
	UnknownC08726();
	UnknownC0927C();
	OAMClear();
	UpdateScreen();
	UnknownC01A86();
	AllocSpriteMem(-32768, 0);
	InitializeMiscObjectData();
	OverworldSetupVRAM();
	UnknownC432B1();
	UnknownC005E7();
	memcpy(&palettes[8][0], SpriteGroupPalettes.ptr, 0x100);
	UnknownC200D9();
	CopyToVram(3, 0x800, 0x7C00, Unknown7F0000.ptr);
	Decomp(TextWindowGraphics.ptr, Unknown7F0000.ptr);
	memcpy(&Unknown7F0000[0x2000], &Unknown7F0000[0x1000], 0x2A00);
	UnknownC44963(1);
	memcpy(&palettes[0][0], TextWindowFlavourPalettes.ptr, 0x40);
	LoadBackgroundAnimation(BackgroundLayer.FileSelect, 0);
	EntityAllocationMinSlot = 0x17;
	EntityAllocationMaxSlot = 0x18;
	InitEntity(ActionScript.Unknown787, 0, 0);
	TM_MIRROR = 0x16;
	BG2_Y_POS = 0;
	BG1_Y_POS = 0;
	BG2_X_POS = 0;
	BG1_X_POS = 0;
	OAMClear();
	UpdateScreen();
	FadeIn(1, 1);
	UnknownC1FF6B();
	FadeOutWithMosaic(1, 1, 0);
	UnknownC09C35(0x17);
	TM_MIRROR = 0x17;
	UnknownC4FD18(gameState.soundSetting - 1);
}

/// $C0B65F
void UnknownC0B65F(short arg1, short arg2) {
	gameState.leaderX.integer = arg1;
	gameState.leaderY.integer = arg2;
	gameState.leaderDirection = 2;
	gameState.partyMembers[0] = 1;
	EntityScreenXTable[24] = arg1;
	EntityScreenYTable[24] = arg2;
}

/// $C0B67F
void UnknownC0B67F() {
	UnknownC0927C();
	UnknownC01A86();
	AllocSpriteMem(short.min, 0);
	InitializeMiscObjectData();
	BattleDebug = 0;
	Unknown7E5D74 = 0;
	Unknown7E4A58 = 1;
	Unknown7E4A5A = -1;
	Unknown7E4A5E = 10;
	BattleSwirlCountdown = 0;
	Unknown7E5D9A = 0;
	SetBoundaryBehaviour(1);
	DadPhoneTimer = 0x697;
	SetIRQCallback(&ProcessOverworldTasks);
	teleportStyle = TeleportStyle.None;
	teleportDestination = 0;
	Unknown7EB4A8 = -1;
	EntityAllocationMinSlot = 0x17;
	EntityAllocationMaxSlot = 0x18;
	InitEntity(ActionScript.Unknown001, 0, 0);
	UnknownC02D29();
	UnknownC03A24();
	memset(&palettes[0][0], 0, 0x200);
	UnknownC47F87();
	OverworldInitialize();
	LoadMapAtPosition(gameState.leaderX.integer, gameState.leaderY.integer);
	SpawnBuzzBuzz();
	LoadWindowGraphics();
	UnknownC44963(1);
	UnknownC039E5();
}

/// $C0B731
void InitBattleOverworld() {
	if (BattleDebug == 0) {
		return;
	}
	if ((Debug == 0) || (UnknownEFE708() != -1)) {
		if (InstantWinCheck() != 0) {
			InstantWinHandler();
			BattleDebug = 0;
		}
	} else {
		short x10 = InitBattleCommon();
		UnknownC07B52();
		if (teleportDestination == 0) {
			if (x10 != 0) {
				if (Debug == 0) {
					return;
				}
				if (DebugCheckViewCharacterMode() != 0) {
					return;
				}
			}
			ReloadMap();
			FadeIn(1, 1);
		} else {
			TeleportMainLoop();
		}
	}
	for (short i = 0; i != 0x17; i++) {
		EntityCollidedObjects[i] = 0xFFFF;
		UNKNOWN_30X2_TABLE_41[i] = 0;
		EntitySpriteMapFlags[i] &= 0x7FFF;
	}
	OverworldStatusSuppression = 0;
	UnknownC09451();
	Unknown7E5D58 = 0x78;
	TouchedEnemy = -1;
}

//$C0B7D8
void ebMain() {
	UnknownC43317();
	//setjmp(&jmpbuf1);
	InitIntro();
	FileSelectInit();
	UnknownC0B67F();
	FadeIn(1, 1);
	UpdateScreen();
	//setjmp(&jmpbuf2);
	UnknownC43F53();
	while (1) {
		OAMClear();
		UnknownC09466();
		UpdateScreen();
		UnknownC4A7B0();
		WaitUntilNextFrame();
		if (((CurrentQueuedInteraction - NextQueuedInteraction) != 0) && !BattleSwirlCountdown && !BattleSwirlFlag && !BattleDebug) {
			ProcessQueuedInteractions();
			Unknown7E5D74++;
		} else if ((gameState.unknownB0 != 2) && (gameState.walkingStyle != WalkingStyle.Escalator) && !BattleSwirlCountdown) {
			if (!BattleDebug) {
				InitBattleOverworld();
				Unknown7E5D74++;
			} else if (((pad_press[0] & (PAD_A | PAD_L)) != 0) || (gameState.walkingStyle == WalkingStyle.Bicycle)) {
				UnknownC0943C();
				GetOffBicycle();
				UnknownC09451();
				continue;
			}
			if (Debug) {
				if (((pad_state[0] & (PAD_B | PAD_SELECT)) != 0) && (((pad_press[0] & PAD_R)) != 0)) {
					DebugYButtonMenu();
					continue;
				}
				if ((pad_press[1] & PAD_A) != 0) {
					UnknownC490EE();
				}
				if ((pad_press[1] & PAD_B) != 0) {
					UnknownC4E366();
				}
			}
			if (BattleSwirlCountdown) {
				continue;
			}
			if (BattleSwirlFlag) {
				continue;
			}
			if (Unknown7E5D74) {
				Unknown7E5D74--;
			} else if (!Unknown7E5D9A) {
				if ((pad_press[0] & PAD_A) != 0 ) {
					OpenMenuButton();
				} else if (((pad_press[0] & (PAD_B | PAD_SELECT)) != 0) && (gameState.walkingStyle != WalkingStyle.Bicycle)) {
					OpenHPPPDisplay();
				} else if ((pad_press[0] & PAD_X) != 0) {
					ShowTownMap();
				} else if ((pad_press[0] & PAD_L) != 0) {
					OpenMenuButtonCheckTalk();
				}
			}
			if (teleportDestination) {
				TeleportMainLoop();
			}
			if (!Debug && ((pad_press[1] & PAD_B) != 0)) {
				for (short i = 0; i < TOTAL_PARTY_COUNT; i++) {
					PartyCharacters[i].hp.target = PartyCharacters[i].maxHP;
					PartyCharacters[i].pp.target = PartyCharacters[i].maxPP;
				}
			}
		}
		if (UnknownC04FFE() && !Spawn()) {
			//longjmp(&jmpbuf1, 0);
		}
		if (Debug && ((pad_state[0] & PAD_START) != 0) && ((pad_state[0] & PAD_SELECT) == 0)) {
			break;
		}
	}
}

/// $C0B99A
void GameInit() {
	CheckSRAMIntegrity();
	InitializeSPC700();
	EnableNMIJoypad();
	CheckHardware();
	WaitUntilNextFrame();
	WaitUntilNextFrame();
	debug(alwaysdebugmenu) {
		Debug = 1;
		DebugMenuLoad();
	} else {
		debug {
			if ((pad_state[0] & (PAD_DOWN | PAD_L)) != 0) {
				Debug = 1;
				DebugMenuLoad();
			}
		}
		Debug = 0;
		ebMain();
	}
}

/// $C0B9BC
void UnknownC0B9BC(PathCtx* arg1, short arg2, short arg3, short arg4) {
	for (short i = 0; i < arg2; i++) {
		arg1.targets_pos[i].x = ((EntityAbsXTable[EntitySizes[gameState.unknownA2[i]]] - UnknownC42A1F[EntitySizes[gameState.unknownA2[i]]]) / 8 - arg3) & 0x3F;
		arg1.targets_pos[i].y = ((EntityAbsYTable[EntitySizes[gameState.unknownA2[i]]] - UnknownC42A41[EntitySizes[gameState.unknownA2[i]]] + UnknownC42AEB[EntitySizes[gameState.unknownA2[i]]]) / 8 - arg4) & 0x3F;
	}
}

/// $C0BA35
short UnknownC0BA35(PathCtx* arg1, short arg2, short arg3, short arg4, short arg5, short arg6, short arg7) {
	ubyte* x06 = &Unknown7F0000[0x3000];
	arg1.target_count = arg2;
	for (short i = 0; i != arg1.radius.x; i++) {
		for (short j = 0; j != arg1.radius.y; j++) {
			if ((Unknown7EE000[(i + arg7) & 0x3F][(j + arg3) & 0x3F] & 0xC0) != 0) {
				(x06++)[0] = PATH_UNWALKABLE;
			} else {
				(x06++)[0] = 0;
			}
		}
	}
	short x02 = 0;
	short x26 = 0;
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (EntityScriptTable[i] == -1) {
			continue;
		}
		if (UNKNOWN_30X2_TABLE_41[i] == -1) {
			continue;
		}
		arg1.pathers[x26].obj_index = i;
		arg1.pathers[x26].from_offscreen = arg6;
		arg1.pathers[x26].hitbox.x = UnknownC42AA7[EntitySizes[i]];
		arg1.pathers[x26].hitbox.y = UnknownC42AC9[EntitySizes[i]];
		arg1.pathers[x26].origin.x = ((EntityAbsXTable[i] - UnknownC42A1F[EntitySizes[i]]) / 8 - arg3) & 0x3F;
		arg1.pathers[x26].origin.y = ((EntityAbsYTable[i] - UnknownC42A41[EntitySizes[i]] + UnknownC42AEB[EntitySizes[i]]) / 8 - arg3) & 0x3F;
		x26++;
	}
	arg1.pather_count = x26;
	ushort x28 = Path_Main(0xC00, &Unknown7EF000.Unknown7EF400[0], &arg1.radius, &Unknown7F0000[0x3000], 4, arg2, &arg1.targets_pos[0], x26, &arg1.pathers[0], -1, arg5, arg6);
	while (Path_GetHeapSize() > 0xC00) {}
	if (x28 == 0) {
		for (short i = 0; i != MAX_ENTITIES; i++) {
			if (EntityScriptTable[i] == -1) {
				continue;
			}
			UNKNOWN_30X2_TABLE_41[i] = 1;
		}
		return -1;
	} else {
		for (short i = 0; i < x26; i++) {
			short x22 = arg1.pathers[i].obj_index;
			if (arg1.pathers[i].field0A != 0) {
				UNKNOWN_30X2_TABLE_46[x22] = arg1.pathers[i].points;
				Unknown7E2E3E[x22] = arg1.pathers[i].field0A;
			} else {
				UNKNOWN_30X2_TABLE_41[x22] = 1;
			}
		}
		return 0;
	}
}

/// $C0BC75
short FindPathToParty(short partyCount, short arg2, short arg3) {
	short x28 = gameState.currentPartyMembers;
	PathCtx* x26 = &Unknown7EF000.Unknown7EF200;
	Unknown7EF000.Unknown7EF200.radius.y = arg2;
	Unknown7EF000.Unknown7EF200.radius.x = arg3;
	Unknown7E4A94 = Unknown7EF000.Unknown7EF200.radius.x;
	Unknown7E4A8E = (EntityAbsXTable[gameState.currentPartyMembers] - UnknownC42A1F[EntitySizes[gameState.currentPartyMembers]]) / 8;
	Unknown7E4A90 = (EntityAbsYTable[gameState.currentPartyMembers] - UnknownC42A41[EntitySizes[gameState.currentPartyMembers]] + UnknownC42AEB[EntitySizes[gameState.currentPartyMembers]]) / 8;
	UnknownC0B9BC(&Unknown7EF000.Unknown7EF200, partyCount,
		((EntityAbsXTable[gameState.currentPartyMembers] - UnknownC42A1F[EntitySizes[gameState.currentPartyMembers]]) / 8) - (Unknown7EF000.Unknown7EF200.radius.y / 2),
		((EntityAbsYTable[gameState.currentPartyMembers] - UnknownC42A41[EntitySizes[gameState.currentPartyMembers]] + UnknownC42AEB[EntitySizes[gameState.currentPartyMembers]]) / 8) - (Unknown7EF000.Unknown7EF200.radius.x / 2)
	);
	return UnknownC0BA35(&Unknown7EF000.Unknown7EF200, partyCount, Unknown7EF000.Unknown7EF200.radius.y, Unknown7EF000.Unknown7EF200.radius.x, 0, 0x40, 0x32);
}

/// $C0BD96
short UnknownC0BD96() {
	short x2A = gameState.currentPartyMembers;
	PathCtx* x28 = &Unknown7EF000.Unknown7EF200;
	short x04 = Unknown7EF000.Unknown7EF200.radius.y = 56;
	short x02 = Unknown7EF000.Unknown7EF200.radius.x = 56;
	Unknown7E4A92 = Unknown7EF000.Unknown7EF200.radius.y / 2;
	Unknown7E4A94 = Unknown7EF000.Unknown7EF200.radius.x / 2;
	Unknown7E4A8E = (EntityAbsXTable[x2A] - UnknownC42A1F[EntitySizes[x2A]]) / 8;
	Unknown7E4A90 = (EntityAbsYTable[x2A] - UnknownC42A41[EntitySizes[x2A]] + UnknownC42AEB[EntitySizes[x2A]]) / 8;
	x04 = cast(short)((EntityAbsXTable[x2A] - UnknownC42A1F[EntitySizes[x2A]]) / 8 - x04);
	x02 = cast(short)((EntityAbsYTable[x2A] - UnknownC42A41[EntitySizes[x2A]] + UnknownC42AEB[EntitySizes[x2A]]) / 8 - x02);
	UnknownC0B9BC(x28, 1, x04, x02);
	short result = UnknownC0BA35(x28, 1, x04, x02, 1, 0xFC, 0x32);
	if (result == 0) {
		EntityAbsXTable[Unknown7EF000.Unknown7EF200.pathers[0].obj_index] = cast(short)((Unknown7EF000.Unknown7EF200.pathers[0].origin.x * 8) + UnknownC42A1F[EntitySizes[Unknown7EF000.Unknown7EF200.pathers[0].obj_index]] + ((Unknown7E4A8E - Unknown7E4A92) * 8));
		EntityAbsYTable[Unknown7EF000.Unknown7EF200.pathers[0].obj_index] = cast(short)((Unknown7EF000.Unknown7EF200.pathers[0].origin.y * 8) -UnknownC42AEB[EntitySizes[Unknown7EF000.Unknown7EF200.pathers[0].obj_index]] + UnknownC42A41[EntitySizes[Unknown7EF000.Unknown7EF200.pathers[0].obj_index]] + ((Unknown7E4A90 - Unknown7E4A94) * 8));
		UNKNOWN_30X2_TABLE_46[Unknown7EF000.Unknown7EF200.pathers[0].obj_index]++;
		Unknown7E2E3E[Unknown7EF000.Unknown7EF200.pathers[0].obj_index]--;
	}
	return result;
}

/// $C0BF72
short UnknownC0BF72() {
	PathCtx* x26 = &Unknown7EF000.Unknown7EF200;
	Unknown7EF000.Unknown7EF200.radius.y = 56;
	Unknown7EF000.Unknown7EF200.radius.x = 56;
	short x04 = Unknown7EF000.Unknown7EF200.radius.y / 2;
	Unknown7E4A92 = Unknown7EF000.Unknown7EF200.radius.y / 2;
	Unknown7E4A94 = Unknown7EF000.Unknown7EF200.radius.x / 2;
	Unknown7E4A8E = (EntityAbsXTable[CurrentEntitySlot] - UnknownC42A1F[EntitySizes[CurrentEntitySlot]]) / 8;
	Unknown7E4A90 = (EntityAbsYTable[CurrentEntitySlot] - UnknownC42A41[EntitySizes[CurrentEntitySlot]] + UnknownC42AEB[EntitySizes[CurrentEntitySlot]]) / 8;
	short x = cast(short)((EntityAbsXTable[CurrentEntitySlot] - UnknownC42A1F[EntitySizes[CurrentEntitySlot]]) / 8 - x04);
	short x28 = cast(short)((EntityAbsYTable[CurrentEntitySlot] - UnknownC42A41[EntitySizes[CurrentEntitySlot]] + UnknownC42AEB[EntitySizes[CurrentEntitySlot]]) / 8 - x04);
	Unknown7EF000.Unknown7EF200.targets_pos[0].x = x04 & 0x3F;
	Unknown7EF000.Unknown7EF200.targets_pos[0].y = Unknown7E4A94 & 0x3F;
	return UnknownC0BA35(x26, 1, x, x28, 1, 0xFC, 0x32);
}

/// $C0C19B
short UnknownC0C19B(short arg1) {
	if (UnknownC3DFE8[LoadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & 7] != 0) {
		UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] = 0xFFFF;
		short y = UnknownC0BD96();
		if (y == 0) {
			UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] = 0;
			VecYX* x02 = UNKNOWN_30X2_TABLE_46[CurrentEntitySlot];
			VecYX* y2 = &Unknown7E4A96[arg1][0];
			UNKNOWN_30X2_TABLE_46[CurrentEntitySlot] = y2;
			short x10 = Unknown7E2E3E[CurrentEntitySlot];
			for (short i = 0; (x10 != 0) && (i < 0x14); i++) {
				(y2++)[0] = (x02++)[0];
				x10--;
			}
			return 0;
		}
	}
	return 1;
}

/// $C0C251
short UnknownC0C251(short arg1) {
	UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] = 0xFFFF;
	if (UnknownC0BF72() == 0) {
		UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] = 0;
		short x12 = --Unknown7E2E3E[CurrentEntitySlot];
		VecYX* x02 = &UNKNOWN_30X2_TABLE_46[CurrentEntitySlot][(x12 - 1) * 4];
		VecYX* x10 = &Unknown7E4A96[arg1][0];
		UNKNOWN_30X2_TABLE_46[CurrentEntitySlot] = x10;
		short y = Unknown7E2E3E[CurrentEntitySlot];
		for (short i = 0; (y != 0) && (i < 20); y--, i++) {
			x10.y = x02.y;
			x10.x = x02.x;
			x02--;
			x10++;
		}
		return 0;
	}
	return 1;
}

/// $C0C30C
void UnknownC0C30C(short arg1) {
	if (getEventFlag(NPCConfig[EntityTPTEntries[arg1]].eventFlag)) {
		EntityDirections[arg1] = Direction.Up; // 0
	} else {
		EntityDirections[arg1] = Direction.Down; // 4
	}
	UnknownC0A443Entry2(arg1);
}

/// $C0C353
void UnknownC0C353() {
	UnknownC0C30C(CurrentEntitySlot);
}

/// $C0C35D
short UnknownC0C35D() {
	return gameState.unknown90;
}

/// $C0C363
short UnknownC0C363() {
	short x02 = cast(short)(gameState.leaderX.integer - EntityAbsXTable[CurrentEntitySlot]);
	short x04 = cast(short)(gameState.leaderY.integer - EntityAbsYTable[CurrentEntitySlot]);
	if (0 > x04) {
		x04 = cast(short)-cast(int)x04;
	} else {
		x04 = x04;
	}
	if (x04 + ((0 > x02) ? (cast(short)-cast(int)x02) : x02) > 0x100) {
		return 3;
	}
	if (x04 + ((0 > x02) ? (cast(short)-cast(int)x02) : x02) > 0xA0) {
		return 2;
	}
	if (x04 + ((0 > x02) ? (cast(short)-cast(int)x02) : x02) > 0x80) {
		return 1;
	}
	return 0;
}

/// $C0C3F9
short UnknownC0C3F9() {
	short x02 = cast(short)(gameState.leaderX.integer - EntityAbsXTable[CurrentEntitySlot]);
	short x0E = cast(short)(gameState.leaderY.integer - EntityAbsYTable[CurrentEntitySlot]);
	short x04 = (0 > x0E) ? (cast(short)-cast(int)x0E) : x0E;
	x02 = (0 > x02) ? (cast(short)-cast(int)x02) : x02;
	x0E = cast(short)(x02 + x04);
	if (x0E > 0x80) {
		return 3;
	}
	if (x0E > 0x50) {
		return 2;
	}
	if (x0E > 0x40) {
		return 1;
	}
	return 0;
}

/// $C0C48F
short UnknownC0C48F() {
	if (UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] != 0) {
		return 0;
	}
	if (Unknown7E5D58 == 0) {
		return UnknownC0C363();
	}
	return -1;
}

/// $C0C4AF
short UnknownC0C4AF() {
	if (UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] != 0) {
		return 0;
	}
	if (Unknown7E5D58 == 0) {
		return UnknownC0C3F9();
	}
	return -1;
}

/// $C0C4F6
short GetDirectionFromPlayerToEntity() {
	return GetDirectionTo(EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot], gameState.leaderX.integer, gameState.leaderY.integer);
}

/// $C0C524
short UnknownC0C524() {
	if ((BattleEntryPointerTable[EntityTPTEntries[CurrentEntitySlot] & 0x7FFF].runAwayFlag != 0) && (getEventFlag(BattleEntryPointerTable[EntityTPTEntries[CurrentEntitySlot] & 0x7FFF].runAwayFlag) == BattleEntryPointerTable[EntityTPTEntries[CurrentEntitySlot] & 0x7FFF].runAwayFlagState)) {
		return 1;
	}
	short x0E = UnknownC0546B();
	if (x0E > EnemyConfigurationTable[EntityEnemyIDs[CurrentEntitySlot]].level * 10) {
		return 1;
	}
	if ((x0E > EnemyConfigurationTable[EntityEnemyIDs[CurrentEntitySlot]].level * 8) && (Unknown7E3186[CurrentEntitySlot] >= 0xC0)) {
		return 1;
	}
	if ((x0E > EnemyConfigurationTable[EntityEnemyIDs[CurrentEntitySlot]].level * 6) && (Unknown7E3186[CurrentEntitySlot] >= 0x80)) {
		return 1;
	}
	return 0;
}

/// $C0C62B
short UnknownC0C62B() {
	short x02 = 0;
	if ((EntityTPTEntries[CurrentEntitySlot] < 0) && (UnknownC0C524() != 0)) {
		x02 = short.min;
	}
	return cast(short)(UnknownC41EFF(EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot], EntityScriptVar6Table[CurrentTPTEntry], EntityScriptVar7Table[CurrentEntitySlot]) + x02);
}

/// $C0C682
short GetDirectionRotatedClockwise(short arg1) {
	return (EntityDirections[CurrentEntitySlot] + arg1) & 7;
}

/// $C0C6B6
short UnknownC0C6B6() {
	if (Unknown7E9F45.integer >= 4) {
		return -1;
	}
	short x0E = cast(short)(EntityAbsXTable[CurrentEntitySlot] - (gameState.leaderX.integer - 0x80));
	short x = cast(short)(EntityAbsYTable[CurrentEntitySlot] - (gameState.leaderY.integer - 0x70));
	if ((x0E >= -64) || (x0E < 320)) {
		if ((x >= -64) || (x < 320)) {
			return -1;
		}
	}
	return 0;
}


/// $C0C711
short UnknownC0C711() {
	//weird...
	if (((EntityScreenXTable[CurrentEntitySlot] - UnknownC42A1F[EntitySizes[CurrentEntitySlot]]) | (EntityScreenYTable[CurrentEntitySlot] - UnknownC42A41[EntitySizes[CurrentEntitySlot]]) | (CurrentEntitySlot + 8) & 0xFF00) == 0) {
		return -1;
	} else {
		return 0;
	}
}

/// $C0C7DB
void UnknownC0C7DB() {
	EntitySurfaceFlags[CurrentEntitySlot] = UnknownC05F33(EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot], CurrentEntitySlot);
}

/// $C0C83B
void UnknownC0C83B(short arg1) {
	Unknown7E1A86[CurrentEntitySlot] = arg1;
	FixedPoint1616 x0E;
	if ((arg1 & 1) != 0) {
		x0E.combined = (cast(int)UNKNOWN_30X2_TABLE_35[CurrentEntitySlot] * 0xB505) >> 8;
	} else {
		x0E.combined = (cast(int)UNKNOWN_30X2_TABLE_35[CurrentEntitySlot] * 0x10000) >> 8;
	}
	FixedPoint1616 x12;
	FixedPoint1616 x16;
	switch (arg1) {
		case Direction.Up:
			x12.combined = 0;
			x16.combined = -x0E.combined;
			break;
		case Direction.UpRight:
			x12.combined = x0E.combined;
			x16.combined = -x0E.combined;
			break;
		case Direction.Right:
			x12.combined = x0E.combined;
			x16.combined = 0;
			break;
		case Direction.DownRight:
			x12.combined = x0E.combined;
			x16.combined = x0E.combined;
			break;
		case Direction.Down:
			x12.combined = 0;
			x16.combined = x0E.combined;
			break;
		case Direction.DownLeft:
			x12.combined = -x0E.combined;
			x16.combined = x0E.combined;
			break;
		case Direction.Left:
			x12.combined = -x0E.combined;
			x16.combined = 0;
			break;
		case Direction.UpLeft:
			x12.combined = -x0E.combined;
			x16.combined = -x0E.combined;
			break;
		default: break;
	}
	EntityDeltaXTable[CurrentEntitySlot] = x12.integer;
	EntityDeltaXFractionTable[CurrentEntitySlot] = x12.fraction;
	EntityDeltaYTable[CurrentEntitySlot] = x16.integer;
	EntityDeltaYFractionTable[CurrentEntitySlot] = x16.fraction;
}

/// $C0CBD3
void UnknownC0CBD3(short arg1) {
	EntitySleepFrames[CurrentScriptSlot] = cast(short)((cast(int)arg1 << 8) / UNKNOWN_30X2_TABLE_35[CurrentEntitySlot]);
}

/// $C0CA4E
void UnknownC0CA4E(short arg1) {
	FixedPoint1616 x0E;
	x0E.integer = EntityDeltaXTable[CurrentEntitySlot];
	x0E.fraction = EntityDeltaXFractionTable[CurrentEntitySlot];
	FixedPoint1616 x12;
	x12.integer = EntityDeltaYTable[CurrentEntitySlot];
	x12.fraction = EntityDeltaYFractionTable[CurrentEntitySlot];
	FixedPoint1616 x16;
	FixedPoint1616 x0A;
	if (0 > x12.combined) {
		x16.combined = -x12.combined;
	} else {
		x16 = x12;
	}
	if (0 > x0E.combined) {
		x0A.combined = -x0E.combined;
	} else {
		x0A = x0E;
	}
	if (x0A.combined > x16.combined) {
		if (0 > x0E.combined) {
			x0A.combined = -x0E.combined;
		} else {
			x0A = x0E;
		}
	} else {
		if (0 > x12.combined) {
			x0A.combined = -x12.combined;
		} else {
			x0A = x12;
		}
	}
	EntitySleepFrames[CurrentScriptSlot] = cast(short)((arg1 << 16) / x0A.combined);
}

/// $C0CC11
void UnknownC0CC11() {
	short x12 = cast(short)(EntityScriptVar6Table[CurrentEntitySlot] - EntityAbsXTable[CurrentEntitySlot]);
	short y =  (0 > x12) ? (cast(short)-cast(int)x12) : x12;
	x12 = cast(short)(EntityScriptVar7Table[CurrentEntitySlot] - EntityAbsYTable[CurrentEntitySlot]);
	short x02 =  (0 > x12) ? (cast(short)-cast(int)x12) : x12;
	FixedPoint1616 x0E;
	if (y > x02) {
		x12 = y;
		x0E.integer = EntityDeltaXTable[CurrentEntitySlot];
		x0E.fraction = EntityDeltaXFractionTable[CurrentEntitySlot];
	} else {
		x12 = x02;
		x0E.integer = EntityDeltaYTable[CurrentEntitySlot];
		x0E.fraction = EntityDeltaYFractionTable[CurrentEntitySlot];
	}
	x12 = cast(short)((x12 << 16) / x0E.combined);
	if (x12 == 0) {
		x12 = 1;
	}
	EntitySleepFrames[CurrentScriptSlot] = x12;
}

/// $C0CCCC
void UnknownC0CCCC() {
	EntityScriptVar6Table[CurrentEntitySlot] = EntityAbsXTable[CurrentEntitySlot];
	EntityScriptVar7Table[CurrentEntitySlot] = cast(short)(EntityAbsYTable[CurrentEntitySlot] + 16);
	EntityScriptVar5Table[CurrentEntitySlot] = cast(short)((cast(int)UNKNOWN_30X2_TABLE_35[CurrentEntitySlot] * 16) / 64800) << 8;
	if ((rand() & 1) != 0) {
		EntityDirections[CurrentEntitySlot] = Direction.Up;
	} else {
		EntityDirections[CurrentEntitySlot] = Direction.Down;
	}
	if (EntityDirections[CurrentEntitySlot] < Direction.Down) {
		UNKNOWN_30X2_TABLE_45[CurrentEntitySlot] = 0;
	} else {
		UNKNOWN_30X2_TABLE_45[CurrentEntitySlot] = 0xFFFF;
	}
	EntityScriptVar4Table[CurrentEntitySlot] = 0;
}

/// $C0CD50
short UnknownC0CD50() {
	short x04 = UNKNOWN_30X2_TABLE_45[CurrentEntitySlot];
	short x02;
	if (x04 == 0) {
		x02 = cast(short)(EntityScriptVar4Table[CurrentEntitySlot] + EntityScriptVar5Table[CurrentEntitySlot]);
	} else {
		x02 = cast(short)(EntityScriptVar4Table[CurrentEntitySlot] - EntityScriptVar5Table[CurrentEntitySlot]);
	}
	EntityScriptVar4Table[CurrentEntitySlot] = x02;
	FixedPoint1616 x0E = UnknownC41FFF(x02, 0x1000);
	FixedPoint1616 x1E;
	FixedPoint1616 x1A;
	x1A.integer = x0E.fraction;
	x1E.integer = x0E.integer;
	x1A.combined >>= 8;
	x1E.combined >>= 8;
	FixedPoint1616 x22;
	x22.integer = EntityScriptVar6Table[CurrentEntitySlot];
	FixedPoint1616 x26;
	x26.integer = EntityScriptVar7Table[CurrentEntitySlot];
	FixedPoint1616 x12;
	x12.integer = EntityAbsXTable[CurrentEntitySlot];
	x12.fraction = EntityAbsXFractionTable[CurrentEntitySlot];
	FixedPoint1616 x16;
	x16.integer = EntityAbsYTable[CurrentEntitySlot];
	x16.fraction = EntityAbsYFractionTable[CurrentEntitySlot];
	FixedPoint1616 x2A;
	x2A.combined = x22.combined + x1A.combined - x12.combined;
	FixedPoint1616 x2E;
	x2E.combined = x26.combined + x1E.combined - x16.combined;
	EntityDeltaXTable[CurrentEntitySlot] = x2A.integer;
	EntityDeltaXFractionTable[CurrentEntitySlot] = x2A.fraction;
	EntityDeltaYTable[CurrentEntitySlot] = x2E.integer;
	EntityDeltaYFractionTable[CurrentEntitySlot] = x2E.fraction;
	if (x04 == 0) {
		return cast(short)(x02 + 0x4000);
	} else {
		return cast(short)(x02 - 0x4000);
	}
}

/// $C0CEBE
short UnknownC0CEBE(short arg1) {
	short x04 = EntityScriptVar4Table[CurrentEntitySlot];
	short x02 = x04;
	if (arg1 != x04) {
		short x;
		if (arg1 > x04) {
			if (arg1 - x04 >= 0) {
				x = 0;
			} else {
				x = -1;
			}
		} else {
			if (x04 - arg1 >= 0) {
				x = -1;
			} else {
				x = 0;
			}
		}
		if (x == 0) {
			x04 = cast(short)(x02 + 0x800);
		} else {
			x04 = cast(short)(x02 - 0x800);
		}
	}
	if (UNKNOWN_30X2_TABLE_35[CurrentEntitySlot] < EntityScriptVar3Table[CurrentEntitySlot]) {
		UNKNOWN_30X2_TABLE_35[CurrentEntitySlot] += 16;
	}
	if (UnknownC46B0A(x02) != UnknownC46B0A(x04)) {
		UnknownC0A443Entry2(CurrentEntitySlot);
	}
	return x04;
}

/// $C0CF58
immutable ubyte[63] UnknownC0CF58 = [ 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x01, 0x01, 0x02, 0x02, 0x03, 0x04 ];

/// $C0CF97
short UnknownC0CF97(short arg1, short arg2) {
	//x1C = arg2
	ubyte x00 = cast(ubyte)arg1;
	const(ubyte)* x06 = &UnknownC0CF58[0];
	short y = cast(short)(((EntityAbsXTable[CurrentEntitySlot] - UnknownC42A1F[EntitySizes[CurrentEntitySlot]]) / 8) - 4);
	short x12 = cast(short)(((EntityAbsYTable[CurrentEntitySlot] - UnknownC42A41[EntitySizes[CurrentEntitySlot]] + UnknownC42AEB[EntitySizes[CurrentEntitySlot]]) / 8) - 4);
	short x10 = y & 0x3F;
	short x18 = x12 & 0x3F;
	for (short i = 0; i != arg2; i++) {
		if ((x10 < 0x40) && (x18 < 0x40) && ((x00 & Unknown7EE000[x18 & 0x3F][x10 & 0x3F]) != 0)) {
			goto Unknown9;
		}
		short x0E = (x06++)[0];
		switch (x0E) {
			case 1:
				x18--;
				x12--;
				break;
			case 2:
				x10++;
				y++;
				break;
			case 3:
				x18++;
				x12++;
				break;
			case 4:
				x10--;
				y--;
				break;
			default: break;
		}
	}
	return 0;
	Unknown9:
	EntityScriptVar6Table[CurrentEntitySlot] = cast(short)(y * 8 + UnknownC42A1F[EntitySizes[CurrentEntitySlot]]);
	EntityScriptVar7Table[CurrentEntitySlot] = cast(short)(x12 * 8 - UnknownC42AEB[EntitySizes[CurrentEntitySlot]] + UnknownC42A41[EntitySizes[CurrentEntitySlot]]);
	return -1;
}

/// $C0D0D9
short UnknownC0D0D9() {
	return UnknownC0CF97(3, 60);
}

/// $C0D0E6
short UnknownC0D0E6() {
	if ((UnknownC0C363() == 0) && (UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] != 0)) {
		EntityAbsXTable[CurrentEntitySlot] = gameState.leaderX.integer;
		EntityAbsYTable[CurrentEntitySlot] = gameState.leaderY.integer;
		return -1;
	}
	UnknownC09EFF();
	if ((UnknownC05CD7(Unknown7E2848, Unknown7E284A, CurrentEntitySlot, 4) & 0xC0) != 0) {
		UNKNOWN_30X2_TABLE_35[CurrentEntitySlot] -= 0x1000;
		return 0;
	}
	EntityAbsXTable[CurrentEntitySlot] = Unknown7E2848;
	EntityAbsYTable[CurrentEntitySlot] = Unknown7E284A;
	return -1;
}

/// $C0D15C
short UnknownC0D15C() {
	if ((MiscDebugFlags & 2) != 0) {
		return 0;
	}
	if (EntityCollidedObjects[23] == CurrentEntitySlot) {
		return -1;
	}
	if ((EntityCollidedObjects[CurrentEntitySlot] < 0) || (EntityCollidedObjects[CurrentEntitySlot] < 0x17)) {
		return 0;
	}
	return -1;
}

/// $C0D19B
void UnknownC0D19B() {
	short x20 = TouchedEnemy;
	BattleSwirlFlag = 0;
	short x;
	short y;
	if (Unknown7E1A86[TouchedEnemy] == 8) {
		y = 0;
		x = 1;
	} else {
		short x04 = ((UnknownC41EFF(EntityAbsXTable[x20], EntityAbsYTable[x20], EntityAbsXTable[Unknown7E4DB8], EntityAbsYTable[Unknown7E4DB8]) + 0x1000) / 0x2000);
		switch ((Unknown7E1A86[TouchedEnemy] - x04) & 7) {
			case 0:
			case 1:
			case 7:
				 y = 1;
				 break;
			default:
				y = 0;
				break;
		}
		switch ((gameState.leaderDirection - x04) & 7) {
			case 0:
			case 1:
			case 7:
				x = 0;
				break;
			default:
				x = 1;
				break;
		}
	}
	BattleInitiative = 0;
	if ((x == 1) && (y == 0)) {
		BattleInitiative = Initiative.PartyFirst;
	} else if ((y == 1) && (x == 0)) {
		BattleInitiative = Initiative.EnemiesFirst;
	}
	BattleSwirlCountdown = 120;
	CurrentBattleGroup = EntityTPTEntries[x20];
	BattleSwirlSequence();
	for (short i = 0; i != 4; i++) {
		short x02 = BattleEntryPointerTable[EntityTPTEntries[x20] & 0x7FFF].enemies[i].count;
		if (x02 != 0xFF) {
			short x1A = x02;
			if (x1A != 0) {
				y = BattleEntryPointerTable[EntityTPTEntries[x20] & 0x7FFF].enemies[i].enemyID;
				if (y == EntityEnemyIDs[x20]) {
					UNKNOWN_30X2_TABLE_41[x20] = 0xFFFF;
					x1A--;
				}
				if (x1A != 0) {
					for (short j = 0; j != 23; j++) {
						if (EntityScriptTable[j] == -1) {
							continue;
						}
						if (y != EntityEnemyIDs[j]) {
							continue;
						}
						UNKNOWN_30X2_TABLE_41[j] = 0xFFFF;
					}
				}
			}
		} else {
			x02 = 0;
			y = 0;
		}
		Unknown7E4A7C[i] = y;
		Unknown7E4A84[i] = x02;
	}
	EnemiesInBattle = 0;
	FindPathToParty(gameState.partyCount, 0x40, 0x40);
	for (short i = 0; i != 4; i++) {
		short x14 = BattleEntryPointerTable[CurrentBattleGroup].enemies[i].count;
		if (x14 == 0xFF) {
			continue;
		}
		if (x14 != 0) {
			short x1A = BattleEntryPointerTable[CurrentBattleGroup].enemies[i].enemyID;
			if (x1A != 0) {
				short x18 = 0;
				for (short j = 0; j < Unknown7EF000.Unknown7EF200.pather_count; j++) {
					if (Unknown7EF000.Unknown7EF200.pathers[j].obj_index == x1A) {
						x18++;
					}
				}
				if (x18 > x14) {
					for (short j = cast(short)(x18 - x14); j-- != 0;) {
						short x10 = -1;
						short x1C = 0;
						for (short k = 0; k < Unknown7EF000.Unknown7EF200.pather_count; k++) {
							if (EntityEnemyIDs[Unknown7EF000.Unknown7EF200.pathers[k].obj_index] != x1A) {
								continue;
							}
							if (Unknown7EF000.Unknown7EF200.pathers[k].point_count <= x1C) {
								continue;
							}
							x10 = x18;
							x1C = EntityEnemyIDs[Unknown7EF000.Unknown7EF200.pathers[k].point_count];
						}
						if (Unknown7EF000.Unknown7EF200.pathers[x10].obj_index != x20) {
							Unknown7EF000.Unknown7EF200.pathers[x10].point_count = 0;
							UNKNOWN_30X2_TABLE_41[Unknown7EF000.Unknown7EF200.pathers[x10].obj_index] = 0;
						}
					}
				}
			}
		}
	}
	for (short i = 0; i < 23; i++) {
		if (i == x20) {
			continue;
		}
		if (UNKNOWN_30X2_TABLE_41[i] == -1) {
			EntityTickCallbackFlags[i] &= 0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
		} else {
			EntitySpriteMapFlags[i] |= 0x8000;
		}
	}
	UNKNOWN_30X2_TABLE_41[x20] = 0;
	Unknown7E9F8C[EnemiesInBattle++] = EntityEnemyIDs[x20];
}

/// $C0D4DE
void UnknownC0D4DE() {
	memcpy(&Unknown7F0000[0x2000], &palettes[0][0], 0x200);
	for (short i = 0; i < 0x80; i++) {
		ushort x18 = (cast(ushort*)&palettes[0][0])[i];
		short x16 = x18 & 0x1F;
		short x02 = (x18 >> 5) & 0x1F;
		short tmp = (x18 >> 10) & 0x1F;
		short x16_2 = (x16 + x02 + tmp) / 3;
		(cast(ushort*)&palettes[0][0])[i] = cast(ushort)(x16_2 << 10 + x16_2 << 5 + x16_2);
	}
	UnknownC0856B(0x18);
}

/// $C0D59B
short UnknownC0D59B() {
	if ((BattleSwirlCountdown != 0) || (BattleSwirlFlag != 0)) {
		return 1;
	}
	return 0;
}

/// $C0D5B0
short UnknownC0D5B0() {
	if (BattleDebug != 0) {
		return 0;
	}
	if (Unknown7E5DC2 != 0) {
		return 0;
	}
	if ((BattleSwirlCountdown == 0) || (CurrentEntitySlot != TouchedEnemy)) {
		if (gameState.unknownB0 == 2) {
			return 0;
		}
		if ((MiscDebugFlags & 2) != 0) {
			return 0;
		}
		if (gameState.walkingStyle == WalkingStyle.Escalator) {
			return 0;
		}
		if (Unknown7E5D58 != 0) {
			return 0;
		}
		if ((BattleSwirlCountdown == 0) || (Unknown7E2E3E[CurrentEntitySlot] != 0)) {
			if (UnknownC0D15C() == 0) {
				return 0;
			}
		}
	}
	if ((BattleSwirlCountdown == 0) && (BattleSwirlFlag == 0) && (EntityEnemyIDs[CurrentEntitySlot] == EnemyID.MagicButterfly)) {
		return 1;
	}
	if ((BattleSwirlCountdown == 0) && (BattleSwirlFlag == 0)) {
		BattleSwirlFlag = 1;
		UnknownC0D4DE();
		if (CurrentEntitySlot == EntityCollidedObjects[23]) {
			Unknown7E4DB8 = 0x18;
		} else {
			Unknown7E4DB8 = EntityCollidedObjects[CurrentEntitySlot];
		}
		TouchedEnemy = CurrentEntitySlot;
		for (short i = 0; i < MAX_ENTITIES; i++) {
			if (i == 23) {
				continue;
			}
			EntityTickCallbackFlags[i] |= OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED;
		}
		UnknownC04A88();
		return 1;
	}
	EntityCollidedObjects[CurrentEntitySlot] = 0x8000;
	short x12 = 0;
	if (BattleSwirlCountdown != 0) {
		if (CurrentEntitySlot == TouchedEnemy) {
			EntityTickCallbackFlags[CurrentEntitySlot] |= OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED;
			x12 = 1;
		} else {
			x12 = 0;
			short y = 0;
			for (short i = 0; i != 4; i++) {
				if (CurrentEntitySlot == Unknown7E4A7C[i]) {
					short x0E = Unknown7E4A84[i];
					if (x0E != 0) {
						Unknown7E4A84[i] = cast(short)(x0E - 1);
						x12 = 1;
						EntityTickCallbackFlags[CurrentEntitySlot] |= OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED;
						Unknown7E9F8C[EnemiesInBattle++] = EntityEnemyIDs[CurrentEntitySlot];
					}
				}
				y += Unknown7E4A84[i];
			}
			if ((y == 0) && (UnknownC2E9C8() == 0)) {
				for (short i = 0; i < MAX_ENTITIES; i++) {
					if (i == 23) {
						continue;
					}
					EntityTickCallbackFlags[i] |= OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED;
				}
				BattleSwirlCountdown = 1;
			}
		}
	}
	return x12;
}

/// $C0D7E0
void UnknownC0D7E0() {
	if (UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] != 0) {
		UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] = 1;
	}
}

/// $C0D7F7
void UnknownC0D7F7() {
	if (UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] != -1) {
		return;
	}
	short x1C = EntitySizes[CurrentEntitySlot];
	VecYX* x1A = UNKNOWN_30X2_TABLE_46[CurrentEntitySlot];
	short x18 = EntityAbsXTable[CurrentEntitySlot];
	short x16 = EntityAbsYTable[CurrentEntitySlot];
	short x12 = cast(short)((Unknown7E4A8E - Unknown7E4A92 * 8) + x1A.x * 8 + UnknownC42A1F[x1C]);
	short x04 = cast(short)((Unknown7E4A90 - Unknown7E4A94 * 8) + x1A.y * 8 - UnknownC42AEB[x1C] + UnknownC42A41[x1C]);
	short x10 = cast(short)(x18 - x12);
	if (0 > x10) {
		x10 = cast(short)-cast(int)x10;
	}
	if (3 > x10) {
		x10 = cast(short)(x16 - x04);
		if (0 > x10) {
			x10 = cast(short)-cast(int)x10;
		}
		if ((3 > x10) && (--Unknown7E2E3E[CurrentEntitySlot] != 0)) {
			VecYX* x14 = &x1A[1];
			UNKNOWN_30X2_TABLE_46[CurrentEntitySlot] = x14;
			x12 = cast(short)((Unknown7E4A8E - Unknown7E4A92) * 8 + x14.x * 8 + UnknownC42A1F[x1C]);
			x04 = cast(short)((Unknown7E4A90 - Unknown7E4A94) * 8 + x14.y * 8 - UnknownC42AEB[x1C] + UnknownC42A41[x1C]);
		}
	}
	if (Unknown7E2E3E[CurrentEntitySlot] != 0) {
		EntityDirections[CurrentEntitySlot] = UnknownC46B0A(UnknownC47044(UnknownC41EFF(x18, x16, x12, x04)));
	} else {
		UNKNOWN_30X2_TABLE_41[CurrentEntitySlot] = 0;
		EntityObstacleFlags[CurrentEntitySlot] |= 0x80;
	}
}

/// $C0D77F
void UnknownC0D77F() {
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (i == CurrentEntitySlot) {
			continue;
		}
		if (i == 23) {
			continue;
		}
		EntityTickCallbackFlags[i] |= OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED;
	}
}

/// $C0D7B3
void UnknownC0D7B3() {
	Unknown7E4DBE = EntityAbsXTable[CurrentEntitySlot];
	Unknown7E4DC0 = EntityAbsYTable[CurrentEntitySlot];
}

/// $C0D7C7
void UnknownC0D7C7() {
	EntityAbsXTable[CurrentEntitySlot] = Unknown7E4DBE;
	EntityAbsYTable[CurrentEntitySlot] = Unknown7E4DC0;
}

/// $C0D98F
short UnknownC0D98F() {
	if (Unknown7E2E3E[CurrentEntitySlot] == 0) {
		return 0;
	}
	short x12 = EntitySizes[CurrentEntitySlot];
	VecYX* x0E = UNKNOWN_30X2_TABLE_46[CurrentEntitySlot];
	EntityScriptVar6Table[CurrentEntitySlot] = cast(short)((x0E.x * 8) + UnknownC42A1F[x12] + (Unknown7E4A8E - Unknown7E4A92) * 8);
	EntityScriptVar7Table[CurrentEntitySlot] = cast(short)((x0E.y * 8) - UnknownC42AEB[x12] + UnknownC42A41[x12] + (Unknown7E4A90 - Unknown7E4A94) * 8);
	Unknown7E2E3E[CurrentEntitySlot]--;
	UNKNOWN_30X2_TABLE_46[CurrentEntitySlot] = x0E + 1;
	return 1;
}

/// $C0DA31
//this looks pretty ugly... is this right?
void UnknownC0DA31() {
	if (FirstEntity + 1 == 0) {
		return;
	}
	short x02 = 0;
	for (short i = 0; i != 0x1E; i++) {
		if (EntityScriptTable[i] + 1 == 0) {
			continue;
		}
		if (EntityDrawPriority[i] - 1 == 0) {
			if (((EntityScreenYTable[i] + 8) & 0xFE00) == 0) {
				EntityDrawSorting[x02++] = cast(short)(i + 1);
			} else {
				UnknownC0A0CA(i);
			}
		}
	}
	EntityDrawSorting[x02] = -1;
	for (short i = x02; i-- != 0;) {
		short j;
		for (j = 0; EntityDrawSorting[j] == 0; j++) {}
		x02 = j;
		short x12 = j;
		short y = EntityAbsYTable[j - 1];
		while (EntityDrawSorting[++j] + 1 != 0) {
			if (EntityDrawSorting[j] == 0) {
				continue;
			}
			if (y >= EntityAbsYTable[EntityDrawSorting[j - 1]]) {
				continue;
			}
			y = EntityAbsYTable[EntityDrawSorting[j - 1]];
			x12 = j;
		}
		UnknownC0A0CA(cast(short)(EntityDrawSorting[x12] - 1));
		EntityDrawSorting[x12] = 0;
	}
}

/// $C0DB0F
void UnknownC0DB0F() {
	if (pad_state[1] & PAD_SELECT) {
		UnknownC0DA31();
		return;
	}

	int dp16 = -1;
	uint dp14 = FirstEntity;

	// UNKNOWN6
	// I guess this is a micro-optimization they decided to add here...? We've seen what == -1 looks like normally,
	// and this is logically equivalent to that, but usually the compiler just does CMP #$FFFF
	while (dp14 + 1) {
		if (EntityScreenYTable[dp14 / 2] < 256 || EntityScreenYTable[dp14 / 2] >= -64u) {
			// UNKNOWN3
			if (EntityDrawPriority[dp14 / 2] == 1) {
				EntityDrawSorting[dp14 / 2] = cast(short)dp16;
				dp16 = dp14 / 2;
			} else {
				// UNKNOWN4
				UnknownC0A0CA(cast(short)(dp14 / 2));
			}
		}
		// UNKNOWN5
		dp14 = EntityNextEntityTable[dp14 / 2];
	}

	// UNKNOWN12
	// Same little optimization as above
	while (dp16 + 1) {
		// UNKNOWN7
		uint dp10 = dp16;
		uint dp0E = EntityAbsYTable[dp16];
		uint dp04 = -1;
		uint dp02 = dp16;
		uint y = EntityDrawSorting[dp16];
		// UNKNOWN10
		// They really liked doing this huh...
		while (y + 1) {
			// UNKNOWN8
			if (EntityAbsYTable[y] >= dp0E) {
				dp0E = EntityAbsYTable[y];
				dp10 = y;
				dp04 = dp02;
			}
			// UNKNOWN9
			dp02 = y;
			y = EntityDrawSorting[y];
		}
		UnknownC0A0CA(cast(short)dp10);

		if (dp04 + 1) {
			EntityDrawSorting[dp04] = EntityDrawSorting[dp10];
		} else {
			// UNKNOWN11
			dp16 = EntityDrawSorting[dp10];
		}
	}
	// UNKNOWN13
}

/// $C0DBE6 - schedules a task to be run at some point in the future while on the overworld
short ScheduleOverworldTask(short arg1, void function() arg2) {
	OverworldTask* x10 = &OverworldTasks[0];
	short i;
	for (i = 0; i < 4; i++) {
		if (x10.framesLeft == 0) {
			break;
		}
		x10++;
	}
	x10.framesLeft = arg1;
	x10.func = arg2;
	return i;
}

/// $C0DC4E
void ProcessOverworldTasks() {
	if ((Unknown7E0002 == 0) && (DadPhoneTimer != 0)) {
		DadPhoneTimer--;
	}
	if (window_head != -1) {
		return;
	}
	if (BattleModeFlag != 0) {
		return;
	}
	if (BattleSwirlCountdown != 0) {
		return;
	}
	if (BattleSwirlFlag != 0) {
		return;
	}
	for (short i = 0; i < OverworldTasks.length; i++) {
		if (OverworldTasks[i].framesLeft == 0) {
			continue;
		}
		if (--OverworldTasks[i].framesLeft != 0) {
			continue;
		}
		OverworldTasks[i].func();
	}
}

/// $C0DCC6
void LoadDadPhone() {
	if (window_head != -1) {
		return;
	}
	if (BattleModeFlag != 0) {
		return;
	}
	if (BattleSwirlCountdown != 0) {
		return;
	}
	if (BattleSwirlFlag != 0) {
		return;
	}
	if (Unknown7E9E56 != 0) {
		return;
	}
	if (getEventFlag(EventFlag.UNKNOWN_307) != 0) {
		return;
	}
	UnknownC064E3(10, QueuedInteractionPtr(TextDadCalls.ptr));
	Unknown7E9E56 = 1;
}

/// $C0DD0F
void UnknownC0DD0F() {
	while (Unknown7E0028.a != 0) {
		OAMClear();
		UnknownC09466();
		UpdateScreen();
		WaitUntilNextFrame();
	}
}

/// $C0DD2C
void UnknownC0DD2C(short arg1) {
	for (short i = arg1; i != 0; i--) {
		OAMClear();
		UnknownC09466();
		UpdateScreen();
		WaitUntilNextFrame();
	}
}

/// $C0DD53
void SetTeleportState(ubyte arg1, TeleportStyle arg2) {
	teleportDestination = arg1;
	teleportStyle = arg2;
}

/// $C0DD79
void UnknownC0DD79() {
	for (short i = 1; i <= 10; i++) {
		setEventFlag(i, 0);
	}
	Unknown7E438A = PSITeleportDestinationTable[teleportDestination].x;
	Unknown7E438C = PSITeleportDestinationTable[teleportDestination].y;
	short x02 = cast(short)(Unknown7E438A * 8);
	short x0E = cast(short)(Unknown7E438C * 8);
	if (teleportStyle != TeleportStyle.Instant) {
		x02 += 0x13C;
	}
	Unknown7E5DD4 = -1;
	Unknown7E4370 = -1;
	Unknown7E436E = -1;
	InitializeMap(x02, x0E, 6);
}

/// $C0DE16
void UnknownC0DE16() {
	for (short i = 0x18; i < 0x1E; i++) {
		EntityScriptVar3Table[i] = 8;
		EntityScriptVar7Table[i] |= (1 << 11);
	}
}

/// $C0DE46
void UnknownC0DE46() {
	UnknownC0DE16();
	Unknown7E9F61 = cast(short)(rand() << 8);
	if (teleportStyle == TeleportStyle.PSIBeta) {
		Unknown7E9F63 = 4;
	} else {
		Unknown7E9F63 = 8;
		Unknown7E9F65 = 0;
	}
	Unknown7E9F67 = gameState.leaderX.integer;
	Unknown7E9F69 = gameState.leaderY.integer;
}

/// $C0DF22
void UnknownC0DF22(ushort arg1) {
	FixedPoint1616 x0E;
	switch (Unknown7E9F43) {
		case 1:
			if (gameState.unknown92 == 3) {
				FixedPoint1616 x06;
				x06.combined = Unknown7E9F45.combined;
				x06.fraction += 0x51E;
				if (x06.fraction < 0x51E) {
					x06.integer++;
				}
				x0E = x06;
			} else {
				FixedPoint1616 x06;
				x06.combined = Unknown7E9F45.combined;
				x06.fraction += 0x3333;
				if (x06.fraction < 0x3333) {
					x06.integer++;
				}
				x0E = x06;
			}
			break;
		case 3:
			if (gameState.unknown92 == 3) {
				FixedPoint1616 x06;
				x06.combined = Unknown7E9F45.combined;
				x06.fraction -= 0x1999;
				if (x06.fraction >= 0x10000 - 0x1999) {
					x06.integer--;
				}
				x0E = x06;
			} else {
				FixedPoint1616 x06;
				x06.combined = Unknown7E9F45.combined;
				x06.fraction += 0x1999;
				if (x06.fraction >= 0x10000 - 0x1999) {
					x06.integer--;
				}
				x0E = x06;
			}
			break;
		default:
			if (gameState.unknown92 == 3) {
				FixedPoint1616 x06;
				x06.combined = Unknown7E9F45.combined;
				x06.fraction += 0x29FB;
				if (x06.fraction < 0x29FB) {
					x06.integer++;
				}
				x0E = x06;
			} else {
				FixedPoint1616 x06;
				x06.combined = Unknown7E9F45.combined;
				x06.fraction += 0x1851;
				if (x06.fraction < 0x1851) {
					x06.integer++;
				}
				x0E = x06;
			}
			break;
	}
	Unknown7E9F45.combined = x0E.combined;
	if ((arg1 & 1) != 0) {
		Unknown7E9F49.combined = ((x0E.combined >> 8) * 0xB505) >> 8;
		Unknown7E9F4D.combined = ((x0E.combined >> 8) * 0xB505) >> 8;
	} else {
		Unknown7E9F49.combined = x0E.combined;
		Unknown7E9F4D.combined = x0E.combined;
	}
	switch (arg1) { //this is hard to read. were the cases rearranged to dedupe code?
		case 0:
			Unknown7E9F4D.combined = -Unknown7E9F4D.combined;
			goto case;
		case 4:
			Unknown7E9F49.combined = 0;
			break;
		case 6:
			Unknown7E9F49.combined = -Unknown7E9F49.combined;
			goto case;
		case 2:
			Unknown7E9F4D.combined = 0;
			break;
		case 1:
			Unknown7E9F4D.combined = -Unknown7E9F4D.combined;
			break;
		case 7:
			Unknown7E9F4D.combined = -Unknown7E9F4D.combined;
			goto case;
		case 5:
			Unknown7E9F49.combined = -Unknown7E9F49.combined;
			break;
		default: break;
	}
}

/// $C0DE7C
void UnknownC0DE7C() {
	Unknown7E4DC6 = &PartyCharacters[0];
	for (short i = 0x18; i < 0x1E; i++) {
		EntityScriptVar3Table[i] = 8;
		EntityScriptVar7Table[i] &= 0xF7FF;
		EntityCollidedObjects[i] &= 0x7FFF;
		Unknown7E4DC6.unknown55 = 0xFFFF;
		Unknown7E4DC6++;
	}
	ChangeMusic5DD6();
}

/// $C0DED9
short UnknownC0DED9(short arg1, short arg2, short arg3, short arg4, short) {
	if (Unknown7E9F43 != 0) {
		return 1;
	}
	return UnknownC05F33(arg1, arg2, gameState.currentPartyMembers) | UnknownC05F33(arg3, arg4, gameState.currentPartyMembers);
}

/// $C0E196
void UnknownC0E196() {
	PlayerPositionBuffer[gameState.unknown88].x_coord = gameState.leaderX.integer;
	PlayerPositionBuffer[gameState.unknown88].y_coord = gameState.leaderY.integer;
	PlayerPositionBuffer[gameState.unknown88].tile_flags =UnknownC05F33(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
	PlayerPositionBuffer[gameState.unknown88].walking_style = 0;
	PlayerPositionBuffer[gameState.unknown88].direction = gameState.leaderDirection;
	gameState.unknown88++;
	//uh... yeah, sure
	gameState.unknown88 = gameState.unknown88;
}

/// $C0E214
short UnknownC0E214(short arg1, short arg2) {
	if (gameState.unknown96[0] == arg1 + 1) {
		return cast(short)(arg2 + 1);
	}
	if (Unknown7E9F45.integer == 0) {
		return arg2;
	}
	return UnknownC03EC3(arg1, 6, arg2, 2);
}

/// $C0E254
void UnknownC0E254() {
	ushort x10 = cast(ushort)(12 - Unknown7E9F45.integer);
	//weird way to say x10 <= 0
	if ((x10 == 0) || ((x10 & 0x8000) != 0)) {
		x10 = 1;
	}
	for (short i = 0x18; i < 0x1D; i++) {
		EntityScriptVar3Table[i] = x10;
	}
}

/// $C0E28F
void UnknownC0E28F() {
	gameState.unknown90 = 1;
	ushort x02 = MapInputToDirection(0);
	if (gameState.leaderDirection == (x02 ^ 4)) {
		x02 = gameState.leaderDirection;
	}
	if (x02 == -1) {
		x02 = gameState.leaderDirection;
	}
	gameState.leaderDirection = x02;
	if (BattleSwirlCountdown != 0) {
		Unknown7E9F43 = 2;
		BattleDebug = 1;
	}
	UnknownC0DF22(x02);
	Unknown7E9F51.combined = Unknown7E9F49.combined + gameState.leaderX.combined;
	Unknown7E9F55.combined = Unknown7E9F4D.combined + gameState.leaderY.combined;
	if (NPCCollisionCheck(Unknown7E9F51.integer, Unknown7E9F55.integer, gameState.currentPartyMembers) != -1) {
		Unknown7E9F43 = 2;
	}
	if ((UnknownC0DED9(gameState.leaderX.integer, gameState.leaderY.integer, Unknown7E9F51.integer, Unknown7E9F55.integer, x02) & 0xC0) != 0) {
		Unknown7E9F43 = 2;
	}
	if (Unknown7E9F43 != 2) {
		gameState.leaderX = Unknown7E9F51;
		gameState.leaderY = Unknown7E9F55;
	}
	CenterScreen(gameState.leaderX.integer, gameState.leaderY.integer);
	UnknownC0E196();
	UnknownC0E254();
	if (Unknown7E9F45.integer > 9) {
		Unknown7E9F43 = 1;
	}
}

/// $C0E3C1
void UnknownC0E3C1() {
	Unknown7E4DC6 = &PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot]];
	UnknownC07A56(EntityScriptVar0Table[CurrentEntitySlot], PlayerPositionBuffer[PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot]].position_index].walking_style, CurrentEntitySlot);
	EntityAbsXTable[CurrentEntitySlot] = PlayerPositionBuffer[PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot]].position_index].x_coord;
	EntityAbsYTable[CurrentEntitySlot] = PlayerPositionBuffer[PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot]].position_index].y_coord;
	EntityDirections[CurrentEntitySlot] = PlayerPositionBuffer[PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot]].position_index].direction;
	EntitySurfaceFlags[CurrentEntitySlot] = PlayerPositionBuffer[PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot]].position_index].tile_flags;
	Unknown7E4DC6.position_index = cast(ubyte)UnknownC0E214(EntityScriptVar0Table[CurrentEntitySlot], PartyCharacters[EntityScriptVar1Table[CurrentEntitySlot]].position_index);
}

/// $C0E44D
void UnknownC0E44D() {
	if (teleportStyle == TeleportStyle.PSIBetter) {
		return;
	}
	if ((pad_state[0] & PAD_UP) != 0) {
		Unknown7E9F69--;
	}
	if ((pad_state[0] & PAD_DOWN) != 0) {
		Unknown7E9F69++;
	}
	if ((pad_state[0] & PAD_LEFT) != 0) {
		Unknown7E9F67--;
	}
	if ((pad_state[0] & PAD_RIGHT) != 0) {
		Unknown7E9F67++;
	}
}

/// $C0E48A
void UnknownC0E48A() {
	Unknown7E9F4D.integer = 0;
	Unknown7E9F49.integer = 0;
	switch (gameState.leaderDirection) {
		case Direction.Up:
			Unknown7E9F4D.integer = -5;
			break;
		case Direction.UpRight:
			Unknown7E9F4D.integer = -5;
			Unknown7E9F49.integer = 5;
			break;
		case Direction.Right:
			Unknown7E9F49.integer = 5;
			break;
		case Direction.DownRight:
			Unknown7E9F4D.integer = 5;
			Unknown7E9F49.integer = 5;
			break;
		case Direction.Down:
			Unknown7E9F4D.integer = 5;
			break;
		case Direction.DownLeft:
			Unknown7E9F4D.integer = 5;
			Unknown7E9F49.integer = -5;
			break;
		case Direction.Left:
			Unknown7E9F49.integer = -5;
			break;
		case Direction.UpLeft:
			Unknown7E9F4D.integer = -5;
			Unknown7E9F49.integer = -5;
			break;
		default: break;
	}
}

/// $C0E516
void UnknownC0E516() {
	gameState.unknown90 = 1;
	UnknownC0E44D();
	FixedPoint1616 x12 = UnknownC41FFF(Unknown7E9F61, Unknown7E9F63);
	Unknown7E9F51.integer = x12.integer >> 8 + Unknown7E9F67;
	Unknown7E9F55.integer = x12.integer >> 8 + Unknown7E9F69;
	if (teleportStyle != TeleportStyle.PSIBetter) {
		if ((UnknownC0DED9(gameState.leaderX.integer, gameState.leaderY.integer, Unknown7E9F51.integer, Unknown7E9F55.integer, gameState.leaderDirection) & 0xC0) != 0) {
			Unknown7E9F43 = 2;
		}
		if (BattleSwirlCountdown != 0) {
			Unknown7E9F43 = 2;
			BattleDebug = 1;
		}
		if (NPCCollisionCheck(Unknown7E9F51.integer, Unknown7E9F55.integer, gameState.currentPartyMembers) != -1) {
			Unknown7E9F43 = 2;
		}
	}
	if (Unknown7E9F43 != 2) {
		gameState.leaderX.integer = Unknown7E9F51.integer;
		gameState.leaderY.integer = Unknown7E9F55.integer;
	}
	gameState.leaderDirection = ((Unknown7E9F61 >> 13) + 2) & 7;
	Unknown7E9F45.combined += 0x1851;
	if (teleportStyle == TeleportStyle.PSIBeta) {
		Unknown7E9F61 += 0xA00;
		Unknown7E9F63 += 0xC;
	} else {
		Unknown7E9F65 += 0x20;
		Unknown7E9F61 += Unknown7E9F65;
		Unknown7E9F63 += 0x10;
	}
	CenterScreen(gameState.leaderX.integer, gameState.leaderY.integer);
	UnknownC0E196();
	UnknownC0E254();
	if (teleportStyle == TeleportStyle.PSIBeta) {
		if (Unknown7E9F63 > 0x1000) {
			Unknown7E9F43 = 1;
			UnknownC0E48A();
		}
	} else {
		if (Unknown7E9F65 > 0x1800) {
			Unknown7E9F43 = 1;
			UnknownC0E48A();
		}
	}
}

/// $C0E674
void UnknownC0E674() {
	UnknownC0DF22(gameState.leaderDirection);
	gameState.leaderX.combined += Unknown7E9F49.combined;
	gameState.leaderY.combined += Unknown7E9F4D.combined;
	Unknown7E9F5B += Unknown7E9F59;
	Unknown7E9F5F += Unknown7E9F5D;
	CenterScreen(Unknown7E9F5B, Unknown7E9F5F);
	UnknownC0E196();
}

/// $C0E776
void UnknownC0E776() {
	UnknownC0DF22(gameState.leaderDirection);
	gameState.leaderX.combined += Unknown7E9F49.combined;
	gameState.leaderX.combined += Unknown7E9F4D.combined;
	CenterScreen(cast(short)(gameState.leaderX.integer - ((Unknown7E9F45.combined * 2) & 0xFFFF)), gameState.leaderY.integer);
	UnknownC0E196();
	UnknownC0E254();
}

/// $C0E815
void UnknownC0E815() {
	if (teleportStyle == TeleportStyle.Instant) {
		return;
	}
	for (short i = 0x18; i < 0x1E; i++) {
		EntityCollidedObjects[i] = 0x8000;
	}
	Unknown7E9F4D.integer = 0;
	Unknown7E9F49.integer = 0;
	SetPartyTickCallbacks(0x17, &UnknownC0E674, &UnknownC0E3C1);
	Unknown7E9F59 = Unknown7E9F49.integer;
	Unknown7E9F5B = gameState.leaderX.integer;
	Unknown7E9F5D = Unknown7E9F4D.integer;
	Unknown7E9F5F = gameState.leaderY.integer;
	FadeOut(1, 4);
	UnknownC0DD0F();
}

/// $C0E897
void UnknownC0E897() {
	if (teleportStyle == TeleportStyle.Instant) {
		CenterScreen(gameState.leaderX.integer, gameState.leaderY.integer);
		FadeIn(1, 1);
		UnknownC0DD0F();
		return;
	}
	for (short i = 0; i < 6; i++) {
		PartyCharacters[i].unknown55 = 0xFFFF;
		UnknownC07A56(gameState.unknown96[i] - 1, 0, cast(short)(i + 0x18));
	}
	Unknown7E9F45.fraction = 0;
	Unknown7E9F45.integer = 8;
	gameState.leaderDirection = 6;
	Unknown7E9F43 = 3;
	SetPartyTickCallbacks(0x17, &UnknownC0E776, &UnknownC0E3C1);
	UnknownC0DE16();
	ChangeMusic(Music.TeleportIn);
	for (short i = 0; i < 0x1E; i++) {
		WaitUntilNextFrame();
	}
	FadeIn(1, 4);
	while (Unknown7E9F45.integer != 0) {
		OAMClear();
		UnknownC09466();
		UpdateScreen();
		WaitUntilNextFrame();
	}
	CenterScreen(gameState.leaderX.integer, gameState.leaderY.integer);
}

/// $C0E979
void UnknownC0E979() {
	//nothing
}

/// $C0E97C
void UnknownC0E97C() {
	EntitySurfaceFlags[CurrentEntitySlot] = UnknownC05F33(EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot], CurrentEntitySlot);
	UnknownC07A56(EntityScriptVar0Table[CurrentEntitySlot], -1, CurrentEntitySlot);
}

/// $C0E9BA
void UnknownC0E9BA() {
	Unknown7EB4B6 = 1;
	ChangeMusic(Music.TeleportFail);
	for (short i = PARTY_LEADER_ENTITY_INDEX; i < MAX_ENTITIES; i++) {
		EntityScriptVar7Table[i] |= 0x8000;
	}
	SetPartyTickCallbacks(0x17, &UnknownC0E979, &UnknownC0E97C);
	gameState.partyStatus = 1;
	for (short i = 0; i < 0xB4; i++) {
		OAMClear();
		UnknownC09466();
		UpdateScreen();
		WaitUntilNextFrame();
	}
	gameState.partyStatus = 0;
	Unknown7EB4B6 = 0;
}

/// $C0EA3E
void TeleportFreezeObjects() {
	for (short i = 0; i < 0x17; i++) {
		EntityTickCallbackFlags[i] |= OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED;
	}
}

/// $C0EA68
void TeleportFreezeObjects2() {
	for (short i = 0; i < 0x17; i++) {
		if ((EntityTickCallbackFlags[i] & (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED)) != (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED)) {
			EntityTickCallbackFlags[i] |= OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED;
		}
	}
}

/// $C0EA99
void TeleportMainLoop() {
	StopMusic();
	WaitUntilNextFrame();
	TeleportFreezeObjects();
	Unknown7E5DBA = 1;
	Unknown7E9F45.fraction = 0;
	Unknown7E9F45.integer = 0;
	Unknown7E9F43 = 0;
	UnknownC07C5B();
	UnknownC0DE46();
	switch(teleportStyle) {
		case TeleportStyle.PSIAlpha:
		case TeleportStyle.Unknown:
			SetPartyTickCallbacks(0x17, &UnknownC0E28F, &UnknownC0E3C1);
			break;

		case TeleportStyle.PSIBeta:
			SetPartyTickCallbacks(0x17, &UnknownC0E516, &UnknownC0E3C1);
			break;
		case TeleportStyle.Instant:
			Unknown7E9F43 = 1;
			break;
		case TeleportStyle.PSIBetter:
			SetPartyTickCallbacks(0x17, &UnknownC0E516, &UnknownC0E3C1);
			break;
		default: break;
	}
	if (teleportStyle != TeleportStyle.Instant) {
		ChangeMusic(Music.TeleportOut);
	} else do {
		OAMClear();
		UnknownC09466();
		TeleportFreezeObjects2();
		UpdateScreen();
		WaitUntilNextFrame();
	} while (Unknown7E9F43 != 0);

	switch (Unknown7E9F43) {
		case 1:
			UnknownC0E815();
			UnknownC0DD79();
			UnknownC0E897();
			if (teleportStyle == TeleportStyle.Unknown) {
				UnknownC46881(TextLearnedPSITeleportAlpha.ptr);
			}
			break;
		case 2:
			UnknownC0E9BA();
			UnknownC0DD2C(0xA);
			break;
		default: break;
	}
	SetPartyTickCallbacks(0x17, &UnknownC05200, &UnknownC04D78);
	UnknownC0DE7C();
	UnknownC09451();
	Unknown7E5DBA = 0;
	Unknown7E9F45.fraction = 0;
	Unknown7E9F45.integer = 0;
	Unknown7E5D58 = 0;
	teleportDestination = 0;
}

/// $C0EBE0
void UnknownC0EBE0() {
	Decomp(&TitleScreenGraphics[0], &Unknown7F0000[0]);
	CopyToVram(0, 0x8000, 0, &Unknown7F0000[0]);
	Decomp(&TitleScreenArrangement[0], &Unknown7F0000[0]);
	CopyToVram(0, 0x1000, 0x5800, &Unknown7F0000[0]);
	Decomp(&UnknownE1C6E5[0], &Unknown7F0000[0]);
	CopyToVram(0, 0x4000, 0x6000, &Unknown7F0000[0]);
}

/// $C0EC77
void UnknownC0EC77(short arg1) {
	if (arg1 == 0) {
		Decomp(&UnknownE1AE83[0], &Unknown7F0000[0]);
	} else {
		Decomp(&UnknownE1AEFD[0], &Unknown7F0000[0]);
	}
}

/// $C0ECB7
void UnknownC0ECB7() {
	Unknown7E0030 = 0;
	Decomp(&TitleScreenPalette[0], &palettes[0][0]);
	UnknownC496F9();
	memset(&palettes[0][0], 0, 0x100);
	UnknownC496E7(0xA5, 0xFF);
	Unknown7E0030 = 0x18;
}

/// $C0ED14
void UnknownC0ED14() {
	memset(&palettes[0][0], 0xFF, 0x100);
	Unknown7E0030 = 0x18;
}

/// $C0ED39
void UnknownC0ED39() {
	memset(&palettes[0][0], 0, 0x100);
	Unknown7E0030 = 0x18;
}

/// $C0ED5C
void UnknownC0ED5C() {
	Unknown7E0030 = 0;
	Decomp(&TitleScreenPalette[0], &palettes[0][0]);
	UnknownC0EC77(0);
	memcpy(&palettes[8][0], &Unknown7F0000[0x1A0], 0x20);
	UnknownC0EC77(1);
	memcpy(&palettes[7][0], &Unknown7F0000[0x260], 0x20);
	Unknown7E0030 = 0x18;
}

/// $C0EDD1
void UnknownC0EDD1() {
	Unknown7E9641 = 2;
}

/// $C0EDDA
void UnknownC0EDDA() {
	short x16 = EntityScriptVar0Table[CurrentEntitySlot];
	short x14 = EntityScriptVar1Table[CurrentEntitySlot];
	short x02 = EntityScriptVar2Table[CurrentEntitySlot];
	memcpy(&palettes[x14][0], &Unknown7F0000[x16 * 32], 0x20);
	short x12 = cast(short)(x16 + 1);
	if (x12 == x02) {
		x12 = 0;
	}
	EntityScriptVar0Table[CurrentEntitySlot] = x12;
	Unknown7E0030 = 0x18;
}

/// $C0EE47
void UnknownC0EE47() {
	TM_MIRROR = 0x13;
}

/// $C0EE53
void UnknownC0EE53() {
	EntitySpriteMapFlags[CurrentEntitySlot] &= 0x7FFF;
}

/// $C0EE68
void LogoScreenLoad(short arg1) {
	UnknownC08D79(1);
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x4000, 0);
	TM_MIRROR = 4;
	switch (arg1) {
		case 0:
			Decomp(&NintendoGraphics[0], &Unknown7F0000[0]);
			Decomp(&NintendoArrangement[0], &IntroBG2Buffer[0]);
			Decomp(&NintendoPalette[0], &palettes[0][0]);
			break;
		case 1:
			Decomp(&APEGraphics[0], &Unknown7F0000[0]);
			Decomp(&APEArrangement[0], &IntroBG2Buffer[0]);
			Decomp(&APEPalette[0], &palettes[0][0]);
			break;
		case 2:
			Decomp(&HALKENGraphics[0], &Unknown7F0000[0]);
			Decomp(&HALKENArrangement[0], &IntroBG2Buffer[0]);
			Decomp(&HALKENPalette[0], &palettes[0][0]);
			break;
		default: break;
	}
	CopyToVram(0, 0x8000, 0, &Unknown7F0000[0]);
	CopyToVram(0, 0x800, 0x4000, &IntroBG2Buffer[0]);
	Unknown7E0030 = 0x18;
}

/// $C0EFE1
short UnknownC0EFE1(short arg1) {
	for (short i = arg1; i != 0; i--) {
		if (pad_press[0] != 0) {
			return 1;
		}
		WaitUntilNextFrame();
	}
	return 0;
}

/// $C0F009
short LogoScreen() {
	LogoScreenLoad(0);
	FadeInWithMosaic(1, 2, 0);
	if (Debug != 0) {
		UnknownC0EFE1(0xB4);
	} else {
		for (short i = 0; i < 0xB4; i++) {
			WaitUntilNextFrame();
		}
	}
	FadeOutWithMosaic(1, 2, 0);
	LogoScreenLoad(1);
	FadeInWithMosaic(1, 2, 0);
	if (UnknownC0EFE1(0x78) != 0) {
		FadeOutWithMosaic(2, 1, 0);
		return 1;
	}
	FadeOutWithMosaic(1, 2, 0);
	LogoScreenLoad(2);
	FadeInWithMosaic(1, 2, 0);
	if (UnknownC0EFE1(0x78) != 0) {
		FadeOutWithMosaic(2, 1, 0);
		return 1;
	}
	FadeOutWithMosaic(1, 2, 0);
	return 0;
}

/// $C0F0D2
void GasStationLoad() {
	BG2_Y_POS = 0;
	BG2_X_POS = 0;
	BG1_Y_POS = 0;
	BG1_X_POS = 0;
	Decomp(&GasStationGraphics[0], &Unknown7F0000[0]);
	CopyToVram(0, 0xC000, 0, &Unknown7F0000[0]);
	Decomp(&GasStationArrangement[0], &Unknown7F0000[0]);
	CopyToVram(0, 0x800, 0x7800, &Unknown7F0000[0]);
	Decomp(&GasStationPalette[0], &palettes[0][0]);
	UnknownC4A377();
	UnknownC496F9();
	memset(&Unknown7F0000[0x40], 0, 0x20);
	memset(&palettes[0][0], 0, 0x40);
	memset(&palettes[3][0], 0, 0x1A0);
	UnknownC496E7(0x1E0, -1);
	TM_MIRROR = 1;
	TD_MIRROR = 2;
	CGWSEL = 2;
	CGADSUB = 3;
	Unknown7E0030 = 0x18;
}

/// $C0F1D2
void UnknownC0F1D2(short arg1) {
	//the original code also seems to set the bank byte separately, for some reason.
	UnknownC4954C(100, &palettes[0][0]);
	UnknownC496E7(arg1, -1);
}

/// $C0F21E
short UnknownC0F21E() {
	short result = 0;
	for (short i = 0; i < 236; i++) {
		if (pad_press[0] != 0) {
			return 1;
		}
		UnknownC2DB3F();
		WaitUntilNextFrame();
	}
	for (short i = 0; i < 480; i++) {
		if (pad_press[0] != 0) {
			return 1;
		}
		memcpy(&Unknown7E4476[0], &palettes[2][0], 0x20);
		UnknownC426ED();
		Unknown7E0030 = 0;
		UnknownC2DB14();
		memcpy(&palettes[2][0], &Unknown7E4476[0], 0x20);
		UnknownC2DB3F();
		Unknown7E0030 = 0x18;
		WaitUntilNextFrame();
	}
	UnknownC49740();
	CGADSUB = 0;
	CGWSEL = 0;
	TM_MIRROR = 1;
	TD_MIRROR = 0;
	if (UnknownC0EFE1(120) != 0) {
		return 1;
	}
	ChangeMusic(Music.GasStation2);
	short x12 = InitEntityWipe(ActionScript.Unknown860, 0, 0);
	while (EntityScriptTable[x12] != -1) {
		UnknownC09466();
		WaitUntilNextFrame();
		if (pad_press[0] != 0) {
			UnknownC09C35(x12);
			return 1;
		}
	}
	UnknownC0F1D2(330);
	return result;
}

/// $C0F33C
short GasStation() {
	UnknownC0927C();
	GasStationLoad();
	FadeIn(1, 11);
	short x11 = UnknownC0F21E();
	if (x11 != 0) {
		return 1;
	}
	for (short i = 0; i < 0x14A; i++) {
		if (pad_press[0] != 0) {
			return 1;
		}
		UnknownC426ED();
		WaitUntilNextFrame();
	}
	TM_MIRROR = 0;
	memset(&palettes[0][0], 0, 0x200);
	Unknown7E0030 = 0x18;
	if (x11 == 0) { //isn't this always true...?
		UnknownC0EFE1(0x1E);
	}
	return x11;
}

/// $C0F3B2
void UnknownC0F3B2() {
	Decomp(&GasStationPalette2[0], &palettes[0][0]);
	UnknownC0856B(0x18);
}

/// $C0F3E8
void UnknownC0F3E8() {
	Decomp(&GasStationPalette[0], &palettes[0][0]);
	UnknownC0856B(0x18);
}

/// $C0F41E
void UnknownC0F41E() {
	if (BG3_Y_POS > Unknown7EB4E3) {
		short x23 = Unknown7EB4F7;
		short x21 = cast(short)(Unknown7EB4F7 + 1);
		Unknown7EB4F7 = (Unknown7EB4F7 + 2) & 0xF;
		short x04 = ((BG3_Y_POS / 8) + 29) & 0x1F;
		short x02 = 0;
		short x1F = 0;
		const(ubyte)* x1B = Unknown7EB4E7;
		ushort* x17 = &bg2Buffer[x23 * 32];
		ushort* x0A = &bg2Buffer[x21 * 32];
		short x15 = (x1B++)[0];
		switch (x15) {
			case 1:
				Unknown7EB4E3 += 8;
				while (x1B[0] != 0) {
					(x17++)[0] = cast(ushort)((x1B++)[0] + 0x2000);
					x02++;
				}
				UnknownC4EFC4(0, cast(short)(x02 * 2), cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)), cast(ubyte*)&bg2Buffer[x23 * 32]);
				break;
			case 2:
				Unknown7EB4E3 += 16;
				while (x1B[0] != 0) {
					(x17++)[0] = cast(ushort)(x1B[0] + 0x2400);
					(x0A++)[0] = cast(ushort)((x1B++)[0] + 0x2410);
					x02++;
				}
				UnknownC4EFC4(0, cast(short)(x02 * 2), cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)), cast(ubyte*)&bg2Buffer[x23 * 32]);
				if (x04 != 0x1F) {
					x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) + 0x20);
				} else {
					x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) - 0x3E0);
				}
				UnknownC4EFC4(0, cast(short)(x02 * 2), x23, cast(ubyte*)&bg2Buffer[x21 * 32]);
				break;
			case 3:
				Unknown7EB4E3 += x1B[0] * 8;
				break;
			case 4:
				ubyte* x15_2 = &gameState.earthboundPlayerName[0];
				if (x15_2[0] != 0) {
					for (short i = 0; x15_2[0] != 0; i++) {
						short x13 = x15_2[0];
						switch (x13) {
							case 0xAC:
								Unknown7EB4F9[i] = 0x7C;
								break;
							case 0xAE:
								Unknown7EB4F9[i] = 0x7E;
								break;
							case 0xAF:
								Unknown7EB4F9[i] = 0x7F;
								break;
							default:
								if (x13 > 0x90) {
									x13 -= 0x50;
								} else {
									x13 -= 0x30;
								}
								Unknown7EB4F9[i] = cast(ubyte)x13;
								break;
						}
						x15_2++;
					}
					Unknown7EB4E3 += 16;
					for (short i = 0; (Unknown7EB4F9[i] != 0) && (i < 24); i++) {
						(x17++)[0] = cast(ushort)(Unknown7EB4F9[i] & 0xF0 + Unknown7EB4F9[i] + 0x2400);
						(x0A++)[0] = cast(ushort)(Unknown7EB4F9[i] & 0xF0 + Unknown7EB4F9[i] + 0x2410);
					}
					UnknownC4EFC4(0, cast(short)(x02 * 2), cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)), cast(ubyte*)&bg2Buffer[x23 * 32]);
					if (x04 != 0x1F) {
						x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) + 0x20);
					} else {
						x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) - 0x3E0);
					}
					UnknownC4EFC4(0, cast(short)(x02 * 2), x23, cast(ubyte*)&bg2Buffer[x21 * 32]);
				}
				x1B--;
				break;
			case 0xFF:
				Unknown7EB4E3 = -1;
				break;
			default: break;
		}
		Unknown7EB4E7 = x1B + 1;
	}
	if (Unknown7EB4E5 < BG3_Y_POS) {
		Unknown7EB4E5 += 8;
		UnknownC4EFC4(3, 0x40, ((((BG3_Y_POS / 8) - 1) & 0x1F) * 32) + 0x6C00, &UnknownC40BE8[0]);
	}
	Unknown7EB4EB.combined += 0x4000;
	BG3_Y_POS = Unknown7EB4EB.integer;
	UnknownC0AD9F();
}

immutable SNESHeader header = {
	makerCode: "01",
	gameCode: "MB  ",
	title: "EARTH BOUND          ",
	mapMode: 0x31,
	romType: 0x02,
	romSize: 0x0C,
	sramSize: 0x03,
	destinationCode: 0x01,
	licenseeCode: 0x33,
	version_: 0,
	checksumComplement: 0xBFB7,
	checksum: 0x4048,
	nativeNMI: &NMI,
	nativeIRQ: &IRQ,
	emulationRESET: &start,
};
