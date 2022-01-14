/// Misc definitions
module earthbound.commondefs;

enum MAX_ENTITIES = 30;
enum MAX_SCRIPTS = 70;

enum PARTY_LEADER_ENTITY_INDEX = 24;

enum PAD_R = 0x0010;
enum PAD_L = 0x0020;
enum PAD_X = 0x0040;
enum PAD_A = 0x0080;
enum PAD_RIGHT = 0x0100;
enum PAD_LEFT = 0x0200;
enum PAD_DOWN = 0x0400;
enum PAD_UP = 0x0800;
enum PAD_START = 0x1000;
enum PAD_SELECT = 0x2000;
enum PAD_Y = 0x4000;
enum PAD_B = 0x8000;


enum PATH_FB = 0xFB;
enum PATH_FC = 0xFC;
enum PATH_UNWALKABLE = 0xFD;
enum PATH_MAYBE_START = 0xFE; // Is this even correct?
enum PATH_START = 0xFF; // Is this even correct?

enum JPN = false;
enum USA = true;
enum USAPROTOTYPE = false;

enum MAX_LEVEL = 99;


enum EVENT_FLAG_COUNT = 1024;
enum EVENT_FLAG_UNSET = 0x8000;

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

enum TeleportStyle : ubyte {
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

enum CCDirection {
	USE_VAR = 0,
	Undefined = 0,
	Up = Direction.Up+1,
	UpRight = Direction.UpRight+1,
	Right = Direction.Right+1,
	DownRight = Direction.DownRight+1,
	Down = Direction.Down+1,
	DownLeft = Direction.DownLeft+1,
	Left = Direction.Left+1,
	UpLeft = Direction.UpLeft+1,
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
	GasStation = 1,
	NamingScreen = 2,
	SetupScreen = 3,
	None2 = 4,
	YouWon1 = 5,
	LevelUp = 6,
	YouLose = 7,
	BattleSwirl1 = 8,
	BattleSwirl2 = 9,
	WHAT_THE_HECK = 10,
	NEW_FRIEND = 11,
	YOU_WON2 = 12,
	TeleportOut = 13,
	TeleportFail = 14,
	FALLING_UNDERGROUND = 15,
	DR_ANDONUTS_LAB = 16,
	MONOTOLI_BUILDING = 17,
	SLOPPY_HOUSE = 18,
	NEIGHBOURS_HOUSE = 19,
	ARCADE = 20,
	PokeysHouse = 21,
	HOSPITAL = 22,
	NESSS_HOUSE = 23,
	PAULAS_THEME = 24,
	CHAOS_THEATRE = 25,
	HOTEL = 26,
	GOOD_MORNING = 27,
	DEPARTMENT_STORE = 28,
	ONETT_AT_NIGHT_1 = 29,
	YOUR_SANCTUARY_1 = 30,
	YOUR_SANCTUARY_2 = 31,
	GIANT_STEP = 32,
	LILLIPUT_STEPS = 33,
	MILKY_WELL = 34,
	RAINY_CIRCLE = 35,
	MAGNET_HILL = 36,
	PINK_CLOUD = 37,
	LUMINE_HALL = 38,
	FIRE_SPRING = 39,
	NEAR_A_BOSS = 40,
	ALIEN_INVESTIGATION = 41,
	FIRE_SPRINGS_HALL = 42,
	BELCH_BASE = 43,
	ZOMBIE_THREED = 44,
	SPOOKY_CAVE = 45,
	ONETT = 46,
	FOURSIDE = 47,
	SATURN_VALLEY = 48,
	MONKEY_CAVES = 49,
	MOONSIDE = 50,
	DUSTY_DUNES_DESERT = 51,
	PEACEFUL_REST_VALLEY = 52,
	ZOMBIE_THREED2 = 53,
	WINTERS = 54,
	CAVE_NEAR_A_BOSS = 55,
	SUMMERS = 56,
	JACKIES_CAFE = 57,
	SAILING_TO_SCARABA = 58,
	DALAAM = 59,
	MU_TRAINING = 60,
	BAZAAR = 61,
	SCARABA_DESERT = 62,
	PYRAMID = 63,
	DEEP_DARKNESS = 64,
	TENDA_VILLAGE = 65,
	WELCOME_HOME = 66,
	SEA_OF_EDEN = 67,
	LOST_UNDERWORLD = 68,
	FIRST_STEP_BACK = 69,
	SECOND_STEP_BACK = 70,
	THE_PLACE = 71,
	GiygasAwakens = 72,
	GiygasPhase2 = 73,
	GiygasWeakened2 = 74,
	GiygasDeath2 = 75,
	RUNAWAY5_CONCERT_1 = 76,
	RUNAWAY5_TOUR_BUS = 77,
	RUNAWAY5_CONCERT_2 = 78,
	POWER = 79,
	VENUS_CONCERT = 80,
	YELLOW_SUBMARINE = 81,
	Bicycle = 82,
	SKY_RUNNER = 83,
	SKY_RUNNER_FALLING = 84,
	BULLDOZER = 85,
	TESSIE = 86,
	CITY_BUS = 87,
	FUZZY_PICKLES = 88,
	Delivery = 89,
	RETURN_TO_YOUR_BODY = 90,
	PHASE_DISTORTER_TIME_TRAVEL = 91,
	COFFEE_BREAK = 92,
	BecauseILoveYou = 93,
	GOOD_FRIENDS_BAD_FRIENDS = 94,
	SMILES_AND_TEARS = 95,
	VS_CRANKY_LADY = 96,
	VS_SPINNING_ROBO = 97,
	VS_STRUTTIN_EVIL_MUSHROOM = 98,
	VS_MASTER_BELCH = 99,
	VS_NEW_AGE_RETRO_HIPPIE = 100,
	VS_RUNAWAY_DOG = 101,
	VS_CAVE_BOY = 102,
	VS_YOUR_SANCTUARY_BOSS = 103,
	VS_KRAKEN = 104,
	PokeyMeansBusiness = 105,
	INSIDE_THE_DUNGEON = 106,
	MEGATON_WALK = 107,
	SEA_OF_EDEN2 = 108,
	EXPLOSION = 109,
	SKY_RUNNER_CRASH = 110,
	MAGIC_CAKE = 111,
	PokeysHouseBuzzBuzz = 112,
	BUZZ_BUZZ_SWATTED = 113,
	ONETT_AT_NIGHT_BUZZ_BUZZ = 114,
	PHONE_CALL = 115,
	KNOCK_KNOCK_RIGHT = 116,
	RABBIT_CAVE = 117,
	ONETT_AT_NIGHT_3 = 118,
	APPLE_OF_ENLIGHTENMENT = 119,
	HOTEL_OF_THE_LIVING_DEAD = 120,
	ONETT_INTRO = 121,
	SUNRISE_ONETT = 122,
	SOMEONE_JOINS = 123,
	ENTER_STARMAN_JR = 124,
	BOARDING_SCHOOL = 125,
	PHASE_DISTORTER = 126,
	PHASE_DISTORTER_2 = 127,
	BOY_MEETS_GIRL = 128,
	HAPPY_THREED = 129,
	RUNAWAY5_ARE_FREED = 130,
	FlyingMan = 131,
	ONETT_AT_NIGHT_2 = 132,
	HIDDEN_SONG = 133,
	YOUR_SANCTUARY_BOSS = 134,
	TeleportIn = 135,
	SATURN_VALLEY_CAVE = 136,
	ELEVATOR_DOWN = 137,
	ELEVATOR_UP = 138,
	ELEVATOR_STOP = 139,
	 TOPOLLA_THEATRE = 140,
	VS_MASTER_BARF = 141,
	GOING_TO_MAGICANT = 142,
	LEAVING_MAGICANT = 143,
	KRAKEN_DEFEATED = 144,
	STONEHENGE_DESTRUCTION = 145,
	TESSIE_SIGHTING = 146,
	METEOR_FALL = 147,
	VS_STARMAN_JR = 148,
	RUNAWAY5_HELP_OUT = 149,
	KNOCK_KNOCK = 150,
	ONETT_AFTER_METEOR1 = 151,
	ONETT_AFTER_METEOR2 = 152,
	PokeyTheme = 153,
	ONETT_AT_NIGHT_BUZZ_BUZZ2 = 154,
	YOUR_SANCTUARY_BOSS2 = 155,
	METEOR_STRIKE = 156,
	AttractMode = 157,
	NameConfirmation = 158,
	PEACEFUL_REST_VALLEY2 = 159,
	SoundstoneRecordingGiantStep = 160,
	SoundstoneRecordingLilliputSteps = 161,
	SoundstoneRecordingMilkyWell = 162,
	SoundstoneRecordingRainyCircle = 163,
	SoundstoneRecordingMagnetHill = 164,
	SoundstoneRecordingPinkCloud = 165,
	SoundstoneRecordingLumineHall = 166,
	SoundstoneRecordingFireSpring = 167,
	SoundstoneBGM = 168,
	EIGHT_MELODIES = 169,
	DALAAM_INTRO = 170,
	WINTERS_INTRO = 171,
	PokeyEscapes = 172,
	GOOD_MORNING_MOONSIDE = 173,
	GasStation2 = 174,
	TitleScreen = 175,
	BattleSwirl4 = 176,
	PokeyIntro = 177,
	GOOD_MORNING_SCARABA = 178,
	ROBOTOMY1 = 179,
	PokeyEscapes2 = 180,
	RETURN_TO_YOUR_BODY2 = 181,
	GiygasStatic = 182,
	SuddenVictory = 183,
	YOU_WON3 = 184,
	GiygasPhase3 = 185,
	GiygasPhase1 = 186,
	GIVE_US_STRENGTH = 187,
	GOOD_MORNING2 = 188,
	SOUND_STONE = 189,
	GiygasDeath = 190,
	GiygasWeakened = 191,
}

enum ItemID {
	None = 0x00,
	FranklinBadge = 0x01,
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
	Cookie = 0x58,
	BagOfFries = 0x59,
	Hamburger = 0x5A,
	BoiledEgg = 0x5B,
	FreshEgg = 0x5C,
	PicnicLunch = 0x5D,
	PASTA_DI_SUMMERS = 0x5E,
	Pizza = 0x5F,
	CHEFS_SPECIAL = 0x60,
	LargePizza = 0x61,
	PSI_CARAMEL = 0x62,
	MAGIC_TRUFFLE = 0x63,
	BRAIN_FOOD_LUNCH = 0x64,
	ROCK_CANDY = 0x65,
	CROISSANT = 0x66,
	BREAD_ROLL = 0x67,
	PAK_OF_BUBBLE_GUM = 0x68,
	JAR_OF_FLY_HONEY = 0x69,
	CanOfFruitJuice = 0x6A,
	RoyalIcedTea = 0x6B,
	ProteinDrink = 0x6C,
	KrakenSoup = 0x6D,
	BottleOfWater = 0x6E,
	ColdRemedy = 0x6F,
	VialOfSerum = 0x70,
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
	Bicycle = 0xB0,
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
	Neutralizer = 0xC3,
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
	BottleOfDXWater = 0xF6,
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
	Cursor1 = 1,
	Cursor2 = 2,
	Cursor3 = 3,
	Cursor4 = 4,
	CURSOR_INVALID = 5,
	UNKNOWN06 = 6,
	TextPrint = 7,
	DoorOpen = 8,
	DoorClose = 9,
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
	BicycleBell = 23,
	ALLY_ATTACKS = 24,
	ENEMY_ATTACKS = 25,
	ATTACK_ABOUT_TO_LAND = 26,
	MenuOpenClose = 27,
	PRAYING = 28,
	PSI_USED = 29,
	DAMAGE_TAKEN = 30,
	SMAAAASH = 31,
	ALLY_FELL = 32,
	EnemyDefeated = 33,
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
	PSIThunderMiss = 60,
	PSIThunderHit = 61,
	PSIThunderMiss2 = 62,
	PSIThunderDamage = 63,
	PSIStarstorm = 64,
	PSI_FLASH_1 = 65,
	PSI_FLASH_2 = 66,
	PSI_FLASH_3 = 67,
	FOOD_EATEN = 68,
	UNKNOWN45 = 69,
	BOTTLE_ROCKET_LAUNCHED = 70,
	Unknown47 = 71,
	CALLED_FOR_HELP = 72,
	ReflectDamage = 73,
	DEVIL_MACHINE_OFF = 74,
	FIRE_BREATH = 75,
	PSI_DEFENSE_DOWN = 76,
	BEAM = 77,
	Unknown4E = 78,
	PSI_PARALYSIS_O = 79,
	PSI_BRAINSHOCK_O = 80,
	SPRAY = 81,
	SPORES = 82,
	AFFLICTED = 83,
	OUCH = 84,
	Unknown55 = 85,
	Unknown56 = 86,
	Unknown57 = 87,
	Unknown58 = 88,
	REFILLED = 89,
	DEFENSES_DESTROYED = 90,
	Unknown5B = 91,
	Unknown5C = 92,
	PSI_REFLECTED = 93,
	Unknown5E = 94,
	MAGIC_BUTTERFLY = 95,
	GHOST = 96,
	Unknown61 = 97,
	Unknown62 = 98,
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
	Unknown70 = 112,
	MYSTERIOUS = 113,
	MYSTERIOUS_2 = 114,
	EquippedItem = 115,
	TOOK_ITEM = 116,
	OPENED_BOX_2 = 117,
	GOT_ITEM = 118,
	OPENED_LOCKED_DOOR = 119,
	ITEM_SOLD = 120,
	Unknown79 = 121,
	TextInput = 122,
	Unknown7B = 123,
	Unknown7C = 124,
	Unknown7D = 125,
	Unknown7E = 126,
	Unknown7F = 127,
}

enum ItemType {
	TeddyBear = 4,
	Broken = 8,
	Equippable = 16,
	WeaponBash = 16,
	WeaponShoot = 17,
	ArmourBody = 20,
	ArmourArm = 24,
	ArmourOther = 28,
	Edible = 32,
	Drink = 36,
	Condiment = 40,
	PartyFood = 44,
	HealingItem = 48,
	BattleOffensive = 52,
	BattleDefensive = 53,
	KeyItem = 56,
	KeyItemSpecificArea = 58,
	KeyItemForSomeone = 59,
}
enum ItemFlags {
	NessCanUse = 1<<0,
	PaulaCanUse = 1<<1,
	JeffCanUse = 1<<2,
	PooCanUse = 1<<3,
	Transform = 1<<4,
	CannotGive = 1<<5,
	Unknown = 1<<6,
	ConsumedOnUse = 1<<7,
}

enum BattleActions {
	NoEffect = 0,
	UseNoEffect = 1,
	Action002 = 2,
	Action003 = 3,
	Bash = 4,
	Shoot = 5,
	Spy = 6,
	Pray = 7,
	Guard = 8,
	Action009 = 9,
	PSI_ROCKIN_ALPHA = 10,
	PSI_ROCKIN_BETA = 11,
	PSI_ROCKIN_GAMMA = 12,
	PSI_ROCKIN_OMEGA = 13,
	PSI_FIRE_ALPHA = 14,
	PSI_FIRE_BETA = 15,
	PSI_FIRE_GAMMA = 16,
	PSI_FIRE_OMEGA = 17,
	PSI_FREEZE_ALPHA = 18,
	PSI_FREEZE_BETA = 19,
	PSI_FREEZE_GAMMA = 20,
	PSI_FREEZE_OMEGA = 21,
	PSI_THUNDER_ALPHA = 22,
	PSI_THUNDER_BETA = 23,
	PSI_THUNDER_GAMMA = 24,
	PSI_THUNDER_OMEGA = 25,
	PSI_FLASH_ALPHA = 26,
	PSI_FLASH_BETA = 27,
	PSI_FLASH_GAMMA = 28,
	PSI_FLASH_OMEGA = 29,
	PSI_STARSTORM_ALPHA = 30,
	PSI_STARSTORM_BETA = 31,
	PSILifeupAlpha = 32,
	PSILifeupBeta = 33,
	PSILifeupGamma = 34,
	PSILifeupOmega = 35,
	PSIHealingAlpha = 36,
	PSIHealingBeta = 37,
	PSIHealingGamma = 38,
	PSIHealingOmega = 39,
	PSIShieldAlpha = 40,
	PSIShieldBeta = 41,
	PSIShieldSigma = 42,
	PSIShieldOmega = 43,
	PSIPSIShieldAlpha = 44,
	PSIPSIShieldBeta = 45,
	PSIPSIShieldSigma = 46,
	PSIPSIShieldOmega = 47,
	PSI_OFFENSE_UP_ALPHA = 48,
	PSI_OFFENSE_UP_OMEGA = 49,
	PSI_DEFENSE_DOWN_ALPHA = 50,
	PSI_DEFENSE_DOWN_OMEGA = 51,
	PSI_HYPNOSIS_ALPHA = 52,
	PSI_HYPNOSIS_OMEGA = 53,
	PSI_MAGNET_ALPHA = 54,
	PSI_MAGNET_OMEGA = 55,
	PSI_PARALYSIS_ALPHA = 56,
	PSI_PARALYSIS_OMEGA = 57,
	PSI_BRAINSHOCK_ALPHA = 58,
	PSI_BRAINSHOCK_OMEGA = 59,
	PSI_TELEPORT_ALPHA = 60,
	PSI_TELEPORT_OMEGA = 61,
	CALL_FOR_HELP = 62,
	SOW_SEEDS = 63,
	EXPLODE = 64,
	BURST_INTO_FLAMES = 65,
	Steal = 66,
	FREEZE_IN_TIME = 67,
	EERIE_GLARE = 68,
	ELECTRIC_FIELD = 69,
	CLUMSY_BEAM = 70,
	NAUSEATING_BURP = 71,
	POISON_STING = 72,
	KISS_OF_DEATH = 73,
	COLD_BREATH = 74,
	SCATTER_SPORES = 75,
	POSSESS = 76,
	WONDERFUL_POWDER = 77,
	MOLD_SPORES = 78,
	BINDING_ATTACK = 79,
	STICKY_MUCUS = 80,
	SPEW_FLY_HONEY = 81,
	SPIDER_SILK = 82,
	SCARY_WORDS = 83,
	SOMETHING_MYSTERIOUS = 84,
	DISRUPT_SENSES = 85,
	SIZE_UP_SITUATION = 86,
	STINKY_BREATH = 87,
	SUMMON_STORM = 88,
	HOT_ESPRESSO = 89,
	HAUNTING_MELODY = 90,
	EXTINGUISHING_BLAST = 91,
	CRASHING_BOOM_BANG = 92,
	FIRE_SPRAY = 93,
	FIRE_BREATH = 94,
	SPIN_SOMETHING = 95,
	LOSE_TEMPER = 96,
	SAY_SOMETHING_NASTY = 97,
	VACUUM_ATTACK = 98,
	REPLENISH_FUEL = 99,
	POISONOUS_BITE = 100,
	FIRE_MISSILE_DIZZILY = 101,
	CONTINUOUS_ATTACK = 102,
	ON_GUARD = 103,
	SPEW_FIREBALL = 104,
	INTERTWINE = 105,
	CRUSHING_CHOP = 106,
	SUBMISSION_HOLD = 107,
	REV_AND_ACCELERATE = 108,
	BRANDISH_KNIFE = 109,
	TEAR_INTO = 110,
	BITE = 111,
	CLAW = 112,
	SWING_TAIL = 113,
	LUNGE_FORWARD = 114,
	WIELD_SHOPPING_BAG = 115,
	SWING_CLUB = 116,
	GENERATE_TORNADO = 117,
	SPRAY_WATER_BLAST = 118,
	FLASH_SMILE = 119,
	LAUGH_HYSTERICALLY = 120,
	EDGE_CLOSER = 121,
	WHISPER_3 = 122,
	MURMUR_2 = 123,
	MUTTER_1 = 124,
	FALL_DOWN = 125,
	BE_ABSENTMINDED = 126,
	GENERATE_STEAM = 127,
	WOBBLE = 128,
	REEL = 129,
	GRIN = 130,
	TAKE_DEEP_BREATH = 131,
	GREET = 132,
	HOWL = 133,
	TICK_TOCK = 134,
	Action135 = 135,
	Action136 = 136,
	Action137 = 137,
	Action138 = 138,
	Action139 = 139,
	HandAid = 140,
	Action141 = 141,
	Action142 = 142,
	Action143 = 143,
	Action144 = 144,
	Action145 = 145,
	Action146 = 146,
	Action147 = 147,
	Action148 = 148,
	WetTowel = 149,
	RefreshingHerb = 150,
	SecretHerb = 151,
	FullStatusHeal = 152,
	Action153 = 153,
	Action154 = 154,
	Action155 = 155,
	Action156 = 156,
	Action157 = 157,
	Action158 = 158,
	COUNTER_PSI_UNIT = 159,
	SHIELD_KILLER = 160,
	HP_SUCKER = 161,
	MUMMY_WRAP = 162,
	BOTTLE_ROCKET = 163,
	BIG_BOTTLE_ROCKET = 164,
	MULTI_BOTTLE_ROCKET = 165,
	HANDBAG_STRAP = 166,
	BOMB = 167,
	SUPER_BOMB = 168,
	SLIME_GENERATOR = 169,
	YOGURT_DISPENSER = 170,
	SNAKE_BAG = 171,
	DIRTY_SOCKS = 172,
	STAG_BEETLE = 173,
	TOOTHBRUSH = 174,
	PHAROAHS_CURSE = 175,
	HUNGRY_HP_SUCKER = 176,
	BAG_OF_DRAGONITE = 177,
	Insecticide = 178,
	XTERMINATOR_SPRAY = 179,
	RUST_PROMOTER = 180,
	RUST_PROMOTER_DX = 181,
	SUDDEN_GUTS_PILL = 182,
	DEFENSE_SPRAY = 183,
	DEFENSE_SHOWER = 184,
	Action185 = 185,
	RULER = 186,
	PROTRACTOR = 187,
	BUBBLE_GUM = 188,
	FLY_HONEY = 189,
	PiggyNose = 190,
	ForSaleSign = 191,
	ShynessBook = 192,
	PicturePostcard = 193,
	Action194 = 194,
	Chick = 195,
	Chicken = 196,
	ATM_CARD = 197,
	ZOMBIE_PAPER = 198,
	HAWK_EYE = 199,
	Bicycle = 200,
	GLORIOUS_LIGHT = 201,
	ELECTRIC_SHOCK = 202,
	SCATTER_POLLEN = 203,
	REACH_WITH_ICY_HAND = 204,
	PLAY_POISON_FLUTE = 205,
	SPEW_EXHAUST = 206,
	LAUGH_MANIACALLY = 207,
	BREATHE_THROUGH_FLUTE = 208,
	LEAP_FORWARD_AND_SPREAD_WINGS = 209,
	BECOME_FRIENDLY = 210,
	LOUD_RUMBLE = 211,
	HUG = 212,
	COUGH = 213,
	MISERY_ATTACK = 214,
	PAINT_ATTACK = 215,
	COME_OUT_SWINGING = 216,
	SCRATCH = 217,
	PECK = 218,
	TRAMPLE = 219,
	PUNCH = 220,
	SPIT_SEEDS = 221,
	FIRE_BEAM = 222,
	SPEAR_JAB = 223,
	STOMP = 224,
	SWING_HULA_HOOP = 225,
	CHARGE = 226,
	SHRED_ON_SKATEBOARD = 227,
	DIAMONDIZING_BITE = 228,
	GRUMBLE_ABOUT_YOUTH = 229,
	LECTURE = 230,
	SCOWL = 231,
	VENT_ODOR = 232,
	SHOUT = 233,
	WAR_CRY = 234,
	KNIT_BROW = 235,
	BE_CLUMSY = 236,
	SCATTER_SPORES_2 = 237,
	BITING_ATTACK = 238,
	EquipAndAttack = 239,
	EquipArmour = 240,
	NIGHT_TIME_STUFFINESS_BEAM = 241,
	COIL_AROUND = 242,
	RUNAWAY_FIVE_EVENT = 243,
	MASTER_BARF_DEFEAT = 244,
	EnemyExtender = 245,
	Action246 = 246,
	Neutralizer = 247,
	EMIT_PALE_GREEN_LIGHT = 248,
	GenericFood = 249,
	GenericFoodParty = 250,
	Action251 = 251,
	Action252 = 252,
	Action253 = 253,
	Action254 = 254,
	Action255 = 255,
	Action256 = 256,
	WOLFED_DOWN_FLY_HONEY = 257,
	SOUND_STONE = 258,
	EXIT_MOUSE = 259,
	BePokey = 260,
	Action261 = 261,
	Action262 = 262,
	Action263 = 263,
	BARK = 264,
	CHANT_SPELL = 265,
	NoEffectTony = 266,
	SCRATCH_HEAD = 267,
	SNAKE = 268,
	VIPER = 269,
	HIEROGLYPH_COPY = 270,
	TOWN_MAP = 271,
	VIDEO_RELAXANT = 272,
	DISCHARGE_STINKY_GAS = 273,
	INCOMPREHENSIBLE_ATTACK_THUNDER_BETA = 274,
	PokeySpeech1 = 275,
	PokeyAttack = 276,
	GIYGAS_ATTACK = 277,
	PokeySpeech2 = 278,
	RunAway = 279,
	Mirror = 280,
	SUPORMA = 281,
	INSIGNIFICANT_ITEM = 282,
	MONKEYS_LOVE = 283,
	TENDAKRAUT = 284,
	KingBanana = 285,
	RECEIVER_PHONE = 286,
	LETTER_FROM_MOM = 287,
	LetterFromTony = 288,
	LETTER_FROM_KIDS = 289,
	GIVE_OFF_RAINBOW = 290,
	FinalPrayer1 = 291,
	FinalPrayer2 = 292,
	FinalPrayer3 = 293,
	FinalPrayer4 = 294,
	FinalPrayer5 = 295,
	FinalPrayer6 = 296,
	FinalPrayer7 = 297,
	FinalPrayer8 = 298,
	FinalPrayer9 = 299,
	INCOMPREHENSIBLE_ATTACK_FREEZE_ALPHA = 300,
	INCOMPREHENSIBLE_ATTACK_FLASH_GAMMA = 301,
	INCOMPREHENSIBLE_ATTACK_THUNDER_BETA_VULNERABLE = 302,
	INCOMPREHENSIBLE_ATTACK_FREEZE_ALPHA_VULNERABLE = 303,
	INCOMPREHENSIBLE_ATTACK_FLASH_GAMMA_VULNERABLE = 304,
	INCOMPREHENSIBLE_ATTACK_THUNDER_BETA_UNSTABLE = 305,
	INCOMPREHENSIBLE_ATTACK_FREEZE_ALPHA_UNSTABLE = 306,
	INCOMPREHENSIBLE_ATTACK_FLASH_GAMMA_UNSTABLE = 307,
	RANDOM_GIYGAS_QUOTE = 308,
	RANDOM_GIYGAS_QUOTE_TIMES_3 = 309,
	BAZOOKA = 310,
	HEAVY_BAZOOKA = 311,
	SAY_PLAYER_NAME = 312,
	EAT_BOLOGNA_SANDWICH = 313,
	LOSE_GEAR_AND_BOLTS = 314,
	REAPPLY_BANDAGE = 315,
	CLEAN_AREA = 316,
	WANT_BATTERY = 317,
	Action318 = 318,
}


enum BackgroundLayer {
	None = 0,
	SoundStone1 = 228,
	SoundStone2 = 229,
	FileSelect = 230,
	Unknown279 = 279
}

enum ActionScript {
	Unknown000,
	Unknown001,
	Unknown002,
	Unknown003,
	Unknown004,
	Unknown005,
	Unknown006,
	Unknown007,
	Unknown008,
	Unknown009,
	Unknown010,
	Unknown011,
	Unknown012,
	Unknown013,
	Unknown014,
	Unknown015,
	Unknown016,
	Unknown017,
	Unknown018,
	Unknown019,
	Unknown020,
	Unknown021,
	Unknown022,
	Unknown023,
	Unknown024,
	Unknown025,
	Unknown026,
	Unknown027,
	Unknown028,
	Unknown029,
	Unknown030,
	Unknown031,
	Unknown032,
	Unknown033,
	Unknown034,
	Unknown035,
	Unknown036,
	Unknown037,
	Unknown038,
	Unknown039,
	Unknown040,
	Unknown041,
	Unknown042,
	Unknown043,
	Unknown044,
	Unknown045,
	Unknown046,
	Unknown047,
	Unknown048,
	Unknown049,
	Unknown050,
	Unknown051,
	Unknown052,
	Unknown053,
	Unknown054,
	Unknown055,
	Unknown056,
	Unknown057,
	Unknown058,
	Unknown059,
	Unknown060,
	Unknown061,
	Unknown062,
	Unknown063,
	Unknown064,
	Unknown065,
	Unknown066,
	Unknown067,
	Unknown068,
	Unknown069,
	Unknown070,
	Unknown071,
	Unknown072,
	Unknown073,
	Unknown074,
	Unknown075,
	Unknown076,
	Unknown077,
	Unknown078,
	Unknown079,
	Unknown080,
	Unknown081,
	Unknown082,
	Unknown083,
	Unknown084,
	Unknown085,
	Unknown086,
	Unknown087,
	Unknown088,
	Unknown089,
	Unknown090,
	Unknown091,
	Unknown092,
	Unknown093,
	Unknown094,
	Unknown095,
	Unknown096,
	Unknown097,
	Unknown098,
	Unknown099,
	Unknown100,
	Unknown101,
	Unknown102,
	Unknown103,
	Unknown104,
	Unknown105,
	Unknown106,
	Unknown107,
	Unknown108,
	Unknown109,
	Unknown110,
	Unknown111,
	Unknown112,
	Unknown113,
	Unknown114,
	Unknown115,
	Unknown116,
	Unknown117,
	Unknown118,
	Unknown119,
	Unknown120,
	Unknown121,
	Unknown122,
	Unknown123,
	Unknown124,
	Unknown125,
	Unknown126,
	Unknown127,
	Unknown128,
	Unknown129,
	Unknown130,
	Unknown131,
	Unknown132,
	Unknown133,
	Unknown134,
	Unknown135,
	Unknown136,
	Unknown137,
	Unknown138,
	Unknown139,
	Unknown140,
	Unknown141,
	Unknown142,
	Unknown143,
	Unknown144,
	Unknown145,
	Unknown146,
	Unknown147,
	Unknown148,
	Unknown149,
	Unknown150,
	Unknown151,
	Unknown152,
	Unknown153,
	Unknown154,
	Unknown155,
	Unknown156,
	Unknown157,
	Unknown158,
	Unknown159,
	Unknown160,
	Unknown161,
	Unknown162,
	Unknown163,
	Unknown164,
	Unknown165,
	Unknown166,
	Unknown167,
	Unknown168,
	Unknown169,
	Unknown170,
	Unknown171,
	Unknown172,
	Unknown173,
	Unknown174,
	Unknown175,
	Unknown176,
	Unknown177,
	Unknown178,
	Unknown179,
	Unknown180,
	Unknown181,
	Unknown182,
	Unknown183,
	Unknown184,
	Unknown185,
	Unknown186,
	Unknown187,
	Unknown188,
	Unknown189,
	Unknown190,
	Unknown191,
	Unknown192,
	Unknown193,
	Unknown194,
	Unknown195,
	Unknown196,
	Unknown197,
	Unknown198,
	Unknown199,
	Unknown200,
	Unknown201,
	Unknown202,
	Unknown203,
	Unknown204,
	Unknown205,
	Unknown206,
	Unknown207,
	Unknown208,
	Unknown209,
	Unknown210,
	Unknown211,
	Unknown212,
	Unknown213,
	Unknown214,
	Unknown215,
	Unknown216,
	Unknown217,
	Unknown218,
	Unknown219,
	Unknown220,
	Unknown221,
	Unknown222,
	Unknown223,
	Unknown224,
	Unknown225,
	Unknown226,
	Unknown227,
	Unknown228,
	Unknown229,
	Unknown230,
	Unknown231,
	Unknown232,
	Unknown233,
	Unknown234,
	Unknown235,
	Unknown236,
	Unknown237,
	Unknown238,
	Unknown239,
	Unknown240,
	Unknown241,
	Unknown242,
	Unknown243,
	Unknown244,
	Unknown245,
	Unknown246,
	Unknown247,
	Unknown248,
	Unknown249,
	Unknown250,
	Unknown251,
	Unknown252,
	Unknown253,
	Unknown254,
	Unknown255,
	Unknown256,
	Unknown257,
	Unknown258,
	Unknown259,
	Unknown260,
	Unknown261,
	Unknown262,
	Unknown263,
	Unknown264,
	Unknown265,
	Unknown266,
	Unknown267,
	Unknown268,
	Unknown269,
	Unknown270,
	Unknown271,
	Unknown272,
	Unknown273,
	Unknown274,
	Unknown275,
	Unknown276,
	Unknown277,
	Unknown278,
	Unknown279,
	Unknown280,
	Unknown281,
	Unknown282,
	Unknown283,
	Unknown284,
	Unknown285,
	Unknown286,
	Unknown287,
	Unknown288,
	Unknown289,
	Unknown290,
	Unknown291,
	Unknown292,
	Unknown293,
	Unknown294,
	Unknown295,
	Unknown296,
	Unknown297,
	Unknown298,
	Unknown299,
	Unknown300,
	Unknown301,
	Unknown302,
	Unknown303,
	Unknown304,
	Unknown305,
	Unknown306,
	Unknown307,
	Unknown308,
	Unknown309,
	Unknown310,
	Unknown311,
	Unknown312,
	Unknown313,
	Unknown314,
	Unknown315,
	Unknown316,
	Unknown317,
	Unknown318,
	Unknown319,
	Unknown320,
	Unknown321,
	Unknown322,
	Unknown323,
	Unknown324,
	Unknown325,
	Unknown326,
	Unknown327,
	Unknown328,
	Unknown329,
	Unknown330,
	Unknown331,
	Unknown332,
	Unknown333,
	Unknown334,
	Unknown335,
	Unknown336,
	Unknown337,
	Unknown338,
	Unknown339,
	Unknown340,
	Unknown341,
	Unknown342,
	Unknown343,
	Unknown344,
	Unknown345,
	Unknown346,
	Unknown347,
	Unknown348,
	Unknown349,
	Unknown350,
	Unknown351,
	Unknown352,
	Unknown353,
	Unknown354,
	Unknown355,
	Unknown356,
	Unknown357,
	Unknown358,
	Unknown359,
	Unknown360,
	Unknown361,
	Unknown362,
	Unknown363,
	Unknown364,
	Unknown365,
	Unknown366,
	Unknown367,
	Unknown368,
	Unknown369,
	Unknown370,
	Unknown371,
	Unknown372,
	Unknown373,
	Unknown374,
	Unknown375,
	Unknown376,
	Unknown377,
	Unknown378,
	Unknown379,
	Unknown380,
	Unknown381,
	Unknown382,
	Unknown383,
	Unknown384,
	Unknown385,
	Unknown386,
	Unknown387,
	Unknown388,
	Unknown389,
	Unknown390,
	Unknown391,
	Unknown392,
	Unknown393,
	Unknown394,
	Unknown395,
	Unknown396,
	Unknown397,
	Unknown398,
	Unknown399,
	Unknown400,
	Unknown401,
	Unknown402,
	Unknown403,
	Unknown404,
	Unknown405,
	Unknown406,
	Unknown407,
	Unknown408,
	Unknown409,
	Unknown410,
	Unknown411,
	Unknown412,
	Unknown413,
	Unknown414,
	Unknown415,
	Unknown416,
	Unknown417,
	Unknown418,
	Unknown419,
	Unknown420,
	Unknown421,
	Unknown422,
	Unknown423,
	Unknown424,
	Unknown425,
	Unknown426,
	Unknown427,
	Unknown428,
	Unknown429,
	Unknown430,
	Unknown431,
	Unknown432,
	Unknown433,
	Unknown434,
	Unknown435,
	Unknown436,
	Unknown437,
	Unknown438,
	Unknown439,
	Unknown440,
	Unknown441,
	Unknown442,
	Unknown443,
	Unknown444,
	Unknown445,
	Unknown446,
	Unknown447,
	Unknown448,
	Unknown449,
	Unknown450,
	Unknown451,
	Unknown452,
	Unknown453,
	Unknown454,
	Unknown455,
	Unknown456,
	Unknown457,
	Unknown458,
	Unknown459,
	Unknown460,
	Unknown461,
	Unknown462,
	Unknown463,
	Unknown464,
	Unknown465,
	Unknown466,
	Unknown467,
	Unknown468,
	Unknown469,
	Unknown470,
	Unknown471,
	Unknown472,
	Unknown473,
	Unknown474,
	Unknown475,
	Unknown476,
	Unknown477,
	Unknown478,
	Unknown479,
	Unknown480,
	Unknown481,
	Unknown482,
	Unknown483,
	Unknown484,
	Unknown485,
	Unknown486,
	Unknown487,
	Unknown488,
	Unknown489,
	Unknown490,
	Unknown491,
	Unknown492,
	Unknown493,
	Unknown494,
	Unknown495,
	Unknown496,
	Unknown497,
	Unknown498,
	Unknown499,
	Unknown500,
	Unknown501,
	Unknown502,
	Unknown503,
	Unknown504,
	Unknown505,
	Unknown506,
	Unknown507,
	Unknown508,
	Unknown509,
	Unknown510,
	Unknown511,
	Unknown512,
	Unknown513,
	Unknown514,
	Unknown515,
	Unknown516,
	Unknown517,
	Unknown518,
	Unknown519,
	Unknown520,
	Unknown521,
	Unknown522,
	Unknown523,
	Unknown524,
	Unknown525,
	Unknown526,
	Unknown527,
	Unknown528,
	Unknown529,
	Unknown530,
	Unknown531,
	Unknown532,
	Unknown533,
	Unknown534,
	Unknown535,
	Unknown536,
	Unknown537,
	Unknown538,
	Unknown539,
	Unknown540,
	Unknown541,
	Unknown542,
	Unknown543,
	Unknown544,
	Unknown545,
	Unknown546,
	Unknown547,
	Unknown548,
	Unknown549,
	Unknown550,
	Unknown551,
	Unknown552,
	Unknown553,
	Unknown554,
	Unknown555,
	Unknown556,
	Unknown557,
	Unknown558,
	Unknown559,
	Unknown560,
	Unknown561,
	Unknown562,
	Unknown563,
	Unknown564,
	Unknown565,
	Unknown566,
	Unknown567,
	Unknown568,
	Unknown569,
	Unknown570,
	Unknown571,
	Unknown572,
	Unknown573,
	Unknown574,
	Unknown575,
	Unknown576,
	Unknown577,
	Unknown578,
	Unknown579,
	Unknown580,
	Unknown581,
	Unknown582,
	Unknown583,
	Unknown584,
	Unknown585,
	Unknown586,
	Unknown587,
	Unknown588,
	Unknown589,
	Unknown590,
	Unknown591,
	Unknown592,
	Unknown593,
	Unknown594,
	Unknown595,
	Unknown596,
	Unknown597,
	Unknown598,
	Unknown599,
	Unknown600,
	Unknown601,
	Unknown602,
	Unknown603,
	Unknown604,
	Unknown605,
	Unknown606,
	Unknown607,
	Unknown608,
	Unknown609,
	Unknown610,
	Unknown611,
	Unknown612,
	Unknown613,
	Unknown614,
	Unknown615,
	Unknown616,
	Unknown617,
	Unknown618,
	Unknown619,
	Unknown620,
	Unknown621,
	Unknown622,
	Unknown623,
	Unknown624,
	Unknown625,
	Unknown626,
	Unknown627,
	Unknown628,
	Unknown629,
	Unknown630,
	Unknown631,
	Unknown632,
	Unknown633,
	Unknown634,
	Unknown635,
	Unknown636,
	Unknown637,
	Unknown638,
	Unknown639,
	Unknown640,
	Unknown641,
	Unknown642,
	Unknown643,
	Unknown644,
	Unknown645,
	Unknown646,
	Unknown647,
	Unknown648,
	Unknown649,
	Unknown650,
	Unknown651,
	Unknown652,
	Unknown653,
	Unknown654,
	Unknown655,
	Unknown656,
	Unknown657,
	Unknown658,
	Unknown659,
	Unknown660,
	Unknown661,
	Unknown662,
	Unknown663,
	Unknown664,
	Unknown665,
	Unknown666,
	Unknown667,
	Unknown668,
	Unknown669,
	Unknown670,
	Unknown671,
	Unknown672,
	Unknown673,
	Unknown674,
	Unknown675,
	Unknown676,
	Unknown677,
	Unknown678,
	Unknown679,
	Unknown680,
	Unknown681,
	Unknown682,
	Unknown683,
	Unknown684,
	Unknown685,
	Unknown686,
	Unknown687,
	Unknown688,
	Unknown689,
	Unknown690,
	Unknown691,
	Unknown692,
	Unknown693,
	Unknown694,
	Unknown695,
	Unknown696,
	Unknown697,
	Unknown698,
	Unknown699,
	Unknown700,
	Unknown701,
	Unknown702,
	Unknown703,
	Unknown704,
	Unknown705,
	Unknown706,
	Unknown707,
	Unknown708,
	Unknown709,
	Unknown710,
	Unknown711,
	Unknown712,
	Unknown713,
	Unknown714,
	Unknown715,
	Unknown716,
	Unknown717,
	Unknown718,
	Unknown719,
	Unknown720,
	Unknown721,
	Unknown722,
	Unknown723,
	Unknown724,
	Unknown725,
	Unknown726,
	Unknown727,
	Unknown728,
	Unknown729,
	Unknown730,
	Unknown731,
	Unknown732,
	Unknown733,
	Unknown734,
	Unknown735,
	Unknown736,
	Unknown737,
	Unknown738,
	Unknown739,
	Unknown740,
	Unknown741,
	Unknown742,
	Unknown743,
	Unknown744,
	Unknown745,
	Unknown746,
	Unknown747,
	Unknown748,
	Unknown749,
	Unknown750,
	Unknown751,
	Unknown752,
	Unknown753,
	Unknown754,
	Unknown755,
	Unknown756,
	Unknown757,
	Unknown758,
	Unknown759,
	Unknown760,
	Unknown761,
	Unknown762,
	Unknown763,
	Unknown764,
	Unknown765,
	Unknown766,
	Unknown767,
	Unknown768,
	Unknown769,
	Unknown770,
	Unknown771,
	Unknown772,
	Unknown773,
	Unknown774,
	Unknown775,
	Unknown776,
	Unknown777,
	Unknown778,
	Unknown779,
	Unknown780,
	Unknown781,
	Unknown782,
	Unknown783,
	Unknown784,
	Unknown785,
	Unknown786,
	Unknown787,
	TitleScreen1,
	TitleScreen2,
	TitleScreen3,
	TitleScreen4,
	TitleScreen5,
	TitleScreen6,
	TitleScreen7,
	TitleScreen8,
	TitleScreen9,
	TitleScreen10,
	TitleScreen11,
	Unknown799,
	Unknown800,
	Unknown801,
	Unknown802,
	Unknown803,
	Unknown804,
	Unknown805,
	Unknown806,
	Unknown807,
	Unknown808,
	Unknown809,
	Unknown810,
	Unknown811,
	Unknown812,
	Unknown813,
	Unknown814,
	Unknown815,
	Unknown816,
	Unknown817,
	Unknown818,
	Unknown819,
	Unknown820,
	Unknown821,
	Unknown822,
	Unknown823,
	Unknown824,
	Unknown825,
	Unknown826,
	Unknown827,
	Unknown828,
	Unknown829,
	Unknown830,
	Unknown831,
	Unknown832,
	Unknown833,
	Unknown834,
	Unknown835,
	Unknown836,
	Unknown837,
	Unknown838,
	Unknown839,
	Unknown840,
	Unknown841,
	Unknown842,
	Unknown843,
	Unknown844,
	Unknown845,
	Unknown846,
	Unknown847,
	Unknown848,
	Unknown849,
	Unknown850,
	Unknown851,
	Unknown852,
	Unknown853,
	Unknown854,
	Unknown855,
	Unknown856,
	Unknown857,
	Unknown858,
	Unknown859,
	Unknown860,
	Unknown861,
	Unknown862,
	Unknown863,
	Unknown864,
	Unknown865,
	Unknown866,
	Unknown867,
	Unknown868,
	Unknown869,
	Unknown870,
	Unknown871,
	Unknown872,
	Unknown873,
	Unknown874,
	Unknown875,
	Unknown876,
	Unknown877,
	Unknown878,
	Unknown879,
	Unknown880,
	Unknown881,
	Unknown882,
	Unknown883,
	Unknown884,
	Unknown885,
	Unknown886,
	Unknown887,
	Unknown888,
	Unknown889,
	Unknown890,
	Unknown891,
	Unknown892,
	Unknown893,
	Unknown894,
}

enum OverworldSprite {
	None = 0,
	Ness = 1,
	Paula = 2,
	Jeff = 3,
	Poo = 4,
	NessRobot = 5,
	NessPajamas = 6,
	NessBicycle = 7,
	NessAngel = 8,
	PaulaAngel = 9,
	JeffAngel = 10,
	PooAngel = 11,
	HumanDiamondized = 12,
	HUMAN_CHARRED = 13,
	NessPosing = 14,
	JeffInBed = 15,
	NessLyingDown = 16,
	NessClimbingUp = 17,
	PaulaClimbingUp = 18,
	JeffClimbingUp = 19,
	PooClimbingUp = 20,
	NessClimbingDown = 21,
	PaulaClimbingDown = 22,
	JeffClimbingDown = 23,
	PooClimbingDown = 24,
	Robot = 25,
	ROBOT_BROKEN = 26,
	LilNess = 27,
	LilPaula = 28,
	LilJeff = 29,
	LilPoo = 30,
	LilEscargoExpressGuy = 31,
	LilMachPizzaGuy = 32,
	LilGiftBox = 33,
	LilAngel = 34,
	LilTeddyBear = 35,
	LilDiamondizedGuy = 36,
	LilCharredGuy = 37,
	LilNESS_DOING_PEACE_SIGN = 38,
	FlyingMan = 39,
	King = 40,
	DungeonMan = 41,
	KingClimbingUp = 42,
	KingClimbingDown = 43,
	Pokey = 44,
	Picky = 45,
	BubbleMonkey = 46,
	BubbleMonkeyClimbingUp = 47,
	PokeyRich = 48,
	BUBBLE_MONKEY_WITH_BUBBLE = 49,
	BUBBLE_MONKEY_FLOATING = 50,
	TeddyBearParty = 51,
	OldGuyWithCane = 52,
	OLD_LADY_WITH_CANE = 53,
	OLD_FAT_GUY_WITH_HAT = 54,
	GuyInBlueClothes = 55,
	SORTA_BALD_GUY_IN_SUIT = 56,
	BRUNETTE_SHOPPING_LADY = 57,
	BLONDE_SHOPPING_LADY = 58,
	FAT_GUY_IN_RED_SUIT = 59,
	DRINKING_GUY = 60,
	BLONDE_GUY_IN_A_SUIT = 61,
	DARK_HAIRED_GUY_IN_A_SUIT = 62,
	SNEAKY_GUY_WITH_A_HAT = 63,
	NERDY_RED_HAIRED_GUY = 64,
	BLONDE_LADY_BLUE_DRESS = 65,
	BLONDE_LADY_RED_DRESS = 66,
	ELEVATOR_LADY = 67,
	BLONDE_HAPPY_LADY = 68,
	UNASSUMING_LOCAL_GUY = 69,
	YOUNG_BLONDE_GUY_IN_BLUE = 70,
	SURFER = 71,
	BEACH_LADY = 72,
	HOTEL_ATTENDANT = 73,
	COP_IN_SUNGLASSES = 74,
	CAPTAIN_STRONG = 75,
	TRAVELLING_ENTERTAINER = 76,
	TRUMPET_PERSON = 77,
	JamaicanGuy = 78,
	MrT = 79,
	GUY_IN_SWIMMING_SUIT = 80,
	GIRL_IN_BIKINI = 81,
	BUS_DRIVER_HEAD = 82,
	TESSIE_WATCHER = 83,
	JACKIE = 84,
	PUNK_GUY = 85,
	WEIRDO_GUY_IN_SWIM_TRUNKS = 86,
	ZOMBIE_LADY = 87,
	DALAAMESE_SERVANT = 88,
	CHINESE_GIRL = 89,
	SHIP_CAPTAIN = 90,
	SHIP_CREWMAN = 91,
	LADY_IN_VEIL = 92,
	HAPPY_TURBAN_GUY = 93,
	BIG_NOSE_ARAB_GUY = 94,
	MUSTACHE_ARAB_TURBAN_GUY = 95,
	ARAB_MR_T = 96,
	TENDA = 97,
	STAR_MASTER_GUY = 98,
	WEIRD_HORNED_GUY = 99,
	FLOWER = 100,
	INSANE_CULTIST = 101,
	TRIBAL_WARRIOR = 102,
	PALM_TAN_GUY = 103,
	SUN_BATHING_GIRL = 104,
	CHINESE_MONK_GUY = 105,
	INVISIBLE = 106,
	RABBIT = 107,
	BIG_SMILE_LADY = 108,
	BODYGUARD = 109,
	MEXICAN_GUY = 110,
	BUS_DRIVER = 111,
	BLONDE_GUY_IN_BLUE_SUIT = 112,
	SOME_BRUNETTE_KID = 113,
	I_LOVE_QOWGA_SHIRT_GUY = 114,
	SCUZZY_GUY = 115,
	RED_CLOTHES_PERSON = 116,
	ORANGE_HAIRED_NERD_KID = 117,
	TOUGH_GUY_W__SUNGLASSES = 118,
	SHY_GUY = 119,
	PIGTAIL_BLONDE_GIRL = 120,
	PIGTAIL_DARK_HAIRED_GIRL = 121,
	YELLOW_CLOTHES_BLONDE = 122,
	LITTLE_KID_IN_BLUE = 123,
	KID_IN_BASEBALL_HELMET = 124,
	KID_IN_DERBY_HAT = 125,
	KID_IN_DETECTIVE_HAT = 126,
	BLONDE_PONYTAIL_GIRL = 127,
	HAPPY_GIRL_IN_RED = 128,
	CHICK = 129,
	DOG = 130,
	CAT = 131,
	BIRD_ON_PERCH = 132,
	MONKEY = 133,
	BLUE_COW = 134,
	ESCARGO_EXPRESS_GUY = 135,
	HINT_GUY = 136,
	BAKER = 137,
	GIRL_IN_STRIPED_APRON = 138,
	DOCTOR = 139,
	NURSE = 140,
	THICK_GLASSES_LADY = 141,
	WAITRESS = 142,
	CAMERA_GUY = 143,
	HIDDEN_ARMS_DEALER = 144,
	MOM = 145,
	TRACY = 146,
	ALOYSIUS_MINCH = 147,
	LARDNA_MINCH = 148,
	GORGEOUS = 149,
	LUCKY = 150,
	MACH_PIZZA_GUY = 151,
	LIER_X_AGERATE = 152,
	FRANK = 153,
	MAYOR_PIRKLE = 154,
	PAULAS_FATHER = 155,
	PAULAS_MOTHER = 156,
	EVERDRED = 157,
	POOCHYFUD = 158,
	MR_CARPAINTER = 159,
	FEMALE_MONKEY = 160,
	BRICK_ROAD = 161,
	DR_ANDONUTS = 162,
	DALAAM_GIRL = 163,
	MONOTOLI = 164,
	VENUS = 165,
	POOS_MASTER = 166,
	TELEPHONE_HEAD_GUY = 167,
	PREET_PROOT_GUY = 168,
	STAR_MASTER_FLYING_AWAY = 169,
	TENDA_CHIEF = 170,
	MR_SATURN = 171,
	MINER = 172,
	MINERS_BROTHER = 173,
	FOURSIDE_MUSEUM_GUY = 174,
	ORANGE_KID = 175,
	APPLE_KID = 176,
	TALAH_RAMA = 177,
	VENUS_MOTHER = 178,
	BRICK_ROAD_HEAD = 179,
	EverdredLyingDown = 180,
	MAGIC_CAKE_LADY = 181,
	Tony = 182,
	TonyInBed = 183,
	GORGEOUS_DANCING = 184,
	RUNAWAY_FIVE_DRUMMER = 185,
	RUNAWAY_FIVE_BASS_PLAYER = 186,
	RUNAWAY_FIVE_SAX_PLAYER = 187,
	HELPFUL_MOLE = 188,
	HEALER = 189,
	MUSIC_NOTES = 190,
	PU_PU = 191,
	ZZZ = 192,
	WEIRD_WHITE_BUBBLE_THING = 193,
	LIGHT_BULB = 194,
	GiftBox = 195,
	WEIRD_QUESTION_MARK = 196,
	METEOR = 197,
	BENCH = 198,
	POLICE_BARRIER = 199,
	WEIRD_TAIL_THING = 200,
	STREETLIGHT = 201,
	BUS_STOP_SIGN = 202,
	OVAL_CLOUD = 203,
	STREET_SIGN = 204,
	CITY_BUS = 205,
	REAL_TAXI = 206,
	DELIVERY_TRUCK = 207,
	WHITE_DELIVERY_TRUCK = 208,
	SKY_RUNNER = 209,
	PHASE_DISTORTER = 210,
	Bicycle = 211,
	SHIP = 212,
	SIGN = 213,
	TRASH_CAN = 214,
	TELEPHONE = 215,
	PAY_PHONE = 216,
	WEIRD_THINK_MARKS = 217,
	SURPRISE_MARK = 218,
	Sweat = 219,
	TWINKLING_STARS = 220,
	PHARAOH_CASKET = 221,
	UNDERWATER_NPC = 222,
	APPLE = 223,
	BANANAS = 224,
	CAN_TENDA_VILLAGE = 225,
	LittleMushroom = 226,
	MAILBOX = 227,
	DONT_ENTER_SIGN = 228,
	MAGIC_TART_STAND = 229,
	SHADOW = 230,
	CROSSROAD_SIGNS = 231,
	EXCLAMATION_MARK = 232,
	DALAAM_PRESENT = 233,
	JUKEBOX = 234,
	SLOT_MACHINE = 235,
	PILE_OF_BONES = 236,
	SESAME_SEED = 237,
	UNKNOWN3 = 238,
	CROSS_GRAVESTONE = 239,
	BROKEN_PHASE_DISTORTER = 240,
	GARBAGE = 241,
	STAR_MASTERS_POOF_CLOUD = 242,
	RUNAWAY_5_BUS = 243,
	SUBMARINE = 244,
	SUBMARINE_PERISCOPE = 245,
	BROKEN_MANI_MANI_STATUE = 246,
	UNKNOWN_247 = 247,
	JAR_OF_FLY_HONEY = 248,
	CELL_DOOR = 249,
	COFFEE_WIGGLES = 250,
	WATER_RIPPLE_TESSIE_RISING = 251,
	TESSIE = 252,
	DRUM_RIM = 253,
	BIG_DIRT_SCOOPER = 254,
	GUY_IN_COOL_RED_CAR = 255,
	FLAME = 256,
	FOUNTAIN_OF_HEALING_MINI = 257,
	SHINY_ENEMY_OUTSIDE = 258,
	ATM_MACHINE = 259,
	TALKING_STONE = 260,
	SHIP_SMALL = 261,
	CASKET = 262,
	MR_SATURN_BALL_AND_CHAIN = 263,
	MiniGhost = 264,
	PENCIL_STATUE = 265,
	TREE_IN_POT = 266,
	PYRAMID_DOOR = 267,
	LIL_TALKING_STONE = 268,
	CONTACT_LENSES = 269,
	WEIRD_JUNK = 270,
	BOOGY_TENT_EYE = 271,
	BOOGY_TENT_MOUTH = 272,
	MICROPHONE = 273,
	MR_BATTY = 274,
	CAPSULE = 275,
	ELECTRO_SWOOSH = 276,
	FRENCH_KISS_OF_DEATH = 277,
	FOBBY = 278,
	ROBO_PUMP = 279,
	ARMORED_FROG = 280,
	APPLE_KIDS_MOUSE = 281,
	SPITEFUL_CROW = 282,
	THIRSTY_COIL_SNAKE = 283,
	SkatePunk = 284,
	STINKY_GHOST = 285,
	HANDSOME_TOM = 286,
	MAD_DUCK = 287,
	MANLY_FISH = 288,
	MAD_TAXI = 289,
	DEMONIC_PETUNIA = 290,
	RAMBLIN_EVIL_MUSHROOM = 291,
	RANBOOB = 292,
	EVIL_MANI_MANI = 293,
	GRUFF_GOAT = 294,
	KRAKEN = 295,
	CRESTED_BOOKA = 296,
	TERRITORIAL_OAK = 297,
	WETNOSAUR = 298,
	MASTER_BARF = 299,
	ABSTRACT_ART = 300,
	ZAP_EEL = 301,
	SMILIN_SPHERE = 302,
	STARMAN = 303,
	LIL_UFO = 304,
	ZOMBIE_POSSESSOR = 305,
	WHIRLING_ROBO = 306,
	SHATTERED_MAN = 307,
	URBAN_ZOMBIE = 308,
	CRAZED_SIGN = 309,
	SENTRY_ROBOT = 310,
	BAD_BUFFALO = 311,
	CHOMPOSAUR = 312,
	GIGANTIC_ANT = 313,
	ARACHNID = 314,
	SLIMY_LITTLE_PILE = 315,
	BLACK_ANTOID = 316,
	MOBILE_SPROUT = 317,
	NO_GOOD_FLY = 318,
	SKELPION = 319,
	LETHAL_ASP_HIEROGLYPH = 320,
	HELPFUL_MOLE_ENEMY = 321,
	PETRIFIED_ROYAL_GUARD = 322,
	NOOSE_MAN = 323,
	THUNDER_MITE = 324,
	GUARDIAN_HIEROGLYPH = 325,
	DALIS_CLOCK = 326,
	EGO_ORB = 327,
	MASTER_BELCH = 328,
	CAVE_BOY = 329,
	RUNAWAY_DOG = 330,
	MIGHTY_BEAR = 331,
	PLAIN_CROCODILE = 332,
	YOUR_SANCTUARY_POINT_BOSS = 333,
	ZOMBIE_GLUED_TO_FLOOR = 334,
	NESS_SURPRISED = 335,
	PAULA_SURPRISED = 336,
	JEFF_SURPRISED = 337,
	POO_SURPRISED = 338,
	NESS_ANGEL_SURPRISED = 339,
	PAULA_ANGEL_SURPRISED = 340,
	JEFF_ANGEL_SURPRISED = 341,
	POO_ANGEL_SURPRISED = 342,
	DIAMONDIZED_SURPRISED = 343,
	SMALL_SHADOW = 344,
	TEDDY_BEAR_SURPRISED = 345,
	RUNAWAY_5_PIANIST = 346,
	FLY = 347,
	WaterRipple = 348,
	BigWaterRipple = 349,
	KNOCKING_ON_DOOR = 350,
	HEART = 351,
	CELL_PHONE_TENDA_VILLAGE = 352,
	HAWKS_EYE = 353,
	NESS_MOM_SITTING = 354,
	VENUS_SINGING = 355,
	ROPE = 356,
	TONY_KNEELING = 357,
	UNKNOWN_358 = 358,
	NessDogSleeping = 359,
	ROCK = 360,
	NEW_AGE_RETRO_HIPPIE = 361,
	POO_MEDITATING = 362,
	CAT_ASLEEP = 363,
	ZOMBIE_DOG = 364,
	MU_GHOST = 365,
	FLAG_OF_THE_EXTINCT_HAPPY_PEOPLE = 366,
	LEAVES_FOR_TESSIE_SCENE = 367,
	TESSIE_WATER_RIPPLES_TOP = 368,
	TESSIE_WATER_RIPPLES_BOTTOM = 369,
	GIYGAS_TO_NESS_TRANSFORM = 370,
	UNKNOWN = 371,
	A_PLATE = 372,
	DRAPES_CLOSED = 373,
	YELLOW_DRAPES_OPEN = 374,
	YELLOW_DRAPES_CLOSED = 375,
	UNKNOWN2 = 376,
	POLICE_CAR = 377,
	NESS_SLEEPING = 378,
	TEDDY_BEAR = 379,
	TEDDY_BEAR_2 = 380,
	INVISIBLE_2 = 381,
	PickySitting = 382,
	NESS_SLEEPING_WITH_HAT = 383,
	ZZZS = 384,
	PAY_PHONE_MIRRORED = 385,
	POLICE = 386,
	CROOKED_COP = 387,
	UNASSUMING_LOCAL_GUY_ENEMY = 388,
	NEW_AGE_RETRO_HIPPIE_ENEMY = 389,
	TOUGH_GUY = 390,
	ANNOYING_OLD_PARTY_MAN = 391,
	CRANKY_LADY = 392,
	PAULA_LYING_DOWN = 393,
	JEFF_LYING_DOWN = 394,
	POO_LYING_DOWN = 395,
	ELECTRA = 396,
	EVERDRED_SURPRISED = 397,
	LIL_TENDA = 398,
	KING_IN_THE_FLASHBACK = 399,
	BIRD = 400,
	FRANKYSTEIN_MK_II = 401,
	RED_FOUNTAIN_LOST_UNDERWORLD = 402,
	APPLE_KID_SIGN = 403,
	ORANGE_KID_SIGN = 404,
	SPA_SIGN = 405,
	PAST_BABY_CRADLE = 406,
	ERASER_STATUE = 407,
	MONEY_BOX = 408,
	MAGNET_HILL = 409,
	HELICOPTER = 410,
	BROKEN_HELICOPTER = 411,
	DEEP_DARKNESS_PHONE = 412,
	MagicButterfly = 413,
	TOOLS = 414,
	MOLE_PLAYING_ROUGH = 415,
	ROWDY_MOUSE = 416,
	CRIMINAL_CATERPILLAR = 417,
	CLUMSY_ROBOT = 418,
	GUARDIAN_DIGGER = 419,
	HELICOPTER_BLADE = 420,
	SKY_RUNNER_ELECTRIC_THINGIES = 421,
	WOOD_BOX = 422,
	ORNAMENTS_ON_POOS_TEMPLE = 423,
	HELICOPTER_BACK = 424,
	RichPokeysHead = 425,
	BAD_PALETTE_FOUNTAIN = 426,
	LIL_TOUCAN_PHONE = 427,
	ATM_GUY_UNDERWATER = 428,
	INSTANT_REVITALIZING_DEVICE = 429,
	SECRET_DOOR_IN_MONOTOLI_BUILDING = 430,
	SECRET_DOOR_IN_MONOTOLI_BUILDING_SMALL = 431,
	MAGIC_BUTTERFLY_ON_GROUND = 432,
	BURGLIN_PARK_SIGN = 433,
	LUCKY_RUNAWAY_5_MEMBER = 434,
	NESS_WITH_MESSED_PALETTE = 435,
	EXIT_MOUSE = 436,
	NESS_IN_PJS = 437,
	ZombieLyingDown = 438,
	UNKNOWN_439 = 439,
	UNKNOWN_441 = 440,
	UNKNOWN_440 = 441,
	HOTEL_SIGN = 442,
	CAMEL = 443,
	TRICK_OR_TRICK_KID = 444,
	ANGEL_OF_EVERDRED = 445,
	HINT_MAN = 446,
	SATURN_VALLEY_ATM = 447,
	RUNAWAY_5_MEMBERS_HEAD = 448,
	PHOTOGRAPHERS_CAMERA = 449,
	BAD_PALETTE_GUY_ONETT_NIGHT = 450,
	EXIT_MOUSE_NO_SIGN = 451,
	SLOTS = 452,
	NESS_RESTING = 453,
	PAULA_RESTING = 454,
	DEPT_STORE_MOOK = 455,
	UNKNOWN4 = 456,
	LyingDownRobotNess = 457,
	HeavilyArmedPokey = 458,
	RED_TRUCK = 459,
	WHITE_TRUCK = 460,
	MASTER_CRIMINAL_WORM = 461,
	TESSIE_WATER_RING = 462,
	BIG_TESSIE_WATER_RING = 463,
	Invalid = 0xFFFF
}

enum BGTileMapSize {
	normal = 0,
	horizontal = 1,
	vertical = 2,
	both = 3
}

enum EventFlag {
	None = 0,
	UNKNOWN_DEBUG_001 = 0x001,
	UNKNOWN_002 = 0x002,
	UNKNOWN_003 = 0x003,
	UNKNOWN_004 = 0x004,
	UNKNOWN_005 = 0x005,
	UNKNOWN_006 = 0x006,
	UNKNOWN_007 = 0x007,
	UNKNOWN_008 = 0x008,
	UNKNOWN_009 = 0x009,
	UNKNOWN_00A = 0x00A,
	UNKNOWN_00B = 0x00B,
	UNKNOWN_00C = 0x00C,
	UNKNOWN_00D = 0x00D,
	UNKNOWN_00E = 0x00E,
	UNKNOWN_00F = 0x00F,
	UNKNOWN_010 = 0x010,
	UNKNOWN_011 = 0x011,
	BUZZ_BUZZ_IN_PARTY = 0x012,
	UNKNOWN_013 = 0x013,
	UNKNOWN_014 = 0x014,
	UNKNOWN_015 = 0x015,
	UNKNOWN_016 = 0x016,
	TONY_JOINED_YOU = 0x017,
	UNKNOWN_018 = 0x018,
	UNKNOWN_019 = 0x019,
	UNKNOWN_01A = 0x01A,
	UNKNOWN_01B = 0x01B,
	UNKNOWN_01C = 0x01C,
	UNKNOWN_01D = 0x01D,
	UNKNOWN_01E = 0x01E,
	UNKNOWN_01F = 0x01F,
	UNKNOWN_020 = 0x020,
	UNKNOWN_021 = 0x021,
	UNKNOWN_022 = 0x022,
	UNKNOWN_023 = 0x023,
	UNKNOWN_024 = 0x024,
	UNKNOWN_025 = 0x025,
	UNKNOWN_026 = 0x026,
	UNKNOWN_027 = 0x027,
	FLG_ONET_GUARDSHARK_DISAPPEAR = 0x28,
	UNKNOWN_029 = 0x029,
	UNKNOWN_02A = 0x02A,
	UNKNOWN_02B = 0x02B,
	UNKNOWN_02C = 0x02C,
	UNKNOWN_02D = 0x02D,
	UNKNOWN_02E = 0x02E,
	UNKNOWN_02F = 0x02F,
	UNKNOWN_030 = 0x030,
	BOOGEY_TENT_ACTIVE = 0x31,
	UNKNOWN_032 = 0x032,
	UNKNOWN_033 = 0x033,
	UNKNOWN_034 = 0x034,
	UNKNOWN_035 = 0x035,
	UNKNOWN_036 = 0x036,
	UNKNOWN_037 = 0x037,
	UNKNOWN_038 = 0x038,
	UNKNOWN_039 = 0x039,
	UNKNOWN_03A = 0x03A,
	UNKNOWN_03B = 0x03B,
	UNKNOWN_03C = 0x03C,
	UNKNOWN_03D = 0x03D,
	UNKNOWN_03E = 0x03E,
	UNKNOWN_03F = 0x03F,
	FLG_WIN_FRANK = 0x40,
	UNKNOWN_041 = 0x041,
	UNKNOWN_042 = 0x042,
	UNKNOWN_043 = 0x043,
	UNKNOWN_044 = 0x044,
	UNKNOWN_045 = 0x045,
	UNKNOWN_046 = 0x046,
	UNKNOWN_047 = 0x047,
	UNKNOWN_048 = 0x048,
	USE_POSTGAME_MUSIC = 0x049,
	MAGICANT_COMPLETED = 0x04A,
	UNKNOWN_04B = 0x04B,
	UNKNOWN_04C = 0x04C,
	UNKNOWN_04D = 0x04D,
	UNKNOWN_04E = 0x04E,
	UNKNOWN_04F = 0x04F,
	UNKNOWN_050 = 0x050,
	UNKNOWN_051 = 0x051,
	UNKNOWN_052 = 0x052,
	UNKNOWN_053 = 0x053,
	UNKNOWN_054 = 0x054,
	UNKNOWN_055 = 0x055,
	UNKNOWN_056 = 0x056,
	UNKNOWN_057 = 0x057,
	UNKNOWN_058 = 0x058,
	UNKNOWN_059 = 0x059,
	DUSTY_DUNES_DIG_COMPLETE = 0x5A,
	UNKNOWN_05B = 0x05B,
	UNKNOWN_05C = 0x05C,
	UNKNOWN_05D = 0x05D,
	UNKNOWN_05E = 0x05E,
	UNKNOWN_05F = 0x05F,
	UNKNOWN_060 = 0x060,
	UNKNOWN_061 = 0x061,
	UNKNOWN_062 = 0x062,
	UNKNOWN_063 = 0x063,
	UNKNOWN_064 = 0x064,
	UNKNOWN_065 = 0x065,
	UNKNOWN_066 = 0x066,
	UNKNOWN_067 = 0x067,
	UNKNOWN_068 = 0x068,
	UNKNOWN_069 = 0x069,
	UNKNOWN_06A = 0x06A,
	UNKNOWN_06B = 0x06B,
	UNKNOWN_06C = 0x06C,
	UNKNOWN_06D = 0x06D,
	UNKNOWN_06E = 0x06E,
	UNKNOWN_06F = 0x06F,
	UNKNOWN_070 = 0x070,
	UNKNOWN_071 = 0x071,
	UNKNOWN_072 = 0x072,
	UNKNOWN_073 = 0x073,
	UNKNOWN_074 = 0x074,
	UNKNOWN_075 = 0x075,
	UNKNOWN_076 = 0x076,
	UNKNOWN_077 = 0x077,
	UNKNOWN_078 = 0x078,
	UNKNOWN_079 = 0x079,
	UNKNOWN_07A = 0x07A,
	UNKNOWN_07B = 0x07B,
	PLACED_ZOMBIE_PAPER = 0x07C,
	UNKNOWN_07D = 0x07D,
	UNKNOWN_07E = 0x07E,
	UNKNOWN_07F = 0x07F,
	UNKNOWN_080 = 0x080,
	UNKNOWN_081 = 0x081,
	UNKNOWN_082 = 0x082,
	UNKNOWN_083 = 0x083,
	UNKNOWN_084 = 0x084,
	UNKNOWN_085 = 0x085,
	UNKNOWN_086 = 0x086,
	UNKNOWN_087 = 0x087,
	UNKNOWN_088 = 0x088,
	UNKNOWN_089 = 0x089,
	UNKNOWN_08A = 0x08A,
	UNKNOWN_08B = 0x08B,
	UNKNOWN_08C = 0x08C,
	UNKNOWN_08D = 0x08D,
	UNKNOWN_08E = 0x08E,
	UNKNOWN_08F = 0x08F,
	UNKNOWN_090 = 0x090,
	UNKNOWN_091 = 0x091,
	UNKNOWN_092 = 0x092,
	UNKNOWN_093 = 0x093,
	UNKNOWN_094 = 0x094,
	DALAAM_INTRO_PLAYED = 0x095,
	UNKNOWN_096 = 0x096,
	UNKNOWN_097 = 0x097,
	UNKNOWN_098 = 0x098,
	UNKNOWN_099 = 0x099,
	UNKNOWN_09A = 0x09A,
	UNKNOWN_09B = 0x09B,
	UNKNOWN_09C = 0x09C,
	UNKNOWN_09D = 0x09D,
	UNKNOWN_09E = 0x09E,
	UNKNOWN_09F = 0x09F,
	UNKNOWN_0A0 = 0x0A0,
	UNKNOWN_0A1 = 0x0A1,
	UNKNOWN_0A2 = 0x0A2,
	UNKNOWN_0A3 = 0x0A3,
	UNKNOWN_0A4 = 0x0A4,
	UNKNOWN_0A5 = 0x0A5,
	UNKNOWN_0A6 = 0x0A6,
	UNKNOWN_0A7 = 0x0A7,
	UNKNOWN_0A8 = 0x0A8,
	UNKNOWN_0A9 = 0x0A9,
	UNKNOWN_0AA = 0x0AA,
	UNKNOWN_0AB = 0x0AB,
	UNKNOWN_0AC = 0x0AC,
	UNKNOWN_0AD = 0x0AD,
	MINE_EXPANDED = 0x0AE,
	UNKNOWN_0AF = 0x0AF,
	UNKNOWN_0B0 = 0x0B0,
	UNKNOWN_0B1 = 0x0B1,
	UNKNOWN_0B2 = 0x0B2,
	UNKNOWN_0B3 = 0x0B3,
	Unknown0B4 = 0x0B4,
	Unknown0B5 = 0x0B5,
	SOUND_STONE_MELODY_1 = 0xB6,
	SOUND_STONE_MELODY_2 = 0xB7,
	SOUND_STONE_MELODY_4 = 0xB8,
	SOUND_STONE_MELODY_3 = 0xB9,
	SOUND_STONE_MELODY_5 = 0xBA,
	SOUND_STONE_MELODY_6 = 0xBB,
	SOUND_STONE_MELODY_7 = 0xBC,
	SOUND_STONE_MELODY_8 = 0xBD,
	DEFEATED_SANCTUARY_BOSS_1 = 0xBE,
	DEFEATED_SANCTUARY_BOSS_2 = 0xBF,
	DEFEATED_SANCTUARY_BOSS_4 = 0xC0,
	DEFEATED_SANCTUARY_BOSS_3 = 0xC1,
	DEFEATED_SANCTUARY_BOSS_5 = 0xC2,
	DEFEATED_SANCTUARY_BOSS_6 = 0xC3,
	DEFEATED_SANCTUARY_BOSS_7 = 0xC4,
	DEFEATED_SANCTUARY_BOSS_8 = 0xC5,
	UNKNOWN_0C6 = 0xC6,
	DAD_PHONE_UNLOCKED = 0xC7,
	MOM_PHONE_UNLOCKED = 0xC8,
	ESCARGO_EXPRESS_PHONE_UNLOCKED = 0xC9,
	MACH_PIZZA_PHONE_UNLOCKED = 0xCA,
	STOIC_CLUB_PHONE_UNLOCKED = 0xCB,
	FlyingMan1Dead = 0xCC,
	FlyingMan2Dead = 0xCD,
	FlyingMan3Dead = 0xCE,
	FlyingMan4Dead = 0xCF,
	FlyingMan5Dead = 0xD0,
	ONETT_REACHED = 0xD1,
	TWOSON_REACHED = 0xD2,
	THREED_REACHED = 0xD3,
	WINTERS_REACHED = 0xD4,
	SATURN_VALLEY_REACHED = 0xD5,
	FOURSIDE_REACHED = 0xD6,
	SUMMERS_REACHED = 0xD7,
	DALAAM_REACHED = 0xD8,
	SCARABA_REACHED = 0xD9,
	DEEP_DARKNESS_REACHED = 0xDA,
	TENDA_VILLAGE_REACHED = 0xDB,
	UNDERWORLD_REACHED = 0xDC,
	UNKNOWN_0DD = 0x0DD,
	UNKNOWN_0DE = 0x0DE,
	UNKNOWN_0DF = 0x0DF,
	UNKNOWN_0E0 = 0x0E0,
	UNKNOWN_0E1 = 0x0E1,
	AT_STORE_ONETT_DRUGSTORE_EQUIPMENT = 0xE2,
	AT_STORE_ONETT_DRUGSTORE_PHARMACY = 0xE3,
	AT_STORE_0E4 = 0x0E4,
	AT_STORE_0E5 = 0x0E5,
	AT_STORE_0E6 = 0x0E6,
	AT_STORE_0E7 = 0x0E7,
	AT_STORE_0E8 = 0x0E8,
	AT_STORE_0E9 = 0x0E9,
	AT_STORE_0EA = 0x0EA,
	AT_STORE_0EB = 0x0EB,
	AT_STORE_0EC = 0x0EC,
	AT_STORE_0ED = 0x0ED,
	AT_STORE_0EE = 0x0EE,
	AT_STORE_0EF = 0x0EF,
	AT_STORE_0F0 = 0x0F0,
	AT_STORE_0F1 = 0x0F1,
	AT_STORE_0F2 = 0x0F2,
	AT_STORE_0F3 = 0x0F3,
	AT_STORE_0F4 = 0x0F4,
	AT_STORE_0F5 = 0x0F5,
	AT_STORE_0F6 = 0x0F6,
	AT_STORE_0F7 = 0x0F7,
	AT_STORE_0F8 = 0x0F8,
	AT_STORE_0F9 = 0x0F9,
	AT_STORE_0FA = 0x0FA,
	AT_STORE_0FB = 0x0FB,
	AT_STORE_0FC = 0x0FC,
	AT_STORE_0FD = 0x0FD,
	AT_STORE_0FE = 0x0FE,
	AT_STORE_0FF = 0x0FF,
	AT_STORE_100 = 0x100,
	AT_STORE_101 = 0x101,
	AT_STORE_102 = 0x102,
	AT_STORE_103 = 0x103,
	AT_STORE_104 = 0x104,
	AT_STORE_105 = 0x105,
	AT_STORE_106 = 0x106,
	AT_STORE_107 = 0x107,
	AT_STORE_108 = 0x108,
	AT_STORE_109 = 0x109,
	AT_STORE_10A = 0x10A,
	AT_STORE_10B = 0x10B,
	AT_STORE_10C = 0x10C,
	AT_STORE_10D = 0x10D,
	AT_STORE_10E = 0x10E,
	AT_STORE_10F = 0x10F,
	UNKNOWN_110 = 0x110,
	UNKNOWN_111 = 0x111,
	UNKNOWN_112 = 0x112,
	UNKNOWN_113 = 0x113,
	UNKNOWN_114 = 0x114,
	UNKNOWN_115 = 0x115,
	UNKNOWN_116 = 0x116,
	UNKNOWN_117 = 0x117,
	UNKNOWN_118 = 0x118,
	UNKNOWN_119 = 0x119,
	UNKNOWN_11A = 0x11A,
	UNKNOWN_11B = 0x11B,
	UNKNOWN_11C = 0x11C,
	UNKNOWN_11D = 0x11D,
	UNKNOWN_11E = 0x11E,
	UNKNOWN_11F = 0x11F,
	UNKNOWN_120 = 0x120,
	UNKNOWN_121 = 0x121,
	UNKNOWN_122 = 0x122,
	UNKNOWN_123 = 0x123,
	UNKNOWN_124 = 0x124,
	UNKNOWN_125 = 0x125,
	UNKNOWN_126 = 0x126,
	UNKNOWN_127 = 0x127,
	UNKNOWN_128 = 0x128,
	UNKNOWN_129 = 0x129,
	UNKNOWN_12A = 0x12A,
	UNKNOWN_12B = 0x12B,
	UNKNOWN_12C = 0x12C,
	UNKNOWN_12D = 0x12D,
	UNKNOWN_12E = 0x12E,
	UNKNOWN_12F = 0x12F,
	UNKNOWN_130 = 0x130,
	UNKNOWN_131 = 0x131,
	UNKNOWN_132 = 0x132,
	UNKNOWN_133 = 0x133,
	UNKNOWN_134 = 0x134,
	UNKNOWN_135 = 0x135,
	UNKNOWN_136 = 0x136,
	UNKNOWN_137 = 0x137,
	UNKNOWN_138 = 0x138,
	UNKNOWN_139 = 0x139,
	UNKNOWN_13A = 0x13A,
	UNKNOWN_13B = 0x13B,
	UNKNOWN_13C = 0x13C,
	UNKNOWN_13D = 0x13D,
	UNKNOWN_13E = 0x13E,
	UNKNOWN_13F = 0x13F,
	UNKNOWN_140 = 0x140,
	UNKNOWN_141 = 0x141,
	UNKNOWN_142 = 0x142,
	UNKNOWN_143 = 0x143,
	AT_STORE_144 = 0x144,
	AT_STORE_145 = 0x145,
	AT_STORE_146 = 0x146,
	UNKNOWN_147 = 0x147,
	UNKNOWN_148 = 0x148,
	UNKNOWN_149 = 0x149,
	UNKNOWN_14A = 0x14A,
	UNKNOWN_14B = 0x14B,
	UNKNOWN_14C = 0x14C,
	UNKNOWN_14D = 0x14D,
	UNKNOWN_14E = 0x14E,
	UNKNOWN_14F = 0x14F,
	UNKNOWN_150 = 0x150,
	HAVE_STOIC_CLUB_RESERVATION = 0x151,
	UNKNOWN_152 = 0x152,
	UNKNOWN_153 = 0x153,
	UNKNOWN_154 = 0x154,
	UNKNOWN_155 = 0x155,
	UNKNOWN_156 = 0x156,
	UNKNOWN_157 = 0x157,
	UNKNOWN_158 = 0x158,
	UNKNOWN_159 = 0x159,
	UNKNOWN_15A = 0x15A,
	UNKNOWN_15B = 0x15B,
	UNKNOWN_15C = 0x15C,
	UNKNOWN_15D = 0x15D,
	UNKNOWN_15E = 0x15E,
	UNKNOWN_15F = 0x15F,
	UNKNOWN_160 = 0x160,
	UNKNOWN_161 = 0x161,
	UNKNOWN_162 = 0x162,
	UNKNOWN_163 = 0x163,
	UNKNOWN_164 = 0x164,
	UNKNOWN_165 = 0x165,
	UNKNOWN_166 = 0x166,
	UNKNOWN_167 = 0x167,
	UNKNOWN_168 = 0x168,
	UNKNOWN_169 = 0x169,
	UNKNOWN_16A = 0x16A,
	UNKNOWN_16B = 0x16B,
	UNKNOWN_16C = 0x16C,
	FLG_ONET_SHARK_C_DISAPPEAR = 0x16D,
	UNKNOWN_16E = 0x16E,
	UNKNOWN_16F = 0x16F,
	UNKNOWN_170 = 0x170,
	UNKNOWN_171 = 0x171,
	UNKNOWN_172 = 0x172,
	UNKNOWN_173 = 0x173,
	UNKNOWN_174 = 0x174,
	UNKNOWN_175 = 0x175,
	UNKNOWN_176 = 0x176,
	UNKNOWN_177 = 0x177,
	UNKNOWN_178 = 0x178,
	UNKNOWN_179 = 0x179,
	UNKNOWN_17A = 0x17A,
	UNKNOWN_17B = 0x17B,
	UNKNOWN_17C = 0x17C,
	UNKNOWN_17D = 0x17D,
	UNKNOWN_17E = 0x17E,
	JUST_RESTED = 0x17F,
	UNKNOWN_180 = 0x180,
	UNKNOWN_181 = 0x181,
	FIRE_PLUG_FOUGHT = 0x182,
	ROBO_PUMP_1_FOUGHT = 0x183,
	ROBO_PUMP_2_FOUGHT = 0x184,
	ABSTRACT_ART_FOUGHT = 0x185,
	GUARDIAN_HIEROGLYPH_1_FOUGHT = 0x186,
	GUARDIAN_HIEROGLYPH_2_FOUGHT = 0x187,
	UNKNOWN_188 = 0x188,
	UNKNOWN_189 = 0x189,
	UNKNOWN_18A = 0x18A,
	UNKNOWN_18B = 0x18B,
	UNKNOWN_18C = 0x18C,
	UNKNOWN_18D = 0x18D,
	UNKNOWN_18E = 0x18E,
	UNKNOWN_18F = 0x18F,
	UNKNOWN_190 = 0x190,
	UNKNOWN_191 = 0x191,
	UNKNOWN_192 = 0x192,
	UNKNOWN_193 = 0x193,
	UNKNOWN_194 = 0x194,
	UNKNOWN_195 = 0x195,
	UNKNOWN_196 = 0x196,
	UNKNOWN_197 = 0x197,
	UNKNOWN_198 = 0x198,
	UNKNOWN_199 = 0x199,
	UNKNOWN_19A = 0x19A,
	UNKNOWN_19B = 0x19B,
	UNKNOWN_19C = 0x19C,
	UNKNOWN_19D = 0x19D,
	UNKNOWN_19E = 0x19E,
	UNKNOWN_19F = 0x19F,
	MAD_DUCK_1_FOUGHT = 0x1A0,
	MAD_DUCK_2_FOUGHT = 0x1A1,
	WORTHLESS_PROTOPLASM_1_FOUGHT = 0x1A2,
	WORTHLESS_PROTOPLASM_2_FOUGHT = 0x1A3,
	ROWDY_MOUSE_1_FOUGHT = 0x1A4,
	ROWDY_MOUSE_2_FOUGHT = 0x1A5,
	UNKNOWN_1A6 = 0x1A6,
	UNKNOWN_1A7 = 0x1A7,
	UNKNOWN_1A8 = 0x1A8,
	UNKNOWN_1A9 = 0x1A9,
	UNKNOWN_1AA = 0x1AA,
	UNKNOWN_1AB = 0x1AB,
	UNKNOWN_1AC = 0x1AC,
	UNKNOWN_1AD = 0x1AD,
	UNKNOWN_1AE = 0x1AE,
	UNKNOWN_1AF = 0x1AF,
	UNKNOWN_1B0 = 0x1B0,
	ZOMBIE_LADY_ACTIVE = 0x1B1,
	UNKNOWN_1B2 = 0x1B2,
	UNKNOWN_1B3 = 0x1B3,
	UNKNOWN_1B4 = 0x1B4,
	UNKNOWN_1B5 = 0x1B5,
	UNKNOWN_1B6 = 0x1B6,
	UNKNOWN_1B7 = 0x1B7,
	UNKNOWN_1B8 = 0x1B8,
	UNKNOWN_1B9 = 0x1B9,
	UNKNOWN_1BA = 0x1BA,
	UNKNOWN_1BB = 0x1BB,
	UNKNOWN_1BC = 0x1BC,
	UNKNOWN_1BD = 0x1BD,
	ForSaleSignNPC1Coming = 0x1BE,
	UNKNOWN_1BF = 0x1BF,
	UNKNOWN_1C0 = 0x1C0,
	UNKNOWN_1C1 = 0x1C1,
	UNKNOWN_1C2 = 0x1C2,
	UNKNOWN_1C3 = 0x1C3,
	UNKNOWN_1C4 = 0x1C4,
	UNKNOWN_1C5 = 0x1C5,
	UNKNOWN_1C6 = 0x1C6,
	UNKNOWN_1C7 = 0x1C7,
	UNKNOWN_1C8 = 0x1C8,
	UNKNOWN_1C9 = 0x1C9,
	UNKNOWN_1CA = 0x1CA,
	UNKNOWN_1CB = 0x1CB,
	UNKNOWN_1CC = 0x1CC,
	UNKNOWN_1CD = 0x1CD,
	UNKNOWN_1CE = 0x1CE,
	UNKNOWN_1CF = 0x1CF,
	UNKNOWN_1D0 = 0x1D0,
	UNKNOWN_1D1 = 0x1D1,
	UNKNOWN_1D2 = 0x1D2,
	UNKNOWN_1D3 = 0x1D3,
	UNKNOWN_1D4 = 0x1D4,
	UNKNOWN_1D5 = 0x1D5,
	UNKNOWN_1D6 = 0x1D6,
	UNKNOWN_1D7 = 0x1D7,
	UNKNOWN_1D8 = 0x1D8,
	UNKNOWN_1D9 = 0x1D9,
	UNKNOWN_1DA = 0x1DA,
	NoContinueSelected = 0x1DB,
	UNKNOWN_1DC = 0x1DC,
	UNKNOWN_1DD = 0x1DD,
	AT_STORE_1DE = 0x1DE,
	UNKNOWN_1DF = 0x1DF,
	UNKNOWN_1E0 = 0x1E0,
	UNKNOWN_1E1 = 0x1E1,
	UNKNOWN_1E2 = 0x1E2,
	UNKNOWN_1E3 = 0x1E3,
	UNKNOWN_1E4 = 0x1E4,
	UNKNOWN_1E5 = 0x1E5,
	UNKNOWN_1E6 = 0x1E6,
	UNKNOWN_1E7 = 0x1E7,
	UNKNOWN_1E8 = 0x1E8,
	UNKNOWN_1E9 = 0x1E9,
	UNKNOWN_1EA = 0x1EA,
	UNKNOWN_1EB = 0x1EB,
	UNKNOWN_1EC = 0x1EC,
	UNKNOWN_1ED = 0x1ED,
	UNKNOWN_1EE = 0x1EE,
	UNKNOWN_1EF = 0x1EF,
	UNKNOWN_1F0 = 0x1F0,
	UNKNOWN_1F1 = 0x1F1,
	UNKNOWN_1F2 = 0x1F2,
	UNKNOWN_1F3 = 0x1F3,
	UNKNOWN_1F4 = 0x1F4,
	UNKNOWN_1F5 = 0x1F5,
	UNKNOWN_1F6 = 0x1F6,
	UNKNOWN_1F7 = 0x1F7,
	UNKNOWN_1F8 = 0x1F8,
	UNKNOWN_1F9 = 0x1F9,
	UNKNOWN_1FA = 0x1FA,
	UNKNOWN_1FB = 0x1FB,
	UNKNOWN_1FC = 0x1FC,
	UNKNOWN_1FD = 0x1FD,
	UNKNOWN_1FE = 0x1FE,
	UNKNOWN_1FF = 0x1FF,
	UNKNOWN_200 = 0x200,
	UNKNOWN_201 = 0x201,
	UNKNOWN_202 = 0x202,
	UNKNOWN_203 = 0x203,
	UNKNOWN_204 = 0x204,
	UNKNOWN_205 = 0x205,
	UNKNOWN_206 = 0x206,
	UNKNOWN_207 = 0x207,
	UNKNOWN_208 = 0x208,
	UNKNOWN_209 = 0x209,
	UNKNOWN_20A = 0x20A,
	UNKNOWN_20B = 0x20B,
	UNKNOWN_20C = 0x20C,
	UNKNOWN_20D = 0x20D,
	UNKNOWN_20E = 0x20E,
	UNKNOWN_20F = 0x20F,
	UNKNOWN_210 = 0x210,
	UNKNOWN_211 = 0x211,
	UNKNOWN_212 = 0x212,
	UNKNOWN_213 = 0x213,
	UNKNOWN_214 = 0x214,
	UNKNOWN_215 = 0x215,
	ON_CITY_BUS = 0x216,
	UNKNOWN_217 = 0x217,
	UNKNOWN_218 = 0x218,
	ON_TESSIE = 0x219,
	UNKNOWN_21A = 0x21A,
	UNKNOWN_21B = 0x21B,
	UNKNOWN_21C = 0x21C,
	UNKNOWN_21D = 0x21D,
	UNKNOWN_21E = 0x21E,
	UNKNOWN_21F = 0x21F,
	UNKNOWN_220 = 0x220,
	UNKNOWN_221 = 0x221,
	UNKNOWN_222 = 0x222,
	UNKNOWN_223 = 0x223,
	UNKNOWN_224 = 0x224,
	UNKNOWN_225 = 0x225,
	UNKNOWN_226 = 0x226,
	UNKNOWN_227 = 0x227,
	RECEIVED_ZOMBIE_PAPER = 0x228,
	UNKNOWN_229 = 0x229,
	UNKNOWN_22A = 0x22A,
	UNKNOWN_22B = 0x22B,
	UNKNOWN_22C = 0x22C,
	UNKNOWN_22D = 0x22D,
	UNKNOWN_22E = 0x22E,
	UNKNOWN_22F = 0x22F,
	UNKNOWN_230 = 0x230,
	UNKNOWN_231 = 0x231,
	UNKNOWN_232 = 0x232,
	UNKNOWN_233 = 0x233,
	UNKNOWN_234 = 0x234,
	UNKNOWN_235 = 0x235,
	UNKNOWN_236 = 0x236,
	UNKNOWN_237 = 0x237,
	UNKNOWN_238 = 0x238,
	UNKNOWN_239 = 0x239,
	UNKNOWN_23A = 0x23A,
	UNKNOWN_23B = 0x23B,
	UNKNOWN_23C = 0x23C,
	UNKNOWN_23D = 0x23D,
	UNKNOWN_23E = 0x23E,
	UNKNOWN_23F = 0x23F,
	UNKNOWN_240 = 0x240,
	UNKNOWN_241 = 0x241,
	UNKNOWN_242 = 0x242,
	UNKNOWN_243 = 0x243,
	UNKNOWN_244 = 0x244,
	UNKNOWN_245 = 0x245,
	UNKNOWN_246 = 0x246,
	UNKNOWN_247 = 0x247,
	UNKNOWN_248 = 0x248,
	UNKNOWN_249 = 0x249,
	UNKNOWN_24A = 0x24A,
	UNKNOWN_24B = 0x24B,
	UNKNOWN_24C = 0x24C,
	UNKNOWN_24D = 0x24D,
	UNKNOWN_24E = 0x24E,
	UNKNOWN_24F = 0x24F,
	UNKNOWN_250 = 0x250,
	UNKNOWN_251 = 0x251,
	UNKNOWN_252 = 0x252,
	UNKNOWN_253 = 0x253,
	UNKNOWN_254 = 0x254,
	AT_STORE_255 = 0x255,
	AT_STORE_256 = 0x256,
	AT_STORE_257 = 0x257,
	AT_STORE_258 = 0x258,
	UNKNOWN_259 = 0x259,
	UNKNOWN_25A = 0x25A,
	UNKNOWN_25B = 0x25B,
	UNKNOWN_25C = 0x25C,
	UNKNOWN_25D = 0x25D,
	UNKNOWN_25E = 0x25E,
	UNKNOWN_25F = 0x25F,
	UNKNOWN_260 = 0x260,
	UNKNOWN_261 = 0x261,
	UNKNOWN_262 = 0x262,
	UNKNOWN_263 = 0x263,
	UNKNOWN_264 = 0x264,
	UNKNOWN_265 = 0x265,
	UNKNOWN_266 = 0x266,
	UNKNOWN_267 = 0x267,
	UNKNOWN_268 = 0x268,
	UNKNOWN_269 = 0x269,
	UNKNOWN_26A = 0x26A,
	UNKNOWN_26B = 0x26B,
	UNKNOWN_26C = 0x26C,
	UNKNOWN_26D = 0x26D,
	UNKNOWN_26E = 0x26E,
	UNKNOWN_26F = 0x26F,
	UNKNOWN_270 = 0x270,
	UNKNOWN_271 = 0x271,
	UNKNOWN_272 = 0x272,
	UNKNOWN_273 = 0x273,
	UNKNOWN_274 = 0x274,
	UNKNOWN_275 = 0x275,
	UNKNOWN_276 = 0x276,
	UNKNOWN_277 = 0x277,
	UNKNOWN_278 = 0x278,
	UNKNOWN_279 = 0x279,
	PAULAS_FIRST_CALL_TO_NESS = 0x27A,
	PAULAS_SECOND_CALL_TO_NESS = 0x27B,
	PAULAS_CALL_TO_JEFF = 0x27C,
	UNKNOWN_27D = 0x27D,
	UNKNOWN_27E = 0x27E,
	UNKNOWN_27F = 0x27F,
	UNKNOWN_280 = 0x280,
	UNKNOWN_281 = 0x281,
	UNKNOWN_282 = 0x282,
	UNKNOWN_283 = 0x283,
	UNKNOWN_284 = 0x284,
	Unknown285 = 0x285,
	ForSaleSignNPC2Coming = 0x286,
	ForSaleSignNPC3Coming = 0x287,
	ForSaleSignNPC4Coming = 0x288,
	UNKNOWN_289 = 0x289,
	UNKNOWN_28A = 0x28A,
	UNKNOWN_28B = 0x28B,
	UNKNOWN_28C = 0x28C,
	AT_STORE_28D = 0x28D,
	UNKNOWN_28E = 0x28E,
	ON_SKY_RUNNER = 0x28F,
	UNKNOWN_290 = 0x290,
	UNKNOWN_291 = 0x291,
	UNKNOWN_292 = 0x292,
	UNKNOWN_293 = 0x293,
	UNKNOWN_294 = 0x294,
	UNKNOWN_295 = 0x295,
	UNKNOWN_296 = 0x296,
	UNKNOWN_297 = 0x297,
	UNKNOWN_298 = 0x298,
	UNKNOWN_299 = 0x299,
	UNKNOWN_29A = 0x29A,
	UNKNOWN_29B = 0x29B,
	UNKNOWN_29C = 0x29C,
	UNKNOWN_29D = 0x29D,
	UNKNOWN_29E = 0x29E,
	UNKNOWN_29F = 0x29F,
	UNKNOWN_2A0 = 0x2A0,
	UNKNOWN_2A1 = 0x2A1,
	UNKNOWN_2A2 = 0x2A2,
	DeliveringZombiePaper = 0x2A3,
	UNKNOWN_2A4 = 0x2A4,
	UNKNOWN_2A5 = 0x2A5,
	UNKNOWN_2A6 = 0x2A6,
	UNKNOWN_2A7 = 0x2A7,
	UNKNOWN_2A8 = 0x2A8,
	UNKNOWN_2A9 = 0x2A9,
	UNKNOWN_2AA = 0x2AA,
	UNKNOWN_2AB = 0x2AB,
	UNKNOWN_2AC = 0x2AC,
	UNKNOWN_2AD = 0x2AD,
	UNKNOWN_2AE = 0x2AE,
	UNKNOWN_2AF = 0x2AF,
	UNKNOWN_2B0 = 0x2B0,
	MOM_WANTS_TO_HEAR_ABOUT_PAULA = 0x2B1,
	UNKNOWN_2B2 = 0x2B2,
	UNKNOWN_2B3 = 0x2B3,
	UNKNOWN_2B4 = 0x2B4,
	UNKNOWN_2B5 = 0x2B5,
	Unknown2B6 = 0x2B6,
	Unknown2B7 = 0x2B7,
	JEFF_FIXED_FIRST_ITEM = 0x2B8,
	UNKNOWN_2B9 = 0x2B9,
	UNKNOWN_2BA = 0x2BA,
	UNKNOWN_2BB = 0x2BB,
	UNKNOWN_2BC = 0x2BC,
	UNKNOWN_2BD = 0x2BD,
	UNKNOWN_2BE = 0x2BE,
	UNKNOWN_2BF = 0x2BF,
	UNKNOWN_2C0 = 0x2C0,
	UNKNOWN_2C1 = 0x2C1,
	UNKNOWN_2C2 = 0x2C2,
	UNKNOWN_2C3 = 0x2C3,
	UNKNOWN_2C4 = 0x2C4,
	UNKNOWN_2C5 = 0x2C5,
	UNKNOWN_2C6 = 0x2C6,
	UNKNOWN_2C7 = 0x2C7,
	UNKNOWN_2C8 = 0x2C8,
	UNKNOWN_2C9 = 0x2C9,
	UNKNOWN_2CA = 0x2CA,
	UNKNOWN_2CB = 0x2CB,
	UNKNOWN_2CC = 0x2CC,
	UNKNOWN_2CD = 0x2CD,
	UNKNOWN_2CE = 0x2CE,
	UNKNOWN_2CF = 0x2CF,
	UNKNOWN_2D0 = 0x2D0,
	UNKNOWN_2D1 = 0x2D1,
	UNKNOWN_2D2 = 0x2D2,
	UNKNOWN_2D3 = 0x2D3,
	UNKNOWN_2D4 = 0x2D4,
	UNKNOWN_2D5 = 0x2D5,
	UNKNOWN_2D6 = 0x2D6,
	UNKNOWN_2D7 = 0x2D7,
	UNKNOWN_2D8 = 0x2D8,
	UNKNOWN_2D9 = 0x2D9,
	UNKNOWN_2DA = 0x2DA,
	AT_STORE_2DB = 0x2DB,
	AT_STORE_2DC = 0x2DC,
	AT_STORE_2DD = 0x2DD,
	UNKNOWN_2DE = 0x2DE,
	UNKNOWN_2DF = 0x2DF,
	UNKNOWN_2E0 = 0x2E0,
	UNKNOWN_2E1 = 0x2E1,
	UNKNOWN_2E2 = 0x2E2,
	UNKNOWN_2E3 = 0x2E3,
	UNKNOWN_2E4 = 0x2E4,
	UNKNOWN_2E5 = 0x2E5,
	UNKNOWN_2E6 = 0x2E6,
	UNKNOWN_2E7 = 0x2E7,
	UNKNOWN_2E8 = 0x2E8,
	UNKNOWN_2E9 = 0x2E9,
	UNKNOWN_2EA = 0x2EA,
	UNKNOWN_2EB = 0x2EB,
	UNKNOWN_2EC = 0x2EC,
	NessPajamas = 0x2ED,
	UNKNOWN_2EE = 0x2EE,
	UNKNOWN_2EF = 0x2EF,
	UNKNOWN_2F0 = 0x2F0,
	UNKNOWN_2F1 = 0x2F1,
	NPCDelivery = 0x2F2,
	UNKNOWN_2F3 = 0x2F3,
	UNKNOWN_2F4 = 0x2F4,
	NEED_TO_PICK_UP_DIAMOND = 0x2F5,
	UNKNOWN_2F6 = 0x2F6,
	UNKNOWN_2F7 = 0x2F7,
	UNKNOWN_2F8 = 0x2F8,
	UNKNOWN_2F9 = 0x2F9,
	UNKNOWN_2FA = 0x2FA,
	UNKNOWN_2FB = 0x2FB,
	UNKNOWN_2FC = 0x2FC,
	UNKNOWN_2FD = 0x2FD,
	UNKNOWN_2FE = 0x2FE,
	UNKNOWN_2FF = 0x2FF,
	UNKNOWN_300 = 0x300,
	UNKNOWN_301 = 0x301,
	UNKNOWN_302 = 0x302,
	UNKNOWN_303 = 0x303,
	UNKNOWN_304 = 0x304,
	UNKNOWN_305 = 0x305,
	UNKNOWN_306 = 0x306,
	UNKNOWN_307 = 0x307,
	UNKNOWN_308 = 0x308,
	UNKNOWN_309 = 0x309,
	UNKNOWN_30A = 0x30A,
	UNKNOWN_30B = 0x30B,
	UNKNOWN_30C = 0x30C,
	UNKNOWN_30D = 0x30D,
	UNKNOWN_30E = 0x30E,
	UNKNOWN_30F = 0x30F,
	UNKNOWN_310 = 0x310,
	UNKNOWN_311 = 0x311,
	UNKNOWN_312 = 0x312,
	UNKNOWN_313 = 0x313,
	UNKNOWN_314 = 0x314,
	UNKNOWN_315 = 0x315,
	UNKNOWN_316 = 0x316,
	UNKNOWN_317 = 0x317,
	UNKNOWN_318 = 0x318,
	UNKNOWN_319 = 0x319,
	UNKNOWN_31A = 0x31A,
	UNKNOWN_31B = 0x31B,
	UNKNOWN_31C = 0x31C,
	UNKNOWN_31D = 0x31D,
	UNKNOWN_31E = 0x31E,
	UNKNOWN_31F = 0x31F,
	UNKNOWN_320 = 0x320,
	UNKNOWN_321 = 0x321,
	UNKNOWN_322 = 0x322,
	UNKNOWN_323 = 0x323,
	UNKNOWN_324 = 0x324,
	UNKNOWN_325 = 0x325,
	UNKNOWN_326 = 0x326,
	UNKNOWN_327 = 0x327,
	UNKNOWN_328 = 0x328,
	UNKNOWN_329 = 0x329,
	UNKNOWN_32A = 0x32A,
	UNKNOWN_32B = 0x32B,
	UNKNOWN_32C = 0x32C,
	UNKNOWN_32D = 0x32D,
	UNKNOWN_32E = 0x32E,
	UNKNOWN_32F = 0x32F,
	UNKNOWN_330 = 0x330,
	UNKNOWN_331 = 0x331,
	UNKNOWN_332 = 0x332,
	UNKNOWN_333 = 0x333,
	UNKNOWN_334 = 0x334,
	UNKNOWN_335 = 0x335,
	UNKNOWN_336 = 0x336,
	UNKNOWN_337 = 0x337,
	UNKNOWN_338 = 0x338,
	UNKNOWN_339 = 0x339,
	UNKNOWN_33A = 0x33A,
	UNKNOWN_33B = 0x33B,
	UNKNOWN_33C = 0x33C,
	UNKNOWN_33D = 0x33D,
	UNKNOWN_33E = 0x33E,
	UNKNOWN_33F = 0x33F,
	UNKNOWN_340 = 0x340,
	UNKNOWN_341 = 0x341,
	UNKNOWN_342 = 0x342,
	UNKNOWN_343 = 0x343,
	UNKNOWN_344 = 0x344,
	UNKNOWN_345 = 0x345,
	UNKNOWN_346 = 0x346,
	UNKNOWN_347 = 0x347,
	UNKNOWN_348 = 0x348,
	UNKNOWN_349 = 0x349,
	UNKNOWN_34A = 0x34A,
	UNKNOWN_34B = 0x34B,
	UNKNOWN_34C = 0x34C,
	UNKNOWN_34D = 0x34D,
	UNKNOWN_34E = 0x34E,
	UNKNOWN_34F = 0x34F,
	UNKNOWN_350 = 0x350,
	UNKNOWN_351 = 0x351,
	UNKNOWN_352 = 0x352,
	UNKNOWN_353 = 0x353,
	UNKNOWN_354 = 0x354,
	UNKNOWN_355 = 0x355,
	UNKNOWN_356 = 0x356,
	UNKNOWN_357 = 0x357,
	UNKNOWN_358 = 0x358,
	UNKNOWN_359 = 0x359,
	UNKNOWN_35A = 0x35A,
	UNKNOWN_35B = 0x35B,
	UNKNOWN_35C = 0x35C,
	UNKNOWN_35D = 0x35D,
	UNKNOWN_35E = 0x35E,
	UNKNOWN_35F = 0x35F,
	UNKNOWN_360 = 0x360,
	UNKNOWN_361 = 0x361,
	UNKNOWN_362 = 0x362,
	UNKNOWN_363 = 0x363,
	UNKNOWN_364 = 0x364,
	UNKNOWN_365 = 0x365,
	UNKNOWN_366 = 0x366,
	UNKNOWN_367 = 0x367,
	UNKNOWN_368 = 0x368,
	UNKNOWN_369 = 0x369,
	UNKNOWN_36A = 0x36A,
	UNKNOWN_36B = 0x36B,
	UNKNOWN_36C = 0x36C,
	UNKNOWN_36D = 0x36D,
	UNKNOWN_36E = 0x36E,
	UNKNOWN_36F = 0x36F,
	UNKNOWN_370 = 0x370,
	UNKNOWN_371 = 0x371,
	UNKNOWN_372 = 0x372,
	UNKNOWN_373 = 0x373,
	UNKNOWN_374 = 0x374,
	UNKNOWN_375 = 0x375,
	UNKNOWN_376 = 0x376,
	UNKNOWN_377 = 0x377,
	UNKNOWN_378 = 0x378,
	UNKNOWN_379 = 0x379,
	UNKNOWN_37A = 0x37A,
	UNKNOWN_37B = 0x37B,
	UNKNOWN_37C = 0x37C,
	UNKNOWN_37D = 0x37D,
	UNKNOWN_37E = 0x37E,
	UNKNOWN_37F = 0x37F,
	UNKNOWN_380 = 0x380,
	UNKNOWN_381 = 0x381,
	UNKNOWN_382 = 0x382,
	UNKNOWN_383 = 0x383,
	UNKNOWN_384 = 0x384,
	UNKNOWN_385 = 0x385,
	UNKNOWN_386 = 0x386,
	UNKNOWN_387 = 0x387,
	UNKNOWN_388 = 0x388,
	UNKNOWN_389 = 0x389,
	UNKNOWN_38A = 0x38A,
	UNKNOWN_38B = 0x38B,
	UNKNOWN_38C = 0x38C,
	UNKNOWN_38D = 0x38D,
	UNKNOWN_38E = 0x38E,
	UNKNOWN_38F = 0x38F,
	UNKNOWN_390 = 0x390,
	UNKNOWN_391 = 0x391,
	UNKNOWN_392 = 0x392,
	UNKNOWN_393 = 0x393,
	UNKNOWN_394 = 0x394,
	UNKNOWN_395 = 0x395,
	UNKNOWN_396 = 0x396,
	UNKNOWN_397 = 0x397,
	UNKNOWN_398 = 0x398,
	UNKNOWN_399 = 0x399,
	UNKNOWN_39A = 0x39A,
	UNKNOWN_39B = 0x39B,
	UNKNOWN_39C = 0x39C,
	UNKNOWN_39D = 0x39D,
	UNKNOWN_39E = 0x39E,
	UNKNOWN_39F = 0x39F,
	UNKNOWN_3A0 = 0x3A0,
	UNKNOWN_3A1 = 0x3A1,
	UNKNOWN_3A2 = 0x3A2,
	UNKNOWN_3A3 = 0x3A3,
	UNKNOWN_3A4 = 0x3A4,
	UNKNOWN_3A5 = 0x3A5,
	UNKNOWN_3A6 = 0x3A6,
	UNKNOWN_3A7 = 0x3A7,
	UNKNOWN_3A8 = 0x3A8,
	UNKNOWN_3A9 = 0x3A9,
	UNKNOWN_3AA = 0x3AA,
	UNKNOWN_3AB = 0x3AB,
	UNKNOWN_3AC = 0x3AC,
	UNKNOWN_3AD = 0x3AD,
	UNKNOWN_3AE = 0x3AE,
	UNKNOWN_3AF = 0x3AF,
	UNKNOWN_3B0 = 0x3B0,
	UNKNOWN_3B1 = 0x3B1,
	UNKNOWN_3B2 = 0x3B2,
	UNKNOWN_3B3 = 0x3B3,
	UNKNOWN_3B4 = 0x3B4,
	UNKNOWN_3B5 = 0x3B5,
	UNKNOWN_3B6 = 0x3B6,
	UNKNOWN_3B7 = 0x3B7,
	UNKNOWN_3B8 = 0x3B8,
	UNKNOWN_3B9 = 0x3B9,
	UNKNOWN_3BA = 0x3BA,
	UNKNOWN_3BB = 0x3BB,
	UNKNOWN_3BC = 0x3BC,
	UNKNOWN_3BD = 0x3BD,
	UNKNOWN_3BE = 0x3BE,
	UNKNOWN_3BF = 0x3BF,
	UNKNOWN_3C0 = 0x3C0,
	UNKNOWN_3C1 = 0x3C1,
	UNKNOWN_3C2 = 0x3C2,
	UNKNOWN_3C3 = 0x3C3,
	UNKNOWN_3C4 = 0x3C4,
	UNKNOWN_3C5 = 0x3C5,
	UNKNOWN_3C6 = 0x3C6,
	UNKNOWN_3C7 = 0x3C7,
	UNKNOWN_3C8 = 0x3C8,
	UNKNOWN_3C9 = 0x3C9,
	UNKNOWN_3CA = 0x3CA,
	UNKNOWN_3CB = 0x3CB,
	UNKNOWN_3CC = 0x3CC,
	UNKNOWN_3CD = 0x3CD,
	UNKNOWN_3CE = 0x3CE,
	UNKNOWN_3CF = 0x3CF,
	UNKNOWN_3D0 = 0x3D0,
	UNKNOWN_3D1 = 0x3D1,
	UNKNOWN_3D2 = 0x3D2,
	UNKNOWN_3D3 = 0x3D3,
	UNKNOWN_3D4 = 0x3D4,
	UNKNOWN_3D5 = 0x3D5,
	UNKNOWN_3D6 = 0x3D6,
	UNKNOWN_3D7 = 0x3D7,
	UNKNOWN_3D8 = 0x3D8,
	UNKNOWN_3D9 = 0x3D9,
	UNKNOWN_3DA = 0x3DA,
	UNKNOWN_3DB = 0x3DB,
	UNKNOWN_3DC = 0x3DC,
	UNKNOWN_3DD = 0x3DD,
	UNKNOWN_3DE = 0x3DE,
	UNKNOWN_3DF = 0x3DF,
	UNKNOWN_3E0 = 0x3E0,
	UNKNOWN_3E1 = 0x3E1,
	UNKNOWN_3E2 = 0x3E2,
	UNKNOWN_3E3 = 0x3E3,
	UNKNOWN_3E4 = 0x3E4,
	UNKNOWN_3E5 = 0x3E5,
	UNKNOWN_3E6 = 0x3E6,
	UNKNOWN_3E7 = 0x3E7,
	UNKNOWN_3E8 = 0x3E8,
	UNKNOWN_3E9 = 0x3E9,
	UNKNOWN_3EA = 0x3EA,
	UNKNOWN_3EB = 0x3EB,
	UNKNOWN_3EC = 0x3EC,
	UNKNOWN_3ED = 0x3ED,
	UNKNOWN_3EE = 0x3EE,
	UNKNOWN_3EF = 0x3EF,
	UNKNOWN_3F0 = 0x3F0,
	UNKNOWN_3F1 = 0x3F1,
	UNKNOWN_3F2 = 0x3F2,
	UNKNOWN_3F3 = 0x3F3,
	UNKNOWN_3F4 = 0x3F4,
	UNKNOWN_3F5 = 0x3F5,
	UNKNOWN_3F6 = 0x3F6,
	UNKNOWN_3F7 = 0x3F7,
	UNKNOWN_3F8 = 0x3F8,
	UNKNOWN_3F9 = 0x3F9,
	UNKNOWN_3FA = 0x3FA,
	UNKNOWN_3FB = 0x3FB,
	UNKNOWN_3FC = 0x3FC,
	UNKNOWN_3FD = 0x3FD,
	UNKNOWN_3FE = 0x3FE,
	UNKNOWN_3FF = 0x3FF,
}

enum PartyMember {
	None = 0,
	Ness = 1,
	Paula = 2,
	Jeff = 3,
	Poo = 4,
	Pokey = 5,
	Picky = 6,
	King = 7,
	Tony = 8,
	BubbleMonkey = 9,
	DungeonMan = 10,
	FlyingMan1 = 11,
	FlyingMan2 = 12,
	FlyingMan3 = 13,
	FlyingMan4 = 14,
	FlyingMan5 = 15,
	TeddyBear = 16,
	PlushTeddyBear = 17,
}

enum NPCType {
	Person = 1,
	ItemBox = 2,
	Object = 3,
}

enum NPCConfigFlagStyle {
	ShowAlways = 0,
	ShowIfOff = 1,
	ShowIfOn = 2,
}

enum Font {
	Main = 0,
	MrSaturn = 1,
	Battle = 2,
	Tiny = 3,
	Large = 4
}
enum EquipmentSlot {
	Weapon = 0,
	Body = 1,
	Arms = 2,
	Other = 3,
	All = 3,
}

enum LetterboxStyle {
	None = 0,
	Large = 1,
	Medium = 2,
	Small = 3,
}
enum Status0 {
	Unconscious = 1,
	Diamondized = 2,
	Paralyzed = 3,
	Nauseous = 4,
	Poisoned = 5,
	Sunstroke = 6,
	Cold = 7,
}

enum Status1 {
	Mushroomized = 1,
	Possessed = 2,
}

enum Status2 {
	Asleep = 1,
	Crying = 2,
	Immobilized = 3,
	Solidified = 4,
}

enum Status3 {
	Strange = 1
}

enum Status4 {
	CantConcentrate = 1,
	CantConcentrate4 = 4,
}

enum Status5 {
	Homesick = 1
}

enum Status6 {
	PSIShieldPower = 1,
	PSIShield = 2,
	ShieldPower = 3,
	Shield = 4,
}

enum GiygasPhase {
	BattleStarted = 1,
	DevilsMachineOff = 2,
	GiygasStartsAttacking = 3,
	StartPraying = 4,
	Prayer1Used = 5,
	Prayer2Used = 6,
	Prayer3Used = 7,
	Prayer4Used = 8,
	Prayer5Used = 9,
	Prayer6Used = 10,
	Prayer7Used = 11,
	Prayer8Used = 12,
	Defeated = 0xFFFF,
}

enum Gender : ubyte {
	Male = 1,
	Female = 2,
	Neutral = 3,
}

enum EnemyType : ubyte {
	Normal = 0,
	Insect = 1,
	Metal = 2,
}

enum InitialStatus : ubyte {
	None = 0,
	PSIShield = 1,
	PSIShieldPower = 2,
	Shield = 3,
	ShieldPower = 4,
	Asleep = 5,
	CantConcentrate = 6,
	Strange = 7,
}

enum EnemyID {
	NULL = 0,
	INSANE_CULTIST_1 = 1,
	DEPT_STORE_SPOOK_1 = 2,
	ARMORED_FROG = 3,
	BAD_BUFFALO = 4,
	BLACK_ANTOID_1 = 5,
	RED_ANTOID = 6,
	RAMBLIN_EVIL_MUSHROOM = 7,
	STRUTTIN_EVIL_MUSHROOM_1 = 8,
	MOBILE_SPROUT = 9,
	TOUGH_MOBILE_SPROUT = 10,
	ENRAGED_FIRE_PLUG = 11,
	MYSTICAL_RECORD = 12,
	ATOMIC_POWER_ROBOT = 13,
	NUCLEAR_REACTOR_ROBOT = 14,
	GUARDIAN_HIEROGLYPH = 15,
	LETHAL_ASP_HIEROGLYPH = 16,
	ELECTRO_SWOOSH = 17,
	CONDUCTING_MENACE = 18,
	CONDUCTING_SPIRIT = 19,
	EVIL_ELEMENTAL = 20,
	YOUR_NIGHTMARE_1 = 21,
	ANNOYING_OLD_PARTY_MAN = 22,
	ANNOYING_REVELER = 23,
	UNASSUMING_LOCAL_GUY = 24,
	NEW_AGE_RETRO_HIPPIE = 25,
	MR_CARPAINTER_1 = 26,
	CARBON_DOG_1 = 27,
	MIGHTY_BEAR = 28,
	MIGHTY_BEAR_SEVEN = 29,
	PUTRID_MOLDYMAN = 30,
	THUNDER_MITE = 31,
	CRANKY_LADY = 32,
	EXTRA_CRANKY_LADY = 33,
	Giygas1 = 34,
	WETNOSAUR = 35,
	CHOMPOSAUR_1 = 36,
	TITANIC_ANT_1 = 37,
	GIGANTIC_ANT_1 = 38,
	SHROOOM_1 = 39,
	PLAGUE_RAT_OF_DOOM_1 = 40,
	MONDO_MOLE_1 = 41,
	GUARDIAN_DIGGER_1 = 42,
	SCALDING_COFFEE_CUP = 43,
	LOADED_DICE_1 = 44,
	SLIMY_LIL_PILE = 45,
	EVEN_SLIMIER_LITTLE_PILE = 46,
	ARACHNID = 47,
	ARACHNID2 = 48,
	KRAKEN_1 = 49,
	BIONIC_KRAKEN_1 = 50,
	SPINNING_ROBO = 51,
	WHIRLING_ROBO = 52,
	HYPER_SPINNING_ROBO = 53,
	COP = 54,
	COIL_SNAKE = 55,
	THIRSTY_COIL_SNAKE = 56,
	MR_BATTY = 57,
	ELDER_BATTY = 58,
	VIOLENT_ROACH = 59,
	FILTHY_ATTACK_ROACH = 60,
	CRAZED_SIGN = 61,
	WOOLY_SHAMBLER = 62,
	WILD_N_WOOLY_SHAMBLER = 63,
	SKATE_PUNK = 64,
	SKELPION = 65,
	DREAD_SKELPION = 66,
	STARMAN_1 = 67,
	STARMAN_SUPER_1 = 68,
	GHOST_OF_STARMAN_1 = 69,
	SMILIN_SPHERE = 70,
	UNCONTROLLABLE_SPHERE = 71,
	PETRIFIED_ROYAL_GUARD = 72,
	GUARDIAN_GENERAL_1 = 73,
	STARMAN_DELUXE_1 = 74,
	FINAL_STARMAN_1 = 75,
	URBAN_ZOMBIE_1 = 76,
	ZOMBIE_POSSESSOR = 77,
	ZOMBIE_DOG = 78,
	CROOKED_COP = 79,
	OVER_ZEALOUS_COP = 80,
	TERRITORIAL_OAK = 81,
	HOSTILE_ELDER_OAK = 82,
	DIAMOND_DOG_1 = 83,
	MARAUDER_OCTOBOT = 84,
	MILITARY_OCTOBOT = 85,
	MECHANICAL_OCTOBOT = 86,
	ULTIMATE_OCTOBOT = 87,
	MAD_DUCK = 88,
	DALIS_CLOCK = 89,
	TRILLIONAGE_SPROUT_1 = 90,
	MUSICA = 91,
	DESERT_WOLF = 92,
	MasterBelch1 = 93,
	BIG_PILE_OF_PUKE_1 = 94,
	MASTER_BARF_1 = 95,
	KISS_OF_DEATH = 96,
	FRENCH_KISS_OF_DEATH = 97,
	FOPPY_1 = 98,
	FOBBY = 99,
	ZAP_EEL = 100,
	TANGOO_1 = 101,
	BOOGEY_TENT_1 = 102,
	SQUATTER_DEMON_1 = 103,
	CRESTED_BOOKA = 104,
	GREAT_CRESTED_BOOKA = 105,
	LESSER_MOOK = 106,
	MOOK_SENIOR = 107,
	SMELLY_GHOST = 108,
	STINKY_GHOST = 109,
	EVERDRED_1 = 110,
	ATTACK_SLUG = 111,
	PIT_BULL_SLUG = 112,
	ROWDY_MOUSE = 113,
	DEADLY_MOUSE = 114,
	CARE_FREE_BOMB = 115,
	ELECTRO_SPECTER_1 = 116,
	HANDSOME_TOM = 117,
	SMILIN_SAM = 118,
	MANLY_FISH = 119,
	MANLY_FISHS_BROTHER = 120,
	RUNAWAY_DOG_1 = 121,
	TRICK_OR_TRICK_KID = 122,
	CAVE_BOY_1 = 123,
	ABSTRACT_ART = 124,
	SHATTERED_MAN = 125,
	FIERCE_SHATTERED_MAN = 126,
	EGO_ORB = 127,
	THUNDER_AND_STORM_1 = 128,
	YES_MAN_JUNIOR = 129,
	FRANKYSTEIN_MARK_II_1 = 130,
	FRANK = 131,
	CuteLilUFO = 132,
	BeautifulUFO = 133,
	POGO_PUNK = 134,
	TOUGH_GUY = 135,
	MAD_TAXI = 136,
	EVIL_MANI_MANI_1 = 137,
	MR_MOLECULE = 138,
	WORTHLESS_PROTOPLASM = 139,
	SENTRY_ROBOT = 140,
	HeavilyArmedPokey1 = 141,
	PSYCHIC_PSYCHO = 142,
	MAJOR_PSYCHIC_PSYCHO = 143,
	MOLE_PLAYING_ROUGH = 144,
	GRUFF_GOAT = 145,
	CLUMSY_ROBOT_1 = 146,
	SOUL_CONSUMING_FLAME = 147,
	DEMONIC_PETUNIA = 148,
	RANBOOB = 149,
	LIL_UFO = 150,
	HIGH_CLASS_UFO = 151,
	NOOSE_MAN = 152,
	ROBO_PUMP_1 = 153,
	PLAIN_CROCODILE = 154,
	STRONG_CROCODILE = 155,
	HARD_CROCODILE = 156,
	NO_GOOD_FLY = 157,
	MOSTLY_BAD_FLY = 158,
	SPITEFUL_CROW = 159,
	MyPet = 160,
	Pokey = 161,
	Picky = 162,
	Tony = 163,
	BubbleMonkey = 164,
	DungeonMan = 165,
	FlyingMan = 166,
	TeddyBear = 167,
	SuperPlushBear = 168,
	MasterBelch2 = 169,
	INSANE_CULTIST_2 = 170,
	DEPT_STORE_SPOOK_2 = 171,
	YOUR_NIGHTMARE_2 = 172,
	MR_CARPAINTER_2 = 173,
	CARBON_DOG_2 = 174,
	CHOMPOSAUR_2 = 175,
	TITANIC_ANT_2 = 176,
	GIGANTIC_ANT_2 = 177,
	SHROOOM_2 = 178,
	PLAGUE_RAT_OF_DOOM_2 = 179,
	MONDO_MOLE_2 = 180,
	GUARDIAN_DIGGER_2 = 181,
	KRAKEN_2 = 182,
	BIONIC_KRAKEN_2 = 183,
	STARMAN_2 = 184,
	STARMAN_SUPER_2 = 185,
	GHOST_OF_STARMAN_2 = 186,
	STARMAN_DELUXE_2 = 187,
	FINAL_STARMAN_2 = 188,
	URBAN_ZOMBIE_2 = 189,
	DIAMOND_DOG_2 = 190,
	TRILLIONAGE_SPROUT_2 = 191,
	MasterBelch3 = 192,
	BIG_PILE_OF_PUKE_2 = 193,
	MASTER_BARF_2 = 194,
	LOADED_DICE_2 = 195,
	TANGOO_2 = 196,
	BOOGEY_TENT_2 = 197,
	SQUATTER_DEMON_2 = 198,
	EVERDRED_2 = 199,
	ELECTRO_SPECTER_2 = 200,
	THUNDER_AND_STORM_2 = 201,
	FRANKYSTEIN_MARK_II_2 = 202,
	EVIL_MANI_MANI_2 = 203,
	HeavilyArmedPokey2 = 204,
	CLUMSY_ROBOT_2 = 205,
	ROBO_PUMP_2 = 206,
	FOPPY_2 = 207,
	GUARDIAN_GENERAL_2 = 208,
	BLACK_ANTOID_2 = 209,
	STRUTTIN_EVIL_MUSHROOM_2 = 210,
	RUNAWAY_DOG_2 = 211,
	CAVE_BOY_2 = 212,
	TinyLilGhost = 213,
	STARMAN_JR = 214,
	BuzzBuzz = 215,
	HeavilyArmedPokey3 = 216,
	HeavilyArmedPokey4 = 217,
	Giygas2 = 218,
	Giygas3 = 219,
	Giygas4 = 220,
	Giygas5 = 221,
	FARM_ZOMBIE = 222,
	CRIMINAL_CATERPILLAR = 223,
	EVIL_EYE = 224,
	MagicButterfly = 225,
	MINI_BARF = 226,
	MASTER_CRIMINAL_WORM = 227,
	CAPTAIN_STRONG = 228,
	Giygas6 = 229,
	CLUMSY_ROBOT_3 = 230,
}

enum BattleBGLayer : ushort{
	NONE = 0,
	UNKNOWN001 = 1,
	UNKNOWN002 = 2,
	UNKNOWN003 = 3,
	UNKNOWN004 = 4,
	UNKNOWN005 = 5,
	UNKNOWN006 = 6,
	UNKNOWN007 = 7,
	UNKNOWN008 = 8,
	UNKNOWN009 = 9,
	UNKNOWN010 = 10,
	UNKNOWN011 = 11,
	UNKNOWN012 = 12,
	UNKNOWN013 = 13,
	UNKNOWN014 = 14,
	UNKNOWN015 = 15,
	UNKNOWN016 = 16,
	UNKNOWN017 = 17,
	UNKNOWN018 = 18,
	UNKNOWN019 = 19,
	UNKNOWN020 = 20,
	UNKNOWN021 = 21,
	UNKNOWN022 = 22,
	UNKNOWN023 = 23,
	UNKNOWN024 = 24,
	UNKNOWN025 = 25,
	UNKNOWN026 = 26,
	UNKNOWN027 = 27,
	UNKNOWN028 = 28,
	UNKNOWN029 = 29,
	UNKNOWN030 = 30,
	UNKNOWN031 = 31,
	UNKNOWN032 = 32,
	UNKNOWN033 = 33,
	UNKNOWN034 = 34,
	UNKNOWN035 = 35,
	UNKNOWN036 = 36,
	UNKNOWN037 = 37,
	UNKNOWN038 = 38,
	UNKNOWN039 = 39,
	UNKNOWN040 = 40,
	UNKNOWN041 = 41,
	UNKNOWN042 = 42,
	UNKNOWN043 = 43,
	UNKNOWN044 = 44,
	UNKNOWN045 = 45,
	UNKNOWN046 = 46,
	UNKNOWN047 = 47,
	UNKNOWN048 = 48,
	UNKNOWN049 = 49,
	UNKNOWN050 = 50,
	UNKNOWN051 = 51,
	UNKNOWN052 = 52,
	UNKNOWN053 = 53,
	UNKNOWN054 = 54,
	UNKNOWN055 = 55,
	UNKNOWN056 = 56,
	UNKNOWN057 = 57,
	UNKNOWN058 = 58,
	UNKNOWN059 = 59,
	UNKNOWN060 = 60,
	UNKNOWN061 = 61,
	UNKNOWN062 = 62,
	UNKNOWN063 = 63,
	UNKNOWN064 = 64,
	UNKNOWN065 = 65,
	UNKNOWN066 = 66,
	UNKNOWN067 = 67,
	UNKNOWN068 = 68,
	UNKNOWN069 = 69,
	UNKNOWN070 = 70,
	UNKNOWN071 = 71,
	UNKNOWN072 = 72,
	UNKNOWN073 = 73,
	UNKNOWN074 = 74,
	UNKNOWN075 = 75,
	UNKNOWN076 = 76,
	UNKNOWN077 = 77,
	UNKNOWN078 = 78,
	UNKNOWN079 = 79,
	UNKNOWN080 = 80,
	UNKNOWN081 = 81,
	UNKNOWN082 = 82,
	UNKNOWN083 = 83,
	UNKNOWN084 = 84,
	UNKNOWN085 = 85,
	UNKNOWN086 = 86,
	UNKNOWN087 = 87,
	UNKNOWN088 = 88,
	UNKNOWN089 = 89,
	UNKNOWN090 = 90,
	UNKNOWN091 = 91,
	UNKNOWN092 = 92,
	UNKNOWN093 = 93,
	UNKNOWN094 = 94,
	UNKNOWN095 = 95,
	UNKNOWN096 = 96,
	UNKNOWN097 = 97,
	UNKNOWN098 = 98,
	UNKNOWN099 = 99,
	UNKNOWN100 = 100,
	UNKNOWN101 = 101,
	UNKNOWN102 = 102,
	UNKNOWN103 = 103,
	UNKNOWN104 = 104,
	UNKNOWN105 = 105,
	UNKNOWN106 = 106,
	UNKNOWN107 = 107,
	UNKNOWN108 = 108,
	UNKNOWN109 = 109,
	UNKNOWN110 = 110,
	UNKNOWN111 = 111,
	UNKNOWN112 = 112,
	UNKNOWN113 = 113,
	UNKNOWN114 = 114,
	UNKNOWN115 = 115,
	UNKNOWN116 = 116,
	UNKNOWN117 = 117,
	UNKNOWN118 = 118,
	UNKNOWN119 = 119,
	UNKNOWN120 = 120,
	UNKNOWN121 = 121,
	UNKNOWN122 = 122,
	UNKNOWN123 = 123,
	UNKNOWN124 = 124,
	UNKNOWN125 = 125,
	UNKNOWN126 = 126,
	UNKNOWN127 = 127,
	UNKNOWN128 = 128,
	UNKNOWN129 = 129,
	UNKNOWN130 = 130,
	UNKNOWN131 = 131,
	UNKNOWN132 = 132,
	UNKNOWN133 = 133,
	UNKNOWN134 = 134,
	UNKNOWN135 = 135,
	UNKNOWN136 = 136,
	UNKNOWN137 = 137,
	UNKNOWN138 = 138,
	UNKNOWN139 = 139,
	UNKNOWN140 = 140,
	UNKNOWN141 = 141,
	UNKNOWN142 = 142,
	UNKNOWN143 = 143,
	UNKNOWN144 = 144,
	UNKNOWN145 = 145,
	UNKNOWN146 = 146,
	UNKNOWN147 = 147,
	UNKNOWN148 = 148,
	UNKNOWN149 = 149,
	UNKNOWN150 = 150,
	UNKNOWN151 = 151,
	UNKNOWN152 = 152,
	UNKNOWN153 = 153,
	UNKNOWN154 = 154,
	UNKNOWN155 = 155,
	UNKNOWN156 = 156,
	UNKNOWN157 = 157,
	UNKNOWN158 = 158,
	UNKNOWN159 = 159,
	UNKNOWN160 = 160,
	UNKNOWN161 = 161,
	UNKNOWN162 = 162,
	UNKNOWN163 = 163,
	UNKNOWN164 = 164,
	UNKNOWN165 = 165,
	UNKNOWN166 = 166,
	UNKNOWN167 = 167,
	UNKNOWN168 = 168,
	UNKNOWN169 = 169,
	UNKNOWN170 = 170,
	UNKNOWN171 = 171,
	UNKNOWN172 = 172,
	UNKNOWN173 = 173,
	UNKNOWN174 = 174,
	UNKNOWN175 = 175,
	UNKNOWN176 = 176,
	UNKNOWN177 = 177,
	UNKNOWN178 = 178,
	UNKNOWN179 = 179,
	UNKNOWN180 = 180,
	UNKNOWN181 = 181,
	UNKNOWN182 = 182,
	UNKNOWN183 = 183,
	UNKNOWN184 = 184,
	UNKNOWN185 = 185,
	UNKNOWN186 = 186,
	UNKNOWN187 = 187,
	UNKNOWN188 = 188,
	UNKNOWN189 = 189,
	UNKNOWN190 = 190,
	UNKNOWN191 = 191,
	UNKNOWN192 = 192,
	UNKNOWN193 = 193,
	UNKNOWN194 = 194,
	UNKNOWN195 = 195,
	NUMBER3 = 196,
	UNKNOWN197 = 197,
	UNKNOWN198 = 198,
	UNKNOWN199 = 199,
	UNKNOWN200 = 200,
	UNKNOWN201 = 201,
	UNKNOWN202 = 202,
	UNKNOWN203 = 203,
	UNKNOWN204 = 204,
	UNKNOWN205 = 205,
	UNKNOWN206 = 206,
	UNKNOWN207 = 207,
	UNKNOWN208 = 208,
	UNKNOWN209 = 209,
	UNKNOWN210 = 210,
	UNKNOWN211 = 211,
	UNKNOWN212 = 212,
	UNKNOWN213 = 213,
	UNKNOWN214 = 214,
	UNKNOWN215 = 215,
	UNKNOWN216 = 216,
	UNKNOWN217 = 217,
	UNKNOWN218 = 218,
	UNKNOWN219 = 219,
	GIYGAS_DEVILSMACHINE = 220,
	GIYGAS_DEVILSMACHINE_OFF_CUTSCENE1 = 221,
	GIYGAS_DEVILSMACHINE_OFF_CUTSCENE2 = 222,
	GIYGAS_DEVILSMACHINE_OFF_1 = 223,
	GIYGAS_DEVILSMACHINE_OFF_2 = 224,
	GIYGAS_VULNERABLE = 225,
	GIYGAS_UNSTABLE_1 = 226,
	GIYGAS_UNSTABLE_2 = 227,
	SOUNDSTONE1 = 228,
	SOUNDSTONE2 = 229,
	FILE_SELECT = 230,
	Coffee1 = 231,
	Coffee2 = 232,
	Tea1 = 233,
	Tea2 = 234,
	UNKNOWN235 = 235,
	UNKNOWN236 = 236,
	UNKNOWN237 = 237,
	UNKNOWN238 = 238,
	UNKNOWN239 = 239,
	UNKNOWN240 = 240,
	UNKNOWN241 = 241,
	UNKNOWN242 = 242,
	UNKNOWN243 = 243,
	UNKNOWN244 = 244,
	UNKNOWN245 = 245,
	UNKNOWN246 = 246,
	UNKNOWN247 = 247,
	UNKNOWN248 = 248,
	UNKNOWN249 = 249,
	UNKNOWN250 = 250,
	UNKNOWN251 = 251,
	UNKNOWN252 = 252,
	UNKNOWN253 = 253,
	UNKNOWN254 = 254,
	MU_TRAINING = 255,
	UNKNOWN256 = 256,
	UNKNOWN257 = 257,
	UNKNOWN258 = 258,
	UNKNOWN259 = 259,
	UNKNOWN260 = 260,
	UNKNOWN261 = 261,
	UNKNOWN262 = 262,
	MAGIC_CAKE1 = 263,
	MAGIC_CAKE2 = 264,
	GIYGAS_UNUSED = 265,
	UNKNOWN266 = 266,
	UNKNOWN267 = 267,
	UNKNOWN268 = 268,
	UNKNOWN269 = 269,
	UNKNOWN270 = 270,
	UNKNOWN271 = 271,
	UNKNOWN272 = 272,
	UNKNOWN273 = 273,
	UNKNOWN274 = 274,
	UNKNOWN275 = 275,
	UNKNOWN276 = 276,
	UNKNOWN277 = 277,
	UNKNOWN278 = 278,
	UNKNOWN279 = 279,
	UNKNOWN280 = 280,
	UNKNOWN281 = 281,
	UNKNOWN282 = 282,
	UNKNOWN283 = 283,
	UNKNOWN284 = 284,
	UNKNOWN285 = 285,
	UNKNOWN286 = 286,
	UNKNOWN287 = 287,
	UNKNOWN288 = 288,
	UNKNOWN289 = 289,
	UNKNOWN290 = 290,
	UNKNOWN291 = 291,
	UNKNOWN292 = 292,
	UNKNOWN293 = 293,
	UNKNOWN294 = 294,
	UNKNOWN295 = 295,
	UNKNOWN296 = 296,
	UNKNOWN297 = 297,
	UNKNOWN298 = 298,
	UNKNOWN299 = 299,
	UNKNOWN300 = 300,
	UNKNOWN301 = 301,
	UNKNOWN302 = 302,
	UNKNOWN303 = 303,
	UNKNOWN304 = 304,
	UNKNOWN305 = 305,
	UNKNOWN306 = 306,
	UNKNOWN307 = 307,
	UNKNOWN308 = 308,
	UNKNOWN309 = 309,
	UNKNOWN310 = 310,
	UNKNOWN311 = 311,
	UNKNOWN312 = 312,
	UNKNOWN313 = 313,
	UNKNOWN314 = 314,
	UNKNOWN315 = 315,
	UNKNOWN316 = 316,
	UNKNOWN317 = 317,
	UNKNOWN318 = 318,
	UNKNOWN319 = 319,
	UNKNOWN320 = 320,
	UNKNOWN321 = 321,
	UNKNOWN322 = 322,
	UNKNOWN323 = 323,
	UNKNOWN324 = 324,
	UNKNOWN325 = 325,
	UNKNOWN326 = 326,
	UNKNOWN327 = 327,
	UNKNOWN328 = 328,
	UNKNOWN329 = 329,
}

enum Initiative {
	Normal = 0,
	PartyFirst = 1,
	EnemiesFirst = 2,
	RunningAway = 3,
	RunningAlwaysSuccessful = 4,
}

enum ActionDirection {
	Party = 0,
	Enemy = 1,
}
enum ActionType {
	Nothing = 0,
	Physical = 1,
	PiercingPhysical = 2,
	PSI = 3,
	Item = 4,
	Other = 5,
}
enum ActionTarget {
	None = 0,
	One = 1,
	Random = 2,
	Row = 3,
	All = 4,
}

enum NPCTargettability {
	Untargettable = 1,
	Forced = 6,
	Normal = 7,
}

enum BattleSpriteSize {
	_32X32 = 1,
	_64X32 = 2,
	_32X64 = 3,
	_64X64 = 4,
	_128X64 = 5,
	_128X128 = 6,
}


enum MapSectorConfig {
	UNKNOWN = 1<<6,
	CANNOT_TELEPORT = 1<<7,
}

enum MapSectorMiscConfig {
	NONE = 0,
	INDOOR_AREA = 1,
	EXIT_MOUSE_USABLE = 2,
	USE_MINI_SPRITES = 3,
	USE_MAGICANT_SPRITES = 4,
	USE_ROBOT_SPRITES = 5,
	FREQUENT_MAGIC_BUTTERFLIES = 6,
	FREQUENT_MAGIC_BUTTERFLIES2 = 7,
}

enum MapSectorTownMap {
	NONE = 0,
	ONETT = 1<<3,
	TWOSON = 2<<3,
	THREED = 3<<3,
	FOURSIDE = 4<<3,
	SCARABA = 5<<3,
	SUMMERS = 6<<3,
	NONE2 = 7<<3,
}

enum TownMap {
	ONETT,
	TWOSON,
	THREED,
	FOURSIDE,
	SCARABA,
	SUMMERS,
}

enum DoorType {
	Switch = 0,
	RopeLadder = 1,
	Door = 2,
	Escalator = 3,
	Stairway = 4,
	Object = 5,
	Person = 6,
	Type7 = 7,
}

enum PartyPSIFlags {
	TeleportAlpha = 1<<0,
	TeleportBeta = 1<<1,
	StarstormAlpha = 1<<2,
	StarstormBeta = 1<<3,
}

enum WarpStyle {
	INSTANT_PLUS_FADE = 0,
	STANDARD_DOOR = 1,
	STANDARD_DOOR_WHITE = 2,
	STANDARD_DOOR2 = 3,
	STANDARD_DOOR_WITH_SOUND = 4,
	HOLE = 5,
	STANDARD_DOOR3 = 6,
	STANDARD_DOOR_WITH_SOUND2 = 7,
	STANDARD_DOOR_WITH_SOUND3 = 8,
	STANDARD_DOOR_WITH_SOUND4 = 9,
	STANDARD_DOOR4 = 10,
	UNKNOWN = 11,
	STANDARD_DOOR5 = 12,
	STANDARD_DOOR6 = 13,
	STANDARD_DOOR_WHITE2 = 14,
	STANDARD_DOOR_WITH_UNKNOWN_SOUND = 15,
	PHASE_DISTORTER_III = 16,
	MOONSIDE1 = 17,
	MOONSIDE2 = 18,
	MOONSIDE3 = 19,
	MOONSIDE4 = 20,
	MOONSIDE5 = 21,
	MOONSIDE6 = 22,
	MOONSIDE7 = 23,
	MOONSIDE8 = 24,
	MOONSIDE9 = 25,
	MOONSIDE10 = 26,
	MOONSIDE11 = 27,
	STANDARD_DOOR7 = 28,
	STANDARD_DOOR_WHITE_SLOW = 29,
	STANDARD_DOOR_WHITE_SLOW_SOUND = 30,
	GHOST_TUNNEL = 31,
	GHOST_TUNNEL2 = 32,
	HOLE2 = 33,
}

enum SurfaceFlags {
	ObscureLowerBody = 1<<0,
	ObscureUpperBody = 1<<1,
	CausesSunstroke = 1<<2,
	ShallowWater = 1<<3,
	DeepWater = ShallowWater + CausesSunstroke,
	LadderOrStairs = 1<<4,
	Unknown1 = 1<<5,
	Unknown2 = 1<<6,
	Solid = 1<<7,
}

enum ShallowWaterSpeed = FixedPoint1616(0x8000, 0x0000); //0.5x
enum DeepWaterSpeed = FixedPoint1616(0x547A, 0x0000); //0.33x
enum SkipSandwichSpeed = FixedPoint1616(0x8000, 0x0001); //1.5x

enum CC1C01Type {
	string = 0,
	integer = 0x80,
}

enum SpritemapOrientation {
	Vertical = 0x8000,
	Horizontal = 0x4000,
}

enum PSILevel {
	Alpha = 1,
	Beta = 2,
	Gamma = 3,
	Sigma = 4,
	Omega = 5,
}

enum PSIID {
	Rockin = 1,
	Fire = 2,
	Freeze = 3,
	Thunder = 4,
	Flash = 5,
	Starstorm = 6,
	Lifeup = 7,
	Healing = 8,
	Shield = 9,
	PSIShield = 10,
	OffenseUp = 11,
	DefenseDown = 12,
	Hypnosis = 13,
	Magnet = 14,
	Paralysis = 15,
	Brainshock = 16,
	Teleport = 17,
}

enum PSICategory {
	Offense = 1,
	Recover = 2,
	Assist = 4,
	Other = 8,
}

enum PSITarget {
	Nobody = 1,
	Enemies = 2,
	Allies = 3,
}

enum PSITargetA {
	Single = 0,
	Row = 1,
	AllEnemies = 2,
	Random = 3,
}

enum ThingsToName {
	Char1 = 0,
	Char2 = 1,
	Char3 = 2,
	Char4 = 3,
	Dog = 4,
	FavoriteFood = 5,
	FavoriteThing = 6,
}

enum MainMenuOptions {
	TalkTo = 1,
	Goods = 2,
	PSI = 3,
	Equip = 4,
	Check = 5,
	Status = 6,
}

enum EnemyGroup {
	UNKNOWN_000 = 0,
	UNKNOWN_001 = 1,
	UNKNOWN_002 = 2,
	UNKNOWN_003 = 3,
	UNKNOWN_004 = 4,
	UNKNOWN_005 = 5,
	UNKNOWN_006 = 6,
	UNKNOWN_007 = 7,
	UNKNOWN_008 = 8,
	UNKNOWN_009 = 9,
	UNKNOWN_010 = 10,
	UNKNOWN_011 = 11,
	UNKNOWN_012 = 12,
	UNKNOWN_013 = 13,
	UNKNOWN_014 = 14,
	UNKNOWN_015 = 15,
	UNKNOWN_016 = 16,
	UNKNOWN_017 = 17,
	UNKNOWN_018 = 18,
	UNKNOWN_019 = 19,
	UNKNOWN_020 = 20,
	UNKNOWN_021 = 21,
	UNKNOWN_022 = 22,
	UNKNOWN_023 = 23,
	UNKNOWN_024 = 24,
	UNKNOWN_025 = 25,
	UNKNOWN_026 = 26,
	UNKNOWN_027 = 27,
	UNKNOWN_028 = 28,
	UNKNOWN_029 = 29,
	UNKNOWN_030 = 30,
	UNKNOWN_031 = 31,
	UNKNOWN_032 = 32,
	UNKNOWN_033 = 33,
	UNKNOWN_034 = 34,
	UNKNOWN_035 = 35,
	UNKNOWN_036 = 36,
	UNKNOWN_037 = 37,
	UNKNOWN_038 = 38,
	UNKNOWN_039 = 39,
	UNKNOWN_040 = 40,
	UNKNOWN_041 = 41,
	UNKNOWN_042 = 42,
	UNKNOWN_043 = 43,
	UNKNOWN_044 = 44,
	UNKNOWN_045 = 45,
	UNKNOWN_046 = 46,
	UNKNOWN_047 = 47,
	UNKNOWN_048 = 48,
	UNKNOWN_049 = 49,
	UNKNOWN_050 = 50,
	UNKNOWN_051 = 51,
	UNKNOWN_052 = 52,
	UNKNOWN_053 = 53,
	UNKNOWN_054 = 54,
	UNKNOWN_055 = 55,
	UNKNOWN_056 = 56,
	UNKNOWN_057 = 57,
	UNKNOWN_058 = 58,
	UNKNOWN_059 = 59,
	UNKNOWN_060 = 60,
	UNKNOWN_061 = 61,
	UNKNOWN_062 = 62,
	UNKNOWN_063 = 63,
	UNKNOWN_064 = 64,
	UNKNOWN_065 = 65,
	UNKNOWN_066 = 66,
	UNKNOWN_067 = 67,
	UNKNOWN_068 = 68,
	UNKNOWN_069 = 69,
	UNKNOWN_070 = 70,
	UNKNOWN_071 = 71,
	UNKNOWN_072 = 72,
	UNKNOWN_073 = 73,
	UNKNOWN_074 = 74,
	UNKNOWN_075 = 75,
	UNKNOWN_076 = 76,
	UNKNOWN_077 = 77,
	UNKNOWN_078 = 78,
	UNKNOWN_079 = 79,
	UNKNOWN_080 = 80,
	UNKNOWN_081 = 81,
	UNKNOWN_082 = 82,
	UNKNOWN_083 = 83,
	UNKNOWN_084 = 84,
	UNKNOWN_085 = 85,
	UNKNOWN_086 = 86,
	UNKNOWN_087 = 87,
	UNKNOWN_088 = 88,
	UNKNOWN_089 = 89,
	UNKNOWN_090 = 90,
	UNKNOWN_091 = 91,
	UNKNOWN_092 = 92,
	UNKNOWN_093 = 93,
	UNKNOWN_094 = 94,
	UNKNOWN_095 = 95,
	UNKNOWN_096 = 96,
	UNKNOWN_097 = 97,
	UNKNOWN_098 = 98,
	UNKNOWN_099 = 99,
	UNKNOWN_100 = 100,
	UNKNOWN_101 = 101,
	UNKNOWN_102 = 102,
	UNKNOWN_103 = 103,
	UNKNOWN_104 = 104,
	UNKNOWN_105 = 105,
	UNKNOWN_106 = 106,
	UNKNOWN_107 = 107,
	UNKNOWN_108 = 108,
	UNKNOWN_109 = 109,
	UNKNOWN_110 = 110,
	UNKNOWN_111 = 111,
	UNKNOWN_112 = 112,
	UNKNOWN_113 = 113,
	UNKNOWN_114 = 114,
	UNKNOWN_115 = 115,
	UNKNOWN_116 = 116,
	UNKNOWN_117 = 117,
	UNKNOWN_118 = 118,
	UNKNOWN_119 = 119,
	UNKNOWN_120 = 120,
	UNKNOWN_121 = 121,
	UNKNOWN_122 = 122,
	UNKNOWN_123 = 123,
	UNKNOWN_124 = 124,
	UNKNOWN_125 = 125,
	UNKNOWN_126 = 126,
	UNKNOWN_127 = 127,
	UNKNOWN_128 = 128,
	UNKNOWN_129 = 129,
	UNKNOWN_130 = 130,
	UNKNOWN_131 = 131,
	UNKNOWN_132 = 132,
	UNKNOWN_133 = 133,
	UNKNOWN_134 = 134,
	UNKNOWN_135 = 135,
	UNKNOWN_136 = 136,
	UNKNOWN_137 = 137,
	UNKNOWN_138 = 138,
	UNKNOWN_139 = 139,
	UNKNOWN_140 = 140,
	UNKNOWN_141 = 141,
	UNKNOWN_142 = 142,
	UNKNOWN_143 = 143,
	UNKNOWN_144 = 144,
	UNKNOWN_145 = 145,
	UNKNOWN_146 = 146,
	UNKNOWN_147 = 147,
	UNKNOWN_148 = 148,
	UNKNOWN_149 = 149,
	UNKNOWN_150 = 150,
	UNKNOWN_151 = 151,
	UNKNOWN_152 = 152,
	UNKNOWN_153 = 153,
	UNKNOWN_154 = 154,
	UNKNOWN_155 = 155,
	UNKNOWN_156 = 156,
	UNKNOWN_157 = 157,
	UNKNOWN_158 = 158,
	UNKNOWN_159 = 159,
	UNKNOWN_160 = 160,
	UNKNOWN_161 = 161,
	UNKNOWN_162 = 162,
	UNKNOWN_163 = 163,
	UNKNOWN_164 = 164,
	UNKNOWN_165 = 165,
	UNKNOWN_166 = 166,
	UNKNOWN_167 = 167,
	UNKNOWN_168 = 168,
	UNKNOWN_169 = 169,
	UNKNOWN_170 = 170,
	UNKNOWN_171 = 171,
	UNKNOWN_172 = 172,
	UNKNOWN_173 = 173,
	UNKNOWN_174 = 174,
	UNKNOWN_175 = 175,
	UNKNOWN_176 = 176,
	UNKNOWN_177 = 177,
	UNKNOWN_178 = 178,
	UNKNOWN_179 = 179,
	UNKNOWN_180 = 180,
	UNKNOWN_181 = 181,
	UNKNOWN_182 = 182,
	UNKNOWN_183 = 183,
	UNKNOWN_184 = 184,
	UNKNOWN_185 = 185,
	UNKNOWN_186 = 186,
	UNKNOWN_187 = 187,
	UNKNOWN_188 = 188,
	UNKNOWN_189 = 189,
	UNKNOWN_190 = 190,
	UNKNOWN_191 = 191,
	UNKNOWN_192 = 192,
	UNKNOWN_193 = 193,
	UNKNOWN_194 = 194,
	UNKNOWN_195 = 195,
	UNKNOWN_196 = 196,
	UNKNOWN_197 = 197,
	UNKNOWN_198 = 198,
	UNKNOWN_199 = 199,
	UNKNOWN_200 = 200,
	UNKNOWN_201 = 201,
	UNKNOWN_202 = 202,
	UNKNOWN_203 = 203,
	UNKNOWN_204 = 204,
	UNKNOWN_205 = 205,
	UNKNOWN_206 = 206,
	UNKNOWN_207 = 207,
	UNKNOWN_208 = 208,
	UNKNOWN_209 = 209,
	UNKNOWN_210 = 210,
	UNKNOWN_211 = 211,
	UNKNOWN_212 = 212,
	UNKNOWN_213 = 213,
	UNKNOWN_214 = 214,
	UNKNOWN_215 = 215,
	UNKNOWN_216 = 216,
	UNKNOWN_217 = 217,
	UNKNOWN_218 = 218,
	UNKNOWN_219 = 219,
	UNKNOWN_220 = 220,
	UNKNOWN_221 = 221,
	UNKNOWN_222 = 222,
	UNKNOWN_223 = 223,
	UNKNOWN_224 = 224,
	UNKNOWN_225 = 225,
	UNKNOWN_226 = 226,
	UNKNOWN_227 = 227,
	UNKNOWN_228 = 228,
	UNKNOWN_229 = 229,
	UNKNOWN_230 = 230,
	UNKNOWN_231 = 231,
	UNKNOWN_232 = 232,
	UNKNOWN_233 = 233,
	UNKNOWN_234 = 234,
	UNKNOWN_235 = 235,
	UNKNOWN_236 = 236,
	UNKNOWN_237 = 237,
	UNKNOWN_238 = 238,
	UNKNOWN_239 = 239,
	UNKNOWN_240 = 240,
	UNKNOWN_241 = 241,
	UNKNOWN_242 = 242,
	UNKNOWN_243 = 243,
	UNKNOWN_244 = 244,
	UNKNOWN_245 = 245,
	UNKNOWN_246 = 246,
	UNKNOWN_247 = 247,
	UNKNOWN_248 = 248,
	UNKNOWN_249 = 249,
	UNKNOWN_250 = 250,
	UNKNOWN_251 = 251,
	UNKNOWN_252 = 252,
	UNKNOWN_253 = 253,
	UNKNOWN_254 = 254,
	UNKNOWN_255 = 255,
	UNKNOWN_256 = 256,
	UNKNOWN_257 = 257,
	UNKNOWN_258 = 258,
	UNKNOWN_259 = 259,
	UNKNOWN_260 = 260,
	UNKNOWN_261 = 261,
	UNKNOWN_262 = 262,
	UNKNOWN_263 = 263,
	UNKNOWN_264 = 264,
	UNKNOWN_265 = 265,
	UNKNOWN_266 = 266,
	UNKNOWN_267 = 267,
	UNKNOWN_268 = 268,
	UNKNOWN_269 = 269,
	UNKNOWN_270 = 270,
	UNKNOWN_271 = 271,
	UNKNOWN_272 = 272,
	UNKNOWN_273 = 273,
	UNKNOWN_274 = 274,
	UNKNOWN_275 = 275,
	UNKNOWN_276 = 276,
	UNKNOWN_277 = 277,
	UNKNOWN_278 = 278,
	UNKNOWN_279 = 279,
	UNKNOWN_280 = 280,
	UNKNOWN_281 = 281,
	UNKNOWN_282 = 282,
	UNKNOWN_283 = 283,
	UNKNOWN_284 = 284,
	UNKNOWN_285 = 285,
	UNKNOWN_286 = 286,
	UNKNOWN_287 = 287,
	UNKNOWN_288 = 288,
	UNKNOWN_289 = 289,
	UNKNOWN_290 = 290,
	UNKNOWN_291 = 291,
	UNKNOWN_292 = 292,
	UNKNOWN_293 = 293,
	UNKNOWN_294 = 294,
	UNKNOWN_295 = 295,
	UNKNOWN_296 = 296,
	UNKNOWN_297 = 297,
	UNKNOWN_298 = 298,
	UNKNOWN_299 = 299,
	UNKNOWN_300 = 300,
	UNKNOWN_301 = 301,
	UNKNOWN_302 = 302,
	UNKNOWN_303 = 303,
	UNKNOWN_304 = 304,
	UNKNOWN_305 = 305,
	UNKNOWN_306 = 306,
	UNKNOWN_307 = 307,
	UNKNOWN_308 = 308,
	UNKNOWN_309 = 309,
	UNKNOWN_310 = 310,
	UNKNOWN_311 = 311,
	UNKNOWN_312 = 312,
	UNKNOWN_313 = 313,
	UNKNOWN_314 = 314,
	UNKNOWN_315 = 315,
	UNKNOWN_316 = 316,
	UNKNOWN_317 = 317,
	UNKNOWN_318 = 318,
	UNKNOWN_319 = 319,
	UNKNOWN_320 = 320,
	UNKNOWN_321 = 321,
	UNKNOWN_322 = 322,
	UNKNOWN_323 = 323,
	UNKNOWN_324 = 324,
	UNKNOWN_325 = 325,
	UNKNOWN_326 = 326,
	UNKNOWN_327 = 327,
	UNKNOWN_328 = 328,
	UNKNOWN_329 = 329,
	UNKNOWN_330 = 330,
	UNKNOWN_331 = 331,
	UNKNOWN_332 = 332,
	UNKNOWN_333 = 333,
	UNKNOWN_334 = 334,
	UNKNOWN_335 = 335,
	UNKNOWN_336 = 336,
	UNKNOWN_337 = 337,
	UNKNOWN_338 = 338,
	UNKNOWN_339 = 339,
	UNKNOWN_340 = 340,
	UNKNOWN_341 = 341,
	UNKNOWN_342 = 342,
	UNKNOWN_343 = 343,
	UNKNOWN_344 = 344,
	UNKNOWN_345 = 345,
	UNKNOWN_346 = 346,
	UNKNOWN_347 = 347,
	UNKNOWN_348 = 348,
	UNKNOWN_349 = 349,
	UNKNOWN_350 = 350,
	UNKNOWN_351 = 351,
	UNKNOWN_352 = 352,
	UNKNOWN_353 = 353,
	UNKNOWN_354 = 354,
	UNKNOWN_355 = 355,
	UNKNOWN_356 = 356,
	UNKNOWN_357 = 357,
	UNKNOWN_358 = 358,
	UNKNOWN_359 = 359,
	UNKNOWN_360 = 360,
	UNKNOWN_361 = 361,
	UNKNOWN_362 = 362,
	UNKNOWN_363 = 363,
	UNKNOWN_364 = 364,
	UNKNOWN_365 = 365,
	UNKNOWN_366 = 366,
	UNKNOWN_367 = 367,
	UNKNOWN_368 = 368,
	UNKNOWN_369 = 369,
	UNKNOWN_370 = 370,
	UNKNOWN_371 = 371,
	UNKNOWN_372 = 372,
	UNKNOWN_373 = 373,
	UNKNOWN_374 = 374,
	UNKNOWN_375 = 375,
	UNKNOWN_376 = 376,
	UNKNOWN_377 = 377,
	UNKNOWN_378 = 378,
	UNKNOWN_379 = 379,
	UNKNOWN_380 = 380,
	UNKNOWN_381 = 381,
	UNKNOWN_382 = 382,
	UNKNOWN_383 = 383,
	UNKNOWN_384 = 384,
	UNKNOWN_385 = 385,
	UNKNOWN_386 = 386,
	UNKNOWN_387 = 387,
	UNKNOWN_388 = 388,
	UNKNOWN_389 = 389,
	UNKNOWN_390 = 390,
	UNKNOWN_391 = 391,
	UNKNOWN_392 = 392,
	UNKNOWN_393 = 393,
	UNKNOWN_394 = 394,
	UNKNOWN_395 = 395,
	UNKNOWN_396 = 396,
	UNKNOWN_397 = 397,
	UNKNOWN_398 = 398,
	UNKNOWN_399 = 399,
	UNKNOWN_400 = 400,
	UNKNOWN_401 = 401,
	UNKNOWN_402 = 402,
	UNKNOWN_403 = 403,
	UNKNOWN_404 = 404,
	UNKNOWN_405 = 405,
	UNKNOWN_406 = 406,
	UNKNOWN_407 = 407,
	UNKNOWN_408 = 408,
	UNKNOWN_409 = 409,
	UNKNOWN_410 = 410,
	UNKNOWN_411 = 411,
	UNKNOWN_412 = 412,
	UNKNOWN_413 = 413,
	UNKNOWN_414 = 414,
	UNKNOWN_415 = 415,
	UNKNOWN_416 = 416,
	UNKNOWN_417 = 417,
	UNKNOWN_418 = 418,
	UNKNOWN_419 = 419,
	UNKNOWN_420 = 420,
	UNKNOWN_421 = 421,
	UNKNOWN_422 = 422,
	UNKNOWN_423 = 423,
	UNKNOWN_424 = 424,
	UNKNOWN_425 = 425,
	UNKNOWN_426 = 426,
	UNKNOWN_427 = 427,
	UNKNOWN_428 = 428,
	UNKNOWN_429 = 429,
	UNKNOWN_430 = 430,
	UNKNOWN_431 = 431,
	UNKNOWN_432 = 432,
	UNKNOWN_433 = 433,
	UNKNOWN_434 = 434,
	UNKNOWN_435 = 435,
	UNKNOWN_436 = 436,
	UNKNOWN_437 = 437,
	UNKNOWN_438 = 438,
	UNKNOWN_439 = 439,
	UNKNOWN_440 = 440,
	UNKNOWN_441 = 441,
	UNKNOWN_442 = 442,
	UNKNOWN_443 = 443,
	UNKNOWN_444 = 444,
	UNKNOWN_445 = 445,
	UNKNOWN_446 = 446,
	UNKNOWN_447 = 447,
	BOSS_FRANK = 448,
	UNKNOWN_449 = 449,
	UNKNOWN_450 = 450,
	UNKNOWN_451 = 451,
	UNKNOWN_452 = 452,
	UNKNOWN_453 = 453,
	UNKNOWN_454 = 454,
	UNKNOWN_455 = 455,
	UNKNOWN_456 = 456,
	UNKNOWN_457 = 457,
	UNKNOWN_458 = 458,
	UNKNOWN_459 = 459,
	UNKNOWN_460 = 460,
	UNKNOWN_461 = 461,
	UNKNOWN_462 = 462,
	UNKNOWN_463 = 463,
	UNKNOWN_464 = 464,
	UNKNOWN_465 = 465,
	UNKNOWN_466 = 466,
	UNKNOWN_467 = 467,
	UNKNOWN_468 = 468,
	UNKNOWN_469 = 469,
	UNKNOWN_470 = 470,
	UNKNOWN_471 = 471,
	UNKNOWN_472 = 472,
	UNKNOWN_473 = 473,
	UNKNOWN_474 = 474,
	UNKNOWN_475 = 475,
	BOSS_GIYGAS_PHASE_1 = 476,
	BOSS_GIYGAS_PHASE_2 = 477,
	BOSS_GIYGAS_PHASE_DURING_PRAYER_1 = 478,
	BOSS_GIYGAS_PHASE_AFTER_PRAYER_1 = 479,
	BOSS_GIYGAS_PHASE_AFTER_PRAYER_7 = 480,
	UNKNOWN_481 = 481,
	UNKNOWN_482 = 482,
	BOSS_GIYGAS_PHASE_FINAL = 483,
}

enum PSIAnimationTarget {
	Single = 0,
	Row = 1,
	AllEnemies = 2,
	Random = 3,
}

enum BGLayer {
	Layer1 = 1,
	Layer2 = 2,
	Layer3 = 3,
	Layer4 = 4,
}

enum DistortionStyle {
	None = 0,
	HorizontalSmooth = 1,
	HorizontalInterlaced = 2,
	VerticalSmooth = 3,
	Unknown = 4,
}

enum ActionScriptVars : ubyte {
	V0 = 0,
	V1 = 1,
	V2 = 2,
	V3 = 3,
	V4 = 4,
	V5 = 5,
	V6 = 6,
	V7 = 7,
}

enum Binop : ubyte {
	and = 0,
	or = 1,
	add = 2,
	xor = 3,
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
	ubyte[2] partyNPCs;
	ushort[2] partyNPCHP;
	ubyte partyStatus;
	ubyte partyNPC1Copy;
	ubyte partyNPC2Copy;
	ushort partyNPC1HPCopy;
	ushort partyNPC2HPCopy;
	uint walletBackup;
	ubyte[36] escargoExpressItems;
	ubyte[6] partyMembers;
	FixedPoint1616 leaderX;
	FixedPoint1616 leaderY;
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
	ushort unknownB4;
	ubyte[3] unknownB6;
	ubyte[3] unknownB8;
	ubyte autoFightEnable;
	ushort exitMouseXCoordinate;
	ushort exitMouseYCoordinate;
	ubyte textSpeed;
	ubyte soundSetting;
	ubyte unknownC3;
	uint unknownC4;
	ubyte[2] unknownC8;
	ubyte[2] unknownCA;
	const(ubyte)*[2] unknownCC;
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
	ushort maxHP;
	ushort maxPP;
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
	ubyte fireResist;
	ubyte freezeResist;
	ubyte flashResist;
	ubyte paralysisResist;
	ubyte hypnosisBrainshockResist;
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
	short next; // [00]
	short prev; // [02]
	short window_id; // [04]
	short x; // [06]
	short y; // [08]
	short width; // [0A]
	short height; // [0C]
	short text_x; // [0E]
	short text_y; // [10]
	ubyte num_padding; // [12]
	ushort tileAttributes; // [13]
	short font; // [15]
	WorkingMemory result; // [17]
	uint argument; // [1B]
	ushort counter; // [1F]
	WorkingMemory result_bak; // [21]
	uint argument_bak; // [25]
	ushort counter_bak; // [29]
	short current_option; // [2B]
	short option_count; // [2D]
	short selected_option; // [2F]
	short menu_columns; // [31]
	short menu_page; // [33]
	ushort* tilemapBuffer; // [35] 16-bit pointer
	void function(short) menu_callback; // [37] 32-bit pointer
	ubyte title_id; // [3B]
	ubyte[32] title; // [3C]
}

struct MenuOpt {
	short field00; // [00]
	short next; // [02]
	short prev; // [04]
	short page; // [06]
	short text_x; // [08]
	short text_y; // [0A]
	short userdata; // [0C]
	ubyte sfx; // [0E]
	const(ubyte)* script; // [0F] 32-bit pointer
	ubyte[25] label; // [13]
	ubyte pixel_align; // [2C]
}

struct VecYX {
	short y;
	short x;
}

struct Pather {
	short from_offscreen; // [00] Starts off-screen flag
	VecYX hitbox; // [02] ??? some sort of hitbox??? (Old notes, I have no idea why I labeled this "hitbox")
	VecYX origin; // [06] Origin point in the collision map?
	short field0A; // [0A] ??? unknown index
	VecYX* points; // [0C] Goal points
	short point_count; // [0E] Amount of goal points
	short obj_index; // [10] Object index
}

struct PathCtx {
	ubyte[120] unknown0; //unused??
	VecYX radius; // [78] Pathfinder radius
	VecYX[8] targets_pos; // [7C] Positions for all targets (row, col)
	short target_count; // [9C] Amount of targets
	short pather_count; // [9E] Amount of pathers
	Pather[8] pathers; // [A0] Data for all pathers
}

struct PlayerPositionBufferEntry {
	short x_coord;
	short y_coord;
	short tile_flags;
	short walking_style;
	short direction;
	short unknown10;
}

struct MovementSpeeds {
	union {
		struct {
			FixedPoint1616 up; //0
			FixedPoint1616 upRight; //4
			FixedPoint1616 right; //8
			FixedPoint1616 downRight; //12
			FixedPoint1616 down; //16
			FixedPoint1616 downLeft; //20
			FixedPoint1616 left; //24
			FixedPoint1616 upLeft; //28
		}
		FixedPoint1616[8] directionSpeeds;
	}
}

union QueuedInteractionPtr {
	const(ubyte)* text_ptr;
	const(DoorEntryA)* door_ptr;
}

struct QueuedInteraction {
	ushort type; //0
	QueuedInteractionPtr ptr; //2
}

struct SpriteGrouping {
	ubyte height;
	ubyte width;
	ubyte unknown2;
	ubyte unknown3;
	ubyte unknown4;
	ubyte unknown5;
	ubyte unknown6;
	ubyte unknown7;
	ubyte spriteBank;
	OverworldSpriteGraphics[] sprites;
}

struct OverworldSpriteGraphics {
	const(ubyte)[] data;
	ubyte lsb;
}

struct Battler {
	short id; //0
	ubyte sprite; //2
	ubyte unknown3; //3
	ushort currentAction; //4
	ubyte actionOrderVar; //6
	ubyte unknown7; //7
	ubyte currentActionArgument; //8
	ubyte unknown9; //9
	ubyte currentTarget; //10
	ubyte theFlag; //11
	ubyte consciousness; //12
	ubyte hasTakenTurn; //13
	ubyte allyOrEnemy; //14
	ubyte npcID; //15
	ubyte row; //16
	ushort hp; //17
	ushort hpTarget; //19
	ushort hpMax; //21
	ushort pp; //23
	ushort ppTarget; //25
	ushort ppMax; //27
	ubyte[AFFLICTION_GROUP_COUNT] afflictions; //29
	ubyte guarding; //36
	ubyte shieldHP; //37
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
	uint exp;
	ubyte vramSpriteIndex;
	ubyte spriteX;
	ubyte spriteY;
	ubyte initiative;
	ubyte unknown71;
	ubyte unknown72;
	ubyte unknown73;
	ubyte unknown74;
	ubyte unknown75;
	ubyte unknown76;
	ubyte id2;
}

struct TextWindowPropertiesEntry {
	ushort offset;
	ubyte unknown;
}

align(1) struct RGB {
	align(1):
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
		ushort fraction;
		short integer;
	}
	uint combined;
}

