module earthbound.commondefs;

enum MAX_ENTITIES = 30;

enum PAD_R =      0x0010;
enum PAD_L =      0x0020;
enum PAD_X =      0x0040;
enum PAD_A =      0x0080;
enum PAD_RIGHT =  0x0100;
enum PAD_LEFT =   0x0200;
enum PAD_DOWN =   0x0400;
enum PAD_UP =     0x0800;
enum PAD_START =  0x1000;
enum PAD_SELECT = 0x2000;
enum PAD_Y =      0x4000;
enum PAD_B =      0x8000;


enum PATH_FB = 0xFB;
enum PATH_FC = 0xFC;
enum PATH_UNWALKABLE = 0xFD;
enum PATH_MAYBE_START = 0xFE; // Is this even correct?
enum PATH_START = 0xFF; // Is this even correct?

enum JPN = false;
enum USA = true;
enum USAPROTOTYPE = false;


enum AFFLICTION_GROUP_COUNT = 7;

enum PLAYER_CHAR_COUNT = 4;
enum NONPLAYER_CHAR_COUNT = 2;
enum TOTAL_PARTY_COUNT = PLAYER_CHAR_COUNT + NONPLAYER_CHAR_COUNT;
enum FIRST_ENEMY_INDEX = TOTAL_PARTY_COUNT + 2; //the +2 might be space for bad "party members" like the tiny lil ghost. unsure.


enum OBJECT_TICK_DISABLED = 0x8000;
enum OBJECT_MOVE_DISABLED = 0x4000;

enum WalkingStyle {
	Normal = 0,

	Bicycle = 3,
	Ghost = 4,

	Slower = 6,
	Ladder = 7,
	Rope = 8,

	Slowest = 10,

	Escalator = 12,
	Stairs = 13,
}

enum Window {
	unknown00 = 0x00,
	TextStandard = 0x01,
	Inventory = 0x02,
	InventoryMenu = 0x03,
	unknown04 = 0x04,
	PhoneMenu = 0x05,
	EquipMenu = 0x06,
	EquipMenuItemlist = 0x07,
	StatusMenu = 0x08,
	Unknown09 = 0x09,
	CarriedMoney = 0x0A,
	Unknown0b = 0x0B,
	Unknown0c = 0x0C,
	Unknown0d = 0x0D,
	TextBattle = 0x0E,
	BattleMenu = 0x0F,
	Unknown10 = 0x10,
	Unknown11 = 0x11,
	BattleMenuJeff = 0x12,
	FileSelectMain = 0x13,
	FileSelectMenu = 0x14,
	FileSelectCopyMenuTwoFiles = 0x15,
	FileSelectCopyMenuOneFile = 0x16,
	FileSelectDeleteConfirmation = 0x17,
	FileSelectTextSpeed = 0x18,
	FileSelectMusicMode = 0x19,
	FileSelectNamingNameBox = 0x1A,
	FileSelectNamingMessage = 0x1B,
	FileSelectNamingKeyboard = 0x1C,
	FileSelectNamingConfirmationNess = 0x1D,
	FileSelectNamingConfirmationPaula = 0x1E,
	FileSelectNamingConfirmationJeff = 0x1F,
	FileSelectNamingConfirmationPoo = 0x20,
	FileSelectNamingConfirmationKing = 0x21,
	FileSelectNamingConfirmationFood = 0x22,
	FileSelectNamingConfirmationThing = 0x23,
	FileSelectNamingConfirmationMessage = 0x24,
	Unknown25 = 0x25,
	Unknown26 = 0x26,
	Unknown27 = 0x27,
	Unknown28 = 0x28,
	Unknown29 = 0x29,
	Unknown2a = 0x2A,
	Unknown2b = 0x2B,
	Unknown2c = 0x2C,
	Unknown2d = 0x2D,
	Unknown2e = 0x2E,
	Unknown2f = 0x2F,
	Unknown30 = 0x30,
	Unknown31 = 0x31,
	FileSelectFlavourChoice = 0x32,
	Unknown33 = 0x33,
	Unknown34 = 0x34,
}

