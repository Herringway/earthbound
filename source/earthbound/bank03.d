/// actionscripts, misc things
module earthbound.bank03;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank04;
import earthbound.bank05;
import earthbound.bank15;
import earthbound.bank18;
import earthbound.bank20;
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.globals;
import core.stdc.string;

//$C30000
immutable ushort[16][8] SpriteGroupPalettes = [
	convertPalette(cast(immutable(ubyte)[])import("overworld_sprites/0.pal")),
	convertPalette(cast(immutable(ubyte)[])import("overworld_sprites/1.pal")),
	convertPalette(cast(immutable(ubyte)[])import("overworld_sprites/2.pal")),
	convertPalette(cast(immutable(ubyte)[])import("overworld_sprites/3.pal")),
	convertPalette(cast(immutable(ubyte)[])import("overworld_sprites/4.pal")),
	convertPalette(cast(immutable(ubyte)[])import("overworld_sprites/5.pal")),
	convertPalette(cast(immutable(ubyte)[])import("overworld_sprites/6.pal")),
	convertPalette(cast(immutable(ubyte)[])import("overworld_sprites/7.pal")),
];

/// $C30100
void DisplayAntiPiracyScreen() {
	UnknownC40B51();
	Decomp(&AntiPiracyNoticeGraphics[0], &Unknown7F0000[0]);
	Decomp(&AntiPiracyNoticeArrangement[0], &Unknown7F0000[0x4000]);
	UnknownC40B75();
}

/// $C30142
void DisplayFaultyGamepakScreen() {
	UnknownC40B51();
	Decomp(&FaultyGamepakGraphics[0], &Unknown7F0000[0]);
	Decomp(&FaultyGamepakArrangement[0], &Unknown7F0000[0x4000]);
	UnknownC40B75();
}

/// $C30186
immutable NessPajamaFlag = EventFlag.NessPajamas;

/// $C3DFE8
immutable ubyte[8] UnknownC3DFE8 = [1, 1, 1, 0, 1, 1, 0, 0];

/// $C3DFF0 - unused?
immutable short[17] UnknownC3DFF0 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];

/// $C3E012
immutable CharacterInitialEntityDataEntry[17] CharacterInitialEntityData = [
	CharacterInitialEntityDataEntry(OverworldSprite.Ness, OverworldSprite.LilNess, ActionScript.Unknown002, 0x0018),
	CharacterInitialEntityDataEntry(OverworldSprite.Paula, OverworldSprite.LilPaula, ActionScript.Unknown002, 0x0019),
	CharacterInitialEntityDataEntry(OverworldSprite.Jeff, OverworldSprite.LilJeff, ActionScript.Unknown002, 0x001A),
	CharacterInitialEntityDataEntry(OverworldSprite.Poo, OverworldSprite.LilPoo, ActionScript.Unknown002, 0x001B),
	CharacterInitialEntityDataEntry(OverworldSprite.Pokey, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.Picky, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.King, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.Tony, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.BubbleMonkey, OverworldSprite.Invalid, ActionScript.Unknown003, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.DungeonMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.TeddyBearParty, OverworldSprite.LilTeddyBear, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.TeddyBearParty, OverworldSprite.LilTeddyBear, ActionScript.Unknown002, 0x001C),
];

/// $C3E09A
immutable ushort[17] CharacterSizes = [
	0,
	0,
	0,
	0,
	0,
	0,
	4,
	0,
	0,
	10,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
];

/// $C3E0BC
immutable FixedPoint1616[14] defaultMovementSpeeds = [
	FixedPoint1616(0x6000, 1), //NORMAL
	FixedPoint1616(0x6000, 1), //UNKNOWN_01
	FixedPoint1616(0x6000, 1), //UNKNOWN_02
	FixedPoint1616(0xCCCC, 1), //BICYCLE
	FixedPoint1616(0x0000, 1), //GHOST
	FixedPoint1616(0x0000, 0), //UNKNOWN_05
	FixedPoint1616(0x0000, 1), //SLOWER
	FixedPoint1616(0xCCCC, 0), //LADDER
	FixedPoint1616(0xCCCC, 0), //ROPE
	FixedPoint1616(0x0000, 0), //UNKNOWN_09
	FixedPoint1616(0x8000, 0), //SLOWEST
	FixedPoint1616(0x0000, 0), //UNKNOWN_0B
	FixedPoint1616(0xCCCC, 0), //ESCALATOR
	FixedPoint1616(0xCCCC, 0), //STAIRS
];
immutable FixedPoint1616[14] defaultMovementSpeedsDiagonal = [
	FixedPoint1616(0xF8E6, 0), //NORMAL
	FixedPoint1616(0xF8E6, 0), //UNKNOWN_01
	FixedPoint1616(0xF8E6, 0), //UNKNOWN_02
	FixedPoint1616(0x45D5, 1), //BICYCLE
	FixedPoint1616(0xB505, 0), //GHOST
	FixedPoint1616(0x0000, 0), //UNKNOWN_05
	FixedPoint1616(0xB505, 0), //SLOWER
	FixedPoint1616(0x90D0, 0), //LADDER
	FixedPoint1616(0x90D0, 0), //ROPE
	FixedPoint1616(0x0000, 0), //UNKNOWN_09
	FixedPoint1616(0x5A82, 0), //SLOWEST
	FixedPoint1616(0x0000, 0), //UNKNOWN_0B
	FixedPoint1616(0x90D0, 0), //ESCALATOR
	FixedPoint1616(0x90D0, 0), //STAIRS
];

/// $C3E12C
immutable ushort[] AllowedInputDirections = [
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //NORMAL
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_01
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_02
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //BICYCLE
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //GHOST
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_05
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //SLOWER
	DirectionMask.Up | DirectionMask.Down, //LADDER
	DirectionMask.Up | DirectionMask.Down, //ROPE
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_09
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //SLOWEST
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_0B
	0, //ESCALATOR
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft //STAIRS
];

/// $C3E148
immutable short[8] UnknownC3E148 = [0, 0, 10, 0, 0, 0, -10, 0];

/// $C3E158
immutable short[8] UnknownC3E158 = [-5, -5, 0, 5, 5, 5, 0, -5];

/// $C3E168
immutable short[8] UnknownC3E168 = [Direction.Down, Direction.Down, Direction.Left, Direction.Up, Direction.Up, Direction.Up, Direction.Right, Direction.Down];

