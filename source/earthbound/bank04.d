/// more misc things
module earthbound.bank04;

import earthbound.commondefs;
import earthbound.hardware;
import earthbound.actionscripts;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank07;
import earthbound.bank08;
import earthbound.bank0A;
import earthbound.bank0C;
import earthbound.bank0E;
import earthbound.bank0F;
import earthbound.bank10;
import earthbound.bank15;
import earthbound.bank17;
import earthbound.bank18;
import earthbound.bank20;
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.globals;
import core.stdc.string;
import core.thread : Fiber;

/// $C40015
short UnknownC40015() {
	EntityAnimationFrames[ActionScript88 / 2] = 0;
	UnknownC0A443Entry3();
	return UnknownC0C6B6();
}

/// $C40023
void UnknownC40023() {
	EntitySleepFrames[ActionScript8A / 2] = CurrentEntitySlot & 0xF;
}

/// $C4002F
void UnknownC4002F(short arg1, ushort arg2, ushort arg3) {
	DMA_COPY_RAM_SRC = &VWFBuffer[arg1][0];
	Unknown7E0091 = 0;
	DMA_COPY_SIZE = 16;
	//lol segmented addressing
	//DMA_COPY_RAM_SRC = 0x7E
	DMA_COPY_VRAM_DEST = cast(ushort)((arg2 * 8) + 0x6000);
	CopyToVramCommon();
	DMA_COPY_RAM_SRC += 0x10;
	DMA_COPY_VRAM_DEST = cast(ushort)((arg3 * 8) + 0x6000);
	CopyToVramCommon();
	DMATransferFlag = (INIDISP_MIRROR & 0x80) ^ 0x80;
}

/// $C40085
short UnknownC40085() {
	ushort y = 8;
	short a = -1;
	while (a == Unknown7E1AD6[y / 2]) {
		y += 2;
		if (y != 0x40) {
			continue;
		}
		UnknownC10000();
		UnknownC1008E();
		UnknownC09451();
		//longjmp(&jmpbuf2);
	}
	ushort x = 30;
	a = Unknown7E1AD6[y / 2];
	while (a < 0) {
		x -= 2;
		a <<= 1;
	}
	Unknown7E1AD6[y / 2] |= PowersOfTwo16Bit[x / 2];
	Unknown7E288E = x;
	Unknown7E288E >>= 1;
	return cast(short)(Unknown7E288E + y * 8);
}

/// $C40B51
void UnknownC40B51() {
	StopMusic();
	UnknownC08D79(1);
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x4000, 0);
	TM_MIRROR = 4;
	UnknownC08726();
}

/// $C40B75
noreturn UnknownC40B75() {
	CopyToVram(0, 0xA00, 0, &Unknown7F0000[0]);
	CopyToVram(0, 0x800, 0x4000, &Unknown7F0000[0x4000]);
	memcpy(&palettes[0][0], &WarningPalette[0], 0x10);
	UnknownC0856B(0x18);
	FadeInWithMosaic(1, 1, 0);
	while (true) {}
}

/// $C40BD4
immutable short[10] FootstepSoundTable = [
	Sfx.None,
	Sfx.None,
	Sfx.None,
	Sfx.None,
	Sfx.Unknown15,
	Sfx.Unknown0F,
	Sfx.None,
	Sfx.None,
	Sfx.Unknown14,
	Sfx.Unknown13,
];

/// $C40BE8
immutable ubyte[512] UnknownC40BE8 = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

/// $C40DE8
immutable FloatingSpriteTableEntry[12] FloatingSpriteTable = [
	FloatingSpriteTableEntry(OverworldSprite.None, 0x00, 0x00, 0x00),
	FloatingSpriteTableEntry(OverworldSprite.SURPRISE_MARK, 0x02, 0x00, 0xF8),
	FloatingSpriteTableEntry(OverworldSprite.CELL_PHONE_TENDA_VILLAGE, 0x05, 0xF8, 0xFC),
	FloatingSpriteTableEntry(OverworldSprite.EXCLAMATION_MARK, 0x02, 0x08, 0xF8),
	FloatingSpriteTableEntry(OverworldSprite.LIGHT_BULB, 0x02, 0x00, 0xF8),
	FloatingSpriteTableEntry(OverworldSprite.SKY_RUNNER_ELECTRIC_THINGIES, 0x02, 0x00, 0xF4),
	FloatingSpriteTableEntry(OverworldSprite.FLAG_OF_THE_EXTINCT_HAPPY_PEOPLE, 0x02, 0x00, 0x08),
	FloatingSpriteTableEntry(OverworldSprite.RUNAWAY_5_MEMBERS_HEAD, 0x02, 0xF8, 0x10),
	FloatingSpriteTableEntry(OverworldSprite.RUNAWAY_5_MEMBERS_HEAD, 0x02, 0x08, 0x10),
	FloatingSpriteTableEntry(OverworldSprite.HEART, 0x02, 0x00, 0xF8),
	FloatingSpriteTableEntry(OverworldSprite.BUS_DRIVER_HEAD, 0x02, 0xF0, 0x10),
	FloatingSpriteTableEntry(OverworldSprite.BUS_DRIVER_HEAD, 0x02, 0x10, 0x10),
];

/// $C40E31
immutable ubyte EntityOverlayCount = 4;

/// $C40E32
immutable EntityOverlaySprite[4] EntityOverlaySprites = [
	EntityOverlaySprite(OverworldSprite.Sweat, 0, 1),
	EntityOverlaySprite(OverworldSprite.LittleMushroom, 0, -1),
	EntityOverlaySprite(OverworldSprite.WaterRipple, 0, -1),
	EntityOverlaySprite(OverworldSprite.BigWaterRipple, 0, -1),
];

///
immutable SpriteMap[2] EntityOverlaySweatingFrame1 = [
	SpriteMap(0xF0,0x3360 | SpritemapOrientation.Horizontal, 0xEA, 0x80),
	SpriteMap(0xF0,0x2360 | SpritemapOrientation.Horizontal, 0xEA, 0x80),
];

///
immutable SpriteMap[2] EntityOverlaySweatingFrame2 = [
	SpriteMap(0xF0,0x3362 | SpritemapOrientation.Horizontal, 0xEA, 0x80),
	SpriteMap(0xF0,0x2362 | SpritemapOrientation.Horizontal, 0xEA, 0x80),
];

///
immutable SpriteMap[2] EntityOverlaySweatingFrame3 = [
	SpriteMap(0xF0,0x3360, 0x04, 0x80),
	SpriteMap(0xF0,0x2360, 0x04, 0x80),
];

///
immutable SpriteMap[2] EntityOverlaySweatingFrame4 = [
	SpriteMap(0xF0,0x3362, 0x04, 0x80),
	SpriteMap(0xF0,0x2362, 0x04, 0x80),
];

///
immutable SpriteMap[2] EntityOverlayMushroomizedFrame1 = [
	SpriteMap(0xE8,0x3364, 0xF8, 0x80),
	SpriteMap(0xE8,0x2364, 0xF8, 0x80),
];

///
immutable SpriteMap[2] EntityOverlayRippleFrame1 = [
	SpriteMap(0xFE,0x3366, 0xF8, 0x80),
	SpriteMap(0xFE,0x2366, 0xF8, 0x80),
];

///
immutable SpriteMap[2] EntityOverlayRippleFrame2 = [
	SpriteMap(0xFE,0x3366 | SpritemapOrientation.Horizontal, 0xF8, 0x80),
	SpriteMap(0xFE,0x2366 | SpritemapOrientation.Horizontal, 0xF8, 0x80),
];

///
immutable SpriteMap[4] EntityOverlayBigRippleFrame1 = [
	SpriteMap(0xF8,0x3368, 0xF0, 0x00),
	SpriteMap(0xF8,0x336A, 0x00, 0x80),
	SpriteMap(0xF8,0x2368, 0xF0, 0x00),
	SpriteMap(0xF8,0x236A, 0x00, 0x80),
];

///
immutable SpriteMap[] EntityOverlayBigRippleFrame2 = [
	SpriteMap(0xF8,0x336A | SpritemapOrientation.Horizontal, 0xF0, 0x00),
	SpriteMap(0xF8,0x3368 | SpritemapOrientation.Horizontal, 0x00, 0x80),
	SpriteMap(0xF8,0x236A | SpritemapOrientation.Horizontal, 0xF0, 0x00),
	SpriteMap(0xF8,0x2368 | SpritemapOrientation.Horizontal, 0x00, 0x80),
];

///
immutable OverlayScript[13] EntityOverlaySweating;

///
immutable OverlayScript[3] EntityOverlayMushroomized;

///
immutable OverlayScript[5] EntityOverlayRipple;

///
immutable OverlayScript[5] EntityOverlayBigRipple;

/// $C41A9E
void Decomp(const(ubyte)* data, void* buffer) {
	//I'm not gonna redo perfectly good work that already exists
	DecompBlock(data, cast(ubyte*)buffer, 0x10000);
}

/// $C41EFF
ushort UnknownC41EFF(short arg1, short arg2, short arg3, short arg4) {
	short a = cast(short)(arg1 - arg3);
	short y;
	if (a < 0) {
		a = cast(short)-cast(int)a;
	}
	y = a;
	a = cast(short)(arg2 - arg4);
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
	a = cast(short)(arg2 - arg4);
	if (a == 0) {
		a = 8;
	} else if (a > 0) {
		a = 2;
	} else {
		a = 0;
	}
	if (arg1 - arg3 == 0) {
		a |= 4;
	} else if (arg1 - arg3 > 0) {
		a |= 1;
	}
	if ((a & 0xC) != 0) {
		return UnknownC41FC5[a];
	}
	short x0E = a;
	short x08 = cast(short)(a * 2);
	a = x0C;
	XBA(a);
	if ((a & 0xFF) != 0) {
		a = -1;
	}
	a /= x0A;
	short x = 0;
	while (x < 16) {
		if (a < UnknownC41FDF[x]) {
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
	return cast(ushort)(a + UnknownC41FC5[x08]);
}

unittest {
	assert(UnknownC41EFF(0x7D0,0x488,0x5F8,0x488) == 0xC000);
	assert(UnknownC41EFF(0x818,0x5D8,0x8F0,0x5D8) == 0x4000);
	assert(UnknownC41EFF(0x718,0x6E8,0x570,0x6E8) == 0xC000);
	assert(UnknownC41EFF(0x56F,0x694,0x575,0x6E3) == 0x7C00);
}

/// $C41FC5
immutable ushort[13] UnknownC41FC5 = [
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
immutable ushort[16] UnknownC41FDF = [
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
FixedPoint1616 UnknownC41FFF(short arg1, short arg2) {
	short a;
	if (UnknownC4205D[((arg1 >> 8) & 0xFC) >> 2] == 0x100) {
		a = arg2;
	} else {
		a = UnknownC4213F(UnknownC4205D[((arg1 >> 8) & 0xFC) >> 2], arg2);
	}
	short a2;
	if (UnknownC420BD[((arg1 >> 8) & 0xFC)] == 0x100) {
		a2 = arg2;
	} else {
		a2 = UnknownC4213F(UnknownC420BD[((arg1 >> 8) & 0xFC)], arg2);
	}
	if ((((arg1 >> 8) & 0xFC) < 0x20) || (((arg1 >> 8) & 0xFC) >= 0x62)) {
		a2 = cast(short)-cast(int)a2;
	}
	if ((((arg1 >> 8) & 0xFC) >= 0x4C) && (((arg1 >> 8) & 0xFC) < 0x80)) {
		a = cast(short)-cast(int)a;
	}
	return FixedPoint1616(a2, a);
}

/// $C4205D
immutable ushort[48] UnknownC4205D = [
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
];

/// $C420BD
immutable ushort[65] UnknownC420BD = [
	0x0100,
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
	0x0100,
];

/// $C4213F
short UnknownC4213F(short arg1, short arg2) {
	return cast(short)((((arg2 & 0xFF00) >> 8) * (arg1 & 0xFF)) + ((arg2 & 0xFF) * (arg1 & 0xFF) >> 8));
}

/// $C423DC
void UnknownC423DC() {
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
void UnknownC4240A() {
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
void UnknownC42439(short arg1) {
	CGADSUB = cast(ubyte)arg1;
	FIXED_COLOUR_DATA = Unknown7E9E37 | 0x80;
	FIXED_COLOUR_DATA = Unknown7E9E38 | 0x40;
	FIXED_COLOUR_DATA = Unknown7E9E39 | 0x20;
}

/// $C4245D
void UnknownC4245D(ubyte* arg1) {
	DMAChannels[4].DMAP = 1;
	DMAChannels[4].BBAD = 0x26;
	DMAChannels[4].A1T = arg1;
	WOBJSEL = 0xA0;
	HDMAEN_MIRROR |= 0x10;
}

/// $C4248A
void UnknownC4248A() {
	HDMAEN_MIRROR &= ~0x10;
	WOBJSEL = 0;
}

/// $C4249A
void UnknownC4249A(ubyte arg1, ubyte arg2) {
	CGADSUB = arg1;
	WOBJSEL = 0x20;
	WH0 = 0;
	WH1 = 0xFF;
	TMW = 0x13;
	WBGLOG = 0;
	WOBJLOG = 0;
	CGWSEL = 0x10;
	COLDATA = arg2 | 0xE0;
}

/// $C424D1
void UnknownC424D1() {
	WOBJSEL = 0x20;
	WH0 = 0x80;
	WH1 = 0x7F;
	TMW = 0x13;
	WBGLOG = 0;
	WOBJLOG = 0;
	CGWSEL = 0x20;
	CGADSUB = 0xB3;
	COLDATA = 0xEF;
}

/// $C42542
void UnknownC42542(ubyte* arg1) {
	DMAChannels[4].DMAP = 1;
	DMAChannels[4].BBAD = 0x26;
	DMAChannels[4].A1T = arg1;
	HDMAEN_MIRROR |= 0x10;
}

/// $C4257F
void UnknownC4257F() {
	HDMAEN_MIRROR &= ~0x10;
}

/// $C4258C
void UnknownC4258C() {
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
	COLDATA = 0xEF;
}

/// $C425CC
void UnknownC425CC(ubyte* arg1) {
	DMAChannels[4].DMAP = 1;
	DMAChannels[4].BBAD = 0x26;
	DMAChannels[4].A1T = arg1;
	HDMAEN_MIRROR |= 0x10;
}

/// $C425F3
void UnknownC425F3() {
	HDMAEN_MIRROR &= ~0x10;
}

/// $C425FD
void UnknownC425FD(ubyte* arg1) {
	DMAChannels[5].DMAP = 1;
	DMAChannels[5].BBAD = 0x28;
	DMAChannels[5].A1T = arg1;
	HDMAEN_MIRROR |= 0x20;
}

/// $C42624
void UnknownC42624() {
	HDMAEN_MIRROR &= ~0x20;
}

/// $C42631
void UnknownC42631(short arg1, short arg2) {
	Unknown7E3C22 = 0;
	Unknown7E3C24 = 0;
	Unknown7E3C26 = 0;
	Unknown7E3C28 = 0;
	short a = CosineSine(arg1, cast(ubyte)(arg2 - 128));
	Unknown7E3C22 = cast(short)((a & 0xFF) << 8);
	Unknown7E3C24 = (cast(ushort)a & 0xFF00) >> 8;
	if (a < 0) {
		Unknown7E3C24 |= 0xFF00;
	}
	a = Cosine(arg1, cast(ubyte)(arg2 - 128));
	Unknown7E3C26 = cast(short)((a & 0xFF) << 8);
	Unknown7E3C28 = (cast(ushort)a & 0xFF00) >> 8;
	if (a < 0) {
		Unknown7E3C28 |= 0xFF00;
	}
	Unknown7E3C2C = BG1_X_POS;
	Unknown7E3C30 = BG1_Y_POS;
	Unknown7E3C2A = 0;
	Unknown7E3C2E = 0;
}

/// $C4268A
void UnknownC4268A() {
	Unknown7E3C2A += Unknown7E3C22;
	Unknown7E3C2C += Unknown7E3C24;
	BG1_X_POS = Unknown7E3C2C;
	BG2_X_POS = Unknown7E3C2C;
	Unknown7E3C2E += Unknown7E3C26;
	Unknown7E3C30 += Unknown7E3C28;
	BG1_Y_POS = Unknown7E3C30;
	BG2_Y_POS = Unknown7E3C30;
	UnknownC01731(BG1_X_POS, BG1_Y_POS);
}

/// $C426C7
void UnknownC426C7() {
	for (short i = 0; i != MAX_ENTITIES; i++) {
		if (EntityScriptTable[i] < 0) {
			continue;
		}
		EntityScreenXTable[i] = cast(short)(EntityAbsXTable[i] - BG1_X_POS);
		EntityScreenYTable[i] = cast(short)(EntityAbsYTable[i] - BG1_Y_POS);
	}
}

/// $C426ED - Palette animation
void UnknownC426ED() {
	// Use ushort addition instead of byte addition since we need carrying
	// At that point, it's easier to just use 7F0000 as ushort everywhere
	ushort* Word7F0000 = cast(ushort*)(&Unknown7F0000[0]);
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
	Unknown7E0030 = 0x18;
}

/// $C4283F
void UnknownC4283F(short arg1, ubyte* arg2, short arg3) {
	//original code adjusted for the fact that the lower 4 bits were used as flags, but we separated them
	const(ubyte)* x00 = &EntityGraphicsPointers[arg1][SpriteDirectionMappings8Direction[EntityDirections[arg1]] + EntityAnimationFrames[arg1]].data[0];
	//UNKNOWN_30X2_TABLE_31 has the bank bytes but we don't need those
	do {
		(cast(ushort*)&arg2[0])[arg3] = (cast(ushort*)x00)[arg3];
	} while (--arg3 > 0);
}

/// $C42884
void UnknownC42884(short arg1, ubyte* arg2, short arg3) {
	OverworldSpriteGraphics* x00 = &EntityGraphicsPointers[arg1][0];
	if (SpriteDirectionMappings4Direction[EntityDirections[arg1]] != 0) {
		for (short i = SpriteDirectionMappings4Direction[EntityDirections[arg1]]; i != 0; i--) {
			x00++;
		}
	}
	//UNKNOWN_30X2_TABLE_31 has the bank bytes but we don't need those
	//original code adjusted for the fact that the lower 4 bits were used as flags, but we separated them
	const(ubyte)* x00_2 = &x00.data[0];
	do {
		(cast(ushort*)&arg2[0])[arg3] = (cast(ushort*)x00_2)[arg3];
	} while (--arg3 > 0);
}

/// $C428D1
void UnknownC428D1(ushort* arg1, ushort* arg2, short arg3, short arg4) {
	short x = cast(short)(arg4 * 2);
	short y = arg3;
	do {
		arg1[y / 2] = arg2[y / 2];
		y += 16;
	} while (--x != 0);
}

/// $C428FC
void UnknownC428FC(ushort* arg1, ushort* arg2, short arg3, short arg4, short arg5) {
	ushort x08 = UnknownC42955[arg3 & 7];
	ushort x0A = 0xFFFF ^ UnknownC42955[arg3 & 7];
	short y = cast(short)((arg3 & 0xFFF8) * 4);
	short x0E = arg4 / 8;
	do {
		short x = 16;
		short tmp = y;
		do {
			arg1[y / 2] = (arg1[y / 2] & x0A) | (arg2[y / 2] & x08);
			y += 2;
		} while (--x != 0);
		y = cast(short)(tmp + arg5);
	} while (--x0E != 0);
}

/// $C428FC
void UnknownC42965(ushort* arg1, ushort* arg2, short arg3, short arg4) {
	ushort x08 = UnknownC42955[arg4];
	ushort x0A = x08 ^ 0xFFFF;
	ushort x0C = arg2[arg3] & x08;
	arg1[arg3] = (arg1[arg3] & x0A) | x0C;
	arg3 += 16;
	x0C = arg2[arg3] & x08;
	arg1[arg3] = (arg1[arg3] & x0A) | x0C;
}

/// $C42955
immutable ushort[8] UnknownC42955 = [
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
void UnknownC429AE(const(void)* arg1, short arg2) {
	//pushed arg1
	short x00 = EntityTileHeights[arg2];
	Unknown7E0091 = 0;
	DMA_COPY_SIZE = EntityByteWidths[arg2];
	DMA_COPY_RAM_SRC = arg1;
	DMA_COPY_VRAM_DEST = EntityVramAddresses[arg2];
	while (true) {
		UnknownC0A56E();
		if (--x00 == 0) {
			break;
		}
		DMA_COPY_RAM_SRC += DMA_COPY_SIZE;
	}
}

/// $C429E8
void UnknownC429E8(short channel) {
	//segmented addressing stuff
	//DMAChannels[channel].A1B = 0x7E;
	//DMAChannels[channel].DASB = 0x7E;
	DMAChannels[channel].BBAD = 0x2C;
	DMAChannels[channel].DMAP = DMATransferUnit.Word;
	DMAChannels[channel].A1T = &Unknown7EADB8[0];
	HDMAEN_MIRROR |= DMAFlags[channel];

}

/// $C42A1F
immutable short[17] UnknownC42A1F = [
	0x0008,
	0x0008,
	0x000C,
	0x0010,
	0x0018,
	0x0008,
	0x000C,
	0x0008,
	0x0010,
	0x0018,
	0x000C,
	0x0008,
	0x0010,
	0x0018,
	0x0020,
	0x0020,
	0x0020,
];

/// $C42A41
immutable short[17] UnknownC42A41 = [
	0x0008,
	0x0008,
	0x0008,
	0x0008,
	0x0008,
	0x0018,
	0x0018,
	0x0018,
	0x0018,
	0x0018,
	0x0020,
	0x0028,
	0x0028,
	0x0028,
	0x0028,
	0x0038,
	0x0048,
];

/// $C42A63
immutable short[17] UnknownC42A63 = [
	0x0010,
	0x0010,
	0x0020,
	0x0020,
	0x0030,
	0x0010,
	0x0018,
	0x0010,
	0x0020,
	0x0030,
	0x0018,
	0x0010,
	0x0020,
	0x0030,
	0x0040,
	0x0040,
	0x0040,
];

/// $C42AA7
immutable short[17] UnknownC42AA7 = [
	0x0002,
	0x0000,
	0x0002,
	0x0004,
	0x0006,
	0x0002,
	0x0003,
	0x0002,
	0x0004,
	0x0006,
	0x0000,
	0x0002,
	0x0004,
	0x0006,
	0x0008,
	0x0000,
	0x0006,
];

/// $C42AEB
immutable short[17] UnknownC42AEB = [
	0x000A,
	0x0000,
	0x000A,
	0x000A,
	0x000A,
	0x0018,
	0x0018,
	0x0018,
	0x0010,
	0x0010,
	0x0000,
	0x0028,
	0x0020,
	0x0020,
	0x0020,
	0x0000,
	0x0041,
];

/// $C42AC9
immutable short[17] UnknownC42AC9 = [
	0x0001,
	0x0000,
	0x0001,
	0x0001,
	0x0001,
	0x0001,
	0x0001,
	0x0001,
	0x0002,
	0x0002,
	0x0000,
	0x0001,
	0x0002,
	0x0002,
	0x0002,
	0x0000,
	0x0002,
];

/// $C42B0D
immutable UnknownC42B0DEntry[17] UnknownC42B0D = [
	UnknownC42B0DEntry(1, 0, [
			[UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xF8, 0x80), UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0xF8, 0x80)],
		]
	),
	UnknownC42B0DEntry(1, 0, [
			[UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xF8, 0x80), UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0xF8, 0x80)],
		]
	),
	UnknownC42B0DEntry(2, 0, [
			[UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0x04, 0x80)],
			[UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xEC, 0x80)],
		]
	),
	UnknownC42B0DEntry(2, 0, [
			[UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0x00, 0x80)],
			[UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xF0, 0x80)],
		]
	),
	UnknownC42B0DEntry(3, 0, [
			[UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xE8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0xF8, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x04, 0x00, 0x08, 0x80), UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0x08, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x04, 0x40, 0xE8, 0x80)],
		]
	),
	UnknownC42B0DEntry(2, 1, [
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0xF8, 0x80)],
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xF8, 0x80)],
		]
	),
	UnknownC42B0DEntry(4, 2, [
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x00, 0x04, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x04, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x00, 0x04, 0x80)],
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x40, 0xEC, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x04, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x40, 0xEC, 0x80)],
		]
	),
	UnknownC42B0DEntry(2, 1, [
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0xF8, 0x80)],
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xF8, 0x80)],
		]
	),
	UnknownC42B0DEntry(4, 2, [
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x00, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x04, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x00, 0x00, 0x80)],
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x40, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x04, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x40, 0xF0, 0x80)],
		]
	),
	UnknownC42B0DEntry(6, 3, [
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xE8, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x00, 0xF8, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x04, 0x00, 0x08, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x00, 0xE8, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x08, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0A, 0x00, 0x08, 0x80)],
			[UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0x08, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x40, 0xF8, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x04, 0x40, 0xE8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x40, 0x08, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x08, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0A, 0x40, 0xE8, 0x80)],
		]
	),
	UnknownC42B0DEntry(6, 4, [
			[UnknownC42B0DSubEntry(0xE0, 0x00, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xE0, 0x02, 0x00, 0x04, 0x00)],
			[UnknownC42B0DSubEntry(0xF0, 0x04, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xF0, 0x06, 0x00, 0x04, 0x00)],
			[UnknownC42B0DSubEntry(0x00, 0x08, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0x00, 0x0A, 0x00, 0x04, 0x80)],
			[UnknownC42B0DSubEntry(0xE0, 0x00, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xE0, 0x02, 0x40, 0xEC, 0x00)],
			[UnknownC42B0DSubEntry(0xF0, 0x04, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xF0, 0x06, 0x40, 0xEC, 0x00)],
			[UnknownC42B0DSubEntry(0x00, 0x08, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0x00, 0x0A, 0x40, 0xEC, 0x80)],
		]
	),
	UnknownC42B0DEntry(3, 2, [
			[UnknownC42B0DSubEntry(0xD8, 0x00, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x00, 0xF8, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x04, 0x00, 0xF8, 0x80), UnknownC42B0DSubEntry(0xD8, 0x00, 0x40, 0xF8, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x02, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x04, 0x40, 0xF8, 0x80)],
		]
	),
	UnknownC42B0DEntry(6, 4, [
			[UnknownC42B0DSubEntry(0xD8, 0x00, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x00, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x04, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x06, 0x00, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x08, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0A, 0x00, 0x00, 0x80)],
			[UnknownC42B0DSubEntry(0xD8, 0x00, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x40, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x04, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x06, 0x40, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x08, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0A, 0x40, 0xF0, 0x80)],
		]
	),
	UnknownC42B0DEntry(9, 6, [
			[UnknownC42B0DSubEntry(0xD8, 0x00, 0x00, 0xE8, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x00, 0xF8, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x04, 0x00, 0x08, 0x00), UnknownC42B0DSubEntry(0xE8, 0x06, 0x00, 0xE8, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x08, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0A, 0x00, 0x08, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x0C, 0x00, 0xE8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0E, 0x00, 0xF8, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x10, 0x00, 0x08, 0x80), UnknownC42B0DSubEntry(0xD8, 0x00, 0x40, 0x08, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x02, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xD8, 0x04, 0x40, 0xE8, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x06, 0x40, 0x08, 0x00), UnknownC42B0DSubEntry(0xE8, 0x08, 0x40, 0xF8, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x0A, 0x40, 0xE8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0C, 0x40, 0x08, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x0E, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x10, 0x40, 0xE8, 0x80)],
		]
	),
	UnknownC42B0DEntry(12, 8, [
			[UnknownC42B0DSubEntry(0xD8, 0x00, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x04, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xD8, 0x06, 0x00, 0x10, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x08, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0A, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x0C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0E, 0x00, 0x10, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x10, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x12, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x14, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x16, 0x00, 0x10, 0x80)],
			[UnknownC42B0DSubEntry(0xD8, 0x00, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x04, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x06, 0x40, 0xE0, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x08, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0A, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x0C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0E, 0x40, 0xE0, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x10, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xF8, 0x12, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x14, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x16, 0x40, 0xE0, 0x80)],
		]
	),
	UnknownC42B0DEntry(16, 8, [
			[UnknownC42B0DSubEntry(0xC8, 0x00, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xC8, 0x02, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xC8, 0x04, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xC8, 0x06, 0x00, 0x10, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x08, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x0A, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x0C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xD8, 0x0E, 0x00, 0x10, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x10, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x12, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x14, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x16, 0x00, 0x10, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x18, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x1A, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x1C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x1E, 0x00, 0x10, 0x80)],
			[UnknownC42B0DSubEntry(0xC8, 0x00, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xC8, 0x02, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xC8, 0x04, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xC8, 0x06, 0x40, 0xE0, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x08, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xD8, 0x0A, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x0C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x0E, 0x40, 0xE0, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x10, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xE8, 0x12, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x14, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x16, 0x40, 0xE0, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x18, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xF8, 0x1A, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x1C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x1E, 0x40, 0xE0, 0x80)],
		]
	),
	UnknownC42B0DEntry(20, 8, [
			[UnknownC42B0DSubEntry(0xB8, 0x00, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xB8, 0x02, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xB8, 0x04, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xB8, 0x06, 0x00, 0x10, 0x00)],
			[UnknownC42B0DSubEntry(0xC8, 0x08, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xC8, 0x0A, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xC8, 0x0C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xC8, 0x0E, 0x00, 0x10, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x10, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x12, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x14, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xD8, 0x16, 0x00, 0x10, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x18, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x1A, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x1C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x1E, 0x00, 0x10, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x20, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x22, 0x00, 0xF0, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x24, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x26, 0x00, 0x10, 0x80)],
			[UnknownC42B0DSubEntry(0xB8, 0x00, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xB8, 0x02, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xB8, 0x04, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xB8, 0x06, 0x40, 0xE0, 0x00)],
			[UnknownC42B0DSubEntry(0xC8, 0x08, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xC8, 0x0A, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xC8, 0x0C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xC8, 0x0E, 0x40, 0xE0, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x10, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xD8, 0x12, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xD8, 0x14, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x16, 0x40, 0xE0, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x18, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xE8, 0x1A, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xE8, 0x1C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x1E, 0x40, 0xE0, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x20, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xF8, 0x22, 0x40, 0x00, 0x00)],
			[UnknownC42B0DSubEntry(0xF8, 0x24, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x26, 0x40, 0xE0, 0x80)],
		]
	)
];

/// $C42F45
void SetPartyTickCallbacks(short leaderEntityID, void function() leaderCallback, void function() partyCallback) {
	EntityTickCallbacks[leaderEntityID] = leaderCallback;
	for (int i = 6; i > 0; i--) {
		EntityTickCallbacks[leaderEntityID++] = partyCallback;
	}
}

/// $C42F64
immutable ubyte[][10] MapDataTileTableChunksTable = [
	cast(immutable(ubyte)[])import("maps/tiles/chunk_01.bin"),
	cast(immutable(ubyte)[])import("maps/tiles/chunk_02.bin"),
	cast(immutable(ubyte)[])import("maps/tiles/chunk_03.bin"),
	cast(immutable(ubyte)[])import("maps/tiles/chunk_04.bin"),
	cast(immutable(ubyte)[])import("maps/tiles/chunk_05.bin"),
	cast(immutable(ubyte)[])import("maps/tiles/chunk_06.bin"),
	cast(immutable(ubyte)[])import("maps/tiles/chunk_07.bin"),
	cast(immutable(ubyte)[])import("maps/tiles/chunk_08.bin"),
	cast(immutable(ubyte)[])import("maps/tiles/chunk_09.bin"),
	cast(immutable(ubyte)[])import("maps/tiles/chunk_10.bin"),
];

/// $C42F8C
immutable ushort[88] UnknownC42F8C = [
	0x0000,
	0x0020,
	0x0040,
	0x0060,
	0x0080,
	0x00A0,
	0x00C0,
	0x00E0,
	0x0200,
	0x0220,
	0x0240,
	0x0260,
	0x0280,
	0x02A0,
	0x02C0,
	0x02E0,
	0x0400,
	0x0420,
	0x0440,
	0x0460,
	0x0480,
	0x04A0,
	0x04C0,
	0x04E0,
	0x0600,
	0x0620,
	0x0640,
	0x0660,
	0x0680,
	0x06A0,
	0x06C0,
	0x06E0,
	0x0800,
	0x0820,
	0x0840,
	0x0860,
	0x0880,
	0x08A0,
	0x08C0,
	0x08E0,
	0x0A00,
	0x0A20,
	0x0A40,
	0x0A60,
	0x0A80,
	0x0AA0,
	0x0AC0,
	0x0AE0,
	0x0C00,
	0x0C20,
	0x0C40,
	0x0C60,
	0x0C80,
	0x0CA0,
	0x0CC0,
	0x0CE0,
	0x0E00,
	0x0E20,
	0x0E40,
	0x0E60,
	0x0E80,
	0x0EA0,
	0x0EC0,
	0x0EE0,
	0x1000,
	0x1020,
	0x1040,
	0x1060,
	0x1080,
	0x10A0,
	0x10C0,
	0x10E0,
	0x1200,
	0x1220,
	0x1240,
	0x1260,
	0x1280,
	0x12A0,
	0x12C0,
	0x12E0,
	0x1400,
	0x1420,
	0x1440,
	0x1460,
	0x1480,
	0x14A0,
	0x14C0,
	0x14E0,
];