enum TeleportStyle {
	None = 0,
	PSIAlpha = 1,
	PSIBeta = 2,
	Instant = 3,
	PSIBetter = 4,
	Unknown = 5
}

enum Direction {
	Up = 0,
	UpRight = 1,
	Right = 2,
	DownRight = 3,
	Down = 4,
	DownLeft = 5,
	Left = 6,
	UpLeft = 7,
	None = 8,
}

enum DirectionMask {
	Up = 1<<0,
	UpRight = 1<<1,
	Right = 1<<2,
	DownRight = 1<<3,
	Down = 1<<4,
	DownLeft = 1<<5,
	Left = 1<<6,
	UpLeft = 1<<7,
}

enum Music {
	None = 0,
	TeleportOut = 13,
}

enum Item {
	None = 0x00,
	FRANKLIN_BADGE = 0x01,
	TEDDY_BEAR = 0x02,
	SUPER_PLUSH_BEAR = 0x03,
	BROKEN_MACHINE = 0x04,
	BROKEN_GADGET = 0x05,
	BROKEN_AIR_GUN = 0x06,
	BROKEN_SPRAY_CAN = 0x07,
	BROKEN_LASER = 0x08,
	BROKEN_IRON = 0x09,
	BROKEN_PIPE = 0x0A,
	BROKEN_CANNON = 0x0B,
	BROKEN_TUBE = 0x0C,
	BROKEN_BAZOOKA = 0x0D,
	BROKEN_TRUMPET = 0x0E,
	BROKEN_HARMONICA = 0x0F,
	BROKEN_ANTENNA = 0x10,
	CRACKED_BAT = 0x11,
	TEE_BALL_BAT = 0x12,
	SAND_LOT_BAT = 0x13,
	MINOR_LEAGUE_BAT = 0x14,
	MR_BASEBALL_BAT = 0x15,
	BIG_LEAGUE_BAT = 0x16,
	HALL_OF_FAME_BAT = 0x17,
	MAGICANT_BAT = 0x18,
	LEGENDARY_BAT = 0x19,
	GUTSY_BAT = 0x1A,
	CASEY_BAT = 0x1B,
	FRY_PAN = 0x1C,
	THICK_FRY_PAN = 0x1D,
	DELUXE_FRY_PAN = 0x1E,
	CHEFS_FRY_PAN = 0x1F,
	FRENCH_FRY_PAN = 0x20,
	MAGIC_FRY_PAN = 0x21,
	HOLY_FRY_PAN = 0x22,
	SWORD_OF_KINGS = 0x23,
	POP_GUN = 0x24,
	STUN_GUN = 0x25,
	TOY_AIR_GUN = 0x26,
	MAGNUM_AIR_GUN = 0x27,
	ZIP_GUN = 0x28,
	LASER_GUN = 0x29,
	HYPER_BEAM = 0x2A,
	CRUSHER_BEAM = 0x2B,
	SPECTRUM_BEAM = 0x2C,
	DEATH_RAY = 0x2D,
	BADDEST_BEAM = 0x2E,
	MOON_BEAM_GUN = 0x2F,
	GAIA_BEAM = 0x30,
	YOYO = 0x31,
	SLINGSHOT = 0x32,
	BIONIC_SLINGSHOT = 0x33,
	TRICK_YOYO = 0x34,
	COMBAT_YOYO = 0x35,
	TRAVEL_CHARM = 0x36,
	GREAT_CHARM = 0x37,
	CRYSTAL_CHARM = 0x38,
	RABBITS_FOOT = 0x39,
	FLAME_PENDANT = 0x3A,
	RAIN_PENDANT = 0x3B,
	NIGHT_PENDANT = 0x3C,
	SEA_PENDANT = 0x3D,
	STAR_PENDANT = 0x3E,
	CLOAK_OF_KINGS = 0x3F,
	CHEAP_BRACELET = 0x40,
	COPPER_BRACELET = 0x41,
	SILVER_BRACELET = 0x42,
	GOLD_BRACELET = 0x43,
	PLATINUM_BAND = 0x44,
	DIAMOND_BAND = 0x45,
	PIXIES_BRACELET = 0x46,
	CHERUBS_BAND = 0x47,
	GODDESS_BAND = 0x48,
	BRACER_OF_KINGS = 0x49,
	BASEBALL_CAP = 0x4A,
	HOLMES_HAT = 0x4B,
	MR_BASEBALL_CAP = 0x4C,
	HARD_HAT = 0x4D,
	RIBBON = 0x4E,
	RED_RIBBON = 0x4F,
	GODDESS_RIBBON = 0x50,
	COIN_OF_SLUMBER = 0x51,
	COIN_OF_DEFENSE = 0x52,
	LUCKY_COIN = 0x53,
	TALISMAN_COIN = 0x54,
	SHINY_COIN = 0x55,
	SOUVENIR_COIN = 0x56,
	DIADEM_OF_KINGS = 0x57,
	COOKIE = 0x58,
	BAG_OF_FRIES = 0x59,
	HAMBURGER = 0x5A,
	BoiledEgg = 0x5B,
	FreshEgg = 0x5C,
	PICNIC_LUNCH = 0x5D,
	PASTA_DI_SUMMERS = 0x5E,
	PIZZA = 0x5F,
	CHEFS_SPECIAL = 0x60,
	LARGE_PIZZA = 0x61,
	PSI_CARAMEL = 0x62,
	MAGIC_TRUFFLE = 0x63,
	BRAIN_FOOD_LUNCH = 0x64,
	ROCK_CANDY = 0x65,
	CROISSANT = 0x66,
	BREAD_ROLL = 0x67,
	PAK_OF_BUBBLE_GUM = 0x68,
	JAR_OF_FLY_HONEY = 0x69,
	CAN_OF_FRUIT_JUICE = 0x6A,
	ROYAL_ICED_TEA = 0x6B,
	PROTEIN_DRINK = 0x6C,
	KRAKEN_SOUP = 0x6D,
	BOTTLE_OF_WATER = 0x6E,
	COLD_REMEDY = 0x6F,
	VIAL_OF_SERUM = 0x70,
	IQ_CAPSULE = 0x71,
	GUTS_CAPSULE = 0x72,
	SPEED_CAPSULE = 0x73,
	VITAL_CAPSULE = 0x74,
	LUCK_CAPSULE = 0x75,
	KETCHUP_PACKET = 0x76,
	SUGAR_PACKET = 0x77,
	TIN_OF_COCOA = 0x78,
	CARTON_OF_CREAM = 0x79,
	SPRIG_OF_PARSLEY = 0x7A,
	JAR_OF_HOT_SAUCE = 0x7B,
	SALT_PACKET = 0x7C,
	BACKSTAGE_PASS = 0x7D,
	JAR_OF_DELISAUCE = 0x7E,
	WET_TOWEL = 0x7F,
	REFRESHING_HERB = 0x80,
	SECRET_HERB = 0x81,
	HORN_OF_LIFE = 0x82,
	COUNTER_PSI_UNIT = 0x83,
	SHIELD_KILLER = 0x84,
	BAZOOKA = 0x85,
	HEAVY_BAZOOKA = 0x86,
	HP_SUCKER = 0x87,
	HUNGRY_HP_SUCKER = 0x88,
	XTERMINATOR_SPRAY = 0x89,
	SLIME_GENERATOR = 0x8A,
	YOGURT_DISPENSER = 0x8B,
	RULER = 0x8C,
	SNAKE_BAG = 0x8D,
	MUMMY_WRAP = 0x8E,
	PROTRACTOR = 0x8F,
	BOTTLE_ROCKET = 0x90,
	BIG_BOTTLE_ROCKET = 0x91,
	MULTI_BOTTLE_ROCKET = 0x92,
	BOMB = 0x93,
	SUPER_BOMB = 0x94,
	INSECTICIDE_SPRAY = 0x95,
	RUST_PROMOTER = 0x96,
	RUST_PROMOTER_DX = 0x97,
	PAIR_OF_DIRTY_SOCKS = 0x98,
	STAG_BEETLE = 0x99,
	TOOTHBRUSH = 0x9A,
	HANDBAG_STRAP = 0x9B,
	PHARAOHS_CURSE = 0x9C,
	DEFENSE_SHOWER = 0x9D,
	LETTER_FROM_MOM = 0x9E,
	SUDDEN_GUTS_PILL = 0x9F,
	BAG_OF_DRAGONITE = 0xA0,
	DEFENSE_SPRAY = 0xA1,
	PIGGY_NOSE = 0xA2,
	FOR_SALE_SIGN = 0xA3,
	SHYNESS_BOOK = 0xA4,
	PICTURE_POSTCARD = 0xA5,
	KING_BANANA = 0xA6,
	LETTER_FROM_TONY = 0xA7,
	Chick = 0xA8,
	Chicken = 0xA9,
	KEY_TO_THE_SHACK = 0xAA,
	KEY_TO_THE_CABIN = 0xAB,
	BAD_KEY_MACHINE = 0xAC,
	TEMPORARY_GOODS = 0xAD,
	ZOMBIE_PAPER = 0xAE,
	HAWK_EYE = 0xAF,
	BICYCLE = 0xB0,
	ATM_CARD = 0xB1,
	SHOW_TICKET = 0xB2,
	LETTER_FROM_KIDS = 0xB3,
	WAD_OF_BILLS = 0xB4,
	RECEIVER_PHONE = 0xB5,
	DIAMOND = 0xB6,
	SIGNED_BANANA = 0xB7,
	PENCIL_ERASER = 0xB8,
	HIEROGLYPH_COPY = 0xB9,
	METEOTITE = 0xBA,
	CONTACT_LENS = 0xBB,
	HANDAID = 0xBC,
	TROUT_YOGURT = 0xBD,
	BANANA = 0xBE,
	CALORIE_STICK = 0xBF,
	KEY_TO_THE_TOWER = 0xC0,
	METEORITE_PIECE = 0xC1,
	EARTH_PENDANT = 0xC2,
	NEUTRALIZER = 0xC3,
	SOUND_STONE = 0xC4,
	EXIT_MOUSE = 0xC5,
	GELATO_DE_RESORT = 0xC6,
	SNAKE = 0xC7,
	VIPER = 0xC8,
	BRAIN_STONE = 0xC9,
	TOWN_MAP = 0xCA,
	VIDEO_RELAXANT = 0xCB,
	SUPORMA = 0xCC,
	KEY_TO_THE_LOCKER = 0xCD,
	INSIGNIFICANT_ITEM = 0xCE,
	MAGIC_TART = 0xCF,
	TINY_RUBY = 0xD0,
	MONKEYS_LOVE = 0xD1,
	ERASER_ERASER = 0xD2,
	TENDAKRAUT = 0xD3,
	TREXS_BAT = 0xD4,
	BIG_LEAGUE_BAT2 = 0xD5,
	ULTIMATE_BAT = 0xD6,
	DOUBLE_BEAM = 0xD7,
	PLATINUM_BAND2 = 0xD8,
	DIAMOND_BAND2 = 0xD9,
	DEFENSE_RIBBON = 0xDA,
	TALISMAN_RIBBON = 0xDB,
	SATURN_RIBBON = 0xDC,
	COIN_OF_SILENCE = 0xDD,
	CHARM_COIN = 0xDE,
	CUP_OF_NOODLES = 0xDF,
	SKIP_SANDWICH = 0xE0,
	SKIP_SANDWICH_DX = 0xE1,
	LUCKY_SANDWICH1 = 0xE2,
	LUCKY_SANDWICH2 = 0xE3,
	LUCKY_SANDWICH3 = 0xE4,
	LUCKY_SANDWICH4 = 0xE5,
	LUCKY_SANDWICH5 = 0xE6,
	LUCKY_SANDWICH6 = 0xE7,
	CUP_OF_COFFEE = 0xE8,
	DOUBLE_BURGER = 0xE9,
	PEANUT_CHEESE_BAR = 0xEA,
	PIGGY_JELLY = 0xEB,
	BOWL_OF_RICE_GRUEL = 0xEC,
	BEAN_CROQUETTE = 0xED,
	MOLOKHEIYA_SOUP = 0xEE,
	PLAIN_ROLL = 0xEF,
	KABOB = 0xF0,
	PLAIN_YOGURT = 0xF1,
	BEEF_JERKY = 0xF2,
	MAMMOTH_BURGER = 0xF3,
	SPICY_JERKY = 0xF4,
	LUXURY_JERKY = 0xF5,
	BOTTLE_OF_DXWATER = 0xF6,
	MAGIC_PUDDING = 0xF7,
	NONSTICK_FRYPAN = 0xF8,
	MR_SATURN_COIN = 0xF9,
	METEORNIUM = 0xFA,
	POPSICLE = 0xFB,
	CUP_OF_LIFENOODLES = 0xFC,
	CARROT_KEY = 0xFD,
}

