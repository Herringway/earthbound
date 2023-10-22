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

import std.experimental.logger;

/// $C40015
short unknownC40015() {
	entityAnimationFrames[actionScriptVar88 / 2] = 0;
	updateEntitySpriteCurrentFrame0();
	return unknownC0C6B6();
}

/// $C40023
void unknownC40023() {
	entityScriptSleepFrames[currentEntityScriptOffset / 2] = currentEntitySlot & 0xF;
}

/// $C4002F
void uploadTextTile(short arg1, ushort arg2, ushort arg3) {
	dmaCopyRAMSource = &vwfBuffer[arg1][0];
	dmaCopyMode = 0;
	dmaCopySize = 16;
	//lol segmented addressing
	//dmaCopyRAMSource = 0x7E
	dmaCopyVRAMDestination = cast(ushort)((arg2 * 8) + 0x6000);
	copyToVRAMCommon();
	dmaCopyRAMSource += 0x10;
	dmaCopyVRAMDestination = cast(ushort)((arg3 * 8) + 0x6000);
	copyToVRAMCommon();
	dmaTransferFlag = (mirrorINIDISP & 0x80) ^ 0x80;
}

/// $C40085
short unknownC40085() {
	ushort y = 8;
	ushort a = 0xFFFF;
	while (a == usedBG2TileMap[y / 2]) {
		y += 2;
		if (y != 0x40) {
			continue;
		}
		unknownC10000();
		closeAllWindows();
		unfreezeEntities();
		//longjmp(&jmpbuf2);
	}
	ushort x = 30;
	a = usedBG2TileMap[y / 2];
	while (a >= 0x8000) {
		x -= 2;
		a <<= 1;
	}
	usedBG2TileMap[y / 2] |= powersOfTwo16Bit[x / 2];
	usedBG2TileMapFirstFreeBit = x;
	usedBG2TileMapFirstFreeBit >>= 1;
	return cast(short)(usedBG2TileMapFirstFreeBit + y * 8);
}

/// $C40B51
void unknownC40B51() {
	stopMusic();
	setBGMODE(BGMode.mode1);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x4000, 0);
	mirrorTM = TMTD.bg3;
	prepareForImmediateDMA();
}

/// $C40B75
noreturn unknownC40B75() {
	copyToVRAM(0, 0xA00, 0, &buffer[0]);
	copyToVRAM(0, 0x800, 0x4000, &buffer[0x4000]);
	memcpy(&palettes[0][0], &warningPalette[0], 0x10);
	preparePaletteUpload(PaletteUpload.full);
	fadeInWithMosaic(1, 1, 0);
	while (true) {}
}

/// $C40BD4
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

/// $C40BE8
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

/// $C40DE8
immutable FloatingSpriteTableEntry[12] floatingSpriteTable = [
	FloatingSpriteTableEntry(OverworldSprite.none, 0x00, 0x00, 0x00),
	FloatingSpriteTableEntry(OverworldSprite.surpriseMark, 0x02, 0x00, 0xF8),
	FloatingSpriteTableEntry(OverworldSprite.cellPhoneTendaVillage, 0x05, 0xF8, 0xFC),
	FloatingSpriteTableEntry(OverworldSprite.exclamationMark, 0x02, 0x08, 0xF8),
	FloatingSpriteTableEntry(OverworldSprite.lightBulb, 0x02, 0x00, 0xF8),
	FloatingSpriteTableEntry(OverworldSprite.skyRunnerElectricThingies, 0x02, 0x00, 0xF4),
	FloatingSpriteTableEntry(OverworldSprite.flagOfTheExtinctHappyPeople, 0x02, 0x00, 0x08),
	FloatingSpriteTableEntry(OverworldSprite.runaway5MembersHead, 0x02, 0xF8, 0x10),
	FloatingSpriteTableEntry(OverworldSprite.runaway5MembersHead, 0x02, 0x08, 0x10),
	FloatingSpriteTableEntry(OverworldSprite.heart, 0x02, 0x00, 0xF8),
	FloatingSpriteTableEntry(OverworldSprite.busDriverHead, 0x02, 0xF0, 0x10),
	FloatingSpriteTableEntry(OverworldSprite.busDriverHead, 0x02, 0x10, 0x10),
];

/// $C40E31
immutable ubyte entityOverlayCount = 4;

/// $C40E32
immutable EntityOverlaySprite[4] entityOverlaySprites = [
	EntityOverlaySprite(OverworldSprite.sweat, 0, 1),
	EntityOverlaySprite(OverworldSprite.littleMushroom, 0, 0xFF),
	EntityOverlaySprite(OverworldSprite.waterRipple, 0, 0xFF),
	EntityOverlaySprite(OverworldSprite.bigWaterRipple, 0, 0xFF),
];

///
immutable SpriteMap[2] entityOverlaySweatingFrame41 = [
	SpriteMap(0xF0,0x60, 0x33 | SpritemapOrientation.horizontal, 0xEA, 0x80),
	SpriteMap(0xF0,0x60, 0x23 | SpritemapOrientation.horizontal, 0xEA, 0x80),
];

///
immutable SpriteMap[2] entityOverlaySweatingFrame42 = [
	SpriteMap(0xF0,0x62, 0x33 | SpritemapOrientation.horizontal, 0xEA, 0x80),
	SpriteMap(0xF0,0x62, 0x23 | SpritemapOrientation.horizontal, 0xEA, 0x80),
];

///
immutable SpriteMap[2] entityOverlaySweatingFrame43 = [
	SpriteMap(0xF0,0x60, 0x33, 0x04, 0x80),
	SpriteMap(0xF0,0x60, 0x23, 0x04, 0x80),
];

///
immutable SpriteMap[2] entityOverlaySweatingFrame44 = [
	SpriteMap(0xF0, 0x62, 0x33, 0x04, 0x80),
	SpriteMap(0xF0, 0x62, 0x23, 0x04, 0x80),
];

///
immutable SpriteMap[2] entityOverlayMushroomizedFrame1 = [
	SpriteMap(0xE8, 0x64, 0x33, 0xF8, 0x80),
	SpriteMap(0xE8, 0x64, 0x23, 0xF8, 0x80),
];

///
immutable SpriteMap[2] entityOverlayRippleFrame1 = [
	SpriteMap(0xFE, 0x66, 0x33, 0xF8, 0x80),
	SpriteMap(0xFE, 0x66, 0x23, 0xF8, 0x80),
];

///
immutable SpriteMap[2] entityOverlayRippleFrame2 = [
	SpriteMap(0xFE,0x66, 0x33 | SpritemapOrientation.horizontal, 0xF8, 0x80),
	SpriteMap(0xFE,0x66, 0x23 | SpritemapOrientation.horizontal, 0xF8, 0x80),
];

///
immutable SpriteMap[4] entityOverlayBigRippleFrame1 = [
	SpriteMap(0xF8, 0x68, 0x33, 0xF0, 0x00),
	SpriteMap(0xF8, 0x6A, 0x33, 0x00, 0x80),
	SpriteMap(0xF8, 0x68, 0x23, 0xF0, 0x00),
	SpriteMap(0xF8, 0x6A, 0x23, 0x00, 0x80),
];

///
immutable SpriteMap[] entityOverlayBigRippleFrame2 = [
	SpriteMap(0xF8,0x6A, 0x33 | SpritemapOrientation.horizontal, 0xF0, 0x00),
	SpriteMap(0xF8,0x68, 0x33 | SpritemapOrientation.horizontal, 0x00, 0x80),
	SpriteMap(0xF8,0x6A, 0x23 | SpritemapOrientation.horizontal, 0xF0, 0x00),
	SpriteMap(0xF8,0x68, 0x23 | SpritemapOrientation.horizontal, 0x00, 0x80),
];

///
immutable OverlayScript[13] entityOverlaySweating;

///
immutable OverlayScript[3] entityOverlayMushroomized;

///
immutable OverlayScript[5] entityOverlayRipple;

///
immutable OverlayScript[5] entityOverlayBigRipple;

/// $C41A9E
void decomp(const(ubyte)* data, void* buffer) {
	//I'm not gonna redo perfectly good work that already exists
	decompBlock(data, cast(ubyte*)buffer, 0x10000);
}

/// $C41EFF - Calculates the screen angle between two given points. Range is 0- 65535, covering a full 360 degrees
ushort getScreenAngle(short x1, short y1, short x2, short y2) {
	short a = cast(short)(x1 - x2);
	short y;
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	y = a;
	a = cast(short)(y1 - y2);
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	short x0C = a;
	a = y;
	while (true) {
		if (a < 0x100) {
			break;
		}
		a /= 2;
		x0C /= 2;
	}
	short x0A = a;
	a = cast(short)(y1 - y2);
	if (a == 0) {
		a = 8;
	} else if (a > 0) {
		a = 2;
	} else {
		a = 0;
	}
	if (x1 - x2 == 0) {
		a |= 4;
	} else if (x1 - x2 > 0) {
		a |= 1;
	}
	if ((a & 0xC) != 0) {
		return unknownC41FC5[a];
	}
	short x0E = a;
	short x08 = cast(short)(a * 2);
	a = x0C;
	XBA(a);
	if ((a & 0xFF) != 0) {
		a = -1;
	}
	a = cast(ushort)a / x0A;
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
	0x000D,
	0x0026,
	0x0040,
	0x005C,
	0x0079,
	0x0099,
	0x00BE,
	0x00E8,
	0x011A,
	0x0159,
	0x01AB,
	0x021D,
	0x02CB,
	0x03FD,
	0x06BB,
	0x143D,
];

/// $C41FFF
auto unknownC41FFF(ushort arg1, ushort arg2) {
	static struct Result {
		short y;
		short x;
	}
	short arg1Modified = ((arg1 >> 8) & 0xFC) >> 1;
	short a;
	if (unknownC41FFFSineTable[arg1Modified / 2] == 0x100) {
		a = arg2;
	} else {
		a = unknownC4213F(unknownC41FFFSineTable[arg1Modified / 2], arg2);
	}
	short a2;
	if (unknownC41FFFSineTable[arg1Modified / 2 + 48] == 0x100) {
		a2 = arg2;
	} else {
		a2 = unknownC4213F(unknownC41FFFSineTable[arg1Modified / 2 + 48], arg2);
	}
	if ((arg1Modified < 0x20) || (arg1Modified >= 0x62)) {
		a2 = cast(short)-cast(int)a2;
	}
	if ((arg1Modified >= 0x42) && (arg1Modified < 0x80)) {
		a = cast(short)-cast(int)a;
	}
	// a = sin(arg1) * arg2
	// a2 = -cos(arg1) * arg2
	return Result(a2, a);
}

unittest {
	with(unknownC41FFF(0x3800, 0xC0)) {
		assert(y == -37);
		assert(x == 188);
	}
	with(unknownC41FFF(0xA000, 0x80)) {
		assert(y == 90);
		assert(x == -90);
	}
	with(unknownC41FFF(0xB400, 0x80)) {
		assert(y == 37);
		assert(x == -122);
	}
}

