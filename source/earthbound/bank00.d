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
import earthbound.text;
import earthbound.bank0F;
import earthbound.bank10;
import earthbound.bank11;
import earthbound.bank15;
import earthbound.bank17;
import earthbound.bank1C;
import earthbound.bank1F;
import earthbound.bank20;
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.testing;
import core.stdc.string;
import core.bitop;
import std.logger;

/** Clears and returns the entity draw sorting table
 * Original_Address: $(DOLLAR)C00000
 */
short* clearEntityDrawSortingTable() {
	entityDrawSorting[] = 0;
	return entityDrawSorting.ptr;
}

/** Sets up the PPU for the overworld game mode
 * Original_Address: $(DOLLAR)C00013
 */
void overworldSetupVRAM() {
	setBGMODE(BGMode.mode1 | BG3Priority);
	setBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0);
	setBG2VRAMLocation(BGTileMapSize.horizontal, 0x5800, 0x2000);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	setOAMSize(0x62);
}

/// $C0004B
void overworldInitialize() {
	overworldSetupVRAM();
	buffer[0] = 0;
	copyToVRAM(3, 0, 0, &buffer[0]);
	loadedMapPalette = -1;
	loadedMapTileCombo = -1;
}

/// $C00085
void loadTilesetAnim() {
	loadedAnimatedTileCount = 0;
	if (mapTilesetAnimations[loadedMapTileset].count == 0) {
		return;
	}
	decomp(&mapDataAnimatedTilesets[loadedMapTileset][0], &animatedTilesetBuffer[0]);
	loadedAnimatedTileCount = mapTilesetAnimations[loadedMapTileset].count;
	for (short i = 0; i < loadedAnimatedTileCount; i++) {
		overworldTilesetAnim[i].frameCount = mapTilesetAnimations[loadedMapTileset].animations[i].frameCount;
		overworldTilesetAnim[i].framesUntilUpdate = mapTilesetAnimations[loadedMapTileset].animations[i].frameDelay;
		overworldTilesetAnim[i].frameDelay = mapTilesetAnimations[loadedMapTileset].animations[i].frameDelay;
		overworldTilesetAnim[i].copySize = mapTilesetAnimations[loadedMapTileset].animations[i].copySize;
		overworldTilesetAnim[i].sourceOffset = mapTilesetAnimations[loadedMapTileset].animations[i].sourceOffset;
		overworldTilesetAnim[i].sourceOffset2 = mapTilesetAnimations[loadedMapTileset].animations[i].sourceOffset;
		overworldTilesetAnim[i].destinationAddress = mapTilesetAnimations[loadedMapTileset].animations[i].destinationAddress;
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
		copyToVRAM(0, overworldTilesetAnim[i].copySize, overworldTilesetAnim[i].destinationAddress, &animatedTilesetBuffer[overworldTilesetAnim[i].sourceOffset2]);
		overworldTilesetAnim[i].sourceOffset2 += overworldTilesetAnim[i].copySize;
		overworldTilesetAnim[i].frameCounter++;
	}
}

/// $C0023F
void loadPaletteAnim() {
	mapPaletteAnimationLoaded = 0;
	if (palettes[5][0] == 0) {
		return;
	}
	if (mapPaletteAnimations[palettes[5][0] - 1].count == 0) {
		return;
	}
	decomp(&mapPaletteAnimationData[mapPaletteAnimations[palettes[5][0] - 1].id][0], &animatedMapPaletteBuffer[0]);
	for (short i = 0; i < overworldPaletteAnim.delays.length; i++) {
		overworldPaletteAnim.delays[i] = 0;
	}
	for (short i = 0; i < mapPaletteAnimations[palettes[5][0] - 1].count; i++) {
		overworldPaletteAnim.delays[i] = mapPaletteAnimations[palettes[5][0] - 1].entries[i];
	}
	overworldPaletteAnim.timer = overworldPaletteAnim.delays[0];
	mapPaletteAnimationLoaded = 1;
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
	copyMapPaletteFrame(overworldPaletteAnim.index);
	overworldPaletteAnim.index++;
}

/// $C0035B
ushort unknownC0035B(ushort a, ushort x, ushort y) {
	return tilemapBuffer[a * 16 + x + y * 4];
}

/// $C00391
void getColorAverage(ushort* palette) {
	ushort red = 0;
	ushort blue = 0;
	ushort green = 0;
	ushort count = 0;
	ushort* colour = palette - 1;
	for (short i = 0; i < 96; i++) {
		ushort value = *++colour;
		if ((value & 0x7FFF) == 0) {
			continue;
		}
		red += value & BGR555Mask.Red;
		green += (value & BGR555Mask.Green) >> 5;
		blue += (value & BGR555Mask.Blue) >> 10;
		count++;
	}
	colourAverageRed = cast(ushort)((red * 8) / count);
	colourAverageGreen = cast(ushort)((green * 8) / count);
	colourAverageBlue = cast(ushort)((blue * 8) / count);
}

/// $C00434
ushort adjustSingleColour(ushort original, ushort modified) {
	if (original == modified) {
		return modified;
	} else if (original > modified) {
		if (original - modified > 6) {
			return cast(ushort)(original - 6);
		} else {
			return modified;
		}
	} else if (modified - original > 6) {
		return cast(ushort)(original + 6);
	}
	return modified;
}

/// $C00480
void adjustSpritePalettesByAverage() {
	getColorAverage(&palettes[2][0]);
	ushort redModifier = cast(ushort)((colourAverageRed << 8) / savedColourAverageRed);
	ushort greenModifier = cast(ushort)((colourAverageGreen << 8) / savedColourAverageGreen);
	ushort blueModifier = cast(ushort)((colourAverageBlue << 8) / savedColourAverageBlue);
	ushort combinedModifier = (redModifier + greenModifier + blueModifier) / 3;
	if ((redModifier <= 0x100) && (greenModifier <= 0x100) && (blueModifier <= 0x100)) {
		for (short i = 0x80; i < 0x100; i++) {
			ushort modifiedRed, newRed, modifiedGreen, newGreen, modifiedBlue, newBlue;
			modifiedRed = newRed = palettes[i / 16][i % 16] & BGR555Mask.Red;
			modifiedGreen = newGreen = (palettes[i / 16][i % 16] & BGR555Mask.Green) >> 5;
			modifiedBlue = newBlue = (palettes[i / 16][i % 16] & BGR555Mask.Blue) >> 10;
			// shades of grey use combined multiplier
			if ((modifiedRed == modifiedGreen) && (modifiedGreen == modifiedBlue) && (modifiedBlue == modifiedRed)) {
				modifiedRed *= combinedModifier;
				modifiedGreen *= combinedModifier;
				modifiedBlue *= combinedModifier;
			} else {
				modifiedRed *= redModifier;
				modifiedGreen *= greenModifier;
				modifiedBlue *= blueModifier;
			}
			newRed = adjustSingleColour(newRed, (modifiedRed >> 8) & 0x1F);
			modifiedGreen = adjustSingleColour(newGreen, (modifiedGreen >> 8) & 0x1F);
			newBlue = adjustSingleColour(newBlue, (modifiedBlue >> 8) & 0x1F);
			palettes[i / 16][i % 16] = cast(ushort)((newBlue << 10) | (modifiedGreen << 5) | newRed);
		}
	}
}

/// $C005E7
void prepareAverageForSpritePalettes() {
	memcpy(&palettes[2][0], &mapPalettes[1][0], 0xC0);
	getColorAverage(&palettes[2][0]);
	savedColourAverageRed = colourAverageRed;
	savedColourAverageGreen = colourAverageGreen;
	savedColourAverageBlue = colourAverageBlue;
}

/// $C0062A
void loadCollisionData(short tileset) {
	const(ubyte[4][4]*)* src = &mapTileCollisionData[tileset][0];
	const(ubyte[4][4])** dest = &tileCollisionBuffer[0];
	for (short i = 0; i < 0x3C0; i++) {
		*(dest++) = *(src++);
	}
}

/** Replaces a loaded overworld block with another
 * Params:
 * 	target = The block being replaced
 * 	source = The block to replace the target with
 * Original_Address: $(DOLLAR)C0067E
 */
void replaceBlock(short target, short source) {
	ushort* dest = &tilemapBuffer[target * 16];
	ushort* src = &tilemapBuffer[source * 16];
	for (short i = 0; i < 16; i++) {
		*(dest++) = *(src++);
	}
	tileCollisionBuffer[target] = tileCollisionBuffer[source];
}

/** Applies relevant event flag-controlled map changes for the given tileset
 * Params:
 * 	id = The palette+tileset combo to lookup
 * Original_Address: $(DOLLAR)C006F2
 */
void loadMapBlockEventChanges(short id) {
	const(MapBlockEvent)* mapBlockEvent = &eventControlPointerTable[id][0];
	while (true) {
		if (mapBlockEvent.eventFlag == 0) {
			break;
		}
		short flag = getEventFlag(mapBlockEvent.eventFlag & 0x7FFF);
		if (flag == (mapBlockEvent.eventFlag >= eventFlagUnset) ? 1 : 0) {
			const(MapBlockPair)* blockPair = &mapBlockEvent.blocks[0];
			for (short i = mapBlockEvent.count; i != 0; i--) {
				replaceBlock(blockPair.block1, blockPair.block2);
				blockPair++;
			}
		}
		mapBlockEvent++;
	}
}

/** Loads sprite palette 4, using bg palette 4's transparent colour as a palette index to copy from
 * Original_Address: $(DOLLAR)C00778
 */
void loadSpecialSpritePalette() {
	if (palettes[4][0] == 0) {
		return;
	}
	ushort* src = &palettes[palettes[4][0]][0];
	for (short i = 0; i < 16; i++) {
		palettes[12][i] = *(src++);
	}
}

/** Loads the specified map palette. If the flag in bg palette 2's transparent colour is set, try the palette pointed to by bg palette 3's transparent colour until a palette with a non-set flag is reached.
 * Params:
 * 	tileCombo = The map tile/palette combo
 * 	palette = The subpalettes to load
 * Original_Address: $(DOLLAR)C007B6
 */
void loadMapPalette(short tileCombo, short palette) {
	enum mapPaletteSize = 6 * 16 * ushort.sizeof;
	const(ubyte)* src = &mapPalettes[tileCombo][palette * mapPaletteSize];
	if (photographMapLoadingMode == 0) {
		while (true) {
			memcpy(&palettes[2][0], src, mapPaletteSize);
			if (palettes[2][0] == 0) {
				break;
			}
			if (getEventFlag(palettes[2][0] & 0x7FFF) != (palettes[2][0] > eventFlagUnset) ? 1 : 0) {
				break;
			}
			//the original code used palettes[3][0] as a raw near pointer, which isn't possible on most platforms
			src = &paletteOffsetToPointer(palettes[3][0])[0];
		}
	} else {
		decomp(&photographMapPalettes[0], &buffer[0]);
		memcpy(&palettes[2][0], &buffer[photographerConfigTable[currentPhotoDisplay].creditsMapPalettesOffset], mapPaletteSize);
	}
}

/** Loads all map data for the specified map sector - palette, graphics, collision, etc.
 * Params:
 * 	x = X coordinate of the sector to load (in pixel/32 units)
 * 	y = Y coordinate of the sector to load (in pixel/16 units)
 * Original_Address: $(DOLLAR)C008C3
 */
void loadMapAtSector(short x, short y) {
	tracef("Loading map sector %d, %d", x, y);
	if ((currentTeleportDestinationX | currentTeleportDestinationY) != 0) {
		x = currentTeleportDestinationX / 32;
		y = currentTeleportDestinationY / 16;
	}
	ubyte x1A = globalMapTilesetPaletteData[y][x];
	ubyte palette = x1A & 7;
	ubyte tileCombo = x1A >> 3;
	tracef("Loading map tileset %d, palette %d", tileCombo, palette);
	decomp(&mapTilemaps[tilesetGraphicsMapping[tileCombo]][0], &tilemapBuffer[0]);
	loadCollisionData(tilesetGraphicsMapping[tileCombo]);
	loadMapBlockEventChanges(tilesetGraphicsMapping[tileCombo]);
	prepareAverageForSpritePalettes();
	memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
	if (tileCombo != loadedMapTileCombo) {
		loadedMapTileset = tilesetGraphicsMapping[tileCombo];
		decomp(&mapTiles[tilesetGraphicsMapping[tileCombo]][0], &buffer[0]);
		while (fadeParameters.step != 0) { waitForInterrupt(); }
		if (photographMapLoadingMode == 0) {
			copyToVRAMChunked(0, 0x7000, 0, &buffer[0]);
		} else {
			copyToVRAMChunked(0, 0x4000, 0, &buffer[0]);
		}
	}
	while (fadeParameters.step != 0) { waitForInterrupt(); }
	loadMapPalette(tileCombo, palette);
	adjustSpritePalettesByAverage();
	loadSpecialSpritePalette();
	if (photographMapLoadingMode == 0) {
		loadOverlaySprites();
		loadTilesetAnim();
		loadPaletteAnim();
	}
	if (photographMapLoadingMode == 0) {
		if (debugging != 0) {
			loadDebugTextGraphicsAuto();
		} else {
			loadTextPalette();
		}
		preparePaletteUpload(PaletteUpload.none);
	}
	memcpy(&mapPaletteBackup[0], &palettes[2][0], 0x1C0);
	if (wipePalettesOnMapLoad != 0) {
		prepareLoadedPalettesForFade();
		memset(&palettes[0][0], 0xFF, 0x200);
		wipePalettesOnMapLoad = 0;
	}
	if (photographMapLoadingMode != 0) {
		prepareLoadedPalettesForFade();
		memset(&palettes[1][0], 0, 0x1E0);
	}
	preparePaletteUpload(PaletteUpload.full);
	loadedMapTileCombo = tileCombo;
	loadedMapPalette = palette;
}

/** Sets and retrieves the sector attributes for the specified coordinates
 * Params:
 * 	x = X coordinate (pixels)
 * 	y = Y coordinate (pixels)
 * Original_Address: $(DOLLAR)C00AA1
 */
short loadSectorAttributes(ushort x, ushort y) {
	currentSectorAttributes = mapDataPerSectorAttributesTable[(y &0xFF80) >> 7][x >> 8];
	return currentSectorAttributes;
}

/** Loads a row of map block data, starting from (x, y) to (x + 16, y), representing a 512x32 pixel area
* Params:
*	x = X coordinate in tiles
*	y = Y coordinate in tiles
* Mutates:
* 	loadedRowsX = Block X coordinate of the row being loaded
* 	loadedRowsY = Block Y coordinate of the row being loaded
*	loadedMapBlocks = The IDs of the map blocks in the requested area
* See_Also: loadMapBlock
* Original_Address: $(DOLLAR)C00AC5
*/
void loadMapRow(short x, short y) {
	y /= 4;
	short x16 = x / 4;
	x = x16 & 0xF;
	loadedRowsX[x] = cast(byte)x16;
	loadedRowsY[y & 0xF] = cast(byte)y;
	ubyte x12;
	version(noUndefinedBehaviour) {
		// Use a boolean to track that x12 hasn't been set yet
		bool x12Set = false;
	} else {
		x12 = globalMapTilesetPaletteData[y / 4][x16 / 8] / 8;
	}
	ushort* x14 = cast(ushort*)&loadedMapBlocks[y & 0xF];
	if (cast(ushort)y < 0x140) {
		short x10 = x;
		for (short i = 0; i < 16; i++) {
			version(noUndefinedBehaviour) {
				// Set x12 only if coordinates are in range, and only if it needs
				// to be set (it was never set, or beginning new sector)
				if ((cast(ushort)x16 < 0x100) && (!x12Set || ((x16 & 7) == 0))) {
					x12 = globalMapTilesetPaletteData[y / 4][x16 / 8] / 8;
					x12Set = true;
				}
				if ((cast(ushort)x16 < 0x100) && x12Set && (loadedMapTileCombo == x12)) {
					x14[x10] = loadMapBlock(x16, y);
				} else {
					x14[x10] = 0;
				}
			} else {
				if ((x16 & 8) == 0) {
					x12 = globalMapTilesetPaletteData[y / 4][x16 / 8] / 8;
				}
				if ((cast(ushort)x16 < 0x100) && (loadedMapTileCombo == x12)) {
					x14[x10] = loadMapBlock(x16, y);
				} else {
					x14[x10] = 0;
				}
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

/** Loads a column of map block data, starting from (x, y) to (x, y + 16), representing a 32x512 pixel area
* Params:
*	x = X coordinate in tiles
*	y = Y coordinate in tiles
* Mutates:
* 	loadedColumnsX = Block X coordinate of the column being loaded
* 	loadedColumnsY = Block Y coordinate of the column being loaded
*	loadedMapBlocks = The IDs of the map blocks in the requested area
* See_Also: loadMapBlock
* Original_Address: $(DOLLAR)C00BDC
*/
void loadMapColumn(short x, short y) {
	x /= 4;
	y /= 4;
	short x18 = x & 0xF;
	loadedColumnsX[x18] = cast(byte)x;
	short x16 = y & 0xF;
	loadedColumnsY[x16] = cast(byte)y;
	ubyte x14;
	version(noUndefinedBehaviour) {
		// Use a boolean to track that x14 hasn't been set yet
		bool x14Set = false;
	} else {
		x14 = globalMapTilesetPaletteData[y / 4][x / 8] / 8;
	}
	ushort* x12 = &loadedMapBlocks[0][x18];
	if (cast(ushort)x < 0x100) {
		short x10 = cast(short)(x16 * 16);
		for (short i = 0; i < 16; i++) {
			version(noUndefinedBehaviour) {
				// Set x14 only if coordinates are in range, and only if it needs
				// to be set (it was never set, or beginning new sector)
				if ((cast(ushort)y < 0x140) && (!x14Set || ((y & 3) == 0))) {
					x14 = globalMapTilesetPaletteData[y / 4][x / 8] / 8;
					x14Set = true;
				}
				if ((cast(ushort)y < 0x140) && x14Set && (loadedMapTileCombo == x14)) {
					x12[x10] = loadMapBlock(x, y);
				} else {
					x12[x10] = 0;
				}
			} else {
				if ((y & 3) == 0) {
					x14 = globalMapTilesetPaletteData[y / 4][x / 8] / 8;
				}
				if ((cast(ushort)y < 0x140) && (loadedMapTileCombo == x14)) {
					x12[x10] = loadMapBlock(x, y);
				} else {
					x12[x10] = 0;
				}
			}
			x10 = (x10 + 16) & 0xFF;
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
	ushort* x02 = &loadedMapBlocks[(y / 4) & 0xF][0];
	ubyte* x10 = &loadedCollisionTiles[y & 0x3F][0];
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
	ushort* x02 = &loadedMapBlocks[0][(x >> 2) & 0xF];
	ubyte* x10 = &loadedCollisionTiles[0][x & 0x3F];
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
void loadMapRowVRAM(short x, short y) {
	if (debugging != 0) {
		renderAttributeRow(x, y);
	}
	ushort* x1E = cast(ushort*)sbrk(0x100);
	ushort* x1C = &x1E[0x40];
	x--;
	ushort x18 = cast(ushort)((loadedMapBlocks[((y >> 2) & 0xF)][(x >> 2) & 0xF] * 16) + ((y & 3) * 4) + (x & 3));
	short x16 = x & 0x3F;
	for (short i = 0; i < 34; i++) {
		if ((x & 3) == 0) {
			x18 = cast(ushort)((loadedMapBlocks[(y >> 2) & 0xF][(x >> 2) & 0xF] * 16) + ((y & 3) * 4));
		}
		ushort x12 = tilemapBuffer[x18];
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
	copyToVRAM(0, 0x40, 0x3800 + ((y & 0x1F) * 32), cast(ubyte*)&x1E[0]);
	copyToVRAM(0, 0x40, 0x3C00 + ((y & 0x1F) * 32), cast(ubyte*)&x1E[0x20]);
	if (photographMapLoadingMode == 0) {
		copyToVRAM(0, 0x40, 0x5800 + ((y & 0x1F) * 32), cast(ubyte*)&x1C[0]);
		copyToVRAM(0, 0x40, 0x5C00 + ((y & 0x1F) * 32), cast(ubyte*)&x1C[0x20]);
	}
}

/// $C00FCB
void loadMapColumnVRAM(short x, short y) {
	if (debugging != 0) {
		renderAttributeColumn(x, y);
	}
	ushort* x1E = cast(ushort*)sbrk(0x80);
	ushort* x1C = &x1E[0x20];
	y--;
	ushort x18 = cast(ushort)((loadedMapBlocks[(y >> 2) & 0xF][(x >> 2) & 0xF] * 16) + ((y & 3) * 4) + (x & 3));
	short x16 = y & 0x1F;
	for (short i = 0; i < 30; i++) {
		if ((y & 3) == 0) {
			x18 = cast(ushort)((loadedMapBlocks[(y >> 2) & 0xF][(x >> 2) & 0xF] * 16) + (x & 3));
		}
		ushort x12 = tilemapBuffer[x18];
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
		copyToVRAM(0x1B, 0x40, 0x3800 + (x & 0x3F), cast(ubyte*)x1E);
		copyToVRAM(0x1B, 0x40, 0x5800 + (x & 0x3F), cast(ubyte*)x1C);
	} else {
		copyToVRAM(0x1B, 0x40, 0x3C00 + (x & 0x1F), cast(ubyte*)x1E);
		copyToVRAM(0x1B, 0x40, 0x5C00 + (x & 0x1F), cast(ubyte*)x1C);
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
	screenXPixels = x;
	screenXPixelsCopy = x;
	screenYPixels = y;
	screenYPixelsCopy = y;
	short x14 = x / 8;
	short x02 = y / 8;
	loadedMapPalette = -1;
	loadedMapTileCombo = -1;
	loadMapAtSector(x14 / 32, x02 / 16);
	for (short i = 0; i < 16; i++) {
		loadedColumnsY[i] = -1;
		loadedColumnsX[i] = -1;
		loadedRowsY[i] = -1;
		loadedRowsX[i] = -1;
	}
	for (short i = 0; i < 60; i++) {
		loadMapRow(cast(short)(x14 - 32), cast(short)(x02 - 32 + i));
	}
	for (short i = 0; i < 60; i++) {
		loadCollisionRow(cast(short)(x14 - 32), cast(short)(x02 - 32 + i));
	}
	for (short i = -1; i != 31; i++) {
		loadMapRowVRAM(cast(short)(x14 - 16), cast(short)(x02 - 14 + i));
	}
	while (fadeParameters.step != 0) { waitForInterrupt(); }
	bg2XPosition = cast(short)(screenXPixels - 0x80);
	bg1XPosition = cast(short)(screenXPixels - 0x80);
	bg2YPosition = cast(short)(screenYPixels - 0x70);
	bg1YPosition = cast(short)(screenYPixels - 0x70);
	screenLeftX = cast(short)(x14 - 16);
	screenTopY = cast(short)(x02 - 14);
}

/// $C013F6
void loadMapAtPosition(short x, short y) {
	tracef("Loading map at %s,%s", x, y);
	unknownC02194();
	screenXPixels = x;
	screenXPixelsCopy = x;
	screenYPixels = y;
	screenYPixelsCopy = y;
	short x02 = x / 8;
	short x12 = y / 8;
	loadMapAtSector(x02 / 32, x12 / 16);
	if (photographMapLoadingMode == 0) {
		overworldSetupVRAM();
	}
	for (short i = 0; i < 16; i++) {
		loadedColumnsY[i] = -1;
		loadedColumnsX[i] = -1;
		loadedRowsY[i] = -1;
		loadedRowsX[i] = -1;
	}
	for (short i = 0; i < 60; i++) {
		loadMapRow(cast(short)(x02 - 32), cast(short)(x12 - 32 + i));
	}
	for (short i = 0; i < 60; i++) {
		loadCollisionRow(cast(short)(x02 - 32), cast(short)(x12 - 32 + i));
	}
	while (fadeParameters.step != 0) { waitForInterrupt(); }
	if (photographMapLoadingMode == 0) {
		mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	}
	if (npcSpawnsEnabled != SpawnControl.allDisabled) {
		npcSpawnsEnabled = SpawnControl.offscreenOnly;
	}
	bg2XPosition = cast(short)(screenXPixels - 0x80);
	bg1XPosition = cast(short)(screenXPixels - 0x80);
	bg2YPosition = cast(short)(screenYPixels - 0x70);
	bg1YPosition = cast(short)(screenYPixels - 0x70);
	for (short i = -1; i != 31; i++) {
		loadMapRowVRAM(cast(short)(x02 - 16), cast(short)(x12 - 14 + i));
		spawnNPCsRow(cast(short)(x02 - 16), cast(short)(x12 - 14 + i));
	}
	for (short i = -8; i != 40; i++) {
		spawnEnemiesRow(cast(short)(x02 - 24), cast(short)(x12 - 14 + i));
	}
	if (npcSpawnsEnabled != SpawnControl.allDisabled) {
		npcSpawnsEnabled = SpawnControl.allEnabled;
	}
	screenLeftX = cast(short)(x02 - 16);
	screenTopY = cast(short)(x12 - 14);
}

/// $C01558
void refreshMapAtPosition(short x, short y) {
	bg2XPosition = x;
	bg1XPosition = x;
	bg2YPosition = y;
	bg1YPosition = y;
	short x04 = x / 8;
	short x02 = y / 8;
	while ((screenLeftX - x04) != 0) {
		if (((screenLeftX - x04) < 0) != 0) {
			screenLeftX++;
			loadMapColumn(cast(short)(screenLeftX + 41), cast(short)(x02 - 16));
			loadCollisionColumn(cast(short)(screenLeftX + 41), cast(short)(x02 - 16));
			loadMapColumnVRAM(cast(short)(screenLeftX + 32), x02);
			spawnNPCsColumn(cast(short)(screenLeftX + 34), cast(short)(x02 - 1));
			spawnEnemiesColumn(cast(short)(screenLeftX + 40), cast(short)(x02 - 8));
		} else {
			screenLeftX--;
			loadMapColumn(cast(short)(screenLeftX - 16), cast(short)(x02 - 16));
			loadCollisionColumn(cast(short)(screenLeftX - 16), cast(short)(x02 - 16));
			loadMapColumnVRAM(cast(short)(screenLeftX - 1), x02);
			spawnNPCsColumn(cast(short)(screenLeftX - 3), cast(short)(x02 - 1));
			spawnEnemiesColumn(cast(short)(screenLeftX - 8), cast(short)(x02 - 8));
		}
	}
	while ((screenTopY - x02) != 0) {
		if (((screenTopY - x02) < 0) != 0) {
			screenTopY++;
			loadMapRow(cast(short)(x04 - 16), cast(short)(screenTopY + 41));
			loadCollisionRow(cast(short)(x04 - 16), cast(short)(screenTopY + 41));
			loadMapRowVRAM(x04, cast(short)(screenTopY + 28));
			spawnNPCsRow(x04, cast(short)(screenTopY + 29));
			spawnEnemiesRow(cast(short)(x04 - 8), cast(short)(screenTopY + 36));
		} else {
			screenTopY--;
			loadMapRow(cast(short)(x04 - 16), cast(short)(screenTopY - 16));
			loadCollisionRow(cast(short)(x04 - 16), cast(short)(screenTopY - 16));
			loadMapRowVRAM(x04, cast(short)(screenTopY - 1));
			spawnNPCsRow(x04, cast(short)(screenTopY - 1));
			spawnEnemiesRow(cast(short)(x04 - 8), cast(short)(screenTopY - 8));
		}
	}
	bg12PositionXCopy = x;
	bg12PositionYCopy = y;
}

/// $C01731
void unknownC01731(short x, short y) {
	bg2XPosition = x;
	bg1XPosition = x;
	bg2YPosition = y;
	bg1YPosition = y;
	short x0E = x / 8;
	short x02 = y / 8;
	while (screenLeftX - x0E != 0) {
		if (screenLeftX - x0E < 0) {
			screenLeftX++;
			unknownC0122A(cast(short)(screenLeftX + 0x20), x02);
		} else {
			screenLeftX--;
			unknownC0122A(cast(short)(screenLeftX - 1), x02);
		}
	}
	while (screenTopY - x02 != 0) {
		if (screenTopY - x02 < 0) {
			screenTopY++;
			unknownC01181(x0E, cast(short)(screenTopY + 0x1C));
		} else {
			screenTopY--;
			unknownC01181(x0E, cast(short)(screenTopY - 1));
		}
	}
	bg12PositionXCopy = x;
	bg12PositionYCopy = y;
}

/// $C018F3
void reloadMap() {
	loadedMapPalette = -1;
	loadedMapTileCombo = -1;
	screenXPixels &= 0xFFF8;
	screenYPixels &= 0xFFF8;
	prepareForImmediateDMA();
	currentMapMusicTrack = -1;
	loadSectorMusic(gameState.leaderX.integer, gameState.leaderY.integer);
	setBGMODE(BGMode.mode1 | BG3Priority);
	setBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0);
	setBG2VRAMLocation(BGTileMapSize.horizontal, 0x5800, 0x2000);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	setOAMSize(0x62);
	reloadMapAtPosition(gameState.leaderX.integer, gameState.leaderY.integer);
	if (gameState.walkingStyle == WalkingStyle.bicycle) {
		changeMusic(Music.bicycle);
	} else {
		changeMapMusic();
	}
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	if (debugging != 0) {
		loadDebugTextGraphicsAuto();
	}
	setForceBlank();
}

/// $C019B2
void initializeMap(short x, short y, short direction) {
	loadSectorMusic(x, y);
	loadMapAtPosition(x, y);
	unknownC03FA9(x, y, direction);
	changeMapMusic();
}

/// $C019E2
void unknownC019E2() {
	for (short i = 0; i < 16; i++) {
		loadedColumnsY[i] = -1;
		loadedColumnsX[i] = -1;
		loadedRowsY[i] = -1;
		loadedRowsX[i] = -1;
	}
	short x04 = (bg1XPosition - 0x80) /8;
	short x10 = (bg1YPosition - 0x80) /8;
	for (short i = 0; i < 60; i++) {
		loadMapRow(x04, cast(short)(x10 + i));
	}
	for (short i = 0; i < 60; i++) {
		loadCollisionRow(x04, cast(short)(x10 + i));
	}
}

/// $C01A63
void unknownC01A63(short x, short y) {
	loadMapRowVRAM(x, y);
}

/// $C01A69
void initializeMiscObjectData() {
	for (short i = 0; i < 0x1E; i++) {
		entityMovementSpeed[i] = 0;
		entityCollidedObjects[i] = 0xFFFF;
		entityNPCIDs[i] = 0xFFFF;
	}
}

/// $C01A86
void clearSpriteTable() {
	ubyte* tmpPtr = cast(ubyte*)&overworldSpriteMaps[0];
	for (short i = 0; i < overworldSpriteMaps.sizeof; i++) {
		tmpPtr[i] = 0xFF;
	}
}

/// $C01A9D
short findFreeSpriteMap(ushort arg1) {
	arg1 /= 5; //convert offset to index
	short x10 = 0;
	unread7E4A6A = cast(short)(arg1 * 5);
	Unknown1:
	while (x10 < overworldSpriteMaps.length) {
		if (overworldSpriteMaps[x10].specialFlags == 0xFF) {
			goto Found;
		}
		x10++;
	}
	return -255;
	Found:
	if ((x10 + arg1) < overworldSpriteMaps.length) {
		for (short i = x10; i < x10 + arg1; i++) {
			if (overworldSpriteMaps[i].specialFlags == 0xFF) {
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
void freeSpritemap(const(SpriteMap)* arg1) {
	if (arg1 < &overworldSpriteMaps[0]) {
		return;
	}
	//??????????
	if (cast(const(ubyte)*)arg1 > cast(ubyte*)&overworldSpriteMaps.ptr[179] + 1) {
		return;
	}
	short x10 = cast(short)(arg1 - &overworldSpriteMaps[0]);
	short i = 0;
	while(i < 2) {
		ubyte y = overworldSpriteMaps[x10].specialFlags;
		overworldSpriteMaps[x10].yOffset = 0xFF;
		overworldSpriteMaps[x10].firstTile = 0xFF;
		overworldSpriteMaps[x10].flags = 0xFF;
		overworldSpriteMaps[x10].xOffset = 0xFF;
		overworldSpriteMaps[x10].specialFlags = 0xFF;
		x10 += 1;
		if ((y & 0x80) != 0) { //if this wasn't a terminating entry, clear the next one too
			i++;
		}
	}
}

/// $C01B96
// This function will find numTiles of sequential free space in the sprite VRAM allocation table,
// and fill that free space with (needle | 0x80) so that it can be found and overwritten later by
// spriteVramTableOverwrite.
short spriteVramTableAllocateSpace(short numTiles, short needle) {
	short x;
	outer: for (short i = 0; i <= 0x58 - numTiles; i = cast(short)(x + 1)) {
		for (short j = 0; j < numTiles; j++) {
			x = cast(short)(i + j);
			if (spriteVramTable[i + j] != 0) {
				continue outer;
			}
		}
		for (short j = 0; j < numTiles; j++) {
			x = cast(short)(i + j);
			spriteVramTable[i + j] = cast(ubyte)needle | 0x80;
		}
		return i;
	}
	return -253;
}

/// $C01C11
void spriteVramTableOverwrite(short needle, ubyte tableValue) {
	for (short i = 0; i < 0x58; i++) {
		if (((spriteVramTable[i] & 0xFF) == ((needle & 0xFF) | 0x80)) || (needle == short.min)) {
			spriteVramTable[i] = tableValue;
		}
	}
	debug(spriteVRAM) {
		int numAvailable = 0;
		for (int i = 0; i < spriteVramTable.length; i++) {
			if (spriteVramTable[i] == 0) {
				numAvailable++;
			}
		}
		tracef("Number of sprite VRAM slots available: %d", numAvailable);
	}
}

/// $C01C52
short reserveOverworldSpriteVRAM(short tileWidth, short tileHeight, short needle) {
	short spriteNumTiles = cast(short)((((tileWidth + 1) & 0xFFFE) * ((tileHeight + 1) & 0xFFFE)) / 4);
	short firstTile = spriteVramTableAllocateSpace(spriteNumTiles, needle);
	if (firstTile < 0) {
		return firstTile;
	}
	if ((((tileWidth + 1) & 0xFFFE) != tileWidth) || (((tileHeight + 1) & 0xFFFE) != tileHeight)) {
		short tileCount;
		for (short i = firstTile; i < firstTile + spriteNumTiles; i += tileCount) {
			tileCount = cast(short)(((i + 8) & 0xF8) - i);
			if (firstTile + spriteNumTiles - i < tileCount) {
				tileCount = cast(short)(firstTile + spriteNumTiles - i);
			}
			copyToVRAM(3, cast(ushort)(tileCount * 64), cast(ushort)(overworldSpriteVRAMOffsets[i] + 0x4000), &blankTiles[0]);
			copyToVRAM(3, cast(ushort)(tileCount * 64), cast(ushort)(overworldSpriteVRAMOffsets[i] + 0x4100), &blankTiles[0]);
		}
	}
	return firstTile;
}

/// $C01D38
void prepareSpriteMap(short arg1, short arg2, short flags, const(SpriteMapTemplates)* spriteTemplates) {
	SpriteMap* newSpriteMap = &overworldSpriteMaps.ptr[arg1];
	const(SpriteMap)* templateSpriteMap = &spriteTemplates.spriteMapTemplates[0][0];
	for (short i = 0; i < 2; i++) {
		for (short j = 0; j < spriteTemplates.count; j++) {
			newSpriteMap.yOffset = templateSpriteMap.yOffset;
			newSpriteMap.firstTile = cast(ubyte)overworldSpriteOAMTileNumbers[arg2 + j];
			newSpriteMap.flags = cast(ubyte)((templateSpriteMap.flags & 0xFE) | ((overworldSpriteOAMTileNumbers[arg2 + j] >> 8) & 0xFF) | flags);
			newSpriteMap.xOffset = templateSpriteMap.xOffset;
			newSpriteMap.specialFlags = templateSpriteMap.specialFlags;
			newSpriteMap++;
			templateSpriteMap++;
		}
	}
}

/// $C01DED
short getOverworldSpriteTileSize(short arg1) {
	newSpriteTileWidth = spriteGroups[arg1].width / 16;
	newSpriteTileHeight = spriteGroups[arg1].height;
	return spriteGroups[arg1].size;
}

/** Creates a new overworld entity with the given sprite, script and coordinates
 * Original_Address: $(DOLLAR)C01E49
 */
short createOverworldEntity(short sprite, short actionScript, short index, short x, short y) {
	tracef("Creating new '%s' entity with script '%s', at %s,%s, index %s", cast(OverworldSprite)sprite, cast(ActionScript)actionScript, x, y, index);
	short result;
	if (debugging != 0) {
		if (sprite == -1) {
			return 0;
		}
	}
	short newEntitySize = getOverworldSpriteTileSize(sprite);
	short spriteMapBeginningIndex = reserveOverworldSpriteVRAM(newSpriteTileWidth, newSpriteTileHeight, index);
	assert(spriteMapBeginningIndex >= 0);
	short newSpriteMapIndex = findFreeSpriteMap(overworldSpriteTemplates[newEntitySize].count * 10);
	assert(newSpriteMapIndex >= 0);
	newEntityPriority = 1;
	prepareSpriteMap(newSpriteMapIndex, spriteMapBeginningIndex, spriteGroups[sprite].spritemapFlags, &overworldSpriteTemplates[newEntitySize]);
	if (index != -1) {
		entityAllocationMinSlot = index;
		entityAllocationMaxSlot = cast(short)(index + 1);
		result = initEntity(actionScript, x, y);
	} else {
		entityAllocationMinSlot = 0;
		entityAllocationMaxSlot = 0x16;
		result = initEntity(actionScript, x, y);
		spriteVramTableOverwrite(-1, cast(ubyte)(result | 0x80));
	}
	entitySpriteMapPointers[result] = &overworldSpriteMaps[newSpriteMapIndex];
	entitySpriteMapSizes[result] = overworldSpriteTemplates[newEntitySize].count * 5;
	entitySpriteMapBeginningIndices[result] = spriteMapBeginningIndex;
	entityVramAddresses[result] = cast(ushort)(overworldSpriteVRAMOffsets[spriteMapBeginningIndex] + 0x4000);
	entityByteWidths[result] = spriteGroups[sprite].width * 2;
	entityTileHeights[result] = spriteGroups[sprite].height;
	//UNKNOWN_30X2_TABLE_31[result] = spriteGroups[sprite].spriteBank;
	entitySpriteIDs[result] = sprite;
	//EntityGraphicsPointerHigh[result] = &spriteGroups[sprite];
	//EntityGraphicsPointerLow[result] = &spriteGroups[sprite];
	entityGraphicsPointers[result] = &spriteGroups[sprite].sprites[0];
	if ((newSpriteTileHeight & 1) != 0) {
		entityVramAddresses[result] += 0x100;
	}
	entitySizes[result] = spriteGroups[sprite].size;
	entityHitboxUpDownWidth[result] = spriteGroups[sprite].hitboxWidthUD;
	entityHitboxUpDownHeight[result] = spriteGroups[sprite].hitboxHeightUD;
	entityHitboxLeftRightWidth[result] = spriteGroups[sprite].hitboxWidthLR;
	entityHitboxLeftRightHeight[result] = spriteGroups[sprite].hitboxHeightLR;
	entityHitboxEnabled[result] = collisionHeights2[spriteGroups[sprite].size];
	entityUpperLowerBodyDivide[result] = cast(ushort)((overworldSpriteTemplates[newEntitySize].lowerBodyCount << 8) | (overworldSpriteTemplates[newEntitySize].count - overworldSpriteTemplates[newEntitySize].lowerBodyCount));
	entityEnemySpawnTiles[result] = 0xFFFF;
	entityEnemyIDs[result] = -1;
	entityNPCIDs[result] = 0xFFFF;
	entityCollidedObjects[result] = 0xFFFF;
	entitySurfaceFlags[result] = 0;
	entityUnknown2DC6[result] = 0;
	entityUnknown2D8A[result] = 0;
	entityPathfindingState[result] = 0;
	entityMovementSpeed[result] = 0;
	entityDirections[result] = 0;
	entityObstacleFlags[result] = 0;
	return result;
}

/** Cleans up all extra entity data, such as spawned enemy count and sprites
 * Original_Address: $(DOLLAR)C020F1
 */
void activeScriptCleanupSelf() {
	freeSpritemap(entitySpriteMapPointers[currentEntitySlot]);
	spriteVramTableOverwrite(currentEntitySlot, 0);
	if ((entityNPCIDs[currentEntitySlot] & 0xF000) == 0x8000) {
		overworldEnemyCount--;
	}
	if (entityEnemyIDs[currentEntitySlot] == EnemyID.magicButterfly) {
		magicButterfly = 0;
	}
	entitySpriteIDs[currentEntitySlot] = -1;
	entityNPCIDs[currentEntitySlot] = 0xFFFF;
}

/** Deletes an overworld entity. In addition to calling [deleteEntity], this cleans up any sprite allocations and decreases spawned enemy and magic butterfly counts.
 * Params:
 * 	entity = The active entity ID
 * Original_Address: $(DOLLAR)C02140
 */
void deleteOverworldEntity(short entity) {
	freeSpritemap(entitySpriteMapPointers[entity]);
	spriteVramTableOverwrite(entity, 0);
	if ((entityNPCIDs[entity] & 0xF000) == 0x8000) {
		overworldEnemyCount--;
	}
	if (entityEnemyIDs[entity] == EnemyID.magicButterfly) {
		magicButterfly = 0;
	}
	entitySpriteIDs[entity] = -1;
	entityNPCIDs[entity] = 0xFFFF;
	deleteEntity(entity);
}

/// $C02194
void unknownC02194() {
	magicButterfly = 0;
	enemySpawnTooManyEnemiesFailureCount = 0;
	overworldEnemyCount = 0;
	for (short i = 0; i < maxEntities; i++) {
		if ((entityScriptTable[i] + 1) > 6) {
			deleteOverworldEntity(i);
		}
	}
	for (short i = 0; i < maxEntities; i++) {
		entityCollidedObjects[i] = 0xFFFF;
	}
}

/// $C021E6
void unknownC021E6() {
	magicButterfly = 0;
	enemySpawnTooManyEnemiesFailureCount = 0;
	overworldEnemyCount = 0;
	for (short i = 0; i < maxEntities; i++) {
		if (entityScriptTable[i] + 1 <= 2) {
			continue;
		}
		if (i == partyLeaderEntity) {
			continue;
		}
		deleteOverworldEntity(i);
	}
	deleteEntity(partyLeaderEntity);
}

/// $C0222B
void trySpawnNPCs(short x, short y) {
	// Don't spawn NPCs outside the bounds of the map data
	if (cast(ushort)x >= 0x20) {
		return;
	}
	if (cast(ushort)y >= 0x28) {
		return;
	}
	if (spritePlacementPointerTable[y][x] != null) {
		short x24 = spritePlacementPointerTable[y][x].entries;
		const(SpritePlacement)* x0A = &spritePlacementPointerTable[y][x].spritePlacements[0];
		for (short i = 0; i < x24; i++) {
			short npc = x0A.npcID;
			short npcX = x0A.x;
			short npcY = x0A.y;
			x0A++;
			if ((globalMapTilesetPaletteData[((npcY / 8) + (y * 32)) / 16][((npcX / 8) + (x * 32)) / 32] / 8 == loadedMapTileCombo) && (unknownC0A21C(npc) == 0)) {
				short x18 = cast(short)((x << 8) + npcX);
				short x16 = cast(short)((y << 8) + npcY);
				short x1A = cast(short)(x18 - bg1XPosition);
				short xreg = cast(short)(x16 - bg1YPosition);
				if (debugging != 0) {
					if ((((padState[0] & (Pad.l | Pad.r)) != 0) || (npcSpawnsEnabled != SpawnControl.offscreenOnly)) && ((cast(ushort)x1A < 0x100) && (cast(ushort)xreg < 0xE0))) {
						continue;
					}
				} else {
					// Prevent NPC from spawning if npcSpawnsEnabled != 1 and it is on screen
					if ((npcSpawnsEnabled != SpawnControl.offscreenOnly) && (cast(ushort)x1A < 0x100) && (cast(ushort)xreg < 0xE0)) {
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
				short newEntity = -1;
				if (photographMapLoadingMode == 0) {
					if ((debugging != 0) && (npcConfig[npc].appearanceStyle != NPCConfigFlagStyle.showAlways) && (isDebugViewMapMode() != 0) && ((((npcConfig[npc].appearanceStyle - 2) ^ getEventFlag(npcConfig[npc].eventFlag)) & 1) == 0)) {
						continue;
					} else if ((npcConfig[npc].appearanceStyle != NPCConfigFlagStyle.showAlways) && ((((npcConfig[npc].appearanceStyle - 2) ^ getEventFlag(npcConfig[npc].eventFlag)) & 1) == 0)) {
						continue;
					}
					if (debugging != 0) {
						if ((showNPCFlag == 0) || (npcConfig[npc].type == 3)) {
							newEntity = createOverworldEntity(npcConfig[npc].sprite, debugViewMapLimitActionscript(npcConfig[npc].actionScript), -1, x18, x16);
						}
					} else {
						if ((showNPCFlag == 0) || (npcConfig[npc].type == 3)) {
							newEntity = createOverworldEntity(npcConfig[npc].sprite, npcConfig[npc].actionScript, -1, x18, x16);
						}
					}
				} else if (npcConfig[npc].appearanceStyle == NPCConfigFlagStyle.showAlways) {
					newEntity = createOverworldEntity(npcConfig[npc].sprite, ActionScript.creditsObject, -1, x18, x16);
				}
				if (newEntity != -1) {
					entityDirections[newEntity] = npcConfig[npc].direction;
					entityNPCIDs[newEntity] = npc;
				}
			}
		}
	}
}

/// $C0255C
void spawnNPCsRow(short x, short y) {
	short x12 = void;
	short x14 = short.min;
	if (npcSpawnsEnabled == SpawnControl.allDisabled) {
		return;
	}
	version(noUndefinedBehaviour) {} else { // use of uninitialized variable
		if (x12 < 0) {
			return;
		}
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
		trySpawnNPCs(x12, x10);
		x14 = x12;
	}
}

/// $C025CF
void spawnNPCsColumn(short x, short y) {
	short x10 = void;
	short x_ = short.min;
	if (npcSpawnsEnabled == SpawnControl.allDisabled) {
		return;
	}
	version(noUndefinedBehaviour) {} else { //use of uninitialized variable
		if (x10 < 0) {
			return;
		}
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
		trySpawnNPCs(x0E, x12);
		x_ = x12;
	}
}

/// $C0263D
short getEncounterGroupID(short x, short y) {
	version(noUndefinedBehaviour) {
		if ((x < 0) || (y < 0)) {
			return 0;
		}
	}
	if ((x >= 128) || (y >= 160)) {
		return 0;
	}
	return mapEnemyPlacement[y][x];
}

/** Spawns the enemies in the encounter group, if the conditions for doing so are met.
 * If enemy spawn debugging is enabled, will spawn enemies from the test group (0). Every 16th spawn attempt (successful or not) will instead attempt to spawn a magic butterfly.
 * If a pirated copy of the game is detected, enemy spawning will ALWAYS succeed, even when the spawn chance is set to 0%. Only one instance of a group can be spawned in an area, subsequent attempts will fail
 * until the first instance despawns.
 * Original_Address: $(DOLLAR)C02668
 */
void spawnEnemiesFromGroup(short tileX, short tileY, short encounterGroupID) {
	short group;
	const(BattleGroupEnemy)* groupEnemies;
	version(bugfix) { // out of bounds checking wasn't done before
		if (tileX >= mapDataPerSectorAttributesTable[0].length * 4) {
			return;
		}
		if (tileY >= mapDataPerSectorAttributesTable.length * 2) {
			return;
		}
	}
	if ((debugging != 0) && (debugEnemiesEnabled() != 0) && (rand() < 16)) {
		debug(enemySpawnTracing) tracef("Trying to spawn an enemy (debug): %s, %s, %s", tileX, tileY, encounterGroupID);
		group = EnemyGroup.testEnemies;
		groupEnemies = &battleEntryPointerTable[EnemyGroup.testEnemies].enemies[0];
	} else if ((++enemySpawnCounter & 0xF) == 0) {
		debug(enemySpawnTracing) tracef("Trying to spawn a magic butterfly: %s, %s, %s", tileX, tileY, encounterGroupID);
		short magicButterflyChance = void;
		switch (mapDataPerSectorAttributesTable[(tileY * 8) / 16][(tileX * 8) / 32] & 7) {
			case SpecialGameState.none:
				magicButterflyChance = 2;
				break;
			case SpecialGameState.indoorArea:
				magicButterflyChance = 0;
				break;
			case SpecialGameState.exitMouseUsable:
				magicButterflyChance = 1;
				break;
			case SpecialGameState.useMiniSprites:
				magicButterflyChance = 0;
				break;
			case SpecialGameState.useMagicantSprites:
				magicButterflyChance = 5;
				break;
			case SpecialGameState.useRobotSprites:
				magicButterflyChance = 1;
				break;
			default: break;
		}
		if ((rand() % 100) >= magicButterflyChance) {
			return;
		}
		group = EnemyGroup.magicButterfly;
		spawningEnemyGroup = EnemyGroup.magicButterfly;
		groupEnemies = &battleEntryPointerTable[EnemyGroup.magicButterfly].enemies[0];
	} else if (encounterGroupID != 0) {
		debug(enemySpawnTracing) tracef("Trying to spawn an enemy: %s, %s, %s", tileX, tileY, encounterGroupID);
		if (globalMapTilesetPaletteData[(tileY * 8) / 16][(tileX * 8) / 32] / 8 == loadedMapTileCombo) {
			enemySpawnEncounterID = encounterGroupID;
			short flag = enemyPlacementGroupsPointerTable[encounterGroupID].eventFlag;
			const(EnemyPlacementGroup)* selectedGroup = enemyPlacementGroupsPointerTable[encounterGroupID].groups.ptr;
			enemySpawnChance = enemyPlacementGroupsPointerTable[encounterGroupID].enemySpawnChance;
			short rollAdjustment = 0;
			if ((flag != 0) && (getEventFlag(flag) != 0)) {
				enemySpawnChance = enemyPlacementGroupsPointerTable[encounterGroupID].altEnemySpawnChance;
				if (enemyPlacementGroupsPointerTable[encounterGroupID].enemySpawnChance != 0) {
					rollAdjustment = 8;
				}
			}
			if ((piracyFlag == 0) && (((rand() * 100) >> 8) >= enemySpawnChance)) {
				return;
			}
			short roll = rand() & 7 + rollAdjustment;
			short entrySlot = 0;
			while (true) {
				entrySlot += selectedGroup[0].slotsOccupied;
				if (roll < entrySlot) {
					break;
				}
				selectedGroup++;
			}
			group = selectedGroup[0].groupID;
			spawningEnemyGroup = group;
			groupEnemies = &battleEntryPointerTable[group].enemies[0];
			for (short i = 0; i != partyLeaderEntity; i++) {
				if (entityScriptTable[i] == -1) {
					continue;
				}
				if (group + 0x8000 != entityNPCIDs[i]) {
					continue;
				}
				if (tileY * 128 + tileX == entityEnemySpawnTiles[i]) {
					return;
				}
			}
		}
	}
	version(noUndefinedBehaviour) {
		if (groupEnemies is null) {
			return;
		}
	}
	while ((enemySpawnRemainingEnemyCount = groupEnemies[0].count) != 0xFF) {
		debug(enemySpawnTracing) tracef("Trying to spawn %sx %s", groupEnemies[0].count, cast(EnemyID)groupEnemies[0].enemyID);
		spawningEnemyName = &enemyConfigurationTable[groupEnemies[0].enemyID].name[0];
		short sprite = enemyConfigurationTable[groupEnemies[0].enemyID].overworldSprite;
		spawningEnemySprite = sprite;
		short script = enemyConfigurationTable[groupEnemies[0].enemyID].eventScript;
		if (script == 0) {
			script = ActionScript.unknown019;
		}
		while (enemySpawnRemainingEnemyCount-- != 0) {
			if (groupEnemies[0].enemyID == EnemyID.magicButterfly) {
				if (magicButterfly != 0) {
					continue;
				}
			}
			if (overworldEnemyCount == overworldEnemyMaximum) {
				enemySpawnTooManyEnemiesFailureCount++;
				continue;
			}
			enemySpawnTooManyEnemiesFailureCount = 0;
			short newEntity = createOverworldEntity(sprite, script, -1, 0, 0);
			short newEntityX;
			short newEntityY;
			for (short i = 0; i != 20; i++) {
				newEntityX = cast(short)((tileX * 8 + (rand() % enemySpawnRangeWidth)) * 8);
				newEntityY = cast(short)((tileY * 8 + (rand() % enemySpawnRangeHeight)) * 8);
				debug(enemySpawnTracing) tracef("Spawning %s at (%s, %s)", cast(EnemyID)groupEnemies[0].enemyID, newEntityX, newEntityY);
				short positionFlags = getSurfaceFlags(newEntityX, newEntityY, newEntity);
				if ((positionFlags & (SurfaceFlags.solid | SurfaceFlags.unknown2 | SurfaceFlags.ladderOrStairs)) != 0) {
					// can't spawn here, try again
					continue;
				}
				if (checkEnemyCanMove(positionFlags, newEntity, groupEnemies[0].enemyID) == 0) {
					// this spot is fine, proceed
					goto SpawnSuccess;
				}
			}
			// didn't find a suitable spawn location after 20 tries, so clean up
			deleteOverworldEntity(newEntity);
			continue;
			SpawnSuccess:
			entityAbsXTable[newEntity] = newEntityX;
			entityAbsYTable[newEntity] = newEntityY;
			entityNPCIDs[newEntity] = group + 0x8000;
			entityEnemyIDs[newEntity] = groupEnemies[0].enemyID;
			entityEnemySpawnTiles[newEntity] = cast(short)(tileY * 128 + tileX);
			entityPathfindingState[newEntity] = 0;
			entityWeakEnemyValue[newEntity] = rand();
			overworldEnemyCount++;
			if (groupEnemies[0].enemyID == EnemyID.magicButterfly) {
				magicButterfly = 1;
			}
		}
		groupEnemies++;
	}
}

/** Attempts to spawn enemies when the player moves vertically. Makes up to six attempts for each of six of the enemy sectors at the top or bottom of the screen.
 * Enemies will not spawn if sysMonsterOff or winGiegu are set, if enemySpawnsEnabled is set to allDisabled, or if the row is out of bounds or perfectly divisible by 8.
 * Params:
 * 	tileX = The X tile coordinate of the row (leftmost edge)
 * 	tileY = The Y tile coordinate of the row
 * Original_Address: $(DOLLAR)C02A6B
 */
void spawnEnemiesRow(short tileX, short tileY) {
	if (getEventFlag(EventFlag.sysMonsterOff) != 0) {
		return;
	}
	if (getEventFlag(EventFlag.winGiegu) != 0) {
		return;
	}
	if (enemySpawnsEnabled == SpawnControl.allDisabled) {
		return;
	}
	if ((tileY & 7) != 0) {
		return;
	}
	if (((tileY < -16) ? 0 : tileY) >= 0x500) {
		return;
	}
	short baseEnemySectorX = tileX / 8;
	short baseEnemySectorY = ((tileY < -16) ? 0 : tileY) / 8;
	// try to spawn an enemy group for each enemy sector in (X, Y) .. (X + 6, Y), an area 48 tiles wide, 1 tile tall
	for (short i = baseEnemySectorX; baseEnemySectorX + 5 > i; i++) {
		short enemySectorX = i;
		enemySpawnRangeWidth = 8;
		enemySpawnRangeHeight = 8;
		short spawnAttempts = 1;
		AttemptAnotherSpawn:
		short group = getEncounterGroupID(i, baseEnemySectorY);
		short groupNext = getEncounterGroupID(cast(short)(i + 1), baseEnemySectorY);
		if ((group != 0) && (groupNext == group)) {
			enemySpawnRangeWidth += 8;
			i++;
			if (++spawnAttempts != 6) {
				goto AttemptAnotherSpawn;
			}
		}
		while (spawnAttempts-- != 0) {
			spawnEnemiesFromGroup(enemySectorX, baseEnemySectorY, group);
		}
	}
}

/** Attempts to spawn enemies when the player moves horizontally. Makes up to six attempts for each of six of the enemy sectors at the left or right of the screen.
 * Enemies will not spawn if sysMonsterOff or winGiegu are set, if enemySpawnsEnabled is set to allDisabled, or if the column is out of bounds or perfectly divisible by 8.
 * Params:
 * 	tileX = The X tile coordinate of the column
 * 	tileY = The Y tile coordinate of the column (top edge)
 * Original_Address: $C02B55
 */
void spawnEnemiesColumn(short tileX, short tileY) {
	if (getEventFlag(EventFlag.sysMonsterOff) != 0) {
		return;
	}
	if (getEventFlag(EventFlag.winGiegu) != 0) {
		return;
	}
	if (enemySpawnsEnabled == SpawnControl.allDisabled) {
		return;
	}
	if ((tileX & 7) != 0) {
		return;
	}
	if (((tileX < -16) ? 0 : tileX) >= 0x400) {
		return;
	}
	short baseEnemySectorX = ((tileX < -16) ? 0 : tileX) / 8;
	short baseEnemySectorY = tileY / 8;
	// try to spawn an enemy group for each enemy sector in (X, Y) .. (X, Y + 6), an area 1 tile wide, 48 tiles tall
	for (short i = baseEnemySectorY; baseEnemySectorY + 5 > i; i++) {
		short enemySectorY = i;
		enemySpawnRangeWidth = 8;
		enemySpawnRangeHeight = 8;
		short spawnAttempts = 1;
		AttemptAnotherSpawn:
		short group = getEncounterGroupID(baseEnemySectorX, i);
		short groupNext = getEncounterGroupID(baseEnemySectorX, cast(short)(i + 1));
		if ((group != 0) && (groupNext == group)) {
			enemySpawnRangeHeight += 8;
			i++;
			if (++spawnAttempts != 6) {
				goto AttemptAnotherSpawn;
			}
		}
		while (spawnAttempts-- != 0) {
			spawnEnemiesFromGroup(baseEnemySectorX, enemySectorY, group);
		}
	}
}

/** Updates mushroomized walking state if anyone is mushroomized, forcing the player off a bicycle and resetting the input shuffle timer to 30 seconds as needed
 * Original_Address: $(DOLLAR)C02C3E
 */
void updateMushroomizedWalking() {
	if (partyCharacters[gameState.playerControlledPartyMembers[0]].afflictions[1] == Status1.mushroomized) {
		mushroomizedWalkingFlag = 1;
		if (mushroomizationTimer == 0) {
			mushroomizationTimer = 1800;
			mushroomizationModifier = 0;
		}
		if (gameState.walkingStyle == WalkingStyle.bicycle) {
			getOffBicycle();
		}
	} else {
		mushroomizedWalkingFlag = 0;
	}
}

/** Shuffles inputs if mushroomization is active, switching to a different shuffled mapping every 30 seconds.
 * Has no effect during demo playback.
 * Original_Address: $(DOLLAR)C02C89
 */
void mushroomizationMovementSwap() {
	if (mushroomizationTimer == 0) {
		mushroomizationTimer = 30 * 60;
		mushroomizationModifier = (mushroomizationModifier + 1) & 3;
	}
	mushroomizationTimer--;
	if (mushroomizationModifier == 0) {
		return;
	}
	if (demoFramesLeft != 0) {
		return;
	}
	padPress[0] = (padPress[0] & 0xF0FF) | mushroomizationDirectionRemapTables[mushroomizationModifier - 1][(padPress[0] >> 8) & 0xF];
	padState[0] = (padState[0] & 0xF0FF) | mushroomizationDirectionRemapTables[mushroomizationModifier - 1][(padState[0] >> 8) & 0xF];
}

/** Remove everyone and everything in the party
 * Original_Address: $(DOLLAR)C02D29
 */
void clearParty() {
	entitySizes[partyLeaderEntity] = 1;
	miniGhostEntityID = -1;
	gameState.leaderPositionIndex = 0;
	gameState.cameraMode = CameraMode.normal;
	gameState.autoScrollFrames = 0;
	gameState.autoScrollOriginalWalkingStyle = 0;
	gameState.partyStatus = PartyStatus.normal;
	gameState.firstPartyMemberEntity = 0x18;
	for (short i = 0; i < 6; i++) {
		gameState.partyMemberIndex[i] = 0;
		hpAlertShown[i] = 0;
	}
	gameState.playerControlledPartyMemberCount = 0;
	gameState.partyCount = 0;
	velocityStore();
	pajamaFlag = getEventFlag(nessPajamaFlag);
}

/** Gets a character's new horizontal position after a single frame of movement speed, taking into account the type of surface currently being walked upon
 * Params:
 * 	direction = The direction the character is moving in
 * 	baseX = The character's base X coordinate
 * 	flags = Collision flags for the character's surface
 * Original_Address: $(DOLLAR)C02D8F
 */
uint getNewX(short direction, uint baseX, short flags) {
	switch (flags & SurfaceFlags.deepWater) {
		case SurfaceFlags.shallowWater:
			return (((horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined / 256) * ShallowWaterSpeed.combined) / 256) + baseX;
		case SurfaceFlags.deepWater:
			return (((horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined / 256) * DeepWaterSpeed.combined) / 256) + baseX;
		default:
			if (demoFramesLeft != 0) {
				return horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined + baseX;
			} else if ((gameState.partyStatus == PartyStatus.speedBoost) && (gameState.walkingStyle == 0)) {
				return (((horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined / 256) * SkipSandwichSpeed.combined) / 256) + baseX;
			}
			return horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined + baseX;
	}
}


/** Gets a character's new vertical position after a single frame of movement speed, taking into account the type of surface currently being walked upon
 * Params:
 * 	direction = The direction the character is moving in
 * 	baseY = The character's base Y coordinate
 * 	flags = Collision flags for the character's surface
 * Original_Address: $(DOLLAR)C03017
 */
uint getNewY(short direction, uint baseY, short flags) {
	switch (flags & SurfaceFlags.deepWater) {
		case SurfaceFlags.shallowWater:
			return (((verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined / 256) * ShallowWaterSpeed.combined) / 256) + baseY;
		case SurfaceFlags.deepWater:
			return (((verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined / 256) * DeepWaterSpeed.combined) / 256) + baseY;
		default:
			if (demoFramesLeft != 0) {
				return verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined + baseY;
			} else if ((gameState.partyStatus == PartyStatus.speedBoost) && (gameState.walkingStyle == 0)) {
				return (((verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined / 256) * SkipSandwichSpeed.combined) / 256) + baseY;
			}
			return verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[direction].combined + baseY;
	}
}

/// $C032EC
void updatePartyNPCs() {
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
		short local9 = gameState.partyMemberIndex[i];
		if (local9 >= 5) {
			local9 += 0x300;
		} else {
			short x = partyCharacters[entityScriptVar1Table[gameState.partyEntities[i]]].afflictions[0];
			if ((x == Status0.unconscious) || (x == Status0.diamondized)) {
				local9 += 0x100;
			}
		}
		local2[i] = local9;
		local3[i] = gameState.partyEntities[i];
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
		gameState.partyMemberIndex[i] = cast(ubyte)local2[i];
		gameState.partyEntities[i] = cast(ubyte)local3[i];
		gameState.playerControlledPartyMembers[i] = cast(ubyte)local4[i];
		partyCharacters[i].positionIndex = local1[i];
		entityScriptVar5Table[i] = gameState.partyEntities[i];
	}
	gameState.firstPartyMemberEntity = gameState.partyEntities[0];
	updatePartyNPCs();
	updateMushroomizedWalking();
	loadTextPalette();
}

/// $C0369B
short unknownC0369B(short id) {
	short x18 = 0;
	if (id >= 5) {
		while(true) {
			if (gameState.partyMemberIndex[x18] == 0) {
				break;
			}
			if (gameState.partyMemberIndex[x18] > id) {
				break;
			}
			x18++;
		}
	} else {
		while (true) {
			if (gameState.partyMemberIndex[x18] == 0) {
				break;
			}
			if (5 <=gameState.partyMemberIndex[x18]) {
				break;
			}
			if (gameState.partyMemberIndex[x18] > id) {
				break;
			}
			version(bugfix) {
				if (partyCharacters[entityScriptVar1Table[gameState.partyEntities[gameState.partyMemberIndex[x18] - 1]]].afflictions[0] == Status0.unconscious) {
					break;
				}
			} else { // Vanilla game incorrectly uses the party member index as an entity id
				if (partyCharacters[entityScriptVar1Table[gameState.partyMemberIndex[x18]]].afflictions[0] == Status0.unconscious) {
					break;
				}
			}
			x18++;
		}
	}
	if (gameState.partyMemberIndex[x18] != 0) {
		version(bugfix) { // vanilla game has an underflow error that went unnoticed because the garbage data would immediately get overwritten
			enum sub = 0;
		} else {
			enum sub = 1;
		}
		for (short i = 5; i != x18 - sub; i--) {
			gameState.partyMemberIndex[i] = gameState.partyMemberIndex[i - 1];
			gameState.partyEntities[i] = gameState.partyEntities[i - 1];
			gameState.playerControlledPartyMembers[i] = gameState.playerControlledPartyMembers[i - 1];
		}
	}
	gameState.partyMemberIndex[x18] = cast(ubyte)id;
	gameState.partyCount++;
	newEntityVar0 = cast(short)(id - 1);
	short x1A_2 = characterInitialEntityData[id - 1].unknown6;
	if (entityScriptTable[x1A_2] != -1) {
		x1A_2++;
	}
	gameState.partyEntities[x18] = cast(ubyte)x1A_2;
	newEntityVar1 = cast(short)(x1A_2 - 0x18);
	gameState.playerControlledPartyMembers[x18] = cast(ubyte)newEntityVar1;
	if (gameState.partyCount == 1) {
		partyCharacters[newEntityVar1].positionIndex = gameState.leaderPositionIndex;
	} else {
		short x16 = (x18 == 0) ? gameState.leaderPositionIndex : partyCharacters[entityScriptVar1Table[gameState.partyEntities[x18 - 1]]].positionIndex;
		partyCharacters[newEntityVar1].positionIndex = x16;
	}
	short x = (partyCharacters[newEntityVar1].positionIndex != 0) ? cast(short)(partyCharacters[newEntityVar1].positionIndex - 1) : 0xFF;
	short x18_2 = (gameState.specialGameState != SpecialGameState.useMiniSprites) ? characterInitialEntityData[id - 1].overworldSprite : characterInitialEntityData[id - 1].lostUnderworldSprite;
	createOverworldEntity(x18_2, characterInitialEntityData[id - 1].actionScript, x1A_2, playerPositionBuffer[x].xCoord, playerPositionBuffer[x].yCoord);
	entityScreenXTable[x1A_2] = cast(short)(playerPositionBuffer[x].xCoord - bg1XPosition);
	entityScreenYTable[x1A_2] = cast(short)(playerPositionBuffer[x].yCoord - bg1YPosition);
	gameState.firstPartyMemberEntity = characterInitialEntityData[gameState.partyMemberIndex[0] - 1].unknown6;
	unknownC09CD7();
	updatePartyNPCs();
	gameState.firstPartyMemberEntity = gameState.partyEntities[0];
	updateParty();
	entityPreparedXCoordinate = playerPositionBuffer[x].xCoord;
	entityPreparedYCoordinate = playerPositionBuffer[x].yCoord;
	entityPreparedDirection = entityDirections[x1A_2];
	return x1A_2;
}

/// $C03903
void unknownC03903(short id) {
	short i;
	for (i = 0; (gameState.partyMemberIndex[i] != id) && (i != 6); i++) {}
	if (i == 6) {
		return;
	}
	const x02 = gameState.partyEntities[i];
	short j;
	for (j = i; j < 5; j++) {
		gameState.partyMemberIndex[j] = gameState.partyMemberIndex[j + 1];
		gameState.partyEntities[j] = gameState.partyEntities[j + 1];
		gameState.playerControlledPartyMembers[j] = gameState.playerControlledPartyMembers[j + 1];
	}
	if (i == 0) {
		partyCharacters[gameState.playerControlledPartyMembers[0]].positionIndex = entityScriptVar1Table[x02];
	}
	gameState.partyMemberIndex[j] = 0;
	gameState.partyCount--;
	entityPreparedXCoordinate = entityAbsXTable[x02];
	entityPreparedYCoordinate = entityAbsYTable[x02];
	entityPreparedDirection = entityDirections[x02];
	deleteOverworldEntity(x02);
	updatePartyNPCs();
	updateParty();
}

/// $C039E5
void setFollowerEntityLocationToLeaderPosition() {
	for (short i = 0; i < 6; i++) {
		if (gameState.partyMemberIndex[i] == 0) {
			continue;
		}
		entityAbsXTable[gameState.partyEntities[i]] = gameState.leaderX.integer;
		entityAbsYTable[gameState.partyEntities[i]] = gameState.leaderY.integer;
		recalculateEntityScreenPosition(gameState.partyEntities[i]);
	}
}

/// $C03A24
void unknownC03A24() {
	gameState.playerControlledPartyMemberCount = 0;
	gameState.partyCount = 0;
	for (short i = 0; i < 6; i++) {
		gameState.partyMemberIndex[i] = 0;
		gameState.playerControlledPartyMembers[i] = 0;
		gameState.partyEntities[i] = 0;
	}
	unread7E5D7E = 1;
	for (short i = 0; i < 6; i++) {
		if (gameState.partyMembers[i] == 0) {
			break;
		}
		unknownC0369B(gameState.partyMembers[i]);
	}
	unread7E5D7E = 0;
	footstepSoundID = cast(short)(gameState.specialGameState * 2);
	footstepSoundIDOverride = 0;
}

/// $C03A94
void unknownC03A94(short arg1) {
	short x1C;
	short x;
	if ((currentTeleportDestinationX | currentTeleportDestinationY) != 0) {
		x1C = cast(short)(currentTeleportDestinationX * 8);
		x = cast(short)(currentTeleportDestinationY * 8);
	} else {
		x1C = gameState.leaderX.integer;
		x = gameState.leaderY.integer;
	}
	short x1A = loadSectorAttributes(x1C, x) & 7;
	gameState.specialGameState = x1A;
	footstepSoundID = cast(short)(x1A * 2);
	footstepSoundIDOverride = 0;
	if (x1A != SpecialGameState.useMiniSprites) {
		gameState.walkingStyle = 0;
	} else {
		gameState.walkingStyle = WalkingStyle.slowest;
	}
	short x18 = currentEntitySlot;
	currentEntitySlot = -1;
	for (short i = 0; i < 6; i++) {
		if (gameState.partyMemberIndex[i] == 0) {
			continue;
		}
		newEntityVar0 = entityScriptVar0Table[gameState.partyEntities[i]];
		newEntityVar1 = entityScriptVar1Table[gameState.partyEntities[i]];
		newEntityVar5 = cast(short)(i * 2);
		short x14 = entitySpriteMapFlags[gameState.partyEntities[i]];
		short x1A_2 = entityCallbackFlags[gameState.partyEntities[i]];
		deleteOverworldEntity(gameState.partyEntities[i]);
		movingPartyMemberEntityID = gameState.partyEntities[i];
		short x12;
		if (gameState.specialGameState != SpecialGameState.useMiniSprites) {
			x12 = createOverworldEntity(unknownC0780F(gameState.partyMemberIndex[i] - 1, 0, &partyCharacters[i]), characterInitialEntityData[gameState.partyMemberIndex[i] - 1].actionScript, gameState.partyEntities[i], gameState.leaderX.integer, gameState.leaderY.integer);
		} else {
			x12 = createOverworldEntity(unknownC0780F(gameState.partyMemberIndex[i] - 1, 10, &partyCharacters[i]), characterInitialEntityData[gameState.partyMemberIndex[i] - 1].actionScript, gameState.partyEntities[i], gameState.leaderX.integer, gameState.leaderY.integer);
		}
		entitySpriteMapFlags[gameState.partyEntities[i]] = x14;
		entityCallbackFlags[gameState.partyEntities[i]] = x1A_2;
		entityDirections[gameState.partyEntities[i]] = arg1;
		entityAnimationFrames[gameState.partyEntities[i]] = 0;
		updateEntitySpriteFrame(x12);
	}
	currentEntitySlot = x18;
	setFollowerEntityLocationToLeaderPosition();
	ladderStairsTileX = 0xFFFF;
	short x02 = pendingInteractions;
	pendingInteractions = 0;
	checkMovementMapCollision(gameState.leaderX.integer, gameState.leaderY.integer, gameState.firstPartyMemberEntity, Direction.down);
	pendingInteractions = x02;
	if (ladderStairsTileX != -1) {
		unknownC07526(ladderStairsTileX, ladderStairsTileY);
	}
}

/// $C03C25
void doSectorMusicUpdate() {
	doMapMusicFade = 1;
	loadSectorMusic(gameState.leaderX.integer, gameState.leaderY.integer);
	if (nextMapMusicTrack != currentMapMusicTrack) {
		waitUntilNextFrame();
		changeMapMusic();
	}
	doMapMusicFade = 0;
}

/// $C03C4B
short checkBicycleCollisionFlags() {
	return getCollisionFlags(gameState.leaderX.integer, gameState.leaderY.integer, 12) & (SurfaceFlags.solid | SurfaceFlags.unknown2);
}

/// $C03C5E
void getOnBicycle() {
	if (gameState.partyCount != 1) {
		return;
	}
	if (gameState.partyMemberIndex[0] != 1) {
		return;
	}
	if (disableMusicChanges == 0) {
		changeMusic(Music.bicycle);
	}
	deleteOverworldEntity(0x18);
	gameState.specialGameState = SpecialGameState.onBicycle;
	gameState.walkingStyle = WalkingStyle.bicycle;
	partyCharacters[0].positionIndex = 0;
	gameState.leaderPositionIndex = 0;
	newEntityVar0 = 0;
	newEntityVar1 = 0;
	createOverworldEntity(OverworldSprite.nessBicycle, ActionScript.partyMemberFollowing, 0x18, entityAbsXTable[partyMemberEntityStart], entityAbsYTable[partyMemberEntityStart]);
	entityCallbackFlags[partyMemberEntityStart] |= EntityCallbackFlags.tickDisabled;
	entityScriptVar7Table[partyMemberEntityStart] |= PartyMemberMovementFlags.unknown12 | PartyMemberMovementFlags.unknown13;
	entityAnimationFrames[partyMemberEntityStart] = 0;
	entityDirections[partyMemberEntityStart] = gameState.leaderDirection;
	setAutoSectorMusicChanges(0);
	gameState.leaderHasMoved = 1;
	unread7E5DBA = 1;
	inputDisableFrameCounter = 2;
}

/// $C03CFD
void getOffBicycle() {
	if (gameState.walkingStyle != WalkingStyle.bicycle) {
		return;
	}
	setAutoSectorMusicChanges(1);
	if ((battleMode == BattleMode.noBattle) && (pendingInteractions == 0)) {
		reloadMapMusic();
	}
	deleteOverworldEntity(0x18);
	gameState.specialGameState = SpecialGameState.none;
	gameState.walkingStyle = 0;
	partyCharacters[0].positionIndex = 0;
	gameState.leaderPositionIndex = 0;
	if (pendingInteractions == 0) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
	newEntityVar0 = 0;
	newEntityVar1 = 0;
	createOverworldEntity(OverworldSprite.ness, ActionScript.partyMemberFollowing, 0x18, entityAbsXTable[partyMemberEntityStart], entityAbsYTable[partyMemberEntityStart]);
	entityAnimationFrames[partyMemberEntityStart] = 0;
	entityDirections[partyMemberEntityStart] = gameState.leaderDirection;
	entityScriptVar7Table[partyMemberEntityStart] |= PartyMemberMovementFlags.unknown12 | PartyMemberMovementFlags.unknown15;
	if (pendingInteractions != 0) {
		entityCallbackFlags[partyMemberEntityStart] |= PartyMemberMovementFlags.unknown14 | PartyMemberMovementFlags.unknown15;
	}
	waitUntilNextFrame();
	waitUntilNextFrame();
	updateEntitySpriteFrame(0x18);
	unread7E5DBA = 0;
	inputDisableFrameCounter = 2;
}

/// $C03E5A
short getCharacterPositionIndex(short characterID) {
	short x;
	version(bugfix) {
		for (x = 0; (x < gameState.partyMemberIndex.length) && (gameState.partyMemberIndex[x] != characterID + 1); x++) {}
	} else {
		for (x = 0; gameState.partyMemberIndex[x] != characterID + 1; x++) {}
	}
	if (x == 0) {
		return -1;
	}
	return chosenFourPtrs[entityScriptVar1Table[gameState.partyEntities[x - 1]]].positionIndex;
}

/// $C03E9D
short getPositionIndexDelta(short characterID) {
	short positionIndex = getCharacterPositionIndex(characterID);
	if (positionIndex < currentPartyMemberTick.positionIndex) {
		positionIndex += 0x100;
	}
	return cast(short)(positionIndex - currentPartyMemberTick.positionIndex);
}

/// $C03EC3
short getNewPositionIndex(short characterID, short distance, short arg3, short arg4) {
	short tmp = getPositionIndexDelta(characterID);
	if (tmp == distance) {
		arg3++;
		entityScriptVar7Table[currentEntitySlot] &= ~PartyMemberMovementFlags.unknown12;
	} else if (tmp > distance) {
		arg3 += arg4;
		entityScriptVar7Table[currentEntitySlot] |= PartyMemberMovementFlags.unknown12;
	}
	return arg3;
}

/** Actionscript function - Initializes party member data for the party member id stored in var 1
 * Original_Address: $(DOLLAR)C03DAA
 */
void actionScriptInitializePartyMember() {
	entityAnimationFingerprints[currentEntitySlot] = -1;
	entityScriptVar3Table[currentEntitySlot] = 8;
	entityScriptVar2Table[currentEntitySlot] = rand() & 0xF;
	updateEntitySpriteFrame(currentEntitySlot);
	partyCharacters[entityScriptVar1Table[currentEntitySlot]].unknown59 = currentEntitySlot;
	partyCharacters[entityScriptVar1Table[currentEntitySlot]].characterID = entityScriptVar0Table[currentEntitySlot];
	partyCharacters[entityScriptVar1Table[currentEntitySlot]].unknown57 = 0;
	partyCharacters[entityScriptVar1Table[currentEntitySlot]].unknown92 = -1;
	if (partyCharacters[entityScriptVar1Table[currentEntitySlot]].afflictions[0] == Status0.unconscious) {
		entityScriptVar3Table[currentEntitySlot] = 16;
	}
	footstepSoundIgnoreEntity = cast(short)(gameState.firstPartyMemberEntity * 2);
}

/// $C03F1E
void movePartyToLeaderPosition() {
	gameState.leaderPositionIndex = 0;
	PlayerPositionBufferEntry* x = &playerPositionBuffer[0];
	short y = 2;
	while (--y != 0) {
		x.xCoord = gameState.leaderX.integer;
		x.yCoord = gameState.leaderY.integer;
		x.direction = gameState.leaderDirection;
		x.walkingStyle = gameState.walkingStyle;
		x.tileFlags = gameState.troddenTileType;
		playerMovementFlags = 0;
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
		entityAbsXTable[gameState.partyEntities[i]] = gameState.leaderX.integer;
		entityAbsYTable[gameState.partyEntities[i]] = gameState.leaderY.integer;
		entityDirections[gameState.partyEntities[i]] = gameState.leaderDirection;
		entitySurfaceFlags[gameState.partyEntities[i]] = gameState.troddenTileType;
	}
}

/// $C03FA9
void unknownC03FA9(short x, short y, short direction) {
	gameState.leaderX.integer = x;
	gameState.leaderY.integer = y;
	gameState.leaderDirection = direction;
	gameState.troddenTileType = getSurfaceFlags(x, y, gameState.firstPartyMemberEntity);
	unknownC03A94(direction);
	movePartyToLeaderPosition();
	for (short i = 0; i < 6; i++) {
		entityAnimationFingerprints[i + partyMemberEntityStart] = -1;
	}
	miniGhostEntityID = -1;
	currentTeleportDestinationY = 0;
	currentTeleportDestinationX = 0;
	pajamaFlag = getEventFlag(nessPajamaFlag);
	unknownC07B52();
}

/// $C0400E
void centerScreen(short x, short y) {
	refreshMapAtPosition(cast(short)(x - 0x80), cast(short)(y - 0x70));
}

/// $C0402B
void startAutoMovementDemo(DemoEntry* arg1) {
	demoReplayStart(arg1);
}

/// $C0404F
short mapInputToDirection(short style) {
	short result = -1;
	if (pendingInteractions != 0) {
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
	short x = cast(short)(npcSearchXOffsets[direction] + gameState.leaderX.integer);
	short y = cast(short)(npcSearchYOffsets[direction] + gameState.leaderY.integer);
	short intangibilityBackup = playerIntangibilityFrames;
	playerIntangibilityFrames = 1; //force intangibility on during search to avoid collision flags being set
	while (true) {
		short foundNPC = npcCollisionCheck(x, y, gameState.firstPartyMemberEntity);
		if (foundNPC > 0) {
			interactingNPCID = entityNPCIDs[foundNPC];
			interactingNPCEntity = foundNPC;
			break;
		}
		// check for "counter" collision, to interact with NPCs like shopkeepers behind a counter
		if ((getMovingCollisionFlags(x, y, gameState.firstPartyMemberEntity, direction) & SurfaceFlags.counterTop) != SurfaceFlags.counterTop) {
			break;
		}
		if (npcSearchXOffsets[direction] != 0) {
			x += (npcSearchXOffsets[direction] < 0) ? -8 : 8;
		}
		if (npcSearchYOffsets[direction] != 0) {
			y += (npcSearchYOffsets[direction] < 0) ? -8 : 8;
		}
	}
	playerIntangibilityFrames = intangibilityBackup;
	if ((interactingNPCID == -1) || (interactingNPCID == 0)) {
		unknownC4334A(direction);
	}
	return interactingNPCID;
}

/// $C041E3
short unknownC041E3() {
	short directionCardinal = cast(short)(gameState.leaderDirection & 0xFFFE);
	short tmpDirection = directionCardinal;
	// try finding something in front of the player
	short a = unknownC04116(tmpDirection);
	if ((a != -1) && (a != 0)) {
		return tmpDirection;
	}
	// try finding something to the right of the player
	tmpDirection = (tmpDirection + 2) & 7;
	gameState.leaderDirection = tmpDirection;
	a = unknownC04116(tmpDirection);
	if ((a != -1) && (a != 0)) {
		return tmpDirection;
	}
	// try finding something to the left of the player
	tmpDirection = (tmpDirection + 4) & 7;
	gameState.leaderDirection = tmpDirection;
	a = unknownC04116(tmpDirection);
	if ((a != -1) && (a != 0)) {
		return tmpDirection;
	}
	// try finding something behind the player
	tmpDirection = (tmpDirection - 2) & 7;
	gameState.leaderDirection = tmpDirection;
	a = unknownC04116(tmpDirection);
	if ((a != -1) && (a != 0)) {
		return tmpDirection;
	}
	// found nothing
	gameState.leaderDirection = directionCardinal;
	return -1;
}

/// $C042C2
void faceOppositeLeader(short arg1) {
	entityDirections[arg1] = oppositeCardinals[gameState.leaderDirection];
	unknownC09907(arg1);
	updateEntitySprite(arg1);
}

/// $C04279
ushort findNearbyCheckableNPC() {
	interactingNPCID = -1;
	interactingNPCEntity = -1;
	short x10 = unknownC041E3();
	if ((x10 != -1) && (entityDirections[gameState.firstPartyMemberEntity] != x10)) {
		gameState.leaderDirection = x10;
		entityDirections[gameState.firstPartyMemberEntity] = x10;
		updateEntitySpriteFrame(gameState.firstPartyMemberEntity);
	}
	return interactingNPCID;
}

/// $C042EF
short unknownC042EF(short direction) {
	short x = cast(short)(npcSearchXOffsets[direction] + gameState.leaderX.integer);
	short y = cast(short)(npcSearchYOffsets[direction] + gameState.leaderY.integer);
	short x12 = playerIntangibilityFrames;
	playerIntangibilityFrames = 1;
	while (true) {
		short x10 = npcCollisionCheck(x, y, gameState.firstPartyMemberEntity);
		if (x10 >= 0) {
			interactingNPCID = entityNPCIDs[x10];
			interactingNPCEntity = x10;
			break;
		}
		// check for "counter" collision, to interact with NPCs like shopkeepers behind a counter
		if ((getMovingCollisionFlags(x, y, gameState.firstPartyMemberEntity, direction) & SurfaceFlags.counterTop) != SurfaceFlags.counterTop) {
			break;
		}
		if (npcSearchXOffsets[direction] != 0) {
			x += (npcSearchXOffsets[direction] < 0) ? -8 : 8;
		}
		if (npcSearchYOffsets[direction] != 0) {
			y += (npcSearchYOffsets[direction] < 0) ? -8 : 8;
		}
	}
	playerIntangibilityFrames = x12;
	if ((interactingNPCID == 0) || (interactingNPCID == -1)) {
		unknownC065C2(direction);
	}
	return interactingNPCID;
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
		return cast(short)(gameState.leaderDirection & 0xFFFE);
	}
	gameState.leaderDirection = ((gameState.leaderDirection + 4) & 7);
	a = unknownC042EF(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return cast(short)(gameState.leaderDirection & 0xFFFE);
	}
	gameState.leaderDirection = ((gameState.leaderDirection - 2) & 7);
	a = unknownC042EF(gameState.leaderDirection);
	if ((a != -1) && (a != 0)) {
		return cast(short)(gameState.leaderDirection & 0xFFFE);
	}
	gameState.leaderDirection = x10;
	return -1;
}

/// $C04452
ushort findNearbyTalkableNPC() {
	interactingNPCID = -1;
	interactingNPCEntity = -1;
	short x10 = unknownC043BC();
	if ((x10 != -1) && (entityDirections[gameState.firstPartyMemberEntity] != x10)) {
		gameState.leaderDirection = x10;
		entityDirections[gameState.firstPartyMemberEntity] = x10;
		updateEntitySpriteFrame(gameState.firstPartyMemberEntity);
	}
	return interactingNPCID;
}

/** Handle a single frame of standard movement, from determining movement direction from input to collision checks to setting the player's final position.
 * Decrease battle countdown if active, performing the entity collision checks necessary for other enemies to join in.
 * Movement on stairs is restricted to two directions, depending on their orientation.
 * Also checks for active hotspot collisions, but only one of the two are checked per frame.
 * Original_Address: $(DOLLAR)C0449B
 */
void handleNormalMovement() {
	gameState.leaderHasMoved = 0;
	if (mushroomizedWalkingFlag != 0) {
		mushroomizationMovementSwap();
	}
	short chosenDirection = mapInputToDirection(gameState.walkingStyle);
	if (battleSwirlCountdown != 0) {
		if (--battleSwirlCountdown != 0) {
			npcCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.firstPartyMemberEntity);
		} else {
			battleMode = BattleMode.inBattle;
		}
		return;
	}
	if (chosenDirection == -1) {
		npcCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.firstPartyMemberEntity);
		return;
	}
	if (gameState.walkingStyle == WalkingStyle.stairs) {
		if ((stairsDirection == StairDirection.upRight) || (stairsDirection == StairDirection.downLeft)) {
			if (chosenDirection <= Direction.downRight) {
				chosenDirection = Direction.upRight;
			} else {
				chosenDirection = Direction.downLeft;
			}
		} else {
			if (((chosenDirection - 1) & 7) <= Direction.downRight) {
				chosenDirection = Direction.downRight;
			} else {
				chosenDirection = Direction.upLeft;
			}
		}
		if (chosenDirection < Direction.down) {
			gameState.leaderDirection = Direction.right;
		} else {
			gameState.leaderDirection = Direction.left;
		}
	} else if ((playerMovementFlags & PlayerMovementFlags.dontChangeDirection) == 0) {
		gameState.leaderDirection = chosenDirection;
	}
	playerHasMovedSinceMapLoad++;
	gameState.leaderHasMoved++;
	short x22 = gameState.troddenTileType;
	FixedPoint1616 newX = { combined: getNewX(chosenDirection, gameState.leaderX.combined, x22) };
	FixedPoint1616 newY = { combined: getNewY(chosenDirection, gameState.leaderY.combined, x22) };
	ladderStairsTileX = 0xFFFF;
	short newCollision;
	if ((playerMovementFlags & PlayerMovementFlags.collisionDisabled) == 0) {
		newCollision = checkMovementMapCollision(newX.integer, newY.integer, gameState.firstPartyMemberEntity, chosenDirection);
		if (chosenDirection != finalMovementDirection) {
			newX.combined = getNewX(finalMovementDirection, gameState.leaderX.combined, x22);
			newY.combined = getNewY(finalMovementDirection, gameState.leaderY.combined, x22);
		}
	} else if (demoFramesLeft == 0) {
		newCollision = unknownC05FD1(newX.integer, newY.integer, gameState.firstPartyMemberEntity) & 0x3F;
	} else {
		newCollision = 0;
	}
	gameState.troddenTileType = newCollision;
	bool movementOK = true;
	npcCollisionCheck(newX.integer, newY.integer, gameState.firstPartyMemberEntity);
	if (entityCollidedObjects[partyLeaderEntity] != 0xFFFF) {
		movementOK = false;
	}
	if ((newCollision & (SurfaceFlags.solid | SurfaceFlags.unknown2)) != 0) {
		movementOK = false;
	}
	if (ladderStairsTileX != 0xFFFF) {
		movementOK = unknownC07526(ladderStairsTileX, ladderStairsTileY);
	} else if ((gameState.walkingStyle == WalkingStyle.ladder) || (gameState.walkingStyle == WalkingStyle.rope)) {
		gameState.walkingStyle = WalkingStyle.normal;
	}
	if (movementOK) {
		gameState.leaderX = newX;
		gameState.leaderY = newY;
	} else {
		gameState.leaderHasMoved = 0;
	}
	if (((frameCounter & 1) == 0) && (activeHotspots[0].mode != 0)) {
		queueHotspotInteraction(0);
	}
	if (((frameCounter & 1) != 0) && (activeHotspots[1].mode != 0)) {
		queueHotspotInteraction(1);
	}
	if ((gameState.walkingStyle == WalkingStyle.ladder) || (gameState.walkingStyle == WalkingStyle.rope)) {
		gameState.leaderX.integer = cast(short)((ladderStairsTileX * 8) + 8);
	}
	if ((debugging != 0) && ((padState[0] & Pad.x) != 0)) {
		gameState.leaderX.integer &= 0xFFF8;
		gameState.leaderY.integer &= 0xFFF8;
	}
}

/// $C0476D
void moveCameraToEntity() {
	short x04 = 0;
	if ((entityAbsXTable[cameraFocusEntity] != gameState.leaderX.integer) || (entityAbsYTable[cameraFocusEntity] != gameState.leaderY.integer) || (entityAbsXFractionTable[cameraFocusEntity] != gameState.leaderX.fraction) || (entityAbsYFractionTable[cameraFocusEntity] != gameState.leaderY.fraction)) {
		x04 = 1;
	}
	gameState.leaderX.integer = entityAbsXTable[cameraFocusEntity];
	gameState.leaderY.integer = entityAbsYTable[cameraFocusEntity];
	gameState.leaderX.fraction = entityAbsXFractionTable[cameraFocusEntity];
	gameState.leaderY.fraction = entityAbsYFractionTable[cameraFocusEntity];
	gameState.leaderDirection = entityDirections[cameraFocusEntity];
	gameState.leaderHasMoved = x04;
}

/// $C047CF
void handleEscalatorMovement() {
	if (enemyHasBeenTouched != 0) {
		return;
	}
	if (battleSwirlCountdown != 0) {
		battleSwirlCountdown--;
		return;
	}
	short direction;
	switch (escalatorEntranceDirection & 0x300) {
		case StairDirection.upLeft:
			direction = Direction.upLeft;
			break;
		case StairDirection.downLeft:
			direction = Direction.downLeft;
			break;
		case StairDirection.upRight:
			direction = Direction.upRight;
			break;
		case StairDirection.downRight:
			direction = Direction.downRight;
			break;
		default:
			break;
	}
	ladderStairsTileX = 0xFFFF;
	checkMovementMapCollision(gameState.leaderX.integer, gameState.leaderY.integer, gameState.firstPartyMemberEntity, direction);
	if (ladderStairsTileX != -1) {
		unknownC07526(ladderStairsTileX, ladderStairsTileY);
	}
	if (1 != 0) { //wat
		gameState.leaderX.combined += horizontalMovementSpeeds[WalkingStyle.escalator].directionSpeeds[direction * 4].combined;
		gameState.leaderY.combined += verticalMovementSpeeds[WalkingStyle.escalator].directionSpeeds[direction * 4].combined;
	}
	gameState.leaderHasMoved = 1;
}

/** Handles movement while riding a bicycle.
 * Has a few unique quirks:
 * - changing direction while moving diagonally has a 4 frame delay
 * - player does not stop moving forward until a collision or a direction change
 * - press R to ring the bell!
 * Original_Address: $(DOLLAR)C048D3
 */
void handleBicycleMovement(short hasMoved) {
	FixedPoint1616 x;
	FixedPoint1616 y;
	short direction = mapInputToDirection(gameState.walkingStyle);
	short originalDirection = direction;
	if (battleSwirlCountdown != 0) {
		if (--battleSwirlCountdown != 0) {
			npcCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.firstPartyMemberEntity);
			return;
		} else {
			battleMode = BattleMode.inBattle;
			return;
		}
	}
	if ((padPress[0] & Pad.r) != 0) {
		playSfx(Sfx.bicycleBell);
	}
	if (direction == -1) {
		// if we've been moving but there's been no input this frame, just keep moving in the same directioin
		if (hasMoved != 0) {
			direction = gameState.leaderDirection;
		} else {
			npcCollisionCheck(gameState.leaderX.integer, gameState.leaderY.integer, gameState.firstPartyMemberEntity);
			return;
		}
	}
	if ((direction & 1) != 0) {
		bicycleDiagonalTurnCounter = 4;
	} else if (bicycleDiagonalTurnCounter != 0) {
		if (--bicycleDiagonalTurnCounter != 0) {
			direction = gameState.leaderDirection;
		} else if (originalDirection == -1) {
			direction = gameState.leaderDirection;
		}
	}
	gameState.leaderDirection = direction;
	x.combined = gameState.leaderX.combined + horizontalMovementSpeeds[WalkingStyle.bicycle].directionSpeeds[direction].combined;
	y.combined = gameState.leaderY.combined + verticalMovementSpeeds[WalkingStyle.bicycle].directionSpeeds[direction].combined;
	ladderStairsTileX = 0xFFFF;
	short collision = getMovingCollisionFlags(x.integer, y.integer, 24, direction);
	npcCollisionCheck(x.integer, y.integer, gameState.firstPartyMemberEntity);
	if (entityCollidedObjects[partyLeaderEntity] == -1) {
		gameState.leaderHasMoved++;
		playerHasMovedSinceMapLoad++;
		if ((collision & (SurfaceFlags.solid | SurfaceFlags.unknown2)) != 0) {
			gameState.leaderHasMoved = 0;
		} else {
			gameState.leaderX.combined = x.combined;
			gameState.leaderY.combined = y.combined;
		}
	}
}

/// $C04A7B
void restoreCameraMode() {
	gameState.cameraMode = cameraModeBackup;
	unknownC0D19B();
}

/// $C04A88
void switchToCameraMode3() {
	cameraMode3FramesLeft = 12;
	cameraModeBackup = gameState.cameraMode;
	gameState.cameraMode = CameraMode.unknown3;
	musicEffect(MusicEffect.quickFade);
	overworldStatusSuppression = 1;
}

/// $C04AAD
void unknownC04AAD() {
	if (--cameraMode3FramesLeft != 0) {
		short x10 = mapInputToDirection(gameState.walkingStyle);
		if (x10 == -1) {
			return;
		}
		for (short i = 24; i <= 29; i++) {
			if (entityScriptTable[i] == -1) {
				continue;
			}
			if (entityDirections[i] == x10) {
				continue;
			}
			currentPartyMemberTick = &partyCharacters[entityScriptVar1Table[i]];
			if ((playerPositionBuffer[currentPartyMemberTick.positionIndex].walkingStyle == WalkingStyle.rope) || (playerPositionBuffer[currentPartyMemberTick.positionIndex].walkingStyle == WalkingStyle.ladder)) {
				continue;
			}
			entityDirections[i] = x10;
			updateEntitySpriteFrame(i);
		}
		gameState.leaderDirection = x10;
	} else {
		restoreCameraMode();
	}
}

/// $C04B53
void handleSpecialCamera() {
	short x10;
	if (gameState.walkingStyle != WalkingStyle.stairs) {
		x10 = gameState.leaderDirection;
	} else {
		x10 = autoMovementDirection;
	}
	switch (gameState.cameraMode) {
		case CameraMode.autoScroll:
			gameState.leaderX.combined += horizontalMovementSpeeds[gameState.walkingStyle].directionSpeeds[x10].combined;
			gameState.leaderY.combined += verticalMovementSpeeds[gameState.walkingStyle].directionSpeeds[x10].combined;
			if (--gameState.autoScrollFrames == 0) {
				gameState.cameraMode = CameraMode.normal;
				gameState.walkingStyle = gameState.autoScrollOriginalWalkingStyle;
			}
			gameState.leaderHasMoved = 1;
			break;
		case CameraMode.followEntity:
			moveCameraToEntity();
			break;
		case CameraMode.unknown3:
			unknownC04AAD();
			break;
		default:
			break;
	}
}

/** Handles a single frame of party leader movement on the map
 * Original_Address: $(DOLLAR)C04C45
 */
void movePartyLeader() {
	short hasMoved = gameState.leaderHasMoved;
	gameState.leaderHasMoved = 0;
	if (playerIntangibilityFrames != 0) {
		playerIntangibilityFlash();
		playerIntangibilityFrames--;
	}
	if ((debugging != 0) && ((padState[0] & Pad.x) != 0) && ((frameCounter & 0xF) != 0)) {
		return;
	}
	chosenFourPtrs[entityScriptVar1Table[gameState.firstPartyMemberEntity]].positionIndex = gameState.leaderPositionIndex;
	if (gameState.cameraMode != CameraMode.normal) {
		handleSpecialCamera();
	} else {
		switch (gameState.walkingStyle) {
			case WalkingStyle.escalator:
				handleEscalatorMovement();
				break;
			case WalkingStyle.bicycle:
				handleBicycleMovement(hasMoved);
				break;
			default:
				handleNormalMovement();
				break;
		}
	}
	short positionIndex = gameState.leaderPositionIndex;
	PlayerPositionBufferEntry* positionEntry = &playerPositionBuffer[gameState.leaderPositionIndex];
	gameState.troddenTileType = unknownC05F82(gameState.leaderX.integer, gameState.leaderY.integer, gameState.firstPartyMemberEntity);
	if (gameState.leaderHasMoved != 0) {
		positionEntry.xCoord = gameState.leaderX.integer;
		positionEntry.yCoord = gameState.leaderY.integer;
		gameState.leaderPositionIndex = (positionIndex + 1) & 0xFF;
		centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
		unread7E4DD4 = 1;
	} else {
		unread7E4DD4 = 0;
	}
	positionEntry.tileFlags = gameState.troddenTileType;
	positionEntry.walkingStyle = gameState.walkingStyle;
	positionEntry.direction = gameState.leaderDirection;
	footstepSoundIDOverride = 0;
	if ((gameState.troddenTileType & 8) != 0) {
		if ((gameState.troddenTileType & 4) != 0) {
			footstepSoundIDOverride = 0x10;
		} else {
			footstepSoundIDOverride = 0x12;
		}
	}
}

/** A single frame of a single party member's movement. Applies direction and position from movement buffer, and updates sprite when necessary
 * Original_Address: $(DOLLAR)C04D78
 */
void partyMemberTick() {
	if (gameState.cameraMode == CameraMode.unknown3) {
		return;
	}
	if (battleSwirlCountdown != 0) {
		return;
	}
	if (enemyHasBeenTouched != 0) {
		return;
	}
	if (battleMode != BattleMode.noBattle) {
		return;
	}
	currentPartyMemberTick = chosenFourPtrs[entityScriptVar1Table[currentEntitySlot]];
	entityDirections[currentEntitySlot] = playerPositionBuffer[currentPartyMemberTick.positionIndex].direction;
	entitySurfaceFlags[currentEntitySlot] = playerPositionBuffer[currentPartyMemberTick.positionIndex].tileFlags;
	doPartyMovementFrame(entityScriptVar0Table[currentEntitySlot], playerPositionBuffer[currentPartyMemberTick.positionIndex].walkingStyle, currentEntitySlot);
	if (gameState.leaderHasMoved == 0) {
		if (playerPositionBuffer[currentPartyMemberTick.positionIndex].walkingStyle != WalkingStyle.escalator) {
			return;
		}
	}
	entityAbsXTable[currentEntitySlot] = playerPositionBuffer[currentPartyMemberTick.positionIndex].xCoord;
	entityAbsYTable[currentEntitySlot] = playerPositionBuffer[currentPartyMemberTick.positionIndex].yCoord;
	bool skipPositionIndexRecalc = false;
	short newPositionIndexOffset = void;
	if (entityScriptVar0Table[currentEntitySlot] + 1 != gameState.partyMemberIndex[0]) {
		switch (playerPositionBuffer[currentPartyMemberTick.positionIndex].walkingStyle) {
			case WalkingStyle.ladder:
			case WalkingStyle.rope:
				newPositionIndexOffset = 30;
				break;
			case WalkingStyle.escalator:
				if (gameState.walkingStyle == WalkingStyle.normal) {
					skipPositionIndexRecalc = true;
				} else {
					newPositionIndexOffset = 30;
				}
				break;
			case WalkingStyle.stairs:
				newPositionIndexOffset = 24;
				break;
			default:
				if (gameState.specialGameState == SpecialGameState.useMiniSprites) {
					newPositionIndexOffset = 8;
				} else {
					newPositionIndexOffset = 12;
				}
				break;
		}
	}
	currentPartyMemberTick.unknown65 = playerPositionBuffer[currentPartyMemberTick.positionIndex].walkingStyle;
	short newPositionIndex;
	if ((entityScriptVar0Table[currentEntitySlot] + 1 != gameState.partyMemberIndex[0]) && !skipPositionIndexRecalc) {
		newPositionIndex = getNewPositionIndex(entityScriptVar0Table[currentEntitySlot], cast(short)(characterSizes[entityScriptVar0Table[currentEntitySlot]] + newPositionIndexOffset), currentPartyMemberTick.positionIndex, 2);
	} else {
		newPositionIndex = cast(short)(currentPartyMemberTick.positionIndex + 1);
		entityScriptVar7Table[currentEntitySlot] &= ~PartyMemberMovementFlags.unknown12;
	}
	currentPartyMemberTick.positionIndex = newPositionIndex & 0xFF;
}

/** Actionscript function - Updates the current position for the party member associated with this entity
 * Note: Added sometime after the 1995-03-27 build
 * Original_Address: $(DOLLAR)C04EF0
 */
void actionScriptUpdatePartyMemberPosition() {
	currentPartyMemberTick = chosenFourPtrs[entityScriptVar1Table[currentEntitySlot]];
	entityDirections[currentEntitySlot] = playerPositionBuffer[currentPartyMemberTick.positionIndex].direction;
	entitySurfaceFlags[currentEntitySlot] = playerPositionBuffer[currentPartyMemberTick.positionIndex].tileFlags;
	doPartyMovementFrame(entityScriptVar0Table[currentEntitySlot], playerPositionBuffer[currentPartyMemberTick.positionIndex].walkingStyle, currentEntitySlot);
}

/** Restores screen background colour backup and re-enables backgrounds 1, 2, 3 and OBJ
 * Original_Address: $(DOLLAR)C04F47
 */
void restoreBackgroundLayers() {
	palettes[0][0] = backgroundColourBackup;
	// re-enable BG1, 2, 3 and OBJ
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	preparePaletteUpload(PaletteUpload.bgOnly);
}

/** Causes the screen to flash red for a single frame by disabling all layers and setting the screen background colour to red
 * Original_Address: $(DOLLAR)C04F60
 */
void redFlash() {
	if (battleSwirlCountdown != 0) {
		return;
	}
	if (enemyHasBeenTouched != 0) {
		return;
	}
	backgroundColourBackup = palettes[0][0];
	// set background colour to red
	palettes[0][0] = 0x1F;
	// turn off all layers
	mirrorTM = TMTD.none;
	preparePaletteUpload(PaletteUpload.bgOnly);
	scheduleOverworldTask(1, &restoreBackgroundLayers);
}

/** Tries to show an HP alert for the given character, if HP is low enough and an alert hasn't been shown recently
 * Params:
 * 	character = Index of character to show the alert for
 * Original_Address: $(DOLLAR)C04F9F
 */
void tryShowHPAlert(short character) {
	PartyCharacter* x0E = chosenFourPtrs[gameState.playerControlledPartyMembers[character]];
	if ((x0E.maxHP * 20) / 100 > x0E.hp.current.integer) {
		if (hpAlertShown[character] == 0) {
			showHPAlert(cast(short)(x0E.characterID + 1));
		}
		hpAlertShown[character] = 1;
	} else {
		hpAlertShown[character] = 0;
	}
}

/// $C04FFE
ushort unknownC04FFE() {
	ushort result = 0;
	ushort x02;
	ushort x04;
	ushort numberCollapsed;
	if (gameState.cameraMode == CameraMode.followEntity) {
		return 1;
	}
	if (overworldStatusSuppression != 0) {
		return 1;
	}
	for(x02 = 0; (gameState.partyMemberIndex[x02] != 0) && (gameState.partyMemberIndex[x02] <= 4); x02++) {
		currentPartyMemberTick = chosenFourPtrs[gameState.playerControlledPartyMembers[x02]];
		const affliction = currentPartyMemberTick.afflictions[0];
		if ((affliction == Status0.unconscious) || (affliction == Status0.diamondized)) {
			continue;
		}
		if (affliction == Status0.poisoned) {
			if (overworldDamageCountdownFrames[x02] == 0) {
				overworldDamageCountdownFrames[x02] = 120;
			} else if (!--overworldDamageCountdownFrames[x02]) {
				x04++;
				currentPartyMemberTick.hp.current.integer -= 10;
				currentPartyMemberTick.hp.target -= 10;
				tryShowHPAlert(x02);
			}
		} else if (((affliction < Status0.nauseous) && ((gameState.troddenTileType & SurfaceFlags.deepWater) == SurfaceFlags.deepWater)) || ((affliction >= Status0.nauseous) && (affliction <= Status0.cold))) {
			if (overworldDamageCountdownFrames[x02] == 0) {
				if (affliction == Status0.nauseous) {
					overworldDamageCountdownFrames[x02] = 120;
				} else {
					overworldDamageCountdownFrames[x02] = 240;
				}
			} else if (!--overworldDamageCountdownFrames[x02]) {
				x04++;
				if (affliction == Status0.nauseous) {
					currentPartyMemberTick.hp.current.integer -= 10;
					currentPartyMemberTick.hp.target -= 10;
				} else { //cold or deep water
					currentPartyMemberTick.hp.current.integer -= 2;
					currentPartyMemberTick.hp.target -= 2;
				}
				tryShowHPAlert(x02);
			}
		}
		if (currentPartyMemberTick.hp.current.integer <= 0) {
			if (affliction != Status0.unconscious) {
				for (short i = 0; i < 6; i++) {
					currentPartyMemberTick.afflictions[i] = 0;
				}
				currentPartyMemberTick.afflictions[0] = Status0.unconscious;
				currentPartyMemberTick.hp.target = 0;
				currentPartyMemberTick.hp.current.integer = 0;
				entityScriptVar3Table[currentPartyMemberTick.unknown59] = 0x10;
				numberCollapsed++;
			}
		} else {
			if (affliction != Status0.diamondized) {
				result += currentPartyMemberTick.hp.current.integer;
			}
		}
	}
	if (x04 != 0) {
		redFlash();
	}
	if (numberCollapsed != 0) {
		partyMembersAliveOverworld = 0;
		updateParty();
		unknownC07B52();
		unfreezeEntities();
	}
	return result;
}

/// $C05200
void partyLeaderTick() {
	if (battleMode != BattleMode.noBattle) {
		return;
	}
	if (possessedPlayerCount != 0) {
		if (miniGhostEntityID == -1) {
			createMiniGhostEntity();
		}
	} else if (miniGhostEntityID != -1) {
		deleteMiniGhostEntity();
	}
	if (loadedAnimatedTileCount != 0) {
		animateTileset();
	}
	if (mapPaletteAnimationLoaded != 0) {
		animatePalette();
	}
	if (itemTransformationsLoaded != 0) {
		processItemTransformations();
	}
	movePartyLeader();
	const x = gameState.leaderX.integer >> 8;
	const y = gameState.leaderY.integer >> 8;
	if (((x^lastSectorX) != 0) || ((y^lastSectorY) != 0)) {
		lastSectorX = x;
		lastSectorY = y;
		if (enableAutoSectorMusicChanges) {
			doSectorMusicUpdate();
		}
	}
	if ((dadPhoneTimer == 0) && (gameState.cameraMode != CameraMode.followEntity)) {
		loadDadPhone();
	}
	possessedPlayerCount = 0;
	currentLeaderDirection = gameState.leaderDirection;
	currentLeadingPartyMemberEntity = cast(short)(gameState.firstPartyMemberEntity * 2);
	if (gameState.leaderHasMoved) {
		playerHasDoneSomethingThisFrame = 1;
	}
}

/// $C052AA
short initBattleCommon() {
	fadeOutWithMosaic(1, 1, 0);
	short result = battleRoutine();
	updateParty();
	partyMembersAliveOverworld = 1;
	battleMode = BattleMode.noBattle;
	return result;
}

/// $C052D4
void unknownC052D4(short arg1) {
	short x26 = 0xFF;
	gameState.leaderPositionIndex = 0xFF;
	short x24 = gameState.leaderX.integer;
	short x22 = gameState.leaderY.integer;
	short x20 = gameState.troddenTileType;
	short x1E = gameState.walkingStyle;
	FixedPoint1616 x12 = { combined: getNewX((arg1 + 4) & 7, gameState.leaderX.combined, gameState.troddenTileType) - gameState.leaderX.combined };
	FixedPoint1616 x16 = { combined: getNewY((arg1 + 4) & 7, gameState.leaderY.combined, gameState.troddenTileType) - gameState.leaderY.combined };
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
		entityAbsXTable[gameState.partyEntities[i]] = playerPositionBuffer[x26].xCoord;
		entityAbsYTable[gameState.partyEntities[i]] = playerPositionBuffer[x26].yCoord;
		entityDirections[gameState.partyEntities[i]] = playerPositionBuffer[x26].direction;
		entitySurfaceFlags[gameState.partyEntities[i]] = playerPositionBuffer[x26].tileFlags;
		x26 -= 16;
	}
}

/// $C0546B
short unknownC0546B() {
	short x10 = 0;
	for (short i = 0; i != gameState.partyCount; i++) {
		if (gameState.partyMemberIndex[i] > 4) {
			continue;
		}
		x10 += partyCharacters[gameState.partyMemberIndex[i]].level;
	}
	return x10;
}

/** Gets the collision of a loaded tile at the given coordinates, and sets ladder/stairs coordinates if applicable
 * Params:
 * 	x = relative x coordinate (0 - 63)
 * 	y = relative y coordinate (0 - 63)
 * Returns: The collision flags at the specified coordinate
 * Original_Address: $(DOLLAR)C054C9
 */
short getCollisionAtLoadedTile(short x, short y) {
	short result = loadedCollisionTiles[y & 0x3F][x & 0x3F];
	if ((result & SurfaceFlags.ladderOrStairs) != 0) {
		ladderStairsTileX = x;
		ladderStairsTileY = y;
	}
	return result;
}

/// $C05503
void checkVerticalUpTileCollision(short arg1, short arg2) {
	ushort x10 = cast(ushort)(loadedCollisionTiles[(checkedCollisionTopY / 8) & 0x3F][(arg1 / 8) & 0x3F] | tempEntitySurfaceFlags);
	short x14 = (arg1 + 7) / 8;
	for (short i = 0; i < hitboxWidths[arg2]; i++) {
		x10 |= loadedCollisionTiles[(checkedCollisionTopY / 8) & 0x3F][x14 & 0x3F];
		x14++;
	}
	tempEntitySurfaceFlags = x10;
}

/// $C0559C
void checkVerticalDownTileCollision(short arg1, short arg2) {
	ushort y = cast(ushort)(loadedCollisionTiles[((((hitboxHeights[arg2] * 8) + checkedCollisionTopY - 1) / 8) & 0x3F)][(arg1 / 8) & 0x3F] | tempEntitySurfaceFlags);
	short x12 = (arg1 + 7) / 8;
	for (short i = 0; i < hitboxWidths[arg2]; i++) {
		y |= loadedCollisionTiles[(((hitboxHeights[arg2] * 8) + checkedCollisionTopY - 1) / 8) & 0x3F][x12 & 0x3F];
		x12++;
	}
	tempEntitySurfaceFlags = y;
}

/// $C05639
void checkHorizontalLeftTileCollision(short arg1, short arg2) {
	ushort x10 = cast(ushort)(loadedCollisionTiles[(arg1 / 8) & 0x3F][(checkedCollisionLeftX / 8) & 0x3F] | tempEntitySurfaceFlags);
	short x12 = (arg1 + 7) / 8;
	for (short i = 0; i < hitboxHeights[arg2]; i++) {
		x10 |= loadedCollisionTiles[x12 & 0x3F][(checkedCollisionLeftX / 8) & 0x3F];
		x12++;
	}
	tempEntitySurfaceFlags = x10;
}

/// $C056D0
void checkHorizontalRightTileCollision(short arg1, short arg2) {
	ushort y = cast(ushort)(loadedCollisionTiles[(arg1 / 8) & 0x3F][(((hitboxWidths[arg2] * 8) + checkedCollisionLeftX - 1) / 8) & 0x3F] | tempEntitySurfaceFlags);
	short x12 = (arg1 + 7) / 8;
	for (short i = 0; i < hitboxHeights[arg2]; i++) {
		y |= loadedCollisionTiles[x12 & 0x3F][(((hitboxWidths[arg2] * 8) + checkedCollisionLeftX - 1) / 8) & 0x3F];
		x12++;
	}
	tempEntitySurfaceFlags = y;
}

/** Runs some collision checks. Checks the tiles at each direction specified by directionMask and returns each check that failed
 * Params:
 * 	directionMask = A set of flags indicating which directions to test. 0b000001 = west, 0b000010 = none, 0b000100 = east, 0b001000 = southwest, 0b010000 = south, 0b100000 = southeast
 * Returns: the directionMask specified, minus the bits that didn't collide
 * Original_Address: $(DOLLAR)C05769
 */
short performCollisionChecks(short directionMask) {
	short result = 0;
	short flagsCombined = 0;
	for (short i = 0; i < 6; i++, result >>= 1, directionMask >>= 1) {
		if ((directionMask & 1) == 0) {
			continue;
		}
		short flags = getCollisionAtLoadedTile((collisionTestCoordDiffsX[i] + checkedCollisionLeftX) / 8, (collisionTestCoordDiffsY[i] + checkedCollisionTopY) / 8);
		flagsCombined |= flags;
		if ((flags & (SurfaceFlags.solid | SurfaceFlags.unknown2)) != 0) {
			result |= 0x40;
		}
	}
	if (setTempEntitySurfaceFlags == 1) {
		tempEntitySurfaceFlags = flagsCombined;
	}
	return result;
}

/** Runs collision checks for north movement and returns whether it's possible to move northish
 * Returns: -256 if north movement impossible, -1 if possible, a similar Direction otherwise
 * Original_Address: $(DOLLAR)C057E8
 */
short checkNorthMovementMapCollision() {
	tempEntitySurfaceFlags = 0;
	setTempEntitySurfaceFlags++;
	northSouthCollisionTestResult = performCollisionChecks(0b000111); // check west, none, east
	if ((northSouthCollisionTestResult == 0b000111) || (northSouthCollisionTestResult == 0b000010)) { // E/W solid line
		return -256;
	}
	if (northSouthCollisionTestResult == 0) { // All clear
		return -1;
	}
	if (northSouthCollisionTestResult == 0b000001) { // NE/SW solid line, can move northeast alongside it
		return Direction.upRight;
	}
	if (northSouthCollisionTestResult == 0b000100) { // NW/SE solid line, can move northwest alongside it
		return Direction.upLeft;
	}
	if ((northSouthCollisionTestResult == 0b000110) && ((checkedCollisionLeftX & 7) == 0)) { // bottom-left corners of E/W and NW/SE intersections
		return Direction.upLeft;
	}
	return -1;
}

/** Runs collision checks for south movement and returns whether it's possible to move southish
 * Returns: -256 if south movement impossible, -1 if possible, a similar Direction otherwise
 * Original_Address: $(DOLLAR)C0583C
 */
short checkSouthMovementMapCollision() {
	tempEntitySurfaceFlags = 0;
	setTempEntitySurfaceFlags++;
	northSouthCollisionTestResult = performCollisionChecks(0b111000); // check southwest, south, southeast
	// shouldn't that be 0b111000?
	if ((northSouthCollisionTestResult == 0b000111) || (northSouthCollisionTestResult == 0b010000)) { // E/W solid line
		return -256;
	}
	if (northSouthCollisionTestResult == 0) { // All clear
		return -1;
	}
	if (northSouthCollisionTestResult == 0b001000) { // NW/SE solid line, can move southeast alongside it
		return Direction.downRight;
	}
	if (northSouthCollisionTestResult == 0b100000) { // NE/SW solid line, can move southwest alongside it
		return Direction.downLeft;
	}
	if ((northSouthCollisionTestResult == 0b110000) && ((checkedCollisionLeftX & 7) == 0)) { // top-left corners of E/W and NE/SW intersections
		return Direction.downLeft;
	}
	return -1;
}

/** Runs collision checks for west movement and returns whether it's possible to move westish
 * Returns: -1 if impossible, a Direction that we can move in otherwise
 * Original_Address: $(DOLLAR)C05890
 */
short checkWestMovementMapCollision() {
	short result = -1;
	short furtherWestAttempted = 0;
	short extraCollisionResult = 0;
	tempEntitySurfaceFlags = 0;
	setTempEntitySurfaceFlags = 1;
	short collisionResult = performCollisionChecks(0b001001); // check west, southwest
	if (collisionResult == 0) { // see if we can move even further west
		checkedCollisionLeftX -= 4;
		collisionResult = performCollisionChecks(0b001001); //check west, southwest again
		if (collisionResult == 0) {
			return Direction.left;
		}
		furtherWestAttempted = 1;
	}
	if (((collisionResult & 0b001001) == 0b001001) && ((checkedCollisionTopY & 7) != 0)) {
		if (furtherWestAttempted != 0) {
			// though the second check failed, we aren't at a tile boundary yet, so we can move at least a little west
			return Direction.left;
		}
		return -1;
	}
	if ((loadedCollisionTiles[((checkedCollisionTopY - 2) / 8) & 0x3F][((checkedCollisionLeftX - 4) / 8) & 0x3F] & (SurfaceFlags.solid | SurfaceFlags.unknown2)) != 0) {
		extraCollisionResult |= 0b01; // further northwest
	}
	if ((loadedCollisionTiles[((checkedCollisionTopY + 9) / 8) & 0x3F][((checkedCollisionLeftX - 4) / 8) & 0x3F] & (SurfaceFlags.solid | SurfaceFlags.unknown2)) != 0) {
		extraCollisionResult |= 0b10; // further southwest
	}
	switch (collisionResult) {
		case 0b001001:
			if (extraCollisionResult == 0b01) {
				result = Direction.downLeft; // NE/SW solid line, can move southwest alongside it
			} else if (extraCollisionResult == 0b10) {
				result = Direction.upLeft; // NW/SE solid line, can move northwest alongside it
			} else if (extraCollisionResult == 0b00) {
				if ((checkedCollisionTopY & 7) < 4) {
					result = Direction.upLeft;
				} else {
					result = Direction.downLeft;
				}
			}
			break;
		case 0b000001:
			if ((extraCollisionResult & 0b10) == 0) { // NE/SW solid line, can move alongside it
				result = Direction.downLeft;
			}
			break;
		case 0b001000:
			if ((extraCollisionResult & 0b01) == 0) {  // NW/SE solid line, can move alongside it
				result = Direction.upLeft;
			}
			break;
		default: break;
	}
	if ((furtherWestAttempted != 0) && (result == -1)) { // we're near the end of a very narrow path westward
		return Direction.left;
	}
	return result;
}

/** Runs collision checks for east movement and returns whether it's possible to move eastish
 * Returns: -1 if impossible, a Direction that we can move in otherwise
 * Original_Address: $(DOLLAR)C059EF
 */
short checkEastMovementMapCollision() {
	short result = -1;
	short furtherEastAttempted = 0;
	short extraCollisionResult = 0;
	tempEntitySurfaceFlags = 0;
	setTempEntitySurfaceFlags = 1;
	short collisionResult = performCollisionChecks(0b100100); // check east, southeast
	if (collisionResult == 0) { // see if we can move even further east
		checkedCollisionLeftX += 4;
		collisionResult = performCollisionChecks(0b100100); // check east, southeast again
		if (collisionResult == 0) {
			return Direction.right;
		}
		furtherEastAttempted = 1;
	}
	if (((collisionResult & 0b100100) == 0b100100) && ((checkedCollisionTopY & 7) != 0)) {
		if (furtherEastAttempted != 0) {
			// though the second check failed, we aren't at a tile boundary yet, so we can move at least a little west
			return Direction.right;
		}
		return -1;
	}
	if ((loadedCollisionTiles[((checkedCollisionTopY - 2) / 8) & 0x3F][((checkedCollisionLeftX + 4) / 8) & 0x3F] & (SurfaceFlags.solid | SurfaceFlags.unknown2)) != 0) {
		extraCollisionResult |= 0b01; // further northeast
	}
	if ((loadedCollisionTiles[((checkedCollisionTopY + 9) / 8) & 0x3F][((checkedCollisionLeftX + 4) / 8) & 0x3F] & (SurfaceFlags.solid | SurfaceFlags.unknown2)) != 0) {
		extraCollisionResult |= 0b10; // further southeast
	}
	switch (collisionResult) {
		case 0b100100:
			if (extraCollisionResult == 1) {
				result = Direction.downRight; // NW/SE solid line, can move southeast alongside it
			} else if (extraCollisionResult == 2) {
				result = Direction.upRight; // NE/SW solid line, can move northeast alongside it
			} else if (extraCollisionResult == 0) {
				if ((checkedCollisionTopY & 7) < 4) {
					result = Direction.upRight;
				} else {
					result = Direction.downRight;
				}
			}
			break;
		case 0b000100:
			if ((extraCollisionResult & 2) == 0) {
				result = Direction.downRight; // NW/SE solid line, can move alongside it
			}
			break;
		case 0b100000:
			if ((extraCollisionResult & 1) == 0) {
				result = Direction.upRight; // NE/SW solid line, can move alongside it
			}
			break;
		default: break;
	}
	if ((furtherEastAttempted != 0) && (result == -1)) { // we're near the end of a very narrow path eastward
		return Direction.right;
	}
	return result;
}

/// $C05B4E
short checkDiagonalMovementCollision(short direction) {
	tempEntitySurfaceFlags = 0;
	setTempEntitySurfaceFlags++;
	return (performCollisionChecks(unknownC200D1[direction / 2]) != 0) ? -256 : direction;
}

/** See if movement in a particular direction is possible and return flags
 * Original_Address: $(DOLLAR)C05B7B
 */
short checkMovementMapCollision(short x, short y, short arg3, short direction) {
	notMovingInSameDirectionFaced = 0;
	setTempEntitySurfaceFlags = 0;
	tempEntitySurfaceFlags = 0;
	finalMovementDirection = direction;
	unread7E5DA2 = direction;
	checkedCollisionLeftX = x;
	checkedCollisionTopY = y;
	short collisionResult;
	switch (direction) {
		case Direction.up:
			collisionResult = checkNorthMovementMapCollision();
			if (collisionResult != -1) {
				break;
			}
			short x10 = ladderStairsTileX;
			if ((checkedCollisionTopY & 7) < 5) {
				checkedCollisionTopY -= 4;
				short x0E = checkNorthMovementMapCollision();
				if ((x0E & 0xFF00) != 0xFF00) {
					collisionResult = x0E;
				}
			}
			ladderStairsTileX = x10;
			break;
		case Direction.down:
			collisionResult = checkSouthMovementMapCollision();
			if (collisionResult != -1) {
				break;
			}
			short x10 = ladderStairsTileX;
			if ((checkedCollisionTopY & 7) > 3) {
				checkedCollisionTopY += 4;
				short x0E = checkSouthMovementMapCollision();
				if ((x0E & 0xFF00) != 0xFF00) {
					collisionResult = x0E;
				}
			}
			ladderStairsTileX = x10;
			break;
		case Direction.left:
			collisionResult = checkWestMovementMapCollision();
			break;
		case Direction.right:
			collisionResult = checkEastMovementMapCollision();
			break;
		case Direction.upLeft:
		case Direction.upRight:
		case Direction.downLeft:
		case Direction.downRight:
			collisionResult = checkDiagonalMovementCollision(direction);
			if (collisionResult != -256) {
				collisionResult = direction;
			}
			break;
		default: break;
	}
	if (pendingInteractions != 0) {
		ladderStairsTileX = 0xFFFF;
	}
	if ((collisionResult == -1) || (collisionResult == -256)) {
		return tempEntitySurfaceFlags;
	}
	notMovingInSameDirectionFaced = (collisionResult != direction) ? 1 : 0;
	finalMovementDirection = collisionResult;
	return tempEntitySurfaceFlags & 0x3F;
}

/// $C05CD7
short getMovingCollisionFlags(short x, short y, short entity, short direction) {
	tempEntitySurfaceFlags = 0;
	checkedCollisionLeftX = cast(short)(x - collisionWidths[entitySizes[entity]]);
	checkedCollisionTopY = cast(short)(y - collisionHeights1[entitySizes[entity]] + collisionHeights2[entitySizes[entity]]);
	switch(direction) {
		case Direction.upRight:
			checkHorizontalRightTileCollision(checkedCollisionTopY, entitySizes[entity]);
			goto case;
		case Direction.up:
			checkVerticalUpTileCollision(checkedCollisionLeftX, entitySizes[entity]);
			break;
		case Direction.downRight:
			checkVerticalDownTileCollision(checkedCollisionLeftX, entitySizes[entity]);
			goto case;
		case Direction.right:
			checkHorizontalRightTileCollision(checkedCollisionTopY, entitySizes[entity]);
			break;
		case Direction.downLeft:
			checkHorizontalLeftTileCollision(checkedCollisionTopY, entitySizes[entity]);
			goto case;
		case Direction.down:
			checkVerticalDownTileCollision(checkedCollisionLeftX, entitySizes[entity]);
			break;
		case Direction.upLeft:
			checkVerticalUpTileCollision(checkedCollisionLeftX, entitySizes[entity]);
			goto case;
		case Direction.left:
			checkHorizontalLeftTileCollision(checkedCollisionTopY, entitySizes[entity]);
			break;
		default: break;
	}
	return tempEntitySurfaceFlags;
}

/// $C05D8B
short getCollisionFlags(short x, short y, short size) {
	short x0E = cast(short)(x - collisionWidths[size]);
	checkedCollisionLeftX = x0E;
	checkedCollisionTopY = cast(short)(y - collisionHeights1[size] + collisionHeights2[size]);
	checkVerticalUpTileCollision(x0E, size);
	checkVerticalDownTileCollision(checkedCollisionLeftX, size);
	checkHorizontalLeftTileCollision(checkedCollisionTopY, size);
	checkHorizontalRightTileCollision(checkedCollisionTopY, size);
	return tempEntitySurfaceFlags;
}

/** Check if the enemy can spawn on the given collision flags. Translates the given collision flags into a new set, according to the enemy's preferences
 * Params:
 * 	collisionFlags = The flags to test against
 * 	entity = Unused entity ID
 * 	enemyID = Enemy ID whose flags should be checked
 * Returns: New collision flags, either solid or not
 * Original_Address: $(DOLLAR)C05DE7
 */
short checkEnemyCanMove(short collisionFlags, short entity, short enemyID) {
	short flagsToCheck = 0;
	switch (collisionFlags & 0xC) {
		case 0:
			flagsToCheck = EnemyMovementFlags.canMoveOnLand;
			break;
		case SurfaceFlags.causesSunstroke:
			flagsToCheck = EnemyMovementFlags.canMoveInHeat;
			break;
		case SurfaceFlags.shallowWater:
		case SurfaceFlags.deepWater:
			flagsToCheck = EnemyMovementFlags.canMoveInWater;
			break;
		default: break;
	}
	if ((enemyConfigurationTable[enemyID].enemyMovementFlags & flagsToCheck) != 0) {
		return 0;
	}
	return SurfaceFlags.solid;
}

/// $C05E3B
short unknownC05E3B(short arg1) {
	if (testEntityMovementActive() == 0) {
		return -256;
	}
	entityObstacleFlags[arg1] = getMovingCollisionFlags(entityMovementProspectX, entityMovementProspectY, arg1, entityDirections[arg1]) & (SurfaceFlags.solid | SurfaceFlags.unknown2 | SurfaceFlags.ladderOrStairs);
	return entityObstacleFlags[arg1];
}

/** Gets the map collision for where the active entity intends to move and sets its collision flags
 * Returns: The collision flags, or 0 if movement is disabled
 * Original_Address: $(DOLLAR)C05E76
 */
short actionScriptGetActiveEntityMapCollisionProspective() {
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
	short x04 = checkEnemyCanMove(x0E, currentEntitySlot, entityEnemyIDs[currentEntitySlot]);
	entityObstacleFlags[currentEntitySlot] |= x04;
	return x04;
}

/// $C05ECE
short unknownC05ECE() {
	if (testEntityMovementActive() == 0) {
		return 0;
	}
	short x02 = unknownC05F82(entityMovementProspectX, entityMovementProspectY, currentEntitySlot) & 0xD0;
	entityObstacleFlags[currentEntitySlot] = x02;
	if (x02 != 0) {
		return 0;
	}
	ushort tmp = x02 | checkEnemyCanMove(x02, currentEntitySlot, entityEnemyIDs[currentEntitySlot]);
	entityObstacleFlags[currentEntitySlot] = tmp;
	return tmp;
}

/// $C05F33
short getSurfaceFlags(short x, short y, short entityID) {
	const size = entitySizes[entityID];
	tempEntitySurfaceFlags = 0;
	checkedCollisionLeftX = cast(short)(x - collisionWidths[size]);
	checkedCollisionTopY = cast(short)(y - collisionHeights1[size] + collisionHeights2[size]);
	checkHorizontalLeftTileCollision(checkedCollisionTopY, size);
	checkHorizontalRightTileCollision(checkedCollisionTopY, size);
	return tempEntitySurfaceFlags;
}

/// $C05F82
short unknownC05F82(short x, short y, short entityID) {
	tempEntitySurfaceFlags = 0;
	const size = entitySizes[entityID];
	checkedCollisionTopY = cast(short)(y - collisionHeights1[size] + collisionHeights2[size]);
	checkedCollisionLeftX = cast(short)(x + collisionWidths[size]);
	checkVerticalUpTileCollision(checkedCollisionLeftX, size);
	checkVerticalDownTileCollision(checkedCollisionLeftX, size);
	return tempEntitySurfaceFlags;
}

/**
 * Original_Address: $(DOLLAR)C05FD1
 */
short unknownC05FD1(short x, short y, short entity) {
	tempEntitySurfaceFlags = 0;
	tempEntitySurfaceFlags = getCollisionAtLoadedTile(x / 8, (y + 4) / 8);
	return tempEntitySurfaceFlags;
}

/** Find any NPCs colliding with entity, respecting intangibility
 * Params:
 * 	x = The X coordinate the entity is assumed to be at
 * 	y = The Y coordinate the entity is assumed to be at
 * 	entity = The entity ID whose hitboxes will be used
 * Returns: Entity index of the first colliding NPC
 * Original_Address: $(DOLLAR)C05FF6
 */
short npcCollisionCheck(short x, short y, short entity) {
	short result = -1;
	if ((entityHitboxEnabled[entity] != 0) && ((playerMovementFlags & PlayerMovementFlags.collisionDisabled) == 0) && (gameState.walkingStyle != WalkingStyle.escalator) && (demoFramesLeft == 0)) {
		short subjectWidth;
		short subjectHeight;
		if ((entityDirections[entity] == Direction.right) || (entityDirections[entity] == Direction.left)) {
			subjectWidth = entityHitboxLeftRightWidth[entity];
			subjectHeight = entityHitboxLeftRightHeight[entity];
		} else {
			subjectWidth = entityHitboxUpDownWidth[entity];
			subjectHeight = entityHitboxUpDownHeight[entity];
		}
		x -= subjectWidth;
		y -= subjectHeight;
		for (short i = 0; i != partyLeaderEntity; i++) {
			// skip uninitialized entities
			if (entityScriptTable[i] == -1) {
				continue;
			}
			// skip entities with disabled collision
			if (entityCollidedObjects[i] == 0x8000) {
				continue;
			}
			// skip enemies when intangible
			if ((playerIntangibilityFrames != 0) && (entityNPCIDs[i] + 1 >= 0x8001)) {
				continue;
			}
			// skip entities with disabled hitboxes
			if (entityHitboxEnabled[i] == 0) {
				continue;
			}
			short targetWidth;
			short targetHeight;
			if ((entityDirections[i] == Direction.right) || (entityDirections[i] == Direction.left)) {
				targetWidth = entityHitboxLeftRightWidth[i];
				targetHeight = entityHitboxLeftRightHeight[i];
			} else {
				targetWidth = entityHitboxUpDownWidth[i];
				targetHeight = entityHitboxUpDownHeight[i];
			}
			if (entityAbsYTable[i] - targetHeight - subjectHeight >= y) {
				continue;
			}
			if (targetHeight + entityAbsYTable[i] - targetHeight <= y) {
				continue;
			}
			if (entityAbsXTable[i] - targetWidth - subjectWidth * 2 >= x) {
				continue;
			}
			if (entityAbsXTable[i] - targetWidth + targetWidth * 2 <= x) {
				continue;
			}
			result = i;
			break;
		}

	}
	entityCollidedObjects[partyLeaderEntity] = result;
	return result;
}

/// $C0613C
void unknownC0613C(short arg1, short arg2, short arg3) {
	ushort result = 0xFFFF;
	if (entityHitboxEnabled[arg3] != 0) {
		short x18;
		short x04;
		if ((entityDirections[arg3] == Direction.right) || (entityDirections[arg3] == Direction.left)) {
			x18 = entityHitboxLeftRightWidth[arg3];
			x04 = entityHitboxLeftRightHeight[arg3];
		} else {
			x18 = entityHitboxUpDownWidth[arg3];
			x04 = entityHitboxUpDownHeight[arg3];
		}
		short x16 = cast(short)(arg1 - x18);
		short x14 = cast(short)(x18 * 2);
		short x1C = cast(short)(arg2 - x04);
		for (short i = 0; i < maxEntities; i++) {
			if (i == arg3) {
				continue;
			}
			if (i == partyLeaderEntity) {
				continue;
			}
			if (entityScriptTable[i] == -1) {
				continue;
			}
			if (entityCollidedObjects[i] == 0x8000) {
				continue;
			}
			if (entityHitboxEnabled[i] == 0) {
				continue;
			}
			short y;
			short x10;
			if ((entityDirections[i] == Direction.right) || (entityDirections[i] == Direction.left)) {
				y = entityHitboxLeftRightWidth[i];
				x10 = entityHitboxLeftRightHeight[i];
			} else {
				y = entityHitboxUpDownWidth[i];
				x10 = entityHitboxUpDownHeight[i];
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
			result = i;
			break;
		}
	}
	entityCollidedObjects[arg3] = result;
}

/// $C06267
short unknownC06267(short x, short y, short subjectEntity) {
	short collidedEntity = -1;
	if (entityHitboxEnabled[subjectEntity] != 0) {
		short subjectHitboxWidth;
		short subjectHitboxHeight;
		if ((entityDirections[subjectEntity] == Direction.right) || (entityDirections[subjectEntity] == Direction.left)) {
			subjectHitboxWidth = entityHitboxLeftRightWidth[subjectEntity];
			subjectHitboxHeight = entityHitboxLeftRightHeight[subjectEntity];
		} else {
			subjectHitboxWidth = entityHitboxUpDownWidth[subjectEntity];
			subjectHitboxHeight = entityHitboxUpDownHeight[subjectEntity];
		}
		short leftX = cast(short)(x - subjectHitboxWidth);
		short topY = cast(short)(y - subjectHitboxHeight);
		if (playerIntangibilityFrames == 0) {
			for (short i = 24; i < maxEntities; i++) {
				if (entityScriptTable[i] == -1) {
					continue;
				}
				if (entityCollidedObjects[i] == 0x8000) {
					continue;
				}
				if (entityHitboxEnabled[i] == 0) {
					continue;
				}
				short targetHitboxHeight;
				short targetHitboxWidth;
				if ((entityDirections[i] == Direction.right) || (entityDirections[i] == Direction.left)) {
					targetHitboxWidth = entityHitboxLeftRightWidth[i];
					targetHitboxHeight = entityHitboxLeftRightHeight[i];
				} else {
					targetHitboxWidth = entityHitboxUpDownWidth[i];
					targetHitboxHeight = entityHitboxUpDownHeight[i];
				}
				if (topY <= entityAbsYTable[i] - targetHitboxHeight - subjectHitboxHeight) {
					continue;
				}
				if (topY >= entityAbsYTable[i] - targetHitboxHeight + targetHitboxHeight) {
					continue;
				}
				if (leftX <= entityAbsXTable[i] - targetHitboxWidth - subjectHitboxWidth * 2) {
					continue;
				}
				if (leftX >= entityAbsXTable[i] - targetHitboxWidth + targetHitboxWidth * 2) {
					continue;
				}
				collidedEntity = i;
				goto DoneCheckingCollision;
			}
		}
		for (short i = 0; i < partyLeaderEntity; i++) {
			if (i == subjectEntity) {
				continue;
			}
			if (entityScriptTable[i] == -1) {
				continue;
			}
			if (entityNPCIDs[i] >= 0x1000) {
				continue;
			}
			if (entityCollidedObjects[i] == 0x8000) {
				continue;
			}
			if (entityHitboxEnabled[i] == 0) {
				continue;
			}
			short targetHitboxHeight;
			short targetHitboxWidth;
			if ((entityDirections[i] == Direction.right) || (entityDirections[i] == Direction.left)) {
				targetHitboxWidth = entityHitboxLeftRightWidth[i];
				targetHitboxHeight = entityHitboxLeftRightHeight[i];
			} else {
				targetHitboxWidth = entityHitboxUpDownWidth[i];
				targetHitboxHeight = entityHitboxUpDownHeight[i];
			}
			if (topY <= entityAbsYTable[i] - targetHitboxHeight - subjectHitboxHeight) {
				continue;
			}
			if (topY >= entityAbsYTable[i] - targetHitboxHeight + targetHitboxHeight - 1) {
				continue;
			}
			if (leftX <= entityAbsXTable[i] - targetHitboxWidth - subjectHitboxWidth * 2) {
				continue;
			}
			if (leftX >= entityAbsXTable[i] - targetHitboxWidth + targetHitboxWidth * 2 - 1) {
				continue;
			}
			collidedEntity = i;
			goto DoneCheckingCollision;
		}
	}
	DoneCheckingCollision:
	entityCollidedObjects[subjectEntity] = collidedEntity;
	return collidedEntity;
}

/// $C06478
void unknownC06478() {
	if (entityCollidedObjects[currentEntitySlot] == 0x8000) {
		return;
	}
	testEntityMovementSlot(currentEntitySlot);
	unknownC06267(entityMovementProspectX, entityMovementProspectY, currentEntitySlot);
}

/** Tests for colliding entities where the active entity wants to move and sets the collision field as needed
 * Original_Address: $(DOLLAR)C064A6
 */
void actionScriptSetEntityToEntityCollisionProspective() {
	if (entityCollidedObjects[currentEntitySlot] == 0x8000) {
		return;
	}
	testEntityMovementSlot(currentEntitySlot);
	unknownC0613C(entityMovementProspectX, entityMovementProspectY, currentEntitySlot);
}

/// $C064D4
void unknownC064D4() {
	nextQueuedInteraction = 0;
	currentQueuedInteraction = 0;
	currentQueuedInteractionType = -1;
}

/// $C064E3
void queueInteraction(short arg1, QueuedInteractionPtr arg2) {
	if (arg1 == currentQueuedInteractionType) {
		return;
	}
	tracef("Adding interaction of type %s", arg1);
	queuedInteractions[nextQueuedInteraction].type = arg1;
	queuedInteractions[nextQueuedInteraction].ptr = arg2;
	nextQueuedInteraction = (nextQueuedInteraction + 1) & 3;
	pendingInteractions = 1;
}

/// $C06537
short getLastQueuedInteractionType() {
	return queuedInteractions[currentQueuedInteraction].type;
}

/// $C0654E
QueuedInteractionPtr getLastQueuedInteractionPointer() {
	return queuedInteractions[currentQueuedInteraction].ptr;
}

/// $C06578
void queueEntityCreationRequest(short sprite, short script) {
	entityCreationRequests[entityCreationRequestsCount].sprite = sprite;
	entityCreationRequests[entityCreationRequestsCount].script = script;
	entityCreationRequestsCount++;
}

/// $C065A3
void processEntityCreationRequests() {
	while (entityCreationRequestsCount != 0) {
		entityCreationRequestsCount--;
		createPreparedEntitySprite(entityCreationRequests[entityCreationRequestsCount].sprite, entityCreationRequests[entityCreationRequestsCount].script);
	}
}

/// $C065C2
void unknownC065C2(short direction) {
	short x = cast(short)((gameState.leaderX.integer / 8) + interactXOffsets[direction]);
	short y = cast(short)((gameState.leaderY.integer / 8) + interactYOffsets[direction]);
	if (direction == Direction.left) {
		x--;
	}
	short foundObject = getMapObjectAt(x, y);
	if (foundObject == -1) { // try again, a little to the right
		foundObject = getMapObjectAt(cast(short)(x + 1), y);
	}
	if ((foundObject != -1) && (foundObject == ObjectType.person)) {
		unread7E5DDC = mapObjectFoundType;
		//mapObjectText = doorData[mapObjectFound & 0x7FFF]

		mapObjectText = mapObjectFound.object.textPtr;
		interactingNPCID = -2;
	}
}

/// $C06662
void screenTransition(short arg1, short arg2) {
	short duration = screenTransitionConfigTable[arg1].duration == 0xFF ? 900 : screenTransitionConfigTable[arg1].duration;
	unknownC42631(screenTransitionConfigTable[arg1].unknown5, screenTransitionConfigTable[arg1].direction * 4);
	if (arg2 == 1) {
		freezeEntities();
		psiTeleportWaitNFrames(2);
		if (screenTransitionConfigTable[arg1].animationID != 0) {
			startSwirl(screenTransitionConfigTable[arg1].animationID, screenTransitionConfigTable[arg1].animationFlags | AnimationFlags.invert);
		}
		multiplyPalettes(screenTransitionConfigTable[arg1].fadeMultiplier, &palettes[0][0]);
		prepareLoadedPaletteFadeTables(duration, PaletteMask.all);
		for (short i = 0; i < duration; i++) {
			if (paletteUploadMode != PaletteUpload.none) {
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
		if (screenTransitionConfigTable[arg1].fadeMultiplier <= 50) {
			prepareForImmediateDMA();
		} else {
			memset(&palettes[0][0], 0xFF, 0x200);
			preparePaletteUpload(PaletteUpload.full);
			waitUntilNextFrame();
			wipePalettesOnMapLoad = 1;
		}
		unfreezeEntities();
	} else {
		short x1D = (screenTransitionConfigTable[arg1].fadeMultiplier <= 50) ? 1 : 0;
		if (x1D != 0) {
			fadeIn(1, 1);
		} else {
			prepareLoadedPaletteFadeTables(screenTransitionConfigTable[arg1].secondaryDuration, PaletteMask.all);
		}
		if (screenTransitionConfigTable[arg1].secondaryAnimationID != 0) {
			startSwirl(screenTransitionConfigTable[arg1].secondaryAnimationID, screenTransitionConfigTable[arg1].secondaryAnimationFlags);
		}
		for (short i = 0; i < screenTransitionConfigTable[arg1].secondaryDuration; i++) {
			if (x1D == 0) {
				if (paletteUploadMode != PaletteUpload.none) {
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
				freezeEntities();
			}
		}
		if (x1D == 0) {
			finishPaletteFade();
		}
	}
	if (currentGiygasPhase < GiygasPhase.startPraying) {
		disableOvalWindow();
	}
	unfreezeEntities();
	ladderStairsTileY = 0;
	ladderStairsTileX = 0;
}

/// $C068AF
short getScreenTransitionSoundEffect(short transition, short getStart) {
	if (getStart == 0) {
		return screenTransitionConfigTable[transition].endingSoundEffect;
	}
	return screenTransitionConfigTable[transition].startSoundEffect;
}

/// $C068F4
void loadSectorMusic(short x, short y) {
	if (disableMusicChanges != 0) {
		return;
	}
	tracef("Using overworld music entry %s", mapDataPerSectorMusic[y / 128][(x >> 8) & 0xFF]);
	const(OverworldEventMusic)* x0A = &overworldEventMusicPointerTable[mapDataPerSectorMusic[y / 128][(x >> 8) & 0xFF]][0];
	while (x0A.flag != 0) {
		tracef("Trying flag %s for %s", cast(EventFlag)(x0A.flag & 0x7FFF), cast(Music)x0A.music);
		if (getEventFlag(x0A.flag & 0x7FFF) == (x0A.flag > 0x8000) ? 1 : 0) {
			break;
		}
		x0A++;
	}
	tracef("Selected music track: %s", cast(Music)x0A.music);
	loadedMapMusicEntry = x0A;
	nextMapMusicTrack = x0A.music;
	if ((doMapMusicFade == 0) && (x0A.music != currentMapMusicTrack)) {
		musicEffect(MusicEffect.quickFade);
	}
}

/// $C069AF
void changeMapMusic() {
	if (disableMusicChanges != 0) {
		return;
	}
	if (nextMapMusicTrack == currentMapMusicTrack) {
		return;
	}
	currentMapMusicTrack = nextMapMusicTrack;
	changeMusic(nextMapMusicTrack);
	musicEffect(loadedMapMusicEntry.audioEffect);
}

/// $C069ED
void changeMapMusicImmediately() {
	changeMusic(nextMapMusicTrack);
}

/// $C069F7
short unknownC069F7() {
	loadSectorMusic(gameState.leaderX.integer, gameState.leaderY.integer);
	return nextMapMusicTrack;
}

/** Changes the music track to the normal overworld music for the player's location
 * Original_Address: $(DOLLAR)C06A07
 */
void reloadMapMusic() {
	loadSectorMusic(gameState.leaderX.integer, gameState.leaderY.integer);
	changeMusic(nextMapMusicTrack);
}

/** Handle interaction with a switch on the map
 * Params:
 * 	switchEntry = The switch object entry
 * Original_Address: $(DOLLAR)C06A1B
 */
void interactMapSwitch(const(SwitchObject)* switchEntry) {
	if (getEventFlag(switchEntry.eventFlag & 0x7FFF) == (switchEntry.eventFlag > eventFlagUnset) ? 1 : 0) {
		queueInteraction(InteractionType.mapSwitch, QueuedInteractionPtr(getTextBlock(switchEntry.textPtr)));
		ladderStairsTileY = 0;
		ladderStairsTileX = 0;
	}
}

/// $C06A8B
void interactObject(const(MapObjectObject)*) {
	//you wanted something? too bad!
}

/// $C06A8E
void interactMapNPC(const(MapObjectObject)*) {
	//nothing
}

/// $C06A91
void interactRopeLadder(short arg1) {
	if ((gameState.walkingStyle == WalkingStyle.ladder) || (gameState.walkingStyle == WalkingStyle.rope)) {
		return;
	}
	if (arg1 == 0) {
		gameState.walkingStyle = WalkingStyle.ladder;
	} else {
		gameState.walkingStyle = WalkingStyle.rope;
	}
	gameState.leaderDirection &= 0xFFFE;
	stairsDirection = -1;
}

/// $C06ACA
void interactDoor(const(DoorObject)* arg1) {
	if (playerHasDoneSomethingThisFrame == 0) {
		return;
	}
	if (gameState.cameraMode == CameraMode.followEntity) {
		return;
	}
	if (pendingInteractions != 0) {
		return;
	}
	if ((enemyHasBeenTouched | battleSwirlCountdown) != 0) {
		return;
	}
	usingDoor = 1;
	QueuedInteractionPtr ptr = { doorPtr: arg1 };
	queueInteraction(InteractionType.unknown2, cast(QueuedInteractionPtr)ptr);
	playerIntangibilityFlash();
}

/// $C06B21
void spawnBuzzBuzz() {
	displayText(getTextBlock("MSG_EVT_BUNBUNBUN"));
	respawnDeliveryEntities();
}

/// $C06B3D
void removeNonTransitionSurvivingInteractions() {
	short i;
	for (i = 0; (4 > i) && (currentQueuedInteraction != nextQueuedInteraction); currentQueuedInteraction = (currentQueuedInteraction + 1) & 3, i++) {
		if (getLastQueuedInteractionType() != InteractionType.textSurvivesDoorTransition) {
			continue;
		}
		doorInteractions[i] = getLastQueuedInteractionPointer();
	}
	doorInteractions[i].textPtr = null;
	for (short j = 0; doorInteractions[j].textPtr !is null; j++) {
		queueInteraction(InteractionType.textSurvivesDoorTransition, doorInteractions[j]);
	}
}

/// $C06BFF
void doorTransition(const(DoorObject)* arg1) {
	if (arg1.textPtr !is null) {
		displayInteractionText(getTextBlock(arg1.textPtr));
	}
	ladderStairsTileY = 0;
	ladderStairsTileX = 0;
	if ((arg1.eventFlag != 0) && (getEventFlag(arg1.eventFlag & 0x7FFF) != (arg1.eventFlag > eventFlagUnset) ? 1 : 0)) {
		usingDoor = 0;
		return;
	}
	for (short i = 1; i <= 10; i++) {
		setEventFlag(i, 0);
	}
	removeNonTransitionSurvivingInteractions();
	playerIntangibilityFlash();
	version(bugfix) {
		if (auto sfx = getScreenTransitionSoundEffect(arg1.transitionStyle, 1)) {
			playSfx(sfx);
		}
	} else {
		playSfx(getScreenTransitionSoundEffect(arg1.transitionStyle, 1));
	}
	if (disabledTransitions != 0) {
		fadeOut(1, 1);
	} else {
		screenTransition(arg1.transitionStyle, 1);
	}
	short x02 = cast(short)(arg1.unknown8 * 8);
	short x04 = cast(short)((arg1.unknown6 & 0x3FFF) * 8);
	if (unknownC3E1D8[arg1.unknown6 >> 14] != 2) {
		x02 += 8;
	}
	if (debugging != 0) {
		if (debugModeNumber != DebugMode.soundMode) {
			loadSectorMusic(x02, x04);
		}
		if (replayModeActive == 0) {
			storePersistentReplayState(arg1.transitionStyle);
		}
	} else {
		loadSectorMusic(x02, x04);
	}
	loadMapAtPosition(x02, x04);
	playerHasMovedSinceMapLoad = 0;
	gameState.walkingStyle = 0;
	unknownC03FA9(x02, x04, unknownC3E1D8[arg1.unknown6 >> 14]);
	if ((debugging != 0) && (replayModeActive == 0)) {
		saveReplaySaveSlot();
	}
	changeMapMusic();
	processEntityCreationRequests();
	playerIntangibilityFlash();
	version(bugfix) {
		if (auto sfx = getScreenTransitionSoundEffect(arg1.transitionStyle, 0)) {
			playSfx(sfx);
		}
	} else {
		playSfx(getScreenTransitionSoundEffect(arg1.transitionStyle, 0));
	}
	if (disabledTransitions != 0) {
		fadeIn(1, 1);
	} else {
		screenTransition(arg1.transitionStyle, 0);
	}
	stairsDirection = -1;
	playerHasDoneSomethingThisFrame = -1;
	spawnBuzzBuzz();
	usingDoor = 0;
}

/// $C06E02
immutable short[4] escalatorEntryOffsetsX = [
	StairDirection.upLeft >> 8: 8,
	StairDirection.upRight >> 8: 0,
	StairDirection.downLeft >> 8: 0,
	StairDirection.downRight >> 8: 8
];

/// $C06E0A
immutable short[4] escalatorExitOffsetsX = [
	StairDirection.upLeft >> 8: 0,
	StairDirection.upRight >> 8: 8,
	StairDirection.downLeft >> 8: 0,
	StairDirection.downRight >> 8: 8
];

/// $C06E12
immutable short[4] stairInputDirectionMap = [Direction.left, Direction.right, Direction.left, Direction.right];

/// $C06E2C
void enterEscalator() {
	gameState.walkingStyle = WalkingStyle.escalator;
	playerMovementFlags = 0;
	gameState.leaderX.integer = escalatorNewX;
	gameState.leaderY.integer = escalatorNewY;
	gameState.leaderY.fraction = 0;
	gameState.leaderX.fraction = 0;
}

/// $C06E4A
void exitEscalator() {
	stairsDirection = -1;
	gameState.walkingStyle = WalkingStyle.normal;
	playerMovementFlags = 0;
	unread7E5DBA = 0;
	gameState.leaderX.integer = escalatorNewX;
	gameState.leaderY.integer = escalatorNewY;
	gameState.leaderY.fraction = 0;
	gameState.leaderX.fraction = 0;
}

/// $C06E6E
void interactEscalator(ushort arg1, short x, short y) {
	if (demoFramesLeft != 0) {
		return;
	}
	clearAutoMovementDemo();
	short xDest;
	if ((arg1 & 0x8000) != 0) { // getting off escalator
		if (gameState.walkingStyle != WalkingStyle.escalator) {
			return;
		}
		gameState.walkingStyle = WalkingStyle.normal;
		playerMovementFlags = PlayerMovementFlags.collisionDisabled | PlayerMovementFlags.dontChangeDirection;
		xDest = cast(short)((x * 8) + escalatorExitOffsetsX[escalatorEntranceDirection >> 8]);
		short frames = recordAutoMovementDemo(gameState.leaderX.integer, gameState.leaderY.integer, xDest, cast(short)(y * 8));
		recordAutoMovementDemoNFramesDirection(stairInputDirectionMap[escalatorEntranceDirection >> 8], 16);
		scheduleOverworldTask(cast(short)(frames + 1), &exitEscalator);
		finishAutoMovementDemoAndStart();
		escalatorEntranceDirection = 0;
		unread7E5DBA = 1;
	} else { // getting on escalator
		if (gameState.walkingStyle == WalkingStyle.escalator) {
			return;
		}
		unread7E5DBA = 1;
		escalatorEntranceDirection = arg1;
		gameState.leaderDirection = stairInputDirectionMap[arg1 >> 8];
		playerMovementFlags = PlayerMovementFlags.collisionDisabled | PlayerMovementFlags.dontChangeDirection;
		xDest = cast(short)((x * 8) + escalatorEntryOffsetsX[arg1 >> 8]);
		scheduleOverworldTask(recordAutoMovementDemo(gameState.leaderX.integer, gameState.leaderY.integer, xDest, cast(short)(y * 8)), &enterEscalator);
		finishAutoMovementDemoAndStart();
	}
	escalatorNewX = xDest;
	escalatorNewY = cast(short)(y * 8);
	stairsDirection = -1;
}

/// $C06F82
void getOnStairs() {
	short x12 = 0;
	if ((stairsDirection == StairDirection.upLeft) || (stairsDirection == StairDirection.upRight)) {
		if (stairsNewY - 1 > gameState.leaderY.integer) {
			x12 = 1;
		}
	} else {
		if (stairsNewY + 1 < gameState.leaderY.integer) {
			x12 = 1;
		}
	}
	if (x12 != 0) {
		gameState.walkingStyle = WalkingStyle.stairs;
		gameState.leaderX.integer = stairsNewX;
		gameState.leaderY.integer = stairsNewY;
		gameState.leaderY.fraction = 0;
		gameState.leaderX.fraction = 0;
	} else {
		scheduleOverworldTask(1, &getOnStairs);
	}
}

/// $C06FED
void getOffStairs() {
	short x12 = 0;
	if ((stairsDirection == StairDirection.upLeft) || (stairsDirection == StairDirection.upRight)) {
		if (stairsNewY < gameState.leaderY.integer) {
			x12 = 1;
		}
	} else {
		if (stairsNewY > gameState.leaderY.integer) {
			x12 = 1;
		}
	}
	if (x12 != 0) {
		stairsDirection = -1;
		gameState.walkingStyle = WalkingStyle.normal;
		playerMovementFlags = 0;
		gameState.leaderX.integer = stairsNewX;
		gameState.leaderY.integer = stairsNewY;
		gameState.leaderY.fraction = 0;
		gameState.leaderX.fraction = 0;
		unread7E5DBA = 0;
	} else {
		scheduleOverworldTask(1, &getOffStairs);
	}
}

/// $C0705F
short unknownC0705F(ushort arg1) {
	short result = 1;
	switch (arg1) {
		case StairDirection.upRight:
			if ((gameState.leaderDirection == 0) || ((gameState.leaderDirection & 3) != 0)) {
				result = 0;
			}
			autoMovementDirection = Direction.right;
			break;
		case StairDirection.upLeft:
			if ((gameState.leaderDirection == 0) || ((gameState.leaderDirection & 3) != 0)) {
				result = 0;
			}
			autoMovementDirection = Direction.left;
			break;
		case StairDirection.downRight:
			if ((gameState.leaderDirection & 7) != 0) {
				result = 0;
			}
			autoMovementDirection = Direction.right;
			break;
		case StairDirection.downLeft:
			if ((gameState.leaderDirection & 7) != 0) {
				result = 0;
			}
			autoMovementDirection = Direction.left;
			break;
		default: break;
	}
	return result;
}

/// $C070CB
void interactStairs(ushort direction, short x, short y) {
	if (demoFramesLeft != 0) {
		return;
	}
	clearAutoMovementDemo();
	short xDest;
	short yDest;
	if (gameState.walkingStyle == 0) { //getting on stairs
		if (unknownC0705F(direction) != 0) {
			return;
		}
		gameState.leaderDirection = autoMovementDirection;
		notMovingInSameDirectionFaced = 0;
		playerMovementFlags = PlayerMovementFlags.collisionDisabled | PlayerMovementFlags.dontChangeDirection;
		unread7E5DBA = 1;
		stairsDirection = cast(short)(direction & 0xFF00);
		xDest = cast(short)((x * 8) + staircaseStartOffsetX[direction >> 8]);
		yDest = cast(short)((y * 8) + staircaseStartOffsetY[direction >> 8]);
		short frames = recordAutoMovementDemo(gameState.leaderX.integer, gameState.leaderY.integer, xDest, yDest);
		if (frames == 0) {
			frames++;
		}
		recordAutoMovementDemoNFramesDirection(staircaseEntryDirections[direction >> 8], 6);
		scheduleOverworldTask(frames, &getOnStairs);
	} else { //getting off stairs
		xDest = cast(short)((x * 8) + staircaseEndOffsetX[direction >> 8]);
		yDest = cast(short)((y * 8) + staircaseEndOffsetY[direction >> 8]);
		short frames = recordAutoMovementDemo(gameState.leaderX.integer, gameState.leaderY.integer, xDest, yDest);
		if (frames == 0) {
			frames++;
		}
		recordAutoMovementDemoNFramesDirection(staircaseExitDirections[direction >> 8], 12);
		scheduleOverworldTask(frames, &getOffStairs);
	}
	stairsNewX = xDest;
	stairsNewY = yDest;
	finishAutoMovementDemoAndStart();
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
		activeHotspots[i].x1 = cast(ushort)(mapHotspots[gameState.activeHotspotIDs[i]].x1 * 8);
		activeHotspots[i].y1 = cast(ushort)(mapHotspots[gameState.activeHotspotIDs[i]].y1 * 8);
		activeHotspots[i].x2 = cast(ushort)(mapHotspots[gameState.activeHotspotIDs[i]].x2 * 8);
		activeHotspots[i].y2 = cast(ushort)(mapHotspots[gameState.activeHotspotIDs[i]].y2 * 8);
		activeHotspots[i].pointer = gameState.activeHotspotPointers[i];
	}
}

/** Activates a hotspot with preset coordinates and text pointer.
 * If player is already inside the hotspot coordinates, will instead trigger when the player steps outside of the area.
 * Params:
 * 	id = 1-based index of hotspot to enable
 * 	preset = Preset coordinates to use
 * 	text = Pointer to text to display upon triggering
 * Original_Address: $(DOLLAR)C072CF
 */
void activateHotspot(short id, short preset, const(ubyte)* text) {
	short mode;
	if ((gameState.leaderX.integer > mapHotspots[preset].x1) && (gameState.leaderX.integer < mapHotspots[preset].x2) && (gameState.leaderY.integer > mapHotspots[preset].y1) && (gameState.leaderY.integer < mapHotspots[preset].y2)) {
		mode = 1;
	} else {
		mode = 2;
	}
	activeHotspots[id - 1].mode = mode;
	activeHotspots[id - 1].x1 = cast(ushort)(mapHotspots[preset].x1 * 8);
	activeHotspots[id - 1].y1 = cast(ushort)(mapHotspots[preset].y1 * 8);
	activeHotspots[id - 1].x2 = cast(ushort)(mapHotspots[preset].x2 * 8);
	activeHotspots[id - 1].y2 = cast(ushort)(mapHotspots[preset].y2 * 8);
	activeHotspots[id - 1].pointer = text;
	gameState.activeHotspotModes[id - 1] = cast(ubyte)mode;
	gameState.activeHotspotIDs[id - 1] = cast(ubyte)preset;
	gameState.activeHotspotPointers[id - 1] = text;
}

/** Queues up a hotspot interaction, as long as the player is within bounds and isn't teleporting
 * Params:
 * 	id = The active hotspot index
 * Original_Address: $(DOLLAR)C073C0
 */
void queueHotspotInteraction(short id) {
	// don't ask. I don't know either
	if ((nextQueuedInteraction ^ nextQueuedInteraction) != 0) {
		return;
	}
	if (psiTeleportDestination != 0) {
		return;
	}
	short mode = activeHotspots[id].mode;
	if (mode == 1) {
		if ((gameState.leaderX.integer >= activeHotspots[id].x1) && (gameState.leaderX.integer < activeHotspots[id].x2) && (gameState.leaderY.integer >= activeHotspots[id].y1) && (gameState.leaderY.integer < activeHotspots[id].y2)) {
			return;
		}
	} else {
		if ((gameState.leaderX.integer <= activeHotspots[id].x1) || (gameState.leaderX.integer >= activeHotspots[id].x2) || (gameState.leaderY.integer <= activeHotspots[id].y1) || (gameState.leaderY.integer >= activeHotspots[id].y2)) {
			return;
		}
	}
	activeHotspots[id].mode = 0;
	queueInteraction(InteractionType.unknown9, QueuedInteractionPtr(activeHotspots[id].pointer));
	gameState.activeHotspotModes[id] = 0;
}

/** Searches for map objects at the given coordinates
 * Params:
 * 	x = x coordinate, in pixels
 * 	y = y coordinate, in pixels
 * Returns: Type of map object found, or -1 if none
 * Original_Address: $(DOLLAR)C07477
 */
byte getMapObjectAt(short x, short y) {
	const(SectorObjects)* x0A = &sectorObjects[y / 32][x / 32];
	if (x0A.length == 0) {
		return -1;
	}
	const(MapObject)* sectorObject = &x0A.objects[0];
	for (short i = x0A.length; i != 0; sectorObject++, i--) {
		if (sectorObject.unknown1 != (x % 32)) {
			continue;
		}
		if (sectorObject.unknown0 != (y % 32)) {
			continue;
		}
		mapObjectFound = sectorObject.doorPtr;
		mapObjectFoundType = sectorObject.type;
		return sectorObject.type;
	}
	return -1;
}

/// $C07526
bool unknownC07526(short x, short y) {
	version(noUndefinedBehaviour) {
		bool result = true;
	} else {
		bool result = void;
	}
	switch (getMapObjectAt(x, y)) {
		case ObjectType.switch_:
			interactMapSwitch(mapObjectFound.mapSwitch);
			result = false;
			break;
		case ObjectType.ropeLadder:
			interactRopeLadder(mapObjectFound.direction);
			result = true;
			break;
		case ObjectType.door:
			interactDoor(mapObjectFound.door);
			result = false;
			break;
		case ObjectType.escalator:
			interactEscalator(mapObjectFound.direction, x, y);
			result = false;
			break;
		case ObjectType.stairway:
			interactStairs(mapObjectFound.direction, x, y);
			result = true;
			break;
		case ObjectType.object:
		case ObjectType.type7:
			interactObject(mapObjectFound.object);
			result = false;
			break;
		case ObjectType.person:
			interactMapNPC(mapObjectFound.object);
			result = false;
			break;
		default: break;
	}
	return result;
}

/** Processes a single queued interaction, such as displaying text or using a door
 * Original_Address: $(DOLLAR)C075DD
 */
void processQueuedInteraction() {
	QueuedInteractionPtr ptr = queuedInteractions[currentQueuedInteraction].ptr;
	currentQueuedInteractionType = queuedInteractions[currentQueuedInteraction].type;
	currentQueuedInteraction = (currentQueuedInteraction + 1) & 3;
	playerIntangibilityFrames &= 0xFFFE;
	playerIntangibilityFlash();
	tracef("Processing interaction of type %s", currentQueuedInteractionType);
	switch(currentQueuedInteractionType) {
		case InteractionType.unknown2:
			doorTransition(ptr.doorPtr);
			break;
		case InteractionType.textSurvivesDoorTransition:
			displayInteractionText(ptr.textPtr);
			if (ptr.textPtr == getTextBlock("MSG_SYS_PAPA_2H")) {
				dadPhoneTimer = 0x697;
				dadPhoneQueued = 0;
			}
			break;
		case InteractionType.mapSwitch:
		case InteractionType.unknown8:
		case InteractionType.unknown9:
			displayInteractionText(ptr.textPtr);
			break;
		default: break;
	}
	pendingInteractions = (currentQueuedInteraction != nextQueuedInteraction) ? 1 : 0;
	currentQueuedInteractionType = -1;
}

/** Restores party speed to normal
 * Original_Address: $(DOLLAR)C0769C
 */
void restorePartySpeed() {
	gameState.partyStatus = PartyStatus.normal;
	// restore animation rate for party members
	for (short i = 24; i <= 29; i++) {
		entityScriptVar3Table[i] = 8;
	}
}

/** Adds a temporary speed boost, unless the party already has one
 * Params:
 * 	duration = Number of frames the boost should last
 * Original_Address: $(DOLLAR)C076C8
 */
void boostPartySpeed(short duration) {
	if (gameState.partyStatus == PartyStatus.speedBoost) {
		return;
	}
	gameState.partyStatus = PartyStatus.speedBoost;
	// update animation rate for party members
	for (short i = 24; i <= 29; i++) {
		entityScriptVar3Table[i] = 5;
	}
	scheduleOverworldTask(duration, &restorePartySpeed);
}

/** Creates a mini ghost entity. Does nothing during cutscenes.
 * Original_Address: $(DOLLAR)C07716
 */
void createMiniGhostEntity() {
	if ((entityCallbackFlags[gameState.firstPartyMemberEntity] & (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled)) != 0) {
		return;
	}
	if ((entitySpriteMapFlags[gameState.firstPartyMemberEntity] & SpriteMapFlags.drawDisabled) != 0) {
		return;
	}
	if (gameState.cameraMode == CameraMode.followEntity) {
		return;
	}
	miniGhostEntityID = createOverworldEntity(OverworldSprite.miniGhost, ActionScript.unknown786, -1, 0, 0);
	entityAnimationFrames[miniGhostEntityID] = -1;
	entityScreenYTable[miniGhostEntityID] = -256;
	entityAbsYTable[miniGhostEntityID] = -256;
	entityAbsXTable[miniGhostEntityID] = -256;
}

/** Deletes a previously-spawned mini ghost entity
 * Original_Address: $(DOLLAR)C0777A
 */
void deleteMiniGhostEntity() {
	deleteOverworldEntity(miniGhostEntityID);
	miniGhostEntityID = -1;
}

/// $C0778A
void updateMiniGhostPosition() {
	if ((entityCallbackFlags[gameState.firstPartyMemberEntity] & (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled)) != 0) {
		entityAnimationFrames[currentEntitySlot] = -1;
		return;
	}
	auto x0E = unknownC41FFF(miniGhostAngle, 0x3000);
	entityAbsXTable[currentEntitySlot] = cast(short)(gameState.leaderX.integer + (x0E.x >> 8));
	entityAbsYTable[currentEntitySlot] = cast(short)(gameState.leaderY.integer - 8 + (x0E.y >> 10));
	miniGhostAngle += 0x300;
	entityAnimationFrames[currentEntitySlot] = 0;
}

/// $C0780F
short unknownC0780F(short characterID, short walkingStyle, PartyCharacter* character) {
	short y = 0;
	if ((characterID == 0) && (disabledTransitions == 0) && (pajamaFlag != 0)) {
		return OverworldSprite.nessInPajamas;
	}
	if (movingPartyMemberEntityID != -1) {
		entityOverlayFlags[movingPartyMemberEntityID] = EntityOverlayFlags.none;
	}
	if (gameState.partyStatus == PartyStatus.burnt) {
		if (gameState.specialGameState != SpecialGameState.useMiniSprites) {
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
			if (gameState.specialGameState != SpecialGameState.useMiniSprites) {
				return 0xC;
			}
			return 0x24;
		case Status0.nauseous:
			if (movingPartyMemberEntityID != -1) {
				entityOverlayFlags[movingPartyMemberEntityID] |= EntityOverlayFlags.sweating;
			}
			break;
		default: break;
	}
	switch (character.afflictions[1]) {
		case Status1.mushroomized:
			if (movingPartyMemberEntityID != -1) {
				entityOverlayFlags[movingPartyMemberEntityID] |= EntityOverlayFlags.mushroom;
			}
			break;
		case Status1.possessed:
			possessedPlayerCount++;
			break;
		default: break;
	}
	if (gameState.specialGameState == SpecialGameState.onBicycle) {
			return 7;
	} else if (gameState.specialGameState == SpecialGameState.useMagicantSprites) {
		if (character.characterID == 0) {
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
	if (gameState.specialGameState == SpecialGameState.useMiniSprites) {
		y += 4;
		entityOverlayFlags[movingPartyMemberEntityID] = EntityOverlayFlags.none;
	} else if ((gameState.specialGameState == SpecialGameState.useRobotSprites) && (y == 0)) {
		y += 6;
	}
	if (gameState.partyStatus == PartyStatus.speedBoost) {
		entityScriptVar3Table[movingPartyMemberEntityID] = 5;
	} else if (character.afflictions[0] == Status0.unconscious) {
		entityScriptVar3Table[movingPartyMemberEntityID] = 16;
	} else if ((entitySurfaceFlags[movingPartyMemberEntityID] & 0xC) == 0xC) {
		entityScriptVar3Table[movingPartyMemberEntityID] = 24;
	} else if ((entitySurfaceFlags[movingPartyMemberEntityID] & 8) == 8) {
		entityScriptVar3Table[movingPartyMemberEntityID] = 16;
	} else {
		entityScriptVar3Table[movingPartyMemberEntityID] = 8;
	}
	if (character.afflictions[0] == Status0.paralyzed) {
		entityScriptVar3Table[movingPartyMemberEntityID] = 56;
	}
	return partyCharacterGraphicsTable[characterID][y];
}

/// $C079EC
short getCreditsPhotographPartySprite(short arg1) {
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
	entityOverlayFlags[arg1] |= EntityOverlayFlags.mushroom;
}

/// $C07A56
void doPartyMovementFrame(short characterID, short walkingStyle, short entityID) {
	const short x04 = entityID;
	short x02 = walkingStyle;
	const short x16 = walkingStyle;
	const short x14 = characterID;
	movingPartyMemberEntityID = x04;
	short x12 = unknownC0780F(x14, x02, currentPartyMemberTick);
	if (x12 == -1) {
		entityAnimationFrames[x04] = x12;
	} else {
		auto x0E = spriteGroups[x12];
		entityGraphicsPointers[x04] = &x0E.sprites[0];
		//UNKNOWN_30X2_TABLE_31[x04] = x0E.spriteBank;
		entityWalkingStyles[x04] = x02;
		if (walkingStyle != currentPartyMemberTick.unknown55) {
			currentPartyMemberTick.unknown55 = x16;
			entityScriptVar7Table[x04] |= PartyMemberMovementFlags.unknown15;
		}
		if ((gameState.leaderHasMoved != 0) && (x16 != 0xC)) {
			entityScriptVar7Table[x04] &= ~(PartyMemberMovementFlags.unknown15 | PartyMemberMovementFlags.unknown14 | PartyMemberMovementFlags.unknown13);
		} else {
			entityScriptVar7Table[x04] |= (PartyMemberMovementFlags.unknown14 | PartyMemberMovementFlags.unknown13);
		}
	}
	if (gameState.cameraMode == CameraMode.followEntity) {
		entityScriptVar7Table[x04] |= PartyMemberMovementFlags.unknown12;
	}
}

/// $C07B52
void unknownC07B52() {
	ushort x14 = partyCharacters[0].positionIndex;
	for (ushort x12 = 0x18; x12 < 0x1E; x12++) {
		ushort x04 = x12;
		ushort x10 = x12;
		if (entityScriptTable[x04] != -1) {
			entityCallbackFlags[x04] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
			currentPartyMemberTick = &partyCharacters[entityScriptVar1Table[x04]];
			if ((gameState.firstPartyMemberEntity == x12) || (currentPartyMemberTick.positionIndex == x14)) {
				doPartyMovementFrame(entityScriptVar0Table[x12], gameState.walkingStyle, x12);
				entityAbsXTable[x12] = gameState.leaderX.integer;
				entityAbsYTable[x12] = gameState.leaderY.integer;
				if (gameState.partyCount != 1) {
					entityDirections[x12] = gameState.leaderDirection;
				}
			} else {
				doPartyMovementFrame(entityScriptVar0Table[x12], playerPositionBuffer[currentPartyMemberTick.positionIndex].walkingStyle, x12);
				entityAbsXTable[x10] = playerPositionBuffer[currentPartyMemberTick.positionIndex].xCoord;
				entityAbsYTable[x10] = playerPositionBuffer[currentPartyMemberTick.positionIndex].yCoord;
				entityDirections[x10] = playerPositionBuffer[currentPartyMemberTick.positionIndex].direction;
			}
			entityScreenXTable[x12] = cast(short)(entityAbsXTable[x12] - bg1XPosition);
			entityScreenYTable[x12] = cast(short)(entityAbsYTable[x12] - bg1YPosition);
			updateEntitySpriteFrame(x12);
		}
	}
}

/** Do a single frame of intangibility flashing
 * Original_Address: $(DOLLAR)C07C5B
 */
void playerIntangibilityFlash() {
	if (playerIntangibilityFrames == 0) {
		return;
	}
	for (short i = 0x18; i < 0x1E; i++) {
		entitySpriteMapFlags[i] &= ~SpriteMapFlags.drawDisabled;
	}
}

/** SNES entry point. Prepare hardware for running C code.
 * Original_Address: $(DOLLAR)C08000
 */
void start() {
	dmaQueueIndex = 0;

	INIDISP = 0x80;
	mirrorINIDISP = 0x80;

	// clearing the heap would happen here

	currentHeapAddress = &heap[0][0];
	heapBaseAddress = &heap[0][0];
	spriteRenderDebugPriority = -1;
	randA = 0x1234;
	randB = 0x5678;
	nextFrameBufferID = 1;
	irqCallback = &defaultIRQCallback;
	renderFirstFrame();
	gameInit();
}

/** Interrupt handler routine. Runs exactly once every frame, syncing buffered registers to hardware, resetting the heap and starting queued DMA requests.
 * Original_Address: $(DOLLAR)C0814F
 */
void irqNMICommon() {
	// a read from RDNMI is required on real hardware during NMI, apparently
	//ubyte __unused = RDNMI;
	HDMAEN = 0;
	INIDISP = 0x80;
	newFrameStarted++;
	frameCounter++;
	if (nextFrameDisplayID != 0) {
		handleOAMDMA(0, 4, ((nextFrameDisplayID - 1) != 0) ? (&oam2) : (&oam1), 0x220, 0);
		dmaBytesCopied += 0x220;
	}
	if (paletteUploadMode != PaletteUpload.none) {
		// In the original game's source code, we would only DMA part of
		// the palette to save cycles. With the power of modern computers,
		// we can afford to copy 512 bytes always instead of only 256.
		paletteUploadMode = PaletteUpload.none;
		handleCGRAMDMA(0, 0x22, &palettes, 0x200, 0);
		dmaBytesCopied += 0x0200;
	}
	if ((fadeParameters.step != 0) && (--fadeDelayFramesLeft < 0)) {
		fadeDelayFramesLeft = fadeParameters.delay;
		ubyte a = cast(byte)((mirrorINIDISP & 0xF) + fadeParameters.step);
		if ((a & 0x80) != 0) { // underflowed
			mirrorHDMAEN = 0;
			a = 0x80;
		} else {
			if (a < 16) {
				goto Unknown6;
			}
			// overflowed
			a = 15;
		}
		fadeParameters.step = 0;
		Unknown6:
		mirrorINIDISP = a;
	}
	INIDISP = mirrorINIDISP;
	MOSAIC = mirrorMOSAIC;
	BG12NBA = mirrorBG12NBA;
	// mirrorWH2 is loaded into Y for no reason here... and then immediately
	// replaced with a constant which is written to WH2/3.
	// This has the effect of disabling the 2nd window.
	WH2 = 0xFF;
	WH3 = 0x00;
	for (short i = lastCompletedDMAIndex; i != dmaQueueIndex; i++) {
		handleVRAMDMA(dmaTable[dmaQueue[i].mode].dmap, dmaTable[dmaQueue[i].mode].bbad, dmaQueue[i].source, dmaQueue[i].size, dmaQueue[i].destination, dmaTable[dmaQueue[i].mode].vmain);
	}
	lastCompletedDMAIndex = dmaQueueIndex;
	if (nextFrameDisplayID != 0) {
		if (nextFrameDisplayID - 1 == 0) {
			setBGOffsetX(1, bg1XPositionBuffer[0]);
			setBGOffsetY(1, bg1YPositionBuffer[0]);
			setBGOffsetX(2, bg2XPositionBuffer[0]);
			setBGOffsetY(2, bg2YPositionBuffer[0]);
			setBGOffsetX(3, bg3XPositionBuffer[0]);
			setBGOffsetY(3, bg3YPositionBuffer[0]);
			setBGOffsetX(4, bg4XPositionBuffer[0]);
			setBGOffsetY(4, bg4YPositionBuffer[0]);
		} else {
			setBGOffsetX(1, bg1XPositionBuffer[1]);
			setBGOffsetY(1, bg1YPositionBuffer[1]);
			setBGOffsetX(2, bg2XPositionBuffer[1]);
			setBGOffsetY(2, bg2YPositionBuffer[1]);
			setBGOffsetX(3, bg3XPositionBuffer[1]);
			setBGOffsetY(3, bg3YPositionBuffer[1]);
			setBGOffsetX(4, bg4XPositionBuffer[1]);
			setBGOffsetY(4, bg4YPositionBuffer[1]);
			evenBG1XPosition = bg1XPosition;
			evenBG1YPosition = bg1YPosition;
		}
	}
	nextFrameDisplayID = 0;
	if ((mirrorINIDISP & 0x80) == 0) {
		TM = mirrorTM;
		TD = mirrorTD;
		HDMAEN = mirrorHDMAEN;
		handleHDMA();
	}
	dmaBytesCopied = 0;
	if (inIRQCallback == 0) {
		inIRQCallback = 1;
		executeIRQCallback();
		inIRQCallback = 0;
	}

	if (heapBaseAddress == &heap[0]) {
		heapBaseAddress = &heap[1][0];
		currentHeapAddress = &heap[1][0];
	} else {
		heapBaseAddress = &heap[0][0];
		currentHeapAddress = &heap[0][0];
	}

	dmaTransferFlag = 0;
	unread7E00AB = 0;
	timer++;
}

/** Stops recording a game demo
 * Original_Address: $(DOLLAR)C083B8
 */
void demoRecordingEnd() {
	demoRecordingFlags = 0;
}

/** Starts recording a game demo to the specified buffer
 * Params:
 * 	buffer = The buffer that will hold the completed demo
 * Original_Address: $(DOLLAR)C083C1
 */
void demoRecordingStart(DemoEntry* buffer) {
	demoWriteDestination = buffer;
	demoLastInput = padState[0];
	demoSameInputFrames = 1;
	demoRecordingFlags |= DemoRecordingFlags.recordingEnabled;
}

/// $C083E3
void demoReplayStart(DemoEntry* arg1) {
	if ((demoRecordingFlags & DemoRecordingFlags.playbackEnabled) != 0) {
		return;
	}
	if (arg1.frames == 0) {
		demoRecordingEnd();
	}
	demoFramesLeft = arg1.frames;
	demoInitialPadState = arg1.padState;
	demoReadSource = arg1;
	padRaw[0] = arg1.padState;
	padRaw[1] = arg1.padState;
	demoRecordingFlags |= DemoRecordingFlags.playbackEnabled;
}

/// $C0841B
short testSRAMSize() {
	//original code tested how large SRAM was by writing to areas beyond retail SRAM and comparing to a value guaranteed to be in SRAM
	//if SRAM is retail-sized, these areas would just be mirrors of the existing SRAM
	return lastSRAMBank;
}

/// $C0841B
void readJoypad() {
	if (demoRecordingFlags == 0) {
		goto l1;
	}
	if ((demoRecordingFlags & DemoRecordingFlags.playbackEnabled) == 0) {
		goto l1;
	}
	if (--demoFramesLeft != 0) {
		return;
	}
	demoReadSource++;
	if (demoReadSource[0].frames == 0) {
		goto l0;
	}
	demoFramesLeft = demoReadSource[0].frames;
	padRaw[0] = demoReadSource[0].padState;
	padRaw[1] = demoReadSource[0].padState;
	return;

	l0:
	demoRecordingFlags &= ~DemoRecordingFlags.playbackEnabled;

	l1:
	padRaw[1] = getControllerState(1);
	padRaw[0] = getControllerState(0);
}

/** Records a frame of input if a demo is actively being recorded. Be aware that this combines both pad 1 and pad 2's input into a single pad state.
 * Original_Address: $(DOLLAR)C08456
 */
void demoRecordButtons() {
	if ((demoRecordingFlags & DemoRecordingFlags.recordingEnabled) == 0) {
		return;
	}
	if ((padRaw[0] | padRaw[1]) == demoLastInput) {
		demoSameInputFrames++;
		if (demoSameInputFrames != 0xFF) {
			return;
		}
	}
	demoWriteDestination.frames = cast(ubyte)demoSameInputFrames;
	demoWriteDestination.padState = demoLastInput;
	demoWriteDestination++;
	demoLastInput = padRaw[0] | padRaw[1];
	demoSameInputFrames = 0;
	demoSameInputFrames++;
	demoWriteDestination.frames = 0;
	if (demoWriteDestination !is null) { //not sure about this... but what is BPL on a pointer supposed to mean?
		return;
	}
	demoRecordingFlags &= ~DemoRecordingFlags.recordingEnabled;
}

/** Updates the pad* variables with gamepad input. Unless debugging is enabled, pad 2's state is a copy of pad 1's. Also records a frame of demo input, if active.
 *
 * padPress bits are set when a button was pressed this frame but not the last.
 * padState bits are set when the button was down this frame, regardless of previous frames.
 * padHeld bits are set when the buttons have been held down for at least 20 frames, as well as the first frame when the pad state changes
 * Original_Address: $(DOLLAR)C08496
 */
void updatePadState() {
	while ((HVBJOY & 1) == 1) {}
	readJoypad();
	demoRecordButtons();

	short x = 1;
	while (x >= 0) {
		version(configurable) {
			padTemp = padRaw[x];
		} else {
			padTemp = padRaw[x] & 0xFFF0; //mask off the nonexistent buttons
		}

		padPress[x] = (padState[x] ^ 0xFFFF) & padTemp;

		bool eq = (padTemp == padState[x]);
		padState[x] = padTemp;

		if (!eq) {
			padHeld[x] = padPress[x];
			padTimer[x] = 20;
		} else {
			if (padTimer[x] != 0) {
				padTimer[x]--;
				padHeld[x] = 0;
			} else {
				padHeld[x] = padState[x];
				padTimer[x] = 3;
			}
		}

		x--;
	}

	if (debugging == 0) {
		padState[0] |= padState[1];
		padHeld[0] |= padHeld[1];
		padPress[0] |= padPress[1];
	}
	if (padPress[0] != 0) {
		playerHasDoneSomethingThisFrame++;
	}
}

/** Executes the IRQ callback for the interrupt handler. Has its own function due to function pointers being awkward in 65816 assembly.
 * Original_Address: $(DOLLAR)C08518
 */
void executeIRQCallback() {
	irqCallback();
}

/** The default callback called every frame by the interrupt handler. Does nothing.
 * Original_Address: $(DOLLAR)C0851B
 */
void defaultIRQCallback() {}

/** Sets an IRQ callback to be run each frame during the interrupt handler. Make sure this function executes quickly, otherwise you won't have much CPU time per frame.
 * Original_Address: $(DOLLAR)C0851C
 */
void setIRQCallback(void function() arg1) {
	irqCallback = arg1;
}

/** Clears the IRQ callback by setting it to the default no-op function.
 * Original_Address: $(DOLLAR)C08522
 */
void resetIRQCallback() {
	irqCallback = &defaultIRQCallback;
}

/** Signals to the interrupt handler that a palette upload is meant to happen next frame.
 * Original_Address: $(DOLLAR)C0856B
 */
void preparePaletteUpload(PaletteUpload mode) {
	paletteUploadMode = cast(ubyte)mode;
}

/** Immediately copy data to VRAM in 4608-byte chunks, presumably to avoid lag frames.
 *
 * This call blocks until any outstanding queued DMAs are complete and the specified data is fully transferred.
 * Params:
 * 	mode = DMA mode, as defined by dmaTable
 * 	count = Total number of bytes to transfer
 * 	address = The word-based VRAM address to transfer data to (not byte-based!)
 * 	data = The data to transfer
 * Original_Address: $(DOLLAR)C085B7
 */
void copyToVRAMChunked(ubyte mode, ushort count, ushort address, const(ubyte)* data) {
	dmaCopyMode = mode;
	while (dmaBytesCopied != 0) { waitForInterrupt(); }
	dmaCopyRAMSource = data;
	dmaCopyVRAMDestination = address;
	if (count >= 0x1201) {
		dmaCopySize = 0x1200;
		while (count >= 0x1201) {
			while (dmaBytesCopied != 0) { waitForInterrupt(); }
			copyToVRAMCommon();
			dmaCopyRAMSource += 0x1200;
			dmaCopyVRAMDestination += 0x900;
			count -= 0x1200;
		}
	}
	dmaCopySize = count;
	while (dmaBytesCopied != 0) { waitForInterrupt(); }
	copyToVRAMCommon();
	while (dmaBytesCopied != 0) { waitForInterrupt(); }
}

/** Queues up a DMA transfer to VRAM
 * Params:
 * 	mode = DMA mode, as defined by dmaTable
 * 	count = Number of bytes to transfer
 * 	address = The word-based VRAM address to transfer data to (not byte-based!)
 * 	data = The data to transfer
 * Original_Address: $(DOLLAR)C08616
 */
void copyToVRAM(ubyte mode, ushort count, ushort address, const(ubyte)* data) {
	dmaCopyMode = mode;
	dmaCopySize = count;
	dmaCopyRAMSource = data;
	dmaCopyVRAMDestination = address;
	copyToVRAMCommon();
}

/** Identical to copyToVRAM, but used far pointers split into bank and near addresses.
 * Original_Address: $(DOLLAR)C0862E
 */
void copyToVRAMAlt(ubyte mode, ushort count, ushort address, const(ubyte)* data) {
	copyToVRAM(mode, count, address, data);
}

/** Common code for copyToVRAM and copyToVRAMAlt
 * Original_Address: $(DOLLAR)C08643
 */
void copyToVRAMCommon() {
	queueVRAMDMAInternal();
}

/** Queues up a DMA transfer in 4608-byte chunks, with one sent per frame.
 *
 * If force-blanking is enabled, this will wait until any outstanding transfers are complete before starting a new one. Otherwise, it will queue up a new transfer.
 * When force blanking is disabled, queuing a second transfer with the same mode as an outstanding transfer WILL cancel the existing transfer and start a new one!
 * Original_Address: $(DOLLAR)C0865F
 */
void queueVRAMDMAInternal() {
	debug(printVRAMDMA) tracef("Copying %s bytes to $%04X, mode %s", dmaCopySize, dmaCopyVRAMDestination, dmaCopyMode);
	// if ((mirrorINIDISP & 0x80) != 0) {
	// 	ushort tmp92 = cast(ushort)(dmaCopySize + dmaBytesCopied);
	// 	if (tmp92 >= 0x1201) {
	// 		while (dmaBytesCopied != 0) { waitForInterrupt(); }
	// 		tmp92 = dmaCopySize;
	// 	}
	// 	dmaBytesCopied = tmp92;
	// 	unknown7E00A5 = lastCompletedDMAIndex;
	// 	dmaQueue[dmaQueueIndex].mode = dmaCopyMode;
	// 	dmaQueue[dmaQueueIndex].size = dmaCopySize;
	// 	dmaQueue[dmaQueueIndex].source = dmaCopyRAMSource;
	// 	dmaQueue[dmaQueueIndex].destination = dmaCopyVRAMDestination;
	// 	if (dmaQueueIndex + 1 == unknown7E00A5) {
	// 		while (dmaQueueIndex + 1 == lastCompletedDMAIndex) {}
	// 	}
	// 	dmaQueueIndex++;
	// } else {
		// Since we send a complete image of VRAM to the console every frame, we
		// can just overwrite our local VRAM copy - no need to delay
		handleVRAMDMA(dmaTable[dmaCopyMode / 3].dmap, dmaTable[dmaCopyMode / 3].bbad, dmaCopyRAMSource, dmaCopySize, dmaCopyVRAMDestination, dmaTable[dmaCopyMode / 3].vmain);
		currentHeapAddress = heapBaseAddress;
		dmaTransferFlag = 0;
	// }
}

/** Reserve some memory from the heap
 *
 * Any memory reserved lasts for a maximum of two frames. In case of overflow, wait a frame and allocate from the other heap instead
 * Params:
 * 	bytes = Number of bytes to reserve
 * Original_Address: $(DOLLAR)C086DE
 */
void* sbrk(ushort bytes) {
	while (true) {
		if (bytes + currentHeapAddress - heap[0].length < heapBaseAddress) {
			void* result = currentHeapAddress;
			currentHeapAddress += bytes;
			return result;
		}
		while (newFrameStarted == 0) { waitForInterrupt(); }
		newFrameStarted = 0;
	}
}

/** Ensures hardware is in a state appropriate for VRAM DMA. Blocks for a single frame
 * Original_Address: $(DOLLAR)C08726
 */
void prepareForImmediateDMA() {
	// turn on forced blanking
	mirrorINIDISP = 0x80;
	// clear all ongoing HDMAs
	mirrorHDMAEN = 0;
	// disable fade
	fadeParameters.step = 0;
	// wait for next frame
	newFrameStarted = 0;
	while (newFrameStarted == 0) { waitForInterrupt(); }
	// clear all ongoing HDMAs. again. just to be sure, I guess
	HDMAEN = 0;
}

/** Turns off the display. Blocks for a single frame to guarantee that the display is off before returning.
 * Original_Address: $(DOLLAR)C08744
 */
void setForceBlank() {
	mirrorINIDISP = 0x80;
	newFrameStarted = 0;
	while (newFrameStarted == 0) { waitForInterrupt(); }
}

/** Enables vertical blank interrupts and joypad auto-reading
 * Original_Address: $(DOLLAR)C08715
 */
void enableNMIJoypad() {
	mirrorNMITIMEN |= 0x81;
	NMITIMEN = mirrorNMITIMEN;
}

/** Waits a single frame, with gamepad state updated appropriately
 * Original_Address: $(DOLLAR)C08756
 */
void waitUntilNextFrame() {
	// if ((mirrorNMITIMEN & 0xB0) != 0) {
	// 	while (newFrameStarted == 0) {}
	// 	newFrameStarted = 0;
	// } else {
	// 	while (HVBJOY < 0) {}
	// 	while (HVBJOY >= 0) {}
	// }
	waitForInterrupt();
	newFrameStarted = 0;
	updatePadState();
}

/** Wait at least one frame
 * Original_Address: $(DOLLAR)C0878B
 */
void waitNFrames(ubyte frames) {
	do {
		nextFrameDisplayID++;
		waitUntilNextFrame();
	} while (--frames != 0);
}

/** Configures screen brightness. Can also turn screen black.
 * Params:
 * 	value = Either a value between 0-15 for brightness, or 0x80 to blank the screen
 * Original_Address: $(DOLLAR)C0879D
 */
void setINIDISP(ubyte value) {
	mirrorINIDISP = value & 0x8F;
}

/** Configures the MOSAIC register using the screen's current brightness for the specified layers
 * Params:
 * 	layers = A bitfield denoting the layers that should be mosaic-ified
 * Original_Address:$(DOLLAR)C087AB
 */
void setMOSAICFade(ubyte layers) {
	mirrorMOSAIC = (((mirrorINIDISP ^ 0xFF) << 4) & 0xF0) | layers;
}

/** Performs a fade-in effect with optional mosaic
 * Params:
 * 	step = Number of brightness levels to increase by each frame (useful values are 1 - 15)
 * 	timeBetweenFrames = The number of frames to wait between each step
 * 	mosaicLayers = A bitmask of the layers that should be mosaic-ified (0b0001 - BG1, 0b0010 - BG2, 0b0100 - BG3, 0b1000 - BG4)
 * Original_Address: $(DOLLAR)C087CE
 */
void fadeInWithMosaic(short step, short timeBetweenFrames, short mosaicLayers) {
	// Start with minimum brightness, cancel any existing fades
	fadeParameters.step = 0;
	mirrorINIDISP = 0;
	while(true) {
		// clear MOSAIC just in case
		mirrorMOSAIC = 0;
		// check if any more steps are left
		if (mirrorINIDISP + step >= 0x0F) {
			break;
		}
		// set new brightness level
		setINIDISP(cast(ubyte)(mirrorINIDISP + step));
		// also mosaicify if requested
		if (mosaicLayers != 0) {
			setMOSAICFade(cast(ubyte)mosaicLayers);
		}
		// wait for next step
		waitNFrames(cast(ubyte)timeBetweenFrames);
	}
	// make sure brightness is set to normal at end
	setINIDISP(0xF);
}

/** Performs a fade-out effect with optional mosaic
 * Params:
 * 	step = Number of brightness levels to decrease by each frame (useful values are 1 - 15)
 * 	timeBetweenFrames = The number of frames to wait between each step
 * 	mosaicLayers = A bitmask of the layers that should be mosaic-ified (0b0001 - BG1, 0b0010 - BG2, 0b0100 - BG3, 0b1000 - BG4)
 * Original_Address: $(DOLLAR)C08814
 */
void fadeOutWithMosaic(short step, short timeBetweenFrames, short mosaicLayers) {
	// cancel any existing fades
	fadeParameters.step = 0;
	while (true) {
		// clear MOSAIC just in case
		mirrorMOSAIC = 0;
		// screen is already off entirely, nothing left to do
		if ((mirrorINIDISP & 0x80) != 0) {
			break;
		}
		// check if there are any steps left
		if (mirrorINIDISP - step < 0) {
			break;
		}
		// set new brightness level
		setINIDISP(cast(ubyte)(mirrorINIDISP - step));
		// also mosaicify if requested
		if (mosaicLayers != 0) {
			setMOSAICFade(cast(ubyte)mosaicLayers);
		}
		// wait for next step
		waitNFrames(cast(ubyte)timeBetweenFrames);
	}
	// forced blanking on
	setINIDISP(0x80);

	// force any active HDMAs to stop
	mirrorHDMAEN = 0;
	newFrameStarted = 0;
	while (newFrameStarted == 0) { waitForInterrupt(); }
	HDMAEN = 0;
}

/** Perform an asynchronous fade-in. Useful for performing extra work while the effect occurs
 * Params:
 * 	step = Number of brightness levels to increase by each frame (useful values are 1-15)
 * 	timeBetweenFrames = The number of frames to wait between each step
 * Original_Address: $(DOLLAR)C0886C
 */
void fadeIn(ubyte step, ubyte timeBetweenFrames) {
	fadeParameters.step = step;
	fadeParameters.delay = timeBetweenFrames;
	fadeDelayFramesLeft = timeBetweenFrames;
}

/** Perform an asynchronous fade-out. Useful for performing extra work while the effect occurs
 * Params:
 * 	step = Number of brightness levels to decrease by each frame (useful values are 1-15)
 * 	timeBetweenFrames = The number of frames to wait between each step
 * Original_Address: $(DOLLAR)C0887A
 */
void fadeOut(ubyte step, ubyte timeBetweenFrames) {
	fadeParameters.step = cast(ubyte)((step^0xFF) + 1); // negation
	fadeParameters.delay = timeBetweenFrames;
	fadeDelayFramesLeft = timeBetweenFrames;
}

/** Waits for an asynchronous fade effect to finish. Same as waitForFadeToFinish, but actionscripts aren't executed
 * Original_Address: $(DOLLAR)C0888B
 */
void waitForFadeToFinishNoActionScript() {
	while (true) {
		if (fadeParameters.step == 0) {
			return;
		}
		oamClear();
		updateScreen();
		waitUntilNextFrame();
	}
}

/** Clears the OAM state in preparation for a new frame
 * Original_Address: $(DOLLAR)C088B1
 */
void oamClear() {
	priority0SpriteOffset = 0;
	priority1SpriteOffset = 0;
	priority2SpriteOffset = 0;
	priority3SpriteOffset = 0;
	if (nextFrameBufferID - 1 == 0) {
		oamAddr = &oam1.mainTable[0];
		oamEndAddr = &oam1.mainTable.ptr[128];
		oamHighTableAddr = &oam1.highTable[0];
		oamHighTableBuffer = 0x80;
		for (short i = 0; i < 128; i++) { //original code has this loop unrolled
			oam1.mainTable[i].yCoord = 224;
		}
	} else {
		oamAddr = &oam2.mainTable[0];
		oamEndAddr = &oam2.mainTable.ptr[128];
		oamHighTableAddr = &oam2.highTable[0];
		oamHighTableBuffer = 0x80;
		for (short i = 0; i < 128; i++) { //original code has this loop unrolled
			oam2.mainTable[i].yCoord = 224;
		}
	}
}

/** Sets the bank address for spritemaps (not used on modern systems)
 * Params:
 * 	bank = The upper 8 bits of a 24-bit FAR address, if relevant
 * Returns: The previous spritemap bank address
 * Original_Address: $(DOLLAR)C088A5
 */
ushort setSpritemapBank(ushort bank) {
	ushort old = spritemapBank;
	spritemapBank = bank;
	return old;
}

/** Renders the first frame of the game
 * Original_Address: $(DOLLAR)C08B19
 */
void renderFirstFrame() {
	unread7E0009 = 0;
	oamClear();
	updateScreen();
}

/** Updates the screen state for a new frame. Updates OAM and BG layer positioning
 * Original_Address: $(DOLLAR)C08B26
 */
void updateScreen() {
	// do an OAM update
	renderSpritesToOAM();
	enum DataBankRegister = 0; // no equivalent on modern platforms
	assert(DataBankRegister != 0xFF, "Data bank register invalid");
	ubyte oamHighTableBufferTmp = oamHighTableBuffer;
	if (oamHighTableBufferTmp != 0x80) {
		// Shift right by two until a bit carries out
		// ...or, shift right by two until a bit is in position 2,
		// then do an extra shift after (so the bit in spot 2 shifts out)
		while ((oamHighTableBufferTmp & 2) == 0) {
			oamHighTableBufferTmp >>= 2;
		}
		oamHighTableBufferTmp >>= 2;
	}
	// reset the high table address for the next frame
	*oamHighTableAddr = oamHighTableBufferTmp;
	// set new BG positions
	bg1XPositionBuffer[nextFrameBufferID - 1] = bg1XPosition;
	bg1YPositionBuffer[nextFrameBufferID - 1] = bg1YPosition;
	bg2XPositionBuffer[nextFrameBufferID - 1] = bg2XPosition;
	bg2YPositionBuffer[nextFrameBufferID - 1] = bg2YPosition;
	bg3XPositionBuffer[nextFrameBufferID - 1] = bg3XPosition;
	bg3YPositionBuffer[nextFrameBufferID - 1] = bg3YPosition;
	bg4XPositionBuffer[nextFrameBufferID - 1] = bg4XPosition;
	bg4YPositionBuffer[nextFrameBufferID - 1] = bg4YPosition;
	// prepare for next frame render
	nextFrameDisplayID = nextFrameBufferID;
	nextFrameBufferID ^= 3;
}

/** Renders all sprites to OAM, sorted by priority first and order queued second
 *
 * Set spriteRenderDebugPriority to a priority to have renderSpriteDebug called immediately before that priority is rendered.
 * Original_Address: $(DOLLAR)C08B8E
 */
void renderSpritesToOAM() {
	if (spriteRenderDebugPriority == 0) {
		renderSpriteDebug();
	}
	for (short i = 0; i < priority0SpriteOffset / 2; i++) {
		spritemapBank = priority0SpriteMapBanks[i];
		renderSpriteToOAM(priority0SpriteMaps[i], priority0SpriteX[i], priority0SpriteY[i]);
	}
	if (spriteRenderDebugPriority == 1) {
		renderSpriteDebug();
	}
	for (short i = 0; i < priority1SpriteOffset / 2; i++) {
		spritemapBank = priority1SpriteMapBanks[i];
		renderSpriteToOAM(priority1SpriteMaps[i], priority1SpriteX[i], priority1SpriteY[i]);
	}
	if (spriteRenderDebugPriority == 2) {
		renderSpriteDebug();
	}
	for (short i = 0; i < priority2SpriteOffset / 2; i++) {
		spritemapBank = priority2SpriteMapBanks[i];
		renderSpriteToOAM(priority2SpriteMaps[i], priority2SpriteX[i], priority2SpriteY[i]);
	}
	if (spriteRenderDebugPriority == 3) {
		renderSpriteDebug();
	}
	for (short i = 0; i < priority3SpriteOffset / 2; i++) {
		spritemapBank = priority3SpriteMapBanks[i];
		renderSpriteToOAM(priority3SpriteMaps[i], priority3SpriteX[i], priority3SpriteY[i]);
	}
}

/** Called immediately before the sprite priority specified by spriteRenderDebugPriority. Debugging leftover
 * Original_Address: $(DOLLAR)C08C53
 */
void renderSpriteDebug() {
	//You Get: Nothing
}

/// $C08C58
void drawSprite(const(SpriteMap)* spriteMap, short x, short y)
	in(spriteMap !is null, "Spritemap must not be null")
{
	addPriorityXSpriteFuncs[currentSpriteDrawingPriority](spriteMap, x, y);
}

/// $C08C65
immutable void function(const(SpriteMap)*, short, short)[4] addPriorityXSpriteFuncs = [
	&addPriority0Sprite,
	&addPriority1Sprite,
	&addPriority2Sprite,
	&addPriority3Sprite,
];

/// $C08C6D
void addPriority0Sprite(const(SpriteMap)* spriteMap, short x, short y)
	in(spriteMap !is null, "Trying to add a null spritemap")
{
	priority0SpriteMaps[priority0SpriteOffset / 2] = spriteMap;
	priority0SpriteX[priority0SpriteOffset / 2] = x;
	priority0SpriteY[priority0SpriteOffset / 2] = y;
	priority0SpriteMapBanks[priority0SpriteOffset / 2] = spritemapBank;
	priority0SpriteOffset += 2;
}

/// $C08C87
void addPriority1Sprite(const(SpriteMap)* spriteMap, short x, short y)
	in(spriteMap !is null, "Trying to add a null spritemap")
{
	priority1SpriteMaps[priority1SpriteOffset / 2] = spriteMap;
	priority1SpriteX[priority1SpriteOffset / 2] = x;
	priority1SpriteY[priority1SpriteOffset / 2] = y;
	priority1SpriteMapBanks[priority1SpriteOffset / 2] = spritemapBank;
	priority1SpriteOffset += 2;
}

/// $C08CA1
void addPriority2Sprite(const(SpriteMap)* spriteMap, short x, short y)
	in(spriteMap !is null, "Trying to add a null spritemap")
{
	priority2SpriteMaps[priority2SpriteOffset / 2] = spriteMap;
	priority2SpriteX[priority2SpriteOffset / 2] = x;
	priority2SpriteY[priority2SpriteOffset / 2] = y;
	priority2SpriteMapBanks[priority2SpriteOffset / 2] = spritemapBank;
	priority2SpriteOffset += 2;
}

/// $C08CBB
void addPriority3Sprite(const(SpriteMap)* spriteMap, short x, short y)
	in(spriteMap !is null, "Trying to add a null spritemap")
{
	priority3SpriteMaps[priority3SpriteOffset / 2] = spriteMap;
	priority3SpriteX[priority3SpriteOffset / 2] = x;
	priority3SpriteY[priority3SpriteOffset / 2] = y;
	priority3SpriteMapBanks[priority3SpriteOffset / 2] = spritemapBank;
	priority3SpriteOffset += 2;
}

/// $C08CD5 - Draw a SpriteMap list into the OAM buffer
void renderSpriteToOAM(const(SpriteMap)* arg1, short xbase, short ybase) {
	short xpos;
	short ypos;
	ubyte abyte;
	bool carry;
	const(SpriteMap)* y = arg1;
	OAMEntry* x = oamAddr;
	if (x >= oamEndAddr) {
		return;
	}
	//some DBR manipulation was here
	for(;;y++){
		assert(y, "Null sprite?");
		ypos = cast(byte)y.yOffset;
		if (ypos == 0x80) {
			// This is -1 since we do y++ due to continue
			y = y.nextMap - 1;
			continue;
		}
		ypos += ybase - 1;
		if ((ypos >= 0xE0) || (ypos < -32)) {
			if (y.specialFlags >= 0x80) {
				break;
			}
			continue;
		}
		x.startingTile = y.firstTile;
		x.flags = y.flags;
		xpos = cast(byte)y.xOffset;
		xpos += xbase;
		x.xCoord = cast(byte)xpos;
		if (xpos >= 0x100 || xpos < -0x100) {
			if (y.specialFlags >= 0x80) {
				break;
			}
			continue;
		}
		abyte = cast(ubyte)(xpos>>8);
		ROL(abyte, carry);
		oamHighTableBuffer = ROR(oamHighTableBuffer, carry);
		abyte = y.specialFlags;
		ROR(abyte, carry);
		oamHighTableBuffer = ROR(oamHighTableBuffer, carry);
		if (carry) {
			oamHighTableAddr[0] = oamHighTableBuffer;
			oamHighTableAddr++;
			oamHighTableBuffer = 0x80;
		}
		x.yCoord = cast(ubyte)ypos;
		x++;
		if (y.specialFlags >= 0x80 || x >= oamEndAddr) {
			break;
		}
	}
	oamAddr = x;
}

/// $C08D79
void setBGMODE(ubyte arg1) {
	mirrorBGMODE &= 0xF0;
	mirrorBGMODE |= arg1;
	BGMODE = mirrorBGMODE;
}

/// $C08D92
void setOAMSize(ubyte arg1) {
	mirrorOBSEL = arg1;
	OBSEL = arg1;
}

/// $C08D9E
void setBG1VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	mirrorBG1SC = arg1 & 3;
	mirrorBG1SC |= ((arg2 >> 8) & 0xFC);
	BG1SC = mirrorBG1SC;
	mirrorBG12NBA &= 0xF0;
	bg1XPosition = 0;
	bg1YPosition = 0;
	mirrorBG12NBA |= (arg3 >> 12);
	BG12NBA = mirrorBG12NBA;
}

/// $C08DDE
void setBG2VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	mirrorBG2SC = arg1 & 3;
	mirrorBG2SC |= ((arg2 >> 8) & 0xFC);
	BG2SC = mirrorBG2SC;
	mirrorBG12NBA &= 0xF;
	bg2XPosition = 0;
	bg2YPosition = 0;
	mirrorBG12NBA |= ((arg3 >> 8) & 0xF0);
	BG12NBA = mirrorBG12NBA;
}

/// $C08E1C
void setBG3VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	mirrorBG3SC = arg1 & 3;
	mirrorBG3SC |= ((arg2 >> 8) & 0xFC);
	BG3SC = mirrorBG3SC;
	mirrorBG34NBA &= 0xF0;
	bg3XPosition = 0;
	bg3YPosition = 0;
	mirrorBG34NBA |= (arg3 >> 12);
	BG34NBA = mirrorBG34NBA;
}

/// $C08E5C
void setBG4VRAMLocation(ubyte arg1, ushort arg2, ushort arg3) {
	mirrorBG4SC = arg1 & 3;
	mirrorBG4SC |= ((arg2 >> 8) & 0xFC);
	BG4SC = mirrorBG4SC;
	mirrorBG34NBA &= 0xF;
	bg4XPosition = 0;
	bg4YPosition = 0;
	mirrorBG34NBA |= ((arg3 >> 8) & 0xF0);
	BG34NBA = mirrorBG34NBA;
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
	while (lastCompletedDMAIndex != a) { waitForInterrupt(); }
}

/// $C08F98
immutable UnknownC08F98Entry[4] unknownC08F98 = [
	UnknownC08F98Entry(0xFE80, 0x0100, 0x0200, 0x0000),
	UnknownC08F98Entry(0x0000, 0x0100, 0x0300, 0x0080),
	UnknownC08F98Entry(0x0000, 0x0200, 0x0200, 0x0000)
];

/// $C08FB0
immutable DMATableEntry[18] dmaTable = [
	DMATableEntry(0x01, 0x18, 0x80), /// A -> B
	DMATableEntry(0x09, 0x18, 0x80), /// A -> B
	DMATableEntry(0x00, 0x18, 0x00), /// A -> B
	DMATableEntry(0x08, 0x18, 0x00), /// A -> B
	DMATableEntry(0x00, 0x19, 0x80), /// A -> B
	DMATableEntry(0x08, 0x19, 0x80), /// A -> B
	DMATableEntry(0x81, 0x39, 0x80), /// B -> A
	DMATableEntry(0x80, 0x39, 0x00), /// B -> A
	DMATableEntry(0x80, 0x3A, 0x80), /// B -> A
	DMATableEntry(0x01, 0x18, 0x81), /// A -> B
	DMATableEntry(0x09, 0x18, 0x81), /// A -> B
	DMATableEntry(0x00, 0x18, 0x01), /// A -> B
	DMATableEntry(0x08, 0x18, 0x01), /// A -> B
	DMATableEntry(0x00, 0x19, 0x81), /// A -> B
	DMATableEntry(0x08, 0x19, 0x81), /// A -> B
	DMATableEntry(0x81, 0x39, 0x81), /// B -> A
	DMATableEntry(0x80, 0x39, 0x01), /// B -> A
	DMATableEntry(0x80, 0x3A, 0x81), /// B -> A
];

/// $C08FE6 - unused. these bytes happen to correspond to XBA / TYA opcodes, however
immutable ubyte[2] unknownC08FE6 = [ 0xEB, 0x98 ];

/** Resets entity subsystem state for a fresh start
 * Original_Address: $(DOLLAR)C0927C
 */
void initializeEntitySubsystem() {
	actionScriptDrawCallback = &actionScriptDrawEntities;
	firstEntity = -1;
	entityNextEntityTable[29] = -1;
	entityScriptNextScripts[69] = -1;
	lastEntity = 0;
	lastAllocatedScript = 0;
	short x = 56;
	do {
		entityNextEntityTable[x / 2] = cast(short)(x + 2);
		x -= 2;
	} while (x >= 0);

	x = 136;
	do {
		entityScriptNextScripts[x / 2] = cast(short)(x + 2);
		x -= 2;
	} while (x >= 0);

	x = 58;
	do {
		entityScriptTable[x / 2] = -1;
		x -= 2;
	} while (x >= 0);

	x = 58;
	do {
		entitySpriteMapFlags[x / 2] = 0;
		entityTickCallbacks[x / 2] = null;
		entityCallbackFlags[x / 2] = 0;
		x -= 2;
	} while (x >= 0);

	x = 6;
	do {
		entityBGHorizontalOffsetHigh[x / 2] = 0;
		entityBGVerticalOffsetHigh[x / 2] = 0;
		entityBGHorizontalVelocityLow[x / 2] = 0;
		entityBGHorizontalVelocityHigh[x / 2] = 0;
		entityBGVerticalVelocityLow[x / 2] = 0;
		entityBGVerticalVelocityHigh[x / 2] = 0;
		entityBGHorizontalOffsetLow[x / 2] = 0;
		entityBGVerticalOffsetLow[x / 2] = 0;
		entityDrawPriority[x / 2] = 0;
		x -= 2;
	} while (x >= 0);
	clearEntityDrawSortingTable();
	disableActionscript = 0;
}

/// $C09279
void unknownC09279() {
	assert(0, "Not used");
}

/// $C092F5
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

/// $C09321
short initEntity(short actionScript, short x, short y) {
	entityAllocationMinSlot *= 2;
	entityAllocationMaxSlot *= 2;
	bool allocationFailed;
	short newEntity = allocateEntity(allocationFailed);
	if (allocationFailed) {
		return 0;
	}
	tracef("Initializing entity slot %s with %s at %s,%s", newEntity / 2, cast(ActionScript)actionScript, x, y);
	bool __ignored;
	short newScript = allocateScript(__ignored);
	entityScriptIndexTable[newEntity / 2] = newScript;
	entityScriptNextScripts[newScript / 2] = -1;
	entityMoveCallbacks[newEntity / 2] = &updateActiveEntityPosition2D;
	entityScreenPositionCallbacks[newEntity / 2] = &updateScreenPositionBG12D;
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
	newEntity = appendActiveEntity(newEntity);
	//Unreachable code?
	/+
	unknownC09C99();
	short newScript2 = allocateScript(__ignored);
	entityScriptIndexTable[newEntity / 2] = newScript2;
	entityScriptNextScripts[newScript2 / 2] = -1;
	+/
	entityScriptTable[newEntity / 2] = actionScript;
	entityAnimationFrames[newEntity / 2] = -1;
	entityDeltaXFractionTable[newEntity / 2] = 0;
	entityDeltaXTable[newEntity / 2] = 0;
	entityDeltaYFractionTable[newEntity / 2] = 0;
	entityDeltaYTable[newEntity / 2] = 0;
	entityDeltaZFractionTable[newEntity / 2] = 0;
	entityDeltaZTable[newEntity / 2] = 0;
	return unknownC092F5Unknown4(&actionScriptScriptPointers[actionScript][0], newEntity);
}

short setEntityActionScript(const(ubyte)* pc, short entityID) {
	return setEntityActionScriptByOffset(pc, cast(short)(entityID * 2));
}
short setEntityActionScriptByOffset(const(ubyte)* pc, short entityIndex) {
	assert (entityScriptTable[entityIndex / 2] >= 0);
	entityIndex = unknownC09C99(entityIndex);
	bool __ignored;
	short newScript = allocateScript(__ignored);
	entityScriptIndexTable[entityIndex / 2] = newScript;
	entityScriptNextScripts[newScript / 2] = -1;
	return unknownC092F5Unknown4(pc, entityIndex);
}

short unknownC092F5Unknown4(const(ubyte)* pc, short entityIndex) {
	clearEntityTickCallback(entityIndex);
	entityProgramCounters[entityScriptIndexTable[entityIndex / 2] / 2] = pc;
	entityScriptSleepFrames[entityScriptIndexTable[entityIndex / 2] / 2] = 0;
	entityScriptStackPosition[entityScriptIndexTable[entityIndex / 2] / 2] = 0;
	return entityIndex / 2;
}
//actually part of the previous function normally, but whatever
void movementNOP() {
	//nothin
}

/// $C0943C
void freezeEntities() {
	if (firstEntity < 0) {
		return;
	}
	auto x = firstEntity;
	do {
		entityCallbackFlags[x / 2] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
		x = entityNextEntityTable[x / 2];
	} while(x >= 0);
}

/// $C09451
void unfreezeEntities() {
	short x = firstEntity;
	while (x >= 0) {
		entityCallbackFlags[x / 2] &= 0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
		x = entityNextEntityTable[x / 2];
	}
}

/// $C09466
void runActionscriptFrame() {
	version(extra) {
		if (breakActionscript) {
			actionScriptDrawCallback();
			return;
		}
	}
	if (disableActionscript != 0) {
		return;
	}
	// jump to slowrom goes here

	// make sure that if we somehow end up calling this function recursively
	// that we don't end up running scripts again
	disableActionscript = 1;
	if (firstEntity < 0) {
		disableActionscript = 0;
		return;
	}
	actionScriptScriptOffset = 0;
	unread86 = 0;
	short x = firstEntity;
	do {
		currentActiveEntityOffset = x;
		currentEntityOffset = x;
		currentEntitySlot = x;
		currentEntitySlot /= 2;
		nextActiveEntity = entityNextEntityTable[currentEntitySlot];
		runEntityScripts(nextActiveEntity,x);
	} while ((x = nextActiveEntity) >= 0);
	if (firstEntity < 0) {
		disableActionscript = 0;
		return;
	}
	x = firstEntity;
	do {
		currentEntitySlot = x;
		currentEntitySlot /= 2;
		currentActiveEntityOffset = x;
		if ((entityCallbackFlags[currentEntitySlot] & EntityCallbackFlags.moveDisabled) == 0) {
			entityMoveCallbacks[currentEntitySlot]();
		}
		entityScreenPositionCallbacks[currentEntitySlot]();
		x = entityNextEntityTable[currentActiveEntityOffset / 2];
	} while(x >= 0);
	actionScriptDrawCallback();
	disableActionscript = 0;
}

/// $C09466
void runEntityScripts(short a, short x) {
	if ((entityCallbackFlags[x / 2] & EntityCallbackFlags.moveDisabled) == 0) {
		short y = entityScriptIndexTable[x / 2];
		do {
			currentEntityScriptOffset = y;
			currentScriptOffset = y;
			currentScriptSlot = y / 2;
			actionScriptCurrentScript = entityScriptNextScripts[y / 2];
			runEntityScript();
			y = actionScriptCurrentScript;
		} while (y > 0);
		x = currentActiveEntityOffset;
	}
	if ((entityCallbackFlags[x / 2] & EntityCallbackFlags.tickDisabled) == 0) {
		currentEntityTickCallback = entityTickCallbacks[x / 2];
		callEntityTickCallback();
	}
}

/// $C09506
void runEntityScript() {
	if (entityScriptSleepFrames[currentEntityScriptOffset / 2] != 0) {
		entityScriptSleepFrames[currentEntityScriptOffset / 2]--;
		return;
	}
	const(ubyte)* ystart, y = entityProgramCounters[currentEntityScriptOffset / 2];
	//ActionScript82 = EntityProgramCounterBanks[currentEntityScriptOffset / 2];
	actionScriptStack = &entityScriptStacks[currentEntityScriptOffset / 2][0];
	do {
		ystart = y;
		ubyte a = (y++)[actionScriptScriptOffset];
		debug(actionscript) printActionscriptCommand(currentEntitySlot, ystart);
		if (a < 0x70) {
			y = movementControlCodesPointerTable[a](y);
		} else {
			actionScriptVar90 = a;
			entityScriptSleepFrames[currentEntityScriptOffset / 2] = a & 0xF;
			y = movementControlCodesPointerTable[0x45 + ((actionScriptVar90 & 0x70) >> 4)](y);
		}
		version(extra) {
			if (entityExtra[currentEntitySlot].breakpoint) {
				breakActionscript = 1;
				entityProgramCounters[currentEntityScriptOffset / 2] = y;
				// don't decrease sleep frames here, might cause underflow
				return;
			}
		}
	} while (entityScriptSleepFrames[currentEntityScriptOffset / 2] == 0);
	entityProgramCounters[currentEntityScriptOffset / 2] = y;
	//EntityProgramCounterBanks[currentEntityScriptOffset / 2] = ActionScript82;
	entityScriptSleepFrames[currentEntityScriptOffset / 2]--;
}

/** ActionScript command function pointers
 * Original_Address: $(DOLLAR)C09558
 */
immutable const(ubyte)* function(const(ubyte)*)[77] movementControlCodesPointerTable = [
	&actionScriptCommand00,
	&actionScriptCommand01,
	&actionScriptCommand02,
	&actionScriptCommand03,
	&actionScriptCommand04,
	&actionScriptCommand05,
	&actionScriptCommand06,
	&actionScriptCommand07,
	&actionScriptCommand08,
	&actionScriptCommand09,
	&actionScriptCommand0A,
	&actionScriptCommand0B,
	&actionScriptCommand0C,
	&actionScriptCommand0D,
	&actionScriptCommand0E,
	&actionScriptCommand0F,
	&actionScriptCommand10,
	&actionScriptCommand11,
	&actionScriptCommand12,
	&actionScriptCommand13,
	&actionScriptCommand14,
	&actionScriptCommand15,
	&actionScriptCommand16,
	&actionScriptCommand17,
	&actionScriptCommand18,
	&actionScriptCommand19,
	&actionScriptCommand1A,
	&actionScriptCommand1B,
	&actionScriptCommand1C,
	&actionScriptCommand1D,
	&actionScriptCommand1E,
	&actionScriptCommand1F,
	&actionScriptCommand20,
	&actionScriptCommand21,
	&actionScriptCommand22,
	&actionScriptCommand23,
	&actionScriptCommand24,
	&actionScriptCommand25,
	&actionScriptCommand26,
	&actionScriptCommand27,
	&actionScriptCommand28,
	&actionScriptCommand29,
	&actionScriptCommand2A,
	&actionScriptCommand2B,
	&actionScriptCommand2C,
	&actionScriptCommand2D,
	&actionScriptCommand2E,
	&actionScriptCommand2F,
	&actionScriptCommand30,
	&actionScriptCommand31,
	&actionScriptCommand32,
	&actionScriptCommand33,
	&actionScriptCommand34,
	&actionScriptCommand35,
	&actionScriptCommand36,
	&actionScriptCommand37,
	&actionScriptCommand38,
	&actionScriptCommand39,
	&actionScriptCommand3A,
	&actionScriptCommand3B45,
	&actionScriptCommand3C46,
	&actionScriptCommand3D47,
	&actionScriptCommand3E48,
	&actionScriptCommand3F49,
	&actionScriptCommand404A,
	&actionScriptCommand414B,
	&actionScriptCommand424C,
	&actionScriptCommand43,
	&actionScriptCommand44,
	&actionScriptCommand3B45,
	&actionScriptCommand3C46,
	&actionScriptCommand3D47,
	&actionScriptCommand3E48,
	&actionScriptCommand3F49,
	&actionScriptCommand404A,
	&actionScriptCommand414B,
	&actionScriptCommand424C,
];

/** ActionScript command 00 - End
 * ActionScript_Syntax: [00]
 * Original_Address: $(DOLLAR)C095F2
 */
const(ubyte)* actionScriptCommand00(const(ubyte)* y) {
	deleteEntityOffset(currentActiveEntityOffset);
	entityScriptSleepFrames[currentEntityScriptOffset / 2] = -1;
	actionScriptCurrentScript = -1;
	return y;
}

/** ActionScript command 01 - Loop XX times
 * ActionScript_Syntax: [01 XX]
 * Original_Address: $(DOLLAR)C09603
 */
const(ubyte)* actionScriptCommand01(const(ubyte)* y) {
	return actionScriptCommand0124Common(y[actionScriptScriptOffset], currentEntityScriptOffset, y + 1);
}
/** Common code for ActionScript commands 01 and 24
 * Original_Address: $(DOLLAR)C09607
 */
const(ubyte)* actionScriptCommand0124Common(short a, short x, const(ubyte)* y) {
	actionScriptVar90 = a;
	actionScriptLastRead = y;
	actionScriptStack[entityScriptStackPosition[x / 2] / 3].pc = y;
	actionScriptStack[entityScriptStackPosition[x / 2] / 3].counter = cast(ubyte)a;
	entityScriptStackPosition[x / 2] += 3;
	return y;
}

/** ActionScript command 24 - Loop (Tempvar)
 * ActionScript_Syntax: [24]
 * Original_Address: $(DOLLAR)C09620
 */
const(ubyte)* actionScriptCommand24(const(ubyte)* y) {
	return actionScriptCommand0124Common(entityScriptTempvars[currentEntityScriptOffset / 2], currentEntityScriptOffset, y);
}

/** ActionScript command 02 - Loop End
 * ActionScript_Syntax: [02]
 * Original_Address: $(DOLLAR)C09627
 */
const(ubyte)* actionScriptCommand02(const(ubyte)* y) {
	actionScriptLastRead = y;
	if (--actionScriptStack[entityScriptStackPosition[currentEntityScriptOffset / 2] / 3 - 1].counter == 0) {
		entityScriptStackPosition[currentEntityScriptOffset / 2] -= 3;
		return actionScriptLastRead;
	}
	return actionScriptStack[entityScriptStackPosition[currentEntityScriptOffset / 2] / 3 - 1].pc;
}

/** ActionScript command 19 - Short Jump
 * ActionScript_Syntax: [19 NEARPTR]
 * Original_Address: $(DOLLAR)C09649
 */
const(ubyte)* actionScriptCommand19(const(ubyte)* y) {
	return *cast(const(ubyte)**)&y[actionScriptScriptOffset];
}

/** ActionScript command 03 - Long Jump
 * ActionScript_Syntax: [03 PTR]
 * Original_Address: $(DOLLAR)C0964D
 */
const(ubyte)* actionScriptCommand03(const(ubyte)* y) {
	return *cast(const(ubyte)**)&y[actionScriptScriptOffset];
}

/** ActionScript command 1A - Short Call
 * ActionScript_Syntax: [1A NEARPTR]
 * Original_Address: $(DOLLAR)C09658
 */
const(ubyte)* actionScriptCommand1A(const(ubyte)* y) {
	const(ubyte)* result = *cast(const(ubyte)**)&y[actionScriptScriptOffset];
	actionScriptStack[entityScriptStackPosition[currentEntityScriptOffset / 2] / 3].pc = y + (const(ubyte)*).sizeof;
	entityScriptStackPosition[currentEntityScriptOffset / 2] += 3;
	return result;
}

/** ActionScript command 1B - Short Return
 * ActionScript_Syntax: [1B]
 * Original_Address: $(DOLLAR)C0966F
 */
const(ubyte)* actionScriptCommand1B(const(ubyte)* y) {
	if (entityScriptStackPosition[currentEntityScriptOffset / 2] == 0) {
		return actionScriptCommand0C(null);
	} else {
		entityScriptStackPosition[currentEntityScriptOffset / 2] -= 3;
		return actionScriptStack[entityScriptStackPosition[currentEntityScriptOffset / 2] / 3].pc;
	}
}

/** ActionScript command 04 - Long Call
 * ActionScript_Syntax: [04 PTR]
 * Original_Address: $(DOLLAR)C09685
 */
const(ubyte)* actionScriptCommand04(const(ubyte)* y) {
	const(ubyte)* result = *cast(const(ubyte)**)&y[actionScriptScriptOffset];
	actionScriptStack[entityScriptStackPosition[currentEntityScriptOffset / 2] / 3].pc = y + (const(ubyte)*).sizeof;
	entityScriptStackPosition[currentEntityScriptOffset / 2] += 3;
	return result;
}

/** ActionScript command 05 - Long Return
 * ActionScript_Syntax: [05]
 * Original_Address: $(DOLLAR)C096AA
 */
const(ubyte)* actionScriptCommand05(const(ubyte)* y) {
	if (entityScriptStackPosition[currentEntityScriptOffset / 2] == 0) {
		return actionScriptCommand0C(null);
	} else {
		entityScriptStackPosition[currentEntityScriptOffset / 2] -= 3;
		return actionScriptStack[entityScriptStackPosition[currentEntityScriptOffset / 2] / 3].pc;
	}
}

/** ActionScript command 06 - Pause XX frames
 * ActionScript_Syntax: [06 XX]
 * Original_Address: $(DOLLAR)C096C3
 */
const(ubyte)* actionScriptCommand06(const(ubyte)* y) {
	entityScriptSleepFrames[currentEntityScriptOffset / 2] = y[actionScriptScriptOffset];
	return y + 1;
}

/** ActionScript command 3B/45 - Set Animation Frame
 * ActionScript_Syntax: [3B/45 XX]
 * Original_Address: $(DOLLAR)C096CF
 */
const(ubyte)* actionScriptCommand3B45(const(ubyte)* y) {
	entityAnimationFrames[currentActiveEntityOffset / 2] = y[actionScriptScriptOffset] == 0xFF ? -1 : y[actionScriptScriptOffset];
	return y + 1;
}

/** ActionScript command 28 - Set X position
 * ActionScript_Syntax: [28 XXXX]
 * Original_Address: $(DOLLAR)C096E3
 */
const(ubyte)* actionScriptCommand28(const(ubyte)* y) {
	entityAbsXTable[currentActiveEntityOffset / 2] = *cast(short*)&y[actionScriptScriptOffset];
	entityAbsXFractionTable[currentActiveEntityOffset / 2] = 0x8000;
	return y + 2;
}

/** ActionScript command 29 - Set Y position
 * ActionScript_Syntax: [29 XXXX]
 * Original_Address: $(DOLLAR)C096F3
 */
const(ubyte)* actionScriptCommand29(const(ubyte)* y) {
	entityAbsYTable[currentActiveEntityOffset / 2] = *cast(short*)&y[actionScriptScriptOffset];
	entityAbsYFractionTable[currentActiveEntityOffset / 2] = 0x8000;
	return y + 2;
}

/** ActionScript command 2A - Set Z position
 * ActionScript_Syntax: [2A XXXX]
 * Original_Address: $(DOLLAR)C09703
 */
const(ubyte)* actionScriptCommand2A(const(ubyte)* y) {
	entityAbsZTable[currentActiveEntityOffset / 2] = *cast(short*)&y[actionScriptScriptOffset];
	entityAbsZFractionTable[currentActiveEntityOffset / 2] = 0x8000;
	return y + 2;
}

/** ActionScript command 3F/49 - Set Z velocity
 * ActionScript_Syntax: [3F XXXX] or [49 XXXX]
 * Original_Address: $(DOLLAR)C09713
 */
const(ubyte)* actionScriptCommand3F49(const(ubyte)* y) {
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	y += 2;
	entityDeltaXFractionTable[currentActiveEntityOffset / 2] = cast(ushort)(actionScriptVar90 << 8);
	entityDeltaXTable[currentActiveEntityOffset / 2] = actionScriptVar90 >> 8;
	return y;
}

/** ActionScript command 40/4A - Set Z velocity
 * ActionScript_Syntax: [40 XXXX] or [4A XXXX]
 * Original_Address: $(DOLLAR)C09731
 */
const(ubyte)* actionScriptCommand404A(const(ubyte)* y) {
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	y += 2;
	entityDeltaYFractionTable[currentActiveEntityOffset / 2] = cast(ushort)(actionScriptVar90 << 8);
	entityDeltaYTable[currentActiveEntityOffset / 2] = actionScriptVar90 >> 8;
	return y;
}

/** ActionScript command 41/4B - Set Z velocity
 * ActionScript_Syntax: [41 XXXX] or [4B XXXX]
 * Original_Address: $(DOLLAR)C0974F
 */
const(ubyte)* actionScriptCommand414B(const(ubyte)* y) {
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	y += 2;
	entityDeltaZFractionTable[currentActiveEntityOffset / 2] = cast(ushort)(actionScriptVar90 << 8);
	entityDeltaZTable[currentActiveEntityOffset / 2] = actionScriptVar90 >> 8;
	return y;
}

/** ActionScript command 2E - Set relative X velocity
 * ActionScript_Syntax: [2E XXXX]
 * Original_Address: $(DOLLAR)C0976D
 */
const(ubyte)* actionScriptCommand2E(const(ubyte)* y) {
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	auto i = currentActiveEntityOffset / 2;
	auto param = FixedPoint1616(cast(ushort)(actionScriptVar90 << 8), cast(short)(actionScriptVar90 >> 8));
	auto prev = FixedPoint1616(entityDeltaXFractionTable[i], entityDeltaXTable[i]);
	prev.combined += param.combined;
	entityDeltaXFractionTable[i] = prev.fraction;
	entityDeltaXTable[i] = prev.integer;
	return y + 2;
}

/** ActionScript command 2F - Set relative Z velocity
 * ActionScript_Syntax: [2F XXXX]
 * Original_Address: $(DOLLAR)C09792
 */
const(ubyte)* actionScriptCommand2F(const(ubyte)* y) {
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	auto i = currentActiveEntityOffset / 2;
	auto param = FixedPoint1616(cast(ushort)(actionScriptVar90 << 8), cast(short)(actionScriptVar90 >> 8));
	auto prev = FixedPoint1616(entityDeltaYFractionTable[i], entityDeltaYTable[i]);
	prev.combined += param.combined;
	entityDeltaYFractionTable[i] = prev.fraction;
	entityDeltaYTable[i] = prev.integer;
	return y + 2;
}

/** ActionScript command 30 - Set relative Z velocity
 * ActionScript_Syntax: [30 XXXX]
 * Original_Address: $(DOLLAR)C097B7
 */
const(ubyte)* actionScriptCommand30(const(ubyte)* y) {
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	auto i = currentActiveEntityOffset / 2;
	auto param = FixedPoint1616(cast(ushort)(actionScriptVar90 << 8), cast(short)(actionScriptVar90 >> 8));
	auto prev = FixedPoint1616(entityDeltaZFractionTable[i], entityDeltaZTable[i]);
	prev.combined += param.combined;
	entityDeltaZFractionTable[i] = prev.fraction;
	entityDeltaZTable[i] = prev.integer;
	return y + 2;
}

/** ActionScript command 31 - Set background horizontal offset
 * ActionScript_Syntax: [31 XXXX]
 * Original_Address: $(DOLLAR)C097DC
 */
const(ubyte)* actionScriptCommand31(const(ubyte)* y) {
	ubyte x = (y++)[actionScriptScriptOffset];
	entityBGHorizontalOffsetLow[x] = *cast(short*)&y[actionScriptScriptOffset];
	entityBGHorizontalOffsetHigh[x] = 0;
	return y + 2;
}

/** ActionScript command 32 - Set background vertical offset
 * ActionScript_Syntax: [32 XXXX]
 * Original_Address: $(DOLLAR)C097EF
 */
const(ubyte)* actionScriptCommand32(const(ubyte)* y) {
	ubyte x = (y++)[actionScriptScriptOffset];
	entityBGVerticalOffsetLow[x] = *cast(short*)&y[actionScriptScriptOffset];
	entityBGVerticalOffsetHigh[x] = 0;
	return y + 2;
}

/** ActionScript command 33 - Set background horizontal velocity
 * ActionScript_Syntax: [33 XXXX]
 * Original_Address: $(DOLLAR)C09802
 */
const(ubyte)* actionScriptCommand33(const(ubyte)* y) {
	ubyte x = (y++)[actionScriptScriptOffset];
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	entityBGHorizontalVelocityHigh[x] = cast(short)((actionScriptVar90 & 0xFF) << 8);
	entityBGHorizontalVelocityLow[x] = cast(short)((actionScriptVar90 & 0x8000) ? ((actionScriptVar90 & 0xFF00) | 0xFF) : (actionScriptVar90 & 0xFF00));
	return y + 2;
}

/** ActionScript command 34 - Set background vertical velocity
 * ActionScript_Syntax: [34 XXXX]
 * Original_Address: $(DOLLAR)C09826
 */
const(ubyte)* actionScriptCommand34(const(ubyte)* y) {
	ubyte x = (y++)[actionScriptScriptOffset];
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	entityBGVerticalVelocityHigh[x] = cast(short)((actionScriptVar90 & 0xFF) << 8);
	entityBGVerticalVelocityLow[x] = cast(short)((actionScriptVar90 & 0x8000) ? ((actionScriptVar90 & 0xFF00) | 0xFF) : (actionScriptVar90 & 0xFF00));
	return y + 2;
}

/** ActionScript command 35 - Increase background horizontal velocity
 * ActionScript_Syntax: [35 XXXX]
 * Original_Address: $(DOLLAR)C0984A
 */
const(ubyte)* actionScriptCommand35(const(ubyte)* y) {
	ubyte x = (y++)[actionScriptScriptOffset];
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	entityBGHorizontalVelocityHigh[x] += (actionScriptVar90 & 0xFF) << 8;
	entityBGHorizontalVelocityLow[x] += (actionScriptVar90 & 0x8000) ? ((actionScriptVar90 & 0xFF00) | 0xFF) : (actionScriptVar90 & 0xFF00);
	return y + 2;
}

/** ActionScript command 36 - Increase background vertical velocity
 * ActionScript_Syntax: [36 XXXX]
 * Original_Address: $(DOLLAR)C09875
 */
const(ubyte)* actionScriptCommand36(const(ubyte)* y) {
	ubyte x = (y++)[actionScriptScriptOffset];
	actionScriptVar90 = *cast(short*)&y[actionScriptScriptOffset];
	entityBGVerticalVelocityHigh[x] += (actionScriptVar90 & 0xFF) << 8;
	entityBGVerticalVelocityLow[x] += (actionScriptVar90 & 0x8000) ? ((actionScriptVar90 & 0xFF00) | 0xFF) : (actionScriptVar90 & 0xFF00);
	return y + 2;
}

/** ActionScript command 2B - Set relative X position
 * ActionScript_Syntax: [2B XXXX]
 * Original_Address: $(DOLLAR)C098A0
 */
const(ubyte)* actionScriptCommand2B(const(ubyte)* y) {
	entityAbsXTable[currentActiveEntityOffset / 2] += *cast(short*)&y[actionScriptScriptOffset];
	return y + 2;
}

/** ActionScript command 2C - Set relative Y position
 * ActionScript_Syntax: [2C XXXX]
 * Original_Address: $(DOLLAR)C098AE
 */
const(ubyte)* actionScriptCommand2C(const(ubyte)* y) {
	entityAbsYTable[currentActiveEntityOffset / 2] += *cast(short*)&y[actionScriptScriptOffset];
	return y + 2;
}

/** ActionScript command 2D - Set relative Z position
 * ActionScript_Syntax: [2D XXXX]
 * Original_Address: $(DOLLAR)C098BC
 */
const(ubyte)* actionScriptCommand2D(const(ubyte)* y) {
	entityAbsZTable[currentActiveEntityOffset / 2] += *cast(short*)&y[actionScriptScriptOffset];
	return y + 2;
}

/** ActionScript command 37 - Set relative background horizontal offset
 * ActionScript_Syntax: [37 XXXX]
 * Original_Address: $(DOLLAR)C098CA
 */
const(ubyte)* actionScriptCommand37(const(ubyte)* y) {
	ubyte x = (y++)[actionScriptScriptOffset];
	entityBGHorizontalOffsetLow[x] += *cast(short*)&y[actionScriptScriptOffset];
	return y + 2;
}

/** ActionScript command 38 - Set relative background vertical offset
 * ActionScript_Syntax: [38 XXXX]
 * Original_Address: $(DOLLAR)C098DE
 */
const(ubyte)* actionScriptCommand38(const(ubyte)* y) {
	ubyte x = (y++)[actionScriptScriptOffset];
	entityBGVerticalOffsetLow[x] += *cast(short*)&y[actionScriptScriptOffset];
	return y + 2;
}

/** ActionScript command 39 - Reset velocities
 * ActionScript_Syntax: [39]
 * Original_Address: $(DOLLAR)C098F2
 */
const(ubyte)* actionScriptCommand39(const(ubyte)* y) {
	entityDeltaXFractionTable[currentActiveEntityOffset / 2] = 0;
	entityDeltaXTable[currentActiveEntityOffset / 2] = 0;
	entityDeltaYFractionTable[currentActiveEntityOffset / 2] = 0;
	entityDeltaYTable[currentActiveEntityOffset / 2] = 0;
	entityDeltaZFractionTable[currentActiveEntityOffset / 2] = 0;
	entityDeltaZTable[currentActiveEntityOffset / 2] = 0;
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

/** ActionScript command 3A - Reset horizontal and vertical background velocity
 * ActionScript_Syntax: [3A]
 * Original_Address: $(DOLLAR)C0991C
 */
const(ubyte)* actionScriptCommand3A(const(ubyte)* y) {
	entityBGHorizontalVelocityHigh[y[actionScriptScriptOffset]] = 0;
	entityBGHorizontalVelocityLow[y[actionScriptScriptOffset]] = 0;
	entityBGVerticalVelocityHigh[y[actionScriptScriptOffset]] = 0;
	entityBGVerticalVelocityLow[y[actionScriptScriptOffset]] = 0;
	return y + 1;
}

/** ActionScript command 43 - Set draw priority
 * ActionScript_Syntax: [43 XX]
 * Original_Address: $(DOLLAR)C09931
 */
const(ubyte)* actionScriptCommand43(const(ubyte)* y) {
	entityDrawPriority[currentActiveEntityOffset / 2] = (y++)[actionScriptScriptOffset];
	return y;
}

/** ActionScript command 42/4C - Call function
 * ActionScript_Syntax: [42 FUNCPTR ...] or [4C FUNCPTR ...]
 * Original_Address: $(DOLLAR)C0993D
 */
const(ubyte)* actionScriptCommand424C(const(ubyte)* y) {
	alias Func = short function(short a, ref const(ubyte)* y);
	Func f = *cast(Func*)&y[actionScriptScriptOffset];
	actionScriptLastRead = y + Func.sizeof;
	entityScriptTempvars[currentEntityScriptOffset / 2] = f(entityScriptTempvars[currentEntityScriptOffset / 2], actionScriptLastRead);
	return actionScriptLastRead;
}

/** ActionScript command 0A - Jump if temp var is false
 * ActionScript_Syntax: [0A PTR]
 * Original_Address: $(DOLLAR)C0995D
 */
const(ubyte)* actionScriptCommand0A(const(ubyte)* y) {
	if (entityScriptTempvars[currentEntityScriptOffset / 2] == 0) {
		return *cast(const(ubyte)**)&y[actionScriptScriptOffset];
	}
	return y + (const(ubyte)*).sizeof;
}

/** ActionScript command 0B - Jump if temp var is true
 * ActionScript_Syntax: [0B PTR]
 * Original_Address: $(DOLLAR)C0996B
 */
const(ubyte)* actionScriptCommand0B(const(ubyte)* y) {
	if (entityScriptTempvars[currentEntityScriptOffset / 2] != 0) {
		return *cast(const(ubyte)**)&y[actionScriptScriptOffset];
	}
	return y + (const(ubyte)*).sizeof;
}

/** ActionScript command 10 - Jump to Xth pointer
 * ActionScript_Syntax: [10 XX (PTR+)]
 * Original_Address: $(DOLLAR)C09979
 */
const(ubyte)* actionScriptCommand10(const(ubyte)* y) {
	actionScriptVar90 = entityScriptTempvars[currentEntityScriptOffset / 2];
	actionScriptLastRead = y + 1;
	if (y[actionScriptScriptOffset] <= actionScriptVar90) {
		return actionScriptLastRead + y[actionScriptScriptOffset] * (const(ubyte)*).sizeof;
	} else {
		return (cast(const(ubyte)**)actionScriptLastRead)[actionScriptVar90];
	}
}

/** ActionScript command 11 - Call Xth pointer
* ActionScript_Syntax: [11 XX (PTR+)]
 * Original_Address: $(DOLLAR)C0999E
 */
const(ubyte)* actionScriptCommand11(const(ubyte)* y) {
	actionScriptVar90 = entityScriptTempvars[currentEntityScriptOffset / 2];
	actionScriptLastRead = y + 1;
	if (y[actionScriptScriptOffset] <= actionScriptVar90) {
		return actionScriptLastRead + y[actionScriptScriptOffset] * (const(ubyte)*).sizeof;
	} else {
		actionScriptStack[entityScriptStackPosition[currentEntityScriptOffset / 2] / 3].pc = actionScriptLastRead + y[actionScriptScriptOffset] * (const(ubyte)*).sizeof;
		entityScriptStackPosition[currentEntityScriptOffset / 2] += 3;
		return (cast(const(ubyte)**)actionScriptLastRead)[actionScriptVar90];
	}
}

/** ActionScript command 0C - End task
 * ActionScript_Syntax: [0C]
 * Original_Address: $(DOLLAR)C099C3
 * Porting_Notes: Originally fell through to what is now actionScriptCommand0C13Common.
 */
const(ubyte)* actionScriptCommand0C(const(ubyte)* y) {
	actionScriptLastRead = y;
	return actionScriptCommand0C13Common(currentEntityScriptOffset);
}

/** Common code for ActionScript commands 0C and 13
 * Original_Address: $(DOLLAR)C099C7
 */
const(ubyte)* actionScriptCommand0C13Common(short y) {
	ushort regY = unknownC09D12(currentActiveEntityOffset, y);
	entityScriptSleepFrames[regY / 2] = -1;
	if (entityScriptIndexTable[currentActiveEntityOffset / 2] < 0) {
		actionScriptCommand00(null);
	}
	return actionScriptLastRead;
}

/** ActionScript command 07 - Start task
 * ActionScript_Syntax: [07 PTR]
 * Original_Address: $(DOLLAR)C099DD
 */
const(ubyte)* actionScriptCommand07(const(ubyte)* y) {
	actionScriptLastRead = y;
	bool carry;
	short regY = allocateScript(carry);
	if (!carry) {
		actionScriptCurrentScript = regY;
		entityScriptNextScripts[regY / 2] = entityScriptNextScripts[currentEntityScriptOffset / 2];
		entityScriptNextScripts[currentEntityScriptOffset / 2] = regY;
		entityScriptStackPosition[regY / 2] = 0;
		entityScriptSleepFrames[regY / 2] = 0;
		entityProgramCounters[regY / 2] = *cast(const(ubyte)**)&y[actionScriptScriptOffset];
		///blah blah blah bank
		return y + (const(ubyte)*).sizeof;
	}
	return y + (const(ubyte)*).sizeof;
}

/** ActionScript command 13 - End last task
 * ActionScript_Syntax: [13]
 * Original_Address: $(DOLLAR)C09A0E
 */
const(ubyte)* actionScriptCommand13(const(ubyte)* y) {
	actionScriptLastRead = y;
	if (entityScriptNextScripts[currentEntityScriptOffset / 2] >= 0) {
		return actionScriptCommand0C13Common(entityScriptNextScripts[currentEntityScriptOffset / 2]);
	}
	return actionScriptLastRead;
}

/** ActionScript command 08 - Set tick callback
 * ActionScript_Syntax: [08 FUNCPTR]
 * Original_Address: $(DOLLAR)C09A1A
 */
const(ubyte)* actionScriptCommand08(const(ubyte)* y) {
	entityTickCallbacks[currentActiveEntityOffset / 2] = *cast(void function()*)&y[actionScriptScriptOffset];
	entityCallbackFlags[currentActiveEntityOffset / 2] = 0;
	y += (const(ubyte)*).sizeof;
	//banks!
	return y;
}

/** ActionScript command 09 - Halt
 * ActionScript_Syntax: [09]
 * Original_Address: $(DOLLAR)C09A2E
 */
const(ubyte)* actionScriptCommand09(const(ubyte)* y) {
	entityScriptSleepFrames[currentEntityScriptOffset / 2] = -1;
	return y - 1;
}

/** ActionScript command 3C/46 - Next animation frame
 * ActionScript_Syntax: [3C] or [46]
 * Original_Address: $(DOLLAR)C09A38
 */
const(ubyte)* actionScriptCommand3C46(const(ubyte)* y) {
	entityAnimationFrames[currentActiveEntityOffset / 2]++;
	return y;
}

/** ActionScript command 3D/47 - Previous animation frame
 * ActionScript_Syntax: [3D] or [47]
 * Original_Address: $(DOLLAR)C09A3E
 */
const(ubyte)* actionScriptCommand3D47(const(ubyte)* y) {
	entityAnimationFrames[currentActiveEntityOffset / 2]--;
	return y;
}

/** ActionScript command 3E/48 - Skip N animation frames
 * ActionScript_Syntax: [3E XX] or [48 XX]
 * Original_Address: $(DOLLAR)C09A44
 */
const(ubyte)* actionScriptCommand3E48(const(ubyte)* y) {
	entityAnimationFrames[currentActiveEntityOffset / 2] += cast(byte)y[actionScriptScriptOffset];
	return y + 1;
}

/** ActionScript command 18 - Perform 8-bit binary operation on RAM address
 * ActionScript_Syntax: [18 PTR XX YY]
 * Original_Address: $(DOLLAR)C09A5C
 */
const(ubyte)* actionScriptCommand18(const(ubyte)* y) {
	actionScriptVar8CMemory = *cast(ushort**)&y[actionScriptScriptOffset];
	y += (ushort*).sizeof;
	ubyte x = (y++)[actionScriptScriptOffset];
	actionScriptVar90 = (y++)[actionScriptScriptOffset];
	binopFunctions[x]();
	return y;
}

/** ActionScript command 14 - Perform binary operation on entity var
 * ActionScript_Syntax: [14 XX YY ZZZZ]
 * Original_Address: $(DOLLAR)C09A87
 */
const(ubyte)* actionScriptCommand14(const(ubyte)* y) {
	return actionScriptCommand0D14Common(cast(ushort*)&entityScriptVarTables[y[actionScriptScriptOffset]][currentActiveEntityOffset / 2], y);
}

/** ActionScript command 27 - Perform binary operation on temp var
 * ActionScript_Syntax: [27 XX YYYY]
 * Original_Address: $(DOLLAR)C09A97
 */
const(ubyte)* actionScriptCommand27(const(ubyte)* y) {
	return actionScriptCommand0D27Common(cast(ushort*)&entityScriptTempvars[currentEntityScriptOffset / 2], y);
}

/** ActionScript command 0D - Perform binary operation on RAM address
 * ActionScript_Syntax: [0D PTR XX YYYY]
 * Original_Address: $(DOLLAR)C09A9F
 */
const(ubyte)* actionScriptCommand0D(const(ubyte)* y) {
	return actionScriptCommand0D14Common(*cast(ushort**)y[actionScriptScriptOffset], y + (ushort*).sizeof - 1);
}
/** Common code for ActionScript commands 0D and 14
 * Original_Address: $(DOLLAR)C09AA2
 */
const(ubyte)* actionScriptCommand0D14Common(ushort* a, const(ubyte)* y) {
	return actionScriptCommand0D27Common(a, y + 1);
}
/** Common code for ActionScript commands 0D, 14 and 27
 * Original_Address: $(DOLLAR)C09AA3
 */
const(ubyte)* actionScriptCommand0D27Common(ushort* a, const(ubyte)* y) {
	actionScriptVar8CMemory = a;
	ubyte x = (y++)[actionScriptScriptOffset];
	actionScriptVar90 = *(cast(short*)&y[actionScriptScriptOffset]);
	y += 2;
	binopFunctions[x]();
	return y;
}

/** Binary operation command functions
 * Original_Address: $(DOLLAR)C09ABD
 */
immutable void function()[4] binopFunctions = [
	&binopAND,
	&binopOR,
	&binopAdd,
	&binopXOR,
];

/** Perform an actionscript AND binop
 * Original_Address: $(DOLLAR)C09AC5
 */
void binopAND() {
	actionScriptVar8CMemory[0] &= actionScriptVar90;
}

/** Perform an actionscript OR binop
 * Original_Address: $(DOLLAR)C09ACC
 */
void binopOR() {
	actionScriptVar8CMemory[0] |= actionScriptVar90;
}

/** Perform an actionscript addition binop
 * Original_Address: $(DOLLAR)C09AD3
 */
void binopAdd() {
	actionScriptVar8CMemory[0] += actionScriptVar90;
}

/** Perform an actionscript XOR binop
 * Original_Address: $(DOLLAR)C09ADB
 */
void binopXOR() {
	actionScriptVar8CMemory[0] ^= actionScriptVar90;
}

/** ActionScript command 0E - Set var
 * ActionScript_Syntax: [0E XX YYYY]
 * Original_Address: $(DOLLAR)C09AE2
 */
const(ubyte)* actionScriptCommand0E(const(ubyte)* y) {
	entityScriptVarTables[y[actionScriptScriptOffset]][currentActiveEntityOffset / 2] = *cast(short*)&y[1 + actionScriptScriptOffset];
	return y + 3;
}

/** Entity variable tables
 * Original_Address: $(DOLLAR)C09AF9
 */
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

/** ActionScript command 0F - Clear tick callback
 * ActionScript_Syntax: [0F]
 * Original_Address: $(DOLLAR)C09B09
 */
const(ubyte)* actionScriptCommand0F(const(ubyte)* y) {
	clearEntityTickCallback(currentActiveEntityOffset);
	return y;
}

/** Actionscript command 12 - Write XX to memory
 * ActionScript_Syntax: [12 NEARPTR XX]
 * Original_Address: $(DOLLAR)C09B0F
 */
const(ubyte)* actionScriptCommand12(const(ubyte)* y) {
	*(*cast(ubyte**)&y[actionScriptScriptOffset]) = y[(ubyte*).sizeof + actionScriptScriptOffset];
	return y + (ubyte*).sizeof + ubyte.sizeof;
}

/** Actionscript command 15 - Write XXXX to memory
 * ActionScript_Syntax: [15 NEARPTR XXXX]
 * Original_Address: $(DOLLAR)C09B1F
 */
const(ubyte)* actionScriptCommand15(const(ubyte)* y) {
	*(*cast(ushort**)&y[actionScriptScriptOffset]) = *cast(ushort*)&y[(ushort*).sizeof + actionScriptScriptOffset];
	return y + (ushort*).sizeof + ushort.sizeof;
}

/** ActionScript command 16 - Break if false
 * ActionScript_Syntax: [16 NEARPTR]
 * Original_Address: $(DOLLAR)C09B2C
 */
const(ubyte)* actionScriptCommand16(const(ubyte)* y) {
	if (entityScriptTempvars[currentEntityScriptOffset / 2] == 0) {
		y = *cast(const(ubyte)**)&y[actionScriptScriptOffset];
		entityScriptStackPosition[currentEntityScriptOffset / 2] -= 3;
		return y;
	}
	return y + (const(ubyte)*).sizeof;
}

/** ActionScript command 17 - Break if true
 * ActionScript_Syntax: [17 NEARPTR]
 * Original_Address: $(DOLLAR)C09B44
 */
const(ubyte)* actionScriptCommand17(const(ubyte)* y) {
	if (entityScriptTempvars[currentEntityScriptOffset / 2] != 0) {
		y = *cast(const(ubyte)**)&y[actionScriptScriptOffset];
		entityScriptStackPosition[currentEntityScriptOffset / 2] -= 3;
		return y;
	}
	return y + (const(ubyte)*).sizeof;
}

/** ActionScript command 1C - Set Spritemap
 * ActionScript_Syntax: [1C PTR]
 * Original_Address: $(DOLLAR)C09B4D
 */
const(ubyte)* actionScriptCommand1C(const(ubyte)* y) {
	// The only stuff that uses this command uses a double pointer for its spritemaps
	entitySpriteMapPointers[currentActiveEntityOffset / 2] = null;
	entitySpriteMapPointersDptr[currentActiveEntityOffset / 2] = *cast(const(SpriteMap*)**)&y[actionScriptScriptOffset];
	y += (const(SpriteMap*)*).sizeof;
	return y;
}

/** ActionScript command 1D - Write word to tempvar
 * ActionScript_Syntax: [1D XXXX]
 * Original_Address: $(DOLLAR)C09B61
 */
const(ubyte)* actionScriptCommand1D(const(ubyte)* y) {
	entityScriptTempvars[currentEntityScriptOffset / 2] = *cast(ushort*)&y[actionScriptScriptOffset];
	return y + ushort.sizeof;
}

/** ActionScript command 1E - Write data at address to tempvar
 * ActionScript_Syntax: [1E NEARPTR]
 * Original_Address: $(DOLLAR)C09B6B
 */
const(ubyte)* actionScriptCommand1E(const(ubyte)* y) {
	entityScriptTempvars[currentEntityScriptOffset / 2] = *(*cast(ushort**)&y[actionScriptScriptOffset]);
	return y + (ushort*).sizeof;
}

/** ActionScript command 1F - Write tempvar to var
 * ActionScript_Syntax: [1F XX]
 * Original_Address: $(DOLLAR)C09B79
 */
const(ubyte)* actionScriptCommand1F(const(ubyte)* y) {
	ubyte x = y[actionScriptScriptOffset];
	actionScriptVar8CMemory = cast(ushort*)entityScriptVarTables[x];
	actionScriptVar8CMemory[0] = entityScriptTempvars[currentEntityScriptOffset / 2];
	return y + 1;
}

/** ActionScript command 20 - Write var to tempvar
 * Original_Address: $(DOLLAR)C09B91
 * ActionScript_Syntax: [20 XX]
 */
const(ubyte)* actionScriptCommand20(const(ubyte)* y) {
	entityScriptTempvars[currentEntityScriptOffset / 2] = (cast(ushort*)entityScriptVarTables[y[actionScriptScriptOffset]])[currentActiveEntityOffset / 2];
	return y + 1;
}

/** ActionScript command 44 - Sleep for $tempvar frames
 * Original_Address: $(DOLLAR)C09BA9
 * ActionScript_Syntax: [44]
 */
const(ubyte)* actionScriptCommand44(const(ubyte)* y) {
	if (entityScriptTempvars[currentEntityScriptOffset / 2] != 0) {
		entityScriptSleepFrames[currentEntityScriptOffset / 2] = entityScriptTempvars[currentEntityScriptOffset / 2];
	}
	return y;
}

/** ActionScript command 21 - Sleep for var XX frames
 * Original_Address: $(DOLLAR)C09BB4
 * ActionScript_Syntax: [21 XX]
 */
const(ubyte)* actionScriptCommand21(const(ubyte)* y) {
	entityScriptSleepFrames[currentEntityScriptOffset / 2] = (cast(ushort*)entityScriptVarTables[y[actionScriptScriptOffset]])[currentActiveEntityOffset / 2];
	return y + 1;
}

/** ActionScript command 26 - Set Animation Frame to Var XX
 * Original_Address: $(DOLLAR)C09BCC
 * ActionScript_Syntax: [26 XX]
 */
const(ubyte)* actionScriptCommand26(const(ubyte)* y) {
	entityAnimationFrames[currentActiveEntityOffset / 2] = entityScriptVarTables[(y++)[actionScriptScriptOffset]][currentActiveEntityOffset / 2];
	return y;
}

/** ActionScript command 22 - Set Draw Callback
 * Original_Address: $(DOLLAR)C09BE4
 * ActionScript_Syntax: [22 NEARPTR]
 */
const(ubyte)* actionScriptCommand22(const(ubyte)* y) {
	entityDrawCallbacks[currentActiveEntityOffset / 2] = *cast(void function(short, short)*)&y[actionScriptScriptOffset];
	y += (void function(short)).sizeof;
	return y;
}

/** ActionScript command 23 - Set Position Change Callback
 * Original_Address: $(DOLLAR)C09BEE
 * ActionScript_Syntax: [23 NEARPTR]
 */
const(ubyte)* actionScriptCommand23(const(ubyte)* y) {
	entityScreenPositionCallbacks[currentActiveEntityOffset / 2] = *cast(void function()*)&y[actionScriptScriptOffset];
	y += (void function()).sizeof;
	return y;
}

/** ActionScript command 25 - Set Physics Callback
 * Original_Address: $(DOLLAR)C09BF8
 * ActionScript_Syntax: [25 NEARPTR]
 */
const(ubyte)* actionScriptCommand25(const(ubyte)* y) {
	entityMoveCallbacks[currentActiveEntityOffset / 2] = *cast(void function()*)&y[actionScriptScriptOffset];
	y += (void function()).sizeof;
	return y;
}

/** Allocates an unused slot for a new entity
 * Params:
 * 	flag = True if the allocation failed, false if successful (Originally indicated by the carry flag)
 * Returns: The new entity slot, or -1 if a failure occurred (Originally garbage on failure)
 * Original_Address: $(DOLLAR)C09C02
 */
short allocateEntity(out bool flag) {
	if (lastAllocatedScript < 0) {
		flag = true;
		return -1; //actually just whatever was in the X register when called
	}
	if (lastEntity < 0) {
		flag = true;
		return -1; //actually just whatever was in the X register when called
	}
	short x = lastEntity;
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
		lastEntity = entityNextEntityTable[x / 2];
		flag = false;
		return x;
	}
}

/// $C09C35
void deleteEntity(short entity) {
	deleteEntityOffset(cast(short)(entity * 2));
}

/// $C09C3B
//note: arg1 is passed via X register
void deleteEntityOffset(short offset) {
	tracef("Deleting entity %s", offset / 2);
	if (entityScriptTable[offset / 2] >= 0) {
		entityScriptTable[offset / 2] = -1;
		clearEntityTickCallback(offset);
		short x = unknownC09C99(offset);
		short a = lastAllocatedScript;
		deleteActiveEntry(a, x);
		unknownC09C8F(x);
	}
}

/// $C09C57
short appendActiveEntity(short index) {
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
void deleteActiveEntry(short a, short entry) {
	short foundEntry = searchNextEntityTable(entry);
	if (foundEntry != -1) {
		entityNextEntityTable[foundEntry / 2] = entityNextEntityTable[entry / 2];
	} else {
		firstEntity = entityNextEntityTable[entry / 2];
	}
	if (entry == nextActiveEntity) {
		nextActiveEntity = a;
	}
}

/// $C09C8F
void unknownC09C8F(short x) {
	entityNextEntityTable[x / 2] = lastEntity;
	lastEntity = x;
}

/// $C09C99
short unknownC09C99(short offset) {
	if (entityScriptIndexTable[offset / 2] < 0) {
		return offset;
	}
	short lastAllocatedScriptCopy = lastAllocatedScript;
	short x = offset;
	short a = entityScriptIndexTable[x / 2];
	lastAllocatedScript = a;
	do {
		x = a;
		a = entityScriptNextScripts[x / 2];
	} while(a >= 0);
	entityScriptNextScripts[x / 2] = lastAllocatedScriptCopy;
	return offset;
}

/** Searches for an entity and returns it. If not found, never returns
 * Params:
 * 	needle = The entity ID to search for
 * Returns: The entity ID being searched for
 * Original_Address: $(DOLLAR)C09CB5
 */
short searchNextEntityTable(short needle) {
	short tmp = needle;
	short foundEntry = -1;
	tmp = firstEntity;
	do {
		if (tmp == needle) {
			return foundEntry;
		}
		foundEntry = tmp;
		tmp = entityNextEntityTable[tmp / 2];
	} while(true);
}

/// $C09CD7
void unknownC09CD7() {
	short a = -32768;
	short x = lastEntity;
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
	lastEntity = y;
}

/** Allocates a script slot
 * Params:
 * 	flag = Whether or not the allocation succeeded
 * Returns: The new script slot
 * Original_Address: $(DOLLAR)C09D03
 */
short allocateScript(out bool flag) {
	short result = lastAllocatedScript;
	if (result < 0) {
		flag = true;
		return result;
	}
	lastAllocatedScript = entityScriptNextScripts[result / 2];
	flag = false;
	return result;
}

/// $C09D12
ushort unknownC09D12(short entityOffset, short y) {
	unknownC09D1F(entityOffset, y);
	entityScriptNextScripts[y / 2] = lastAllocatedScript;
	lastAllocatedScript = y;
	return y;
}

/// $C09D1F
void unknownC09D1F(short entityOffset, short y) {
	short tmpX;
	y = unknownC09D3E(entityOffset, y, tmpX);
	if (tmpX != -1) {
		entityScriptNextScripts[tmpX / 2] = entityScriptNextScripts[y / 2];
	} else {
		entityScriptIndexTable[entityOffset / 2] = entityScriptNextScripts[y / 2];
	}
	if (y == actionScriptCurrentScript) {
		actionScriptCurrentScript = entityScriptNextScripts[y / 2];
	}
}

/// $C09D3E
short unknownC09D3E(short entityOffset, short y, out short finalX) {
	short tmpY = y;
	y = entityScriptIndexTable[entityOffset / 2];
	entityOffset = -1;
	while (true) {
		if (y == tmpY) {
			break;
		}
		entityOffset = y;
		y = entityScriptNextScripts[entityOffset / 2];
	}
	finalX = entityOffset;
	return tmpY;
}

/** Reads an 8-bit value from the actionscript.
 * Original_Address: $(DOLLAR)C09D86
 */
ushort actionScriptRead8(ref const(ubyte)* arg1) {
	ushort a = arg1[actionScriptScriptOffset];
	arg1++;
	return a;
}

/** Reads a 16-bit value from the actionscript.
 * Original_Address: $(DOLLAR)C09D94
 */
ushort actionScriptRead16(ref const(ubyte)* arg1) {
	ushort a = *cast(const(ushort)*)&arg1[actionScriptScriptOffset];
	arg1 += 2;
	return a;
}

/** Reads a 16-bit value from the actionscript.
 * Same as actionScriptRead16, but with a short return
 * $(DOLLAR)C09D99
 */
ushort actionScriptRead16Copy(ref const(ubyte)* script) {
	ushort a = *cast(const(ushort)*)&script[actionScriptScriptOffset];
	script += 2;
	return a;
}

/// Reads a pointer from the actionscript data. Does not exist in original game
void* actionScriptReadPtr(ref const(ubyte)* script) {
	void* a = *cast(void**)&script[actionScriptScriptOffset];
	script += (void*).sizeof;
	return a;
}

/// Reads a string from the actionscript data. Does not exist in original game
string actionScriptReadString(ref const(ubyte)* script) {
	string a = *cast(string*)&script[actionScriptScriptOffset];
	script += string.sizeof;
	return a;
}

/** Calls the current entity tick callback
 * Original_Address: $(DOLLAR)C09D9E
 */
void callEntityTickCallback() {
	currentEntityTickCallback();
}

/** Clear an entity tick callback by setting it to a no-op.
 * Original_Address: $(DOLLAR)C09DA1
 */
void clearEntityTickCallback(short index) {
	entityTickCallbacks[index / 2] = &movementNOP;
	entityCallbackFlags[index / 2] = 0;
}

/** Creates an entity for the title screen. The entities will not be created with valid X, Y coordinates, so their scripts must handle initial positioning.
 * Original_Address: $(DOLLAR)C09E71
 */
short actionScriptCreateTitleScreenEntity(short, ref const(ubyte)* arg2) {
	short script = actionScriptRead16Copy(arg2);
	// initEntityWipe takes 3 arguments but this code only prepares one of them...
	short x = void;
	actionScriptLastRead = arg2;
	return initEntityWipe(script, x, cast(short)actionScriptLastRead);
}

/// Tests if the active entity is moving somewhere. Stores possible destination in entityMovementProspectX/Y
/// Returns: number of axes movement is occurring on
/// Original_Address: $(DOLLAR)C09EFF
short testEntityMovementActive() {
	return testEntityMovementCommon(currentEntityOffset);
}

/// Tests if the active entity(?) is moving somewhere. Stores possible destination in entityMovementProspectX/Y. Unused
/// Returns: number of axes movement is occurring on
/// Original_Address: $(DOLLAR)C09EFF
short testEntityMovementUnusedEntry() {
	return testEntityMovementCommon(currentActiveEntityOffset);
}

/// Tests if an arbitrary entity is moving somewhere. Stores possible destination in entityMovementProspectX/Y
/// Params: id = entity ID
/// Returns: number of axes movement is occurring on
/// Original_Address: $(DOLLAR)C09EFF
short testEntityMovementSlot(short id) {
	return testEntityMovementCommon(cast(short)(id * 2));
}

/// Tests if an active entity (offset) is moving somewhere. Stores possible destination in entityMovementProspectX/Y
/// Returns: number of axes movement is occurring on
/// Params: offset = entity offset (ID * 2)
/// Mutates:
///	entityMovementProspectX = X coordinate that the entity is attempting to move to
///	entityMovementProspectY = Y coordinate that the entity is attempting to move to
/// Original_Address: $(DOLLAR)C09EFF
//note: arg1 was X register originally
short testEntityMovementCommon(short offset) {
	short axes = 0;
	entityMovementProspectX = cast(short)((fullEntityAbsX(offset / 2).combined + fullEntityDeltaX(offset / 2).combined) >> 16);
	if (entityMovementProspectX != entityAbsXTable[offset / 2]) {
		axes++;
	}
	entityMovementProspectY = cast(short)((fullEntityAbsY(offset / 2).combined + fullEntityDeltaY(offset / 2).combined) >> 16);
	if (entityMovementProspectY != entityAbsYTable[offset / 2]) {
		axes++;
	}
	return axes;
}

/// $C09F3B
void unknownC09F3BUnusedEntry() {
	currentEntityOffset = -1;
	backupEntityCallbackFlagsAndDisable();
}

/// Backs up all entity callback flags and freezes each active entity
/// Original_Address: $(DOLLAR)C09F3B
void backupEntityCallbackFlagsAndDisable() {
	for (short i = 0; i != maxEntities * 2; i += 2) {
		entityCallbackFlagsBackup[i / 2] = entityCallbackFlags[i / 2];
	}
	if (firstEntity < 0) {
		return;
	}
	short x = firstEntity;
	while (true) {
		if (x != currentEntityOffset) {
			entityCallbackFlags[x / 2] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
		}
		x = entityNextEntityTable[x / 2];
		if (x <= 0) {
			break;
		}
	}
}

/// Restores entity callback flags from backup
/// Original_Address: $(DOLLAR)C09F71
void restoreEntityCallbackFlags() {
	for (short i = 0; i != maxEntities * 2; i += 2) {
		entityCallbackFlags[i / 2] = entityCallbackFlagsBackup[i / 2];
	}
}

/// $C09F82
short chooseRandom(short, ref const(ubyte)* arg1) {
	actionScriptVar90 = arg1[actionScriptScriptOffset];
	actionScriptLastRead = arg1 + 1;
	const tmp = actionScriptLastRead;
	actionScriptLastRead += actionScriptVar90 * 2;
	return (cast(const(short)*)tmp)[rand() % actionScriptVar90];
}

/// $C09FA8
short actionScriptGenerateRandomAngle() {
	return cast(short)(rand() << 8);
}

/// $C09FAE
void actionScriptFadeIn(short, ref const(ubyte)* arg1) {
	ubyte a = (arg1++)[actionScriptScriptOffset];
	ubyte b = (arg1++)[actionScriptScriptOffset];
	fadeIn(a, b);
}

/// $C09FC8
void updateActiveEntityPosition2D() {
	updateEntityPosition2D(currentActiveEntityOffset);
}

/// $C09FB0
void updateEntityPosition2D(short arg1) {
	short i = arg1 / 2;
	FixedPoint1616 newPosition;

	newPosition.combined = fullEntityAbsX(i).combined + fullEntityDeltaX(i).combined;
	entityAbsXTable[i] = newPosition.integer;
	entityAbsXFractionTable[i] = newPosition.fraction;

	newPosition.combined = fullEntityAbsY(i).combined + fullEntityDeltaY(i).combined;
	entityAbsYTable[i] = newPosition.integer;
	entityAbsYFractionTable[i] = newPosition.fraction;
}

/// $C09FAE
void actionScriptFadeOut(short, ref const(ubyte)* arg1) {
	ubyte a = (arg1++)[actionScriptScriptOffset];
	ubyte b = (arg1++)[actionScriptScriptOffset];
	fadeOut(a, b);
}

/// $C09F??
void actionScriptNoPhysics() {
	//nothing!
}

/// $C09FF1
void updateEntityPosition3D() {
	updateActiveEntityPosition2D();
	FixedPoint1616 newPosition;

	newPosition.combined = fullEntityAbsZ(currentActiveEntityOffset / 2).combined + fullEntityDeltaZ(currentActiveEntityOffset / 2).combined;
	entityAbsZFractionTable[currentActiveEntityOffset / 2] = newPosition.fraction;
	entityAbsZTable[currentActiveEntityOffset / 2] = newPosition.integer;
	updateEntitySurfaceFlags();
}

/// $C0A00C
void updateEntityPosition3DIgnoreSurface() {
	updateActiveEntityPosition2D();
	entityAbsZFractionTable[currentActiveEntityOffset / 2] += entityDeltaZFractionTable[currentActiveEntityOffset / 2];
	entityAbsZTable[currentActiveEntityOffset / 2] += entityDeltaZTable[currentActiveEntityOffset / 2];
}

/// $C0A023
void updateScreenPositionBG12D() {
	entityScreenXTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsXTable[currentActiveEntityOffset / 2] - bg1XPosition);
	entityScreenYTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsYTable[currentActiveEntityOffset / 2] - bg1YPosition);
}

/// $C0A039
void updateScreenPositionNoOp() {
	//nothing
}

/// $C0A03A
void updateScreenPositionBG13D() {
	entityScreenXTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsXTable[currentActiveEntityOffset / 2] - bg1XPosition);
	entityScreenYTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsYTable[currentActiveEntityOffset / 2] - bg1YPosition - entityAbsZTable[currentActiveEntityOffset / 2]);
}

/// $C0A055
void updateScreenPositionBG32D() {
	entityScreenXTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsXTable[currentActiveEntityOffset / 2] - bg3XPosition);
	entityScreenYTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsYTable[currentActiveEntityOffset / 2] - bg3YPosition);
}

/// $C0A06C
void moveRelativeToBG3() {
	entityScreenXTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsXTable[currentActiveEntityOffset / 2] - bg3XPosition);
	entityAbsXTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsXTable[currentActiveEntityOffset / 2] - bg3XPosition);
	entityScreenYTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsYTable[currentActiveEntityOffset / 2] - bg3YPosition);
	entityAbsYTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsYTable[currentActiveEntityOffset / 2] - bg3YPosition);
}

/// $C0A0A0
void updateScreenPositionBG13DDupe() {
	entityScreenXTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsXTable[currentActiveEntityOffset / 2] - bg3XPosition);
	entityScreenYTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsYTable[currentActiveEntityOffset / 2] - bg3YPosition - entityAbsZTable[currentActiveEntityOffset / 2]);
}

/// $C0A0BB
void updateEntityPositionAbsolute() {
	entityScreenXTable[currentActiveEntityOffset / 2] = entityAbsXTable[currentActiveEntityOffset / 2];
	entityScreenYTable[currentActiveEntityOffset / 2] = entityAbsYTable[currentActiveEntityOffset / 2];
}

/// $C0A0CA
void actionScriptDrawEntity(short entityOffset) {
	assert(entityOffset >= 0);
	currentActiveEntityOffset = cast(ushort)(entityOffset * 2);
	unknownC0A0E3(currentActiveEntityOffset, (entityOffset * 2) < 0);
}

/// $C0A0E3
void unknownC0A0E3(short arg1, bool overflowed) {
	if (((entitySpriteMapFlags[arg1 / 2] & SpriteMapFlags.drawDisabled) != 0) || overflowed) {
		return;
	}
	actionScriptSpritemap = entitySpriteMapPointers[arg1 / 2];
	if (entityAnimationFrames[arg1 / 2] >= 0) {
		entityDrawCallbacks[arg1 / 2](entityAnimationFrames[arg1 / 2], arg1);
	}
}

/// $C0A0FA
void unknownC0A0FA(short arg1, short arg2) {
	spritemapBank = actionScriptSpritemapBank;
	currentSpriteDrawingPriority = entityDrawPriority[arg2 / 2];
	// This uses a double pointer to the spritemap, indexed by the animation frame.
	// Don't use the value in 8C!
	drawSprite(entitySpriteMapPointersDptr[arg2 / 2][arg1], entityAbsXTable[arg2 / 2], entityAbsYTable[arg2 / 2]);
}

/// $C0A11C
void checkHardware() {
	//AntiPiracyScratchSpace = 0x30;
	//AntiPiracyMirrorTest = 0x31;
	if (false/*AntiPiracyScratchSpace != AntiPiracyMirrorTest*/) {
		displayCopyrightWarningScreen();
	}
	if ((STAT78 & 0x10) != 0) {
		displayFaultyGamepakScreen();
	}
}

/// $C0A1??
short loadMapBlockF(short x, short y) {
	return loadMapBlock(x, y);
}

/// Loads the map block at (x,y)
/// Params:
///	x = X coordinate of the block
///	y = Y coordinate of the block
/// Mutates:
///	cachedMapBlockX = cached X coordinate
///	cachedMapBlockY = cached Y coordinate
/// Original_Address: $(DOLLAR)C0A156
short loadMapBlock(short x, short y) {
	if ((x | y) < 0) {
		return -1;
	}
	if ((x == cachedMapBlockX) && (y == cachedMapBlockY)) {
		return cachedMapBlock;
	}
	cachedMapBlockX = x;
	cachedMapBlockY = y;

	ushort tmp1 = mapBlockArrangements[8 + !!(y & 4)][((y / 8) * 256) | x];
	ushort upperBits;
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
			upperBits = (tmp1 & 3) * 256;
			break;
		default: assert(0);
	}
	ushort tmp = mapBlockArrangements[y & 7][((y / 8) * 256) | x];
	cachedMapBlock = (cast(ubyte)tmp) | upperBits;
	return cachedMapBlock;
}

unittest {
	if (romDataLoaded) {
		assert(loadMapBlock(0xF8, 0x2C) == 0xA7);
	}
}

/// $C0A1F2
void copyMapPaletteFrame(short arg1) {
	const(ubyte)* source = cast(const(ubyte)*)animatedMapPaletteBuffers[arg1];
	ubyte* destination = cast(ubyte*)&palettes[2][0];
	short bytesLeft = 0xBF;
	while (--bytesLeft >= 0) {
		*(destination++) = *(source++);
	}
	paletteUploadMode = PaletteUpload.bgOnly;
}

__gshared const ubyte*[8] animatedMapPaletteBuffers;

/// $C0A21C
short unknownC0A21C(short arg1) {
	short y = firstEntity;
	while (y >= 0) {
		if (arg1 == entityNPCIDs[y / 2]) {
			return arg1;
		}
		y = entityNextEntityTable[y / 2];
	}
	return 0;
}

/// $C0A254
void recalculateEntityScreenPosition(short arg1) {
	entityScreenXTable[arg1] = cast(short)(entityAbsXTable[arg1] - bg1XPosition);
	entityScreenYTable[arg1] = cast(short)(entityAbsYTable[arg1] - bg1YPosition);
}

/// $C0A26B
void unknownC0A26B() {
	if ((currentActiveEntityOffset == currentLeadingPartyMemberEntity) || ((entityScriptVar7Table[currentActiveEntityOffset / 2] & 0) != 0) || (notMovingInSameDirectionFaced != 0) || (entityDirections[currentActiveEntityOffset / 2] != currentLeaderDirection) || (unknownC0A350[entityDirections[currentActiveEntityOffset / 2]](currentLeadingPartyMemberEntity) * 2 != 0)) {
		entityScreenXTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsXTable[currentActiveEntityOffset / 2] - bg1XPosition);
		entityScreenYTable[currentActiveEntityOffset / 2] = cast(short)(entityAbsYTable[currentActiveEntityOffset / 2] - bg1YPosition);
	}
	//return currentActiveEntityOffset;
}

/// $C0A2AB
immutable short[6] unknownC0A2AB = [ 0, 17, 32, 47, 62, 77 ];

/// $C0A2B7
short unknownC0A2B7(short entityOffset) {
	short a = entityScreenXTable[entityOffset / 2] ^ entityScreenXTable[currentActiveEntityOffset / 2];
	if (a != 0) {
		return a;
	}
	a = cast(short)(entityAbsYTable[entityOffset / 2] - entityAbsYTable[currentActiveEntityOffset / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	a -= unknownC0A2AB[entityScriptVar5Table[currentActiveEntityOffset / 2] / 2];
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	if (a == 0) {
		return a;
	}
	return cast(short)(a - 1);
}

/// $C0A2E1
short unknownC0A2E1(short entityOffset) {
	short a = entityScreenYTable[entityOffset / 2] ^ entityScreenYTable[currentActiveEntityOffset / 2];
	if (a != 0) {
		return a;
	}
	a = cast(short)(entityAbsXTable[entityOffset / 2] - entityAbsXTable[currentActiveEntityOffset / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	a -= unknownC0A2AB[entityScriptVar5Table[currentActiveEntityOffset / 2] / 2];
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
short unknownC0A317(short entityOffset) {
	short a = cast(short)(entityAbsXTable[entityOffset / 2] - entityAbsXTable[currentActiveEntityOffset / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	short actionScriptVar00s = a;
	if (actionScriptVar00s < unknownC0A30B[entityScriptVar5Table[currentActiveEntityOffset / 2] / 2]) {
		return actionScriptVar00s;
	}
	a = cast(short)(entityAbsYTable[entityOffset / 2] - entityAbsYTable[currentActiveEntityOffset / 2]);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	a -= actionScriptVar00s;
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
	Direction.up: &unknownC0A2B7,
	Direction.upRight: &unknownC0A317,
	Direction.right: &unknownC0A2E1,
	Direction.downRight: &unknownC0A317,
	Direction.down: &unknownC0A2B7,
	Direction.downLeft: &unknownC0A317,
	Direction.left: &unknownC0A2E1,
	Direction.upLeft: &unknownC0A317,
];

/// $C0A360
void unknownC0A360() {
	if (entityPathfindingState[currentActiveEntityOffset / 2] >= 0) {
		if ((entityObstacleFlags[currentActiveEntityOffset / 2] & 0xD0) != 0) {
			actionScriptCommand39(null);
			return;
		} else if ((entityCollidedObjects[currentActiveEntityOffset / 2] & 0x8000) == 0) {
			return;
		}
	}
	unknownC0A37ACommon(currentActiveEntityOffset);
}

/// $C0A37A
void unknownC0A37A() {
	unknownC0A37ACommon(currentActiveEntityOffset);
}

void unknownC0A37ACommon(short arg1) {
	updateEntityPosition2D(arg1);
	updateEntitySurfaceFlags();
}

/// $C0A384
void unknownC0A384() {
	if (entityPathfindingState[currentActiveEntityOffset / 2] >= 0) {
		if ((entityObstacleFlags[currentActiveEntityOffset / 2] & 0xD0) != 0) {
			actionScriptCommand39(null);
			return;
		} else if ((entityCollidedObjects[currentActiveEntityOffset / 2] & 0x8000) == 0) {
			return;
		}
	}
	unknownC0A384Common(currentActiveEntityOffset);
}

// unused
void unknownC0A384Alt() {
	unknownC0A384Common(currentActiveEntityOffset);
}

void unknownC0A384Common(short arg1) {
	updateEntityPosition2D(arg1);
}

/// $C0A3A4
// originally handwritten assembly, id was actually an offset
void unknownC0A3A4(short, short id) {
	if ((entityCurrentDisplayedSprites[id / 2] !is null) && ((entityCurrentDisplayedSprites[id / 2].lsb & 1) != 0)) {
		actionScriptSpritemap += entitySpriteMapSizes[id / 2] / 5;
	}
	ubyte upperBodyPriority = 3 << 4;
	ubyte lowerBodyPriority = 3 << 4;
	if ((entitySurfaceFlags[id / 2] & SurfaceFlags.obscureLowerBody) != 0) {
		lowerBodyPriority = 2 << 4;
	}
	if ((entitySurfaceFlags[id / 2] & SurfaceFlags.obscureUpperBody) != 0) {
		upperBodyPriority = 2 << 4;
	}
	byte y = -1;
	for (ubyte i = entityUpperLowerBodyDivide[id / 2] >> 8; (--i & 0x80) == 0; ) {
		y++;
		(cast()actionScriptSpritemap[y]).flags = (actionScriptSpritemap[y].flags & 0xCF) | upperBodyPriority;
	}
	for (ubyte i = entityUpperLowerBodyDivide[currentActiveEntityOffset / 2] & 0xFF; (--i & 0x80) == 0; ) {
		y++;
		(cast()actionScriptSpritemap[y]).flags = (actionScriptSpritemap[y].flags & 0xCF) | lowerBodyPriority;
	}
	spritemapBank = actionScriptSpritemapBank;
	currentSpriteDrawingPriority = entityDrawPriority[currentActiveEntityOffset / 2];
	if ((entityDrawPriority[currentActiveEntityOffset / 2] & DrawPriority.parent) != 0) {
		// if parent bit is set, use parent entity's draw priority
		currentSpriteDrawingPriority = entityDrawPriority[currentSpriteDrawingPriority & 0x3F];
		// clear the priority unless otherwise requested
		if ((entityDrawPriority[currentActiveEntityOffset / 2] & DrawPriority.dontClearIfParent) == 0) {
			entityDrawPriority[currentActiveEntityOffset / 2] = 0;
		}
	}
	unknownC0AC43();
	spritemapBank = actionScriptSpritemapBank;
	drawSprite(actionScriptSpritemap, entityScreenXTable[currentActiveEntityOffset / 2], entityScreenYTable[currentActiveEntityOffset / 2]);
}

/// $C0A443
//what a mess
void unknownC0A443() {
	ubyte actionScriptVar00 = (playerHasMovedSinceMapLoad + currentEntitySlot >> 3) & 1;
	ubyte actionScriptVar02 = cast(ubyte)((entityDirections[currentActiveEntityOffset / 2] * 2) | actionScriptVar00);
	if (((entityWalkingStyles[currentActiveEntityOffset / 2] >> 8) | ((entityWalkingStyles[currentActiveEntityOffset / 2] &0xFF) << 8) | actionScriptVar02) == entityAnimationFingerprints[currentActiveEntityOffset / 2]) {
		return;
	}
	entityAnimationFingerprints[currentActiveEntityOffset / 2] = cast(short)((entityWalkingStyles[currentActiveEntityOffset / 2] >> 8) | ((entityWalkingStyles[currentActiveEntityOffset / 2] &0xFF) << 8) | actionScriptVar02);

	updateEntitySpriteCurrentCommon();
}

/// $C0A472
void updateEntitySpriteCurrentFrameCounter() {
	useSecondSpriteFrame = (frameCounter >> 3) & 1;
	updateEntitySpriteCurrentCommon();
}
void updateEntitySpriteCurrent() {
	updateEntitySpriteByFrameVarCommon(currentActiveEntityOffset);
}
void updateEntitySprite(short arg1) {
	updateEntitySpriteByFrameVarCommon(cast(short)(arg1 * 2));
}
void updateEntitySpriteByFrameVarCommon(short arg1) {
	useSecondSpriteFrame = entityAnimationFrames[arg1 / 2];
	updateEntitySpriteOffset(arg1);
}
void updateEntitySpriteCurrentFrame0() {
	useSecondSpriteFrame = 0;
	// BUG: The result is never checked. The game uses the stack address to determine whether or not to update the sprite.
	// The function fails to update sprites in several cases anyway, so there's nothing that needs to be fixed here...
	unknownC0C711();
	if (1 != 0) {
		updateEntitySpriteCurrentCommon();
	}
}
void updateEntitySpriteCurrentFrame1() {
	useSecondSpriteFrame = 1;
	// see above
	unknownC0C711();
	if (1 != 0) {
		updateEntitySpriteCurrentCommon();
	}
}
void updateEntitySpriteCurrentFrame0Forced() {
	useSecondSpriteFrame = 0;
	updateEntitySpriteCurrentCommon();
}
void updateEntitySpriteCurrentCommon() {
	updateEntitySpriteOffset(currentActiveEntityOffset);
}
void updateEntitySpriteOffset(short arg1) {
	ubyte actionScriptVar00 = cast(ubyte)(entityTileHeights[arg1 / 2]);
	dmaCopySize = entityByteWidths[arg1 / 2];
	dmaCopyVRAMDestination = entityVramAddresses[arg1 / 2];
	//x04 = EnttiyGraphicsPointerHigh[arg1 / 2]
	OverworldSpriteGraphics* x02 = entityGraphicsPointers[arg1 / 2];
	assert(x02 !is null, "No sprite to update!");
	if (spriteDirectionMappings4Direction[entityDirections[arg1 / 2]] != 0) {
		for (short i = spriteDirectionMappings4Direction[entityDirections[arg1 / 2]]; i > 0; i--) {
			x02 += 2;
		}
	}
	if (useSecondSpriteFrame != 0) {
		x02 += 1;
	}
	if (((x02.lsb & 2) == 0) && (entitySurfaceFlags[arg1 / 2] & SurfaceFlags.shallowWater) != 0) {
		dmaCopyMode = 3;
		dmaCopyRAMSource = &blankTiles;
		uploadSpriteTileRow();
		if (--actionScriptVar00 == 0) {
			return;
		}
		if ((entitySurfaceFlags[arg1 / 2] & SurfaceFlags.causesSunstroke) != 0) {
			uploadSpriteTileRow();
			if (--actionScriptVar00 == 0) {
				return;
			}
		}
	}
	entityCurrentDisplayedSprites[arg1 / 2] = x02;
	//Original code:
	//dmaCopyRAMSource = cast(void*)((*x02) & 0xFFF0);
	//dmaCopyRAMSource + 2 = UNKNOWN_30X2_TABLE_31[arg1 / 2];
	dmaCopyRAMSource = sprites[x02.id].ptr;
	dmaCopyMode = 0;
	while (true) {
		uploadSpriteTileRow();
		if (--actionScriptVar00 == 0) {
			return;
		}
		dmaCopyRAMSource += dmaCopySize;
	}
}

/// $C0A56E
void uploadSpriteTileRow() {
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
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	entityNPCIDs[currentActiveEntityOffset / 2] = setDirection(tmp, arg2);
}

/// $C0A651
short setDirection8(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead8(arg2);
	actionScriptLastRead = arg2;
	entityMovingDirection[currentActiveEntityOffset / 2] = setDirection(tmp, arg2);
	return 0;
}

/// $C0A65F
short setDirection(short arg1, ref const(ubyte)*) {
	if (entityPathfindingState[currentActiveEntityOffset / 2] >= 0) {
		entityDirections[currentActiveEntityOffset / 2] = arg1;
	}
	return arg1;
}

/// $C0A66D
void unknownC0A66D(short arg1) {
	entityDirections[currentActiveEntityOffset / 2] = arg1;
}

/// $C0A673
short unknownC0A673() {
	return entityDirections[currentActiveEntityOffset / 2];
}

/// $C0A679
short setSurfaceFlags(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead8(arg2);
	actionScriptLastRead = arg2;
	entitySurfaceFlags[currentActiveEntityOffset / 2] = tmp;
	return 0;
}

/// $C0A685
void actionScriptSetMovementSpeedConstant(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	setMovementSpeed(tmp, arg2);
}

/// $C0A685
void setMovementSpeed(short arg1, ref const(ubyte)* arg2) {
	entityMovementSpeed[currentActiveEntityOffset / 2] = arg1;
}

/// $C0A691
short getMovementSpeed() {
	return entityMovementSpeed[currentActiveEntityOffset / 2];
}

/// $C0A6A2
void unknownC0A6A2(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	unknownC0CA4E(tmp);
}

/// $C0A6AD
void unknownC0A6AD(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	unknownC0CBD3(tmp);
}

/// $C0A6B8
short unknownC0A6B8() {
	short tmp = 0;
	if ((entityCollidedObjects[currentActiveEntityOffset / 2] & 0x8000) == 0) {
		tmp--;
	}
	return tmp;
}

/// $C0A6DA
short clearCurrentEntityCollision(short, ref const(ubyte)* arg2) {
	entityCollidedObjects[currentActiveEntityOffset / 2] = 0xFFFF;
	return 0;
}

/// $C0A6D1
short disableCurrentEntityCollision(short, ref const(ubyte)* arg2) {
	entityCollidedObjects[currentActiveEntityOffset / 2] = 0x8000;
	return 0;
}

/// $C0A6E3
void unknownC0A6E3() {
	short a;
	spriteUpdateEntityOffset = currentActiveEntityOffset;
	// new direction this frame?
	if (((entityWalkingStyles[currentActiveEntityOffset / 2] >> 8) | entityDirections[currentActiveEntityOffset / 2]) != entityAnimationFingerprints[currentActiveEntityOffset / 2]) {
		entityAnimationFingerprints[currentActiveEntityOffset / 2] = (entityWalkingStyles[currentActiveEntityOffset / 2] >> 8) | entityDirections[currentActiveEntityOffset / 2];
		updateEntitySpriteFrameCurrent();
		return;
	}
	if (entityScriptVar7Table[currentActiveEntityOffset / 2] < 0) {
		entityScriptVar7Table[currentActiveEntityOffset / 2] &= ~PartyMemberMovementFlags.unknown15;
		goto Unknown5;
	}
	// animation frame updated
	if ((entityScriptVar7Table[currentActiveEntityOffset / 2] & PartyMemberMovementFlags.unknown13) != 0) {
		if (entityAnimationFrames[currentActiveEntityOffset / 2] == 0) {
			goto Unknown6;
		} else {
			entityAnimationFrames[currentActiveEntityOffset / 2] = 0;
			goto Unknown5;
		}
	}
	if (battleSwirlCountdown != 0) {
		goto Unknown6;
	}
	if (--entityScriptVar2Table[currentActiveEntityOffset / 2] > 0) {
		goto Unknown6;
	}
	entityScriptVar2Table[currentActiveEntityOffset / 2] = entityScriptVar3Table[currentActiveEntityOffset / 2];
	entityAnimationFrames[currentActiveEntityOffset / 2] ^= 2;
	if (entityAnimationFrames[currentActiveEntityOffset / 2] != 0) {
		goto Unknown5;
	}
	if (currentActiveEntityOffset == footstepSoundIgnoreEntity) {
		goto Unknown5;
	}
	a = footstepSoundTable[(footstepSoundIDOverride == 0) ? (footstepSoundID / 2) : (footstepSoundIDOverride / 2)];
	if ((a != 0) && (disabledTransitions == 0)) {
		playSfx(a);
	}
	Unknown5:
	updateEntitySpriteFrameCurrent();
	Unknown6:
	if (psiTeleportDestination != 0) {
		return;
	}
	if (playerIntangibilityFrames == 0) {
		return;
	}
	if (playerIntangibilityFrames < 45) {
		a = playerIntangibilityFrames & 3;
	} else if ((playerIntangibilityFrames & 1) == 0) {
		a = cast(short)(entitySpriteMapFlags[currentActiveEntityOffset / 2] | SpriteMapFlags.drawDisabled);
	} else {
		a = entitySpriteMapFlags[currentActiveEntityOffset / 2] & ~SpriteMapFlags.drawDisabled;
	}
	entitySpriteMapFlags[currentActiveEntityOffset / 2] = a;
}

/// $C0A780
void updateEntitySpriteFrame(short arg1) {
	spriteUpdateEntityOffset = cast(short)(arg1 * 2);
	updateEntitySpriteFrameCurrent();
}

/// $C0A794
void updateEntitySpriteFrameCurrent() {
	ushort x00 = entityTileHeights[spriteUpdateEntityOffset / 2];
	dmaCopySize = entityByteWidths[spriteUpdateEntityOffset / 2];
	dmaCopyVRAMDestination = entityVramAddresses[spriteUpdateEntityOffset / 2];
	const(OverworldSpriteGraphics)* x02 = (entityGraphicsPointers[spriteUpdateEntityOffset / 2] + spriteDirectionMappings8Direction[entityDirections[spriteUpdateEntityOffset / 2]] * 2 + entityAnimationFrames[spriteUpdateEntityOffset / 2] / 2);
	if (((x02.lsb & 2) == 0) && ((entitySurfaceFlags[spriteUpdateEntityOffset / 2] & SurfaceFlags.shallowWater) != 0)) {
		dmaCopyMode = 3;
		dmaCopyRAMSource = &blankTiles;
		uploadSpriteTileRow();
		if (--x00 == 0) {
			return;
		}
		if ((entitySurfaceFlags[spriteUpdateEntityOffset / 2] & SurfaceFlags.causesSunstroke) != 0) {
			uploadSpriteTileRow();
			x00--;
			return;
		}
	}
	entityCurrentDisplayedSprites[spriteUpdateEntityOffset / 2] = x02;
	//Original code:
	//dmaCopyRAMSource = (*x02) & 0xFFFE;
	//dmaCopyRAMSource + 2 = UNKNOWN_30X2_TABLE_31[spriteUpdateEntityOffset / 2];
	dmaCopyRAMSource = sprites[x02.id].ptr;
	dmaCopyMode = 0;
	while (true) {
		uploadSpriteTileRow();
		if (--x00 == 0) {
			break;
		}
		dmaCopyRAMSource += dmaCopySize;
	}
}

/// $C0A82F
short disableCurrentEntityCollision2(short, ref const(ubyte)* arg2) {
	entityCollidedObjects[currentActiveEntityOffset / 2] = 0x8000;
	return 0;
}

/// $C0A838
short clearCurrentEntityCollision2(short, ref const(ubyte)* arg2) {
	entityCollidedObjects[currentActiveEntityOffset / 2] = 0xFFFF;
	return 0;
}

/// $C0A841
void actionScriptPlaySFX(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	return playSfx(tmp);
}

/// $C0A84C
short actionScriptGetEventFlag(short, ref const(ubyte)* arg2) {
	short flag = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	return getEventFlag(flag);
}

/// $C0A857
void actionScriptSetEventFlag(short arg1, ref const(ubyte)* arg2) {
	short flag = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	setEventFlag(flag, arg1);
}

/// $C0A864
void actionScriptMoveEntityToPartyMember(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead8(arg2);
	actionScriptLastRead = arg2;
	moveEntityToPartyMember(tmp);
}

/// $C0A86F
void actionScriptMoveEntityToSprite(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	moveEntityToSprite(tmp);
}

/// $C0A87A
void unknownC0A87A(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp2 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	unknownC46CF5(tmp2, tmp);
}

/// $C0A88D
void actionScriptQueueInteraction8(short, ref const(ubyte)* arg2) {
	string tmp = actionScriptReadString(arg2);
	actionScriptLastRead = arg2;
	queueInteraction8(getTextBlock(tmp));
}

/// $C0A8A0
void actionScriptDisplayTextNow(short, ref const(ubyte)* arg2) {
	string tmp = actionScriptReadString(arg2);
	actionScriptLastRead = arg2;
	displayTextForActionScript(getTextBlock(tmp));
}

/// $C0A8B3
void actionScriptCopyAdjustedXYToVars(short, ref const(ubyte)* arg2) {
	short x = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short y = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	copyAdjustedXYToVars(y, x);
}

/// $C0A8C6
short actionScriptMoveActiveEntityTowardsDestination() {
	return moveActiveEntityTowardsDestination(0, 0);
}

/// $C0A8D1
short actionScriptMoveActiveEntityTowardsDestinationFaceOpposite() {
	return moveActiveEntityTowardsDestination(1, 0);
}

/// $C0A8DC
short actionScriptMoveActiveEntityTowardsDestinationNoDirChange() {
	return moveActiveEntityTowardsDestination(0, 1);
}

/// $C0A8E7
void actionScriptSpiralMovement() {
	entitySpiralMovement(0);
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
	short tmp = actionScriptRead8(arg2);
	actionScriptLastRead = arg2;
	prepareNewEntityAtTeleportDestination(tmp);
	return 0;
}

/// $C0A912
short actionScriptPrepareNewEntity(short, ref const(ubyte)* arg1) {
	short tmp = actionScriptRead16(arg1);
	actionScriptLastRead = arg1;
	short tmp2 = actionScriptRead16(arg1);
	actionScriptLastRead = arg1;
	short tmp3 = actionScriptRead8(arg1);
	actionScriptLastRead = arg1;
	prepareNewEntity(tmp3, tmp, tmp2);
	return 0;
}

/// $C0A92D
void actionScriptFindNPCLocationForActiveEntity(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	findNPCLocationForActiveEntity(tmp);
}

/// $C0A938
void unknownC0A938(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	unknownC46BBB(tmp);
}

/// $C0A943
short actionScriptGetPositionOfPartyMember(short, ref const(ubyte)* arg1) {
	short tmp1 = actionScriptRead8(arg1);
	actionScriptLastRead = arg1;
	getPositionOfPartyMember(tmp1);
	return 0;
}

/// $C0A94E
void actionScriptMakeNPCLookAtActiveEntity(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	makeNPCLookAtActiveEntity(tmp);
}

/// $C0A959
void actionScriptMakeSpriteLookAtActiveEntity(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	makeSpriteLookAtActiveEntity(tmp);
}

/// $C0A964
void actionScriptSetEntityBoundaries(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp2 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	setEntityBoundaries(tmp, tmp2);
}

/// $C0A977
short actionScriptLoadBattleBG(short, ref const(ubyte)* arg1) {
	short tmp = actionScriptRead16(arg1);
	actionScriptLastRead = arg1;
	short tmp2 = actionScriptRead16(arg1);
	actionScriptLastRead = arg1;
	loadBackgroundAnimation(tmp, tmp2);
	return 0;
}

/// $C0A98B
short actionScriptSpawnEntityAtSelf(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp2 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	return spawnEntityAtSelf(tmp, tmp2);
}

/// $C0A99F
short actionScriptCreateEntityAtV01PlusBG3Y(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp2 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	return createEntityAtV01PlusBG3Y(tmp, tmp2);
}

/// $C0A9B3
void actionScriptPrintCastName(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp2 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp3 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	printCastName(tmp, tmp2, tmp3);
}

/// $C0A9CF
void actionScriptPrintCastNameParty(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp2 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp3 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	printCastNameParty(tmp, tmp2, tmp3);
}

/// $C0A9EB
void actionScriptPrintCastNameEntityVar0(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp2 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp3 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	printCastNameEntityVar0(tmp, tmp2, tmp3);
}

/// $C0AA23
void actionScriptEnableStageHDMA(short, ref const(ubyte)* arg2) {
	short tmp = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp2 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short tmp3 = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	enableStageHDMA(tmp, tmp2, tmp3);
}

/// $C0AA3F
void unknownC0AA3F(short arg1, ref const(ubyte)* arg2) {
	short x = (--arg1 != 0) ? 0x33 : 0xB3;
	actionscriptCOLDATABlue = cast(ubyte)actionScriptRead8(arg2);
	actionScriptLastRead = arg2;
	actionscriptCOLDATAGreen = cast(ubyte)actionScriptRead8(arg2);
	actionScriptLastRead = arg2;
	actionscriptCOLDATARed = cast(ubyte)actionScriptRead8(arg2);
	actionScriptLastRead = arg2;
	unknownC42439(x);
}

/// $C0AA6E
void actionScriptUpdateSpriteDirection(short, ref const(ubyte)* arg2) {
	if (entityScriptVar0Table[currentActiveEntityOffset / 2] == 0) {
		entityDirections[currentActiveEntityOffset / 2] = cast(ubyte)actionScriptRead8(arg2);
		actionScriptLastRead = arg2;
		useSecondSpriteFrame = entityAnimationFrames[currentActiveEntityOffset / 2] = cast(ubyte)actionScriptRead8(arg2);
		actionScriptLastRead = arg2;
		updateEntitySpriteOffset(currentActiveEntityOffset);
	} else {
		entityDirections[currentActiveEntityOffset / 2] = cast(ubyte)actionScriptRead8(arg2);
		actionScriptLastRead = arg2;
		entityAnimationFrames[currentActiveEntityOffset / 2] = cast(ubyte)(actionScriptRead8(arg2) * 2);
		actionScriptLastRead = arg2;
		spriteUpdateEntityOffset = currentActiveEntityOffset;
		updateEntitySpriteFrameCurrent();
	}
}

/// $C0AAAC
void unknownC0AAAC() {
	spriteUpdateEntityOffset = currentActiveEntityOffset;
	updateEntitySpriteFrameCurrent();
}

/// $C0AAB5
void actionScriptPerformPaletteFade(short, ref const(ubyte)* arg2) {
	short affectedPalettes = actionScriptRead16(arg2);
	actionScriptLastRead = arg2;
	short multiplier = actionScriptRead8(arg2);
	actionScriptLastRead = arg2;
	short duration = actionScriptRead8(arg2);
	actionScriptLastRead = arg2;
	performPaletteFade(duration, multiplier, affectedPalettes);
}

/// $C0AACD
short unknownC0AACD() {
	return 2;
}

/// $C0AAD5
void actionScriptJumpToLabelNTimes(short, ref const(ubyte)* arg2) {
	actionScriptVar90 = cast(short)(actionScriptRead8(arg2) + 1);
	actionScriptLastRead = arg2;
	actionScriptJumpDestination = cast(const(ubyte)*)actionScriptReadPtr(arg2);
	actionScriptLastRead = arg2;
	//offset is just an estimate...
	if (actionScriptStack[4].counter == 0) {
		actionScriptStack[4].counter = cast(ubyte)actionScriptVar90;
	}
	if (--actionScriptStack[4].counter != 0) {
		actionScriptLastRead = actionScriptJumpDestination;
	}
}

/// $C0AAFD
void unknownC0AAFD() {
	//offset is just an estimate...
	actionScriptStack[4].counter = 0;
}

/// $C0AA07
void actionScriptFadeOutWithMosaic(short, ref const(ubyte)* arg1) {
	short tmp1 = actionScriptRead16(arg1);
	actionScriptLastRead = arg1;
	short tmp2 = actionScriptRead16(arg1);
	actionScriptLastRead = arg1;
	short tmp3 = actionScriptRead16(arg1);
	actionScriptLastRead = arg1;
	fadeOutWithMosaic(tmp1, tmp2, tmp3);
}

/// $C0ABC6
void stopMusic() {
	stopMusicExternal();
	currentMusicTrack = 0xFFFF;
}

/// $C0ABE0 - Play a sound effect
void playSfx(short sfx) {
	playSFX(cast(ubyte)sfx);
}
void playSfxUnknown() {
	playSFX(0);
}

/// $C0AC0C
void musicEffect(short arg1) {
	doMusicEffect(arg1);
}

/// $C0AC43
void unknownC0AC43() {
	spritemapBank = 0xC4;
	ubyte actionScriptVar04 = 0xC4;
	ubyte actionScriptVar00 = ((entitySurfaceFlags[currentActiveEntityOffset / 2] & 1) != 0) ? 1 : 0;
	switch (entitySurfaceFlags[currentActiveEntityOffset / 2] & SurfaceFlags.deepWater) {
		default:
			if (entityByteWidths[currentActiveEntityOffset / 2] == 0x40) {
				if (entityRippleNextUpdateFrames[currentActiveEntityOffset / 2] == 0) {
					entityRippleOverlayPtrs[currentActiveEntityOffset / 2] = updateOverlayFrame(&entityRippleSpritemaps[currentActiveEntityOffset / 2], entityRippleNextUpdateFrames[currentActiveEntityOffset / 2], entityRippleOverlayPtrs[currentActiveEntityOffset / 2]);
				}
				entityRippleNextUpdateFrames[currentActiveEntityOffset / 2]--;
				drawSprite(entityRippleSpritemaps[currentActiveEntityOffset / 2] + actionScriptVar00, entityScreenXTable[currentActiveEntityOffset / 2], entityScreenYTable[currentActiveEntityOffset / 2]);
			} else {
				if (entityBigRippleNextUpdateFrames[currentActiveEntityOffset / 2] == 0) {
					entityBigRippleOverlayPtrs[currentActiveEntityOffset / 2] = updateOverlayFrame(&entityBigRippleSpritemaps[currentActiveEntityOffset /2], entityBigRippleNextUpdateFrames[currentActiveEntityOffset / 2], entityBigRippleOverlayPtrs[currentActiveEntityOffset / 2]);
				}
				entityBigRippleNextUpdateFrames[currentActiveEntityOffset / 2]--;
				drawSprite(entityBigRippleSpritemaps[currentActiveEntityOffset / 2] + actionScriptVar00 + actionScriptVar00, entityScreenXTable[currentActiveEntityOffset / 2], cast(short)(entityScreenYTable[currentActiveEntityOffset / 2] + 8));
			}
			goto case;
		case SurfaceFlags.none:
			if (entityOverlayFlags[currentActiveEntityOffset / 2] == EntityOverlayFlags.none) {
				return;
			}
			if ((entityOverlayFlags[currentActiveEntityOffset / 2] & EntityOverlayFlags.sweating) == 0) {
				break;
			}
			goto case;
		case SurfaceFlags.causesSunstroke:
			if (currentActiveEntityOffset < 46) {
				return;
			}
			if (entitySweatingNextUpdateFrames[currentActiveEntityOffset / 2] == 0) {
				entitySweatingOverlayPtrs[currentActiveEntityOffset / 2] = updateOverlayFrame(&entitySweatingSpritemaps[currentActiveEntityOffset / 2], entitySweatingNextUpdateFrames[currentActiveEntityOffset / 2], entitySweatingOverlayPtrs[currentActiveEntityOffset / 2]);
			}
			entitySweatingNextUpdateFrames[currentActiveEntityOffset / 2]--;
			if (entitySweatingSpritemaps[currentActiveEntityOffset / 2] is null) {
				break;
			}
			drawSprite(entitySweatingSpritemaps[currentActiveEntityOffset / 2] + actionScriptVar00, entityScreenXTable[currentActiveEntityOffset / 2], entityScreenYTable[currentActiveEntityOffset / 2]);
			break;
	}
	if ((entityOverlayFlags[currentActiveEntityOffset / 2] & EntityOverlayFlags.mushroom) == 0) {
		return;
	}
	if (currentActiveEntityOffset < 46) {
		return;
	}
	if (entityMushroomizedNextUpdateFrames[currentActiveEntityOffset / 2] == 0) {
		entityMushroomizedOverlayPtrs[currentActiveEntityOffset / 2] = updateOverlayFrame(&entityMushroomizedSpritemaps[currentActiveEntityOffset / 2], entityMushroomizedNextUpdateFrames[currentActiveEntityOffset / 2], entityMushroomizedOverlayPtrs[currentActiveEntityOffset / 2]);
	}
	entityMushroomizedNextUpdateFrames[currentActiveEntityOffset / 2]--;
	drawSprite(entityMushroomizedSpritemaps[currentActiveEntityOffset / 2] + actionScriptVar00, entityScreenXTable[currentActiveEntityOffset / 2], entityScreenYTable[currentActiveEntityOffset / 2]);
}

/// $C0AD56
const(OverlayScript)* updateOverlayFrame(const(SpriteMap)** arg1, out ushort frames, const(OverlayScript)* overlay) {
	ushort y = 0;
	NextCommand:
	if (overlay[y].command == 1) {
		arg1[0] = overlay[y++].spriteMap;
		goto NextCommand;
	}
	if (overlay[y].command == 3) {
		overlay = overlay[y++].dest;
		goto NextCommand;
	}
	frames = overlay[y++].frames;
	return &overlay[y];
}

/// $C0AD9F
void unknownC0AD9F() {
	setBGOffsetY(3, bg3YPosition);
}

/// $C0ADB2
void doBackgroundDMA(short arg1, short arg2, short arg3) {
	dmaChannels[arg1].BBAD = dmaTargetRegisters[arg2];
	dmaChannels[arg1].DMAP = 0x42;
	ubyte* a;
	if (arg3 == 0) {
		short x = HDMAIndirectTableEntry.sizeof * 2;
		do {
			// The original game code does 16-bit copy here, which copies
			// one byte too many. Do one byte at a time instead.
			animatedBackgroundLayer1HDMATable[x] = (cast(immutable(ubyte)*)&animatedBackgroundLayer1HDMATableTemplate)[x];
			x -= 1;
		} while (x >= 0);
		a = &animatedBackgroundLayer1HDMATable[0];
	} else {
		short x = HDMAIndirectTableEntry.sizeof * 2;
		do {
			animatedBackgroundLayer2HDMATable[x] = (cast(immutable(ubyte)*)&animatedBackgroundLayer2HDMATableTemplate)[x];
			x -= 1;
		} while (x >= 0);
		a = &animatedBackgroundLayer2HDMATable[0];
	}
	dmaChannels[arg1].A1T = a;
	mirrorHDMAEN |= dmaFlags[arg1];
}

/// $C0AE16
immutable ubyte[7] dmaFlags = [ 1 << 0, 1 << 1, 1 << 2, 1 << 3, 1 << 4, 1 << 5, 1 << 6];

/// $C0AE26
const HDMAIndirectTableEntry[3] animatedBackgroundLayer1HDMATableTemplate;

/// $C0AE2D
const HDMAIndirectTableEntry[3] animatedBackgroundLayer2HDMATableTemplate;

shared static this() {
	animatedBackgroundLayer1HDMATableTemplate = [
		HDMAIndirectTableEntry(0xE4, cast(const(ubyte)*)&backgroundHDMABuffer[0]),
		HDMAIndirectTableEntry(0xFC, cast(const(ubyte)*)&backgroundHDMABuffer[100]),
		HDMAIndirectTableEntry(0x00),
	];
	animatedBackgroundLayer2HDMATableTemplate = [
		HDMAIndirectTableEntry(0xE4, cast(const(ubyte)*)&backgroundHDMABuffer[324]),
		HDMAIndirectTableEntry(0xFC, cast(const(ubyte)*)&backgroundHDMABuffer[424]),
		HDMAIndirectTableEntry(0x00),
	];
	animatedMapPaletteBuffers = [
		&animatedMapPaletteBuffer[0],
		&animatedMapPaletteBuffer[0xC0],
		&animatedMapPaletteBuffer[0x180],
		&animatedMapPaletteBuffer[0x240],
		&animatedMapPaletteBuffer[0x300],
		&animatedMapPaletteBuffer[0x3C0],
		&animatedMapPaletteBuffer[0x480],
		&animatedMapPaletteBuffer[0x540],
	];
}

/// $C0AE1D
// WMDATA, BG1HOFS, BG2HOFS, BG3HOFS, BG4HOFS, BG1VOFS, BG2VOFS, BG3VOFS, BG4VOFS
immutable ubyte[9] dmaTargetRegisters = [ 0x80, 0x0D, 0x0F, 0x11, 0x13, 0x0E, 0x10, 0x12, 0x14 ];

/// $C0AE34
void hdmaDisable(short layer) {
	mirrorHDMAEN &= hdmaDisableMasks[layer];
}

/// $C0AE44
immutable ubyte[8] hdmaDisableMasks = [
	0b11111110,
	0b11111101,
	0b11111011,
	0b11110111,
	0b11101111,
	0b11011111,
	0b10111111,
	0b01111111
];

/// $C0AE4C
void loadBackgroundOffsetParameters(short arg1, short arg2, short arg3) {
	backgroundDistortionStyle = arg1;
	backgroundDistortionTargetLayer = arg2;
	backgroundDistortSecondLayer = arg3;
}

/// $C0AE56
void loadBackgroundOffsetParameters2(short arg1) {
	backgroundDistortionCompressionRate = arg1;
}

/// $C0AE5A
void prepareBackgroundOffsetTables(short rippleFrequency, short rippleAmplitude, short distortionSpeed) {
	ushort x03 = cast(ushort)((distortionSpeed & 0xFF) << 8);
	short startOffset = 0;
	short endOffset = 0x1C0;
	short bufferPosition;
	ushort x05;
	if (backgroundDistortSecondLayer != 0) {
		startOffset = 0x1C0;
		endOffset = 0x380;
	}
	if (backgroundDistortionTargetLayer != 0) {
		if (backgroundDistortionStyle < (DistortionStyle.verticalSmooth - 1)) {
			switch (backgroundDistortionTargetLayer - 1) {
				case 0:
					x03 += cast(ushort)(bg1YPosition << 8);
					x05 += cast(ushort)(bg1XPosition << 8);
					break;
				case 1:
					x03 += cast(ushort)(bg2YPosition << 8);
					x05 += cast(ushort)(bg2XPosition << 8);
					break;
				case 2:
					x03 += cast(ushort)(bg3YPosition << 8);
					x05 += cast(ushort)(bg3XPosition << 8);
					break;
				case 3:
					x03 += cast(ushort)(bg4YPosition << 8);
					x05 += cast(ushort)(bg4XPosition << 8);
					break;
				default: break;
			}
		} else {
			switch (backgroundDistortionTargetLayer - 1) {
				case 0:
					x05 = cast(ushort)(bg1YPosition << 8);
					break;
				case 1:
					x05 = cast(ushort)(bg2YPosition << 8);
					break;
				case 2:
					x05 = cast(ushort)(bg3YPosition << 8);
					break;
				case 3:
					x05 = cast(ushort)(bg4YPosition << 8);
					break;
				default: break;
			}
		}
	} else {
		x05 = 0;
	}
	switch(backgroundDistortionStyle) {
		case DistortionStyle.horizontalSmooth - 1:
			bufferPosition = startOffset;
			while (bufferPosition < endOffset) {
				backgroundHDMABuffer[bufferPosition / 2] = cast(ushort)(((rippleAmplitude * sineLookupTable[x03 / 256]) >> 8) + x05);
				x03 += rippleFrequency;
				bufferPosition += 2;
			}
			break;
		case DistortionStyle.horizontalInterlaced - 1:
			bufferPosition = startOffset;
			while (bufferPosition < endOffset) {
				backgroundHDMABuffer[bufferPosition / 2] = cast(ushort)(((rippleAmplitude * sineLookupTable[x03 / 256]) >> 8) + x05);
				x03 += rippleFrequency;
				backgroundHDMABuffer[bufferPosition / 2 + 1] = cast(ushort)(x05 - ((rippleAmplitude * sineLookupTable[x03 / 256]) >> 8));
				x03 += rippleFrequency;
				bufferPosition += 4;
			}
			break;
		case DistortionStyle.verticalSmooth - 1:
			x05 = cast(ushort)(x05 << 8);
			bufferPosition = startOffset;
			while (bufferPosition < endOffset) {
				x05 += backgroundDistortionCompressionRate;
				backgroundHDMABuffer[bufferPosition / 2] = cast(ushort)(((rippleAmplitude * sineLookupTable[x03 / 256]) >> 8) + (x05 / 256));
				x03 += rippleFrequency;
				bufferPosition += 2;
			}
			break;
		case DistortionStyle.unknown - 1:
		default:
			x05 = cast(ushort)(x05 << 8);
			bufferPosition = startOffset;
			while (bufferPosition < endOffset) {
				x05 += backgroundDistortionCompressionRate;
				backgroundHDMABuffer[bufferPosition / 2] = cast(ushort)(((rippleAmplitude * sineLookupTable[x03 / 256]) >> 8) + (x05 / 256));
				x05 += backgroundDistortionCompressionRate;
				x03 += rippleFrequency;
				backgroundHDMABuffer[bufferPosition / 2 + 1] = cast(ushort)((x05 / 256) - ((rippleAmplitude * sineLookupTable[x03 / 256]) >> 8));
				x03 += rippleFrequency;
				bufferPosition += 4;
			}
			break;
	}
}

/// $C0AFCD
void setLayerConfig(short arg1) {
	mirrorTM = layerConfigTMs[arg1];
	mirrorTD = layerConfigTDs[arg1];
	CGWSEL = layerConfigCGWSELs[arg1];
	CGADSUB = layerConfigCGADSUBs[arg1];
}

/// $C0AFF1
immutable ubyte[11] layerConfigTMs = [
	TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1,
	TMTD.obj | TMTD.bg4 | TMTD.bg3 | TMTD.bg2 | TMTD.bg1,
	TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1,
	TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1,
	TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1,
	TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1,
	TMTD.obj | TMTD.bg3 | TMTD.bg1,
	TMTD.obj | TMTD.bg3 | TMTD.bg1,
	TMTD.obj | TMTD.bg3 | TMTD.bg1,
	TMTD.obj | TMTD.bg3 | TMTD.bg1,
	TMTD.obj | TMTD.bg3 | TMTD.bg1
];

/// $C0AFFC
immutable ubyte[10] layerConfigTDs = [
	TMTD.none,
	TMTD.none,
	TMTD.bg4,
	TMTD.bg4,
	TMTD.bg4,
	TMTD.bg4,
	TMTD.bg2,
	TMTD.bg2,
	TMTD.bg2,
	TMTD.bg2
];

/// $C0B006
immutable ubyte[10] layerConfigCGWSELs = [0x00, 0x00, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02];

/// $C0B010
immutable ubyte[10] layerConfigCGADSUBs = [0x00, 0x00, 0x24, 0x64, 0xA4, 0xE4, 0x21, 0x61, 0xA1, 0xE1];

/// $C0B01A
void setColData(ubyte red, ubyte green, ubyte blue) {
	setFixedColourData((red & 0x1F) | 0x20);
	setFixedColourData((green & 0x1F) | 0x40);
	setFixedColourData((blue & 0x1F) | 0x80);
}

/// $C0B039
void setColourAddSubMode(ubyte cgwsel, ubyte cgadsub) {
	CGWSEL = cgwsel;
	CGADSUB = cgadsub;
}

/** Sets window masking registers WxxxSEL, TMW, TSW and WxxxLOG with presets
 * Params:
 * 	layers = Bitmask of masks to enable (see earthbound.commondefs.SwirlMask for values)
 * 	invert = If 0, sets mode to affect the outside of the windows using OR logic, if 1, uses area inside of the windows with AND logic
 * Original_Address: $(DOLLAR)C0B047
 */
void setWindowMask(ushort layers, ushort invert) {
	W12SEL = windowMaskSettingPresets[layers & 3] & ((invert != 0) ? 0b10101010 : 0b11111111);
	W34SEL = windowMaskSettingPresets[(layers>>2) & 3] & ((invert != 0) ? 0b10101010 : 0b11111111);
	WOBJSEL = windowMaskSettingPresets[(layers>>4) & 3] & ((invert != 0) ? 0b10101010 : 0b11111111);
	TMW = layers & 0b00011111;
	TSW = layers & 0b00011111;
	WBGLOG = (invert != 0) ? 0 : 0b01010101;
	WOBJLOG = (invert != 0) ? 0 : 0b01010101;
}

/** Mask setting presets for W12SEL, W34SEL, WOBJSEL used by setWindowMask
 * Original_Address: $(DOLLAR)C0B0A6
 */
immutable ubyte[4] windowMaskSettingPresets = [
	0b00000000, // disable masking on both BG1/BG3/OBJ and BG2/BG4/MATH
	0b00001111, // enable masking only on BG1/BG3/OBJ
	0b11110000, // enable masking only on BG2/BG4/MATH
	0b11111111, // enable masking on both BG1/BG3/OBJ and BG2/BG4/MATH
];

/** Resets windows 1 and 2 by setting the left edge to the right edge of the screen
 * Original_Address: $(DOLLAR)C0B0AA
 */
void resetWindows() {
	WH0 = 0xFF;
	WH2 = 0xFF;
}

/** Enables window HDMA. Destination is fixed to WH0-WH3
 * Params:
 * 	channel = The channel (0 - 7) to set up HDMA on
 * 	table = The HDMA table to use, prefixed with a single byte for HDMA parameters (ie a DMAPx value)
 * Original_Address: $(DOLLAR)C0B0B8
 */
void enableWindowHDMA(short channel, const(ubyte)* table) {
	//dmaChannels[channel].A1B = bank of table;
	//dmaChannels[channel].DASB = bank of table;
	dmaChannels[channel].BBAD = 0x26;
	dmaChannels[channel].DMAP = *table;
	dmaChannels[channel].A1T = &table[1];
	mirrorHDMAEN |= dmaFlags[channel];
}

/// $C0B0EF
void enableSwirlWindowHDMA(ubyte channel, ubyte flags) {
	// Write the table entry for the first 100 lines of window data
	swirlWindowHDMATable[0].lines = 100 | 0x80;
	swirlWindowHDMATable[0].address = &swirlWindowHDMAData[0];
	// Write the table entry for the 124 remaining lines of window data
	swirlWindowHDMATable[1].lines = 124 | 0x80;
	swirlWindowHDMATable[2].lines = 0;
	//dmaChannels[channel].A1B = 0x7E;
	//dmaChannels[channel].DASB = 0x7E;
	dmaChannels[channel].BBAD = 0x26;
	dmaChannels[channel].DMAP = flags;
	// Depending on whether we are writing to windows 1 and 2 (4 bytes) or just window 1 (2 bytes),
	// skip ahead in the buffer by 400 or 200 bytes (100 lines)
	swirlWindowHDMATable[1].address = ((flags & 4) != 0) ? (&swirlWindowHDMAData[400]) : (&swirlWindowHDMAData[200]);
	dmaChannels[channel].A1T = &swirlWindowHDMATable[0];
	mirrorHDMAEN |= dmaFlags[channel];
}

/// $C0B149
void generateSwirlHDMATable(short arg1, short arg2, short arg3, short arg4) {
	if (/+(arg2 > 0) && (+/arg2 >= 0x70) {
		short y = 0;
		short a = cast(short)(arg2 - arg4);
		if (a > 0) {
			do {
				*cast(ushort*)&swirlWindowHDMAData[y] = 0xFF;
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
			*cast(ushort*)&swirlWindowHDMAData[y] = a;
			x0C = cast(short)(x0A * 4);
			if (y + x0C < 0x1C0) {
				*cast(ushort*)&swirlWindowHDMAData[y + x0C] = a;
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
				*cast(ushort*)&swirlWindowHDMAData[y] = 0xFF;
				y += 2;
			} while (y < 0x1C0);
		}
	} else {
		short y = 0x1BE;
		short a = 0xE0;
		a = cast(short)(a - arg2 - arg4);
		if (a > 0) {
			do {
				*cast(ushort*)&swirlWindowHDMAData[y] = 0xFF;
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
			*cast(ushort*)&swirlWindowHDMAData[y] = a;
			x0C = cast(short)(x0A * 4);
			if (y - x0C >= 0) {
				*cast(ushort*)&swirlWindowHDMAData[y - x0C] = a;
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
				swirlWindowHDMAData[y] = 0xFF;
				y -= 2;
			} while (y >= 0);
		}
	}
}

/// $C0B2FF
immutable byte[256] unknownC0B2FF = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2, -2, -2, -2, -2, -2, -2, -2, -3, -3, -3, -3, -3, -3, -3, -4, -4, -4, -4, -4, -5, -5, -5, -5, -5, -6, -6, -6, -6, -6, -7, -7, -7, -7, -8, -8, -8, -8, -9, -9, -9, -9, -10, -10, -10, -11, -11, -11, -12, -12, -12, -12, -13, -13, -13, -14, -14, -15, -15, -15, -16, -16, -16, -17, -17, -17, -18, -18, -19, -19, -20, -20, -20, -21, -21, -22, -22, -23, -23, -23, -24, -24, -25, -25, -26, -26, -27, -27, -28, -28, -29, -29, -30, -30, -31, -31, -32, -33, -33, -34, -34, -35, -35, -36, -37, -37, -38, -38, -39, -40, -40, -41, -42, -42, -43, -44, -44, -45, -46, -46, -47, -48, -49, -49, -50, -51, -52, -52, -53, -54, -55, -55, -56, -57, -58, -59, -59, -60, -61, -62, -63, -64, -65, -65, -66, -67, -68, -69, -70, -71, -72, -73, -74, -75, -76, -77, -78, -79, -80, -81, -82, -83, -84, -86, -87, -88, -89, -90, -91, -93, -94, -95, -96, -97, -99, -100, -101, -103, -104, -105, -107, -108, -110, -111, -113, -114, -116, -117, -119, -120, -122, -123, -125, -127, 127, 126, 124, 122, 120, 118, 116, 114, 112, 110, 108, 106, 104, 102, 99, 97, 94, 92, 89, 86, 83, 81, 77, 74, 71, 67, 63, 59, 55, 50, 45, 39, 32, 23];

/// $C0B425
immutable byte[256] sineLookupTable = [0, 3, 6, 9, 12, 15, 18, 21, 24, 28, 31, 34, 37, 40, 43, 46, 48, 51, 54, 57, 60, 63, 65, 68, 71, 73, 76, 78, 81, 83, 85, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 109, 111, 112, 114, 115, 117, 118, 119, 120, 121, 122, 123, 124, 124, 125, 126, 126, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 126, 126, 125, 124, 124, 123, 122, 121, 120, 119, 118, 117, 115, 114, 112, 111, 109, 108, 106, 104, 102, 100, 98, 96, 94, 92, 90, 88, 85, 83, 81, 78, 76, 73, 71, 68, 65, 63, 60, 57, 54, 51, 48, 46, 43, 40, 37, 34, 31, 28, 24, 21, 18, 15, 12, 9, 6, 3, 0, -3, -6, -9, -12, -15, -18, -21, -24, -28, -31, -34, -37, -40, -43, -46, -48, -51, -54, -57, -60, -63, -65, -68, -71, -73, -76, -78, -81, -83, -85, -88, -90, -92, -94, -96, -98, -100, -102, -104, -106, -108, -109, -111, -112, -114, -115, -117, -118, -119, -120, -121, -122, -123, -124, -124, -125, -126, -126, -127, -127, -127, -127, -127, -127, -127, -127, -127, -127, -127, -126, -126, -125, -124, -124, -123, -122, -121, -120, -119, -118, -117, -115, -114, -112, -111, -109, -108, -106, -104, -102, -100, -98, -96, -94, -92, -90, -88, -85, -83, -81, -78, -76, -73, -71, -68, -65, -63, -60, -57, -54, -51, -48, -46, -43, -40, -37, -34, -31, -28, -24, -21, -18, -15, -12, -9, -6, -3];

/** Calculates cos(angle) * factor / 2
 * Params:
 * 	factor = Number to multiply
 * angle = Angle in 1/256ths of a radian
 * Original_Address: $(DOLLAR)C0B400
 */
short cosineMult(short factor, short angle) {
	return sineMult(factor, cast(ubyte)(angle - 0x40));
}

/** Returns sin(angle) * factor / 2
 * Params:
 * 	factor = Number to multiply
 * angle = Angle in 1/256ths of a radian
 * Original_Address: $(DOLLAR)C0B40B
 */
short sineMult(short factor, ubyte angle) {
	return (factor * sineLookupTable[angle]) >> 8;
}

/// $C0B525
void fileSelectInit() {
	prepareForImmediateDMA();
	initializeEntitySubsystem();
	oamClear();
	updateScreen();
	clearSpriteTable();
	spriteVramTableOverwrite(short.min, 0);
	initializeMiscObjectData();
	overworldSetupVRAM();
	unknownC432B1();
	prepareAverageForSpritePalettes();
	memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
	initializeTextSystem();
	copyToVRAM(3, 0x800, 0x7C00, buffer.ptr);
	decomp(&textWindowTiles[0], buffer.ptr);
	memcpy(&buffer[0x2000], &buffer[0x1000], 0x2A00);
	loadWindowGraphics(WindowGraphicsToLoad.all);
	memcpy(&palettes[0][0], &textWindowFlavourPalettes[0][0], 0x40);
	if (config.autoLoadFile.isNull) {
		loadBackgroundAnimation(BackgroundLayer.fileSelect, 0);
	}
	entityAllocationMinSlot = partyLeaderEntity;
	entityAllocationMaxSlot = partyLeaderEntity + 1;
	initEntity(ActionScript.unknown787, 0, 0);
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2;
	bg2YPosition = 0;
	bg1YPosition = 0;
	bg2XPosition = 0;
	bg1XPosition = 0;
	oamClear();
	updateScreen();
	fadeIn(1, 1);
	unknownC1FF6B();
	fadeOutWithMosaic(1, 1, 0);
	deleteEntity(partyLeaderEntity);
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	setAudioChannels(gameState.soundSetting - 1);
}

/// $C0B65F
void setLeaderLocation(short arg1, short arg2) {
	tracef("Setting coordinates to %s, %s", arg1, arg2);
	gameState.leaderX.integer = arg1;
	gameState.leaderY.integer = arg2;
	gameState.leaderDirection = 2;
	gameState.partyMembers[0] = 1;
	entityScreenXTable[partyMemberEntityStart] = arg1;
	entityScreenYTable[partyMemberEntityStart] = arg2;
}

/// $C0B67F
void unknownC0B67F() {
	initializeEntitySubsystem();
	clearSpriteTable();
	spriteVramTableOverwrite(short.min, 0);
	initializeMiscObjectData();
	battleMode = BattleMode.noBattle;
	inputDisableFrameCounter = 0;
	npcSpawnsEnabled = SpawnControl.offscreenOnly;
	enemySpawnsEnabled = SpawnControl.allEnabled;
	overworldEnemyMaximum = 10;
	battleSwirlCountdown = 0;
	pendingInteractions = 0;
	setAutoSectorMusicChanges(1);
	dadPhoneTimer = 0x697;
	setIRQCallback(&processOverworldTasks);
	psiTeleportStyle = PSITeleportStyle.none;
	psiTeleportDestination = 0;
	entityFadeEntity = -1;
	entityAllocationMinSlot = partyLeaderEntity;
	entityAllocationMaxSlot = partyLeaderEntity + 1;
	initEntity(ActionScript.partyMemberLeading, 0, 0);
	clearParty();
	unknownC03A24();
	memset(&palettes[0][0], 0, 0x200);
	loadTextPalette();
	overworldInitialize();
	if (config.overrideSpawn) {
		gameState.leaderX.integer = config.spawnCoordinates.x;
		gameState.leaderY.integer = config.spawnCoordinates.y;
	}
	loadMapAtPosition(gameState.leaderX.integer, gameState.leaderY.integer);
	spawnBuzzBuzz();
	prepareWindowGraphics();
	loadWindowGraphics(WindowGraphicsToLoad.all);
	setFollowerEntityLocationToLeaderPosition();
}

/// $C0B731
void initBattleOverworld() {
	if (battleMode == BattleMode.noBattle) {
		return;
	}
	// if in debug mode, don't start battle until player releases Y button
	if ((debugging == 0) || (debugTryCancellingBattle() != -1)) {
		if (instantWinCheck() != 0) {
			instantWinHandler();
			battleMode = BattleMode.noBattle;
		} else {
			short battleResult = initBattleCommon();
			unknownC07B52();
			overworldStatusSuppression = 0;
			if (psiTeleportDestination == 0) {
				if (battleResult != BattleResult.won) {
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
	}
	for (short i = 0; i != partyLeaderEntity; i++) {
		entityCollidedObjects[i] = 0xFFFF;
		entityPathfindingState[i] = 0;
		entitySpriteMapFlags[i] &= ~SpriteMapFlags.drawDisabled;
	}
	overworldStatusSuppression = 0;
	unfreezeEntities();
	playerIntangibilityFrames = 120;
	touchedEnemy = -1;
}

/// $C0B7D8
void ebMain() {
	initializePartyPointers();
	RestartGame:
	if (config.noIntro) {
		disabledTransitions = 1;
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
		if (((currentQueuedInteraction - nextQueuedInteraction) != 0) && !battleSwirlCountdown && !enemyHasBeenTouched && (battleMode == BattleMode.noBattle)) {
			processQueuedInteraction();
			inputDisableFrameCounter++;
		} else if ((gameState.cameraMode != CameraMode.followEntity) && (gameState.walkingStyle != WalkingStyle.escalator) && !battleSwirlCountdown) {
			if (battleMode != BattleMode.noBattle) {
				initBattleOverworld();
				inputDisableFrameCounter++;
			} else if (((padPress[0] & (Pad.a | Pad.l)) != 0) && (gameState.walkingStyle == WalkingStyle.bicycle)) {
				freezeEntities();
				getOffBicycleWithText();
				unfreezeEntities();
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
			if (enemyHasBeenTouched) {
				continue;
			}
			if (inputDisableFrameCounter) {
				inputDisableFrameCounter--;
			} else if (!pendingInteractions) {
				if ((padPress[0] & Pad.a) != 0 ) {
					openMenuButton();
				} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (gameState.walkingStyle != WalkingStyle.bicycle)) {
					openHPPPDisplay();
				} else if ((padPress[0] & Pad.x) != 0) {
					showTownMap();
				} else if ((padPress[0] & Pad.l) != 0) {
					openMenuButtonCheckTalk();
				} else if (config.debugMenuButton && ((padPress[0] & Pad.extra1) != 0)) {
					freezeEntities();
					playSfx(Sfx.cursor1);
					createWindowN(Window.textStandard);
					displayText(getTextBlock("MSG_DEBUG_00"));
					clearInstantPrinting();
					hideHPPPWindows();
					closeAllWindows();
					unfreezeEntities();
				} else if (config.debugMenuButton && ((padPress[0] & Pad.extra2) != 0)) {
					freezeEntities();
					playSfx(Sfx.cursor1);
					createWindowN(Window.textStandard);
					displayText(getTextBlock("MSG_DEBUG_01"));
					clearInstantPrinting();
					hideHPPPWindows();
					closeAllWindows();
					unfreezeEntities();
				} else if (config.debugMenuButton && ((padPress[0] & Pad.extra3) != 0)) {
					debugYButtonMenu();
				} else if (config.debugMenuButton && ((padPress[0] & Pad.extra4) != 0)) {
					assert(0, "Intentional crash");
				}
			}
			mainFiberExecute();
			mainFiberExecute = () {};
			if (psiTeleportDestination) {
				teleportMainLoop();
			}
			if (!debugging && ((padPress[1] & Pad.b) != 0)) {
				for (short i = 0; i < partyCharacters.length; i++) {
					partyCharacters[i].hp.target = partyCharacters[i].maxHP;
					partyCharacters[i].pp.target = partyCharacters[i].maxPP;
				}
			}
		}
		if (!unknownC04FFE() && spawn()) {
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
	debug {
		if (config.loadDebugMenu || ((padState[0] & (Pad.down | Pad.l)) != 0)) {
			debugging = 1;
			debugMenuLoad();
		}
	}
	debugging = 0;
	ebMain();
}

/// $C0B9BC
void unknownC0B9BC(PathCtx* arg1, short arg2, short arg3, short arg4) {
	for (short i = 0; i < arg2; i++) {
		arg1.targetsPos[i].x = (((entityAbsXTable[gameState.partyEntities[i]] - collisionWidths[entitySizes[gameState.partyEntities[i]]]) / 8) - arg3) & 0x3F;
		arg1.targetsPos[i].y = (((entityAbsYTable[gameState.partyEntities[i]] - collisionHeights1[entitySizes[gameState.partyEntities[i]]] + collisionHeights2[entitySizes[gameState.partyEntities[i]]]) / 8) - arg4) & 0x3F;
	}
}

unittest {
	PathCtx ctx;
	gameState.partyEntities[0] = 0;
	entitySizes[gameState.partyEntities[0]] = 5;
	entityAbsXTable[gameState.partyEntities[0]] = 1727;
	entityAbsYTable[gameState.partyEntities[0]] = 1717;

	unknownC0B9BC(&ctx, 1, 182, 182);
	assert(ctx.targetsPos[0].x == 32);
	assert(ctx.targetsPos[0].y == 32);

	entityAbsXTable[gameState.partyEntities[0]] = 1367;
	entityAbsYTable[gameState.partyEntities[0]] = 1783;

	unknownC0B9BC(&ctx, 1, 137, 190);
	assert(ctx.targetsPos[0].x == 32);
	assert(ctx.targetsPos[0].y == 32);

	entityAbsXTable[gameState.partyEntities[0]] = 1560;
	entityAbsYTable[gameState.partyEntities[0]] = 1765;

	unknownC0B9BC(&ctx, 1, 162, 188);
	assert(ctx.targetsPos[0].x == 32);
	assert(ctx.targetsPos[0].y == 32);
}

/// $C0BA35
short unknownC0BA35(PathCtx* pathState, short targets, short baseX, short baseY, bool offscreen, short arg6, short arg7) {
	ubyte* pathBuffer = &buffer[0x3000];
	pathState.targetCount = targets;
	for (short i = 0; i != pathState.radius.x; i++) {
		for (short j = 0; j != pathState.radius.y; j++) {
			if ((loadedCollisionTiles[(i + baseY) & 0x3F][(j + baseX) & 0x3F] & (SurfaceFlags.solid | SurfaceFlags.unknown2)) != 0) {
				(pathBuffer++)[0] = PathfindingTile.unwalkable;
			} else {
				(pathBuffer++)[0] = 0;
			}
		}
	}
	short pathfinders = 0;
	for (short i = 0; i < maxEntities; i++) {
		if (entityScriptTable[i] == -1) {
			continue;
		}
		if (entityPathfindingState[i] != -1) {
			continue;
		}
		pathState.pathers[pathfinders].objIndex = i;
		pathState.pathers[pathfinders].fromOffscreen = offscreen;
		pathState.pathers[pathfinders].hitbox.x = hitboxWidths[entitySizes[i]];
		pathState.pathers[pathfinders].hitbox.y = hitboxHeights[entitySizes[i]];
		pathState.pathers[pathfinders].origin.x = (((entityAbsXTable[i] - collisionWidths[entitySizes[i]]) / 8) - baseX) & 0x3F;
		pathState.pathers[pathfinders].origin.y = (((entityAbsYTable[i] - collisionHeights1[entitySizes[i]] + collisionHeights2[entitySizes[i]]) / 8) - baseY) & 0x3F;
		pathfinders++;
	}
	pathState.patherCount = pathfinders;
	ushort x28 = pathMain(0xC00, &pathfindingBuffer[0], &pathState.radius, &buffer[0x3000], 4, targets, &pathState.targetsPos[0], pathfinders, &pathState.pathers[0], -1, arg6, arg7);
	assert(pathGetHeapSize() <= 0xC00);
	if (x28 == 0) {
		for (short i = 0; i != maxEntities; i++) {
			if (entityScriptTable[i] == -1) {
				continue;
			}
			entityPathfindingState[i] = 1;
		}
		return -1;
	} else {
		for (short i = 0; i < pathfinders; i++) {
			short x22 = pathState.pathers[i].objIndex;
			if (pathState.pathers[i].field0A != 0) {
				entityPathPoints[x22] = pathState.pathers[i].points;
				entityPathPointsCount[x22] = pathState.pathers[i].field0A;
			} else {
				entityPathfindingState[x22] = 1;
			}
		}
		return 0;
	}
}

/// $C0BC74
short findPathToParty(short partyCount, short arg2, short arg3) {
	short x28 = gameState.firstPartyMemberEntity;
	PathCtx* x26 = &pathfindingState;
	pathfindingState.radius.y = arg2;
	pathfindingState.radius.x = arg3;
	pathfindingTargetWidth = pathfindingState.radius.y / 2;
	pathfindingTargetHeight = pathfindingState.radius.x / 2;
	pathfindingTargetCenterX = (entityAbsXTable[gameState.firstPartyMemberEntity] - collisionWidths[entitySizes[gameState.firstPartyMemberEntity]]) / 8;
	pathfindingTargetCenterY = (entityAbsYTable[gameState.firstPartyMemberEntity] - collisionHeights1[entitySizes[gameState.firstPartyMemberEntity]] + collisionHeights2[entitySizes[gameState.firstPartyMemberEntity]]) / 8;
	short x02 = ((entityAbsYTable[gameState.firstPartyMemberEntity] - collisionHeights1[entitySizes[gameState.firstPartyMemberEntity]] + collisionHeights2[entitySizes[gameState.firstPartyMemberEntity]]) / 8) - (pathfindingState.radius.x / 2);
	short x04 = ((entityAbsXTable[gameState.firstPartyMemberEntity] - collisionWidths[entitySizes[gameState.firstPartyMemberEntity]]) / 8) - (pathfindingState.radius.y / 2);
	unknownC0B9BC(&pathfindingState, partyCount, x04, x02);
	return unknownC0BA35(&pathfindingState, partyCount, x04, x02, 0, 0x40, 0x32);
}

unittest {
	if (romDataLoaded) {
		initializeForTesting();
		currentHeapAddress = &heap[0][0];
		heapBaseAddress = &heap[0][0];

		gameState.playerControlledPartyMemberCount = 1;
		gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1] = 0;
		chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]] = &partyCharacters[0];
		reloadMapAtPosition(1365, 1766);
		//printCollision(loadedCollisionTiles);

		entityAbsXTable = [1656, 1816, 1562, 1728, 1648, 1624, 1528, 1656, 1425, 1521, 222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1560, 0, 0, 0, 0, 0];
		entityAbsYTable = [1608, 1952, 1773, 1744, 1758, 1632, 1728, 1712, 1768, 1790, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1765, 0, 0, 0, 0, 0];
		entitySizes = [8, 5, 5, 11, 5, 5, 0, 5, 14, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0];
		entityScriptTable = [0, -1, 21, 8, 21, 13, 9, 12, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, 2, -1, -1, -1, -1, -1];
		entityPathfindingState = [0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

		gameState.firstPartyMemberEntity = 24;
		gameState.partyEntities[0] = cast(ubyte)gameState.firstPartyMemberEntity;
		entitySizes[gameState.firstPartyMemberEntity] = 5;
		//assert(findPathToParty(1, 64, 64) == 0);
	}
}


/// $C0BD96
short unknownC0BD96() {
	short x2A = gameState.firstPartyMemberEntity;
	PathCtx* x28 = &pathfindingState;
	short x04 = pathfindingState.radius.y = 56;
	short x02 = pathfindingState.radius.x = 56;
	pathfindingTargetWidth = pathfindingState.radius.y / 2;
	pathfindingTargetHeight = pathfindingState.radius.x / 2;
	pathfindingTargetCenterX = (entityAbsXTable[x2A] - collisionWidths[entitySizes[x2A]]) / 8;
	pathfindingTargetCenterY = (entityAbsYTable[x2A] - collisionHeights1[entitySizes[x2A]] + collisionHeights2[entitySizes[x2A]]) / 8;
	x04 = cast(short)((entityAbsXTable[x2A] - collisionWidths[entitySizes[x2A]]) / 8 - x04);
	x02 = cast(short)((entityAbsYTable[x2A] - collisionHeights1[entitySizes[x2A]] + collisionHeights2[entitySizes[x2A]]) / 8 - x02);
	unknownC0B9BC(x28, 1, x04, x02);
	short result = unknownC0BA35(x28, 1, x04, x02, 1, 0xFC, 0x32);
	if (result == 0) {
		entityAbsXTable[pathfindingState.pathers[0].objIndex] = cast(short)((pathfindingState.pathers[0].origin.x * 8) + collisionWidths[entitySizes[pathfindingState.pathers[0].objIndex]] + ((pathfindingTargetCenterX - pathfindingTargetWidth) * 8));
		entityAbsYTable[pathfindingState.pathers[0].objIndex] = cast(short)((pathfindingState.pathers[0].origin.y * 8) -collisionHeights2[entitySizes[pathfindingState.pathers[0].objIndex]] + collisionHeights1[entitySizes[pathfindingState.pathers[0].objIndex]] + ((pathfindingTargetCenterY - pathfindingTargetHeight) * 8));
		entityPathPoints[pathfindingState.pathers[0].objIndex]++;
		entityPathPointsCount[pathfindingState.pathers[0].objIndex]--;
	}
	return result;
}

/// $C0BF72
short unknownC0BF72() {
	PathCtx* x26 = &pathfindingState;
	pathfindingState.radius.y = 56;
	pathfindingState.radius.x = 56;
	short x04 = pathfindingState.radius.y / 2;
	pathfindingTargetWidth = pathfindingState.radius.y / 2;
	pathfindingTargetHeight = pathfindingState.radius.x / 2;
	pathfindingTargetCenterX = (entityAbsXTable[currentEntitySlot] - collisionWidths[entitySizes[currentEntitySlot]]) / 8;
	pathfindingTargetCenterY = (entityAbsYTable[currentEntitySlot] - collisionHeights1[entitySizes[currentEntitySlot]] + collisionHeights2[entitySizes[currentEntitySlot]]) / 8;
	short x = cast(short)((entityAbsXTable[currentEntitySlot] - collisionWidths[entitySizes[currentEntitySlot]]) / 8 - x04);
	short x28 = cast(short)((entityAbsYTable[currentEntitySlot] - collisionHeights1[entitySizes[currentEntitySlot]] + collisionHeights2[entitySizes[currentEntitySlot]]) / 8 - x04);
	pathfindingState.targetsPos[0].x = x04 & 0x3F;
	pathfindingState.targetsPos[0].y = pathfindingTargetHeight & 0x3F;
	return unknownC0BA35(x26, 1, x, x28, 1, 0xFC, 0x32);
}

/// $C0C19B
short prepareDeliveryEntrancePath(short arg1) {
	if (legalDeliveryAreaTypes[loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & 7] != 0) {
		entityPathfindingState[currentEntitySlot] = -1;
		if (unknownC0BD96() == 0) {
			entityPathfindingState[currentEntitySlot] = 0;
			VecYX* x02 = entityPathPoints[currentEntitySlot];
			VecYX* y2 = &deliveryPaths[arg1][0];
			entityPathPoints[currentEntitySlot] = y2;
			short x10 = entityPathPointsCount[currentEntitySlot];
			for (short i = 0; (x10 != 0) && (i < 20); i++) {
				(y2++)[0] = (x02++)[0];
				x10--;
			}
			return 0;
		}
	}
	return 1;
}

/// $C0C251
short prepareDeliveryExitPath(short arg1) {
	entityPathfindingState[currentEntitySlot] = -1;
	if (unknownC0BF72() == 0) {
		entityPathfindingState[currentEntitySlot] = 0;
		short x12 = --entityPathPointsCount[currentEntitySlot];
		VecYX* x02 = &entityPathPoints[currentEntitySlot][(x12 - 1) * 4];
		VecYX* x10 = &deliveryPaths[arg1][0];
		entityPathPoints[currentEntitySlot] = x10;
		short y = entityPathPointsCount[currentEntitySlot];
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

/** Sets an NPC entity's direction based on the state of its associated event flag. Used for gift box entities.
 * Params:
 * 	entity = The target entity ID
 * Original_Address: $(DOLLAR)C0C30C
 */
void updateGiftBoxState(short entity) {
	if (getEventFlag(npcConfig[entityNPCIDs[entity]].eventFlag)) {
		entityDirections[entity] = Direction.up; // 0
	} else {
		entityDirections[entity] = Direction.down; // 4
	}
	updateEntitySprite(entity);
}

/// $C0C353
void updateActiveGiftBoxState() {
	updateGiftBoxState(currentEntitySlot);
}

/// $C0C35D
short unknownC0C35D() {
	return gameState.leaderHasMoved;
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
	if (entityPathfindingState[currentEntitySlot] != 0) {
		return 0;
	}
	if (playerIntangibilityFrames == 0) {
		return unknownC0C363();
	}
	return -1;
}

/// $C0C4AF
short unknownC0C4AF() {
	if (entityPathfindingState[currentEntitySlot] != 0) {
		return 0;
	}
	if (playerIntangibilityFrames == 0) {
		return unknownC0C3F9();
	}
	return -1;
}

/// $C0C4F6
short getDirectionFromPlayerToEntity() {
	return getDirectionTo(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], gameState.leaderX.integer, gameState.leaderY.integer);
}

/// $C0C524
short isEntityWeak() {
	if ((battleEntryPointerTable[entityNPCIDs[currentEntitySlot] & 0x7FFF].runAwayFlag != 0) && (getEventFlag(battleEntryPointerTable[entityNPCIDs[currentEntitySlot] & 0x7FFF].runAwayFlag) == battleEntryPointerTable[entityNPCIDs[currentEntitySlot] & 0x7FFF].runAwayFlagState)) {
		return 1;
	}
	short x0E = unknownC0546B();
	if (x0E > enemyConfigurationTable[entityEnemyIDs[currentEntitySlot]].level * 10) {
		return 1;
	}
	if ((x0E > enemyConfigurationTable[entityEnemyIDs[currentEntitySlot]].level * 8) && (entityWeakEnemyValue[currentEntitySlot] >= 192)) {
		return 1;
	}
	if ((x0E > enemyConfigurationTable[entityEnemyIDs[currentEntitySlot]].level * 6) && (entityWeakEnemyValue[currentEntitySlot] >= 128)) {
		return 1;
	}
	return 0;
}

/// $C0C62B
short getAngleTowardsPlayerUnlessWeak() {
	short x02 = 0;
	if ((entityNPCIDs[currentEntitySlot] < 0) && (isEntityWeak() != 0)) {
		x02 = short.min;
	}
	return cast(short)(getScreenAngle(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], entityScriptVar6Table[currentEntitySlot], entityScriptVar7Table[currentEntitySlot]) + x02);
}

/// $C0C682
short getDirectionRotatedClockwise(short arg1) {
	return (entityDirections[currentEntitySlot] + arg1) & 7;
}

/// $C0C6B6
short isEntityOnscreen() {
	if (teleportationSpeed.integer >= 4) {
		return -1;
	}
	short x = cast(short)(entityAbsXTable[currentEntitySlot] - (gameState.leaderX.integer - 128));
	short y = cast(short)(entityAbsYTable[currentEntitySlot] - (gameState.leaderY.integer - 112));
	if ((x >= -64) && (x < 320)) {
		if ((y >= -64) && (y < 320)) {
			return -1;
		}
	}
	return 0;
}


/// $C0C711
short unknownC0C711() {
	//weird...
	if ((((entityScreenXTable[currentEntitySlot] - collisionWidths[entitySizes[currentEntitySlot]]) | (entityScreenYTable[currentEntitySlot] - collisionHeights1[entitySizes[currentEntitySlot]]) | (currentEntitySlot + 8)) & 0xFF00) == 0) {
		return -1;
	} else {
		return 0;
	}
}

unittest {
	{
		currentEntitySlot = 2;
		entityScreenXTable[currentEntitySlot] = 0x104;
		entityScreenYTable[currentEntitySlot] = 0x78;
		entitySizes[currentEntitySlot] = 5;
		assert(unknownC0C711() == -1);
	}
	{
		currentEntitySlot = 4;
		entityScreenXTable[currentEntitySlot] = 0xAC;
		entityScreenYTable[currentEntitySlot] = cast(short)0xFFC1;
		entitySizes[currentEntitySlot] = 14;
		assert(unknownC0C711() == 0);
	}
}

/// $C0C7DB
void updateEntitySurfaceFlags() {
	entitySurfaceFlags[currentEntitySlot] = getSurfaceFlags(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], currentEntitySlot);
}

/// $C0C83B
void unknownC0C83B(short direction) {
	entityMovingDirection[currentEntitySlot] = direction;
	FixedPoint1616 x0E;
	if ((direction & 1) != 0) {
		x0E.combined = (cast(int)entityMovementSpeed[currentEntitySlot] * 0xB505) >> 8;
	} else {
		x0E.combined = (cast(int)entityMovementSpeed[currentEntitySlot] * 0x10000) >> 8;
	}
	FixedPoint1616 x12;
	FixedPoint1616 x16;
	switch (direction) {
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
	entityScriptSleepFrames[currentScriptSlot] = cast(short)((cast(int)arg1 << 8) / entityMovementSpeed[currentEntitySlot]);
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
	assert(x0A.combined != 0);
	entityScriptSleepFrames[currentScriptSlot] = cast(short)((arg1 << 16) / x0A.combined);
}

/// $C0CC11
void unknownC0CC11() {
	short x12 = cast(short)(entityScriptVar6Table[currentEntitySlot] - entityAbsXTable[currentEntitySlot]);
	short y = (0 > x12) ? (cast(short)-cast(int)x12) : x12;
	x12 = cast(short)(entityScriptVar7Table[currentEntitySlot] - entityAbsYTable[currentEntitySlot]);
	short x02 = (0 > x12) ? (cast(short)-cast(int)x12) : x12;
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
	entityScriptVar5Table[currentEntitySlot] = cast(short)((cast(int)entityMovementSpeed[currentEntitySlot] * 16) / 64800) << 8;
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
	auto x0E = unknownC41FFF(x02, 0x1000);
	FixedPoint1616 x1E;
	FixedPoint1616 x1A;
	x1A.integer = x0E.y;
	x1E.integer = x0E.x;
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
	if (entityMovementSpeed[currentEntitySlot] < entityScriptVar3Table[currentEntitySlot]) {
		entityMovementSpeed[currentEntitySlot] += 16;
	}
	if (setMovingDirectionFromAngle(x02) != setMovingDirectionFromAngle(x04)) {
		updateEntitySprite(currentEntitySlot);
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
	short y = cast(short)(((entityAbsXTable[currentEntitySlot] - collisionWidths[entitySizes[currentEntitySlot]]) / 8) - 4);
	short x12 = cast(short)(((entityAbsYTable[currentEntitySlot] - collisionHeights1[entitySizes[currentEntitySlot]] + collisionHeights2[entitySizes[currentEntitySlot]]) / 8) - 4);
	short x10 = y & 0x3F;
	short x18 = x12 & 0x3F;
	for (short i = 0; i != arg2; i++) {
		if ((x10 < 0x40) && (x18 < 0x40) && ((x00 & loadedCollisionTiles[x18 & 0x3F][x10 & 0x3F]) != 0)) {
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
	entityScriptVar6Table[currentEntitySlot] = cast(short)(y * 8 + collisionWidths[entitySizes[currentEntitySlot]]);
	entityScriptVar7Table[currentEntitySlot] = cast(short)(x12 * 8 - collisionHeights2[entitySizes[currentEntitySlot]] + collisionHeights1[entitySizes[currentEntitySlot]]);
	return -1;
}

/// $C0D0D9
short unknownC0D0D9() {
	return unknownC0CF97(3, 60);
}

/// $C0D0E6
short unknownC0D0E6() {
	if ((unknownC0C363() == 0) && (entityPathfindingState[currentEntitySlot] != 0)) {
		entityAbsXTable[currentEntitySlot] = gameState.leaderX.integer;
		entityAbsYTable[currentEntitySlot] = gameState.leaderY.integer;
		return -1;
	}
	testEntityMovementActive();
	if ((getMovingCollisionFlags(entityMovementProspectX, entityMovementProspectY, currentEntitySlot, Direction.down) & (SurfaceFlags.solid | SurfaceFlags.unknown2)) != 0) {
		entityMovementSpeed[currentEntitySlot] -= 0x1000;
		return 0;
	}
	entityAbsXTable[currentEntitySlot] = entityMovementProspectX;
	entityAbsYTable[currentEntitySlot] = entityMovementProspectY;
	return -1;
}

/// $C0D15C
short unknownC0D15C() {
	if ((playerMovementFlags & PlayerMovementFlags.collisionDisabled) != 0) {
		return 0;
	}
	if (entityCollidedObjects[partyLeaderEntity] == currentEntitySlot) {
		return -1;
	}
	if (((entityCollidedObjects[currentEntitySlot] & 0x8000) != 0) || (entityCollidedObjects[currentEntitySlot] < partyLeaderEntity)) {
		return 0;
	}
	return -1;
}

/// $C0D19B
void unknownC0D19B() {
	short enemyEntity = touchedEnemy;
	enemyHasBeenTouched = 0;
	bool playerFacingTowardsEnemy;
	bool enemyFacingTowardsPlayer;
	if (entityMovingDirection[touchedEnemy] == Direction.none) {
		enemyFacingTowardsPlayer = false;
		playerFacingTowardsEnemy = true;
	} else {
		short enemyDirection = ((getScreenAngle(entityAbsXTable[enemyEntity], entityAbsYTable[enemyEntity], entityAbsXTable[enemyPathfindingTargetEntity], entityAbsYTable[enemyPathfindingTargetEntity]) + 0x1000) / 0x2000);
		// normalize enemy direction with player at north
		switch ((entityMovingDirection[touchedEnemy] - enemyDirection) & 7) {
			case Direction.up:
			case Direction.upRight:
			case Direction.upLeft:
				 enemyFacingTowardsPlayer = true;
				 break;
			default:
				enemyFacingTowardsPlayer = false;
				break;
		}
		// normalize player direction with enemy at north
		switch ((gameState.leaderDirection - enemyDirection) & 7) {
			case Direction.up:
			case Direction.upRight:
			case Direction.upLeft:
				playerFacingTowardsEnemy = false;
				break;
			default:
				playerFacingTowardsEnemy = true;
				break;
		}
	}
	battleInitiative = Initiative.normal;
	if (playerFacingTowardsEnemy && !enemyFacingTowardsPlayer) {
		battleInitiative = Initiative.partyFirst;
	} else if (enemyFacingTowardsPlayer && !playerFacingTowardsEnemy) {
		battleInitiative = Initiative.enemiesFirst;
	}
	battleSwirlCountdown = 120;
	currentBattleGroup = entityNPCIDs[enemyEntity] & 0x7FFF;
	battleSwirlSequence();
	const(BattleGroupEnemy)* currentEnemy = &battleEntryPointerTable[entityNPCIDs[enemyEntity] & 0x7FFF].enemies[0];
	short enemyID;
	for (short i = 0; i != 4; i++) {
		short enemyCount = currentEnemy.count;
		if (enemyCount != 0xFF) { //0xFF terminates the enemy list
			short enemiesToFind = enemyCount;
			if (enemiesToFind != 0) {
				enemyID = currentEnemy.enemyID;
				if (enemyID == entityEnemyIDs[enemyEntity]) {
					entityPathfindingState[enemyEntity] = -1;
					enemiesToFind--;
				}
				if (enemiesToFind != 0) {
					for (short j = 0; j != partyLeaderEntity; j++) {
						if (entityScriptTable[j] == -1) {
							continue;
						}
						if (enemyID != entityEnemyIDs[j]) {
							continue;
						}
						entityPathfindingState[j] = -1;
					}
				}
			}
			currentEnemy++;
		} else { // fill remaining slots with 0 null enemies
			enemyCount = 0;
			enemyID = 0;
		}
		pathfindingEnemyIDs[i] = enemyID;
		pathfindingEnemyCounts[i] = enemyCount;
	}
	enemiesInBattle = 0;
	findPathToParty(gameState.partyCount, 64, 64);
	currentEnemy = &battleEntryPointerTable[currentBattleGroup].enemies[0];
	for (short i = 0; i != 4; i++) {
		short enemyCount = currentEnemy.count;
		if (enemyCount == 0xFF) {
			continue;
		}
		if (enemyCount != 0) {
			short searchEnemy = currentEnemy.enemyID;
			if (searchEnemy != 0) {
				short matchingEnemies = 0;
				for (short j = 0; j < pathfindingState.patherCount; j++) {
					if (entityEnemyIDs[pathfindingState.pathers[j].objIndex] == searchEnemy) {
						matchingEnemies++;
					}
				}
				if (matchingEnemies > enemyCount) {
					for (short j = cast(short)(matchingEnemies - enemyCount); j-- != 0;) {
						short x10 = -1;
						short x1C = 0;
						for (short k = 0; k < pathfindingState.patherCount; k++) {
							if (entityEnemyIDs[pathfindingState.pathers[k].objIndex] != searchEnemy) {
								continue;
							}
							if (pathfindingState.pathers[k].pointCount <= x1C) {
								continue;
							}
							x10 = matchingEnemies;
							x1C = entityEnemyIDs[pathfindingState.pathers[k].pointCount];
						}
						if (pathfindingState.pathers[x10].objIndex != enemyEntity) {
							pathfindingState.pathers[x10].pointCount = 0;
							entityPathfindingState[pathfindingState.pathers[x10].objIndex] = 0;
						}
					}
				}
			}
		}
		currentEnemy++;
	}
	for (short i = 0; i < partyLeaderEntity; i++) {
		if (i == enemyEntity) {
			continue;
		}
		if (entityPathfindingState[i] == -1) {
			entityCallbackFlags[i] &= 0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
		} else {
			entitySpriteMapFlags[i] |= SpriteMapFlags.drawDisabled;
		}
	}
	entityPathfindingState[enemyEntity] = 0;
	enemiesInBattleIDs[enemiesInBattle++] = entityEnemyIDs[enemyEntity];
}

/// $C0D4DE
void unknownC0D4DE() {
	memcpy(&buffer[0x2000], &palettes[0][0], 0x200);
	for (short i = 0; i < 0x80; i++) {
		ushort x18 = (cast(ushort*)&palettes[0][0])[i];
		short x16 = x18 & 0x1F;
		short x02 = (x18 >> 5) & 0x1F;
		short tmp = (x18 >> 10) & 0x1F;
		short x16_2 = (x16 + x02 + tmp) / 3;
		(cast(ushort*)&palettes[0][0])[i] = cast(ushort)(x16_2 << 10 + x16_2 << 5 + x16_2);
	}
	preparePaletteUpload(PaletteUpload.full);
}

/// $C0D59B
short unknownC0D59B() {
	if ((battleSwirlCountdown != 0) || (enemyHasBeenTouched != 0)) {
		return 1;
	}
	return 0;
}

/// $C0D5B0
short unknownC0D5B0() {
	if (battleMode != BattleMode.noBattle) {
		return 0;
	}
	if (usingDoor != 0) {
		return 0;
	}
	if ((battleSwirlCountdown == 0) || (currentEntitySlot != touchedEnemy)) {
		if (gameState.cameraMode == CameraMode.followEntity) {
			return 0;
		}
		if ((playerMovementFlags & PlayerMovementFlags.collisionDisabled) != 0) {
			return 0;
		}
		if (gameState.walkingStyle == WalkingStyle.escalator) {
			return 0;
		}
		if (playerIntangibilityFrames != 0) {
			return 0;
		}
		if ((battleSwirlCountdown == 0) || (entityPathPointsCount[currentEntitySlot] != 0)) {
			if (unknownC0D15C() == 0) {
				return 0;
			}
		}
	}
	if ((battleSwirlCountdown == 0) && (enemyHasBeenTouched == 0) && (entityEnemyIDs[currentEntitySlot] == EnemyID.magicButterfly)) {
		return 1;
	}
	if ((battleSwirlCountdown == 0) && (enemyHasBeenTouched == 0)) {
		enemyHasBeenTouched = 1;
		unknownC0D4DE();
		if (currentEntitySlot == entityCollidedObjects[partyLeaderEntity]) {
			enemyPathfindingTargetEntity = partyMemberEntityStart;
		} else {
			enemyPathfindingTargetEntity = entityCollidedObjects[currentEntitySlot];
		}
		touchedEnemy = currentEntitySlot;
		for (short i = 0; i < maxEntities; i++) {
			if (i == partyLeaderEntity) {
				continue;
			}
			entityCallbackFlags[i] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
		}
		switchToCameraMode3();
		return 1;
	}
	entityCollidedObjects[currentEntitySlot] = 0x8000;
	short x12 = 0;
	if (battleSwirlCountdown != 0) {
		if (currentEntitySlot == touchedEnemy) {
			entityCallbackFlags[currentEntitySlot] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
			x12 = 1;
		} else {
			x12 = 0;
			short y = 0;
			for (short i = 0; i != 4; i++) {
				if (entityEnemyIDs[currentEntitySlot] == pathfindingEnemyIDs[i]) {
					short x0E = pathfindingEnemyCounts[i];
					if (x0E != 0) {
						pathfindingEnemyCounts[i] = cast(short)(x0E - 1);
						x12 = 1;
						entityCallbackFlags[currentEntitySlot] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
						enemiesInBattleIDs[enemiesInBattle++] = entityEnemyIDs[currentEntitySlot];
					}
				}
				y += pathfindingEnemyCounts[i];
			}
			if ((y == 0) && (unknownC2E9C8() == 0)) {
				for (short i = 0; i < maxEntities; i++) {
					if (i == partyLeaderEntity) {
						continue;
					}
					entityCallbackFlags[i] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
				}
				battleSwirlCountdown = 1;
			}
		}
	}
	return x12;
}

/// $C0D7E0
void unknownC0D7E0() {
	if (entityPathfindingState[currentEntitySlot] != 0) {
		entityPathfindingState[currentEntitySlot] = 1;
	}
}

/// $C0D7F7
void unknownC0D7F7() {
	if (entityPathfindingState[currentEntitySlot] != -1) {
		return;
	}
	short x1C = entitySizes[currentEntitySlot];
	VecYX* x1A = entityPathPoints[currentEntitySlot];
	short x18 = entityAbsXTable[currentEntitySlot];
	short x16 = entityAbsYTable[currentEntitySlot];
	short x12 = cast(short)((pathfindingTargetCenterX - pathfindingTargetWidth * 8) + x1A.x * 8 + collisionWidths[x1C]);
	short x04 = cast(short)((pathfindingTargetCenterY - pathfindingTargetHeight * 8) + x1A.y * 8 - collisionHeights2[x1C] + collisionHeights1[x1C]);
	short x10 = cast(short)(x18 - x12);
	if (0 > x10) {
		x10 = cast(short)-cast(int)x10;
	}
	if (3 > x10) {
		x10 = cast(short)(x16 - x04);
		if (0 > x10) {
			x10 = cast(short)-cast(int)x10;
		}
		if ((3 > x10) && (--entityPathPointsCount[currentEntitySlot] != 0)) {
			VecYX* x14 = &x1A[1];
			entityPathPoints[currentEntitySlot] = x14;
			x12 = cast(short)((pathfindingTargetCenterX - pathfindingTargetWidth) * 8 + x14.x * 8 + collisionWidths[x1C]);
			x04 = cast(short)((pathfindingTargetCenterY - pathfindingTargetHeight) * 8 + x14.y * 8 - collisionHeights2[x1C] + collisionHeights1[x1C]);
		}
	}
	if (entityPathPointsCount[currentEntitySlot] != 0) {
		entityDirections[currentEntitySlot] = setMovingDirectionFromAngle(setMovementFromAngle(getScreenAngle(x18, x16, x12, x04)));
	} else {
		entityPathfindingState[currentEntitySlot] = 0;
		entityObstacleFlags[currentEntitySlot] |= 0x80;
	}
}

/// $C0D77F
void unknownC0D77F() {
	for (short i = 0; i < maxEntities; i++) {
		if (i == currentEntitySlot) {
			continue;
		}
		if (i == partyLeaderEntity) {
			continue;
		}
		entityCallbackFlags[i] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
	}
}

/// $C0D7B3
void actionScriptBackupPosition() {
	actionScriptBackupX = entityAbsXTable[currentEntitySlot];
	actionScriptBackupY = entityAbsYTable[currentEntitySlot];
}

/// $C0D7C7
void actionScriptRestorePositionBackup() {
	entityAbsXTable[currentEntitySlot] = actionScriptBackupX;
	entityAbsYTable[currentEntitySlot] = actionScriptBackupY;
}

/// $C0D98F
short unknownC0D98F() {
	if (entityPathPointsCount[currentEntitySlot] == 0) {
		return 0;
	}
	short x12 = entitySizes[currentEntitySlot];
	VecYX* x0E = entityPathPoints[currentEntitySlot];
	entityScriptVar6Table[currentEntitySlot] = cast(short)((x0E.x * 8) + collisionWidths[x12] + (pathfindingTargetCenterX - pathfindingTargetWidth) * 8);
	entityScriptVar7Table[currentEntitySlot] = cast(short)((x0E.y * 8) - collisionHeights2[x12] + collisionHeights1[x12] + (pathfindingTargetCenterY - pathfindingTargetHeight) * 8);
	entityPathPointsCount[currentEntitySlot]--;
	entityPathPoints[currentEntitySlot] = x0E + 1;
	return 1;
}

/// $C0DA31
//this looks pretty ugly... is this right?
void actionScriptDrawEntitiesAlt() {
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
				actionScriptDrawEntity(i);
			}
		}
	}
	entityDrawSorting[x02] = -1;
	for (short i = x02; i-- != 0;) {
		short j;
		for (j = 0; entityDrawSorting[j] == 0; j++) {}
		x02 = j;
		short x12 = j;
		short y = entityAbsYTable[entityDrawSorting[j] - 1];
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
		actionScriptDrawEntity(cast(short)(entityDrawSorting[x12] - 1));
		entityDrawSorting[x12] = 0;
	}
}

/// $C0DB0F
void actionScriptDrawEntities() {
	if (padState[1] & Pad.select) {
		actionScriptDrawEntitiesAlt();
		return;
	}

	int entity = -1;
	uint entityOffset = firstEntity;

	// UNKNOWN6
	// I guess this is a micro-optimization they decided to add here...? We've seen what == -1 looks like normally,
	// and this is logically equivalent to that, but usually the compiler just does CMP #$FFFF
	while (entityOffset + 1) {
		if (entityScreenYTable[entityOffset / 2] < 256 || entityScreenYTable[entityOffset / 2] >= -64u) {
			// UNKNOWN3
			if (entityDrawPriority[entityOffset / 2] == 1) {
				entityDrawSorting[entityOffset / 2] = cast(short)entity;
				entity = entityOffset / 2;
			} else {
				// UNKNOWN4
				actionScriptDrawEntity(cast(short)(entityOffset / 2));
			}
		}
		// UNKNOWN5
		entityOffset = entityNextEntityTable[entityOffset / 2];
	}

	// UNKNOWN12
	// Same little optimization as above
	while (entity + 1) {
		uint drawnEntity = entity;
		uint maxY = entityAbsYTable[entity];
		uint dp04 = -1;
		uint dp02 = entity;
		uint y = entityDrawSorting[entity];
		// They really liked doing this huh...
		while (y + 1) {
			// UNKNOWN8
			if (entityAbsYTable[y] >= maxY) {
				maxY = entityAbsYTable[y];
				drawnEntity = y;
				dp04 = dp02;
			}
			// UNKNOWN9
			dp02 = y;
			y = entityDrawSorting[y];
		}
		actionScriptDrawEntity(cast(short)drawnEntity);

		if (dp04 + 1) {
			entityDrawSorting[dp04] = entityDrawSorting[drawnEntity];
		} else {
			// UNKNOWN11
			entity = entityDrawSorting[drawnEntity];
		}
	}
	// UNKNOWN13
}

/// $C0DBE6 - schedules a task to be run at some point in the future while on the overworld
short scheduleOverworldTask(short arg1, void function() arg2) {
	OverworldTask* task = &overworldTasks[0];
	short i;
	for (i = 0; i < 4; i++) {
		if (task.framesLeft == 0) {
			break;
		}
		task++;
	}
	task.framesLeft = arg1;
	task.func = arg2;
	return i;
}

/// $C0DC4E
void processOverworldTasks() {
	if ((frameCounter == 0) && (dadPhoneTimer != 0)) {
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
	if (enemyHasBeenTouched != 0) {
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
	if (enemyHasBeenTouched != 0) {
		return;
	}
	if (dadPhoneQueued != 0) {
		return;
	}
	if (getEventFlag(EventFlag.sysDis2HPapa) != 0) {
		return;
	}
	queueInteraction(InteractionType.textSurvivesDoorTransition, QueuedInteractionPtr(getTextBlock("MSG_SYS_PAPA_2H")));
	dadPhoneQueued = 1;
}

/** Wait enough frames for the active screen fade effect to complete
 * Original_Address: $(DOLLAR)C0DD0F
 */
void waitForFadeToFinish() {
	while (fadeParameters.step != 0) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
}

/** Wait n frames
 * Original_Address: $(DOLLAR)C0DD2C
 */
void psiTeleportWaitNFrames(short n) {
	for (short i = n; i != 0; i--) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
}

/** Initiate a PSI Teleport sequence
 * Original_Address: $(DOLLAR)C0DD53
 */
void setTeleportState(ubyte arg1, PSITeleportStyle arg2) {
	psiTeleportDestination = arg1;
	psiTeleportStyle = arg2;
}

/** Load the destination for a successful PSI Teleport
 * Original_Address: $(DOLLAR)C0DD79
 */
void psiTeleportLoadDestination() {
	for (short i = 1; i <= 10; i++) {
		setEventFlag(i, 0);
	}
	currentTeleportDestinationX = psiTeleportDestinationTable[psiTeleportDestination].x;
	currentTeleportDestinationY = psiTeleportDestinationTable[psiTeleportDestination].y;
	short x02 = cast(short)(currentTeleportDestinationX * 8);
	short x0E = cast(short)(currentTeleportDestinationY * 8);
	if (psiTeleportStyle != PSITeleportStyle.instant) {
		x02 += 0x13C;
	}
	currentMapMusicTrack = -1;
	loadedMapPalette = -1;
	loadedMapTileCombo = -1;
	initializeMap(x02, x0E, 6);
}

/** Set initial animation flags for party members starting to PSI Teleport
 * Original_Address: $(DOLLAR)C0DE16
 */
void setupTeleportingEntities() {
	for (short i = 0x18; i < 0x1E; i++) {
		entityScriptVar3Table[i] = 8;
		entityScriptVar7Table[i] |= PartyMemberMovementFlags.unknown11;
	}
}

/** Initialize PSI Teleport variables and entities
 * Original_Address: $(DOLLAR)C0DE46
 */
void initializePSITeleportation() {
	setupTeleportingEntities();
	psiTeleportBetaAngle = cast(short)(rand() << 8);
	if (psiTeleportStyle == PSITeleportStyle.psiBeta) {
		psiTeleportBetaProgress = 4;
	} else {
		psiTeleportBetaProgress = 8;
		psiTeleportBetterProgress = 0;
	}
	psiTeleportBetaXAdjustment = gameState.leaderX.integer;
	psiTeleportBetaYAdjustment = gameState.leaderY.integer;
}

/** Update teleportation speed based on old speed and teleportation stage
 * Original_Address: $(DOLLAR)C0DF22
 */
void psiTeleportUpdateSpeed(ushort direction) {
	FixedPoint1616 newSpeed;
	switch (teleportState) {
		case TeleportState.complete:
			if (gameState.specialGameState == SpecialGameState.useMiniSprites) {
				FixedPoint1616 tmpSpeed;
				tmpSpeed.combined = teleportationSpeed.combined;
				tmpSpeed.fraction += 0x51E; // +0.02
				if (tmpSpeed.fraction < 0x51E) {
					tmpSpeed.integer++;
				}
				newSpeed = tmpSpeed;
			} else {
				FixedPoint1616 tmpSpeed;
				tmpSpeed.combined = teleportationSpeed.combined;
				tmpSpeed.fraction += 0x3333; // + 0.2
				if (tmpSpeed.fraction < 0x3333) {
					tmpSpeed.integer++;
				}
				newSpeed = tmpSpeed;
			}
			break;
		case TeleportState.unknown3:
			if (gameState.specialGameState == SpecialGameState.useMiniSprites) {
				FixedPoint1616 tmpSpeed;
				tmpSpeed.combined = teleportationSpeed.combined;
				tmpSpeed.fraction -= 0x1999; // + 0.1
				if (tmpSpeed.fraction >= 0x10000 - 0x1999) {
					tmpSpeed.integer--;
				}
				newSpeed = tmpSpeed;
			} else {
				FixedPoint1616 tmpSpeed;
				tmpSpeed.combined = teleportationSpeed.combined;
				tmpSpeed.fraction -= 0x1999; // + 0.1
				if (tmpSpeed.fraction >= 0x10000 - 0x1999) {
					tmpSpeed.integer--;
				}
				newSpeed = tmpSpeed;
			}
			break;
		default:
			if (gameState.specialGameState == SpecialGameState.useMiniSprites) {
				FixedPoint1616 tmpSpeed;
				tmpSpeed.combined = teleportationSpeed.combined;
				tmpSpeed.fraction += 0x29FB; // + 0.164
				if (tmpSpeed.fraction < 0x29FB) {
					tmpSpeed.integer++;
				}
				newSpeed = tmpSpeed;
			} else {
				FixedPoint1616 tmpSpeed;
				tmpSpeed.combined = teleportationSpeed.combined;
				tmpSpeed.fraction += 0x1851; // + 0.095
				if (tmpSpeed.fraction < 0x1851) {
					tmpSpeed.integer++;
				}
				newSpeed = tmpSpeed;
			}
			break;
	}
	teleportationSpeed.combined = newSpeed.combined;
	if ((direction & 1) != 0) {
		psiTeleportSpeedX.combined = ((newSpeed.combined >> 8) * 0xB505) >> 8; // sqrt(2) / 2
		psiTeleportSpeedY.combined = ((newSpeed.combined >> 8) * 0xB505) >> 8; // sqrt(2) / 2
	} else {
		psiTeleportSpeedX.combined = newSpeed.combined;
		psiTeleportSpeedY.combined = newSpeed.combined;
	}
	switch (direction) { //this is hard to read. were the cases rearranged to dedupe code?
		case Direction.up:
			psiTeleportSpeedY.combined = -psiTeleportSpeedY.combined;
			goto case;
		case Direction.down:
			psiTeleportSpeedX.combined = 0;
			break;
		case Direction.left:
			psiTeleportSpeedX.combined = -psiTeleportSpeedX.combined;
			goto case;
		case Direction.right:
			psiTeleportSpeedY.combined = 0;
			break;
		case Direction.upRight:
			psiTeleportSpeedY.combined = -psiTeleportSpeedY.combined;
			break;
		case Direction.upLeft:
			psiTeleportSpeedY.combined = -psiTeleportSpeedY.combined;
			goto case;
		case Direction.downLeft:
			psiTeleportSpeedX.combined = -psiTeleportSpeedX.combined;
			break;
		default: break;
	}
}

/** Restore control after a successful PSI Teleport
 * Original_Address: $(DOLLAR)C0DE7C
 */
void psiTeleportRestoreControl() {
	currentPartyMemberTick = &partyCharacters[0];
	for (short i = partyMemberEntityStart; i < partyMemberEntityStart + partyCharacters.length; i++) {
		entityScriptVar3Table[i] = 8;
		entityScriptVar7Table[i] &= ~PartyMemberMovementFlags.unknown11;
		entityCollidedObjects[i] &= 0x7FFF;
		currentPartyMemberTick.unknown55 = 0xFFFF;
		currentPartyMemberTick++;
	}
	changeMapMusicImmediately();
}

/** Perform a PSI Teleport collision check. Check both the leader's current position and the position where it will be
 * Original_Address: $(DOLLAR)C0DED9
 */
short psiTeleportCheckCollision(short curX, short curY, short nextX, short nextY, short) {
	if (teleportState != TeleportState.inProgress) {
		return 1;
	}
	return getSurfaceFlags(curX, curY, gameState.firstPartyMemberEntity) | getSurfaceFlags(nextX, nextY, gameState.firstPartyMemberEntity);
}

/// $C0E196
void writePartyLeaderStateToPositionBuffer() {
	playerPositionBuffer[gameState.leaderPositionIndex].xCoord = gameState.leaderX.integer;
	playerPositionBuffer[gameState.leaderPositionIndex].yCoord = gameState.leaderY.integer;
	playerPositionBuffer[gameState.leaderPositionIndex].tileFlags =getSurfaceFlags(gameState.leaderX.integer, gameState.leaderY.integer, gameState.firstPartyMemberEntity);
	playerPositionBuffer[gameState.leaderPositionIndex].walkingStyle = 0;
	playerPositionBuffer[gameState.leaderPositionIndex].direction = gameState.leaderDirection;
	gameState.leaderPositionIndex++;
	gameState.leaderPositionIndex &= 0xFF;
}

/** Get current position buffer index while PSI Teleporting
 * Original_Address: $(DOLLAR)C0E214
 */
short psiTeleportGetPositionIndex(short characterID, short currentIndex) {
	if (gameState.partyMemberIndex[0] == characterID + 1) {
		return cast(short)(currentIndex + 1);
	}
	if (teleportationSpeed.integer == 0) {
		return currentIndex;
	}
	return getNewPositionIndex(characterID, 6, currentIndex, 2);
}

/** Increase animation frame rate according to teleportation speed
 * Original_Address: $(DOLLAR)C0E254
 */
void psiTeleportUpdateAnimationSpeed() {
	ushort x10 = cast(ushort)(12 - teleportationSpeed.integer);
	//weird way to say x10 <= 0
	if ((x10 == 0) || ((x10 & 0x8000) != 0)) {
		x10 = 1;
	}
	for (short i = 0x18; i < 0x1D; i++) {
		entityScriptVar3Table[i] = x10;
	}
}

/** A single tick of PSI Teleport alpha movement
 * Original_Address: $(DOLLAR)C0E28F
 */
void psiTeleportAlphaLeaderTick() {
	gameState.leaderHasMoved = 1;
	ushort newDirection = mapInputToDirection(0);
	// no cheating. you have to actually turn
	if (gameState.leaderDirection == (newDirection ^ 4)) {
		newDirection = gameState.leaderDirection;
	}
	// invalid or no input, just keep going
	if (newDirection == 0xFFFF) {
		newDirection = gameState.leaderDirection;
	}
	gameState.leaderDirection = newDirection;
	// whoops we hit an enemy
	if (battleSwirlCountdown != 0) {
		teleportState = TeleportState.failed;
		battleMode = BattleMode.teleportFailed;
	}
	psiTeleportUpdateSpeed(newDirection);
	psiTeleportNextX.combined = psiTeleportSpeedX.combined + gameState.leaderX.combined;
	psiTeleportNextY.combined = psiTeleportSpeedY.combined + gameState.leaderY.combined;
	if (npcCollisionCheck(psiTeleportNextX.integer, psiTeleportNextY.integer, gameState.firstPartyMemberEntity) != -1) {
		teleportState = TeleportState.failed;
	}
	if ((psiTeleportCheckCollision(gameState.leaderX.integer, gameState.leaderY.integer, psiTeleportNextX.integer, psiTeleportNextY.integer, newDirection) & 0xC0) != 0) {
		teleportState = TeleportState.failed;
	}
	if (teleportState != TeleportState.failed) {
		gameState.leaderX = psiTeleportNextX;
		gameState.leaderY = psiTeleportNextY;
	}
	centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
	writePartyLeaderStateToPositionBuffer();
	psiTeleportUpdateAnimationSpeed();
	if (teleportationSpeed.integer > 9) {
		teleportState = TeleportState.complete;
	}
}

/** Update following party members while teleporting
 * Original_Address: $(DOLLAR)C0E3C1
 */
void psiTeleportFollowerTick() {
	currentPartyMemberTick = &partyCharacters[entityScriptVar1Table[currentEntitySlot]];
	doPartyMovementFrame(entityScriptVar0Table[currentEntitySlot], playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].walkingStyle, currentEntitySlot);
	entityAbsXTable[currentEntitySlot] = playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].xCoord;
	entityAbsYTable[currentEntitySlot] = playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].yCoord;
	entityDirections[currentEntitySlot] = playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].direction;
	entitySurfaceFlags[currentEntitySlot] = playerPositionBuffer[partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex].tileFlags;
	currentPartyMemberTick.positionIndex = cast(ubyte)psiTeleportGetPositionIndex(entityScriptVar0Table[currentEntitySlot], partyCharacters[entityScriptVar1Table[currentEntitySlot]].positionIndex);
}

/** Adjust the movement of PSI Teleport beta based on controller input
 * Original_Address: $(DOLLAR)C0E44D
 */
void adjustPSITeleportBetaDirection() {
	if (psiTeleportStyle == PSITeleportStyle.psiBetter) {
		return;
	}
	if ((padState[0] & Pad.up) != 0) {
		psiTeleportBetaYAdjustment--;
	}
	if ((padState[0] & Pad.down) != 0) {
		psiTeleportBetaYAdjustment++;
	}
	if ((padState[0] & Pad.left) != 0) {
		psiTeleportBetaXAdjustment--;
	}
	if ((padState[0] & Pad.right) != 0) {
		psiTeleportBetaXAdjustment++;
	}
}

/** Update PSI Teleport beta speed according to current direction
 * Original_Address: $(DOLLAR)C0E48A
 */
void psiTeleportUpdateBetaSpeed() {
	psiTeleportSpeedY.integer = 0;
	psiTeleportSpeedX.integer = 0;
	switch (gameState.leaderDirection) {
		case Direction.up:
			psiTeleportSpeedY.integer = -5;
			break;
		case Direction.upRight:
			psiTeleportSpeedY.integer = -5;
			psiTeleportSpeedX.integer = 5;
			break;
		case Direction.right:
			psiTeleportSpeedX.integer = 5;
			break;
		case Direction.downRight:
			psiTeleportSpeedY.integer = 5;
			psiTeleportSpeedX.integer = 5;
			break;
		case Direction.down:
			psiTeleportSpeedY.integer = 5;
			break;
		case Direction.downLeft:
			psiTeleportSpeedY.integer = 5;
			psiTeleportSpeedX.integer = -5;
			break;
		case Direction.left:
			psiTeleportSpeedX.integer = -5;
			break;
		case Direction.upLeft:
			psiTeleportSpeedY.integer = -5;
			psiTeleportSpeedX.integer = -5;
			break;
		default: break;
	}
}

/** Leader tick function for PSI Teleport beta movement
 * Original_Address: $(DOLLAR)C0E516
 */
void psiTeleportBetaLeaderTick() {
	gameState.leaderHasMoved = 1;
	adjustPSITeleportBetaDirection();
	auto betaSpiralMovementPosition = unknownC41FFF(psiTeleportBetaAngle, psiTeleportBetaProgress);
	psiTeleportNextX.integer = cast(short)((betaSpiralMovementPosition.x >> 8) + psiTeleportBetaXAdjustment);
	psiTeleportNextY.integer = cast(short)((betaSpiralMovementPosition.y >> 8) + psiTeleportBetaYAdjustment);
	if (psiTeleportStyle != PSITeleportStyle.psiBetter) {
		if ((psiTeleportCheckCollision(gameState.leaderX.integer, gameState.leaderY.integer, psiTeleportNextX.integer, psiTeleportNextY.integer, gameState.leaderDirection) & 0xC0) != 0) {
			teleportState = TeleportState.failed;
		}
		if (battleSwirlCountdown != 0) {
			teleportState = TeleportState.failed;
			battleMode = BattleMode.teleportFailed;
		}
		if (npcCollisionCheck(psiTeleportNextX.integer, psiTeleportNextY.integer, gameState.firstPartyMemberEntity) != -1) {
			teleportState = TeleportState.failed;
		}
	}
	if (teleportState != TeleportState.failed) {
		gameState.leaderX.integer = psiTeleportNextX.integer;
		gameState.leaderY.integer = psiTeleportNextY.integer;
	}
	gameState.leaderDirection = ((psiTeleportBetaAngle >> 13) + 2) & 7;
	teleportationSpeed.combined += 0x1851; // about +0.95
	if (psiTeleportStyle == PSITeleportStyle.psiBeta) {
		psiTeleportBetaAngle += 0xA00;
		psiTeleportBetaProgress += 0xC;
	} else {
		psiTeleportBetterProgress += 0x20;
		psiTeleportBetaAngle += psiTeleportBetterProgress;
		psiTeleportBetaProgress += 0x10;
	}
	centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
	writePartyLeaderStateToPositionBuffer();
	psiTeleportUpdateAnimationSpeed();
	if (psiTeleportStyle == PSITeleportStyle.psiBeta) {
		if (psiTeleportBetaProgress > 0x1000) { // complete in 340 frames (5.666 seconds)
			teleportState = TeleportState.complete;
			psiTeleportUpdateBetaSpeed();
		}
	} else {
		if (psiTeleportBetterProgress > 0x1800) { // complete in 192 frames (3.2 seconds)
			teleportState = TeleportState.complete;
			psiTeleportUpdateBetaSpeed();
		}
	}
}

/** Leader tick function for PSI Teleport departure
 *
 * Update speed, position, adjust screen position according to screen speed and update position buffer
 * Original_Address: $(DOLLAR)C0E674
 */
void psiTeleportSuccessDepartLeaderTick() {
	psiTeleportUpdateSpeed(gameState.leaderDirection);
	gameState.leaderX.combined += psiTeleportSpeedX.combined;
	gameState.leaderY.combined += psiTeleportSpeedY.combined;
	psiTeleportSuccessScreenX += psiTeleportSuccessScreenSpeedX;
	psiTeleportSuccessScreenY += psiTeleportSuccessScreenSpeedY;
	centerScreen(psiTeleportSuccessScreenX, psiTeleportSuccessScreenY);
	writePartyLeaderStateToPositionBuffer();
}

/** Leader tick function for PSI Teleport arrivals
 *
 * Update speed, position, center screen on leader, update position buffer and update animation speed
 * Original_Address: $(DOLLAR)C0E776
 */
void psiTeleportArriveLeaderTick() {
	psiTeleportUpdateSpeed(gameState.leaderDirection);
	gameState.leaderX.combined += psiTeleportSpeedX.combined;
	gameState.leaderX.combined += psiTeleportSpeedY.combined;
	centerScreen(cast(short)(gameState.leaderX.integer - ((teleportationSpeed.combined * 2) & 0xFFFF)), gameState.leaderY.integer);
	writePartyLeaderStateToPositionBuffer();
	psiTeleportUpdateAnimationSpeed();
}

/** Disables collision and teleports out of the current area
 * Original_Address: $(DOLLAR)C0E815
 */
void psiTeleportDepart() {
	if (psiTeleportStyle == PSITeleportStyle.instant) {
		return;
	}
	for (short i = 0x18; i < 0x1E; i++) {
		entityCollidedObjects[i] = 0x8000;
	}
	psiTeleportSpeedY.integer = 0;
	psiTeleportSpeedX.integer = 0;
	setPartyTickCallbacks(partyLeaderEntity, &psiTeleportSuccessDepartLeaderTick, &psiTeleportFollowerTick);
	psiTeleportSuccessScreenSpeedX = psiTeleportSpeedX.integer;
	psiTeleportSuccessScreenX = gameState.leaderX.integer;
	psiTeleportSuccessScreenSpeedY = psiTeleportSpeedY.integer;
	psiTeleportSuccessScreenY = gameState.leaderY.integer;
	fadeOut(1, 4);
	waitForFadeToFinish();
}

/** Fade in and finish teleporting into destination
 * Original_Address: $(DOLLAR)C0E897
 */
void psiTeleportArrive() {
	if (psiTeleportStyle == PSITeleportStyle.instant) {
		centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
		fadeIn(1, 1);
		waitForFadeToFinish();
		return;
	}
	for (short i = 0; i < 6; i++) {
		partyCharacters[i].unknown55 = 0xFFFF;
		version(noUndefinedBehaviour) {
			if (gameState.partyMemberIndex[i] == 0) {
				continue;
			}
		}
		doPartyMovementFrame(gameState.partyMemberIndex[i] - 1, 0, cast(short)(i + 0x18));
	}
	teleportationSpeed.fraction = 0;
	teleportationSpeed.integer = 8;
	gameState.leaderDirection = 6;
	teleportState = TeleportState.unknown3;
	setPartyTickCallbacks(partyLeaderEntity, &psiTeleportArriveLeaderTick, &psiTeleportFollowerTick);
	setupTeleportingEntities();
	changeMusic(Music.teleportIn);
	for (short i = 0; i < 0x1E; i++) {
		waitUntilNextFrame();
	}
	fadeIn(1, 4);
	while (teleportationSpeed.integer != 0) {
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
	centerScreen(gameState.leaderX.integer, gameState.leaderY.integer);
}

/** Leader does nothing during a PSI Teleport fail
 * Original_Address: $(DOLLAR)C0E979
 */
void psiTeleportFailLeaderTick() {
	//nothing
}

/** When party members get to move, clean the soot off
 * $(DOLLAR)C0E97C
 */
void psiTeleportFailFollowerTick() {
	entitySurfaceFlags[currentEntitySlot] = getSurfaceFlags(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], currentEntitySlot);
	doPartyMovementFrame(entityScriptVar0Table[currentEntitySlot], -1, currentEntitySlot);
}

/** Player failed to teleport, update state as appropriate
 * Original_Address: $(DOLLAR)C0E9BA
 */
void psiTeleportFail() {
	disabledTransitions = 1;
	changeMusic(Music.teleportFail);
	for (short i = partyMemberEntityStart; i < maxEntities; i++) {
		entityScriptVar7Table[i] |= PartyMemberMovementFlags.unknown15;
	}
	setPartyTickCallbacks(partyLeaderEntity, &psiTeleportFailLeaderTick, &psiTeleportFailFollowerTick);
	gameState.partyStatus = PartyStatus.burnt;
	for (short i = 0; i < 180; i++) { // wait 3 seconds
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
	gameState.partyStatus = PartyStatus.normal;
	disabledTransitions = 0;
}

/** Make sure all the non-party entities are frozen for PSI teleportation
 * Original_Address: $(DOLLAR)C0EA3E
 */
void psiTeleportFreezeObjects() {
	for (short i = 0; i < partyLeaderEntity; i++) {
		entityCallbackFlags[i] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
	}
}

/** Make sure all the non-party entities are frozen for PSI teleportation in a less expensive way suitable for a hot loop
 * Original_Address:$(DOLLAR)C0EA68
 */
void psiTeleportFreezeObjectsLoop() {
	for (short i = 0; i < partyLeaderEntity; i++) {
		if ((entityCallbackFlags[i] & (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled)) != (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled)) {
			entityCallbackFlags[i] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
		}
	}
}

/** Handles entire PSI teleportation process
 * Original_Address: $(DOLLAR)C0EA99
 */
void teleportMainLoop() {
	stopMusic();
	waitUntilNextFrame();
	psiTeleportFreezeObjects();
	unread7E5DBA = 1;
	teleportationSpeed.fraction = 0;
	teleportationSpeed.integer = 0;
	teleportState = TeleportState.inProgress;
	playerIntangibilityFlash();
	initializePSITeleportation();
	switch(psiTeleportStyle) {
		case PSITeleportStyle.psiAlpha:
		case PSITeleportStyle.learnAlpha:
			setPartyTickCallbacks(partyLeaderEntity, &psiTeleportAlphaLeaderTick, &psiTeleportFollowerTick);
			break;

		case PSITeleportStyle.psiBeta:
			setPartyTickCallbacks(partyLeaderEntity, &psiTeleportBetaLeaderTick, &psiTeleportFollowerTick);
			break;
		case PSITeleportStyle.instant:
			teleportState = TeleportState.complete;
			break;
		case PSITeleportStyle.psiBetter:
			setPartyTickCallbacks(partyLeaderEntity, &psiTeleportBetaLeaderTick, &psiTeleportFollowerTick);
			break;
		default: break;
	}
	if (psiTeleportStyle != PSITeleportStyle.instant) {
		changeMusic(Music.teleportOut);
	}
	while (teleportState == TeleportState.inProgress) {
		oamClear();
		runActionscriptFrame();
		psiTeleportFreezeObjectsLoop();
		updateScreen();
		waitUntilNextFrame();
	}

	switch (teleportState) {
		case TeleportState.complete:
			psiTeleportDepart();
			psiTeleportLoadDestination();
			psiTeleportArrive();
			if (psiTeleportStyle == PSITeleportStyle.learnAlpha) {
				displayTextWindowless(getTextBlock("MSG_EVT_MASTER_TLPT"));
			}
			break;
		case TeleportState.failed:
			psiTeleportFail();
			psiTeleportWaitNFrames(10);
			break;
		default: break;
	}
	setPartyTickCallbacks(partyLeaderEntity, &partyLeaderTick, &partyMemberTick);
	psiTeleportRestoreControl();
	unfreezeEntities();
	unread7E5DBA = 0;
	teleportationSpeed.fraction = 0;
	teleportationSpeed.integer = 0;
	playerIntangibilityFrames = 0;
	psiTeleportDestination = 0;
}

/** Loads the graphics data needed for the title screen
 * Original_Address: $(DOLLAR)C0EBE0
 */
void loadTitleScreenGraphics() {
	decomp(&titleScreenTiles[0], &buffer[0]);
	copyToVRAM(0, 0x8000, 0, &buffer[0]);
	decomp(&titleScreenTilemap[0], &buffer[0]);
	copyToVRAM(0, 0x1000, 0x5800, &buffer[0]);
	decomp(&titleScreenLetterTiles[0], &buffer[0]);
	copyToVRAM(0, 0x4000, 0x6000, &buffer[0]);
}

/** Loads the palettes for one of the two special title screen effects
 * Params:
 * 	id = The palette effect to load (see TitleScreenPaletteEffect for valid options)
 * Original_Address: $(DOLLAR)C0EC77
 */
void loadTitleScreenPaletteEffect(short id) {
	if (id == TitleScreenPaletteEffect.letterShimmer) {
		decomp(&titleScreenLetterShimmerPalette[0], &buffer[0]);
	} else {
		decomp(&titleScreenLetterGlowPalette[0], &buffer[0]);
	}
}

/** Prepares the background fade-in effect for the title screen
 * Original_Address: $(DOLLAR)C0ECB7
 */
void prepareTitleScreenFadeIn() {
	paletteUploadMode = PaletteUpload.none;
	decomp(&titleScreenPalette[0], &palettes[0][0]);
	prepareLoadedPalettesForFade();
	memset(&palettes[0][0], 0, 0x100);
	prepareLoadedPaletteFadeTables(165, PaletteMask.allBGs);
	paletteUploadMode = PaletteUpload.full;
}

/** Sets all BG palettes to white
 * Original_Address: $(DOLLAR)C0ED14
 */
void setBGPalettesWhite() {
	memset(&palettes[0][0], 0xFF, 0x100);
	paletteUploadMode = PaletteUpload.full;
}

/** Sets all BG palettes to black
 * Original_Address: $(DOLLAR)C0ED39
 */
void setBGPalettesBlack() {
	memset(&palettes[0][0], 0, 0x100);
	paletteUploadMode = PaletteUpload.full;
}

/// $C0ED5C
void unknownC0ED5C() {
	paletteUploadMode = PaletteUpload.none;
	decomp(&titleScreenPalette[0], &palettes[0][0]);
	loadTitleScreenPaletteEffect(TitleScreenPaletteEffect.letterShimmer);
	memcpy(&palettes[8][0], &buffer[0x1A0], 0x20);
	loadTitleScreenPaletteEffect(TitleScreenPaletteEffect.letterGlow);
	memcpy(&palettes[7][0], &buffer[0x260], 0x20);
	paletteUploadMode = PaletteUpload.full;
}

/** Sets the ActionScript interpreter state to a special title screen state, which is identical to the running state except interrupting the title screen script is forbidden
 * Original_Address: $(DOLLAR)C0EDD1
 */
void setTitleScreenActionScriptState() {
	actionscriptState = ActionScriptState.titleScreenSpecial;
}

/** Rotates in a loaded palette based on VAR0, VAR1 and VAR2 of the active entity
 *
 * VAR0 is the source palette ID, and is incremented automatically
 * VAR1 is the target palette ID
 * VAR2 is the maximum source palette ID, after which the palette will automatically rotate back to 0
 * Original_Address: $(DOLLAR)C0EDDA
 */
void rotateLoadedPalette() {
	short palette = entityScriptVar0Table[currentEntitySlot];
	short targetPalette = entityScriptVar1Table[currentEntitySlot];
	short paletteLimit = entityScriptVar2Table[currentEntitySlot];
	memcpy(&palettes[targetPalette][0], &buffer[palette * 32], 0x20);
	short nextPalette = cast(short)(palette + 1);
	if (nextPalette == paletteLimit) {
		nextPalette = 0;
	}
	entityScriptVar0Table[currentEntitySlot] = nextPalette;
	paletteUploadMode = PaletteUpload.full;
}

/// $C0EE47
void unknownC0EE47() {
	mirrorTM = TMTD.obj | TMTD.bg2 | TMTD.bg1;
}

/// $C0EE53
void unknownC0EE53() {
	entitySpriteMapFlags[currentEntitySlot] &= ~SpriteMapFlags.drawDisabled;
}

/// $C0EE68
void logoScreenLoad(short arg1) {
	setBGMODE(BGMode.mode1 | BG3Priority);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x4000, 0);
	mirrorTM = TMTD.bg3;
	switch (arg1) {
		case 0:
			decomp(&splashScreen1Tiles[0], &buffer[0]);
			decomp(&splashScreen1Tilemap[0], &introBG2Buffer[0]);
			decomp(&splashScreen1Palette[0], &palettes[0][0]);
			break;
		case 1:
			decomp(&splashScreen2Tiles[0], &buffer[0]);
			decomp(&splashScreen2Tilemap[0], &introBG2Buffer[0]);
			decomp(&splashScreen2Palette[0], &palettes[0][0]);
			break;
		case 2:
			decomp(&splashScreen3Tiles[0], &buffer[0]);
			decomp(&splashScreen3Tilemap[0], &introBG2Buffer[0]);
			decomp(&splashScreen3Palette[0], &palettes[0][0]);
			break;
		default: break;
	}
	copyToVRAM(0, 0x8000, 0, &buffer[0]);
	copyToVRAM(0, 0x800, 0x4000, &introBG2Buffer[0]);
	paletteUploadMode = PaletteUpload.full;
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
	decomp(&gasStationTiles[0], &buffer[0]);
	copyToVRAM(0, 0xC000, 0, &buffer[0]);
	decomp(&gasStationTilemap[0], &buffer[0]);
	copyToVRAM(0, 0x800, 0x7800, &buffer[0]);
	decomp(&gasStationPalette[0], &palettes[0][0]);
	unknownC4A377();
	prepareLoadedPalettesForFade();
	memset(&buffer[0x40], 0, 0x20);
	memset(&palettes[0][0], 0, 0x40);
	memset(&palettes[3][0], 0, 0x1A0);
	prepareLoadedPaletteFadeTables(480, PaletteMask.all);
	mirrorTM = TMTD.bg1;
	mirrorTD = TMTD.bg2;
	CGWSEL = 2;
	CGADSUB = 3;
	paletteUploadMode = PaletteUpload.full;
}

/// $C0F1D2
void unknownC0F1D2(short duration) {
	//the original code also seems to set the bank byte separately, for some reason.
	multiplyPalettes(100, &palettes[0][0]);
	prepareLoadedPaletteFadeTables(duration, PaletteMask.all);
}

/** Runs the portion of the gas station intro screen that can end early when a button is pressed
 * Original_Address: $(DOLLAR)C0F21E
 */
short runGasStationSkippablePortion() {
	short result = 0;
	for (short i = 0; i < 236; i++) {
		if (padPress[0] != 0) {
			return 1;
		}
		drawBattleFrame();
		waitUntilNextFrame();
	}
	for (short i = 0; i < 480; i++) {
		if (padPress[0] != 0) {
			return 1;
		}
		memcpy(&mapPaletteBackup[0], &palettes[2][0], 0x20);
		updateMapPaletteAnimation();
		paletteUploadMode = PaletteUpload.none;
		replaceLoadedAnimatedLayer1Palette();
		memcpy(&palettes[2][0], &mapPaletteBackup[0], 0x20);
		drawBattleFrame();
		paletteUploadMode = PaletteUpload.full;
		waitUntilNextFrame();
	}
	finishPaletteFade();
	CGADSUB = 0;
	CGWSEL = 0;
	mirrorTM = TMTD.bg1;
	mirrorTD = TMTD.none;
	if (unknownC0EFE1(120) != 0) {
		return 1;
	}
	changeMusic(Music.gasStation2);
	short x12 = initEntityWipe(ActionScript.gasStationFlashing, 0, 0);
	while (entityScriptTable[x12] != -1) {
		runActionscriptFrame();
		waitUntilNextFrame();
		if (padPress[0] != 0) {
			deleteEntity(x12);
			return 1;
		}
	}
	unknownC0F1D2(330);
	return result;
}

/// $C0F33C
short gasStation() {
	initializeEntitySubsystem();
	gasStationLoad();
	fadeIn(1, 11);
	short x11 = runGasStationSkippablePortion();
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
	mirrorTM = TMTD.none;
	memset(&palettes[0][0], 0, 0x200);
	paletteUploadMode = PaletteUpload.full;
	if (x11 == 0) { //isn't this always true...?
		unknownC0EFE1(0x1E);
	}
	return x11;
}

/** Loads the 'flash' palette for the gas station screen
 * Original_Address: $(DOLLAR)C0F3B2
 */
void loadGasStationFlashPalette() {
	decomp(&gasStationFlashPalette[0], &palettes[0][0]);
	preparePaletteUpload(PaletteUpload.full);
}

/** Loads the original gas station screen palette
 * Original_Address: $(DOLLAR)C0F3E8
 */
void loadGasStationPalette() {
	decomp(&gasStationPalette[0], &palettes[0][0]);
	preparePaletteUpload(PaletteUpload.full);
}

/** Performs a single frame of scrolling for the credits scene
 * Original_Address: $(DOLLAR)C0F41E
 */
void creditsScrollFrame() {
	if (bg3YPosition > creditsNextCreditPosition) {
		short x23 = creditsCurrentRow;
		short x21 = cast(short)(creditsCurrentRow + 1);
		creditsCurrentRow = (creditsCurrentRow + 2) & 0xF;
		short x04 = ((bg3YPosition / 8) + 29) & 0x1F;
		short x02 = 0;
		short x1F = 0;
		const(ubyte)* x1B = creditsSource;
		ushort* x17 = &bg2Buffer[x23 * 32];
		ushort* x0A = &bg2Buffer[x21 * 32];
		short x15 = (x1B++)[0];
		switch (x15) {
			case 1:
				creditsNextCreditPosition += 8;
				while (x1B[0] != 0) {
					(x17++)[0] = cast(ushort)((x1B++)[0] + 0x2000);
					x02++;
				}
				enqueueCreditsDMA(0, cast(short)(x02 * 2), cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)), cast(ubyte*)&bg2Buffer[x23 * 32]);
				break;
			case 2:
				creditsNextCreditPosition += 16;
				while (x1B[0] != 0) {
					(x17++)[0] = cast(ushort)(x1B[0] + 0x2400);
					(x0A++)[0] = cast(ushort)((x1B++)[0] + 0x2410);
					x02++;
				}
				enqueueCreditsDMA(0, cast(short)(x02 * 2), cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)), cast(ubyte*)&bg2Buffer[x23 * 32]);
				if (x04 != 0x1F) {
					x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) + 0x20);
				} else {
					x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) - 0x3E0);
				}
				enqueueCreditsDMA(0, cast(short)(x02 * 2), x23, cast(ubyte*)&bg2Buffer[x21 * 32]);
				break;
			case 3:
				creditsNextCreditPosition += x1B[0] * 8;
				break;
			case 4:
				ubyte* x15_2 = &gameState.earthboundPlayerName[0];
				if (x15_2[0] != 0) {
					for (short i = 0; x15_2[0] != 0; i++) {
						short x13 = x15_2[0];
						switch (x13) {
							case ebChar('♪'):
								creditsPlayerNameBuffer[i] = 0x7C;
								break;
							case 0xAE: //tilde
								creditsPlayerNameBuffer[i] = 0x7E;
								break;
							case 0xAF: //tall o
								creditsPlayerNameBuffer[i] = 0x7F;
								break;
							default:
								if (x13 > 0x90) {
									x13 -= 0x50;
								} else {
									x13 -= 0x30;
								}
								creditsPlayerNameBuffer[i] = cast(ubyte)x13;
								break;
						}
						x15_2++;
					}
					creditsNextCreditPosition += 16;
					for (short i = 0; (creditsPlayerNameBuffer[i] != 0) && (i < 24); i++) {
						(x17++)[0] = cast(ushort)((creditsPlayerNameBuffer[i] & 0xF0) + creditsPlayerNameBuffer[i] + 0x2400);
						(x0A++)[0] = cast(ushort)((creditsPlayerNameBuffer[i] & 0xF0) + creditsPlayerNameBuffer[i] + 0x2410);
						x02++;
					}
					enqueueCreditsDMA(0, cast(short)(x02 * 2), cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)), cast(ubyte*)&bg2Buffer[x23 * 32]);
					if (x04 != 0x1F) {
						x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) + 0x20);
					} else {
						x23 = cast(short)(cast(short)((x04 * 32 + 0x6C10) - (x02 / 2)) - 0x3E0);
					}
					enqueueCreditsDMA(0, cast(short)(x02 * 2), x23, cast(ubyte*)&bg2Buffer[x21 * 32]);
				}
				x1B--;
				break;
			case 0xFF:
				creditsNextCreditPosition = 0xFFFF;
				break;
			default: break;
		}
		creditsSource = x1B + 1;
	}
	if (creditsRowWipeThreshold < bg3YPosition) {
		creditsRowWipeThreshold += 8;
		enqueueCreditsDMA(3, 0x40, ((((bg3YPosition / 8) - 1) & 0x1F) * 32) + 0x6C00, &blankTiles[0]);
	}
	creditsScrollPosition.combined += 0x4000;
	bg3YPosition = creditsScrollPosition.integer;
	unknownC0AD9F();
}
