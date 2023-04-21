/// intro screen data, town maps, etc
module earthbound.bank21;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.globals;

/// $E10000
@ROMSource(0x210000, 1618)
immutable(ubyte)[] coffeeSequenceText;

/// $E10652
@ROMSource(0x210652, 1332)
immutable(ubyte)[] teaSequenceText;

/// $E12EFA
immutable CastSequenceFormattingEntry[48] castSequenceFormatting = [
	CastSequenceFormattingEntry(0x0030, 0x00),
	CastSequenceFormattingEntry(0x0030, 0x08),
	CastSequenceFormattingEntry(0x0038, 0x08),
	CastSequenceFormattingEntry(0x0040, 0x08),
	CastSequenceFormattingEntry(0x0048, 0x08),
	CastSequenceFormattingEntry(0x0050, 0x06),
	CastSequenceFormattingEntry(0x0056, 0x08),
	CastSequenceFormattingEntry(0x005E, 0x06),
	CastSequenceFormattingEntry(0x0064, 0x06),
	CastSequenceFormattingEntry(0x006A, 0x06),
	CastSequenceFormattingEntry(0x0070, 0x08),
	CastSequenceFormattingEntry(0x0078, 0x0A),
	CastSequenceFormattingEntry(0x0082, 0x0A),
	CastSequenceFormattingEntry(0x008C, 0x0A),
	CastSequenceFormattingEntry(0x0096, 0x06),
	CastSequenceFormattingEntry(0x009C, 0x04),
	CastSequenceFormattingEntry(0x00A0, 0x06),
	CastSequenceFormattingEntry(0x00A6, 0x08),
	CastSequenceFormattingEntry(0x00AE, 0x08),
	CastSequenceFormattingEntry(0x00B6, 0x0A),
	CastSequenceFormattingEntry(0x00C0, 0x06),
	CastSequenceFormattingEntry(0x00C6, 0x08),
	CastSequenceFormattingEntry(0x00CE, 0x04),
	CastSequenceFormattingEntry(0x00D2, 0x06),
	CastSequenceFormattingEntry(0x00D8, 0x04),
	CastSequenceFormattingEntry(0x00DC, 0x0C),
	CastSequenceFormattingEntry(0x00E8, 0x06),
	CastSequenceFormattingEntry(0x00EE, 0x08),
	CastSequenceFormattingEntry(0x00F6, 0x06),
	CastSequenceFormattingEntry(0x00FC, 0x08),
	CastSequenceFormattingEntry(0x0104, 0x0A),
	CastSequenceFormattingEntry(0x010E, 0x0A),
	CastSequenceFormattingEntry(0x0118, 0x08),
	CastSequenceFormattingEntry(0x0120, 0x0C),
	CastSequenceFormattingEntry(0x012C, 0x04),
	CastSequenceFormattingEntry(0x0130, 0x08),
	CastSequenceFormattingEntry(0x0138, 0x0C),
	CastSequenceFormattingEntry(0x0144, 0x08),
	CastSequenceFormattingEntry(0x014C, 0x08),
	CastSequenceFormattingEntry(0x0154, 0x0A),
	CastSequenceFormattingEntry(0x015E, 0x06),
	CastSequenceFormattingEntry(0x0164, 0x02),
	CastSequenceFormattingEntry(0x0166, 0x04),
	CastSequenceFormattingEntry(0x016A, 0x02),
	CastSequenceFormattingEntry(0x016C, 0x04),
	CastSequenceFormattingEntry(0x0010, 0x04),
	CastSequenceFormattingEntry(0x0014, 0x04),
	CastSequenceFormattingEntry(0x0020, 0x0C),
];

