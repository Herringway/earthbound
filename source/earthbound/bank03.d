/// actionscripts, misc things
module earthbound.bank03;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank04;
import earthbound.text;
import earthbound.bank15;
import earthbound.bank18;
import earthbound.bank20;
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.globals;
import core.stdc.string;
import std.logger;

//$C30000
@ROMSource(0x30000, 256)
immutable(ushort[16])[] spriteGroupPalettes;

/** Display the anti-piracy error screen and loop endlessly
 * Original_Address: $(DOLLAR)C30100
 */
noreturn displayAntiPiracyScreen() {
	prepareGameFailure();
	decomp(&antiPiracyNoticeGraphics[0], &buffer[0]);
	decomp(&antiPiracyNoticeArrangement[0], &buffer[0x4000]);
	gameFailureLoop();
}

/** Display the faulty gamepak error screen and loop endlessly
 * Original_Address: $(DOLLAR)C30142
 */
noreturn displayFaultyGamepakScreen() {
	prepareGameFailure();
	decomp(&faultyGamepakGraphics[0], &buffer[0]);
	decomp(&faultyGamepakArrangement[0], &buffer[0x4000]);
	gameFailureLoop();
}

/// $C30186
immutable nessPajamaFlag = EventFlag.myHomeNesChange;

/// $C3DFE8
immutable ubyte[8] legalDeliveryAreaTypes = [
	SpecialGameState.none: 1,
	SpecialGameState.indoorArea: 1,
	SpecialGameState.exitMouseUsable: 1,
	SpecialGameState.useMiniSprites: 0,
	SpecialGameState.useMagicantSprites: 1,
	SpecialGameState.useRobotSprites: 1,
	SpecialGameState.onBicycle: 0,
	7: 0
];

/// $C3DFF0 - unused?
immutable short[17] unknownC3DFF0 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];

/// $C3E012
immutable CharacterInitialEntityDataEntry[17] characterInitialEntityData = [
	CharacterInitialEntityDataEntry(OverworldSprite.ness, OverworldSprite.lilNess, ActionScript.partyMemberFollowing, 0x0018),
	CharacterInitialEntityDataEntry(OverworldSprite.paula, OverworldSprite.lilPaula, ActionScript.partyMemberFollowing, 0x0019),
	CharacterInitialEntityDataEntry(OverworldSprite.jeff, OverworldSprite.lilJeff, ActionScript.partyMemberFollowing, 0x001A),
	CharacterInitialEntityDataEntry(OverworldSprite.poo, OverworldSprite.lilPoo, ActionScript.partyMemberFollowing, 0x001B),
	CharacterInitialEntityDataEntry(OverworldSprite.pokey, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.picky, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.king, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.tony, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.bubbleMonkey, OverworldSprite.invalid, ActionScript.partyMemberFollowingBubbleMonkey, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.dungeonMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.teddyBearParty, OverworldSprite.lilTeddyBear, ActionScript.partyMemberFollowing, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.teddyBearParty, OverworldSprite.lilTeddyBear, ActionScript.partyMemberFollowing, 0x001C),
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
	WalkingStyle.normal : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.unknown01 : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.unknown02 : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.bicycle : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.ghost : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.unknown05 : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.slower : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.ladder : DirectionMask.up | DirectionMask.down,
	WalkingStyle.rope : DirectionMask.up | DirectionMask.down,
	WalkingStyle.unknown09 : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.slowest : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.unknown11 : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft,
	WalkingStyle.escalator : 0,
	WalkingStyle.stairs : DirectionMask.up | DirectionMask.upRight | DirectionMask.right | DirectionMask.downRight | DirectionMask.down | DirectionMask.downLeft | DirectionMask.left | DirectionMask.upLeft
];

/// $C3E148
immutable short[8] npcSearchXOffsets = [
	Direction.up: 0,
	Direction.upRight: 0,
	Direction.right: 10,
	Direction.downRight: 0,
	Direction.down: 0,
	Direction.downLeft: 0,
	Direction.left: -10,
	Direction.upLeft: 0
];

/// $C3E158
immutable short[8] npcSearchYOffsets = [
	Direction.up: -5,
	Direction.upRight: -5,
	Direction.right: 0,
	Direction.downRight: 5,
	Direction.down: 5,
	Direction.downLeft: 5,
	Direction.left: 0,
	Direction.upLeft: -5
];

/// $C3E168
immutable short[8] oppositeCardinals = [
	Direction.up: Direction.down,
	Direction.upRight: Direction.down,
	Direction.right: Direction.left,
	Direction.downRight: Direction.up,
	Direction.down: Direction.up,
	Direction.downLeft: Direction.up,
	Direction.left: Direction.right,
	Direction.upLeft: Direction.down
];