/// $C4205D and $C420BD
immutable ushort[113] unknownC41FFFSineTable = [
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

/// $C4213F
short unknownC4213F(short arg1, short arg2) {
	return cast(short)((((arg2 & 0xFF00) >> 8) * (arg1 & 0xFF)) + ((arg2 & 0xFF) * (arg1 & 0xFF) >> 8));
}

/// $C423DC
void unknownC423DC() {
	WH0 = 0x80;
	WH2 = 0x80;
	WH1 = 0x7F;
	WH3 = 0x7F;
	CGWSEL = 0x10;
	TMW = 0x13;
	WBGLOG = 0;
	WOBJLOG = 0;
}

/// $C4240A
void unknownC4240A() {
	WH0 = 0;
	WH2 = 0;
	WH1 = 0xFF;
	WH3 = 0xFF;
	CGWSEL = 0x20;
	TMW = 0x13;
	WBGLOG = 0;
	WOBJLOG = 0;
}

/// $C42439
void unknownC42439(short arg1) {
	CGADSUB = cast(ubyte)arg1;
	setFixedColourData(unknown7E9E37 | 0x80);
	setFixedColourData(unknown7E9E38 | 0x40);
	setFixedColourData(unknown7E9E39 | 0x20);
}

/// $C4245D
void rectangleWindowEnableHdma(ubyte* arg1) {
	dmaChannels[4].DMAP = 1;
	dmaChannels[4].BBAD = 0x26;
	dmaChannels[4].A1T = arg1;
	WOBJSEL = 0xA0;
	mirrorHDMAEN |= 0x10;
}

/// $C4248A
void unknownC4248A() {
	mirrorHDMAEN &= ~0x10;
	WOBJSEL = 0;
}

/// $C4249A
void unknownC4249A(ubyte arg1, ubyte arg2) {
	CGADSUB = arg1;
	WOBJSEL = 0x20;
	WH0 = 0;
	WH1 = 0xFF;
	TMW = 0x13;
	WBGLOG = 0;
	WOBJLOG = 0;
	CGWSEL = 0x10;
	setFixedColourData(arg2 | 0xE0);
}

/// $C424D1
void unknownC424D1() {
	WOBJSEL = 0x20;
	WH0 = 0x80;
	WH1 = 0x7F;
	TMW = 0x13;
	WBGLOG = 0;
	WOBJLOG = 0;
	CGWSEL = 0x20;
	CGADSUB = 0xB3;
	setFixedColourData(0xEF);
}

/// $C42542
void unknownC42542(ubyte* arg1) {
	dmaChannels[4].DMAP = 1;
	dmaChannels[4].BBAD = 0x26;
	dmaChannels[4].A1T = arg1;
	mirrorHDMAEN |= 0x10;
}

/// $C4257F
void unknownC4257F() {
	mirrorHDMAEN &= ~0x10;
}

/// $C4258C
void unknownC4258C() {
	WOBJSEL = 0xA0;
	WH0 = 0x80;
	WH2 = 0x80;
	WH1 = 0x7F;
	WH3 = 0x7F;
	TMW = 0x13;
	WBGLOG = 0;
	WOBJLOG = 0;
	CGWSEL = 0x20;
	CGADSUB = 0xB3;
	setFixedColourData(0xEF);
}

/// $C425CC
void unknownC425CC(ubyte* arg1) {
	dmaChannels[4].DMAP = 1;
	dmaChannels[4].BBAD = 0x26;
	dmaChannels[4].A1T = arg1;
	mirrorHDMAEN |= 0x10;
}

/// $C425F3
void unknownC425F3() {
	mirrorHDMAEN &= ~0x10;
}

/// $C425FD
void unknownC425FD(ubyte* arg1) {
	dmaChannels[5].DMAP = 1;
	dmaChannels[5].BBAD = 0x28;
	dmaChannels[5].A1T = arg1;
	mirrorHDMAEN |= 0x20;
}

/// $C42624
void unknownC42624() {
	mirrorHDMAEN &= ~0x20;
}

/// $C42631
void unknownC42631(short arg1, short arg2) {
	unknown7E3C22 = 0;
	transitionBackgroundXVelocity = 0;
	unknown7E3C26 = 0;
	transitionBackgroundYVelocity = 0;
	short a = sineMult(arg1, cast(ubyte)(arg2 - 128));
	unknown7E3C22 = cast(short)((a & 0xFF) << 8);
	transitionBackgroundXVelocity = (cast(ushort)a & 0xFF00) >> 8;
	if (a < 0) {
		transitionBackgroundXVelocity |= 0xFF00;
	}
	a = cosineMult(arg1, cast(ubyte)(arg2 - 128));
	unknown7E3C26 = cast(short)((a & 0xFF) << 8);
	transitionBackgroundYVelocity = (cast(ushort)a & 0xFF00) >> 8;
	if (a < 0) {
		transitionBackgroundYVelocity |= 0xFF00;
	}
	transitionBackgroundX = bg1XPosition;
	transitionBackgroundY = bg1YPosition;
	unknown7E3C2A = 0;
	unknown7E3C2E = 0;
}

/// $C4268A
void unknownC4268A() {
	unknown7E3C2A += unknown7E3C22;
	transitionBackgroundX += transitionBackgroundXVelocity;
	bg1XPosition = transitionBackgroundX;
	bg2XPosition = transitionBackgroundX;
	unknown7E3C2E += unknown7E3C26;
	transitionBackgroundY += transitionBackgroundYVelocity;
	bg1YPosition = transitionBackgroundY;
	bg2YPosition = transitionBackgroundY;
	unknownC01731(bg1XPosition, bg1YPosition);
}

/// $C426C7
void unknownC426C7() {
	for (short i = 0; i != maxEntities; i++) {
		if (entityScriptTable[i] < 0) {
			continue;
		}
		entityScreenXTable[i] = cast(short)(entityAbsXTable[i] - bg1XPosition);
		entityScreenYTable[i] = cast(short)(entityAbsYTable[i] - bg1YPosition);
	}
}

/// $C426ED - Palette animation
void updateMapPaletteAnimation() {
	// Use ushort addition instead of byte addition since we need carrying
	// At that point, it's easier to just use 7F0000 as ushort everywhere
	ushort* Word7F0000 = cast(ushort*)(&buffer[0]);
	for (short i = 0; i < 0x100; i += 1) {
		// Red channel
		Word7F0000[0x400 + i] += Word7F0000[0x100 + i];
		ushort a = Word7F0000[0x400 + i];
		if ((a & 0x8000) != 0) {
			Word7F0000[0x100 + i] = 0;
			a = 0;
		} else {
			a &= 0x1F00;
			if (a == 0x1F00) {
				Word7F0000[0x100 + i] = 0;
			}
		}
		a = (a >> 8) & 0x1F;
		// Green channel
		Word7F0000[0x500 + i] += Word7F0000[0x200 + i];
		ushort a2 = Word7F0000[0x500 + i];
		if ((a2 & 0x8000) != 0) {
			Word7F0000[0x200 + i] = 0;
			a2 = 0;
		} else {
			a2 &= 0x1F00;
			if (a2 == 0x1F00) {
				Word7F0000[0x200 + i] = 0;
			}
		}
		a = cast(ushort)((a2 >> 3) | a);
		// Blue channel
		Word7F0000[0x600 + i] += Word7F0000[0x300 + i];
		a2 = Word7F0000[0x600 + i];
		if ((a2 & 0x8000) != 0) {
			// Vanilla bug: we set the slope for the green channel to 0 instead of blue channel.
			// Word7F0000[0x200 + i] = 0;
			// Intended behaviour:
			Word7F0000[0x300 + i] = 0;
			a2 = 0;
		} else {
			a2 &= 0x1F00;
			if (a2 == 0x1F00) {
				Word7F0000[0x300 + i] = 0;
			}
		}
		(cast(ushort*)&palettes)[i] = cast(ushort)((a2 << 2) | a);
	}
	paletteUploadMode = PaletteUpload.full;
}

/// $C4283F
void unknownC4283F(short arg1, ubyte* arg2, short arg3) {
	//original code adjusted for the fact that the lower 4 bits were used as flags, but we separated them
	const(ubyte)* x00 = &sprites[entityGraphicsPointers[arg1][spriteDirectionMappings8Direction[entityDirections[arg1]] + entityAnimationFrames[arg1]].id][0];
	//UNKNOWN_30X2_TABLE_31 has the bank bytes but we don't need those
	do {
		(cast(ushort*)&arg2[0])[arg3] = (cast(ushort*)x00)[arg3];
	} while (--arg3 > 0);
}

/// $C42884
void unknownC42884(short arg1, ubyte* arg2, short arg3) {
	OverworldSpriteGraphics* x00 = &entityGraphicsPointers[arg1][0];
	if (spriteDirectionMappings4Direction[entityDirections[arg1]] != 0) {
		for (short i = spriteDirectionMappings4Direction[entityDirections[arg1]]; i != 0; i--) {
			x00++;
		}
	}
	//UNKNOWN_30X2_TABLE_31 has the bank bytes but we don't need those
	//original code adjusted for the fact that the lower 4 bits were used as flags, but we separated them
	const(ubyte)* x00_2 = &sprites[x00.id][0];
	do {
		(cast(ushort*)&arg2[0])[arg3] = (cast(ushort*)x00_2)[arg3];
	} while (--arg3 > 0);
}

/// $C428D1
void unknownC428D1(ushort* dest, ushort* src, short arg3, short arg4) {
	short x = cast(short)(arg4 * 2);
	short y = arg3;
	do {
		dest[y / 2] = src[y / 2];
		y += 16;
	} while (--x != 0);
}

/// $C428FC
void unknownC428FC(ushort* dest, ushort* src, short arg3, short arg4, short arg5)
	in(dest, "Missing dest")
	in(src, "Missing src")
{
	ushort x08 = pixelPlaneMasks[arg3 & 7];
	ushort x0A = 0xFFFF ^ pixelPlaneMasks[arg3 & 7];
	short y = cast(short)((arg3 & 0xFFF8) * 4);
	short x0E = arg4 / 8;
	do {
		short x = 16;
		short tmp = y;
		do {
			dest[y / 2] = (dest[y / 2] & x0A) | (src[y / 2] & x08);
			y += 2;
		} while (--x != 0);
		y = cast(short)(tmp + arg5);
	} while (--x0E != 0);
}

/// $C42965 - Copies a pixel from one 4BPP tile to another
void copyPixel(ushort* dest, ushort* src, short pixelRow, short pixelColumn) {
	ushort x08 = pixelPlaneMasks[pixelColumn];
	ushort x0A = x08 ^ 0xFFFF;
	// plane 0-1
	ushort x0C = src[pixelRow / 2] & x08;
	dest[pixelRow / 2] = (dest[pixelRow / 2] & x0A) | x0C;
	// plane 2-3
	pixelRow += 16;
	x0C = src[pixelRow / 2] & x08;
	dest[pixelRow / 2] = (dest[pixelRow / 2] & x0A) | x0C;
}

/// $C42955 - masks for getting individual pixels out of a 2 plane pair
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

/// $C429AE
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

/// $C429E8
void unknownC429E8(short channel) {
	//segmented addressing stuff
	//dmaChannels[channel].A1B = 0x7E;
	//dmaChannels[channel].DASB = 0x7E;
	dmaChannels[channel].BBAD = 0x2C;
	dmaChannels[channel].DMAP = DMATransferUnit.Word;
	dmaChannels[channel].A1T = &unknown7EADB8[0];
	mirrorHDMAEN |= dmaFlags[channel];
}

/// $C42A1F
immutable short[17] unknownC42A1F = [
	EntitySize._8x16: 0x0008,
	EntitySize._16x16: 0x0008,
	EntitySize._24x16: 0x000C,
	EntitySize._32x16: 0x0010,
	EntitySize._48x16: 0x0018,
	EntitySize._16x24: 0x0008,
	EntitySize._24x24: 0x000C,
	EntitySize._16x32: 0x0008,
	EntitySize._32x24: 0x0010,
	EntitySize._48x32: 0x0018,
	EntitySize._24x48: 0x000C,
	EntitySize._16x48: 0x0008,
	EntitySize._32x48: 0x0010,
	EntitySize._48x48: 0x0018,
	EntitySize._64x48: 0x0020,
	EntitySize._64x64: 0x0020,
	EntitySize._64x80: 0x0020,
];

/// $C42A41
immutable short[17] unknownC42A41 = [
	EntitySize._8x16: 0x0008,
	EntitySize._16x16: 0x0008,
	EntitySize._24x16: 0x0008,
	EntitySize._32x16: 0x0008,
	EntitySize._48x16: 0x0008,
	EntitySize._16x24: 0x0018,
	EntitySize._24x24: 0x0018,
	EntitySize._16x32: 0x0018,
	EntitySize._32x24: 0x0018,
	EntitySize._48x32: 0x0018,
	EntitySize._24x48: 0x0020,
	EntitySize._16x48: 0x0028,
	EntitySize._32x48: 0x0028,
	EntitySize._48x48: 0x0028,
	EntitySize._64x48: 0x0028,
	EntitySize._64x64: 0x0038,
	EntitySize._64x80: 0x0048,
];

/// $C42A63
immutable short[17] pixelWidths = [
	EntitySize._8x16: 0x0010, // off by 8?
	EntitySize._16x16: 0x0010,
	EntitySize._24x16: 0x0020, // off by 8?
	EntitySize._32x16: 0x0020,
	EntitySize._48x16: 0x0030,
	EntitySize._16x24: 0x0010,
	EntitySize._24x24: 0x0018,
	EntitySize._16x32: 0x0010,
	EntitySize._32x24: 0x0020,
	EntitySize._48x32: 0x0030,
	EntitySize._24x48: 0x0018,
	EntitySize._16x48: 0x0010,
	EntitySize._32x48: 0x0020,
	EntitySize._48x48: 0x0030,
	EntitySize._64x48: 0x0040,
	EntitySize._64x64: 0x0040,
	EntitySize._64x80: 0x0040,
];

/// $C42AA7
immutable short[17] hitboxWidths = [
	EntitySize._8x16: 0x0002,
	EntitySize._16x16: 0x0000,
	EntitySize._24x16: 0x0002,
	EntitySize._32x16: 0x0004,
	EntitySize._48x16: 0x0006,
	EntitySize._16x24: 0x0002,
	EntitySize._24x24: 0x0003,
	EntitySize._16x32: 0x0002,
	EntitySize._32x24: 0x0004,
	EntitySize._48x32: 0x0006,
	EntitySize._24x48: 0x0000,
	EntitySize._16x48: 0x0002,
	EntitySize._32x48: 0x0004,
	EntitySize._48x48: 0x0006,
	EntitySize._64x48: 0x0008,
	EntitySize._64x64: 0x0000,
	EntitySize._64x80: 0x0006,
];

/// $C42AEB - Original meaning unknown.
immutable short[17] unknownC42AEB = [
	EntitySize._8x16: 0x000A,
	EntitySize._16x16: 0x0000,
	EntitySize._24x16: 0x000A,
	EntitySize._32x16: 0x000A,
	EntitySize._48x16: 0x000A,
	EntitySize._16x24: 0x0018,
	EntitySize._24x24: 0x0018,
	EntitySize._16x32: 0x0018,
	EntitySize._32x24: 0x0010,
	EntitySize._48x32: 0x0010,
	EntitySize._24x48: 0x0000,
	EntitySize._16x48: 0x0028,
	EntitySize._32x48: 0x0020,
	EntitySize._48x48: 0x0020,
	EntitySize._64x48: 0x0020,
	EntitySize._64x64: 0x0000,
	EntitySize._64x80: 0x0041,
];

/// $C42AC9
immutable short[17] hitboxHeights = [
	EntitySize._8x16: 0x0001,
	EntitySize._16x16: 0x0000,
	EntitySize._24x16: 0x0001,
	EntitySize._32x16: 0x0001,
	EntitySize._48x16: 0x0001,
	EntitySize._16x24: 0x0001,
	EntitySize._24x24: 0x0001,
	EntitySize._16x32: 0x0001,
	EntitySize._32x24: 0x0002,
	EntitySize._48x32: 0x0002,
	EntitySize._24x48: 0x0000,
	EntitySize._16x48: 0x0001,
	EntitySize._32x48: 0x0002,
	EntitySize._48x48: 0x0002,
	EntitySize._64x48: 0x0002,
	EntitySize._64x64: 0x0000,
	EntitySize._64x80: 0x0002,
];

/// $C42B0D
immutable SpriteMapTemplates[17] overworldSpriteTemplates = [
	EntitySize._8x16: SpriteMapTemplates(1, 0, [
			[SpriteMap(0xF8, 0x00, 0x00, 0xF8, 0x80), SpriteMap(0xF8, 0x00, 0x40, 0xF8, 0x80)],
		]
	),
	EntitySize._16x16: SpriteMapTemplates(1, 0, [
			[SpriteMap(0xF8, 0x00, 0x00, 0xF8, 0x80), SpriteMap(0xF8, 0x00, 0x40, 0xF8, 0x80)],
		]
	),
	EntitySize._24x16: SpriteMapTemplates(2, 0, [
			[SpriteMap(0xF8, 0x00, 0x00, 0xF4, 0x00), SpriteMap(0xF8, 0x02, 0x00, 0x04, 0x80)],
			[SpriteMap(0xF8, 0x00, 0x40, 0xFC, 0x00), SpriteMap(0xF8, 0x02, 0x40, 0xEC, 0x80)],
		]
	),
	EntitySize._32x16: SpriteMapTemplates(2, 0, [
			[SpriteMap(0xF8, 0x00, 0x00, 0xF0, 0x00), SpriteMap(0xF8, 0x02, 0x00, 0x00, 0x80)],
			[SpriteMap(0xF8, 0x00, 0x40, 0x00, 0x00), SpriteMap(0xF8, 0x02, 0x40, 0xF0, 0x80)],
		]
	),
	EntitySize._48x16: SpriteMapTemplates(3, 0, [
			[SpriteMap(0xF8, 0x00, 0x00, 0xE8, 0x00), SpriteMap(0xF8, 0x02, 0x00, 0xF8, 0x00)],
			[SpriteMap(0xF8, 0x04, 0x00, 0x08, 0x80), SpriteMap(0xF8, 0x00, 0x40, 0x08, 0x00)],
			[SpriteMap(0xF8, 0x02, 0x40, 0xF8, 0x00), SpriteMap(0xF8, 0x04, 0x40, 0xE8, 0x80)],
		]
	),
	EntitySize._16x24: SpriteMapTemplates(2, 1, [
			[SpriteMap(0xE8, 0x00, 0x00, 0xF8, 0x00), SpriteMap(0xF8, 0x02, 0x00, 0xF8, 0x80)],
			[SpriteMap(0xE8, 0x00, 0x40, 0xF8, 0x00), SpriteMap(0xF8, 0x02, 0x40, 0xF8, 0x80)],
		]
	),
	EntitySize._24x24: SpriteMapTemplates(4, 2, [
			[SpriteMap(0xE8, 0x00, 0x00, 0xF4, 0x00), SpriteMap(0xE8, 0x02, 0x00, 0x04, 0x00)],
			[SpriteMap(0xF8, 0x04, 0x00, 0xF4, 0x00), SpriteMap(0xF8, 0x06, 0x00, 0x04, 0x80)],
			[SpriteMap(0xE8, 0x00, 0x40, 0xFC, 0x00), SpriteMap(0xE8, 0x02, 0x40, 0xEC, 0x00)],
			[SpriteMap(0xF8, 0x04, 0x40, 0xFC, 0x00), SpriteMap(0xF8, 0x06, 0x40, 0xEC, 0x80)],
		]
	),
	EntitySize._16x32: SpriteMapTemplates(2, 1, [
			[SpriteMap(0xE8, 0x00, 0x00, 0xF8, 0x00), SpriteMap(0xF8, 0x02, 0x00, 0xF8, 0x80)],
			[SpriteMap(0xE8, 0x00, 0x40, 0xF8, 0x00), SpriteMap(0xF8, 0x02, 0x40, 0xF8, 0x80)],
		]
	),
	EntitySize._32x24: SpriteMapTemplates(4, 2, [
			[SpriteMap(0xE8, 0x00, 0x00, 0xF0, 0x00), SpriteMap(0xE8, 0x02, 0x00, 0x00, 0x00)],
			[SpriteMap(0xF8, 0x04, 0x00, 0xF0, 0x00), SpriteMap(0xF8, 0x06, 0x00, 0x00, 0x80)],
			[SpriteMap(0xE8, 0x00, 0x40, 0x00, 0x00), SpriteMap(0xE8, 0x02, 0x40, 0xF0, 0x00)],
			[SpriteMap(0xF8, 0x04, 0x40, 0x00, 0x00), SpriteMap(0xF8, 0x06, 0x40, 0xF0, 0x80)],
		]
	),
	EntitySize._48x32: SpriteMapTemplates(6, 3, [
			[SpriteMap(0xE8, 0x00, 0x00, 0xE8, 0x00), SpriteMap(0xE8, 0x02, 0x00, 0xF8, 0x00)],
			[SpriteMap(0xE8, 0x04, 0x00, 0x08, 0x00), SpriteMap(0xF8, 0x06, 0x00, 0xE8, 0x00)],
			[SpriteMap(0xF8, 0x08, 0x00, 0xF8, 0x00), SpriteMap(0xF8, 0x0A, 0x00, 0x08, 0x80)],
			[SpriteMap(0xE8, 0x00, 0x40, 0x08, 0x00), SpriteMap(0xE8, 0x02, 0x40, 0xF8, 0x00)],
			[SpriteMap(0xE8, 0x04, 0x40, 0xE8, 0x00), SpriteMap(0xF8, 0x06, 0x40, 0x08, 0x00)],
			[SpriteMap(0xF8, 0x08, 0x40, 0xF8, 0x00), SpriteMap(0xF8, 0x0A, 0x40, 0xE8, 0x80)],
		]
	),
	EntitySize._24x48: SpriteMapTemplates(6, 4, [
			[SpriteMap(0xE0, 0x00, 0x00, 0xF4, 0x00), SpriteMap(0xE0, 0x02, 0x00, 0x04, 0x00)],
			[SpriteMap(0xF0, 0x04, 0x00, 0xF4, 0x00), SpriteMap(0xF0, 0x06, 0x00, 0x04, 0x00)],
			[SpriteMap(0x00, 0x08, 0x00, 0xF4, 0x00), SpriteMap(0x00, 0x0A, 0x00, 0x04, 0x80)],
			[SpriteMap(0xE0, 0x00, 0x40, 0xFC, 0x00), SpriteMap(0xE0, 0x02, 0x40, 0xEC, 0x00)],
			[SpriteMap(0xF0, 0x04, 0x40, 0xFC, 0x00), SpriteMap(0xF0, 0x06, 0x40, 0xEC, 0x00)],
			[SpriteMap(0x00, 0x08, 0x40, 0xFC, 0x00), SpriteMap(0x00, 0x0A, 0x40, 0xEC, 0x80)],
		]
	),
	EntitySize._16x48: SpriteMapTemplates(3, 2, [
			[SpriteMap(0xD8, 0x00, 0x00, 0xF8, 0x00), SpriteMap(0xE8, 0x02, 0x00, 0xF8, 0x00)],
			[SpriteMap(0xF8, 0x04, 0x00, 0xF8, 0x80), SpriteMap(0xD8, 0x00, 0x40, 0xF8, 0x00)],
			[SpriteMap(0xE8, 0x02, 0x40, 0xF8, 0x00), SpriteMap(0xF8, 0x04, 0x40, 0xF8, 0x80)],
		]
	),
	EntitySize._32x48: SpriteMapTemplates(6, 4, [
			[SpriteMap(0xD8, 0x00, 0x00, 0xF0, 0x00), SpriteMap(0xD8, 0x02, 0x00, 0x00, 0x00)],
			[SpriteMap(0xE8, 0x04, 0x00, 0xF0, 0x00), SpriteMap(0xE8, 0x06, 0x00, 0x00, 0x00)],
			[SpriteMap(0xF8, 0x08, 0x00, 0xF0, 0x00), SpriteMap(0xF8, 0x0A, 0x00, 0x00, 0x80)],
			[SpriteMap(0xD8, 0x00, 0x40, 0x00, 0x00), SpriteMap(0xD8, 0x02, 0x40, 0xF0, 0x00)],
			[SpriteMap(0xE8, 0x04, 0x40, 0x00, 0x00), SpriteMap(0xE8, 0x06, 0x40, 0xF0, 0x00)],
			[SpriteMap(0xF8, 0x08, 0x40, 0x00, 0x00), SpriteMap(0xF8, 0x0A, 0x40, 0xF0, 0x80)],
		]
	),
	EntitySize._48x48: SpriteMapTemplates(9, 6, [
			[SpriteMap(0xD8, 0x00, 0x00, 0xE8, 0x00), SpriteMap(0xD8, 0x02, 0x00, 0xF8, 0x00)],
			[SpriteMap(0xD8, 0x04, 0x00, 0x08, 0x00), SpriteMap(0xE8, 0x06, 0x00, 0xE8, 0x00)],
			[SpriteMap(0xE8, 0x08, 0x00, 0xF8, 0x00), SpriteMap(0xE8, 0x0A, 0x00, 0x08, 0x00)],
			[SpriteMap(0xF8, 0x0C, 0x00, 0xE8, 0x00), SpriteMap(0xF8, 0x0E, 0x00, 0xF8, 0x00)],
			[SpriteMap(0xF8, 0x10, 0x00, 0x08, 0x80), SpriteMap(0xD8, 0x00, 0x40, 0x08, 0x00)],
			[SpriteMap(0xD8, 0x02, 0x40, 0xF8, 0x00), SpriteMap(0xD8, 0x04, 0x40, 0xE8, 0x00)],
			[SpriteMap(0xE8, 0x06, 0x40, 0x08, 0x00), SpriteMap(0xE8, 0x08, 0x40, 0xF8, 0x00)],
			[SpriteMap(0xE8, 0x0A, 0x40, 0xE8, 0x00), SpriteMap(0xF8, 0x0C, 0x40, 0x08, 0x00)],
			[SpriteMap(0xF8, 0x0E, 0x40, 0xF8, 0x00), SpriteMap(0xF8, 0x10, 0x40, 0xE8, 0x80)],
		]
	),
	EntitySize._64x48: SpriteMapTemplates(12, 8, [
			[SpriteMap(0xD8, 0x00, 0x00, 0xE0, 0x00), SpriteMap(0xD8, 0x02, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xD8, 0x04, 0x00, 0x00, 0x00), SpriteMap(0xD8, 0x06, 0x00, 0x10, 0x00)],
			[SpriteMap(0xE8, 0x08, 0x00, 0xE0, 0x00), SpriteMap(0xE8, 0x0A, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xE8, 0x0C, 0x00, 0x00, 0x00), SpriteMap(0xE8, 0x0E, 0x00, 0x10, 0x00)],
			[SpriteMap(0xF8, 0x10, 0x00, 0xE0, 0x00), SpriteMap(0xF8, 0x12, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xF8, 0x14, 0x00, 0x00, 0x00), SpriteMap(0xF8, 0x16, 0x00, 0x10, 0x80)],
			[SpriteMap(0xD8, 0x00, 0x40, 0x10, 0x00), SpriteMap(0xD8, 0x02, 0x40, 0x00, 0x00)],
			[SpriteMap(0xD8, 0x04, 0x40, 0xF0, 0x00), SpriteMap(0xD8, 0x06, 0x40, 0xE0, 0x00)],
			[SpriteMap(0xE8, 0x08, 0x40, 0x10, 0x00), SpriteMap(0xE8, 0x0A, 0x40, 0x00, 0x00)],
			[SpriteMap(0xE8, 0x0C, 0x40, 0xF0, 0x00), SpriteMap(0xE8, 0x0E, 0x40, 0xE0, 0x00)],
			[SpriteMap(0xF8, 0x10, 0x40, 0x10, 0x00), SpriteMap(0xF8, 0x12, 0x40, 0x00, 0x00)],
			[SpriteMap(0xF8, 0x14, 0x40, 0xF0, 0x00), SpriteMap(0xF8, 0x16, 0x40, 0xE0, 0x80)],
		]
	),
	EntitySize._64x64: SpriteMapTemplates(16, 8, [
			[SpriteMap(0xC8, 0x00, 0x00, 0xE0, 0x00), SpriteMap(0xC8, 0x02, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xC8, 0x04, 0x00, 0x00, 0x00), SpriteMap(0xC8, 0x06, 0x00, 0x10, 0x00)],
			[SpriteMap(0xD8, 0x08, 0x00, 0xE0, 0x00), SpriteMap(0xD8, 0x0A, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xD8, 0x0C, 0x00, 0x00, 0x00), SpriteMap(0xD8, 0x0E, 0x00, 0x10, 0x00)],
			[SpriteMap(0xE8, 0x10, 0x00, 0xE0, 0x00), SpriteMap(0xE8, 0x12, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xE8, 0x14, 0x00, 0x00, 0x00), SpriteMap(0xE8, 0x16, 0x00, 0x10, 0x00)],
			[SpriteMap(0xF8, 0x18, 0x00, 0xE0, 0x00), SpriteMap(0xF8, 0x1A, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xF8, 0x1C, 0x00, 0x00, 0x00), SpriteMap(0xF8, 0x1E, 0x00, 0x10, 0x80)],
			[SpriteMap(0xC8, 0x00, 0x40, 0x10, 0x00), SpriteMap(0xC8, 0x02, 0x40, 0x00, 0x00)],
			[SpriteMap(0xC8, 0x04, 0x40, 0xF0, 0x00), SpriteMap(0xC8, 0x06, 0x40, 0xE0, 0x00)],
			[SpriteMap(0xD8, 0x08, 0x40, 0x10, 0x00), SpriteMap(0xD8, 0x0A, 0x40, 0x00, 0x00)],
			[SpriteMap(0xD8, 0x0C, 0x40, 0xF0, 0x00), SpriteMap(0xD8, 0x0E, 0x40, 0xE0, 0x00)],
			[SpriteMap(0xE8, 0x10, 0x40, 0x10, 0x00), SpriteMap(0xE8, 0x12, 0x40, 0x00, 0x00)],
			[SpriteMap(0xE8, 0x14, 0x40, 0xF0, 0x00), SpriteMap(0xE8, 0x16, 0x40, 0xE0, 0x00)],
			[SpriteMap(0xF8, 0x18, 0x40, 0x10, 0x00), SpriteMap(0xF8, 0x1A, 0x40, 0x00, 0x00)],
			[SpriteMap(0xF8, 0x1C, 0x40, 0xF0, 0x00), SpriteMap(0xF8, 0x1E, 0x40, 0xE0, 0x80)],
		]
	),
	EntitySize._64x80: SpriteMapTemplates(20, 8, [
			[SpriteMap(0xB8, 0x00, 0x00, 0xE0, 0x00), SpriteMap(0xB8, 0x02, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xB8, 0x04, 0x00, 0x00, 0x00), SpriteMap(0xB8, 0x06, 0x00, 0x10, 0x00)],
			[SpriteMap(0xC8, 0x08, 0x00, 0xE0, 0x00), SpriteMap(0xC8, 0x0A, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xC8, 0x0C, 0x00, 0x00, 0x00), SpriteMap(0xC8, 0x0E, 0x00, 0x10, 0x00)],
			[SpriteMap(0xD8, 0x10, 0x00, 0xE0, 0x00), SpriteMap(0xD8, 0x12, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xD8, 0x14, 0x00, 0x00, 0x00), SpriteMap(0xD8, 0x16, 0x00, 0x10, 0x00)],
			[SpriteMap(0xE8, 0x18, 0x00, 0xE0, 0x00), SpriteMap(0xE8, 0x1A, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xE8, 0x1C, 0x00, 0x00, 0x00), SpriteMap(0xE8, 0x1E, 0x00, 0x10, 0x00)],
			[SpriteMap(0xF8, 0x20, 0x00, 0xE0, 0x00), SpriteMap(0xF8, 0x22, 0x00, 0xF0, 0x00)],
			[SpriteMap(0xF8, 0x24, 0x00, 0x00, 0x00), SpriteMap(0xF8, 0x26, 0x00, 0x10, 0x80)],
			[SpriteMap(0xB8, 0x00, 0x40, 0x10, 0x00), SpriteMap(0xB8, 0x02, 0x40, 0x00, 0x00)],
			[SpriteMap(0xB8, 0x04, 0x40, 0xF0, 0x00), SpriteMap(0xB8, 0x06, 0x40, 0xE0, 0x00)],
			[SpriteMap(0xC8, 0x08, 0x40, 0x10, 0x00), SpriteMap(0xC8, 0x0A, 0x40, 0x00, 0x00)],
			[SpriteMap(0xC8, 0x0C, 0x40, 0xF0, 0x00), SpriteMap(0xC8, 0x0E, 0x40, 0xE0, 0x00)],
			[SpriteMap(0xD8, 0x10, 0x40, 0x10, 0x00), SpriteMap(0xD8, 0x12, 0x40, 0x00, 0x00)],
			[SpriteMap(0xD8, 0x14, 0x40, 0xF0, 0x00), SpriteMap(0xD8, 0x16, 0x40, 0xE0, 0x00)],
			[SpriteMap(0xE8, 0x18, 0x40, 0x10, 0x00), SpriteMap(0xE8, 0x1A, 0x40, 0x00, 0x00)],
			[SpriteMap(0xE8, 0x1C, 0x40, 0xF0, 0x00), SpriteMap(0xE8, 0x1E, 0x40, 0xE0, 0x00)],
			[SpriteMap(0xF8, 0x20, 0x40, 0x10, 0x00), SpriteMap(0xF8, 0x22, 0x40, 0x00, 0x00)],
			[SpriteMap(0xF8, 0x24, 0x40, 0xF0, 0x00), SpriteMap(0xF8, 0x26, 0x40, 0xE0, 0x80)],
		]
	)
];

/// $C42F45
void setPartyTickCallbacks(short leaderEntityID, void function() leaderCallback, void function() partyCallback) {
	entityTickCallbacks[leaderEntityID] = leaderCallback;
	entityCallbackFlags[leaderEntityID] = 0;
	for (int i = 6; i > 0; i--) {
		entityTickCallbacks[++leaderEntityID] = partyCallback;
		entityCallbackFlags[leaderEntityID] = 0;
	}
}

/// The block arrangements of the entire game map. Each block is a 4x4 arrangement of 8x8 tiles.
/// There are 8 + 2 chunks of data, with the first 8 being 128 x 20 strips of blocks, ordered from top to bottom.
/// The latter 2 chunks provide the upper 2 bits of the blocks
/// Original_Address: $(DOLLAR)C42F64
@([ROMSource(0x160000, 10240), ROMSource(0x162800, 10240), ROMSource(0x165000, 12288), ROMSource(0x168000, 10240), ROMSource(0x16A800, 10240), ROMSource(0x16D000, 12288), ROMSource(0x170000, 10240), ROMSource(0x172800, 10240), ROMSource(0x175000, 12288), ROMSource(0x178000, 10240)])
immutable(ubyte[])[] mapBlockArrangements;

/// $C42F8C
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

/// $C4303C
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

/// $C430EC
void velocityStore() {
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

/// $C432B1
void unknownC432B1() {
	for (short i = 0; i < 0x1E; i++) {
		entitySurfaceFlags[i] = 0;
	}
	for (short i = 0; i < 6; i++) {
		for (short j = 0; j < 7; j++) {
			partyCharacters[i].afflictions[j] = 0;
		}
	}
	gameState.partyStatus = PartyStatus.normal;
}

/// $C43317
void initializePartyPointers() {
	for (short i = 0; i < 6; i++) {
		chosenFourPtrs[i] = &partyCharacters[i];
	}
}

/// $C43344
void unknownC43344(short arg1) {
	overworldStatusSuppression = arg1;
}

/// $C4334A
void unknownC4334A(short direction) {
	short x10 = cast(short)(interactXOffsets[direction] + gameState.leaderX.integer / 8);
	short x04 = cast(short)((direction == Direction.down) ? (interactYOffsets[direction] + (gameState.leaderY.integer + 1) / 8) :(interactYOffsets[direction] + gameState.leaderY.integer / 8));
	if ((unknownC05CD7(cast(short)(x10 * 8), cast(short)(x04 * 8), gameState.firstPartyMemberEntity, direction) & (SurfaceFlags.solid | SurfaceFlags.obscureUpperBody)) == (SurfaceFlags.solid | SurfaceFlags.obscureUpperBody)) {
		x10 += interactXOffsets[direction];
		x04 += interactYOffsets[direction];
	}
	short x = getDoorAt(x10, x04);
	if (x == 0xFF) {
		x = getDoorAt(cast(short)(x10 + 1), x04);
	}
	if (x == 0xFF) {
		x = getDoorAt(cast(short)(x10 - 1), x04);
	}
	if ((x != 0xFF) && (x == 5)) {
		unknown7E5DDC = unknown7E5DBE;
		//unknown7E5DDE = doorData[unknown7E5DBC & 0x7FFF]

		unknown7E5DDE = unknown7E5DBC.entryA.textPtr;
		currentTPTEntry = -2;
	}
}

/// $C4343E
void savePhotoState(short arg1) {
	arg1--;
	ushort x12;
	if (60000 > timer / 3600) {
		x12 = cast(ushort)(timer / 3600);
	} else {
		x12 = 59999;
	}
	gameState.savedPhotoStates[arg1].unknown = x12;
	for (short i = 0; i < 6; i++) {
		if (gameState.partyMemberIndex[i] == 0xFF) {
			gameState.savedPhotoStates[arg1].partyMembers[i] = 0;
		} else {
			currentPartyMemberTick = &partyCharacters[gameState.playerControlledPartyMembers[i]];
			short x0E = gameState.partyMemberIndex[i];
			if ((partyCharacters[gameState.playerControlledPartyMembers[i]].afflictions[0] == Status0.unconscious)) {
				x0E |= 0x20;
			}
			if ((partyCharacters[gameState.playerControlledPartyMembers[i]].afflictions[0] == Status0.diamondized)) {
				x0E |= 0x40;
			}
			if ((partyCharacters[gameState.playerControlledPartyMembers[i]].afflictions[1] == Status1.mushroomized)) {
				x0E |= 0x80;
			}
			gameState.savedPhotoStates[arg1].partyMembers[i] = cast(ubyte)x0E;
		}
	}
}

/// $C43550
immutable ubyte[6][4] itemUseMenuStrings = [
	ebString!6("Use"),
	ebString!6("Give"),
	ebString!6("Drop"),
	ebString!6("Help!"),
];

/// $C43568
void finishBattleFrame() {
	waitUntilNextFrame();
	drawBattleFrame();
}

/// $C43573
void unknownC43573(short arg1) {
	if (battleMenuCurrentCharacterID != -1) {
		resetActivePartyMemberHPPPWindow();
	}
	battleMenuCurrentCharacterID = arg1;
	waitUntilNextFrame();
	ushort* x = &bg2Buffer[0x340 + 16 - ((gameState.playerControlledPartyMemberCount * 7) / 2) + (arg1 * 7)];
	for (short i = hpPPWindowWidth; i != 0; i--) {
		*(x++) = 0;
	}
	redrawAllWindows = 1;
}

/// $C435E4
void rowEnemyFlashingOff() {
	if (unknown7E89CE == -1) {
		return;
	}
	for (short i = 0; i < (unknown7E89CE != Row.front) ? numBattlersInBackRow : numBattlersInFrontRow; i++) {
		if (unknown7E89CE != Row.front) {
			battlersTable[backRowBattlers[i]].isFlashing = 0;
		} else {
			battlersTable[frontRowBattlers[i]].isFlashing = 0;
		}
	}
	enemyTargettingFlashing = 0;
	unknown7E89CE = -1;
	redrawAllWindows = 1;
}

/// $C43657
void rowEnemyFlashingOn(short arg1) {
	if (unknown7E89CE != -1) {
		rowEnemyFlashingOff();
	}
	unknown7E89CE = arg1;
	for (short i = 0; i < (unknown7E89CE != Row.front) ? numBattlersInBackRow : numBattlersInFrontRow; i++) {
		if (unknown7E89CE != Row.front) {
			battlersTable[backRowBattlers[i]].isFlashing = 1;
		} else {
			battlersTable[frontRowBattlers[i]].isFlashing = 1;
		}
	}
	enemyTargettingFlashing = 1;
	redrawAllWindows = 1;
}

/// $C436D7
void unknownC436D7(short arg1, short arg2) {
	ushort* x0E = &windowStats[windowTable[arg1]].tilemapBuffer[windowStats[windowTable[arg1]].width * arg2 * 2];
	for (short i = 0; i != windowStats[windowTable[arg1]].width * 2; i++) {
		*(x0E++) = 0x40;
	}
}

/// $C43739
void clearCurrentTextLine(short arg1) {
	ushort* x10 = &windowStats[windowTable[arg1]].tilemapBuffer[(windowStats[windowTable[arg1]].width * windowStats[windowTable[arg1]].textY * 2)];
	for (short i = 0; i != windowStats[windowTable[arg1]].width * 2; i++) {
		freeTile((x10++)[0]);
	}
	unknownC436D7(arg1, windowStats[windowTable[arg1]].textY);
}

/// $C437B8
void unknownC437B8(short arg1) {
	ushort* x14 = &windowStats[windowTable[arg1]].tilemapBuffer[0];
	ushort* x12 = &windowStats[windowTable[arg1]].tilemapBuffer[0];
	ushort* x04 = &windowStats[windowTable[arg1]].tilemapBuffer[windowStats[windowTable[arg1]].width * 2];
	for (short i = 0; i != windowStats[windowTable[arg1]].width * 2; i++) {
		freeTile(*(x14++));
	}
	for (short i = 0; i != (windowStats[windowTable[arg1]].height - 2) * windowStats[windowTable[arg1]].width; i++) {
		*(x12++) = *(x04++);
	}
	unknownC436D7(arg1, (windowStats[windowTable[arg1]].height / 2) - 1);
}

/// $C438B1
void printNewLine() {
	if (currentFocusWindow == -1) {
		return;
	}
	version(bugfix) { ///ensures that even at hyperspeed, text will render
		if (selectedTextSpeed == 0) {
			windowTick();
		}
	}
	unknownC45E96();
	if (windowStats[windowTable[currentFocusWindow]].font != 0) {
		unknownC45E96();
	}
	if (windowStats[windowTable[currentFocusWindow]].textY != (windowStats[windowTable[currentFocusWindow]].height / 2) - 1) {
		windowStats[windowTable[currentFocusWindow]].textY++;
	} else {
		unknownC437B8(currentFocusWindow);
	}
	windowStats[windowTable[currentFocusWindow]].textX = 0;
}

/// $C43B15 - Unknown, but looks like it resets the color of existing text in the focused window
void unknownC43B15() {
	WinStat* x12 = &windowStats[windowTable[currentFocusWindow]];
	ushort* y = &x12.tilemapBuffer[x12.width * x12.textY * 2];
	ushort x0E;
	for (x0E = cast(ushort)(x12.width - 1); y[x0E] == 0x40; x0E--) {}
	ushort x12_2 = x12.textX;
	ushort* x = &y[x12_2];
	while (x12_2 < (x0E + 1)) {
		x[0] = (x[0] & 0x3FF) | x12.tileAttributes;
		x[x12.width] = (x[x12.width] & 0x3FF) | x12.tileAttributes;
		x++;
		x12_2++;
	}
}

/// $C43874
void moveTextCursor(short windowID, short x, short y) {
	nextVWFTile();
	windowStats[windowTable[windowID]].textX = x;
	windowStats[windowTable[windowID]].textY = y;
}

/// $C438A5
void moveCurrentTextCursor(short x, short y) {
	moveTextCursor(currentFocusWindow, x, y);
}

/// $C43915
immutable ubyte[0x400] lockedTiles = [
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x01,
	0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01,
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
];

/// $C43BB9 - Unknown, but looks like it prints optionally highlighted text
void unknownC43BB9(ushort maxLength, short highlighted, ubyte* text) {
	if (windowTable[currentFocusWindow] == -1) {
		return;
	}
	if ((currentFocusWindow != 0x18) && (currentFocusWindow != 0x19) && (currentFocusWindow != 0x14) && (currentFocusWindow != 0x24)) {
		return;
	}
	WinStat* x14 = &windowStats[windowTable[currentFocusWindow]];
	short x12 = windowStats[windowTable[currentFocusWindow]].tileAttributes;
	short x10 = windowStats[windowTable[currentFocusWindow]].textX;
	ushort* x04 = &windowStats[windowTable[currentFocusWindow]].tilemapBuffer[windowStats[windowTable[currentFocusWindow]].textY * windowStats[windowTable[currentFocusWindow]].width * 2 + x10];
	while ((*text != 0) && (maxLength != 0)) {
		if (*x04 == 0x40) {
			break;
		}
		if (highlighted != 0) {
			unknownEF00E6(x04, x14.width, x12);
		} else {
			unknownEF00BB(x04, x14.width, x12);
		}
		x10++;
		x04++;
		text++;
		maxLength--;
	}
	x14.textX = x10;
	instantPrinting = 0;
}

/// $C43CAA
void nextVWFTile() {
	if (++vwfTile > 0x33) {
		vwfTile = 0;
		vwfX = 0;
	} else {
		vwfX = cast(ushort)(vwfTile * 8);
	}
	textRenderState.upperVRAMPosition = 0;
	textRenderState.pixelsRendered = vwfX;
}

/// $C43CD2 - Set text position on focused window (for menu options)
void unknownC43CD2(MenuOpt* opt, short x, short y) {
	moveCurrentTextCursor(x, y);
	if (opt.pixelAlign != 0) {
		vwfX += opt.pixelAlign;
		memset(&vwfBuffer[vwfTile][0], 0xFF, 0x20);
	}
	unknown7E5E79 = 0;
}

/// $C43D95
void unknownC43D95(short arg1) {
	arg1 += (windowStats[windowTable[currentFocusWindow]].textX * 8);
	unknownC43D75(cast(short)(arg1 + unknown7E5E73), windowStats[windowTable[currentFocusWindow]].textY);
}

/// $C43DDB
void unknownC43DDB(MenuOpt* menuEntry) {
	moveCurrentTextCursor(menuEntry.textX, menuEntry.textY);
	unknownC43F77(0x2F);
	nextVWFTile();
	if (menuEntry.pixelAlign != 0) {
		unknownC43CD2(menuEntry, menuEntry.textX, menuEntry.textY);
	}
}

/// $C43D24
void unknownC43D24(ushort arg1, short arg2) {
	moveCurrentTextCursor(arg1, arg2);
	if (unknown7E5E72 == 0) {
		return;
	}
	vwfX += unknown7E5E72;
	memset(&vwfBuffer[vwfTile][0], 0xFF, 0x20);
	unknown7E5E73 = unknown7E5E72;
	unknown7E5E72 = 0;
}

/// $C43D75
void unknownC43D75(ushort arg1, short arg2) {
	unknown7E5E72 = cast(ubyte)(arg1 & 7);
	unknownC43D24(arg1 / 8, arg2);
}

/// $C43E31
short unknownC43E31(const(ubyte)* arg1, short arg2) {
	short x12 = 0;
	while ((arg1[0] != 0) && (arg2 != 0)) {
		arg2--;
		x12 += characterPadding + (unknown7EB4CE != 0) ? fontData[fontConfigTable[0].dataID][((arg1++)[0] - ebChar(' ')) & 0x7F] : fontData[fontConfigTable[windowStats[windowTable[currentFocusWindow]].font].dataID][((arg1++)[0] - ebChar(' ')) & 0x7F];
	}
	return x12;
}

/// $C43EF8
void unknownC43EF8(const(ubyte)* arg1, short arg2) {
	unknownC43D75(cast(short)((windowStats[windowTable[currentFocusWindow]].width * 8 - unknownC43E31(arg1, arg2)) / 2), windowStats[windowTable[currentFocusWindow]].textY);
	unknown7E5E74 = 0;
}

/// $C43F53
void unknownC43F53() {
	for (short i = 0; i < 0x20; i++) {
		usedBG2TileMap[i] = reservedBG2TileMap[i];
	}
}

/// $C43F77
void unknownC43F77(short tile) {
	if (currentFocusWindow == -1) {
		return;
	}
	int tilemapOffset = windowStats[windowTable[currentFocusWindow]].textX +
		windowStats[windowTable[currentFocusWindow]].textY * windowStats[windowTable[currentFocusWindow]].width * 2;
	ushort* x0E = &windowStats[windowTable[currentFocusWindow]].tilemapBuffer[tilemapOffset];
	freeTileSafe(x0E[0]);
	freeTileSafe(x0E[windowStats[windowTable[currentFocusWindow]].width]);
	if (tile == 0x2F) {
		unknown7E5E75 = 0;
	}
	drawTallTextTileFocusedF(tile);
	if (windowTable[currentFocusWindow] != windowTail) {
		redrawAllWindows = 1;
	}
	short x;
	if (textSoundMode == 2) {
		x = 1;
	} else if (textSoundMode == 3) {
		x = 0;
	} else {
		x = 0;
		if (blinkingTriangleFlag == 0) {
			x = 1;
		}
	}
	if ((x != 0) && (instantPrinting == 0) && (tile != 0x20)) {
		playSfx(Sfx.textPrint);
	}
	if (instantPrinting == 0) {
		for (short i = cast(short)(selectedTextSpeed + (config.instantSpeedText ? 0 : 1)); i != 0; i--) {
			windowTick();
		}
	}
}

/// $C4406A
short getCharacterAtCursorPosition(short arg1, short arg2, short arg3) {
	return nameInputWindowSelectionLayoutPointers[arg3][nameEntryGridCharacterOffsetTable[arg2][arg1]];
}

/// $C440B5
void unknownC440B5(ubyte* arg1, short arg2) {
	memset(&keyboardInputCharacterWidths[0], 0, 0x18);
	short i;
	for (i = 0; (arg1[i] != 0) && (i < arg2); i++, arg1++) {
		keyboardInputCharacters[i] = arg1[0];
		keyboardInputCharacterOffsets[i] = (arg1[0] - ebChar(' ')) & 0x7F;
		keyboardInputCharacterWidths[i] = cast(ubyte)(fontData[fontConfigTable[0].dataID][(arg1[0] - ebChar(' ')) & 0x7F] + characterPadding);
		unknownC44E61(0, arg1[0]);
	}
	unknown7E9662 = i;
	if (i >= arg2) {
		return;
	}
	keyboardInputCharacterOffsets[i] = 0x20;
	keyboardInputCharacterWidths[i] = 0x06;
	unknownC44E61(0, ebChar('@'));
	keyboardInputCharacters[i++] = 0;
	if (arg2 - i <= 0) {
		return;
	}
	for (short x02 = cast(short)(arg2 - i); x02 != 0; x02--, i++) {
		keyboardInputCharacterOffsets[i] = 0x03;
		unknownC44E61(0, ebChar('{'));
		keyboardInputCharacterWidths[i] = 0x03;
	}
}

/// $C441B7
void unknownC441B7(short arg1) {
	memset(&vwfBuffer[0][0], 0xFF, 0x680);
	short x02 = 3;
	unknown7E9662 = 0;
	memset(&keyboardInputCharacters[0], 0, 0x18);
	unknownC44E61(0, ebChar('@'));
	keyboardInputCharacterOffsets[0] = 0x20;
	for (short i = 1; i < arg1; i++) {
		keyboardInputCharacterOffsets[i] = cast(ubyte)x02;
		keyboardInputCharacterWidths[i] = cast(ubyte)(fontData[fontConfigTable[0].dataID][x02] + characterPadding);
		unknownC44E61(0, ebChar('{'));
	}
}

/// $C4424A
void unknownC4424A(short arg1) {
	if (arg1 == 0x70) {
		keyboardInputCharacters[unknown7E9662] = 0;
	} else {
		keyboardInputCharacters[unknown7E9662] = cast(ubyte)arg1;
	}
	keyboardInputCharacterOffsets[unknown7E9662] = cast(ubyte)((arg1 - ebChar(' ')) & 0x7F);
	keyboardInputCharacterWidths[unknown7E9662] = cast(ubyte)(fontData[fontConfigTable[0].dataID][(arg1 - ebChar(' ')) & 0x7F] + characterPadding);
}

/// $C442AC
short unknownC442AC(short arg1, short arg2, short arg3) {
	waitUntilNextFrame();
	vwfTile = 0;
	vwfX = 0;
	memset(&vwfBuffer[0][0], 0xFF, 0x340);
	textRenderState.upperVRAMPosition = 0;
	textRenderState.pixelsRendered = 0;
	if (arg3 == -1) {
		if (unknown7E9662 == 0) {
			return 1;
		}
		if (unknown7E9662 < arg2) {
			unknownC4424A(0x53);
		}
		unknown7E9662--;
		unknownC4424A(0x70);
	} else {
		if (arg2 - 1 < unknown7E9662) {
			return 0;
		}
		unknownC4424A(arg3);
		if (++unknown7E9662 < arg2) {
			unknownC4424A(0x70);
		}
	}
	windowStats[windowTable[currentFocusWindow]].textX = 0;
	for (short i = 0; i < arg2; i++) {
		const(ubyte)* x06 = &fontGraphics[fontConfigTable[0].graphicsID][fontConfigTable[0].height * keyboardInputCharacterOffsets[i]];
		short j;
		for (j = keyboardInputCharacterWidths[i]; j >= 8; j -= 8) {
			renderText(8, fontConfigTable[0].width, x06);
			x06 += fontConfigTable[0].width;
		}
		renderText(j, fontConfigTable[0].width, x06);
	}
	windowStats[windowTable[currentFocusWindow]].textX = 0;
	ushort x04 = 0x7700;
	for (short i = 0; i < windowStats[windowTable[currentFocusWindow]].width + 1; i++) {
		copyToVRAM(0, 0x10, x04, &vwfBuffer[i][0]);
		copyToVRAM(0, 0x10, cast(ushort)(x04 + 8), &vwfBuffer[i][16]);
		x04 += 16;
	}
	dmaTransferFlag = 1;
	for (short i = 0; i < windowStats[windowTable[currentFocusWindow]].width + 1; i++) {
		finishTextTileRender(cast(short)(i * 2 + 0x2E0), cast(short)(i * 2 + 0x2E0 + 1));
	}
	if (windowTable[currentFocusWindow] != windowTail) {
		redrawAllWindows = 1;
	}
	short x;
	if (textSoundMode == 2) {
		x = 1;
	} else if (textSoundMode == 3) {
		x = 0;
	} else {
		x = 0;
		if (blinkingTriangleFlag == 0) {
			x = 1;
		}
	}
	if ((x != 0) && (instantPrinting == 0) && (arg3 != 0x20)) {
		playSfx(Sfx.textPrint);
	}
	for (short i = cast(short)(selectedTextSpeed + (config.instantSpeedText ? 0 : 1)); i != 0; i--) {
		windowTick();
	}
	return 0;
}

/// $C444FB
void renderSmallTextToVRAM(ubyte* arg1, ushort arg2) {
	nextVWFTile();
	ushort x18 = vwfTile;
	ubyte* x0A = arg1;
	for (short i = 0; arg1[0] != 0; i++) {
		renderText(6, fontConfigTable[Font.tiny].width, &fontGraphics[fontConfigTable[Font.tiny].graphicsID][(((arg1++)[0] - ebChar(' ')) & 0x7F) * fontConfigTable[Font.tiny].height]);
	}
	for (short i = x18; (x0A++)[0] != 0; i++) {
		copyToVRAM(0, 0x10, arg2, &vwfBuffer[i][0]);
		arg2 += 8;
		if (i == 0x33) {
			i = -1;
		}
	}
	waitUntilNextFrame();
	waitUntilNextFrame();
}

/// $C445E1
void unknownC445E1(DisplayTextState* arg1, const(ubyte)* arg2) {
	short nextWordLength = 0;
	const(ubyte)* x14 = arg1.textptr;
	if (currentFocusWindow == -1) {
		return;
	}
	while (true) {
		short a = (arg2[0] != 0) ? *(arg2++) : *(x14++);
		switch (a) {
			case 0x15:
				arg2 = &compressedText[0][*(x14++)][0];
				a = *(arg2++);
				break;
			case 0x16:
				arg2 = &compressedText[1][*(x14++)][0];
				a = *(arg2++);
				break;
			case 0x17:
				arg2 = &compressedText[2][*(x14++)][0];
				a = *(arg2++);
				break;
			default: break;
		}
		if (a == ebChar(' ') || (a < 0x20)) {
			break;
		}
		unknown7E9660++;
		nextWordLength += (a == 0x2F) ? 8 : cast(ubyte)(fontData[fontConfigTable[windowStats[windowTable[currentFocusWindow]].font].dataID][(a - ebChar(' ')) & 0x7F] + characterPadding);
	}
	short newLineLength;
	if (windowStats[windowTable[currentFocusWindow]].textX != 0) {
		newLineLength = cast(short)((vwfX & 7) + ((windowStats[windowTable[currentFocusWindow]].textX - 1) * 8) + nextWordLength);
	} else {
		newLineLength = cast(short)((vwfX & 7) + nextWordLength);
	}
	if ((windowStats[windowTable[currentFocusWindow]].width * 8) < newLineLength) {
		printNewLineF();
		unknown7E5E75 = 1;
	}
}

/// $C447FB
void printWrappableString(short length, const(ubyte)* text) {
	short x12 = unknownC43E31(text, length);
	if ((vwfX & 7) + ((windowStats[windowTable[currentFocusWindow]].textX - 1) * 8) + x12 >= (windowStats[windowTable[currentFocusWindow]].width * 8)) {
		printNewLineF();
		unknown7E5E75 = 1;
	}
	printStringF(length, text);
}

/// $C4487C
void unknownC4487C(short arg1, const(ubyte)* arg2) {
	ubyte x00 = 0;
	ubyte* x15 = &unknown7E9664[0];
	short x12;
	do {
		ubyte x14 = arg2[0];
		x12 = x14;
		x15[x00] = x14;
		arg2++;
		if ((x12 == ebChar(' ')) || (x12 == 0)) {
			if (x12 == ebChar(' ')) {
				x15[x00++] = ebChar(' ');
			}
			x15[x00] = 0;
			printWrappableString(-1, x15);
			x00 = 0;
			x15 = &unknown7E9664[0];
		} else {
			x00++;
		}
	} while (x12 != 0);
}

/// $C44963
void loadWindowGraphics(short arg1) {
	switch (arg1) {
		case WindowGraphicsToLoad.all: // reload all window graphics in VRAM
			copyToVRAM(0, 0x1800, 0x7000, &buffer[0x2000]); // HP/PP meter tiles, special text graphics
			goto case;
		case WindowGraphicsToLoad.allButMeter: // same as 1, but no meter or special text
			copyToVRAM(0, 0x450, 0x6000, &buffer[0]); //status ailments, backgrounds and selector digits, upper halves of some icons
			copyToVRAM(0, 0x60, 0x6278, &buffer[0x4F0]); // lower half of cursor, equip icon, dollar sign and cents
			copyToVRAM(0, 0xB0, 0x62F8, &buffer[0x5F0]); // upper halves of normal digits
			copyToVRAM(0, 0xA0, 0x6380, &buffer[0x700]); // lower halves of normal digits
			copyToVRAM(0, 0x10, 0x6400, &buffer[0x800]); // upper half of bullet character
			copyToVRAM(0, 0x10, 0x6480, &buffer[0x900]); // lower half of bullet character
			break;
		case WindowGraphicsToLoad.all2: // this seems to be a copy of 1, for some reason
			copyToVRAM(0, 0x450, 0x6000, &buffer[0]); //status ailments, backgrounds and selector digits, upper halves of some icons
			copyToVRAM(0, 0x60, 0x6278, &buffer[0x4F0]); // lower half of cursor, equip icon, dollar sign and cents
			copyToVRAM(0, 0xB0, 0x62F8, &buffer[0x5F0]); // upper halves of normal digits
			copyToVRAM(0, 0xA0, 0x6380, &buffer[0x700]); // lower halves of normal digits
			copyToVRAM(0, 0x10, 0x6400, &buffer[0x800]); // upper half of bullet character
			copyToVRAM(0, 0x10, 0x6480, &buffer[0x900]); // lower half of bullet character
			copyToVRAM(0, 0x1800, 0x7000, &buffer[0x2000]); // HP/PP meter tiles, special text graphics
			break;
		default: break;
	}
}

/// $C44AD7
immutable ushort[16] usedBG2TileMapMasks = [
	0xFFFE,
	0xFFFD,
	0xFFFB,
	0xFFF7,
	0xFFEF,
	0xFFDF,
	0xFFBF,
	0xFF7F,
	0xFEFF,
	0xFDFF,
	0xFBFF,
	0xF7FF,
	0xEFFF,
	0xDFFF,
	0xBFFF,
	0x7FFF,
];

/// $C44AF7
void freeTile(short arg1) {
	short x10 = arg1 & 0x3FF;
	if (lockedTiles[x10] != 0) {
		return;
	}
	usedBG2TileMap[x10 >> 4] &= usedBG2TileMapMasks[x10 & 0xF];
}

/// $C44B3A
void renderText(short width, short sizeof_tile, const(ubyte)* gfx_data) {
	short i;
	short new_vwftile;
	short pixel_x = vwfX & 7;
	ubyte* bufptr = &vwfBuffer[vwfTile][0];
	const(ubyte)* gfxptr = gfx_data;

	if (pixel_x == 0) { /* Is this the first time we're writing to this tile? */
		memset(bufptr, 0xFF, sizeof_tile*2);
	}

	bufptr++; /* Move to high byte */
	for (i = 0; i < sizeof_tile; i++) {
		*bufptr &= (((*gfxptr) ^ 255) >> pixel_x) ^ 255; /* Is this right? Don't know! */
		/* *bufptr &= arrEFC51B[pixel_x][*gfxptr]; */

		++gfxptr;
		bufptr += 2;
	}

	vwfX += width;
	if (vwfX >= vwfBuffer.length*8) vwfX -= vwfBuffer.length*8;

	new_vwftile = vwfX >> 3;
	if (new_vwftile == vwfTile) return; /* Bail out if going to write on the same tile */

	/* Well, we're in a new tile now */
	vwfTile = new_vwftile;

	pixel_x = cast(short)(8 - pixel_x);
	bufptr = &vwfBuffer[vwfTile][0];
	gfxptr = gfx_data;

	memset(bufptr, 0xFF, sizeof_tile*2); /* We need to clear what was previously in this, now new, tile */
	if (pixel_x == 8) return;

	bufptr++; /* Move to high byte */
	for (i = 0; i < sizeof_tile; i++) {
		*bufptr = cast(ubyte)((((*gfxptr) ^ 255) << pixel_x) ^ 255); /* Is this right? Don't know! */
		/* *bufptr = arrEFCD1B[pixel_x][*gfxptr]; */

		++gfxptr;
		bufptr += 2;
	}
}

/// $C44C6C
immutable ushort[16] powersOfTwo16Bit = [
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

/// $C44C8C
void finishTextTileRender(short arg1, short arg2) {
	if (currentFocusWindow == -1) {
		return;
	}
	if (windowTable[currentFocusWindow] == -1) {
		return;
	}
	short x04 = windowStats[windowTable[currentFocusWindow]].textX;
	short x12 = windowStats[windowTable[currentFocusWindow]].textY;
	short x10 = windowStats[windowTable[currentFocusWindow]].tileAttributes;
	ushort* x0E;
	ushort* x16;
	if (x04 == windowStats[windowTable[currentFocusWindow]].width) {
		x04 = 0;
		if ((windowStats[windowTable[currentFocusWindow]].height / 2) - 1 != x12) {
			x12++;
		} else {
			if (unknown7EB49D != 0) {
				goto Unknown15;
			}
			unknownC437B8F(currentFocusWindow);
		}
		if (unknown7E5E6E != 0) {
			unknown7E5E75 = 1;
		}
	}
	if ((blinkingTriangleFlag != 0) && (x04 == 0) && ((arg1 == 0x20) || (arg1 == 0x70))) {
		if (blinkingTriangleFlag == 1) {
			goto Unknown15;
		}
		if (blinkingTriangleFlag == 1) {
			arg1 = 0x20;
		}
	}
	x0E = &windowStats[windowTable[currentFocusWindow]].tilemapBuffer[windowStats[windowTable[currentFocusWindow]].width * x12 * 2 + x04];
	if (*x0E != 0) {
		freeTileSafe(*x0E);
	}
	*x0E = cast(ushort)(((arg1 == 0x22) ? 0xC00 : x10) + arg1);
	x16 = x0E + windowStats[windowTable[currentFocusWindow]].width;
	if (*x16 != 0) {
		freeTileSafe(*x16);
	}
	*x16 = cast(ushort)(((arg2 == 0x22) ? 0xC00 : x10) + arg2);
	x04++;

	Unknown15:
	windowStats[windowTable[currentFocusWindow]].textX = x04;
	windowStats[windowTable[currentFocusWindow]].textY = x12;
}

/// $C44DCA
void unknownC44DCA() {
	short lastRenderedTileIndex = vwfX / 8;
	short tileIndex = textRenderState.pixelsRendered / 8;
	short x10 = textRenderState.upperVRAMPosition;
	if (x10 != 0) {
		uploadTextTile(tileIndex, x10, textRenderState.lowerVRAMPosition);
	} else {
		tileIndex--;
	}
	while (tileIndex != lastRenderedTileIndex) {
		short x0E = unknownC40085();
		textRenderState.upperVRAMPosition = x0E;
		short x04 = unknownC40085();
		textRenderState.lowerVRAMPosition = x04;
		tileIndex = (tileIndex + 1 == vwfBuffer.length) ? 0 : cast(short)(tileIndex + 1);
		uploadTextTile(tileIndex, x0E, x04);
		finishTextTileRender(x0E, x04);
	}
	textRenderState.pixelsRendered = vwfX;
}

/// $C44E44
void unknownC44E44() {
	textRenderState.upperVRAMPosition = 0;
	textRenderState.pixelsRendered = 0;
}

/// $C44E4D
void freeTileSafe(short arg1) {
	if ((arg1 & 0x3FF) == 0x40) {
		return;
	}
	if ((arg1 & 0x3FF) == 0x00) {
		return;
	}
	freeTile(arg1);
}

/// $C44E61
void unknownC44E61(short arg1, short tile) {
	if (currentFocusWindow == -1) {
		return;
	}
	if ((tile == 0x2F) || (tile == 0x22) || (tile == 0x20)) {
		unknownC43F77(tile);
		nextVWFTile();
	} else {
		if (tile == ebChar(' ')) {
			if (unknown7E5E75 != 0) {
				return;
			}
		} else if (unknown7E5E75 != 0) {
			windowStats[windowTable[currentFocusWindow]].textX = 0;
			if (tile != ebChar('@')) {
				unknownC43D75(6, windowStats[windowTable[currentFocusWindow]].textY);
			}
			unknown7E5E75 = 0;
		}
		lastPrintedCharacter = cast(ubyte)tile;
		const(ubyte)* x14 = &fontGraphics[fontConfigTable[arg1].graphicsID][(tile - ebChar(' ')) * fontConfigTable[arg1].height];
		short x12 = fontData[fontConfigTable[arg1].dataID][tile - ebChar(' ')] + characterPadding;
		if (x12 > 8) {
			while (x12 > 8) {
				renderText(8, fontConfigTable[arg1].width, x14);
				x12 -= 8;
				x14 +=fontConfigTable[arg1].width;
			}
		}
		renderText(x12, fontConfigTable[arg1].width, x14);
		unknownC44DCA();
	}
}

/// $C44FF3
short unknownC44FF3(short arg1, short fontID, ubyte* arg3) {
	short result;
	for (short i = 0; i < arg1; i++) {
		result += cast(short)(characterPadding + fontData[fontConfigTable[fontID].dataID][(*(arg3++) - 0x50) & 0x7F]);
	}
	return result;
}

/// $C4507A
void printPrice(uint arg1) {
	ubyte[8] x12;
	if (currentFocusWindow == -1) {
		return;
	}
	ubyte unknown7E5E75Copy = unknown7E5E75;
	unknown7E5E75 = 0;
	short x24 = unknownC10C55(arg1);
	ubyte* x22 = &unknown7E895A[7 - x24];
	ubyte* x20 = x22;
	short textXBackup = windowStats[windowTable[currentFocusWindow]].textX;
	short textYBackup = windowStats[windowTable[currentFocusWindow]].textY;
	short x04 = characterPadding + fontData[fontConfigTable[windowStats[windowTable[currentFocusWindow]].font].dataID][4];

	for (short i = 0; i < x24; i++) {
		x12[i] = cast(ubyte)(*x22 + 0x60);
		x22++;
	}
	short x18 = cast(short)(x04 + unknownC44FF3(x24, windowStats[windowTable[currentFocusWindow]].font, &x12[0]));
	x18 += characterPadding;
	unknown7E5E71 =1;
	unknownC43D75(cast(short)((windowStats[windowTable[currentFocusWindow]].width - 1) * 8 - x18), windowStats[windowTable[currentFocusWindow]].textY);
	printLetterF(ebChar('$'));
	while (x24 != 0) {
		printLetterF(*(x20++) + 0x60);
		x24--;
	}
	unknown7E5E71 = 0;
	moveCurrentTextCursor(cast(short)(windowStats[windowTable[currentFocusWindow]].width - 1), windowStats[windowTable[currentFocusWindow]].textY);
	unknownC43F77(0x24);
	moveCurrentTextCursor(textXBackup, textYBackup);
	unknown7E5E75 = unknown7E5E75Copy;
}

/// $C451FA
void unknownC451FA(short arg1, short arg2, short arg3) {
	short x20 = void;
	short x04 = 0;
	short x02 = 0;
	if (windowStats[windowTable[currentFocusWindow]].currentOption == -1) {
		return;
	}
	windowStats[windowTable[currentFocusWindow]].menuColumns = arg1;
	MenuOpt* x24 = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
	memset(&unknown7E968D[0], 0, 4);
	memset(&unknown7E9691[0], 0xFF, 4);
	if (arg3 != 0) {
		while (true) {
			unknown7E968D[x04] = cast(ubyte)(unknownC43E31(&x24.label[0], 30) + 8);
			x02 += unknown7E968D[x04];
			if (x24.next == -1) {
				break;
			}
			x24 = &menuOptions[x24.next];
			x04++;
		}
		ushort x22 = cast(ushort)((windowStats[windowTable[currentFocusWindow]].width * 0x800) / x02);
		while (x04 != -1) {
			unknown7E9691[x04] = cast(ubyte)((x22 * unknown7E968D[x04]) / 256);
			x04--;
		}
		x24 = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		x04 = 0;
	} else {
		x20 = cast(short)(((arg1 - 1) * arg2 + windowStats[windowTable[currentFocusWindow]].width) / arg1);
	}
	short x1E = windowStats[windowTable[currentFocusWindow]].height / 2;
	if ((arg1 + unknownC1138DF(windowStats[windowTable[currentFocusWindow]].currentOption) - 1) / arg1 > x1E) {
		x1E -= 2;
	}
	short x22 = 0;
	short x1C = 1;
	outermost: while (true) {
		short x1A = windowStats[windowTable[currentFocusWindow]].textY;
		for (short x2A = x1E; x2A != 0; x2A--) {
			for (short x18 = arg1; x18 != 0; x18--) {
				if (arg3 != 0) {
					x24.textX = cast(short)(x22 + (unknown7E9691[x04] - unknown7E968D[x04]) / 16);
					x24.textY = x1A;
					x24.page = x1C;
					if (x24.next == -1) {
						break outermost;
					}
					x22 += (unknown7E9691[x04] + 7) / 8;
					x04++;
					x24 = &menuOptions[x24.next];
				} else {
					x24.textX = x22;
					x24.textY = x1A;
					x24.page = x1C;
					if (x24.next == -1) {
						break outermost;
					}
					x22 += x20;
					x24 = &menuOptions[x24.next];
				}
			}
			x22 = 0;
			x1A++;
		}
		x1C++;
	}
	if (((arg1 + unknownC1138DF(windowStats[windowTable[currentFocusWindow]].currentOption) - 1) / arg1) > windowStats[windowTable[currentFocusWindow]].height / 2) {
		MenuOpt* x = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		x20 = cast(short)(arg1 - 1);
		while (x20 != 0) {
			x20--;
			x = &menuOptions[menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption].next];
		}
		unknownC10BFE(0, 0, windowStats[windowTable[currentFocusWindow]].height / 2 - 1, &unknownC3E44C[0], null);
		menuOptions[windowStats[windowTable[currentFocusWindow]].optionCount].page = 0;
	}
}

/// $C454F2
immutable ubyte[3] battleToText = ebString!3("To ");

/// $C454F5
immutable ubyte[13] battleFrontRowText = ebString!13("the Front Row");

/// $C45502
immutable ubyte[13] battleBackRowText = ebString!13("the Back Row");

/// $C4550F
const CC1C01Entry[96] cc1C01Table;

/// $C4562F
immutable ubyte[8] powersOfTwo8Bit = [1 << 0, 1 << 1, 1 << 2, 1 << 3, 1 << 4, 1 << 5, 1 << 6, 1 << 7];

/// $C45637
ubyte findItemInInventory(short arg1, short arg2) {
	for (int i = 0; i < 14; i++) {
		if (partyCharacters[arg1 - 1].items[i] == arg2) {
			return cast(ubyte)arg1;
		}
	}
	return 0;
}

/// $C45683
ubyte findItemInInventory2(short arg1, short arg2) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (findItemInInventory(gameState.partyMembers[i], arg2) != 0) {
				return gameState.partyMembers[i];
			}
		}
		return 0;
	} else {
		return findItemInInventory(arg1, arg2);
	}
}