enum Sfx {
	None = 0,
	CURSOR1 = 1,
	CURSOR2 = 2,
	CURSOR3 = 3,
	CURSOR4 = 4,
	CURSOR_INVALID = 5,
	UNKNOWN06 = 6,
	TEXT_PRINT = 7,
	DOOR_OPEN = 8,
	DOOR_CLOSE = 9,
	PHONE_RING = 10,
	PHONE_ANSWERED = 11,
	CASH_REGISTER = 12,
	UNKNOWN0D = 13,
	UNKNOWN0E = 14,
	UNKNOWN0F = 15,
	PRESENT_OPENED = 16,
	FALLING = 17,
	UNKNOWN12 = 18,
	UNKNOWN13 = 19,
	UNKNOWN14 = 20,
	UNKNOWN15 = 21,
	ONETT_TRUMPET_SOLO = 22,
	BICYCLE_BELL = 23,
	ALLY_ATTACKS = 24,
	ENEMY_ATTACKS = 25,
	ATTACK_ABOUT_TO_LAND = 26,
	MENU_OPEN_CLOSE = 27,
	PRAYING = 28,
	PSI_USED = 29,
	DAMAGE_TAKEN = 30,
	SMAAAASH = 31,
	ALLY_FELL = 32,
	ENEMY_DEFEATED = 33,
	MISSED = 34,
	DODGED = 35,
	RECOVER_HP = 36,
	RECOVER_STATUS = 37,
	SHIELD = 38,
	PSI_SHIELD = 39,
	STAT_INCREASE = 40,
	STAT_DECREASE = 41,
	PSI_HYPNOSIS = 42,
	PSI_MAGNET = 43,
	PSI_PARALYSIS = 44,
	PSI_BRAINSHOCK = 45,
	TOOK_DAMAGE = 46,
	TOOK_MORTAL_DAMAGE = 47,
	PSI_ROCKIN_1 = 48,
	PSI_ROCKIN_2 = 49,
	PSI_ROCKIN_3 = 50,
	PSI_FIRE = 51,
	UNKNOWN34 = 52,
	UNKNOWN35 = 53,
	COUNTER_PSI = 54,
	ENEMY_PSI_USED = 55,
	PSI_FREEZE_1 = 56,
	PSI_FREEZE_2 = 57,
	PSI_FREEZE_FINISH = 58,
	HP_SUCKER = 59,
	PSI_THUNDER_MISS = 60,
	PSI_THUNDER_HIT = 61,
	PSI_THUNDER_MISS_2 = 62,
	PSI_THUNDER_DAMAGE = 63,
	PSI_STARSTORM = 64,
	PSI_FLASH_1 = 65,
	PSI_FLASH_2 = 66,
	PSI_FLASH_3 = 67,
	FOOD_EATEN = 68,
	UNKNOWN45 = 69,
	BOTTLE_ROCKET_LAUNCHED = 70,
	UNKNOWN47 = 71,
	CALLED_FOR_HELP = 72,
	REFLECT_DAMAGE = 73,
	DEVIL_MACHINE_OFF = 74,
	FIRE_BREATH = 75,
	PSI_DEFENSE_DOWN = 76,
	BEAM = 77,
	UNKNOWN4E = 78,
	PSI_PARALYSIS_O = 79,
	PSI_BRAINSHOCK_O = 80,
	SPRAY = 81,
	SPORES = 82,
	AFFLICTED = 83,
	OUCH = 84,
	UNKNOWN55 = 85,
	UNKNOWN56 = 86,
	UNKNOWN57 = 87,
	UNKNOWN58 = 88,
	REFILLED = 89,
	DEFENSES_DESTROYED = 90,
	UNKNOWN5B = 91,
	UNKNOWN5C = 92,
	PSI_REFLECTED = 93,
	UNKNOWN5E = 94,
	MAGIC_BUTTERFLY = 95,
	GHOST = 96,
	UNKNOWN61 = 97,
	UNKNOWN62 = 98,
	SHIELD_KILLER = 99,
	MYSTERIOUS_TRANSPORT = 100,
	Cheep = 101,
	CONGRATS = 102,
	LEARNED_PSI = 103,
	Cluck = 104,
	PYRAMID_1 = 105,
	PYRAMID_2 = 106,
	PYRAMID_3 = 107,
	PYRAMID_4 = 108,
	PYRAMID_5 = 109,
	PYRAMID_OPENED = 110,
	RAPID_KNOCKING = 111,
	UNKNOWN70 = 112,
	MYSTERIOUS = 113,
	MYSTERIOUS_2 = 114,
	EQUIPPED_ITEM = 115,
	TOOK_ITEM = 116,
	OPENED_BOX_2 = 117,
	GOT_ITEM = 118,
	OPENED_LOCKED_DOOR = 119,
	ITEM_SOLD = 120,
	UNKNOWN79 = 121,
	TEXT_INPUT = 122,
	CURSOR1_COPY = 123,
	UNKNOWN7C = 124,
	UNKNOWN7D = 125,
	UNKNOWN7E = 126,
	UNKNOWN7F = 127,
}

