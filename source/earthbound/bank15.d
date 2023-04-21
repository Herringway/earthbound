///
module earthbound.bank15;

import earthbound.commondefs;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.text;

/// $D55000
immutable Item[254] itemData = [
	Item(ebString!25("Null"), 0xFF, 2, 0x00, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem000"),
	Item(ebString!25("Franklin badge"), 0x00, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem001"),
	Item(ebString!25("Teddy bear"), 0x04, 178, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x10, 0x01, 0x02, 0x00, "textItem002"),
	Item(ebString!25("Super plush bear"), 0x04, 1198, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x11, 0x01, 0x01, 0x00, "textItem003"),
	Item(ebString!25("Broken machine"), 0x08, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x01, 0x83, 0x00, "textItem004"),
	Item(ebString!25("Broken gadget"), 0x08, 109, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x22, 0xD7, 0x00, "textItem005"),
	Item(ebString!25("Broken air gun"), 0x08, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x0C, 0x27, 0x00, "textItem006"),
	Item(ebString!25("Broken spray can"), 0x08, 189, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x01, 0xA1, 0x00, "textItem007"),
	Item(ebString!25("Broken laser"), 0x08, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x18, 0x29, 0x00, "textItem008"),
	Item(ebString!25("Broken iron"), 0x08, 149, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x0A, 0x8A, 0x00, "textItem009"),
	Item(ebString!25("Broken pipe"), 0x08, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x1E, 0x84, 0x00, "textItem010"),
	Item(ebString!25("Broken cannon"), 0x08, 218, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x20, 0x2C, 0x00, "textItem011"),
	Item(ebString!25("Broken tube"), 0x08, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x24, 0x88, 0x00, "textItem012"),
	Item(ebString!25("Broken bazooka"), 0x08, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x2D, 0x86, 0x00, "textItem013"),
	Item(ebString!25("Broken trumpet"), 0x08, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x28, 0x9D, 0x00, "textItem014"),
	Item(ebString!25("Broken harmonica"), 0x08, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x37, 0x2E, 0x00, "textItem015"),
	Item(ebString!25("Broken antenna"), 0x08, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x41, 0x30, 0x00, "textItem016"),
	Item(ebString!25("Cracked bat"), 0x10, 18, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 4, 0, 0x00, 0x01, "textItem000"),
	Item(ebString!25("Tee ball bat"), 0x10, 48, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 8, 0, 0x00, 0x01, "textItem018"),
	Item(ebString!25("Sand lot bat"), 0x10, 98, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 15, 0, 0x00, 0x01, "textItem019"),
	Item(ebString!25("Minor league bat"), 0x10, 399, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 26, 0, 0x00, 0x01, "textItem020"),
	Item(ebString!25("Mr. Baseball bat"), 0x10, 498, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 38, 0, 0x00, 0x01, "textItem021"),
	Item(ebString!25("Big league bat"), 0x10, 3080, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 54, 0, 0x00, 0x01, "textItem022"),
	Item(ebString!25("Hall of fame bat"), 0x10, 1880, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 62, 0, 0x00, 0x01, "textItem023"),
	Item(ebString!25("Magicant bat"), 0x10, 0, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 80, 0, 0x00, 0x01, "textItem024"),
	Item(ebString!25("Legendary bat"), 0x10, 0, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 110, 0, 0x00, 0x01, "textItem025"),
	Item(ebString!25("Gutsy bat"), 0x10, 2980, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 100, 0, 0x7F, 0x01, "textItem026"),
	Item(ebString!25("Casey bat"), 0x10, 38, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 125, 0, 0x00, 0x0C, "textItem027"),
	Item(ebString!25("Fry pan"), 0x10, 56, ItemFlags.paulaCanUse, BattleActions.equipAndAttack, 10, 0, 0x00, 0x01, "textItem028"),
	Item(ebString!25("Thick fry pan"), 0x10, 198, ItemFlags.paulaCanUse, BattleActions.equipAndAttack, 20, 0, 0x00, 0x01, "textItem029"),
	Item(ebString!25("Deluxe fry pan"), 0x10, 598, ItemFlags.paulaCanUse, BattleActions.equipAndAttack, 30, 0, 0x00, 0x01, "textItem030"),
	Item(ebString!25("Chef's fry pan"), 0x10, 1198, ItemFlags.paulaCanUse, BattleActions.equipAndAttack, 40, 0, 0x00, 0x01, "textItem031"),
	Item(ebString!25("French fry pan"), 0x10, 1790, ItemFlags.paulaCanUse, BattleActions.equipAndAttack, 60, 0, 0x00, 0x01, "textItem032"),
	Item(ebString!25("Magic fry pan"), 0x10, 4790, ItemFlags.paulaCanUse, BattleActions.equipAndAttack, 50, 0, 0x64, 0x04, "textItem033"),
	Item(ebString!25("Holy fry pan"), 0x10, 3480, ItemFlags.paulaCanUse, BattleActions.equipAndAttack, 80, 0, 0x0A, 0x01, "textItem034"),
	Item(ebString!25("Sword of kings"), 0x10, 0, ItemFlags.pooCanUse, BattleActions.equipAndAttack, 10, 30, 0x00, 0x00, "textItem035"),
	Item(ebString!25("Pop gun"), 0x11, 110, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 16, 0, 0x00, 0x00, "textItem036"),
	Item(ebString!25("Stun gun"), 0x11, 150, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 24, 0, 0x00, 0x00, "textItem037"),
	Item(ebString!25("Toy air gun"), 0x11, 215, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 32, 0, 0x00, 0x00, "textItem038"),
	Item(ebString!25("Magnum air gun"), 0x11, 0, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 36, 0, 0x00, 0x00, "textItem039"),
	Item(ebString!25("Zip gun"), 0x11, 425, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 40, 0, 0x00, 0x00, "textItem040"),
	Item(ebString!25("Laser gun"), 0x11, 0, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 48, 0, 0x00, 0x00, "textItem041"),
	Item(ebString!25("Hyper beam"), 0x11, 850, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 58, 0, 0x00, 0x00, "textItem042"),
	Item(ebString!25("Crusher beam"), 0x11, 1150, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 72, 0, 0x00, 0x00, "textItem043"),
	Item(ebString!25("Spectrum beam"), 0x11, 1650, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 78, 0, 0x00, 0x00, "textItem044"),
	Item(ebString!25("Death ray"), 0x11, 2300, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 90, 0, 0x00, 0x00, "textItem045"),
	Item(ebString!25("Baddest beam"), 0x11, 0, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 98, 0, 0x00, 0x00, "textItem046"),
	Item(ebString!25("Moon beam gun"), 0x11, 4450, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 110, 0, 0x00, 0x00, "textItem047"),
	Item(ebString!25("Gaia beam"), 0x11, 0, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 125, 0, 0x00, 0x00, "textItem048"),
	Item(ebString!25("Yo-yo"), 0x11, 29, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipAndAttack, 6, -6, 0x00, 0x03, "textItem049"),
	Item(ebString!25("Slingshot"), 0x11, 89, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipAndAttack, 12, -12, 0x00, 0x03, "textItem050"),
	Item(ebString!25("Bionic slingshot"), 0x11, 449, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipAndAttack, 32, -32, 0x00, 0x03, "textItem051"),
	Item(ebString!25("Trick yo-yo"), 0x11, 998, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipAndAttack, 46, -46, 0x00, 0x03, "textItem052"),
	Item(ebString!25("Combat yo-yo"), 0x11, 1148, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipAndAttack, 54, -54, 0x00, 0x03, "textItem053"),
	Item(ebString!25("Travel charm"), 0x14, 60, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 0, -40, 0x00, 0x40, "textItem054"),
	Item(ebString!25("Great charm"), 0x14, 400, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 1, -40, 0x05, 0x80, "textItem055"),
	Item(ebString!25("Crystal charm"), 0x14, 600, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 2, -40, 0x0F, 0xC0, "textItem056"),
	Item(ebString!25("Rabbit's foot"), 0x14, 1800, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 3, -40, 0x28, 0xC0, "textItem057"),
	Item(ebString!25("Flame pendant"), 0x14, 3000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 15, -40, 0x00, 0x03, "textItem058"),
	Item(ebString!25("Rain pendant"), 0x14, 3000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 15, -40, 0x00, 0x0C, "textItem059"),
	Item(ebString!25("Night pendant"), 0x14, 3000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 15, -40, 0x00, 0x30, "textItem060"),
	Item(ebString!25("Sea pendant"), 0x14, 5000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 20, -40, 0x00, 0x3F, "textItem061"),
	Item(ebString!25("Star pendant"), 0x14, 7000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 30, -40, 0x00, 0xFF, "textItem062"),
	Item(ebString!25("Cloak of kings"), 0x14, 0, ItemFlags.pooCanUse, BattleActions.equipArmour, -80, 20, 0x28, 0x00, "textItem063"),
	Item(ebString!25("Cheap bracelet"), 0x18, 98, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 5, -40, 0x00, 0x00, "textItem064"),
	Item(ebString!25("Copper bracelet"), 0x18, 349, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 10, -40, 0x00, 0x00, "textItem065"),
	Item(ebString!25("Silver bracelet"), 0x18, 599, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 15, -40, 0x00, 0x00, "textItem066"),
	Item(ebString!25("Gold bracelet"), 0x18, 2799, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 30, -40, 0x00, 0x00, "textItem067"),
	Item(ebString!25("Platinum band"), 0x18, 6899, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 40, -40, 0x00, 0x00, "textItem068"),
	Item(ebString!25("Diamond band"), 0x18, 9998, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 50, -40, 0x00, 0x00, "textItem069"),
	Item(ebString!25("Pixie's bracelet"), 0x18, 1590, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 60, -40, 0x0A, 0x01, "textItem070"),
	Item(ebString!25("Cherub's band"), 0x18, 1790, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 70, -40, 0x14, 0x02, "textItem071"),
	Item(ebString!25("Goddess band"), 0x18, 1980, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 80, -40, 0x1E, 0x02, "textItem072"),
	Item(ebString!25("Bracer of kings"), 0x18, 0, ItemFlags.pooCanUse, BattleActions.equipArmour, -40, 30, 0x23, 0x02, "textItem073"),
	Item(ebString!25("Baseball cap"), 0x1C, 19, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 5, -40, 0x00, 0x00, "textItem074"),
	Item(ebString!25("Holmes hat"), 0x1C, 59, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 10, -40, 0x00, 0x00, "textItem075"),
	Item(ebString!25("Mr. Baseball cap"), 0x1C, 199, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 6, -40, 0x00, 0x00, "textItem076"),
	Item(ebString!25("Hard hat"), 0x1C, 298, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 15, -40, 0x00, 0x00, "textItem077"),
	Item(ebString!25("Ribbon"), 0x1C, 89, ItemFlags.paulaCanUse, BattleActions.equipArmour, 20, -40, 0x00, 0x00, "textItem078"),
	Item(ebString!25("Red ribbon"), 0x1C, 179, ItemFlags.paulaCanUse, BattleActions.equipArmour, 25, -40, 0x00, 0x00, "textItem079"),
	Item(ebString!25("Goddess ribbon"), 0x1C, 6980, ItemFlags.paulaCanUse, BattleActions.equipArmour, 110, -40, 0x00, 0x00, "textItem080"),
	Item(ebString!25("Coin of slumber"), 0x1C, 1500, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 30, -40, 0x0A, 0x00, "textItem081"),
	Item(ebString!25("Coin of defense"), 0x1C, 2000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 40, -40, 0x0D, 0x00, "textItem082"),
	Item(ebString!25("Lucky coin"), 0x1C, 6000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 50, -40, 0x14, 0x00, "textItem083"),
	Item(ebString!25("Talisman coin"), 0x1C, 3500, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 60, -40, 0x19, 0x00, "textItem084"),
	Item(ebString!25("Shiny coin"), 0x1C, 4000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 70, -40, 0x1E, 0x00, "textItem085"),
	Item(ebString!25("Souvenir coin"), 0x1C, 6000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 80, -40, 0x23, 0x00, "textItem086"),
	Item(ebString!25("Diadem of kings"), 0x1C, 0, ItemFlags.pooCanUse, BattleActions.equipArmour, -40, 20, 0x1E, 0x55, "textItem087"),
	Item(ebString!25("Cookie"), 0x20, 7, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem088"),
	Item(ebString!25("Bag of fries"), 0x20, 8, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x04, 0x01, 0x00, "textItem089"),
	Item(ebString!25("Hamburger"), 0x20, 14, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x08, 0x01, 0x00, "textItem090"),
	Item(ebString!25("Boiled egg"), 0x20, 9, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x07, 0x01, 0x00, "textItem091"),
	Item(ebString!25("Fresh Egg"), 0x20, 12, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.transform | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x0E, 0x01, 0x00, "textItem092"),
	Item(ebString!25("Picnic lunch"), 0x20, 24, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x0E, 0x01, 0x00, "textItem093"),
	Item(ebString!25("Pasta di Summers"), 0x20, 128, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x12, 0x01, 0x00, "textItem094"),
	Item(ebString!25("Pizza"), 0x20, 48, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x14, 0x01, 0x00, "textItem095"),
	Item(ebString!25("Chef's special"), 0x20, 298, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x24, 0x01, 0x00, "textItem096"),
	Item(ebString!25("Large pizza"), 0x2C, 238, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFoodParty, 0x00, 0x28, 0x01, 0x00, "textItem097"),
	Item(ebString!25("PSI caramel"), 0x20, 100, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x01, 0x14, 0x14, 0x00, "textItem098"),
	Item(ebString!25("Magic truffle"), 0x20, 298, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x01, 0x50, 0x50, 0x00, "textItem099"),
	Item(ebString!25("Brain food lunch"), 0x20, 800, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x02, 0x32, 0x00, 0x00, "textItem100"),
	Item(ebString!25("Rock candy"), 0x20, 38, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x03, 0x01, 0x01, 0x00, "textItem101"),
	Item(ebString!25("Croissant"), 0x20, 18, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x0A, 0x01, 0x00, "textItem102"),
	Item(ebString!25("Bread roll"), 0x20, 12, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x05, 0x01, 0x00, "textItem103"),
	Item(ebString!25("Pak of bubble gum"), 0x38, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.bubbleGum, 0x00, 0x00, 0x00, 0x00, "textItem104"),
	Item(ebString!25("Jar of Fly Honey"), 0x35, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.flyHoney, 0x00, 0x00, 0x00, 0x00, "textItem105"),
	Item(ebString!25("Can of fruit juice"), 0x24, 4, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem106"),
	Item(ebString!25("Royal iced tea"), 0x24, 78, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x0A, 0x01, 0x00, "textItem107"),
	Item(ebString!25("Protein drink"), 0x24, 38, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x0E, 0x01, 0x00, "textItem108"),
	Item(ebString!25("Kraken soup"), 0x24, 648, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x00, 0x01, 0x00, "textItem109"),
	Item(ebString!25("Bottle of water"), 0x24, 4, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x01, 0x01, 0x0A, 0x00, "textItem110"),
	Item(ebString!25("Cold remedy"), 0x24, 22, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x09, 0x00, 0x00, 0x00, "textItem111"),
	Item(ebString!25("Vial of serum"), 0x24, 58, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x0A, 0x00, 0x00, 0x00, "textItem112"),
	Item(ebString!25("IQ capsule"), 0x24, 38, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x04, 0x01, 0x01, 0x00, "textItem113"),
	Item(ebString!25("Guts capsule"), 0x24, 38, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x05, 0x01, 0x01, 0x00, "textItem114"),
	Item(ebString!25("Speed capsule"), 0x24, 38, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x06, 0x01, 0x01, 0x00, "textItem115"),
	Item(ebString!25("Vital capsule"), 0x24, 38, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x07, 0x01, 0x01, 0x00, "textItem116"),
	Item(ebString!25("Luck capsule"), 0x24, 38, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x08, 0x01, 0x01, 0x00, "textItem117"),
	Item(ebString!25("Ketchup packet"), 0x28, 2, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem118"),
	Item(ebString!25("Sugar packet"), 0x28, 3, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem119"),
	Item(ebString!25("Tin of Cocoa"), 0x28, 4, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem120"),
	Item(ebString!25("Carton of cream"), 0x28, 4, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem121"),
	Item(ebString!25("Sprig of parsley"), 0x28, 2, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem122"),
	Item(ebString!25("Jar of hot sauce"), 0x28, 3, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem123"),
	Item(ebString!25("Salt packet"), 0x28, 2, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem124"),
	Item(ebString!25("Backstage pass"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem125"),
	Item(ebString!25("Jar of delisauce"), 0x28, 300, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x00, "textItem126"),
	Item(ebString!25("Wet towel"), 0x30, 24, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.wetTowel, 0x00, 0x00, 0x00, 0x00, "textItem127"),
	Item(ebString!25("Refreshing herb"), 0x30, 80, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.refreshingHerb, 0x00, 0x00, 0x00, 0x00, "textItem128"),
	Item(ebString!25("Secret herb"), 0x30, 380, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.secretHerb, 0x00, 0x00, 0x00, 0x00, "textItem129"),
	Item(ebString!25("Horn of life"), 0x30, 1780, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.fullStatusHeal, 0x00, 0x00, 0x00, 0x00, "textItem130"),
	Item(ebString!25("Counter-PSI unit"), 0x34, 0, ItemFlags.jeffCanUse, BattleActions.counterPSIUnit, 0x00, 0x00, 0x00, 0x00, "textItem131"),
	Item(ebString!25("Shield killer"), 0x34, 0, ItemFlags.jeffCanUse, BattleActions.shieldKiller, 0x00, 0x00, 0x00, 0x00, "textItem132"),
	Item(ebString!25("Bazooka"), 0x34, 950, ItemFlags.jeffCanUse, BattleActions.bazooka, 0x00, 0x00, 0x00, 0x00, "textItem133"),
	Item(ebString!25("Heavy bazooka"), 0x34, 0, ItemFlags.jeffCanUse, BattleActions.heavyBazooka, 0x00, 0x00, 0x00, 0x00, "textItem134"),
	Item(ebString!25("HP-sucker"), 0x34, 800, ItemFlags.jeffCanUse, BattleActions.hpSucker, 0x00, 0x00, 0x00, 0x00, "textItem135"),
	Item(ebString!25("Hungry HP-sucker"), 0x34, 0, ItemFlags.jeffCanUse, BattleActions.hungryHPSucker, 0x00, 0x00, 0x00, 0x00, "textItem136"),
	Item(ebString!25("Xterminator spray"), 0x34, 630, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.xterminatorSpray, 0x00, 0x00, 0x00, 0x00, "textItem137"),
	Item(ebString!25("Slime generator"), 0x34, 420, ItemFlags.jeffCanUse, BattleActions.slimeGenerator, 0x00, 0x00, 0x00, 0x00, "textItem138"),
	Item(ebString!25("Yogurt dispenser"), 0x34, 0, ItemFlags.jeffCanUse, BattleActions.yogurtDispenser, 0x00, 0x00, 0x00, 0x00, "textItem139"),
	Item(ebString!25("Ruler"), 0x30, 2, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.ruler, 0x00, 0x00, 0x00, 0x00, "textItem140"),
	Item(ebString!25("Snake bag"), 0x34, 98, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.snakeBag, 0x00, 0x00, 0x00, 0x00, "textItem141"),
	Item(ebString!25("Mummy wrap"), 0x34, 128, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.mummyWrap, 0x00, 0x00, 0x00, 0x00, "textItem142"),
	Item(ebString!25("Protractor"), 0x30, 2, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.protractor, 0x00, 0x00, 0x00, 0x00, "textItem143"),
	Item(ebString!25("Bottle rocket"), 0x34, 29, ItemFlags.jeffCanUse | ItemFlags.consumedOnUse, BattleActions.bottleRocket, 0x00, 0x00, 0x00, 0x00, "textItem144"),
	Item(ebString!25("Big bottle rocket"), 0x34, 139, ItemFlags.jeffCanUse | ItemFlags.consumedOnUse, BattleActions.bigBottleRocket, 0x00, 0x00, 0x00, 0x00, "textItem145"),
	Item(ebString!25("Multi_bottle rocket"), 0x34, 2139, ItemFlags.jeffCanUse | ItemFlags.consumedOnUse, BattleActions.multiBottleRocket, 0x00, 0x00, 0x00, 0x00, "textItem146"),
	Item(ebString!25("Bomb"), 0x34, 149, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.bomb, 0x00, 0x00, 0x00, 0x00, "textItem147"),
	Item(ebString!25("Super bomb"), 0x34, 399, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.superBomb, 0x00, 0x00, 0x00, 0x00, "textItem148"),
	Item(ebString!25("Insecticide spray"), 0x34, 19, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.insecticide, 0x00, 0x00, 0x00, 0x00, "textItem149"),
	Item(ebString!25("Rust promoter"), 0x34, 89, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.rustPromoter, 0x00, 0x00, 0x00, 0x00, "textItem150"),
	Item(ebString!25("Rust promoter DX"), 0x34, 289, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.rustPromoterDX, 0x00, 0x00, 0x00, 0x00, "textItem151"),
	Item(ebString!25("Pair_of dirty socks"), 0x34, 2, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.dirtySocks, 0x00, 0x00, 0x00, 0x00, "textItem152"),
	Item(ebString!25("Stag beetle"), 0x34, 8, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.stagBeetle, 0x00, 0x00, 0x00, 0x00, "textItem153"),
	Item(ebString!25("Toothbrush"), 0x34, 3, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.toothbrush, 0x00, 0x00, 0x00, 0x00, "textItem154"),
	Item(ebString!25("Handbag strap"), 0x34, 39, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.handbagStrap, 0x00, 0x00, 0x00, 0x00, "textItem155"),
	Item(ebString!25("Pharaoh's curse"), 0x34, 290, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.pharoahsCurse, 0x00, 0x00, 0x00, 0x00, "textItem156"),
	Item(ebString!25("Defense shower"), 0x35, 0, ItemFlags.jeffCanUse, BattleActions.defenseShower, 0x00, 0x00, 0x00, 0x00, "textItem157"),
	Item(ebString!25("Letter from mom"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.letterFromMom, 0x00, 0x00, 0x00, 0x00, "textItem158"),
	Item(ebString!25("Sudden guts pill"), 0x35, 500, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.suddenGutsPill, 0x00, 0x00, 0x00, 0x00, "textItem159"),
	Item(ebString!25("Bag of Dragonite"), 0x35, 1000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.bagOfDragonite, 0x00, 0x00, 0x00, 0x00, "textItem160"),
	Item(ebString!25("Defense spray"), 0x35, 500, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.defenseSpray, 0x00, 0x00, 0x00, 0x00, "textItem161"),
	Item(ebString!25("Piggy nose"), 0x38, 300, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.piggyNose, 0x00, 0x00, 0x00, 0x00, "textItem162"),
	Item(ebString!25("For Sale sign"), 0x38, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.forSaleSign, 0x00, 0x00, 0x00, 0x00, "textItem163"),
	Item(ebString!25("Shyness book"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.shynessBook, 0x00, 0x00, 0x00, 0x00, "textItem164"),
	Item(ebString!25("Picture postcard"), 0x38, 2, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.picturePostcard, 0x00, 0x00, 0x00, 0x00, "textItem165"),
	Item(ebString!25("King banana"), 0x38, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.kingBanana, 0x00, 0x00, 0x00, 0x00, "textItem166"),
	Item(ebString!25("Letter from Tony"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.letterFromTony, 0x00, 0x00, 0x00, 0x00, "textItem167"),
	Item(ebString!25("Chick"), 0x38, 25, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.transform | ItemFlags.consumedOnUse, BattleActions.chick, 0x00, 0x00, 0x00, 0x00, "textItem168"),
	Item(ebString!25("Chicken"), 0x38, 220, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.transform | ItemFlags.consumedOnUse, BattleActions.chicken, 0x00, 0x00, 0x00, 0x00, "textItem169"),
	Item(ebString!25("Key to the shack"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem170"),
	Item(ebString!25("Key to the cabin"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem171"),
	Item(ebString!25("Bad key machine"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem172"),
	Item(ebString!25("Temporary goods"), 0x38, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem173"),
	Item(ebString!25("Zombie paper"), 0x3A, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.zombiePaper, 0x00, 0x00, 0x00, 0x00, "textItem174"),
	Item(ebString!25("Hawk eye"), 0x3A, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.hawkEye, 0x00, 0x00, 0x00, 0x00, "textItem175"),
	Item(ebString!25("Bicycle"), 0x3A, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.bicycle, 0x00, 0x00, 0x00, 0x00, "textItem176"),
	Item(ebString!25("ATM card"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.cannotGive | ItemFlags.unknown, BattleActions.atmCard, 0x00, 0x00, 0x00, 0x00, "textItem177"),
	Item(ebString!25("Show ticket"), 0x3B, 12, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem178"),
	Item(ebString!25("Letter from kids"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.letterFromKids, 0x00, 0x00, 0x00, 0x00, "textItem179"),
	Item(ebString!25("Wad of bills"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem180"),
	Item(ebString!25("Receiver phone"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.cannotGive | ItemFlags.unknown, BattleActions.receiverPhone, 0x00, 0x00, 0x00, 0x00, "textItem181"),
	Item(ebString!25("Diamond"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem182"),
	Item(ebString!25("Signed banana"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem183"),
	Item(ebString!25("Pencil eraser"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem184"),
	Item(ebString!25("Hieroglyph copy"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.hieroglyphCopy, 0x00, 0x00, 0x00, 0x00, "textItem185"),
	Item(ebString!25("Meteotite"), 0x38, 4000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem186"),
	Item(ebString!25("Contact lens"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem187"),
	Item(ebString!25("Hand-Aid"), 0x30, 19, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.handAid, 0x00, 0x00, 0x00, 0x00, "textItem188"),
	Item(ebString!25("Trout yogurt"), 0x20, 48, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x05, 0x01, 0x00, "textItem189"),
	Item(ebString!25("Banana"), 0x20, 5, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x04, 0x01, 0x00, "textItem190"),
	Item(ebString!25("Calorie stick"), 0x20, 18, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x0A, 0x01, 0x00, "textItem191"),
	Item(ebString!25("Key to the tower"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem192"),
	Item(ebString!25("Meteorite piece"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem193"),
	Item(ebString!25("Earth pendant"), 0x14, 4000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 0x10, -40, 0x00, 0x2A, "textItem194"),
	Item(ebString!25("Neutralizer"), 0x34, 0, ItemFlags.jeffCanUse, BattleActions.neutralizer, 0x00, 0x00, 0x00, 0x00, "textItem195"),
	Item(ebString!25("Sound Stone"), 0x38, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.cannotGive | ItemFlags.unknown, BattleActions.soundStone, 0x00, 0x00, 0x00, 0x00, "textItem196"),
	Item(ebString!25("Exit mouse"), 0x38, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.exitMouse, 0x00, 0x00, 0x00, 0x00, "textItem197"),
	Item(ebString!25("Gelato de resort"), 0x20, 49, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x05, 0x01, 0x00, "textItem198"),
	Item(ebString!25("Snake"), 0x34, 220, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.snake, 0x00, 0x00, 0x00, 0x00, "textItem199"),
	Item(ebString!25("Viper"), 0x34, 550, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.viper, 0x00, 0x00, 0x00, 0x00, "textItem200"),
	Item(ebString!25("Brain stone"), 0x38, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem201"),
	Item(ebString!25("Town map"), 0x38, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.townMap, 0x00, 0x00, 0x00, 0x00, "textItem202"),
	Item(ebString!25("Video relaxant"), 0x38, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.videoRelaxant, 0x00, 0x00, 0x00, 0x00, "textItem203"),
	Item(ebString!25("Suporma"), 0x38, 50, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.suporma, 0x00, 0x00, 0x00, 0x00, "textItem204"),
	Item(ebString!25("Key to the locker"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem205"),
	Item(ebString!25("Insignificant item"), 0x3B, 2, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.insignificantItem, 0x00, 0x00, 0x00, 0x00, "textItem206"),
	Item(ebString!25("Magic tart"), 0x20, 480, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x01, 0x14, 0x14, 0x00, "textItem207"),
	Item(ebString!25("Tiny ruby"), 0x3B, 0, ItemFlags.pooCanUse | ItemFlags.cannotGive | ItemFlags.unknown, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem208"),
	Item(ebString!25("Monkey's love"), 0x34, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.monkeysLove, 0x00, 0x00, 0x00, 0x00, "textItem209"),
	Item(ebString!25("Eraser eraser"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem210"),
	Item(ebString!25("Tendakraut"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.unknown, BattleActions.tendakraut, 0x00, 0x00, 0x00, 0x00, "textItem211"),
	Item(ebString!25("T-rex's bat"), 0x10, 698, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 0x30, 0x00, 0x00, 0x01, "textItem212"),
	Item(ebString!25("Big league bat"), 0x10, 1380, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 0x36, 0x00, 0x00, 0x01, "textItem213"),
	Item(ebString!25("Ultimate bat"), 0x10, 2298, ItemFlags.nessCanUse, BattleActions.equipAndAttack, 0x44, 0x00, 0x00, 0x01, "textItem214"),
	Item(ebString!25("Double beam"), 0x11, 1000, ItemFlags.jeffCanUse, BattleActions.equipAndAttack, 0x42, 0x00, 0x00, 0x00, "textItem215"),
	Item(ebString!25("Platinum band"), 0x18, 3899, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 0x28, -40, 0x00, 0x00, "textItem216"),
	Item(ebString!25("Diamond band"), 0x18, 5198, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 0x32, -40, 0x00, 0x00, "textItem069"),
	Item(ebString!25("Defense ribbon"), 0x1C, 389, ItemFlags.paulaCanUse, BattleActions.equipArmour, 0x28, -40, 0x0F, 0x00, "textItem218"),
	Item(ebString!25("Talisman ribbon"), 0x1C, 3500, ItemFlags.paulaCanUse, BattleActions.equipArmour, 0x3C, -40, 0x19, 0x00, "textItem219"),
	Item(ebString!25("Saturn ribbon"), 0x1C, 3980, ItemFlags.paulaCanUse, BattleActions.equipArmour, 0x5A, -40, 0x28, 0x00, "textItem220"),
	Item(ebString!25("Coin of silence"), 0x1C, 2500, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 0x2D, -40, 0x10, 0x00, "textItem221"),
	Item(ebString!25("Charm coin"), 0x1C, 3000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 0x32, -40, 0x14, 0x00, "textItem222"),
	Item(ebString!25("Cup of noodles"), 0x20, 98, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x07, 0x01, 0x00, "textItem223"),
	Item(ebString!25("Skip sandwich"), 0x20, 38, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0x64, "textItem224"),
	Item(ebString!25("Skip sandwich DX"), 0x20, 98, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x01, 0x01, 0xC8, "textItem225"),
	Item(ebString!25("Lucky sandwich"), 0x20, 128, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x0A, 0x01, 0x00, "textItem226"),
	Item(ebString!25("Lucky sandwich"), 0x20, 128, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x28, 0x01, 0x00, "textItem227"),
	Item(ebString!25("Lucky sandwich"), 0x20, 128, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x00, 0x01, 0x00, "textItem228"),
	Item(ebString!25("Lucky sandwich"), 0x20, 128, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x01, 0x05, 0x01, 0x00, "textItem229"),
	Item(ebString!25("Lucky sandwich"), 0x20, 128, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x01, 0x14, 0x01, 0x00, "textItem230"),
	Item(ebString!25("Lucky sandwich"), 0x20, 128, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x02, 0x00, 0x01, 0x00, "textItem231"),
	Item(ebString!25("Cup of coffee"), 0x24, 6, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x02, 0x01, 0x00, "textItem232"),
	Item(ebString!25("Double burger"), 0x20, 24, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x10, 0x01, 0x00, "textItem233"),
	Item(ebString!25("Peanut cheese_bar"), 0x20, 22, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x12, 0x01, 0x00, "textItem234"),
	Item(ebString!25("Piggy jelly"), 0x20, 222, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x32, 0x01, 0x00, "textItem235"),
	Item(ebString!25("Bowl of rice gruel"), 0x20, 88, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x24, 0x01, 0x00, "textItem236"),
	Item(ebString!25("Bean croquette"), 0x20, 12, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x07, 0x01, 0x00, "textItem237"),
	Item(ebString!25("Molokheiya soup"), 0x24, 20, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x0E, 0x01, 0x00, "textItem238"),
	Item(ebString!25("Plain roll"), 0x20, 38, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x0E, 0x01, 0x00, "textItem239"),
	Item(ebString!25("Kabob"), 0x20, 54, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x15, 0x01, 0x00, "textItem240"),
	Item(ebString!25("Plain yogurt"), 0x20, 78, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x1C, 0x01, 0x00, "textItem241"),
	Item(ebString!25("Beef jerky"), 0x20, 70, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x19, 0x01, 0x00, "textItem242"),
	Item(ebString!25("Mammoth burger"), 0x20, 98, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x22, 0x01, 0x00, "textItem243"),
	Item(ebString!25("Spicy jerky"), 0x20, 140, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x2A, 0x01, 0x00, "textItem244"),
	Item(ebString!25("Luxury jerky"), 0x20, 210, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x32, 0x01, 0x00, "textItem245"),
	Item(ebString!25("Bottle of DXwater"), 0x24, 198, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x01, 0x01, 0x28, 0x00, "textItem246"),
	Item(ebString!25("Magic pudding"), 0x20, 680, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x01, 0x28, 0x28, 0x00, "textItem247"),
	Item(ebString!25("Non-stick frypan"), 0x10, 1490, ItemFlags.paulaCanUse, BattleActions.equipAndAttack, 0x32, 0x00, 0x00, 0x01, "textItem248"),
	Item(ebString!25("Mr. Saturn coin"), 0x1C, 1000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.equipArmour, 0x2F, -40, 0x12, 0x00, "textItem249"),
	Item(ebString!25("Meteornium"), 0x38, 2000, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem250"),
	Item(ebString!25("Popsicle"), 0x20, 7, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.genericFood, 0x00, 0x03, 0x01, 0x00, "textItem251"),
	Item(ebString!25("Cup of Lifenoodles"), 0x30, 178, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse | ItemFlags.consumedOnUse, BattleActions.fullStatusHeal, 0x00, 0x00, 0x00, 0x00, "textItem252"),
	Item(ebString!25("Carrot key"), 0x3B, 0, ItemFlags.nessCanUse | ItemFlags.paulaCanUse | ItemFlags.jeffCanUse | ItemFlags.pooCanUse, BattleActions.useNoEffect, 0x00, 0x00, 0x00, 0x00, "textItem253"),
];

/// $D576B2
immutable ubyte[7][66] storeTable = [
	[
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.crackedBat,
		ItemID.teeBallBat,
		ItemID.yoyo,
		ItemID.baseballCap,
		ItemID.cheapBracelet,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.coldRemedy,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.gelatoDeResort,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.canOfFruitJuice,
		ItemID.cupOfCoffee,
		ItemID.bagOfFries,
		ItemID.hamburger,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.cookie,
		ItemID.breadRoll,
		ItemID.skipSandwich,
		ItemID.luckySandwich1,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.canOfFruitJuice,
		ItemID.cupOfCoffee,
		ItemID.bagOfFries,
		ItemID.hamburger,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.cookie,
		ItemID.breadRoll,
		ItemID.skipSandwich,
		ItemID.luckySandwich1,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.teeBallBat,
		ItemID.fryPan,
		ItemID.slingshot,
		ItemID.cheapBracelet,
		ItemID.baseballCap,
		ItemID.ribbon,
		ItemID.none,
	], [
		ItemID.coldRemedy,
		ItemID.teddyBear,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.magicTart,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.defenseSpray,
		ItemID.rustPromoter,
		ItemID.travelCharm,
		ItemID.copperBracelet,
		ItemID.brokenSprayCan,
		ItemID.brokenIron,
		ItemID.none,
	], [
		ItemID.ruler,
		ItemID.protractor,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.boiledEgg,
		ItemID.freshEgg,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.cookie,
		ItemID.breadRoll,
		ItemID.skipSandwich,
		ItemID.luckySandwich1,
		ItemID.canOfFruitJuice,
		ItemID.cupOfCoffee,
		ItemID.none,
	], [
		ItemID.banana,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.sandLotBat,
		ItemID.fryPan,
		ItemID.copperBracelet,
		ItemID.holmesHat,
		ItemID.ribbon,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.minorLeagueBat,
		ItemID.thickFryPan,
		ItemID.hardHat,
		ItemID.insecticideSpray,
		ItemID.copperBracelet,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.coldRemedy,
		ItemID.vialOfSerum,
		ItemID.refreshingHerb,
		ItemID.toothbrush,
		ItemID.calorieStick,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.toyAirGun,
		ItemID.bomb,
		ItemID.bottleRocket,
		ItemID.rustPromoter,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.cookie,
		ItemID.breadRoll,
		ItemID.croissant,
		ItemID.skipSandwich,
		ItemID.luckySandwich1,
		ItemID.canOfFruitJuice,
		ItemID.cupOfCoffee,
	], [
		ItemID.bottleOfDXWater,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.trexsBat,
		ItemID.nonstickFrypan,
		ItemID.coinOfSilence,
		ItemID.picnicLunch,
		ItemID.skipSandwichDX,
		ItemID.luckySandwich1,
		ItemID.cupOfCoffee,
	], [
		ItemID.bionicSlingshot,
		ItemID.travelCharm,
		ItemID.greatCharm,
		ItemID.silverBracelet,
		ItemID.redRibbon,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.mrBaseballBat,
		ItemID.thickFryPan,
		ItemID.deluxeFryPan,
		ItemID.silverBracelet,
		ItemID.coinOfSlumber,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.zipGun,
		ItemID.bomb,
		ItemID.bottleRocket,
		ItemID.rustPromoter,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.cookie,
		ItemID.breadRoll,
		ItemID.croissant,
		ItemID.skipSandwich,
		ItemID.skipSandwichDX,
		ItemID.luckySandwich1,
		ItemID.none,
	], [
		ItemID.deluxeFryPan,
		ItemID.chefsFryPan,
		ItemID.silverBracelet,
		ItemID.goldBracelet,
		ItemID.insecticideSpray,
		ItemID.toothbrush,
		ItemID.protractor,
	], [
		ItemID.coldRemedy,
		ItemID.refreshingHerb,
		ItemID.proteinDrink,
		ItemID.calorieStick,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.boiledEgg,
		ItemID.breadRoll,
		ItemID.croissant,
		ItemID.banana,
		ItemID.picnicLunch,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.ketchupPacket,
		ItemID.sugarPacket,
		ItemID.tinOfCocoa,
		ItemID.cartonOfCream,
		ItemID.sprigOfParsley,
		ItemID.jarOfHotSauce,
		ItemID.saltPacket,
	], [
		ItemID.trickYoyo,
		ItemID.coinOfSlumber,
		ItemID.coinOfDefense,
		ItemID.redRibbon,
		ItemID.defenseRibbon,
		ItemID.teddyBear,
		ItemID.none,
	], [
		ItemID.sandLotBat,
		ItemID.minorLeagueBat,
		ItemID.mrBaseballBat,
		ItemID.baseballCap,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.canOfFruitJuice,
		ItemID.cupOfCoffee,
		ItemID.bagOfFries,
		ItemID.hamburger,
		ItemID.doubleBurger,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.hyperBeam,
		ItemID.bomb,
		ItemID.superBomb,
		ItemID.bottleRocket,
		ItemID.bigBottleRocket,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.brokenGadget,
		ItemID.brokenIron,
		ItemID.defenseSpray,
		ItemID.rustPromoter,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.magicPudding,
		ItemID.earthPendant,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.coldRemedy,
		ItemID.vialOfSerum,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.bigLeagueBat,
		ItemID.chefsFryPan,
		ItemID.luckyCoin,
		ItemID.goldBracelet,
		ItemID.platinumBand,
		ItemID.diamondBand,
		ItemID.superPlushBear,
	], [
		ItemID.coinOfDefense,
		ItemID.bottleOfWater,
		ItemID.secretHerb,
		ItemID.skipSandwichDX,
		ItemID.luckySandwich1,
		ItemID.cupOfCoffee,
		ItemID.canOfFruitJuice,
	], [
		ItemID.chefsSpecial,
		ItemID.pastaDiSummers,
		ItemID.krakenSoup,
		ItemID.royalIcedTea,
		ItemID.canOfFruitJuice,
		ItemID.cupOfCoffee,
		ItemID.none,
	], [
		ItemID.wetTowel,
		ItemID.vialOfSerum,
		ItemID.secretHerb,
		ItemID.suddenGutsPill,
		ItemID.proteinDrink,
		ItemID.banana,
		ItemID.none,
	], [
		ItemID.coldRemedy,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.snake,
		ItemID.viper,
		ItemID.vialOfSerum,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.bigLeagueBat2,
		ItemID.platinumBand2,
		ItemID.defenseSpray,
		ItemID.crystalCharm,
		ItemID.brokenCannon,
		ItemID.piggyNose,
		ItemID.none,
	], [
		ItemID.bomb,
		ItemID.superBomb,
		ItemID.bottleRocket,
		ItemID.bigBottleRocket,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.diamondBand2,
		ItemID.charmCoin,
		ItemID.secretHerb,
		ItemID.beefJerky,
		ItemID.cupOfNoodles,
		ItemID.proteinDrink,
		ItemID.bottleOfDXWater,
	], [
		ItemID.plainRoll,
		ItemID.plainYogurt,
		ItemID.plainRoll,
		ItemID.bagOfDragonite,
		ItemID.talismanCoin,
		ItemID.spicyJerky,
		ItemID.hallOfFameBat,
	], [
		ItemID.banana,
		ItemID.freshEgg,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.holmesHat,
		ItemID.hardHat,
		ItemID.ribbon,
		ItemID.copperBracelet,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.flamePendant,
		ItemID.rainPendant,
		ItemID.nightPendant,
		ItemID.piggyJelly,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.frenchFryPan,
		ItemID.crusherBeam,
		ItemID.multiBottleRocket,
		ItemID.bazooka,
		ItemID.bottleOfDXWater,
		ItemID.beefJerky,
		ItemID.secretHerb,
	], [
		ItemID.combatYoyo,
		ItemID.superBomb,
		ItemID.multiBottleRocket,
		ItemID.rustPromoterDX,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.ultimateBat,
		ItemID.holyFryPan,
		ItemID.shinyCoin,
		ItemID.hornOfLife,
		ItemID.mammothBurger,
		ItemID.luxuryJerky,
		ItemID.bottleOfDXWater,
	], [
		ItemID.ketchupPacket,
		ItemID.sugarPacket,
		ItemID.tinOfCocoa,
		ItemID.cartonOfCream,
		ItemID.sprigOfParsley,
		ItemID.jarOfHotSauce,
		ItemID.saltPacket,
	], [
		ItemID.coldRemedy,
		ItemID.refreshingHerb,
		ItemID.croissant,
		ItemID.skipSandwich,
		ItemID.luckySandwich1,
		ItemID.canOfFruitJuice,
		ItemID.cupOfCoffee,
	], [
		ItemID.croissant,
		ItemID.calorieStick,
		ItemID.cupOfCoffee,
		ItemID.none,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.insecticideSpray,
		ItemID.stagBeetle,
		ItemID.refreshingHerb,
		ItemID.peanutCheeseBar,
		ItemID.hornOfLife,
		ItemID.secretHerb,
		ItemID.picturePostcard,
	], [
		ItemID.wetTowel,
		ItemID.refreshingHerb,
		ItemID.calorieStick,
		ItemID.skipSandwich,
		ItemID.luckySandwich1,
		ItemID.canOfFruitJuice,
		ItemID.picnicLunch,
	], [
		ItemID.canOfFruitJuice,
		ItemID.cupOfCoffee,
		ItemID.hamburger,
		ItemID.picnicLunch,
		ItemID.skipSandwich,
		ItemID.wetTowel,
		ItemID.popsicle,
	], [
		ItemID.canOfFruitJuice,
		ItemID.cupOfCoffee,
		ItemID.hamburger,
		ItemID.doubleBurger,
		ItemID.luckySandwich1,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.bottleOfWater,
		ItemID.bowlOfRiceGruel,
		ItemID.jarOfDelisauce,
		ItemID.brainFoodLunch,
		ItemID.none,
		ItemID.none,
		ItemID.none,
	], [
		ItemID.beanCroquette,
		ItemID.molokheiyaSoup,
		ItemID.kabob,
		ItemID.boiledEgg,
		ItemID.freshEgg,
		ItemID.cupOfCoffee,
		ItemID.bottleOfWater,
	], [
		ItemID.ketchupPacket,
		ItemID.sugarPacket,
		ItemID.tinOfCocoa,
		ItemID.cartonOfCream,
		ItemID.sprigOfParsley,
		ItemID.jarOfHotSauce,
		ItemID.saltPacket,
	], [
		ItemID.cupOfNoodles,
		ItemID.beefJerky,
		ItemID.proteinDrink,
		ItemID.cupOfCoffee,
		ItemID.bottleOfDXWater,
		ItemID.secretHerb,
		ItemID.none,
	], [
		ItemID.doubleBurger,
		ItemID.picnicLunch,
		ItemID.freshEgg,
		ItemID.cupOfCoffee,
		ItemID.secretHerb,
		ItemID.none,
		ItemID.none,
	]
];

/// $D57880
immutable PSITeleportDestination[17] psiTeleportDestinationTable = [
	PSITeleportDestination(ebString!25(""), EventFlag.none, 0, 0),
	PSITeleportDestination(ebString!25("Onett"), EventFlag.tlptOnet, 253, 186),
	PSITeleportDestination(ebString!25("Twoson"), EventFlag.tlptTwsn, 176, 820),
	PSITeleportDestination(ebString!25("Threed"), EventFlag.tlptThrk, 692, 1126),
	PSITeleportDestination(ebString!25("Saturn Valley"), EventFlag.tlptBaka, 34, 972),
	PSITeleportDestination(ebString!25("Fourside"), EventFlag.tlptFour, 380, 505),
	PSITeleportDestination(ebString!25("Winters"), EventFlag.tlptWins, 62, 289),
	PSITeleportDestination(ebString!25("Summers"), EventFlag.tlptSums, 554, 353),
	PSITeleportDestination(ebString!25("Scaraba"), EventFlag.tlptSkrb, 152, 526),
	PSITeleportDestination(ebString!25("Dalaam"), EventFlag.tlptRama, 570, 449),
	PSITeleportDestination(ebString!25("Deep Darkness"), EventFlag.tlptMaky, 704, 896),
	PSITeleportDestination(ebString!25("Tenda Village"), EventFlag.tlptGumi, 564, 889),
	PSITeleportDestination(ebString!25("Underworld"), EventFlag.tlptDkfd, 325, 351),
	PSITeleportDestination(ebString!25(""), EventFlag.fourTonzuraFree, 433, 515),
	PSITeleportDestination(ebString!25("Dusty Dunes"), EventFlag.tlptDsrt, 160, 1251),
	PSITeleportDestination(ebString!25(""), EventFlag.fourTonzuraFree, 750, 747),
	PSITeleportDestination(ebString!25(""), EventFlag.none, 0, 0),
];

/// $D57B68
immutable TelephoneContact[7] telephoneContacts = [
	TelephoneContact(ebString!25(""), EventFlag.none, null),
	TelephoneContact(ebString!25("Dad"), EventFlag.sysPhonePapa, "textPhoneDad"),
	TelephoneContact(ebString!25("Mom"), EventFlag.sysPhoneMyHome, "textPhoneMom"),
	TelephoneContact(ebString!25("Escargo Express"), EventFlag.sysPhoneMyHome2, "textPhoneEscargoExpress"),
	TelephoneContact(ebString!25("Mach Pizza"), EventFlag.sysPhonePizza, "textPhoneMachPizza"),
	TelephoneContact(ebString!25("Stoic Club"), EventFlag.sysPhoneStoic, "textPhoneStoicClub"),
	TelephoneContact(ebString!25(""), EventFlag.none, null),
];

/// $D57B68
immutable BattleAction[318] battleActionTable = [
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.nothing, 0x00, "textNoMessage", &battleActionNull4), //NO_EFFECT
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction001", &battleActionNull4), //USE_NO_EFFECT
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction002", &battleActionNull4), //ACTION_002
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textTriedButCouldNotUseVeryWell", &battleActionNull4), //ACTION_003
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction004", &battleActionBash), //BASH
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction005", &battleActionShoot), //SHOOT
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction006", &battleActionSpy), //SPY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction007", &battleActionPray), //PRAY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction008", &battleActionNull), //GUARD
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textNoMessage", &battleActionNull5), //ACTION_009
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x0A, "textAction010", &battleActionPSIRockinAlpha), //PSI_ROCKIN_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x0E, "textAction010", &battleActionPSIRockinBeta), //PSI_ROCKIN_BETA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x28, "textAction010", &battleActionPSIRockinGamma), //PSI_ROCKIN_GAMMA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x62, "textAction010", &battleActionPSIRockinOmega), //PSI_ROCKIN_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.row, ActionType.psi, 0x06, "textAction010", &battleActionPSIFireAlpha), //PSI_FIRE_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.row, ActionType.psi, 0x0C, "textAction010", &battleActionPSIFireBeta), //PSI_FIRE_BETA
	BattleAction(ActionDirection.party, ActionTarget.row, ActionType.psi, 0x14, "textAction010", &battleActionPSIFireGamma), //PSI_FIRE_GAMMA
	BattleAction(ActionDirection.party, ActionTarget.row, ActionType.psi, 0x2A, "textAction010", &battleActionPSIFireOmega), //PSI_FIRE_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.psi, 0x04, "textAction010", &battleActionPSIFreezeAlpha), //PSI_FREEZE_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.psi, 0x09, "textAction010", &battleActionPSIFreezeBeta), //PSI_FREEZE_BETA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.psi, 0x12, "textAction010", &battleActionPSIFreezeGamma), //PSI_FREEZE_GAMMA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.psi, 0x1C, "textAction010", &battleActionPSIFreezeOmega), //PSI_FREEZE_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x03, "textAction010", &battleActionPSIThunderAlpha), //PSI_THUNDER_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x07, "textAction010", &battleActionPSIThunderBeta), //PSI_THUNDER_BETA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x10, "textAction010", &battleActionPSIThunderGamma), //PSI_THUNDER_GAMMA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x14, "textAction010", &battleActionPSIThunderOmega), //PSI_THUNDER_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x08, "textAction010", &battleActionPSIFlashAlpha), //PSI_FLASH_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x10, "textAction010", &battleActionPSIFlashBeta), //PSI_FLASH_BETA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x18, "textAction010", &battleActionPSIFlashGamma), //PSI_FLASH_GAMMA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x20, "textAction010", &battleActionPSIFlashOmega), //PSI_FLASH_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x18, "textAction010", &battleActionPSIStarstormAlpha), //PSI_STARSTORM_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x2A, "textAction010", &battleActionPSIStarstormOmega), //PSI_STARSTORM_BETA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x05, "textAction010", &battleActionLifeupAlpha), //PSI_LIFEUP_ALPHA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x08, "textAction010", &battleActionLifeupBeta), //PSI_LIFEUP_BETA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x0D, "textAction010", &battleActionLifeupGamma), //PSI_LIFEUP_GAMMA
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.psi, 0x18, "textAction010", &battleActionLifeupOmega), //PSI_LIFEUP_OMEGA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x05, "textAction010", &battleActionHealingAlpha), //PSI_HEALING_ALPHA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x08, "textAction010", &battleActionHealingBeta), //PSI_HEALING_BETA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x14, "textAction010", &battleActionHealingGamma), //PSI_HEALING_GAMMA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x26, "textAction010", &battleActionHealingOmega), //PSI_HEALING_OMEGA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x06, "textAction010", &battleActionShieldAlpha), //PSI_SHIELD_ALPHA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x0A, "textAction010", &battleActionShieldBeta), //PSI_SHIELD_BETA
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.psi, 0x12, "textAction010", &battleActionShieldSigma), //PSI_SHIELD_SIGMA
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.psi, 0x1E, "textAction010", &battleActionShieldOmega), //PSI_SHIELD_OMEGA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x08, "textAction010", &battleActionPSIShieldAlpha), //PSI_PSI_SHIELD_ALPHA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x0E, "textAction010", &battleActionPSIShieldBeta), //PSI_PSI_SHIELD_BETA
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.psi, 0x18, "textAction010", &battleActionPSIShieldSigma), //PSI_PSI_SHIELD_SIGMA
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.psi, 0x2A, "textAction010", &battleActionPSIShieldOmega), //PSI_PSI_SHIELD_OMEGA
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.psi, 0x0A, "textAction010", &battleActionOffenseUpAlpha), //PSI_OFFENSE_UP_ALPHA
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.psi, 0x1E, "textAction010", &battleActionOffenseUpOmega), //PSI_OFFENSE_UP_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.psi, 0x06, "textAction010", &battleActionDefenseDownAlpha), //PSI_DEFENSE_DOWN_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x12, "textAction010", &battleActionDefenseDownOmega), //PSI_DEFENSE_DOWN_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.psi, 0x06, "textAction010", &battleActionHypnosisAlpha), //PSI_HYPNOSIS_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x12, "textAction010", &battleActionHypnosisAlpha), //PSI_HYPNOSIS_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.psi, 0x00, "textAction010", &battleActionPSIMagnetAlpha), //PSI_MAGNET_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x00, "textAction010", &battleActionPSIMagnetOmega), //PSI_MAGNET_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.psi, 0x08, "textAction010", &battleActionParalysisAlpha), //PSI_PARALYSIS_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x18, "textAction010", &battleActionParalysisOmega), //PSI_PARALYSIS_OMEGA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.psi, 0x0A, "textAction010", &battleActionBrainshockAlpha), //PSI_BRAINSHOCK_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.psi, 0x1E, "textAction010", &battleActionBrainshockOmega), //PSI_BRAINSHOCK_OMEGA
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.psi, 0x02, "textAction010", &battleActionNull4), //PSI_TELEPORT_ALPHA
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.psi, 0x08, "textAction010", &battleActionNull4), //PSI_TELEPORT_OMEGA
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction062", &battleActionCallForHelp), //CALL_FOR_HELP
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction063", &battleActionSowSeeds), //SOW_SEEDS
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction064", &battleActionSuperBomb), //EXPLODE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction065", &battleActionSuperBomb), //BURST_INTO_FLAMES
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction066", &battleActionSteal), //STEAL
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction067", &battleActionFreezeTime), //FREEZE_IN_TIME
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction068", &battleActionDiamondize), //EERIE_GLARE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction069", &battleActionParalyze), //ELECTRIC_FIELD
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction070", &battleActionSolidify), //CLUMSY_BEAM
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction071", &battleActionNauseate), //NAUSEATING_BURP
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction072", &battleActionPoison), //POISON_STING
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction073", &battleActionPoison), //KISS_OF_DEATH
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction074", &battleActionCold), //COLD_BREATH
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction075", &battleActionMushroomize), //SCATTER_SPORES
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction076", &battleActionPossess), //POSSESS
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction077", &battleActionHypnosisAlphaCopy), //WONDERFUL_POWDER
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction078", &battleActionCrying), //MOLD_SPORES
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction079", &battleActionImmobilize), //BINDING_ATTACK
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction080", &battleActionImmobilize), //STICKY_MUCUS
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction081", &battleActionImmobilize), //SPEW_FLY_HONEY
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction082", &battleActionImmobilize), //SPIDER_SILK
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction083", &battleActionSolidify), //SCARY_WORDS
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction084", &battleActionBrainshockAlphaCopy), //SOMETHING_MYSTERIOUS
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction085", &battleActionDistract), //DISRUPT_SENSES
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction086", &battleActionFeelStrange), //SIZE_UP_SITUATION
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction087", &battleActionCrying2), //STINKY_BREATH
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction088", &battleActionPSIFlashGamma), //SUMMON_STORM
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction089", &battleActionPSIFireAlpha), //HOT_ESPRESSO
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction090", &battleActionHypnosisAlpha), //HAUNTING_MELODY
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction091", &battleActionPSIFireGamma), //EXTINGUISHING_BLAST
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction092", &battleActionPSIThunderBeta), //CRASHING_BOOM_BANG
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction093", &battleActionPSIFireOmega), //FIRE_SPRAY
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction094", &battleActionPSIFireGamma), //FIRE_BREATH
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction095", &battleActionReducePP), //SPIN_SOMETHING
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction096", &battleActionOffenseUpAlpha), //LOSE_TEMPER
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction097", &battleActionCutGuts), //SAY_SOMETHING_NASTY
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction098", &battleActionReduceOffenseDefense), //VACUUM_ATTACK
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.other, 0x00, "textAction099", &battleActionLifeupGamma), //REPLENISH_FUEL
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction100", &battleActionLevel2AttackPoison), //POISONOUS_BITE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction101", &battleActionSuperBomb), //FIRE_MISSILE_DIZZILY
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction102", &battleActionDoubleBash), //CONTINUOUS_ATTACK
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction103", &battleActionNull), //ON_GUARD
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction104", &battleAction350FireDamage), //SPEW_FIREBALL
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction105", &battleActionLevel4Attack), //INTERTWINE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction106", &battleActionLevel3Attack), //CRUSHING_CHOP
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction107", &battleActionLevel3Attack), //SUBMISSION_HOLD
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction108", &battleActionLevel3Attack), //REV_AND_ACCELERATE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction109", &battleActionLevel3Attack), //BRANDISH_KNIFE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction110", &battleActionLevel3Attack), //TEAR_INTO
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction111", &battleActionLevel3Attack), //BITE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction112", &battleActionLevel3Attack), //CLAW
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction113", &battleActionLevel3Attack), //SWING_TAIL
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction114", &battleActionLevel3Attack), //LUNGE_FORWARD
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction115", &battleActionLevel3Attack), //WIELD_SHOPPING_BAG
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction116", &battleActionLevel3Attack), //SWING_CLUB
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.piercingPhysical, 0x00, "textAction117", &battleActionLevel3AttackCopy), //GENERATE_TORNADO
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.piercingPhysical, 0x00, "textAction118", &battleActionLevel3AttackCopy), //SPRAY_WATER_BLAST
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction119", &battleActionNull2), //FLASH_SMILE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction120", &battleActionNull2), //LAUGH_HYSTERICALLY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction121", &battleActionNull2), //EDGE_CLOSER
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction122", &battleActionNull2), //WHISPER_3
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction123", &battleActionNull2), //MURMUR_2
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction124", &battleActionNull2), //MUTTER_1
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction125", &battleActionNull2), //FALL_DOWN
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction126", &battleActionNull2), //BE_ABSENTMINDED
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction127", &battleActionNull2), //GENERATE_STEAM
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction128", &battleActionNull2), //WOBBLE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction129", &battleActionNull2), //REEL
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction130", &battleActionNull2), //GRIN
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction131", &battleActionNull2), //TAKE_DEEP_BREATH
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction132", &battleActionNull2), //GREET
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction133", &battleActionNull2), //HOWL
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction134", &battleActionNull2), //TICK_TOCK
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionHPRecovery1d4), //ACTION_135
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionHPRecovery50), //ACTION_136
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionHPRecovery200), //ACTION_137
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionLifeupAlpha), //ACTION_138
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionLifeupBeta), //ACTION_139
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction140", &battleActionLifeupGamma), //HAND_AID
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.item, 0x00, "textAction135", &battleActionLifeupOmega), //ACTION_141
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionPPRecovery20), //ACTION_142
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionPPRecovery80), //ACTION_143
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionHPRecovery300), //ACTION_144
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionRandomStatUp1d4), //ACTION_145
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionHPRecovery10), //ACTION_146
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionHPRecovery100), //ACTION_147
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionHPRecovery10000), //ACTION_148
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction140", &battleActionHealingAlpha), //WET_TOWEL
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction140", &battleActionHealingBeta), //REFRESHING_HERB
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction140", &battleActionHealingGamma), //SECRET_HERB
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction140", &battleActionHealingOmega), //FULL_STATUS_HEAL
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction140", &healPoison), //ACTION_153
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionIQUp1d4), //ACTION_154
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionGutsUp1d4), //ACTION_155
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionSpeedUp1d4), //ACTION_156
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionVitalityUp1d4), //ACTION_157
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &battleActionLuckUp1d4), //ACTION_158
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction159", &battleActionCounterPSI), //COUNTER_PSI_UNIT
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction160", &battleActionShieldKiller), //SHIELD_KILLER
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction161", &battleActionHPSucker), //HP_SUCKER
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction162", &battleActionMummyWrap), //MUMMY_WRAP
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction163", &battleActionBottleRocket), //BOTTLE_ROCKET
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction164", &battleActionBigBottleRocket), //BIG_BOTTLE_ROCKET
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction165", &battleActionMultiBottleRocket), //MULTI_BOTTLE_ROCKET
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction162", &battleActionHandbagStrap), //HANDBAG_STRAP
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction167", &battleActionBomb), //BOMB
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction167", &battleActionSuperBomb), //SUPER_BOMB
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction169", &battleActionSolidify), //SLIME_GENERATOR
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction170", &battleActionYogurtDispenser), //YOGURT_DISPENSER
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction171", &battleActionSnake), //SNAKE_BAG
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction167", &battleActionSolidify), //DIRTY_SOCKS
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction167", &battleActionSolidify), //STAG_BEETLE
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction174", &battleActionSolidify), //TOOTHBRUSH
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction175", &battleActionPoison), //PHAROAHS_CURSE
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.item, 0x00, "textAction176", &battleActionHungryHPSucker), //HUNGRY_HP_SUCKER
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.item, 0x00, "textAction177", &battleActionBagOfDragonite), //BAG_OF_DRAGONITE
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.item, 0x00, "textAction178", &battleActionInsecticideSpray), //INSECTICIDE
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.item, 0x00, "textAction178", &battleActionXterminatorSpray), //XTERMINATOR_SPRAY
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.item, 0x00, "textAction178", &battleActionRustPromoter), //RUST_PROMOTER
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.item, 0x00, "textAction178", &battleActionRustPromoterDX), //RUST_PROMOTER_DX
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction140", &battleActionSuddenGutsPill), //SUDDEN_GUTS_PILL
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction140", &battleActionDefenseSpray), //DEFENSE_SPRAY
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.item, 0x00, "textAction140", &battleActionDefenseShower), //DEFENSE_SHOWER
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction140", &battleActionTeleportBox), //ACTION_185
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction186", &battleActionNull2), //RULER
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction187", &battleActionNull2), //PROTRACTOR
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction188", &battleActionNull2), //BUBBLE_GUM
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textNoMessage", &battleActionFlyHoney), //FLY_HONEY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction190", &battleActionNull4), //PIGGY_NOSE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction191", &battleActionNull4), //FOR_SALE_SIGN
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction192", &battleActionNull4), //SHYNESS_BOOK
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction193", &battleActionNull4), //PICTURE_POSTCARD
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction194", &battleActionNull4), //ACTION_194
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction195", &battleActionNull4), //CHICK
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction196", &battleActionNull4), //CHICKEN
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction197", &battleActionNull4), //ATM_CARD
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction198", &battleActionNull4), //ZOMBIE_PAPER
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction199", &battleActionNull4), //HAWK_EYE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction200", &battleActionNull4), //BICYCLE
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction201", &battleActionPSIFlashGamma), //GLORIOUS_LIGHT
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction202", &battleActionPSIThunderBeta), //ELECTRIC_SHOCK
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction203", &battleActionParalyze), //SCATTER_POLLEN
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction204", &battleActionSolidify), //REACH_WITH_ICY_HAND
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction205", &battleActionPoison), //PLAY_POISON_FLUTE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction206", &battleActionCrying), //SPEW_EXHAUST
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction207", &battleActionBrainshockAlphaCopy), //LAUGH_MANIACALLY
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction208", &battleActionHypnosisAlphaCopy), //BREATHE_THROUGH_FLUTE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction209", &battleActionSolidify), //LEAP_FORWARD_AND_SPREAD_WINGS
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction210", &battleActionSolidify), //BECOME_FRIENDLY
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction211", &battleActionSolidify), //LOUD_RUMBLE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction212", &battleActionImmobilize), //HUG
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction213", &battleActionCold), //COUGH
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction214", &battleActionLevel1Attack), //MISERY_ATTACK
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction215", &battleActionShoot), //PAINT_ATTACK
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction216", &battleActionBash), //COME_OUT_SWINGING
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction217", &battleActionBash), //SCRATCH
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction218", &battleActionBash), //PECK
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction219", &battleActionBash), //TRAMPLE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction220", &battleActionBash), //PUNCH
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction221", &battleActionShoot), //SPIT_SEEDS
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction222", &battleActionShoot), //FIRE_BEAM
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction223", &battleActionBash), //SPEAR_JAB
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction224", &battleActionBash), //STOMP
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textAction225", &battleActionLevel3Attack), //SWING_HULA_HOOP
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction226", &battleActionLevel3Attack), //CHARGE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction227", &battleActionLevel3Attack), //SHRED_ON_SKATEBOARD
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction228", &battleActionLevel2AttackDiamondize), //DIAMONDIZING_BITE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction229", &battleActionCutGuts), //GRUMBLE_ABOUT_YOUTH
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction230", &battleActionCutGuts), //LECTURE
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction231", &battleActionCutGuts), //SCOWL
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction232", &battleActionReduceOffense), //VENT_ODOR
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction233", &battleActionReduceOffenseDefense), //SHOUT
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction234", &battleActionReduceOffenseDefense), //WAR_CRY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction235", &battleActionNull2), //KNIT_BROW
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction236", &battleActionNull2), //BE_CLUMSY
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction075", &battleActionPoison), //SCATTER_SPORES_2
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textAction111", &battleActionBash), //BITING_ATTACK
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.physical, 0x00, "textNoMessage", &battleActionSwitchWeapons), //EQUIP_AND_ATTACK
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textNoMessage", &battleActionSwitchArmor), //EQUIP_ARMOUR
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction241", &battleActionCold), //NIGHT_TIME_STUFFINESS_BEAM
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction242", &battleActionImmobilize), //COIL_AROUND
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction243", &battleActionClumsyRobotDeath), //RUNAWAY_FIVE_EVENT
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction244", &battleActionMasterBarfDeath), //MASTER_BARF_DEFEAT
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textNoMessage", &battleActionEnemyExtend), //ENEMY_EXTENDER
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.piercingPhysical, 0x00, "textNoMessage", &battleActionSwitchWeapons), //ACTION_246
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction140", &unknownC290C6), //NEUTRALIZER
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction248", &unknownC290C6), //EMIT_PALE_GREEN_LIGHT
	BattleAction(ActionDirection.enemy, ActionTarget.one, ActionType.item, 0x00, "textAction135", &eatFood), //GENERIC_FOOD
	BattleAction(ActionDirection.enemy, ActionTarget.all, ActionType.item, 0x00, "textAction250", &eatFood), //GENERIC_FOOD_PARTY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction251", &battleActionNull11), //ACTION_251
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction252", &battleActionNull7), //ACTION_252
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction253", &battleActionNull10), //ACTION_253
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction254", &battleActionNull6), //ACTION_254
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textBattleAbleToMove", &battleActionNull8), //ACTION_255
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction256", &battleActionNull9), //ACTION_256
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction257", &battleActionNull2), //WOLFED_DOWN_FLY_HONEY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction258", &battleActionNull4), //SOUND_STONE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction259", &battleActionNull4), //EXIT_MOUSE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction260", &battleActionNull2), //BE_POKEY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction261", &battleActionNull2), //ACTION_261
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction262", &battleActionNull2), //ACTION_262
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction263", &battleActionNull2), //ACTION_263
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction264", &battleActionNull2), //BARK
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction265", &battleActionNull2), //CHANT_SPELL
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction266", &battleActionNull2), //NO_EFFECT_TONY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction267", &battleActionNull2), //SCRATCH_HEAD
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction268", &battleActionSnake), //SNAKE
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction268", &battleActionPoison), //VIPER
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction270", &battleActionNull4), //HIEROGLYPH_COPY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction271", &battleActionNull4), //TOWN_MAP
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textNoMessage", &battleActionNull4), //VIDEO_RELAXANT
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction273", &battleActionReduceOffense), //DISCHARGE_STINKY_GAS
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction274", &battleActionPSIThunderBeta), //INCOMPREHENSIBLE_ATTACK_THUNDER_BETA
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction275", &battleActionPokeySpeech), //POKEY_SPEECH_1
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textNoMessage", &battleActionNull4), //POKEY_ATTACK
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textNoMessage", &battleActionNull12), //GIYGAS_ATTACK
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textNoMessage", &battleActionPokeySpeech2), //POKEY_SPEECH_2
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textBattleRunSuccess", &battleActionNull4), //RUN_AWAY
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.other, 0x00, "textAction280", &battleActionMirror), //MIRROR
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction281", &battleActionNull4), //SUPORMA
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction282", &battleActionNull4), //INSIGNIFICANT_ITEM
	BattleAction(ActionDirection.party, ActionTarget.random, ActionType.item, 0x00, "textAction283", &battleActionSolidify), //MONKEYS_LOVE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction284", &battleActionNull4), //TENDAKRAUT
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction285", &battleActionNull4), //KING_BANANA
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction286", &battleActionNull4), //RECEIVER_PHONE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction287", &battleActionNull4), //LETTER_FROM_MOM
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction288", &battleActionNull4), //LETTER_FROM_TONY
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.item, 0x00, "textAction289", &battleActionNull4), //LETTER_FROM_KIDS
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction290", &battleActionRainbowOfColours), //GIVE_OFF_RAINBOW
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction291", &battleActionGiygasPrayer1), //FINAL_PRAYER_1
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction292", &battleActionGiygasPrayer2), //FINAL_PRAYER_2
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction293", &battleActionGiygasPrayer3), //FINAL_PRAYER_3
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction294", &battleActionGiygasPrayer4), //FINAL_PRAYER_4
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction295", &battleActionGiygasPrayer5), //FINAL_PRAYER_5
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction296", &battleActionGiygasPrayer6), //FINAL_PRAYER_6
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction297", &battleActionGiygasPrayer7), //FINAL_PRAYER_7
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction298", &battleActionGiygasPrayer8), //FINAL_PRAYER_8
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction299", &battleActionGiygasPrayer9), //FINAL_PRAYER_9
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction274", &battleActionPSIFreezeAlpha), //INCOMPREHENSIBLE_ATTACK_FREEZE_ALPHA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction274", &battleActionPSIFlashGamma), //INCOMPREHENSIBLE_ATTACK_FLASH_GAMMA
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction302", &battleActionPSIThunderBeta), //INCOMPREHENSIBLE_ATTACK_THUNDER_BETA_VULNERABLE
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction302", &battleActionPSIFreezeAlpha), //INCOMPREHENSIBLE_ATTACK_FREEZE_ALPHA_VULNERABLE
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction302", &battleActionPSIFlashGamma), //INCOMPREHENSIBLE_ATTACK_FLASH_GAMMA_VULNERABLE
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction305", &battleActionPSIThunderBeta), //INCOMPREHENSIBLE_ATTACK_THUNDER_BETA_UNSTABLE
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction305", &battleActionPSIFreezeAlpha), //INCOMPREHENSIBLE_ATTACK_FREEZE_ALPHA_UNSTABLE
	BattleAction(ActionDirection.party, ActionTarget.all, ActionType.other, 0x00, "textAction305", &battleActionPSIFlashGamma), //INCOMPREHENSIBLE_ATTACK_FLASH_GAMMA_UNSTABLE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction308", &battleActionNull4), //RANDOM_GIYGAS_QUOTE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction309", &battleActionNull4), //RANDOM_GIYGAS_QUOTE_TIMES_3
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction310", &battleActionBomb), //BAZOOKA
	BattleAction(ActionDirection.party, ActionTarget.one, ActionType.item, 0x00, "textAction310", &battleActionSuperBomb), //HEAVY_BAZOOKA
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction312", &battleActionNull4), //SAY_PLAYER_NAME
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction313", &battleActionNull4), //EAT_BOLOGNA_SANDWICH
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction314", &battleActionNull4), //LOSE_GEAR_AND_BOLTS
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction315", &battleActionNull4), //REAPPLY_BANDAGE
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction316", &battleActionNull4), //CLEAN_AREA
	BattleAction(ActionDirection.enemy, ActionTarget.none, ActionType.other, 0x00, "textAction317", &battleActionNull4), //WANT_BATTERY
];