/// $C4303C
immutable ushort[88] UnknownC4303C = [
	0x0000,
	0x0002,
	0x0004,
	0x0006,
	0x0008,
	0x000A,
	0x000C,
	0x000E,
	0x0020,
	0x0022,
	0x0024,
	0x0026,
	0x0028,
	0x002A,
	0x002C,
	0x002E,
	0x0040,
	0x0042,
	0x0044,
	0x0046,
	0x0048,
	0x004A,
	0x004C,
	0x004E,
	0x0060,
	0x0062,
	0x0064,
	0x0066,
	0x0068,
	0x006A,
	0x006C,
	0x006E,
	0x0080,
	0x0082,
	0x0084,
	0x0086,
	0x0088,
	0x008A,
	0x008C,
	0x008E,
	0x00A0,
	0x00A2,
	0x00A4,
	0x00A6,
	0x00A8,
	0x00AA,
	0x00AC,
	0x00AE,
	0x00C0,
	0x00C2,
	0x00C4,
	0x00C6,
	0x00C8,
	0x00CA,
	0x00CC,
	0x00CE,
	0x00E0,
	0x00E2,
	0x00E4,
	0x00E6,
	0x00E8,
	0x00EA,
	0x00EC,
	0x00EE,
	0x0100,
	0x0102,
	0x0104,
	0x0106,
	0x0108,
	0x010A,
	0x010C,
	0x010E,
	0x0120,
	0x0122,
	0x0124,
	0x0126,
	0x0128,
	0x012A,
	0x012C,
	0x012E,
	0x0140,
	0x0142,
	0x0144,
	0x0146,
	0x0148,
	0x014A,
	0x014C,
	0x014E,
];

/// $C430EC
void VelocityStore() {
	for (short i = 0; i < 14; i++) {
		horizontalMovementSpeeds[i].down.combined = 0;
		horizontalMovementSpeeds[i].up.combined = 0;
		verticalMovementSpeeds[i].left.combined = 0;
		verticalMovementSpeeds[i].right.combined = 0;
		verticalMovementSpeeds[i].down.combined = 0;
		horizontalMovementSpeeds[i].right.combined = 0;

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
void UnknownC432B1() {
	for (short i = 0; i < 0x1E; i++) {
		EntitySurfaceFlags[i] = 0;
	}
	for (short i = 0; i < 6; i++) {
		for (short j = 0; j < 7; j++) {
			PartyCharacters[i].afflictions[j] = 0;
		}
	}
	gameState.partyStatus = 0;
}

/// $C43317
void UnknownC43317() {
	for (short i = 0; i < 6; i++) {
		ChosenFourPtrs[i] = &PartyCharacters[i];
	}
}

/// $C43344
void UnknownC43344(short arg1) {
	OverworldStatusSuppression = arg1;
}

/// $C4334A
void UnknownC4334A(short arg1) {
	short x10 = cast(short)(UnknownC3E230[arg1] + gameState.leaderX.integer / 8);
	short x04 = cast(short)((arg1 == 4) ? (UnknownC3E240[arg1] + (gameState.leaderY.integer + 1) / 8) :(UnknownC3E240[arg1] + gameState.leaderY.integer / 8));
	if ((UnknownC05CD7(cast(short)(x10 * 8), cast(short)(x04 * 8), gameState.currentPartyMembers, arg1) & 0x82) == 0x82) {
		x10 += UnknownC3E230[arg1];
		x04 += UnknownC3E240[arg1];
	}
	short x = UnknownC07477(x10, x04);
	if (x == 0xFF) {
		x = UnknownC07477(cast(short)(x10 + 1), x04);
	}
	if (x == 0xFF) {
		x = UnknownC07477(cast(short)(x10 - 1), x04);
	}
	if ((x != 0xFF) && (x == 5)) {
		Unknown7E5DDC = Unknown7E5DBE;
		//Unknown7E5DDE = doorData[Unknown7E5DBC & 0x7FFF]

		Unknown7E5DDE = &Unknown7E5DBC.entryA.textPtr[0];
		CurrentTPTEntry = -2;
	}
}

/// $C4343E
void UnknownC4343E(short arg1) {
	arg1--;
	ushort x12;
	if (60000 > Timer / 3600) {
		x12 = cast(ushort)(Timer / 3600);
	} else {
		x12 = 59999;
	}
	gameState.savedPhotoStates[arg1].unknown = x12;
	for (short i = 0; i < 6; i++) {
		if (gameState.unknown96[i] == 0xFF) {
			gameState.savedPhotoStates[arg1].partyMembers[i] = 0;
		} else {
			Unknown7E4DC6 = &PartyCharacters[gameState.playerControlledPartyMembers[i]];
			short x0E = gameState.unknown96[i];
			if ((PartyCharacters[gameState.playerControlledPartyMembers[i]].afflictions[0] == Status0.Unconscious)) {
				x0E |= 0x20;
			}
			if ((PartyCharacters[gameState.playerControlledPartyMembers[i]].afflictions[0] == Status0.Diamondized)) {
				x0E |= 0x40;
			}
			if ((PartyCharacters[gameState.playerControlledPartyMembers[i]].afflictions[1] == Status1.Mushroomized)) {
				x0E |= 0x80;
			}
			gameState.savedPhotoStates[arg1].partyMembers[i] = cast(ubyte)x0E;
		}
	}
}

/// $C43550
immutable ubyte[6][4] ItemUseMenuStrings = [
	EBString!6("Use"),
	EBString!6("Give"),
	EBString!6("Drop"),
	EBString!6("Help!"),
];

/// $C43568
void UnknownC43568() {
	WaitUntilNextFrame();
	UnknownC2DB3F();
}

/// $C43573
void UnknownC43573(short arg1) {
	if (BattleMenuCurrentCharacterID != -1) {
		UnknownC3E6F8();
	}
	BattleMenuCurrentCharacterID = arg1;
	WaitUntilNextFrame();
	ushort* x = &Unknown7E847E[16 - ((gameState.playerControlledPartyMemberCount * 7) / 2) + (arg1 * 7)];
	for (short i = 7; i != 0; i--) {
		*(x++) = 0;
	}
	Unknown7E9623 = 1;
}

/// $C435E4
void UnknownC435E4() {
	if (Unknown7E89CE == -1) {
		return;
	}
	for (short i = 0; i < (Unknown7E89CE != 0) ? Unknown7EAD58 : Unknown7EAD56; i++) {
		if (Unknown7E89CE != 0) {
			BattlersTable[Unknown7EAD82[i]].unknown74 = 0;
		} else {
			BattlersTable[Unknown7EAD7A[i]].unknown74 = 0;
		}
	}
	Unknown7EADA2 = 0;
	Unknown7E89CE = -1;
	Unknown7E9623 = 1;
}

/// $C43657
void UnknownC43657(short arg1) {
	if (Unknown7E89CE != -1) {
		UnknownC435E4();
	}
	Unknown7E89CE = arg1;
	for (short i = 0; i < (Unknown7E89CE != 0) ? Unknown7EAD58 : Unknown7EAD56; i++) {
		if (Unknown7E89CE != 0) {
			BattlersTable[Unknown7EAD82[i]].unknown74 = 1;
		} else {
			BattlersTable[Unknown7EAD7A[i]].unknown74 = 1;
		}
	}
	Unknown7EADA2 = 1;
	Unknown7E9623 = 1;
}

/// $C436D7
void UnknownC436D7(short arg1, short arg2) {
	ushort* x0E = &WindowStats[WindowTable[arg1]].tilemapBuffer[WindowStats[WindowTable[arg1]].width * arg2 * 2];
	for (short i = 0; i != WindowStats[WindowTable[arg1]].width * 2; i++) {
		*(x0E++) = 0x40;
	}
}

/// $C43739
void UnknownC43739(short arg1) {
	ushort* x10 = &WindowStats[WindowTable[arg1]].tilemapBuffer[(WindowStats[WindowTable[arg1]].width * WindowStats[WindowTable[arg1]].text_y * 2)];
	for (short i = 0; i != WindowStats[WindowTable[arg1]].width * 2; i++) {
		UnknownC44AF7((x10++)[0]);
	}
	UnknownC436D7(arg1, WindowStats[WindowTable[arg1]].text_y);
}

/// $C437B8
void UnknownC437B8(short arg1) {
	ushort* x14 = &WindowStats[WindowTable[arg1]].tilemapBuffer[0];
	ushort* x12 = &WindowStats[WindowTable[arg1]].tilemapBuffer[0];
	ushort* x04 = &WindowStats[WindowTable[arg1]].tilemapBuffer[WindowStats[WindowTable[arg1]].width * 2];
	for (short i = 0; i != WindowStats[WindowTable[arg1]].width * 2; i++) {
		UnknownC44AF7(*(x14++));
	}
	for (short i = 0; i != (WindowStats[WindowTable[arg1]].height - 2) * WindowStats[WindowTable[arg1]].width; i++) {
		*(x12++) = *(x04++);
	}
	UnknownC436D7(arg1, (WindowStats[WindowTable[arg1]].height / 2) - 1);
}

/// $C438B1
void PrintNewLine() {
	if (CurrentFocusWindow == -1) {
		return;
	}
	UnknownC45E96();
	if (WindowStats[WindowTable[CurrentFocusWindow]].font != 0) {
		UnknownC45E96();
	}
	if (WindowStats[WindowTable[CurrentFocusWindow]].text_y != (WindowStats[WindowTable[CurrentFocusWindow]].height / 2) - 1) {
		WindowStats[WindowTable[CurrentFocusWindow]].text_y++;
	}
	UnknownC437B8(CurrentFocusWindow);
	WindowStats[WindowTable[CurrentFocusWindow]].text_x = 0;
}

/// $C43B15 - Unknown, but looks like it resets the color of existing text in the focused window
void UnknownC43B15() {
	WinStat* x12 = &WindowStats[WindowTable[CurrentFocusWindow]];
	ushort* y = &x12.tilemapBuffer[x12.width * x12.text_y * 2];
	ushort x0E;
	for (x0E = cast(ushort)(x12.width - 1); y[x0E] == 0x40; x0E--) {}
	ushort x12_2 = x12.text_x;
	ushort* x = &y[x12_2];
	while (x12_2 < (x0E + 1)) {
		x[0] = (x[0] & 0x3FF) | x12.tileAttributes;
		x[x12.width] = (x[x12.width] & 0x3FF) | x12.tileAttributes;
		x++;
		x12_2++;
	}
}

/// $C43874
void UnknownC43874(short arg1, short arg2, short arg3) {
	UnknownC43CAA();
	WindowStats[WindowTable[arg1]].text_x = arg2;
	WindowStats[WindowTable[arg1]].text_y = arg3;
}

/// $C438A5
void UnknownC438A5(short arg1, short arg2) {
	UnknownC43874(CurrentFocusWindow, arg1, arg2);
}

/// $C43915
immutable ubyte[0x400] UnknownC43915 = [0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

/// $C43BB9 - Unknown, but looks like it prints optionally highlighted text
void UnknownC43BB9(short maxLength, short highlighted, ubyte* text) {
	if (WindowTable[CurrentFocusWindow] == -1) {
		return;
	}
	if ((CurrentFocusWindow != 0x18) && (CurrentFocusWindow != 0x19) && (CurrentFocusWindow != 0x14) && (CurrentFocusWindow != 0x24)) {
		return;
	}
	WinStat* x14 = &WindowStats[WindowTable[CurrentFocusWindow]];
	short x12 = WindowStats[WindowTable[CurrentFocusWindow]].tileAttributes;
	short x10 = WindowStats[WindowTable[CurrentFocusWindow]].text_x;
	ushort* x04 = &WindowStats[WindowTable[CurrentFocusWindow]].tilemapBuffer[WindowStats[WindowTable[CurrentFocusWindow]].text_y * WindowStats[WindowTable[CurrentFocusWindow]].width * 2 + x10];
	while ((*text != 0) && (maxLength != 0)) {
		if (*x04 == 0x40) {
			break;
		}
		if (highlighted != 0) {
			UnknownEF00E6(x04, x14.width, x12);
		} else {
			UnknownEF00BB(x04, x14.width, x12);
		}
		x10++;
		x04++;
		text++;
		maxLength--;
	}
	x14.text_x = x10;
	InstantPrinting = 0;
}

/// $C43CAA
void UnknownC43CAA() {
	if (++VWFTile > 0x33) {
		VWFTile = 0;
		VWFX = 0;
	} else {
		VWFX = cast(ushort)(VWFTile * 8);
	}
	Unknown7E9652.unknown2 = 0;
	Unknown7E9652.unknown0 = VWFX;
}

/// $C43CD2 - Set text position on focused window (for menu options)
void UnknownC43CD2(MenuOpt* opt, short x, short y) {
	UnknownC438A5F(x, y);
	if (opt.pixel_align != 0) {
		VWFX += opt.pixel_align;
		memset(&VWFBuffer[VWFTile][0], 0xFF, 0x20);
	}
	Unknown7E5E79 = 0;
}

/// $C43D95
void UnknownC43D95(short arg1) {
	arg1 += (WindowStats[WindowTable[CurrentFocusWindow]].text_x * 8);
	UnknownC43D75(cast(short)(arg1 + Unknown7E5E73), WindowStats[WindowTable[CurrentFocusWindow]].text_y);
}

/// $C43DDB
void UnknownC43DDB(MenuOpt* menuEntry) {
	UnknownC438A5F(menuEntry.text_x, menuEntry.text_y);
	UnknownC43F77(0x2F);
	UnknownC43CAA();
	if (menuEntry.pixel_align != 0) {
		UnknownC43CD2(menuEntry, menuEntry.text_x, menuEntry.text_y);
	}
}

/// $C43D24
void UnknownC43D24(ushort arg1, short arg2) {
	UnknownC438A5F(arg1, arg2);
	if (Unknown7E5E72 == 0) {
		return;
	}
	VWFX += Unknown7E5E72;
	memset(&VWFBuffer[VWFTile][0], 0xFF, 0x20);
	Unknown7E5E73 = Unknown7E5E72;
	Unknown7E5E72 = 0;
}

/// $C43D75
void UnknownC43D75(ushort arg1, short arg2) {
	Unknown7E5E72 = cast(ubyte)(arg1 & 7);
	UnknownC43D24(arg1 / 8, arg2);
}

/// $C43E31
short UnknownC43E31(const(ubyte)* arg1, short arg2) {
	short x12 = 0;
	while ((arg1[0] != 0) && (arg2 != 0)) {
		arg2--;
		x12 += Unknown7E5E6D + (Unknown7EB4CE != 0) ? FontConfigTable[0].data[((arg1++)[0] - EBChar(' ')) & 0x7F] : FontConfigTable[WindowStats[WindowTable[CurrentFocusWindow]].font].data[((arg1++)[0] - EBChar(' ')) & 0x7F];
	}
	return x12;
}

/// $C43EF8
void UnknownC43EF8(const(ubyte)* arg1, short arg2) {
	UnknownC43D75(cast(short)((WindowStats[WindowTable[CurrentFocusWindow]].width * 8 - UnknownC43E31(arg1, arg2)) / 2), WindowStats[WindowTable[CurrentFocusWindow]].text_y);
	Unknown7E5E74 = 0;
}

/// $C43F53
void UnknownC43F53() {
	for (short i = 0; i < 0x20; i++) {
		Unknown7E1AD6[i] = UnknownC20958[i];
	}
}

/// $C43F77
void UnknownC43F77(short arg1) {
	if (CurrentFocusWindow == -1) {
		return;
	}
	int tilemapOffset = WindowStats[WindowTable[CurrentFocusWindow]].text_x +
	                    WindowStats[WindowTable[CurrentFocusWindow]].text_y * WindowStats[WindowTable[CurrentFocusWindow]].width * 2;
	ushort* x0E = &WindowStats[WindowTable[CurrentFocusWindow]].tilemapBuffer[tilemapOffset];
	UnknownC44E4D(x0E[0]);
	UnknownC44E4D(x0E[WindowStats[WindowTable[CurrentFocusWindow]].width]);
	if (arg1 == 0x2F) {
		Unknown7E5E75 = 0;
	}
	UnknownC10BA1F(arg1);
	if (WindowTable[CurrentFocusWindow] != window_tail) {
		Unknown7E9623 = 1;
	}
	short x;
	if (TextSoundMode == 2) {
		x = 1;
	} else if (TextSoundMode == 3) {
		x = 0;
	} else {
		x = 0;
		if (BlinkingTriangleFlag == 0) {
			x = 1;
		}
	}
	if ((x != 0) && (InstantPrinting == 0) && (arg1 != 0x20)) {
		PlaySfx(Sfx.TextPrint);
	}
	if (InstantPrinting == 0) {
		for (short i = cast(short)(SelectedTextSpeed + 1); i != 0; i--) {
			WindowTick();
		}
	}
}

/// $C4406A
short GetCharacterAtCursorPosition(short arg1, short arg2, short arg3) {
	return NameInputWindowSelectionLayoutPointers[arg3][NameEntryGridCharacterOffsetTable[arg2][arg1]];
}

/// $C440B5
void UnknownC440B5(ubyte* arg1, short arg2) {
	memset(&Unknown7E1B6E[0], 0, 0x18);
	short i;
	for (i = 0; (arg1[i] != 0) && (i < arg2); i++, arg1++) {
		Unknown7E1B86[i] = arg1[0];
		Unknown7E1B56[i] = (arg1[0] - EBChar(' ')) & 0x7F;
		Unknown7E1B6E[i] = cast(ubyte)(FontConfigTable[0].data[(arg1[0] - EBChar(' ')) & 0x7F] + Unknown7E5E6D);
		UnknownC44E61(0, arg1[0]);
	}
	Unknown7E9662 = i;
	if (i >= arg2) {
		return;
	}
	Unknown7E1B56[i] = 0x20;
	Unknown7E1B6E[i] = 0x06;
	UnknownC44E61(0, 0x70);
	Unknown7E1B86[i++] = 0;
	if (arg2 - i <= 0) {
		return;
	}
	for (short x02 = cast(short)(arg2 - i); x02 != 0; x02--, i++) {
		Unknown7E1B56[i] = 0x03;
		UnknownC44E61(0, 0x53);
		Unknown7E1B6E[i] = 0x03;
	}
}

/// $C441B7
void UnknownC441B7(short arg1) {
	memset(&VWFBuffer[0][0], 0xFF, 0x680);
	short x02 = 3;
	Unknown7E9662 = 0;
	memset(&Unknown7E1B86[0], 0, 0x18);
	UnknownC44E61(0, 0x70);
	Unknown7E1B56[0] = 0x20;
	for (short i = 1; i < arg1; i++) {
		Unknown7E1B56[i] = cast(ubyte)x02;
		Unknown7E1B6E[i] = cast(ubyte)(FontConfigTable[0].data[x02] + Unknown7E5E6D);
		UnknownC44E61(0, 0x53);
	}
}

/// $C4424A
void UnknownC4424A(short arg1) {
	if (arg1 == 0x70) {
		Unknown7E1B86[Unknown7E9662] = 0;
	} else {
		Unknown7E1B86[Unknown7E9662] = cast(ubyte)arg1;
	}
	Unknown7E1B56[Unknown7E9662] = cast(ubyte)((arg1 - EBChar(' ')) & 0x7F);
	Unknown7E1B6E[Unknown7E9662] = cast(ubyte)(FontConfigTable[0].data[(arg1 - EBChar(' ')) & 0x7F] + Unknown7E5E6D);
}

/// $C442AC
short UnknownC442AC(short arg1, short arg2, short arg3) {
	WaitUntilNextFrame();
	VWFTile = 0;
	VWFX = 0;
	memset(&VWFBuffer[0][0], 0xFF, 0x340);
	Unknown7E9652.unknown2 = 0;
	Unknown7E9652.unknown0 = 0;
	if (arg3 == -1) {
		if (Unknown7E9662 == 0) {
			return 1;
		}
		if (Unknown7E9662 < arg2) {
			UnknownC4424A(0x53);
		}
		Unknown7E9662--;
		UnknownC4424A(0x70);
	} else {
		if (arg2 - 1 < Unknown7E9662) {
			return 0;
		}
		UnknownC4424A(arg3);
		if (++Unknown7E9662 < arg2) {
			UnknownC4424A(0x70);
		}
	}
	WindowStats[WindowTable[CurrentFocusWindow]].text_x = 0;
	for (short i = 0; i < arg2; i++) {
		const(ubyte)* x06 = &FontConfigTable[0].graphics[FontConfigTable[0].height * Unknown7E1B56[i]];
		short j;
		for (j = Unknown7E1B6E[i]; j >= 8; j -= 8) {
			RenderText(8, FontConfigTable[0].width, x06);
			x06 +=FontConfigTable[0].width;
		}
		RenderText(FontConfigTable[0].width, j, x06);
	}
	WindowStats[WindowTable[CurrentFocusWindow]].text_x = 0;
	ushort x04 = 0x7700;
	for (short i = 0; i < WindowStats[WindowTable[CurrentFocusWindow]].width + 1; i++) {
		CopyToVram(0, 0x10, x04, &VWFBuffer[i][0]);
		CopyToVram(0, 0x10, cast(ushort)(x04 + 8), &VWFBuffer[i + 1][0]);
		x04 += 16;
	}
	DMATransferFlag = 1;
	for (short i = 0; i < WindowStats[WindowTable[CurrentFocusWindow]].width + 1; i++) {
		UnknownC44C8C(cast(short)(i * 2 + 0x2E0), cast(short)(i * 2 + 0x2E0 + 1));
	}
	if (WindowTable[CurrentFocusWindow] != window_tail) {
		Unknown7E9623 = 1;
	}
	short x;
	if (TextSoundMode == 2) {
		x = 1;
	} else if (TextSoundMode == 3) {
		x = 0;
	} else {
		x = 0;
		if (BlinkingTriangleFlag == 0) {
			x = 1;
		}
	}
	if ((x != 0) && (InstantPrinting == 0) && (arg3 != 0x20)) {
		PlaySfx(Sfx.TextPrint);
	}
	for (short i = cast(short)(SelectedTextSpeed + 1); i != 0; i--) {
		WindowTick();
	}
	return 0;
}

/// $C444FB
void UnknownC444FB(ubyte* arg1, ushort arg2) {
	UnknownC43CAA();
	ubyte* x0A = arg1;
	for (short i = 0; arg1[0] != 0; i++) {
		RenderText(6, FontConfigTable[3].width, &FontConfigTable[3].graphics[(((arg1++)[0] - EBChar(' ')) & 0x7F) * FontConfigTable[3].height]);
	}
	for (short i = VWFTile; *(x0A++) != 0; i++) {
		CopyToVram(0, 0x10, arg2, &VWFBuffer[i][0]);
		arg2 += 8;
		if (i == 0x33) {
			i = -1;
		}
	}
	WaitUntilNextFrame();
	WaitUntilNextFrame();
}

/// $C445E1
void UnknownC445E1(DisplayTextState* arg1, const(ubyte)* arg2) {
	short x18 = 0;
	const(ubyte)* x14 = arg1.textptr;
	if (CurrentFocusWindow == -1) {
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
		if (a == EBChar(' ') || (a < 0x20)) {
			break;
		}
		Unknown7E9660++;
		 x18 += (a == 0x2F) ? 8 : cast(ubyte)(FontConfigTable[WindowStats[WindowTable[CurrentFocusWindow]].font].data[(a - EBChar(' ')) & 0x7F] + Unknown7E5E6D);
	}
	if (WindowStats[WindowTable[CurrentFocusWindow]].width * 8 < (WindowStats[WindowTable[CurrentFocusWindow]].text_x != 0) ? ((VWFX & 7) + ((WindowStats[WindowTable[CurrentFocusWindow]].text_x - 1) * 8) + x18) : ((VWFX & 7) + x18)) {
		PrintNewLineF();
		Unknown7E5E75 = 1;
	}
}

/// $C447FB
void UnknownC447FB(short length, const(ubyte)* text) {
	short x12 = UnknownC43E31(text, length);
	if ((VWFX & 7) + ((WindowStats[WindowTable[CurrentFocusWindow]].text_x - 1) * 8) + x12 < (WindowStats[WindowTable[CurrentFocusWindow]].width * 8)) {
		PrintNewLineF();
		Unknown7E5E75 = 1;
	}
	PrintStringF(length, text);
}

/// $C4487C
void UnknownC4487C(short arg1, const(ubyte)* arg2) {
	ubyte x00 = 0;
	ubyte* x15 = &Unknown7E9664[0];
	short x12;
	do {
		ubyte x14 = arg2[0];
		x12 = x14;
		x15[x00] = x14;
		arg2++;
		if ((x12 == EBChar(' ')) || (x12 == 0)) {
			if (x12 == EBChar(' ')) {
				x15[x00++] = EBChar(' ');
			}
			x15[x00] = 0;
			UnknownC447FB(-1, x15);
			x00 = 0;
			x15 = &Unknown7E9664[0];
		} else {
			x00++;
		}
	} while (x12 != 0);
}

/// $C44963
void UnknownC44963(short arg1) {
	switch (arg1) {
		case 1:
			CopyToVram(0, 0x1800, 0x7000, &Unknown7F0000[0x2000]);
			goto case;
		case 0:
			CopyToVram(0, 0x450, 0x6000, &Unknown7F0000[0]);
			CopyToVram(0, 0x60, 0x6278, &Unknown7F0000[0x4F0]);
			CopyToVram(0, 0xB0, 0x62F8, &Unknown7F0000[0x5F0]);
			CopyToVram(0, 0xA0, 0x6380, &Unknown7F0000[0x700]);
			CopyToVram(0, 0x10, 0x6400, &Unknown7F0000[0x800]);
			CopyToVram(0, 0x10, 0x6480, &Unknown7F0000[0x900]);
			break;
		case 2:
			CopyToVram(0, 0x450, 0x6000, &Unknown7F0000[0]);
			CopyToVram(0, 0x60, 0x6278, &Unknown7F0000[0x4F0]);
			CopyToVram(0, 0xB0, 0x62F8, &Unknown7F0000[0x5F0]);
			CopyToVram(0, 0xA0, 0x6380, &Unknown7F0000[0x700]);
			CopyToVram(0, 0x10, 0x6400, &Unknown7F0000[0x800]);
			CopyToVram(0, 0x10, 0x6480, &Unknown7F0000[0x900]);
			CopyToVram(0, 0x1800, 0x7000, &Unknown7F0000[0x2000]);
			break;
		default: break;
	}
}

/// $C44AD7
immutable ushort[16] UnknownC44AD7 = [
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
void UnknownC44AF7(short arg1) {
	short x10 = arg1 & 0x3FF;
	if (UnknownC43915[x10] != 0) {
		return;
	}
	Unknown7E1AD6[x10 >> 4] &= UnknownC44AD7[x10 & 0xF];
}

/// $C44B3A
void RenderText(short width, short sizeof_tile, const(ubyte)* gfx_data) {
	short i;
	short new_vwftile;
	short pixel_x = VWFX & 7;
	ubyte* bufptr = &VWFBuffer[VWFTile][0];
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

	VWFX += width;
	if (VWFX >= VWFBuffer.length*8) VWFX -= VWFBuffer.length*8;

	new_vwftile = VWFX >> 3;
	if (new_vwftile == VWFTile) return; /* Bail out if going to write on the same tile */

	/* Well, we're in a new tile now */
	VWFTile = new_vwftile;

	pixel_x = cast(short)(8 - pixel_x);
	bufptr = &VWFBuffer[VWFTile][0];
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
immutable ushort[16] PowersOfTwo16Bit = [
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

deprecated("RenderText") alias UnknownC44B3A = RenderText;

/// $C44C8C
void UnknownC44C8C(short arg1, short arg2) {
	if (CurrentFocusWindow == -1) {
		return;
	}
	if (WindowTable[CurrentFocusWindow] == -1) {
		return;
	}
	short x04 = WindowStats[WindowTable[CurrentFocusWindow]].text_x;
	short x12 = WindowStats[WindowTable[CurrentFocusWindow]].text_y;
	short x10 = WindowStats[WindowTable[CurrentFocusWindow]].tileAttributes;
	ushort* x0E;
	ushort* x16;
	if (x04 == WindowStats[WindowTable[CurrentFocusWindow]].width) {
		x04 = 0;
		if ((WindowStats[WindowTable[CurrentFocusWindow]].height / 2) - 1 != x12) {
			x12++;
		} else {
			if (Unknown7EB49D != 0) {
				goto Unknown15;
			}
			UnknownC437B8F(CurrentFocusWindow);
		}
		if (Unknown7E5E6E != 0) {
			Unknown7E5E75 = 1;
		}
	}
	if ((BlinkingTriangleFlag != 0) && (x04 == 0) && ((arg1 == 0x20) || (arg1 == 0x70))) {
		if (BlinkingTriangleFlag == 1) {
			goto Unknown15;
		}
		if (BlinkingTriangleFlag == 1) {
			arg1 = 0x20;
		}
	}
	x0E = &WindowStats[WindowTable[CurrentFocusWindow]].tilemapBuffer[WindowStats[WindowTable[CurrentFocusWindow]].width * x12 * 2 + x04];
	if (*x0E != 0) {
		UnknownC44E4D(*x0E);
	}
	*x0E = cast(ushort)(((arg1 == 0x22) ? 0xC00 : x10) + arg1);
	x16 = x0E + WindowStats[WindowTable[CurrentFocusWindow]].width;
	if (*x16 != 0) {
		UnknownC44E4D(*x16);
	}
	*x16 = cast(ushort)(((arg2 == 0x22) ? 0xC00 : x10) + arg2);
	x04++;

	Unknown15:
	WindowStats[WindowTable[CurrentFocusWindow]].text_x = x04;
	WindowStats[WindowTable[CurrentFocusWindow]].text_y = x12;
}

/// $C44DCA
void UnknownC44DCA() {
	short x12 = VWFX / 8;
	short x02 = Unknown7E9652.unknown0 / 8;
	short x10 = Unknown7E9652.unknown2;
	if (x10 != 0) {
		UnknownC4002F(x02, x10, Unknown7E9652.unknown4);
	} else {
		x02--;
	}
	while (x02 != x12) {
		short x0E = UnknownC40085();
		Unknown7E9652.unknown2 = x0E;
		short x04 = UnknownC40085();
		Unknown7E9652.unknown4 = x04;
		x02 = (x02 + 1 == 52) ? 0 : cast(short)(x02 + 1);
		UnknownC4002F(x02, x0E, x04);
		UnknownC44C8C(x0E, x04);
	}
	Unknown7E9652.unknown0 = VWFX;
}

/// $C44E44
void UnknownC44E44() {
	Unknown7E9652.unknown2 = 0;
	Unknown7E9652.unknown0 = 0;
}

/// $C44E4D
void UnknownC44E4D(short arg1) {
	if ((arg1 & 0x3FF) == 0x40) {
		return;
	}
	if ((arg1 & 0x3FF) == 0x00) {
		return;
	}
	UnknownC44AF7(arg1);
}

/// $C44E61
void UnknownC44E61(short arg1, short arg2) {
	if (CurrentFocusWindow == -1) {
		return;
	}
	if ((arg2 == 0x2F) || (arg2 == 0x22) || (arg2 == 0x20)) {
		UnknownC43F77(arg2);
		UnknownC43CAA();
	} else {
		if (arg2 == EBChar(' ')) {
			if (Unknown7E5E75 != 0) {
				return;
			}
		} else if (Unknown7E5E75 != 0) {
			WindowStats[WindowTable[CurrentFocusWindow]].text_x = 0;
			if (arg2 != EBChar('@')) {
				UnknownC43D75(6, WindowStats[WindowTable[CurrentFocusWindow]].text_y);
			} else {
				Unknown7E5E75 = 0;
			}
		}
		Unknown7E5E76 = cast(ubyte)arg2;
		const(ubyte)* x14 = &FontConfigTable[arg1].graphics[(arg2 - EBChar(' ')) * FontConfigTable[arg1].height];
		short x12 = FontConfigTable[arg1].data[arg2 - EBChar(' ')] + Unknown7E5E6D;
		if (x12 > 8) {
			while (x12 > 8) {
				RenderText(8, FontConfigTable[arg1].width, x14);
				x12 -= 8;
				x14 +=FontConfigTable[arg1].width;
			}
		}
		RenderText(x12, FontConfigTable[arg1].width, x14);
		UnknownC44DCA();
	}
}

/// $C44FF3
short UnknownC44FF3(short arg1, short fontID, ubyte* arg3) {
	short result;
	for (short i = 0; i < arg1; i++) {
		result += cast(short)(Unknown7E5E6D + FontConfigTable[fontID].data[(*(arg3++) - 0x50) & 0x7F] + i);
	}
	return result;
}

/// $C4507A
void UnknownC4507A(uint arg1) {
	ubyte[8] x12;
	if (CurrentFocusWindow == -1) {
		return;
	}
	ubyte Unknown7E5E75Copy = Unknown7E5E75;
	Unknown7E5E75 = 0;
	short x24 = UnknownC10C55(arg1);
	ubyte* x22 = &Unknown7E895A[7 - x24];
	ubyte* x20 = x22;
	short x1E = WindowStats[WindowTable[CurrentFocusWindow]].text_x;
	short x1C = WindowStats[WindowTable[CurrentFocusWindow]].text_y;
	short x04 = Unknown7E5E6D + FontConfigTable[WindowStats[WindowTable[CurrentFocusWindow]].font].data[4];

	for (short i = 0; i < x24; i++) {
		x12[i] = cast(ubyte)(*x22 + 0x60);
		x22++;
	}
	short x18 = cast(short)(x04 + UnknownC44FF3(x24, WindowStats[WindowTable[CurrentFocusWindow]].font, &x12[0]));
	x18 += Unknown7E5E6D;
	Unknown7E5E71 =1;
	UnknownC43D75(cast(short)((WindowStats[WindowTable[CurrentFocusWindow]].width - 1) * 8 - x18), WindowStats[WindowTable[CurrentFocusWindow]].text_y);
	PrintLetterF(EBChar('$'));
	while (x24 != 0) {
		PrintLetterF(*(x20++) + 0x60);
		x24--;
	}
	Unknown7E5E71 = 0;
	UnknownC438A5F(cast(short)(WindowStats[WindowTable[CurrentFocusWindow]].width - 1), WindowStats[WindowTable[CurrentFocusWindow]].text_y);
	UnknownC43F77(0x24);
	UnknownC438A5F(x1E, x1C);
	Unknown7E5E75 = Unknown7E5E75Copy;
}

/// $C451FA
void UnknownC451FA(short arg1, short arg2, short arg3) {
	short x20 = void;
	short x04 = 0;
	short x02 = 0;
	if (WindowStats[WindowTable[CurrentFocusWindow]].current_option == -1) {
		return;
	}
	WindowStats[WindowTable[CurrentFocusWindow]].menu_columns = arg1;
	MenuOpt* x24 = &MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option];
	memset(&Unknown7E968D[0], 0, 4);
	memset(&Unknown7E9691[0], 0xFF, 4);
	if (arg3 != 0) {
		while (true) {
			Unknown7E968D[x04] = cast(ubyte)(UnknownC43E31(&x24.label[0], 30) + 8);
			x02 += Unknown7E968D[x04];
			if (x24.next == -1) {
				break;
			}
			x24 = &MenuOptions[x24.next];
			x04++;
		}
		ushort x22 = cast(ushort)((WindowStats[WindowTable[CurrentFocusWindow]].width * 0x800) / x02);
		while (x04 != -1) {
			Unknown7E9691[x04] = cast(ubyte)((x22 * Unknown7E968D[x04]) / 256);
			x04--;
		}
		x24 = &MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option];
		x04 = 0;
	} else {
		x20 = cast(short)(((arg1 - 1) * arg2 + WindowStats[WindowTable[CurrentFocusWindow]].width) / arg1);
	}
	short x1E = WindowStats[WindowTable[CurrentFocusWindow]].height / 2;
	if ((arg1 + UnknownC1138DF(WindowStats[WindowTable[CurrentFocusWindow]].current_option) - 1) / arg1 > x1E) {
		x1E -= 2;
	}
	short x22 = 0;
	short x1C = 1;
	outermost: while (true) {
		short x1A = WindowStats[WindowTable[CurrentFocusWindow]].text_y;
		for (short x2A = x1E; x2A != 0; x2A--) {
			for (short x18 = arg1; x18 != 0; x18--) {
				if (arg3 != 0) {
					x24.text_x = cast(short)(x22 + (Unknown7E9691[x04] - Unknown7E968D[x04]) / 16);
					x24.text_y = x1A;
					x24.page = x1C;
					if (x24.next == -1) {
						break outermost;
					}
					x22 += (Unknown7E9691[x04] + 7) / 8;
					x04++;
					x24 = &MenuOptions[x24.next];
				} else {
					x24.text_x = x22;
					x24.text_y = x1A;
					x24.page = x1C;
					if (x24.next == -1) {
						break outermost;
					}
					x22 += x20;
					x24 = &MenuOptions[x24.next];
				}
			}
			x22 = 0;
			x1A++;
		}
		x1C++;
	}
	if (((arg1 + UnknownC1138DF(WindowStats[WindowTable[CurrentFocusWindow]].current_option) - 1) / arg1) > WindowStats[WindowTable[CurrentFocusWindow]].height / 2) {
		MenuOpt* x = &MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option];
		x20 = cast(short)(arg1 - 1);
		while (x20 != 0) {
			x20--;
			x = &MenuOptions[MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option].next];
		}
		UnknownC10BFE(0, 0, WindowStats[WindowTable[CurrentFocusWindow]].height / 2 - 1, &UnknownC3E44C[0], null);
		MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].option_count].page = 0;
	}
}