/// $C3E178
immutable short[16][3] mushroomizationDirectionRemapTables = [
	[
		0,
		((Pad.right) >> 8): Pad.down,
		((Pad.left) >> 8): Pad.up,
		((Pad.right | Pad.left) >> 8): Pad.up | Pad.down,
		((Pad.down) >> 8): Pad.left,
		((Pad.down | Pad.right) >> 8): Pad.left | Pad.down,
		((Pad.down | Pad.left) >> 8): Pad.left | Pad.up,
		((Pad.down | Pad.right | Pad.left) >> 8): Pad.left | Pad.up | Pad.down,
		((Pad.up) >> 8): Pad.right,
		((Pad.up | Pad.right) >> 8): Pad.right | Pad.down,
		((Pad.up | Pad.left) >> 8): Pad.right | Pad.up,
		((Pad.up | Pad.right | Pad.left) >> 8): Pad.right | Pad.up | Pad.down,
		((Pad.up | Pad.down) >> 8): Pad.right | Pad.left,
		((Pad.up | Pad.down | Pad.right) >> 8): Pad.right | Pad.left | Pad.down,
		((Pad.up | Pad.down | Pad.left) >> 8): Pad.right | Pad.left | Pad.up,
		((Pad.up | Pad.down | Pad.right | Pad.left) >> 8): Pad.right | Pad.left | Pad.up | Pad.down,
	], [
		0,
		((Pad.right) >> 8): Pad.left,
		((Pad.left) >> 8): Pad.right,
		((Pad.right | Pad.left) >> 8): Pad.right | Pad.left,
		((Pad.down) >> 8): Pad.up,
		((Pad.down | Pad.right) >> 8): Pad.left | Pad.up,
		((Pad.down | Pad.left) >> 8): Pad.right | Pad.up,
		((Pad.down | Pad.right | Pad.left) >> 8): Pad.right | Pad.left | Pad.up,
		((Pad.up) >> 8): Pad.down,
		((Pad.up | Pad.right) >> 8): Pad.left | Pad.down,
		((Pad.up | Pad.left) >> 8): Pad.right | Pad.down,
		((Pad.up | Pad.right | Pad.left) >> 8): Pad.right | Pad.left | Pad.down,
		((Pad.up | Pad.down) >> 8): Pad.up | Pad.down,
		((Pad.up | Pad.down | Pad.right) >> 8): Pad.left | Pad.up | Pad.down,
		((Pad.up | Pad.down | Pad.left) >> 8): Pad.right | Pad.up | Pad.down,
		((Pad.up | Pad.down | Pad.right | Pad.left) >> 8): Pad.right | Pad.left | Pad.up | Pad.down,
	], [
		0,
		((Pad.right) >> 8): Pad.up,
		((Pad.left) >> 8): Pad.down,
		((Pad.right | Pad.left) >> 8): Pad.up | Pad.down,
		((Pad.down) >> 8): Pad.right,
		((Pad.down | Pad.right) >> 8): Pad.right | Pad.up,
		((Pad.down | Pad.left) >> 8): Pad.right | Pad.down,
		((Pad.down | Pad.right | Pad.left) >> 8): Pad.right | Pad.up | Pad.down,
		((Pad.up) >> 8): Pad.left,
		((Pad.up | Pad.right) >> 8): Pad.left | Pad.up,
		((Pad.up | Pad.left) >> 8): Pad.left | Pad.down,
		((Pad.up | Pad.right | Pad.left) >> 8): Pad.left | Pad.up | Pad.down,
		((Pad.up | Pad.down) >> 8): Pad.right | Pad.left,
		((Pad.up | Pad.down | Pad.right) >> 8): Pad.right | Pad.left | Pad.up,
		((Pad.up | Pad.down | Pad.left) >> 8): Pad.right | Pad.left | Pad.down,
		((Pad.up | Pad.down | Pad.right | Pad.left) >> 8): Pad.right | Pad.left | Pad.up | Pad.down,
	]
];

/// $C3E1D8
immutable short[4] unknownC3E1D8 = [4, 0, 2, 6];

/// $C3E1E0
//wonder what this is...?
immutable short[4][4] unknownC3E1E0 = [[0, 0, 4, 0], [0, 0, -4, 0], [-4, 0, 0, 0], [4, 0, 0, 0]];

/// $C3E200
immutable short[4] staircaseEntryDirections = [
	StairDirection.upLeft >> 8: Direction.upLeft,
	StairDirection.upRight >> 8: Direction.upRight,
	StairDirection.downLeft >> 8: Direction.downLeft,
	StairDirection.downRight >> 8: Direction.downRight
];

