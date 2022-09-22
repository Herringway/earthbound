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
immutable ushort[16][8] spriteGroupPalettes = [
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
void displayAntiPiracyScreen() {
	unknownC40B51();
	decomp(&antiPiracyNoticeGraphics[0], &unknown7F0000[0]);
	decomp(&antiPiracyNoticeArrangement[0], &unknown7F0000[0x4000]);
	unknownC40B75();
}

/// $C30142
void displayFaultyGamepakScreen() {
	unknownC40B51();
	decomp(&faultyGamepakGraphics[0], &unknown7F0000[0]);
	decomp(&faultyGamepakArrangement[0], &unknown7F0000[0x4000]);
	unknownC40B75();
}

/// $C30186
immutable nessPajamaFlag = EventFlag.nessPajamas;

/// $C3DFE8
immutable ubyte[8] unknownC3DFE8 = [1, 1, 1, 0, 1, 1, 0, 0];

/// $C3DFF0 - unused?
immutable short[17] unknownC3DFF0 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];

/// $C3E012
immutable CharacterInitialEntityDataEntry[17] characterInitialEntityData = [
	CharacterInitialEntityDataEntry(OverworldSprite.ness, OverworldSprite.lilNess, ActionScript.unknown002, 0x0018),
	CharacterInitialEntityDataEntry(OverworldSprite.paula, OverworldSprite.lilPaula, ActionScript.unknown002, 0x0019),
	CharacterInitialEntityDataEntry(OverworldSprite.jeff, OverworldSprite.lilJeff, ActionScript.unknown002, 0x001A),
	CharacterInitialEntityDataEntry(OverworldSprite.poo, OverworldSprite.lilPoo, ActionScript.unknown002, 0x001B),
	CharacterInitialEntityDataEntry(OverworldSprite.pokey, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.picky, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.king, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.tony, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.bubbleMonkey, OverworldSprite.invalid, ActionScript.unknown003, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.dungeonMan, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.teddyBearParty, OverworldSprite.lilTeddyBear, ActionScript.unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.teddyBearParty, OverworldSprite.lilTeddyBear, ActionScript.unknown002, 0x001C),
];