struct OverworldTask {
	ushort framesLeft;
	void function() func;
}

struct TimedDelivery {
	ushort spriteID; //0
	ushort eventFlag; //2
	short unknown4; //4
	short unknown6; //6
	ushort deliveryTime; //8
	const(ubyte)[] textPointer1; //10
	const(ubyte)[] textPointer2; //13
	short unknown18; //16
	short unknown20; //18
}

union ItemParameters {
	byte[4] raw;
	struct {
		byte strength;
		byte epi;
		ubyte ep;
		ubyte special;
	}
}

struct Item {
	ubyte[25] name;
	ubyte type;
	ushort cost;
	ubyte flags;
	ushort battleAction;
	ItemParameters parameters;
	const(ubyte)[] helpText;
	this(ubyte[25] name, ubyte type, ushort cost, ubyte flags, ushort battleAction, byte parameter1, byte parameter2, ubyte parameter3, ubyte parameter4, const(ubyte)[] helpText ) {
		this.name = name;
		this.type = type;
		this.cost = cost;
		this.flags = flags;
		this.battleAction = battleAction;
		this.parameters.strength = parameter1;
		this.parameters.epi = parameter2;
		this.parameters.ep = parameter3;
		this.parameters.special = parameter4;
		this.helpText = helpText;
	}
}