enum ActionScript {
	Unknown786 = 786
}

enum OverworldSprite {
	MiniGhost = 264
}

struct Game_State {
	ubyte[12] mother2PlayerName;
	ubyte[24] earthboundPlayerName;
	ubyte[6] petName;
	ubyte[6] favouriteFood;
	ubyte[12] favouriteThing;
	uint moneyCarried;
	uint bankBalance;
	ubyte partyPSI;
	ubyte partyNPC1;
	ubyte partyNPC2;
	ushort partyNPC1HP;
	ushort partyNPC2HP;
	ubyte partyStatus;
	ubyte partyNPC1Copy;
	ubyte partyNPC2Copy;
	ushort partyNPC1HPCopy;
	ushort partyNPC2HPCopy;
	uint walletScratch;
	ubyte[36] escargoExpressItems;
	ubyte[6] partyMembers;
	ushort unknown80;
	short leaderXCoordinate;
	ushort unknown84;
	short leaderYCoordinate;
	ushort unknown88;
	ushort leaderDirection;
	ushort troddenTileType;
	ushort walkingStyle;
	ushort unknown90;
	ushort unknown92;
	ushort currentPartyMembers;
	ubyte[6] unknown96;
	ubyte[6] playerControlledPartyMembers;
	ubyte[12] unknownA2;
	ubyte partyCount;
	ubyte playerControlledPartyMemberCount;
	ushort unknownB0;
	ushort unknownB2;
	ubyte[2] unknownB4;
	ubyte[3] unknownB6;
	ubyte[3] unknownB8;
	ubyte autoFightEnable;
	ushort exitMouseXCoordinate;
	ushort exitMouseYCoordinate;
	ubyte textSpeed;
	ubyte soundSetting;
	ubyte unknownC3;
	ubyte[4] unknownC4;
	ubyte[12] unknownC8;
	PhotoState[32] savedPhotoStates;
	uint timer;
	ubyte textFlavour;
}
struct PartyCharacter {
	static if (JPN) {
		ubyte[4] name;
	} else {
		ubyte[5] name;
	}
	ubyte level;
	uint exp;
	ushort max_hp;
	ushort max_pp;
	ubyte[AFFLICTION_GROUP_COUNT] afflictions;
	ubyte offense;
	ubyte defense;
	ubyte speed;
	ubyte guts;
	ubyte luck;
	ubyte vitality;
	ubyte iq;
	ubyte base_offense;
	ubyte base_defense;
	ubyte base_speed;
	ubyte base_guts;
	ubyte base_luck;
	ubyte base_vitality;
	ubyte base_iq;
	ubyte[14] items;
	ubyte[4] equipment;
	ushort unknown53;
	ushort unknown55;
	ushort unknown57;
	ushort unknown59;
	ushort position_index;
	ushort unknown63;
	ushort unknown65;
	RollingStat hp;
	RollingStat pp;
	ushort hp_pp_window_options;
	ubyte miss_rate;
	ubyte fire_resist;
	ubyte freeze_resist;
	ubyte flash_resist;
	ubyte paralysis_resist;
	ubyte hypnosis_brainshock_resist;
	ubyte boosted_speed;
	ubyte boosted_guts;
	ubyte boosted_vitality;
	ubyte boosted_iq;
	ubyte boosted_luck;
	ubyte unknown92;
	ubyte unknown93;
	ubyte unknown94;
}
struct RollingStat {
	FixedPoint1616 current;
	ushort target;
}