/// $C456E4
short findInventorySpace(short arg1) {
	for (short i = 0; i < 14; i++) {
		if (partyCharacters[arg1 - 1].items[i] == 0) {
			return arg1;
		}
	}
	return 0;
}

/// $C4577D
short findInventorySpace2(short arg1) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (findInventorySpace(gameState.partyMembers[i] != 0)) {
				return gameState.partyMembers[i];
			}
		}
		return 0;
	} else {
		return findInventorySpace(arg1);
	}
}

/// $C4577D
ubyte changeEquippedWeapon(ushort character, short slot) {
	const oldWeapon = partyCharacters[character - 1].equipment[EquipmentSlot.weapon];
	partyCharacters[character - 1].equipment[EquipmentSlot.weapon] = cast(ubyte)slot;
	recalcCharacterPostmathOffense(character);
	recalcCharacterPostmathGuts(character);
	recalcCharacterMissRate(character);
	return oldWeapon;
}

/// $C457CA
ubyte changeEquippedBody(ushort character, short slot) {
	const oldBody = partyCharacters[character - 1].equipment[EquipmentSlot.body];
	partyCharacters[character - 1].equipment[EquipmentSlot.body] = cast(ubyte)slot;
	recalcCharacterPostmathDefense(character);
	recalcCharacterPostmathSpeed(character);
	calcResistances(character);
	return oldBody;
}

/// $C45815
ubyte changeEquippedArms(ushort character, short slot) {
	const oldArms = partyCharacters[character - 1].equipment[EquipmentSlot.arms];
	partyCharacters[character - 1].equipment[EquipmentSlot.arms] = cast(ubyte)slot;
	recalcCharacterPostmathDefense(character);
	recalcCharacterPostmathLuck(character);
	calcResistances(character);
	return oldArms;
}

/// $C45860
ubyte changeEquippedOther(ushort character, short slot) {
	const oldOther = partyCharacters[character - 1].equipment[EquipmentSlot.other];
	partyCharacters[character - 1].equipment[EquipmentSlot.other] = cast(ubyte)slot;
	recalcCharacterPostmathDefense(character);
	recalcCharacterPostmathLuck(character);
	calcResistances(character);
	return oldOther;
}

/// $C458AB
immutable ubyte[4] itemUsableFlags = [
	ItemFlags.nessCanUse,
	ItemFlags.paulaCanUse,
	ItemFlags.jeffCanUse,
	ItemFlags.pooCanUse,
];

/// $C45860
short checkStatusGroup(short arg1, short arg2) {
	if (arg2 == 8) {
		return gameState.partyStatus + 1;
	}
	if (unknownC2239D(arg1) != 0) {
		return partyCharacters[arg1 - 1].afflictions[arg2 - 1] + 1;
	}
	return 0;
}

/// $C458FE
short inflictStatusNonBattle(short arg1, short arg2, short arg3) {
	if (arg2 == 8) {
		gameState.partyStatus = cast(ubyte)(arg3 - 1);
		return arg1;
	}
	if (unknownC2239D(arg1) != 0) {
		partyCharacters[arg1 - 1].afflictions[arg2 - 1] = cast(ubyte)(arg3 - 1);
		unknownC3EE4D();
		return arg1;
	}
	return 0;
}

/// $C45963
immutable ubyte[10][5] miscTargetText = [
	ebString!10("Who?"),
	ebString!10("Which?"),
	ebString!10("Where?"),
	ebString!10("Whom?"),
	ebString!10("Where?"),
];

/// $C4
immutable ubyte[5] phoneCallText = ebString!5("Call:");

/// $C4599A
uint getRequiredEXP(short character) {
	character--;
	if (partyCharacters[character].level == maxLevel) {
		return 0;
	}
	return expTable[character][partyCharacters[character].level + 1] - partyCharacters[character].exp;
}

/// $C45A27
// wrong name
immutable ushort[7][7] statusEquipWindowText = [
	[0x0007, 0x0160, 0x0161, 0x0162, 0x0163, 0x0164, 0x0165],
	[0x0166, 0x0167, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0168, 0x0169, 0x0007, 0x0007, 0x0007, 0x0000, 0x0000],
	[0x016A, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0007, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0007, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0007, 0x0007, 0x0007, 0x0007, 0x0000, 0x0000, 0x0000]
];

// ditto
immutable ushort[7][7] statusEquipWindowText2 = [
	[0x0020, 0x000D, 0x000E, 0x000F, 0x001D, 0x001E, 0x001F],
	[0x001C, 0x012F, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x000C, 0x013F, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x000B, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0000]
];
// ditto
immutable ushort[7][7] statusEquipWindowText3 = [
	[0x0002, 0x0006, 0x0006, 0x0006, 0x0006, 0x0006, 0x0006],
	[0x0006, 0x0006, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0006, 0x0006, 0x0006, 0x0006, 0x0006, 0x0000, 0x0000],
	[0x0006, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0004, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0004, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0004, 0x0004, 0x0004, 0x0004, 0x0000, 0x0000, 0x0000],
];

immutable ubyte[35] statusEquipWindowText4 = ebString!35("@Press the -A- Button for PSI info.");
immutable ubyte[16][9] statusEquipWindowText5 = [
	ebString!16("Unconscious"),
	ebString!16("Diamondized"),
	ebString!16("Paralyzed"),
	ebString!16("Nauseous"),
	ebString!16("Poisoned"),
	ebString!16("Sunstroke"),
	ebString!16("Sniffling"),
	ebString!16("Mashroomized"),
	ebString!16("Possessed"),
];
immutable ubyte[16] statusEquipWindowText6 = ebString!16("Homesick");
immutable ubyte[12] statusEquipWindowText7 = ebString!12("Stored Goods");
immutable ubyte[8] statusEquipWindowText8 = ebString!8("Offense:");
immutable ubyte[8] statusEquipWindowText9 = ebString!8("Defense:");
immutable ubyte[11][4] statusEquipWindowText10 = [
	ebString!11("  Weapon"),
	ebString!11("      Body"),
	ebString!11("     Arms"),
	ebString!11("     Other"),
];
immutable ubyte[8][4] statusEquipWindowText11 = [
	ebString!8("Weapons"),
	ebString!8("Body"),
	ebString!8("Arms"),
	ebString!8("Others"),
];
immutable ubyte[10] statusEquipWindowText12 = ebString!10("(Nothing) ");
immutable ubyte[5] statusEquipWindowText13 = ebString!5("None");
immutable ubyte[3] statusEquipWindowText14 = ebString!3("To:");

immutable ubyte[6] homesicknessProbabilities = [
	0,
	100,
	150,
	200,
	250,
	0,
];

/// $C45E96
void unknownC45E96() {
	while (dmaTransferFlag != 0) { waitForInterrupt(); }
	for (short i = 0; i < 0x20; i++) {
		unknown7E9D23[i][0] = 0xFF;
	}
	vwfTile = 0;
	vwfX = 0;
	if (++unknown7E9E27 >= 0x30) {
		unknown7E9E27 = 0;
	}
	unknown7E9E29 = 0;
	unknownC44E44();
}

/// $C45ECE
short checkIfPSIKnown(short arg1, short arg2) {
	ubyte x10;
	switch (arg1) {
		case PartyMember.ness:
			x10 = psiAbilityTable[arg2].nessLevel;
			break;
		case PartyMember.paula:
			x10 = psiAbilityTable[arg2].paulaLevel;
			break;
		case PartyMember.poo:
			x10 = psiAbilityTable[arg2].pooLevel;
			break;
		default: break;
	}
	if (x10 != 0) {
		short x0E = 0;
		if (x10 <= partyCharacters[arg1 - 1].level) {
			x0E = 1;
		}
		return x0E;
	}
	return 0;
}

/// $C45F7B
ushort randMod(ushort arg1) {
	return cast(ubyte)(rand() % (arg1 + 1));
}

immutable ushort[3][3] directionMatrix = [
	[ Direction.upLeft, Direction.up, Direction.upRight ],
	[ Direction.left, Direction.up, Direction.right ],
	[ Direction.downLeft, Direction.down, Direction.downRight ],
];

/// $C45FA8
short getDirectionTo(short targetX, short targetY, short fromX, short fromY) {
	short x02 = cast(short)(fromX - targetX);
	short x0E = cast(short)(fromY - targetY);
	short x;
	if (x02 > 0) {
		x = 0;
	} else if (x02 == 0) {
		x = 1;
	} else {
		x = 2;
	}
	short x10;
	if (x0E > 0) {
		x10 = 0;
	} else if (x0E == 0) {
		x10 = 1;
	} else {
		x10 = 2;
	}
	return directionMatrix[x10][x];
}

/// $C46028
short findEntityBySprite(short arg1) {
	for (short i = 0; i < maxEntities; i++) {
		if (entitySpriteIDs[i] == arg1) {
			return i;
		}
	}
	return -1;
}

/// $C4605A
short findEntityByTPT(short arg1) {
	for (short i = 0; i < maxEntities; i++) {
		if (arg1 == entityNPCIDs[i]) {
			return i;
		}
	}
	return -1;
}

/// $C4608C
short findEntityByPartyMemberID(short arg1) {
	if (arg1 == PartyMember.leader) {
		return gameState.firstPartyMemberEntity;
	}
	for (short i = 0; i < 6; i++) {
		if (arg1 == gameState.partyMemberIndex[i]) {
			return gameState.partyEntities[i];
		}
	}
	return -1;
}

/// $C460CE
void unknownC460CE(short arg1, short arg2) {
	short x12 = findEntityByTPT(arg1);
	if (x12 == -1) {
		return;
	}
	entityPreparedXCoordinate = entityAbsXTable[x12];
	entityPreparedYCoordinate = entityAbsYTable[x12];
	entityPreparedDirection = entityDirections[x12];
	tracef("Changing entity %s script to unknownC3A209? %s", x12, arg2 != 6);
	setEntityActionScript((arg2 != 6) ? &unknownC3A209.ptr[0] : &actionScript35.ptr[0], x12);
}

/// $C46125
void unknownC46125(short arg1, short arg2) {
	short x12 = findEntityBySprite(arg1);
	if (x12 == -1) {
		return;
	}
	entityPreparedXCoordinate = entityAbsXTable[x12];
	entityPreparedYCoordinate = entityAbsYTable[x12];
	entityPreparedDirection = entityDirections[x12];
	tracef("Changing entity %s script to unknownC3A209? %s", x12, arg2 != 6);
	setEntityActionScript((arg2 != 6) ? &unknownC3A209.ptr[0] : &actionScript35.ptr[0], x12);
}

/// $C4617C
void changeScriptForEntityByTPT(short arg1, short arg2) {
	short x = findEntityByTPT(arg1);
	if (x == -1) {
		return;
	}
	tracef("Changing entity %s script to %s", x, cast(ActionScript)arg2);
	setEntityActionScript(&actionScriptScriptPointers[arg2][0], x);
}

/// $C461CC
void changeScriptForEntityBySprite(short arg1, short arg2) {
	short x = findEntityBySprite(arg1);
	if (x == -1) {
		return;
	}
	tracef("Changing entity %s script to %s", x, cast(ActionScript)arg2);
	setEntityActionScript(&actionScriptScriptPointers[arg2][0], x);
}

/// $C4621C
short unknownC4621C(short arg1, short arg2) {
	short x0E;
	switch (arg1) {
		case 0:
			x0E = findEntityByPartyMemberID(arg2);
			break;
		case 1:
			x0E = findEntityByTPT(arg2);
			break;
		case 2:
			x0E = findEntityBySprite(arg2);
			break;
		default: break;
	}
	return x0E;
}

/// $C46257
short unknownC46257(short arg1, short arg2, short arg3, short arg4) {
	short x14 = unknownC4621C(arg1, arg2);
	short x = unknownC4621C(arg3, arg4);
	return (getScreenAngle(entityAbsYTable[x14], entityAbsXTable[x14], entityAbsYTable[x], entityAbsXTable[x]) + 0x1000) / 0x2000;
}

/// $C462AE
short unknownC462AE(short arg1, short arg2, short arg3) {
	return unknownC46257(1, arg1, arg2, arg3);
}

/// $C462C9
short unknownC462C9(short arg1, short arg2, short arg3) {
	return unknownC46257(2, arg1, arg2, arg3);
}

/// $C462E4
short unknownC462E4(short arg1, short arg2, short arg3) {
	return unknownC46257(0, arg1, arg2, arg3);
}

/// $C462FF
void unknownC462FF(short arg1, short arg2) {
	short x0E = findEntityByTPT(arg1);
	if (x0E == -1) {
		return;
	}
	if (entityDirections[x0E] != arg2) {
		entityDirections[x0E] = arg2;
		updateEntitySprite(x0E);
	}
}

/// $C46331
void unknownC46331(short arg1, short arg2) {
	short x0E = findEntityBySprite(arg1);
	if (x0E == -1) {
		return;
	}
	if (entityDirections[x0E] != arg2) {
		entityDirections[x0E] = arg2;
		updateEntitySprite(x0E);
	}
}

