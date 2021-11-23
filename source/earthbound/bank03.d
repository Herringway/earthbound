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
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.globals;
import core.stdc.string;

//$C30000
immutable ushort[16][8] SpriteGroupPalettes;

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
immutable ubyte[22] UnknownC3E3F8 = [0x08, 0x09, 0x18, 0x19, 0x0A, 0x09, 0x1A, 0x19, 0x15, 0x24, 0x16, 0x24, 0x15, 0x64, 0x41, 0x24, 0x8D, 0x26, 0x51, 0x24, 0x9D, 0x26];

/// $C3E406
immutable ushort[2] arrC3E406 = [ 0x2441, 0x268D ];

/// $C3E40A
immutable ushort[2] arrC3E40A = [ 0x2451, 0x269D ];

/// $C3E40E
immutable ushort[4] UnknownC3E40E = [ 0x3A69, 0x3A6A, 0x3A6B, 0x3A6C ];

/// $C3E416
immutable ushort[3] BlinkingTriangleTiles = [ 0x3C14, 0x3C15, 0xBC11 ];

/// $C3E44C
immutable ubyte[4] UnknownC3E44C = EBString!4("そのた"); //tx6 in EB

/// $C3E450
void UnknownC3E450();

/// $C3E4CA - Clear the instant text print flag
void ClearInstaprint() {
	Unknown7E9622 = 0;
}

/// $C3E4D4 - Set the instant text print flag
void SetInstaprint() {
	Unknown7E9622 = 1;
}

/// $C3E4EF
short UnknownC3E4EF();

/// $C3E521
void CloseWindow(short);

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

/// $C3EB1C
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
	UnknownC48F98(arg1);
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

/// $C3EE14
short UnknownC3EE14(short arg1, short arg2) {
	if ((ItemData[arg2].flags & ItemUsableFlags[arg1]) != 0) {
		return 1;
	} else {
		return 0;
	}
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
	FontConfig(null, null, 32, 16), //main font
	FontConfig(null, null, 32, 16), //mr saturn font
	FontConfig(null, null, 16, 16), //battle font
	FontConfig(null, null, 8, 8), //tiny font
	FontConfig(null, null, 32, 16), //large font
];

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
	UnknownC08726();
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
		UnknownC08744();
		INIDISP_MIRROR = 0xF;
		WaitUntilNextFrame();
		Unknown7E0030 = 0;
		Decomp(&UnknownE1AE7C[0], &palettes[8][0]);
		UnknownC496F9();
		memset(&palettes[0][0], 0, 0x200);
		UnknownC496E7(0x3C, 0x100);
		Unknown7E0030 = 0x18;
		for (short i = 0; 0x3C < i; i++) {
			UnknownC426ED();
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
		UnknownC474A8(0);
		UnknownC0927C();
		return x02;
	}
	for (short i = 0; i < 0x1E; i++) {
		if ((EntityScriptTable[i] >= ActionScript.TitleScreen1) && (EntityScriptTable[i] <= ActionScript.TitleScreen11)) {
			UnknownC09C35(i);
		}
		EntitySpriteMapFlags[i] &= 0x7FFF;
	}
	UnknownC08726();
	ReloadMap();
	UndrawFlyoverText();
	TM_MIRROR = 0x17;
	FadeIn(1, 1);
	//the original code may not have had an explicit return, but this is what effectively happens
	return 1;
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

/// $C3FD8D
immutable ubyte*[10] AttractModeText = [
	null /+TEXT_ATTRACT_MODE_0+/,
	null /+TEXT_ATTRACT_MODE_1+/,
	null /+TEXT_ATTRACT_MODE_2+/,
	null /+TEXT_ATTRACT_MODE_3+/,
	null /+TEXT_ATTRACT_MODE_4+/,
	null /+TEXT_ATTRACT_MODE_5+/,
	null /+TEXT_ATTRACT_MODE_6+/,
	null /+TEXT_ATTRACT_MODE_7+/,
	null /+TEXT_ATTRACT_MODE_8+/,
	null /+TEXT_ATTRACT_MODE_9+/,
];

/// $C3FDBD
immutable ushort[4] UnusedForSaleSignSpriteTable = [
	OverworldSprite.GuyInBlueClothes,
	OverworldSprite.JamaicanGuy,
	OverworldSprite.MrT,
	OverworldSprite.OldGuyWithCane,
];

/// $C3FDC5
void UnknownC3FDC5();
