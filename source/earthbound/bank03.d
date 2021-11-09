module earthbound.bank03;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank01;
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

// $C30100
void DisplayAntiPiracyScreen() {
	UnknownC40B51();
	Decomp(&AntiPiracyNoticeGraphics[0], &Unknown7F0000[0]);
	Decomp(&AntiPiracyNoticeArrangement[0], &Unknown7F0000[0x4000]);
	UnknownC40B75();
}

// $C30142
void DisplayFaultyGamepakScreen() {
	UnknownC40B51();
	Decomp(&FaultyGamepakGraphics[0], &Unknown7F0000[0]);
	Decomp(&FaultyGamepakArrangement[0], &Unknown7F0000[0x4000]);
	UnknownC40B75();
}

// $C30186
immutable NessPajamaFlag = EventFlag.NessPajamas;

// $C3E012
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

// $C3E12C
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

// $C3E12C
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

// $C3E3F8
immutable ubyte[22] UnknownC3E3F8 = [0x08, 0x09, 0x18, 0x19, 0x0A, 0x09, 0x1A, 0x19, 0x15, 0x24, 0x16, 0x24, 0x15, 0x64, 0x41, 0x24, 0x8D, 0x26, 0x51, 0x24, 0x9D, 0x26];

immutable ushort[2] arrC3E406 = [ 0x2441, 0x268D ];
immutable ushort[2] arrC3E40A = [ 0x2451, 0x269D ];
immutable ushort[4] UnknownC3E40E = [ 0x3A69, 0x3A6A, 0x3A6B, 0x3A6C ];

// $C3E450
void UnknownC3E450();

// $C3E4CA - Clear the instant text print flag
void ClearInstaprint() {
	Unknown7E9622 = 0;
}

// $C3E4D4 - Set the instant text print flag
void SetInstaprint() {
	Unknown7E9622 = 1;
}

// $C3E521
void CloseWindow(short);

// $C3E6F8
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

// $C3EB1C
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

// $C3EB1C
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

// $C3EBCA
void UnknownC3EBCA() {
	for (short i = 0; TimedItemTransformationTable[i].item != 0; i++) {
		if (FindItemInInventory2(0xFF, TimedItemTransformationTable[i].item) != 0) {
			UnknownC3EAD0(TimedItemTransformationTable[i].item);
		} else {
			UnknownC3EB1C(TimedItemTransformationTable[i].item);
		}
	}
}

// $C3EE14
short UnknownC3EE14(short, short);

// $C3F054
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

// $C3F3C5
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

// $C3F819
immutable(Unknown7EAECCEntry)[4] UnknownC3F819 = [
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x9800, 0x7F00, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF38, 0xFF50, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0x00, 0x00, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
];

// $C3F8F1
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

// $C3FD8D
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

// $C3FDBD
immutable ushort[4] UnusedForSaleSignSpriteTable = [
	OverworldSprite.GuyInBlueClothes,
	OverworldSprite.JamaicanGuy,
	OverworldSprite.MrT,
	OverworldSprite.OldGuyWithCane,
];

// $C3FDC5
void UnknownC3FDC5();
