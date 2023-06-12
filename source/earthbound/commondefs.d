/// Misc definitions
module earthbound.commondefs;

enum maxEntities = 30; ///
enum maxScripts = 70; ///

enum partyLeaderEntityIndex = 24; ///

enum Pad {
	extra4 = 0x0001, ///The SNES controller doesn't actually have a button like this
	extra3 = 0x0002, ///The SNES controller doesn't actually have a button like this
	extra2 = 0x0004, ///The SNES controller doesn't actually have a button like this
	extra1 = 0x0008, ///The SNES controller doesn't actually have a button like this
	r = 0x0010, ///
	l = 0x0020, ///
	x = 0x0040, ///
	a = 0x0080, ///
	right = 0x0100, ///
	left = 0x0200, ///
	down = 0x0400, ///
	up = 0x0800, ///
	start = 0x1000, ///
	select = 0x2000, ///
	y = 0x4000, ///
	b = 0x8000, ///
}

enum PathfindingTile {
	unknownFB = 0xFB, ///
	unknownFC = 0xFC, ///
	unwalkable = 0xFD, ///
	maybeStart = 0xFE, /// Is this even correct?
	start = 0xFF, /// Is this even correct?
}

enum jpn = false; ///
enum usa = true; ///
enum usaPrototype = false; ///

enum maxLevel = 99; ///


enum eventFlagCount = 1024; ///
enum eventFlagUnset = 0x8000; ///

enum afflictionGroupCount = 7; ///

enum playerCharCount = 4; ///
enum nonplayerCharCount = 2; ///
enum totalPartyCount = playerCharCount + nonplayerCharCount; ///
enum firstEnemyIndex = totalPartyCount + 2; ///the +2 might be space for bad "party members" like the tiny lil ghost. unsure.

enum hpPPWindowWidth = 7;
enum hpPPWindowHeight = 8;

enum objectTickDisabled = 0x8000; ///
enum objectMoveDisabled = 0x4000; ///

enum EntityTickFlags {
	moveDisabled = 0x4000,
	tickDisabled = 0x8000,
	fullyDisabled = moveDisabled | tickDisabled,
}

enum SpriteMapFlags {
	unknown = 0x8000,
}

enum EntityObstacleFlags {
	unknown0 = 1 << 0,
	unknown1 = 1 << 1,
	unknown2 = 1 << 2,
	unknown3 = 1 << 3,
	unknown4 = 1 << 4,
	unknown5 = 1 << 5,
	unknown6 = 1 << 6,
	unknown7 = 1 << 7,
}

auto printableFlags(EntityTickFlags flags) @safe pure {
	static struct Result {
		EntityTickFlags flags;
		void toString(W)(ref W writer) const {
			import std.format : formattedWrite;
			import std.range : chain, only, take;
			writer.formattedWrite!"%-(%s, %)"(chain(
				"Callback disabled".only.take(flags & EntityTickFlags.tickDisabled),
				"Script disabled".only.take(flags & EntityTickFlags.moveDisabled),
				"Enabled".only.take(flags == cast(EntityTickFlags)0),
			));
		}
	}
	return Result(flags);
}
auto printableFlags(SpriteMapFlags flags) @safe pure {
	static struct Result {
		SpriteMapFlags flags;
		void toString(W)(ref W writer) const {
			import std.format : formattedWrite;
			import std.range : chain, only, take;
			writer.formattedWrite!"%-(%s, %)"(chain(
				"Unknown".only.take(flags & SpriteMapFlags.unknown),
				"None".only.take(flags == cast(SpriteMapFlags)0),
			));
		}
	}
	return Result(flags);
}
auto printableFlags(EntityObstacleFlags flags) @safe pure {
	static struct Result {
		EntityObstacleFlags flags;
		void toString(W)(ref W writer) const {
			import std.format : formattedWrite;
			import std.range : chain, only, take;
			writer.formattedWrite!"%-(%s, %)"(chain(
				"Unknown 0".only.take(flags & EntityObstacleFlags.unknown0),
				"Unknown 1".only.take(flags & EntityObstacleFlags.unknown1),
				"Unknown 2".only.take(flags & EntityObstacleFlags.unknown2),
				"Unknown 3".only.take(flags & EntityObstacleFlags.unknown3),
				"Unknown 4".only.take(flags & EntityObstacleFlags.unknown4),
				"Unknown 5".only.take(flags & EntityObstacleFlags.unknown5),
				"Unknown 6".only.take(flags & EntityObstacleFlags.unknown6),
				"Unknown 7".only.take(flags & EntityObstacleFlags.unknown7),
				"None".only.take(flags == cast(EntityObstacleFlags)0),
			));
		}
	}
	return Result(flags);
}

///
enum ubyte baseNumberSelectorCharacter1 = 0x10;
///
enum ubyte baseNumberSelectorCharacter2 = 0x30;
///
enum WalkingStyle {
	normal = 0,

	bicycle = 3,
	ghost = 4,

	slower = 6,
	ladder = 7,
	rope = 8,

	slowest = 10,

	escalator = 12,
	stairs = 13,
}
///
enum Window {
	unknown00 = 0x00,
	textStandard = 0x01,
	inventory = 0x02,
	inventoryMenu = 0x03,
	unknown04 = 0x04,
	phoneMenu = 0x05,
	equipMenu = 0x06,
	equipMenuItemlist = 0x07,
	statusMenu = 0x08,
	unknown09 = 0x09,
	carriedMoney = 0x0A,
	unknown0b = 0x0B,
	unknown0c = 0x0C,
	unknown0d = 0x0D,
	textBattle = 0x0E,
	battleMenu = 0x0F,
	unknown10 = 0x10,
	unknown11 = 0x11,
	battleMenuJeff = 0x12,
	fileSelectMain = 0x13,
	fileSelectMenu = 0x14,
	fileSelectCopyMenuTwoFiles = 0x15,
	fileSelectCopyMenuOneFile = 0x16,
	fileSelectDeleteConfirmation = 0x17,
	fileSelectTextSpeed = 0x18,
	fileSelectMusicMode = 0x19,
	fileSelectNamingNameBox = 0x1A,
	fileSelectNamingMessage = 0x1B,
	fileSelectNamingKeyboard = 0x1C,
	fileSelectNamingConfirmationNess = 0x1D,
	fileSelectNamingConfirmationPaula = 0x1E,
	fileSelectNamingConfirmationJeff = 0x1F,
	fileSelectNamingConfirmationPoo = 0x20,
	fileSelectNamingConfirmationKing = 0x21,
	fileSelectNamingConfirmationFood = 0x22,
	fileSelectNamingConfirmationThing = 0x23,
	fileSelectNamingConfirmationMessage = 0x24,
	unknown25 = 0x25,
	unknown26 = 0x26,
	unknown27 = 0x27,
	equipSelectItem = 0x28,
	characterSelectBase = 0x28,
	unknown29 = 0x29,
	unknown2a = 0x2A,
	unknown2b = 0x2B,
	unknown2c = 0x2C,
	equipMenuStats = 0x2D,
	unknown2e = 0x2E,
	unknown2f = 0x2F,
	unknown30 = 0x30,
	unknown31 = 0x31,
	fileSelectFlavourChoice = 0x32,
	singleCharacterSelect = 0x33,
	unknown34 = 0x34,
	invalid = -1,
}
///
enum TeleportStyle : short {
	none = 0,
	psiAlpha = 1,
	psiBeta = 2,
	instant = 3,
	psiBetter = 4,
	unknown = 5
}
///
enum Direction {
	up = 0,
	upRight = 1,
	right = 2,
	downRight = 3,
	down = 4,
	downLeft = 5,
	left = 6,
	upLeft = 7,
	none = 8,
}
///
enum CCDirection {
	useVar = 0,
	undefined = 0,
	up = Direction.up+1,
	upRight = Direction.upRight+1,
	right = Direction.right+1,
	downRight = Direction.downRight+1,
	down = Direction.down+1,
	downLeft = Direction.downLeft+1,
	left = Direction.left+1,
	upLeft = Direction.upLeft+1,
}
///
enum DirectionMask {
	up = 1<<0,
	upRight = 1<<1,
	right = 1<<2,
	downRight = 1<<3,
	down = 1<<4,
	downLeft = 1<<5,
	left = 1<<6,
	upLeft = 1<<7,
}
///
enum Music {
	none = 0,
	gasStation = 1,
	namingScreen = 2,
	setupScreen = 3,
	none2 = 4,
	youWon1 = 5,
	levelUp = 6,
	youLose = 7,
	battleSwirl1 = 8,
	battleSwirl2 = 9,
	whatTheHeck = 10,
	newFriend = 11,
	youWon2 = 12,
	teleportOut = 13,
	teleportFail = 14,
	fallingUnderground = 15,
	drAndonutsLab = 16,
	monotoliBuilding = 17,
	sloppyHouse = 18,
	neighboursHouse = 19,
	arcade = 20,
	pokeysHouse = 21,
	hospital = 22,
	nesssHouse = 23,
	paulasTheme = 24,
	chaosTheatre = 25,
	hotel = 26,
	goodMorning = 27,
	departmentStore = 28,
	onettAtNight1 = 29,
	yourSanctuary1 = 30,
	yourSanctuary2 = 31,
	giantStep = 32,
	lilliputSteps = 33,
	milkyWell = 34,
	rainyCircle = 35,
	magnetHill = 36,
	pinkCloud = 37,
	lumineHall = 38,
	fireSpring = 39,
	nearABoss = 40,
	alienInvestigation = 41,
	fireSpringsHall = 42,
	belchBase = 43,
	zombieThreed = 44,
	spookyCave = 45,
	onett = 46,
	fourside = 47,
	saturnValley = 48,
	monkeyCaves = 49,
	moonside = 50,
	dustyDunesDesert = 51,
	peacefulRestValley = 52,
	zombieThreed2 = 53,
	winters = 54,
	caveNearABoss = 55,
	summers = 56,
	jackiesCafe = 57,
	sailingToScaraba = 58,
	dalaam = 59,
	muTraining = 60,
	bazaar = 61,
	scarabaDesert = 62,
	pyramid = 63,
	deepDarkness = 64,
	tendaVillage = 65,
	welcomeHome = 66,
	seaOfEden = 67,
	lostUnderworld = 68,
	firstStepBack = 69,
	secondStepBack = 70,
	thePlace = 71,
	giygasAwakens = 72,
	giygasPhase2 = 73,
	giygasWeakened2 = 74,
	giygasDeath2 = 75,
	runaway5Concert1 = 76,
	runaway5TourBus = 77,
	runaway5Concert2 = 78,
	power = 79,
	venusConcert = 80,
	yellowSubmarine = 81,
	bicycle = 82,
	skyRunner = 83,
	skyRunnerFalling = 84,
	bulldozer = 85,
	tessie = 86,
	cityBus = 87,
	fuzzyPickles = 88,
	delivery = 89,
	returnToYourBody = 90,
	phaseDistorterTimeTravel = 91,
	coffeeBreak = 92,
	becauseILoveYou = 93,
	goodFriendsBadFriends = 94,
	smilesAndTears = 95,
	vsCrankyLady = 96,
	vsSpinningRobo = 97,
	vsStruttinEvilMushroom = 98,
	vsMasterBelch = 99,
	vsNewAgeRetroHippie = 100,
	vsRunawayDog = 101,
	vsCaveBoy = 102,
	vsYourSanctuaryBoss = 103,
	vsKraken = 104,
	pokeyMeansBusiness = 105,
	insideTheDungeon = 106,
	megatonWalk = 107,
	seaOfEden2 = 108,
	explosion = 109,
	skyRunnerCrash = 110,
	magicCake = 111,
	pokeysHouseBuzzBuzz = 112,
	buzzBuzzSwatted = 113,
	onettAtNightBuzzBuzz = 114,
	phoneCall = 115,
	knockKnockRight = 116,
	rabbitCave = 117,
	onettAtNight3 = 118,
	appleOfEnlightenment = 119,
	hotelOfTheLivingDead = 120,
	onettIntro = 121,
	sunriseOnett = 122,
	someoneJoins = 123,
	enterStarmanJr = 124,
	boardingSchool = 125,
	phaseDistorter = 126,
	phaseDistorter2 = 127,
	boyMeetsGirl = 128,
	happyThreed = 129,
	runaway5AreFreed = 130,
	flyingMan = 131,
	onettAtNight2 = 132,
	hiddenSong = 133,
	yourSanctuaryBoss = 134,
	teleportIn = 135,
	saturnValleyCave = 136,
	elevatorDown = 137,
	elevatorUp = 138,
	elevatorStop = 139,
	topollaTheatre = 140,
	vsMasterBarf = 141,
	goingToMagicant = 142,
	leavingMagicant = 143,
	krakenDefeated = 144,
	stonehengeDestruction = 145,
	tessieSighting = 146,
	meteorFall = 147,
	vsStarmanJr = 148,
	runaway5HelpOut = 149,
	knockKnock = 150,
	onettAfterMeteor1 = 151,
	onettAfterMeteor2 = 152,
	pokeyTheme = 153,
	onettAtNightBuzzBuzz2 = 154,
	yourSanctuaryBoss2 = 155,
	meteorStrike = 156,
	attractMode = 157,
	nameConfirmation = 158,
	peacefulRestValley2 = 159,
	soundstoneRecordingGiantStep = 160,
	soundstoneRecordingLilliputSteps = 161,
	soundstoneRecordingMilkyWell = 162,
	soundstoneRecordingRainyCircle = 163,
	soundstoneRecordingMagnetHill = 164,
	soundstoneRecordingPinkCloud = 165,
	soundstoneRecordingLumineHall = 166,
	soundstoneRecordingFireSpring = 167,
	soundstoneBGM = 168,
	eightMelodies = 169,
	dalaamIntro = 170,
	wintersIntro = 171,
	pokeyEscapes = 172,
	goodMorningMoonside = 173,
	gasStation2 = 174,
	titleScreen = 175,
	battleSwirl4 = 176,
	pokeyIntro = 177,
	goodMorningScaraba = 178,
	robotomy1 = 179,
	pokeyEscapes2 = 180,
	returnToYourBody2 = 181,
	giygasStatic = 182,
	suddenVictory = 183,
	youWon3 = 184,
	giygasPhase3 = 185,
	giygasPhase1 = 186,
	giveUsStrength = 187,
	goodMorning2 = 188,
	soundStone = 189,
	giygasDeath = 190,
	giygasWeakened = 191,
}
///
enum ItemID {
	none = 0x00,
	franklinBadge = 0x01,
	teddyBear = 0x02,
	superPlushBear = 0x03,
	brokenMachine = 0x04,
	brokenGadget = 0x05,
	brokenAirGun = 0x06,
	brokenSprayCan = 0x07,
	brokenLaser = 0x08,
	brokenIron = 0x09,
	brokenPipe = 0x0A,
	brokenCannon = 0x0B,
	brokenTube = 0x0C,
	brokenBazooka = 0x0D,
	brokenTrumpet = 0x0E,
	brokenHarmonica = 0x0F,
	brokenAntenna = 0x10,
	crackedBat = 0x11,
	teeBallBat = 0x12,
	sandLotBat = 0x13,
	minorLeagueBat = 0x14,
	mrBaseballBat = 0x15,
	bigLeagueBat = 0x16,
	hallOfFameBat = 0x17,
	magicantBat = 0x18,
	legendaryBat = 0x19,
	gutsyBat = 0x1A,
	caseyBat = 0x1B,
	fryPan = 0x1C,
	thickFryPan = 0x1D,
	deluxeFryPan = 0x1E,
	chefsFryPan = 0x1F,
	frenchFryPan = 0x20,
	magicFryPan = 0x21,
	holyFryPan = 0x22,
	swordOfKings = 0x23,
	popGun = 0x24,
	stunGun = 0x25,
	toyAirGun = 0x26,
	magnumAirGun = 0x27,
	zipGun = 0x28,
	laserGun = 0x29,
	hyperBeam = 0x2A,
	crusherBeam = 0x2B,
	spectrumBeam = 0x2C,
	deathRay = 0x2D,
	baddestBeam = 0x2E,
	moonBeamGun = 0x2F,
	gaiaBeam = 0x30,
	yoyo = 0x31,
	slingshot = 0x32,
	bionicSlingshot = 0x33,
	trickYoyo = 0x34,
	combatYoyo = 0x35,
	travelCharm = 0x36,
	greatCharm = 0x37,
	crystalCharm = 0x38,
	rabbitsFoot = 0x39,
	flamePendant = 0x3A,
	rainPendant = 0x3B,
	nightPendant = 0x3C,
	seaPendant = 0x3D,
	starPendant = 0x3E,
	cloakOfKings = 0x3F,
	cheapBracelet = 0x40,
	copperBracelet = 0x41,
	silverBracelet = 0x42,
	goldBracelet = 0x43,
	platinumBand = 0x44,
	diamondBand = 0x45,
	pixiesBracelet = 0x46,
	cherubsBand = 0x47,
	goddessBand = 0x48,
	bracerOfKings = 0x49,
	baseballCap = 0x4A,
	holmesHat = 0x4B,
	mrBaseballCap = 0x4C,
	hardHat = 0x4D,
	ribbon = 0x4E,
	redRibbon = 0x4F,
	goddessRibbon = 0x50,
	coinOfSlumber = 0x51,
	coinOfDefense = 0x52,
	luckyCoin = 0x53,
	talismanCoin = 0x54,
	shinyCoin = 0x55,
	souvenirCoin = 0x56,
	diademOfKings = 0x57,
	cookie = 0x58,
	bagOfFries = 0x59,
	hamburger = 0x5A,
	boiledEgg = 0x5B,
	freshEgg = 0x5C,
	picnicLunch = 0x5D,
	pastaDiSummers = 0x5E,
	pizza = 0x5F,
	chefsSpecial = 0x60,
	largePizza = 0x61,
	psiCaramel = 0x62,
	magicTruffle = 0x63,
	brainFoodLunch = 0x64,
	rockCandy = 0x65,
	croissant = 0x66,
	breadRoll = 0x67,
	pakOfBubbleGum = 0x68,
	jarOfFlyHoney = 0x69,
	canOfFruitJuice = 0x6A,
	royalIcedTea = 0x6B,
	proteinDrink = 0x6C,
	krakenSoup = 0x6D,
	bottleOfWater = 0x6E,
	coldRemedy = 0x6F,
	vialOfSerum = 0x70,
	iqCapsule = 0x71,
	gutsCapsule = 0x72,
	speedCapsule = 0x73,
	vitalCapsule = 0x74,
	luckCapsule = 0x75,
	ketchupPacket = 0x76,
	sugarPacket = 0x77,
	tinOfCocoa = 0x78,
	cartonOfCream = 0x79,
	sprigOfParsley = 0x7A,
	jarOfHotSauce = 0x7B,
	saltPacket = 0x7C,
	backstagePass = 0x7D,
	jarOfDelisauce = 0x7E,
	wetTowel = 0x7F,
	refreshingHerb = 0x80,
	secretHerb = 0x81,
	hornOfLife = 0x82,
	counterPSIUnit = 0x83,
	shieldKiller = 0x84,
	bazooka = 0x85,
	heavyBazooka = 0x86,
	hpSucker = 0x87,
	hungryHPSucker = 0x88,
	xterminatorSpray = 0x89,
	slimeGenerator = 0x8A,
	yogurtDispenser = 0x8B,
	ruler = 0x8C,
	snakeBag = 0x8D,
	mummyWrap = 0x8E,
	protractor = 0x8F,
	bottleRocket = 0x90,
	bigBottleRocket = 0x91,
	multiBottleRocket = 0x92,
	bomb = 0x93,
	superBomb = 0x94,
	insecticideSpray = 0x95,
	rustPromoter = 0x96,
	rustPromoterDX = 0x97,
	pairOfDirtySocks = 0x98,
	stagBeetle = 0x99,
	toothbrush = 0x9A,
	handbagStrap = 0x9B,
	pharaohsCurse = 0x9C,
	defenseShower = 0x9D,
	letterFromMom = 0x9E,
	suddenGutsPill = 0x9F,
	bagOfDragonite = 0xA0,
	defenseSpray = 0xA1,
	piggyNose = 0xA2,
	forSaleSign = 0xA3,
	shynessBook = 0xA4,
	picturePostcard = 0xA5,
	kingBanana = 0xA6,
	letterFromTony = 0xA7,
	chick = 0xA8,
	chicken = 0xA9,
	keyToTheShack = 0xAA,
	keyToTheCabin = 0xAB,
	badKeyMachine = 0xAC,
	temporaryGoods = 0xAD,
	zombiePaper = 0xAE,
	hawkEye = 0xAF,
	bicycle = 0xB0,
	atmCard = 0xB1,
	showTicket = 0xB2,
	letterFromKids = 0xB3,
	wadOfBills = 0xB4,
	receiverPhone = 0xB5,
	diamond = 0xB6,
	signedBanana = 0xB7,
	pencilEraser = 0xB8,
	hieroglyphCopy = 0xB9,
	meteotite = 0xBA,
	contactLens = 0xBB,
	handAid = 0xBC,
	troutYogurt = 0xBD,
	banana = 0xBE,
	calorieStick = 0xBF,
	keyToTheTower = 0xC0,
	meteoritePiece = 0xC1,
	earthPendant = 0xC2,
	neutralizer = 0xC3,
	soundStone = 0xC4,
	exitMouse = 0xC5,
	gelatoDeResort = 0xC6,
	snake = 0xC7,
	viper = 0xC8,
	brainStone = 0xC9,
	townMap = 0xCA,
	videoRelaxant = 0xCB,
	suporma = 0xCC,
	keyToTheLocker = 0xCD,
	insignificantItem = 0xCE,
	magicTart = 0xCF,
	tinyRuby = 0xD0,
	monkeysLove = 0xD1,
	eraserEraser = 0xD2,
	tendakraut = 0xD3,
	trexsBat = 0xD4,
	bigLeagueBat2 = 0xD5,
	ultimateBat = 0xD6,
	doubleBeam = 0xD7,
	platinumBand2 = 0xD8,
	diamondBand2 = 0xD9,
	defenseRibbon = 0xDA,
	talismanRibbon = 0xDB,
	saturnRibbon = 0xDC,
	coinOfSilence = 0xDD,
	charmCoin = 0xDE,
	cupOfNoodles = 0xDF,
	skipSandwich = 0xE0,
	skipSandwichDX = 0xE1,
	luckySandwich1 = 0xE2,
	luckySandwich2 = 0xE3,
	luckySandwich3 = 0xE4,
	luckySandwich4 = 0xE5,
	luckySandwich5 = 0xE6,
	luckySandwich6 = 0xE7,
	cupOfCoffee = 0xE8,
	doubleBurger = 0xE9,
	peanutCheeseBar = 0xEA,
	piggyJelly = 0xEB,
	bowlOfRiceGruel = 0xEC,
	beanCroquette = 0xED,
	molokheiyaSoup = 0xEE,
	plainRoll = 0xEF,
	kabob = 0xF0,
	plainYogurt = 0xF1,
	beefJerky = 0xF2,
	mammothBurger = 0xF3,
	spicyJerky = 0xF4,
	luxuryJerky = 0xF5,
	bottleOfDXWater = 0xF6,
	magicPudding = 0xF7,
	nonstickFrypan = 0xF8,
	mrSaturnCoin = 0xF9,
	meteornium = 0xFA,
	popsicle = 0xFB,
	cupOfLifenoodles = 0xFC,
	carrotKey = 0xFD,
}
///
enum Sfx {
	none = 0,
	cursor1 = 1,
	cursor2 = 2,
	cursor3 = 3,
	cursor4 = 4,
	cursorInvalid = 5,
	unknown06 = 6,
	textPrint = 7,
	doorOpen = 8,
	doorClose = 9,
	phoneRing = 10,
	phoneAnswered = 11,
	cashRegister = 12,
	unknown0D = 13,
	unknown0E = 14,
	unknown0F = 15,
	presentOpened = 16,
	falling = 17,
	unknown12 = 18,
	unknown13 = 19,
	unknown14 = 20,
	unknown15 = 21,
	onettTrumpetSolo = 22,
	bicycleBell = 23,
	allyAttacks = 24,
	enemyAttacks = 25,
	attackAboutToLand = 26,
	menuOpenClose = 27,
	praying = 28,
	psiUsed = 29,
	damageTaken = 30,
	smaaaash = 31,
	allyFell = 32,
	enemyDefeated = 33,
	missed = 34,
	dodged = 35,
	recoverHP = 36,
	recoverStatus = 37,
	shield = 38,
	psiShield = 39,
	statIncrease = 40,
	statDecrease = 41,
	psiHypnosis = 42,
	psiMagnet = 43,
	psiParalysis = 44,
	psiBrainshock = 45,
	tookDamage = 46,
	tookMortalDamage = 47,
	psiRockin1 = 48,
	psiRockin2 = 49,
	psiRockin3 = 50,
	psiFire = 51,
	unknown34 = 52,
	unknown35 = 53,
	counterPSI = 54,
	enemyPSIUsed = 55,
	psiFreeze1 = 56,
	psiFreeze2 = 57,
	psiFreezeFinish = 58,
	hpSucker = 59,
	psiThunderMiss = 60,
	psiThunderHit = 61,
	psiThunderMiss2 = 62,
	psiThunderDamage = 63,
	psiStarstorm = 64,
	psiFlash1 = 65,
	psiFlash2 = 66,
	psiFlash3 = 67,
	foodEaten = 68,
	unknown45 = 69,
	bottleRocketLaunched = 70,
	unknown47 = 71,
	calledForHelp = 72,
	reflectDamage = 73,
	devilMachineOff = 74,
	fireBreath = 75,
	psiDefenseDown = 76,
	beam = 77,
	unknown4E = 78,
	psiParalysisO = 79,
	psiBrainshockO = 80,
	spray = 81,
	spores = 82,
	afflicted = 83,
	ouch = 84,
	unknown55 = 85,
	unknown56 = 86,
	unknown57 = 87,
	unknown58 = 88,
	refilled = 89,
	defensesDestroyed = 90,
	unknown5B = 91,
	unknown5C = 92,
	psiReflected = 93,
	unknown5E = 94,
	magicButterfly = 95,
	ghost = 96,
	unknown61 = 97,
	unknown62 = 98,
	shieldKiller = 99,
	mysteriousTransport = 100,
	cheep = 101,
	congrats = 102,
	learnedPSI = 103,
	cluck = 104,
	pyramid1 = 105,
	pyramid2 = 106,
	pyramid3 = 107,
	pyramid4 = 108,
	pyramid5 = 109,
	pyramidOpened = 110,
	rapidKnocking = 111,
	unknown70 = 112,
	mysterious = 113,
	mysterious2 = 114,
	equippedItem = 115,
	tookitem = 116,
	openedBox2 = 117,
	gotItem = 118,
	openedLockedDoor = 119,
	itemSold = 120,
	unknown79 = 121,
	textInput = 122,
	unknown7B = 123,
	unknown7C = 124,
	unknown7D = 125,
	unknown7E = 126,
	unknown7F = 127,
}
///
enum ItemType {
	teddyBear = 4,
	broken = 8,
	equippable = 16,
	weaponBash = 16,
	weaponShoot = 17,
	armourBody = 20,
	armourArm = 24,
	armourOther = 28,
	edible = 32,
	drink = 36,
	condiment = 40,
	partyFood = 44,
	healingItem = 48,
	battleOffensive = 52,
	battleDefensive = 53,
	keyItem = 56,
	keyItemSpecificArea = 58,
	keyItemForSomeone = 59,
}
///
enum ItemFlags {
	nessCanUse = 1<<0,
	paulaCanUse = 1<<1,
	jeffCanUse = 1<<2,
	pooCanUse = 1<<3,
	transform = 1<<4,
	cannotGive = 1<<5,
	unknown = 1<<6,
	consumedOnUse = 1<<7,
}
///
enum BattleActions {
	noEffect = 0,
	useNoEffect = 1,
	action002 = 2,
	action003 = 3,
	bash = 4,
	shoot = 5,
	spy = 6,
	pray = 7,
	guard = 8,
	action009 = 9,
	psiRockinAlpha = 10,
	psiRockinBeta = 11,
	psiRockinGamma = 12,
	psiRockinOmega = 13,
	psiFireAlpha = 14,
	psiFireBeta = 15,
	psiFireGamma = 16,
	psiFireOmega = 17,
	psiFreezeAlpha = 18,
	psiFreezeBeta = 19,
	psiFreezeGamma = 20,
	psiFreezeOmega = 21,
	psiThunderAlpha = 22,
	psiThunderBeta = 23,
	psiThunderGamma = 24,
	psiThunderOmega = 25,
	psiFlashAlpha = 26,
	psiFlashBeta = 27,
	psiFlashGamma = 28,
	psiFlashOmega = 29,
	psiStarstormAlpha = 30,
	psiStarstormBeta = 31,
	psiLifeupAlpha = 32,
	psiLifeupBeta = 33,
	psiLifeupGamma = 34,
	psiLifeupOmega = 35,
	psiHealingAlpha = 36,
	psiHealingBeta = 37,
	psiHealingGamma = 38,
	psiHealingOmega = 39,
	psiShieldAlpha = 40,
	psiShieldBeta = 41,
	psiShieldSigma = 42,
	psiShieldOmega = 43,
	psiPSIShieldAlpha = 44,
	psiPSIShieldBeta = 45,
	psiPSIShieldSigma = 46,
	psiPSIShieldOmega = 47,
	psiOffenseUpAlpha = 48,
	psiOffenseUpOmega = 49,
	psiDefenseDownAlpha = 50,
	psiDefenseDownOmega = 51,
	psiHypnosisAlpha = 52,
	psiHypnosisOmega = 53,
	psiMagnetAlpha = 54,
	psiMagnetOmega = 55,
	psiParalysisAlpha = 56,
	psiParalysisOmega = 57,
	psiBrainshockAlpha = 58,
	psiBrainshockOmega = 59,
	psiTeleportAlpha = 60,
	psiTeleportOmega = 61,
	callForHelp = 62,
	sowSeeds = 63,
	explode = 64,
	burstIntoFlames = 65,
	steal = 66,
	freezeInTime = 67,
	eerieGlare = 68,
	electricField = 69,
	clumsyBeam = 70,
	nauseatingBurp = 71,
	poisonSting = 72,
	kissOfDeath = 73,
	coldBreath = 74,
	scatterSpores = 75,
	possess = 76,
	wonderfulPowder = 77,
	moldSpores = 78,
	bindingAttack = 79,
	stickyMucus = 80,
	spewFlyHoney = 81,
	spiderSilk = 82,
	scaryWords = 83,
	somethingMysterious = 84,
	disruptSenses = 85,
	sizeUpSituation = 86,
	stinkyBreath = 87,
	summonStorm = 88,
	hotEspresso = 89,
	hauntingMelody = 90,
	extinguishingBlast = 91,
	crashingBoomBang = 92,
	fireSpray = 93,
	fireBreath = 94,
	spinSomething = 95,
	loseTemper = 96,
	saySomethingNasty = 97,
	vacuumAttack = 98,
	replenishFuel = 99,
	poisonousBite = 100,
	fireMissileDizzily = 101,
	continuousAttack = 102,
	onGuard = 103,
	spewFireball = 104,
	intertwine = 105,
	crushingChop = 106,
	submissionHold = 107,
	revAndAccelerate = 108,
	brandishKnife = 109,
	tearInto = 110,
	bite = 111,
	claw = 112,
	swingTail = 113,
	lungeForward = 114,
	wieldShoppingBag = 115,
	swingClub = 116,
	generateTornado = 117,
	sprayWaterBlast = 118,
	flashSmile = 119,
	laughHysterically = 120,
	edgeCloser = 121,
	whisper3 = 122,
	murmur2 = 123,
	mutter1 = 124,
	fallDown = 125,
	beAbsentminded = 126,
	generateSteam = 127,
	wobble = 128,
	reel = 129,
	grin = 130,
	takeDeepBreath = 131,
	greet = 132,
	howl = 133,
	tickTock = 134,
	action135 = 135,
	action136 = 136,
	action137 = 137,
	action138 = 138,
	action139 = 139,
	handAid = 140,
	action141 = 141,
	action142 = 142,
	action143 = 143,
	action144 = 144,
	action145 = 145,
	action146 = 146,
	action147 = 147,
	action148 = 148,
	wetTowel = 149,
	refreshingHerb = 150,
	secretHerb = 151,
	fullStatusHeal = 152,
	action153 = 153,
	action154 = 154,
	action155 = 155,
	action156 = 156,
	action157 = 157,
	action158 = 158,
	counterPSIUnit = 159,
	shieldKiller = 160,
	hpSucker = 161,
	mummyWrap = 162,
	bottleRocket = 163,
	bigBottleRocket = 164,
	multiBottleRocket = 165,
	handbagStrap = 166,
	bomb = 167,
	superBomb = 168,
	slimeGenerator = 169,
	yogurtDispenser = 170,
	snakeBag = 171,
	dirtySocks = 172,
	stagBeetle = 173,
	toothbrush = 174,
	pharoahsCurse = 175,
	hungryHPSucker = 176,
	bagOfDragonite = 177,
	insecticide = 178,
	xterminatorSpray = 179,
	rustPromoter = 180,
	rustPromoterDX = 181,
	suddenGutsPill = 182,
	defenseSpray = 183,
	defenseShower = 184,
	action185 = 185,
	ruler = 186,
	protractor = 187,
	bubbleGum = 188,
	flyHoney = 189,
	piggyNose = 190,
	forSaleSign = 191,
	shynessBook = 192,
	picturePostcard = 193,
	action194 = 194,
	chick = 195,
	chicken = 196,
	atmCard = 197,
	zombiePaper = 198,
	hawkEye = 199,
	bicycle = 200,
	gloriousLight = 201,
	electricShock = 202,
	scatterPollen = 203,
	reachWithIcyHand = 204,
	playPoisonFlute = 205,
	spewExhaust = 206,
	laughManiacally = 207,
	breatheThroughFlute = 208,
	leapForwardAndSpreadWings = 209,
	becomeFriendly = 210,
	loudRumble = 211,
	hug = 212,
	cough = 213,
	miseryAttack = 214,
	paintAttack = 215,
	comeOutSwinging = 216,
	scratch = 217,
	peck = 218,
	trample = 219,
	punch = 220,
	spitSeeds = 221,
	fireBeam = 222,
	spearJab = 223,
	stomp = 224,
	swingHulaHoop = 225,
	charge = 226,
	shredOnSkateboard = 227,
	diamondizingBite = 228,
	grumbleAboutYouth = 229,
	lecture = 230,
	scowl = 231,
	ventOdor = 232,
	shout = 233,
	warCry = 234,
	knitBrow = 235,
	beClumsy = 236,
	scatterSpores2 = 237,
	bitingAttack = 238,
	equipAndAttack = 239,
	equipArmour = 240,
	nightTimeStuffinessBeam = 241,
	coilAround = 242,
	runawayFiveEvent = 243,
	masterBarfDefeat = 244,
	enemyExtender = 245,
	action246 = 246,
	neutralizer = 247,
	emitPaleGreenLight = 248,
	genericFood = 249,
	genericFoodParty = 250,
	action251 = 251,
	action252 = 252,
	action253 = 253,
	action254 = 254,
	action255 = 255,
	action256 = 256,
	wolfedDownFlyHoney = 257,
	soundStone = 258,
	exitMouse = 259,
	bePokey = 260,
	action261 = 261,
	action262 = 262,
	action263 = 263,
	bark = 264,
	chantSpell = 265,
	noEffectTony = 266,
	scratchHead = 267,
	snake = 268,
	viper = 269,
	hieroglyphCopy = 270,
	townMap = 271,
	videoRelaxant = 272,
	dischargeStinkyGas = 273,
	incomprehensibleAttackThunderBeta = 274,
	pokeySpeech1 = 275,
	pokeyAttack = 276,
	giygasAttack = 277,
	pokeySpeech2 = 278,
	runAway = 279,
	mirror = 280,
	suporma = 281,
	insignificantItem = 282,
	monkeysLove = 283,
	tendakraut = 284,
	kingBanana = 285,
	receiverPhone = 286,
	letterFromMom = 287,
	letterFromTony = 288,
	letterFromKids = 289,
	giveOffRainbow = 290,
	finalPrayer1 = 291,
	finalPrayer2 = 292,
	finalPrayer3 = 293,
	finalPrayer4 = 294,
	finalPrayer5 = 295,
	finalPrayer6 = 296,
	finalPrayer7 = 297,
	finalPrayer8 = 298,
	finalPrayer9 = 299,
	incomprehensibleAttackFreezeAlpha = 300,
	incomprehensibleAttackFlashGamma = 301,
	incomprehensibleAttackThunderBetaVulnerable = 302,
	incomprehensibleAttackFreezeAlphaVulnerable = 303,
	incomprehensibleAttackFlashGammaVulnerable = 304,
	incomprehensibleAttackThunderBetaUnstable = 305,
	incomprehensibleAttackFreezeAlphaUnstable = 306,
	incomprehensibleAttackFlashGammaUnstable = 307,
	randomGiygasQuote = 308,
	randomGiygasQuoteTimes3 = 309,
	bazooka = 310,
	heavyBazooka = 311,
	sayPlayerName = 312,
	eatBolognaSandwich = 313,
	loseGearAndBolts = 314,
	reapplyBandage = 315,
	cleanArea = 316,
	wantBattery = 317,
}