/// $C454F2
immutable ubyte[3] BattleToText = EBString!3("To ");

/// $C454F5
immutable ubyte[13] BattleFrontRowText = EBString!13("the Front Row");

/// $C45502
immutable ubyte[13] BattleBackRowText = EBString!13("the Back Row");

/// $C4550F
const CC1C01Entry[96] CC1C01Table;

/// $C4562F
immutable ubyte[8] PowersOfTwo8Bit = [1 << 0, 1 << 1, 1 << 2, 1 << 3, 1 << 4, 1 << 5, 1 << 6, 1 << 7];

/// $C45637
ubyte FindItemInInventory(short arg1, short arg2) {
	for (int i = 0; i < 14; i++) {
		if (PartyCharacters[arg1 - 1].items[i] == arg2) {
			return cast(ubyte)arg1;
		}
	}
	return 0;
}

/// $C45683
ubyte FindItemInInventory2(short arg1, short arg2) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (FindItemInInventory(gameState.partyMembers[i], arg2) != 0) {
				return gameState.partyMembers[i];
			}
		}
		return 0;
	} else {
		return FindItemInInventory(arg1, arg2);
	}
}

/// $C456E4
short FindInventorySpace(short arg1) {
	for (short i = 0; i < 14; i++) {
		if (PartyCharacters[arg1 - 1].items[i] == 0) {
			return arg1;
		}
	}
	return 0;
}

/// $C4577D
short FindInventorySpace2(short arg1) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (FindInventorySpace(gameState.partyMembers[i] != 0)) {
				return gameState.partyMembers[i];
			}
		}
		return 0;
	} else {
		return FindInventorySpace(arg1);
	}
}

/// $C4577D
ubyte ChangeEquippedWeapon(ushort character, short slot) {
	PartyCharacters[character - 1].equipment[EquipmentSlot.Weapon] = cast(ubyte)slot;
	RecalcCharacterPostmathOffense(character);
	RecalcCharacterPostmathGuts(character);
	RecalcCharacterMissRate(character);
	return PartyCharacters[character - 1].equipment[EquipmentSlot.Weapon];
}

/// $C457CA
ubyte ChangeEquippedBody(ushort character, short slot) {
	PartyCharacters[character - 1].equipment[EquipmentSlot.Body] = cast(ubyte)slot;
	RecalcCharacterPostmathDefense(character);
	RecalcCharacterPostmathSpeed(character);
	CalcResistances(character);
	return PartyCharacters[character - 1].equipment[EquipmentSlot.Body];
}

/// $C45815
ubyte ChangeEquippedArms(ushort character, short slot) {
	PartyCharacters[character - 1].equipment[EquipmentSlot.Arms] = cast(ubyte)slot;
	RecalcCharacterPostmathDefense(character);
	RecalcCharacterPostmathLuck(character);
	CalcResistances(character);
	return PartyCharacters[character - 1].equipment[EquipmentSlot.Arms];
}

/// $C45860
ubyte ChangeEquippedOther(ushort character, short slot) {
	PartyCharacters[character - 1].equipment[EquipmentSlot.Other] = cast(ubyte)slot;
	RecalcCharacterPostmathDefense(character);
	RecalcCharacterPostmathLuck(character);
	CalcResistances(character);
	return PartyCharacters[character - 1].equipment[EquipmentSlot.Other];
}

/// $C458AB
immutable ubyte[4] ItemUsableFlags = [
	ItemFlags.NessCanUse,
	ItemFlags.PaulaCanUse,
	ItemFlags.JeffCanUse,
	ItemFlags.PooCanUse,
];

/// $C45860
short CheckStatusGroup(short arg1, short arg2) {
	if (arg2 == 8) {
		return gameState.partyStatus + 1;
	}
	if (UnknownC2239D(arg1) != 0) {
		return PartyCharacters[arg1 - 1].afflictions[arg2 - 1] + 1;
	}
	return 0;
}

/// $C458FE
short InflictStatusNonBattle(short arg1, short arg2, short arg3) {
	if (arg2 == 8) {
		gameState.partyStatus = cast(ubyte)(arg3 - 1);
		return arg1;
	}
	if (UnknownC2239D(arg1) != 0) {
		PartyCharacters[arg1 - 1].afflictions[arg2 - 1] = cast(ubyte)(arg3 - 1);
		UnknownC3EE4D();
		return arg1;
	}
	return 0;
}

/// $C45963
immutable ubyte[10][5] MiscTargetText = [
	EBString!10("Who?"),
	EBString!10("Which?"),
	EBString!10("Where?"),
	EBString!10("Whom?"),
	EBString!10("Where?"),
];

/// $C4
immutable ubyte[5] PhoneCallText = EBString!5("Call:");

/// $C45860
uint GetRequiredEXP(short character) {
	character--;
	if (PartyCharacters[character].level == MAX_LEVEL) {
		return 0;
	}
	return EXPTable[character][PartyCharacters[character].level + 1] - PartyCharacters[character].exp;
}

/// $C45A27
// wrong name
immutable ushort[7][7] StatusEquipWindowText = [
	[0x0007, 0x0160, 0x0161, 0x0162, 0x0163, 0x0164, 0x0165],
	[0x0166, 0x0167, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0168, 0x0169, 0x0007, 0x0007, 0x0007, 0x0000, 0x0000],
	[0x016A, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0007, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0007, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0007, 0x0007, 0x0007, 0x0007, 0x0000, 0x0000, 0x0000]
];

// ditto
immutable ushort[7][7] StatusEquipWindowText2 = [
	[0x0020, 0x000D, 0x000E, 0x000F, 0x001D, 0x001E, 0x001F],
	[0x001C, 0x012F, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x000C, 0x013F, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x000B, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
	[0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0000]
];
// ditto
immutable ushort[7][7] StatusEquipWindowText3 = [
	[0x0002, 0x0006, 0x0006, 0x0006, 0x0006, 0x0006, 0x0006],
	[0x0006, 0x0006, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0006, 0x0006, 0x0006, 0x0006, 0x0006, 0x0000, 0x0000],
	[0x0006, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0004, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0004, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
	[0x0004, 0x0004, 0x0004, 0x0004, 0x0000, 0x0000, 0x0000],
];

immutable ubyte[35] StatusEquipWindowText4 = EBString!35("@Press the -A- Button for PSI info.");
immutable ubyte[16][9] StatusEquipWindowText5 = [
	EBString!16("Unconscious"),
	EBString!16("Diamondized"),
	EBString!16("Paralyzed"),
	EBString!16("Nauseous"),
	EBString!16("Poisoned"),
	EBString!16("Sunstroke"),
	EBString!16("Sniffling"),
	EBString!16("Mashroomized"),
	EBString!16("Possessed"),
];
immutable ubyte[16] StatusEquipWindowText6 = EBString!16("Homesick");
immutable ubyte[12] StatusEquipWindowText7 = EBString!12("Stored Goods");
immutable ubyte[8] StatusEquipWindowText8 = EBString!8("Offense:");
immutable ubyte[8] StatusEquipWindowText9 = EBString!8("Defense:");
immutable ubyte[11][4] StatusEquipWindowText10 = [
	EBString!11("  Weapon"),
	EBString!11("      Body"),
	EBString!11("     Arms"),
	EBString!11("     Other"),
];
immutable ubyte[8][4] StatusEquipWindowText11 = [
	EBString!8("Weapons"),
	EBString!8("Body"),
	EBString!8("Arms"),
	EBString!8("Others"),
];
immutable ubyte[10] StatusEquipWindowText12 = EBString!10("(Nothing) ");
immutable ubyte[5] StatusEquipWindowText13 = EBString!5("None");
immutable ubyte[3] StatusEquipWindowText14 = EBString!3("To:");

immutable ubyte[6] HomesicknessProbabilities = [
	0,
	100,
	150,
	200,
	250,
	0,
];

/// $C45E96
void UnknownC45E96() {
	while (DMATransferFlag != 0) {}
	for (short i = 0; i < 0x20; i++) {
		Unknown7E9D23[i][0] = 0xFF;
	}
	VWFTile = 0;
	VWFX = 0;
	if (++Unknown7E9E27 >= 0x30) {
		Unknown7E9E27 = 0;
	}
	Unknown7E9E29 = 0;
	UnknownC44E44();
}

/// $C45ECE
short CheckIfPSIKnown(short arg1, short arg2) {
	ubyte x10;
	switch (arg1) {
		case PartyMember.Ness:
			x10 = PSIAbilityTable[arg2].nessLevel;
			break;
		case PartyMember.Paula:
			x10 = PSIAbilityTable[arg2].paulaLevel;
			break;
		case PartyMember.Poo:
			x10 = PSIAbilityTable[arg2].pooLevel;
			break;
		default: break;
	}
	if (x10 != 0) {
		short x0E = 0;
		if (x10 <= PartyCharacters[arg1 - 1].level) {
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

immutable ushort[3][3] DirectionMatrix = [
	[ Direction.UpLeft, Direction.Up, Direction.UpRight ],
	[ Direction.Left, Direction.Up, Direction.Right ],
	[ Direction.DownLeft, Direction.Down, Direction.DownRight ],
];

/// $C45FA8
short GetDirectionTo(short targetX, short targetY, short fromX, short fromY) {
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
	return DirectionMatrix[x10][x];
}

/// $C46028
short UnknownC46028(short arg1) {
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (EntityTPTEntrySprites[i] == arg1) {
			return i;
		}
	}
	return -1;
}

/// $C4605A
short UnknownC4605A(short arg1) {
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (arg1 == EntityTPTEntries[i]) {
			return i;
		}
	}
	return -1;
}

/// $C4608C
short UnknownC4608C(short arg1) {
	if (arg1 == 0) {
		return gameState.currentPartyMembers;
	}
	for (short i = 0; i < 6; i++) {
		if (arg1 == gameState.unknown96[i]) {
			return gameState.unknownA2[i];
		}
	}
	return -1;
}

/// $C460CE
void UnknownC460CE(short arg1, short arg2) {
	short x12 = UnknownC4605A(arg1);
	if (x12 == -1) {
		return;
	}
	EntityPreparedXCoordinate = EntityAbsXTable[x12];
	EntityPreparedYCoordinate = EntityAbsYTable[x12];
	EntityPreparedDirection = EntityDirections[x12];
	InitEntityUnknown1((arg2 != 6) ? &UnknownC3A209.ptr[0] : &Event35.ptr[0], x12);
}

/// $C46125
void UnknownC46125(short arg1, short arg2) {
	short x12 = UnknownC46028(arg1);
	if (x12 == -1) {
		return;
	}
	EntityPreparedXCoordinate = EntityAbsXTable[x12];
	EntityPreparedYCoordinate = EntityAbsYTable[x12];
	EntityPreparedDirection = EntityDirections[x12];
	InitEntityUnknown1((arg2 != 6) ? &UnknownC3A209.ptr[0] : &Event35.ptr[0], x12);
}

/// $C4617C
void UnknownC4617C(short arg1, short arg2) {
	short x = UnknownC4605A(arg1);
	if (x == -1) {
		return;
	}
	InitEntityUnknown1(&EventScriptPointers[arg2][0], x);
}

/// $C461CC
void UnknownC461CC(short arg1, short arg2) {
	short x = UnknownC46028(arg1);
	if (x == -1) {
		return;
	}
	InitEntityUnknown1(&EventScriptPointers[arg2][0], x);
}

/// $C4621C
short UnknownC4621C(short arg1, short arg2) {
	short x0E;
	switch (arg1) {
		case 0:
			x0E = UnknownC4608C(arg2);
			break;
		case 1:
			x0E = UnknownC4605A(arg2);
			break;
		case 2:
			x0E = UnknownC46028(arg2);
			break;
		default: break;
	}
	return x0E;
}

/// $C46257
short UnknownC46257(short arg1, short arg2, short arg3, short arg4) {
	short x14 = UnknownC4621C(arg1, arg2);
	short x = UnknownC4621C(arg2, arg4);
	return (UnknownC41EFF(EntityAbsYTable[x14], EntityAbsXTable[x14], EntityAbsYTable[x], EntityAbsXTable[x]) + 0x1000) / 0x2000;
}

/// $C462AE
short UnknownC462AE(short arg1, short arg2, short arg3) {
	return UnknownC46257(1, arg1, arg2, arg3);
}

/// $C462C9
short UnknownC462C9(short arg1, short arg2, short arg3) {
	return UnknownC46257(2, arg1, arg2, arg3);
}

/// $C462E4
short UnknownC462E4(short arg1, short arg2, short arg3) {
	return UnknownC46257(0, arg1, arg2, arg3);
}

/// $C462FF
void UnknownC462FF(short arg1, short arg2) {
	short x0E = UnknownC4605A(arg1);
	if (x0E == -1) {
		return;
	}
	if (EntityDirections[x0E] != arg2) {
		EntityDirections[x0E] = arg2;
		UnknownC0A443Entry2(x0E);
	}
}

/// $C46331
void UnknownC46331(short arg1, short arg2) {
	short x0E = UnknownC46028(arg1);
	if (x0E == -1) {
		return;
	}
	if (EntityDirections[x0E] != arg2) {
		EntityDirections[x0E] = arg2;
		UnknownC0A443Entry2(x0E);
	}
}

/// $C46363
void UnknownC46363(short arg1, short arg2) {
	short x0E = UnknownC4608C(arg1);
	if (x0E == -1) {
		return;
	}
	if (EntityDirections[x0E] != arg2) {
		EntityDirections[x0E] = arg2;
		UnknownC0A780(x0E);
	}
}

/// $C46397
void UnknownC46397(short arg1) {
	for (short i = 0; i < gameState.partyCount; i++) {
		if (16 <= gameState.unknown96[i]) {
			continue;
		}
		short x0E = gameState.unknownA2[i];
		if (EntityDirections[x0E] == arg1) {
			continue;
		}
		EntityDirections[x0E] = arg1;
		UnknownC0A780(x0E);
	}
}

/// $C463F4
void UnknownC463F4(short arg1) {
	UnknownC07C5B();
	Unknown7E5D58 = 0;
	if (arg1 != 0xFF) {
		short a = UnknownC4608C(arg1);
		if (a != -1) {
			EntitySpriteMapFlags[a] |= 0x8000;
		}
	} else {
		for (short i = 0; i < gameState.partyCount; i++) {
			EntitySpriteMapFlags[gameState.unknownA2[i]] |= 0x8000;
		}
	}
}

/// $C4645A
void UnknownC4645A(short arg1) {
	if (arg1 != 0xFF) {
		short a = UnknownC4608C(arg1);
		if (a != -1) {
			EntitySpriteMapFlags[a] &= 0x7FFF;
		}
	} else {
		for (short i = 0; i < gameState.partyCount; i++) {
			EntitySpriteMapFlags[gameState.unknownA2[i]] &= 0x7FFF;
		}
	}
}

/// $C464B5
short CreatePreparedEntityNPC(short npcID, short actionScript) {
	short result = CreateEntity(NPCConfig[npcID].sprite, actionScript, -1, EntityPreparedXCoordinate, EntityPreparedYCoordinate);
	EntityDirections[result] = EntityPreparedDirection;
	EntityTPTEntries[result] = npcID;
	return result;
}

/// $C46507
short CreatePreparedEntitySprite(short sprite, short actionScript) {
	short result = CreateEntity(sprite, actionScript, -1, EntityPreparedXCoordinate, EntityPreparedYCoordinate);
	EntityDirections[result] = EntityPreparedDirection;
	return result;
}

/// $C46534
short UnknownC46534(short sprite, short actionScriptID) {
	return CreateEntity(sprite, actionScriptID, -1, EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot]);
}

/// $C4655E
void UnknownC4655E(short arg1) {
	short a = UnknownC4605A(arg1);
	if (a == -1) {
		return;
	}
	EntityTickCallbackFlags[a] |= (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
}

/// $C46579
void UnknownC46579(short arg1){
	short a = UnknownC46028(arg1);
	if (a == -1) {
		return;
	}
	EntityTickCallbackFlags[a] |= (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
}

/// $C46594
void UnknownC46594(short arg1) {
	if (arg1 != 0xFF) {
		short a = UnknownC4608C(arg1);
		if (a == -1) {
			return;
		}
	}
	EntityTickCallbackFlags[23] |= (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
	for (short i = 0; i < gameState.partyCount; i++) {
		EntityTickCallbackFlags[gameState.unknownA2[i]] |= (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
	}
}

/// $C465FB
void UnknownC465FB(short arg1) {
	short a = UnknownC4605A(arg1);
	if (a == -1) {
		return;
	}
	EntityTickCallbackFlags[a] &= (0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED));
}

/// $C46616
void UnknownC46616(short arg1) {
	short a = UnknownC46028(arg1);
	if (a == -1) {
		return;
	}
	EntityTickCallbackFlags[a] &= (0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED));
}

/// $C46631
void UnknownC46631(short arg1) {
	if (arg1 != 0xFF) {
		short a = UnknownC4608C(arg1);
		if (a == -1) {
			return;
		}
		EntityTickCallbackFlags[a] &= (0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED));
		return;
	}
	EntityTickCallbackFlags[23] &= 0x3FFF;
	for (short i = 0; i < gameState.partyCount; i++) {
		EntityTickCallbackFlags[gameState.unknownA2[i]] &= (0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED));
	}
}

/// $C46698
void UnknownC46698(short arg1) {
	Unknown7E9E33 = UnknownC4605A(arg1);
	gameState.unknownB0 = 2;
}

/// $C466A8
void UnknownC466A8(short arg1) {
	Unknown7E9E33 = UnknownC46028(arg1);
	gameState.unknownB0 = 2;
}

/// $C466B8
void UnknownC466B8() {
	gameState.unknown90 = 0;
	gameState.unknownB0 = 0;
}

/// $C466C1
void UnknownC466C1(short arg1) {
	UnknownC07C5B();
	Unknown7E5D58 = 0;
	Unknown7E9E35 = cast(short)(arg1 - 1);
	DisplayText(TextC466C1.ptr);
	UnknownC4343E(arg1);
}

/// $C466F0
void UnknownC466F0(const(ubyte)* arg1) {
	DisplayText(arg1);
}

/// $C46712
void UnknownC46712() {
	EntityTickCallbackFlags[gameState.unknownA2[0]] |= OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED;
	for (short i = 0; i < gameState.partyCount; i++) {
		EntitySpriteMapFlags[gameState.unknownA2[i]] |= 0x8000;
	}
}

/// $C4675C
void UnknownC4675C() {
	EntityTickCallbackFlags[gameState.unknownA2[0]] &= 0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
	for (short i = 1; i < gameState.partyCount; i++) {
		if (gameState.unknown96[i] == 9) {
			continue;
		}
		EntitySpriteMapFlags[gameState.unknownA2[i]] &= 0x7FFF;
	}
}

/// $C467B4
short UnknownC467B4() {
	return cast(short)((rand() & 0x1F) + 12);
}

/// $C467C2
short UnknownC467C2() {
	return cast(short)((0x100 - EntityScreenYTable[CurrentEntitySlot] / 4) + (rand() & 0x1F));
}

/// $C467E6
void UnknownC467E6() {
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (EntityTPTEntrySprites[i] != 0x16F) {
			continue;
		}
		EntityTickCallbackFlags[i] &= 0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
	}
}

/// $C4681A
void UnknownC4681A() {
	if (EntityTPTEntries[CurrentEntitySlot] == -1) {
		return;
	}
	if (NPCConfig[EntityTPTEntries[CurrentEntitySlot]].talkText == null) {
		return;
	}
	UnknownC064E3(8, QueuedInteractionPtr(&NPCConfig[EntityTPTEntries[CurrentEntitySlot]].talkText[0]));
}

/// $C46881
void UnknownC46881(const(ubyte)* arg1) {
	UnknownC46594(0xFF);
	UnknownC064E3(8, QueuedInteractionPtr(arg1));
}

/// $C468A9
short UnknownC468A9() {
	return pad_press[0];
}

/// $C468AF
short UnknownC468AF() {
	return pad_state[0];
}

/// $C468B5
short UnknownC468B5(short arg1) {
	short x0E = 0;
	if (arg1 < EntityAbsXTable[CurrentEntitySlot]) {
		x0E = 1;
	}
	return x0E;
}

/// $C468DC
short UnknownC468DC(short arg1) {
	short x0E = 0;
	if (arg1 < EntityAbsYTable[CurrentEntitySlot]) {
		x0E = 1;
	}
	return x0E;
}

/// $C46903
short UnknownC46903(short arg1) {
	short x = 0;
	if (arg1 > gameState.leaderY.integer) {
		x = 1;
	}
	return x;
}

/// $C46914
short UnknownC46914() {
	if (EntityTPTEntries[CurrentEntitySlot] == -1) {
		return 4;
	}
	return NPCConfig[EntityTPTEntries[CurrentEntitySlot]].direction;
}

/// $C46957
void UnknownC46957(short arg1) {
	if (EntityDirections[CurrentEntitySlot] != arg1) {
		EntityDirections[CurrentEntitySlot] = arg1;
		UnknownC0A443Entry2(CurrentEntitySlot);
	}
}

/// $C46984
void UnknownC46984(short arg1) {
	short x04 = UnknownC4605A(arg1);
	if (x04 == -1) {
		return;
	}
	short x10 = cast(short)((UnknownC41EFF(EntityAbsXTable[x04], EntityAbsYTable[x04], EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot]) + 0x1000) / 0x2000);
	if (EntityDirections[x04] == x10) {
		return;
	}
	EntityDirections[x04] = x10;
	UnknownC0A443Entry2(x04);
}

/// $C469F1
void UnknownC469F1(short arg1) {
	short x04 = UnknownC46028(arg1);
	if (x04 == -1) {
		return;
	}
	short x10 = cast(short)((UnknownC41EFF(EntityAbsXTable[x04], EntityAbsYTable[x04], EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot]) + 0x1000) / 0x2000);
	if (EntityDirections[x04] == x10) {
		return;
	}
	EntityDirections[x04] = x10;
	UnknownC0A443Entry2(x04);
}

/// $C46A5E
immutable short[8] UnknownC46A5E = [
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
short UnknownC46A6E() {
	return UnknownC46A5E[gameState.leaderDirection];
}

/// $C46A7A
immutable short[8] UnknownC46A7A = [
	0,
	2,
	2,
	2,
	4,
	6,
	6,
	6,
];

/// $C46A8A
immutable short[8] UnknownC46A8A = [
	0,
	0,
	2,
	4,
	4,
	4,
	6,
	0,
];

/// $C46A9A
short UnknownC46A9A(short arg1) {
	return UnknownC46A7A[arg1];
}

/// $C46AA3
short UnknownC46AA3(short arg1) {
	return UnknownC46A8A[arg1];
}

/// $C46ADB
ushort UnknownC46ADB() {
	return UnknownC41EFF(EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot], EntityScriptVar6Table[CurrentEntitySlot], EntityScriptVar7Table[CurrentEntitySlot]);
}

/// $C46B0A
short UnknownC46B0A(short arg1) {
	Unknown7E1A86[CurrentEntitySlot] = cast(short)((arg1 + 0x1000) / 0x2000);
	return Unknown7E1A86[CurrentEntitySlot];
}

/// $C46B2D
short UnknownC46B2D(short arg1) {
	return cast(short)(arg1 * 0x2000);
}

/// $C46B37
short UnknownC46B37(short arg1) {
	return (arg1 + 4) & 7;
}

/// $C46B41
immutable short[8] UnknownC46B41 = [
	Direction.Right,
	Direction.DownRight,
	Direction.Down,
	Direction.DownLeft,
	Direction.Left,
	Direction.UpLeft,
	Direction.UpLeft,
	Direction.UpRight,
];

/// $C46B51
short UnknownC46B51(short arg1) {
	return UnknownC46B41[(arg1 + 0x1000) / 0x2000];
}

/// $C46B65
void UnknownC46B65() {
	EntityScriptVar6Table[CurrentEntitySlot] = gameState.leaderX.integer;
	EntityScriptVar7Table[CurrentEntitySlot] = gameState.leaderY.integer;
}

/// $C46B8D
void UnknownC46B8D(short arg1) {
	short x0E = UnknownC4605A(arg1);
	EntityScriptVar6Table[CurrentEntitySlot] = EntityAbsXTable[x0E];
	EntityScriptVar7Table[CurrentEntitySlot] = EntityAbsYTable[x0E];
}

/// $C46BBB
void UnknownC46BBB(short arg1) {
	short x0E = UnknownC46028(arg1);
	EntityScriptVar6Table[CurrentEntitySlot] = EntityAbsXTable[x0E];
	EntityScriptVar7Table[CurrentEntitySlot] = EntityAbsYTable[x0E];
}

/// $C46BE9
void GetPositionOfPartyMember(short arg1) {
	short x12 = CurrentEntitySlot;
	short x0E;
	if (arg1 == 0xFE) {
		x0E = gameState.unknownA2[gameState.partyCount - 1];
		if (EntityAbsXTable[x0E] == 0) {
			x0E = gameState.unknownA2[gameState.partyCount - 2];
		}
	} else {
		x0E = UnknownC4608C(arg1);
	}
	EntityScriptVar6Table[x12] = EntityAbsXTable[x0E];
	EntityScriptVar7Table[x12] = EntityAbsYTable[x0E];
}

/// $C46C45
void UnknownC46C45() {
	EntityScriptVar0Table[CurrentEntitySlot] = EntityAbsXTable[CurrentEntitySlot];
	EntityScriptVar1Table[CurrentEntitySlot] = EntityAbsYTable[CurrentEntitySlot];
}

/// $C46C5E
void UnknownC46C5E(short arg1, short arg2) {
	EntityScriptVar0Table[CurrentEntitySlot] = cast(short)(arg2 + EntityAbsXTable[CurrentEntitySlot]);
	EntityScriptVar1Table[CurrentEntitySlot] = cast(short)(arg1 + EntityAbsYTable[CurrentEntitySlot]);
}

/// $C46C87
void UnknownC46C87() {
	EntityAbsXTable[CurrentEntitySlot] = EntityScriptVar6Table[CurrentEntitySlot];
	EntityAbsYTable[CurrentEntitySlot] = EntityScriptVar7Table[CurrentEntitySlot];
}

/// $C46C9B
void UnknownC46C9B(short arg1) {
	short x0E = UnknownC4608C(arg1);
	EntityAbsXTable[CurrentEntitySlot] = EntityAbsXTable[x0E];
	EntityAbsYTable[CurrentEntitySlot] = EntityAbsYTable[x0E];
}

/// $C46CC7
void UnknownC46CC7(short arg1) {
	short x0E = UnknownC46028(arg1);
	EntityAbsXTable[CurrentEntitySlot] = EntityAbsXTable[x0E];
	EntityAbsYTable[CurrentEntitySlot] = EntityAbsYTable[x0E];
}

/// $C46CF5
void UnknownC46CF5(short arg1, short arg2) {
	EntityAbsXTable[CurrentEntitySlot] = cast(short)(arg2 + BG1_X_POS);
	EntityAbsYTable[CurrentEntitySlot] = cast(short)(arg1 + BG1_Y_POS);
	EntityAbsXFractionTable[CurrentEntitySlot] = cast(short)0x8000;
	EntityAbsYFractionTable[CurrentEntitySlot] = cast(short)0x8000;
}

/// $C46D23
void UnknownC46D23() {
	EntityAbsXTable[CurrentEntitySlot] = cast(short)(rand() + BG1_X_POS + 0x70);
	EntityAbsYTable[CurrentEntitySlot] = BG1_Y_POS;
}

/// $C46D4B
void UnknownC46D4B() {
	EntityAbsXTable[CurrentEntitySlot] = cast(short)(PhotographerConfigTable[Unknown7E9E35].photographerX * 8);
	EntityAbsYTable[CurrentEntitySlot] = cast(short)(PhotographerConfigTable[Unknown7E9E35].photographerY * 8);
	EntityAbsYFractionTable[CurrentEntitySlot] = 0;
	EntityAbsXFractionTable[CurrentEntitySlot] = 0;
}

/// $C46DAD
void PrepareNewEntityAtExistingEntityLocation(short arg1) {
	short x0E;
	switch (arg1) {
		case 0:
			x0E = CurrentEntitySlot;
			break;
		case 1:
			x0E = gameState.currentPartyMembers;
			break;
		default: break;
	}
	EntityPreparedXCoordinate = EntityAbsXTable[x0E];
	EntityPreparedYCoordinate = EntityAbsYTable[x0E];
	EntityPreparedDirection = EntityDirections[x0E];
}

/// $C46DE6
void PrepareNewEntityAtTeleportDestination(short arg1) {
	EntityPreparedXCoordinate = cast(ushort)(TeleportDestinationTable[arg1].x * 8);
	EntityPreparedYCoordinate = cast(ushort)(TeleportDestinationTable[arg1].y * 8);
	EntityPreparedDirection = cast(ushort)(TeleportDestinationTable[arg1].direction - 1);
}