/// $E12F8A
immutable CreditsPhotograph[32] photographerConfigTable = [
	CreditsPhotograph(EventFlag.photo1, 332, 43, 0x0000, 0x00, 0x00, 329, 56, [ Coordinates(331, 45), Coordinates(329, 44), Coordinates(333, 44), Coordinates(335, 43), Coordinates(327, 44), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo2, 944, 186, 0x00C0, 0x28, 0x55, 938, 190, [ Coordinates(944, 188), Coordinates(942, 189), Coordinates(947, 189), Coordinates(949, 190), Coordinates(939, 188), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo3, 185, 814, 0x0180, 0x18, 0x55, 186, 824, [ Coordinates(190, 818), Coordinates(188, 818), Coordinates(191, 816), Coordinates(183, 818), Coordinates(185, 819), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo4, 617, 145, 0x0240, 0x38, 0x55, 619, 149, [ Coordinates(616, 142), Coordinates(614, 143), Coordinates(613, 141), Coordinates(609, 143), Coordinates(612, 144), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo5, 729, 155, 0x0240, 0x30, 0x55, 731, 166, [ Coordinates(728, 158), Coordinates(730, 157), Coordinates(726, 156), Coordinates(724, 155), Coordinates(732, 156), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo6, 276, 814, 0x0180, 0x28, 0x55, 277, 824, [ Coordinates(275, 818), Coordinates(273, 819), Coordinates(270, 818), Coordinates(278, 818), Coordinates(280, 819), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(286, 818, OverworldSprite.gorgeous), PhotographerConfigEntryObject(288, 816, OverworldSprite.lucky), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo7, 73, 424, 0x0300, 0x08, 0x55, 83, 426, [ Coordinates(75, 422), Coordinates(80, 423), Coordinates(73, 421), Coordinates(71, 422), Coordinates(77, 421), Coordinates(69, 420) ], [ PhotographerConfigEntryObject(82, 419, OverworldSprite.tessieWatcher), PhotographerConfigEntryObject(67, 416, OverworldSprite.tessieWatcher), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo8, 195, 442, 0x03C0, 0x10, 0x55, 197, 450, [ Coordinates(197, 441), Coordinates(200, 441), Coordinates(196, 440), Coordinates(201, 440), Coordinates(202, 441), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(190, 447, OverworldSprite.madDuck), PhotographerConfigEntryObject(186, 441, OverworldSprite.rowdyMouse), PhotographerConfigEntryObject(205, 444, OverworldSprite.rowdyMouse), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo9, 721, 1052, 0x0480, 0x38, 0x55, 714, 1054, [ Coordinates(721, 1048), Coordinates(719, 1048), Coordinates(717, 1047), Coordinates(715, 1048), Coordinates(717, 1049), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(714, 1056, OverworldSprite.zombiePossessor), PhotographerConfigEntryObject(725, 1057, OverworldSprite.zombiePossessor), PhotographerConfigEntryObject(724, 1046, OverworldSprite.zombiePossessor), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo10, 801, 32, 0x0540, 0x10, 0x55, 816, 45, [ Coordinates(807, 36), Coordinates(809, 37), Coordinates(811, 38), Coordinates(810, 40), Coordinates(813, 40), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo11, 70, 920, 0x0600, 0x18, 0x55, 72, 929, [ Coordinates(70, 920), Coordinates(72, 920), Coordinates(73, 918), Coordinates(68, 923), Coordinates(74, 922), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo12, 700, 1138, 0x0480, 0x28, 0x55, 697, 1152, [ Coordinates(699, 1145), Coordinates(701, 1145), Coordinates(697, 1144), Coordinates(703, 1144), Coordinates(705, 1142), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(691, 1142, OverworldSprite.littleKidInBlue), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo13, 255, 1115, 0x06C0, 0x18, 0x55, 254, 1127, [ Coordinates(253, 1117), Coordinates(255, 1116), Coordinates(257, 1117), Coordinates(259, 1118), Coordinates(251, 1118), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(264, 1121, OverworldSprite.crestedBooka), PhotographerConfigEntryObject(263, 1112, OverworldSprite.smilinSphere), PhotographerConfigEntryObject(247, 1123, OverworldSprite.skelpion), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo14, 465, 1203, 0x06C0, 0x38, 0x55, 462, 1210, [ Coordinates(465, 1203), Coordinates(467, 1204), Coordinates(469, 1205), Coordinates(462, 1204), Coordinates(471, 1204), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(459, 1197, OverworldSprite.minersBrother), PhotographerConfigEntryObject(466, 1213, OverworldSprite.bigDirtScooper), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo15, 708, 1250, 0x06C0, 0x28, 0x55, 713, 1255, [ Coordinates(708, 1250), Coordinates(710, 1249), Coordinates(706, 1249), Coordinates(712, 1248), Coordinates(704, 1248), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo16, 399, 532, 0x0780, 0x18, 0x55, 411, 547, [ Coordinates(404, 538), Coordinates(406, 539), Coordinates(408, 538), Coordinates(410, 536), Coordinates(409, 540), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo17, 583, 655, 0x0840, 0x30, 0x55, 578, 667, [ Coordinates(582, 658), Coordinates(584, 658), Coordinates(586, 658), Coordinates(588, 659), Coordinates(585, 660), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo18, 448, 494, 0x0780, 0x08, 0x55, 440, 504, [ Coordinates(447, 496), Coordinates(446, 495), Coordinates(448, 494), Coordinates(449, 492), Coordinates(449, 490), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo19, 566, 769, 0x0900, 0x38, 0x55, 562, 777, [ Coordinates(568, 771), Coordinates(570, 772), Coordinates(566, 771), Coordinates(564, 772), Coordinates(571, 771), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo20, 856, 1037, 0x09C0, 0x18, 0x55, 860, 1046, [ Coordinates(857, 1041), Coordinates(858, 1039), Coordinates(854, 1039), Coordinates(856, 1037), Coordinates(859, 1037), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo21, 576, 436, 0x0A80, 0x28, 0x55, 573, 451, [ Coordinates(574, 443), Coordinates(576, 444), Coordinates(578, 443), Coordinates(571, 443), Coordinates(579, 442), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo22, 39, 552, 0x0300, 0x38, 0x55, 43, 562, [ Coordinates(42, 556), Coordinates(44, 554), Coordinates(39, 554), Coordinates(43, 550), Coordinates(46, 555), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(33, 549, OverworldSprite.caveBoy), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo23, 565, 343, 0x0B40, 0x10, 0x55, 559, 352, [ Coordinates(565, 344), Coordinates(567, 344), Coordinates(569, 344), Coordinates(571, 344), Coordinates(563, 344), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo24, 888, 1134, 0x0C00, 0x38, 0x55, 890, 1143, [ Coordinates(886, 1135), Coordinates(888, 1135), Coordinates(890, 1135), Coordinates(892, 1138), Coordinates(889, 1136), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(898, 1134, OverworldSprite.drinkingGuy), PhotographerConfigEntryObject(882, 1134, OverworldSprite.brunetteShoppingLady), PhotographerConfigEntryObject(890, 1142, OverworldSprite.oldLadyWithCane), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo25, 760, 370, 0x0B40, 0x30, 0x55, 757, 380, [ Coordinates(759, 374), Coordinates(761, 373), Coordinates(763, 374), Coordinates(762, 370), Coordinates(757, 367), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo26, 868, 362, 0x0B40, 0x08, 0x55, 866, 371, [ Coordinates(866, 358), Coordinates(868, 357), Coordinates(872, 357), Coordinates(874, 358), Coordinates(863, 358), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo27, 186, 529, 0x0CC0, 0x10, 0x55, 190, 536, [ Coordinates(185, 530), Coordinates(187, 529), Coordinates(189, 531), Coordinates(191, 532), Coordinates(182, 532), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo28, 224, 611, 0x0CC0, 0x18, 0x55, 229, 615, [ Coordinates(226, 614), Coordinates(227, 612), Coordinates(224, 613), Coordinates(229, 613), Coordinates(220, 613), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(223, 611, OverworldSprite.pyramidDoor), PhotographerConfigEntryObject(225, 611, OverworldSprite.pyramidDoor), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo29, 160, 669, 0x0CC0, 0x30, 0x55, 165, 677, [ Coordinates(164, 672), Coordinates(162, 671), Coordinates(160, 671), Coordinates(158, 670), Coordinates(160, 668), Coordinates(166, 671) ], [ PhotographerConfigEntryObject(171, 611, OverworldSprite.dungeonMan), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo30, 657, 958, 0x0D80, 0x38, 0x55, 652, 964, [ Coordinates(658, 960), Coordinates(656, 958), Coordinates(657, 956), Coordinates(660, 957), Coordinates(661, 959), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo31, 49, 39, 0x0E40, 0x10, 0x55, 51, 47, [ Coordinates(50, 38), Coordinates(48, 37), Coordinates(53, 36), Coordinates(46, 36), Coordinates(51, 35), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none), PhotographerConfigEntryObject(0, 0, OverworldSprite.none) ]),
	CreditsPhotograph(EventFlag.photo32, 48, 955, 0x0600, 0x00, 0x00, 49, 969, [ Coordinates(48, 953), Coordinates(52, 952), Coordinates(50, 950), Coordinates(46, 951), Coordinates(0, 0), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(49, 956, OverworldSprite.drAndonuts), PhotographerConfigEntryObject(44, 955, OverworldSprite.appleKid), PhotographerConfigEntryObject(53, 955, OverworldSprite.mrSaturn), PhotographerConfigEntryObject(42, 951, OverworldSprite.miner) ]),
];

/// $E1374A
@ROMSource(0x21374A, 2549)
immutable(ubyte)[] compressedPaletteUnknown;

/// $E1413F
immutable ubyte[] staffText;

/// $E14DE8
void unknownE14DE8() {
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

/// $E14EC1
@ROMSource(0x214EC1, 105)
immutable(ubyte)[] apeArrangement;

/// $E14F2A
@ROMSource(0x214F2A, 518)
immutable(ubyte)[] apeGraphics;

/// $E15130
@ROMSource(0x215130, 68)
immutable(ubyte)[] apePalette;

/// $E15174
@ROMSource(0x215174, 116)
immutable(ubyte)[] halkenArrangement;

/// $E151E8
@ROMSource(0x2151E8, 464)
immutable(ubyte)[] halkenGraphics;

/// $E153B8
@ROMSource(0x2153B8, 157)
immutable(ubyte)[] halkenPalette;

/// $E15455
@ROMSource(0x215455, 73)
immutable(ubyte)[] nintendoArrangement;

/// $E1549E
@ROMSource(0x21549E, 241)
immutable(ubyte)[] nintendoGraphics;

/// $E1558F
@ROMSource(0x21558F, 68)
immutable(ubyte)[] nintendoPalette;

/// $E155D3
@ROMSource(0x2155D3, 1376)
immutable(ubyte)[] gasStationArrangement;

/// $E15B33
@ROMSource(0x215B33, 20100)
immutable(ubyte)[] gasStationGraphics;

/// $E1A9B7
@ROMSource(0x21A9B7, 166)
immutable(ubyte)[] gasStationPalette;

/// $E1AA5D
@ROMSource(0x21AA5D, 130)
immutable(ubyte)[] gasStationPalette2;

/// $E1AADF
@ROMSource(0x21AADF, 108)
immutable(ubyte)[] producedItoiArrangement;

/// $E1AB4B
@ROMSource(0x21AB4B, 438)
immutable(ubyte)[] producedItoiGraphics;

/// $E1AD01
@ROMSource(0x21AD01, 77)
immutable(ubyte)[] nintendoPresentationArrangement;

/// $E1AD4E
@ROMSource(0x21AD4E, 289)
immutable(ubyte)[] nintendoPresentationGraphics;

/// $E1AE6F
@ROMSource(0x21AE6F, 13)
immutable(ubyte)[] nintendoItoiPalette;

/// $E1AE7C
@ROMSource(0x21AE7C, 7)
immutable(ubyte)[] unknownE1AE7C;

/// $E1AE83
@ROMSource(0x21AE83, 122)
immutable(ubyte)[] unknownE1AE83;

/// $E1AEFD
@ROMSource(0x21AEFD, 128)
immutable(ubyte)[] unknownE1AEFD;

/// $E1AF7D
@ROMSource(0x21AF7D, 660)
immutable(ubyte)[] titleScreenArrangement;

/// $E1B211
@ROMSource(0x21B211, 5332)
immutable(ubyte)[] titleScreenGraphics;

/// $E1C6E5
@ROMSource(0x21C6E5, 1788)
immutable(ubyte)[] unknownE1C6E5;

/// $E1CDE1
@ROMSource(0x21CDE1, 39)
immutable(ubyte)[] titleScreenPalette;

/// $E1CE08
immutable SpriteMap*[9] unknownE1CF9D = [
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

/// $E1CFAF
@ROMSource(0x21CFAF, 1349)
immutable(ubyte)[] unknownE1CFAF;

/// $E1D4F4
@ROMSource(0x21D4F4, 244)
immutable(ubyte)[] unknownE1D4F4;

/// $E1D5E8
@ROMSource(0x21D5E8, 249)
immutable(ubyte)[] unknownE1D5E8;

/// $E1D6E1
@ROMSource(0x21D6E1, 308)
immutable(ubyte)[] unknownE1D6E1;

/// $E1D815
immutable ubyte[] unknownE1D815 = [0x00, 0x00, 0xFF, 0x7F, 0x1E, 0x38, 0x86, 0x10, 0x00, 0x00, 0xFF, 0x7F, 0x1E, 0x38, 0x86, 0x10, 0x00, 0x00, 0xFF, 0x7F, 0x1E, 0x38, 0x86, 0x10, 0x00, 0x00, 0xFF, 0x7F, 0x1E, 0x38, 0x86, 0x10];

/// $E1D835
@ROMSource(0x21D835, 3249)
immutable(ubyte)[] castNamesGraphics;

/// $E1E4E6
@ROMSource(0x21E4E6, 66)
immutable(ubyte)[] unknownE1E4E6;

/// $E1E528
@ROMSource(0x21E528, 1004)
immutable(ubyte)[] staffCreditsFontGraphics;

/// $E1E914
@ROMSource(0x21E914, 16)
immutable(ubyte)[] staffCreditsFontPalette;

/// $E1E924
immutable ubyte[] unknownE1E924 = [ 0x04, 0x00, 0x7F, 0x1F, 0x58, 0x32 ];

/// $E1E92A
immutable ubyte[] unknownE1E92A = [ 0x1F, 0x3D, 0xFF, 0x7F, 0xE0, 0x07, 0x86, 0x10, 0xE0, 0x07, 0xE0, 0x07, 0xE0, 0x07, 0xE0, 0x07, 0xE0, 0x07, 0xE0, 0x07, 0xE0, 0x07, 0xE0, 0x07, 0xDF, 0x57, 0xE0, 0x07, 0x55, 0x25, 0x00, 0x00 ];

/// $E1E94A
immutable ubyte[] unknownE1E94A = [ 0xE8, 0x62, 0x0C, 0x24, 0x00, 0x0D, 0x57, 0x24, 0x0E, 0x02, 0x24, 0x0D, 0x64, 0x45, 0x0C, 0x24, 0x00, 0x0F, 0x57, 0x24, 0x00, 0x02, 0x24, 0x0F, 0xE4, 0xF0, 0x3F, 0x00, 0xFA, 0xF0, 0x3F, 0x00, 0xFA, 0xF0, 0x3F, 0x00, 0xFA, 0xF0, 0x3F, 0x00, 0xFA, 0xF0, 0x3F, 0x00, 0xFA, 0xF0, 0x3F, 0x00, 0xFA, 0xF0, 0x3F, 0x00, 0xFA, 0xF0, 0x3F, 0x00, 0xFA, 0xF0, 0x3F, 0x00, 0xFA, 0xF2, 0x7F, 0x00, 0xFA, 0x45, 0x0C, 0x24, 0x01, 0x0D, 0xA4, 0x57, 0x0E, 0xE4, 0x01, 0x0D, 0xE4, 0xE8, 0x62, 0x0C, 0x24, 0x3F, 0x00, 0x03, 0x3C, 0x3C, 0x7E, 0x42, 0x43, 0xFF, 0x99, 0x01, 0x7E, 0x42, 0xD1, 0x07, 0x21, 0x0F, 0x1C, 0x1C, 0x3C, 0x34, 0x7C, 0x44, 0x7C, 0x64, 0x3C, 0x24, 0xFF, 0xE7, 0xFF, 0x81, 0xFF, 0xFF, 0x2F, 0x00, 0x84, 0x07, 0x20, 0x06, 0xB9, 0x7F, 0x79, 0x7E, 0x42, 0xFE, 0x9E, 0x98, 0x07, 0x4C, 0x04, 0x99, 0x7E, 0x72, 0x7F, 0x79, 0x95, 0x07, 0x2A, 0x0F, 0x06, 0x06, 0x0E, 0x0A, 0x1E, 0x12, 0x3E, 0x22, 0x7F, 0x53, 0xFF, 0x81, 0xFF, 0xF3, 0x0E, 0x0E, 0x2F, 0x00, 0x22, 0xFF, 0x04, 0x81, 0xFE, 0x9E, 0xFE, 0x82, 0x97, 0x07, 0x88, 0x07, 0x3E, 0x3E, 0x7E, 0x42, 0xFC, 0x9C, 0xFE, 0x82, 0x97, 0x07, 0x28, 0x83, 0x07, 0xC0, 0x03, 0xFF, 0x99, 0xFE, 0xF2, 0x42, 0x3C, 0x24, 0x91, 0x07, 0x2E, 0x86, 0x07, 0x80, 0x00, 0x42, 0x97, 0x07, 0x28, 0x87, 0x07, 0x20, 0x07, 0x7F, 0x41, 0x3F, 0x39, 0x7E, 0x42, 0x7C, 0x7C, 0x31, 0x00, 0x83, 0x07, 0xA0, 0x07, 0x1C, 0x14, 0x38, 0x28, 0x70, 0x50, 0x60, 0x60, 0x31, 0x00, 0x3F, 0xFF, 0x2B, 0x00, 0x03, 0x03, 0x00, 0x02, 0x01, 0x2B, 0xFF, 0x03, 0xFC, 0xFC, 0xFD, 0xFD, 0xCC, 0x08, 0xAB, 0xCE, 0x08, 0xA1, 0x83, 0x08, 0xCD, 0x47, 0x02, 0x01, 0x2F, 0xFD, 0xFF ];

/// $E1EA50
@ROMSource(0x21EA50, 1907)
immutable(ubyte)[] townMapLabelGfx;

/// $E1F1C3
@ROMSource(0x21F1C3, 64)
immutable(ubyte)[] townMapIconPalette;

/// $E1F44C
immutable SpriteMap[][24] unknownE1F44C = [
	[
		SpriteMap(0x00, 0x0C, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x0E, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0x2C, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x2D, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x2E, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x2F, 0x32, 0x18, 0x80),
	],
	[
		SpriteMap(0x00, 0x0C, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x0E, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0x2C, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0x2D, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0x2E, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0x2F, 0x32, 0x18, 0x80),
	],
	[
		SpriteMap(0x00, 0x90, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x92, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0xB0, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xB1, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xB2, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xB3, 0x32, 0x18, 0x80),
	],
	[
		SpriteMap(0x00, 0xBC, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0xBE, 0x32, 0x10, 0x00),
		SpriteMap(0x08, 0xCE, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xDC, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xDD, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xDE, 0x32, 0x10, 0x80),
	],
	[
		SpriteMap(0x00, 0x94, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x96, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0xB4, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xB5, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xB6, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xB7, 0x32, 0x18, 0x80),
	],
	[
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
	[
		SpriteMap(0x00, 0xC0, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0xC2, 0x32, 0x10, 0x00),
		SpriteMap(0x08, 0xD2, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xE0, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xE1, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xE2, 0x32, 0x10, 0x80),
	],
	[
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
	[
		SpriteMap(0x00, 0x6F, 0x32, 0x00, 0x80),
	],
	[
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
	[
		SpriteMap(0x00, 0x9C, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x9E, 0x32, 0x10, 0x81),
	],
	[
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
	[
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
	[
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
	[
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
	[
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
	[
		SpriteMap(0x00, 0x98, 0x32, 0x00, 0x01),
		SpriteMap(0x00, 0x9A, 0x32, 0x10, 0x01),
		SpriteMap(0x10, 0xB8, 0x32, 0x00, 0x00),
		SpriteMap(0x10, 0xB9, 0x32, 0x08, 0x00),
		SpriteMap(0x10, 0xBA, 0x32, 0x10, 0x00),
		SpriteMap(0x10, 0xBB, 0x32, 0x18, 0x80),
	],
	[
		SpriteMap(0x00, 0xC3, 0x32, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0xC5, 0x32, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0xC7, 0x32, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0xC9, 0x32, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0x00, 0x33, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0x02, 0x33, 0x00, 0x81),
	]
];

/// $E1F47A
immutable ubyte[23] unknownE1F47A = [0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

/// $E1F491
immutable TownMapIconPlacement[][6] townMapIconPlacementTable = [
	[
		TownMapIconPlacement(0x55, 0x5B, 0x06, EventFlag.unknown0558),
		TownMapIconPlacement(0x6A, 0x5E, 0x01, EventFlag.unknown0559),
		TownMapIconPlacement(0x8C, 0x7B, 0x03, EventFlag.unknown0560),
		TownMapIconPlacement(0x1D, 0x9E, 0x05, EventFlag.unknown0561),
		TownMapIconPlacement(0x75, 0xA6, 0x02, EventFlag.unknown0562),
		TownMapIconPlacement(0x60, 0xBE, 0x09, EventFlag.unknown0563),
		TownMapIconPlacement(0xBB, 0x5E, 0x10, EventFlag.gmOnetHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x48, 0x2A, 0x03, EventFlag.unknown0564),
		TownMapIconPlacement(0x70, 0x2E, 0x07, EventFlag.unknown0565),
		TownMapIconPlacement(0x20, 0x30, 0x0A, EventFlag.unknown0566),
		TownMapIconPlacement(0xD0, 0x9A, 0x08, EventFlag.unknown0567),
		TownMapIconPlacement(0xB8, 0x09, 0x05, EventFlag.unknown0568),
		TownMapIconPlacement(0x78, 0xB8, 0x0B, EventFlag.unknown0569),
		TownMapIconPlacement(0x60, 0x70, 0x02, EventFlag.unknown0673),
		TownMapIconPlacement(0xD0, 0x3D, 0x10, EventFlag.gmTwosonHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x48, 0x6B, 0x06, EventFlag.unknown0570),
		TownMapIconPlacement(0x70, 0x3B, 0x03, EventFlag.unknown0571),
		TownMapIconPlacement(0x8C, 0x67, 0x02, EventFlag.unknown0573),
		TownMapIconPlacement(0x7E, 0x6B, 0x05, EventFlag.unknown0574),
		TownMapIconPlacement(0x18, 0x8E, 0x0C, EventFlag.unknown0642),
		TownMapIconPlacement(0xB0, 0x8E, 0x0D, EventFlag.unknown0641),
		TownMapIconPlacement(0x6C, 0x5D, 0x08, EventFlag.unknown0676),
		TownMapIconPlacement(0x73, 0x61, 0x08, EventFlag.unknown0677),
		TownMapIconPlacement(0xD7, 0x0A, 0x10, EventFlag.gmThreekHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x74, 0x0A, 0x05, EventFlag.unknown0575),
		TownMapIconPlacement(0xC2, 0x28, 0x07, EventFlag.unknown0576),
		TownMapIconPlacement(0xAC, 0x84, 0x02, EventFlag.unknown0577),
		TownMapIconPlacement(0x40, 0x7B, 0x03, EventFlag.unknown0578),
		TownMapIconPlacement(0x10, 0xC0, 0x0E, EventFlag.unknown0640),
		TownMapIconPlacement(0x3E, 0xC8, 0x08, EventFlag.unknown0678),
		TownMapIconPlacement(0x58, 0x77, 0x10, EventFlag.gmFoursideHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x80, 0x1B, 0x03, EventFlag.unknown0579),
		TownMapIconPlacement(0x88, 0x09, 0x05, EventFlag.unknown0580),
		TownMapIconPlacement(0xB0, 0x12, 0x06, EventFlag.unknown0581),
		TownMapIconPlacement(0xAC, 0x2E, 0x02, EventFlag.unknown0674),
		TownMapIconPlacement(0x8D, 0x5E, 0x10, EventFlag.gmScarabiHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x40, 0x04, 0x03, EventFlag.unknown0582),
		TownMapIconPlacement(0x71, 0x04, 0x04, EventFlag.unknown0583),
		TownMapIconPlacement(0xA5, 0x04, 0x06, EventFlag.unknown0584),
		TownMapIconPlacement(0x61, 0x6C, 0x05, EventFlag.unknown0585),
		TownMapIconPlacement(0xA0, 0x72, 0x06, EventFlag.unknown0586),
		TownMapIconPlacement(0x48, 0x6C, 0x10, EventFlag.gmSummersHint | eventFlagUnset),
		TownMapIconPlacement(0xFF)
	]
];