///
enum BackgroundLayer {
	none = 0,
	soundStone1 = 228,
	soundStone2 = 229,
	fileSelect = 230,
	unknown279 = 279
}
///
enum ActionScript {
	unknown000, //0
	partyMemberLeading, //1
	partyMemberFollowing, //2
	partyMemberFollowingBubbleMonkey, //3
	characterViewer, //4
	unknown005, //5
	unknown006, //6
	animBillboard, //7
	animMapObjStill, //8
	unknown009, //9
	animPeopleWalk0, //10
	animPeopleWalk0A, //11
	animPeopleWalk1, //12
	animPeopleWalk1Narrow, //13
	unknown014, //14
	unknown015, //15
	unknown016, //16
	unknown017, //17
	king1, //18
	unknown019, //19
	unknown020, //20
	unknown021, //21
	unknown022, //22
	unknown023, //23
	unknown024, //24
	unknown025, //25
	unknown026, //26
	unknown027, //27
	unknown028, //28
	unknown029, //29
	unknown030, //30
	unknown031, //31
	unknown032, //32
	animMagicButterflyOut, //33
	animMagicButterflyApproach, //34
	unknown035, //35
	animNesHomeYure, //36
	mom1, //37
	animKnockDoor, //38
	animNessTobinoku, //39
	homeTelephone, //40
	animTelRing, //41
	animPeopleWalk0Live, //42
	animPeopleWalk1Live, //43
	animMapObjStillLive, //44
	pokey1, //45
	animReturnDog, //46
	animAddParty, //47
	animAddPartyViaLeader, //48
	animAddPartyBMonkey, //49
	animBunbunAppear, //50
	animBunbuun, //51
	animBunbunDie, //52
	unknown053, //53
	animBunbuunBeam, //54
	unknown055, //55
	animMizunoA, //56
	unknown057, //57
	unknown058, //58
	unknown059, //59
	unknown060, //60
	animHallMayorC, //61
	animGetOutHallMayor, //62
	unknown063, //63
	animBusTwsnThrkIn, //64
	unknown065, //65
	unknown066, //66
	animBusTwsnTunnel, //67
	animBusReturnTwsn, //68
	animBusReturnTwsnB, //69
	animBusIntoThrk, //70
	animOutBusR, //71
	animOutBusL, //72
	animIntoBus, //73
	animOutTBusR, //74
	animOutTBusGorgeous, //75
	animIntoTBusGorgeous, //76
	unknown077, //77
	unknown078, //78
	unknown079, //79
	unknown080, //80
	animOshiokiPokey, //81
	animOshiokiPickey, //82
	animOshiokiMince, //83
	animLardnaKee, //84
	unknown085, //85
	unknown086, //86
	unknown087, //87
	unknown088, //88
	unknown089, //89
	unknown090, //90
	animGhostPlus1, //91
	animGhostPlus2, //92
	animRetGhostTunnel, //93
	unknown094, //94
	unknown095, //95
	unknown096, //96
	unknown097, //97
	unknown098, //98
	animGhostThrkPlus1, //99
	animGhostThrkPlus2, //100
	animMouseDoor, //101
	unknown102, //102
	unknown103, //103
	unknown104, //104
	unknown105, //105
	unknown106, //106
	unknown107, //107
	unknown108, //108
	animMichikoIntoRoom, //109
	animMichikoIntoRoomB, //110
	animFollowToMichiko, //111
	animFollowToMichikoB, //112
	unknown113, //113
	animWakeUpTony, //114
	animGorgeousFree, //115
	animLuckyFree, //116
	animNiceFree, //117
	animOKFree, //118
	animGrooveFree, //119
	animMogiriToRight, //120
	animMogiriToDown, //121
	animMonotoryOutAGorgeous, //122
	animMonotoryOutALucky, //123
	animMonotoryOutANice, //124
	animMonotoryOutAOK, //125
	animMonotoryOutAGroove, //126
	unknown127, //127
	unknown128, //128
	unknown129, //129
	unknown130, //130
	unknown131, //131
	unknown132, //132
	animGiantStepCop, //133
	unknown134, //134
	animKifuyaTukimatou, //135
	animFatherCallPaula, //136
	animSwWins, //137
	animSw2Wins, //138
	animNearAndoughnut, //139
	animAndoughnutMessage, //140
	animWinsNearKanai, //141
	animWinsNearBMonkey, //142
	animWinsAwayKanai, //143
	animWinsAwayBMonkey, //144
	animIntoSwWins, //145
	animSwWinsA, //146
	animSwSkyA, //147
	animSwSkyB, //148
	animSwSkyC, //149
	animSwSkyD, //150
	animSwSkyE, //151
	animSwSkyF, //152
	animSwFourA, //153
	animSwFourB, //154
	animSwFourShadowA, //155
	animSwFourShadowB, //156
	animSwDsrtA, //157
	animSwDsrtB, //158
	animSwDsrtShadowA, //159
	animSwDsrtShadowB, //160
	animSwThrkA, //161
	animSwThrkB, //162
	animSwWinsShadowA, //163
	animSwThrkShadowA, //164
	animSwThrkShadowB, //165
	animSwWinsLand, //166
	animSwWinsLand2, //167
	animWinsSkywalkerShadow, //168
	animOutSkywalker, //169
	animSwSumsA, //170
	animSwSumsShadowA, //171
	animSwSplinter1, //172
	animSwSplinter2, //173
	animSwSplinter3, //174
	animOdorokiNesPola, //175
	animKurokogeJeff, //176
	animJeffAddParty, //177
	unknown178, //178
	animGorgeousChaous, //179
	animToGorgeousChaous, //180
	animTonzuraBusChaous, //181
	animIntoTonzuraBusChaous, //182
	animGorgeousChaousRide, //183
	animTonzuraBusToThrk, //184
	animTBusToThrkTunnel, //185
	animTBusIntoThrk, //186
	animGorgeousMono, //187
	unknown188, //188
	animTBusRideMono, //189
	unknown190, //190
	animIntoTonzuraBusMono, //191
	animGorgeousMonoRide, //192
	animTBusToFourTunnel, //193
	animTBusFourTunnel, //194
	animTBusTunnelBrdg, //195
	animTBusBrdgTunnel, //196
	animTBusTunnelDsrt, //197
	animTBusDsrtTunnel, //198
	animTBusTunnelHwayL, //199
	animTBusHwayTunnelL, //200
	animTBusTunnelThrkL, //201
	animBusThrkTwsnIn, //202
	animBusToThrkTunnel, //203
	animBusThrkTunnel, //204
	animBusTunnelTwsn, //205
	animBusThrkDsrtIn, //206
	animBusThrkToDsrt, //207
	animBusThrkTunnelR, //208
	animBusTunnelHwayR, //209
	animBusHwayTunnelR, //210
	animBusTunnelDsrtR, //211
	animBusDsrtTunnelR, //212
	animBusTunnelBrdgR, //213
	animBusBrdgTunnelR, //214
	animBusTunnelFour, //215
	animBusTunnelDsrtRJ, //216
	animBusDsrtThrkIn, //217
	animBusDsrtToThrk, //218
	animBusDsrtFourIn, //219
	animBusDsrtToFour, //220
	unknown221, //221
	animSyochoA, //222
	animSyochoB, //223
	animSyochoC, //224
	animFollowToSyochoA, //225
	animFollowToSyochoB, //226
	animFollowToSyochoC, //227
	animCop5A, //228
	animCop5B, //229
	animCop5C, //230
	animCop5D, //231
	animCop5E, //232
	animCop5ToNessA, //233
	animCop5ToNessB, //234
	animCop5ToNessC, //235
	animCop5ToNessD, //236
	animCop5ToNessE, //237
	animCop5Escape, //238
	animSyochoToNess, //239
	unknown240, //240
	animGrfdPolaAddParty, //241
	animTopolloHallA, //242
	animMuseumKomorita, //243
	animFrsdFieldO, //244
	animFrsdFieldL, //245
	animFrsdFieldM, //246
	animFrsdFieldP, //247
	animFrsdFieldQ, //248
	animTonchiki, //249
	unknown250, //250
	animTacyNearBMonkey, //251
	animBMonkeyGum, //252
	animBMonkeyGum1, //253
	animBMonkeyFly, //254
	animBMonkeyFlyS, //255
	unknown256, //256
	animYunboBack, //257
	unknown258, //258
	animSigeYunboMove, //259
	unknown260, //260
	animBMonkeyFope, //261
	animBMonkeyRopeS, //262
	animBMonkeyRopeOrosu, //263
	animBMonkeyRopeDown, //264
	animBMonkeyRopeGood, //265
	animDashTony, //266
	animJumpJef, //267
	animJumpJefS, //268
	animOutTony, //269
	animJefIntoSwThrk, //270
	animIntoSwThrk, //271
	animSwToSums1, //272
	unknown273, //273
	animKoyaHH1, //274
	animKoyaHH2, //275
	animKoyaKarasu, //276
	animCarpDungL, //277
	animCarpDungR, //278
	circleCultistNorthwest, //279
	circleCultistNortheast, //280
	circleCultistEast, //281
	circleCultistSouth, //282
	circleCultistWest, //283
	unknown284, //284
	animBMonkeyBye, //285
	unknown286, //286
	animDoseSpaceTunnel, //287
	animIntoStKurokoge, //288
	animOutStKurokoge, //289
	animAndDose, //290
	animIntoShip, //291
	animToSailor, //292
	animShipToSkrb1, //293
	animShipSmall, //294
	animEvtKrakenApproach, //295
	animShipToSkrb2, //296
	animOutShip, //297
	animSubmarine1, //298
	animSubmarine2, //299
	animOutSubmarine, //300
	animGuardA1, //301
	animGuardA2, //302
	animGuardB1, //303
	animGuardB2, //304
	animGuard3, //305
	animToGuard, //306
	animMochi1, //307
	animMochiYunbo, //308
	animMochi2, //309
	animStSt3, //310
	animDoseiSt3, //311
	animAndSt31, //312
	animAndSt32, //313
	animKidSt3, //314
	animAndNearSt3, //315
	animOutSt3, //316
	animGeppuPass, //317
	animMaboroshiIn, //318
	animPooToOldman, //319
	animMaboroshiOut1, //320
	animMaboroshiOut2, //321
	animHoihoiA, //322
	animHoihoiB, //323
	animHoihoiC, //324
	animHoihoiD, //325
	animHoihoiE, //326
	animHoihoiF, //327
	animHoihoiG, //328
	animHoihoiH, //329
	animHoihoiI, //330
	animHoihoiJ, //331
	animHoihoiK, //332
	animHoihoiL, //333
	animHoihoiM, //334
	unknown335, //335
	animIntoSt2, //336
	animChkaSt2Still, //337
	animOutSt2, //338
	animPooSyugyou1, //339
	animPooSyugyou2, //340
	animMessenger, //341
	animSenzo1, //342
	animSenzo2, //343
	animPooTeleport, //344
	animSyugyouAddPoo, //345
	animKaitenNess, //346
	animNessAwake, //347
	animTalkPaula, //348
	animTalkJeff, //349
	animTalkPoo, //350
	animBGChange, //351
	animPowspot, //352
	animKoke, //353
	animMonoRMan, //354
	animStageParty, //355
	animStageFadeout, //356
	animTStage1Scr1, //357
	animTStage1Thank, //358
	animTStage1OK, //359
	unknown360, //360
	animTStage1MikeL, //361
	animTStage1MikeR, //362
	animTStage1Nice, //363
	animTStage1Groove, //364
	animTStage1Gorgeous, //365
	animTStage1LuckyDance, //366
	animTStage1GorgeousDance, //367
	animTStage1Lucky, //368
	animTStage1Scr2, //369
	animTStage1Flip, //370
	animTStage1FlipTurn, //371
	animTStage2Scr1, //372
	animTStage2MikeL, //373
	animTStage2MikeR, //374
	animTStage2Thank, //375
	animTStage2OK, //376
	animTStage2Nice, //377
	animTStage2Groove, //378
	animTStage2HighHat, //379
	animTStage2SpotInitPlayer, //380
	animTStage2Player, //381
	animTStage2Spotlight, //382
	animTStage2Gorgeous, //383
	animTStage2Lucky, //384
	animTStage2GorgeousWalk, //385
	animTStage2LuckyWalk, //386
	animTStage2GorgeousDance, //387
	animTStage2LuckyDance, //388
	animTStage2GorgeousDance3, //389
	animTStage2LuckyDance3, //390
	animTStage2GorgeousDance4, //391
	animTStage2LuckyDance4, //392
	animTStage2GorgeousDance5, //393
	animTStage2LuckyDance5, //394
	animTStage2GorgeousDance6, //395
	animTStage2LuckyDance6, //396
	animTStage2SpotA, //397
	animTStage2SpotB, //398
	animTStage2GrooveAdlib, //399
	animTStage2Scr2, //400
	animTStage3Scr1, //401
	animTStage3MikeL, //402
	animTStage3MikeR, //403
	animTStage3Thank, //404
	animTStage3OK, //405
	animTStage3Nice, //406
	animTStage3Groove, //407
	animTStage3HighHat, //408
	animTStage3Band, //409
	animTStage3Lucky1, //410
	animTStage3Gorgeous1, //411
	animTStage3Lucky2, //412
	animTStage3Gorgeous2, //413
	animTStage3Lucky3, //414
	animTStage3Gorgeous3, //415
	animTStage3Lucky4, //416
	animTStage3Gorgeous4, //417
	animTStage3Lucky5, //418
	animTStage3Gorgeous5, //419
	animTStage3Lucky6, //420
	animTStage3Gorgeous6, //421
	animTStage3Lucky7, //422
	animTStage3Gorgeous7, //423
	animTStage3Lucky8, //424
	animTStage3Gorgeous8, //425
	animTStage3Lucky9, //426
	animTStage3Gorgeous9, //427
	animTStage3Lucky10, //428
	animTStage3Gorgeous10, //429
	animTStage3Thank3, //430
	animTStage3OK3, //431
	animTStage3Nice3, //432
	animTStage3Groove3, //433
	animTStage3HighHat3, //434
	animTStage3Venus, //435
	animTStage3TBus, //436
	unknown437, //437
	animVStage1Scr1, //438
	animVStage1VenusStill, //439
	animVStage1VenusLight1, //440
	animVStage1VenusLight2, //441
	animVStage1Venus, //442
	animVStage1KomoritaCross, //443
	animVStage1KomoritaAppear, //444
	animVStage1BodyguardL, //445
	animVStage1BodyguardR, //446
	animVStage1Scr2, //447
	animPhotographer, //448
	animPhotographerS, //449
	animNesPeace, //450
	animNesPeaceSaikyou, //451
	animCameraEye, //452
	animBusDriverL, //453
	animBusDriverR, //454
	animBusFourThrkIn, //455
	animBusFourThrkGo, //456
	animBusFourTunnel, //457
	animBusTunnelBrdgL, //458
	animBusBrdgTunnelL, //459
	animBusTunnelDsrtL, //460
	animBusDsrtTunnelL, //461
	animBusTunnelHwayL, //462
	animBusHwayTunnelL, //463
	animBusTunnelThrkL, //464
	animTeleportFail, //465
	animTeleportSuccess, //466
	unknown467, //467
	animGorgeousFree2A, //468
	animLuckyFree2A, //469
	animNiceFree2A, //470
	animOKFree2A, //471
	animGrooveFree2A, //472
	animTonzuraFree2B, //473
	animGrooveFree2B, //474
	animGorgeousFree2C, //475
	animProloguePokey1, //476
	animProloguePokey2, //477
	animProloguePokey3, //478
	animBMonkeyTassi1A, //479
	animTassi1, //480
	animBMonkeyTassi1B, //481
	animBMonkeyTassi1C, //482
	animRideTassi1, //483
	animOutTassi1, //484
	animUzu1, //485
	animUzu2, //486
	animTacyMask1, //487
	animTacyMask2, //488
	animTacyMask3, //489
	animTacyMask4, //490
	animUzu1TassiBye, //491
	animUzu2TassiBye, //492
	animUzu3TassiByeU, //493
	animUzu3TassiByeL, //494
	animLeaf1, //495
	animLeaf2, //496
	unknown497, //497
	unknown498, //498
	unknown499, //499
	unknown500, //500
	unknown501, //501
	unknown502, //502
	unknown503, //503
	unknown504, //504
	unknown505, //505
	unknown506, //506
	unknown507, //507
	unknown508, //508
	unknown509, //509
	unknown510, //510
	unknown511, //511
	unknown512, //512
	unknown513, //513
	unknown514, //514
	unknown515, //515
	unknown516, //516
	unknown517, //517
	unknown518, //518
	unknown519, //519
	unknown520, //520
	unknown521, //521
	unknown522, //522
	unknown523, //523
	unknown524, //524
	unknown525, //525
	unknown526, //526
	unknown527, //527
	unknown528, //528
	unknown529, //529
	unknown530, //530
	unknown531, //531
	unknown532, //532
	unknown533, //533
	unknown534, //534
	animMdToto, //535
	animMdThrk, //536
	animMdMakyo, //537
	animMdMakyoRafuresia, //538
	animMdHashiBus, //539
	animMdHashiYunbo, //540
	animMdDung, //541
	animMdTwsn, //542
	animMdSkrb, //543
	animMdFrsd, //544
	animMdSums, //545
	animMdOnet, //546
	animLastBattle, //547
	animNesFace, //548
	animLastBattlePokey, //549
	unknown550, //550
	animSpiritReturnNes, //551
	animSpiritReturnPola, //552
	animSpiritReturnJef, //553
	animSpiritReturnPoo, //554
	animWhiteout, //555
	animSpiritReturnNes2, //556
	animSpiritReturnPola2, //557
	animSpiritReturnJef2, //558
	animSpiritReturnPoo2, //559
	animComeBackNes, //560
	animComeBackPola, //561
	animComeBackJef, //562
	animComeBackPoo, //563
	animPooExplosion, //564
	animDoseAndonutEnd, //565
	animDoseDoseiEnd, //566
	animPolaPolastarReturn, //567
	animPolaPolastarReturnL, //568
	animPolaPolastarReturnR, //569
	animPresentBoxFall1, //570
	animPresentBoxFall2, //571
	animPresentBoxFall3, //572
	animPresentBoxShadow1, //573
	animPresentBoxShadow2, //574
	animPresentBoxShadow3, //575
	unknown576, //576
	animDoseiNesDown, //577
	animDoseiPolaDown, //578
	animDoseiJefDown, //579
	animDoseiPooDown, //580
	unknown581, //581
	animElevaterUp, //582
	animElevaterDown, //583
	unknown584, //584
	unknown585, //585
	unknown586, //586
	unknown587, //587
	unknown588, //588
	unknown589, //589
	unknown590, //590
	unknown591, //591
	unknown592, //592
	animMatentAwayZombi1, //593
	animMatentAwayZombi2, //594
	unknown595, //595
	animGumiStoneRise, //596
	unknown597, //597
	walkTowardsPlayer, //598
	unknown599, //599
	unknown600, //600
	unknown601, //601
	unknown602, //602
	unknown603, //603
	animAppleMouseStepback, //604
	animMapObjTBack, //605
	animPeopleTBack, //606
	unknown607, //607
	unknown608, //608
	unknown609, //609
	unknown610, //610
	animFourMuseumBilk, //611
	animFourMuseumRid, //612
	animFourFollowMuseumA, //613
	animFourMuseumReturn, //614
	animSumsMuseumBilk, //615
	animSumsMuseumRid, //616
	animSumsFollowMuseumA, //617
	animSumsMuseumReturn, //618
	animSyochoEscape, //619
	animSaiteiMaboroshiIn, //620
	animSaiteiMaboroshiOut, //621
	animInsekiStarman, //622
	animAkanbePokey, //623
	sleepingNess, //624
	animMouseAddParty, //625
	animInsekiWakeupWalk, //626
	animPeopleSleep, //627
	sleepEmote, //628
	unknown629, //629
	animLardnaSlapBunbuun, //630
	unknown631, //631
	unknown632, //632
	animIntoNight, //633
	animBlackout, //634
	animBlinkSuicide, //635
	animButukarizaru, //636
	animLeaveButukarizaru, //637
	animUkkariCarrier, //638
	animLeaveUkkariCarrier, //639
	animApproachContScript, //640
	animEavesMaid, //641
	unknown642, //642
	animPanningWinters1, //643
	animPanningWinters2, //644
	animPanningRamma1, //645
	animPanningRamma2, //646
	unknown647, //647
	animJumpTonchiki, //648
	animJumpTonchikiShadow, //649
	animTonchikiEnterHouse, //650
	animStrikeNess, //651
	animTakeNessKatacomb1A, //652
	animTakeNessKatacomb1B, //653
	animTakeNessKatacomb1C, //654
	animTakeNessKatacomb2A, //655
	animTakeNessKatacomb2B, //656
	animTakeNessKatacomb2C, //657
	animNessFollowZombi1, //658
	animNessFollowZombi2, //659
	animPaulaFollowZombi1, //660
	animPaulaFollowZombi2, //661
	animNessStill, //662
	animPaulaStill, //663
	animBikiniLookNess, //664
	animAyasii, //665
	unknown666, //666
	animMuMaboroshiOut, //667
	animLeaveSarusensei, //668
	animLeadSarusensei, //669
	animTeleportSarusensei, //670
	animReturnSarusensei, //671
	unknown672, //672
	unknown673, //673
	unknown674, //674
	animChiteiQuake, //675
	animToFountainA, //676
	animToFountainB, //677
	animToFountainC, //678
	animLiftByFountain, //679
	animMaidIntoBuilding, //680
	animMakyoDoctorApproach, //681
	animGoOutCakeWife, //682
	unknown683, //683
	unknown684, //684
	animSlotBrosRotateL, //685
	animSlotBrosRotateM, //686
	animSlotBrosRotateN, //687
	animSlotBrosStopL, //688
	animSlotBrosStopM, //689
	animSlotBrosStopN, //690
	animSlotBrosStopNReach, //691
	animSlotBrosPresent, //692
	unknown693, //693
	unknown694, //694
	animEvtIntoPsychoMyHome, //695
	animEvtPsychoMyHome1f, //696
	animEvtPsychoMyHomeRouka, //697
	animEvtPsychoMyRoom, //698
	unknown699, //699
	unknown700, //700
	animEvtMonotolyGoSwitch, //701
	animEvtMonokumaMove, //702
	animEvtMonokabeMove, //703
	unknown704, //704
	animCarpainterThunder, //705
	animCarpainterThunderhead, //706
	unknown707, //707
	unknown708, //708
	unknown709, //709
	unknown710, //710
	unknown711, //711
	animEvtMonoHeliBoatman, //712
	animEvtHeliFWingStart, //713
	animEvtHeliRWingStart, //714
	animEvtMonoHeliShadow, //715
	animHeliPokeyFace, //716
	animEvtPray1Mama, //717
	animEvtPray1Tracy, //718
	animEvtPray1Dog, //719
	animEvtPray2Bikini, //720
	animEvtPray2Nice, //721
	animEvtPray2Okay, //722
	animEvtPray2Groovy, //723
	animEvtPray3Polapapa, //724
	animEvtPray3Polamama, //725
	animEvtPray3ChildA, //726
	animEvtPray3ChildB, //727
	animEvtPray3ChildD, //728
	animEvtPray4Tony, //729
	animEvtPray4GazeTony, //730
	animEvtPray4PupilA, //731
	animEvtPray4PupilB, //732
	animEvtPray4PupilC, //733
	animEvtPray4PupilD, //734
	animEvtPray4Gaus, //735
	animEvtPray4Explain, //736
	animEvtPray4DirDown, //737
	animEvtPray4DirLeft, //738
	animEvtPray4DirRight, //739
	unknown740, //740
	animEvtPray5GirlA, //741
	animEvtPray5GirlB, //742
	animEvtPray5GirlC, //743
	animEvtPray6Frank, //744
	unknown745, //745
	animEvtPray7STunnel, //746
	animEvtPray7Andoughnut, //747
	animEvtPray7Andoughnut2, //748
	animEvtPray7Applekid, //749
	animEvtPray7Dosei, //750
	animEvtPray7DoseiA, //751
	animEvtPray7DoseiB, //752
	animEvtPray7DoseiC, //753
	animEvtPray7DoseiD, //754
	animEvtPray7Kyorokyoro, //755
	animEvtPray7Motchy, //756
	animEvtPrayOvalWindow, //757
	unknown758, //758
	animBlockZombiB, //759
	animEndPhotoman, //760
	animEndShadow, //761
	animEndCamera, //762
	animEvtEatMagicCake, //763
	animEvtPoolaaa, //764
	animKanjiAtTheNight, //765
	animEvtFeelDiggy, //766
	unknown767, //767
	animEvtFluctuateMagicant, //768
	unknown769, //769
	animOmarGiveHierogriph, //770
	unknown771, //771
	animOpenGateGumi, //772
	animPossessPCAllStill, //773
	animTracyAppear, //774
	animToBeContOvalClose, //775
	animToBeContTitle, //776
	animForbidControl, //777
	animPermitControl, //778
	animSealPCAllDirLeft, //779
	animSealPCAllDirDown, //780
	animSealPCPaulaDirDown, //781
	animRemodelOperation, //782
	unknown783, //783
	unknown784, //784
	unknown785, //785
	unknown786, //786
	unknown787, //787
	titleScreen1, //788
	titleScreen2, //789
	titleScreen3, //790
	titleScreen4, //791
	titleScreen5, //792
	titleScreen6, //793
	titleScreen7, //794
	titleScreen8, //795
	titleScreen9, //796
	titleScreen10, //797
	titleScreen11, //798
	unknown799, //799
	unknown800, //800
	unknown801, //801
	unknown802, //802
	unknown803, //803
	unknown804, //804
	unknown805, //805
	unknown806, //806
	unknown807, //807
	unknown808, //808
	unknown809, //809
	unknown810, //810
	unknown811, //811
	unknown812, //812
	unknown813, //813
	unknown814, //814
	unknown815, //815
	unknown816, //816
	unknown817, //817
	unknown818, //818
	unknown819, //819
	unknown820, //820
	unknown821, //821
	unknown822, //822
	unknown823, //823
	unknown824, //824
	unknown825, //825
	unknown826, //826
	unknown827, //827
	unknown828, //828
	unknown829, //829
	unknown830, //830
	unknown831, //831
	unknown832, //832
	unknown833, //833
	unknown834, //834
	unknown835, //835
	unknown836, //836
	unknown837, //837
	unknown838, //838
	unknown839, //839
	unknown840, //840
	unknown841, //841
	unknown842, //842
	unknown843, //843
	unknown844, //844
	unknown845, //845
	unknown846, //846
	unknown847, //847
	unknown848, //848
	unknown849, //849
	unknown850, //850
	unknown851, //851
	unknown852, //852
	unknown853, //853
	unknown854, //854
	unknown855, //855
	unknown856, //856
	unknown857, //857
	unknown858, //858
	unknown859, //859
	unknown860, //860
	unknown861, //861
	unknown862, //862
	unknown863, //863
	unknown864, //864
	unknown865, //865
	unknown866, //866
	unknown867, //867
	unknown868, //868
	unknown869, //869
	unknown870, //870
	unknown871, //871
	unknown872, //872
	unknown873, //873
	unknown874, //874
	unknown875, //875
	unknown876, //876
	unknown877, //877
	unknown878, //878
	unknown879, //879
	unknown880, //880
	unknown881, //881
	unknown882, //882
	unknown883, //883
	unknown884, //884
	unknown885, //885
	unknown886, //886
	unknown887, //887
	unknown888, //888
	unknown889, //889
	unknown890, //890
	unknown891, //891
	unknown892, //892
	unknown893, //893
	unknown894, //894
}
///
enum OverworldSprite {
	none = 0,
	ness = 1,
	paula = 2,
	jeff = 3,
	poo = 4,
	nessRobot = 5,
	nessPajamas = 6,
	nessBicycle = 7,
	nessAngel = 8,
	paulaAngel = 9,
	jeffAngel = 10,
	pooAngel = 11,
	humanDiamondized = 12,
	humanCharred = 13,
	nessPosing = 14,
	jeffInBed = 15,
	nessLyingDown = 16,
	nessClimbingUp = 17,
	paulaClimbingUp = 18,
	jeffClimbingUp = 19,
	pooClimbingUp = 20,
	nessClimbingDown = 21,
	paulaClimbingDown = 22,
	jeffClimbingDown = 23,
	pooClimbingDown = 24,
	robot = 25,
	robotBroken = 26,
	lilNess = 27,
	lilPaula = 28,
	lilJeff = 29,
	lilPoo = 30,
	lilEscargoExpressGuy = 31,
	lilMachPizzaGuy = 32,
	lilGiftBox = 33,
	lilAngel = 34,
	lilTeddyBear = 35,
	lilDiamondizedGuy = 36,
	lilCharredGuy = 37,
	lilNessDoingPeaceSign = 38,
	flyingMan = 39,
	king = 40,
	dungeonMan = 41,
	kingClimbingUp = 42,
	kingClimbingDown = 43,
	pokey = 44,
	picky = 45,
	bubbleMonkey = 46,
	bubbleMonkeyClimbingUp = 47,
	pokeyRich = 48,
	bubbleMonkeyWithBubble = 49,
	bubbleMonkeyFloating = 50,
	teddyBearParty = 51,
	oldGuyWithCane = 52,
	oldLadyWithCane = 53,
	oldFatGuyWithHat = 54,
	guyInBlueClothes = 55,
	sortaBaldGuyInSuit = 56,
	brunetteShoppingLady = 57,
	blondeShoppingLady = 58,
	fatguyInRedSuit = 59,
	drinkingGuy = 60,
	blondeGuyInASuit = 61,
	darkHairedGuyInSuit = 62,
	sneakyGuyWithAHat = 63,
	nerdyRedHairedGuy = 64,
	blondeLadyBlueDress = 65,
	blondeLadyRedDress = 66,
	elevatorLady = 67,
	blondeHappyLady = 68,
	unassumingLocalGuy = 69,
	youngBlondeGuyInBlue = 70,
	surfer = 71,
	beachLady = 72,
	hotelAttendant = 73,
	copInSunglasses = 74,
	captainStrong = 75,
	travellingEntertainer = 76,
	trumpetPerson = 77,
	jamaicanGuy = 78,
	mrT = 79,
	guyInSwimmingSuit = 80,
	girlInBikini = 81,
	busDriverHead = 82,
	tessieWatcher = 83,
	jackie = 84,
	punkGuy = 85,
	weirdoGuyInSwimTrunks = 86,
	zombieLady = 87,
	dalaameseServant = 88,
	chineseGirl = 89,
	shipCaptain = 90,
	shipCrewman = 91,
	ladyInVeil = 92,
	happyTurbanGuy = 93,
	bigNoseArabGuy = 94,
	mustacheArabTurbanGuy = 95,
	arabMrT = 96,
	tenda = 97,
	starMasterGuy = 98,
	weirdHornedGuy = 99,
	flower = 100,
	insaneCultist = 101,
	tribalWarrior = 102,
	palmTanGuy = 103,
	sunBathingGirl = 104,
	chineseMonkGuy = 105,
	invisible = 106,
	rabbit = 107,
	bigSmileLady = 108,
	bodyguard = 109,
	mexicanGuy = 110,
	busDriver = 111,
	blondeGuyInBlueSuit = 112,
	someBrunetteKid = 113,
	iLoveQowgaShirtGuy = 114,
	scuzzyGuy = 115,
	redClothesPerson = 116,
	orangeHairedNerdKid = 117,
	toughGuyWithSunglasses = 118,
	shyGuy = 119,
	pigtailBlondeGirl = 120,
	pigtailDarkHairedGirl = 121,
	yellowClothesBlonde = 122,
	littleKidInBlue = 123,
	kidInBaseballHelmet = 124,
	kidInDerbyHat = 125,
	kidInDetectiveHat = 126,
	blondePonytailGirl = 127,
	happyGirlInRed = 128,
	chick = 129,
	dog = 130,
	cat = 131,
	birdOnPerch = 132,
	monkey = 133,
	blueCow = 134,
	escargoExpressGuy = 135,
	hintGuy = 136,
	baker = 137,
	girlInStripedApron = 138,
	doctor = 139,
	nurse = 140,
	thickGlassesLady = 141,
	waitress = 142,
	cameraGuy = 143,
	hiddenArmsDealer = 144,
	mom = 145,
	tracy = 146,
	aloysiusMinch = 147,
	lardnaMinch = 148,
	gorgeous = 149,
	lucky = 150,
	machPizzaGuy = 151,
	lierXAgerate = 152,
	frank = 153,
	mayorPirkle = 154,
	paulasFather = 155,
	paulasMother = 156,
	everdred = 157,
	poochyfud = 158,
	mrCarpainter = 159,
	femaleMonkey = 160,
	brickRoad = 161,
	drAndonuts = 162,
	dalaamGirl = 163,
	monotoli = 164,
	venus = 165,
	starMaster = 166,
	telephoneHeadGuy = 167,
	preetProotGuy = 168,
	starMasterFlyingAway = 169,
	tendaChief = 170,
	mrSaturn = 171,
	miner = 172,
	minersBrother = 173,
	foursideMuseumGuy = 174,
	orangeKid = 175,
	appleKid = 176,
	talahRama = 177,
	venusMother = 178,
	brickRoadHead = 179,
	everdredLyingDown = 180,
	magicCakeLady = 181,
	tony = 182,
	tonyInBed = 183,
	gorgeousDancing = 184,
	runawayFiveDrummer = 185,
	runawayFiveBassPlayer = 186,
	runawayFiveSaxPlayer = 187,
	helpfulMole = 188,
	healer = 189,
	musicNotes = 190,
	puPu = 191,
	zzz1 = 192,
	weirdWhiteBubbleThing = 193,
	lightBulb = 194,
	giftBox = 195,
	weirdQuestionMark = 196,
	meteor = 197,
	bench = 198,
	policeBarrier = 199,
	weirdTailThing = 200,
	streetLight = 201,
	busStopSign = 202,
	ovalCloud = 203,
	streetSign = 204,
	cityBus = 205,
	realTaxi = 206,
	deliveryTruck = 207,
	whiteDeliveryTruck = 208,
	skyRunner = 209,
	phaseDistorter = 210,
	bicycle = 211,
	ship = 212,
	sign = 213,
	trashCan = 214,
	telephone = 215,
	payPhone = 216,
	weirdThinkMarks = 217,
	surpriseMark = 218,
	sweat = 219,
	twinklingStars = 220,
	pharaohCasket = 221,
	underwaterNPC = 222,
	apple = 223,
	bananas = 224,
	can = 225,
	littleMushroom = 226,
	mailbox = 227,
	dontEnterSign = 228,
	magicTartStand = 229,
	shadow = 230,
	crossroadSigns = 231,
	exclamationMark = 232,
	dalaamPresent = 233,
	jukebox = 234,
	slotMachine = 235,
	pileOfBones = 236,
	sesameSeed = 237,
	unknown3 = 238,
	crossGravestone = 239,
	brokenPhaseDistorter = 240,
	garbage = 241,
	starMastersPoofCloud = 242,
	runaway5Bus = 243,
	submarine = 244,
	submarinePeriscope = 245,
	brokenManiManiStatue = 246,
	unknown247 = 247,
	jarOfFlyHoney = 248,
	cellDoor = 249,
	coffeeWiggles = 250,
	waterRippleTessieRising = 251,
	tessie = 252,
	drumRim = 253,
	bigDirtScooper = 254,
	guyInCoolRedCar = 255,
	flame = 256,
	fountainOfHealingMini = 257,
	shinyEnemyOutside = 258,
	atm = 259,
	talkingStone = 260,
	shipSmall = 261,
	casket = 262,
	mrSaturnBallAndChain = 263,
	miniGhost = 264,
	pencilStatue = 265,
	treeInPot = 266,
	pyramidDoor = 267,
	lilTalkingStone = 268,
	contactLenses = 269,
	weirdJunk = 270,
	boogeyTentEye = 271,
	boogeyTentMouth = 272,
	microphone = 273,
	mrBatty = 274,
	capsule = 275,
	electroSwoosh = 276,
	frenchKissOfDeath = 277,
	fobby = 278,
	roboPump = 279,
	armoredFrog = 280,
	appleKidsMouse = 281,
	spitefulCrow = 282,
	thirstyCoilSnake = 283,
	skatePunk = 284,
	stinkyGhost = 285,
	handsomeTom = 286,
	madDuck = 287,
	manlyFish = 288,
	madTaxi = 289,
	demonicPetunia = 290,
	ramblinEvilMushroom = 291,
	ranboob = 292,
	evilManiMani = 293,
	gruffGoat = 294,
	kraken = 295,
	crestedBooka = 296,
	territorialOak = 297,
	wetnosaur = 298,
	masterBarf = 299,
	abstractArt = 300,
	zapEel = 301,
	smilinSphere = 302,
	starman = 303,
	lilUFO = 304,
	zombiePossessor = 305,
	whirlingRobo = 306,
	shatteredMan = 307,
	urbanZombie = 308,
	crazedSign = 309,
	sentryRobot = 310,
	badBuffalo = 311,
	chomposaur = 312,
	giganticAnt = 313,
	arachnid = 314,
	slimyLittlePile = 315,
	blackAntoid = 316,
	mobileSprout = 317,
	noGoodFly = 318,
	skelpion = 319,
	lethalAspHieroglyph = 320,
	helpfulMoleEnemy = 321,
	petrifiedRoyalGuard = 322,
	nooseMan = 323,
	thunderMite = 324,
	guardianHieroglyph = 325,
	dalisClock = 326,
	egoOrb = 327,
	masterBelch = 328,
	caveBoy = 329,
	runawayDog = 330,
	mightyBear = 331,
	plainCrocodile = 332,
	yourSanctuaryPointBoss = 333,
	zombieGluedToFloor = 334,
	nessSurprised = 335,
	paulaSurprised = 336,
	jeffSurprised = 337,
	pooSurprised = 338,
	nessAngelSurprised = 339,
	paulaAngelSurprised = 340,
	jeffAngelSurprised = 341,
	pooAngelSurprised = 342,
	diamondizedSurprised = 343,
	smallShadow = 344,
	teddyBearSurprised = 345,
	runaway5Pianist = 346,
	fly = 347,
	waterRipple = 348,
	bigWaterRipple = 349,
	knockingOnDoor = 350,
	heart = 351,
	cellPhoneTendaVillage = 352,
	hawksEye = 353,
	nessMomSitting = 354,
	venusSinging = 355,
	rope = 356,
	tonyKneeling = 357,
	unknown358 = 358,
	nessDogSleeping = 359,
	rock = 360,
	newAgeRetroHippie = 361,
	pooMeditating = 362,
	catAsleep = 363,
	zombieDog = 364,
	muGhost = 365,
	flagOfTheExtinctHappyPeople = 366,
	leavesForTessieScene = 367,
	tessieWaterRipplesTop = 368,
	tessieWaterRipplesBottom = 369,
	giygasToNessTransform = 370,
	unknown = 371,
	plate = 372,
	drapesClosed = 373,
	yellowDrapesOpen = 374,
	yellowDrapesClosed = 375,
	unknown2 = 376,
	policeCar = 377,
	nessSleeping = 378,
	teddyBear = 379,
	teddyBear2 = 380,
	invisible2 = 381,
	pickySitting = 382,
	nessSleepingWithHat = 383,
	zzz = 384,
	payPhoneMirrored = 385,
	police = 386,
	crookedCop = 387,
	unassumingLocalGuyEnemy = 388,
	newAgeRetroHippieEnemy = 389,
	toughGuy = 390,
	annoyingOldPartyMan = 391,
	crankyLady = 392,
	paulaLyingDown = 393,
	jeffLyingDown = 394,
	pooLyingDown = 395,
	electra = 396,
	everdredSurprised = 397,
	lilTenda = 398,
	kingInTheFlashback = 399,
	bird = 400,
	frankysteinMarkII = 401,
	redFountainLostUnderworld = 402,
	appleKidSign = 403,
	orangeKidSign = 404,
	spaSign = 405,
	pastBabyCradle = 406,
	eraserStatue = 407,
	moneyBox = 408,
	magnetHill = 409,
	helicopter = 410,
	brokenHelicopter = 411,
	deepDarknessPhone = 412,
	magicButterfly = 413,
	tools = 414,
	molePlayingRough = 415,
	rowdyMouse = 416,
	criminalCaterpillar = 417,
	clumsyRobot = 418,
	guardianDigger = 419,
	helicopterBlade = 420,
	skyRunnerElectricThingies = 421,
	woodBox = 422,
	ornamentsOnPoosTemple = 423,
	helicopterBack = 424,
	richPokeysHead = 425,
	badPaletteFountain = 426,
	lilToucanPhone = 427,
	atmGuyUnderwater = 428,
	instantRevitalizingDevice = 429,
	secretDoorInMonotoliBuilding = 430,
	secretDoorInMonotoliBuildingSmall = 431,
	magicButterflyOnGround = 432,
	burglinParkSign = 433,
	luckyRunaway5Member = 434,
	nessWithMessedPalette = 435,
	exitMouse = 436,
	nessInPajamas = 437,
	zombieLyingDown = 438,
	unknown439 = 439,
	unknown441 = 440,
	unknown440 = 441,
	hotelSign = 442,
	camel = 443,
	trickOrTrickKid = 444,
	angelOfEverdred = 445,
	hintMan = 446,
	saturnValleyATM = 447,
	runaway5MembersHead = 448,
	photographersCamera = 449,
	badPaletteGuyOnettNight = 450,
	exitMouseNoSign = 451,
	slots = 452,
	nessResting = 453,
	paulaResting = 454,
	deptStoreMook = 455,
	unknown4 = 456,
	lyingDownRobotNess = 457,
	heavilyArmedPokey = 458,
	redTruck = 459,
	whiteTruck = 460,
	masterCriminalWorm = 461,
	tessieWaterRing = 462,
	bigTessieWaterRing = 463,
	invalid = 0xFFFF
}
///
enum BGTileMapSize {
	normal = 0,
	horizontal = 1,
	vertical = 2,
	both = 3
}
///
enum EventFlag {
	none = 0,
	temp0 = 0x001,
	temp1 = 0x002,
	temp2 = 0x003,
	temp3 = 0x004,
	temp4 = 0x005,
	temp5 = 0x006,
	temp6 = 0x007,
	temp7 = 0x008,
	temp8 = 0x009,
	temp9 = 0x00A,
	sysMonsterOff = 0x00B,
	pola = 0x00C,
	polaGrfd = 0x00D,
	jeff = 0x00E,
	pola1 = 0x00F,
	pu = 0x010,
	pu0 = 0x011,
	bunbun = 0x012,
	dog = 0x013,
	pickey = 0x014,
	pokey = 0x015,
	balloonMonkey = 0x016,
	winsTony = 0x017,
	brickRoad = 0x018,
	flyingMan1 = 0x019,
	flyingMan2 = 0x01A,
	flyingMan3 = 0x01B,
	flyingMan4 = 0x01C,
	flyingMan5 = 0x01D,
	myHomePokeyDisappear = 0x01E,
	_1fMizunoAppear = 0x01F,
	b1MizunoAppear = 0x020,
	b2MizunoAppear = 0x021,
	onet2FPickeyAppear = 0x022,
	onet2FPokeyAppear = 0x023,
	onetKanbanCopAppear = 0x024,
	onetMincesAppear = 0x025,
	police5CopAppear = 0x026,
	policeKanbanCopAppear = 0x027,
	onetGuardSharkDisappear = 0x028,
	unknown0041 = 0x029,
	twsnChaosAppleAppear = 0x02A,
	twsnMichikoAppear = 0x02B,
	happyPokeyAppear = 0x02C,
	grfdPokeyAppear = 0x02D,
	thrkBikiniZombiAppear = 0x02E,
	thrkBrokenSkyWAppear = 0x02F,
	thrkFixedSkyWAppear = 0x030,
	thrkMaTentAppear = 0x031,
	winsBrickThanksAppear = 0x032,
	winsCapsulePeopleAppear = 0x033,
	sebastianDisappear = 0x034,
	winsBrickBarkerDisappear = 0x035,
	dsrtSyoziDungeonAppear = 0x036,
	dsrtSyoziDisappear = 0x037,
	unknown0056 = 0x038,
	fourDeptBossAppear = 0x039,
	fourKomoritaAppear = 0x03A,
	fourMaidAppear = 0x03B,
	fourTonchikiAppear = 0x03C,
	sumsMassageAppear = 0x03D,
	skrbBrickRoadDisappear = 0x03E,
	moonRDisappear = 0x03F,
	winFrank = 0x040,
	unknown0065 = 0x041,
	twsnWinTonchiki = 0x042,
	happyWinGuard = 0x043,
	winCarpainter = 0x044,
	winMatent = 0x045,
	winGansekiman = 0x046,
	winGeppu = 0x047,
	winDsrtBoss = 0x048,
	winGiegu = 0x049,
	winOscar = 0x04A,
	winManimani = 0x04B,
	itemTracy = 0x04C,
	itemKakuregaC = 0x04D,
	itemPretz = 0x04E,
	itemXyz = 0x04F,
	keyTabigoya = 0x050,
	itemCycle = 0x051,
	itemPhone = 0x052,
	itemTacoEraser = 0x053,
	twsnItemIsabella = 0x054,
	twsnItemTonchiki = 0x055,
	itemFranklinBadge = 0x056,
	itemHaemitu = 0x057,
	itemGaus = 0x058,
	itemMukuchi = 0x059,
	dsrtItemDia = 0x05A,
	itemBanana = 0x05B,
	gumiOldManItem = 0x05C,
	mgktGetItemCap = 0x05D,
	myHomeMamaYeah = 0x05E,
	myHomePhone = 0x05F,
	myHomePokey = 0x060,
	myHomePokeyEnter = 0x061,
	papaMyHome = 0x062,
	gotCapeEstate = 0x063,
	inseki = 0x064,
	insekiMizunoB2 = 0x065,
	libraryInfoMukuchi = 0x066,
	libraryToilet = 0x067,
	onetAmbrami = 0x068,
	onetGateOpen = 0x069,
	unknown0106 = 0x06A,
	onetLardna = 0x06B,
	openTabigoya = 0x06C,
	policeKanbanCopHear = 0x06D,
	stepCapeEstate = 0x06E,
	twsnTacoDiscover = 0x06F,
	twsnAppleThanks = 0x070,
	twsnAshi = 0x071,
	twsnDeptA = 0x072,
	twsnMichikoThankYou = 0x073,
	twsnOrangeLater = 0x074,
	twsnOrangeThanks = 0x075,
	twsnPaulUpset = 0x076,
	twsnTonzuraFree = 0x077,
	happyAutoShop = 0x078,
	happyAutoShopFoul = 0x079,
	happyCarpainterItemFull = 0x07A,
	happyUshi = 0x07B,
	putZombiHoihoi = 0x07C,
	thrkZombiCaptured = 0x07D,
	capsuleOK = 0x07E,
	winsAndonut = 0x07F,
	winsStart = 0x080,
	winsTascoAcross = 0x081,
	doseiAndonut = 0x082,
	doseiSecretCode = 0x083,
	infoXyz = 0x084,
	spacetunnel2Start = 0x085,
	xyzOk = 0x086,
	dsrtBlackSesame = 0x087,
	dsrtClear = 0x088,
	dsrtSyozi1 = 0x089,
	dsrtWhiteSesame = 0x08A,
	fourDeptOK = 0x08B,
	fourKomorita = 0x08C,
	fourMaid48 = 0x08D,
	fourMaidThanks = 0x08E,
	fourOK = 0x08F,
	unknown0144 = 0x090,
	fourTonchiki = 0x091,
	fourTonzuraFree = 0x092,
	fourTonzuraThanks = 0x093,
	sumsHieroglyph = 0x094,
	sumsRammaStart = 0x095,
	ramaMaster = 0x096,
	skrbYariman = 0x097,
	sphinx = 0x098,
	gumiCaveOpen = 0x099,
	gumiInfoMukuchi = 0x09A,
	gumiUseBook = 0x09B,
	dkfdRockA = 0x09C,
	dkfdRockB = 0x09D,
	dkfdRockC = 0x09E,
	mgktTomb6 = 0x09F,
	moonInvisible_1 = 0x0A0,
	moonInvisible_2 = 0x0A1,
	moonInvisible_3 = 0x0A2,
	moonInvisible_4 = 0x0A3,
	moonInvisible_5 = 0x0A4,
	moonInvisibleman = 0x0A5,
	moonNumbermanB1 = 0x0A6,
	moonNumbermanB2 = 0x0A7,
	moonNumbermanB3 = 0x0A8,
	dayAfter = 0x0A9,
	unknown0170 = 0x0AA,
	doseiGoods1 = 0x0AB,
	doseiGoods2 = 0x0AC,
	doseiGoods3 = 0x0AD,
	dsrtSwitch = 0x0AE,
	happySwitch = 0x0AF,
	healDia = 0x0B0,
	healOharai = 0x0B1,
	healSibire = 0x0B2,
	pizzaSize = 0x0B3,
	deliveryPizza = 0x0B4,
	deliveryUnsou = 0x0B5,
	powrGian = 0x0B6,
	powrLlpt = 0x0B7,
	powrRain = 0x0B8,
	powrMlky = 0x0B9,
	powrMgnt = 0x0BA,
	powrPink = 0x0BB,
	powrLumi = 0x0BC,
	powrFire = 0x0BD,
	winGianBoss = 0x0BE,
	winLlptBoss = 0x0BF,
	winRainBoss = 0x0C0,
	winMlkyBoss = 0x0C1,
	winMgntBoss = 0x0C2,
	winPinkBoss = 0x0C3,
	winLumiBoss = 0x0C4,
	winFireBoss = 0x0C5,
	warpGrfdYamagoya = 0x0C6,
	sysPhonePapa = 0x0C7,
	sysPhoneMyHome = 0x0C8,
	sysPhoneMyHome2 = 0x0C9,
	sysPhonePizza = 0x0CA,
	sysPhoneStoic = 0x0CB,
	sysFlyingManDeadA = 0x0CC,
	sysFlyingManDeadB = 0x0CD,
	sysFlyingManDeadC = 0x0CE,
	sysFlyingManDeadD = 0x0CF,
	sysFlyingManDeadE = 0x0D0,
	tlptOnet = 0x0D1,
	tlptTwsn = 0x0D2,
	tlptThrk = 0x0D3,
	tlptWins = 0x0D4,
	tlptBaka = 0x0D5,
	tlptFour = 0x0D6,
	tlptSums = 0x0D7,
	tlptRama = 0x0D8,
	tlptSkrb = 0x0D9,
	tlptMaky = 0x0DA,
	tlptGumi = 0x0DB,
	tlptDkfd = 0x0DC,
	boxRama1 = 0x0DD,
	boxRama2 = 0x0DE,
	boxDkfd1 = 0x0DF,
	shopTook = 0x0E0,
	shopSold = 0x0E1,
	shop01 = 0x0E2,
	shop02 = 0x0E3,
	shop03 = 0x0E4,
	shop04 = 0x0E5,
	shop05 = 0x0E6,
	shop06 = 0x0E7,
	shop07 = 0x0E8,
	shop08 = 0x0E9,
	shop09 = 0x0EA,
	shop10 = 0x0EB,
	shop11 = 0x0EC,
	shop12 = 0x0ED,
	shop13 = 0x0EE,
	shop14 = 0x0EF,
	shop15 = 0x0F0,
	shop16 = 0x0F1,
	shop17 = 0x0F2,
	shop18 = 0x0F3,
	shop19 = 0x0F4,
	shop20 = 0x0F5,
	shop21 = 0x0F6,
	shop22 = 0x0F7,
	shop23 = 0x0F8,
	shop24 = 0x0F9,
	shop25 = 0x0FA,
	shop26 = 0x0FB,
	shop27 = 0x0FC,
	shop28 = 0x0FD,
	shop29 = 0x0FE,
	shop30 = 0x0FF,
	shop31 = 0x100,
	shop32 = 0x101,
	shop33 = 0x102,
	shop34 = 0x103,
	shop35 = 0x104,
	shop36 = 0x105,
	shop37 = 0x106,
	shop38 = 0x107,
	shop39 = 0x108,
	shop40 = 0x109,
	shop41 = 0x10A,
	shop42 = 0x10B,
	shop43 = 0x10C,
	shop44 = 0x10D,
	shop45 = 0x10E,
	shop46 = 0x10F,
	dsrtYumboShigeAppear = 0x110,
	ramaOK = 0x111,
	skrbBrickRoadMakyoAppear = 0x112,
	masterTlpt = 0x113,
	winGeropp = 0x114,
	winDsrtBossA = 0x115,
	winDsrtBossB = 0x116,
	winDsrtBossC = 0x117,
	winDsrtBossD = 0x118,
	winDsrtBossE = 0x119,
	dsrtDungeonOK = 0x11A,
	winPyramidBoss = 0x11B,
	grfdLlptTacoDisappear = 0x11C,
	dkfdEndGetReady = 0x11D,
	fourGuardRobotADisappear = 0x11E,
	winsDayBreak = 0x11F,
	makyoUseTakanome = 0x120,
	onetCopADisappear = 0x121,
	onetCopBDisappear = 0x122,
	onetCopCDisappear = 0x123,
	onetCopDDisappear = 0x124,
	onetCopEDisappear = 0x125,
	warpAppleTwsn = 0x126,
	myHomeKnockAppear = 0x127,
	thrkBikiniZombiFAppear = 0x128,
	thrkBikiniZombiPAppear = 0x129,
	thrkHotelZombiAppear = 0x12A,
	winsStoneTacoDisappear = 0x12B,
	thrkGraveZombiDisappear = 0x12C,
	myHomePokeyAppear = 0x12D,
	insekiHitmanAppear = 0x12E,
	onetMyHomeBunbunAppear = 0x12F,
	dogLaterAppear = 0x130,
	unknown0305 = 0x131,
	b3mizunoAAppear = 0x132,
	b3mizunoBAppear = 0x133,
	b4mizunoAppear = 0x134,
	twsnTonzuraBusAppear = 0x135,
	myHomePokey2Appear = 0x136,
	winsRopeSwitch = 0x137,
	tunnelTwsnThrkWR = 0x138,
	tunnelTwsnThrkBR = 0x139,
	tunnelTwsnThrkTR = 0x13A,
	tunnelThrkTwsnWL = 0x13B,
	tunnelThrkTwsnBL = 0x13C,
	fourTonzuraBusAppear = 0x13D,
	fourBldgTonzuraAppear = 0x13E,
	twsnChaosStageStart = 0x13F,
	unknown0320 = 0x140,
	twsnInfoTonchiki = 0x141,
	twsnPaul = 0x142,
	itemBubbleGum = 0x143,
	shop47 = 0x144,
	shop48 = 0x145,
	shop49 = 0x146,
	dkfdSt3Appear = 0x147,
	dkfdAndonutAAppear = 0x148,
	dkfdAppleAAppear = 0x149,
	dkfdDoseiAAppear = 0x14A,
	dkfdAndonutBAppear = 0x14B,
	dkfdSt2Appear = 0x14C,
	dsrtYumboBAppear = 0x14D,
	winsBMonkeyDisappear = 0x14E,
	winsTonyCrouchAppear = 0x14F,
	itemKeyPupuka = 0x150,
	sumsStoicReserved = 0x151,
	bMonkeyRope = 0x152,
	twsnAppleDisappear = 0x153,
	unknown0340 = 0x154,
	twsnInfoTaco = 0x155,
	sphinxOK = 0x156,
	itemHieroglyph = 0x157,
	winsTassiEnter = 0x158,
	bMonkeyTass = 0x159,
	sumsOmarBAppear = 0x15A,
	skrbPyramidOK = 0x15B,
	itemTakanome = 0x15C,
	firePartyAppear = 0x15D,
	fourElev = 0x15E,
	happyUpright1Disappear = 0x15F,
	happyUpright2Disappear = 0x160,
	happyUpright3Disappear = 0x161,
	happyUpright4Disappear = 0x162,
	happyUpright5Disappear = 0x163,
	happyUpright6Disappear = 0x164,
	fourMihari1Disappear = 0x165,
	fourMihari2Disappear = 0x166,
	fourMihari3Disappear = 0x167,
	fourMihari4Disappear = 0x168,
	fourMihari5Disappear = 0x169,
	fourYudanRoboDisappear = 0x16A,
	onetSharkADisappear = 0x16B,
	onetSharkBDisappear = 0x16C,
	onetSharkCDisappear = 0x16D,
	gpftMinigeppuADisappear = 0x16E,
	gpftMinigeppuDDisappear = 0x16F,
	gpftMinigeppuEDisappear = 0x170,
	gpftPasswordOK = 0x171,
	stepDsrt = 0x172,
	stepMgkt = 0x173,
	stepPast = 0x174,
	thrkMaTentFaceAppear = 0x175,
	fourTopoloBoyBAppear = 0x176,
	myHomeStart = 0x177,
	phoneFourAppleIchigo = 0x178,
	phoneFourAppleMono = 0x179,
	phoneFourOrangeMono = 0x17A,
	phoneGumiApple = 0x17B,
	phoneGumiOrange = 0x17C,
	unknown0381 = 0x17D,
	dkfdDoseiSt1Appear = 0x17E,
	hotelPaperboyAppear = 0x17F,
	powrAll = 0x180,
	itemContactLens = 0x181,
	fmonMoonADisappear = 0x182,
	fmonMoonBDisappear = 0x183,
	fmonMoonB2Disappear = 0x184,
	fmonMoonCDisappear = 0x185,
	fmonPyraAADisappear = 0x186,
	fmonPyraABDisappear = 0x187,
	fmonPyraACDisappear = 0x188,
	fmonPyraADDisappear = 0x189,
	fmonPyraAEDisappear = 0x18A,
	fmonPyraAFDisappear = 0x18B,
	fmonPyraAGDisappear = 0x18C,
	fmonPyraAHDisappear = 0x18D,
	fmonPyraAIDisappear = 0x18E,
	fmonPyraAJDisappear = 0x18F,
	fmonPyraAKDisappear = 0x190,
	fmonPyraALDisappear = 0x191,
	fmonPyraAMDisappear = 0x192,
	fmonPyraANDisappear = 0x193,
	fmonPyraAODisappear = 0x194,
	fmonPyraAPDisappear = 0x195,
	fmonPyraAQDisappear = 0x196,
	fmonPyraBADisappear = 0x197,
	fmonPyraBBDisappear = 0x198,
	fmonPyraBCDisappear = 0x199,
	fmonPyraBDDisappear = 0x19A,
	fmonPyraBEDisappear = 0x19B,
	fmonPyraBFDisappear = 0x19C,
	fmonPyraBGDisappear = 0x19D,
	fmonPyraBHDisappear = 0x19E,
	fmonPyraBIDisappear = 0x19F,
	fmonBrickAADisappear = 0x1A0,
	fmonBrickABDisappear = 0x1A1,
	fmonBrickBADisappear = 0x1A2,
	fmonBrickBBDisappear = 0x1A3,
	fmonBrickCADisappear = 0x1A4,
	fmonBrickCBDisappear = 0x1A5,
	onetDayBreak = 0x1A6,
	infoPowr = 0x1A7,
	gumi1Book = 0x1A8,
	gumi2Book = 0x1A9,
	gumi3Book = 0x1AA,
	gumi4Book = 0x1AB,
	gumi5Book = 0x1AC,
	gumi6Book = 0x1AD,
	gumi7Book = 0x1AE,
	gumi8Book = 0x1AF,
	gumi9Book = 0x1B0,
	thrkHotelManDisappear = 0x1B1,
	fmonStoneBossDisappear = 0x1B2,
	fmonPyraBossDisappear = 0x1B3,
	fmonKraken2ADisappear = 0x1B4,
	fmonKraken2BDisappear = 0x1B5,
	fmonKraken2CDisappear = 0x1B6,
	makyoMTruffle1Disappear = 0x1B7,
	makyoMTruffle2Disappear = 0x1B8,
	makyoMTruffle3Disappear = 0x1B9,
	makyoMTruffle4Disappear = 0x1BA,
	makyoMTruffle5Disappear = 0x1BB,
	myHomeDogMoved = 0x1BC,
	skrbYarimanBAppear = 0x1BD,
	deliveryCustomer = 0x1BE,
	unknown0447 = 0x1BF,
	unknown0448 = 0x1C0,
	policeStrongBAppear = 0x1C1,
	policeStrongDisappear = 0x1C2,
	sarudungeonAOK = 0x1C3,
	sarudungeonBOK = 0x1C4,
	sarudungeonCOK = 0x1C5,
	sarudungeonDOK = 0x1C6,
	sarudungeonEOK = 0x1C7,
	sarudungeonFOK = 0x1C8,
	sarudungeonGOK = 0x1C9,
	sarudungeonHOK = 0x1CA,
	sarudungeonIOK = 0x1CB,
	sarudungeonJOK = 0x1CC,
	sarudungeonKOK = 0x1CD,
	sarudungeonLOK = 0x1CE,
	sarudungeonMOK = 0x1CF,
	sarudungeonNOK = 0x1D0,
	sarudungeonOOK = 0x1D1,
	insekiPickeyAppear = 0x1D2,
	myHomeDoorClose = 0x1D3,
	onetPokeyDoorClose = 0x1D4,
	yaziumaDisappear = 0x1D5,
	yaziumaTracy = 0x1D6,
	yaziumaMama = 0x1D7,
	yaziumaPokey = 0x1D8,
	kaidanTracyAppear = 0x1D9,
	genkanMamaAppear = 0x1DA,
	sysComeBack = 0x1DB,
	insekiStopperAppear = 0x1DC,
	myhomeSleepNesAppear = 0x1DD,
	shop_50 = 0x1DE,
	photoMyHome = 0x1DF,
	photoOnetMisaki = 0x1E0,
	photoCycleShop = 0x1E1,
	photoRiver = 0x1E2,
	photoCabin = 0x1E3,
	photoChaos = 0x1E4,
	photoTacy = 0x1E5,
	photoMaze = 0x1E6,
	photoHakaba = 0x1E7,
	photoWaterfall = 0x1E8,
	photoOnsen = 0x1E9,
	photoTento = 0x1EA,
	photoBone = 0x1EB,
	photoExcavation = 0x1EC,
	photoBridge = 0x1ED,
	photoDinoMuseum = 0x1EE,
	photoDinosor = 0x1EF,
	photoBuilding = 0x1F0,
	photoDept = 0x1F1,
	photoRamma = 0x1F2,
	photoRammaField = 0x1F3,
	photoStonehenge = 0x1F4,
	photoSumsHotel = 0x1F5,
	photoSumsRest = 0x1F6,
	photoSumsBeach = 0x1F7,
	photoToto = 0x1F8,
	photoSkarabi = 0x1F9,
	photoPyramid = 0x1FA,
	photoDungeonMan = 0x1FB,
	photoMakyou = 0x1FC,
	photoGumi = 0x1FD,
	photoSaturn = 0x1FE,
	itemMap = 0x1FF,
	itemEscapeMouse = 0x200,
	myHome2F1F = 0x201,
	myHomeSleep = 0x202,
	winFrankOnly = 0x203,
	dsrtSaruTacoDisappear = 0x204,
	myHomeLightOn = 0x205,
	dsrtBoss1 = 0x206,
	dsrtBoss2 = 0x207,
	dsrtBoss3 = 0x208,
	dsrtBoss4 = 0x209,
	animPort0 = 0x20A,
	animPort1 = 0x20B,
	animPort2 = 0x20C,
	animPort3 = 0x20D,
	animPort4 = 0x20E,
	animPort5 = 0x20F,
	animPort6 = 0x210,
	animPort7 = 0x211,
	myHomeTracyDisappear = 0x212,
	myHome1FTracyAppear = 0x213,
	bgmInsekiFallA = 0x214,
	bgmInsekiFallB = 0x215,
	bgmBus = 0x216,
	bgmTBus = 0x217,
	bgmTonzuraFree = 0x218,
	bgmTassy = 0x219,
	doseiAppleAppear = 0x21A,
	sysInputPlayerName = 0x21B,
	sysInputNameKana = 0x21C,
	thrkPrisonOpen = 0x21D,
	bgmFune1 = 0x21E,
	bgmFune2 = 0x21F,
	bgmWint1 = 0x220,
	mgktBackLlpt = 0x221,
	mgktBackMlky = 0x222,
	mgktBackMgnt = 0x223,
	mgktBackFire = 0x224,
	twsnFieldTonzDisappear = 0x225,
	itemGreatOrange = 0x226,
	twsnAppleFood = 0x227,
	itemHoihoi = 0x228,
	itemTicket = 0x229,
	itemTofu = 0x22A,
	fourDeptSwitch = 0x22B,
	fourDeptMsgchg = 0x22C,
	totoSailorMsgchg = 0x22D,
	unknown0558 = 0x22E,
	unknown0559 = 0x22F,
	unknown0560 = 0x230,
	unknown0561 = 0x231,
	unknown0562 = 0x232,
	unknown0563 = 0x233,
	unknown0564 = 0x234,
	unknown0565 = 0x235,
	unknown0566 = 0x236,
	unknown0567 = 0x237,
	unknown0568 = 0x238,
	unknown0569 = 0x239,
	unknown0570 = 0x23A,
	unknown0571 = 0x23B,
	unknown0572 = 0x23C,
	unknown0573 = 0x23D,
	unknown0574 = 0x23E,
	unknown0575 = 0x23F,
	unknown0576 = 0x240,
	unknown0577 = 0x241,
	unknown0578 = 0x242,
	unknown0579 = 0x243,
	unknown0580 = 0x244,
	unknown0581 = 0x245,
	unknown0582 = 0x246,
	unknown0583 = 0x247,
	unknown0584 = 0x248,
	unknown0585 = 0x249,
	unknown0586 = 0x24A,
	bgmFlyingMan = 0x24B,
	thrkInfoDDisappear = 0x24C,
	thrkHotelBoyAppear = 0x24D,
	thrkPeopleAppear = 0x24E,
	fourSaruBAppear = 0x24F,
	fourSaruKAppear = 0x250,
	bgmTeleport = 0x251,
	fourInfoDAppear = 0x252,
	rama258Disappear = 0x253,
	tlptDsrt = 0x254,
	shop51 = 0x255,
	shop52 = 0x256,
	shop53 = 0x257,
	shop54 = 0x258,
	fmonHieroglyphADisappear = 0x259,
	fmonHieroglyphBDisappear = 0x25A,
	fmonBossGraveDisappear = 0x25B,
	itemKeyLocker = 0x25C,
	winsLockerFailed = 0x25D,
	skrbDungeonManOpen = 0x25E,
	fourMissFake = 0x25F,
	dsrtSwitchBefore = 0x260,
	winsTacoDisappear = 0x261,
	unknown0610 = 0x262,
	twsnMessengerAppear = 0x263,
	twsnTonchikiRDisappear = 0x264,
	dsrtTsaruDisappear = 0x265,
	dsrtTsaruAAppear = 0x266,
	dsrtTsaruBAppear = 0x267,
	dkfdGumiBoss = 0x268,
	sumsStoicWifeDisappear = 0x269,
	itemKokeshi = 0x26A,
	winsKokeshiDisappear = 0x26B,
	winsLaboMouseAppear = 0x26C,
	winsLaboMonkeyAppear = 0x26D,
	winsKanaiAppear = 0x26E,
	thrkBuilBManAppear = 0x26F,
	twsnTonchikiAppear = 0x270,
	fourPokey = 0x271,
	thrkEscaperAppear = 0x272,
	onetStoneRejected = 0x273,
	doseiPuBoxAppear = 0x274,
	doseiOnsenGero = 0x275,
	winsTassBMonkeyAppear = 0x276,
	moonMonotolyDisappear = 0x277,
	onetDoorClose = 0x278,
	onetMizunoDoorOpen = 0x279,
	onetPolaTelepathy = 0x27A,
	twsnPolaTelepathy = 0x27B,
	winsPolaTelepathy = 0x27C,
	ramaPuAppear = 0x27D,
	twsnPolaAppear = 0x27E,
	mgktTonchikiDisappear = 0x27F,
	unknown0640 = 0x280,
	unknown0641 = 0x281,
	unknown0642 = 0x282,
	onetMyMomeEndMama = 0x283,
	itemDoseiRibbon = 0x284,
	deliveryUnsouB = 0x285,
	deliveryCustomerB = 0x286,
	deliveryCustomerC = 0x287,
	deliveryCustomerD = 0x288,
	gumiTalkerStone = 0x289,
	itemMonkyMind = 0x28A,
	dkfdDoorDisappear = 0x28B,
	ramaRabbitDisappear = 0x28C,
	shop55 = 0x28D,
	makyoTraderDebt = 0x28E,
	bgmSW = 0x28F,
	shopTemp1 = 0x290,
	shopTemp2 = 0x291,
	shopTemp3 = 0x292,
	shopTemp4 = 0x293,
	happySysMsgChg = 0x294,
	bgmSoul = 0x295,
	bgmDungeonMan = 0x296,
	onetLucyChu = 0x297,
	fourStairwayAppear = 0x298,
	itemLetter1 = 0x299,
	itemLetter2 = 0x29A,
	itemLetter3 = 0x29B,
	doseiSyozi = 0x29C,
	boxThrkMaTent = 0x29D,
	itemSignBoard = 0x29E,
	unknown0671 = 0x29F,
	fourHeliDisappear = 0x2A0,
	unknown0673 = 0x2A1,
	unknown0674 = 0x2A2,
	deliveryHoihoi = 0x2A3,
	unknown0676 = 0x2A4,
	unknown0677 = 0x2A5,
	unknown0678 = 0x2A6,
	unknown0679 = 0x2A7,
	fourVenusEncore = 0x2A8,
	gmOnetHint = 0x2A9,
	gmTwosonHint = 0x2AA,
	gmThreekHint = 0x2AB,
	gmFoursideHint = 0x2AC,
	gmSummersHint = 0x2AD,
	gmScarabiHint = 0x2AE,
	sumsMuseumPhoneRing = 0x2AF,
	myHomePhoneTracy = 0x2B0,
	myHomePhonePaula = 0x2B1,
	fourPaulaTakokeshi = 0x2B2,
	skrbPuTakanome = 0x2B3,
	globalLostTakokeshi = 0x2B4,
	globalLostTakanome = 0x2B5,
	deliveryUnsouTakokeshi = 0x2B6,
	deliveryUnsouTakanome = 0x2B7,
	winsJeffRepair = 0x2B8,
	onetShark2FDisappear = 0x2B9,
	photo1 = 0x2BA,
	photo2 = 0x2BB,
	photo3 = 0x2BC,
	photo4 = 0x2BD,
	photo5 = 0x2BE,
	photo6 = 0x2BF,
	photo7 = 0x2C0,
	photo8 = 0x2C1,
	photo9 = 0x2C2,
	photo10 = 0x2C3,
	photo11 = 0x2C4,
	photo12 = 0x2C5,
	photo13 = 0x2C6,
	photo14 = 0x2C7,
	photo15 = 0x2C8,
	photo16 = 0x2C9,
	photo17 = 0x2CA,
	photo18 = 0x2CB,
	photo19 = 0x2CC,
	photo20 = 0x2CD,
	photo21 = 0x2CE,
	photo22 = 0x2CF,
	photo23 = 0x2D0,
	photo24 = 0x2D1,
	photo25 = 0x2D2,
	photo26 = 0x2D3,
	photo27 = 0x2D4,
	photo28 = 0x2D5,
	photo29 = 0x2D6,
	photo30 = 0x2D7,
	photo31 = 0x2D8,
	photo32 = 0x2D9,
	onetBakeryObasan = 0x2DA,
	shop56 = 0x2DB,
	shop57 = 0x2DC,
	shop58 = 0x2DD,
	onetHptlA = 0x2DE,
	onetHptlB = 0x2DF,
	fourPetenera = 0x2E0,
	twsnHotelA = 0x2E1,
	twsnHotelAEnd = 0x2E2,
	twsnPaulCry = 0x2E3,
	thrkPeopleDisappear = 0x2E4,
	fourMonotolyAppear = 0x2E5,
	onetLardnaAppear = 0x2E6,
	stepHappy = 0x2E7,
	happyThunder = 0x2E8,
	dsrtTjabMove = 0x2E9,
	onetEstateDoorOpen = 0x2EA,
	twsnTonzuraGo = 0x2EB,
	winsSkyWDisappear = 0x2EC,
	myHomeNesChange = 0x2ED,
	stepOnet = 0x2EE,
	twsnChaosOnStage = 0x2EF,
	unknown0752 = 0x2F0,
	myhomePhoneRing = 0x2F1,
	sysDistlpt = 0x2F2,
	itemTaishita = 0x2F3,
	dungeonMan = 0x2F4,
	dsrtDiaReserve = 0x2F5,
	bgmMgktIn = 0x2F6,
	fourTopoloAbAppear = 0x2F7,
	bgmPublWarp = 0x2F8,
	thrkTunnelClose = 0x2F9,
	dsrtKanban44Move = 0x2FA,
	myHomeToBe = 0x2FB,
	dsrtInfoTlpt = 0x2FC,
	doseiInfoEquip = 0x2FD,
	winsEscapeMouseNG = 0x2FE,
	dkfdGumiEReaded = 0x2FF,
	globalMuseumPaid = 0x300,
	myHomeTracyFinal = 0x301,
	phoneEscargoFinal = 0x302,
	phonePizzaFinal = 0x303,
	phonePapaFinal = 0x304,
	thrkOzisanDDisappear = 0x305,
	moonWarpX = 0x306,
	sysDis2HPapa = 0x307,
	globalPolaKidnapped = 0x308,
	gumiOldmanEnd = 0x309,
	sysDisMouse = 0x30A,
	sysDistlptEvent = 0x30B,
	thrkUrbanZombiGone = 0x30C,
	unknown0781 = 0x30D,
	unknown0782 = 0x30E,
	unknown0783 = 0x30F,
	unknown0784 = 0x310,
	unknown0785 = 0x311,
	unknown0786 = 0x312,
	unknown0787 = 0x313,
	unknown0788 = 0x314,
	unknown0789 = 0x315,
	unknown0790 = 0x316,
	unknown0791 = 0x317,
	unknown0792 = 0x318,
	unknown0793 = 0x319,
	unknown0794 = 0x31A,
	unknown0795 = 0x31B,
	unknown0796 = 0x31C,
	unknown0797 = 0x31D,
	unknown0798 = 0x31E,
	unknown0799 = 0x31F,
	unknown0800 = 0x320,
	unknown0801 = 0x321,
	unknown0802 = 0x322,
	unknown0803 = 0x323,
	unknown0804 = 0x324,
	unknown0805 = 0x325,
	unknown0806 = 0x326,
	unknown0807 = 0x327,
	unknown0808 = 0x328,
	unknown0809 = 0x329,
	unknown0810 = 0x32A,
	unknown0811 = 0x32B,
	unknown0812 = 0x32C,
	unknown0813 = 0x32D,
	unknown0814 = 0x32E,
	unknown0815 = 0x32F,
	unknown0816 = 0x330,
	unknown0817 = 0x331,
	unknown0818 = 0x332,
	unknown0819 = 0x333,
	unknown0820 = 0x334,
	unknown0821 = 0x335,
	unknown0822 = 0x336,
	unknown0823 = 0x337,
	unknown0824 = 0x338,
	unknown0825 = 0x339,
	unknown0826 = 0x33A,
	unknown0827 = 0x33B,
	unknown0828 = 0x33C,
	unknown0829 = 0x33D,
	unknown0830 = 0x33E,
	unknown0831 = 0x33F,
	unknown0832 = 0x340,
	unknown0833 = 0x341,
	unknown0834 = 0x342,
	unknown0835 = 0x343,
	unknown0836 = 0x344,
	unknown0837 = 0x345,
	unknown0838 = 0x346,
	unknown0839 = 0x347,
	unknown0840 = 0x348,
	unknown0841 = 0x349,
	unknown0842 = 0x34A,
	unknown0843 = 0x34B,
	unknown0844 = 0x34C,
	unknown0845 = 0x34D,
	unknown0846 = 0x34E,
	unknown0847 = 0x34F,
	unknown0848 = 0x350,
	unknown0849 = 0x351,
	unknown0850 = 0x352,
	unknown0851 = 0x353,
	unknown0852 = 0x354,
	unknown0853 = 0x355,
	unknown0854 = 0x356,
	unknown0855 = 0x357,
	unknown0856 = 0x358,
	unknown0857 = 0x359,
	unknown0858 = 0x35A,
	unknown0859 = 0x35B,
	unknown0860 = 0x35C,
	unknown0861 = 0x35D,
	unknown0862 = 0x35E,
	unknown0863 = 0x35F,
	unknown0864 = 0x360,
	unknown0865 = 0x361,
	unknown0866 = 0x362,
	unknown0867 = 0x363,
	unknown0868 = 0x364,
	unknown0869 = 0x365,
	unknown0870 = 0x366,
	unknown0871 = 0x367,
	unknown0872 = 0x368,
	unknown0873 = 0x369,
	unknown0874 = 0x36A,
	unknown0875 = 0x36B,
	unknown0876 = 0x36C,
	unknown0877 = 0x36D,
	unknown0878 = 0x36E,
	unknown0879 = 0x36F,
	unknown0880 = 0x370,
	unknown0881 = 0x371,
	unknown0882 = 0x372,
	unknown0883 = 0x373,
	unknown0884 = 0x374,
	unknown0885 = 0x375,
	unknown0886 = 0x376,
	unknown0887 = 0x377,
	unknown0888 = 0x378,
	unknown0889 = 0x379,
	unknown0890 = 0x37A,
	unknown0891 = 0x37B,
	unknown0892 = 0x37C,
	unknown0893 = 0x37D,
	unknown0894 = 0x37E,
	unknown0895 = 0x37F,
	unknown0896 = 0x380,
	unknown0897 = 0x381,
	unknown0898 = 0x382,
	unknown0899 = 0x383,
	unknown0900 = 0x384,
	unknown0901 = 0x385,
	unknown0902 = 0x386,
	unknown0903 = 0x387,
	unknown0904 = 0x388,
	unknown0905 = 0x389,
	unknown0906 = 0x38A,
	unknown0907 = 0x38B,
	unknown0908 = 0x38C,
	unknown0909 = 0x38D,
	unknown0910 = 0x38E,
	unknown0911 = 0x38F,
	unknown0912 = 0x390,
	unknown0913 = 0x391,
	unknown0914 = 0x392,
	unknown0915 = 0x393,
	unknown0916 = 0x394,
	unknown0917 = 0x395,
	unknown0918 = 0x396,
	unknown0919 = 0x397,
	unknown0920 = 0x398,
	unknown0921 = 0x399,
	unknown0922 = 0x39A,
	unknown0923 = 0x39B,
	unknown0924 = 0x39C,
	unknown0925 = 0x39D,
	unknown0926 = 0x39E,
	unknown0927 = 0x39F,
	unknown0928 = 0x3A0,
	unknown0929 = 0x3A1,
	unknown0930 = 0x3A2,
	unknown0931 = 0x3A3,
	unknown0932 = 0x3A4,
	unknown0933 = 0x3A5,
	unknown0934 = 0x3A6,
	unknown0935 = 0x3A7,
	unknown0936 = 0x3A8,
	unknown0937 = 0x3A9,
	unknown0938 = 0x3AA,
	unknown0939 = 0x3AB,
	unknown0940 = 0x3AC,
	unknown0941 = 0x3AD,
	unknown0942 = 0x3AE,
	unknown0943 = 0x3AF,
	unknown0944 = 0x3B0,
	unknown0945 = 0x3B1,
	unknown0946 = 0x3B2,
	unknown0947 = 0x3B3,
	unknown0948 = 0x3B4,
	unknown0949 = 0x3B5,
	unknown0950 = 0x3B6,
	unknown0951 = 0x3B7,
	unknown0952 = 0x3B8,
	unknown0953 = 0x3B9,
	unknown0954 = 0x3BA,
	unknown0955 = 0x3BB,
	unknown0956 = 0x3BC,
	unknown0957 = 0x3BD,
	unknown0958 = 0x3BE,
	unknown0959 = 0x3BF,
	unknown0960 = 0x3C0,
	unknown0961 = 0x3C1,
	unknown0962 = 0x3C2,
	unknown0963 = 0x3C3,
	unknown0964 = 0x3C4,
	unknown0965 = 0x3C5,
	unknown0966 = 0x3C6,
	unknown0967 = 0x3C7,
	unknown0968 = 0x3C8,
	unknown0969 = 0x3C9,
	unknown0970 = 0x3CA,
	unknown0971 = 0x3CB,
	unknown0972 = 0x3CC,
	unknown0973 = 0x3CD,
	unknown0974 = 0x3CE,
	unknown0975 = 0x3CF,
	unknown0976 = 0x3D0,
	unknown0977 = 0x3D1,
	unknown0978 = 0x3D2,
	unknown0979 = 0x3D3,
	unknown0980 = 0x3D4,
	unknown0981 = 0x3D5,
	unknown0982 = 0x3D6,
	unknown0983 = 0x3D7,
	unknown0984 = 0x3D8,
	unknown0985 = 0x3D9,
	unknown0986 = 0x3DA,
	unknown0987 = 0x3DB,
	unknown0988 = 0x3DC,
	unknown0989 = 0x3DD,
	unknown0990 = 0x3DE,
	unknown0991 = 0x3DF,
	unknown0992 = 0x3E0,
	unknown0993 = 0x3E1,
	unknown0994 = 0x3E2,
	unknown0995 = 0x3E3,
	unknown0996 = 0x3E4,
	unknown0997 = 0x3E5,
	unknown0998 = 0x3E6,
	unknown0999 = 0x3E7,
	unknown1000 = 0x3E8,
	unknown1001 = 0x3E9,
	unknown1002 = 0x3EA,
	unknown1003 = 0x3EB,
	unknown1004 = 0x3EC,
	unknown1005 = 0x3ED,
	unknown1006 = 0x3EE,
	unknown1007 = 0x3EF,
	unknown1008 = 0x3F0,
	unknown1009 = 0x3F1,
	unknown1010 = 0x3F2,
	unknown1011 = 0x3F3,
	unknown1012 = 0x3F4,
	unknown1013 = 0x3F5,
	unknown1014 = 0x3F6,
	unknown1015 = 0x3F7,
	unknown1016 = 0x3F8,
	unknown1017 = 0x3F9,
	unknown1018 = 0x3FA,
	unknown1019 = 0x3FB,
	unknown1020 = 0x3FC,
	unknown1021 = 0x3FD,
	unknown1022 = 0x3FE,
	unknown1023 = 0x3FF,
}
///
enum PartyMember {
	none = 0,
	ness = 1,
	paula = 2,
	jeff = 3,
	poo = 4,
	pokey = 5,
	picky = 6,
	king = 7,
	tony = 8,
	bubbleMonkey = 9,
	dungeonMan = 10,
	flyingMan1 = 11,
	flyingMan2 = 12,
	flyingMan3 = 13,
	flyingMan4 = 14,
	flyingMan5 = 15,
	teddyBear = 16,
	plushTeddyBear = 17,
	leader = 0xFF,
}
///
enum NPCType {
	person = 1,
	itemBox = 2,
	object = 3,
}
///
enum NPCConfigFlagStyle {
	showAlways = 0,
	showIfOff = 1,
	showIfOn = 2,
}
///
enum Font {
	main = 0,
	mrSaturn = 1,
	battle = 2,
	tiny = 3,
	large = 4
}
///
enum EquipmentSlot {
	weapon = 0,
	body = 1,
	arms = 2,
	other = 3,
	all = 3,
}
///
enum LetterboxStyle {
	none = 0,
	large = 1,
	medium = 2,
	small = 3,
}
///
enum Status0 {
	unconscious = 1,
	diamondized = 2,
	paralyzed = 3,
	nauseous = 4,
	poisoned = 5,
	sunstroke = 6,
	cold = 7,
}
///
enum Status1 {
	mushroomized = 1,
	possessed = 2,
}
///
enum Status2 {
	asleep = 1,
	crying = 2,
	immobilized = 3,
	solidified = 4,
}
///
enum Status3 {
	strange = 1
}
///
enum Status4 {
	cantConcentrate = 1,
	cantConcentrate4 = 4,
}
///
enum Status5 {
	homesick = 1
}
///
enum Status6 {
	psiShieldPower = 1,
	psiShield = 2,
	shieldPower = 3,
	shield = 4,
}
///
enum GiygasPhase {
	none = 0,
	battleStarted = 1,
	devilsMachineOff = 2,
	giygasStartsAttacking = 3,
	startPraying = 4,
	prayer1Used = 5,
	prayer2Used = 6,
	prayer3Used = 7,
	prayer4Used = 8,
	prayer5Used = 9,
	prayer6Used = 10,
	prayer7Used = 11,
	prayer8Used = 12,
	defeated = 0xFFFF,
}
///
enum Gender : ubyte {
	male = 1,
	female = 2,
	neutral = 3,
}
///
enum EnemyType : ubyte {
	normal = 0,
	insect = 1,
	metal = 2,
}
///
enum InitialStatus : ubyte {
	none = 0,
	psiShield = 1,
	psiShieldPower = 2,
	shield = 3,
	shieldPower = 4,
	asleep = 5,
	cantConcentrate = 6,
	strange = 7,
}
///
enum EnemyID {
	null_ = 0,
	insaneCultist1 = 1,
	deptStoreSpook1 = 2,
	armoredFrog = 3,
	badBuffalo = 4,
	blackAntoid1 = 5,
	redAntoid = 6,
	ramblinEvilMushroom = 7,
	struttinEvilMushroom1 = 8,
	mobileSprout = 9,
	toughMobileSprout = 10,
	enragedFirePlug = 11,
	mysticalRecord = 12,
	atomicPowerRobot = 13,
	nuclearReactorRobot = 14,
	guardianHieroglyph = 15,
	lethalAspHieroglyph = 16,
	electroSwoosh = 17,
	conductingMenace = 18,
	conductingSpirit = 19,
	evilElemental = 20,
	yourNightmare1 = 21,
	annoyingOldPartyMan = 22,
	annoyingReveler = 23,
	unassumingLocalGuy = 24,
	newAgeRetroHippie = 25,
	mrCarpainter1 = 26,
	carbonDog1 = 27,
	mightyBear = 28,
	mightyBearSeven = 29,
	putridMoldyman = 30,
	thunderMite = 31,
	crankyLady = 32,
	extraCrankyLady = 33,
	giygas1 = 34,
	wetnosaur = 35,
	chomposaur1 = 36,
	titanicAnt1 = 37,
	giganticAnt1 = 38,
	shrooom1 = 39,
	plagueRatOfDoom1 = 40,
	mondoMole1 = 41,
	guardianDigger1 = 42,
	scaldingCoffeeCup = 43,
	loadedDice1 = 44,
	slimyLilPile = 45,
	evenSlimierLittlePile = 46,
	arachnid = 47,
	arachnid2 = 48,
	kraken1 = 49,
	bionicKraken1 = 50,
	spinningRobo = 51,
	whirlingRobo = 52,
	hyperSpinningRobo = 53,
	cop = 54,
	coilSnake = 55,
	thirstyCoilSnake = 56,
	mrBatty = 57,
	elderBatty = 58,
	violentRoach = 59,
	filthyAttackRoach = 60,
	crazedSign = 61,
	woolyShambler = 62,
	wildNWoolyShambler = 63,
	skatePunk = 64,
	skelpion = 65,
	dreadSkelpion = 66,
	starman1 = 67,
	starmanSuper1 = 68,
	ghostOfStarman1 = 69,
	smilinSphere = 70,
	uncontrollableSphere = 71,
	petrifiedRoyalGuard = 72,
	guardianGeneral1 = 73,
	starmanDeluxe1 = 74,
	finalStarman1 = 75,
	urbanZombie1 = 76,
	zombiePossessor = 77,
	zombieDog = 78,
	crookedCop = 79,
	overZealousCop = 80,
	territorialOak = 81,
	hostileElderOak = 82,
	diamondDog1 = 83,
	marauderOctobot = 84,
	militaryOctobot = 85,
	mechanicalOctobot = 86,
	ultimateOctobot = 87,
	madDuck = 88,
	dalisClock = 89,
	trillionageSprout1 = 90,
	musica = 91,
	desertWolf = 92,
	masterBelch1 = 93,
	bigPileOfPuke1 = 94,
	masterBarf1 = 95,
	kissOfDeath = 96,
	frenchKissOfDeath = 97,
	foppy1 = 98,
	fobby = 99,
	zapEel = 100,
	tangoo1 = 101,
	boogeyTent1 = 102,
	squatterDemon1 = 103,
	crestedBooka = 104,
	greatCrestedBooka = 105,
	lesserMook = 106,
	mookSenior = 107,
	smellyGhost = 108,
	stinkyGhost = 109,
	everdred1 = 110,
	attackSlug = 111,
	pitBullSlug = 112,
	rowdyMouse = 113,
	deadlyMouse = 114,
	careFreeBomb = 115,
	electroSpecter1 = 116,
	handsomeTom = 117,
	smilinSam = 118,
	manlyFish = 119,
	manlyFishsBrother = 120,
	runawayDog1 = 121,
	trickOrTrickKid = 122,
	caveBoy1 = 123,
	abstractArt = 124,
	shatteredMan = 125,
	fierceShatteredMan = 126,
	egoOrb = 127,
	thunderAndStorm1 = 128,
	yesManJunior = 129,
	frankysteinMarkII1 = 130,
	frank = 131,
	cuteLilUFO = 132,
	beautifulUFO = 133,
	pogoPunk = 134,
	toughGuy = 135,
	madTaxi = 136,
	evilManiMani1 = 137,
	mrMolecule = 138,
	worthlessProtoplasm = 139,
	sentryRobot = 140,
	heavilyArmedPokey1 = 141,
	psychicPsycho = 142,
	majorPsychicPsycho = 143,
	molePlayingRough = 144,
	gruffGoat = 145,
	clumsyRobot1 = 146,
	soulConsumingFlame = 147,
	demonicPetunia = 148,
	ranboob = 149,
	lilUFO = 150,
	highClassUFO = 151,
	nooseMan = 152,
	roboPump1 = 153,
	plainCrocodile = 154,
	strongCrocodile = 155,
	hardCrocodile = 156,
	noGoodFly = 157,
	mostlyBadFly = 158,
	spitefulCrow = 159,
	myPet = 160,
	pokey = 161,
	picky = 162,
	tony = 163,
	bubbleMonkey = 164,
	dungeonMan = 165,
	flyingMan = 166,
	teddyBear = 167,
	superPlushBear = 168,
	masterBelch2 = 169,
	insaneCultist2 = 170,
	deptStoreSpook2 = 171,
	yourNightmare2 = 172,
	mrCarpainter2 = 173,
	carbonDog2 = 174,
	chomposaur2 = 175,
	titanicAnt2 = 176,
	giganticAnt2 = 177,
	shrooom2 = 178,
	plagueRatOfDoom2 = 179,
	mondoMole2 = 180,
	guardianDigger2 = 181,
	kraken2 = 182,
	bionicKraken2 = 183,
	starman2 = 184,
	starmanSuper2 = 185,
	ghostOfStarman2 = 186,
	starmanDeluxe2 = 187,
	finalStarman2 = 188,
	urbanZombie2 = 189,
	diamondDog2 = 190,
	trillionageSprout2 = 191,
	masterBelch3 = 192,
	bigPileOfPuke2 = 193,
	masterBarf2 = 194,
	loadedDice2 = 195,
	tangoo2 = 196,
	boogeyTent2 = 197,
	squatterDemon2 = 198,
	everdred2 = 199,
	electroSpecter2 = 200,
	thunderAndStorm2 = 201,
	frankysteinMarkII2 = 202,
	evilManiMani2 = 203,
	heavilyArmedPokey2 = 204,
	clumsyRobot2 = 205,
	roboPump2 = 206,
	foppy2 = 207,
	guardianGeneral2 = 208,
	blackAntoid2 = 209,
	struttinEvilMushroom2 = 210,
	runawayDog2 = 211,
	caveBoy2 = 212,
	tinyLilGhost = 213,
	starmanJr = 214,
	buzzBuzz = 215,
	heavilyArmedPokey3 = 216,
	heavilyArmedPokey4 = 217,
	giygas2 = 218,
	giygas3 = 219,
	giygas4 = 220,
	giygas5 = 221,
	farmZombie = 222,
	criminalCaterpillar = 223,
	evilEye = 224,
	magicButterfly = 225,
	miniBarf = 226,
	masterCriminalWorm = 227,
	captainStrong = 228,
	giygas6 = 229,
	clumsyRobot3 = 230,
	noEnemy = -1,
}
///
enum BattleBGLayer : ushort{
	none = 0,
	unknown001 = 1,
	unknown002 = 2,
	unknown003 = 3,
	unknown004 = 4,
	unknown005 = 5,
	unknown006 = 6,
	unknown007 = 7,
	unknown008 = 8,
	unknown009 = 9,
	unknown010 = 10,
	unknown011 = 11,
	unknown012 = 12,
	unknown013 = 13,
	unknown014 = 14,
	unknown015 = 15,
	unknown016 = 16,
	unknown017 = 17,
	unknown018 = 18,
	unknown019 = 19,
	unknown020 = 20,
	unknown021 = 21,
	unknown022 = 22,
	unknown023 = 23,
	unknown024 = 24,
	unknown025 = 25,
	unknown026 = 26,
	unknown027 = 27,
	unknown028 = 28,
	unknown029 = 29,
	unknown030 = 30,
	unknown031 = 31,
	unknown032 = 32,
	unknown033 = 33,
	unknown034 = 34,
	unknown035 = 35,
	unknown036 = 36,
	unknown037 = 37,
	unknown038 = 38,
	unknown039 = 39,
	unknown040 = 40,
	unknown041 = 41,
	unknown042 = 42,
	unknown043 = 43,
	unknown044 = 44,
	unknown045 = 45,
	unknown046 = 46,
	unknown047 = 47,
	unknown048 = 48,
	unknown049 = 49,
	unknown050 = 50,
	unknown051 = 51,
	unknown052 = 52,
	unknown053 = 53,
	unknown054 = 54,
	unknown055 = 55,
	unknown056 = 56,
	unknown057 = 57,
	unknown058 = 58,
	unknown059 = 59,
	unknown060 = 60,
	unknown061 = 61,
	unknown062 = 62,
	unknown063 = 63,
	unknown064 = 64,
	unknown065 = 65,
	unknown066 = 66,
	unknown067 = 67,
	unknown068 = 68,
	unknown069 = 69,
	unknown070 = 70,
	unknown071 = 71,
	unknown072 = 72,
	unknown073 = 73,
	unknown074 = 74,
	unknown075 = 75,
	unknown076 = 76,
	unknown077 = 77,
	unknown078 = 78,
	unknown079 = 79,
	unknown080 = 80,
	unknown081 = 81,
	unknown082 = 82,
	unknown083 = 83,
	unknown084 = 84,
	unknown085 = 85,
	unknown086 = 86,
	unknown087 = 87,
	unknown088 = 88,
	unknown089 = 89,
	unknown090 = 90,
	unknown091 = 91,
	unknown092 = 92,
	unknown093 = 93,
	unknown094 = 94,
	unknown095 = 95,
	unknown096 = 96,
	unknown097 = 97,
	unknown098 = 98,
	unknown099 = 99,
	unknown100 = 100,
	unknown101 = 101,
	unknown102 = 102,
	unknown103 = 103,
	unknown104 = 104,
	unknown105 = 105,
	unknown106 = 106,
	unknown107 = 107,
	unknown108 = 108,
	unknown109 = 109,
	unknown110 = 110,
	unknown111 = 111,
	unknown112 = 112,
	unknown113 = 113,
	unknown114 = 114,
	unknown115 = 115,
	unknown116 = 116,
	unknown117 = 117,
	unknown118 = 118,
	unknown119 = 119,
	unknown120 = 120,
	unknown121 = 121,
	unknown122 = 122,
	unknown123 = 123,
	unknown124 = 124,
	unknown125 = 125,
	unknown126 = 126,
	unknown127 = 127,
	unknown128 = 128,
	unknown129 = 129,
	unknown130 = 130,
	unknown131 = 131,
	unknown132 = 132,
	unknown133 = 133,
	unknown134 = 134,
	unknown135 = 135,
	unknown136 = 136,
	unknown137 = 137,
	unknown138 = 138,
	unknown139 = 139,
	unknown140 = 140,
	unknown141 = 141,
	unknown142 = 142,
	unknown143 = 143,
	unknown144 = 144,
	unknown145 = 145,
	unknown146 = 146,
	unknown147 = 147,
	unknown148 = 148,
	unknown149 = 149,
	unknown150 = 150,
	unknown151 = 151,
	unknown152 = 152,
	unknown153 = 153,
	unknown154 = 154,
	unknown155 = 155,
	unknown156 = 156,
	unknown157 = 157,
	unknown158 = 158,
	unknown159 = 159,
	unknown160 = 160,
	unknown161 = 161,
	unknown162 = 162,
	unknown163 = 163,
	unknown164 = 164,
	unknown165 = 165,
	unknown166 = 166,
	unknown167 = 167,
	unknown168 = 168,
	unknown169 = 169,
	unknown170 = 170,
	unknown171 = 171,
	unknown172 = 172,
	unknown173 = 173,
	unknown174 = 174,
	unknown175 = 175,
	unknown176 = 176,
	unknown177 = 177,
	unknown178 = 178,
	unknown179 = 179,
	unknown180 = 180,
	unknown181 = 181,
	unknown182 = 182,
	unknown183 = 183,
	unknown184 = 184,
	unknown185 = 185,
	unknown186 = 186,
	unknown187 = 187,
	unknown188 = 188,
	unknown189 = 189,
	unknown190 = 190,
	unknown191 = 191,
	unknown192 = 192,
	unknown193 = 193,
	unknown194 = 194,
	unknown195 = 195,
	number3 = 196,
	unknown197 = 197,
	unknown198 = 198,
	unknown199 = 199,
	unknown200 = 200,
	unknown201 = 201,
	unknown202 = 202,
	unknown203 = 203,
	unknown204 = 204,
	unknown205 = 205,
	unknown206 = 206,
	unknown207 = 207,
	unknown208 = 208,
	unknown209 = 209,
	unknown210 = 210,
	unknown211 = 211,
	unknown212 = 212,
	unknown213 = 213,
	unknown214 = 214,
	unknown215 = 215,
	unknown216 = 216,
	unknown217 = 217,
	unknown218 = 218,
	unknown219 = 219,
	giygasDevilsMachine = 220,
	giygasDevilsMachineOffCutscene1 = 221,
	giygasDevilsMachineOffCutscene2 = 222,
	giygasDevilsMachineOff1 = 223,
	giygasDevilsMachineOff2 = 224,
	giygasVulnerable = 225,
	giygasUnstable1 = 226,
	giygasUnstable2 = 227,
	soundstone1 = 228,
	soundstone2 = 229,
	fileSelect = 230,
	coffee1 = 231,
	coffee2 = 232,
	tea1 = 233,
	tea2 = 234,
	unknown235 = 235,
	unknown236 = 236,
	unknown237 = 237,
	unknown238 = 238,
	unknown239 = 239,
	unknown240 = 240,
	unknown241 = 241,
	unknown242 = 242,
	unknown243 = 243,
	unknown244 = 244,
	unknown245 = 245,
	unknown246 = 246,
	unknown247 = 247,
	unknown248 = 248,
	unknown249 = 249,
	unknown250 = 250,
	unknown251 = 251,
	unknown252 = 252,
	unknown253 = 253,
	unknown254 = 254,
	muTraining = 255,
	unknown256 = 256,
	unknown257 = 257,
	unknown258 = 258,
	unknown259 = 259,
	unknown260 = 260,
	unknown261 = 261,
	unknown262 = 262,
	magicCake1 = 263,
	magicCake2 = 264,
	giygasUnused = 265,
	unknown266 = 266,
	unknown267 = 267,
	unknown268 = 268,
	unknown269 = 269,
	unknown270 = 270,
	unknown271 = 271,
	unknown272 = 272,
	unknown273 = 273,
	unknown274 = 274,
	unknown275 = 275,
	unknown276 = 276,
	unknown277 = 277,
	unknown278 = 278,
	unknown279 = 279,
	unknown280 = 280,
	unknown281 = 281,
	unknown282 = 282,
	unknown283 = 283,
	unknown284 = 284,
	unknown285 = 285,
	unknown286 = 286,
	unknown287 = 287,
	unknown288 = 288,
	unknown289 = 289,
	unknown290 = 290,
	unknown291 = 291,
	unknown292 = 292,
	unknown293 = 293,
	unknown294 = 294,
	introGiygas = 295,
	unknown296 = 296,
	unknown297 = 297,
	unknown298 = 298,
	unknown299 = 299,
	unknown300 = 300,
	unknown301 = 301,
	unknown302 = 302,
	unknown303 = 303,
	unknown304 = 304,
	unknown305 = 305,
	unknown306 = 306,
	unknown307 = 307,
	unknown308 = 308,
	unknown309 = 309,
	unknown310 = 310,
	unknown311 = 311,
	unknown312 = 312,
	unknown313 = 313,
	unknown314 = 314,
	unknown315 = 315,
	unknown316 = 316,
	unknown317 = 317,
	unknown318 = 318,
	unknown319 = 319,
	unknown320 = 320,
	unknown321 = 321,
	unknown322 = 322,
	unknown323 = 323,
	unknown324 = 324,
	unknown325 = 325,
	unknown326 = 326,
	unknown327 = 327,
	unknown328 = 328,
	unknown329 = 329,
}
///
enum Initiative {
	normal = 0,
	partyFirst = 1,
	enemiesFirst = 2,
	runningAway = 3,
	runningAlwaysSuccessful = 4,
}
///
enum ActionDirection {
	enemy = 0,
	party = 1,
}
///
enum ActionType {
	nothing = 0,
	physical = 1,
	piercingPhysical = 2,
	psi = 3,
	item = 4,
	other = 5,
}
///
enum ActionTarget {
	none = 0,
	one = 1,
	random = 2,
	row = 3,
	all = 4,
}
///
enum Targetted {
	allies = 0,
	single = 1,
	row = 2,
	all = 4,
	enemies = 16
}