/// $C46E37
void PrepareNewEntity(short arg1, short arg2, short arg3) {
	EntityPreparedXCoordinate = arg2;
	EntityPreparedYCoordinate = arg3;
	EntityPreparedDirection = arg1 & 0xFF;
}

/// $C46E46
void UnknownC46E46() {
	Unknown7E9641 = 1;
}

/// $C46E4F
void UnknownC46E4F(const(ubyte)* arg1) {
	UnknownC064E3(8, QueuedInteractionPtr(arg1));
}

/// $C46E74
short UnknownC46E74() {
	if (teleportDestination != 0) {
		return 0;
	}
	short x10 = cast(short)(EntityScriptVar0Table[CurrentEntitySlot] - gameState.leaderX.integer);
	short x0E;
	if (0 > x10) {
		x0E = cast(short)-cast(int)x10;
	} else {
		x0E = x10;
	}
	if (x0E < EntityScriptVar2Table[CurrentEntitySlot]) {
		x10 = cast(short)(EntityScriptVar1Table[CurrentEntitySlot] - gameState.leaderY.integer);
		if (0 > x10) {
			x10 = cast(short)-cast(int)x10;
		} else {
			x10 = x10;
		}
		if (x10 < EntityScriptVar3Table[CurrentEntitySlot]) {
			return 1;
		}
	}
	return 0;
}

/// $C46EF8
short UnknownC46EF8() {
	if (teleportDestination != 0) {
		return 0;
	}
	short x10 = cast(short)(EntityAbsXTable[CurrentEntitySlot] - gameState.leaderX.integer);
	short x0E;
	if (0 > x10) {
		x0E = cast(short)-cast(int)x10;
	} else {
		x0E = x10;
	}
	if (x0E < EntityScriptVar2Table[CurrentEntitySlot]) {
		x10 = cast(short)(EntityAbsYTable[CurrentEntitySlot] - gameState.leaderY.integer);
		if (0 > x10) {
			x10 = cast(short)-cast(int)x10;
		} else {
			x10 = x10;
		}
		if (x10 < EntityScriptVar3Table[CurrentEntitySlot]) {
			return 1;
		}
	}
	return 0;
}

/// $C47044
short UnknownC47044(short arg1) {
	FixedPoint1616 x0E = UnknownC41FFF(arg1, UNKNOWN_30X2_TABLE_35[CurrentEntitySlot]);
	short x14 = x0E.integer;
	if (x14 < 0) {
		EntityDeltaXTable[CurrentEntitySlot] = x14 >> 8;
		EntityDeltaXFractionTable[CurrentEntitySlot] = cast(short)((x14 << 8) | 0xFF);
	} else {
		EntityDeltaXTable[CurrentEntitySlot] = (x14 >> 8) & 0xFF;
		EntityDeltaXFractionTable[CurrentEntitySlot] = cast(short)((x14 << 8) & 0xFF00);
	}
	x14 = x0E.fraction;
	if (x14 < 0) {
		EntityDeltaYTable[CurrentEntitySlot] = x14 >> 8;
		EntityDeltaYFractionTable[CurrentEntitySlot] = cast(short)((x14 << 8) | 0xFF);
	} else {
		EntityDeltaYTable[CurrentEntitySlot] = (x14 >> 8) & 0xFF;
		EntityDeltaYFractionTable[CurrentEntitySlot] = cast(short)((x14 << 8) & 0xFF00);
	}
	return arg1;
}

/// $C47143
short UnknownC47143(short arg1, short arg2) {
	short x12 = cast(short)(EntityScriptVar6Table[CurrentEntitySlot] - EntityAbsXTable[CurrentEntitySlot]);
	if (0 > x12) {
		x12 = cast(short)-cast(int)x12;
	} else {
		x12 = x12; //...ok?
	}
	if (x12 < EntityScriptVar5Table[CurrentEntitySlot]) {
		x12 = cast(short)(EntityScriptVar7Table[CurrentEntitySlot] - EntityAbsYTable[CurrentEntitySlot]);
		if (0 > x12) {
			x12 = cast(short)-cast(int)x12;
		} else {
			x12 = x12;
		}
		if (x12 < EntityScriptVar5Table[CurrentEntitySlot]) {
			return 1;
		}
	}
	x12 = UnknownC46ADB();
	UnknownC47044(x12);
	if (arg2 == 0) {
		short x10 = UnknownC46B0A(x12);
		if (arg1 != 0) {
			x10 = UnknownC46B37(x10);
		}
		short x0E = EntityDirections[CurrentEntitySlot];
		EntityDirections[CurrentEntitySlot] = x10;
		if (UnknownC46AA3(x0E) != UnknownC46AA3(x10)) {
			UnknownC0A443Entry2(CurrentEntitySlot);
		}
	}
	return 0;
}

/// $C4733C
void UnknownC4733C() {
	UnknownC006F2(TilesetTable[Unknown7E436E]);
}

/// $C47370
void LoadBackgroundAnimation(short bg, short arg2) {
	UnknownC08726();
	UnknownC08D79(9);
	SetBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0x0000);
	SetBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x1000);
	LoadBattleBG(bg, arg2, 4);
	UnknownC08744();
}

/// $C474A8
// calls to this seem to specify an argument, but the registers are clobbered immediately
void UnknownC474A8() {
	UnknownC4249A(
		(0 <= EntityScriptVar0Table[CurrentEntitySlot]) ? 0x33 : 0xB3,
		cast(ubyte)((0 <= EntityScriptVar0Table[CurrentEntitySlot]) ? EntityScriptVar0Table[CurrentEntitySlot] : cast(short)-cast(int)EntityScriptVar0Table[CurrentEntitySlot])
	);
}

/// $C474F6
immutable ubyte[11] UnknownC474F6 = [ 0x10, 0x10, 0x0F, 0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x09, 0x06, 0x03 ];

/// $C47501
void UnknownC47501(ubyte* arg1) {
	if (EntityAbsYTable[CurrentEntitySlot] - BG1_Y_POS + 4 >= 0) {
		(arg1++)[0] = cast(ubyte)(EntityAbsYTable[CurrentEntitySlot] - BG1_Y_POS + 5);
		short x12 = cast(short)(EntityAbsXTable[CurrentEntitySlot] + 16 - BG1_X_POS);
		if (EntityAbsXTable[CurrentEntitySlot] - 16 - BG1_X_POS < 0x100) {
			(arg1++)[0] = cast(ubyte)(EntityAbsXTable[CurrentEntitySlot] - 16 - BG1_X_POS);
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
	short x04 = cast(short)(EntityAbsXTable[CurrentEntitySlot] - BG1_X_POS);
	if (EntityAbsYTable[CurrentEntitySlot] - BG1_Y_POS + 15 >= 0) {
		short x02 = (EntityAbsYTable[CurrentEntitySlot] - BG1_Y_POS + 15 < 10) ? cast(short)(EntityAbsYTable[CurrentEntitySlot] - BG1_Y_POS + 15) : 10;
		const(ubyte)* x0A = &UnknownC474F6[10 - x02];
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
void UnknownC476A5() {
	short x16;
	if ((EntityScriptVar0Table[CurrentEntitySlot] & 1) != 0) {
		x16 = 0;
	} else {
		x16 = 0x2FE;
	}
	UnknownC47501(&Unknown7F0000[x16]);
	UnknownC425CC(&Unknown7F0000[x16]);
	EntityScriptVar0Table[CurrentEntitySlot]++;
}

/// $C47705
void UnknownC47705() {
	short x16;
	if ((EntityScriptVar0Table[CurrentEntitySlot] & 1) != 0) {
		x16 = 0x5FC;
	} else {
		x16 = 0x8FA;
	}
	UnknownC47501(&Unknown7F0000[x16]);
	UnknownC425FD(&Unknown7F0000[x16]);
	EntityScriptVar0Table[CurrentEntitySlot]++;
}

/// $C47765
void UnknownC47765(short arg1, short arg2, short arg3) {
	ubyte* x0A = &Unknown7F0000[0xBF8];
	short x14 = cast(short)(arg2 - BG1_Y_POS);
	if (x14 > 0x7F) {
		x0A[0] = 0x7F;
		Unknown7F0000[0xBF9] = 0;
		Unknown7F0000[0xBFA] = 0xFF;
		x0A = &Unknown7F0000[0xBFB];
		x14 -= 0x7F;
	}
	(x0A++)[0] = cast(ubyte)x14;
	(x0A++)[0] = 0;
	(x0A++)[0] = 0xFF;
	short y = cast(short)(arg1 - BG1_X_POS);
	short x12 = cast(short)(arg3 - BG1_X_POS);
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
	UnknownC42542(&Unknown7F0000[0xBF8]);
}

/// $C47866
short UnknownC47866(short arg1, short arg2) {
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
ubyte* UnknownC4789E(short arg1, short arg2, short arg3, ubyte* arg4) {
	if (arg1 == 0) {
		return arg4;
	}
	if (arg1 < 0x80) {
		(arg4++)[0] = cast(ubyte)arg1;
		(arg4++)[0] = cast(ubyte)arg2;
		(arg4++)[0] = cast(ubyte)arg3;
	} else {
		(arg4++)[0] = 0x7F;
		(arg4++)[0] = cast(ubyte)arg2;
		(arg4++)[0] = cast(ubyte)arg3;
		(arg4++)[0] = cast(ubyte)(arg1 - 0x7F);
		(arg4++)[0] = cast(ubyte)arg2;
		(arg4++)[0] = cast(ubyte)arg3;
	}
	return arg4;
}

/// $C47930
void UnknownC47930(short arg1, short arg2, short arg3, short arg4) {
	short x1A;
	if ((Unknown7E9E3A & 1) != 0) {
		x1A = 0;
	} else {
		x1A = 0x2FE;
	}
	short x18 = UnknownC47866(arg2, 0xE0);
	short x16 = UnknownC47866(arg4, 0xE0);
	short x04 = UnknownC47866(arg1, 0x100);
	short x02 = UnknownC47866(arg3, 0x100);
	UnknownC4789E(cast(short)(0xE0 - x16 - 1), 0x80, 0x7F, UnknownC4789E(cast(short)(x16 - x18), x04, x02, UnknownC4789E(x18, 0x80, 0x7F, &Unknown7F0000[x1A])))[0] = 0;
	UnknownC4245D(&Unknown7F0000[x1A]);
	Unknown7E9E3A++;
}

/// $C479E9
void UnknownC479E9() {
	short x10 = void; // whoops?
	short x04 = cast(short)(EntityAbsXTable[CurrentEntitySlot] - BG1_X_POS);
	short x12 = cast(short)(EntityAbsYTable[CurrentEntitySlot] - BG1_Y_POS);
	short x02 = EntityScriptVar0Table[CurrentEntitySlot];
	UnknownC47930(cast(short)(x04 - x02), x10, cast(short)(x04 + x02), cast(short)(x12 + x02));
}

/// $C47A27
void UnknownC47A27() {
	BG1_Y_POS = cast(short)(EntityAbsYTable[CurrentEntitySlot] - 0x70);
	short x10 = cast(short)(EntityAbsYTable[gameState.currentPartyMembers] - (EntityAbsYTable[CurrentEntitySlot] - 0x70));
	UnknownC47930(0x10, cast(short)(x10 - 0x60), 0xF0, cast(short)(x10 + 0x60));
}

/// $C47C3F
//definitely need to check this one over
void LoadWindowGraphics() {
	Decomp(&TextWindowGraphics[0], &Unknown7F0000[0]);
	memcpy(&Unknown7F0000[0x2000], &Unknown7F0000[0x1000], 0x2A00);
	memset(&Unknown7F0000[0x3200], 0, 0x600);
	if (gameState.textFlavour == 0) {
		gameState.textFlavour = 1;
	}
	if (TextWindowProperties[gameState.textFlavour - 1].unknown == 8) {
		Decomp(&FlavouredTextGraphics[0], &Unknown7F0000[0x100]);
	}
	ushort* x24 = cast(ushort*)&Unknown7F0000[0x2A00];
	for (short i = 0; i < 4; i++) {
		VWFTile = 0;
		VWFX = 0;
		memset(&VWFBuffer[0][0], 0xFF, 0x340);
		Unknown7E9652.unknown2 = 0;
		Unknown7E9652.unknown0 = 0;
		ubyte* x0A = &PartyCharacters[i].name[0];
		VWFX = 2;
		for (short j = 0; x0A[0] != 0; j++) {
			RenderText(6, FontConfigTable[Font.Battle].width, &FontConfigTable[Font.Battle].graphics[FontConfigTable[Font.Battle].height * ((*x0A - 0x50) & 0x7F)]);
			x0A++;
		}
		for (short j = 0; j < 4; j++) {
			memcpy(&Unknown7F0000[0x2A00 + j * 16 + i * 64], &VWFBuffer[j][0], 0x10);
			memcpy(&Unknown7F0000[0x2A00 + j * 16 + i * 64 + 0x100], &VWFBuffer[j][16], 0x10);
		}
	}
	for (short i = 0; i < 0x20; i++) {
		ubyte* x1A = &Unknown7F0000[0x70];
		for (short j = 0; j < 8; j++) {
			x24[0] = (x24[0] & 0xFF00) | ((x24[0] >> 8) ^ 0xFF) | x1A[0];
			x24++;
			x1A++;
		}
	}
	ushort* x16 = cast(ushort*)&Unknown7F0000[0x2C00];

	for (const(ushort)* x24_2 = &StatusEquipWindowText2[0][0]; *x24_2 != 0; x24_2++) {
		if (*x24_2 == 0x20) {
			continue;
		}
		ushort* x0A = cast(ushort*)(&Unknown7F0000[(*x24_2 & 0xFFF0) + *x24_2]);
		ubyte* x1A = &Unknown7F0000[0x70];
		for (short i = 0; i < 8; i++) {
			x16[0] = (x0A[0] & 0xFF00) | ((x0A[0] >> 8) ^ 0xFF) | x1A[0];
			x16[0x100] = (x0A[0x100] & 0xFF00) | ((x0A[0x100] >> 8) ^ 0xFF) | x1A[0x100];
			x16++;
			x0A++;
			x1A += 2;
		}
	}
}

/// $C47F87
void UnknownC47F87() {
	ubyte affliction = 0;
	// Normally the game just indexes the playerControlledPartyMembers array out of bounds - not the best idea.
	if (gameState.playerControlledPartyMemberCount > 0) {
		if (ChosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]] != null){
			affliction = ChosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0];
		}
	}
	switch(affliction) {
		case 1:
		case 2:
			if (Unknown7EB4B6 != 0) {
				goto default;
			}
			memcpy(palettes.ptr, TextWindowDeathPalette.ptr, 0x40);
			break;
		default:
			memcpy(palettes.ptr, (cast(void*)TextWindowFlavourPalettes.ptr) + TextWindowProperties[gameState.textFlavour - 1].offset, 0x40);
			break;
	}
	CurrentTextPalette[0] = 0;
	UnknownC0856B(8);
}

/// $C4800B
void UndrawFlyoverText() {
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	UnknownC2038B();
	LoadWindowGraphics();
	UnknownC44963(2);
	UnknownC47F87();
	Unknown7E0030 = 0x18;
}

/// $C48BDA
void UnknownC48BDA() {
	UnknownC2DB3F();
}

/// $C48BE1
void UnknownC48BE1() {
	EntityScreenXTable[CurrentEntitySlot] = cast(short)(EntityAbsXTable[CurrentEntitySlot] - BG1_X_POS);
	EntityScreenYTable[CurrentEntitySlot] = cast(short)(EntityAbsYTable[CurrentEntitySlot] - BG1_Y_POS);
}

/// $C48C02
void UnknownC48C02() {
	EntityScreenXTable[CurrentEntitySlot] = cast(short)(EntityAbsXTable[CurrentEntitySlot] - BG1_X_POS + EntityScriptVar0Table[CurrentEntitySlot]);
	EntityScreenYTable[CurrentEntitySlot] = cast(short)(EntityAbsYTable[CurrentEntitySlot] - BG1_Y_POS + EntityScriptVar1Table[CurrentEntitySlot]);
}

/// $C48C2B
void UnknownC48C2B() {
	CenterScreen(EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot]);
}

/// $C48C3E
void UnknownC48C3E() {
	CenterScreen(cast(short)(EntityAbsXTable[CurrentEntitySlot] + EntityScriptVar0Table[CurrentEntitySlot]), cast(short)(EntityAbsYTable[CurrentEntitySlot] + EntityScriptVar1Table[CurrentEntitySlot]));
}

/// $C48C59
immutable short[8] UnknownC48C59 = [ 0x0800, 0x0900, 0x0100, 0x0500, 0x0400, 0x0600, 0x0200, 0x0A00 ];

/// $C48C69
void UnknownC48C69() {
	Unknown7E9F18 = 0;
	for (short i = 0; i < 0x40; i++) {
		Unknown7E9E58[i].unknown1 = 0;
		Unknown7E9E58[i].unknown0 = 0;
	}
}

/// $C48C97
void UnknownC48C97(short arg1) {
	if ((Unknown7E9F18 == 0) && (Unknown7E9E58[Unknown7E9F18].unknown1 == 0)) {
		Unknown7E9E58[Unknown7E9F18].unknown1 = arg1;
		Unknown7E9E58[0].unknown0 = 1;
	} else {
		if (Unknown7E9E58[Unknown7E9F18].unknown1 == arg1) {
			Unknown7E9E58[Unknown7E9F18].unknown0++;
		} else {
			if (++Unknown7E9F18 == 0x40) {
				while (true) {}
			} else {
				Unknown7E9E58[Unknown7E9F18].unknown1 = arg1;
				Unknown7E9E58[Unknown7E9F18].unknown0 = 1;
			}
		}
	}
}

/// $C48D58
short UnknownC48D58(short arg1, short arg2, short arg3, short arg4) {
	FixedPoint1616 x10 = { fraction: arg1 };
	FixedPoint1616 x14 = { fraction: arg2 };
	short result = 0;
	while (true) {
		short x1A = cast(short)(x10.integer - arg3);
		short x18 = cast(short)(x14.integer - arg4);
		if (((0 > x1A) ? (cast(short)-cast(int)x1A) : x1A <= 1) && ((0 > x18) ? (cast(short)-cast(int)x18) : x18 <= 1)) {
			break;
		}
		short x18_2 = (UnknownC41EFF(x10.integer, x14.integer, arg3, arg4) + 0x1000) / 0x2000;
		UnknownC48C97(UnknownC48C59[x18_2]);
		x10.combined += horizontalMovementSpeeds[x18_2 / 8].directionSpeeds[0].combined;
		x14.combined += verticalMovementSpeeds[x18_2 / 8].directionSpeeds[0].combined;
		result++;
	}
	return result;
}

/// $C48E6B
void UnknownC48E6B(short arg1, short arg2) {
	for (short i = arg2; i != 0; i--) {
		UnknownC48C97(UnknownC48C59[arg1]);
	}
}

/// $C48E95
void UnknownC48E95() {
	Unknown7E9E58[++Unknown7E9F18].unknown0 = 0;
	UnknownC0402B(&Unknown7E9E58[0]);
}

/// $C48ECE
short IsValidItemTransformation(short arg1) {
	if (LoadedItemTransformations[arg1].transformationCountdown != 0) {
		return 1;
	}
	if (LoadedItemTransformations[arg1].sfxFrequency != 0) {
		return 1;
	}
	return 0;
}

/// $C48EEB
void InitializeItemTransformation(short arg1) {
	if (IsValidItemTransformation(arg1) == 0) {
		Unknown7E9F2C = 0x3C;
		Unknown7E9F2A++;
	}
	LoadedItemTransformations[arg1].sfx = TimedItemTransformationTable[arg1].sfx;
	LoadedItemTransformations[arg1].sfxFrequency = TimedItemTransformationTable[arg1].sfxFrequency;
	LoadedItemTransformations[arg1].sfxCountdown = cast(ubyte)(TimedItemTransformationTable[arg1].sfxFrequency + randMod(2) - 1);
	LoadedItemTransformations[arg1].transformationCountdown = TimedItemTransformationTable[arg1].transformationTime;
}

/// $C48F98
void UnknownC48F98(short arg1) {
	if (IsValidItemTransformation(arg1) == 0) {
		return;
	}
	Unknown7E9F2A--;
	LoadedItemTransformations[arg1].sfxFrequency = 0;
	LoadedItemTransformations[arg1].transformationCountdown = 0;
}

/// $C48FC4
void ProcessItemTransformations() {
	if (BattleSwirlFlag + BattleSwirlCountdown != 0) {
		return;
	}
	if (Unknown7EB4B6 != 0) {
		return;
	}
	if (gameState.unknownB0 == 2) {
		return;
	}
	if (--Unknown7E9F2C != 0) {
		return;
	}
	Unknown7E9F2C = 0x3C;
	LoadedItemTransformation* x02 = LoadedItemTransformations.ptr;
	short x14 = 1;
	short x12 = 0;
	for (short i = 0; i < 4; i++) {
		if ((x14 != 0) && (x02.sfxFrequency != 0) && (x02.sfxCountdown-- == 0)) {
			x02.sfxCountdown = cast(ubyte)(x02.sfxFrequency + randMod(2) - 1);
			PlaySfx(x02.sfx);
			x14 = 0;
		}
		if (x02.transformationCountdown != 0) {
			if (x02.transformationCountdown-- == 0) {
				GiveItemToCharacter(TakeItemFromCharacter(0xFF, TimedItemTransformationTable[i].item), TimedItemTransformationTable[i].targetItem);
			}
		}
		x02++;
	}
}

/// $C490EE
short UnknownC490EE() {
	short x04 = UnknownC46028(0x178);
	if (x04 == -1) {
		return 0;
	}
	if (EntityAbsXTable[x04] < gameState.leaderX.integer - 0x40) {
		return 1;
	}
	if (EntityAbsXTable[x04] == gameState.leaderX.integer + 0x40) {
		if (EntityAbsYTable[x04] < gameState.leaderY.integer - 0x40) {
			return 1;
		}
		if (EntityAbsYTable[x04] > gameState.leaderY.integer + 0x40) {
			return 1;
		}
	} else {
		return 1;
	}
	short x10 = cast(short)(EntityAbsYTable[x04] - gameState.leaderY.integer);
	if (x10 < 0) {
		x10 = cast(short)-cast(int)x10;
	}
	short x12 = cast(short)(EntityAbsXTable[x04] - gameState.leaderX.integer);
	if (x12 < 0) {
		x12 = cast(short)-cast(int)x12;
	}
	if (x10 + x12 < 16) {
		return 10;
	}
	return ((UnknownC41EFF(gameState.leaderX.integer, gameState.leaderY.integer, EntityAbsXTable[x04], EntityAbsYTable[x04]) + 0x1000) / 0x2000) + 2;
}


/// $C491EE
ushort UnknownC491EE(ushort arg1, ushort arg2, short arg3) {
	return cast(ushort)(((arg2 - arg1) << 8) / arg3);
}

/// $C49209
void UnknownC49208(short arg1) {
	ushort* buf = cast(ushort*)(&Unknown7F0000[0]);
	ushort* x06 = &buf[0x3C00];
	for (short i = 0; i < 0x60; i++) {
		buf[0x3C80 + i] = UnknownC491EE(palettes[2][i] & 0x1F, x06[0] & 0x1F, arg1);
		buf[0x3D00 + i] = UnknownC491EE((palettes[2][i] & 0x3E0) >> 5, (x06[0] & 0x3E0) >> 5, arg1);
		buf[0x3D80 + i] = UnknownC491EE((palettes[2][i] & 0x7C00) >> 10, (x06[0] & 0x7C00) >> 10, arg1);

		buf[0x3E00 + i] = ((palettes[2][i] & 0x1F) << 8) & 0xFF00;
		buf[0x3E80 + i] = (palettes[2][i] & 0x3E0) << 3;
		buf[0x3F00 + i] = (palettes[2][i] & 0x7C00) >> 2;
		x06++;
	}
}

/// $C492D2
void UnknownC492D2() {
	ushort* x12 = &palettes[2][0];
	ushort* buf = cast(ushort*)&Unknown7F0000[0];
	for (short i = 0; i < 0x60; i++) {
		buf[0x3E00 + i * 2] += buf[0x3C80 + i * 2];
		buf[0x3E80 + i * 2] += buf[0x3D00 + i * 2];
		buf[0x3F00 + i * 2] += buf[0x3D80 + i * 2];
		x12[0] = ((buf[0x3E00 + i * 2] >> 8) & 0x1F) | (((buf[0x3E80 + i * 2] >> 8) & 0x1F) << 5) | (((buf[0x3F00 + i * 2] >> 8) & 0x1F) << 10);
		x12++;
	}
}

/// $C4939C
void UnknownC4939C(ubyte arg1, ubyte arg2, ubyte arg3) {
	Unknown7E4474 = 0;
	if (arg3 == 0) {
		memcpy(&palettes[2][0], &MapPalettePointerTable[arg1][arg2 * 0xC0], 0xC0);
	} else {
		memcpy(&Unknown7F0000[0x7800], &MapPalettePointerTable[arg1][arg2 * 0xC0], 0xC0);
		UnknownC49208(arg3);
		for (short i = 0; i < arg3; i++) {
			WaitUntilNextFrame();
			UnknownC492D2();
		}
		memcpy(&palettes[2][0], &MapPalettePointerTable[arg1][arg2 * 0xC0], 0xC0);
		memcpy(&palettes[0][0], &SpriteGroupPalettes[0], 0x100);
		UnknownC00480();
		LoadSpecialSpritePalette();
		UnknownC0856B(0x18);
		while (Unknown7E0030 != 0) {}
	}
}

/// $C49496
ushort UnknownC49496(ushort arg1, short arg2) {
	ushort red;
	ushort green;
	ushort blue;
	if (arg2 < 0x32) {
		red = cast(ushort)((arg1 & 0x1F) * arg2 * 5);
		green = cast(ushort)(((arg1 >> 5) & 0x1F) * arg2 * 5);
		blue = cast(ushort)(((arg1 >> 10) & 0x1F) * arg2 * 5);
		if (red > 0x1E45) {
			red = 0x1F00;
		}
		if (green > 0x1E45) {
			green = 0x1F00;
		}
		if (blue > 0x1E45) {
			blue = 0x1F00;
		}
	} else if (arg2 != 0x32) {
		red = 0x1F00;
		green = 0x1F00;
		blue = 0x1F00;
	}
	return cast(ushort)(((red >> 8) & 0xFF) | (((green >> 8) & 0xFF) << 5) | (((blue >> 8) & 0xFF) << 10));
}

/// $C4954C
void UnknownC4954C(short arg1, ushort* arg2) {
	ushort* x06 = cast(ushort*)(&Unknown7F0000[0]);
	for (short i = 0; i < 0x100; i++) {
		*(x06++) = UnknownC49496(*(arg2++), arg1);
	}
}

/// $C4958E
void UnknownC4958E(short arg1, short arg2, ushort* arg3) {
	ushort* x06 = cast(ushort*)&Unknown7F0000[0];
	memset(&Unknown7F0000[0x200], 0, 0x1000);
	for (ushort i = 0; i < 0x100; i += 16) {
		for (ushort j = i; i + 16 > j; j++) {
			ushort x02;
			if ((arg2 & 1) != 0) {
				x02 = x06[j];
			} else {
				x02 = arg3[j];
				x06[j] = x02;
			}
			x06[0x100 + j] = UnknownC491EE(arg3[j] & 0x1F, x02 & 0x1F, arg1);
			x06[0x200 + j] = UnknownC491EE((arg3[j] & 0x3E0) >> 5, (x02 & 0x3E0) >> 5, arg1);
			x06[0x300 + j] = UnknownC491EE((arg3[j] & 0x7C00) >> 10, (x02 & 0x7C00) >> 10, arg1);
		}
		for (short j = i; j < i + 16; j++) {
			x06[0x400 + j] = (arg3[j] & 0x1F) << 8;
			x06[0x500 + j] = (arg3[j] & 0x3E0) << 3;
			x06[0x600 + j] = (arg3[j] & 0x7C00) >> 2;
		}
		arg2 >>= 1;
	}
}

/// $C496E7
void UnknownC496E7(short arg1, short arg2) {
	UnknownC4958E(arg1, arg2, &palettes[0][0]);
}

/// $C496F9
void UnknownC496F9() {
	memcpy(&Unknown7F0000[0], &palettes[0][0], 0x200);
}

/// $C49740
void UnknownC49740() {
	memcpy(palettes.ptr, Unknown7F0000.ptr, 0x200);
	UnknownC0856B(0x18);
}

/// $C4984B
void UnknownC4984B() {
	ushort* x0E = cast(ushort*)&VWFBuffer[0][0];
	for (short i = 0x340; i != 0; i--) {
		x0E[0] ^= 0xFFFF;
		x0E++;
	}
}

/// $C49875
void UnknownC49875(ubyte arg1, ushort width, ubyte* buf, const(ubyte)* fontData) {
	ubyte* x02 = &buf[Unknown7E9F31];
	ubyte* x12 = x02;
	ubyte* x06 = buf;
	for (short i = 0; 2 > i; i++) {
		for (short j = 0; j < 8; j++) {
			*(x02 + 1) &= ((x06[0] ^ 0xFF) >> (Unknown7E9F2F % 8)) ^ 0xFF;
			*x02 = *(x02 + 1);
			x02 += 2;
			x06++;
		}
		x02 = &buf[Unknown7E9F31 + 0x1A0];
	}
	Unknown7E9F2F += arg1;
	if (Unknown7E9F2F / 8 == Unknown7E9F31) {
		return;
	}
	arg1 = cast(ubyte)((Unknown7E9F2F / 8) * 16);
	Unknown7E9F31 = arg1;
	for (short i = 0; 2 > i; i++) {
		for (short j = 0; j < 8; j++) {
			*(x02 + 1) &= ((x06[0] ^ 0xFF) << (8 - (Unknown7E9F2F % 8))) ^ 0xFF;
			*x02 = *(x02 + 1);
			x02 += 2;
			x06++;
		}
		x02 = &buf[arg1 + 0x1A0];
	}
}

/// $C4999B
void UnknownC4999B(ubyte arg1) {
	arg1 = (arg1 - 0x50) & 0x7F;
	const(ubyte)* x06 = &FontConfigTable[Font.Large].graphics[arg1 * FontConfigTable[Font.Large].height];
	ubyte x02 = cast(ubyte)(FontConfigTable[Font.Large].data[arg1] + 1);
	while (x02 > 8) {
		UnknownC49875(8, FontConfigTable[Font.Large].width, &VWFBuffer[0][0], x06);
		x02 -= 8;
		x06 += FontConfigTable[Font.Large].width;
	}
	UnknownC49875(x02, FontConfigTable[Font.Large].width, &VWFBuffer[0][0], x06);
}

/// $C49A4B
void UnknownC49A4B() {
	WaitUntilNextFrame();
	UnknownC2DB3F();
}

/// $C49A56
void UnknownC49A56() {
	UnknownC08726();
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	CopyToVram(3, 0x3800, 0x6000, &Unknown7F0000[0]);
	memcpy(&palettes[0][0], &MovementTextStringPalette[0], 8);
	Unknown7E0030 = 0x18;
	memset(&VWFBuffer[0][0], 0xFF, 0x680);
	ushort y = 0x10;
	for (short i = 0; i < 0x20; i++) {
		bg2Buffer[i * 32] = 0;
		bg2Buffer[i * 32 + 2] = 0;
		bg2Buffer[i * 32 + 4] = 0;
		for (short j = 0; j < 0x1D; j++) {
			bg2Buffer[i * 32 + j] = cast(ushort)(0x2000 + y);
			y++;
		}
		bg2Buffer[i * 32 + 58] = 0;
		bg2Buffer[i * 32 + 60] = 0;
		bg2Buffer[i * 32 + 62] = 0;
	}
	CopyToVram(0, 0x800, 0x7C00, cast(ubyte*)&bg2Buffer[0]);
	Unknown7E3C18 = 0x1A;
	Unknown7E3C1C = 0;
	Unknown7E3C1E = -1;
	Unknown7E3C20 = 0;
	Unknown7E3C14 = 0;
	Unknown7E3C16 = 0;
	Unknown7E9F2F = 0;
	Unknown7E9F31 = 0;
	UnknownC08744();
}

/// $C49B6E
void UnknownC49B6E(short arg1) {
	UnknownC4984B();
	if (Unknown7E9F2D * 0x1A0 + 0x4E0 > 0x3400) {
		if (0x3400 - Unknown7E9F2D * 0x1A0 != 0) {
			CopyToVram(0, cast(short)(0x3400 - Unknown7E9F2D * 0x1A0), cast(ushort)(0xD0 * Unknown7E9F2D + 0x6150), &VWFBuffer[0][0]);
		}
		if (Unknown7E9F2D * 0x1A0 + 0x4E0 - 0x3400 != 0) {
			//CopyToVram(0, Unknown7E9F2D * 0x1A0 + 0x4E0 - 0x3400, 0x6150, 0x6892 - Unknown7E9F2D * 0x1A0);
		}
	} else {
		CopyToVram(0, 0x4E0, cast(ushort)(0xD0 * Unknown7E9F2D + 0x6150), &VWFBuffer[0][0]);
	}
	Unknown7E3C1E = -1;
	Unknown7E3C20 = 0;
	WaitUntilNextFrame();
}

/// $C49C56
void UnknownC49C56(short arg1) {
	Unknown7E3C16 += arg1;
	Unknown7E3C14 = 0;
	Unknown7E9F2D += Unknown7E3C16 / 8 + 1;
	if (Unknown7E9F2D >= 0x20) {
		Unknown7E9F2D -= 0x20;
	}
	UnknownC08F8B();
	memset(&VWFBuffer[0][0], 0xFF, 0x680);
	Unknown7E3C16 &= 7;
	Unknown7E9F2F = 0;
	Unknown7E9F31 = 0;
}

/// $C49CA8
void UnknownC49CA8(ubyte arg1) {
	Unknown7E9F2F += arg1 + 8;
	Unknown7E9F31 = cast(short)((Unknown7E9F2F / 8) * 16);
}

/// $C49CC3
void UnknownC49CC3(ubyte arg1, short arg2) {
	ubyte* x06 = &PartyCharacters[arg1 - 1].name[0];
	for (short i = 0; (i < 5) && (x06[0] > 0x4F); i++) {
		UnknownC4999B(*(x06++));
	}
}

/// $C49D16
// seems weird, but mother 2 did make use of the other args
void UnknownC49D16(ubyte arg1, short, short) {
	UnknownC4999B(arg1);
}

/// $C49D1E
short UnknownC49D1E(short arg1) {
	OAMClear();
	ushort x02 = arg1 & 0xFF00;
	short x0E = cast(short)(arg1 + 0x40);
	arg1 = cast(short)((arg1 + 0x40) & 0xFF00);
	if (arg1 != x02) {
		BG3_Y_POS += (arg1 - x02) >> 8;
		UpdateScreen();
	}
	return x0E;
}

/// $C49D6A
void CoffeeTeaScene(short id) {
	FadeOutWithMosaic(1, 1, 0);
	UnknownC49A56();
	OAMClear();
	LoadBackgroundAnimation((id == 0) ? BattleBGLayer.Coffee1 : BattleBGLayer.Tea1, (id == 0) ? BattleBGLayer.Coffee2 : BattleBGLayer.Tea2);
	FadeIn(1, 1);
	Unknown7E9F2D = 0x1C;
	short x04 = 0;
	const(ubyte)* x06 = (id == 0) ? CoffeeSequenceText : TeaSequenceText;
	Unknown7E5E6E = 0;
	parseLoop: while (true) {
		switch ((x06++)[0]) {
			case 0:
				break parseLoop;
			case 9:
				short x0E = UnknownC49D1E(x04);
				UnknownC49B6E(0x18);
				UnknownC2DB3F();
				while (x0E < 0x2000) {
					x0E = UnknownC49D1E(x0E);
					UnknownC49A4B();
				}
				x04 = cast(short)(x0E - 0x2000);
				UnknownC49B6E(0x18);
				break;
			case 1:
				UnknownC49CA8(*(x06++));
				break;
			case 8:
				UnknownC49CC3(0xC, *(x06++));
				break;
			default:
				UnknownC49D16(*(x06 - 1), 0, 0xC);
				break;
		}
	}
	FadeOut(1, 1);
	while (Unknown7E0028.a != 0) {
		UnknownC49A4B();
	}
	UnknownC08726();
	ReloadMap();
	ushort* y = &bg2Buffer[0];
	for (short i = 0x380; i != 0; i--) {
		*(y++) = 0;
	}
	Unknown7E5E6E = 0xFF;
	UnknownC08726();
	UndrawFlyoverText();
	UnknownC08744();
	FadeIn(1, 1);
}

/// $C49EA4
immutable ubyte*[8] FlyoverTextPointers;

/// $C49EC4
void UnknownC49EC4(short id) {
	ushort x02 = EntityTickCallbackFlags[23];
	EntityTickCallbackFlags[23] |= 0xC000;
	UnknownC49A56();
	immutable(ubyte)* x06 = FlyoverTextPointers[id];
	Unknown7E5E6E = 0;
	while (true) {
		switch(*(x06++)) {
			case 0:
				TM_MIRROR = 4;
				FadeInWithMosaic(1, 3, 0);
				for (short i = 0; i < 0xB4; i++) {
					WaitUntilNextFrame();
				}
				FadeOutWithMosaic(1, 3, 0);
				TM_MIRROR = 0x17;
				ushort* buf = bg2Buffer.ptr;
				for (short i = 0x380; i != 0; i--) {
					*(buf++) = 0;
				}
				Unknown7E5E6E = 0xFF;
				UnknownC08726();
				UndrawFlyoverText();
				EntityTickCallbackFlags[23] = x02;
				UnknownC08744();
				return;
			case 2:
				Unknown7E9F2D = *(x06++);
				break;
			case 9:
				UnknownC49B6E(0x18);
				WaitUntilNextFrame();
				UnknownC49C56(0x18);
				break;
			case 1:
				UnknownC49CA8(*(x06++));
				break;
			case 8:
				UnknownC49CC3(*(x06++), 0xC);
				break;
			default:
				UnknownC49D16(*(x06 - 1), 0, 0xC);
				break;
		}
	}
}

/// $C49FE1
immutable ubyte[16][10] BattleMenuText = [
	EBString!16("Bash"),
	EBString!16("Goods"),
	EBString!16("Auto Fight"),
	EBString!16("PSI"),
	EBString!16("Defend"),
	EBString!16("Pray"),
	EBString!16("Shoot"),
	EBString!16("Spy"),
	EBString!16("Run Away"),
	EBString!16("Mirror"),
];

immutable ubyte[12] BattleMenuTextDoNothing = EBString!12("Do Nothing");

/// $C4A08D
immutable ushort[33] DeadTargettableActions = [
	BattleActions.PSILifeupAlpha,
	BattleActions.PSILifeupBeta,
	BattleActions.PSILifeupGamma,
	BattleActions.PSILifeupOmega,
	BattleActions.PSIHealingAlpha,
	BattleActions.PSIHealingBeta,
	BattleActions.PSIHealingGamma,
	BattleActions.PSIHealingOmega,
	BattleActions.Action135,
	BattleActions.Action136,
	BattleActions.Action137,
	BattleActions.Action138,
	BattleActions.Action139,
	BattleActions.HandAid,
	BattleActions.Action141,
	BattleActions.Action142,
	BattleActions.Action143,
	BattleActions.Action144,
	BattleActions.Action145,
	BattleActions.Action146,
	BattleActions.Action147,
	BattleActions.Action148,
	BattleActions.WetTowel,
	BattleActions.RefreshingHerb,
	BattleActions.SecretHerb,
	BattleActions.FullStatusHeal,
	BattleActions.Action153,
	BattleActions.Action154,
	BattleActions.Action155,
	BattleActions.Action156,
	BattleActions.Action157,
	BattleActions.Action158,
	0,
];

/// $C4A0CF
short AutoHealing(short arg1, short arg2) {
	short x12 = 9999;
	short x04 = 0;
	for (short i = 0; i < 6; i++) {
		if ((gameState.partyMembers[i] < 1) || (gameState.partyMembers[i] > 4)) {
			continue;
		}
		if (PartyCharacters[gameState.partyMembers[i]].unknown94 != 0) {
			continue;
		}
		if (PartyCharacters[gameState.partyMembers[i]].afflictions[arg1] != arg2) {
			continue;
		}
		if (PartyCharacters[gameState.partyMembers[i]].hp.target >= x12) {
			continue;
		}
		x12 = PartyCharacters[gameState.partyMembers[i]].hp.target;
		x04 = gameState.partyMembers[i];
	}
	if (x04 != 0) {
		PartyCharacters[x04 - 1].unknown94 = 1;
	}
	return x04;
}

/// $C4A15D
short AutoLifeup() {
	short x14 = 9999;
	short x04 = 0;
	for (short i = 0; i < 6; i++) {
		if ((gameState.partyMembers[i] < 1) || (gameState.partyMembers[i] > 4)) {
			continue;
		}
		if (PartyCharacters[gameState.partyMembers[i]].unknown94 != 0) {
			continue;
		}
		if (PartyCharacters[gameState.partyMembers[i]].afflictions[0] == Status0.Unconscious) {
			continue;
		}
		if (PartyCharacters[gameState.partyMembers[i]].hp.target >= PartyCharacters[gameState.partyMembers[i]].maxHP / 4) {
			continue;
		}
		if (PartyCharacters[gameState.partyMembers[i]].hp.target >= x14) {
			continue;
		}
		x14 = PartyCharacters[gameState.partyMembers[i]].hp.target;
		x04 = gameState.partyMembers[i];
	}
	if (x04 != 0) {
		PartyCharacters[x04 - 1].unknown94 = 1;
	}
	return x04;
}

/// $C4A1F2
immutable ubyte[3] BattleWindows = [ Window.BattleMenuJeff, Window.BattleMenu, Window.Unknown30 ];

/// $C4A1F5
short CheckIfValidTarget(short arg1) {
	if ((BattlersTable[arg1].consciousness != 0) &&
		(BattlersTable[arg1].npcID == 0) &&
		(BattlersTable[arg1].afflictions[0] != Status0.Unconscious) &&
		(BattlersTable[arg1].afflictions[0] != Status0.Diamondized)) {
		return 1;
	}
	return 0;
}

/// $C4A228
void UnknownC4A228(Battler* battler, short arg2) {
	for (short i = 0; i < Unknown7EAD56; i++) {
		if (Unknown7EAD7A[i] != arg2) {
			continue;
		}
		battler.currentTarget = cast(ubyte)(arg2 + 1);
		return;
	}
	for (short i = 0; i < Unknown7EAD58; i++) {
		if (Unknown7EAD82[i] != arg2) {
			continue;
		}
		battler.currentTarget = cast(ubyte)(i + Unknown7EAD56 + 1);
		return;
	}
}

/// $C4A228
immutable uint[32] PowersOfTwo32Bit = [
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
immutable ushort[22] GiygasDeathStaticTransitionDelays = [
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
immutable FinalGiygasPrayerNoiseEntry[13] FinalGiygasPrayerNoiseTable = [
		FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 90),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 25),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 90),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 25),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 75),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 10),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 8),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 10),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 6),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 6),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 6),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 6),
		FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 0),
];

