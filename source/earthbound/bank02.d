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
	if ((Unknown7E9698 == 0) && ((x10.unknown67 & 1) != 0)) {
		if (x10.current_hp < x10.current_hp_target) {
			x10.unknown67 += ((Unknown7E9696 == 0) && (Unknown7E9698 != 0)) ? 0x64000 : UnknownC20F58(); // these fields aren't uints. what's going on here...?
			if (x10.current_hp >= x10.current_hp_target) {
				x10.current_hp = x10.current_hp_target;
				x10.unknown67 = 1;
			}
		} else if ((x10.current_hp == x10.current_hp_target) && (x10.unknown67 == 1)) {
			x10.unknown67 = 0;
		} else {
			x10.unknown67 += (Unknown7E9698 != 0) ? 0x64000 : UnknownC20F58(); // these fields aren't uints. what's going on here...?
			if ((x10.current_hp < x10.current_hp_target) || (x10.current_hp > 0x1000)) {
				x10.current_hp = x10.current_hp_target;
				x10.unknown67 = 1;
			}
		}
	} else if ((x10.unknown67 & 1) == 1) {
		if (x10.current_hp != x10.current_hp_target) {
			x10.unknown67 = 1;
		}
	}
	if ((Unknown7E9698 == 0) && ((x10.unknown73 & 1) != 0)) {
		if (x10.current_pp < x10.current_pp_target) {
			x10.unknown73 += (Unknown7E9698 != 0) ?  0x64000 : 0x19000; // these fields aren't uints. what's going on here...?
			if (x10.current_pp >= x10.current_pp_target) {
				x10.current_pp = x10.current_pp_target;
				x10.unknown67 = 1;
			}
		} else if ((x10.current_pp == x10.current_pp_target) && (x10.unknown73 == 1)) {
			x10.unknown73 = 0;
		} else {
			x10.unknown73 += (Unknown7E9698 != 0) ? 0x64000 : 0x19000; // these fields aren't uints. what's going on here...?
			if ((x10.current_pp < x10.current_pp_target) || (x10.current_pp > 0x1000)) {
				x10.current_pp = x10.current_pp_target;
				x10.unknown73 = 1;
			}
		}
	} else if ((x10.unknown73) == 0) {
		if (x10.current_pp != x10.current_pp_target) {
			x10.unknown73 = 1;
		}
	}
	if (Unknown7E9698 == 0) {
		return;
	}
	if (x10.current_hp == 999) {
		x10.current_hp_target = 1;
	} else if (x10.current_hp == 1) {
		x10.current_hp_target = 999;
	}
	if (x10.current_pp == 999) {
		x10.current_pp_target = 0;
	} else if (x10.current_pp == 0) {
		x10.current_pp_target = 999;
	}
}

// $C20F58
uint UnknownC20F58();

// $C213AC
void UnknownC213AC();