///
enum NPCTargettability {
	untargettable = 1,
	forced = 6,
	normal = 7,
}
///
enum BattleSpriteSize {
	_32X32 = 1,
	_64X32 = 2,
	_32X64 = 3,
	_64X64 = 4,
	_128X64 = 5,
	_128X128 = 6,
}

///
enum MapSectorConfig {
	unknown = 1<<6,
	cannotTeleport = 1<<7,
}
///
enum SpecialGameState {
	none = 0,
	indoorArea = 1,
	exitMouseUsable = 2,
	useMiniSprites = 3,
	useMagicantSprites = 4,
	useRobotSprites = 5,
	onBicycle = 6,
}
///
enum MapSectorTownMap {
	none = 0,
	onett = 1<<3,
	twoson = 2<<3,
	threed = 3<<3,
	fourside = 4<<3,
	scaraba = 5<<3,
	summers = 6<<3,
	none2 = 7<<3,
}
///
enum TownMap {
	onett,
	twoson,
	threed,
	fourside,
	scaraba,
	summers,
}
///
enum DoorType {
	switch_ = 0,
	ropeLadder = 1,
	door = 2,
	escalator = 3,
	stairway = 4,
	object = 5,
	person = 6,
	type7 = 7,
}
///
enum PartyPSIFlags {
	teleportAlpha = 1<<0,
	teleportBeta = 1<<1,
	starstormAlpha = 1<<2,
	starstormBeta = 1<<3,
}
///
enum WarpStyle {
	instantPlusFade = 0,
	standardDoor = 1,
	standardDoorWhite = 2,
	standardDoor2 = 3,
	standardDoorWithSound = 4,
	hole = 5,
	standardDoor3 = 6,
	standardDoorWithSound2 = 7,
	standardDoorWithSound3 = 8,
	standardDoorWithSound4 = 9,
	standardDoor4 = 10,
	unknown = 11,
	standardDoor5 = 12,
	standardDoor6 = 13,
	standardDoorWhite2 = 14,
	standardDoorWithUnknownSound = 15,
	phaseDistorterIII = 16,
	moonside1 = 17,
	moonside2 = 18,
	moonside3 = 19,
	moonside4 = 20,
	moonside5 = 21,
	moonside6 = 22,
	moonside7 = 23,
	moonside8 = 24,
	moonside9 = 25,
	moonside10 = 26,
	moonside11 = 27,
	standardDoor7 = 28,
	standardDoorWhiteSlow = 29,
	standardDoorWhiteSlowSound = 30,
	ghostTunnel = 31,
	ghostTunnel2 = 32,
	hole2 = 33,
}
///
enum SurfaceFlags {
	none = 0,
	obscureLowerBody = 1<<0,
	obscureUpperBody = 1<<1,
	causesSunstroke = 1<<2,
	shallowWater = 1<<3,
	deepWater = shallowWater + causesSunstroke,
	ladderOrStairs = 1<<4,
	unknown1 = 1<<5,
	unknown2 = 1<<6,
	solid = 1<<7,
}
///
enum EntityOverlayFlags : ushort {
	none = 0, /// No special overlay
	unknown0 = 1 << 0, ///
	unknown1 = 1 << 1, ///
	unknown2 = 1 << 2, ///
	unknown3 = 1 << 3, ///
	unknown4 = 1 << 4, ///
	unknown5 = 1 << 5, ///
	unknown6 = 1 << 6, ///
	unknown7 = 1 << 7, ///
	unknown8 = 1 << 8, ///
	unknown9 = 1 << 9, ///
	unknown10 = 1 << 10, ///
	unknown11 = 1 << 11, ///
	unknown12 = 1 << 12, ///
	unknown13 = 1 << 13, ///
	mushroom = 1 << 14, ///
	sweating = 1 << 15, ///
}

