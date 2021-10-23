module earthbound.bank03;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank04;
import earthbound.bank15;
import earthbound.bank18;
import earthbound.globals;

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

// $C3E12C
immutable FixedPoint1616[14] MovementSpeeds = [
	FixedPoint1616(0x6000, 1),
	FixedPoint1616(0x6000, 1),
	FixedPoint1616(0x6000, 1),
	FixedPoint1616(0xCCCC, 1),
	FixedPoint1616(0x0000, 1),
	FixedPoint1616(0x0000, 0),
	FixedPoint1616(0x0000, 1),
	FixedPoint1616(0xCCCC, 0),
	FixedPoint1616(0xCCCC, 0),
	FixedPoint1616(0x0000, 0),
	FixedPoint1616(0x8000, 0),
	FixedPoint1616(0x0000, 0),
	FixedPoint1616(0xCCCC, 0),
	FixedPoint1616(0xCCCC, 0),
];
immutable FixedPoint1616[14] MovementSpeedsDiagonal = [
	FixedPoint1616(0xF8E6, 0),
	FixedPoint1616(0xF8E6, 0),
	FixedPoint1616(0xF8E6, 0),
	FixedPoint1616(0x45D5, 1),
	FixedPoint1616(0xB505, 0),
	FixedPoint1616(0x0000, 0),
	FixedPoint1616(0xB505, 0),
	FixedPoint1616(0x90D0, 0),
	FixedPoint1616(0x90D0, 0),
	FixedPoint1616(0x0000, 0),
	FixedPoint1616(0x5A82, 0),
	FixedPoint1616(0x0000, 0),
	FixedPoint1616(0x90D0, 0),
	FixedPoint1616(0x90D0, 0),
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

// $C3F054
immutable Font[5] FontConfigTable = [
	Font(null, null, 32, 16), //main font
	Font(null, null, 32, 16), //mr saturn font
	Font(null, null, 16, 16), //battle font
	Font(null, null, 8, 8), //tiny font
	Font(null, null, 32, 16), //large font
];

// $C3FDBD
immutable ushort[4] UnusedForSaleSignSpriteTable = [
	OverworldSprite.GuyInBlueClothes,
	OverworldSprite.JamaicanGuy,
	OverworldSprite.MrT,
	OverworldSprite.OldGuyWithCane,
];
