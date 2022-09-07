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
import std.experimental.logger;

/// $C00000
short* clearEntityDrawSortingTable() {
	entityDrawSorting[] = 0;
	return entityDrawSorting.ptr;
}

/// $C00013
void overworldSetupVRAM() {
	unknownC08D79(9);
	setBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0);
	setBG2VRAMLocation(BGTileMapSize.horizontal, 0x5800, 0x2000);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	setOAMSize(0x62);
}

/// $C0004B
void overworldInitialize() {
	overworldSetupVRAM();
	unknown7F0000[0] = 0;
	copyToVRAM(3, 0, 0, &unknown7F0000[0]);
	unknown7E4370 = -1;
	unknown7E436E = -1;
}

/// $C00085
void loadTilesetAnim() {
	loadedAnimatedTileCount = 0;
	if (mapDataWeirdTileAnimationPointerTable[unknown7E4372].count == 0) {
		return;
	}
	decomp(&mapDataTileAnimationPointerTable[unknown7E4372][0], &unknown7EC000[0]);
	loadedAnimatedTileCount = mapDataWeirdTileAnimationPointerTable[unknown7E4372].count;
	for (short i = 0; i < loadedAnimatedTileCount; i++) {
		overworldTilesetAnim[i].frameCount = mapDataWeirdTileAnimationPointerTable[unknown7E4372].animations[i].frameCount;
		overworldTilesetAnim[i].framesUntilUpdate = mapDataWeirdTileAnimationPointerTable[unknown7E4372].animations[i].frameDelay;
		overworldTilesetAnim[i].frameDelay = mapDataWeirdTileAnimationPointerTable[unknown7E4372].animations[i].frameDelay;
		overworldTilesetAnim[i].copySize = mapDataWeirdTileAnimationPointerTable[unknown7E4372].animations[i].copySize;
		overworldTilesetAnim[i].sourceOffset = mapDataWeirdTileAnimationPointerTable[unknown7E4372].animations[i].sourceOffset;
		overworldTilesetAnim[i].sourceOffset2 = mapDataWeirdTileAnimationPointerTable[unknown7E4372].animations[i].sourceOffset;
		overworldTilesetAnim[i].destinationAddress = mapDataWeirdTileAnimationPointerTable[unknown7E4372].animations[i].destinationAddress;
		overworldTilesetAnim[i].frameCounter = 0;
	}
}

/// $C00172
void animateTileset() {
	for (short i = 0; loadedAnimatedTileCount > i; i++) {
		if (--overworldTilesetAnim[i].framesUntilUpdate != 0) {
			continue;
		}
		overworldTilesetAnim[i].framesUntilUpdate = overworldTilesetAnim[i].frameDelay;
		if (overworldTilesetAnim[i].frameCounter == overworldTilesetAnim[i].frameCount) {
			overworldTilesetAnim[i].frameCounter = 0;
			overworldTilesetAnim[i].sourceOffset2 = overworldTilesetAnim[i].sourceOffset;
		}
		copyToVRAM(0, overworldTilesetAnim[i].copySize, overworldTilesetAnim[i].destinationAddress, &unknown7EC000[overworldTilesetAnim[i].sourceOffset2]);
		overworldTilesetAnim[i].sourceOffset2 += overworldTilesetAnim[i].copySize;
		overworldTilesetAnim[i].frameCounter++;
	}
}

/// $C0023F
void loadPaletteAnim() {
	unknown7E4474 = 0;
	if (palettes[5][0] == 0) {
		return;
	}
	if (mapDataPaletteAnimationPointerTable[palettes[5][0] - 1].count == 0) {
		return;
	}
	decomp(&mapDataPaletteAnimationPointerTable[palettes[5][0] - 1].ptr[0], &unknown7EB800[0]);
	for (short i = 0; i < overworldPaletteAnim.delays.length; i++) {
		overworldPaletteAnim.delays[i] = 0;
	}
	for (short i = 0; i < mapDataPaletteAnimationPointerTable[palettes[5][0] - 1].count; i++) {
		overworldPaletteAnim.delays[i] = mapDataPaletteAnimationPointerTable[palettes[5][0] - 1].entries[i];
	}
	overworldPaletteAnim.timer = overworldPaletteAnim.delays[0];
	unknown7E4474 = 1;
	overworldPaletteAnim.index = 1;
}

/// $C0030F
void animatePalette() {
	if (--overworldPaletteAnim.timer != 0) {
		return;
	}
	if (overworldPaletteAnim.delays[overworldPaletteAnim.index] == 0) {
		overworldPaletteAnim.index = 0;
	}
	overworldPaletteAnim.timer = overworldPaletteAnim.delays[overworldPaletteAnim.index];
	unknownC0A1F2(overworldPaletteAnim.index);
	overworldPaletteAnim.index++;
}

/// $C0035B
ushort unknownC0035B(ushort a, ushort x, ushort y) {
	return unknown7F0000[0x8000 + a * 32 + x * 2 + y * 8];
}

/// $C00391
void getColorAverage(ushort* ptr) {
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
	unknown7E43D0 = cast(ushort)((x04 * 8) / x12);
	unknown7E43D2 = cast(ushort)((x14 * 8) / x12);
	unknown7E43D4 = cast(ushort)((x16 * 8) / x12);
}

/// $C00434
ushort unknownC00434(ushort arg1, ushort arg2) {
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
void unknownC00480() {
	getColorAverage(&palettes[2][0]);
	ushort x20 = cast(ushort)((unknown7E43D0 / unknown7E43D6) << 8);
	ushort x1E = cast(ushort)((unknown7E43D2 / unknown7E43D8) << 8);
	ushort x1C = cast(ushort)((unknown7E43D4 / unknown7E43DA) << 8);
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
			x14 = unknownC00434(x14, (x16 >> 8) & 0x1F);
			x02 = unknownC00434(x10, (x02 >> 8) & 0x1F);
			x0E = unknownC00434(x0E, (x04 >> 8) & 0x1F);
			palettes[i / 16][i % 16] = cast(ushort)((x0E << 10) | (x02 << 5) | x14);
		}
	}
}

/// $C005E7
void unknownC005E7() {
	memcpy(&palettes[2][0], &mapPalettePointerTable[1][0], 0xC0);
	getColorAverage(&palettes[2][0]);
	unknown7E43D6 = unknown7E43D0;
	unknown7E43D8 = unknown7E43D2;
	unknown7E43DA = unknown7E43D4;
}

/// $C0062A
void loadCollisionData(short tileset) {
	const(ubyte[4][4]*)* x0A = &mapDataTileCollisionPointerTable[tileset][0];
	const(ubyte[4][4])** x06 = &tileCollisionBuffer[0];
	for (short i = 0; i < 0x3C0; i++) {
		*(x06++) = *(x0A++);
	}
}

/// $C0067E
void function14(short index1, short index2) {
	ushort* x0A = cast(ushort*)&unknown7F0000[0x8000 + index1 * 32];
	ushort* x06 = cast(ushort*)&unknown7F0000[0x8000 + index2 * 32];
	for (short i = 0; i < 16; i++) {
		*(x0A++) = *(x06++);
	}
	tileCollisionBuffer[index1] = tileCollisionBuffer[index2];
}

/// $C006F2
void unknownC006F2(short arg1) {
	const(MapTileEvent)* x06 = &eventControlPointerTable[arg1][0];
	while (true) {
		if (x06.eventFlag == 0) {
			break;
		}
		short x0E = getEventFlag(x06.eventFlag & 0x7FFF);
		short y = x06.count;
		if (x0E == (x06.eventFlag >= eventFlagUnset) ? 1 : 0) {
			const(MapTilePair)* x06_2 = &x06.tiles[0];
			for (short i = y; i != 0; i--) {
				function14(x06_2.tile1, x06_2.tile2);
				x06_2++;
			}
		} else {
			x06++;
		}
	}
}

/// $C00778
void loadSpecialSpritePalette() {
	if (palettes[4][0] == 0) {
		return;
	}
	ushort* x10 = &palettes[palettes[4][0] / 2][0];
	for (short i = 0; i < 0x10; i++) {
		palettes[12][i] = *(x10++);
	}
}

/// $C007B6
void loadMapPalette(short arg1, short arg2) {
	const(ubyte)* x16 = &mapPalettePointerTable[arg1][arg2 * 192];
	if (unknown7EB4EF == 0) {
		while (true) {
			memcpy(&palettes[2][0], x16, 0xC0);
			if (palettes[2][0] == 0) {
				break;
			}
			if (getEventFlag(palettes[2][0] & 0x7FFF) != (palettes[2][0] > eventFlagUnset) ? 1 : 0) {
				break;
			}
			//the original code used palettes[3][0] as a raw near pointer, which isn't possible on most platforms
			x16 = &paletteOffsetToPointer(palettes[3][0])[0];
		}
	} else {
		decomp(&compressedPaletteUnknown[0], &unknown7F0000[0]);
		memcpy(&palettes[2][0], &unknown7F0000[photographerConfigTable[currentPhotoDisplay].creditsMapPalettesOffset], 0xC0);
	}
}

/// $C008C3
void loadMapAtSector(short x, short y) {
	if ((unknown7E438A | unknown7E438C) != 0) {
		x = unknown7E438A / 32;
		y = unknown7E438C / 16;
	}
	ubyte x1A = globalMapTilesetPaletteData[y][x];
	ubyte x18 = x1A & 7;
	ubyte x04 = x1A >> 3;
	decomp(&mapDataTileArrangementPtrTable[tilesetTable[x04]][0], &unknown7F0000[0x8000]);
	loadCollisionData(tilesetTable[x04]);
	unknownC006F2(tilesetTable[x04]);
	unknownC005E7();
	memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
	if (x04 != unknown7E436E) {
		unknown7E4372 = tilesetTable[x04];
		decomp(&mapDataTilesetPtrTable[tilesetTable[x04]][0], &unknown7F0000[0]);
		while (unknown7E0028.a != 0) { waitForInterrupt(); }
		if (unknown7EB4EF == 0) {
			copyToVRAM2(0, 0x7000, 0, &unknown7F0000[0]);
		} else {
			copyToVRAM2(0, 0x4000, 0, &unknown7F0000[0]);
		}
	}
	while (unknown7E0028.a != 0) { waitForInterrupt(); }
	loadMapPalette(x04, x18);
	unknownC00480();
	loadSpecialSpritePalette();
	if (unknown7EB4EF == 0) {
		loadOverlaySprites();
		loadTilesetAnim();
		loadPaletteAnim();
	}
	if (unknown7EB4EF == 0) {
		if (debugging != 0) {
			unknownEFD9F3();
		} else {
			unknownC47F87();
		}
		unknownC0856B(0);
	}
	memcpy(&unknown7E4476[0], &palettes[2][0], 0x1C0);
	if (unknown7E4676 != 0) {
		unknownC496F9();
		memset(&palettes[0][0], 0xFF, 0x200);
	}
	if (unknown7EB4EF != 0) {
		unknownC496F9();
		memset(&palettes[1][0], 0, 0x1E0);
	}
	unknownC0856B(0x18);
	unknown7E436E = x04;
	unknown7E4370 = x18;
}

/// $C00AA1
short loadSectorAttributes(ushort arg1, ushort arg2) {
	currentSectorAttributes = mapDataPerSectorAttributesTable[(arg2 &0xFF80) >> 7][arg1 >> 8];
	return currentSectorAttributes;
}

/// $C00AC5
void unknownC00AC5(short x, short y) {
	y /= 4;
	short x16 = x / 4;
	x = x16 & 0xF;
	unknown7E4390[x] = cast(byte)x16;
	unknown7E43A0[y & 0xF] = cast(byte)y;
	ubyte x12;
	version(bugfix) {
		// Set currentSectorPalette to invalid value unused in original game -
		// this is to show it hasn't been set yet
		x12 = 0xFE;
	} else {
		x12 = globalMapTilesetPaletteData[y / 4][x16 / 8] / 8;
	}
	ushort* x14 = cast(ushort*)&unknown7EF000.unknown7EF000[y & 0xF];
	if (cast(ushort)y < 0x140) {
		short x10 = x;
		for (short i = 0; i < 16; i++) {
			version(bugfix) {
				// Set x12 only if coordinates are in range, and only if it needs
				// to be set (it was never set, or beginning new sector)
				if ((cast(ushort)x16 < 0x100) && ((x12 == 0xFE) || ((x16 & 8) == 0))) {
					x12 = globalMapTilesetPaletteData[y / 4][x16 / 8] / 8;
				}
			} else {
				if ((x16 & 8) == 0) {
					x12 = globalMapTilesetPaletteData[y / 4][x16 / 8] / 8;
				}
			}
			if ((cast(ushort)x16 < 0x100) && (unknown7E436E == x12)) {
				x14[x10] = unknownC0A156(x16, y);
			} else {
				x14[x10] = 0;
			}
			x10 = (x10 + 1) & 0xF;
			x16++;
		}
	} else {
		for (short i = 0; i < 16; i++) {
			x14[i] = 0;
		}
	}
}

/// $C00BDC
void unknownC00BDC(short x, short y) {
	x /= 4;
	y /= 4;
	short x18 = x & 0xF;
	unknown7E43B0[x18] = cast(byte)x;
	short x16 = y & 0xF;
	unknown7E43C0[x16] = cast(byte)y;
	short x14 = globalMapTilesetPaletteData[y / 4][x / 8] / 8;
	ushort* x12 = &unknown7EF000.unknown7EF000[x18][0];
	if (x < 0x100) {
		short x10 = cast(short)(x16 * 16);
		for (short i = 0; i < 16; i++) {
			if ((y & 3) == 0) {
				x14 = globalMapTilesetPaletteData[y / 4][x / 8] / 8;
			}
			if ((y < 0x140) && (unknown7E436E == x14)) {
				x12[x10] = unknownC0A156(x, y);
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
void loadCollisionRow(short x, short y) {
	ushort* x02 = &unknown7EF000.unknown7EF000[(y / 4) & 0xF][0];
	ubyte* x10 = &unknown7EE000[y & 0x3F][0];
	for (short i = 0; i < 16; i++) {
		const(ubyte[4][4])* x12 = tileCollisionBuffer[*x02];
		x02++;
		x10[0] = (*x12)[y & 3][0];
		x10[1] = (*x12)[y & 3][1];
		x10[2] = (*x12)[y & 3][2];
		x10[3] = (*x12)[y & 3][3];
		x10 += 4;
	}
}

/// $C00D7E
void loadCollisionColumn(short x, short y) {
	ushort* x02 = &unknown7EF000.unknown7EF000[0][(x / 4) & 0xF];
	ubyte* x10 = &unknown7EE000[0][x & 0x3F];
	for (short i = 0; i < 16; i++) {
		const(ubyte[4][4])* x12 = tileCollisionBuffer[*x02];
		x02 += 16;
		x10[0] = (*x12)[0][x & 3];
		x10[64] = (*x12)[1][x & 3];
		x10[128] = (*x12)[2][x & 3];
		x10[192] = (*x12)[3][x & 3];
		x10 += 256;
	}
}

/// $C00E16
void unknownC00E16(short x, short y) {
	if (debugging != 0) {
		unknownEFDFC4(x, y);
	}
	ushort* x1E = cast(ushort*)sbrk(0x100);
	ushort* x1C = &x1E[0x40];
	x--;
	ushort x18 = cast(ushort)((unknown7EF000.unknown7EF000[((y / 4) & 0xF)][(x / 4) & 0xF] * 16) + ((y & 3) * 4) + (x & 3));
	short x16 = x & 0x3F;
	for (short i = 0; i < 34; i++) {
		if ((x & 3) == 0) {
			x18 = cast(ushort)((unknown7EF000.unknown7EF000[((y / 4) & 0xF)][(x / 4) & 0xF] * 16) + ((y & 3) * 4));
		}
		ushort x12 = (cast(ushort*)&unknown7F0000)[0x8000 + x18];
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
	copyToVRAM(0, 0x3800 + ((y & 0x1F) * 32), 0x40, cast(ubyte*)&x1E[0]);
	copyToVRAM(0, 0x3C00 + ((y & 0x1F) * 32), 0x40, cast(ubyte*)&x1E[0x20]);
	if (unknown7EB4EF == 0) {
		copyToVRAM(0, 0x5800 + ((y & 0x1F) * 32), 0x40, cast(ubyte*)&x1C[0]);
		copyToVRAM(0, 0x5C00 + ((y & 0x1F) * 32), 0x40, cast(ubyte*)&x1C[0x20]);
	}
}

/// $C00FCB
void unknownC00FCB(short x, short y) {
	if (debugging != 0) {
		unknownEFE07C(x, y);
	}
	ushort* x1E = cast(ushort*)sbrk(0x80);
	ushort* x1C = &x1E[0x20];
	y--;
	ushort x18 = cast(ushort)((unknown7EF000.unknown7EF000[((y / 4) & 0xF)][(x / 4) & 0xF] * 16) + ((y & 3) * 4) + (x & 3));
	short x16 = y & 0x1F;
	for (short i = 0; i < 30; i++) {
		if ((y & 3) == 0) {
			x18 = cast(ushort)((unknown7EF000.unknown7EF000[((y / 4) & 0xF)][(x / 4) & 0xF] * 16) + (x & 3));
		}
		ushort x12 = (cast(ushort*)&unknown7F0000)[0x8000 + x18];
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
		copyToVRAM(0x1B, 0x3800 + (x & 0x3F), 0x40, cast(ubyte*)x1E);
		copyToVRAM(0x1B, 0x5800 + (x & 0x3F), 0x40, cast(ubyte*)x1C);
	} else {
		copyToVRAM(0x1B, 0x3C00 + (x & 0x1F), 0x40, cast(ubyte*)x1E);
		copyToVRAM(0x1B, 0x5C00 + (x & 0x1F), 0x40, cast(ubyte*)x1C);
	}
}

/// $C01181
void unknownC01181(short arg1, short arg2) {
	ubyte* x12 = cast(ubyte*)sbrk(0x40);
	memset(x12, 0, 0x40);
	copyToVRAM(0, 0x40, cast(ushort)(((arg2 & 0x1F) * 32) + 0x3800), x12);
	copyToVRAM(0, 0x40, cast(ushort)(((arg2 & 0x1F) * 32) + 0x3C00), x12);
	copyToVRAM(0, 0x40, cast(ushort)(((arg2 & 0x1F) * 32) + 0x5800), x12);
	copyToVRAM(0, 0x40, cast(ushort)(((arg2 & 0x1F) * 32) + 0x5C00), x12);
}

/// $C0122A
void unknownC0122A(short arg1, short arg2) {
	ubyte* x12 = cast(ubyte*)sbrk(0x40);
	memset(x12, 0, 0x40);
	arg1 &= 0x3F;
	if (arg1 <= 0x1F) {
		copyToVRAM(0x1B, 0x40, cast(ushort)(arg1 + 0x3800), x12);
		copyToVRAM(0x1B, 0x40, cast(ushort)(arg1 + 0x5800), x12);
	} else {
		copyToVRAM(0x1B, 0x40, cast(ushort)((arg1 & 0x1F) + 0x3C00), x12);
		copyToVRAM(0x1B, 0x40, cast(ushort)((arg1 & 0x1F) + 0x5C00), x12);
	}
}

/// $C012ED
void reloadMapAtPosition(short x, short y) {
	unknown7E4380 = x;
	unknown7E437C = x;
	unknown7E4382 = y;
	unknown7E437E = y;
	short x14 = x / 8;
	short x02 = y / 8;
	unknown7E4370 = -1;
	unknown7E436E = -1;
	loadMapAtSector(x14 / 32, x02 / 16);
	for (short i = 0; i < 16; i++) {
		unknown7E43C0[i] = -1;
		unknown7E43B0[i] = -1;
		unknown7E43A0[i] = -1;
		unknown7E4390[i] = -1;
	}
	for (short i = 0; i < 60; i++) {
		unknownC00AC5(cast(short)(x14 - 32), cast(short)(x02 - 32 + i));
	}
	for (short i = 0; i < 60; i++) {
		loadCollisionRow(cast(short)(x14 - 32), cast(short)(x02 - 32 + i));
	}
	for (short i = -1; i != 31; i++) {
		unknownC00E16(cast(short)(x14 - 16), cast(short)(x02 - 14 + i));
	}
	while (unknown7E0028.a != 0) { waitForInterrupt(); }
	bg2XPosition = cast(short)(unknown7E4380 - 0x80);
	bg1XPosition = cast(short)(unknown7E4380 - 0x80);
	bg2YPosition = cast(short)(unknown7E4382 - 0x70);
	bg1YPosition = cast(short)(unknown7E4382 - 0x70);
	unknown7E4374 = cast(short)(x14 - 16);
	unknown7E4376 = cast(short)(x02 - 14);
}

/// $C013F6
void loadMapAtPosition(short x, short y) {
	tracef("Loading map at %s,%s", x, y);
	unknownC02194();
	unknown7E4380 = x;
	unknown7E437C = x;
	unknown7E4382 = y;
	unknown7E437E = y;
	short x02 = x / 8;
	short x12 = y / 8;
	loadMapAtSector(x02 / 32, x12 / 16);
	if (unknown7EB4EF == 0) {
		overworldSetupVRAM();
	}
	for (short i = 0; i < 16; i++) {
		unknown7E43C0[i] = -1;
		unknown7E43B0[i] = -1;
		unknown7E43A0[i] = -1;
		unknown7E4390[i] = -1;
	}
	for (short i = 0; i < 60; i++) {
		unknownC00AC5(cast(short)(x02 - 32), cast(short)(x12 - 32 + i));
	}
	for (short i = 0; i < 60; i++) {
		loadCollisionRow(cast(short)(x02 - 32), cast(short)(x12 - 32 + i));
	}
	while (unknown7E0028.a != 0) { waitForInterrupt(); }
	if (unknown7EB4EF == 0) {
		mirrorTM = 0x17;
	}
	if (unknown7E4A58 != 0) {
		unknown7E4A58 = 1;
	}
	bg2XPosition = cast(short)(unknown7E4380 - 0x80);
	bg1XPosition = cast(short)(unknown7E4380 - 0x80);
	bg2YPosition = cast(short)(unknown7E4382 - 0x70);
	bg1YPosition = cast(short)(unknown7E4382 - 0x70);
	for (short i = -1; i != 31; i++) {
		unknownC00E16(cast(short)(x02 - 16), cast(short)(x12 - 14 + i));
		unknownC0255C(cast(short)(x02 - 16), cast(short)(x12 - 14 + i));
	}
	for (short i = -8; i != 40; i++) {
		spawnHorizontal(cast(short)(x02 - 16), cast(short)(x12 + i));
	}
	if (unknown7E4A58 != 0) {
		unknown7E4A58 = -1;
	}
	unknown7E4374 = cast(short)(x02 - 16);
	unknown7E4376 = cast(short)(x12 - 14);
}

/// $C01558
void refreshMapAtPosition(short x, short y) {
	bg2XPosition = x;
	bg1XPosition = x;
	bg2YPosition = y;
	bg1YPosition = y;
	short x04 = x / 8;
	short x02 = y / 8;
	while ((unknown7E4374 - x04) != 0) {
		if (((unknown7E4374 - x04) < 0) != 0) {
			unknown7E4374++;
			unknownC00BDC(cast(short)(unknown7E4374 + 41), cast(short)(x02 - 16));
			loadCollisionColumn(cast(short)(unknown7E4374 + 41), cast(short)(x02 - 16));
			unknownC00FCB(cast(short)(unknown7E4374 + 32), x02);
			unknownC025CF(cast(short)(unknown7E4374 + 34), cast(short)(x02 - 1));
			spawnVertical(cast(short)(unknown7E4374 + 40), cast(short)(x02 - 8));
		} else {
			unknown7E4374--;
			unknownC00BDC(cast(short)(unknown7E4374 - 16), cast(short)(x02 - 16));
			loadCollisionColumn(cast(short)(unknown7E4374 - 16), cast(short)(x02 - 16));
			unknownC00FCB(cast(short)(unknown7E4374 - 1), x02);
			unknownC025CF(cast(short)(unknown7E4374 - 3), cast(short)(x02 - 1));
			spawnVertical(cast(short)(unknown7E4374 - 8), cast(short)(x02 - 8));
		}
	}
	while ((unknown7E4376 - x02) != 0) {
		if (((unknown7E4376 - 0x02) < 0) != 0) {
			unknown7E4376++;
			unknownC00AC5(cast(short)(x04 - 16), cast(short)(unknown7E4376 + 41));
			loadCollisionRow(cast(short)(x04 - 16), cast(short)(unknown7E4376 + 41));
			unknownC00E16(x04, cast(short)(unknown7E4376 + 28));
			unknownC0255C(x04, cast(short)(unknown7E4376 + 29));
			spawnHorizontal(cast(short)(x04 - 8), cast(short)(unknown7E4376 + 36));
		} else {
			unknown7E4376--;
			unknownC00AC5(cast(short)(x04 - 16), cast(short)(unknown7E4376 - 16));
			loadCollisionRow(cast(short)(x04 - 16), cast(short)(unknown7E4376 - 16));
			unknownC00E16(x04, cast(short)(unknown7E4376 - 1));
			unknownC0255C(x04, cast(short)(unknown7E4376 - 1));
			spawnHorizontal(cast(short)(x04 - 8), cast(short)(unknown7E4376 - 8));
		}
	}
	unknown7E4386 = x;
	unknown7E4388 = y;
}

/// $C01731
void unknownC01731(short x, short y) {
	bg2XPosition = x;
	bg1XPosition = x;
	bg2YPosition = y;
	bg1YPosition = y;
	short x0E = x / 8;
	short x02 = y / 8;
	while (unknown7E4374 - x0E != 0) {
		if (unknown7E4374 - x0E < 0) {
			unknown7E4374++;
			unknownC0122A(cast(short)(unknown7E4374 + 0x20), x02);
		} else {
			unknown7E4374--;
			unknownC0122A(cast(short)(unknown7E4374 - 1), x02);
		}
	}
	while (unknown7E4376 - x02 != 0) {
		if (unknown7E4376 - x02 < 0) {
			unknown7E4376++;
			unknownC01181(x0E, cast(short)(unknown7E4376 + 0x1C));
		} else {
			unknown7E4376--;
			unknownC01181(x0E, cast(short)(unknown7E4376 - 1));
		}
	}
	unknown7E4386 = x;
	unknown7E4388 = y;
}

/// $C018F3
void reloadMap() {
	unknown7E4370 = -1;
	unknown7E436E = -1;
	unknown7E4380 &= 0xFFF8;
	unknown7E4382 &= 0xFFF8;
	prepareForImmediateDMA();
	unknown7E5DD4 = -1;
	unknownC068F4(gameState.leaderX.integer, gameState.leaderY.integer);
	unknownC08D79(9);
	setBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0);
	setBG2VRAMLocation(BGTileMapSize.horizontal, 0x5800, 0x2000);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	setOAMSize(0x62);
	reloadMapAtPosition(gameState.leaderX.integer, gameState.leaderY.integer);
	if (gameState.walkingStyle == WalkingStyle.bicycle) {
		changeMusic(Music.bicycle);
	} else {
		unknownC069AF();
	}
	mirrorTM = 0x17;
	if (debugging != 0) {
		unknownEFD9F3();
	}
	setForceBlank();
}

/// $C019B2
void initializeMap(short x, short y, short direction) {
	unknownC068F4(x, y);
	loadMapAtPosition(x, y);
	unknownC03FA9(x, y, direction);
	unknownC069AF();
}

/// $C019E2
void unknownC019E2() {
	for (short i = 0; i < 16; i++) {
		unknown7E43C0[i] = -1;
		unknown7E43B0[i] = -1;
		unknown7E43A0[i] = -1;
		unknown7E4390[i] = -1;
	}
	short x04 = (bg1XPosition - 0x80) /8;
	short x10 = (bg1YPosition - 0x80) /8;
	for (short i = 0; i < 60; i++) {
		unknownC00AC5(x04, cast(short)(x10 + i));
	}
	for (short i = 0; i < 60; i++) {
		loadCollisionRow(x04, cast(short)(x10 + i));
	}
}

/// $C01A63
void unknownC01A63(short x, short y) {
	unknownC00E16(x, y);
}

/// $C01A69
void initializeMiscObjectData() {
	for (short i = 0; i < 0x1E; i++) {
		entityUnknown2B32[i] = 0;
		entityCollidedObjects[i] = 0xFFFF;
		entityTPTEntries[i] = 0xFFFF;
	}
}

/// $C01A86
void unknownC01A86() {
	ubyte* tmpPtr = cast(ubyte*)&spriteTable7E467E[0];
	for (short i = 0; i < spriteTable7E467E.sizeof; i++) {
		tmpPtr[i] = 0xFF;
	}
}

/// $C01A9D
short findFree7E4682(ushort arg1) {
	arg1 /= 5; //convert offset to index
	short x10 = 0;
	unknown7E4A6A = cast(short)(arg1 * 5);
	Unknown1:
	while (x10 < spriteTable7E467E.length) {
		if (spriteTable7E467E[x10].unknown4 == 0xFF) {
			goto Found;
		}
		x10++;
	}
	return -255;
	Found:
	if ((x10 + arg1) < spriteTable7E467E.length) {
		for (short i = x10; i < x10 + arg1; i++) {
			if (spriteTable7E467E[i].unknown4 == 0xFF) {
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
void unknownC01B15(const(SpriteMap)* arg1) {
	if (arg1 < &spriteTable7E467E[0]) {
		return;
	}
	//??????????
	if (cast(const(ubyte)*)arg1 > cast(ubyte*)&spriteTable7E467E.ptr[179] + 1) {
		return;
	}
	short x10 = cast(short)(arg1 - &spriteTable7E467E[0]);
	short i = 0;
	while(i < 2) {
		ubyte y = spriteTable7E467E[x10].unknown4;
		spriteTable7E467E[x10].unknown0 = 0xFF;
		spriteTable7E467E[x10].unknown10 = 0xFF;
		spriteTable7E467E[x10].flags = 0xFF;
		spriteTable7E467E[x10].unknown3 = 0xFF;
		spriteTable7E467E[x10].unknown4 = 0xFF;
		x10 += 1;
		if ((y & 0x80) != 0) {
			i++;
		}
	}
}

/// $C01B96
// no idea what's going on here
short unknownC01B96(short arg1, short arg2) {
	short x;
	outer: for (short i = 0; i <= 0x58 - arg1; i = cast(short)(x + 1)) {
		for (short j = 0; j < arg1; j++) {
			x = cast(short)(i + j);
			if (unknown7E4A00[i + j] != 0) {
				continue outer;
			}
		}
		for (short j = 0; j < arg1; j++) {
			x = cast(short)(i + j);
			unknown7E4A00[i + j] = cast(ubyte)arg2 | 0x80;
		}
		return i;
	}
	return -253;
}

/// $C01C11
void allocSpriteMem(short arg1, ubyte arg2) {
	for (short i = 0; i < 0x58; i++) {
		if (((unknown7E4A00[i] & 0xFF) == ((arg1 & 0xFF) | 0x80)) || (arg1 == short.min)) {
			unknown7E4A00[i] = arg2;
		}
	}
}

/// $C01C52
short unknownC01C52(short arg1, short arg2, short arg3) {
	short local4 = cast(short)((((arg1 + 1) & 0xFFFE) * ((arg2 + 1) & 0xFFFE)) / 4);
	short local3 = unknownC01B96(local4, arg3);
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
			copyToVRAM(3, cast(ushort)(local6 * 64), cast(ushort)(unknownC42F8C[i] + 0x4000), &unknownC40BE8[0]);
			copyToVRAM(3, cast(ushort)(local6 * 64), cast(ushort)(unknownC42F8C[i] + 0x4100), &unknownC40BE8[0]);
		}
	}
	return local3;
}

/// $C01D38
void unknownC01D38(short arg1, short arg2, short arg3, const(UnknownC42B0DEntry)* arg4) {
	// why???
	SpriteMap* x10 = &spriteTable7E467E.ptr[arg1];
	const(SpriteMap)* x06 = &arg4.unknown2[0][0];
	for (short i = 0; i < 2; i++) {
		for (short j = 0; j < arg4.unknown0; j++) {
			x10.unknown0 = x06.unknown0;
			x10.unknown10 = cast(ubyte)unknownC4303C[arg2 + j];
			x10.flags = cast(ubyte)((x06.flags & 0xFE) | ((unknownC4303C[arg2 + j] >> 8) & 0xFF) | arg3);
			x10.unknown3 = x06.unknown3;
			x10.unknown4 = x06.unknown4;
			x10++;
			x06++;
		}
	}
}

/// $C01DED
short unknownC01DED(short arg1) {
	unknown7E467A = spriteGroupingPointers[arg1].width / 16;
	unknown7E467C = spriteGroupingPointers[arg1].height;
	return spriteGroupingPointers[arg1].unknown2;
}

/// $C01E49
short createEntity(short sprite, short actionScript, short index, short x, short y) {
	tracef("Creating new '%s' entity with script '%s', at %s,%s, index %s", cast(OverworldSprite)sprite, cast(ActionScript)actionScript, x, y, index);
	short result;
	if (debugging != 0) {
		if (sprite == -1) {
			return 0;
		}
	}
	short x02 = unknownC01DED(sprite);
	short x21 = unknownC01C52(unknown7E467A, unknown7E467C, index);
	while (x21 < 0) {}
	short x1F = findFree7E4682(unknownC42B0D[x02].unknown0 * 10);
	while (x1F < 0) {}
	newEntityPriority = 1;
	unknownC01D38(x1F, x21, spriteGroupingPointers[sprite].unknown3, &unknownC42B0D[x02]);
	if (index != -1) {
		entityAllocationMinSlot = index;
		entityAllocationMaxSlot = cast(short)(index + 1);
		result = initEntity(actionScript, x, y);
	} else {
		entityAllocationMinSlot = 0;
		entityAllocationMaxSlot = 0x16;
		result = initEntity(actionScript, x, y);
		allocSpriteMem(-1, cast(ubyte)(result | 0x80));
	}
	entitySpriteMapPointers[result] = &spriteTable7E467E[x1F];
	entityUnknown2916[result] = unknownC42B0D[x02].unknown0 * 5;
	entityUnknown2952[result] = x21;
	entityVramAddresses[result] = cast(ushort)(unknownC42F8C[x21] + 0x4000);
	entityByteWidths[result] = spriteGroupingPointers[sprite].width * 2;
	entityTileHeights[result] = spriteGroupingPointers[sprite].height;
	//UNKNOWN_30X2_TABLE_31[result] = spriteGroupingPointers[sprite].spriteBank;
	entityTPTEntrySprites[result] = sprite;
	//EntityGraphicsPointerHigh[result] = &spriteGroupingPointers[sprite];
	//EntityGraphicsPointerLow[result] = &spriteGroupingPointers[sprite];
	entityGraphicsPointers[result] = &spriteGroupingPointers[sprite].sprites[0];
	if ((unknown7E467C & 1) != 0) {
		entityVramAddresses[result] += 0x100;
	}
	entitySizes[result] = spriteGroupingPointers[sprite].unknown2;
	entityUnknown3366[result] = spriteGroupingPointers[sprite].unknown4;
	entityUnknown33A2[result] = spriteGroupingPointers[sprite].unknown5;
	entityUnknown33DE[result] = spriteGroupingPointers[sprite].unknown6;
	entityUnknown1A4A[result] = spriteGroupingPointers[sprite].unknown7;
	entityUnknown332A[result] = unknownC42AEB[spriteGroupingPointers[sprite].unknown2];
	entityUnknown2BE6[result] = cast(ushort)((unknownC42B0D[x02].unknown1 <<8) | (unknownC42B0D[x02].unknown0 - unknownC42B0D[x02].unknown1));
	entityUnknown2D4E[result] = 0xFFFF;
	entityEnemyIDs[result] = -1;
	entityTPTEntries[result] = 0xFFFF;
	entityCollidedObjects[result] = 0xFFFF;
	entitySurfaceFlags[result] = 0;
	entityUnknown2DC6[result] = 0;
	entityUnknown2D8A[result] = 0;
	entityUnknown2C5E[result] = 0;
	entityUnknown2B32[result] = 0;
	entityDirections[result] = 0;
	entityObstacleFlags[result] = 0;
	return result;
}

/// $C020F1
void unknownC020F1() {
	unknownC01B15(entitySpriteMapPointers[currentEntitySlot]);
	allocSpriteMem(currentEntitySlot, 0);
	if ((entityTPTEntries[currentEntitySlot] & 0xF000) == 0x8000) {
		overworldEnemyCount--;
	}
	if (entityEnemyIDs[currentEntitySlot] == EnemyID.magicButterfly) {
		magicButterfly = 0;
	}
	entityTPTEntrySprites[currentEntitySlot] = -1;
	entityTPTEntries[currentEntitySlot] = 0xFFFF;
}

/// $C02140
void unknownC02140(short arg1) {
	unknownC01B15(entitySpriteMapPointers[arg1]);
	allocSpriteMem(arg1, 0);
	if ((entityTPTEntries[arg1] & 0xF000) == 0x8000) {
		overworldEnemyCount--;
	}
	if (entityEnemyIDs[arg1] == EnemyID.magicButterfly) {
		magicButterfly = 0;
	}
	entityTPTEntrySprites[arg1] = -1;
	entityTPTEntries[arg1] = 0xFFFF;
	unknownC09C35(arg1);
}

/// $C02194
void unknownC02194() {
	magicButterfly = 0;
	unknown7E4A68 = 0;
	overworldEnemyCount = 0;
	for (short i = 0; i < maxEntities; i++) {
		if ((entityScriptTable[i] + 1) > 6) {
			unknownC02140(i);
		}
	}
	for (short i = 0; i < maxEntities; i++) {
		entityCollidedObjects[i] = 0xFFFF;
	}
}

/// $C021E6
void unknownC021E6() {
	magicButterfly = 0;
	unknown7E4A68 = 0;
	overworldEnemyCount = 0;
	for (short i = 0; i < maxEntities; i++) {
		if (entityScriptTable[i] + 1 <= 2) {
			continue;
		}
		if (i == 23) {
			continue;
		}
		unknownC02140(i);
	}
	unknownC09C35(23);
}

/// $C0222B
void unknownC0222B(short x, short y) {
	if (x >= 0x20) {
		return;
	}
	if (y >= 0x28) {
		return;
	}
	if (spritePlacementPointerTable[y][x] != null) {
		short x24 = spritePlacementPointerTable[y][x].entries;
		const(SpritePlacement)* x0A = &spritePlacementPointerTable[y][x].spritePlacements[0];
		for (short i = 0; i < x24; i++) {
			short x20 = x0A.unknown0;
			short x1E = x0A.unknown3;
			short x1C = x0A.unknown2;
			x0A++;
			if ((globalMapTilesetPaletteData[((x1C / 8) + (y * 32)) / 16][((x1E / 8) + (x * 32)) / 32] / 8 == unknown7E436E) && (unknownC0A21C(x20) == 0)) {
				short x18 = cast(short)((x << 8) + x1E);
				short x16 = cast(short)((y << 8) + x1C);
				short x1A = cast(short)(x18 - bg1XPosition);
				short xreg = cast(short)(x16 - bg1YPosition);
				if (debugging != 0) {
					if ((((padState[0] & (Pad.l | Pad.r)) != 0) || (unknown7E4A58 - 1 != 0)) && ((x1A < 0x100) && (xreg < 0xE0))) {
						continue;
					}
				} else {
					if ((unknown7E4A58 - 1 != 0) && (x1A < 0x100) && (xreg < 0xE0)) {
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
				if (unknown7EB4EF == 0) {
					if ((debugging != 0) && (npcConfig[x20].appearanceStyle != 0) && (unknownEFE6CF() != 0) && ((((npcConfig[x20].appearanceStyle - 2) ^ getEventFlag(npcConfig[x20].eventFlag)) & 1) == 0)) {
						continue;
					} else if ((npcConfig[x20].appearanceStyle != 0) && ((((npcConfig[x20].appearanceStyle - 2) ^ getEventFlag(npcConfig[x20].eventFlag)) & 1) == 0)) {
						continue;
					}
					if (debugging != 0) {
						if ((showNPCFlag == 0) || (npcConfig[x20].type == 3)) {
							x1A = createEntity(npcConfig[x20].sprite, unknownEFE6E2(npcConfig[x20].actionScript), -1, x18, x16);
						}
					} else {
						if ((showNPCFlag == 0) || (npcConfig[x20].type == 3)) {
							x1A = createEntity(npcConfig[x20].sprite, npcConfig[x20].actionScript, -1, x18, x16);
						}
					}
				} else if (npcConfig[x20].appearanceStyle == 0) {
					x1A = createEntity(npcConfig[x20].sprite, ActionScript.unknown799, -1, x18, x16);
				}
				if (x1A != -1) {
					entityDirections[x1A] = npcConfig[x20].direction;
					entityTPTEntries[x1A] = x20;
				}
			}
		}
	}
}

/// $C0255C
void unknownC0255C(short x, short y) {
	short x12 = void;
	short x14 = short.min;
	if (unknown7E4A58 == 0) {
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
		unknownC0222B(x12, x10);
		x14 = x12;
	}
}

/// $C025CF
void unknownC025CF(short x, short y) {
	short x10 = void;
	short x_ = short.min;
	if (unknown7E4A58 == 0) {
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
		unknownC0222B(x0E, x12);
		x_ = x12;
	}
}

/// $C0263D
short unknownC0263D(short x, short y) {
	version(bugfix) {
		if ((x < 0) || (y < 0)) {
			return 0;
		}
	}
	if ((x >= 128) || (y >= 160)) {
		return 0;
	}
	return mapEnemyPlacement[y][x];
}

/// $C02668
void unknownC02668(short arg1, short arg2, short arg3) {
	short x2A;
	const(BattleGroupEnemy)* x0A;
	if ((debugging != 0) && (unknownEFE759() != 0) && (rand() < 16)) {
		x2A = 0;
		x0A = &battleEntryPointerTable[0].enemies[0];
	} else if ((++unknown7E4A7A & 0xF) == 0) {
		short x28 = void;
		switch (mapDataPerSectorAttributesTable[(arg2 * 8) / 16][(arg1 * 8) / 32] & 7) {
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
		unknown7E4A72 = 481;
		x0A = &battleEntryPointerTable[481].enemies[0];
	} else if (arg3 != 0) {
		if (globalMapTilesetPaletteData[(arg2 * 8) / 16][(arg1 * 8) / 32] / 8 == unknown7E436E) {
			unknown7E4A6C = arg3;
			short x26 = enemyPlacementGroupsPointerTable[arg3].eventFlag;
			const(EnemyPlacementGroup)* x22 = enemyPlacementGroupsPointerTable[arg3].groups.ptr;
			unknown7E4A70 = enemyPlacementGroupsPointerTable[arg3].unknown2;
			short x1C = 0;
			if ((x26 != 0) && (getEventFlag(x26) != 0)) {
				unknown7E4A70 = enemyPlacementGroupsPointerTable[arg3].unknown3;
				if (enemyPlacementGroupsPointerTable[arg3].unknown2 != 0) {
					x1C = 8;
				}
			}
			if ((piracyFlag == 0) && (((rand() * 100) >> 8) >= unknown7E4A70)) {
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
			unknown7E4A72 = x2A;
			x0A = &battleEntryPointerTable[x2A].enemies[0];
			for (short i = 0; i != 23; i++) {
				if (entityScriptTable[i] == -1) {
					continue;
				}
				if (x2A + 0x8000 != entityTPTEntries[i]) {
					continue;
				}
				if (x1C == entityUnknown2D4E[i]) {
					return;
				}
			}
		}
	}
	version(bugfix) {
		if (x0A is null) {
			return;
		}
	}
	assert(x0A);
	while ((unknown7E4A6E = x0A[0].count) != 0) {
		unknown7E4A76 = enemyConfigurationTable[x0A[0].enemyID].name[0];
		short x26 = enemyConfigurationTable[x0A[0].enemyID].overworldSprite;
		unknown7E4A74 = x26;
		short x16 = enemyConfigurationTable[x0A[0].enemyID].eventScript;
		if (x16 == 0) {
			x16 = ActionScript.unknown019;
		}
		while (unknown7E4A6E-- != 0) {
			if (x0A[0].enemyID == EnemyID.magicButterfly) {
				if (magicButterfly != 0) {
					continue;
				}
			}
			if (overworldEnemyCount == unknown7E4A5E) {
				unknown7E4A68++;
				continue;
			}
			unknown7E4A68 = 0;
			short x14 = createEntity(x26, x16, -1, 0, 0);
			short x04;
			short x02;
			for (short i = 0; i != 20; i++) {
				x04 = cast(short)((rand() % unknown7E4A62) * 8 + arg1 * 8);
				x02 = cast(short)((rand() % unknown7E4A64) * 8 + arg2 * 8);
				short x12 = unknownC05F33(x04, x02, x14);
				if ((x12 & 0xD0) != 0) {
					continue;
				}
				if (unknownC05DE7(x12, x14, x0A[0].enemyID) == 0) {
					goto Unknown28;
				}
			}
			unknownC02140(x14);
			continue;
			Unknown28:
			entityAbsXTable[x14] = x04;
			entityAbsYTable[x14] = x02;
			entityTPTEntries[x14] = x2A + 0x8000;
			entityEnemyIDs[x14] = x0A[0].enemyID;
			entityUnknown2D4E[x14] = cast(short)(arg2 * 128 + arg1);
			entityUnknown2C5E[x14] = 0;
			entityUnknown3186[x14] = rand();
			overworldEnemyCount++;
			if (x0A[0].enemyID == EnemyID.magicButterfly) {
				magicButterfly = 1;
			}
		}
		x0A++;
	}
}

/// $C02A6B
void spawnHorizontal(short x, short y) {
	if (getEventFlag(EventFlag.unknown00B) != 0) {
		return;
	}
	if (getEventFlag(EventFlag.usePostgameMusic) != 0) {
		return;
	}
	if (unknown7E4A5A == 0) {
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
		unknown7E4A62 = 8;
		unknown7E4A64 = 8;
		short x02 = 1;
		Unknown9:
		short x16 = unknownC0263D(i, x12);
		short tmp = unknownC0263D(cast(short)(i + 1), x12);
		if ((x16 != 0) && (tmp == x16)) {
			unknown7E4A62 += 8;
			i++;
			if (++x02 != 6) {
				goto Unknown9;
			}
		}
		while (x02-- != 0) {
			unknownC02668(x10, x12, x16);
		}
	}
}

/// $C02B55
void spawnVertical(short x, short y) {
	if (getEventFlag(EventFlag.unknown00B) != 0) {
		return;
	}
	if (getEventFlag(EventFlag.usePostgameMusic) != 0) {
		return;
	}
	if (unknown7E4A5A == 0) {
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
		unknown7E4A62 = 8;
		unknown7E4A64 = 8;
		short x02 = 1;
		Unknown9:
		short x18 = unknownC0263D(x14, i);
		short tmp = unknownC0263D(x14, cast(short)(i + 1));
		if ((x18 != 0) && (tmp == x18)) {
			unknown7E4A64 += 8;
			i++;
			if (++x02 != 6) {
				goto Unknown9;
			}
		}
		while (x02-- != 0) {
			unknownC02668(x14, x10, x18);
		}
	}
}

/// $C02C3E
void unknownC02C3E() {
	if (partyCharacters[gameState.playerControlledPartyMembers[0]].afflictions[1] == Status1.mushroomized) {
		mushroomizedWalkingFlag = 1;
		if (mushroomizationTimer == 0) {
			mushroomizationTimer = 1800;
			mushroomizationModifier = 0;
		}
		if (gameState.walkingStyle == WalkingStyle.bicycle) {
			unknownC03CFD();
		}
	} else {
		mushroomizedWalkingFlag = 0;
	}
}

/// $C02C89
void mushroomizationMovementSwap() {
	if (mushroomizationTimer == 0) {
		mushroomizationTimer = 30 * 60;
		mushroomizationModifier = (mushroomizationModifier + 1) & 3;
	}
	mushroomizationTimer--;
	if (mushroomizationModifier == 0) {
		return;
	}
	if (unknown7E0081 != 0) {
		return;
	}
	padPress[0] = (padPress[0] & 0xF0FF) | mushroomizationDirectionRemapTables[mushroomizationModifier - 1][(padPress[0] >> 8) & 0xF];
	padState[0] = (padState[0] & 0xF0FF) | mushroomizationDirectionRemapTables[mushroomizationModifier - 1][(padState[0] >> 8) & 0xF];
}

/// $C02D29
void unknownC02D29() {
	entitySizes[23] = 1;
	unknown7E9F6B = -1;
	gameState.unknown88 = 0;
	gameState.unknownB0 = 0;
	gameState.unknownB2 = 0;
	gameState.unknownB4 = 0;
	gameState.partyStatus = 0;
	gameState.currentPartyMembers = 0x18;
	for (short i = 0; i < 6; i++) {
		gameState.unknown96[i] = 0;
		unknown7E5D8C[i] = 0;
	}
	gameState.playerControlledPartyMemberCount = 0;
	gameState.partyCount = 0;
	velocityStore();
	pajamaFlag = getEventFlag(nessPajamaFlag);
}

/// $C02D8F
uint adjustPositionHorizontal(short arg1, uint arg2, short arg3) {
	switch (arg3 & SurfaceFlags.deepWater) {
		case SurfaceFlags.shallowWater:
			return (((horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * ShallowWaterSpeed.combined) / 256) + arg2;
		case SurfaceFlags.deepWater:
			return (((horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * DeepWaterSpeed.combined) / 256) + arg2;
		default:
			if (unknown7E0081 != 0) {
				return horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined + arg2;
			} else if ((gameState.partyStatus == 3) && (gameState.walkingStyle == 0)) {
				return (((horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * SkipSandwichSpeed.combined) / 256) + arg2;
			}
			return horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined + arg2;
	}
}

/// $C03017
uint adjustPositionVertical(short arg1, uint arg2, short arg3) {
	switch (arg3 & SurfaceFlags.deepWater) {
		case SurfaceFlags.shallowWater:
			return (((verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * ShallowWaterSpeed.combined) / 256) + arg2;
		case SurfaceFlags.deepWater:
			return (((verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * DeepWaterSpeed.combined) / 256) + arg2;
		default:
			if (unknown7E0081 != 0) {
				return verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined + arg2;
			} else if ((gameState.partyStatus == 3) && (gameState.walkingStyle == 0)) {
				return (((verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined / 256) * SkipSandwichSpeed.combined) / 256) + arg2;
			}
			return verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[arg1].combined + arg2;
	}
}

/// $C032EC
void unknownC032EC() {
	short y;
	for (y = 0; (gameState.partyMembers[y] != 0) && (5 > gameState.partyMembers[y]); y++) {}
	gameState.playerControlledPartyMemberCount = cast(ubyte)y;
	if (gameState.partyNPCs[0] != gameState.partyMembers[y]) {
		if (gameState.partyNPCs[1] == gameState.partyMembers[y]) {
			gameState.partyNPCs[0] = gameState.partyNPCs[1];
			gameState.partyNPCHP[0] = gameState.partyNPCHP[1];
			gameState.partyNPCs[1] = gameState.partyMembers[y + 1];
			gameState.partyNPCHP[1] = enemyConfigurationTable[npcAITable[gameState.partyMembers[y + 1]].enemyID].hp;
		} else if (gameState.partyNPCs[0] == gameState.partyMembers[y + 1]) {
			gameState.partyNPCs[1] = gameState.partyNPCs[0];
			gameState.partyNPCHP[1] = gameState.partyNPCHP[0];
			gameState.partyNPCs[0] = gameState.partyMembers[y];
			gameState.partyNPCHP[0] = enemyConfigurationTable[npcAITable[gameState.partyMembers[y]].enemyID].hp;
		} else {
			gameState.partyNPCs[0] = gameState.partyMembers[y];
			gameState.partyNPCHP[0] = enemyConfigurationTable[npcAITable[gameState.partyMembers[y]].enemyID].hp;
			if (gameState.partyNPCs[1] != gameState.partyMembers[y + 1]) {
				gameState.partyNPCs[1] = gameState.partyMembers[y + 1];
				gameState.partyNPCHP[1] = enemyConfigurationTable[npcAITable[gameState.partyMembers[y + 1]].enemyID].hp;
			}
		}
	} else if (gameState.partyNPCs[1] != gameState.partyMembers[y + 1]) {
		gameState.partyNPCs[1] = gameState.partyMembers[y + 1];
		gameState.partyNPCHP[1] = enemyConfigurationTable[npcAITable[gameState.partyMembers[y + 1]].enemyID].hp;
	}
}

/// $C034D6
void updateParty() {
	short[6] local1;
	short[6] local2;
	short[6] local3;
	short[6] local4;
	short partyCount = gameState.partyCount;
	for (short i = 0; i < partyCount; i++) {
		local1[i] = partyCharacters[gameState.playerControlledPartyMembers[i]].positionIndex;
	}
	for (short i = 0; i < partyCount; i++) {
		short local9 = gameState.unknown96[i];
		if (local9 >= 5) {
			local9 += 0x300;
		} else {
			short x = partyCharacters[entityScriptVar1Table[gameState.unknownA2[i]]].afflictions[0];
			if ((x == Status0.unconscious) || (x == Status0.diamondized)) {
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
		partyCharacters[i].positionIndex = local1[i];
		entityScriptVar5Table[i] = gameState.unknownA2[i];
	}
	gameState.currentPartyMembers = gameState.unknownA2[0];
	unknownC032EC();
	unknownC02C3E();
	unknownC47F87();
}

/// $C0369B
short unknownC0369B(short id) {
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
			if (partyCharacters[entityScriptVar1Table[x18]].afflictions[0] == 1) {
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
	newEntityVar0 = cast(short)(id - 1);
	short x1A_2 = characterInitialEntityData[id - 1].unknown6;
	if (entityScriptTable[x1A_2] != -1) {
		x1A_2++;
	}
	gameState.unknownA2[x18] = cast(ubyte)x1A_2;
	newEntityVar1 = cast(short)(x1A_2 - 0x18);
	gameState.playerControlledPartyMembers[x18] = cast(ubyte)newEntityVar1;
	if (gameState.partyCount == 1) {
		partyCharacters[newEntityVar1].positionIndex = gameState.unknown88;
	} else {
		short x16 = (x18 == 0) ? gameState.unknown88 : partyCharacters[entityScriptVar1Table[gameState.unknownA2[x18 - 1]]].positionIndex;
		partyCharacters[newEntityVar1].positionIndex = x16;
	}
	short x = (partyCharacters[newEntityVar1].positionIndex != 0) ? cast(short)(partyCharacters[newEntityVar1].positionIndex - 1) : 0xFF;
	short x18_2 = (gameState.unknown92 != 3) ? characterInitialEntityData[id - 1].overworldSprite : characterInitialEntityData[id - 1].lostUnderworldSprite;
	createEntity(x18_2, characterInitialEntityData[id - 1].actionScript, x1A_2, playerPositionBuffer[x].xCoord, playerPositionBuffer[x].yCoord);
	entityScreenXTable[x1A_2] = cast(short)(playerPositionBuffer[x].xCoord - bg1XPosition);
	entityScreenYTable[x1A_2] = cast(short)(playerPositionBuffer[x].yCoord - bg1YPosition);
	gameState.currentPartyMembers = characterInitialEntityData[gameState.unknown96[0] - 1].unknown6;
	unknownC09CD7();
	unknownC032EC();
	gameState.currentPartyMembers = gameState.unknownA2[0];
	updateParty();
	entityPreparedXCoordinate = playerPositionBuffer[x].xCoord;
	entityPreparedYCoordinate = playerPositionBuffer[x].yCoord;
	entityPreparedDirection = entityDirections[x1A_2];
	return x1A_2;
}

/// $C03903
void unknownC03903(short id) {
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
		partyCharacters[gameState.playerControlledPartyMembers[0]].positionIndex = entityScriptVar1Table[gameState.unknownA2[i]];
	}
	gameState.unknown96[j] = 0;
	gameState.partyCount--;
	entityAbsXTable[gameState.unknownA2[i]] = entityPreparedXCoordinate;
	entityAbsYTable[gameState.unknownA2[i]] = entityPreparedYCoordinate;
	entityDirections[gameState.unknownA2[i]] = entityPreparedDirection;
	unknownC02140(gameState.unknownA2[i]);
	unknownC032EC();
	updateParty();
}

/// $C039E5
void unknownC039E5() {
	for (short i = 0; i < 6; i++) {
		if (gameState.unknown96[i] == 0) {
			continue;
		}
		entityAbsXTable[gameState.unknownA2[i]] = gameState.leaderX.integer;
		entityAbsYTable[gameState.unknownA2[i]] = gameState.leaderY.integer;
		unknownC0A254(gameState.unknownA2[i]);
	}
}

/// $C03A24
void unknownC03A24() {
	gameState.playerControlledPartyMemberCount = 0;
	gameState.partyCount = 0;
	for (short i = 0; i < 6; i++) {
		gameState.unknown96[i] = 0;
		gameState.playerControlledPartyMembers[i] = 0;
		gameState.unknownA2[i] = 0;
	}
	unknown7E5D7E = 1;
	for (short i = 0; i < 6; i++) {
		if (gameState.partyMembers[i] == 0) {
			break;
		}
		unknownC0369B(gameState.partyMembers[i]);
	}
	unknown7E5D7E = 0;
	footstepSoundID = gameState.unknown92;
	footstepSoundIDOverride = 0;
}

/// $C03A94
void unknownC03A94(short arg1) {
	//x1E = arg1
	short x1C;
	short x;
	if ((unknown7E438A | unknown7E438C) != 0) {
		x1C = cast(short)(unknown7E438A * 8);
		x = cast(short)(unknown7E438C * 8);
	} else {
		x1C = gameState.leaderX.integer;
		x = gameState.leaderY.integer;
	}
	short x1A = loadSectorAttributes(x1C, x) & 7;
	gameState.unknown92 = x1A;
	footstepSoundID = cast(short)(x1A * 2);
	footstepSoundIDOverride = 0;
	if (x1A != 3) {
		gameState.walkingStyle = 0;
	} else {
		gameState.walkingStyle = WalkingStyle.slowest;
	}
	short x18 = currentEntitySlot;
	currentEntitySlot = -1;
	for (short i = 0; i < 6; i++) {
		if (gameState.unknown96[i] == 0) {
			continue;
		}
		newEntityVar0 = entityScriptVar0Table[gameState.unknownA2[i]];
		newEntityVar1 = entityScriptVar1Table[gameState.unknownA2[i]];
		newEntityVar5 = cast(short)(i * 2);
		short x14 = entitySpriteMapFlags[gameState.unknownA2[i]];
		short x1A_2 = entityTickCallbackFlags[gameState.unknownA2[i]];
		unknownC02140(gameState.unknownA2[i]);
		unknown7E9F73 = gameState.unknownA2[i];
		short x12;
		if (gameState.unknown92 != 3) {
			x12 = createEntity(unknownC0780F(gameState.unknown96[i] - 1, 0, &partyCharacters[i]), characterInitialEntityData[gameState.unknown96[i] - 1].actionScript, gameState.unknown96[i] - 1, gameState.leaderX.integer, gameState.leaderY.integer);
		} else {
			x12 = createEntity(unknownC0780F(gameState.unknown96[i] - 1, 10, &partyCharacters[i]), characterInitialEntityData[gameState.unknown96[i] - 1].actionScript, gameState.unknown96[i] - 1, gameState.leaderX.integer, gameState.leaderY.integer);
		}
		entitySpriteMapFlags[gameState.unknownA2[i]] = x14;
		entityTickCallbackFlags[gameState.unknownA2[i]] = x1A_2;
		entityDirections[gameState.unknownA2[i]] = arg1;
		entityAnimationFrames[gameState.unknownA2[i]] = 0;
		unknownC0A780(x12);
	}
	currentEntitySlot = x18;
	unknownC039E5();
	unknown7E5DA8 = 0xFFFF;
	short x02 = unknown7E5D9A;
	unknown7E5D9A = 0;
	unknownC05B7B(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers, Direction.down);
	unknown7E5D9A = x02;
	if (unknown7E5DA8 != -1) {
		unknownC07526(unknown7E5DA8, unknown7E5DAA);
	}
}

/// $C03C25
void unknownC03C25() {
	unknown7E5DDA = 1;
	unknownC068F4(gameState.leaderX.integer, gameState.leaderY.integer);
	if (unknown7E5DD6 != unknown7E5DD4) {
		waitUntilNextFrame();
		unknownC069AF();
	}
	unknown7E5DDA = 0;
}

/// $C03C4B
short unknownC03C4B() {
	return unknownC05D8B(gameState.leaderX.integer, gameState.leaderY.integer, 0xC) & 0xC0;
}

/// $C03C5E
void getOnBicycle() {
	if (gameState.partyCount != 1) {
		return;
	}
	if (gameState.unknown96[0] != 1) {
		return;
	}
	if (unknown7E5DD8 == 0) {
		changeMusic(Music.bicycle);
	}
	unknownC02140(0x18);
	gameState.unknown92 = 6;
	gameState.walkingStyle = WalkingStyle.bicycle;
	partyCharacters[0].positionIndex = 0;
	gameState.unknown88 = 0;
	newEntityVar0 = 0;
	newEntityVar1 = 0;
	createEntity(OverworldSprite.nessBicycle, ActionScript.unknown002, 0x18, entityAbsXTable[24], entityAbsYTable[24]);
	entityTickCallbackFlags[24] |= 0x8000;
	entityScriptVar7Table[24] |= 0x3000;
	entityAnimationFrames[24] = 0;
	entityDirections[24] = gameState.leaderDirection;
	setBoundaryBehaviour(0);
	gameState.unknown90 = 1;
	unknown7E5DBA = 1;
	inputDisableFrameCounter = 2;
}

/// $C03CFD
void unknownC03CFD() {
	if (gameState.walkingStyle != WalkingStyle.bicycle) {
		return;
	}
	setBoundaryBehaviour(1);
	if ((battleDebug == 0) && (unknown7E5D9A == 0)) {
		unknownC06A07();
	}
	unknownC02140(0x18);
	gameState.unknown92 = 0;
	gameState.walkingStyle = 0;
	partyCharacters[0].positionIndex = 0;
	gameState.unknown88 = 0;
	if (unknown7E5D9A == 0) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
	newEntityVar0 = 0;
	newEntityVar1 = 0;
	createEntity(OverworldSprite.ness, ActionScript.unknown002, 0x18, entityAbsXTable[24], entityAbsYTable[24]);
	entityAnimationFrames[24] = 0;
	entityDirections[24] = gameState.leaderDirection;
	entityScriptVar7Table[24] |= 0x9000;
	if (unknown7E5D9A != 0) {
		entityTickCallbackFlags[24] |= 0xC000;
	}
	waitUntilNextFrame();
	waitUntilNextFrame();
	unknownC0A780(0x18);
	unknown7E5DBA = 0;
	inputDisableFrameCounter = 2;
}

/// $C03E5A
short unknownC03E5A(short arg1) {
	short x;
	for (x = 0; gameState.unknown96[x] != arg1 + 1; x++) {}
	if (x == 0) {
		return -1;
	}
	return chosenFourPtrs[entityScriptVar1Table[gameState.unknownA2[x - 1]]].positionIndex;
}

/// $C03E9D
short unknownC03E9D(short arg1) {
	short x0E = unknownC03E5A(arg1);
	if (x0E < unknown7E4DC6.positionIndex) {
		x0E += 0x100;
	}
	return cast(short)(x0E - unknown7E4DC6.positionIndex);
}

/// $C03EC3
short unknownC03EC3(short arg1, short arg2, short arg3, short arg4) {
	short tmp = unknownC03E9D(arg1);
	if (tmp == arg2) {
		arg3++;
		entityScriptVar7Table[currentEntitySlot] &= 0xEFFF;
	} else if (tmp > arg2) {
		arg3 += arg3;
		entityScriptVar7Table[currentEntitySlot] |= 0x1000;
	}
	return arg3;
}

/// $C03DAA
void unknownC03DAA() {
	entityUnknown3456[currentEntitySlot] = -1;
	entityScriptVar3Table[currentEntitySlot] = 8;
	entityScriptVar2Table[currentEntitySlot] = rand() & 0xF;
	unknownC0A780(currentEntitySlot);
	partyCharacters[entityScriptVar1Table[currentEntitySlot] + 1].unknown59 = currentEntitySlot;
	partyCharacters[entityScriptVar1Table[currentEntitySlot] + 1].unknown53 = entityScriptVar0Table[currentEntitySlot];
	partyCharacters[entityScriptVar1Table[currentEntitySlot] + 1].unknown57 = 0;
	partyCharacters[entityScriptVar1Table[currentEntitySlot] + 1].unknown92 = -1;
	if (partyCharacters[entityScriptVar1Table[currentEntitySlot] + 1].afflictions[0] == Status0.unconscious) {
		entityScriptVar3Table[currentEntitySlot] = 16;
	}
	unknown7E2898 = cast(short)(gameState.currentPartyMembers * 2);
}

/// $C03F1E
void unknownC03F1E() {
	gameState.unknown88 = 0;
	PlayerPositionBufferEntry* x = &playerPositionBuffer[0];
	short y = 2;
	while (--y != 0) {
		x.xCoord = gameState.leaderX.integer;
		x.yCoord = gameState.leaderY.integer;
		x.direction = gameState.leaderDirection;
		x.walkingStyle = gameState.walkingStyle;
		x.tileFlags = gameState.troddenTileType;
		miscDebugFlags = 0;
		x.unknown10 = 0;
		x += 255;
	}
	for (short i = 0; i < gameState.partyCount; i++) {
		version(bugfix) {
			if (chosenFourPtrs[gameState.playerControlledPartyMembers[i]] is null) {
				continue;
			}
		}
		chosenFourPtrs[gameState.playerControlledPartyMembers[i]].positionIndex = 0;
		chosenFourPtrs[gameState.playerControlledPartyMembers[i]].unknown65 = 0xFFFF;
		chosenFourPtrs[gameState.playerControlledPartyMembers[i]].unknown55 = 0xFFFF;
		entityAbsXTable[gameState.unknownA2[i]] = gameState.leaderX.integer;
		entityAbsYTable[gameState.unknownA2[i]] = gameState.leaderY.integer;
		entityDirections[gameState.unknownA2[i]] = gameState.leaderDirection;
		entitySurfaceFlags[gameState.unknownA2[i]] = gameState.troddenTileType;
	}
}

/// $C03FA9
void unknownC03FA9(short x, short y, short direction) {
	gameState.leaderX.integer = x;
	gameState.leaderY.integer = y;
	gameState.leaderDirection = direction;
	gameState.troddenTileType = unknownC05F33(x, y, gameState.currentPartyMembers);
	unknownC03A94(direction);
	unknownC03F1E();
	for (short i = 0; i < 6; i++) {
		entityUnknown3456[i + 24] = -1;
	}
	unknown7E9F6B = -1;
	unknown7E438C = 0;
	unknown7E438A = 0;
	pajamaFlag = getEventFlag(nessPajamaFlag);
	unknownC07B52();
}

/// $C0400E
void centerScreen(short x, short y) {
	refreshMapAtPosition(cast(short)(x - 0x80), cast(short)(y - 0x70));
}

/// $C0402B
void unknownC0402B(Unknown7E007DEntry* arg1) {
	unknownC083E3(arg1);
}

/// $C0404F
short mapInputToDirection(short style) {
	short result = -1;
	if (unknown7E5D9A != 0) {
		return -1;
	}
	style = allowedInputDirections[style];
	switch (padState[0] & (Pad.up | Pad.down | Pad.left | Pad.right)) {
		case Pad.up:
			if ((style & DirectionMask.up) != 0) {
				result = Direction.up;
			}
			break;
		case (Pad.up | Pad.right):
			if ((style & DirectionMask.upRight) != 0) {
				result = Direction.upRight;
			}
			break;
		case Pad.right:
			if ((style & DirectionMask.right) != 0) {
				result = Direction.right;
			}
			break;
		case (Pad.down | Pad.right):
			if ((style & DirectionMask.downRight) != 0) {
				result = Direction.downRight;
			}
			break;
		case Pad.down:
			if ((style & DirectionMask.down) != 0) {
				result = Direction.down;
			}
			break;
		case (Pad.down | Pad.left):
			if ((style & DirectionMask.downLeft) != 0) {
				result = Direction.downLeft;
			}
			break;
		case Pad.left:
			if ((style & DirectionMask.left) != 0) {
				result = Direction.left;
			}
			break;
		case (Pad.up | Pad.left):
			if ((style & DirectionMask.upLeft) != 0) {
				result = Direction.upLeft;
			}
			break;
		default: break;
	}
	return result;
}

/// $C04116
short unknownC04116(short direction) {
	short x14 = cast(short)(unknownC3E148[direction] + gameState.leaderX.integer);
	short x04 = cast(short)(unknownC3E158[direction] + gameState.leaderY.integer);
	short x12 = unknown7E5D58;
	unknown7E5D58 = 1;
	while (true) {
		short x10 = npcCollisionCheck(x14, x04, gameState.currentPartyMembers);
		if (x10 > 0) {
			currentTPTEntry = entityTPTEntries[x10];
			unknown7E5D64 = x10;
			break;
		}
		if ((unknownC05CD7(x14, x04, gameState.currentPartyMembers, direction) & 0x82) != 0x82) {
			break;
		}
		if (unknownC3E148[direction] != 0) {
			x14 += ((unknownC3E148[direction] & 0x8000) != 0) ? -8 : 8;
		}
		if (unknownC3E158[direction] != 0) {
			x04 += ((unknownC3E158[direction] & 0x8000) != 0) ? -8 : 8;
		}
	}
	unknown7E5D58 = x12;
	if ((currentTPTEntry == -1) || (currentTPTEntry == 0)) {
		unknownC4334A(direction);
	}
	return currentTPTEntry;
}

/// $C041E3
short unknownC041E3() {
	short x10 = cast(short)(gameState.leaderDirection & 0xFFFE);
	short a = unknownC04116(cast(short)(gameState.leaderDirection & 0xFFFE));
	if ((a != -1) && (a != 0)) {
		return cast(short)(gameState.leaderDirection & 0xFFFE);
	}
	gameState.leaderDirection = (((gameState.leaderDirection & 0xFFFE) + 2) & 7);
	a = unknownC04116(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = ((gameState.leaderDirection + 4) & 7);
	a = unknownC04116(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = ((gameState.leaderDirection - 2) & 7);
	a = unknownC04116(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = x10;
	return -1;
}

/// $C042C2
void unknownC042C2(short arg1) {
	entityDirections[arg1] = unknownC3E168[gameState.leaderDirection];
	unknownC09907(arg1);
	unknownC0A443Entry2(arg1);
}

/// $C04279
ushort findNearbyCheckableTPTEntry() {
	currentTPTEntry = -1;
	unknown7E5D64 = -1;
	short x10 = unknownC041E3();
	if ((x10 != -1) && (entityDirections[gameState.currentPartyMembers] != x10)) {
		gameState.leaderDirection = x10;
		entityDirections[gameState.currentPartyMembers] = x10;
		unknownC0A780(gameState.currentPartyMembers);
	}
	return currentTPTEntry;
}

/// $C042EF
short unknownC042EF(short direction) {
	short x14 = cast(short)(unknownC3E148[direction] + gameState.leaderX.integer);
	short x04 = cast(short)(unknownC3E158[direction] + gameState.leaderY.integer);
	short x12 = unknown7E5D58;
	unknown7E5D58 = 1;
	while (true) {
		short x10 = npcCollisionCheck(x14, x04, gameState.currentPartyMembers);
		if (x10 > 0) {
			currentTPTEntry = entityTPTEntries[x10];
			unknown7E5D64 = x10;
			break;
		}
		if ((unknownC05CD7(x14, x04, gameState.currentPartyMembers, direction) & 0x82) != 0x82) {
			break;
		}
		if (unknownC3E148[direction] != 0) {
			x14 += ((unknownC3E148[direction] & 0x8000) != 0) ? -8 : 8;
		}
		if (unknownC3E158[direction] != 0) {
			x04 += ((unknownC3E158[direction] & 0x8000) != 0) ? -8 : 8;
		}
	}
	unknown7E5D58 = x12;
	if ((currentTPTEntry == 0) || (currentTPTEntry == -1)) {
		unknownC065C2(direction);
	}
	return currentTPTEntry;
}

/// $C043BC
short unknownC043BC() {
	short x10 = cast(short)(gameState.leaderDirection & 0xFFFE);
	short a = unknownC042EF(cast(short)(gameState.leaderDirection & 0xFFFE));
	if ((a != -1) && (a != 0)) {
		return cast(short)(gameState.leaderDirection & 0xFFFE);
	}
	gameState.leaderDirection = (((gameState.leaderDirection & 0xFFFE) + 2) & 7);
	a = unknownC042EF(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = ((gameState.leaderDirection + 4) & 7);
	a = unknownC042EF(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = ((gameState.leaderDirection - 2) & 7);
	a = unknownC042EF(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return gameState.leaderDirection;
	}
	gameState.leaderDirection = x10;
	return -1;
}

/// $C04452
ushort findNearbyTalkableTPTEntry() {
	currentTPTEntry = -1;
	unknown7E5D64 = -1;
	short x10 = unknownC043BC();
	if ((x10 != -1) && (entityDirections[gameState.currentPartyMembers] != x10)) {
		gameState.leaderDirection = x10;
		entityDirections[gameState.currentPartyMembers] = x10;
		unknownC0A780(gameState.currentPartyMembers);
	}
	return currentTPTEntry;
}

/// $C0449B
void unknownC0449B() {
	gameState.unknown90 = 0;
	if (mushroomizedWalkingFlag != 0) {
		mushroomizationMovementSwap();
	}
	short x02 = mapInputToDirection(gameState.walkingStyle);
	if (battleSwirlCountdown != 0) {
		if (--battleSwirlCountdown != 0) {
			npcCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
		} else {
			battleDebug = -1;
		}
		return;
	}
	if (x02 == -1) {
		npcCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
		return;
	}
	if (gameState.walkingStyle == WalkingStyle.stairs) {
		if ((unknown7E5DC4 == 0x100) || (unknown7E5DC4 == 0x200)) {
			if (x02 <= Direction.downRight) {
				x02 = Direction.upRight;
			} else {
				x02 = Direction.downLeft;
			}
		} else {
			if (((x02 - 1) & 7) <= Direction.downRight) {
				x02 = Direction.downRight;
			} else {
				x02 = Direction.upLeft;
			}
		}
		if (x02 < Direction.down) {
			gameState.leaderDirection = Direction.right;
		} else {
			gameState.leaderDirection = Direction.left;
		}
	} else if ((miscDebugFlags & 1) == 0) {
		gameState.leaderDirection = x02;
	}
	unknown7E2890++;
	gameState.unknown90++;
	short x22 = gameState.troddenTileType;
	FixedPoint1616 x12 = { combined: adjustPositionHorizontal(x02, gameState.leaderX.combined, x22) };
	FixedPoint1616 x16 = { combined: adjustPositionVertical(x02, gameState.leaderY.combined, x22) };
	unknown7E5DA8 = 0xFFFF;
	short x04;
	if ((miscDebugFlags & 2) == 0) {
		x04 = unknownC05B7B(x12.integer, x16.integer, gameState.currentPartyMembers, x02);
		if (x02 != unknown7E5DA6) {
			x12.combined = adjustPositionHorizontal(unknown7E5DA6, gameState.leaderX.combined, x22);
			x16.combined = adjustPositionVertical(unknown7E5DA6, gameState.leaderY.combined, x22);
		}
	} else if (unknown7E0081 == 0) {
		x04 = unknownC05FD1(x12.integer, x16.integer, gameState.currentPartyMembers) & 0x3F;
	} else {
		x04 = 0;
	}
	gameState.troddenTileType = x04;
	short x02_2 = 1;
	npcCollisionCheck(x12.integer, x16.integer, gameState.currentPartyMembers);
	if (entityCollidedObjects[23] != -1) {
		tracef("Couldn't move due to collision");
		x02_2 = 0;
	}
	if ((x04 & 0xC0) != 0) {
		tracef("Couldn't move due to tile type");
		x02_2 = 0;
	}
	if (unknown7E5DA8 != -1) {
		x02_2 = unknownC07526(unknown7E5DA8, unknown7E5DAA);
	} else if ((gameState.walkingStyle == WalkingStyle.ladder) || (gameState.walkingStyle == WalkingStyle.rope)) {
		gameState.walkingStyle = WalkingStyle.normal;
	}
	if (x02_2 != 0) {
		gameState.leaderX = x12;
		gameState.leaderY = x12;
	} else {
		gameState.unknown90 = 0;
	}
	if (((unknown7E0002 & 1) == 0) && (activeHotspots[0].mode != 0)) {
		unknownC073C0(0);
	}
	if (((unknown7E0002 & 1) != 0) && (activeHotspots[1].mode != 0)) {
		unknownC073C0(1);
	}
	if ((gameState.walkingStyle == WalkingStyle.ladder) || (gameState.walkingStyle == WalkingStyle.rope)) {
		gameState.leaderX.integer = cast(short)((unknown7E5DA8 * 8) + 8);
	}
	if ((debugging != 0) && ((padState[0] & Pad.x) != 0)) {
		gameState.leaderX.integer &= 0xFFF8;
		gameState.leaderY.integer &= 0xFFF8;
	}
}

/// $C0476D
void unknownC0476D() {
	short x04 = 0;
	if ((entityAbsXTable[unknown7E9E33] != gameState.leaderX.integer) || (entityAbsYTable[unknown7E9E33] != gameState.leaderY.integer) || (entityAbsXFractionTable[unknown7E9E33] != gameState.leaderX.fraction) || (entityAbsYFractionTable[unknown7E9E33] != gameState.leaderY.fraction)) {
		x04 = 1;
	}
	gameState.leaderX.integer = entityAbsXTable[unknown7E9E33];
	gameState.leaderY.integer = entityAbsYTable[unknown7E9E33];
	gameState.leaderX.fraction = entityAbsXFractionTable[unknown7E9E33];
	gameState.leaderY.fraction = entityAbsYFractionTable[unknown7E9E33];
	gameState.leaderDirection = entityDirections[unknown7E9E33];
	gameState.unknown90 = x04;
}

/// $C047CF
void unknownC047CF() {
	if (battleSwirlFlag != 0) {
		return;
	}
	if (battleSwirlCountdown != 0) {
		battleSwirlCountdown--;
		return;
	}
	short x14;
	switch (unknown7E5DC6 & 0x300) {
		case 0x000:
			x14 = Direction.upLeft;
			break;
		case 0x200:
			x14 = Direction.downLeft;
			break;
		case 0x100:
			x14 = Direction.upRight;
			break;
		case 0x300:
			x14 = Direction.downRight;
			break;
		default:
			break;
	}
	unknown7E5DA8 = 0xFFFF;
	unknownC05B7B(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers, x14);
	if (unknown7E5DA8 != -1) {
		unknownC07526(unknown7E5DA8, unknown7E5DAA);
	}
	if (1 != 0) { //wat
		gameState.leaderX.combined += horizontalMovementSpeeds[WalkingStyle.escalator].directionSpeeds[x14 * 4].combined;
		gameState.leaderY.combined += verticalMovementSpeeds[WalkingStyle.escalator].directionSpeeds[x14 * 4].combined;
	}
	gameState.unknown90 = 1;
}

/// $C048D3
void unknownC048D3(short arg1) {
	FixedPoint1616 x10;
	FixedPoint1616 x14;
	short x1E = mapInputToDirection(gameState.walkingStyle);
	short x02 = x1E;
	if (battleSwirlCountdown != 0) {
		if (--battleSwirlCountdown != 0) {
			npcCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
			return;
		} else {
			battleDebug = -1;
			return;
		}
	}
	if ((padPress[0] & Pad.r) != 0) {
		playSfx(Sfx.bicycleBell);
	}
	if ((x1E == -1) || (arg1 != 0)) {
		x1E = gameState.leaderDirection;
	} else {
		npcCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
		return;
	}
	if ((x1E & 1) != 0) {
		unknown7E5D5A = 4;
	} else if (unknown7E5D5A != 0) {
		if (--unknown7E5D5A != 0) {
			x1E = gameState.leaderDirection;
		} else if (x02 == -1) {
			x1E = gameState.leaderDirection;
		}
	}
	gameState.leaderDirection = x1E;
	x10.combined = gameState.leaderX.combined + horizontalMovementSpeeds[WalkingStyle.bicycle].directionSpeeds[x1E].combined;
	x14.combined = gameState.leaderY.combined + verticalMovementSpeeds[WalkingStyle.bicycle].directionSpeeds[x1E].combined;
	unknown7E5DA8 = 0xFFFF;
	short x1A = unknownC05CD7(x10.integer, x14.integer, 0x18, x1E);
	npcCollisionCheck(x10.integer, x14.integer, gameState.currentPartyMembers);
	if (entityCollidedObjects[23] == -1) {
		gameState.unknown90++;
		unknown7E2890++;
		if ((x1A & 0xC0) != 0) {
			gameState.unknown90 = 0;
		} else {
			gameState.leaderX.combined = x10.combined;
			gameState.leaderY.combined = x14.combined;
		}
	}
}

/// $C04A7B
void unknownC04A7B() {
	gameState.unknownB0 = unknown7E5D7A;
	unknownC0D19B();
}

/// $C04A88
void unknownC04A88() {
	unknown7E5D7C = 12;
	unknown7E5D7A = gameState.unknownB0;
	gameState.unknownB0 = 3;
	unknownC0AC0C(2);
	overworldStatusSuppression = 1;
}

/// $C04AAD
void unknownC04AAD() {
	if (--unknown7E5D7C != 0) {
		short x10 = mapInputToDirection(gameState.walkingStyle);
		if (x10 == -1) {
			return;
		}
		for (short i = 0x18; i <= 0x1D; i++) {
			if (entityScriptTable[i] == -1) {
				continue;
			}
			if (entityDirections[i] == x10) {
				continue;
			}
			unknown7E4DC6 = &partyCharacters[entityScriptVar1Table[i]];
			if ((playerPositionBuffer[unknown7E4DC6.positionIndex].walkingStyle == WalkingStyle.rope) || (playerPositionBuffer[unknown7E4DC6.positionIndex].walkingStyle == WalkingStyle.ladder)) {
				continue;
			}
			entityDirections[i] = x10;
			unknownC0A780(i);
		}
		gameState.leaderDirection = x10;
	} else {
		unknownC04A7B();
	}
}

/// $C04B53
void unknownC04B53() {
	short x10;
	if (gameState.walkingStyle != WalkingStyle.stairs) {
		x10 = gameState.leaderDirection;
	} else {
		x10 = unknown7E5DCA;
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
			unknownC0476D();
			break;
		case 3:
			unknownC04AAD();
			break;
		default:
			break;
	}
}

/// $C04C45
void unknownC04C45() {
	short x14 = gameState.unknown90;
	gameState.unknown90 = 0;
	if (unknown7E5D58 != 0) {
		unknownC07C5B();
		unknown7E5D58--;
	}
	if ((debugging != 0) && ((padState[0] & Pad.x) != 0) && ((unknown7E0002 & 0xF) != 0)) {
		return;
	}
	chosenFourPtrs[entityScriptVar1Table[gameState.currentPartyMembers]].positionIndex = gameState.unknown88;
	if (gameState.unknownB0 != 0) {
		unknownC04B53();
	} else {
		switch (gameState.walkingStyle) {
			case WalkingStyle.escalator:
				unknownC047CF();
				break;
			case WalkingStyle.bicycle:
				unknownC048D3(x14);
				break;
			default:
				unknownC0449B();
				break;
		}
	}
	short x12 = gameState.unknown88;
	PlayerPositionBufferEntry* x10 = &playerPositionBuffer[gameState.unknown88];
	gameState.troddenTileType = unknownC05F82(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
	if (gameState.unknown90 != 0) {
		x10.xCoord = gameState.leaderX.integer;
		x10.yCoord = gameState.leaderY.integer;
		gameState.unknown88 = cast(short)(x12 + 1);
		centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
		unknown7E4DD4 = 1;
	} else {
		unknown7E4DD4 = 0;
	}
	x10.tileFlags = gameState.troddenTileType;
	x10.walkingStyle = gameState.walkingStyle;
	x10.direction = gameState.leaderDirection;
	footstepSoundIDOverride = 0;
	if ((gameState.troddenTileType & 8) != 0) {
		if ((gameState.troddenTileType & 4) != 0) {
			footstepSoundIDOverride = 0x10;
		} else {
			footstepSoundIDOverride = 0x12;
		}
	}
}

/// $C04D78
void unknownC04D78() {
	if (gameState.unknownB0 == 3) {
		return;
	}
	if (battleSwirlCountdown != 0) {
		return;
	}
	if (battleSwirlFlag != 0) {
		return;
	}
	if (battleDebug != 0) {
		return;
	}
	unknown7E4DC6 = chosenFourPtrs[entityScriptVar1Table[currentEntitySlot]];
	entityDirections[currentEntitySlot] = playerPositionBuffer[unknown7E4DC6.positionIndex].direction;
	entitySurfaceFlags[currentEntitySlot] = playerPositionBuffer[unknown7E4DC6.positionIndex].tileFlags;
	unknownC07A56(entityScriptVar0Table[currentEntitySlot], playerPositionBuffer[unknown7E4DC6.positionIndex].walkingStyle, currentEntitySlot);
	if (gameState.unknown90 == 0) {
		if (playerPositionBuffer[unknown7E4DC6.positionIndex].walkingStyle != WalkingStyle.escalator) {
			return;
		}
	}
	entityAbsXTable[currentEntitySlot] = playerPositionBuffer[unknown7E4DC6.positionIndex].xCoord;
	entityAbsYTable[currentEntitySlot] = playerPositionBuffer[unknown7E4DC6.positionIndex].yCoord;
	short x1C = 0;
	short x12 = void;
	if (entityScriptVar0Table[currentEntitySlot] != gameState.unknown96[0]) {
		switch (playerPositionBuffer[unknown7E4DC6.positionIndex].walkingStyle) {
			case WalkingStyle.ladder:
			case WalkingStyle.rope:
				x12 = 0x1E;
				break;
			case WalkingStyle.escalator:
				if (gameState.walkingStyle == WalkingStyle.normal) {
					x1C = 0x1;
				} else {
					x12 = 0x1E;
				}
				break;
			case WalkingStyle.stairs:
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
	unknown7E4DC6.unknown65 = playerPositionBuffer[unknown7E4DC6.positionIndex].walkingStyle;
	short x1A;
	if ((entityScriptVar0Table[currentEntitySlot] + 1 != gameState.unknown96[0]) && (x1C == 0)) {
		//uh oh, x12 may not have been initialized
		x1A = unknownC03EC3(entityScriptVar0Table[currentEntitySlot], cast(short)(characterSizes[entityScriptVar0Table[currentEntitySlot]] + x12), unknown7E4DC6.positionIndex, 2);
	} else {
		x1A = cast(short)(unknown7E4DC6.positionIndex + 1);
		entityScriptVar7Table[currentEntitySlot] &= (0xFFFF ^ (1 << 12));
	}
	unknown7E4DC6.positionIndex = x1A;
}

/// $C04EF0
void unknownC04EF0() {
	unknown7E4DC6 = chosenFourPtrs[entityScriptVar1Table[currentEntitySlot]];
	entityDirections[currentEntitySlot] = playerPositionBuffer[unknown7E4DC6.positionIndex].direction;
	entitySurfaceFlags[currentEntitySlot] = playerPositionBuffer[unknown7E4DC6.positionIndex].tileFlags;
	unknownC07A56(entityScriptVar0Table[currentEntitySlot], playerPositionBuffer[unknown7E4DC6.positionIndex].walkingStyle, currentEntitySlot);
}

/// $C04F47
void unknownC04F47() {
	palettes[0][0] = unknown7E5D72;
	mirrorTM = 0x17;
	unknownC0856B(8);
}

/// $C04F60
void unknownC04F60() {
	if (battleSwirlCountdown != 0) {
		return;
	}
	if (battleSwirlFlag != 0) {
		return;
	}
	unknown7E5D72 = palettes[0][0];
	palettes[0][0] = 0x1F;
	mirrorTM = 0;
	unknownC0856B(8);
	scheduleOverworldTask(1, &unknownC04F47);
}

/// $C04F9F
void unknownC04F9F(short arg1) {
	short x10 = arg1;
	PartyCharacter* x0E = chosenFourPtrs[gameState.playerControlledPartyMembers[x10]];
	if ((x0E.maxHP * 20) / 100 <= x0E.hp.current.integer) {
		if (unknown7E5D8C[x10] == 0) {
			showHPAlert(cast(short)(x0E.unknown53 + 1));
		}
		unknown7E5D8C[x10] = 1;
	} else {
		unknown7E5D8C[x10] = 0;
	}
}

/// $C04FFE
ushort unknownC04FFE() {
	ushort result = 0;
	ushort x02;
	ushort x04;
	ushort x16;
	if (gameState.unknownB0 == 2) {
		return 1;
	}
	if (overworldStatusSuppression != 0) {
		return 1;
	}
	for(x02 = 0; (gameState.unknown96[x02] != 0) && (gameState.unknown96[x02] <= 4); x02++) {
		unknown7E4DC6 = chosenFourPtrs[gameState.playerControlledPartyMembers[x02]];
		const affliction = unknown7E4DC6.afflictions[0];
		if ((affliction == 1) || (affliction == 2)) {
			continue;
		}
		if (affliction == 5) {
			if (unknown7E5D66[x02] == 0) {
				unknown7E5D66[x02] = 0x78;
			} else if (!--unknown7E5D66[x02]) {
				x04++;
				unknown7E4DC6.hp.current.integer -= 10;
				unknown7E4DC6.hp.target -= 10;
				unknownC04F9F(x02);
			}
		} else if (((affliction < 4) && ((gameState.troddenTileType & 0xC) == 0xC)) || ((affliction >= 4) && (affliction <= 7))) {
			if (unknown7E5D66[x02] == 0) {
				if (affliction == 4) {
					unknown7E5D66[x02] = 0x78;
				} else {
					unknown7E5D66[x02] = 0xF0;
				}
			} else if (!--unknown7E5D66[x02]) {
				x04++;
				if (affliction == 4) {
					unknown7E4DC6.hp.current.integer -= 10;
					unknown7E4DC6.hp.target -= 10;
				} else {
					unknown7E4DC6.hp.current.integer -= 2;
					unknown7E4DC6.hp.target -= 2;
				}
				unknownC04F9F(x02);
			}
		}
		if (unknown7E4DC6.hp.current.integer <= 0) {
			if (affliction != 1) {
				for (short i = 0; i < 6; i++) {
					unknown7E4DC6.afflictions[i] = 0;
				}
				unknown7E4DC6.afflictions[0] = 1;
				unknown7E4DC6.hp.target = 0;
				unknown7E4DC6.hp.current.integer = 0;
				entityScriptVar3Table[unknown7E4DC6.unknown59] = 0x10;
				x16++;
			}
		} else {
			if (affliction != 2) {
				result += unknown7E4DC6.hp.current.integer;
			}
		}
	}
	if (x04 != 0) {
		unknownC04F60();
	}
	if (x16 != 0) {
		unknown7E4DC4 = 0;
		updateParty();
		unknownC07B52();
		unknownC09451();
	}
	return result;
}

/// $C05200
void unknownC05200() {
	if (battleDebug != 0) {
		return;
	}
	if ((unknown7E9F6F == 0) && (unknown7E9F6B != -1)) {
		unknownC07716();
	} else if (unknown7E9F6B != -1) {
		unknownC0777A();
	}
	if (loadedAnimatedTileCount != 0) {
		animateTileset();
	}
	if (unknown7E4474 != 0) {
		animateTileset();
	}
	if (unknown7E9F2A != 0) {
		processItemTransformations();
	}
	unknownC04C45();
	const x = gameState.leaderX.integer >> 8;
	const y = gameState.leaderY.integer >> 8;
	if (((x^unknown7E5D5C) != 0) && ((y^unknown7E5D5E) != 0)) {
		unknown7E5D5C = x;
		unknown7E5D5E = y;
		if (sectorBoundaryBehaviourFlag) {
			unknownC03C25();
		}
	}
	if ((dadPhoneTimer == 0) && (gameState.unknownB0 != 2)) {
		loadDadPhone();
	}
	unknown7E9F6F = 0;
	unknown7E5D76 = gameState.leaderDirection;
	unknown7E5D78 = cast(short)(gameState.currentPartyMembers * 2);
	if (gameState.unknown90) {
		unknown7E0A34 = 1;
	}
}

/// $C052AA
short initBattleCommon() {
	fadeOutWithMosaic(1, 1, 0);
	short result = battleRoutine();
	updateParty();
	unknown7E4DC4 = 1;
	battleDebug = 0;
	return result;
}

/// $C052D4
void unknownC052D4(short arg1) {
	short x26 = 0xFF;
	gameState.unknown88 = 0xFF;
	short x24 = gameState.leaderX.integer;
	short x22 = gameState.leaderY.integer;
	short x20 = gameState.troddenTileType;
	short x1E = gameState.walkingStyle;
	FixedPoint1616 x12 = { combined: adjustPositionHorizontal((arg1 + 4) & 7, gameState.leaderX.combined, gameState.troddenTileType) - gameState.leaderX.combined };
	FixedPoint1616 x16 = { combined: adjustPositionVertical((arg1 + 4) & 7, gameState.leaderY.combined, gameState.troddenTileType) - gameState.leaderY.combined };
	short x1C = 0x100;
	while(x1C != 0) {
		x1C--;
		playerPositionBuffer[x1C].xCoord = x24;
		playerPositionBuffer[x1C].yCoord = x22;
		playerPositionBuffer[x1C].tileFlags = x20;
		playerPositionBuffer[x1C].walkingStyle = x1E;
		playerPositionBuffer[x1C].direction = arg1;
		playerPositionBuffer[x1C].unknown10 = 0;
		x24 += x12.integer;
		x22 += x16.integer;
	}
	for (short i = 0; i < gameState.partyCount; i++) {
		partyCharacters[gameState.playerControlledPartyMembers[i]].positionIndex = x26;
		partyCharacters[gameState.playerControlledPartyMembers[i]].unknown65 = 0xFFFF;
		partyCharacters[gameState.playerControlledPartyMembers[i]].unknown55 = 0xFFFF;
		entityAbsXTable[gameState.unknownA2[i]] = playerPositionBuffer[x26].xCoord;
		entityAbsYTable[gameState.unknownA2[i]] = playerPositionBuffer[x26].yCoord;
		entityDirections[gameState.unknownA2[i]] = playerPositionBuffer[x26].direction;
		entitySurfaceFlags[gameState.unknownA2[i]] = playerPositionBuffer[x26].tileFlags;
		x26 -= 16;
	}
}

/// $C0546B
short unknownC0546B() {
	short x10 = 0;
	for (short i = 0; i != gameState.partyCount; i++) {
		if (gameState.unknown96[i] > 4) {
			continue;
		}
		x10 += partyCharacters[gameState.unknown96[i]].level;
	}
	return x10;
}

/// $C054C9
short unknownC054C9(short arg1, short arg2) {
	short y = unknown7EE000[arg2 & 0x3F][arg1 & 0x3F];
	if ((y & 0x10) != 0) {
		unknown7E5DA8 = arg1;
		unknown7E5DAA = arg2;
	}
	return y;
}

/// $C05503
void unknownC05503(short arg1, short arg2) {
	ushort x10 = cast(ushort)(unknown7EE000[(unknown7E5DAE / 8) & 0x3F][(arg1 / 8) & 0x3F] | unknown7E5DA4);
	short x14 = (arg1 + 7) / 8;
	for (short i = 0; i < unknownC42AA7[arg2]; i++) {
		x10 |= unknown7EE000[(unknown7E5DAE / 8) & 0x3F][x14 & 0x3F];
		x14++;
	}
	unknown7E5DA4 = x10;
}

/// $C0559C
void unknownC0559C(short arg1, short arg2) {
	ushort y = cast(ushort)(unknown7EE000[((((unknownC42AC9[arg2] * 8) + unknown7E5DAE - 1) / 8) & 0x3F)][(arg1 / 8) & 0x3F] | unknown7E5DA4);
	short x12 = (arg1 + 7) / 8;
	for (short i = 0; i < unknownC42AA7[arg2]; i++) {
		y |= unknown7EE000[(((unknownC42AC9[arg2] * 8) + unknown7E5DAE - 1) / 8) & 0x3F][x12 & 0x3F];
		x12++;
	}
	unknown7E5DA4 = y;
}

/// $C05639
void unknownC05639(short arg1, short arg2) {
	ushort x10 = cast(ushort)(unknown7EE000[(arg1 / 8) & 0x3F][(unknown7E5DAC / 8) & 0x3F] | unknown7E5DA4);
	short x12 = (arg1 + 7) / 8;
	for (short i = 0; i < unknownC42AC9[arg2]; i++) {
		x10 |= unknown7EE000[x12 & 0x3F][(unknown7E5DAC / 8) & 0x3F];
		x12++;
	}
	unknown7E5DA4 = x10;
}

/// $C056D0
void unknownC056D0(short arg1, short arg2) {
	ushort y = cast(ushort)(unknown7EE000[(arg1 / 8) & 0x3F][(((unknownC42AA7[arg2] * 8) + unknown7E5DAC - 1) / 8) & 0x3F] | unknown7E5DA4);
	short x12 = (arg1 + 7) / 8;
	for (short i = 0; i < unknownC42AC9[arg2]; i++) {
		y |= unknown7EE000[x12 & 0x3F][(((unknownC42AA7[arg2] * 8) + unknown7E5DAC - 1) / 8) & 0x3F];
		x12++;
	}
	unknown7E5DA4 = y;
}

/// $C05769
short unknownC05769(short arg1) {
	short x02 = 0;
	short x12 = 0;
	for (short i = 0; i < 6; i++, x02 >>= 1, arg1 >>= 1) {
		if ((arg1 & 1) == 0) {
			continue;
		}
		short x0E = unknownC054C9((unknownC200B9[i] + unknown7E5DAC) / 8, (unknownC200C5[i] + unknown7E5DAE) / 8);
		x12 |= x0E;
		if ((x0E & 0xC0) != 0) {
			x02 |= 0x40;
		}
	}
	if (unknown7E5DB4 == 1) {
		unknown7E5DA4 = x12;
	}
	return x02;
}

/// $C057E8
short unknownC057E8() {
	unknown7E5DA4 = 0;
	unknown7E5DB4++;
	unknown7E5DB6 = unknownC05769(7);
	if ((unknown7E5DB6 == 7) || (unknown7E5DB6 == 2)) {
		return -256;
	}
	if (unknown7E5DB6 == 0) {
		return -1;
	}
	if (unknown7E5DB6 == 1) {
		return Direction.upRight;
	}
	if (unknown7E5DB6 == 4) {
		return Direction.upLeft;
	}
	if ((unknown7E5DB6 == 6) && ((unknown7E5DAC & 7) == 0)) {
		return Direction.upLeft;
	}
	return -1;
}

/// $C0583C
short unknownC0583C() {
	unknown7E5DA4 = 0;
	unknown7E5DB4++;
	unknown7E5DB6 = unknownC05769(0x38);
	if ((unknown7E5DB6 == 7) || (unknown7E5DB6 == 0x10)) {
		return -256;
	}
	if (unknown7E5DB6 == 0) {
		return -1;
	}
	if (unknown7E5DB6 == 8) {
		return Direction.downRight;
	}
	if (unknown7E5DB6 == 0x20) {
		return Direction.downLeft;
	}
	if ((unknown7E5DB6 == 0x30) && ((unknown7E5DAC & 7) == 0)) {
		return Direction.downLeft;
	}
	return -1;
}

/// $C05890
short unknownC05890() {
	short x12 = -1;
	short x02 = 0;
	short x10 = 0;
	unknown7E5DA4 = 0;
	unknown7E5DB4 = 1;
	short x0E = unknownC05769(9);
	if (x0E == 0) {
		unknown7E5DAC -= 4;
		x0E = unknownC05769(9);
		if (x0E == 0) {
			return Direction.left;
		}
		x02 = 1;
	}
	if (((x0E & 9) == 9) && ((unknown7E5DAE & 7) != 0)) {
		if (x02 != 0) {
			return Direction.left;
		}
		return -1;
	}
	if ((unknown7EE000[((unknown7E5DAE - 2) / 8) & 0x3F][((unknown7E5DAC - 4) / 8) & 0x3F] & 0xC0) != 0) {
		x10 |= 1;
	}
	if ((unknown7EE000[((unknown7E5DAE + 9) / 8) & 0x3F][((unknown7E5DAC - 4) / 8) & 0x3F] & 0xC0) != 0) {
		x10 |= 2;
	}
	switch (x0E) {
		case 9:
			if (x10 == 1) {
				x12 = Direction.downLeft;
			} else if (x10 == 2) {
				x12 = Direction.upLeft;
			} else if (x10 == 0) {
				if ((unknown7E5DAE & 7) < 4) {
					x12 = Direction.upLeft;
				} else {
					x12 = Direction.downLeft;
				}
			}
			break;
		case 1:
			if ((x10 & 2) == 0) {
				x12 = Direction.downLeft;
			}
			break;
		case 8:
			if ((x10 & 1) == 0) {
				x12 = Direction.upLeft;
			}
			break;
		default: break;
	}
	if ((x02 != 0) && (x12 == -1)) {
		return Direction.left;
	}
	return x12;
}

/// $C059EF
short unknownC059EF() {
	short x12 = -1;
	short x02 = 0;
	short x10 = 0;
	unknown7E5DA4 = 0;
	unknown7E5DB4 = 1;
	short x0E = unknownC05769(0x24);
	if (x0E == 0) {
		unknown7E5DAC += 4;
		x0E = unknownC05769(36);
		if (x0E == 0) {
			return Direction.right;
		}
		x02 = 1;
	}
	if (((x0E & 0x24) == 0x24) && ((unknown7E5DAE & 7) != 0)) {
		if (x02 != 0) {
			return Direction.right;
		}
		return -1;
	}
	if ((unknown7EE000[((unknown7E5DAE - 2) / 8) & 0x3F][((unknown7E5DAC + 4) / 8) & 0x3F] & 0xC0) != 0) {
		x10 |= 1;
	}
	if ((unknown7EE000[((unknown7E5DAE + 9) / 8) & 0x3F][((unknown7E5DAC + 4) / 8) & 0x3F] & 0xC0) != 0) {
		x10 |= 2;
	}
	switch (x0E) {
		case 0x24:
			if (x10 == 1) {
				x12 = Direction.downRight;
			} else if (x10 == 2) {
				x12 = Direction.upRight;
			} else if (x10 == 0) {
				if ((unknown7E5DAE & 7) < 4) {
					x12 = Direction.upRight;
				} else {
					x12 = Direction.downRight;
				}
			}
			break;
		case 0x04:
			if ((x10 & 2) == 0) {
				x12 = Direction.downRight;
			}
			break;
		case 0x20:
			if ((x10 & 1) == 0) {
				x12 = Direction.upRight;
			}
			break;
		default: break;
	}
	if ((x02 != 0) && (x12 == -1)) {
		return Direction.right;
	}
	return x12;
}

/// $C05B4E
short unknownC05B4E(short direction) {
	unknown7E5DA4 = 0;
	unknown7E5DB4++;
	return (unknownC05769(unknownC200D1[direction / 2]) != 0) ? -256 : direction;
}

/// $C05B7B
short unknownC05B7B(short arg1, short arg2, short arg3, short direction) {
	unknown7E5DB8 = 0;
	unknown7E5DB4 = 0;
	unknown7E5DA4 = 0;
	unknown7E5DA6 = direction;
	unknown7E5DA2 = direction;
	unknown7E5DAC = arg1;
	unknown7E5DAE = arg2;
	short x12;
	switch (direction) {
		case Direction.up:
			x12 = unknownC057E8();
			if (x12 != -1) {
				break;
			}
			short x10 = unknown7E5DA8;
			if ((unknown7E5DAE & 7) < 5) {
				unknown7E5DAE -= 4;
				short x0E = unknownC057E8();
				if ((x0E & 0xFF00) != 0xFF00) {
					x12 = x0E;
				}
			}
			unknown7E5DA8 = x10;
			break;
		case Direction.down:
			x12 = unknownC0583C();
			if (x12 != -1) {
				break;
			}
			short x10 = unknown7E5DA8;
			if ((unknown7E5DAE & 7) > 3) {
				unknown7E5DAE += 4;
				short x0E = unknownC0583C();
				if ((x0E & 0xFF00) != 0xFF00) {
					x12 = x0E;
				}
			}
			unknown7E5DA8 = x10;
			break;
		case Direction.left:
			x12 = unknownC05890();
			break;
		case Direction.right:
			x12 = unknownC059EF();
			break;
		case Direction.upLeft:
		case Direction.upRight:
		case Direction.downLeft:
		case Direction.downRight:
			x12 = unknownC05B4E(direction);
			if (x12 != -256) {
				x12 = direction;
			}
			break;
		default: break;
	}
	if (unknown7E5D9A != 0) {
		unknown7E5DA8 = 0xFFFF;
	}
	if ((x12 == -1) || (x12 == -256)) {
		return unknown7E5DA4;
	}
	unknown7E5DB8 = (x12 != direction) ? 1 : 0;
	unknown7E5DA6 = x12;
	return unknown7E5DA4 & 0x3F;
}

/// $C05CD7
short unknownC05CD7(short arg1, short arg2, short arg3, short direction) {
	unknown7E5DA4 = 0;
	unknown7E5DAC = cast(short)(arg1 - unknownC42A1F[entitySizes[arg3]]);
	unknown7E5DAE = cast(short)(arg2 - unknownC42A41[entitySizes[arg3]] + unknownC42AEB[entitySizes[arg3]]);
	switch(direction) {
		case Direction.upRight:
			unknownC056D0(unknown7E5DAE, entitySizes[arg3]);
			goto case;
		case Direction.up:
			unknownC05503(unknown7E5DAC, entitySizes[arg3]);
			break;
		case Direction.downRight:
			unknownC0559C(unknown7E5DAC, entitySizes[arg3]);
			goto case;
		case Direction.right:
			unknownC056D0(unknown7E5DAE, entitySizes[arg3]);
			break;
		case Direction.downLeft:
			unknownC05639(unknown7E5DAE, entitySizes[arg3]);
			goto case;
		case Direction.down:
			unknownC0559C(unknown7E5DAC, entitySizes[arg3]);
			break;
		case Direction.upLeft:
			unknownC05503(unknown7E5DAC, entitySizes[arg3]);
			goto case;
		case Direction.left:
			unknownC05639(unknown7E5DAE, entitySizes[arg3]);
			break;
		default: break;
	}
	return unknown7E5DA4;
}

/// $C05D8B
short unknownC05D8B(short arg1, short arg2, short arg3) {
	short x0E = cast(short)(arg1 - unknownC42A1F[arg3]);
	unknown7E5DAC = x0E;
	unknown7E5DAE = cast(short)(arg2 - unknownC42A41[arg3] + unknownC42AEB[arg3]);
	unknownC05503(x0E, arg3);
	unknownC0559C(unknown7E5DAC, arg3);
	unknownC05639(unknown7E5DAE, arg3);
	unknownC056D0(unknown7E5DAE, arg3);
	return unknown7E5DA4;
}

/// $C05DE7
short unknownC05DE7(short arg1, short arg2, short arg3) {
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
	if ((enemyConfigurationTable[arg3].runFlag & x) != 0) {
		return 0;
	}
	return 0x80;
}

/// $C05E3B
short unknownC05E3B(short arg1) {
	if (unknownC09EFF() == 0) {
		return -256;
	}
	entityObstacleFlags[arg1] = unknownC05CD7(unknown7E2848, unknown7E284A, arg1, entityDirections[arg1]) & 0xD0;
	return entityObstacleFlags[arg1];
}

/// $C05E76
short unknownC05E76() {
	return cast(ubyte)unknownC05E3B(currentEntitySlot);
}

/// $C05E82
short unknownC05E82() {
	short x0E = unknownC05E3B(currentEntitySlot);
	if (x0E == -256) {
		return 0;
	}
	if (x0E != 0) {
		return 0;
	}
	short x04 = unknownC05DE7(x0E, currentEntitySlot, entityEnemyIDs[currentEntitySlot]);
	entityObstacleFlags[currentEntitySlot] |= x04;
	return x04;
}

/// $C05ECE
short unknownC05ECE() {
	if (unknownC09EFF() == 0) {
		return 0;
	}
	short x02 = unknownC05F82(unknown7E2848, unknown7E284A, currentEntitySlot) & 0xD0;
	entityObstacleFlags[currentEntitySlot] = x02;
	if (x02 != 0) {
		return 0;
	}
	ushort tmp = x02 | unknownC05DE7(x02, currentEntitySlot, entityEnemyIDs[currentEntitySlot]);
	entityObstacleFlags[currentEntitySlot] = tmp;
	return tmp;
}

/// $C05F33
short unknownC05F33(short x, short y, short entityID) {
	const size = entitySizes[entityID];
	unknown7E5DA4 = 0;
	unknown7E5DAC = cast(short)(x - unknownC42A1F[size]);
	unknown7E5DAE = cast(short)(y - unknownC42A41[size] + unknownC42AEB[size]);
	unknownC05639(unknown7E5DAE, size);
	unknownC056D0(unknown7E5DAE, size);
	return unknown7E5DA4;
}

/// $C05F82
short unknownC05F82(short x, short y, short entityID) {
	unknown7E5DA4 = 0;
	const size = entitySizes[entityID];
	unknown7E5DAE = cast(short)(y - unknownC42A41[size] + unknownC42AEB[size]);
	unknown7E5DAC = cast(short)(x + unknownC42A1F[size]);
	unknownC05503(unknown7E5DAC, size);
	unknownC0559C(unknown7E5DAC, size);
	return unknown7E5DA4;
}

/// $C05FD1
short unknownC05FD1(short arg1, short arg2, short arg3) {
	unknown7E5DA4 = 0;
	unknown7E5DA4 = unknownC054C9(arg1 / 8, (arg2 + 4) / 8);
	return unknown7E5DA4;
}

/// $C05FF6
short npcCollisionCheck(short x, short y, short arg3) {
	short result = -1;
	if ((entityUnknown332A[arg3] != 0) && ((miscDebugFlags & 2) == 0) && (gameState.walkingStyle != WalkingStyle.escalator) && (unknown7E0081 == 0)) {
		short x18;
		short x04;
		if ((entityDirections[arg3] == Direction.right) || (entityDirections[arg3] == Direction.left)) {
			x18 = entityUnknown33DE[arg3];
			x04 = entityUnknown1A4A[arg3];
		} else {
			x18 = entityUnknown3366[arg3];
			x04 = entityUnknown33A2[arg3];
		}
		y -= x04;
		for (short i = 0; i != 0x17; i++) {
			if (entityScriptTable[i] == -1) {
				continue;
			}
			if (entityCollidedObjects[i] == 0x8000) {
				continue;
			}
			if ((unknown7E5D58 != 0) && (entityTPTEntries[i] + 1 >= 0x8001)){
				continue;
			}
			if (entityUnknown332A[i] == 0) {
				continue;
			}
			short yReg;
			short x10;
			if ((entityDirections[i] == Direction.right) || (entityDirections[i] == Direction.left)) {
				yReg = entityUnknown33DE[i];
				x10 = entityUnknown1A4A[i];
			} else {
				yReg = entityUnknown3366[i];
				x10 = entityUnknown33A2[i];
			}
			if (entityAbsYTable[i] - x10 - x04 >= y) {
				continue;
			}
			if (x10 + entityAbsYTable[i] - x10 <= y) {
				continue;
			}
			if (entityAbsXTable[i] - yReg - x18 * 2 >= x) {
				continue;
			}
			if (entityAbsXTable[i] - yReg + yReg * 2 <= y) {
				continue;
			}
			result = i;
			break;
		}

	}
	entityCollidedObjects[23] = result;
	return result;
}

/// $C0613C
void unknownC0613C(short arg1, short arg2, short arg3) {
	short x1A;
	if (entityUnknown332A[arg3] != 0) {
		short x18;
		short x04;
		if ((entityDirections[arg3] == Direction.right) || (entityDirections[arg3] == Direction.left)) {
			x18 = entityUnknown33DE[arg3];
			x04 = entityUnknown1A4A[arg3];
		} else {
			x18 = entityUnknown3366[arg3];
			x04 = entityUnknown33A2[arg3];
		}
		short x16 = cast(short)(arg1 - x18);
		short x14 = cast(short)(x18 * 2);
		short x1C = cast(short)(arg2 - x04);
		for (short i = 0; i < maxEntities; i++) {
			if (i == arg3) {
				continue;
			}
			if (i == 0x17) {
				continue;
			}
			if (entityScriptTable[i] == -1) {
				continue;
			}
			if (entityCollidedObjects[i] == 0x8000) {
				continue;
			}
			if (entityUnknown332A[i] == 0) {
				continue;
			}
			short y;
			short x10;
			if ((entityDirections[i] == Direction.right) || (entityDirections[i] == Direction.left)) {
				y = entityUnknown33DE[i];
				x10 = entityUnknown1A4A[i];
			} else {
				y = entityUnknown3366[i];
				x10 = entityUnknown33A2[i];
			}
			if (entityAbsYTable[i] - x10 - x04 >= x1C) {
				continue;
			}
			if (x10 + entityAbsYTable[i] - x10 <= x1C) {
				continue;
			}
			if (entityAbsXTable[i] - y - x14 >= x16) {
				continue;
			}
			if (entityAbsXTable[i] - y + y * 2 <= x16) {
				continue;
			}
			x1A = i;
			break;
		}
	}
	entityCollidedObjects[arg3] = x1A;
}

/// $C06267
short unknownC06267(short arg1, short arg2, short arg3) {
	short x1A = -1;
	if (entityUnknown332A[arg3] != 0) {
		short x02;
		short x16;
		if ((entityDirections[arg3] == Direction.right) || (entityDirections[arg3] == Direction.left)) {
			x02 = entityUnknown33DE[arg3];
			x16 = entityUnknown1A4A[arg3];
		} else {
			x02 = entityUnknown3366[arg3];
			x16 = entityUnknown33A2[arg3];
		}
		short x04 = cast(short)(arg1 - x02);
		short x18 = cast(short)(x02 * 2);
		short x14 = cast(short)(arg2 - x16);
		if (unknown7E5D58 == 0) {
			for (short i = 0x18; i < maxEntities; i++) {
				if (entityScriptTable[i] == -1) {
					continue;
				}
				if (entityCollidedObjects[i] == 0x8000) {
					continue;
				}
				if (entityUnknown332A[i] == 0) {
					continue;
				}
				short x10;
				short x12;
				if ((entityDirections[i] == Direction.right) || (entityDirections[i] == Direction.left)) {
					x12 = entityUnknown33DE[i];
					x10 = entityUnknown1A4A[i];
				} else {
					x12 = entityUnknown3366[i];
					x10 = entityUnknown33A2[i];
				}
				unknown7E00C0 = x14;
				if (unknown7E00C0 <= entityAbsYTable[i] - x10 - x16) {
					continue;
				}
				if (x14 >= entityAbsYTable[i] - x10 + x10) {
					continue;
				}
				if (x04 <= entityAbsXTable[i] - x12 - x18) {
					continue;
				}
				if (x04 >= entityAbsXTable[i] - x12 + x12 * 2) {
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
			if (entityScriptTable[i] == -1) {
				continue;
			}
			if (entityTPTEntries[i] >= 0x1000) {
				continue;
			}
			if (entityCollidedObjects[i] == 0x8000) {
				continue;
			}
			if (entityUnknown332A[i] == 0) {
				continue;
			}
			short x10;
			short x12;
			if ((entityDirections[i] == Direction.right) || (entityDirections[i] == Direction.left)) {
				x12 = entityUnknown33DE[i];
				x10 = entityUnknown1A4A[i];
			} else {
				x12 = entityUnknown3366[i];
				x10 = entityUnknown33A2[i];
			}
			unknown7E00C0 = x14;
			if (unknown7E00C0 <= entityAbsYTable[i] - x10 - x16) {
				continue;
			}
			if (x14 >= entityAbsYTable[i] - x10 + x10 - 1) {
				continue;
			}
			if (x04 <= entityAbsXTable[i] - x12 - x18) {
				continue;
			}
			if (x04 >= entityAbsXTable[i] - x12 + x12 * 2 - 1) {
				continue;
			}
			x1A = i;
			goto Unknown26;
		}
	}
	Unknown26:
	entityCollidedObjects[arg3] = x1A;
	return x1A;
}

/// $C06478
void unknownC06478() {
	if (entityCollidedObjects[currentEntitySlot] == 0x8000) {
		return;
	}
	unknownC09EFFEntry2(currentEntitySlot);
	unknownC06267(unknown7E2848, unknown7E284A, currentEntitySlot);
}

/// $C064A6
void unknownC064A6() {
	if (entityCollidedObjects[currentEntitySlot] == 0x8000) {
		return;
	}
	unknownC09EFFEntry2(currentEntitySlot);
	unknownC0613C(unknown7E2848, unknown7E284A, currentEntitySlot);
}

/// $C064D4
void unknownC064D4() {
	nextQueuedInteraction = 0;
	currentQueuedInteraction = 0;
	currentQueuedInteractionType = -1;
}

/// $C064E3
void unknownC064E3(short arg1, QueuedInteractionPtr arg2) {
	if (arg1 == currentQueuedInteractionType) {
		return;
	}
	tracef("Adding interaction of type %s", arg1);
	queuedInteractions[nextQueuedInteraction].type = arg1;
	queuedInteractions[nextQueuedInteraction].ptr = arg2;
	nextQueuedInteraction = (nextQueuedInteraction + 1) & 3;
	unknown7E5D9A = 1;
}

/// $C06537
short unknownC06537() {
	return queuedInteractions[currentQueuedInteraction].type;
}

/// $C0654E
QueuedInteractionPtr unknownC0654E() {
	return queuedInteractions[currentQueuedInteraction].ptr;
}

/// $C06578
void unknownC06578(short arg1, short arg2) {
	unknown7E5E06[unknown7E5E36].unknown0 = arg1;
	unknown7E5E06[unknown7E5E36].unknown2 = arg2;
	unknown7E5E36++;
}

/// $C065A3
void unknownC065A3() {
	while (unknown7E5E36 != 0) {
		unknown7E5E36--;
		createPreparedEntitySprite(unknown7E5E06[unknown7E5E36].unknown0, unknown7E5E06[unknown7E5E36].unknown2);
	}
}

/// $C065C2
void unknownC065C2(short direction) {
	short x0E = cast(short)((gameState.leaderX.integer / 8) + unknownC3E230[direction]);
	short x02 = cast(short)((gameState.leaderY.integer / 8) + unknownC3E240[direction]);
	if (direction == Direction.left) {
		x0E--;
	}
	short x = unknownC07477(x0E, x02);
	if (x == -1) {
		x = unknownC07477(cast(short)(x0E + 1), x02);
	}
	if ((x != -1) && (x != 6)) {
		unknown7E5DDC = unknown7E5DBE;
		//unknown7E5DDE = doorData[unknown7E5DBC & 0x7FFF]

		//not sure if this is the correct type...
		unknown7E5DDE = &unknown7E5DBC.entryA.textPtr[0];
		currentTPTEntry = -2;
	}
}

/// $C06662
void screenTransition(short arg1, short arg2) {
	short x02 = screenTransitionConfigTable[arg1].duration == 0xFF ? 900 : screenTransitionConfigTable[arg1].duration;
	unknownC42631(screenTransitionConfigTable[arg1].unknown5, screenTransitionConfigTable[arg1].direction * 4);
	if (arg2 == 1) {
		unknownC0943C();
		unknownC0DD2C(2);
		if (screenTransitionConfigTable[arg1].animationID != 0) {
			unknownC4A67E(screenTransitionConfigTable[arg1].animationID, screenTransitionConfigTable[arg1].animationFlags + 2);
		}
		unknownC4954C(screenTransitionConfigTable[arg1].fadeStyle, &palettes[0][0]);
		unknownC496E7(x02, -1);
		for (short i = 0; i < x02; i++) {
			if (unknown7E0030 != 0) {
				waitUntilNextFrame();
			}
			updateMapPaletteAnimation();
			oamClear();
			unknownC4268A();
			unknownC426C7();
			runActionscriptFrame();
			updateScreen();
			unknownC4A7B0();
			waitUntilNextFrame();
		}
		if (screenTransitionConfigTable[arg1].fadeStyle <= 50) {
			prepareForImmediateDMA();
		} else {
			memset(&palettes[0][0], 0xFF, 0x200);
			unknownC0856B(0x18);
			waitUntilNextFrame();
			unknown7E4676 = 1;
		}
		unknownC09451();
	} else {
		short x1D = (screenTransitionConfigTable[arg1].fadeStyle <= 50) ? 1 : 0;
		if (x1D != 0) {
			fadeIn(1, 1);
		} else {
			unknownC496E7(screenTransitionConfigTable[arg1].secondaryDuration, -1);
		}
		if (screenTransitionConfigTable[arg1].secondaryAnimationID != 0) {
			unknownC4A67E(screenTransitionConfigTable[arg1].secondaryAnimationID, screenTransitionConfigTable[arg1].secondaryAnimationFlags);
		}
		for (short i = 0; i < screenTransitionConfigTable[arg1].secondaryDuration; i++) {
			if (arg1 == 0) {
				if (unknown7E0030 != 0) {
					waitUntilNextFrame();
				}
				updateMapPaletteAnimation();
			}
			oamClear();
			runActionscriptFrame();
			unknownC4A7B0();
			updateScreen();
			waitUntilNextFrame();
			if (i == 1) {
				unknownC0943C();
			}
		}
		if (x1D == 0) {
			unknownC49740();
		}
	}
	if (currentGiygasPhase < GiygasPhase.startPraying) {
		unknownC2EAAA();
	}
	unknownC09451();
	unknown7E5DAA = 0;
	unknown7E5DA8 = 0;
}

/// $C068AF
short getScreenTransitionSoundEffect(short transition, short getStart) {
	if (getStart == 0) {
		return screenTransitionConfigTable[transition].endingSoundEffect;
	}
	return screenTransitionConfigTable[transition].startSoundEffect;
}

/// $C068F4
void unknownC068F4(short arg1, short arg2) {
	if (unknown7E5DD8 != 0) {
		return;
	}
	const(OverworldEventMusic)* x0A = &overworldEventMusicPointerTable[mapDataPerSectorMusic[arg2 / 128][(arg1 >> 8) & 0xFF]][0];
	while (x0A.flag != 0) {
		if (getEventFlag(x0A.flag & 0x7FFF) == (x0A.flag > 0x8000) ? 1 : 0) {
			break;
		}
		x0A++;
	}
	unknown7E5E38 = x0A;
	unknown7E5DD6 = x0A.music;
	if ((unknown7E5DDA == 0) && (x0A.music != unknown7E5DD4)) {
		unknownC0AC0C(2);
	}
}

/// $C069AF
void unknownC069AF() {
	if (unknown7E5DD8 != 0) {
		return;
	}
	if (unknown7E5DD6 == unknown7E4DD4) {
		return;
	}
	unknown7E5DD4 = unknown7E5DD6;
	changeMusic(unknown7E5DD6);
	unknownC0AC0C(unknown7E5E38.unknown3);
}

/// $C069ED
void changeMusic5DD6() {
	changeMusic(unknown7E5DD6);
}

/// $C069F7
short unknownC069F7() {
	unknownC068F4(gameState.leaderX.integer, gameState.leaderY.integer);
	return unknown7E5DD6;
}

/// $C06A07
void unknownC06A07() {
	unknownC068F4(gameState.leaderX.integer, gameState.leaderY.integer);
	changeMusic(unknown7E5DD6);
}

/// $C06A1B
void unknownC06A1B(const(DoorEntryB)* arg1) {
	if (getEventFlag(arg1.eventFlag & 0x7FFF) == (arg1.eventFlag > eventFlagUnset) ? 1 : 0) {
		unknownC064E3(0, QueuedInteractionPtr(&arg1.textPtr[0]));
		unknown7E5DAA = 0;
		unknown7E5DA8 = 0;
	}
}

/// $C06A8B
void unknownC06A8B(const(DoorEntryC)*) {
	//you wanted something? too bad!
}

/// $C06A8E
void unknownC06A8E(const(DoorEntryC)*) {
	//nothing
}

/// $C06A91
void unknownC06A91(short arg1) {
	if ((gameState.walkingStyle == WalkingStyle.ladder) || (gameState.walkingStyle == WalkingStyle.rope)) {
		return;
	}
	if (arg1 == 0) {
		gameState.walkingStyle = WalkingStyle.ladder;
	} else {
		gameState.walkingStyle = WalkingStyle.rope;
	}
	gameState.leaderDirection &= 0xFFFE;
	unknown7E5DC4 = -1;
}

/// $C06ACA
void unknownC06ACA(const(DoorEntryA)* arg1) {
	if (unknown7E0A34 == 0) {
		return;
	}
	if (gameState.unknownB0 == 2) {
		return;
	}
	if (unknown7E5D9A != 0) {
		return;
	}
	if ((battleSwirlFlag | battleSwirlCountdown) != 0) {
		return;
	}
	unknown7E5DC2 = 1;
	QueuedInteractionPtr ptr = { doorPtr: arg1 };
	unknownC064E3(2, cast(QueuedInteractionPtr)ptr);
	unknownC07C5B();
}

/// $C06B21
void spawnBuzzBuzz() {
	displayText(textSpawnBuzzBuzz.ptr);
	unknownEF0EE8();
}

/// $C06B3D
void unknownC06B3D() {
	short i;
	for (i = 0; (4 > i) && (currentQueuedInteraction != nextQueuedInteraction); currentQueuedInteraction = (currentQueuedInteraction + 1) & 3, i++) {
		if (unknownC06537() != 10) {
			continue;
		}
		unknown7E5E58[i] = unknownC0654E();
	}
	unknown7E5E58[i].textPtr = null;
	for (short j = 0; unknown7E5E58[j].textPtr !is null; j++) {
		unknownC064E3(10, unknown7E5E58[j]);
	}
}

/// $C06BFF
void doorTransition(const(DoorEntryA)* arg1) {
	if (arg1.textPtr !is null) {
		unknownC10004(&arg1.textPtr[0]);
	}
	unknown7E5DAA = 0;
	unknown7E5DA8 = 0;
	if (getEventFlag(arg1.eventFlag & 0x7FFF) != (arg1.eventFlag > eventFlagUnset) ? 1 : 0) {
		unknown7E5DC2 = 0;
		return;
	}
	for (short i = 1; i <= 10; i++) {
		setEventFlag(i, 0);
	}
	unknownC06B3D();
	unknownC07C5B();
	playSfx(getScreenTransitionSoundEffect(arg1.unknown10, 1));
	if (unknown7EB4B6 != 0) {
		fadeOut(1, 1);
	} else {
		screenTransition(arg1.unknown10, 1);
	}
	short x02 = cast(short)(arg1.unknown8 * 8);
	short x04 = cast(short)((arg1.unknown6 & 0x3FFF) * 8);
	if (unknownC3E1D8[arg1.unknown6 >> 14] != 2) {
		x02 += 8;
	}
	if (debugging != 0) {
		if (debugModeNumber != 6) {
			unknownC068F4(x02, x04);
		}
		if (unknown7EB567 == 0) {
			unknownEFE895(arg1.unknown10);
		}
	} else {
		unknownC068F4(x02, x04);
	}
	loadMapAtPosition(x02, x04);
	unknown7E2890 = 0;
	gameState.walkingStyle = 0;
	unknownC03FA9(x02, x04, unknownC3E1D8[arg1.unknown6 >> 14]);
	if ((debugging != 0) && (unknown7EB567 == 0)) {
		saveReplaySaveSlot();
	}
	unknownC069AF();
	unknownC065A3();
	playSfx(getScreenTransitionSoundEffect(arg1.unknown10, 0));
	if (unknown7EB4B6 != 0) {
		fadeIn(1, 1);
	} else {
		screenTransition(arg1.unknown10, 0);
	}
	unknown7E5DC4 = -1;
	unknown7E0A34 = -1;
	spawnBuzzBuzz();
	unknown7E5DC2 = 0;
}

/// $C06E02
immutable short[4] unknownC06E02 = [8, 0, 0, 8];

/// $C06E0A
immutable short[4] unknownC06E0A = [0, 8, 0, 8];

/// $C06E12
immutable short[4] unknownC06E12 = [Direction.left, Direction.right, Direction.left, Direction.right];

/// $C06E2C
void unknownC06E2C() {
	gameState.walkingStyle = WalkingStyle.escalator;
	miscDebugFlags = 0;
	gameState.leaderX.integer = unknown7E5DD0;
	gameState.leaderY.integer = unknown7E5DD2;
	gameState.leaderY.fraction = 0;
	gameState.leaderX.fraction = 0;
}

/// $C06E4A
void unknownC06E4A() {
	unknown7E5DC4 = -1;
	gameState.walkingStyle = WalkingStyle.normal;
	miscDebugFlags = 0;
	unknown7E5DBA = 0;
	gameState.leaderX.integer = unknown7E5DD0;
	gameState.leaderY.integer = unknown7E5DD2;
	gameState.leaderY.fraction = 0;
	gameState.leaderX.fraction = 0;
}

/// $C06E6E
void unknownC06E6E(ushort arg1, short arg2, short arg3) {
	if (unknown7E0081 != 0) {
		return;
	}
	unknownC48C69();
	short x04;
	if ((arg1 & 0x8000) != 0) {
		if (gameState.walkingStyle != WalkingStyle.escalator) {
			return;
		}
		gameState.walkingStyle = WalkingStyle.normal;
		miscDebugFlags = 3;
		x04 = cast(short)((arg2 * 8) + unknownC06E02[unknown7E5DC6 >> 8]);
		short x1A = calcFramesToReachDestination(gameState.leaderX.integer, gameState.leaderY.integer, x04, cast(short)(arg3 * 8));
		unknownC48E6B(unknownC06E12[unknown7E5DC6 >> 8], 16);
		scheduleOverworldTask(cast(short)(x1A + 1), &unknownC06E4A);
		unknownC48E95();
		unknown7E5DC6 = 0;
		unknown7E5DBA = 1;
	} else {
		if (gameState.walkingStyle == WalkingStyle.escalator) {
			return;
		}
		unknown7E5DBA = 1;
		unknown7E5DC6 = arg1;
		gameState.leaderDirection = unknownC06E12[arg1 >> 8];
		miscDebugFlags = 3;
		x04 = cast(short)((arg2 * 8) + unknownC06E02[arg1 >> 8]);
		scheduleOverworldTask(calcFramesToReachDestination(gameState.leaderX.integer, gameState.leaderY.integer, x04, cast(short)(arg3 * 8)), &unknownC06E2C);
		unknownC48E95();
	}
	unknown7E5DD0 = x04;
	unknown7E5DD2 = cast(short)(arg3 * 8);
	unknown7E5DC4 = -1;
}

/// $C06F82
void unknownC06F82() {
	short x12 = 0;
	if ((unknown7E5DC4 == 0) || (unknown7E5DC4 == 0x100)) {
		if (unknown7E5DCE - 1 > gameState.leaderY.integer) {
			x12 = 1;
		}
	} else {
		if (unknown7E5DCE + 1 < gameState.leaderY.integer) {
			x12 = 1;
		}
	}
	if (x12 != 0) {
		gameState.walkingStyle = WalkingStyle.stairs;
		gameState.leaderX.integer = unknown7E5DCC;
		gameState.leaderY.integer = unknown7E5DCE;
		gameState.leaderY.fraction = 0;
		gameState.leaderX.fraction = 0;
	} else {
		scheduleOverworldTask(1, &unknownC06F82);
	}
}

/// $C06FED
void unknownC06FED() {
	short x12 = 0;
	if ((unknown7E5DC4 == 0) || (unknown7E5DC4 == 0x100)) {
		if (unknown7E5DCE < gameState.leaderY.integer) {
			x12 = 1;
		}
	} else {
		if (unknown7E5DCE > gameState.leaderY.integer) {
			x12 = 1;
		}
	}
	if (x12 != 0) {
		unknown7E5DC4 = -1;
		gameState.walkingStyle = WalkingStyle.normal;
		miscDebugFlags = 0;
		gameState.leaderX.integer = unknown7E5DCC;
		gameState.leaderY.integer = unknown7E5DCE;
		gameState.leaderY.fraction = 0;
		gameState.leaderX.fraction = 0;
		unknown7E5DBA = 0;
	} else {
		scheduleOverworldTask(1, &unknownC06FED);
	}
}

/// $C0705F
short unknownC0705F(ushort arg1) {
	short y = 1;
	switch (arg1) {
		case 0x100:
			if ((gameState.leaderDirection == 0) || ((gameState.leaderDirection & 3) != 0)) {
				y = 0;
			}
			unknown7E5DCA = Direction.right;
			break;
		case 0x000:
			if ((gameState.leaderDirection == 0) || ((gameState.leaderDirection & 3) != 0)) {
				y = 0;
			}
			unknown7E5DCA = Direction.left;
			break;
		case 0x300:
			if ((gameState.leaderDirection & 7) != 0) {
				y = 0;
			}
			unknown7E5DCA = Direction.right;
			break;
		case 0x200:
			if ((gameState.leaderDirection & 7) != 0) {
				y = 0;
			}
			unknown7E5DCA = Direction.left;
			break;
		default: break;
	}
	return y;
}

/// $C070CB
void unknownC070CB(ushort arg1, short arg2, short arg3) {
	if (unknown7E0081 != 0) {
		return;
	}
	unknownC48C69();
	short x16;
	short x0E;
	if (gameState.walkingStyle == 0) {
		if (unknownC0705F(arg1) != 0) {
			return;
		}
		gameState.leaderDirection = unknown7E5DCA;
		unknown7E5DB8 = 0;
		miscDebugFlags = 3;
		unknown7E5DBA = 1;
		unknown7E5DC4 = cast(short)(arg1 & 0xFF00);
		x16 = cast(short)((arg2 * 8) + unknownC3E210[arg1 >> 8]);
		x0E = cast(short)((arg3 * 8) + unknownC3E218[arg1 >> 8]);
		short x14 = calcFramesToReachDestination(gameState.leaderX.integer, gameState.leaderY.integer, x16, x0E);
		if (x14 == 0) {
			x14++;
		}
		unknownC48E6B(unknownC3E200[arg1 >> 8], 6);
		scheduleOverworldTask(x14, &unknownC06F82);
	} else {
		x16 = cast(short)((arg2 * 8) + unknownC3E220[arg1 >> 8]);
		x0E = cast(short)((arg3 * 8) + unknownC3E228[arg1 >> 8]);
		short x14 = calcFramesToReachDestination(gameState.leaderX.integer, gameState.leaderY.integer, x16, x0E);
		if (x14 == 0) {
			x14++;
		}
		unknownC48E6B(unknownC3E208[arg1 >> 8], 12);
		scheduleOverworldTask(x14, &unknownC06FED);
	}
	unknown7E5DCC = x16;
	unknown7E5DCE = x0E;
	unknownC48E95();
}

/// $C071E5
void disableHotspot(short arg1) {
	activeHotspots[arg1 - 1].mode = 0;
	gameState.activeHotspotModes[arg1 - 1] = 0;
}

/// $C07213
void reloadHotspots() {
	for (short i = 0; i < 2; i++) {
		if (gameState.activeHotspotModes[i] == 0) {
			continue;
		}
		activeHotspots[i].mode = gameState.activeHotspotModes[i];
		activeHotspots[i].x1 = mapHotspots[gameState.activeHotspotIDs[i]].x1;
		activeHotspots[i].y1 = mapHotspots[gameState.activeHotspotIDs[i]].y1;
		activeHotspots[i].x2 = mapHotspots[gameState.activeHotspotIDs[i]].x2;
		activeHotspots[i].y2 = mapHotspots[gameState.activeHotspotIDs[i]].y2;
		activeHotspots[i].pointer = gameState.activeHotspotPointers[i];
	}
}

/// $C072CF
void activateHotspot(short arg1, short arg2, const(ubyte)* arg3) {
	short x;
	if ((gameState.leaderX.integer > mapHotspots[arg1 - 1].x1) && (gameState.leaderX.integer < mapHotspots[arg1 - 1].x2) && (gameState.leaderY.integer > mapHotspots[arg1 - 1].y1) && (gameState.leaderY.integer < mapHotspots[arg1 - 1].y2)) {
		x = 1;
	} else {
		x = 2;
	}
	activeHotspots[arg1 - 1].mode = x;
	activeHotspots[arg1 - 1].x1 = mapHotspots[arg1 - 1].x1;
	activeHotspots[arg1 - 1].y1 = mapHotspots[arg1 - 1].y1;
	activeHotspots[arg1 - 1].x2 = mapHotspots[arg1 - 1].x2;
	activeHotspots[arg1 - 1].y2 = mapHotspots[arg1 - 1].y2;
	activeHotspots[arg1 - 1].pointer = arg3;
	gameState.activeHotspotModes[arg1 - 1] = cast(ubyte)x;
	gameState.activeHotspotIDs[arg1 - 1] = cast(ubyte)arg2;
	gameState.activeHotspotPointers[arg1 - 1] = arg3;
}

/// $C073C0
void unknownC073C0(short arg1) {
	// don't ask. I don't know either
	if ((nextQueuedInteraction ^ nextQueuedInteraction) != 0) {
		return;
	}
	if (teleportDestination != 0) {
		return;
	}
	short x12 = activeHotspots[arg1].mode;
	if (x12 == 1) {
		if ((gameState.leaderX.integer >= activeHotspots[arg1].x1) && (gameState.leaderX.integer < activeHotspots[arg1].x2) && (gameState.leaderY.integer >= activeHotspots[arg1].y1) && (gameState.leaderY.integer < activeHotspots[arg1].y2)) {
			return;
		}
	} else {
		if ((gameState.leaderX.integer <= activeHotspots[arg1].x1) || (gameState.leaderX.integer >= activeHotspots[arg1].x2) || (gameState.leaderY.integer <= activeHotspots[arg1].y1) || (gameState.leaderY.integer >= activeHotspots[arg1].y2)) {
			return;
		}
	}
	activeHotspots[arg1].mode = 0;
	unknownC064E3(9, QueuedInteractionPtr(activeHotspots[arg1].pointer));
	gameState.activeHotspotModes[arg1] = 0;
}

/// $C07477
byte unknownC07477(short arg1, short arg2) {
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
		unknown7E5DBC = x06.doorPtr;
		unknown7E5DBE = x06.type;
	}
	return -1;
}

/// $C07526
short unknownC07526(short arg1, short arg2) {
	short x0E;
	switch (unknownC07477(arg1, arg2)) {
		case DoorType.switch_:
			unknownC06A1B(unknown7E5DBC.entryB);
			x0E = 0;
			break;
		case DoorType.ropeLadder:
			unknownC06A91(unknown7E5DBC.unknown3);
			x0E = 1;
			break;
		case DoorType.door:
			unknownC06ACA(unknown7E5DBC.entryA);
			x0E = 0;
			break;
		case DoorType.escalator:
			unknownC06E6E(unknown7E5DBC.unknown3, arg1, arg2);
			x0E = 0;
			break;
		case DoorType.stairway:
			unknownC070CB(unknown7E5DBC.unknown3, arg1, arg2);
			x0E = 1;
			break;
		case DoorType.object:
		case DoorType.type7:
			unknownC06A8B(unknown7E5DBC.entryC);
			x0E = 0;
			break;
		case DoorType.person:
			unknownC06A8E(unknown7E5DBC.entryC);
			x0E = 0;
			break;
		default: break;
	}
	return x0E;
}

/// $C075DD
void processQueuedInteractions() {
	QueuedInteractionPtr ptr = queuedInteractions[currentQueuedInteraction].ptr;
	currentQueuedInteractionType = queuedInteractions[currentQueuedInteraction].type;
	currentQueuedInteraction = (currentQueuedInteraction + 1) & 3;
	unknown7E5D58 &= 0xFFFE;
	unknownC07C5B();
	tracef("Processing interaction of type %s", currentQueuedInteractionType);
	switch(currentQueuedInteractionType) {
		case 2:
			doorTransition(ptr.doorPtr);
			break;
		case 10:
			unknownC10004(ptr.textPtr);
			if (ptr.textPtr is textDadCalls.ptr) {
				dadPhoneTimer = 0x697;
				unknown7E9E56 = 0;
			}
			break;
		case 0:
		case 8:
		case 9:
			unknownC10004(ptr.textPtr);
			break;
		default: break;
	}
	unknown7E5D9A = (currentQueuedInteraction != nextQueuedInteraction) ? 1 : 0;
	currentQueuedInteractionType = -1;
}

/// $C0769C
void unknownC0769C() {
	gameState.partyStatus = 0;
	for (short i = 0x18; i <= 0x1D; i++) {
		entityScriptVar3Table[i] = 8;
	}
}

/// $C076C8
void unknownC076C8(short arg1) {
	if (gameState.partyStatus == 3) {
		return;
	}
	gameState.partyStatus = 3;
	for (short i = 0x18; i <= 0x1D; i++) {
		entityScriptVar3Table[i] = 5;
	}
	scheduleOverworldTask(arg1, &unknownC0769C);
}

/// $C07716
void unknownC07716() {
	if ((entityTickCallbackFlags[gameState.currentPartyMembers] & (objectTickDisabled | objectMoveDisabled)) != 0) {
		return;
	}
	if ((entitySpriteMapFlags[gameState.currentPartyMembers] & 0x8000) != 0) {
		return;
	}
	if (gameState.unknownB0 == 2) {
		return;
	}
	unknown7E9F6B = createEntity(OverworldSprite.miniGhost, ActionScript.unknown786, -1, 0, 0);
	entityAnimationFrames[unknown7E9F6B] = -1;
	entityScreenYTable[unknown7E9F6B] = -256;
	entityAbsYTable[unknown7E9F6B] = -256;
	entityAbsXTable[unknown7E9F6B] = -256;
}

/// $C0777A
void unknownC0777A() {
	unknownC02140(unknown7E9F6B);
	unknown7E9F6B = -1;
}

/// $C0778A
void unknownC0778A() {
	if ((entityTickCallbackFlags[gameState.currentPartyMembers] & (objectTickDisabled | objectMoveDisabled)) != 0) {
		entityAnimationFrames[currentEntitySlot] = -1;
		return;
	}
	FixedPoint1616 x0E = unknownC41FFF(unknown7E9F6D, 0x3000);
	entityAbsXTable[currentEntitySlot] = cast(short)(gameState.leaderX.integer + (x0E.integer >> 8));
	entityAbsYTable[currentEntitySlot] = cast(short)(gameState.leaderY.integer - 8 + (x0E.fraction >> 10));
	unknown7E9F6D += 0x300;
	entityAnimationFrames[currentEntitySlot] = 0;
}

/// $C0780F
short unknownC0780F(short characterID, short walkingStyle, PartyCharacter* character) {
	short y = 0;
	if ((characterID == 0) && (unknown7EB4B6 == 0) && (pajamaFlag != 0)) {
		return 0x1B5;
	}
	if (unknown7E9F73 != -1) {
		entityUnknown2E7A[unknown7E9F73] = 0;
	}
	if (gameState.partyStatus == 1) {
		if (gameState.unknown92 != 3) {
			return 0xD;
		} else {
			return 0x25;
		}
	}
	switch (character.afflictions[0]) {
		case Status0.unconscious:
			y = 1;
			break;
		case Status0.diamondized:
			if (gameState.unknown92 != 3) {
				return 0xC;
			}
			return 0x24;
		case Status0.nauseous:
			if (unknown7E9F73 != -1) {
				entityUnknown2E7A[unknown7E9F73] |= 0x8000;
			}
			break;
		default: break;
	}
	switch (character.afflictions[1]) {
		case Status1.mushroomized:
			if (unknown7E9F73 != -1) {
				entityUnknown2E7A[unknown7E9F73] |= 0x4000;
			}
			break;
		case Status1.possessed:
			unknown7E9F6F++;
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
			case WalkingStyle.escalator:
			case WalkingStyle.stairs:
				y = 0;
				break;
			case WalkingStyle.ghost:
				y = 1;
				break;
			case WalkingStyle.ladder:
				y = 2;
				break;
			case WalkingStyle.rope:
				y = 3;
				break;
			default: break;
		}
	}
	if (gameState.unknown92 == 3) {
		y += 4;
		entityUnknown2E7A[unknown7E9F73] = 0;
	} else if ((gameState.unknown92 == 5) && (y == 0)) {
		y += 6;
	}
	if (gameState.partyStatus == 3) {
		entityScriptVar3Table[unknown7E9F73] = 5;
	} else if (character.afflictions[0] == Status0.unconscious) {
		entityScriptVar3Table[unknown7E9F73] = 16;
	} else if ((entitySurfaceFlags[unknown7E9F73] & 0xC) == 0xC) {
		entityScriptVar3Table[unknown7E9F73] = 24;
	} else if ((entitySurfaceFlags[unknown7E9F73] & 8) == 8) {
		entityScriptVar3Table[unknown7E9F73] = 16;
	} else {
		entityScriptVar3Table[unknown7E9F73] = 8;
	}
	if (character.afflictions[0] == Status0.paralyzed) {
		entityScriptVar3Table[unknown7E9F73] = 56;
	}
	return partyCharacterGraphicsTable[characterID][y];
}

/// $C079EC
short unknownC079EC(short arg1) {
	short x = 0;
	if ((arg1 & 0x20) != 0) {
		x = 1;
	} else if ((arg1 & 0x40) != 0) {
		return OverworldSprite.humanDiamondized;
	}
	short a = partyCharacterGraphicsTable[(arg1 & 0x1F) - 1][x];
	return (a == 1) ? OverworldSprite.nessPosing : a;
}

/// $C07A31
void unknownC07A31(short arg1, short arg2) {
	if ((arg2 & 0x80) == 0) {
		return;
	}
	entityUnknown2E7A[arg1] |= 0x4000;
}

/// $C07A56
void unknownC07A56(short arg1, short arg2, short arg3) {
	short x04 = arg3;
	short x02 = arg2;
	short x16 = arg2;
	short x14 = arg1;
	unknown7E9F73 = x04;
	short x12 = unknownC0780F(x14, x02, unknown7E4DC6);
	if (x12 == -1) {
		entityAnimationFrames[x04] = x12;
	} else {
		auto x0E = spriteGroupingPointers[x12];
		//UNKNOWN_30X2_TABLE_31[x04] = x0E.spriteBank;
		entityGraphicsPointers[x04] = &x0E.sprites[0];
		unknown7E00C0 = x02;
		x02 = unknown7E4DC6.unknown55;
		if (unknown7E00C0 != x02) {
			x02 = x16;
			unknown7E4DC6.unknown55 = x16;
			entityScriptVar7Table[x04] |= 1<<15;
		}
		if ((gameState.unknown90 != 0) || (x16 != 0xC)) {
			entityScriptVar7Table[x04] ^= (1 << 15 | 1 << 14 | 1 << 13);
		} else {
			entityScriptVar7Table[x04] |= (1 << 14 | 1 << 13);
		}
	}
	if (gameState.unknownB0 == 2) {
		entityScriptVar7Table[x04] |= 1 << 12;
	}
}

/// $C07B52
void unknownC07B52() {
	ushort x14 = partyCharacters[0].positionIndex;
	for (ushort x12 = 0x18; x12 < 0x1E; x12++) {
		ushort x04 = x12;
		ushort x10 = x12;
		if (entityScriptTable[x04] != -1) {
			entityTickCallbackFlags[x04] |= (objectTickDisabled | objectMoveDisabled);
			unknown7E4DC6 = &partyCharacters[entityScriptVar1Table[x04]];
			if ((gameState.currentPartyMembers == x12) || (unknown7E4DC6.positionIndex == x14)) {
				unknownC07A56(entityScriptVar0Table[x12], gameState.walkingStyle, x12);
				entityAbsXTable[x12] = gameState.leaderX.integer;
				entityAbsYTable[x12] = gameState.leaderY.integer;
				if (gameState.partyCount != 1) {
					entityDirections[x12] = gameState.leaderDirection;
				}
			} else {
				unknownC07A56(entityScriptVar0Table[x12], playerPositionBuffer[unknown7E4DC6.positionIndex].walkingStyle, x12);
				entityAbsXTable[x10] = playerPositionBuffer[unknown7E4DC6.positionIndex].xCoord;
				entityAbsYTable[x10] = playerPositionBuffer[unknown7E4DC6.positionIndex].yCoord;
				entityDirections[x10] = playerPositionBuffer[unknown7E4DC6.positionIndex].direction;
			}
			entityScreenXTable[x12] = cast(short)(entityAbsXTable[x12] - bg1XPosition);
			entityScreenYTable[x12] = cast(short)(entityAbsYTable[x12] - bg1YPosition);
			unknownC0A780(x12);
		}
	}
}

/// $C07C5B
void unknownC07C5B() {
	if (unknown7E5D58 == 0) {
		return;
	}
	for (short i = 0x18; i < 0x1E; i++) {
		entitySpriteMapFlags[i] &= 0x7FFF;
	}
}

/// $C08000
void start() {
	// emulation mode? never heard of it
	NMITIMEN = 0;
	dmaQueueIndex = 0;

	// stack setup would happen here

	INIDISP = 0x80;
	mirrorINIDISP = 0x80;
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
	//not used
	//WRMPYA = 0xFF;
	//WRMPYA = 0;
	//WRMPYB = 0;
	//WRDIVL = 0;
	//WRDIVH = 0;
	//WRDIVB = 0;
	HTIMEL = 0;
	HTIMEH = 0;
	VTIMEL = 0;
	VTIMEH = 0;
	MDMAEN = 0;
	HDMAEN = 0;
	MEMSEL = 1;

	// clearing the heap would happen here

	currentHeapAddress = &heap[0][0];
	heapBaseAddress = &heap[0][0];
	unknown7E2402 = 0xFFFF;
	randA = 0x1234;
	randB = 0x5678;
	nextFrameBufferID = 1;
	irqCallback = &defaultIRQCallback;
	unknownC08B19();
	gameInit();
}

/// $C0814F
void irq() {
	if (TIMEUP & 0x80) {
		irqNMICommon();
	}
}

void nmi() {
	irqNMICommon();
}

void irqNMICommon() {
	// a read from RDNMI is required on real hardware during NMI, apparently
	//ubyte __unused = RDNMI;
	HDMAEN = 0;
	INIDISP = 0x80;
	unknown7E002B++;
	unknown7E0002++;
	if (nextFrameDisplayID != 0) {
		OAMADDL = 0;
		dmaChannels[0].DMAP = 0;
		dmaChannels[0].A1T = null;
		dmaChannels[0].BBAD = 4;
		dmaChannels[0].A1T = ((nextFrameDisplayID - 1) != 0) ? (&oam2) : (&oam1);
		dmaChannels[0].DAS = 0x220;
		MDMAEN = 1;
		handleDma();
		unknown7E0099 += 0x220;
	}
	if (unknown7E0030 != 0) {
		// In the original game's source code, we would only DMA part of
		// the palette to save cycles. With the power of modern computers,
		// we can afford to copy 512 bytes always instead of only 256.
		dmaChannels[0].A1T = &palettes;
		CGADD = 0;
		dmaChannels[0].DMAP = 0x00;
		dmaChannels[0].BBAD = 0x22;
		unknown7E0030 = 0;
		dmaChannels[0].DAS = 0x0200;
		MDMAEN = 1;
		handleDma();
		unknown7E0099 += 0x0200;
	}
	if ((unknown7E0028.a != 0) && (--unknown7E002A < 0)) {
		unknown7E002A = unknown7E0028.b;
		ubyte a = 0;
		if (((mirrorINIDISP & 0xF) + unknown7E0028.a) < 0) {
			mirrorHDMAEN = 0;
			a = 0x80;
		} else {
			if (((mirrorINIDISP & 0xF) + unknown7E0028.a) < 16) {
				a = cast(ubyte)(((mirrorINIDISP & 0xF) + unknown7E0028.a));
				goto Unknown6;
			}
			a = 15;
		}
		unknown7E0028.a = 0;
		Unknown6:
		mirrorINIDISP = a;
	}
	INIDISP = mirrorINIDISP;
	MOSAIC = mirrorMOSAIC;
	BG12NBA = mirrorBG12NBA;
	WH2 = mirrorWH2;
	for (short i = unknown7E0001; i != dmaQueueIndex; i++) {
		dmaChannels[0].DMAP = dmaTable[dmaQueue[i].mode].unknown0;
		dmaChannels[0].BBAD = dmaTable[dmaQueue[i].mode].unknown1;
		VMAIN = dmaTable[dmaQueue[i].mode].unknown2;
		dmaChannels[0].DAS = dmaQueue[i].size;
		dmaChannels[0].A1T = dmaQueue[i].source;
		//dmaChannels[0].A1B = dmaQueue[i].source bank;
		VMADDL = dmaQueue[i].destination;
		MDMAEN = 1;
		handleDma();
	}
	unknown7E0001 = dmaQueueIndex;
	if (nextFrameDisplayID != 0) {
		if (nextFrameDisplayID - 1 == 0) {
			BG1HOFS = bg1XPositionBuffer[0] & 0xFF;
			BG1HOFS = bg1XPositionBuffer[0] >> 8;
			BG1VOFS = bg1YPositionBuffer[0] & 0xFF;
			BG1VOFS = bg1YPositionBuffer[0] >> 8;
			BG2HOFS = bg2XPositionBuffer[0] & 0xFF;
			BG2HOFS = bg2XPositionBuffer[0] >> 8;
			BG2VOFS = bg2YPositionBuffer[0] & 0xFF;
			BG2VOFS = bg2YPositionBuffer[0] >> 8;
			BG3HOFS = bg3XPositionBuffer[0] & 0xFF;
			BG3HOFS = bg3XPositionBuffer[0] >> 8;
			BG3VOFS = bg3YPositionBuffer[0] & 0xFF;
			BG3VOFS = bg3YPositionBuffer[0] >> 8;
			BG4HOFS = bg4XPositionBuffer[0] & 0xFF;
			BG4HOFS = bg4XPositionBuffer[0] >> 8;
			BG4VOFS = bg4YPositionBuffer[0] & 0xFF;
			BG4VOFS = bg4YPositionBuffer[0] >> 8;
		} else{
			BG1HOFS = bg1XPositionBuffer[1] & 0xFF;
			BG1HOFS = bg1XPositionBuffer[1] >> 8;
			BG1VOFS = bg1YPositionBuffer[1] & 0xFF;
			BG1VOFS = bg1YPositionBuffer[1] >> 8;
			BG2HOFS = bg2XPositionBuffer[1] & 0xFF;
			BG2HOFS = bg2XPositionBuffer[1] >> 8;
			BG2VOFS = bg2YPositionBuffer[1] & 0xFF;
			BG2VOFS = bg2YPositionBuffer[1] >> 8;
			BG3HOFS = bg3XPositionBuffer[1] & 0xFF;
			BG3HOFS = bg3XPositionBuffer[1] >> 8;
			BG3VOFS = bg3YPositionBuffer[1] & 0xFF;
			BG3VOFS = bg3YPositionBuffer[1] >> 8;
			BG4HOFS = bg4XPositionBuffer[1] & 0xFF;
			BG4HOFS = bg4XPositionBuffer[1] >> 8;
			BG4VOFS = bg4YPositionBuffer[1] & 0xFF;
			BG4VOFS = bg4YPositionBuffer[1] >> 8;
			unknown7E0061 = bg1XPosition;
			unknown7E0063 = bg1YPosition;
		}
	}
	nextFrameDisplayID = 0;
	if ((mirrorINIDISP & 0x80) == 0) {
		TM = mirrorTM;
		TD = mirrorTD;
		HDMAEN = mirrorHDMAEN;
	}
	processSfxQueue();
	unknown7E0099 = 0;
	if (unknown7E0022 == 0) {
		unknown7E0022++;
		executeIRQCallback();
		unknown7E0022 = 0;
	}
	heapBaseAddress = (&heap[0] == heapBaseAddress) ? (&heap[1][0]) : &heap[0][0];
	currentHeapAddress = (&heap[0] == heapBaseAddress) ? (&heap[1][0]) : &heap[0][0];
	dmaTransferFlag = 0;
	unknown7E00AB = 0;
	timer++;
}

/// $C083B8
void unknownC083B8() {
	unknown7E007B = 0;
}

/// $C083C1
void unknownC083C1(Unknown7E007DEntry* arg1) {
	unknown7E0085 = arg1;
	unknown7E008B = padState[0];
	unknown7E0089 = 1;
	unknown7E007B |= 0x8000;
}

/// $C083E3
void unknownC083E3(Unknown7E007DEntry* arg1) {
	if ((unknown7E007B & 0x4000) != 0) {
		return;
	}
	if (arg1.unknown0 == 0) {
		unknownC083B8();
	}
	unknown7E0081 = arg1.unknown0;
	unknown7E0083 = arg1.unknown1;
	unknown7E007D = arg1;
	unknown7E0077[0] = arg1.unknown1;
	unknown7E0077[1] = arg1.unknown1;
	unknown7E007B |= 0x4000;
}

/// $C0841B
short testSRAMSize() {
	//original code tested how large SRAM was by writing to areas beyond retail SRAM and comparing to a value guaranteed to be in SRAM
	//if SRAM is retail-sized, these areas would just be mirrors of the existing SRAM
	return unknown7E0A36;
}

/// $C0841B
void readJoypad() {
	if (unknown7E007B == 0) {
		goto l1;
	}
	if ((unknown7E007B & 0x4000) == 0) {
		goto l1;
	}
	if (--unknown7E0081 != 0) {
		return;
	}
	unknown7E007D++;
	if (unknown7E007D[0].unknown0 == 0) {
		goto l0;
	}
	unknown7E0081 = unknown7E007D[0].unknown0;
	unknown7E0077[0] = unknown7E007D[0].unknown1;
	unknown7E0077[1] = unknown7E007D[0].unknown1;
	return;

	l0:
	unknown7E007B &= 0xBFFF;

	l1:
	unknown7E0077[1] = JOYPAD_2_DATA;
	unknown7E0077[0] = JOYPAD_1_DATA;
}

/// $C08456
void unknownC08456() {
	if ((unknown7E007B & 0x8000) == 0) {
		return;
	}
	if ((unknown7E0077[0] | unknown7E0077[1]) == unknown7E008B) {
		unknown7E0089++;
		if (unknown7E0089 != 0xFF) {
			return;
		}
	}
	unknown7E0085.unknown0 = cast(ubyte)unknown7E0089;
	unknown7E0085.unknown1 = unknown7E008B;
	unknown7E0085++;
	unknown7E008B = unknown7E0077[0] | unknown7E0077[1];
	unknown7E0089 = 0;
	unknown7E0089++;
	unknown7E0085.unknown0 = 0;
	if (unknown7E0085 !is null) { //not sure about this... but what is BPL on a pointer supposed to mean?
		return;
	}
	unknown7E007B &= 0x7FFF;
}

/// $C08496
void unknownC08496() {
	while ((HVBJOY & 1) == 1) {}
	readJoypad();
	unknownC08456();
	short x = 1;

	l1:
	unknown7E0075 = unknown7E0077[x] & 0xFFF0;
	padPress[x] = (padState[x] ^ 0xFFFF) & unknown7E0075;
	bool eq = padState[x] == unknown7E0075;
	padState[x] = unknown7E0075;
	if (eq) {
		goto l2;
	}
	padHeld[x] = padPress[x];
	unknown7E0071[x] = 0x14;
	goto l4;

	l2:
	if (unknown7E0071[x] == 0) {
		goto l3;
	}
	padHeld[x] = 0;
	goto l4;

	l3:
	padHeld[x] = unknown7E0075;
	unknown7E0071[x] = 3;

	l4:
	if (x-- > 0) {
		goto l1;
	}
	if (debugging == 0) {
		padState[0] |= padState[1];
		padHeld[0] |= padHeld[1];
		padPress[0] |= padPress[1];
	}
	if (padPress[0] != 0) {
		unknown7E0A34++;
	}
}

/// $C08501
void processSfxQueue() {
	if (soundEffectQueueIndex == soundEffectQueueEndIndex) {
		return;
	}
	APUIO3 = soundEffectQueue[soundEffectQueueIndex];
	soundEffectQueueIndex = (soundEffectQueueIndex + 1) & 7;
}

/// $C08518
void executeIRQCallback() {
	irqCallback();
}

/// $C0851B
void defaultIRQCallback() {
	//nothing
}

/// $C0851C
void setIRQCallback(void function() arg1) {
	irqCallback = arg1;
}

/// $C08522
void resetIRQCallback() {
	irqCallback = &defaultIRQCallback;
}

/// $C0856B
void unknownC0856B(short arg1) {
	unknown7E0030 = cast(ubyte)arg1;
}

/// $C085B7 - Copy data to VRAM in chunks of 0x1200
void copyToVRAM2(ubyte mode, ushort count, ushort address, const(ubyte)* data) {
	dmaCopyMode = mode;
	while (unknown7E0099 != 0) { waitForInterrupt(); }
	dmaCopyRAMSource = data;
	dmaCopyVRAMDestination = address;
	if (count >= 0x1201) {
		dmaCopySize = 0x1200;
		while (count >= 0x1201) {
			while (unknown7E0099 != 0) { waitForInterrupt(); }
			copyToVRAMCommon();
			dmaCopyRAMSource += 0x1200;
			dmaCopyVRAMDestination += 0x900;
			count -= 0x1200;
		}
	}
	dmaCopySize = count;
	while (unknown7E0099 != 0) { waitForInterrupt(); }
	copyToVRAMCommon();
	while (unknown7E0099 != 0) { waitForInterrupt(); }
}

/// $C08616 - Copy data to VRAM
void copyToVRAM(ubyte mode, ushort count, ushort address, const(ubyte)* data) {
	dmaCopyMode = mode;
	dmaCopySize = count;
	dmaCopyRAMSource = data;
	dmaCopyVRAMDestination = address;
	copyToVRAMCommon();
}
// this actually splits the address into bank/address parameters, but we don't need that
void copyToVRAMAlt(ubyte mode, ushort count, ushort address, const(ubyte)* data) {
	copyToVRAM(mode, count, address, data);
}

void copyToVRAMCommon() {
	copyToVRAMInternal();
}

/// $C0865F
void copyToVRAMInternal() {
	// if ((mirrorINIDISP & 0x80) != 0) {
	// 	ushort tmp92 = cast(ushort)(dmaCopySize + unknown7E0099);
	// 	if (tmp92 >= 0x1201) {
	// 		while (unknown7E0099 != 0) { waitForInterrupt(); }
	// 		tmp92 = dmaCopySize;
	// 	}
	// 	unknown7E0099 = tmp92;
	// 	unknown7E00A5 = unknown7E0001;
	// 	dmaQueue[dmaQueueIndex].mode = dmaCopyMode;
	// 	dmaQueue[dmaQueueIndex].size = dmaCopySize;
	// 	dmaQueue[dmaQueueIndex].source = dmaCopyRAMSource;
	// 	dmaQueue[dmaQueueIndex].destination = dmaCopyVRAMDestination;
	// 	if (dmaQueueIndex + 1 == unknown7E00A5) {
	// 		while (dmaQueueIndex + 1 == unknown7E0001) {}
	// 	}
	// 	dmaQueueIndex++;
	// } else {
		// Since we send a complete image of VRAM to the console every frame, we
		// can just overwrite our local VRAM copy - no need to delay
		dmaChannels[1].DMAP = dmaTable[dmaCopyMode / 3].unknown0;
		//original assembly relied on DMAP1+BBAD1 being adjacent for a 16-bit write, but we probably shouldn't do that
		dmaChannels[1].BBAD = dmaTable[dmaCopyMode / 3].unknown1;
		VMAIN = dmaTable[dmaCopyMode / 3].unknown2;
		dmaChannels[1].DAS = dmaCopySize;
		dmaChannels[1].A1T = dmaCopyRAMSource;
		//A1B1 is not really relevant without segmented addressing
		VMADDL = dmaCopyVRAMDestination;
		MDMAEN = 2;
		handleDma();
		currentHeapAddress = heapBaseAddress;
		dmaTransferFlag = 0;
	// }
}

/// $C086DE
void* sbrk(ushort i) {
	while (true) {
		if (i + currentHeapAddress - heap[0].length < heapBaseAddress) {
			void* result = currentHeapAddress;
			currentHeapAddress += i;
			return result;
		}
		while (unknown7E002B != 0) { waitForInterrupt(); }
		unknown7E002B = 0;
	}
}

/// $C08726
void prepareForImmediateDMA() {
	mirrorINIDISP = 0x80;
	mirrorHDMAEN = 0;
	unknown7E0028.a = 0;
	unknown7E002B = 0;
	while (unknown7E002B != 0) { waitForInterrupt(); }
	HDMAEN = 0;
}

/// $C08744
void setForceBlank() {
	mirrorINIDISP = 0x80;
	unknown7E002B = 0;
	while (unknown7E002B != 0) { waitForInterrupt(); }
}

/// $C08715
void enableNMIJoypad() {
	unknown7E001E |= 0x81;
	NMITIMEN = unknown7E001E;
}

/// $C08756
void waitUntilNextFrame() {
	// if ((unknown7E001E & 0xB0) != 0) {
	// 	while (unknown7E002B == 0) {}
	// 	unknown7E002B = 0;
	// } else {
	// 	while (HVBJOY < 0) {}
	// 	while (HVBJOY >= 0) {}
	// }
	waitForInterrupt();
	unknown7E002B = 0;
	unknownC08496();
}

/// $C0878B
void waitNFrames(ubyte arg1) {
	do {
		nextFrameDisplayID++;
		waitUntilNextFrame();
	} while (--arg1 != 0);
}

/// $C0879D
void setINIDISP(ubyte arg1) {
	mirrorINIDISP = arg1 & 0x8F;
}

/// $C087AB
void unknownC087AB(ubyte arg1) {
	mirrorMOSAIC = (((mirrorINIDISP ^ 0xFF) << 4) & 0xF0) | arg1;
}

/// $C087CE
void fadeInWithMosaic(short arg1, short arg2, short arg3) {
	unknown7E0028.a = 0;
	mirrorINIDISP = 0;
	while(true) {
		mirrorMOSAIC = 0;
		if (mirrorINIDISP + arg1 >= 0x0F) {
			break;
		}
		setINIDISP(cast(ubyte)(mirrorINIDISP + arg1));
		if (arg3 != 0) {
			unknownC087AB(cast(ubyte)arg3);
		}
		waitNFrames(cast(ubyte)arg2);
	}
	setINIDISP(0xF);
}

/// $C08814
void fadeOutWithMosaic(short arg1, short arg2, short arg3) {
	unknown7E0028.a = 0;
	while (true) {
		mirrorMOSAIC = 0;
		if ((mirrorINIDISP & 0x80) != 0) {
			break;
		}
		if (mirrorINIDISP - arg1 < 0) {
			break;
		}
		setINIDISP(cast(ubyte)(mirrorINIDISP - arg1));
		if (arg3 != 0) {
			unknownC087AB(cast(ubyte)arg3);
		}
		waitNFrames(cast(ubyte)arg2);
	}
	setINIDISP(0x80);
	mirrorHDMAEN = 0;
	unknown7E002B = 0;
	while (unknown7E002B != 0) { waitForInterrupt(); }
	HDMAEN = 0;
}

/// $C0886C
void fadeIn(ubyte arg1, ubyte arg2) {
	unknown7E0028.a = arg1;
	unknown7E0028.b = arg2;
	unknown7E002A = arg2;
}

/// $C0887A
void fadeOut(ubyte arg1, ubyte arg2) {
	unknown7E0028.a = cast(ubyte)((arg1^0xFF) + 1);
	unknown7E0028.b = arg2;
	unknown7E002A = arg2;
}

/// $C0888B
void unknownC0888B() {
	while (true) {
		if (unknown7E0028.a == 0) {
			return;
		}
		oamClear();
		updateScreen();
		waitUntilNextFrame();
	}
}

/// $C088B1
void oamClear() {
	unknown7E2504 = 0;
	unknown7E2606 = 0;
	unknown7E2708 = 0;
	unknown7E280A = 0;
	if (nextFrameBufferID - 1 == 0) {
		oamAddr = &oam1[0];
		oamEndAddr = oam1.ptr + 128;
		oamHighTableAddr = &oam1HighTable[0];
		unknown7E000A = 0x80;
		for (short i = 0; i < 128; i++) { //original code has this loop unrolled
			oam1[i].yCoord = -32;
		}
	} else {
		oamAddr = &oam2[0];
		oamEndAddr = oam2.ptr + 128;
		oamHighTableAddr = &oam2HighTable[0];
		unknown7E000A = 0x80;
		for (short i = 0; i < 128; i++) { //original code has this loop unrolled
			oam2[i].yCoord = -32;
		}
	}
}

/// $C088A5
ushort unknownC088A5(ushort arg1) {
	ushort tmp = unknown7E000B;
	unknown7E000B = arg1;
	return tmp;
}

/// $C08B19
void unknownC08B19() {
	unknown7E0009 = 0;
	oamClear();
	updateScreen();
}

/// $C08B26
void updateScreen() {
	unknownC08B8E();
	if (false /+Actually tests if the DBR is 0xFF, which should never happen+/) while(true) {}
	ubyte unknown7E000Atmp = unknown7E000A;
	if (unknown7E000Atmp != 0x80) {
		// Shift right by two until a bit carries out
		// ...or, shift right by two until a bit is in position 2,
		// then do an extra shift after (so the bit in spot 2 shifts out)
		while ((unknown7E000Atmp & 2) == 0) {
			unknown7E000Atmp >>= 2;
		}
		unknown7E000Atmp >>= 2;
	}
	*oamHighTableAddr = unknown7E000Atmp;
	bg1XPositionBuffer[nextFrameBufferID - 1] = bg1XPosition;
	bg1YPositionBuffer[nextFrameBufferID - 1] = bg1YPosition;
	bg2XPositionBuffer[nextFrameBufferID - 1] = bg2XPosition;
	bg2YPositionBuffer[nextFrameBufferID - 1] = bg2YPosition;
	bg3XPositionBuffer[nextFrameBufferID - 1] = bg3XPosition;
	bg3YPositionBuffer[nextFrameBufferID - 1] = bg3YPosition;
	bg4XPositionBuffer[nextFrameBufferID - 1] = bg4XPosition;
	bg4YPositionBuffer[nextFrameBufferID - 1] = bg4YPosition;
	nextFrameDisplayID = nextFrameBufferID;
	nextFrameBufferID ^= 3;
}

/// $C08B8E
void unknownC08B8E() {
	if (unknown7E2402 == 0) {
		unknownC08C53();
	}
	for (short i =0 ; i < unknown7E2504 / 2; i++) {
		unknown7E000B = unknown7E24C4[i];
		unknownC08CD5(unknown7E2404[i], unknown7E2444[i], unknown7E2484[i]);
	}
	if (unknown7E2402 == 1) {
		unknownC08C53();
	}
	for (short i =0 ; i < unknown7E2606 / 2; i++) {
		unknown7E000B = unknown7E25C6[i];
		unknownC08CD5(unknown7E2506[i], unknown7E2546[i], unknown7E2586[i]);
	}
	if (unknown7E2402 == 2) {
		unknownC08C53();
	}
	for (short i =0 ; i < unknown7E2708 / 2; i++) {
		unknown7E000B = unknown7E26C8[i];
		unknownC08CD5(unknown7E2608[i], unknown7E2648[i], unknown7E2688[i]);
	}
	if (unknown7E2402 == 3) {
		unknownC08C53();
	}
	for (short i =0 ; i < unknown7E280A / 2; i++) {
		unknown7E000B = unknown7E27CA[i];
		unknownC08CD5(unknown7E270A[i], unknown7E274A[i], unknown7E278A[i]);
	}
}

/// $C08C53
void unknownC08C53() {
	//You Get: Nothing
}

/// $C08C54
void unknownC08C58F(const(SpriteMap)* arg1, short arg2, short arg3) {
	unknownC08C58(arg1, arg2, arg3);
}

/// $C08C58
void unknownC08C58(const(SpriteMap)* arg1, short arg2, short arg3) {
	unknownC08C65[unknown7E2400](arg1, arg2, arg3);
}

/// $C08C65
immutable void function(const(SpriteMap)*, short, short)[4] unknownC08C65 = [
	&unknownC08C6D,
	&unknownC08C87,
	&unknownC08CA1,
	&unknownC08CBB,
];

/// $C08C6D
void unknownC08C6D(const(SpriteMap)* arg1, short arg2, short arg3) {
	unknown7E2404[unknown7E2504 / 2] = arg1;
	unknown7E2444[unknown7E2504 / 2] = arg2;
	unknown7E2484[unknown7E2504 / 2] = arg3;
	unknown7E24C4[unknown7E2504 / 2] = unknown7E000B;
	unknown7E2504 += 2;
}

/// $C08C87
void unknownC08C87(const(SpriteMap)* arg1, short arg2, short arg3) {
	unknown7E2506[unknown7E2606 / 2] = arg1;
	unknown7E2546[unknown7E2606 / 2] = arg2;
	unknown7E2586[unknown7E2606 / 2] = arg3;
	unknown7E25C6[unknown7E2606 / 2] = unknown7E000B;
	unknown7E2606 += 2;
}

/// $C08CA1
void unknownC08CA1(const(SpriteMap)* arg1, short arg2, short arg3) {
	unknown7E2608[unknown7E2708 / 2] = arg1;
	unknown7E2648[unknown7E2708 / 2] = arg2;
	unknown7E2688[unknown7E2708 / 2] = arg3;
	unknown7E26C8[unknown7E2708 / 2] = unknown7E000B;
	unknown7E2708 += 2;
}

/// $C08CBB
void unknownC08CBB(const(SpriteMap)* arg1, short arg2, short arg3) {
	unknown7E270A[unknown7E280A / 2] = arg1;
	unknown7E274A[unknown7E280A / 2] = arg2;
	unknown7E278A[unknown7E280A / 2] = arg3;
	unknown7E27CA[unknown7E280A / 2] = unknown7E000B;
	unknown7E280A += 2;
}

/// $C08CD5 - Draw a SpriteMap list into the OAM buffer
void unknownC08CD5(const(SpriteMap)* arg1, short xbase, short ybase) {
	short xpos, ypos;
	ubyte abyte;
	bool carry;
	const(SpriteMap)* y = arg1;
	OAMEntry* x = oamAddr;
	if (x >= oamEndAddr) {
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
		unknown7E009F = ypos;
		x.startingTile = y.unknown10;
		x.flags = y.flags;
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
		unknown7E000A = ROR(unknown7E000A, carry);
		abyte = y.unknown4;
		ROR(abyte, carry);
		unknown7E000A = ROR(unknown7E000A, carry);
		if (carry) {
			oamHighTableAddr[0] = unknown7E000A;
			oamHighTableAddr++;
			unknown7E000A = 0x80;
		}
		x.yCoord = cast(byte)unknown7E009F;
		x++;
		if (y.unknown4 >= 0x80 || x >= oamEndAddr) {
			break;
		}
	}
	oamAddr = x;
}

/// $C08D79
void unknownC08D79(ubyte arg1) {
	unknown7E000F &= 0xF0;
	unknown7E000F |= arg1;
	BGMODE = unknown7E000F;
}

/// $C08D92
void setOAMSize(ubyte arg1) {
	mirrorOBSEL = arg1;
	OBSEL = arg1;
}

/// $C08D9E
void setBG1VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	unknown7E0011 = arg1 & 3;
	unknown7E0011 |= ((arg2 >> 8) & 0xFC);
	BG1SC = unknown7E0011;
	mirrorBG12NBA &= 0xF;
	bg1XPosition = 0;
	bg1YPosition = 0;
	mirrorBG12NBA |= (arg3 >> 12);
	BG12NBA = mirrorBG12NBA;
}

/// $C08DDE
void setBG2VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	unknown7E0012 = arg1 & 3;
	unknown7E0012 |= ((arg2 >> 8) & 0xFC);
	BG2SC = unknown7E0012;
	mirrorBG12NBA &= 0xF;
	bg2XPosition = 0;
	bg2YPosition = 0;
	mirrorBG12NBA |= ((arg3 >> 8) & 0xF0);
	BG12NBA = mirrorBG12NBA;
}

/// $C08E1C
void setBG3VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	unknown7E0013 = arg1 & 3;
	unknown7E0013 |= ((arg2 >> 8) & 0xFC);
	BG3SC = unknown7E0013;
	unknown7E0016 &= 0xF;
	bg3XPosition = 0;
	bg3YPosition = 0;
	unknown7E0016 |= (arg3 >> 12);
	BG34NBA = unknown7E0016;
}

/// $C08E5C
void setBG4VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	unknown7E0014 = arg1 & 3;
	unknown7E0014 |= ((arg2 >> 8) & 0xFC);
	BG4SC = unknown7E0014;
	unknown7E0016 &= 0xF;
	bg4XPosition = 0;
	bg4YPosition = 0;
	unknown7E0016 |= ((arg3 >> 8) & 0xF0);
	BG34NBA = unknown7E0016;
}

/// $C08E9A
ubyte rand() {
	ushort tmp = ror(cast(ushort)((cast(ushort)(randA << 8) >> 8) * (randB & 0xFF)), 2);
	randB = cast(ushort)(((randA << 8) | (randB & 0xFF)) + 0x6D);
	ushort tmp2 = ror(cast(ushort)((tmp & 3) + randA), 1);
	if (((tmp & 3 + randA) & 1) != 0) {
		tmp2 |= 0x8000;
	}
	randA = tmp2;
	return ror(tmp, 2) & 0xFF;
}

/// $C08F8B
void waitDMAFinished() {
	ubyte a = dmaQueueIndex;
	while (unknown7E0001 != a) { waitForInterrupt(); }
}

/// $C08F98
immutable UnknownC08F98Entry[4] unknownC08F98 = [
	UnknownC08F98Entry(0xFE80, 0x0100, 0x0200, 0x0000),
	UnknownC08F98Entry(0x0000, 0x0100, 0x0300, 0x0080),
	UnknownC08F98Entry(0x0000, 0x0200, 0x0200, 0x0000)
];

/// $C08FB0
immutable DMATableEntry[6] dmaTable = [
	DMATableEntry(0x01, 0x18, 0x80),
	DMATableEntry(0x09, 0x18, 0x80),
	DMATableEntry(0x00, 0x18, 0x00),
	DMATableEntry(0x08, 0x18, 0x00),
	DMATableEntry(0x00, 0x19, 0x80),
	DMATableEntry(0x08, 0x19, 0x80),
];

/// $C08FC2
immutable ubyte[38] unknownC08FC2 = [ 0x81, 0x39, 0x80, 0x80, 0x39, 0x00, 0x80, 0x3A, 0x80, 0x01, 0x18, 0x81, 0x09, 0x18, 0x81, 0x00, 0x18, 0x01, 0x08, 0x18, 0x01, 0x00, 0x19, 0x81, 0x08, 0x19, 0x81, 0x81, 0x39, 0x81, 0x80, 0x39, 0x01, 0x80, 0x3A, 0x81, 0xEB, 0x98 ];

/// $C0927C
void unknownC0927C() {
	unknown7E0A5E = &unknownC0DB0F;
	firstEntity = -1;
	entityNextEntityTable[29] = -1;
	entityScriptUnknown125A[69] = -1;
	unknown7E0A52 = 0;
	unknown7E0A54 = 0;
	short x = 0x38;
	do {
		entityNextEntityTable[x / 2] = cast(short)(x + 2);
		x -= 2;
	} while (x >= 0);

	x = 0x88;
	do {
		entityScriptUnknown125A[x / 2] = cast(short)(x + 2);
		x -= 2;
	} while (x >= 0);

	x = 0x3A;
	do {
		entityScriptTable[x / 2] = -1;
		x -= 2;
	} while (x >= 0);

	x = 0x3A;
	do {
		entitySpriteMapFlags[x / 2] = 0;
		entityTickCallbacks[x / 2] = null;
		x -= 2;
	} while (x >= 0);

	x = 6;
	do {
		unknown7E1A12[x / 2] = 0;
		unknown7E1A1A[x / 2] = 0;
		unknown7E1A22[x / 2] = 0;
		unknown7E1A32[x / 2] = 0;
		unknown7E1A2A[x / 2] = 0;
		unknown7E1A3A[x / 2] = 0;
		unknown7E1A02[x / 2] = 0;
		unknown7E1A0A[x / 2] = 0;
		entityDrawPriority[x / 2] = 0;
		x -= 2;
	} while (x >= 0);
	clearEntityDrawSortingTable();
	unknown7E0A60 = 0;
}

/// $C09279
void unknownC09279() {
	assert(0, "Not used");
}

/// $C09321
short initEntityWipe(short actionScript, short x, short y) {
	newEntityPosZ = 0;
	newEntityVar0 = 0;
	newEntityVar1 = 0;
	newEntityVar2 = 0;
	newEntityVar3 = 0;
	newEntityVar4 = 0;
	newEntityVar5 = 0;
	newEntityVar6 = 0;
	newEntityVar7 = 0;
	newEntityPriority = 0;
	entityAllocationMinSlot = 0;
	entityAllocationMaxSlot = 0x1E;
	return initEntity(actionScript, x, y);
}

short initEntity(short actionScript, short x, short y) {
	entityAllocationMinSlot *= 2;
	entityAllocationMaxSlot *= 2;
	bool allocationFailed;
	short newEntity = unknownC09C02(allocationFailed);
	if (allocationFailed) {
		return 0;
	}
	tracef("Initializing entity slot %s with %s at %s,%s", newEntity / 2, cast(ActionScript)actionScript, x, y);
	bool __ignored;
	short newScript = unknownC09D03(__ignored);
	entityScriptIndexTable[newEntity / 2] = newScript;
	entityScriptUnknown125A[newScript / 2] = -1;
	entityMoveCallbacks[newEntity / 2] = &unknownC09FAEEntry2;
	entityScreenPositionCallbacks[newEntity / 2] = &unknownC0A023;
	entityDrawCallbacks[newEntity / 2] = &unknownC0A3A4;
	entityScriptVar0Table[newEntity / 2] = newEntityVar0;
	entityScriptVar1Table[newEntity / 2] = newEntityVar1;
	entityScriptVar2Table[newEntity / 2] = newEntityVar2;
	entityScriptVar3Table[newEntity / 2] = newEntityVar3;
	entityScriptVar4Table[newEntity / 2] = newEntityVar4;
	entityScriptVar5Table[newEntity / 2] = newEntityVar5;
	entityScriptVar6Table[newEntity / 2] = newEntityVar6;
	entityScriptVar7Table[newEntity / 2] = newEntityVar7;
	entityDrawPriority[newEntity / 2] = newEntityPriority;
	entityAbsXFractionTable[newEntity / 2] = 0x8000;
	entityAbsYFractionTable[newEntity / 2] = 0x8000;
	entityAbsZFractionTable[newEntity / 2] = 0x8000;
	entityScreenXTable[newEntity / 2] = x;
	entityAbsXTable[newEntity / 2] = x;
	entityScreenYTable[newEntity / 2] = y;
	entityAbsYTable[newEntity / 2] = y;
	entityAbsZTable[newEntity / 2] = newEntityPosZ;
	newEntity = unknownC09C57(newEntity);
	//Unreachable code?
	/+
	unknownC09C99();
	short newScript2 = unknownC09D03(__ignored);
	entityScriptIndexTable[newEntity / 2] = newScript2;
	entityScriptUnknown125A[newScript2 / 2] = -1;
	+/
	entityScriptTable[newEntity / 2] = actionScript;
	entityAnimationFrames[newEntity / 2] = -1;
	entityDeltaXFractionTable[newEntity / 2] = 0;
	entityDeltaXTable[newEntity / 2] = 0;
	entityDeltaYFractionTable[newEntity / 2] = 0;
	entityDeltaYTable[newEntity / 2] = 0;
	entityDeltaZFractionTable[newEntity / 2] = 0;
	entityDeltaZTable[newEntity / 2] = 0;
	return unknownC092F5Unknown4(&eventScriptPointers[actionScript][0], newEntity);
}

short initEntityUnknown1(const(ubyte)* pc, short entityID) {
	return initEntityUnknown2(pc, cast(short)(entityID * 2));
}
short initEntityUnknown2(const(ubyte)* pc, short entityIndex) {
	if (entityScriptTable[entityIndex / 2] < 0) {
		while(true) {} //oh no
	}
	entityIndex = unknownC09C99(entityIndex);
	bool __ignored;
	short newScript = unknownC09D03(__ignored);
	entityScriptIndexTable[entityIndex / 2] = newScript;
	entityScriptUnknown125A[newScript / 2] = -1;
	return unknownC092F5Unknown4(pc, entityIndex);
}

short unknownC092F5Unknown4(const(ubyte)* pc, short entityIndex) {
	clearSpriteTickCallback(entityIndex);
	entityProgramCounters[entityScriptIndexTable[entityIndex / 2] / 2] = pc;
	entityScriptSleepFrames[entityScriptIndexTable[entityIndex / 2] / 2] = 0;
	entityScriptUnknown12E6[entityScriptIndexTable[entityIndex / 2] / 2] = 0;
	return entityIndex / 2;
}
//actually part of the previous function normally, but whatever
void movementNOP() {
	//nothin
}

/// $C0943C
void unknownC0943C() {
	if (firstEntity < 0) {
		return;
	}
	auto x = firstEntity;
	do {
		entityTickCallbackFlags[x / 2] |= (objectTickDisabled | objectMoveDisabled);
		x = entityNextEntityTable[x / 2];
	} while(x >= 0);
}

/// $C09451
void unknownC09451() {
	short x = firstEntity;
	while (x >= 0) {
		entityTickCallbackFlags[x / 2] &= 0xFFFF ^ (objectTickDisabled | objectMoveDisabled);
		x = entityNextEntityTable[x / 2];
	}
}

/// $C09466
void runActionscriptFrame() {
	if (unknown7E0A60 != 0) {
		return;
	}
	// jump to slowrom
	unknown7E0A60++;
	if (firstEntity < 0) {
		unknown7E0A60 = 0;
		return;
	}
	actionScript80 = 0;
	actionScript86 = 0;
	short x = firstEntity;
	do {
		actionScript88 = x;
		currentEntityOffset = x;
		currentEntitySlot = x;
		currentEntitySlot /= 2;
		unknown7E0A56 = entityNextEntityTable[currentEntitySlot];
		unknownC094D0(unknown7E0A56,x);
	} while ((x = unknown7E0A56) >= 0);
	if (firstEntity < 0) {
		unknown7E0A60 = 0;
		return;
	}
	x = firstEntity;
	do {
		currentEntitySlot = x;
		currentEntitySlot /= 2;
		actionScript88 = x;
		if ((entityTickCallbackFlags[currentEntitySlot] & objectMoveDisabled) == 0) {
			entityMoveCallbacks[currentEntitySlot]();
		}
		entityScreenPositionCallbacks[currentEntitySlot]();
		x = entityNextEntityTable[actionScript88 / 2];
	} while(x >= 0);
	unknown7E0A5E();
	unknown7E0A60 = 0;
}

/// $C09466
void unknownC094D0(short a, short x) {
	if ((entityTickCallbackFlags[x / 2] & objectMoveDisabled) == 0) {
		short y = entityScriptIndexTable[x / 2];
		do {
			actionScript8A = y;
			currentScriptOffset = y;
			currentScriptSlot = y;
			unknown7E0A58 = entityScriptUnknown125A[y / 2];
			unknownC09506();
			y = unknown7E0A58;
		} while (y > 0);
		x = actionScript88;
	}
	if ((entityTickCallbackFlags[x / 2] & objectTickDisabled) == 0) {
		movement42LoadedPtr = entityTickCallbacks[x / 2];
		jumpToLoadedMovementPtr();
	}
}

/// $C09506
void unknownC09506() {
	if (entityScriptSleepFrames[actionScript8A / 2] != 0) {
		entityScriptSleepFrames[actionScript8A / 2]--;
		return;
	}
	//tracef("Entity %2d(%2d): wake up", currentEntitySlot, actionScript8A / 2);
	const(ubyte)* ystart, y = entityProgramCounters[actionScript8A / 2];
	//ActionScript82 = EntityProgramCounterBanks[actionScript8A / 2];
	actionScript84 = &unknown7E15A2[actionScript8A / 2][0];
	do {
		ystart = y;
		ubyte a = (y++)[actionScript80];
		//tracef("Script %2d(%03d): %02x", actionScript8A / 2, entityScriptTable[currentEntitySlot], a);
		if (a < 0x70) {
			y = movementControlCodesPointerTable[a](y);
		} else {
			actionScript90 = a;
			entityScriptSleepFrames[actionScript8A / 2] = a & 0xF;
			y = movementControlCodesPointerTable[0x45 + ((actionScript90 & 0x70) >> 4)](y);
		}
	} while (entityScriptSleepFrames[actionScript8A / 2] == 0);
	//tracef("Entity %2d(%2d): sleep for %3d frames", currentEntitySlot, actionScript8A / 2, entityScriptSleepFrames[actionScript8A / 2]);
	entityProgramCounters[actionScript8A / 2] = y;
	//EntityProgramCounterBanks[actionScript8A / 2] = ActionScript82;
	entityScriptSleepFrames[actionScript8A / 2]--;
}

immutable const(ubyte)* function(const(ubyte)*)[77] movementControlCodesPointerTable = [
	&movementCode00,
	&movementCode01,
	&movementCode02,
	&movementCode03,
	&movementCode04,
	&movementCode05,
	&movementCode06,
	&movementCode07,
	&movementCode08,
	&movementCode09,
	&movementCode0A,
	&movementCode0B,
	&movementCode0C,
	&movementCode0D,
	&movementCode0E,
	&movementCode0F,
	&movementCode10,
	&movementCode11,
	&movementCode12,
	&movementCode13,
	&movementCode14,
	&movementCode15,
	&movementCode16,
	&movementCode17,
	&movementCode18,
	&movementCode19,
	&movementCode1A,
	&movementCode1B,
	&movementCode1C,
	&movementCode1D,
	&movementCode1E,
	&movementCode1F,
	&movementCode20,
	&movementCode21,
	&movementCode22,
	&movementCode23,
	&movementCode24,
	&movementCode25,
	&movementCode26,
	&movementCode27,
	&movementCode28,
	&movementCode29,
	&movementCode2A,
	&movementCode2B,
	&movementCode2C,
	&movementCode2D,
	&movementCode2E,
	&movementCode2F,
	&movementCode30,
	&movementCode31,
	&movementCode32,
	&movementCode33,
	&movementCode34,
	&movementCode35,
	&movementCode36,
	&movementCode37,
	&movementCode38,
	&movementCode39,
	&movementCode3A,
	&movementCode3B45,
	&movementCode3C46,
	&movementCode3D47,
	&movementCode3E48,
	&movementCode3F49,
	&movementCode404A,
	&movementCode414B,
	&movementCode424C,
	&movementCode43,
	&movementCode44,
	&movementCode3B45,
	&movementCode3C46,
	&movementCode3D47,
	&movementCode3E48,
	&movementCode3F49,
	&movementCode404A,
	&movementCode414B,
	&movementCode424C,
];

/// $C095F2 - [00] - End
const(ubyte)* movementCode00(const(ubyte)* y) {
	tracef("Script %2d(%03d): End", actionScript8A / 2, entityScriptTable[currentEntitySlot]);
	unknownC09C3B(actionScript88);
	entityScriptSleepFrames[actionScript8A / 2] = -1;
	unknown7E0A58 = -1;
	return y;
}

/// $C09603 - [01 XX] - Loop XX times
const(ubyte)* movementCode01(const(ubyte)* y) {
	return movementCode0124Common(y[actionScript80], actionScript8A, y + 1);
}
const(ubyte)* movementCode0124Common(short a, short x, const(ubyte)* y) {
	tracef("Script %2d(%03d): Start loop, %3d times", actionScript8A / 2, entityScriptTable[currentEntitySlot], a);
	actionScript90 = a;
	actionScript94 = y;
	actionScript84[entityScriptUnknown12E6[x / 2] / 3].pc = y;
	actionScript84[entityScriptUnknown12E6[x / 2] / 3].counter = cast(ubyte)a;
	entityScriptUnknown12E6[x / 2] += 3;
	return y;
}

/// $C09620 - [24] - Loop (Tempvar)
const(ubyte)* movementCode24(const(ubyte)* y) {
	return movementCode0124Common(entityTempvars[actionScript8A / 2], actionScript8A, y);
}

/// $C09627 - [02] - Loop End
const(ubyte)* movementCode02(const(ubyte)* y) {
	actionScript94 = y;
	if (--actionScript84[entityScriptUnknown12E6[actionScript8A / 2] / 3 - 1].counter == 0) {
		tracef("Script %2d(%03d): Finish loop", actionScript8A / 2, entityScriptTable[currentEntitySlot]);
		entityScriptUnknown12E6[actionScript8A / 2] -= 3;
		return actionScript94;
	}
	tracef("Script %2d(%03d): Loop", actionScript8A / 2, entityScriptTable[currentEntitySlot]);
	return actionScript84[entityScriptUnknown12E6[actionScript8A / 2] / 3 - 1].pc;
}

/// $C09649 - [19 NEARPTR] - Short Jump
const(ubyte)* movementCode19(const(ubyte)* y) {
	return *cast(const(ubyte)**)&y[actionScript80];
}

/// $C0964D - [03 PTR] - Long Jump
const(ubyte)* movementCode03(const(ubyte)* y) {
	return *cast(const(ubyte)**)&y[actionScript80];
}

/// $C09658 - [1A NEARPTR] - Short Call
const(ubyte)* movementCode1A(const(ubyte)* y) {
	actionScript8CScript = *cast(const(ubyte)**)&y[actionScript80];
	actionScript84[entityScriptUnknown12E6[actionScript8A / 2] / 3].pc = y + (const(ubyte)*).sizeof;
	entityScriptUnknown12E6[actionScript8A / 2] += 3;
	return actionScript8CScript;
}

/// $C0966F - [1B] - Short Return
const(ubyte)* movementCode1B(const(ubyte)* y) {
	if (entityScriptUnknown12E6[actionScript8A / 2] == 0) {
		return movementCode0C(null);
	} else {
		entityScriptUnknown12E6[actionScript8A / 2] -= 3;
		return actionScript84[entityScriptUnknown12E6[actionScript8A / 2] / 3].pc;
	}
}

/// $C09685 - [04 PTR] - Long Call
const(ubyte)* movementCode04(const(ubyte)* y) {
	actionScript8CScript = *cast(const(ubyte)**)&y[actionScript80];
	actionScript84[entityScriptUnknown12E6[actionScript8A / 2] / 3].pc = y + (const(ubyte)*).sizeof;
	entityScriptUnknown12E6[actionScript8A / 2] += 3;
	return actionScript8CScript;
}

/// $C096AA - [05] - Long Return
const(ubyte)* movementCode05(const(ubyte)* y) {
	if (entityScriptUnknown12E6[actionScript8A / 2] == 0) {
		return movementCode0C(null);
	} else {
		entityScriptUnknown12E6[actionScript8A / 2] -= 3;
		return actionScript84[entityScriptUnknown12E6[actionScript8A / 2] / 3].pc;
	}
}

/// $C096C3 - [06 XX] - Pause XX frames
const(ubyte)* movementCode06(const(ubyte)* y) {
	entityScriptSleepFrames[actionScript8A / 2] = y[actionScript80];
	return y + 1;
}

/// $C096CF - [3B/45 XX] - Set Animation Frame
const(ubyte)* movementCode3B45(const(ubyte)* y) {
	entityAnimationFrames[actionScript88 / 2] = y[actionScript80] == 0xFF ? -1 : y[actionScript80];
	return y + 1;
}

/// $C096E3 - [28 XXXX] - Set X
const(ubyte)* movementCode28(const(ubyte)* y) {
	entityAbsXTable[actionScript88 / 2] = *cast(short*)&y[actionScript80];
	entityAbsXFractionTable[actionScript88 / 2] = 0x8000;
	return y + 2;
}

/// $C096F3 - [29 XXXX] - Set Y
const(ubyte)* movementCode29(const(ubyte)* y) {
	entityAbsYTable[actionScript88 / 2] = *cast(short*)&y[actionScript80];
	entityAbsYFractionTable[actionScript88 / 2] = 0x8000;
	return y + 2;
}

/// $C09703 - [2A XXXX] - Set Z
const(ubyte)* movementCode2A(const(ubyte)* y) {
	entityAbsZTable[actionScript88 / 2] = *cast(short*)&y[actionScript80];
	entityAbsZFractionTable[actionScript88 / 2] = 0x8000;
	return y + 2;
}

/// $C09713
const(ubyte)* movementCode3F49(const(ubyte)* y) {
	actionScript90 = *cast(short*)&y[actionScript80];
	y += 2;
	entityDeltaXFractionTable[actionScript88 / 2] = cast(ushort)(actionScript90 << 8);
	entityDeltaXTable[actionScript88 / 2] = actionScript90 >> 8;
	return y;
}

/// $C09731
const(ubyte)* movementCode404A(const(ubyte)* y) {
	actionScript90 = *cast(short*)&y[actionScript80];
	y += 2;
	entityDeltaYFractionTable[actionScript88 / 2] = cast(ushort)(actionScript90 << 8);
	entityDeltaYTable[actionScript88 / 2] = actionScript90 >> 8;
	return y;
}

/// $C0974F
const(ubyte)* movementCode414B(const(ubyte)* y) {
	actionScript90 = *cast(short*)&y[actionScript80];
	y += 2;
	entityDeltaZFractionTable[actionScript88 / 2] = cast(ushort)(actionScript90 << 8);
	entityDeltaZTable[actionScript88 / 2] = actionScript90 >> 8;
	return y;
}

/// $C0976D
const(ubyte)* movementCode2E(const(ubyte)* y) {
	actionScript90 = *cast(short*)&y[actionScript80];
	auto i = actionScript88 / 2;
	auto param = FixedPoint1616(cast(ushort)(actionScript90 << 8), cast(short)(actionScript90 >> 8));
	auto prev = FixedPoint1616(entityDeltaXFractionTable[i], entityDeltaXTable[i]);
	prev.combined += param.combined;
	entityDeltaXFractionTable[i] = prev.fraction;
	entityDeltaXTable[i] = prev.integer;
	return y + 2;
}

/// $C09792
const(ubyte)* movementCode2F(const(ubyte)* y) {
	actionScript90 = *cast(short*)&y[actionScript80];
	auto i = actionScript88 / 2;
	auto param = FixedPoint1616(cast(ushort)(actionScript90 << 8), cast(short)(actionScript90 >> 8));
	auto prev = FixedPoint1616(entityDeltaYFractionTable[i], entityDeltaYTable[i]);
	prev.combined += param.combined;
	entityDeltaYFractionTable[i] = prev.fraction;
	entityDeltaYTable[i] = prev.integer;
	return y + 2;
}

/// $C097B7
const(ubyte)* movementCode30(const(ubyte)* y) {
	actionScript90 = *cast(short*)&y[actionScript80];
	auto i = actionScript88 / 2;
	auto param = FixedPoint1616(cast(ushort)(actionScript90 << 8), cast(short)(actionScript90 >> 8));
	auto prev = FixedPoint1616(entityDeltaZFractionTable[i], entityDeltaZTable[i]);
	prev.combined += param.combined;
	entityDeltaZFractionTable[i] = prev.fraction;
	entityDeltaZTable[i] = prev.integer;
	return y + 2;
}

/// $C097DC
const(ubyte)* movementCode31(const(ubyte)* y) {
	ubyte x = (y++)[actionScript80];
	unknown7E1A02[x] = *cast(short*)&y[actionScript80];
	unknown7E1A12[x] = 0;
	return y + 2;
}

/// $C097EF
const(ubyte)* movementCode32(const(ubyte)* y) {
	ubyte x = (y++)[actionScript80];
	unknown7E1A0A[x] = *cast(short*)&y[actionScript80];
	unknown7E1A1A[x] = 0;
	return y + 2;
}

/// $C09802
const(ubyte)* movementCode33(const(ubyte)* y) {
	ubyte x = (y++)[actionScript80];
	actionScript90 = *cast(short*)&y[actionScript80];
	unknown7E1A32[x] = cast(short)((actionScript90 & 0xFF) << 8);
	unknown7E1A22[x] = cast(short)((actionScript90 & 0x8000) ? ((actionScript90 & 0xFF00) | 0xFF) : (actionScript90 & 0xFF00));
	return y + 2;
}

/// $C09826
const(ubyte)* movementCode34(const(ubyte)* y) {
	ubyte x = (y++)[actionScript80];
	actionScript90 = *cast(short*)&y[actionScript80];
	unknown7E1A3A[x] = cast(short)((actionScript90 & 0xFF) << 8);
	unknown7E1A2A[x] = cast(short)((actionScript90 & 0x8000) ? ((actionScript90 & 0xFF00) | 0xFF) : (actionScript90 & 0xFF00));
	return y + 2;
}

/// $C0984A
const(ubyte)* movementCode35(const(ubyte)* y) {
	ubyte x = (y++)[actionScript80];
	actionScript90 = *cast(short*)&y[actionScript80];
	unknown7E1A32[x] += (actionScript90 & 0xFF) << 8;
	unknown7E1A22[x] += (actionScript90 & 0x8000) ? ((actionScript90 & 0xFF00) | 0xFF) : (actionScript90 & 0xFF00);
	return y + 2;
}

/// $C09875
const(ubyte)* movementCode36(const(ubyte)* y) {
	ubyte x = (y++)[actionScript80];
	actionScript90 = *cast(short*)&y[actionScript80];
	unknown7E1A3A[x] += (actionScript90 & 0xFF) << 8;
	unknown7E1A2A[x] += (actionScript90 & 0x8000) ? ((actionScript90 & 0xFF00) | 0xFF) : (actionScript90 & 0xFF00);
	return y + 2;
}

/// $C098A0
const(ubyte)* movementCode2B(const(ubyte)* y) {
	entityAbsXTable[actionScript88 / 2] += *cast(short*)&y[actionScript80];
	return y + 2;
}

/// $C098AE
const(ubyte)* movementCode2C(const(ubyte)* y) {
	entityAbsYTable[actionScript88 / 2] += *cast(short*)&y[actionScript80];
	return y + 2;
}

/// $C098BC
const(ubyte)* movementCode2D(const(ubyte)* y) {
	entityAbsZTable[actionScript88 / 2] += *cast(short*)&y[actionScript80];
	return y + 2;
}

/// $C098CA
const(ubyte)* movementCode37(const(ubyte)* y) {
	ubyte x = (y++)[actionScript80];
	unknown7E1A02[x] += *cast(short*)&y[actionScript80];
	return y + 2;
}

/// $C098DE
const(ubyte)* movementCode38(const(ubyte)* y) {
	ubyte x = (y++)[actionScript80];
	unknown7E1A0A[x] += *cast(short*)&y[actionScript80];
	return y + 2;
}

/// $C098F2
const(ubyte)* movementCode39(const(ubyte)* y) {
	entityDeltaXFractionTable[actionScript88 / 2] = 0;
	entityDeltaXTable[actionScript88 / 2] = 0;
	entityDeltaYFractionTable[actionScript88 / 2] = 0;
	entityDeltaYTable[actionScript88 / 2] = 0;
	entityDeltaZFractionTable[actionScript88 / 2] = 0;
	entityDeltaZTable[actionScript88 / 2] = 0;
	return y;
}

/// $C09907
void unknownC09907(short arg1) {
	entityDeltaXFractionTable[arg1] = 0;
	entityDeltaXTable[arg1] = 0;
	entityDeltaYFractionTable[arg1] = 0;
	entityDeltaYTable[arg1] = 0;
	entityDeltaZFractionTable[arg1] = 0;
	entityDeltaZTable[arg1] = 0;
}

/// $C0991C
const(ubyte)* movementCode3A(const(ubyte)* y) {
	unknown7E1A32[y[actionScript80]] = 0;
	unknown7E1A22[y[actionScript80]] = 0;
	unknown7E1A3A[y[actionScript80]] = 0;
	unknown7E1A2A[y[actionScript80]] = 0;
	return y + 1;
}

/// $C09931
const(ubyte)* movementCode43(const(ubyte)* y) {
	entityDrawPriority[actionScript88 / 2] = (y++)[actionScript80];
	return y;
}

/// $C0993D
const(ubyte)* movementCode424C(const(ubyte)* y) {
	alias Func = short function(short a, ref const(ubyte)* y);
	Func f = *cast(Func*)&y[actionScript80];
	actionScript94 = y + Func.sizeof;
	entityTempvars[actionScript8A / 2] = f(entityTempvars[actionScript8A / 2], actionScript94);
	return actionScript94;
}

/// $C0995D
const(ubyte)* movementCode0A(const(ubyte)* y) {
	if (entityTempvars[actionScript8A / 2] == 0) {
		return *cast(const(ubyte)**)&y[actionScript80];
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C0996B
const(ubyte)* movementCode0B(const(ubyte)* y) {
	if (entityTempvars[actionScript8A / 2] != 0) {
		return *cast(const(ubyte)**)&y[actionScript80];
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C09979
const(ubyte)* movementCode10(const(ubyte)* y) {
	actionScript90 = entityTempvars[actionScript8A / 2];
	actionScript94 = y + 1;
	if (y[actionScript80] <= actionScript90) {
		return actionScript94 + y[actionScript80] * (const(ubyte)*).sizeof;
	} else {
		return (cast(const(ubyte)**)actionScript94)[actionScript90];
	}
}

/// $C0999E
const(ubyte)* movementCode11(const(ubyte)* y) {
	actionScript90 = entityTempvars[actionScript8A / 2];
	actionScript94 = y + 1;
	if (y[actionScript80] <= actionScript90) {
		return actionScript94 + y[actionScript80] * (const(ubyte)*).sizeof;
	} else {
		actionScript84[entityScriptUnknown12E6[actionScript8A / 2] / 3].pc = actionScript94 + y[actionScript80] * (const(ubyte)*).sizeof;
		entityScriptUnknown12E6[actionScript8A / 2] += 3;
		return (cast(const(ubyte)**)actionScript94)[actionScript90];
	}
}

/// $C099C3
const(ubyte)* movementCode0C(const(ubyte)* y) {
	actionScript94 = y;
	return movementCode0C13Common(actionScript8A);
}
const(ubyte)* movementCode0C13Common(short y) {
	ushort regY = unknownC09D12(actionScript88, y);
	entityScriptSleepFrames[regY / 2] = -1;
	if (entityScriptIndexTable[actionScript88 / 2] < 0) {
		movementCode00(null);
	}
	return actionScript94;
}

/// $C099DD
const(ubyte)* movementCode07(const(ubyte)* y) {
	actionScript94 = y;
	bool carry;
	short regY = unknownC09D03(carry);
	if (!carry) {
		unknown7E0A58 = regY;
		entityScriptUnknown125A[regY / 2] = entityScriptUnknown125A[actionScript8A / 2];
		entityScriptUnknown125A[actionScript8A / 2] = regY;
		entityScriptUnknown12E6[regY / 2] = 0;
		entityScriptSleepFrames[regY / 2] = 0;
		entityProgramCounters[regY / 2] = *cast(const(ubyte)**)&y[actionScript80];
		///blah blah blah bank
		return y + (const(ubyte)*).sizeof;
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C09A0E
const(ubyte)* movementCode13(const(ubyte)* y) {
	actionScript94 = y;
	if (entityScriptUnknown125A[actionScript8A / 2] >= 0) {
		return movementCode0C13Common(entityScriptUnknown125A[actionScript8A / 2]);
	}
	return actionScript94;
}

/// $C09A1A
const(ubyte)* movementCode08(const(ubyte)* y) {
	entityTickCallbacks[actionScript88 / 2] = *cast(void function()*)&y[actionScript80];
	y += (const(ubyte)*).sizeof;
	//banks!
	return y;
}

/// $C09A2E
const(ubyte)* movementCode09(const(ubyte)* y) {
	entityScriptSleepFrames[actionScript8A / 2] = -1;
	return y - 1;
}

/// $C09A38
const(ubyte)* movementCode3C46(const(ubyte)* y) {
	entityAnimationFrames[actionScript88 / 2]++;
	return y;
}

/// $C09A3E
const(ubyte)* movementCode3D47(const(ubyte)* y) {
	entityAnimationFrames[actionScript88 / 2]--;
	return y;
}

/// $C09A44
const(ubyte)* movementCode3E48(const(ubyte)* y) {
	entityAnimationFrames[actionScript88 / 2] += cast(byte)y[actionScript80];
	return y + 1;
}

/// $C09A5C
const(ubyte)* movementCode18(const(ubyte)* y) {
	actionScript8CMemory = *cast(ushort**)&y[actionScript80];
	y += (ushort*).sizeof;
	ubyte x = (y++)[actionScript80];
	actionScript90 = (y++)[actionScript80];
	unknownC09ABD[x]();
	return y;
}

/// $C09A87
const(ubyte)* movementCode14(const(ubyte)* y) {
	return movementCode0D14Common(cast(ushort*)&entityScriptVarTables[y[actionScript80]][actionScript88 / 2], y);
}

/// $C09A97
const(ubyte)* movementCode27(const(ubyte)* y) {
	return movementCode0D27Common(cast(ushort*)&entityTempvars[actionScript8A / 2], y);
}

/// $C09A9F
const(ubyte)* movementCode0D(const(ubyte)* y) {
	return movementCode0D14Common(*cast(ushort**)y[actionScript80], y + (ushort*).sizeof - 1);
}

const(ubyte)* movementCode0D14Common(ushort* a, const(ubyte)* y) {
	return movementCode0D27Common(a, y + 1);
}
const(ubyte)* movementCode0D27Common(ushort* a, const(ubyte)* y) {
	actionScript8CMemory = a;
	ubyte x = (y++)[actionScript80];
	actionScript90 = *(cast(short*)&y[actionScript80]);
	y += 2;
	unknownC09ABD[x]();
	return y;
}

/// $C09ABD
immutable void function()[4] unknownC09ABD = [
	&unknownC09AC5,
	&unknownC09ACC,
	&unknownC09AD3,
	&unknownC09ADB,
];

/// $C09AC5
void unknownC09AC5() {
	actionScript8CMemory[0] &= actionScript90;
}

/// $C09ACC
void unknownC09ACC() {
	actionScript8CMemory[0] |= actionScript90;
}

/// $C09AD3
void unknownC09AD3() {
	actionScript8CMemory[0] += actionScript90;
}

/// $C09ADB
void unknownC09ADB() {
	actionScript8CMemory[0] ^= actionScript90;
}

/// $C09AE2
const(ubyte)* movementCode0E(const(ubyte)* y) {
	entityScriptVarTables[y[actionScript80]][actionScript88 / 2] = *cast(short*)&y[1 + actionScript80];
	return y + 3;
}

/// $C09AF9
short*[8] entityScriptVarTables = [
	&entityScriptVar0Table[0],
	&entityScriptVar1Table[0],
	&entityScriptVar2Table[0],
	&entityScriptVar3Table[0],
	&entityScriptVar4Table[0],
	&entityScriptVar5Table[0],
	&entityScriptVar6Table[0],
	&entityScriptVar7Table[0],
];

/// $C09B09
const(ubyte)* movementCode0F(const(ubyte)* y) {
	clearSpriteTickCallback(actionScript88);
	return y;
}

/// $C09B0F - [12 NEARPTR XX] - Write XX to memory
const(ubyte)* movementCode12(const(ubyte)* y) {
	*(*cast(ubyte**)&y[actionScript80]) = y[(ubyte*).sizeof + actionScript80];
	return y + (ubyte*).sizeof + ubyte.sizeof;
}

/// $C09B1F - [15 NEARPTR XXXX] - Write XXXX to memory
const(ubyte)* movementCode15(const(ubyte)* y) {
	*(*cast(ushort**)&y[actionScript80]) = *cast(ushort*)&y[(ushort*).sizeof + actionScript80];
	return y + (ushort*).sizeof + ushort.sizeof;
}

/// $C09B2C - [16 NEARPTR] - Break if false
const(ubyte)* movementCode16(const(ubyte)* y) {
	if (entityTempvars[actionScript8A / 2] == 0) {
		y = *cast(const(ubyte)**)&y[actionScript80];
		entityScriptUnknown12E6[actionScript8A / 2] -= 3;
		return y;
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C09B44 - [17 NEARPTR] - Break if true
const(ubyte)* movementCode17(const(ubyte)* y) {
	if (entityTempvars[actionScript8A / 2] != 0) {
		y = *cast(const(ubyte)**)&y[actionScript80];
		entityScriptUnknown12E6[actionScript8A / 2] -= 3;
		return y;
	}
	return y + (const(ubyte)*).sizeof;
}

/// $C09B4D - [1C PTR] - Set Spritemap
const(ubyte)* movementCode1C(const(ubyte)* y) {
	// The only stuff that uses this command uses a double pointer for its spritemaps
	entitySpriteMapPointers[actionScript88 / 2] = null;
	entitySpriteMapPointersDptr[actionScript88 / 2] = *cast(const(SpriteMap*)**)&y[actionScript80];
	y += (const(SpriteMap*)*).sizeof;
	return y;
}

/// $C09B61 - [1D XXXX] - Write word to tempvar
const(ubyte)* movementCode1D(const(ubyte)* y) {
	entityTempvars[actionScript8A / 2] = *cast(ushort*)&y[actionScript80];
	return y + ushort.sizeof;
}

/// $C09B6B - [1E NEARPTR] - Write data at address to tempvar
const(ubyte)* movementCode1E(const(ubyte)* y) {
	entityTempvars[actionScript8A / 2] = *(*cast(ushort**)&y[actionScript80]);
	return y + (ushort*).sizeof;
}

/// $C09B79 - [1F XX] - Write tempvar to var
const(ubyte)* movementCode1F(const(ubyte)* y) {
	ubyte x = y[actionScript80];
	actionScript8CMemory = cast(ushort*)entityScriptVarTables[x];
	actionScript8CMemory[0] = entityTempvars[actionScript8A / 2];
	return y + 1;
}

/// $C09B91 - [20 XX] - Write var to tempvar
const(ubyte)* movementCode20(const(ubyte)* y) {
	entityTempvars[actionScript8A / 2] = (cast(ushort*)entityScriptVarTables[y[actionScript80]])[0];
	return y + 1;
}

/// $C09BA9 - [44] - Sleep for $tempvar frames
const(ubyte)* movementCode44(const(ubyte)* y) {
	if (entityTempvars[actionScript8A / 2] != 0) {
		entityScriptSleepFrames[actionScript8A / 2] = entityTempvars[actionScript8A / 2];
	}
	return y;
}

/// $C09BB4 - [21 XX] - Sleep for var XX frames
const(ubyte)* movementCode21(const(ubyte)* y) {
	entityScriptSleepFrames[actionScript8A / 2] = (cast(ushort*)entityScriptVarTables[y[actionScript80]])[0];
	return y + 1;
}

/// $C09BCC - [26 XX] - Set Animation Frame to Var XX
const(ubyte)* movementCode26(const(ubyte)* y) {
	entityAnimationFrames[actionScript88 / 2] = entityScriptVarTables[(y++)[actionScript80]][actionScript88 / 2];
	return y;
}

/// $C09BE4 - [22 NEARPTR] - Set Draw Callback
const(ubyte)* movementCode22(const(ubyte)* y) {
	entityDrawCallbacks[actionScript88 / 2] = *cast(void function(short, short)*)&y[actionScript80];
	y += (void function(short)).sizeof;
	return y;
}

/// $C09BEE - [23 NEARPTR] - Set Position Change Callback
const(ubyte)* movementCode23(const(ubyte)* y) {
	entityScreenPositionCallbacks[actionScript88 / 2] = *cast(void function()*)&y[actionScript80];
	y += (void function()).sizeof;
	return y;
}

/// $C09BF8 - [25 NEARPTR] - Set Physics Callback
const(ubyte)* movementCode25(const(ubyte)* y) {
	entityMoveCallbacks[actionScript88 / 2] = *cast(void function()*)&y[actionScript80];
	y += (void function()).sizeof;
	return y;
}

/// $C09C02 - allocates an entity slot
short unknownC09C02(out bool flag) {
	if (unknown7E0A54 < 0) {
		flag = true;
		return -1; //actually just whatever was in the X register when called
	}
	if (unknown7E0A52 < 0) {
		flag = true;
		return -1; //actually just whatever was in the X register when called
	}
	short x = unknown7E0A52;
	short y = -1;
	while (true) {
		if ((x >= entityAllocationMinSlot) && (x < entityAllocationMaxSlot)) {
			break;
		}
		y = x;
		if (entityNextEntityTable[x / 2] < 0) {
			flag = true;
			return x;
		}
		x = entityNextEntityTable[x / 2];
	}
	if (y >= 0) {
		entityNextEntityTable[y / 2] = entityNextEntityTable[x / 2];
		flag = false;
		return x;
	} else {
		unknown7E0A52 = entityNextEntityTable[x / 2];
		flag = false;
		return x;
	}
}

/// $C09C35
void unknownC09C35(short arg1) {
	unknownC09C3B(cast(short)(arg1 * 2));
}

/// $C09C3B
//note: arg1 is passed via X register
void unknownC09C3B(short arg1) {
	if (entityScriptTable[arg1 / 2] >= 0) {
		entityScriptTable[arg1 / 2] = -1;
		clearSpriteTickCallback(arg1);
		short x = unknownC09C99(arg1);
		short a = unknown7E0A54;
		unknownC09C73(a, x);
		unknownC09C8F(x);
	}
}

/// $C09C57
short unknownC09C57(short index) {
	entityNextEntityTable[index / 2] = -1;
	if (firstEntity >= 0) {
		short x, y = firstEntity;
		while ((x = entityNextEntityTable[y / 2]) >= 0) { y = x; }
		entityNextEntityTable[y / 2] = index;
		return index;
	} else {
		firstEntity = index;
		return index;
	}
}

/// $C09C73
void unknownC09C73(ref short a, ref short x) {
	short y;
	unknownC09CB5(a, x, y);
	if (y != -1) {
		entityNextEntityTable[y / 2] = entityNextEntityTable[x / 2];
	} else {
		firstEntity = entityNextEntityTable[x / 2];
	}
	if (x == unknown7E0A56) {
		unknown7E0A56 = a;
	}
}

/// $C09C8F
void unknownC09C8F(short x) {
	entityNextEntityTable[x / 2] = unknown7E0A52;
	unknown7E0A52 = x;
}

/// $C09C99
short unknownC09C99(short index) {
	if (entityScriptIndexTable[index / 2] < 0) {
		return index;
	}
	short unknown7E0A54Copy = unknown7E0A54;
	short x = index;
	short a = entityScriptIndexTable[x / 2];
	unknown7E0A54 = a;
	do {
		x = a;
		a = entityScriptUnknown125A[x / 2];
	} while(a >= 0);
	entityScriptUnknown125A[x / 2] = unknown7E0A54Copy;
	return index;
}

/// $C09CB5
void unknownC09CB5(ref short a, ref short x, ref short y) {
	short tmp = x;
	y = -1;
	x = firstEntity;
	do {
		if (x == tmp) {
			break;
		}
		y = x;
		x = entityNextEntityTable[x / 2];
	} while(true);
	x = tmp;
}

/// $C09CD7
void unknownC09CD7() {
	short a = -32768;
	short x = unknown7E0A52;
	while (x >= 0) {
		short y = entityNextEntityTable[x / 2];
		entityNextEntityTable[x / 2] = a;
		x = y;
	}
	x = 0x3A;
	short y = -1;
	do {
		if (entityNextEntityTable[x / 2] == -32768) {
			entityNextEntityTable[x / 2] = y;
			y = x;
		}
		x -= 2;
	} while (x >= 0);
	unknown7E0A52 = y;
}

/// $C09D03 - allocates a script slot
short unknownC09D03(out bool flag) {
	short result = unknown7E0A54;
	if (result < 0) {
		flag = true;
		return result;
	}
	unknown7E0A54 = entityScriptUnknown125A[result / 2];
	flag = false;
	return result;
}

/// $C09D12
ushort unknownC09D12(short x, short y) {
	unknownC09D1F(x, y);
	entityScriptUnknown125A[y / 2] = unknown7E0A54;
	unknown7E0A54 = y;
	return y;
}

/// $C09D1F
void unknownC09D1F(short x, short y) {
	short tmpX;
	y = unknownC09D3E(x, y, tmpX);
	if (tmpX != -1) {
		entityScriptUnknown125A[tmpX / 2] = entityScriptUnknown125A[y / 2];
	} else {
		entityScriptIndexTable[x / 2] = entityScriptUnknown125A[y / 2];
	}
	if (y == unknown7E0A58) {
		unknown7E0A58 = entityScriptUnknown125A[y / 2];
	}
}

/// $C09D3E
short unknownC09D3E(short x, short y, out short finalX) {
	short tmpY = y;
	y = entityScriptIndexTable[x / 2];
	x = -1;
	while (true) {
		if (y == tmpY) {
			break;
		}
		x = y;
		y = entityScriptUnknown125A[x / 2];
	}
	finalX = x;
	return tmpY;
}

/// $C09D86
ushort movementDataRead8(ref const(ubyte)* arg1) {
	ushort a = arg1[actionScript80];
	arg1++;
	return a;
}

/// $C09D94
ushort movementDataRead16(ref const(ubyte)* arg1) {
	ushort a = *cast(const(ushort)*)&arg1[actionScript80];
	arg1 += 2;
	return a;
}

/// $C09D99 - Same as movementDataRead16, but with a short return
ushort movementDataRead16Copy(ref const(ubyte)* arg1) {
	ushort a = *cast(const(ushort)*)&arg1[actionScript80];
	arg1 += 2;
	return a;
}

/// does not exist in original game
void* movementDataReadPtr(ref const(ubyte)* arg1) {
	void* a = *cast(void**)&arg1[actionScript80];
	arg1 += (void*).sizeof;
	return a;
}

/// $C09D9E
void jumpToLoadedMovementPtr() {
	movement42LoadedPtr();
}

/// $C09DA1
void clearSpriteTickCallback(short index) {
	entityTickCallbacks[index / 2] = &movementNOP;
}

/// $C09E71
short unknownC09E71(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16Copy(arg2);
	// initEntityWipe takes 3 arguments but this code only prepares one of them...
	short x = void;
	actionScript94 = arg2;
	return initEntityWipe(tmp, x, cast(short)actionScript94);
}

/// $C09EFF
short unknownC09EFF() {
	return unknownC09EFFCommon(currentEntityOffset);
}

/// $C09EFF
short unknownC09EFFUnusedEntry() {
	return unknownC09EFFCommon(actionScript88);
}

/// $C09EFF
short unknownC09EFFEntry2(short arg1) {
	return unknownC09EFFCommon(cast(short)(arg1 * 2));
}

//note: arg1 was X register originally
short unknownC09EFFCommon(short arg1) {
	short y = 0;
	//entityAbsXFractionTable[arg1 / 2] + entityDeltaXFractionTable[arg1 / 2]
	unknown7E2848 = cast(short)(entityAbsXTable[arg1 / 2] + entityDeltaXTable[arg1 / 2]);
	if (unknown7E2848 != entityAbsXTable[arg1 / 2]) {
		y++;
	}
	//entityAbsYFractionTable[arg1 / 2] + entityDeltaYFractionTable[arg1 / 2]
	unknown7E284A = cast(short)(entityAbsYTable[arg1 / 2] + entityDeltaYTable[arg1 / 2]);
	if (unknown7E284A != entityAbsYTable[arg1 / 2]) {
		y++;
	}
	return y;
}

/// $C09F3B
void unknownC09F3BUnusedEntry() {
	currentEntityOffset = -1;
	unknownC09F3BEntry2(-1);
}

/// $C09F3B
void unknownC09F3BEntry2(short arg1) {
	for (short i = 0; i != 0x3C; i++) {
		entityUnknown284C[i / 2] = entityTickCallbackFlags[i / 2];
		i += 2;
	}
	if (firstEntity < 0) {
		return;
	}
	short x = firstEntity;
	while (true) {
		if (x != currentEntityOffset) {
			entityTickCallbackFlags[x / 2] |= objectTickDisabled | objectMoveDisabled;
		}
		x = entityNextEntityTable[x / 2];
		if (x <= 0) {
			break;
		}
	}
}

/// $C09F71
void unknownC09F71() {
	for (short i = 0; i != 30 * 2; i++) {
		entityTickCallbackFlags[i / 2] = entityUnknown284C[i / 2];
		i += 2;
	}
}

/// $C09F82
short chooseRandom(short, ref const(ubyte)* arg1) {
	actionScript90 = arg1[actionScript80];
	actionScript94 = arg1 + 1;
	actionScript94 += actionScript90 * 2;
	return (cast(const(short)*)arg1)[rand() % actionScript90];
}

/// $C09FA8
short unknownC09FA8() {
	return cast(short)(rand() << 8);
}

/// $C09FAE
void actionScriptFadeIn(short, ref const(ubyte)* arg1) {
	ubyte a = (arg1++)[actionScript80];
	ubyte b = (arg1++)[actionScript80];
	fadeIn(a, b);
}

/// $C09FAE
void unknownC09FAEEntry2() {
	unknownC09FAEEntry3(actionScript88);
}

/// $C09FB0
void unknownC09FAEEntry3(short arg1) {
	short i = arg1 / 2;
	FixedPoint1616 pos, delta;

	pos = FixedPoint1616(entityAbsXFractionTable[i], entityAbsXTable[i]);
	delta = FixedPoint1616(entityDeltaXFractionTable[i], entityDeltaXTable[i]);
	pos.combined += delta.combined;
	entityAbsXTable[i] = cast(short)pos.integer;
	entityAbsXFractionTable[i] = pos.fraction;

	pos = FixedPoint1616(entityAbsYFractionTable[i], entityAbsYTable[i]);
	delta = FixedPoint1616(entityDeltaYFractionTable[i], entityDeltaYTable[i]);
	pos.combined += delta.combined;
	entityAbsYTable[i] = cast(short)pos.integer;
	entityAbsYFractionTable[i] = pos.fraction;
}

/// $C09FAE
void actionScriptFadeOut(short, ref const(ubyte)* arg1) {
	ubyte a = (arg1++)[actionScript80];
	ubyte b = (arg1++)[actionScript80];
	fadeOut(a, b);
}

/// $C09F??
void unknownC09FAEEntry4() {
	//nothing!
}

/// $C09FF1
void unknownC09FF1() {
	unknownC09FAEEntry2();
	entityAbsZFractionTable[actionScript88 / 2] += entityDeltaZFractionTable[actionScript88 / 2];
	entityAbsZTable[actionScript88 / 2] += entityDeltaZTable[actionScript88 / 2];
	unknownC0C7DB();
}

/// $C0A00C
void unknownC0A00C() {
	unknownC09FAEEntry2();
	entityAbsZFractionTable[actionScript88 / 2] += entityDeltaZFractionTable[actionScript88 / 2];
	entityAbsZTable[actionScript88 / 2] += entityDeltaZTable[actionScript88 / 2];
}

/// $C0A023
void unknownC0A023() {
	entityScreenXTable[actionScript88 / 2] = cast(short)(entityAbsXTable[actionScript88 / 2] - bg1XPosition);
	entityScreenYTable[actionScript88 / 2] = cast(short)(entityAbsYTable[actionScript88 / 2] - bg1YPosition);
}

/// $C0A039
void unknownC0A039() {
	//nothing
}

/// $C0A03A
void unknownC0A03A() {
	entityScreenXTable[actionScript88 / 2] = cast(short)(entityAbsXTable[actionScript88 / 2] - bg1XPosition);
	entityScreenYTable[actionScript88 / 2] = cast(short)(entityAbsYTable[actionScript88 / 2] - bg1YPosition - entityAbsZTable[actionScript88 / 2]);
}

/// $C0A055
void unknownC0A055() {
	entityScreenXTable[actionScript88 / 2] = cast(short)(entityAbsXTable[actionScript88 / 2] - bg3XPosition);
	entityScreenYTable[actionScript88 / 2] = cast(short)(entityAbsYTable[actionScript88 / 2] - bg3YPosition);
}

/// $C0A06C
void unknownC0A06C() {
	entityScreenXTable[actionScript88 / 2] = cast(short)(entityAbsXTable[actionScript88 / 2] - bg3XPosition);
	entityAbsXTable[actionScript88 / 2] = cast(short)(entityAbsXTable[actionScript88 / 2] - bg3XPosition);
	entityScreenYTable[actionScript88 / 2] = cast(short)(entityAbsYTable[actionScript88 / 2] - bg3YPosition);
	entityAbsYTable[actionScript88 / 2] = cast(short)(entityAbsYTable[actionScript88 / 2] - bg3YPosition);
}

/// $C0A0A0
void unknownC0A0A0() {
	entityScreenXTable[actionScript88 / 2] = cast(short)(entityAbsXTable[actionScript88 / 2] - bg3XPosition);
	entityScreenYTable[actionScript88 / 2] = cast(short)(entityAbsYTable[actionScript88 / 2] - bg3YPosition - entityAbsZTable[actionScript88 / 2]);
}

/// $C0A0BB
void unknownC0A0BB() {
	entityScreenXTable[actionScript88 / 2] = entityAbsXTable[actionScript88 / 2];
	entityScreenYTable[actionScript88 / 2] = entityAbsYTable[actionScript88 / 2];
}

/// $C0A0CA
void unknownC0A0CA(short arg1) {
	while (arg1 < 0) {}
	actionScript88 = cast(ushort)(arg1 * 2);
	unknownC0A0E3(actionScript88, arg1 < 0);
}

/// $C0A0E3
void unknownC0A0E3(short arg1, bool overflowed) {
	if ((entitySpriteMapFlags[arg1 / 2] < 0) || overflowed) {
		return;
	}
	actionScript8C = entitySpriteMapPointers[arg1 / 2];
	if (entityAnimationFrames[arg1 / 2] >= 0) {
		entityDrawCallbacks[arg1 / 2](entityAnimationFrames[arg1 / 2], arg1);
	}
}

/// $C0A0FA
void unknownC0A0FA(short arg1, short arg2) {
	unknown7E000B = actionScript8E;
	unknown7E2400 = entityDrawPriority[arg2 / 2];
	// This uses a double pointer to the spritemap, indexed by the animation frame.
	// Don't use the value in 8C!
	unknownC08C58(entitySpriteMapPointersDptr[arg2 / 2][arg1], entityAbsXTable[arg2 / 2], entityAbsYTable[arg2 / 2]);
}

/// $C0A11C
void checkHardware() {
	//AntiPiracyScratchSpace = 0x30;
	//AntiPiracyMirrorTest = 0x31;
	if (false/*AntiPiracyScratchSpace != AntiPiracyMirrorTest*/) {
		displayAntiPiracyScreen();
	}
	if ((STAT78 & 0x10) != 0) {
		displayFaultyGamepakScreen();
	}
}

/// $C0A1??
short unknownC0A156F(short x, short y) {
	return unknownC0A156(x, y);
}

/// $C0A156
short unknownC0A156(short x, short y) {
	if ((x | y) < 0) {
		return -1;
	}
	if ((x == unknown7E2888) && (y == unknown7E288A)) {
		return unknown7E288C;
	}
	unknown7E2888 = x;
	unknown7E288A = y;

	ushort tmp1 = mapDataTileTableChunksTable[8 + !!(y & 4)][((y / 8) * 256) | x];
	ushort x08;
	switch (y & 7) {
		case 3:
		case 7:
			tmp1 /= 4;
			goto case;
		case 2:
		case 6:
			tmp1 /= 4;
			goto case;
		case 1:
		case 5:
			tmp1 /= 4;
			goto case;
		case 0:
		case 4:
			x08 = (tmp1 & 3) * 256;
			break;
		default: assert(0);
	}
	ushort tmp = mapDataTileTableChunksTable[y & 7][((y / 8) * 256) | x];
	unknown7E288C = (cast(ubyte)tmp) | x08;
	return unknown7E288C;
}

unittest {
	if (mapDataTileTableChunksTable[0] != []) {
		assert(unknownC0A156(0xF8, 0x2C) == 0xA7);
	}
}

/// $C0A1F2
void unknownC0A1F2(short arg1) {
	const(ubyte)* source = cast(const(ubyte)*)unknownC0A20C[arg1];
	ubyte* destination = cast(ubyte*)&palettes[2][0];
	short bytesLeft = 0xBF;
	while (--bytesLeft >= 0) {
		*(destination++) = *(source++);
	}
	unknown7E0030 = 8;
}

__gshared const ubyte*[8] unknownC0A20C;

/// $C0A21C
short unknownC0A21C(short arg1) {
	short y = firstEntity;
	while (y >= 0) {
		if (arg1 == entityTPTEntries[y / 2]) {
			return arg1;
		}
		y = entityNextEntityTable[y / 2];
	}
	return 0;
}

/// $C0A254
void unknownC0A254(short arg1) {
	entityScreenXTable[arg1] = cast(short)(entityAbsXTable[arg1] - bg1XPosition);
	entityScreenYTable[arg1] = cast(short)(entityAbsYTable[arg1] - bg1YPosition);
}

/// $C0A26B
void unknownC0A26B() {
	if ((actionScript88 == unknown7E5D78) || ((entityScriptVar7Table[actionScript88 / 2] & 0) != 0) || (unknown7E5DB8 != 0) || (entityDirections[actionScript88 / 2] != unknown7E5D76) || (unknownC0A350[entityDirections[actionScript88 / 2]](unknown7E5D78) * 2 != 0)) {
		entityScreenXTable[actionScript88 / 2] = cast(short)(entityAbsXTable[actionScript88 / 2] - bg1XPosition);
		entityScreenYTable[actionScript88 / 2] = cast(short)(entityAbsYTable[actionScript88 / 2] - bg1YPosition);
	}
	//return actionScript88;
}

/// $C0A2AB
immutable short[6] unknownC0A2AB = [ 0, 17, 32, 47, 62, 77 ];

/// $C0A2B7
short unknownC0A2B7(short arg1) {
	short a = entityScreenXTable[arg1 / 2] ^ entityScreenXTable[actionScript88 / 2];
	if (a != 0) {
		return a;
	}
	a = cast(short)(entityAbsYTable[arg1 / 2] - entityAbsYTable[actionScript88 / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	a -= unknownC0A2AB[entityScriptVar5Table[actionScript88 / 2]];
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	if (a == 0) {
		return a;
	}
	return cast(short)(a - 1);
}

/// $C0A2E1
short unknownC0A2E1(short arg1) {
	short a = entityScreenYTable[arg1 / 2] ^ entityScreenYTable[actionScript88 / 2];
	if (a != 0) {
		return a;
	}
	a = cast(short)(entityAbsXTable[arg1 / 2] - entityAbsXTable[actionScript88 / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	a -= unknownC0A2AB[entityScriptVar5Table[actionScript88 / 2]];
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	if (a == 0) {
		return a;
	}
	return cast(short)(a - 1);
}

/// $C0A30B
immutable short[6] unknownC0A30B = [ 0, 11, 22, 32, 43, 54 ];

/// $C0A317
short unknownC0A317(short arg1) {
	short a = cast(short)(entityAbsXTable[arg1 / 2] - entityAbsXTable[actionScript88 / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	actionScript00s = a;
	if (actionScript00s < unknownC0A30B[entityScriptVar5Table[actionScript88 / 2]]) {
		return actionScript00s;
	}
	a = cast(short)(entityAbsYTable[arg1 / 2] - entityAbsYTable[actionScript88 / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	a -= actionScript00s;
	if (a == 0) {
		return a;
	}
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	return cast(short)(a - 1);
}

/// $C0A350
immutable short function(short)[8] unknownC0A350 = [
	&unknownC0A2B7,
	&unknownC0A317,
	&unknownC0A2E1,
	&unknownC0A317,
	&unknownC0A2B7,
	&unknownC0A317,
	&unknownC0A2E1,
	&unknownC0A317,
];

/// $C0A360
void unknownC0A360() {
	if (entityUnknown2C5E[actionScript88 / 2] >= 0) {
		if ((entityObstacleFlags[actionScript88 / 2] & 0xD0) != 0) {
			movementCode39(null);
			return;
		} else {
			if (entityCollidedObjects[actionScript88 / 2] >= 0) {
				return;
			} else {
				return unknownC0A37ACommon(actionScript88);
			}
		}
	} else {
		return unknownC0A37ACommon(actionScript88);
	}
}

/// $C0A37A
void unknownC0A37A() {
	unknownC0A37ACommon(actionScript88);
}

void unknownC0A37ACommon(short arg1) {
	unknownC09FAEEntry3(arg1);
	unknownC0C7DB();
}

/// $C0A384
void unknownC0A384() {
	if (entityUnknown2C5E[actionScript88 / 2] <= 0) {
		if ((entityObstacleFlags[actionScript88 / 2] & 0xD0) != 0) {
			movementCode39(null);
		} else {
			if (entityCollidedObjects[actionScript88 / 2] <= 0) {
				return;
				//some unreachable code here
			}
		}
	}
	unknownC09FAEEntry3(actionScript88);
}

/// $C0A3A4
// originally handwritten assembly, id was actually an offset
void unknownC0A3A4(short, short id) {
	if ((entityUnknown341A[id / 2].lsb & 1) != 0) {
		actionScript8C += entityUnknown2916[id / 2] / 5;
	}
	actionScript00 = 0x30;
	actionScript02 = 0x30;
	if ((entitySurfaceFlags[id / 2] & 1) != 0) {
		actionScript02 = 0x20;
	}
	if ((entitySurfaceFlags[id / 2] & 2) != 0) {
		actionScript00 = 0x20;
	}
	byte y = -1;
	for (ubyte i = entityUnknown2BE6[id / 2] >> 8; (--i & 0x80) == 0; ) {
		y++;
		(cast()actionScript8C[y]).flags = (actionScript8C[y].flags & 0xCF) | (actionScript00 & 0xFF);
	}
	for (ubyte i = entityUnknown2BE6[actionScript88 / 2] & 0xFF; (--i & 0x80) == 0; ) {
		y++;
		(cast()actionScript8C[y]).flags = (actionScript8C[y].flags & 0xCF) | (actionScript02 & 0xFF);
	}
	unknown7E000B = actionScript8E;
	unknown7E2400 = entityDrawPriority[actionScript88 / 2];
	short unknown7E2400Copy = unknown7E2400;
	if ((unknown7E2400 & 0x8000) != 0) {
		unknown7E2400 = entityDrawPriority[unknown7E2400Copy & 0x3F];
		if ((unknown7E2400 & 0x4000) == 0) {
			entityDrawPriority[actionScript88 / 2] = 0;
		}
	}
	unknownC0AC43();
	unknown7E000B = actionScript8E;
	unknownC08C58(actionScript8C, entityScreenXTable[actionScript88 / 2], entityScreenYTable[actionScript88 / 2]);
}

/// $C0A443
//what a mess
void unknownC0A443() {
	actionScript00 = (unknown7E2890 + currentEntitySlot >> 3) & 1;
	actionScript02 = cast(ubyte)((entityDirections[actionScript88 / 2] * 2) | actionScript00);
	if (((entityUnknown2C22[actionScript88 / 2] >> 8) | ((entityUnknown2C22[actionScript88 / 2] &0xFF) << 8) | actionScript02) == entityUnknown3456[actionScript88 / 2]) {
		return;
	}
	entityUnknown3456[actionScript88 / 2] = cast(short)((entityUnknown2C22[actionScript88 / 2] >> 8) | ((entityUnknown2C22[actionScript88 / 2] &0xFF) << 8) | actionScript02);

	unknownC0A443Unknown10();
}

/// $C0A472
void unknownC0A472() {
	unknown7E2892 = (unknown7E0002 >> 3) & 1;
	unknownC0A443Unknown10();
}
void unknownC0A443MovementEntry3() {
	unknownC0A443Unknown9(actionScript88);
}
void unknownC0A443Entry2(short arg1) {
	unknownC0A443Unknown9(cast(short)(arg1 * 2));
}
void unknownC0A443Unknown9(short arg1) {
	unknown7E2892 = entityAnimationFrames[arg1 / 2];
	unknownC0A443Entry4(arg1);
}
void unknownC0A443Entry3() {
	unknown7E2892 = 0;
	if (unknownC0C711() != 0) {
		unknownC0A443Unknown10();
	}
}
void unknownC0A443MovementEntry1() {
	unknown7E2892 = 1;
	if (unknownC0C711() != 0) {
		unknownC0A443Unknown10();
	}
}
void unknownC0A443MovementEntry2() {
	unknown7E2892 = 0;
	unknownC0A443Unknown10();
}
void unknownC0A443Unknown10() {
	unknownC0A443Entry4(actionScript88);
}
void unknownC0A443Entry4(short arg1) {
	actionScript08 = arg1;
	actionScript00 = cast(ubyte)(entityTileHeights[arg1 / 2]);
	dmaCopySize = entityByteWidths[arg1 / 2];
	dmaCopyVRAMDestination = entityVramAddresses[arg1 / 2];
	//x04 = EnttiyGraphicsPointerHigh[arg1 / 2]
	OverworldSpriteGraphics* x02 = entityGraphicsPointers[arg1 / 2];
	if (spriteDirectionMappings4Direction[entityDirections[arg1 / 2]] != 0) {
		for (short i = spriteDirectionMappings4Direction[entityDirections[arg1 / 2]]; i > 0; i--) {
			x02 += 2;
		}
	}
	if (unknown7E2892 != 0) {
		x02 += 1;
	}
	if (((x02.lsb & 2) == 0) && (entitySurfaceFlags[arg1 / 2] & 8) != 0) {
		unknown7E0091 = 3;
		dmaCopyRAMSource = &unknownC40BE8;
		unknownC0A56E();
		if (--actionScript00 == 0) {
			return;
		}
		if ((actionScript06 & 0x4) != 0) {
			unknownC0A56E();
			if (--actionScript00 == 0) {
				return;
			}
		}
	}
	entityUnknown341A[actionScript08 / 2] = x02;
	//Original code:
	//dmaCopyRAMSource = cast(void*)((*x02) & 0xFFF0);
	//dmaCopyRAMSource + 2 = UNKNOWN_30X2_TABLE_31[arg1 / 2];
	dmaCopyRAMSource = x02.data.ptr;
	unknown7E0091 = 0;
	while (true) {
		unknownC0A56E();
		if (--actionScript00 == 0) {
			return;
		}
		dmaCopyRAMSource += dmaCopySize;
	}
}

/// $C0A56E
void unknownC0A56E() {
	if (((((dmaCopySize / 2) + dmaCopyVRAMDestination - 1) ^ dmaCopyVRAMDestination) & 0x100) != 0) {
		const(void)* dmaCopyRAMSourceCopy = dmaCopyRAMSource;
		ushort dmaCopySizeCopy = dmaCopySize;
		ushort dmaCopyVRAMDestinationCopy = dmaCopyVRAMDestination;
		dmaCopySize = cast(ushort)((((dmaCopyVRAMDestination + 0x100) & 0xFF00) - dmaCopyVRAMDestination) * 2);
		copyToVRAMCommon();
		dmaCopyRAMSource += dmaCopySize;
		dmaCopyVRAMDestination = cast(ushort)(((dmaCopyVRAMDestination + 0x100) & 0xFF00) + 0x100);
		dmaCopySize = cast(ushort)(dmaCopySizeCopy - dmaCopySize);
		copyToVRAMCommon();
		dmaCopyVRAMDestination = dmaCopyVRAMDestinationCopy;
		dmaCopySize = dmaCopySizeCopy;
		dmaCopyRAMSource = dmaCopyRAMSourceCopy;
	} else {
		copyToVRAMCommon();
	}
	if ((dmaCopyVRAMDestination & 0x100) == 0) {
		dmaCopyVRAMDestination += 0x100;
		return;
	}
	if (((((((dmaCopySize + 0x20) & 0xFFC0) / 2) + dmaCopyVRAMDestination) ^ dmaCopyVRAMDestination) & 0x100) != 0) {
		dmaCopyVRAMDestination = cast(ushort)((((dmaCopySize + 0x20) & 0xFFC0) / 2) + dmaCopyVRAMDestination);
	} else {
		dmaCopyVRAMDestination = cast(ushort)((((dmaCopySize + 0x20) & 0xFFC0) / 2) + dmaCopyVRAMDestination - 0x100);
	}
}

/// $C0A60B
ushort[12] spriteDirectionMappings4Direction = [0, 0, 1, 2, 2, 2, 3, 0, 4, 5, 6, 7];

/// $C0A623
ushort[8] spriteDirectionMappings8Direction = [0, 4, 1, 5, 2, 6, 3, 7];

/// $C0A643
void unknownC0A643(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	entityTPTEntries[actionScript88 / 2] = setDirection(tmp, arg2);
}

/// $C0A651
short setDirection8(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead8(arg2);
	actionScript94 = arg2;
	entityUnknown1A86[actionScript88 / 2] = setDirection(tmp, arg2);
	return 0;
}

/// $C0A65F
short setDirection(short arg1, ref const(ubyte)*) {
	if (entityUnknown2C5E[actionScript88 / 2] >= 0) {
		entityDirections[actionScript88 / 2] = arg1;
	}
	return arg1;
}

/// $C0A66D
void unknownC0A66D(short arg1) {
	entityDirections[actionScript88 / 2] = arg1;
}

/// $C0A673
short unknownC0A673() {
	return entityDirections[actionScript88 / 2];
}

/// $C0A679
short setSurfaceFlags(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead8(arg2);
	actionScript94 = arg2;
	entitySurfaceFlags[actionScript88 / 2] = tmp;
	return 0;
}

/// $C0A685
void unknownC0A685(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC0A685Entry2(tmp, arg2);
}

/// $C0A685
void unknownC0A685Entry2(short arg1, ref const(ubyte)* arg2) {
	entityUnknown2B32[actionScript88 / 2] = arg1;
}

/// $C0A691
short unknownC0A691() {
	return entityUnknown2B32[actionScript88 / 2];
}

/// $C0A6A2
void unknownC0A6A2(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC0CA4E(tmp);
}

/// $C0A6AD
void unknownC0A6AD(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC0CBD3(tmp);
}

/// $C0A6B8
short unknownC0A6B8() {
	short tmp = 0;
	if (entityCollidedObjects[actionScript88 / 2] >= 0) {
		tmp--;
	}
	return tmp;
}

/// $C0A6DA
short clearCurrentEntityCollision(short, ref const(ubyte)* arg2) {
	entityCollidedObjects[actionScript88 / 2] = 0xFFFF;
	return 0;
}

/// $C0A6D1
short disableCurrentEntityCollision(short, ref const(ubyte)* arg2) {
	entityCollidedObjects[actionScript88 / 2] = 0x8000;
	return 0;
}

/// $C0A6E3
void unknownC0A6E3() {
	short a;
	unknown7E2896 = actionScript88;
	if (((entityUnknown2C22[actionScript88 / 2] >> 8) | entityDirections[actionScript88 / 2]) != entityUnknown3456[actionScript88 / 2]) {
		entityUnknown3456[actionScript88 / 2] = (entityUnknown2C22[actionScript88 / 2] >> 8) | entityDirections[actionScript88 / 2];
		return;
	}
	if (entityScriptVar7Table[actionScript88 / 2] < 0) {
		entityScriptVar7Table[actionScript88 / 2] &= 0x7FFF;
		goto Unknown5;
	}
	if ((entityScriptVar7Table[actionScript88 / 2] & 0x2000) != 0) {
		if (entityAnimationFrames[actionScript88 / 2] == 0) {
			goto Unknown6;
		} else {
			entityAnimationFrames[actionScript88 / 2] = 0;
			goto Unknown5;
		}
	}
	if (battleSwirlCountdown != 0) {
		goto Unknown6;
	}
	if (--entityScriptVar2Table[actionScript88 / 2] >= 0) {
		if (entityScriptVar2Table[actionScript88 / 2] != 0) {
			goto Unknown6;
		}
	}
	entityScriptVar2Table[actionScript88 / 2] = entityScriptVar3Table[actionScript88 / 2];
	entityAnimationFrames[actionScript88 / 2] ^= 2;
	if (entityAnimationFrames[actionScript88 / 2] != 0) {
		goto Unknown5;
	}
	if (actionScript88 == unknown7E2898) {
		goto Unknown5;
	}
	a = footstepSoundTable[(footstepSoundIDOverride == 0) ? footstepSoundID : footstepSoundIDOverride];
	if ((a != 0) && (unknown7EB4B6 == 0)) {
		playSfx(a);
	}
	Unknown5:
	unknownC0A794();
	Unknown6:
	if (teleportDestination != 0) {
		return;
	}
	if (unknown7E5D58 == 0) {
		return;
	}
	if (unknown7E5D58 < 45) {
		a = unknown7E5D58 & 3;
	} else if ((unknown7E5D58 & 1) == 0) {
		a = cast(short)(entitySpriteMapFlags[actionScript88 / 2] | 0x8000);
	} else {
		a = entitySpriteMapFlags[actionScript88 / 2] & 0x7FFF;
	}
	entitySpriteMapFlags[actionScript88 / 2] = a;
}

/// $C0A780
void unknownC0A780(short arg1) {
	unknown7E2896 = cast(short)(arg1 * 2);
	unknownC0A794();
}

/// $C0A794
void unknownC0A794() {
	ushort x00 = entityTileHeights[unknown7E2896 / 2];
	dmaCopySize = entityByteWidths[unknown7E2896 / 2];
	dmaCopyVRAMDestination = entityVramAddresses[unknown7E2896 / 2];
	const(OverworldSpriteGraphics)* x02 = (entityGraphicsPointers[unknown7E2896 / 2] + spriteDirectionMappings8Direction[entityDirections[unknown7E2896 / 2]] * 2 + entityAnimationFrames[unknown7E2896 / 2] / 2);
	if (((x02.lsb & 2) == 0) && ((entitySurfaceFlags[unknown7E2896 / 2] & 8) != 0)) {
		unknown7E0091 = 3;
		dmaCopyRAMSource = &unknownC40BE8;
		unknownC0A56E();
		if (--x00 == 0) {
			return;
		}
		if ((entitySurfaceFlags[unknown7E2896 / 2] & 4) != 0) {
			unknownC0A56E();
			x00--;
			return;
		}
	}
	entityUnknown341A[unknown7E2896 / 2] = x02;
	//TODO: figure this out too
	//dmaCopyRAMSource = (*x02) & 0xFFFE;
	unknown7E0091 = 0;
	//dmaCopyRAMSource + 2= UNKNOWN_30X2_TABLE_31[unknown7E2896 / 2];
	dmaCopyRAMSource = x02.data.ptr;
	while (true) {
		unknownC0A56E();
		if (--x00 == 0) {
			break;
		}
		dmaCopyRAMSource += dmaCopySize;
	}
}

/// $C0A82F
short disableCurrentEntityCollision2(short, ref const(ubyte)* arg2) {
	entityCollidedObjects[actionScript88 / 2] = 0x8000;
	return 0;
}

/// $C0A838
short clearCurrentEntityCollision2(short, ref const(ubyte)* arg2) {
	entityCollidedObjects[actionScript88 / 2] = 0xFFFF;
	return 0;
}

/// $C0A841
void unknownC0A841(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	return playSfx(tmp);
}

/// $C0A84C
short unknownC0A84C(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	return getEventFlag(tmp);
}

/// $C0A857
void unknownC0A857(short arg1, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	setEventFlag(tmp, arg1);
}

/// $C0A864
void unknownC0A864(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead8(arg2);
	actionScript94 = arg2;
	unknownC46C9B(tmp);
}

/// $C0A86F
void unknownC0A86F(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC46CC7(tmp);
}

/// $C0A87A
void unknownC0A87A(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC46CF5(tmp2, tmp);
}

/// $C0A88D
void unknownC0A88D(short, ref const(ubyte)* arg2) {
	const(ubyte)* tmp = cast(const(ubyte)*)movementDataReadPtr(arg2);
	actionScript94 = arg2;
	unknownC46E4F(tmp);
}

/// $C0A8A0
void unknownC0A8A0(short, ref const(ubyte)* arg2) {
	const(ubyte)* tmp = cast(const(ubyte)*)movementDataReadPtr(arg2);
	actionScript94 = arg2;
	unknownC466F0(tmp);
}

/// $C0A8B3
void unknownC0A8B3(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC46C5E(tmp2, tmp);
}

/// $C0A8C6
short unknownC0A8C6() {
	return unknownC47143(0, 0);
}

/// $C0A8D1
short unknownC0A8D1() {
	return unknownC47143(1, 0);
}

/// $C0A8DC
short unknownC0A8DC() {
	return unknownC47143(0, 1);
}

/// $C0A8E7
void unknownC0A8E7() {
	unknownC472A8(0);
}

/// $C0A8F7
short actionScriptPrepareNewEntityAtSelf(short, ref const(ubyte)* arg2) {
	prepareNewEntityAtExistingEntityLocation(0);
	return 0;
}

/// $C0A8FF
short actionScriptPrepareNewEntityAtPartyLeader(short, ref const(ubyte)* arg2) {
	prepareNewEntityAtExistingEntityLocation(1);
	return 0;
}

/// $C0A907
short actionScriptPrepareNewEntityAtTeleportDestination(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead8(arg2);
	actionScript94 = arg2;
	prepareNewEntityAtTeleportDestination(tmp);
	return 0;
}

/// $C0A912
short actionScriptPrepareNewEntity(short, ref const(ubyte)* arg1) {
	short tmp = movementDataRead16(arg1);
	actionScript94 = arg1;
	short tmp2 = movementDataRead16(arg1);
	actionScript94 = arg1;
	short tmp3 = movementDataRead8(arg1);
	actionScript94 = arg1;
	prepareNewEntity(tmp3, tmp, tmp2);
	return 0;
}

/// $C0A92D
void unknownC0A92D(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC46B8D(tmp);
}

/// $C0A938
void unknownC0A938(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC46BBB(tmp);
}

/// $C0A943
short actionScriptGetPositionOfPartyMember(short, ref const(ubyte)* arg1) {
	short tmp1 = movementDataRead8(arg1);
	actionScript94 = arg1;
	getPositionOfPartyMember(tmp1);
	return 0;
}

/// $C0A94E
void unknownC0A94E(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC46984(tmp);
}

/// $C0A959
void unknownC0A959(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC469F1(tmp);
}

/// $C0A964
void unknownC0A964(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC47225(tmp, tmp2);
}

/// $C0A977
short movementLoadBattleBG(short, ref const(ubyte)* arg1) {
	short tmp = movementDataRead16(arg1);
	actionScript94 = arg1;
	short tmp2 = movementDataRead16(arg1);
	actionScript94 = arg1;
	loadBackgroundAnimation(tmp, tmp2);
	return 0;
}

/// $C0A98B
short unknownC0A98B(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead16(arg2);
	actionScript94 = arg2;
	return unknownC46534(tmp, tmp2);
}

/// $C0A99F
short unknownC0A99F(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead16(arg2);
	actionScript94 = arg2;
	return unknownC4ECAD(tmp, tmp2);
}

/// $C0A9B3
void unknownC0A9B3(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp3 = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC4EBAD(tmp, tmp2, tmp3);
}

/// $C0A9CF
void unknownC0A9CF(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp3 = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC4EC05(tmp, tmp2, tmp3);
}

/// $C0A9EB
void unknownC0A9EB(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp3 = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC4EC52(tmp, tmp2, tmp3);
}

/// $C0AA23
void unknownC0AA23(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp3 = movementDataRead16(arg2);
	actionScript94 = arg2;
	unknownC47765(tmp, tmp2, tmp3);
}

/// $C0AA3F
void unknownC0AA3F(short arg1, ref const(ubyte)* arg2) {
	short x = (--arg1 == 0) ? 0x33 : 0xB3;
	unknown7E9E37 = cast(ubyte)movementDataRead8(arg2);
	actionScript94 = arg2;
	unknown7E9E38 = cast(ubyte)movementDataRead8(arg2);
	actionScript94 = arg2;
	unknown7E9E39 = cast(ubyte)movementDataRead8(arg2);
	actionScript94 = arg2;
	unknownC42439(x);
}

/// $C0AA6E
void unknownC0AA6E(short, ref const(ubyte)* arg2) {
	if (entityScriptVar0Table[actionScript88 / 2] == 0) {
		entityDirections[actionScript88 / 2] = cast(ubyte)movementDataRead8(arg2);
		actionScript94 = arg2;
		unknown7E2892 = entityAnimationFrames[actionScript88 / 2] = cast(ubyte)movementDataRead8(arg2);
		actionScript94 = arg2;
		unknownC0A443Entry4(actionScript88);
	} else {
		entityDirections[actionScript88 / 2] = cast(ubyte)movementDataRead8(arg2);
		actionScript94 = arg2;
		entityAnimationFrames[actionScript88 / 2] = cast(ubyte)(movementDataRead8(arg2) * 2);
		actionScript94 = arg2;
		unknown7E2896 = actionScript88;
		unknownC0A794();
	}
}

/// $C0AAAC
void unknownC0AAAC() {
	unknown7E2896 = actionScript88;
	unknownC0A794();
}

/// $C0AAB5
void unknownC0AAB5(short, ref const(ubyte)* arg2) {
	short tmp = movementDataRead16(arg2);
	actionScript94 = arg2;
	short tmp2 = movementDataRead8(arg2);
	actionScript94 = arg2;
	short tmp3 = movementDataRead8(arg2);
	actionScript94 = arg2;
	unknownC497C0(tmp3, tmp2, tmp);
}

/// $C0AACD
short unknownC0AACD() {
	return 2;
}

/// $C0AAD5
void unknownC0AAD5(short, ref const(ubyte)* arg2) {
	actionScript90 = cast(short)(movementDataRead8(arg2) + 1);
	actionScript94 = arg2;
	actionScript92 = cast(const(ubyte)*)movementDataReadPtr(arg2);
	actionScript94 = arg2;
	//offset is just an estimate...
	if (actionScript84[4].counter == 0) {
		actionScript84[4].counter = cast(ubyte)actionScript90;
	}
	if (--actionScript84[4].counter != 0) {
		actionScript94 = actionScript92;
	}
}

/// $C0AAFD
void unknownC0AAFD() {
	//offset is just an estimate...
	actionScript84[4].counter = 0;
}

/// $C0AA07
void actionScriptFadeOutWithMosaic(short, ref const(ubyte)* arg1) {
	short tmp1 = movementDataRead16(arg1);
	actionScript94 = arg1;
	short tmp2 = movementDataRead16(arg1);
	actionScript94 = arg1;
	short tmp3 = movementDataRead16(arg1);
	actionScript94 = arg1;
	fadeOutWithMosaic(tmp1, tmp2, tmp3);
}

/// $C0ABA8
void waitForSPC700() {
	version(audio) {
		APUIO2 = 0;
		APUIO0 = 0;
		do {
			APUIO0 = 0xFF;
			APUIO1 = 0x00;
		} while ((APUIO0 != 0xAA) || (APUIO1 != 0xBB));
	}
}

/// $C0ABC6
void stopMusic() {
	version(audio) {
		APUIO0 = 0;
		while (unknownC0AC20() != 0) {}
		currentMusicTrack = 0xFFFF;
	}
}

/// $C0ABBD
void unknownC0ABBD(short arg1) {
	APUIO0 = cast(ubyte)arg1;
}

/// $C0ABC6
//original version had separate bank/addr parameters
void loadSPC700Data(const(ubyte)* data) {
	version(audio) {
		spcDataPointer = data;
		//unknown7E00C8 = bank;
		ushort y = 0;
		ubyte b;
		if ((APUIO0 != 0xAA) || (APUIO1 != 0xBB)) {
			waitForSPC700();
		}
		unknown7E001E &= 0x7F;
		NMITIMEN = unknown7E001E;
		ubyte a = 0xCC;
		ushort x;
		// proceed at your own peril.
		// definitely going to have to triple check this one later
		goto l7;
		l1:
			b = spcDataPointer[y++];
			a = 0;
			goto l4;
		l2:
			b = spcDataPointer[y++];
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
			if (spcDataPointer[y] != 0) {
				a = 0;
				b = 5;
			} else {
				y += 2;
				a = spcDataPointer[y];
				b = spcDataPointer[y + 1];
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
			unknown7E001E |= 0x80;
			NMITIMEN = unknown7E001E;
	}
}

/// $C0ABE0 - Play a sound effect
void playSfx(short sfx) {
	if (sfx != 0) {
		soundEffectQueue[soundEffectQueueEndIndex] = cast(ubyte)(sfx | unknown7E1ACA);
		soundEffectQueueEndIndex = (soundEffectQueueEndIndex + 1) & 7;
		unknown7E1ACA ^= 0x80;
		return;
	}
	playSfxUnknown();
}
void playSfxUnknown() {
	APUIO3 = 0x57;
}

/// $C0AC0C
void unknownC0AC0C(short arg1) {
	APUIO1 = cast(ubyte)(arg1 | unknown7E1ACB);
	unknown7E1ACB ^= 0x80;
}

/// $C0AC20
ubyte unknownC0AC20() {
	return APUIO0;
}

/// $C0AC2C
immutable ubyte[14] stereoMonoData = [
	0x01, 0x00, 0x31, 0x04, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x31, 0x04, 0x01, 0x00, 0x00,
];

/// $C0AC3A
void unknownC0AC3A(short arg1) {
	APUIO2 = cast(ubyte)arg1;
}

/// $C0AC43
void unknownC0AC43() {
	unknown7E000B = 0xC4;
	actionScript04 = 0xC4;
	actionScript00 = ((entitySurfaceFlags[actionScript88 / 2] & 1) != 0) ? 5 : 0;
	switch (entitySurfaceFlags[actionScript88 / 2] & 0xC) {
		default:
			if (entityByteWidths[actionScript88 / 2] == 0x40) {
				actionScript02Overlay = entityRippleOverlayPtrs[actionScript88 / 2];
				if (entityUnknown305A[actionScript88 / 2] == 0) {
					entityRippleOverlayPtrs[actionScript88 / 2] = unknownC0AD56(&entityUnknown3096[0], entityUnknown305A[actionScript88 / 2]);
				}
				entityUnknown305A[actionScript88 / 2]--;
				actionScript06 = entityScreenXTable[actionScript88 / 2];
				unknownC08C58(entityUnknown3096[actionScript88 / 2] + actionScript00, entityScreenXTable[actionScript88 / 2], entityScreenYTable[actionScript88 / 2]);
			} else {
				actionScript02Overlay = entityBigRippleOverlayPtrs[actionScript88 / 2];
				if (entityUnknown310E[actionScript88 / 2] == 0) {
					entityBigRippleOverlayPtrs[actionScript88 / 2] = unknownC0AD56(&entityUnknown314A[0], entityUnknown310E[actionScript88 / 2]);
				}
				entityUnknown310E[actionScript88 / 2]--;
				actionScript06 = entityScreenXTable[actionScript88 / 2];
				unknownC08C58(entityUnknown314A[actionScript88 / 2] + actionScript00 + actionScript00, entityScreenXTable[actionScript88 / 2], cast(short)(entityScreenYTable[actionScript88 / 2] + 8));
			}
			goto case;
		case 0:
			if (entityUnknown2E7A[actionScript88 / 2] != 0) {
				return;
			}
			if ((entityUnknown2E7A[actionScript88 / 2] & 0x80) == 0) {
				break;
			}
			goto case;
		case 4:
			if (actionScript88 >= 46) {
				return;
			}
			actionScript02Overlay = entitySweatingOverlayPtrs[actionScript88 / 2];
			if (entityUnknown2FA6[actionScript88 / 2] == 0) {
				entitySweatingOverlayPtrs[actionScript88 / 2] = unknownC0AD56(&entityUnknown2FE2[0], entityUnknown2FA6[actionScript88 / 2]);
			}
			entityUnknown2FA6[actionScript88 / 2]--;
			actionScript06 = entityScreenXTable[actionScript88 / 2];
			if (entityUnknown2FE2[actionScript88 / 2] is null) {
				break;
			}
			unknownC08C58(entityUnknown2FE2[actionScript88 / 2] + actionScript00, entityScreenXTable[actionScript88 / 2], entityScreenYTable[actionScript88 / 2]);
			break;
	}
	if ((entityUnknown2E7A[actionScript88 / 2] & 0x4000) == 0) {
		return;
	}
	if (actionScript88 >= 46) {
		return;
	}
	actionScript02Overlay = entityMushroomizedOverlayPtrs[actionScript88 / 2];
	if (entityUnknown2EF2[actionScript88 / 2] == 0) {
		entityMushroomizedOverlayPtrs[actionScript88 / 2] = unknownC0AD56(&entityUnknown2F2E[0], entityUnknown2EF2[actionScript88 / 2]);
	}
	entityUnknown2EF2[actionScript88 / 2]--;
	actionScript06 = entityScreenXTable[actionScript88 / 2];
	unknownC08C58(entityUnknown2F2E[actionScript88 / 2] + actionScript00, entityScreenXTable[actionScript88 / 2], entityScreenYTable[actionScript88 / 2]);
}

/// $C0AD56
const(OverlayScript)* unknownC0AD56(const(SpriteMap)** arg1, out ushort frames) {
	ushort y = 0;
	NextCommand:
	if (actionScript02Overlay[y].command == 1) {
		arg1[actionScript88 / 2] = actionScript02Overlay[y++].spriteMap;
		goto NextCommand;
	}
	if (actionScript02Overlay[y].command == 3) {
		actionScript02Overlay = actionScript02Overlay[y++].dest;
		goto NextCommand;
	}
	frames = actionScript02Overlay[y++].frames;
	actionScript08 = y;
	return &actionScript02Overlay[y];
}

/// $C0AD9F
void unknownC0AD9F() {
	BG3VOFS = bg3YPosition & 0xFF;
	BG3VOFS = (bg3YPosition >> 8) & 0xFF;
}

/// $C0ADB2
void doBackgroundDMA(short arg1, short arg2, short arg3) {
	dmaChannels[arg1].BBAD = dmaTargetRegisters[arg2];
	dmaChannels[arg1].DMAP = 0x42;
	ubyte* a;
	if (arg3 == 0) {
		short x = 6;
		do {
			// The original game code does 16-bit copy here, which copies
			// one byte too many. Do one byte at a time instead.
			unknown7E3C32[x] = unknownC0AE26[x];
			x -= 1;
		} while (x >= 0);
		a = &unknown7E3C32[0];
	} else {
		short x = 6;
		do {
			unknown7E3C3C[x] = unknownC0AE2D[x];
			x -= 1;
		} while (x >= 0);
		a = &unknown7E3C3C[0];
	}
	dmaChannels[arg1].A1T = a;
	mirrorHDMAEN |= dmaFlags[arg1];
}

/// $C0AE16
immutable ubyte[7] dmaFlags = [ 1 << 0, 1 << 1, 1 << 2, 1 << 3, 1 << 4, 1 << 5, 1 << 6];

/// $C0AE26
immutable ubyte[7] unknownC0AE26 = [ 0xE4, 0x46, 0x3C, 0xFC, 0x0E, 0x3D, 0x00 ];

/// $C0AE2D
immutable ubyte[7] unknownC0AE2D = [ 0xE4, 0x06, 0x3E, 0xFC, 0xCE, 0x3E, 0x00 ];

/// $C0AE1D
// WMDATA, BG1HOFS, BG2HOFS, BG3HOFS, BG4HOFS, BG1VOFS, BG2VOFS, BG3VOFS, BG4VOFS
immutable ubyte[9] dmaTargetRegisters = [ 0x80, 0x0D, 0x0F, 0x11, 0x13, 0x0E, 0x10, 0x12, 0x14 ];

/// $C0AE34
void unknownC0AE34(short arg1) {
	mirrorHDMAEN &= unknownC0AE44[arg1];
}

/// $C0AE44
immutable ubyte[8] unknownC0AE44 = [0xFE, 0xFD, 0xFB, 0xF7, 0xEF, 0xDF, 0xBF, 0x7F];

/// $C0AE4C
void loadBackgroundOffsetParameters(short arg1, short arg2, short arg3) {
	unknown7E1ACC = arg1;
	unknown7E1ACE = arg2;
	unknown7E1AD2 = arg3;
}

/// $C0AE56
void loadBackgroundOffsetParameters2(short arg1) {
	unknown7E1AD4 = arg1;
}

/// $C0AE5A
void prepareBackgroundOffsetTables(short arg1, short arg2, short arg3) {
	short x00 = arg1;
	ubyte x02 = 0;
	ubyte x03 = cast(ubyte)arg3;
	short a = 0;
	short x = 0x1C0;
	short y;
	short x05;
	if (unknown7E1AD2 != 0) {
		a = 0x1C0;
		x = 0x380;
	}
	short x07 = a;
	short x09 = x;
	if (unknown7E1ACC >= 2) {
		if (unknown7E1ACC == 2) {
			goto Unknown7;
		} else {
			goto Unknown10;
		}
	}
	if (unknown7E1ACE != 0) {
		switch (unknown7E1ACE - 1) {
			case 0:
				x03 += bg1YPosition;
				x05 = bg1XPosition;
				break;
			case 1:
				x03 += bg2YPosition;
				x05 = bg2XPosition;
				break;
			case 2:
				x03 += bg3YPosition;
				x05 = bg3XPosition;
				break;
			case 3:
				x03 += bg4YPosition;
				x05 = bg4XPosition;
				break;
			default: break;
		}
	} else {
		x05 = unknown7E1ACE;
	}
	if (unknown7E1ACC == 0) {
		y = x07;
		do {
			unknown7E3C46[y / 2] = cast(ushort)(((arg2 * sineLookupTable[x03]) >> 8) + x05);
			x02 += x00;
			y += 2;
		} while (y < x09);
		return;
	} else {
		y = x07;
		do {
			unknown7E3C46[y / 2] = cast(ushort)(((arg2 * sineLookupTable[x03]) >> 8) + x05);
			x02 += x00;
			unknown7E3C46[y / 2 + 1] = cast(ushort)(x05 - ((arg2 * sineLookupTable[x03]) >> 8));
			x02 += x00;
			y += 4;
		} while (y < x09);
		return;
	}
	Unknown7:
	if (unknown7E1ACE != 0) {
		switch (unknown7E1ACE - 1) {
			case 0:
				x05 = bg1YPosition;
				break;
			case 1:
				x05 = bg2YPosition;
				break;
			case 2:
				x05 = bg3YPosition;
				break;
			case 3:
				x05 = bg4YPosition;
				break;
			default: break;
		}
	} else {
		x05 = unknown7E1ACE;
	}
	x05 = cast(ushort)(x05 << 8);
	y = x07;
	do {
		x05 += unknown7E1AD4;
		unknown7E3C46[y / 2] = cast(ushort)((cast(ushort)x05 >> 8) + ((arg2 * sineLookupTable[x03]) >> 8));
		x02 += x00;
		y += 2;
	} while (y < x09);
	return;
	Unknown10:
	if (unknown7E1ACE != 0) {
		switch (unknown7E1ACE - 1) {
			case 0:
				x05 = bg1YPosition;
				break;
			case 1:
				x05 = bg2YPosition;
				break;
			case 2:
				x05 = bg3YPosition;
				break;
			case 3:
				x05 = bg4YPosition;
				break;
			default: break;
		}
	} else {
		x05 = unknown7E1ACE;
	}
	x05 = cast(ushort)(x05 << 8);
	y = x07;
	do {
		x05 += unknown7E1AD4;
		unknown7E3C46[y / 2] = cast(ushort)((cast(ushort)x05 >> 8) + ((arg2 * sineLookupTable[x03]) >> 8));
		x05 += unknown7E1AD4;
		unknown7E3C46[y / 2 + 1] = cast(ushort)((cast(ushort)x05 >> 8) - ((arg2 * sineLookupTable[x03]) >> 8));
		x02 += x00;
		y += 4;
	} while (y < x09);
	return;
}

/// $C0AFCD
void unknownC0AFCD(short arg1) {
	mirrorTM = unknownC0AFF1[arg1];
	mirrorTD = unknownC0AFFC[arg1];
	CGWSEL = unknownC0B006[arg1];
	CGADSUB = unknownC0B010[arg1];
}

/// $C0AFF1
immutable ubyte[11] unknownC0AFF1 = [0x17, 0x1F, 0x17, 0x17, 0x17, 0x17, 0x15, 0x15, 0x15, 0x15, 0x15];

/// $C0AFFC
immutable ubyte[10] unknownC0AFFC = [0x00, 0x00, 0x08, 0x08, 0x08, 0x08, 0x02, 0x02, 0x02, 0x02];

/// $C0B006
immutable ubyte[10] unknownC0B006 = [0x00, 0x00, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02];

/// $C0B010
immutable ubyte[10] unknownC0B010 = [0x00, 0x00, 0x24, 0x64, 0xA4, 0xE4, 0x21, 0x61, 0xA1, 0xE1];

/// $C0B01A
void setColData(ubyte red, ubyte green, ubyte blue) {
	FIXED_COLOUR_DATA = (red & 0x1F) | 0x20;
	FIXED_COLOUR_DATA = (green & 0x1F) | 0x40;
	FIXED_COLOUR_DATA = (blue & 0x1F) | 0x80;
}

/// $C0B039
void setColourAddSubMode(ubyte cgwsel, ubyte cgadsub) {
	CGWSEL = cgwsel;
	CGADSUB = cgadsub;
}

/// $C0B047
void setWindowMask(ushort arg1, ushort arg2) {
	W12SEL = unknownC0B0A6[arg1 & 3] & ((arg2 != 0) ? 0xAA : 0xFF);
	W34SEL = unknownC0B0A6[(arg1>>2) & 3] & ((arg2 != 0) ? 0xAA : 0xFF);
	WOBJSEL = unknownC0B0A6[(arg1>>4) & 3] & ((arg2 != 0) ? 0xAA : 0xFF);
	TMW = arg1 & 0x1F;
	TSW = arg1 & 0x1F;
	WBGLOG = (arg2 != 0) ? 0 : 0x55;
	WOBJLOG = (arg2 != 0) ? 0 : 0x55;
}

/// $C0B0A6
immutable ubyte[4] unknownC0B0A6 = [0x00, 0x0F, 0xF0, 0xFF];

/// $C0B0AA
void unknownC0B0AA() {
	WH0 = 0xFF;
	WH2 = 0xFF;
}

/// $C0B0B8
void unknownC0B0B8(short arg1, const(ubyte)* arg2) {
	//dmaChannels[arg1].A1B = bank of arg2;
	//dmaChannels[arg1].DASB = bank of arg2;
	dmaChannels[arg1].BBAD = 0x26;
	dmaChannels[arg1].DMAP = *arg2;
	dmaChannels[arg1].A1T = &arg2[1];
	mirrorHDMAEN |= dmaFlags[arg1];
}

/// $C0B0EF
void enableAttractModeWindowHDMA(ubyte arg1, ubyte arg2) {
	// Write the table entry for the first 100 lines of window data
	attractModeWindowHDMATable[0].count = 100 | 0x80;
	attractModeWindowHDMATable[0].ptr = &attractModeWindowHDMAData[0];
	// Write the table entry for the 124 remaining lines of window data
	attractModeWindowHDMATable[1].count = 124 | 0x80;
	attractModeWindowHDMATable[2].count = 0;
	//dmaChannels[arg1].A1B = 0x7E;
	//dmaChannels[arg1].DASB = 0x7E;
	dmaChannels[arg1].BBAD = 0x26;
	dmaChannels[arg1].DMAP = arg2;
	// Depending on whether we are writing to windows 1 and 2 (4 bytes) or just window 1 (2 bytes),
	// skip ahead in the buffer by 400 or 200 bytes (100 lines)
	attractModeWindowHDMATable[1].ptr = ((arg2 & 4) != 0) ? (&attractModeWindowHDMAData[400]) : (&attractModeWindowHDMAData[200]);
	dmaChannels[arg1].A1T = &attractModeWindowHDMATable;
	mirrorHDMAEN |= dmaFlags[arg1];
}

/// $C0B149
void unknownC0B149(short arg1, short arg2, short arg3, short arg4) {
	if (/+(arg2 > 0) && (+/arg2 >= 0x70) {
		short y = 0;
		short a = cast(short)(arg2 - arg4);
		if (a > 0) {
			do {
				*cast(ushort*)&attractModeWindowHDMAData[y] = 0xFF;
				y += 2;
			} while(--a != 0);
			a = 0;
		}
		short x0A = cast(short)(a + arg4);
		short x0C;
		while (true) {
			short x08 = (a == 0) ? arg3 : ((0x80 + arg3 * unknownC0B2FF[cast(ushort)x0A / cast(ubyte)arg4]) >> 8);
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
			*cast(ushort*)&attractModeWindowHDMAData[y] = a;
			x0C = cast(short)(x0A * 4);
			if (y + x0C < 0x1C0) {
				*cast(ushort*)&attractModeWindowHDMAData[y + x0C] = a;
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
				*cast(ushort*)&attractModeWindowHDMAData[y] = 0xFF;
				y += 2;
			} while (y < 0x1C0);
		}
	} else {
		short y = 0x1BE;
		short a = 0xE0;
		a = cast(short)(a - arg2 - arg4);
		if (a > 0) {
			do {
				*cast(ushort*)&attractModeWindowHDMAData[y] = 0xFF;
				y -= 2;
			} while (--a != 0);
			a = 0;
		}
		short x0A = cast(short)(a + arg4);
		short x0C;
		while (true) {
			short x08 = (a == 0) ? arg3 : ((0x80 + arg3 * unknownC0B2FF[cast(ushort)x0A / cast(ubyte)arg4]) >> 8);
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
			*cast(ushort*)&attractModeWindowHDMAData[y] = a;
			x0C = cast(short)(x0A * 4);
			if (y - x0C >= 0) {
				*cast(ushort*)&attractModeWindowHDMAData[y - x0C] = a;
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
				attractModeWindowHDMAData[y] = 0xFF;
				y -= 2;
			} while (y >= 0);
		}
	}
}

/// $C0B2FF
immutable byte[256] unknownC0B2FF = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -3, -3, -3, -3, -3, -3, -3, -4, -4, -4, -4, -4, -5, -5, -5, -5, -5, -6, -6, -6, -6, -6, -7, -7, -7, -7, -8, -8, -8, -8, -9, -9, -9, -9, -10, -10, -10, -11, -11, -11, -12, -12, -12, -12, -13, -13, -13, -14, -14, -15, -15, -15, -16, -16, -16, -17, -17, -17, -18, -18, -19, -19, -20, -20, -20, -21, -21, -22, -22, -23, -23, -23, -24, -24, -25, -25, -26, -26, -27, -27, -28, -28, -29, -29, -30, -30, -31, -31, -32, -33, -33, -34, -34, -35, -35, -36, -37, -37, -38, -38, -39, -40, -40, -41, -42, -42, -43, -44, -44, -45, -46, -46, -47, -48, -49, -49, -50, -51, -52, -52, -53, -54, -55, -55, -56, -57, -58, -59, -59, -60, -61, -62, -63, -64, -65, -65, -66, -67, -68, -69, -70, -71, -72, -73, -74, -75, -76, -77, -78, -79, -80, -81, -82, -83, -84, -86, -87, -88, -89, -90, -91, -93, -94, -95, -96, -97, -99, -100, -101, -103, -104, -105, -107, -108, -110, -111, -113, -114, -116, -117, -119, -120, -122, -123, -125, -127, 127, 126, 124, 122, 120, 118, 116, 114, 112, 110, 108, 106, 104, 102, 99, 97, 94, 92, 89, 86, 83, 81, 77, 74, 71, 67, 63, 59, 55, 50, 45, 39, 32, 23];

/// $C0B425
immutable byte[256] sineLookupTable = [0, 3, 6, 9, 12, 15, 18, 21, 24, 28, 31, 34, 37, 40, 43, 46, 48, 51, 54, 57, 60, 63, 65, 68, 71, 73, 76, 78, 81, 83, 85, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 109, 111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 124, 125, 126, 126, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 126, 126, 125, 124, 124, 123, 122, 121, 120, 119, 118, 117, 115, 114, 112, 111, 109, 108, 106, 104, 102, 100, 98, 96, 94, 92, 90, 88, 85, 83, 81, 78, 76, 73, 71, 68, 65, 63, 60, 57, 54, 51, 48, 46, 43, 40, 37, 34, 31, 28, 24, 21, 18, 15, 12, 9, 6, 3, 0, -3, -6, -9, -12, -15, -18, -21, -24, -28, -31, -34, -37, -40, -43, -46, -48, -51, -54, -57, -60, -63, -65, -68, -71, -73, -76, -78, -81, -83, -85, -88, -90, -92, -94, -96, -98, -100, -102, -104, -106, -108, -109, -111, -112, -114, -115, -117, -118, -119, -120, -121, -122, -123, -124, -124, -125, -126, -126, -127, -127, -127, -127, -127, -127, -127, -127, -127, -127, -127, -126, -126, -125, -124, -124, -123, -122, -121, -120, -119, -118, -117, -115, -114, -112, -111, -109, -108, -106, -104, -102, -100, -98, -96, -94, -92, -90, -88, -85, -83, -81, -78, -76, -73, -71, -68, -65, -63, -60, -57, -54, -51, -48, -46, -43, -40, -37, -34, -31, -28, -24, -21, -18, -15, -12, -9, -6, -3];

/// $C0B400
short cosine(short arg1, short arg2) {
	return cosineSine(arg1, cast(short)(arg2 - 0x40));
}

/// $C0B40B
short cosineSine(short arg1, short arg2) {
	return (arg1 * sineLookupTable[arg2]) >> 8;
}

/// $C0B525
void fileSelectInit() {
	prepareForImmediateDMA();
	unknownC0927C();
	oamClear();
	updateScreen();
	unknownC01A86();
	allocSpriteMem(-32768, 0);
	initializeMiscObjectData();
	overworldSetupVRAM();
	unknownC432B1();
	unknownC005E7();
	memcpy(&palettes[8][0], spriteGroupPalettes.ptr, 0x100);
	unknownC200D9();
	copyToVRAM(3, 0x800, 0x7C00, unknown7F0000.ptr);
	decomp(textWindowGraphics.ptr, unknown7F0000.ptr);
	memcpy(&unknown7F0000[0x2000], &unknown7F0000[0x1000], 0x2A00);
	unknownC44963(1);
	memcpy(&palettes[0][0], textWindowFlavourPalettes.ptr, 0x40);
	debug(nofileselect) {} else {
		loadBackgroundAnimation(BackgroundLayer.fileSelect, 0);
	}
	entityAllocationMinSlot = 0x17;
	entityAllocationMaxSlot = 0x18;
	initEntity(ActionScript.unknown787, 0, 0);
	mirrorTM = 0x16;
	bg2YPosition = 0;
	bg1YPosition = 0;
	bg2XPosition = 0;
	bg1XPosition = 0;
	oamClear();
	updateScreen();
	fadeIn(1, 1);
	unknownC1FF6B();
	fadeOutWithMosaic(1, 1, 0);
	unknownC09C35(0x17);
	mirrorTM = 0x17;
	unknownC4FD18(gameState.soundSetting - 1);
}

/// $C0B65F
void unknownC0B65F(short arg1, short arg2) {
	tracef("Setting coordinates to %s, %s", arg1, arg2);
	gameState.leaderX.integer = arg1;
	gameState.leaderY.integer = arg2;
	gameState.leaderDirection = 2;
	gameState.partyMembers[0] = 1;
	entityScreenXTable[24] = arg1;
	entityScreenYTable[24] = arg2;
}

/// $C0B67F
void unknownC0B67F() {
	unknownC0927C();
	unknownC01A86();
	allocSpriteMem(short.min, 0);
	initializeMiscObjectData();
	battleDebug = 0;
	inputDisableFrameCounter = 0;
	unknown7E4A58 = 1;
	unknown7E4A5A = -1;
	unknown7E4A5E = 10;
	battleSwirlCountdown = 0;
	unknown7E5D9A = 0;
	setBoundaryBehaviour(1);
	dadPhoneTimer = 0x697;
	setIRQCallback(&processOverworldTasks);
	teleportStyle = TeleportStyle.none;
	teleportDestination = 0;
	unknown7EB4A8 = -1;
	entityAllocationMinSlot = 0x17;
	entityAllocationMaxSlot = 0x18;
	initEntity(ActionScript.unknown001, 0, 0);
	unknownC02D29();
	unknownC03A24();
	memset(&palettes[0][0], 0, 0x200);
	unknownC47F87();
	overworldInitialize();
	loadMapAtPosition(gameState.leaderX.integer, gameState.leaderY.integer);
	spawnBuzzBuzz();
	loadWindowGraphics();
	unknownC44963(1);
	unknownC039E5();
}

/// $C0B731
void initBattleOverworld() {
	if (battleDebug == 0) {
		return;
	}
	if ((debugging == 0) || (unknownEFE708() != -1)) {
		if (instantWinCheck() != 0) {
			instantWinHandler();
			battleDebug = 0;
		}
	} else {
		short x10 = initBattleCommon();
		unknownC07B52();
		if (teleportDestination == 0) {
			if (x10 != 0) {
				if (debugging == 0) {
					return;
				}
				if (debugCheckViewCharacterMode() != 0) {
					return;
				}
			}
			reloadMap();
			fadeIn(1, 1);
		} else {
			teleportMainLoop();
		}
	}
	for (short i = 0; i != 0x17; i++) {
		entityCollidedObjects[i] = 0xFFFF;
		entityUnknown2C5E[i] = 0;
		entitySpriteMapFlags[i] &= 0x7FFF;
	}
	overworldStatusSuppression = 0;
	unknownC09451();
	unknown7E5D58 = 0x78;
	touchedEnemy = -1;
}

/// $C0B7D8
void ebMain() {
	unknownC43317();
	RestartGame:
	debug(nointro) {
		unknown7EB4B6 = 1;
	} else {
		initIntro();
	}
	fileSelectInit();
	unknownC0B67F();
	fadeIn(1, 1);
	updateScreen();
	//setjmp(&jmpbuf2);
	unknownC43F53();
	while (1) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		unknownC4A7B0();
		waitUntilNextFrame();
		if (((currentQueuedInteraction - nextQueuedInteraction) != 0) && !battleSwirlCountdown && !battleSwirlFlag && !battleDebug) {
			processQueuedInteractions();
			inputDisableFrameCounter++;
		} else if ((gameState.unknownB0 != 2) && (gameState.walkingStyle != WalkingStyle.escalator) && !battleSwirlCountdown) {
			if (!battleDebug) {
				initBattleOverworld();
				inputDisableFrameCounter++;
			} else if (((padPress[0] & (Pad.a | Pad.l)) != 0) || (gameState.walkingStyle == WalkingStyle.bicycle)) {
				unknownC0943C();
				getOffBicycle();
				unknownC09451();
				continue;
			}
			if (debugging) {
				if (((padState[0] & (Pad.b | Pad.select)) != 0) && (((padPress[0] & Pad.r)) != 0)) {
					debugYButtonMenu();
					continue;
				}
				if ((padPress[1] & Pad.a) != 0) {
					getDistanceToMagicTruffle();
				}
				if ((padPress[1] & Pad.b) != 0) {
					testYourSanctuaryDisplay();
				}
			}
			if (battleSwirlCountdown) {
				continue;
			}
			if (battleSwirlFlag) {
				continue;
			}
			if (inputDisableFrameCounter) {
				inputDisableFrameCounter--;
			} else if (!unknown7E5D9A) {
				if ((padPress[0] & Pad.a) != 0 ) {
					openMenuButton();
				} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (gameState.walkingStyle != WalkingStyle.bicycle)) {
					openHPPPDisplay();
				} else if ((padPress[0] & Pad.x) != 0) {
					showTownMap();
				} else if ((padPress[0] & Pad.l) != 0) {
					openMenuButtonCheckTalk();
				}
			}
			if (teleportDestination) {
				teleportMainLoop();
			}
			if (!debugging && ((padPress[1] & Pad.b) != 0)) {
				for (short i = 0; i < partyCharacters.length; i++) {
					partyCharacters[i].hp.target = partyCharacters[i].maxHP;
					partyCharacters[i].pp.target = partyCharacters[i].maxPP;
				}
			}
		}
		if (unknownC04FFE() && !spawn()) {
			goto RestartGame;
		}
		if (debugging && ((padState[0] & Pad.start) != 0) && ((padState[0] & Pad.select) == 0)) {
			break;
		}
	}
}

/// $C0B99A
void gameInit() {
	checkSRAMIntegrity();
	initializeSPC700();
	enableNMIJoypad();
	checkHardware();
	waitUntilNextFrame();
	waitUntilNextFrame();
	debug(alwaysdebugmenu) {
		debugging = 1;
		debugMenuLoad();
	} else {
		debug {
			if ((padState[0] & (Pad.down | Pad.l)) != 0) {
				debugging = 1;
				debugMenuLoad();
			}
		}
		debugging = 0;
		ebMain();
	}
}

/// $C0B9BC
void unknownC0B9BC(PathCtx* arg1, short arg2, short arg3, short arg4) {
	for (short i = 0; i < arg2; i++) {
		arg1.targetsPos[i].x = ((entityAbsXTable[entitySizes[gameState.unknownA2[i]]] - unknownC42A1F[entitySizes[gameState.unknownA2[i]]]) / 8 - arg3) & 0x3F;
		arg1.targetsPos[i].y = ((entityAbsYTable[entitySizes[gameState.unknownA2[i]]] - unknownC42A41[entitySizes[gameState.unknownA2[i]]] + unknownC42AEB[entitySizes[gameState.unknownA2[i]]]) / 8 - arg4) & 0x3F;
	}
}

/// $C0BA35
short unknownC0BA35(PathCtx* arg1, short arg2, short arg3, short arg4, short arg5, short arg6, short arg7) {
	ubyte* x06 = &unknown7F0000[0x3000];
	arg1.targetCount = arg2;
	for (short i = 0; i != arg1.radius.x; i++) {
		for (short j = 0; j != arg1.radius.y; j++) {
			if ((unknown7EE000[(i + arg7) & 0x3F][(j + arg3) & 0x3F] & 0xC0) != 0) {
				(x06++)[0] = PathfindingTile.unwalkable;
			} else {
				(x06++)[0] = 0;
			}
		}
	}
	short x02 = 0;
	short x26 = 0;
	for (short i = 0; i < maxEntities; i++) {
		if (entityScriptTable[i] == -1) {
			continue;
		}
		if (entityUnknown2C5E[i] == -1) {
			continue;
		}
		arg1.pathers[x26].objIndex = i;
		arg1.pathers[x26].fromOffscreen = arg6;
		arg1.pathers[x26].hitbox.x = unknownC42AA7[entitySizes[i]];
		arg1.pathers[x26].hitbox.y = unknownC42AC9[entitySizes[i]];
		arg1.pathers[x26].origin.x = ((entityAbsXTable[i] - unknownC42A1F[entitySizes[i]]) / 8 - arg3) & 0x3F;
		arg1.pathers[x26].origin.y = ((entityAbsYTable[i] - unknownC42A41[entitySizes[i]] + unknownC42AEB[entitySizes[i]]) / 8 - arg3) & 0x3F;
		x26++;
	}
	arg1.patherCount = x26;
	ushort x28 = pathMain(0xC00, &unknown7EF000.unknown7EF400[0], &arg1.radius, &unknown7F0000[0x3000], 4, arg2, &arg1.targetsPos[0], x26, &arg1.pathers[0], -1, arg5, arg6);
	while (pathGetHeapSize() > 0xC00) {}
	if (x28 == 0) {
		for (short i = 0; i != maxEntities; i++) {
			if (entityScriptTable[i] == -1) {
				continue;
			}
			entityUnknown2C5E[i] = 1;
		}
		return -1;
	} else {
		for (short i = 0; i < x26; i++) {
			short x22 = arg1.pathers[i].objIndex;
			if (arg1.pathers[i].field0A != 0) {
				entityUnknown2E02[x22] = arg1.pathers[i].points;
				entityUnknown2E3E[x22] = arg1.pathers[i].field0A;
			} else {
				entityUnknown2C5E[x22] = 1;
			}
		}
		return 0;
	}
}

/// $C0BC75
short findPathToParty(short partyCount, short arg2, short arg3) {
	short x28 = gameState.currentPartyMembers;
	PathCtx* x26 = &unknown7EF000.unknown7EF200;
	unknown7EF000.unknown7EF200.radius.y = arg2;
	unknown7EF000.unknown7EF200.radius.x = arg3;
	unknown7E4A94 = unknown7EF000.unknown7EF200.radius.x;
	unknown7E4A8E = (entityAbsXTable[gameState.currentPartyMembers] - unknownC42A1F[entitySizes[gameState.currentPartyMembers]]) / 8;
	unknown7E4A90 = (entityAbsYTable[gameState.currentPartyMembers] - unknownC42A41[entitySizes[gameState.currentPartyMembers]] + unknownC42AEB[entitySizes[gameState.currentPartyMembers]]) / 8;
	unknownC0B9BC(&unknown7EF000.unknown7EF200, partyCount,
		((entityAbsXTable[gameState.currentPartyMembers] - unknownC42A1F[entitySizes[gameState.currentPartyMembers]]) / 8) - (unknown7EF000.unknown7EF200.radius.y / 2),
		((entityAbsYTable[gameState.currentPartyMembers] - unknownC42A41[entitySizes[gameState.currentPartyMembers]] + unknownC42AEB[entitySizes[gameState.currentPartyMembers]]) / 8) - (unknown7EF000.unknown7EF200.radius.x / 2)
	);
	return unknownC0BA35(&unknown7EF000.unknown7EF200, partyCount, unknown7EF000.unknown7EF200.radius.y, unknown7EF000.unknown7EF200.radius.x, 0, 0x40, 0x32);
}

/// $C0BD96
short unknownC0BD96() {
	short x2A = gameState.currentPartyMembers;
	PathCtx* x28 = &unknown7EF000.unknown7EF200;
	short x04 = unknown7EF000.unknown7EF200.radius.y = 56;
	short x02 = unknown7EF000.unknown7EF200.radius.x = 56;
	unknown7E4A92 = unknown7EF000.unknown7EF200.radius.y / 2;
	unknown7E4A94 = unknown7EF000.unknown7EF200.radius.x / 2;
	unknown7E4A8E = (entityAbsXTable[x2A] - unknownC42A1F[entitySizes[x2A]]) / 8;
	unknown7E4A90 = (entityAbsYTable[x2A] - unknownC42A41[entitySizes[x2A]] + unknownC42AEB[entitySizes[x2A]]) / 8;
	x04 = cast(short)((entityAbsXTable[x2A] - unknownC42A1F[entitySizes[x2A]]) / 8 - x04);
	x02 = cast(short)((entityAbsYTable[x2A] - unknownC42A41[entitySizes[x2A]] + unknownC42AEB[entitySizes[x2A]]) / 8 - x02);
	unknownC0B9BC(x28, 1, x04, x02);
	short result = unknownC0BA35(x28, 1, x04, x02, 1, 0xFC, 0x32);
	if (result == 0) {
		entityAbsXTable[unknown7EF000.unknown7EF200.pathers[0].objIndex] = cast(short)((unknown7EF000.unknown7EF200.pathers[0].origin.x * 8) + unknownC42A1F[entitySizes[unknown7EF000.unknown7EF200.pathers[0].objIndex]] + ((unknown7E4A8E - unknown7E4A92) * 8));
		entityAbsYTable[unknown7EF000.unknown7EF200.pathers[0].objIndex] = cast(short)((unknown7EF000.unknown7EF200.pathers[0].origin.y * 8) -unknownC42AEB[entitySizes[unknown7EF000.unknown7EF200.pathers[0].objIndex]] + unknownC42A41[entitySizes[unknown7EF000.unknown7EF200.pathers[0].objIndex]] + ((unknown7E4A90 - unknown7E4A94) * 8));
		entityUnknown2E02[unknown7EF000.unknown7EF200.pathers[0].objIndex]++;
		entityUnknown2E3E[unknown7EF000.unknown7EF200.pathers[0].objIndex]--;
	}
	return result;
}

/// $C0BF72
short unknownC0BF72() {
	PathCtx* x26 = &unknown7EF000.unknown7EF200;
	unknown7EF000.unknown7EF200.radius.y = 56;
	unknown7EF000.unknown7EF200.radius.x = 56;
	short x04 = unknown7EF000.unknown7EF200.radius.y / 2;
	unknown7E4A92 = unknown7EF000.unknown7EF200.radius.y / 2;
	unknown7E4A94 = unknown7EF000.unknown7EF200.radius.x / 2;
	unknown7E4A8E = (entityAbsXTable[currentEntitySlot] - unknownC42A1F[entitySizes[currentEntitySlot]]) / 8;
	unknown7E4A90 = (entityAbsYTable[currentEntitySlot] - unknownC42A41[entitySizes[currentEntitySlot]] + unknownC42AEB[entitySizes[currentEntitySlot]]) / 8;
	short x = cast(short)((entityAbsXTable[currentEntitySlot] - unknownC42A1F[entitySizes[currentEntitySlot]]) / 8 - x04);
	short x28 = cast(short)((entityAbsYTable[currentEntitySlot] - unknownC42A41[entitySizes[currentEntitySlot]] + unknownC42AEB[entitySizes[currentEntitySlot]]) / 8 - x04);
	unknown7EF000.unknown7EF200.targetsPos[0].x = x04 & 0x3F;
	unknown7EF000.unknown7EF200.targetsPos[0].y = unknown7E4A94 & 0x3F;
	return unknownC0BA35(x26, 1, x, x28, 1, 0xFC, 0x32);
}

/// $C0C19B
short unknownC0C19B(short arg1) {
	if (unknownC3DFE8[loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & 7] != 0) {
		entityUnknown2C5E[currentEntitySlot] = 0xFFFF;
		short y = unknownC0BD96();
		if (y == 0) {
			entityUnknown2C5E[currentEntitySlot] = 0;
			VecYX* x02 = entityUnknown2E02[currentEntitySlot];
			VecYX* y2 = &unknown7E4A96[arg1][0];
			entityUnknown2E02[currentEntitySlot] = y2;
			short x10 = entityUnknown2E3E[currentEntitySlot];
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
short unknownC0C251(short arg1) {
	entityUnknown2C5E[currentEntitySlot] = 0xFFFF;
	if (unknownC0BF72() == 0) {
		entityUnknown2C5E[currentEntitySlot] = 0;
		short x12 = --entityUnknown2E3E[currentEntitySlot];
		VecYX* x02 = &entityUnknown2E02[currentEntitySlot][(x12 - 1) * 4];
		VecYX* x10 = &unknown7E4A96[arg1][0];
		entityUnknown2E02[currentEntitySlot] = x10;
		short y = entityUnknown2E3E[currentEntitySlot];
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
void unknownC0C30C(short arg1) {
	if (getEventFlag(npcConfig[entityTPTEntries[arg1]].eventFlag)) {
		entityDirections[arg1] = Direction.up; // 0
	} else {
		entityDirections[arg1] = Direction.down; // 4
	}
	unknownC0A443Entry2(arg1);
}

/// $C0C353
void unknownC0C353() {
	unknownC0C30C(currentEntitySlot);
}

/// $C0C35D
short unknownC0C35D() {
	return gameState.unknown90;
}

/// $C0C363
short unknownC0C363() {
	short x02 = cast(short)(gameState.leaderX.integer - entityAbsXTable[currentEntitySlot]);
	short x04 = cast(short)(gameState.leaderY.integer - entityAbsYTable[currentEntitySlot]);
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
short unknownC0C3F9() {
	short x02 = cast(short)(gameState.leaderX.integer - entityAbsXTable[currentEntitySlot]);
	short x0E = cast(short)(gameState.leaderY.integer - entityAbsYTable[currentEntitySlot]);
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
short unknownC0C48F() {
	if (entityUnknown2C5E[currentEntitySlot] != 0) {
		return 0;
	}
	if (unknown7E5D58 == 0) {
		return unknownC0C363();
	}
	return -1;
}

/// $C0C4AF
short unknownC0C4AF() {
	if (entityUnknown2C5E[currentEntitySlot] != 0) {
		return 0;
	}
	if (unknown7E5D58 == 0) {
		return unknownC0C3F9();
	}
	return -1;
}

/// $C0C4F6
short getDirectionFromPlayerToEntity() {
	return getDirectionTo(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], gameState.leaderX.integer, gameState.leaderY.integer);
}

/// $C0C524
short unknownC0C524() {
	if ((battleEntryPointerTable[entityTPTEntries[currentEntitySlot] & 0x7FFF].runAwayFlag != 0) && (getEventFlag(battleEntryPointerTable[entityTPTEntries[currentEntitySlot] & 0x7FFF].runAwayFlag) == battleEntryPointerTable[entityTPTEntries[currentEntitySlot] & 0x7FFF].runAwayFlagState)) {
		return 1;
	}
	short x0E = unknownC0546B();
	if (x0E > enemyConfigurationTable[entityEnemyIDs[currentEntitySlot]].level * 10) {
		return 1;
	}
	if ((x0E > enemyConfigurationTable[entityEnemyIDs[currentEntitySlot]].level * 8) && (entityUnknown3186[currentEntitySlot] >= 0xC0)) {
		return 1;
	}
	if ((x0E > enemyConfigurationTable[entityEnemyIDs[currentEntitySlot]].level * 6) && (entityUnknown3186[currentEntitySlot] >= 0x80)) {
		return 1;
	}
	return 0;
}

/// $C0C62B
short unknownC0C62B() {
	short x02 = 0;
	if ((entityTPTEntries[currentEntitySlot] < 0) && (unknownC0C524() != 0)) {
		x02 = short.min;
	}
	return cast(short)(unknownC41EFF(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], entityScriptVar6Table[currentTPTEntry], entityScriptVar7Table[currentEntitySlot]) + x02);
}

/// $C0C682
short getDirectionRotatedClockwise(short arg1) {
	return (entityDirections[currentEntitySlot] + arg1) & 7;
}

/// $C0C6B6
short unknownC0C6B6() {
	if (unknown7E9F45.integer >= 4) {
		return -1;
	}
	short x0E = cast(short)(entityAbsXTable[currentEntitySlot] - (gameState.leaderX.integer - 0x80));
	short x = cast(short)(entityAbsYTable[currentEntitySlot] - (gameState.leaderY.integer - 0x70));
	if ((x0E >= -64) || (x0E < 320)) {
		if ((x >= -64) || (x < 320)) {
			return -1;
		}
	}
	return 0;
}


/// $C0C711
short unknownC0C711() {
	//weird...
	if (((entityScreenXTable[currentEntitySlot] - unknownC42A1F[entitySizes[currentEntitySlot]]) | (entityScreenYTable[currentEntitySlot] - unknownC42A41[entitySizes[currentEntitySlot]]) | (currentEntitySlot + 8) & 0xFF00) == 0) {
		return -1;
	} else {
		return 0;
	}
}

/// $C0C7DB
void unknownC0C7DB() {
	entitySurfaceFlags[currentEntitySlot] = unknownC05F33(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], currentEntitySlot);
}

/// $C0C83B
void unknownC0C83B(short arg1) {
	entityUnknown1A86[currentEntitySlot] = arg1;
	FixedPoint1616 x0E;
	if ((arg1 & 1) != 0) {
		x0E.combined = (cast(int)entityUnknown2B32[currentEntitySlot] * 0xB505) >> 8;
	} else {
		x0E.combined = (cast(int)entityUnknown2B32[currentEntitySlot] * 0x10000) >> 8;
	}
	FixedPoint1616 x12;
	FixedPoint1616 x16;
	switch (arg1) {
		case Direction.up:
			x12.combined = 0;
			x16.combined = -x0E.combined;
			break;
		case Direction.upRight:
			x12.combined = x0E.combined;
			x16.combined = -x0E.combined;
			break;
		case Direction.right:
			x12.combined = x0E.combined;
			x16.combined = 0;
			break;
		case Direction.downRight:
			x12.combined = x0E.combined;
			x16.combined = x0E.combined;
			break;
		case Direction.down:
			x12.combined = 0;
			x16.combined = x0E.combined;
			break;
		case Direction.downLeft:
			x12.combined = -x0E.combined;
			x16.combined = x0E.combined;
			break;
		case Direction.left:
			x12.combined = -x0E.combined;
			x16.combined = 0;
			break;
		case Direction.upLeft:
			x12.combined = -x0E.combined;
			x16.combined = -x0E.combined;
			break;
		default: break;
	}
	entityDeltaXTable[currentEntitySlot] = x12.integer;
	entityDeltaXFractionTable[currentEntitySlot] = x12.fraction;
	entityDeltaYTable[currentEntitySlot] = x16.integer;
	entityDeltaYFractionTable[currentEntitySlot] = x16.fraction;
}

/// $C0CBD3
void unknownC0CBD3(short arg1) {
	entityScriptSleepFrames[currentScriptSlot] = cast(short)((cast(int)arg1 << 8) / entityUnknown2B32[currentEntitySlot]);
}

/// $C0CA4E
void unknownC0CA4E(short arg1) {
	FixedPoint1616 x0E;
	x0E.integer = entityDeltaXTable[currentEntitySlot];
	x0E.fraction = entityDeltaXFractionTable[currentEntitySlot];
	FixedPoint1616 x12;
	x12.integer = entityDeltaYTable[currentEntitySlot];
	x12.fraction = entityDeltaYFractionTable[currentEntitySlot];
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
	entityScriptSleepFrames[currentScriptSlot] = cast(short)((arg1 << 16) / x0A.combined);
}

/// $C0CC11
void unknownC0CC11() {
	short x12 = cast(short)(entityScriptVar6Table[currentEntitySlot] - entityAbsXTable[currentEntitySlot]);
	short y =  (0 > x12) ? (cast(short)-cast(int)x12) : x12;
	x12 = cast(short)(entityScriptVar7Table[currentEntitySlot] - entityAbsYTable[currentEntitySlot]);
	short x02 =  (0 > x12) ? (cast(short)-cast(int)x12) : x12;
	FixedPoint1616 x0E;
	if (y > x02) {
		x12 = y;
		x0E.integer = entityDeltaXTable[currentEntitySlot];
		x0E.fraction = entityDeltaXFractionTable[currentEntitySlot];
	} else {
		x12 = x02;
		x0E.integer = entityDeltaYTable[currentEntitySlot];
		x0E.fraction = entityDeltaYFractionTable[currentEntitySlot];
	}
	x12 = cast(short)((x12 << 16) / x0E.combined);
	if (x12 == 0) {
		x12 = 1;
	}
	entityScriptSleepFrames[currentScriptSlot] = x12;
}

/// $C0CCCC
void unknownC0CCCC() {
	entityScriptVar6Table[currentEntitySlot] = entityAbsXTable[currentEntitySlot];
	entityScriptVar7Table[currentEntitySlot] = cast(short)(entityAbsYTable[currentEntitySlot] + 16);
	entityScriptVar5Table[currentEntitySlot] = cast(short)((cast(int)entityUnknown2B32[currentEntitySlot] * 16) / 64800) << 8;
	if ((rand() & 1) != 0) {
		entityDirections[currentEntitySlot] = Direction.up;
	} else {
		entityDirections[currentEntitySlot] = Direction.down;
	}
	if (entityDirections[currentEntitySlot] < Direction.down) {
		entityUnknown2DC6[currentEntitySlot] = 0;
	} else {
		entityUnknown2DC6[currentEntitySlot] = 0xFFFF;
	}
	entityScriptVar4Table[currentEntitySlot] = 0;
}

/// $C0CD50
short unknownC0CD50() {
	short x04 = entityUnknown2DC6[currentEntitySlot];
	short x02;
	if (x04 == 0) {
		x02 = cast(short)(entityScriptVar4Table[currentEntitySlot] + entityScriptVar5Table[currentEntitySlot]);
	} else {
		x02 = cast(short)(entityScriptVar4Table[currentEntitySlot] - entityScriptVar5Table[currentEntitySlot]);
	}
	entityScriptVar4Table[currentEntitySlot] = x02;
	FixedPoint1616 x0E = unknownC41FFF(x02, 0x1000);
	FixedPoint1616 x1E;
	FixedPoint1616 x1A;
	x1A.integer = x0E.fraction;
	x1E.integer = x0E.integer;
	x1A.combined >>= 8;
	x1E.combined >>= 8;
	FixedPoint1616 x22;
	x22.integer = entityScriptVar6Table[currentEntitySlot];
	FixedPoint1616 x26;
	x26.integer = entityScriptVar7Table[currentEntitySlot];
	FixedPoint1616 x12;
	x12.integer = entityAbsXTable[currentEntitySlot];
	x12.fraction = entityAbsXFractionTable[currentEntitySlot];
	FixedPoint1616 x16;
	x16.integer = entityAbsYTable[currentEntitySlot];
	x16.fraction = entityAbsYFractionTable[currentEntitySlot];
	FixedPoint1616 x2A;
	x2A.combined = x22.combined + x1A.combined - x12.combined;
	FixedPoint1616 x2E;
	x2E.combined = x26.combined + x1E.combined - x16.combined;
	entityDeltaXTable[currentEntitySlot] = x2A.integer;
	entityDeltaXFractionTable[currentEntitySlot] = x2A.fraction;
	entityDeltaYTable[currentEntitySlot] = x2E.integer;
	entityDeltaYFractionTable[currentEntitySlot] = x2E.fraction;
	if (x04 == 0) {
		return cast(short)(x02 + 0x4000);
	} else {
		return cast(short)(x02 - 0x4000);
	}
}

/// $C0CEBE
short unknownC0CEBE(short arg1) {
	short x04 = entityScriptVar4Table[currentEntitySlot];
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
	if (entityUnknown2B32[currentEntitySlot] < entityScriptVar3Table[currentEntitySlot]) {
		entityUnknown2B32[currentEntitySlot] += 16;
	}
	if (unknownC46B0A(x02) != unknownC46B0A(x04)) {
		unknownC0A443Entry2(currentEntitySlot);
	}
	return x04;
}

/// $C0CF58
immutable ubyte[63] unknownC0CF58 = [ 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x01, 0x01, 0x02, 0x02, 0x03, 0x04 ];

/// $C0CF97
short unknownC0CF97(short arg1, short arg2) {
	//x1C = arg2
	ubyte x00 = cast(ubyte)arg1;
	const(ubyte)* x06 = &unknownC0CF58[0];
	short y = cast(short)(((entityAbsXTable[currentEntitySlot] - unknownC42A1F[entitySizes[currentEntitySlot]]) / 8) - 4);
	short x12 = cast(short)(((entityAbsYTable[currentEntitySlot] - unknownC42A41[entitySizes[currentEntitySlot]] + unknownC42AEB[entitySizes[currentEntitySlot]]) / 8) - 4);
	short x10 = y & 0x3F;
	short x18 = x12 & 0x3F;
	for (short i = 0; i != arg2; i++) {
		if ((x10 < 0x40) && (x18 < 0x40) && ((x00 & unknown7EE000[x18 & 0x3F][x10 & 0x3F]) != 0)) {
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
	entityScriptVar6Table[currentEntitySlot] = cast(short)(y * 8 + unknownC42A1F[entitySizes[currentEntitySlot]]);
	entityScriptVar7Table[currentEntitySlot] = cast(short)(x12 * 8 - unknownC42AEB[entitySizes[currentEntitySlot]] + unknownC42A41[entitySizes[currentEntitySlot]]);
	return -1;
}

/// $C0D0D9
short unknownC0D0D9() {
	return unknownC0CF97(3, 60);
}

/// $C0D0E6
short unknownC0D0E6() {
	if ((unknownC0C363() == 0) && (entityUnknown2C5E[currentEntitySlot] != 0)) {
		entityAbsXTable[currentEntitySlot] = gameState.leaderX.integer;
		entityAbsYTable[currentEntitySlot] = gameState.leaderY.integer;
		return -1;
	}
	unknownC09EFF();
	if ((unknownC05CD7(unknown7E2848, unknown7E284A, currentEntitySlot, Direction.down) & 0xC0) != 0) {
		entityUnknown2B32[currentEntitySlot] -= 0x1000;
		return 0;
	}
	entityAbsXTable[currentEntitySlot] = unknown7E2848;
	entityAbsYTable[currentEntitySlot] = unknown7E284A;
	return -1;
}

/// $C0D15C
short unknownC0D15C() {
	if ((miscDebugFlags & 2) != 0) {
		return 0;
	}
	if (entityCollidedObjects[23] == currentEntitySlot) {
		return -1;
	}
	if ((entityCollidedObjects[currentEntitySlot] < 0) || (entityCollidedObjects[currentEntitySlot] < 0x17)) {
		return 0;
	}
	return -1;
}

/// $C0D19B
void unknownC0D19B() {
	short x20 = touchedEnemy;
	battleSwirlFlag = 0;
	short x;
	short y;
	if (entityUnknown1A86[touchedEnemy] == 8) {
		y = 0;
		x = 1;
	} else {
		short x04 = ((unknownC41EFF(entityAbsXTable[x20], entityAbsYTable[x20], entityAbsXTable[unknown7E4DB8], entityAbsYTable[unknown7E4DB8]) + 0x1000) / 0x2000);
		switch ((entityUnknown1A86[touchedEnemy] - x04) & 7) {
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
	battleInitiative = 0;
	if ((x == 1) && (y == 0)) {
		battleInitiative = Initiative.partyFirst;
	} else if ((y == 1) && (x == 0)) {
		battleInitiative = Initiative.enemiesFirst;
	}
	battleSwirlCountdown = 120;
	currentBattleGroup = entityTPTEntries[x20];
	battleSwirlSequence();
	for (short i = 0; i != 4; i++) {
		short x02 = battleEntryPointerTable[entityTPTEntries[x20] & 0x7FFF].enemies[i].count;
		if (x02 != 0xFF) {
			short x1A = x02;
			if (x1A != 0) {
				y = battleEntryPointerTable[entityTPTEntries[x20] & 0x7FFF].enemies[i].enemyID;
				if (y == entityEnemyIDs[x20]) {
					entityUnknown2C5E[x20] = 0xFFFF;
					x1A--;
				}
				if (x1A != 0) {
					for (short j = 0; j != 23; j++) {
						if (entityScriptTable[j] == -1) {
							continue;
						}
						if (y != entityEnemyIDs[j]) {
							continue;
						}
						entityUnknown2C5E[j] = 0xFFFF;
					}
				}
			}
		} else {
			x02 = 0;
			y = 0;
		}
		unknown7E4A7C[i] = y;
		unknown7E4A84[i] = x02;
	}
	enemiesInBattle = 0;
	findPathToParty(gameState.partyCount, 0x40, 0x40);
	for (short i = 0; i != 4; i++) {
		short x14 = battleEntryPointerTable[currentBattleGroup].enemies[i].count;
		if (x14 == 0xFF) {
			continue;
		}
		if (x14 != 0) {
			short x1A = battleEntryPointerTable[currentBattleGroup].enemies[i].enemyID;
			if (x1A != 0) {
				short x18 = 0;
				for (short j = 0; j < unknown7EF000.unknown7EF200.patherCount; j++) {
					if (unknown7EF000.unknown7EF200.pathers[j].objIndex == x1A) {
						x18++;
					}
				}
				if (x18 > x14) {
					for (short j = cast(short)(x18 - x14); j-- != 0;) {
						short x10 = -1;
						short x1C = 0;
						for (short k = 0; k < unknown7EF000.unknown7EF200.patherCount; k++) {
							if (entityEnemyIDs[unknown7EF000.unknown7EF200.pathers[k].objIndex] != x1A) {
								continue;
							}
							if (unknown7EF000.unknown7EF200.pathers[k].pointCount <= x1C) {
								continue;
							}
							x10 = x18;
							x1C = entityEnemyIDs[unknown7EF000.unknown7EF200.pathers[k].pointCount];
						}
						if (unknown7EF000.unknown7EF200.pathers[x10].objIndex != x20) {
							unknown7EF000.unknown7EF200.pathers[x10].pointCount = 0;
							entityUnknown2C5E[unknown7EF000.unknown7EF200.pathers[x10].objIndex] = 0;
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
		if (entityUnknown2C5E[i] == -1) {
			entityTickCallbackFlags[i] &= 0xFFFF ^ (objectTickDisabled | objectMoveDisabled);
		} else {
			entitySpriteMapFlags[i] |= 0x8000;
		}
	}
	entityUnknown2C5E[x20] = 0;
	unknown7E9F8C[enemiesInBattle++] = entityEnemyIDs[x20];
}

/// $C0D4DE
void unknownC0D4DE() {
	memcpy(&unknown7F0000[0x2000], &palettes[0][0], 0x200);
	for (short i = 0; i < 0x80; i++) {
		ushort x18 = (cast(ushort*)&palettes[0][0])[i];
		short x16 = x18 & 0x1F;
		short x02 = (x18 >> 5) & 0x1F;
		short tmp = (x18 >> 10) & 0x1F;
		short x16_2 = (x16 + x02 + tmp) / 3;
		(cast(ushort*)&palettes[0][0])[i] = cast(ushort)(x16_2 << 10 + x16_2 << 5 + x16_2);
	}
	unknownC0856B(0x18);
}

/// $C0D59B
short unknownC0D59B() {
	if ((battleSwirlCountdown != 0) || (battleSwirlFlag != 0)) {
		return 1;
	}
	return 0;
}

/// $C0D5B0
short unknownC0D5B0() {
	if (battleDebug != 0) {
		return 0;
	}
	if (unknown7E5DC2 != 0) {
		return 0;
	}
	if ((battleSwirlCountdown == 0) || (currentEntitySlot != touchedEnemy)) {
		if (gameState.unknownB0 == 2) {
			return 0;
		}
		if ((miscDebugFlags & 2) != 0) {
			return 0;
		}
		if (gameState.walkingStyle == WalkingStyle.escalator) {
			return 0;
		}
		if (unknown7E5D58 != 0) {
			return 0;
		}
		if ((battleSwirlCountdown == 0) || (entityUnknown2E3E[currentEntitySlot] != 0)) {
			if (unknownC0D15C() == 0) {
				return 0;
			}
		}
	}
	if ((battleSwirlCountdown == 0) && (battleSwirlFlag == 0) && (entityEnemyIDs[currentEntitySlot] == EnemyID.magicButterfly)) {
		return 1;
	}
	if ((battleSwirlCountdown == 0) && (battleSwirlFlag == 0)) {
		battleSwirlFlag = 1;
		unknownC0D4DE();
		if (currentEntitySlot == entityCollidedObjects[23]) {
			unknown7E4DB8 = 0x18;
		} else {
			unknown7E4DB8 = entityCollidedObjects[currentEntitySlot];
		}
		touchedEnemy = currentEntitySlot;
		for (short i = 0; i < maxEntities; i++) {
			if (i == 23) {
				continue;
			}
			entityTickCallbackFlags[i] |= objectTickDisabled | objectMoveDisabled;
		}
		unknownC04A88();
		return 1;
	}
	entityCollidedObjects[currentEntitySlot] = 0x8000;
	short x12 = 0;
	if (battleSwirlCountdown != 0) {
		if (currentEntitySlot == touchedEnemy) {
			entityTickCallbackFlags[currentEntitySlot] |= objectTickDisabled | objectMoveDisabled;
			x12 = 1;
		} else {
			x12 = 0;
			short y = 0;
			for (short i = 0; i != 4; i++) {
				if (currentEntitySlot == unknown7E4A7C[i]) {
					short x0E = unknown7E4A84[i];
					if (x0E != 0) {
						unknown7E4A84[i] = cast(short)(x0E - 1);
						x12 = 1;
						entityTickCallbackFlags[currentEntitySlot] |= objectTickDisabled | objectMoveDisabled;
						unknown7E9F8C[enemiesInBattle++] = entityEnemyIDs[currentEntitySlot];
					}
				}
				y += unknown7E4A84[i];
			}
			if ((y == 0) && (unknownC2E9C8() == 0)) {
				for (short i = 0; i < maxEntities; i++) {
					if (i == 23) {
						continue;
					}
					entityTickCallbackFlags[i] |= objectTickDisabled | objectMoveDisabled;
				}
				battleSwirlCountdown = 1;
			}
		}
	}
	return x12;
}

/// $C0D7E0
void unknownC0D7E0() {
	if (entityUnknown2C5E[currentEntitySlot] != 0) {
		entityUnknown2C5E[currentEntitySlot] = 1;
	}
}

/// $C0D7F7
void unknownC0D7F7() {
	if (entityUnknown2C5E[currentEntitySlot] != -1) {
		return;
	}
	short x1C = entitySizes[currentEntitySlot];
	VecYX* x1A = entityUnknown2E02[currentEntitySlot];
	short x18 = entityAbsXTable[currentEntitySlot];
	short x16 = entityAbsYTable[currentEntitySlot];
	short x12 = cast(short)((unknown7E4A8E - unknown7E4A92 * 8) + x1A.x * 8 + unknownC42A1F[x1C]);
	short x04 = cast(short)((unknown7E4A90 - unknown7E4A94 * 8) + x1A.y * 8 - unknownC42AEB[x1C] + unknownC42A41[x1C]);
	short x10 = cast(short)(x18 - x12);
	if (0 > x10) {
		x10 = cast(short)-cast(int)x10;
	}
	if (3 > x10) {
		x10 = cast(short)(x16 - x04);
		if (0 > x10) {
			x10 = cast(short)-cast(int)x10;
		}
		if ((3 > x10) && (--entityUnknown2E3E[currentEntitySlot] != 0)) {
			VecYX* x14 = &x1A[1];
			entityUnknown2E02[currentEntitySlot] = x14;
			x12 = cast(short)((unknown7E4A8E - unknown7E4A92) * 8 + x14.x * 8 + unknownC42A1F[x1C]);
			x04 = cast(short)((unknown7E4A90 - unknown7E4A94) * 8 + x14.y * 8 - unknownC42AEB[x1C] + unknownC42A41[x1C]);
		}
	}
	if (entityUnknown2E3E[currentEntitySlot] != 0) {
		entityDirections[currentEntitySlot] = unknownC46B0A(unknownC47044(unknownC41EFF(x18, x16, x12, x04)));
	} else {
		entityUnknown2C5E[currentEntitySlot] = 0;
		entityObstacleFlags[currentEntitySlot] |= 0x80;
	}
}

/// $C0D77F
void unknownC0D77F() {
	for (short i = 0; i < maxEntities; i++) {
		if (i == currentEntitySlot) {
			continue;
		}
		if (i == 23) {
			continue;
		}
		entityTickCallbackFlags[i] |= objectTickDisabled | objectMoveDisabled;
	}
}

/// $C0D7B3
void unknownC0D7B3() {
	unknown7E4DBE = entityAbsXTable[currentEntitySlot];
	unknown7E4DC0 = entityAbsYTable[currentEntitySlot];
}

/// $C0D7C7
void unknownC0D7C7() {
	entityAbsXTable[currentEntitySlot] = unknown7E4DBE;
	entityAbsYTable[currentEntitySlot] = unknown7E4DC0;
}

/// $C0D98F
short unknownC0D98F() {
	if (entityUnknown2E3E[currentEntitySlot] == 0) {
		return 0;
	}
	short x12 = entitySizes[currentEntitySlot];
	VecYX* x0E = entityUnknown2E02[currentEntitySlot];
	entityScriptVar6Table[currentEntitySlot] = cast(short)((x0E.x * 8) + unknownC42A1F[x12] + (unknown7E4A8E - unknown7E4A92) * 8);
	entityScriptVar7Table[currentEntitySlot] = cast(short)((x0E.y * 8) - unknownC42AEB[x12] + unknownC42A41[x12] + (unknown7E4A90 - unknown7E4A94) * 8);
	entityUnknown2E3E[currentEntitySlot]--;
	entityUnknown2E02[currentEntitySlot] = x0E + 1;
	return 1;
}

/// $C0DA31
//this looks pretty ugly... is this right?
void unknownC0DA31() {
	if (firstEntity + 1 == 0) {
		return;
	}
	short x02 = 0;
	for (short i = 0; i != 0x1E; i++) {
		if (entityScriptTable[i] + 1 == 0) {
			continue;
		}
		if (entityDrawPriority[i] - 1 == 0) {
			if (((entityScreenYTable[i] + 8) & 0xFE00) == 0) {
				entityDrawSorting[x02++] = cast(short)(i + 1);
			} else {
				unknownC0A0CA(i);
			}
		}
	}
	entityDrawSorting[x02] = -1;
	for (short i = x02; i-- != 0;) {
		short j;
		for (j = 0; entityDrawSorting[j] == 0; j++) {}
		x02 = j;
		short x12 = j;
		short y = entityAbsYTable[j - 1];
		while (entityDrawSorting[++j] + 1 != 0) {
			if (entityDrawSorting[j] == 0) {
				continue;
			}
			if (y >= entityAbsYTable[entityDrawSorting[j - 1]]) {
				continue;
			}
			y = entityAbsYTable[entityDrawSorting[j - 1]];
			x12 = j;
		}
		unknownC0A0CA(cast(short)(entityDrawSorting[x12] - 1));
		entityDrawSorting[x12] = 0;
	}
}

/// $C0DB0F
void unknownC0DB0F() {
	if (padState[1] & Pad.select) {
		unknownC0DA31();
		return;
	}

	int dp16 = -1;
	uint dp14 = firstEntity;

	// UNKNOWN6
	// I guess this is a micro-optimization they decided to add here...? We've seen what == -1 looks like normally,
	// and this is logically equivalent to that, but usually the compiler just does CMP #$FFFF
	while (dp14 + 1) {
		if (entityScreenYTable[dp14 / 2] < 256 || entityScreenYTable[dp14 / 2] >= -64u) {
			// UNKNOWN3
			if (entityDrawPriority[dp14 / 2] == 1) {
				entityDrawSorting[dp14 / 2] = cast(short)dp16;
				dp16 = dp14 / 2;
			} else {
				// UNKNOWN4
				unknownC0A0CA(cast(short)(dp14 / 2));
			}
		}
		// UNKNOWN5
		dp14 = entityNextEntityTable[dp14 / 2];
	}

	// UNKNOWN12
	// Same little optimization as above
	while (dp16 + 1) {
		// UNKNOWN7
		uint dp10 = dp16;
		uint dp0E = entityAbsYTable[dp16];
		uint dp04 = -1;
		uint dp02 = dp16;
		uint y = entityDrawSorting[dp16];
		// UNKNOWN10
		// They really liked doing this huh...
		while (y + 1) {
			// UNKNOWN8
			if (entityAbsYTable[y] >= dp0E) {
				dp0E = entityAbsYTable[y];
				dp10 = y;
				dp04 = dp02;
			}
			// UNKNOWN9
			dp02 = y;
			y = entityDrawSorting[y];
		}
		unknownC0A0CA(cast(short)dp10);

		if (dp04 + 1) {
			entityDrawSorting[dp04] = entityDrawSorting[dp10];
		} else {
			// UNKNOWN11
			dp16 = entityDrawSorting[dp10];
		}
	}
	// UNKNOWN13
}

/// $C0DBE6 - schedules a task to be run at some point in the future while on the overworld
short scheduleOverworldTask(short arg1, void function() arg2) {
	OverworldTask* x10 = &overworldTasks[0];
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
void processOverworldTasks() {
	if ((unknown7E0002 == 0) && (dadPhoneTimer != 0)) {
		dadPhoneTimer--;
	}
	if (windowHead != -1) {
		return;
	}
	if (battleModeFlag != 0) {
		return;
	}
	if (battleSwirlCountdown != 0) {
		return;
	}
	if (battleSwirlFlag != 0) {
		return;
	}
	for (short i = 0; i < overworldTasks.length; i++) {
		if (overworldTasks[i].framesLeft == 0) {
			continue;
		}
		if (--overworldTasks[i].framesLeft != 0) {
			continue;
		}
		overworldTasks[i].func();
	}
}

/// $C0DCC6
void loadDadPhone() {
	if (windowHead != -1) {
		return;
	}
	if (battleModeFlag != 0) {
		return;
	}
	if (battleSwirlCountdown != 0) {
		return;
	}
	if (battleSwirlFlag != 0) {
		return;
	}
	if (unknown7E9E56 != 0) {
		return;
	}
	if (getEventFlag(EventFlag.unknown307) != 0) {
		return;
	}
	unknownC064E3(10, QueuedInteractionPtr(textDadCalls.ptr));
	unknown7E9E56 = 1;
}

/// $C0DD0F
void unknownC0DD0F() {
	while (unknown7E0028.a != 0) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
}

/// $C0DD2C
void unknownC0DD2C(short arg1) {
	for (short i = arg1; i != 0; i--) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
}

/// $C0DD53
void setTeleportState(ubyte arg1, TeleportStyle arg2) {
	teleportDestination = arg1;
	teleportStyle = arg2;
}

/// $C0DD79
void unknownC0DD79() {
	for (short i = 1; i <= 10; i++) {
		setEventFlag(i, 0);
	}
	unknown7E438A = psiTeleportDestinationTable[teleportDestination].x;
	unknown7E438C = psiTeleportDestinationTable[teleportDestination].y;
	short x02 = cast(short)(unknown7E438A * 8);
	short x0E = cast(short)(unknown7E438C * 8);
	if (teleportStyle != TeleportStyle.instant) {
		x02 += 0x13C;
	}
	unknown7E5DD4 = -1;
	unknown7E4370 = -1;
	unknown7E436E = -1;
	initializeMap(x02, x0E, 6);
}

/// $C0DE16
void unknownC0DE16() {
	for (short i = 0x18; i < 0x1E; i++) {
		entityScriptVar3Table[i] = 8;
		entityScriptVar7Table[i] |= (1 << 11);
	}
}

/// $C0DE46
void unknownC0DE46() {
	unknownC0DE16();
	unknown7E9F61 = cast(short)(rand() << 8);
	if (teleportStyle == TeleportStyle.psiBeta) {
		unknown7E9F63 = 4;
	} else {
		unknown7E9F63 = 8;
		unknown7E9F65 = 0;
	}
	unknown7E9F67 = gameState.leaderX.integer;
	unknown7E9F69 = gameState.leaderY.integer;
}

/// $C0DF22
void unknownC0DF22(ushort arg1) {
	FixedPoint1616 x0E;
	switch (unknown7E9F43) {
		case 1:
			if (gameState.unknown92 == 3) {
				FixedPoint1616 x06;
				x06.combined = unknown7E9F45.combined;
				x06.fraction += 0x51E;
				if (x06.fraction < 0x51E) {
					x06.integer++;
				}
				x0E = x06;
			} else {
				FixedPoint1616 x06;
				x06.combined = unknown7E9F45.combined;
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
				x06.combined = unknown7E9F45.combined;
				x06.fraction -= 0x1999;
				if (x06.fraction >= 0x10000 - 0x1999) {
					x06.integer--;
				}
				x0E = x06;
			} else {
				FixedPoint1616 x06;
				x06.combined = unknown7E9F45.combined;
				x06.fraction -= 0x1999;
				if (x06.fraction >= 0x10000 - 0x1999) {
					x06.integer--;
				}
				x0E = x06;
			}
			break;
		default:
			if (gameState.unknown92 == 3) {
				FixedPoint1616 x06;
				x06.combined = unknown7E9F45.combined;
				x06.fraction += 0x29FB;
				if (x06.fraction < 0x29FB) {
					x06.integer++;
				}
				x0E = x06;
			} else {
				FixedPoint1616 x06;
				x06.combined = unknown7E9F45.combined;
				x06.fraction += 0x1851;
				if (x06.fraction < 0x1851) {
					x06.integer++;
				}
				x0E = x06;
			}
			break;
	}
	unknown7E9F45.combined = x0E.combined;
	if ((arg1 & 1) != 0) {
		unknown7E9F49.combined = ((x0E.combined >> 8) * 0xB505) >> 8;
		unknown7E9F4D.combined = ((x0E.combined >> 8) * 0xB505) >> 8;
	} else {
		unknown7E9F49.combined = x0E.combined;
		unknown7E9F4D.combined = x0E.combined;
	}
	switch (arg1) { //this is hard to read. were the cases rearranged to dedupe code?
		case Direction.up:
			unknown7E9F4D.combined = -unknown7E9F4D.combined;
			goto case;
		case Direction.down:
			unknown7E9F49.combined = 0;
			break;
		case Direction.left:
			unknown7E9F49.combined = -unknown7E9F49.combined;
			goto case;
		case Direction.right:
			unknown7E9F4D.combined = 0;
			break;
		case Direction.upRight:
			unknown7E9F4D.combined = -unknown7E9F4D.combined;
			break;
		case Direction.upLeft:
			unknown7E9F4D.combined = -unknown7E9F4D.combined;
			goto case;
		case Direction.downLeft:
			unknown7E9F49.combined = -unknown7E9F49.combined;
			break;
		default: break;
	}
}

/// $C0DE7C
void unknownC0DE7C() {
	unknown7E4DC6 = &partyCharacters[0];
	for (short i = 0x18; i < 0x1E; i++) {
		entityScriptVar3Table[i] = 8;
		entityScriptVar7Table[i] &= 0xF7FF;
		entityCollidedObjects[i] &= 0x7FFF;
		unknown7E4DC6.unknown55 = 0xFFFF;
		unknown7E4DC6++;
	}
	changeMusic5DD6();
}

/// $C0DED9
short unknownC0DED9(short arg1, short arg2, short arg3, short arg4, short) {
	if (unknown7E9F43 != 0) {
		return 1;
	}
	return unknownC05F33(arg1, arg2, gameState.currentPartyMembers) | unknownC05F33(arg3, arg4, gameState.currentPartyMembers);
}

/// $C0E196
void unknownC0E196() {
	playerPositionBuffer[gameState.unknown88].xCoord = gameState.leaderX.integer;
	playerPositionBuffer[gameState.unknown88].yCoord = gameState.leaderY.integer;
	playerPositionBuffer[gameState.unknown88].tileFlags =unknownC05F33(gameState.leaderX.integer, gameState.leaderY.integer, gameState.currentPartyMembers);
	playerPositionBuffer[gameState.unknown88].walkingStyle = 0;
	playerPositionBuffer[gameState.unknown88].direction = gameState.leaderDirection;
	gameState.unknown88++;
	//uh... yeah, sure
	gameState.unknown88 = gameState.unknown88;
}

/// $C0E214
short unknownC0E214(short arg1, short arg2) {
	if (gameState.unknown96[0] == arg1 + 1) {
		return cast(short)(arg2 + 1);
	}
	if (unknown7E9F45.integer == 0) {
		return arg2;
	}
	return unknownC03EC3(arg1, 6, arg2, 2);
}

/// $C0E254
void unknownC0E254() {
	ushort x10 = cast(ushort)(12 - unknown7E9F45.integer);
	//weird way to say x10 <= 0
	if ((x10 == 0) || ((x10 & 0x8000) != 0)) {
		x10 = 1;
	}
	for (short i = 0x18; i < 0x1D; i++) {
		entityScriptVar3Table[i] = x10;
	}
}

/// $C0E28F
void unknownC0E28F() {
	gameState.unknown90 = 1;
	ushort x02 = mapInputToDirection(0);
	if (gameState.leaderDirection == (x02 ^ 4)) {
		x02 = gameState.leaderDirection;
	}
	if (x02 == -1) {
		x02 = gameState.leaderDirection;
	}
	gameState.leaderDirection = x02;
	if (battleSwirlCountdown != 0) {
		unknown7E9F43 = 2;
		battleDebug = 1;
	}
	unknownC0DF22(x02);
	unknown7E9F51.combined = unknown7E9F49.combined + gameState.leaderX.combined;
	unknown7E9F55.combined = unknown7E9F4D.combined + gameState.leaderY.combined;
	if (npcCollisionCheck(unknown7E9F51.integer, unknown7E9F55.integer, gameState.currentPartyMembers) != -1) {
		unknown7E9F43 = 2;
	}
	if ((unknownC0DED9(gameState.leaderX.integer, gameState.leaderY.integer, unknown7E9F51.integer, unknown7E9F55.integer, x02) & 0xC0) != 0) {
		unknown7E9F43 = 2;
	}
	if (unknown7E9F43 != 2) {
		gameState.leaderX = unknown7E9F51;
		gameState.leaderY = unknown7E9F55;
	}
	centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
	unknownC0E196();
	unknownC0E254();
	if (unknown7E9F45.integer > 9) {
		unknown7E9F43 = 1;
	}
}

/// $C0E3C1
void unknownC0E3C1() {
	unknown7E4DC6 = &partyCharacters[entityScriptVar1Table[currentEntitySlot]];
	unknownC07A56(entityScriptVar0Table[currentEntitySlot], playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].walkingStyle, currentEntitySlot);
	entityAbsXTable[currentEntitySlot] = playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].xCoord;
	entityAbsYTable[currentEntitySlot] = playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].yCoord;
	entityDirections[currentEntitySlot] = playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].direction;
	entitySurfaceFlags[currentEntitySlot] = playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].tileFlags;
	unknown7E4DC6.positionIndex = cast(ubyte)unknownC0E214(entityScriptVar0Table[currentEntitySlot], partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex);
}

/// $C0E44D
void unknownC0E44D() {
	if (teleportStyle == TeleportStyle.psiBetter) {
		return;
	}
	if ((padState[0] & Pad.up) != 0) {
		unknown7E9F69--;
	}
	if ((padState[0] & Pad.down) != 0) {
		unknown7E9F69++;
	}
	if ((padState[0] & Pad.left) != 0) {
		unknown7E9F67--;
	}
	if ((padState[0] & Pad.right) != 0) {
		unknown7E9F67++;
	}
}

/// $C0E48A
void unknownC0E48A() {
	unknown7E9F4D.integer = 0;
	unknown7E9F49.integer = 0;
	switch (gameState.leaderDirection) {
		case Direction.up:
			unknown7E9F4D.integer = -5;
			break;
		case Direction.upRight:
			unknown7E9F4D.integer = -5;
			unknown7E9F49.integer = 5;
			break;
		case Direction.right:
			unknown7E9F49.integer = 5;
			break;
		case Direction.downRight:
			unknown7E9F4D.integer = 5;
			unknown7E9F49.integer = 5;
			break;
		case Direction.down:
			unknown7E9F4D.integer = 5;
			break;
		case Direction.downLeft:
			unknown7E9F4D.integer = 5;
			unknown7E9F49.integer = -5;
			break;
		case Direction.left:
			unknown7E9F49.integer = -5;
			break;
		case Direction.upLeft:
			unknown7E9F4D.integer = -5;
			unknown7E9F49.integer = -5;
			break;
		default: break;
	}
}

/// $C0E516
void unknownC0E516() {
	gameState.unknown90 = 1;
	unknownC0E44D();
	FixedPoint1616 x12 = unknownC41FFF(unknown7E9F61, unknown7E9F63);
	unknown7E9F51.integer = x12.integer >> 8 + unknown7E9F67;
	unknown7E9F55.integer = x12.integer >> 8 + unknown7E9F69;
	if (teleportStyle != TeleportStyle.psiBetter) {
		if ((unknownC0DED9(gameState.leaderX.integer, gameState.leaderY.integer, unknown7E9F51.integer, unknown7E9F55.integer, gameState.leaderDirection) & 0xC0) != 0) {
			unknown7E9F43 = 2;
		}
		if (battleSwirlCountdown != 0) {
			unknown7E9F43 = 2;
			battleDebug = 1;
		}
		if (npcCollisionCheck(unknown7E9F51.integer, unknown7E9F55.integer, gameState.currentPartyMembers) != -1) {
			unknown7E9F43 = 2;
		}
	}
	if (unknown7E9F43 != 2) {
		gameState.leaderX.integer = unknown7E9F51.integer;
		gameState.leaderY.integer = unknown7E9F55.integer;
	}
	gameState.leaderDirection = ((unknown7E9F61 >> 13) + 2) & 7;
	unknown7E9F45.combined += 0x1851;
	if (teleportStyle == TeleportStyle.psiBeta) {
		unknown7E9F61 += 0xA00;
		unknown7E9F63 += 0xC;
	} else {
		unknown7E9F65 += 0x20;
		unknown7E9F61 += unknown7E9F65;
		unknown7E9F63 += 0x10;
	}
	centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
	unknownC0E196();
	unknownC0E254();
	if (teleportStyle == TeleportStyle.psiBeta) {
		if (unknown7E9F63 > 0x1000) {
			unknown7E9F43 = 1;
			unknownC0E48A();
		}
	} else {
		if (unknown7E9F65 > 0x1800) {
			unknown7E9F43 = 1;
			unknownC0E48A();
		}
	}
}

/// $C0E674
void unknownC0E674() {
	unknownC0DF22(gameState.leaderDirection);
	gameState.leaderX.combined += unknown7E9F49.combined;
	gameState.leaderY.combined += unknown7E9F4D.combined;
	unknown7E9F5B += unknown7E9F59;
	unknown7E9F5F += unknown7E9F5D;
	centerScreen(unknown7E9F5B, unknown7E9F5F);
	unknownC0E196();
}

/// $C0E776
void unknownC0E776() {
	unknownC0DF22(gameState.leaderDirection);
	gameState.leaderX.combined += unknown7E9F49.combined;
	gameState.leaderX.combined += unknown7E9F4D.combined;
	centerScreen(cast(short)(gameState.leaderX.integer - ((unknown7E9F45.combined * 2) & 0xFFFF)), gameState.leaderY.integer);
	unknownC0E196();
	unknownC0E254();
}

/// $C0E815
void unknownC0E815() {
	if (teleportStyle == TeleportStyle.instant) {
		return;
	}
	for (short i = 0x18; i < 0x1E; i++) {
		entityCollidedObjects[i] = 0x8000;
	}
	unknown7E9F4D.integer = 0;
	unknown7E9F49.integer = 0;
	setPartyTickCallbacks(0x17, &unknownC0E674, &unknownC0E3C1);
	unknown7E9F59 = unknown7E9F49.integer;
	unknown7E9F5B = gameState.leaderX.integer;
	unknown7E9F5D = unknown7E9F4D.integer;
	unknown7E9F5F = gameState.leaderY.integer;
	fadeOut(1, 4);
	unknownC0DD0F();
}

/// $C0E897
void unknownC0E897() {
	if (teleportStyle == TeleportStyle.instant) {
		centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
		fadeIn(1, 1);
		unknownC0DD0F();
		return;
	}
	for (short i = 0; i < 6; i++) {
		partyCharacters[i].unknown55 = 0xFFFF;
		unknownC07A56(gameState.unknown96[i] - 1, 0, cast(short)(i + 0x18));
	}
	unknown7E9F45.fraction = 0;
	unknown7E9F45.integer = 8;
	gameState.leaderDirection = 6;
	unknown7E9F43 = 3;
	setPartyTickCallbacks(0x17, &unknownC0E776, &unknownC0E3C1);
	unknownC0DE16();
	changeMusic(Music.teleportIn);
	for (short i = 0; i < 0x1E; i++) {
		waitUntilNextFrame();
	}
	fadeIn(1, 4);
	while (unknown7E9F45.integer != 0) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
	centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
}

/// $C0E979
void unknownC0E979() {
	//nothing
}

/// $C0E97C
void unknownC0E97C() {
	entitySurfaceFlags[currentEntitySlot] = unknownC05F33(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], currentEntitySlot);
	unknownC07A56(entityScriptVar0Table[currentEntitySlot], -1, currentEntitySlot);
}

/// $C0E9BA
void unknownC0E9BA() {
	unknown7EB4B6 = 1;
	changeMusic(Music.teleportFail);
	for (short i = partyLeaderEntityIndex; i < maxEntities; i++) {
		entityScriptVar7Table[i] |= 0x8000;
	}
	setPartyTickCallbacks(0x17, &unknownC0E979, &unknownC0E97C);
	gameState.partyStatus = 1;
	for (short i = 0; i < 0xB4; i++) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
	gameState.partyStatus = 0;
	unknown7EB4B6 = 0;
}

/// $C0EA3E
void teleportFreezeObjects() {
	for (short i = 0; i < 0x17; i++) {
		entityTickCallbackFlags[i] |= objectTickDisabled | objectMoveDisabled;
	}
}

/// $C0EA68
void teleportFreezeObjects2() {
	for (short i = 0; i < 0x17; i++) {
		if ((entityTickCallbackFlags[i] & (objectTickDisabled | objectMoveDisabled)) != (objectTickDisabled | objectMoveDisabled)) {
			entityTickCallbackFlags[i] |= objectTickDisabled | objectMoveDisabled;
		}
	}
}

/// $C0EA99
void teleportMainLoop() {
	stopMusic();
	waitUntilNextFrame();
	teleportFreezeObjects();
	unknown7E5DBA = 1;
	unknown7E9F45.fraction = 0;
	unknown7E9F45.integer = 0;
	unknown7E9F43 = 0;
	unknownC07C5B();
	unknownC0DE46();
	switch(teleportStyle) {
		case TeleportStyle.psiAlpha:
		case TeleportStyle.unknown:
			setPartyTickCallbacks(0x17, &unknownC0E28F, &unknownC0E3C1);
			break;

		case TeleportStyle.psiBeta:
			setPartyTickCallbacks(0x17, &unknownC0E516, &unknownC0E3C1);
			break;
		case TeleportStyle.instant:
			unknown7E9F43 = 1;
			break;
		case TeleportStyle.psiBetter:
			setPartyTickCallbacks(0x17, &unknownC0E516, &unknownC0E3C1);
			break;
		default: break;
	}
	if (teleportStyle != TeleportStyle.instant) {
		changeMusic(Music.teleportOut);
	} else do {
		oamClear();
		runActionscriptFrame();
		teleportFreezeObjects2();
		updateScreen();
		waitUntilNextFrame();
	} while (unknown7E9F43 != 0);

	switch (unknown7E9F43) {
		case 1:
			unknownC0E815();
			unknownC0DD79();
			unknownC0E897();
			if (teleportStyle == TeleportStyle.unknown) {
				unknownC46881(textLearnedPSITeleportAlpha.ptr);
			}
			break;
		case 2:
			unknownC0E9BA();
			unknownC0DD2C(0xA);
			break;
		default: break;
	}
	setPartyTickCallbacks(0x17, &unknownC05200, &unknownC04D78);
	unknownC0DE7C();
	unknownC09451();
	unknown7E5DBA = 0;
	unknown7E9F45.fraction = 0;
	unknown7E9F45.integer = 0;
	unknown7E5D58 = 0;
	teleportDestination = 0;
}

/// $C0EBE0
void unknownC0EBE0() {
	decomp(&titleScreenGraphics[0], &unknown7F0000[0]);
	copyToVRAM(0, 0x8000, 0, &unknown7F0000[0]);
	decomp(&titleScreenArrangement[0], &unknown7F0000[0]);
	copyToVRAM(0, 0x1000, 0x5800, &unknown7F0000[0]);
	decomp(&unknownE1C6E5[0], &unknown7F0000[0]);
	copyToVRAM(0, 0x4000, 0x6000, &unknown7F0000[0]);
}

/// $C0EC77
void unknownC0EC77(short arg1) {
	if (arg1 == 0) {
		decomp(&unknownE1AE83[0], &unknown7F0000[0]);
	} else {
		decomp(&unknownE1AEFD[0], &unknown7F0000[0]);
	}
}

/// $C0ECB7
void unknownC0ECB7() {
	unknown7E0030 = 0;
	decomp(&titleScreenPalette[0], &palettes[0][0]);
	unknownC496F9();
	memset(&palettes[0][0], 0, 0x100);
	unknownC496E7(0xA5, 0xFF);
	unknown7E0030 = 0x18;
}

/// $C0ED14
void unknownC0ED14() {
	memset(&palettes[0][0], 0xFF, 0x100);
	unknown7E0030 = 0x18;
}

/// $C0ED39
void unknownC0ED39() {
	memset(&palettes[0][0], 0, 0x100);
	unknown7E0030 = 0x18;
}

/// $C0ED5C
void unknownC0ED5C() {
	unknown7E0030 = 0;
	decomp(&titleScreenPalette[0], &palettes[0][0]);
	unknownC0EC77(0);
	memcpy(&palettes[8][0], &unknown7F0000[0x1A0], 0x20);
	unknownC0EC77(1);
	memcpy(&palettes[7][0], &unknown7F0000[0x260], 0x20);
	unknown7E0030 = 0x18;
}

/// $C0EDD1
void unknownC0EDD1() {
	unknown7E9641 = 2;
}

/// $C0EDDA
void unknownC0EDDA() {
	short x16 = entityScriptVar0Table[currentEntitySlot];
	short x14 = entityScriptVar1Table[currentEntitySlot];
	short x02 = entityScriptVar2Table[currentEntitySlot];
	memcpy(&palettes[x14][0], &unknown7F0000[x16 * 32], 0x20);
	short x12 = cast(short)(x16 + 1);
	if (x12 == x02) {
		x12 = 0;
	}
	entityScriptVar0Table[currentEntitySlot] = x12;
	unknown7E0030 = 0x18;
}

/// $C0EE47
void unknownC0EE47() {
	mirrorTM = 0x13;
}

/// $C0EE53
void unknownC0EE53() {
	entitySpriteMapFlags[currentEntitySlot] &= 0x7FFF;
}

/// $C0EE68
void logoScreenLoad(short arg1) {
	unknownC08D79(1);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x4000, 0);
	mirrorTM = 4;
	switch (arg1) {
		case 0:
			decomp(&nintendoGraphics[0], &unknown7F0000[0]);
			decomp(&nintendoArrangement[0], &introBG2Buffer[0]);
			decomp(&nintendoPalette[0], &palettes[0][0]);
			break;
		case 1:
			decomp(&apeGraphics[0], &unknown7F0000[0]);
			decomp(&apeArrangement[0], &introBG2Buffer[0]);
			decomp(&apePalette[0], &palettes[0][0]);
			break;
		case 2:
			decomp(&halkenGraphics[0], &unknown7F0000[0]);
			decomp(&halkenArrangement[0], &introBG2Buffer[0]);
			decomp(&halkenPalette[0], &palettes[0][0]);
			break;
		default: break;
	}
	copyToVRAM(0, 0x8000, 0, &unknown7F0000[0]);
	copyToVRAM(0, 0x800, 0x4000, &introBG2Buffer[0]);
	unknown7E0030 = 0x18;
}

/// $C0EFE1
short unknownC0EFE1(short arg1) {
	for (short i = arg1; i != 0; i--) {
		if (padPress[0] != 0) {
			return 1;
		}
		waitUntilNextFrame();
	}
	return 0;
}

/// $C0F009
short logoScreen() {
	logoScreenLoad(0);
	fadeInWithMosaic(1, 2, 0);
	if (debugging != 0) {
		unknownC0EFE1(0xB4);
	} else {
		for (short i = 0; i < 0xB4; i++) {
			waitUntilNextFrame();
		}
	}
	fadeOutWithMosaic(1, 2, 0);
	logoScreenLoad(1);
	fadeInWithMosaic(1, 2, 0);
	if (unknownC0EFE1(0x78) != 0) {
		fadeOutWithMosaic(2, 1, 0);
		return 1;
	}
	fadeOutWithMosaic(1, 2, 0);
	logoScreenLoad(2);
	fadeInWithMosaic(1, 2, 0);
	if (unknownC0EFE1(0x78) != 0) {
		fadeOutWithMosaic(2, 1, 0);
		return 1;
	}
	fadeOutWithMosaic(1, 2, 0);
	return 0;
}

/// $C0F0D2
void gasStationLoad() {
	bg2YPosition = 0;
	bg2XPosition = 0;
	bg1YPosition = 0;
	bg1XPosition = 0;
	decomp(&gasStationGraphics[0], &unknown7F0000[0]);
	copyToVRAM(0, 0xC000, 0, &unknown7F0000[0]);
	decomp(&gasStationArrangement[0], &unknown7F0000[0]);
	copyToVRAM(0, 0x800, 0x7800, &unknown7F0000[0]);
	decomp(&gasStationPalette[0], &palettes[0][0]);
	unknownC4A377();
	unknownC496F9();
	memset(&unknown7F0000[0x40], 0, 0x20);
	memset(&palettes[0][0], 0, 0x40);
	memset(&palettes[3][0], 0, 0x1A0);
	unknownC496E7(0x1E0, -1);
	mirrorTM = 1;
	mirrorTD = 2;
	CGWSEL = 2;
	CGADSUB = 3;
	unknown7E0030 = 0x18;
}

/// $C0F1D2
void unknownC0F1D2(short arg1) {
	//the original code also seems to set the bank byte separately, for some reason.
	unknownC4954C(100, &palettes[0][0]);
	unknownC496E7(arg1, -1);
}

/// $C0F21E
short unknownC0F21E() {
	short result = 0;
	for (short i = 0; i < 236; i++) {
		if (padPress[0] != 0) {
			return 1;
		}
		unknownC2DB3F();
		waitUntilNextFrame();
	}
	for (short i = 0; i < 480; i++) {
		if (padPress[0] != 0) {
			return 1;
		}
		memcpy(&unknown7E4476[0], &palettes[2][0], 0x20);
		updateMapPaletteAnimation();
		unknown7E0030 = 0;
		unknownC2DB14();
		memcpy(&palettes[2][0], &unknown7E4476[0], 0x20);
		unknownC2DB3F();
		unknown7E0030 = 0x18;
		waitUntilNextFrame();
	}
	unknownC49740();
	CGADSUB = 0;
	CGWSEL = 0;
	mirrorTM = 1;
	mirrorTD = 0;
	if (unknownC0EFE1(120) != 0) {
		return 1;
	}
	changeMusic(Music.gasStation2);
	short x12 = initEntityWipe(ActionScript.unknown860, 0, 0);
	while (entityScriptTable[x12] != -1) {
		runActionscriptFrame();
		waitUntilNextFrame();
		if (padPress[0] != 0) {
			unknownC09C35(x12);
			return 1;
		}
	}
	unknownC0F1D2(330);
	return result;
}

/// $C0F33C
short gasStation() {
	unknownC0927C();
	gasStationLoad();
	fadeIn(1, 11);
	short x11 = unknownC0F21E();
	if (x11 != 0) {
		return 1;
	}
	for (short i = 0; i < 0x14A; i++) {
		if (padPress[0] != 0) {
			return 1;
		}
		updateMapPaletteAnimation();
		waitUntilNextFrame();
	}
	mirrorTM = 0;
	memset(&palettes[0][0], 0, 0x200);
	unknown7E0030 = 0x18;
	if (x11 == 0) { //isn't this always true...?
		unknownC0EFE1(0x1E);
	}
	return x11;
}

/// $C0F3B2
void unknownC0F3B2() {
	decomp(&gasStationPalette2[0], &palettes[0][0]);
	unknownC0856B(0x18);
}

/// $C0F3E8
void unknownC0F3E8() {
	decomp(&gasStationPalette[0], &palettes[0][0]);
	unknownC0856B(0x18);
}

/// $C0F41E
void unknownC0F41E() {
	if (bg3YPosition > unknown7EB4E3) {
		short x23 = unknown7EB4F7;
		short x21 = cast(short)(unknown7EB4F7 + 1);
		unknown7EB4F7 = (unknown7EB4F7 + 2) & 0xF;
		short x04 = ((bg3YPosition / 8) + 29) & 0x1F;
		short x02 = 0;
		short x1F = 0;
		const(ubyte)* x1B = unknown7EB4E7;
		ushort* x17 = &bg2Buffer[x23 * 32];
		ushort* x0A = &bg2Buffer[x21 * 32];
		short x15 = (x1B++)[0];
		switch (x15) {
			case 1:
				unknown7EB4E3 += 8;
				while (x1B[0] != 0) {
					(x17++)[0] = cast(ushort)((x1B++)[0] + 0x2000);
					x02++;
				}
				unknownC4EFC4(0, cast(short)(x02 * 2), cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)), cast(ubyte*)&bg2Buffer[x23 * 32]);
				break;
			case 2:
				unknown7EB4E3 += 16;
				while (x1B[0] != 0) {
					(x17++)[0] = cast(ushort)(x1B[0] + 0x2400);
					(x0A++)[0] = cast(ushort)((x1B++)[0] + 0x2410);
					x02++;
				}
				unknownC4EFC4(0, cast(short)(x02 * 2), cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)), cast(ubyte*)&bg2Buffer[x23 * 32]);
				if (x04 != 0x1F) {
					x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) + 0x20);
				} else {
					x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) - 0x3E0);
				}
				unknownC4EFC4(0, cast(short)(x02 * 2), x23, cast(ubyte*)&bg2Buffer[x21 * 32]);
				break;
			case 3:
				unknown7EB4E3 += x1B[0] * 8;
				break;
			case 4:
				ubyte* x15_2 = &gameState.earthboundPlayerName[0];
				if (x15_2[0] != 0) {
					for (short i = 0; x15_2[0] != 0; i++) {
						short x13 = x15_2[0];
						switch (x13) {
							case 0xAC:
								unknown7EB4F9[i] = 0x7C;
								break;
							case 0xAE:
								unknown7EB4F9[i] = 0x7E;
								break;
							case 0xAF:
								unknown7EB4F9[i] = 0x7F;
								break;
							default:
								if (x13 > 0x90) {
									x13 -= 0x50;
								} else {
									x13 -= 0x30;
								}
								unknown7EB4F9[i] = cast(ubyte)x13;
								break;
						}
						x15_2++;
					}
					unknown7EB4E3 += 16;
					for (short i = 0; (unknown7EB4F9[i] != 0) && (i < 24); i++) {
						(x17++)[0] = cast(ushort)(unknown7EB4F9[i] & 0xF0 + unknown7EB4F9[i] + 0x2400);
						(x0A++)[0] = cast(ushort)(unknown7EB4F9[i] & 0xF0 + unknown7EB4F9[i] + 0x2410);
					}
					unknownC4EFC4(0, cast(short)(x02 * 2), cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)), cast(ubyte*)&bg2Buffer[x23 * 32]);
					if (x04 != 0x1F) {
						x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) + 0x20);
					} else {
						x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) - 0x3E0);
					}
					unknownC4EFC4(0, cast(short)(x02 * 2), x23, cast(ubyte*)&bg2Buffer[x21 * 32]);
				}
				x1B--;
				break;
			case 0xFF:
				unknown7EB4E3 = -1;
				break;
			default: break;
		}
		unknown7EB4E7 = x1B + 1;
	}
	if (unknown7EB4E5 < bg3YPosition) {
		unknown7EB4E5 += 8;
		unknownC4EFC4(3, 0x40, ((((bg3YPosition / 8) - 1) & 0x1F) * 32) + 0x6C00, &unknownC40BE8[0]);
	}
	unknown7EB4EB.combined += 0x4000;
	bg3YPosition = unknown7EB4EB.integer;
	unknownC0AD9F();
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
	nativeNMI: &nmi,
	nativeIRQ: &irq,
	emulationRESET: &start,
};