/// $C3E09A
immutable ushort[17] characterSizes = [
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
immutable ushort[] allowedInputDirections = [
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //NORMAL
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //UNKNOWN_01
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //UNKNOWN_02
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //BICYCLE
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //GHOST
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //UNKNOWN_05
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //SLOWER
	DirectionMask.up | DirectionMask.down, //LADDER
	DirectionMask.up | DirectionMask.down, //ROPE
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //UNKNOWN_09
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //SLOWEST
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft, //UNKNOWN_0B
	0, //ESCALATOR
	DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft //STAIRS
];

/// $C3E148
immutable short[8] unknownC3E148 = [0, 0, 10, 0, 0, 0, -10, 0];

/// $C3E158
immutable short[8] unknownC3E158 = [-5, -5, 0, 5, 5, 5, 0, -5];

/// $C3E168
immutable short[8] unknownC3E168 = [Direction.down, Direction.down, Direction.left, Direction.up, Direction.up, Direction.up, Direction.right, Direction.down];

/// $C3E178
immutable short[16][3] mushroomizationDirectionRemapTables = [
	[
		0,
		Pad.down,
		Pad.up,
		Pad.up | Pad.down,
		Pad.left,
		Pad.left | Pad.down,
		Pad.left | Pad.up,
		Pad.left | Pad.up | Pad.down,
		Pad.right,
		Pad.right | Pad.down,
		Pad.right | Pad.up,
		Pad.right | Pad.up | Pad.down,
		Pad.right | Pad.left,
		Pad.right | Pad.left | Pad.down,
		Pad.right | Pad.left | Pad.up,
		Pad.right | Pad.left | Pad.up | Pad.down,
	], [
		0,
		Pad.left,
		Pad.right,
		Pad.right | Pad.left,
		Pad.up,
		Pad.left | Pad.up,
		Pad.right | Pad.up,
		Pad.right | Pad.left | Pad.up,
		Pad.down,
		Pad.left | Pad.down,
		Pad.right | Pad.down,
		Pad.right | Pad.left | Pad.down,
		Pad.up | Pad.down,
		Pad.left | Pad.up | Pad.down,
		Pad.right | Pad.up | Pad.down,
		Pad.right | Pad.left | Pad.up | Pad.down,
	], [
		0,
		Pad.up,
		Pad.down,
		Pad.up | Pad.down,
		Pad.right,
		Pad.right | Pad.up,
		Pad.right | Pad.down,
		Pad.right | Pad.up | Pad.down,
		Pad.left,
		Pad.left | Pad.up,
		Pad.left | Pad.down,
		Pad.left | Pad.up | Pad.down,
		Pad.right | Pad.left,
		Pad.right | Pad.left | Pad.up,
		Pad.right | Pad.left | Pad.down,
		Pad.right | Pad.left | Pad.up | Pad.down,
	]
];

/// $C3E1D8
immutable short[4] unknownC3E1D8 = [4, 0, 2, 6];

/// $C3E1E0
//wonder what this is...?
immutable short[4][4] unknownC3E1E0 = [[0, 0, 4, 0], [0, 0, -4, 0], [-4, 0, 0, 0], [4, 0, 0, 0]];

/// $C3E200
immutable short[4] unknownC3E200 = [7, 1, 5, 3];

/// $C3E208
immutable short[4] unknownC3E208 = [2, 6, 2, 6];

/// $C3E210
immutable short[4] unknownC3E210 = [0, 8, 0, 8];

/// $C3E218
immutable short[4] unknownC3E218 = [0, 0, 8, 8];

/// $C3E220
immutable short[4] unknownC3E220 = [8, 0, 8, 0];

/// $C3E228
immutable short[4] unknownC3E228 = [8, 8, 0, 0];

/// $C3E230
immutable short[8] unknownC3E230 = [0, 1, 1, 1, 0, -1, -1, -1];

/// $C3E240
immutable short[8] unknownC3E240 = [-1, -1, 0, 1, 1, 1, 0, -1];

/// $C3E250
immutable WindowConfig[53] windowConfigurationTable = [
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
immutable ubyte[14] unknownC3E3F8 = [0x08, 0x09, 0x18, 0x19, 0x0A, 0x09, 0x1A, 0x19, 0x15, 0x24, 0x16, 0x24, 0x15, 0x64];

/// $C3E406
immutable ushort[2] arrC3E406 = [ 0x2441, 0x268D ];

/// $C3E40A
immutable ushort[2] arrC3E40A = [ 0x2451, 0x269D ];

/// $C3E40E
immutable ushort[4] unknownC3E40E = [ 0x3A69, 0x3A6A, 0x3A6B, 0x3A6C ];

/// $C3E416
immutable ushort[3] blinkingTriangleTiles = [ 0x3C14, 0x3C15, 0xBC11 ];

/// $C3E43C
immutable ushort[][4] unknownC3E41CPointerTable = [
	[0x3C16, 0x2E6D, 0x2E6E, 0x7C16],
	[0x3C16, 0x2E7D, 0x2E7E, 0x7C16],
	[0x3C16, 0x2E6D, 0x2C40, 0x7C16],
	[0x3C16, 0x2C40, 0x2E6E, 0x7C16],
];

/// $C3E44C
version(bugfix) {
	immutable ubyte[5] unknownC3E44C = ebString!5("Next"); //tx6 in EB
} else {
	immutable ubyte[4] unknownC3E44C = ebString!4("そのた"); //tx6 in EB
}

/// $C3E450
void unknownC3E450() {
	const(RGB)* x06;
	if ((unknown7E0002 & 4) != 0) {
		x06 = &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][4];
	} else {
		x06 = &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][20];
	}
	memcpy(&palettes[1][4], x06, 8);
	unknown7E0030 = 0x18;
}

/// $C3E4CA - Clear the instant text print flag
void clearInstantPrinting() {
	instantPrinting = 0;
}

/// $C3E4D4 - Set the instant text print flag
void setInstantPrinting() {
	instantPrinting = 1;
}

/// $C3E4E0
void windowTickWithoutInstantPrinting() {
	clearInstantPrinting();
	windowTick();
	setInstantPrinting();
}

/// $C3E4EF
short unknownC3E4EF() {
	for (short i = 0; i != 8; i++) {
		if (windowStats[i].windowID == -1) {
			return i;
		}
	}
	return -1;
}

/// $C3E521
void closeWindow(short arg1) {
	if (arg1 == -1) {
		return;
	}
	if (windowTable[arg1] == -1) {
		return;
	}
	if (currentFocusWindow == arg1) {
		currentFocusWindow = -1;
	}
	unknownC3E7E3(arg1);
	short x14 = windowStats[windowTable[arg1]].next;
	short x12 = windowStats[windowTable[arg1]].prev;
	if (x14 == -1) {
		windowTail = x12;
	} else {
		windowStats[x14].prev = x12;
	}
	if (x12 == -1) {
		windowHead = x14;
	} else {
		windowStats[x12].next = x14;
	}
	windowStats[windowTable[arg1]].windowID = -1;
	short x10 = windowTable[arg1];
	windowTable[arg1] = -1;
	ushort* x0E = &bg2Buffer[windowStats[x10].y * 32 + windowStats[x10].x];
	ushort* x14_2 = windowStats[x10].tilemapBuffer;
	for (short i = 0; i < windowStats[x10].width * windowStats[x10].height; i++) {
		// Wack vanilla code.. the body of this if statement always runs
		/+ if ((x14_2[0] != 0x40) || (x14_2[0] != 0)) { +/
			// Deallocate VWF tiles
			freeTile(x14_2[0]);
		/+ } +/
		x14_2[0] = 0x40;
		x14_2++;
	}
	for (short i = 0; i != windowStats[x10].height + 2; i++) {
		for (short j = 0; j != windowStats[x10].width + 2; j++) {
			*(x0E++) = 0;
		}
		x0E += 32 - windowStats[x10].width - 2;
	}
	unknownC45E96();
	if (windowStats[x10].titleID != 0) {
		unknown7E894E[windowStats[x10].titleID - 1] = -1;
	}
	windowStats[x10].titleID = 0;
	unknown7E9623 = 1;
	if (unknown7E5E7A == arg1) {
		unknown7E5E7A = -1;
	}
	if (unknown7E5E70 == 0) {
		windowTickWithoutInstantPrinting();
		clearInstantPrinting();
	}
	unknown7E5E75 = 0;
}