/// $C3E208
immutable short[4] staircaseExitDirections = [
	StairDirection.upLeft >> 8: Direction.right,
	StairDirection.upRight >> 8: Direction.left,
	StairDirection.downLeft >> 8: Direction.right,
	StairDirection.downRight >> 8: Direction.left
];

/// $C3E210
immutable short[4] staircaseStartOffsetX = [
	StairDirection.upLeft >> 8: 0,
	StairDirection.upRight >> 8: 8,
	StairDirection.downLeft >> 8: 0,
	StairDirection.downRight >> 8: 8
];

/// $C3E218
immutable short[4] staircaseStartOffsetY = [
	StairDirection.upLeft >> 8: 0,
	StairDirection.upRight >> 8: 0,
	StairDirection.downLeft >> 8: 8,
	StairDirection.downRight >> 8: 8
];

/// $C3E220
immutable short[4] staircaseEndOffsetX = [
	StairDirection.upLeft >> 8: 8,
	StairDirection.upRight >> 8: 0,
	StairDirection.downLeft >> 8: 8,
	StairDirection.downRight >> 8: 0
];

/// $C3E228
immutable short[4] staircaseEndOffsetY = [
	StairDirection.upLeft >> 8: 8,
	StairDirection.upRight >> 8: 8,
	StairDirection.downLeft >> 8: 0,
	StairDirection.downRight >> 8: 0
];

/// $C3E230
immutable short[8] interactXOffsets = [
	Direction.up: 0,
	Direction.upRight: 1,
	Direction.right: 1,
	Direction.downRight: 1,
	Direction.down: 0,
	Direction.downLeft: -1,
	Direction.left: -1,
	Direction.upLeft: -1
];

/// $C3E240
immutable short[8] interactYOffsets = [
	Direction.up: -1,
	Direction.upRight: -1,
	Direction.right: 0,
	Direction.downRight: 1,
	Direction.down: 1,
	Direction.downLeft: 1,
	Direction.left: 0,
	Direction.upLeft: -1
];

version(configurable) {
	enum textSpeedWindow = WindowConfig(0x0003, 0x000E, 0x0010, 0x000C);
} else {
	enum textSpeedWindow = WindowConfig(0x0003, 0x000E, 0x0010, 0x000A);

}