struct CondimentTableEntry {
	ubyte item;
	ubyte[2] goodCondiments;
	ItemParameters parameters;
	this(ubyte item, ubyte[2] goodCondiments, byte parameter1, byte parameter2, ubyte parameter3, ubyte parameter4 ) {
		this.item = item;
		this.goodCondiments = goodCondiments;
		this.parameters.strength = parameter1;
		this.parameters.epi = parameter2;
		this.parameters.ep = parameter3;
		this.parameters.special = parameter4;
	}
}

struct WindowTextAttributesCopy {
	short id;
	short text_x;
	short text_y;
	ubyte number_padding;
	short curr_tile_attributes;
	short font;
	ubyte[10] unknown11;
}

struct DMAQueueEntry {
	ubyte mode;
	ushort size;
	const(void)* source;
	ushort destination;
}

struct DMATableEntry {
	ubyte unknown0;
	ubyte unknown1;
	ubyte unknown2;
}

struct HDMATableEntry {
	ubyte count;
	const(ubyte)* ptr;
}

struct SRAM {
	SaveBlock[6] saves;
	ubyte[0x1FE] unknown;
	ushort signature;
}

struct SaveBlock {
	char[28] signature;
	ushort checksum;
	ushort checksumComplement;
	union {
		SaveData saveData;
		ubyte[SaveData.sizeof] rawData;
	}
}