/// $C3E178
immutable short[16][3] MushroomizationDirectionRemapTables = [
	[
		0,
		PAD_DOWN,
		PAD_UP,
		PAD_UP | PAD_DOWN,
		PAD_LEFT,
		PAD_LEFT | PAD_DOWN,
		PAD_LEFT | PAD_UP,
		PAD_LEFT | PAD_UP | PAD_DOWN,
		PAD_RIGHT,
		PAD_RIGHT | PAD_DOWN,
		PAD_RIGHT | PAD_UP,
		PAD_RIGHT | PAD_UP | PAD_DOWN,
		PAD_RIGHT | PAD_LEFT,
		PAD_RIGHT | PAD_LEFT | PAD_DOWN,
		PAD_RIGHT | PAD_LEFT | PAD_UP,
		PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN,
	], [
		0,
		PAD_LEFT,
		PAD_RIGHT,
		PAD_RIGHT | PAD_LEFT,
		PAD_UP,
		PAD_LEFT | PAD_UP,
		PAD_RIGHT | PAD_UP,
		PAD_RIGHT | PAD_LEFT | PAD_UP,
		PAD_DOWN,
		PAD_LEFT | PAD_DOWN,
		PAD_RIGHT | PAD_DOWN,
		PAD_RIGHT | PAD_LEFT | PAD_DOWN,
		PAD_UP | PAD_DOWN,
		PAD_LEFT | PAD_UP | PAD_DOWN,
		PAD_RIGHT | PAD_UP | PAD_DOWN,
		PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN,
	], [
		0,
		PAD_UP,
		PAD_DOWN,
		PAD_UP | PAD_DOWN,
		PAD_RIGHT,
		PAD_RIGHT | PAD_UP,
		PAD_RIGHT | PAD_DOWN,
		PAD_RIGHT | PAD_UP | PAD_DOWN,
		PAD_LEFT,
		PAD_LEFT | PAD_UP,
		PAD_LEFT | PAD_DOWN,
		PAD_LEFT | PAD_UP | PAD_DOWN,
		PAD_RIGHT | PAD_LEFT,
		PAD_RIGHT | PAD_LEFT | PAD_UP,
		PAD_RIGHT | PAD_LEFT | PAD_DOWN,
		PAD_RIGHT | PAD_LEFT | PAD_UP | PAD_DOWN,
	]
];

/// $C3E1D8
immutable short[4] UnknownC3E1D8 = [4, 0, 2, 6];

/// $C3E1E0
//wonder what this is...?
immutable short[4][4] UnknownC3E1E0 = [[0, 0, 4, 0], [0, 0, -4, 0], [-4, 0, 0, 0], [4, 0, 0, 0]];

/// $C3E200
immutable short[4] UnknownC3E200 = [7, 1, 5, 3];

/// $C3E208
immutable short[4] UnknownC3E208 = [2, 6, 2, 6];

/// $C3E210
immutable short[4] UnknownC3E210 = [0, 8, 0, 8];

/// $C3E218
immutable short[4] UnknownC3E218 = [0, 0, 8, 8];

/// $C3E220
immutable short[4] UnknownC3E220 = [8, 0, 8, 0];

/// $C3E228
immutable short[4] UnknownC3E228 = [8, 8, 0, 0];

/// $C3E230
immutable short[8] UnknownC3E230 = [0, 1, 1, 1, 0, -1, -1, -1];

/// $C3E240
immutable short[8] UnknownC3E240 = [-1, -1, 0, 1, 1, 1, 0, -1];

/// $C3E250
immutable WindowConfig[53] WindowConfigurationTable = [
	WindowConfig(0x0001, 0x0001, 0x000D, 0x0008),
	WindowConfig(0x000C, 0x0001, 0x0013, 0x0008), // Out-of-battle text
	WindowConfig(0x0007, 0x0001, 0x0018, 0x0010), // Main inventory window
	WindowConfig(0x0001, 0x0001, 0x0006, 0x000A), // Inventory menu
	WindowConfig(0x0001, 0x0003, 0x000B, 0x0006),
	WindowConfig(0x0014, 0x0001, 0x000B, 0x0010), // Phone menu
	WindowConfig(0x0008, 0x0001, 0x0014, 0x000A), // Equip menu
	WindowConfig(0x0012, 0x0001, 0x000D, 0x0010), // Item list for equip menu
	WindowConfig(0x0001, 0x0001, 0x001E, 0x0012), // Status menu
	WindowConfig(0x000C, 0x0001, 0x0013, 0x0012), // Used by status screen?
	WindowConfig(0x0001, 0x000A, 0x0008, 0x0004), // Carried money window
	WindowConfig(0x0001, 0x000F, 0x000B, 0x0004), // Used by status screen?
	WindowConfig(0x000C, 0x0001, 0x0013, 0x0010),
	WindowConfig(0x0007, 0x0001, 0x0018, 0x0010),
	WindowConfig(0x0004, 0x0001, 0x0018, 0x0006), // In-battle text
	WindowConfig(0x0001, 0x0001, 0x0015, 0x0006), // Normal battle menu
	WindowConfig(0x0004, 0x0001, 0x0008, 0x0008),
	WindowConfig(0x000C, 0x0001, 0x000C, 0x0004),
	WindowConfig(0x0001, 0x0001, 0x000E, 0x0006), // Jeff' s Battle menu
	WindowConfig(0x0001, 0x0002, 0x001E, 0x0008), // File Select
	WindowConfig(0x0005, 0x0009, 0x0016, 0x0004), // Overworld Menu
	WindowConfig(0x000A, 0x0010, 0x000C, 0x0008), // Copy Menu (2 choices)
	WindowConfig(0x000A, 0x0010, 0x000C, 0x0006), // Copy Menu (1 choice)
	WindowConfig(0x0006, 0x0011, 0x0015, 0x000A), // Delete confirmation
	WindowConfig(0x0003, 0x000E, 0x0010, 0x000A), // Text Speed
	WindowConfig(0x0008, 0x000F, 0x0012, 0x0008), // Music Mode
	WindowConfig(0x0005, 0x0004, 0x0008, 0x0004), // Naming Box
	WindowConfig(0x000D, 0x0004, 0x0011, 0x0004), // "Name This Friend"
	WindowConfig(0x0001, 0x0009, 0x001E, 0x0010), // Name input box
	WindowConfig(0x0007, 0x0003, 0x0007, 0x0004), // Ness's Name
	WindowConfig(0x0007, 0x0007, 0x0007, 0x0004), // Paula's Name
	WindowConfig(0x0007, 0x000B, 0x0007, 0x0004), // Jeff's Name
	WindowConfig(0x0007, 0x000F, 0x0007, 0x0004), // Poo's Name
	WindowConfig(0x0014, 0x0003, 0x0008, 0x0004), // King's Name
	WindowConfig(0x000F, 0x0007, 0x000D, 0x0006), // Favourite Food
	WindowConfig(0x000F, 0x000D, 0x000D, 0x0006), // Favourite Thing
	WindowConfig(0x0004, 0x0015, 0x0018, 0x0004), // "Are you sure?"
	WindowConfig(0x0012, 0x0006, 0x000D, 0x0008),
	WindowConfig(0x000C, 0x0001, 0x000C, 0x0004),
	WindowConfig(0x0003, 0x0003, 0x001A, 0x0006),
	WindowConfig(0x0001, 0x0001, 0x0007, 0x0004),
	WindowConfig(0x0010, 0x0008, 0x000F, 0x0004),
	WindowConfig(0x000A, 0x0008, 0x0015, 0x0004),
	WindowConfig(0x0004, 0x0008, 0x001B, 0x0004),
	WindowConfig(0x0008, 0x0002, 0x0018, 0x0010),
	WindowConfig(0x0003, 0x000B, 0x000F, 0x0006),
	WindowConfig(0x0004, 0x0001, 0x0008, 0x000A),
	WindowConfig(0x0001, 0x0009, 0x001E, 0x000A),
	WindowConfig(0x0001, 0x0001, 0x001C, 0x0006),
	WindowConfig(0x000A, 0x0004, 0x0014, 0x0004),
	WindowConfig(0x000E, 0x000B, 0x000F, 0x0010), // File select: flavour selection
	WindowConfig(0x0016, 0x0008, 0x0009, 0x0004),
	WindowConfig(0x0007, 0x0009, 0x0012, 0x0012),
];