/// $D58A50
immutable PSIAbility[54] psiAbilityTable = [
	PSIAbility(0x00, 0x00, 0x00, 0x00, BattleActions.noEffect, 0x00, 0x00, 0x00, 0x00, 0x00, null),
	PSIAbility(PSIID.rockin, PSILevel.alpha, PSICategory.offense, PSITarget.enemies, BattleActions.psiRockinAlpha, 0x08, 0x00, 0x00, 0x09, 0x00, "textPSIRockinAlphaDesc"),
	PSIAbility(PSIID.rockin, PSILevel.beta, PSICategory.offense, PSITarget.enemies, BattleActions.psiRockinBeta, 0x16, 0x00, 0x00, 0x0B, 0x00, "textPSIRockinBetaDesc"),
	PSIAbility(PSIID.rockin, PSILevel.gamma, PSICategory.offense, PSITarget.enemies, BattleActions.psiRockinGamma, 0x31, 0x00, 0x00, 0x0D, 0x00, "textPSIRockinGammaDesc"),
	PSIAbility(PSIID.rockin, PSILevel.omega, PSICategory.offense, PSITarget.enemies, BattleActions.psiRockinOmega, 0x4B, 0x00, 0x00, 0x0F, 0x00, "textPSIRockinOmegaDesc"),
	PSIAbility(PSIID.fire, PSILevel.alpha, PSICategory.offense, PSITarget.enemies, BattleActions.psiFireAlpha, 0x00, 0x03, 0x00, 0x09, 0x00, "textPSIFireAlphaDesc"),
	PSIAbility(PSIID.fire, PSILevel.beta, PSICategory.offense, PSITarget.enemies, BattleActions.psiFireBeta, 0x00, 0x13, 0x00, 0x0B, 0x00, "textPSIFireBetaDesc"),
	PSIAbility(PSIID.fire, PSILevel.gamma, PSICategory.offense, PSITarget.enemies, BattleActions.psiFireGamma, 0x00, 0x25, 0x00, 0x0D, 0x00, "textPSIFireGammaDesc"),
	PSIAbility(PSIID.fire, PSILevel.omega, PSICategory.offense, PSITarget.enemies, BattleActions.psiFireOmega, 0x00, 0x40, 0x00, 0x0F, 0x00, "textPSIFireOmegaDesc"),
	PSIAbility(PSIID.freeze, PSILevel.alpha, PSICategory.offense, PSITarget.enemies, BattleActions.psiFreezeAlpha, 0x00, 0x01, 0x01, 0x09, 0x01, "textPSIFreezeAlphaDesc"),
	PSIAbility(PSIID.freeze, PSILevel.beta, PSICategory.offense, PSITarget.enemies, BattleActions.psiFreezeBeta, 0x00, 0x0B, 0x01, 0x0B, 0x01, "textPSIFreezeBetaDesc"),
	PSIAbility(PSIID.freeze, PSILevel.gamma, PSICategory.offense, PSITarget.enemies, BattleActions.psiFreezeGamma, 0x00, 0x1F, 0x21, 0x0D, 0x01, "textPSIFreezeGammaDesc"),
	PSIAbility(PSIID.freeze, PSILevel.omega, PSICategory.offense, PSITarget.enemies, BattleActions.psiFreezeOmega, 0x00, 0x2E, 0x00, 0x0F, 0x01, "textPSIFreezeOmegaDesc"),
	PSIAbility(PSIID.thunder, PSILevel.alpha, PSICategory.offense, PSITarget.enemies, BattleActions.psiThunderAlpha, 0x00, 0x08, 0x01, 0x09, 0x02, "textPSIThunderAlphaDesc"),
	PSIAbility(PSIID.thunder, PSILevel.beta, PSICategory.offense, PSITarget.enemies, BattleActions.psiThunderBeta, 0x00, 0x19, 0x01, 0x0B, 0x02, "textPSIThunderBetaDesc"),
	PSIAbility(PSIID.thunder, PSILevel.gamma, PSICategory.offense, PSITarget.enemies, BattleActions.psiThunderGamma, 0x00, 0x39, 0x29, 0x0D, 0x02, "textPSIThunderGammaDesc"),
	PSIAbility(PSIID.thunder, PSILevel.omega, PSICategory.offense, PSITarget.enemies, BattleActions.psiThunderOmega, 0x00, 0x00, 0x37, 0x0F, 0x02, "textPSIThunderOmegaDesc"),
	PSIAbility(PSIID.flash, PSILevel.alpha, PSICategory.offense, PSITarget.enemies, BattleActions.psiFlashAlpha, 0x12, 0x00, 0x00, 0x09, 0x01, "textPSIFlashAlphaDesc"),
	PSIAbility(PSIID.flash, PSILevel.beta, PSICategory.offense, PSITarget.enemies, BattleActions.psiFlashBeta, 0x26, 0x00, 0x00, 0x0B, 0x01, "textPSIFlashBetaDesc"),
	PSIAbility(PSIID.flash, PSILevel.gamma, PSICategory.offense, PSITarget.enemies, BattleActions.psiFlashGamma, 0x3D, 0x00, 0x00, 0x0D, 0x01, "textPSIFlashGammaDesc"),
	PSIAbility(PSIID.flash, PSILevel.omega, PSICategory.offense, PSITarget.enemies, BattleActions.psiFlashOmega, 0x43, 0x00, 0x00, 0x0F, 0x01, "textPSIFlashOmegaDesc"),
	PSIAbility(PSIID.starstorm, PSILevel.alpha, PSICategory.offense, PSITarget.enemies, BattleActions.psiStarstormAlpha, 0x00, 0x00, 0x00, 0x09, 0x00, "textPSIStarstormAlphaDesc"),
	PSIAbility(PSIID.starstorm, PSILevel.omega, PSICategory.offense, PSITarget.enemies, BattleActions.psiStarstormBeta, 0x00, 0x00, 0x00, 0x0B, 0x00, "textPSIStarstormOmegaDesc"),
	PSIAbility(PSIID.lifeup, PSILevel.alpha, PSICategory.recover, PSITarget.allies, BattleActions.psiLifeupAlpha, 0x02, 0x00, 0x01, 0x09, 0x00, "textPSILifeupAlphaDesc"),
	PSIAbility(PSIID.lifeup, PSILevel.beta, PSICategory.recover, PSITarget.allies, BattleActions.psiLifeupBeta, 0x14, 0x00, 0x01, 0x0B, 0x00, "textPSILifeupBetaDesc"),
	PSIAbility(PSIID.lifeup, PSILevel.gamma, PSICategory.recover, PSITarget.allies, BattleActions.psiLifeupGamma, 0x27, 0x00, 0x2E, 0x0D, 0x00, "textPSILifeupGammaDesc"),
	PSIAbility(PSIID.lifeup, PSILevel.omega, PSICategory.recover, PSITarget.allies, BattleActions.psiLifeupOmega, 0x46, 0x00, 0x00, 0x0F, 0x00, "textPSILifeupOmegaDesc"),
	PSIAbility(PSIID.healing, PSILevel.alpha, PSICategory.recover, PSITarget.allies, BattleActions.psiHealingAlpha, 0x0A, 0x00, 0x01, 0x09, 0x01, "textPSIHealingAlphaDesc"),
	PSIAbility(PSIID.healing, PSILevel.beta, PSICategory.recover, PSITarget.allies, BattleActions.psiHealingBeta, 0x18, 0x00, 0x01, 0x0B, 0x01, "textPSIHealingBetaDesc"),
	PSIAbility(PSIID.healing, PSILevel.gamma, PSICategory.recover, PSITarget.allies, BattleActions.psiHealingGamma, 0x35, 0x00, 0x24, 0x0D, 0x01, "textPSIHealingGammaDesc"),
	PSIAbility(PSIID.healing, PSILevel.omega, PSICategory.recover, PSITarget.allies, BattleActions.psiHealingOmega, 0x00, 0x00, 0x34, 0x0F, 0x01, "textPSIHealingOmegaDesc"),
	PSIAbility(PSIID.shield, PSILevel.alpha, PSICategory.assist, PSITarget.enemies, BattleActions.psiShieldAlpha, 0x0C, 0x00, 0x0E, 0x09, 0x00, "textShieldAlphaDesc"),
	PSIAbility(PSIID.shield, PSILevel.sigma, PSICategory.assist, PSITarget.enemies, BattleActions.psiShieldSigma, 0x00, 0x00, 0x0F, 0x0B, 0x00, "textShieldSigmaDesc"),
	PSIAbility(PSIID.shield, PSILevel.beta, PSICategory.assist, PSITarget.enemies, BattleActions.psiShieldBeta, 0x22, 0x00, 0x10, 0x0D, 0x00, "textShieldBetaDesc"),
	PSIAbility(PSIID.shield, PSILevel.omega, PSICategory.assist, PSITarget.enemies, BattleActions.psiShieldOmega, 0x00, 0x00, 0x33, 0x0F, 0x00, "textShieldOmegaDesc"),
	PSIAbility(PSIID.psiShield, PSILevel.alpha, PSICategory.assist, PSITarget.enemies, BattleActions.psiPSIShieldAlpha, 0x00, 0x06, 0x00, 0x09, 0x00, "textPSIShieldAlphaDesc"),
	PSIAbility(PSIID.psiShield, PSILevel.sigma, PSICategory.assist, PSITarget.enemies, BattleActions.psiPSIShieldSigma, 0x00, 0x1B, 0x00, 0x0B, 0x00, "textPSIShieldSigmaDesc"),
	PSIAbility(PSIID.psiShield, PSILevel.beta, PSICategory.assist, PSITarget.enemies, BattleActions.psiPSIShieldBeta, 0x00, 0x33, 0x00, 0x0D, 0x00, "textPSIShieldBetaDesc"),
	PSIAbility(PSIID.psiShield, PSILevel.omega, PSICategory.assist, PSITarget.enemies, BattleActions.psiPSIShieldOmega, 0x00, 0x3C, 0x00, 0x0F, 0x00, "textPSIShieldOmegaDesc"),
	PSIAbility(PSIID.offenseUp, PSILevel.alpha, PSICategory.assist, PSITarget.enemies, BattleActions.psiOffenseUpAlpha, 0x00, 0x15, 0x00, 0x09, 0x01, "textPSIOffenseUpAlphaDesc"),
	PSIAbility(PSIID.offenseUp, PSILevel.omega, PSICategory.assist, PSITarget.enemies, BattleActions.psiOffenseUpOmega, 0x00, 0x28, 0x00, 0x0B, 0x01, "textPSIOffenseUpOmegaDesc"),
	PSIAbility(PSIID.defenseDown, PSILevel.alpha, PSICategory.assist, PSITarget.enemies, BattleActions.psiDefenseDownAlpha, 0x00, 0x1D, 0x00, 0x09, 0x02, "textPSIDefenseDownAlphaDesc"),
	PSIAbility(PSIID.defenseDown, PSILevel.omega, PSICategory.assist, PSITarget.enemies, BattleActions.psiDefenseDownOmega, 0x00, 0x36, 0x00, 0x0B, 0x02, "textPSIDefenseDownOmegaDesc"),
	PSIAbility(PSIID.hypnosis, PSILevel.alpha, PSICategory.assist, PSITarget.enemies, BattleActions.psiHypnosisAlpha, 0x04, 0x00, 0x00, 0x09, 0x01, "textPSIHypnosisAlphaDesc"),
	PSIAbility(PSIID.hypnosis, PSILevel.omega, PSICategory.assist, PSITarget.enemies, BattleActions.psiHypnosisOmega, 0x1B, 0x00, 0x00, 0x0B, 0x01, "textPSIHypnosisOmegaDesc"),
	PSIAbility(PSIID.magnet, PSILevel.alpha, PSICategory.recover, PSITarget.enemies, BattleActions.psiMagnetAlpha, 0x00, 0x0F, 0x15, 0x09, 0x02, "textPSIMagnetAlphaDesc"),
	PSIAbility(PSIID.magnet, PSILevel.omega, PSICategory.recover, PSITarget.enemies, BattleActions.psiMagnetOmega, 0x00, 0x18, 0x1B, 0x0B, 0x02, "textPSIMagnetOmegaDesc"),
	PSIAbility(PSIID.paralysis, PSILevel.alpha, PSICategory.assist, PSITarget.enemies, BattleActions.psiParalysisAlpha, 0x0E, 0x00, 0x00, 0x09, 0x02, "textPSIParalysisAlphaDesc"),
	PSIAbility(PSIID.paralysis, PSILevel.omega, PSICategory.assist, PSITarget.enemies, BattleActions.psiParalysisOmega, 0x1D, 0x00, 0x00, 0x0B, 0x02, "textPSIParalysisOmegaDesc"),
	PSIAbility(PSIID.brainshock, PSILevel.alpha, PSICategory.assist, PSITarget.enemies, BattleActions.psiBrainshockAlpha, 0x00, 0x00, 0x18, 0x09, 0x01, "textPSIBrainshockAlphaDesc"),
	PSIAbility(PSIID.brainshock, PSILevel.omega, PSICategory.assist, PSITarget.enemies, BattleActions.psiBrainshockOmega, 0x00, 0x00, 0x2C, 0x0B, 0x01, "textPSIBrainshockOmegaDesc"),
	PSIAbility(PSIID.teleport, PSILevel.alpha, PSICategory.other, PSITarget.nobody, BattleActions.psiTeleportAlpha, 0x00, 0x00, 0x11, 0x09, 0x02, "textPSITeleportAlphaDesc"),
	PSIAbility(PSIID.teleport, PSILevel.beta, PSICategory.other, PSITarget.nobody, BattleActions.psiTeleportOmega, 0x00, 0x00, 0x12, 0x0B, 0x02, "textPSITeleportBetaDesc"),
	PSIAbility(0x00, 0x00, 0x00, 0x00, BattleActions.noEffect, 0x00, 0x00, 0x00, 0x00, 0x00, null),
];