struct SaveData {
	Game_State gameState;
	PartyCharacter[6] partyCharacters;
	ubyte[EVENT_FLAG_COUNT / 8] eventFlags;
}

struct SaveDataReplay {
	Game_State gameState;
	PartyCharacter[6] partyCharacters;
	ubyte[EVENT_FLAG_COUNT / 8] eventFlags;
	uint timer;
}

struct FontConfig {
	immutable(ubyte)[] data;
	immutable(ubyte)[] graphics;
	ushort height;
	ushort width;
}

struct MusicDataset {
	ubyte primarySamplePack;
	ubyte secondarySamplePack;
	ubyte sequencePack;
}

struct MusicPackPointer {
	//ubyte bank;
	const(ubyte)* addr;
}

struct NPC {
	ubyte type;
	ushort sprite;
	ubyte direction;
	ushort actionScript;
	ushort eventFlag;
	ubyte appearanceStyle;
	const(ubyte)[] talkText;
	union {
		const(ubyte)[] checkText;
		uint item;
		ubyte[4] somethingElse;
	}
	this(ubyte t, ushort s, ubyte d, ushort as, ushort ef, ubyte ast, const(ubyte)[] tt, const(ubyte)[] ct) {
		type = t;
		sprite = s;
		direction = d;
		actionScript = as;
		eventFlag = ef;
		appearanceStyle = ast;
		talkText = tt;
		checkText = ct;
	}
	this(ubyte t, ushort s, ubyte d, ushort as, ushort ef, ubyte ast, const(ubyte)[] tt, ubyte[4] se) {
		type = t;
		sprite = s;
		direction = d;
		actionScript = ast;
		eventFlag = ef;
		appearanceStyle = ast;
		talkText = tt;
		somethingElse = se;
	}
}