/// $C3E250
immutable WindowConfig[53] windowConfigurationTable = [
	Window.unknown00: WindowConfig(0x0001, 0x0001, 0x000D, 0x0008),
	Window.textStandard: WindowConfig(0x000C, 0x0001, 0x0013, 0x0008),
	Window.inventory: WindowConfig(0x0007, 0x0001, 0x0018, 0x0010),
	Window.inventoryMenu: WindowConfig(0x0001, 0x0001, 0x0006, 0x000A),
	Window.targettingDescription: WindowConfig(0x0001, 0x0003, 0x000B, 0x0006), /// Used for targetting and PP cost descriptions in battle
	Window.phoneMenu: WindowConfig(0x0014, 0x0001, 0x000B, 0x0010),
	Window.equipMenu: WindowConfig(0x0008, 0x0001, 0x0014, 0x000A),
	Window.equipMenuItemlist: WindowConfig(0x0012, 0x0001, 0x000D, 0x0010),
	Window.statusMenu: WindowConfig(0x0001, 0x0001, 0x001E, 0x0012),
	Window.unknown09: WindowConfig(0x000C, 0x0001, 0x0013, 0x0012), // Used by status screen?
	Window.carriedMoney: WindowConfig(0x0001, 0x000A, 0x0008, 0x0004),
	Window.unknown0b: WindowConfig(0x0001, 0x000F, 0x000B, 0x0004), // Used by status screen?
	Window.unknown0c: WindowConfig(0x000C, 0x0001, 0x0013, 0x0010),
	Window.unknown0d: WindowConfig(0x0007, 0x0001, 0x0018, 0x0010),
	Window.textBattle: WindowConfig(0x0004, 0x0001, 0x0018, 0x0006),
	Window.battleMenuExtended: WindowConfig(0x0001, 0x0001, 0x0015, 0x0006),
	Window.psiCategories: WindowConfig(0x0004, 0x0001, 0x0008, 0x0008), // Used for the PSI category list
	Window.unknown11: WindowConfig(0x000C, 0x0001, 0x000C, 0x0004),
	Window.battleMenuNormal: WindowConfig(0x0001, 0x0001, 0x000E, 0x0006),
	Window.fileSelectMain: WindowConfig(0x0001, 0x0002, 0x001E, 0x0008),
	Window.fileSelectMenu: WindowConfig(0x0005, 0x0009, 0x0016, 0x0004),
	Window.fileSelectCopyMenuTwoFiles: WindowConfig(0x000A, 0x0010, 0x000C, 0x0008),
	Window.fileSelectCopyMenuOneFile: WindowConfig(0x000A, 0x0010, 0x000C, 0x0006),
	Window.fileSelectDeleteConfirmation: WindowConfig(0x0006, 0x0011, 0x0015, 0x000A),
	Window.fileSelectTextSpeed: textSpeedWindow,
	Window.fileSelectMusicMode: WindowConfig(0x0008, 0x000F, 0x0012, 0x0008),
	Window.fileSelectNamingNameBox: WindowConfig(0x0005, 0x0004, 0x0008, 0x0004),
	Window.fileSelectNamingMessage: WindowConfig(0x000D, 0x0004, 0x0011, 0x0004),
	Window.fileSelectNamingKeyboard: WindowConfig(0x0001, 0x0009, 0x001E, 0x0010),
	Window.fileSelectNamingConfirmationNess: WindowConfig(0x0007, 0x0003, 0x0007, 0x0004),
	Window.fileSelectNamingConfirmationPaula: WindowConfig(0x0007, 0x0007, 0x0007, 0x0004),
	Window.fileSelectNamingConfirmationJeff: WindowConfig(0x0007, 0x000B, 0x0007, 0x0004),
	Window.fileSelectNamingConfirmationPoo: WindowConfig(0x0007, 0x000F, 0x0007, 0x0004),
	Window.fileSelectNamingConfirmationKing: WindowConfig(0x0014, 0x0003, 0x0008, 0x0004),
	Window.fileSelectNamingConfirmationFood: WindowConfig(0x000F, 0x0007, 0x000D, 0x0006),
	Window.fileSelectNamingConfirmationThing: WindowConfig(0x000F, 0x000D, 0x000D, 0x0006),
	Window.fileSelectNamingConfirmationMessage: WindowConfig(0x0004, 0x0015, 0x0018, 0x0004),
	Window.unknown25: WindowConfig(0x0012, 0x0006, 0x000D, 0x0008),
	Window.itemPSINameWhileTargetting: WindowConfig(0x000C, 0x0001, 0x000C, 0x0004),
	Window.unknown27: WindowConfig(0x0003, 0x0003, 0x001A, 0x0006),
	Window.equipSelectItem: WindowConfig(0x0001, 0x0001, 0x0007, 0x0004),
	Window.unknown29: WindowConfig(0x0010, 0x0008, 0x000F, 0x0004),
	Window.unknown2a: WindowConfig(0x000A, 0x0008, 0x0015, 0x0004),
	Window.unknown2b: WindowConfig(0x0004, 0x0008, 0x001B, 0x0004),
	Window.unknown2c: WindowConfig(0x0008, 0x0002, 0x0018, 0x0010),
	Window.equipMenuStats: WindowConfig(0x0003, 0x000B, 0x000F, 0x0006),
	Window.unknown2e: WindowConfig(0x0004, 0x0001, 0x0008, 0x000A),
	Window.unknown2f: WindowConfig(0x0001, 0x0009, 0x001E, 0x000A),
	Window.battleMenuDoubleExtended: WindowConfig(0x0001, 0x0001, 0x001C, 0x0006),
	Window.unknown31: WindowConfig(0x000A, 0x0004, 0x0014, 0x0004),
	Window.fileSelectFlavourChoice: WindowConfig(0x000E, 0x000B, 0x000F, 0x0010),
	Window.singleCharacterSelect: WindowConfig(0x0016, 0x0008, 0x0009, 0x0004),
	Window.unknown34: WindowConfig(0x0007, 0x0009, 0x0012, 0x0012),
];

/// $C3E3F8
immutable ubyte[14] unknownC3E3F8 = [
	0x08, 0x09,
	0x18, 0x19,
	0x0A, 0x09,
	0x1A, 0x19,
	0x15, 0x24,
	0x16, 0x24,
	0x15, 0x64
];

/// $C3E406
immutable ushort[2] selectionCursorFramesUpper = [ 0x2441, 0x268D ];

/// $C3E40A
immutable ushort[2] selectionCursorFramesLower = [ 0x2451, 0x269D ];

/// $C3E40E
immutable ushort[4] autoBattleArrangement = [ 0x3A69, 0x3A6A, 0x3A6B, 0x3A6C ];

/// $C3E416
immutable ushort[3] blinkingTriangleTiles = [ 0x3C14, 0x3C15, 0xBC11 ];