/// $C3E6F8
void unknownC3E6F8() {
	if (battleMenuCurrentCharacterID == -1) {
		return;
	}
	waitUntilNextFrame();

	ushort* y = &unknown7E827E[0x10 - (battleMenuCurrentCharacterID * 7) + (gameState.playerControlledPartyMemberCount * 7) / 2];
	for (short i = 7; i != 0; i--) {
		*y = 0;
		y++;
	}
	battleMenuCurrentCharacterID = -1;
	unknown7E9623 = 1;
}

/// $C3E75D
void unknownC3E75D(short arg1) {
	short a;
	if (arg1 == 0) {
		if (unknown7E9658 == -1) {
			unknown7E5E77 = 0;
			return;
		}
		if (unknown7E5E77 == 0) {
			return;
		}
		a = unknown7E9658;
	} else {
		if (unknown7E965A == -1) {
			unknown7E5E78 = 0;
			return;
		}
		if (unknown7E5E78 == 0) {
			return;
		}
		a = unknown7E965A;
	}
	if (enemyConfigurationTable[a].theFlag != 0) {
		if (unknown7E5E76 == ebChar('@')) {
			unknownC447FB(4, &thethe[0][0]);
		} else {
			unknownC447FB(4, &thethe[1][0]);
		}
	}
}

/// $C3E7E3
void unknownC3E7E3(short arg1) {
	if (arg1 == -1) {
		return;
	}
	if (windowStats[windowTable[arg1]].currentOption == -1) {
		return;
	}
	MenuOpt* x = &menuOptions[windowStats[windowTable[arg1]].currentOption];
	while (true) {
		x.field00 = 0;
		if (x.next == -1) {
			break;
		}
		x++;
	}
	windowStats[windowTable[arg1]].selectedOption = -1;
	windowStats[windowTable[arg1]].optionCount = -1;
	windowStats[windowTable[arg1]].currentOption = -1;
	windowStats[windowTable[arg1]].menuColumns = 1;
	windowStats[windowTable[arg1]].menuPage = 1;
}

/// $C3E84E
immutable ushort[10] unknownC3E84E = [ 0x0130, 0x0131, 0x0132, 0x0133, 0x0134, 0x0135, 0x0136, 0x0137, 0x0138, 0x0000 ];

/// $C3E862
immutable ushort[9] unknownC3E862 = [ 0x0140, 0x0141, 0x0142, 0x0143, 0x0144, 0x0145, 0x0146, 0x0147, 0x0148 ];

/// $C3E874
immutable ubyte[10][24] debugMenuText = [
	ebString!10("Flag"),
	ebString!10("Goods"),
	ebString!10("Save"),
	ebString!10("Apple"),
	ebString!10("Banana"),
	ebString!10("TV"),
	ebString!10("Event"),
	ebString!10("Warp"),
	ebString!10("Tea"),
	ebString!10("テレポ"), //Teleport
	ebString!10("スターα"), //Star α
	ebString!10("スターβ"), //Star β
	ebString!10("プレーヤー0"), //Player 0
	ebString!10("プレーヤー1"), //Player 1
	ebString!10("GUIDE"),
	ebString!10("TRACK"),
	ebString!10("CAST"),
	ebString!10("STONE"),
	ebString!10("STAFF"),
	ebString!10("メーター"), //Meter
	ebString!10("REPLAY"),
	ebString!10("TEST1"),
	ebString!10("TEST2"),
	ebString!10(""),
];

/// $C3E964
immutable CommandWindowSpacing[6] debugMenuElementSpacingData = [
	CommandWindowSpacing(0x00, 0x00),
	CommandWindowSpacing(0x06, 0x00),
	CommandWindowSpacing(0x00, 0x01),
	CommandWindowSpacing(0x06, 0x01),
	CommandWindowSpacing(0x00, 0x02),
	CommandWindowSpacing(0x06, 0x02),
];