auto printableFlags(SurfaceFlags flags) @safe pure {
	static struct Result {
		SurfaceFlags flags;
		void toString(W)(ref W writer) const {
			import std.format : formattedWrite;
			import std.range : chain, only, take;
			writer.formattedWrite!"%-(%s, %)"(chain(
				"Obscures lower body".only.take(flags & SurfaceFlags.obscureLowerBody),
				"Obscures upper body".only.take(flags & SurfaceFlags.obscureUpperBody),
				"Deep water".only.take((flags & SurfaceFlags.deepWater) == SurfaceFlags.deepWater),
				"Shallow water".only.take((flags & SurfaceFlags.deepWater) == SurfaceFlags.shallowWater),
				"Causes sunstroke".only.take((flags & SurfaceFlags.deepWater) == SurfaceFlags.causesSunstroke),
				"Ladder/stairs".only.take(flags & SurfaceFlags.ladderOrStairs),
				"unknown1".only.take(flags & SurfaceFlags.unknown1),
				"unknown2".only.take(flags & SurfaceFlags.unknown2),
				"Solid".only.take(flags & SurfaceFlags.solid),
				"None".only.take(flags == SurfaceFlags.none),
			));
		}
	}
	return Result(flags);
}
enum ShallowWaterSpeed = FixedPoint1616(0x8000, 0x0000); ///0.5x
enum DeepWaterSpeed = FixedPoint1616(0x547A, 0x0000); ///0.33x
enum SkipSandwichSpeed = FixedPoint1616(0x8000, 0x0001); ///1.5x
///
enum CC1C01Type {
	string = 0,
	integer = 0x80,
}
///
enum SpritemapOrientation {
	vertical = 0x80,
	horizontal = 0x40,
}
///
enum PSILevel {
	alpha = 1,
	beta = 2,
	gamma = 3,
	sigma = 4,
	omega = 5,
}
///
enum PSIID {
	rockin = 1,
	fire = 2,
	freeze = 3,
	thunder = 4,
	flash = 5,
	starstorm = 6,
	lifeup = 7,
	healing = 8,
	shield = 9,
	psiShield = 10,
	offenseUp = 11,
	defenseDown = 12,
	hypnosis = 13,
	magnet = 14,
	paralysis = 15,
	brainshock = 16,
	teleport = 17,
}
///
enum PSICategory {
	offense = 1,
	recover = 2,
	assist = 4,
	other = 8,
}
///
enum PSITarget {
	nobody = 1,
	enemies = 2,
	allies = 3,
}
///
enum PSITargetA {
	single = 0,
	row = 1,
	allEnemies = 2,
	random = 3,
}
///
enum ThingsToName {
	char1 = 0,
	char2 = 1,
	char3 = 2,
	char4 = 3,
	dog = 4,
	favoriteFood = 5,
	favoriteThing = 6,
}
///
enum MainMenuOptions {
	talkTo = 1,
	goods = 2,
	psi = 3,
	equip = 4,
	check = 5,
	status = 6,
}
///
enum EnemyGroup {
	testEnemies = 0,
	unknown001 = 1,
	unknown002 = 2,
	unknown003 = 3,
	unknown004 = 4,
	unknown005 = 5,
	unknown006 = 6,
	unknown007 = 7,
	unknown008 = 8,
	unknown009 = 9,
	unknown010 = 10,
	unknown011 = 11,
	unknown012 = 12,
	unknown013 = 13,
	unknown014 = 14,
	unknown015 = 15,
	unknown016 = 16,
	unknown017 = 17,
	unknown018 = 18,
	unknown019 = 19,
	unknown020 = 20,
	unknown021 = 21,
	unknown022 = 22,
	unknown023 = 23,
	unknown024 = 24,
	unknown025 = 25,
	unknown026 = 26,
	unknown027 = 27,
	unknown028 = 28,
	unknown029 = 29,
	unknown030 = 30,
	unknown031 = 31,
	unknown032 = 32,
	unknown033 = 33,
	unknown034 = 34,
	unknown035 = 35,
	unknown036 = 36,
	unknown037 = 37,
	unknown038 = 38,
	unknown039 = 39,
	unknown040 = 40,
	unknown041 = 41,
	unknown042 = 42,
	unknown043 = 43,
	unknown044 = 44,
	unknown045 = 45,
	unknown046 = 46,
	unknown047 = 47,
	unknown048 = 48,
	unknown049 = 49,
	unknown050 = 50,
	unknown051 = 51,
	unknown052 = 52,
	unknown053 = 53,
	unknown054 = 54,
	unknown055 = 55,
	unknown056 = 56,
	unknown057 = 57,
	unknown058 = 58,
	unknown059 = 59,
	unknown060 = 60,
	unknown061 = 61,
	unknown062 = 62,
	unknown063 = 63,
	unknown064 = 64,
	unknown065 = 65,
	unknown066 = 66,
	unknown067 = 67,
	unknown068 = 68,
	unknown069 = 69,
	unknown070 = 70,
	unknown071 = 71,
	unknown072 = 72,
	unknown073 = 73,
	unknown074 = 74,
	unknown075 = 75,
	unknown076 = 76,
	unknown077 = 77,
	unknown078 = 78,
	unknown079 = 79,
	unknown080 = 80,
	unknown081 = 81,
	unknown082 = 82,
	unknown083 = 83,
	unknown084 = 84,
	unknown085 = 85,
	unknown086 = 86,
	unknown087 = 87,
	unknown088 = 88,
	unknown089 = 89,
	unknown090 = 90,
	unknown091 = 91,
	unknown092 = 92,
	unknown093 = 93,
	unknown094 = 94,
	unknown095 = 95,
	unknown096 = 96,
	unknown097 = 97,
	unknown098 = 98,
	unknown099 = 99,
	unknown100 = 100,
	unknown101 = 101,
	unknown102 = 102,
	unknown103 = 103,
	unknown104 = 104,
	unknown105 = 105,
	unknown106 = 106,
	unknown107 = 107,
	unknown108 = 108,
	unknown109 = 109,
	unknown110 = 110,
	unknown111 = 111,
	unknown112 = 112,
	unknown113 = 113,
	unknown114 = 114,
	unknown115 = 115,
	unknown116 = 116,
	unknown117 = 117,
	unknown118 = 118,
	unknown119 = 119,
	unknown120 = 120,
	unknown121 = 121,
	unknown122 = 122,
	unknown123 = 123,
	unknown124 = 124,
	unknown125 = 125,
	unknown126 = 126,
	unknown127 = 127,
	unknown128 = 128,
	unknown129 = 129,
	unknown130 = 130,
	unknown131 = 131,
	unknown132 = 132,
	unknown133 = 133,
	unknown134 = 134,
	unknown135 = 135,
	unknown136 = 136,
	unknown137 = 137,
	unknown138 = 138,
	unknown139 = 139,
	unknown140 = 140,
	unknown141 = 141,
	unknown142 = 142,
	unknown143 = 143,
	unknown144 = 144,
	unknown145 = 145,
	unknown146 = 146,
	unknown147 = 147,
	unknown148 = 148,
	unknown149 = 149,
	unknown150 = 150,
	unknown151 = 151,
	unknown152 = 152,
	unknown153 = 153,
	unknown154 = 154,
	unknown155 = 155,
	unknown156 = 156,
	unknown157 = 157,
	unknown158 = 158,
	unknown159 = 159,
	unknown160 = 160,
	unknown161 = 161,
	unknown162 = 162,
	unknown163 = 163,
	unknown164 = 164,
	unknown165 = 165,
	unknown166 = 166,
	unknown167 = 167,
	unknown168 = 168,
	unknown169 = 169,
	unknown170 = 170,
	unknown171 = 171,
	unknown172 = 172,
	unknown173 = 173,
	unknown174 = 174,
	unknown175 = 175,
	unknown176 = 176,
	unknown177 = 177,
	unknown178 = 178,
	unknown179 = 179,
	unknown180 = 180,
	unknown181 = 181,
	unknown182 = 182,
	unknown183 = 183,
	unknown184 = 184,
	unknown185 = 185,
	unknown186 = 186,
	unknown187 = 187,
	unknown188 = 188,
	unknown189 = 189,
	unknown190 = 190,
	unknown191 = 191,
	unknown192 = 192,
	unknown193 = 193,
	unknown194 = 194,
	unknown195 = 195,
	unknown196 = 196,
	unknown197 = 197,
	unknown198 = 198,
	unknown199 = 199,
	unknown200 = 200,
	unknown201 = 201,
	unknown202 = 202,
	unknown203 = 203,
	unknown204 = 204,
	unknown205 = 205,
	unknown206 = 206,
	unknown207 = 207,
	unknown208 = 208,
	unknown209 = 209,
	unknown210 = 210,
	unknown211 = 211,
	unknown212 = 212,
	unknown213 = 213,
	unknown214 = 214,
	unknown215 = 215,
	unknown216 = 216,
	unknown217 = 217,
	unknown218 = 218,
	unknown219 = 219,
	unknown220 = 220,
	unknown221 = 221,
	unknown222 = 222,
	unknown223 = 223,
	unknown224 = 224,
	unknown225 = 225,
	unknown226 = 226,
	unknown227 = 227,
	unknown228 = 228,
	unknown229 = 229,
	unknown230 = 230,
	unknown231 = 231,
	unknown232 = 232,
	unknown233 = 233,
	unknown234 = 234,
	unknown235 = 235,
	unknown236 = 236,
	unknown237 = 237,
	unknown238 = 238,
	unknown239 = 239,
	unknown240 = 240,
	unknown241 = 241,
	unknown242 = 242,
	unknown243 = 243,
	unknown244 = 244,
	unknown245 = 245,
	unknown246 = 246,
	unknown247 = 247,
	unknown248 = 248,
	unknown249 = 249,
	unknown250 = 250,
	unknown251 = 251,
	unknown252 = 252,
	unknown253 = 253,
	unknown254 = 254,
	unknown255 = 255,
	unknown256 = 256,
	unknown257 = 257,
	unknown258 = 258,
	unknown259 = 259,
	unknown260 = 260,
	unknown261 = 261,
	unknown262 = 262,
	unknown263 = 263,
	unknown264 = 264,
	unknown265 = 265,
	unknown266 = 266,
	unknown267 = 267,
	unknown268 = 268,
	unknown269 = 269,
	unknown270 = 270,
	unknown271 = 271,
	unknown272 = 272,
	unknown273 = 273,
	unknown274 = 274,
	unknown275 = 275,
	unknown276 = 276,
	unknown277 = 277,
	unknown278 = 278,
	unknown279 = 279,
	unknown280 = 280,
	unknown281 = 281,
	unknown282 = 282,
	unknown283 = 283,
	unknown284 = 284,
	unknown285 = 285,
	unknown286 = 286,
	unknown287 = 287,
	unknown288 = 288,
	unknown289 = 289,
	unknown290 = 290,
	unknown291 = 291,
	unknown292 = 292,
	unknown293 = 293,
	unknown294 = 294,
	unknown295 = 295,
	unknown296 = 296,
	unknown297 = 297,
	unknown298 = 298,
	unknown299 = 299,
	unknown300 = 300,
	unknown301 = 301,
	unknown302 = 302,
	unknown303 = 303,
	unknown304 = 304,
	unknown305 = 305,
	unknown306 = 306,
	unknown307 = 307,
	unknown308 = 308,
	unknown309 = 309,
	unknown310 = 310,
	unknown311 = 311,
	unknown312 = 312,
	unknown313 = 313,
	unknown314 = 314,
	unknown315 = 315,
	unknown316 = 316,
	unknown317 = 317,
	unknown318 = 318,
	unknown319 = 319,
	unknown320 = 320,
	unknown321 = 321,
	unknown322 = 322,
	unknown323 = 323,
	unknown324 = 324,
	unknown325 = 325,
	unknown326 = 326,
	unknown327 = 327,
	unknown328 = 328,
	unknown329 = 329,
	unknown330 = 330,
	unknown331 = 331,
	unknown332 = 332,
	unknown333 = 333,
	unknown334 = 334,
	unknown335 = 335,
	unknown336 = 336,
	unknown337 = 337,
	unknown338 = 338,
	unknown339 = 339,
	unknown340 = 340,
	unknown341 = 341,
	unknown342 = 342,
	unknown343 = 343,
	unknown344 = 344,
	unknown345 = 345,
	unknown346 = 346,
	unknown347 = 347,
	unknown348 = 348,
	unknown349 = 349,
	unknown350 = 350,
	unknown351 = 351,
	unknown352 = 352,
	unknown353 = 353,
	unknown354 = 354,
	unknown355 = 355,
	unknown356 = 356,
	unknown357 = 357,
	unknown358 = 358,
	unknown359 = 359,
	unknown360 = 360,
	unknown361 = 361,
	unknown362 = 362,
	unknown363 = 363,
	unknown364 = 364,
	unknown365 = 365,
	unknown366 = 366,
	unknown367 = 367,
	unknown368 = 368,
	unknown369 = 369,
	unknown370 = 370,
	unknown371 = 371,
	unknown372 = 372,
	unknown373 = 373,
	unknown374 = 374,
	unknown375 = 375,
	unknown376 = 376,
	unknown377 = 377,
	unknown378 = 378,
	unknown379 = 379,
	unknown380 = 380,
	unknown381 = 381,
	unknown382 = 382,
	unknown383 = 383,
	unknown384 = 384,
	unknown385 = 385,
	unknown386 = 386,
	unknown387 = 387,
	unknown388 = 388,
	unknown389 = 389,
	unknown390 = 390,
	unknown391 = 391,
	unknown392 = 392,
	unknown393 = 393,
	unknown394 = 394,
	unknown395 = 395,
	unknown396 = 396,
	unknown397 = 397,
	unknown398 = 398,
	unknown399 = 399,
	unknown400 = 400,
	unknown401 = 401,
	unknown402 = 402,
	unknown403 = 403,
	unknown404 = 404,
	unknown405 = 405,
	unknown406 = 406,
	unknown407 = 407,
	unknown408 = 408,
	unknown409 = 409,
	unknown410 = 410,
	unknown411 = 411,
	unknown412 = 412,
	unknown413 = 413,
	unknown414 = 414,
	unknown415 = 415,
	unknown416 = 416,
	unknown417 = 417,
	unknown418 = 418,
	unknown419 = 419,
	unknown420 = 420,
	unknown421 = 421,
	unknown422 = 422,
	unknown423 = 423,
	unknown424 = 424,
	unknown425 = 425,
	unknown426 = 426,
	unknown427 = 427,
	unknown428 = 428,
	unknown429 = 429,
	unknown430 = 430,
	unknown431 = 431,
	unknown432 = 432,
	unknown433 = 433,
	unknown434 = 434,
	unknown435 = 435,
	unknown436 = 436,
	unknown437 = 437,
	unknown438 = 438,
	unknown439 = 439,
	unknown440 = 440,
	unknown441 = 441,
	unknown442 = 442,
	unknown443 = 443,
	unknown444 = 444,
	unknown445 = 445,
	unknown446 = 446,
	unknown447 = 447,
	bossFrank = 448,
	unknown449 = 449,
	unknown450 = 450,
	unknown451 = 451,
	unknown452 = 452,
	unknown453 = 453,
	unknown454 = 454,
	unknown455 = 455,
	unknown456 = 456,
	unknown457 = 457,
	unknown458 = 458,
	unknown459 = 459,
	unknown460 = 460,
	unknown461 = 461,
	unknown462 = 462,
	unknown463 = 463,
	unknown464 = 464,
	unknown465 = 465,
	unknown466 = 466,
	unknown467 = 467,
	unknown468 = 468,
	unknown469 = 469,
	unknown470 = 470,
	unknown471 = 471,
	unknown472 = 472,
	unknown473 = 473,
	unknown474 = 474,
	unknown475 = 475,
	bossGiygasPhase1 = 476,
	bossGiygasPhase2 = 477,
	bossGiygasPhaseDuringPrayer1 = 478,
	bossGiygasPhaseAfterPrayer1 = 479,
	bossGiygasPhaseAfterPrayer7 = 480,
	magicButterfly = 481,
	unknown482 = 482,
	bossGiygasPhaseFinal = 483,
}
///
enum PSIAnimationTarget {
	single = 0,
	row = 1,
	allEnemies = 2,
	random = 3,
}
///
enum BGLayer {
	layer1 = 1,
	layer2 = 2,
	layer3 = 3,
	layer4 = 4,
}
///
enum DistortionStyle {
	none = 0,
	horizontalSmooth = 1,
	horizontalInterlaced = 2,
	verticalSmooth = 3,
	unknown = 4,
}
///
enum PaletteShiftingStyle : ubyte {
	unknown0 = 0,
	unknown1 = 1,
	unknown2 = 2,
	unknown3 = 3,
}
///
enum ActionScriptVars : ubyte {
	v0 = 0,
	v1 = 1,
	v2 = 2,
	v3 = 3,
	v4 = 4,
	v5 = 5,
	v6 = 6,
	v7 = 7,
}
///
enum Binop : ubyte {
	and = 0,
	or = 1,
	add = 2,
	xor = 3,
}
enum StatusGroups {
	PersistentEasyHeal = 0,
	PersistentHardHeal = 1,
	Temporary = 2,
	Strangeness = 3,
	Concentration = 4,
	Homesickness = 5,
	Shield = 6,
}
///
enum AnimationFlags : ubyte {
	none = 0,
	unknown0 = 1 << 0,
	unknown1 = 1 << 1,
	unknown2 = 1 << 2,
	unknown3 = 1 << 3,
	unknown4 = 1 << 4,
	unknown5 = 1 << 5,
	unknown6 = 1 << 6,
	unknown7 = 1 << 7,
}
/// How much of the window graphics should be loaded to VRAM
enum WindowGraphicsToLoad {
	allButMeter = 0, /// loads everything except for HP/PP meter tiles and special text
	all = 1, /// Loads all window graphics
	all2 = 2, /// Same as all
}