/// $C3E3F8
immutable ubyte[14] UnknownC3E3F8 = [0x08, 0x09, 0x18, 0x19, 0x0A, 0x09, 0x1A, 0x19, 0x15, 0x24, 0x16, 0x24, 0x15, 0x64];

/// $C3E406
immutable ushort[2] arrC3E406 = [ 0x2441, 0x268D ];

/// $C3E40A
immutable ushort[2] arrC3E40A = [ 0x2451, 0x269D ];

/// $C3E40E
immutable ushort[4] UnknownC3E40E = [ 0x3A69, 0x3A6A, 0x3A6B, 0x3A6C ];

/// $C3E416
immutable ushort[3] BlinkingTriangleTiles = [ 0x3C14, 0x3C15, 0xBC11 ];

/// $C3E43C
immutable ushort[][4] UnknownC3E41CPointerTable = [
	[0x3C16, 0x2E6D, 0x2E6E, 0x7C16],
	[0x3C16, 0x2E7D, 0x2E7E, 0x7C16],
	[0x3C16, 0x2E6D, 0x2C40, 0x7C16],
	[0x3C16, 0x2C40, 0x2E6E, 0x7C16],
];

/// $C3E44C
immutable ubyte[4] UnknownC3E44C = EBString!4("そのた"); //tx6 in EB

/// $C3E450
void UnknownC3E450() {
	const(RGB)* x06;
	if ((Unknown7E0002 & 4) != 0) {
		x06 = &TextWindowFlavourPalettes[TextWindowProperties[gameState.textFlavour].offset / 0x40][4];
	} else {
		x06 = &TextWindowFlavourPalettes[TextWindowProperties[gameState.textFlavour].offset / 0x40][20];
	}
	memcpy(&palettes[1][4], x06, 8);
	Unknown7E0030 = 0x18;
}

/// $C3E4CA - Clear the instant text print flag
void ClearInstantPrinting() {
	InstantPrinting = 0;
}

/// $C3E4D4 - Set the instant text print flag
void SetInstantPrinting() {
	InstantPrinting = 1;
}

/// $C3E4E0
void WindowTickWithoutInstantPrinting() {
	ClearInstantPrinting();
	WindowTick();
	SetInstantPrinting();
}

/// $C3E4EF
short UnknownC3E4EF() {
	for (short i = 0; i != 8; i++) {
		if (WindowStats[i].window_id == -1) {
			return i;
		}
	}
	return -1;
}

/// $C3E521
void CloseWindow(short arg1) {
	if (arg1 == -1) {
		return;
	}
	if (WindowTable[arg1] == -1) {
		return;
	}
	if (CurrentFocusWindow == arg1) {
		CurrentFocusWindow = -1;
	}
	UnknownC3E7E3(arg1);
	short x14 = WindowStats[WindowTable[arg1]].next;
	short x12 = WindowStats[WindowTable[arg1]].prev;
	if (x14 == -1) {
		window_tail = x12;
	} else {
		WindowStats[x14].prev = x12;
	}
	if (x12 == -1) {
		window_head = x14;
	} else {
		WindowStats[x12].next = x14;
	}
	WindowStats[WindowTable[arg1]].window_id = -1;
	short x10 = WindowTable[arg1];
	WindowTable[arg1] = -1;
	ushort* x0E = &bg2Buffer[WindowStats[x10].y * 32 + WindowStats[x10].x];
	ushort* x14_2 = WindowStats[x10].tilemapBuffer;
	for (short i = 0; i < WindowStats[x10].width * WindowStats[x10].height; i++) {
		// Wack vanilla code.. the body of this if statement always runs
		/+ if ((x14_2[0] != 0x40) || (x14_2[0] != 0)) { +/
			// Deallocate VWF tiles
			FreeTile(x14_2[0]);
		/+ } +/
		x14_2[0] = 0x40;
		x14_2++;
	}
	for (short i = 0; i != WindowStats[x10].height + 2; i++) {
		for (short j = 0; j != WindowStats[x10].width + 2; j++) {
			*(x0E++) = 0;
		}
		x0E += 32 - WindowStats[x10].width - 2;
	}
	UnknownC45E96();
	if (WindowStats[x10].title_id != 0) {
		Unknown7E894E[WindowStats[x10].title_id - 1] = -1;
	}
	WindowStats[x10].title_id = 0;
	Unknown7E9623 = 1;
	if (Unknown7E5E7A == arg1) {
		Unknown7E5E7A = -1;
	}
	if (Unknown7E5E70 == 0) {
		WindowTickWithoutInstantPrinting();
		ClearInstantPrinting();
	}
	Unknown7E5E75 = 0;
}