struct UnknownC42B0DEntry {
	ubyte unknown0;
	ubyte unknown1;
	UnknownC42B0DSubEntry[2][] unknown2;
}
struct UnknownC42B0DSubEntry {
	ubyte unknown0;
	ubyte unknown1;
	ubyte unknown2;
	ubyte unknown3;
	ubyte unknown4;
}


struct CharacterInitialEntityDataEntry {
	ushort overworldSprite;
	ushort lostUnderworldSprite;
	ushort actionScript;
	ushort unknown6;
}

struct AnimatedBackground {
	ubyte graphics;
	ubyte palette;
	ubyte bitsPerPixel;
	ubyte paletteShiftingStyle;
	ubyte paletteCycle1First;
	ubyte paletteCycle1Last;
	ubyte paletteCycle2First;
	ubyte paletteCycle2Last;
	ubyte paletteChangeSpeed;
	ubyte[4] scrollingMovements;
	ubyte[4] distortionStyles;
}

struct LoadedBackgroundData {
	ubyte TargetLayer; //0
	ubyte Bitdepth; //1
	ubyte Unknown2; //2
	ubyte PaletteShiftingStyle; //3
	ubyte PaletteCycle1First; //4
	ubyte PaletteCycle1Last; //5
	ubyte PaletteCycle2First; //6
	ubyte PaletteCycle2Last; //7
	ubyte PaletteCycle1Step; //8
	ubyte PaletteCycle2Step; //9
	ubyte PaletteChangeSpeed; //10
	ubyte PaletteChangeDurationLeft; //11
	ushort[16] Palette; //12
	ushort[16] Palette2; //44
	ushort[16]* PalettePointer; //76
	ubyte[4] ScrollingMovements; //78
	ubyte CurrentScrollingMovement; //82
	short ScrollingDurationLeft; //83
	short HorizontalPosition; //85
	short VerticalPosition; //87
	short HorizontalVelocity; //89
	short VerticalVelocity; //91
	short HorizontalAcceleration; //93
	short VerticalAcceleration; //95
	ubyte[4] DistortionStyles; //97
	ubyte Unknown101; //101
	short DistortionDurationLeft; //102
	ubyte DistortionType; //104
	short DistortionRippleFrequency; //105
	short DistortionRippleAmplitude; //107
	ubyte DistortionSpeed; //109
	short DistortionCompressionRate; //110
	short DistortionRippleFrequencyAcceleration; //112
	short DistortionRippleAmplitudeAcceleration; //114
	ubyte DistortionSpeedAcceleration; //116
	short DistortionCompressionAcceleration; //117
}