enum BattleSide : ubyte{
	friends = 0,
	foes = 1,
}

enum DebugMode {
	none = 0,
	viewMap = 1,
	viewCharacter = 2,
	viewAttribute = 3,
	showBattle = 4,
	checkPosition = 5,
	soundMode = 6,
}

enum CameraMode {
	normal = 0,
	autoScroll = 1,
	followEntity = 2,
	unknown3 = 3,
}

enum MusicEffect {
	none = 0,
	normal = 1,
	quickFade = 2,
	normalFade = 3,
	null4 = 4,
	tempTempoBoost = 5,
	null6 = 6,
	tempQuieter = 7,
	tempLouder = 8,
	setVolPreset1 = 9,
	setVolPreset2 = 10,
	setVolPreset3 = 11,
	setVolPreset4 = 12,
	setVolPreset5 = 13,
	setVolPreset6 = 14,
	setVolPreset7 = 15,
	setVolPreset8 = 16,
	null17 = 17,
	null18 = 18,
	null19 = 19,
	null20 = 20,
	octaveUp = 21,
	restorePitch = 22,
	quieter = 23,
	louder = 24,
	chan7Loudest = 25,
	chan7Silent = 26,
	chan7Quieter = 27,
	chan7Quietest = 28,
	unknown29 = 29,
	unknown30 = 30,
	unknown31 = 31,
}