/// $C3E6F8
void UnknownC3E6F8() {
	if (BattleMenuCurrentCharacterID == -1) {
		return;
	}
	WaitUntilNextFrame();

	ushort* y = &Unknown7E827E[0x10 - (BattleMenuCurrentCharacterID * 7) + (gameState.playerControlledPartyMemberCount * 7) / 2];
	for (short i = 7; i != 0; i--) {
		*y = 0;
		y++;
	}
	BattleMenuCurrentCharacterID = -1;
	Unknown7E9623 = 1;
}

/// $C3E75D
void UnknownC3E75D(short arg1) {
	short a;
	if (arg1 == 0) {
		if (Unknown7E9658 == -1) {
			Unknown7E5E77 = 0;
			return;
		}
		if (Unknown7E5E77 == 0) {
			return;
		}
		a = Unknown7E9658;
	} else {
		if (Unknown7E965A == -1) {
			Unknown7E5E78 = 0;
			return;
		}
		if (Unknown7E5E78 == 0) {
			return;
		}
		a = Unknown7E965A;
	}
	if (EnemyConfigurationTable[a].theFlag != 0) {
		if (Unknown7E5E76 == EBChar('@')) {
			UnknownC447FB(4, &Thethe[0][0]);
		} else {
			UnknownC447FB(4, &Thethe[1][0]);
		}
	}
}

/// $C3E7E3
void UnknownC3E7E3(short arg1) {
	if (arg1 == -1) {
		return;
	}
	if (WindowStats[WindowTable[arg1]].current_option == -1) {
		return;
	}
	MenuOpt* x = &MenuOptions[WindowStats[WindowTable[arg1]].current_option];
	while (true) {
		x.field00 = 0;
		if (x.next == -1) {
			break;
		}
		x++;
	}
	WindowStats[WindowTable[arg1]].selected_option = -1;
	WindowStats[WindowTable[arg1]].option_count = -1;
	WindowStats[WindowTable[arg1]].current_option = -1;
	WindowStats[WindowTable[arg1]].menu_columns = 1;
	WindowStats[WindowTable[arg1]].menu_page = 1;
}

/// $C3E84E
immutable ushort[10] UnknownC3E84E = [ 0x0130, 0x0131, 0x0132, 0x0133, 0x0134, 0x0135, 0x0136, 0x0137, 0x0138, 0x0000 ];

/// $C3E862
immutable ushort[9] UnknownC3E862 = [ 0x0140, 0x0141, 0x0142, 0x0143, 0x0144, 0x0145, 0x0146, 0x0147, 0x0148 ];

/// $C3E874
immutable ubyte[10][24] DebugMenuText = [
	EBString!10("Flag"),
	EBString!10("Goods"),
	EBString!10("Save"),
	EBString!10("Apple"),
	EBString!10("Banana"),
	EBString!10("TV"),
	EBString!10("Event"),
	EBString!10("Warp"),
	EBString!10("Tea"),
	EBString!10("テレポ"), //Teleport
	EBString!10("スターα"), //Star α
	EBString!10("スターβ"), //Star β
	EBString!10("プレーヤー0"), //Player 0
	EBString!10("プレーヤー1"), //Player 1
	EBString!10("GUIDE"),
	EBString!10("TRACK"),
	EBString!10("CAST"),
	EBString!10("STONE"),
	EBString!10("STAFF"),
	EBString!10("メーター"), //Meter
	EBString!10("REPLAY"),
	EBString!10("TEST1"),
	EBString!10("TEST2"),
	EBString!10(""),
];

/// $C3E964
immutable CommandWindowSpacing[6] DebugMenuElementSpacingData = [
	CommandWindowSpacing(0x00, 0x00),
	CommandWindowSpacing(0x06, 0x00),
	CommandWindowSpacing(0x00, 0x01),
	CommandWindowSpacing(0x06, 0x01),
	CommandWindowSpacing(0x00, 0x02),
	CommandWindowSpacing(0x06, 0x02),
];

/// $C3E970
immutable ubyte[3] DebugOnText = EBStringz("ON");

/// $C3E973
immutable ubyte[4] DebugOffText = EBStringz("OFF");

/// $C3E977
short GetCharacterItem(short arg1, short arg2) {
	return PartyCharacters[arg1 - 1].items[arg2 - 1];
}

/// $C3E9F7
short UnknownC3E9F7(short arg1, short arg2) {
	arg1--;
	if (PartyCharacters[arg1].equipment[EquipmentSlot.Weapon] != 0) {
		if (PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Weapon] - 1] == arg2) {
			return 1;
		}
		if (PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Body] - 1] == arg2) {
			return 1;
		}
		if (PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Arms] - 1] == arg2) {
			return 1;
		}
		if (PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Other] - 1] == arg2) {
			return 1;
		}
	}
	return 0;
}

/// $C3E9A0
short CheckItemEquipped(short arg1, short arg2) {
	if (PartyCharacters[arg1 - 1].equipment[0] == arg2) {
		return 1;
	}
	if (PartyCharacters[arg1 - 1].equipment[1] == arg2) {
		return 1;
	}
	if (PartyCharacters[arg1 - 1].equipment[2] == arg2) {
		return 1;
	}
	if (PartyCharacters[arg1 - 1].equipment[3] == arg2) {
		return 1;
	}
	return 0;
}

/// $C3EAD0
void UnknownC3EAD0(short arg1) {
	for (short i = 0; TimedItemTransformationTable[i].item != 0; i++) {
		if (arg1 != TimedItemTransformationTable[i].item) {
			continue;
		}
		if (IsValidItemTransformation(i) != 0) {
			return;
		}
		InitializeItemTransformation(i);
		return;
	}
}

