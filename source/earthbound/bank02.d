module earthbound.bank02;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.globals;

import core.stdc.string;

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
void UnknownC200D9() {
	Unknown7E89C9 = 0;
	Unknown7E89D2 = -1;
	Unknown7E89D0 = -1;
	Unknown7E89CE = -1;
	Unknown7E89CC = -1;
	BattleMenuCurrentCharacterID = -1;
	Unknown7E9622 = 0;
	Unknown7E9623 = 0;
	Unknown7E9641 = 0;
	Unknown7E9624 = 0;
	window_head = -1;
	window_tail = -1;
	for (short i = 0; i != 8; i++) {
		WindowStats[i].next = -1;
	}
	for (short i = 0; i != 0x35; i++) {
		WindowTable[i] = -1;
	}
	for (short i = 0; i != 5; i++) {
		Unknown7E894E[i] = -1;
	}
	Unknown7E5E7A = -1;
	Unknown7E5E7C = -1;
	for (short i = 0x380; i != 0; i--) {
		bg2Buffer[i] = 0;
	}
	for (short i = 0; i != 0x46; i++) {
		menu_options[i].field00 = 0;
	}
	for (short i = 0; i < 8; i++) {
		for (short j = 0; j < 0x20; j++) {
			Unknown7E9D23[i][j] = 0xFF;
		}
	}
	Unknown7E9E29 = 0;
	Unknown7E9E27 = 0;
	Unknown7E9E25 = 0;
	Unknown7E9E23 = 0;
	BlinkingTriangleFlag = 0;
	Unknown7E964F = 1;
	BattleModeFlag = 0;
	InputLockFlag = 0;
	CurrentFocusWindow = -1;
	Unknown7E5E6D = 1;
	UnknownC43F53();
	Unknown7E9651 = 0xFF;
	Unknown7E5E6E = 0xFF;
	Unknown7E5E70 = 0;
	Unknown7E5E75 = 0;
	// uhhhhh
	menu_options[WindowStats[WindowTable[CurrentFocusWindow]].current_option].pixel_align = 0;
	Unknown7E5E71 = 0;
	Unknown7E5E72 = 0;
	Unknown7E5E73 = 0;
	Unknown7E5E74 = 0;
	Unknown7E5E76 = 0;
	Unknown7E5E78 = 0;
	Unknown7E5E77 = 0;
	Unknown7EB4CE = 0;
	Unknown7E5E6C = 0;
}

// $C20266
void UnknownC20266() {
	for (short i = 0; i < 4; i++) {
		Unknown7E827E[i] = UnknownC3E40E[i];
	}
}

// $C2038B
void UnknownC2038B() {
	CopyToVramAlt(0, 0x700, 0x7C00, cast(ubyte*)&bg2Buffer[0]);
	CopyToVram(0, 0x40, 0x7F80, &UnknownC40BE8[0]);
}

// $C203C3
void DrawHPPPWindow(short id) {
	PartyCharacter* character = &PartyCharacters[gameState.partyMembers[id] - 1];
	short x22 = UnknownC223D9(&character.afflictions[0], 1);
	short x04 = UnknownC223D9(&character.afflictions[0], 1);
	short x20 = cast(short)((x22 & 0xFFF0) + x04);
	ushort x1E = character.hp_pp_window_options;
	short x18;
	short x1A;
	short x1C;
	if (x1E == 0xC00) {
		x1C = 0xC00;
		x22 = 0xC00;
		x1A = 0x800;
	} else {
		x1C = cast(short)(UnknownC22474(&character.afflictions[0]) * 0x400);
		x22 = 0x1000;
		x1A = 0;
	}
	if (BattleMenuCurrentCharacterID == id) {
		x18 = 18;
	} else {
		x18 = 19;
	}
	ushort* x = &bg2Buffer[10 - gameState.playerControlledPartyMemberCount / 2 + id + x18 * 64];
	x[0] = cast(ushort)(x1E + 0x2004);
	x++;
	for (short i = 6; i != 0; i--) {
		x[0] = cast(ushort)(x1E + 0x2005);
		x++;
	}
	x[0] = cast(ushort)(x1E + 0x6004);
	x++;
	x += 24;

	x[0] = cast(ushort)(x1E + 0x2006);
	short x14 = (gameState.partyMembers[id] - 1) * 4 + 0x22A0;
	short x12 = cast(short)((strlen(cast(char*)&character.name[0]) * 6 + 9) / 8);
	for (short i = 0; i != 5; i++) {
		if (x12 != 0) {
			x[0] = cast(ushort)(x14 + x1C);
			x++;
			x14++;
			x12--;
		} else {
			x[0] = cast(ushort)(x1C + 0x2007);
			x++;
		}
	}
	x[0] = cast(ushort)(x1C + x20 + 0x2000);
	x++;
	x[0] = cast(ushort)(x1E + 0x6006);
	x += 24;

	x[0] = cast(ushort)(x1E + 0x2006);
	x++;
	x14 = ((gameState.partyMembers[id] - 1) * 4) + 0x22B0;
	x12 = cast(short)((strlen(cast(char*)&character.name[0]) * 6 + 9) / 8);
	for (short i =0 ; i != 5; i++) {
		if (x12 != 0) {
			x[0] = cast(ushort)(x14 + x1C);
			x++;
			x14++;
			x12--;
		} else {
			x[0] = cast(ushort)(x1C + 0x2017);
			x++;
		}
	}
	x[0] = cast(ushort)(x1C + x20 + 0x2010);
	x++;
	x[0] = cast(ushort)(x1E + 0x6006);
	x++;
	x+= 24;

	FillCharacterHPTileBuffer(id, character.hp.current.integer, character.hp.current.fraction);
	const(ubyte)* x06 = &UnknownC3E3F8[0];
	ushort* y = &HPPPWindowBuffer[id][0];
	for (short i = 2; i != 0; i--) {
		x[0] = cast(ushort)(x1E + 0x2006);
		x++;
		for (short j = 2;j != 0; j--) {
			x[0] = cast(ushort)(x06[0] + x22 + 0x2000);
			x06++;
			x++;
		}
		for (short j = 4; j != 0; j--) {
			x[0] = y[0];
			y++;
			x++;
		}
		x[0] = cast(ushort)(x1E + 0x6006);
		x++;
		x += 24;
	}

	FillCharacterPPTileBuffer(id, &character.afflictions[0], character.pp.current.integer, character.pp.current.fraction);
	y = &HPPPWindowBuffer[id][6];
	for (short i = 2; i != 0; i--) {
		x[0] = cast(ushort)(x1E + 0x2006);
		x++;
		for (short j = 2; j != 0; j--) {
			x[0] = cast(ushort)(x06[0] + x22 + 0x2000);
			x06++;
			x++;
		}
		for (short j = 4; j != 0; j--) {
			x[0] = y[0];
			y++;
			x++;
		}
		x[0] = cast(ushort)(x1E + 0x6006);
		x++;
		x += 24;
	}
	x[0] = cast(ushort)(x1E + 0xA004);
	x++;
	for (short i = 6; i != 0; i--) {
		x[0] = cast(ushort)(x1E + 0xA005);
		x++;
	}
	x[0] = cast(ushort)(x1E + 0xE004);
}

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