/// $C3E43C
immutable ushort[][4] paginationArrowTiles = [
	[0x3C16, 0x2E6D, 0x2E6E, 0x7C16],
	[0x3C16, 0x2E7D, 0x2E7E, 0x7C16],
	[0x3C16, 0x2E6D, 0x2C40, 0x7C16],
	[0x3C16, 0x2C40, 0x2E6E, 0x7C16],
];

/** String for the next page menu option label. This was left untranslated in Earthbound, probably because it only gets used in a debugging menu
 * Original_Address: $(DOLLAR)C3E44C
 */
version(bugfix) {
	immutable ubyte[5] menuNextLabel = ebString!5("Next"); //tx6 in EB
} else {
	immutable ubyte[4] menuNextLabel = ebString!4("そのた"); //tx6 in EB
}

/// $C3E450
void unknownC3E450() {
	const(RGB)* x06;
	if ((frameCounter & 4) != 0) {
		x06 = &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][4];
	} else {
		x06 = &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][20];
	}
	memcpy(&palettes[1][4], x06, 8);
	paletteUploadMode = PaletteUpload.full;
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
	if (arg1 == Window.invalid) {
		return;
	}
	if (windowTable[arg1] == -1) {
		return;
	}
	if (currentFocusWindow == arg1) {
		currentFocusWindow = -1;
	}
	resetWindowMenu(arg1);
	short x14 = windowStats[windowTable[arg1]].next;
	short x12 = windowStats[windowTable[arg1]].previous;
	if (x14 == -1) {
		windowTail = x12;
	} else {
		windowStats[x14].previous = x12;
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
		titledWindows[windowStats[x10].titleID - 1] = -1;
	}
	windowStats[x10].titleID = 0;
	redrawAllWindows = 1;
	if (paginationWindow == arg1) {
		paginationWindow = Window.invalid;
	}
	if (extraTickOnWindowClose == 0) {
		windowTickWithoutInstantPrinting();
		clearInstantPrinting();
	}
	vwfIndentNewLine = 0;
}

/// $C3E6F8
void resetActivePartyMemberHPPPWindow() {
	if (battleMenuCurrentCharacterID == -1) {
		return;
	}
	waitUntilNextFrame();

	// clear the top row of HP/PP window tiles, which were raised for the active party member
	ushort* y = &bg2Buffer[18 * 32 + (16 - (gameState.playerControlledPartyMemberCount * 7) / 2 + (battleMenuCurrentCharacterID * 7))];
	for (short i = hpPPWindowWidth; i != 0; i--) {
		*y = 0;
		y++;
	}
	battleMenuCurrentCharacterID = -1;
	redrawAllWindows = 1;
}

/// $C3E75D
void printBattlerArticle(short target) {
	short enemyID;
	if (target == 0) {
		if (attackerEnemyID == -1) {
			printAttackerArticle = 0;
			return;
		}
		if (printAttackerArticle != 0) {
			return;
		}
		enemyID = attackerEnemyID;
	} else {
		if (targetEnemyID == -1) {
			printTargetArticle = 0;
			return;
		}
		if (printTargetArticle != 0) {
			return;
		}
		enemyID = targetEnemyID;
	}
	if (enemyConfigurationTable[enemyID].theFlag != 0) {
		if (lastPrintedCharacter == ebChar('@')) { //starting a new sentence, capitalize it
			printWrappableString(thethe[0].length, &thethe[0][0]);
		} else {
			printWrappableString(thethe[1].length, &thethe[1][0]);
		}
	}
}

/** Resets a window's menu state and frees up its menu options
 * Params:
 * 	window = A currently-open window ID
 * $(DOLLAR)C3E7E3
 */
void resetWindowMenu(short window) {
	if (window == Window.invalid) {
		return;
	}
	if (windowStats[windowTable[window]].currentOption == -1) {
		return;
	}
	MenuOption* option = &menuOptions[windowStats[windowTable[window]].currentOption];
	while (true) {
		option.type = MenuOptionType.available;
		if (option.next == -1) {
			break;
		}
		option++;
	}
	windowStats[windowTable[window]].selectedOption = -1;
	windowStats[windowTable[window]].optionCount = -1;
	windowStats[windowTable[window]].currentOption = -1;
	windowStats[windowTable[window]].menuColumns = 1;
	windowStats[windowTable[window]].menuPage = 1;
}

/** IDs for the upper tiles of the "SMAAAAASH!" graphic
 * Original_Address: $(DOLLAR)C3E84E
 */
immutable ushort[10] smaaaashTiles = [
	0x0130, 0x0131, 0x0132, 0x0133, 0x0134, 0x0135, 0x0136, 0x0137, 0x0138, 0x0000
];