struct PhotoState {
	ushort unknown;
	ubyte[6] partyMembers;
}

struct WinStat {
    short   next;                 // [00]
    short   prev;                 // [02]
    short   window_id;            // [04]
    short   x;                    // [06]
    short   y;                    // [08]
    short   width;                // [0A]
    short   height;               // [0C]
    short   text_x;               // [0E]
    short   text_y;               // [10]
    ubyte   num_padding;          // [12]
    ushort  tileAttributes;            // [13]
    short   font;                 // [15]
    uint  result;               // [17]
    uint  argument;             // [1B]
    ushort  counter;              // [1F]
    uint  result_bak;           // [21]
    uint  argument_bak;         // [25]
    ushort  counter_bak;          // [29]
    short   current_option;       // [2B]
    short   option_count;         // [2D]
    short   selected_option;      // [2F]
    short   menu_columns;         // [31]
    short   menu_page;            // [33]
    ushort* tilemapBuffer;       // [35] 16-bit pointer
    void function(short) menu_callback; // [37] 32-bit pointer
    ubyte   title_id;             // [3B]
    ubyte[32]   title;            // [3C]
}

struct MenuOpt {
    short  field00;     // [00]
    short  next;        // [02]
    short  prev;        // [04]
    short  page;        // [06]
    short  text_x;      // [08]
    short  text_y;      // [0A]
    short  field0C;     // [0C]
    ubyte  sfx;         // [0E]
    ubyte *script;      // [0F] 32-bit pointer
    ubyte[25]  label;   // [13]
    ubyte  pixel_align; // [2C]
}
struct VecYX {
    short y;
    short x;
}