struct HDMAWordTransfer {
	ubyte scanlines;
	ushort value;
}

struct BattleEntryPointer {
	BattleGroupEnemy[] enemies;
	ushort runAwayFlag;
	ubyte runAwayFlagState;
	LetterboxStyle letterboxStyle;
}

struct OverworldEventMusic {
	ushort flag;
	ubyte music;
	ubyte unknown3;
}

struct TownMapIconPlacement {
	ubyte unknown0;
	ubyte unknown1;
	ubyte unknown2;
	ushort eventFlag;
}

struct SpriteMap {
	ubyte unknown0;
	union {
		ushort unknown1;
		SpriteMap* unknown1ptr;
		struct {
			ubyte unknown10;
			ubyte unknown11;
		}
	}
	ubyte unknown3;
	ubyte unknown4;
	this (ubyte u0, ushort u1, ubyte u3, ubyte u4) {
		unknown0 = u0;
		unknown1 = u1;
		unknown3 = u3;
		unknown4 = u4;
	}
}

struct TownMapData {
	ubyte unknown0;
	ubyte unknown1;
	ubyte unknown2;
}

struct Unknown7EAECCEntry {
	ubyte unknown0;
	ubyte unknown1;
	ushort unknown2;
	ushort unknown4;
	ushort unknown6;
	ushort unknown8;
	ushort unknown10;
	ushort unknown12;
	ushort unknown14;
	ushort unknown16;
	ushort unknown18;
	ushort unknown20;
}