// $C20D3F
void SeparateDecimalDigits(short arg1) {
	ubyte* x = &HPPPWindowDigitBuffer[2];
	x[0] = cast(ubyte)(arg1%10);
	x--;

	arg1 /= 10;
	x[0] = cast(ubyte)(arg1%10);
	x--;

	arg1 /= 10;
	x[0] = cast(ubyte)arg1;
	x--;
}

// $C20D89
void FillHPPPTileBufferX(short arg1) {
	ushort* x = &HPPPWindowBuffer[arg1][6];
	for (short i = 0; i < 3; i++) {
		x[0] = cast(ushort)(i + 0x264C);
		x[3] = cast(ushort)(i + 0x265C);
		x++;
	}
}
// $C20DC5
void FillHPPPTileBuffer(short arg1, short arg2, short arg3) {
	short x16 = cast(short)((arg3 >= 0x3000) ? (arg3 - 0x3000) : 0);
	short y = x16 / 0x3400;
	ushort* x = &HPPPWindowBuffer[arg1][arg2 * 6 + 3 - 1];

	//100s digit
	x[0] = cast(ushort)(((HPPPWindowDigitBuffer[2] >> 2) * 16) + (HPPPWindowDigitBuffer[2] * 4) + y + 0x2600);
	x[3] = cast(ushort)(x[0] + 0x10);
	x--;

	//10s digit
	if ((HPPPWindowDigitBuffer[2] != 9) || (y == 0)) {
		y = 0;
	}
	x[0] = cast(ushort)(((HPPPWindowDigitBuffer[1] >> 2) * 16) + (HPPPWindowDigitBuffer[1] * 4) + y + (((HPPPWindowDigitBuffer[1] != 0) || (HPPPWindowDigitBuffer[0] != 0)) ? 0x200 : 0x248) + 0x2400);
	x[3] = cast(ushort)(x[0] + 0x10);
	x--;

	//1s digit
	if ((HPPPWindowDigitBuffer[1] != 9) || (y == 0)) {
		y = 0;
	}
	x[0] = cast(ushort)(((HPPPWindowDigitBuffer[0] >> 2) * 16) + (HPPPWindowDigitBuffer[0] * 4) + y + ((HPPPWindowDigitBuffer[0] != 0) ? 0x200 : 0x248) + 0x2400);
	x[3] = cast(ushort)(x[0] + 0x10);
}

// $C20F08
void FillCharacterHPTileBuffer(short arg1, short arg2, short arg3) {
	SeparateDecimalDigits(arg2);
	FillHPPPTileBuffer(arg1, 0, arg3);
}

// $C20F26
void FillCharacterPPTileBuffer(short arg1, ubyte* afflictions, short arg2, short arg3) {
	if (afflictions[4] != 0) {
		FillHPPPTileBufferX(arg1);
		return;
	}
	SeparateDecimalDigits(arg2);
	FillHPPPTileBuffer(arg1, 1, arg3);
}

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

// $C223D9
short UnknownC223D9(ubyte*, short);

// $C22474
short UnknownC22474(ubyte*);

// $C2D121
void LoadBattleBG(ushort layer1, ushort layer2, ushort letterbox);

// $C2DB3F
void UnknownC2DB3F();