/// $C3EB1C
void UnknownC3EB1C(short arg1) {
	short x14 = 0;
	for (; (TimedItemTransformationTable[x14].sfx != 0) && (TimedItemTransformationTable[x14].item != arg1); x14++) {}
	UnknownC48F98(x14);
	for (short x12 = 0; x12 < gameState.playerControlledPartyMemberCount; x12++) {
		for (short x10 = 0; (x10 < 14) && (PartyCharacters[gameState.partyMembers[x12] - 1].items[x10] != 0); x10++) {
			if (PartyCharacters[gameState.partyMembers[x12] - 1].items[x10] != arg1) {
				InitializeItemTransformation(x14);
				return;
			}
		}
	}
}

/// $C3EBCA
void UnknownC3EBCA() {
	for (short i = 0; TimedItemTransformationTable[i].item != 0; i++) {
		if (FindItemInInventory2(0xFF, TimedItemTransformationTable[i].item) != 0) {
			UnknownC3EAD0(TimedItemTransformationTable[i].item);
		} else {
			UnknownC3EB1C(TimedItemTransformationTable[i].item);
		}
	}
}

/// $C3EC1F
void UnknownC3EC1F(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * PartyCharacters[arg1 - 1].maxHP) / 100);
	}
	PartyCharacters[arg1 - 1].hp.target -= arg2;
	if (PartyCharacters[arg1 - 1].hp.target > PartyCharacters[arg1 - 1].maxHP) {
		PartyCharacters[arg1 - 1].hp.target = 0;
	}
}

/// $C3EC8B
void UnknownC3EC8B(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * PartyCharacters[arg1 - 1].maxHP) / 100);
	}
	PartyCharacters[arg1 - 1].hp.target += arg2;
	if (PartyCharacters[arg1 - 1].hp.current.integer == 0) {
		PartyCharacters[arg1 - 1].hp.current.integer = 1;
	}
	if (PartyCharacters[arg1 - 1].hp.target > PartyCharacters[arg1 - 1].maxHP) {
		PartyCharacters[arg1 - 1].hp.target = PartyCharacters[arg1 - 1].maxHP;
	}
}

/// $C3ED2C
void UnknownC3ED2C(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * PartyCharacters[arg1 - 1].maxPP) / 100);
	}
	PartyCharacters[arg1 - 1].pp.target -= arg2;
	if (PartyCharacters[arg1 - 1].pp.target > PartyCharacters[arg1 - 1].maxPP) {
		PartyCharacters[arg1 - 1].pp.target = 0;
	}
}

/// $C3ED98
void UnknownC3ED98(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * PartyCharacters[arg1 - 1].maxPP) / 100);
	}
	PartyCharacters[arg1 - 1].pp.target += arg2;
	if (PartyCharacters[arg1 - 1].pp.target > PartyCharacters[arg1 - 1].maxPP) {
		PartyCharacters[arg1 - 1].pp.target = PartyCharacters[arg1 - 1].maxPP;
	}
}

/// $C3EE14
short UnknownC3EE14(short arg1, short arg2) {
	if ((ItemData[arg2].flags & ItemUsableFlags[arg1]) != 0) {
		return 1;
	} else {
		return 0;
	}
}

/// $C3EE4D
void UnknownC3EE4D() {
	UpdateParty();
	UnknownC07B52();
	UnknownC1004E();
	UnknownC0943C();
	if (Unknown7EB4A8 == -1) {
		return;
	}
	EntityTickCallbackFlags[Unknown7EB4A8] &= 0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
}

/// $C3EE7A
WorkingMemory UnknownC3EE7A(short arg1) {
	WorkingMemory result;
	if ((CC1C01Table[arg1].size & 0x80) != 0) {
		switch (CC1C01Table[arg1].size & 0x7F) {
			case 1:
				result.integer = *cast(ubyte*)CC1C01Table[arg1].address;
				break;
			case 2:
				result.integer = *cast(ushort*)CC1C01Table[arg1].address;
				break;
			default:
				result.integer = *cast(uint*)CC1C01Table[arg1].address;
				break;
		}
	} else {
		result.pointer = cast(void*)CC1C01Table[arg1].address;
	}
	return result;
}

/// $C3EF23
void NullC3EF23(short) {
	//do nothing
}

/// $C3F054
immutable FontConfig[5] FontConfigTable = [
	FontConfig(cast(immutable(ubyte[]))import("fonts/main.bin"), cast(immutable(ubyte[]))import("fonts/main.gfx"), 32, 16), //main font
	FontConfig(cast(immutable(ubyte[]))import("fonts/mrsaturn.bin"), cast(immutable(ubyte[]))import("fonts/mrsaturn.gfx"), 32, 16), //mr saturn font
	FontConfig(cast(immutable(ubyte[]))import("fonts/battle.bin"), cast(immutable(ubyte[]))import("fonts/battle.gfx"), 16, 16), //battle font
	FontConfig(cast(immutable(ubyte[]))import("fonts/tiny.bin"), cast(immutable(ubyte[]))import("fonts/tiny.gfx"), 8, 8), //tiny font
	FontConfig(cast(immutable(ubyte[]))import("fonts/large.bin"), cast(immutable(ubyte[]))import("fonts/large.gfx"), 32, 16), //large font
];

/// $C3F112
immutable ubyte[2][5] PSISuffixes = [
	EBString!2("~"),
	EBString!2("^"),
	EBString!2("["),
	EBString!2("]"),
	EBString!2("#"),
];

/// $C3F11C
immutable ubyte[8] PPCostText = EBString("PP Cost:");

/// $C3F124
immutable ubyte[20][5][2] PSITargetText = [
	[
		EBString!20("To enemy"),
		EBString!20("To one enemy"),
		EBString!20("to One Enemy"),
		EBString!20("To row of foes"),
		EBString!20("To all enemies"),
	], [
		EBString!20("himself"),
		EBString!20("To one of us"),
		EBString!20("to One Friend"),
		EBString!20("To all of us"),
		EBString!20("To all of us"),
	]
];

/// $C3F1EC
short UnknownC3F1EC(short arg1) {
	if (UnknownC2239D(3) == 0) {
		return 0;
	}
	for (short i = 0; (i < 14) && (PartyCharacters[3].items[i] != 0); i++) {
		short x0E = PartyCharacters[3].items[i];
		if (ItemData[x0E].type != 8) {
			continue;
		}
		if (ItemData[x0E].parameters.epi > PartyCharacters[3].iq) {
			continue;
		}
		if (randMod(99) >= arg1) {
			continue;
		}
		PartyCharacters[3].items[i] = ItemData[x0E].parameters.ep;
		return x0E;
	}
	return 0;
}