enum InteractionType {
	unknown0,
	unknown1,
	unknown2,
	unknown3,
	unknown4,
	unknown5,
	unknown6,
	unknown7,
	unknown8,
	unknown9,
	unknown10,
}

enum PaletteUpload {
	none = 0,
	halfFirst = 8 * 1,
	halfSecond = 8 * 2,
	full = 8 * 3
}

///
enum WarpPreset {
	invalid, // 0/$0
	debugWarp, // 1/$1
	FOUR_HOTEL, // 2/$2
	monotoliBuildingLobby, // 3/$3
	monotoliBuildingFloor47Elevator1, // 4/$4
	monotoliBuildingFloor47Elevator2, // 5/$5
	monotoliBuildingFloor48, // 6/$6
	MOON_FIELD_SOMEWHERE, // 7/$7
	MOON_HOSPITAL, // 8/$8
	MOON_ROOM, // 9/$9
	MYHOME, // 10/$A
	ONET_HOTEL, // 11/$B
	SKRB_FORTUNETELLER, // 12/$C
	SKRB_HOTEL, // 13/$D
	SUMS_HOTEL, // 14/$E
	THRK_GHOSTTUNNEL_L, // 15/$F
	THRK_GHOSTTUNNEL_R, // 16/$10
	THRK_HOTEL, // 17/$11
	TWSN_GHOSTTUNNEL, // 18/$12
	TWSN_HOTEL, // 19/$13
	DEBUG_FOUR, // 20/$14
	DEBUG_GRFD, // 21/$15
	DEBUG_GUMI, // 22/$16
	DEBUG_MGKT, // 23/$17
	DEBUG_MOON, // 24/$18
	DEBUG_ONET, // 25/$19
	DEBUG_PAST, // 26/$1A
	DEBUG_RAMA, // 27/$1B
	DEBUG_THRK, // 28/$1C
	DEBUG_TWSN, // 29/$1D
	DEBUG_WINS, // 30/$1E
	DEBUG_SUMS, // 31/$1F
	DEBUG_SKRB, // 32/$20
	DEBUG_DKFD, // 33/$21
	PAULASTAR_BED, // 34/$22
	PSYCHO_MYHOME_ROAD, // 35/$23
	PSYCHO_MYHOME_1F_E, // 36/$24
	PSYCHO_MYHOME_PASS_W, // 37/$25
	PSYCHO_MYHOME_NES_W, // 38/$26
	HAPPY_BED, // 39/$27
	MGKT_DOKAN_MGKT, // 40/$28
	DBGEVT_55, // 41/$29
	desertMineOOB, // 42/$2A
	YADOYA_DSRT, // 43/$2B
	YADOYA_DSRT_SHIGE, // 44/$2C
	WINS_TENT_FRIEND, // 45/$2D
	WINS_TENT_TASSI, // 46/$2E
	WINS_LIFEUP_BRICK, // 47/$2F
	HOTEL_DOSEI, // 48/$30
	YADOYA_MAKYO, // 49/$31
	YADOYA_GUMI, // 50/$32
	RAMA_147, // 51/$33
	MGKT_MAMA, // 52/$34
	YADOYA_MGKT, // 53/$35
	YADOYA_DKFD, // 54/$36
	DMAN_BENCH_1, // 55/$37
	DMAN_BENCH_2, // 56/$38
	DMAN_BENCH_3, // 57/$39
	DMAN_BENCH_4, // 58/$3A
	DKFD_START, // 59/$3B
	BUS_TWSN_TUNNEL, // 60/$3C
	BUS_TUNNEL_TWSN, // 61/$3D
	BUS_THRK_TUNNEL_L, // 62/$3E
	BUS_TUNNEL_THRK_R, // 63/$3F
	ONET_MAYOR_2F_1F, // 64/$40
	TWSN_CHAOS_HALL_BACKS, // 65/$41
	WINS_JEFF_START, // 66/$42
	ONET_POLICE_F_P, // 67/$43
	ONET_POLICE_P_G, // 68/$44
	BUS_TUNNEL_THRK_L, // 69/$45
	BUS_THRK_TUNNEL_R, // 70/$46
	BUS_DSRT_TUNNEL_L, // 71/$47
	BUS_TUNNEL_DSRT_R, // 72/$48
	BUS_TUNNEL_DSRT_L, // 73/$49
	BUS_DSRT_TUNNEL_R, // 74/$4A
	BUS_FOUR_TUNNEL, // 75/$4B
	BUS_TUNNEL_FOUR, // 76/$4C
	SKYW_THRK_KATACOMB, // 77/$4D
	SKYW_THRK_SUMS, // 78/$4E
	RAMA_START, // 79/$4F
	DBGEVT_58, // 80/$50
	PUBLIC_BLACKSCREEN, // 81/$51
	moonsideManiManiStatue, // 82/$52
	dungeonManEntrance, // 83/$53
	wintersCaveAfterRope, // 84/$54
	foursideBusStop, // 85/$55
	twosonBusStop, // 86/$56
	FOUR_47_POKEY_P, // 87/$57
	onettPoliceCaptain, // 88/$58
	SHIP_TOTO_SKRB_MINI, // 89/$59
	SHIP_TOTO_SKRB, // 90/$5A
	SUBMARINE_START, // 91/$5B
	SUBMARINE_END, // 92/$5C
	ST3_PAST, // 93/$5D
	ST2_DKFD, // 94/$5E
	THRK_ZOMBI_A, // 95/$5F
	THRK_ZOMBI_B, // 96/$60
	THRK_ZOMBI_C, // 97/$61
	THRK_ZOMBI_D, // 98/$62
	THRK_ZOMBI_E, // 99/$63
	GPFT_FIELD_GEPPU, // 100/$64
	PU_RAMA_SUMS, // 101/$65
	scarabaHotelBed, // 102/$66
	monotoliBuildingEntrance, // 103/$67
	DKFD_ST3_START, // 104/$68
	HAPY_USHI, // 105/$69
	MOON_B, // 106/$6A
	MOON_S, // 107/$6B
	MOON_T, // 108/$6C
	MOON_U, // 109/$6D - unused
	MOON_V, // 110/$6E - unused
	MOON_W, // 111/$6F
	MOON_X, // 112/$70
	MOON_Y, // 113/$71
	MOON_Z, // 114/$72
	DBGEVT_01, // 115/$73
	DBGEVT_02, // 116/$74
	DBGEVT_03, // 117/$75
	DBGEVT_05, // 118/$76
	DBGEVT_06, // 119/$77
	DBGEVT_07, // 120/$78
	DBGEVT_08, // 121/$79
	DBGEVT_09, // 122/$7A
	DBGEVT_10, // 123/$7B
	DBGEVT_11, // 124/$7C - unused
	DBGEVT_12, // 125/$7D
	DBGEVT_13, // 126/$7E
	DBGEVT_14, // 127/$7F
	DBGEVT_15, // 128/$80
	DBGEVT_16, // 129/$81
	DBGEVT_17, // 130/$82
	DBGEVT_18, // 131/$83
	DBGEVT_19, // 132/$84
	DBGEVT_20, // 133/$85
	DBGEVT_21, // 134/$86
	DBGEVT_22, // 135/$87
	DBGEVT_23, // 136/$88
	DBGEVT_24, // 137/$89
	DBGEVT_25, // 138/$8A
	DBGEVT_26, // 139/$8B
	DBGEVT_27, // 140/$8C
	DBGEVT_28, // 141/$8D
	DBGEVT_29, // 142/$8E
	DBGEVT_30, // 143/$8F
	DBGEVT_32, // 144/$90
	DBGEVT_33, // 145/$91
	DBGEVT_34, // 146/$92
	DBGEVT_35, // 147/$93
	DBGEVT_36, // 148/$94
	DBGEVT_37, // 149/$95
	INSEKI_B, // 150/$96
	INSEKI_C, // 151/$97
	home, // 152/$98 - unused
	MOON_ENTERANCE, // 153/$99
	FOUR_BRGS_WAREHOUSE, // 154/$9A
	jackiesCafeMoonsideExit, // 155/$9B
	unknown156, // 156/$9C
	jackiesCafeOOB, // 157/$9D
	FIRE_PARTY, // 158/$9E
	SKRB_DMAN_BODY, // 159/$9F
	THRK_MATENT, // 160/$A0
	MGKT_START, // 161/$A1
	MOON_HOTEL, // 162/$A2
	dungeonManOutside, // 163/$A3
	dungeonManStuck, // 164/$A4
	clumsyRobot, // 165/$A5
	DBGEVT_38, // 166/$A6
	DBGEVT_39, // 167/$A7
	DBGEVT_41, // 168/$A8
	DBGEVT_42, // 169/$A9
	DBGEVT_43, // 170/$AA
	DBGEVT_44, // 171/$AB
	DBGEVT_45, // 172/$AC
	DBGEVT_46, // 173/$AD
	DEMO_1, // 174/$AE
	DEMO_2, // 175/$AF
	DEMO_3, // 176/$B0
	DEMO_4, // 177/$B1
	DEMO_5, // 178/$B2
	DEMO_6, // 179/$B3
	DEMO_7, // 180/$B4
	DEMO_8, // 181/$B5
	DEMO_9, // 182/$B6
	DEMO_10, // 183/$B7
	DBGEVT_47, // 184/$B8
	DEBUG_HH, // 185/$B9
	SKYW_WINS_A, // 186/$BA
	SKYW_SKY_A, // 187/$BB
	SKYW_SKY_B, // 188/$BC
	SKYW_FOUR_A, // 189/$BD
	SKYW_FOUR_B, // 190/$BE
	SKYW_DSRT_A, // 191/$BF
	SKYW_DSRT_B, // 192/$C0
	SKYW_THRK_A, // 193/$C1
	SKYW_THRK_B, // 194/$C2
	SKYW_SUMS_A, // 195/$C3
	MYHOME_2ND, // 196/$C4
	MGKT_BACK_LLPT, // 197/$C5
	MGKT_BACK_MLKY, // 198/$C6
	MGKT_BACK_PINK, // 199/$C7
	WINS_PANNING1, // 200/$C8
	WINS_PANNING2, // 201/$C9
	RAMA_PANNING1, // 202/$CA
	RAMA_PANNING2, // 203/$CB
	threedOutsideHotel, // 204/$CC
	threedGraveyardEntrance, // 205/$CD
	BUS_TUNNEL_HWAY_R, // 206/$CE
	BUS_HWAY_TUNNEL_R, // 207/$CF
	BUS_TUNNEL_BRDG_R, // 208/$D0
	BUS_BRDG_TUNNEL_R, // 209/$D1
	BUS_TUNNEL_BRDG_L, // 210/$D2
	BUS_BRDG_TUNNEL_L, // 211/$D3
	BUS_TUNNEL_HWAY_L, // 212/$D4
	BUS_HWAY_TUNNEL_L, // 213/$D5
	MGKT_EDEN, // 214/$D6
	PAST_RETURN, // 215/$D7
	DOSE_RETURN, // 216/$D8
	andonutLabsSkyrunner, // 217/$D9
	WINS_LABO, // 218/$DA
	onettBurgerShop, // 219/$DB
	onettBurgerShopOutside, // 220/$DC
	EVT_INORU_MYHOME, // 221/$DD
	EVT_INORU_SUMMERS, // 222/$DE
	EVT_INORU_POLASTAR, // 223/$DF
	EVT_INORU_DORMITORY, // 224/$E0
	EVT_ENDING_PHOTO, // 225/$E1
	EVT_INORU_RAMMA, // 226/$E2
	EVT_INORU_BURGER, // 227/$E3
	onettBurgerShopOutsideInRoad, // 228/$E4
	EVT_INORU_DOSEI, // 229/$E5
	TWSN_CHAOS_HALL, // 230/$E6
	GUMI_MUKUCHI, // 231/$E7
	WARP_MOON_XX, // 232/$E8
	invalid2, // 233/$E9
}

///
enum PartyStatus {
	normal = 0,
	burnt = 1,
	unknown2 = 2,
	speedBoost = 3,
}
///
enum HotspotID {
	unknown00 = 0, ///
	RAMA_MU_A = 1, ///
	unknown02 = 2, ///
	TWSN_TONZURABUS = 3, ///
	unknown04 = 4, ///
	unknown05 = 5, ///
	DSRT_CLEAR = 6, ///
	DKFD_ST3_A = 7, ///
	DKFD_ST3_B = 8, ///
	SKRB_DM_HAMARI = 9, ///
	FOUR_DEPT_1 = 10, ///
	FOUR_DEPT_2 = 11, ///
	FOUR_DEPT_3 = 12, ///
	FOUR_DEPT_4 = 13, ///
	unknown14 = 14, ///
	ONET_BUNBUN = 15, ///
	SKRB_MABOROSHI = 16, ///
	PHOTO_2_FRANK = 17, ///
	unknown18 = 18, ///
	unknown19 = 19, ///
	LAST_POLA_3 = 20, ///
	unknown21 = 21, ///
	LAST_POLA_5 = 22, ///
	unknown23 = 23, ///
	unknown24 = 24, ///
	unknown25 = 25, ///
	unknown26 = 26, ///
	unknown27 = 27, ///
	unknown28 = 28, ///
	unknown29 = 29, ///
	unknown30 = 30, ///
	unknown31 = 31, ///
	MOON_A = 32, ///
	MOON_B = 33, ///
	MOON_C = 34, ///
	MOON_D1 = 35, ///
	MOON_D2 = 36, ///
	MOON_E1 = 37, ///
	MOON_E2 = 38, ///
	WINS_TASSI_OFF = 39, ///
	FOUR_MUSEUM = 40, ///
	MABOROSHI_2 = 41, ///
	BUNBUN_DEATH = 42, ///
	unknown43 = 43, ///
	unknown44 = 44, ///
	unknown45 = 45, ///
	unknown46 = 46, ///
	INSEKI_STARMAN = 47, ///
	WINS_GUM = 48, ///
	SUMS_OMAR = 49, ///
	SUMS_MUSEUM = 50, ///
	PHONE_MONO_A = 51, ///
	PHONE_MONO_B = 52, ///
	unknown53 = 53, ///
	THRK_HOIHOI = 54, ///
	unknown55 = 55, ///
}
///
enum Swirl {
	none = 0, ///
	battleStart = 1, ///
	giygasAttack = 2, ///
	bossBattleStart = 3, ///
	unknown4 = 4, ///
	enemyAttack = 5, ///
	unknown6 = 6, ///
}

enum BGMode {
	mode0 = 0,
	mode1 = 1,
	mode2 = 2,
	mode3 = 3,
	mode4 = 4,
	mode5 = 5,
	mode6 = 6,
	mode7 = 7,
}

enum BG3Priority = 8;

enum LayerConfig {
	allButBG4 = 0,
	all = 1,
	ColourBackdropBG4Add = 2,
	ColourBackdropBG4AddAvg = 3,
	ColourBackdropBG4Sub = 4,
	ColourBackdropBG4SubAvg = 5,
	ColourBackdropBG2Add = 6,
	ColourBackdropBG2AddAvg = 7,
	ColourBackdropBG2Sub = 8,
	ColourBackdropBG2SubAvg = 9,
}

enum EnemyMovementFlags {
	canMoveInWater = 1 << 0,
	canMoveInHeat = 1 << 1,
	canMoveOnLand = 1 << 2,
}

///
enum SoundStonePlaybackState {
	notPresent = 0,
	present = 1,
	nowPlaying = 2,
}

///
enum ObjFX {
	none = 0,
	showNone = 1,
	showBlink = 2,
	showHStripe = 3,
	showVStripe = 4,
	showDots = 5,
	hideNone = 6,
	hideBlink = 7,
	hideHStripe = 8,
	hideVStripe = 9,
	hideDots = 10,
}

///
enum FadeStyle {
	none = 0,
	blink = 1,
	hStripe = 2,
	vStripe = 3,
	dots = 4,
}

///
enum EntitySize {
	_8x16 = 0,
	_16x16 = 1,
	_24x16 = 2,
	_32x16 = 3,
	_48x16 = 4,
	_16x24 = 5,
	_24x24 = 6,
	_16x32 = 7,
	_32x24 = 8,
	_48x32 = 9,
	_24x48 = 10,
	_16x48 = 11,
	_32x48 = 12,
	_48x48 = 13,
	_64x48 = 14,
	_64x64 = 15,
	_64x80 = 16,
}

///
enum TeleportState {
	inProgress = 0,
	complete = 1,
	failed = 2,
	unknown3 = 3,
}
///
enum BattleResult {
	won = 0,
	lost = 1,
	teleported = 2,
}
///
enum SpecialDefeat {
	none = 0,
	teleported = 1,
	bossDefeated = 2,
	giygasDefeated = 3,
}
///
enum BattleMenuOptions {
	none = 0,
	attack = 1,
	goods = 2,
	autoFight = 3,
	spyPSI = 4,
	defend = 5,
	runAway = 6,
	prayMirror = 7,
}
///
enum Row {
	front = 0,
	back = 1,
}
///
enum DrawPriority {
	dontClearIfParent = 0x4000,
	parent = 0x8000,
}
///
enum DemoRecordingFlags {
	playbackEnabled = 0x4000,
	recordingEnabled = 0x8000,
}
///
enum StairDirection {
	upLeft = 0x000,
	upRight = 0x100,
	downLeft = 0x200,
	downRight = 0x300,
}