/// $C46363
void unknownC46363(short arg1, short arg2) {
	short x0E = findEntityByPartyMemberID(arg1);
	if (x0E == -1) {
		return;
	}
	if (entityDirections[x0E] != arg2) {
		entityDirections[x0E] = arg2;
		updateEntitySpriteFrame(x0E);
	}
}

/// $C46397
void unknownC46397(short arg1) {
	for (short i = 0; i < gameState.partyCount; i++) {
		if (16 <= gameState.partyMemberIndex[i]) {
			continue;
		}
		short x0E = gameState.partyEntities[i];
		if (entityDirections[x0E] == arg1) {
			continue;
		}
		entityDirections[x0E] = arg1;
		updateEntitySpriteFrame(x0E);
	}
}

/// $C463F4
void hideCharacterOrParty(short arg1) {
	unknownC07C5B();
	playerIntangibilityFrames = 0;
	if (arg1 != 0xFF) {
		short a = findEntityByPartyMemberID(arg1);
		if (a != -1) {
			entitySpriteMapFlags[a] |= SpriteMapFlags.drawDisabled;
		}
	} else {
		for (short i = 0; i < gameState.partyCount; i++) {
			entitySpriteMapFlags[gameState.partyEntities[i]] |= SpriteMapFlags.drawDisabled;
		}
	}
}

/// $C4645A
void unhideCharacterOrParty(short arg1) {
	if (arg1 != 0xFF) {
		short a = findEntityByPartyMemberID(arg1);
		if (a != -1) {
			entitySpriteMapFlags[a] &= ~SpriteMapFlags.drawDisabled;
		}
	} else {
		for (short i = 0; i < gameState.partyCount; i++) {
			entitySpriteMapFlags[gameState.partyEntities[i]] &= ~SpriteMapFlags.drawDisabled;
		}
	}
}

/// $C464B5
short createPreparedEntityNPC(short npcID, short actionScript) {
	short result = createEntity(npcConfig[npcID].sprite, actionScript, -1, entityPreparedXCoordinate, entityPreparedYCoordinate);
	entityDirections[result] = entityPreparedDirection;
	entityNPCIDs[result] = npcID;
	return result;
}

/// $C46507
short createPreparedEntitySprite(short sprite, short actionScript) {
	short result = createEntity(sprite, actionScript, -1, entityPreparedXCoordinate, entityPreparedYCoordinate);
	entityDirections[result] = entityPreparedDirection;
	return result;
}

/// $C46534
short spawnEntityAtSelf(short sprite, short actionScriptID) {
	return createEntity(sprite, actionScriptID, -1, entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]);
}

/// $C4655E
void disableEntityByTPT(short arg1) {
	short a = findEntityByTPT(arg1);
	if (a == -1) {
		return;
	}
	entityCallbackFlags[a] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
}

/// $C46579
void disableEntityBySprite(short arg1){
	short a = findEntityBySprite(arg1);
	if (a == -1) {
		return;
	}
	entityCallbackFlags[a] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
}

/// $C46594
void disableEntityByCharacterOrParty(short arg1) {
	if (arg1 != 0xFF) {
		short a = findEntityByPartyMemberID(arg1);
		if (a == -1) {
			return;
		}
		entityCallbackFlags[a] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
	} else {
		entityCallbackFlags[partyLeaderEntity] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
		for (short i = 0; i < gameState.partyCount; i++) {
			entityCallbackFlags[gameState.partyEntities[i]] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
		}
	}
}

/// $C465FB
void enableEntityByTPT(short arg1) {
	short a = findEntityByTPT(arg1);
	if (a == -1) {
		return;
	}
	entityCallbackFlags[a] &= (0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled));
}

/// $C46616
void enableEntityBySprite(short arg1) {
	short a = findEntityBySprite(arg1);
	if (a == -1) {
		return;
	}
	entityCallbackFlags[a] &= (0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled));
}

/// $C46631
void enableEntityByCharacterOrParty(short arg1) {
	if (arg1 != 0xFF) {
		short a = findEntityByPartyMemberID(arg1);
		if (a == -1) {
			return;
		}
		entityCallbackFlags[a] &= (0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled));
		return;
	} else {
		entityCallbackFlags[partyLeaderEntity] &= 0x3FFF;
		for (short i = 0; i < gameState.partyCount; i++) {
			entityCallbackFlags[gameState.partyEntities[i]] &= (0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled));
		}
	}
}

/// $C46698
void focusCameraOnTPT(short arg1) {
	cameraFocusEntity = findEntityByTPT(arg1);
	gameState.cameraMode = CameraMode.followEntity;
}

/// $C466A8
void focusCameraOnSprite(short arg1) {
	cameraFocusEntity = findEntityBySprite(arg1);
	gameState.cameraMode = CameraMode.followEntity;
}

/// $C466B8
void clearCameraFocus() {
	gameState.leaderHasMoved = 0;
	gameState.cameraMode = CameraMode.normal;
}

/// $C466C1
void spawnTravellingPhotographer(short arg1) {
	unknownC07C5B();
	playerIntangibilityFrames = 0;
	unknown7E9E35 = cast(short)(arg1 - 1);
	displayText(getTextBlock("MSG_EVT_PHOTOGRAPHER"));
	savePhotoState(arg1);
}

/// $C466F0
void unknownC466F0(const(ubyte)* arg1) {
	displayText(arg1);
}

/// $C46712
void unknownC46712() {
	entityCallbackFlags[gameState.partyEntities[0]] |= EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled;
	for (short i = 0; i < gameState.partyCount; i++) {
		entitySpriteMapFlags[gameState.partyEntities[i]] |= SpriteMapFlags.drawDisabled;
	}
}

/// $C4675C
void unknownC4675C() {
	entityCallbackFlags[gameState.partyEntities[0]] &= ~(EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
	for (short i = 1; i < gameState.partyCount; i++) {
		if (gameState.partyMemberIndex[i] == 9) {
			continue;
		}
		entitySpriteMapFlags[gameState.partyEntities[i]] &= ~SpriteMapFlags.drawDisabled;
	}
}

/// $C467B4
short unknownC467B4() {
	return cast(short)((rand() & 0x1F) + 12);
}

/// $C467C2
short unknownC467C2() {
	return cast(short)((0x100 - entityScreenYTable[currentEntitySlot] / 4) + (rand() & 0x1F));
}

/// $C467E6
void unknownC467E6() {
	for (short i = 0; i < maxEntities; i++) {
		if (entitySpriteIDs[i] != 0x16F) {
			continue;
		}
		entityCallbackFlags[i] &= 0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
	}
}

/// $C4681A
void unknownC4681A() {
	if (entityNPCIDs[currentEntitySlot] == -1) {
		return;
	}
	if (npcConfig[entityNPCIDs[currentEntitySlot]].talkText == null) {
		return;
	}
	queueInteraction(InteractionType.unknown8, QueuedInteractionPtr(getTextBlock(npcConfig[entityNPCIDs[currentEntitySlot]].talkText)));
}

/// $C46881
void unknownC46881(const(ubyte)* arg1) {
	disableEntityByCharacterOrParty(0xFF);
	queueInteraction(InteractionType.unknown8, QueuedInteractionPtr(arg1));
}

/// $C468A9
short unknownC468A9() {
	return padPress[0];
}

/// $C468AF
short unknownC468AF() {
	return padState[0];
}

/// $C468B5
short unknownC468B5(short arg1) {
	// Favorite food naming hangs unless these comparisons are unsigned
	short x0E = 0;
	if (cast(ushort)arg1 < cast(ushort)entityAbsXTable[currentEntitySlot]) {
		x0E = 1;
	}
	return x0E;
}

/// $C468DC
short unknownC468DC(short arg1) {
	short x0E = 0;
	if (cast(ushort)arg1 < cast(ushort)entityAbsYTable[currentEntitySlot]) {
		x0E = 1;
	}
	return x0E;
}

/// $C46903
short unknownC46903(short arg1) {
	short x = 0;
	if (arg1 > gameState.leaderY.integer) {
		x = 1;
	}
	return x;
}

/// $C46914
short unknownC46914() {
	if (entityNPCIDs[currentEntitySlot] == -1) {
		return 4;
	}
	return npcConfig[entityNPCIDs[currentEntitySlot]].direction;
}

/// $C46957
void unknownC46957(short arg1) {
	if (entityDirections[currentEntitySlot] != arg1) {
		entityDirections[currentEntitySlot] = arg1;
		updateEntitySprite(currentEntitySlot);
	}
}

/// $C46984
void unknownC46984(short arg1) {
	short x04 = findEntityByTPT(arg1);
	if (x04 == -1) {
		return;
	}
	short x10 = cast(short)((getScreenAngle(entityAbsXTable[x04], entityAbsYTable[x04], entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]) + 0x1000) / 0x2000);
	if (entityDirections[x04] == x10) {
		return;
	}
	entityDirections[x04] = x10;
	updateEntitySprite(x04);
}

/// $C469F1
void unknownC469F1(short arg1) {
	short x04 = findEntityBySprite(arg1);
	if (x04 == -1) {
		return;
	}
	short x10 = cast(short)((getScreenAngle(entityAbsXTable[x04], entityAbsYTable[x04], entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]) + 0x1000) / 0x2000);
	if (entityDirections[x04] == x10) {
		return;
	}
	entityDirections[x04] = x10;
	updateEntitySprite(x04);
}

/// $C46A5E
immutable short[8] unknownC46A5E = [
	1,
	1,
	1,
	5,
	5,
	5,
	5,
	1,
];

/// $C46A6E
short unknownC46A6E() {
	return unknownC46A5E[gameState.leaderDirection];
}

/// $C46A7A
immutable short[8] directionTable4LR = [
	Direction.up,
	Direction.right,
	Direction.right,
	Direction.right,
	Direction.down,
	Direction.left,
	Direction.left,
	Direction.left,
];

/// $C46A8A
immutable short[8] directionTable4UD = [
	Direction.up,
	Direction.up,
	Direction.right,
	Direction.down,
	Direction.down,
	Direction.down,
	Direction.left,
	Direction.up,
];

/// $C46A9A - Converts a full cardinal+ordinal direction to a cardinal, rounding towards left/right
short convert8DirectionTo4PreferLeftRight(short arg1) {
	return directionTable4LR[arg1];
}

/// $C46AA3 - Converts a full cardinal+ordinal direction to a cardinal, rounding towards up/down
short convert8DirectionTo4PreferUpDown(short arg1) {
	return directionTable4UD[arg1];
}

/// $C46ADB
ushort entityAngleToDestination() {
	return getScreenAngle(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot], entityScriptVar6Table[currentEntitySlot], entityScriptVar7Table[currentEntitySlot]);
}

/// $C46B0A
short setMovingDirectionFromAngle(short arg1) {
	entityMovingDirection[currentEntitySlot] = cast(short)(cast(ushort)(arg1 + 0x1000) / 0x2000);
	return entityMovingDirection[currentEntitySlot];
}

/// $C46B2D
short unknownC46B2D(short arg1) {
	return cast(short)(arg1 * 0x2000);
}

/// $C46B37
short getOppositeDirection(short arg1) {
	return (arg1 + 4) & 7;
}

/// $C46B41
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

/// $C46B51
short getDirectionRotatedAngle90(ushort arg1) {
	return directionTableRotated90[cast(ushort)(arg1 + 0x1000) / 0x2000];
}

unittest {
	assert(getDirectionRotatedAngle90(0x0000) == Direction.right);
	assert(getDirectionRotatedAngle90(0x8000) == Direction.left);
	assert(getDirectionRotatedAngle90(0xF000) == Direction.right);
}

/// $C46B65
void unknownC46B65() {
	entityScriptVar6Table[currentEntitySlot] = gameState.leaderX.integer;
	entityScriptVar7Table[currentEntitySlot] = gameState.leaderY.integer;
}

/// $C46B8D
void unknownC46B8D(short arg1) {
	short x0E = findEntityByTPT(arg1);
	entityScriptVar6Table[currentEntitySlot] = entityAbsXTable[x0E];
	entityScriptVar7Table[currentEntitySlot] = entityAbsYTable[x0E];
}

/// $C46BBB
void unknownC46BBB(short arg1) {
	short x0E = findEntityBySprite(arg1);
	entityScriptVar6Table[currentEntitySlot] = entityAbsXTable[x0E];
	entityScriptVar7Table[currentEntitySlot] = entityAbsYTable[x0E];
}

/// $C46BE9
void getPositionOfPartyMember(short arg1) {
	short x12 = currentEntitySlot;
	short x0E;
	if (arg1 == 0xFE) {
		x0E = gameState.partyEntities[gameState.partyCount - 1];
		if (entityAbsXTable[x0E] == 0) {
			x0E = gameState.partyEntities[gameState.partyCount - 2];
		}
	} else {
		x0E = findEntityByPartyMemberID(arg1);
	}
	entityScriptVar6Table[x12] = entityAbsXTable[x0E];
	entityScriptVar7Table[x12] = entityAbsYTable[x0E];
}

/// $C46C45
void copyXYToVars() {
	entityScriptVar0Table[currentEntitySlot] = entityAbsXTable[currentEntitySlot];
	entityScriptVar1Table[currentEntitySlot] = entityAbsYTable[currentEntitySlot];
}

/// $C46C5E
void unknownC46C5E(short arg1, short arg2) {
	entityScriptVar0Table[currentEntitySlot] = cast(short)(arg2 + entityAbsXTable[currentEntitySlot]);
	entityScriptVar1Table[currentEntitySlot] = cast(short)(arg1 + entityAbsYTable[currentEntitySlot]);
}

/// $C46C87
void unknownC46C87() {
	entityAbsXTable[currentEntitySlot] = entityScriptVar6Table[currentEntitySlot];
	entityAbsYTable[currentEntitySlot] = entityScriptVar7Table[currentEntitySlot];
}

/// $C46C9B
void moveEntityToPartyMember(short arg1) {
	short x0E = findEntityByPartyMemberID(arg1);
	version(noUndefinedBehaviour) { // if no party member found, an underflow will occur here
		if (x0E == -1) {
			return;
		}
	}
	entityAbsXTable[currentEntitySlot] = entityAbsXTable[x0E];
	entityAbsYTable[currentEntitySlot] = entityAbsYTable[x0E];
}

/// $C46CC7
void moveEntityToSprite(short arg1) {
	short x0E = findEntityBySprite(arg1);
	version(noUndefinedBehaviour) { // if no sprite found, an underflow will occur here
		if (x0E == -1) {
			return;
		}
	}
	entityAbsXTable[currentEntitySlot] = entityAbsXTable[x0E];
	entityAbsYTable[currentEntitySlot] = entityAbsYTable[x0E];
}

/// $C46CF5
void unknownC46CF5(short arg1, short arg2) {
	entityAbsXTable[currentEntitySlot] = cast(short)(arg2 + bg1XPosition);
	entityAbsYTable[currentEntitySlot] = cast(short)(arg1 + bg1YPosition);
	entityAbsXFractionTable[currentEntitySlot] = cast(short)0x8000;
	entityAbsYFractionTable[currentEntitySlot] = cast(short)0x8000;
}

/// $C46D23
void unknownC46D23() {
	entityAbsXTable[currentEntitySlot] = cast(short)(rand() + bg1XPosition + 0x70);
	entityAbsYTable[currentEntitySlot] = bg1YPosition;
}

/// $C46D4B
void unknownC46D4B() {
	entityAbsXTable[currentEntitySlot] = cast(short)(photographerConfigTable[unknown7E9E35].photographerX * 8);
	entityAbsYTable[currentEntitySlot] = cast(short)(photographerConfigTable[unknown7E9E35].photographerY * 8);
	entityAbsYFractionTable[currentEntitySlot] = 0;
	entityAbsXFractionTable[currentEntitySlot] = 0;
}

/// $C46DAD
void prepareNewEntityAtExistingEntityLocation(short arg1) {
	short x0E;
	switch (arg1) {
		case 0:
			x0E = currentEntitySlot;
			break;
		case 1:
			x0E = gameState.firstPartyMemberEntity;
			break;
		default: break;
	}
	entityPreparedXCoordinate = entityAbsXTable[x0E];
	entityPreparedYCoordinate = entityAbsYTable[x0E];
	entityPreparedDirection = entityDirections[x0E];
}

/// $C46DE6
void prepareNewEntityAtTeleportDestination(short arg1) {
	entityPreparedXCoordinate = cast(ushort)(teleportDestinationTable[arg1].x * 8);
	entityPreparedYCoordinate = cast(ushort)(teleportDestinationTable[arg1].y * 8);
	entityPreparedDirection = cast(ushort)(teleportDestinationTable[arg1].direction - 1);
}

/// $C46E37
void prepareNewEntity(short arg1, short arg2, short arg3) {
	entityPreparedXCoordinate = arg2;
	entityPreparedYCoordinate = arg3;
	entityPreparedDirection = arg1 & 0xFF;
}

/// $C46E46
void actionScriptYieldToText() {
	unknown7E9641 = 1;
}

/// $C46E4F
void queueInteraction8(const(ubyte)* arg1) {
	queueInteraction(InteractionType.unknown8, QueuedInteractionPtr(arg1));
}

/// $C46E74
short isLeaderWithinBoundaries() {
	if (teleportDestination != 0) {
		return 0;
	}
	short x10 = cast(short)(entityScriptVar0Table[currentEntitySlot] - gameState.leaderX.integer);
	short x0E;
	if (0 > x10) {
		x0E = cast(short)-cast(int)x10;
	} else {
		x0E = x10;
	}
	if (x0E < entityScriptVar2Table[currentEntitySlot]) {
		x10 = cast(short)(entityScriptVar1Table[currentEntitySlot] - gameState.leaderY.integer);
		if (0 > x10) {
			x10 = cast(short)-cast(int)x10;
		} else {
			x10 = x10;
		}
		if (x10 < entityScriptVar3Table[currentEntitySlot]) {
			return 1;
		}
	}
	return 0;
}

/// $C46EF8
short unknownC46EF8() {
	if (teleportDestination != 0) {
		return 0;
	}
	short x10 = cast(short)(entityAbsXTable[currentEntitySlot] - gameState.leaderX.integer);
	short x0E;
	if (0 > x10) {
		x0E = cast(short)-cast(int)x10;
	} else {
		x0E = x10;
	}
	if (x0E < entityScriptVar2Table[currentEntitySlot]) {
		x10 = cast(short)(entityAbsYTable[currentEntitySlot] - gameState.leaderY.integer);
		if (0 > x10) {
			x10 = cast(short)-cast(int)x10;
		} else {
			x10 = x10;
		}
		if (x10 < entityScriptVar3Table[currentEntitySlot]) {
			return 1;
		}
	}
	return 0;
}

/// $C47044
short setMovementFromAngle(short arg1) {
	auto x0E = unknownC41FFF(arg1, entityMovementSpeed[currentEntitySlot]);
	short x14 = x0E.x;
	if (x14 < 0) {
		entityDeltaXTable[currentEntitySlot] = x14 >> 8;
		entityDeltaXFractionTable[currentEntitySlot] = cast(short)((x14 << 8) | 0xFF);
	} else {
		entityDeltaXTable[currentEntitySlot] = (x14 >> 8) & 0xFF;
		entityDeltaXFractionTable[currentEntitySlot] = cast(short)((x14 << 8) & 0xFF00);
	}
	x14 = x0E.y;
	if (x14 < 0) {
		entityDeltaYTable[currentEntitySlot] = x14 >> 8;
		entityDeltaYFractionTable[currentEntitySlot] = cast(short)((x14 << 8) | 0xFF);
	} else {
		entityDeltaYTable[currentEntitySlot] = (x14 >> 8) & 0xFF;
		entityDeltaYFractionTable[currentEntitySlot] = cast(short)((x14 << 8) & 0xFF00);
	}
	return arg1;
}

/// $C47143
short unknownC47143(short arg1, short arg2) {
	short x12 = cast(short)(entityScriptVar6Table[currentEntitySlot] - entityAbsXTable[currentEntitySlot]);
	if (0 > x12) {
		x12 = cast(short)-cast(int)x12;
	} else {
		x12 = x12; //...ok?
	}
	if (x12 < entityScriptVar5Table[currentEntitySlot]) {
		x12 = cast(short)(entityScriptVar7Table[currentEntitySlot] - entityAbsYTable[currentEntitySlot]);
		if (0 > x12) {
			x12 = cast(short)-cast(int)x12;
		} else {
			x12 = x12;
		}
		if (x12 < entityScriptVar5Table[currentEntitySlot]) {
			return 1;
		}
	}
	x12 = entityAngleToDestination();
	setMovementFromAngle(x12);
	if (arg2 == 0) {
		short x10 = setMovingDirectionFromAngle(x12);
		if (arg1 != 0) {
			x10 = getOppositeDirection(x10);
		}
		short x0E = entityDirections[currentEntitySlot];
		entityDirections[currentEntitySlot] = x10;
		if (convert8DirectionTo4PreferUpDown(x0E) != convert8DirectionTo4PreferUpDown(x10)) {
			updateEntitySprite(currentEntitySlot);
		}
	}
	return 0;
}

/// $C47225 - Sets boundaries for an entity to be used by directionToEntityBoundaries. Uses vars 0-3.
void setEntityBoundaries(short height, short width) {
	entityScriptVar0Table[currentEntitySlot] = cast(short)(entityAbsXTable[currentEntitySlot] - width);
	entityScriptVar1Table[currentEntitySlot] = cast(short)(entityAbsXTable[currentEntitySlot] + width);
	entityScriptVar2Table[currentEntitySlot] = cast(short)(entityAbsYTable[currentEntitySlot] - height);
	entityScriptVar3Table[currentEntitySlot] = cast(short)(entityAbsYTable[currentEntitySlot] + height);
}

/// $C47269 - Returns the direction + 1 towards the boundaries set by setEntityBoundaries, 0 if already inside. Uses vars 0-3.
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

/// $C472A8
void entitySpiralMovement(short flip) {
	setMovementFromAngle(entityScriptVar0Table[currentEntitySlot]);
	short x10 = getDirectionRotatedAngle90(entityScriptVar0Table[currentEntitySlot]);
	if (flip != 0) {
		x10 = getOppositeDirection(x10);
	}
	short x0E = entityDirections[currentEntitySlot];
	entityDirections[currentEntitySlot] = x10;
	if (convert8DirectionTo4PreferUpDown(x0E) != convert8DirectionTo4PreferUpDown(x10)) {
		updateEntitySprite(currentEntitySlot);
	}
}
unittest {
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

/// $C4730E
void unknownC4730E() {
	entityDeltaYTable[currentEntitySlot] /= 2;
}

/// $C47333
short getPartyCount() {
	return gameState.partyCount;
}

/// $C4733C
void unknownC4733C() {
	unknownC006F2(tilesetTable[loadedMapTileCombo]);
}

/// $C4734C
short actionScriptRerenderRow(short arg1) {
	unknownC01A63(bg1XPosition / 8, arg1);
	return arg1;
}

/// $C47369
void unknownC47369() {
	unknownC019E2();
}

/// $C47370
void loadBackgroundAnimation(short bg, short arg2) {
	prepareForImmediateDMA();
	setBGMODE(BGMode.mode1 | BG3Priority);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0x0000);
	setBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x1000);
	loadBattleBG(bg, arg2, 4);
	setForceBlank();
}

/// $C473B2
ushort unknownC473B2(short arg1) {
	if (arg1 < 0) {
		return 0;
	}
	if (arg1 >= 31) {
		return 31;
	}
	return arg1 & 0x1F;
}

/// $C473D0
void unknownC473D0(short arg1, short arg2) {
	ushort* x16 = &mapPaletteBackup[arg1][0];
	version(bugfix) {
		if (arg1 >= palettes.length - 2) {
			return;
		}
	}
	ushort* x18 = &palettes[arg1 + 2][0];
	for (short i = 0; i < 16; i++) {
		short x14 = cast(ushort)((x16[0] & 0x1F) + arg2);
		short x12 = cast(ushort)(((x16[0] >> 5) & 0x1F) + arg2);
		short x10 = cast(ushort)(((x16[0] >> 10) & 0x1F) + arg2);
		ushort x0E = unknownC473B2(x14);
		ushort x12_2 = unknownC473B2(x12);
		ushort x10_2 = unknownC473B2(x10);
		x16++;
		(x18++)[0] = cast(ushort)((x12_2 << 5) | (x10_2 << 10) | x0E);
	}
}

/// $C4746B
void unknownC4746B(short arg1) {
	for (short i = 0; i < 16; i++) {
		unknownC473D0(i, arg1);
	}
	paletteUploadMode = PaletteUpload.full;
}

/// $C47499
void unknownC47499() {
	unknownC4746B(entityScriptVar0Table[currentEntitySlot]);
}

/// $C474A8
// calls to this seem to specify an argument, but the registers are clobbered immediately
void unknownC474A8() {
	unknownC4249A(
		(0 <= entityScriptVar0Table[currentEntitySlot]) ? 0x33 : 0xB3,
		cast(ubyte)((0 <= entityScriptVar0Table[currentEntitySlot]) ? entityScriptVar0Table[currentEntitySlot] : cast(short)-cast(int)entityScriptVar0Table[currentEntitySlot])
	);
}

/// $C474F6
immutable ubyte[11] unknownC474F6 = [ 0x10, 0x10, 0x0F, 0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x09, 0x06, 0x03 ];

/// $C47501
void unknownC47501(ubyte* arg1) {
	if (entityAbsYTable[currentEntitySlot] - bg1YPosition + 4 >= 0) {
		(arg1++)[0] = cast(ubyte)(entityAbsYTable[currentEntitySlot] - bg1YPosition + 5);
		short x12 = cast(short)(entityAbsXTable[currentEntitySlot] + 16 - bg1XPosition);
		if (entityAbsXTable[currentEntitySlot] - 16 - bg1XPosition < 0x100) {
			(arg1++)[0] = cast(ubyte)(entityAbsXTable[currentEntitySlot] - 16 - bg1XPosition);
			if (x12 < 0x100) {
				(arg1++)[0] = cast(ubyte)x12;
			} else {
				(arg1++)[0] = 0xFF;
			}
		} else {
			if (x12 < 0x100) {
				(arg1++)[0] = 0;
				(arg1++)[0] = cast(ubyte)x12;
			} else {
				(arg1++)[0] = 0x80;
				(arg1++)[0] = 0x7F;
			}
		}
	}
	short x04 = cast(short)(entityAbsXTable[currentEntitySlot] - bg1XPosition);
	if (entityAbsYTable[currentEntitySlot] - bg1YPosition + 15 >= 0) {
		short x02 = (entityAbsYTable[currentEntitySlot] - bg1YPosition + 15 < 10) ? cast(short)(entityAbsYTable[currentEntitySlot] - bg1YPosition + 15) : 10;
		const(ubyte)* x0A = &unknownC474F6[10 - x02];
		for (short i = 0; i < x02 + 1; i++) {
			(arg1++)[0] = 1;
			short x0E = cast(short)(x04 - x0A[0]);
			short x = cast(short)(x04 + x0A[0] - 1);
			x0A++;
			if (x0E < 0x100) {
				(arg1++)[0] = cast(ubyte)x0E;
				if (x < 0x100) {
					(arg1++)[0] = cast(ubyte)x;
				} else {
					(arg1++)[0] = 0xFF;
				}
			} else {
				if (x < 0x100) {
					(arg1++)[0] = 0;
					(arg1++)[0] = cast(ubyte)x;
				} else {
					(arg1++)[0] = 0x80;
					(arg1++)[0] = 0x7F;
				}
			}
		}
	}
	(arg1++)[0] = 1;
	(arg1++)[0] = 0x80;
	(arg1++)[0] = 0x7F;
	(arg1++)[0] = 0;
}

/// $C476A5
void unknownC476A5() {
	short x16;
	if ((entityScriptVar0Table[currentEntitySlot] & 1) != 0) {
		x16 = 0;
	} else {
		x16 = 0x2FE;
	}
	unknownC47501(&buffer[x16]);
	unknownC425CC(&buffer[x16]);
	entityScriptVar0Table[currentEntitySlot]++;
}

/// $C47705
void unknownC47705() {
	short x16;
	if ((entityScriptVar0Table[currentEntitySlot] & 1) != 0) {
		x16 = 0x5FC;
	} else {
		x16 = 0x8FA;
	}
	unknownC47501(&buffer[x16]);
	unknownC425FD(&buffer[x16]);
	entityScriptVar0Table[currentEntitySlot]++;
}

/// $C47765
void unknownC47765(short arg1, short arg2, short arg3) {
	ubyte* x0A = &buffer[0xBF8];
	short x14 = cast(short)(arg2 - bg1YPosition);
	if (x14 > 0x7F) {
		x0A[0] = 0x7F;
		buffer[0xBF9] = 0;
		buffer[0xBFA] = 0xFF;
		x0A = &buffer[0xBFB];
		x14 -= 0x7F;
	}
	(x0A++)[0] = cast(ubyte)x14;
	(x0A++)[0] = 0;
	(x0A++)[0] = 0xFF;
	short y = cast(short)(arg1 - bg1XPosition);
	short x12 = cast(short)(arg3 - bg1XPosition);
	for (short i = 0; i < 16; i++) {
		(x0A++)[0] = 1;
		(x0A++)[0] = cast(ubyte)y;
		(x0A++)[0] = cast(ubyte)x12;
		x12--;
	}
	(x0A++)[0] = 1;
	(x0A++)[0] = 0x80;
	(x0A++)[0] = 0x7F;
	(x0A++)[0] = 0;
	unknownC42542(&buffer[0xBF8]);
}

/// $C47866
short unknownC47866(short arg1, short arg2) {
	short x0E = arg1;
	if (0 > arg1) {
		x0E = 0;
	}
	if (x0E > arg2) {
		x0E = arg2;
	}
	return x0E;
}

/// $C4789E
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

/// $C47930 - Configures HDMA + window to create a rectangular window on screen
void rectangleWindowConfigure(short xmin, short xmax, short ymin, short ymax) {
	short bufferOffset;
	if ((rectangleWindowBufferIndex & 1) != 0) {
		bufferOffset = 0;
	} else {
		bufferOffset = 0x2FE;
	}
	short yminClamp = unknownC47866(ymin, 224);
	short ymaxClamp = unknownC47866(ymax, 224);
	short xminClamp = unknownC47866(xmin, 256);
	short xmaxClamp = unknownC47866(xmax, 256);
	ubyte* buffer = &buffer[bufferOffset];
	// Configure a region above the rectangle with no windowing (WH0 > WH1 means no window)
	buffer = rectangleWindowAddHdmaEntry(yminClamp, 0x80, 0x7F, buffer);
	// Configure the region where we have our rectangle
	buffer = rectangleWindowAddHdmaEntry(cast(short)(ymaxClamp - yminClamp), xminClamp, xmaxClamp, buffer);
	// Configure a region below the rectangle with no windowing (WH0 > WH1 means no window)
	buffer = rectangleWindowAddHdmaEntry(cast(short)(224 - ymaxClamp - 1), 0x80, 0x7F, buffer);
	// Terminate the table
	buffer[0] = 0;
	rectangleWindowEnableHdma(&buffer[bufferOffset]);
	rectangleWindowBufferIndex++;
}

/// $C479E9
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

/// $C47A27
void unknownC47A27() {
	bg1YPosition = cast(short)(entityAbsYTable[currentEntitySlot] - 0x70);
	short x10 = cast(short)(entityAbsYTable[gameState.firstPartyMemberEntity] - (entityAbsYTable[currentEntitySlot] - 0x70));
	rectangleWindowConfigure(0x10, cast(short)(x10 - 0x60), 0xF0, cast(short)(x10 + 0x60));
}

/// $C47A6B
void unknownC47A6B() {
	entityAbsYTable[currentEntitySlot] = cast(short)(entityScriptVar7Table[currentEntitySlot] - (entityAbsYTable[currentEntitySlot] - entityScriptVar7Table[currentEntitySlot]));
}

/// $C47A9E
void unknownC47A9E() {
	decomp(&animationGraphics[animationSequencePointers[entityScriptVar0Table[currentEntitySlot]].id][0], &buffer[0]);
	copyToVRAM2(0, animationSequencePointers[entityScriptVar0Table[currentEntitySlot]].unknown4, 0x6000, &buffer[0]);
	memcpy(&palettes[0][0], &buffer[animationSequencePointers[entityScriptVar0Table[currentEntitySlot]].unknown4], 8);
	paletteUploadMode = PaletteUpload.full;
	bg3YPosition = 0xFFFF;
}