/// $C4A377
void UnknownC4A377() {
	UnknownC08D79(3);
	SetBG1VRAMLocation(BGTileMapSize.normal, 0x7800, 0);
	SetBG2VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	Decomp(&BattleBGGraphicsPointers[animatedBackgrounds[295].graphics][0], &Unknown7F0000[0]);
	CopyToVram(0, 0x2000, 0x6000, &Unknown7F0000[0]);
	Decomp(&BattleBGArrangementPointers[animatedBackgrounds[295].graphics][0], &Unknown7F0000[0]);
	for (short i = 0; i < 0x800; i += 2) {
		Unknown7F0000[i + 1] = (Unknown7F0000[i + 1] & 0xDF) | 8;
	}
	CopyToVram(0, 0x800, 0x7C00, &Unknown7F0000[0]);
	UnknownC2CFE5(&LoadedBGDataLayer1, &animatedBackgrounds[295]);
	LoadedBGDataLayer1.PalettePointer = &palettes[2];
	memcpy(&LoadedBGDataLayer1.Palette[0], &BattleBGPalettePointers[animatedBackgrounds[295].palette][0], 0x20);
	memcpy(&LoadedBGDataLayer1.Palette2[0], &BattleBGPalettePointers[animatedBackgrounds[295].palette][0], 0x20);
	memcpy(&LoadedBGDataLayer1.PalettePointer[0], &LoadedBGDataLayer1.Palette[0], 0x20);
	LoadedBGDataLayer1.TargetLayer = 2;
	GenerateBattleBGFrame(&LoadedBGDataLayer1, 0);
	LoadedBGDataLayer2.TargetLayer = 0;
}

/// $C4A591
immutable byte[61] UnknownC4A591 = [
	0, 14, 23, 23, 12, -5, -18, -16, 0, 15, 12, -6, -14, 0, 13, 2, -11, 0, 10, -4, -7, 8, 0, -6, 7, -2, -3, 6, -5, 3, 0, -2, 3, -4, 4, -4, 4, -3, 3, -3, 3, -2, 2, -1, 0, 1, -2, 2, -1, -1, 2, -1, 0, 1, -1, -1, 1, 0, -1, 0, 1
];

/// $C4A5CE
immutable Unknown7EAECCEntry[2] UnknownC4A5CE = [
	Unknown7EAECCEntry(0x3D, 0x00, 0x0080, 0x0070, 0x0000, 0x0000, 0x0000, 0x0000, 0x00E0, 0x00B7, 0x0004, 0x0003),
	Unknown7EAECCEntry(0),
];

/// $C4A5FA
immutable Unknown7EAECCEntry[2] UnknownC4A5FA = [
	Unknown7EAECCEntry(0x64, 0x00, 0x0080, 0x0070, 0x0000, 0x0000, 0x0000, 0x0000, 0x00E0, 0x00B7, 0x0004, 0x0003),
	Unknown7EAECCEntry(0),
];

/// $C4A626
immutable Unknown7EAECCEntry[2] UnknownC4A626 = [
	Unknown7EAECCEntry(0x3D, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0),
];

/// $C4A652
immutable Unknown7EAECCEntry[2] UnknownC4A652 = [
	Unknown7EAECCEntry(0x64, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0),
];

/// $C4A67E
void UnknownC4A67E(short arg1, short arg2) {
	if ((arg2 & 2) != 0) {
		Unknown7EAEC6 = 1;
	} else {
		Unknown7EAEC6 = 0;
	}
	if ((arg2 & 1) != 0) {
		Unknown7EAEC7 = 1;
	} else {
		Unknown7EAEC7 = 0;
	}
	if ((arg2 & 4) != 0) {
		Unknown7EAEC8 = 32;
	} else {
		Unknown7EAEC8 = 31;
	}
	Unknown7EAEC2 = 1;
	Unknown7EAEC3 = SwirlPrimaryTable[arg1][0];
	Unknown7EAEC4 = SwirlPrimaryTable[arg1][2];
	Unknown7EAEC5 = SwirlPrimaryTable[arg1][1];
	if (Unknown7EAEC7 != 0) {
		Unknown7EAEC5 += Unknown7EAEC4;
	}
	Unknown7EAECC = null;
	if (arg1 == 0) {
		Unknown7EAECC = &UnknownC4A5CE[0];
	}
	Unknown7EAEC9 = 0;
	Unknown7EAECA = 0;
	Unknown7EAEC8 = 1;
	if ((arg2 & 0x80) != 0) {
		Unknown7EAEE4 = cast(ubyte)arg1;
		Unknown7EAEC3 = 4;
		Unknown7EAEE5 = 0;
		Unknown7EAEE6 = 6;
	} else {
		Unknown7EAEE4 = 0;
	}
	UnknownC0B0AA();
}

/// $C4A7B0
void UnknownC4A7B0() {
	if (Unknown7EAEC2 == 0) {
		return;
	}
	if (Unknown7EAECC != null) {
		if (--Unknown7EAEC2 == 0) {
			if (Unknown7EAECC.unknown0 == 0) {
				Unknown7EAECC = null;
				return;
			}
			if (Unknown7EAECC.unknown2 != 0x8000) {
				Unknown7EAED0 = Unknown7EAECC.unknown2;
			}
			if (Unknown7EAECC.unknown4 != 0x8000) {
				Unknown7EAED2 = Unknown7EAECC.unknown4;
			}
			if (Unknown7EAECC.unknown6 != 0x8000) {
				Unknown7EAED4 = Unknown7EAECC.unknown6;
			}
			if (Unknown7EAECC.unknown8 != 0x8000) {
				Unknown7EAED6 = Unknown7EAECC.unknown8;
			}
			Unknown7EAED8 = Unknown7EAECC.unknown10;
			Unknown7EAEDA = Unknown7EAECC.unknown12;
			Unknown7EAEDC = Unknown7EAECC.unknown14;
			Unknown7EAEDE = Unknown7EAECC.unknown16;
			Unknown7EAEE0 = Unknown7EAECC.unknown18;
			Unknown7EAEE2 = Unknown7EAECC.unknown20;
			Unknown7EAECC++;
		}
		Unknown7EAED0 += Unknown7EAED8;
		Unknown7EAED2 += Unknown7EAEDA;
		Unknown7EAEDC += Unknown7EAEE0;
		Unknown7EAEDE += Unknown7EAEE2;
		if ((0 > Unknown7EAEDC) && (Unknown7EAED4 < -cast(int)Unknown7EAEDC)) {
			Unknown7EAED4 = 0;
		} else {
			Unknown7EAED4 += Unknown7EAEDC;
		}
		if ((0 > Unknown7EAEDE) && (Unknown7EAED6 < -cast(int)Unknown7EAEDE)) {
			Unknown7EAED6 = 0;
		} else {
			Unknown7EAED6 += Unknown7EAEDE;
		}
		if ((Unknown7EAED4 == 0) && (Unknown7EAED6 == 0)) {
			Unknown7EAEC2 = 0;
			Unknown7EAECC = null;
		}
		UnknownC0B149(Unknown7EAED0, Unknown7EAED2, (Unknown7EAED4 >> 8) & 0xFF, (Unknown7EAED6 >> 8) & 0xFF);
		EnableAttractModeWindowHDMA(3, 0x41);
		SetWindowMask(Unknown7EAEC8, (Unknown7EAEC6 >> 8) & 0xFF);
		return;
	}

	if (--Unknown7EAEC2 != 0) {
		return;
	}
	while (true) { //pretty weird but I'm not sure how else to express this mass of branches
		if (Unknown7EAEC4 != 0) {
			Unknown7EAEC2 = Unknown7EAEC3;
			UnknownC0AE34(Unknown7EAEC9 + 3);
			Unknown7EAEC9++;
			Unknown7EAEC9 &= 1;
			if (Unknown7EAEC7 == 0) {
				UnknownC0B0B8(Unknown7EAEC9 + 3, &SwirlPointerTable[Unknown7EAEC5 + 1][0]);
			} else {
				UnknownC0B0B8(Unknown7EAEC9 + 3, &SwirlPointerTable[Unknown7EAEC5 - 1][0]);
			}
			SetWindowMask(Unknown7EAEC8, Unknown7EAEC6);
			Unknown7EAEC4--;
			return;
		}
		if (Unknown7EAEE4 != 0) {
			if (--Unknown7EAEE6 != 0) {
				Unknown7EAEC4 = SwirlPrimaryTable[Unknown7EAEE4][2];
				Unknown7EAEE6 = SwirlPrimaryTable[Unknown7EAEE4][1];
				if (Unknown7EAEC7 == 0) {
					continue;
				}
				Unknown7EAEE6 += Unknown7EAEC4;
				continue;
			}
			switch (++Unknown7EAEE5) {
				case 1:
					Unknown7EAEE6 = 7;
					Unknown7EAEC3 = 3;
					break;
				case 2:
					Unknown7EAEE6 = 6;
					Unknown7EAEC3 = 2;
					break;
				case 3:
					Unknown7EAEE6 = 12;
					Unknown7EAEC3 = 1;
					break;
				default: break;
			}
			if (Unknown7EAEE6 != 0) {
				continue;
			}
		}
		if (Unknown7EAECA != 0) {
			Unknown7EAEC2 = 1;
			Unknown7EAECA--;
			return;
		}
		break;
	}
	if (Unknown7EAECB == 0) {
		return;
	}
	UnknownC0AE34(Unknown7EAEC9 + 3);
	SetWindowMask(0, 0);
	UnknownC2DE96();
	SetColData(0, 0, 0);
	UnknownC0AFCD(Unknown7EAD8A);
}