///
struct GameState {
	version(Have_siryul) {
		import siryul : Skip;
		alias skip = Skip;
	} else {
		enum skip = 0;
	}
	ubyte[12] mother2PlayerName; ///
	ubyte[24] earthboundPlayerName; ///
	ubyte[6] petName; ///
	ubyte[6] favouriteFood; ///
	ubyte[12] favouriteThing; ///
	int moneyCarried; ///
	int bankBalance; ///
	ubyte partyPSI; ///
	ubyte[2] partyNPCs; ///
	ushort[2] partyNPCHP; ///
	ubyte partyStatus; ///
	ubyte partyNPC1Copy; ///
	ubyte partyNPC2Copy; ///
	ushort partyNPC1HPCopy; ///
	ushort partyNPC2HPCopy; ///
	uint walletBackup; ///
	ubyte[36] escargoExpressItems; ///
	ubyte[6] partyMembers; ///
	FixedPoint1616 leaderX; ///
	FixedPoint1616 leaderY; ///
	ushort leaderPositionIndex; ///
	ushort leaderDirection; ///
	ushort troddenTileType; ///
	ushort walkingStyle; ///
	ushort leaderHasMoved; ///
	ushort specialGameState; ///
	ushort firstPartyMemberEntity; ///
	ubyte[6] partyMemberIndex; ///
	ubyte[6] playerControlledPartyMembers; ///
	ubyte[12] partyEntities; ///
	ubyte partyCount; ///
	ubyte playerControlledPartyMemberCount; ///
	ushort cameraMode; ///
	ushort autoScrollFrames; ///
	ushort autoScrollOriginalWalkingStyle; ///
	ubyte[3] deliveryQueueItem; ///
	ubyte[3] deliveryQueueCharacter; ///
	ubyte autoFightEnable; ///
	ushort exitMouseXCoordinate; ///
	ushort exitMouseYCoordinate; ///
	ubyte textSpeed; ///
	ubyte soundSetting; ///
	ubyte unknownC3; ///
	uint moneyEarnedSinceLastCall; ///
	ubyte[2] activeHotspotModes; ///
	ubyte[2] activeHotspotIDs; ///
	@skip const(ubyte)*[2] activeHotspotPointers; ///
	PhotoState[32] savedPhotoStates; ///
	uint timer; ///
	ubyte textFlavour = 1; ///
}
///
struct PartyCharacter {
	static if (jpn) {
		ubyte[4] name; ///
	} else {
		ubyte[5] name; ///
	}
	ubyte level; ///
	uint exp; ///
	ushort maxHP; ///
	ushort maxPP; ///
	ubyte[afflictionGroupCount] afflictions; ///
	ubyte offense; ///
	ubyte defense; ///
	ubyte speed; ///
	ubyte guts; ///
	ubyte luck; ///
	ubyte vitality; ///
	ubyte iq; ///
	ubyte baseOffense; ///
	ubyte baseDefense; ///
	ubyte baseSpeed; ///
	ubyte baseGuts; ///
	ubyte baseLuck; ///
	ubyte baseVitality; ///
	ubyte baseIQ; ///
	ubyte[14] items; ///
	ubyte[4] equipment; ///
	ushort characterID; ///
	ushort unknown55; ///
	ushort unknown57; ///
	ushort unknown59; ///
	ushort positionIndex; ///
	ushort unknown63; ///
	ushort unknown65; ///
	RollingStat hp; ///
	RollingStat pp; ///
	ushort hpPPWindowOptions; ///
	ubyte missRate; ///
	ubyte fireResist; ///
	ubyte freezeResist; ///
	ubyte flashResist; ///
	ubyte paralysisResist; ///
	ubyte hypnosisBrainshockResist; ///
	ubyte boostedSpeed; ///
	ubyte boostedGuts; ///
	ubyte boostedVitality; ///
	ubyte boostedIQ; ///
	ubyte boostedLuck; ///
	short unknown92; /// unused? always -1
	ubyte isAutoHealed; ///
}
///
struct RollingStat {
	FixedPoint1616 current; ///
	ushort target; ///
}
///
struct PhotoState {
	ushort unknown; ///
	ubyte[6] partyMembers; ///
}
///
struct WinStat {
	short next; /// [00]
	short prev; /// [02]
	short windowID; /// [04]
	short x; /// [06]
	short y; /// [08]
	short width; /// [0A]
	short height; /// [0C]
	short textX; /// [0E]
	short textY; /// [10]
	ubyte numPadding; /// [12]
	ushort tileAttributes; /// [13]
	short font; /// [15]
	WorkingMemory result; /// [17]
	uint argument; /// [1B]
	ushort counter; /// [1F]
	WorkingMemory resultBak; /// [21]
	uint argumentBak; /// [25]
	ushort counterBak; /// [29]
	short currentOption; /// [2B]
	short optionCount; /// [2D]
	short selectedOption; /// [2F]
	short menuColumns; /// [31]
	short menuPage; /// [33]
	ushort* tilemapBuffer; /// [35] 16-bit pointer
	void function(short) menuCallback; /// [37] 32-bit pointer
	ubyte titleID; /// [3B]
	ubyte[32] title; /// [3C]
}
///
struct MenuOpt {
	short field00; /// [00]
	short next; /// [02]
	short prev; /// [04]
	short page; /// [06]
	short textX; /// [08]
	short textY; /// [0A]
	short userdata; /// [0C]
	ubyte sfx; /// [0E]
	string script; /// [0F]
	ubyte[25] label; /// [13]
	ubyte pixelAlign; /// [2C]
}
///
struct VecYX {
	short y; ///
	short x; ///
}
///
struct Pather {
	short fromOffscreen; /// [00] Starts off-screen flag
	VecYX hitbox; /// [02] ??? some sort of hitbox??? (Old notes, I have no idea why I labeled this "hitbox")
	VecYX origin; /// [06] Origin point in the collision map?
	short field0A; /// [0A] ??? unknown index
	VecYX* points; /// [0C] Goal points
	short pointCount; /// [0E] Amount of goal points
	short objIndex; /// [10] Object index
}
///
struct PathCtx {
	ubyte[120] unknown0; ///unused??
	VecYX radius; /// [78] Pathfinder radius
	VecYX[8] targetsPos; /// [7C] Positions for all targets (row, col)
	short targetCount; /// [9C] Amount of targets
	short patherCount; /// [9E] Amount of pathers
	Pather[8] pathers; /// [A0] Data for all pathers
}
///
struct PlayerPositionBufferEntry {
	short xCoord; ///
	short yCoord; ///
	short tileFlags; ///
	short walkingStyle; ///
	short direction; ///
	short unknown10; ///
}
///
struct MovementSpeeds {
	union {
		struct {
			FixedPoint1616 up; ///0
			FixedPoint1616 upRight; ///4
			FixedPoint1616 right; ///8
			FixedPoint1616 downRight; ///12
			FixedPoint1616 down; ///16
			FixedPoint1616 downLeft; ///20
			FixedPoint1616 left; ///24
			FixedPoint1616 upLeft; ///28
		}
		FixedPoint1616[8] directionSpeeds; ///
	}
}
///
union QueuedInteractionPtr {
	const(ubyte)* textPtr; ///
	const(DoorEntryA)* doorPtr; ///
}
///
struct QueuedInteraction {
	ushort type; ///0
	QueuedInteractionPtr ptr; ///2
}
///
struct SpriteGrouping {
	ubyte height; ///
	ubyte width; ///
	ubyte size; ///
	ubyte spritemapFlags; ///
	ubyte hitboxWidthUD; ///
	ubyte hitboxHeightUD; ///
	ubyte hitboxWidthLR; ///
	ubyte hitboxHeightLR; ///
	ubyte spriteBank; ///
	OverworldSpriteGraphics[] sprites; ///
}
///
struct OverworldSpriteGraphics {
	size_t id; ///
	ubyte lsb; ///
}
///
struct Battler {
	short id; ///0
	ubyte sprite; ///2
	ubyte unknown3; ///3
	ushort currentAction; ///4
	ubyte actionOrderVar; ///6
	ubyte actionItemSlot; ///7
	ubyte currentActionArgument; ///8
	// used for retargetting
	ubyte actionTargetting; ///9
	ubyte currentTarget; ///10
	ubyte theFlag; ///11
	ubyte consciousness; ///12
	ubyte hasTakenTurn; ///13
	BattleSide side; ///14
	ubyte npcID; ///15
	ubyte row; ///16
	ushort hp; ///17
	ushort hpTarget; ///19
	ushort hpMax; ///21
	ushort pp; ///23
	ushort ppTarget; ///25
	ushort ppMax; ///27
	ubyte[afflictionGroupCount] afflictions; ///29
	ubyte guarding; ///36
	ubyte shieldHP; ///37
	ushort offense; ///
	ushort defense; ///
	ushort speed; ///
	ushort guts; ///
	ushort luck; ///
	ubyte vitality; ///
	ubyte iq; ///
	ubyte baseOffense; ///
	ubyte baseDefense; ///
	ubyte baseSpeed; ///
	ubyte baseGuts; ///
	ubyte baseLuck; ///
	ubyte paralysisResist; ///
	ubyte freezeResist; ///
	ubyte flashResist; ///
	ubyte fireResist; ///
	ubyte brainshockResist; ///
	ubyte hypnosisResist; ///
	ushort money; ///
	uint exp; ///
	ubyte vramSpriteIndex; ///
	ubyte spriteX; ///
	ubyte spriteY; ///
	ubyte initiative; ///
	ubyte unknown71; ///
	ubyte unknown72; ///
	ubyte unknown73; ///
	ubyte isFlashing; ///
	ubyte useAltSpritemap; ///
	ubyte unknown76; ///
	ubyte id2; ///
}
///
struct TextWindowPropertiesEntry {
	ushort offset; ///
	ubyte unknown; ///
}
///
align(1) struct RGB {
	align(1):
	ushort bgr555; ///
	///
	this(ushort red, ushort green, ushort blue) @safe pure {
		bgr555 = (red & 0x1F) | ((green & 0x1F) << 5) | ((blue & 0x1F) << 10);
	}
	this(ushort value) @safe pure {
		bgr555 = value;
	}
	ubyte red() const @safe pure {
		return bgr555 & 0x1F;
	}
	ubyte green() const @safe pure {
		return (bgr555 >> 5) & 0x1F;
	}
	ubyte blue() const @safe pure {
		return (bgr555 >> 10) & 0x1F;
	}
	void red(ubyte v) @safe pure {
		import earthbound.hardware : BGR555Mask;
		bgr555 = (bgr555 & (BGR555Mask.Green | BGR555Mask.Blue)) | v & 0x1F;
	}
	void green(ubyte v) @safe pure {
		import earthbound.hardware : BGR555Mask;
		bgr555 = (bgr555 & (BGR555Mask.Red | BGR555Mask.Blue)) | (v & 0x1F) << 5;
	}
	void blue(ubyte v) @safe pure {
		import earthbound.hardware : BGR555Mask;
		bgr555 = (bgr555 & (BGR555Mask.Red | BGR555Mask.Green)) | (v & 0x1F) << 10;
	}
}
///
struct TimedItemTransformation {
	ubyte item; ///
	ubyte sfx; ///
	ubyte sfxFrequency; ///
	ubyte targetItem; ///
	ubyte transformationTime; ///
}
///
struct LoadedItemTransformation {
	ubyte sfx; ///
	ubyte sfxFrequency; ///
	ubyte sfxCountdown; ///
	ubyte transformationCountdown; ///
}
///
struct DemoEntry {
	ubyte frames; ///
	ushort padState; ///
}
///
union FixedPoint1616 {
	import std.traits : isFloatingPoint;
	struct {
		ushort fraction; ///
		short integer; ///
	}
	int combined; ///
	//for debugging
	///
	double asDouble() const {
		return cast(double)cast(int)combined / 65536.0;
	}
	void opAssign(T)(T value) if (isFloatingPoint!T) {
		combined = cast(uint)(65536 * value);
	}
	double toSiryulType()() const {
		return asDouble();
	}
	static FixedPoint1616 fromSiryulType()(double val) {
		FixedPoint1616 result = val;
		return result;
	}
}
///
struct OverworldTask {
	ushort framesLeft; ///
	void function() func; ///
}
///
struct TimedDelivery {
	ushort spriteID; ///0
	ushort eventFlag; ///2
	short unknown4; ///4
	short unknown6; ///6
	ushort deliveryTime; ///8
	string textPointer1; ///10
	string textPointer2; ///13
	short unknown18; ///16
	short unknown20; ///18
}
///
union ItemParameters {
	byte[4] raw; ///
	struct {
		byte strength; ///
		byte epi; ///
		ubyte ep; ///
		ubyte special; ///
	}
}
///
struct Item {
	ubyte[25] name; ///
	ubyte type; ///
	ushort cost; ///
	ubyte flags; ///
	ushort battleAction; ///
	ItemParameters parameters; ///
	string helpText; ///
	///
	this(ubyte[25] name, ubyte type, ushort cost, ubyte flags, ushort battleAction, byte parameter1, byte parameter2, ubyte parameter3, ubyte parameter4, string helpText ) {
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
///
struct CondimentTableEntry {
	ubyte item; ///
	ubyte[2] goodCondiments; ///
	ItemParameters parameters; ///
	///
	this(ubyte item, ubyte[2] goodCondiments, byte parameter1, byte parameter2, ubyte parameter3, ubyte parameter4 ) {
		this.item = item;
		this.goodCondiments = goodCondiments;
		this.parameters.strength = parameter1;
		this.parameters.epi = parameter2;
		this.parameters.ep = parameter3;
		this.parameters.special = parameter4;
	}
}
///
struct WindowTextAttributesCopy {
	short id; ///
	short textX; ///
	short textY; ///
	ubyte numberPadding; ///
	short currTileAttributes; ///
	short font; ///
	ubyte[10] unknown11; ///
}
///
struct DMAQueueEntry {
	ubyte mode; ///
	ushort size; ///
	const(void)* source; ///
	ushort destination; ///
}
///
struct DMATableEntry {
	ubyte unknown0; ///
	ubyte unknown1; ///
	ubyte unknown2; ///
}
///
struct SRAM {
	SaveBlock[6] saves; ///
	ubyte[0x1FE] unknown; ///
	ushort signature; ///
}
///
struct SaveBlock {
	char[28] signature; ///
	ushort checksum; ///
	ushort checksumComplement; ///
	union {
		SaveData saveData; ///
		ubyte[SaveData.sizeof] rawData; ///
	}
}
///
struct SaveData {
	GameState gameState; ///
	PartyCharacter[6] partyCharacters; ///
	ubyte[eventFlagCount / 8] eventFlags; ///
}
///
struct SaveDataReplay {
	GameState gameState; ///
	PartyCharacter[6] partyCharacters; ///
	ubyte[eventFlagCount / 8] eventFlags; ///
	uint timer; ///
}
///
struct FontConfig {
	ubyte dataID; ///
	ubyte graphicsID; ///
	ushort height; ///
	ushort width; ///
}
struct Money {
	uint val;
}
///
struct NPC {
	ubyte type; ///
	ushort sprite; ///
	ubyte direction; ///
	ushort actionScript; ///
	ushort eventFlag; ///
	ubyte appearanceStyle; ///
	string talkText; ///
	union {
		string checkText; ///
		uint item; ///
	}
	///
	this(ubyte t, ushort s, ubyte d, ushort as, ushort ef, ubyte ast, string tt, string ct) {
		type = t;
		sprite = s;
		direction = d;
		actionScript = as;
		eventFlag = ef;
		appearanceStyle = ast;
		talkText = tt;
		checkText = ct;
	}
	///
	this(ubyte t, ushort s, ubyte d, ushort as, ushort ef, ubyte ast, string tt, uint se) {
		type = t;
		sprite = s;
		direction = d;
		actionScript = as;
		eventFlag = ef;
		appearanceStyle = ast;
		talkText = tt;
		item = se;
	}
	///
	this(ubyte t, ushort s, ubyte d, ushort as, ushort ef, ubyte ast, string tt, Money money) {
		type = t;
		sprite = s;
		direction = d;
		actionScript = as;
		eventFlag = ef;
		appearanceStyle = ast;
		talkText = tt;
		item = money.val + 0x100;
	}
}
///
struct SpriteMapTemplates {
	ubyte count; ///
	ubyte unknown1; ///
	SpriteMap[2][] spriteMapTemplates; ///
}
///
struct UnknownC42B0DSubEntry {
	ubyte unknown0; ///
	ubyte unknown1; ///
	ubyte unknown2; ///
	ubyte unknown3; ///
	ubyte unknown4; ///
}

///
struct CharacterInitialEntityDataEntry {
	ushort overworldSprite; ///
	ushort lostUnderworldSprite; ///
	ushort actionScript; ///
	ushort unknown6; ///
}
///
struct AnimatedBackground {
	ubyte graphics; ///
	ubyte palette; ///
	ubyte bitsPerPixel; ///
	PaletteShiftingStyle paletteShiftingStyle; ///
	ubyte paletteCycle1First; ///
	ubyte paletteCycle1Last; ///
	ubyte paletteCycle2First; ///
	ubyte paletteCycle2Last; ///
	ubyte paletteChangeSpeed; ///
	ubyte[4] scrollingMovements; ///
	ubyte[4] distortionStyles; ///
}
///
struct LoadedBackgroundData {
	ubyte targetLayer; ///0
	ubyte bitDepth; ///1
	ubyte freezePaletteScrolling; ///2
	PaletteShiftingStyle paletteShiftingStyle; ///3
	ubyte paletteCycle1First; ///4
	ubyte paletteCycle1Last; ///5
	ubyte paletteCycle2First; ///6
	ubyte paletteCycle2Last; ///7
	ubyte paletteCycle1Step; ///8
	ubyte paletteCycle2Step; ///9
	ubyte paletteChangeSpeed; ///10
	ubyte paletteChangeDurationLeft; ///11
	ushort[16] palette; ///12
	ushort[16] palette2; ///44
	ushort[16]* palettePointer; ///76
	ubyte[4] scrollingMovements; ///78
	ubyte currentScrollingMovement; ///82
	short scrollingDurationLeft; ///83
	short horizontalPosition; ///85
	short verticalPosition; ///87
	short horizontalVelocity; ///89
	short verticalVelocity; ///91
	short horizontalAcceleration; ///93
	short verticalAcceleration; ///95
	ubyte[4] distortionStyles; ///97
	ubyte currentDistortionIndex; ///101
	short distortionDurationLeft; ///102
	ubyte distortionType; ///104
	short distortionRippleFrequency; ///105
	short distortionRippleAmplitude; ///107
	ubyte distortionSpeed; ///109
	short distortionCompressionRate; ///110
	short distortionRippleFrequencyAcceleration; ///112
	short distortionRippleAmplitudeAcceleration; ///114
	ubyte distortionSpeedAcceleration; ///116
	short distortionCompressionAcceleration; ///117
	void toString(W)(ref W writer) {
		import std.format : formattedWrite;
		writer.formattedWrite!"layer %s (%s bpp)"(targetLayer, bitDepth);
		writer.formattedWrite!" Palette shifting style: %s (%s - %s [step %s], %s - %s [step %s], speed %s, duration %s)"(paletteShiftingStyle, paletteCycle1First, paletteCycle1Last, paletteCycle2First, paletteCycle2Last, paletteCycle1Step, paletteCycle2Step, paletteChangeSpeed, paletteChangeDurationLeft);
		writer.formattedWrite!" scrolling: %s, distortion: %s"(scrollingMovements, distortionStyles);
	}
}
///
align(1) struct HDMAWordTransfer {
	align(1):
	ubyte scanlines; ///
	ushort value; ///
}
///
struct BattleEntryPointer {
	BattleGroupEnemy[] enemies; ///
	ushort runAwayFlag; ///
	ubyte runAwayFlagState; ///
	LetterboxStyle letterboxStyle; ///
}
///
struct OverworldEventMusic {
	ushort flag; ///
	ubyte music; ///
	ubyte audioEffect; ///
}
///
struct TownMapIconPlacement {
	ubyte x; ///
	ubyte y; ///
	ubyte sprite; ///
	ushort eventFlag; ///
}
///
struct SpriteMap {
	ubyte yOffset; ///
	union {
		SpriteMap* nextMap; ///Implemented, but unused
		struct {
			ubyte firstTile; ///
			ubyte flags; ///
		}
	}
	ubyte xOffset; ///
	ubyte specialFlags; ///
	///
	this (ubyte u0, ubyte ftile, ubyte flags, ubyte u3, ubyte u4) {
		this.yOffset = u0;
		this.firstTile = ftile;
		this.flags = flags;
		this.xOffset = u3;
		this.specialFlags = u4;
	}
	void toString(S)(ref S sink) const {
		import std.format : formattedWrite;
		sink.formattedWrite!"coords: %s, %s, first tile: %s, flags: %08b, special flags: %08b"(xOffset, yOffset, firstTile, flags, specialFlags);
	}
}
///
struct FullOAMTable {
	import earthbound.hardware : OAMEntry;
	align(1):
	OAMEntry[128] mainTable;
	ubyte[32] highTable;
}
///
struct TownMapData {
	ubyte unknown0; ///
	ubyte unknown1; ///
	ubyte unknown2; ///
}
///
struct Unknown7EAECCEntry {
	ubyte unknown0; ///
	ubyte unknown1; ///
	ushort unknown2; ///
	ushort unknown4; ///
	ushort unknown6; ///
	ushort unknown8; ///
	ushort unknown10; ///
	ushort unknown12; ///
	ushort unknown14; ///
	ushort unknown16; ///
	ushort unknown18; ///
	ushort unknown20; ///
}
///
struct BattleEntryBGEntry {
	ushort layer1; ///
	ushort layer2; ///
}
///
struct Enemy {
	ubyte theFlag; ///0
	ubyte[25] name; ///1
	Gender gender;///26
	EnemyType type; ///27
	ushort battleSprite; ///28
	ushort overworldSprite; ///30
	ubyte enemyMovementFlags; ///32
	ushort hp; ///33
	ushort pp; ///35
	uint exp; ///37
	ushort money; ///41
	ushort eventScript; ///43
	string encounterTextPointer; ///45
	string deathTextPointer; ///49
	ubyte battleSpritePalette; ///53
	ubyte level; ///54
	ubyte music; ///55
	ushort offense; ///56
	ushort defense; ///58
	ubyte speed; ///60
	ubyte guts; ///61
	ubyte luck; ///62
	ubyte fireResist; ///63
	ubyte freezeResist; ///64
	ubyte flashResist; ///65
	ubyte paralysisResist; ///66
	ubyte hypnosisBrainshockResist; ///67
	ubyte missRate; ///68
	ubyte actionOrder; ///69
	ushort[4] actions; ///70
	ushort finalAction; ///78
	ubyte[4] actionArgs; ///80
	ubyte finalActionArgument; ///84
	ubyte iq; ///85
	ubyte boss; ///86
	ubyte itemDropRate; ///87
	ubyte itemDropped; ///88
	ubyte initialStatus; ///89
	ubyte deathType; ///90
	ubyte row; ///91
	ubyte maxCalled; ///92
	ubyte mirrorSuccess; ///93
}
///
struct BattleAction {
	ubyte direction; /// 0
	ubyte target; /// 1
	ubyte type; /// 2
	ubyte ppCost; /// 3
	string text; /// 4
	void function() func; /// 8
}
///
struct BattleMenuSelection {
	ubyte user; ///
	ubyte param1; ///
	short selectedAction; ///
	ubyte targetting; ///
	ubyte selectedTarget; ///
}
///
struct NPCAI {
	ubyte targettability; ///
	ubyte enemyID; ///
}
///
struct ConsolationPrize {
	ubyte enemy; ///
	ubyte[8] items; ///
}
///
struct FinalGiygasPrayerNoiseEntry {
	ubyte sfx; ///
	ubyte duration; ///
}
///
struct BattleGroupEnemy {
	ubyte count; ///
	ushort enemyID; ///
}
///
struct BattleSpritePointer {
	ubyte sprite; ///
	ubyte size; ///
}
///
struct PSITeleportDestination {
	ubyte[25] name; ///
	ushort eventFlag; ///
	ushort x; ///
	ushort y; ///
}
///
struct WindowConfig {
	ushort x; ///
	ushort y; ///
	ushort width; ///
	ushort height; ///
}
///
struct DisplayTextState {
	const(ubyte)* textptr; ///0
	ushort unknown4; ///4
	WindowTextAttributesCopy savedTextAttributes; ///6
}
///
struct DoorEntryA {
	string textPtr; /// 0
	ushort eventFlag; /// 4
	ushort unknown6; /// 6
	ushort unknown8; /// 8
	ubyte transitionStyle; /// 10
}
///
struct DoorEntryB {
	ushort eventFlag; ///
	string textPtr; ///
}
///
struct DoorEntryC {
	string textPtr; ///
}
///
struct SectorDoors {
	ushort length; ///
	const(DoorConfig)[] doors; ///
}
///
union DoorPtr {
	immutable(DoorEntryA)* entryA; ///
	immutable(DoorEntryB)* entryB; ///
	immutable(DoorEntryC)* entryC; ///
	ushort direction; ///
}
///
struct DoorConfig {
	ubyte unknown0; ///
	ubyte unknown1; ///
	ubyte type; ///
	DoorPtr doorPtr; ///
	///
	this(ubyte u0, ubyte u1, ubyte t, immutable(DoorEntryA)* a) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
		doorPtr.entryA = a;
	}
	///
	this(ubyte u0, ubyte u1, ubyte t, immutable(DoorEntryB)* b) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
		doorPtr.entryB = b;
	}
	///
	this(ubyte u0, ubyte u1, ubyte t, immutable(DoorEntryC)* c) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
		doorPtr.entryC = c;
	}
	///
	this(ubyte u0, ubyte u1, ubyte t, ushort u3) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
		doorPtr.direction = u3;
	}
	///
	this(ubyte u0, ubyte u1, ubyte t, typeof(null)) {
		unknown0 = u0;
		unknown1 = u1;
		type = t;
	}
}
///
struct ScreenTransitionConfig {
	ubyte duration; ///0
	ubyte animationID; ///1
	ubyte animationFlags; ///2
	ubyte fadeStyle; ///3
	ubyte direction; ///4
	ubyte unknown5; ///5
	ubyte slideSpeed; ///6
	ubyte startSoundEffect; ///7
	ubyte secondaryDuration; ///8
	ubyte secondaryAnimationID; ///9
	ubyte secondaryAnimationFlags; ///10
	ubyte endingSoundEffect; ///11
}
///
struct Unknown7E5E06Entry {
	ushort unknown0; ///0
	ushort unknown2; ///2
}
///
struct TeleportDestination {
	short x; ///0
	short y; ///2
	ubyte direction; ///4
	ubyte screenTransition; ///5
	ushort unknown6; ///6
}
///
struct UnknownC08F98Entry {
	ushort unknown0; ///0
	ushort unknown2; ///2
	ushort unknown4; ///4
	ushort unknown6; ///6
}
///
struct OverlayScript {
	ushort command; ///
	union {
		ushort frames; ///
		const(OverlayScript)* dest; ///
		const(SpriteMap)* spriteMap; ///
	}
	///
	static typeof(this) jump(const(OverlayScript)* dest) {
		auto result = typeof(this)(3);
		result.dest = dest;
		return result;
	}
	///
	static typeof(this) delay(ushort frames) {
		auto result = typeof(this)(2);
		result.frames = frames;
		return result;
	}
	///
	static typeof(this) show(const(SpriteMap)* spriteMap) {
		auto result = typeof(this)(1);
		result.spriteMap = spriteMap;
		return result;
	}
}
///
struct TilesetAnimation {
	ubyte count; ///
	AnimatedTiles[] animations; ///
}
///
struct AnimatedTiles {
	ubyte frameCount; ///
	ubyte frameDelay; ///
	ushort copySize; ///
	ushort sourceOffset; ///
	ushort destinationAddress; ///
}
///
struct LoadedAnimatedTiles {
	short frameCount; ///0
	short frameDelay; ///2
	short copySize; ///4
	short sourceOffset; ///6
	short destinationAddress; ///8
	short framesUntilUpdate; ///10
	short frameCounter; ///12
	short sourceOffset2; ///14
}
///
struct MapDataPaletteAnimationPointer {
	ubyte[] ptr; ///
	ubyte count; ///
	ubyte[] entries; ///
}
///
struct LoadedOverworldPaletteAnimation {
	ushort timer; ///0
	ushort index; ///2
	ushort[9] delays; ///4
}
///
struct MapTileEvent {
	ushort eventFlag; ///
	ushort count; ///
	MapTilePair[] tiles; ///
}
///
struct MapTilePair {
	ushort tile1; ///
	ushort tile2; ///
}
///
struct CreditsPhotograph {
	ushort eventFlag; ///0
	short mapX; ///2
	short mapY; ///4
	ushort creditsMapPalettesOffset; ///6
	byte slideDirection; ///8
	byte slideDistance; ///9
	short photographerX; ///10
	short photographerY; ///12
	Coordinates[6] partyConfig; ///14
	PhotographerConfigEntryObject[4] objectConfig; ///38
}
///
struct Coordinates {
	short x; ///
	short y; ///
}
///
struct PhotographerConfigEntryObject {
	short tileX;///0
	short tileY;///2
	ushort sprite; ///4
}
///
union CCArgStorage {
	ubyte[10] raw; ///
}
///
union WorkingMemory {
	uint integer; ///
	void* pointer; ///
}
///
struct CC1C01Entry {
	ubyte size; ///
	void* address; ///
}
///
struct EntityOverlaySprite {
	ushort spriteID; ///
	ubyte unknown2; ///
	ubyte unknown3; ///
}
///
struct CastSequenceFormattingEntry {
	ushort unknown0; ///
	ubyte unknown2; ///
}
///
struct Unknown7E5156CreditsEntry {
	ubyte unknown0; ///
	ushort unknown1; ///
	const(ubyte)* unknown3; ///
	ushort unknown7; ///
}
///
struct Unknown7EAEFCEntry {
	short unknown0; ///
	short unknown2; ///
	short unknown4; ///
}
///
struct TelephoneContact {
	ubyte[25] title; ///
	ushort eventFlag; ///
	string text; ///
}
///
struct PSIAbility {
	ubyte name; ///0
	ubyte level; ///1
	ubyte type; ///2
	ubyte target; ///3
	short battleAction; ///4
	ubyte nessLevel; ///6
	ubyte paulaLevel; ///7
	ubyte pooLevel; ///8
	ubyte menuX; ///9
	ubyte menuY; ///10
	string text; ///11
}
///
struct ActiveHotspot {
	short mode; ///
	short x1; ///
	short y1; ///
	short x2; ///
	short y2; ///
	const(ubyte)* pointer; ///
}
///
struct FloatingSpriteTableEntry {
	short sprite; ///
	ubyte unknown2; ///
	ubyte unknown3; ///
	ubyte unknown4; ///
}
///
struct SpriteFadeState {
	short entityID; ///
	short appearanceStyle; ///
	short fadeStyle; ///
	short pixelWidth; ///
	short pixelHeight; ///
	ubyte* fadeBuffer; ///
	ubyte* fadeBuffer2; ///
	short fadeBufferSize; ///
	short unknown16; ///
	short unknown18; ///
}
///
struct SpritePlacementEntry {
	ushort entries; ///
	SpritePlacement[] spritePlacements; ///
}
///
struct SpritePlacement {
	short unknown0; ///
	ubyte unknown2; ///
	ubyte unknown3; ///
}
///
struct StatsGrowth {
	ubyte offense; ///
	ubyte defense; ///
	ubyte speed; ///
	ubyte guts; ///
	ubyte vitality; ///
	ubyte iq; ///
	ubyte luck; ///
}
///
struct CharacterInitialStats {
	short unknown0; ///
	short unknown2; ///
	short money; ///
	short level; ///
	short exp; ///
	ubyte[10] items; ///
}
///
struct NamingScreenEntity {
	ushort sprite; ///
	ushort script; ///
}
///
struct FileSelectSummarySpriteConfigEntry {
	short sprite; ///
	short script; ///
	short x; ///
	short y; ///
}
///
struct ActionLoopCallState {
	const(ubyte)* pc; ///
	ubyte counter; ///
}
///
struct SoundStoneMelodyState {
	short playbackState; /// Not present, present but not playing, or present and playing
	short unknown2; ///
	short unknown4; ///
	short soundStoneOrbitSpriteFrame; /// An index for soundStoneFlyingSpriteDistances
	short soundStoneOrbitSpritePosition1; ///
	short soundStoneOrbitSpritePosition2; ///
	short unknown12; ///
}
///
struct Hotspot {
	short x1; ///
	short y1; ///
	short x2; ///
	short y2; ///
}
///
struct CommandWindowSpacing {
	ubyte unknown0; ///
	ubyte unknown1; ///
}
///
struct EnemyPlacementGroups {
	ushort eventFlag; ///
	ubyte unknown2; ///
	ubyte unknown3; ///
	EnemyPlacementGroup[] groups; ///
}
///
struct EnemyPlacementGroup {
	ubyte unknown0; ///
	short groupID; ///
}
///
struct PSIAnimation {
	ubyte graphics; ///
	ubyte frameDuration; ///
	ubyte paletteDuration; ///
	ubyte unknown4; ///
	ubyte unknown5; ///
	ubyte totalFrames; ///
	ubyte target; ///
	ubyte enemyColourChangeDelay; ///
	ubyte enemyColourChangeDuration; ///
	ushort enemyColour; ///
}
///
struct BackgroundScrollingEntry {
	short duration; ///
	short horizontalVelocity; ///
	short verticalVelocity; ///
	short horizontalAcceleration; ///
	short verticalAcceleration; ///
	void toString(W)(W writer) const {
		import std.format : formattedWrite;
		writer.formattedWrite!"duration: %s, h velocity: %s, v velocity: %s, h accel: %s, v accel: %s"(this.tupleof);
	}
}
///
struct BackgroundDistortionEntry {
	short duration; ///
	ubyte style; ///
	short rippleFrequency; ///
	short rippleAmplitude; ///
	ubyte speed; ///
	short compressionRate; ///
	short rippleFrequencyAcceleration; ///
	short rippleAmplitudeAcceleration; ///
	ubyte speedAcceleration; ///
	short compressionRateAcceleration; ///
	void toString(W)(W writer) const {
		import std.format : formattedWrite;
		writer.formattedWrite!"duration: %s, style: %s, ripple freq: %s, ripple ampl: %s, speed: %s, compression rate: %s, ripple freq accel: %s, ripple ampl accel: %s, speed accel: %s, compression accel: %s"(this.tupleof);
	}
}
///
union FadeParameters {
	short word; /// This is just to avoid undefined behaviour with actionscripts accessing both values with one write
	struct {
		ubyte step; /// Number of levels of brightness to add/subtract at a time
		ubyte delay; /// Number of frames between each increment/decrement
	}
}
///
struct AnimationSequence {
	ubyte id; ///
	ushort unknown4; ///
	ubyte unknown6; ///
	ubyte unknown7; ///
}
///
struct YourSanctuaryLocation {
	short x; ///
	short y; ///
}
///
union Unknown7EF000Stuff {
	struct {
		ushort[16][16] unknown7EF000; ///
		PathCtx unknown7EF200; ///
		ubyte[0xC00] unknown7EF400; ///
	}
	ushort[0x400] yourSanctuaryLocationTileOffsets; ///
}
///
struct Unknown7E9652Data {
	ushort unknown0; ///
	ushort unknown2; ///
	ushort unknown4; ///
}
///
struct BattleSwirlConfig {
	ubyte timeBetweenFrames;
	ubyte startingHDMATableID;
	ubyte swirlFrames;
	ubyte unused;
}

