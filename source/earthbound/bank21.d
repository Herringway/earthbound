/// intro screen data, town maps, etc
module earthbound.bank21;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.globals;

/** Script for the coffee scene
 * Original_Address: $(DOLLAR)E10000
 */
@ROMSource(0x210000, 1618)
immutable(ubyte)[] coffeeSequenceText;

/** Script for the tea scene
 * Original_Address: $(DOLLAR)E10652
 */
@ROMSource(0x210652, 1332)
immutable(ubyte)[] teaSequenceText;

/** Tile data offsets and widths of the names used in the cast scene
 * Original_Address: $(DOLLAR)E12EFA
 */
immutable CastSequenceFormattingEntry[48] castSequenceFormatting = [
	CastSequenceName.invalid: CastSequenceFormattingEntry(0x0030, 0),
	CastSequenceName.pickyMinch: CastSequenceFormattingEntry(0x0030, 8),
	CastSequenceName.lardnaMinch: CastSequenceFormattingEntry(0x0038, 8),
	CastSequenceName.aloysiusMinch: CastSequenceFormattingEntry(0x0040, 8),
	CastSequenceName.pokeyMinch: CastSequenceFormattingEntry(0x0048, 8),
	CastSequenceName.buzzBuzz: CastSequenceFormattingEntry(0x0050, 6),
	CastSequenceName.lierXAgerate: CastSequenceFormattingEntry(0x0056, 8),
	CastSequenceName.frankFly: CastSequenceFormattingEntry(0x005E, 6),
	CastSequenceName.theSharks: CastSequenceFormattingEntry(0x0064, 6),
	CastSequenceName.bhPirkle: CastSequenceFormattingEntry(0x006A, 6),
	CastSequenceName.captainStrong: CastSequenceFormattingEntry(0x0070, 8),
	CastSequenceName.onettPoliceForce: CastSequenceFormattingEntry(0x0078, 10),
	CastSequenceName.paulasMom: CastSequenceFormattingEntry(0x0082, 10),
	CastSequenceName.paulasDad: CastSequenceFormattingEntry(0x008C, 10),
	CastSequenceName.appleKid: CastSequenceFormattingEntry(0x0096, 6),
	CastSequenceName.mouse: CastSequenceFormattingEntry(0x009C, 4),
	CastSequenceName.orangeKid: CastSequenceFormattingEntry(0x00A0, 6),
	CastSequenceName.mrEverdred: CastSequenceFormattingEntry(0x00A6, 8),
	CastSequenceName.runawayFive: CastSequenceFormattingEntry(0x00AE, 8),
	CastSequenceName.happyHappyists: CastSequenceFormattingEntry(0x00B6, 10),
	CastSequenceName.carpainter: CastSequenceFormattingEntry(0x00C0, 6),
	CastSequenceName.bubbleMonkey: CastSequenceFormattingEntry(0x00C6, 8),
	CastSequenceName.tony: CastSequenceFormattingEntry(0x00CE, 4),
	CastSequenceName.maxwell: CastSequenceFormattingEntry(0x00D2, 6),
	CastSequenceName.tessie: CastSequenceFormattingEntry(0x00D8, 4),
	CastSequenceName.tessieWatchingClub: CastSequenceFormattingEntry(0x00DC, 12),
	CastSequenceName.brickRoad: CastSequenceFormattingEntry(0x00E8, 6),
	CastSequenceName.drAndonuts: CastSequenceFormattingEntry(0x00EE, 8),
	CastSequenceName.mrSaturnNormalFont: CastSequenceFormattingEntry(0x00F6, 6),
	CastSequenceName.masterBelch: CastSequenceFormattingEntry(0x00FC, 8),
	CastSequenceName.georgeMontague: CastSequenceFormattingEntry(0x0104, 10),
	CastSequenceName.gerardoMontague: CastSequenceFormattingEntry(0x010E, 10),
	CastSequenceName.talahRama: CastSequenceFormattingEntry(0x0118, 8),
	CastSequenceName.geldegardeMonotoli: CastSequenceFormattingEntry(0x0120, 12),
	CastSequenceName.venus: CastSequenceFormattingEntry(0x012C, 4),
	CastSequenceName.starMaster: CastSequenceFormattingEntry(0x0130, 8),
	CastSequenceName.poosMaster: CastSequenceFormattingEntry(0x0138, 12),
	CastSequenceName.dungeonMan: CastSequenceFormattingEntry(0x0144, 8),
	CastSequenceName.nobleWarrior: CastSequenceFormattingEntry(0x014C, 8),
	CastSequenceName.tendaTribesmen: CastSequenceFormattingEntry(0x0154, 10),
	CastSequenceName.flyingMen: CastSequenceFormattingEntry(0x015E, 6),
	CastSequenceName.dad: CastSequenceFormattingEntry(0x0164, 2),
	CastSequenceName.tracy: CastSequenceFormattingEntry(0x0166, 4),
	CastSequenceName.separator: CastSequenceFormattingEntry(0x016A, 2),
	CastSequenceName.mom: CastSequenceFormattingEntry(0x016C, 4),
	CastSequenceName.castHeader: CastSequenceFormattingEntry(0x0010, 4),
	CastSequenceName.castHeaderUnderline: CastSequenceFormattingEntry(0x0014, 4),
	CastSequenceName.mrSaturn: CastSequenceFormattingEntry(0x0020, 12),
];

/** All the data needed to set up the photograph scenes used in the staff credits
 * Original_Address: $(DOLLAR)E12F8A
 */