/// $C47B77
short unknownC47B77() {
	bg3YPosition = 0xFFFF;
	copyToVRAM(0, 0x700, 0x7C00, &buffer[8 + animationSequencePointers[entityScriptVar0Table[currentEntitySlot]].unknown4 + entityScriptVar1Table[currentEntitySlot] * 0x700]);
	if (entityScriptVar1Table[currentEntitySlot] + 1 == animationSequencePointers[entityScriptVar0Table[currentEntitySlot]].unknown6) {
		return 0;
	}
	return animationSequencePointers[entityScriptVar0Table[currentEntitySlot]].unknown7;
}

/// $C47C3F
//definitely need to check this one over
void prepareWindowGraphics() {
	decomp(&textWindowGraphics[0], &buffer[0]);
	memcpy(&buffer[0x2000], &buffer[0x1000], 0x2A00);
	memset(&buffer[0x3200], 0, 0x600);
	if (gameState.textFlavour == 0) {
		gameState.textFlavour = 1;
	}
	if (textWindowProperties[gameState.textFlavour - 1].unknown == 8) {
		decomp(&flavouredTextGraphics[0], &buffer[0x100]);
	}
	ushort* x24 = cast(ushort*)&buffer[0x2A00];
	for (short i = 0; i < 4; i++) {
		vwfTile = 0;
		vwfX = 0;
		memset(&vwfBuffer[0][0], 0xFF, 0x340);
		textRenderState.upperVRAMPosition = 0;
		textRenderState.pixelsRendered = 0;
		ubyte* x0A = &partyCharacters[i].name[0];
		vwfX = 2;
		for (short j = 0; x0A[0] != 0; j++) {
			renderText(6, fontConfigTable[Font.battle].width, &fontGraphics[fontConfigTable[Font.battle].graphicsID][fontConfigTable[Font.battle].height * ((*x0A - 0x50) & 0x7F)]);
			x0A++;
		}
		for (short j = 0; j < 4; j++) {
			memcpy(&buffer[0x2A00 + j * 16 + i * 64], &vwfBuffer[j][0], 0x10);
			memcpy(&buffer[0x2A00 + j * 16 + i * 64 + 0x100], &vwfBuffer[j][16], 0x10);
		}
	}
	for (short i = 0; i < 0x20; i++) {
		ubyte* x1A = &buffer[0x70];
		for (short j = 0; j < 8; j++) {
			x24[0] = (x24[0] & 0xFF00) | ((x24[0] >> 8) ^ 0xFF) | x1A[0];
			x24++;
			x1A += 2;
		}
	}
	ushort* x16 = cast(ushort*)&buffer[0x2C00];

	for (const(ushort)* x24_2 = &statusEquipWindowText2[0][0]; *x24_2 != 0; x24_2++) {
		if (*x24_2 == 0x20) {
			continue;
		}
		ushort* x0A = cast(ushort*)(&buffer[((*x24_2 & 0xFFF0) + *x24_2) * 16]);
		ubyte* x1A = &buffer[0x70];
		for (short i = 0; i < 8; i++) {
			x16[0] = (x0A[0] & 0xFF00) | ((x0A[0] >> 8) ^ 0xFF) | x1A[0];
			x16[0x80] = (x0A[0x80] & 0xFF00) | ((x0A[0x80] >> 8) ^ 0xFF) | x1A[0x80];
			x16++;
			x0A++;
			x1A += 2;
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

/// $C47F87
void loadTextPalette() {
	ubyte affliction = 0;
	// Normally the game just indexes the playerControlledPartyMembers array out of bounds - not the best idea.
	version(bugfix) {
		if (gameState.playerControlledPartyMemberCount > 0) {
			if (chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]] != null){
				affliction = chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0];
			}
		}
	} else {
		affliction = chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0];
	}
	switch(affliction) {
		case 1:
		case 2:
			if (disabledTransitions != 0) {
				goto default;
			}
			memcpy(palettes.ptr, textWindowFlavourPalettes[5].ptr, 0x40);
			break;
		default:
			memcpy(palettes.ptr, (cast(void*)textWindowFlavourPalettes.ptr) + textWindowProperties[gameState.textFlavour - 1].offset, 0x40);
			break;
	}
	palettes[0][0] = 0;
	preparePaletteUpload(PaletteUpload.halfFirst);
}

/// $C4800B
void undrawFlyoverText() {
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	unknownC2038B();
	prepareWindowGraphics();
	loadWindowGraphics(WindowGraphicsToLoad.all2);
	loadTextPalette();
	paletteUploadMode = PaletteUpload.full;
}

/// $C48037
immutable ubyte[215] lumineHallText = ebString!215("I'm ....  It's been a long road getting here...  Soon, I'll be...  Soon, I'll be...  Soon, I'll be...  What will happen to us?  W...what's happening?  My thoughts are being written out on the wall...  or are they?  ");

/// $C4810E
ushort* unknownC4810E(short arg1, ushort* arg2) {
	ubyte* x06 = &buffer[0];
	x06 += (((arg1 & 0xFFF0) * 2) + (arg1 & 0xF)) * 16;
	for (ushort i = 6; i < 7; i -= 2) {
		for (short j = 0; j < 4; j++) {
			ubyte x00 = x06[0];
			ubyte x01 = x06[1];
			ushort x0E = (x00 ^ x01) & x00;
			x00 = x06[2];
			x01 = x06[3];
			ushort x02 = (x00 ^ x01) & x00;
			x02 = cast(ushort)(((x02 >> i) & 3) << 2);
			(arg2++)[0] = cast(ushort)(((x0E >> i) & 3) + x02);
			x06 += 4;
		}
		x06 += 0xF0;
		for (short j = 0; j < 4; j++) {
			ubyte x00 = x06[0];
			ubyte x01 = x06[1];
			ushort x0E = (x00 ^ x01) & x00;
			x00 = x06[2];
			x01 = x06[3];
			ushort x02 = (x00 ^ x01) & x00;
			x02 = cast(ushort)(((x02 >> i) & 3) << 2);
			(arg2++)[0] = cast(ushort)(((x0E >> i) & 3) + x02);
			x06 += 4;
		}
		x06 -= 0x110;
	}
	return arg2;
}

/// $C4827B
void renderWholeCharacter(short font, short character) {
	short characterOffset = (character - ebChar(' ')) & 0x7F;
	short fontHeight = fontConfigTable[font].height;
	const(ubyte)* charTiles = &fontGraphics[fontConfigTable[font].graphicsID][characterOffset * fontHeight];
	short fontWidth = fontConfigTable[font].width;
	short charWidth = fontData[fontConfigTable[font].dataID][characterOffset];
	charWidth += characterPadding;
	while (charWidth > 8) {
		renderText(8, fontWidth, charTiles);
		charWidth -= 8;
		charTiles += fontWidth;
	}
	renderText(charWidth, fontWidth, charTiles);
}

/// $C4838A
short renderLumineHallText(short font) {
	short x2E = 0;
	short x2C = 0;
	short x2A = 0;
	vwfTile = 0;
	vwfX = 0;
	memset(&vwfBuffer[0][0], 0xFF, 0x400);
	short x04 = 4;
	short x28 = cast(short)strlen(cast(char*)&partyCharacters[0].name[0]);
	if (x28 > 5) {
		x28 = 5;
	}
	short x26 = 6;
	ubyte* x06 = &partyCharacters[0].name[0];
	for (short i = 0; x04 > i; i++) {
		renderWholeCharacter(font, lumineHallText[i]);
	}
	for (short i = 0; x28 > i; i++) {
		renderWholeCharacter(font, (x06++)[0]);
	}
	for (short i = 0; x26 > i; i++) {
		renderWholeCharacter(font, lumineHallText[4 + i]);
	}
	x26 = cast(short)(vwfX + x2C);
	x28 = 0;
	short x20 = 0;
	for (short i = 0; i < vwfX / 8; i++) {
		memcpy(&buffer[x2A], &(cast(ubyte*)&vwfBuffer[0][0])[x20], 16);
		x20 += 16;
		memcpy(&buffer[x2A + 0x100], &(cast(ubyte*)&vwfBuffer[0][0])[x20], 16);
		x20 += 16;
		x2A += 16;
	}
	x2C = lumineHallText.length - 10;
	memcpy(&vwfBuffer[0][0], &vwfBuffer[vwfX / 8][0], 0x20);
	vwfTile = 0;
	vwfX %= 8;
	for (short i = 0; x2C > i; i++) {
		if (x2E > 16) {
			x2E = 0;
			x26 += vwfX;
			x20 = 0;
			 for (short j = 0; j < vwfX / 8; j++) {
				memcpy(&buffer[x2A], &(cast(ubyte*)&vwfBuffer[0][0])[x20], 16);
				x20 += 16;
				memcpy(&buffer[x2A + 0x100], &(cast(ubyte*)&vwfBuffer[0][0])[x20], 16);
				x20 += 16;
				x2A += 16;
				if ((x2A % 0x100) == 0) {
					x2A += 0x100;
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
		x2E++;
	}
	x04 = cast(short)(vwfX + x26);
	x20 = 0;
	for (short i = 0; i < (vwfX / 8) + 16; i++) {
		memcpy(&buffer[x2A], &(cast(ubyte*)&vwfBuffer[0][0])[x20], 16);
		x20 += 16;
		memcpy(&buffer[x2A + 0x100], &(cast(ubyte*)&vwfBuffer[0][0])[x20], 16);
		x20 += 16;
		x2A += 16;
		if ((x2A % 0x100) == 0) {
			x2A += 0x100;
		}
	}
	return cast(short)((x04 / 8) * 4);
}

unittest {
	if (romDataLoaded) {
		partyCharacters[0].name = ebString!5("Ness");
		characterPadding = 1;
		assert(renderLumineHallText(Font.main) == 456);
		assert(buffer[0 .. 0x1000] == import("exampleluminehallrender.bin"));
	}
}

/// $C4880C
void unknownC4880C() {
	short y = renderLumineHallText(Font.main);
	ushort* x06 = cast(ushort*)&buffer[0x4000];
	for (short i = 0; i < 0x1D; i++) {
		for (short j = 0; j < 8; j++) {
			(x06++)[0] = 0;
		}
	}
	short x04 = cast(short)(y + 30);
	short x1E = 0;
	short x1C;
	for (x1C = 0; x1C < 4; x1C++) {
		x06 = unknownC4810E(x1C, x06);
		x1E++;
	}
	short x1A = cast(short)strlen(cast(char*)&partyCharacters[0].name[0]);
	if (x1A == 6) {
		x1A--;
	}
	for(x1E = 0; x1A < x1E; x1E++, x1C++) {
		x06 = unknownC4810E(x1C, x06);
	}
	for (x1E = 0; x1E < 6; x1E++, x1C++) {
		x06 = unknownC4810E(x1C, x06);
	}
	for (x1E = 0; x1E < lumineHallText.length - 10; x1E++, x1C++) {
		x06 = unknownC4810E(x1C, x06);
	}
	for (short i = 0; i < 30; i++) {
		for (short j = 0; j < 8; j++) {
			(x06++)[0] = 0;
		}
	}
	x06 = cast(ushort*)&buffer[0x1000];
	ushort* x0A = cast(ushort*)&buffer[0x4000];
	for (short i = 0; i < 8; i++) {
		(x06++)[0] = 0x0C10;
	}
	for (short i = 0; i < x04 + 0x1E; i++) {
		for (short j = 0; j < 8; j++) {
			x06[0] = ((x0A[0] << 1) & 0b1010) | ((x0A[8] >> 1) & 0b0101);
			x06[0] += 0x0C10;
			x0A[0] += 0x0C10;
			x06++;
			x0A++;
		}
	}
	entityScriptVar0Table[currentEntitySlot] = cast(short)(x04 * 2);
	buffer[0] = 0x08;
	buffer[1] = 0x1E;
}

unittest {
	if (romDataLoaded) {
		buffer[] = 0;
		partyCharacters[0].name = ebString!5("Ness");
		characterPadding = 1;
		unknownC4880C();
		assert(buffer[0x1000 .. 0x3040] == import("exampleluminehallrendermap1.bin"));
		assert(buffer[0x4000 .. 0x6040] == import("exampleluminehallrendermap2.bin"));
	}
}

/// $C48A6D
short unknownC48A6D() {
	ushort* x06;
	if ((entityScriptVar1Table[currentEntitySlot] & 1) != 0) {
		x06 = cast(ushort*)&buffer[0x4000 + (entityScriptVar1Table[currentEntitySlot] >> 1) * 16];
	} else {
		x06 = cast(ushort*)&buffer[0x1000 + (entityScriptVar1Table[currentEntitySlot] >> 1) * 16];
	}
	ushort* x0A = cast(ushort*)&buffer[2];
	for (short i = 0; i < 8; i++) {
		for (short j = 0; j < 30; j++) {
			(x0A++)[0] = x06[0];
			x06 += 8;
		}
		// interesting...
		x06 += -239;
	}
	unknownC3F705(0x328, 0x24C, cast(ushort*)&buffer[0]);
	short x = 0;
	if (++entityScriptVar1Table[currentEntitySlot] > entityScriptVar0Table[currentEntitySlot]) {
		x = 1;
	}
	return x;
}

/// $C48B2C
void unknownC48B2C() {
	teleportStyle = TeleportStyle.unknown;
	gameState.leaderDirection = Direction.right;
}

/// $C48B3B
void unknownC48B3B() {
	if ((frameCounter & 1) != 0) {
		return;
	}
	for (short i = 0; gameState.partyCount > i; i++) {
		if (16 <= gameState.partyMemberIndex[i]) {
			continue;
		}
		short x10 = cast(short)(cast(ushort)(getScreenAngle(entityAbsXTable[gameState.partyEntities[i]], entityAbsYTable[gameState.partyEntities[i]], entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]) + 0x1000) / 0x2000);
		if (entityDirections[gameState.partyEntities[i]] == x10) {
			continue;
		}
		entityDirections[gameState.partyEntities[i]] = x10;
		updateEntitySpriteFrame(gameState.partyEntities[i]);
	}
}

/// $C48BDA
void unknownC48BDA() {
	drawBattleFrame();
}

/// $C48BE1
void unknownC48BE1() {
	entityScreenXTable[currentEntitySlot] = cast(short)(entityAbsXTable[currentEntitySlot] - bg1XPosition);
	entityScreenYTable[currentEntitySlot] = cast(short)(entityAbsYTable[currentEntitySlot] - bg1YPosition);
}

/// $C48C02
void unknownC48C02() {
	entityScreenXTable[currentEntitySlot] = cast(short)(entityAbsXTable[currentEntitySlot] - bg1XPosition + entityScriptVar0Table[currentEntitySlot]);
	entityScreenYTable[currentEntitySlot] = cast(short)(entityAbsYTable[currentEntitySlot] - bg1YPosition + entityScriptVar1Table[currentEntitySlot]);
}

/// $C48C2B
void unknownC48C2B() {
	centerScreen(entityAbsXTable[currentEntitySlot], entityAbsYTable[currentEntitySlot]);
}

/// $C48C3E
void unknownC48C3E() {
	centerScreen(cast(short)(entityAbsXTable[currentEntitySlot] + entityScriptVar0Table[currentEntitySlot]), cast(short)(entityAbsYTable[currentEntitySlot] + entityScriptVar1Table[currentEntitySlot]));
}

/// $C48C59
immutable short[8] directionToButtonMap = [ Pad.up, Pad.up | Pad.right, Pad.right, Pad.down | Pad.right, Pad.down, Pad.left | Pad.down, Pad.left, Pad.up | Pad.left ];

/// $C48C69
void clearAutoMovementDemo() {
	autoMovementDemoPosition = 0;
	for (short i = 0; i < autoMovementDemoBuffer.length; i++) {
		autoMovementDemoBuffer[i].padState = 0;
		autoMovementDemoBuffer[i].frames = 0;
	}
}

/// $C48C97
void recordAutoMovementDemoFrame(short newPadState) {
	if ((autoMovementDemoPosition == 0) && (autoMovementDemoBuffer[autoMovementDemoPosition].padState == 0)) {
		autoMovementDemoBuffer[autoMovementDemoPosition].padState = newPadState;
		autoMovementDemoBuffer[0].frames = 1;
	} else {
		if (autoMovementDemoBuffer[autoMovementDemoPosition].padState == newPadState) {
			autoMovementDemoBuffer[autoMovementDemoPosition].frames++;
		} else {
			if (++autoMovementDemoPosition == autoMovementDemoBuffer.length) {
				assert(0);
			} else {
				autoMovementDemoBuffer[autoMovementDemoPosition].padState = newPadState;
				autoMovementDemoBuffer[autoMovementDemoPosition].frames = 1;
			}
		}
	}
}

/// $C48D58
short recordAutoMovementDemo(short startX, short startY, short destX, short destY) {
	FixedPoint1616 xPosition = { fraction: startX };
	FixedPoint1616 yPosition = { fraction: startY };
	short result = 0;
	while (true) {
		short xDifference = cast(short)(xPosition.integer - destX);
		short yDifference = cast(short)(yPosition.integer - destY);
		if (((0 > xDifference) ? (cast(short)-cast(int)xDifference) : xDifference <= 1) && ((0 > yDifference) ? (cast(short)-cast(int)yDifference) : yDifference <= 1)) {
			break;
		}
		short nextDirection = (getScreenAngle(xPosition.integer, yPosition.integer, destX, destY) + 0x1000) / 0x2000;
		recordAutoMovementDemoFrame(directionToButtonMap[nextDirection]);
		xPosition.combined += horizontalMovementSpeeds[nextDirection / 8].directionSpeeds[0].combined;
		yPosition.combined += verticalMovementSpeeds[nextDirection / 8].directionSpeeds[0].combined;
		result++;
	}
	return result;
}

/// $C48E6B
void recordAutoMovementDemoNFramesDirection(short direction, short frames) {
	for (short i = frames; i != 0; i--) {
		recordAutoMovementDemoFrame(directionToButtonMap[direction]);
	}
}

/// $C48E95
void finishAutoMovementDemoAndStart() {
	autoMovementDemoBuffer[++autoMovementDemoPosition].frames = 0;
	startAutoMovementDemo(&autoMovementDemoBuffer[0]);
}

/// $C48ECE
short isValidItemTransformation(short arg1) {
	if (loadedItemTransformations[arg1].transformationCountdown != 0) {
		return 1;
	}
	if (loadedItemTransformations[arg1].sfxFrequency != 0) {
		return 1;
	}
	return 0;
}

/// $C48EEB
void initializeItemTransformation(short arg1) {
	if (isValidItemTransformation(arg1) == 0) {
		unknown7E9F2C = 0x3C;
		unknown7E9F2A++;
	}
	loadedItemTransformations[arg1].sfx = timedItemTransformationTable[arg1].sfx;
	loadedItemTransformations[arg1].sfxFrequency = timedItemTransformationTable[arg1].sfxFrequency;
	loadedItemTransformations[arg1].sfxCountdown = cast(ubyte)(timedItemTransformationTable[arg1].sfxFrequency + randMod(2) - 1);
	loadedItemTransformations[arg1].transformationCountdown = timedItemTransformationTable[arg1].transformationTime;
}

/// $C48F98
void unknownC48F98(short arg1) {
	if (isValidItemTransformation(arg1) == 0) {
		return;
	}
	unknown7E9F2A--;
	loadedItemTransformations[arg1].sfxFrequency = 0;
	loadedItemTransformations[arg1].transformationCountdown = 0;
}

/// $C48FC4
void processItemTransformations() {
	if (battleSwirlFlag + battleSwirlCountdown != 0) {
		return;
	}
	if (disabledTransitions != 0) {
		return;
	}
	if (gameState.cameraMode == CameraMode.followEntity) {
		return;
	}
	if (--unknown7E9F2C != 0) {
		return;
	}
	unknown7E9F2C = 0x3C;
	LoadedItemTransformation* x02 = loadedItemTransformations.ptr;
	short x14 = 1;
	short x12 = 0;
	for (short i = 0; i < 4; i++) {
		if ((x14 != 0) && (x02.sfxFrequency != 0) && (x02.sfxCountdown-- == 0)) {
			x02.sfxCountdown = cast(ubyte)(x02.sfxFrequency + randMod(2) - 1);
			playSfx(x02.sfx);
			x14 = 0;
		}
		if (x02.transformationCountdown != 0) {
			if (x02.transformationCountdown-- == 0) {
				giveItemToCharacter(takeItemFromCharacter(0xFF, timedItemTransformationTable[i].item), timedItemTransformationTable[i].targetItem);
			}
		}
		x02++;
	}
}

/// $C490EE
short getDistanceToMagicTruffle() {
	short x04 = findEntityBySprite(OverworldSprite.magicTruffle);
	if (x04 == -1) {
		return 0;
	}
	if (entityAbsXTable[x04] < gameState.leaderX.integer - 0x40) {
		return 1;
	}
	if (entityAbsXTable[x04] == gameState.leaderX.integer + 0x40) {
		if (entityAbsYTable[x04] < gameState.leaderY.integer - 0x40) {
			return 1;
		}
		if (entityAbsYTable[x04] > gameState.leaderY.integer + 0x40) {
			return 1;
		}
	} else {
		return 1;
	}
	short x10 = cast(short)(entityAbsYTable[x04] - gameState.leaderY.integer);
	if (x10 < 0) {
		x10 = cast(short)-cast(int)x10;
	}
	short x12 = cast(short)(entityAbsXTable[x04] - gameState.leaderX.integer);
	if (x12 < 0) {
		x12 = cast(short)-cast(int)x12;
	}
	if (x10 + x12 < 16) {
		return 10;
	}
	return ((getScreenAngle(gameState.leaderX.integer, gameState.leaderY.integer, entityAbsXTable[x04], entityAbsYTable[x04]) + 0x1000) / 0x2000) + 2;
}


/// $C491EE
ushort getColourFadeSlope(ushort arg1, ushort arg2, short arg3) {
	return cast(ushort)(((arg2 - arg1) << 8) / arg3);
}

/// $C49208
void initializeMapPaletteFade(short arg1) {
	ushort* endColorPtr = &paletteAnimTargetPalette()[0];
	for (short i = 0; i < 0x60; i++) {
		ushort endColor = endColorPtr[0];
		ushort startColor = (&palettes[2][0])[i];
		paletteAnimRedSlope()[i] = getColourFadeSlope(startColor & 0x1F, endColor & 0x1F, arg1);
		paletteAnimGreenSlope()[i] = getColourFadeSlope((startColor & 0x3E0) >> 5, (endColor & 0x3E0) >> 5, arg1);
		paletteAnimBlueSlope()[i] = getColourFadeSlope((startColor & 0x7C00) >> 10, (endColor & 0x7C00) >> 10, arg1);

		paletteAnimRedAccum()[i] = ((startColor & 0x1F) << 8) & 0xFF00;
		paletteAnimGreenAccum()[i] = (startColor & 0x3E0) << 3;
		paletteAnimBlueAccum()[i] = (startColor & 0x7C00) >> 2;
		endColorPtr++;
	}
}

/// $C492D2
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
	preparePaletteUpload(PaletteUpload.halfFirst);
}

/// $C4939C
void changeMapPalette(ubyte tilesetNum, ubyte paletteNum, ubyte fadeDuration) {
	mapPaletteAnimationLoaded = 0;
	if (fadeDuration == 0) {
		memcpy(&palettes[2][0], &mapPalettePointerTable[tilesetNum][paletteNum * 0xC0], 0xC0);
	} else {
		memcpy(&paletteAnimTargetPalette()[0], &mapPalettePointerTable[tilesetNum][paletteNum * 0xC0], 0xC0);
		initializeMapPaletteFade(fadeDuration);
		for (short i = 0; i < fadeDuration; i++) {
			waitUntilNextFrame();
			stepMapPaletteFade();
		}
		memcpy(&palettes[2][0], &mapPalettePointerTable[tilesetNum][paletteNum * 0xC0], 0xC0);
		memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
		adjustSpritePalettesByAverage();
		loadSpecialSpritePalette();
		preparePaletteUpload(PaletteUpload.full);
		while (paletteUploadMode != PaletteUpload.none) { waitForInterrupt(); }
	}
}

/// $C49496
ushort unknownC49496(ushort colour, short arg2) {
	ushort red;
	ushort green;
	ushort blue;
	if (arg2 < 50) {
		red = cast(ushort)((colour & 0x1F) * arg2 * 5);
		green = cast(ushort)(((colour >> 5) & 0x1F) * arg2 * 5);
		blue = cast(ushort)(((colour >> 10) & 0x1F) * arg2 * 5);
		if (red > 0x1E45) {
			red = 0x1F00;
		}
		if (green > 0x1E45) {
			green = 0x1F00;
		}
		if (blue > 0x1E45) {
			blue = 0x1F00;
		}
	} else if (arg2 != 50) {
		red = 0x1F00;
		green = 0x1F00;
		blue = 0x1F00;
	}
	return cast(ushort)(((red >> 8) & 0xFF) | (((green >> 8) & 0xFF) << 5) | (((blue >> 8) & 0xFF) << 10));
}

/// $C4954C
void unknownC4954C(short style, ushort* arg2) {
	ushort* x06 = cast(ushort*)(&buffer[0]);
	for (short i = 0; i < 0x100; i++) {
		*(x06++) = unknownC49496(*(arg2++), style);
	}
}

/// $C4958E
void unknownC4958E(short arg1, short arg2, ushort* palette) {
	ushort* x06 = cast(ushort*)&buffer[0];
	// why clear 0x0200 - 0x1200? 0x0000-0x0700 is used here
	memset(&buffer[0x200], 0, 0x1000);
	for (ushort i = 0; i < 0x100; i += 16) {
		for (ushort j = i; i + 16 > j; j++) {
			ushort x02;
			if ((arg2 & 1) != 0) {
				x02 = x06[j];
			} else {
				x02 = palette[j];
				x06[j] = x02;
			}
			x06[0x100 + j] = getColourFadeSlope(palette[j] & 0x1F, x02 & 0x1F, arg1);
			x06[0x200 + j] = getColourFadeSlope((palette[j] & 0x3E0) >> 5, (x02 & 0x3E0) >> 5, arg1);
			x06[0x300 + j] = getColourFadeSlope((palette[j] & 0x7C00) >> 10, (x02 & 0x7C00) >> 10, arg1);
		}
		for (short j = i; j < i + 16; j++) {
			x06[0x400 + j] = (palette[j] & 0x1F) << 8;
			x06[0x500 + j] = (palette[j] & 0x3E0) << 3;
			x06[0x600 + j] = (palette[j] & 0x7C00) >> 2;
		}
		arg2 >>= 1;
	}
}

/// $C496E7
void unknownC496E7(short arg1, short arg2) {
	unknownC4958E(arg1, arg2, &palettes[0][0]);
}

/// $C496F9
void unknownC496F9() {
	memcpy(&buffer[0], &palettes[0][0], 0x200);
}

/// $C49740
void unknownC49740() {
	memcpy(palettes.ptr, buffer.ptr, 0x200);
	preparePaletteUpload(PaletteUpload.full);
}

/// $C4978E
void unknownC4978E() {
	memcpy(&mapPaletteBackup[0][0], &palettes[0][0], 0x200);
}

/// $C497C0
void unknownC497C0(short arg1, short arg2, short arg3) {
	unknownC4954C(arg2, &mapPaletteBackup[0][0]);
	unknownC496E7(arg1, arg2);
	if (arg1 != 1) {
		for (short i = 0; i < arg1; i++) {
			updateMapPaletteAnimation();
			waitUntilNextFrame();
		}
	}
	unknownC49740();
	preparePaletteUpload(PaletteUpload.full);
}

/// $C4981F
void unknownC4981F() {
	copyToVRAM(3, 0x800, 0x7C00, &blankTiles[0]);
}

/// $C49841
void unknownC49841() {
	unknownC2EA15(1);
}

/// $C4984B
void unknownC4984B() {
	ushort* x0E = cast(ushort*)&vwfBuffer[0][0];
	for (short i = 0x340; i != 0; i--) {
		x0E[0] ^= 0xFFFF;
		x0E++;
	}
}

/// $C49875
void unknownC49875(ubyte arg1, ushort width, ubyte* buf, const(ubyte)* fontData) {
	ubyte* x02 = &buf[unknown7E9F31];
	ubyte x14 = cast(ubyte)(unknown7E9F2F % 8);
	const(ubyte)* x06 = fontData;
	for (short i = 0; i < 2; i++) {
		for (short j = 0; j < 8; j++) {
			*(x02 + 1) &= ((x06[0] ^ 0xFF) >> x14) ^ 0xFF;
			*x02 = *(x02 + 1);
			x02 += 2;
			x06++;
		}
		x02 = &buf[unknown7E9F31 + 0x1A0];
	}
	unknown7E9F2F += arg1;
	if (unknown7E9F2F / 8 == unknown7E9F31) {
		return;
	}
	unknown7E9F31 = cast(ushort)((unknown7E9F2F / 8) * 16);
	x06 = fontData;
	x02 = &buf[unknown7E9F31];
	for (short i = 0; i < 2; i++) {
		for (short j = 0; j < 8; j++) {
			*(x02 + 1) &= ((x06[0] ^ 0xFF) << (8 - x14)) ^ 0xFF;
			*x02 = *(x02 + 1);
			x02 += 2;
			x06++;
		}
		x02 = &buf[unknown7E9F31 + 0x1A0];
	}
}

/// $C4999B
void unknownC4999B(ubyte arg1) {
	arg1 = (arg1 - 0x50) & 0x7F;
	const(ubyte)* x06 = &fontGraphics[fontConfigTable[Font.large].graphicsID][arg1 * fontConfigTable[Font.large].height];
	ubyte x02 = cast(ubyte)(fontData[fontConfigTable[Font.large].dataID][arg1] + 1);
	while (x02 > 8) {
		unknownC49875(8, fontConfigTable[Font.large].width, &vwfBuffer[0][0], x06);
		x02 -= 8;
		x06 += fontConfigTable[Font.large].width;
	}
	unknownC49875(x02, fontConfigTable[Font.large].width, &vwfBuffer[0][0], x06);
}

/// $C49A4B
void unknownC49A4B() {
	waitUntilNextFrame();
	drawBattleFrame();
}

/// $C49A56 - prepares flyover text graphics
void unknownC49A56() {
	prepareForImmediateDMA();
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	copyToVRAM(3, 0x3800, 0x6000, &buffer[0]);
	memcpy(&palettes[0][0], &movementTextStringPalette[0], 8);
	paletteUploadMode = PaletteUpload.full;
	memset(&vwfBuffer[0][0], 0xFF, 0x680);
	ushort y = 0x10;
	for (short i = 0; i < 0x20; i++) {
		bg2Buffer[i * 32] = 0;
		bg2Buffer[i * 32 + 1] = 0;
		bg2Buffer[i * 32 + 2] = 0;
		for (short j = 3; j < 0x1D; j++) {
			bg2Buffer[i * 32 + j] = cast(ushort)(0x2000 + y);
			y++;
		}
		bg2Buffer[i * 32 + 29] = 0;
		bg2Buffer[i * 32 + 30] = 0;
		bg2Buffer[i * 32 + 31] = 0;
	}
	copyToVRAM(0, 0x800, 0x7C00, cast(ubyte*)&bg2Buffer[0]);
	unknown7E3C18 = 0x1A;
	unknown7E3C1C = 0;
	unknown7E3C1E = -1;
	unknown7E3C20 = 0;
	unknown7E3C14 = 0;
	unknown7E3C16 = 0;
	unknown7E9F2F = 0;
	unknown7E9F31 = 0;
	setForceBlank();
}

/// $C49B6E
void unknownC49B6E(short arg1) {
	unknownC4984B();
	if (unknown7E9F2D * 0x1A0 + 0x4E0 > 0x3400) {
		if (0x3400 - unknown7E9F2D * 0x1A0 != 0) {
			copyToVRAM(0, cast(short)(0x3400 - unknown7E9F2D * 0x1A0), cast(ushort)(0xD0 * unknown7E9F2D + 0x6150), &vwfBuffer[0][0]);
		}
		if (unknown7E9F2D * 0x1A0 + 0x4E0 - 0x3400 != 0) {
			assert(0, "Not yet implemented");
			//copyToVRAM(0, unknown7E9F2D * 0x1A0 + 0x4E0 - 0x3400, 0x6150, 0x6892 - unknown7E9F2D * 0x1A0);
		}
	} else {
		copyToVRAM(0, 0x4E0, cast(ushort)(0xD0 * unknown7E9F2D + 0x6150), &vwfBuffer[0][0]);
	}
	unknown7E3C1E = -1;
	unknown7E3C20 = 0;
	waitUntilNextFrame();
}

/// $C49C56
void unknownC49C56(short arg1) {
	unknown7E3C16 += arg1;
	unknown7E3C14 = 0;
	unknown7E9F2D += unknown7E3C16 / 8 + 1;
	if (unknown7E9F2D >= 0x20) {
		unknown7E9F2D -= 0x20;
	}
	waitDMAFinished();
	memset(&vwfBuffer[0][0], 0xFF, 0x680);
	unknown7E3C16 &= 7;
	unknown7E9F2F = 0;
	unknown7E9F31 = 0;
}

/// $C49CA8
void unknownC49CA8(ubyte arg1) {
	unknown7E9F2F += arg1 + 8;
	unknown7E9F31 = cast(short)((unknown7E9F2F / 8) * 16);
}

/// $C49CC3
void unknownC49CC3(ubyte arg1, short arg2) {
	ubyte* x06 = &partyCharacters[arg1 - 1].name[0];
	for (short i = 0; (i < 5) && (x06[0] > 0x4F); i++) {
		unknownC4999B(*(x06++));
	}
}

/// $C49D16
// seems weird, but mother 2 did make use of the other args
void unknownC49D16(ubyte arg1, short, short) {
	unknownC4999B(arg1);
}

/// $C49D1E
short unknownC49D1E(short arg1) {
	oamClear();
	ushort x02 = arg1 & 0xFF00;
	short x0E = cast(short)(arg1 + 0x40);
	arg1 = cast(short)((arg1 + 0x40) & 0xFF00);
	if (arg1 != x02) {
		bg3YPosition += (arg1 - x02) >> 8;
		updateScreen();
	}
	return x0E;
}

/// $C49D6A
void coffeeTeaScene(short id) {
	fadeOutWithMosaic(1, 1, 0);
	unknownC49A56();
	oamClear();
	loadBackgroundAnimation((id == 0) ? BattleBGLayer.coffee1 : BattleBGLayer.tea1, (id == 0) ? BattleBGLayer.coffee2 : BattleBGLayer.tea2);
	fadeIn(1, 1);
	unknown7E9F2D = 0x1C;
	short x04 = 0;
	const(ubyte)* x06 = (id == 0) ? &coffeeSequenceText[0] : &teaSequenceText[0];
	unknown7E5E6E = 0;
	parseLoop: while (true) {
		switch ((x06++)[0]) {
			case 0:
				break parseLoop;
			case 9:
				short x0E = unknownC49D1E(x04);
				unknownC49B6E(0x18);
				drawBattleFrame();
				while (x0E < 0x2000) {
					x0E = unknownC49D1E(x0E);
					unknownC49A4B();
				}
				x04 = cast(short)(x0E - 0x2000);
				unknownC49C56(0x18);
				break;
			case 1:
				unknownC49CA8(*(x06++));
				break;
			case 8:
				unknownC49CC3(*(x06++), 0xC);
				break;
			default:
				unknownC49D16(*(x06 - 1), 0, 0xC);
				break;
		}
	}
	fadeOut(1, 1);
	while (fadeParameters.step != 0) {
		unknownC49A4B();
	}
	prepareForImmediateDMA();
	reloadMap();
	ushort* y = &bg2Buffer[0];
	for (short i = 0x380; i != 0; i--) {
		*(y++) = 0;
	}
	unknown7E5E6E = 0xFF;
	prepareForImmediateDMA();
	undrawFlyoverText();
	setForceBlank();
	fadeIn(1, 1);
}

/// $C49EA4
@([ROMSource(0x210B86, 22), ROMSource(0x210B9C, 38), ROMSource(0x210BC2, 16), ROMSource(0x210BD2, 43), ROMSource(0x210BFD, 30), ROMSource(0x210C1B, 29), ROMSource(0x210C38, 41), ROMSource(0x210C61, 25)])
immutable(ubyte[])[] flyoverTextPointers;

/// $C49EC4
void runFlyover(short id) {
	ushort x02 = entityCallbackFlags[partyLeaderEntity];
	entityCallbackFlags[partyLeaderEntity] |= 0xC000;
	unknownC49A56();
	immutable(ubyte)* x06 = &flyoverTextPointers[id][0];
	unknown7E5E6E = 0;
	while (true) {
		switch(*(x06++)) {
			case 0:
				mirrorTM = TMTD.bg3;
				fadeInWithMosaic(1, 3, 0);
				for (short i = 0; i < 0xB4; i++) {
					waitUntilNextFrame();
				}
				fadeOutWithMosaic(1, 3, 0);
				mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
				ushort* buf = bg2Buffer.ptr;
				for (short i = 0x380; i != 0; i--) {
					*(buf++) = 0;
				}
				unknown7E5E6E = 0xFF;
				prepareForImmediateDMA();
				undrawFlyoverText();
				entityCallbackFlags[partyLeaderEntity] = x02;
				setForceBlank();
				return;
			case 2:
				unknown7E9F2D = *(x06++);
				break;
			case 9:
				unknownC49B6E(0x18);
				waitUntilNextFrame();
				unknownC49C56(0x18);
				break;
			case 1:
				unknownC49CA8(*(x06++));
				break;
			case 8:
				unknownC49CC3(*(x06++), 0xC);
				break;
			default:
				unknownC49D16(*(x06 - 1), 0, 0xC);
				break;
		}
	}
}

/// $C49FE1
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

immutable ubyte[12] battleMenuTextDoNothing = ebString!12("Do Nothing");

/// $C4A08D
immutable ushort[33] deadTargettableActions = [
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
	0,
];

/// $C4A0CF
short autoHealing(short arg1, short arg2) {
	short x12 = 9999;
	short x04 = 0;
	for (short i = 0; i < 6; i++) {
		if ((gameState.partyMembers[i] < 1) || (gameState.partyMembers[i] > 4)) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].isAutoHealed != 0) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].afflictions[arg1] != arg2) {
			continue;
		}
		if (partyCharacters[gameState.partyMembers[i]].hp.target >= x12) {
			continue;
		}
		x12 = partyCharacters[gameState.partyMembers[i]].hp.target;
		x04 = gameState.partyMembers[i];
	}
	if (x04 != 0) {
		partyCharacters[x04 - 1].isAutoHealed = 1;
	}
	return x04;
}

