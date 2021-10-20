module earthbound.bank15;

import earthbound.commondefs;

immutable char[6][7][7] dontCareNames = [
	[
		"Ness",
		"Alec",
		"Roger",
		"Will",
		"Brian",
		"Tyler",
		"Lane",
	],
	[
		"Paula",
		"Nancy",
		"Skye",
		"Paige",
		"Marie",
		"Holly",
		"Jane",
	],
	[
		"Jeff",
		"Dan",
		"Henry",
		"Isaac",
		"Ralph",
		"Sean",
		"Rob",
	],
	[
		"Poo",
		"Kato",
		"Kai",
		"Omar",
		"Ramin",
		"Aziz",
		"Lado",
	],
	[
		"King",
		"Peach",
		"Sparky",
		"Rex",
		"Baby",
		"Rover",
		"Misty",
	],
	[
		"Steak",
		"Pie",
		"Pasta",
		"Cake",
		"Eggs",
		"Bread",
		"Salmon",
	],
	[
		"Rockin",
		"Hammer",
		"Love",
		"Gifts",
		"Slime",
		"Gaming",
		"Boxing",
	]
];

// $D5F4BB
immutable TimedItemTransformation[4] TimedItemTransformationTable = [
	TimedItemTransformation(Item.FreshEgg, Sfx.None, 0, Item.Chick, 0x32),
	TimedItemTransformation(Item.Chick, Sfx.Cheep, 2, Item.Chicken, 0x2C),
	TimedItemTransformation(Item.Chicken, Sfx.Cluck, 15, Item.None, 0),
	TimedItemTransformation(Item.None, Sfx.None, 0, Item.None, 0),
];
