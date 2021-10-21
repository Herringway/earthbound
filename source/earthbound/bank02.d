module earthbound.bank02;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.globals;

void inflictSunstrokeCheck() {
	if (OverworldStatusSuppression) {
		return;
	}
	if ((gameState.troddenTileType & 0xC) != 4) {
		return;
	}
	for (int i = 0 ; i < 6; i++) {
		if (gameState.unknown96[i] == 0) {
			return;
		}
		if (gameState.unknown96[i] > 4) {
			return;
		}
		Unknown7E4DC6 = ChosenFourPtrs[gameState.playerControlledPartyMembers[i]];
		if (Unknown7E4DC6.afflictions[0] != 0 && Unknown7E4DC6.afflictions[0] == 7) {
			continue;
		}
		if (((30 - Unknown7E4DC6.guts > 0) ? (30 - Unknown7E4DC6.guts) : 1) * 256 / 100 < rand()) {
			Unknown7E4DC6.afflictions[0] = 6;
		}
	}
}

immutable ubyte[] C200B9 = [0xF8, 0xFF, 0x00, 0x00, 0x07, 0x00, 0xF8, 0xFF, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x1E, 0x00, 0x33, 0x00, 0x1E, 0x00, 0x33, 0x00];

// $C200D9
void UnknownC200D9();

// $C20266
void UnknownC20266();

// $C2038B
void UnknownC2038B();

// $C2087C
void UnknownC2087C();

immutable short[32] UnknownC20958 = [
	-1,
	-1,
	-1,
	-1,
	-28673,
	-32737,
	1023,
	1023,
	1,
	1,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
];

// $C20B65 - Similar to $C118E7, but doesn't wrap around window edges (arguments unknown)
ushort UnknownC20B65(short, short, short, short, short);

// $C2109F
void HPPPRoller() {
	if (Unknown7E9697 != 0) {
		return;
	}
	if (gameState.partyMembers[Unknown7E0002 & 3] == 0) {
		return;
	}
	if (gameState.partyMembers[Unknown7E0002 & 3] > 4) {
		return;
	}
	PartyCharacter* x10 = &PartyCharacters[gameState.partyMembers[Unknown7E0002 & 3]];
	if ((Unknown7E9698 == 0) && ((x10.hp.current.fraction & 1) != 0)) {
		if (x10.hp.current.integer < x10.hp.target) {
			x10.hp.current.combined += ((Unknown7E9696 == 0) && (Unknown7E9698 != 0)) ? 0x64000 : UnknownC20F58();
			if (x10.hp.current.integer >= x10.hp.target) {
				x10.hp.current.integer = x10.hp.target;
				x10.hp.current.fraction = 1;
			}
		} else if ((x10.hp.current.integer == x10.hp.target) && (x10.hp.current.fraction == 1)) {
			x10.hp.current.fraction = 0;
		} else {
			x10.hp.current.combined += (Unknown7E9698 != 0) ? 0x64000 : UnknownC20F58();
			if ((x10.hp.current.integer < x10.hp.target) || (x10.hp.current.integer > 0x1000)) {
				x10.hp.current.integer = x10.hp.target;
				x10.hp.current.fraction = 1;
			}
		}
	} else if ((x10.hp.current.fraction & 1) == 1) {
		if (x10.hp.current.integer != x10.hp.target) {
			x10.hp.current.fraction = 1;
		}
	}
	if ((Unknown7E9698 == 0) && ((x10.pp.current.fraction & 1) != 0)) {
		if (x10.pp.current.integer < x10.pp.target) {
			x10.pp.current.combined += (Unknown7E9698 != 0) ?  0x64000 : 0x19000;
			if (x10.pp.current.integer >= x10.pp.target) {
				x10.pp.current.integer = x10.pp.target;
				x10.hp.current.fraction = 1;
			}
		} else if ((x10.pp.current.integer == x10.pp.target) && (x10.pp.current.fraction == 1)) {
			x10.pp.current.fraction = 0;
		} else {
			x10.pp.current.combined += (Unknown7E9698 != 0) ? 0x64000 : 0x19000;
			if ((x10.pp.current.integer < x10.pp.target) || (x10.pp.current.integer > 0x1000)) {
				x10.pp.current.integer = x10.pp.target;
				x10.pp.current.fraction = 1;
			}
		}
	} else if ((x10.pp.current.fraction) == 0) {
		if (x10.pp.current.integer != x10.pp.target) {
			x10.pp.current.fraction = 1;
		}
	}
	if (Unknown7E9698 == 0) {
		return;
	}
	if (x10.hp.current.integer == 999) {
		x10.hp.target = 1;
	} else if (x10.hp.current.integer == 1) {
		x10.hp.target = 999;
	}
	if (x10.pp.current.integer == 999) {
		x10.pp.target = 0;
	} else if (x10.pp.current.integer == 0) {
		x10.pp.target = 999;
	}
}

// $C20F58
uint UnknownC20F58() {
	if (Unknown7E9695 != 0) {
		return Unknown7E9627 >> 1;
	} else {
		return Unknown7E9627;
	}
}

// $C213AC
void UnknownC213AC();