/// $C4A15D
short autoLifeup() {
	short x14 = 9999;
	short x04 = 0;
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
		if (partyCharacters[gameState.partyMembers[i]].hp.target >= x14) {
			continue;
		}
		x14 = partyCharacters[gameState.partyMembers[i]].hp.target;
		x04 = gameState.partyMembers[i];
	}
	if (x04 != 0) {
		partyCharacters[x04 - 1].isAutoHealed = 1;
	}
	return x04;
}

/// $C4A1F2
immutable ubyte[3] battleWindows = [ Window.battleMenuJeff, Window.battleMenu, Window.unknown30 ];

/// $C4A1F5
short checkIfValidTarget(short arg1) {
	if ((battlersTable[arg1].consciousness != 0) &&
		(battlersTable[arg1].npcID == 0) &&
		(battlersTable[arg1].afflictions[0] != Status0.unconscious) &&
		(battlersTable[arg1].afflictions[0] != Status0.diamondized)) {
		return 1;
	}
	return 0;
}

/// $C4A228
void targetEnemyByBattlerIndex(Battler* battler, short arg2) {
	for (short i = 0; i < numBattlersInFrontRow; i++) {
		if (frontRowBattlers[i] != arg2) {
			continue;
		}
		battler.currentTarget = cast(ubyte)(i + 1);
		return;
	}
	for (short i = 0; i < numBattlersInBackRow; i++) {
		if (backRowBattlers[i] != arg2) {
			continue;
		}
		battler.currentTarget = cast(ubyte)(i + numBattlersInFrontRow + 1);
		return;
	}
}

/// $C4A228
immutable uint[32] powersOfTwo32Bit = [
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

/// $C4A331
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

/// $C4A35D
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

/// $C4A377
void unknownC4A377() {
	setBGMODE(BGMode.mode3);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x7800, 0);
	setBG2VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	decomp(&battleBGGraphicsPointers[animatedBackgrounds[BattleBGLayer.introGiygas].graphics][0], &buffer[0]);
	copyToVRAM(0, 0x2000, 0x6000, &buffer[0]);
	decomp(&battleBGArrangementPointers[animatedBackgrounds[BattleBGLayer.introGiygas].graphics][0], &buffer[0]);
	for (short i = 0; i < 0x800; i += 2) {
		buffer[i + 1] = (buffer[i + 1] & 0xDF) | 8;
	}
	copyToVRAM(0, 0x800, 0x7C00, &buffer[0]);
	loadBackgroundAnimationInfo(&loadedBGDataLayer1, &animatedBackgrounds[BattleBGLayer.introGiygas]);
	loadedBGDataLayer1.palettePointer = &palettes[2];
	memcpy(&loadedBGDataLayer1.palette[0], &battleBGPalettePointers[animatedBackgrounds[BattleBGLayer.introGiygas].palette][0], 0x20);
	memcpy(&loadedBGDataLayer1.palette2[0], &battleBGPalettePointers[animatedBackgrounds[BattleBGLayer.introGiygas].palette][0], 0x20);
	memcpy(&loadedBGDataLayer1.palettePointer[0], &loadedBGDataLayer1.palette[0], 0x20);
	loadedBGDataLayer1.targetLayer = 2;
	generateBattleBGFrame(&loadedBGDataLayer1, 0);
	loadedBGDataLayer2.targetLayer = 0;
}

/// $C4A591
immutable byte[61] unknownC4A591 = [
	0, 14, 23, 23, 12, -5, -18, -16, 0, 15, 12, -6, -14, 0, 13, 2, -11, 0, 10, -4, -7, 8, 0, -6, 7, -2, -3, 6, -5, 3, 0, -2, 3, -4, 4, -4, 4, -3, 3, -3, 3, -2, 2, -1, 0, 1, -2, 2, -1, -1, 2, -1, 0, 1, -1, -1, 1, 0, -1, 0, 1
];

/// $C4A5CE
immutable AttractModeParameters[2] unknownC4A5CE = [
	AttractModeParameters(0x3D, 0x00, 0x0080, 0x0070, 0x0000, 0x0000, 0x0000, 0x0000, 0x00E0, 0x00B7, 0x0004, 0x0003),
	AttractModeParameters(0),
];

/// $C4A5FA
immutable AttractModeParameters[2] unknownC4A5FA = [
	AttractModeParameters(0x64, 0x00, 0x0080, 0x0070, 0x0000, 0x0000, 0x0000, 0x0000, 0x00E0, 0x00B7, 0x0004, 0x0003),
	AttractModeParameters(0),
];

