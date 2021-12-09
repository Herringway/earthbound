module dataloader;

import earthbound.commondefs;
import earthbound.globals;
import earthbound.bank00;
import earthbound.bank04;

shared static this() {
	cast()UnknownC0A20C = [
		&Unknown7EB800[0],
		&Unknown7EB800[0xC0],
		&Unknown7EB800[0x180],
		&Unknown7EB800[0x240],
		&Unknown7EB800[0x300],
		&Unknown7EB800[0x3C0],
		&Unknown7EB800[0x480],
		&Unknown7EB800[0x540],
	];
	cast()CC1C01Table = [
	    CC1C01Entry(0, null),
	    CC1C01Entry(CC1C01Type.string | gameState.mother2PlayerName.sizeof, &gameState.mother2PlayerName[0]),
	    CC1C01Entry(CC1C01Type.string | gameState.earthboundPlayerName.sizeof, &gameState.earthboundPlayerName[0]),
	    CC1C01Entry(CC1C01Type.string | gameState.petName.sizeof, &gameState.petName[0]),
	    CC1C01Entry(CC1C01Type.string | gameState.favouriteFood.sizeof, &gameState.favouriteFood[0]),
	    CC1C01Entry(CC1C01Type.string | gameState.favouriteThing.sizeof, &gameState.favouriteThing[0]),
	    CC1C01Entry(CC1C01Type.integer | gameState.moneyCarried.sizeof, &gameState.moneyCarried),
	    CC1C01Entry(CC1C01Type.integer | gameState.bankBalance.sizeof, &gameState.bankBalance),
	    CC1C01Entry(CC1C01Type.string | PartyCharacter.name.sizeof, &PartyCharacters[0].name),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.level.sizeof, &PartyCharacters[0].level),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.exp.sizeof, &PartyCharacters[0].exp),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.current.integer.sizeof, &PartyCharacters[0].hp.current.integer),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.target.sizeof, &PartyCharacters[0].hp.target),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxHP.sizeof, &PartyCharacters[0].maxHP),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.current.integer.sizeof, &PartyCharacters[0].pp.current.integer),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.target.sizeof, &PartyCharacters[0].pp.target),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxPP.sizeof, &PartyCharacters[0].maxPP),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.offense.sizeof, &PartyCharacters[0].offense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.defense.sizeof, &PartyCharacters[0].defense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.speed.sizeof, &PartyCharacters[0].speed),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.guts.sizeof, &PartyCharacters[0].guts),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.luck.sizeof, &PartyCharacters[0].luck),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.vitality.sizeof, &PartyCharacters[0].vitality),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.iq.sizeof, &PartyCharacters[0].iq),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_iq.sizeof, &PartyCharacters[0].base_iq),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_offense.sizeof, &PartyCharacters[0].base_offense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_defense.sizeof, &PartyCharacters[0].base_defense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_speed.sizeof, &PartyCharacters[0].base_speed),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_guts.sizeof, &PartyCharacters[0].base_guts),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_luck.sizeof, &PartyCharacters[0].base_luck),
	    CC1C01Entry(CC1C01Type.string | PartyCharacter.name.sizeof, &PartyCharacters[1].name),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.level.sizeof, &PartyCharacters[1].level),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.exp.sizeof, &PartyCharacters[1].exp),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.current.integer.sizeof, &PartyCharacters[1].hp.current.integer),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.target.sizeof, &PartyCharacters[1].hp.target),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxHP.sizeof, &PartyCharacters[1].maxHP),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.current.integer.sizeof, &PartyCharacters[1].pp.current.integer),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.target.sizeof, &PartyCharacters[1].pp.target),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxPP.sizeof, &PartyCharacters[1].maxPP),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.offense.sizeof, &PartyCharacters[1].offense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.defense.sizeof, &PartyCharacters[1].defense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.speed.sizeof, &PartyCharacters[1].speed),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.guts.sizeof, &PartyCharacters[1].guts),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.luck.sizeof, &PartyCharacters[1].luck),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.vitality.sizeof, &PartyCharacters[1].vitality),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.iq.sizeof, &PartyCharacters[1].iq),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_iq.sizeof, &PartyCharacters[1].base_iq),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_offense.sizeof, &PartyCharacters[1].base_offense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_defense.sizeof, &PartyCharacters[1].base_defense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_speed.sizeof, &PartyCharacters[1].base_speed),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_guts.sizeof, &PartyCharacters[1].base_guts),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_luck.sizeof, &PartyCharacters[1].base_luck),
	    CC1C01Entry(CC1C01Type.string | PartyCharacter.name.sizeof, &PartyCharacters[2].name),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.level.sizeof, &PartyCharacters[2].level),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.exp.sizeof, &PartyCharacters[2].exp),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.current.integer.sizeof, &PartyCharacters[2].hp.current.integer),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.target.sizeof, &PartyCharacters[2].hp.target),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxHP.sizeof, &PartyCharacters[2].maxHP),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.current.integer.sizeof, &PartyCharacters[2].pp.current.integer),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.target.sizeof, &PartyCharacters[2].pp.target),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxPP.sizeof, &PartyCharacters[2].maxPP),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.offense.sizeof, &PartyCharacters[2].offense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.defense.sizeof, &PartyCharacters[2].defense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.speed.sizeof, &PartyCharacters[2].speed),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.guts.sizeof, &PartyCharacters[2].guts),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.luck.sizeof, &PartyCharacters[2].luck),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.vitality.sizeof, &PartyCharacters[2].vitality),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.iq.sizeof, &PartyCharacters[2].iq),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_iq.sizeof, &PartyCharacters[2].base_iq),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_offense.sizeof, &PartyCharacters[2].base_offense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_defense.sizeof, &PartyCharacters[2].base_defense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_speed.sizeof, &PartyCharacters[2].base_speed),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_guts.sizeof, &PartyCharacters[2].base_guts),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_luck.sizeof, &PartyCharacters[2].base_luck),
	    CC1C01Entry(CC1C01Type.string | PartyCharacter.name.sizeof, &PartyCharacters[3].name),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.level.sizeof, &PartyCharacters[3].level),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.exp.sizeof, &PartyCharacters[3].exp),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.current.integer.sizeof, &PartyCharacters[3].hp.current.integer),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.hp.target.sizeof, &PartyCharacters[3].hp.target),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxHP.sizeof, &PartyCharacters[3].maxHP),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.current.integer.sizeof, &PartyCharacters[3].pp.current.integer),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.pp.target.sizeof, &PartyCharacters[3].pp.target),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.maxPP.sizeof, &PartyCharacters[3].maxPP),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.offense.sizeof, &PartyCharacters[3].offense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.defense.sizeof, &PartyCharacters[3].defense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.speed.sizeof, &PartyCharacters[3].speed),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.guts.sizeof, &PartyCharacters[3].guts),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.luck.sizeof, &PartyCharacters[3].luck),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.vitality.sizeof, &PartyCharacters[3].vitality),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.iq.sizeof, &PartyCharacters[3].iq),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_iq.sizeof, &PartyCharacters[3].base_iq),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_offense.sizeof, &PartyCharacters[3].base_offense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_defense.sizeof, &PartyCharacters[3].base_defense),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_speed.sizeof, &PartyCharacters[3].base_speed),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_guts.sizeof, &PartyCharacters[3].base_guts),
	    CC1C01Entry(CC1C01Type.integer | PartyCharacter.base_luck.sizeof, &PartyCharacters[3].base_luck),
	];
}