/// $C3E970
immutable ubyte[3] debugOnText = ebStringz("ON");

/// $C3E973
immutable ubyte[4] debugOffText = ebStringz("OFF");

/// $C3E977
short getCharacterItem(short arg1, short arg2) {
	return partyCharacters[arg1 - 1].items[arg2 - 1];
}

/// $C3E9F7
short unknownC3E9F7(short arg1, short arg2) {
	arg1--;
	if (partyCharacters[arg1].equipment[EquipmentSlot.weapon] != 0) {
		if (partyCharacters[arg1].items[partyCharacters[arg1].equipment[EquipmentSlot.weapon] - 1] == arg2) {
			return 1;
		}
		if (partyCharacters[arg1].items[partyCharacters[arg1].equipment[EquipmentSlot.body] - 1] == arg2) {
			return 1;
		}
		if (partyCharacters[arg1].items[partyCharacters[arg1].equipment[EquipmentSlot.arms] - 1] == arg2) {
			return 1;
		}
		if (partyCharacters[arg1].items[partyCharacters[arg1].equipment[EquipmentSlot.other] - 1] == arg2) {
			return 1;
		}
	}
	return 0;
}

/// $C3E9A0
short checkItemEquipped(short arg1, short arg2) {
	if (partyCharacters[arg1 - 1].equipment[0] == arg2) {
		return 1;
	}
	if (partyCharacters[arg1 - 1].equipment[1] == arg2) {
		return 1;
	}
	if (partyCharacters[arg1 - 1].equipment[2] == arg2) {
		return 1;
	}
	if (partyCharacters[arg1 - 1].equipment[3] == arg2) {
		return 1;
	}
	return 0;
}

/// $C3EAD0
void unknownC3EAD0(short arg1) {
	for (short i = 0; timedItemTransformationTable[i].item != 0; i++) {
		if (arg1 != timedItemTransformationTable[i].item) {
			continue;
		}
		if (isValidItemTransformation(i) != 0) {
			return;
		}
		initializeItemTransformation(i);
		return;
	}
}

/// $C3EB1C
void unknownC3EB1C(short arg1) {
	short x14 = 0;
	for (; (timedItemTransformationTable[x14].sfx != 0) && (timedItemTransformationTable[x14].item != arg1); x14++) {}
	unknownC48F98(x14);
	for (short x12 = 0; x12 < gameState.playerControlledPartyMemberCount; x12++) {
		for (short x10 = 0; (x10 < 14) && (partyCharacters[gameState.partyMembers[x12] - 1].items[x10] != 0); x10++) {
			if (partyCharacters[gameState.partyMembers[x12] - 1].items[x10] != arg1) {
				initializeItemTransformation(x14);
				return;
			}
		}
	}
}

/// $C3EBCA
void unknownC3EBCA() {
	for (short i = 0; timedItemTransformationTable[i].item != 0; i++) {
		if (findItemInInventory2(0xFF, timedItemTransformationTable[i].item) != 0) {
			unknownC3EAD0(timedItemTransformationTable[i].item);
		} else {
			unknownC3EB1C(timedItemTransformationTable[i].item);
		}
	}
}

/// $C3EC1F
void unknownC3EC1F(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * partyCharacters[arg1 - 1].maxHP) / 100);
	}
	partyCharacters[arg1 - 1].hp.target -= arg2;
	if (partyCharacters[arg1 - 1].hp.target > partyCharacters[arg1 - 1].maxHP) {
		partyCharacters[arg1 - 1].hp.target = 0;
	}
}

/// $C3EC8B
void unknownC3EC8B(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * partyCharacters[arg1 - 1].maxHP) / 100);
	}
	partyCharacters[arg1 - 1].hp.target += arg2;
	if (partyCharacters[arg1 - 1].hp.current.integer == 0) {
		partyCharacters[arg1 - 1].hp.current.integer = 1;
	}
	if (partyCharacters[arg1 - 1].hp.target > partyCharacters[arg1 - 1].maxHP) {
		partyCharacters[arg1 - 1].hp.target = partyCharacters[arg1 - 1].maxHP;
	}
}

/// $C3ED2C
void unknownC3ED2C(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * partyCharacters[arg1 - 1].maxPP) / 100);
	}
	partyCharacters[arg1 - 1].pp.target -= arg2;
	if (partyCharacters[arg1 - 1].pp.target > partyCharacters[arg1 - 1].maxPP) {
		partyCharacters[arg1 - 1].pp.target = 0;
	}
}

/// $C3ED98
void unknownC3ED98(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * partyCharacters[arg1 - 1].maxPP) / 100);
	}
	partyCharacters[arg1 - 1].pp.target += arg2;
	if (partyCharacters[arg1 - 1].pp.target > partyCharacters[arg1 - 1].maxPP) {
		partyCharacters[arg1 - 1].pp.target = partyCharacters[arg1 - 1].maxPP;
	}
}