/// $C4A626
immutable AttractModeParameters[2] unknownC4A626 = [
	AttractModeParameters(0x3D, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
	AttractModeParameters(0),
];

/// $C4A652
immutable AttractModeParameters[2] unknownC4A652 = [
	AttractModeParameters(0x64, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
	AttractModeParameters(0),
];

/// $C4A67E
void startSwirl(short arg1, short arg2) {
	tracef("Loading swirl %s", arg1);
	if ((arg2 & AnimationFlags.invert) != 0) {
		swirlInvertEnabled = 1;
	} else {
		swirlInvertEnabled = 0;
	}
	if ((arg2 & AnimationFlags.reverse) != 0) {
		swirlReversed = 1;
	} else {
		swirlReversed = 0;
	}
	if ((arg2 & AnimationFlags.unknown2) != 0) {
		swirlMaskSettings = SwirlMask.mathMode;
	} else {
		swirlMaskSettings = SwirlMask.bg1 | SwirlMask.bg2 | SwirlMask.bg3 | SwirlMask.bg4 | SwirlMask.obj; // on/off mask
	}
	unknown7EAEC2 = 1;
	framesUntilNextSwirlFrame = swirlPrimaryTable[arg1].timeBetweenFrames;
	swirlFramesLeft = swirlPrimaryTable[arg1].swirlFrames;
	swirlHDMATableID = swirlPrimaryTable[arg1].startingHDMATableID;
	if (swirlReversed != 0) {
		swirlHDMATableID += swirlFramesLeft;
	}
	loadedComputedSwirl = null;
	if (arg1 == 0) {
		loadedComputedSwirl = &unknownC4A5CE[0];
	}
	unknown7EAEC9 = 0;
	unknown7EAECA = 0;
	unknown7EAECB = 1;
	if ((arg2 & AnimationFlags.repeat) != 0) {
		unknown7EAEE4 = cast(ubyte)arg1;
		framesUntilNextSwirlFrame = 4;
		unknown7EAEE5 = 0;
		unknown7EAEE6 = 6;
	} else {
		unknown7EAEE4 = 0;
	}
	unknownC0B0AA();
}

/// $C4A7B0
void unknownC4A7B0() {
	if (unknown7EAEC2 == 0) {
		return;
	}
	if (loadedComputedSwirl != null) {
		if (--unknown7EAEC2 == 0) {
			if (loadedComputedSwirl.unknown0 == 0) {
				loadedComputedSwirl = null;
				return;
			}
			if (loadedComputedSwirl.unknown2 != 0x8000) {
				unknown7EAED0 = loadedComputedSwirl.unknown2;
			}
			if (loadedComputedSwirl.unknown4 != 0x8000) {
				unknown7EAED2 = loadedComputedSwirl.unknown4;
			}
			if (loadedComputedSwirl.unknown6 != 0x8000) {
				unknown7EAED4 = loadedComputedSwirl.unknown6;
			}
			if (loadedComputedSwirl.unknown8 != 0x8000) {
				unknown7EAED6 = loadedComputedSwirl.unknown8;
			}
			unknown7EAED8 = loadedComputedSwirl.unknown10;
			unknown7EAEDA = loadedComputedSwirl.unknown12;
			unknown7EAEDC = loadedComputedSwirl.unknown14;
			unknown7EAEDE = loadedComputedSwirl.unknown16;
			unknown7EAEE0 = loadedComputedSwirl.unknown18;
			unknown7EAEE2 = loadedComputedSwirl.unknown20;
			loadedComputedSwirl++;
		}
		unknown7EAED0 += unknown7EAED8;
		unknown7EAED2 += unknown7EAEDA;
		unknown7EAEDC += unknown7EAEE0;
		unknown7EAEDE += unknown7EAEE2;
		if ((0 > unknown7EAEDC) && (unknown7EAED4 < -cast(int)unknown7EAEDC)) {
			unknown7EAED4 = 0;
		} else {
			unknown7EAED4 += unknown7EAEDC;
		}
		if ((0 > unknown7EAEDE) && (unknown7EAED6 < -cast(int)unknown7EAEDE)) {
			unknown7EAED6 = 0;
		} else {
			unknown7EAED6 += unknown7EAEDE;
		}
		if ((unknown7EAED4 == 0) && (unknown7EAED6 == 0)) {
			unknown7EAEC2 = 0;
			loadedComputedSwirl = null;
		}
		generateAttractModeWindowHDMATable(unknown7EAED0, unknown7EAED2, (unknown7EAED4 >> 8) & 0xFF, (unknown7EAED6 >> 8) & 0xFF);
		enableAttractModeWindowHDMA(3, 0x41);
		setWindowMask(swirlMaskSettings, (swirlInvertEnabled >> 8) & 0xFF);
		return;
	}

	if (--unknown7EAEC2 != 0) {
		return;
	}
	while (true) { //pretty weird but I'm not sure how else to express this mass of branches
		if (swirlFramesLeft != 0) {
			unknown7EAEC2 = framesUntilNextSwirlFrame;
			unknownC0AE34(unknown7EAEC9 + 3);
			unknown7EAEC9++;
			unknown7EAEC9 &= 1;
			if (swirlReversed == 0) {
				unknownC0B0B8(unknown7EAEC9 + 3, &swirlPointerTable[swirlHDMATableID++][0]);
			} else {
				unknownC0B0B8(unknown7EAEC9 + 3, &swirlPointerTable[--swirlHDMATableID][0]);
			}
			setWindowMask(swirlMaskSettings, swirlInvertEnabled);
			swirlFramesLeft--;
			return;
		}
		if (unknown7EAEE4 != 0) {
			if (--unknown7EAEE6 != 0) {
				swirlFramesLeft = swirlPrimaryTable[unknown7EAEE4].swirlFrames;
				unknown7EAEE6 = swirlPrimaryTable[unknown7EAEE4].startingHDMATableID;
				if (swirlReversed == 0) {
					continue;
				}
				unknown7EAEE6 += swirlFramesLeft;
				continue;
			}
			switch (++unknown7EAEE5) {
				case 1:
					unknown7EAEE6 = 7;
					framesUntilNextSwirlFrame = 3;
					break;
				case 2:
					unknown7EAEE6 = 6;
					framesUntilNextSwirlFrame = 2;
					break;
				case 3:
					unknown7EAEE6 = 12;
					framesUntilNextSwirlFrame = 1;
					break;
				default: break;
			}
			if (unknown7EAEE6 != 0) {
				continue;
			}
		}
		if (unknown7EAECA != 0) {
			unknown7EAEC2 = 1;
			unknown7EAECA--;
			return;
		}
		break;
	}
	if (unknown7EAECB == 0) {
		return;
	}
	unknownC0AE34(unknown7EAEC9 + 3);
	setWindowMask(0, 0);
	unknownC2DE96();
	setColData(0, 0, 0);
	setLayerConfig(currentLayerConfig);
}

/// $C4AC57
immutable ubyte[][9] soundStoneOrbitSpriteDistances = [
	[ 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 ],
	[ 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 ],
	[ 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 ],
	[ 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 ],
	[ 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 ],
	[ 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x1E, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x1E, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 ],
	[ 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x23, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 ],
	[ 0x37, 0x32, 0x2D, 0x28, 0x23, 0x1E, 0x19, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x19, 0x1E, 0x23, 0x28, 0x2D, 0x32, 0x37, 0x3C, 0x41, 0x46, 0x4B, 0x50, 0x55, 0x5A, 0x5F, 0x64, 0x69, 0x6E, 0x73, 0x78, 0x7D, 0x82, 0x87, 0x8C, 0x91, 0x96, 0x9B, 0xA0, 0xA5, 0xAA, 0xAF, 0xB4, 0xB9, 0xBE, 0xC3, 0xC8, 0xCD, 0xD2, 0xD7, 0xDC, 0xE1, 0xE6, 0xEB, 0xF0, 0xF5, 0xFA, 0xFF, 0x04, 0x09, 0x0E, 0x13, 0x18, 0x1D ],
	[ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 ],
];

/// $C4AC7B
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

/// $C4AC83
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

/// $C4AC8B
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

/// $C4AC93
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

/// $C4AC9B
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

/// $C4ACA3
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

/// $C4ACAB
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

/// $C4ACB4
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

/// $C4AC83
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

/// $C4ACCE
void useSoundStone(short arg1) {
	//x34 = arg1
	prepareForImmediateDMA();
	stopMusic();
	loadEnemyBattleSprites();
	decomp(&soundStoneGraphics[0], &buffer[0]);
	copyToVRAM(0, 0x2C00, 0x2000, &buffer[0]);
	memcpy(&palettes[8][0], &soundStonePalette[0], 0xC0);
	loadTextPalette();
	loadBattleBG(BackgroundLayer.soundStone1, BackgroundLayer.soundStone2, 4);
	memset(&soundStoneSpriteTilemap1, 0, SpriteMap.sizeof);
	memset(&soundStoneSpriteTilemap2, 0, SpriteMap.sizeof);
	soundStoneSpriteTilemap1.xOffset = 0xF0;
	soundStoneSpriteTilemap1.yOffset = 0xF0;
	soundStoneSpriteTilemap2.xOffset = 0xF8;
	soundStoneSpriteTilemap2.yOffset = 0xF8;
	soundStoneSpriteTilemap1.specialFlags = 0x81;
	soundStoneSpriteTilemap2.specialFlags = 0x80;
	short x32 = 0;
	for (short i = 0; i < 8; i++) {
		if (getEventFlag(soundStoneMelodyFlags[i]) != 0) {
			soundStonePlaybackState[i].playbackState = SoundStonePlaybackState.present;
			x32++;
		} else {
			soundStonePlaybackState[i].playbackState = SoundStonePlaybackState.notPresent;
		}
		soundStonePlaybackState[i].unknown2 = 1;
		soundStonePlaybackState[i].soundStoneOrbitSpriteFrame = 0;
	}
	setForceBlank();
	fadeIn(1, 1);
	short x2E = 0xF;
	short x30 = 0;
	short x2C = 60;
	short x2A = 0;
	short x28 = 0;
	//short x04 = 0;
	short melodyFramesLeft = 0;
	//short x02 = 0;
	ushort x24 = 0;
	while (true) {
		waitUntilNextFrame();
		short x22 = padPress[0];
		if ((melodyFramesLeft == 0) && (--x2C == 0)) {
			x24 = 0xFFFF;
			x28 = -1;
			melodyFramesLeft = 1;
		}
		if (x2A != 0) {
			if (--x2A == 0) {
				break;
			}
		} else if (melodyFramesLeft != 0){
			if (--melodyFramesLeft == 0) {
				if (x24 < 8) {
					if (soundStonePlaybackState[x24].playbackState == SoundStonePlaybackState.nowPlaying) {
						soundStonePlaybackState[x24].playbackState = SoundStonePlaybackState.present;
					}
				} else if (x24 == 8) {
					short x20;
					for (x20 = cast(short)(x28 + 1); x20 < 8; x20++) {
						if (soundStonePlaybackState[x20].playbackState != SoundStonePlaybackState.notPresent) {
							break;
						}
					}
					if (x20 == 8) {
						x2A = 150;
					}
				}
				if (++x28 < 8) {
					x24 = x28;
					if (soundStonePlaybackState[x24].playbackState != SoundStonePlaybackState.notPresent) {
						soundStonePlaybackState[x24].playbackState = SoundStonePlaybackState.nowPlaying;
					} else {
						x24 = 8;
					}
					melodyFramesLeft = soundStoneMelodyFrames[x24];
					changeMusic(soundStoneMusic[x24]);
				} else {
					x2A = 150;
				}
			}
			if (x24 < 8) {
				if (melodyFramesLeft == soundStoneMelodyFrames[x24] - 9) {
					musicEffect(cast(short)(x32 + 8));
				}
			}
		}
		oamClear();
		//setSpritemapBank(0x7E);
		for (short i = 0; i < 8; i++) {
			switch (soundStonePlaybackState[i].playbackState) {
				case SoundStonePlaybackState.present:
					soundStoneSpriteTilemap1.firstTile = soundStoneSanctuarySprites[i];
					soundStoneSpriteTilemap1.flags = 0x30;
					renderSpriteToOAM(&soundStoneSpriteTilemap1, soundStoneSanctuarySpriteX[i], soundStoneSanctuarySpriteY[i]);
					break;
				case SoundStonePlaybackState.nowPlaying:
					soundStonePlaybackState[i].soundStoneOrbitSpritePosition2 += 0xCCD;
					if (--soundStonePlaybackState[i].unknown2 == 0) {
						soundStonePlaybackState[i].unknown2 = 2;
						version(noUndefinedBehaviour) { // the last frame indexes out of bounds. we fix it by repeating the last frame instead
							if (soundStonePlaybackState[i].soundStoneOrbitSpriteFrame == soundStoneOrbitSpriteDistances[i].length) {
								soundStonePlaybackState[i].soundStoneOrbitSpriteFrame--;
							}
						}
						soundStonePlaybackState[i].soundStoneOrbitSpritePosition1 = soundStoneOrbitSpriteDistances[i][soundStonePlaybackState[i].soundStoneOrbitSpriteFrame++];
						soundStonePlaybackState[i].unknown4 = cast(short)(2 - soundStonePlaybackState[i].unknown4);
					}
					soundStoneSpriteTilemap2.firstTile = cast(ubyte)(soundStoneOrbitSprites[i] + soundStonePlaybackState[i].unknown4);
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
		if (--x2E == 0) {
			x2E = 15;
			x30 = (x30 + 1) & 3;
		}
		soundStoneSpriteTilemap2.firstTile = cast(ubyte)((x30 * 2) + 0x40);
		soundStoneSpriteTilemap2.flags = 0x3B;
		renderSpriteToOAM(&soundStoneSpriteTilemap2, 0x80, 0x70);
		updateScreen();
		generateBattleBGFrame(&loadedBGDataLayer1, 0);
		generateBattleBGFrame(&loadedBGDataLayer2, 1);
		if ((arg1 != 0) && ((x22 & (Pad.b | Pad.a | Pad.x)) != 0)) {
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

/// $C4B1B8
ushort unknownC4B1B8(ushort arg1, ushort arg2, ushort arg3) {
	if (arg3 == 0xFF) {
		return arg1;
	}
	copyToVRAM(0, spriteGroupingPointers[arg2].width * 2, arg1, &sprites[spriteGroupingPointers[arg2].sprites[arg3].id][0]);
	copyToVRAM(0, spriteGroupingPointers[arg2].width * 2, cast(ushort)(arg1 + 0x100), &sprites[spriteGroupingPointers[arg2].sprites[arg3].id][spriteGroupingPointers[arg2].width]);
	return cast(ushort)(arg1 + spriteGroupingPointers[arg2].width);
}

/// $C4B26B
void loadOverlaySprites() {
	ushort x12 = 0x5600;
	for (short i = 0; i < entityOverlayCount; i++) {
		short x10 = unknownC4B1B8(x12, entityOverlaySprites[i].spriteID, entityOverlaySprites[i].unknown2);
		x12 = unknownC4B1B8(x10, entityOverlaySprites[i].spriteID, entityOverlaySprites[i].unknown3);
	}
	for (short i = 0; i < maxEntities; i++) {
		entityMushroomizedOverlayPtrs[i] = &entityOverlayMushroomized[0];
		entitySweatingOverlayPtrs[i] = &entityOverlaySweating[0];
		entityRippleOverlayPtrs[i] = &entityOverlayRipple[0];
		entityBigRippleOverlayPtrs[i] = &entityOverlayBigRipple[0];
	}
}

/// $C4B329
void unknownC4B329(short arg1, short arg2) {
	switch (arg1) {
		case 1:
			unknown7EB3FA -= unknownC42A41[arg2] + 8;
			goto case;
		case 4:
			unknown7EB3F8 -= unknownC42A1F[arg2] - 8;
			break;
		case 2:
			unknown7EB3FA -= unknownC42A41[arg2] - 8;
			goto case;
		case 5: break;
		case 3:
			unknown7EB3FA -= unknownC42A41[arg2] + 8;
			goto case;
		case 6:
			unknown7EB3F8 -= unknownC42A1F[arg2] + 8;
			break;
		default: break;
	}
}

/// $C4B3D0
void spawnFloatingSprite(short arg1, short arg2) {
	if (arg1 == -1) {
		return;
	}
	if (entityScriptTable[arg1] == -1) {
		return;
	}
	unknown7EB3F8 = entityAbsXTable[arg1];
	unknown7EB3FA = entityAbsYTable[arg1];
	unknownC4B329(floatingSpriteTable[arg2].unknown2, entitySizes[arg1]);
	unknown7EB3F8 += floatingSpriteTable[arg2].unknown3 | (((floatingSpriteTable[arg2].unknown3 & 0x80) != 0) ? -256 : 0);
	unknown7EB3FA += floatingSpriteTable[arg2].unknown4 | (((floatingSpriteTable[arg2].unknown4 & 0x80) != 0) ? -256 : 0);
	short x12 = createEntity(floatingSpriteTable[arg2].sprite, ActionScript.unknown785, -1, unknown7EB3F8, unknown7EB3FA);
	entityDrawPriority[x12] = cast(ushort)(arg1 | DrawPriority.parent | DrawPriority.dontClearIfParent);
	entitySurfaceFlags[x12] = entitySurfaceFlags[arg1];
}

/// $C4B4BE
void unknownC4B4BE(short arg1) {
	if (arg1 == -1) {
		return;
	}
	for (short i = 0; i < maxEntities; i++) {
		if (entityDrawPriority[i] == (arg1 | DrawPriority.parent | DrawPriority.dontClearIfParent)) {
			entityDrawPriority[i] = 0;
			unknownC02140(i);
		}
	}
}

/// $C4B4FE
void unknownC4B4FE(short arg1, short arg2) {
	spawnFloatingSprite(findEntityByPartyMemberID(arg1), arg2);
}

/// $C4B524
void unknownC4B524(short arg1, short arg2) {
	spawnFloatingSprite(findEntityByTPT(arg1), arg2);
}

/// $C4B519
void unknownC4B519(short arg1) {
	unknownC4B4BE(findEntityByPartyMemberID(arg1));
}

/// $C4B53F
void unknownC4B53F(short arg1) {
	unknownC4B4BE(findEntityByTPT(arg1));
}

/// $C4B54A
void unknownC4B54A(short arg1, short arg2) {
	spawnFloatingSprite(findEntityBySprite(arg1), arg2);
}

/// $C4B565
void unknownC4B565(short arg1) {
	unknownC4B4BE(findEntityBySprite(arg1));
}

/// $C4B587
void* pathSbrk(size_t inc) {
	void *ptr = pathHeapCurrent;
	pathHeapCurrent = cast(byte*)pathHeapCurrent + inc;
	return ptr;
}

/// $C4B595
ushort pathGetHeapSize() {
	return cast(ushort)(cast(byte*)pathHeapCurrent - cast(byte*)pathHeapStart);
}

/++
$C4B59F- Finds a path from pathers to targets
Returns: unknown

Params:
	heap_size = Size of the heap used for allocation of various temporary arrays/structs
	heap_start = Pointer to the start of the heap
	matrix_dim = Pointer to a VecYX struct containing the pathfinding matrix dimensions
	matrix = FAR pointer to the pathfinding matrix
	border_size = Size of the border used for the start positions of deliverymen
	targetCount = Amount of VecYX elements in the `targetsPos` array
	targetsPos = Array of VecYX containing the positions of the targets
	patherCount = Amount of Pather elements in the `pathers` array
	pathers = Array of Pather for the pathfinding objects
	unk1 = Unknown (-1 as called from $C0BA35)
	unk2 = Unknown, always 0xFC
	search_radius = Just a guess...
++/
ushort pathMain(ushort heap_size, void *heap_start, VecYX *matrix_dim, ubyte *matrix, ushort border_size, ushort targetCount, VecYX* targetsPos, ushort patherCount, Pather* pathers, short unk1, ushort unk2, ushort search_radius) {
	debug(pathing) {
		import std.stdio;
		writeln(heap_size, ", ", *matrix_dim, ", ", border_size, ", ", targetCount, ", ", *targetsPos, ", ", patherCount, ", ", *pathers, ", ", unk1, ", ", unk2, ", ", search_radius);
	}
	ushort dp20 = 0;

	pathHeapStart = heap_start;
	pathHeapCurrent = heap_start;
	pathHeapEnd = cast(byte*)heap_start + heap_size;

	pathMatrixRows = matrix_dim.y;
	pathMatrixCols = matrix_dim.x;
	pathMatrixBorder = border_size;
	pathMatrixSize = cast(ushort)(pathMatrixRows * pathMatrixCols);
	pathMatrixBuffer = matrix;

	ushort *ptr = cast(ushort*)pathSbrk(search_radius*ushort.sizeof + ushort.sizeof); // dp1E
	pathB408 = ptr;
	pathB40A = ptr + search_radius * ushort.sizeof;
	pathB40C = ptr;
	pathB40E = ptr;

	pathCardinalOffset[0] = cast(short)-pathMatrixCols; // NORTH
	pathCardinalOffset[1] = 1; // EAST
	pathCardinalOffset[2] = pathMatrixCols; // SOUTH
	pathCardinalOffset[3] = -1; // WEST

	// NORTH
	pathCardinalIndex[0].y = -1;
	pathCardinalIndex[0].x = 0;
	// EAST
	pathCardinalIndex[1].y = 0;
	pathCardinalIndex[1].x = 1;
	// SOUTH
	pathCardinalIndex[2].y = 1;
	pathCardinalIndex[2].x = 0;
	// WEST
	pathCardinalIndex[3].y = 0;
	pathCardinalIndex[3].x = -1;

	// NORTHEAST
	pathDiagonalIndex[0].y = -1;
	pathDiagonalIndex[0].x = 1;
	// SOUTHEAST
	pathDiagonalIndex[1].y = 1;
	pathDiagonalIndex[1].x = 1;
	// SOUTHWEST
	pathDiagonalIndex[2].y = 1;
	pathDiagonalIndex[2].x = -1;
	// NORTHWEST
	pathDiagonalIndex[3].y = -1;
	pathDiagonalIndex[3].x = -1;

	if (unk2 >= PathfindingTile.unknownFB) {
		unk2 = PathfindingTile.unknownFB;
	}

	Pather **dp1C = cast(Pather**)pathSbrk(patherCount * (Pather*).sizeof);
	pathC4B859(patherCount, pathers, dp1C);

	VecYX **dp2A = cast(VecYX**)pathSbrk(unk2 * (VecYX*).sizeof); // Allocate space on heap for pathfinding tile positions
	pathInitMatrix();

	ushort dp1A = 0;
	ushort dp18 = 0;
	ushort dp04;
	for (dp04 = 0; dp04 < patherCount; dp04++) {
		ushort dp1E;

		Pather *dp02 = dp1C[dp04];
		Pather *dp32 = dp02;

		if (dp02.hitbox.y != dp1A || dp02.hitbox.x != dp18) {
			ushort dp16 = 1;
			dp1A = dp02.hitbox.y;
			dp18 = dp02.hitbox.x;

			for (dp1E = cast(short)(dp04 + 1); dp1E < patherCount; dp1E++) {
				// X REGISTER = &dp1C[dp1E]

				if (dp1C[dp1E].hitbox.y != dp1A) break;
				if (dp1C[dp1E].hitbox.x != dp18) break;

				dp16++;
			}

			pathC4B923(dp16, &dp1C[dp04]);
			pathC4BAF6(targetCount, targetsPos, dp02, dp16, unk2, unk1);
		}

		dp02.pointCount = pathC4BD9A(&dp02.origin, unk2, dp2A);
		ushort dp14 = pathC4BF7F(cast(ushort)dp02.pointCount, dp2A);

		VecYX *dp22 = cast(VecYX*)pathSbrk(dp14 * VecYX.sizeof);

		for (dp1E = 0; dp1E < dp14; ++dp1E) {
			dp22[dp1E].y = dp2A[dp1E].y;
			dp22[dp1E].x = dp2A[dp1E].x;
		}

		dp02 = dp32;
		dp02.field0A = dp14;
		dp02.points = dp22;

		if (dp14) {
			++dp20;
		}
	}
	debug(pathing) printPathMatrix();

	return dp20;
}

/// $C4B7A5 - Initializes the border around the pathfind matrix to PathfindingTile.unwalkable
void pathInitMatrix() {
	int i;
	for (i = 0; i < pathMatrixRows; ++i) {
		pathMatrixBuffer[pathMatrixCols * i + pathMatrixCols - 1] = PathfindingTile.unwalkable;
		pathMatrixBuffer[pathMatrixCols  * i] = PathfindingTile.unwalkable;
	}

	for (i = 0; i < pathMatrixCols; ++i) {
		pathMatrixBuffer[(pathMatrixRows - 1) * pathMatrixCols + i] = PathfindingTile.unwalkable;
		pathMatrixBuffer[i] = PathfindingTile.unwalkable;
	}
}

/// $C4B859
void pathC4B859(ushort patherCount, Pather *pathers, Pather **pather_table) {
	ushort dp1A = cast(ushort)(patherCount - 1);

	// Scope for dp18 where it's seen as an ushort
	{
		ushort dp18;
		for (dp18 = 0; dp18 < patherCount; dp18++) {
			// Y REGISTER = dp18 * sizeof(pather_table)
			// dp02 = dp18 * sizeof(Pather)

			pather_table[dp18] = &pathers[dp18];
		}
	}

	if (patherCount <= 1) return;

	ushort dp04;
	for (dp04 = 0; dp04 < dp1A; ++dp04) {
		ushort dp16 = 0xFFFF;
		ushort dp14 = 0xFFFF;
		ushort dp0E;

		ushort dp12;
		for (dp12 = dp04; dp12 < patherCount; dp12++) { // Y REGISTER
			ushort dp10 = pather_table[dp12].hitbox.y;
			ushort dp02 = pather_table[dp12].hitbox.x;

			int tmp; // X REGISTER
			if (dp10 != dp16) {
				tmp = (dp10 < dp16);
			} else {
				tmp = (dp02 < dp14);
			}

			// Should be always true for the first iteration
			if (tmp) {
				dp16 = dp10;
				dp14 = dp02;
				dp0E = dp12;
			}
		}

		Pather *dp18 = pather_table[dp04];
		pather_table[dp04] = pather_table[dp0E];
		pather_table[dp0E] = dp18;
	}
}

/// $C4B923 - Finds possible start points?
void pathC4B923(ushort count, Pather **pathers) {
	ushort dp14;
	for (dp14 = 0; dp14 < pathMatrixSize; dp14++) {
		if (pathMatrixBuffer[dp14] != PathfindingTile.unwalkable) {
			pathMatrixBuffer[dp14] = PathfindingTile.maybeStart;
		}
	}

	ushort dp12; // also dp02
	for (dp12 = 0; dp12 < count; dp12++) {
		Pather *dp10 = pathers[dp12]; // also Y REGISTER

		if (dp10.fromOffscreen == 0) {
			// Starting point is the same as current position
			if (pathMatrixBuffer[(pathMatrixCols * dp10.origin.y) + dp10.origin.x] != PathfindingTile.unwalkable) {
				pathMatrixBuffer[(pathMatrixCols * dp10.origin.y) + dp10.origin.x] = PathfindingTile.start;
			}
		} else {
			// Starting from offscreen
			ushort dp0E;
			ushort i; // X REGISTER
			for (dp0E = 0; dp0E < pathMatrixBorder; dp0E++) {
				for (i = 0; i < pathMatrixCols; ++i) {
					if (pathMatrixBuffer[(dp0E * pathMatrixCols) + i] != PathfindingTile.unwalkable) {
						pathMatrixBuffer[(dp0E * pathMatrixCols) + i] = PathfindingTile.start;
					}
				}
			}

			for (dp0E = cast(ushort)(pathMatrixRows - pathMatrixBorder); dp0E < pathMatrixRows; dp0E++) {
				for (i = 0; i < pathMatrixCols; ++i) {
					if (pathMatrixBuffer[(dp0E * pathMatrixCols) + i] != PathfindingTile.unwalkable) {
						pathMatrixBuffer[(dp0E * pathMatrixCols) + i] = PathfindingTile.start;
					}
				}
			}

			for (i = 0; i < pathMatrixBorder; ++i) {
				for (dp14 = 0; dp14 < pathMatrixRows; dp14++) {
					if (pathMatrixBuffer[(dp14 * pathMatrixCols) + i] != PathfindingTile.unwalkable) {
						pathMatrixBuffer[(dp14 * pathMatrixCols) + i] = PathfindingTile.start;
					}
				}
			}

			for (i = 0; i < pathMatrixCols - pathMatrixBorder; ++i) {
				for (dp14 = 0; dp14 < pathMatrixRows; dp14++) {
					if (pathMatrixBuffer[(dp14 * pathMatrixCols) + i] != PathfindingTile.unwalkable) {
						pathMatrixBuffer[(dp14 * pathMatrixCols) + i] = PathfindingTile.start;
					}
				}
			}

			dp10.origin.y = 0;
			dp10.origin.x = 0;
		}
	}
}

/// $C4BAF6
void pathC4BAF6(ushort targetCount, VecYX *targetsPos, Pather *pather, ushort unk1, ushort unk2, short unk3) {
	ushort dp19 = pather.hitbox.y;
	ushort dp17 = pather.hitbox.x;
	ushort dp15 = 0;
	ushort dp13 = 0;

	pathB40E = pathB408;
	pathB40C = pathB408;

	ushort dp11;
	for (dp11 = 0; dp11 < targetCount; dp11++) {
		*pathB40E = cast(ushort)((targetsPos[dp11].y * pathMatrixCols) + targetsPos[dp11].x);
		pathB40E = (pathB40E == pathB40A) ? pathB408 : pathB40E + 1;
	}

	while (pathB40C != pathB40E) {
		ushort dp02 = *pathB40C;

		pathB40C = (pathB40C == pathB40A) ? pathB408 : pathB40C + 1;

		ubyte dp00 = pathMatrixBuffer[dp02];
		if (dp00 < PathfindingTile.maybeStart) continue; // Ignore PathfindingTile.maybeStart or PathfindingTile.start

		ushort flag = 1; // Y REGISTER
		ushort tmp = dp02; // X REGISTER
		ushort dp04;

		for (dp11 = 0; dp11 < dp19; tmp += pathMatrixCols, dp11++) {
			for (dp04 = 0; dp04 < dp17; ++dp04) {
				if (pathMatrixBuffer[tmp + dp04] == PathfindingTile.unwalkable) {
					flag = 0;
					goto exit_loop;
				}
			}
		}

exit_loop:
		if (!flag) {
			pathMatrixBuffer[dp02] = PathfindingTile.unknownFC;
		} else {
			if (dp00 == PathfindingTile.start) {
				++dp15;
				if (pather.fromOffscreen == 1) {
					pather.origin.y = cast(short)(tmp / pathMatrixCols);
					pather.origin.x = cast(short)(tmp % pathMatrixCols);
				}
			}

			dp00 = PathfindingTile.unknownFC;

			ushort dp0F;
			for (dp0F = 0; dp0F < 4; dp0F++) {
				dp11 = cast(ushort)(dp02 + pathCardinalOffset[dp0F]);
				ubyte dp01 = pathMatrixBuffer[dp11];
				if (dp01 >= PathfindingTile.maybeStart) { // if PathfindingTile.maybeStart or PathfindingTile.start
					if (pathB40C == pathB408) {
						flag = (pathB40E == pathB40A);
					} else {
						flag = (pathB40E + 1 == pathB40C);
					}

					if (!flag) {
						*pathB40E = dp11;
						pathB40E = (pathB40E == pathB40A) ? pathB408 : pathB40E + 1;
					}
				} else if (dp00 > dp01) {
					dp00 = dp01;
				}
			}

			if (dp00 == PathfindingTile.unknownFC) {
				pathMatrixBuffer[dp02] = 0;
			} else {
				ubyte dp0E = cast(ubyte)(dp00 + 1);
				pathMatrixBuffer[dp02] = dp0E;

				if (dp0E == unk2) {
					for (dp11 = 0; dp11 < 4; dp11++) {
						if (pathMatrixBuffer[ dp02 + pathCardinalOffset[dp11] ] >= PathfindingTile.maybeStart) { // if PathfindingTile.maybeStart or PathfindingTile.start
							pathMatrixBuffer[ dp02 + pathCardinalOffset[dp11] ] = PathfindingTile.unknownFC;
						}
					}
				}
			}

			++dp13;
			if (unk3 <= dp13 || dp15 == unk1) return;
		}
	}
}

/// $C4BD9A
ushort pathC4BD9A(VecYX *start, ushort max_points, VecYX **points) {
	ushort dp28 = start.y;
	ushort dp26 = start.x;
	ushort dp24 = 0;

	ubyte dp00 = pathMatrixBuffer[(dp28 * pathMatrixCols) + dp26];
	if (dp00 > PathfindingTile.unknownFB) { // if PathfindingTile.unknownFC, PathfindingTile.unwalkable, PathfindingTile.maybeStart, PathfindingTile.start
		return 0;
	}

	if (max_points == 0) {
		return 0;
	}

	points[0].y = dp28;
	points[0].x = dp26;


	ushort dp22 = 1;
	while (dp00 != 0) {
		ushort dp20 = 666; // No, really.
		ushort dp1E = 666;

		ushort dp0E;
		ushort dp10;
		ushort dp12;
		ushort dp14;

		dp00--;

		ushort dp1C = dp24; // Also dp02

		for (dp24 = 0; dp24 < 4; ++dp24) {
			ushort tmp = cast(ushort)(pathCardinalIndex[dp1C].y + dp28); // X REGISTER
			ushort dp1A = cast(ushort)(pathCardinalIndex[dp1C].x + dp26);

			ushort dp04 = dp1C & 3;

			if (pathMatrixBuffer[(pathMatrixCols * tmp) + dp1A] == dp00) {
				if (dp20 == 666) {
					dp20 = dp1C;
					dp0E = tmp;
					dp10 = dp1A;
				}

				ushort dp18 = cast(ushort)(pathDiagonalIndex[dp1C].y + dp28);
				ushort dp16 = cast(ushort)(pathDiagonalIndex[dp1C].x + dp26);

				if (pathMatrixBuffer[(dp18 * pathMatrixCols) + dp16] == dp00 - 1) {
					ushort dp02 = cast(ushort)(pathCardinalIndex[dp04].x + dp26);
					if (pathMatrixBuffer[((pathCardinalIndex[dp04].y + dp28) * pathMatrixCols) + dp02] == dp00) {
						dp1E = dp1C;
						dp12 = dp18;
						dp14 = dp16;
						goto exit_loop;
					}
				}
			}

			dp1C = dp04;
		}

exit_loop:
		if (dp1E != 666) {
			dp28 = dp12;
			dp26 = dp14;
			dp24 = dp1E;
			dp00--;
		} else {
			if (dp20 == 666) break;

			dp28 = dp0E;
			dp26 = dp10;
			dp24 = dp20;
		}

		if (max_points == dp22) return dp22;

		points[dp22].y = dp28;
		points[dp22].x = dp26;

		++dp22;
	}

	return dp22;
}

/// $C4BF7F
ushort pathC4BF7F(ushort count, VecYX **points) {
	if (count >= 3) {
		ushort dp04 = points[1].y;
		ushort dp1A = points[1].x; // Also dp02

		ushort dp18 = cast(ushort)(dp04 - points[0].y);
		ushort dp16 = cast(ushort)(dp1A - points[0].x);

		ushort dp14 = 1;
		ushort dp12;

		for (dp12 = 2; dp12 != count; ++dp12) {
			ushort dp10 = points[dp12].y;
			ushort dp0E = points[dp12].x; // Also Y REGISTER

			if (dp04 + dp18 == dp10 && dp1A + dp16 == dp0E) {
				points[dp14].y = dp10;
				points[dp14].x = dp0E;
			} else {
				++dp14;
				points[dp14].y = dp10;
				points[dp14].x = dp0E;

				dp18 = cast(ushort)(dp10 - dp04);
				dp16 = cast(ushort)(dp0E - dp1A);
			}

			dp04 = dp10;
			dp1A = dp0E;
		}

		count = cast(ushort)(dp14 + 1);
	}

	return count;
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

/// $C4C2DE
void unknownC4C2DE() {
	if (unknown7E4DC4 == 0) {
		changeMusic(Music.youLose);
		fadeOutWithMosaic(1, 1, 0);
	}
	loadedAnimatedTileCount = 0;
	mapPaletteAnimationLoaded = 0;
	unknown7E9F2A = 0;
	setBGMODE(BGMode.mode1 | BG3Priority);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	decomp(&unknownE1CFAF[0], &buffer[0]);
	if (gameState.partyMembers[0] == 3) {
		copyToVRAM(0, 0x8000, 0, &buffer[0x8000]);
	} else {
		copyToVRAM(0, 0x8000, 0, &buffer[0]);
	}
	decomp(&unknownE1D5E8[0], &buffer[0]);
	copyToVRAM(0, 0x800, 0x5800, &buffer[0]);
	decomp(&unknownE1D4F4[0], cast(ubyte*)&palettes[0][0]);
	memcpy(&palettes[7][0], &palettes[0][0], 0x20);
	memset(&palettes[1][0], 0, 0xC0);
	memcpy(&palettes[2][0], &palettes[7][0], 0x20);
	initializeTextSystem();
	prepareWindowGraphics();
	loadWindowGraphics(WindowGraphicsToLoad.all);
	loadTextPalette();
	preparePaletteUpload(PaletteUpload.full);
	mirrorTM = TMTD.bg3 | TMTD.bg1;
	unknown7E4DC4 = 0;
	bg2YPosition = 0;
	bg2XPosition = 0;
	bg1XPosition = 0;
	bg1XPosition = 0;
	fadeIn(1, 1);
	unknownC0888B();
}

/// $C4C45F
void setGameOverFadeTargetPalette(short animFrame) {
	ushort* paletteBuf = &paletteAnimTargetPalette()[0];
	// Initialize with current palettes
	memcpy(paletteBuf, &palettes[2][0], 0xC0);
	// Set the target for the current animation frame to the actual palette
	memcpy(paletteBuf + (animFrame * 16), &palettes[7][0], 0x20);
	// Set the target for the previous animation frame to black
	memcpy(paletteBuf + ((animFrame - 1) * 16), &palettes[6][0], 0x20);
}

/// $C4C519
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

/// $C4C567
short skippablePause(short arg1) {
	while (arg1 != 0) {
		if (padPress[0] != 0) {
			return -1;
		}
		waitUntilNextFrame();
		arg1--;
	}
	return 0;
}

/// $C4C58F
void unknownC4C58F(short arg1) {
	unknownC4954C(100, &palettes[0][0]);
	unknownC496E7(arg1, -1);
	for (short i = 0; i < arg1; i++) {
		updateMapPaletteAnimation();
		waitUntilNextFrame();
	}
	memset(&palettes[0][0], 0xFF, 0x200);
	preparePaletteUpload(PaletteUpload.full);
	waitUntilNextFrame();
}

/// $C4C60E
void unknownC4C60E(short arg1) {
	unknownC496E7(arg1, -1);
	for (short i = 0; i < arg1; i++) {
		updateMapPaletteAnimation();
		oamClear();
		runActionscriptFrame();
		updateScreen();
		waitUntilNextFrame();
	}
	unknownC49740();
}

/// $C4C64D
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

/// $C4C718
short spawn() {
	freezeEntities();
	unknownC4C2DE();
	short result = gameOverPrompt();
	if (result != 0) {
		fadeOutWithMosaic(2, 1, 0);
		unfreezeEntities();
		return result;
	}
	unknownC4C58F(0x20);
	musicEffect(MusicEffect.quickFade);
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	loadedMapTileCombo = -1;
	currentMapMusicTrack = -1;
	currentMusicTrack = 0xFFFF;
	unknown7E4676 = 1;
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
		entityCollidedObjects[i] = 0xFFFF;
	}
	unknownC064D4();
	unknown7E9E56 = 0;
	playerIntangibilityFrames = 0;
	spawnBuzzBuzz();
	oamClear();
	unfreezeEntities();
	unknownC4C60E(0x20);
	return result;
}

/// $C4C8A4
void clearEntityFadeBuffer() {
	entityFadeStatesBuffer = &buffer[0];
	entityFadeStatesLength = 0;
	entityFadeStates = cast(SpriteFadeState*)&buffer[0x7C00];
	memset(&buffer[0x7C00], 0, 0x400);
}

/// $C4C8DB
ubyte* allocateEntityFadeBuffer(short arg1) {
	ubyte* result = entityFadeStatesBuffer;
	entityFadeStatesBuffer += arg1;
	return result;
}

/// $C4C8E9
void clearEntityFadeEntry(ubyte* arg1, short arg2) {
	while (arg2 != 0) {
		(arg1++)[0] = 0;
		arg2--;
	}
}

/// $C4C91A
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
	SpriteFadeState* x1A = &entityFadeStates[entityFadeStatesLength];
	x1A.entityID = entityID;
	entitySpriteMapFlags[entityID] |= SpriteMapFlags.fading;
	x1A.appearanceStyle = appearanceStyle;
	x1A.pixelWidth = pixelWidths[entitySizes[entityID]];
	x1A.pixelHeight = cast(short)(entityTileHeights[entityID] * 8);
	x1A.fadeBufferSize = cast(short)(entityTileHeights[entityID] * 8 * pixelWidths[entitySizes[entityID]]);
	x1A.fadeBuffer = allocateEntityFadeBuffer(x1A.fadeBufferSize);
	clearEntityFadeEntry(x1A.fadeBuffer, x1A.fadeBufferSize);
	x1A.fadeBuffer2 = x1A.fadeBuffer + x1A.fadeBufferSize;
	x1A.unknown18 = 0;
	x1A.unknown16 = 0;
	ubyte* x16;
	if ((appearanceStyle == ObjFX.showBlink) || (appearanceStyle == ObjFX.showHStripe) || (appearanceStyle == ObjFX.showVStripe) || (appearanceStyle == ObjFX.showDots)) {
		x16 = x1A.fadeBuffer;
	} else {
		x16 = x1A.fadeBuffer2;
	}
	if (entityID >= 0x18) {
		unknownC4283F(entityID, x16, x1A.fadeBufferSize);
	} else {
		unknownC42884(entityID, x16, x1A.fadeBufferSize);
	}
	switch (appearanceStyle) {
		case ObjFX.showBlink:
		case ObjFX.hideBlink:
			entityScriptVar0Table[entityFadeEntity] = 1;
			x1A.fadeStyle = FadeStyle.blink;
			break;
		case ObjFX.showHStripe:
		case ObjFX.hideHStripe:
			entityScriptVar1Table[entityFadeEntity] = 1;
			x1A.fadeStyle = FadeStyle.hStripe;
			break;
		case ObjFX.showVStripe:
		case ObjFX.hideVStripe:
			entityScriptVar2Table[entityFadeEntity] = 1;
			x1A.fadeStyle = FadeStyle.vStripe;
			break;
		case ObjFX.showDots:
		case ObjFX.hideDots:
			entityScriptVar3Table[entityFadeEntity] = 1;
			x1A.fadeStyle = FadeStyle.dots;
			break;
		default: break;
	}
	entityScriptVar4Table[entityFadeEntity] = cast(short)(entityScriptVar0Table[entityFadeEntity] + entityScriptVar1Table[entityFadeEntity] + entityScriptVar2Table[entityFadeEntity] + entityScriptVar3Table[entityFadeEntity]);
	entityFadeStatesLength++;
}

/// $C4CB4F
void unknownC4CB4F() {
	SpriteFadeState* x06 = entityFadeStates;
	for (short i = 0; i < entityFadeStatesLength; i++) {
		entitySpriteMapFlags[x06.entityID] &= ~SpriteMapFlags.fading;
		x06++;
	}
}

/// $C4CB8F
void actionScriptBlinkVisible() {
	SpriteFadeState* x06 = entityFadeStates;
	for (short i = 0; i < entityFadeStatesLength; i++) {
		if (x06.fadeStyle == FadeStyle.blink) {
			entityAnimationFrames[x06.entityID] = 0;
		}
		updateEntitySprite(x06.entityID);
		x06++;
	}
}

/// $C4CBE3
void actionScriptBlinkInvisible() {
	SpriteFadeState* x06 = entityFadeStates;
	for (short i = 0; i < entityFadeStatesLength; i++) {
		if (x06.fadeStyle == FadeStyle.blink) {
			entityAnimationFrames[x06.entityID] = -1;
		}
		x06++;
	}
}

/// $C4CC2C
void actionScriptEndFade() {
	// wow. nothing!
}

/// $C4CC2F
short actionScriptHStripe() {
	short x1E = 0;
	short x04 = 0;
	SpriteFadeState* x1A = entityFadeStates;
	for (short i = 0; i < entityFadeStatesLength; i++, x1A++) {
		if (x1A.fadeStyle != FadeStyle.hStripe) {
			continue;
		}
		x04++;
		if (x1A.unknown18 == 2) {
			x1E++;
			continue;
		}
		unknownC428D1(cast(ushort*)x1A.fadeBuffer2, cast(ushort*)x1A.fadeBuffer, cast(short)((x1A.pixelWidth * 32 *(x1A.unknown16 / 8)) + (x1A.unknown16 % 8) * 2), x1A.pixelWidth / 8);
		uploadEntityFadeFrame(x1A.fadeBuffer2, x1A.entityID);
		x1A.unknown16 += 2;
		if (x1A.unknown16 >= x1A.pixelHeight) {
			x1A.unknown16 = 1;
			x1A.unknown18++;
		}
	}
	return cast(short)(x04 - x1E);
}

/// $C4CD44
short actionScriptVStripe() {
	short x1E = 0;
	short x04 = 0;
	SpriteFadeState* x0A = entityFadeStates;
	for (short i = 0; i < entityFadeStatesLength; i++, x0A++) {
		if (x0A.fadeStyle != FadeStyle.vStripe) {
			continue;
		}
		x04++;
		if (x0A.unknown18 == 2) {
			x1E++;
			continue;
		}
		short x;
		if (x0A.unknown18 != 0) {
			if ((x0A.unknown16 & 1) == 0) {
				x = x0A.unknown16;
			} else {
				x = cast(short)(x0A.pixelWidth - x0A.unknown16 - 1);
			}
		} else {
			if ((x0A.unknown16 & 1) != 0) {
				x = x0A.unknown16;
			} else {
				x = cast(short)(x0A.pixelWidth - x0A.unknown16 - 1);
			}
		}
		unknownC428FC(cast(ushort*)x0A.fadeBuffer2, cast(ushort*)x0A.fadeBuffer, x, x0A.pixelHeight, cast(short)((x0A.pixelWidth / 8) * 32));
		uploadEntityFadeFrame(x0A.fadeBuffer2, x0A.entityID);
		if (++x0A.unknown16 >= x0A.pixelWidth / 2) {
			x0A.unknown18++;
			x0A.unknown16 = 0;
		}
	}
	return cast(short)(x04 - x1E);
}

/// $C4CEB0
void actionScriptObjFXClearDotBuffer() {
	ushort* x06 = cast(ushort*)&buffer[0x7F00];
	for (short i = 0; i < 0x40; i++) {
		(x06++)[0] = 0;
	}
}

/// $C4CED8
void actionScriptObjFXDots() {
	SpriteFadeState* x0A = entityFadeStates;
	ushort* x1A = cast(ushort*)&buffer[0x7F00];
	short x18 = rand()&0x3F;
	while (x1A[x18] != 0) {
		x18 = (x18 + 1) & 0x3F;
	}
	x1A[x18] = 1;
	short x16 = x18 / 8;
	short x14 = x18 % 8;
	for (short i = 0; entityFadeStatesLength > i; i++, x0A++) {
		if (x0A.fadeStyle != FadeStyle.dots) {
			continue;
		}
		for (short j = 0; j < x0A.pixelHeight / 8; j++) {
			for (short k = 0; k < x0A.pixelWidth / 8; k++) {
				x18 = cast(short)((j * x0A.pixelWidth * 32) + (x16 * 2) + (k * 32));
				copyPixel(cast(ushort*)x0A.fadeBuffer2, cast(ushort*)x0A.fadeBuffer, x18, x14);
			}
		}
		uploadEntityFadeFrame(x0A.fadeBuffer2, x0A.entityID);
	}
}

/// $C4D00F
ubyte* unknownC4D00F(ubyte* arg1, short arg2, short arg3) {
	const(ubyte)* x06 = &unknownC3FB45[(arg2 - 0x41)][arg3 * 2];
	for (short i = 2; (i != 0) && (x06[0] != 0); i--) {
		(arg1++)[0] = (x06++)[0];
	}
	return arg1;
}

/// $C4D065
void unknownC4D065(ubyte* arg1, ubyte* arg2) {
	short x0E = 0;
	while (arg2[0] != 0) {
		short x00 = (arg2++)[0];
		if (x0E != 0) {
			if (x0E == x00) {
				(arg1++)[0] = 0x7E;
			} else {
				switch (x00) {
					case 0x41:
						arg1 = unknownC4D00F(arg1, x0E, 0);
						break;
					case 0x49:
						arg1 = unknownC4D00F(arg1, x0E, 1);
						break;
					case 0x55:
						arg1 = unknownC4D00F(arg1, x0E, 2);
						break;
					case 0x45:
						arg1 = unknownC4D00F(arg1, x0E, 3);
						break;
					case 0x4F:
						arg1 = unknownC4D00F(arg1, x0E, 4);
						break;
					default:
						if ((0x41 <= x00) && (x00 <= 0x5A)) {
							if (x0E == 0x4E) {
								(arg1++)[0] = 0x9D;
							} else {
								arg1 = unknownC4D00F(arg1, x0E, 1);
							}
							x0E = x00;
							continue;
						} else {
							if (x0E ==0x4E) {
								(arg1++)[0] = 0x9D;
							} else {
								arg1 = unknownC4D00F(arg1, x0E, 1);
							}
							(arg1++)[0] = cast(ubyte)x00;
						}
						break;
				}
				x0E = 0;
			}
		} else {
			switch (x00) {
				case 0x41:
					(arg1++)[0] = 0x60;
					break;
				case 0x49:
					(arg1++)[0] = 0x70;
					break;
				case 0x55:
					(arg1++)[0] = 0x80;
					break;
				case 0x45:
					(arg1++)[0] = 0x90;
					break;
				case 0x4F:
					(arg1++)[0] = 0xA0;
					break;
				default:
					if ((0x41 <= x00) && (x00 <= 0x5A)) {
						x0E = x00;
					} else {
						(arg1++)[0] = cast(ubyte)x00;
					}
					break;
			}
		}
	}
	if (x0E != 0) {
		if (x0E == 0x4E) {
			(arg1++)[0] = 0x9D;
		} else {
			arg1 = unknownC4D00F(arg1, x0E, 1);
		}
	}
	arg1[0] = 0;
}

/// $C4D274
ubyte getTownMapID(short x, short y) {
	return mapDataPerSectorTownMapData[y / 0x80][((x >> 8) & 0xFF)].unknown0;
}

/// $C4D2A8
void animateTownMapIconPalette() {
	if (framesUntilMapIconPaletteUpdate == 0) {
		framesUntilMapIconPaletteUpdate = 12;
		short x10 = palettes[8][1];
		for (short i = 2; i < 8; i++) {
			palettes[8][i - 1] = palettes[8][i];
		}
		palettes[8][7] = x10;
		preparePaletteUpload(PaletteUpload.halfSecond);
	}
	framesUntilMapIconPaletteUpdate--;
}

/// $C4D2F0
void unknownC4D2F0() {
	switch (mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown0 & 0x70) {
		case 0x10:
			drawSpriteF(&townMapIconSpritemaps[townMapMapping[2]][0], mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2 - 8);
			break;
		case 0x20:
			drawSpriteF(&townMapIconSpritemaps[townMapMapping[3]][0], mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2 + 8);
			break;
		case 0x40:
			drawSpriteF(&townMapIconSpritemaps[townMapMapping[4]][0], mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1 - 8, mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2 - 8);
			break;
		case 0x30:
			drawSpriteF(&townMapIconSpritemaps[townMapMapping[5]][0], mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1 + 16, mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2);
			break;
		default:
			break;
	}
	if (townMapPlayerIconAnimationFrame < 10) {
		drawSpriteF(&townMapIconSpritemaps[townMapMapping[1]][0], mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2);
	} else {
		drawSpriteF(&townMapIconSpritemaps[townMapMapping[0]][0], mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, mapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2);
	}
	if (--townMapPlayerIconAnimationFrame == 0) {
		townMapPlayerIconAnimationFrame = 20;
	}
}

/// $C4D43F
void drawTownMapIcons(short map) {
	currentSpriteDrawingPriority = 0;
	//not used - segmented addressing stuff
	//ubyte savedBank = setSpritemapBank(bankbyte(&townMapIconSpritemaps[0]));
	for (const(TownMapIconPlacement)* x06 = &townMapIconPlacementTable[map][0]; x06.x != 0xFF; x06++) {
		short x14 = 1;
		if ((unknownE1F47A[x06.sprite] != 0) && (townMapIconAnimationFrame < 10)) {
			x14 = 0;
		}
		short x12 = 0;
		if (x06.eventFlag >= eventFlagUnset) {
			x12 = 1;
		}
		if (getEventFlag(x06.eventFlag & 0x7FFF) != x12) {
			x14 = 0;
		}
		if (x14 == 0) {
			continue;
		}
		drawSpriteF(&townMapIconSpritemaps[x06.sprite][0], x06.x, x06.y);
	}
	unknownC4D2F0();
	if (--townMapIconAnimationFrame == 0) {
		townMapIconAnimationFrame = 60;
	}
	// see above
	//setSpritemapBank(savedBank);
	animateTownMapIconPalette();
}

/// $C4D552
void loadTownMapData(short arg1) {
	fadeOut(2, 1);
	decomp(&townMapGraphicsPointerTable[arg1][0], &buffer[0]);
	while (fadeParameters.step != 0) { waitForInterrupt(); }
	memcpy(&palettes[0][0], &buffer[0], 0x40);
	memcpy(&palettes[8][0], &townMapIconPalette[0], 0x100);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x3000, 0);
	setOAMSize(3);
	CGADSUB = 0;
	CGWSEL = 0;
	mirrorTM = TMTD.bg1;
	mirrorTD = TMTD.none;
	copyToVRAM(0, 0x800, 0x3000, &buffer[0x40]);
	copyToVRAM2(0, 0x4000, 0, &buffer[0x840]);
	decomp(&townMapLabelGfx[0], &buffer[0]);
	copyToVRAM(0, 0x2400, 0x6000, &buffer[0]);
	preparePaletteUpload(PaletteUpload.full);
	mirrorTM = TMTD.obj | TMTD.bg1;
	bg1YPosition = 0;
	bg1XPosition = 0;
	updateScreen();
	fadeIn(2, 1);
}

/// $C4D681
short displayTownMap() {
	townMapIconAnimationFrame = 60;
	townMapPlayerIconAnimationFrame = 20;
	framesUntilMapIconPaletteUpdate = 12;
	short mapID = getTownMapID(gameState.leaderX.integer, gameState.leaderY.integer);
	if (mapID == 0) {
		return 0;
	}
	loadTownMapData(cast(short)(mapID - 1));
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
	undrawFlyoverText();
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


/// $C4D744
void townMapDebug() {
	short x10 = 0;
	short x0E = 0;
	townMapIconAnimationFrame = 60;
	townMapPlayerIconAnimationFrame = 20;
	framesUntilMapIconPaletteUpdate = 12;
	loadTownMapData(0);
	while (true) {
		waitUntilNextFrame();
		oamClear();
		if ((padPress[0] & Pad.up) != 0) {
			x10--;
		}
		if ((padPress[0] & Pad.down) != 0) {
			x10++;
		}
		if (x10 == -1) {
			x10 = 5;
		}
		if (x10 == 6) {
			x10 = 0;
		}
		if (x0E != x10) {
			loadTownMapData(x10);
			x0E = x10;
		}
		drawTownMapIcons(x10);
		if ((padPress[0] & Pad.a) == 0) {
			break;
		}
		updateScreen();
	}
	undrawFlyoverText();
	reloadMap();
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
}

/// $C4D7D9
void displayAnimatedNamingSprite(short arg1) {
	for (const(NamingScreenEntity)* x06 = &unknownC3FD2D[arg1][0]; x06.sprite != 0; x06++) {
		createEntity(x06.sprite, x06.script, -1, 0, 0);
	}
	waitForNamingScreenActionScript = 0;
}

/// $C4D830
void unknownC4D830(short arg1) {
	while (waitForNamingScreenActionScript != 0) {
		finishFrame();
	}
	for (const(NamingScreenEntity)* x06 = &unknownC3FD2D[arg1 + 7][0]; x06.sprite != 0; x06++) {
		short x = findEntityBySprite(x06.sprite);
		if (x == -1) {
			continue;
		}
		tracef("Changing entity %s script to %s", x, cast(ActionScript)x06.script);
		setEntityActionScript(&actionScriptScriptPointers[x06.script][0], x);
	}
	while (true) {
		short* y = &entityScriptTable[0];
		ushort x0E = 0xFFFF;
		for (short i = 0; i < partyLeaderEntity; i++) {
			x0E &= (y++)[0];
		}
		finishFrame();
		if (x0E == 0xFFFF) {
			break;
		}
	}
}

/// $C4D8FA
void unknownC4D8FA() {
	for (short i = 0; i < 5; i++) {
		entityDirections[createEntity(fileSelectSummarySpriteConfig[i].sprite, fileSelectSummarySpriteConfig[i].script, -1, fileSelectSummarySpriteConfig[i].x, fileSelectSummarySpriteConfig[i].y)] = Direction.down;
	}
}

/// $C4D989
short runAttractModeScene(short arg1) {
	unknownC0927C();
	clearSpriteTable();
	spriteVramTableOverwrite(short.min, 0);
	initializeMiscObjectData();
	unknown7E4A58 = 1;
	enemySpawnsEnabled = 0;
	setBoundaryBehaviour(0);
	entityAllocationMinSlot = partyLeaderEntity;
	entityAllocationMaxSlot = partyLeaderEntity + 1;
	initEntity(1, 0, 0);
	clearParty();
	for (short i = 0; i < 6; i++) {
		gameState.partyMembers[i] = 0;
	}
	setLeaderLocation(0x1D60, 0xB08);
	unknownC03A24();
	memset(&palettes[0][0], 0, 0x200);
	overworldInitialize();
	mirrorTM = TMTD.none;
	unknownC2EA15(0);
	unknownC4A7B0();
	unknown7E9641 = 0;
	short x12 = 0;
	short x14 = 0;
	displayText(getTextBlock(attractModeText[arg1]));
	while (unknown7E9641 == 0) {
		unknownC4A7B0();
		if (((padPress[0] & Pad.a) != 0) || ((padPress[0] & Pad.b) != 0) || ((padPress[0] & Pad.start) != 0)) {
			x12 = 1;
			break;
		}
		finishFrame();
		if ((x14 == 0) || (x14 == 1)) {
			mirrorTM = TMTD.obj | TMTD.bg2 | TMTD.bg1;
		}
		x14++;
	}
	unknownC2EA74();
	while (unknownC2EACF() != 0) {
		finishFrame();
		unknownC4A7B0();
	}
	fadeOut(1, 1);
	while (fadeParameters.step != 0) {
		finishFrame();
	}
	unknownC2EAAA();
	unknown7E9641 = 0;
	unknownC021E6();
	return x12;
}

/// $C4DAD2
void initIntro() {
	short x02 = 0;
	disabledTransitions = 1;
	musicEffect(MusicEffect.quickFade);
	unknownC0927C();
	initializeTextSystem();
	unknownC432B1();
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
	short x;
	while (x == 0) {
		switch (x02) {
			case 0:
				if (logoScreen() != 0) {
					musicEffect(MusicEffect.quickFade);
					if ((mirrorINIDISP & 0x80) != 0) {
						fadeOutWithMosaic(4, 1, 0);
					}
					changeMusic(Music.titleScreen);
					x = showTitleScreen(1);
					x02 = 2;
				} else {
					x = 0;
				}
				break;
			case 1:
				changeMusic(Music.gasStation);
				if (gasStation() != 0) {
					musicEffect(MusicEffect.quickFade);
					if ((mirrorINIDISP & 0x80) != 0) {
						fadeOutWithMosaic(4, 1, 0);
					}
					CGADSUB = 0;
					CGWSEL = 0;
					mirrorTM = TMTD.bg1;
					mirrorTD = TMTD.none;
					changeMusic(Music.titleScreen);
					x = showTitleScreen(1);
					x02++;
				} else {
					x = 0;
				}
				break;
			case 2:
				changeMusic(Music.titleScreen);
				x = showTitleScreen(0);
				break;
			case 3:
				changeMusic(Music.attractMode);
				x = runAttractModeScene(0);
				break;
			case 4:
				x = runAttractModeScene(2);
				break;
			case 5:
				x = runAttractModeScene(3);
				break;
			case 6:
				x = runAttractModeScene(4);
				break;
			case 7:
				x = runAttractModeScene(5);
				break;
			case 8:
				x = runAttractModeScene(6);
				break;
			case 9:
				x = runAttractModeScene(7);
				break;
			case 10:
				x = runAttractModeScene(9);
				break;
			default:
				x02 = 1;
				break;
		}
		x02++;
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

/// $C4DCF6
void setDecompressedArrangementPriorityBit() {
	ushort* x0A = cast(ushort*)&buffer[0];
	for (short i = 0; i < 0x200; i++) {
		x0A[i] |= 0x2000;
	}
}

/// $C4DD28
void decompItoiProduction() {
	decomp(&producedItoiArrangement[0], &buffer[0]);
	setDecompressedArrangementPriorityBit();
	copyToVRAM(0, 0x800, 0x7C00, &buffer[0]);
	decomp(&producedItoiGraphics[0], &buffer[0x800]);
	copyToVRAM(0, 0x400, 0x6000, &buffer[0x800]);
	decomp(&nintendoItoiPalette[0], &palettes[0][0]);
	palettes[0][0] = 0;
	preparePaletteUpload(PaletteUpload.full);
}

/// $C4DDD0
void decompNintendoPresentation() {
	decomp(&nintendoPresentationArrangement[0], &buffer[0]);
	setDecompressedArrangementPriorityBit();
	copyToVRAM(0, 0x800, 0x7C00, &buffer[0]);
	decomp(&nintendoPresentationGraphics[0], &buffer[0x800]);
	copyToVRAM(0, 0x400, 0x6000, &buffer[0x800]);
	decomp(&nintendoItoiPalette[0], &palettes[0][0]);
	palettes[0][0] = 0;
	preparePaletteUpload(PaletteUpload.full);
}

/// $C4DE78
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

/// $C4DE98
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

/// $C4DED0
void enableYourSanctuaryDisplay() {
	setBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0x6000);
	mirrorTM = TMTD.obj | TMTD.bg1;
}

/// $C4DEE9
void prepareYourSanctuaryLocationPaletteData(short arg1, short arg2) {
	prepareAverageForSpritePalettes();
	memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
	loadMapPalette(arg1 / 8, arg1 & 7);
	adjustSpritePalettesByAverage();
	paletteUploadMode = PaletteUpload.none;
	memcpy(&buffer[0x4000 + arg2 * 0x200], &palettes[0][0], 0x100);
}

/// $C4DF7D
void prepareYourSanctuaryLocationTileArrangementData(short arg1, short arg2, short arg3) {
	arg1 -= 16;
	arg2 -= 14;
	memset(&unknown7EF000.yourSanctuaryLocationTileOffsets[0], 0, 0x800);
	ushort* x06 = cast(ushort*)&buffer[arg3 * 0x800];
	for (short i = 0; i < maxEntities; i++) {
		for (short j = 0; j < 0x20; j++) {
			short x0F;
			if (globalMapTilesetPaletteData[(i + arg2) / 16][(j + arg1) / 32] / 8 == loadedMapTileCombo) {
				x0F = loadMapBlockF((j + arg1) / 4, (i + arg2) / 4);
			} else {
				x0F = 0;
			}
			unknown7EF000.yourSanctuaryLocationTileOffsets[tileArrangementBuffer[(((i + arg2) & 3) * 4) + (x0F * 16) + (j + arg1) & 3] & 0x3FF * 2] = 0xFFFF;
			(x06++)[0] = tileArrangementBuffer[(((i + arg2) & 3) * 4) + (x0F * 16) + (j + arg1) & 3];
		}
	}
}

/// $C4E08C
void prepareYourSanctuaryLocationTilesetData(short arg1) {
	for (short i = 0; i < 0x400; i++) {
		if (unknown7EF000.yourSanctuaryLocationTileOffsets[i] == 0) {
			continue;
		}
		copyToVRAM(0, 0x20, (nextYourSanctuaryLocationTileIndex * 16 + 0x6000) & 0x7FFF, cast(ubyte*)&tileArrangementBuffer[i * 16]);
		unknown7EF000.yourSanctuaryLocationTileOffsets[i] = nextYourSanctuaryLocationTileIndex;
		nextYourSanctuaryLocationTileIndex++;
		yourSanctuaryLoadedTilesetTiles++;
	}
	ushort* x06 = (cast(ushort*)&buffer[0x800 * arg1]);
	for (short i = 0; i < 0x3C0; i++) {
		ushort x14 = x06[0];
		x06[0] = unknown7EF000.yourSanctuaryLocationTileOffsets[x14 & 0x3FF] | (x14 & 0xFC00);
		x06++;
	}
}

/// $C4E13E
void loadYourSanctuaryLocationData(short arg1, short arg2, short arg3) {
	yourSanctuaryLoadedTilesetTiles = 0;
	short x1A = globalMapTilesetPaletteData[arg2 / 16][arg1 / 32];
	loadedMapTileCombo = globalMapTilesetPaletteData[arg2 / 16][arg1 / 32];
	prepareYourSanctuaryLocationPaletteData(x1A, arg3);
	decomp(&mapDataTileArrangementPtrTable[tilesetTable[x1A]][0], &buffer[0x8000]);
	prepareYourSanctuaryLocationTileArrangementData(arg1, arg2, arg3);
	decomp(&mapDataTilesetPtrTable[tilesetTable[x1A]][0], &buffer[0x8000]);
	prepareYourSanctuaryLocationTilesetData(arg3);
	totalYourSanctuaryLoadedTilesetTiles += yourSanctuaryLoadedTilesetTiles;
}

/// $C4E281
void loadYourSanctuaryLocation(short arg1) {
	if (loadedYourSanctuaryLocations[arg1] == 0) {
		loadYourSanctuaryLocationData(yourSanctuaryLocations[arg1].x, yourSanctuaryLocations[arg1].y, arg1);
		loadedYourSanctuaryLocations[arg1] = 1;
	}
}

/// $C4E2D7
void displayYourSanctuaryLocation(short arg1) {
	short x02 = arg1 & 7;
	if (loadedYourSanctuaryLocations[x02] == 0) {
		loadYourSanctuaryLocation(x02);
		waitUntilNextFrame();
	}
	waitDMAFinished();
	copyToVRAM(0, 0x780, 0x3800, &buffer[x02 * 0x800]);
	memcpy(&palettes[0][0], &buffer[0x4000 + x02 * 0x200], 0x100);
	paletteUploadMode = PaletteUpload.halfFirst;
	screenTopY = 0;
	screenLeftX = 0;
	bg1YPosition = 0;
	bg1XPosition = 0;
}

/// $C4E366 - some debugging code deleted from earthbound
void testYourSanctuaryDisplay() {
	version(JPN) {
		initializeYourSanctuaryDisplay();
		short x0E = 0;
		while (true) {
			bg1XPosition = 0;
			bg1YPosition = 0;
			updateScreen();
			waitUntilNextFrame();
			if ((padState[0] & Pad.r) == 0) {
				displayYourSanctuaryLocation(x0E);
				enableYourSanctuaryDisplay();
				if (++x0E == 8) {
					x0E = 0;
				}
			}
		}
	}
}

/// $C4E369
void loadCastScene() {
	unknown7E9F2A = 0;
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
	copyToVRAM(3, 0x800, 0x7C00, &buffer[0]);
	unknown7EB4CE = 0xFF;
	memset(&buffer[0], 0, 0x1000);
	decomp(&unknownE1D6E1[0], &buffer[0x200]);
	decomp(&castNamesGraphics[0], &buffer[0x600]);
	unknownC4E7AE();
	copyToVRAM(0, 0x8000, 0, &buffer[0]);
	unknown7EB4CE = 0;
	loadTextPalette();
	memcpy(&palettes[0][0], &unknownE1D815[0], 0x20);
	memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
	decomp(&unknownE1E4E6[0], &buffer[0x7000]);
	paletteUploadMode = PaletteUpload.full;
	mirrorTM = TMTD.obj | TMTD.bg3;
	unknown7EB4CF = 0;
	unknown7EB4D1 = 0;
	setForceBlank();
}

/// $C4E4DA
void unknownC4E4DA(short arg1) {
	entityScriptVar0Table[currentEntitySlot] = cast(short)(arg1 * 8 + bg3YPosition);
}

/// $C4E4F9
short unknownC4E4F9() {
	short x0E = 0;
	if (entityScriptVar0Table[currentEntitySlot] <= bg3YPosition) {
		x0E = 1;
	}
	return x0E;
}

/// $C4E51E
void unknownC4E51E() {
	ubyte* x06 = &buffer[0x7FFE];
	bg3YPosition = entityAbsYTable[currentEntitySlot];
	if (entityScriptVar7Table[currentEntitySlot] < entityAbsYTable[currentEntitySlot]) {
		entityScriptVar7Table[currentEntitySlot] += 8;
		x06[0] = 0;
		copyToVRAM(3, 0x40, cast(ushort)((((bg3YPosition / 8) - 1) & 0x1F) * 32 + 0x7C00), x06);
	}
}

/// $C4E583
void unknownC4E583(ubyte* arg1, short arg2, short arg3) {
	vwfTile = 0;
	vwfX = 0;
	memset(&vwfBuffer[0][0], 0xFF, 0x340);
	textRenderState.upperVRAMPosition = 0;
	textRenderState.pixelsRendered = 0;
	unknownC1FF99(-1, arg2, arg1);
	for (short i = 0; arg1[0] != 0; arg1++, i++) {
		const(ubyte)* x0A = &fontGraphics[fontConfigTable[0].graphicsID][fontConfigTable[0].width * (arg1[0] - ebChar(' ') & 0x7F)];
		short x1E = fontData[fontConfigTable[0].dataID][arg1[0] - ebChar(' ') & 0x7F] + characterPadding;
		while (x1E > 8) {
			renderText(x1E, fontConfigTable[0].width, x0A);
			x1E -= 8;
			x0A += fontConfigTable[0].width;
		}
		renderText(x1E, fontConfigTable[0].width, x0A);
	}
	unknownC4EEE1(arg2);
	short x04 = cast(short)(arg3 * 8);
	for (short i = 0; i < arg2; i++, x04 += 8) {
		memcpy(&buffer[((arg3 & 0xF) + ((arg3 & 0x3F0) * 2)) * 16], &vwfBuffer[i][0], 16);
		memcpy(&buffer[((arg3 & 0xF) + ((arg3 & 0x3F0) * 2)) * 16 + 256], &vwfBuffer[i][16], 16);
	}
}

/// $C4E796
immutable ubyte[][3] characterGuardianText = [
	ebString("'s dad"),
	ebString("'s mom"),
	ebString("'s Master"),
];

/// $C4E7AE
void unknownC4E7AE() {
	ubyte[16] x16;
	for (short i = 0; i < 4; i++) {
		memset(&x16[0], 0, 0x10);
		memcpy(&x16[0], &partyCharacters[i].name[0], 5);
		unknownC4E583(&x16[0], 6, unknownC3FDB5[i]);
	}
	memset(&x16[0], 0, 0x10);
	memcpy(&x16[0], &gameState.petName[0], 6);
	unknownC4E583(&x16[0], 6, 0x1C0);
	memset(&x16[0], 0, 0x10);
	memcpy(&x16[0], &partyCharacters[1].name[0], 5);
	strcat(cast(char*)&x16[0], cast(immutable(char)*)&characterGuardianText[0][0]);
	unknownC4E583(&x16[0], castSequenceFormatting[13].unknown2, castSequenceFormatting[13].unknown0);
	memset(&x16[0], 0, 0x10);
	memcpy(&x16[0], &partyCharacters[1].name[0], 5);
	strcat(cast(char*)&x16[0], cast(immutable(char)*)&characterGuardianText[1][0]);
	unknownC4E583(&x16[0], castSequenceFormatting[12].unknown2, castSequenceFormatting[12].unknown0);
	memset(&x16[0], 0, 0x10);
	memcpy(&x16[0], &partyCharacters[3].name[0], 5);
	strcat(cast(char*)&x16[0], cast(immutable(char)*)&characterGuardianText[2][0]);
	unknownC4E583(&x16[0], castSequenceFormatting[36].unknown2, castSequenceFormatting[36].unknown0);
}

/// $C4EA9C
void unknownC4EA9C(short arg1, short arg2, short arg3) {
	ushort* x06 = cast(ushort*)&buffer[0x4000 + arg3];
	while (arg2-- != 0) {
		x06[0] = cast(short)(unknown7EB4D1 + ((arg1 & 0x3F0) * 2) + (arg1 & 0xF));
		x06[0x40] = cast(short)(x06[0] + 0x10);
		x06++;
		arg1++;
	}
}

/// $C4EB04
void unknownC4EB04(short arg1, short arg2, short arg3) {
	short x14 = (bg3YPosition / 8 + arg2) & 0x1F;
	short x04 = cast(short)((arg2 * 32) + arg1 + 0x7C00 - (arg3 + 1) / 2);
	copyToVRAM(0, cast(ushort)(arg3 * 2), x04, &buffer[0x4000 + arg1 * 2]);
	short x12;
	if (x14 != 0x1F) {
		x12 = cast(short)(x04 + 0x20);
	} else {
		x12 = cast(short)(x04 - 0x3E0);
	}
	copyToVRAM(0, cast(short)(arg3 * 2), x12, &buffer[0x4000 + arg1 * 2 + 64]);
}

/// $C4EBAD
void unknownC4EBAD(short arg1, short arg2, short arg3) {
	unknownC4EA9C(castSequenceFormatting[arg1].unknown0, castSequenceFormatting[arg1].unknown2, arg2);
	unknownC4EB04(arg2, arg3, castSequenceFormatting[arg1].unknown0);
}

/// $C4EC6E
void unknownC4EC6E(short arg1) {
	memcpy(&palettes[12][0], &buffer[0x7000 + arg1 * 32], 0x20);
	paletteUploadMode = PaletteUpload.halfSecond;
}

/// $C4EC05
void unknownC4EC05(short arg1, short arg2, short arg3) {
	if (arg1 != 7) {
		unknownC4EA9C(unknownC3FDB5[arg1 - 1], 6, arg2);
		unknownC4EB04(arg2, arg3, 6);
	} else {
		unknownC4EA9C(0x1C0, 6, arg2);
		unknownC4EB04(arg2, arg3, 6);
	}
}

/// $C4EC52
void unknownC4EC52(short arg1, short arg2, short arg3) {
	unknownC4EBAD(entityScriptVar0Table[currentEntitySlot], arg2, arg3);
}

/// $C4ECAD
short createEntityAtV01PlusBG3Y(short arg1, short arg2) {
	newEntityVar0 = unknown7EB4D3 & 3;
	return createEntity(arg1, arg2, -1, entityScriptVar0Table[currentEntitySlot], cast(short)(entityScriptVar1Table[currentEntitySlot] + bg3YPosition));
}

/// $C4ECE7
short unknownC4ECE7() {
	short x0E = 0;
	if (bg3YPosition - 8 < entityAbsYTable[currentEntitySlot]) {
		x0E = 1;
	}
	return x0E;
}

/// $C4ED0E
void playCastScene() {
	loadCastScene();
	oamClear();
	fadeIn(1, 1);
	initEntityWipe(ActionScript.unknown801, 0, 0);
	unknown7E9641 = 0;
	while (unknown7E9641 == 0) {
		finishFrame();
		drawBattleFrame();
	}
	fadeOutWithMosaic(1, 1, 0);
	for (short i = 0; i < maxEntities; i++) {
		if (entityScriptTable[i] == ActionScript.unknown801) {
			deleteEntity(i);
		}
	}
	entityAllocationMinSlot = partyLeaderEntity;
	entityAllocationMaxSlot = partyLeaderEntity + 1;
	initEntity(0, 0, ActionScript.partyMemberLeading);
	clearParty();
	unknownC03A24();
	prepareForImmediateDMA();
	undrawFlyoverText();
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
}

/// $C4EEE1
void unknownC4EEE1(short arg1) {
	ubyte* x = &vwfBuffer[0][0];
	for (short i = 0; i < arg1 * 16; i++) {
		ubyte x0F = 0;
		ubyte x00 = 0;
		ubyte x0E = x[0];
		ubyte x01 = x[1];
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
		x[1] = x0F;
		x[0] = x00;
		x += 2;
	}
}

/// $C4EFC4
void unknownC4EFC4(short mode, short count, short address, const(ubyte)* data) {
	creditsDMAQueue[creditsDMAQueueStart].mode = cast(ubyte)mode;
	creditsDMAQueue[creditsDMAQueueStart].count = count;
	creditsDMAQueue[creditsDMAQueueStart].data = data;
	creditsDMAQueue[creditsDMAQueueStart].address = address;
	creditsDMAQueueStart = (creditsDMAQueueStart + 1) & 0x7F;
}

/// $C4F01D
void unknownC4F01D() {
	if (creditsDMAQueueStart == creditsDMAQueueEnd) {
		return;
	}
	copyToVRAM(creditsDMAQueue[creditsDMAQueueEnd].mode, creditsDMAQueue[creditsDMAQueueEnd].count, creditsDMAQueue[creditsDMAQueueEnd].address, creditsDMAQueue[creditsDMAQueueEnd].data);
	creditsDMAQueueEnd = (creditsDMAQueueEnd + 1) & 0x7F;
}

/// $C4F07D
void unknownC4F07D() {
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
	copyToVRAM(3, 0x1000, 0x3800, &buffer[0]);
	*(cast(ushort*)&buffer[0]) = 0x240C;
	copyToVRAM(9, 0x1000, 0x7000, &buffer[0]);
	copyToVRAM(15, 0x1000, 0x7000, &buffer[1]);
	decomp(&unknownE1E94A[0], &buffer[0]);
	memcpy(&palettes[1][0], &unknownE1E92A[0], 0x20);
	copyToVRAM(0, 0x700, 0x7000, &buffer[0]);
	copyToVRAM(0, 0x2000, 0x2000, &buffer[0x700]);
	*(cast(ushort*)&buffer[0]) = 0;
	copyToVRAM(3, 0x800, 0x6C00, &buffer[0x700]);
	decomp(&staffCreditsFontGraphics[0], &buffer[0]);
	copyToVRAM(0, 0xC00, 0x6200, &buffer[0]);
	memcpy(&palettes[0][0], &staffCreditsFontPalette[0], 0x10);
	memcpy(&palettes[8][0], &spriteGroupPalettes[0], 0x100);
	memset(&palettes[1][0], 0, 0x1E0);
	paletteUploadMode = PaletteUpload.full;
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	creditsNextCreditPosition = 0;
	creditsScrollPosition.combined = 0;
	creditsRowWipeThreshold = 7;
	ushort* x06 = &bg2Buffer[0];
	for (short i = 0; i < 0x200; i++) {
		*(x06++) = 0;
	}
	creditsSource = &staffText[0];
	setForceBlank();
}

/// $C4F264
short unknownC4F264(short arg1) {
	if (getEventFlag(photographerConfigTable[arg1].eventFlag) == 0) {
		return 0;
	}
	photographMapLoadingMode = 1;
	currentPhotoDisplay = arg1;
	short x02 = enemySpawnsEnabled;
	enemySpawnsEnabled = 0;
	ushort* x = cast(ushort*)&heap[0][0];
	// the original code went way beyond the heap. the heap appears to be 0x400 bytes, so perhaps they just forgot to factor the size of a short?
	for (short i = 0; i < 0x200/+0x400+/; i++) {
		*(x++) = 0;
	}
	paletteUploadMode = PaletteUpload.none;
	memcpy(&palettes[1][0], &unknownE1E92A[0], 32);
	loadMapAtPosition(photographerConfigTable[arg1].mapX, photographerConfigTable[arg1].mapY);
	enemySpawnsEnabled = x02;
	bg2YPosition = 0;
	bg2XPosition = 0;
	photographMapLoadingMode = 0;
	short x1A = 0;
	for (short i = 0; i < 4; i++) {
		if (photographerConfigTable[arg1].objectConfig[i].sprite == 0) {
			continue;
		}
		newEntityVar0 = x1A++;
		createEntity(photographerConfigTable[arg1].objectConfig[i].sprite, ActionScript.unknown799, -1, photographerConfigTable[arg1].objectConfig[i].tileX, photographerConfigTable[arg1].objectConfig[i].tileY);
	}
	for (short i = 0; i < 6; i++) {
		if ((gameState.savedPhotoStates[arg1].partyMembers[i] & 0x1F) >= 18) {
			continue;
		}
		if ((gameState.savedPhotoStates[arg1].partyMembers[i] & 0x1F) == 0) {
			continue;
		}
		newEntityVar0 = x1A++;
		unknownC07A31(createEntity(unknownC079EC(gameState.savedPhotoStates[arg1].partyMembers[i]), ActionScript.unknown800, -1, photographerConfigTable[arg1].partyConfig[i].x, photographerConfigTable[arg1].partyConfig[i].y), gameState.savedPhotoStates[arg1].partyMembers[i]);
	}
	return 1;
}

/// $C4F433
short countPhotoFlags() {
	short x10 = 0;
	for (short i = 0; i < 32; i++) {
		if (getEventFlag(photographerConfigTable[i].eventFlag) != 0) {
			x10++;
		}
	}
	return x10;
}

/// $C4F46F
void unknownC4F46F(short arg1) {
	auto x0A = unknownC41FFF(cast(short)(photographerConfigTable[arg1].slideDirection * 0x400), 0x100);
	short x18 = bg1XPosition;
	short x16 = bg1YPosition;
	short x02 = 0;
	short x04 = 0;
	for (short i = 0; i < (photographerConfigTable[arg1].slideDistance << 8) / 0x100; i++) {
		x02 += x0A.x;
		x04 += x0A.y;
		bg1XPosition = cast(ushort)((x02 / 0x100) + x18);
		bg1YPosition = cast(ushort)((x04 / 0x100) + x16);
		bg2XPosition = cast(ushort)(x02 / 0x100);
		bg2YPosition = cast(ushort)(x04 / 0x100);
		unknownC4F01D();
		finishFrame();
	}
}

/// $C4F554
void playCredits() {
	disabledTransitions = 1;
	unknownC4F07D();
	oamClear();
	fadeIn(1, 2);
	short x04 = (countPhotoFlags() != 0) ? (4528 / countPhotoFlags()) : 4528;
	short x02 = x04;
	setIRQCallback(&creditsScrollFrame);
	for (short i = 0; i < 32; i++) {
		if (unknownC4F264(i) != 0) {
			unknownC496E7(64, -1);
			for (short j = 0x40; j != 0; j--) {
				updateMapPaletteAnimation();
				unknownC4F01D();
				finishFrame();
			}
			unknownC49740();
			unknownC4F46F(i);
			while (x02 > bg3YPosition) {
				unknownC4F01D();
				finishFrame();
			}
			memset(&buffer[32], 0, 0x1E0);
			unknownC496E7(64, -1);
			for (short j = 0; j < 64; j++) {
				updateMapPaletteAnimation();
				unknownC4F01D();
				finishFrame();
			}
			memset(&palettes[1][0], 0, 0x1E0);
			preparePaletteUpload(PaletteUpload.full);
			unknownC4F01D();
			finishFrame();
			x02 += x04;
		}
	}
	while (bg3YPosition < 4528) {
		unknownC4F01D();
		finishFrame();
	}
	resetIRQCallback();
	for (short i = 0; i < 2000; i++) {
		finishFrame();
	}
	fadeOutWithMosaic(1, 2, 0);
	unknownC4249A(0xB3, 0);
	prepareForImmediateDMA();
	overworldSetupVRAM();
	unknownC021E6();
	entityAllocationMinSlot = partyLeaderEntity;
	entityAllocationMaxSlot = partyLeaderEntity + 1;
	initEntity(ActionScript.partyMemberLeading, 0, 0);
	clearParty();
	unknownC03A24();
	ushort* x06 = &bg2Buffer[0];
	for (short i = 0; i < 0x200; i++) {
		*(x06++) = 0;
	}
	undrawFlyoverText();
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	setIRQCallback(&processOverworldTasks);
	disabledTransitions = 0;
}

/// $C4FBBD
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

/// $C4FB58
void initializeSPC700() {
	enableAutoSectorMusicChanges = 1;
}

/// $C4FD18
void unknownC4FD18(short arg1) {
	setAudioChannels(arg1);
}

/// $C4FD45
void setBoundaryBehaviour(short val) {
	enableAutoSectorMusicChanges = val;
}

shared static this() {
	import std.array : join;
	entityOverlaySweating = [
		OverlayScript.show(entityOverlaySweatingFrame41.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(entityOverlaySweatingFrame42.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(cast(const(SpriteMap)*)null),
		OverlayScript.delay(16),
		OverlayScript.show(entityOverlaySweatingFrame43.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(entityOverlaySweatingFrame44.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(cast(const(SpriteMap)*)null),
		OverlayScript.delay(16),
		OverlayScript.jump(entityOverlaySweating.ptr),
	];
	entityOverlayMushroomized = [
		OverlayScript.show(entityOverlayMushroomizedFrame1.ptr),
		OverlayScript.delay(255),
		OverlayScript.jump(entityOverlayMushroomized.ptr)
	];
	entityOverlayRipple = [
		OverlayScript.show(entityOverlayRippleFrame1.ptr),
		OverlayScript.delay(12),
		OverlayScript.show(entityOverlayRippleFrame2.ptr),
		OverlayScript.delay(12),
		OverlayScript.jump(entityOverlayRipple.ptr)
	];
	entityOverlayBigRipple = [
		OverlayScript.show(entityOverlayBigRippleFrame1.ptr),
		OverlayScript.delay(12),
		OverlayScript.show(entityOverlayBigRippleFrame2.ptr),
		OverlayScript.delay(12),
		OverlayScript.jump(entityOverlayBigRipple.ptr)
	];
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