/// $D58D7A
immutable ubyte[25][17] psiNameTable = [
	ebString!25("PSI(????)"),
	ebString!25("PSI Fire "),
	ebString!25("PSI Freeze "),
	ebString!25("PSI Thunder "),
	ebString!25("PSI Flash "),
	ebString!25("PSI Starstorm "),
	ebString!25("Lifeup "),
	ebString!25("Healing "),
	ebString!25("Shield "),
	ebString!25("PSI Shield "),
	ebString!25("Offense up "),
	ebString!25("Defense down "),
	ebString!25("Hypnosis "),
	ebString!25("PSI Magnet "),
	ebString!25("Paralysis "),
	ebString!25("Brainshock "),
	ebString!25("Teleport "),
];

/// $D58F23
immutable NPCAI[19] npcAITable = [
	NPCAI(0, 0),
	NPCAI(0, 0),
	NPCAI(0, 0),
	NPCAI(0, 0),
	NPCAI(0, 0),
	NPCAI(NPCTargettability.untargettable, EnemyID.pokey),
	NPCAI(NPCTargettability.untargettable, EnemyID.picky),
	NPCAI(NPCTargettability.untargettable, EnemyID.myPet),
	NPCAI(NPCTargettability.untargettable, EnemyID.tony),
	NPCAI(NPCTargettability.untargettable, EnemyID.bubbleMonkey),
	NPCAI(NPCTargettability.untargettable, EnemyID.dungeonMan),
	NPCAI(NPCTargettability.normal, EnemyID.flyingMan),
	NPCAI(NPCTargettability.normal, EnemyID.flyingMan),
	NPCAI(NPCTargettability.normal, EnemyID.flyingMan),
	NPCAI(NPCTargettability.normal, EnemyID.flyingMan),
	NPCAI(NPCTargettability.normal, EnemyID.flyingMan),
	NPCAI(NPCTargettability.forced, EnemyID.teddyBear),
	NPCAI(NPCTargettability.forced, EnemyID.superPlushBear),
	NPCAI(0, 0),
];

/// $D58F59
immutable uint[100][4] expTable =[
	[
		0,
		0,
		4,
		17,
		44,
		109,
		236,
		449,
		772,
		1229,
		1844,
		2641,
		3644,
		4877,
		6364,
		8129,
		10703,
		13241,
		16214,
		19673,
		23669,
		28253,
		33476,
		39389,
		46043,
		53489,
		61778,
		70961,
		81089,
		92213,
		104384,
		117653,
		132071,
		147689,
		164558,
		182729,
		202270,
		223249,
		245734,
		269793,
		295494,
		322905,
		352094,
		383129,
		416078,
		451009,
		487990,
		527089,
		568374,
		611913,
		657774,
		706025,
		756734,
		809969,
		865798,
		924289,
		985510,
		1049529,
		1116414,
		1186233,
		1259054,
		1335030,
		1414314,
		1497059,
		1583418,
		1673544,
		1767590,
		1865709,
		1968054,
		2074778,
		2186034,
		2301975,
		2422754,
		2548524,
		2679438,
		2815649,
		2957310,
		3104574,
		3257594,
		3416523,
		3581514,
		3752720,
		3930294,
		4114389,
		4305158,
		4502754,
		4707330,
		4919039,
		5138034,
		5364468,
		5598494,
		5840265,
		6089934,
		6347654,
		6613578,
		6887859,
		7170650,
		7462104,
		7762374,
		8071613,
	], [
		0,
		0,
		8,
		32,
		80,
		178,
		352,
		628,
		1032,
		1590,
		2328,
		3272,
		4448,
		5882,
		7600,
		9628,
		12023,
		14842,
		18142,
		21980,
		26413,
		31498,
		37292,
		43852,
		51235,
		59498,
		68698,
		78892,
		90137,
		102490,
		116008,
		130748,
		146767,
		164122,
		182870,
		203068,
		224789,
		248106,
		273092,
		299820,
		328363,
		358794,
		391186,
		425612,
		462145,
		500858,
		541824,
		585116,
		630807,
		678970,
		729678,
		783004,
		839021,
		897802,
		959420,
		1023948,
		1091459,
		1162026,
		1235722,
		1312620,
		1392793,
		1476442,
		1563768,
		1654972,
		1750255,
		1849818,
		1953862,
		2062588,
		2176197,
		2294890,
		2418868,
		2548332,
		2683483,
		2824522,
		2971650,
		3125068,
		3284977,
		3451578,
		3625072,
		3805660,
		3993543,
		4188922,
		4391998,
		4602972,
		4822045,
		5049418,
		5285292,
		5529868,
		5783347,
		6045930,
		6317818,
		6599212,
		6890313,
		7191322,
		7502440,
		7823868,
		8155807,
		8498458,
		8852022,
		9216700,
	], [
		0,
		0,
		4,
		16,
		40,
		88,
		172,
		304,
		496,
		760,
		1108,
		1552,
		2104,
		2776,
		3580,
		4528,
		5733,
		7308,
		9366,
		12020,
		15383,
		19568,
		24688,
		30856,
		38185,
		46788,
		56778,
		68268,
		81371,
		96200,
		112868,
		131488,
		152173,
		175036,
		200190,
		227748,
		257711,
		290080,
		324856,
		362040,
		401633,
		443636,
		488050,
		534876,
		584115,
		635768,
		689836,
		746320,
		805221,
		866540,
		930278,
		996436,
		1065015,
		1136016,
		1209440,
		1285288,
		1363561,
		1444260,
		1527386,
		1612940,
		1700923,
		1791605,
		1885256,
		1982146,
		2082545,
		2186723,
		2294950,
		2407496,
		2524631,
		2646625,
		2773748,
		2906270,
		3044461,
		3188591,
		3338930,
		3495748,
		3659315,
		3829901,
		4007776,
		4193210,
		4386473,
		4587835,
		4797566,
		5015936,
		5243215,
		5479673,
		5725580,
		5981206,
		6246821,
		6522695,
		6809098,
		7106300,
		7414571,
		7734181,
		8065400,
		8408498,
		8763745,
		9131411,
		9511766,
		9905080,
	], [
		6000,
		0,
		8,
		25,
		52,
		106,
		204,
		363,
		600,
		932,
		1376,
		1949,
		2668,
		3550,
		4612,
		5871,
		7390,
		9232,
		11460,
		14137,
		17326,
		21090,
		25492,
		30595,
		36462,
		43156,
		50740,
		59277,
		68830,
		79462,
		91236,
		104215,
		118462,
		134040,
		151012,
		169441,
		189442,
		211130,
		234620,
		260027,
		287466,
		317052,
		348900,
		383125,
		419842,
		459166,
		501212,
		546095,
		593930,
		644832,
		698916,
		756297,
		817090,
		881410,
		949372,
		1021091,
		1096682,
		1176260,
		1259940,
		1347837,
		1440066,
		1536775,
		1638112,
		1744225,
		1855262,
		1971371,
		2092700,
		2219397,
		2351610,
		2489487,
		2633176,
		2782825,
		2938582,
		3100595,
		3269012,
		3443981,
		3625650,
		3814167,
		4009680,
		4212337,
		4422286,
		4639675,
		4864652,
		5097365,
		5337962,
		5586591,
		5843400,
		6108537,
		6382150,
		6664387,
		6955396,
		7255325,
		7564322,
		7882535,
		8210112,
		8547201,
		8893950,
		9250507,
		9617020,
		9993637,
	]
];