struct Pather {
    int    from_offscreen; // [00] Starts off-screen flag
    VecYX  hitbox;         // [02] ??? some sort of hitbox??? (Old notes, I have no idea why I labeled this "hitbox")
    VecYX  origin;         // [06] Origin point in the collision map?
    int    field0A;        // [0A] ??? unknown index
    VecYX *points;         // [0C] Goal points
    int    point_count;    // [0E] Amount of goal points
    int    obj_index;      // [10] Object index
}

struct PathCtx {
    // Up until offset 0x78 is unused??

    VecYX  radius;         // [78] Pathfinder radius
    VecYX[8]  targets_pos; // [7C] Positions for all targets (row, col)
    int    target_count;   // [9C] Amount of targets
    int    pather_count;   // [9E] Amount of pathers
    Pather[8] pathers;     // [A0] Data for all pathers
}

struct PlayerPositionBufferEntry {
	short x_coord;
	short y_coord;
	short tile_flags;
	short walking_style;
	short direction;
	short unknown10;
}

struct Unknown4DD6 {
	ubyte[4] unknown0; //0
	ubyte[4] unknown4; //4
	ubyte[4] unknown8; //8
	ubyte[4] unknown12; //12
	ubyte[4] unknown16; //16
	ubyte[4] unknown20; //20
	ubyte[4] unknown24; //24
	ubyte[356] unknown28; //28
	ubyte[64] unknown384; //384
}