struct BattleEntryBGEntry {
	ushort layer1;
	ushort layer2;
}

struct Enemy {
	ubyte theFlag; //0
	ubyte[25] name; //1
	Gender gender;//26
	EnemyType type; //27
	ushort battleSprite; //28
	ushort overworldSprite; //30
	ubyte runFlag; //32
	ushort hp; //33
	ushort pp; //35
	uint exp; //37
	ushort money; //41
	ushort eventScript; //43
	const(ubyte)[] encounterTextPointer; //45
	const(ubyte)[] deathTextPointer; //49
	ubyte battleSpritePalette; //53
	ubyte level; //54
	ubyte music; //55
	ushort offense; //56
	ushort defense; //58
	ubyte speed; //60
	ubyte guts; //61
	ubyte luck; //62
	ubyte fireResist; //63
	ubyte freezeResist; //64
	ubyte flashResist; //65
	ubyte paralysisResist; //66
	ubyte hypnosisBrainshockResist; //67
	ubyte missRate; //68
	ubyte actionOrder; //69
	ushort[4] actions; //70
	ushort finalAction; //78
	ubyte[4] actionArgs; //80
	ubyte finalActionArgument; //84
	ubyte iq; //85
	ubyte boss; //86
	ubyte itemDropRate; //87
	ubyte itemDropped; //88
	ubyte initialStatus; //89
	ubyte deathType; //90
	ubyte row; //91
	ubyte maxCalled; //92
	ubyte mirrorSuccess; //93
}

struct BattleAction {
	ubyte direction; // 0
	ubyte target; // 1
	ubyte type; // 2
	ubyte ppCost; // 3
	const(ubyte)[] text; // 4
	void function() func; // 8
}

struct UnknownA97D {
	ubyte unknown0;
	ubyte unknown1;
	short unknown2;
	ubyte unknown4;
	ubyte unknown5;
}

struct NPCAI {
	ubyte targettability;
	ubyte enemyID;
}

struct ConsolationPrize {
	ubyte enemy;
	ubyte[8] items;
}

struct FinalGiygasPrayerNoiseEntry {
	ubyte sfx;
	ubyte duration;
}

struct BattleGroupEnemy {
	ubyte count;
	ushort enemyID;
}

struct BattleSpritePointer {
	immutable(ubyte)[] sprite;
	ubyte size;
}

struct PSITeleportDestination {
	ubyte[25] name;
	ushort eventFlag;
	ushort x;
	ushort y;
}

struct WindowConfig {
	ushort x;
	ushort y;
	ushort width;
	ushort height;
}

struct DisplayTextState {
	const(ubyte)* textptr; //0
	ushort unknown4; //4
	WindowTextAttributesCopy savedTextAttributes; //6
}

struct DoorEntryA {
	const(ubyte)[] textPtr; // 0
	ushort eventFlag; // 4
	ushort unknown6; // 6
	ushort unknown8; // 8
	ubyte unknown10; // 10
}

struct DoorEntryB {
	ushort eventFlag;
	const(ubyte)[] textPtr;
}

struct DoorEntryC {
	const(ubyte)[] textPtr;
}

struct SectorDoors {
	ushort length;
	const(DoorConfig)[] doors;
}

union DoorPtr {
	immutable(DoorEntryA)* entryA;
	immutable(DoorEntryB)* entryB;
	immutable(DoorEntryC)* entryC;
	ushort unknown3;
}

struct DoorConfig {
	ubyte unknown0;
	ubyte unknown1;
	ubyte type;
	DoorPtr doorPtr;
	this(ubyte u0, ubyte u1, ubyte t, immutable(DoorEntryA)* a) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
		doorPtr.entryA = a;
	}
	this(ubyte u0, ubyte u1, ubyte t, immutable(DoorEntryB)* b) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
		doorPtr.entryB = b;
	}
	this(ubyte u0, ubyte u1, ubyte t, immutable(DoorEntryC)* c) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
		doorPtr.entryC = c;
	}
	this(ubyte u0, ubyte u1, ubyte t, ushort u3) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
		doorPtr.unknown3 = u3;
	}
	this(ubyte u0, ubyte u1, ubyte t, typeof(null)) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
	}
}

struct ScreenTransitionConfig {
	ubyte duration; //0
	ubyte animationID; //1
	ubyte animationFlags; //2
	ubyte fadeStyle; //3
	ubyte direction; //4
	ubyte unknown5; //5
	ubyte slideSpeed; //6
	ubyte startSoundEffect; //7
	ubyte secondaryDuration; //8
	ubyte secondaryAnimationID; //9
	ubyte secondaryAnimationFlags; //10
	ubyte endingSoundEffect; //11
}

struct Unknown7E5E06Entry {
	ushort unknown0; //0
	ushort unknown2; //2
}

struct TeleportDestination {
	short x; //0
	short y; //2
	ubyte direction; //4
	ubyte screenTransition; //5
	ushort unknown6; //6
}

struct UnknownC08F98Entry {
	ushort unknown0; //0
	ushort unknown2; //2
	ushort unknown4; //4
}

struct OverlayScript {
	ushort command;
	union {
		ushort frames;
		const(OverlayScript)* dest;
		const(SpriteMap)* spriteMap;
	}
	static typeof(this) jump(const(OverlayScript)* dest) {
		auto result = typeof(this)(1);
		result.dest = dest;
		return result;
	}
	static typeof(this) delay(ushort frames) {
		auto result = typeof(this)(2);
		result.frames = frames;
		return result;
	}
	static typeof(this) show(const(SpriteMap)* spriteMap) {
		auto result = typeof(this)(3);
		result.spriteMap = spriteMap;
		return result;
	}
}

struct TilesetAnimation {
	ubyte count;
	AnimatedTiles[] animations;
}

struct AnimatedTiles {
	ubyte unknown0;
	ubyte frameDelay;
	ushort copySize;
	ushort sourceOffset;
	ushort destinationAddress;
}

struct LoadedAnimatedTiles {
	short unknown0; //0
	short frameDelay; //2
	short copySize; //4
	short sourceOffset; //6
	short destinationAddress; //8
	short framesUntilUpdate; //10
	short destinationAddress2; //12
	short sourceOffset2; //14
}

struct MapDataPaletteAnimationPointer {
	ubyte[] ptr;
	ubyte count;
	ubyte[] entries;
}

struct LoadedOverworldPaletteAnimation {
	ushort timer; //0
	ushort index; //2
	ushort[9] delays; //4
}

struct MapTileEvent {
	ushort eventFlag;
	ushort count;
	MapTilePair[] tiles;
}

struct MapTilePair {
	ushort tile1;
	ushort tile2;
}

struct CreditsPhotograph {
	ushort eventFlag; //0
	short mapX; //2
	short mapY; //4
	ushort creditsMapPalettesOffset; //6
	byte slideDirection; //8
	byte slideDistance; //9
	short photographerX; //10
	short photographerY; //12
	Coordinates[6] party_config; //14
	PhotographerConfigEntryObject[4] objectConfig; //38
}

struct Coordinates {
	short x;
	short y;
}

struct PhotographerConfigEntryObject {
	short tileX;//0
	short tileY;//2
	ushort sprite; //4
}

union CCArgStorage {
	ubyte[10] raw;
}

union WorkingMemory {
	uint integer;
	void* pointer;
}

struct CC1C01Entry {
	ubyte size;
	void* address;
}

struct EntityOverlaySprite {
	ushort spriteID;
	byte unknown2;
	byte unknown3;
}

struct CastSequenceFormattingEntry {
	ushort unknown0;
	ubyte unknown2;
}

struct Unknown7E5156CreditsEntry {
	ubyte unknown0;
	ushort unknown1;
	const(ubyte)* unknown3;
	ushort unknown7;
}

struct Unknown7EAEFCEntry {
	short unknown0;
	short unknown2;
	short unknown4;
}

struct TelephoneContact {
	ubyte[25] title;
	ushort eventFlag;
	const(ubyte)[] text;
}

struct PSIAbility {
	ubyte name; //0
	ubyte level; //1
	ubyte type; //2
	ubyte target; //3
	short battleAction; //4
	ubyte nessLevel; //6
	ubyte paulaLevel; //7
	ubyte pooLevel; //8
	ubyte menuX; //9
	ubyte menuY; //10
	const(ubyte)[] text; //11
}

