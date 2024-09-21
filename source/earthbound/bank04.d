/// more misc things
module earthbound.bank04;

import earthbound.commondefs;
import earthbound.hardware;
import earthbound.actionscripts;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank08;
import earthbound.bank0A;
import earthbound.bank0C;
import earthbound.bank0E;
import earthbound.bank0F;
import earthbound.bank10;
import earthbound.bank11;
import earthbound.bank15;
import earthbound.bank17;
import earthbound.bank18;
import earthbound.bank20;
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.globals;
import earthbound.testing;
import earthbound.text;
import core.stdc.string;

import std.logger;

/** Tests if the active entity is onscreen and also resets the animation state
 * Returns: -1 if onscreen, 0 otherwise
 * Original_Address: $(DOLLAR)C40015
 */
short isEntityOnscreenResetAnimation() {
	entityAnimationFrames[currentActiveEntityOffset / 2] = 0;
	updateEntitySpriteCurrentFrame0();
	return isEntityOnscreen();
}

/** Sleeps for a number of frames equal to the slot number (modulo 16).
 * Useful for guaranteeing that multiple entities sharing scripts won't sync up awkwardly.
 * Original_Address: $(DOLLAR)C40023
 */
void sleepSlotFrames() {
	entityScriptSleepFrames[currentEntityScriptOffset / 2] = currentEntitySlot & 0xF;
}

/** Uploads a single 8x16 text tile into VRAM
 * Params:
 * 	id = VWF tile index
 * 	destUpper = Tile offset for the upper half
 * 	destLower = Tile offset for the lower half
 * Original_Address: $(DOLLAR)C4002F
 */
void uploadTextTile(short id, ushort destUpper, ushort destLower) {
	dmaCopyRAMSource = &vwfBuffer[id][0];
	dmaCopyMode = 0;
	dmaCopySize = 16;
	//lol segmented addressing
	//dmaCopyRAMSource = 0x7E
	dmaCopyVRAMDestination = cast(ushort)((destUpper * 8) + 0x6000);
	copyToVRAMCommon();
	dmaCopyRAMSource += 0x10;
	dmaCopyVRAMDestination = cast(ushort)((destLower * 8) + 0x6000);
	copyToVRAMCommon();
	dmaTransferFlag = (mirrorINIDISP & 0x80) ^ 0x80;
}

/** Reserves space for a BG2 tile
 *
 * Only the first half of the BG2 map is searched. The other half technically goes unused, but misc window graphics exist in the corresponding space anyway
 * Returns: First free bit in usedBG2TileMasks
 * Original_Address: $(DOLLAR)C40085
 */
short reserveBG2Tile() {
	ushort offset = 8;
	// find a free space
	while (0xFFFF == usedBG2TileMap[offset / 2]) {
		offset += 2;
		if (offset != usedBG2TileMap.length) {
			continue;
		}
		// uh oh, overflowed. bail out
		hideHPPPWindows();
		closeAllWindows();
		unfreezeEntities();
		//longjmp(&jmpbuf2);
		assert(0, "No space left for new BG2 tiles");
	}
	ushort bit = 30;
	ushort reservedBits = usedBG2TileMap[offset / 2];
	// find first free bit
	while (reservedBits >= 0x8000) {
		bit -= 2;
		reservedBits <<= 1;
	}
	usedBG2TileMap[offset / 2] |= usedBG2TileMasks[bit / 2];
	usedBG2TileMapFirstFreeBit = bit;
	usedBG2TileMapFirstFreeBit >>= 1;
	return cast(short)(usedBG2TileMapFirstFreeBit + offset * 8);
}

/** Prepares to enter a failure state, where a fullscreen message is shown on BG3
 * Original_Address: $(DOLLAR)C40B51
 */
void prepareGameFailure() {
	stopMusic();
	setBGMODE(BGMode.mode1);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x4000, 0);
	mirrorTM = TMTD.bg3;
	prepareForImmediateDMA();
}

/** Displays failure message on BG3 and loops forever
 * Original_Address: $(DOLLAR)C40B75
 */
noreturn gameFailureLoop() {
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0xA00, 0, &buffer[0]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x800, 0x4000, &buffer[0x4000]);
	memcpy(&palettes[0][0], &warningPalette[0], 0x10);
	preparePaletteUpload(PaletteUpload.full);
	fadeInWithMosaic(1, 1, 0);
	while (true) {}
}

/** Sounds to use for footsteps. First 8 correspond to map sector types, last two are only available for overrides
 * Original_Address: $(DOLLAR)C40BD4
 */
immutable short[10] footstepSoundTable = [
	Sfx.none,
	Sfx.none,
	Sfx.none,
	Sfx.none,
	Sfx.unknown15,
	Sfx.unknown0F,
	Sfx.none,
	Sfx.none,
	Sfx.unknown14,
	Sfx.unknown13,
];

/** 32 blank 4bpp tiles, for convenient erasing of VRAM
 * Original_Address: $(DOLLAR)C40BE8
 */
immutable ubyte[512] blankTiles = [
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
];

/** 漫符 (Manpu, "manga mark"), little emote bubbles that are displayed near entities
 * Original_Address: $(DOLLAR)C40DE8
 */
immutable Manpu[12] manpuTable = [
	Manpu(
		sprite: OverworldSprite.none,
		positioning: ManpuPositioning.none,
		relX: 0,
		relY: 0
	),
	Manpu(
		sprite: OverworldSprite.surpriseMark,
		positioning: ManpuPositioning.above,
		relX: 0,
		relY: -8
	),
	Manpu(
		sprite: OverworldSprite.cellPhoneTendaVillage,
		positioning: ManpuPositioning.centred,
		relX: -8,
		relY: -4
	),
	Manpu(
		sprite: OverworldSprite.exclamationMark,
		positioning: ManpuPositioning.above,
		relX: 8,
		relY: -8
	),
	Manpu(
		sprite: OverworldSprite.lightBulb,
		positioning: ManpuPositioning.above,
		relX: 0,
		relY: -8
	),
	Manpu(
		sprite: OverworldSprite.skyRunnerElectricThingies,
		positioning: ManpuPositioning.above,
		relX: 0,
		relY: -12
	),
	Manpu(
		sprite: OverworldSprite.flagOfTheExtinctHappyPeople,
		positioning: ManpuPositioning.above,
		relX: 0,
		relY: 8
	),
	Manpu(
		sprite: OverworldSprite.runaway5MembersHead,
		positioning: ManpuPositioning.above,
		relX: -8,
		relY: 16
	),
	Manpu(
		sprite: OverworldSprite.runaway5MembersHead,
		positioning: ManpuPositioning.above,
		relX: 8,
		relY: 16
	),
	Manpu(
		sprite: OverworldSprite.heart,
		positioning: ManpuPositioning.above,
		relX: 0,
		relY: -8
	),
	Manpu(
		sprite: OverworldSprite.busDriverHead,
		positioning: ManpuPositioning.above,
		relX: -16,
		relY: 16
	),
	Manpu(
		sprite: OverworldSprite.busDriverHead,
		positioning: ManpuPositioning.above,
		relX: 16,
		relY: 16
	),
];

/** Number of entity overlays
 * Original_Address: $(DOLLAR)C40E31
 */
immutable ubyte entityOverlayCount = 4;

/** Sprites used for entity overlays
 * Original_Address: $(DOLLAR)C40E32
 */
immutable EntityOverlaySprite[entityOverlayCount] entityOverlaySprites = [
	EntityOverlaySprite(OverworldSprite.sweat, 0, 1),
	EntityOverlaySprite(OverworldSprite.littleMushroom, 0, 0xFF),
	EntityOverlaySprite(OverworldSprite.waterRipple, 0, 0xFF),
	EntityOverlaySprite(OverworldSprite.bigWaterRipple, 0, 0xFF),
];

/// Spritemap for sweating overlay, frame 1
immutable SpriteMap[2] entityOverlaySweatingFrame1 = [
	SpriteMap(240, 96, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 234, SpriteMapSpecialFlags.terminator),
	SpriteMap(240, 96, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 234, SpriteMapSpecialFlags.terminator),
];

/// Spritemap for sweating overlay, frame 2
immutable SpriteMap[2] entityOverlaySweatingFrame2 = [
	SpriteMap(240, 98, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 234, SpriteMapSpecialFlags.terminator),
	SpriteMap(240, 98, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 234, SpriteMapSpecialFlags.terminator),
];

/// Spritemap for sweating overlay, frame 3
immutable SpriteMap[2] entityOverlaySweatingFrame3 = [
	SpriteMap(240, 96, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 4, SpriteMapSpecialFlags.terminator),
	SpriteMap(240, 96, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 4, SpriteMapSpecialFlags.terminator),
];

/// Spritemap for sweating overlay, frame 4
immutable SpriteMap[2] entityOverlaySweatingFrame4 = [
	SpriteMap(240, 98, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 4, SpriteMapSpecialFlags.terminator),
	SpriteMap(240, 98, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 4, SpriteMapSpecialFlags.terminator),
];

/// Spritemap for mushroom overlay
immutable SpriteMap[2] entityOverlayMushroomizedFrame = [
	SpriteMap(232, 100, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 248, SpriteMapSpecialFlags.terminator),
	SpriteMap(232, 100, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 248, SpriteMapSpecialFlags.terminator),
];

/// Spritemap for ripple overlay, frame 1
immutable SpriteMap[2] entityOverlayRippleFrame1 = [
	SpriteMap(254, 102, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 248, SpriteMapSpecialFlags.terminator),
	SpriteMap(254, 102, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 248, SpriteMapSpecialFlags.terminator),
];

/// Spritemap for ripple overlay, frame 2
immutable SpriteMap[2] entityOverlayRippleFrame2 = [
	SpriteMap(254, 102, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 248, SpriteMapSpecialFlags.terminator),
	SpriteMap(254, 102, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 248, SpriteMapSpecialFlags.terminator),
];

/// Spritemap for big ripple overlay, frame 1
immutable SpriteMap[4] entityOverlayBigRippleFrame1 = [
	SpriteMap(248, 104, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 240, SpriteMapSpecialFlags.none),
	SpriteMap(248, 106, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 0, SpriteMapSpecialFlags.terminator),
	SpriteMap(248, 104, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 240, SpriteMapSpecialFlags.none),
	SpriteMap(248, 106, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable, 0, SpriteMapSpecialFlags.terminator),
];

/// Spritemap for big ripple overlay, frame 2
immutable SpriteMap[] entityOverlayBigRippleFrame2 = [
	SpriteMap(248, 106, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 240, SpriteMapSpecialFlags.none),
	SpriteMap(248, 104, OAMAttributes.priority3 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 0, SpriteMapSpecialFlags.terminator),
	SpriteMap(248, 106, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 240, SpriteMapSpecialFlags.none),
	SpriteMap(248, 104, OAMAttributes.priority2 | OAMAttributes.palette1 | OAMAttributes.upperNameTable | OAMAttributes.flipHorizontal, 0, SpriteMapSpecialFlags.terminator),
];

/** Overlay script for sweating overlay
 *
 * Displays frame 1 for 8 frames, frame 2 for 8 frames, nothing for 16 frames, frame 3 for 8 frames, frame 4 for 8 frames, nothing for 16 frames, looping
 */
immutable OverlayScript[13] entityOverlaySweating;
shared static this() {
	entityOverlaySweating = [
		OverlayScript.show(entityOverlaySweatingFrame1.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(entityOverlaySweatingFrame2.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(cast(const(SpriteMap)*)null),
		OverlayScript.delay(16),
		OverlayScript.show(entityOverlaySweatingFrame3.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(entityOverlaySweatingFrame4.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(cast(const(SpriteMap)*)null),
		OverlayScript.delay(16),
		OverlayScript.jump(entityOverlaySweating.ptr),
	];
}

/** Overlay script for mushroom overlay
 *
 * Displays frame 1, forever
 */
immutable OverlayScript[3] entityOverlayMushroomized;
shared static this() {
	entityOverlayMushroomized = [
		OverlayScript.show(entityOverlayMushroomizedFrame.ptr),
		OverlayScript.delay(255),
		OverlayScript.jump(entityOverlayMushroomized.ptr)
	];
}

/** Overlay script for ripples
 *
 * Displays frame 1 for 12 frames, frame 2 for 12 frames, looping
 */
immutable OverlayScript[5] entityOverlayRipple;
shared static this() {
	entityOverlayRipple = [
		OverlayScript.show(entityOverlayRippleFrame1.ptr),
		OverlayScript.delay(12),
		OverlayScript.show(entityOverlayRippleFrame2.ptr),
		OverlayScript.delay(12),
		OverlayScript.jump(entityOverlayRipple.ptr)
	];
}

/** Overlay script for big ripples
 *
 * Displays frame 1 for 12 frames, frame 2 for 12 frames, looping
 */
immutable OverlayScript[5] entityOverlayBigRipple;
shared static this() {
	entityOverlayBigRipple = [
		OverlayScript.show(entityOverlayBigRippleFrame1.ptr),
		OverlayScript.delay(12),
		OverlayScript.show(entityOverlayBigRippleFrame2.ptr),
		OverlayScript.delay(12),
		OverlayScript.jump(entityOverlayBigRipple.ptr)
	];
}
/** Decompresses data in HAL's proprietary compression format
 * Original_Address: $(DOLLAR)C41A9E
 */
void decomp(const(ubyte)* data, void* buffer) {
	// Reuse an existing implementation
	decompBlock(data, cast(ubyte*)buffer, 0x10000);
}

/** Calculates the screen angle between two given points. Range is 0- 65535, covering a full 360 degrees
 * Params:
 * 	x1 = X coordinate for start point
 * 	y1 = Y coordinate for start point
 * 	x2 = X coordinate for end point
 * 	y2 = Y coordinate for end point
 * Returns: The angle, in 1/65536s of a circle
 * Original_Address: $C41EFF
 */
ushort getScreenAngle(short x1, short y1, short x2, short y2) {
	short xDist = cast(short)(x1 - x2);
	// ensure x distance is positive
	if (xDist < 0) {
		xDist = cast(short)-xDist;
	}
	short yDist = cast(short)(y1 - y2);
	// ensure y distance is positive
	if (yDist < 0) {
		yDist = cast(short)-yDist;
	}
	// reduce x distance to a single byte, while reducing y distance proportionately
	while (true) {
		if (xDist < 256) {
			break;
		}
		xDist /= 2;
		yDist /= 2;
	}
	// atan2?
	short x0E;
	if (y1 - y2 == 0) {
		x0E = 0b1000;
	} else if (y1 - y2 > 0) {
		x0E = 0b0010;
	} else {
		x0E = 0b0000;
	}
	if (x1 - x2 == 0) {
		x0E |= 0b0100;
	} else if (x1 - x2 > 0) {
		x0E |= 0b0001;
	}
	if ((x0E & 0b1100) != 0) { // either x1 == x2 or y1 == y2, which means a right angle
		return unknownC41FC5[x0E];
	}
	short x08 = cast(short)(x0E * 2);
	short a = cast(short)(yDist << 8);
	if (yDist >= 256) { // only possible if y distance is significantly greater than x distance
		a = -1;
	}
	a = cast(ushort)a / xDist;
	short x = 0;
	while (x < 16) {
		if (a < unknownC41FDF[x]) {
			break;
		}
		x++;
	}
	a = x0E;
	if ((a != 0) && ((a ^ 3) != 0)) {
		x0E = cast(short)(x * 2);
		a = cast(short)(32 - x0E);
	} else {
		a = cast(short)(x * 2);
	}
	a *= 2;
	XBA(a);
	return cast(ushort)(a + unknownC41FC5[x08 / 2]);
}

unittest {
	assert(getScreenAngle(0x7D0,0x488,0x5F8,0x488) == 0xC000);
	assert(getScreenAngle(0x818,0x5D8,0x8F0,0x5D8) == 0x4000);
	assert(getScreenAngle(0x718,0x6E8,0x570,0x6E8) == 0xC000);
	assert(getScreenAngle(0x56F,0x694,0x575,0x6E3) == 0x7C00);
	assert(getScreenAngle(0x1DE8,0x8F0,0x1E10,0x8E8) == 0x3800);
	assert(getScreenAngle(0x4DB,0x1655,0x358,0x17D8) == 0xA000);
}

/// $C41FC5
immutable ushort[13] unknownC41FC5 = [
	0x4000,
	0x8000,
	0x0000,
	0xC000,
	0x8000,
	0xFFFF,
	0x0000,
	0xFFFF,
	0x4000,
	0xC000,
	0xFFFF,
	0xFFFF,
	0x0000,
];

/// $C41FDF
immutable ushort[16] unknownC41FDF = [
	13,
	38,
	64,
	92,
	121,
	153,
	190,
	232,
	282,
	345,
	427,
	541,
	715,
	1021,
	1723,
	5181,
];

/** Converts an angle (in 1/65536ths of a circle) and magnitude to an X,Y pair
 *
 * Params:
 * 	angle = The angle (in 1/65536ths of a circle, from the perspective of the player)
 * 	magnitude = The "size" of the vector
 * Returns: A pair of coordinates, (Y, X)
 * Original_Address: $(DOLLAR)C41FFF
 */
auto angleToVector(ushort angle, ushort magnitude) {
	static struct Result {
		short y;
		short x;
	}
	// use only top 6 bits of the angle. It's Good Enough™️
	const arg1Modified = angle >> 10;
	short x = cast(short)((angleToVectorSineTable[arg1Modified] * magnitude) / 256);
	short y = cast(short)((angleToVectorSineTable[arg1Modified + 48] * magnitude) / 256);
	if ((arg1Modified < 16) || (arg1Modified >= 49)) { // negate y for angles between ~270 - 90 degrees
		y = cast(short)-y;
	}
	if ((arg1Modified >= 33) && (arg1Modified < 64)) { // negate x for angles between ~180 - 360 degrees
		x = cast(short)-x;
	}
	// x = sin(angle) * magnitude
	// y = cos(angle) * magnitude
	return Result(y, x);
}

unittest {
	with(angleToVector(0x3800, 0xC0)) {
		assert(y == -37);
		assert(x == 188);
	}
	with(angleToVector(0xA000, 0x80)) {
		assert(y == 90);
		assert(x == -90);
	}
	with(angleToVector(0xB400, 0x80)) {
		assert(y == 37);
		assert(x == -122);
	}
	with(angleToVector(0xFC00, 0x180)) {
		assert(y == -381);
		assert(x == -37);
	}
	with(angleToVector(0, 256)) {
		assert(y == -256);
		assert(x == 0);
	}
}

/** Look-up table used by angleToVector()
 * Original_Address: $(DOLLAR)C4205D, $(DOLLAR)C420BD
 */
immutable ushort[113] angleToVectorSineTable = [
	0x0000,
	0x0019,
	0x0032,
	0x004A,
	0x0062,
	0x0079,
	0x008E,
	0x00A2,
	0x00B5,
	0x00C6,
	0x00D5,
	0x00E2,
	0x00EC,
	0x00F5,
	0x00FB,
	0x00FE,
	0x0100,
	0x00FE,
	0x00FB,
	0x00F5,
	0x00ED,
	0x00E2,
	0x00D5,
	0x00C6,
	0x00B5,
	0x00A2,
	0x008E,
	0x0079,
	0x0062,
	0x004A,
	0x0032,
	0x0019,
	0x0000,
	0x0019,
	0x0032,
	0x004A,
	0x0062,
	0x0079,
	0x008E,
	0x00A2,
	0x00B5,
	0x00C6,
	0x00D5,
	0x00E2,
	0x00EC,
	0x00F5,
	0x00FB,
	0x00FE,
	0x0100, // Start of data used for cosine
	0x00FE,
	0x00FB,
	0x00F5,
	0x00EC,
	0x00E2,
	0x00D5,
	0x00C6,
	0x00B5,
	0x00A3,
	0x008E,
	0x0079,
	0x0062,
	0x004B,
	0x0032,
	0x0019,
	0x0000, // End of data used for sine
	0x0019,
	0x0032,
	0x004A,
	0x0062,
	0x0079,
	0x008E,
	0x00A2,
	0x00B5,
	0x00C6,
	0x00D5,
	0x00E2,
	0x00EC,
	0x00F5,
	0x00FB,
	0x00FE,
	0x0100,
	0x00FE,
	0x00FB,
	0x00F5,
	0x00ED,
	0x00E2,
	0x00D5,
	0x00C6,
	0x00B5,
	0x00A2,
	0x008E,
	0x0079,
	0x0062,
	0x004A,
	0x0032,
	0x0019,
	0x0000,
	0x0019,
	0x0032,
	0x004A,
	0x0062,
	0x0079,
	0x008E,
	0x00A2,
	0x00B5,
	0x00C6,
	0x00D5,
	0x00E2,
	0x00EC,
	0x00F5,
	0x00FB,
	0x00FE,
	0x0100,
];

/** Multiplies two numbers together and divides the result by 256
 *
 * Params:
 * 	v1 = An 8-bit value
 * 	v2 = A 16-bit value
 * Returns: v1 * v2 / 256
 * Original_Address: $(DOLLAR)C4213F
 */
short multiplyWithDivisor256(short v1, short v2) {
	return ((v1 & 0xFF) * v2) >> 8;
}

unittest {
	assert(multiplyWithDivisor256(181, 512) == 362);
	assert(multiplyWithDivisor256(181, 384) == 271);
	assert(multiplyWithDivisor256(25, 384) == 37);
}

/** Set up the window parameters for the beam of light in the buzz buzz meteor intro scene
 * Original_address: $(DOLLAR)C423DC
 */
void bunbuunBeamInitialization() {
	// Put the left sides of the windows to the right of the right sides, ensuring the windows cover none of the screen
	WH0 = 128;
	WH2 = 128;
	WH1 = 127;
	WH3 = 127;

	CGWSEL = 0b00010000; // disable colour math only outside of window
	TMW = 0b00010011; // main window: mask BG1, BG2, OBJ
	// OR mask on all layers
	WBGLOG = 0;
	WOBJLOG = 0;
}

/** Set up the window parameters for the black square covering the map during the elevator cutscenes
 * Original_Address: $(DOLLAR)C4240A
 */
void elevaterInitialization() {
	// Have both windows cover full width of screen
	WH0 = 0;
	WH2 = 0;
	WH1 = 255;
	WH3 = 255;

	CGWSEL = 0b00100000; // disable colour math only inside of window
	TMW = 0b00010011; // main window: mask BG1, BG2, OBJ
	// OR mask on all layers
	WBGLOG = 0;
	WOBJLOG = 0;
}

/** Sets COLDATA for all three colours using ActionScript globals, as well as CGADSUB
 * Original_Address: $(DOLLAR)C42439
 */
void setCOLDATACGADSUB(short cgadsub) {
	CGADSUB = cast(ubyte)cgadsub;
	setFixedColourData(actionScriptCOLDATABlue | 0x80);
	setFixedColourData(actionScriptCOLDATAGreen | 0x40);
	setFixedColourData(actionScriptCOLDATARed | 0x20);
}

/** Enables HDMA for rectangle window effects, like buzz buzz's meteor beam and elevator hiding
 * Params:
 * 	table = Direct HDMA table to use
 * Original_Address: $(DOLLAR)C4245D
 */
void rectangleWindowEnableHDMA(const ubyte* table) {
	dmaChannels[4].DMAP = 1;
	dmaChannels[4].BBAD = 0x26;
	dmaChannels[4].A1T = table;
	// enable window math for window 1 and 2
	WOBJSEL = 0b10100000;
	// flip HDMA channel 5 on
	mirrorHDMAEN |= 0x10;
}

/** Disables HDMA for rectangle window effects, like buzz buzz's meteor beam and elevator hiding
 * Original_Address: $(DOLLAR)C4248A
 */
void rectangleWindowDisableHDMA() {
	// flip HDMA channel 5 off
	mirrorHDMAEN &= ~0x10;
	// disable window math
	WOBJSEL = 0;
}

/** Sets up a fullscreen colour math window using the specified CGADSUB setting
 * Params:
 * 	cgadsub = Layers to affect and addition/substraction mode
 * 	intensity = Intensity. Meaningful values are 0 - 31
 * Original_Address: $(DOLLAR)C4249A
 */
void setWindowBrightness(ubyte cgadsub, ubyte intensity) {
	CGADSUB = cgadsub;
	WOBJSEL = 0b00100000; // window 1 enabled for BG2, BG4, colour math
	// Cover full width of screen
	WH0 = 0;
	WH1 = 255;

	TMW = 0x13; //BG1, BG2, OBJ
	// OR mask on all layers
	WBGLOG = 0;
	WOBJLOG = 0;
	CGWSEL = 0b00010000; // disable colour math only outside of window
	setFixedColourData(intensity | 0xE0); // same intensity for all colour channels
}

/** Darkens the entire screen using a colour math window. Allows fine-grained control over which portions of the screen are darkened, such as during Runaway Five concerts.
 * Original_Address: $(DOLLAR)C424D1
 */
void darkenScreen() {
	WOBJSEL = 0b00100000; // window 1 enabled for BG2, BG4, colour math
	// Put the left side of the window to the right of the right side, ensuring the window covers none of the screen
	WH0 = 128;
	WH1 = 127;

	TMW = 0b00010011; // main window: mask BG1, BG2, OBJ
	// OR mask on all layers
	WBGLOG = 0;
	WOBJLOG = 0;

	CGWSEL = 0b00100000; // disable colour math only inside of window
	CGADSUB = 0b10110011; // subtract colours on BG1, BG2, OBJ and background
	setFixedColourData(0xEF); // maximum intensity on all channels
}

/** Enables HDMA for window darkening/lightening on channel 4
 * Params:
 * 	table = Direct HDMA table
 * Original_Address: $(DOLLAR)C42542
 */
void enableBrightnessHDMA(const ubyte* table) {
	dmaChannels[4].DMAP = 1; // word transfer
	dmaChannels[4].BBAD = 0x26; //WH0 + WH1
	dmaChannels[4].A1T = table;
	mirrorHDMAEN |= 0x10;
}

/** Disables the HDMA for window darkening/brightening
 * Original_Address: $(DOLLAR)C4257F
 */
void disableBrightnessHDMA() {
	mirrorHDMAEN &= ~0x10;
}

/** Same as darkenScreen, but allows the use of two windows for controlling which portions are darkened. This allows, for example, two spotlights during Runaway Five concerts.
 * Original_Address: $(DOLLAR)C4258C
 */
void darkenScreen2Window() {
	WOBJSEL = 0b10100000; // window 1 and 2 enabled for BG2, BG4, colour math
	// Put the left side of both windows to the right of the right side, ensuring the windows cover none of the screen
	WH0 = 128;
	WH2 = 128;
	WH1 = 127;
	WH3 = 127;

	TMW = 0b00010011; // main window: mask BG1, BG2, OBJ
	// OR mask for all layers
	WBGLOG = 0;
	WOBJLOG = 0;

	CGWSEL = 0b00100000; // disable colour math only inside of window
	CGADSUB = 0b10110011; // subtract colours on BG1, BG2, OBJ and background
	setFixedColourData(0xEF); // maximum intensity on all channels
}

/** Enables HDMA for the first spotlight effect on channel 4
 * Original_Address: $(DOLLAR)C425CC
 */
void enableSpotlightHDMA1(const ubyte* table) {
	dmaChannels[4].DMAP = 1; // word transfer
	dmaChannels[4].BBAD = 0x26; // WH0 + WH1
	dmaChannels[4].A1T = table;
	mirrorHDMAEN |= 0x10;
}

/** Disables the HDMA for the first spotlight effect
 * Original_Address: $(DOLLAR)C425F3
 */
void disableSpotlightHDMA1() {
	mirrorHDMAEN &= ~0x10;
}

/** Enables HDMA for the second spotlight effect on channel 5
 * Original_Address: $(DOLLAR)C425FD
 */
void enableSpotlightHDMA2(const ubyte* table) {
	dmaChannels[5].DMAP = 1; // word transfer
	dmaChannels[5].BBAD = 0x28; // WH2 + WH3
	dmaChannels[5].A1T = table;
	mirrorHDMAEN |= 0x20;
}

/** Disables the HDMA for the second spotlight effect
 * Original_Address: $(DOLLAR)C42624
 */
void disableSpotlightHDMA2() {
	mirrorHDMAEN &= ~0x20;
}

/** Initializes state for BG1+BG2 background slides
 * Params:
 * 	factor = Multiplication factor for the velocity vectors (aka velocity)
 * 	angle = An 8-bit angle
 * Original_Address: $(DOLLAR)C42631
 */
void backgroundSlideInitialization(short factor, short angle) {
	transitionBackgroundXVelocity = FixedPoint1616(0, 0);
	transitionBackgroundYVelocity = FixedPoint1616(0, 0);
	const xVelocity = sineMult(factor, cast(ubyte)(angle - 128));
	transitionBackgroundXVelocity.fraction = cast(short)((xVelocity & 0xFF) << 8);
	transitionBackgroundXVelocity.integer = (cast(ushort)xVelocity & 0xFF00) >> 8;
	if (xVelocity < 0) {
		transitionBackgroundXVelocity.integer |= 0xFF00;
	}
	const yVelocity = cosineMult(factor, cast(ubyte)(angle - 128));
	transitionBackgroundYVelocity.fraction = cast(short)((yVelocity & 0xFF) << 8);
	transitionBackgroundYVelocity.integer = (cast(ushort)yVelocity & 0xFF00) >> 8;
	if (yVelocity < 0) {
		transitionBackgroundYVelocity.integer |= 0xFF00;
	}
	transitionBackgroundX.integer = bg1XPosition;
	transitionBackgroundY.integer = bg1YPosition;
	transitionBackgroundX.fraction = 0;
	transitionBackgroundY.fraction = 0;
}

/** Advances BG1+BG2 background slide by a single frame, adding X/Y velocity to the BG1+BG2 positions
 * Original_Address: $(DOLLAR)C4268A
 */
void backgroundSlideFrameAdvance() {
	transitionBackgroundX.combined += transitionBackgroundXVelocity.combined;
	bg1XPosition = transitionBackgroundX.integer;
	bg2XPosition = transitionBackgroundX.integer;
	transitionBackgroundY.combined += transitionBackgroundYVelocity.combined;
	bg1YPosition = transitionBackgroundY.integer;
	bg2YPosition = transitionBackgroundY.integer;
	unknownC01731(bg1XPosition, bg1YPosition);
}

/** Advances BG1+BG2 background slide for entities, updating their screen positions relative to the background
 * Original_Address: $(DOLLAR)C426C7
 */
void backgroundSlideSpriteFrameAdvance() {
	for (short i = 0; i != maxEntities; i++) {
		if (entityScriptTable[i] < 0) {
			continue;
		}
		entityScreenXTable[i] = cast(short)(entityAbsXTable[i] - bg1XPosition);
		entityScreenYTable[i] = cast(short)(entityAbsYTable[i] - bg1YPosition);
	}
}

/** Advances palette fade animations by a single frame
 * Original_Address: $(DOLLAR)C426ED
 */
void updatePaletteFade() {
	// Use ushort addition instead of byte addition since we need carrying
	// At that point, it's easier to just use 7F0000 as ushort everywhere
	ushort* buf = cast(ushort*)(&buffer[0]);
	for (short i = 0; i < palettes.length * 16; i++) {
		// Red channel
		buf[0x400 + i] += buf[0x100 + i];
		ushort a = buf[0x400 + i];
		if ((a & 0x8000) != 0) {
			buf[0x100 + i] = 0;
			a = 0;
		} else {
			a &= 0x1F00;
			if (a == 0x1F00) {
				buf[0x100 + i] = 0;
			}
		}
		a = (a >> 8) & 0x1F;
		// Green channel
		buf[0x500 + i] += buf[0x200 + i];
		ushort a2 = buf[0x500 + i];
		if ((a2 & 0x8000) != 0) {
			buf[0x200 + i] = 0;
			a2 = 0;
		} else {
			a2 &= 0x1F00;
			if (a2 == 0x1F00) {
				buf[0x200 + i] = 0;
			}
		}
		a = cast(ushort)((a2 >> 3) | a);
		// Blue channel
		buf[0x600 + i] += buf[0x300 + i];
		a2 = buf[0x600 + i];
		if ((a2 & 0x8000) != 0) {
			version(bugfix) { // vanilla game accidentally clears the green slope instead of the blue slope here
				buf[0x300 + i] = 0;
			} else {
				buf[0x200 + i] = 0;
			}
			a2 = 0;
		} else {
			a2 &= 0x1F00;
			if (a2 == 0x1F00) {
				buf[0x300 + i] = 0;
			}
		}
		(cast(ushort*)&palettes)[i] = cast(ushort)((a2 << 2) | a);
	}
	paletteUploadMode = PaletteUpload.full;
}

unittest {
	palettes = cast(immutable(ushort[16])[])import("intropalette.bin");
	prepareLoadedPalettesForFade();
	buffer[0x40 .. 0x60] = 0;
	palettes[0 .. 2] = (ushort[16]).init;
	palettes[3 .. $] = (ushort[16]).init;
	prepareLoadedPaletteFadeTables(480, PaletteMask.all);

	updatePaletteFade(); // do at least one update for the first frame
	foreach (_; 0 .. 15) { // first real update is 16 frames later
		prettyCompare!"%04X"(cast(ushort[])palettes, cast(immutable(ushort)[])import("intropaletteframe1.bin"));
		updatePaletteFade();
	}
	prettyCompare!"%04X"(cast(ushort[])palettes, cast(immutable(ushort)[])import("intropaletteframe2.bin"));
}

/** Initializes a fade buffer for an 8-direction entity
 * Params:
 * entity = Active entity ID
 * 	dest = The destination buffer
 * 	destSize = The size of the destination buffer
 * Original_Address: $(DOLLAR)C4283F
 */
void initEntityFadeBuffer8(short entity, ushort* dest, short destSize) {
	//original code adjusted for the fact that the lower 4 bits were used as flags, but we separated them
	const(ushort)* src = cast(const(ushort)*)&sprites[entityGraphicsPointers[entity][spriteDirectionMappings8Direction[entityDirections[entity]] + entityAnimationFrames[entity]].id][0];
	do {
		dest[destSize] = src[destSize];
	} while (--destSize >= 0);
}

/** Initializes a fade buffer for a 4-direction entity
 * Params:
 * entity = Active entity ID
 * 	dest = The destination buffer
 * 	destSize = The size of the destination buffer
 * Original_Address: $(DOLLAR)C42884
 */
void initEntityFadeBuffer4(short entity, ushort* dest, short destSize) {
	const(OverworldSpriteGraphics)* sprite = &entityGraphicsPointers[entity][spriteDirectionMappings4Direction[entityDirections[entity]] * 2];
	//original code adjusted for the fact that the lower 4 bits were used as flags, but we separated them
	const(ushort)* src = cast(const(ushort)*)&sprites[sprite.id][0];
	do {
		dest[destSize] = src[destSize];
	} while (--destSize >= 0);
}

/** Copies a row of pixels starting at the given offset.
 *
 * Tiles are expected to be 4BPP and stored in row-major order.
 * Params:
 * 	dest = Destination buffer
 * 	src = Source buffer
 * 	offset = The starting pixel offset, with 0 being the top-left
 * 	tileWidth = The width of the sprite in tiles
 * Original_Address: $(DOLLAR)C428D1
 */
void copyPixelRow(ushort* dest, const ushort* src, short offset, short tileWidth) {
	// 4BPP tiles are basically just 2x2BPP tiles, which are 16 bytes.
	// Pixels in a row are stored consecutively, so 8x2 bits, or 2 bytes.
	// So to copy a row of pixels, we just need to copy 16 bits x 2 per tile times the number of tiles, 16 bytes apart from each other
	short planePairsLeft = cast(short)(tileWidth * 2);
	do {
		dest[offset / 2] = src[offset / 2];
		offset += 16;
	} while (--planePairsLeft != 0);
}

/** Copies a column of pixels starting at the provided offset.
 *
 * Tiles are expected to be 4BPP and stored in row-major order.
 * Params:
 * 	dest = Destination buffer
 * 	src = Source buffer
 * 	startingOffset = The starting pixel offset, with 0 being top-left
 * 	pixelHeight = The height in pixels of the tiles
 * 	stride = Size in bytes of a full row of tiles
 * Original_Address: $(DOLLAR)C428FC
 */
void copyPixelColumn(ushort* dest, ushort* src, short startingOffset, short pixelHeight, short stride)
	in(dest, "Missing dest")
	in(src, "Missing src")
{
	const pixelMask = pixelPlaneMasks[startingOffset & 7];
	short offset = cast(short)((startingOffset & 0xFFF8) * 4);
	short tilesLeft = pixelHeight / 8;
	do {
		const oldOffset = offset;
		short pixelsLeft = 16;
		do {
			dest[offset / 2] = (dest[offset / 2] & ~pixelMask) | (src[offset / 2] & pixelMask);
			offset += 2;
		} while (--pixelsLeft != 0);
		offset = cast(short)(oldOffset + stride);
	} while (--tilesLeft != 0);
}

/** Copies a pixel from one 4BPP tile to another
 * Params:
 * 	dest = Destination buffer
 * 	src = Source buffer
 * 	pixelRow = Y coordinate of pixel to copy
 * 	pixelColumn = X coordinate of pixel to copy
 * Original_Address: $(DOLLAR)C42965
 */
void copyPixel(ushort* dest, ushort* src, short pixelRow, short pixelColumn) {
	const mask = pixelPlaneMasks[pixelColumn];
	// plane 0-1
	dest[pixelRow / 2] = (dest[pixelRow / 2] & ~mask) | (src[pixelRow / 2] & mask);
	// plane 2-3
	pixelRow += 16;
	dest[pixelRow / 2] = (dest[pixelRow / 2] & ~mask) | (src[pixelRow / 2] & mask);
}

/** Masks for getting individual pixels out of a 2 plane pair
 * Original_Address: $C42955
 */
immutable ushort[8] pixelPlaneMasks = [
	0b1000000010000000,
	0b0100000001000000,
	0b0010000000100000,
	0b0001000000010000,
	0b0000100000001000,
	0b0000010000000100,
	0b0000001000000010,
	0b0000000100000001,
];

/** Uploads a faded sprite frame into VRAM, overwriting an entity's current sprite
 * Params:
 * 	newSprite = 4BPP tile data for a sprite, stored in row-major order
 * 	entity = The active entity ID whom this sprite data belongs to
 * Original_Address: $(DOLLAR)C429AE
 */
void uploadEntityFadeFrame(const(void)* newSprite, short entity) {
	short rows = entityTileHeights[entity];
	dmaCopyMode = 0;
	dmaCopySize = entityByteWidths[entity];
	dmaCopyRAMSource = newSprite;
	dmaCopyVRAMDestination = entityVramAddresses[entity];
	while (true) {
		uploadSpriteTileRow();
		if (--rows == 0) {
			break;
		}
		dmaCopyRAMSource += dmaCopySize;
	}
}

/** Enables the letterbox HDMA effect, using letterboxHDMATable
 * Params:
 * 	channel = The DMA channel to use for the effect (0 - 7)
 * Original_Address: $(DOLLAR)C429E8
 */
void enableLetterboxHDMA(short channel) {
	//segmented addressing stuff
	//dmaChannels[channel].A1B = 0x7E;
	//dmaChannels[channel].DASB = 0x7E;
	dmaChannels[channel].BBAD = 0x2C;
	dmaChannels[channel].DMAP = DMATransferUnit.Word;
	dmaChannels[channel].A1T = &letterboxHDMATable[0];
	mirrorHDMAEN |= dmaFlags[channel];
}

/** Hitbox widths for map collision and manpu attachment
 * Original_Address: $(DOLLAR)C42A1F
 */
immutable short[EntitySize.max + 1] collisionWidths = [
	EntitySize._8x16: 8,
	EntitySize._16x16: 8,
	EntitySize._24x16: 12,
	EntitySize._32x16: 16,
	EntitySize._48x16: 24,
	EntitySize._16x24: 8,
	EntitySize._24x24: 12,
	EntitySize._16x32: 8,
	EntitySize._32x24: 16,
	EntitySize._48x32: 24,
	EntitySize._24x48: 12,
	EntitySize._16x48: 8,
	EntitySize._32x48: 16,
	EntitySize._48x48: 24,
	EntitySize._64x48: 32,
	EntitySize._64x64: 32,
	EntitySize._64x80: 32,
];

/** Map collision "heights", that are subtracted from the Y coordinate of an entity and added to collisionHeights2 to obtain the top of a hitbox. The Y coordinate is assumed to be at the entity's centre
 * Original_Address: $(DOLLAR)C42A41
 */
immutable short[EntitySize.max + 1] collisionHeights1 = [
	EntitySize._8x16: 8,
	EntitySize._16x16: 8,
	EntitySize._24x16: 8,
	EntitySize._32x16: 8,
	EntitySize._48x16: 8,
	EntitySize._16x24: 24,
	EntitySize._24x24: 24,
	EntitySize._16x32: 24,
	EntitySize._32x24: 24,
	EntitySize._48x32: 24,
	EntitySize._24x48: 32,
	EntitySize._16x48: 40,
	EntitySize._32x48: 40,
	EntitySize._48x48: 40,
	EntitySize._64x48: 40,
	EntitySize._64x64: 56,
	EntitySize._64x80: 72,
];

/** Visible sprite widths, used primarily for fade effects
 * Original_Address: $(DOLLAR)C42A63
 */
immutable short[EntitySize.max + 1] pixelWidths = [
	EntitySize._8x16: 16, // off by 8?
	EntitySize._16x16: 16,
	EntitySize._24x16: 32, // off by 8?
	EntitySize._32x16: 32,
	EntitySize._48x16: 48,
	EntitySize._16x24: 16,
	EntitySize._24x24: 24,
	EntitySize._16x32: 16,
	EntitySize._32x24: 32,
	EntitySize._48x32: 48,
	EntitySize._24x48: 24,
	EntitySize._16x48: 16,
	EntitySize._32x48: 32,
	EntitySize._48x48: 48,
	EntitySize._64x48: 64,
	EntitySize._64x64: 64,
	EntitySize._64x80: 64,
];

/** Hitbox tile widths, used by pathfinding and map collision
 * Original_Address: $(DOLLAR)C42AA7
 */
immutable short[EntitySize.max + 1] hitboxTileWidths = [
	EntitySize._8x16: 2,
	EntitySize._16x16: 0,
	EntitySize._24x16: 2,
	EntitySize._32x16: 4,
	EntitySize._48x16: 6,
	EntitySize._16x24: 2,
	EntitySize._24x24: 3,
	EntitySize._16x32: 2,
	EntitySize._32x24: 4,
	EntitySize._48x32: 6,
	EntitySize._24x48: 0,
	EntitySize._16x48: 2,
	EntitySize._32x48: 4,
	EntitySize._48x48: 6,
	EntitySize._64x48: 8,
	EntitySize._64x64: 0,
	EntitySize._64x80: 6,
];

/** Map collision "heights", that are added to the Y coordinate of an entity after collisionHeights1 is subtracted to obtain the top of a hitbox. The Y coordinate is assumed to be at the entity's centre
 * Original_Address: $(DOLLAR)C42AEB
 */
immutable short[EntitySize.max + 1] collisionHeights2 = [
	EntitySize._8x16: 10,
	EntitySize._16x16: 0,
	EntitySize._24x16: 10,
	EntitySize._32x16: 10,
	EntitySize._48x16: 10,
	EntitySize._16x24: 24,
	EntitySize._24x24: 24,
	EntitySize._16x32: 24,
	EntitySize._32x24: 16,
	EntitySize._48x32: 16,
	EntitySize._24x48: 0,
	EntitySize._16x48: 40,
	EntitySize._32x48: 32,
	EntitySize._48x48: 32,
	EntitySize._64x48: 32,
	EntitySize._64x64: 0,
	EntitySize._64x80: 65,
];

/** Hitbox tile heights, used by pathfinding and map collision
 * Original_Address: $(DOLLAR)C42AC9
 */
immutable short[EntitySize.max + 1] hitboxTileHeights = [
	EntitySize._8x16: 1,
	EntitySize._16x16: 0,
	EntitySize._24x16: 1,
	EntitySize._32x16: 1,
	EntitySize._48x16: 1,
	EntitySize._16x24: 1,
	EntitySize._24x24: 1,
	EntitySize._16x32: 1,
	EntitySize._32x24: 2,
	EntitySize._48x32: 2,
	EntitySize._24x48: 0,
	EntitySize._16x48: 1,
	EntitySize._32x48: 2,
	EntitySize._48x48: 2,
	EntitySize._64x48: 2,
	EntitySize._64x64: 0,
	EntitySize._64x80: 2,
];

/** Spritemap templates for every size of overworld sprite
 * Original_Address: $(DOLLAR)C42B0D
 */
immutable SpriteMapTemplates[EntitySize.max + 1] overworldSpriteTemplates = [
	EntitySize._8x16: SpriteMapTemplates(1, 0, [
			[
				SpriteMap(0xF8, 0x00, 0x00, 0xF8, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xF8, 0x00, 0x40, 0xF8, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._16x16: SpriteMapTemplates(1, 0, [
			[
				SpriteMap(0xF8, 0x00, 0x00, 0xF8, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xF8, 0x00, 0x40, 0xF8, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._24x16: SpriteMapTemplates(2, 0, [
			[
				SpriteMap(0xF8, 0x00, 0x00, 0xF4, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x00, 0x04, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xF8, 0x00, 0x40, 0xFC, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x40, 0xEC, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._32x16: SpriteMapTemplates(2, 0, [
			[
				SpriteMap(0xF8, 0x00, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x00, 0x00, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xF8, 0x00, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x40, 0xF0, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._48x16: SpriteMapTemplates(3, 0, [
			[
				SpriteMap(0xF8, 0x00, 0x00, 0xE8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x04, 0x00, 0x08, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xF8, 0x00, 0x40, 0x08, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x04, 0x40, 0xE8, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._16x24: SpriteMapTemplates(2, 1, [
			[
				SpriteMap(0xE8, 0x00, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x00, 0xF8, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xE8, 0x00, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x40, 0xF8, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._24x24: SpriteMapTemplates(4, 2, [
			[
				SpriteMap(0xE8, 0x00, 0x00, 0xF4, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x02, 0x00, 0x04, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x04, 0x00, 0xF4, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x06, 0x00, 0x04, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xE8, 0x00, 0x40, 0xFC, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x02, 0x40, 0xEC, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x04, 0x40, 0xFC, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x06, 0x40, 0xEC, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._16x32: SpriteMapTemplates(2, 1, [
			[
				SpriteMap(0xE8, 0x00, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x00, 0xF8, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xE8, 0x00, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x02, 0x40, 0xF8, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._32x24: SpriteMapTemplates(4, 2, [
			[
				SpriteMap(0xE8, 0x00, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x02, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x04, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x06, 0x00, 0x00, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xE8, 0x00, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x02, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x04, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x06, 0x40, 0xF0, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._48x32: SpriteMapTemplates(6, 3, [
			[
				SpriteMap(0xE8, 0x00, 0x00, 0xE8, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x02, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x04, 0x00, 0x08, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x06, 0x00, 0xE8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x08, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x0A, 0x00, 0x08, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xE8, 0x00, 0x40, 0x08, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x02, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x04, 0x40, 0xE8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x06, 0x40, 0x08, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x08, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x0A, 0x40, 0xE8, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._24x48: SpriteMapTemplates(6, 4, [
			[
				SpriteMap(0xE0, 0x00, 0x00, 0xF4, SpriteMapSpecialFlags.none),
				SpriteMap(0xE0, 0x02, 0x00, 0x04, SpriteMapSpecialFlags.none),
				SpriteMap(0xF0, 0x04, 0x00, 0xF4, SpriteMapSpecialFlags.none),
				SpriteMap(0xF0, 0x06, 0x00, 0x04, SpriteMapSpecialFlags.none),
				SpriteMap(0x00, 0x08, 0x00, 0xF4, SpriteMapSpecialFlags.none),
				SpriteMap(0x00, 0x0A, 0x00, 0x04, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xE0, 0x00, 0x40, 0xFC, SpriteMapSpecialFlags.none),
				SpriteMap(0xE0, 0x02, 0x40, 0xEC, SpriteMapSpecialFlags.none),
				SpriteMap(0xF0, 0x04, 0x40, 0xFC, SpriteMapSpecialFlags.none),
				SpriteMap(0xF0, 0x06, 0x40, 0xEC, SpriteMapSpecialFlags.none),
				SpriteMap(0x00, 0x08, 0x40, 0xFC, SpriteMapSpecialFlags.none),
				SpriteMap(0x00, 0x0A, 0x40, 0xEC, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._16x48: SpriteMapTemplates(3, 2, [
			[
				SpriteMap(0xD8, 0x00, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x02, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x04, 0x00, 0xF8, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xD8, 0x00, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x02, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x04, 0x40, 0xF8, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._32x48: SpriteMapTemplates(6, 4, [
			[
				SpriteMap(0xD8, 0x00, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x02, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x04, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x06, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x08, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x0A, 0x00, 0x00, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xD8, 0x00, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x02, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x04, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x06, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x08, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x0A, 0x40, 0xF0, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._48x48: SpriteMapTemplates(9, 6, [
			[
				SpriteMap(0xD8, 0x00, 0x00, 0xE8, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x02, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x04, 0x00, 0x08, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x06, 0x00, 0xE8, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x08, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x0A, 0x00, 0x08, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x0C, 0x00, 0xE8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x0E, 0x00, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x10, 0x00, 0x08, SpriteMapSpecialFlags.terminator),
			], [
				SpriteMap(0xD8, 0x00, 0x40, 0x08, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x02, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x04, 0x40, 0xE8, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x06, 0x40, 0x08, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x08, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x0A, 0x40, 0xE8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x0C, 0x40, 0x08, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x0E, 0x40, 0xF8, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x10, 0x40, 0xE8, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._64x48: SpriteMapTemplates(12, 8, [
			[
				SpriteMap(0xD8, 0x00, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x02, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x04, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x06, 0x00, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x08, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x0A, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x0C, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x0E, 0x00, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x10, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x12, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x14, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x16, 0x00, 0x10, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xD8, 0x00, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x02, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x04, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x06, 0x40, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x08, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x0A, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x0C, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x0E, 0x40, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x10, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x12, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x14, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x16, 0x40, 0xE0, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._64x64: SpriteMapTemplates(16, 8, [
			[
				SpriteMap(0xC8, 0x00, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x02, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x04, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x06, 0x00, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x08, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x0A, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x0C, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x0E, 0x00, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x10, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x12, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x14, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x16, 0x00, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x18, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x1A, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x1C, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x1E, 0x00, 0x10, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xC8, 0x00, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x02, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x04, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x06, 0x40, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x08, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x0A, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x0C, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x0E, 0x40, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x10, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x12, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x14, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x16, 0x40, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x18, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x1A, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x1C, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x1E, 0x40, 0xE0, SpriteMapSpecialFlags.terminator)
			],
		]
	),
	EntitySize._64x80: SpriteMapTemplates(20, 8, [
			[
				SpriteMap(0xB8, 0x00, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xB8, 0x02, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xB8, 0x04, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xB8, 0x06, 0x00, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x08, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x0A, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x0C, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x0E, 0x00, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x10, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x12, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x14, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x16, 0x00, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x18, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x1A, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x1C, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x1E, 0x00, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x20, 0x00, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x22, 0x00, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x24, 0x00, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x26, 0x00, 0x10, SpriteMapSpecialFlags.terminator)
			], [
				SpriteMap(0xB8, 0x00, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xB8, 0x02, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xB8, 0x04, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xB8, 0x06, 0x40, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x08, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x0A, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x0C, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xC8, 0x0E, 0x40, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x10, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x12, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x14, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xD8, 0x16, 0x40, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x18, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x1A, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x1C, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xE8, 0x1E, 0x40, 0xE0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x20, 0x40, 0x10, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x22, 0x40, 0x00, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x24, 0x40, 0xF0, SpriteMapSpecialFlags.none),
				SpriteMap(0xF8, 0x26, 0x40, 0xE0, SpriteMapSpecialFlags.terminator)
			],
		]
	)
];

/** Set tick callbacks for a party leader and the entire party all in one go.
 *
 * Also clears all callback flags.
 * The party leader entity is an invisible entity that the entire party follows around, and does NOT refer to the player character in the front.
 * Params:
 * 	leaderEntityID = The active entity ID for the party leader
 * 	leaderCallback = The tick callback for the leader
 * 	partyCallback = The tick callback for everyone in the party
 * Original_Address: $C42F45
 */
void setPartyTickCallbacks(short leaderEntityID, void function() leaderCallback, void function() partyCallback) {
	entityTickCallbacks[leaderEntityID] = leaderCallback;
	entityCallbackFlags[leaderEntityID] = 0;
	for (int i = 6; i > 0; i--) {
		entityTickCallbacks[++leaderEntityID] = partyCallback;
		entityCallbackFlags[leaderEntityID] = 0;
	}
}

/**
 * The block arrangements of the entire game map.
 *
 * Each block is a 4x4 arrangement of 8x8 tiles. There are 8 + 2 chunks of data, with the first 8 being 128 x 20 strips of blocks, ordered from top to bottom.
 * The latter 2 chunks provide the upper 2 bits of the blocks
 * Original_Address: $(DOLLAR)C42F64
 */
@([ROMSource(0x160000, 10240), ROMSource(0x162800, 10240), ROMSource(0x165000, 12288), ROMSource(0x168000, 10240), ROMSource(0x16A800, 10240), ROMSource(0x16D000, 12288), ROMSource(0x170000, 10240), ROMSource(0x172800, 10240), ROMSource(0x175000, 12288), ROMSource(0x178000, 10240)])
immutable(ubyte[])[] mapBlockArrangements;

/** VRAM offsets for all 88 spritemap slots reserved for overworld entity sprites.
 *
 * Because the overworld uses 16x16 spriites, each slot is a 2x2 arrangement of 8x8 tiles, for a total of 16x16 pixels each. Each offset represents the position of top-left corner tile.
 * Note that the second row of tile data is stored at +0x100 from the first row, which is why each row in this table is +0x200.
 * An entity may reserve up to 20 slots.
 * Original_Address: $(DOLLAR)C42F8C
 */
immutable ushort[88] overworldSpriteVRAMOffsets = [
	0x0000, 0x0020, 0x0040, 0x0060, 0x0080, 0x00A0, 0x00C0, 0x00E0,
	0x0200, 0x0220, 0x0240, 0x0260, 0x0280, 0x02A0, 0x02C0, 0x02E0,
	0x0400, 0x0420, 0x0440, 0x0460, 0x0480, 0x04A0, 0x04C0, 0x04E0,
	0x0600, 0x0620, 0x0640, 0x0660, 0x0680, 0x06A0, 0x06C0, 0x06E0,
	0x0800, 0x0820, 0x0840, 0x0860, 0x0880, 0x08A0, 0x08C0, 0x08E0,
	0x0A00, 0x0A20, 0x0A40, 0x0A60, 0x0A80, 0x0AA0, 0x0AC0, 0x0AE0,
	0x0C00, 0x0C20, 0x0C40, 0x0C60, 0x0C80, 0x0CA0, 0x0CC0, 0x0CE0,
	0x0E00, 0x0E20, 0x0E40, 0x0E60, 0x0E80, 0x0EA0, 0x0EC0, 0x0EE0,
	0x1000, 0x1020, 0x1040, 0x1060, 0x1080, 0x10A0, 0x10C0, 0x10E0,
	0x1200, 0x1220, 0x1240, 0x1260, 0x1280, 0x12A0, 0x12C0, 0x12E0,
	0x1400, 0x1420, 0x1440, 0x1460, 0x1480, 0x14A0, 0x14C0, 0x14E0,
];

/** Tile IDs corresponding to the overworld entity VRAM offsets in overworldSpriteVRAMOffsets.
 * Original_Address: $(DOLLAR)C4303C
 */
immutable ushort[88] overworldSpriteOAMTileNumbers = [
	0x0000, 0x0002, 0x0004, 0x0006, 0x0008, 0x000A, 0x000C, 0x000E,
	0x0020, 0x0022, 0x0024, 0x0026, 0x0028, 0x002A, 0x002C, 0x002E,
	0x0040, 0x0042, 0x0044, 0x0046, 0x0048, 0x004A, 0x004C, 0x004E,
	0x0060, 0x0062, 0x0064, 0x0066, 0x0068, 0x006A, 0x006C, 0x006E,
	0x0080, 0x0082, 0x0084, 0x0086, 0x0088, 0x008A, 0x008C, 0x008E,
	0x00A0, 0x00A2, 0x00A4, 0x00A6, 0x00A8, 0x00AA, 0x00AC, 0x00AE,
	0x00C0, 0x00C2, 0x00C4, 0x00C6, 0x00C8, 0x00CA, 0x00CC, 0x00CE,
	0x00E0, 0x00E2, 0x00E4, 0x00E6, 0x00E8, 0x00EA, 0x00EC, 0x00EE,
	0x0100, 0x0102, 0x0104, 0x0106, 0x0108, 0x010A, 0x010C, 0x010E,
	0x0120, 0x0122, 0x0124, 0x0126, 0x0128, 0x012A, 0x012C, 0x012E,
	0x0140, 0x0142, 0x0144, 0x0146, 0x0148, 0x014A, 0x014C, 0x014E,
];

/** Initializes the movement speed table for movement in each direction using the cardinal/diagonal speed tables
 * Original_Address: $(DOLLAR)C430EC
 */
void initializeMovementSpeeds() {
	for (short i = 0; i < 14; i++) {
		horizontalMovementSpeeds[i].down.combined = 0;
		horizontalMovementSpeeds[i].up.combined = 0;
		verticalMovementSpeeds[i].left.combined = 0;
		verticalMovementSpeeds[i].right.combined = 0;

		verticalMovementSpeeds[i].down.combined = defaultMovementSpeeds[i].combined;
		horizontalMovementSpeeds[i].right.combined = defaultMovementSpeeds[i].combined;

		verticalMovementSpeeds[i].up.combined = -defaultMovementSpeeds[i].combined;
		horizontalMovementSpeeds[i].left.combined = -defaultMovementSpeeds[i].combined;

		verticalMovementSpeeds[i].downLeft.combined = defaultMovementSpeedsDiagonal[i].combined;
		verticalMovementSpeeds[i].downRight.combined = defaultMovementSpeedsDiagonal[i].combined;
		horizontalMovementSpeeds[i].downRight.combined = defaultMovementSpeedsDiagonal[i].combined;
		horizontalMovementSpeeds[i].upRight.combined = defaultMovementSpeedsDiagonal[i].combined;

		verticalMovementSpeeds[i].upLeft.combined = -defaultMovementSpeedsDiagonal[i].combined;
		verticalMovementSpeeds[i].upRight.combined = -defaultMovementSpeedsDiagonal[i].combined;
		horizontalMovementSpeeds[i].downLeft.combined = -defaultMovementSpeedsDiagonal[i].combined;
		horizontalMovementSpeeds[i].upLeft.combined = -defaultMovementSpeedsDiagonal[i].combined;
	}
}

/** Clears map collision state for all entities, removes all party member afflictions and resets the party status
 * Original_Address: $(DOLLAR)C432B1
 */
void clearPartyStatus() {
	for (short i = 0; i < 30; i++) {
		entitySurfaceFlags[i] = 0;
	}
	for (short i = 0; i < 6; i++) {
		for (short j = 0; j < 7; j++) {
			partyCharacters[i].afflictions[j] = 0;
		}
	}
	gameState.partyStatus = PartyStatus.normal;
}

/** Initializes the party member pointers, to avoid expensive (at the time) offset calculations
 * Original_Address: $(DOLLAR)C43317
 */
void initializePartyPointers() {
	for (short i = 0; i < 6; i++) {
		chosenFourPtrs[i] = &partyCharacters[i];
	}
}

/** Sets the Overworld Status Suppression flag, preventing game overs from occurring
 * Original_Address: $(DOLLAR)C43344
 */
void setOverworldStatusSuppression(short val) {
	overworldStatusSuppression = val;
}

/** Looks for interactable map objects in the given direction and prepares to run their text script if found
 *
 * Makes three attempts: one directly ahead, one a pixel to the right, and one a pixel to the left. Countertop collision is respected, extending the interaction distance.
 * Params:
 * 	direction = The direction from the player to search in
 * Original_Address: $(DOLLAR)C4334A
 */
void findMapObject(short direction) {
	short x = cast(short)(interactXOffsets[direction] + gameState.leaderX.integer / 8);
	short y = cast(short)((direction == Direction.down) ? (interactYOffsets[direction] + (gameState.leaderY.integer + 1) / 8) :(interactYOffsets[direction] + gameState.leaderY.integer / 8));
	if ((getMovingCollisionFlags(cast(short)(x * 8), cast(short)(y * 8), gameState.firstPartyMemberEntity, direction) & SurfaceFlags.counterTop) == SurfaceFlags.counterTop) {
		x += interactXOffsets[direction];
		y += interactYOffsets[direction];
	}
	short foundObject = getMapObjectAt(x, y);
	if (foundObject == -1) { // try again a little to the right
		foundObject = getMapObjectAt(cast(short)(x + 1), y);
	}
	if (foundObject == -1) { // try again a little to the left
		foundObject = getMapObjectAt(cast(short)(x - 1), y);
	}
	if ((foundObject != -1) && (foundObject == ObjectType.object)) {
		unread7E5DDC = mapObjectFoundType;
		//mapObjectText = doorData[mapObjectFound & 0x7FFF]

		mapObjectText = mapObjectFound.object.textPtr;
		interactingNPCID = -2;
	}
}

/** Saves any player-controllable state on the screen for the credits photographs
 * Params:
 * 	id = The index of the photo to record state for
 * Original_Address: $(DOLLAR)C4343E
 */
void savePhotoState(short id) {
	id--;
	ushort tmpTimer;
	if (60000 > timer / 3600) {
		tmpTimer = cast(ushort)(timer / 3600);
	} else {
		tmpTimer = 59999;
	}
	gameState.savedPhotoStates[id].timer = tmpTimer;
	for (short i = 0; i < 6; i++) {
		if (gameState.partyMemberIndex[i] == 0xFF) {
			gameState.savedPhotoStates[id].partyMembers[i] = 0;
		} else {
			currentPartyMemberTick = &partyCharacters[gameState.playerControlledPartyMembers[i]];
			short partyFlags = gameState.partyMemberIndex[i];
			if ((partyCharacters[gameState.playerControlledPartyMembers[i]].afflictions[0] == Status0.unconscious)) {
				partyFlags |= 0x20;
			}
			if ((partyCharacters[gameState.playerControlledPartyMembers[i]].afflictions[0] == Status0.diamondized)) {
				partyFlags |= 0x40;
			}
			if ((partyCharacters[gameState.playerControlledPartyMembers[i]].afflictions[1] == Status1.mushroomized)) {
				partyFlags |= 0x80;
			}
			gameState.savedPhotoStates[id].partyMembers[i] = cast(ubyte)partyFlags;
		}
	}
}

/** Text strings used for the item menu commands
 * Original_Address: $(DOLLAR)C43550
 */
immutable ubyte[6][4] itemUseMenuStrings = [
	ebString!6("Use"),
	ebString!6("Give"),
	ebString!6("Drop"),
	ebString!6("Help!"),
];

/** Waits and renders a frame in battle mode
 * Original_Address: $(DOLLAR)C43568
 */
void finishBattleFrame() {
	waitUntilNextFrame();
	drawBattleFrame();
}

/** Swaps the current (if any) raised HP/PP window to the selected character
 * Params:
 * 	character = The character index whose HP/PP window should be raised
 * Original_Address: $(DOLLAR)C43573
 */
void swapRaisedHPPPWindow(short character) {
	if (battleMenuCurrentCharacterID != -1) {
		resetActivePartyMemberHPPPWindow();
	}
	battleMenuCurrentCharacterID = character;
	waitUntilNextFrame();
	// clear the old bottom row of HP/PP window tiles, which will be moved up and won't be cleared by a redraw
	ushort* hpPPBottomTilemap = &bg2Buffer[26 * 32 + 16 - ((gameState.playerControlledPartyMemberCount * 7) / 2) + (character * 7)];
	for (short i = hpPPWindowWidth; i != 0; i--) {
		(hpPPBottomTilemap++)[0] = 0;
	}
	redrawAllWindows = 1;
}

/** Turns off the enemy target flash effect for whichever row of enemies it's enabled on
 * Original_Address: $(DOLLAR)C435E4
 */
void rowEnemyFlashingOff() {
	if (currentFlashingRow == -1) {
		return;
	}
	for (short i = 0; i < (currentFlashingRow != Row.front) ? numBattlersInBackRow : numBattlersInFrontRow; i++) {
		if (currentFlashingRow != Row.front) {
			battlersTable[backRowBattlers[i]].isFlashing = 0;
		} else {
			battlersTable[frontRowBattlers[i]].isFlashing = 0;
		}
	}
	enemyTargettingFlashing = 0;
	currentFlashingRow = -1;
	redrawAllWindows = 1;
}

/** Turns on the enemy target flash effect for an entire row of enemies
 * Params:
 * 	row = The row to enable the effect on (see Row)
 * Original_Address: $(DOLLAR)C43657
 */
void rowEnemyFlashingOn(short row) {
	if (currentFlashingRow != -1) {
		rowEnemyFlashingOff();
	}
	currentFlashingRow = row;
	for (short i = 0; i < (currentFlashingRow != Row.front) ? numBattlersInBackRow : numBattlersInFrontRow; i++) {
		if (currentFlashingRow != Row.front) {
			battlersTable[backRowBattlers[i]].isFlashing = 1;
		} else {
			battlersTable[frontRowBattlers[i]].isFlashing = 1;
		}
	}
	enemyTargettingFlashing = 1;
	redrawAllWindows = 1;
}

/** Clears a line in the specified open window. This assumes that the current font is 2 tiles high
 * Params:
 * 	window = The window ID to clear text in (see Window)
 * 	height = The row of text to clear
 * Original_Address: $(DOLLAR)C436D7
 */
void clearTextLine(short window, short height) {
	ushort* buffer = &windowStats[windowTable[window]].tilemapBuffer[windowStats[windowTable[window]].width * height * 2];
	for (short i = 0; i != windowStats[windowTable[window]].width * 2; i++) {
		*(buffer++) = 0x40;
	}
}

/** Clears the line in the specified window where text will next be rendered. This assumes that the current font is 2 tiles high
 * Params:
 * 	window = The target window ID (see Window)
 * Original_Address: $(DOLLAR)C43739
 */
void clearCurrentTextLine(short window) {
	ushort* buffer = &windowStats[windowTable[window]].tilemapBuffer[(windowStats[windowTable[window]].width * windowStats[windowTable[window]].textY * 2)];
	// first make sure all the text tiles rendered on the line so far are freed up
	for (short i = 0; i != windowStats[windowTable[window]].width * 2; i++) {
		freeTile((buffer++)[0]);
	}
	clearTextLine(window, windowStats[windowTable[window]].textY);
}

/** Moves text in the window up a single line. This assumes that the current font is 2 tiles high
 * Params:
 * 	window = The target window ID (see Window)
 * Original_Address: $(DOLLAR)C437B8
 */
void moveTextUpOneLine(short window) {
	ushort* freeBuffer = &windowStats[windowTable[window]].tilemapBuffer[0];
	ushort* destinationBuffer = &windowStats[windowTable[window]].tilemapBuffer[0];
	ushort* sourceBuffer = &windowStats[windowTable[window]].tilemapBuffer[windowStats[windowTable[window]].width * 2];
	// first free the tiles of the first line of text
	for (short i = 0; i != windowStats[windowTable[window]].width * 2; i++) {
		freeTile(*(freeBuffer++));
	}
	// then copy the tiles of each line up two rows of tiles
	for (short i = 0; i != (windowStats[windowTable[window]].height - 2) * windowStats[windowTable[window]].width; i++) {
		*(destinationBuffer++) = *(sourceBuffer++);
	}
	// clear the last text line in the window
	clearTextLine(window, (windowStats[windowTable[window]].height / 2) - 1);
}

/** Starts a new line of text in the active window
 * Original_Address: $(DOLLAR)C438B1
 */
void printNewLine() {
	if (currentFocusWindow == -1) {
		return;
	}
	version(bugfix) { // ensures that even at hyperspeed, text will render
		if (selectedTextSpeed == 0) {
			windowTick();
		}
	}
	resetVWFState(); // this line was added for the final Earthbound build, but why?
	if (windowStats[windowTable[currentFocusWindow]].font != 0) {
		resetVWFState();
	}
	if (windowStats[windowTable[currentFocusWindow]].textY != (windowStats[windowTable[currentFocusWindow]].height / 2) - 1) {
		windowStats[windowTable[currentFocusWindow]].textY++;
	} else {
		moveTextUpOneLine(currentFocusWindow);
	}
	windowStats[windowTable[currentFocusWindow]].textX = 0;
}

/** Prepares the window for word wrapping by setting the tile attributes for any remaining blank tiles on the current line
 * Original_Address: $(DOLLAR)C43B15
 */
void fillRestOfWindowLine() {
	WinStat* window = &windowStats[windowTable[currentFocusWindow]];
	ushort* tileBuffer = &window.tilemapBuffer[window.width * window.textY * 2];
	// find last tile
	ushort endTile;
	for (endTile = cast(ushort)(window.width - 1); tileBuffer[endTile] == 0x40; endTile--) {}
	ushort tile = window.textX;
	ushort* tilemap = &tileBuffer[tile];
	while (tile < (endTile + 1)) {
		// keep only the tile, add window's attributes
		tilemap[0] = (tilemap[0] & 0x3FF) | window.tileAttributes;
		// ditto, but for the second line
		tilemap[window.width] = (tilemap[window.width] & 0x3FF) | window.tileAttributes;
		tilemap++;
		tile++;
	}
}

/** Moves the text cursor to the specified tile coordinates of a specific window and prepare to print text there
 * Params:
 * 	windowID = The target window (see Window)
 * 	x = Tile X coordinate
 * 	y = Tile Y coordinate
 * Original_Address: $(DOLLAR)C43874
 */
void moveTextCursor(short windowID, short x, short y) {
	nextVWFTile();
	windowStats[windowTable[windowID]].textX = x;
	windowStats[windowTable[windowID]].textY = y;
}

/** Moves the text cursor to the specified tile coordinates of the current window and prepare to print text there
 * Params:
 * 	x = Tile X coordinate
 * 	y = Tile Y coordinate
 * Original_Address: $(DOLLAR)C438A5
 */
void moveCurrentTextCursor(short x, short y) {
	moveTextCursor(currentFocusWindow, x, y);
}

/** Text layer tiles that are NOT freeable. Note that only the first half of this table actually gets used
 * Original_Address: $(DOLLAR)C43915
 */
immutable ubyte[0x400] lockedTiles = [
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1,
	1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
];

/** Sets or clears highlighting for some rendered text in the active window
 * Params:
 * 	maxLength = Maximum number of tiles to adjust
 * 	highlighted = 0 to clear all highlighting, 1 to set it
 * 	text = The string of text being highlighted
 * Original_Address: $(DOLLAR)C43BB9
 */
void setTextHighlighting(ushort maxLength, short highlighted, ubyte* text) {
	if (windowTable[currentFocusWindow] == Window.invalid) {
		// no open window
		return;
	}
	// Don't do anything for windows that aren't part of the file select mode
	if ((currentFocusWindow != Window.fileSelectTextSpeed) && (currentFocusWindow != Window.fileSelectMusicMode) && (currentFocusWindow != Window.fileSelectMenu) && (currentFocusWindow != Window.fileSelectNamingConfirmationMessage)) {
		return;
	}
	WinStat* window = &windowStats[windowTable[currentFocusWindow]];
	short attributes = windowStats[windowTable[currentFocusWindow]].tileAttributes;
	short x = windowStats[windowTable[currentFocusWindow]].textX;
	ushort* buffer = &windowStats[windowTable[currentFocusWindow]].tilemapBuffer[windowStats[windowTable[currentFocusWindow]].textY * windowStats[windowTable[currentFocusWindow]].width * 2 + x];
	while ((*text != 0) && (maxLength != 0)) {
		if (*buffer == 0x40) { // break on first window BG tile, there's no text after this
			break;
		}
		if (highlighted != 0) {
			setTextTileAttributes(buffer, window.width, attributes);
		} else {
			clearTextTileAttributes(buffer, window.width, attributes);
		}
		x++;
		buffer++;
		text++;
		maxLength--;
	}
	window.textX = x;
	instantPrinting = 0;
}

/** Finishes rendering the current text tile and move on to a fresh one
 * Original_Address: $(DOLLAR)C43CAA
 */
void nextVWFTile() {
	// vwf buffer is a ring buffer, so wrap around if we're at the end
	if (++vwfTile >= vwfBuffer.length) {
		vwfTile = 0;
		vwfX = 0;
	} else {
		vwfX = cast(ushort)(vwfTile * 8);
	}
	textRenderState.upperTileID = 0;
	textRenderState.pixelsRendered = vwfX;
}

/** Set text position to the cursor drawing position of the specified menu option
 * Original_Address: $(DOLLAR)C43CD2
 */
void moveCurrentTextCursorOption(MenuOption* option, short x, short y) {
	moveCurrentTextCursor(x, y);
	if (option.pixelAlign != 0) {
		vwfX += option.pixelAlign;
		memset(&vwfBuffer[vwfTile][0], 0xFF, 0x20);
	}
	restoreMenuBackup = 0;
}

/** Keeps numbers properly aligned with text
 * Params:
 * 	extraSpace = Number of pixels of extra space to add
 * Original_Address: $(DOLLAR)C43D95
 */
void alignNumber(short extraSpace) {
	extraSpace += (windowStats[windowTable[currentFocusWindow]].textX * 8);
	forcePixelAlignment(cast(short)(extraSpace + lastTextPixelOffsetSet), windowStats[windowTable[currentFocusWindow]].textY);
}

/** Starts printing a new menu option.
 *
 * Prints a non-breaking space placeholder for the cursor and positions the cursor for the option text.
 * Params:
 * 	menuEntry = The menu option's configuration (textX and textY should be set)
 * Original_Address: $(DOLLAR)C43DDB
 */
void printOptionStart(MenuOption* menuEntry) {
	moveCurrentTextCursor(menuEntry.textX, menuEntry.textY);
	printLetter(TallTextTile.nonBreakingSpace);
	nextVWFTile();
	if (menuEntry.pixelAlign != 0) {
		moveCurrentTextCursorOption(menuEntry, menuEntry.textX, menuEntry.textY);
	}
}

/** Moves the text cursor to the specified tile coordinates and updates VWF state to match
 * Params:
 * 	tileX = X coordinate to start rendering the next text at
 * 	tileY = Y coordinate to start rendering the next text at
 * Original_Address: $(DOLLAR)C43D24
 */
void vwfTextMove(ushort tileX, short tileY) {
	moveCurrentTextCursor(tileX, tileY);
	if (newTextPixelOffset == 0) {
		return;
	}
	vwfX += newTextPixelOffset;
	memset(&vwfBuffer[vwfTile][0], 0xFF, 0x20);
	lastTextPixelOffsetSet = newTextPixelOffset;
	newTextPixelOffset = 0;
}

/** Forces text to align to a specific pixel
 * Original_Address: $(DOLLAR)C43D75
 */
void forcePixelAlignment(ushort pixelX, short tileY) {
	newTextPixelOffset = cast(ubyte)(pixelX & 7);
	vwfTextMove(pixelX / 8, tileY);
}

/** Gets the render width, of pixels, of a given string using the focused window's font
 * Params:
 * 	str = The null-terminated string to get the width of
 * 	maxLength = Maximum length of string
 * Returns: The pixel width of the string
 * Original_Address: $(DOLLAR)C43E31
 */
short getStringRenderWidth(const(ubyte)* str, short maxLength) {
	short pixels = 0;
	while ((str[0] != 0) && (maxLength != 0)) {
		maxLength--;
		pixels += characterPadding + (forceNormalFontForLengthCalculation != 0) ? fontData[fontConfigTable[0].dataID][((str++)[0] - ebChar(' ')) & 0x7F] : fontData[fontConfigTable[windowStats[windowTable[currentFocusWindow]].font].dataID][((str++)[0] - ebChar(' ')) & 0x7F];
	}
	return pixels;
}

/** Sets the focused window's alignment in preparation for centre-aligned text
 * Params:
 * 	str = String to be centred
 * 	maxLength = Maximum length of string
 * Original_Address: $(DOLLAR)C43EF8
 */
void setCentreAlignment(const(ubyte)* str, short maxLength) {
	// alignment = render area - 1/2 of string render width
	forcePixelAlignment(cast(short)((windowStats[windowTable[currentFocusWindow]].width * 8 - getStringRenderWidth(str, maxLength)) / 2), windowStats[windowTable[currentFocusWindow]].textY);
	forceCentreTextAlignment = 0;
}

/** Resets the used BG2 tile map to default state
 * Original_Address: $(DOLLAR)C43F53
 */
void initializeUsedBG2TileMap() {
	for (short i = 0; i < reservedBG2TileMap.length; i++) {
		usedBG2TileMap[i] = reservedBG2TileMap[i];
	}
}

/** Prints a letter into the BG2 buffer.
 *
 * This is Mother 2's normal letter printing function, but Earthbound still uses it for non-VWF text.
 * Each character is 2 tiles high, with the second tile assumed to be offset by +16 BPP2 tiles (256 bytes) in VRAM.
 * Params:
 * 	tile = Tile to render (see TextTile for values, these are NOT VRAM tile IDs!)
 * Original_Address: $(DOLLAR)C43F77
 */
void printLetter(short tile) {
	if (currentFocusWindow == -1) {
		return;
	}
	int tilemapOffset = windowStats[windowTable[currentFocusWindow]].textX +
		windowStats[windowTable[currentFocusWindow]].textY * windowStats[windowTable[currentFocusWindow]].width * 2;
	// free the text tiles at the current offset
	ushort* buffer = &windowStats[windowTable[currentFocusWindow]].tilemapBuffer[tilemapOffset];
	freeTileSafe(buffer[0]);
	freeTileSafe(buffer[windowStats[windowTable[currentFocusWindow]].width]);
	if (tile == TallTextTile.nonBreakingSpace) {
		vwfIndentNewLine = 0;
	}
	drawTallTextTileFocusedF(tile);
	if (windowTable[currentFocusWindow] != windowTail) {
		redrawAllWindows = 1;
	}
	bool playSound;
	if (textSoundMode == TextSoundMode.always) {
		playSound = true;
	} else if (textSoundMode == TextSoundMode.never) {
		playSound = false;
	} else {
		playSound = false;
		if (textPromptMode == TextPromptMode.normal) {
			playSound = true;
		}
	}
	if (playSound && (instantPrinting == 0) && (tile != TallTextTile.windowBackground)) {
		playSfx(Sfx.textPrint);
	}
	if (instantPrinting == 0) {
		for (short i = cast(short)(selectedTextSpeed + (config.instantSpeedText ? 0 : 1)); i != 0; i--) {
			windowTick();
		}
	}
}

/** Gets the keyboard character at a given cursor position
 * Params:
 * 	x = X coordinate (cursor coordinates)
 * y = Y coordinate (cursor coordinates)
 * 	keyboard = Keyboard ID
 * Returns: The character ID at this position
 * Original_Address: $(DOLLAR)C4406A
 */
short getCharacterAtCursorPosition(short x, short y, short keyboard) {
	return getTextBlock(keyboardText[keyboard])[nameEntryGridCharacterOffsetTable[y][x]];
}

/** Prefills the input field for text entry screens
 * Params:
 * 	text = The string to prefill with. Must be null-terminated if less than length bytes long
 * 	length = Length of the string
 * Original_Address: $(DOLLAR)C440B5
 */
void prefillKeyboardInput(ubyte* text, short length) {
	memset(&keyboardInputCharacterWidths[0], 0, keyboardInputCharacterWidths.length);
	short endPosition;
	for (endPosition = 0; text[0] != 0; endPosition++, text++) {
		keyboardInputCharacters[endPosition] = text[0];
		keyboardInputCharacterOffsets[endPosition] = (text[0] - ebChar(' ')) & 0x7F;
		keyboardInputCharacterWidths[endPosition] = cast(ubyte)(fontData[fontConfigTable[0].dataID][(text[0] - ebChar(' ')) & 0x7F] + characterPadding);
		renderVWFCharacterToWindow(Font.main, text[0]);
	}
	nextKeyboardInputIndex = endPosition;
	if (endPosition >= length) {
		return;
	}
	keyboardInputCharacterOffsets[endPosition] = 32;
	keyboardInputCharacterWidths[endPosition] = 6;
	renderVWFCharacterToWindow(Font.main, ebChar('@'));
	keyboardInputCharacters[endPosition++] = 0;
	if (length < endPosition) {
		return;
	}
	for (short i = cast(short)(length - endPosition); i != 0; i--, endPosition++) {
		keyboardInputCharacterOffsets[endPosition] = 3;
		renderVWFCharacterToWindow(Font.main, ebChar('{'));
		keyboardInputCharacterWidths[endPosition] = 3;
	}
}
unittest {
	if (romDataLoaded) {
		initializeForTesting();
		createWindow(Window.fileSelectNamingNameBox);
		prefillKeyboardInput(ebStringz("Hi").ptr, 5);
		assert(keyboardInputCharacterOffsets == [40, 73, 32, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
		assert(keyboardInputCharacterWidths == [6, 2, 6, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
		assert(keyboardInputCharacters == [120, 153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
		prefillKeyboardInput(ebStringz("Hello").ptr, 5);
		assert(keyboardInputCharacterOffsets == [40, 69, 76, 76, 79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
		assert(keyboardInputCharacterWidths == [6, 5, 2, 2, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
		assert(keyboardInputCharacters == [120, 149, 156, 156, 159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
		prefillKeyboardInput(ebStringz("").ptr, 5); // not normally possible, but here for completeness
		keyboardInputCharacters[] = 0; // buffer doesn't get cleared automatically
		assert(keyboardInputCharacterOffsets == [32, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
		assert(keyboardInputCharacterWidths == [6, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
		assert(keyboardInputCharacters == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
	}
}

/** Clears the input field for text entry screens
 * Params:
 * 	length = Length of input field
 * Original_Address: $(DOLLAR)C441B7
 */
void emptyKeyboardInput(short length) {
	memset(&vwfBuffer[0][0], 0xFF, vwfBuffer.sizeof);
	const short emptyCharacterOffset = 3;
	nextKeyboardInputIndex = 0;
	memset(&keyboardInputCharacters[0], 0, keyboardInputCharacters.length);
	renderVWFCharacterToWindow(Font.main, ebChar('@'));
	keyboardInputCharacterOffsets[0] = 32;
	for (short i = 1; i < length; i++) {
		keyboardInputCharacterOffsets[i] = cast(ubyte)emptyCharacterOffset;
		keyboardInputCharacterWidths[i] = cast(ubyte)(fontData[fontConfigTable[0].dataID][emptyCharacterOffset] + characterPadding);
		renderVWFCharacterToWindow(Font.main, ebChar('{'));
	}
}

/** Writes a character to the various text entry buffers
 * Params:
 * 	chr = Character to write
 * Original_Address: $(DOLLAR)C4424A
 */
void writeCharacterToKeyboardInputBuffers(short chr) {
	if (chr == ebChar('@')) {
		keyboardInputCharacters[nextKeyboardInputIndex] = 0;
	} else {
		keyboardInputCharacters[nextKeyboardInputIndex] = cast(ubyte)chr;
	}
	keyboardInputCharacterOffsets[nextKeyboardInputIndex] = cast(ubyte)((chr - ebChar(' ')) & 0x7F);
	keyboardInputCharacterWidths[nextKeyboardInputIndex] = cast(ubyte)(fontData[fontConfigTable[0].dataID][(chr - ebChar(' ')) & 0x7F] + characterPadding);
}

/** Handles the input of a single character on text entry screens
 * Params:
 * 	window = Window that displays inputted text (not used, current focused window is used instead)
 * 	length = Maximum length of the text entry field
 * 	character = The character input (-1 is backspace)
 * Returns: 0 on success, 1 on backspace input with no input
 * Original_Address: $(DOLLAR)C442AC
 */
short keyboardInputSingleCharacter(short window, short length, short character) {
	waitUntilNextFrame();
	vwfTile = 0;
	vwfX = 0;
	memset(&vwfBuffer[0][0], 0xFF, 0x340);
	textRenderState.upperTileID = 0;
	textRenderState.pixelsRendered = 0;
	if (character == -1) { //backspace
		if (nextKeyboardInputIndex == 0) {
			return 1;
		}
		if (nextKeyboardInputIndex < length) {
			writeCharacterToKeyboardInputBuffers(ebChar('{'));
		}
		nextKeyboardInputIndex--;
		writeCharacterToKeyboardInputBuffers(ebChar('@'));
	} else { // any other character
		if (length - 1 < nextKeyboardInputIndex) {
			return 0;
		}
		writeCharacterToKeyboardInputBuffers(character);
		if (++nextKeyboardInputIndex < length) {
			writeCharacterToKeyboardInputBuffers(ebChar('@'));
		}
	}
	// rerender text
	windowStats[windowTable[currentFocusWindow]].textX = 0;
	for (short i = 0; i < length; i++) {
		const(ubyte)* charGraphics = &fontGraphics[fontConfigTable[0].graphicsID][fontConfigTable[0].bytesPerCharacter * keyboardInputCharacterOffsets[i]];
		short j;
		for (j = keyboardInputCharacterWidths[i]; j >= 8; j -= 8) {
			renderText(8, fontConfigTable[0].height, charGraphics);
			charGraphics += fontConfigTable[0].height;
		}
		renderText(j, fontConfigTable[0].height, charGraphics);
	}
	windowStats[windowTable[currentFocusWindow]].textX = 0;
	// upload text tiles
	ushort destinationVRAM = 0x7700;
	for (short i = 0; i < windowStats[windowTable[currentFocusWindow]].width + 1; i++) {
		copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x10, destinationVRAM, &vwfBuffer[i][0]);
		copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x10, cast(ushort)(destinationVRAM + 8), &vwfBuffer[i][16]);
		destinationVRAM += 16;
	}
	dmaTransferFlag = 1;
	for (short i = 0; i < windowStats[windowTable[currentFocusWindow]].width + 1; i++) {
		finishTextTileRender(cast(short)(i * 2 + 0x2E0), cast(short)(i * 2 + 0x2E0 + 1));
	}
	// redraw everything
	if (windowTable[currentFocusWindow] != windowTail) {
		redrawAllWindows = 1;
	}
	// should we play a sound?
	bool playSound;
	if (textSoundMode == TextSoundMode.always) {
		playSound = true;
	} else if (textSoundMode == TextSoundMode.never) {
		playSound = false;
	} else {
		playSound = false;
		if (textPromptMode == TextPromptMode.normal) {
			playSound = true;
		}
	}
	if (playSound && (instantPrinting == 0) && (character != TallTextTile.windowBackground)) {
		playSfx(Sfx.textPrint);
	}
	// wait according to player's chosen text speed
	for (short i = cast(short)(selectedTextSpeed + (config.instantSpeedText ? 0 : 1)); i != 0; i--) {
		windowTick();
	}
	return 0;
}

/** Renders text in small font directly to VRAM
 * Params:
 * 	str = The text to render
 * destinationVRAM = VRAM address for the graphics tiles
 * Original_Address: $(DOLLAR)C444FB
 */
void renderSmallTextToVRAM(ubyte* str, ushort destinationVRAM) {
	nextVWFTile();
	ushort currentVWFTile = vwfTile;
	ubyte* strTemp = str;
	for (short i = 0; str[0] != 0; i++) {
		renderText(6, fontConfigTable[Font.tiny].height, &fontGraphics[fontConfigTable[Font.tiny].graphicsID][(((str++)[0] - ebChar(' ')) & 0x7F) * fontConfigTable[Font.tiny].bytesPerCharacter]);
	}
	for (short i = currentVWFTile; (strTemp++)[0] != 0; i++) {
		copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x10, destinationVRAM, &vwfBuffer[i][0]);
		destinationVRAM += 8;
		if (i == 0x33) {
			i = -1;
		}
	}
	waitUntilNextFrame();
	waitUntilNextFrame();
}

/** Looks ahead at text script and handles automatic newlines if the word is too long
 * Params:
 * 	state = The current text state
 * 	currentCompressedText = Any compressed text currently being printed (must POINT to a null if no text)
 * Original_Address: $(DOLLAR)C445E1
 */
void printAutoNewline(DisplayTextState* state, const(ubyte)* currentCompressedText) {
	short nextWordLength = 0;
	const(ubyte)* currentScript = state.script;
	// no point in newlines without a window
	if (currentFocusWindow == -1) {
		return;
	}
	// get length of next word
	while (true) {
		// deal with compressed text first, replace with new compressed text if encountered
		short chr = (currentCompressedText[0] != 0) ? *(currentCompressedText++) : *(currentScript++);
		switch (chr) {
			case 0x15:
				currentCompressedText = &compressedText[0][*(currentScript++)][0];
				chr = *(currentCompressedText++);
				break;
			case 0x16:
				currentCompressedText = &compressedText[1][*(currentScript++)][0];
				chr = *(currentCompressedText++);
				break;
			case 0x17:
				currentCompressedText = &compressedText[2][*(currentScript++)][0];
				chr = *(currentCompressedText++);
				break;
			default: break;
		}
		// found a space, end it
		if (chr == ebChar(' ') || (chr < TallTextTile.windowBackground)) {
			break;
		}
		// add to letter and pixel counts
		upcomingWordLength++;
		nextWordLength += (chr == TallTextTile.nonBreakingSpace) ? 8 : cast(ubyte)(fontData[fontConfigTable[windowStats[windowTable[currentFocusWindow]].font].dataID][(chr - ebChar(' ')) & 0x7F] + characterPadding);
	}
	short newLineLength;
	// does the next word overflow the window? print new line if so
	if (windowStats[windowTable[currentFocusWindow]].textX != 0) {
		newLineLength = cast(short)((vwfX & 7) + ((windowStats[windowTable[currentFocusWindow]].textX - 1) * 8) + nextWordLength);
	} else {
		newLineLength = cast(short)((vwfX & 7) + nextWordLength);
	}
	if ((windowStats[windowTable[currentFocusWindow]].width * 8) < newLineLength) {
		printNewLineF();
		vwfIndentNewLine = 1;
	}
}

/** Prints a string, with automatic newline if the ENTIRE string is wider than the window width - cursor position
 * Params:
 * 	length = Maximum length (in characters) of the string (-1 to automatically choose length, text MUST be null-terminated)
 * 	text = The text string to print
 * Original_AddresS: $(DOLLAR)C447FB
 */
void printStringAutoNewline(short length, const(ubyte)* text) {
	short stringLength = getStringRenderWidth(text, length);
	if ((vwfX & 7) + ((windowStats[windowTable[currentFocusWindow]].textX - 1) * 8) + stringLength >= (windowStats[windowTable[currentFocusWindow]].width * 8)) {
		printNewLineF();
		vwfIndentNewLine = 1;
	}
	printStringF(length, text);
}

/** Prints a string with automatic newlines for every word
 * Params:
 * 	length = The length of the full string. Not used
 * 	text = The string to print
 * Original_Address: $(DOLLAR)C4487C
 */
void printWordsAutoNewline(short length, const(ubyte)* text) {
	ubyte index = 0;
	ubyte* buffer = &wordSplittingBuffer[0];
	short destChar;
	do {
		ubyte srcChar = text[0];
		destChar = srcChar;
		buffer[index] = srcChar;
		text++;
		// split and print on spaces and nulls
		if ((destChar == ebChar(' ')) || (destChar == 0)) {
			if (destChar == ebChar(' ')) {
				buffer[index++] = ebChar(' ');
			}
			buffer[index] = 0;
			printStringAutoNewline(-1, buffer);
			index = 0;
			buffer = &wordSplittingBuffer[0];
		} else {
			index++;
		}
	} while (destChar != 0);
}

/** Loads text layer graphics
 * Params:
 * 	what = How much of the text graphics to load - Can choose between all graphics, and all graphics minus HP/PP window and special text graphics
 * Original_Address: $(DOLLAR)C44963
 */
void loadWindowGraphics(short what) {
	switch (what) {
		case WindowGraphicsToLoad.all: // reload all window graphics in VRAM
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x1800, 0x7000, &buffer[0x2000]); // HP/PP meter tiles, special text graphics
			goto case;
		case WindowGraphicsToLoad.allButMeter: // same as 1, but no meter or special text
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x450, 0x6000, &buffer[0]); //status ailments, backgrounds and selector digits, upper halves of some icons
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x60, 0x6278, &buffer[0x4F0]); // lower half of cursor, equip icon, dollar sign and cents
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0xB0, 0x62F8, &buffer[0x5F0]); // upper halves of normal digits
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0xA0, 0x6380, &buffer[0x700]); // lower halves of normal digits
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x10, 0x6400, &buffer[0x800]); // upper half of bullet character
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x10, 0x6480, &buffer[0x900]); // lower half of bullet character
			break;
		case WindowGraphicsToLoad.all2: // this seems to be a copy of 1, for some reason
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x450, 0x6000, &buffer[0]); //status ailments, backgrounds and selector digits, upper halves of some icons
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x60, 0x6278, &buffer[0x4F0]); // lower half of cursor, equip icon, dollar sign and cents
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0xB0, 0x62F8, &buffer[0x5F0]); // upper halves of normal digits
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0xA0, 0x6380, &buffer[0x700]); // lower halves of normal digits
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x10, 0x6400, &buffer[0x800]); // upper half of bullet character
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x10, 0x6480, &buffer[0x900]); // lower half of bullet character
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x1800, 0x7000, &buffer[0x2000]); // HP/PP meter tiles, special text graphics
			break;
		default: break;
	}
}

/** Bitmasks used for the used BG2 tile bitmap
 * Original_Address: $(DOLLAR)C44AD7
 */
immutable ushort[16] usedBG2TileMapMasks = [
	0b1111111111111110,
	0b1111111111111101,
	0b1111111111111011,
	0b1111111111110111,
	0b1111111111101111,
	0b1111111111011111,
	0b1111111110111111,
	0b1111111101111111,
	0b1111111011111111,
	0b1111110111111111,
	0b1111101111111111,
	0b1111011111111111,
	0b1110111111111111,
	0b1101111111111111,
	0b1011111111111111,
	0b0111111111111111,
];

/** Frees up a tile allocated in the used BG2 tile bitmap
 * Params:
 * 	tileID = The tile to free up (0 - 1023)
 * Original_Address: $(DOLLAR)C44AF7
 */
void freeTile(short tileID) {
	short tile = tileID & 0x3FF;
	if (lockedTiles[tile] != 0) {
		return;
	}
	usedBG2TileMap[tile >> 4] &= usedBG2TileMapMasks[tile & 0xF];
}

/** Blits widthx8 pixels of a single 1BPP text character into the 2BPP VWF tile buffer
 * Params:
 * 	width = Pixels to render
 * 	fontHeight = Width of each character's tiles, in pixels
 * 	fontGraphics = The character tile data, in column-major order
 * Original_Address: $(DOLLAR)C44B3A
 */
void renderText(short width, short fontHeight, const(ubyte)* fontGraphics) {
	short pixelX = vwfX & 7;
	ubyte* dest = &vwfBuffer[vwfTile][0];
	const(ubyte)* src = fontGraphics;

	// new tile? clear it before use
	// we set all the bits, because the background colour is assumed to be the last colour in the palette
	// then conversion to 2BPP is as easy as just clearing single bits in the second bitplane
	if (pixelX == 0) {
		memset(dest, 0xFF, fontHeight * 2);
	}
	// the second bitplane is in the odd bytes
	dest++;
	for (short i = 0; i < fontHeight; i++) {
		*dest &= (((*src) ^ 255) >> pixelX) ^ 255;

		++src;
		dest += 2;
	}
	// increase VWF X, wrap around if necessary
	vwfX += width;
	if (vwfX >= vwfBuffer.length * 8) {
		vwfX -= vwfBuffer.length * 8;
	}

	// did adding the width mean moving to a new tile? if not, we're done
	short newVWFTile = vwfX >> 3;
	if (newVWFTile == vwfTile) {
		return;
	}

	// otherwise, we have a second tile to render

	vwfTile = newVWFTile;

	pixelX = cast(short)(8 - pixelX);
	dest = &vwfBuffer[vwfTile][0];
	src = fontGraphics;

	// clear new tile before use
	memset(dest, 0xFF, fontHeight * 2);
	if (pixelX == 8) {
		return;
	}

	// second bitplane again
	dest++;
	for (short i = 0; i < fontHeight; i++) {
		*dest = cast(ubyte)((((*src) ^ 255) << pixelX) ^ 255);

		++src;
		dest += 2;
	}
}

/** Bitmasks used for usedBG2TileMap
 * Original_Address: $(DOLLAR)C44C6C
 */
immutable ushort[16] usedBG2TileMasks = [
	1<<0,
	1<<1,
	1<<2,
	1<<3,
	1<<4,
	1<<5,
	1<<6,
	1<<7,
	1<<8,
	1<<9,
	1<<10,
	1<<11,
	1<<12,
	1<<13,
	1<<14,
	1<<15,
];

/** Finishes rendering a tile, handling automatic newlines, scrolling and cleaning up.
 *
 * Be aware that the tiles will only exist in VRAM after this function completes.
 * Params:
 * 	upperTile = Tile ID of the upper text tile
 * 	lowerTile = Tile ID of the lower text file
 * Original_Address: $(DOLLAR)C44C8C
 */
void finishTextTileRender(short upperTile, short lowerTile) {
	if (currentFocusWindow == -1) { // no window, exit
		return;
	}
	if (windowTable[currentFocusWindow] == -1) { // window closed, exit
		return;
	}
	short x = windowStats[windowTable[currentFocusWindow]].textX;
	short y = windowStats[windowTable[currentFocusWindow]].textY;
	short attributes = windowStats[windowTable[currentFocusWindow]].tileAttributes;
	ushort* bufferUpper;
	ushort* bufferLower;
	// at the end of the line?
	if (x == windowStats[windowTable[currentFocusWindow]].width) {
		// move to the next line, figure out if we need to scroll and/or indent
		x = 0;
		// last line in the window?
		if ((windowStats[windowTable[currentFocusWindow]].height / 2) - 1 != y) {
			y++;
		} else {
			// we're on the last line, so push the existing text upward if overflow disabled
			if (allowTextOverflow != 0) {
				goto SetNewCursorCoordinates; // skip scrolling, indentation
			}
			moveTextUpOneLineF(currentFocusWindow);
		}
		if (enableWordWrap != 0) {
			vwfIndentNewLine = 1;
		}
	}
	// are we at the start of a new line after a space or bullet? (vestigial...? these tiles don't normally get printed in Earthbound, but they do in Mother 2)
	if ((textPromptMode != TextPromptMode.normal) && (x == 0) && ((upperTile == TallTextTile.windowBackground) || (upperTile == ebChar('@')))) {
		if (textPromptMode == TextPromptMode.fast1) {
			goto SetNewCursorCoordinates;
		}
		if (textPromptMode == TextPromptMode.fast2) {
			upperTile = TallTextTile.windowBackground;
		}
	}
	// now that we're done rendering the tiles and have uploaded them to VRAM, free 'em

	// free the upper tile
	assert(windowStats[windowTable[currentFocusWindow]].tilemapBuffer, "No tilemap buffer for window");
	bufferUpper = &windowStats[windowTable[currentFocusWindow]].tilemapBuffer[windowStats[windowTable[currentFocusWindow]].width * y * 2 + x];
	if (bufferUpper[0] != 0) {
		freeTileSafe(bufferUpper[0]);
	}
	bufferUpper[0] = cast(ushort)(((upperTile == TallTextTile.equipped) ? (3 << 10) : attributes) | upperTile);

	// free the lower tile
	bufferLower = bufferUpper + windowStats[windowTable[currentFocusWindow]].width;
	if (bufferLower[0] != 0) {
		freeTileSafe(bufferLower[0]);
	}
	bufferLower[0] = cast(ushort)(((lowerTile == TallTextTile.equipped) ? (3 << 10) : attributes) + lowerTile);
	x++;

	SetNewCursorCoordinates:
	windowStats[windowTable[currentFocusWindow]].textX = x;
	windowStats[windowTable[currentFocusWindow]].textY = y;
}

/** Uploads a prepared batch of text tiles to VRAM
 * Original_Address: $(DOLLAR)C44DCA
 */
void uploadTextTileBatch() {
	short lastRenderedTileIndex = vwfX / 8;
	short tileIndex = textRenderState.pixelsRendered / 8;
	short upperTileID = textRenderState.upperTileID;
	if (upperTileID != 0) {
		uploadTextTile(tileIndex, upperTileID, textRenderState.lowerTileID);
	} else {
		tileIndex--;
	}
	while (tileIndex != lastRenderedTileIndex) {
		short newUpperTile = reserveBG2Tile();
		textRenderState.upperTileID = newUpperTile;
		short newLowerTile = reserveBG2Tile();
		textRenderState.lowerTileID = newLowerTile;
		tileIndex = (tileIndex + 1 == vwfBuffer.length) ? 0 : cast(short)(tileIndex + 1);
		uploadTextTile(tileIndex, newUpperTile, newLowerTile);
		finishTextTileRender(newUpperTile, newLowerTile);
	}
	textRenderState.pixelsRendered = vwfX;
}

/** Resets text rendering state for new sets of tiles
 * Original_Address: $(DOLLAR)C44E44
 */
void resetTextRenderState() {
	textRenderState.upperTileID = 0;
	textRenderState.pixelsRendered = 0;
}

/** Frees a tile, avoiding freeing tile 0 (transparency) and tile 64 (window background)
 * Params:
 * 	tile = The tile ID to free up (0 - 1023)
 * Original_Address: $(DOLLAR)C44E4D
 */
void freeTileSafe(short tile) {
	// text tiles -> VRAM tiles
	// don't free spaces and transparency! ...even though they're locked and wouldn't be freed anyway....
	if ((tile & 0x3FF) == VRAMTextTile.windowBackground) {
		return;
	}
	if ((tile & 0x3FF) == VRAMTextTile.none) {
		return;
	}
	freeTile(tile);
}

/** Prints a VWF character with the specified font to the focused window at the current cursor coordinates.
 *
 * Handles auto-newlines and cursor movement as well.
 * Params:
 * 	font = Font to use for rendering
 * 	tile = The character to render (non-breaking space, equipped symbol and window background are handled specially)
 * Original_Address: $(DOLLAR)C44E61
 */
void renderVWFCharacterToWindow(short font, short tile) {
	if (currentFocusWindow == -1) {
		return;
	}
	if ((tile == TallTextTile.nonBreakingSpace) || (tile == TallTextTile.equipped) || (tile == TallTextTile.windowBackground)) { // don't use VWF text for these special characters
		printLetter(tile);
		nextVWFTile();
	} else {
		if (tile == ebChar(' ')) {
			if (vwfIndentNewLine != 0) {
				return;
			}
		} else if (vwfIndentNewLine != 0) {
			windowStats[windowTable[currentFocusWindow]].textX = 0;
			if (tile != ebChar('@')) {
				forcePixelAlignment(6, windowStats[windowTable[currentFocusWindow]].textY);
			}
			vwfIndentNewLine = 0;
		}
		lastPrintedCharacter = cast(ubyte)tile;
		const(ubyte)* charGFX = &fontGraphics[fontConfigTable[font].graphicsID][(tile - ebChar(' ')) * fontConfigTable[font].bytesPerCharacter];
		short charWidth = fontData[fontConfigTable[font].dataID][tile - ebChar(' ')] + characterPadding;
		if (charWidth > 8) {
			while (charWidth > 8) {
				renderText(8, fontConfigTable[font].height, charGFX);
				charWidth -= 8;
				charGFX += fontConfigTable[font].height;
			}
		}
		renderText(charWidth, fontConfigTable[font].height, charGFX);
		uploadTextTileBatch();
	}
}

/** Gets the width, in pixels, of a character string with padding included
 * Params:
 * 	length = Length of string
 * 	fontID = Font to simulate rendering with
 * 	text = A string at least length characters long
 * Returns: Pixel width of string
 * Original_Address: $(DOLLAR)C44FF3
 */
short getTextWidth(short length, short fontID, const(ubyte)* text) {
	short result;
	for (short i = 0; i < length; i++) {
		result += cast(short)(characterPadding + fontData[fontConfigTable[fontID].dataID][((text++)[0] - ebChar(' ')) & 0x7F]);
	}
	return result;
}

/** Prints a price, with dollars and cents, mostly aligned to the right side of the window
 * Params:
 * 	value = The price to print (in dollars)
 * Original_Address: $(DOLLAR)C4507A
 */
void printPrice(uint value) {
	ubyte[8] textBuffer;
	// no window to print in
	if (currentFocusWindow == -1) {
		return;
	}
	// do not create new lines
	ubyte vwfIndentNewLineCopy = vwfIndentNewLine;
	vwfIndentNewLine = 0;
	// separate the digits
	short digits = unknownC10C55(value);
	const(ubyte)* numberString = &numberTextBuffer[7 - digits];
	// make copies for later printing and restoring
	const(ubyte)* numberStringCopy = numberString;
	short textXBackup = windowStats[windowTable[currentFocusWindow]].textX;
	short textYBackup = windowStats[windowTable[currentFocusWindow]].textY;

	// transform numbers into fixed digit characters and get string width
	short dollarSignWidth = characterPadding + fontData[fontConfigTable[windowStats[windowTable[currentFocusWindow]].font].dataID][ebChar('$') - ebChar(' ')];
	for (short i = 0; i < digits; i++) {
		textBuffer[i] = cast(ubyte)((numberString++)[0] + TallTextTile.num0Fixed * 2);
	}
	short fullWidth = cast(short)(dollarSignWidth + getTextWidth(digits, windowStats[windowTable[currentFocusWindow]].font, &textBuffer[0]));
	// add padding for $
	fullWidth += characterPadding;

	// keep all prices left aligned so they at least mostly align with each other
	forceLeftTextAlignment = 1;
	forcePixelAlignment(cast(short)((windowStats[windowTable[currentFocusWindow]].width - 1) * 8 - fullWidth), windowStats[windowTable[currentFocusWindow]].textY);
	printLetterVWFF(ebChar('$'));
	while (digits != 0) {
		printLetterVWFF((numberStringCopy++)[0] + TallTextTile.num0Fixed * 2);
		digits--;
	}
	forceLeftTextAlignment = 0;
	// move to end, write cents symbol
	moveCurrentTextCursor(cast(short)(windowStats[windowTable[currentFocusWindow]].width - 1), windowStats[windowTable[currentFocusWindow]].textY);
	printLetter(TallTextTile.cents);
	// return to where we started
	moveCurrentTextCursor(textXBackup, textYBackup);
	vwfIndentNewLine = vwfIndentNewLineCopy;
}

/** Fill a window with a table of menu options, automatically including a next page option when appropriate
 * Params:
 * 	columns = Number of columns of menu options to prepare
 * 	reservedColumns = Number of columns to reserve
 * 	altSpacingMode = Enables an alternate rendering mode. Details unclear
 * Original_Address: $(DOLLAR)C451FA
 */
void createMenuOptionTable(short columns, short reservedColumns, short altSpacingMode) {
	short optionXPadding = void;
	short index = 0;
	short totalLength = 0;
	if (windowStats[windowTable[currentFocusWindow]].currentOption == -1) {
		return;
	}
	windowStats[windowTable[currentFocusWindow]].menuColumns = columns;
	MenuOption* option = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
	memset(&menuOptionLabelLengths[0], 0, 4);
	memset(&unknown7E9691[0], 0xFF, 4);
	if (altSpacingMode != 0) {
		while (true) {
			menuOptionLabelLengths[index] = cast(ubyte)(getStringRenderWidth(&option.label[0], 30) + 8);
			totalLength += menuOptionLabelLengths[index];
			if (option.next == -1) {
				break;
			}
			option = &menuOptions[option.next];
			index++;
		}
		ushort optionSpacing = cast(ushort)((windowStats[windowTable[currentFocusWindow]].width * 0x800) / totalLength);
		while (index != -1) {
			unknown7E9691[index] = cast(ubyte)((optionSpacing * menuOptionLabelLengths[index]) / 256);
			index--;
		}
		option = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		index = 0;
	} else {
		optionXPadding = cast(short)(((columns - 1) * reservedColumns + windowStats[windowTable[currentFocusWindow]].width) / columns);
	}
	short maxOptionCount = windowStats[windowTable[currentFocusWindow]].height / 2;
	// reserve space for the next page option if applicable
	if ((columns + getMenuOptionCountF(windowStats[windowTable[currentFocusWindow]].currentOption) - 1) / columns > maxOptionCount) {
		maxOptionCount -= 2;
	}
	short x = 0;
	short page = 1;
	outermost: while (true) {
		short y = windowStats[windowTable[currentFocusWindow]].textY;
		for (short i = maxOptionCount; i != 0; i--) {
			for (short x18 = columns; x18 != 0; x18--) {
				if (altSpacingMode != 0) {
					option.textX = cast(short)(x + (unknown7E9691[index] - menuOptionLabelLengths[index]) / 16);
					option.textY = y;
					option.page = page;
					if (option.next == -1) { // no more options
						break outermost;
					}
					x += (unknown7E9691[index] + 7) / 8;
					index++;
					option = &menuOptions[option.next];
				} else {
					option.textX = x;
					option.textY = y;
					option.page = page;
					if (option.next == -1) {
						break outermost;
					}
					x += optionXPadding;
					option = &menuOptions[option.next];
				}
			}
			x = 0;
			y++;
		}
		page++;
	}
	// too many options. add the next page option
	if (((columns + getMenuOptionCountF(windowStats[windowTable[currentFocusWindow]].currentOption) - 1) / columns) > windowStats[windowTable[currentFocusWindow]].height / 2) {
		// first we waste some time by getting the last option for no reason
		MenuOption* tmpOption = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		short tmp = cast(short)(columns - 1);
		while (tmp != 0) {
			tmp--;
			tmpOption = &menuOptions[menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption].next];
		}
		// then we add the 'Next' option
		createNewMenuOptionAtPositionWithUserdataF(0, 0, windowStats[windowTable[currentFocusWindow]].height / 2 - 1, &menuNextLabel[0], null);
		menuOptions[windowStats[windowTable[currentFocusWindow]].optionCount].page = 0;
	}
}

/** The "To " string used for targetting in battles
 * Original_Address: $(DOLLAR)C454F2
 */
immutable ubyte[3] battleToText = ebString!3("To ");

/** Text string used when trying to target the front row in battle
 * Original_Address: $(DOLLAR)C454F5
 */
immutable ubyte[13] battleFrontRowText = ebString!13("the Front Row");

/** Text string used when trying to target the back row in battle
 * Original_Address: $(DOLLAR)C45502
 */
immutable ubyte[13] battleBackRowText = ebString!13("the Back Row");

/** Pointers to data used in text CC [1C 01 XX] along with types and sizes
 * Original_Address: $(DOLLAR)C4550F
 */
const CC1C01Entry[96] cc1C01Table;

shared static this() {
	import std.array : join;
	cc1C01Table = [
		CC1C01Entry(0, null),
		CC1C01Entry(CC1C01Type.string | gameState.mother2PlayerName.sizeof, &gameState.mother2PlayerName[0]),
		CC1C01Entry(CC1C01Type.string | gameState.earthboundPlayerName.sizeof, &gameState.earthboundPlayerName[0]),
		CC1C01Entry(CC1C01Type.string | gameState.petName.sizeof, &gameState.petName[0]),
		CC1C01Entry(CC1C01Type.string | gameState.favouriteFood.sizeof, &gameState.favouriteFood[0]),
		CC1C01Entry(CC1C01Type.string | gameState.favouriteThing.sizeof, &gameState.favouriteThing[0]),
		CC1C01Entry(CC1C01Type.integer | gameState.moneyCarried.sizeof, &gameState.moneyCarried),
		CC1C01Entry(CC1C01Type.integer | gameState.bankBalance.sizeof, &gameState.bankBalance),
		CC1C01Entry(CC1C01Type.string | PartyCharacter.name.sizeof, &partyCharacters[0].name),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.level.sizeof, &partyCharacters[0].level),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.exp.sizeof, &partyCharacters[0].exp),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.current.integer.sizeof, &partyCharacters[0].hp.current.integer),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.target.sizeof, &partyCharacters[0].hp.target),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxHP.sizeof, &partyCharacters[0].maxHP),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.current.integer.sizeof, &partyCharacters[0].pp.current.integer),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.target.sizeof, &partyCharacters[0].pp.target),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxPP.sizeof, &partyCharacters[0].maxPP),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.offense.sizeof, &partyCharacters[0].offense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.defense.sizeof, &partyCharacters[0].defense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.speed.sizeof, &partyCharacters[0].speed),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.guts.sizeof, &partyCharacters[0].guts),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.luck.sizeof, &partyCharacters[0].luck),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.vitality.sizeof, &partyCharacters[0].vitality),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.iq.sizeof, &partyCharacters[0].iq),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseIQ.sizeof, &partyCharacters[0].baseIQ),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseOffense.sizeof, &partyCharacters[0].baseOffense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseDefense.sizeof, &partyCharacters[0].baseDefense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseSpeed.sizeof, &partyCharacters[0].baseSpeed),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseGuts.sizeof, &partyCharacters[0].baseGuts),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseLuck.sizeof, &partyCharacters[0].baseLuck),
		CC1C01Entry(CC1C01Type.string | PartyCharacter.name.sizeof, &partyCharacters[1].name),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.level.sizeof, &partyCharacters[1].level),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.exp.sizeof, &partyCharacters[1].exp),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.current.integer.sizeof, &partyCharacters[1].hp.current.integer),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.target.sizeof, &partyCharacters[1].hp.target),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxHP.sizeof, &partyCharacters[1].maxHP),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.current.integer.sizeof, &partyCharacters[1].pp.current.integer),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.target.sizeof, &partyCharacters[1].pp.target),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxPP.sizeof, &partyCharacters[1].maxPP),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.offense.sizeof, &partyCharacters[1].offense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.defense.sizeof, &partyCharacters[1].defense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.speed.sizeof, &partyCharacters[1].speed),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.guts.sizeof, &partyCharacters[1].guts),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.luck.sizeof, &partyCharacters[1].luck),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.vitality.sizeof, &partyCharacters[1].vitality),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.iq.sizeof, &partyCharacters[1].iq),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseIQ.sizeof, &partyCharacters[1].baseIQ),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseOffense.sizeof, &partyCharacters[1].baseOffense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseDefense.sizeof, &partyCharacters[1].baseDefense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseSpeed.sizeof, &partyCharacters[1].baseSpeed),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseGuts.sizeof, &partyCharacters[1].baseGuts),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseLuck.sizeof, &partyCharacters[1].baseLuck),
		CC1C01Entry(CC1C01Type.string | PartyCharacter.name.sizeof, &partyCharacters[2].name),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.level.sizeof, &partyCharacters[2].level),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.exp.sizeof, &partyCharacters[2].exp),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.current.integer.sizeof, &partyCharacters[2].hp.current.integer),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.target.sizeof, &partyCharacters[2].hp.target),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxHP.sizeof, &partyCharacters[2].maxHP),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.current.integer.sizeof, &partyCharacters[2].pp.current.integer),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.target.sizeof, &partyCharacters[2].pp.target),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxPP.sizeof, &partyCharacters[2].maxPP),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.offense.sizeof, &partyCharacters[2].offense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.defense.sizeof, &partyCharacters[2].defense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.speed.sizeof, &partyCharacters[2].speed),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.guts.sizeof, &partyCharacters[2].guts),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.luck.sizeof, &partyCharacters[2].luck),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.vitality.sizeof, &partyCharacters[2].vitality),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.iq.sizeof, &partyCharacters[2].iq),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseIQ.sizeof, &partyCharacters[2].baseIQ),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseOffense.sizeof, &partyCharacters[2].baseOffense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseDefense.sizeof, &partyCharacters[2].baseDefense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseSpeed.sizeof, &partyCharacters[2].baseSpeed),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseGuts.sizeof, &partyCharacters[2].baseGuts),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseLuck.sizeof, &partyCharacters[2].baseLuck),
		CC1C01Entry(CC1C01Type.string | PartyCharacter.name.sizeof, &partyCharacters[3].name),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.level.sizeof, &partyCharacters[3].level),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.exp.sizeof, &partyCharacters[3].exp),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.current.integer.sizeof, &partyCharacters[3].hp.current.integer),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.target.sizeof, &partyCharacters[3].hp.target),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxHP.sizeof, &partyCharacters[3].maxHP),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.current.integer.sizeof, &partyCharacters[3].pp.current.integer),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.target.sizeof, &partyCharacters[3].pp.target),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxPP.sizeof, &partyCharacters[3].maxPP),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.offense.sizeof, &partyCharacters[3].offense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.defense.sizeof, &partyCharacters[3].defense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.speed.sizeof, &partyCharacters[3].speed),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.guts.sizeof, &partyCharacters[3].guts),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.luck.sizeof, &partyCharacters[3].luck),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.vitality.sizeof, &partyCharacters[3].vitality),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.iq.sizeof, &partyCharacters[3].iq),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseIQ.sizeof, &partyCharacters[3].baseIQ),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseOffense.sizeof, &partyCharacters[3].baseOffense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseDefense.sizeof, &partyCharacters[3].baseDefense),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseSpeed.sizeof, &partyCharacters[3].baseSpeed),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseGuts.sizeof, &partyCharacters[3].baseGuts),
		CC1C01Entry(CC1C01Type.integer | PartyCharacter.baseLuck.sizeof, &partyCharacters[3].baseLuck),
	];
}

/** Bitmasks used to pack 8 event flags into bytes.
 *
 * Was this an actual table, or was it compiler-generated as an optimization?
 * Original_Address: $(DOLLAR)C4562F
 */
immutable ubyte[8] eventFlagMasks = [
	1 << 0,
	1 << 1,
	1 << 2,
	1 << 3,
	1 << 4,
	1 << 5,
	1 << 6,
	1 << 7,
];

/** Determines if a character is holding a specific item
 * Params:
 * 	character = The character whose inventory is being searched (PartyMember.ness, PartyMember.paula, PartyMember.jeff and PartyMember.poo are valid)
 * 	item = The item to search for
 * Returns: 0 if not found, character id if found
 * Original_Address: $(DOLLAR)C45637
 */
ubyte testCharacterHasItem(short character, short item) {
	for (short i = 0; i < PartyCharacter.items.length; i++) {
		if (partyCharacters[character - 1].items[i] == item) {
			return cast(ubyte)character;
		}
	}
	return 0;
}

/** Determines if the party or a specific character is holding a certain item
 * Params:
 * 	character = Character(s) whose inventory should be searched (Accepted values: PartyMember.ness, PartyMember.paula, PartyMember.jeff, PartyMember.poo, PartyMember.all)
 * 	item = Item to search for
 * Returns: 0 if not found, character ID of party member with item otherwise
 * Original_Address: $(DOLLAR)C45683
 */
ubyte testPartyHasItem(short character, short item) {
	if (character == PartyMember.any) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (testCharacterHasItem(gameState.partyMembers[i], item) != 0) {
				return gameState.partyMembers[i];
			}
		}
		return 0;
	} else {
		return testCharacterHasItem(character, item);
	}
}

/** Determines if a character has inventory space
 * Params:
 * 	character = The character whose inventory is being tested (PartyMember.ness, PartyMember.paula, PartyMember.jeff and PartyMember.poo are valid)
 * Returns: 0 if full, character ID otherwise
 * Original_Address: $(DOLLAR)C456E4
 */
short testCharacterHasInventorySpace(short character) {
	for (short i = 0; i < PartyCharacter.items.length; i++) {
		if (partyCharacters[character - 1].items[i] == 0) {
			return character;
		}
	}
	return 0;
}

/** Determines if the party or a specific character has inventory space
 * Params:
 * 	character = Character(s) whose inventory is being tested (Accepted values: PartyMember.ness, PartyMember.paula, PartyMember.jeff, PartyMember.poo, PartyMember.all)
 * Returns: 0 if all full, character ID of first found party member with room otherwise
 * Original_Address: $(DOLLAR)C4577D
 */
short testPartyHasInventorySpace(short character) {
	if (character == PartyMember.any) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (testCharacterHasInventorySpace(gameState.partyMembers[i] != 0)) {
				return gameState.partyMembers[i];
			}
		}
		return 0;
	} else {
		return testCharacterHasInventorySpace(character);
	}
}

/** Changes equipped weapon for character and recalculates stats
 * Params:
 * 	character = The character who is equipping the item (PartyMember.ness, PartyMember.paula, PartyMember.jeff, PartyMember.poo are valid)
 * 	slot = The item slot of the item being equipped
 * Returns: The item previously equipped in this slot, if any
 * Original_Address: $(DOLLAR)C4577D
 */
ubyte changeEquippedWeapon(ushort character, short slot) {
	const oldWeapon = partyCharacters[character - 1].equipment[EquipmentSlot.weapon];
	partyCharacters[character - 1].equipment[EquipmentSlot.weapon] = cast(ubyte)slot;
	recalcCharacterPostmathOffense(character);
	recalcCharacterPostmathGuts(character);
	recalcCharacterMissRate(character);
	return oldWeapon;
}

/** Changes equipped body gear for character and recalculates stats
 * Params:
 * 	character = The character who is equipping the item (PartyMember.ness, PartyMember.paula, PartyMember.jeff, PartyMember.poo are valid)
 * 	slot = The item slot of the item being equipped
 * Returns: The item previously equipped in this slot, if any
 * Original_Address: $(DOLLAR)C457CA
 */
ubyte changeEquippedBody(ushort character, short slot) {
	const oldBody = partyCharacters[character - 1].equipment[EquipmentSlot.body];
	partyCharacters[character - 1].equipment[EquipmentSlot.body] = cast(ubyte)slot;
	recalcCharacterPostmathDefense(character);
	recalcCharacterPostmathSpeed(character);
	calcResistances(character);
	return oldBody;
}

/** Changes equipped arm gear for character and recalculates stats
 * Params:
 * 	character = The character who is equipping the item (PartyMember.ness, PartyMember.paula, PartyMember.jeff, PartyMember.poo are valid)
 * 	slot = The item slot of the item being equipped
 * Returns: The item previously equipped in this slot, if any
 * Original_Address: $(DOLLAR)C45815
 */
ubyte changeEquippedArms(ushort character, short slot) {
	const oldArms = partyCharacters[character - 1].equipment[EquipmentSlot.arms];
	partyCharacters[character - 1].equipment[EquipmentSlot.arms] = cast(ubyte)slot;
	recalcCharacterPostmathDefense(character);
	recalcCharacterPostmathLuck(character);
	calcResistances(character);
	return oldArms;
}

/** Changes equipped other gear for character and recalculates stats
 * Params:
 * 	character = The character who is equipping the item (PartyMember.ness, PartyMember.paula, PartyMember.jeff, PartyMember.poo are valid)
 * 	slot = The item slot of the item being equipped
 * Returns: The item previously equipped in this slot, if any
 * Original_Address: $(DOLLAR)C45860
 */
ubyte changeEquippedOther(ushort character, short slot) {
	const oldOther = partyCharacters[character - 1].equipment[EquipmentSlot.other];
	partyCharacters[character - 1].equipment[EquipmentSlot.other] = cast(ubyte)slot;
	recalcCharacterPostmathDefense(character);
	recalcCharacterPostmathLuck(character);
	calcResistances(character);
	return oldOther;
}

/** Bitmask of flags controlling usability of items by each character
 * Original_Address: $(DOLLAR)C458AB
 */
immutable ubyte[4] itemUsableFlags = [
	ItemFlags.nessCanUse,
	ItemFlags.paulaCanUse,
	ItemFlags.jeffCanUse,
	ItemFlags.pooCanUse,
];

/** Gets the status effect that the party or specific character are afflicted with in the given group
 * Params:
 * 	character = The character to check for afflictions (ignored for StatusGroups.party)
 * 	group = The status group to check
 * Returns: 0 if party member is absent, 1 if no affliction, 2+ if any afflictions
 * Original_Address: $(DOLLAR)C45860
 */
short checkStatusGroup(short character, short group) {
	if (group - 1 == StatusGroups.party) {
		return gameState.partyStatus + 1;
	}
	if (testIfPartyMemberPresent(character) != 0) {
		return partyCharacters[character - 1].afflictions[group - 1] + 1;
	}
	return 0;
}

/** Inflicts a status to the party or a single character outside of battle
 * Params:
 * 	character = The character to inflict (mostly ignored for StatusGroups.party)
 * 	group = The status group to inflict
 * 	effect = The status effect to inflict
 * Returns: 0 if party member is absent, character ID otherwise
 * Original_Address: $(DOLLAR)C458FE
 */
short inflictStatusNonBattle(short character, short group, short effect) {
	if (group - 1 == StatusGroups.party) {
		gameState.partyStatus = cast(ubyte)(effect - 1);
		return character;
	}
	if (testIfPartyMemberPresent(character) != 0) {
		partyCharacters[character - 1].afflictions[group - 1] = cast(ubyte)(effect - 1);
		unknownC3EE4D();
		return character;
	}
	return 0;
}

/** Miscellaneous help text for targetting
 * Original_Address: $(DOLLAR)C45963
 */
immutable ubyte[10][5] miscTargetText = [
	ebString!10("Who?"),
	ebString!10("Which?"),
	ebString!10("Where?"),
	ebString!10("Whom?"),
	ebString!10("Where?"),
];

/** Caption text for the phone call menu
 * Original_Address: $(DOLLAR)C45995
 */
immutable ubyte[5] phoneCallText = ebString!5("Call:");

/** Get EXP needed for the given character to level up
 * Params:
 * 	character = The character ID to check
 * Returns: Difference between next level's needed EXP and current EXP, 0 if at max level
 * Original_Address: $(DOLLAR)C4599A
 */
uint getRequiredEXP(short character) {
	character--;
	if (partyCharacters[character].level == maxLevel) {
		return 0;
	}
	return expTable[character][partyCharacters[character].level + 1] - partyCharacters[character].exp;
}

/** Tile IDs used for status icons (checkered background)
 * Original_Address: $(DOLLAR)C45A27
 */
immutable ushort[7][7] statusIconsCheckered = [
	[
		Status0.unconscious - 1: TallTextTile.checker,
		Status0.diamondized - 1: TallTextTile.diamondizedCheckered,
		Status0.paralyzed - 1: TallTextTile.paralyzedCheckered,
		Status0.nauseous - 1: TallTextTile.nauseatedCheckered,
		Status0.poisoned - 1: TallTextTile.poisonedCheckered,
		Status0.sunstroke - 1: TallTextTile.sunstrokeCheckered,
		Status0.cold - 1: TallTextTile.coldCheckered
	], [
		Status1.mushroomized - 1: TallTextTile.mushroomizedCheckered,
		Status1.possessed - 1: TallTextTile.possessedCheckered,
	], [
		Status2.asleep - 1: TallTextTile.asleepCheckered,
		Status2.crying - 1: TallTextTile.cryingCheckered,
		Status2.immobilized - 1: TallTextTile.checker,
		Status2.solidified - 1: TallTextTile.checker,
		Status2.unknown - 1: TallTextTile.checker,
	], [
		Status3.strange - 1: TallTextTile.strangeCheckered,
	], [
		Status4.cantConcentrate - 1: TallTextTile.checker,
	], [
		Status5.homesick - 1: TallTextTile.checker,
	], [
		Status6.psiShieldPower - 1: TallTextTile.checker,
		Status6.psiShield - 1: TallTextTile.checker,
		Status6.shieldPower - 1: TallTextTile.checker,
		Status6.shield - 1: TallTextTile.checker,
	]
];
/** Tile IDs used for status icons (normal background)
 * Original_Address: $(DOLLAR)C45A89
 */
immutable ushort[7][7] statusIcons = [
	[
		TallTextTile.windowBackground,
		TallTextTile.diamondized,
		TallTextTile.paralyzed,
		TallTextTile.nauseated,
		TallTextTile.poisoned,
		TallTextTile.sunstroke,
		TallTextTile.cold
	], [
		TallTextTile.mushroomized,
		TallTextTile.possessed,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground
	], [
		TallTextTile.sleep,
		TallTextTile.crying,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground
	], [
		TallTextTile.strange,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground
	], [
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground
	], [
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground
	], [
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
		TallTextTile.windowBackground,
	]
];
/** Palette IDs used for the name-highlighting effect in the HP/PP windows, defined per-status
 * Original_Address: $(DOLLAR)C45AEB
 */
immutable ushort[7][7] statusNamePalettes = [
	[
		Status0.unconscious - 1: 2,
		Status0.diamondized - 1: 6,
		Status0.paralyzed - 1: 6,
		Status0.nauseous - 1: 6,
		Status0.poisoned - 1: 6,
		Status0.sunstroke - 1: 6,
		Status0.cold - 1: 6,
	], [
		Status1.mushroomized - 1: 6,
		Status1.possessed - 1: 6,
	], [
		Status2.asleep - 1: 6,
		Status2.crying - 1: 6,
		Status2.immobilized - 1: 6,
		Status2.solidified - 1: 6,
		Status2.unknown - 1: 6,
	], [
		Status3.strange - 1: 6,
	], [
		Status4.cantConcentrate - 1: 4,
	], [
		Status5.homesick - 1: 4,
	], [
		Status6.psiShieldPower - 1: 4,
		Status6.psiShield - 1: 4,
		Status6.shieldPower - 1: 4,
		Status6.shield - 1: 4,
	]
];

///
immutable ubyte[35] psiInfoInstruction = ebString!35("@Press the -A- Button for PSI info.");
///
immutable ubyte[16][7] statusNamesGroup0 = [
	ebString!16("Unconscious"),
	ebString!16("Diamondized"),
	ebString!16("Paralyzed"),
	ebString!16("Nauseous"),
	ebString!16("Poisoned"),
	ebString!16("Sunstroke"),
	ebString!16("Sniffling"),
];
///
immutable ubyte[16][2] statusNamesGroup1 = [
	ebString!16("Mashroomized"),
	ebString!16("Possessed"),
];
///
immutable ubyte[16][1] statusNamesGroup5 = [
	ebString!16("Homesick"),
];
///
immutable ubyte[12] statusEquipWindowText7 = ebString!12("Stored Goods");
///
immutable ubyte[8] offenseEquip = ebString!8("Offense:");
///
immutable ubyte[8] defenseEquip = ebString!8("Defense:");
///
immutable ubyte[11][4] equipmentSlotNamesRightAligned = [
	ebString!11("  Weapon"),
	ebString!11("      Body"),
	ebString!11("     Arms"),
	ebString!11("     Other"),
];
///
immutable ubyte[8][4] equipmentSlotNames = [
	ebString!8("Weapons"),
	ebString!8("Body"),
	ebString!8("Arms"),
	ebString!8("Others"),
];
///
immutable ubyte[10] nothingEquipped = ebString!10("(Nothing) ");
///
immutable ubyte[5] statusEquipWindowText13 = ebString!5("None");
///
immutable ubyte[3] statusEquipWindowText14 = ebString!3("To:");

/** Probabilities for homesickness, divided into 15 level segments. Expressed as fractions out of 256.
 * Original_Address: $(DOLLAR)C45C8A
 */
immutable ubyte[6] homesicknessProbabilities = [
	0,
	100,
	150,
	200,
	250,
	0,
];

/** Cleans up VWF state?
 *
 * Half of this function is vestigial in Earthbound. Will need to look into Mother 2 to figure out what this is really for.
 * Original_Address: $(DOLLAR)C45E96
 */
void resetVWFState() {
	// wait for DMA to finish
	while (dmaTransferFlag != 0) { waitForInterrupt(); }

	// there are a lot of vestigial vars here...

	for (short i = 0; i < 0x20; i++) {
		unread7E9D23[i][0] = 0xFF;
	}
	// reset VWF rendering position
	vwfTile = 0;
	vwfX = 0;

	if (++unused7E9E27 >= 0x30) {
		unused7E9E27 = 0;
	}
	unread7E9E29 = 0;
	resetTextRenderState();
}

/** Determines whether or not a character knows a PSI ability
 * Params:
 * 	character = Character to check (0 - 3)
 * 	psi = A PSI ID
 * Returns: 1 if known, 0 otherwise
 * Original_Address: $(DOLLAR)C45ECE
 */
short checkIfPSIKnown(short character, short psi) {
	ubyte level;
	// level for which character?
	switch (character) {
		case PartyMember.ness:
			level = psiAbilityTable[psi].nessLevel;
			break;
		case PartyMember.paula:
			level = psiAbilityTable[psi].paulaLevel;
			break;
		case PartyMember.poo:
			level = psiAbilityTable[psi].pooLevel;
			break;
		default: break;
	}
	// is character's level high enough?
	if (level != 0) {
		short isKnown = 0;
		if (level <= partyCharacters[character - 1].level) {
			isKnown = 1;
		}
		return isKnown;
	}
	return 0;
}

/** Generates a random number from [0 to X]
 *
 * Note that this doesn't produce a discrete uniform distribution in most cases.
 * All values below 256 % (X + 1) will be twice as likely as values above, so results will be unexpected for values of X that aren't powers of 2.
 * Params:
 * 	val = Upper limit for random numbers
 * Returns: A random number between 0 and X
 * Original_Address: $(DOLLAR)C45F7B
 */
ushort randMod(ushort val) {
	return cast(ubyte)(rand() % (val + 1));
}
/** A matrix of directions, arranged top to bottom, left to right
 * Original_Address: $(DOLLAR)C45F96
 */
immutable ushort[3][3] directionMatrix = [
	[ Direction.upLeft, Direction.up, Direction.upRight ],
	[ Direction.left, Direction.up, Direction.right ],
	[ Direction.downLeft, Direction.down, Direction.downRight ],
];

/** Gets the Direction that faces from point A to point B
 * Params:
 * 	targetX = Target X coordinate
 * 	targetY = Target Y coordinate
 * 	originX = Origin X coordinate
 * 	originY = Origin Y coordinate
 * Returns: A Direction to face
 * Original_Address: $(DOLLAR)C45FA8
 */
short getDirectionTo(short targetX, short targetY, short originX, short originY) {
	short xDiff = cast(short)(originX - targetX);
	short yDiff = cast(short)(originY - targetY);
	short dirColumn;
	if (xDiff > 0) { // left
		dirColumn = 0;
	} else if (xDiff == 0) { // same column
		dirColumn = 1;
	} else { // right
		dirColumn = 2;
	}
	short dirRow;
	if (yDiff > 0) { // above
		dirRow = 0;
	} else if (yDiff == 0) { // same row
		dirRow = 1;
	} else { // below
		dirRow = 2;
	}
	return directionMatrix[dirRow][dirColumn];
}

/** Gets the ID of the first entity with the requested sprite
 * Params:
 * 	sprite = Sprite ID
 * Returns: Active entity ID, -1 if none matched
 * Original_Address: $(DOLLAR)C46028
 */
short findEntityBySprite(short sprite) {
	for (short i = 0; i < maxEntities; i++) {
		if (entitySpriteIDs[i] == sprite) {
			return i;
		}
	}
	return -1;
}

/** Finds the first active entity with a matching NPC ID
 * Params:
 * 	id = The NPC ID to search for
 * Returns: The first entity ID with a matching NPC ID, or -1 if not found
 * Original_Address: $(DOLLAR)C4605A
 */
short findEntityByNPCID(short id) {
	for (short i = 0; i < maxEntities; i++) {
		if (id == entityNPCIDs[i]) {
			return i;
		}
	}
	return -1;
}

/** Gets the ID of the first entity with a matching party member ID
 * Params:
 * 	id = Party member ID
 * Returns: Active entity ID, -1 if none matched
 * Original_Address: $(DOLLAR)C4608C
 */
short findEntityByPartyMemberID(short id) {
	if (id == PartyMember.leader) {
		return gameState.firstPartyMemberEntity;
	}
	for (short i = 0; i < 6; i++) {
		if (id == gameState.partyMemberIndex[i]) {
			return gameState.partyEntities[i];
		}
	}
	return -1;
}

/** Delete an entity with a matching NPC ID with fade animation
 * Params:
 * 	npc = NPC to fade
 * 	fadeStyle = Fading style (see ObjFX for styles)
 * Original_Address: $(DOLLAR)C460CE
 */
void fadeNPC(short npc, short fadeStyle) {
	short entity = findEntityByNPCID(npc);
	if (entity == -1) {
		return;
	}
	entityPreparedXCoordinate = entityAbsXTable[entity];
	entityPreparedYCoordinate = entityAbsYTable[entity];
	entityPreparedDirection = entityDirections[entity];
	setEntityActionScript((fadeStyle != ObjFX.hideNone) ? &fadeWaitScript.ptr[0] : &actionScriptTerminate.ptr[0], entity);
}

/** Delete an entity with a matching sprite with fade animation
 * Params:
 * 	sprite = Sprite to fade
 * 	fadeStyle = Fading style (see ObjFX for styles)
 * Original_Address: $(DOLLAR)C46125
 */
void fadeSprite(short sprite, short fadeStyle) {
	short entity = findEntityBySprite(sprite);
	if (entity == -1) {
		return;
	}
	entityPreparedXCoordinate = entityAbsXTable[entity];
	entityPreparedYCoordinate = entityAbsYTable[entity];
	entityPreparedDirection = entityDirections[entity];
	setEntityActionScript((fadeStyle != ObjFX.hideNone) ? &fadeWaitScript.ptr[0] : &actionScriptTerminate.ptr[0], entity);
}

/** Changes an entity with matching NPC ID's ActionScript
 *
 * Has no effect if NPC not found.
 * Params:
 * 	npc = NPC ID to search for
 * 	script = ActionScript ID
 * Original_Address: $(DOLLAR)C4617C
 */
void changeScriptForEntityByNPCID(short npc, short script) {
	short entity = findEntityByNPCID(npc);
	if (entity == -1) {
		return;
	}
	tracef("Changing entity %s script to %s", entity, cast(ActionScript)script);
	setEntityActionScript(&actionScriptScriptPointers[script][0], entity);
}

/** Changes an entity with matching sprite's ActionScript
 *
 * Has no effect if sprite not found.
 * Params:
 * 	sprite = Sprite ID to search for
 * 	script = ActionScript ID
 * Original_Address: $(DOLLAR)C461CC
 */
void changeScriptForEntityBySprite(short sprite, short script) {
	short entity = findEntityBySprite(sprite);
	if (entity == -1) {
		return;
	}
	tracef("Changing entity %s script to %s", entity, cast(ActionScript)script);
	setEntityActionScript(&actionScriptScriptPointers[script][0], entity);
}

/** Finds an active entity matching a specific ID type
 * Params:
 * 	type = 0 for party member ID, 1 for NPC ID, 2 for sprite ID
 * 	id = The party member/NPC/sprite ID to search for
 * Returns: An active entity index
 * Original_Address: $(DOLLAR)C4621C
 */
short findEntity(short type, short id) {
	short entity;
	switch (type) {
		case 0:
			entity = findEntityByPartyMemberID(id);
			break;
		case 1:
			entity = findEntityByNPCID(id);
			break;
		case 2:
			entity = findEntityBySprite(id);
			break;
		default: break;
	}
	return entity;
}

/** Gets direction from some source entity to some target entity
 * Params:
 * 	sourceType = Type of source entity ID (0 for party members, 1 for NPCs, 2 for sprites)
 * 	source = The source entity ID matching sourceType
 * 	targetType = Type of target entity ID (0 for party members, 1 for NPCs, 2 for sprites)
 * 	target = The target entity ID matching targetType
 * Returns: The 8-way direction from source to target
 * Original_Address: $(DOLLAR)C46257
 */
short getDirectionFromEntityToEntity(short sourceType, short source, short targetType, short target) {
	short sourceEntity = findEntity(sourceType, source);
	short targetEntity = findEntity(targetType, target);
	return (getScreenAngle(entityAbsXTable[sourceEntity], entityAbsYTable[sourceEntity], entityAbsXTable[targetEntity], entityAbsYTable[targetEntity]) + 0x1000) / 0x2000;
}

/** Gets direction from an NPC to some target entity
 * Params:
 * 	npc = NPC ID for the source entity
 * 	targetType = Type of target entity (0 for party members, 1 for NPCs, 2 for sprites)
 * 	target = The target entity ID matching targetType
 * Returns: The 8-way direction from source to target
 * Original_Address: $(DOLLAR)C462AE
 */
short getDirectionFromNPCTo(short npc, short targetType, short target) {
	return getDirectionFromEntityToEntity(1, npc, targetType, target);
}

unittest {
	initializeForTesting();
	gameState.partyMemberIndex[0] = PartyMember.pokey;
	entityNPCIDs[cast(ubyte)createOverworldEntity(OverworldSprite.ness, ActionScript.partyMemberFollowing, -1, 2792, 600)] = 42;
	gameState.partyEntities[0] = cast(ubyte)createOverworldEntity(OverworldSprite.pokey, ActionScript.partyMemberFollowing, -1, 2792, 585);
	assert(getDirectionFromNPCTo(42, 0, PartyMember.pokey) == 0);
}

/** Gets direction from a sprite to some target entity
 * Params:
 * 	sprite = Sprite ID for the source entity
 * 	targetType = Type of target entity (0 for party members, 1 for NPCs, 2 for sprites)
 * 	target = The target entity ID matching targetType
 * Returns: The 8-way direction from source to target
 * Original_Address: $(DOLLAR)C462C9
 */
short getDirectionFromSpriteTo(short sprite, short targetType, short target) {
	return getDirectionFromEntityToEntity(2, sprite, targetType, target);
}

unittest {
	initializeForTesting();
	gameState.partyMemberIndex[0] = PartyMember.pokey;
	createOverworldEntity(OverworldSprite.ness, ActionScript.partyMemberFollowing, -1, 2792, 600);
	gameState.partyEntities[0] = cast(ubyte)createOverworldEntity(OverworldSprite.pokey, ActionScript.partyMemberFollowing, -1, 2792, 585);
	assert(getDirectionFromSpriteTo(OverworldSprite.ness, 0, PartyMember.pokey) == 0);
}

/** Gets direction from a party member to some target entity
 * Params:
 * 	partyMember = Party member ID for the source entity
 * 	targetType = Type of target entity (0 for party members, 1 for NPCs, 2 for sprites)
 * 	target = The target entity ID matching targetType
 * Returns: The 8-way direction from source to target
 * Original_Address: $(DOLLAR)C462E4
 */
short getDirectionFromPartyMemberTo(short partyMember, short targetType, short target) {
	return getDirectionFromEntityToEntity(0, partyMember, targetType, target);
}

unittest {
	initializeForTesting();
	gameState.partyMemberIndex[0] = PartyMember.ness;
	gameState.partyMemberIndex[1] = PartyMember.pokey;
	gameState.partyEntities[0] = cast(ubyte)createOverworldEntity(OverworldSprite.ness, ActionScript.partyMemberFollowing, -1, 2792, 600);
	gameState.partyEntities[1] = cast(ubyte)createOverworldEntity(OverworldSprite.pokey, ActionScript.partyMemberFollowing, -1, 2792, 585);
	assert(getDirectionFromPartyMemberTo(PartyMember.ness, 0, PartyMember.pokey) == 0);
}

/** Sets the direction of an entity with matching NPC ID and updates displayed sprite as appropriate
 *
 * No effect if no matching entities.
 * Params:
 * 	npc = The NPC ID to search for
 * 	direction = The new direction to face
 * Original_Address: $(DOLLAR)C462FF
 */
void setNPCDirection(short npc, short direction) {
	short entity = findEntityByNPCID(npc);
	if (entity == -1) {
		return;
	}
	if (entityDirections[entity] != direction) {
		entityDirections[entity] = direction;
		updateEntitySprite(entity);
	}
}

/** Sets the direction of an entity with matching sprite and updates displayed sprite as appropriate
 *
 * No effect if no matching entities.
 * Params:
 * 	sprite = The sprite to search for
 * 	direction = The new direction to face
 * Original_Address: $(DOLLAR)C46331
 */
void setSpriteDirection(short sprite, short direction) {
	short entity = findEntityBySprite(sprite);
	if (entity == -1) {
		return;
	}
	if (entityDirections[entity] != direction) {
		entityDirections[entity] = direction;
		updateEntitySprite(entity);
	}
}

/** Sets the direction of an entity with matching party member ID and updates displayed sprite as appropriate
 *
 * No effect if no matching entities.
 * Params:
 * 	partyMember = The party member to search for
 * 	direction = The new direction to face
 * Original_Address: $(DOLLAR)C46363
 */
void setPartyMemberDirection(short partyMember, short direction) {
	short entity = findEntityByPartyMemberID(partyMember);
	if (entity == -1) {
		return;
	}
	if (entityDirections[entity] != direction) {
		entityDirections[entity] = direction;
		updateEntitySpriteFrame(entity);
	}
}

/** Sets the direction for the entire party and updates sprite as appropriate
 * Params:
 * 	direction = New direction to face
 * Original_Address: $(DOLLAR)C46397
 */
void setPartyDirection(short direction) {
	for (short i = 0; i < gameState.partyCount; i++) {
		if (16 <= gameState.partyMemberIndex[i]) {
			continue;
		}
		short entity = gameState.partyEntities[i];
		if (entityDirections[entity] == direction) {
			continue;
		}
		entityDirections[entity] = direction;
		updateEntitySpriteFrame(entity);
	}
}

/** Stops drawing a single party member or the entire party
 * Params:
 * 	partyMember = A party member ID or 0xFF for the entire party
 * Original_Address: $(DOLLAR)C463F4
 */
void hideCharacterOrParty(short partyMember) {
	playerIntangibilityFlash();
	playerIntangibilityFrames = 0;
	if (partyMember != 0xFF) {
		short entity = findEntityByPartyMemberID(partyMember);
		if (entity != -1) {
			entitySpriteMapFlags[entity] |= SpriteMapFlags.drawDisabled;
		}
	} else {
		for (short i = 0; i < gameState.partyCount; i++) {
			entitySpriteMapFlags[gameState.partyEntities[i]] |= SpriteMapFlags.drawDisabled;
		}
	}
}

/** Resumes drawing a single party member or the entire party
 * Params:
 * 	partyMember = A party member ID or 0xFF for the entire party
 * Original_Address: $(DOLLAR)C4645A
 */
void unhideCharacterOrParty(short partyMember) {
	if (partyMember != 0xFF) {
		short entity = findEntityByPartyMemberID(partyMember);
		if (entity != -1) {
			entitySpriteMapFlags[entity] &= ~SpriteMapFlags.drawDisabled;
		}
	} else {
		for (short i = 0; i < gameState.partyCount; i++) {
			entitySpriteMapFlags[gameState.partyEntities[i]] &= ~SpriteMapFlags.drawDisabled;
		}
	}
}

/** Creates an entity with the given NPC ID and ActionScript. Uses prepared coordinates and direction
 * Params:
 * 	npcID = The ID of the NPC to create an entity for
 * 	actionScript = The entity's new script
 * Returns: The new entity ID
 * Original_Address: $(DOLLAR)C464B5
 */
short createPreparedEntityNPC(short npcID, short actionScript) {
	short result = createOverworldEntity(npcConfig[npcID].sprite, actionScript, -1, entityPreparedXCoordinate, entityPreparedYCoordinate);
	entityDirections[result] = entityPreparedDirection;
	entityNPCIDs[result] = npcID;
	return result;
}

/** Creates an entity with the given sprite and ActionScript. Uses prepared coordinates and direction
 * Params:
 * 	sprite = The entity's new sprite
 * 	actionScript = The entity's new script
 * Returns: The new entity ID
 * Original_Address: $(DOLLAR)C46507
 */
short createPreparedEntitySprite(short sprite, short actionScript) {
	short result = createOverworldEntity(sprite, actionScript, -1, entityPreparedXCoordinate, entityPreparedYCoordinate);
	entityDirections[result] = entityPreparedDirection;
	return result;
}

/** Spawns a new entity at the current active entity's coordinates
 * Params:
 * 	sprite = The new entity's sprite
 * 	actionScript = The new entity's script
 * Returns: The new entity's ID
 * Original_Address: $(DOLLAR)C46534
 */
short spawnEntityAtSelf(short sprite, short actionScript) {
	return createOverworldEntity(sprite, actionScript, -1, entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]);
}

/** Disable the movement and script of an entity with matching NPC ID
 * Params:
 * 	npc = NPC ID to search for
 * Original_Address: $(DOLLAR)C4655E
 */
void disableEntityByNPCID(short npc) {
	short entity = findEntityByNPCID(npc);
	if (entity == -1) {
		return;
	}
	entityCallbackFlags[entity] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
}

/** Disable the movement and script of an entity with matching sprite
 * Params:
 * 	sprite = Sprite to search for
 * Original_Address: $(DOLLAR)C46579
 */
void disableEntityBySprite(short sprite){
	short entity = findEntityBySprite(sprite);
	if (entity == -1) {
		return;
	}
	entityCallbackFlags[entity] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
}

/** Disables the movement and script of a party member or entire party
 * Params:
 * 	character = Party member ID or 0xFF for entire party
 * Original_Address: $(DOLLAR)C46594
 */
void disableEntityByCharacterOrParty(short character) {
	if (character != 0xFF) {
		short entity = findEntityByPartyMemberID(character);
		if (entity == -1) {
			return;
		}
		entityCallbackFlags[entity] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
	} else {
		entityCallbackFlags[partyLeaderEntity] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
		for (short i = 0; i < gameState.partyCount; i++) {
			entityCallbackFlags[gameState.partyEntities[i]] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
		}
	}
}

/** Enables the movement and script of an entity with a specific NPC ID
 * Params:
 * 	npc = NPC ID to search for
 * Original_Address: $(DOLLAR)C465FB
 */
void enableEntityByNPCID(short npc) {
	short entity = findEntityByNPCID(npc);
	if (entity == -1) {
		return;
	}
	entityCallbackFlags[entity] &= (0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled));
}

/** Enables the movement and script of an entity with a specific sprite
 * Params:
 * 	sprite = Sprite to search for
 * Original_Address: $(DOLLAR)C46616
 */
void enableEntityBySprite(short sprite) {
	short a = findEntityBySprite(sprite);
	if (a == -1) {
		return;
	}
	entityCallbackFlags[a] &= (0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled));
}

/** Enables the movement and script of a party member or the entire party
 * Params:
 * 	character = Party member ID or 0xFF for entire party
 * Original_Address: $(DOLLAR)C46631
 */
void enableEntityByCharacterOrParty(short character) {
	if (character != 0xFF) {
		short entity = findEntityByPartyMemberID(character);
		if (entity == -1) {
			return;
		}
		entityCallbackFlags[entity] &= (0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled));
	} else {
		entityCallbackFlags[partyLeaderEntity] &= 0x3FFF;
		for (short i = 0; i < gameState.partyCount; i++) {
			entityCallbackFlags[gameState.partyEntities[i]] &= (0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled));
		}
	}
}

/** Causes the game camera to follow an entity with the given NPC ID
 *
 * Warning: Undefined behaviour if the NPC is not found!
 * Params:
 * 	npc = NPC ID to search for
 * Original_Address: $(DOLLAR)C46698
 */
void focusCameraOnNPCID(short npc) {
	cameraFocusEntity = findEntityByNPCID(npc);
	gameState.cameraMode = CameraMode.followEntity;
}

/** Causes the game camera to follow an entity with the given sprite
 *
 * Warning: Undefined behaviour if the sprite is not found!
 * Params:
 * 	sprite = Sprite to search for
 * Original_Address: $(DOLLAR)C466A8
 */
void focusCameraOnSprite(short sprite) {
	cameraFocusEntity = findEntityBySprite(sprite);
	gameState.cameraMode = CameraMode.followEntity;
}

/** Restores camera focus to the default mode of following the party leader
 * Original_Address: $(DOLLAR)C466B8
 */
void clearCameraFocus() {
	gameState.leaderHasMoved = 0;
	gameState.cameraMode = CameraMode.normal;
}

/** Spawns a travelling photographer entity and automatically save photo state
 * Params:
 * 	id = Photo ID
 * Original_Address: $(DOLLAR)C466C1
 */
void spawnTravellingPhotographer(short id) {
	playerIntangibilityFlash();
	playerIntangibilityFrames = 0;
	spawningTravellingPhotographerID = cast(short)(id - 1);
	displayText(getTextBlock("MSG_EVT_PHOTOGRAPHER"));
	savePhotoState(id);
}

/** Displays text (ActionScript edition)
 * See_Also: displayText
 * Params:
 * 	script = Text script address
 * Original_Address: $(DOLLAR)C466F0
 */
void displayTextForActionScript(const(ubyte)* script) {
	displayText(script);
}

/** Disables party member entities for the tessie trips
 * Original_Address: $(DOLLAR)C46712
 */
void preparePartyForTessieTrip() {
	entityCallbackFlags[gameState.partyEntities[0]] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
	for (short i = 0; i < gameState.partyCount; i++) {
		entitySpriteMapFlags[gameState.partyEntities[i]] |= SpriteMapFlags.drawDisabled;
	}
}

/** Restores party after preparePartyForTessieTrip, except for the bubble monkey
 * Original_Address: $(DOLLAR)C4675C
 */
void preparePartyForTessieTripEnd() {
	entityCallbackFlags[gameState.partyEntities[0]] &= ~(EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
	for (short i = 1; i < gameState.partyCount; i++) {
		if (gameState.partyMemberIndex[i] == PartyMember.bubbleMonkey) {
			continue;
		}
		entitySpriteMapFlags[gameState.partyEntities[i]] &= ~SpriteMapFlags.drawDisabled;
	}
}

/** Generates a random number between 12 and 43 for delaying falling leaves in winters
 * Original_Address: $(DOLLAR)C467B4
 */
short generateRandomLeafDelay() {
	return cast(short)((rand() & 0x1F) + 12);
}

/** Generates a random number for delaying falling leaves exiting the screen, ensuring a wait at least long enough to reach the bottom of the screen
 * Original_Address: $(DOLLAR)C467C2
 */
short generateRandomLeafDelay2() {
	return cast(short)((0x100 - entityScreenYTable[currentEntitySlot] / 4) + (rand() & 0x1F));
}

/** Unfreezes all Tessie leaf entities
 * Original_Address: $(DOLLAR)C467E6
 */
void unfreezeTessieLeaves() {
	for (short i = 0; i < maxEntities; i++) {
		if (entitySpriteIDs[i] != OverworldSprite.leavesForTessieScene) {
			continue;
		}
		entityCallbackFlags[i] &= ~(EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
	}
}

/** Triggers the talk text of the NPC associated with the currently active entity
 *
 * Does nothing if not an NPC or no text is defined.
 * Original_Address: $(DOLLAR)C4681A
 */
void actionScriptTriggerTalkText() {
	if (entityNPCIDs[currentEntitySlot] == -1) {
		return;
	}
	if (npcConfig[entityNPCIDs[currentEntitySlot]].talkText == null) {
		return;
	}
	queueInteraction(InteractionType.talkToEntity, QueuedInteractionPtr(getTextBlock(npcConfig[entityNPCIDs[currentEntitySlot]].talkText)));
}

/** Display text without a window
 * $(DOLLAR)C46881
 */
void displayTextWindowless(const(ubyte)* script) {
	disableEntityByCharacterOrParty(0xFF);
	queueInteraction(InteractionType.talkToEntity, QueuedInteractionPtr(script));
}

/** ActionScript helper: Get pressed button state
 * Original_Address: $(DOLLAR)C468A9
 */
short actionScriptGetPressedButtons() {
	return padPress[0];
}

/** ActionScript helper: Get the current pad state
 * Original_Address: $(DOLLAR)C468AF
 */
short actionScriptGetPadState() {
	return padState[0];
}

/** Test if the current entity is to the right of a given x coordinate.
 * Returns: 1 if true, 0 otherwise
 * Params:
 * 	x = X coordinate to compare against
 * Original_Address: $(DOLLAR)C468B5
 */
short actionScriptTestEntityRightOfXCoord(short x) {
	// Favorite food naming hangs unless these comparisons are unsigned
	short result = 0;
	if (cast(ushort)x < cast(ushort)entityAbsXTable[currentEntitySlot]) {
		result = 1;
	}
	return result;
}

/** Test if the current entity is below a given y coordinate.
 * Returns: 1 if true, 0 otherwise
 * Params:
 * 	y = Y coordinate to compare against
 * Original_Address: $(DOLLAR)C468DC
 */
short actionScriptTestEntityBelowYCoord(short y) {
	short result = 0;
	if (cast(ushort)y < cast(ushort)entityAbsYTable[currentEntitySlot]) {
		result = 1;
	}
	return result;
}

/** Test if the given y coordinate is below the leader entity
 * Returns: 1 if true, 0 otherwise
 * Params:
 * 	y = Y coordinate to test
 * Original_Address: $(DOLLAR)C46903
 */
short actionScriptTestYCoordBelowLeader(short y) {
	short result = 0;
	if (y > gameState.leaderY.integer) {
		result = 1;
	}
	return result;
}

/** Get the entity's default direction, as defined by the NPC config table
 * Returns: The NPC's default direction, or down if not a predefined NPC
 * Original_Address: $(DOLLAR)C46914
 */
short actionScriptGetDefaultDirection() {
	if (entityNPCIDs[currentEntitySlot] == -1) {
		return Direction.down;
	}
	return npcConfig[entityNPCIDs[currentEntitySlot]].direction;
}

/** Turns the entity to face the given direction, if not already facing that direction
 * Params:
 * 	newDirection = The new direction to face
 * Original_Address: $(DOLLAR)C46957
 */
void actionScriptFaceDirection(short newDirection) {
	if (entityDirections[currentEntitySlot] != newDirection) {
		entityDirections[currentEntitySlot] = newDirection;
		updateEntitySprite(currentEntitySlot);
	}
}

/** Make the first entity matching a given NPC id face the currently active entity
 * Params:
 * 	id = Sprite ID to search for
 * Original_Address: $(DOLLAR)C46984
 */
void makeNPCLookAtActiveEntity(short id) {
	short target = findEntityByNPCID(id);
	if (target == -1) {
		return;
	}
	short newDirection = cast(short)((getScreenAngle(entityAbsXTable[target], entityAbsYTable[target], entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]) + 0x1000) / 0x2000);
	if (entityDirections[target] == newDirection) {
		return;
	}
	entityDirections[target] = newDirection;
	updateEntitySprite(target);
}

/** Make the first entity matching a given sprite id face the currently active entity
 * Params:
 * 	id = Sprite ID to search for
 * Original_Address: $(DOLLAR)C469F1
 */
void makeSpriteLookAtActiveEntity(short id) {
	short target = findEntityBySprite(id);
	if (target == -1) {
		return;
	}
	short newDirection = cast(short)((getScreenAngle(entityAbsXTable[target], entityAbsYTable[target], entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]) + 0x1000) / 0x2000);
	if (entityDirections[target] == newDirection) {
		return;
	}
	entityDirections[target] = newDirection;
	updateEntitySprite(target);
}

/** Table mapping the eight directions to their closest of up+right or down+left, biased towards keeping up/down direction
 * Original_Address: $(DOLLAR)C46A5E
 */
immutable short[8] directionTableURDL = [
	Direction.up: Direction.upRight,
	Direction.upRight: Direction.upRight,
	Direction.right: Direction.upRight,
	Direction.downRight: Direction.downLeft,
	Direction.down: Direction.downLeft,
	Direction.downLeft: Direction.downLeft,
	Direction.left: Direction.downLeft,
	Direction.upLeft: Direction.upRight,
];

/** Converts a full cardinal+ordinal direction to either up-right or down-left, maintaining up/down direction above left/right
 * Returns: Up-right or down-left direction
 * Original_Address: $(DOLLAR)C46A6E
 */
short actionScriptGetURDLDirection() {
	return directionTableURDL[gameState.leaderDirection];
}

/** Table mapping the eight directions to the four cardinals, biased towards keeping left/right direction
 * Original_Address: $(DOLLAR)C46A7A
 */
immutable short[8] directionTable4LR = [
	Direction.up: Direction.up,
	Direction.upRight: Direction.right,
	Direction.right: Direction.right,
	Direction.downRight: Direction.right,
	Direction.down: Direction.down,
	Direction.downLeft: Direction.left,
	Direction.left: Direction.left,
	Direction.upLeft: Direction.left,
];

/** Table mapping the eight directions to the four cardinals, biased towards keeping up/down direction
 * Original_Address: $(DOLLAR)C46A8A
 */
immutable short[8] directionTable4UD = [
	Direction.up: Direction.up,
	Direction.upRight: Direction.up,
	Direction.right: Direction.right,
	Direction.downRight: Direction.down,
	Direction.down: Direction.down,
	Direction.downLeft: Direction.down,
	Direction.left: Direction.left,
	Direction.upLeft: Direction.up,
];

/** Converts a full cardinal+ordinal direction to a cardinal, rounding towards left/right
 * Params:
 * 	direction = One of the eight cardinal or ordinal directions to remap
 * Returns: A cardinal Direction
 * Original_Address: $(DOLLAR)C46A9A
 */
short convert8DirectionTo4PreferLeftRight(short direction) {
	return directionTable4LR[direction];
}

/** Converts a full cardinal+ordinal direction to a cardinal, rounding towards up/down
 * Params:
 * 	direction = One of the eight cardinal or ordinal directions to remap
 * Returns: A cardinal Direction
 * Original_Address: $(DOLLAR)C46AA3
 */
short convert8DirectionTo4PreferUpDown(short direction) {
	return directionTable4UD[direction];
}

/** Gets the angle with respect to the screen from the current entity to its intended destination
 *
 * X, Y coordinates of destination are expected to be in entity vars 6 and 7.
 * Returns: Angle, in 1/65536ths of a circle
 * Original_Address: $(DOLLAR)C46ADB
 */
ushort entityAngleToDestination() {
	return getScreenAngle(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], entityScriptVar6Table[currentEntitySlot], entityScriptVar7Table[currentEntitySlot]);
}

/** Sets the active entity's direction from the given angle
 * Params:
 * 	angle = Angle, in 1/65536ths of a circle
 * Returns: The Direction the entity is now facing
 * Original_Address: $(DOLLAR)C46B0A
 */
short setMovingDirectionFromAngle(short angle) {
	entityMovingDirection[currentEntitySlot] = cast(short)(cast(ushort)(angle + 0x1000) / 0x2000);
	return entityMovingDirection[currentEntitySlot];
}

/** Converts a Direction to an angle, adjusted by ~22.5 degrees
 * Params:
 * 	direction = One of the eight Direction values
 * Returns: Angle, in 1/65536ths of a circle
 * Original_Address: $(DOLLAR)C46B2D
 */
// TODO: Why 22.5 degrees...?
short convertDirectionToAngle(short direction) {
	return cast(short)(direction * 0x2000);
}

/** Returns the opposite of the given direction
 * Params:
 * 	direction = A Direction
 * Returns: Direction opposite of the input
 * Original_Address: $(DOLLAR)C46B37
 */
short getOppositeDirection(short direction) {
	return (direction + 4) & 7;
}

/** A table of the eight directions, rotated 90 degrees clockwise
 * Original_Address: $(DOLLAR)C46B41
 */
immutable short[8] directionTableRotated90 = [
	Direction.up: Direction.right,
	Direction.upRight: Direction.downRight,
	Direction.right: Direction.down,
	Direction.downRight: Direction.downLeft,
	Direction.down: Direction.left,
	Direction.downLeft: Direction.upLeft,
	Direction.left: Direction.upLeft,
	Direction.upLeft: Direction.upRight,
];

/** Gets the nearest direction for the given angle, rotated 90 degrees clockwise
 * Params:
 * 	angle = Angle, in 1/65536ths of a circle
 * Returns: One of the eight Direction values
 * Original_Address: $(DOLLAR)C46B51
 */
short getDirectionRotatedAngle90(ushort angle) {
	return directionTableRotated90[cast(ushort)(angle + 0x1000) / 0x2000];
}

unittest {
	assert(getDirectionRotatedAngle90(0x0000) == Direction.right);
	assert(getDirectionRotatedAngle90(0x8000) == Direction.left);
	assert(getDirectionRotatedAngle90(0xF000) == Direction.right);
}

/** Sets the entity's destination to the party leader's current position
 * Original_Address: $(DOLLAR)C46B65
 */
void actionScriptSetDestinationPartyLeader() {
	entityScriptVar6Table[currentEntitySlot] = gameState.leaderX.integer;
	entityScriptVar7Table[currentEntitySlot] = gameState.leaderY.integer;
}

/** Finds the x,y coordinates of an NPC entity and copies them into vars 6,7 for the active entity.
 *
 * Warning: this does no error checking, so be sure that the NPC is active!
 * Params:
 * 	npc = The NPC ID to look for
 * Original_Address: $(DOLLAR)C46B8D
 */
void findNPCLocationForActiveEntity(short npc) {
	short entity = findEntityByNPCID(npc);
	entityScriptVar6Table[currentEntitySlot] = entityAbsXTable[entity];
	entityScriptVar7Table[currentEntitySlot] = entityAbsYTable[entity];
}

/** Finds the x,y coordinates of an entity with a matching sprite and copies them into vars 6,7 for the active entity.
 *
 * Warning: this does no error checking, so be sure that there is a matching entity!
 * Params:
 * 	sprite = The sprite ID to look for
 * Original_Address: $(DOLLAR)C46BBB
 */
void findSpriteLocationForActiveEntity(short sprite) {
	short entity = findEntityBySprite(sprite);
	entityScriptVar6Table[currentEntitySlot] = entityAbsXTable[entity];
	entityScriptVar7Table[currentEntitySlot] = entityAbsYTable[entity];
}

/** Gets the position of the matching party member and copies it to vars 6,7 of the active entity
 *
 * Warning: this does no error checking, so be sure that there is a matching entity!
 * Params:
 * 	member = Party member ID to look for, or 0xFE for last party member
 * Original_Address: $(DOLLAR)C46BE9
 */
void getPositionOfPartyMember(short member) {
	short selfEntity = currentEntitySlot;
	short foundEntity;
	if (member == 0xFE) {
		foundEntity = gameState.partyEntities[gameState.partyCount - 1];
		if (entityAbsXTable[foundEntity] == 0) {
			foundEntity = gameState.partyEntities[gameState.partyCount - 2];
		}
	} else {
		foundEntity = findEntityByPartyMemberID(member);
	}
	entityScriptVar6Table[selfEntity] = entityAbsXTable[foundEntity];
	entityScriptVar7Table[selfEntity] = entityAbsYTable[foundEntity];
}

/** Copies the active entity's x,y coords to vars 0,1
 * Original_Address: $(DOLLAR)C46C45
 */
void copyXYToVars() {
	entityScriptVar0Table[currentEntitySlot] = entityAbsXTable[currentEntitySlot];
	entityScriptVar1Table[currentEntitySlot] = entityAbsYTable[currentEntitySlot];
}

/** Copies the active entity's x,y coords to vars 0,1, adjusted by supplied offsets
 * Original_Address: $(DOLLAR)C46C5E
 */
void copyAdjustedXYToVars(short y, short x) {
	entityScriptVar0Table[currentEntitySlot] = cast(short)(x + entityAbsXTable[currentEntitySlot]);
	entityScriptVar1Table[currentEntitySlot] = cast(short)(y + entityAbsYTable[currentEntitySlot]);
}

/** Moves the active entity to the X,Y coordinates in vars 6,7
 * Original_Address: $(DOLLAR)C46C87
 */
void copyDestinationToLocation() {
	entityAbsXTable[currentEntitySlot] = entityScriptVar6Table[currentEntitySlot];
	entityAbsYTable[currentEntitySlot] = entityScriptVar7Table[currentEntitySlot];
}

/** Move the active entity to a party member's position
 * Params:
 * 	member = The party member to search for
 * Original_Address: $(DOLLAR)C46C9B
 */
void moveEntityToPartyMember(short member) {
	short entity = findEntityByPartyMemberID(member);
	version(noUndefinedBehaviour) { // if no party member found, an underflow will occur here
		if (entity == -1) {
			return;
		}
	}
	entityAbsXTable[currentEntitySlot] = entityAbsXTable[entity];
	entityAbsYTable[currentEntitySlot] = entityAbsYTable[entity];
}

/** Move the active entity to the position of the first entity with a matching sprite
 * Params:
 * 	sprite = The sprite to search for
 * Original_Address: $(DOLLAR)C46CC7
 */
void moveEntityToSprite(short sprite) {
	short entity = findEntityBySprite(sprite);
	version(noUndefinedBehaviour) { // if no sprite found, an underflow will occur here
		if (entity == -1) {
			return;
		}
	}
	entityAbsXTable[currentEntitySlot] = entityAbsXTable[entity];
	entityAbsYTable[currentEntitySlot] = entityAbsYTable[entity];
}

/** Moves the active entity to the given coordinates, relative to the current BG1 position
 * Original_Address: $(DOLLAR)C46CF5
 */
void moveEntityToLocationBG1Relative(short y, short x) {
	entityAbsXTable[currentEntitySlot] = cast(short)(x + bg1XPosition);
	entityAbsYTable[currentEntitySlot] = cast(short)(y + bg1YPosition);
	entityAbsXFractionTable[currentEntitySlot] = cast(short)0x8000;
	entityAbsYFractionTable[currentEntitySlot] = cast(short)0x8000;
}

/** Moves the active entity to a randomly chosen point at the very top of the screen
 * Original_Address: $(DOLLAR)C46D23
 */
void moveEntityToRandomTopOfScreen() {
	entityAbsXTable[currentEntitySlot] = cast(short)(rand() + bg1XPosition + 112);
	entityAbsYTable[currentEntitySlot] = bg1YPosition;
}

/** Moves the active entity to the preset coordinates for the prepared travelling photographer
 * Original_Address: $(DOLLAR)C46D4B
 */
void moveEntityToPreparedTravellingPhotographerLocation() {
	entityAbsXTable[currentEntitySlot] = cast(short)(photographerConfigTable[spawningTravellingPhotographerID].photographerX * 8);
	entityAbsYTable[currentEntitySlot] = cast(short)(photographerConfigTable[spawningTravellingPhotographerID].photographerY * 8);
	entityAbsYFractionTable[currentEntitySlot] = 0;
	entityAbsXFractionTable[currentEntitySlot] = 0;
}

/** Prepares the starting position and direction for the next created entity based on an existing entity
 * Params:
 * 	type = 0 to use the active entity, 1 to use the first party member
 * Original_Address: $(DOLLAR)C46DAD
 */
void prepareNewEntityAtExistingEntityLocation(short type) {
	short sourceEntity;
	switch (type) {
		case 0:
			sourceEntity = currentEntitySlot;
			break;
		case 1:
			sourceEntity = gameState.firstPartyMemberEntity;
			break;
		default: break;
	}
	entityPreparedXCoordinate = entityAbsXTable[sourceEntity];
	entityPreparedYCoordinate = entityAbsYTable[sourceEntity];
	entityPreparedDirection = entityDirections[sourceEntity];
}

/** Prepares the starting position and direction for the next created entity using a warp preset
 * Params:
 * 	warpPreset = The WarpPreset to use
 * Original_Address: $(DOLLAR)C46DE6
 */
void prepareNewEntityAtWarpPreset(short warpPreset) {
	entityPreparedXCoordinate = cast(ushort)(warpPresetTable[warpPreset].x * 8);
	entityPreparedYCoordinate = cast(ushort)(warpPresetTable[warpPreset].y * 8);
	entityPreparedDirection = cast(ushort)(warpPresetTable[warpPreset].direction - 1);
}

/** Prepares the starting position and direction for the next created entity
 * Params:
 * 	direction = New entity's facing direction
 * 	x = New entity's X coordinate
 * 	y = New entity's Y coordinate
 * Original_Address: $(DOLLAR)C46E37
 */
void prepareNewEntity(short direction, short x, short y) {
	entityPreparedXCoordinate = x;
	entityPreparedYCoordinate = y;
	entityPreparedDirection = direction & 0xFF;
}

/** Signals that the ActionScript interpreter should wait for the text system to yield
 * Original_Address: $(DOLLAR)C46E46
 */
void actionScriptYieldToText() {
	actionScriptState = ActionScriptState.paused;
}

/** Queues a talking-to-entity map interaction with the provided script
 * Params:
 * 	script = Text script to use
 * Original_Address: $(DOLLAR)C46E4F
 */
void queueInteractionTalkTo(const(ubyte)* script) {
	queueInteraction(InteractionType.talkToEntity, QueuedInteractionPtr(script));
}

/** Tests if the party leader is within the boundaries as defined by the active entity's vars 0-3
 * Returns: 1 if within boundaries and not teleporting, 0 otherwise
 * Original_Address: $(DOLLAR)C46E74
 */
short isLeaderWithinBoundaries() {
	if (psiTeleportDestination != 0) {
		return 0;
	}
	short rawXDistance = cast(short)(entityScriptVar0Table[currentEntitySlot] - gameState.leaderX.integer);
	short xDistance = (0 > rawXDistance) ? cast(short)-rawXDistance : rawXDistance;
	if (xDistance < entityScriptVar2Table[currentEntitySlot]) {
		short rawYDistance = cast(short)(entityScriptVar1Table[currentEntitySlot] - gameState.leaderY.integer);
		short yDistance = (0 > rawYDistance) ? cast(short)-rawYDistance : rawYDistance;
		if (yDistance < entityScriptVar3Table[currentEntitySlot]) {
			return 1;
		}
	}
	return 0;
}

/** Tests if the party leader is close to the active entity, with the width and height of the boundary defined using vars 2,3
 * Returns: 1 if within boundaries and not teleporting, 0 otherwise
 * Original_Address: $(DOLLAR)C46EF8
 */
short isLeaderClose() {
	if (psiTeleportDestination != 0) {
		return 0;
	}
	short rawXDistance = cast(short)(entityAbsXTable[currentEntitySlot] - gameState.leaderX.integer);
	short xDistance = (0 > rawXDistance) ? cast(short)-rawXDistance : rawXDistance;
	if (xDistance < entityScriptVar2Table[currentEntitySlot]) {
		short rawYDistance = cast(short)(entityAbsYTable[currentEntitySlot] - gameState.leaderY.integer);
		short yDistance = (0 > rawYDistance) ? cast(short)-rawYDistance : rawYDistance;
		if (yDistance < entityScriptVar3Table[currentEntitySlot]) {
			return 1;
		}
	}
	return 0;
}

/** Moves the active entity towards the specified angle (with respect to the screen) using its movement speed
 * Params:
 * 	angle = Angle, in 1/65536ths of a circle
 * Returns: The original angle
 * Original_Address: $(DOLLAR)C47044
 */
short setMovementFromAngle(short angle) {
	auto vector = angleToVector(angle, entityMovementSpeed[currentEntitySlot]);
	short distance = vector.x;
	if (distance < 0) {
		entityDeltaXTable[currentEntitySlot] = distance >> 8;
		entityDeltaXFractionTable[currentEntitySlot] = cast(short)((distance << 8) | 0xFF);
	} else {
		entityDeltaXTable[currentEntitySlot] = (distance >> 8) & 0xFF;
		entityDeltaXFractionTable[currentEntitySlot] = cast(short)((distance << 8) & 0xFF00);
	}
	distance = vector.y;
	if (distance < 0) {
		entityDeltaYTable[currentEntitySlot] = distance >> 8;
		entityDeltaYFractionTable[currentEntitySlot] = cast(short)((distance << 8) | 0xFF);
	} else {
		entityDeltaYTable[currentEntitySlot] = (distance >> 8) & 0xFF;
		entityDeltaYFractionTable[currentEntitySlot] = cast(short)((distance << 8) & 0xFF00);
	}
	return angle;
}

/** Moves the active entity towards its destination, as defined by vars 6,7
 * Params:
 * 	flip = Face the opposite direction of movement
 * 	dontSetDirection = Don't update the entity's facing direction
 * Original_Address: $(DOLLAR)C47143
 */
short moveActiveEntityTowardsDestination(short flip, short dontSetDirection) {
	short distance = cast(short)(entityScriptVar6Table[currentEntitySlot] - entityAbsXTable[currentEntitySlot]);
	if (0 > distance) {
		distance = cast(short)-cast(int)distance;
	} else {
		distance = distance; //...ok?
	}
	if (distance < entityScriptVar5Table[currentEntitySlot]) {
		distance = cast(short)(entityScriptVar7Table[currentEntitySlot] - entityAbsYTable[currentEntitySlot]);
		if (0 > distance) {
			distance = cast(short)-cast(int)distance;
		} else {
			distance = distance;
		}
		if (distance < entityScriptVar5Table[currentEntitySlot]) {
			return 1;
		}
	}
	short angle = entityAngleToDestination();
	setMovementFromAngle(angle);
	if (dontSetDirection == 0) {
		short direction = setMovingDirectionFromAngle(angle);
		if (flip != 0) {
			direction = getOppositeDirection(direction);
		}
		short currentDirection = entityDirections[currentEntitySlot];
		entityDirections[currentEntitySlot] = direction;
		// update sprite if direction changed
		if (convert8DirectionTo4PreferUpDown(currentDirection) != convert8DirectionTo4PreferUpDown(direction)) {
			updateEntitySprite(currentEntitySlot);
		}
	}
	return 0;
}

/**Sets boundaries for an entity to be used by directionToEntityBoundaries. Uses vars 0-3.
 * Params:
 * 	height = The up/down distance from the center
 * 	width = The left/right distance from the center
 * Original_Address: $(DOLLAR)C47225
 */
void setEntityBoundaries(short height, short width) {
	entityScriptVar0Table[currentEntitySlot] = cast(short)(entityAbsXTable[currentEntitySlot] - width);
	entityScriptVar1Table[currentEntitySlot] = cast(short)(entityAbsXTable[currentEntitySlot] + width);
	entityScriptVar2Table[currentEntitySlot] = cast(short)(entityAbsYTable[currentEntitySlot] - height);
	entityScriptVar3Table[currentEntitySlot] = cast(short)(entityAbsYTable[currentEntitySlot] + height);
}

/** Gets the direction + 1 towards the boundaries set by setEntityBoundaries, 0 if already inside. Uses vars 0-3 as boundaries.
 * Returns: One of the four cardinal Direction values + 1 if outside boundaries, or 0 if within boundaries
 * Original_Address: $(DOLLAR)C47269
 */
short directionToEntityBoundaries() {
	if (entityAbsXTable[currentEntitySlot] < entityScriptVar0Table[currentEntitySlot]) {
		return Direction.right + 1;
	}
	if (entityAbsXTable[currentEntitySlot] > entityScriptVar1Table[currentEntitySlot]) {
		return Direction.left + 1;
	}
	if (entityAbsYTable[currentEntitySlot] < entityScriptVar2Table[currentEntitySlot]) {
		return Direction.down + 1;
	}
	if (entityAbsYTable[currentEntitySlot] > entityScriptVar3Table[currentEntitySlot]) {
		return Direction.up + 1;
	}
	// within boundaries
	return 0;
}

/** Performs a frame of spiral movement, using active entity var 0 to store the current angle
 * Params:
 * 	flip = Whether or not to invert the angle when determining new direction to face
 * Original_Address: $(DOLLAR)C472A8
 */
void entitySpiralMovement(short flip) {
	setMovementFromAngle(entityScriptVar0Table[currentEntitySlot]);
	short direction = getDirectionRotatedAngle90(entityScriptVar0Table[currentEntitySlot]);
	if (flip != 0) {
		direction = getOppositeDirection(direction);
	}
	short currentDirection = entityDirections[currentEntitySlot];
	entityDirections[currentEntitySlot] = direction;
	// update sprite if direction changed
	if (convert8DirectionTo4PreferUpDown(currentDirection) != convert8DirectionTo4PreferUpDown(direction)) {
		updateEntitySprite(currentEntitySlot);
	}
}
unittest {
	initializeForTesting();
	enum testData = [
		[0x0000, Direction.right, Direction.right],
		[0x1000, Direction.right, Direction.downRight],
		[0x2000, Direction.downRight, Direction.downRight],
		[0x3000, Direction.downRight, Direction.down],
		[0x4000, Direction.down, Direction.down],
		[0x5000, Direction.down, Direction.downLeft],
		[0x6000, Direction.downLeft, Direction.downLeft],
		[0x7000, Direction.downLeft, Direction.left],
		[0x8000, Direction.left, Direction.left],
		[0x9000, Direction.left, Direction.upLeft],
		[0xA000, Direction.upLeft, Direction.upLeft],
		[0xB000, Direction.upLeft, Direction.upLeft],
		[0xC000, Direction.upLeft, Direction.upLeft],
		[0xD000, Direction.upLeft, Direction.upRight],
		[0xE000, Direction.upRight, Direction.upRight],
		[0xF000, Direction.upRight, Direction.right],
	];
	static OverworldSpriteGraphics[8] dummy;
	auto oldSprites = sprites;
	sprites.length = 8;
	scope(exit) {
		sprites = oldSprites;
		entityGraphicsPointers[currentEntitySlot] = null;
	}
	foreach (testCase; testData) {
		currentEntitySlot = 0;
		entityGraphicsPointers[currentEntitySlot] = &dummy[0];
		entityScriptVar0Table[currentEntitySlot] = cast(short)testCase[0];
		entityDirections[currentEntitySlot] = cast(short)testCase[1];
		entitySpiralMovement(0);
		assert(entityDirections[currentEntitySlot] == cast(short)testCase[2]);
	}
}

/** Halves the velocity for the active entity's movement along the Y axis this frame
 * Original_Address: $(DOLLAR)C4730E
 */
void halveYSpeed() {
	entityDeltaYTable[currentEntitySlot] /= 2;
}

/** Actionscript helper: Get a count of active party members
 * Returns: the number of party members
 * Original_Address: $(DOLLAR)C47333
 */
short getPartyCount() {
	return gameState.partyCount;
}

/** Actionscript helper: Reloads event flag-controlled map block changes for the current area
 * Original_Address: $(DOLLAR)C4733C
 */
void reloadMapBlockEventChanges() {
	loadMapBlockEventChanges(tilesetGraphicsMapping[loadedMapTileCombo]);
}

/** Actionscript helper: Rerenders a row of tiles on the screen
 * Params:
 * 	y = Absolute y coordinate of the map row to rerender
 * Returns: y coordinate, unchanged
 * Original_Address: $(DOLLAR)C4734C
 */
short actionScriptRerenderRow(short y) {
	unknownC01A63(bg1XPosition / 8, y);
	return y;
}

/** ActionScript helper: Reloads the map
 * Original_Address: $(DOLLAR)C47369
 */
void actionScriptReloadMapCurrentLocation() {
	reloadMapCurrentLocation();
}

/** Fully loads an animated background and blanks the screen, ready to load more graphics or fade in immediately.
 * Params:
 * 	bg1 = Background layer to use for BG1
 * 	bg2 = Background layer to use for BG2
 * Original_Address: $(DOLLAR)C47370
 */
void loadBackgroundAnimation(short bg1, short bg2) {
	prepareForImmediateDMA();
	setBGMODE(BGMode.mode1 | BG3Priority);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0x0000);
	setBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x1000);
	loadBattleBG(bg1, bg2, 4);
	setForceBlank();
}

/** Clamps a colour channel to the legal 0-31 range.
 * Params:
 * 	colour = A single colour channel value
 * Original_Address: $(DOLLAR)C473B2
 */
ushort colourClamp(short colour) {
	if (colour < 0) {
		return 0;
	}
	if (colour >= 31) {
		return 31;
	}
	return colour & 0x1F;
}

/** Performs a palette fade, using the backup palette + step
 *
 * Because the fade doesn't use the target colour palette in its calculations, this is lossless and any arbitrary series of steps is supported
 * Params:
 * 	palette = Palette ID to fade - 2
 * 	step = Value to add to each colour channel
 * Original_Address: $(DOLLAR)C473D0
 */
void doPaletteFadeStep(short palette, short step) {
	ushort* sourceColour = &mapPaletteBackup[palette][0];
	version(bugfix) {
		if (palette >= palettes.length - 2) {
			return;
		}
	}
	ushort* destination = &palettes[palette + 2][0];
	for (short i = 0; i < 16; i++) {
		short red = cast(ushort)((sourceColour[0] & 0x1F) + step);
		short green = cast(ushort)(((sourceColour[0] >> 5) & 0x1F) + step);
		short blue = cast(ushort)(((sourceColour[0] >> 10) & 0x1F) + step);
		ushort finalRed = colourClamp(red);
		ushort finalGreen = colourClamp(green);
		ushort finalBlue = colourClamp(blue);
		sourceColour++;
		(destination++)[0] = cast(ushort)((finalGreen << 5) | (finalBlue << 10) | finalRed);
	}
}

/** Performs palette fades for all palettes except text palettes
 *
 * See_Also: doPaletteFadeStep
 * Params:
 * 	step = Value to add to each colour channel
 * Original_Address: $(DOLLAR)C4746B
 */
void doAllPalettesFadeStep(short step) {
	for (short i = 0; i < 16; i++) {
		doPaletteFadeStep(i, step);
	}
	paletteUploadMode = PaletteUpload.full;
}

/** ActionScript helper: Performs palette fades for all palettes
 * Original_Address: $(DOLLAR)C47499
 */
void actionScriptDoAllPalettesFadeStep() {
	doAllPalettesFadeStep(entityScriptVar0Table[currentEntitySlot]);
}

/**
 * Original_Address: $(DOLLAR)C474A8
 */
// calls to this seem to specify an argument, but the registers are clobbered immediately
void unknownC474A8() {
	enum commonCGADSUB = CGADSUBFlags.ColourMathMainIsBG1 | CGADSUBFlags.ColourMathMainIsBG1 | CGADSUBFlags.ColourMathMainIsOBJ47 | CGADSUBFlags.ColourMathMainIsBackdrop;
	setWindowBrightness(
		(0 <= entityScriptVar0Table[currentEntitySlot]) ? commonCGADSUB : (commonCGADSUB | CGADSUBFlags.ColourMathAddsub),
		cast(ubyte)((0 <= entityScriptVar0Table[currentEntitySlot]) ? entityScriptVar0Table[currentEntitySlot] : cast(short)-entityScriptVar0Table[currentEntitySlot])
	);
}

/** Precalculated radii for the rounded bottom part of the spotlight effect
 * Original_Address: $(DOLLAR)C474F6
 */
immutable ubyte[11] spotlightTaperRadii = [ 16, 16, 15, 15, 14, 13, 12, 11, 9, 6, 3 ];

/** Sets up the HDMA table for spotlight windows
 * Params:
 * 	hdmaTable = Buffer to start writing the HDMA table contents into
 * Original_Address: $(DOLLAR)C47501
 */
void initializeSpotlightWindowHDMATable(ubyte* hdmaTable) {
	// make sure the entity is onscreen, at least in the Y dimension
	if (entityAbsYTable[currentEntitySlot] - bg1YPosition + 4 >= 0) {
		// We want the spotlight starting at line 0 and continuing to roughly the position of the current active entity
		(hdmaTable++)[0] = cast(ubyte)(entityAbsYTable[currentEntitySlot] - bg1YPosition + 5);
		// fixed radius of 16 pixels
		short leftSide = cast(short)(entityAbsXTable[currentEntitySlot] - 16 - bg1XPosition);
		short rightSide = cast(short)(entityAbsXTable[currentEntitySlot] + 16 - bg1XPosition);
		// clamp left and right sides of spotlight to screen boundaries
		if (leftSide < 256) {
			(hdmaTable++)[0] = cast(ubyte)leftSide;
			if (rightSide < 256) {
				(hdmaTable++)[0] = cast(ubyte)rightSide;
			} else {
				(hdmaTable++)[0] = 255;
			}
		} else {
			if (rightSide < 256) {
				(hdmaTable++)[0] = 0;
				(hdmaTable++)[0] = cast(ubyte)rightSide;
			} else {
				// completely offscreen. putting the right side to the left of the left side disables the spotlight
				(hdmaTable++)[0] = 128;
				(hdmaTable++)[0] = 127;
			}
		}
	}
	// add a tapering round portion to the spotlight so it isn't just a boring yellow rectangle
	short xBase = cast(short)(entityAbsXTable[currentEntitySlot] - bg1XPosition);
	// skip if this part is offscreen
	if (entityAbsYTable[currentEntitySlot] - bg1YPosition + 15 >= 0) {
		// calculate the height of this portion
		short taperHeight = (entityAbsYTable[currentEntitySlot] - bg1YPosition + 15 < spotlightTaperRadii.length - 1) ? cast(short)(entityAbsYTable[currentEntitySlot] - bg1YPosition + 15) : spotlightTaperRadii.length - 1;
		// use the table to determine radius
		const(ubyte)* spotlightTaperRadius = &spotlightTaperRadii[spotlightTaperRadii.length - 1 - taperHeight];
		for (short i = 0; i < taperHeight + 1; i++) {
			(hdmaTable++)[0] = 1;
			short leftSide = cast(short)(xBase - spotlightTaperRadius[0]);
			short rightSide = cast(short)(xBase + spotlightTaperRadius[0] - 1);
			spotlightTaperRadius++;
			// as before, clamp both sides to the screen boundaries
			if (leftSide < 256) {
				(hdmaTable++)[0] = cast(ubyte)leftSide;
				if (rightSide < 256) {
					(hdmaTable++)[0] = cast(ubyte)rightSide;
				} else {
					(hdmaTable++)[0] = 255;
				}
			} else {
				if (rightSide < 256) {
					(hdmaTable++)[0] = 0;
					(hdmaTable++)[0] = cast(ubyte)rightSide;
				} else {
					(hdmaTable++)[0] = 128;
					(hdmaTable++)[0] = 127;
				}
			}
		}
	}
	// disable spotlight for rest of screen with a negative width
	(hdmaTable++)[0] = 1;
	(hdmaTable++)[0] = 128;
	(hdmaTable++)[0] = 127;
	// terminate table
	(hdmaTable++)[0] = 0;
}

/** ActionScript tick callback for entities with spotlight 1 focused on them
 * Original_Address: $(DOLLAR)C476A5
 */
void actionScriptEnableSpotlight1() {
	short bufStart;
	if ((entityScriptVar0Table[currentEntitySlot] & 1) != 0) {
		bufStart = 0;
	} else {
		bufStart = 0x2FE;
	}
	initializeSpotlightWindowHDMATable(&buffer[bufStart]);
	enableSpotlightHDMA1(&buffer[bufStart]);
	entityScriptVar0Table[currentEntitySlot]++;
}

/** ActionScript tick callback for entities with spotlight 2 focused on them
 * Original_Address: $(DOLLAR)C47705
 */
void actionScriptEnableSpotlight2() {
	short bufStart;
	if ((entityScriptVar0Table[currentEntitySlot] & 1) != 0) {
		bufStart = 0x5FC;
	} else {
		bufStart = 0x8FA;
	}
	initializeSpotlightWindowHDMATable(&buffer[bufStart]);
	enableSpotlightHDMA2(&buffer[bufStart]);
	entityScriptVar0Table[currentEntitySlot]++;
}

/** Enables the HDMA used for stage lighting during the Runaway Five concerts. Lightens the screen until it reaches the y coordinate, at which point it lightens only the portion between xStart and xEnd, decreasing width by two pixels for 16 rows
 * Params:
 * 	xStart = The x coordinate of the top left edge of the portion of the stage jutting downward
 * 	y = The y coordinate of the stage portion jutting outward
 * 	xEnd = The x coordinate of the top right edge of the portion of the stage jutting downward
 * Original_Address: $(DOLLAR)C47765
 */
void enableStageHDMA(short xStart, short y, short xEnd) {
	ubyte* dest = &buffer[0xBF8];
	short yStart = cast(short)(y - bg1YPosition);
	// HDMA is limited to 127 line batches, so handle the case where the Y coordinate is over halfway down the screen
	if (yStart > 0x7F) {
		// is this the result of some kinda optimization?
		dest[0] = 0x7F;
		buffer[0xBF9] = 0;
		buffer[0xBFA] = 0xFF;
		dest = &buffer[0xBFB];
		yStart -= 0x7F;
	}
	(dest++)[0] = cast(ubyte)yStart;
	(dest++)[0] = 0;
	(dest++)[0] = 0xFF;
	short left = cast(short)(xStart - bg1XPosition);
	short right = cast(short)(xEnd - bg1XPosition);
	for (short i = 0; i < 16; i++) {
		(dest++)[0] = 1;
		(dest++)[0] = cast(ubyte)(left++);
		(dest++)[0] = cast(ubyte)(right--);
	}
	(dest++)[0] = 1;
	(dest++)[0] = 0x80;
	(dest++)[0] = 0x7F;
	(dest++)[0] = 0;
	enableBrightnessHDMA(&buffer[0xBF8]);
}

/** Clamps a value between 0 and an upper limit
 * Params:
 * 	value = Value for clamping
 * 	upper = The upper limit for the value
 * Returns: Value between 0..upper
 * Original_Address: $(DOLLAR)C47866
 */
short clamp0Upper(short value, short upper) {
	short result = value;
	if (0 > value) {
		result = 0;
	}
	if (result > upper) {
		result = upper;
	}
	return result;
}

/** Sets up a single window HDMA table entry with the specified dimensions
 * Params:
 * 	numLines = Height of the rectangle
 * 	winL = Left edge of the rectangle
 * 	winR = Right edge of the rectangle
 * 	hdmaTable = Preallocated buffer for HDMA, at least 3 bytes long for windows with a height below 128, 6 bytes for larger ones
 * Returns: The beginning of the unused buffer space
 * Original_Address: $(DOLLAR)C4789E
 */
ubyte* rectangleWindowAddHdmaEntry(short numLines, short winL, short winR, ubyte* hdmaTable) {
	if (numLines == 0) {
		return hdmaTable;
	}
	if (numLines < 0x80) {
		(hdmaTable++)[0] = cast(ubyte)numLines;
		(hdmaTable++)[0] = cast(ubyte)winL;
		(hdmaTable++)[0] = cast(ubyte)winR;
	} else {
		(hdmaTable++)[0] = 0x7F;
		(hdmaTable++)[0] = cast(ubyte)winL;
		(hdmaTable++)[0] = cast(ubyte)winR;
		(hdmaTable++)[0] = cast(ubyte)(numLines - 0x7F);
		(hdmaTable++)[0] = cast(ubyte)winL;
		(hdmaTable++)[0] = cast(ubyte)winR;
	}
	return hdmaTable;
}

/** Configures HDMA + window to create a rectangular window on screen. Only configures positioning and dimensions, no other parameters
 * Params:
 * 	xmin = Left X coordinate
 * 	ymin = Upper Y coordinate
 * 	xmax = Right X coordinate
 * 	ymax = Lower Y coordinate
 * Original_Address: $(DOLLAR)C47930
 */
void rectangleWindowConfigure(short xmin, short ymin, short xmax, short ymax) {
	short bufferOffset;
	if ((rectangleWindowBufferIndex & 1) != 0) {
		bufferOffset = 0;
	} else {
		bufferOffset = 0x2FE;
	}
	// keep dimensions within (0,0) .. (224, 256)
	short yminClamp = clamp0Upper(ymin, 224);
	short ymaxClamp = clamp0Upper(ymax, 224);
	short xminClamp = clamp0Upper(xmin, 256);
	short xmaxClamp = clamp0Upper(xmax, 256);
	ubyte* buffer = &buffer[bufferOffset];
	// Configure a region above the rectangle with no windowing (WH0 > WH1 means no window)
	buffer = rectangleWindowAddHdmaEntry(yminClamp, 0x80, 0x7F, buffer);
	// Configure the region where we have our rectangle
	buffer = rectangleWindowAddHdmaEntry(cast(short)(ymaxClamp - yminClamp), xminClamp, xmaxClamp, buffer);
	// Configure a region below the rectangle with no windowing (WH0 > WH1 means no window)
	buffer = rectangleWindowAddHdmaEntry(cast(short)(224 - ymaxClamp - 1), 0x80, 0x7F, buffer);
	// Terminate the table
	buffer[0] = 0;
	rectangleWindowEnableHDMA(&buffer[bufferOffset]);
	rectangleWindowBufferIndex++;
}

/** Configures the beam of light that appears when buzz buzz shows up
 *
 * The beam is centered on the active entity's current position, with size depending on entity's var 0.
 * Original_Address: $(DOLLAR)C479E9
 */
void bunbuunBeamConfigure() {
	short ymin = void; // whoops?
	version(noUndefinedBehaviour) {
		ymin = 0;
	}
	short objX = cast(short)(entityAbsXTable[currentEntitySlot] - bg1XPosition);
	short objY = cast(short)(entityAbsYTable[currentEntitySlot] - bg1YPosition);
	short beamSize = entityScriptVar0Table[currentEntitySlot];
	rectangleWindowConfigure(cast(short)(objX - beamSize), ymin, cast(short)(objX + beamSize), cast(short)(objY + beamSize));
}

/** Configures HDMA parameters for elevators
 *
 * Yes, the typo is intentional. The text scripts refer to them as elevaters.
 * Original_Address: $(DOLLAR)C47A27
 */
void elevaterConfigure() {
	bg1YPosition = cast(short)(entityAbsYTable[currentEntitySlot] - 112);
	short x10 = cast(short)(entityAbsYTable[gameState.firstPartyMemberEntity] - (entityAbsYTable[currentEntitySlot] - 112));
	rectangleWindowConfigure(16, cast(short)(x10 - 96), 240, cast(short)(x10 + 96));
}

/** Inverts the active entity's Y position relative to the coordinates stored in (var 6, var 7)
 * Original_Address: $(DOLLAR)C47A6B
 */
void actionScriptInvertYPositionRelative() {
	entityAbsYTable[currentEntitySlot] = cast(short)(entityScriptVar7Table[currentEntitySlot] - (entityAbsYTable[currentEntitySlot] - entityScriptVar7Table[currentEntitySlot]));
}

/** Loads a fullscreen animation based on the active entity's variables
 *
 * Entity VAR0 = Animation ID
 * Original_Address: $(DOLLAR)C47A9E
 */
void loadActionScriptAnimation() {
	decomp(&animationGraphics[animationSequences[entityScriptVar0Table[currentEntitySlot]].id][0], &buffer[0]);
	copyToVRAMChunked(VRAMCopyMode.simpleCopyToVRAM, animationSequences[entityScriptVar0Table[currentEntitySlot]].tileSize, 0x6000, &buffer[0]);
	memcpy(&palettes[0][0], &buffer[animationSequences[entityScriptVar0Table[currentEntitySlot]].tileSize], ushort[4].sizeof);
	paletteUploadMode = PaletteUpload.full;
	bg3YPosition = 0xFFFF;
}

/** Updates an animation frame according to the active entity's variables
 *
 * Entity VAR0 = Animation ID
 * Entity VAR1 = Frame index
 * Returns: Number of frames to wait for the next frame update or 0 if no frames left
 * Original_Address: $(DOLLAR)C47B77
 */
short updateActionScriptAnimationFrame() {
	// set BG3 Y position to -1. A minor adjustment to account for overscan, perhaps?
	bg3YPosition = 0xFFFF;
	// The animation is assumed to have been decompressed into the buffer already, in the order of tiles + 2bpp palette + N 32x28 tilemaps
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x700, 0x7C00, &buffer[animationSequences[entityScriptVar0Table[currentEntitySlot]].tileSize + ushort[4].sizeof + entityScriptVar1Table[currentEntitySlot] * 0x700]);
	// last frame played? return 0 if so
	if (entityScriptVar1Table[currentEntitySlot] + 1 == animationSequences[entityScriptVar0Table[currentEntitySlot]].frames) {
		return 0;
	}
	return animationSequences[entityScriptVar0Table[currentEntitySlot]].frameDelay;
}

/** Prepares text layer graphics for BG3
 *
 * Includes window tiles, special text graphics, and names for the HP/PP windows
 * Original_Address: $(DOLLAR)C47C3F
 */
//definitely need to check this one over
void prepareWindowGraphics() {
	decomp(&textWindowTiles[0], &buffer[0]);
	memcpy(&buffer[0x2000], &buffer[0x1000], 0x2A00);
	memset(&buffer[0x3200], 0, 0x600);
	if (gameState.textFlavour == 0) {
		gameState.textFlavour = 1;
	}
	if (textWindowProperties[gameState.textFlavour - 1].graphicsSet == 8) {
		decomp(&flavouredTextTiles[0], &buffer[0x100]);
	}
	ushort* nameDest = cast(ushort*)&buffer[0x2A00];
	for (short i = 0; i < 4; i++) {
		vwfTile = 0;
		vwfX = 0;
		memset(&vwfBuffer[0][0], 0xFF, 0x340);
		textRenderState.upperTileID = 0;
		textRenderState.pixelsRendered = 0;
		ubyte* nameCharacter = &partyCharacters[i].name[0];
		vwfX = 2;
		for (short j = 0; nameCharacter[0] != 0; j++) {
			renderText(6, fontConfigTable[Font.battle].height, &fontGraphics[fontConfigTable[Font.battle].graphicsID][fontConfigTable[Font.battle].bytesPerCharacter * ((nameCharacter[0] - 0x50) & 0x7F)]);
			nameCharacter++;
		}
		for (short j = 0; j < 4; j++) {
			memcpy(&buffer[0x2A00 + j * 16 + i * 64], &vwfBuffer[j][0], 0x10);
			memcpy(&buffer[0x2A00 + j * 16 + i * 64 + 0x100], &vwfBuffer[j][16], 0x10);
		}
	}
	// copy to buffer with checker background
	for (short i = 0; i < 0x20; i++) {
		ubyte* checkerSrc = &buffer[0x70];
		for (short j = 0; j < 8; j++) {
			nameDest[0] = (nameDest[0] & 0xFF00) | ((nameDest[0] >> 8) ^ 0xFF) | checkerSrc[0];
			nameDest++;
			checkerSrc += 2;
		}
	}
	ushort* statusDest = cast(ushort*)&buffer[0x2C00];

	// make copies of status icons with checkered backgrounds
	for (const(ushort)* statusIcon = &statusIcons[0][0]; statusIcon[0] != 0; statusIcon++) {
		if (statusIcon[0] == 0x20) {
			continue;
		}
		ushort* statusIconTileSrc = cast(ushort*)(&buffer[((statusIcon[0] & 0xFFF0) + statusIcon[0]) * 16]);
		ubyte* checkerSrc = &buffer[0x70];
		for (short i = 0; i < 8; i++) {
			statusDest[0] = (statusIconTileSrc[0] & 0xFF00) | ((statusIconTileSrc[0] >> 8) ^ 0xFF) | checkerSrc[0];
			statusDest[0x80] = (statusIconTileSrc[0x80] & 0xFF00) | ((statusIconTileSrc[0x80] >> 8) ^ 0xFF) | checkerSrc[0x80];
			statusDest++;
			statusIconTileSrc++;
			checkerSrc += 2;
		}
	}
}

unittest {
	if (romDataLoaded) {
		// test name rendering
		partyCharacters[0].name = ebString!5("Hello");
		partyCharacters[1].name = ebString!5("Earth");
		partyCharacters[2].name = ebString!5("bound");
		partyCharacters[3].name = ebString!5("World");
		prepareWindowGraphics();
		const correct = cast(immutable(ubyte)[])import("examplenamerenders.bin");
		assert(buffer[0x2A00 .. 0x2C00] == correct);
	}
}

/** Picks a text palette and uploads it to CGRAM
 *
 * Uses the player's selected text flavour palette, unless the last party member is either unconscious or diamondized,
 * when it'll use the special death palette instead.
 * Original_Address: $(DOLLAR)C47F87
 */
void loadTextPalette() {
	ubyte affliction = 0;
	// get the last party member's group 0 affliction. thanks to sorting, if any party members are unconscious or diamondized, they'll be at the back
	version(bugfix) {
		// Normally the game just indexes the playerControlledPartyMembers array out of bounds - not the best idea.
		if (gameState.playerControlledPartyMemberCount > 0) {
			if (chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]] != null){
				affliction = chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0];
			}
		}
	} else {
		affliction = chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0];
	}
	switch(affliction) {
		case Status0.unconscious:
		case Status0.diamondized:
			if (disabledTransitions != 0) {
				goto default;
			}
			memcpy(palettes.ptr, textWindowFlavourPalettes[5].ptr, 0x40);
			break;
		default:
			// weird, but ok
			memcpy(palettes.ptr, (cast(void*)textWindowFlavourPalettes.ptr) + textWindowProperties[gameState.textFlavour - 1].offset, 0x40);
			break;
	}
	// colour 0 is the background - make sure it's always black
	palettes[0][0] = 0;
	// upload all BG palettes
	preparePaletteUpload(PaletteUpload.bgOnly);
}

/** Restores PPU data for overworld map rendering after special scenes
 * Original_Address: $(DOLLAR)C4800B
 */
void restoreMapRendering() {
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	unknownC2038B();
	prepareWindowGraphics();
	loadWindowGraphics(WindowGraphicsToLoad.all2);
	loadTextPalette();
	paletteUploadMode = PaletteUpload.full;
}

/** Text for the Lumine Hall scene
 * Original_Address: $(DOLLAR)C48037
 */
immutable ubyte[215] lumineHallText = ebString!215("I'm ....  It's been a long road getting here...  Soon, I'll be...  Soon, I'll be...  Soon, I'll be...  What will happen to us?  W...what's happening?  My thoughts are being written out on the wall...  or are they?  ");

/** Converts rendered text to a tilemap suitable for uploading to the overworld tilemap
 * Params:
 * 	start = Tile offset to start rendering from
 * 	dest = The destination tile buffer
 * Returns: The next position in the destination buffer to be written to
 * Original_Address: $(DOLLAR)C4810E
 */
ushort* convertTextToTilemap(short start, ushort* dest) {
	ubyte* src = &buffer[0];
	src += (((start & 0xFFF0) * 2) + (start & 0xF)) * 16;
	// The text is rendered in 2bpp, but we only want 1bpp in a 2x2 square.
	// First, merge the planes of two rows by XORing them together.
	// Then, shift and mask off the row so only two pixels remain
	// Then, concatenate the four pixels into a 4 bit value like 0000DCBA, with each bit corresponding to a pixel in a 2x2 grid like so:
	// [B A]
	// [D C]
	// That will be your base tile. Do this for an entire 8x16 text tile pair.
	for (ushort i = 6; i < 7; i -= 2) {
		for (short j = 0; j < 4; j++) {
			ubyte plane0 = src[0];
			ubyte plane1 = src[1];
			ushort rowA = (plane0 ^ plane1) & plane0;
			plane0 = src[2];
			plane1 = src[3];
			ushort rowB = (plane0 ^ plane1) & plane0;
			rowB = cast(ushort)(((rowB >> i) & 3) << 2);
			(dest++)[0] = cast(ushort)(((rowA >> i) & 3) + rowB);
			src += 4;
		}
		// repeat, but on the next row of tiles
		src += 0xF0;
		for (short j = 0; j < 4; j++) {
			ubyte plane0 = src[0];
			ubyte plane1 = src[1];
			ushort rowA = (plane0 ^ plane1) & plane0;
			plane0 = src[2];
			plane1 = src[3];
			ushort rowB = (plane0 ^ plane1) & plane0;
			rowB = cast(ushort)(((rowB >> i) & 3) << 2);
			(dest++)[0] = cast(ushort)(((rowA >> i) & 3) + rowB);
			src += 4;
		}
		// move to the position of the previous row's tile + 1
		src -= 0x110;
	}
	return dest;
}

/** Renders a full text character into the VWF buffer
 * Params:
 * 	font = Font to use
 * 	character = Character to render
 * Original_Address: $(DOLLAR)C4827B
 */
void renderWholeCharacter(short font, short character) {
	short characterOffset = (character - ebChar(' ')) & 0x7F;
	short bytesPerCharacter = fontConfigTable[font].bytesPerCharacter;
	const(ubyte)* charTiles = &fontGraphics[fontConfigTable[font].graphicsID][characterOffset * bytesPerCharacter];
	short fontWidth = fontConfigTable[font].height;
	short charWidth = fontData[fontConfigTable[font].dataID][characterOffset];
	charWidth += characterPadding;
	// multiple tiles need multiple render calls
	while (charWidth > 8) {
		renderText(8, fontWidth, charTiles);
		charWidth -= 8;
		charTiles += fontWidth;
	}
	renderText(charWidth, fontWidth, charTiles);
}

/** Renders text for the Lumine Hole and Lumine Hall wall
 * Params:
 * 	font = Font ID to render text with
 * Returns: The number of tiles rendered
 * Original_Address: $(DOLLAR)C4838A
 */
short renderLumineHallText(short font) {
	short charactersRendered = 0;
	short charactersToRender = 0;
	short bufferPosition = 0;
	vwfTile = 0;
	vwfX = 0;
	memset(&vwfBuffer[0][0], 0xFF, 0x400);
	// render first ten characters + name
	short characterNameLength = cast(short)strlen(cast(char*)&partyCharacters[0].name[0]);
	if (characterNameLength > 5) {
		characterNameLength = 5;
	}
	ubyte* name = &partyCharacters[0].name[0];
	// render first four characters (pre-name)
	for (short i = 0; 4 > i; i++) {
		renderWholeCharacter(font, lumineHallText[i]);
	}
	// render name characters
	for (short i = 0; characterNameLength > i; i++) {
		renderWholeCharacter(font, (name++)[0]);
	}
	// render first six post-name characters (why?)
	for (short i = 0; 6 > i; i++) {
		renderWholeCharacter(font, lumineHallText[4 + i]);
	}
	short pixelsRendered = cast(short)(vwfX + charactersToRender);
	characterNameLength = 0;
	short vwfBufferPosition = 0;
	for (short i = 0; i < vwfX / 8; i++) {
		memcpy(&buffer[bufferPosition], &(cast(ubyte*)&vwfBuffer[0][0])[vwfBufferPosition], 16);
		vwfBufferPosition += 16;
		memcpy(&buffer[bufferPosition + 0x100], &(cast(ubyte*)&vwfBuffer[0][0])[vwfBufferPosition], 16);
		vwfBufferPosition += 16;
		bufferPosition += 16;
	}
	// render the rest of the text
	charactersToRender = lumineHallText.length - 10;
	memcpy(&vwfBuffer[0][0], &vwfBuffer[vwfX / 8][0], 0x20);
	vwfTile = 0;
	vwfX %= 8;
	for (short i = 0; charactersToRender > i; i++) {
		if (charactersRendered > 16) {
			charactersRendered = 0;
			pixelsRendered += vwfX;
			vwfBufferPosition = 0;
			 for (short j = 0; j < vwfX / 8; j++) {
				memcpy(&buffer[bufferPosition], &(cast(ubyte*)&vwfBuffer[0][0])[vwfBufferPosition], 16);
				vwfBufferPosition += 16;
				memcpy(&buffer[bufferPosition + 0x100], &(cast(ubyte*)&vwfBuffer[0][0])[vwfBufferPosition], 16);
				vwfBufferPosition += 16;
				bufferPosition += 16;
				if ((bufferPosition % 0x100) == 0) {
					bufferPosition += 0x100;
				}
			 }
			 if ((vwfX % 8) != 0) {
				memcpy(&vwfBuffer[0][0], &vwfBuffer[vwfX / 8][0], 0x20);
				memset(&vwfBuffer[1][0], 0xFF, 0x1E0);
				vwfTile = 0;
				vwfX %= 8;
			 } else {
				vwfX = 0;
				vwfTile = 0;
				memset(&vwfBuffer[0][0], 0xFF, 0x200);
			 }
		}
		renderWholeCharacter(font, lumineHallText[10 + i]);
		charactersRendered++;
	}
	short result = cast(short)(vwfX + pixelsRendered);
	vwfBufferPosition = 0;
	for (short i = 0; i < (vwfX / 8) + 16; i++) {
		memcpy(&buffer[bufferPosition], &(cast(ubyte*)&vwfBuffer[0][0])[vwfBufferPosition], 16);
		vwfBufferPosition += 16;
		memcpy(&buffer[bufferPosition + 0x100], &(cast(ubyte*)&vwfBuffer[0][0])[vwfBufferPosition], 16);
		vwfBufferPosition += 16;
		bufferPosition += 16;
		if ((bufferPosition % 0x100) == 0) {
			bufferPosition += 0x100;
		}
	}
	return cast(short)((result / 8) * 4);
}

unittest {
	if (romDataLoaded) {
		partyCharacters[0].name = ebString!5("Ness");
		characterPadding = 1;
		assert(renderLumineHallText(Font.main) == 456);
		assert(buffer[0 .. 0x1000] == import("exampleluminehallrender.bin"));
	}
}

/** Prepares the rendered text used by the Lumine Hall scene
 *
 * Uses the text rendering system to render the entire text in one go, then converts it to a tilemap suitable for writing to the overworld tilemap
 * Original_Address: $(DOLLAR)C4880C
 */
void prepareLumineHallTextRender() {
	enum screenTileWidth = 30;
	short textTileCount = renderLumineHallText(Font.main);
	// clear first part of buffer
	ushort* dest = cast(ushort*)&buffer[0x4000];
	for (short i = 0; i < 0x1D; i++) {
		for (short j = 0; j < 8; j++) {
			(dest++)[0] = 0;
		}
	}
	// reserve enough tiles for a blank screen at the end
	short tileCount = cast(short)(textTileCount + 30);
	short offset = 0;
	short tileOffset;
	// convert tiles before name
	for (tileOffset = 0; tileOffset < 4; tileOffset++) {
		dest = convertTextToTilemap(tileOffset, dest);
		offset++;
	}
	// convert name tiles
	short nameLength = cast(short)strlen(cast(char*)&partyCharacters[0].name[0]);
	if (nameLength == 6) {
		nameLength--;
	}
	for(offset = 0; nameLength < offset; offset++, tileOffset++) {
		dest = convertTextToTilemap(tileOffset, dest);
	}
	// convert next 6 tiles (why?)
	for (offset = 0; offset < 6; offset++, tileOffset++) {
		dest = convertTextToTilemap(tileOffset, dest);
	}
	// convert rest of tiles
	for (offset = 0; offset < lumineHallText.length - 10; offset++, tileOffset++) {
		dest = convertTextToTilemap(tileOffset, dest);
	}
	// make sure there's one full screen's worth of blank tiles so text doesn't linger onscreen at the end
	for (short i = 0; i < 30; i++) {
		for (short j = 0; j < 8; j++) {
			(dest++)[0] = 0;
		}
	}
	// Adjust tiles - The map text tiles are expected to start at 0x10, and we want palette 3 for all of them.
	// Also create a blended set of tiles for smoother scrolling
	ushort* evenFrameTiles = cast(ushort*)&buffer[0x1000];
	ushort* oddFrameTiles = cast(ushort*)&buffer[0x4000];
	// make the even frame tiles are valid for the first column
	for (short i = 0; i < 8; i++) {
		(evenFrameTiles++)[0] = TilemapFlag.palette3 | 0x10;
	}
	// now adjust the real tiles
	for (short i = 0; i < tileCount + 0x1E; i++) {
		for (short j = 0; j < 8; j++) {
			// blend the right half of each tile with the left half of each of the next column's tile
			evenFrameTiles[0] = ((oddFrameTiles[0] << 1) & 0b1010) | ((oddFrameTiles[8] >> 1) & 0b0101);
			// tiles are at 0x10, use palette 3
			evenFrameTiles[0] += TilemapFlag.palette3 | 0x10;
			oddFrameTiles[0] += TilemapFlag.palette3 | 0x10;

			evenFrameTiles++;
			oddFrameTiles++;
		}
	}
	entityScriptVar0Table[currentEntitySlot] = cast(short)(tileCount * 2); // var 0 is how long the text is in half-tiles
	buffer[0] = 8; // height (tiles)
	buffer[1] = 30; // width (tiles)
}

unittest {
	if (romDataLoaded) {
		buffer[] = 0;
		partyCharacters[0].name = ebString!5("Ness");
		characterPadding = 1;
		prepareLumineHallTextRender();
		assert(buffer[0x1000 .. 0x3040] == import("exampleluminehallrendermap1.bin"));
		assert(buffer[0x4000 .. 0x6040] == import("exampleluminehallrendermap2.bin"));
	}
}

/** Scrolls the Lumine Hall text one "pixel" to the left
 * Returns: 0 if there's still text left, 1 if finished
 * Original_Address: $(DOLLAR)C48A6D
 */
short scrollLumineHallTextFrame() {
	ushort* tiles;
	// use the tweened text on odd frames
	if ((entityScriptVar1Table[currentEntitySlot] & 1) != 0) {
		tiles = cast(ushort*)&buffer[0x4000 + (entityScriptVar1Table[currentEntitySlot] >> 1) * 16];
	} else {
		tiles = cast(ushort*)&buffer[0x1000 + (entityScriptVar1Table[currentEntitySlot] >> 1) * 16];
	}
	// skip the first two bytes - they're the width and height
	ushort* destination = cast(ushort*)&buffer[2];
	for (short i = 0; i < 8; i++) {
		for (short j = 0; j < 30; j++) {
			(destination++)[0] = tiles[0];
			tiles += 8;
		}
		// move to the next column, +1 tile from where this column started
		tiles -= 239;
	}
	// render to map coords (808, 588)
	tilemapUpdateUploadTilemap(808, 588, cast(ushort*)&buffer[0]);
	short x = 0;
	// check if we've reached the end yet
	if (++entityScriptVar1Table[currentEntitySlot] > entityScriptVar0Table[currentEntitySlot]) {
		x = 1;
	}
	return x;
}

/** Start the PSI Teleport alpha tutorial
 * Original_Address: $(DOLLAR)C48B2C
 */
void actionScriptStartPSITeleportTutorial() {
	psiTeleportStyle = PSITeleportStyle.learnAlpha;
	gameState.leaderDirection = Direction.right;
}

/** Makes every party member entity look at the active entity
 * Original_Address: $(DOLLAR)C48B3B
 */
void makePartyLookAtActiveEntity() {
	if ((frameCounter & 1) != 0) {
		return;
	}
	for (short i = 0; gameState.partyCount > i; i++) {
		if (16 <= gameState.partyMemberIndex[i]) {
			continue;
		}
		short newDirection = cast(short)(cast(ushort)(getScreenAngle(entityAbsXTable[gameState.partyEntities[i]], entityAbsYTable[gameState.partyEntities[i]], entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]) + 0x1000) / 0x2000);
		if (entityDirections[gameState.partyEntities[i]] == newDirection) {
			continue;
		}
		entityDirections[gameState.partyEntities[i]] = newDirection;
		updateEntitySpriteFrame(gameState.partyEntities[i]);
	}
}

/** ActionScript tick callback for updating animated backgrounds and misc effects each frame
 * Original_Address: $(DOLLAR)C48BDA
 */
void actionScriptAnimatedBackgroundCallback() {
	drawBattleFrame();
}

/** ActionScript tick callback for setting the screen coordinates of an entity from its absolute coords relative to the BG1 position
 * Original_Address: $(DOLLAR)C48BE1
 */
void actionScriptSimpleScreenPositionCallback() {
	entityScreenXTable[currentEntitySlot] = cast(short)(entityAbsXTable[currentEntitySlot] - bg1XPosition);
	entityScreenYTable[currentEntitySlot] = cast(short)(entityAbsYTable[currentEntitySlot] - bg1YPosition);
}

/** ActionScript tick callback for setting the screen coordinates of an entity from its absolute coords relative to the BG1 position, offset by vars 0 + 1
 * Original_Address: $(DOLLAR)C48C02
 */
void actionScriptSimpleScreenPositionCallbackOffset() {
	entityScreenXTable[currentEntitySlot] = cast(short)(entityAbsXTable[currentEntitySlot] - bg1XPosition + entityScriptVar0Table[currentEntitySlot]);
	entityScreenYTable[currentEntitySlot] = cast(short)(entityAbsYTable[currentEntitySlot] - bg1YPosition + entityScriptVar1Table[currentEntitySlot]);
}

/** ActionScript tick callback for centering the screen on this entity's absolute coordinates
 * Original_Address: $(DOLLAR)C48C2B
 */
void actionScriptCentreScreenOnEntityCallback() {
	centerScreen(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]);
}

/** ActionScript tick callback for centering the screen on this entity's absolute coordinates, offset by vars 0 + 1
 * Original_Address: $(DOLLAR)C48C3E
 */
void actionScriptCentreScreenOnEntityCallbackOffset() {
	centerScreen(cast(short)(entityAbsXTable[currentEntitySlot] + entityScriptVar0Table[currentEntitySlot]), cast(short)(entityAbsYTable[currentEntitySlot] + entityScriptVar1Table[currentEntitySlot]));
}

/** A mapping of directions to d-pad presses, used for generating auto-movement demos
 * Original_Address: $(DOLLAR)C48C59
 */
immutable short[8] directionToButtonMap = [
	Direction.up: Pad.up,
	Direction.upRight: Pad.up | Pad.right,
	Direction.right: Pad.right,
	Direction.downRight: Pad.down | Pad.right,
	Direction.down: Pad.down,
	Direction.downLeft: Pad.left | Pad.down,
	Direction.left: Pad.left,
	Direction.upLeft: Pad.up | Pad.left
];

/** Wipes the recorded auto-movement demo
 * Original_Address: $(DOLLAR)C48C69
 */
void clearAutoMovementDemo() {
	autoMovementDemoPosition = 0;
	for (short i = 0; i < autoMovementDemoBuffer.length; i++) {
		autoMovementDemoBuffer[i].padState = 0;
		autoMovementDemoBuffer[i].frames = 0;
	}
}

/** Records a single frame of an auto-movement demo
 * Params:
 * 	newPadState = This frame's controller state to record
 * Original_Address: $(DOLLAR)C48C97
 */
void recordAutoMovementDemoFrame(short newPadState) {
	if ((autoMovementDemoPosition == 0) && (autoMovementDemoBuffer[autoMovementDemoPosition].padState == 0)) {
		// new demo, just record the input
		autoMovementDemoBuffer[autoMovementDemoPosition].padState = newPadState;
		autoMovementDemoBuffer[0].frames = 1;
	} else {
		if (autoMovementDemoBuffer[autoMovementDemoPosition].padState == newPadState) {
			// same input as last frame, just add to the frame count
			autoMovementDemoBuffer[autoMovementDemoPosition].frames++;
		} else {
			if (++autoMovementDemoPosition == autoMovementDemoBuffer.length) {
				assert(0, "Out of space in demo buffer");
			} else {
				// input changed, add a new entry
				autoMovementDemoBuffer[autoMovementDemoPosition].padState = newPadState;
				autoMovementDemoBuffer[autoMovementDemoPosition].frames = 1;
			}
		}
	}
}

/** Records a short auto-movement demo for the player to move from point A to point B
 *
 * Note that this does not take collision into account and can cause a softlock if collision is enabled during playback!
 * Params:
 * 	startX = Starting X coordinate
 * 	startY = Starting Y coordinate
 * 	destX = Destination X coordinate
 * 	destY = Destination Y coordinate
 * Returns: Total number of frames in demo
 * Original_Address: $(DOLLAR)C48D58
 */
short recordAutoMovementDemo(short startX, short startY, short destX, short destY) {
	FixedPoint1616 xPosition = { integer: startX };
	FixedPoint1616 yPosition = { integer: startY };
	short result = 0;
	while (true) {
		short xDifference = cast(short)(xPosition.integer - destX);
		short yDifference = cast(short)(yPosition.integer - destY);
		// are we at the destination yet?
		if (((0 > xDifference) ? (cast(short)-cast(int)xDifference) : xDifference <= 1) && ((0 > yDifference) ? (cast(short)-cast(int)yDifference) : yDifference <= 1)) {
			break;
		}
		// nope, add a frame of input
		short nextDirection = (getScreenAngle(xPosition.integer, yPosition.integer, destX, destY) + 0x1000) / 0x2000;
		recordAutoMovementDemoFrame(directionToButtonMap[nextDirection]);
		xPosition.combined += horizontalMovementSpeeds[0].directionSpeeds[nextDirection].combined;
		yPosition.combined += verticalMovementSpeeds[0].directionSpeeds[nextDirection].combined;
		result++;
	}
	return result;
}

unittest {
	if (romDataLoaded) {
		initializeMovementSpeeds();
		assert(recordAutoMovementDemo(6956, 7533, 6944, 7528) == 9);
		assert(autoMovementDemoBuffer[0] == DemoEntry(2, Pad.left | Pad.up));
		assert(autoMovementDemoBuffer[1] == DemoEntry(1, Pad.left));
		assert(autoMovementDemoBuffer[2] == DemoEntry(1, Pad.left | Pad.up));
		assert(autoMovementDemoBuffer[3] == DemoEntry(2, Pad.left));
		assert(autoMovementDemoBuffer[4] == DemoEntry(1, Pad.left | Pad.up));
		assert(autoMovementDemoBuffer[5] == DemoEntry(1, Pad.left));
		assert(autoMovementDemoBuffer[6] == DemoEntry(1, Pad.left | Pad.up));
	}
}

/** Record N frames of movement in the given direction in the auto-movement demo currently being recorded
 * Params:
 * 	direction = Direction to move in
 * 	frames = Number of frames of movement
 * Original_Address: $(DOLLAR)C48E6B
 */
void recordAutoMovementDemoNFramesDirection(short direction, short frames) {
	for (short i = frames; i != 0; i--) {
		recordAutoMovementDemoFrame(directionToButtonMap[direction]);
	}
}

/** Finish recording an auto-movement demo and immediately play it back
 * Original_Address: $(DOLLAR)C48E95
 */
void finishAutoMovementDemoAndStart() {
	autoMovementDemoBuffer[++autoMovementDemoPosition].frames = 0;
	startAutoMovementDemo(&autoMovementDemoBuffer[0]);
}

/** Tests if the given index corresponds to an active transforming item
 * Params:
 * 	index = Index into item transformation table. Do not exceed table length!
 * Returns: 1 if valid, 0 otherwise
 * Original_Address: $(DOLLAR)C48ECE
 */
short isValidItemTransformation(short index) {
	if (loadedItemTransformations[index].transformationCountdown != 0) {
		return 1;
	}
	if (loadedItemTransformations[index].sfxFrequency != 0) {
		return 1;
	}
	return 0;
}

/** Initializes an item transformation entry. If entry wasn't already initialized, also sets time until the next check to one second from now
 * Original_Address: $(DOLLAR)C48EEB
 */
void initializeItemTransformation(short id) {
	if (isValidItemTransformation(id) == 0) {
		timeUntilNextItemTransformationCheck = 60;
		itemTransformationsLoaded++;
	}
	loadedItemTransformations[id].sfx = timedItemTransformationTable[id].sfx;
	loadedItemTransformations[id].sfxFrequency = timedItemTransformationTable[id].sfxFrequency;
	loadedItemTransformations[id].sfxCountdown = cast(ubyte)(timedItemTransformationTable[id].sfxFrequency + randMod(2) - 1);
	loadedItemTransformations[id].transformationCountdown = timedItemTransformationTable[id].transformationTime;
}

/** Removes an item transformation entry
 * Original_Address: $(DOLLAR)C48F98
 */
void removeItemTransformationEntry(short id) {
	if (isValidItemTransformation(id) == 0) {
		return;
	}
	itemTransformationsLoaded--;
	loadedItemTransformations[id].sfxFrequency = 0;
	loadedItemTransformations[id].transformationCountdown = 0;
}

/** Process a single frame's worth of item transformations, such as eggs hatching into chicks or chicks growing up into chickens
 * Original_Address: $(DOLLAR)C48FC4
 */
void processItemTransformations() {
	if (enemyHasBeenTouched + battleSwirlCountdown != 0) {
		return;
	}
	if (disabledTransitions != 0) {
		return;
	}
	if (gameState.cameraMode == CameraMode.followEntity) {
		return;
	}
	if (--timeUntilNextItemTransformationCheck != 0) {
		return;
	}
	timeUntilNextItemTransformationCheck = 60;
	LoadedItemTransformation* transformation = loadedItemTransformations.ptr;
	short canPlaySFX = 1;
	for (short i = 0; i < 4; i++) {
		if ((canPlaySFX != 0) && (transformation.sfxFrequency != 0) && (transformation.sfxCountdown-- == 0)) {
			transformation.sfxCountdown = cast(ubyte)(transformation.sfxFrequency + randMod(2) - 1);
			playSfx(transformation.sfx);
			canPlaySFX = 0;
		}
		if (transformation.transformationCountdown != 0) {
			if (transformation.transformationCountdown-- == 0) {
				giveItemToCharacter(takeItemFromCharacter(0xFF, timedItemTransformationTable[i].item), timedItemTransformationTable[i].targetItem);
			}
		}
		transformation++;
	}
}

/** Gets the distance and direction from the nearest magic truffle onscreen to the player
 * Returns: 0 if no truffle found, 1 if far off, 10 if directly on top of one, or a direction + 2 if it's nearby
 * Original_Address: $(DOLLAR)C490EE
 */
short getDistanceToMagicTruffle() {
	short entity = findEntityBySprite(OverworldSprite.magicTruffle);
	if (entity == -1) {
		return 0;
	}
	if (entityAbsXTable[entity] < gameState.leaderX.integer - 64) {
		return 1;
	}
	if (entityAbsXTable[entity] == gameState.leaderX.integer + 64) {
		if (entityAbsYTable[entity] < gameState.leaderY.integer - 64) {
			return 1;
		}
		if (entityAbsYTable[entity] > gameState.leaderY.integer + 64) {
			return 1;
		}
	} else {
		return 1;
	}
	short yDistance = cast(short)(entityAbsYTable[entity] - gameState.leaderY.integer);
	if (yDistance < 0) {
		yDistance = cast(short)-yDistance;
	}
	short xDistance = cast(short)(entityAbsXTable[entity] - gameState.leaderX.integer);
	if (xDistance < 0) {
		xDistance = cast(short)-xDistance;
	}
	if (yDistance + xDistance < 16) {
		return 10;
	}
	return ((getScreenAngle(gameState.leaderX.integer, gameState.leaderY.integer, entityAbsXTable[entity], entityAbsYTable[entity]) + 0x1000) / 0x2000) + 2;
}


/** Calculates the linear slope of a colour channel to be used for colour fading
 * Params:
 * 	initial = The starting value of the channel
 * 	target = The desired final value of the channel
 * 	duration = Number of frames of fading that are expected to occur
 * Returns: Linear slope
 * Original_Address: $(DOLLAR)C491EE
 */
ushort getColourFadeSlope(ushort initial, ushort target, short duration) {
	return cast(ushort)(((target - initial) << 8) / duration);
}

unittest {
	assert(getColourFadeSlope(RGB(0, 0, 0).bgr555, RGB(18, 0, 0).bgr555, 480) == 9);
}

/** Prepares the colour tables for a map palette fade
 *
 * This covers all BG palettes except for the 2BPP text palettes
 * Params:
 * 	duration = The number of frames the fade is expected to last for
 * Original_Address: $(DOLLAR)C49208
 */
void initializeMapPaletteFade(short duration) {
	ushort* endColorPtr = &paletteAnimTargetPalette()[0];
	for (short i = 0; i < 0x60; i++) {
		ushort endColor = endColorPtr[0];
		ushort startColor = (&palettes[2][0])[i];
		paletteAnimRedSlope()[i] = getColourFadeSlope(startColor & 0x1F, endColor & 0x1F, duration);
		paletteAnimGreenSlope()[i] = getColourFadeSlope((startColor & 0x3E0) >> 5, (endColor & 0x3E0) >> 5, duration);
		paletteAnimBlueSlope()[i] = getColourFadeSlope((startColor & 0x7C00) >> 10, (endColor & 0x7C00) >> 10, duration);

		paletteAnimRedAccum()[i] = ((startColor & 0x1F) << 8) & 0xFF00;
		paletteAnimGreenAccum()[i] = (startColor & 0x3E0) << 3;
		paletteAnimBlueAccum()[i] = (startColor & 0x7C00) >> 2;
		endColorPtr++;
	}
}

/** Performs a single step of map palette fading and commits it to CGRAM
 *
 * Be sure to call initializeMapPaletteFade before calling this.
 * Original_Address: $(DOLLAR)C492D2
 */
void stepMapPaletteFade() {
	ushort* outputPtr = &palettes[2][0];
	for (short i = 0; i < 0x60; i++) {
		paletteAnimRedAccum()[i] += paletteAnimRedSlope()[i];
		paletteAnimGreenAccum()[i] += paletteAnimGreenSlope()[i];
		paletteAnimBlueAccum()[i] += paletteAnimBlueSlope()[i];
		ushort redBits = ((paletteAnimRedAccum()[i] >> 8) & 0x1F);
		ushort greenBits = ((paletteAnimGreenAccum()[i] >> 8) & 0x1F) << 5;
		ushort blueBits = ((paletteAnimBlueAccum()[i] >> 8) & 0x1F) << 10;
		outputPtr[0] = redBits | greenBits | blueBits;
		outputPtr++;
	}
	preparePaletteUpload(PaletteUpload.bgOnly);
}

/** Change from one map palette set to another, with an optional fading animation
 * Params:
 * 	tilesetNum = Current map tileset
 * 	paletteNum = Target palette ID
 * 	fadeDuration = Number of frames for the fading animation (0 to  disable)
 * Original_Address: $(DOLLAR)C4939C
 */
void changeMapPalette(ubyte tilesetNum, ubyte paletteNum, ubyte fadeDuration) {
	mapPaletteAnimationLoaded = 0;
	if (fadeDuration == 0) {
		memcpy(&palettes[2][0], &mapPalettes[tilesetNum][paletteNum * 0xC0], 0xC0);
	} else {
		memcpy(&paletteAnimTargetPalette()[0], &mapPalettes[tilesetNum][paletteNum * 0xC0], 0xC0);
		initializeMapPaletteFade(fadeDuration);
		for (short i = 0; i < fadeDuration; i++) {
			waitUntilNextFrame();
			stepMapPaletteFade();
		}
		memcpy(&palettes[2][0], &mapPalettes[tilesetNum][paletteNum * 0xC0], 0xC0);
		memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
		adjustSpritePalettesByAverage();
		loadSpecialSpritePalette();
		preparePaletteUpload(PaletteUpload.full);
		while (paletteUploadMode != PaletteUpload.none) { waitForInterrupt(); }
	}
}

/** Multiplies a colour by a scalar. Multiplies each individual channel separately, and recombines them
 * Params:
 * 	colour = Colour to multiply
 * 	value = Value to multiply colour by
 * Original_Address: $(DOLLAR)C49496
 */
ushort multiplyColour(ushort colour, short value) {
	ushort red;
	ushort green;
	ushort blue;
	if (value < 50) {
		red = cast(ushort)((colour & 0x1F) * value * 5);
		green = cast(ushort)(((colour >> 5) & 0x1F) * value * 5);
		blue = cast(ushort)(((colour >> 10) & 0x1F) * value * 5);
		if (red > 0x1E45) {
			red = 0x1F00;
		}
		if (green > 0x1E45) {
			green = 0x1F00;
		}
		if (blue > 0x1E45) {
			blue = 0x1F00;
		}
	} else if (value != 50) {
		red = 0x1F00;
		green = 0x1F00;
		blue = 0x1F00;
	}
	return cast(ushort)(((red >> 8) & 0xFF) | (((green >> 8) & 0xFF) << 5) | (((blue >> 8) & 0xFF) << 10));
}

/** Multiplies all the colours in the specified palette by a scalar value
 * Params:
 * 	multiplier = Value to multiply all colours by
 * 	palettes = 16 palettes worth of colours
 * Original_Address: $(DOLLAR)C4954C
 */
void multiplyPalettes(short multiplier, ushort* palettes) {
	ushort* dest = cast(ushort*)(&buffer[0]);
	for (short i = 0; i < 0x100; i++) {
		*(dest++) = multiplyColour(*(palettes++), multiplier);
	}
}

/** Precalculates palette tables for fading. Places six separate tables at buffer[0x200 .. 0xE00] - Separate fade slopes for red, green and blue channels, followed by separate red, green and blue values multiplied by 256
 * Params:
 * 	duration = Number of frames for fading
 * 	affectedPalettes = The palettes to calculate fades for, expressed as a bitmask (See [PaletteMask])
 * 	palette = The source palettes to calculate fades for
 * Original_Address: $(DOLLAR)C4958E
 */
void preparePaletteFadeTables(short duration, ushort affectedPalettes, ushort* palette) {
	ushort* dest = cast(ushort*)&buffer[0];
	memset(&buffer[0x200], 0, 0x1000);
	for (ushort i = 0; i < 0x100; i += 16) {
		// calculate fade slopes for palette
		for (ushort j = i; i + 16 > j; j++) {
			ushort colour;
			if ((affectedPalettes & 1) != 0) {
				colour = dest[j];
			} else {
				colour = palette[j];
				dest[j] = colour;
			}
			dest[0x100 + j] = getColourFadeSlope(palette[j] & 0x1F, colour & 0x1F, duration);
			dest[0x200 + j] = getColourFadeSlope((palette[j] & 0x3E0) >> 5, (colour & 0x3E0) >> 5, duration);
			dest[0x300 + j] = getColourFadeSlope((palette[j] & 0x7C00) >> 10, (colour & 0x7C00) >> 10, duration);
		}
		// multiply palette by 256
		for (short j = i; j < i + 16; j++) {
			dest[0x400 + j] = (palette[j] & 0x1F) << 8;
			dest[0x500 + j] = (palette[j] & 0x3E0) << 3;
			dest[0x600 + j] = (palette[j] & 0x7C00) >> 2;
		}
		affectedPalettes >>= 1;
	}
}

/** Prepares fade tables for the currently loaded palettes
 * See_Also: preparePaletteFadeTables
 * Params:
 * 	duration = Number of fade frames
 * 	affectedPalettes = Palettes affected by the fade (See [PaletteMask])
 * Original_Address: $(DOLLAR)C496E7
 */
void prepareLoadedPaletteFadeTables(short duration, ushort affectedPalettes) {
	preparePaletteFadeTables(duration, affectedPalettes, &palettes[0][0]);
}

unittest {
	// test fade for gas intro
	palettes = cast(immutable(ushort[16])[])import("intropalette.bin");
	prepareLoadedPalettesForFade();
	buffer[0x40 .. 0x60] = 0;
	palettes[0 .. 2] = (ushort[16]).init;
	palettes[3 .. $] = (ushort[16]).init;
	prepareLoadedPaletteFadeTables(480, PaletteMask.all);
	prettyCompare!"%04X"(cast(ushort[])(buffer[0x200 .. 0xE00]), cast(immutable(ushort)[])import("introfade.bin"));
}

/** Prepares the currently-loaded palette for fading
 * Original_Address: $(DOLLAR)C496F9
 */
void prepareLoadedPalettesForFade() {
	memcpy(&buffer[0], &palettes[0][0], palettes.sizeof);
}

/** Finishes a palette fade by committing the target palette to CGRAM
 * Original_Address: $(DOLLAR)C49740
 */
void finishPaletteFade() {
	memcpy(&palettes[0][0], &buffer[0], palettes.sizeof);
	preparePaletteUpload(PaletteUpload.full);
}

/** Makes a backup of the current palettes
 * Original_Address: $(DOLLAR)C4978E
 */
void backupPalettes() {
	memcpy(&mapPaletteBackup[0][0], &palettes[0][0], palettes.sizeof);
}

/** Fades palettes to some scalar multiple of the backed up palette over the specified number of frames
 * Params:
 * 	duration = Number of frames the fade effect lasts for
 * 	multiplier = The scalar value to multiply each colour in the palette by
 * 	affectedPalettes = The palettes affected by the fade (See [PaletteMask])
 * Original_Address: $(DOLLAR)C497C0
 */
void performPaletteFade(short duration, short multiplier, ushort affectedPalettes) {
	multiplyPalettes(multiplier, &mapPaletteBackup[0][0]);
	prepareLoadedPaletteFadeTables(duration, affectedPalettes);
	if (duration != 1) {
		for (short i = 0; i < duration; i++) {
			updatePaletteFade();
			waitUntilNextFrame();
		}
	}
	finishPaletteFade();
	preparePaletteUpload(PaletteUpload.full);
}

/** Clears the BG3 tilemap. Intended to be used after BG3 effects are done, so text can be displayed without corruption
 * Original_Address: $(DOLLAR)C4981F
 */
void actionScriptClearBG3Tilemap() {
	copyToVRAM(VRAMCopyMode.repeatWordToVRAM, 0x800, 0x7C00, &blankTiles[0]);
}

/** Opens the oval window used for prayer scenes
 * Original_Address: $(DOLLAR)C49841
 */
void actionScriptOpenPrayerWindow() {
	openOvalWindow(1);
}

/** Inverts the colours of all rendered text
 * Original_Address: $(DOLLAR)C4984B
 */
void invertRenderedText() {
	ushort* pixels = cast(ushort*)&vwfBuffer[0][0];
	for (short i = vwfBuffer.sizeof / ushort.sizeof; i != 0; i--) {
		pixels[0] ^= 0xFFFF;
		pixels++;
	}
}

/** Render up to 8 pixels worth of large font graphics to a buffer. Automatically increases flyoverByteOffset and flyoverPixelOffset as needed
 * Params:
 * 	renderWidth = number of pixels across to render
 * 	characterWidth = unused. the full width of the character being rendered
 * 	buf = buffer to render to, starting at flyoverByteOffset
 * 	fontData = the graphics data being rendered
 * Original_Address: $(DOLLAR)C49875
 */
void renderLargeCharacterInternalCommon(ubyte renderWidth, ushort characterWidth, ubyte* buf, const(ubyte)* fontData) {
	ubyte* destination = &buf[flyoverByteOffset];
	ubyte subTileOffset = cast(ubyte)(flyoverPixelOffset % 8);
	const(ubyte)* src = fontData;
	for (short i = 0; i < 2; i++) {
		for (short j = 0; j < 8; j++) {
			*(destination + 1) &= ((src[0] ^ 0xFF) >> subTileOffset) ^ 0xFF;
			*destination = *(destination + 1);
			destination += 2;
			src++;
		}
		destination = &buf[flyoverByteOffset + 0x1A0];
	}
	flyoverPixelOffset += renderWidth;
	if (flyoverPixelOffset / 8 == flyoverByteOffset) {
		return;
	}
	flyoverByteOffset = cast(ushort)((flyoverPixelOffset / 8) * 16);
	src = fontData;
	destination = &buf[flyoverByteOffset];
	for (short i = 0; i < 2; i++) {
		for (short j = 0; j < 8; j++) {
			*(destination + 1) &= ((src[0] ^ 0xFF) << (8 - subTileOffset)) ^ 0xFF;
			*destination = *(destination + 1);
			destination += 2;
			src++;
		}
		destination = &buf[flyoverByteOffset + 0x1A0];
	}
}

/** Render a full large font character to the VWF buffer, adjusting flyoverByteOffset and flyoverPixelOffset as appropriate
 * Params:
 * 	character = The character being rendered in flyover encoding (should be in the range of 0x50 - 0xD0)
 * Original_Address: $(DOLLAR)C4999B
 */
void renderLargeCharacterInternal(ubyte character) {
	character = (character - 0x50) & 0x7F;
	const(ubyte)* graphicsData = &fontGraphics[fontConfigTable[Font.large].graphicsID][character * fontConfigTable[Font.large].bytesPerCharacter];
	ubyte pixelWidth = cast(ubyte)(fontData[fontConfigTable[Font.large].dataID][character] + 1);
	while (pixelWidth > 8) { // render 8 pixels at a time
		renderLargeCharacterInternalCommon(8, fontConfigTable[Font.large].height, &vwfBuffer[0][0], graphicsData);
		pixelWidth -= 8;
		graphicsData += fontConfigTable[Font.large].height;
	}
	renderLargeCharacterInternalCommon(pixelWidth, fontConfigTable[Font.large].height, &vwfBuffer[0][0], graphicsData);
}

/** Waits for a single frame while ensuring the animated background keeps rendering
 * Original_Address: $(DOLLAR)C49A4B
 */
void flyoverWaitFrame() {
	waitUntilNextFrame();
	drawBattleFrame();
}

/** Prepares for a new screen of flyover text or coffee/tea text
 *
 * Configures BG3 for text, Uploads the text palette, clears the VWF, uploads a tilemap for BG3, initializes the text renderer and sets forced blanking.
 * Consider fading to black before calling this function, because the screen WILL be black after it's done
 * Original_Address: $(DOLLAR)C49A56
 */
void prepareNewFlyoverCoffeeTeaScene() {
	enum bg3TileMapAddress = 0x7C00;
	enum bg3TileAddress = 0x6000;
	prepareForImmediateDMA();
	setBG3VRAMLocation(BGTileMapSize.normal, bg3TileMapAddress, bg3TileAddress);
	*cast(ushort*)(&buffer[0]) = 0;
	copyToVRAM(VRAMCopyMode.repeatWordToVRAM, 0x3800, bg3TileAddress, &buffer[0]);
	memcpy(&palettes[0][0], &flyoverTextPalette[0], 8);
	paletteUploadMode = PaletteUpload.full;
	memset(&vwfBuffer[0][0], 0xFF, vwfBuffer.sizeof);
	ushort y = 0x10; // reserve the first 16 tiles
	// we want a 26 x 32 arrangement of sequential tiles, centered horizontally
	// so just skip the 3 tiles on the left and right sides
	for (short i = 0; i < 0x20; i++) {
		bg2Buffer[i * 32] = 0;
		bg2Buffer[i * 32 + 1] = 0;
		bg2Buffer[i * 32 + 2] = 0;
		for (short j = 3; j < 0x1D; j++) {
			bg2Buffer[i * 32 + j] = cast(ushort)(TilemapFlag.priority + y); // priority bit on
			y++;
		}
		bg2Buffer[i * 32 + 29] = 0;
		bg2Buffer[i * 32 + 30] = 0;
		bg2Buffer[i * 32 + 31] = 0;
	}
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x800, bg3TileMapAddress, cast(ubyte*)&bg2Buffer[0]);
	// old mother 2 stuff
	unused7E3C18 = 0x1A;
	unread7E3C1C = 0;
	unused7E3C1E = -1;
	unused7E3C20 = 0;
	unused7E3C14 = 0;
	// new earthbound stuff
	flyoverNextLineIncrement = 0;
	flyoverPixelOffset = 0;
	flyoverByteOffset = 0;
	// set force blank so we can spend as little time as possible loading
	setForceBlank();
}

/** Copies rendered text tiles to VRAM
 *
 * Copies as much of the VWF buffer as possible into VRAM, starting at $6150 adjusted by flyoverScreenOffset.
 * Original_Address: $(DOLLAR)C49B6E
 */
void flyoverCopyRenderedText(short) {
	enum sizeIncrements = 16 * (32 - 3 * 2);
	enum addressIncrements = sizeIncrements / 2;
	enum baseDestination = 0x6000 + 16 * 8 + (8 * 26); // start at tile at (40, 8)
	enum maximumSize = 0x3400; // the buffer must've been relocated at some point, because this is way past the end of VRAM
	invertRenderedText();
	// this branch is only taken if flyoverScreenOffset is 30, which is offscreen
	if (flyoverScreenOffset * sizeIncrements + sizeIncrements * 3 > maximumSize) {
		if (maximumSize - flyoverScreenOffset * sizeIncrements != 0) {
			copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, cast(short)(maximumSize - flyoverScreenOffset * sizeIncrements), cast(ushort)(addressIncrements * flyoverScreenOffset + baseDestination), &vwfBuffer[0][0]);
		}
		// this can never be true, fortunately
		if (flyoverScreenOffset * sizeIncrements + sizeIncrements * 3 - maximumSize != 0) {
			assert(0, "Not implemented");
			//copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, flyoverScreenOffset * sizeIncrements + sizeIncrements * 3 - maximumSize, baseDestination, 0x6892 - flyoverScreenOffset * sizeIncrements);
		}
	} else {
		copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, sizeIncrements * 3, cast(ushort)(addressIncrements * flyoverScreenOffset + baseDestination), &vwfBuffer[0][0]);
	}
	unused7E3C1E = -1;
	unused7E3C20 = 0;
	waitUntilNextFrame();
}

/** Finish rendering a flyover line, ensure everything is finished uploading and prepare for the next line
 * Original_Address: $(DOLLAR)C49C56
 */
void finishLine(short nextLineOffset) {
	flyoverNextLineIncrement += nextLineOffset;
	unused7E3C14 = 0;
	flyoverScreenOffset += flyoverNextLineIncrement / 8 + 1;
	if (flyoverScreenOffset >= 0x20) {
		flyoverScreenOffset -= 0x20;
	}
	waitDMAFinished();
	memset(&vwfBuffer[0][0], 0xFF, 0x680);
	flyoverNextLineIncrement &= 7;
	flyoverPixelOffset = 0;
	flyoverByteOffset = 0;
}

/** Set the pixel offset to start rendering flyover text at. Note that this is in addition to the hard (40, 8) beginning offset
 * Original_Address: $(DOLLAR)C49CA8
 */
void flyoverSetPixelOffset(ubyte arg1) {
	flyoverPixelOffset += arg1 + 8;
	flyoverByteOffset = cast(short)((flyoverPixelOffset / 8) * 16);
}

/** Renders a party member name in flyover mode
 * Params:
 * 	partyCharacter = Character ID + 1 of the party member whose name is being rendered
 * 	unused =
 * Original_Address: $(DOLLAR)C49CC3
 */
void renderFlyoverPartyMemberName(ubyte partyCharacter, short unused) {
	ubyte* name = &partyCharacters[partyCharacter - 1].name[0];
	for (short i = 0; (i < PartyCharacter.name.length) && (name[0] > 0x4F); i++) {
		renderLargeCharacterInternal(*(name++));
	}
}

/** Renders a single character to the flyover buffer
 * Params:
 * 	character = The text character, in flyover encoding, to render
 * 	unused1 =
 * 	unused2 =
 * Original_Address: $(DOLLAR)C49D16
 */
// seems weird, but mother 2 did make use of the other args
void renderFlyoverCharacter(ubyte character, short unused1, short unused2) {
	renderLargeCharacterInternal(character);
}

/** Scrolls the screen downward during a coffee/tea scene at a rate of 1/4 pixels per frame
 * Params:
 * 	offset = Starting BG offset (in 1/256ths of a pixel)
 * Returns: New BG offset (in 1/256ths of a pixel)
 * Original_Address: $(DOLLAR)C49D1E
 */
short coffeeTeaSingleFrameScroll(short offset) {
	oamClear();
	ushort roundedOffset = offset & 0xFF00;
	short result = cast(short)(offset + 0x40);
	offset = cast(short)((offset + 0x40) & 0xFF00);
	if (offset != roundedOffset) {
		bg3YPosition += (offset - roundedOffset) >> 8;
		updateScreen();
	}
	return result;
}

/** Renders a full coffee/tea scene
 * Params:
 * 	id = 0 for coffee, 1 for tea
 * Original_Address: $(DOLLAR)C49D6A
 */
void coffeeTeaScene(short id) {
	fadeOutWithMosaic(1, 1, 0);
	prepareNewFlyoverCoffeeTeaScene();
	oamClear();
	loadBackgroundAnimation((id == 0) ? BackgroundLayer.coffee1 : BackgroundLayer.tea1, (id == 0) ? BackgroundLayer.coffee2 : BackgroundLayer.tea2);
	fadeIn(1, 1);
	flyoverScreenOffset = 28; // start at the very last line onscreen.
	short scrollRemainder = 0;
	const(ubyte)* script = (id == 0) ? &coffeeSequenceText[0] : &teaSequenceText[0];
	enableWordWrap = 0;
	parseLoop: while (true) {
		switch ((script++)[0]) {
			case 0:
				break parseLoop;
			case 9: // scroll 32 pixels downward
				short tempOffset = coffeeTeaSingleFrameScroll(scrollRemainder);
				flyoverCopyRenderedText(0x18);
				drawBattleFrame();
				while (tempOffset < 0x40 * 128) { // move 32 pixels downward over the next 128 frames
					tempOffset = coffeeTeaSingleFrameScroll(tempOffset);
					flyoverWaitFrame();
				}
				scrollRemainder = cast(short)(tempOffset - 0x2000);
				finishLine(0x18);
				break;
			case 1:
				flyoverSetPixelOffset(*(script++));
				break;
			case 8:
				renderFlyoverPartyMemberName(*(script++), 0xC);
				break;
			default:
				renderFlyoverCharacter(*(script - 1), 0, 0xC);
				break;
		}
	}
	fadeOut(1, 1);
	// wait for the fade to finish
	while (fadeParameters.step != 0) {
		flyoverWaitFrame();
	}
	prepareForImmediateDMA();
	reloadMap();
	ushort* dest = &bg2Buffer[0];
	for (short i = 0x380; i != 0; i--) {
		*(dest++) = 0;
	}
	enableWordWrap = 0xFF;
	prepareForImmediateDMA();
	restoreMapRendering();
	setForceBlank();
	fadeIn(1, 1);
}

/** Scripts for each flyover screen
 * Original_Address: $(DOLLAR)C49EA4
 */
@([ROMSource(0x210B86, 22), ROMSource(0x210B9C, 38), ROMSource(0x210BC2, 16), ROMSource(0x210BD2, 43), ROMSource(0x210BFD, 30), ROMSource(0x210C1B, 29), ROMSource(0x210C38, 41), ROMSource(0x210C61, 25)])
immutable(ubyte[])[] flyoverTextScripts;

/** Renders a full flyover screen
 * Params:
 * 	id = One of the flyover screen numbers
 * Original_Address: $(DOLLAR)C49EC4
 */
void runFlyover(short id) {
	ushort leaderCallbackFlagsBackup = entityCallbackFlags[partyLeaderEntity];
	entityCallbackFlags[partyLeaderEntity] |= 0xC000;
	prepareNewFlyoverCoffeeTeaScene();
	immutable(ubyte)* script = &flyoverTextScripts[id][0];
	enableWordWrap = 0;
	while (true) {
		switch(*(script++)) {
			case 0:
				mirrorTM = TMTD.bg3; // show only BG3
				fadeInWithMosaic(1, 3, 0);
				for (short i = 0; i < 180; i++) {
					waitUntilNextFrame();
				}
				fadeOutWithMosaic(1, 3, 0);
				mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
				// clear buffer, we're done with it
				ushort* buf = bg2Buffer.ptr;
				for (short i = 0x380; i != 0; i--) {
					*(buf++) = 0;
				}
				enableWordWrap = 0xFF;
				prepareForImmediateDMA();
				restoreMapRendering();
				entityCallbackFlags[partyLeaderEntity] = leaderCallbackFlagsBackup;
				setForceBlank();
				return;
			case 2:
				flyoverScreenOffset = *(script++);
				break;
			case 9:
				flyoverCopyRenderedText(0x18);
				waitUntilNextFrame();
				finishLine(0x18);
				break;
			case 1:
				flyoverSetPixelOffset(*(script++));
				break;
			case 8:
				renderFlyoverPartyMemberName(*(script++), 0xC);
				break;
			default:
				renderFlyoverCharacter(*(script - 1), 0, 0xC);
				break;
		}
	}
}

/** The text labels for battle action menus
 * Original_Address: $(DOLLAR)C49FE1
 */
immutable ubyte[16][10] battleMenuText = [
	ebString!16("Bash"),
	ebString!16("Goods"),
	ebString!16("Auto Fight"),
	ebString!16("PSI"),
	ebString!16("Defend"),
	ebString!16("Pray"),
	ebString!16("Shoot"),
	ebString!16("Spy"),
	ebString!16("Run Away"),
	ebString!16("Mirror"),
];

/** Text used for battle menus when there are no usable options
 * Original_Address: $(DOLLAR)C4A081
 */
immutable ubyte[12] battleMenuTextDoNothing = ebString!12("Do Nothing");

/** A list of battle actions that don't ignore or force retargetting when targetted at the dead
 * Original_Address: $(DOLLAR)C4A08D
 */
immutable BattleActions[33] deadTargettableActions = [
	BattleActions.psiLifeupAlpha,
	BattleActions.psiLifeupBeta,
	BattleActions.psiLifeupGamma,
	BattleActions.psiLifeupOmega,
	BattleActions.psiHealingAlpha,
	BattleActions.psiHealingBeta,
	BattleActions.psiHealingGamma,
	BattleActions.psiHealingOmega,
	BattleActions.action135,
	BattleActions.action136,
	BattleActions.action137,
	BattleActions.action138,
	BattleActions.action139,
	BattleActions.handAid,
	BattleActions.action141,
	BattleActions.action142,
	BattleActions.action143,
	BattleActions.action144,
	BattleActions.action145,
	BattleActions.action146,
	BattleActions.action147,
	BattleActions.action148,
	BattleActions.wetTowel,
	BattleActions.refreshingHerb,
	BattleActions.secretHerb,
	BattleActions.fullStatusHeal,
	BattleActions.action153,
	BattleActions.action154,
	BattleActions.action155,
	BattleActions.action156,
	BattleActions.action157,
	BattleActions.action158,
	cast(BattleActions)0,
];

/** Figure out which character is in greatest need of healing of a specific status effect
 *
 * Finds the party member with the least amount of HP that isn't already being autohealed with the status effect in question
 * Params:
 * 	statusGroup = The group ID of the status effect to search for
 * 	status = The specific status effect being searched for
 * Returns: 1-based party member ID of the party member who needs healing the most, or 0 if no appropriate party members found
 * Original_Address: $(DOLLAR)C4A0CF
 */
short autoHealing(short statusGroup, short status) {
	short leastHPFound = 9999;
	short partyMemberWithLeastHP = 0;
	for (short i = 0; i < 6; i++) {
		if ((gameState.partyMembers[i] < 1) || (gameState.partyMembers[i] > 4)) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].isAutoHealed != 0) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].afflictions[statusGroup] != status) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].hp.target >= leastHPFound) {
			continue;
		}
		leastHPFound = partyCharacters[gameState.partyMembers[i]].hp.target;
		partyMemberWithLeastHP = gameState.partyMembers[i];
	}
	if (partyMemberWithLeastHP != 0) {
		partyCharacters[partyMemberWithLeastHP - 1].isAutoHealed = 1;
	}
	return partyMemberWithLeastHP;
}

/** Figure out which character is in greatest need of HP restoration
 *
 * Finds the still-living party member with the least amount of HP that isn't already being autohealed. Must also have at most 25% of max HP
 * Returns: 1-based party member ID of the party member who needs healing the most, or 0 if no appropriate party members found
 * Original_Address: $(DOLLAR)C4A15D
 */
short autoLifeup() {
	short leastHPFound = 9999;
	short partyMemberWithLeastHP = 0;
	for (short i = 0; i < 6; i++) {
		if ((gameState.partyMembers[i] < 1) || (gameState.partyMembers[i] > 4)) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].isAutoHealed != 0) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].afflictions[0] == Status0.unconscious) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].hp.target >= partyCharacters[gameState.partyMembers[i]].maxHP / 4) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].hp.target >= leastHPFound) {
			continue;
		}
		leastHPFound = partyCharacters[gameState.partyMembers[i]].hp.target;
		partyMemberWithLeastHP = gameState.partyMembers[i];
	}
	if (partyMemberWithLeastHP != 0) {
		partyCharacters[partyMemberWithLeastHP - 1].isAutoHealed = 1;
	}
	return partyMemberWithLeastHP;
}

/** Battle menus to use, in order of space for columns of commands
 * Original_Address: $(DOLLAR)C4A1F2
 */
immutable ubyte[3] battleWindows = [
	Window.battleMenuNormal, // 2 columns
	Window.battleMenuExtended, // 3 columns
	Window.battleMenuDoubleExtended // 4 columns
];

/** Check if target is attackable
 * Params:
 * 	target = The battler ID of the fighter to check over
 * Returns: 0 if the target is dead, an NPC or is diamondized
 * Original_Address: $(DOLLAR)C4A1F5
 */
short checkIfValidTarget(short target) {
	if ((battlersTable[target].consciousness != 0) &&
		(battlersTable[target].npcID == 0) &&
		(battlersTable[target].afflictions[0] != Status0.unconscious) &&
		(battlersTable[target].afflictions[0] != Status0.diamondized)) {
		return 1;
	}
	return 0;
}

/** Translates a battler table index into a target for a battler
 * Params:
 * 	battler = The battler who's targetting something
 * 	index = A battler table index
 * Original_Address: $(DOLLAR)C4A228
 */
void targetEnemyByBattlerIndex(Battler* battler, short index) {
	for (short i = 0; i < numBattlersInFrontRow; i++) {
		if (frontRowBattlers[i] != index) {
			continue;
		}
		battler.currentTarget = cast(ubyte)(i + 1);
		return;
	}
	for (short i = 0; i < numBattlersInBackRow; i++) {
		if (backRowBattlers[i] != index) {
			continue;
		}
		battler.currentTarget = cast(ubyte)(i + numBattlersInFrontRow + 1);
		return;
	}
}

/** Bitmasks for battler targetting.
 *
 * Possibly just an optimization for 1 << n?
 * Original_Address: $(DOLLAR)C4A228
 */
immutable uint[32] targettingFlagBitmasks = [
	1 << 0,
	1 << 1,
	1 << 2,
	1 << 3,
	1 << 4,
	1 << 5,
	1 << 6,
	1 << 7,
	1 << 8,
	1 << 9,
	1 << 10,
	1 << 11,
	1 << 12,
	1 << 13,
	1 << 14,
	1 << 15,
	1 << 16,
	1 << 17,
	1 << 18,
	1 << 19,
	1 << 20,
	1 << 21,
	1 << 22,
	1 << 23,
	1 << 24,
	1 << 25,
	1 << 26,
	1 << 27,
	1 << 28,
	1 << 29,
	1 << 30,
	1 << 31,
];

/** Time to wait in frames between toggling static on/off when Giygas is defeated
 *
 * Null-terminated!
 * Original_Address: $(DOLLAR)C4A331
 */
immutable ushort[22] giygasDeathStaticTransitionDelays = [
	8 * 60,
	3 * 6,
	4 * 60,
	3 * 6,
	2 * 60,
	1 * 6,
	1 * 60,
	6 * 6,
	3 * 60,
	3 * 6,
	2 * 60,
	1 * 6,
	2 * 6,
	3 * 6,
	6 * 6,
	1 * 60,
	3 * 6,
	3 * 60,
	2 * 6,
	4 * 60,
	1 * 6,
	0
];

/** Sounds to play and the delays between them during the final prayer, immediately after the last damage is dealt
 * Original_Address: $(DOLLAR)C4A35D
 */
immutable FinalGiygasPrayerNoiseEntry[13] finalGiygasPrayerNoiseTable = [
		FinalGiygasPrayerNoiseEntry(Sfx.doorOpen, 90),
		FinalGiygasPrayerNoiseEntry(Sfx.doorOpen, 25),
		FinalGiygasPrayerNoiseEntry(Sfx.doorClose, 90),
		FinalGiygasPrayerNoiseEntry(Sfx.doorOpen, 25),
		FinalGiygasPrayerNoiseEntry(Sfx.doorClose, 75),
		FinalGiygasPrayerNoiseEntry(Sfx.doorOpen, 10),
		FinalGiygasPrayerNoiseEntry(Sfx.doorOpen, 8),
		FinalGiygasPrayerNoiseEntry(Sfx.doorOpen, 10),
		FinalGiygasPrayerNoiseEntry(Sfx.doorClose, 6),
		FinalGiygasPrayerNoiseEntry(Sfx.doorClose, 6),
		FinalGiygasPrayerNoiseEntry(Sfx.doorClose, 6),
		FinalGiygasPrayerNoiseEntry(Sfx.doorClose, 6),
		FinalGiygasPrayerNoiseEntry(Sfx.doorClose, 0),
];

/** Sets up the Giygas overlay effect for the start of the "THE WAR AGAINST GIYGAS" portion of the intro
 * Original_Address: $(DOLLAR)C4A377
 */
void setupGiygasOverlay() {
	setBGMODE(BGMode.mode3);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x7800, 0);
	setBG2VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	decomp(&animatedBackgroundTiles[animatedBackgrounds[BackgroundLayer.introGiygas].graphics][0], &buffer[0]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x2000, 0x6000, &buffer[0]);
	decomp(&animatedBackgroundTilemaps[animatedBackgrounds[BackgroundLayer.introGiygas].graphics][0], &buffer[0]);
	for (short i = 0; i < 0x800; i += 2) {
		buffer[i + 1] = (buffer[i + 1] & 0xDF) | 8;
	}
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x800, 0x7C00, &buffer[0]);
	loadBackgroundAnimationInfo(&loadedBGDataLayer1, &animatedBackgrounds[BackgroundLayer.introGiygas]);
	loadedBGDataLayer1.palettePointer = &palettes[2];
	memcpy(&loadedBGDataLayer1.palette[0], &animatedBackgroundPalettes[animatedBackgrounds[BackgroundLayer.introGiygas].palette][0], 0x20);
	memcpy(&loadedBGDataLayer1.palette2[0], &animatedBackgroundPalettes[animatedBackgrounds[BackgroundLayer.introGiygas].palette][0], 0x20);
	memcpy(&loadedBGDataLayer1.palettePointer[0], &loadedBGDataLayer1.palette[0], 0x20);
	loadedBGDataLayer1.targetLayer = 2;
	generateBattleBGFrame(&loadedBGDataLayer1, 0);
	loadedBGDataLayer2.targetLayer = 0;
}

/** Screen offsets for the vertical shake animation. Starts with intense shakes that gradually weaken
 * Original_Address: $(DOLLAR)C4A591
 */
immutable byte[61] verticalShakeOffsets = [
	0, 14, 23, 23, 12, -5, -18, -16, 0, 15, 12, -6, -14, 0, 13, 2, -11, 0, 10, -4, -7, 8, 0, -6, 7, -2, -3, 6, -5, 3, 0, -2, 3, -4, 4, -4, 4, -3, 3, -3, 3, -2, 2, -1, 0, 1, -2, 2, -1, -1, 2, -1, 0, 1, -1, -1, 1, 0, -1, 0, 1
];

/// $C4A5CE
immutable OvalWindowAnimation[2] ovalWindowSwirl = [
	OvalWindowAnimation(61, 0, 128, 112, 0, 0, 0, 0, 224, 183, 4, 3),
	OvalWindowAnimation(0),
];

/// $C4A5FA
immutable OvalWindowAnimation[2] evtPrayOvalWindow = [
	OvalWindowAnimation(100, 0, 128, 112, 0, 0, 0, 0, 224, 183, 4, 3),
	OvalWindowAnimation(0),
];

/// $C4A626
immutable OvalWindowAnimation[2] unknownC4A626 = [
	OvalWindowAnimation(61, 0, 128, 112, 0x8000, 0x8000, 0, 0, -224, -183, -4, -3),
	OvalWindowAnimation(0),
];

/// $C4A652
immutable OvalWindowAnimation[2] unknownC4A652 = [
	OvalWindowAnimation(100, 0, 128, 112, 0x8000, 0x8000, 0, 0, -224, -183, -4, -3),
	OvalWindowAnimation(0),
];

/** Starts a swirl-type HDMA effect using the given flags
 * Params:
 * 	swirl = The swirl id to use (see earthbound.commondefs.Swirl for values)
 * 	flags = Bitmask of animation flags (see earthbound.commondefs.AnimationFlags for values)
 * Original_Address: $(DOLLAR)C4A67E
 */
void startSwirl(short swirl, short flags) {
	tracef("Loading swirl %s", swirl);
	if ((flags & AnimationFlags.invert) != 0) {
		swirlInvertEnabled = 1;
	} else {
		swirlInvertEnabled = 0;
	}
	if ((flags & AnimationFlags.reverse) != 0) {
		swirlReversed = 1;
	} else {
		swirlReversed = 0;
	}
	if ((flags & AnimationFlags.unknown2) != 0) {
		swirlMaskSettings = SwirlMask.mathMode;
	} else {
		swirlMaskSettings = SwirlMask.bg1 | SwirlMask.bg2 | SwirlMask.bg3 | SwirlMask.bg4 | SwirlMask.obj; // on/off mask
	}
	framesLeftUntilNextSwirlUpdate = 1;
	framesUntilNextSwirlFrame = swirlAnimationConfig[swirl].timeBetweenFrames;
	swirlFramesLeft = swirlAnimationConfig[swirl].swirlFrames;
	swirlHDMATableID = swirlAnimationConfig[swirl].startingHDMATableID;
	if (swirlReversed != 0) {
		swirlHDMATableID += swirlFramesLeft;
	}
	loadedOvalWindow = null;
	if (swirl == 0) {
		loadedOvalWindow = &ovalWindowSwirl[0];
	}
	swirlHDMAChannelOffset = 0;
	swirlLengthPadding = 0;
	swirlAutoRestore = 1;
	if ((flags & AnimationFlags.repeat) != 0) {
		swirlNextSwirl = cast(ubyte)swirl;
		framesUntilNextSwirlFrame = 4;
		swirlRepeatSpeed = 0;
		swirlRepeatsUntilSpeedUp = 6;
	} else {
		swirlNextSwirl = 0;
	}
	resetWindows();
}

/** Renders the next frame of a swirl-type HDMA effect. Update takes effect immediately.
 * Original_Address: $(DOLLAR)C4A7B0
 */
void updateSwirlFrame() {
	if (framesLeftUntilNextSwirlUpdate == 0) {
		return;
	}
	if (loadedOvalWindow != null) {
		if (--framesLeftUntilNextSwirlUpdate == 0) {
			framesLeftUntilNextSwirlUpdate = loadedOvalWindow.duration;
			if (loadedOvalWindow.duration == 0) {
				loadedOvalWindow = null;
				return;
			}
			if (loadedOvalWindow.centreX != 0x8000) {
				loadedOvalWindowCentreX = loadedOvalWindow.centreX;
			}
			if (loadedOvalWindow.centreY != 0x8000) {
				loadedOvalWindowCentreY = loadedOvalWindow.centreY;
			}
			if (loadedOvalWindow.initialWidth != 0x8000) {
				loadedOvalWindowWidth = loadedOvalWindow.initialWidth;
			}
			if (loadedOvalWindow.initialHeight != 0x8000) {
				loadedOvalWindowHeight = loadedOvalWindow.initialHeight;
			}
			loadedOvalWindowCentreXAdd = loadedOvalWindow.centreXAdd;
			loadedOvalWindowCentreYAdd = loadedOvalWindow.centreYAdd;
			loadedOvalWindowWidthVelocity = loadedOvalWindow.widthVelocity;
			loadedOvalWindowHeightVelocity = loadedOvalWindow.heightVelocity;
			loadedOvalWindowWidthAcceleration = loadedOvalWindow.widthAcceleration;
			loadedOvalWindowHeightAcceleration = loadedOvalWindow.heightAcceleration;
			loadedOvalWindow++;
		}
		loadedOvalWindowCentreX += loadedOvalWindowCentreXAdd;
		loadedOvalWindowCentreY += loadedOvalWindowCentreYAdd;
		loadedOvalWindowWidthVelocity += loadedOvalWindowWidthAcceleration;
		loadedOvalWindowHeightVelocity += loadedOvalWindowHeightAcceleration;
		if ((0 > loadedOvalWindowWidthVelocity) && (loadedOvalWindowWidth < -cast(int)loadedOvalWindowWidthVelocity)) {
			loadedOvalWindowWidth = 0;
		} else {
			loadedOvalWindowWidth += loadedOvalWindowWidthVelocity;
		}
		if ((0 > loadedOvalWindowHeightVelocity) && (loadedOvalWindowHeight < -cast(int)loadedOvalWindowHeightVelocity)) {
			loadedOvalWindowHeight = 0;
		} else {
			loadedOvalWindowHeight += loadedOvalWindowHeightVelocity;
		}
		if ((loadedOvalWindowWidth == 0) && (loadedOvalWindowHeight == 0)) {
			framesLeftUntilNextSwirlUpdate = 0;
			loadedOvalWindow = null;
		}
		generateSwirlHDMATable(loadedOvalWindowCentreX, loadedOvalWindowCentreY, (loadedOvalWindowWidth >> 8) & 0xFF, (loadedOvalWindowHeight >> 8) & 0xFF);
		enableSwirlWindowHDMA(3, 0x41);
		setWindowMask(swirlMaskSettings, (swirlInvertEnabled >> 8) & 0xFF);
		return;
	}

	if (--framesLeftUntilNextSwirlUpdate != 0) {
		return;
	}
	while (true) { //pretty weird but I'm not sure how else to express this mass of branches
		if (swirlFramesLeft != 0) {
			framesLeftUntilNextSwirlUpdate = framesUntilNextSwirlFrame;
			hdmaDisable(swirlHDMAChannelOffset + 3);
			swirlHDMAChannelOffset++;
			swirlHDMAChannelOffset &= 1;
			if (swirlReversed == 0) {
				enableWindowHDMA(swirlHDMAChannelOffset + 3, &swirlHDMATables[swirlHDMATableID++][0]);
			} else {
				enableWindowHDMA(swirlHDMAChannelOffset + 3, &swirlHDMATables[--swirlHDMATableID][0]);
			}
			setWindowMask(swirlMaskSettings, swirlInvertEnabled);
			swirlFramesLeft--;
			return;
		}
		if (swirlNextSwirl != 0) {
			if (--swirlRepeatsUntilSpeedUp != 0) {
				swirlFramesLeft = swirlAnimationConfig[swirlNextSwirl].swirlFrames;
				swirlRepeatsUntilSpeedUp = swirlAnimationConfig[swirlNextSwirl].startingHDMATableID;
				if (swirlReversed == 0) {
					continue;
				}
				swirlRepeatsUntilSpeedUp += swirlFramesLeft;
				continue;
			}
			switch (++swirlRepeatSpeed) {
				case 1:
					swirlRepeatsUntilSpeedUp = 7;
					framesUntilNextSwirlFrame = 3;
					break;
				case 2:
					swirlRepeatsUntilSpeedUp = 6;
					framesUntilNextSwirlFrame = 2;
					break;
				case 3:
					swirlRepeatsUntilSpeedUp = 12;
					framesUntilNextSwirlFrame = 1;
					break;
				default: break;
			}
			if (swirlRepeatsUntilSpeedUp != 0) {
				continue;
			}
		}
		if (swirlLengthPadding != 0) {
			framesLeftUntilNextSwirlUpdate = 1;
			swirlLengthPadding--;
			return;
		}
		break;
	}
	if (swirlAutoRestore == 0) {
		return;
	}
	hdmaDisable(swirlHDMAChannelOffset + 3);
	setWindowMask(0, 0);
	restoreAnimatedBackgroundColour();
	setColData(0, 0, 0);
	setLayerConfig(currentLayerConfig);
}

/** Distances between the centre of the sound stone icons and the little orbiting sprites over time.
 *
 * One set for each icon, plus one extra?
 * Bug: These arrays are one frame shorter than they should be
 * Original_Address: $(DOLLAR)C4AC57
 */
immutable ubyte[][9] soundStoneOrbitSpriteDistances = [
	[
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x28, 0x23,
		0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x28, 0x23, 0x1E, 0x19, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23,
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23,
		0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14
	], [
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23,
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23,
		0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14
	], [
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23,
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23,
		0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14
	], [
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23,
		0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14
	], [
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23,
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14
	], [
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x1E, 0x28,
		0x23, 0x1E, 0x19, 0x14, 0x14, 0x1E, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23,
		0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14
	], [
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23,
		0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23,
		0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14
	], [
		0x37, 0x32, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14,
		0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x1E, 0x23, 0x28, 0x2D, 0x32, 0x37, 0x3C, 0x41, 0x46, 0x4B,
		0x50, 0x55, 0x5A, 0x5F, 0x64, 0x69, 0x6E, 0x73, 0x78, 0x7D, 0x82, 0x87, 0x8C, 0x91, 0x96, 0x9B,
		0xA0, 0xA5, 0xAA, 0xAF, 0xB4, 0xB9, 0xBE, 0xC3, 0xC8, 0xCD, 0xD2, 0xD7, 0xDC, 0xE1, 0xE6, 0xEB,
		0xF0, 0xF5, 0xFA, 0xFF, 0x04, 0x09, 0x0E, 0x13, 0x18, 0x1D
	], [
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	],
];

/** X coordinates of the sanctuary location sprites for the sound stone screen
 * Original_Address: $(DOLLAR)C4AC7B
 */
immutable ubyte[8] soundStoneSanctuarySpriteX = [
	0x80,
	0xB8,
	0xC8,
	0xB8,
	0x80,
	0x48,
	0x38,
	0x48,
];

/** Y coordinates of the sanctuary location sprites for the sound stone screen
 * Original_Address: $(DOLLAR)C4AC83
 */
immutable ubyte[8] soundStoneSanctuarySpriteY = [
	0x28,
	0x38,
	0x70,
	0xA8,
	0xB8,
	0xA8,
	0x70,
	0x38,
];

/** First tiles of each sanctuary location sprite for the sound stone screen
 * Original_Address: $(DOLLAR)C4AC8B
 */
immutable ubyte[8] soundStoneSanctuarySprites = [
	0x00,
	0x04,
	0x08,
	0x0C,
	0x44,
	0x40,
	0x48,
	0x4C,
];

/** Sprite palettes to use for the sound stone screen's sanctuary location sprites
 * Original_Address: $(DOLLAR)C4AC93
 */
immutable ubyte[8] soundStoneSanctuaryPalettes = [
	0x01,
	0x04,
	0x04,
	0x02,
	0x02,
	0x01,
	0x02,
	0x03,
];

/** First tiles for each frame of the orbiting orb sprites for each sanctuary location on the sound stone screen
 *
 * Note that 0x100 is always added to this, and a second frame is expected at tile +2
 * Original_Address: $(DOLLAR)C4AC9B
 */
immutable ubyte[8] soundStoneOrbitSprites = [
	0x00,
	0x04,
	0x08,
	0x0C,
	0x24,
	0x20,
	0x28,
	0x2C,
];

/** Palettes used for the orbit sprites for each sanctuary location on the sound stone screen
 * Original_Address: $(DOLLAR)C4ACA3
 */
immutable ubyte[8] soundStoneOrbitPalettes = [
	0x01,
	0x03,
	0x01,
	0x02,
	0x02,
	0x01,
	0x02,
	0x03,
];

/** Music tracks used for each segment of the sound stone screen sequence
 * Original_Address: $(DOLLAR)C4ACAB
 */
immutable ubyte[9] soundStoneMusic = [
	Music.soundstoneRecordingGiantStep,
	Music.soundstoneRecordingLilliputSteps,
	Music.soundstoneRecordingMilkyWell,
	Music.soundstoneRecordingRainyCircle,
	Music.soundstoneRecordingMagnetHill,
	Music.soundstoneRecordingPinkCloud,
	Music.soundstoneRecordingLumineHall,
	Music.soundstoneRecordingFireSpring,
	Music.soundstoneBGM,
];

/** Length in frames of each segment of the sound stone screen sequence
 *
 * The last entry is used at the end of the sequence when less than 8 melodies have been recorded
 * Original_Address: $(DOLLAR)C4ACB4
 */
immutable short[9] soundStoneMelodyFrames = [
	289,
	210,
	209,
	210,
	210,
	209,
	210,
	210,
	210,
];

/** Event flags determining whether or not each segment of the sound stone sequence is present
 * Original_Address: $(DOLLAR)C4AC83
 */
immutable ushort[8] soundStoneMelodyFlags = [
	EventFlag.powrGian,
	EventFlag.powrLlpt,
	EventFlag.powrMlky,
	EventFlag.powrRain,
	EventFlag.powrMgnt,
	EventFlag.powrPink,
	EventFlag.powrLumi,
	EventFlag.powrFire,
];

/** Plays the sound stone sequence
 * Params:
 * 	cancellable = 1 if the player can interrupt the sequence by pressing buttons, 0 if not
 * Original_Address: $(DOLLAR)C4ACCE
 */
void useSoundStone(short cancellable) {
	// get ready to load
	prepareForImmediateDMA();
	stopMusic();
	// switch to battle display mode, since it's already got what we need. Layer 3 is garbage, but we're not using that anyway
	setBattleModeLayerConfig();
	// load the data we need
	decomp(&soundStoneSpriteTiles[0], &buffer[0]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x2C00, 0x2000, &buffer[0]);
	memcpy(&palettes[8][0], &soundStoneSpritePalettes[0], 0xC0);
	loadTextPalette();
	loadBattleBG(BackgroundLayer.soundStone1, BackgroundLayer.soundStone2, 4);
	memset(&soundStoneSpriteTilemap1, 0, SpriteMap.sizeof);
	memset(&soundStoneSpriteTilemap2, 0, SpriteMap.sizeof);
	// keep the orbiting sprite offscreen until we actually start playing the melodies
	soundStoneSpriteTilemap1.xOffset = 240;
	soundStoneSpriteTilemap1.yOffset = 240;
	soundStoneSpriteTilemap2.xOffset = 248;
	soundStoneSpriteTilemap2.yOffset = 248;
	soundStoneSpriteTilemap1.specialFlags = 0x81;
	soundStoneSpriteTilemap2.specialFlags = 0x80;
	// count the number of recorded melodies, and prepare the states appropriately
	short numMelodiesRecorded = 0;
	for (short i = 0; i < 8; i++) {
		if (getEventFlag(soundStoneMelodyFlags[i]) != 0) {
			soundStonePlaybackState[i].playbackState = SoundStonePlaybackState.present;
			numMelodiesRecorded++;
		} else {
			soundStonePlaybackState[i].playbackState = SoundStonePlaybackState.notPresent;
		}
		soundStonePlaybackState[i].orbitAdjustmentFramesLeft = 1;
		soundStonePlaybackState[i].soundStoneOrbitSpriteFrame = 0;
	}
	// loading done, start fading in
	setForceBlank();
	fadeIn(1, 1);
	// initialize vars
	short soundStoneSpriteUpdateCountdown = 15;
	short soundStoneSpriteFrame = 0;
	short startDelay = 60;
	short framesUntilExit = 0;
	short melodiesPlayed = 0;
	short melodyFramesLeft = 0;
	ushort melody = 0;
	while (true) {
		waitUntilNextFrame();
		short buttonsPressed = padPress[0];
		if ((melodyFramesLeft == 0) && (--startDelay == 0)) {
			// make sure melody and melodiesPlayed both get incremented to 0
			melody = 0xFFFF;
			melodiesPlayed = -1;
			// frame count is decremented after this, so this makes sure things happen this frame instead of next
			melodyFramesLeft = 1;
		}
		if (framesUntilExit != 0) {
			if (--framesUntilExit == 0) {
				break;
			}
		} else if (melodyFramesLeft != 0){
			if (--melodyFramesLeft == 0) {
				if (melody < 8) {
					if (soundStonePlaybackState[melody].playbackState == SoundStonePlaybackState.nowPlaying) {
						soundStonePlaybackState[melody].playbackState = SoundStonePlaybackState.present;
					}
				} else if (melody == 8) { // just played last melody
					// check how many melodies have actually played
					short presentMelodiesPlayed;
					for (presentMelodiesPlayed = cast(short)(melodiesPlayed + 1); presentMelodiesPlayed < 8; presentMelodiesPlayed++) {
						if (soundStonePlaybackState[presentMelodiesPlayed].playbackState != SoundStonePlaybackState.notPresent) {
							break;
						}
					}
					if (presentMelodiesPlayed == 8) {
						framesUntilExit = 150;
					}
				}
				if (++melodiesPlayed < 8) {
					melody = melodiesPlayed;
					if (soundStonePlaybackState[melody].playbackState != SoundStonePlaybackState.notPresent) {
						soundStonePlaybackState[melody].playbackState = SoundStonePlaybackState.nowPlaying;
					} else {
						melody = 8;
					}
					melodyFramesLeft = soundStoneMelodyFrames[melody];
					changeMusic(soundStoneMusic[melody]);
				} else {
					framesUntilExit = 150;
				}
			}
			if (melody < 8) {
				if (melodyFramesLeft == soundStoneMelodyFrames[melody] - 9) {
					musicEffect(cast(short)(numMelodiesRecorded + 8));
				}
			}
		}
		oamClear();
		setSpritemapBank(0x7E);
		for (short i = 0; i < 8; i++) {
			switch (soundStonePlaybackState[i].playbackState) {
				case SoundStonePlaybackState.present:
					soundStoneSpriteTilemap1.firstTile = soundStoneSanctuarySprites[i];
					soundStoneSpriteTilemap1.flags = 0x30;
					renderSpriteToOAM(&soundStoneSpriteTilemap1, soundStoneSanctuarySpriteX[i], soundStoneSanctuarySpriteY[i]);
					break;
				case SoundStonePlaybackState.nowPlaying:
					soundStonePlaybackState[i].soundStoneOrbitSpritePosition2 += 0xCCD;
					if (--soundStonePlaybackState[i].orbitAdjustmentFramesLeft == 0) {
						soundStonePlaybackState[i].orbitAdjustmentFramesLeft = 2;
						version(noUndefinedBehaviour) { // the last frame indexes out of bounds. we fix it by repeating the last frame instead
							if (soundStonePlaybackState[i].soundStoneOrbitSpriteFrame == soundStoneOrbitSpriteDistances[i].length) {
								soundStonePlaybackState[i].soundStoneOrbitSpriteFrame--;
							}
						}
						soundStonePlaybackState[i].soundStoneOrbitSpritePosition1 = soundStoneOrbitSpriteDistances[i][soundStonePlaybackState[i].soundStoneOrbitSpriteFrame++];
						soundStonePlaybackState[i].orbitSpriteFrame = cast(short)(2 - soundStonePlaybackState[i].orbitSpriteFrame);
					}
					soundStoneSpriteTilemap2.firstTile = cast(ubyte)(soundStoneOrbitSprites[i] + soundStonePlaybackState[i].orbitSpriteFrame);
					soundStoneSpriteTilemap2.flags = cast(ubyte)((soundStoneOrbitPalettes[i] << 1) + 0x31);
					if (soundStonePlaybackState[i].soundStoneOrbitSpritePosition1 != 0) {
						// draw the little sprites flying around the current sanctuary location
						renderSpriteToOAM(&soundStoneSpriteTilemap2, cast(short)(soundStoneSanctuarySpriteX[i] + sineMult(soundStonePlaybackState[i].soundStoneOrbitSpritePosition1, cast(ubyte)(soundStonePlaybackState[i].soundStoneOrbitSpritePosition2 >> 8))), cast(short)(soundStoneSanctuarySpriteY[i] + cosineMult(soundStonePlaybackState[i].soundStoneOrbitSpritePosition1, soundStonePlaybackState[i].soundStoneOrbitSpritePosition2 >> 8)));
						renderSpriteToOAM(&soundStoneSpriteTilemap2, cast(short)(soundStoneSanctuarySpriteX[i] + sineMult(soundStonePlaybackState[i].soundStoneOrbitSpritePosition1, cast(ubyte)((soundStonePlaybackState[i].soundStoneOrbitSpritePosition2 >> 8) + 0x80))), cast(short)(soundStoneSanctuarySpriteY[i] + cosineMult(soundStonePlaybackState[i].soundStoneOrbitSpritePosition1, cast(ubyte)((soundStonePlaybackState[i].soundStoneOrbitSpritePosition2 >> 8) + 0x80))));
					}
					soundStoneSpriteTilemap1.firstTile = cast(ubyte)(soundStoneSanctuarySprites[i] + 0x80);
					soundStoneSpriteTilemap1.flags = cast(ubyte)((soundStoneSanctuaryPalettes[i] << 1) + 0x30);
					renderSpriteToOAM(&soundStoneSpriteTilemap1, soundStoneSanctuarySpriteX[i], soundStoneSanctuarySpriteY[i]);
					break;
				default: break;
			}
		}
		if (--soundStoneSpriteUpdateCountdown == 0) {
			soundStoneSpriteUpdateCountdown = 15;
			soundStoneSpriteFrame = (soundStoneSpriteFrame + 1) & 3;
		}
		soundStoneSpriteTilemap2.firstTile = cast(ubyte)((soundStoneSpriteFrame * 2) + 0x40);
		soundStoneSpriteTilemap2.flags = 0x3B;
		renderSpriteToOAM(&soundStoneSpriteTilemap2, 0x80, 0x70);
		updateScreen();
		generateBattleBGFrame(&loadedBGDataLayer1, 0);
		generateBattleBGFrame(&loadedBGDataLayer2, 1);
		if ((cancellable != 0) && ((buttonsPressed & (Pad.b | Pad.a | Pad.x)) != 0)) {
			break;
		}
	}
	fadeOut(1, 1);
	while (fadeParameters.step != 0) {
		waitUntilNextFrame();
	}
	prepareForImmediateDMA();
	setLayerConfig(LayerConfig.all);
	reloadMap();
	fadeIn(1, 1);
}

/** Uploads a full frame of an entity overlay sprite
 * Params:
 * 	vramBase = The base address for this frame
 * 	sprite = The [OverworldSprite] id
 * 	frame = The sprite frame to upload, or 0xFF for no frame
 * Returns: The VRAM address for the next frame to be uploaded to
 * Original_Address: $(DOLLAR)C4B1B8
 */
ushort allocateAndUploadOverlaySprite(ushort vramBase, ushort sprite, ushort frame) {
	if (frame == 0xFF) {
		return vramBase;
	}
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, spriteGroups[sprite].width * 2, vramBase, &sprites[spriteGroups[sprite].sprites[frame].id][0]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, spriteGroups[sprite].width * 2, cast(ushort)(vramBase + 0x100), &sprites[spriteGroups[sprite].sprites[frame].id][spriteGroups[sprite].width]);
	return cast(ushort)(vramBase + spriteGroups[sprite].width);
}

/** Loads overlay sprites into VRAM and initializes the script pointers for all entities
 * Original_Address: $(DOLLAR)C4B26B
 */
void loadOverlaySprites() {
	ushort vramPosition = 0x5600;
	for (short i = 0; i < entityOverlayCount; i++) {
		short vramPosition2 = allocateAndUploadOverlaySprite(vramPosition, entityOverlaySprites[i].spriteID, entityOverlaySprites[i].frame1);
		vramPosition = allocateAndUploadOverlaySprite(vramPosition2, entityOverlaySprites[i].spriteID, entityOverlaySprites[i].frame2);
	}
	for (short i = 0; i < maxEntities; i++) {
		entityMushroomizedOverlayPtrs[i] = &entityOverlayMushroomized[0];
		entitySweatingOverlayPtrs[i] = &entityOverlaySweating[0];
		entityRippleOverlayPtrs[i] = &entityOverlayRipple[0];
		entityBigRippleOverlayPtrs[i] = &entityOverlayBigRipple[0];
	}
}

/** Adjusts the _positioning of a manpu entity being created with respect to its parent entity's size
 * Params:
 * 	positioning = Manpu _positioning style (see [ManpuPositioning])
 * 	parentSize = The size of the parent (see [EntitySize])
 * Original_Address: $(DOLLAR)C4B329
 */
void adjustManpuPositioning(short positioning, short parentSize) {
	switch (positioning) {
		case ManpuPositioning.aboveLeft:
			activeManpuY -= collisionHeights1[parentSize] + 8;
			goto case;
		case ManpuPositioning.left:
			activeManpuX -= collisionWidths[parentSize] - 8;
			break;
		case ManpuPositioning.above:
			activeManpuY -= collisionHeights1[parentSize] - 8;
			goto case;
		case ManpuPositioning.centred: break;
		case ManpuPositioning.aboveLeft2:
			activeManpuY -= collisionHeights1[parentSize] + 8;
			goto case;
		case ManpuPositioning.left2:
			activeManpuX -= collisionWidths[parentSize] + 8;
			break;
		default: break;
	}
}

/** Creates a 'manpu' entity (emotes) and attach it to a parent entity
 * Params:
 * 	parent = Parent entity to attach to
 * 	manpu = Manpu index (see `manpuTable`)
 * Original_Address: $(DOLLAR)C4B3D0
 */
void createManpu(short parent, short manpu) {
	if (parent == -1) {
		return;
	}
	if (entityScriptTable[parent] == -1) {
		return;
	}
	activeManpuX = entityAbsXTable[parent];
	activeManpuY = entityAbsYTable[parent];
	adjustManpuPositioning(manpuTable[manpu].positioning, entitySizes[parent]);
	activeManpuX += manpuTable[manpu].relX;
	activeManpuY += manpuTable[manpu].relY;
	short manpuEntity = createOverworldEntity(manpuTable[manpu].sprite, ActionScript.unknown785, -1, activeManpuX, activeManpuY);
	entityDrawPriority[manpuEntity] = cast(ushort)(parent | DrawPriority.parent | DrawPriority.dontClearIfParent);
	entitySurfaceFlags[manpuEntity] = entitySurfaceFlags[parent];
}

/** Deletes all manpu attached to the given entity
 * Params:
 * 	parent = The entity whose manpu children should be deleted
 * Original_Address: $(DOLLAR)C4B4BE
 */
void deleteManpu(short parent) {
	if (parent == -1) {
		return;
	}
	for (short i = 0; i < maxEntities; i++) {
		if (entityDrawPriority[i] == (parent | DrawPriority.parent | DrawPriority.dontClearIfParent)) {
			entityDrawPriority[i] = 0;
			deleteOverworldEntity(i);
		}
	}
}

/** Creates a manpu entity for a party member
 * Params:
 * 	partyMember = Character ID
 * 	manpu = Manpu ID
 * Original_Address: $(DOLLAR)C4B4FE
 */
void createManpuByPartyMember(short partyMember, short manpu) {
	createManpu(findEntityByPartyMemberID(partyMember), manpu);
}

/** Creates a manpu entity for a matching NPC
 * Params:
 * 	npc = NPC ID
 * 	manpu = Manpu ID
 * Original_Address: $(DOLLAR)C4B524
 */
void createManpuByNPCID(short npc, short manpu) {
	createManpu(findEntityByNPCID(npc), manpu);
}

/** Deletes all manpu entities attached to a party member
 * Params:
 * 	partyMember = Character ID
 * Original_Address: $(DOLLAR)C4B519
 */
void deleteManpuByPartyMember(short partyMember) {
	deleteManpu(findEntityByPartyMemberID(partyMember));
}

/** Deletes all manpu entities attached to a matching NPC
 * Params:
 * 	npc = NPC ID
 * Original_Address: $(DOLLAR)C4B53F
 */
void deleteManpuByNPCID(short npc) {
	deleteManpu(findEntityByNPCID(npc));
}

/** Creates a manpu entity for an entity with a matching sprite
 * Params:
 * 	sprite = Sprite ID
 * 	manpu = Manpu ID
 * Original_Address: $(DOLLAR)C4B54A
 */
void createManpuBySprite(short sprite, short manpu) {
	createManpu(findEntityBySprite(sprite), manpu);
}

/** Deletes all manpu entities attached to an entity with a matching sprite
 * Params:
 * 	sprite = Sprite ID
 * Original_Address: $(DOLLAR)C4B565
 */
void deleteManpuBySprite(short sprite) {
	deleteManpu(findEntityBySprite(sprite));
}

/** Reserves some memory from the pathfinding heap
 *
 * Does not check for overflow.
 * Params:
 * 	inc = Amount of memory to reserve
 * Returns: A pointer to the newly-reserved memory
 * Original_Address: $(DOLLAR)C4B587
 */
void* pathSbrk(size_t inc) {
	void *ptr = pathHeapCurrent;
	pathHeapCurrent = cast(byte*)pathHeapCurrent + inc;
	return ptr;
}

/** Get size of memory reserved from the pathfinding heap
 * Returns: Amount of memory in bytes
 * Original_Address: $(DOLLAR)C4B595
 */
ushort pathGetHeapSize() {
	return cast(ushort)(cast(byte*)pathHeapCurrent - cast(byte*)pathHeapStart);
}

/** Finds a path from pathers to targets
 * Params:
 * 	heapSize = Size of the heap used for allocation of various temporary arrays/structs
 * 	heapStart = Pointer to the start of the heap
 * 	matrixDimensions = Pointer to a VecYX struct containing the pathfinding matrix dimensions
 * 	matrix = pointer to the pathfinding matrix
 * 	borderSize = Size of the border used for the start positions of offscreen targets
 * 	targetCount = Amount of VecYX elements in the `targetsPos` array
 * 	targetsPos = Array of VecYX containing the positions of the targets
 * 	patherCount = Amount of Pather elements in the `pathers` array
 * 	pathers = Array of Pather for the pathfinding objects
 * 	maxIterations = Maximum number of painting iterations, for setting an upper bound on execution time
 * 	maxPoints = maximum number of points to generate in matrix
 * 	radius = Distance from the center of the pathfinding matrix to the edge
 * Returns: Number of paths found
 * Original_Address: $(DOLLAR)C4B59F
**/
ushort pathMain(ushort heapSize, void* heapStart, VecYX* matrixDimensions, ubyte* matrix, ushort borderSize, ushort targetCount, VecYX* targetsPos, ushort patherCount, Pather* pathers, ushort maxIterations, ushort maxPoints, ushort radius) {
	debug(pathing) {
		import std.stdio;
		writeln(heapSize, ", ", *matrixDimensions, ", ", borderSize, ", ", targetCount, ", ", *targetsPos, ", ", patherCount, ", ", *pathers, ", ", maxIterations, ", ", maxPoints, ", ", radius);
	}
	ushort successes = 0;

	pathHeapStart = heapStart;
	pathHeapCurrent = heapStart;
	pathHeapEnd = cast(byte*)heapStart + heapSize;

	pathMatrixRows = matrixDimensions.y;
	pathMatrixColumns = matrixDimensions.x;
	pathMatrixBorder = borderSize;
	pathMatrixSize = cast(ushort)(pathMatrixRows * pathMatrixColumns);
	pathMatrixBuffer = matrix;

	// allocates n + 1 offsets to work around a bug in matrix painting
	ushort* offsetBuffer = cast(ushort*)pathSbrk((radius + 1) * ushort.sizeof);
	pathSearchTempStart = offsetBuffer;
	pathSearchTempEnd = offsetBuffer + radius;
	pathSearchTempA = offsetBuffer;
	pathSearchTempB = offsetBuffer;

	pathCardinalOffset[PathCardinal.north] = cast(short)-pathMatrixColumns;
	pathCardinalOffset[PathCardinal.east] = 1;
	pathCardinalOffset[PathCardinal.south] = pathMatrixColumns;
	pathCardinalOffset[PathCardinal.west] = -1;

	// NORTH
	pathCardinalIndex[PathCardinal.north].y = -1;
	pathCardinalIndex[PathCardinal.north].x = 0;
	// EAST
	pathCardinalIndex[PathCardinal.east].y = 0;
	pathCardinalIndex[PathCardinal.east].x = 1;
	// SOUTH
	pathCardinalIndex[PathCardinal.south].y = 1;
	pathCardinalIndex[PathCardinal.south].x = 0;
	// WEST
	pathCardinalIndex[PathCardinal.west].y = 0;
	pathCardinalIndex[PathCardinal.west].x = -1;

	// NORTHEAST
	pathDiagonalIndex[PathDiagonal.northEast].y = -1;
	pathDiagonalIndex[PathDiagonal.northEast].x = 1;
	// SOUTHEAST
	pathDiagonalIndex[PathDiagonal.southEast].y = 1;
	pathDiagonalIndex[PathDiagonal.southEast].x = 1;
	// SOUTHWEST
	pathDiagonalIndex[PathDiagonal.southWest].y = 1;
	pathDiagonalIndex[PathDiagonal.southWest].x = -1;
	// NORTHWEST
	pathDiagonalIndex[PathDiagonal.northWest].y = -1;
	pathDiagonalIndex[PathDiagonal.northWest].x = -1;

	if (maxPoints >= 251) {
		maxPoints = 251;
	}

	Pather **tempPathers = cast(Pather**)pathSbrk(patherCount * Pather.sizeof);
	initializePathers(patherCount, pathers, tempPathers);

	// Allocate space on heap for initial path points
	VecYX* points = cast(VecYX*)pathSbrk(maxPoints * VecYX.sizeof);
	assert(points);
	initializePathMatrix();

	ushort y = 0;
	ushort x = 0;
	for (ushort i = 0; i < patherCount; i++) {
		Pather* tempPather = tempPathers[i];
		Pather* tempPatherBackup = tempPather;

		if ((tempPather.hitbox.y != y) || (tempPather.hitbox.x != x)) {
			ushort matching = 1;
			y = tempPather.hitbox.y;
			x = tempPather.hitbox.x;

			for (ushort j = cast(short)(i + 1); j < patherCount; j++) {
				if ((tempPathers[j].hitbox.y != y) || (tempPathers[j].hitbox.x != x)) {
					break;
				}

				matching++;
			}

			paintPathMatrixPass1(matching, &tempPathers[i]);
			paintPathMatrixPass2(targetCount, targetsPos, tempPather, matching, maxPoints, maxIterations);
		}

		tempPather.initialPointCount = pathBuildPathPoints(&tempPather.origin, maxPoints, points);
		ushort finalPointCount = pathTrimRedundancies(cast(ushort)tempPather.initialPointCount, points);

		VecYX* finalPathPoints = cast(VecYX*)pathSbrk(finalPointCount * VecYX.sizeof);

		for (ushort j = 0; j < finalPointCount; ++j) {
			finalPathPoints[j].y = points[j].y;
			finalPathPoints[j].x = points[j].x;
		}

		tempPather = tempPatherBackup;
		tempPather.pointCount = finalPointCount;
		tempPather.points = finalPathPoints;

		// if we have path points, we have a valid path
		if (finalPointCount) {
			++successes;
		}
	}
	return successes;
}

unittest {
	PathCtx pathState;
	pathState.radius = VecYX(64, 64);
	pathState.targetsPos[0] = VecYX(32, 32);
	pathState.targetCount = 1;
	pathState.patherCount = 4;
	auto points1 = [VecYX(32, 34), VecYX(32, 32), VecYX(32, 32), VecYX(32, 35), VecYX(32, 32)];
	auto points2 = [VecYX(41, 23), VecYX(38, 26), VecYX(38, 29), VecYX(35, 32), VecYX(32, 32)];
	auto points3 = [VecYX(31, 32), VecYX(32, 32), VecYX(0, 0), VecYX(0, 0)];
	pathState.pathers[0] = Pather(0, VecYX(1, 2), VecYX(46, 17), 2, &points1[0], 3, 6);
	pathState.pathers[1] = Pather(0, VecYX(1, 2), VecYX(37, 25), 5, &points2[0], 0, 7);
	pathState.pathers[2] = Pather(0, VecYX(1, 2), VecYX(44, 18), 2, &points3[0], 2, 9);
	pathState.pathers[3] = Pather(0, VecYX(1, 2), VecYX(32, 31), 0, null, 0, 10);
	auto heap = new ubyte[](0xC00);
	ubyte[] buffer = (cast(immutable(ubyte[]))import("examplepathfinding.bin")).dup;
	assert(pathMain(cast(short)heap.length, &heap[0], &pathState.radius, &buffer[0], 4, 1, &pathState.targetsPos[0], 4, &pathState.pathers[0], 0xFFFF, 64, 50) == 4);
	assert(pathState.pathers[0].points[0 .. pathState.pathers[0].pointCount] == [VecYX(46, 17), VecYX(32, 31), VecYX(32, 32)]);
	assert(pathState.pathers[1].points[0 .. pathState.pathers[1].pointCount] == [VecYX(37, 25), VecYX(32, 30), VecYX(32, 32)]);
	assert(pathState.pathers[2].points[0 .. pathState.pathers[2].pointCount] == [VecYX(44, 18), VecYX(32, 30), VecYX(32, 32)]);
	assert(pathState.pathers[3].points[0 .. pathState.pathers[3].pointCount] == [VecYX(32, 31), VecYX(32, 32)]);
}

/** Adds an impassible border at the perimeter of the pathfinding matrix
 * Original_Address: $(DOLLAR)C4B7A5
 */
void initializePathMatrix() {
	for (short i = 0; i < pathMatrixRows; ++i) {
		pathMatrixBuffer[pathMatrixColumns * i + pathMatrixColumns - 1] = PathfindingTile.unwalkable;
		pathMatrixBuffer[pathMatrixColumns  * i] = PathfindingTile.unwalkable;
	}

	for (short i = 0; i < pathMatrixColumns; ++i) {
		pathMatrixBuffer[(pathMatrixRows - 1) * pathMatrixColumns + i] = PathfindingTile.unwalkable;
		pathMatrixBuffer[i] = PathfindingTile.unwalkable;
	}
}

/** Initializes the pather array with a sorted shallow copy of the input pathers
 * Params:
 * 	patherCount = length of pather arrays, both input and output
 * 	inPathers = input pather array
 * 	outPathers = output pather array
 * Original_Address: $(DOLLAR)C4B859
 */
void initializePathers(ushort patherCount, Pather* inPathers, Pather** outPathers) {
	for (short i = 0; i < patherCount; i++) {
		outPathers[i] = &inPathers[i];
	}

	if (patherCount <= 1) return;

	for (short i = 0; i < patherCount - 1; ++i) {
		ushort minY = 0xFFFF;
		ushort minX = 0xFFFF;
		ushort minIndex;

		for (short j = i; j < patherCount; j++) {
			bool isMinimum;
			if (outPathers[j].hitbox.y != minY) {
				isMinimum = (outPathers[j].hitbox.y < minY);
			} else {
				isMinimum = (outPathers[j].hitbox.x < minX);
			}

			// Should be always true for the first iteration
			if (isMinimum) {
				minY = outPathers[j].hitbox.y;
				minX = outPathers[j].hitbox.x;
				minIndex = j;
			}
		}

		Pather* tmpPather = outPathers[i];
		outPathers[i] = outPathers[minIndex];
		outPathers[minIndex] = tmpPather;
	}
}

/** Pass 1 of path matrix painting: all non-solid points are marked unpainted, and start points are set up for all pathers
 * Params:
 * 	count = number of pathers
 * 	pathers = array of pathers with single origin points or the 'fromOffscreen' flag set
 * Original_Address: $(DOLLAR)C4B923
 */
void paintPathMatrixPass1(ushort count, Pather** pathers)
	in(pathMatrixBuffer)
{
	for (ushort i = 0; i < pathMatrixSize; i++) {
		if (pathMatrixBuffer[i] != PathfindingTile.unwalkable) {
			pathMatrixBuffer[i] = PathfindingTile.unpainted;
		}
	}

	for (ushort i = 0; i < count; i++) {
		Pather* pather = pathers[i];

		if (pather.fromOffscreen == 0) {
			// Starting point is the same as current position
			if (pathMatrixBuffer[(pathMatrixColumns * pather.origin.y) + pather.origin.x] != PathfindingTile.unwalkable) {
				pathMatrixBuffer[(pathMatrixColumns * pather.origin.y) + pather.origin.x] = PathfindingTile.target;
			}
		} else {
			// Starting from offscreen
			for (ushort j = 0; j < pathMatrixBorder; j++) {
				for (ushort k = 0; k < pathMatrixColumns; ++k) {
					if (pathMatrixBuffer[(j * pathMatrixColumns) + k] != PathfindingTile.unwalkable) {
						pathMatrixBuffer[(j * pathMatrixColumns) + k] = PathfindingTile.target;
					}
				}
			}

			for (ushort j = cast(ushort)(pathMatrixRows - pathMatrixBorder); j < pathMatrixRows; j++) {
				for (ushort k = 0; k < pathMatrixColumns; ++k) {
					if (pathMatrixBuffer[(j * pathMatrixColumns) + k] != PathfindingTile.unwalkable) {
						pathMatrixBuffer[(j * pathMatrixColumns) + k] = PathfindingTile.target;
					}
				}
			}

			for (ushort j = 0; j < pathMatrixBorder; ++j) {
				for (ushort k = 0; k < pathMatrixRows; k++) {
					if (pathMatrixBuffer[(k * pathMatrixColumns) + j] != PathfindingTile.unwalkable) {
						pathMatrixBuffer[(k * pathMatrixColumns) + j] = PathfindingTile.target;
					}
				}
			}

			for (ushort j = 0; j < pathMatrixColumns - pathMatrixBorder; ++j) {
				for (ushort k = 0; k < pathMatrixRows; k++) {
					if (pathMatrixBuffer[(k * pathMatrixColumns) + j] != PathfindingTile.unwalkable) {
						pathMatrixBuffer[(k * pathMatrixColumns) + j] = PathfindingTile.target;
					}
				}
			}

			pather.origin.y = 0;
			pather.origin.x = 0;
		}
	}
}

unittest {
	pathMatrixBuffer = &(cast(immutable(ubyte[]))import("paintPathMatrixPass1sample1.bin")).dup[0];
	pathMatrixRows = 64;
	pathMatrixColumns = 64;
	pathMatrixBorder = 4;
	pathMatrixSize = 4096;
	Pather*[4] pathers = [
		new Pather(0, VecYX(1, 2), VecYX(44, 10), 0, null, 0, 0),
		new Pather(0, VecYX(1, 2), VecYX(32, 33), 0, null, 0, 5),
		new Pather(0, VecYX(1, 2), VecYX(33, 36), 0, null, 0, 9),
		new Pather(0, VecYX(1, 2), VecYX(27, 41), 0, null, 0, 10),
	];
	paintPathMatrixPass1(4, &pathers[0]);
	assert(pathMatrixBuffer[0 .. 0x1000] == cast(immutable(ubyte[]))import("paintPathMatrixPass1sample1output.bin"));
}

/** Paints the path matrix with distances to targets
 * Params:
 * 	targetCount = Number of targets
 * 	targetsPos = Target positions
 * 	pather = Pathfinding struct
 * 	maxTargets = Maximum number of targets to reach
 * 	maxDistance = Maximum distance to paint
 * 	maxIterations = Maximum number of iterations to perform
 * Original_Address: $(DOLLAR)C4BAF6
 */
void paintPathMatrixPass2(ushort targetCount, VecYX* targetsPos, Pather* pather, ushort maxTargets, ushort maxDistance, ushort maxIterations)
	in(pathSearchTempStart)
{
	ushort targetsHit = 0;
	ushort iterations = 0;

	pathSearchTempB = pathSearchTempStart;
	pathSearchTempA = pathSearchTempStart;

	for (short i = 0; i < targetCount; i++) {
		*pathSearchTempB = cast(ushort)((targetsPos[i].y * pathMatrixColumns) + targetsPos[i].x);
		pathSearchTempB = (pathSearchTempB == pathSearchTempEnd) ? pathSearchTempStart : pathSearchTempB + 1;
	}

	while (pathSearchTempA != pathSearchTempB) {
		ushort currentBufferPosition = *pathSearchTempA;

		pathSearchTempA = (pathSearchTempA == pathSearchTempEnd) ? pathSearchTempStart : pathSearchTempA + 1;

		ubyte tileValue = pathMatrixBuffer[currentBufferPosition];
		if (tileValue < PathfindingTile.unpainted) {
			// leave already-painted areas alone
			continue;
		}

		bool startingPointClear = true;
		ushort tempBufferPosition = currentBufferPosition;

		// detect starting points that start on unwalkable areas
		outer: for (short i = 0; i < pather.hitbox.y; tempBufferPosition += pathMatrixColumns, i++) {
			for (short j = 0; j < pather.hitbox.x; j++) {
				if (pathMatrixBuffer[tempBufferPosition + j] == PathfindingTile.unwalkable) {
					startingPointClear = 0;
					break outer;
				}
			}
		}

		if (!startingPointClear) {
			// starting point wasn't clear of obstacles, so mark it as invalid
			pathMatrixBuffer[currentBufferPosition] = PathfindingTile.invalid;
		} else {
			// found a target?
			if (tileValue == PathfindingTile.target) {
				++targetsHit;
				if (pather.fromOffscreen) {
					// since offscreen targets don't start with a set of coordinates, set them now
					pather.origin.y = cast(short)(tempBufferPosition / pathMatrixColumns);
					pather.origin.x = cast(short)(tempBufferPosition % pathMatrixColumns);
				}
			}

			tileValue = PathfindingTile.invalid;

			// add next points to queue
			for (short i = PathCardinal.north; i < PathCardinal.max + 1; i++) {
				ushort newBufferPosition = cast(ushort)(currentBufferPosition + pathCardinalOffset[i]);
				ubyte candidateTile = pathMatrixBuffer[newBufferPosition];
				// found unpainted tile?
				if (candidateTile >= PathfindingTile.unpainted) {
					bool queueFull;
					if (pathSearchTempA == pathSearchTempStart) {
						queueFull = (pathSearchTempB == pathSearchTempEnd);
					} else {
						queueFull = (pathSearchTempB + 1 == pathSearchTempA);
					}

					// add new point if we have space for it
					if (!queueFull) {
						*pathSearchTempB = newBufferPosition;
						pathSearchTempB = (pathSearchTempB == pathSearchTempEnd) ? pathSearchTempStart : pathSearchTempB + 1;
					}
				} else if (tileValue > candidateTile) {
					// we've seen this tile before, but it's less than what we're currently using, so use it as a shortcut
					tileValue = candidateTile;
				}
			}

			// write tile
			if (tileValue == PathfindingTile.invalid) {
				pathMatrixBuffer[currentBufferPosition] = 0;
			} else {
				ubyte newValue = cast(ubyte)(tileValue + 1);
				pathMatrixBuffer[currentBufferPosition] = newValue;

				if (newValue == maxDistance) {
					for (short i = 0; i < 4; i++) {
						if (pathMatrixBuffer[currentBufferPosition + pathCardinalOffset[i]] >= PathfindingTile.unpainted) { // if PathfindingTile.unpainted or PathfindingTile.target
							pathMatrixBuffer[currentBufferPosition + pathCardinalOffset[i]] = PathfindingTile.invalid;
						}
					}
				}
			}

			// exit if we met our requirements
			if ((maxIterations <= ++iterations) || (targetsHit == maxTargets)) {
				break;
			}
		}
	}
}

unittest {
	auto buffer = (cast(immutable(ubyte[]))import("paintPathMatrixPass1sample1output.bin")).dup;
	pathMatrixBuffer = &buffer[0];
	pathMatrixRows = 64;
	pathMatrixColumns = 64;
	pathMatrixBorder = 4;
	pathMatrixSize = 4096;
	auto pathSearchBuffer = new ushort[](64 + 1);
	pathSearchTempStart = &pathSearchBuffer[0];
	pathSearchTempEnd = &pathSearchBuffer[50];
	auto pather = Pather(0, VecYX(1, 2), VecYX(44, 10), 0, null, 0, 0);
	auto targets = [
		VecYX(32, 32),
		VecYX(32, 30),
		VecYX(32, 29),
		VecYX(32, 27),
		VecYX(34, 26),
	];
	pathCardinalOffset = [-64, 1, 64, -1];
	paintPathMatrixPass2(5, &targets[0], &pather, 4, 64, 0xFFFF);
	assert(buffer == cast(immutable(ubyte[]))import("paintPathMatrixPass2sample1output.bin"));
}

/** Builds a path from a painted path matrix
 *	Params:
 * 	start = Origin point to start the path from
 * 	maxPoints = Maximum length of path
 * 	points = The output buffer for each point in the path. Should be at least maxPoints in length
 * Returns: Actual number of points in path
 * Original_Address: $(DOLLAR)C4BD9A
 */
ushort pathBuildPathPoints(const VecYX *start, ushort maxPoints, VecYX* points)
	in(points)
{
	ushort nextPointY = start.y;
	ushort nextPointX = start.x;
	ushort pathCardinal = PathCardinal.north;

	ubyte pathTile = pathMatrixBuffer[(pathMatrixColumns * nextPointY) + nextPointX];
	// bail early if starting point is invalid
	if (pathTile > PathfindingTile.unknownFB) { // if PathfindingTile.invalid, PathfindingTile.unwalkable, PathfindingTile.unpainted, PathfindingTile.target
		return 0;
	}

	// if maxPoints is 0, we're already done I guess?
	if (maxPoints == 0) {
		return 0;
	}

	// set origin point
	points[0].y = nextPointY;
	points[0].x = nextPointX;


	ushort count = 1;
	// look for tiles with lower values than the current tile
	// once we exhaust the number of candidates or exceed maxPoints, we're done
	while (pathTile != PathfindingTile.clear) {
		ushort selectedCardinalDirection = 666; // Assume we're going to hell
		ushort selectedDiagonalDirection = 666;

		ushort selectedCardinalY;
		ushort selectedCardinalX;
		ushort selectedDiagonalY;
		ushort selectedDiagonalX;

		pathTile--;

		// prefer moving forward to turning, if possible
		ushort cardinalCandidate = pathCardinal;

		// check all four cardinal directions
		for (pathCardinal = PathCardinal.north; pathCardinal < PathCardinal.max + 1; pathCardinal++) {
			// add cardinal vector to last coordinates
			ushort candidateY = cast(ushort)(pathCardinalIndex[cardinalCandidate].y + nextPointY);
			ushort candidateX = cast(ushort)(pathCardinalIndex[cardinalCandidate].x + nextPointX);

			ushort pathCardinalLimited = (cardinalCandidate + 1) & 3;

			// found an adjacent path tile with lower value on a cardinal?
			if (pathMatrixBuffer[(pathMatrixColumns * candidateY) + candidateX] == pathTile) {
				// for cardinals, we only want the first one found
				// but we don't exit early in case we find a cardinal next to a diagonal tile that looks even better
				if (selectedCardinalDirection == 666) {
					selectedCardinalDirection = cardinalCandidate;
					selectedCardinalY = candidateY;
					selectedCardinalX = candidateX;
				}

				// add diagonal vector to last coordinates
				ushort candidateDiagonalY = cast(ushort)(pathDiagonalIndex[cardinalCandidate].y + nextPointY);
				ushort candidateDiagonalX = cast(ushort)(pathDiagonalIndex[cardinalCandidate].x + nextPointX);

				// if the clockwise adjacent tile has an even lower value, prefer that and exit early
				if (pathMatrixBuffer[(pathMatrixColumns * candidateDiagonalY) + candidateDiagonalX] == pathTile - 1) {
					if (pathMatrixBuffer[(pathMatrixColumns * candidateY) + candidateX] == pathTile) {
						selectedDiagonalDirection = cardinalCandidate;
						selectedDiagonalY = candidateDiagonalY;
						selectedDiagonalX = candidateDiagonalX;
						break;
					}
				}
			}

			cardinalCandidate = pathCardinalLimited;
		}

		// prefer diagonal to cardinal movement, if available
		if (selectedDiagonalDirection != 666) {
			nextPointY = selectedDiagonalY;
			nextPointX = selectedDiagonalX;
			pathCardinal = selectedDiagonalDirection;
			pathTile--;
		} else {
			if (selectedCardinalDirection == 666) {
				// didn't find anywhere better to go, so we're done
				break;
			}

			nextPointY = selectedCardinalY;
			nextPointX = selectedCardinalX;
			pathCardinal = selectedCardinalDirection;
		}

		// bail if we've reached the limit
		if (maxPoints == count) {
			return count;
		}

		points[count].y = nextPointY;
		points[count].x = nextPointX;

		++count;
	}

	return count;
}

unittest {
	auto buffer = (cast(immutable(ubyte[]))import("paintPathMatrixPass2sample1output.bin")).dup;
	pathMatrixBuffer = &buffer[0];
	pathMatrixRows = 64;
	pathMatrixColumns = 64;
	pathMatrixBorder = 4;
	pathMatrixSize = 4096;

	pathCardinalIndex[PathCardinal.north] = VecYX(-1, 0);
	pathCardinalIndex[PathCardinal.east] = VecYX(0, 1);
	pathCardinalIndex[PathCardinal.south] = VecYX(1, 0);
	pathCardinalIndex[PathCardinal.west] = VecYX(0, -1);
	pathDiagonalIndex[PathDiagonal.northEast] = VecYX(-1, 1);
	pathDiagonalIndex[PathDiagonal.southEast] = VecYX(1, 1);
	pathDiagonalIndex[PathDiagonal.southWest] = VecYX(1, -1);
	pathDiagonalIndex[PathDiagonal.northWest] = VecYX(-1, -1);
	VecYX[20] vecBuffer;
	assert(pathBuildPathPoints(new VecYX(44, 10), 64, &vecBuffer[0]) == 0);
	assert(vecBuffer[0 .. pathBuildPathPoints(new VecYX(32, 33), 64, &vecBuffer[0])] == [VecYX(32, 33), VecYX(32, 32)]);
	assert(vecBuffer[0 .. pathBuildPathPoints(new VecYX(33, 36), 64, &vecBuffer[0])] == [VecYX(33, 36), VecYX(32, 36), VecYX(32, 35), VecYX(32, 34), VecYX(32, 33), VecYX(32, 32)]);
	assert(vecBuffer[0 .. pathBuildPathPoints(new VecYX(27, 41), 64, &vecBuffer[0])] == [VecYX(27, 41), VecYX(28, 40), VecYX(29, 39), VecYX(30, 38), VecYX(31, 37), VecYX(32, 36), VecYX(32, 35), VecYX(32, 34), VecYX(32, 33), VecYX(32, 32)]);
}

/** Removes redundant points in a path
 *
 * Redundancies here are any points that don't come with a change in direction. This assumes that each point has an equal distance from the ones before and after.
 * Params:
 * 	count = Original number of points in path
 * 	points = The actual points in the path
 * Returns: The new number of points in the path
 * Original_Address: $(DOLLAR)C4BF7F
 */
ushort pathTrimRedundancies(ushort count, VecYX* points) {
	// need at least 3 points to do anything useful
	if (count >= 3) {
		short startY = points[1].y;
		short startX = points[1].x;

		short yDistance = cast(short)(startY - points[0].y);
		short xDistance = cast(short)(startX - points[0].x);
		// the 0th point is the origin, don't touch that
		ushort rewriteIndex = 1;

		for (ushort i = 2; i != count; ++i) {
			short nextY = points[i].y;
			short nextX = points[i].x;

			// test if we're moving in the same direction as the last two points. if so, cut out the middle point
			if ((startY + yDistance == nextY) && (startX + xDistance == nextX)) {
				points[rewriteIndex].y = nextY;
				points[rewriteIndex].x = nextX;
			} else {
				++rewriteIndex;
				points[rewriteIndex].y = nextY;
				points[rewriteIndex].x = nextX;

				yDistance = cast(short)(nextY - startY);
				xDistance = cast(short)(nextX - startX);
			}

			startY = nextY;
			startX = nextX;
		}

		count = cast(ushort)(rewriteIndex + 1);
	}

	return count;
}

unittest {
	VecYX[20] vecBuffer;
	assert(vecBuffer[0 .. pathTrimRedundancies(0, &vecBuffer[0])] == []);

	vecBuffer[0 .. 2] = [VecYX(32, 33), VecYX(32, 32)];
	assert(vecBuffer[0 .. pathTrimRedundancies(2, &vecBuffer[0])] == [VecYX(32, 33), VecYX(32, 32)]);

	vecBuffer[0 .. 6] = [VecYX(33, 36), VecYX(32, 36), VecYX(32, 35), VecYX(32, 34), VecYX(32, 33), VecYX(32, 32)];
	assert(vecBuffer[0 .. pathTrimRedundancies(6, &vecBuffer[0])] == [VecYX(33, 36), VecYX(32, 36), VecYX(32, 32)]);

	vecBuffer[0 .. 10] = [VecYX(27, 41), VecYX(28, 40), VecYX(29, 39), VecYX(30, 38), VecYX(31, 37), VecYX(32, 36), VecYX(32, 35), VecYX(32, 34), VecYX(32, 33), VecYX(32, 32)];
	assert(vecBuffer[0 .. pathTrimRedundancies(10, &vecBuffer[0])] == [VecYX(27, 41), VecYX(32, 36), VecYX(32, 32)]);
}

/// $C4C05E
immutable ubyte[16] fileSelectTextStartNewGame = ebString(": Start New Game");

immutable ubyte[6] fileSelectTextLevel = ebString("Level:");

immutable ubyte[11] fileSelectTextTextSpeed = ebString("Text Speed:");

version(configurable) {
	immutable ubyte[8][4] fileSelectTextTextSpeedStrings = [
		ebString!8("Instant"),
		ebString!8("Fast"),
		ebString!8("Medium"),
		ebString!8("Slow"),
	];
} else {
	immutable ubyte[7][3] fileSelectTextTextSpeedStrings = [
		ebString!7("Fast"),
		ebString!7("Medium"),
		ebString!7("Slow"),
	];
}

immutable ubyte[9] fileSelectTextContinue = ebStringz("Continue");

immutable ubyte[5] fileSelectTextCopy = ebStringz("Copy");

immutable ubyte[7] fileSelectTextDelete = ebStringz("Delete");

immutable ubyte[7] fileSelectTextSetUp = ebStringz("Set Up");

immutable ubyte[14] fileSelectTextCopyToWhere = ebString!14("Copy to where?");

immutable ubyte[32] fileSelectTextAreYouSureDelete = ebString!32("Are you sure you want to delete?");

immutable ubyte[3] fileSelectTextAreYouSureDeleteNo = ebStringz("No");

immutable ubyte[4] fileSelectTextAreYouSureDeleteYes = ebStringz("Yes");

immutable ubyte[25] fileSelectTextSelectTextSpeed = ebString!25("Please select text speed.");

immutable ubyte[28] fileSelectTextSelectSoundSetting = ebString!28("Please select sound setting.");

immutable ubyte[7][2] fileSelectTextSoundSettingStrings = [
	ebString!7("Stereo"),
	ebString!7("Mono"),
];

immutable ubyte[37] fileSelectTextWhichStyle = ebString!37("Which style of windows do you prefer?");

immutable ubyte[13] fileSelectTextFlavorPlain = ebStringz("Plain flavor");

immutable ubyte[12] fileSelectTextFlavorMint = ebStringz("Mint flavor");

immutable ubyte[18] fileSelectTextFlavorStrawberry = ebStringz("Strawberry flavor");

immutable ubyte[14] fileSelectTextFlavorBanana = ebStringz("Banana flavor");

immutable ubyte[14] fileSelectTextFlavorPeanut = ebStringz("Peanut flavor");

immutable ubyte[40][7] fileSelectTextPleaseNameThemStrings = [
	ebString!40("Please name him."),
	ebString!40("Name her, too."),
	ebString!40("Name your friend."),
	ebString!40("Name another friend."),
	ebString!40("Name your pet."),
	ebString!40("Favorite homemade food?"),
	ebString!40("What's your favorite thing?"),
];

immutable ubyte[14] fileSelectTextFavoriteFood =ebString!14("Favorite food:");

immutable ubyte[14] fileSelectTextCoolestThing =ebString!14("Coolest thing:");

immutable ubyte[13] fileSelectTextAreYouSure =ebString!13("Are you sure?");

immutable ubyte[4] fileSelectTextAreYouSureYep = ebStringz("Yep");

immutable ubyte[5] fileSelectTextAreYouSureNope = ebStringz("Nope");

/** Loads graphics, changes music and reinitializes the text system for the game over screen
 * Original_Address: $(DOLLAR)C4C2DE
 */
void loadGameOverScreen() {
	if (partyMembersAliveOverworld == 0) {
		changeMusic(Music.youLose);
		fadeOutWithMosaic(1, 1, 0);
	}
	loadedAnimatedTileCount = 0;
	mapPaletteAnimationLoaded = 0;
	itemTransformationsLoaded = 0;
	setBGMODE(BGMode.mode1 | BG3Priority);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	decomp(&gameOverTiles[0], &buffer[0]);
	if (gameState.partyMembers[0] == 3) {
		copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x8000, 0, &buffer[0x8000]);
	} else {
		copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x8000, 0, &buffer[0]);
	}
	decomp(&gameOverTilemap[0], &buffer[0]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x800, 0x5800, &buffer[0]);
	decomp(&gameOverPalette[0], cast(ubyte*)&palettes[0][0]);
	memcpy(&palettes[7][0], &palettes[0][0], 0x20);
	memset(&palettes[1][0], 0, 0xC0);
	memcpy(&palettes[2][0], &palettes[7][0], 0x20);
	initializeTextSystem();
	prepareWindowGraphics();
	loadWindowGraphics(WindowGraphicsToLoad.all);
	loadTextPalette();
	preparePaletteUpload(PaletteUpload.full);
	mirrorTM = TMTD.bg3 | TMTD.bg1;
	partyMembersAliveOverworld = 0;
	bg2YPosition = 0;
	bg2XPosition = 0;
	bg1XPosition = 0;
	bg1XPosition = 0;
	fadeIn(1, 1);
	waitForFadeToFinishNoActionScript();
}

/** Copies the current palette into the fade buffers for smooth fading between game over frames
 * Params:
 * 	animFrame = The frame of the game over screen animation to display
 * Original_Address: $(DOLLAR)C4C45F
 */
void setGameOverFadeTargetPalette(short animFrame) {
	ushort* paletteBuf = &paletteAnimTargetPalette()[0];
	// Initialize with current palettes
	memcpy(paletteBuf, &palettes[2][0], 0xC0);
	// Set the target for the current animation frame to the actual palette
	memcpy(paletteBuf + (animFrame * 16), &palettes[7][0], 0x20);
	// Set the target for the previous animation frame to black
	memcpy(paletteBuf + ((animFrame - 1) * 16), &palettes[6][0], 0x20);
}

/** Handles a frame of the game over respawn animation and its fade
 * Params:
 * 	animFrame = The frame of tbe game over screen animation to display
 * 	fadeDuration = How long the fade lasts in frames
 * Returns: Non-zero if any buttons are pressed, 0 otherwise
 * Original_Address: $(DOLLAR)C4C519
 */
short doGameOverPaletteFade(short animFrame, short fadeDuration) {
	setGameOverFadeTargetPalette(animFrame);
	initializeMapPaletteFade(fadeDuration);
	while (fadeDuration != 0) {
		if (padPress[0] != 0) {
			return -1;
		}
		stepMapPaletteFade();
		waitUntilNextFrame();
		fadeDuration--;
	}
	memcpy(&palettes[2][0], &paletteAnimTargetPalette()[0], 0xC0);
	return 0;
}

/** Wait for up to a specified duration, but exit early if player presses any buttons
 * Params:
 * 	duration = Number of frames to wait
 * Returns: Non-zero if any buttons are pressed, 0 otherwise
 * Original_Address: $(DOLLAR)C4C567
 */
short skippablePause(short duration) {
	while (duration != 0) {
		if (padPress[0] != 0) {
			return -1;
		}
		waitUntilNextFrame();
		duration--;
	}
	return 0;
}

/** Do a quick fade to white so the game over screen can reload the map
 * Params:
 * 	duration = Length of fade in frames
 * Original_Address: $(DOLLAR)C4C58F
 */
void gameOverFadeToWhite(short duration) {
	multiplyPalettes(100, &palettes[0][0]);
	prepareLoadedPaletteFadeTables(duration, PaletteMask.all);
	for (short i = 0; i < duration; i++) {
		updatePaletteFade();
		waitUntilNextFrame();
	}
	memset(&palettes[0][0], 0xFF, 0x200);
	preparePaletteUpload(PaletteUpload.full);
	waitUntilNextFrame();
}

/** Do a quick fade transition from end of game over to overworld
 *
 * Note that the player has control while this happens
 * Params:
 * 	duration = Length of fade in frames
 * Original_Address: $(DOLLAR)C4C60E
 */
void gameOverFadeToMap(short duration) {
	prepareLoadedPaletteFadeTables(duration, PaletteMask.all);
	for (short i = 0; i < duration; i++) {
		updatePaletteFade();
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
	finishPaletteFade();
}

/** Asks the player if they want to try again and handles the interruptable revival animation
 * Returns: 0 if reviving, non-zero otherwise
 * Original_Address: $(DOLLAR)C4C64D
 */
short gameOverPrompt() {
	skippablePause(0x3C);
	displayText(getTextBlock("MSG_SYS_COMEBACK"));
	closeAllWindowsAndHPPP();
	if (getEventFlag(EventFlag.sysComeBack) == 0) {
		skippablePause(0x3C);
		return -1;
	}
	if (skippablePause(0x3C) != 0) {
		return 0;
	}
	if (doGameOverPaletteFade(1, 0x5A) != 0) {
		return 0;
	}
	if (skippablePause(1) != 0) {
		return 0;
	}
	if (doGameOverPaletteFade(2, 0x5A) != 0) {
		return 0;
	}
	if (skippablePause(1) != 0) {
		return 0;
	}
	if (doGameOverPaletteFade(3, 0x5A) != 0) {
		return 0;
	}
	if (skippablePause(1) != 0) {
		return 0;
	}
	if (doGameOverPaletteFade(4, 8) != 0) {
		return 0;
	}
	return 0;
}

/** Tries to respawn the player after a game over
 * Returns: 0 if player chose to try again, 1 otherwise
 * Original_Address: $(DOLLAR)C4C718
 */
short respawn() {
	freezeEntities();
	loadGameOverScreen();
	short result = gameOverPrompt();
	if (result != 0) {
		fadeOutWithMosaic(2, 1, 0);
		unfreezeEntities();
		return result;
	}
	gameOverFadeToWhite(32);
	musicEffect(MusicEffect.quickFade);
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	loadedMapTileCombo = -1;
	currentMapMusicTrack = -1;
	currentMusicTrack = 0xFFFF;
	wipePalettesOnMapLoad = 1;
	waitUntilNextFrame();
	initializeMap(respawnX, respawnY, 6);
	currentPartyMemberTick = &partyCharacters[gameState.partyMembers[0] - 1];
	for (short i = 0; i < 6; i++) {
		currentPartyMemberTick.afflictions[i] = 0;
	}
	currentPartyMemberTick.hp.target = currentPartyMemberTick.maxHP;
	currentPartyMemberTick.hp.current.integer = currentPartyMemberTick.maxHP;
	currentPartyMemberTick.pp.target = 0;
	currentPartyMemberTick.pp.current.integer = 0;
	gameState.moneyCarried = (gameState.moneyCarried & 1) + gameState.moneyCarried / 2;
	unknownC07B52();
	for (short i = 1; 10 < i; i++) {
		setEventFlag(i, 0);
	}
	for (short i = 0; i < 0x1E; i++) {
		entityCollidedObjects[i] = EntityCollision.nothing;
	}
	unknownC064D4();
	dadPhoneQueued = 0;
	playerIntangibilityFrames = 0;
	spawnBuzzBuzz();
	oamClear();
	unfreezeEntities();
	gameOverFadeToMap(32);
	return result;
}

/** Clear all state for entity fades
 * Original_Address: $(DOLLAR)C4C8A4
 */
void clearEntityFadeBuffer() {
	entityFadeStatesBuffer = &buffer[0];
	entityFadeStatesLength = 0;
	entityFadeStates = cast(SpriteFadeState*)&buffer[0x7C00];
	memset(&buffer[0x7C00], 0, 0x400);
}

/** Allocates an entity fade buffer
 * Params:
 * 	size = Number of bytes to allocate
 * Returns: A buffer, at least as large as the requested size
 * Original_Address: $(DOLLAR)C4C8DB
 */
ubyte* allocateEntityFadeBuffer(short size) {
	ubyte* result = entityFadeStatesBuffer;
	entityFadeStatesBuffer += size;
	return result;
}

/** Clears an entity fade entry by wiping the buffer
 * Params:
 * 	dest = Buffer to wipe
 * 	length = Length of buffer
 * Original_Address: $(DOLLAR)C4C8E9
 */
void clearEntityFadeEntry(ubyte* dest, short length) {
	// why didn't this just use memset?
	while (length != 0) {
		(dest++)[0] = 0;
		length--;
	}
}

/** Initializes an entity fade animation
 * Params:
 * 	entityID = The active entity ID to fade in/out
 * 	appearanceStyle = The animation style to use (See ObjFX for valid values)
 * Original_Address: $(DOLLAR)C4C91A
 */
void initializeEntityFade(short entityID, short appearanceStyle) {
	if (appearanceStyle == ObjFX.none) {
		return;
	}
	if (appearanceStyle == ObjFX.showNone) {
		return;
	}
	if (appearanceStyle == ObjFX.hideNone) {
		return;
	}
	if (entityTileHeights[entityID] == 0) {
		return;
	}
	if (entityFadeEntity == -1) {
		clearEntityFadeBuffer();
		newEntityVar3 = 0;
		newEntityVar2 = 0;
		newEntityVar1 = 0;
		newEntityVar0 = 0;
		entityFadeEntity = initEntityWipe(ActionScript.unknown859, 0, 0);
	}
	assert(entityFadeStates);
	SpriteFadeState* spriteFadeParams = &entityFadeStates[entityFadeStatesLength];
	spriteFadeParams.entityID = entityID;
	entitySpriteMapFlags[entityID] |= SpriteMapFlags.fading;
	spriteFadeParams.appearanceStyle = appearanceStyle;
	spriteFadeParams.pixelWidth = pixelWidths[entitySizes[entityID]];
	spriteFadeParams.pixelHeight = cast(short)(entityTileHeights[entityID] * 8);
	spriteFadeParams.fadeBufferSize = cast(short)(entityTileHeights[entityID] * 8 * pixelWidths[entitySizes[entityID]]) / 2;
	spriteFadeParams.fadeBuffer = allocateEntityFadeBuffer(cast(short)(spriteFadeParams.fadeBufferSize * 2));
	clearEntityFadeEntry(spriteFadeParams.fadeBuffer, spriteFadeParams.fadeBufferSize);
	spriteFadeParams.fadeBuffer2 = spriteFadeParams.fadeBuffer + spriteFadeParams.fadeBufferSize;
	spriteFadeParams.var1 = 0;
	spriteFadeParams.var0 = 0;
	ushort* destBuffer;
	if ((appearanceStyle == ObjFX.showBlink) || (appearanceStyle == ObjFX.showHStripe) || (appearanceStyle == ObjFX.showVStripe) || (appearanceStyle == ObjFX.showDots)) {
		destBuffer = cast(ushort*)spriteFadeParams.fadeBuffer;
	} else {
		destBuffer = cast(ushort*)spriteFadeParams.fadeBuffer2;
	}
	if (entityID >= 24) {
		initEntityFadeBuffer8(entityID, destBuffer, spriteFadeParams.fadeBufferSize);
	} else {
		initEntityFadeBuffer4(entityID, destBuffer, spriteFadeParams.fadeBufferSize);
	}
	switch (appearanceStyle) {
		case ObjFX.showBlink:
		case ObjFX.hideBlink:
			entityScriptVar0Table[entityFadeEntity] = 1;
			spriteFadeParams.fadeStyle = FadeStyle.blink;
			break;
		case ObjFX.showHStripe:
		case ObjFX.hideHStripe:
			entityScriptVar1Table[entityFadeEntity] = 1;
			spriteFadeParams.fadeStyle = FadeStyle.hStripe;
			break;
		case ObjFX.showVStripe:
		case ObjFX.hideVStripe:
			entityScriptVar2Table[entityFadeEntity] = 1;
			spriteFadeParams.fadeStyle = FadeStyle.vStripe;
			break;
		case ObjFX.showDots:
		case ObjFX.hideDots:
			entityScriptVar3Table[entityFadeEntity] = 1;
			spriteFadeParams.fadeStyle = FadeStyle.dots;
			break;
		default: break;
	}
	entityScriptVar4Table[entityFadeEntity] = cast(short)(entityScriptVar0Table[entityFadeEntity] + entityScriptVar1Table[entityFadeEntity] + entityScriptVar2Table[entityFadeEntity] + entityScriptVar3Table[entityFadeEntity]);
	entityFadeStatesLength++;
}

unittest {
	if (romDataLoaded) {
		initializeForTesting();
		entityFadeEntity = -1;
		createOverworldEntity(OverworldSprite.pencilStatue, ActionScript.animMapObjStill, 4, 0, 0);
		initializeEntityFade(4, ObjFX.hideDots);
		with(entityFadeStates[0]) {
			assert(entityID == 4);
			assert(appearanceStyle == ObjFX.hideDots);
			assert(fadeStyle == 4);
			assert(pixelWidth == 16);
			assert(pixelHeight == 24);
			assert(fadeBufferSize == 192);
			prettyCompare!"%02X"(fadeBuffer[0 .. fadeBufferSize], cast(immutable(ubyte)[])import("dotsfade1.bin"));
			prettyCompare!"%02X"(fadeBuffer2[0 .. fadeBufferSize], cast(immutable(ubyte)[])import("dotsfade2.bin"));
			assert(var0 == 0);
			assert(var1 == 0);
		}
	}
}

/** Clears all active blinking entities
 * Original_Address: $(DOLLAR)C4CB4F
 */
void actionScriptClearAllBlinking() {
	SpriteFadeState* fadeState = entityFadeStates;
	for (short i = 0; i < entityFadeStatesLength; i++) {
		entitySpriteMapFlags[fadeState.entityID] &= ~SpriteMapFlags.fading;
		fadeState++;
	}
}

/** Switch to the visible blink sprite
 * Original_Address: $(DOLLAR)C4CB8F
 */
void actionScriptBlinkVisible() {
	SpriteFadeState* fadeState = entityFadeStates;
	for (short i = 0; i < entityFadeStatesLength; i++) {
		if (fadeState.fadeStyle == FadeStyle.blink) {
			entityAnimationFrames[fadeState.entityID] = 0;
		}
		updateEntitySprite(fadeState.entityID);
		fadeState++;
	}
}

/** Switch to the invisible blink sprite
 * Original_Address: $(DOLLAR)C4CBE3
 */
void actionScriptBlinkInvisible() {
	SpriteFadeState* fadeState = entityFadeStates;
	for (short i = 0; i < entityFadeStatesLength; i++) {
		if (fadeState.fadeStyle == FadeStyle.blink) {
			entityAnimationFrames[fadeState.entityID] = -1;
		}
		fadeState++;
	}
}

/** Ends a sprite fade.
 *
 * Doesn't actually do anything, but it's good to be explicit I guess
 * Original_Address: $(DOLLAR)C4CC2C
 */
void actionScriptEndFade() {
	// wow. nothing!
}

/** Applies a single frame of horizontal stripe fade effect to actively-fading sprites
 * Returns: Number of sprites left to fade
 * Original_Address: $(DOLLAR)C4CC2F
 */
short actionScriptHStripe() {
	short finishedFadingSprites = 0;
	short fadingSprites = 0;
	SpriteFadeState* activeFade = entityFadeStates;
	for (short i = 0; i < entityFadeStatesLength; i++, activeFade++) {
		if (activeFade.fadeStyle != FadeStyle.hStripe) {
			continue;
		}
		fadingSprites++;
		if (activeFade.var1 == 2) {
			finishedFadingSprites++;
			continue;
		}
		copyPixelRow(cast(ushort*)activeFade.fadeBuffer2, cast(ushort*)activeFade.fadeBuffer, cast(short)((activeFade.pixelWidth * 32 *(activeFade.var0 / 8)) + (activeFade.var0 % 8) * 2), activeFade.pixelWidth / 8);
		uploadEntityFadeFrame(activeFade.fadeBuffer2, activeFade.entityID);
		activeFade.var0 += 2;
		if (activeFade.var0 >= activeFade.pixelHeight) {
			activeFade.var0 = 1;
			activeFade.var1++;
		}
	}
	return cast(short)(fadingSprites - finishedFadingSprites);
}
unittest {
	if (romDataLoaded) {
		initializeForTesting();
		entityFadeEntity = -1;
		foreach (npc; [NPCID.unknown1107, NPCID.unknown1108, NPCID.unknown1109]) {
			entityDirections[createOverworldEntity(npcConfig[npc].sprite, npcConfig[npc].actionScript, -1, 0, 0)] = npcConfig[npc].direction;
		}
		runActionscriptFrame();
		foreach (short entity; [1, 0, 2]) {
			initializeEntityFade(entity, ObjFX.hideHStripe);
		}
		static foreach (testCase; ["hstripefade1.bin", "hstripefade2.bin", "hstripefade3.bin"]) {
			prettyCompare!"%02X"(buffer[0 .. 0x480], cast(immutable(ubyte)[])import(testCase));
			actionScriptHStripe();
		}
	}
}

/** Perform a single frame of the vertical stripes fade animation for all relevant entities
 *
 * First fades all even columns, then fades the odd columns
 * Returns: Number of entities affected
 * Original_Address: $(DOLLAR)C4CD44
 */
short actionScriptVStripe() {
	short vStripeDone = 0;
	short vStripeTotal = 0;
	SpriteFadeState* fadeState = entityFadeStates;
	// var0 = current column of sprite
	// var1 = number of completed passes, max of 2
	for (short i = 0; i < entityFadeStatesLength; i++, fadeState++) {
		if (fadeState.fadeStyle != FadeStyle.vStripe) {
			continue;
		}
		vStripeTotal++;
		if (fadeState.var1 == 2) {
			vStripeDone++;
			continue;
		}
		short offset;
		if (fadeState.var1 != 0) {
			if ((fadeState.var0 & 1) == 0) {
				offset = fadeState.var0;
			} else {
				offset = cast(short)(fadeState.pixelWidth - fadeState.var0 - 1);
			}
		} else {
			if ((fadeState.var0 & 1) != 0) {
				offset = fadeState.var0;
			} else {
				offset = cast(short)(fadeState.pixelWidth - fadeState.var0 - 1);
			}
		}
		copyPixelColumn(cast(ushort*)fadeState.fadeBuffer2, cast(ushort*)fadeState.fadeBuffer, offset, fadeState.pixelHeight, cast(short)((fadeState.pixelWidth / 8) * 32));
		uploadEntityFadeFrame(fadeState.fadeBuffer2, fadeState.entityID);
		if (++fadeState.var0 >= fadeState.pixelWidth / 2) {
			fadeState.var1++;
			fadeState.var0 = 0;
		}
	}
	return cast(short)(vStripeTotal - vStripeDone);
}
unittest {
	if (romDataLoaded) {
		initializeForTesting();
		entityFadeEntity = -1;
		foreach (npc; [NPCID.unknown0531, NPCID.unknown0532, NPCID.unknown0533]) {
			entityDirections[createOverworldEntity(npcConfig[npc].sprite, npcConfig[npc].actionScript, -1, 0, 0)] = npcConfig[npc].direction;
		}
		runActionscriptFrame();
		foreach (short entity; [0, 1, 2]) {
			initializeEntityFade(entity, ObjFX.hideVStripe);
		}
		static foreach (testCase; ["vstripefade1.bin", "vstripefade2.bin", "vstripefade3.bin"]) {
			prettyCompare!"%02X"(buffer[0 .. 0x800], cast(immutable(ubyte)[])import(testCase));
			actionScriptVStripe();
		}
	}
}

/** Wipes the shared dots fade effect buffer
 * Original_Address: $(DOLLAR)C4CEB0
 */
void actionScriptObjFXClearDotBuffer() {
	ushort* dest = cast(ushort*)&buffer[0x7F00];
	for (short i = 0; i < 0x40; i++) {
		(dest++)[0] = 0;
	}
}

/** Perform a single frame of the dots fade animation for all relevant entities
 *
 * Fades random pixels of the sprite until they're all faded. Note that all entities using this effect will share faded pixels
 * Original_Address: $(DOLLAR)C4CED8
 */
void actionScriptObjFXDots() {
	SpriteFadeState* fadeState = entityFadeStates;
	ushort* doneBuffer = cast(ushort*)&buffer[0x7F00];
	short dot = rand() & 0x3F;
	// skip any dots already done
	while (doneBuffer[dot] != 0) {
		dot = (dot + 1) & 0x3F;
	}
	doneBuffer[dot] = 1;
	short dotX = dot / 8;
	short dotY = dot % 8;
	for (short i = 0; entityFadeStatesLength > i; i++, fadeState++) {
		if (fadeState.fadeStyle != FadeStyle.dots) {
			continue;
		}
		for (short j = 0; j < fadeState.pixelHeight / 8; j++) {
			for (short k = 0; k < fadeState.pixelWidth / 8; k++) {
				short finalX = cast(short)((j * fadeState.pixelWidth * 32) + (dotX * 2) + (k * 32));
				copyPixel(cast(ushort*)fadeState.fadeBuffer2, cast(ushort*)fadeState.fadeBuffer, finalX, dotY);
			}
		}
		uploadEntityFadeFrame(fadeState.fadeBuffer2, fadeState.entityID);
	}
}

/** Transliterates a consonant/vowel pair using the english alphabet to hiragana, such as "CA" -> "か"
 * Params:
 * 	dest = The destination buffer for transliteration
 * 	consonant = The consonant half of the pair. Vowels are allowed, but won't produce useful results
 * 	vowel = The vowel half of the pair. Uses gojuon ordering - 0 for 'A', 1 for 'I', 2 for 'U', 3 for 'E', 4 for 'O'
 * Returns: The position of the destination buffer immediately after the copied characters
 * Original_Address: $(DOLLAR)C4D00F
 */
ubyte* transliterateConsonantVowelPair(ubyte* dest, short consonant, short vowel) {
	const(ubyte)* pair = &consonantVowelTransliterationPairs[(consonant - 0x41)][vowel][0];
	for (short i = 2; (i != 0) && (pair[0] != 0); i--) {
		(dest++)[0] = (pair++)[0];
	}
	return dest;
}

/** Transliterates an english-y string into hiragana
 *
 * This was not updated for Earthbound's character set, so it effectively corrupts strings.
 * Params:
 * 	dest = Destination buffer
 * 	src = Source string, null terminated
 * Original_Address: $(DOLLAR)C4D065
 */
void transliterateString(ubyte* dest, const(ubyte)* src) {
	short previousChar = 0;
	while (src[0] != 0) {
		short thisChar = (src++)[0];
		if (previousChar != 0) {
			if (previousChar == thisChar) {
				(dest++)[0] = ebChar('っ');
			} else {
				switch (thisChar) {
					case 0x41: // A
						dest = transliterateConsonantVowelPair(dest, previousChar, 0);
						break;
					case 0x49: // I
						dest = transliterateConsonantVowelPair(dest, previousChar, 1);
						break;
					case 0x55: // U
						dest = transliterateConsonantVowelPair(dest, previousChar, 2);
						break;
					case 0x45: // E
						dest = transliterateConsonantVowelPair(dest, previousChar, 3);
						break;
					case 0x4F: // O
						dest = transliterateConsonantVowelPair(dest, previousChar, 4);
						break;
					default:
						if ((0x41 <= thisChar) && (thisChar <= 0x5A)) { // inside of A-Z range
							if (previousChar == 0x4E) { // N, not followed by vowel
								(dest++)[0] = ebChar('ん');
							} else {
								dest = transliterateConsonantVowelPair(dest, previousChar, 1); //treat as _I
							}
							previousChar = thisChar;
							continue;
						} else { // outside A-Z, just copy
							if (previousChar == 0x4E) { // N, not followed by vowel
								(dest++)[0] = ebChar('ん');
							} else {
								dest = transliterateConsonantVowelPair(dest, previousChar, 1);
							}
							(dest++)[0] = cast(ubyte)thisChar;
						}
						break;
				}
				previousChar = 0;
			}
		} else {
			switch (thisChar) {
				case 0x41: // A
					(dest++)[0] = ebChar('あ');
					break;
				case 0x49: // I
					(dest++)[0] = ebChar('い');
					break;
				case 0x55: // U
					(dest++)[0] = ebChar('う');
					break;
				case 0x45: // E
					(dest++)[0] = ebChar('え');
					break;
				case 0x4F: // O
					(dest++)[0] = ebChar('お');
					break;
				default:
					if ((0x41 <= thisChar) && (thisChar <= 0x5A)) { // inside A-Z
						previousChar = thisChar;
					} else { // outside A-Z, just copy
						(dest++)[0] = cast(ubyte)thisChar;
					}
					break;
			}
		}
	}
	if (previousChar != 0) { // handle end character
		if (previousChar == 0x4E) { // N
			(dest++)[0] = ebChar('ん');
		} else {
			dest = transliterateConsonantVowelPair(dest, previousChar, 1); // treat as _I
		}
	}
	dest[0] = 0;
}

/** Gets the town map ID (if any) for the given coordinates
 * Params:
 * 	x = X coordinate
 * 	y = Y coordinate
 * Returns: Town map ID if valid, TownMap.none otherwise
 * Original_Address: $(DOLLAR)C4D274
 */
ubyte getTownMapID(short x, short y) {
	return mapDataPerSectorTownMapData[y / 0x80][((x >> 8) & 0xFF)].areaIcon;
}

/** NO LONGER USED. Animates an icon palette for the town map display
 *
 * Rotates half of the first sprite palette leftward every 12 frames.
 * Original_Address: $(DOLLAR)C4D2A8
 */
void animateTownMapIconPalette() {
	if (framesUntilMapIconPaletteUpdate == 0) {
		framesUntilMapIconPaletteUpdate = 12;
		short tmpColour = palettes[8][1];
		for (short i = 2; i < 8; i++) {
			palettes[8][i - 1] = palettes[8][i];
		}
		palettes[8][7] = tmpColour;
		preparePaletteUpload(PaletteUpload.objOnly);
	}
	framesUntilMapIconPaletteUpdate--;
}

/** Draws the player location icon on the map, with little arrow if offscreen
 * Original_Address: $(DOLLAR)C4D2F0
 */
void drawTownMapPlayerIcon() {
	const icon = &mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF];
	// draw the arrow
	switch (icon.areaIcon & 0x70) {
		case MapIconDirection.north:
			drawSprite(&townMapIconSpritemaps[townMapPlayerIcons[2]][0], icon.x, icon.y - 8);
			break;
		case MapIconDirection.south:
			drawSprite(&townMapIconSpritemaps[townMapPlayerIcons[3]][0], icon.x, icon.y + 8);
			break;
		case MapIconDirection.west:
			drawSprite(&townMapIconSpritemaps[townMapPlayerIcons[4]][0], icon.x - 8, icon.y - 8);
			break;
		case MapIconDirection.east:
			drawSprite(&townMapIconSpritemaps[townMapPlayerIcons[5]][0], icon.x + 16, icon.y);
			break;
		default:
			break;
	}
	// make player icon throb with a 20 frame loop
	if (townMapPlayerIconAnimationFrame < 10) {
		drawSprite(&townMapIconSpritemaps[townMapPlayerIcons[1]][0], icon.x, icon.y);
	} else {
		drawSprite(&townMapIconSpritemaps[townMapPlayerIcons[0]][0], icon.x, icon.y);
	}
	if (--townMapPlayerIconAnimationFrame == 0) {
		townMapPlayerIconAnimationFrame = 20;
	}
}

/** Draws all town map icons
 * Original_Address: $(DOLLAR)C4D43F
 */
void drawTownMapIcons(short map) {
	currentSpriteDrawingPriority = 0;
	ushort savedBank = setSpritemapBank(bankbyte(&townMapIconSpritemaps[0]));
	for (const(TownMapIconPlacement)* icon = &townMapIconPlacementTable[map][0]; icon.x != 0xFF; icon++) {
		bool drawIcon = true;

		// does this icon blink? if so, skip it for the first 10 frames of every second
		if ((blinkingTownMapIcons[icon.sprite] != 0) && (townMapIconAnimationFrame < 10)) {
			drawIcon = false;
		}

		// skip icon if flag state mismatched
		short expectedFlagState = 0;
		if (icon.eventFlag >= eventFlagUnset) {
			expectedFlagState = 1;
		}
		if (getEventFlag(icon.eventFlag & 0x7FFF) != expectedFlagState) {
			drawIcon = false;
		}

		if (drawIcon == false) {
			continue;
		}
		drawSprite(&townMapIconSpritemaps[icon.sprite][0], icon.x, icon.y);
	}
	drawTownMapPlayerIcon();
	// blinking effect loops every second
	if (--townMapIconAnimationFrame == 0) {
		townMapIconAnimationFrame = 60;
	}
	setSpritemapBank(savedBank);

	// unused town map palette animation
	animateTownMapIconPalette();
}

/** Fades out, loads the graphics, sets up hardware for a town map display and fades back in
 * Params:
 * 	id = Town map ID (0-based, not 1-based!)
 * Original_Address: $(DOLLAR)C4D552
 */
void initializeTownMapDisplay(short id) {
	fadeOut(2, 1);
	decomp(&townMapGraphics[id][0], &buffer[0]);
	while (fadeParameters.step != 0) { waitForInterrupt(); }
	memcpy(&palettes[0][0], &buffer[0], 0x40);
	memcpy(&palettes[8][0], &townMapIconPalette[0], 0x100);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x3000, 0);
	setOAMSize(3);
	CGADSUB = 0;
	CGWSEL = 0;
	mirrorTM = TMTD.bg1;
	mirrorTD = TMTD.none;
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x800, 0x3000, &buffer[0x40]);
	copyToVRAMChunked(VRAMCopyMode.simpleCopyToVRAM, 0x4000, 0, &buffer[0x840]);
	decomp(&townMapIconGraphics[0], &buffer[0]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x2400, 0x6000, &buffer[0]);
	preparePaletteUpload(PaletteUpload.full);
	mirrorTM = TMTD.obj | TMTD.bg1;
	bg1YPosition = 0;
	bg1XPosition = 0;
	updateScreen();
	fadeIn(2, 1);
}

/** Loads and displays the town map for the current player coordinates
 *
 * Exits and reloads map when player presses A, B, X, or L
 * Returns: The ID of the town map that was displayed
 * Original_Address: $(DOLLAR)C4D681
 */
short displayTownMap() {
	townMapIconAnimationFrame = 60;
	townMapPlayerIconAnimationFrame = 20;
	framesUntilMapIconPaletteUpdate = 12;
	short mapID = getTownMapID(gameState.leaderX.integer, gameState.leaderY.integer) & 0xF;
	if (mapID == 0) {
		return 0;
	}
	initializeTownMapDisplay(cast(short)(mapID - 1));
	do {
		waitUntilNextFrame();
		oamClear();
		drawTownMapIcons(cast(short)(mapID - 1));
		updateScreen();
	} while(((padPress[0] & (Pad.a | Pad.l)) == 0) && ((padPress[0] & (Pad.b | Pad.select)) == 0) && ((padPress[0] & Pad.l) == 0) && ((padPress[0] & Pad.x) == 0));
	fadeOut(2, 1);
	for (short i = 0; i < 16; i++) {
		waitUntilNextFrame();
		oamClear();
		drawTownMapIcons(cast(short)(mapID - 1));
		updateScreen();
	}
	disableMusicChanges = 1;
	reloadMap();
	currentMapMusicTrack = nextMapMusicTrack;
	restoreMapRendering();
	disableMusicChanges = 0;
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	fadeIn(2, 1);
	return mapID;
}

unittest {
	if (romDataLoaded) {
		gameState.leaderX.integer = 0x782; // approx middle of downtown onett
		gameState.leaderY.integer = 0x5C7;
		runGameTest!displayTownMap((frame) {
			// skip the first three frames, where the map hasn't loaded yet
			if (frame < 3) {
				return;
			}
			frame -= 3;
			// the player's icon pulsates, and the size changes along with it for about 9 frames out of every 60 frames
			if ((frame > 60 - 10) && (frame < 60)) {
				assert(priority0SpriteX[0] == 120);
				assert(priority0SpriteY[0] == 160);
			} else {
				assert(priority0SpriteX[0] == 85);
				assert(priority0SpriteY[0] == 91);
			}
			// these icons blink but don't move
			assert(priority0SpriteX[1 .. 7] == [106, 140, 29, 117, 96, 120]);
			assert(priority0SpriteY[1 .. 7] == [94, 123, 158, 166, 190, 160]);
		}, ".60a1");
	}
}


/** Test town map display
 *
 * Press up/down to switch maps, A to exit
 * Original_Address: $(DOLLAR)C4D744
 */
void townMapDebug() {
	short mapID = 0;
	short lastMapID = 0;
	townMapIconAnimationFrame = 60;
	townMapPlayerIconAnimationFrame = 20;
	framesUntilMapIconPaletteUpdate = 12;
	initializeTownMapDisplay(0);
	while (true) {
		waitUntilNextFrame();
		oamClear();
		if ((padPress[0] & Pad.up) != 0) {
			mapID--;
		}
		if ((padPress[0] & Pad.down) != 0) {
			mapID++;
		}
		if (mapID == -1) {
			mapID = TownMap.max - 1;
		}
		if (mapID == TownMap.max) {
			mapID = 0;
		}
		if (lastMapID != mapID) {
			initializeTownMapDisplay(mapID);
			lastMapID = mapID;
		}
		drawTownMapIcons(mapID);
		if ((padPress[0] & Pad.a) == 0) {
			break;
		}
		updateScreen();
	}
	restoreMapRendering();
	reloadMap();
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
}

/** Creates a predefined entity for the naming screen
 * Params:
 * 	id = The index of one of the entries in namingScreenEntities
 * Original_Address: $(DOLLAR)C4D7D9
 */
void displayAnimatedNamingSprite(short id) {
	for (const(NamingScreenEntity)* entityConfig = &namingScreenEntities[id][0]; entityConfig.sprite != 0; entityConfig++) {
		createOverworldEntity(entityConfig.sprite, entityConfig.script, -1, 0, 0);
	}
	waitForNamingScreenActionScript = 0;
}

/** Have naming screen entities exit stage left
 * Params:
 * 	id = The index of one of the entries in namingScreenEntities
 * Original_Address: $(DOLLAR)C4D830
 */
void exitAnimatedNamingSprite(short id) {
	// wait for script to be ready
	while (waitForNamingScreenActionScript != 0) {
		finishFrame();
	}
	// Look for entities and replace their scripts with their exit variants
	for (const(NamingScreenEntity)* entityConfig = &namingScreenExitEntities[id][0]; entityConfig.sprite != 0; entityConfig++) {
		short entity = findEntityBySprite(entityConfig.sprite);
		if (entity == -1) {
			continue;
		}
		setEntityActionScript(&actionScriptScriptPointers[entityConfig.script][0], entity);
	}
	// wait for scripts to finish
	while (true) {
		short* script = &entityScriptTable[0];
		ushort foundScript = 0xFFFF;
		// finished scripts are 0xFFFF, so if we mask any bits off here then there are still active scripts
		for (short i = 0; i < partyLeaderEntity; i++) {
			foundScript &= (script++)[0];
		}
		finishFrame();
		if (foundScript == 0xFFFF) {
			break;
		}
	}
}

/** Creates the downward-facing naming screen summary entities
 * Original_Address: $(DOLLAR)C4D8FA
 */
void createNamingSummaryEntities() {
	for (short i = 0; i < fileSelectSummarySpriteConfig.length; i++) {
		entityDirections[createOverworldEntity(fileSelectSummarySpriteConfig[i].sprite, fileSelectSummarySpriteConfig[i].script, -1, fileSelectSummarySpriteConfig[i].x, fileSelectSummarySpriteConfig[i].y)] = Direction.down;
	}
}

/** Runs one of the attract mode scripts
 *
 * This initializes the bare minimum necessary to move around in the overworld. Be careful what you use in the scripts.
 * Params:
 * 	script = Script ID to run
 * Returns: 1 if player interrupted the demo, 0 otherwise
 * Original_Address: $(DOLLAR)C4D989
 */
short runAttractModeScene(short script) {
	// initialize entities
	initializeEntitySubsystem();
	clearSpriteTable();
	spriteVramTableOverwrite(short.min, 0);
	initializeMiscEntityData();
	// disable spawns and music changes
	npcSpawnsEnabled = SpawnControl.offscreenOnly;
	enemySpawnsEnabled = SpawnControl.allDisabled;
	setAutoSectorMusicChanges(0);
	// create leader entity
	entityAllocationMinSlot = partyLeaderEntity;
	entityAllocationMaxSlot = partyLeaderEntity + 1;
	initEntity(1, 0, 0);
	clearParty();
	for (short i = 0; i < 6; i++) {
		gameState.partyMembers[i] = 0;
	}
	// defaults to a place in west toto, but scripts will warp us somewhere else
	setLeaderLocation(7520, 2824);

	unknownC03A24();
	memset(&palettes[0][0], 0, 0x200);
	overworldInitialize();
	mirrorTM = TMTD.none;
	// iris in
	openOvalWindow(0);
	updateSwirlFrame();

	actionScriptState = ActionScriptState.running;
	short playerInterrupted = 0;
	short frameCount = 0;
	displayText(getTextBlock(attractModeText[script]));
	// run scripts until they finish up
	while (actionScriptState == ActionScriptState.running) {
		updateSwirlFrame();
		if (((padPress[0] & Pad.a) != 0) || ((padPress[0] & Pad.b) != 0) || ((padPress[0] & Pad.start) != 0)) {
			playerInterrupted = 1;
			break;
		}
		finishFrame();
		if ((frameCount == 0) || (frameCount == 1)) {
			mirrorTM = TMTD.obj | TMTD.bg2 | TMTD.bg1;
		}
		frameCount++;
	}
	// iris out
	closeOvalWindow();
	while (isBattleAnimationPlaying()) {
		finishFrame();
		updateSwirlFrame();
	}
	// fade out
	fadeOut(1, 1);
	while (fadeParameters.step != 0) {
		finishFrame();
	}
	disableOvalWindow();
	actionScriptState = ActionScriptState.running;
	unknownC021E6();
	return playerInterrupted;
}

/** Runs the intro sequence
 * Original_Address: $(DOLLAR)C4DAD2
 */
void doIntroSequence() {
	short introStage = IntroStage.logoScreens;
	disabledTransitions = 1;
	musicEffect(MusicEffect.quickFade);
	initializeEntitySubsystem();
	initializeTextSystem();
	clearPartyStatus();
	disableMusicChanges = 1;
	bg3XPosition = 0;
	bg3YPosition = 0;
	bg2XPosition = 0;
	bg2YPosition = 0;
	bg1XPosition = 0;
	bg1YPosition = 0;
	updateScreen();
	bg3XPosition = 0;
	bg3YPosition = 0;
	bg2XPosition = 0;
	bg2YPosition = 0;
	bg1XPosition = 0;
	bg1YPosition = 0;
	updateScreen();
	short done;
	while (done == 0) {
		switch (introStage) {
			case IntroStage.logoScreens:
				if (logoScreen() != 0) {
					// player interrupted, show fast title screen and exit
					musicEffect(MusicEffect.quickFade);
					if ((mirrorINIDISP & 0x80) != 0) {
						fadeOutWithMosaic(4, 1, 0);
					}
					changeMusic(Music.titleScreen);
					done = showTitleScreen(1);
					introStage = IntroStage.titleScreen;
				} else {
					done = 0;
				}
				break;
			case IntroStage.gasStation:
				changeMusic(Music.gasStation);
				if (gasStation() != 0) {
					// player interrupted, show fast title screen and exit
					musicEffect(MusicEffect.quickFade);
					if ((mirrorINIDISP & 0x80) != 0) {
						fadeOutWithMosaic(4, 1, 0);
					}
					CGADSUB = 0;
					CGWSEL = 0;
					mirrorTM = TMTD.bg1;
					mirrorTD = TMTD.none;
					changeMusic(Music.titleScreen);
					done = showTitleScreen(1);
					introStage = IntroStage.titleScreen;
				} else {
					done = 0;
				}
				break;
			case IntroStage.titleScreen:
				changeMusic(Music.titleScreen);
				done = showTitleScreen(0);
				break;
			case IntroStage.attractMode0:
				changeMusic(Music.attractMode);
				done = runAttractModeScene(0);
				break;
			case IntroStage.attractMode2:
				done = runAttractModeScene(2);
				break;
			case IntroStage.attractMode3:
				done = runAttractModeScene(3);
				break;
			case IntroStage.attractMode4:
				done = runAttractModeScene(4);
				break;
			case IntroStage.attractMode5:
				done = runAttractModeScene(5);
				break;
			case IntroStage.attractMode6:
				done = runAttractModeScene(6);
				break;
			case IntroStage.attractMode7:
				done = runAttractModeScene(7);
				break;
			case IntroStage.attractMode9:
				done = runAttractModeScene(9);
				break;
			default:
				introStage = IntroStage.gasStation;
				break;
		}
		introStage++;
	}
	musicEffect(MusicEffect.quickFade);
	fadeParameters.step = 0;
	if ((mirrorINIDISP & 0x80) != 0) {
		fadeOutWithMosaic(4, 1, 0);
	}
	CGADSUB = 0;
	CGWSEL = 0;
	mirrorTM = TMTD.bg1;
	mirrorTD = TMTD.none;
	disableMusicChanges = 0;
}

/** Sets the priority bit for all tiles in the logo tilemaps
 * Original_Address: $(DOLLAR)C4DCF6
 */
void setDecompressedArrangementPriorityBit() {
	ushort* tile = cast(ushort*)&buffer[0];
	for (short i = 0; i < 0x200; i++) {
		tile[i] |= TilemapFlag.priority;
	}
}

/** Loads the "Produced by SHIGESATO ITOI" overlay for the attract mode demo
 * Original_Address: $(DOLLAR)C4DD28
 */
void loadItoiProductionOverlay() {
	decomp(&attractModeOverlay1Tilemap[0], &buffer[0]);
	setDecompressedArrangementPriorityBit();
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x800, 0x7C00, &buffer[0]);
	decomp(&attractModeOverlay1Tiles[0], &buffer[0x800]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x400, 0x6000, &buffer[0x800]);
	decomp(&attractModeOverlayPalette[0], &palettes[0][0]);
	palettes[0][0] = 0;
	preparePaletteUpload(PaletteUpload.full);
}

/** Loads the "Presented by Nintendo" overlay for the attract mode demo
 * Original_Address: $(DOLLAR)C4DDD0
 */
void loadNintendoPresentationOverlay() {
	decomp(&attractModeOverlay2Tilemap[0], &buffer[0]);
	setDecompressedArrangementPriorityBit();
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x800, 0x7C00, &buffer[0]);
	decomp(&attractModeOverlay2Tiles[0], &buffer[0x800]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x400, 0x6000, &buffer[0x800]);
	decomp(&attractModeOverlayPalette[0], &palettes[0][0]);
	palettes[0][0] = 0;
	preparePaletteUpload(PaletteUpload.full);
}

/** Coordinates for the Your Sanctuary locations in the post-Magicant montage
 * Original_Address: $(DOLLAR)C4DE78
 */
immutable YourSanctuaryLocation[8] yourSanctuaryLocations = [
	YourSanctuaryLocation(151, 48),
	YourSanctuaryLocation(387, 1013),
	YourSanctuaryLocation(35, 484),
	YourSanctuaryLocation(88, 668),
	YourSanctuaryLocation(479, 520),
	YourSanctuaryLocation(445, 779),
	YourSanctuaryLocation(843, 600),
	YourSanctuaryLocation(766, 1228),
];

/** Initializes state for the Your Sanctuary location montage
 * Original_Address: $(DOLLAR)C4DE98
 */
void initializeYourSanctuaryDisplay() {
	nextYourSanctuaryLocationTileIndex = 0;
	totalYourSanctuaryLoadedTilesetTiles = 0;
	yourSanctuaryLoadedTilesetTiles = 0;
	loadedAnimatedTileCount = 0;
	mapPaletteAnimationLoaded = 0;
	for (short i = 0; i < 8; i++) {
		loadedYourSanctuaryLocations[i] = 0;
	}
	mirrorTM = TMTD.obj;
}

/** Enables the Your Sanctuary location montage
 *
 * Pretty much just enables BG1
 * Original_Address: $(DOLLAR)C4DED0
 */
void enableYourSanctuaryDisplay() {
	setBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0x6000);
	mirrorTM = TMTD.obj | TMTD.bg1;
}

/** Prepares the sprite palettes for the Your Sanctuary location montage animation
 *
 * This ensures that the sprites have their proper tinting for each location
 * Params:
 * 	mapTileCombo = The map tileset+palette combo ID to use
 * 	sanctuaryLocation = Your Sanctuary location ID
 * Original_Address: $(DOLLAR)C4DEE9
 */
void prepareYourSanctuaryLocationPaletteData(short mapTileCombo, short sanctuaryLocation) {
	prepareAverageForSpritePalettes();
	memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
	loadMapPalette(mapTileCombo / 8, mapTileCombo & 7);
	adjustSpritePalettesByAverage();
	paletteUploadMode = PaletteUpload.none;
	memcpy(&buffer[0x4000 + sanctuaryLocation * 0x200], &palettes[0][0], 0x100);
}

/** Preloads the Your Sanctuary location for the montage
 * Params:
 * 	x = X coordinate (tiles)
 * 	y = Y coordinate (tiles)
 * 	sanctuaryLocation = Your Sanctuary location ID
 * Original_Address: $(DOLLAR)C4DF7D
 */
void prepareYourSanctuaryLocationTileArrangementData(short x, short y, short sanctuaryLocation) {
	// centre camera (Party member sprites are 16 pixels tall)
	x -= (screenWidth / 8) / 2;
	y -= ((screenHeight - 16) / 8) / 2;
	memset(&yourSanctuaryLocationTileOffsets[0], 0, 0x800);
	ushort* dest = cast(ushort*)&buffer[sanctuaryLocation * 0x800];
	for (short tileY = 0; tileY < screenHeight / 8; tileY++) {
		for (short tileX = 0; tileX < screenWidth / 8; tileX++) {
			short block;
			// avoid loading blocks with different tileset+palettes
			if (globalMapTilesetPaletteData[(tileY + y) / 16][(tileX + x) / 32] / 8 == loadedMapTileCombo) {
				block = loadMapBlockF((tileX + x) / 4, (tileY + y) / 4);
			} else {
				block = 0;
			}
			yourSanctuaryLocationTileOffsets[tilemapBuffer[(((tileY + y) & 3) * 4) + (block * 16) + (tileX + x) & 3] & 0x3FF * 2] = 0xFFFF;
			(dest++)[0] = tilemapBuffer[(((tileY + y) & 3) * 4) + (block * 16) + (tileX + x) & 3];
		}
	}
}

/** Loads all tiles to be used in the Your Sanctuary location montage
 * Params:
 * 	sanctuaryLocation = Your Sanctuary location ID
 * Original_Address: $(DOLLAR)C4E08C
 */
void prepareYourSanctuaryLocationTilesetData(short sanctuaryLocation) {
	// make sure all the tiles are loaded in VRAM
	for (short i = 0; i < 0x400; i++) {
		if (yourSanctuaryLocationTileOffsets[i] == 0) {
			continue;
		}
		copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x20, (nextYourSanctuaryLocationTileIndex * 16 + 0x6000) & 0x7FFF, cast(ubyte*)&tilemapBuffer[i * 16]);
		yourSanctuaryLocationTileOffsets[i] = nextYourSanctuaryLocationTileIndex;
		nextYourSanctuaryLocationTileIndex++;
		yourSanctuaryLoadedTilesetTiles++;
	}
	ushort* tile = (cast(ushort*)&buffer[0x800 * sanctuaryLocation]);
	for (short i = 0; i < 0x3C0; i++) {
		ushort tmpTile = tile[0];
		// adjust tile IDs, not palettes, priority or flipping
		tile[0] = yourSanctuaryLocationTileOffsets[tmpTile & 0x3FF] | (tmpTile & 0xFC00);
		tile++;
	}
}

/** Load all map data to be used for one of the Your Sanctuary locations in the montage
 * Params:
 * 	x = X coordinate (tiles)
 * 	y = Y coordinate (tiles)
 * 	sanctuaryLocation = Your Sanctuary location ID
 * Original_Address: $(DOLLAR)C4E13E
 */
void loadYourSanctuaryLocationData(short x, short y, short sanctuaryLocation) {
	yourSanctuaryLoadedTilesetTiles = 0;
	short mapTileCombo = globalMapTilesetPaletteData[y / 16][x / 32];
	loadedMapTileCombo = globalMapTilesetPaletteData[y / 16][x / 32];
	prepareYourSanctuaryLocationPaletteData(mapTileCombo, sanctuaryLocation);
	decomp(&mapTilemaps[tilesetGraphicsMapping[mapTileCombo]][0], &buffer[0x8000]);
	prepareYourSanctuaryLocationTileArrangementData(x, y, sanctuaryLocation);
	decomp(&mapTiles[tilesetGraphicsMapping[mapTileCombo]][0], &buffer[0x8000]);
	prepareYourSanctuaryLocationTilesetData(sanctuaryLocation);
	totalYourSanctuaryLoadedTilesetTiles += yourSanctuaryLoadedTilesetTiles;
}

/** Memoized version of loadYourSanctuaryLocationData, using a predefined Your Sanctuary location table
 * Params:
 * 	sanctuaryLocation = Your Sanctuary location ID
 * Original_Address: $(DOLLAR)C4E281
 */
void loadYourSanctuaryLocation(short sanctuaryLocation) {
	if (loadedYourSanctuaryLocations[sanctuaryLocation] == 0) {
		loadYourSanctuaryLocationData(yourSanctuaryLocations[sanctuaryLocation].x, yourSanctuaryLocations[sanctuaryLocation].y, sanctuaryLocation);
		loadedYourSanctuaryLocations[sanctuaryLocation] = 1;
	}
}

/** Displays a Your Sanctuary location as part of the post-Magicant montage
 * Params:
 * 	sanctuaryLocation = Your Sanctuary location ID
 * Original_Address: $(DOLLAR)C4E2D7
 */
void displayYourSanctuaryLocation(short sanctuaryLocation) {
	short location = sanctuaryLocation & 7;
	if (loadedYourSanctuaryLocations[location] == 0) {
		loadYourSanctuaryLocation(location);
		waitUntilNextFrame();
	}
	waitDMAFinished();
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x780, 0x3800, &buffer[location * 0x800]);
	memcpy(&palettes[0][0], &buffer[0x4000 + location * 0x200], 0x100);
	paletteUploadMode = PaletteUpload.bgOnly;
	screenTopY = 0;
	screenLeftX = 0;
	bg1YPosition = 0;
	bg1XPosition = 0;
}

/** Some sanctuary display debugging code deleted from earthbound
 * Original_Address: $(DOLLAR)C4E366
 */
void testYourSanctuaryDisplay() {
	version(JPN) {
		initializeYourSanctuaryDisplay();
		short location = 0;
		while (true) {
			bg1XPosition = 0;
			bg1YPosition = 0;
			updateScreen();
			waitUntilNextFrame();
			if ((padState[0] & Pad.r) == 0) {
				displayYourSanctuaryLocation(location);
				enableYourSanctuaryDisplay();
				if (++location == 8) {
					location = 0;
				}
			}
		}
	}
}

/** Loads data and prepares hardware for the cast scene
 * Original_Address: $(DOLLAR)C4E369
 */
void loadCastScene() {
	itemTransformationsLoaded = 0;
	fadeOutWithMosaic(1, 1, 0);
	prepareForImmediateDMA();
	unknownC021E6();
	for (short i = 0; i < maxEntities; i++) {
		if (entityScriptTable[i] == -1) {
			continue;
		}
		entitySpriteMapFlags[i] |= SpriteMapFlags.drawDisabled;
	}
	loadBackgroundAnimation(BackgroundLayer.unknown279, BackgroundLayer.none);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0);
	setOAMSize(0x62);
	bg3XPosition = 0;
	bg3YPosition = 0;
	bg2YPosition = 0;
	bg2XPosition = 0;
	bg1YPosition = 0;
	bg1XPosition = 0;
	updateScreen();
	*cast(ushort*)&buffer[0] = 0;
	copyToVRAM(VRAMCopyMode.repeatWordToVRAM, 0x800, 0x7C00, &buffer[0]);
	forceNormalFontForLengthCalculation = 0xFF;
	memset(&buffer[0], 0, 0x1000);
	decomp(&specialCastNamesGraphics[0], &buffer[0x200]);
	decomp(&castNamesGraphics[0], &buffer[0x600]);
	prepareDynamicCastNameText();
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x8000, 0, &buffer[0]);
	forceNormalFontForLengthCalculation = 0;
	loadTextPalette();
	memcpy(&palettes[0][0], &castTextPalette[0], 0x20);
	memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
	decomp(&castExtraPalettes[0], &buffer[0x7000]);
	paletteUploadMode = PaletteUpload.full;
	mirrorTM = TMTD.obj | TMTD.bg3;
	unread7EB4CF = 0;
	castTileOffset = 0;
	setForceBlank();
}

/** Sets the scroll threshold in tiles, after which the ActionScript will continue
 * Params:
 * 	tiles = Number of tiles
 * Original_Address: $(DOLLAR)C4E4DA
 */
void setCastScrollThreshold(short tiles) {
	entityScriptVar0Table[currentEntitySlot] = cast(short)(tiles * 8 + bg3YPosition);
}

/** Check if the cast screen has scrolled past the wait threshold
 * Returns: true if scrolled past, false otherwise
 * Original_Address: $(DOLLAR)C4E4F9
 */
short checkCastScrollThreshold() {
	short result = 0;
	if (entityScriptVar0Table[currentEntitySlot] <= bg3YPosition) {
		result = 1;
	}
	return result;
}

/** ActionScript tick callback used for scrolling the cast scene and erasing old lines as they scroll offscreen
 * Original_Address: $(DOLLAR)C4E51E
 */
void handleCastScrolling() {
	ubyte* dest = &buffer[0x7FFE];
	bg3YPosition = entityAbsYTable[currentEntitySlot];
	if (entityScriptVar7Table[currentEntitySlot] < entityAbsYTable[currentEntitySlot]) {
		entityScriptVar7Table[currentEntitySlot] += 8;
		dest[0] = 0;
		copyToVRAM(VRAMCopyMode.repeatWordToVRAM, 0x40, cast(ushort)((((bg3YPosition / 8) - 1) & 0x1F) * 32 + 0x7C00), dest);
	}
}

/** Renders text to tiles for the cast scene
 * Params:
 * 	text = The text to render
 * 	width = Width in tiles of the text to render
 * 	tileID = The first tile ID to overwrite
 * Original_Address: $(DOLLAR)C4E583
 */
void renderCastNameText(ubyte* text, short width, short tileID) {
	vwfTile = 0;
	vwfX = 0;
	memset(&vwfBuffer[0][0], 0xFF, 0x340);
	textRenderState.upperTileID = 0;
	textRenderState.pixelsRendered = 0;
	unknownC1FF99(-1, width, text);
	for (short i = 0; text[0] != 0; text++, i++) {
		const(ubyte)* charTile = &fontGraphics[fontConfigTable[0].graphicsID][fontConfigTable[0].height * (text[0] - ebChar(' ') & 0x7F)];
		short pixelWidth = fontData[fontConfigTable[0].dataID][text[0] - ebChar(' ') & 0x7F] + characterPadding;
		while (pixelWidth > 8) {
			renderText(pixelWidth, fontConfigTable[0].height, charTile);
			pixelWidth -= 8;
			charTile += fontConfigTable[0].height;
		}
		renderText(pixelWidth, fontConfigTable[0].height, charTile);
	}
	changeVWF2BPPto3Colour(width);
	short x04 = cast(short)(tileID * 8);
	short x28 = tileID;
	for (short i = 0; i < width; i++, x04 += 8, x28++) {
		memcpy(&buffer[((x28 & 0xF) + ((x28 & 0x3F0) * 2)) * 16], &vwfBuffer[i][0], 16);
		memcpy(&buffer[((x28 & 0xF) + ((x28 & 0x3F0) * 2)) * 16 + 256], &vwfBuffer[i][16], 16);
	}
}

/** Text used for the titles of party member guardians
 * Original_Address: $(DOLLAR)C4E796
 */
immutable ubyte[][3] characterGuardianText = [
	ebString("'s dad"),
	ebString("'s mom"),
	ebString("'s Master"),
];

/** Prepares the dynamic cast scene text, like the party member names and their relatives
 * Original_Address: $(DOLLAR)C4E7AE
 */
void prepareDynamicCastNameText() {
	ubyte[16] buffer;
	for (short i = 0; i < 4; i++) {
		memset(&buffer[0], 0, 0x10);
		memcpy(&buffer[0], &partyCharacters[i].name[0], 5);
		renderCastNameText(&buffer[0], 6, partyMemberCastTileIDs[i]);
	}
	memset(&buffer[0], 0, 0x10);
	memcpy(&buffer[0], &gameState.petName[0], 6);
	renderCastNameText(&buffer[0], 6, 0x1C0);
	memset(&buffer[0], 0, 0x10);
	memcpy(&buffer[0], &partyCharacters[1].name[0], 5);
	strcat(cast(char*)&buffer[0], cast(immutable(char)*)&characterGuardianText[0][0]);
	renderCastNameText(&buffer[0], castSequenceFormatting[CastSequenceName.paulasDad].tileWidth, castSequenceFormatting[CastSequenceName.paulasDad].tileID);
	memset(&buffer[0], 0, 0x10);
	memcpy(&buffer[0], &partyCharacters[1].name[0], 5);
	strcat(cast(char*)&buffer[0], cast(immutable(char)*)&characterGuardianText[1][0]);
	renderCastNameText(&buffer[0], castSequenceFormatting[CastSequenceName.paulasMom].tileWidth, castSequenceFormatting[CastSequenceName.paulasMom].tileID);
	memset(&buffer[0], 0, 0x10);
	memcpy(&buffer[0], &partyCharacters[3].name[0], 5);
	strcat(cast(char*)&buffer[0], cast(immutable(char)*)&characterGuardianText[2][0]);
	renderCastNameText(&buffer[0], castSequenceFormatting[CastSequenceName.poosMaster].tileWidth, castSequenceFormatting[CastSequenceName.poosMaster].tileID);
}

/** Prepares a cast name to be copied into VRAM
 * Params:
 * 	offset = Tile offset of the first tile
 * 	tileWidth = The width of the name, in tiles
 * 	x = The X coordinate to copy to
 * Original_Address: $(DOLLAR)C4EA9C
 */
void prepareCastNameTilemap(short offset, short tileWidth, short x) {
	ushort* dest = cast(ushort*)&buffer[0x4000 + x * 2];
	while (tileWidth-- != 0) {
		dest[0] = cast(short)(castTileOffset + ((offset & 0x3F0) * 2) + (offset & 0xF));
		dest[0x20] = cast(short)(dest[0] + 0x10);
		dest++;
		offset++;
	}
}

/** Copies the cast name tilemap into VRAM centred on the given coordinates
 * Params:
 * 	centreX = The centre X coordinate
 * 	centreY = The centre Y coordinate
 * 	tileWidth = The width of this tilemap fragment in tiles
 * Original_Address: $(DOLLAR)C4EB04
 */
void copyCastNameTilemap(short centreX, short centreY, short tileWidth) {
	short row1TileOffset = (bg3YPosition / 8 + centreY) & 0x1F;
	short row1Address = cast(short)((row1TileOffset * 32) + centreX + 0x7C00 - (tileWidth + 1) / 2);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, cast(ushort)(tileWidth * 2), row1Address, &buffer[0x4000 + centreX * 2]);
	short row2Address;
	// if last row, wrap around to first row
	if (row1TileOffset != 31) {
		row2Address = cast(short)(row1Address + 0x20);
	} else {
		row2Address = cast(short)(row1Address - 0x3E0);
	}
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, cast(short)(tileWidth * 2), row2Address, &buffer[0x4000 + centreX * 2 + 64]);
}

/** Prints the given cast name to the given relative tilemap coordinates
 * Params:
 * 	name = The ID of the cast name to print
 * 	x = The tilemap's x coordinate (centred), relative to scroll position
 * 	y = The tilemap's y coordinate, relative to scroll position
 * Original_Address: $(DOLLAR)C4EBAD
 */
void printCastName(short name, short x, short y) {
	prepareCastNameTilemap(castSequenceFormatting[name].tileID, castSequenceFormatting[name].tileWidth, x);
	copyCastNameTilemap(x, y, castSequenceFormatting[name].tileWidth);
}

/** Prints a cast name for party members
 * Params:
 * 	partyMember = The party member whose name should be printed
 * 	x = The X coordinate (centred) to print the name at
 * 	y = The Y coordinate, relative to the BG3 scroll, to print the name at
 * Original_Address: $(DOLLAR)C4EC05
 */
void printCastNameParty(short partyMember, short x, short y) {
	if (partyMember != PartyMember.king) {
		prepareCastNameTilemap(partyMemberCastTileIDs[partyMember - 1], 6, x);
		copyCastNameTilemap(x, y, 6);
	} else {
		prepareCastNameTilemap(0x1C0, 6, x);
		copyCastNameTilemap(x, y, 6);
	}
}

/** Prints the cast name corresponding to the active entity's var 0. In Mother 2, the party member parameter is used
 * Params:
 * 	partyMember = Unused in Earthbound
 * 	x = The X coordinate (centred) to print the name at
 * 	y = The Y coordinate, relative to the BG3 scroll, to print the name at
 * Original_Address: $(DOLLAR)C4EC52
 */
void printCastNameEntityVar0(short partyMember, short x, short y) {
	printCastName(entityScriptVar0Table[currentEntitySlot], x, y);
}

/** Uploads a special cast palette, for the sprites that need it
 * $(DOLLAR)C4EC6E
 */
void uploadSpecialCastPalette(short id) {
	memcpy(&palettes[12][0], &buffer[0x7000 + id * 32], 0x20);
	paletteUploadMode = PaletteUpload.objOnly;
}

/** Creates an entity with the given sprite and script relative to the active entity's (Var0, Var1) + BG3 Y position
 * Params:
 * 	sprite = An overworld sprite ID
 * 	script = An ActionScript ID
 * Return: The ID of the newly-created entity
 * Original_Address: $(DOLLAR)C4ECAD
 */
short createEntityAtV01PlusBG3Y(short sprite, short script) {
	newEntityVar0 = initialCastEntitySleepFrames++ & 3;
	return createOverworldEntity(sprite, script, -1, entityScriptVar0Table[currentEntitySlot], cast(short)(entityScriptVar1Table[currentEntitySlot] + bg3YPosition));
}

/** Tests if the entity is still visible on the cast screen
 * Returns: true if onscreen, false otherwise
 * Original_Address: $(DOLLAR)C4ECE7
 */
short isEntityStillOnCastScreen() {
	short result = false;
	if (bg3YPosition - 8 < entityAbsYTable[currentEntitySlot]) {
		result = true;
	}
	return result;
}

/** Starts the cast scene
 * Original_Address: $(DOLLAR)C4ED0E
 */
void playCastScene() {
	loadCastScene();
	oamClear();
	fadeIn(1, 1);
	initEntityWipe(ActionScript.castScene, 0, 0);
	actionScriptState = ActionScriptState.running;
	while (actionScriptState == ActionScriptState.running) {
		finishFrame();
		drawBattleFrame();
	}
	fadeOutWithMosaic(1, 1, 0);
	for (short i = 0; i < maxEntities; i++) {
		if (entityScriptTable[i] == ActionScript.castScene) {
			deleteEntity(i);
		}
	}
	entityAllocationMinSlot = partyLeaderEntity;
	entityAllocationMaxSlot = partyLeaderEntity + 1;
	initEntity(0, 0, ActionScript.partyMemberLeading);
	clearParty();
	unknownC03A24();
	prepareForImmediateDMA();
	restoreMapRendering();
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
}

/** Replaces colour 3 with colour 0 in 2bpp graphics tiles
 * Params:
 * 	tiles = Number of tiles to process
 * Original_Address: $(DOLLAR)C4EEE1
 */
void changeVWF2BPPto3Colour(short tiles) {
	ubyte* buffer = &vwfBuffer[0][0];
	for (short i = 0; i < tiles * 16; i++) {
		ubyte x0F = 0;
		ubyte x00 = 0;
		ubyte x0E = buffer[0];
		ubyte x01 = buffer[1];
		for (short j = 0; j < 8; j++) {
			x00 *= 2;
			x0F *= 2;
			if (((x0E & 0x80) != 0) && ((x01 & 0x80) != 0)) {
				x00 &= 0xFE;
				x0F &= 0xFE;
			} else {
				x00 |= ((x0E & 0x80) != 0) ? 1 : 0;
				x0F |= ((x01 & 0x80) != 0) ? 1 : 0;
			}
			x0E *= 2;
			x01 *= 2;
		}
		buffer[1] = x0F;
		buffer[0] = x00;
		buffer += 2;
	}
}

/** Enqueues a credits DMA transfer
 * Params:
 * 	mode = DMA mode (see [earthbound.bank00.dmaTable])
 * 	count = Number of bytes to transfer
 * 	address = VRAM address
 * 	data = The CPU memory buffer
 * Original_Address: $(DOLLAR)C4EFC4
 */
void enqueueCreditsDMA(short mode, short count, short address, const(ubyte)* data) {
	creditsDMAQueue[creditsDMAQueueStart].mode = cast(ubyte)mode;
	creditsDMAQueue[creditsDMAQueueStart].count = count;
	creditsDMAQueue[creditsDMAQueueStart].data = data;
	creditsDMAQueue[creditsDMAQueueStart].address = address;
	creditsDMAQueueStart = (creditsDMAQueueStart + 1) & 0x7F;
}

/** Processes a single credits DMA queue entry, if there are any to process
 * Original_Address: $(DOLLAR)C4F01D
 */
void processCreditsDMAQueue() {
	if (creditsDMAQueueStart == creditsDMAQueueEnd) {
		return;
	}
	copyToVRAM(creditsDMAQueue[creditsDMAQueueEnd].mode, creditsDMAQueue[creditsDMAQueueEnd].count, creditsDMAQueue[creditsDMAQueueEnd].address, creditsDMAQueue[creditsDMAQueueEnd].data);
	creditsDMAQueueEnd = (creditsDMAQueueEnd + 1) & 0x7F;
}

/** Initializes the credits scene. Sets up hardware, transfers eeded graphics data, etc.
 * Original_Address: $(DOLLAR)C4F07D
 */
void initializeCreditsScene() {
	prepareForImmediateDMA();
	unknownC021E6();
	creditsCurrentRow = 0;
	creditsDMAQueueStart = 0;
	creditsDMAQueueEnd = 0;
	setBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0);
	setBG2VRAMLocation(BGTileMapSize.both, 0x7000, 0x2000);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x6C00, 0x6000);
	setOAMSize(0x62);
	bg3XPosition = 0;
	bg3YPosition = 0;
	bg2YPosition = 0;
	bg2XPosition = 0;
	bg1YPosition = 0;
	bg1XPosition = 0;
	updateScreen();
	*(cast(ushort*)&buffer[0]) = 0;
	copyToVRAM(VRAMCopyMode.repeatWordToVRAM, 0x1000, 0x3800, &buffer[0]);
	*(cast(ushort*)&buffer[0]) = 0x240C;
	// this is a strange way to fill VRAM at $7000 with 0x0C 0x24, but it works
	copyToVRAM(VRAMCopyMode.repeatByteToVRAMEven, 0x1000, 0x7000, &buffer[0]);
	copyToVRAM(VRAMCopyMode.repeatByteToVRAMOdd, 0x1000, 0x7000, &buffer[1]);
	decomp(&creditsPhotographBorderTilemap[0], &buffer[0]);
	memcpy(&palettes[1][0], &creditsPhotographBorderPalette[0], 0x20);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x700, 0x7000, &buffer[0]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0x2000, 0x2000, &buffer[0x700]);
	*(cast(ushort*)&buffer[0]) = 0;
	copyToVRAM(VRAMCopyMode.repeatWordToVRAM, 0x800, 0x6C00, &buffer[0x700]);
	decomp(&staffCreditsFontGraphics[0], &buffer[0]);
	copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, 0xC00, 0x6200, &buffer[0]);
	memcpy(&palettes[0][0], &staffCreditsFontPalette[0], 0x10);
	memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
	memset(&palettes[1][0], 0, 0x1E0);
	paletteUploadMode = PaletteUpload.full;
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	creditsNextCreditPosition = 0;
	creditsScrollPosition.combined = 0;
	creditsRowWipeThreshold = 7;
	ushort* buffer = &bg2Buffer[0];
	for (short i = 0; i < 0x200; i++) {
		*(buffer++) = 0;
	}
	creditsSource = &staffText[0];
	setForceBlank();
}

/** Attempts to render a credits photograph on BG1
 * Original_Address: $(DOLLAR)C4F264
 */
short tryRenderingPhotograph(short id) {
	if (getEventFlag(photographerConfigTable[id].eventFlag) == 0) {
		return 0;
	}
	photographMapLoadingMode = 1;
	currentPhotoDisplay = id;
	short enemySpawnFlagBackup = enemySpawnsEnabled;
	enemySpawnsEnabled = SpawnControl.allDisabled;
	ushort* x = cast(ushort*)&heap[0][0];
	// the original code went way beyond the heap. the heap appears to be 0x400 bytes, so perhaps they just forgot to factor the size of a short?
	for (short i = 0; i < 0x200/+0x400+/; i++) {
		*(x++) = 0;
	}
	paletteUploadMode = PaletteUpload.none;
	memcpy(&palettes[1][0], &creditsPhotographBorderPalette[0], 32);
	loadMapAtPosition(photographerConfigTable[id].mapX, photographerConfigTable[id].mapY);
	enemySpawnsEnabled = enemySpawnFlagBackup;
	bg2YPosition = 0;
	bg2XPosition = 0;
	photographMapLoadingMode = 0;
	// ensures that the photograph's entities's scripts don't all execute on the same frame, causing lag
	short entityWaitFrames = 0;
	for (short i = 0; i < 4; i++) {
		if (photographerConfigTable[id].objectConfig[i].sprite == 0) {
			continue;
		}
		newEntityVar0 = entityWaitFrames++;
		createOverworldEntity(photographerConfigTable[id].objectConfig[i].sprite, ActionScript.creditsObject, -1, photographerConfigTable[id].objectConfig[i].tileX, photographerConfigTable[id].objectConfig[i].tileY);
	}
	for (short i = 0; i < 6; i++) {
		if ((gameState.savedPhotoStates[id].partyMembers[i] & 0x1F) >= 18) {
			continue;
		}
		if ((gameState.savedPhotoStates[id].partyMembers[i] & 0x1F) == 0) {
			continue;
		}
		newEntityVar0 = entityWaitFrames++;
		unknownC07A31(createOverworldEntity(getCreditsPhotographPartySprite(gameState.savedPhotoStates[id].partyMembers[i]), ActionScript.creditsPartyMember, -1, photographerConfigTable[id].partyConfig[i].x, photographerConfigTable[id].partyConfig[i].y), gameState.savedPhotoStates[id].partyMembers[i]);
	}
	return 1;
}

/** Counts the number of photographs to display in the credits
 * Original_Address: $(DOLLAR)C4F433
 */
short countPhotoFlags() {
	short result = 0;
	for (short i = 0; i < 32; i++) {
		if (getEventFlag(photographerConfigTable[i].eventFlag) != 0) {
			result++;
		}
	}
	return result;
}

/** Handles the sliding animation for photographs in the credits sequence
 * Params:
 * 	id = A photograph index
 * Original_Address: $(DOLLAR)C4F46F
 */
void slideCreditsPhotograph(short id) {
	enum speed = 256;
	auto slideIncrements = angleToVector(cast(short)(photographerConfigTable[id].slideDirection * 0x400), speed);
	short startX = bg1XPosition;
	short startY = bg1YPosition;
	short newXOffset = 0;
	short newYOffset = 0;
	for (short i = 0; i < (photographerConfigTable[id].slideDistance << 8) / speed; i++) {
		newXOffset += slideIncrements.x;
		newYOffset += slideIncrements.y;
		bg1XPosition = cast(ushort)((newXOffset / speed) + startX);
		bg1YPosition = cast(ushort)((newYOffset / speed) + startY);
		bg2XPosition = cast(ushort)(newXOffset / speed);
		bg2YPosition = cast(ushort)(newYOffset / speed);
		processCreditsDMAQueue();
		finishFrame();
	}
}

/** Plays the credits sequence
 * Original_Address: $(DOLLAR)C4F554
 */
void playCredits() {
	disabledTransitions = 1;
	initializeCreditsScene();
	oamClear();
	fadeIn(1, 2);
	short timeBetweenPhotos = (countPhotoFlags() != 0) ? (4528 / countPhotoFlags()) : 4528;
	short timeUntilNextPhoto = timeBetweenPhotos;
	setIRQCallback(&creditsScrollFrame);
	for (short i = 0; i < 32; i++) {
		if (tryRenderingPhotograph(i) != 0) {
			prepareLoadedPaletteFadeTables(64, PaletteMask.all);
			for (short j = 0x40; j != 0; j--) {
				updatePaletteFade();
				processCreditsDMAQueue();
				finishFrame();
			}
			finishPaletteFade();
			slideCreditsPhotograph(i);
			while (timeUntilNextPhoto > bg3YPosition) {
				processCreditsDMAQueue();
				finishFrame();
			}
			memset(&buffer[32], 0, 0x1E0);
			prepareLoadedPaletteFadeTables(64, PaletteMask.all);
			for (short j = 0; j < 64; j++) {
				updatePaletteFade();
				processCreditsDMAQueue();
				finishFrame();
			}
			memset(&palettes[1][0], 0, 0x1E0);
			preparePaletteUpload(PaletteUpload.full);
			processCreditsDMAQueue();
			finishFrame();
			timeUntilNextPhoto += timeBetweenPhotos;
		}
	}
	while (bg3YPosition < 4528) {
		processCreditsDMAQueue();
		finishFrame();
	}
	resetIRQCallback();
	for (short i = 0; i < 2000; i++) {
		finishFrame();
	}
	fadeOutWithMosaic(1, 2, 0);
	setWindowBrightness(0xB3, 0);
	prepareForImmediateDMA();
	overworldSetupVRAM();
	unknownC021E6();
	entityAllocationMinSlot = partyLeaderEntity;
	entityAllocationMaxSlot = partyLeaderEntity + 1;
	initEntity(ActionScript.partyMemberLeading, 0, 0);
	clearParty();
	unknownC03A24();
	ushort* buffer = &bg2Buffer[0];
	for (short i = 0; i < 0x200; i++) {
		*(buffer++) = 0;
	}
	restoreMapRendering();
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	setIRQCallback(&processOverworldTasks);
	disabledTransitions = 0;
}

/** Gets the real audio bank of an audio pack. Effectively a no-op in Earthbound
 * Returns: The fixed bank portion of an audio pack
 * Params:
 * 	val = The bank portion of an audio pack
 * Original_Address: $(DOLLAR)C4FB42
 */
ushort getAudioBank(ushort val) {
	sequencePackMask = -1;
	version(mother2) {
		return cast(ushort)(val + 0xE2);
	} else {
		return val;
	}
}

/** Changes the currently-playing music track
 * Original_Address: $(DOLLAR)C4FBBD
 */
void changeMusic(short track) {
	if (track == currentMusicTrack) {
		return;
	}
	tracef("Playing song: %s", cast(Music)track);
	if (disabledTransitions == 0) {
		playSfxUnknown();
	}
	if ((track < Music.soundstoneRecordingGiantStep) || (track > Music.soundstoneRecordingFireSpring)) {
		musicEffect(MusicEffect.normal);
		stopMusic();
	}
	currentMusicTrack = track;
	playMusicExternal(track);
}

/** Initializes the music subsystem
 * Original_Address: $(DOLLAR)C4FB58
 */
void initializeSPC700() {
	enableAutoSectorMusicChanges = 1;
}

/** Sets number of audio channels
 * Params:
 * 	channels = Number of channels (minus one)
 * Original_Address: $(DOLLAR)C4FD18
 */
void setAudioChannels(short channels) {
	setAudioChannelsExternal(channels);
}

/** Turns automatic sector music changes on or off
 * Params:
 * 	val = 0 to disable, 1 to enable
 * Original_Address: $(DOLLAR)C4FD45
 */
void setAutoSectorMusicChanges(short val) {
	enableAutoSectorMusicChanges = val;
}
