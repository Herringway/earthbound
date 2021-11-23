/// intro screen data, town maps, etc
module earthbound.bank21;

import earthbound.commondefs;

/// $E12F8A
immutable CreditsPhotograph[32] PhotographerConfigTable = [
	CreditsPhotograph(EventFlag.UNKNOWN_2BA, 332, 43, 0x0000, 0x00, 0x00, 329, 56, [ Coordinates(331, 45), Coordinates(329, 44), Coordinates(333, 44), Coordinates(335, 43), Coordinates(327, 44), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2BB, 944, 186, 0x00C0, 0x28, 0x55, 938, 190, [ Coordinates(944, 188), Coordinates(942, 189), Coordinates(947, 189), Coordinates(949, 190), Coordinates(939, 188), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2BC, 185, 814, 0x0180, 0x18, 0x55, 186, 824, [ Coordinates(190, 818), Coordinates(188, 818), Coordinates(191, 816), Coordinates(183, 818), Coordinates(185, 819), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2BD, 617, 145, 0x0240, 0x38, 0x55, 619, 149, [ Coordinates(616, 142), Coordinates(614, 143), Coordinates(613, 141), Coordinates(609, 143), Coordinates(612, 144), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2BE, 729, 155, 0x0240, 0x30, 0x55, 731, 166, [ Coordinates(728, 158), Coordinates(730, 157), Coordinates(726, 156), Coordinates(724, 155), Coordinates(732, 156), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2BF, 276, 814, 0x0180, 0x28, 0x55, 277, 824, [ Coordinates(275, 818), Coordinates(273, 819), Coordinates(270, 818), Coordinates(278, 818), Coordinates(280, 819), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(286, 818, OverworldSprite.GORGEOUS), PhotographerConfigEntryObject(288, 816, OverworldSprite.LUCKY), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C0, 73, 424, 0x0300, 0x08, 0x55, 83, 426, [ Coordinates(75, 422), Coordinates(80, 423), Coordinates(73, 421), Coordinates(71, 422), Coordinates(77, 421), Coordinates(69, 420) ], [ PhotographerConfigEntryObject(82, 419, OverworldSprite.TESSIE_WATCHER), PhotographerConfigEntryObject(67, 416, OverworldSprite.TESSIE_WATCHER), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C1, 195, 442, 0x03C0, 0x10, 0x55, 197, 450, [ Coordinates(197, 441), Coordinates(200, 441), Coordinates(196, 440), Coordinates(201, 440), Coordinates(202, 441), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(190, 447, OverworldSprite.MAD_DUCK), PhotographerConfigEntryObject(186, 441, OverworldSprite.ROWDY_MOUSE), PhotographerConfigEntryObject(205, 444, OverworldSprite.ROWDY_MOUSE), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C2, 721, 1052, 0x0480, 0x38, 0x55, 714, 1054, [ Coordinates(721, 1048), Coordinates(719, 1048), Coordinates(717, 1047), Coordinates(715, 1048), Coordinates(717, 1049), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(714, 1056, OverworldSprite.ZOMBIE_POSSESSOR), PhotographerConfigEntryObject(725, 1057, OverworldSprite.ZOMBIE_POSSESSOR), PhotographerConfigEntryObject(724, 1046, OverworldSprite.ZOMBIE_POSSESSOR), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C3, 801, 32, 0x0540, 0x10, 0x55, 816, 45, [ Coordinates(807, 36), Coordinates(809, 37), Coordinates(811, 38), Coordinates(810, 40), Coordinates(813, 40), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C4, 70, 920, 0x0600, 0x18, 0x55, 72, 929, [ Coordinates(70, 920), Coordinates(72, 920), Coordinates(73, 918), Coordinates(68, 923), Coordinates(74, 922), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C5, 700, 1138, 0x0480, 0x28, 0x55, 697, 1152, [ Coordinates(699, 1145), Coordinates(701, 1145), Coordinates(697, 1144), Coordinates(703, 1144), Coordinates(705, 1142), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(691, 1142, OverworldSprite.LITTLE_KID_IN_BLUE), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C6, 255, 1115, 0x06C0, 0x18, 0x55, 254, 1127, [ Coordinates(253, 1117), Coordinates(255, 1116), Coordinates(257, 1117), Coordinates(259, 1118), Coordinates(251, 1118), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(264, 1121, OverworldSprite.CRESTED_BOOKA), PhotographerConfigEntryObject(263, 1112, OverworldSprite.SMILIN_SPHERE), PhotographerConfigEntryObject(247, 1123, OverworldSprite.SKELPION), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C7, 465, 1203, 0x06C0, 0x38, 0x55, 462, 1210, [ Coordinates(465, 1203), Coordinates(467, 1204), Coordinates(469, 1205), Coordinates(462, 1204), Coordinates(471, 1204), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(459, 1197, OverworldSprite.MINERS_BROTHER), PhotographerConfigEntryObject(466, 1213, OverworldSprite.BIG_DIRT_SCOOPER), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C8, 708, 1250, 0x06C0, 0x28, 0x55, 713, 1255, [ Coordinates(708, 1250), Coordinates(710, 1249), Coordinates(706, 1249), Coordinates(712, 1248), Coordinates(704, 1248), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2C9, 399, 532, 0x0780, 0x18, 0x55, 411, 547, [ Coordinates(404, 538), Coordinates(406, 539), Coordinates(408, 538), Coordinates(410, 536), Coordinates(409, 540), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2CA, 583, 655, 0x0840, 0x30, 0x55, 578, 667, [ Coordinates(582, 658), Coordinates(584, 658), Coordinates(586, 658), Coordinates(588, 659), Coordinates(585, 660), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2CB, 448, 494, 0x0780, 0x08, 0x55, 440, 504, [ Coordinates(447, 496), Coordinates(446, 495), Coordinates(448, 494), Coordinates(449, 492), Coordinates(449, 490), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2CC, 566, 769, 0x0900, 0x38, 0x55, 562, 777, [ Coordinates(568, 771), Coordinates(570, 772), Coordinates(566, 771), Coordinates(564, 772), Coordinates(571, 771), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2CD, 856, 1037, 0x09C0, 0x18, 0x55, 860, 1046, [ Coordinates(857, 1041), Coordinates(858, 1039), Coordinates(854, 1039), Coordinates(856, 1037), Coordinates(859, 1037), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2CE, 576, 436, 0x0A80, 0x28, 0x55, 573, 451, [ Coordinates(574, 443), Coordinates(576, 444), Coordinates(578, 443), Coordinates(571, 443), Coordinates(579, 442), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2CF, 39, 552, 0x0300, 0x38, 0x55, 43, 562, [ Coordinates(42, 556), Coordinates(44, 554), Coordinates(39, 554), Coordinates(43, 550), Coordinates(46, 555), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(33, 549, OverworldSprite.CAVE_BOY), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D0, 565, 343, 0x0B40, 0x10, 0x55, 559, 352, [ Coordinates(565, 344), Coordinates(567, 344), Coordinates(569, 344), Coordinates(571, 344), Coordinates(563, 344), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D1, 888, 1134, 0x0C00, 0x38, 0x55, 890, 1143, [ Coordinates(886, 1135), Coordinates(888, 1135), Coordinates(890, 1135), Coordinates(892, 1138), Coordinates(889, 1136), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(898, 1134, OverworldSprite.DRINKING_GUY), PhotographerConfigEntryObject(882, 1134, OverworldSprite.BRUNETTE_SHOPPING_LADY), PhotographerConfigEntryObject(890, 1142, OverworldSprite.OLD_LADY_WITH_CANE), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D2, 760, 370, 0x0B40, 0x30, 0x55, 757, 380, [ Coordinates(759, 374), Coordinates(761, 373), Coordinates(763, 374), Coordinates(762, 370), Coordinates(757, 367), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D3, 868, 362, 0x0B40, 0x08, 0x55, 866, 371, [ Coordinates(866, 358), Coordinates(868, 357), Coordinates(872, 357), Coordinates(874, 358), Coordinates(863, 358), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D4, 186, 529, 0x0CC0, 0x10, 0x55, 190, 536, [ Coordinates(185, 530), Coordinates(187, 529), Coordinates(189, 531), Coordinates(191, 532), Coordinates(182, 532), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D5, 224, 611, 0x0CC0, 0x18, 0x55, 229, 615, [ Coordinates(226, 614), Coordinates(227, 612), Coordinates(224, 613), Coordinates(229, 613), Coordinates(220, 613), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(223, 611, OverworldSprite.PYRAMID_DOOR), PhotographerConfigEntryObject(225, 611, OverworldSprite.PYRAMID_DOOR), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D6, 160, 669, 0x0CC0, 0x30, 0x55, 165, 677, [ Coordinates(164, 672), Coordinates(162, 671), Coordinates(160, 671), Coordinates(158, 670), Coordinates(160, 668), Coordinates(166, 671) ], [ PhotographerConfigEntryObject(171, 611, OverworldSprite.DungeonMan), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D7, 657, 958, 0x0D80, 0x38, 0x55, 652, 964, [ Coordinates(658, 960), Coordinates(656, 958), Coordinates(657, 956), Coordinates(660, 957), Coordinates(661, 959), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D8, 49, 39, 0x0E40, 0x10, 0x55, 51, 47, [ Coordinates(50, 38), Coordinates(48, 37), Coordinates(53, 36), Coordinates(46, 36), Coordinates(51, 35), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None), PhotographerConfigEntryObject(0, 0, OverworldSprite.None) ]),
	CreditsPhotograph(EventFlag.UNKNOWN_2D9, 48, 955, 0x0600, 0x00, 0x00, 49, 969, [ Coordinates(48, 953), Coordinates(52, 952), Coordinates(50, 950), Coordinates(46, 951), Coordinates(0, 0), Coordinates(0, 0) ], [ PhotographerConfigEntryObject(49, 956, OverworldSprite.DR_ANDONUTS), PhotographerConfigEntryObject(44, 955, OverworldSprite.APPLE_KID), PhotographerConfigEntryObject(53, 955, OverworldSprite.MR_SATURN), PhotographerConfigEntryObject(42, 951, OverworldSprite.MINER) ]),
];

/// $E1374A
immutable ubyte[] CompressedPaletteUnknown = cast(immutable(ubyte)[])import("unknown_palette.pal.lzhal");

/// $E1CE08
immutable SpriteMap[][9] UnknownE1CF9D = [
	[
		SpriteMap(0x10, 0x3052, 0x04, 0x00),
		SpriteMap(0x08, 0x3042, 0x04, 0x00),
		SpriteMap(0x08, 0x3040, 0xF4, 0x01),
		SpriteMap(0x00, 0x3032, 0x04, 0x00),
		SpriteMap(0xF8, 0x3022, 0x04, 0x00),
		SpriteMap(0xF8, 0x3020, 0xF4, 0x01),
		SpriteMap(0xF0, 0x3012, 0x04, 0x00),
		SpriteMap(0xE8, 0x3002, 0x04, 0x00),
		SpriteMap(0xE8, 0x3000, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x3055, 0x04, 0x00),
		SpriteMap(0x08, 0x3045, 0x04, 0x00),
		SpriteMap(0x08, 0x3043, 0xF4, 0x01),
		SpriteMap(0x00, 0x3035, 0x04, 0x00),
		SpriteMap(0xF8, 0x3025, 0x04, 0x00),
		SpriteMap(0xF8, 0x3023, 0xF4, 0x01),
		SpriteMap(0xF0, 0x3015, 0x04, 0x00),
		SpriteMap(0xE8, 0x3005, 0x04, 0x00),
		SpriteMap(0xE8, 0x3003, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x3058, 0x04, 0x00),
		SpriteMap(0x08, 0x3048, 0x04, 0x00),
		SpriteMap(0x08, 0x3046, 0xF4, 0x01),
		SpriteMap(0x00, 0x3038, 0x04, 0x00),
		SpriteMap(0xF8, 0x3028, 0x04, 0x00),
		SpriteMap(0xF8, 0x3026, 0xF4, 0x01),
		SpriteMap(0xF0, 0x3018, 0x04, 0x00),
		SpriteMap(0xE8, 0x3008, 0x04, 0x00),
		SpriteMap(0xE8, 0x3006, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x305B, 0x04, 0x00),
		SpriteMap(0x08, 0x304B, 0x04, 0x00),
		SpriteMap(0x08, 0x3049, 0xF4, 0x01),
		SpriteMap(0x00, 0x303B, 0x04, 0x00),
		SpriteMap(0xF8, 0x302B, 0x04, 0x00),
		SpriteMap(0xF8, 0x3029, 0xF4, 0x01),
		SpriteMap(0xF0, 0x301B, 0x04, 0x00),
		SpriteMap(0xE8, 0x300B, 0x04, 0x00),
		SpriteMap(0xE8, 0x3009, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x305E, 0x04, 0x00),
		SpriteMap(0x08, 0x304E, 0x04, 0x00),
		SpriteMap(0x08, 0x304C, 0xF4, 0x01),
		SpriteMap(0x00, 0x303E, 0x04, 0x00),
		SpriteMap(0xF8, 0x302E, 0x04, 0x00),
		SpriteMap(0xF8, 0x302C, 0xF4, 0x01),
		SpriteMap(0xF0, 0x301E, 0x04, 0x00),
		SpriteMap(0xE8, 0x300E, 0x04, 0x00),
		SpriteMap(0xE8, 0x300C, 0xF4, 0x81),
	],
	[
		SpriteMap(0x08, 0x3140, 0xFC, 0x01),
		SpriteMap(0xF8, 0x3120, 0xFC, 0x01),
		SpriteMap(0xE8, 0x3100, 0xFC, 0x01),
		SpriteMap(0x10, 0x305F, 0xF4, 0x00),
		SpriteMap(0x08, 0x304F, 0xF4, 0x00),
		SpriteMap(0x00, 0x303F, 0xF4, 0x00),
		SpriteMap(0xF8, 0x302F, 0xF4, 0x00),
		SpriteMap(0xF0, 0x301F, 0xF4, 0x00),
		SpriteMap(0xE8, 0x300F, 0xF4, 0x80),
	],
	[
		SpriteMap(0x10, 0x3154, 0x04, 0x00),
		SpriteMap(0x08, 0x3144, 0x04, 0x00),
		SpriteMap(0x08, 0x3142, 0xF4, 0x01),
		SpriteMap(0x00, 0x3134, 0x04, 0x00),
		SpriteMap(0xF8, 0x3124, 0x04, 0x00),
		SpriteMap(0xF8, 0x3122, 0xF4, 0x01),
		SpriteMap(0xF0, 0x3114, 0x04, 0x00),
		SpriteMap(0xE8, 0x3104, 0x04, 0x00),
		SpriteMap(0xE8, 0x3102, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x3157, 0x04, 0x00),
		SpriteMap(0x08, 0x3147, 0x04, 0x00),
		SpriteMap(0x08, 0x3145, 0xF4, 0x01),
		SpriteMap(0x00, 0x3137, 0x04, 0x00),
		SpriteMap(0xF8, 0x3127, 0x04, 0x00),
		SpriteMap(0xF8, 0x3125, 0xF4, 0x01),
		SpriteMap(0xF0, 0x3117, 0x04, 0x00),
		SpriteMap(0xE8, 0x3107, 0x04, 0x00),
		SpriteMap(0xE8, 0x3105, 0xF4, 0x81),
	],
	[
		SpriteMap(0x10, 0x315A, 0x04, 0x00),
		SpriteMap(0x08, 0x314A, 0x04, 0x00),
		SpriteMap(0x08, 0x3148, 0xF4, 0x01),
		SpriteMap(0x00, 0x313A, 0x04, 0x00),
		SpriteMap(0xF8, 0x312A, 0x04, 0x00),
		SpriteMap(0xF8, 0x3128, 0xF4, 0x01),
		SpriteMap(0xF0, 0x311A, 0x04, 0x00),
		SpriteMap(0xE8, 0x310A, 0x04, 0x00),
		SpriteMap(0xE8, 0x3108, 0xF4, 0x81),
	]
];

/// $E14EC1
immutable ubyte[] APEArrangement = cast(immutable(ubyte)[])import("intro/logos/ape.arr.lzhal");

/// $E14F2A
immutable ubyte[] APEGraphics = cast(immutable(ubyte)[])import("intro/logos/ape.gfx.lzhal");

/// $E15130
immutable ubyte[] APEPalette = cast(immutable(ubyte)[])import("intro/logos/ape.pal.lzhal");

/// $E15174
immutable ubyte[] HALKENArrangement = cast(immutable(ubyte)[])import("intro/logos/halken.arr.lzhal");

/// $E151E8
immutable ubyte[] HALKENGraphics = cast(immutable(ubyte)[])import("intro/logos/halken.gfx.lzhal");

/// $E153B8
immutable ubyte[] HALKENPalette = cast(immutable(ubyte)[])import("intro/logos/halken.pal.lzhal");

/// $E15455
immutable ubyte[] NintendoArrangement = cast(immutable(ubyte)[])import("intro/logos/nintendo.arr.lzhal");

/// $E1549E
immutable ubyte[] NintendoGraphics = cast(immutable(ubyte)[])import("intro/logos/nintendo.gfx.lzhal");

/// $E1558F
immutable ubyte[] NintendoPalette = cast(immutable(ubyte)[])import("intro/logos/nintendo.pal.lzhal");

/// $E155D3
immutable ubyte[] GasStationArrangement = cast(immutable(ubyte)[])import("intro/gas_station.arr.lzhal");

/// $E15B33
immutable ubyte[] GasStationGraphics = cast(immutable(ubyte)[])import("intro/gas_station.gfx.lzhal");

/// $E1A9B7
immutable ubyte[] GasStationPalette = cast(immutable(ubyte)[])import("intro/gas_station.pal.lzhal");

/// $E1AA5D
immutable ubyte[] GasStationPalette2 = cast(immutable(ubyte)[])import("intro/gas_station2.pal.lzhal");

/// $E1AADF
immutable ubyte[] ProducedItoiArrangement = cast(immutable(ubyte)[])import("intro/attract/produced_by_itoi.arr.lzhal");

/// $E1AB4B
immutable ubyte[] ProducedItoiGraphics = cast(immutable(ubyte)[])import("intro/attract/produced_by_itoi.gfx.lzhal");

/// $E1AD01
immutable ubyte[] NintendoPresentationArrangement = cast(immutable(ubyte)[])import("intro/attract/nintendo_presentation.arr.lzhal");

/// $E1AD4E
immutable ubyte[] NintendoPresentationGraphics = cast(immutable(ubyte)[])import("intro/attract/nintendo_presentation.gfx.lzhal");

/// $E1AE6F
immutable ubyte[] NintendoItoiPalette = cast(immutable(ubyte)[])import("intro/attract/nintendo_itoi.pal.lzhal");

/// $E1AE7C
immutable ubyte[] UnknownE1AE7C = cast(immutable(ubyte)[])import("E1AE7C.bin.lzhal");

/// $E1AF7D
immutable ubyte[] TitleScreenArrangement = cast(immutable(ubyte)[])import("intro/title_screen.arr.lzhal");

/// $E1B211
immutable ubyte[] TitleScreenGraphics = cast(immutable(ubyte)[])import("intro/title_screen.gfx.lzhal");

/// $E1C6E5
immutable ubyte[] UnknownE1C6E5 = cast(immutable(ubyte)[])import("intro/title_screen_letters.gfx.lzhal");

/// $E1CFAF
immutable ubyte[] UnknownE1CFAF = cast(immutable(ubyte)[])import("E1CFAF.gfx.lzhal");

/// $E1D4F4
immutable ubyte[] UnknownE1D4F4 = cast(immutable(ubyte)[])import("E1D4F4.pal.lzhal");

/// $E1D5E8
immutable ubyte[] UnknownE1D5E8 = cast(immutable(ubyte)[])import("E1D5E8.arr.lzhal");

/// $E1EA50
immutable ubyte[] TownMapLabelGfx = cast(immutable(ubyte)[])import("town_maps/label.gfx.lzhal");

/// $E1F1C3
immutable ubyte[] TownMapIconPalette = cast(immutable(ubyte)[])import("town_maps/icon.pal");

/// $E1F44C
immutable SpriteMap[][23] UnknownE1F44C = [
	[
		SpriteMap(0x00, 0x320C, 0x00, 0x01),
		SpriteMap(0x00, 0x320E, 0x10, 0x01),
		SpriteMap(0x10, 0x322C, 0x00, 0x00),
		SpriteMap(0x10, 0x322D, 0x08, 0x00),
		SpriteMap(0x10, 0x322E, 0x10, 0x00),
		SpriteMap(0x10, 0x322F, 0x18, 0x80),
	],
	[
		SpriteMap(0x00, 0x3290, 0x00, 0x01),
		SpriteMap(0x00, 0x3292, 0x10, 0x01),
		SpriteMap(0x10, 0x32B0, 0x00, 0x00),
		SpriteMap(0x10, 0x32B1, 0x08, 0x00),
		SpriteMap(0x10, 0x32B2, 0x10, 0x00),
		SpriteMap(0x10, 0x32B3, 0x18, 0x80),
	],
	[
		SpriteMap(0x00, 0x32BC, 0x00, 0x01),
		SpriteMap(0x00, 0x32BE, 0x10, 0x00),
		SpriteMap(0x08, 0x32CE, 0x10, 0x00),
		SpriteMap(0x10, 0x32DC, 0x00, 0x00),
		SpriteMap(0x10, 0x32DD, 0x08, 0x00),
		SpriteMap(0x10, 0x32DE, 0x10, 0x80),
	],
	[
		SpriteMap(0x00, 0x3294, 0x00, 0x01),
		SpriteMap(0x00, 0x3296, 0x10, 0x01),
		SpriteMap(0x10, 0x32B4, 0x00, 0x00),
		SpriteMap(0x10, 0x32B5, 0x08, 0x00),
		SpriteMap(0x10, 0x32B6, 0x10, 0x00),
		SpriteMap(0x10, 0x32B7, 0x18, 0x80),
	],
	[
		SpriteMap(0x00, 0x3236, 0x00, 0x01),
		SpriteMap(0x00, 0x3238, 0x10, 0x01),
		SpriteMap(0x00, 0x323A, 0x20, 0x00),
		SpriteMap(0x08, 0x324A, 0x20, 0x00),
		SpriteMap(0x10, 0x3256, 0x00, 0x00),
		SpriteMap(0x10, 0x3257, 0x08, 0x00),
		SpriteMap(0x10, 0x3258, 0x10, 0x00),
		SpriteMap(0x10, 0x3259, 0x18, 0x00),
		SpriteMap(0x10, 0x325A, 0x20, 0x80),
	],
	[
		SpriteMap(0x00, 0x32C0, 0x00, 0x01),
		SpriteMap(0x00, 0x32C2, 0x10, 0x00),
		SpriteMap(0x08, 0x32D2, 0x10, 0x00),
		SpriteMap(0x10, 0x32E0, 0x00, 0x00),
		SpriteMap(0x10, 0x32E1, 0x08, 0x00),
		SpriteMap(0x10, 0x32E2, 0x10, 0x80),
	],
	[
		SpriteMap(0x00, 0x323B, 0x00, 0x01),
		SpriteMap(0x00, 0x323D, 0x10, 0x01),
		SpriteMap(0x00, 0x323F, 0x20, 0x00),
		SpriteMap(0x08, 0x324F, 0x20, 0x00),
		SpriteMap(0x10, 0x325B, 0x00, 0x00),
		SpriteMap(0x10, 0x325C, 0x08, 0x00),
		SpriteMap(0x10, 0x325D, 0x10, 0x00),
		SpriteMap(0x10, 0x325E, 0x18, 0x00),
		SpriteMap(0x10, 0x325F, 0x20, 0x80),
	],
	[
		SpriteMap(0x00, 0x326F, 0x00, 0x80),
	],
	[
		SpriteMap(0x00, 0x3260, 0x00, 0x01),
		SpriteMap(0x00, 0x3262, 0x10, 0x01),
		SpriteMap(0x00, 0x3264, 0x20, 0x00),
		SpriteMap(0x08, 0x3274, 0x20, 0x00),
		SpriteMap(0x10, 0x3280, 0x00, 0x00),
		SpriteMap(0x10, 0x3281, 0x08, 0x00),
		SpriteMap(0x10, 0x3282, 0x10, 0x00),
		SpriteMap(0x10, 0x3283, 0x18, 0x00),
		SpriteMap(0x10, 0x3284, 0x20, 0x80),
	],
	[
		SpriteMap(0x00, 0x329C, 0x00, 0x01),
		SpriteMap(0x00, 0x329E, 0x10, 0x81),
	],
	[
		SpriteMap(0x00, 0x3265, 0x00, 0x01),
		SpriteMap(0x00, 0x3267, 0x10, 0x01),
		SpriteMap(0x00, 0x3269, 0x20, 0x00),
		SpriteMap(0x08, 0x3279, 0x20, 0x00),
		SpriteMap(0x10, 0x3285, 0x00, 0x00),
		SpriteMap(0x10, 0x3286, 0x08, 0x00),
		SpriteMap(0x10, 0x3287, 0x10, 0x00),
		SpriteMap(0x10, 0x3288, 0x18, 0x00),
		SpriteMap(0x10, 0x3289, 0x20, 0x80),
	],
	[
		SpriteMap(0x00, 0x3200, 0x00, 0x01),
		SpriteMap(0x00, 0x3202, 0x10, 0x01),
		SpriteMap(0x00, 0x3204, 0x20, 0x01),
		SpriteMap(0x10, 0x3220, 0x00, 0x00),
		SpriteMap(0x10, 0x3221, 0x08, 0x00),
		SpriteMap(0x10, 0x3222, 0x10, 0x00),
		SpriteMap(0x10, 0x3223, 0x18, 0x00),
		SpriteMap(0x10, 0x3224, 0x20, 0x00),
		SpriteMap(0x10, 0x3225, 0x28, 0x80),
	],
	[
		SpriteMap(0x00, 0x3206, 0x00, 0x01),
		SpriteMap(0x00, 0x3208, 0x10, 0x01),
		SpriteMap(0x00, 0x320A, 0x20, 0x01),
		SpriteMap(0x10, 0x3226, 0x00, 0x00),
		SpriteMap(0x10, 0x3227, 0x08, 0x00),
		SpriteMap(0x10, 0x3228, 0x10, 0x00),
		SpriteMap(0x10, 0x3229, 0x18, 0x00),
		SpriteMap(0x10, 0x322A, 0x20, 0x00),
		SpriteMap(0x10, 0x322B, 0x28, 0x80),
	],
	[
		SpriteMap(0x00, 0x3230, 0x00, 0x01),
		SpriteMap(0x00, 0x3232, 0x10, 0x01),
		SpriteMap(0x00, 0x3234, 0x20, 0x01),
		SpriteMap(0x10, 0x3250, 0x00, 0x00),
		SpriteMap(0x10, 0x3251, 0x08, 0x00),
		SpriteMap(0x10, 0x3252, 0x10, 0x00),
		SpriteMap(0x10, 0x3253, 0x18, 0x00),
		SpriteMap(0x10, 0x3254, 0x20, 0x00),
		SpriteMap(0x10, 0x3255, 0x28, 0x80),
	],
	[
		SpriteMap(0x00, 0x326A, 0x00, 0x01),
		SpriteMap(0x00, 0x326C, 0x10, 0x01),
		SpriteMap(0x00, 0x326E, 0x20, 0x00),
		SpriteMap(0x08, 0x327E, 0x20, 0x00),
		SpriteMap(0x10, 0x328A, 0x00, 0x00),
		SpriteMap(0x10, 0x328B, 0x08, 0x00),
		SpriteMap(0x10, 0x328C, 0x10, 0x00),
		SpriteMap(0x10, 0x328D, 0x18, 0x00),
		SpriteMap(0x10, 0x328E, 0x20, 0x80),
	],
	[
		SpriteMap(0x00, 0x3298, 0x00, 0x01),
		SpriteMap(0x00, 0x329A, 0x10, 0x01),
		SpriteMap(0x10, 0x32B8, 0x00, 0x00),
		SpriteMap(0x10, 0x32B9, 0x08, 0x00),
		SpriteMap(0x10, 0x32BA, 0x10, 0x00),
		SpriteMap(0x10, 0x32BB, 0x18, 0x80),
	],
	[
		SpriteMap(0x00, 0x32C3, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0x32C5, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0x32C7, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0x32C9, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0x3300, 0x00, 0x81),
	],
	[
		SpriteMap(0x00, 0x3302, 0x00, 0x81),
	]
];

/// $E1F47A
immutable ubyte[23] UnknownE1F47A = [0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

/// $E1F491
immutable TownMapIconPlacement[][6] TownMapIconPlacementTable = [
	[
		TownMapIconPlacement(0x55, 0x5B, 0x06, EventFlag.UNKNOWN_22E),
		TownMapIconPlacement(0x6A, 0x5E, 0x01, EventFlag.UNKNOWN_22F),
		TownMapIconPlacement(0x8C, 0x7B, 0x03, EventFlag.UNKNOWN_230),
		TownMapIconPlacement(0x1D, 0x9E, 0x05, EventFlag.UNKNOWN_231),
		TownMapIconPlacement(0x75, 0xA6, 0x02, EventFlag.UNKNOWN_232),
		TownMapIconPlacement(0x60, 0xBE, 0x09, EventFlag.UNKNOWN_233),
		TownMapIconPlacement(0xBB, 0x5E, 0x10, EventFlag.UNKNOWN_2A9 | EVENT_FLAG_UNSET),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x48, 0x2A, 0x03, EventFlag.UNKNOWN_234),
		TownMapIconPlacement(0x70, 0x2E, 0x07, EventFlag.UNKNOWN_235),
		TownMapIconPlacement(0x20, 0x30, 0x0A, EventFlag.UNKNOWN_236),
		TownMapIconPlacement(0xD0, 0x9A, 0x08, EventFlag.UNKNOWN_237),
		TownMapIconPlacement(0xB8, 0x09, 0x05, EventFlag.UNKNOWN_238),
		TownMapIconPlacement(0x78, 0xB8, 0x0B, EventFlag.UNKNOWN_239),
		TownMapIconPlacement(0x60, 0x70, 0x02, EventFlag.UNKNOWN_2A1),
		TownMapIconPlacement(0xD0, 0x3D, 0x10, EventFlag.UNKNOWN_2AA | EVENT_FLAG_UNSET),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x48, 0x6B, 0x06, EventFlag.UNKNOWN_23A),
		TownMapIconPlacement(0x70, 0x3B, 0x03, EventFlag.UNKNOWN_23B),
		TownMapIconPlacement(0x8C, 0x67, 0x02, EventFlag.UNKNOWN_23D),
		TownMapIconPlacement(0x7E, 0x6B, 0x05, EventFlag.UNKNOWN_23E),
		TownMapIconPlacement(0x18, 0x8E, 0x0C, EventFlag.UNKNOWN_282),
		TownMapIconPlacement(0xB0, 0x8E, 0x0D, EventFlag.UNKNOWN_281),
		TownMapIconPlacement(0x6C, 0x5D, 0x08, EventFlag.UNKNOWN_2A4),
		TownMapIconPlacement(0x73, 0x61, 0x08, EventFlag.UNKNOWN_2A5),
		TownMapIconPlacement(0xD7, 0x0A, 0x10, EventFlag.UNKNOWN_2AB | EVENT_FLAG_UNSET),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x74, 0x0A, 0x05, EventFlag.UNKNOWN_23F),
		TownMapIconPlacement(0xC2, 0x28, 0x07, EventFlag.UNKNOWN_240),
		TownMapIconPlacement(0xAC, 0x84, 0x02, EventFlag.UNKNOWN_241),
		TownMapIconPlacement(0x40, 0x7B, 0x03, EventFlag.UNKNOWN_242),
		TownMapIconPlacement(0x10, 0xC0, 0x0E, EventFlag.UNKNOWN_280),
		TownMapIconPlacement(0x3E, 0xC8, 0x08, EventFlag.UNKNOWN_2A6),
		TownMapIconPlacement(0x58, 0x77, 0x10, EventFlag.UNKNOWN_2AC | EVENT_FLAG_UNSET),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x80, 0x1B, 0x03, EventFlag.UNKNOWN_243),
		TownMapIconPlacement(0x88, 0x09, 0x05, EventFlag.UNKNOWN_244),
		TownMapIconPlacement(0xB0, 0x12, 0x06, EventFlag.UNKNOWN_245),
		TownMapIconPlacement(0xAC, 0x2E, 0x02, EventFlag.UNKNOWN_2A2),
		TownMapIconPlacement(0x8D, 0x5E, 0x10, EventFlag.UNKNOWN_2AE | EVENT_FLAG_UNSET),
		TownMapIconPlacement(0xFF)
	],
	[
		TownMapIconPlacement(0x40, 0x04, 0x03, EventFlag.UNKNOWN_246),
		TownMapIconPlacement(0x71, 0x04, 0x04, EventFlag.UNKNOWN_247),
		TownMapIconPlacement(0xA5, 0x04, 0x06, EventFlag.UNKNOWN_248),
		TownMapIconPlacement(0x61, 0x6C, 0x05, EventFlag.UNKNOWN_249),
		TownMapIconPlacement(0xA0, 0x72, 0x06, EventFlag.UNKNOWN_24A),
		TownMapIconPlacement(0x48, 0x6C, 0x10, EventFlag.UNKNOWN_2AD | EVENT_FLAG_UNSET),
		TownMapIconPlacement(0xFF)
	]
];

