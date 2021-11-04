module earthbound.bank10;

import earthbound.commondefs;

// $D02188
immutable RGB[4] MovementTextStringPalette = [
	RGB(0,0,0),
	RGB(17,18,17),
	RGB(17,18,17),
	RGB(31,31,27)
];

// $D0C60D
immutable BattleEntryPointer[484] BattleEntryPointerTable = [
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.SPITEFUL_CROW),
		BattleGroupEnemy(0xFF),
		BattleGroupEnemy(1, EnemyID.PETRIFIED_ROYAL_GUARD),
		BattleGroupEnemy(1, EnemyID.LOADED_DICE_1),
		BattleGroupEnemy(1, EnemyID.DEMONIC_PETUNIA),
		BattleGroupEnemy(1, EnemyID.CRESTED_BOOKA),
		BattleGroupEnemy(1, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(1, EnemyID.MAD_TAXI),
		BattleGroupEnemy(1, EnemyID.RUNAWAY_DOG_1),
		BattleGroupEnemy(1, EnemyID.RAMBLIN_EVIL_MUSHROOM),
		BattleGroupEnemy(2, EnemyID.STARMAN_1)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SPITEFUL_CROW),
		BattleGroupEnemy(0xFF)
	], 0x0040, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.RUNAWAY_DOG_1),
		BattleGroupEnemy(0xFF)
	], 0x0040, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.COIL_SNAKE),
		BattleGroupEnemy(0xFF)
	], 0x0040, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GHOST_OF_STARMAN_1),
		BattleGroupEnemy(1, EnemyID.EVIL_EYE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GHOST_OF_STARMAN_1),
		BattleGroupEnemy(1, EnemyID.MECHANICAL_OCTOBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVIL_EYE),
		BattleGroupEnemy(1, EnemyID.MECHANICAL_OCTOBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GHOST_OF_STARMAN_1),
		BattleGroupEnemy(1, EnemyID.MECHANICAL_OCTOBOT),
		BattleGroupEnemy(1, EnemyID.EVIL_EYE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKATE_PUNK),
		BattleGroupEnemy(1, EnemyID.YES_MAN_JUNIOR),
		BattleGroupEnemy(0, EnemyID.POGO_PUNK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKATE_PUNK),
		BattleGroupEnemy(1, EnemyID.POGO_PUNK),
		BattleGroupEnemy(0, EnemyID.YES_MAN_JUNIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.POGO_PUNK),
		BattleGroupEnemy(1, EnemyID.YES_MAN_JUNIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKATE_PUNK),
		BattleGroupEnemy(1, EnemyID.YES_MAN_JUNIOR),
		BattleGroupEnemy(1, EnemyID.POGO_PUNK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.RUNAWAY_DOG_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SPITEFUL_CROW),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GRUFF_GOAT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(1, EnemyID.WHIRLING_ROBO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(1, EnemyID.WOOLY_SHAMBLER),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.WOOLY_SHAMBLER),
		BattleGroupEnemy(1, EnemyID.WHIRLING_ROBO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(1, EnemyID.WHIRLING_ROBO),
		BattleGroupEnemy(1, EnemyID.WOOLY_SHAMBLER),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SPITEFUL_CROW),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GRUFF_GOAT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.RUNAWAY_DOG_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(1, EnemyID.WHIRLING_ROBO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(1, EnemyID.WOOLY_SHAMBLER),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.WOOLY_SHAMBLER),
		BattleGroupEnemy(1, EnemyID.WHIRLING_ROBO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(1, EnemyID.WOOLY_SHAMBLER),
		BattleGroupEnemy(1, EnemyID.WHIRLING_ROBO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CAVE_BOY_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.CAVE_BOY_1),
		BattleGroupEnemy(1, EnemyID.MIGHTY_BEAR_SEVEN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CAVE_BOY_1),
		BattleGroupEnemy(2, EnemyID.MIGHTY_BEAR_SEVEN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CAVE_BOY_1),
		BattleGroupEnemy(1, EnemyID.MIGHTY_BEAR_SEVEN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.BLACK_ANTOID_1),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.RAMBLIN_EVIL_MUSHROOM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RAMBLIN_EVIL_MUSHROOM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.BLACK_ANTOID_1),
		BattleGroupEnemy(1, EnemyID.RAMBLIN_EVIL_MUSHROOM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.RAMBLIN_EVIL_MUSHROOM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RAMBLIN_EVIL_MUSHROOM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RUNAWAY_DOG_1),
		BattleGroupEnemy(1, EnemyID.COP),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRANKY_LADY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ANNOYING_OLD_PARTY_MAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.UNASSUMING_LOCAL_GUY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.NEW_AGE_RETRO_HIPPIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.RAMBLIN_EVIL_MUSHROOM),
		BattleGroupEnemy(1, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RAMBLIN_EVIL_MUSHROOM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.TERRITORIAL_OAK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.TERRITORIAL_OAK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.LIL_UFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TERRITORIAL_OAK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SPINNING_ROBO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LIL_UFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LIL_UFO),
		BattleGroupEnemy(1, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LIL_UFO),
		BattleGroupEnemy(1, EnemyID.SPINNING_ROBO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.LIL_UFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.INSANE_CULTIST_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.INSANE_CULTIST_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.SPITEFUL_CROW),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SPITEFUL_CROW),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRANKY_LADY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ANNOYING_OLD_PARTY_MAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.NEW_AGE_RETRO_HIPPIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TRICK_OR_TRICK_KID),
		BattleGroupEnemy(1, EnemyID.HANDSOME_TOM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TRICK_OR_TRICK_KID),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HANDSOME_TOM),
		BattleGroupEnemy(1, EnemyID.SMILIN_SAM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HANDSOME_TOM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SMILIN_SAM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.URBAN_ZOMBIE_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(1, EnemyID.URBAN_ZOMBIE_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.NO_GOOD_FLY),
		BattleGroupEnemy(1, EnemyID.PUTRID_MOLDYMAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PUTRID_MOLDYMAN),
		BattleGroupEnemy(1, EnemyID.SMELLY_GHOST),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(1, EnemyID.PUTRID_MOLDYMAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(1, EnemyID.SMELLY_GHOST),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PUTRID_MOLDYMAN),
		BattleGroupEnemy(1, EnemyID.SMELLY_GHOST),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.NO_GOOD_FLY),
		BattleGroupEnemy(1, EnemyID.PUTRID_MOLDYMAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.NO_GOOD_FLY),
		BattleGroupEnemy(1, EnemyID.SMELLY_GHOST),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.NO_GOOD_FLY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ZOMBIE_DOG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ZOMBIE_DOG),
		BattleGroupEnemy(2, EnemyID.NO_GOOD_FLY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.BLACK_ANTOID_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(2, EnemyID.BLACK_ANTOID_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(1, EnemyID.FARM_ZOMBIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.FARM_ZOMBIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(1, EnemyID.FARM_ZOMBIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(1, EnemyID.FARM_ZOMBIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PLAIN_CROCODILE),
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PLAIN_CROCODILE),
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(1, EnemyID.FARM_ZOMBIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PLAIN_CROCODILE),
		BattleGroupEnemy(1, EnemyID.FARM_ZOMBIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.PLAIN_CROCODILE),
		BattleGroupEnemy(1, EnemyID.FARM_ZOMBIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.BLACK_ANTOID_2),
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.BLACK_ANTOID_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(2, EnemyID.BLACK_ANTOID_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(1, EnemyID.PLAIN_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.PLAIN_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.RED_ANTOID),
		BattleGroupEnemy(2, EnemyID.PLAIN_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.RED_ANTOID),
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PLAIN_CROCODILE),
		BattleGroupEnemy(2, EnemyID.ARMORED_FROG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.PLAIN_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.VIOLENT_ROACH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.STRUTTIN_EVIL_MUSHROOM_1),
		BattleGroupEnemy(1, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BAD_BUFFALO),
		BattleGroupEnemy(1, EnemyID.DESERT_WOLF),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BAD_BUFFALO),
		BattleGroupEnemy(1, EnemyID.SMILIN_SPHERE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BAD_BUFFALO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DESERT_WOLF),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKELPION),
		BattleGroupEnemy(1, EnemyID.CuteLilUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKELPION),
		BattleGroupEnemy(1, EnemyID.SMILIN_SPHERE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKELPION),
		BattleGroupEnemy(1, EnemyID.SMILIN_SPHERE),
		BattleGroupEnemy(1, EnemyID.CuteLilUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKELPION),
		BattleGroupEnemy(1, EnemyID.CRESTED_BOOKA),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKELPION),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.SKELPION),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRESTED_BOOKA),
		BattleGroupEnemy(1, EnemyID.BAD_BUFFALO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRESTED_BOOKA),
		BattleGroupEnemy(1, EnemyID.DESERT_WOLF),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRESTED_BOOKA),
		BattleGroupEnemy(1, EnemyID.CuteLilUFO),
		BattleGroupEnemy(1, EnemyID.SMILIN_SPHERE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRESTED_BOOKA),
		BattleGroupEnemy(1, EnemyID.CuteLilUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRESTED_BOOKA),
		BattleGroupEnemy(1, EnemyID.SMILIN_SPHERE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MAD_TAXI),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EXTRA_CRANKY_LADY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ANNOYING_REVELER),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRAZED_SIGN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DALIS_CLOCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ENRAGED_FIRE_PLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ENRAGED_FIRE_PLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ABSTRACT_ART),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ROBO_PUMP_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ROBO_PUMP_1),
		BattleGroupEnemy(1, EnemyID.ENRAGED_FIRE_PLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MAD_TAXI),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MAD_TAXI),
		BattleGroupEnemy(1, EnemyID.CRAZED_SIGN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRAZED_SIGN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TOUGH_GUY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.OVER_ZEALOUS_COP),
		BattleGroupEnemy(1, EnemyID.TOUGH_GUY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.OVER_ZEALOUS_COP),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HIGH_CLASS_UFO),
		BattleGroupEnemy(1, EnemyID.BeautifulUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HIGH_CLASS_UFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.HIGH_CLASS_UFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BeautifulUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DREAD_SKELPION),
		BattleGroupEnemy(1, EnemyID.GREAT_CRESTED_BOOKA),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DREAD_SKELPION),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GREAT_CRESTED_BOOKA),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GREAT_CRESTED_BOOKA),
		BattleGroupEnemy(1, EnemyID.DREAD_SKELPION),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.GREAT_CRESTED_BOOKA),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.HIGH_CLASS_UFO),
		BattleGroupEnemy(1, EnemyID.BeautifulUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HIGH_CLASS_UFO),
		BattleGroupEnemy(1, EnemyID.MARAUDER_OCTOBOT),
		BattleGroupEnemy(1, EnemyID.BeautifulUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.HIGH_CLASS_UFO),
		BattleGroupEnemy(1, EnemyID.MARAUDER_OCTOBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BeautifulUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MARAUDER_OCTOBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HOSTILE_ELDER_OAK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.PIT_BULL_SLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DEMONIC_PETUNIA),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BIG_PILE_OF_PUKE_1),
		BattleGroupEnemy(0, EnemyID.EVEN_SLIMIER_LITTLE_PILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BIG_PILE_OF_PUKE_1),
		BattleGroupEnemy(1, EnemyID.EVEN_SLIMIER_LITTLE_PILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HOSTILE_ELDER_OAK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ZAP_EEL),
		BattleGroupEnemy(1, EnemyID.HARD_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ZAP_EEL),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVEN_SLIMIER_LITTLE_PILE),
		BattleGroupEnemy(1, EnemyID.ZAP_EEL),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVEN_SLIMIER_LITTLE_PILE),
		BattleGroupEnemy(1, EnemyID.HARD_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVEN_SLIMIER_LITTLE_PILE),
		BattleGroupEnemy(1, EnemyID.MANLY_FISH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MANLY_FISH),
		BattleGroupEnemy(1, EnemyID.HARD_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MANLY_FISH),
		BattleGroupEnemy(1, EnemyID.MANLY_FISHS_BROTHER),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(6, EnemyID.PIT_BULL_SLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DEMONIC_PETUNIA),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DEMONIC_PETUNIA),
		BattleGroupEnemy(1, EnemyID.HOSTILE_ELDER_OAK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.WETNOSAUR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CHOMPOSAUR_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EGO_ORB),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CARE_FREE_BOMB),
		BattleGroupEnemy(2, EnemyID.MR_MOLECULE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.CARE_FREE_BOMB),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FRENCH_KISS_OF_DEATH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LOADED_DICE_1),
		BattleGroupEnemy(0, EnemyID.CARE_FREE_BOMB),
		BattleGroupEnemy(0, EnemyID.BeautifulUFO),
		BattleGroupEnemy(0, EnemyID.HIGH_CLASS_UFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LOADED_DICE_2),
		BattleGroupEnemy(0, EnemyID.ELECTRO_SWOOSH),
		BattleGroupEnemy(0, EnemyID.FOBBY),
		BattleGroupEnemy(0, EnemyID.UNCONTROLLABLE_SPHERE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ELECTRO_SWOOSH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ELECTRO_SWOOSH),
		BattleGroupEnemy(1, EnemyID.FRENCH_KISS_OF_DEATH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.MR_MOLECULE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.MR_MOLECULE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ROWDY_MOUSE),
		BattleGroupEnemy(1, EnemyID.ATTACK_SLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ROWDY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STRUTTIN_EVIL_MUSHROOM_2),
		BattleGroupEnemy(1, EnemyID.ROWDY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STRUTTIN_EVIL_MUSHROOM_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.STRUTTIN_EVIL_MUSHROOM_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ATTACK_SLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.ATTACK_SLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ELDER_BATTY),
		BattleGroupEnemy(1, EnemyID.ARACHNID),
		BattleGroupEnemy(0xFF)
	], 0x00C0, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ELDER_BATTY),
		BattleGroupEnemy(0xFF)
	], 0x00C0, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ELDER_BATTY),
		BattleGroupEnemy(1, EnemyID.ARACHNID),
		BattleGroupEnemy(0xFF)
	], 0x00C0, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ELDER_BATTY),
		BattleGroupEnemy(1, EnemyID.STRONG_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x00C0, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STRONG_CROCODILE),
		BattleGroupEnemy(1, EnemyID.ARACHNID),
		BattleGroupEnemy(0xFF)
	], 0x00C0, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STRONG_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x00C0, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.STRONG_CROCODILE),
		BattleGroupEnemy(0xFF)
	], 0x00C0, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ARACHNID),
		BattleGroupEnemy(0xFF)
	], 0x00C0, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BLACK_ANTOID_1),
		BattleGroupEnemy(1, EnemyID.ROWDY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BLACK_ANTOID_1),
		BattleGroupEnemy(1, EnemyID.ATTACK_SLUG),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BLACK_ANTOID_1),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.BLACK_ANTOID_1),
		BattleGroupEnemy(1, EnemyID.ROWDY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.BLACK_ANTOID_1),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ROWDY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ROWDY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.ATTACK_SLUG),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(6, EnemyID.ATTACK_SLUG),
		BattleGroupEnemy(0xFF)
	], 0x00BE, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOLE_PLAYING_ROUGH),
		BattleGroupEnemy(0xFF)
	], 0x00BF, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MR_BATTY),
		BattleGroupEnemy(0xFF)
	], 0x00BF, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MR_BATTY),
		BattleGroupEnemy(1, EnemyID.MOLE_PLAYING_ROUGH),
		BattleGroupEnemy(0xFF)
	], 0x00BF, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MR_BATTY),
		BattleGroupEnemy(1, EnemyID.MIGHTY_BEAR),
		BattleGroupEnemy(0xFF)
	], 0x00BF, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.MR_BATTY),
		BattleGroupEnemy(0xFF)
	], 0x00BF, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOLE_PLAYING_ROUGH),
		BattleGroupEnemy(0xFF)
	], 0x00BF, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MOLE_PLAYING_ROUGH),
		BattleGroupEnemy(1, EnemyID.MIGHTY_BEAR),
		BattleGroupEnemy(0xFF)
	], 0x00BF, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MIGHTY_BEAR),
		BattleGroupEnemy(0xFF)
	], 0x00BF, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MIGHTY_BEAR),
		BattleGroupEnemy(1, EnemyID.MR_BATTY),
		BattleGroupEnemy(0xFF)
	], 0x00BF, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.URBAN_ZOMBIE_1),
		BattleGroupEnemy(1, EnemyID.ZOMBIE_DOG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.URBAN_ZOMBIE_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ZOMBIE_DOG),
		BattleGroupEnemy(2, EnemyID.NO_GOOD_FLY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(1, EnemyID.URBAN_ZOMBIE_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(1, EnemyID.URBAN_ZOMBIE_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.VIOLENT_ROACH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FOPPY_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.FOPPY_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.FOPPY_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.FOPPY_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(6, EnemyID.FOPPY_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.MOSTLY_BAD_FLY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SLIMY_LIL_PILE),
		BattleGroupEnemy(1, EnemyID.MOSTLY_BAD_FLY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SLIMY_LIL_PILE),
		BattleGroupEnemy(2, EnemyID.MOSTLY_BAD_FLY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SLIMY_LIL_PILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.SLIMY_LIL_PILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.SLIMY_LIL_PILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.FARM_ZOMBIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.FARM_ZOMBIE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STRUTTIN_EVIL_MUSHROOM_1),
		BattleGroupEnemy(2, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.STRUTTIN_EVIL_MUSHROOM_1),
		BattleGroupEnemy(1, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.STRUTTIN_EVIL_MUSHROOM_1),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.STRUTTIN_EVIL_MUSHROOM_1),
		BattleGroupEnemy(1, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STRUTTIN_EVIL_MUSHROOM_1),
		BattleGroupEnemy(1, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.RANBOOB),
		BattleGroupEnemy(0xFF)
	], 0x00C1, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.STRUTTIN_EVIL_MUSHROOM_1),
		BattleGroupEnemy(0xFF)
	], 0x0154, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.STRUTTIN_EVIL_MUSHROOM_1),
		BattleGroupEnemy(0xFF)
	], 0x0154, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x0154, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STRUTTIN_EVIL_MUSHROOM_1),
		BattleGroupEnemy(0xFF)
	], 0x0154, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GIGANTIC_ANT_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.GIGANTIC_ANT_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.THIRSTY_COIL_SNAKE),
		BattleGroupEnemy(1, EnemyID.GIGANTIC_ANT_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.THIRSTY_COIL_SNAKE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.THIRSTY_COIL_SNAKE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MAD_DUCK),
		BattleGroupEnemy(1, EnemyID.THIRSTY_COIL_SNAKE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(1, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(2, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(3, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(2, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(5, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(1, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(1, EnemyID.GIGANTIC_ANT_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(1, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(2, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.NOOSE_MAN),
		BattleGroupEnemy(1, EnemyID.GIGANTIC_ANT_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MUSICA),
		BattleGroupEnemy(1, EnemyID.MYSTICAL_RECORD),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MUSICA),
		BattleGroupEnemy(2, EnemyID.MYSTICAL_RECORD),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MUSICA),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SCALDING_COFFEE_CUP),
		BattleGroupEnemy(1, EnemyID.MYSTICAL_RECORD),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SCALDING_COFFEE_CUP),
		BattleGroupEnemy(2, EnemyID.MYSTICAL_RECORD),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SCALDING_COFFEE_CUP),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MYSTICAL_RECORD),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.STINKY_GHOST),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DEADLY_MOUSE),
		BattleGroupEnemy(1, EnemyID.STINKY_GHOST),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FILTHY_ATTACK_ROACH),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.FILTHY_ATTACK_ROACH),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.DEADLY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DEADLY_MOUSE),
		BattleGroupEnemy(1, EnemyID.STINKY_GHOST),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.STINKY_GHOST),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.DEADLY_MOUSE),
		BattleGroupEnemy(1, EnemyID.STINKY_GHOST),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FILTHY_ATTACK_ROACH),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.FILTHY_ATTACK_ROACH),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FILTHY_ATTACK_ROACH),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.FILTHY_ATTACK_ROACH),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.DEADLY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.DEADLY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x00C2, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.THUNDER_MITE),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TANGOO_1),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.THUNDER_MITE),
		BattleGroupEnemy(1, EnemyID.TANGOO_1),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TANGOO_1),
		BattleGroupEnemy(1, EnemyID.KISS_OF_DEATH),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.THUNDER_MITE),
		BattleGroupEnemy(1, EnemyID.TANGOO_1),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.TANGOO_1),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.THUNDER_MITE),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CONDUCTING_MENACE),
		BattleGroupEnemy(1, EnemyID.TANGOO_1),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.CONDUCTING_MENACE),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.KISS_OF_DEATH),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.KISS_OF_DEATH),
		BattleGroupEnemy(1, EnemyID.CONDUCTING_MENACE),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.CONDUCTING_MENACE),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CONDUCTING_MENACE),
		BattleGroupEnemy(1, EnemyID.TANGOO_1),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CONDUCTING_MENACE),
		BattleGroupEnemy(1, EnemyID.TANGOO_1),
		BattleGroupEnemy(1, EnemyID.KISS_OF_DEATH),
		BattleGroupEnemy(0xFF)
	], 0x00C3, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FIERCE_SHATTERED_MAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FIERCE_SHATTERED_MAN),
		BattleGroupEnemy(1, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PETRIFIED_ROYAL_GUARD),
		BattleGroupEnemy(1, EnemyID.LETHAL_ASP_HIEROGLYPH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ARACHNID2),
		BattleGroupEnemy(1, EnemyID.GUARDIAN_HIEROGLYPH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FIERCE_SHATTERED_MAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FIERCE_SHATTERED_MAN),
		BattleGroupEnemy(1, EnemyID.PETRIFIED_ROYAL_GUARD),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PETRIFIED_ROYAL_GUARD),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LETHAL_ASP_HIEROGLYPH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.ARACHNID2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FIERCE_SHATTERED_MAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FIERCE_SHATTERED_MAN),
		BattleGroupEnemy(1, EnemyID.PETRIFIED_ROYAL_GUARD),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PETRIFIED_ROYAL_GUARD),
		BattleGroupEnemy(1, EnemyID.LETHAL_ASP_HIEROGLYPH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FIERCE_SHATTERED_MAN),
		BattleGroupEnemy(1, EnemyID.GUARDIAN_HIEROGLYPH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SCALDING_COFFEE_CUP),
		BattleGroupEnemy(1, EnemyID.MYSTICAL_RECORD),
		BattleGroupEnemy(1, EnemyID.WORTHLESS_PROTOPLASM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.CuteLilUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.CuteLilUFO),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DALIS_CLOCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ROBO_PUMP_1),
		BattleGroupEnemy(1, EnemyID.ENRAGED_FIRE_PLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ROBO_PUMP_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ENRAGED_FIRE_PLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(1, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LESSER_MOOK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(5, EnemyID.WORTHLESS_PROTOPLASM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.WORTHLESS_PROTOPLASM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(3, EnemyID.WORTHLESS_PROTOPLASM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(1, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOOK_SENIOR),
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(1, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(1, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(1, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(1, EnemyID.STARMAN_1),
		BattleGroupEnemy(1, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(1, EnemyID.MILITARY_OCTOBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(2, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(1, EnemyID.MILITARY_OCTOBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(1, EnemyID.MILITARY_OCTOBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ATOMIC_POWER_ROBOT),
		BattleGroupEnemy(2, EnemyID.MILITARY_OCTOBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(6, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.UNCONTROLLABLE_SPHERE),
		BattleGroupEnemy(1, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HYPER_SPINNING_ROBO),
		BattleGroupEnemy(1, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(4, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(6, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CONDUCTING_SPIRIT),
		BattleGroupEnemy(1, EnemyID.FOBBY),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.UNCONTROLLABLE_SPHERE),
		BattleGroupEnemy(1, EnemyID.CONDUCTING_SPIRIT),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.UNCONTROLLABLE_SPHERE),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CONDUCTING_SPIRIT),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.CONDUCTING_SPIRIT),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HYPER_SPINNING_ROBO),
		BattleGroupEnemy(1, EnemyID.CONDUCTING_SPIRIT),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CONDUCTING_SPIRIT),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.UNCONTROLLABLE_SPHERE),
		BattleGroupEnemy(1, EnemyID.CONDUCTING_SPIRIT),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HYPER_SPINNING_ROBO),
		BattleGroupEnemy(1, EnemyID.CONDUCTING_SPIRIT),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HYPER_SPINNING_ROBO),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.HYPER_SPINNING_ROBO),
		BattleGroupEnemy(1, EnemyID.UNCONTROLLABLE_SPHERE),
		BattleGroupEnemy(0xFF)
	], 0x00C4, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SOUL_CONSUMING_FLAME),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PSYCHIC_PSYCHO),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.EVIL_ELEMENTAL),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVIL_ELEMENTAL),
		BattleGroupEnemy(1, EnemyID.SOUL_CONSUMING_FLAME),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVIL_ELEMENTAL),
		BattleGroupEnemy(1, EnemyID.SOUL_CONSUMING_FLAME),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.EVIL_ELEMENTAL),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVIL_ELEMENTAL),
		BattleGroupEnemy(1, EnemyID.SOUL_CONSUMING_FLAME),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SOUL_CONSUMING_FLAME),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SOUL_CONSUMING_FLAME),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PSYCHIC_PSYCHO),
		BattleGroupEnemy(1, EnemyID.MAJOR_PSYCHIC_PSYCHO),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVIL_ELEMENTAL),
		BattleGroupEnemy(1, EnemyID.PSYCHIC_PSYCHO),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SOUL_CONSUMING_FLAME),
		BattleGroupEnemy(1, EnemyID.MAJOR_PSYCHIC_PSYCHO),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SOUL_CONSUMING_FLAME),
		BattleGroupEnemy(1, EnemyID.MAJOR_PSYCHIC_PSYCHO),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SOUL_CONSUMING_FLAME),
		BattleGroupEnemy(0xFF)
	], 0x00C5, 0x01, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GHOST_OF_STARMAN_1),
		BattleGroupEnemy(1, EnemyID.NUCLEAR_REACTOR_ROBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.WILD_N_WOOLY_SHAMBLER),
		BattleGroupEnemy(1, EnemyID.ULTIMATE_OCTOBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ULTIMATE_OCTOBOT),
		BattleGroupEnemy(1, EnemyID.NUCLEAR_REACTOR_ROBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SQUATTER_DEMON_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GHOST_OF_STARMAN_1),
		BattleGroupEnemy(1, EnemyID.WILD_N_WOOLY_SHAMBLER),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GHOST_OF_STARMAN_1),
		BattleGroupEnemy(1, EnemyID.NUCLEAR_REACTOR_ROBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.NUCLEAR_REACTOR_ROBOT),
		BattleGroupEnemy(1, EnemyID.FINAL_STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GHOST_OF_STARMAN_1),
		BattleGroupEnemy(1, EnemyID.FINAL_STARMAN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GHOST_OF_STARMAN_1),
		BattleGroupEnemy(1, EnemyID.FINAL_STARMAN_1),
		BattleGroupEnemy(1, EnemyID.NUCLEAR_REACTOR_ROBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BIONIC_KRAKEN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Large),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(1, EnemyID.RAMBLIN_EVIL_MUSHROOM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.INSANE_CULTIST_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.INSANE_CULTIST_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.MR_BATTY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MR_BATTY),
		BattleGroupEnemy(1, EnemyID.ZOMBIE_POSSESSOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKELPION),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MAD_TAXI),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CRIMINAL_CATERPILLAR),
		BattleGroupEnemy(0xFF)
	], 0x0154, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MASTER_CRIMINAL_WORM),
		BattleGroupEnemy(0xFF)
	], 0x0154, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MAGIC_BUTTERFLY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.COIL_SNAKE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.COIL_SNAKE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOLE_PLAYING_ROUGH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOLE_PLAYING_ROUGH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MOLE_PLAYING_ROUGH),
		BattleGroupEnemy(0xFF)
	], 0x0154, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SKATE_PUNK),
		BattleGroupEnemy(0, EnemyID.POGO_PUNK),
		BattleGroupEnemy(0, EnemyID.YES_MAN_JUNIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.POGO_PUNK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.YES_MAN_JUNIOR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.INSANE_CULTIST_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.UNASSUMING_LOCAL_GUY),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(2, EnemyID.INSANE_CULTIST_1),
		BattleGroupEnemy(1, EnemyID.SPITEFUL_CROW),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SLIMY_LIL_PILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ENRAGED_FIRE_PLUG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ROBO_PUMP_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ABSTRACT_ART),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SENTRY_ROBOT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SHATTERED_MAN),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GUARDIAN_HIEROGLYPH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.LETHAL_ASP_HIEROGLYPH),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MAD_DUCK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.WORTHLESS_PROTOPLASM),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ROWDY_MOUSE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Small),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FRANK),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.FRANKYSTEIN_MARK_II_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TITANIC_ANT_1),
		BattleGroupEnemy(2, EnemyID.BLACK_ANTOID_2),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.COP),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.Medium),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CAPTAIN_STRONG),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVERDRED_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MR_CARPAINTER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MONDO_MOLE_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MasterBelch1),
		BattleGroupEnemy(0, EnemyID.SLIMY_LIL_PILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.TRILLIONAGE_SPROUT_1),
		BattleGroupEnemy(2, EnemyID.TOUGH_MOBILE_SPROUT),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.BOOGEY_TENT_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GUARDIAN_DIGGER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.DEPT_STORE_SPOOK_1),
		BattleGroupEnemy(0, EnemyID.INSANE_CULTIST_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.EVIL_MANI_MANI_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CLUMSY_ROBOT_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.PLAGUE_RAT_OF_DOOM_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.THUNDER_AND_STORM_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.SHROOOM_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_DELUXE_1),
		BattleGroupEnemy(0, EnemyID.STARMAN_1),
		BattleGroupEnemy(0, EnemyID.STARMAN_SUPER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.KRAKEN_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GUARDIAN_GENERAL_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MASTER_BARF_1),
		BattleGroupEnemy(0, EnemyID.EVEN_SLIMIER_LITTLE_PILE),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.ELECTRO_SPECTER_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.CARBON_DOG_1),
		BattleGroupEnemy(0, EnemyID.DIAMOND_DOG_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.YOUR_NIGHTMARE_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(0, EnemyID.STARMAN_JR),
		BattleGroupEnemy(0, EnemyID.GIYGAS_1),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.STARMAN_JR),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GIYGAS_2),
		BattleGroupEnemy(1, EnemyID.HeavilyArmedPokey3),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GIYGAS_3),
		BattleGroupEnemy(1, EnemyID.HeavilyArmedPokey3),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GIYGAS_4),
		BattleGroupEnemy(0, EnemyID.HeavilyArmedPokey3),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GIYGAS_5),
		BattleGroupEnemy(0, EnemyID.HeavilyArmedPokey3),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GIYGAS_6),
		BattleGroupEnemy(0, EnemyID.HeavilyArmedPokey3),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GIYGAS_6),
		BattleGroupEnemy(0, EnemyID.HeavilyArmedPokey3),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MAGIC_BUTTERFLY),
		BattleGroupEnemy(0xFF)
	], 0x0154, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.MINI_BARF),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
	BattleEntryPointer([
		BattleGroupEnemy(1, EnemyID.GIYGAS_6),
		BattleGroupEnemy(0, EnemyID.HeavilyArmedPokey3),
		BattleGroupEnemy(0xFF)
	], 0x0000, 0x00, LetterboxStyle.None),
];