struct Unknown7E5E3CEntry {
	short unknown0;
	short unknown2;
	short unknown4;
	short unknown6;
	short unknown8;
	const(ubyte)* unknown10;
}

struct FloatingSpriteTableEntry {
	short sprite;
	ubyte unknown2;
	ubyte unknown3;
	ubyte unknown4;
}

struct Unknown7EB4AAEntry {
	short unknown0;
	short unknown2;
	short unknown4;
	short unknown6;
	short unknown8;
	short unknown10;
	short unknown12;
	short unknown14;
	short unknown16;
	short unknown18;
}

struct SpritePlacementEntry {
	ushort entries;
	SpritePlacement[] spritePlacements;
}

struct SpritePlacement {
	short unknown0;
	ubyte unknown2;
	ubyte unknown3;
}

struct StatsGrowth {
	ubyte offense;
	ubyte defense;
	ubyte speed;
	ubyte guts;
	ubyte vitality;
	ubyte iq;
	ubyte luck;
}

struct CharacterInitialStats {
	short unknown0;
	short unknown2;
	short money;
	short level;
	short exp;
	ubyte[10] items;
}

struct NamingScreenEntity {
	ushort sprite;
	ushort script;
}

struct FileSelectSummarySpriteConfigEntry {
	short sprite;
	short script;
	short x;
	short y;
}

struct ActionLoopCallState {
	const(ubyte)* pc;
	ubyte counter;
}

struct Unknown7EB37EStruct {
	short unknown0;
	short unknown2;
	short unknown4;
	short unknown6;
	short unknown8;
	short unknown10;
	short unknown12;
}

struct Hotspot {
	short unknown0;
	short unknown2;
	short unknown4;
	short unknown6;
}

struct CommandWindowSpacing {
	ubyte unknown0;
	ubyte unknown1;
}

struct EnemyPlacementGroups {
	ushort eventFlag;
	ubyte unknown2;
	ubyte unknown3;
	EnemyPlacementGroup[] groups;
}

struct EnemyPlacementGroup {
	ubyte unknown0;
	short groupID;
}

struct PSIAnimation {
	immutable(ubyte)[] graphics;
	ubyte frameDuration;
	ubyte paletteDuration;
	ubyte unknown4;
	ubyte unknown5;
	ubyte totalFrames;
	ubyte target;
	ubyte enemyColourChangeDelay;
	ubyte enemyColourChangeDuration;
	ushort enemyColour;
}

struct BackgroundScrollingEntry {
	short duration;
	short horizontalVelocity;
	short verticalVelocity;
	short horizontalAcceleration;
	short verticalAcceleration;
}

struct BackgroundDistortionEntry {
	short duration;
	ubyte style;
	short rippleFrequency;
	short rippleAmplitude;
	ubyte speed;
	short compressionRate;
	short rippleFrequencyAcceleration;
	short rippleAmplitudeAcceleration;
	ubyte speedAcceleration;
	short compressionRateAcceleration;
}

union Unknown7E0028Union {
	short word;
	struct {
		ubyte a;
		ubyte b;
	}
}

struct AnimationSequence {
	immutable(ubyte)[] ptr;
	ushort unknown4;
	ubyte unknown6;
	ubyte unknown7;
}

struct UnknownC4DE78Entry {
	short unknown0;
	short unknown2;
}

union Unknown7EF000Stuff {
	struct {
		ushort[16][16] Unknown7EF000;
		PathCtx Unknown7EF200;
		ubyte[0xC00] Unknown7EF400;
	}
	ushort[0x400] Unknown7EF000Alt;
}


//helper funcs not in the original game

ubyte[length] EBString(size_t length)(string str) {
	ubyte[length] result = 0;
	size_t idx;
	foreach (dchar c; str) {
		result[idx++] = EBChar(c);
	}
	return result;
}

ubyte[] EBString(string str) {
	ubyte[] result = new ubyte[](str.length);
	size_t idx;
	foreach (dchar c; str) {
		result[idx++] = EBChar(c);
	}
	return result;
}

ubyte[] EBStringz(string str) {
	ubyte[] result = new ubyte[](str.length + 1);
	size_t idx;
	foreach (dchar c; str) {
		result[idx++] = EBChar(c);
	}
	result[$ - 1] = 0;
	return result;
}

static assert(EBString!4("Null") == [0x7E, 0xA5, 0x9C, 0x9C]);

ubyte EBChar(dchar c) {
	import std.conv : text;
	import std.utf : toUTF8;
	switch (c) {
		case 0: .. case 0x1F: return cast(ubyte)c;
		case ' ':
		case '!':
		case '$':
		case '(':
		case ')':
		case '\'':
		case ',':
		case '-':
		case '.':
		case '0': .. case '9':
		case 'A': .. case 'Z':
		case 'a': .. case 'z': return cast(ubyte)(c + 0x30);
		case '{': return 0x53;
		case '/': return 0x5F;
		case ':': return 0x6A;
		case '?': return 0x6F;
		case '@': return 0x70;
		case '~': return 0x8B;
		case '^': return 0x8C;
		case '[': return 0x8D;
		case ']': return 0x8E;
		case '#': return 0x8F;
		case '_': return 0x90;
		case '♪': return 0xAC;
		case 'α': return 0x2A;
		case 'β': return 0x2B;
		case 'γ': return 0x2C;
		case 'Σ': return 0x2D;
		case 'Ω': return 0x2E;
		case 'ー': return 0x25;
		case 'あ': return 0x60;
		case 'ぁ': return 0x61;
		case 'か': return 0x62;
		case 'が': return 0x63;
		case 'さ': return 0x64;
		case 'ざ': return 0x65;
		case 'た': return 0x66;
		case 'だ': return 0x67;
		case 'な': return 0x68;
		case 'は': return 0x69;
		case 'ば': return 0x6A;
		case 'ぱ': return 0x6B;
		case 'ま': return 0x6C;
		case 'や': return 0x6D;
		case 'ゃ': return 0x6E;
		case 'ら': return 0x6F;
		case 'い': return 0x70;
		case 'ぃ': return 0x71;
		case 'き': return 0x72;
		case 'ぎ': return 0x73;
		case 'し': return 0x74;
		case 'じ': return 0x75;
		case 'ち': return 0x76;
		case 'ぢ': return 0x77;
		case 'に': return 0x78;
		case 'ひ': return 0x79;
		case 'び': return 0x7A;
		case 'ぴ': return 0x7B;
		case 'み': return 0x7C;
		case 'わ': return 0x7D;
		case 'っ': return 0x7E;
		case 'り': return 0x7F;
		case 'う': return 0x80;
		case 'ぅ': return 0x81;
		case 'く': return 0x82;
		case 'ぐ': return 0x83;
		case 'す': return 0x84;
		case 'ず': return 0x85;
		case 'つ': return 0x86;
		case 'づ': return 0x87;
		case 'ぬ': return 0x88;
		case 'ふ': return 0x89;
		case 'ぶ': return 0x8A;
		case 'ぷ': return 0x8B;
		case 'む': return 0x8C;
		case 'ゆ': return 0x8D;
		case 'ゅ': return 0x8E;
		case 'る': return 0x8F;
		case 'え': return 0x90;
		case 'ぇ': return 0x91;
		case 'け': return 0x92;
		case 'げ': return 0x93;
		case 'せ': return 0x94;
		case 'ぜ': return 0x95;
		case 'て': return 0x96;
		case 'で': return 0x97;
		case 'ね': return 0x98;
		case 'へ': return 0x99;
		case 'べ': return 0x9A;
		case 'ぺ': return 0x9B;
		case 'め': return 0x9C;
		case 'ん': return 0x9D;
		case 'を': return 0x9E;
		case 'れ': return 0x9F;
		case 'お': return 0xA0;
		case 'ぉ': return 0xA1;
		case 'こ': return 0xA2;
		case 'ご': return 0xA3;
		case 'そ': return 0xA4;
		case 'ぞ': return 0xA5;
		case 'と': return 0xA6;
		case 'ど': return 0xA7;
		case 'の': return 0xA8;
		case 'ほ': return 0xA9;
		case 'ぼ': return 0xAA;
		case 'ぽ': return 0xAB;
		case 'も': return 0xAC;
		case 'よ': return 0xAD;
		case 'ょ': return 0xAE;
		case 'ろ': return 0xAF;
		case 'ア': return 0xB0;
		case 'ァ': return 0xB1;
		case 'カ': return 0xB2;
		case 'ガ': return 0xB3;
		case 'サ': return 0xB4;
		case 'ザ': return 0xB5;
		case 'タ': return 0xB6;
		case 'ダ': return 0xB7;
		case 'ナ': return 0xB8;
		case 'ハ': return 0xB9;
		case 'バ': return 0xBA;
		case 'パ': return 0xBB;
		case 'マ': return 0xBC;
		case 'ヤ': return 0xBD;
		case 'ャ': return 0xBE;
		case 'ラ': return 0xBF;
		case 'イ': return 0xC0;
		case 'ィ': return 0xC1;
		case 'キ': return 0xC2;
		case 'ギ': return 0xC3;
		case 'シ': return 0xC4;
		case 'ジ': return 0xC5;
		case 'チ': return 0xC6;
		case 'ヂ': return 0xC7;
		case 'ニ': return 0xC8;
		case 'ヒ': return 0xC9;
		case 'ビ': return 0xCA;
		case 'ピ': return 0xCB;
		case 'ミ': return 0xCC;
		case 'ワ': return 0xCD;
		case 'ッ': return 0xCE;
		case 'リ': return 0xCF;
		case 'ウ': return 0xD0;
		case 'ゥ': return 0xD1;
		case 'ク': return 0xD2;
		case 'グ': return 0xD3;
		case 'ス': return 0xD4;
		case 'ズ': return 0xD5;
		case 'ツ': return 0xD6;
		case 'ヅ': return 0xD7;
		case 'ヌ': return 0xD8;
		case 'フ': return 0xD9;
		case 'ブ': return 0xDA;
		case 'プ': return 0xDB;
		case 'ム': return 0xDC;
		case 'ユ': return 0xDD;
		case 'ュ': return 0xDE;
		case 'ル': return 0xDF;
		case 'エ': return 0xE0;
		case 'ェ': return 0xE1;
		case 'ケ': return 0xE2;
		case 'ゲ': return 0xE3;
		case 'セ': return 0xE4;
		case 'ゼ': return 0xE5;
		case 'テ': return 0xE6;
		case 'デ': return 0xE7;
		case 'ネ': return 0xE8;
		case 'ヘ': return 0xE9;
		case 'ベ': return 0xEA;
		case 'ペ': return 0xEB;
		case 'メ': return 0xEC;
		case 'ン': return 0xED;
		case 'レ': return 0xEF;
		case 'オ': return 0xF0;
		case 'ォ': return 0xF1;
		case 'コ': return 0xF2;
		case 'ゴ': return 0xF3;
		case 'ソ': return 0xF4;
		case 'ゾ': return 0xF5;
		case 'ト': return 0xF6;
		case 'ド': return 0xF7;
		case 'ノ': return 0xF8;
		case 'ホ': return 0xF9;
		case 'ボ': return 0xFA;
		case 'ポ': return 0xFB;
		case 'モ': return 0xFC;
		case 'ヨ': return 0xFD;
		case 'ョ': return 0xFE;
		case 'ロ': return 0xFF;
		default: assert(0, ("unhandled character: '"d ~ c ~ "'"d).toUTF8);
	}
}

T[] convert(T)(const(ubyte)[] input) {
	T[] output;
	foreach (idx; 0 .. input.length / T.sizeof) {
		T val;
		static foreach (i; 0 .. T.sizeof) {
			val += input[idx + i] << (i * 8);
		}
		output ~= val;
	}
	return output;
}

ushort SectorAttributes(ubyte a, ubyte b) {
	return cast(short)(a + (b << 8));
}

T ROR(T)(T val, ref bool carry) {
	bool LSB = val & (1 << 0);
	val >>= 1;
	val |= (cast(T)carry << ((T.sizeof * 8) - 1));
	carry = LSB;
	return val;
}

T ROL(T)(T val, ref bool carry) {
	bool MSB = !!(val & (1 << ((T.sizeof * 8) - 1)));
	val <<= 1;
	val |= carry;
	carry = MSB;
	return val;
}

void XBA(T)(ref T val) {
	val = cast(T)((val >> 8) | (val << 8));
}

const(ubyte)[] paletteOffsetToPointer(ushort offset) {
	import std.range : enumerate, slide;
	import earthbound.bank2F : MapPalettePointerTable;
	static immutable ushort[] offsetList = [
		0x7CA7,
		0x7FA7,
		0x81E7,
		0x84E7,
		0x8667,
		0x87E7,
		0x8AE7,
		0x9027,
		0x90E7,
		0x9267,
		0x96E7,
		0x9CE7,
		0xA2E7,
		0xA8E7,
		0xABE7,
		0xB1E7,
		0xB7E7,
		0xBAE7,
		0xC0E7,
		0xC1A7,
		0xC6E7,
		0xCCE7,
		0xD0A7,
		0xD467,
		0xD767,
		0xDB27,
		0xE127,
		0xE5A7,
		0xE967,
		0xEDE7,
		0xF267,
		0xF4A7,
	];
	assert(offset >= offsetList[0], "Invalid palette offset?");
	foreach (idx, pair; offsetList.slide(2).enumerate) {
		if ((offset >= pair[0]) && (offset < pair[1])) {
			const subOffset = (offset - pair[0]) / 0xC0;
			return MapPalettePointerTable[idx][subOffset * 0xC0 .. (subOffset + 1) * 0xC0];
		}
	}
	const subOffset = (offset - offsetList[$ - 1]) / 0xC0;
	return MapPalettePointerTable[$ - 1][subOffset * 0xC0 .. (subOffset + 1) * 0xC0];
}

size_t DecompBlock(const(ubyte)* cdata, ubyte* buffer, int maxlen) {
	import core.stdc.string: memcpy, memset;
	ubyte* bpos = buffer;
	ubyte* bpos2;
	ubyte tmp;

	while(*cdata != 0xFF) {
		int cmdtype = *cdata >> 5;
		int len = (*cdata & 0x1F) + 1;
		if(cmdtype == 7) {
			cmdtype = (*cdata & 0x1C) >> 2;
			len = ((*cdata & 3) << 8) + *(cdata + 1) + 1;
			cdata++;
		}
		if(bpos + len > &buffer[maxlen]) return -1;
		cdata++;
		if(cmdtype >= 4) {
			bpos2 = &buffer[(*cdata << 8) + *(cdata + 1)];
			if(bpos2 >= &buffer[maxlen]) return -1;
			cdata += 2;
		}
		switch(cmdtype) {
			case 0:
				memcpy(bpos, cdata, len);
				cdata += len;
				bpos += len;
				break;
			case 1:
				memset(bpos, *cdata++, len);
				bpos += len;
				break;
			case 2:
				if(bpos + 2 * len > &buffer[maxlen]) return -1;
				while(len--) {
					*cast(short *)bpos = *cast(short *)cdata;
					bpos += 2;
				}
				cdata += 2;
				break;
			case 3:
				tmp = *cdata++;
				while(len--) *bpos++ = tmp++;
				break;
			case 4:
				if(bpos2 + len > &buffer[maxlen]) return -1;
				memcpy(bpos, bpos2, len);
				bpos += len;
				break;
			case 5:
				if(bpos2 + len > &buffer[maxlen]) return -1;
				while(len--) {
					tmp = *bpos2++;
					/* reverse the bits */
					tmp = ((tmp >> 1) & 0x55) | ((tmp << 1) & 0xAA);
					tmp = ((tmp >> 2) & 0x33) | ((tmp << 2) & 0xCC);
					tmp = ((tmp >> 4) & 0x0F) | ((tmp << 4) & 0xF0);
					*bpos++ = tmp;
				}
				break;
			case 6:
				if(bpos2 - len + 1 < buffer) return -1;
				while(len--) *bpos++ = *bpos2--;
				break;
			case 7:
				return -1;
			default: assert(0);
		}
	}
	return bpos - buffer;
}

ubyte[] allBytes(T...)(T args) {
    struct X {
        T stuff;
    }
    union Z {
        X x;
        ubyte[X.sizeof] bytes;
    }
    return Z(X(args)).bytes.dup;
}

ubyte[] actionCommand(T...)(ubyte command, T args) {
	return allBytes(command, args);
}

ubyte[] EVENT_END() {
	return actionCommand(0x00);
}

ubyte[] EVENT_LOOP(ubyte count) {
	return actionCommand(0x01, count);
}

ubyte[] EVENT_LOOP_END() {
	return actionCommand(0x02);
}

ubyte[] EVENT_LONGJUMP(const void* ptr) {
	return actionCommand(0x03, ptr);
}

ubyte[] EVENT_LONGCALL(const void* ptr) {
	return actionCommand(0x04, ptr);
}

ubyte[] EVENT_LONG_RETURN() {
	return actionCommand(0x05);
}

ubyte[] EVENT_PAUSE(ubyte duration) {
	return actionCommand(0x06, duration);
}

ubyte[] EVENT_START_TASK(const void* ptr) {
	return actionCommand(0x07, ptr);
}

ubyte[] EVENT_SET_TICK_CALLBACK(void function() ptr) {
	return actionCommand(0x08, ptr);
}

ubyte[] EVENT_HALT() {
	return actionCommand(0x09);
}

ubyte[] EVENT_SHORTCALL_CONDITIONAL(const(void)* ptr) {
	return actionCommand(0x0A, ptr);
}

ubyte[] EVENT_SHORTCALL_CONDITIONAL_NOT(const(void)* ptr) {
	return actionCommand(0x0B, ptr);
}

ubyte[] EVENT_END_TASK() {
	return actionCommand(0x0C);
}

ubyte[] EVENT_SET_VAR(ubyte var, ushort val) {
	return actionCommand(0x0E, var, val);
}

ubyte[] EVENT_CLEAR_TICK_CALLBACK() {
	return actionCommand(0x0F);
}

ubyte[] EVENT_SWITCH_JUMP_TEMPVAR(T...)(T ptrs) {
	return actionCommand(0x10, cast(ubyte)ptrs.length, ptrs);
}

ubyte[] EVENT_SWITCH_CALL_TEMPVAR(T...)(T ptrs) {
	return actionCommand(0x11, cast(ubyte)ptrs.length, ptrs);
}

ubyte[] EVENT_WRITE_BYTE_WRAM(void* ptr, ubyte val) {
	return actionCommand(0x12, ptr, val);
}

ubyte[] EVENT_END_LAST_TASK() {
	return actionCommand(0x13);
}

ubyte[] EVENT_BINOP(ubyte var, ubyte op, ushort value) {
	return actionCommand(0x14, var, op, value);
}

ubyte[] EVENT_AND(ubyte var, short value) {
	return EVENT_BINOP(var, 0, value);
}

ubyte[] EVENT_OR(ubyte var, short value) {
	return EVENT_BINOP(var, 1, value);
}

ubyte[] EVENT_ADD(ubyte var, short value) {
	return EVENT_BINOP(var, 2, value);
}

ubyte[] EVENT_XOR(ubyte var, short value) {
	return EVENT_BINOP(var, 3, value);
}

ubyte[] EVENT_WRITE_WORD_WRAM(void* ptr, short val) {
	return actionCommand(0x15, ptr, val);
}

ubyte[] EVENT_WRITE_DWORD_WRAM(void* ptr, uint val) {
	return actionCommand(0x15, ptr, cast(short)val) ~ actionCommand(0x15, ptr + 2, cast(short)(val >> 16));
}

ubyte[] EVENT_WRITE_DWORD_WRAM(void* ptr, void* val) {
	ubyte[] result;
	static foreach (i; 0 .. size_t.sizeof / 2) {
		result ~= actionCommand(0x15, ptr + i * 2, cast(short)((cast(size_t)val) >> 16 * i));
	}
	return result;
}

ubyte[] EVENT_BREAK_IF_FALSE(const(ubyte)* ptr) {
	return actionCommand(0x16, ptr);
}

ubyte[] EVENT_BREAK_IF_TRUE(const(ubyte)* ptr) {
	return actionCommand(0x17, ptr);
}

ubyte[] EVENT_BINOP_WRAM(void* ptr, ubyte op, ubyte val) {
	return actionCommand(0x18, ptr, op, val);
}

ubyte[] EVENT_AND_WRAM(void* ptr, ubyte val) {
	return EVENT_BINOP_WRAM(ptr, 0, val);
}

ubyte[] EVENT_OR_WRAM(void* ptr, ubyte val) {
	return EVENT_BINOP_WRAM(ptr, 1, val);
}

ubyte[] EVENT_ADD_WRAM(void* ptr, ubyte val) {
	return EVENT_BINOP_WRAM(ptr, 2, val);
}

ubyte[] EVENT_XOR_WRAM(void* ptr, ubyte val) {
	return EVENT_BINOP_WRAM(ptr, 3, val);
}

ubyte[] EVENT_SHORTJUMP(const void* ptr) {
	return actionCommand(0x19, ptr);
}

ubyte[] EVENT_SHORTCALL(const void* ptr) {
	return actionCommand(0x1A, ptr);
}

ubyte[] EVENT_SHORT_RETURN() {
	return actionCommand(0x1B);
}

ubyte[] EVENT_SET_ANIMATION_POINTER(const(SpriteMap)* ptr) {
	return actionCommand(0x1C, ptr);
}

ubyte[] EVENT_WRITE_WORD_TEMPVAR(short var) {
	return actionCommand(0x1D, var);
}

ubyte[] EVENT_WRITE_WRAM_TEMPVAR(short* var) {
	return actionCommand(0x1E, var);
}

ubyte[] EVENT_WRITE_TEMPVAR_TO_VAR(ubyte var) {
	return actionCommand(0x1F, var);
}

ubyte[] EVENT_WRITE_VAR_TO_TEMPVAR(ubyte var) {
	return actionCommand(0x20, var);
}

ubyte[] EVENT_WRITE_VAR_TO_WAIT_TIMER(ubyte var) {
	return actionCommand(0x21, var);
}

ubyte[] EVENT_SET_DRAW_CALLBACK(void function(short, short) ptr) {
	return actionCommand(0x22, ptr);
}

ubyte[] EVENT_SET_POSITION_CHANGE_CALLBACK(void function() ptr) {
	return actionCommand(0x23, ptr);
}

ubyte[] EVENT_LOOP_TEMPVAR() {
	return actionCommand(0x24);
}

ubyte[] EVENT_SET_PHYSICS_CALLBACK(void function() func) {
	return actionCommand(0x25, func);
}

ubyte[] EVENT_SET_ANIMATION_FRAME_VAR(ubyte id) {
	return actionCommand(0x26, id);
}

ubyte[] EVENT_BINOP_TEMPVAR(ubyte op, short val) {
	return actionCommand(0x27, op, val);
}

ubyte[] EVENT_AND_TEMPVAR(short id) {
	return EVENT_BINOP_TEMPVAR(0, id);
}

ubyte[] EVENT_OR_TEMPVAR(short id) {
	return EVENT_BINOP_TEMPVAR(1, id);
}

ubyte[] EVENT_ADD_TEMPVAR(short id) {
	return EVENT_BINOP_TEMPVAR(2, id);
}

ubyte[] EVENT_XOR_TEMPVAR(short id) {
	return EVENT_BINOP_TEMPVAR(3, id);
}

ubyte[] EVENT_SET_X(short id) {
	return actionCommand(0x28, id);
}

ubyte[] EVENT_SET_Y(short id) {
	return actionCommand(0x29, id);
}

ubyte[] EVENT_SET_Z(short id) {
	return actionCommand(0x2A, id);
}

ubyte[] EVENT_SET_X_RELATIVE(short id) {
	return actionCommand(0x2B, id);
}

ubyte[] EVENT_SET_Y_RELATIVE(short id) {
	return actionCommand(0x2C, id);
}

ubyte[] EVENT_SET_Z_RELATIVE(short id) {
	return actionCommand(0x2D, id);
}

ubyte[] EVENT_SET_X_VELOCITY_RELATIVE(short id) {
	return actionCommand(0x2E, id);
}

ubyte[] EVENT_SET_Y_VELOCITY_RELATIVE(short id) {
	return actionCommand(0x2F, id);
}

ubyte[] EVENT_SET_Z_VELOCITY_RELATIVE(short id) {
	return actionCommand(0x30, id);
}

ubyte[] EVENT_SET_VELOCITIES_ZERO() {
	return actionCommand(0x39);
}

ubyte[] EVENT_SET_ANIMATION(ubyte id) {
	return actionCommand(0x3B, id);
}

ubyte[] EVENT_NEXT_ANIMATION_FRAME() {
	return actionCommand(0x3C);
}

ubyte[] EVENT_PREV_ANIMATION_FRAME() {
	return actionCommand(0x3D);
}

ubyte[] EVENT_SKIP_N_ANIMATION_FRAMES(ubyte frames) {
	return actionCommand(0x3E, frames);
}

ubyte[] EVENT_SET_X_VELOCITY(short velocity) {
	return actionCommand(0x3F, velocity);
}

ubyte[] EVENT_SET_Y_VELOCITY(short velocity) {
	return actionCommand(0x40, velocity);
}

ubyte[] EVENT_SET_Z_VELOCITY(short velocity) {
	return actionCommand(0x41, velocity);
}

ubyte[] EVENT_CALLROUTINE(T...)(short function(short, ref const(ubyte)*) ptr, T args) {
	return actionCommand(0x42, ptr, args);
}

ubyte[] EVENT_EX_CALLROUTINE(T...)(ubyte ex, short function(short, ref const(ubyte)*) ptr, T args) {
	return actionCommand(cast(ubyte)(0xF0 + ex), ptr, args);
}

ubyte[] EVENT_SET_PRIORITY(ubyte priority) {
	return actionCommand(0x43, priority);
}

ubyte[] EVENT_WRITE_TEMPVAR_WAITTIMER() {
	return actionCommand(0x44);
}

extern(C) __gshared string[] rt_options = ["oncycle=ignore"];

short fixArgs(alias Func)(short a, ref const(ubyte)* b) {
	import std.traits : Parameters, ReturnType;
	static if (is(ReturnType!Func : short) && (Parameters!Func.length > 1)) {
		return Func(a, b);
	} else static if (Parameters!Func.length > 1) {
		Func(a, b);
		return 0;
	} else static if (is(ReturnType!Func : short) && (Parameters!Func.length > 0)) {
		return Func(a);
	} else static if (is(ReturnType!Func : short)) {
		return Func();
	} else static if (Parameters!Func.length > 0) {
		Func(a);
		return 0;
	} else {
		Func();
		return 0;
	}
}