/** IDs for the upper tiles of the "YOU WON!" graphic. There is a short 8-frame pause between the two sets being printed
 * Original_Address: $(DOLLAR)C3E862
 */
immutable ushort[9] youWonTiles = [
	0x0140, 0x0141, 0x0142, 0x0143, // YOU
	0x0144, 0x0145, 0x0146, 0x0147, 0x0148 // WON!
];

version(bugfix) {
	enum option9 = "Teleport";
	enum option10 = "Star ~";
	enum option11 = "Star ^";
	enum option12 = "Player 0";
	enum option13 = "Player 1";
	enum option19 = "Meter";
} else {
	enum option9 = "テレポ";
	enum option10 = "スターα";
	enum option11 = "スターβ";
	enum option12 = "プレーヤー0";
	enum option13 = "プレーヤー1";
	enum option19 = "メーター";
}

/** Labels for the overworld debugging menu mapped to the Y button. Options 9, 10, 11, 12, 13 and 19 were never officially localized
 * Original_Address: $(DOLLAR)C3E874
 */
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
	ebString!10(option9), //Teleport
	ebString!10(option10), //Star α
	ebString!10(option11), //Star β
	ebString!10(option12), //Player 0
	ebString!10(option13), //Player 1
	ebString!10("GUIDE"),
	ebString!10("TRACK"),
	ebString!10("CAST"),
	ebString!10("STONE"),
	ebString!10("STAFF"),
	ebString!10(option19), //Meter
	ebString!10("REPLAY"),
	ebString!10("TEST1"),
	ebString!10("TEST2"),
	ebString!10(""),
];

/** Positioning data for the six main menu options in the overworld command menu
 * Original_Address: $(DOLLAR)C3E964
 */
immutable CommandMenuOptionPositioning[6] commandMenuOptionPositioning = [
	CommandMenuOptionPositioning(0x00, 0x00),
	CommandMenuOptionPositioning(0x06, 0x00),
	CommandMenuOptionPositioning(0x00, 0x01),
	CommandMenuOptionPositioning(0x06, 0x01),
	CommandMenuOptionPositioning(0x00, 0x02),
	CommandMenuOptionPositioning(0x06, 0x02),
];

/** "ON" text used for the FLAG debugging function
 * Original_Address: $(DOLLAR)C3E970
 */
immutable ubyte[3] debugOnText = ebStringz("ON");

/** "OFF" text used for the FLAG debugging function
 * Original_Address: $(DOLLAR)C3E973
 */
immutable ubyte[4] debugOffText = ebStringz("OFF");

/** Get the item at the specified slot for the specified character
 * Original_Address: $(DOLLAR)C3E977
 */
