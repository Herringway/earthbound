/// Misc definitions
module earthbound.commondefs;

enum maxEntities = 30; ///
enum maxScripts = 70; ///

enum partyLeaderEntityIndex = 24; ///

enum Pad {
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
	unknown28 = 0x28,
	unknown29 = 0x29,
	unknown2a = 0x2A,
	unknown2b = 0x2B,
	unknown2c = 0x2C,
	unknown2d = 0x2D,
	unknown2e = 0x2E,
	unknown2f = 0x2F,
	unknown30 = 0x30,
	unknown31 = 0x31,
	fileSelectFlavourChoice = 0x32,
	unknown33 = 0x33,
	unknown34 = 0x34,
}
///
enum TeleportStyle : ubyte {
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
	unknown000,
	unknown001,
	unknown002,
	unknown003,
	unknown004,
	unknown005,
	unknown006,
	unknown007,
	unknown008,
	unknown009,
	unknown010,
	unknown011,
	unknown012,
	unknown013,
	unknown014,
	unknown015,
	unknown016,
	unknown017,
	unknown018,
	unknown019,
	unknown020,
	unknown021,
	unknown022,
	unknown023,
	unknown024,
	unknown025,
	unknown026,
	unknown027,
	unknown028,
	unknown029,
	unknown030,
	unknown031,
	unknown032,
	unknown033,
	unknown034,
	unknown035,
	unknown036,
	unknown037,
	unknown038,
	unknown039,
	unknown040,
	unknown041,
	unknown042,
	unknown043,
	unknown044,
	unknown045,
	unknown046,
	unknown047,
	unknown048,
	unknown049,
	unknown050,
	unknown051,
	unknown052,
	unknown053,
	unknown054,
	unknown055,
	unknown056,
	unknown057,
	unknown058,
	unknown059,
	unknown060,
	unknown061,
	unknown062,
	unknown063,
	unknown064,
	unknown065,
	unknown066,
	unknown067,
	unknown068,
	unknown069,
	unknown070,
	unknown071,
	unknown072,
	unknown073,
	unknown074,
	unknown075,
	unknown076,
	unknown077,
	unknown078,
	unknown079,
	unknown080,
	unknown081,
	unknown082,
	unknown083,
	unknown084,
	unknown085,
	unknown086,
	unknown087,
	unknown088,
	unknown089,
	unknown090,
	unknown091,
	unknown092,
	unknown093,
	unknown094,
	unknown095,
	unknown096,
	unknown097,
	unknown098,
	unknown099,
	unknown100,
	unknown101,
	unknown102,
	unknown103,
	unknown104,
	unknown105,
	unknown106,
	unknown107,
	unknown108,
	unknown109,
	unknown110,
	unknown111,
	unknown112,
	unknown113,
	unknown114,
	unknown115,
	unknown116,
	unknown117,
	unknown118,
	unknown119,
	unknown120,
	unknown121,
	unknown122,
	unknown123,
	unknown124,
	unknown125,
	unknown126,
	unknown127,
	unknown128,
	unknown129,
	unknown130,
	unknown131,
	unknown132,
	unknown133,
	unknown134,
	unknown135,
	unknown136,
	unknown137,
	unknown138,
	unknown139,
	unknown140,
	unknown141,
	unknown142,
	unknown143,
	unknown144,
	unknown145,
	unknown146,
	unknown147,
	unknown148,
	unknown149,
	unknown150,
	unknown151,
	unknown152,
	unknown153,
	unknown154,
	unknown155,
	unknown156,
	unknown157,
	unknown158,
	unknown159,
	unknown160,
	unknown161,
	unknown162,
	unknown163,
	unknown164,
	unknown165,
	unknown166,
	unknown167,
	unknown168,
	unknown169,
	unknown170,
	unknown171,
	unknown172,
	unknown173,
	unknown174,
	unknown175,
	unknown176,
	unknown177,
	unknown178,
	unknown179,
	unknown180,
	unknown181,
	unknown182,
	unknown183,
	unknown184,
	unknown185,
	unknown186,
	unknown187,
	unknown188,
	unknown189,
	unknown190,
	unknown191,
	unknown192,
	unknown193,
	unknown194,
	unknown195,
	unknown196,
	unknown197,
	unknown198,
	unknown199,
	unknown200,
	unknown201,
	unknown202,
	unknown203,
	unknown204,
	unknown205,
	unknown206,
	unknown207,
	unknown208,
	unknown209,
	unknown210,
	unknown211,
	unknown212,
	unknown213,
	unknown214,
	unknown215,
	unknown216,
	unknown217,
	unknown218,
	unknown219,
	unknown220,
	unknown221,
	unknown222,
	unknown223,
	unknown224,
	unknown225,
	unknown226,
	unknown227,
	unknown228,
	unknown229,
	unknown230,
	unknown231,
	unknown232,
	unknown233,
	unknown234,
	unknown235,
	unknown236,
	unknown237,
	unknown238,
	unknown239,
	unknown240,
	unknown241,
	unknown242,
	unknown243,
	unknown244,
	unknown245,
	unknown246,
	unknown247,
	unknown248,
	unknown249,
	unknown250,
	unknown251,
	unknown252,
	unknown253,
	unknown254,
	unknown255,
	unknown256,
	unknown257,
	unknown258,
	unknown259,
	unknown260,
	unknown261,
	unknown262,
	unknown263,
	unknown264,
	unknown265,
	unknown266,
	unknown267,
	unknown268,
	unknown269,
	unknown270,
	unknown271,
	unknown272,
	unknown273,
	unknown274,
	unknown275,
	unknown276,
	unknown277,
	unknown278,
	unknown279,
	unknown280,
	unknown281,
	unknown282,
	unknown283,
	unknown284,
	unknown285,
	unknown286,
	unknown287,
	unknown288,
	unknown289,
	unknown290,
	unknown291,
	unknown292,
	unknown293,
	unknown294,
	unknown295,
	unknown296,
	unknown297,
	unknown298,
	unknown299,
	unknown300,
	unknown301,
	unknown302,
	unknown303,
	unknown304,
	unknown305,
	unknown306,
	unknown307,
	unknown308,
	unknown309,
	unknown310,
	unknown311,
	unknown312,
	unknown313,
	unknown314,
	unknown315,
	unknown316,
	unknown317,
	unknown318,
	unknown319,
	unknown320,
	unknown321,
	unknown322,
	unknown323,
	unknown324,
	unknown325,
	unknown326,
	unknown327,
	unknown328,
	unknown329,
	unknown330,
	unknown331,
	unknown332,
	unknown333,
	unknown334,
	unknown335,
	unknown336,
	unknown337,
	unknown338,
	unknown339,
	unknown340,
	unknown341,
	unknown342,
	unknown343,
	unknown344,
	unknown345,
	unknown346,
	unknown347,
	unknown348,
	unknown349,
	unknown350,
	unknown351,
	unknown352,
	unknown353,
	unknown354,
	unknown355,
	unknown356,
	unknown357,
	unknown358,
	unknown359,
	unknown360,
	unknown361,
	unknown362,
	unknown363,
	unknown364,
	unknown365,
	unknown366,
	unknown367,
	unknown368,
	unknown369,
	unknown370,
	unknown371,
	unknown372,
	unknown373,
	unknown374,
	unknown375,
	unknown376,
	unknown377,
	unknown378,
	unknown379,
	unknown380,
	unknown381,
	unknown382,
	unknown383,
	unknown384,
	unknown385,
	unknown386,
	unknown387,
	unknown388,
	unknown389,
	unknown390,
	unknown391,
	unknown392,
	unknown393,
	unknown394,
	unknown395,
	unknown396,
	unknown397,
	unknown398,
	unknown399,
	unknown400,
	unknown401,
	unknown402,
	unknown403,
	unknown404,
	unknown405,
	unknown406,
	unknown407,
	unknown408,
	unknown409,
	unknown410,
	unknown411,
	unknown412,
	unknown413,
	unknown414,
	unknown415,
	unknown416,
	unknown417,
	unknown418,
	unknown419,
	unknown420,
	unknown421,
	unknown422,
	unknown423,
	unknown424,
	unknown425,
	unknown426,
	unknown427,
	unknown428,
	unknown429,
	unknown430,
	unknown431,
	unknown432,
	unknown433,
	unknown434,
	unknown435,
	unknown436,
	unknown437,
	unknown438,
	unknown439,
	unknown440,
	unknown441,
	unknown442,
	unknown443,
	unknown444,
	unknown445,
	unknown446,
	unknown447,
	unknown448,
	unknown449,
	unknown450,
	unknown451,
	unknown452,
	unknown453,
	unknown454,
	unknown455,
	unknown456,
	unknown457,
	unknown458,
	unknown459,
	unknown460,
	unknown461,
	unknown462,
	unknown463,
	unknown464,
	unknown465,
	unknown466,
	unknown467,
	unknown468,
	unknown469,
	unknown470,
	unknown471,
	unknown472,
	unknown473,
	unknown474,
	unknown475,
	unknown476,
	unknown477,
	unknown478,
	unknown479,
	unknown480,
	unknown481,
	unknown482,
	unknown483,
	unknown484,
	unknown485,
	unknown486,
	unknown487,
	unknown488,
	unknown489,
	unknown490,
	unknown491,
	unknown492,
	unknown493,
	unknown494,
	unknown495,
	unknown496,
	unknown497,
	unknown498,
	unknown499,
	unknown500,
	unknown501,
	unknown502,
	unknown503,
	unknown504,
	unknown505,
	unknown506,
	unknown507,
	unknown508,
	unknown509,
	unknown510,
	unknown511,
	unknown512,
	unknown513,
	unknown514,
	unknown515,
	unknown516,
	unknown517,
	unknown518,
	unknown519,
	unknown520,
	unknown521,
	unknown522,
	unknown523,
	unknown524,
	unknown525,
	unknown526,
	unknown527,
	unknown528,
	unknown529,
	unknown530,
	unknown531,
	unknown532,
	unknown533,
	unknown534,
	unknown535,
	unknown536,
	unknown537,
	unknown538,
	unknown539,
	unknown540,
	unknown541,
	unknown542,
	unknown543,
	unknown544,
	unknown545,
	unknown546,
	unknown547,
	unknown548,
	unknown549,
	unknown550,
	unknown551,
	unknown552,
	unknown553,
	unknown554,
	unknown555,
	unknown556,
	unknown557,
	unknown558,
	unknown559,
	unknown560,
	unknown561,
	unknown562,
	unknown563,
	unknown564,
	unknown565,
	unknown566,
	unknown567,
	unknown568,
	unknown569,
	unknown570,
	unknown571,
	unknown572,
	unknown573,
	unknown574,
	unknown575,
	unknown576,
	unknown577,
	unknown578,
	unknown579,
	unknown580,
	unknown581,
	unknown582,
	unknown583,
	unknown584,
	unknown585,
	unknown586,
	unknown587,
	unknown588,
	unknown589,
	unknown590,
	unknown591,
	unknown592,
	unknown593,
	unknown594,
	unknown595,
	unknown596,
	unknown597,
	unknown598,
	unknown599,
	unknown600,
	unknown601,
	unknown602,
	unknown603,
	unknown604,
	unknown605,
	unknown606,
	unknown607,
	unknown608,
	unknown609,
	unknown610,
	unknown611,
	unknown612,
	unknown613,
	unknown614,
	unknown615,
	unknown616,
	unknown617,
	unknown618,
	unknown619,
	unknown620,
	unknown621,
	unknown622,
	unknown623,
	unknown624,
	unknown625,
	unknown626,
	unknown627,
	unknown628,
	unknown629,
	unknown630,
	unknown631,
	unknown632,
	unknown633,
	unknown634,
	unknown635,
	unknown636,
	unknown637,
	unknown638,
	unknown639,
	unknown640,
	unknown641,
	unknown642,
	unknown643,
	unknown644,
	unknown645,
	unknown646,
	unknown647,
	unknown648,
	unknown649,
	unknown650,
	unknown651,
	unknown652,
	unknown653,
	unknown654,
	unknown655,
	unknown656,
	unknown657,
	unknown658,
	unknown659,
	unknown660,
	unknown661,
	unknown662,
	unknown663,
	unknown664,
	unknown665,
	unknown666,
	unknown667,
	unknown668,
	unknown669,
	unknown670,
	unknown671,
	unknown672,
	unknown673,
	unknown674,
	unknown675,
	unknown676,
	unknown677,
	unknown678,
	unknown679,
	unknown680,
	unknown681,
	unknown682,
	unknown683,
	unknown684,
	unknown685,
	unknown686,
	unknown687,
	unknown688,
	unknown689,
	unknown690,
	unknown691,
	unknown692,
	unknown693,
	unknown694,
	unknown695,
	unknown696,
	unknown697,
	unknown698,
	unknown699,
	unknown700,
	unknown701,
	unknown702,
	unknown703,
	unknown704,
	unknown705,
	unknown706,
	unknown707,
	unknown708,
	unknown709,
	unknown710,
	unknown711,
	unknown712,
	unknown713,
	unknown714,
	unknown715,
	unknown716,
	unknown717,
	unknown718,
	unknown719,
	unknown720,
	unknown721,
	unknown722,
	unknown723,
	unknown724,
	unknown725,
	unknown726,
	unknown727,
	unknown728,
	unknown729,
	unknown730,
	unknown731,
	unknown732,
	unknown733,
	unknown734,
	unknown735,
	unknown736,
	unknown737,
	unknown738,
	unknown739,
	unknown740,
	unknown741,
	unknown742,
	unknown743,
	unknown744,
	unknown745,
	unknown746,
	unknown747,
	unknown748,
	unknown749,
	unknown750,
	unknown751,
	unknown752,
	unknown753,
	unknown754,
	unknown755,
	unknown756,
	unknown757,
	unknown758,
	unknown759,
	unknown760,
	unknown761,
	unknown762,
	unknown763,
	unknown764,
	unknown765,
	unknown766,
	unknown767,
	unknown768,
	unknown769,
	unknown770,
	unknown771,
	unknown772,
	unknown773,
	unknown774,
	unknown775,
	unknown776,
	unknown777,
	unknown778,
	unknown779,
	unknown780,
	unknown781,
	unknown782,
	unknown783,
	unknown784,
	unknown785,
	unknown786,
	unknown787,
	titleScreen1,
	titleScreen2,
	titleScreen3,
	titleScreen4,
	titleScreen5,
	titleScreen6,
	titleScreen7,
	titleScreen8,
	titleScreen9,
	titleScreen10,
	titleScreen11,
	unknown799,
	unknown800,
	unknown801,
	unknown802,
	unknown803,
	unknown804,
	unknown805,
	unknown806,
	unknown807,
	unknown808,
	unknown809,
	unknown810,
	unknown811,
	unknown812,
	unknown813,
	unknown814,
	unknown815,
	unknown816,
	unknown817,
	unknown818,
	unknown819,
	unknown820,
	unknown821,
	unknown822,
	unknown823,
	unknown824,
	unknown825,
	unknown826,
	unknown827,
	unknown828,
	unknown829,
	unknown830,
	unknown831,
	unknown832,
	unknown833,
	unknown834,
	unknown835,
	unknown836,
	unknown837,
	unknown838,
	unknown839,
	unknown840,
	unknown841,
	unknown842,
	unknown843,
	unknown844,
	unknown845,
	unknown846,
	unknown847,
	unknown848,
	unknown849,
	unknown850,
	unknown851,
	unknown852,
	unknown853,
	unknown854,
	unknown855,
	unknown856,
	unknown857,
	unknown858,
	unknown859,
	unknown860,
	unknown861,
	unknown862,
	unknown863,
	unknown864,
	unknown865,
	unknown866,
	unknown867,
	unknown868,
	unknown869,
	unknown870,
	unknown871,
	unknown872,
	unknown873,
	unknown874,
	unknown875,
	unknown876,
	unknown877,
	unknown878,
	unknown879,
	unknown880,
	unknown881,
	unknown882,
	unknown883,
	unknown884,
	unknown885,
	unknown886,
	unknown887,
	unknown888,
	unknown889,
	unknown890,
	unknown891,
	unknown892,
	unknown893,
	unknown894,
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
	unknownDebug001 = 0x001,
	unknown002 = 0x002,
	unknown003 = 0x003,
	unknown004 = 0x004,
	unknown005 = 0x005,
	unknown006 = 0x006,
	unknown007 = 0x007,
	unknown008 = 0x008,
	unknown009 = 0x009,
	unknown00A = 0x00A,
	unknown00B = 0x00B,
	unknown00C = 0x00C,
	unknown00D = 0x00D,
	unknown00E = 0x00E,
	unknown00F = 0x00F,
	unknown010 = 0x010,
	unknown011 = 0x011,
	buzzBuzzInParty = 0x012,
	unknown013 = 0x013,
	unknown014 = 0x014,
	unknown015 = 0x015,
	unknown016 = 0x016,
	tonyJoinedYou = 0x017,
	unknown018 = 0x018,
	unknown019 = 0x019,
	unknown01A = 0x01A,
	unknown01B = 0x01B,
	unknown01C = 0x01C,
	unknown01D = 0x01D,
	unknown01E = 0x01E,
	unknown01F = 0x01F,
	unknown020 = 0x020,
	unknown021 = 0x021,
	unknown022 = 0x022,
	unknown023 = 0x023,
	unknown024 = 0x024,
	unknown025 = 0x025,
	unknown026 = 0x026,
	unknown027 = 0x027,
	onetGuardsharkDisappear = 0x28,
	unknown029 = 0x029,
	unknown02A = 0x02A,
	unknown02B = 0x02B,
	unknown02C = 0x02C,
	unknown02D = 0x02D,
	unknown02E = 0x02E,
	unknown02F = 0x02F,
	unknown030 = 0x030,
	boogeyTentActive = 0x31,
	unknown032 = 0x032,
	unknown033 = 0x033,
	unknown034 = 0x034,
	unknown035 = 0x035,
	unknown036 = 0x036,
	unknown037 = 0x037,
	unknown038 = 0x038,
	unknown039 = 0x039,
	unknown03A = 0x03A,
	unknown03B = 0x03B,
	unknown03C = 0x03C,
	unknown03D = 0x03D,
	unknown03E = 0x03E,
	unknown03F = 0x03F,
	winFrank = 0x40,
	unknown041 = 0x041,
	unknown042 = 0x042,
	unknown043 = 0x043,
	unknown044 = 0x044,
	unknown045 = 0x045,
	unknown046 = 0x046,
	unknown047 = 0x047,
	unknown048 = 0x048,
	usePostgameMusic = 0x049,
	magicantCompleted = 0x04A,
	unknown04B = 0x04B,
	unknown04C = 0x04C,
	unknown04D = 0x04D,
	unknown04E = 0x04E,
	unknown04F = 0x04F,
	unknown050 = 0x050,
	unknown051 = 0x051,
	unknown052 = 0x052,
	unknown053 = 0x053,
	unknown054 = 0x054,
	unknown055 = 0x055,
	unknown056 = 0x056,
	unknown057 = 0x057,
	unknown058 = 0x058,
	unknown059 = 0x059,
	dustyDunesDigComplete = 0x5A,
	unknown05B = 0x05B,
	unknown05C = 0x05C,
	unknown05D = 0x05D,
	unknown05E = 0x05E,
	unknown05F = 0x05F,
	unknown060 = 0x060,
	unknown061 = 0x061,
	unknown062 = 0x062,
	unknown063 = 0x063,
	unknown064 = 0x064,
	unknown065 = 0x065,
	unknown066 = 0x066,
	unknown067 = 0x067,
	unknown068 = 0x068,
	unknown069 = 0x069,
	unknown06A = 0x06A,
	unknown06B = 0x06B,
	unknown06C = 0x06C,
	unknown06D = 0x06D,
	unknown06E = 0x06E,
	unknown06F = 0x06F,
	unknown070 = 0x070,
	unknown071 = 0x071,
	unknown072 = 0x072,
	unknown073 = 0x073,
	unknown074 = 0x074,
	unknown075 = 0x075,
	unknown076 = 0x076,
	unknown077 = 0x077,
	unknown078 = 0x078,
	unknown079 = 0x079,
	unknown07A = 0x07A,
	unknown07B = 0x07B,
	placedZombiePaper = 0x07C,
	unknown07D = 0x07D,
	unknown07E = 0x07E,
	unknown07F = 0x07F,
	unknown080 = 0x080,
	unknown081 = 0x081,
	unknown082 = 0x082,
	unknown083 = 0x083,
	unknown084 = 0x084,
	unknown085 = 0x085,
	unknown086 = 0x086,
	unknown087 = 0x087,
	unknown088 = 0x088,
	unknown089 = 0x089,
	unknown08A = 0x08A,
	unknown08B = 0x08B,
	unknown08C = 0x08C,
	unknown08D = 0x08D,
	unknown08E = 0x08E,
	unknown08F = 0x08F,
	unknown090 = 0x090,
	unknown091 = 0x091,
	unknown092 = 0x092,
	unknown093 = 0x093,
	unknown094 = 0x094,
	dalaamIntroPlayed = 0x095,
	unknown096 = 0x096,
	unknown097 = 0x097,
	unknown098 = 0x098,
	unknown099 = 0x099,
	unknown09A = 0x09A,
	unknown09B = 0x09B,
	unknown09C = 0x09C,
	unknown09D = 0x09D,
	unknown09E = 0x09E,
	unknown09F = 0x09F,
	unknown0A0 = 0x0A0,
	unknown0A1 = 0x0A1,
	unknown0A2 = 0x0A2,
	unknown0A3 = 0x0A3,
	unknown0A4 = 0x0A4,
	unknown0A5 = 0x0A5,
	unknown0A6 = 0x0A6,
	unknown0A7 = 0x0A7,
	unknown0A8 = 0x0A8,
	unknown0A9 = 0x0A9,
	unknown0AA = 0x0AA,
	unknown0AB = 0x0AB,
	unknown0AC = 0x0AC,
	unknown0AD = 0x0AD,
	mineExpanded = 0x0AE,
	unknown0AF = 0x0AF,
	unknown0B0 = 0x0B0,
	unknown0B1 = 0x0B1,
	unknown0B2 = 0x0B2,
	unknown0B3 = 0x0B3,
	unknown0B4 = 0x0B4,
	unknown0B5 = 0x0B5,
	soundStoneMelody1 = 0xB6,
	soundStoneMelody2 = 0xB7,
	soundStoneMelody4 = 0xB8,
	soundStoneMelody3 = 0xB9,
	soundStoneMelody5 = 0xBA,
	soundStoneMelody6 = 0xBB,
	soundStoneMelody7 = 0xBC,
	soundStoneMelody8 = 0xBD,
	defeatedSanctuaryBoss1 = 0xBE,
	defeatedSanctuaryBoss2 = 0xBF,
	defeatedSanctuaryBoss4 = 0xC0,
	defeatedSanctuaryBoss3 = 0xC1,
	defeatedSanctuaryBoss5 = 0xC2,
	defeatedSanctuaryBoss6 = 0xC3,
	defeatedSanctuaryBoss7 = 0xC4,
	defeatedSanctuaryBoss8 = 0xC5,
	unknown0C6 = 0xC6,
	dadPhoneUnlocked = 0xC7,
	momPhoneUnlocked = 0xC8,
	escargoExpressPhoneUnlocked = 0xC9,
	machPizzaPhoneUnlocked = 0xCA,
	stoicClubPhoneUnlocked = 0xCB,
	flyingMan1Dead = 0xCC,
	flyingMan2Dead = 0xCD,
	flyingMan3Dead = 0xCE,
	flyingMan4Dead = 0xCF,
	flyingMan5Dead = 0xD0,
	onettReached = 0xD1,
	twosonReached = 0xD2,
	threedReached = 0xD3,
	wintersReached = 0xD4,
	saturnValleyReached = 0xD5,
	foursideReached = 0xD6,
	summersReached = 0xD7,
	dalaamReached = 0xD8,
	scarabaReached = 0xD9,
	deepDarknessReached = 0xDA,
	tendaVillageReached = 0xDB,
	underworldReached = 0xDC,
	unknown0DD = 0x0DD,
	unknown0DE = 0x0DE,
	unknown0DF = 0x0DF,
	unknown0E0 = 0x0E0,
	unknown0E1 = 0x0E1,
	atStoreOnettDrugstoreEquipment = 0xE2,
	atStoreOnettDrugstorePharmacy = 0xE3,
	atStore0E4 = 0x0E4,
	atStore0E5 = 0x0E5,
	atStore0E6 = 0x0E6,
	atStore0E7 = 0x0E7,
	atStore0E8 = 0x0E8,
	atStore0E9 = 0x0E9,
	atStore0EA = 0x0EA,
	atStore0EB = 0x0EB,
	atStore0EC = 0x0EC,
	atStore0ED = 0x0ED,
	atStore0EE = 0x0EE,
	atStore0EF = 0x0EF,
	atStore0F0 = 0x0F0,
	atStore0F1 = 0x0F1,
	atStore0F2 = 0x0F2,
	atStore0F3 = 0x0F3,
	atStore0F4 = 0x0F4,
	atStore0F5 = 0x0F5,
	atStore0F6 = 0x0F6,
	atStore0F7 = 0x0F7,
	atStore0F8 = 0x0F8,
	atStore0F9 = 0x0F9,
	atStore0FA = 0x0FA,
	atStore0FB = 0x0FB,
	atStore0FC = 0x0FC,
	atStore0FD = 0x0FD,
	atStore0FE = 0x0FE,
	atStore0FF = 0x0FF,
	atStore100 = 0x100,
	atStore101 = 0x101,
	atStore102 = 0x102,
	atStore103 = 0x103,
	atStore104 = 0x104,
	atStore105 = 0x105,
	atStore106 = 0x106,
	atStore107 = 0x107,
	atStore108 = 0x108,
	atStore109 = 0x109,
	atStore10A = 0x10A,
	atStore10B = 0x10B,
	atStore10C = 0x10C,
	atStore10D = 0x10D,
	atStore10E = 0x10E,
	atStore10F = 0x10F,
	unknown110 = 0x110,
	unknown111 = 0x111,
	unknown112 = 0x112,
	unknown113 = 0x113,
	unknown114 = 0x114,
	unknown115 = 0x115,
	unknown116 = 0x116,
	unknown117 = 0x117,
	unknown118 = 0x118,
	unknown119 = 0x119,
	unknown11A = 0x11A,
	unknown11B = 0x11B,
	unknown11C = 0x11C,
	unknown11D = 0x11D,
	unknown11E = 0x11E,
	unknown11F = 0x11F,
	unknown120 = 0x120,
	unknown121 = 0x121,
	unknown122 = 0x122,
	unknown123 = 0x123,
	unknown124 = 0x124,
	unknown125 = 0x125,
	unknown126 = 0x126,
	unknown127 = 0x127,
	unknown128 = 0x128,
	unknown129 = 0x129,
	unknown12A = 0x12A,
	unknown12B = 0x12B,
	unknown12C = 0x12C,
	unknown12D = 0x12D,
	unknown12E = 0x12E,
	unknown12F = 0x12F,
	unknown130 = 0x130,
	unknown131 = 0x131,
	unknown132 = 0x132,
	unknown133 = 0x133,
	unknown134 = 0x134,
	unknown135 = 0x135,
	unknown136 = 0x136,
	unknown137 = 0x137,
	unknown138 = 0x138,
	unknown139 = 0x139,
	unknown13A = 0x13A,
	unknown13B = 0x13B,
	unknown13C = 0x13C,
	unknown13D = 0x13D,
	unknown13E = 0x13E,
	unknown13F = 0x13F,
	unknown140 = 0x140,
	unknown141 = 0x141,
	unknown142 = 0x142,
	unknown143 = 0x143,
	atStore144 = 0x144,
	atStore145 = 0x145,
	atStore146 = 0x146,
	unknown147 = 0x147,
	unknown148 = 0x148,
	unknown149 = 0x149,
	unknown14A = 0x14A,
	unknown14B = 0x14B,
	unknown14C = 0x14C,
	unknown14D = 0x14D,
	unknown14E = 0x14E,
	unknown14F = 0x14F,
	unknown150 = 0x150,
	haveStoicClubReservation = 0x151,
	unknown152 = 0x152,
	unknown153 = 0x153,
	unknown154 = 0x154,
	unknown155 = 0x155,
	unknown156 = 0x156,
	unknown157 = 0x157,
	unknown158 = 0x158,
	unknown159 = 0x159,
	unknown15A = 0x15A,
	unknown15B = 0x15B,
	unknown15C = 0x15C,
	unknown15D = 0x15D,
	unknown15E = 0x15E,
	unknown15F = 0x15F,
	unknown160 = 0x160,
	unknown161 = 0x161,
	unknown162 = 0x162,
	unknown163 = 0x163,
	unknown164 = 0x164,
	unknown165 = 0x165,
	unknown166 = 0x166,
	unknown167 = 0x167,
	unknown168 = 0x168,
	unknown169 = 0x169,
	unknown16A = 0x16A,
	unknown16B = 0x16B,
	unknown16C = 0x16C,
	onetSharkCDisappear = 0x16D,
	unknown16E = 0x16E,
	unknown16F = 0x16F,
	unknown170 = 0x170,
	unknown171 = 0x171,
	unknown172 = 0x172,
	unknown173 = 0x173,
	unknown174 = 0x174,
	unknown175 = 0x175,
	unknown176 = 0x176,
	unknown177 = 0x177,
	unknown178 = 0x178,
	unknown179 = 0x179,
	unknown17A = 0x17A,
	unknown17B = 0x17B,
	unknown17C = 0x17C,
	unknown17D = 0x17D,
	unknown17E = 0x17E,
	justRested = 0x17F,
	unknown180 = 0x180,
	unknown181 = 0x181,
	firePlugFought = 0x182,
	roboPump1Fought = 0x183,
	roboPump2Fought = 0x184,
	abstractArtFought = 0x185,
	guardianHieroglyph1Fought = 0x186,
	guardianHieroglyph2Fought = 0x187,
	unknown188 = 0x188,
	unknown189 = 0x189,
	unknown18A = 0x18A,
	unknown18B = 0x18B,
	unknown18C = 0x18C,
	unknown18D = 0x18D,
	unknown18E = 0x18E,
	unknown18F = 0x18F,
	unknown190 = 0x190,
	unknown191 = 0x191,
	unknown192 = 0x192,
	unknown193 = 0x193,
	unknown194 = 0x194,
	unknown195 = 0x195,
	unknown196 = 0x196,
	unknown197 = 0x197,
	unknown198 = 0x198,
	unknown199 = 0x199,
	unknown19A = 0x19A,
	unknown19B = 0x19B,
	unknown19C = 0x19C,
	unknown19D = 0x19D,
	unknown19E = 0x19E,
	unknown19F = 0x19F,
	madDuck1Fought = 0x1A0,
	madDuck2Fought = 0x1A1,
	worthlessProtoplasm1Fought = 0x1A2,
	worthlessProtoplasm2Fought = 0x1A3,
	rowdyMouse1Fought = 0x1A4,
	rowdyMouse2Fought = 0x1A5,
	unknown1A6 = 0x1A6,
	unknown1A7 = 0x1A7,
	unknown1A8 = 0x1A8,
	unknown1A9 = 0x1A9,
	unknown1AA = 0x1AA,
	unknown1AB = 0x1AB,
	unknown1AC = 0x1AC,
	unknown1AD = 0x1AD,
	unknown1AE = 0x1AE,
	unknown1AF = 0x1AF,
	unknown1B0 = 0x1B0,
	zombieLadyActive = 0x1B1,
	unknown1B2 = 0x1B2,
	unknown1B3 = 0x1B3,
	unknown1B4 = 0x1B4,
	unknown1B5 = 0x1B5,
	unknown1B6 = 0x1B6,
	unknown1B7 = 0x1B7,
	unknown1B8 = 0x1B8,
	unknown1B9 = 0x1B9,
	unknown1BA = 0x1BA,
	unknown1BB = 0x1BB,
	unknown1BC = 0x1BC,
	unknown1BD = 0x1BD,
	forSaleSignNPC1Coming = 0x1BE,
	unknown1BF = 0x1BF,
	unknown1C0 = 0x1C0,
	unknown1C1 = 0x1C1,
	unknown1C2 = 0x1C2,
	unknown1C3 = 0x1C3,
	unknown1C4 = 0x1C4,
	unknown1C5 = 0x1C5,
	unknown1C6 = 0x1C6,
	unknown1C7 = 0x1C7,
	unknown1C8 = 0x1C8,
	unknown1C9 = 0x1C9,
	unknown1CA = 0x1CA,
	unknown1CB = 0x1CB,
	unknown1CC = 0x1CC,
	unknown1CD = 0x1CD,
	unknown1CE = 0x1CE,
	unknown1CF = 0x1CF,
	unknown1D0 = 0x1D0,
	unknown1D1 = 0x1D1,
	unknown1D2 = 0x1D2,
	unknown1D3 = 0x1D3,
	unknown1D4 = 0x1D4,
	unknown1D5 = 0x1D5,
	unknown1D6 = 0x1D6,
	unknown1D7 = 0x1D7,
	unknown1D8 = 0x1D8,
	unknown1D9 = 0x1D9,
	unknown1DA = 0x1DA,
	noContinueSelected = 0x1DB,
	unknown1DC = 0x1DC,
	unknown1DD = 0x1DD,
	atStore1DE = 0x1DE,
	unknown1DF = 0x1DF,
	unknown1E0 = 0x1E0,
	unknown1E1 = 0x1E1,
	unknown1E2 = 0x1E2,
	unknown1E3 = 0x1E3,
	unknown1E4 = 0x1E4,
	unknown1E5 = 0x1E5,
	unknown1E6 = 0x1E6,
	unknown1E7 = 0x1E7,
	unknown1E8 = 0x1E8,
	unknown1E9 = 0x1E9,
	unknown1EA = 0x1EA,
	unknown1EB = 0x1EB,
	unknown1EC = 0x1EC,
	unknown1ED = 0x1ED,
	unknown1EE = 0x1EE,
	unknown1EF = 0x1EF,
	unknown1F0 = 0x1F0,
	unknown1F1 = 0x1F1,
	unknown1F2 = 0x1F2,
	unknown1F3 = 0x1F3,
	unknown1F4 = 0x1F4,
	unknown1F5 = 0x1F5,
	unknown1F6 = 0x1F6,
	unknown1F7 = 0x1F7,
	unknown1F8 = 0x1F8,
	unknown1F9 = 0x1F9,
	unknown1FA = 0x1FA,
	unknown1FB = 0x1FB,
	unknown1FC = 0x1FC,
	unknown1FD = 0x1FD,
	unknown1FE = 0x1FE,
	unknown1FF = 0x1FF,
	unknown200 = 0x200,
	unknown201 = 0x201,
	unknown202 = 0x202,
	unknown203 = 0x203,
	unknown204 = 0x204,
	unknown205 = 0x205,
	unknown206 = 0x206,
	unknown207 = 0x207,
	unknown208 = 0x208,
	unknown209 = 0x209,
	unknown20A = 0x20A,
	unknown20B = 0x20B,
	unknown20C = 0x20C,
	unknown20D = 0x20D,
	unknown20E = 0x20E,
	unknown20F = 0x20F,
	unknown210 = 0x210,
	unknown211 = 0x211,
	unknown212 = 0x212,
	unknown213 = 0x213,
	unknown214 = 0x214,
	unknown215 = 0x215,
	onCityBus = 0x216,
	unknown217 = 0x217,
	unknown218 = 0x218,
	onTessie = 0x219,
	unknown21A = 0x21A,
	unknown21B = 0x21B,
	unknown21C = 0x21C,
	unknown21D = 0x21D,
	unknown21E = 0x21E,
	unknown21F = 0x21F,
	unknown220 = 0x220,
	unknown221 = 0x221,
	unknown222 = 0x222,
	unknown223 = 0x223,
	unknown224 = 0x224,
	unknown225 = 0x225,
	unknown226 = 0x226,
	unknown227 = 0x227,
	receivedZombiePaper = 0x228,
	unknown229 = 0x229,
	unknown22A = 0x22A,
	unknown22B = 0x22B,
	unknown22C = 0x22C,
	unknown22D = 0x22D,
	unknown22E = 0x22E,
	unknown22F = 0x22F,
	unknown230 = 0x230,
	unknown231 = 0x231,
	unknown232 = 0x232,
	unknown233 = 0x233,
	unknown234 = 0x234,
	unknown235 = 0x235,
	unknown236 = 0x236,
	unknown237 = 0x237,
	unknown238 = 0x238,
	unknown239 = 0x239,
	unknown23A = 0x23A,
	unknown23B = 0x23B,
	unknown23C = 0x23C,
	unknown23D = 0x23D,
	unknown23E = 0x23E,
	unknown23F = 0x23F,
	unknown240 = 0x240,
	unknown241 = 0x241,
	unknown242 = 0x242,
	unknown243 = 0x243,
	unknown244 = 0x244,
	unknown245 = 0x245,
	unknown246 = 0x246,
	unknown247 = 0x247,
	unknown248 = 0x248,
	unknown249 = 0x249,
	unknown24A = 0x24A,
	unknown24B = 0x24B,
	unknown24C = 0x24C,
	unknown24D = 0x24D,
	unknown24E = 0x24E,
	unknown24F = 0x24F,
	unknown250 = 0x250,
	unknown251 = 0x251,
	unknown252 = 0x252,
	unknown253 = 0x253,
	unknown254 = 0x254,
	atStore255 = 0x255,
	atStore256 = 0x256,
	atStore257 = 0x257,
	atStore258 = 0x258,
	unknown259 = 0x259,
	unknown25A = 0x25A,
	unknown25B = 0x25B,
	unknown25C = 0x25C,
	unknown25D = 0x25D,
	unknown25E = 0x25E,
	unknown25F = 0x25F,
	unknown260 = 0x260,
	unknown261 = 0x261,
	unknown262 = 0x262,
	unknown263 = 0x263,
	unknown264 = 0x264,
	unknown265 = 0x265,
	unknown266 = 0x266,
	unknown267 = 0x267,
	unknown268 = 0x268,
	unknown269 = 0x269,
	unknown26A = 0x26A,
	unknown26B = 0x26B,
	unknown26C = 0x26C,
	unknown26D = 0x26D,
	unknown26E = 0x26E,
	unknown26F = 0x26F,
	unknown270 = 0x270,
	unknown271 = 0x271,
	unknown272 = 0x272,
	unknown273 = 0x273,
	unknown274 = 0x274,
	unknown275 = 0x275,
	unknown276 = 0x276,
	unknown277 = 0x277,
	unknown278 = 0x278,
	unknown279 = 0x279,
	paulasFirstCallToNess = 0x27A,
	paulasSecondCallToNess = 0x27B,
	paulasCallToJeff = 0x27C,
	unknown27D = 0x27D,
	unknown27E = 0x27E,
	unknown27F = 0x27F,
	unknown280 = 0x280,
	unknown281 = 0x281,
	unknown282 = 0x282,
	unknown283 = 0x283,
	unknown284 = 0x284,
	unknown285 = 0x285,
	forSaleSignNPC2Coming = 0x286,
	forSaleSignNPC3Coming = 0x287,
	forSaleSignNPC4Coming = 0x288,
	unknown289 = 0x289,
	unknown28A = 0x28A,
	unknown28B = 0x28B,
	unknown28C = 0x28C,
	atStore28D = 0x28D,
	unknown28E = 0x28E,
	onSkyRunner = 0x28F,
	unknown290 = 0x290,
	unknown291 = 0x291,
	unknown292 = 0x292,
	unknown293 = 0x293,
	unknown294 = 0x294,
	unknown295 = 0x295,
	unknown296 = 0x296,
	unknown297 = 0x297,
	unknown298 = 0x298,
	unknown299 = 0x299,
	unknown29A = 0x29A,
	unknown29B = 0x29B,
	unknown29C = 0x29C,
	unknown29D = 0x29D,
	unknown29E = 0x29E,
	unknown29F = 0x29F,
	unknown2A0 = 0x2A0,
	unknown2A1 = 0x2A1,
	unknown2A2 = 0x2A2,
	deliveringZombiePaper = 0x2A3,
	unknown2A4 = 0x2A4,
	unknown2A5 = 0x2A5,
	unknown2A6 = 0x2A6,
	unknown2A7 = 0x2A7,
	unknown2A8 = 0x2A8,
	unknown2A9 = 0x2A9,
	unknown2AA = 0x2AA,
	unknown2AB = 0x2AB,
	unknown2AC = 0x2AC,
	unknown2AD = 0x2AD,
	unknown2AE = 0x2AE,
	unknown2AF = 0x2AF,
	unknown2B0 = 0x2B0,
	momWantsToHearAboutPaula = 0x2B1,
	unknown2B2 = 0x2B2,
	unknown2B3 = 0x2B3,
	unknown2B4 = 0x2B4,
	unknown2B5 = 0x2B5,
	unknown2B6 = 0x2B6,
	unknown2B7 = 0x2B7,
	jeffFixedFirstItem = 0x2B8,
	unknown2B9 = 0x2B9,
	unknown2BA = 0x2BA,
	unknown2BB = 0x2BB,
	unknown2BC = 0x2BC,
	unknown2BD = 0x2BD,
	unknown2BE = 0x2BE,
	unknown2BF = 0x2BF,
	unknown2C0 = 0x2C0,
	unknown2C1 = 0x2C1,
	unknown2C2 = 0x2C2,
	unknown2C3 = 0x2C3,
	unknown2C4 = 0x2C4,
	unknown2C5 = 0x2C5,
	unknown2C6 = 0x2C6,
	unknown2C7 = 0x2C7,
	unknown2C8 = 0x2C8,
	unknown2C9 = 0x2C9,
	unknown2CA = 0x2CA,
	unknown2CB = 0x2CB,
	unknown2CC = 0x2CC,
	unknown2CD = 0x2CD,
	unknown2CE = 0x2CE,
	unknown2CF = 0x2CF,
	unknown2D0 = 0x2D0,
	unknown2D1 = 0x2D1,
	unknown2D2 = 0x2D2,
	unknown2D3 = 0x2D3,
	unknown2D4 = 0x2D4,
	unknown2D5 = 0x2D5,
	unknown2D6 = 0x2D6,
	unknown2D7 = 0x2D7,
	unknown2D8 = 0x2D8,
	unknown2D9 = 0x2D9,
	unknown2DA = 0x2DA,
	atStore2DB = 0x2DB,
	atStore2DC = 0x2DC,
	atStore2DD = 0x2DD,
	unknown2DE = 0x2DE,
	unknown2DF = 0x2DF,
	unknown2E0 = 0x2E0,
	unknown2E1 = 0x2E1,
	unknown2E2 = 0x2E2,
	unknown2E3 = 0x2E3,
	unknown2E4 = 0x2E4,
	unknown2E5 = 0x2E5,
	unknown2E6 = 0x2E6,
	unknown2E7 = 0x2E7,
	unknown2E8 = 0x2E8,
	unknown2E9 = 0x2E9,
	unknown2EA = 0x2EA,
	unknown2EB = 0x2EB,
	unknown2EC = 0x2EC,
	nessPajamas = 0x2ED,
	unknown2EE = 0x2EE,
	unknown2EF = 0x2EF,
	unknown2F0 = 0x2F0,
	unknown2F1 = 0x2F1,
	npcDelivery = 0x2F2,
	unknown2F3 = 0x2F3,
	unknown2F4 = 0x2F4,
	needToPickUpDiamond = 0x2F5,
	unknown2F6 = 0x2F6,
	unknown2F7 = 0x2F7,
	unknown2F8 = 0x2F8,
	unknown2F9 = 0x2F9,
	unknown2FA = 0x2FA,
	unknown2FB = 0x2FB,
	unknown2FC = 0x2FC,
	unknown2FD = 0x2FD,
	unknown2FE = 0x2FE,
	unknown2FF = 0x2FF,
	unknown300 = 0x300,
	unknown301 = 0x301,
	unknown302 = 0x302,
	unknown303 = 0x303,
	unknown304 = 0x304,
	unknown305 = 0x305,
	unknown306 = 0x306,
	unknown307 = 0x307,
	unknown308 = 0x308,
	unknown309 = 0x309,
	unknown30A = 0x30A,
	unknown30B = 0x30B,
	unknown30C = 0x30C,
	unknown30D = 0x30D,
	unknown30E = 0x30E,
	unknown30F = 0x30F,
	unknown310 = 0x310,
	unknown311 = 0x311,
	unknown312 = 0x312,
	unknown313 = 0x313,
	unknown314 = 0x314,
	unknown315 = 0x315,
	unknown316 = 0x316,
	unknown317 = 0x317,
	unknown318 = 0x318,
	unknown319 = 0x319,
	unknown31A = 0x31A,
	unknown31B = 0x31B,
	unknown31C = 0x31C,
	unknown31D = 0x31D,
	unknown31E = 0x31E,
	unknown31F = 0x31F,
	unknown320 = 0x320,
	unknown321 = 0x321,
	unknown322 = 0x322,
	unknown323 = 0x323,
	unknown324 = 0x324,
	unknown325 = 0x325,
	unknown326 = 0x326,
	unknown327 = 0x327,
	unknown328 = 0x328,
	unknown329 = 0x329,
	unknown32A = 0x32A,
	unknown32B = 0x32B,
	unknown32C = 0x32C,
	unknown32D = 0x32D,
	unknown32E = 0x32E,
	unknown32F = 0x32F,
	unknown330 = 0x330,
	unknown331 = 0x331,
	unknown332 = 0x332,
	unknown333 = 0x333,
	unknown334 = 0x334,
	unknown335 = 0x335,
	unknown336 = 0x336,
	unknown337 = 0x337,
	unknown338 = 0x338,
	unknown339 = 0x339,
	unknown33A = 0x33A,
	unknown33B = 0x33B,
	unknown33C = 0x33C,
	unknown33D = 0x33D,
	unknown33E = 0x33E,
	unknown33F = 0x33F,
	unknown340 = 0x340,
	unknown341 = 0x341,
	unknown342 = 0x342,
	unknown343 = 0x343,
	unknown344 = 0x344,
	unknown345 = 0x345,
	unknown346 = 0x346,
	unknown347 = 0x347,
	unknown348 = 0x348,
	unknown349 = 0x349,
	unknown34A = 0x34A,
	unknown34B = 0x34B,
	unknown34C = 0x34C,
	unknown34D = 0x34D,
	unknown34E = 0x34E,
	unknown34F = 0x34F,
	unknown350 = 0x350,
	unknown351 = 0x351,
	unknown352 = 0x352,
	unknown353 = 0x353,
	unknown354 = 0x354,
	unknown355 = 0x355,
	unknown356 = 0x356,
	unknown357 = 0x357,
	unknown358 = 0x358,
	unknown359 = 0x359,
	unknown35A = 0x35A,
	unknown35B = 0x35B,
	unknown35C = 0x35C,
	unknown35D = 0x35D,
	unknown35E = 0x35E,
	unknown35F = 0x35F,
	unknown360 = 0x360,
	unknown361 = 0x361,
	unknown362 = 0x362,
	unknown363 = 0x363,
	unknown364 = 0x364,
	unknown365 = 0x365,
	unknown366 = 0x366,
	unknown367 = 0x367,
	unknown368 = 0x368,
	unknown369 = 0x369,
	unknown36A = 0x36A,
	unknown36B = 0x36B,
	unknown36C = 0x36C,
	unknown36D = 0x36D,
	unknown36E = 0x36E,
	unknown36F = 0x36F,
	unknown370 = 0x370,
	unknown371 = 0x371,
	unknown372 = 0x372,
	unknown373 = 0x373,
	unknown374 = 0x374,
	unknown375 = 0x375,
	unknown376 = 0x376,
	unknown377 = 0x377,
	unknown378 = 0x378,
	unknown379 = 0x379,
	unknown37A = 0x37A,
	unknown37B = 0x37B,
	unknown37C = 0x37C,
	unknown37D = 0x37D,
	unknown37E = 0x37E,
	unknown37F = 0x37F,
	unknown380 = 0x380,
	unknown381 = 0x381,
	unknown382 = 0x382,
	unknown383 = 0x383,
	unknown384 = 0x384,
	unknown385 = 0x385,
	unknown386 = 0x386,
	unknown387 = 0x387,
	unknown388 = 0x388,
	unknown389 = 0x389,
	unknown38A = 0x38A,
	unknown38B = 0x38B,
	unknown38C = 0x38C,
	unknown38D = 0x38D,
	unknown38E = 0x38E,
	unknown38F = 0x38F,
	unknown390 = 0x390,
	unknown391 = 0x391,
	unknown392 = 0x392,
	unknown393 = 0x393,
	unknown394 = 0x394,
	unknown395 = 0x395,
	unknown396 = 0x396,
	unknown397 = 0x397,
	unknown398 = 0x398,
	unknown399 = 0x399,
	unknown39A = 0x39A,
	unknown39B = 0x39B,
	unknown39C = 0x39C,
	unknown39D = 0x39D,
	unknown39E = 0x39E,
	unknown39F = 0x39F,
	unknown3A0 = 0x3A0,
	unknown3A1 = 0x3A1,
	unknown3A2 = 0x3A2,
	unknown3A3 = 0x3A3,
	unknown3A4 = 0x3A4,
	unknown3A5 = 0x3A5,
	unknown3A6 = 0x3A6,
	unknown3A7 = 0x3A7,
	unknown3A8 = 0x3A8,
	unknown3A9 = 0x3A9,
	unknown3AA = 0x3AA,
	unknown3AB = 0x3AB,
	unknown3AC = 0x3AC,
	unknown3AD = 0x3AD,
	unknown3AE = 0x3AE,
	unknown3AF = 0x3AF,
	unknown3B0 = 0x3B0,
	unknown3B1 = 0x3B1,
	unknown3B2 = 0x3B2,
	unknown3B3 = 0x3B3,
	unknown3B4 = 0x3B4,
	unknown3B5 = 0x3B5,
	unknown3B6 = 0x3B6,
	unknown3B7 = 0x3B7,
	unknown3B8 = 0x3B8,
	unknown3B9 = 0x3B9,
	unknown3BA = 0x3BA,
	unknown3BB = 0x3BB,
	unknown3BC = 0x3BC,
	unknown3BD = 0x3BD,
	unknown3BE = 0x3BE,
	unknown3BF = 0x3BF,
	unknown3C0 = 0x3C0,
	unknown3C1 = 0x3C1,
	unknown3C2 = 0x3C2,
	unknown3C3 = 0x3C3,
	unknown3C4 = 0x3C4,
	unknown3C5 = 0x3C5,
	unknown3C6 = 0x3C6,
	unknown3C7 = 0x3C7,
	unknown3C8 = 0x3C8,
	unknown3C9 = 0x3C9,
	unknown3CA = 0x3CA,
	unknown3CB = 0x3CB,
	unknown3CC = 0x3CC,
	unknown3CD = 0x3CD,
	unknown3CE = 0x3CE,
	unknown3CF = 0x3CF,
	unknown3D0 = 0x3D0,
	unknown3D1 = 0x3D1,
	unknown3D2 = 0x3D2,
	unknown3D3 = 0x3D3,
	unknown3D4 = 0x3D4,
	unknown3D5 = 0x3D5,
	unknown3D6 = 0x3D6,
	unknown3D7 = 0x3D7,
	unknown3D8 = 0x3D8,
	unknown3D9 = 0x3D9,
	unknown3DA = 0x3DA,
	unknown3DB = 0x3DB,
	unknown3DC = 0x3DC,
	unknown3DD = 0x3DD,
	unknown3DE = 0x3DE,
	unknown3DF = 0x3DF,
	unknown3E0 = 0x3E0,
	unknown3E1 = 0x3E1,
	unknown3E2 = 0x3E2,
	unknown3E3 = 0x3E3,
	unknown3E4 = 0x3E4,
	unknown3E5 = 0x3E5,
	unknown3E6 = 0x3E6,
	unknown3E7 = 0x3E7,
	unknown3E8 = 0x3E8,
	unknown3E9 = 0x3E9,
	unknown3EA = 0x3EA,
	unknown3EB = 0x3EB,
	unknown3EC = 0x3EC,
	unknown3ED = 0x3ED,
	unknown3EE = 0x3EE,
	unknown3EF = 0x3EF,
	unknown3F0 = 0x3F0,
	unknown3F1 = 0x3F1,
	unknown3F2 = 0x3F2,
	unknown3F3 = 0x3F3,
	unknown3F4 = 0x3F4,
	unknown3F5 = 0x3F5,
	unknown3F6 = 0x3F6,
	unknown3F7 = 0x3F7,
	unknown3F8 = 0x3F8,
	unknown3F9 = 0x3F9,
	unknown3FA = 0x3FA,
	unknown3FB = 0x3FB,
	unknown3FC = 0x3FC,
	unknown3FD = 0x3FD,
	unknown3FE = 0x3FE,
	unknown3FF = 0x3FF,
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
	party = 0,
	enemy = 1,
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
enum MapSectorMiscConfig {
	none = 0,
	indoorArea = 1,
	exitMouseUsable = 2,
	useMiniSprites = 3,
	useMagicantSprites = 4,
	useRobotSprites = 5,
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
	vertical = 0x8000,
	horizontal = 0x4000,
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
	unknown000 = 0,
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
	unknown481 = 481,
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

///
struct GameState {
	ubyte[12] mother2PlayerName; ///
	ubyte[24] earthboundPlayerName; ///
	ubyte[6] petName; ///
	ubyte[6] favouriteFood; ///
	ubyte[12] favouriteThing; ///
	uint moneyCarried; ///
	uint bankBalance; ///
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
	ushort unknown88; ///
	ushort leaderDirection; ///
	ushort troddenTileType; ///
	ushort walkingStyle; ///
	ushort unknown90; ///
	ushort unknown92; ///
	ushort currentPartyMembers; ///
	ubyte[6] unknown96; ///
	ubyte[6] playerControlledPartyMembers; ///
	ubyte[12] unknownA2; ///
	ubyte partyCount; ///
	ubyte playerControlledPartyMemberCount; ///
	ushort unknownB0; ///
	ushort unknownB2; ///
	ushort unknownB4; ///
	ubyte[3] unknownB6; ///
	ubyte[3] unknownB8; ///
	ubyte autoFightEnable; ///
	ushort exitMouseXCoordinate; ///
	ushort exitMouseYCoordinate; ///
	ubyte textSpeed; ///
	ubyte soundSetting; ///
	ubyte unknownC3; ///
	uint unknownC4; ///
	ubyte[2] activeHotspotModes; ///
	ubyte[2] activeHotspotIDs; ///
	const(ubyte)*[2] activeHotspotPointers; ///
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
	ushort unknown53; ///
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
	short unknown92; ///
	ubyte unknown94; ///
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
	const(ubyte)* script; /// [0F]
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
	ubyte unknown2; ///
	ubyte unknown3; ///
	ubyte unknown4; ///
	ubyte unknown5; ///
	ubyte unknown6; ///
	ubyte unknown7; ///
	ubyte spriteBank; ///
	OverworldSpriteGraphics[] sprites; ///
}
///
struct OverworldSpriteGraphics {
	const(ubyte)[] data; ///
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
	ubyte allyOrEnemy; ///14
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
	ubyte unknown74; ///
	ubyte unknown75; ///
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
	this(ushort red, ushort green, ushort blue) {
		bgr555 = (red & 0x1F) | ((green & 0x1F) << 5) | ((blue & 0x1F) << 10);
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
struct Unknown7E007DEntry {
	ubyte unknown0; ///
	ushort unknown1; ///
}
///
union FixedPoint1616 {
	struct {
		ushort fraction; ///
		short integer; ///
	}
	uint combined; ///
	//for debugging
	///
	double asDouble() const {
		return cast(double)cast(int)combined / 65536.0;
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
	const(ubyte)[] textPointer1; ///10
	const(ubyte)[] textPointer2; ///13
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
	const(ubyte)[] helpText; ///
	///
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
struct HDMATableEntry {
	ubyte count; ///
	const(ubyte)* ptr; ///
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
	immutable(ubyte)[] data; ///
	immutable(ubyte)[] graphics; ///
	ushort height; ///
	ushort width; ///
}
///
struct MusicDataset {
	ubyte primarySamplePack; ///
	ubyte secondarySamplePack; ///
	ubyte sequencePack; ///
}
///
struct MusicPackPointer {
	//ubyte bank;
	const(ubyte)* addr; ///
}
///
struct NPC {
	ubyte type; ///
	ushort sprite; ///
	ubyte direction; ///
	ushort actionScript; ///
	ushort eventFlag; ///
	ubyte appearanceStyle; ///
	const(ubyte)[] talkText; ///
	union {
		const(ubyte)[] checkText; ///
		uint item; ///
		ubyte[4] somethingElse; ///
	}
	///
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
	///
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
///
struct UnknownC42B0DEntry {
	ubyte unknown0; ///
	ubyte unknown1; ///
	SpriteMap[2][] unknown2; ///
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
}
///
struct HDMAWordTransfer {
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
	ubyte unknown3; ///
}
///
struct TownMapIconPlacement {
	ubyte unknown0; ///
	ubyte unknown1; ///
	ubyte unknown2; ///
	ushort eventFlag; ///
}
///
struct SpriteMap {
	ubyte unknown0; ///
	union {
		ushort unknown1; ///
		SpriteMap* unknown1ptr; ///
		struct {
			ubyte unknown10; ///
			ubyte flags; ///
		}
	}
	ubyte unknown3; ///
	ubyte unknown4; ///
	///
	this (ubyte u0, ushort u1, ubyte u3, ubyte u4) {
		unknown0 = u0;
		unknown1 = u1;
		unknown3 = u3;
		unknown4 = u4;
	}
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
	ubyte runFlag; ///32
	ushort hp; ///33
	ushort pp; ///35
	uint exp; ///37
	ushort money; ///41
	ushort eventScript; ///43
	const(ubyte)[] encounterTextPointer; ///45
	const(ubyte)[] deathTextPointer; ///49
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
	const(ubyte)[] text; /// 4
	void function() func; /// 8
}
///
struct UnknownA97D {
	ubyte unknown0; ///
	ubyte unknown1; ///
	short unknown2; ///
	ubyte unknown4; ///
	ubyte unknown5; ///
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
	immutable(ubyte)[] sprite; ///
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
	const(ubyte)[] textPtr; /// 0
	ushort eventFlag; /// 4
	ushort unknown6; /// 6
	ushort unknown8; /// 8
	ubyte unknown10; /// 10
}
///
struct DoorEntryB {
	ushort eventFlag; ///
	const(ubyte)[] textPtr; ///
}
///
struct DoorEntryC {
	const(ubyte)[] textPtr; ///
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
	ushort unknown3; ///
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
		doorPtr.unknown3 = u3;
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
		auto result = typeof(this)(1);
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
		auto result = typeof(this)(3);
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
	const(ubyte)[] text; ///
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
	const(ubyte)[] text; ///11
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
struct Unknown7EB4AAEntry {
	short unknown0; ///
	short unknown2; ///
	short unknown4; ///
	short unknown6; ///
	short unknown8; ///
	ubyte* unknown10; ///
	ubyte* unknown12; ///
	short unknown14; ///
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
struct Unknown7EB37EStruct {
	short unknown0; ///
	short unknown2; ///
	short unknown4; ///
	short unknown6; ///
	short unknown8; ///
	short unknown10; ///
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
	immutable(ubyte)[] graphics; ///
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
}
///
union Unknown7E0028Union {
	short word; ///
	struct {
		ubyte a; ///
		ubyte b; ///
	}
}
///
struct AnimationSequence {
	immutable(ubyte)[] ptr; ///
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
	ushort[0x400] unknown7EF000Alt; ///
}
///
struct Unknown7E9652Data {
	ushort unknown0; ///
	ushort unknown2; ///
	ushort unknown4; ///
}


//helper funcs not in the original game
///
void function() waitForInterrupt = () {};
///
void function() handleDma = () {};
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
ubyte[length] ebString(size_t length)(string str) {
	ubyte[length] result = 0;
	size_t idx;
	foreach (dchar c; str) {
		result[idx++] = ebChar(c);
	}
	return result;
}
///
ubyte[] ebString(string str) {
	ubyte[] result = new ubyte[](str.length);
	size_t idx;
	foreach (dchar c; str) {
		result[idx++] = ebChar(c);
	}
	return result;
}
///
ubyte[] ebStringz(string str) {
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
ubyte ebChar(dchar c) {
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
///
T ROL(T)(T val, ref bool carry) {
	bool MSB = !!(val & (1 << ((T.sizeof * 8) - 1)));
	val <<= 1;
	val |= carry;
	carry = MSB;
	return val;
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
	if (id % 1 == 0) {
		return format!"%s.ebsave"(id / 2);
	} else {
		return format!"%s.ebsave.bak"(id / 2);
	}
}

private extern(C) __gshared string[] rt_options = ["oncycle=ignore"];
///
const(ubyte)[] getFullCC(const(ubyte)* script) {
	enum ptrSize = (void*).sizeof;
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