/// $C3EE14
short unknownC3EE14(short arg1, short arg2) {
	if ((itemData[arg2].flags & itemUsableFlags[arg1]) != 0) {
		return 1;
	} else {
		return 0;
	}
}

/// $C3EE4D
void unknownC3EE4D() {
	updateParty();
	unknownC07B52();
	unknownC1004E();
	unknownC0943C();
	if (unknown7EB4A8 == -1) {
		return;
	}
	entityTickCallbackFlags[unknown7EB4A8] &= 0xFFFF ^ (objectTickDisabled | objectMoveDisabled);
}

/// $C3EE7A
WorkingMemory unknownC3EE7A(short arg1) {
	WorkingMemory result;
	if ((cc1C01Table[arg1].size & 0x80) != 0) {
		switch (cc1C01Table[arg1].size & 0x7F) {
			case 1:
				result.integer = *cast(ubyte*)cc1C01Table[arg1].address;
				break;
			case 2:
				result.integer = *cast(ushort*)cc1C01Table[arg1].address;
				break;
			default:
				result.integer = *cast(uint*)cc1C01Table[arg1].address;
				break;
		}
	} else {
		result.pointer = cast(void*)cc1C01Table[arg1].address;
	}
	return result;
}

/// $C3EF23
void nullC3EF23(short) {
	//do nothing
}

/// $C3F054
immutable FontConfig[5] fontConfigTable = [
	FontConfig(cast(immutable(ubyte[]))import("fonts/main.bin"), cast(immutable(ubyte[]))import("fonts/main.gfx"), 32, 16), //main font
	FontConfig(cast(immutable(ubyte[]))import("fonts/mrsaturn.bin"), cast(immutable(ubyte[]))import("fonts/mrsaturn.gfx"), 32, 16), //mr saturn font
	FontConfig(cast(immutable(ubyte[]))import("fonts/battle.bin"), cast(immutable(ubyte[]))import("fonts/battle.gfx"), 16, 16), //battle font
	FontConfig(cast(immutable(ubyte[]))import("fonts/tiny.bin"), cast(immutable(ubyte[]))import("fonts/tiny.gfx"), 8, 8), //tiny font
	FontConfig(cast(immutable(ubyte[]))import("fonts/large.bin"), cast(immutable(ubyte[]))import("fonts/large.gfx"), 32, 16), //large font
];

/// $C3F112
immutable ubyte[2][5] psiSuffixes = [
	ebString!2("~"),
	ebString!2("^"),
	ebString!2("["),
	ebString!2("]"),
	ebString!2("#"),
];

/// $C3F11C
immutable ubyte[8] ppCostText = ebString("PP Cost:");

/// $C3F124
immutable ubyte[20][5][2] psiTargetText = [
	[
		ebString!20("To enemy"),
		ebString!20("To one enemy"),
		ebString!20("to One Enemy"),
		ebString!20("To row of foes"),
		ebString!20("To all enemies"),
	], [
		ebString!20("himself"),
		ebString!20("To one of us"),
		ebString!20("to One Friend"),
		ebString!20("To all of us"),
		ebString!20("To all of us"),
	]
];

/// $C3F1EC
short unknownC3F1EC(short arg1) {
	if (unknownC2239D(3) == 0) {
		return 0;
	}
	for (short i = 0; (i < 14) && (partyCharacters[3].items[i] != 0); i++) {
		short x0E = partyCharacters[3].items[i];
		if (itemData[x0E].type != 8) {
			continue;
		}
		if (itemData[x0E].parameters.epi > partyCharacters[3].iq) {
			continue;
		}
		if (randMod(99) >= arg1) {
			continue;
		}
		partyCharacters[3].items[i] = itemData[x0E].parameters.ep;
		return x0E;
	}
	return 0;
}

/// $C3F2B1
immutable ubyte[4] unknownC3F2B1 = [8, 4, 4, 4];

