/// ActionScript, misc things
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
import earthbound.hardware;
import core.stdc.string;
import std.logger;

//$C30000
@ROMSource(0x30000, 256)
immutable(ushort[16])[] spriteGroupPalettes;

/** Display the copyright warning screen and loop endlessly
 * Original_Address: $(DOLLAR)C30100
 */
noreturn displayCopyrightWarningScreen() {
	prepareGameFailure();
	decomp(&copyrightWarningTiles[0], &buffer[0]);
	decomp(&copyrightWarningTilemap[0], &buffer[0x4000]);
	gameFailureLoop();
}

/** Display the faulty game pack error screen and loop endlessly
 * Original_Address: $(DOLLAR)C30142
 */
noreturn displayFaultyGamepakScreen() {
	prepareGameFailure();
	decomp(&regionProtectionWarningTiles[0], &buffer[0]);
	decomp(&regionProtectionWarningTilemap[0], &buffer[0x4000]);
	gameFailureLoop();
}

/** The flag used for determining whether or not to use the alt sprite group for the main character
 * Original_Address: $(DOLLAR)C30186
 */
immutable nessPajamaFlag = EventFlag.myHomeNesChange;

/** A mapping of area types to whether or not delivery is legal there
 * Original_Address: $(DOLLAR)C3DFE8
 */
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

/** Unused?
 * Original_Address: $(DOLLAR)C3DFF0
 */
immutable short[17] unknownC3DFF0 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];

/** Data used to initialize overworld entities for party members
 *
 * This uses 1-based indexing, so the index<->PartyMember mapping is off by one
 * Original_Address: $(DOLLAR)C3E012
 */