/// $C3F2B1
immutable ubyte[4] UnknownC3F2B1 = [8, 4, 4, 4];

/// $C3F2B5
immutable ushort[8][17] PartyCharacterGraphicsTable = [
	[
		OverworldSprite.Ness,
		OverworldSprite.NessAngel,
		OverworldSprite.NessClimbingUp,
		OverworldSprite.NessClimbingDown,
		OverworldSprite.LilNess,
		OverworldSprite.LilAngel,
		OverworldSprite.NessRobot,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Paula,
		OverworldSprite.PaulaAngel,
		OverworldSprite.PaulaClimbingUp,
		OverworldSprite.PaulaClimbingDown,
		OverworldSprite.LilPaula,
		OverworldSprite.LilAngel,
		OverworldSprite.Robot,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Jeff,
		OverworldSprite.JeffAngel,
		OverworldSprite.JeffClimbingUp,
		OverworldSprite.JeffClimbingDown,
		OverworldSprite.LilJeff,
		OverworldSprite.LilAngel,
		OverworldSprite.Robot,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Poo,
		OverworldSprite.PooAngel,
		OverworldSprite.PooClimbingUp,
		OverworldSprite.PooClimbingDown,
		OverworldSprite.LilPoo,
		OverworldSprite.LilAngel,
		OverworldSprite.Robot,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.King,
		OverworldSprite.King,
		OverworldSprite.KingClimbingUp,
		OverworldSprite.KingClimbingDown,
		OverworldSprite.King,
		OverworldSprite.King,
		OverworldSprite.King,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkeyClimbingUp,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.LilTeddyBear,
		OverworldSprite.LilTeddyBear,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.LilTeddyBear,
		OverworldSprite.LilTeddyBear,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.Invalid,
	]
];

/// $C3F3C5
short ShowTitleScreen(short arg1) {
	Unknown7E9F75 = arg1;
	short x04 = 0;
	PrepareForImmediateDMA();
	UnknownC0927C();
	if (0) { //interesting... this is unreachable and the entry statement seems to have been optimized out, but the body, condition and post-body statement remain
		for (short i = 0; i < 30; i++) {
			EntitySpriteMapFlags[i] |= 0x8000;
		}
	}
	UnknownC08D79(11);
	SetOAMSize(3);
	SetBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
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
	UnknownC0EBE0();
	TM_MIRROR = 0x11;
	OAMClear();
	InitEntityWipe(ActionScript.TitleScreen1, 0, 0);
	Unknown7E9641 = 0;
	if (Unknown7E9F75 == 0) {
		memset(&palettes[0][0], 0, 0x200);
		Unknown7E0030 = 0x18;
		SetForceBlank();
		INIDISP_MIRROR = 0xF;
		WaitUntilNextFrame();
		Unknown7E0030 = 0;
		Decomp(&UnknownE1AE7C[0], &palettes[8][0]);
		UnknownC496F9();
		memset(&palettes[0][0], 0, 0x200);
		UnknownC496E7(0x3C, 0x100);
		Unknown7E0030 = 0x18;
		for (short i = 0; 0x3C > i; i++) {
			UpdateMapPaletteAnimation();
			UnknownC1004E();
		}
	} else {
		FadeIn(4, 1);
		for (short i = 0; 0x3C > i; i++) {
			UnknownC1004E();
		}
	}
	short x02 = 0;
	while ((Unknown7E9641 == 0) || (Unknown7E9641 == 2)) {
		if (x04 == 0) {
			if (((pad_press[0] & PAD_A) != 0) || ((pad_press[0] & PAD_B) != 0) || ((pad_press[0] & PAD_START) != 0)) {
				x02 = 1;
				break;
			}
		}
		UnknownC1004E();
	}
	if ((Unknown7E9F75 == 0) && (Unknown7E9641 == 0)) {
		x02 = UnknownEF04DC();
	}
	FadeOutWithMosaic(1, 4, 0);
	if (x04 == 0) {
		Unknown7E9641 = 0;
		UnknownC474A8(/+0+/);
		UnknownC0927C();
		return x02;
	}
	for (short i = 0; i < 0x1E; i++) {
		if ((EntityScriptTable[i] >= ActionScript.TitleScreen1) && (EntityScriptTable[i] <= ActionScript.TitleScreen11)) {
			UnknownC09C35(i);
		}
		EntitySpriteMapFlags[i] &= 0x7FFF;
	}
	PrepareForImmediateDMA();
	ReloadMap();
	UndrawFlyoverText();
	TM_MIRROR = 0x17;
	FadeIn(1, 1);
	//the original code may not have had an explicit return, but this is what effectively happens
	return 1;
}

/// $C3F5F9
void UnknownC3F5F9() {
	short x04 = 0;
	short x16 = Unknown7E9F7E;
	for (short i = 0; i < Unknown7E9F80; i++) {
		short x12 = cast(short)(Unknown7E9F7C + Unknown7E9F84 + (Unknown7E9F7A & 0x1F));
		CopyToVram(0, x16, x12, cast(ubyte*)&Unknown7E9F86[x04]);
		x04 += Unknown7E9F82;
		if (++Unknown7E9F7C == 0x20) {
			Unknown7E9F7C = 0;
		}
	}
}

/// $C3F705
void UnknownC3F705(short arg1, short arg2, ushort* arg3) {
	Unknown7E9F86 = &arg3[1];
	short x12 = arg1 & 0x3F;
	Unknown7E9F7A = x12;
	short x10 = arg2 & 0x1F;
	Unknown7E9F7C = x10;
	Unknown7E9F84 = ((x12 & 0x1F) != 0) ? 0x3C00 : 0x3800;
	short x18 = arg3[0] >> 8;
	Unknown7E9F7E = x18;
	Unknown7E9F80 = arg3[0] & 0xFF;
	if ((x12 & 0xFFE0) == ((x12 + x18) & 0xFFE0)) {
		Unknown7E9F82 = x18;
		UnknownC3F5F9();
	} else {
		do {
			Unknown7E9F7E = cast(short)(((x18 + x12) & 0xFFE0) - Unknown7E9F7A);
			Unknown7E9F82 = x18;
			UnknownC3F5F9();
			Unknown7E9F84 ^= 0x400;
			Unknown7E9F86 = &Unknown7E9F86[Unknown7E9F7E];
			Unknown7E9F7A = 0;
			Unknown7E9F7C = x10;
			x18 -= Unknown7E9F7E;
		} while (x18 >= 0x20);
		Unknown7E9F7E = x18;
		Unknown7E9F82 = x18;
		UnknownC3F5F9();
	}
}