/// $C3F2B5
immutable ushort[8][17] partyCharacterGraphicsTable = [
	[
		OverworldSprite.ness,
		OverworldSprite.nessAngel,
		OverworldSprite.nessClimbingUp,
		OverworldSprite.nessClimbingDown,
		OverworldSprite.lilNess,
		OverworldSprite.lilAngel,
		OverworldSprite.nessRobot,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.paula,
		OverworldSprite.paulaAngel,
		OverworldSprite.paulaClimbingUp,
		OverworldSprite.paulaClimbingDown,
		OverworldSprite.lilPaula,
		OverworldSprite.lilAngel,
		OverworldSprite.robot,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.jeff,
		OverworldSprite.jeffAngel,
		OverworldSprite.jeffClimbingUp,
		OverworldSprite.jeffClimbingDown,
		OverworldSprite.lilJeff,
		OverworldSprite.lilAngel,
		OverworldSprite.robot,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.poo,
		OverworldSprite.pooAngel,
		OverworldSprite.pooClimbingUp,
		OverworldSprite.pooClimbingDown,
		OverworldSprite.lilPoo,
		OverworldSprite.lilAngel,
		OverworldSprite.robot,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.pokey,
		OverworldSprite.pokey,
		OverworldSprite.pokey,
		OverworldSprite.pokey,
		OverworldSprite.pokey,
		OverworldSprite.pokey,
		OverworldSprite.pokey,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.picky,
		OverworldSprite.picky,
		OverworldSprite.picky,
		OverworldSprite.picky,
		OverworldSprite.picky,
		OverworldSprite.picky,
		OverworldSprite.picky,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.king,
		OverworldSprite.king,
		OverworldSprite.kingClimbingUp,
		OverworldSprite.kingClimbingDown,
		OverworldSprite.king,
		OverworldSprite.king,
		OverworldSprite.king,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.tony,
		OverworldSprite.tony,
		OverworldSprite.tony,
		OverworldSprite.tony,
		OverworldSprite.tony,
		OverworldSprite.tony,
		OverworldSprite.tony,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.bubbleMonkey,
		OverworldSprite.bubbleMonkey,
		OverworldSprite.bubbleMonkey,
		OverworldSprite.bubbleMonkeyClimbingUp,
		OverworldSprite.bubbleMonkey,
		OverworldSprite.bubbleMonkey,
		OverworldSprite.bubbleMonkey,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.dungeonMan,
		OverworldSprite.dungeonMan,
		OverworldSprite.dungeonMan,
		OverworldSprite.dungeonMan,
		OverworldSprite.dungeonMan,
		OverworldSprite.dungeonMan,
		OverworldSprite.dungeonMan,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.flyingMan,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.teddyBearParty,
		OverworldSprite.teddyBearParty,
		OverworldSprite.teddyBearParty,
		OverworldSprite.teddyBearParty,
		OverworldSprite.lilTeddyBear,
		OverworldSprite.lilTeddyBear,
		OverworldSprite.teddyBearParty,
		OverworldSprite.invalid,
	],
	[
		OverworldSprite.teddyBearParty,
		OverworldSprite.teddyBearParty,
		OverworldSprite.teddyBearParty,
		OverworldSprite.teddyBearParty,
		OverworldSprite.lilTeddyBear,
		OverworldSprite.lilTeddyBear,
		OverworldSprite.teddyBearParty,
		OverworldSprite.invalid,
	]
];

/// $C3F3C5
short showTitleScreen(short arg1) {
	unknown7E9F75 = arg1;
	short x04 = 0;
	prepareForImmediateDMA();
	unknownC0927C();
	if (0) { //interesting... this is unreachable and the entry statement seems to have been optimized out, but the body, condition and post-body statement remain
		for (short i = 0; i < 30; i++) {
			entitySpriteMapFlags[i] |= 0x8000;
		}
	}
	unknownC08D79(11);
	setOAMSize(3);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
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
	unknownC0EBE0();
	mirrorTM = 0x11;
	oamClear();
	initEntityWipe(ActionScript.titleScreen1, 0, 0);
	unknown7E9641 = 0;
	if (unknown7E9F75 == 0) {
		memset(&palettes[0][0], 0, 0x200);
		unknown7E0030 = 0x18;
		setForceBlank();
		mirrorINIDISP = 0xF;
		waitUntilNextFrame();
		unknown7E0030 = 0;
		decomp(&unknownE1AE7C[0], &palettes[8][0]);
		unknownC496F9();
		memset(&palettes[0][0], 0, 0x200);
		unknownC496E7(0x3C, 0x100);
		unknown7E0030 = 0x18;
		for (short i = 0; 0x3C > i; i++) {
			updateMapPaletteAnimation();
			unknownC1004E();
		}
	} else {
		fadeIn(4, 1);
		for (short i = 0; 0x3C > i; i++) {
			unknownC1004E();
		}
	}
	short x02 = 0;
	while ((unknown7E9641 == 0) || (unknown7E9641 == 2)) {
		if (x04 == 0) {
			if (((padPress[0] & Pad.a) != 0) || ((padPress[0] & Pad.b) != 0) || ((padPress[0] & Pad.start) != 0)) {
				x02 = 1;
				break;
			}
		}
		unknownC1004E();
	}
	if ((unknown7E9F75 == 0) && (unknown7E9641 == 0)) {
		x02 = unknownEF04DC();
	}
	fadeOutWithMosaic(1, 4, 0);
	if (x04 == 0) {
		unknown7E9641 = 0;
		unknownC474A8(/+0+/);
		unknownC0927C();
		return x02;
	}
	for (short i = 0; i < 0x1E; i++) {
		if ((entityScriptTable[i] >= ActionScript.titleScreen1) && (entityScriptTable[i] <= ActionScript.titleScreen11)) {
			unknownC09C35(i);
		}
		entitySpriteMapFlags[i] &= 0x7FFF;
	}
	prepareForImmediateDMA();
	reloadMap();
	undrawFlyoverText();
	mirrorTM = 0x17;
	fadeIn(1, 1);
	//the original code may not have had an explicit return, but this is what effectively happens
	return 1;
}