short getCharacterItem(short character, short slot) {
	return partyCharacters[character - 1].items[slot - 1];
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
	removeItemTransformationEntry(x14);
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
short canCharacterEquip(short character, short item) {
	if ((itemData[item].flags & itemUsableFlags[character - 1]) != 0) {
		return 1;
	} else {
		return 0;
	}
}

/// $C3EE4D
void unknownC3EE4D() {
	updateParty();
	unknownC07B52();
	finishFrame();
	freezeEntities();
	if (entityFadeEntity == -1) {
		return;
	}
	entityCallbackFlags[entityFadeEntity] &= 0xFFFF ^ (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
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
	FontConfig(0, 0, 32, 16), //main font
	FontConfig(1, 1, 32, 16), //mr saturn font
	FontConfig(2, 2, 16, 16), //battle font
	FontConfig(3, 3, 8, 8), //tiny font
	FontConfig(4, 4, 32, 16), //large font
];

@([ROMSource(0x210C7A, 96), ROMSource(0x201359, 96), ROMSource(0x2118DA, 96), ROMSource(0x211F3A, 96), ROMSource(0x21229A, 96)])
immutable(ubyte[])[] fontData;

@([ROMSource(0x210CDA, 3072), ROMSource(0x2013B9, 3072), ROMSource(0x21193A, 1536), ROMSource(0x211F9A, 768), ROMSource(0x2122FA, 3072)])
immutable(ubyte[])[] fontGraphics;

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
short showTitleScreen(short quick) {
	titleScreenQuickMode = quick;
	short x04 = 0;
	prepareForImmediateDMA();
	unknownC0927C();
	if (0) { //interesting... this is unreachable and the entry statement seems to have been optimized out, but the body, condition and post-body statement remain
		for (short i = 0; i < 30; i++) {
			entitySpriteMapFlags[i] |= SpriteMapFlags.drawDisabled;
		}
	}
	setBGMODE(BGMode.mode3 | BG3Priority);
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
	loadTitleScreenGraphics();
	mirrorTM = TMTD.obj | TMTD.bg1;
	oamClear();
	initEntityWipe(ActionScript.titleScreen1, 0, 0);
	actionscriptState = ActionScriptState.running;
	if (titleScreenQuickMode == 0) {
		memset(&palettes[0][0], 0, 0x200);
		paletteUploadMode = PaletteUpload.full;
		setForceBlank();
		mirrorINIDISP = 0xF;
		waitUntilNextFrame();
		paletteUploadMode = PaletteUpload.none;
		decomp(&unknownE1AE7C[0], &palettes[8][0]);
		unknownC496F9();
		memset(&palettes[0][0], 0, 0x200);
		unknownC496E7(0x3C, 0x100);
		paletteUploadMode = PaletteUpload.full;
		for (short i = 0; 0x3C > i; i++) {
			updateMapPaletteAnimation();
			finishFrame();
		}
	} else {
		fadeIn(4, 1);
		for (short i = 0; 0x3C > i; i++) {
			finishFrame();
		}
	}
	short x02 = 0;
	while ((actionscriptState == ActionScriptState.running) || (actionscriptState == ActionScriptState.titleScreenSpecial)) {
		if (x04 == 0) {
			if (((padPress[0] & Pad.a) != 0) || ((padPress[0] & Pad.b) != 0) || ((padPress[0] & Pad.start) != 0)) {
				x02 = 1;
				break;
			}
		}
		finishFrame();
	}
	if ((titleScreenQuickMode == 0) && (actionscriptState == ActionScriptState.running)) {
		x02 = unknownEF04DC();
	}
	fadeOutWithMosaic(1, 4, 0);
	if (x04 == 0) {
		actionscriptState = ActionScriptState.running;
		unknownC474A8(/+0+/);
		unknownC0927C();
		return x02;
	}
	for (short i = 0; i < 0x1E; i++) {
		if ((entityScriptTable[i] >= ActionScript.titleScreen1) && (entityScriptTable[i] <= ActionScript.titleScreen11)) {
			deleteEntity(i);
		}
		entitySpriteMapFlags[i] &= ~SpriteMapFlags.drawDisabled;
	}
	prepareForImmediateDMA();
	reloadMap();
	restoreMapRendering();
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	fadeIn(1, 1);
	//the original code may not have had an explicit return, but this is what effectively happens
	return 1;
}

/** Upload tiles from a tilemap to the map in VRAM, one row at a time
 * Original_Address: $(DOLLAR)C3F5F9
 */
void tilemapUpdateUploadRows() {
	short x04 = 0;
	short size = cast(short)(tilemapUpdateTileCount * 2);
	for (short i = 0; i < tilemapUpdateTileHeight; i++) {
		short destination = cast(short)(tilemapUpdateTileY * 32 + tilemapUpdateBaseAddress + (tilemapUpdateTileX & 0x1F));
		copyToVRAM(0, size, destination, cast(ubyte*)&tilemapUpdateRemainingTiles[x04]);
		x04 += tilemapUpdateTileWidth;
		if (++tilemapUpdateTileY == 0x20) {
			tilemapUpdateTileY = 0;
		}
	}
}

/** Upload a full tilemap to VRAM at specific overworld coordinates
 * Original_Address: $(DOLLAR)C3F705
 */
void tilemapUpdateUploadTilemap(short mapX, short mapY, ushort* newTiles) {
	tilemapUpdateRemainingTiles = &newTiles[1];
	short vramX = mapX & 0x3F;
	tilemapUpdateTileX = vramX;
	short vramY = mapY & 0x1F;
	tilemapUpdateTileY = vramY;
	tilemapUpdateBaseAddress = ((vramX & 0x1F) != 0) ? 0x3C00 : 0x3800;
	short count = newTiles[0] >> 8;
	tilemapUpdateTileCount = count;
	tilemapUpdateTileHeight = newTiles[0] & 0xFF;
	if ((vramX & 0xFFE0) == ((vramX + count) & 0xFFE0)) {
		tilemapUpdateTileWidth = count;
		tilemapUpdateUploadRows();
	} else {
		short x0E = count;
		do {
			tilemapUpdateTileCount = cast(short)(((count + vramX) & 0xFFE0) - tilemapUpdateTileX);
			tilemapUpdateTileWidth = count;
			tilemapUpdateUploadRows();
			tilemapUpdateBaseAddress ^= 0x400;
			tilemapUpdateRemainingTiles = &tilemapUpdateRemainingTiles[tilemapUpdateTileCount];
			tilemapUpdateTileX = 0;
			tilemapUpdateTileY = vramY;
			count -= tilemapUpdateTileCount;
		} while (count >= 0x20);
		tilemapUpdateTileCount = count;
		tilemapUpdateTileWidth = x0E;
		tilemapUpdateUploadRows();
	}
}

/** The oval window animations making up the iris out animation at the end of the game
 * Original_Address: $(DOLLAR)C3F819
 */
immutable(OvalWindowAnimation)[4] toBeContOvalClose = [
	OvalWindowAnimation(60, 0, 128, 112, 0x9800, 0x7F00, 0, 0, -224, -183, -4, -3),
	OvalWindowAnimation(60, 0, 128, 112, 0x8000, 0x8000, 0, 0, 0, 0, 0, 0),
	OvalWindowAnimation(60, 0, 128, 112, 0x8000, 0x8000, 0, 0, -200, -176, -4, -3),
	OvalWindowAnimation(0),
];

/** Mappings for each chunk of tile data associated with a 32x32 hardware sprite
 *
 * This enables 32 chunks of 32x32 tile data to fit into a 0x4000 byte buffer without any gaps. Note that the offsets aren't evenly spaced - this is because the sprites
 * are made up of 4x4 8x8 chunks of tile data laid out in two dimensions instead of linearly
 * Original_Address: $(DOLLAR)C3F871
 */
immutable ushort[32] battleSpritemapVRAMMapping = [
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
immutable ubyte[3][11] enemyPSIColours = [
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
immutable ubyte[3][5] miscSwirlColours = [
	[15, 15, 15],
	[15, 15, 0],
	[15, 7, 15],
	[0, 0, 15],
	[31, 0, 12],
];

/// $C3F981
void startBattleAnimation(ushort arg1) {
	if (arg1 <= BattleAnimation.unknown34) {
		showPSIAnimation(arg1);
		return;
	}
	if (arg1 <= BattleAnimation.enemyPSI11) {
		darkenAnimatedBackgrounds();
		setColData(enemyPSIColours[arg1 - BattleAnimation.enemyPSI01][0], enemyPSIColours[arg1 - BattleAnimation.enemyPSI01][1], enemyPSIColours[arg1 - BattleAnimation.enemyPSI01][2]);
		setColourAddSubMode(0x10, 0x3F);
		startSwirl(Swirl.enemyAttack, 7);
	} else if (arg1 <= BattleAnimation.unknown48) {
		switch (arg1 + 1) {
			case BattleAnimation.unknown46 + 1:
				wobbleDuration = 144;
				break;
			case BattleAnimation.unknown47 + 1:
				shakeDuration = 300;
				break;
			case BattleAnimation.unknown48 + 1:
			default:
				break;
		}
	} else if (arg1 <= BattleAnimation.giygasAttack) {
		darkenAnimatedBackgrounds();
		setColData(miscSwirlColours[arg1 - BattleAnimation.unknown49][0], miscSwirlColours[arg1 - BattleAnimation.unknown49][1], miscSwirlColours[arg1 - BattleAnimation.unknown49][2]);
		setColourAddSubMode(0x10, 0x3F);
		if (arg1 <= BattleAnimation.unknown52) {
			startSwirl(Swirl.unknown4, 5);
		} else {
			startSwirl(Swirl.giygasAttack, 4);
		}
	}
}

/** Tests if the current attacker is an enemy
 * Returns: 0 if friend, 1 if enemy
 * Original_Address: $(DOLLAR)C3FB09
 */
short attackerIsEnemy() {
	if (currentAttacker.side == BattleSide.friends) {
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
short startEnemyOrAllyBattleAnimation(ushort toPartyAnimation, ushort toEnemyAnimation) {
	if (currentTarget.npcID == EnemyID.tinyLilGhost) {
		return 1;
	}
	if (currentTarget.side == BattleSide.friends) {
		startBattleAnimation(toPartyAnimation);
		return 0;
	}
	startBattleAnimation(toEnemyAnimation);
	return 1;
}

/// $C3FB1F
immutable uint[3] hpMeterSpeeds = [
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
immutable string[10] attractModeText = [
	"MSG_MD_TOTO",
	"MSG_MD_THRK",
	"MSG_MD_MAKYO",
	"MSG_MD_HASHI",
	"MSG_MD_DUNG",
	"MSG_MD_TWSN",
	"MSG_MD_SKRB",
	"MSG_MD_FRSD",
	"MSG_MD_SUMS",
	"MSG_MD_ONET",
];

/// $C3FDBD
immutable ushort[4] unusedForSaleSignSpriteTable = [
	OverworldSprite.guyInBlueClothes,
	OverworldSprite.jamaicanGuy,
	OverworldSprite.mrT,
	OverworldSprite.oldGuyWithCane,
];

/// $C3FDB5
immutable ushort[4] partyMemberCastTileIDs = [
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