immutable CreditsPhotograph[32] photographerConfigTable = [
	CreditsPhotograph(
		eventFlag: EventFlag.photo1,
		mapX: 332,
		mapY: 43,
		creditsMapPalettesOffset: 0x0000,
		slideDirection: 0x00,
		slideDistance: 0x00,
		photographerX: 329,
		photographerY: 56,
		partyConfig: [
			Coordinates(331, 45),
			Coordinates(329, 44),
			Coordinates(333, 44),
			Coordinates(335, 43),
			Coordinates(327, 44),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo2,
		mapX: 944,
		mapY: 186,
		creditsMapPalettesOffset: 0x00C0,
		slideDirection: 0x28,
		slideDistance: 0x55,
		photographerX: 938,
		photographerY: 190,
		partyConfig: [
			Coordinates(944, 188),
			Coordinates(942, 189),
			Coordinates(947, 189),
			Coordinates(949, 190),
			Coordinates(939, 188),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo3,
		mapX: 185,
		mapY: 814,
		creditsMapPalettesOffset: 0x0180,
		slideDirection: 0x18,
		slideDistance: 0x55,
		photographerX: 186,
		photographerY: 824,
		partyConfig: [
			Coordinates(190, 818),
			Coordinates(188, 818),
			Coordinates(191, 816),
			Coordinates(183, 818),
			Coordinates(185, 819),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo4,
		mapX: 617,
		mapY: 145,
		creditsMapPalettesOffset: 0x0240,
		slideDirection: 0x38,
		slideDistance: 0x55,
		photographerX: 619,
		photographerY: 149,
		partyConfig: [
			Coordinates(616, 142),
			Coordinates(614, 143),
			Coordinates(613, 141),
			Coordinates(609, 143),
			Coordinates(612, 144),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo5,
		mapX: 729,
		mapY: 155,
		creditsMapPalettesOffset: 0x0240,
		slideDirection: 0x30,
		slideDistance: 0x55,
		photographerX: 731,
		photographerY: 166,
		partyConfig: [
			Coordinates(728, 158),
			Coordinates(730, 157),
			Coordinates(726, 156),
			Coordinates(724, 155),
			Coordinates(732, 156),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo6,
		mapX: 276,
		mapY: 814,
		creditsMapPalettesOffset: 0x0180,
		slideDirection: 0x28,
		slideDistance: 0x55,
		photographerX: 277,
		photographerY: 824,
		partyConfig: [
			Coordinates(275, 818),
			Coordinates(273, 819),
			Coordinates(270, 818),
			Coordinates(278, 818),
			Coordinates(280, 819),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(286, 818, OverworldSprite.gorgeous),
			PhotographerConfigEntryObject(288, 816, OverworldSprite.lucky),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo7,
		mapX: 73,
		mapY: 424,
		creditsMapPalettesOffset: 0x0300,
		slideDirection: 0x08,
		slideDistance: 0x55,
		photographerX: 83,
		photographerY: 426,
		partyConfig: [
			Coordinates(75, 422),
			Coordinates(80, 423),
			Coordinates(73, 421),
			Coordinates(71, 422),
			Coordinates(77, 421),
			Coordinates(69, 420)
		],
		objectConfig: [
			PhotographerConfigEntryObject(82, 419, OverworldSprite.tessieWatcher),
			PhotographerConfigEntryObject(67, 416, OverworldSprite.tessieWatcher),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo8,
		mapX: 195,
		mapY: 442,
		creditsMapPalettesOffset: 0x03C0,
		slideDirection: 0x10,
		slideDistance: 0x55,
		photographerX: 197,
		photographerY: 450,
		partyConfig: [
			Coordinates(197, 441),
			Coordinates(200, 441),
			Coordinates(196, 440),
			Coordinates(201, 440),
			Coordinates(202, 441),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(190, 447, OverworldSprite.madDuck),
			PhotographerConfigEntryObject(186, 441, OverworldSprite.rowdyMouse),
			PhotographerConfigEntryObject(205, 444, OverworldSprite.rowdyMouse),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo9,
		mapX: 721,
		mapY: 1052,
		creditsMapPalettesOffset: 0x0480,
		slideDirection: 0x38,
		slideDistance: 0x55,
		photographerX: 714,
		photographerY: 1054,
		partyConfig: [
			Coordinates(721, 1048),
			Coordinates(719, 1048),
			Coordinates(717, 1047),
			Coordinates(715, 1048),
			Coordinates(717, 1049),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(714, 1056, OverworldSprite.zombiePossessor),
			PhotographerConfigEntryObject(725, 1057, OverworldSprite.zombiePossessor),
			PhotographerConfigEntryObject(724, 1046, OverworldSprite.zombiePossessor),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo10,
		mapX: 801,
		mapY: 32,
		creditsMapPalettesOffset: 0x0540,
		slideDirection: 0x10,
		slideDistance: 0x55,
		photographerX: 816,
		photographerY: 45,
		partyConfig: [
			Coordinates(807, 36),
			Coordinates(809, 37),
			Coordinates(811, 38),
			Coordinates(810, 40),
			Coordinates(813, 40),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo11,
		mapX: 70,
		mapY: 920,
		creditsMapPalettesOffset: 0x0600,
		slideDirection: 0x18,
		slideDistance: 0x55,
		photographerX: 72,
		photographerY: 929,
		partyConfig: [
			Coordinates(70, 920),
			Coordinates(72, 920),
			Coordinates(73, 918),
			Coordinates(68, 923),
			Coordinates(74, 922),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo12,
		mapX: 700,
		mapY: 1138,
		creditsMapPalettesOffset: 0x0480,
		slideDirection: 0x28,
		slideDistance: 0x55,
		photographerX: 697,
		photographerY: 1152,
		partyConfig: [
			Coordinates(699, 1145),
			Coordinates(701, 1145),
			Coordinates(697, 1144),
			Coordinates(703, 1144),
			Coordinates(705, 1142),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(691, 1142, OverworldSprite.littleKidInBlue),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo13,
		mapX: 255,
		mapY: 1115,
		creditsMapPalettesOffset: 0x06C0,
		slideDirection: 0x18,
		slideDistance: 0x55,
		photographerX: 254,
		photographerY: 1127,
		partyConfig: [
			Coordinates(253, 1117),
			Coordinates(255, 1116),
			Coordinates(257, 1117),
			Coordinates(259, 1118),
			Coordinates(251, 1118),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(264, 1121, OverworldSprite.crestedBooka),
			PhotographerConfigEntryObject(263, 1112, OverworldSprite.smilinSphere),
			PhotographerConfigEntryObject(247, 1123, OverworldSprite.skelpion),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo14,
		mapX: 465,
		mapY: 1203,
		creditsMapPalettesOffset: 0x06C0,
		slideDirection: 0x38,
		slideDistance: 0x55,
		photographerX: 462,
		photographerY: 1210,
		partyConfig: [
			Coordinates(465, 1203),
			Coordinates(467, 1204),
			Coordinates(469, 1205),
			Coordinates(462, 1204),
			Coordinates(471, 1204),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(459, 1197, OverworldSprite.minersBrother),
			PhotographerConfigEntryObject(466, 1213, OverworldSprite.bigDirtScooper),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo15,
		mapX: 708,
		mapY: 1250,
		creditsMapPalettesOffset: 0x06C0,
		slideDirection: 0x28,
		slideDistance: 0x55,
		photographerX: 713,
		photographerY: 1255,
		partyConfig: [
			Coordinates(708, 1250),
			Coordinates(710, 1249),
			Coordinates(706, 1249),
			Coordinates(712, 1248),
			Coordinates(704, 1248),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo16,
		mapX: 399,
		mapY: 532,
		creditsMapPalettesOffset: 0x0780,
		slideDirection: 0x18,
		slideDistance: 0x55,
		photographerX: 411,
		photographerY: 547,
		partyConfig: [
			Coordinates(404, 538),
			Coordinates(406, 539),
			Coordinates(408, 538),
			Coordinates(410, 536),
			Coordinates(409, 540),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo17,
		mapX: 583,
		mapY: 655,
		creditsMapPalettesOffset: 0x0840,
		slideDirection: 0x30,
		slideDistance: 0x55,
		photographerX: 578,
		photographerY: 667,
		partyConfig: [
			Coordinates(582, 658),
			Coordinates(584, 658),
			Coordinates(586, 658),
			Coordinates(588, 659),
			Coordinates(585, 660),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo18,
		mapX: 448,
		mapY: 494,
		creditsMapPalettesOffset: 0x0780,
		slideDirection: 0x08,
		slideDistance: 0x55,
		photographerX: 440,
		photographerY: 504,
		partyConfig: [
			Coordinates(447, 496),
			Coordinates(446, 495),
			Coordinates(448, 494),
			Coordinates(449, 492),
			Coordinates(449, 490),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo19,
		mapX: 566,
		mapY: 769,
		creditsMapPalettesOffset: 0x0900,
		slideDirection: 0x38,
		slideDistance: 0x55,
		photographerX: 562,
		photographerY: 777,
		partyConfig: [
			Coordinates(568, 771),
			Coordinates(570, 772),
			Coordinates(566, 771),
			Coordinates(564, 772),
			Coordinates(571, 771),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo20,
		mapX: 856,
		mapY: 1037,
		creditsMapPalettesOffset: 0x09C0,
		slideDirection: 0x18,
		slideDistance: 0x55,
		photographerX: 860,
		photographerY: 1046,
		partyConfig: [
			Coordinates(857, 1041),
			Coordinates(858, 1039),
			Coordinates(854, 1039),
			Coordinates(856, 1037),
			Coordinates(859, 1037),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo21,
		mapX: 576,
		mapY: 436,
		creditsMapPalettesOffset: 0x0A80,
		slideDirection: 0x28,
		slideDistance: 0x55,
		photographerX: 573,
		photographerY: 451,
		partyConfig: [
			Coordinates(574, 443),
			Coordinates(576, 444),
			Coordinates(578, 443),
			Coordinates(571, 443),
			Coordinates(579, 442),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo22,
		mapX: 39,
		mapY: 552,
		creditsMapPalettesOffset: 0x0300,
		slideDirection: 0x38,
		slideDistance: 0x55,
		photographerX: 43,
		photographerY: 562,
		partyConfig: [
			Coordinates(42, 556),
			Coordinates(44, 554),
			Coordinates(39, 554),
			Coordinates(43, 550),
			Coordinates(46, 555),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(33, 549, OverworldSprite.caveBoy),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo23,
		mapX: 565,
		mapY: 343,
		creditsMapPalettesOffset: 0x0B40,
		slideDirection: 0x10,
		slideDistance: 0x55,
		photographerX: 559,
		photographerY: 352,
		partyConfig: [
			Coordinates(565, 344),
			Coordinates(567, 344),
			Coordinates(569, 344),
			Coordinates(571, 344),
			Coordinates(563, 344),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo24,
		mapX: 888,
		mapY: 1134,
		creditsMapPalettesOffset: 0x0C00,
		slideDirection: 0x38,
		slideDistance: 0x55,
		photographerX: 890,
		photographerY: 1143,
		partyConfig: [
			Coordinates(886, 1135),
			Coordinates(888, 1135),
			Coordinates(890, 1135),
			Coordinates(892, 1138),
			Coordinates(889, 1136),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(898, 1134, OverworldSprite.drinkingGuy),
			PhotographerConfigEntryObject(882, 1134, OverworldSprite.brunetteShoppingLady),
			PhotographerConfigEntryObject(890, 1142, OverworldSprite.oldLadyWithCane),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo25,
		mapX: 760,
		mapY: 370,
		creditsMapPalettesOffset: 0x0B40,
		slideDirection: 0x30,
		slideDistance: 0x55,
		photographerX: 757,
		photographerY: 380,
		partyConfig: [
			Coordinates(759, 374),
			Coordinates(761, 373),
			Coordinates(763, 374),
			Coordinates(762, 370),
			Coordinates(757, 367),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo26,
		mapX: 868,
		mapY: 362,
		creditsMapPalettesOffset: 0x0B40,
		slideDirection: 0x08,
		slideDistance: 0x55,
		photographerX: 866,
		photographerY: 371,
		partyConfig: [
			Coordinates(866, 358),
			Coordinates(868, 357),
			Coordinates(872, 357),
			Coordinates(874, 358),
			Coordinates(863, 358),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo27,
		mapX: 186,
		mapY: 529,
		creditsMapPalettesOffset: 0x0CC0,
		slideDirection: 0x10,
		slideDistance: 0x55,
		photographerX: 190,
		photographerY: 536,
		partyConfig: [
			Coordinates(185, 530),
			Coordinates(187, 529),
			Coordinates(189, 531),
			Coordinates(191, 532),
			Coordinates(182, 532),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo28,
		mapX: 224,
		mapY: 611,
		creditsMapPalettesOffset: 0x0CC0,
		slideDirection: 0x18,
		slideDistance: 0x55,
		photographerX: 229,
		photographerY: 615,
		partyConfig: [
			Coordinates(226, 614),
			Coordinates(227, 612),
			Coordinates(224, 613),
			Coordinates(229, 613),
			Coordinates(220, 613),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(223, 611, OverworldSprite.pyramidDoor),
			PhotographerConfigEntryObject(225, 611, OverworldSprite.pyramidDoor),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo29,
		mapX: 160,
		mapY: 669,
		creditsMapPalettesOffset: 0x0CC0,
		slideDirection: 0x30,
		slideDistance: 0x55,
		photographerX: 165,
		photographerY: 677,
		partyConfig: [
			Coordinates(164, 672),
			Coordinates(162, 671),
			Coordinates(160, 671),
			Coordinates(158, 670),
			Coordinates(160, 668),
			Coordinates(166, 671)
		],
		objectConfig: [
			PhotographerConfigEntryObject(171, 611, OverworldSprite.dungeonMan),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject(),
			PhotographerConfigEntryObject()
		]
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo30,
		mapX: 657,
		mapY: 958,
		creditsMapPalettesOffset: 0x0D80,
		slideDirection: 0x38,
		slideDistance: 0x55,
		photographerX: 652,
		photographerY: 964,
		partyConfig: [
			Coordinates(658, 960),
			Coordinates(656, 958),
			Coordinates(657, 956),
			Coordinates(660, 957),
			Coordinates(661, 959),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo31,
		mapX: 49,
		mapY: 39,
		creditsMapPalettesOffset: 0x0E40,
		slideDirection: 0x10,
		slideDistance: 0x55,
		photographerX: 51,
		photographerY: 47,
		partyConfig: [
			Coordinates(50, 38),
			Coordinates(48, 37),
			Coordinates(53, 36),
			Coordinates(46, 36),
			Coordinates(51, 35),
			Coordinates(0, 0)
		],
	),
	CreditsPhotograph(
		eventFlag: EventFlag.photo32,
		mapX: 48,
		mapY: 955,
		creditsMapPalettesOffset: 0x0600,
		slideDirection: 0x00,
		slideDistance: 0x00,
		photographerX: 49,
		photographerY: 969,
		partyConfig: [
			Coordinates(48, 953),
			Coordinates(52, 952),
			Coordinates(50, 950),
			Coordinates(46, 951),
			Coordinates(0, 0),
			Coordinates(0, 0)
		],
		objectConfig: [
			PhotographerConfigEntryObject(49, 956, OverworldSprite.drAndonuts),
			PhotographerConfigEntryObject(44, 955, OverworldSprite.appleKid),
			PhotographerConfigEntryObject(53, 955, OverworldSprite.mrSaturn),
			PhotographerConfigEntryObject(42, 951, OverworldSprite.miner)
		]
	),
];

/** Palette data used for the staff credits photographs (compressed)
 * Original_Address: $(DOLLAR)E1374A
 */
@ROMSource(0x21374A, 2549)
immutable(ubyte)[] photographMapPalettes;

/** Text data used for the staff credits
 * Original_Address: $(DOLLAR)E1413F
 */
immutable ubyte[] staffText = convertStaffText("
	\x03\x02
	\x02STAFF\x00
	\x02_____\x00
	\x03\x06
	\x01PRODUCED AND DIRECTED BY\x00
	\x02SHIGESATO ITOI\x00
	\x03\x02
	\x01WRITTEN BY\x00
	\x02SHIGESATO ITOI\x00
	\x03\x02
	\x01MUSIC BY\x00
	\x02KEIICHI SUZUKI\x00
	\x02HIROKAZU TANAKA\x00
	\x03\x06
	\x01GAME DESIGNER\x00
	\x02AKIHIKO MIURA\x00
	\x03\x02
	\x01ART DIRECTOR\x00
	\x02KOUICHI OOYAMA\x00
	\x03\x02
	\x01SOUND DIRECTOR\x00
	\x02HIROKAZU TANAKA\x00
	\x03\x02
	\x01PROGRAM DIRECTOR\x00
	\x02SATORU IWATA\x00
	\x03\x02
	\x01U.S. CONVERSION DIRECTOR\x00
	\x02KOUJI MALTA\x00
	\x03\x02
	\x01TRANSLATION DIRECTORS\x00
	\x02MARCUS LINDBLOM\x00
	\x02MASAYUKI MIURA\x00
	\x03\x06
	\x01PROGRAMMERS\x00
	\x02SATORU IWATA\x00
	\x02SATOSHI MITSUHARA\x00
	\x02YOSHIMI TAKAHASHI\x00
	\x02SEIJI OTOGURO\x00
	\x02BOU NAKAJIMA\x00
	\x02SEIKA ABE\x00
	\x02YOSHIKI SUZUKI\x00
	\x02JUN YAMAZAKI\x00
	\x02TOSHIYUKI UENO\x00
	\x02TAKASHI SASAKI\x00
	\x02TAKASHI SAKUMA\x00
	\x02KAZUO SATO\x00
	\x02KOUJI MALTA\x00
	\x03\x02
	\x01SOUND PROGRAMMER\x00
	\x02HIROKAZU TANAKA\x00
	\x03\x02
	\x01SYSTEM ENGINEERING\x00
	\x02MAKOTO KANAI\x00
	\x02TAKASHI SAKUMA\x00
	\x03\x06
	\x01GRAPHICS ARTISTS\x00
	\x02KOUICHI OOYAMA\x00
	\x02HIROYUKI SAKIYAMA\x00
	\x02KOUICHI YAMADA\x00
	\x02MAKIO KATAOKA\x00
	\x02TETSUYA NOTOYA\x00
	\x02YASUNORI YANAGISAWA\x00
	\x03\x02
	\x01SPECIAL EFFECTS ARTIST\x00
	\x02TSUNEKAZ ISHIHARA\x00
	\x03\x02
	\x01FONT DESIGNERS\x00
	\x02AKIHIKO MIURA\x00
	\x02KOUICHI OOYAMA\x00
	\x03\x02
	\x01CONCEPT OF SATURN FONT BY\x00
	\x02SHIGESATO ITOI\x00
	\x03\x06
	\x01GRAPHICS DATA MANAGER\x00
	\x02YASUNORI YANAGISAWA\x00
	\x03\x02
	\x01MESSAGE DATA MANAGERS\x00
	\x02MASAYUKI MIURA\x00
	\x02HITOSHI MATSUI\x00
	\x03\x06
	\x01ADDITIONAL MUSIC COMPOSED BY\x00
	\x02HIROSHI KANAZU\x00
	\x02TOSHIYUKI UENO\x00
	\x03\x02
	\x01SOUND STAFF\x00
	\x02TOSHIYUKI UENO\x00
	\x02KOZUE ISHIKAWA\x00
	\x03\x06
	\x01ASSISTANT PROGRAMMERS\x00
	\x02IKUHO HAGIYA\x00
	\x02KATSUYOSHI IRIE\x00
	\x03\x02
	\x01ASSISTANT GAME DESIGNERS\x00
	\x02KOUICHI OOYAMA\x00
	\x02TAKEHIKO MASUDA\x00
	\x02CHIAKI YOSHIZAWA\x00
	\x02MASAYUKI MIURA\x00
	\x02AKIHITO TODA\x00
	\x02HITOSHI MATSUI\x00
	\x02KATSUYOSHI IRIE\x00
	\x03\x02
	\x01ASSISTANT SCENARIO WRITERS\x00
	\x02MASAYUKI MIURA\x00
	\x02AKIHITO TODA\x00
	\x02HIROYUKI JINNAI\x00
	\x03\x02
	\x01ENGLISH TEXT WRITERS\x00
	\x02MARCUS LINDBLOM\x00
	\x02DAN OWSEN\x00
	\x03\x02
	\x01TRANSLATORS\x00
	\x02KEIKO TAMURA\x00
	\x02YUKA NAKATA\x00
	\x03\x06
	\x01CHIEF DEBUGGERS\x00
	\x02TAKUMI AKABANE\x00
	\x02HITOSHI MATSUI\x00
	\x03\x06
	\x01NOA DEBUG COORDINATORS\x00
	\x02SEAN O'CONNOR\x00
	\x02MICHAEL KELBAUGH\x00
	\x03\x06
	\x01APE DEBUGGING TEAM\x00
	\x02TAKAHIRO NAGAI\x00
	\x02JUNICHI AKAMA\x00
	\x02AKIRA MATSUMOTO\x00
	\x03\x06
	\x01NINTENDO DEBUG COORDINATORS\x00
	\x02TOHRU HASHIMOTO\x00
	\x02TATSUYA HISHIDA\x00
	\x03\x02
	\x01NINTENDO DEBUGGING TEAM\x00
	\x02KAZUHIDE OHGOE\x00
	\x02ATSUSHI MIYAKE\x00
	\x02HAJIME NAKAMURA\x00
	\x02MAO HAMAMOTO\x00
	\x02MAYUMI TADA\x00
	\x02MAKOTO KEDOUIN\x00
	\x02KIMIKO TSUCHIDA\x00
	\x02SAYAKA KOMURA\x00
	\x03\x02
	\x01MAP CHECKERS\x00
	\x02MAPPER KOJIMA\x00
	\x02KATSUYOSHI IRIE\x00
	\x03\x06
	\x01SAMPLING VOICES\x00
	\x02SHIGESATO OK? ITOI\x00
	\x02YUKARI WHISTLE SAITO\x00
	\x02HIROKAZU BELCH KOYANO\x00
	\x02ETSUKO VENUS KAWANO\x00
	\x02TAKASHI MU WATANABE\x00
	\x03\x02
	\x01OPENING ROCK GUITAR\x00
	\x02M.D.SEEGER\x00
	\x03\x06
	\x01HARDWARE SUPPORT\x00
	\x02HIRONOBU KAKUI\x00
	\x02SHIGEKI YAMASHIRO\x00
	\x03\x06
	\x01PRODUCTION MANAGERS\x00
	\x02TAKASHI KAWAGUCHI\x00
	\x02KEIZO KATO\x00
	\x02IKUO HYAKUTA\x00
	\x02YUKARI SAITO\x00
	\x03\x02
	\x01COORDINATORS\x00
	\x02TAKASHI WATANABE\x00
	\x02RYO KAGAWA\x00
	\x02HIROYUKI JINNAI\x00
	\x02ETSUKO KAWANO\x00
	\x02KAZUYUKI YAMAMOTO\x00
	\x02ATSUKO KAWAHARA\x00
	\x03\x06
	\x01SOUND PRODUCERS\x00
	\x02AKIO OHMORI\x00
	\x02RITSUO KAMIMURA\x00
	\x03\x06
	\x01SPECIAL THANKS TO\x00
	\x02KENJI ANDO\x00
	\x02MIYUKI KURE\x00
	\x02TAKAYUKI ONODERA\x00
	\x02FUKASHI OMORITA\x00
	\x02YUKIO TAKAHASHI\x00
	\x02KAZUHIKO AMEMIYA\x00
	\x02YASUHIRO KUMAGAI\x00
	\x02YOSHIO HONGO\x00
	\x02NAOKO KANAZAWA\x00
	\x02BENIMARU ITOH\x00
	\x02MOTOHIRO ISHII\x00
	\x02HIROKAZU KOYANO\x00
	\x02MASAO TOTTORI\x00
	\x02NOBUYASU MAKINO\x00
	\x02HIROMI TAMAGAWA\x00
	\x02NANCY YOSHITAKE\x00
	\x03\x02
	\x02AND MANY OTHERS\x00
	\x03\x06
	\x01THE PRODUCERS WISH TO THANK\x00
	\x02ISHEL ARTVISION\x00
	\x02MOONRIDERS OFFICE\x00
	\x02SEDIC INC.\x00
	\x02SETA CO.,LTD.\x00
	\x02LUCKY NICE\x00
	\x02OKUBO DESIGN STUDIO\x00
	\x02ON ASSOCIATES\x00
	\x02SAI KOUBOU\x00
	\x02ASHURA OFFICE\x00
	\x02SHOGAKUKAN\x00
	\x02SHINCHO SHA\x00
	\x03\x06
	\x01CHIEF COORDINATOR\x00
	\x02MARCUS LINDBLOM\x00
	\x03\x06
	\x01LINE PRODUCER\x00
	\x02TSUNEKAZ ISHIHARA\x00
	\x03\x06
	\x01COPRODUCER\x00
	\x02SATORU IWATA\x00
	\x03\x06
	\x01NOA PRODUCER\x00
	\x02MIKE FUKUDA\x00
	\x03\x06
	\x01SUPERVISOR\x00
	\x02SHIGERU MIYAMOTO\x00
	\x03\x06
	\x01EXECUTIVE PRODUCERS\x00
	\x02HIROSHI YAMAUCHI\x00
	\x02MINORU ARAKAWA\x00
	\x03\x06
	\x01PRESENTED BY\x00
	\x02NINTENDO\x00
	\x03\x02
	\x01IN ASSOCIATION WITH\x00
	\x02APE INC.\x00
	\x03\x02
	\x01AND\x00
	\x02HAL LABORATORY,INC.\x00
	\x03\x0C
	\x01AND...\x00
	\x01 \x00
	\x03\x0E
	\x01PLAYER\x00
	\x04
	\x03\x0D
	\xFF
");

/** Likely was meant to show info on a battler for debugging purposes. Only input handling remains in the final game
 * Original_Address: $(DOLLAR)E14DE8
 */
void debugBattlerInfo() {
	short x12 = 1;
	short x10 = 0;
	while (true) {
		while (battlersTable[x10].consciousness == 0) {
			x10 += x12;
			if (0 > x10) {
				x10 = battlersTable.length - 1;
			}
			if (battlersTable.length > x10) {
				x10 = 0;
			}
		}
		nullC1E1A2(&battlersTable[x10]);
		windowTick();
		while (true) {
			waitUntilNextFrame();
			if ((padHeld[0] & Pad.right) != 0) {
				x12 = 1;
				break;
			} else if ((padHeld[0] & Pad.left) != 0) {
				x12 = -1;
				break;
			} else if (padPress[0] != 0) {
				closeFocusWindow();
				return;
			}
		}
		x10 += x12;
		if (0 > x10) {
			x10 = battlersTable.length - 1;
		}
		if (battlersTable.length <= x10) {
			x10 = 0;
		}
		closeFocusWindow();
	}
}

/** Tilemap for the second splash screen (compressed)
 * Original_Address: $(DOLLAR)E14EC1
 */
@ROMSource(0x214EC1, 105)
immutable(ubyte)[] splashScreen2Tilemap;

/** Tile data for the second splash screen (compressed)
 * Original_Address: $(DOLLAR)E14F2A
 */
@ROMSource(0x214F2A, 518)
immutable(ubyte)[] splashScreen2Tiles;

/** Palette for the second splash screen (compressed)
 * Original_Address: $(DOLLAR)E15130
 */
@ROMSource(0x215130, 68)
immutable(ubyte)[] splashScreen2Palette;

/** Tilemap for the third splash screen (compressed)
 * Original_Address: $(DOLLAR)E15174
 */
@ROMSource(0x215174, 116)
immutable(ubyte)[] splashScreen3Tilemap;

/** Tile data for the third splash screen (compressed)
 * Original_Address: $(DOLLAR)E151E8
 */
@ROMSource(0x2151E8, 464)
immutable(ubyte)[] splashScreen3Tiles;

/** Palette for the third splash screen (compressed)
 * Original_Address: $(DOLLAR)E153B8
 */
@ROMSource(0x2153B8, 157)
immutable(ubyte)[] splashScreen3Palette;

/** The tilemap for the first splash screen (compressed)
 * Original_Address: $(DOLLAR)E15455
 */
@ROMSource(0x215455, 73)
immutable(ubyte)[] splashScreen1Tilemap;

/** Tile data for the first splash screen (compressed)
 * Original_Address: $(DOLLAR)E1549E
 */
@ROMSource(0x21549E, 241)
immutable(ubyte)[] splashScreen1Tiles;

/** Palette for the first splash screen (compressed)
 * Original_Address: $(DOLLAR)E1558F
 */
@ROMSource(0x21558F, 68)
immutable(ubyte)[] splashScreen1Palette;

/** The tilemap for the gas station intro screen (compressed)
 * Original_Address: $(DOLLAR)E155D3
 */
@ROMSource(0x2155D3, 1376)
immutable(ubyte)[] gasStationTilemap;

/** The 8bpp tile data for the gas station intro screen (compressed)
 * Original_Address: $(DOLLAR)E15B33
 */
@ROMSource(0x215B33, 20100)
immutable(ubyte)[] gasStationTiles;

/** The 8bpp normal palette for the gas station intro screen (compressed)
 * Original_Address: $(DOLLAR)E1A9B7
 */
@ROMSource(0x21A9B7, 166)
immutable(ubyte)[] gasStationPalette;

/** The 8bpp flash palette for the gas station intro screen (compressed)
 * Original_Address: $(DOLLAR)E1AA5D
 */
@ROMSource(0x21AA5D, 130)
immutable(ubyte)[] gasStationFlashPalette;

/** Tilemap for the Itoi production text overlay in attract mode (compressed)
 * Original_Address: $(DOLLAR)E1AADF
 */
@ROMSource(0x21AADF, 108)
immutable(ubyte)[] attractModeOverlay1Tilemap;

/** Tile data for the Itoi production text overlay in attract mode (compressed)
 * Original_Address: $(DOLLAR)E1AB4B
 */
@ROMSource(0x21AB4B, 438)
immutable(ubyte)[] attractModeOverlay1Tiles;

/** Tilemap for the Nintendo presentation text overlay in attract mode (compressed)
 * Original_Address: $(DOLLAR)E1AD01
 */
@ROMSource(0x21AD01, 77)
immutable(ubyte)[] attractModeOverlay2Tilemap;

/** Tile data for the Nintendo presentation text overlay in attract mode (compressed)
 * Original_Address: $(DOLLAR)E1AD4E
 */
@ROMSource(0x21AD4E, 289)
immutable(ubyte)[] attractModeOverlay2Tiles;

/** The palette used by the attract mode's text overlays (compressed)
 * Original_Address: $(DOLLAR)E1AE6F
 */
@ROMSource(0x21AE6F, 13)
immutable(ubyte)[] attractModeOverlayPalette;

/** The initial all-white palette used for the letters on the title screen (compressed)
 * Original_Address: $(DOLLAR)E1AE7C
 */
@ROMSource(0x21AE7C, 7)
immutable(ubyte)[] titleScreenLetterPalette;

/** Palettes used for the shimmer effect on the title screen letters (compressed)
 * Original_Address: $(DOLLAR)E1AE83
 */
@ROMSource(0x21AE83, 122)
immutable(ubyte)[] titleScreenLetterShimmerPalette;

/** Palettes used for the glow effect on the title screen letters (compressed)
 * Original_Address: $(DOLLAR)E1AEFD
 */
@ROMSource(0x21AEFD, 128)
immutable(ubyte)[] titleScreenLetterGlowPalette;

/** Tilemap for the title screen background (compressed)
 * Original_Address: $(DOLLAR)E1AF7D
 */
@ROMSource(0x21AF7D, 660)
immutable(ubyte)[] titleScreenTilemap;

/** Tile data for the title screen background (compressed)
 * Original_Address: $(DOLLAR)E1B211
 */
@ROMSource(0x21B211, 5332)
immutable(ubyte)[] titleScreenTiles;

/** Tile data for the title screen letters (compressed)
 * Original_Address: $(DOLLAR)E1C6E5
 */
@ROMSource(0x21C6E5, 1788)
immutable(ubyte)[] titleScreenLetterTiles;

/** Palettes used on the title screen (compressed)
 * Original_Address: $(DOLLAR)E1CDE1
 */
@ROMSource(0x21CDE1, 39)
immutable(ubyte)[] titleScreenPalette;

/** Spritemaps making up each letter (except B) of the EarthBound title screen logo
 * Original_Address: $(DOLLAR)E1CE08
 */
immutable SpriteMap*[9] titleScreenLetterSpriteMaps = [
	[
		SpriteMap(0x10, 0x52, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x42, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x40, 0x30, 0xF4, 0x01),
		SpriteMap(0x00, 0x32, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x22, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x20, 0x30, 0xF4, 0x01),
		SpriteMap(0xF0, 0x12, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x02, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x00, 0x30, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x55, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x45, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x43, 0x30, 0xF4, 0x01),
		SpriteMap(0x00, 0x35, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x25, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x23, 0x30, 0xF4, 0x01),
		SpriteMap(0xF0, 0x15, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x05, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x03, 0x30, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x58, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x48, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x46, 0x30, 0xF4, 0x01),
		SpriteMap(0x00, 0x38, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x28, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x26, 0x30, 0xF4, 0x01),
		SpriteMap(0xF0, 0x18, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x08, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x06, 0x30, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x5B, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x4B, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x49, 0x30, 0xF4, 0x01),
		SpriteMap(0x00, 0x3B, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x2B, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x29, 0x30, 0xF4, 0x01),
		SpriteMap(0xF0, 0x1B, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x0B, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x09, 0x30, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x5E, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x4E, 0x30, 0x04, 0x00),
		SpriteMap(0x08, 0x4C, 0x30, 0xF4, 0x01),
		SpriteMap(0x00, 0x3E, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x2E, 0x30, 0x04, 0x00),
		SpriteMap(0xF8, 0x2C, 0x30, 0xF4, 0x01),
		SpriteMap(0xF0, 0x1E, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x0E, 0x30, 0x04, 0x00),
		SpriteMap(0xE8, 0x0C, 0x30, 0xF4, 0x81),
	],
	[
		SpriteMap(0x08, 0x40, 0x31, 0xFC, 0x01),
		SpriteMap(0xF8, 0x20, 0x31, 0xFC, 0x01),
		SpriteMap(0xE8, 0x00, 0x31, 0xFC, 0x01),
		SpriteMap(0x10, 0x5F, 0x30, 0xF4, 0x00),
		SpriteMap(0x08, 0x4F, 0x30, 0xF4, 0x00),
		SpriteMap(0x00, 0x3F, 0x30, 0xF4, 0x00),
		SpriteMap(0xF8, 0x2F, 0x30, 0xF4, 0x00),
		SpriteMap(0xF0, 0x1F, 0x30, 0xF4, 0x00),
		SpriteMap(0xE8, 0x0F, 0x30, 0xF4, 0x80),
	],
	[
		SpriteMap(0x10, 0x54, 0x31, 0x04, 0x00),
		SpriteMap(0x08, 0x44, 0x31, 0x04, 0x00),
		SpriteMap(0x08, 0x42, 0x31, 0xF4, 0x01),
		SpriteMap(0x00, 0x34, 0x31, 0x04, 0x00),
		SpriteMap(0xF8, 0x24, 0x31, 0x04, 0x00),
		SpriteMap(0xF8, 0x22, 0x31, 0xF4, 0x01),
		SpriteMap(0xF0, 0x14, 0x31, 0x04, 0x00),
		SpriteMap(0xE8, 0x04, 0x31, 0x04, 0x00),
		SpriteMap(0xE8, 0x02, 0x31, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x57, 0x31, 0x04, 0x00),
		SpriteMap(0x08, 0x47, 0x31, 0x04, 0x00),
		SpriteMap(0x08, 0x45, 0x31, 0xF4, 0x01),
		SpriteMap(0x00, 0x37, 0x31, 0x04, 0x00),
		SpriteMap(0xF8, 0x27, 0x31, 0x04, 0x00),
		SpriteMap(0xF8, 0x25, 0x31, 0xF4, 0x01),
		SpriteMap(0xF0, 0x17, 0x31, 0x04, 0x00),
		SpriteMap(0xE8, 0x07, 0x31, 0x04, 0x00),
		SpriteMap(0xE8, 0x05, 0x31, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x5A, 0x31, 0x04, 0x00),
		SpriteMap(0x08, 0x4A, 0x31, 0x04, 0x00),
		SpriteMap(0x08, 0x48, 0x31, 0xF4, 0x01),
		SpriteMap(0x00, 0x3A, 0x31, 0x04, 0x00),
		SpriteMap(0xF8, 0x2A, 0x31, 0x04, 0x00),
		SpriteMap(0xF8, 0x28, 0x31, 0xF4, 0x01),
		SpriteMap(0xF0, 0x1A, 0x31, 0x04, 0x00),
		SpriteMap(0xE8, 0x0A, 0x31, 0x04, 0x00),
		SpriteMap(0xE8, 0x08, 0x31, 0xF4, 0x81),
	]
];

/** Tiles for the game over screen (compressed)
 *
 * Note: There are actually two separate tilesets compressed together here. The second is expected to start at uncompressed offset 0x8000.
 * Original_Address: $(DOLLAR)E1CFAF
 */
@ROMSource(0x21CFAF, 1349)
immutable(ubyte)[] gameOverTiles;

/** Palette data used for the game over screen (compressed)
 * Original_Address: $(DOLLAR)E1D4F4
 */
@ROMSource(0x21D4F4, 244)
immutable(ubyte)[] gameOverPalette;

/** Tilemap used for the game over screen (compressed)
 * Original_Address: $(DOLLAR)E1D5E8
 */
@ROMSource(0x21D5E8, 249)
immutable(ubyte)[] gameOverTilemap;

/** Graphics for the "CAST" and Mr. Saturn name in the cast scene (compressed)
 * Original_Address: $(DOLLAR)E1D6E1
 */
@ROMSource(0x21D6E1, 308)
immutable(ubyte)[] specialCastNamesGraphics;

/** Palette data used for the prerendered cast name text
 * Original_Address: $(DOLLAR)E1D815
 */
@ROMSource(0x21D815, 0x20)
immutable(ubyte)[] castTextPalette;

/** Prerendered name graphics for the cast scene (compressed)
 * Original_Address: $(DOLLAR)E1D835
 */
@ROMSource(0x21D835, 3249)
immutable(ubyte)[] castNamesGraphics;

/** Extra palettes used for some of the sprites in the cast scene (compressed)
 * Original_Address: $(DOLLAR)E1E4E6
 */
@ROMSource(0x21E4E6, 66)
immutable(ubyte)[] castExtraPalettes;

/** Graphics used for the text in the staff credits (compressed)
 * Original_Address: $(DOLLAR)E1E528
 */
@ROMSource(0x21E528, 1004)
immutable(ubyte)[] staffCreditsFontGraphics;

/** Palettes used for the text in the staff credits
 * Original_Address: $(DOLLAR)E1E914
 */
@ROMSource(0x21E914, 16)
immutable(ubyte)[] staffCreditsFontPalette;

/** Unknown. No references to this data exist. Possibly palette data?
 * Original_Address: $(DOLLAR)E1E924
 */
immutable ubyte[] unknownE1E924 = [ 0x04, 0x00, 0x7F, 0x1F, 0x58, 0x32 ];

/** The palette for the photo frame border in the staff credits
 * Original_Address: $(DOLLAR)E1E92A
 */
immutable RGB[16] creditsPhotographBorderPalette = [
	RGB(31, 8, 15),
	RGB(31, 31, 31),
	RGB(0, 31, 1),
	RGB(6, 4, 4),
	RGB(0, 31, 1),
	RGB(0, 31, 1),
	RGB(0, 31, 1),
	RGB(0, 31, 1),
	RGB(0, 31, 1),
	RGB(0, 31, 1),
	RGB(0, 31, 1),
	RGB(0, 31, 1),
	RGB(31, 30, 21),
	RGB(0, 31, 1),
	RGB(21, 10, 9),
	RGB(0, 0, 0),
];

/** Tilemap for the photo frame border in the staff credits (compressed)
 * Original_Address: $(DOLLAR)E1E94A
 */
@ROMSource(0x21E94A, 262)
immutable(ubyte)[] creditsPhotographBorderTilemap;

/** Graphics used for the town map icon sprites (compressed)
 * Original_Address: $(DOLLAR)E1EA50
 */
@ROMSource(0x21EA50, 1907)
immutable(ubyte)[] townMapIconGraphics;

/** Palettes used for the town map icon sprites
 * Original_Address: $(DOLLAR)E1F1C3
 */
@ROMSource(0x21F1C3, 64)
immutable(ubyte)[] townMapIconPalette;

/** Spritemaps for the various town map icons
 * Original_Address: $(DOLLAR)E1F44C
 */
immutable SpriteMap[][24] townMapIconSpritemaps = [
	TownMapLabel.invalid: [
		SpriteMap(0x00, 0x0C, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x0E, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0x2C, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x2D, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x2E, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x2F, 0x32, 0x18, 0x80),
	],
	TownMapLabel.burger: [
		SpriteMap(0x00, 0x0C, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x0E, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0x2C, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x2D, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x2E, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x2F, 0x32, 0x18, 0x80),
	],
	TownMapLabel.bakery: [
		SpriteMap(0x00, 0x90, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x92, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0xB0, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xB1, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xB2, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xB3, 0x32, 0x18, 0x80),
	],
	TownMapLabel.hotel: [
		SpriteMap(0x00, 0xBC, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0xBE, 0x32, 0x10, 0x00),
		SpriteMap(0x08, 0xCE, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xDC, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xDD, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xDE, 0x32, 0x10, 0x80),
	],
	TownMapLabel.restaurant: [
		SpriteMap(0x00, 0x94, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x96, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0xB4, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xB5, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xB6, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xB7, 0x32, 0x18, 0x80),
	],
	TownMapLabel.hospital: [
		SpriteMap(0x00, 0x36, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x38, 0x32, 0x10, 0x01),
		SpriteMap(0x00, 0x3A, 0x32, 0x20, 0x00),
		SpriteMap(0x08, 0x4A, 0x32, 0x20, 0x00),
		SpriteMap(0x10, 0x56, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x57, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x58, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x59, 0x32, 0x18, 0x00),
		SpriteMap(0x10, 0x5A, 0x32, 0x20, 0x80),
	],
	TownMapLabel.shop: [
		SpriteMap(0x00, 0xC0, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0xC2, 0x32, 0x10, 0x00),
		SpriteMap(0x08, 0xD2, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xE0, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xE1, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xE2, 0x32, 0x10, 0x80),
	],
	TownMapLabel.deptStore: [
		SpriteMap(0x00, 0x3B, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x3D, 0x32, 0x10, 0x01),
		SpriteMap(0x00, 0x3F, 0x32, 0x20, 0x00),
		SpriteMap(0x08, 0x4F, 0x32, 0x20, 0x00),
		SpriteMap(0x10, 0x5B, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x5C, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x5D, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x5E, 0x32, 0x18, 0x00),
		SpriteMap(0x10, 0x5F, 0x32, 0x20, 0x80),
	],
	TownMapLabel.busStop: [
		SpriteMap(0x00, 0x6F, 0x32, 0x00, 0x80),
	],
	TownMapLabel.toTwosonSouth: [
		SpriteMap(0x00, 0x60, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x62, 0x32, 0x10, 0x01),
		SpriteMap(0x00, 0x64, 0x32, 0x20, 0x00),
		SpriteMap(0x08, 0x74, 0x32, 0x20, 0x00),
		SpriteMap(0x10, 0x80, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x81, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x82, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x83, 0x32, 0x18, 0x00),
		SpriteMap(0x10, 0x84, 0x32, 0x20, 0x80),
	],
	TownMapLabel.toOnettNorth: [
		SpriteMap(0x00, 0x9C, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x9E, 0x32, 0x10, 0x81),
	],
	TownMapLabel.toThreedEast: [
		SpriteMap(0x00, 0x65, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x67, 0x32, 0x10, 0x01),
		SpriteMap(0x00, 0x69, 0x32, 0x20, 0x00),
		SpriteMap(0x08, 0x79, 0x32, 0x20, 0x00),
		SpriteMap(0x10, 0x85, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x86, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x87, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x88, 0x32, 0x18, 0x00),
		SpriteMap(0x10, 0x89, 0x32, 0x20, 0x80),
	],
	TownMapLabel.toTwosonWest: [
		SpriteMap(0x00, 0x00, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x02, 0x32, 0x10, 0x01),
		SpriteMap(0x00, 0x04, 0x32, 0x20, 0x01),
		SpriteMap(0x10, 0x20, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x21, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x22, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x23, 0x32, 0x18, 0x00),
		SpriteMap(0x10, 0x24, 0x32, 0x20, 0x00),
		SpriteMap(0x10, 0x25, 0x32, 0x28, 0x80),
	],
	TownMapLabel.toDesertEast: [
		SpriteMap(0x00, 0x06, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x08, 0x32, 0x10, 0x01),
		SpriteMap(0x00, 0x0A, 0x32, 0x20, 0x01),
		SpriteMap(0x10, 0x26, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x27, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x28, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x29, 0x32, 0x18, 0x00),
		SpriteMap(0x10, 0x2A, 0x32, 0x20, 0x00),
		SpriteMap(0x10, 0x2B, 0x32, 0x28, 0x80),
	],
	TownMapLabel.toDesertWest: [
		SpriteMap(0x00, 0x30, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x32, 0x32, 0x10, 0x01),
		SpriteMap(0x00, 0x34, 0x32, 0x20, 0x01),
		SpriteMap(0x10, 0x50, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x51, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x52, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x53, 0x32, 0x18, 0x00),
		SpriteMap(0x10, 0x54, 0x32, 0x20, 0x00),
		SpriteMap(0x10, 0x55, 0x32, 0x28, 0x80),
	],
	TownMapLabel.toTotoEast: [
		SpriteMap(0x00, 0x6A, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x6C, 0x32, 0x10, 0x01),
		SpriteMap(0x00, 0x6E, 0x32, 0x20, 0x00),
		SpriteMap(0x08, 0x7E, 0x32, 0x20, 0x00),
		SpriteMap(0x10, 0x8A, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x8B, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x8C, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x8D, 0x32, 0x18, 0x00),
		SpriteMap(0x10, 0x8E, 0x32, 0x20, 0x80),
	],
	TownMapLabel.hint: [
		SpriteMap(0x00, 0x98, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x9A, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0xB8, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xB9, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xBA, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xBB, 0x32, 0x18, 0x80),
	],
	TownMapLabel.nessLarge: [
		SpriteMap(0x00, 0xC3, 0x32, 0x00, 0x81),
	],
	TownMapLabel.nessSmall: [
		SpriteMap(0x00, 0xC5, 0x32, 0x00, 0x81),
	],
	TownMapLabel.upArrow: [
		SpriteMap(0x00, 0xC7, 0x32, 0x00, 0x81),
	],
	TownMapLabel.downArrow: [
		SpriteMap(0x00, 0xC9, 0x32, 0x00, 0x81),
	],
	TownMapLabel.leftArrow: [
		SpriteMap(0x00, 0x00, 0x33, 0x00, 0x81),
	],
	TownMapLabel.rightArrow: [
		SpriteMap(0x00, 0x02, 0x33, 0x00, 0x81),
	]
];

/** List of icons that blink on/off on the town map screen
 * Original_Address: $(DOLLAR)E1F47A
 */
immutable ubyte[23] blinkingTownMapIcons = [
	TownMapLabel.invalid: 0x00,
	TownMapLabel.burger: 0x01,
	TownMapLabel.bakery: 0x01,
	TownMapLabel.hotel: 0x01,
	TownMapLabel.restaurant: 0x01,
	TownMapLabel.hospital: 0x01,
	TownMapLabel.shop: 0x01,
	TownMapLabel.deptStore: 0x01,
	TownMapLabel.busStop: 0x01,
	TownMapLabel.toTwosonSouth: 0x01,
	TownMapLabel.toOnettNorth: 0x01,
	TownMapLabel.toThreedEast: 0x01,
	TownMapLabel.toTwosonWest: 0x01,
	TownMapLabel.toDesertEast: 0x01,
	TownMapLabel.toDesertWest: 0x01,
	TownMapLabel.toTotoEast: 0x01,
	TownMapLabel.hint: 0x01,
	TownMapLabel.nessLarge: 0x00,
	TownMapLabel.nessSmall: 0x00,
	TownMapLabel.upArrow: 0x00,
	TownMapLabel.downArrow: 0x00,
	TownMapLabel.leftArrow: 0x00,
	TownMapLabel.rightArrow: 0x00
];

/** Icon placement data for each town map
 * Original_Address: $(DOLLAR)E1F491
 */
immutable TownMapIconPlacement[][6] townMapIconPlacementTable = [
	[
		TownMapIconPlacement(85, 91, TownMapLabel.shop, EventFlag.hideOnettDrugstore),
		TownMapIconPlacement(106, 94, TownMapLabel.burger, EventFlag.hideOnettBurgerShop),
		TownMapIconPlacement(140, 123, TownMapLabel.hotel, EventFlag.hideOnettHotel),
		TownMapIconPlacement(29, 158, TownMapLabel.hospital, EventFlag.hideOnettHospital),
		TownMapIconPlacement(117, 166, TownMapLabel.bakery, EventFlag.hideOnettBakery),
		TownMapIconPlacement(96, 190, TownMapLabel.toTwosonSouth, EventFlag.hideOnettToTwoson),
		TownMapIconPlacement(187, 94, TownMapLabel.hint, EventFlag.gmOnetHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(72, 42, TownMapLabel.hotel, EventFlag.hideTwosonHotel),
		TownMapIconPlacement(112, 46, TownMapLabel.deptStore, EventFlag.hideTwosonDeptStore),
		TownMapIconPlacement(32, 48, TownMapLabel.toOnettNorth, EventFlag.hideTwosonToOnett),
		TownMapIconPlacement(208, 154, TownMapLabel.busStop, EventFlag.hideTwosonBusStop),
		TownMapIconPlacement(184, 9, TownMapLabel.hospital, EventFlag.hideTwosonHospital),
		TownMapIconPlacement(120, 184, TownMapLabel.toThreedEast, EventFlag.hideTwosonToThreed),
		TownMapIconPlacement(96, 112, TownMapLabel.bakery, EventFlag.hideTwosonBakery),
		TownMapIconPlacement(208, 61, TownMapLabel.hint, EventFlag.gmTwosonHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(72, 107, TownMapLabel.shop, EventFlag.hideThreedShop),
		TownMapIconPlacement(112, 59, TownMapLabel.hotel, EventFlag.hideThreedHotel),
		TownMapIconPlacement(140, 103, TownMapLabel.bakery, EventFlag.hideThreedBakery),
		TownMapIconPlacement(126, 107, TownMapLabel.hospital, EventFlag.hideThreedHospital),
		TownMapIconPlacement(24, 142, TownMapLabel.toTwosonWest, EventFlag.hideThreedToTwoson),
		TownMapIconPlacement(176, 142, TownMapLabel.toDesertEast, EventFlag.hideThreedToDesert),
		TownMapIconPlacement(108, 93, TownMapLabel.busStop, EventFlag.hideThreedBusStop1),
		TownMapIconPlacement(115, 97, TownMapLabel.busStop, EventFlag.hideThreedBusStop2),
		TownMapIconPlacement(215, 10, TownMapLabel.hint, EventFlag.gmThreekHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(116, 10, TownMapLabel.hospital, EventFlag.hideFoursideHospital),
		TownMapIconPlacement(194, 40, TownMapLabel.deptStore, EventFlag.hideFoursideDeptStore),
		TownMapIconPlacement(172, 132, TownMapLabel.bakery, EventFlag.hideFoursideBakery),
		TownMapIconPlacement(64, 123, TownMapLabel.hotel, EventFlag.hideFoursideHotel),
		TownMapIconPlacement(16, 192, TownMapLabel.toDesertWest, EventFlag.hideFoursideToDesert),
		TownMapIconPlacement(62, 200, TownMapLabel.busStop, EventFlag.hideFoursideBusStop),
		TownMapIconPlacement(88, 119, TownMapLabel.hint, EventFlag.gmFoursideHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(128, 27, TownMapLabel.hotel, EventFlag.hideScarabaHotel),
		TownMapIconPlacement(136, 9, TownMapLabel.hospital, EventFlag.hideScarabaHospital),
		TownMapIconPlacement(176, 18, TownMapLabel.shop, EventFlag.hideScarabaShop),
		TownMapIconPlacement(172, 46, TownMapLabel.bakery, EventFlag.hideScarabaBakery),
		TownMapIconPlacement(141, 94, TownMapLabel.hint, EventFlag.gmScarabiHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(64, 4, TownMapLabel.hotel, EventFlag.hideSummersHotel),
		TownMapIconPlacement(113, 4, TownMapLabel.restaurant, EventFlag.hideSummersRestaurant),
		TownMapIconPlacement(165, 4, TownMapLabel.shop, EventFlag.hideSummersShop1),
		TownMapIconPlacement(97, 108, TownMapLabel.hospital, EventFlag.hideSummersHospital),
		TownMapIconPlacement(160, 114, TownMapLabel.shop, EventFlag.hideSummersShop2),
		TownMapIconPlacement(72, 108, TownMapLabel.hint, EventFlag.gmSummersHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	]
];