/// $C3F5F9
void unknownC3F5F9() {
	short x04 = 0;
	short x16 = unknown7E9F7E;
	for (short i = 0; i < unknown7E9F80; i++) {
		short x12 = cast(short)(unknown7E9F7C + unknown7E9F84 + (unknown7E9F7A & 0x1F));
		copyToVRAM(0, x16, x12, cast(ubyte*)&unknown7E9F86[x04]);
		x04 += unknown7E9F82;
		if (++unknown7E9F7C == 0x20) {
			unknown7E9F7C = 0;
		}
	}
}

/// $C3F705
void unknownC3F705(short arg1, short arg2, ushort* arg3) {
	unknown7E9F86 = &arg3[1];
	short x12 = arg1 & 0x3F;
	unknown7E9F7A = x12;
	short x10 = arg2 & 0x1F;
	unknown7E9F7C = x10;
	unknown7E9F84 = ((x12 & 0x1F) != 0) ? 0x3C00 : 0x3800;
	short x18 = arg3[0] >> 8;
	unknown7E9F7E = x18;
	unknown7E9F80 = arg3[0] & 0xFF;
	if ((x12 & 0xFFE0) == ((x12 + x18) & 0xFFE0)) {
		unknown7E9F82 = x18;
		unknownC3F5F9();
	} else {
		do {
			unknown7E9F7E = cast(short)(((x18 + x12) & 0xFFE0) - unknown7E9F7A);
			unknown7E9F82 = x18;
			unknownC3F5F9();
			unknown7E9F84 ^= 0x400;
			unknown7E9F86 = &unknown7E9F86[unknown7E9F7E];
			unknown7E9F7A = 0;
			unknown7E9F7C = x10;
			x18 -= unknown7E9F7E;
		} while (x18 >= 0x20);
		unknown7E9F7E = x18;
		unknown7E9F82 = x18;
		unknownC3F5F9();
	}
}

/// $C3F819
immutable(Unknown7EAECCEntry)[4] unknownC3F819 = [
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x9800, 0x7F00, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF38, 0xFF50, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0x00, 0x00, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
];