immutable CharacterInitialEntityDataEntry[17] characterInitialEntityData = [
	PartyMember.ness - 1: CharacterInitialEntityDataEntry(OverworldSprite.ness, OverworldSprite.lilNess, ActionScript.partyMemberFollowing, 0x0018),
	PartyMember.paula - 1: CharacterInitialEntityDataEntry(OverworldSprite.paula, OverworldSprite.lilPaula, ActionScript.partyMemberFollowing, 0x0019),
	PartyMember.jeff - 1: CharacterInitialEntityDataEntry(OverworldSprite.jeff, OverworldSprite.lilJeff, ActionScript.partyMemberFollowing, 0x001A),
	PartyMember.poo - 1: CharacterInitialEntityDataEntry(OverworldSprite.poo, OverworldSprite.lilPoo, ActionScript.partyMemberFollowing, 0x001B),
	PartyMember.pokey - 1: CharacterInitialEntityDataEntry(OverworldSprite.pokey, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.picky - 1: CharacterInitialEntityDataEntry(OverworldSprite.picky, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.king - 1: CharacterInitialEntityDataEntry(OverworldSprite.king, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.tony - 1: CharacterInitialEntityDataEntry(OverworldSprite.tony, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.bubbleMonkey - 1: CharacterInitialEntityDataEntry(OverworldSprite.bubbleMonkey, OverworldSprite.invalid, ActionScript.partyMemberFollowingBubbleMonkey, 0x001C),
	PartyMember.dungeonMan - 1: CharacterInitialEntityDataEntry(OverworldSprite.dungeonMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.flyingMan1 - 1: CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.flyingMan2 - 1: CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.flyingMan3 - 1: CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.flyingMan4 - 1: CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.flyingMan5 - 1: CharacterInitialEntityDataEntry(OverworldSprite.flyingMan, OverworldSprite.invalid, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.teddyBear - 1: CharacterInitialEntityDataEntry(OverworldSprite.teddyBearParty, OverworldSprite.lilTeddyBear, ActionScript.partyMemberFollowing, 0x001C),
	PartyMember.plushTeddyBear - 1: CharacterInitialEntityDataEntry(OverworldSprite.teddyBearParty, OverworldSprite.lilTeddyBear, ActionScript.partyMemberFollowing, 0x001C),
];

/** The overworld entity sizes for each party member
 *
 * Like characterInitialEntityData, this uses 1-based indexing
 * Original_Address: $(DOLLAR)C3E09A
 */
immutable ushort[17] characterSizes = [
	PartyMember.ness - 1: 0,
	PartyMember.paula - 1: 0,
	PartyMember.jeff - 1: 0,
	PartyMember.poo - 1: 0,
	PartyMember.pokey - 1: 0,
	PartyMember.picky - 1: 0,
	PartyMember.king - 1: 4,
	PartyMember.tony - 1: 0,
	PartyMember.bubbleMonkey - 1: 0,
	PartyMember.dungeonMan - 1: 10,
	PartyMember.flyingMan1 - 1: 0,
	PartyMember.flyingMan2 - 1: 0,
	PartyMember.flyingMan3 - 1: 0,
	PartyMember.flyingMan4 - 1: 0,
	PartyMember.flyingMan5 - 1: 0,
	PartyMember.teddyBear - 1: 0,
	PartyMember.plushTeddyBear - 1: 0,
];

/** Cardinal walking speeds for each walking style
 * Original_Address: $(DOLLAR)C3E0BC
 */
immutable FixedPoint1616[14] defaultMovementSpeeds = [
	WalkingStyle.normal: FixedPoint1616(0x6000, 1),
	WalkingStyle.unknown01: FixedPoint1616(0x6000, 1),
	WalkingStyle.unknown02: FixedPoint1616(0x6000, 1),
	WalkingStyle.bicycle: FixedPoint1616(0xCCCC, 1),
	WalkingStyle.ghost: FixedPoint1616(0x0000, 1),
	WalkingStyle.unknown05: FixedPoint1616(0x0000, 0),
	WalkingStyle.slower: FixedPoint1616(0x0000, 1),
	WalkingStyle.ladder: FixedPoint1616(0xCCCC, 0),
	WalkingStyle.rope: FixedPoint1616(0xCCCC, 0),
	WalkingStyle.unknown09: FixedPoint1616(0x0000, 0),
	WalkingStyle.slowest: FixedPoint1616(0x8000, 0),
	WalkingStyle.unknown11: FixedPoint1616(0x0000, 0),
	WalkingStyle.escalator: FixedPoint1616(0xCCCC, 0),
	WalkingStyle.stairs: FixedPoint1616(0xCCCC, 0),
];
/** Diagonal walking speeds for each walking style
 *
 * This is basically just cardinal walking speed times sqrt(2)/2
 * Original_Address: $(DOLLAR)C3E0F4
 */
immutable FixedPoint1616[14] defaultMovementSpeedsDiagonal = [
	WalkingStyle.normal: FixedPoint1616(0xF8E6, 0),
	WalkingStyle.unknown01: FixedPoint1616(0xF8E6, 0),
	WalkingStyle.unknown02: FixedPoint1616(0xF8E6, 0),
	WalkingStyle.bicycle: FixedPoint1616(0x45D5, 1),
	WalkingStyle.ghost: FixedPoint1616(0xB505, 0),
	WalkingStyle.unknown05: FixedPoint1616(0x0000, 0),
	WalkingStyle.slower: FixedPoint1616(0xB505, 0),
	WalkingStyle.ladder: FixedPoint1616(0x90D0, 0),
	WalkingStyle.rope: FixedPoint1616(0x90D0, 0),
	WalkingStyle.unknown09: FixedPoint1616(0x0000, 0),
	WalkingStyle.slowest: FixedPoint1616(0x5A82, 0),
	WalkingStyle.unknown11: FixedPoint1616(0x0000, 0),
	WalkingStyle.escalator: FixedPoint1616(0x90D0, 0),
	WalkingStyle.stairs: FixedPoint1616(0x90D0, 0),
];

/** Masks for the allowed input directions for each walking style
 * Original_Address: $(DOLLAR)C3E12C
 */
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

/** X offsets to be added to player's position when searching for overworld objects to interact with
 * Original_Address: $(DOLLAR)C3E148
 */
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

/** Y offsets to be added to player's position when searching for overworld objects to interact with
 * Original_Address: $(DOLLAR)C3E158
 */
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

/** Opposite direction map used for making entities face other entities
 * Original_Address: $(DOLLAR)C3E168
 */
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

/** Tables for remapping directional movement "randomly" used by mushroomization
 * Original_Address: $(DOLLAR)C3E178
 */
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

/** Directions for the leader to face after door warps
 * Original_Address: $(DOLLAR)C3E1D8
 */
immutable short[4] transitionDirections = [
	Direction.down,
	Direction.up,
	Direction.right,
	Direction.left
];

/** Unused, unreferenced data. Possibly related to stairs
 * Original_Address: $(DOLLAR)C3E1E0
 */
immutable short[4][4] unknownC3E1E0 = [[0, 0, 4, 0], [0, 0, -4, 0], [-4, 0, 0, 0], [4, 0, 0, 0]];

/** Directions for auto-movement when getting on stairs
 * Original_Address: $(DOLLAR)C3E200
 */
immutable short[4] staircaseEntryDirections = [
	StairDirection.upLeft >> 8: Direction.upLeft,
	StairDirection.upRight >> 8: Direction.upRight,
	StairDirection.downLeft >> 8: Direction.downLeft,
	StairDirection.downRight >> 8: Direction.downRight
];

/** Directions for auto-movement after getting off stairs
 * Original_Address: $(DOLLAR)C3E208
 */
immutable short[4] staircaseExitDirections = [
	StairDirection.upLeft >> 8: Direction.right,
	StairDirection.upRight >> 8: Direction.left,
	StairDirection.downLeft >> 8: Direction.right,
	StairDirection.downRight >> 8: Direction.left
];

/** X coordinate offset used for auto-movement destination while getting on stairs
 * Original_Address: $(DOLLAR)C3E210
 */
immutable short[4] staircaseStartOffsetX = [
	StairDirection.upLeft >> 8: 0,
	StairDirection.upRight >> 8: 8,
	StairDirection.downLeft >> 8: 0,
	StairDirection.downRight >> 8: 8
];

/** Y coordinate offset used for auto-movement destination while getting on stairs
 * Original_Address: $(DOLLAR)C3E218
 */
immutable short[4] staircaseStartOffsetY = [
	StairDirection.upLeft >> 8: 0,
	StairDirection.upRight >> 8: 0,
	StairDirection.downLeft >> 8: 8,
	StairDirection.downRight >> 8: 8
];

/** X coordinate offset used for auto-movement destination while getting off stairs
 * Original_Address: $(DOLLAR)C3E220
 */
immutable short[4] staircaseEndOffsetX = [
	StairDirection.upLeft >> 8: 8,
	StairDirection.upRight >> 8: 0,
	StairDirection.downLeft >> 8: 8,
	StairDirection.downRight >> 8: 0
];

/** Y coordinate offset used for auto-movement destination while getting off stairs
 * Original_Address: $(DOLLAR)C3E228
 */
immutable short[4] staircaseEndOffsetY = [
	StairDirection.upLeft >> 8: 8,
	StairDirection.upRight >> 8: 8,
	StairDirection.downLeft >> 8: 0,
	StairDirection.downRight >> 8: 0
];

/** Number of pixels to adjust the X position by for each direction when attempting to interact with something
 *
 * Note: Left is hardcoded to adjust the position by an additional -1 for people, for...some reason?
 * Original_Address: $(DOLLAR)C3E230
 */
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

/** Number of pixels to adjust the Y position by for each direction when attempting to interact with something
 * Original_Address: $(DOLLAR)C3E240
 */
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

// make room for another text speed in configurable builds
version(configurable) {
	enum textSpeedWindow = WindowConfig(0x0003, 0x000E, 0x0010, 0x000C);
} else {
	enum textSpeedWindow = WindowConfig(0x0003, 0x000E, 0x0010, 0x000A);
}

/** Predefined dimensions for each text window
 * Original_Address: $(DOLLAR)C3E250
 */
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

/** Tiles used for the HP/PP meter labels
 *
 * The upper 8 bits are omitted
 * Original_Address: $(DOLLAR)C3E3F8
 */
immutable ubyte[8] hpPPMeterLabelTiles = [
	0x08, 0x09,
	0x18, 0x19,
	0x0A, 0x09,
	0x1A, 0x19,
];

/** Unused tile animation
 *
 * The first tile it refers to doesn't make much sense to flip, so it's likely the tiles changed and this unused animation was never updated
 * Original_Address: $(DOLLAR)C3E400
 */
immutable ushort[3] unusedAnimationC3E400 = [
	TilemapFlag.priority | TilemapFlag.palette1 | 0x015,
	TilemapFlag.priority | TilemapFlag.palette1 | 0x016,
	TilemapFlag.priority | TilemapFlag.palette1 | TilemapFlag.hFlip | 0x015,
];

/** Tile frames for the upper half of the animated menu cursor
 * Original_Address: $(DOLLAR)C3E406
 */
immutable ushort[2] selectionCursorFramesUpper = [
	TilemapFlag.priority | TilemapFlag.palette1 | 0x041,
	TilemapFlag.priority | TilemapFlag.palette1 | 0x28D,
];

/** Tile frames for the lower half of the animated menu cursor
 * Original_Address: $(DOLLAR)C3E40A
 */
immutable ushort[2] selectionCursorFramesLower = [
	TilemapFlag.priority | TilemapFlag.palette1 | 0x051,
	TilemapFlag.priority | TilemapFlag.palette1 | 0x29D,
];

/** Tiles for the auto-battle icon
 * Original_Address: $(DOLLAR)C3E40E
 */
immutable ushort[4] autoBattleArrangement = [
	TilemapFlag.priority | TilemapFlag.palette6 | 0x269,
	TilemapFlag.priority | TilemapFlag.palette6 | 0x26A,
	TilemapFlag.priority | TilemapFlag.palette6 | 0x26B,
	TilemapFlag.priority | TilemapFlag.palette6 | 0x26C,
];

/** Tile frames for the blinking triangle animation used when the game is waiting for player input on dialogue
 * Original_Address: $(DOLLAR)C3E416
 */
immutable ushort[3] blinkingTriangleTiles = [
	TilemapFlag.priority | TilemapFlag.palette7 | 0x014,
	TilemapFlag.priority | TilemapFlag.palette7 | 0x015,
	TilemapFlag.priority | TilemapFlag.palette7 | TilemapFlag.vFlip | 0x011,
];

/** Tile frames for the throbbing pagination arrows used on inventory windows and such
 *
 * Four frames, 4 tiles wide (includes the truncated window border)
 * Original_Address: $(DOLLAR)C3E43C
 */
immutable ushort[][4] paginationArrowTiles = [
	[
		TilemapFlag.priority | TilemapFlag.palette7 | 0x016,
		TilemapFlag.priority | TilemapFlag.palette3 | 0x26D,
		TilemapFlag.priority | TilemapFlag.palette3 | 0x26E,
		TilemapFlag.priority| TilemapFlag.palette7 | TilemapFlag.hFlip | 0x016
	], [
		TilemapFlag.priority | TilemapFlag.palette7 | 0x016,
		TilemapFlag.priority | TilemapFlag.palette3 | 0x27D,
		TilemapFlag.priority | TilemapFlag.palette3 | 0x27E,
		TilemapFlag.priority| TilemapFlag.palette7 | TilemapFlag.hFlip | 0x016
	], [
		TilemapFlag.priority | TilemapFlag.palette7 | 0x016,
		TilemapFlag.priority | TilemapFlag.palette3 | 0x26D,
		TilemapFlag.priority | TilemapFlag.palette3 | 0x040,
		TilemapFlag.priority| TilemapFlag.palette7 | TilemapFlag.hFlip | 0x016
	], [
		TilemapFlag.priority | TilemapFlag.palette7 | 0x016,
		TilemapFlag.priority | TilemapFlag.palette3 | 0x040,
		TilemapFlag.priority | TilemapFlag.palette3 | 0x26E,
		TilemapFlag.priority| TilemapFlag.palette7 | TilemapFlag.hFlip | 0x016
	],
];

/** String for the next page menu option label. This was left untranslated in Earthbound, probably because it only gets used in a debugging menu
 * Original_Address: $(DOLLAR)C3E44C
 */
version(bugfix) {
	immutable ubyte[5] menuNextLabel = ebString!5("Next");
} else {
	immutable ubyte[4] menuNextLabel = ebString!4("そのた"); //tx6 in EB
}

/** Causes text palette 5 (the can-equip HP/PP window flash palette) to blink every 4 frames
 * Original_Address: $(DOLLAR)C3E450
 */
void updateFlashTextPalette() {
	const(RGB)* palette;
	if ((frameCounter & 4) != 0) {
		palette = &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][4];
	} else {
		palette = &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][20];
	}
	memcpy(&palettes[1][4], palette, 8);
	paletteUploadMode = PaletteUpload.full;
}

/** Clear the instant text print flag
 * Original_Address: $(DOLLAR)C3E4CA
 */
void clearInstantPrinting() {
	instantPrinting = 0;
}

/** Set the instant text print flag
 * Original_Address: $(DOLLAR)C3E4D4
 */
void setInstantPrinting() {
	instantPrinting = 1;
}

/** Performs a single frame of window updating, with guaranteed drawing
 *
 * Instant printing is unconditionally enabled after calling this!
 * Original_Address: $(DOLLAR)C3E4E0
 */
void windowTickForceUpdate() {
	clearInstantPrinting();
	windowTick();
	setInstantPrinting();
}

/** Finds the first free window in the stats table suitable for a new window
 * Returns: Index of the windowStats array or -1 if none available
 * Original_Address: $(DOLLAR)C3E4EF
 */
short findFreeWindow() {
	for (short i = 0; i != 8; i++) {
		if (windowStats[i].windowID == -1) {
			return i;
		}
	}
	return -1;
}

/** Closes an open window
 *
 * Has no effect on invalid or already-closed windows
 * Params:
 * 	id = A Window ID
 * Original_Address: $(DOLLAR)C3E521
 */
void closeWindow(short id) {
	if (id == Window.invalid) {
		return;
	}
	// window isn't open
	if (windowTable[id] == -1) {
		return;
	}
	// was the focus window, so unfocus it
	if (currentFocusWindow == id) {
		currentFocusWindow = -1;
	}
	// clear menu
	resetWindowMenu(id);
	// remove window from window prev/next lists
	short nextWindow = windowStats[windowTable[id]].next;
	short prevWindow = windowStats[windowTable[id]].previous;
	if (nextWindow == -1) {
		windowTail = prevWindow;
	} else {
		windowStats[nextWindow].previous = prevWindow;
	}
	if (prevWindow == -1) {
		windowHead = nextWindow;
	} else {
		windowStats[prevWindow].next = nextWindow;
	}
	// mark window as available
	windowStats[windowTable[id]].windowID = -1;
	// remove window from open window list
	short windowIndex = windowTable[id];
	windowTable[id] = -1;
	ushort* windowBuffer = &bg2Buffer[windowStats[windowIndex].y * 32 + windowStats[windowIndex].x];
	ushort* windowContents = windowStats[windowIndex].tilemapBuffer;
	for (short i = 0; i < windowStats[windowIndex].width * windowStats[windowIndex].height; i++) {
		// This was probably supposed to be an && instead of an ||, but it's harmless since these two tiles are locked anyway
		 if ((windowContents[0] != VRAMTextTile.windowBackground) || (windowContents[0] != VRAMTextTile.none)) {
			// Deallocate VWF tiles
			freeTile(windowContents[0]);
		 }
		 // replace tile with background
		windowContents[0] = VRAMTextTile.windowBackground;
		windowContents++;
	}
	// now replace all window tiles with the transparent tile, even the ones we just replaced
	for (short i = 0; i != windowStats[windowIndex].height + 2; i++) {
		for (short j = 0; j != windowStats[windowIndex].width + 2; j++) {
			(windowBuffer++)[0] = VRAMTextTile.none;
		}
		// skip to next line
		windowBuffer += 32 - windowStats[windowIndex].width - 2;
	}
	// prepare to rerender all windows and their text
	resetVWFState();
	// also reset window title state if any
	if (windowStats[windowIndex].titleID != 0) {
		titledWindows[windowStats[windowIndex].titleID - 1] = -1;
	}
	windowStats[windowIndex].titleID = 0;

	redrawAllWindows = 1;
	// clean up pagination
	if (paginationWindow == id) {
		paginationWindow = Window.invalid;
	}
	// do one last tick if requested
	if (extraTickOnWindowClose == 0) {
		windowTickForceUpdate();
		clearInstantPrinting();
	}
	// don't auto-indent the next text line
	vwfIndentNewLine = 0;
}

/** Resets the active party member's (ie the character whose turn it is in battle or has an open inventory window) HP/PP window positioning
 * Original_Address: $(DOLLAR)C3E6F8
 */
void resetActivePartyMemberHPPPWindow() {
	if (battleMenuCurrentCharacterID == -1) {
		return;
	}
	waitUntilNextFrame();
	// clear the old top row of HP/PP window tiles, which are no longer raised and won't be cleared by a redraw
	ushort* hpPPTopTilemap = &bg2Buffer[18 * 32 + (16 - (gameState.playerControlledPartyMemberCount * 7) / 2 + (battleMenuCurrentCharacterID * 7))];
	for (short i = hpPPWindowWidth; i != 0; i--) {
		(hpPPTopTilemap++)[0] = 0;
	}
	battleMenuCurrentCharacterID = -1;
	redrawAllWindows = 1;
}

/** Prints the article for the target's name, if applicable
 * Params:
 * 	whom = 0 for attacker's article, 1 for target's article
 * Original_Address: $(DOLLAR)C3E75D
 */
void printBattlerArticle(short whom) {
	short enemyID;
	if (whom == 0) { // attacker
		if (attackerEnemyID == -1) { // not an enemy
			printAttackerArticle = 0;
			return;
		}
		if (printAttackerArticle != 0) { // we don't want an attacker article
			return;
		}
		enemyID = attackerEnemyID;
	} else { // target
		if (targetEnemyID == -1) { // not an enemy
			printTargetArticle = 0;
			return;
		}
		if (printTargetArticle != 0) { // we don't want a target article
			return;
		}
		enemyID = targetEnemyID;
	}
	// print a 'the' with the right capitalization if the enemy's flag is set
	if (enemyConfigurationTable[enemyID].theFlag != 0) {
		if (lastPrintedCharacter == ebChar('@')) { //starting a new sentence, capitalize it
			printStringAutoNewline(thethe[0].length, &thethe[0][0]);
		} else {
			printStringAutoNewline(thethe[1].length, &thethe[1][0]);
		}
	}
}

/** Resets a window's menu state and frees up its menu options
 * Params:
 * 	window = A currently-open window ID
 * Original_Address: $(DOLLAR)C3E7E3
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

/** Tests if a particular item is equipped on a character
 * Params:
 * 	character = The character (1-based) ID whose equipment is being checked
 * 	item = The item ID to look for
 * Returns: 1 if equipped, 0 otherwise
 * Original_Address: $(DOLLAR)C3E9F7
 */
short testItemIsEquipped(short character, short item) {
	character--;
	if (partyCharacters[character].equipment[EquipmentSlot.weapon] != 0) {
		if (partyCharacters[character].items[partyCharacters[character].equipment[EquipmentSlot.weapon] - 1] == item) {
			return 1;
		}
	}
	if (partyCharacters[character].equipment[EquipmentSlot.body] != 0) {
		if (partyCharacters[character].items[partyCharacters[character].equipment[EquipmentSlot.body] - 1] == item) {
			return 1;
		}
	}
	if (partyCharacters[character].equipment[EquipmentSlot.arms] != 0) {
		if (partyCharacters[character].items[partyCharacters[character].equipment[EquipmentSlot.arms] - 1] == item) {
			return 1;
		}
	}
	if (partyCharacters[character].equipment[EquipmentSlot.other] != 0) {
		if (partyCharacters[character].items[partyCharacters[character].equipment[EquipmentSlot.other] - 1] == item) {
			return 1;
		}
	}
	return 0;
}

unittest {
	assert(!testItemIsEquipped(PartyMember.ness, ItemID.crackedBat));
	partyCharacters[0].items[0] = ItemID.crackedBat;
	partyCharacters[0].equipment[EquipmentSlot.weapon] = 1;
	assert(testItemIsEquipped(PartyMember.ness, ItemID.crackedBat));

	assert(!testItemIsEquipped(PartyMember.ness, ItemID.travelCharm));
	partyCharacters[0].items[1] = ItemID.travelCharm;
	partyCharacters[0].equipment[EquipmentSlot.body] = 2;
	assert(testItemIsEquipped(PartyMember.ness, ItemID.travelCharm));

	assert(!testItemIsEquipped(PartyMember.ness, ItemID.cheapBracelet));
	partyCharacters[0].items[2] = ItemID.cheapBracelet;
	partyCharacters[0].equipment[EquipmentSlot.arms] = 3;
	assert(testItemIsEquipped(PartyMember.ness, ItemID.cheapBracelet));

	assert(!testItemIsEquipped(PartyMember.ness, ItemID.baseballCap));
	partyCharacters[0].items[3] = ItemID.baseballCap;
	partyCharacters[0].equipment[EquipmentSlot.other] = 4;
	assert(testItemIsEquipped(PartyMember.ness, ItemID.baseballCap));
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
		if (testPartyHasItem(PartyMember.any, timedItemTransformationTable[i].item) != 0) {
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
MainRegister unknownC3EE7A(short arg1) {
	MainRegister result;
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
	Font.main: FontConfig(dataID: 0, graphicsID: 0, bytesPerCharacter: 32, height: 16),
	Font.mrSaturn: FontConfig(dataID: 1, graphicsID: 1, bytesPerCharacter: 32, height: 16),
	Font.battle: FontConfig(dataID: 2, graphicsID: 2, bytesPerCharacter: 16, height: 16),
	Font.tiny: FontConfig(dataID: 3, graphicsID: 3, bytesPerCharacter: 8, height: 8),
	Font.large: FontConfig(dataID: 4, graphicsID: 4, bytesPerCharacter: 32, height: 16),
];

@([ROMSource(0x210C7A, 96), ROMSource(0x201359, 96), ROMSource(0x2118DA, 96), ROMSource(0x211F3A, 96), ROMSource(0x21229A, 96)])
immutable(ubyte[])[] fontData;

@([ROMSource(0x210CDA, 3072), ROMSource(0x2013B9, 3072), ROMSource(0x21193A, 1536), ROMSource(0x211F9A, 768), ROMSource(0x2122FA, 3072)])
immutable(ubyte[])[] fontGraphics;

/// $C3F112
immutable ubyte[2][5] psiSuffixes = [
	ebString!2("©"),
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
	if (testIfPartyMemberPresent(PartyMember.jeff) == 0) {
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
immutable ubyte[4] statGrowthDifferenceFactor = [8, 4, 4, 4];

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
	short nonCancellable = 0; // in earlier revisions, this was = quick
	prepareForImmediateDMA();
	if (!nonCancellable) {
		initializeEntitySubsystem();
	} else  {
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
	actionScriptState = ActionScriptState.running;
	if (titleScreenQuickMode == 0) {
		// set all colours to black
		memset(&palettes[0][0], 0, palettes.sizeof);
		paletteUploadMode = PaletteUpload.full;
		// turn off screen for one frame
		setForceBlank();
		// set brightness to maximum
		mirrorINIDISP = 0xF;
		waitUntilNextFrame();
		// load letter palette, prepare a one-second fade in
		// make sure the palette doesn't get uploaded until we're done calculating the fade
		paletteUploadMode = PaletteUpload.none;
		decomp(&titleScreenLetterPalette[0], &palettes[8][0]);
		prepareLoadedPalettesForFade();
		memset(&palettes[0][0], 0, palettes.sizeof);
		prepareLoadedPaletteFadeTables(60, PaletteMask.sprite0);
		paletteUploadMode = PaletteUpload.full;
		for (short i = 0; 60 > i; i++) { // fade in over one second
			updatePaletteFade();
			finishFrame();
		}
	} else {
		fadeIn(4, 1);
		for (short i = 0; 60 > i; i++) { // wait for one second
			finishFrame();
		}
	}
	short playerExited = 0;
	while ((actionScriptState == ActionScriptState.running) || (actionScriptState == ActionScriptState.titleScreenSpecial)) {
		if (nonCancellable == 0) {
			if (((padPress[0] & Pad.a) != 0) || ((padPress[0] & Pad.b) != 0) || ((padPress[0] & Pad.start) != 0)) {
				playerExited = 1;
				break;
			}
		}
		finishFrame();
	}
	if ((titleScreenQuickMode == 0) && (actionScriptState == ActionScriptState.running)) {
		playerExited = cancelTitleScreenSequence();
	}
	fadeOutWithMosaic(1, 4, 0);
	if (nonCancellable == 0) { // always true
		actionScriptState = ActionScriptState.running;
		unknownC474A8(/+0+/);
		initializeEntitySubsystem();
		return playerExited;
	}
	for (short i = 0; i < maxEntities; i++) {
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
		copyToVRAM(VRAMCopyMode.simpleCopyToVRAM, size, destination, cast(ubyte*)&tilemapUpdateRemainingTiles[x04]);
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

/** Palettes used for the brief sprite flash when an enemy is attacking
 * Original_Address: $(DOLLAR)C3F8F1
 */
immutable RGB[16][3] enemyUsingAttackPalettes = [
	[ // physical attack (light gray with dark gray borders)
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
	], [ // psi attack (yellow with red borders)
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
	], [ // other attack (black with gray borders)
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

/** Consonant/vowel pair -> hiragana mappings, used for Mother 2's player name transliteration
 * Original_Address: $(DOLLAR)C3FB45
 */
immutable ubyte[2][5][26] consonantVowelTransliterationPairs = [
	// A	I	U	E	O
	[ebString!2(""), ebString!2(""), ebString!2(""), ebString!2(""), ebString!2("")], // A
	[ebString!2("ぼ"), ebString!2("ば"), ebString!2("び"), ebString!2("ぶ"), ebString!2("べ")], // B
	[ebString!2("か"), ebString!2("し"), ebString!2("く"), ebString!2("せ"), ebString!2("こ")], // C
	[ebString!2("で"), ebString!2("でぃ"), ebString!2("でゅ"), ebString!2("ど"), ebString!2("だ")], // D
	[ebString!2(""), ebString!2(""), ebString!2(""), ebString!2(""), ebString!2("")], // E
	[ebString!2("ふぁ"), ebString!2("ふぃ"), ebString!2("ふ"), ebString!2("ふぇ"), ebString!2("ふぉ")], // F
	[ebString!2("げ"), ebString!2("ご"), ebString!2("が"), ebString!2("ぎ"), ebString!2("ぐ")], // G
	[ebString!2("ふ"), ebString!2("ふ"), ebString!2("ふ"), ebString!2("ふ"), ebString!2("ふ")], // H
	[ebString!2(""), ebString!2(""), ebString!2(""), ebString!2(""), ebString!2("")], // I
	[ebString!2("じゃ"), ebString!2("じ"), ebString!2("じゅ"), ebString!2("じぇ"), ebString!2("じょ")], // J
	[ebString!2("が"), ebString!2("ぎ"), ebString!2("ぐ"), ebString!2("げ"), ebString!2("ご")], // K
	[ebString!2("り"), ebString!2("る"), ebString!2("れ"), ebString!2("ろ"), ebString!2("ら")], // L
	[ebString!2("も"), ebString!2("め"), ebString!2("め"), ebString!2("も"), ebString!2("め")], // M
	[ebString!2("ま"), ebString!2("み"), ebString!2("む"), ebString!2("め"), ebString!2("も")], // N
	[ebString!2(""), ebString!2(""), ebString!2(""), ebString!2(""), ebString!2("")], // O
	[ebString!2("ぱ"), ebString!2("ぴ"), ebString!2("ぷ"), ebString!2("ぺ"), ebString!2("ぽ")], // P
	[ebString!2("くぁ"), ebString!2("くぃ"), ebString!2("くぅ"), ebString!2("くぇ"), ebString!2("くぉ")], // Q
	[ebString!2("れ"), ebString!2("れ"), ebString!2("れ"), ebString!2("れ"), ebString!2("れ")], // R
	[ebString!2("せ"), ebString!2("そ"), ebString!2("さ"), ebString!2("し"), ebString!2("す")], // S
	[ebString!2("て"), ebString!2("てぃ"), ebString!2("とぅ"), ebString!2("てぃ"), ebString!2("たぅ")], // T
	[ebString!2(""), ebString!2(""), ebString!2(""), ebString!2(""), ebString!2("")], // U
	[ebString!2("ば"), ebString!2("び"), ebString!2("ぶ"), ebString!2("べ"), ebString!2("ぼ")], // V
	[ebString!2("うぃ"), ebString!2("うぃ"), ebString!2("う"), ebString!2("うぇ"), ebString!2("うぃ")], // W
	[ebString!2("ざ"), ebString!2("ずぃ"), ebString!2("ず"), ebString!2("ぜ"), ebString!2("ぞ")], // X
	[ebString!2("わ"), ebString!2("い"), ebString!2("う"), ebString!2("いぇ"), ebString!2("を")], // Y
	[ebString!2("ぞ"), ebString!2("ざ"), ebString!2("じ"), ebString!2("ず"), ebString!2("ぜ")], // Z
];

/** Starts a battle animation, automatically selecting the animation depending on the target. No animation if targetting the tiny lil ghost.
 * Returns: 0 if targetting friends, 1 if targetting anything else
 * Params:
 * 	toPartyAnimation = The animation to use if targetting friends
 * 	toEnemyAnimation = The animation to use if targetting enemies
 * Original_Address: $(DOLLAR)C3FAC9
 */
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

/** Normal HP meter speeds, one for each text speed
 * Original_Address: $(DOLLAR)C3FB1F
 */
immutable uint[3] hpMeterSpeeds = [
	0x12000,
	0x11800,
	0x11000,
];

/** Sprite+script combinations to create for the naming sequence
 * Original_Address: $(DOLLAR)C3FD2D
 */
immutable NamingScreenEntity[][7] namingScreenEntities = [
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
	]
];
/** Sprite+exit script combinations to create for the naming sequence
 * Original_Address: $(DOLLAR)C3FD49
 */
immutable NamingScreenEntity[][7] namingScreenExitEntities = [
	[
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

/** Table for configuring the entities that appear on the naming sequence confirmation page
 * Original_Address: $(DOLLAR)C3FD65
 */
immutable FileSelectSummarySpriteConfigEntry[5] fileSelectSummarySpriteConfig = [
	FileSelectSummarySpriteConfigEntry(OverworldSprite.ness, ActionScript.animPeopleWalk0NameSummary, 40, 44),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.paula, ActionScript.animPeopleWalk0NameSummary, 40, 76),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.jeff, ActionScript.animPeopleWalk0NameSummary, 40, 108),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.poo, ActionScript.animPeopleWalk0NameSummary, 40, 140),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.nessDogSleeping, ActionScript.kingSleepingNameSummary, 136, 40)
];

/** Text labels that run the attract mode demos
 * Original_Address: $(DOLLAR)C3FD8D
 */
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

/** Base tile IDs for party member cast text rendering
 * Original_Address: $(DOLLAR)C3FDB5
 */
immutable ushort[4] partyMemberCastTileIDs = [
	0x180,
	0x190,
	0x1A0,
	0x1B0,
];

/** Table for randomly-selected for sale sign customers
 * Original_Address: $(DOLLAR)C3FDBD
 */
immutable ushort[4] forSaleSignSpriteTable = [
	OverworldSprite.guyInBlueClothes,
	OverworldSprite.jamaicanGuy,
	OverworldSprite.mrT,
	OverworldSprite.oldGuyWithCane,
];

/** Does nothing.
 * Original_Address: $(DOLLAR)C3FDC5
 */
short nullC3FDC5() {
	return 0;
}