/// $C3F819
immutable(Unknown7EAECCEntry)[4] UnknownC3F819 = [
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x9800, 0x7F00, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF38, 0xFF50, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0x00, 0x00, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
];

/// $C3F871
immutable ushort[32] UnknownC3F871 = [
	0x0000,
	0x0080,
	0x0100,
	0x0180,

	0x0800,
	0x0880,
	0x0900,
	0x0980,
	0x1000,
	0x1080,
	0x1100,
	0x1180,

	0x1800,
	0x1880,
	0x1900,
	0x1980,
	0x2000,
	0x2080,
	0x2100,
	0x2180,

	0x2800,
	0x2880,
	0x2900,
	0x2980,
	0x3000,
	0x3080,
	0x3100,
	0x3180,

	0x3800,
	0x3880,
	0x3900,
	0x3980,
];

/// $C3F8B1
immutable ushort[32] UnknownC3F8B1 = [
	0x0000,
	0x0004,
	0x0008,
	0x000C,

	0x0040,
	0x0044,
	0x0048,
	0x004C,

	0x0080,
	0x0084,
	0x0088,
	0x008C,

	0x00C0,
	0x00C4,
	0x00C8,
	0x00CC,

	0x0100,
	0x0104,
	0x0108,
	0x010C,

	0x0140,
	0x0144,
	0x0148,
	0x014C,

	0x0180,
	0x0184,
	0x0188,
	0x018C,
	0x01C0,
	0x01C4,
	0x01C8,
	0x01CC,
];

/// $C3F8F1
immutable RGB[16][3] UnknownC3F8F1 = [
	[
		RGB(0, 0, 0),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(15, 13, 13),
	], [
		RGB(0, 0, 0),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 3, 11),
	], [
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(15, 13, 13),
	]
];

/// $C3F951
immutable ubyte[3][11] UnknownC3F951 = [
	[31, 0, 0],
	[18, 6, 0],
	[16, 6, 0],
	[0, 0, 10],
	[29, 29, 29],
	[0, 0, 31],
	[26, 14, 14],
	[0, 10, 4],
	[18, 18, 18],
	[18, 18, 31],
	[31, 31, 11],
];

/// $C3F951
immutable ubyte[3][5] UnknownC3F972 = [
	[15, 15, 15],
	[15, 15, 0],
	[15, 7, 15],
	[0, 0, 15],
	[31, 0, 12],
];

/// $C3F981
void UnknownC3F981(short arg1) {
	if (arg1 < 35) {
		ShowPSIAnimation(arg1);
		return;
	}
	if (arg1 < 46) {
		UnknownC2DE0F();
		SetColData(UnknownC3F951[arg1 - 35][0], UnknownC3F951[arg1 - 35][1], UnknownC3F951[arg1 - 35][2]);
		SetColourAddSubMode(0x10, 0x3F);
		UnknownC4A67E(5, 7);
	} else if (arg1 < 49) {
		switch (arg1 + 1) {
			case 47:
				WobbleDuration = 144;
				break;
			case 48:
				ShakeDuration = 300;
				break;
			case 49:
			default:
				break;
		}
	} else if (arg1 < 54) {
		UnknownC2DE0F();
		SetColData(UnknownC3F972[arg1 - 49][0], UnknownC3F972[arg1 - 49][1], UnknownC3F972[arg1 - 49][2]);
		SetColourAddSubMode(0x10, 0x3F);
		if (arg1 < 53) {
			UnknownC4A67E(4, 5);
		} else {
			UnknownC4A67E(2, 4);
		}
	}
}

/// $C3FB09
short UnknownC3FB09() {
	if (currentAttacker.allyOrEnemy == 0) {
		return 0;
	}
	return 1;
}

/// $C3FB2B
immutable ubyte[26] NameRegistryRequestString = EBString!26("Register your name, please");

/// $C3FB45
immutable ubyte[10][26] UnknownC3FB45 = [
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0xAA, 0x00, 0x6A, 0x00, 0x7A, 0x00, 0x8A, 0x00, 0x9A, 0x00],
	[0x62, 0x00, 0x74, 0x00, 0x82, 0x00, 0x94, 0x00, 0xA2, 0x00],
	[0x97, 0x00, 0x97, 0x71, 0x97, 0x8E, 0xA7, 0x00, 0x67, 0x00],
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0x89, 0x61, 0x89, 0x71, 0x89, 0x00, 0x89, 0x91, 0x89, 0xA1],
	[0x93, 0x00, 0xA3, 0x00, 0x63, 0x00, 0x73, 0x00, 0x83, 0x00],
	[0x89, 0x00, 0x89, 0x00, 0x89, 0x00, 0x89, 0x00, 0x89, 0x00],
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0x75, 0x6E, 0x75, 0x00, 0x75, 0x8E, 0x75, 0x91, 0x75, 0xAE],
	[0x63, 0x00, 0x73, 0x00, 0x83, 0x00, 0x93, 0x00, 0xA3, 0x00],
	[0x7F, 0x00, 0x8F, 0x00, 0x9F, 0x00, 0xAF, 0x00, 0x6F, 0x00],
	[0xAC, 0x00, 0x9C, 0x00, 0x9C, 0x00, 0xAC, 0x00, 0x9C, 0x00],
	[0x6C, 0x00, 0x7C, 0x00, 0x8C, 0x00, 0x9C, 0x00, 0xAC, 0x00],
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0x6B, 0x00, 0x7B, 0x00, 0x8B, 0x00, 0x9B, 0x00, 0xAB, 0x00],
	[0x82, 0x61, 0x82, 0x71, 0x82, 0x81, 0x82, 0x91, 0x82, 0xA1],
	[0x9F, 0x00, 0x9F, 0x00, 0x9F, 0x00, 0x9F, 0x00, 0x9F, 0x00],
	[0x94, 0x00, 0xA4, 0x00, 0x64, 0x00, 0x74, 0x00, 0x84, 0x00],
	[0x96, 0x00, 0x96, 0x71, 0xA6, 0x81, 0x96, 0x71, 0x66, 0x81],
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0x6A, 0x00, 0x7A, 0x00, 0x8A, 0x00, 0x9A, 0x00, 0xAA, 0x00],
	[0x80, 0x71, 0x80, 0x71, 0x80, 0x00, 0x80, 0x91, 0x80, 0x71],
	[0x65, 0x00, 0x85, 0x71, 0x85, 0x00, 0x95, 0x00, 0xA5, 0x00],
	[0x7D, 0x00, 0x70, 0x00, 0x80, 0x00, 0x70, 0x91, 0x9E, 0x00],
	[0xA5, 0x00, 0x65, 0x00, 0x75, 0x00, 0x85, 0x00, 0x95, 0x00],
];

