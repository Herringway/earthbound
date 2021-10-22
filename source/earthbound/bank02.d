module earthbound.bank02;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank04;
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
void UnknownC2038B() {
	CopyToVramAlt(0, 0x700, 0x7C00, cast(ubyte*)&bg2Buffer[0]);
	CopyToVram(0, 0x40, 0x7F80, &UnknownC40BE8[0]);
}

// $C203C3
void DrawHPPPWindow(short id);

// $C2077D
void UnknownC2077D() {
	ushort x10 = Unknown7E9647;
	for (short i = 0; i != gameState.playerControlledPartyMemberCount; i++) {
		if ((x10 & 1) != 0) {
			DrawHPPPWindow(i);
		}
		x10 >>= 1;
	}
}

// $C2087C
void UnknownC2087C() {
	if (Unknown7E89C9 != 0) {
		UnknownC2077D();
	}
	if (window_head == 0xFFFF) {
		return;
	}
	short x0E = window_head;
	do {
		UnknownC107AF(x0E);
		x0E = WindowStats[x0E].next;
	} while(x0E != 0xFFFF);
}

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

// $C20A20
void UnknownC20A20(WindowTextAttributesCopy* buf) {
	buf.id = CurrentFocusWindow;
	if (CurrentFocusWindow == 0xFFFF) {
		return;
	}
	buf.text_x = WindowStats[WindowTable[CurrentFocusWindow]].text_x;
	buf.text_y = WindowStats[WindowTable[CurrentFocusWindow]].text_y;
	buf.number_padding = WindowStats[WindowTable[CurrentFocusWindow]].num_padding;
	buf.curr_tile_attributes = WindowStats[WindowTable[CurrentFocusWindow]].tileAttributes;
	buf.font = WindowStats[WindowTable[CurrentFocusWindow]].font;
}

// $C20ABC
void UnknownC20ABC(WindowTextAttributesCopy* buf) {
	if (buf.id == 0xFFFF) {
		return;
	}
	if (WindowTable[buf.id] == 0xFFFF) {
		return;
	}
	CurrentFocusWindow = buf.id;
	WindowStats[WindowTable[CurrentFocusWindow]].text_x = buf.text_x;
	WindowStats[WindowTable[CurrentFocusWindow]].text_y = buf.text_y;
	WindowStats[WindowTable[CurrentFocusWindow]].num_padding = buf.number_padding;
	WindowStats[WindowTable[CurrentFocusWindow]].tileAttributes = buf.curr_tile_attributes;
	WindowStats[WindowTable[CurrentFocusWindow]].font = buf.font;
}

// $C20B65 - Similar to $C118E7, but doesn't wrap around window edges (arguments unknown)
ushort UnknownC20B65(short, short, short, short, short);

// $C20F58
uint UnknownC20F58() {
	if (Unknown7E9695 != 0) {
		return Unknown7E9627 >> 1;
	} else {
		return Unknown7E9627;
	}
}

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

// $C213AC
void UnknownC213AC();

// $C21628
short getEventFlag(short flag) {
	flag--;
	if ((PowersOfTwo8Bit[flag % 8] & EventFlags[flag / 8]) != 0) {
		return 1;
	}
	return 0;
}

// $C2165E
short setEventFlag(short flag, short value) {
	flag--;
	if (value == 1) {
		EventFlags[flag / 8] |= PowersOfTwo8Bit[flag % 8];
	} else {
		EventFlags[flag / 8] &= (PowersOfTwo8Bit[flag % 8] ^ 0xFF);
	}
	return EventFlags[flag / 8];
}
// $C216DB
void UnknownC216DB();

// $C2D121
void LoadBattleBG(ushort layer1, ushort layer2, ushort letterbox);