/// $C4AC57
immutable ubyte[][9] UnknownC4AC57 = [
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
immutable ubyte[8] SoundStoneUnknown = [
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
immutable ubyte[8] SoundStoneUnknown2 = [
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
immutable ubyte[8] SoundStoneUnknown3 = [
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
immutable ubyte[8] SoundStoneUnknown4 = [
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
immutable ubyte[8] SoundStoneUnknown5 = [
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
immutable ubyte[8] SoundStoneUnknown6 = [
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
immutable ubyte[9] SoundStoneMusic = [
	Music.SoundstoneRecordingGiantStep,
	Music.SoundstoneRecordingLilliputSteps,
	Music.SoundstoneRecordingMilkyWell,
	Music.SoundstoneRecordingRainyCircle,
	Music.SoundstoneRecordingMagnetHill,
	Music.SoundstoneRecordingPinkCloud,
	Music.SoundstoneRecordingLumineHall,
	Music.SoundstoneRecordingFireSpring,
	Music.SoundstoneBGM,
];

/// $C4ACB4
immutable short[4] SoundStoneUnknown7 = [
	0x0121,
	0x00D2,
	0x00D1,
	0x00D2,
];

/// $C4ACBC
immutable short[5] SoundStoneUnknown8 = [
	0x00D2,
	0x00D1,
	0x00D2,
	0x00D2,
	0x00D2,
];

/// $C4AC83
immutable ushort[8] SoundStoneMelodyFlags = [
	EventFlag.SOUND_STONE_MELODY_1,
	EventFlag.SOUND_STONE_MELODY_2,
	EventFlag.SOUND_STONE_MELODY_3,
	EventFlag.SOUND_STONE_MELODY_4,
	EventFlag.SOUND_STONE_MELODY_5,
	EventFlag.SOUND_STONE_MELODY_6,
	EventFlag.SOUND_STONE_MELODY_7,
	EventFlag.SOUND_STONE_MELODY_8,
];

/// $C4ACCE
void UseSoundStone(short arg1) {
	//x34 = arg1
	UnknownC08726();
	StopMusic();
	LoadEnemyBattleSprites();
	Decomp(&SoundStoneGraphics[0], &Unknown7F0000[0]);
	CopyToVram(0, 0x2C00, 0x2000, &Unknown7F0000[0]);
	memcpy(&palettes[8][0], &SoundStonePalette[0], 0xC0);
	UnknownC47F87();
	LoadBattleBG(BackgroundLayer.SoundStone1, BackgroundLayer.SoundStone2, 4);
	memset(&Unknown7EB3EE, 0, SpriteMap.sizeof);
	memset(&Unknown7EB3F3, 0, SpriteMap.sizeof);
	Unknown7EB3EE.unknown3 = 0xF0;
	Unknown7EB3EE.unknown0 = 0xF0;
	Unknown7EB3F3.unknown3 = 0xF8;
	Unknown7EB3F3.unknown0 = 0xF8;
	Unknown7EB3EE.unknown4 = 0x81;
	Unknown7EB3F3.unknown4 = 0x80;
	short x32 = 0;
	for (short i = 0; i < 8; i++) {
		if (getEventFlag(SoundStoneMelodyFlags[i]) != 0) {
			Unknown7EB37E[i].unknown0 = 1;
			x32++;
		} else {
			Unknown7EB37E[i].unknown0 = 0;
		}
		Unknown7EB37E[i].unknown2 = 1;
		Unknown7EB37E[i].unknown6 = 0;
	}
	UnknownC08744();
	FadeIn(1, 1);
	short x2E = 0xF;
	short x30 = 0;
	short x2C = 60;
	short x2A = 0;
	short x28 = 0;
	//short x04 = 0;
	short x26 = 0;
	//short x02 = 0;
	short x24 = 0;
	while (true) {
		WaitUntilNextFrame();
		short x22 = pad_press[0];
		if ((x26 == 0) && (--x2C == 0)) {
			x24 = -1;
			x28 = -1;
			x26 = 1;
		}
		if (x2A != 0) {
			if (--x2A == 0) {
				break;
			}
		} else if (x26 != 0){
			if (--x26 == 0) {
				if (x24 < 8) {
					if (Unknown7EB37E[x24].unknown0 == 2) {
						Unknown7EB37E[x24].unknown0 = 1;
					}
				} else if (x24 == 8) {
					short x20;
					for (x20 = cast(short)(x28 + 1); x20 < 8; x20++) {
						if (Unknown7EB37E[x20].unknown0 != 0) {
							break;
						}
					}
					if (x20 == 8) {
						x2A = 150;
					}
				}
				if (++x28 < 8) {
					x24 = x28;
					if (Unknown7EB37E[x24].unknown0 != 0) {
						Unknown7EB37E[x24].unknown0 = 2;
					} else {
						x24 = 8;
					}
					x26 = SoundStoneUnknown7[x24];
					ChangeMusic(SoundStoneMusic[x24]);
				} else {
					x2A = 150;
				}
			}
			if (x24 < 8) {
				if (x26 == SoundStoneUnknown7[x24] - 9) {
					UnknownC0AC0C(cast(short)(x32 + 8));
				}
			}
		}
		OAMClear();
		UnknownC088A5(0x7E);
		for (short i = 0; i < 8; i++) {
			switch (Unknown7EB37E[i].unknown0) {
				case 1:
					Unknown7EB3EE.unknown10 = SoundStoneUnknown3[i];
					Unknown7EB3EE.unknown11 = 0x30;
					UnknownC08CD5(&Unknown7EB3EE, SoundStoneUnknown[i], SoundStoneUnknown2[i]);
					break;
				case 2:
					Unknown7EB37E[i].unknown10 += 0xCCD;
					if (--Unknown7EB37E[i].unknown2 == 0) {
						Unknown7EB37E[i].unknown2 = 2;
						Unknown7EB37E[i].unknown8 = UnknownC4AC57[i][Unknown7EB37E[i].unknown6++];
						Unknown7EB37E[i].unknown4 = cast(short)(2 - Unknown7EB37E[i].unknown4);
					}
					Unknown7EB3F3.unknown10 = cast(ubyte)(SoundStoneUnknown5[i] + Unknown7EB37E[i].unknown4);
					Unknown7EB3F3.unknown11 = cast(ubyte)(SoundStoneUnknown6[i] + 0x31);
					if (Unknown7EB37E[i].unknown8 != 0) {
						UnknownC08CD5(&Unknown7EB3F3, cast(short)(SoundStoneUnknown[i] + CosineSine(Unknown7EB37E[i].unknown8, Unknown7EB37E[i].unknown10 >> 8)), cast(short)(SoundStoneUnknown2[i] + Cosine(Unknown7EB37E[i].unknown8, Unknown7EB37E[i].unknown10 >> 8)));
						UnknownC08CD5(&Unknown7EB3F3, cast(short)(SoundStoneUnknown[i] + CosineSine(Unknown7EB37E[i].unknown8, cast(ubyte)((Unknown7EB37E[i].unknown10 >> 8) + 0x80))), cast(short)(SoundStoneUnknown2[i] + Cosine(Unknown7EB37E[i].unknown8, cast(ubyte)((Unknown7EB37E[i].unknown10 >> 8) + 0x80))));
					}
					Unknown7EB3EE.unknown10 = cast(ubyte)(SoundStoneUnknown3[i] + 0x80);
					Unknown7EB3EE.unknown11 = cast(ubyte)(SoundStoneUnknown4[i] + 0x30);
					UnknownC08CD5(&Unknown7EB3EE, SoundStoneUnknown[i], SoundStoneUnknown2[i]);
					break;
				default: break;
			}
		}
		if (--x2E == 0) {
			x2E = 0xF;
			x30 = (x30 + 1) & 3;
		}
		Unknown7EB3F3.unknown10 = cast(ubyte)(x30 + 0x40);
		Unknown7EB3F3.unknown11 = 0x3B;
		UnknownC08CD5(&Unknown7EB3F3, 0x80, 0x70);
		UpdateScreen();
		GenerateBattleBGFrame(&LoadedBGDataLayer1, 0);
		GenerateBattleBGFrame(&LoadedBGDataLayer2, 1);
		if ((arg1 != 0) && ((x22 & (PAD_B | PAD_A | PAD_X)) != 0)) {
			break;
		}
	}
	FadeOut(1, 1);
	while (Unknown7E0028.a != 0) {
		WaitUntilNextFrame();
	}
	UnknownC08726();
	UnknownC0AFCD(1);
	ReloadMap();
	FadeIn(1, 1);
}

/// $C4B1B8
short UnknownC4B1B8(short arg1, short arg2, short arg3) {
	if (arg3 == 0xFF) {
		return arg1;
	}
	CopyToVram(0, SpriteGroupingPointers[arg2].width * 2, arg1, &SpriteGroupingPointers[arg2].sprites[arg3].data[0]);
	CopyToVram(0, SpriteGroupingPointers[arg2].width * 2, cast(ushort)(arg1 + 0x100), &SpriteGroupingPointers[arg2].sprites[arg3].data[SpriteGroupingPointers[arg2].width]);
	return cast(short)(arg1 + SpriteGroupingPointers[arg2].width);
}

/// $C4B26B
void LoadOverlaySprites() {
	short x12 = 0x5600;
	for (short i = 0; i < EntityOverlayCount; i++) {
		short x10 = UnknownC4B1B8(x12, EntityOverlaySprites[i].spriteID, EntityOverlaySprites[i].unknown2);
		x12 = UnknownC4B1B8(x10, EntityOverlaySprites[i].spriteID, EntityOverlaySprites[i].unknown3);
	}
	for (short i = 0; i < MAX_ENTITIES; i++) {
		EntityMushroomizedOverlayPtrs[i] = &EntityOverlayMushroomized[0];
		EntitySweatingOverlayPtrs[i] = &EntityOverlaySweating[0];
		EntityRippleOverlayPtrs[i] = &EntityOverlayRipple[0];
		EntityBigRippleOverlayPtrs[i] = &EntityOverlayBigRipple[0];
	}
}

/// $C4B329
void UnknownC4B329(short arg1, short arg2) {
	switch (arg1) {
		case 1:
			Unknown7EB3FA -= UnknownC42A41[arg2] + 8;
			goto case;
		case 4:
			Unknown7EB3F8 -= UnknownC42A1F[arg2] - 8;
			break;
		case 2:
			Unknown7EB3FA -= UnknownC42A41[arg2] - 8;
			goto case;
		case 5: break;
		case 3:
			Unknown7EB3FA -= UnknownC42A41[arg2] + 8;
			goto case;
		case 6:
			Unknown7EB3F8 -= UnknownC42A1F[arg2] + 8;
			break;
		default: break;
	}
}

/// $C4B3D0
void SpawnFloatingSprite(short arg1, short arg2) {
	if (arg1 == -1) {
		return;
	}
	if (EntityScriptTable[arg1] == -1) {
		return;
	}
	//FloatingSpriteTable[arg2]
	Unknown7EB3F8 = EntityAbsXTable[arg1];
	Unknown7EB3FA = EntityAbsYTable[arg1];
	UnknownC4B329(FloatingSpriteTable[arg2].unknown2, EntitySizes[arg1]);
	Unknown7EB3F8 += FloatingSpriteTable[arg2].unknown3 | (((FloatingSpriteTable[arg2].unknown3 & 0x80) != 0) ? -256 : 0);
	Unknown7EB3FA += FloatingSpriteTable[arg2].unknown4 | (((FloatingSpriteTable[arg2].unknown4 & 0x80) != 0) ? -256 : 0);
	short x12 = CreateEntity(FloatingSpriteTable[arg2].sprite, ActionScript.Unknown785, -1, Unknown7EB3F8, Unknown7EB3FA);
	EntityDrawPriority[x12] = cast(ushort)(arg1 | 0xC000);
	EntitySurfaceFlags[x12] = EntitySurfaceFlags[arg1];
}

/// $C4B4BE
void UnknownC4B4BE(short arg1) {
	if (arg1 == -1) {
		return;
	}
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (EntityDrawPriority[i] == (arg1 | 0xC000)) {
			EntityDrawPriority[i] = 0;
			UnknownC02140(i);
		}
	}
}

/// $C4B4FE
void UnknownC4B4FE(short arg1, short arg2) {
	SpawnFloatingSprite(UnknownC4608C(arg1), arg2);
}

/// $C4B524
void UnknownC4B524(short arg1, short arg2) {
	SpawnFloatingSprite(UnknownC4605A(arg1), arg2);
}

/// $C4B519
void UnknownC4B519(short arg1) {
	UnknownC4B4BE(UnknownC4608C(arg1));
}

/// $C4B53F
void UnknownC4B53F(short arg1) {
	UnknownC4B4BE(UnknownC4605A(arg1));
}

/// $C4B54A
void UnknownC4B54A(short arg1, short arg2) {
	SpawnFloatingSprite(UnknownC46028(arg1), arg2);
}

/// $C4B565
void UnknownC4B565(short arg1) {
	UnknownC4B4BE(UnknownC46028(arg1));
}

/// $C4B587
void* Path_sbrk(size_t inc) {
	void *ptr = path_heap_current;
	path_heap_current = cast(byte*)path_heap_current + inc;
	return ptr;
}

/// $C4B595
ushort Path_GetHeapSize() {
	return cast(ushort)(cast(byte*)path_heap_current - cast(byte*)path_heap_start);
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
	target_count = Amount of VecYX elements in the `targets_pos` array
	targets_pos = Array of VecYX containing the positions of the targets
	pather_count = Amount of Pather elements in the `pathers` array
	pathers = Array of Pather for the pathfinding objects
	unk1 = Unknown (-1 as called from $C0BA35)
	unk2 = Unknown, always 0xFC
	search_radius = Just a guess...
++/
ushort Path_Main(ushort heap_size, void *heap_start, VecYX *matrix_dim, ubyte *matrix, ushort border_size, ushort target_count, VecYX* targets_pos, ushort pather_count, Pather* pathers, short unk1, ushort unk2, ushort search_radius) {
	ushort dp20 = 0;

	path_heap_start = heap_start;
	path_heap_current = heap_start;
	path_heap_end = cast(byte*)heap_start + heap_size;

	path_matrix_rows = matrix_dim.y;
	path_matrix_cols = matrix_dim.x;
	path_matrix_border = border_size;
	path_matrix_size = cast(ushort)(path_matrix_rows * path_matrix_cols);
	path_matrix_buffer = matrix;

	ushort *ptr = cast(ushort*)Path_sbrk(search_radius*int.sizeof + int.sizeof); // dp1E
	path_B408 = ptr;
	path_B40A = ptr + cast(size_t)heap_start;
	path_B40C = ptr;
	path_B40E = ptr;

	path_cardinal_offset[0] = cast(short)-cast(int)path_matrix_cols; // NORTH
	path_cardinal_offset[1] = 1; // EAST
	path_cardinal_offset[2] = path_matrix_cols; // SOUTH
	path_cardinal_offset[3] = -1; // WEST

	// NORTH
	path_cardinal_index[0].y = -1;
	path_cardinal_index[0].x = 0;
	// EAST
	path_cardinal_index[1].y = 0;
	path_cardinal_index[1].x = 1;
	// SOUTH
	path_cardinal_index[2].y = 1;
	path_cardinal_index[2].x = 0;
	// WEST
	path_cardinal_index[3].y = 0;
	path_cardinal_index[3].x = -1;

	// NORTHEAST
	path_diagonal_index[0].y = -1;
	path_diagonal_index[0].x = 1;
	// SOUTHEAST
	path_diagonal_index[1].y = 1;
	path_diagonal_index[1].x = 1;
	// SOUTHWEST
	path_diagonal_index[2].y = 1;
	path_diagonal_index[2].x = -1;
	// NORTHWEST
	path_diagonal_index[3].y = -1;
	path_diagonal_index[3].x = -1;

	if (unk2 >= PATH_FB) {
		unk2 = PATH_FB;
	}

	Pather **dp1C = cast(Pather**)Path_sbrk(pather_count * (Pather*).sizeof);
	Path_C4B859(pather_count, pathers, dp1C);

	VecYX **dp2A = cast(VecYX**)Path_sbrk(unk2 * (VecYX*).sizeof); // Allocate space on heap for pathfinding tile positions
	Path_InitMatrix();

	ushort dp1A = 0;
	ushort dp18 = 0;
	ushort dp04;
	for (dp04 = 0; dp04 < pather_count; dp04++) {
		ushort dp1E;

		Pather *dp02 = dp1C[dp04];
		Pather *dp32 = dp02;

		if (dp02.hitbox.y != dp1A || dp02.hitbox.x != dp18) {
			ushort dp16 = 1;
			dp1A = dp02.hitbox.y;
			dp18 = dp02.hitbox.x;

			for (dp1E = cast(short)(dp04 + 1); dp1E < pather_count; dp1E++) {
				// X REGISTER = &dp1C[dp1E]

				if (dp1C[dp1E].hitbox.y != dp1A) break;
				if (dp1C[dp1E].hitbox.x != dp18) break;

				dp16++;
			}

			Path_C4B923(dp16, &dp1C[dp04]);
			Path_C4BAF6(target_count, targets_pos, dp02, dp16, unk2, unk1);
		}

		dp02.point_count = Path_C4BD9A(&dp02.origin, unk2, dp2A);
		ushort dp14 = Path_C4BF7F(cast(ushort)dp02.point_count, dp2A);

		VecYX *dp22 = cast(VecYX*)Path_sbrk(dp14 * VecYX.sizeof);

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

	return dp20;
}

/// $C4B7A5 - Initializes the border around the pathfind matrix to PATH_UNWALKABLE
void Path_InitMatrix() {
	int i;
	for (i = 0; i < path_matrix_rows; ++i) {
		ubyte dp0E = PATH_UNWALKABLE;
		path_matrix_buffer[((path_matrix_cols - 1) * i) + (path_matrix_cols - 1)] = dp0E;
		path_matrix_buffer[(path_matrix_cols - 1) * i] = dp0E;
	}

	for (i = 0; i < path_matrix_cols; ++i) {
		ubyte dp0E = PATH_UNWALKABLE;
		path_matrix_buffer[(path_matrix_rows - 1) + i] = dp0E;
		path_matrix_buffer[i] = dp0E;
	}
}

/// $C4B859
void Path_C4B859(ushort pather_count, Pather *pathers, Pather **pather_table) {
	// X REGISTER = pathers

	ushort dp1A = cast(ushort)(pather_count - 1);

	// Scope for dp18 where it's seen as an ushort
	{
		ushort dp18;
		for (dp18 = 0; dp18 < pather_count; dp18++) {
			// Y REGISTER = dp18 * sizeof(pather_table)
			// dp02 = dp18 * sizeof(Pather)

			pather_table[dp18] = &pathers[dp18];
		}
	}

	if (pather_count <= 1) return;

	ushort dp04;
	for (dp04 = 0; dp04 < dp1A; ++dp04) {
		ushort dp16 = 0xFFFF;
		ushort dp14 = 0xFFFF;
		ushort dp0E;

		ushort dp12;
		for (dp12 = dp04; dp12 < pather_count; dp12++) { // Y REGISTER
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
void Path_C4B923(ushort count, Pather **pathers) {
	ushort dp14;
	for (dp14 = 0; dp14 < path_matrix_size; dp14++) {
		if (path_matrix_buffer[dp14] != PATH_UNWALKABLE) {
			path_matrix_buffer[dp14] = PATH_MAYBE_START;
		}
	}

	ushort dp12; // also dp02
	for (dp12 = 0; dp12 < count; dp12++) {
		Pather *dp10 = pathers[dp12]; // also Y REGISTER

		if (dp10.from_offscreen == 0) {
			// Starting point is the same as current position
			if (path_matrix_buffer[(path_matrix_cols * dp10.origin.y) + dp10.origin.x] != PATH_UNWALKABLE) {
				path_matrix_buffer[(path_matrix_cols * dp10.origin.y) + dp10.origin.x] = PATH_START;
			}
		} else {
			// Starting from offscreen
			ushort dp0E;
			ushort i; // X REGISTER
			for (dp0E = 0; dp0E < path_matrix_border; dp0E++) {
				for (i = 0; i < path_matrix_cols; ++i) {
					if (path_matrix_buffer[(dp0E * path_matrix_cols) + i] != PATH_UNWALKABLE) {
						path_matrix_buffer[(dp0E * path_matrix_cols) + i] = PATH_START;
					}
				}
			}

			for (dp0E = cast(ushort)(path_matrix_rows - path_matrix_border); dp0E < path_matrix_rows; dp0E++) {
				for (i = 0; i < path_matrix_cols; ++i) {
					if (path_matrix_buffer[(dp0E * path_matrix_cols) + i] != PATH_UNWALKABLE) {
						path_matrix_buffer[(dp0E * path_matrix_cols) + i] = PATH_START;
					}
				}
			}

			for (i = 0; i < path_matrix_border; ++i) {
				for (dp14 = 0; dp14 < path_matrix_rows; dp14++) {
					if (path_matrix_buffer[(dp14 * path_matrix_cols) + i] != PATH_UNWALKABLE) {
						path_matrix_buffer[(dp14 * path_matrix_cols) + i] = PATH_START;
					}
				}
			}

			for (i = 0; i < path_matrix_cols - path_matrix_border; ++i) {
				for (dp14 = 0; dp14 < path_matrix_rows; dp14++) {
					if (path_matrix_buffer[(dp14 * path_matrix_cols) + i] != PATH_UNWALKABLE) {
						path_matrix_buffer[(dp14 * path_matrix_cols) + i] = PATH_START;
					}
				}
			}

			dp10.origin.y = 0;
			dp10.origin.x = 0;
		}
	}
}

/// $C4BAF6
void Path_C4BAF6(ushort target_count, VecYX *targets_pos, Pather *pather, ushort unk1, ushort unk2, short unk3) {
	ushort dp19 = pather.hitbox.y;
	ushort dp17 = pather.hitbox.x;
	ushort dp15 = 0;
	ushort dp13 = 0;

	path_B40E = path_B408;
	path_B40C = path_B408;

	ushort dp11;
	for (dp11 = 0; dp11 < target_count; dp11++) {
		*path_B40E = cast(ushort)((targets_pos[dp11].y * path_matrix_cols) + targets_pos[dp11].x);
		path_B40E = (path_B40E == path_B40A) ? path_B408 : path_B40E + 1;
	}

	while (path_B40C != path_B40E) {
		ushort dp02 = *path_B40C;

		path_B40C = (path_B40C == path_B40A) ? path_B408 : path_B40C + 1;

		ubyte dp00 = path_matrix_buffer[dp02];
		if (dp00 < PATH_MAYBE_START) continue; // Ignore PATH_MAYBE_START or PATH_START

		ushort flag = 1; // Y REGISTER
		ushort tmp = dp02; // X REGISTER
		ushort dp04;

		for (dp11 = 0; dp11 < dp19; tmp += path_matrix_cols, dp11++) {
			for (dp04 = 0; dp04 < dp17; ++dp04) {
				if (path_matrix_buffer[tmp + dp04] == PATH_UNWALKABLE) {
					flag = 0;
					goto exit_loop;
				}
			}
		}

exit_loop:
		if (!flag) {
			path_matrix_buffer[dp02] = PATH_FC;
		} else {
			if (dp00 == PATH_START) {
				++dp15;
				if (pather.from_offscreen == 1) {
					pather.origin.y = cast(short)(tmp / path_matrix_cols);
					pather.origin.x = cast(short)(tmp % path_matrix_cols);
				}
			}

			dp00 = PATH_FC;

			ushort dp0F;
			for (dp0F = 0; dp0F < 4; dp0F++) {
				dp11 = cast(ushort)(dp02 + path_cardinal_offset[dp0F]);
				ubyte dp01 = path_matrix_buffer[dp11];
				if (dp01 >= PATH_MAYBE_START) { // if PATH_MAYBE_START or PATH_START
					if (path_B40C == path_B408) {
						flag = (path_B40E == path_B40A);
					} else {
						flag = (path_B40E + 1 == path_B40C);
					}

					if (!flag) {
						*path_B40E = dp11;
						path_B40E = (path_B40E == path_B40A) ? path_B408 : path_B40E + 1;
					}
				} else if (dp00 > dp01) {
					dp00 = dp01;
				}
			}

			if (dp00 == PATH_FC) {
				path_matrix_buffer[dp02] = 0;
			} else {
				ubyte dp0E = cast(ubyte)(dp00 + 1);
				path_matrix_buffer[dp02] = dp0E;

				if (dp0E == unk2) {
					for (dp11 = 0; dp11 < 4; dp11++) {
						if (path_matrix_buffer[ dp02 + path_cardinal_offset[dp11] ] >= PATH_MAYBE_START) { // if PATH_MAYBE_START or PATH_START
							path_matrix_buffer[ dp02 + path_cardinal_offset[dp11] ] = PATH_FC;
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
ushort Path_C4BD9A(VecYX *start, ushort max_points, VecYX **points) {
	ushort dp28 = start.y;
	ushort dp26 = start.x;
	ushort dp24 = 0;

	ubyte dp00 = path_matrix_buffer[(dp28 * path_matrix_cols) + dp26];
	if (dp00 > PATH_FB) { // if PATH_FC, PATH_UNWALKABLE, PATH_MAYBE_START, PATH_START
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
			ushort tmp = cast(ushort)(path_cardinal_index[dp1C].y + dp28); // X REGISTER
			ushort dp1A = cast(ushort)(path_cardinal_index[dp1C].x + dp26);

			ushort dp04 = dp1C & 3;

			if (path_matrix_buffer[(path_matrix_cols * tmp) + dp1A] == dp00) {
				if (dp20 == 666) {
					dp20 = dp1C;
					dp0E = tmp;
					dp10 = dp1A;
				}

				ushort dp18 = cast(ushort)(path_diagonal_index[dp1C].y + dp28);
				ushort dp16 = cast(ushort)(path_diagonal_index[dp1C].x + dp26);

				if (path_matrix_buffer[(dp18 * path_matrix_cols) + dp16] == dp00 - 1) {
					ushort dp02 = cast(ushort)(path_cardinal_index[dp04].x + dp26);
					if (path_matrix_buffer[((path_cardinal_index[dp04].y + dp28) * path_matrix_cols) + dp02] == dp00) {
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
ushort Path_C4BF7F(ushort count, VecYX **points) {
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
immutable ubyte[16] FileSelectTextStartNewGame = EBString(": Start New Game");

immutable ubyte[6] FileSelectTextLevel = EBString("Level:");

immutable ubyte[11] FileSelectTextTextSpeed = EBString("Text Speed:");

immutable ubyte[7][3] FileSelectTextTextSpeedStrings = [
	EBString!7("Fast"),
	EBString!7("Medium"),
	EBString!7("Slow"),
];

immutable ubyte[9] FileSelectTextContinue = EBStringz("Continue");

immutable ubyte[5] FileSelectTextCopy = EBStringz("Copy");

immutable ubyte[7] FileSelectTextDelete = EBStringz("Delete");

immutable ubyte[7] FileSelectTextSetUp = EBStringz("Set Up");

immutable ubyte[14] FileSelectTextCopyToWhere = EBString!14("Copy to where?");

immutable ubyte[32] FileSelectTextAreYouSureDelete = EBString!32("Are you sure you want to delete?");

immutable ubyte[3] FileSelectTextAreYouSureDeleteNo = EBStringz("No");

immutable ubyte[4] FileSelectTextAreYouSureDeleteYes = EBStringz("Yes");

immutable ubyte[25] FileSelectTextSelectTextSpeed = EBString!25("Please select text speed.");

immutable ubyte[28] FileSelectTextSelectSoundSetting = EBString!28("Please select sound setting.");

immutable ubyte[7][2] FileSelectTextSoundSettingStrings = [
	EBString!7("Stereo"),
	EBString!7("Mono"),
];

immutable ubyte[37] FileSelectTextWhichStyle = EBString!37("Which style of windows do you prefer?");

immutable ubyte[13] FileSelectTextFlavorPlain = EBStringz("Plain flavor");

immutable ubyte[12] FileSelectTextFlavorMint = EBStringz("Mint flavor");

immutable ubyte[18] FileSelectTextFlavorStrawberry = EBStringz("Strawberry flavor");

immutable ubyte[14] FileSelectTextFlavorBanana = EBStringz("Banana flavor");

immutable ubyte[14] FileSelectTextFlavorPeanut = EBStringz("Peanut flavor");

immutable ubyte[40][7] FileSelectTextPleaseNameThemStrings = [
	EBString!40("Please name him."),
	EBString!40("Name her, too."),
	EBString!40("Name your friend."),
	EBString!40("Name another friend."),
	EBString!40("Name your pet."),
	EBString!40("Favorite homemade food?"),
	EBString!40("What's your favorite thing?"),
];

immutable ubyte[14] FileSelectTextFavoriteFood =EBString!14("Favorite food:");

immutable ubyte[14] FileSelectTextCoolestThing =EBString!14("Coolest thing:");

immutable ubyte[13] FileSelectTextAreYouSure =EBString!13("Are you sure?");

immutable ubyte[4] FileSelectTextAreYouSureYep = EBStringz("Yep");

immutable ubyte[5] FileSelectTextAreYouSureNope = EBStringz("Nope");

/// $C4C2DE
void UnknownC4C2DE() {
	if (Unknown7E4DC4 == 0) {
		ChangeMusic(Music.YouLose);
		FadeOutWithMosaic(1, 1, 0);
	}
	LoadedAnimatedTileCount = 0;
	Unknown7E4474 = 0;
	Unknown7E9F2A = 0;
	UnknownC08D79(9);
	SetBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	Decomp(&UnknownE1CFAF[0], &Unknown7F0000[0]);
	if (gameState.partyMembers[0] == 3) {
		CopyToVram(0, 0x8000, 0, &Unknown7F0000[0x8000]);
	} else {
		CopyToVram(0, 0x8000, 0, &Unknown7F0000[0]);
	}
	Decomp(&UnknownE1D5E8[0], &Unknown7F0000[0]);
	CopyToVram(0, 0x800, 0x5800, &Unknown7F0000[0]);
	Decomp(&UnknownE1D4F4[0], cast(ubyte*)&palettes[0][0]);
	memcpy(&palettes[7][0], &palettes[0][0], 0x20);
	memset(&palettes[1][0], 0, 0xC0);
	memcpy(&palettes[2][0], &palettes[7][0], 0x20);
	UnknownC200D9();
	LoadWindowGraphics();
	UnknownC44963(1);
	UnknownC47F87();
	UnknownC0856B(0x18);
	TM_MIRROR = 5;
	Unknown7E4DC4 = 0;
	BG2_Y_POS = 0;
	BG2_X_POS = 0;
	BG1_X_POS = 0;
	BG1_X_POS = 0;
	FadeIn(1, 1);
	UnknownC0888B();
}

/// $C4C45F
void UnknownC4C45F(short arg1) {
	memcpy(&Unknown7F0000[0x7800], &palettes[2][0], 0xC0);
	memcpy(&Unknown7F0000[0x7800 + (arg1 << 5)], &palettes[7][0], 0x20);
	memcpy(&Unknown7F0000[0x7800 + ((arg1 - 1) << 5)], &palettes[6][0], 0x20);
}

/// $C4C519
short UnknownC4C519(short arg1, short arg2) {
	UnknownC4C45F(arg1);
	UnknownC49208(arg2);
	while (arg2 != 0) {
		if (pad_press[0] != 0) {
			return -1;
		}
		UnknownC492D2();
		WaitUntilNextFrame();
		arg2--;
	}
	memcpy(&palettes[2][0], &Unknown7F0000[0x7800], 0xC0);
	return 0;
}

/// $C4C567
short SkippablePause(short arg1) {
	while (arg1 != 0) {
		if (pad_press[0] != 0) {
			return -1;
		}
		WaitUntilNextFrame();
		arg1--;
	}
	return 0;
}

/// $C4C58F
void UnknownC4C58F(short arg1) {
	UnknownC4954C(0x64, &palettes[0][0]);
	UnknownC496E7(arg1, -1);
	for (short i = 0; i < arg1; i++) {
		UnknownC426ED();
		WaitUntilNextFrame();
	}
	memset(&palettes[0][0], 0xFF, 0x200);
	UnknownC0856B(0x18);
	WaitUntilNextFrame();
}

/// $C4C60E
void UnknownC4C60E(short arg1) {
	UnknownC496E7(arg1, -1);
	for (short i = 0; i < arg1; i++) {
		UnknownC426ED();
		OAMClear();
		UnknownC09466();
		UpdateScreen();
		WaitUntilNextFrame();
	}
	UnknownC49740();
}

/// $C4C64D
short UnknownC4C64D() {
	SkippablePause(0x3C);
	DisplayText(TextGameOver.ptr);
	UnknownC1DD5F();
	if (getEventFlag(EventFlag.NoContinueSelected) == 0) {
		SkippablePause(0x3C);
		return -1;
	}
	if (SkippablePause(0x3C) != 0) {
		return 0;
	}
	if (UnknownC4C519(1, 0x5A) != 0) {
		return 0;
	}
	if (SkippablePause(1) != 0) {
		return 0;
	}
	if (UnknownC4C519(2, 0x5A) != 0) {
		return 0;
	}
	if (SkippablePause(1) != 0) {
		return 0;
	}
	if (UnknownC4C519(3, 0x5A) != 0) {
		return 0;
	}
	if (SkippablePause(1) != 0) {
		return 0;
	}
	if (UnknownC4C519(4, 8) != 0) {
		return 0;
	}
	return 0;
}

/// $C4C718
short Spawn() {
	UnknownC0943C();
	UnknownC4C2DE();
	short result = UnknownC4C64D();
	if (result != 0) {
		FadeOutWithMosaic(2, 1, 0);
		UnknownC09451();
		return result;
	}
	UnknownC4C58F(0x20);
	UnknownC0AC0C(2);
	TM_MIRROR = 0x17;
	Unknown7E436E = -1;
	Unknown7E5DD4 = -1;
	CurrentMusicTrack = 0xFFFF;
	Unknown7E4676 = 1;
	WaitUntilNextFrame();
	InitializeMap(RespawnX, RespawnY, 6);
	Unknown7E4DC6 = &PartyCharacters[gameState.partyMembers[0]];
	for (short i = 0; i < 6; i++) {
		Unknown7E4DC6.afflictions[i] = 0;
	}
	Unknown7E4DC6.hp.target = Unknown7E4DC6.maxHP;
	Unknown7E4DC6.hp.current.integer = Unknown7E4DC6.maxHP;
	Unknown7E4DC6.pp.target = 0;
	Unknown7E4DC6.pp.current.integer = 0;
	gameState.moneyCarried = (gameState.moneyCarried & 1) + gameState.moneyCarried / 2;
	UnknownC07B52();
	for (short i = 1; 10 < i; i++) {
		setEventFlag(i, 0);
	}
	for (short i = 0; i < 0x1E; i++) {
		EntityCollidedObjects[i] = 0xFFFF;
	}
	UnknownC064D4();
	Unknown7E9E56 = 0;
	Unknown7E5D58 = 0;
	SpawnBuzzBuzz();
	OAMClear();
	UnknownC09451();
	UnknownC4C60E(0x20);
	return result;
}

/// $C47225
void UnknownC47225(short arg1, short arg2) {
	EntityScriptVar0Table[CurrentEntitySlot] = cast(short)(EntityAbsXTable[CurrentEntitySlot] - arg2);
	EntityScriptVar1Table[CurrentEntitySlot] = cast(short)(EntityAbsXTable[CurrentEntitySlot] + arg2);
	EntityScriptVar2Table[CurrentEntitySlot] = cast(short)(EntityAbsYTable[CurrentEntitySlot] - arg1);
	EntityScriptVar3Table[CurrentEntitySlot] = cast(short)(EntityAbsYTable[CurrentEntitySlot] + arg1);
}

/// $C47269
short UnknownC47269() {
	if (EntityAbsXTable[CurrentEntitySlot] < EntityScriptVar0Table[CurrentEntitySlot]) {
		return 3;
	}
	if (EntityAbsXTable[CurrentEntitySlot] > EntityScriptVar1Table[CurrentEntitySlot]) {
		return 7;
	}
	if (EntityAbsYTable[CurrentEntitySlot] < EntityScriptVar2Table[CurrentEntitySlot]) {
		return 5;
	}
	if (EntityAbsYTable[CurrentEntitySlot] > EntityScriptVar3Table[CurrentEntitySlot]) {
		return 1;
	}
	return 0;
}

/// $C472A8
void UnknownC472A8(short arg1) {
	UnknownC47044(EntityScriptVar0Table[CurrentEntitySlot]);
	short x10 = UnknownC46B51(EntityScriptVar0Table[CurrentEntitySlot]);
	if (arg1 != 0) {
		x10 = UnknownC46B37(x10);
	}
	short x0E = EntityDirections[CurrentEntitySlot];
	EntityDirections[CurrentEntitySlot] = x10;
	if (UnknownC46AA3(x0E) != UnknownC46AA3(x10)) {
		UnknownC0A443Entry2(CurrentEntitySlot);
	}
}

/// $C4730E
void UnknownC4730E() {
	EntityDeltaYTable[CurrentEntitySlot] /= 2;
}

/// $C47333
short UnknownC47333() {
	return gameState.partyCount;
}

/// $C4734C
short UnknownC4734C(short arg1) {
	UnknownC01A63(BG1_X_POS / 8, arg1);
	return arg1;
}

/// $C47369
void UnknownC47369() {
	UnknownC019E2();
}

/// $C473B2
ushort UnknownC473B2(ushort arg1) {
	if (arg1 < 0x8000) {
		return 0;
	}
	if (arg1 >= 31) {
		return 31;
	}
	return arg1 & 0x1F;
}

/// $C473D0
void UnknownC473D0(short arg1, short arg2) {
	ushort* x16 = &Unknown7E4476[arg1][0];
	ushort* x18 = &palettes[arg1 + 2][0];
	for (short i = 0; i < 16; i++) {
		ushort x14 = cast(ushort)((x16[0] & 0x1F) + arg2);
		ushort x12 = cast(ushort)(((x16[0] >> 5) & 0x1F) + arg2);
		ushort x10 = cast(ushort)(((x16[0] >> 10) & 0x1F) + arg2);
		ushort x0E = UnknownC473B2(x14);
		ushort x12_2 = UnknownC473B2(x12);
		ushort x10_2 = UnknownC473B2(x10);
		x16++;
		(x18++)[0] = cast(ushort)((x12_2 << 5) | (x10_2 << 10) | x0E);
	}
}

/// $C4746B
void UnknownC4746B(short arg1) {
	for (short i = 0; i < 16; i++) {
		UnknownC473D0(i, arg1);
	}
	Unknown7E0030 = 0x18;
}

/// $C47499
void UnknownC47499() {
	UnknownC4746B(EntityScriptVar0Table[CurrentEntitySlot]);
}

/// $C47A6B
void UnknownC47A6B() {
	EntityAbsYTable[CurrentEntitySlot] = cast(short)(EntityScriptVar7Table[CurrentEntitySlot] - (EntityAbsYTable[CurrentEntitySlot] - EntityScriptVar7Table[CurrentEntitySlot]));
}

/// $C47A9E
void UnknownC47A9E() {
	Decomp(&AnimationSequencePointers[EntityScriptVar0Table[CurrentEntitySlot]].ptr[0], &Unknown7F0000[0]);
	CopyToVram2(0, AnimationSequencePointers[EntityScriptVar0Table[CurrentEntitySlot]].unknown4, 0x6000, &Unknown7F0000[0]);
	memcpy(&palettes[0][0], &Unknown7F0000[AnimationSequencePointers[EntityScriptVar0Table[CurrentEntitySlot]].unknown4], 8);
	Unknown7E0030 = 0x18;
	BG3_Y_POS = 0xFFFF;
}

/// $C47B77
short UnknownC47B77() {
	BG3_Y_POS = 0xFFFF;
	CopyToVram(0, 0x700, 0x7C00, &Unknown7F0000[8 + AnimationSequencePointers[EntityScriptVar0Table[CurrentEntitySlot]].unknown4 + EntityScriptVar1Table[CurrentEntitySlot] * 0x700]);
	if (EntityScriptVar1Table[CurrentEntitySlot] + 1 == AnimationSequencePointers[EntityScriptVar0Table[CurrentEntitySlot]].unknown6) {
		return 0;
	}
	return AnimationSequencePointers[EntityScriptVar0Table[CurrentEntitySlot]].unknown7;
}

/// $C48037
immutable ubyte[215] LumineHallText = EBString!215("I'm ....  It's been a long road getting here...  Soon, I'll be...  Soon, I'll be...  Soon, I'll be...  What will happen to us?  W...what's happening?  My thoughts are being written out on the wall...  or are they?  ");

/// $C4810E
ushort* UnknownC4810E(short arg1, ushort* arg2) {
	ubyte* x06 = &Unknown7F0000[0];
	x06 += (((arg1 & 0xFFF0) * 2) + arg1 & 0xF) * 16;
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
void UnknownC4827B(short arg1, short arg2) {
	short x1A = (arg2 - 0x50) & 0x7F;
	short x18 = FontConfigTable[arg1].height;
	const(ubyte)* x14 = &FontConfigTable[arg1].graphics[x1A * x18];
	short x02 = FontConfigTable[arg1].width;
	short x12 = FontConfigTable[arg1].data[x1A];
	x12 += Unknown7E5E6D;
	while (x12 > 8) {
		RenderText(8, x02, x14);
		x12 -= 8;
		x14 += x02;
	}
	RenderText(x12, x02, x14);
}

/// $C4838A
short UnknownC4838A(short arg1) {
	short x2E = 0;
	short x2C = 0;
	short x2A = 0;
	VWFTile = 0;
	VWFX = 0;
	memset(&VWFBuffer[0][0], 0xFF, 0x400);
	short x04 = 4;
	short x28 = cast(short)strlen(cast(char*)&PartyCharacters[0].name[0]);
	if (x28 > 5) {
		x28 = 5;
	}
	short x26 = 6;
	ubyte* x06 = &PartyCharacters[0].name[0];
	for (short i = 0; x04 > i; i++) {
		UnknownC4827B(arg1, LumineHallText[i]);
	}
	for (short i = 0; x28 > i; i++) {
		UnknownC4827B(arg1, (x06++)[0]);
	}
	for (short i = 0; x26 > i; i++) {
		UnknownC4827B(arg1, LumineHallText[4 + i]);
	}
	x26 = cast(short)(VWFX + x2C);
	x28 = 0;
	short x20 = 0;
	for (short i = 0; i < VWFX / 8; i++) {
		memcpy(&Unknown7F0000[x2A], &(cast(ubyte*)&VWFBuffer[0][0])[x20], 16);
		x20 += 16;
		memcpy(&Unknown7F0000[x2A + 0x100], &(cast(ubyte*)&VWFBuffer[0][0])[x20], 16);
		x20 += 16;
		x2A += 16;
	}
	x2C = 205;
	memcpy(&VWFBuffer[0][0], &VWFBuffer[VWFX / 8][0], 0x20);
	VWFTile = 0;
	VWFX %= 8;
	for (short i = 0; x2C > i; i++) {
		if (x2E > 16) {
			x2E = 0;
			x26 += VWFX;
			x20 = 0;
			 for (short j = 0; i < VWFX / 8; i++) {
				memcpy(&Unknown7F0000[x2A], &(cast(ubyte*)&VWFBuffer[0][0])[x20], 16);
				x20 += 16;
				memcpy(&Unknown7F0000[x2A + 0x100], &(cast(ubyte*)&VWFBuffer[0][0])[x20], 16);
				x20 += 16;
				x2A += 16;
				if ((x2A % 0x100) == 0) {
					x2A += 0x100;
				}
			 }
			 if ((VWFX % 8) != 0) {
				memcpy(&VWFBuffer[0][0], &VWFBuffer[VWFX / 8][0], 0x20);
				memset(&VWFBuffer[1][0], 0xFF, 0x1E0);
				VWFTile = 0;
				VWFX %= 8;
			 } else {
				VWFX = 0;
				VWFTile = 0;
				memset(&VWFBuffer[0][0], 0xFF, 0x200);
			 }
		}
		UnknownC4827B(arg1, LumineHallText[10 + i]);
		x2E++;
	}
	x04 = cast(short)(VWFX + x26);
	x20 = 0;
	for (short i = 0; i < VWFX + 16; i++) {
		memcpy(&Unknown7F0000[x2A], &(cast(ubyte*)&VWFBuffer[0][0])[x20], 16);
		short x16 = cast(short)(x20 + 16);
		memcpy(&Unknown7F0000[x2A + 0x100], &(cast(ubyte*)&VWFBuffer[0][0])[x16], 16);
		x20 = cast(short)(x16 + 16);
		x2A += 0x100;
		if ((x2A % 0x100) == 0) {
			x2A += 0x100;
		}
	}
	return cast(short)((x04 / 16) * 4);
}

/// $C4880C
void UnknownC4880C() {
	short y = UnknownC4838A(0);
	ushort* x06 = cast(ushort*)&Unknown7F0000[0x4000];
	for (short i = 0; i < 0x1D; i++) {
		for (short j = 0; j < 8; j++) {
			(x06++)[0] = 0;
		}
	}
	short x04 = cast(short)(y + 30);
	short x1E = 0;
	short x1C;
	for (x1C = 0; x1C < 4; x1C++) {
		x06 = UnknownC4810E(x1C, x06);
		x1E++;
	}
	short x1A = cast(short)strlen(cast(char*)&PartyCharacters[0].name[0]);
	if (x1A == 6) {
		x1A--;
	}
	for(x1E = 0; x1A < x1E; x1E++, x1C++) {
		x06 = UnknownC4810E(x1C, x06);
	}
	for (x1E = 0; x1E < 6; x1E++, x1C++) {
		x06 = UnknownC4810E(x1C, x06);
	}
	for (x1E = 0; x1E < 205; x1E++, x1C++) {
		x06 = UnknownC4810E(x1C, x06);
	}
	for (short i = 0; i < 30; i++) {
		for (short j = 0; j < 8; j++) {
			(x06++)[0] = 0;
		}
	}
	ushort* x06_2 = cast(ushort*)&Unknown7F0000[0x1000];
	ushort* x0A = cast(ushort*)&Unknown7F0000[0x4000];
	for (short i = 0; i < 8; i++) {
		(x06_2++)[0] = 0x0C10;
	}
	for (short i = 0; i < x04 + 0x1E; i++) {
		for (short j = 0; j < 8; j++) {
			x06_2[0] = ((x0A[0] << 1) & 0xA) | ((x0A[16] >> 1) & 5);
			//suspicious...
			x06_2[0] = cast(ushort)(((x0A[0] << 1) & 0xA) | ((x0A[16] >> 1) & 5) + 0x0C10);
			x0A[0] += 0x0C10;
			x06++;
			x0A++;
		}
	}
	EntityScriptVar0Table[CurrentEntitySlot] = cast(short)(x04 * 2);
	Unknown7F0000[0] = 8;
	Unknown7F0000[1] = 30;
}

/// $C48A6D
short UnknownC48A6D() {
	ushort* x06;
	if ((EntityScriptVar1Table[CurrentEntitySlot] & 1) != 0) {
		x06 = cast(ushort*)&Unknown7F0000[0x4000 + (EntityScriptVar1Table[CurrentEntitySlot] >> 1) * 16];
	} else {
		x06 = cast(ushort*)&Unknown7F0000[0x1000 + (EntityScriptVar1Table[CurrentEntitySlot] >> 1) * 16];
	}
	ushort* x0A = cast(ushort*)&Unknown7F0000[2];
	for (short i = 0; i < 8; i++) {
		for (short j = 0; j < 30; j++) {
			(x0A++)[0] = x06[0];
			x06 += 8;
		}
		// interesting...
		x06 += -239;
	}
	UnknownC3F705(808, 588, cast(ushort*)&Unknown7F0000[0]);
	short x = 0;
	if (++EntityScriptVar1Table[CurrentEntitySlot] > EntityScriptVar0Table[CurrentEntitySlot]) {
		x = 1;
	}
	return x;
}

/// $C48B2C
void UnknownC48B2C() {
	teleportStyle = TeleportStyle.Unknown;
	gameState.leaderDirection = Direction.Right;
}

/// $C48B3B
void UnknownC48B3B() {
	if ((Unknown7E0002 & 1) != 0) {
		return;
	}
	for (short i = 0; gameState.partyCount > i; i++) {
		if (16 <= gameState.unknown96[i]) {
			continue;
		}
		short x10 = cast(short)((UnknownC41EFF(EntityAbsXTable[gameState.unknownA2[i]], EntityAbsYTable[gameState.unknownA2[i]], EntityAbsXTable[CurrentEntitySlot], EntityAbsYTable[CurrentEntitySlot]) + 0x1000) / 0x2000);
		if (EntityDirections[gameState.unknownA2[i]] == x10) {
			continue;
		}
		EntityDirections[gameState.unknownA2[i]] = x10;
		UnknownC0A780(gameState.unknownA2[i]);
	}
}

/// $C4C8A4
void UnknownC4C8A4() {
	Unknown7EB4A4 = &Unknown7F0000[0];
	Unknown7EB4A6 = 0;
	Unknown7EB4AA = cast(Unknown7EB4AAEntry*)&Unknown7F0000[0x7C00];
	memset(&Unknown7F0000[0x7C00], 0, 0x400);
}

/// $C4C8DB
ubyte* UnknownC4C8DB(short arg1) {
	ubyte* result = Unknown7EB4A4;
	Unknown7EB4A4 += arg1;
	return result;
}

/// $C4C8E9
void UnknownC4C8E9(ubyte* arg1, short arg2) {
	while (arg2 != 0) {
		(arg1++)[0] = 0;
		arg2--;
	}
}

/// $C4C91A
void UnknownC4C91A(short arg1, short arg2) {
	if (arg2 == 0) {
		return;
	}
	if (arg2 == 1) {
		return;
	}
	if (arg2 == 6) {
		return;
	}
	if (EntityTileHeights[arg1] == 0) {
		return;
	}
	if (Unknown7EB4A8 == -1) {
		UnknownC4C8A4();
		NewEntityVar3 = 0;
		NewEntityVar2 = 0;
		NewEntityVar1 = 0;
		NewEntityVar0 = 0;
		Unknown7EB4A8 = InitEntityWipe(ActionScript.Unknown859, 0, 0);
	}
	Unknown7EB4AAEntry* x1A = &Unknown7EB4AA[Unknown7EB4A6];
	x1A.unknown0 = arg1;
	EntitySpriteMapFlags[arg1] |= 0x4000;
	x1A.unknown2 = arg2;
	x1A.unknown6 = UnknownC42A63[EntitySizes[arg1]];
	x1A.unknown8 = cast(short)(EntityTileHeights[arg1] * 8);
	x1A.unknown14 = cast(short)(EntityTileHeights[arg1] * 8 * UnknownC42A63[EntitySizes[arg1]]);
	x1A.unknown10 = UnknownC4C8DB(x1A.unknown14);
	UnknownC4C8E9(x1A.unknown10, x1A.unknown14);
	x1A.unknown12 = x1A.unknown10 + x1A.unknown14;
	x1A.unknown18 = 0;
	x1A.unknown16 = 0;
	ubyte* x16;
	if ((arg2 == 2) || (arg2 == 3) || (arg2 == 4) || (arg2 == 5)) {
		x16 = x1A.unknown10;
	} else {
		x16 = x1A.unknown12;
	}
	if (arg1 >= 0x18) {
		UnknownC4283F(arg1, x16, x1A.unknown14);
	} else {
		UnknownC42884(arg1, x16, x1A.unknown14);
	}
	switch (arg2) {
		case 2:
		case 7:
			EntityScriptVar0Table[Unknown7EB4A8] = 1;
			x1A.unknown4 = 1;
			break;
		case 3:
		case 8:
			EntityScriptVar1Table[Unknown7EB4A8] = 1;
			x1A.unknown4 = 2;
			break;
		case 4:
		case 9:
			EntityScriptVar2Table[Unknown7EB4A8] = 1;
			x1A.unknown4 = 3;
			break;
		case 5:
		case 10:
			EntityScriptVar3Table[Unknown7EB4A8] = 1;
			x1A.unknown4 = 4;
			break;
		default: break;
	}
	EntityScriptVar4Table[Unknown7EB4A8] = cast(short)(EntityScriptVar0Table[Unknown7EB4A8] + EntityScriptVar1Table[Unknown7EB4A8] + EntityScriptVar2Table[Unknown7EB4A8] + EntityScriptVar3Table[Unknown7EB4A8]);
	Unknown7EB4A6++;
}

/// $C4978E
void UnknownC4978E() {
	memcpy(&Unknown7E4476[0][0], &palettes[0][0], 0x200);
}

/// $C497C0
void UnknownC497C0(short arg1, short arg2, short arg3) {
	UnknownC4954C(arg2, &Unknown7E4476[0][0]);
	UnknownC496E7(arg1, arg2);
	if (arg1 != 1) {
		for (short i = 0; i < arg1; i++) {
			UnknownC426ED();
			WaitUntilNextFrame();
		}
	}
	UnknownC49740();
	UnknownC0856B(0x18);
}

/// $C4981F
void UnknownC4981F() {
	CopyToVram(3, 0x800, 0x7C00, &UnknownC40BE8[0]);
}

/// $C49841
void UnknownC49841() {
	UnknownC2EA15(1);
}

/// $C4CB4F
void UnknownC4CB4F() {
	Unknown7EB4AAEntry* x06 = Unknown7EB4AA;
	for (short i = 0; i < Unknown7EB4A6; i++) {
		EntitySpriteMapFlags[x06.unknown0] &= 0xBFFF;
		x06++;
	}
}

/// $C4CB8F
void UnknownC4CB8F() {
	Unknown7EB4AAEntry* x06 = Unknown7EB4AA;
	for (short i = 0; i < Unknown7EB4A6; i++) {
		if (x06.unknown4 == 1) {
			EntityAnimationFrames[x06.unknown0] = 0;
		}
		UnknownC0A443Entry2(x06.unknown0);
		x06++;
	}
}

/// $C4CBE3
void UnknownC4CBE3() {
	Unknown7EB4AAEntry* x06 = Unknown7EB4AA;
	for (short i = 0; i < Unknown7EB4A6; i++) {
		if (x06.unknown4 == 1) {
			EntityAnimationFrames[x06.unknown0] = -1;
		}
		x06++;
	}
}

/// $C4CC2C
void UnknownC4CC2C() {
	// wow. nothing!
}

/// $C4CC2F
short UnknownC4CC2F() {
	short x1E = 0;
	short x04 = 0;
	Unknown7EB4AAEntry* x1A = Unknown7EB4AA;
	for (short i = 0; i < Unknown7EB4A6; i++, x1A++) {
		if (x1A.unknown4 != 2) {
			continue;
		}
		x04++;
		if (x1A.unknown18 == 2) {
			x1E++;
			continue;
		}
		UnknownC428D1(cast(ushort*)x1A.unknown12, cast(ushort*)x1A.unknown10, cast(short)((x1A.unknown6 * 32 *(x1A.unknown16 / 8)) + (x1A.unknown16 % 8) * 2), x1A.unknown6 / 8);
		UnknownC429AE(x1A.unknown12, x1A.unknown0);
		if (++x1A.unknown16 >= x1A.unknown8) {
			x1A.unknown16 = 1;
			x1A.unknown18++;
		}
	}
	return cast(short)(x04 - x1E);
}

/// $C4CD44
short UnknownC4CD44() {
	short x1E = 0;
	short x04 = 0;
	Unknown7EB4AAEntry* x0A = Unknown7EB4AA;
	for (short i = 0; i < Unknown7EB4A6; i++, x0A++) {
		if (x0A.unknown4 != 3) {
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
				x = cast(short)(x0A.unknown6 - x0A.unknown16 - 1);
			}
		} else {
			if ((x0A.unknown16 & 1) != 0) {
				x = x0A.unknown16;
			} else {
				x = cast(short)(x0A.unknown6 - x0A.unknown16 - 1);
			}
		}
		UnknownC428FC(cast(ushort*)x0A.unknown12, cast(ushort*)x0A.unknown10, x, x0A.unknown8, cast(short)((x0A.unknown6 / 8) * 32));
		UnknownC429AE(x0A.unknown12, x0A.unknown0);
		if (++x0A.unknown16 >= x0A.unknown6) {
			x0A.unknown18++;
			x0A.unknown12 = null;
		}
	}
	return cast(short)(x04 - x1E);
}

/// $C4CEB0
void UnknownC4CEB0() {
	ushort* x06 = cast(ushort*)&Unknown7F0000[0x7F00];
	for (short i = 0; i < 0x40; i++) {
		(x06++)[0] = 0;
	}
}

/// $C4CED8
void UnknownC4CED8() {
	Unknown7EB4AAEntry* x0A = Unknown7EB4AA;
	ushort* x1A = cast(ushort*)&Unknown7F0000[0x7F00];
	short x18 = rand()&0x3F;
	while (x1A[x18] != 0) {
		x18 = (x18 + 1) & 0x3F;
	}
	x1A[x18] = 1;
	short x16 = x18 / 8;
	short x14 = x18 % 8;
	for (short i = 0; Unknown7EB4A6 > i; i++, x0A++) {
		if (x0A.unknown4 != 4) {
			continue;
		}
		for (short j = 0; j < x0A.unknown8 / 8; j++) {
			for (short k = 0; k < x0A.unknown6 / 8; k++) {
				x18 = cast(short)((j * x0A.unknown6 * 32) + (x16 * 2) + (k * 32));
				UnknownC42965(cast(ushort*)x0A.unknown12, cast(ushort*)x0A.unknown10, x18, x14);
			}
		}
		UnknownC429AE(x0A.unknown12, x0A.unknown0);
	}
}

/// $C4D00F
ubyte* UnknownC4D00F(ubyte* arg1, short arg2, short arg3) {
	const(ubyte)* x06 = &UnknownC3FB45[(arg2 - 0x41)][arg3 * 2];
	for (short i = 2; (i != 0) && (x06[0] != 0); i--) {
		(arg1++)[0] = (x06++)[0];
	}
	return arg1;
}

/// $C4D065
void UnknownC4D065(ubyte* arg1, ubyte* arg2) {
	short x0E = 0;
	while (arg2[0] != 0) {
		short x00 = (arg2++)[0];
		if (x0E != 0) {
			if (x0E == x00) {
				(arg1++)[0] = 0x7E;
			} else {
				switch (x00) {
					case 0x41:
						arg1 = UnknownC4D00F(arg1, x0E, 0);
						break;
					case 0x49:
						arg1 = UnknownC4D00F(arg1, x0E, 1);
						break;
					case 0x55:
						arg1 = UnknownC4D00F(arg1, x0E, 2);
						break;
					case 0x45:
						arg1 = UnknownC4D00F(arg1, x0E, 3);
						break;
					case 0x4F:
						arg1 = UnknownC4D00F(arg1, x0E, 4);
						break;
					default:
						if ((0x41 <= x00) && (x00 <= 0x5A)) {
							if (x0E == 0x4E) {
								(arg1++)[0] = 0x9D;
							} else {
								arg1 = UnknownC4D00F(arg1, x0E, 1);
							}
							x0E = x00;
							continue;
						} else {
							if (x0E ==0x4E) {
								(arg1++)[0] = 0x9D;
							} else {
								arg1 = UnknownC4D00F(arg1, x0E, 1);
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
			arg1 = UnknownC4D00F(arg1, x0E, 1);
		}
	}
	arg1[0] = 0;
}

/// $C4D274
ubyte GetTownMapID(short x, short y) {
	return MapDataPerSectorTownMapData[y / 0x80][((x >> 8) & 0xFF)].unknown0;
}

/// $C4D2A8
void UnknownC4D2A8() {
	if (Unknown7EB4B2 == 0) {
		Unknown7EB4B2 = 0xC;
		short x10 = palettes[8][1];
		for (short i = 1; i < 4; i++) {
			palettes[4][i] = palettes[4][i - 1];
		}
		palettes[8][1] = x10;
		UnknownC0856B(16);
	}
	Unknown7EB4B2--;
}

/// $C4D2F0
void UnknownC4D2F0() {
	switch (MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown0 & 0x70) {
		case 0x10:
			UnknownC08C58F(&UnknownE1F44C[TownMapMapping[2]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2 - 8);
			break;
		case 0x20:
			UnknownC08C58F(&UnknownE1F44C[TownMapMapping[3]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2 + 8);
			break;
		case 0x40:
			UnknownC08C58F(&UnknownE1F44C[TownMapMapping[4]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1 - 8, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2 - 8);
			break;
		case 0x30:
			UnknownC08C58F(&UnknownE1F44C[TownMapMapping[5]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1 + 16, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2);
			break;
		default:
			break;
	}
	if (Unknown7EB4B0 < 10) {
		UnknownC08C58F(&UnknownE1F44C[TownMapMapping[1]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2);
	} else {
		UnknownC08C58F(&UnknownE1F44C[TownMapMapping[0]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2);
	}
	if (--Unknown7EB4B0 == 0) {
		Unknown7EB4B0 = 0x14;
	}
}

/// $C4D43F
void UnknownC4D43F(short arg1) {
	Unknown7E2400 = 0;
	//not used - segmented addressing stuff
	//ubyte savedBank = UnknownC088A5(bankbyte(&UnknownE1F44C[0]));
	for (const(TownMapIconPlacement)* x06 = &TownMapIconPlacementTable[arg1][0]; x06.unknown0 != 0xFF; x06++) {
		short x14 = 1;
		if ((UnknownE1F47A[x06.unknown2] != 0) && (Unknown7EB4AE < 10)) {
			x14 = 0;
		}
		short x12 = 0;
		if (x06.eventFlag < EVENT_FLAG_UNSET) {
			x12 = 1;
		}
		if (getEventFlag(x06.eventFlag & 0x7FFF) != x12) {
			x14 = 0;
		}
		if (x14 == 0) {
			continue;
		}
		UnknownC08C58F(&UnknownE1F44C[x06.unknown2][0], x06.unknown0, x06.unknown1);
	}
	UnknownC4D2F0();
	if (--Unknown7EB4AE == 0) {
		Unknown7EB4AE = 0x3C;
	}
	// see above
	//UnknownC088A5(savedBank);
	UnknownC4D2A8();
}

/// $C4D552
void LoadTownMapData(short arg1) {
	FadeOut(2, 1);
	Decomp(&TownMapGraphicsPointerTable[arg1][0], &Unknown7F0000[0]);
	while (Unknown7E0028.a != 0) { Fiber.yield(); }
	memcpy(&palettes[0][0], &Unknown7F0000[0], 0x40);
	memcpy(&palettes[8][0], &TownMapIconPalette[0], 0x100);
	SetBG1VRAMLocation(BGTileMapSize.normal, 0x3000, 0);
	SetOAMSize(3);
	CGADSUB = 0;
	CGWSEL = 0;
	TM_MIRROR = 1;
	TD_MIRROR = 0;
	CopyToVram(0, 0x800, 0x3000, &Unknown7F0000[0x40]);
	CopyToVram2(0, 0x4000, 0, &Unknown7F0000[0x840]);
	CopyToVram(0, 0x2400, 0x6000, &TownMapLabelGfx[0]);
	UnknownC0856B(0x18);
	TM_MIRROR = 0x11;
	BG1_Y_POS = 0;
	BG1_X_POS = 0;
	UpdateScreen();
	FadeIn(2, 1);
}

/// $C4D681
short DisplayTownMap() {
	Unknown7EB4AE = 0x3C;
	Unknown7EB4B0 = 0x14;
	Unknown7EB4B2 = 0xC;
	short x10 = GetTownMapID(gameState.leaderX.integer, gameState.leaderY.integer);
	if (x10 == 0) {
		return 0;
	}
	LoadTownMapData(cast(short)(x10 - 1));
	while(((pad_press[0] & (PAD_A | PAD_L)) == 0) && ((pad_press[0] & (PAD_B | PAD_SELECT)) == 0) && ((pad_press[0] & PAD_L) == 0) && ((pad_press[0] & PAD_X) == 0)) {
		WaitUntilNextFrame();
		OAMClear();
		UnknownC4D43F(cast(short)(x10 - 1));
		UpdateScreen();
	}
	FadeOut(2, 1);
	for (short i = 0; i < 16; i++) {
		WaitUntilNextFrame();
		OAMClear();
		UnknownC4D43F(cast(short)(x10 - 1));
		UpdateScreen();
	}
	Unknown7E5DD8 = 1;
	ReloadMap();
	Unknown7E5DD4 = Unknown7E5DD6;
	UndrawFlyoverText();
	Unknown7E5DD8 = 0;
	TM_MIRROR = 0x17;
	FadeIn(2, 1);
	return x10;
}

/// $C4D744
void UnknownC4D744() {
	short x10 = 0;
	short x0E = 0;
	Unknown7EB4AE = 0x3C;
	Unknown7EB4B0 = 0x14;
	Unknown7EB4B2 = 0x0C;
	LoadTownMapData(0);
	while (true) {
		WaitUntilNextFrame();
		OAMClear();
		if ((pad_press[0] & PAD_UP) != 0) {
			x10--;
		}
		if ((pad_press[0] & PAD_DOWN) != 0) {
			x10++;
		}
		if (x10 == -1) {
			x10 = 5;
		}
		if (x10 == 6) {
			x10 = 0;
		}
		if (x0E != x10) {
			LoadTownMapData(x10);
			x0E = x10;
		}
		UnknownC4D43F(x10);
		if ((pad_press[0] & PAD_A) == 0) {
			break;
		}
		UpdateScreen();
	}
	UndrawFlyoverText();
	ReloadMap();
	TM_MIRROR = 0x17;
}

/// $C4D7D9
void DisplayAnimatedNamingSprite(short arg1) {
	for (const(NamingScreenEntity)* x06 = &UnknownC3FD2D[arg1][0]; x06.sprite != 0; x06++) {
		CreateEntity(x06.sprite, x06.script, -1, 0, 0);
	}
	Unknown7EB4B4 = 0;
}

/// $C4D830
void UnknownC4D830(short arg1) {
	while (Unknown7EB4B4 != 0) {
		UnknownC1004E();
	}
	for (const(NamingScreenEntity)* x06 = &UnknownC3FD2D[arg1 + 7][0]; x06.sprite != 0; x06++) {
		short x = UnknownC46028(x06.sprite);
		if (x == -1) {
			continue;
		}
		InitEntityUnknown1(&EventScriptPointers[x06.script][0], x);
	}
	while (true) {
		short* y = &EntityScriptTable[0];
		ushort x0E = 0xFFFF;
		for (short i = 0; i < 23; i++) {
			x0E &= (y++)[0];
		}
		UnknownC1004E();
		if (x0E == 0xFFFF) {
			break;
		}
	}
}

/// $C4D8FA
void UnknownC4D8FA() {
	for (short i = 0; i < 5; i++) {
		EntityDirections[CreateEntity(FileSelectSummarySpriteConfig[i].sprite, FileSelectSummarySpriteConfig[i].script, -1, FileSelectSummarySpriteConfig[i].x, FileSelectSummarySpriteConfig[i].y)] = Direction.Down;
	}
}

/// $C4D989
short UnknownC4D989(short arg1) {
	UnknownC0927C();
	UnknownC01A86();
	AllocSpriteMem(short.min, 0);
	InitializeMiscObjectData();
	Unknown7E4A58 = 1;
	Unknown7E4A5A = 0;
	SetBoundaryBehaviour(0);
	EntityAllocationMinSlot = 0x17;
	EntityAllocationMaxSlot = 0x18;
	InitEntity(1, 0, 0);
	UnknownC02D29();
	for (short i = 0; i < 6; i++) {
		gameState.partyMembers[i] = 0;
	}
	UnknownC0B65F(0x1D60, 0xB08);
	UnknownC03A24();
	memset(&palettes[0][0], 0, 0x200);
	OverworldInitialize();
	TM_MIRROR = 0;
	UnknownC2EA15(0);
	UnknownC4A7B0();
	Unknown7E9641 = 0;
	short x12 = 0;
	short x14 = 0;
	DisplayText(&AttractModeText[arg1][0]);
	while (Unknown7E9641 == 0) {
		UnknownC4A7B0();
		if (((pad_press[0] & PAD_A) != 0) || ((pad_press[0] & PAD_B) != 0) || ((pad_press[0] & PAD_START) != 0)) {
			x12 = 1;
			break;
		}
		UnknownC1004E();
		if ((x14 == 0) || (x14 == 1)) {
			TM_MIRROR = 0x13;
		}
		x14++;
	}
	UnknownC2EA74();
	while (UnknownC2EACF() != 0) {
		UnknownC1004E();
		UnknownC4A7B0();
	}
	FadeOut(1, 1);
	while (Unknown7E0028.a != 0) {
		UnknownC1004E();
	}
	UnknownC2EAAA();
	Unknown7E9641 = 0;
	UnknownC021E6();
	return x12;
}

/// $C4DAD2
void InitIntro() {
	short x02 = 0;
	Unknown7EB4B6 = 1;
	UnknownC0AC0C(2);
	UnknownC0927C();
	UnknownC200D9();
	UnknownC432B1();
	Unknown7E5DD8 = 1;
	BG3_X_POS = 0;
	BG3_Y_POS = 0;
	BG2_X_POS = 0;
	BG2_Y_POS = 0;
	BG1_X_POS = 0;
	BG1_Y_POS = 0;
	UpdateScreen();
	BG3_X_POS = 0;
	BG3_Y_POS = 0;
	BG2_X_POS = 0;
	BG2_Y_POS = 0;
	BG1_X_POS = 0;
	BG1_Y_POS = 0;
	UpdateScreen();
	short x;
	while (x == 0) {
		switch (x02) {
			case 0:
				if (LogoScreen() != 0) {
					UnknownC0AC0C(2);
					if ((INIDISP_MIRROR & 0x80) != 0) {
						FadeOutWithMosaic(4, 1, 0);
					}
					ChangeMusic(Music.TitleScreen);
					x = ShowTitleScreen(1);
					x02 = 2;
				} else {
					x = 0;
				}
				break;
			case 1:
				ChangeMusic(Music.GasStation);
				if (GasStation() != 0) {
					UnknownC0AC0C(2);
					if ((INIDISP_MIRROR & 0x80) != 0) {
						FadeOutWithMosaic(4, 1, 0);
					}
					CGADSUB = 0;
					CGWSEL = 0;
					TM_MIRROR = 1;
					TD_MIRROR = 0;
					ChangeMusic(Music.TitleScreen);
					x = ShowTitleScreen(1);
					x02++;
				} else {
					x = 0;
				}
				break;
			case 2:
				ChangeMusic(Music.TitleScreen);
				x = ShowTitleScreen(0);
				break;
			case 3:
				ChangeMusic(Music.AttractMode);
				x = UnknownC4D989(0);
				break;
			case 4:
				x = UnknownC4D989(2);
				break;
			case 5:
				x = UnknownC4D989(3);
				break;
			case 6:
				x = UnknownC4D989(4);
				break;
			case 7:
				x = UnknownC4D989(5);
				break;
			case 8:
				x = UnknownC4D989(6);
				break;
			case 9:
				x = UnknownC4D989(7);
				break;
			case 10:
				x = UnknownC4D989(9);
				break;
			default:
				x02 = 1;
				break;
		}
		x02++;
	}
	UnknownC0AC0C(2);
	Unknown7E0028.a = 0;
	if ((INIDISP_MIRROR & 0x80) != 0) {
		FadeOutWithMosaic(4, 1, 0);
	}
	CGADSUB = 0;
	CGWSEL = 0;
	TM_MIRROR = 1;
	TD_MIRROR = 0;
	Unknown7E5DD8 = 0;
}

/// $C4DCF6
void UnknownC4DCF6() {
	ushort* x0A = cast(ushort*)&Unknown7F0000[0];
	for (short i = 0; i < 0x400; i++) {
		x0A[i] |= 0x2000;
	}
}

/// $C4DD28
void DecompItoiProduction() {
	Decomp(&ProducedItoiArrangement[0], &Unknown7F0000[0]);
	UnknownC4DCF6();
	CopyToVram(0, 0x800, 0x7C00, &Unknown7F0000[0]);
	Decomp(&ProducedItoiGraphics[0], &Unknown7F0000[0x800]);
	CopyToVram(0, 0x400, 0x6000, &Unknown7F0000[0x800]);
	Decomp(&NintendoItoiPalette[0], &palettes[0][0]);
	palettes[0][0] = 0;
	UnknownC0856B(0x18);
}

/// $C4DDD0
void DecompNintendoPresentation() {
	Decomp(&NintendoPresentationArrangement[0], &Unknown7F0000[0]);
	UnknownC4DCF6();
	CopyToVram(0, 0x800, 0x7C00, &Unknown7F0000[0]);
	Decomp(&NintendoPresentationGraphics[0], &Unknown7F0000[0x800]);
	CopyToVram(0, 0x400, 0x6000, &Unknown7F0000[0x800]);
	Decomp(&NintendoItoiPalette[0], &palettes[0][0]);
	palettes[0][0] = 0;
	UnknownC0856B(0x18);
}

/// $C4DE78
immutable UnknownC4DE78Entry[8] UnknownC4DE78 = [
	UnknownC4DE78Entry(151, 48),
	UnknownC4DE78Entry(387, 1013),
	UnknownC4DE78Entry(35, 484),
	UnknownC4DE78Entry(88, 668),
	UnknownC4DE78Entry(479, 520),
	UnknownC4DE78Entry(445, 779),
	UnknownC4DE78Entry(843, 600),
	UnknownC4DE78Entry(766, 1228),
];

/// $C4DE98
void UnknownC4DE98() {
	Unknown7EB4B8 = 0;
	Unknown7EB4BA = 0;
	Unknown7EB4BC = 0;
	LoadedAnimatedTileCount = 0;
	Unknown7E4474 = 0;
	for (short i = 0; i < 8; i++) {
		Unknown7EB4BE[i] = null;
	}
	TM_MIRROR = 0x10;
}

/// $C4DED0
void UnknownC4DED0() {
	SetBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0x6000);
	TM_MIRROR = 0x11;
}

/// $C4DEE9
void UnknownC4DEE9(short arg1, short arg2) {
	UnknownC005E7();
	memcpy(&palettes[8][0], &SpriteGroupPalettes[0], 0x100);
	LoadMapPalette(arg1 / 8, arg1 & 7);
	UnknownC00480();
	Unknown7E0030 = 0;
	memcpy(&Unknown7F0000[0x4000 + arg2 * 0x200], &palettes[0][0], 0x100);
}

/// $C4DF7D
void UnknownC4DF7D(short arg1, short arg2, short arg3) {
	arg1 -= 16;
	arg2 -= 14;
	memset(&Unknown7EF000.Unknown7EF000Alt[0], 0, 0x800);
	ushort* x06 = cast(ushort*)&Unknown7F0000[arg3 * 0x800];
	for (short i = 0; i < MAX_ENTITIES; i++) {
		for (short j = 0; j < 0x20; j++) {
			short x0F;
			if (GlobalMapTilesetPaletteData[(i + arg2) / 16][(j + arg1) / 32] / 8 == Unknown7E436E) {
				x0F = UnknownC0A156F((j + arg1) / 4, (i + arg2) / 4);
			} else {
				x0F = 0;
			}
			Unknown7EF000.Unknown7EF000Alt[Unknown7F0000[0x8000 + (((i + arg2) & 3) * 4) + (x0F * 16) + (j + arg1) & 3] & 0x3FF * 2] = 0xFFFF;
			(x06++)[0] = Unknown7F0000[0x8000 + (((i + arg2) & 3) * 4) + (x0F * 16) + (j + arg1) & 3];
		}
	}
}

/// $C4E08C
void UnknownC4E08C(short arg1) {
	for (short i = 0; i < 0x400; i++) {
		if (Unknown7EF000.Unknown7EF000Alt[i] == 0) {
			continue;
		}
		CopyToVram(0, 0x20, (Unknown7EB4B8 * 16 + 0x6000) & 0x7FFF, &Unknown7F0000[0x8000 + i * 32]);
		Unknown7EF000.Unknown7EF000Alt[i] = Unknown7EB4B8;
		Unknown7EB4B8++;
		Unknown7EB4BC++;
	}
	ushort* x06 = (cast(ushort*)&Unknown7F0000[0x800 * arg1]);
	for (short i = 0; i < 0x3C0; i++) {
		ushort x14 = x06[0];
		x06[0] = Unknown7EF000.Unknown7EF000Alt[x14 & 0x3FF] | (x14 & 0xFC00);
		x06++;
	}
}

/// $C4E13E
void UnknownC4E13E(short arg1, short arg2, short arg3) {
	Unknown7EB4BC = 0;
	short x1A = GlobalMapTilesetPaletteData[arg2 / 16][arg1 / 32];
	Unknown7E436E = GlobalMapTilesetPaletteData[arg2 / 16][arg1 / 32];
	UnknownC4DEE9(x1A, arg3);
	Decomp(&MapDataTileArrangementPtrTable[TilesetTable[x1A]][0], &Unknown7F0000[0x8000]);
	UnknownC4DF7D(arg1, arg2, arg3);
	Decomp(&MapDataTilesetPtrTable[TilesetTable[x1A]][0], &Unknown7F0000[0x8000]);
	UnknownC4E08C(arg3);
	Unknown7EB4BA += Unknown7EB4BC;
}

/// $C4E281
void UnknownC4E281(short arg1) {
	if (Unknown7EB4BE[arg1] == null) {
		UnknownC4E13E(UnknownC4DE78[arg1].unknown0, UnknownC4DE78[arg1].unknown2, arg1);
	}
}

/// $C4E2D7
void UnknownC4E2D7(short arg1) {
	short x02 = arg1 & 7;
	if (Unknown7EB4BE[x02] == null) {
		UnknownC4E281(x02);
		WaitUntilNextFrame();
	}
	UnknownC08F8B();
	CopyToVram(0, 0x780, 0x3800, &Unknown7F0000[x02 * 0x800]);
	memcpy(&palettes[0][0], &Unknown7F0000[0x4000 + x02 * 0x200], 0x100);
	Unknown7E0030 = 8;
	Unknown7E4376 = 0;
	Unknown7E4374 = 0;
	BG1_Y_POS = 0;
	BG1_X_POS = 0;
}

/// $C4E366 - some debugging code deleted from earthbound
void UnknownC4E366() {
	version(JPN) {
		UnknownC4DE98();
		short x0E = 0;
		while (true) {
			BG1_X_POS = 0;
			BG1_Y_POS = 0;
			UpdateScreen();
			WaitUntilNextFrame();
			if ((pad_state[0] & PAD_R) == 0) {
				UnknownC4E2D7(x0E, x0E);
				UnknownC4DED0();
				if (++x0E == 8) {
					x0E = 0;
				}
			}
		}
	}
}

/// $C4E369
void UnknownC4E369() {
	Unknown7E9F2A = 0;
	FadeOutWithMosaic(1, 1, 0);
	UnknownC08726();
	UnknownC021E6();
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (EntityScriptTable[i] == -1) {
			continue;
		}
		EntitySpriteMapFlags[i] |= 0x8000;
	}
	LoadBackgroundAnimation(BackgroundLayer.Unknown279, BackgroundLayer.None);
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0);
	SetOAMSize(0x62);
	BG3_X_POS = 0;
	BG3_Y_POS = 0;
	BG2_Y_POS = 0;
	BG2_X_POS = 0;
	BG1_Y_POS = 0;
	BG1_X_POS = 0;
	UpdateScreen();
	*cast(ushort*)&Unknown7F0000[0] = 0;
	CopyToVram(3, 0x800, 0x7C00, &Unknown7F0000[0]);
	Unknown7EB4CE = 0xFF;
	memset(&Unknown7F0000[0], 0, 0x1000);
	Decomp(&UnknownE1D6E1[0], &Unknown7F0000[0x200]);
	Decomp(&CastNamesGraphics[0], &Unknown7F0000[0x600]);
	UnknownC4E7AE();
	CopyToVram(0, 0x8000, 0, &Unknown7F0000[0]);
	Unknown7EB4CE = 0;
	UnknownC47F87();
	memcpy(&palettes[0][0], &UnknownE1D815[0], 0x20);
	memcpy(&palettes[8][0], &SpriteGroupPalettes[0], 0x100);
	Decomp(&UnknownE1E4E6[0], &Unknown7F0000[0x7000]);
	Unknown7E0030 = 0x18;
	TM_MIRROR = 0x14;
	Unknown7EB4CF = 0;
	Unknown7EB4D1 = 0;
	UnknownC08744();
}

/// $C4E4DA
void UnknownC4E4DA(short arg1) {
	EntityScriptVar0Table[CurrentEntitySlot] = cast(short)(arg1 * 8 + BG3_Y_POS);
}

/// $C4E4F9
short UnknownC4E4F9() {
	short x0E = 0;
	if (EntityScriptVar0Table[CurrentEntitySlot] <= BG3_Y_POS) {
		x0E = 1;
	}
	return x0E;
}

/// $C4E51E
void UnknownC4E51E() {
	ubyte* x06 = &Unknown7F0000[0x7FFE];
	BG3_Y_POS = EntityAbsYTable[CurrentEntitySlot];
	if (EntityScriptVar7Table[CurrentEntitySlot] < EntityAbsYTable[CurrentEntitySlot]) {
		EntityScriptVar7Table[CurrentEntitySlot] += 8;
		x06[0] = 0;
		CopyToVram(3, 0x40, cast(ushort)((((BG3_Y_POS / 8) - 1) & 0x1F) * 32 + 0x7C00), x06);
	}
}

/// $C4E583
void UnknownC4E583(ubyte* arg1, short arg2, short arg3) {
	VWFTile = 0;
	VWFX = 0;
	memset(&VWFBuffer[0][0], 0xFF, 0x340);
	Unknown7E9652.unknown2 = 0;
	Unknown7E9652.unknown0 = 0;
	UnknownC1FF99(-1, arg2, arg1);
	for (short i = 0; arg1[0] != 0; arg1++, i++) {
		const(ubyte)* x0A = &FontConfigTable[0].graphics[FontConfigTable[0].width * (arg1[0] - EBChar(' ') & 0x7F)];
		short x1E = FontConfigTable[0].data[arg1[0] - EBChar(' ') & 0x7F] + Unknown7E5E6D;
		while (x1E > 8) {
			RenderText(x1E, FontConfigTable[0].width, x0A);
			x1E -= 8;
			x0A += FontConfigTable[0].width;
		}
		RenderText(x1E, FontConfigTable[0].width, x0A);
	}
	UnknownC4EEE1(arg2);
	short x04 = cast(short)(arg3 * 8);
	for (short i = 0; i < arg2; i++, x04 += 8) {
		memcpy(&Unknown7F0000[((arg3 & 0xF) + ((arg3 & 0x3F0) * 2)) * 16], &VWFBuffer[i][0], 16);
		memcpy(&Unknown7F0000[((arg3 & 0xF) + ((arg3 & 0x3F0) * 2)) * 16 + 256], &VWFBuffer[i][16], 16);
	}
}

/// $C4E796
immutable ubyte[][3] CharacterGuardianText = [
	EBString("'s dad"),
	EBString("'s mom"),
	EBString("'s Master"),
];

/// $C4E7AE
void UnknownC4E7AE() {
	ubyte[10] x16;
	for (short i = 0; i < 4; i++) {
		memset(&x16[0], 0, 0x10);
		memcpy(&x16[0], &PartyCharacters[i].name[0], 5);
		UnknownC4E583(&x16[0], 6, UnknownC3FDB5[i]);
	}
	memset(&x16[0], 0, 0x10);
	memcpy(&x16[0], &gameState.petName[0], 6);
	UnknownC4E583(&x16[0], 6, 0x1C0);
	memset(&x16[0], 0, 0x10);
	memcpy(&x16[0], &PartyCharacters[1].name[0], 5);
	strcat(cast(char*)&x16[0], cast(immutable(char)*)&CharacterGuardianText[0][0]);
	UnknownC4E583(&x16[0], CastSequenceFormatting[13].unknown2, CastSequenceFormatting[13].unknown0);
	memset(&x16[0], 0, 0x10);
	memcpy(&x16[0], &PartyCharacters[1].name[0], 5);
	strcat(cast(char*)&x16[0], cast(immutable(char)*)&CharacterGuardianText[1][0]);
	UnknownC4E583(&x16[0], CastSequenceFormatting[12].unknown2, CastSequenceFormatting[12].unknown0);
	memset(&x16[0], 0, 0x10);
	memcpy(&x16[0], &PartyCharacters[3].name[0], 5);
	strcat(cast(char*)&x16[0], cast(immutable(char)*)&CharacterGuardianText[2][0]);
	UnknownC4E583(&x16[0], CastSequenceFormatting[36].unknown2, CastSequenceFormatting[36].unknown0);
}

/// $C4EA9C
void UnknownC4EA9C(short arg1, short arg2, short arg3) {
	ushort* x06 = cast(ushort*)&Unknown7F0000[0x4000 + arg3];
	while (arg2-- != 0) {
		x06[0] = cast(short)(Unknown7EB4D1 + ((arg1 & 0x3F0) * 2) + (arg1 & 0xF));
		x06[0x40] = cast(short)(x06[0] + 0x10);
		x06++;
		arg1++;
	}
}

/// $C4EB04
void UnknownC4EB04(short arg1, short arg2, short arg3) {
	short x14 = (BG3_Y_POS / 8 + arg2) & 0x1F;
	short x04 = cast(short)((arg2 * 32) + arg1 + 0x7C00 - (arg3 + 1) / 2);
	CopyToVram(0, cast(ushort)(arg3 * 2), x04, &Unknown7F0000[0x4000 + arg1 * 2]);
	short x12;
	if (x14 != 0x1F) {
		x12 = cast(short)(x04 + 0x20);
	} else {
		x12 = cast(short)(x04 - 0x3E0);
	}
	CopyToVram(0, cast(short)(arg3 * 2), x12, &Unknown7F0000[0x4000 + arg1 * 2 + 64]);
}

/// $C4EBAD
void UnknownC4EBAD(short arg1, short arg2, short arg3) {
	UnknownC4EA9C(CastSequenceFormatting[arg1].unknown0, CastSequenceFormatting[arg1].unknown2, arg2);
	UnknownC4EB04(arg2, arg3, CastSequenceFormatting[arg1].unknown0);
}

/// $C4EC6E
void UnknownC4EC6E(short arg1) {
	memcpy(&palettes[12][0], &Unknown7F0000[0x7000 + arg1 * 32], 0x20);
	Unknown7E0030 = 0x10;
}

/// $C4EC05
void UnknownC4EC05(short arg1, short arg2, short arg3) {
	if (arg1 != 7) {
		UnknownC4EA9C(UnknownC3FDB5[arg1 - 1], 6, arg2);
		UnknownC4EB04(arg2, arg3, 6);
	} else {
		UnknownC4EA9C(0x1C0, 6, arg2);
		UnknownC4EB04(arg2, arg3, 6);
	}
}

/// $C4EC52
void UnknownC4EC52(short arg1, short arg2, short arg3) {
	UnknownC4EBAD(EntityScriptVar0Table[CurrentEntitySlot], arg2, arg3);
}

/// $C4ECAD
short UnknownC4ECAD(short arg1, short arg2) {
	NewEntityVar0 = Unknown7EB4D3 & 3;
	return CreateEntity(arg1, arg2, -1, EntityScriptVar0Table[CurrentEntitySlot], cast(short)(EntityScriptVar1Table[CurrentEntitySlot] + BG3_Y_POS));
}

/// $C4ECE7
short UnknownC4ECE7() {
	short x0E = 0;
	if (BG3_Y_POS - 8 < EntityAbsYTable[CurrentEntitySlot]) {
		x0E = 1;
	}
	return x0E;
}

/// $C4ED0E
void UnknownC4ED0E() {
	UnknownC4E369();
	OAMClear();
	FadeIn(1, 1);
	InitEntityWipe(ActionScript.Unknown801, 0, 0);
	Unknown7E9641 = 0;
	while (Unknown7E9641 == 0) {
		UnknownC1004E();
		UnknownC2DB3F();
	}
	FadeOutWithMosaic(1, 1, 0);
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (EntityScriptTable[i] == ActionScript.Unknown801) {
			UnknownC09C35(i);
		}
	}
	EntityAllocationMinSlot = 0x17;
	EntityAllocationMaxSlot = 0x18;
	InitEntity(0, 0, ActionScript.Unknown001);
	UnknownC02D29();
	UnknownC03A24();
	UnknownC08726();
	UndrawFlyoverText();
	TM_MIRROR = 0x17;
}

/// $C4EEE1
void UnknownC4EEE1(short arg1) {
	ubyte* x = &VWFBuffer[0][0];
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
void UnknownC4EFC4(short arg1, short arg2, short arg3, const(ubyte)* arg4) {
	Unknown7E5156Credits[Unknown7EB4F5].unknown0 = cast(ubyte)arg1;
	Unknown7E5156Credits[Unknown7EB4F5].unknown1 = arg2;
	Unknown7E5156Credits[Unknown7EB4F5].unknown3 = arg4;
	Unknown7E5156Credits[Unknown7EB4F5].unknown7 = arg3;
	Unknown7EB4F5 = (Unknown7EB4F5 + 1) & 0x7F;
}

/// $C4F01D
void UnknownC4F01D() {
	if (Unknown7EB4F5 == Unknown7EB4F3) {
		return;
	}
	CopyToVram(Unknown7E5156Credits[Unknown7EB4F3].unknown0, Unknown7E5156Credits[Unknown7EB4F3].unknown1, Unknown7E5156Credits[Unknown7EB4F3].unknown7, Unknown7E5156Credits[Unknown7EB4F3].unknown3);
	Unknown7EB4F3 = (Unknown7EB4F3 + 1) & 0x7F;
}

/// $C4F07D
void UnknownC4F07D() {
	UnknownC08726();
	UnknownC021E6();
	Unknown7EB4F7 = 0;
	Unknown7EB4F5 = 0;
	Unknown7EB4F3 = 0;
	SetBG1VRAMLocation(BGTileMapSize.horizontal, 0x3800, 0);
	SetBG2VRAMLocation(BGTileMapSize.both, 0x7000, 0x2000);
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x6C00, 0x6000);
	SetOAMSize(0x62);
	BG3_X_POS = 0;
	BG3_Y_POS = 0;
	BG2_Y_POS = 0;
	BG2_X_POS = 0;
	BG1_Y_POS = 0;
	BG1_X_POS = 0;
	UpdateScreen();
	*(cast(ushort*)&Unknown7F0000[0]) = 0;
	CopyToVram(3, 0x1000, 0x3800, &Unknown7F0000[0]);
	*(cast(ushort*)&Unknown7F0000[0]) = 0x240C;
	CopyToVram(9, 0x1000, 0x7000, &Unknown7F0000[0]);
	CopyToVram(15, 0x1000, 0x7000, &Unknown7F0000[1]);
	Decomp(&UnknownE1E94A[0], &Unknown7F0000[0]);
	memcpy(&palettes[1][0], &UnknownE1E92A[0], 0x20);
	CopyToVram(0, 0x700, 0x7000, &Unknown7F0000[0]);
	CopyToVram(0, 0x2000, 0x2000, &Unknown7F0000[0x700]);
	*(cast(ushort*)&Unknown7F0000[0]) = 0;
	CopyToVram(3, 0x800, 0x6C00, &Unknown7F0000[0x700]);
	Decomp(&StaffCreditsFontGraphics[0], &Unknown7F0000[0]);
	CopyToVram(0, 0xC00, 0x6200, &Unknown7F0000[0]);
	memcpy(&palettes[0][0], &StaffCreditsFontPalette[0], 0x10);
	memcpy(&palettes[8][0], &SpriteGroupPalettes[0], 0x100);
	memset(&palettes[1][0], 0, 0x1E0);
	Unknown7E0030 = 0x18;
	TM_MIRROR = 0x17;
	Unknown7EB4E3 = 0;
	Unknown7EB4EB.combined = 0;
	Unknown7EB4E5 = 7;
	ushort* x06 = &bg2Buffer[0];
	for (short i = 0; i < 0x200; i++) {
		*(x06++) = 0;
	}
	Unknown7EB4E7 = &StaffText[0];
	UnknownC08744();
}

/// $C4F264
short UnknownC4F264(short arg1) {
	if (getEventFlag(PhotographerConfigTable[arg1].eventFlag) == 0) {
		return 0;
	}
	Unknown7EB4EF = 1;
	CurPhotoDisplay = arg1;
	short x02 = Unknown7E4A5A;
	Unknown7E4A5A = 0;
	ushort* x = cast(ushort*)&heap[0][0];
	// the original code went way beyond the heap. the heap appears to be 0x400 bytes, so perhaps they just forgot to factor the size of a short?
	for (short i = 0; i < 0x200/+0x400+/; i++) {
		*(x++) = 0;
	}
	Unknown7E0030 = 0;
	memcpy(&palettes[1][0], &UnknownE1E92A[0], 32);
	LoadMapAtPosition(PhotographerConfigTable[arg1].mapX, PhotographerConfigTable[arg1].mapY);
	Unknown7E4A5A = x02;
	BG2_Y_POS = 0;
	BG2_X_POS = 0;
	Unknown7EB4EF = 0;
	short x1A = 0;
	for (short i = 0; i < 4; i++) {
		if (PhotographerConfigTable[arg1].objectConfig[i].sprite == 0) {
			continue;
		}
		NewEntityVar0 = x1A++;
		CreateEntity(PhotographerConfigTable[arg1].objectConfig[i].sprite, ActionScript.Unknown799, -1, PhotographerConfigTable[arg1].objectConfig[i].tileX, PhotographerConfigTable[arg1].objectConfig[i].tileY);
	}
	for (short i = 0; i < 6; i++) {
		if ((gameState.savedPhotoStates[arg1].partyMembers[i] & 0x1F) >= 18) {
			continue;
		}
		if ((gameState.savedPhotoStates[arg1].partyMembers[i] & 0x1F) == 0) {
			continue;
		}
		NewEntityVar0 = x1A++;
		UnknownC07A31(CreateEntity(UnknownC079EC(gameState.savedPhotoStates[arg1].partyMembers[i]), ActionScript.Unknown800, -1, PhotographerConfigTable[arg1].party_config[i].x, PhotographerConfigTable[arg1].party_config[i].y), gameState.savedPhotoStates[arg1].partyMembers[i]);
	}
	return 1;
}

/// $C4F433
short CountPhotoFlags() {
	short x10 = 0;
	for (short i = 0; i < 32; i++) {
		if (getEventFlag(PhotographerConfigTable[i].eventFlag) != 0) {
			x10++;
		}
	}
	return x10;
}

/// $C4F46F
void UnknownC4F46F(short arg1) {
	FixedPoint1616 x0A = UnknownC41FFF(cast(short)(PhotographerConfigTable[arg1].slideDirection * 0x400), 0x100);
	short x18 = BG1_X_POS;
	short x16 = BG1_Y_POS;
	short x02 = 0;
	short x04 = 0;
	for (short i = 0; i < (PhotographerConfigTable[arg1].slideDistance << 8) / 0x100; i++) {
		x02 += x0A.integer;
		x04 += x0A.fraction;
		BG1_X_POS = cast(ushort)((x02 / 0x100) + x18);
		BG1_Y_POS = cast(ushort)((x04 / 0x100) + x16);
		BG2_X_POS = cast(ushort)(x02 / 0x100);
		BG2_Y_POS = cast(ushort)(x04 / 0x100);
		UnknownC4F01D();
		UnknownC1004E();
	}
}

/// $C4F554
void PlayCredits() {
	Unknown7EB4B6 = 1;
	UnknownC4F07D();
	OAMClear();
	FadeIn(1, 2);
	short x04 = (CountPhotoFlags() != 0) ? (4528 / CountPhotoFlags()) : 4528;
	short x02 = x04;
	SetIRQCallback(&UnknownC0F41E);
	for (short i = 0; i < 32; i++) {
		if (UnknownC4F264(i) != 0) {
			UnknownC496E7(64, -1);
			for (short j = 0x40; j != 0; j--) {
				UnknownC426ED();
				UnknownC4F01D();
				UnknownC1004E();
			}
			UnknownC49740();
			UnknownC4F46F(i);
			while (x02 > BG3_Y_POS) {
				UnknownC4F01D();
				UnknownC1004E();
			}
			memset(&Unknown7F0000[32], 0, 0x1E0);
			UnknownC496E7(64, -1);
			for (short j = 0; j < 64; j++) {
				UnknownC426ED();
				UnknownC4F01D();
				UnknownC1004E();
			}
			memset(&palettes[1][0], 0, 0x1E0);
			UnknownC0856B(0x18);
			UnknownC4F01D();
			UnknownC1004E();
			x02 += x04;
		}
	}
	while (BG3_Y_POS < 4528) {
		UnknownC4F01D();
		UnknownC1004E();
	}
	ResetIRQCallback();
	for (short i = 0; i < 2000; i++) {
		UnknownC1004E();
	}
	FadeOutWithMosaic(1, 2, 0);
	UnknownC4249A(0xB3, 0);
	UnknownC08726();
	OverworldSetupVRAM();
	UnknownC021E6();
	EntityAllocationMinSlot = 0x17;
	EntityAllocationMaxSlot = 0x18;
	InitEntity(ActionScript.Unknown001, 0, 0);
	UnknownC02D29();
	UnknownC03A24();
	ushort* x06 = &bg2Buffer[0];
	for (short i = 0; i < 0x200; i++) {
		*(x06++) = 0;
	}
	UndrawFlyoverText();
	TM_MIRROR = 0x17;
	SetIRQCallback(&ProcessOverworldTasks);
	Unknown7EB4B6 = 0;
}

/// $C4F70D
immutable MusicDataset[191] MusicDatasetTable = [
	MusicDataset(0x00, 0xFF, 0x01),
	MusicDataset(0x02, 0x03, 0x04),
	MusicDataset(0x02, 0x03, 0x04),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0x06),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0x07),
	MusicDataset(0x05, 0x08, 0x09),
	MusicDataset(0x05, 0x08, 0x0A),
	MusicDataset(0x05, 0x08, 0x0B),
	MusicDataset(0x05, 0x08, 0x0C),
	MusicDataset(0x05, 0x08, 0x0D),
	MusicDataset(0x05, 0x08, 0x0E),
	MusicDataset(0x05, 0x08, 0x0F),
	MusicDataset(0x05, 0x08, 0x10),
	MusicDataset(0x05, 0x08, 0x11),
	MusicDataset(0x05, 0x08, 0x12),
	MusicDataset(0x05, 0x08, 0x13),
	MusicDataset(0x05, 0x08, 0x13),
	MusicDataset(0x05, 0x08, 0x14),
	MusicDataset(0x05, 0x15, 0x16),
	MusicDataset(0x05, 0xFF, 0x17),
	MusicDataset(0x05, 0xFF, 0x17),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x18, 0x19),
	MusicDataset(0x05, 0x15, 0x1A),
	MusicDataset(0x05, 0x1B, 0x1C),
	MusicDataset(0x05, 0x1B, 0x1D),
	MusicDataset(0x05, 0x1B, 0x1E),
	MusicDataset(0x05, 0x1B, 0x1F),
	MusicDataset(0x05, 0x08, 0x20),
	MusicDataset(0x05, 0x21, 0x22),
	MusicDataset(0x05, 0x23, 0x24),
	MusicDataset(0x05, 0x25, 0x26),
	MusicDataset(0x05, 0x25, 0x27),
	MusicDataset(0x05, 0x28, 0x29),
	MusicDataset(0x05, 0x2A, 0x2B),
	MusicDataset(0x05, 0x2C, 0x2D),
	MusicDataset(0x05, 0x08, 0x2E),
	MusicDataset(0x05, 0x2F, 0x30),
	MusicDataset(0x05, 0x2F, 0x31),
	MusicDataset(0x05, 0x32, 0x33),
	MusicDataset(0x05, 0x34, 0x35),
	MusicDataset(0x05, 0x36, 0x37),
	MusicDataset(0x05, 0x38, 0x39),
	MusicDataset(0x05, 0x3A, 0x3B),
	MusicDataset(0x05, 0x3C, 0x3D),
	MusicDataset(0x05, 0x3C, 0x3E),
	MusicDataset(0x05, 0x3C, 0x3F),
	MusicDataset(0x05, 0x40, 0x41),
	MusicDataset(0x05, 0x42, 0x43),
	MusicDataset(0x05, 0x18, 0x44),
	MusicDataset(0x05, 0x18, 0x45),
	MusicDataset(0x05, 0x46, 0x47),
	MusicDataset(0x05, 0x48, 0x49),
	MusicDataset(0x05, 0x4A, 0x4B),
	MusicDataset(0x05, 0x4C, 0x4D),
	MusicDataset(0x05, 0x4C, 0x4D),
	MusicDataset(0x05, 0x4E, 0x4F),
	MusicDataset(0x05, 0x50, 0x51),
	MusicDataset(0x05, 0x52, 0x53),
	MusicDataset(0x05, 0x54, 0x55),
	MusicDataset(0x05, 0x54, 0x56),
	MusicDataset(0x05, 0x54, 0x57),
	MusicDataset(0x05, 0x46, 0x58),
	MusicDataset(0x05, 0x59, 0x5A),
	MusicDataset(0x05, 0x2C, 0x5B),
	MusicDataset(0x05, 0x5C, 0x5D),
	MusicDataset(0x05, 0x2C, 0x5E),
	MusicDataset(0x05, 0x2C, 0x5E),
	MusicDataset(0x05, 0x5F, 0x60),
	MusicDataset(0x05, 0x2C, 0x61),
	MusicDataset(0x05, 0x62, 0x63),
	MusicDataset(0x05, 0x23, 0x64),
	MusicDataset(0x05, 0xFF, 0x65),
	MusicDataset(0x05, 0xFF, 0x66),
	MusicDataset(0x05, 0xFF, 0x67),
	MusicDataset(0x05, 0x54, 0x68),
	MusicDataset(0x05, 0x69, 0x6A),
	MusicDataset(0x05, 0x54, 0x6B),
	MusicDataset(0x6C, 0xFF, 0x6D),
	MusicDataset(0x05, 0x6E, 0x6F),
	MusicDataset(0x05, 0x6E, 0x70),
	MusicDataset(0x05, 0x6E, 0x71),
	MusicDataset(0x05, 0x72, 0x73),
	MusicDataset(0x05, 0x74, 0x75),
	MusicDataset(0x05, 0x76, 0x77),
	MusicDataset(0x05, 0x76, 0x78),
	MusicDataset(0x05, 0x15, 0x79),
	MusicDataset(0x05, 0x7A, 0x7B),
	MusicDataset(0x05, 0x7C, 0x7D),
	MusicDataset(0x05, 0x7E, 0x7F),
	MusicDataset(0x05, 0x7E, 0x80),
	MusicDataset(0x05, 0x15, 0x81),
	MusicDataset(0x05, 0x2C, 0x5E),
	MusicDataset(0x05, 0x2C, 0x5E),
	MusicDataset(0x05, 0xFF, 0x82),
	MusicDataset(0x05, 0x83, 0x0E),
	MusicDataset(0x05, 0x83, 0x0E),
	MusicDataset(0x05, 0x83, 0x84),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0x83, 0x85),
	MusicDataset(0x05, 0x15, 0x86),
	MusicDataset(0x05, 0x83, 0x84),
	MusicDataset(0x05, 0xFF, 0x87),
	MusicDataset(0x05, 0x08, 0x88),
	MusicDataset(0x05, 0x83, 0x84),
	MusicDataset(0x05, 0x21, 0x22),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0x89),
	MusicDataset(0x05, 0x2F, 0x8A),
	MusicDataset(0x05, 0xFF, 0x67),
	MusicDataset(0x05, 0xFF, 0x67),
	MusicDataset(0x05, 0x8B, 0x8C),
	MusicDataset(0x05, 0x8B, 0x8D),
	MusicDataset(0x05, 0x54, 0x57),
	MusicDataset(0x05, 0x08, 0x8E),
	MusicDataset(0x05, 0xFF, 0x8F),
	MusicDataset(0x05, 0x1B, 0x90),
	MusicDataset(0x05, 0x72, 0x91),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0x25, 0x26),
	MusicDataset(0x05, 0x08, 0x0A),
	MusicDataset(0x05, 0x08, 0x0A),
	MusicDataset(0x05, 0x08, 0x0A),
	MusicDataset(0x05, 0x59, 0x92),
	MusicDataset(0x05, 0x72, 0x73),
	MusicDataset(0x05, 0xFF, 0x93),
	MusicDataset(0x05, 0x18, 0x94),
	MusicDataset(0x05, 0x36, 0x37),
	MusicDataset(0x05, 0x1B, 0x1C),
	MusicDataset(0x05, 0x2C, 0x61),
	MusicDataset(0x05, 0x83, 0x95),
	MusicDataset(0x05, 0x54, 0x96),
	MusicDataset(0x05, 0x54, 0x96),
	MusicDataset(0x05, 0x83, 0x85),
	MusicDataset(0x05, 0x1B, 0x97),
	MusicDataset(0x05, 0x83, 0x95),
	MusicDataset(0x05, 0x83, 0x85),
	MusicDataset(0x05, 0x83, 0x98),
	MusicDataset(0x05, 0xFF, 0x91),
	MusicDataset(0x05, 0x83, 0x95),
	MusicDataset(0x02, 0x99, 0x9A),
	MusicDataset(0x02, 0x03, 0x04),
	MusicDataset(0x05, 0x2C, 0x9B),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x18, 0x9E),
	MusicDataset(0x05, 0x38, 0x9F),
	MusicDataset(0x05, 0x2F, 0xA0),
	MusicDataset(0x05, 0xA1, 0xA2),
	MusicDataset(0x05, 0x08, 0x88),
	MusicDataset(0x00, 0xFF, 0x01),
	MusicDataset(0x02, 0x99, 0xA3),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0x83, 0x85),
	MusicDataset(0x05, 0x3C, 0xA4),
	MusicDataset(0x05, 0xA5, 0xA6),
	MusicDataset(0x05, 0xA1, 0xA2),
	MusicDataset(0x05, 0xFF, 0x66),
	MusicDataset(0x05, 0x52, 0x53),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0xFF, 0xFF),
	MusicDataset(0x05, 0x4E, 0x4F),
	MusicDataset(0x05, 0x4C, 0xA7),
	MusicDataset(0x05, 0x4E, 0x4F),
	MusicDataset(0x05, 0x2F, 0xA8),
	MusicDataset(0x05, 0x9C, 0x9D),
	MusicDataset(0x05, 0x52, 0x53),
	MusicDataset(0x05, 0x50, 0x51),
];

immutable ubyte[][169] MusicPackPointerTable = [
	cast(immutable(ubyte)[])import("audiopacks/0.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/1.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/2.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/3.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/4.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/5.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/6.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/7.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/8.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/9.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/10.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/11.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/12.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/13.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/14.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/15.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/16.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/17.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/18.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/19.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/20.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/21.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/22.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/23.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/24.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/25.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/26.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/27.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/28.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/29.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/30.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/31.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/32.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/33.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/34.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/35.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/36.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/37.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/38.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/39.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/40.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/41.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/42.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/43.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/44.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/45.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/46.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/47.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/48.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/49.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/50.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/51.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/52.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/53.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/54.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/55.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/56.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/57.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/58.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/59.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/60.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/61.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/62.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/63.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/64.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/65.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/66.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/67.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/68.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/69.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/70.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/71.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/72.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/73.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/74.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/75.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/76.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/77.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/78.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/79.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/80.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/81.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/82.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/83.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/84.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/85.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/86.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/87.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/88.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/89.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/90.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/91.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/92.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/93.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/94.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/95.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/96.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/97.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/98.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/99.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/100.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/101.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/102.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/103.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/104.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/105.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/106.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/107.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/108.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/109.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/110.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/111.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/112.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/113.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/114.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/115.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/116.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/117.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/118.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/119.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/120.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/121.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/122.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/123.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/124.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/125.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/126.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/127.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/128.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/129.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/130.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/131.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/132.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/133.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/134.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/135.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/136.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/137.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/138.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/139.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/140.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/141.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/142.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/143.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/144.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/145.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/146.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/147.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/148.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/149.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/150.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/151.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/152.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/153.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/154.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/155.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/156.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/157.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/158.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/159.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/160.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/161.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/162.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/163.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/164.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/165.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/166.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/167.spcpack"),
	cast(immutable(ubyte)[])import("audiopacks/168.spcpack"),
];

/// $C4FBBD
void ChangeMusic(short track) {
	version(audio) {
		if (track == CurrentMusicTrack) {
			return;
		}
		if (Unknown7EB4B6 == 0) {
			PlaySfxUnknown();
		}
		if ((track < Music.SoundstoneRecordingGiantStep) || (track > Music.SoundstoneRecordingFireSpring)) {
			UnknownC0AC0C(1);
			StopMusic();
		}
		CurrentMusicTrack = track;
		const(MusicDataset)* dataset = &MusicDatasetTable[track - 1];
		if ((dataset.primarySamplePack != CurrentPrimarySamplePack) || (dataset.primarySamplePack != 0xFF)) {
			CurrentPrimarySamplePack = dataset.primarySamplePack;
			// not using segmented addressing...
			//LoadSPC700Data(MusicPackPointerTable[dataset.primarySamplePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[dataset.primarySamplePack].bank));
			LoadSPC700Data(&MusicPackPointerTable[dataset.primarySamplePack][0]);
		}
		if ((dataset.secondarySamplePack != CurrentSecondarySamplePack) || (dataset.secondarySamplePack != 0xFF)) {
			CurrentSecondarySamplePack = dataset.secondarySamplePack;
			//LoadSPC700Data(MusicPackPointerTable[dataset.secondarySamplePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[dataset.secondarySamplePack].bank));
			LoadSPC700Data(&MusicPackPointerTable[dataset.secondarySamplePack][0]);
		}
		if ((dataset.sequencePack != CurrentSequencePack) || (dataset.sequencePack != 0xFF)) {
			CurrentSequencePack = dataset.sequencePack;
			//LoadSPC700Data(MusicPackPointerTable[dataset.sequencePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[dataset.sequencePack].bank));
			LoadSPC700Data(&MusicPackPointerTable[dataset.sequencePack][0]);
		}
		UnknownC0ABBD(track);
	} else {
		return;
	}
}

/// $C4FB58
void InitializeSPC700() {
	CurrentSequencePack = 0xFFFF;
	CurrentPrimarySamplePack = 0xFFFF;
	Unknown7EB543 = MusicDatasetTable[0].sequencePack;
	CurrentSecondarySamplePack = MusicDatasetTable[0].sequencePack;
	//LoadSPC700Data(MusicPackPointerTable[MusicDatasetTable[0].sequencePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[MusicDatasetTable[0].sequencePack].bank));
	LoadSPC700Data(&MusicPackPointerTable[MusicDatasetTable[0].sequencePack][0]);
	SectorBoundaryBehaviourFlag = 1;
}

/// $C4FD18
void UnknownC4FD18(short arg1) {
	if (arg1 == 0) {
		LoadSPC700Data(&StereoMonoData[7]);
	} else {
		LoadSPC700Data(&StereoMonoData[0]);
	}
}

/// $C4FD45
void SetBoundaryBehaviour(short val) {
	SectorBoundaryBehaviourFlag = val;
}

shared static this() {
	import std.array : join;
	EntityOverlaySweating = [
		OverlayScript.show(EntityOverlaySweatingFrame1.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(EntityOverlaySweatingFrame2.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(cast(const(SpriteMap)*)null),
		OverlayScript.delay(16),
		OverlayScript.show(EntityOverlaySweatingFrame3.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(EntityOverlaySweatingFrame4.ptr),
		OverlayScript.delay(8),
		OverlayScript.show(cast(const(SpriteMap)*)null),
		OverlayScript.delay(16),
		OverlayScript.jump(EntityOverlaySweating.ptr),
	];
	EntityOverlayMushroomized = [
		OverlayScript.show(EntityOverlayMushroomizedFrame1.ptr),
		OverlayScript.delay(255),
		OverlayScript.jump(EntityOverlayMushroomized.ptr)
	];
	EntityOverlayRipple = [
		OverlayScript.show(EntityOverlayRippleFrame1.ptr),
		OverlayScript.delay(12),
		OverlayScript.show(EntityOverlayRippleFrame2.ptr),
		OverlayScript.delay(12),
		OverlayScript.jump(EntityOverlayRipple.ptr)
	];
	EntityOverlayBigRipple = [
		OverlayScript.show(EntityOverlayBigRippleFrame1.ptr),
		OverlayScript.delay(12),
		OverlayScript.show(EntityOverlayBigRippleFrame2.ptr),
		OverlayScript.delay(12),
		OverlayScript.jump(EntityOverlayBigRipple.ptr)
	];
}