/// $C3F871
immutable ushort[32] unknownC3F871 = [
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
immutable ushort[32] unknownC3F8B1 = [
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
immutable RGB[16][3] unknownC3F8F1 = [
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
immutable ubyte[3][11] unknownC3F951 = [
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
immutable ubyte[3][5] unknownC3F972 = [
	[15, 15, 15],
	[15, 15, 0],
	[15, 7, 15],
	[0, 0, 15],
	[31, 0, 12],
];

/// $C3F981
void unknownC3F981(short arg1) {
	if (arg1 < 35) {
		showPSIAnimation(arg1);
		return;
	}
	if (arg1 < 46) {
		unknownC2DE0F();
		setColData(unknownC3F951[arg1 - 35][0], unknownC3F951[arg1 - 35][1], unknownC3F951[arg1 - 35][2]);
		setColourAddSubMode(0x10, 0x3F);
		unknownC4A67E(5, 7);
	} else if (arg1 < 49) {
		switch (arg1 + 1) {
			case 47:
				wobbleDuration = 144;
				break;
			case 48:
				shakeDuration = 300;
				break;
			case 49:
			default:
				break;
		}
	} else if (arg1 < 54) {
		unknownC2DE0F();
		setColData(unknownC3F972[arg1 - 49][0], unknownC3F972[arg1 - 49][1], unknownC3F972[arg1 - 49][2]);
		setColourAddSubMode(0x10, 0x3F);
		if (arg1 < 53) {
			unknownC4A67E(4, 5);
		} else {
			unknownC4A67E(2, 4);
		}
	}
}

/// $C3FB09
short unknownC3FB09() {
	if (currentAttacker.allyOrEnemy == 0) {
		return 0;
	}
	return 1;
}

/// $C3FB2B
immutable ubyte[26] nameRegistryRequestString = ebString!26("Register your name, please");

/// $C3FB45
immutable ubyte[10][26] unknownC3FB45 = [
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
short unknownC3FAC9(short arg1, short arg2) {
	if (currentTarget.npcID == EnemyID.tinyLilGhost) {
		return 1;
	}
	if (currentTarget.allyOrEnemy == 0) {
		unknownC3F981(arg1);
		return 0;
	}
	unknownC3F981(arg2);
	return 1;
}

/// $C3FB1F
immutable uint[3] unknownC3FB1F = [
	0x12000,
	0x11800,
	0x11000,
];

/// $C3FD2D
immutable NamingScreenEntity[][14] unknownC3FD2D = [
	[
		NamingScreenEntity(OverworldSprite.ness, ActionScript.unknown502),
		NamingScreenEntity(OverworldSprite.nessPosing, ActionScript.unknown503),
		NamingScreenEntity(OverworldSprite.nessSurprised, ActionScript.unknown504),
		NamingScreenEntity(OverworldSprite.smallShadow, ActionScript.unknown505),
		NamingScreenEntity(OverworldSprite.surpriseMark, ActionScript.unknown506),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.paula, ActionScript.unknown507),
		NamingScreenEntity(OverworldSprite.paulaSurprised, ActionScript.unknown508),
		NamingScreenEntity(OverworldSprite.smallShadow, ActionScript.unknown509),
		NamingScreenEntity(OverworldSprite.musicNotes, ActionScript.unknown510),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.jeff, ActionScript.unknown511),
		NamingScreenEntity(OverworldSprite.surpriseMark, ActionScript.unknown512),
		NamingScreenEntity(OverworldSprite.sweat, ActionScript.unknown513),
		NamingScreenEntity(OverworldSprite.lightBulb, ActionScript.unknown514),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.poo, ActionScript.unknown515),
		NamingScreenEntity(OverworldSprite.pooMeditating, ActionScript.unknown516),
		NamingScreenEntity(OverworldSprite.pooClimbingUp, ActionScript.unknown517),
		NamingScreenEntity(OverworldSprite.starMastersPoofCloud, ActionScript.unknown518),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.king, ActionScript.unknown521),
		NamingScreenEntity(OverworldSprite.nessDogSleeping, ActionScript.unknown522),
		NamingScreenEntity(OverworldSprite.ness, ActionScript.unknown520),
		NamingScreenEntity(OverworldSprite.zzz1, ActionScript.unknown523),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.frenchKissOfDeath, ActionScript.unknown524),
		NamingScreenEntity(OverworldSprite.plate, ActionScript.unknown526),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.frenchKissOfDeath, ActionScript.unknown528),
		NamingScreenEntity(OverworldSprite.twinklingStars, ActionScript.unknown530),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.ness, ActionScript.unknown532),
		NamingScreenEntity(OverworldSprite.nessPosing, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.nessSurprised, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.smallShadow, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.surpriseMark, ActionScript.unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.paula, ActionScript.unknown532),
		NamingScreenEntity(OverworldSprite.paulaSurprised, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.smallShadow, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.musicNotes, ActionScript.unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.jeff, ActionScript.unknown532),
		NamingScreenEntity(OverworldSprite.surpriseMark, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.sweat, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.lightBulb, ActionScript.unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.poo, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.pooMeditating, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.pooClimbingUp, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.starMastersPoofCloud, ActionScript.unknown519),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.king, ActionScript.unknown533),
		NamingScreenEntity(OverworldSprite.nessDogSleeping, ActionScript.unknown035),
		NamingScreenEntity(OverworldSprite.ness, ActionScript.unknown532),
		NamingScreenEntity(OverworldSprite.zzz1, ActionScript.unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.frenchKissOfDeath, ActionScript.unknown525),
		NamingScreenEntity(OverworldSprite.plate, ActionScript.unknown527),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.frenchKissOfDeath, ActionScript.unknown529),
		NamingScreenEntity(OverworldSprite.twinklingStars, ActionScript.unknown035),
		NamingScreenEntity(0x0000)
	]
];

/// $C3FD65
immutable FileSelectSummarySpriteConfigEntry[5] fileSelectSummarySpriteConfig = [
	FileSelectSummarySpriteConfigEntry(OverworldSprite.ness, ActionScript.unknown861, 40, 44),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.paula, ActionScript.unknown861, 40, 76),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.jeff, ActionScript.unknown861, 40, 108),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.poo, ActionScript.unknown861, 40, 140),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.nessDogSleeping, ActionScript.unknown534, 136, 40)
];

/// $C3FD8D
immutable ubyte[][10] attractModeText = [
	textAttractMode0,
	textAttractMode1,
	textAttractMode2,
	textAttractMode3,
	textAttractMode4,
	textAttractMode5,
	textAttractMode6,
	textAttractMode7,
	textAttractMode8,
	textAttractMode9,
];

/// $C3FDBD
immutable ushort[4] unusedForSaleSignSpriteTable = [
	OverworldSprite.guyInBlueClothes,
	OverworldSprite.jamaicanGuy,
	OverworldSprite.mrT,
	OverworldSprite.oldGuyWithCane,
];

/// $C3FDB5
immutable ushort[4] unknownC3FDB5 = [
	0x180,
	0x190,
	0x1A0,
	0x1B0,
];

/// $C3FDC5
short unknownC3FDC5() {
	//nope. not doing this one, sorry
	return 0;
}