/// $C3FAC9
short UnknownC3FAC9(short arg1, short arg2) {
	if (currentTarget.npcID == EnemyID.TinyLilGhost) {
		return 1;
	}
	if (currentTarget.allyOrEnemy == 0) {
		UnknownC3F981(arg1);
		return 0;
	}
	UnknownC3F981(arg2);
	return 1;
}

/// $C3FB1F
immutable uint[3] UnknownC3FB1F = [
	0x12000,
	0x11800,
	0x11000,
];

/// $C3FD2D
immutable NamingScreenEntity[][14] UnknownC3FD2D = [
	[
		NamingScreenEntity(OverworldSprite.Ness, ActionScript.Unknown502),
		NamingScreenEntity(OverworldSprite.NessPosing, ActionScript.Unknown503),
		NamingScreenEntity(OverworldSprite.NESS_SURPRISED, ActionScript.Unknown504),
		NamingScreenEntity(OverworldSprite.SMALL_SHADOW, ActionScript.Unknown505),
		NamingScreenEntity(OverworldSprite.SURPRISE_MARK, ActionScript.Unknown506),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Paula, ActionScript.Unknown507),
		NamingScreenEntity(OverworldSprite.PAULA_SURPRISED, ActionScript.Unknown508),
		NamingScreenEntity(OverworldSprite.SMALL_SHADOW, ActionScript.Unknown509),
		NamingScreenEntity(OverworldSprite.MUSIC_NOTES, ActionScript.Unknown510),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Jeff, ActionScript.Unknown511),
		NamingScreenEntity(OverworldSprite.SURPRISE_MARK, ActionScript.Unknown512),
		NamingScreenEntity(OverworldSprite.Sweat, ActionScript.Unknown513),
		NamingScreenEntity(OverworldSprite.LIGHT_BULB, ActionScript.Unknown514),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Poo, ActionScript.Unknown515),
		NamingScreenEntity(OverworldSprite.POO_MEDITATING, ActionScript.Unknown516),
		NamingScreenEntity(OverworldSprite.PooClimbingUp, ActionScript.Unknown517),
		NamingScreenEntity(OverworldSprite.STAR_MASTERS_POOF_CLOUD, ActionScript.Unknown518),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.King, ActionScript.Unknown521),
		NamingScreenEntity(OverworldSprite.NessDogSleeping, ActionScript.Unknown522),
		NamingScreenEntity(OverworldSprite.Ness, ActionScript.Unknown520),
		NamingScreenEntity(OverworldSprite.ZZZ, ActionScript.Unknown523),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.FRENCH_KISS_OF_DEATH, ActionScript.Unknown524),
		NamingScreenEntity(OverworldSprite.A_PLATE, ActionScript.Unknown526),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.FRENCH_KISS_OF_DEATH, ActionScript.Unknown528),
		NamingScreenEntity(OverworldSprite.TWINKLING_STARS, ActionScript.Unknown530),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Ness, ActionScript.Unknown532),
		NamingScreenEntity(OverworldSprite.NessPosing, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.NESS_SURPRISED, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.SMALL_SHADOW, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.SURPRISE_MARK, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Paula, ActionScript.Unknown532),
		NamingScreenEntity(OverworldSprite.PAULA_SURPRISED, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.SMALL_SHADOW, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.MUSIC_NOTES, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Jeff, ActionScript.Unknown532),
		NamingScreenEntity(OverworldSprite.SURPRISE_MARK, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.Sweat, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.LIGHT_BULB, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Poo, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.POO_MEDITATING, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.PooClimbingUp, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.STAR_MASTERS_POOF_CLOUD, ActionScript.Unknown519),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.King, ActionScript.Unknown533),
		NamingScreenEntity(OverworldSprite.NessDogSleeping, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.Ness, ActionScript.Unknown532),
		NamingScreenEntity(OverworldSprite.ZZZ, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.FRENCH_KISS_OF_DEATH, ActionScript.Unknown525),
		NamingScreenEntity(OverworldSprite.A_PLATE, ActionScript.Unknown527),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.FRENCH_KISS_OF_DEATH, ActionScript.Unknown529),
		NamingScreenEntity(OverworldSprite.TWINKLING_STARS, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	]
];

/// $C3FD65
immutable FileSelectSummarySpriteConfigEntry[5] FileSelectSummarySpriteConfig = [
	FileSelectSummarySpriteConfigEntry(OverworldSprite.Ness, ActionScript.Unknown861, 40, 44),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.Paula, ActionScript.Unknown861, 40, 76),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.Jeff, ActionScript.Unknown861, 40, 108),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.Poo, ActionScript.Unknown861, 40, 140),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.NessDogSleeping, ActionScript.Unknown534, 136, 40)
];

/// $C3FD8D
immutable ubyte[][10] AttractModeText = [
	TextAttractMode0,
	TextAttractMode1,
	TextAttractMode2,
	TextAttractMode3,
	TextAttractMode4,
	TextAttractMode5,
	TextAttractMode6,
	TextAttractMode7,
	TextAttractMode8,
	TextAttractMode9,
];

/// $C3FDBD
immutable ushort[4] UnusedForSaleSignSpriteTable = [
	OverworldSprite.GuyInBlueClothes,
	OverworldSprite.JamaicanGuy,
	OverworldSprite.MrT,
	OverworldSprite.OldGuyWithCane,
];

/// $C3FDB5
immutable ushort[4] UnknownC3FDB5 = [
	0x180,
	0x190,
	0x1A0,
	0x1B0,
];

/// $C3FDC5
short UnknownC3FDC5() {
	//nope. not doing this one, sorry
	return 0;
}