/// $D59589
immutable Enemy[231] enemyConfigurationTable = [
	Enemy(0x00, ebString!25("null"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 0, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x00, 0, Music.none, 0, 0, 0, 0, 0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Insane Cultist"), Gender.male, EnemyType.normal, 0x003F, OverworldSprite.insaneCultist, 0x07, 94, 0, 353, 33, ActionScript.unknown021, "textBattleEnemyTrappedYou", "textBattleTurnedBackToNormal", 0x03, 13, Music.vsCaveBoy, 19, 25, 8, 20, 64, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.paintAttack, BattleActions.callForHelp, BattleActions.paintAttack, BattleActions.paintAttack], BattleActions.noEffect, [0x00, EnemyID.insaneCultist1, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x00, ebString!25("Dept. Store Spook"), Gender.male, EnemyType.normal, 0x003D, OverworldSprite.whirlingRobo, 0x07, 610, 290, 24291, 1648, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D71", 0x16, 42, Music.vsCaveBoy, 82, 135, 19, 24, 62, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, 0x03, [BattleActions.psiFreezeAlpha, BattleActions.psiFireAlpha, BattleActions.psiLifeupAlpha, BattleActions.enemyExtender], BattleActions.noEffect, [0x09, 0x05, 0x17, EnemyID.deptStoreSpook2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Armored Frog"), Gender.neutral, EnemyType.normal, 0x0003, OverworldSprite.armoredFrog, 0x07, 202, 0, 1566, 77, ActionScript.unknown021, "textBlockEF78B8", "textBlockEF6D96", 0x09, 22, Music.vsStruttinEvilMushroom, 37, 108, 7, 5, 8, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.spinSomething], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x04, ItemID.brokenSprayCan, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Bad Buffalo"), Gender.male, EnemyType.normal, 0x004A, OverworldSprite.badBuffalo, 0x07, 341, 0, 4108, 172, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x07, 34, Music.vsCaveBoy, 64, 104, 11, 5, 5, 0x00, 0x01, 0x01, 0x00, 0x02, 0x02, 0x01, [BattleActions.trample, BattleActions.tearInto, BattleActions.trample, BattleActions.knitBrow], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.wetTowel, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Black Antoid"), Gender.neutral, EnemyType.insect, 0x0001, OverworldSprite.blackAntoid, 0x07, 34, 25, 37, 7, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x08, 7, Music.vsCrankyLady, 14, 13, 4, 3, 0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x01, [BattleActions.bash, BattleActions.callForHelp, BattleActions.bash, BattleActions.psiLifeupAlpha], BattleActions.noEffect, [0x00, EnemyID.blackAntoid1, 0x00, 0x17], 0x00, 1, 0x00, 0x05, ItemID.cookie, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x01, ebString!25("Red Antoid"), Gender.neutral, EnemyType.insect, 0x0001, OverworldSprite.blackAntoid, 0x07, 112, 30, 1175, 35, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x10, 20, Music.vsCrankyLady, 29, 27, 10, 4, 0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x01, [BattleActions.bash, BattleActions.callForHelp, BattleActions.bite, BattleActions.psiDefenseDownAlpha], BattleActions.noEffect, [0x00, EnemyID.redAntoid, 0x00, 0x29], 0x00, 2, 0x00, 0x04, ItemID.sugarPacket, InitialStatus.none, 0x00, 0x00, 0x03, 0x32),
	Enemy(0x01, ebString!25("Ramblin' Evil Mushroom"), Gender.neutral, EnemyType.normal, 0x0005, OverworldSprite.ramblinEvilMushroom, 0x07, 60, 0, 95, 15, ActionScript.unknown024, "textBlockEF789C", "textBlockEF6D83", 0x09, 7, Music.vsStruttinEvilMushroom, 15, 10, 5, 5, 1, 0x00, 0x00, 0x01, 0x01, 0x03, 0x02, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.scatterSpores], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x03, ItemID.ketchupPacket, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Struttin' Evil Mushroom"), Gender.neutral, EnemyType.normal, 0x0005, OverworldSprite.ramblinEvilMushroom, 0x07, 157, 0, 1492, 95, ActionScript.unknown024, "textBlockEF789C", "textBlockEF6D83", 0x0D, 17, Music.vsStruttinEvilMushroom, 29, 22, 28, 7, 1, 0x00, 0x00, 0x01, 0x01, 0x03, 0x02, 0x03, [BattleActions.scatterSpores, BattleActions.bash, BattleActions.bash, BattleActions.scatterSpores2], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x03, ItemID.rustPromoter, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Mobile Sprout"), Gender.neutral, EnemyType.normal, 0x005A, OverworldSprite.mobileSprout, 0x06, 79, 9, 133, 13, ActionScript.unknown024, "textBlockEF78C7", "textBlockEF6D83", 0x06, 10, Music.vsCrankyLady, 17, 12, 6, 5, 1, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x01, [BattleActions.bash, BattleActions.psiMagnetAlpha, BattleActions.sowSeeds, BattleActions.psiLifeupAlpha], BattleActions.noEffect, [0x00, 0x2D, EnemyID.mobileSprout, 0x17], 0x00, 1, 0x00, 0x02, ItemID.croissant, InitialStatus.none, 0x00, 0x00, 0x03, 0x32),
	Enemy(0x01, ebString!25("Tough Mobile Sprout"), Gender.neutral, EnemyType.normal, 0x005A, OverworldSprite.mobileSprout, 0x07, 179, 13, 1865, 119, ActionScript.unknown024, "textBlockEF78C7", "textBlockEF6D83", 0x02, 21, Music.vsCrankyLady, 33, 27, 18, 6, 1, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x00, [BattleActions.bash, BattleActions.sowSeeds, BattleActions.psiMagnetAlpha, BattleActions.psiLifeupAlpha], BattleActions.noEffect, [0x00, EnemyID.toughMobileSprout, 0x2D, 0x17], 0x00, 2, 0x00, 0x03, ItemID.sprigOfParsley, InitialStatus.none, 0x00, 0x00, 0x03, 0x32),
	Enemy(0x01, ebString!25("Enraged Fire Plug"), Gender.neutral, EnemyType.normal, 0x003B, OverworldSprite.roboPump, 0x07, 309, 0, 4321, 346, ActionScript.unknown027, "textBlockEF78C7", "textBlockEF6D83", 0x03, 32, Music.vsCrankyLady, 60, 81, 14, 5, 4, 0x03, 0x00, 0x03, 0x01, 0x03, 0x01, 0x01, [BattleActions.sprayWaterBlast, BattleActions.bash, BattleActions.sprayWaterBlast, BattleActions.sprayWaterBlast], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x00, ItemID.suddenGutsPill, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Mystical Record"), Gender.neutral, EnemyType.normal, 0x002E, OverworldSprite.giftBox, 0x07, 263, 35, 2736, 310, ActionScript.unknown031, "textBlockEF78B8", "textBlockEF6D83", 0x02, 33, Music.vsStruttinEvilMushroom, 63, 78, 20, 12, 7, 0x00, 0x01, 0x03, 0x01, 0x03, 0x01, 0x03, [BattleActions.charge, BattleActions.bash, BattleActions.psiLifeupAlpha, BattleActions.charge], BattleActions.noEffect, [0x00, 0x00, 0x17, 0x00], 0x00, 1, 0x00, 0x01, ItemID.pizza, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Atomic Power Robot"), Gender.neutral, EnemyType.metal, 0x0069, OverworldSprite.whirlingRobo, 0x07, 594, 0, 26937, 730, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DD8", 0x02, 56, Music.vsKraken, 119, 133, 25, 8, 12, 0x03, 0x00, 0x02, 0x03, 0x02, 0x01, 0x01, [BattleActions.replenishFuel, BattleActions.fireBeam, BattleActions.replenishFuel, BattleActions.replenishFuel], BattleActions.explode, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x03, ItemID.superBomb, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Nuclear Reactor Robot"), Gender.neutral, EnemyType.metal, 0x0069, OverworldSprite.whirlingRobo, 0x07, 798, 0, 53142, 820, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DD8", 0x18, 64, Music.vsKraken, 142, 185, 46, 8, 12, 0x03, 0x01, 0x02, 0x03, 0x02, 0x01, 0x01, [BattleActions.replenishFuel, BattleActions.fireBeam, BattleActions.replenishFuel, BattleActions.replenishFuel], BattleActions.explode, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x04, ItemID.superBomb, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Guardian Hieroglyph"), Gender.neutral, EnemyType.normal, 0x0046, OverworldSprite.guardianHieroglyph, 0x07, 470, 126, 13064, 470, ActionScript.unknown021, "textBlockEF7879", "textBlockEF6D71", 0x04, 48, Music.vsCrankyLady, 94, 106, 20, 20, 38, 0x00, 0x02, 0x01, 0x01, 0x00, 0x01, 0x03, [BattleActions.cough, BattleActions.psiThunderAlpha, BattleActions.psiFlashAlpha, BattleActions.psiThunderBeta], BattleActions.noEffect, [0x00, 0x0D, 0x11, 0x0E], 0x00, 2, 0x00, 0x03, ItemID.pharaohsCurse, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Lethal Asp Hieroglyph"), Gender.neutral, EnemyType.normal, 0x0043, OverworldSprite.lethalAspHieroglyph, 0x07, 458, 0, 11321, 625, ActionScript.unknown020, "textBlockEF7879", "textBlockEF6D71", 0x04, 46, Music.vsStruttinEvilMushroom, 89, 94, 21, 5, 36, 0x02, 0x00, 0x01, 0x00, 0x00, 0x01, 0x01, [BattleActions.bitingAttack, BattleActions.bite, BattleActions.bite, BattleActions.coilAround], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.pharaohsCurse, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Electro Swoosh"), Gender.neutral, EnemyType.normal, 0x0016, OverworldSprite.electroSwoosh, 0x07, 543, 338, 17075, 791, ActionScript.unknown027, "textBlockEF789C", "textBlockEF6D71", 0x01, 62, Music.vsSpinningRobo, 140, 156, 40, 5, 10, 0x02, 0x01, 0x00, 0x01, 0x01, 0x01, 0x02, [BattleActions.greet, BattleActions.electricShock, BattleActions.electricShock, BattleActions.charge], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.suddenGutsPill, InitialStatus.none, 0x00, 0x01, 0x04, 0x32),
	Enemy(0x01, ebString!25("Conducting Menace"), Gender.male, EnemyType.normal, 0x0024, OverworldSprite.thunderMite, 0x07, 445, 238, 14792, 574, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6D71", 0x1A, 52, Music.vsSpinningRobo, 107, 107, 20, 5, 8, 0x01, 0x01, 0x03, 0x01, 0x02, 0x01, 0x00, [BattleActions.psiFlashAlpha, BattleActions.psiFlashBeta, BattleActions.psiThunderAlpha, BattleActions.psiThunderBeta], BattleActions.noEffect, [0x11, 0x12, 0x0D, 0x0E], 0x00, 2, 0x00, 0x02, ItemID.bottleOfWater, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Conducting Spirit"), Gender.male, EnemyType.normal, 0x0024, OverworldSprite.thunderMite, 0x07, 587, 329, 30390, 804, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6D71", 0x01, 59, Music.vsSpinningRobo, 130, 139, 26, 5, 8, 0x01, 0x01, 0x03, 0x01, 0x02, 0x01, 0x00, [BattleActions.psiFlashAlpha, BattleActions.psiFlashBeta, BattleActions.psiThunderBeta, BattleActions.psiThunderGamma], BattleActions.noEffect, [0x11, 0x12, 0x0E, 0x0F], 0x00, 3, 0x00, 0x00, ItemID.brainFoodLunch, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Evil Elemental"), Gender.neutral, EnemyType.normal, 0x0030, OverworldSprite.roboPump, 0x07, 564, 0, 35737, 853, ActionScript.unknown027, "textBlockEF789C", "textBlockEF6DB8", 0x0B, 57, Music.vsKraken, 121, 136, 30, 7, 16, 0x00, 0x03, 0x00, 0x03, 0x00, 0x01, 0x01, [BattleActions.bash, BattleActions.disruptSenses, BattleActions.possess, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.luxuryJerky, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("♪'s Nightmare"), Gender.neutral, EnemyType.normal, 0x004F, OverworldSprite.evilManiMani, 0x07, 1654, 882, 89004, 4442, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D83", 0x05, 71, Music.vsStarmanJr, 172, 253, 31, 1, 80, 0x01, 0x02, 0x02, 0x03, 0x01, 0x00, 0x00, [BattleActions.enemyExtender, BattleActions.psiRockinAlpha, BattleActions.gloriousLight, BattleActions.psiShieldBeta], BattleActions.noEffect, [EnemyID.yourNightmare2, 0x01, 0x00, 0x21], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.psiShield, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Annoying Old Party Man"), Gender.male, EnemyType.normal, 0x0022, OverworldSprite.annoyingOldPartyMan, 0x07, 99, 0, 130, 32, ActionScript.unknown021, "textBlockEF78AB", "textBattleTurnedBackToNormal", 0x08, 13, Music.vsRunawayDog, 20, 25, 6, 50, 15, 0x01, 0x01, 0x01, 0x01, 0x01, 0x06, 0x00, [BattleActions.bash, BattleActions.grumbleAboutYouth, BattleActions.wobble, BattleActions.reel], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x01, ItemID.proteinDrink, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Annoying Reveler"), Gender.male, EnemyType.normal, 0x0022, OverworldSprite.annoyingOldPartyMan, 0x07, 288, 0, 2373, 268, ActionScript.unknown021, "textBlockEF78AB", "textBattleTurnedBackToNormal", 0x10, 31, Music.vsCaveBoy, 58, 77, 17, 50, 15, 0x01, 0x01, 0x01, 0x01, 0x01, 0x06, 0x00, [BattleActions.grumbleAboutYouth, BattleActions.lecture, BattleActions.bash, BattleActions.wobble], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x03, ItemID.proteinDrink, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Unassuming Local Guy"), Gender.male, EnemyType.normal, 0x0023, OverworldSprite.unassumingLocalGuyEnemy, 0x07, 73, 0, 146, 19, ActionScript.unknown021, "textBlockEF78AB", "textBattleTurnedBackToNormal", 0x01, 9, Music.vsCrankyLady, 18, 13, 5, 1, 14, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.becomeFriendly], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x04, ItemID.toothbrush, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("New Age Retro Hippie"), Gender.male, EnemyType.normal, 0x006B, OverworldSprite.newAgeRetroHippieEnemy, 0x07, 87, 0, 160, 23, ActionScript.unknown021, "textBlockEF78AB", "textBattleTurnedBackToNormal", 0x01, 11, Music.vsNewAgeRetroHippie, 19, 14, 5, 10, 16, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, [BattleActions.bash, BattleActions.loseTemper, BattleActions.toothbrush, BattleActions.ruler], BattleActions.noEffect, [0x00, 0x00, 0x9A, 0x8C], 0x00, 3, 0x00, 0x03, ItemID.ruler, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Mr. Carpainter"), Gender.male, EnemyType.normal, 0x0021, OverworldSprite.mrCarpainter, 0x07, 262, 70, 1412, 195, ActionScript.unknown021, "textBattleEnemyAttacked", "textBattleTurnedBackToNormal", 0x01, 21, Music.vsStarmanJr, 33, 45, 8, 13, 72, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, [BattleActions.crashingBoomBang, BattleActions.psiLifeupAlpha, BattleActions.paintAttack, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x17, 0x00, EnemyID.mrCarpainter2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Carbon Dog"), Gender.male, EnemyType.normal, 0x0028, OverworldSprite.yourSanctuaryPointBoss, 0x07, 1672, 0, 0, 0, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x01, 70, Music.vsYourSanctuaryBoss, 159, 174, 31, 52, 53, 0x03, 0x02, 0x01, 0x02, 0x02, 0x00, 0x01, [BattleActions.spewFireball, BattleActions.enemyExtender, BattleActions.howl, BattleActions.bitingAttack], BattleActions.giveOffRainbow, [0x00, EnemyID.carbonDog2, 0x00, 0x00], EnemyID.diamondDog1, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Mighty Bear"), Gender.male, EnemyType.normal, 0x0068, OverworldSprite.mightyBear, 0x07, 167, 0, 609, 49, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x07, 16, Music.vsCrankyLady, 29, 31, 7, 1, 5, 0x01, 0x01, 0x01, 0x02, 0x01, 0x03, 0x00, [BattleActions.claw, BattleActions.bite, BattleActions.bash, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.teddyBear, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Mighty Bear Seven"), Gender.male, EnemyType.normal, 0x0068, OverworldSprite.mightyBear, 0x07, 367, 0, 8884, 440, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x15, 42, Music.vsCrankyLady, 85, 76, 11, 1, 4, 0x01, 0x01, 0x01, 0x02, 0x01, 0x03, 0x00, [BattleActions.claw, BattleActions.bite, BattleActions.bash, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x00, ItemID.superPlushBear, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Putrid Moldyman"), Gender.male, EnemyType.normal, 0x000A, OverworldSprite.stinkyGhost, 0x07, 203, 0, 830, 53, ActionScript.unknown024, "textBlockEF78B8", "textBlockEF6D71", 0x09, 21, Music.vsStruttinEvilMushroom, 36, 41, 9, 5, 17, 0x03, 0x00, 0x01, 0x02, 0x00, 0x01, 0x00, [BattleActions.moldSpores, BattleActions.bash, BattleActions.bash, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.croissant, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Thunder Mite"), Gender.neutral, EnemyType.normal, 0x001E, OverworldSprite.thunderMite, 0x07, 293, 200, 10798, 430, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DA7", 0x01, 43, Music.vsSpinningRobo, 85, 83, 20, 13, 8, 0x00, 0x00, 0x03, 0x01, 0x01, 0x01, 0x00, [BattleActions.psiThunderAlpha, BattleActions.psiThunderAlpha, BattleActions.psiThunderBeta, BattleActions.psiThunderBeta], BattleActions.noEffect, [0x0D, 0x0D, 0x0E, 0x0E], 0x00, 2, 0x00, 0x02, ItemID.bottleOfWater, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Cranky Lady"), Gender.female, EnemyType.normal, 0x0063, OverworldSprite.crankyLady, 0x07, 95, 0, 200, 17, ActionScript.unknown021, "textBlockEF78AB", "textBattleTurnedBackToNormal", 0x03, 8, Music.vsCrankyLady, 16, 18, 6, 3, 32, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, [BattleActions.bash, BattleActions.wieldShoppingBag, BattleActions.scowl, BattleActions.grin], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x01, ItemID.handbagStrap, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Extra Cranky Lady"), Gender.female, EnemyType.normal, 0x0063, OverworldSprite.crankyLady, 0x07, 277, 0, 3651, 134, ActionScript.unknown021, "textBlockEF78AB", "textBattleTurnedBackToNormal", 0x07, 27, Music.vsCrankyLady, 48, 70, 17, 5, 32, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.scowl, BattleActions.continuousAttack, BattleActions.wieldShoppingBag, BattleActions.scaryWords], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x04, ItemID.handbagStrap, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Giygas"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.whirlingRobo, 0x07, 3600, 0, 0, 0, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D71", 0x00, 73, Music.giygasAwakens, 203, 300, 52, 1, 80, 0x02, 0x02, 0x02, 0x03, 0x02, 0x00, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Wetnosaur"), Gender.neutral, EnemyType.normal, 0x000E, OverworldSprite.wetnosaur, 0x07, 1030, 0, 33098, 745, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x09, 59, Music.vsKraken, 126, 172, 17, 2, 16, 0x00, 0x01, 0x01, 0x02, 0x01, 0x03, 0x01, [BattleActions.stomp, BattleActions.swingTail, BattleActions.bite, BattleActions.loudRumble], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.luxuryJerky, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Chomposaur"), Gender.neutral, EnemyType.normal, 0x0041, OverworldSprite.chomposaur, 0x07, 1288, 320, 44378, 896, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x03, 62, Music.vsCaveBoy, 139, 183, 17, 3, 16, 0x03, 0x01, 0x01, 0x02, 0x01, 0x02, 0x00, [BattleActions.psiFireAlpha, BattleActions.psiFireBeta, BattleActions.swingTail, BattleActions.enemyExtender], BattleActions.noEffect, [0x05, 0x06, 0x00, EnemyID.chomposaur2], 0x00, 3, 0x00, 0x00, ItemID.magicFryPan, InitialStatus.shieldPower, 0x00, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Titanic Ant"), Gender.neutral, EnemyType.insect, 0x0049, OverworldSprite.yourSanctuaryPointBoss, 0x07, 235, 102, 685, 150, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x04, 13, Music.vsYourSanctuaryBoss, 19, 23, 6, 9, 72, 0x02, 0x02, 0x02, 0x01, 0x01, 0x00, 0x01, [BattleActions.enemyExtender, BattleActions.bitingAttack, BattleActions.psiDefenseDownAlpha, BattleActions.psiMagnetAlpha], BattleActions.noEffect, [EnemyID.titanicAnt2, 0x00, 0x29, 0x2D], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Gigantic Ant"), Gender.neutral, EnemyType.insect, 0x0049, OverworldSprite.giganticAnt, 0x07, 308, 81, 3980, 304, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x01, 30, Music.vsCaveBoy, 54, 112, 17, 5, 6, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.psiMagnetAlpha, BattleActions.poisonSting, BattleActions.bitingAttack, BattleActions.enemyExtender], BattleActions.noEffect, [0x2D, 0x00, 0x00, EnemyID.giganticAnt2], 0x00, 3, 0x00, 0x02, ItemID.doubleBurger, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x00, ebString!25("Shrooom!"), Gender.neutral, EnemyType.normal, 0x000B, OverworldSprite.yourSanctuaryPointBoss, 0x07, 1700, 112, 96323, 4086, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x09, 48, Music.vsYourSanctuaryBoss, 95, 154, 18, 32, 72, 0x00, 0x02, 0x01, 0x03, 0x01, 0x00, 0x02, [BattleActions.scatterSpores, BattleActions.psiLifeupAlpha, BattleActions.scatterSpores2, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x17, 0x00, EnemyID.shrooom2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Plague Rat of Doom"), Gender.male, EnemyType.normal, 0x004B, OverworldSprite.yourSanctuaryPointBoss, 0x07, 1827, 60, 115272, 4464, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x04, 47, Music.vsYourSanctuaryBoss, 71, 180, 19, 250, 45, 0x01, 0x02, 0x01, 0x02, 0x02, 0x00, 0x01, [BattleActions.poisonousBite, BattleActions.enemyExtender, BattleActions.bite, BattleActions.bash], BattleActions.noEffect, [0x00, EnemyID.plagueRatOfDoom2, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Mondo Mole"), Gender.male, EnemyType.normal, 0x0053, OverworldSprite.yourSanctuaryPointBoss, 0x07, 498, 161, 5791, 400, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x05, 23, Music.vsYourSanctuaryBoss, 37, 50, 9, 15, 36, 0x02, 0x03, 0x00, 0x00, 0x02, 0x00, 0x00, [BattleActions.psiLifeupAlpha, BattleActions.tearInto, BattleActions.bash, BattleActions.enemyExtender], BattleActions.noEffect, [0x17, 0x00, 0x00, EnemyID.mondoMole2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Guardian Digger"), Gender.male, EnemyType.normal, 0x0053, OverworldSprite.yourSanctuaryPointBoss, 0x07, 386, 110, 17301, 1467, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x15, 32, Music.vsYourSanctuaryBoss, 59, 129, 17, 21, 55, 0x01, 0x01, 0x00, 0x02, 0x02, 0x00, 0x01, [BattleActions.claw, BattleActions.enemyExtender, BattleActions.bash, BattleActions.psiShieldBeta], BattleActions.noEffect, [0x00, EnemyID.guardianDigger2, 0x00, 0x21], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.shieldPower, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Scalding Coffee Cup"), Gender.neutral, EnemyType.normal, 0x002C, OverworldSprite.giftBox, 0x07, 190, 0, 2462, 280, ActionScript.unknown031, "textBlockEF78B8", "textBlockEF6D83", 0x02, 30, Music.vsStruttinEvilMushroom, 55, 20, 23, 5, 1, 0x02, 0x00, 0x02, 0x01, 0x02, 0x01, 0x00, [BattleActions.hotEspresso, BattleActions.hotEspresso, BattleActions.hotEspresso, BattleActions.hotEspresso], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x06, ItemID.cupOfCoffee, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Loaded Dice"), Gender.neutral, EnemyType.normal, 0x003A, OverworldSprite.giftBox, 0x07, 307, 0, 10672, 703, ActionScript.unknown031, "textBlockEF78B8", "textBlockEF6D96", 0x03, 59, Music.vsCrankyLady, 146, 113, 77, 75, 6, 0x00, 0x00, 0x02, 0x00, 0x03, 0x01, 0x00, [BattleActions.callForHelp, BattleActions.callForHelp, BattleActions.callForHelp, BattleActions.callForHelp], BattleActions.noEffect, [EnemyID.careFreeBomb, EnemyID.beautifulUFO, EnemyID.highClassUFO, EnemyID.careFreeBomb], 0x00, 1, 0x00, 0x02, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x01, ebString!25("Slimy Little Pile"), Gender.neutral, EnemyType.normal, 0x005B, OverworldSprite.slimyLittlePile, 0x07, 224, 0, 1978, 124, ActionScript.unknown020, "textBlockEF789C", "textBlockEF6D71", 0x06, 24, Music.vsMasterBarf, 42, 61, 15, 7, 38, 0x01, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, [BattleActions.stinkyBreath, BattleActions.callForHelp, BattleActions.stickyMucus, BattleActions.bash], BattleActions.noEffect, [0x00, EnemyID.slimyLilPile, 0x00, 0x00], 0x00, 2, 0x01, 0x02, ItemID.bomb, InitialStatus.none, 0x00, 0x00, 0x04, 0x32),
	Enemy(0x01, ebString!25("Even Slimier Little Pile"), Gender.neutral, EnemyType.normal, 0x005B, OverworldSprite.slimyLittlePile, 0x07, 326, 0, 15075, 579, ActionScript.unknown020, "textBlockEF789C", "textBlockEF6D71", 0x0E, 49, Music.vsMasterBarf, 103, 101, 22, 9, 39, 0x01, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, [BattleActions.bash, BattleActions.callForHelp, BattleActions.stickyMucus, BattleActions.stinkyBreath], BattleActions.noEffect, [0x00, EnemyID.evenSlimierLittlePile, 0x00, 0x00], 0x00, 3, 0x00, 0x02, ItemID.multiBottleRocket, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x01, ebString!25("Arachnid!"), Gender.neutral, EnemyType.insect, 0x004D, OverworldSprite.arachnid, 0x07, 216, 0, 4933, 296, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x05, 32, Music.vsCaveBoy, 61, 30, 23, 3, 0, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.spiderSilk, BattleActions.poisonSting], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x04, ItemID.jarOfHotSauce, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Arachnid!!!"), Gender.neutral, EnemyType.insect, 0x004D, OverworldSprite.arachnid, 0x07, 344, 0, 10449, 412, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x1F, 45, Music.vsCaveBoy, 87, 86, 20, 4, 0, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x01, [BattleActions.poisonSting, BattleActions.bash, BattleActions.bash, BattleActions.spiderSilk], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.beefJerky, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x00, ebString!25("Kraken"), Gender.neutral, EnemyType.normal, 0x0029, OverworldSprite.kraken, 0x07, 1097, 176, 79267, 3049, ActionScript.unknown029, "textBlockEF7866", "textBlockEF6D71", 0x01, 54, Music.vsKraken, 105, 166, 21, 1, 32, 0x02, 0x02, 0x01, 0x01, 0x02, 0x00, 0x00, [BattleActions.fireBreath, BattleActions.emitPaleGreenLight, BattleActions.crashingBoomBang, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.kraken2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Bionic Kraken"), Gender.neutral, EnemyType.normal, 0x0029, OverworldSprite.whirlingRobo, 0x07, 900, 60, 50308, 960, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6D71", 0x18, 70, Music.vsKraken, 155, 195, 42, 1, 32, 0x02, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, [BattleActions.generateTornado, BattleActions.crashingBoomBang, BattleActions.fireBreath, BattleActions.emitPaleGreenLight], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x00, ItemID.gutsyBat, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Spinning Robo"), Gender.neutral, EnemyType.metal, 0x0034, OverworldSprite.whirlingRobo, 0x06, 113, 17, 297, 21, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DF0", 0x02, 14, Music.vsSpinningRobo, 21, 22, 7, 5, 12, 0x03, 0x00, 0x01, 0x01, 0x01, 0x03, 0x00, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.nightTimeStuffinessBeam, BattleActions.psiShieldAlpha], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x1F], 0x00, 2, 0x00, 0x01, ItemID.meteornium, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Whirling Robo"), Gender.neutral, EnemyType.metal, 0x0034, OverworldSprite.whirlingRobo, 0x07, 374, 36, 5782, 256, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DF0", 0x1C, 39, Music.vsSpinningRobo, 78, 90, 18, 5, 12, 0x03, 0x00, 0x01, 0x01, 0x01, 0x03, 0x01, [BattleActions.fireBeam, BattleActions.nightTimeStuffinessBeam, BattleActions.neutralizer, BattleActions.psiShieldAlpha], BattleActions.noEffect, [0x00, 0x00, 0xC3, 0x1F], 0x00, 2, 0x00, 0x00, ItemID.meteotite, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Hyper Spinning Robo"), Gender.neutral, EnemyType.metal, 0x0034, OverworldSprite.whirlingRobo, 0x07, 553, 83, 28866, 756, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DF0", 0x18, 56, Music.vsSpinningRobo, 122, 130, 28, 5, 12, 0x03, 0x00, 0x01, 0x01, 0x01, 0x03, 0x01, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.disruptSenses, BattleActions.psiShieldBeta], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x21], 0x00, 2, 0x00, 0x00, ItemID.meteotite, InitialStatus.none, 0x00, 0x00, 0x04, 0x32),
	Enemy(0x01, ebString!25("Cop"), Gender.male, EnemyType.normal, 0x0033, OverworldSprite.police, 0x07, 75, 0, 86, 18, ActionScript.unknown021, "textBattleEnemyAttacked", "textBattleTurnedBackToNormal", 0x02, 7, Music.vsRunawayDog, 15, 18, 5, 7, 16, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.crushingChop, BattleActions.crushingChop, BattleActions.bash, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x04, ItemID.hamburger, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x01, ebString!25("Coil Snake"), Gender.male, EnemyType.normal, 0x0019, OverworldSprite.thirstyCoilSnake, 0x07, 18, 0, 1, 4, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x01, 1, Music.vsCrankyLady, 3, 4, 2, 0, 6, 0x01, 0x00, 0x01, 0x00, 0x00, 0x01, 0x01, [BattleActions.bitingAttack, BattleActions.bitingAttack, BattleActions.bitingAttack, BattleActions.coilAround], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.cookie, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Thirsty Coil Snake"), Gender.male, EnemyType.normal, 0x0019, OverworldSprite.thirstyCoilSnake, 0x07, 270, 0, 2786, 276, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x19, 28, Music.vsCrankyLady, 52, 80, 18, 5, 7, 0x01, 0x00, 0x01, 0x00, 0x01, 0x01, 0x01, [BattleActions.poisonousBite, BattleActions.bitingAttack, BattleActions.bitingAttack, BattleActions.coilAround], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x03, ItemID.chick, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Mr. Batty"), Gender.male, EnemyType.normal, 0x0013, OverworldSprite.mrBatty, 0x07, 86, 0, 304, 30, ActionScript.unknown025, "textBlockEF78B8", "textBlockEF6D96", 0x01, 15, Music.vsCrankyLady, 25, 5, 29, 4, 3, 0x01, 0x01, 0x01, 0x00, 0x03, 0x01, 0x01, [BattleActions.bash, BattleActions.sizeUpSituation, BattleActions.becomeFriendly, BattleActions.sizeUpSituation], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x01, ItemID.jarOfHotSauce, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Elder Batty"), Gender.male, EnemyType.normal, 0x0013, OverworldSprite.mrBatty, 0x07, 294, 0, 4177, 371, ActionScript.unknown025, "textBlockEF78B8", "textBlockEF6D96", 0x1A, 35, Music.vsCrankyLady, 66, 72, 33, 8, 4, 0x01, 0x01, 0x01, 0x00, 0x03, 0x01, 0x01, [BattleActions.bash, BattleActions.sizeUpSituation, BattleActions.becomeFriendly, BattleActions.bite], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.doubleBurger, InitialStatus.none, 0x00, 0x01, 0x03, 0x00),
	Enemy(0x01, ebString!25("Violent Roach"), Gender.neutral, EnemyType.insect, 0x0050, OverworldSprite.arachnid, 0x07, 209, 0, 1757, 80, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x05, 18, Music.vsStruttinEvilMushroom, 30, 26, 35, 9, 24, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x00, [BattleActions.bash, BattleActions.knitBrow, BattleActions.ventOdor, BattleActions.leapForwardAndSpreadWings], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x00, ItemID.secretHerb, InitialStatus.none, 0x00, 0x00, 0x02, 0x00),
	Enemy(0x01, ebString!25("Filthy Attack Roach"), Gender.neutral, EnemyType.insect, 0x0050, OverworldSprite.arachnid, 0x07, 399, 0, 10543, 432, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x1D, 42, Music.vsStruttinEvilMushroom, 84, 33, 77, 9, 24, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x00, [BattleActions.bash, BattleActions.knitBrow, BattleActions.continuousAttack, BattleActions.leapForwardAndSpreadWings], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x03, ItemID.secretHerb, InitialStatus.none, 0x00, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Crazed Sign"), Gender.neutral, EnemyType.metal, 0x001A, OverworldSprite.crazedSign, 0x07, 295, 98, 3618, 244, ActionScript.unknown028, "textBlockEF78C7", "textBlockEF6D83", 0x01, 34, Music.vsStruttinEvilMushroom, 64, 96, 17, 5, 11, 0x02, 0x01, 0x03, 0x01, 0x00, 0x01, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.psiParalysisAlpha, BattleActions.psiHypnosisAlpha], BattleActions.noEffect, [0x00, 0x00, 0x2F, 0x2B], 0x00, 1, 0x00, 0x01, ItemID.bigBottleRocket, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Wooly Shambler"), Gender.neutral, EnemyType.metal, 0x000D, OverworldSprite.whirlingRobo, 0x07, 391, 140, 5397, 458, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6DA7", 0x1B, 40, Music.vsSpinningRobo, 81, 91, 18, 5, 63, 0x02, 0x01, 0x01, 0x01, 0x01, 0x02, 0x01, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.psiPSIShieldAlpha, BattleActions.psiFlashAlpha], BattleActions.noEffect, [0x00, 0x00, 0x23, 0x11], 0x00, 2, 0x00, 0x01, ItemID.multiBottleRocket, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Wild 'n Wooly Shambler"), Gender.neutral, EnemyType.metal, 0x000D, OverworldSprite.whirlingRobo, 0x07, 722, 212, 33818, 906, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6DA7", 0x09, 65, Music.vsSpinningRobo, 144, 171, 38, 5, 63, 0x02, 0x01, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.psiPSIShieldBeta, BattleActions.psiFlashBeta], BattleActions.noEffect, [0x00, 0x00, 0x25, 0x12], 0x00, 2, 0x00, 0x03, ItemID.multiBottleRocket, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Skate Punk"), Gender.male, EnemyType.normal, 0x0064, OverworldSprite.skatePunk, 0x07, 31, 0, 12, 17, ActionScript.unknown021, "textBlockEF78B8", "textBlockEF6D96", 0x07, 3, Music.vsStruttinEvilMushroom, 7, 8, 5, 0, 13, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x01, [BattleActions.shredOnSkateboard, BattleActions.bash, BattleActions.callForHelp, BattleActions.callForHelp], BattleActions.noEffect, [0x00, 0x00, EnemyID.yesManJunior, EnemyID.pogoPunk], 0x00, 3, 0x00, 0x00, ItemID.pizza, InitialStatus.none, 0x00, 0x01, 0x02, 0x00),
	Enemy(0x01, ebString!25("Skelpion"), Gender.neutral, EnemyType.insect, 0x005C, OverworldSprite.skelpion, 0x07, 137, 21, 1823, 140, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x0E, 24, Music.vsCaveBoy, 41, 23, 37, 80, 7, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x01, [BattleActions.bash, BattleActions.poisonSting, BattleActions.edgeCloser, BattleActions.psiThunderAlpha], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x0D], 0x00, 1, 0x00, 0x02, ItemID.vialOfSerum, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Dread Skelpion"), Gender.neutral, EnemyType.insect, 0x005C, OverworldSprite.skelpion, 0x07, 214, 125, 9908, 609, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x0B, 41, Music.vsCaveBoy, 82, 57, 40, 88, 8, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x01, [BattleActions.poisonSting, BattleActions.bash, BattleActions.psiThunderAlpha, BattleActions.psiThunderBeta], BattleActions.noEffect, [0x00, 0x00, 0x0D, 0x0E], 0x00, 2, 0x00, 0x04, ItemID.ketchupPacket, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Starman"), Gender.male, EnemyType.normal, 0x0037, OverworldSprite.starman, 0x07, 545, 155, 23396, 720, ActionScript.unknown026, "textBlockEF78C7", "textBlockEF6D71", 0x02, 55, Music.vsSpinningRobo, 103, 126, 24, 25, 16, 0x01, 0x01, 0x02, 0x02, 0x01, 0x01, 0x00, [BattleActions.fireBeam, BattleActions.onGuard, BattleActions.psiMagnetAlpha, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x2D, EnemyID.starman2], 0x00, 3, 0x00, 0x00, ItemID.brainFoodLunch, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Starman Super"), Gender.male, EnemyType.normal, 0x0037, OverworldSprite.starman, 0x07, 568, 310, 30145, 735, ActionScript.unknown026, "textBlockEF78C7", "textBlockEF6D71", 0x1A, 56, Music.vsSpinningRobo, 112, 129, 24, 25, 16, 0x01, 0x01, 0x02, 0x02, 0x01, 0x01, 0x00, [BattleActions.fireBeam, BattleActions.callForHelp, BattleActions.onGuard, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, EnemyID.starman1, 0x00, EnemyID.starmanSuper2], 0x00, 3, 0x00, 0x00, ItemID.swordOfKings, InitialStatus.psiShieldPower, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x01, ebString!25("Ghost of Starman"), Gender.male, EnemyType.normal, 0x0037, OverworldSprite.whirlingRobo, 0x07, 750, 462, 48695, 807, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6D71", 0x0C, 68, Music.vsSpinningRobo, 152, 170, 46, 43, 16, 0x02, 0x02, 0x02, 0x01, 0x01, 0x01, 0x02, [BattleActions.psiStarstormAlpha, BattleActions.flashSmile, BattleActions.whisper3, BattleActions.enemyExtender], BattleActions.noEffect, [0x15, 0x00, 0x00, EnemyID.ghostOfStarman2], 0x00, 3, 0x00, 0x00, ItemID.goddessRibbon, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Smilin' Sphere"), Gender.neutral, EnemyType.metal, 0x0004, OverworldSprite.smilinSphere, 0x07, 233, 60, 2218, 191, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6E03", 0x09, 27, Music.vsKraken, 50, 65, 17, 5, 13, 0x00, 0x03, 0x03, 0x01, 0x00, 0x01, 0x01, [BattleActions.bash, BattleActions.psiFireAlpha, BattleActions.bash, BattleActions.laughManiacally], BattleActions.explode, [0x00, 0x05, 0x00, 0x00], 0x00, 2, 0x00, 0x00, ItemID.meteornium, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x01, ebString!25("Uncontrollable Sphere"), Gender.neutral, EnemyType.metal, 0x0004, OverworldSprite.smilinSphere, 0x07, 577, 180, 20389, 796, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6E03", 0x11, 56, Music.vsKraken, 116, 134, 27, 5, 15, 0x00, 0x03, 0x03, 0x01, 0x00, 0x01, 0x01, [BattleActions.bash, BattleActions.psiFireAlpha, BattleActions.psiFireBeta, BattleActions.laughManiacally], BattleActions.explode, [0x00, 0x05, 0x06, 0x00], 0x00, 3, 0x00, 0x00, ItemID.brokenAntenna, InitialStatus.psiShield, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Petrified Royal Guard"), Gender.male, EnemyType.normal, 0x0057, OverworldSprite.petrifiedRoyalGuard, 0x07, 573, 0, 19163, 628, ActionScript.unknown028, "textBlockEF78B8", "textBlockEF6D83", 0x05, 53, Music.vsCaveBoy, 106, 173, 12, 5, 5, 0x01, 0x02, 0x01, 0x00, 0x01, 0x02, 0x01, [BattleActions.comeOutSwinging, BattleActions.comeOutSwinging, BattleActions.charge, BattleActions.warCry], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.suddenGutsPill, InitialStatus.none, 0x00, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Guardian General"), Gender.male, EnemyType.normal, 0x0057, OverworldSprite.petrifiedRoyalGuard, 0x07, 831, 6, 95390, 3235, ActionScript.unknown028, "textBattleEnemyAttacked", "textBlockEF6D83", 0x13, 55, Music.vsYourSanctuaryBoss, 109, 214, 21, 1, 7, 0x01, 0x02, 0x01, 0x02, 0x01, 0x00, 0x00, [BattleActions.comeOutSwinging, BattleActions.spinSomething, BattleActions.bash, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.guardianGeneral2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Starman Deluxe"), Gender.male, EnemyType.normal, 0x006A, OverworldSprite.whirlingRobo, 0x07, 1400, 418, 160524, 3827, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D71", 0x02, 65, Music.vsSpinningRobo, 143, 186, 27, 43, 21, 0x01, 0x02, 0x03, 0x02, 0x02, 0x00, 0x00, [BattleActions.enemyExtender, BattleActions.fireBeam, BattleActions.psiStarstormAlpha, BattleActions.callForHelp], BattleActions.noEffect, [EnemyID.starmanDeluxe2, 0x00, 0x15, EnemyID.starmanSuper1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.psiShieldPower, 0x01, 0x01, 0x02, 0x00),
	Enemy(0x01, ebString!25("Final Starman"), Gender.male, EnemyType.normal, 0x006A, OverworldSprite.whirlingRobo, 0x07, 840, 860, 61929, 915, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6D71", 0x10, 71, Music.vsSpinningRobo, 178, 187, 47, 25, 24, 0x02, 0x02, 0x02, 0x02, 0x01, 0x01, 0x03, [BattleActions.psiShieldBeta, BattleActions.psiBrainshockOmega, BattleActions.psiStarstormAlpha, BattleActions.enemyExtender], BattleActions.noEffect, [0x21, 0x32, 0x15, EnemyID.finalStarman2], 0x00, 3, 0x00, 0x02, ItemID.psiCaramel, InitialStatus.psiShieldPower, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Urban Zombie"), Gender.neutral, EnemyType.normal, 0x0048, OverworldSprite.urbanZombie, 0x07, 171, 0, 700, 58, ActionScript.unknown021, "textBlockEF78B8", "textBlockEF6E31", 0x04, 19, Music.vsCrankyLady, 31, 24, 10, 15, 24, 0x00, 0x03, 0x00, 0x01, 0x01, 0x01, 0x01, [BattleActions.bash, BattleActions.laughHysterically, BattleActions.coldBreath, BattleActions.somethingMysterious], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.hamburger, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x01, ebString!25("Zombie Possessor"), Gender.neutral, EnemyType.normal, 0x0032, OverworldSprite.zombiePossessor, 0x07, 176, 0, 950, 81, ActionScript.unknown027, "textBlockEF78B8", "textBlockEF6DB8", 0x02, 17, Music.vsCaveBoy, 28, 19, 30, 9, 6, 0x03, 0x00, 0x00, 0x01, 0x01, 0x03, 0x00, [BattleActions.bash, BattleActions.reachWithIcyHand, BattleActions.callForHelp, BattleActions.possess], BattleActions.noEffect, [0x00, 0x00, EnemyID.zombiePossessor, 0x00], 0x00, 2, 0x00, 0x01, ItemID.secretHerb, InitialStatus.none, 0x00, 0x00, 0x02, 0x00),
	Enemy(0x01, ebString!25("Zombie Dog"), Gender.neutral, EnemyType.normal, 0x0042, OverworldSprite.zombieDog, 0x07, 210, 0, 1354, 54, ActionScript.unknown022, "textBlockEF78B8", "textBlockEF6E31", 0x04, 22, Music.vsCrankyLady, 39, 51, 30, 10, 11, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, [BattleActions.bitingAttack, BattleActions.howl, BattleActions.bitingAttack, BattleActions.poisonousBite], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.bottleRocket, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Crooked Cop"), Gender.male, EnemyType.normal, 0x0045, OverworldSprite.crookedCop, 0x07, 140, 0, 492, 159, ActionScript.unknown021, "textBlockEF78B8", "textBlockEF6D71", 0x08, 13, Music.vsCaveBoy, 20, 24, 15, 8, 18, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.submissionHold, BattleActions.comeOutSwinging, BattleActions.onGuard, BattleActions.loseTemper], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x02, ItemID.boiledEgg, InitialStatus.none, 0x00, 0x00, 0x03, 0x00),
	Enemy(0x01, ebString!25("Over Zealous Cop"), Gender.male, EnemyType.normal, 0x0045, OverworldSprite.crookedCop, 0x07, 325, 0, 7448, 420, ActionScript.unknown021, "textBlockEF78B8", "textBattleTurnedBackToNormal", 0x0A, 36, Music.vsCaveBoy, 69, 75, 18, 7, 16, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.submissionHold, BattleActions.comeOutSwinging, BattleActions.onGuard, BattleActions.loseTemper], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x02, ItemID.doubleBurger, InitialStatus.none, 0x00, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Territorial Oak"), Gender.male, EnemyType.normal, 0x005F, OverworldSprite.territorialOak, 0x06, 145, 41, 356, 29, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D83", 0x06, 15, Music.vsCrankyLady, 26, 30, 5, 9, 4, 0x00, 0x02, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.psiBrainshockAlpha, BattleActions.vacuumAttack], BattleActions.burstIntoFlames, [0x00, 0x00, 0x31, 0x00], 0x00, 2, 0x00, 0x00, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Hostile Elder Oak"), Gender.male, EnemyType.normal, 0x005F, OverworldSprite.territorialOak, 0x07, 609, 76, 17567, 690, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D83", 0x0E, 59, Music.vsCaveBoy, 134, 146, 14, 11, 5, 0x00, 0x02, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.psiBrainshockAlpha, BattleActions.psiMagnetAlpha], BattleActions.burstIntoFlames, [0x00, 0x00, 0x31, 0x2D], 0x00, 2, 0x00, 0x04, ItemID.viper, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x00, ebString!25("Diamond Dog"), Gender.male, EnemyType.normal, 0x004C, OverworldSprite.yourSanctuaryPointBoss, 0x07, 3344, 154, 337738, 6968, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x04, 70, Music.vsSpinningRobo, 167, 230, 31, 10, 47, 0x02, 0x02, 0x03, 0x03, 0x02, 0x00, 0x00, [BattleActions.bitingAttack, BattleActions.enemyExtender, BattleActions.psiShieldBeta, BattleActions.gloriousLight], BattleActions.noEffect, [0x00, EnemyID.diamondDog2, 0x21, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.shieldPower, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Marauder Octobot"), Gender.neutral, EnemyType.metal, 0x0007, OverworldSprite.whirlingRobo, 0x07, 482, 0, 14475, 499, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6E03", 0x02, 49, Music.vsSpinningRobo, 99, 121, 23, 8, 24, 0x00, 0x02, 0x03, 0x01, 0x02, 0x01, 0x01, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.steal, BattleActions.coilAround], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Military Octobot"), Gender.neutral, EnemyType.metal, 0x0007, OverworldSprite.whirlingRobo, 0x07, 604, 0, 25607, 637, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6E03", 0x15, 61, Music.vsSpinningRobo, 138, 147, 26, 8, 18, 0x00, 0x02, 0x03, 0x01, 0x02, 0x01, 0x00, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.steal, BattleActions.coilAround], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x00, ItemID.meteotite, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Mechanical Octobot"), Gender.neutral, EnemyType.metal, 0x0007, OverworldSprite.whirlingRobo, 0x07, 768, 0, 41738, 744, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6E03", 0x0A, 66, Music.vsSpinningRobo, 147, 176, 43, 8, 24, 0x00, 0x02, 0x03, 0x01, 0x02, 0x01, 0x00, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.steal, BattleActions.electricField], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x00, ItemID.meteotite, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Ultimate Octobot"), Gender.neutral, EnemyType.metal, 0x0007, OverworldSprite.whirlingRobo, 0x07, 792, 0, 47876, 815, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6E03", 0x03, 70, Music.vsSpinningRobo, 163, 181, 44, 8, 24, 0x00, 0x02, 0x03, 0x01, 0x02, 0x01, 0x00, [BattleActions.fireBeam, BattleActions.electricField, BattleActions.steal, BattleActions.electricField], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x04, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x01, ebString!25("Mad Duck"), Gender.male, EnemyType.normal, 0x0012, OverworldSprite.madDuck, 0x07, 51, 0, 41, 12, ActionScript.unknown021, "textBlockEF78B8", "textBlockEF6D96", 0x01, 8, Music.vsRunawayDog, 12, 24, 30, 5, 1, 0x00, 0x00, 0x01, 0x01, 0x02, 0x05, 0x00, [BattleActions.disruptSenses, BattleActions.fallDown, BattleActions.spinSomething, BattleActions.peck], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x03, ItemID.freshEgg, InitialStatus.none, 0x00, 0x00, 0x04, 0x32),
	Enemy(0x01, ebString!25("Dali's Clock"), Gender.neutral, EnemyType.normal, 0x005D, OverworldSprite.dalisClock, 0x07, 296, 0, 2503, 314, ActionScript.unknown027, "textBlockEF78B8", "textBlockEF6D71", 0x06, 34, Music.vsStruttinEvilMushroom, 65, 66, 4, 5, 4, 0x01, 0x01, 0x01, 0x03, 0x00, 0x01, 0x00, [BattleActions.freezeInTime, BattleActions.freezeInTime, BattleActions.freezeInTime, BattleActions.tickTock], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x00, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Trillionage Sprout"), Gender.neutral, EnemyType.normal, 0x0058, OverworldSprite.yourSanctuaryPointBoss, 0x07, 1048, 240, 30303, 1358, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x05, 29, Music.vsYourSanctuaryBoss, 54, 88, 16, 21, 71, 0x00, 0x02, 0x01, 0x03, 0x02, 0x00, 0x01, [BattleActions.bash, BattleActions.enemyExtender, BattleActions.psiFlashAlpha, BattleActions.psiParalysisAlpha], BattleActions.noEffect, [0x00, EnemyID.trillionageSprout2, 0x11, 0x2F], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x03, 0x00),
	Enemy(0x01, ebString!25("Musica"), Gender.neutral, EnemyType.normal, 0x0008, OverworldSprite.giftBox, 0x07, 292, 0, 3748, 341, ActionScript.unknown031, "textBlockEF78B8", "textBlockEF6D83", 0x09, 35, Music.vsStruttinEvilMushroom, 69, 85, 21, 20, 8, 0x01, 0x01, 0x02, 0x01, 0x01, 0x01, 0x01, [BattleActions.electricShock, BattleActions.hauntingMelody, BattleActions.bash, BattleActions.electricShock], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x00, ItemID.suddenGutsPill, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Desert Wolf"), Gender.male, EnemyType.normal, 0x0067, OverworldSprite.runawayDog, 0x07, 247, 0, 3740, 114, ActionScript.unknown022, "textBlockEF78B8", "textBlockEF6D96", 0x07, 30, Music.vsCrankyLady, 57, 67, 33, 2, 11, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.bitingAttack, BattleActions.howl, BattleActions.bitingAttack, BattleActions.poisonousBite], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.suddenGutsPill, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x00, ebString!25("Master Belch"), Gender.male, EnemyType.normal, 0x0062, OverworldSprite.masterBelch, 0x07, 650, 0, 12509, 664, ActionScript.unknown029, "textBattleEnemyAttacked", "textBlockEF6D71", 0x06, 27, Music.vsMasterBelch, 50, 88, 16, 20, 61, 0x01, 0x01, 0x01, 0x02, 0x00, 0x00, 0x02, [BattleActions.nauseatingBurp, BattleActions.nauseatingBurp, BattleActions.callForHelp, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, EnemyID.slimyLilPile, EnemyID.masterBelch3], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x03, 0x00),
	Enemy(0x01, ebString!25("Big Pile of Puke"), Gender.neutral, EnemyType.normal, 0x0062, OverworldSprite.masterBelch, 0x07, 631, 0, 19659, 728, ActionScript.unknown029, "textBlockEF78C7", "textBlockEF6D71", 0x05, 57, Music.vsMasterBelch, 120, 158, 16, 26, 32, 0x01, 0x02, 0x01, 0x01, 0x02, 0x01, 0x01, [BattleActions.bash, BattleActions.stinkyBreath, BattleActions.stickyMucus, BattleActions.nauseatingBurp], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x01, ItemID.meteotite, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x00, ebString!25("Master Barf"), Gender.male, EnemyType.normal, 0x0062, OverworldSprite.masterBelch, 0x07, 1319, 0, 125056, 3536, ActionScript.unknown029, "textBattleEnemyAttacked", "textBlockEF6D71", 0x13, 60, Music.vsMasterBelch, 136, 177, 24, 39, 64, 0x01, 0x02, 0x01, 0x02, 0x01, 0x00, 0x00, [BattleActions.nauseatingBurp, BattleActions.continuousAttack, BattleActions.stinkyBreath, BattleActions.enemyExtender], BattleActions.masterBarfDefeat, [0x00, 0x00, 0x00, EnemyID.masterBarf2], 0x00, 3, 0x01, 0x07, ItemID.caseyBat, InitialStatus.none, 0x01, 0x00, 0x03, 0x00),
	Enemy(0x01, ebString!25("Kiss of Death"), Gender.female, EnemyType.normal, 0x0015, OverworldSprite.thunderMite, 0x07, 333, 0, 10354, 528, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6D71", 0x01, 46, Music.vsCrankyLady, 91, 100, 19, 7, 16, 0x01, 0x01, 0x02, 0x01, 0x00, 0x01, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.kissOfDeath, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.jarOfDelisauce, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("French Kiss of Death"), Gender.female, EnemyType.normal, 0x0015, OverworldSprite.frenchKissOfDeath, 0x07, 588, 0, 19210, 879, ActionScript.unknown027, "textBlockEF789C", "textBlockEF6D71", 0x12, 70, Music.vsCrankyLady, 160, 160, 30, 7, 16, 0x01, 0x01, 0x02, 0x01, 0x00, 0x01, 0x00, [BattleActions.kissOfDeath, BattleActions.kissOfDeath, BattleActions.kissOfDeath, BattleActions.kissOfDeath], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.hornOfLife, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Foppy"), Gender.neutral, EnemyType.normal, 0x0011, OverworldSprite.fobby, 0x07, 120, 10, 1311, 93, ActionScript.unknown021, "textBlockEF78C7", "textBlockEF6D71", 0x01, 16, Music.vsStruttinEvilMushroom, 29, 9, 1, 5, 3, 0x00, 0x00, 0x01, 0x00, 0x03, 0x02, 0x01, [BattleActions.bash, BattleActions.beAbsentminded, BattleActions.psiBrainshockAlpha, BattleActions.psiMagnetAlpha], BattleActions.noEffect, [0x00, 0x00, 0x31, 0x2D], 0x00, 2, 0x00, 0x01, ItemID.psiCaramel, InitialStatus.cantConcentrate, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Fobby"), Gender.neutral, EnemyType.normal, 0x0011, OverworldSprite.fobby, 0x07, 240, 19, 18348, 620, ActionScript.unknown021, "textBlockEF78C7", "textBlockEF6D71", 0x05, 48, Music.vsStruttinEvilMushroom, 98, 84, 5, 5, 3, 0x00, 0x00, 0x01, 0x00, 0x03, 0x04, 0x00, [BattleActions.bash, BattleActions.hpSucker, BattleActions.psiBrainshockAlpha, BattleActions.psiMagnetAlpha], BattleActions.noEffect, [0x00, 0x87, 0x31, 0x2D], 0x00, 3, 0x00, 0x02, ItemID.psiCaramel, InitialStatus.cantConcentrate, 0x00, 0x00, 0x04, 0x32),
	Enemy(0x01, ebString!25("Zap Eel"), Gender.neutral, EnemyType.normal, 0x0044, OverworldSprite.zapEel, 0x07, 370, 0, 12170, 611, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x04, 48, Music.vsMasterBelch, 97, 93, 29, 5, 8, 0x00, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, [BattleActions.electricShock, BattleActions.electricShock, BattleActions.electricShock, BattleActions.electricShock], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x04, 0x32),
	Enemy(0x01, ebString!25("Tangoo"), Gender.male, EnemyType.normal, 0x0052, OverworldSprite.thunderMite, 0x07, 371, 5, 14718, 572, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6D71", 0x05, 48, Music.vsStruttinEvilMushroom, 96, 99, 19, 20, 16, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, [BattleActions.bash, BattleActions.breatheThroughFlute, BattleActions.playPoisonFlute, BattleActions.breatheThroughFlute], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x04, ItemID.snake, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Boogey Tent"), Gender.neutral, EnemyType.normal, 0x0056, OverworldSprite.none, 0x07, 579, 56, 5500, 407, ActionScript.unknown000, "textBattleEnemyTrappedYou", "textBlockEF6D71", 0x05, 25, Music.vsCaveBoy, 43, 69, 10, 16, 32, 0x00, 0x03, 0x01, 0x03, 0x02, 0x00, 0x00, [BattleActions.bash, BattleActions.defenseSpray, BattleActions.spewFlyHoney, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0xA1, 0x00, EnemyID.boogeyTent2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Squatter Demon"), Gender.neutral, EnemyType.normal, 0x0056, OverworldSprite.whirlingRobo, 0x07, 774, 60, 48311, 897, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6D71", 0x1E, 69, Music.vsCaveBoy, 158, 192, 45, 25, 32, 0x00, 0x03, 0x01, 0x03, 0x02, 0x01, 0x01, [BattleActions.poisonousBite, BattleActions.diamondizingBite, BattleActions.shieldKiller, BattleActions.psiHypnosisAlpha], BattleActions.noEffect, [0x00, 0x00, 0x84, 0x2B], 0x00, 3, 0x00, 0x01, ItemID.hornOfLife, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Crested Booka"), Gender.male, EnemyType.normal, 0x000C, OverworldSprite.crestedBooka, 0x07, 265, 0, 3011, 130, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D71", 0x09, 28, Music.vsStruttinEvilMushroom, 53, 73, 17, 24, 37, 0x03, 0x01, 0x01, 0x02, 0x00, 0x04, 0x03, [BattleActions.grin, BattleActions.bash, BattleActions.warCry, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.picnicLunch, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Great Crested Booka"), Gender.male, EnemyType.normal, 0x000C, OverworldSprite.crestedBooka, 0x07, 452, 0, 16365, 604, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D71", 0x03, 49, Music.vsStruttinEvilMushroom, 100, 110, 20, 28, 40, 0x03, 0x01, 0x01, 0x02, 0x00, 0x04, 0x01, [BattleActions.bash, BattleActions.grin, BattleActions.warCry, BattleActions.charge], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.beefJerky, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Lesser Mook"), Gender.neutral, EnemyType.normal, 0x003D, OverworldSprite.whirlingRobo, 0x07, 401, 190, 7640, 467, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6D71", 0x0B, 39, Music.vsSpinningRobo, 76, 102, 17, 7, 16, 0x00, 0x03, 0x01, 0x02, 0x00, 0x01, 0x01, [BattleActions.psiFreezeAlpha, BattleActions.psiFreezeBeta, BattleActions.psiHypnosisAlpha, BattleActions.eerieGlare], BattleActions.noEffect, [0x09, 0x0A, 0x2B, 0x00], 0x00, 2, 0x00, 0x01, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Mook Senior"), Gender.neutral, EnemyType.normal, 0x003D, OverworldSprite.whirlingRobo, 0x07, 501, 700, 21056, 715, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6D71", 0x0D, 54, Music.vsSpinningRobo, 108, 122, 25, 7, 16, 0x00, 0x03, 0x01, 0x02, 0x00, 0x01, 0x01, [BattleActions.psiFreezeBeta, BattleActions.psiFireAlpha, BattleActions.psiLifeupAlpha, BattleActions.eerieGlare], BattleActions.noEffect, [0x0A, 0x05, 0x17, 0x00], 0x00, 2, 0x00, 0x02, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Smelly Ghost"), Gender.neutral, EnemyType.normal, 0x0035, OverworldSprite.stinkyGhost, 0x07, 194, 50, 606, 71, ActionScript.unknown024, "textBlockEF78B8", "textBlockEF6DB8", 0x02, 21, Music.vsStruttinEvilMushroom, 35, 89, 10, 2, 9, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x01, [BattleActions.bash, BattleActions.grin, BattleActions.psiLifeupAlpha, BattleActions.ventOdor], BattleActions.noEffect, [0x00, 0x00, 0x17, 0x00], 0x00, 2, 0x00, 0x03, ItemID.brokenIron, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Stinky Ghost"), Gender.neutral, EnemyType.normal, 0x0035, OverworldSprite.stinkyGhost, 0x07, 444, 0, 13179, 541, ActionScript.unknown024, "textBlockEF78B8", "textBlockEF6DB8", 0x0D, 46, Music.vsStruttinEvilMushroom, 90, 179, 18, 4, 7, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x01, [BattleActions.bash, BattleActions.grin, BattleActions.possess, BattleActions.ventOdor], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.largePizza, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Everdred"), Gender.male, EnemyType.normal, 0x0020, OverworldSprite.everdred, 0x07, 182, 0, 986, 171, ActionScript.unknown021, "textBattleEnemyAttacked", "textBattleTurnedBackToNormal", 0x01, 15, Music.vsStruttinEvilMushroom, 25, 35, 6, 10, 40, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.knitBrow, BattleActions.steal, BattleActions.bash, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.everdred2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Attack Slug"), Gender.neutral, EnemyType.insect, 0x002F, OverworldSprite.blackAntoid, 0x07, 30, 6, 27, 6, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x02, 5, Music.vsCrankyLady, 9, 2, 1, 0, 3, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x01, [BattleActions.bash, BattleActions.bash, BattleActions.edgeCloser, BattleActions.psiHypnosisAlpha], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x2B], 0x00, 1, 0x00, 0x00, ItemID.bomb, InitialStatus.cantConcentrate, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Pit Bull Slug"), Gender.neutral, EnemyType.insect, 0x002F, OverworldSprite.blackAntoid, 0x07, 217, 11, 9994, 543, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x03, 39, Music.vsCrankyLady, 79, 77, 2, 5, 7, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x01, [BattleActions.bash, BattleActions.bash, BattleActions.vacuumAttack, BattleActions.psiHypnosisAlpha], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x2B], 0x00, 2, 0x00, 0x05, ItemID.saltPacket, InitialStatus.cantConcentrate, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Rowdy Mouse"), Gender.male, EnemyType.normal, 0x0014, OverworldSprite.rowdyMouse, 0x07, 36, 0, 34, 9, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x01, 6, Music.vsRunawayDog, 7, 20, 5, 225, 2, 0x00, 0x00, 0x01, 0x01, 0x02, 0x03, 0x01, [BattleActions.bitingAttack, BattleActions.bitingAttack, BattleActions.bitingAttack, BattleActions.bitingAttack], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x02, ItemID.breadRoll, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Deadly Mouse"), Gender.male, EnemyType.normal, 0x0014, OverworldSprite.rowdyMouse, 0x07, 416, 0, 9225, 406, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x17, 38, Music.vsCaveBoy, 63, 98, 18, 225, 13, 0x00, 0x01, 0x01, 0x01, 0x02, 0x03, 0x00, [BattleActions.poisonousBite, BattleActions.bitingAttack, BattleActions.bitingAttack, BattleActions.bitingAttack], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.rustPromoterDX, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x01, ebString!25("Care Free Bomb"), Gender.neutral, EnemyType.metal, 0x0006, OverworldSprite.frenchKissOfDeath, 0x07, 504, 0, 14941, 641, ActionScript.unknown027, "textBlockEF789C", "textBlockEF6DD8", 0x09, 60, Music.vsCrankyLady, 135, 215, 31, 15, 8, 0x02, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, [BattleActions.bomb, BattleActions.bomb, BattleActions.bomb, BattleActions.superBomb], BattleActions.noEffect, [0x93, 0x93, 0x93, 0x94], 0x00, 2, 0x00, 0x02, ItemID.superBomb, InitialStatus.none, 0x00, 0x00, 0x04, 0x32),
	Enemy(0x00, ebString!25("Electro Specter"), Gender.male, EnemyType.normal, 0x0039, OverworldSprite.yourSanctuaryPointBoss, 0x07, 3092, 80, 261637, 6564, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x02, 67, Music.vsKraken, 148, 203, 29, 47, 56, 0x01, 0x01, 0x03, 0x03, 0x02, 0x00, 0x01, [BattleActions.electricShock, BattleActions.enemyExtender, BattleActions.electricShock, BattleActions.hungryHPSucker], BattleActions.noEffect, [0x00, EnemyID.electroSpecter2, 0x00, 0x88], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.psiShieldPower, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Handsome Tom"), Gender.male, EnemyType.normal, 0x001C, OverworldSprite.handsomeTom, 0x07, 133, 16, 520, 45, ActionScript.unknown024, "textBlockEF789C", "textBlockEF6D83", 0x03, 16, Music.vsCaveBoy, 27, 25, 11, 5, 8, 0x00, 0x02, 0x00, 0x01, 0x03, 0x02, 0x01, [BattleActions.bash, BattleActions.reel, BattleActions.psiHypnosisAlpha, BattleActions.psiBrainshockAlpha], BattleActions.noEffect, [0x00, 0x00, 0x2B, 0x31], 0x00, 2, 0x00, 0x03, ItemID.tinOfCocoa, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Smilin' Sam"), Gender.male, EnemyType.normal, 0x001C, OverworldSprite.handsomeTom, 0x07, 161, 55, 712, 48, ActionScript.unknown024, "textBlockEF789C", "textBlockEF6D83", 0x01, 20, Music.vsCaveBoy, 34, 44, 17, 16, 16, 0x00, 0x02, 0x00, 0x01, 0x01, 0x01, 0x00, [BattleActions.bash, BattleActions.reel, BattleActions.psiDefenseDownAlpha, BattleActions.psiLifeupAlpha], BattleActions.noEffect, [0x00, 0x00, 0x29, 0x17], 0x00, 2, 0x00, 0x02, ItemID.refreshingHerb, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Manly Fish"), Gender.male, EnemyType.normal, 0x001F, OverworldSprite.manlyFish, 0x07, 500, 0, 15826, 624, ActionScript.unknown021, "textBlockEF78AB", "textBlockEF6D71", 0x01, 42, Music.vsMasterBelch, 83, 114, 22, 9, 20, 0x03, 0x01, 0x01, 0x01, 0x02, 0x01, 0x01, [BattleActions.spearJab, BattleActions.spearJab, BattleActions.spearJab, BattleActions.spearJab], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.beefJerky, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Manly Fish's Brother"), Gender.male, EnemyType.normal, 0x001F, OverworldSprite.manlyFish, 0x07, 526, 210, 15970, 686, ActionScript.unknown021, "textBlockEF78AB", "textBlockEF6D71", 0x0E, 56, Music.vsYourSanctuaryBoss, 114, 123, 24, 11, 24, 0x01, 0x03, 0x02, 0x02, 0x02, 0x01, 0x00, [BattleActions.psiHypnosisAlpha, BattleActions.psiParalysisAlpha, BattleActions.psiFreezeBeta, BattleActions.psiHealingOmega], BattleActions.noEffect, [0x2B, 0x2F, 0x0A, 0x1E], 0x00, 3, 0x00, 0x00, ItemID.hornOfLife, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Runaway Dog"), Gender.male, EnemyType.normal, 0x0002, OverworldSprite.runawayDog, 0x07, 21, 0, 4, 3, ActionScript.unknown022, "textBlockEF78B8", "textBlockEF6D96", 0x09, 2, Music.vsRunawayDog, 4, 5, 26, 0, 1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, [BattleActions.howl, BattleActions.bitingAttack, BattleActions.howl, BattleActions.bitingAttack], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x02, ItemID.breadRoll, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Trick or Trick Kid"), Gender.male, EnemyType.normal, 0x001B, OverworldSprite.trickOrTrickKid, 0x07, 142, 0, 570, 47, ActionScript.unknown021, "textBlockEF78C7", "textBlockEF6D71", 0x01, 18, Music.vsCrankyLady, 30, 37, 7, 12, 12, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, [BattleActions.spitSeeds, BattleActions.spitSeeds, BattleActions.spitSeeds, BattleActions.grin], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.bomb, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Cave Boy"), Gender.male, EnemyType.normal, 0x0065, OverworldSprite.caveBoy, 0x07, 314, 0, 618, 17, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x07, 11, Music.vsCaveBoy, 21, 33, 79, 0, 80, 0x00, 0x03, 0x01, 0x03, 0x02, 0x00, 0x01, [BattleActions.shout, BattleActions.swingClub, BattleActions.shout, BattleActions.swingClub], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.doubleBurger, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Abstract Art"), Gender.neutral, EnemyType.normal, 0x000F, OverworldSprite.abstractArt, 0x07, 301, 60, 4361, 255, ActionScript.unknown027, "textBlockEF78C7", "textBlockEF6D83", 0x09, 35, Music.vsStruttinEvilMushroom, 67, 79, 19, 7, 7, 0x01, 0x01, 0x01, 0x00, 0x02, 0x02, 0x01, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.psiHypnosisAlpha], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x2B], 0x00, 1, 0x00, 0x02, ItemID.refreshingHerb, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Shattered Man"), Gender.male, EnemyType.normal, 0x0038, OverworldSprite.shatteredMan, 0x07, 694, 0, 44690, 2630, ActionScript.unknown024, "textBattleEnemyAttacked", "textBlockEF6D71", 0x12, 51, Music.vsYourSanctuaryBoss, 104, 138, 18, 25, 38, 0x02, 0x01, 0x01, 0x00, 0x01, 0x00, 0x01, [BattleActions.bash, BattleActions.lungeForward, BattleActions.hug, BattleActions.reachWithIcyHand], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x06, ItemID.mummyWrap, InitialStatus.none, 0x00, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Fierce Shattered Man"), Gender.male, EnemyType.normal, 0x0038, OverworldSprite.shatteredMan, 0x07, 516, 0, 17423, 577, ActionScript.unknown024, "textBlockEF78B8", "textBlockEF6D71", 0x02, 50, Music.vsCaveBoy, 101, 116, 12, 5, 4, 0x02, 0x01, 0x01, 0x00, 0x01, 0x02, 0x01, [BattleActions.bash, BattleActions.continuousAttack, BattleActions.hug, BattleActions.reachWithIcyHand], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x06, ItemID.mummyWrap, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Ego Orb"), Gender.neutral, EnemyType.normal, 0x0066, OverworldSprite.egoOrb, 0x07, 592, 0, 24180, 836, ActionScript.unknown030, "textBlockEF78C7", "textBlockEF6D83", 0x07, 58, Music.vsCaveBoy, 125, 140, 17, 1, 8, 0x02, 0x00, 0x02, 0x03, 0x02, 0x01, 0x00, [BattleActions.tearInto, BattleActions.lungeForward, BattleActions.bash, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x03, ItemID.skipSandwichDX, InitialStatus.none, 0x00, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Thunder and Storm"), Gender.male, EnemyType.normal, 0x0027, OverworldSprite.yourSanctuaryPointBoss, 0x07, 2065, 70, 129026, 4736, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x01, 56, Music.vsKraken, 111, 178, 21, 35, 55, 0x01, 0x01, 0x00, 0x03, 0x01, 0x00, 0x02, [BattleActions.crashingBoomBang, BattleActions.takeDeepBreath, BattleActions.intertwine, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.thunderAndStorm2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Yes Man Junior"), Gender.male, EnemyType.normal, 0x0040, OverworldSprite.skatePunk, 0x07, 33, 0, 13, 18, ActionScript.unknown021, "textBlockEF78B8", "textBlockEF6D96", 0x03, 4, Music.vsStruttinEvilMushroom, 8, 9, 4, 0, 14, 0x01, 0x01, 0x01, 0x01, 0x01, 0x03, 0x00, [BattleActions.swingHulaHoop, BattleActions.swingHulaHoop, BattleActions.bash, BattleActions.laughHysterically], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x02, ItemID.bagOfFries, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x00, ebString!25("Frankystein Mark II"), Gender.neutral, EnemyType.metal, 0x0061, OverworldSprite.none, 0x07, 91, 0, 76, 31, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6DF0", 0x06, 7, Music.vsCaveBoy, 15, 18, 4, 0, 40, 0x00, 0x00, 0x02, 0x02, 0x02, 0x00, 0x02, [BattleActions.generateSteam, BattleActions.punch, BattleActions.generateSteam, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.frankysteinMarkII2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Frank"), Gender.male, EnemyType.normal, 0x0025, OverworldSprite.frank, 0x07, 63, 0, 50, 48, ActionScript.unknown021, "textBattleEnemyAttacked", "textBlockEF6D96", 0x01, 6, Music.vsNewAgeRetroHippie, 12, 17, 7, 5, 32, 0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x00, [BattleActions.brandishKnife, BattleActions.comeOutSwinging, BattleActions.saySomethingNasty, BattleActions.brandishKnife], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Cute Li'l UFO"), Gender.neutral, EnemyType.metal, 0x0031, OverworldSprite.lilUFO, 0x07, 162, 25, 1519, 110, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DF0", 0x02, 27, Music.vsCrankyLady, 49, 32, 58, 1, 70, 0x02, 0x02, 0x02, 0x01, 0x03, 0x01, 0x00, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.psiLifeupAlpha], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x17], 0x00, 2, 0x00, 0x02, ItemID.none, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Beautiful UFO"), Gender.neutral, EnemyType.metal, 0x0031, OverworldSprite.lilUFO, 0x07, 339, 15, 8257, 426, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DF0", 0x13, 44, Music.vsSpinningRobo, 86, 87, 59, 1, 71, 0x02, 0x02, 0x02, 0x01, 0x03, 0x01, 0x00, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.psiLifeupAlpha], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x17], 0x00, 2, 0x00, 0x02, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x04, 0x32),
	Enemy(0x01, ebString!25("Pogo Punk"), Gender.male, EnemyType.normal, 0x0060, OverworldSprite.skatePunk, 0x07, 35, 0, 15, 18, ActionScript.unknown021, "textBlockEF78B8", "textBlockEF6D96", 0x06, 4, Music.vsCrankyLady, 8, 10, 3, 0, 15, 0x01, 0x01, 0x01, 0x01, 0x01, 0x04, 0x00, [BattleActions.charge, BattleActions.charge, BattleActions.bash, BattleActions.fallDown], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x07, ItemID.hamburger, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x01, ebString!25("Tough Guy"), Gender.male, EnemyType.normal, 0x0026, OverworldSprite.toughGuy, 0x07, 342, 0, 9310, 525, ActionScript.unknown021, "textBlockEF78AB", "textBlockEF6D96", 0x01, 37, Music.vsCaveBoy, 72, 92, 18, 20, 16, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.comeOutSwinging, BattleActions.comeOutSwinging, BattleActions.comeOutSwinging, BattleActions.loseTemper], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x05, ItemID.chick, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Mad Taxi"), Gender.neutral, EnemyType.metal, 0x0055, OverworldSprite.madTaxi, 0x07, 253, 0, 2336, 216, ActionScript.unknown030, "textBlockEF78B8", "textBlockEF6E03", 0x05, 28, Music.vsStruttinEvilMushroom, 53, 68, 38, 5, 8, 0x02, 0x02, 0x02, 0x00, 0x02, 0x01, 0x00, [BattleActions.revAndAccelerate, BattleActions.revAndAccelerate, BattleActions.spewExhaust, BattleActions.spewExhaust], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x00, ItemID.xterminatorSpray, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x00, ebString!25("Evil Mani-Mani"), Gender.neutral, EnemyType.normal, 0x004F, OverworldSprite.evilManiMani, 0x07, 860, 88, 28139, 1852, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D83", 0x03, 45, Music.vsStarmanJr, 86, 145, 15, 1, 80, 0x01, 0x01, 0x01, 0x03, 0x01, 0x00, 0x03, [BattleActions.psiMagnetAlpha, BattleActions.psiParalysisAlpha, BattleActions.bash, BattleActions.enemyExtender], BattleActions.noEffect, [0x2D, 0x2F, 0x00, EnemyID.evilManiMani2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Mr. Molecule"), Gender.neutral, EnemyType.normal, 0x002D, OverworldSprite.frenchKissOfDeath, 0x07, 280, 21, 8708, 659, ActionScript.unknown027, "textBlockEF789C", "textBlockEF6D96", 0x02, 56, Music.vsStruttinEvilMushroom, 118, 97, 18, 5, 4, 0x00, 0x00, 0x02, 0x00, 0x03, 0x02, 0x00, [BattleActions.psiThunderAlpha, BattleActions.psiFlashAlpha, BattleActions.psiFireAlpha, BattleActions.psiFreezeAlpha], BattleActions.noEffect, [0x0D, 0x11, 0x05, 0x09], 0x00, 2, 0x00, 0x01, ItemID.magicTart, InitialStatus.cantConcentrate, 0x00, 0x01, 0x06, 0x32),
	Enemy(0x01, ebString!25("Worthless Protoplasm"), Gender.neutral, EnemyType.normal, 0x003C, OverworldSprite.giftBox, 0x07, 38, 0, 17, 11, ActionScript.unknown031, "textBlockEF78B8", "textBlockEF6D96", 0x03, 7, Music.vsRunawayDog, 11, 21, 27, 0, 1, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x00, [BattleActions.sizeUpSituation, BattleActions.bash, BattleActions.callForHelp, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, EnemyID.worthlessProtoplasm, 0x00], 0x00, 0, 0x00, 0x05, ItemID.cookie, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Sentry Robot"), Gender.neutral, EnemyType.metal, 0x0036, OverworldSprite.sentryRobot, 0x07, 372, 0, 5034, 392, ActionScript.unknown030, "textBlockEF7866", "textBlockEF6DF0", 0x02, 39, Music.vsCrankyLady, 77, 105, 17, 10, 4, 0x02, 0x02, 0x03, 0x01, 0x01, 0x01, 0x00, [BattleActions.fireBeam, BattleActions.tickTock, BattleActions.callForHelp, BattleActions.bottleRocket], BattleActions.noEffect, [0x00, 0x00, EnemyID.sentryRobot, 0x90], 0x00, 3, 0x01, 0x01, ItemID.bigBottleRocket, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x00, ebString!25("Heavily Armed Pokey"), Gender.male, EnemyType.metal, 0x002A, OverworldSprite.pokey, 0x07, 1746, 999, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D71", 0x00, 72, Music.none, 150, 274, 51, 45, 55, 0x02, 0x02, 0x02, 0x03, 0x01, 0x00, 0x00, [BattleActions.bash, BattleActions.psiFireBeta, BattleActions.bash, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x06, 0x00, EnemyID.heavilyArmedPokey2], 0x00, 3, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Psychic Psycho"), Gender.male, EnemyType.normal, 0x001D, OverworldSprite.roboPump, 0x07, 591, 252, 30094, 682, ActionScript.unknown027, "textBlockEF789C", "textBattleTurnedBackToNormal", 0x01, 58, Music.vsCaveBoy, 124, 144, 30, 1, 24, 0x03, 0x01, 0x01, 0x02, 0x03, 0x01, 0x01, [BattleActions.psiFireAlpha, BattleActions.psiFireBeta, BattleActions.psiFireAlpha, BattleActions.psiFireBeta], BattleActions.noEffect, [0x05, 0x06, 0x05, 0x06], 0x00, 3, 0x00, 0x02, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Major Psychic Psycho"), Gender.male, EnemyType.normal, 0x001D, OverworldSprite.roboPump, 0x07, 618, 574, 39247, 862, ActionScript.unknown027, "textBlockEF789C", "textBattleTurnedBackToNormal", 0x12, 65, Music.vsCaveBoy, 145, 152, 31, 1, 24, 0x03, 0x02, 0x02, 0x03, 0x01, 0x01, 0x03, [BattleActions.psiFireBeta, BattleActions.psiPSIShieldOmega, BattleActions.psiParalysisAlpha, BattleActions.psiFireGamma], BattleActions.noEffect, [0x06, 0x26, 0x2F, 0x07], 0x00, 3, 0x00, 0x00, ItemID.starPendant, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Mole Playing Rough"), Gender.male, EnemyType.normal, 0x004E, OverworldSprite.molePlayingRough, 0x07, 103, 0, 456, 36, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x05, 14, Music.vsRunawayDog, 22, 28, 9, 2, 8, 0x01, 0x01, 0x00, 0x00, 0x02, 0x03, 0x01, [BattleActions.scratch, BattleActions.sizeUpSituation, BattleActions.beAbsentminded, BattleActions.claw], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.croissant, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x01, ebString!25("Gruff Goat"), Gender.male, EnemyType.normal, 0x005E, OverworldSprite.gruffGoat, 0x07, 45, 0, 20, 9, ActionScript.unknown022, "textBlockEF78B8", "textBlockEF6D96", 0x06, 7, Music.vsCrankyLady, 8, 23, 12, 0, 16, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x00, [BattleActions.trample, BattleActions.trample, BattleActions.trample, BattleActions.tearInto], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x04, ItemID.saltPacket, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Clumsy Robot"), Gender.neutral, EnemyType.metal, 0x0047, OverworldSprite.capsule, 0x07, 962, 0, 32378, 2081, ActionScript.unknown027, "textBlockEF7866", "textBlockEF6D83", 0x04, 46, Music.vsStarmanJr, 88, 137, 83, 30, 49, 0x02, 0x02, 0x02, 0x01, 0x02, 0x05, 0x03, [BattleActions.loseGearAndBolts, BattleActions.reapplyBandage, BattleActions.fireMissileDizzily, BattleActions.enemyExtender], BattleActions.runawayFiveEvent, [0x00, 0x00, 0x00, EnemyID.clumsyRobot2], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.psiShield, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Soul Consuming Flame"), Gender.neutral, EnemyType.normal, 0x0018, OverworldSprite.roboPump, 0x07, 602, 0, 37618, 768, ActionScript.unknown027, "textBlockEF78C7", "textBlockEF6D83", 0x01, 59, Music.vsYourSanctuaryBoss, 131, 262, 30, 14, 8, 0x03, 0x00, 0x01, 0x01, 0x02, 0x01, 0x00, [BattleActions.edgeCloser, BattleActions.fireBreath, BattleActions.spewFireball, BattleActions.fireSpray], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x01, ItemID.meteotite, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Demonic Petunia"), Gender.female, EnemyType.normal, 0x0017, OverworldSprite.demonicPetunia, 0x07, 478, 0, 15171, 724, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x01, 50, Music.vsCaveBoy, 102, 111, 26, 5, 9, 0x00, 0x03, 0x01, 0x03, 0x02, 0x01, 0x01, [BattleActions.edgeCloser, BattleActions.extinguishingBlast, BattleActions.edgeCloser, BattleActions.scatterPollen], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.spicyJerky, InitialStatus.none, 0x00, 0x01, 0x02, 0x00),
	Enemy(0x01, ebString!25("Ranboob"), Gender.male, EnemyType.normal, 0x0009, OverworldSprite.ranboob, 0x07, 232, 42, 2486, 158, ActionScript.unknown021, "textBlockEF789C", "textBlockEF6D96", 0x09, 24, Music.vsCrankyLady, 41, 63, 20, 1, 9, 0x00, 0x02, 0x01, 0x01, 0x01, 0x01, 0x03, [BattleActions.bash, BattleActions.psiShieldAlpha, BattleActions.bash, BattleActions.wonderfulPowder], BattleActions.noEffect, [0x00, 0x1F, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.picnicLunch, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Li'l UFO"), Gender.neutral, EnemyType.metal, 0x002B, OverworldSprite.lilUFO, 0x06, 82, 0, 223, 14, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DF0", 0x02, 12, Music.vsCrankyLady, 18, 17, 53, 13, 8, 0x00, 0x01, 0x02, 0x01, 0x03, 0x01, 0x01, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.nightTimeStuffinessBeam, BattleActions.fireBeam], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.skipSandwich, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x01, ebString!25("High-class UFO"), Gender.neutral, EnemyType.metal, 0x002B, OverworldSprite.lilUFO, 0x07, 433, 72, 12385, 456, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6DF0", 0x0F, 47, Music.vsSpinningRobo, 93, 103, 60, 15, 24, 0x00, 0x01, 0x02, 0x01, 0x03, 0x01, 0x01, [BattleActions.fireBeam, BattleActions.fireBeam, BattleActions.disruptSenses, BattleActions.psiPSIShieldAlpha], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x23], 0x00, 2, 0x00, 0x02, ItemID.skipSandwichDX, InitialStatus.shield, 0x00, 0x00, 0x04, 0x32),
	Enemy(0x01, ebString!25("Noose Man"), Gender.neutral, EnemyType.normal, 0x0051, OverworldSprite.nooseMan, 0x07, 231, 0, 1990, 220, ActionScript.unknown021, "textBlockEF78C7", "textBlockEF6D96", 0x05, 26, Music.vsStruttinEvilMushroom, 47, 52, 18, 5, 4, 0x00, 0x02, 0x01, 0x01, 0x03, 0x01, 0x01, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.bindingAttack], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x04, ItemID.cartonOfCream, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Robo-pump"), Gender.neutral, EnemyType.metal, 0x003E, OverworldSprite.roboPump, 0x07, 431, 0, 4797, 349, ActionScript.unknown027, "textBlockEF78C7", "textBlockEF6DD8", 0x03, 36, Music.vsStruttinEvilMushroom, 70, 113, 19, 5, 4, 0x02, 0x02, 0x02, 0x01, 0x02, 0x01, 0x02, [BattleActions.whisper3, BattleActions.murmur2, BattleActions.mutter1, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.roboPump2], 0x00, 2, 0x00, 0x01, ItemID.superBomb, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Plain Crocodile"), Gender.neutral, EnemyType.normal, 0x0054, OverworldSprite.plainCrocodile, 0x07, 234, 0, 1928, 62, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x05, 24, Music.vsCrankyLady, 40, 55, 10, 1, 5, 0x02, 0x00, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.bash, BattleActions.edgeCloser, BattleActions.bite, BattleActions.swingTail], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x00, ItemID.meteornium, InitialStatus.none, 0x00, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Strong Crocodile"), Gender.neutral, EnemyType.normal, 0x0054, OverworldSprite.plainCrocodile, 0x07, 417, 0, 10122, 495, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x15, 43, Music.vsCrankyLady, 85, 131, 17, 5, 6, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.bash, BattleActions.edgeCloser, BattleActions.bite, BattleActions.swingTail], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.superBomb, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Hard Crocodile"), Gender.neutral, EnemyType.normal, 0x0054, OverworldSprite.plainCrocodile, 0x07, 522, 0, 19484, 692, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x03, 55, Music.vsMasterBelch, 110, 128, 23, 10, 4, 0x00, 0x01, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bite, BattleActions.swingTail], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.superPlushBear, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("No Good Fly"), Gender.neutral, EnemyType.insect, 0x0059, OverworldSprite.noGoodFly, 0x07, 100, 0, 415, 26, ActionScript.unknown023, "textBlockEF78B8", "textBlockEF6D96", 0x15, 15, Music.vsStruttinEvilMushroom, 23, 13, 10, 3, 0, 0x00, 0x00, 0x01, 0x00, 0x03, 0x01, 0x01, [BattleActions.bash, BattleActions.bash, BattleActions.saySomethingNasty, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x02, ItemID.boiledEgg, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Mostly Bad Fly"), Gender.neutral, EnemyType.insect, 0x0059, OverworldSprite.noGoodFly, 0x07, 141, 0, 1116, 84, ActionScript.unknown023, "textBlockEF78B8", "textBlockEF6D96", 0x02, 19, Music.vsMasterBarf, 32, 16, 15, 4, 0, 0x00, 0x00, 0x01, 0x00, 0x02, 0x01, 0x01, [BattleActions.bash, BattleActions.bash, BattleActions.saySomethingNasty, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.pizza, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Spiteful Crow"), Gender.male, EnemyType.normal, 0x0010, OverworldSprite.spitefulCrow, 0x07, 24, 0, 3, 5, ActionScript.unknown025, "textBlockEF78B8", "textBlockEF6D96", 0x01, 27, Music.vsRunawayDog, 5, 3, 77, 0, 1, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x00, [BattleActions.peck, BattleActions.peck, BattleActions.grin, BattleActions.steal], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x07, ItemID.cookie, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("my pet"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 999, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x00, 5, Music.none, 4, 99, 10, 40, 24, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.bitingAttack, BattleActions.lungeForward, BattleActions.charge, BattleActions.bark], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x00, ebString!25("Pokey"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 999, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x00, 5, Music.none, 1, 99, 5, 1, 1, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.bePokey, BattleActions.bePokey, BattleActions.bePokey, BattleActions.bePokey], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Picky"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 999, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x00, 5, Music.none, 3, 99, 25, 10, 1, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.chantSpell], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x00, ebString!25("Tony"), Gender.neutral, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 999, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x00, 5, Music.none, 4, 99, 12, 20, 8, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.noEffectTony], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Bubble Monkey"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 999, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x00, 5, Music.none, 7, 99, 20, 5, 30, 0x01, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.scratchHead], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x00, ebString!25("Dungeon Man"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 999, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x00, 5, Music.none, 255, 99, 1, 30, 1, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.hug], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Flying Man"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 300, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6C84", 0x00, 99, Music.none, 95, 92, 100, 50, 24, 0x01, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, [BattleActions.punch, BattleActions.punch, BattleActions.charge, BattleActions.charge], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Teddy Bear"), Gender.neutral, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 100, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D2A", 0x00, 5, Music.none, 7, 20, 0, 5, 8, 0x00, 0x02, 0x01, 0x01, 0x03, 0x01, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Super Plush Bear"), Gender.neutral, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 400, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D4C", 0x00, 5, Music.none, 7, 50, 0, 5, 8, 0x00, 0x02, 0x01, 0x01, 0x03, 0x01, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x00, ebString!25("Master Belch"), Gender.male, EnemyType.normal, 0x0062, OverworldSprite.masterBelch, 0x07, 650, 0, 12509, 664, ActionScript.unknown029, "textBattleEnemyAttacked", "textBlockEF6D71", 0x06, 27, Music.vsMasterBelch, 50, 88, 16, 20, 61, 0x01, 0x01, 0x01, 0x02, 0x00, 0x00, 0x00, [BattleActions.wolfedDownFlyHoney, BattleActions.wolfedDownFlyHoney, BattleActions.wolfedDownFlyHoney, BattleActions.wolfedDownFlyHoney], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x03, 0x00),
	Enemy(0x01, ebString!25("Insane Cultist"), Gender.male, EnemyType.normal, 0x003F, OverworldSprite.insaneCultist, 0x07, 94, 0, 353, 33, ActionScript.unknown021, "textBattleEnemyTrappedYou", "textBattleTurnedBackToNormal", 0x03, 13, Music.vsCaveBoy, 19, 25, 8, 20, 64, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x01, 0x00, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x00, ebString!25("Dept. Store Spook"), Gender.male, EnemyType.normal, 0x003D, OverworldSprite.whirlingRobo, 0x07, 610, 290, 24291, 1648, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D71", 0x16, 42, Music.vsCaveBoy, 82, 135, 19, 24, 62, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, 0x03, [BattleActions.psiMagnetOmega, BattleActions.psiBrainshockAlpha, BattleActions.psiFreezeAlpha, BattleActions.enemyExtender], BattleActions.noEffect, [0x2E, 0x31, 0x09, EnemyID.deptStoreSpook1], 0x00, 0, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("♪'s Nightmare"), Gender.neutral, EnemyType.normal, 0x004F, OverworldSprite.evilManiMani, 0x07, 1654, 882, 89004, 4442, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D83", 0x05, 71, Music.vsStarmanJr, 172, 253, 31, 1, 80, 0x01, 0x02, 0x02, 0x03, 0x01, 0x00, 0x02, [BattleActions.psiRockinAlpha, BattleActions.psiLifeupBeta, BattleActions.psiRockinOmega, BattleActions.enemyExtender], BattleActions.noEffect, [0x01, 0x18, 0x04, EnemyID.yourNightmare1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Mr. Carpainter"), Gender.male, EnemyType.normal, 0x0021, OverworldSprite.mrCarpainter, 0x07, 262, 70, 1412, 195, ActionScript.unknown021, "textBattleEnemyAttacked", "textBattleTurnedBackToNormal", 0x01, 21, Music.vsStarmanJr, 33, 45, 8, 13, 72, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, [BattleActions.crashingBoomBang, BattleActions.psiPSIShieldAlpha, BattleActions.paintAttack, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x23, 0x00, EnemyID.mrCarpainter1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Carbon Dog"), Gender.male, EnemyType.normal, 0x0028, OverworldSprite.yourSanctuaryPointBoss, 0x07, 1672, 0, 0, 0, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x01, 70, Music.vsYourSanctuaryBoss, 159, 174, 31, 52, 53, 0x03, 0x02, 0x01, 0x02, 0x02, 0x00, 0x01, [BattleActions.fireSpray, BattleActions.enemyExtender, BattleActions.charge, BattleActions.howl], BattleActions.giveOffRainbow, [0x00, EnemyID.carbonDog1, 0x00, 0x00], EnemyID.diamondDog1, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Chomposaur"), Gender.neutral, EnemyType.normal, 0x000E, OverworldSprite.wetnosaur, 0x07, 1288, 320, 44378, 896, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x09, 62, Music.vsCaveBoy, 139, 183, 17, 3, 16, 0x03, 0x01, 0x01, 0x02, 0x01, 0x02, 0x01, [BattleActions.stomp, BattleActions.enemyExtender, BattleActions.psiFireBeta, BattleActions.psiFireGamma], BattleActions.noEffect, [0x00, EnemyID.chomposaur1, 0x06, 0x07], 0x00, 3, 0x00, 0x00, ItemID.magicFryPan, InitialStatus.none, 0x00, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Titanic Ant"), Gender.neutral, EnemyType.insect, 0x0049, OverworldSprite.yourSanctuaryPointBoss, 0x07, 235, 102, 685, 150, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x04, 13, Music.vsYourSanctuaryBoss, 19, 23, 6, 9, 72, 0x02, 0x02, 0x02, 0x01, 0x01, 0x00, 0x01, [BattleActions.enemyExtender, BattleActions.bitingAttack, BattleActions.bite, BattleActions.psiShieldAlpha], BattleActions.noEffect, [EnemyID.titanicAnt1, 0x00, 0x00, 0x1F], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Gigantic Ant"), Gender.neutral, EnemyType.insect, 0x0049, OverworldSprite.giganticAnt, 0x07, 308, 81, 3980, 304, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x01, 30, Music.vsCaveBoy, 54, 112, 17, 5, 6, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.psiParalysisAlpha, BattleActions.flashSmile, BattleActions.callForHelp, BattleActions.enemyExtender], BattleActions.noEffect, [0x2F, 0x00, EnemyID.giganticAnt1, EnemyID.giganticAnt1], 0x00, 3, 0x00, 0x02, ItemID.doubleBurger, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x00, ebString!25("Shrooom!"), Gender.neutral, EnemyType.normal, 0x000B, OverworldSprite.yourSanctuaryPointBoss, 0x07, 1700, 112, 96323, 4086, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x09, 48, Music.vsYourSanctuaryBoss, 95, 154, 18, 32, 72, 0x00, 0x02, 0x01, 0x03, 0x01, 0x00, 0x00, [BattleActions.scatterSpores, BattleActions.bash, BattleActions.disruptSenses, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.shrooom1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Plague Rat of Doom"), Gender.male, EnemyType.normal, 0x004B, OverworldSprite.yourSanctuaryPointBoss, 0x07, 1827, 60, 115272, 4464, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x04, 47, Music.vsYourSanctuaryBoss, 71, 180, 19, 250, 45, 0x01, 0x02, 0x01, 0x02, 0x02, 0x00, 0x00, [BattleActions.bash, BattleActions.enemyExtender, BattleActions.grin, BattleActions.bash], BattleActions.noEffect, [0x00, EnemyID.plagueRatOfDoom1, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Mondo Mole"), Gender.male, EnemyType.normal, 0x0053, OverworldSprite.yourSanctuaryPointBoss, 0x07, 498, 161, 5791, 400, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x05, 23, Music.vsYourSanctuaryBoss, 37, 50, 9, 15, 36, 0x02, 0x03, 0x00, 0x00, 0x02, 0x00, 0x00, [BattleActions.psiPSIShieldAlpha, BattleActions.psiOffenseUpAlpha, BattleActions.claw, BattleActions.enemyExtender], BattleActions.noEffect, [0x23, 0x27, 0x00, EnemyID.mondoMole1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Guardian Digger"), Gender.male, EnemyType.normal, 0x0053, OverworldSprite.yourSanctuaryPointBoss, 0x07, 386, 110, 17301, 1467, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x15, 32, Music.vsYourSanctuaryBoss, 59, 129, 17, 21, 55, 0x01, 0x01, 0x00, 0x02, 0x02, 0x00, 0x01, [BattleActions.tearInto, BattleActions.enemyExtender, BattleActions.bash, BattleActions.psiLifeupAlpha], BattleActions.noEffect, [0x00, EnemyID.guardianDigger1, 0x00, 0x17], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Kraken"), Gender.neutral, EnemyType.normal, 0x0029, OverworldSprite.kraken, 0x07, 1097, 176, 79267, 3049, ActionScript.unknown029, "textBlockEF7866", "textBlockEF6D71", 0x01, 54, Music.vsKraken, 105, 166, 21, 1, 32, 0x02, 0x02, 0x01, 0x01, 0x02, 0x00, 0x03, [BattleActions.psiFlashBeta, BattleActions.fireBreath, BattleActions.generateTornado, BattleActions.enemyExtender], BattleActions.noEffect, [0x12, 0x00, 0x00, EnemyID.kraken1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Bionic Kraken"), Gender.neutral, EnemyType.normal, 0x0029, OverworldSprite.whirlingRobo, 0x07, 900, 60, 50308, 960, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6D71", 0x18, 70, Music.vsKraken, 155, 195, 42, 1, 32, 0x02, 0x01, 0x01, 0x01, 0x02, 0x01, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x00, ItemID.gutsyBat, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Starman"), Gender.male, EnemyType.normal, 0x0037, OverworldSprite.starman, 0x07, 545, 155, 23396, 720, ActionScript.unknown026, "textBlockEF78C7", "textBlockEF6D71", 0x02, 55, Music.vsSpinningRobo, 103, 126, 24, 25, 16, 0x01, 0x01, 0x02, 0x02, 0x01, 0x01, 0x00, [BattleActions.psiShieldAlpha, BattleActions.fireBeam, BattleActions.suddenGutsPill, BattleActions.enemyExtender], BattleActions.noEffect, [0x1F, 0x00, 0x9F, EnemyID.starman1], 0x00, 3, 0x00, 0x00, ItemID.brainFoodLunch, InitialStatus.none, 0x00, 0x00, 0x02, 0x32),
	Enemy(0x01, ebString!25("Starman Super"), Gender.male, EnemyType.normal, 0x0037, OverworldSprite.starman, 0x07, 568, 310, 30145, 735, ActionScript.unknown026, "textBlockEF78C7", "textBlockEF6D71", 0x1A, 56, Music.vsSpinningRobo, 112, 129, 24, 25, 16, 0x01, 0x01, 0x02, 0x02, 0x01, 0x01, 0x00, [BattleActions.psiPSIShieldBeta, BattleActions.psiHealingOmega, BattleActions.fireBeam, BattleActions.enemyExtender], BattleActions.noEffect, [0x25, 0x1E, 0x00, EnemyID.starmanSuper1], 0x00, 3, 0x00, 0x00, ItemID.swordOfKings, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x01, ebString!25("Ghost of Starman"), Gender.male, EnemyType.normal, 0x0037, OverworldSprite.whirlingRobo, 0x07, 750, 462, 48695, 807, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6D71", 0x0C, 68, Music.vsSpinningRobo, 152, 170, 46, 43, 16, 0x02, 0x02, 0x02, 0x01, 0x01, 0x01, 0x02, [BattleActions.murmur2, BattleActions.mutter1, BattleActions.psiStarstormBeta, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x16, EnemyID.ghostOfStarman1], 0x00, 3, 0x00, 0x00, ItemID.goddessRibbon, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Starman Deluxe"), Gender.male, EnemyType.normal, 0x006A, OverworldSprite.whirlingRobo, 0x07, 1400, 418, 160524, 3827, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D71", 0x02, 65, Music.vsSpinningRobo, 143, 186, 27, 43, 21, 0x01, 0x02, 0x03, 0x02, 0x02, 0x00, 0x00, [BattleActions.enemyExtender, BattleActions.fireBeam, BattleActions.psiPSIShieldBeta, BattleActions.callForHelp], BattleActions.noEffect, [EnemyID.starmanDeluxe1, 0x00, 0x25, EnemyID.starman1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x02, 0x00),
	Enemy(0x01, ebString!25("Final Starman"), Gender.male, EnemyType.normal, 0x006A, OverworldSprite.whirlingRobo, 0x07, 840, 860, 61929, 915, ActionScript.unknown023, "textBlockEF78C7", "textBlockEF6D71", 0x10, 71, Music.vsSpinningRobo, 178, 187, 47, 25, 24, 0x02, 0x02, 0x02, 0x02, 0x01, 0x01, 0x03, [BattleActions.psiStarstormBeta, BattleActions.flashSmile, BattleActions.psiHealingOmega, BattleActions.enemyExtender], BattleActions.noEffect, [0x16, 0x00, 0x1E, EnemyID.finalStarman1], 0x00, 3, 0x00, 0x02, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Urban Zombie"), Gender.neutral, EnemyType.normal, 0x0048, OverworldSprite.urbanZombie, 0x07, 171, 0, 700, 58, ActionScript.unknown021, "textBlockEF78B8", "textBlockEF6E31", 0x04, 19, Music.vsCrankyLady, 31, 24, 10, 15, 24, 0x00, 0x03, 0x00, 0x01, 0x01, 0x01, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x02, ItemID.hamburger, InitialStatus.none, 0x00, 0x01, 0x02, 0x32),
	Enemy(0x00, ebString!25("Diamond Dog"), Gender.male, EnemyType.normal, 0x004C, OverworldSprite.yourSanctuaryPointBoss, 0x07, 3344, 154, 337738, 6968, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x04, 70, Music.vsSpinningRobo, 167, 230, 31, 10, 47, 0x02, 0x02, 0x03, 0x03, 0x02, 0x00, 0x00, [BattleActions.bite, BattleActions.enemyExtender, BattleActions.howl, BattleActions.diamondizingBite], BattleActions.noEffect, [0x00, EnemyID.diamondDog1, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Trillionage Sprout"), Gender.neutral, EnemyType.normal, 0x0058, OverworldSprite.yourSanctuaryPointBoss, 0x07, 1048, 240, 30303, 1358, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x05, 29, Music.vsYourSanctuaryBoss, 54, 88, 16, 21, 71, 0x00, 0x02, 0x01, 0x03, 0x02, 0x00, 0x00, [BattleActions.psiPSIShieldAlpha, BattleActions.bash, BattleActions.eerieGlare, BattleActions.enemyExtender], BattleActions.noEffect, [0x23, 0x00, 0x00, EnemyID.trillionageSprout1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x03, 0x00),
	Enemy(0x00, ebString!25("Master Belch"), Gender.male, EnemyType.normal, 0x0062, OverworldSprite.masterBelch, 0x07, 650, 0, 12509, 664, ActionScript.unknown029, "textBattleEnemyAttacked", "textBlockEF6D71", 0x06, 27, Music.vsMasterBelch, 50, 88, 16, 20, 61, 0x01, 0x01, 0x01, 0x02, 0x00, 0x00, 0x00, [BattleActions.nauseatingBurp, BattleActions.continuousAttack, BattleActions.callForHelp, BattleActions.edgeCloser], BattleActions.noEffect, [0x00, 0x00, EnemyID.slimyLilPile, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x03, 0x00),
	Enemy(0x01, ebString!25("Big Pile of Puke"), Gender.neutral, EnemyType.normal, 0x0062, OverworldSprite.masterBelch, 0x07, 609, 76, 17567, 690, ActionScript.unknown029, "textBlockEF78C7", "textBlockEF6D71", 0x05, 59, Music.vsMasterBelch, 134, 146, 14, 11, 5, 0x00, 0x02, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x01, ItemID.meteotite, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x00, ebString!25("Master Barf"), Gender.male, EnemyType.normal, 0x0062, OverworldSprite.masterBelch, 0x07, 1319, 0, 125056, 3536, ActionScript.unknown029, "textBattleEnemyAttacked", "textBlockEF6D71", 0x13, 60, Music.vsMasterBelch, 136, 177, 24, 39, 64, 0x01, 0x02, 0x01, 0x02, 0x01, 0x00, 0x00, [BattleActions.callForHelp, BattleActions.continuousAttack, BattleActions.nauseatingBurp, BattleActions.enemyExtender], BattleActions.masterBarfDefeat, [EnemyID.evenSlimierLittlePile, 0x00, 0x00, EnemyID.masterBarf1], 0x00, 3, 0x01, 0x07, ItemID.caseyBat, InitialStatus.none, 0x01, 0x00, 0x03, 0x00),
	Enemy(0x01, ebString!25("Loaded Dice"), Gender.neutral, EnemyType.normal, 0x003A, OverworldSprite.giftBox, 0x07, 307, 0, 10672, 703, ActionScript.unknown031, "textBlockEF78B8", "textBlockEF6D96", 0x03, 59, Music.vsCrankyLady, 146, 113, 77, 75, 6, 0x00, 0x00, 0x02, 0x00, 0x03, 0x01, 0x00, [BattleActions.callForHelp, BattleActions.callForHelp, BattleActions.callForHelp, BattleActions.callForHelp], BattleActions.noEffect, [EnemyID.electroSwoosh, EnemyID.fobby, EnemyID.uncontrollableSphere, EnemyID.electroSwoosh], 0x00, 3, 0x00, 0x02, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Tangoo"), Gender.male, EnemyType.normal, 0x0052, OverworldSprite.thunderMite, 0x07, 371, 5, 14718, 572, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6D71", 0x05, 48, Music.vsStruttinEvilMushroom, 96, 99, 19, 20, 16, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x04, ItemID.snake, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Boogey Tent"), Gender.neutral, EnemyType.normal, 0x0056, OverworldSprite.none, 0x07, 579, 56, 5500, 407, ActionScript.unknown000, "textBattleEnemyTrappedYou", "textBlockEF6D71", 0x05, 25, Music.vsCaveBoy, 43, 69, 10, 16, 32, 0x00, 0x03, 0x01, 0x03, 0x02, 0x00, 0x03, [BattleActions.emitPaleGreenLight, BattleActions.bash, BattleActions.psiFlashAlpha, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x11, EnemyID.boogeyTent1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Squatter Demon"), Gender.neutral, EnemyType.normal, 0x0056, OverworldSprite.whirlingRobo, 0x07, 774, 60, 48311, 897, ActionScript.unknown023, "textBlockEF789C", "textBlockEF6D71", 0x1E, 69, Music.vsCaveBoy, 158, 192, 45, 25, 32, 0x00, 0x03, 0x01, 0x03, 0x02, 0x01, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x01, ItemID.hornOfLife, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Everdred"), Gender.male, EnemyType.normal, 0x0020, OverworldSprite.everdred, 0x07, 182, 0, 986, 171, ActionScript.unknown021, "textBattleEnemyAttacked", "textBattleTurnedBackToNormal", 0x01, 15, Music.vsStruttinEvilMushroom, 25, 35, 6, 10, 40, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, [BattleActions.bash, BattleActions.grin, BattleActions.bitingAttack, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.everdred1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Electro Specter"), Gender.male, EnemyType.normal, 0x0039, OverworldSprite.yourSanctuaryPointBoss, 0x07, 3092, 80, 261637, 6564, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x02, 67, Music.vsKraken, 148, 203, 29, 47, 56, 0x01, 0x01, 0x03, 0x03, 0x02, 0x00, 0x03, [BattleActions.neutralizer, BattleActions.shieldKiller, BattleActions.electricShock, BattleActions.enemyExtender], BattleActions.noEffect, [0xC3, 0x84, 0x00, EnemyID.electroSpecter1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Thunder and Storm"), Gender.male, EnemyType.normal, 0x0027, OverworldSprite.yourSanctuaryPointBoss, 0x07, 2065, 70, 129026, 4736, ActionScript.unknown023, "textBattleEnemyAttacked", "textBlockEF6D96", 0x01, 56, Music.vsKraken, 111, 178, 21, 35, 55, 0x01, 0x01, 0x00, 0x03, 0x01, 0x00, 0x03, [BattleActions.summonStorm, BattleActions.bash, BattleActions.crashingBoomBang, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.thunderAndStorm1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Frankystein Mark II"), Gender.neutral, EnemyType.metal, 0x0061, OverworldSprite.none, 0x07, 91, 0, 76, 31, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6DF0", 0x06, 7, Music.vsCaveBoy, 15, 18, 4, 0, 40, 0x00, 0x00, 0x02, 0x02, 0x02, 0x00, 0x03, [BattleActions.tearInto, BattleActions.punch, BattleActions.generateSteam, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.frankysteinMarkII1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Evil Mani-Mani"), Gender.neutral, EnemyType.normal, 0x004F, OverworldSprite.evilManiMani, 0x07, 860, 88, 28139, 1852, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D83", 0x03, 45, Music.vsStarmanJr, 86, 145, 15, 1, 80, 0x01, 0x01, 0x01, 0x03, 0x01, 0x00, 0x03, [BattleActions.emitPaleGreenLight, BattleActions.bash, BattleActions.gloriousLight, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.evilManiMani1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Heavily Armed Pokey"), Gender.male, EnemyType.metal, 0x002A, OverworldSprite.pokey, 0x07, 1746, 999, 0, 0, ActionScript.unknown021, "textBattleEnemyAttacked", "textBlockEF6D71", 0x01, 72, Music.none, 150, 274, 51, 45, 55, 0x02, 0x02, 0x02, 0x03, 0x01, 0x00, 0x02, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.heavilyArmedPokey1], 0x00, 3, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Clumsy Robot"), Gender.neutral, EnemyType.metal, 0x0047, OverworldSprite.capsule, 0x07, 962, 0, 32378, 2081, ActionScript.unknown027, "textBlockEF7866", "textBlockEF6D83", 0x04, 46, Music.vsStarmanJr, 88, 137, 83, 30, 49, 0x02, 0x02, 0x02, 0x01, 0x02, 0x05, 0x02, [BattleActions.clumsyBeam, BattleActions.cleanArea, BattleActions.eatBolognaSandwich, BattleActions.enemyExtender], BattleActions.runawayFiveEvent, [0x00, 0x00, 0x00, EnemyID.clumsyRobot3], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Robo-pump"), Gender.neutral, EnemyType.metal, 0x003E, OverworldSprite.roboPump, 0x07, 431, 0, 4797, 349, ActionScript.unknown027, "textBlockEF78C7", "textBlockEF6DD8", 0x03, 36, Music.vsStruttinEvilMushroom, 70, 113, 19, 5, 4, 0x02, 0x02, 0x02, 0x01, 0x02, 0x01, 0x02, [BattleActions.bomb, BattleActions.replenishFuel, BattleActions.tickTock, BattleActions.enemyExtender], BattleActions.noEffect, [0x93, 0x00, 0x00, EnemyID.roboPump1], 0x00, 2, 0x00, 0x01, ItemID.superBomb, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Foppy"), Gender.neutral, EnemyType.normal, 0x0011, OverworldSprite.fobby, 0x07, 120, 10, 1311, 93, ActionScript.unknown021, "textBlockEF78C7", "textBlockEF6D71", 0x01, 16, Music.vsStruttinEvilMushroom, 29, 9, 1, 5, 3, 0x00, 0x00, 0x01, 0x00, 0x03, 0x02, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x01, ItemID.psiCaramel, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x00, ebString!25("Guardian General"), Gender.male, EnemyType.normal, 0x0057, OverworldSprite.petrifiedRoyalGuard, 0x07, 831, 6, 95390, 3235, ActionScript.unknown028, "textBattleEnemyAttacked", "textBlockEF6D83", 0x13, 55, Music.vsYourSanctuaryBoss, 109, 214, 21, 1, 7, 0x01, 0x02, 0x01, 0x02, 0x01, 0x00, 0x00, [BattleActions.bash, BattleActions.charge, BattleActions.warCry, BattleActions.enemyExtender], BattleActions.noEffect, [0x00, 0x00, 0x00, EnemyID.guardianGeneral1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Black Antoid"), Gender.neutral, EnemyType.insect, 0x0001, OverworldSprite.blackAntoid, 0x07, 34, 25, 37, 7, ActionScript.unknown020, "textBlockEF78B8", "textBlockEF6D96", 0x08, 7, Music.vsCrankyLady, 14, 13, 4, 3, 0, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x03, [BattleActions.psiLifeupAlpha, BattleActions.psiLifeupAlpha, BattleActions.psiLifeupAlpha, BattleActions.psiLifeupAlpha], BattleActions.noEffect, [0x17, 0x17, 0x17, 0x17], 0x00, 1, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x01, 0x03, 0x32),
	Enemy(0x01, ebString!25("Struttin' Evil Mushroom"), Gender.neutral, EnemyType.normal, 0x0005, OverworldSprite.ramblinEvilMushroom, 0x07, 60, 0, 95, 15, ActionScript.unknown024, "textBlockEF789C", "textBlockEF6D83", 0x09, 7, Music.vsStruttinEvilMushroom, 15, 10, 5, 5, 1, 0x00, 0x00, 0x01, 0x01, 0x03, 0x02, 0x00, [BattleActions.beAbsentminded, BattleActions.bash, BattleActions.bash, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x06, ItemID.cookie, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Runaway Dog"), Gender.male, EnemyType.normal, 0x0002, OverworldSprite.runawayDog, 0x07, 21, 0, 4, 3, ActionScript.unknown022, "textBlockEF78B8", "textBlockEF6D96", 0x09, 73, Music.vsRunawayDog, 4, 5, 26, 0, 1, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, [BattleActions.howl, BattleActions.bitingAttack, BattleActions.bitingAttack, BattleActions.bite], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 1, 0x00, 0x06, ItemID.breadRoll, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Cave Boy"), Gender.male, EnemyType.normal, 0x0065, OverworldSprite.caveBoy, 0x07, 314, 0, 618, 17, ActionScript.unknown029, "textBlockEF78B8", "textBlockEF6D96", 0x07, 11, Music.vsCaveBoy, 21, 33, 5, 0, 80, 0x00, 0x03, 0x01, 0x03, 0x02, 0x08, 0x00, [BattleActions.bash, BattleActions.bash, BattleActions.bash, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x07, ItemID.picnicLunch, InitialStatus.none, 0x00, 0x01, 0x00, 0x32),
	Enemy(0x01, ebString!25("Tiny Li'l Ghost"), Gender.neutral, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 90, 0, 1, 162, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6DB8", 0x00, 18, Music.vsRunawayDog, 19, 7, 100, 25, 24, 0x01, 0x01, 0x00, 0x01, 0x00, 0x04, 0x00, [BattleActions.reachWithIcyHand, BattleActions.reachWithIcyHand, BattleActions.bash, BattleActions.bash], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Starman Junior"), Gender.male, EnemyType.normal, 0x0037, OverworldSprite.starman, 0x07, 200, 999, 16, 20, ActionScript.unknown026, "textBlockEF7866", "textBlockEF6D71", 0x02, 6, Music.vsStarmanJr, 11, 10, 1, 0, 80, 0x03, 0x03, 0x03, 0x03, 0x02, 0x00, 0x01, [BattleActions.psiFireBeta, BattleActions.onGuard, BattleActions.psiFreezeAlpha, BattleActions.psiFireAlpha], BattleActions.noEffect, [0x06, 0x00, 0x09, 0x05], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Buzz Buzz"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 2000, 999, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x00, 20, Music.none, 40, 92, 100, 1, 80, 0x03, 0x03, 0x03, 0x03, 0x02, 0x00, 0x03, [BattleActions.psiPSIShieldSigma, BattleActions.psiPSIShieldSigma, BattleActions.charge, BattleActions.bash], BattleActions.noEffect, [0x24, 0x24, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x00, ebString!25("Heavily Armed Pokey"), Gender.male, EnemyType.metal, 0x002A, OverworldSprite.pokey, 0x07, 2000, 999, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x04, 80, Music.pokeyMeansBusiness, 145, 255, 60, 5, 255, 0x02, 0x02, 0x03, 0x01, 0x03, 0x01, 0x03, [BattleActions.dischargeStinkyGas, BattleActions.dischargeStinkyGas, BattleActions.charge, BattleActions.tearInto], BattleActions.pokeySpeech1, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x00, ebString!25("Heavily Armed Pokey"), Gender.male, EnemyType.metal, 0x002A, OverworldSprite.pokey, 0x07, 1746, 999, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textNoMessage", 0x04, 72, Music.giygasAwakens, 150, 274, 51, 45, 55, 0x02, 0x02, 0x02, 0x03, 0x01, 0x00, 0x00, [BattleActions.dischargeStinkyGas, BattleActions.pokeyAttack, BattleActions.charge, BattleActions.tearInto], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x5F),
	Enemy(0x00, ebString!25("Giygas"), Gender.male, EnemyType.metal, 0x006C, OverworldSprite.none, 0x07, 9999, 999, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D71", 0x14, 80, Music.pokeyMeansBusiness, 255, 255, 80, 5, 255, 0x02, 0x02, 0x03, 0x03, 0x03, 0x00, 0x01, [BattleActions.psiRockinAlpha, BattleActions.psiRockinBeta, BattleActions.psiRockinAlpha, BattleActions.psiRockinBeta], BattleActions.noEffect, [0x01, 0x02, 0x01, 0x02], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Giygas"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 9999, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D71", 0x00, 80, Music.giygasAwakens, 255, 255, 80, 5, 255, 0x02, 0x02, 0x03, 0x03, 0x03, 0x00, 0x02, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.giygasAttack], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Giygas"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 2000, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D71", 0x00, 80, Music.giygasAwakens, 255, 255, 80, 5, 255, 0x02, 0x02, 0x03, 0x03, 0x03, 0x00, 0x00, [BattleActions.incomprehensibleAttackThunderBeta, BattleActions.incomprehensibleAttackFreezeAlpha, BattleActions.incomprehensibleAttackFlashGamma, BattleActions.sayPlayerName], BattleActions.pokeySpeech2, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Giygas"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 9999, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D71", 0x00, 80, Music.giygasPhase2, 255, 255, 80, 5, 255, 0x02, 0x02, 0x03, 0x03, 0x03, 0x00, 0x00, [BattleActions.incomprehensibleAttackThunderBetaVulnerable, BattleActions.incomprehensibleAttackFreezeAlphaVulnerable, BattleActions.incomprehensibleAttackFlashGammaVulnerable, BattleActions.randomGiygasQuote], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x01, ebString!25("Farm Zombie"), Gender.neutral, EnemyType.normal, 0x0048, OverworldSprite.urbanZombie, 0x07, 171, 0, 700, 58, ActionScript.unknown021, "textBlockEF78B8", "textBlockEF6E31", 0x0A, 19, Music.vsRunawayDog, 31, 24, 10, 15, 24, 0x00, 0x03, 0x00, 0x01, 0x01, 0x01, 0x01, [BattleActions.bash, BattleActions.laughHysterically, BattleActions.coldBreath, BattleActions.somethingMysterious], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 2, 0x00, 0x03, ItemID.skipSandwich, InitialStatus.none, 0x00, 0x01, 0x02, 0x00),
	Enemy(0x01, ebString!25("Criminal Caterpillar"), Gender.neutral, EnemyType.insect, 0x006D, OverworldSprite.criminalCaterpillar, 0x07, 250, 168, 30384, 0, ActionScript.unknown027, "textBlockEF78B8", "textBlockEF6D96", 0x01, 23, Music.vsRunawayDog, 37, 16, 134, 0, 0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, [BattleActions.psiFireAlpha, BattleActions.psiFireAlpha, BattleActions.psiFireAlpha, BattleActions.psiFireAlpha], BattleActions.noEffect, [0x05, 0x05, 0x05, 0x05], 0x00, 1, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x0A),
	Enemy(0x01, ebString!25("Evil Eye"), Gender.neutral, EnemyType.normal, 0x006E, OverworldSprite.whirlingRobo, 0x07, 720, 400, 46376, 896, ActionScript.unknown023, "textBlockEF78B8", "textBlockEF6D96", 0x02, 63, Music.vsCrankyLady, 141, 162, 38, 25, 16, 0x03, 0x00, 0x03, 0x02, 0x01, 0x00, 0x01, [BattleActions.psiBrainshockOmega, BattleActions.eerieGlare, BattleActions.psiParalysisOmega, BattleActions.bash], BattleActions.noEffect, [0x32, 0x00, 0x30, 0x00], 0x00, 1, 0x00, 0x03, ItemID.meteotite, InitialStatus.none, 0x00, 0x00, 0x00, 0x14),
	Enemy(0x01, ebString!25("Magic Butterfly"), Gender.female, EnemyType.insect, 0x0000, OverworldSprite.magicButterfly, 0x06, 16, 0, 1, 0, ActionScript.unknown032, "textBattleEnemyAttacked", "textNoMessage", 0x00, 0, Music.none, 2, 2, 25, 0, 0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, [BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect, BattleActions.noEffect], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 0, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x00),
	Enemy(0x01, ebString!25("Mini Barf"), Gender.neutral, EnemyType.normal, 0x005B, OverworldSprite.slimyLittlePile, 0x07, 616, 0, 7521, 460, ActionScript.unknown020, "textBattleEnemyAttacked", "textBlockEF6D71", 0x13, 26, Music.vsMasterBelch, 45, 71, 10, 19, 30, 0x00, 0x03, 0x01, 0x03, 0x02, 0x00, 0x01, [BattleActions.stinkyBreath, BattleActions.bash, BattleActions.ventOdor, BattleActions.stickyMucus], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x32),
	Enemy(0x01, ebString!25("Master Criminal Worm"), Gender.neutral, EnemyType.insect, 0x006D, OverworldSprite.masterCriminalWorm, 0x07, 377, 300, 82570, 0, ActionScript.unknown027, "textBlockEF78B8", "textBlockEF6D96", 0x10, 37, Music.vsRunawayDog, 73, 40, 136, 0, 0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, [BattleActions.psiFireBeta, BattleActions.psiFireAlpha, BattleActions.psiFireAlpha, BattleActions.psiFireAlpha], BattleActions.noEffect, [0x06, 0x05, 0x05, 0x05], 0x00, 1, 0x00, 0x00, ItemID.none, InitialStatus.none, 0x00, 0x00, 0x00, 0x0A),
	Enemy(0x00, ebString!25("Captain Strong"), Gender.male, EnemyType.normal, 0x0045, OverworldSprite.crookedCop, 0x07, 140, 0, 492, 159, ActionScript.unknown021, "textBattleEnemyAttacked", "textBlockEF6D71", 0x08, 13, Music.vsCaveBoy, 20, 24, 15, 8, 18, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x00, [BattleActions.submissionHold, BattleActions.comeOutSwinging, BattleActions.onGuard, BattleActions.loseTemper], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x02, ItemID.boiledEgg, InitialStatus.none, 0x00, 0x00, 0x03, 0x00),
	Enemy(0x00, ebString!25("Giygas"), Gender.male, EnemyType.normal, 0x0000, OverworldSprite.none, 0x07, 9999, 0, 0, 0, ActionScript.unknown000, "textBattleEnemyAttacked", "textBlockEF6D71", 0x00, 80, Music.giygasPhase2, 255, 127, 80, 5, 255, 0x02, 0x02, 0x03, 0x03, 0x03, 0x01, 0x00, [BattleActions.incomprehensibleAttackThunderBetaUnstable, BattleActions.incomprehensibleAttackFreezeAlphaUnstable, BattleActions.incomprehensibleAttackFlashGammaUnstable, BattleActions.randomGiygasQuoteTimes3], BattleActions.noEffect, [0x00, 0x00, 0x00, 0x00], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
	Enemy(0x00, ebString!25("Clumsy Robot"), Gender.neutral, EnemyType.metal, 0x0047, OverworldSprite.capsule, 0x07, 962, 0, 32378, 2081, ActionScript.unknown027, "textBlockEF7866", "textBlockEF6D83", 0x04, 46, Music.vsStarmanJr, 88, 137, 83, 30, 49, 0x02, 0x02, 0x02, 0x01, 0x02, 0x05, 0x03, [BattleActions.reel, BattleActions.wobble, BattleActions.wantBattery, BattleActions.enemyExtender], BattleActions.runawayFiveEvent, [0x00, 0x00, 0x00, EnemyID.clumsyRobot1], 0x00, 3, 0x01, 0x00, ItemID.none, InitialStatus.none, 0x01, 0x01, 0x00, 0x00),
];

/// $D5EBAB
immutable StatsGrowth[4] statsGrowthVars = [
	StatsGrowth(18, 5, 4, 7, 5, 5, 6),
	StatsGrowth(12, 3, 8, 5, 2, 7, 5),
	StatsGrowth(10, 6, 5, 5, 3, 9, 4),
	StatsGrowth(21, 18, 7, 3, 4, 4, 3),
];

/// $D5EBAB
immutable TeleportDestination[234] teleportDestinationTable = [
	TeleportDestination(0x0000, 0x0000, CCDirection.undefined, WarpStyle.instantPlusFade, 0x0000),
	TeleportDestination(0x0388, 0x03E9, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02C8, 0x035B, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02AC, 0x02A5, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02E4, 0x032D, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02F8, 0x032D, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02F8, 0x030D, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0329, 0x032A, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x038C, 0x026D, CCDirection.down, WarpStyle.moonside11, 0x0000),
	TeleportDestination(0x02AC, 0x0228, CCDirection.up, WarpStyle.moonside10, 0x0000),
	TeleportDestination(0x03F9, 0x0089, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03E9, 0x00CB, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00D3, 0x020A, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03AC, 0x036D, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03C8, 0x049C, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0232, 0x049B, CCDirection.right, WarpStyle.ghostTunnel2, 0x0000),
	TeleportDestination(0x032E, 0x049B, CCDirection.left, WarpStyle.ghostTunnel, 0x0000),
	TeleportDestination(0x03A9, 0x049B, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x009F, 0x0442, CCDirection.left, WarpStyle.ghostTunnel, 0x0000),
	TeleportDestination(0x0388, 0x03CC, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01B0, 0x0210, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02EC, 0x009A, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0037, 0x0023, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02EC, 0x022D, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03D3, 0x021D, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0149, 0x0032, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x003B, 0x0357, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x023A, 0x01C2, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02BB, 0x047A, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00BB, 0x0335, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x003C, 0x0127, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x028A, 0x015F, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00A9, 0x0224, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0166, 0x0183, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x034A, 0x03EC, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0308, 0x0091, CCDirection.up, WarpStyle.standardDoorWhiteSlow, 0x0000),
	TeleportDestination(0x00EF, 0x044A, CCDirection.left, WarpStyle.standardDoorWithSound, 0x0000),
	TeleportDestination(0x02A2, 0x025D, CCDirection.right, WarpStyle.standardDoorWithUnknownSound, 0x0000),
	TeleportDestination(0x02E5, 0x010A, CCDirection.right, WarpStyle.standardDoorWithSound2, 0x0000),
	TeleportDestination(0x03AB, 0x00CC, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02B4, 0x01EA, CCDirection.down, WarpStyle.standardDoorWhiteSlowSound, 0x0000),
	TeleportDestination(0x0329, 0x025A, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03E5, 0x0355, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03C7, 0x010D, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03EF, 0x00ED, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0204, 0x02EA, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x038A, 0x00D9, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0059, 0x024E, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x032A, 0x03EB, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02AC, 0x0394, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x030C, 0x04BB, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0358, 0x040D, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0315, 0x022A, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03B3, 0x03EA, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0123, 0x014A, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0218, 0x0058, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x024F, 0x0022, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0051, 0x0083, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01ED, 0x0337, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0166, 0x0181, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02E6, 0x04FC, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x009C, 0x0441, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03D9, 0x04F9, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0235, 0x049B, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03C4, 0x006D, CCDirection.right, WarpStyle.standardDoorWithUnknownSound, 0x0000),
	TeleportDestination(0x03FE, 0x03AD, CCDirection.left, WarpStyle.standardDoorWithSound2, 0x0000),
	TeleportDestination(0x0388, 0x00EB, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03FD, 0x000D, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03BA, 0x001B, CCDirection.left, WarpStyle.standardDoorWithSound2, 0x0000),
	TeleportDestination(0x032B, 0x0499, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0226, 0x04FC, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0359, 0x0009, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0036, 0x04E6, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0209, 0x04E3, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03C8, 0x043C, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0315, 0x01A9, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x011C, 0x027E, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x034E, 0x04EA, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0278, 0x018A, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0358, 0x040C, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x024C, 0x0342, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0190, 0x008E, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x03B9, 0x0256, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0233, 0x0073, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0274, 0x0026, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0134, 0x027E, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0130, 0x037F, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02C2, 0x026B, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0372, 0x002B, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0015, 0x0409, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00C3, 0x01CB, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00B0, 0x02C4, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02B7, 0x0351, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x004A, 0x0365, CCDirection.down, WarpStyle.phaseDistorterIII, 0x007F),
	TeleportDestination(0x02AE, 0x0026, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02F8, 0x0429, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x028C, 0x0439, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x028C, 0x0416, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02BC, 0x046C, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03A9, 0x049B, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0184, 0x02A9, CCDirection.down, WarpStyle.standardDoor, 0x0079),
	TeleportDestination(0x0286, 0x0171, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03A5, 0x036D, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01B1, 0x0203, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02EB, 0x0023, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01D5, 0x03F7, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x038F, 0x01F3, CCDirection.left, WarpStyle.moonside1, 0x0000),
	TeleportDestination(0x0385, 0x01FE, CCDirection.right, WarpStyle.moonside2, 0x0000),
	TeleportDestination(0x03C7, 0x023C, CCDirection.down, WarpStyle.moonside3, 0x0000),
	TeleportDestination(0x03C7, 0x023C, CCDirection.down, WarpStyle.moonside4, 0x0000),
	TeleportDestination(0x03C7, 0x023C, CCDirection.down, WarpStyle.moonside5, 0x0000),
	TeleportDestination(0x03B5, 0x01F3, CCDirection.left, WarpStyle.moonside6, 0x0000),
	TeleportDestination(0x03A2, 0x025D, CCDirection.right, WarpStyle.moonside7, 0x0000),
	TeleportDestination(0x03DA, 0x0257, CCDirection.left, WarpStyle.moonside8, 0x0000),
	TeleportDestination(0x03A6, 0x023A, CCDirection.right, WarpStyle.moonside9, 0x0000),
	TeleportDestination(0x0112, 0x0015, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0125, 0x002E, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00FC, 0x00D8, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x034C, 0x043A, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03B0, 0x00F5, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x036F, 0x04CD, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03B7, 0x03B8, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03D6, 0x048A, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03B1, 0x013D, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x002A, 0x01A9, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03E8, 0x0164, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x025A, 0x02AA, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x023B, 0x04E3, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0236, 0x026D, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02E4, 0x02ED, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02CA, 0x02A9, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02F1, 0x042C, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02D0, 0x017A, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0266, 0x0205, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x025A, 0x02AA, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0057, 0x01A3, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03D1, 0x02FD, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0392, 0x016C, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03E6, 0x036D, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00E0, 0x0276, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0209, 0x0015, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x018F, 0x0011, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01A2, 0x031D, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0037, 0x03BA, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00D3, 0x04BF, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02C1, 0x002B, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0356, 0x03CC, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03D3, 0x03DA, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03B9, 0x00BD, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0366, 0x005D, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00FA, 0x00B2, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x014D, 0x006F, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03B0, 0x002B, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x032E, 0x0267, CCDirection.down, WarpStyle.standardDoorWhiteSlow, 0x0071),
	TeleportDestination(0x025E, 0x0274, CCDirection.left, WarpStyle.standardDoorWhiteSlow, 0x007F),
	TeleportDestination(0x02B2, 0x0337, CCDirection.down, WarpStyle.standardDoorWithSound2, 0x007F),
	TeleportDestination(0x02B2, 0x0337, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02B0, 0x0330, CCDirection.down, WarpStyle.standardDoor, 0x9C7F),
	TeleportDestination(0x0302, 0x04C9, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0239, 0x0072, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02A4, 0x04B9, CCDirection.up, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x02EE, 0x022B, CCDirection.down, WarpStyle.standardDoorWhiteSlow, 0x007F),
	TeleportDestination(0x0328, 0x032D, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x00A8, 0x0270, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00BA, 0x02C8, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02EE, 0x02EB, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00D8, 0x02AE, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x003E, 0x047A, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x014F, 0x01F4, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01B4, 0x0210, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x022B, 0x029A, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02F9, 0x03B6, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02FD, 0x037D, CCDirection.up, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00C7, 0x00CA, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03AC, 0x0161, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02CD, 0x0431, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02FA, 0x03AE, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02CB, 0x04E2, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01A5, 0x02F1, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00F6, 0x037D, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x009A, 0x0206, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0150, 0x01C5, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x025F, 0x0159, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x008A, 0x0027, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03E7, 0x0141, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01D2, 0x03DC, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0029, 0x025A, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0111, 0x0111, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x016F, 0x0111, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01BB, 0x0205, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0112, 0x0205, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x021C, 0x0492, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x00B6, 0x0490, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x033E, 0x047B, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02E8, 0x042D, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03AA, 0x0182, CCDirection.down, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03F7, 0x008A, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0184, 0x0402, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0061, 0x029A, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x01BE, 0x0307, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0044, 0x022F, CCDirection.up, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x003E, 0x012F, CCDirection.up, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x0255, 0x021F, CCDirection.up, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x023D, 0x01D4, CCDirection.up, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x02B4, 0x0463, CCDirection.left, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02CB, 0x0433, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0143, 0x03C3, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0307, 0x000C, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0236, 0x04E6, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02C6, 0x01AC, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02C6, 0x04E3, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x03F6, 0x0439, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0185, 0x03C1, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x02B5, 0x04F9, CCDirection.right, WarpStyle.standardDoor, 0x007F),
	TeleportDestination(0x0036, 0x04AE, CCDirection.right, WarpStyle.standardDoorWhiteSlowSound, 0x0000),
	TeleportDestination(0x0019, 0x02F6, CCDirection.down, WarpStyle.standardDoorWhite, 0x0000),
	TeleportDestination(0x0030, 0x03B9, CCDirection.down, WarpStyle.standardDoorWhite, 0x0000),
	TeleportDestination(0x03D0, 0x0166, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x03D2, 0x0166, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x03B0, 0x0039, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x00DA, 0x008E, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x00C8, 0x044A, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x02A5, 0x0158, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x0107, 0x0374, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x03DD, 0x0182, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x0180, 0x0080, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x022C, 0x01B3, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x03B0, 0x0039, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x00D9, 0x0091, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x002E, 0x03B9, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x034C, 0x0431, CCDirection.down, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x0037, 0x002A, CCDirection.right, WarpStyle.standardDoor, 0x0000),
	TeleportDestination(0x03C7, 0x023C, CCDirection.right, WarpStyle.moonside9, 0x0000),
	TeleportDestination(0x0000, 0x0000, CCDirection.undefined, WarpStyle.instantPlusFade, 0x0000),
];

/// $D5EA77
immutable CondimentTableEntry[44] condimentTable = [
	CondimentTableEntry(ItemID.cookie, [ItemID.jarOfDelisauce, ItemID.tinOfCocoa], 0x00, 0x02, 0x02, 0x00),
	CondimentTableEntry(ItemID.bagOfFries, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x08, 0x02, 0x00),
	CondimentTableEntry(ItemID.hamburger, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x10, 0x02, 0x00),
	CondimentTableEntry(ItemID.boiledEgg, [ItemID.jarOfDelisauce, ItemID.saltPacket], 0x00, 0x0E, 0x02, 0x00),
	CondimentTableEntry(ItemID.freshEgg, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x1C, 0x02, 0x00),
	CondimentTableEntry(ItemID.picnicLunch, [ItemID.jarOfDelisauce, ItemID.saltPacket], 0x00, 0x1C, 0x02, 0x00),
	CondimentTableEntry(ItemID.pastaDiSummers, [ItemID.jarOfDelisauce, ItemID.jarOfHotSauce], 0x00, 0x24, 0x02, 0x00),
	CondimentTableEntry(ItemID.pizza, [ItemID.jarOfDelisauce, ItemID.jarOfHotSauce], 0x00, 0x28, 0x02, 0x00),
	CondimentTableEntry(ItemID.chefsSpecial, [ItemID.jarOfDelisauce, ItemID.saltPacket], 0x00, 0x48, 0x02, 0x00),
	CondimentTableEntry(ItemID.psiCaramel, [ItemID.jarOfDelisauce, ItemID.sugarPacket], 0x01, 0x28, 0x28, 0x00),
	CondimentTableEntry(ItemID.magicTruffle, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x01, -96, 0xA0, 0x00),
	CondimentTableEntry(ItemID.brainFoodLunch, [ItemID.jarOfDelisauce, ItemID.saltPacket], 0x02, 0x00, 0x00, 0x00),
	CondimentTableEntry(ItemID.rockCandy, [ItemID.jarOfDelisauce, ItemID.sugarPacket], 0x03, 0x02, 0x02, 0x00),
	CondimentTableEntry(ItemID.croissant, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x14, 0x02, 0x00),
	CondimentTableEntry(ItemID.breadRoll, [ItemID.jarOfDelisauce, ItemID.sugarPacket], 0x00, 0x0A, 0x02, 0x00),
	CondimentTableEntry(ItemID.troutYogurt, [ItemID.jarOfDelisauce, ItemID.cartonOfCream], 0x00, 0x0A, 0x02, 0x00),
	CondimentTableEntry(ItemID.banana, [ItemID.jarOfDelisauce, ItemID.cartonOfCream], 0x00, 0x08, 0x02, 0x00),
	CondimentTableEntry(ItemID.calorieStick, [ItemID.jarOfDelisauce, ItemID.sugarPacket], 0x00, 0x14, 0x02, 0x00),
	CondimentTableEntry(ItemID.gelatoDeResort, [ItemID.jarOfDelisauce, ItemID.tinOfCocoa], 0x00, 0x0A, 0x02, 0x00),
	CondimentTableEntry(ItemID.magicTart, [ItemID.jarOfDelisauce, ItemID.sugarPacket], 0x01, 0x28, 0x28, 0x00),
	CondimentTableEntry(ItemID.cupOfNoodles, [ItemID.jarOfDelisauce, ItemID.jarOfHotSauce], 0x00, 0x0E, 0x02, 0x00),
	CondimentTableEntry(ItemID.skipSandwich, [ItemID.jarOfDelisauce, ItemID.tinOfCocoa], 0x00, 0x02, 0x02, 0x78),
	CondimentTableEntry(ItemID.skipSandwichDX, [ItemID.jarOfDelisauce, ItemID.tinOfCocoa], 0x00, 0x02, 0x02, 0xF0),
	CondimentTableEntry(ItemID.luckySandwich1, [ItemID.jarOfDelisauce, ItemID.cartonOfCream], 0x00, 0x14, 0x02, 0x00),
	CondimentTableEntry(ItemID.luckySandwich2, [ItemID.jarOfDelisauce, ItemID.cartonOfCream], 0x00, 0x50, 0x02, 0x00),
	CondimentTableEntry(ItemID.luckySandwich3, [ItemID.jarOfDelisauce, ItemID.cartonOfCream], 0x00, 0x00, 0x02, 0x00),
	CondimentTableEntry(ItemID.luckySandwich4, [ItemID.jarOfDelisauce, ItemID.cartonOfCream], 0x01, 0x0A, 0x02, 0x00),
	CondimentTableEntry(ItemID.luckySandwich5, [ItemID.jarOfDelisauce, ItemID.cartonOfCream], 0x01, 0x28, 0x02, 0x00),
	CondimentTableEntry(ItemID.luckySandwich6, [ItemID.jarOfDelisauce, ItemID.cartonOfCream], 0x02, 0x00, 0x02, 0x00),
	CondimentTableEntry(ItemID.doubleBurger, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x20, 0x02, 0x00),
	CondimentTableEntry(ItemID.peanutCheeseBar, [ItemID.jarOfDelisauce, ItemID.sprigOfParsley], 0x00, 0x24, 0x02, 0x00),
	CondimentTableEntry(ItemID.piggyJelly, [ItemID.jarOfDelisauce, ItemID.sprigOfParsley], 0x00, 0x64, 0x02, 0x00),
	CondimentTableEntry(ItemID.bowlOfRiceGruel, [ItemID.jarOfDelisauce, ItemID.sprigOfParsley], 0x00, 0x48, 0x02, 0x00),
	CondimentTableEntry(ItemID.beanCroquette, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x0E, 0x02, 0x00),
	CondimentTableEntry(ItemID.plainRoll, [ItemID.jarOfDelisauce, ItemID.tinOfCocoa], 0x00, 0x1C, 0x02, 0x00),
	CondimentTableEntry(ItemID.kabob, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x2A, 0x02, 0x00),
	CondimentTableEntry(ItemID.plainYogurt, [ItemID.jarOfDelisauce, ItemID.sugarPacket], 0x00, 0x38, 0x02, 0x00),
	CondimentTableEntry(ItemID.beefJerky, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x32, 0x02, 0x00),
	CondimentTableEntry(ItemID.mammothBurger, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x44, 0x02, 0x00),
	CondimentTableEntry(ItemID.spicyJerky, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x54, 0x02, 0x00),
	CondimentTableEntry(ItemID.luxuryJerky, [ItemID.jarOfDelisauce, ItemID.ketchupPacket], 0x00, 0x64, 0x02, 0x00),
	CondimentTableEntry(ItemID.magicPudding, [ItemID.jarOfDelisauce, ItemID.sugarPacket], 0x01, 0x50, 0x50, 0x00),
	CondimentTableEntry(ItemID.popsicle, [ItemID.jarOfDelisauce, ItemID.cartonOfCream], 0x00, 0x06, 0x02, 0x00),
	CondimentTableEntry(0, [0, 0], 0, 0, 0, 0)
];

/// $D5F2FB
immutable Hotspot[56] mapHotspots = [
	Hotspot(0, 0, 0, 0),
	Hotspot(620, 475, 627, 477),
	Hotspot(610, 514, 618, 516),
	Hotspot(268, 816, 284, 828),
	Hotspot(425, 514, 439, 524),
	Hotspot(45, 277, 72, 278),
	Hotspot(510, 1229, 527, 1238),
	Hotspot(732, 19, 733, 24),
	Hotspot(738, 27, 744, 30),
	Hotspot(157, 718, 239, 719),
	Hotspot(630, 845, 631, 863),
	Hotspot(588, 836, 592, 840),
	Hotspot(608, 803, 662, 804),
	Hotspot(545, 775, 559, 787),
	Hotspot(526, 114, 530, 116),
	Hotspot(259, 10, 263, 23),
	Hotspot(213, 689, 219, 691),
	Hotspot(191, 204, 210, 205),
	Hotspot(254, 886, 264, 889),
	Hotspot(265, 886, 269, 889),
	Hotspot(255, 880, 268, 888),
	Hotspot(164, 820, 188, 824),
	Hotspot(329, 43, 334, 46),
	Hotspot(241, 183, 265, 188),
	Hotspot(144, 41, 157, 50),
	Hotspot(382, 1019, 389, 1022),
	Hotspot(33, 473, 47, 485),
	Hotspot(85, 661, 97, 670),
	Hotspot(476, 512, 486, 521),
	Hotspot(437, 772, 446, 777),
	Hotspot(822, 599, 825, 602),
	Hotspot(759, 1219, 769, 1229),
	Hotspot(818, 809, 819, 815),
	Hotspot(812, 726, 813, 737),
	Hotspot(823, 726, 824, 737),
	Hotspot(981, 469, 983, 480),
	Hotspot(982, 480, 995, 481),
	Hotspot(965, 464, 985, 486),
	Hotspot(974, 478, 997, 486),
	Hotspot(94, 384, 104, 390),
	Hotspot(744, 859, 746, 864),
	Hotspot(712, 38, 713, 47),
	Hotspot(890, 103, 891, 112),
	Hotspot(311, 65, 328, 66),
	Hotspot(656, 468, 660, 469),
	Hotspot(142, 38, 145, 51),
	Hotspot(379, 1015, 394, 1016),
	Hotspot(942, 240, 946, 241),
	Hotspot(80, 430, 87, 431),
	Hotspot(996, 1194, 997, 1200),
	Hotspot(874, 1195, 877, 1200),
	Hotspot(750, 773, 751, 784),
	Hotspot(698, 669, 699, 688),
	Hotspot(895, 350, 903, 360),
	Hotspot(631, 1123, 803, 1128),
	Hotspot(0, 0, 0, 0),
];

/// $D5F4BB
immutable TimedItemTransformation[4] timedItemTransformationTable = [
	TimedItemTransformation(ItemID.freshEgg, Sfx.none, 0, ItemID.chick, 0x32),
	TimedItemTransformation(ItemID.chick, Sfx.cheep, 2, ItemID.chicken, 0x2C),
	TimedItemTransformation(ItemID.chicken, Sfx.cluck, 15, ItemID.none, 0),
	TimedItemTransformation(ItemID.none, Sfx.none, 0, ItemID.none, 0),
];

/// $D5F4CF
immutable ubyte[6][7][7] dontCareNames = [
	[
		ebString!6("Ness"),
		ebString!6("Alec"),
		ebString!6("Roger"),
		ebString!6("Will"),
		ebString!6("Brian"),
		ebString!6("Tyler"),
		ebString!6("Lane"),
	],
	[
		ebString!6("Paula"),
		ebString!6("Nancy"),
		ebString!6("Skye"),
		ebString!6("Paige"),
		ebString!6("Marie"),
		ebString!6("Holly"),
		ebString!6("Jane"),
	],
	[
		ebString!6("Jeff"),
		ebString!6("Dan"),
		ebString!6("Henry"),
		ebString!6("Isaac"),
		ebString!6("Ralph"),
		ebString!6("Sean"),
		ebString!6("Rob"),
	],
	[
		ebString!6("Poo"),
		ebString!6("Kato"),
		ebString!6("Kai"),
		ebString!6("Omar"),
		ebString!6("Ramin"),
		ebString!6("Aziz"),
		ebString!6("Lado"),
	],
	[
		ebString!6("King"),
		ebString!6("Peach"),
		ebString!6("Sparky"),
		ebString!6("Rex"),
		ebString!6("Baby"),
		ebString!6("Rover"),
		ebString!6("Misty"),
	],
	[
		ebString!6("Steak"),
		ebString!6("Pie"),
		ebString!6("Pasta"),
		ebString!6("Cake"),
		ebString!6("Eggs"),
		ebString!6("Bread"),
		ebString!6("Salmon"),
	],
	[
		ebString!6("Rockin"),
		ebString!6("Hammer"),
		ebString!6("Love"),
		ebString!6("Gifts"),
		ebString!6("Slime"),
		ebString!6("Gaming"),
		ebString!6("Boxing"),
	]
];

/// $D5F5F5
immutable CharacterInitialStats[4] initialStats = [
	CharacterInitialStats(0x03F7, 0x008A, 20, 1, 0, [ItemID.atmCard, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none]),
	CharacterInitialStats(0x0000, 0x0000, 0, 1, 0, [ItemID.breadRoll, ItemID.teddyBear, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none]),
	CharacterInitialStats(0x0000, 0x0000, 0, 1, 0, [ItemID.bigBottleRocket, ItemID.boiledEgg, ItemID.ruler, ItemID.protractor, ItemID.brokenSprayCan, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none]),
	CharacterInitialStats(0x0000, 0x0000, 0, 15, 6000, [ItemID.tinyRuby, ItemID.bottleOfWater, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none, ItemID.none]),
];

/// $D5F645
immutable TimedDelivery[10] timedDeliveries = [
	TimedDelivery(0x97, EventFlag.deliveryPizza, 0x0006, 0x000F, 0x00B4, "textDelivery1", "textDelivery1Fail", 0x0200, 0x0200),
	TimedDelivery(0x87, EventFlag.deliveryUnsou, 0x0006, 0x000F, 0x000A, "textDelivery2", "textDelivery2Fail", 0x0180, 0x0180),
	TimedDelivery(0x87, EventFlag.deliveryUnsouB, 0x0006, 0x000F, 0x000A, "textDelivery3", "textDelivery3Fail", 0x0180, 0x0180),
	TimedDelivery(0x37, EventFlag.deliveryCustomer, 0x0006, 0x000F, 0x0001, "textDelivery4", "textDelivery4Fail", 0x0280, 0x0280),
	TimedDelivery(0x6C, EventFlag.deliveryCustomerB, 0x0006, 0x000F, 0x0002, "textDelivery5", "textDelivery4Fail", 0x0280, 0x0280),
	TimedDelivery(0x70, EventFlag.deliveryCustomerC, 0x0006, 0x000F, 0x0003, "textDelivery6", "textDelivery4Fail", 0x0280, 0x0280),
	TimedDelivery(0x55, EventFlag.deliveryCustomerD, 0x0006, 0x000F, 0x0004, "textDelivery7", "textDelivery4Fail", 0x0280, 0x0280),
	TimedDelivery(0x97, EventFlag.deliveryHoihoi, 0x00FF, 0x00FF, 0x0005, "textDelivery8", "textDelivery8Fail", 0x0180, 0x0180),
	TimedDelivery(0x87, EventFlag.deliveryUnsouTakokeshi, 0x0006, 0x000F, 0x000A, "textDelivery9", "textDelivery9Fail", 0x0180, 0x0180),
	TimedDelivery(0x87, EventFlag.deliveryUnsouTakanome, 0x0006, 0x000F, 0x000A, "textDelivery10", "textDelivery10Fail", 0x0180, 0x0180),
];