struct QueuedInteraction {
	ushort type; //0
	union { //2
		void* text_ptr;
		void* door_ptr;
	}
}

struct SpriteGrouping {
	ubyte height;
	ubyte width;
	ubyte unknown3;
	ubyte unknown4;
	ubyte unknown5;
	ubyte unknown6;
	ubyte unknown7;
	ubyte unknown8;
	ubyte spriteBank;
	Sprites[0] sprites;
}
struct Sprites {
	ushort group;
	ushort[8] ids;
}

struct Battler {
	ubyte id;
	ubyte unknown01;
	ubyte sprite;
	ubyte unknown03;
	ushort currentAction;
	ubyte actionOrderVar;
	ubyte unknown07;
	ubyte currentActionArgument;
	ubyte unknown09;
	ubyte currentTarget;
	ubyte theFlag;
	ubyte consciousness;
	ubyte unknown13;
	ubyte allyOrEnemy;
	ubyte npcID;
	ubyte row;
	ushort hp;
	ushort hpTarget;
	ushort hpMax;
	ushort pp;
	ushort ppTarget;
	ushort ppMax;
	ubyte[AFFLICTION_GROUP_COUNT] afflictions;
	ubyte guarding;
	ubyte shieldHP;
	ushort offense;
	ushort defense;
	ushort speed;
	ushort guts;
	ushort luck;
	ubyte vitality;
	ubyte iq;
	ubyte baseOffense;
	ubyte baseDefense;
	ubyte baseSpeed;
	ubyte baseGuts;
	ubyte baseLuck;
	ubyte paralysisResist;
	ubyte freezeResist;
	ubyte flashResist;
	ubyte fireResist;
	ubyte brainshockResist;
	ubyte hypnosisResist;
	ushort money;
	ushort exp;
	ubyte vramSpriteIndex;
	ubyte spriteX;
	ubyte spriteY;
	ubyte initiative;
	ubyte unknown69;
	ubyte[2] unknown70;
	ubyte unknown72;
	ubyte unknown73;
	ubyte unknown74;
	ubyte id2;
	ubyte[2] unknown76;
}

struct TextWindowPropertiesEntry {
	ushort offset;
	ubyte unknown;
}

struct RGB {
	ushort bgr555;
	this(ushort red, ushort green, ushort blue) {
		bgr555 = (red & 0x1F) | ((green & 0x1F) << 5) | ((blue & 0x1F) << 10);
	}
}

struct TimedItemTransformation {
	ubyte item;
	ubyte sfx;
	ubyte sfxFrequency;
	ubyte targetItem;
	ubyte transformationTime;
}

struct LoadedItemTransformation {
	ubyte sfx;
	ubyte sfxFrequency;
	ubyte sfxCountdown;
	ubyte transformationCountdown;
}

struct Unknown7E007DEntry {
	ubyte unknown0;
	ushort unknown1;
}

union FixedPoint1616 {
	struct {
		short fraction;
		short integer;
	}
	uint combined;
}