//helper funcs not in the original game
///
void function() waitForInterrupt = () {};
///
void function(ubyte, ubyte, const(void)*, ushort, ushort) handleCGRAMDMA = (ubyte, ubyte, const(void)*, ushort, ushort) {};
///
void function(ubyte, ubyte, const(void)*, ushort, ushort) handleOAMDMA = (ubyte, ubyte, const(void)*, ushort, ushort) {};
///
void function(ubyte, ubyte, const(void)*, ushort, ushort, ubyte) handleVRAMDMA = (ubyte, ubyte, const(void)*, ushort, ushort, ubyte) {};
///
void function() handleHDMA = () {};
///
void function(ubyte) setFixedColourData = (ubyte) {};
///
void function(ubyte, ushort) setBGOffsetX = (ubyte, ushort) {};
///
void function(ubyte, ushort) setBGOffsetY = (ubyte, ushort) {};
///
void function(ubyte) playSFX = (ubyte) {};
///
void function(ushort) playMusicExternal = (ushort) {};
///
void function() stopMusicExternal = () {};
///
void function(ushort) setAudioChannels = (ushort) {};
///
void function(short) doMusicEffect = (short) {};
///
void function(short) setStatic = (short) {};
///
ushort function(ushort) getControllerState = (ushort) { return cast(ushort)0; };
///
void function(short, short, short, short, ubyte, ubyte, ubyte, ubyte) drawRect = (short, short, short, short, ubyte, ubyte, ubyte, ubyte) {};
/// For running code in the main fiber
void function() mainFiberExecute = () {};
///
ubyte[] flyoverString(string str) {
	ubyte[] result = new ubyte[](str.length);
	size_t idx;
	bool verbatim;
	foreach (dchar c; str) {
		if (verbatim) {
			result[idx++] = cast(ubyte)c;
			verbatim = false;
		} else {
			switch (c) {
				case 0x01:
				case 0x02:
				case 0x08:
				case 0x09:
					result[idx++] = cast(ubyte)c;
					verbatim = true;
					break;
				default:
					result[idx++] = ebChar(c);
			}
		}
	}
	return result;
}
///
ubyte[length] ebString(size_t length)(const(char)[] str) {
	ubyte[length] result = 0;
	size_t idx;
	foreach (dchar c; str) {
		result[idx++] = ebChar(c);
	}
	return result;
}
///
ubyte[] ebString(const(char)[] str) {
	ubyte[] result = new ubyte[](str.length);
	size_t idx;
	foreach (dchar c; str) {
		result[idx++] = ebChar(c);
	}
	return result;
}
///
ubyte[] ebStringz(const(char)[] str) @safe pure {
	ubyte[] result = new ubyte[](str.length + 1);
	size_t idx;
	foreach (dchar c; str) {
		result[idx++] = ebChar(c);
	}
	result[$ - 1] = 0;
	return result;
}

static assert(ebString!4("Null") == [0x7E, 0xA5, 0x9C, 0x9C]);
///
ubyte ebChar(dchar c) @safe pure {
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
		case '&': return 0x52;
		case '{': return 0x53;
		case '%': return 0x55;
		case '}': return 0x56;
		case '*': return 0x5A;
		case '/': return 0x5F;
		case ':': return 0x6A;
		case ';': return 0x6B;
		case '<': return 0x6C;
		case '>': return 0x6E;
		case '?': return 0x6F;
		case '@': return 0x70;
		case '~': return 0x8B;
		case '^': return 0x8C;
		case '[': return 0x8D;
		case ']': return 0x8E;
		case '#': return 0x8F;
		case '_': return 0x90;
		case '|': return 0xAC;
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
T printable(T = string)(const ubyte[] str) {
	T result;
	foreach (chr; str) {
		if (chr == 0) {
			break;
		}
		result ~= nativeStr(chr);
	}
	return result;
}
void printableRef(scope char[] buffer, const ubyte[] str) {
	size_t i;
	foreach (chr; str) {
		if (chr == 0) {
			break;
		}
		const converted = nativeStr(chr);
		buffer[i .. i + converted.length] = converted;
		i += converted.length;
	}
}
string printable(const(ubyte)* str, size_t maxLength = size_t.max) {
	string result;
	while ((maxLength-- > 0) && (str[0] != 0)) {
		const chr = (str++)[0];
		result ~= nativeStr(chr);
	}
	return result;
}
string nativeStr(ubyte b) {
	import std.format : format;
	switch (b) {
		case ebChar(' '):
		case ebChar('!'):
		case ebChar('$'):
		case ebChar('('):
		case ebChar(')'):
		case ebChar('\''):
		case ebChar(','):
		case ebChar('-'):
		case ebChar('.'):
		case ebChar('0'): .. case ebChar('9'):
		case ebChar('A'): .. case ebChar('Z'):
		case ebChar('a'): .. case ebChar('z'): return [cast(char)(b - 0x30)];
		case ebChar('{'): return "{";
		case ebChar('/'): return "/";
		case ebChar(':'): return ":";
		case ebChar('?'): return "?";
		case ebChar('@'): return "@";
		case ebChar('~'): return "~";
		case ebChar('^'): return "^";
		case ebChar('['): return "[";
		case ebChar(']'): return "]";
		case ebChar('#'): return "#";
		case ebChar('_'): return "_";
		case ebChar('♪'): return "♪";
		case ebChar('α'): return "α";
		case ebChar('β'): return "β";
		case ebChar('γ'): return "γ";
		case ebChar('Σ'): return "Σ";
		case ebChar('Ω'): return "Ω";
		case ebChar('ー'): return "ー";
		default:
			return format!"\\x%02X"(b);
	}
}
///
T[] convert(T)(const(ubyte)[] input) {
	T[] output;
	foreach (idx; 0 .. input.length / T.sizeof) {
		T val;
		static foreach (i; 0 .. T.sizeof) {
			val += input[idx * T.sizeof + i] << (i * 8);
		}
		output ~= val;
	}
	return output;
}
///
ushort[16] convertPalette(const(ubyte)[] input) {
	ushort[16] output;
	output[0 .. input.length / 2] = convert!ushort(input);
	return output;
}
///
ushort sectorAttributes(ubyte a, ubyte b) {
	return cast(short)(a + (b << 8));
}
///
T ROR(T)(T val, ref bool carry) {
	bool LSB = val & (1 << 0);
	val >>= 1;
	val |= (cast(T)carry << ((T.sizeof * 8) - 1));
	carry = LSB;
	return val;
}
unittest {
	static immutable bool[] carries = [true, false, false, false, false, false, false, false];
	static immutable ubyte[] vals = [0, 128, 64, 32, 16, 8, 4, 2];
	ubyte f = 1;
	bool carry;
	foreach(idx; 0 .. 8) {
		f = ROR(f, carry);
		assert(carry == carries[idx]);
		assert(f == vals[idx]);
	}
}
///
T ROL(T)(T val, ref bool carry) {
	bool MSB = !!(val & (1 << ((T.sizeof * 8) - 1)));
	val <<= 1;
	val |= carry;
	carry = MSB;
	return val;
}
unittest {
	static immutable bool[] carries = [false, false, false, false, false, false, false, true];
	static immutable ubyte[] vals = [2, 4, 8, 16, 32, 64, 128, 0];
	ubyte f = 1;
	bool carry;
	foreach(idx; 0 .. 8) {
		f = ROL(f, carry);
		assert(carry == carries[idx]);
		assert(f == vals[idx]);
	}
}
///
void XBA(T)(ref T val) {
	val = cast(T)((val >> 8) | (val << 8));
}
///
const(ubyte)[] paletteOffsetToPointer(ushort offset) {
	import std.range : enumerate, slide;
	import earthbound.bank2F : mapPalettePointerTable;
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
			return mapPalettePointerTable[idx][subOffset * 0xC0 .. (subOffset + 1) * 0xC0];
		}
	}
	const subOffset = (offset - offsetList[$ - 1]) / 0xC0;
	return mapPalettePointerTable[$ - 1][subOffset * 0xC0 .. (subOffset + 1) * 0xC0];
}
///
size_t decompBlock(const(ubyte)* cdata, ubyte* buffer, int maxlen) {
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
///
SaveBlock readSaveFile(short id) {
	import std.experimental.logger : tracef;
	import std.stdio : File;
	import std.file : exists;
	SaveBlock[1] data;
	tracef("Reading save: %s", saveFileName(id));
	if (saveFileName(id).exists) {
		File(saveFileName(id), "r").rawRead(data[]);
	}
	return data[0];
}
///
void writeSaveFile(short id, SaveBlock block) {
	import std.experimental.logger : tracef;
	import std.stdio : File;
	SaveBlock[1] data = [block];
	tracef("Saving file: %s", saveFileName(id));
	File(saveFileName(id), "w").rawWrite(data[]);
}
///
string saveFileName(short id) {
	import std.format : format;
	if (id % 2 == 0) {
		return format!"%s.ebsave"(id / 2);
	} else {
		return format!"%s.ebsave.bak"(id / 2);
	}
}

private extern(C) __gshared string[] rt_options = ["oncycle=ignore"];
///
const(ubyte)[] getFullCC(const(ubyte)* script) {
	return getFullCC(script[0 .. size_t.max]);
}
const(ubyte)[] getFullCC(const(ubyte)[] script) @safe pure {
	enum ptrSize = string.sizeof;
	ubyte f = script[0];
	if (f < 0x20) {
		switch (f) {
			case 11:
			case 12:
			case 13:
			case 14:
			case 16:
			case 21:
			case 22:
			case 23:
				return script[0 .. 2];
			case 4:
			case 5:
			case 7:
				return script[0 .. 3];
			case 6:
				return script[0 .. 3 + ptrSize];
			case 8:
			case 10:
				return script[0 .. 1 + ptrSize];
			case 9:
				return script[0 .. 2 + ptrSize * script[1]];
			case 24:
				switch (script[1]) {
					case 1:
					case 3:
					case 8:
					case 9:
						return script[0 .. 3];
					case 5:
					case 13:
						return script[0 .. 4];
					case 7:
						return script[0 .. 7];
					default:
						return script[0 .. 2];
				}
			case 25:
				switch (script[1]) {
					case 16:
					case 17:
					case 24:
					case 26:
					case 27:
					case 33:
					case 37:
					case 38:
					case 39:
					case 40:
						return script[0 .. 3];
					case 22:
					case 25:
					case 28:
					case 29:
						return script[0 .. 4];
					case 5:
						return script[0 .. 5];
					case 34:
						return script[0 .. 6];
					case 35:
					case 36:
						return script[0 .. 7];
					case 2:
						foreach (idx, v; script[2 .. $]) {
							if (v == 1) {
								return script[0 .. idx + ptrSize + 3];
							} else if (v == 2) {
								return script[0 .. idx + 3];
							}
						}
						assert(0, "Invalid CC [19 02]");
					default:
						return script[0 .. 2];
				}
			case 26:
				switch (script[1]) {
					case 0:
					case 1:
						return script[0 .. 3 + ptrSize * 4];
					case 6:
						return script[0 .. 3];
					case 5:
						return script[0 .. 4];
					default:
						return script[0 .. 2];
				}
			case 27:
				switch (script[1]) {
					case 2:
					case 3:
						return script[0 .. 2 + ptrSize];
					default:
						return script[0 .. 2];
				}
			case 28:
				switch (script[1]) {
					case 0:
					case 1:
					case 2:
					case 3:
					case 5:
					case 6:
					case 7:
					case 8:
					case 9:
					case 12:
					case 17:
					case 18:
					case 20:
					case 21:
						return script[0 .. 3];
					case 19:
						return script[0 .. 4];
					case 10:
					case 11:
						return script[0 .. 6];
					default:
						return script[0 .. 2];
				}
			case 29:
				switch (script[1]) {
					case 2:
					case 3:
					case 10:
					case 11:
					case 24:
					case 25:
					case 33:
					case 35:
					case 36:
						return script[0 .. 3];
					case 0:
					case 1:
					case 4:
					case 5:
					case 8:
					case 9:
					case 12:
					case 14:
					case 15:
					case 16:
					case 17:
					case 18:
					case 19:
					case 21:
						return script[0 .. 4];
					case 13:
						return script[0 .. 5];
					case 6:
					case 7:
					case 20:
					case 23:
						return script[0 .. 6];
					default:
						return script[0 .. 2];
				}
			case 30:
				switch (script[1]) {
					case 0:
					case 1:
					case 2:
					case 3:
					case 4:
					case 5:
					case 6:
					case 7:
					case 8:
					case 10:
					case 11:
					case 12:
					case 13:
					case 14:
						return script[0 .. 4];
					case 9:
						return script[0 .. 7];
					default:
						return script[0 .. 2];
				}
			case 31:
				switch (script[1]) {
					case 1:
					case 2:
					case 4:
					case 7:
					case 17:
					case 18:
					case 20:
					case 29:
					case 33:
					case 65:
					case 82:
					case 96:
					case 98:
					case 103:
					case 208:
					case 210:
					case 211:
					case 229:
					case 232:
						return script[0 .. 3];
					case 0:
					case 19:
					case 27:
					case 28:
					case 32:
					case 35:
					case 113:
					case 129:
					case 131:
					case 230:
					case 231:
					case 233:
					case 234:
					case 235:
					case 236:
					case 238:
					case 239:
					case 244:
						return script[0 .. 4];
					case 22:
					case 26:
					case 30:
					case 31:
					case 225:
					case 228:
					case 243:
						return script[0 .. 5];
					case 241:
					case 242:
						return script[0 .. 6];
					case 21:
					case 23:
						return script[0 .. 7];
					case 24:
					case 25:
						return script[0 .. 9];
					case 99:
						return script[0 .. 2 + ptrSize];
					case 102:
						return script[0 .. 4 + ptrSize];
					case 192:
						return script[0 .. 3 + ptrSize * script[2]];
					default:
						return script[0 .. 2];
				}
			default:
				return script[0 .. 1];
		}
	}
	return script[0 .. 1];
}

unittest {
	assert(getFullCC([0x19, 0x02, 0x50, 0x50, 0x50, 0x02, 0x00]) == [0x19, 0x02, 0x50, 0x50, 0x50, 0x02]);
	const emptyPointer = new ubyte[](string.sizeof);
	assert(getFullCC(cast(ubyte[])[0x19, 0x02, 0x50, 0x50, 0x50, 0x01] ~ emptyPointer ~ cast(ubyte[])[0x00]) == cast(ubyte[])[0x19, 0x02, 0x50, 0x50, 0x50, 0x01] ~ emptyPointer);
}

version(configurable) {
	struct GameConfig {
		import std.typecons : Nullable;
		bool noIntro;
		Nullable!ubyte autoLoadFile;
		debug bool loadDebugMenu;
		bool instantSpeedText;
		bool debugMenuButton;
		Coordinates spawnCoordinates;
		bool overrideSpawn() const @safe pure nothrow {
			return (spawnCoordinates.x != 0) && (spawnCoordinates.y != 0);
		}
	}
} else {
	struct GameConfig {
		import std.typecons : Nullable;
		enum noIntro = false;
		enum autoLoadFile = Nullable!ubyte.init;
		debug enum loadDebugMenu = false;
		enum instantSpeedText = false;
		enum debugMenuButton = false;
		enum Coordinates spawnCoordinates = Coordinates.init;
		enum bool overrideSpawn = false;
	}
}
GameConfig config;
ubyte[] allBytes(T...)(T args) {
	struct X {
		align(1):
		T stuff;
	}
	union Z {
		X x;
		ubyte[X.sizeof] bytes;
	}
	return Z(X(args)).bytes.dup;
}

void printTrace() {
	import std.stdio : writeln;
	import core.runtime : defaultTraceHandler;
	auto trace = defaultTraceHandler(null);
	foreach (line; trace) {
		writeln(line);
	}
}

struct ROMSource {
	uint offset;
	uint length;
}

private auto printableScriptName(const(void)* addr) {
	static struct Result {
		const(void)* addr;
		void toString(W)(ref W writer) const {
			import earthbound.actionscripts : actionScriptScriptPointers, otherScripts;
			import std.format : formattedWrite;
			foreach (name, otherScript; otherScripts) {
				if ((addr >= &otherScript[0]) && (addr <= &otherScript[$ - 1])) {
					const offset = addr - cast(const(void)*)&otherScript[0];
					if (offset != 0) {
						writer.formattedWrite!"%s+%d"(name, offset);
					} else {
						writer.formattedWrite!"%s"(name);
					}
					return;
				}
			}
			foreach (idx, script; actionScriptScriptPointers) {
				if ((addr >= &script[0]) && (addr <= &script[$ - 1])) {
					const offset = addr - cast(const(void)*)&script[0];
					if (offset != 0) {
						writer.formattedWrite!"actionScript%d+%d"(idx, offset);
					} else {
						writer.formattedWrite!"actionScript%d"(idx);
					}
					return;
				}
			}
		}
	}
	return Result(addr);
}
void printActionscriptCommand(size_t entityID, const(ubyte)* stream) {
	printActionscriptCommand(entityID, stream[0 .. size_t.max]);
}
void printActionscriptCommand(size_t entityID, const(ubyte)[] stream) {
	import std.logger : tracef;
	if (stream.length == 0) {
		return;
	}
	tracef("Entity %s: (%s) %s", entityID, printableScriptName(&stream[0]), actionscriptCommandPrinter(stream));
}

private auto actionscriptCommandPrinter(const(ubyte)[] commandStream) {
	static struct Result {
		static immutable commandNames = ["END", "LOOP", "LOOP_END", "LONGJUMP", "LONGCALL", "LONG_RETURN", "PAUSE", "START_TASK", "SET_TICK_CALLBACK", "HALT", "SHORTCALL_CONDITIONAL", "SHORTCALL_CONDITIONAL_NOT", "END_TASK", "UNK0D", "SET_VAR", "CLEAR_TICK_CALLBACK", "SWITCH_JUMP_TEMPVAR", "SWITCH_CALL_TEMPVAR", "WRITE_BYTE_WRAM", "END_LAST_TASK", "BINOP", "WRITE_WORD_WRAM", "BREAK_IF_FALSE", "BREAK_IF_TRUE", "BINOP_WRAM", "SHORTJUMP", "SHORTCALL", "SHORT_RETURN", "SET_ANIMATION_POINTER", "WRITE_WORD_TEMPVAR", "WRITE_WRAM_TEMPVAR", "WRITE_TEMPVAR_TO_VAR", "WRITE_VAR_TO_TEMPVAR", "WRITE_VAR_TO_WAIT_TIMER", "SET_DRAW_CALLBACK", "SET_POSITION_CHANGE_CALLBACK", "LOOP_TEMPVAR", "SET_PHYSICS_CALLBACK", "SET_ANIMATION_FRAME_VAR", "BINOP_TEMPVAR", "SET_X", "SET_Y", "SET_Z", "SET_X_RELATIVE", "SET_Y_RELATIVE", "SET_Z_RELATIVE", "SET_X_VELOCITY_RELATIVE", "SET_Y_VELOCITY_RELATIVE", "SET_Z_VELOCITY_RELATIVE", "UNK31", "UNK32", "UNK33", "UNK34", "UNK35", "UNK36", "UNK37", "UNK38", "SET_VELOCITIES_ZERO", "UNK3A", "SET_ANIMATION", "NEXT_ANIMATION_FRAME", "PREV_ANIMATION_FRAME", "SKIP_N_ANIMATION_FRAMES", "SET_X_VELOCITY", "SET_Y_VELOCITY", "SET_Z_VELOCITY", "CALLROUTINE", "SET_PRIORITY", "WRITE_TEMPVAR_WAITTIMER"];
		const(ubyte)[] stream;
		void toString(W)(ref W writer) const {
			import std.algorithm.iteration : map;
			import std.format : formattedWrite;
			import earthbound.actionscripts : funcSymbolMap;
			enum scriptPtrSize = (void*).sizeof;
			enum voidPtrSize = (void*).sizeof;
			ubyte command = stream[0] < 0x70 ? stream[0] : cast(ubyte)(0x45 + (stream[0] & 0x70) >> 4);
			if (command < commandNames.length) {
				writer.formattedWrite!"%s"(commandNames[command]);
			} else {
				writer.formattedWrite!"UNKNOWN COMMAND %02X"(command);
			}
			switch (command) {
				case 0x00:
				case 0x02:
				case 0x05:
				case 0x09:
				case 0x0C:
				case 0x0F:
				case 0x13:
				case 0x1B:
				case 0x24:
				case 0x39:
				case 0x3C:
				case 0x3D:
				case 0x44: //nothing to print here
					break;
				case 0x01:
				case 0x06:
				case 0x1F:
				case 0x20:
				case 0x21:
				case 0x26:
				case 0x3B:
				case 0x3E:
				case 0x43:
					writer.formattedWrite!" %02X"(stream[1]);
					break;
				case 0x07:
				case 0x16:
				case 0x17:
				case 0x1D:
				case 0x1E:
				case 0x28:
				case 0x29:
				case 0x2A:
				case 0x2B:
				case 0x2C:
				case 0x2D:
				case 0x2E:
				case 0x2F:
				case 0x30:
				case 0x3F:
				case 0x40:
				case 0x41:
					writer.formattedWrite!" %04X"((cast(ushort[])(stream[1 .. 3]))[0]);
					break;
				case 0x0E:
				case 0x27:
					writer.formattedWrite!" %02X %04X"(stream[1], (cast(ushort[])(stream[2 .. 4]))[0]);
					break;
				case 0x12:
					writer.formattedWrite!" %04X %02X"((cast(ushort[])(stream[1 .. 3]))[0], stream[3]);
					break;
				case 0x14:
					writer.formattedWrite!" %02X %02X %04X"(stream[1], stream[2], (cast(ushort[])(stream[3 .. 5]))[0]);
					break;
				case 0x15:
					writer.formattedWrite!" %04X %04X"((cast(ushort[])(stream[1 .. 3]))[0], (cast(ushort[])(stream[3 .. 5]))[0]);
					break;
				case 0x18:
					writer.formattedWrite!" %04X %02X %02X"((cast(ushort[])(stream[1 .. 3]))[0], stream[3], stream[4]);
					break;
				case 0x03:
				case 0x04:
				case 0x08:
				case 0x0A:
				case 0x0B:
				case 0x19:
				case 0x1A:
				case 0x25:
					writer.formattedWrite!" %s"(printableScriptName((cast(void*[])(stream[1 .. 1 + scriptPtrSize]))[0]));
					break;
				case 0x1C:
				case 0x22:
				case 0x23:
					writer.formattedWrite!" %016X"((cast(size_t[])(stream[1 .. 1 + voidPtrSize]))[0]);
					break;
				case 0x10:
				case 0x11:
					writer.formattedWrite!" %(%s, %)"((cast(void*[])(stream[2 .. 2 + scriptPtrSize * stream[1]])).map!printableScriptName);
					break;
				case 0x42: //NYI
					writer.formattedWrite!" %s"(funcSymbolMap[(cast(void*[])stream[1 .. 1 + size_t.sizeof])[0]]);
					break;
				default:
					break;
			}
		}
	}
	return Result(commandStream);
}

private enum ubyte[char][2] staffTextTable = [[ // small text
	' ': 0x40,
	'A': 0x42,
	'B': 0x52,
	'C': 0x44,
	'D': 0x54,
	'E': 0x45,
	'F': 0x55,
	'G': 0x46,
	'H': 0x56,
	'I': 0x48,
	'J': 0x58,
	'K': 0x49,
	'L': 0x59,
	'M': 0x4A,
	'N': 0x5A,
	'O': 0x4B,
	'P': 0x5B,
	'Q': 0x6A,
	'R': 0x7A,
	'S': 0x6B,
	'T': 0x7B,
	'U': 0x6C,
	'V': 0x7C,
	'W': 0x6D,
	'X': 0x7D,
	'Y': 0x6E,
	'Z': 0x7E,
	'_': 0x80,
	'.': 0xAD,
], [ // big text
	' ': 0x40,
	'!': 0x41,
	'@': 0x43,
	'\'': 0x47,
	',': 0x4C,
	'-': 0x4D,
	'.': 0x4E,
	'/': 0x4F,
	'0': 0x60,
	'1': 0x61,
	'2': 0x62,
	'3': 0x63,
	'4': 0x64,
	'5': 0x65,
	'6': 0x66,
	'7': 0x67,
	'8': 0x68,
	'9': 0x69,
	'?': 0x6F,
	'_': 0x80,
	'A': 0x81,
	'B': 0x82,
	'C': 0x83,
	'D': 0x84,
	'E': 0x85,
	'F': 0x86,
	'G': 0x87,
	'H': 0x88,
	'I': 0x89,
	'J': 0x8A,
	'K': 0x8B,
	'L': 0x8C,
	'M': 0x8D,
	'N': 0x8E,
	'O': 0x8F,
	'P': 0xA0,
	'Q': 0xA1,
	'R': 0xA2,
	'S': 0xA3,
	'T': 0xA4,
	'U': 0xA5,
	'V': 0xA6,
	'W': 0xA7,
	'X': 0xA8,
	'Y': 0xA9,
	'Z': 0xAA,
	';': 0xAD,
]];

const(ubyte)[] convertStaffText(const(char)[] input) @safe pure {
	const(ubyte)[] result;
	bool bigText;
	for (size_t idx = 0; idx < input.length; idx++) {
		switch (input[idx]) {
			case '\t':
			case '\n': // not used, just looks better this way
				break;
			case '\x00':
			case '\x04':
			case '\xFF':
				result ~= input[idx];
				break;
			case '\x03':
				result ~= input[idx .. idx + 2];
				idx++;
				break;
			case '\x01':
				result ~= input[idx];
				bigText = false;
				break;
			case '\x02':
				result ~= input[idx];
				bigText = true;
				break;
			default:
				result ~= staffTextTable[bigText][input[idx]];
				break;
		}
	}
	return result;
}

string getBattlerName(ref Battler battler) {
	import core.stdc.string : memcpy;
	import earthbound.bank02 : copyEnemyName, unknownC2B66A;
	import earthbound.bank15 : enemyConfigurationTable;
	import earthbound.globals : gameState, partyCharacters, unknown7E5E78;
	scope buffer = new ubyte[](30);
	if ((battler.side == BattleSide.foes) || (battler.npcID != 0)) {
		ubyte* x14 = copyEnemyName(&enemyConfigurationTable[battler.id].name[0], &buffer[0], 25);
		if ((battler.side == BattleSide.foes) && ((battler.theFlag != 1) ||(unknownC2B66A(battler.unknown76) != 2))) {
			x14[0] = ebChar(' ');
			unknown7E5E78 = 1;
			x14[1] = cast(ubyte)(battler.theFlag + 0x70);
		}
		if (battler.id == EnemyID.myPet) {
			memcpy(&buffer[0], &gameState.petName[0], gameState.petName.length);
			buffer[gameState.petName.length] = 0;
		}
		return printable(buffer);
	} else {
		if (battler.id <= 4) {
			return printable(partyCharacters[battler.row].name);
		}
	}
	return "";
}
