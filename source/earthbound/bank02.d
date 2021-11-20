/// mostly battle code
module earthbound.bank02;

import earthbound.commondefs;
import earthbound.hardware;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.bank07;
import earthbound.bank08;
import earthbound.bank09;
import earthbound.bank0A;
import earthbound.bank0B;
import earthbound.bank0E;
import earthbound.bank10;
import earthbound.bank15;
import earthbound.bank2F;
import earthbound.globals;

import core.stdc.string;

/// $C20000
void inflictSunstrokeCheck() {
	if (OverworldStatusSuppression) {
		return;
	}
	if ((gameState.troddenTileType & 0xC) != 4) {
		return;
	}
	for (short i = 0 ; i < 6; i++) {
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

/// $C200D9
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
		MenuOptions[i].field00 = 0;
	}
	for (short i = 0; i < 8; i++) {
		for (short j = 0; j < 0x20; j++) {
			Unknown7E9D23[i][j] = 0xFF;
		}
	}
	Unknown7E9E29 = 0;
	Unknown7E9E27 = 0;
	VWFTile = 0;
	VWFX = 0;
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
	MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option].pixel_align = 0;
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

/// $C20266
void UnknownC20266() {
	for (short i = 0; i < 4; i++) {
		Unknown7E827E[i] = UnknownC3E40E[i];
	}
}

/// $C20293
void UnknownC20293() {
	for (short i = 0; i < 4; i++) {
		(cast(ushort*)(&IntroBG2Buffer[0x272]))[i] = 0;
	}
}

/// $C2038B
void UnknownC2038B() {
	CopyToVramAlt(0, 0x700, 0x7C00, cast(ubyte*)&bg2Buffer[0]);
	CopyToVram(0, 0x40, 0x7F80, &UnknownC40BE8[0]);
}

/// $C203C3
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

/// $C2077D
void UnknownC2077D() {
	ushort x10 = Unknown7E9647;
	for (short i = 0; i != gameState.playerControlledPartyMemberCount; i++) {
		if ((x10 & 1) != 0) {
			DrawHPPPWindow(i);
		}
		x10 >>= 1;
	}
}

/// $C207B6
void UnknownC207B6(short arg1) {
	Unknown7E9647 |= (1 << arg1);
	DrawHPPPWindow(arg1);
	Unknown7E9649 = 1;
}

/// $C207E1
void UndrawHPPPWindow(short);

/// $C2087C
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

/// $C20958
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

/// $C20A20
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

/// $C20ABC
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

/// $C20B65 - Similar to $C118E7, but doesn't wrap around window edges (arguments unknown)
ushort UnknownC20B65(short, short, short, short, short);

/// $C20D3F
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

/// $C20D89
void FillHPPPTileBufferX(short arg1) {
	ushort* x = &HPPPWindowBuffer[arg1][6];
	for (short i = 0; i < 3; i++) {
		x[0] = cast(ushort)(i + 0x264C);
		x[3] = cast(ushort)(i + 0x265C);
		x++;
	}
}
/// $C20DC5
void FillHPPPTileBuffer(short arg1, short arg2, short fraction) {
	ushort y = cast(ushort)(((fraction >= 0x3000) ? (fraction - 0x3000) : 0) / 0x3400);
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

/// $C20F08
void FillCharacterHPTileBuffer(short arg1, short integer, short fraction) {
	SeparateDecimalDigits(integer);
	FillHPPPTileBuffer(arg1, 0, fraction);
}

/// $C20F26
void FillCharacterPPTileBuffer(short arg1, ubyte* afflictions, short integer, short fraction) {
	if (afflictions[4] != 0) {
		FillHPPPTileBufferX(arg1);
		return;
	}
	SeparateDecimalDigits(integer);
	FillHPPPTileBuffer(arg1, 1, fraction);
}

/// $C20F58
uint UnknownC20F58() {
	if (Unknown7E9695 != 0) {
		return Unknown7E9627 >> 1;
	} else {
		return Unknown7E9627;
	}
}

/// $C20F9A
void ResetRolling() {
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if ((PartyCharacters[gameState.partyMembers[i] - 1].afflictions[0] != 1) && (PartyCharacters[gameState.partyMembers[i] - 1].hp.current.integer == 0)) {
			PartyCharacters[gameState.partyMembers[i] - 1].hp.target = 1;
		}
		if ((PartyCharacters[gameState.partyMembers[i] - 1].hp.current.fraction != 0) && (PartyCharacters[gameState.partyMembers[i] - 1].hp.current.integer > PartyCharacters[gameState.partyMembers[i] - 1].hp.target)) {
			PartyCharacters[gameState.partyMembers[i] - 1].hp.target = PartyCharacters[gameState.partyMembers[i] - 1].hp.current.integer;
		}
		if ((PartyCharacters[gameState.partyMembers[i] - 1].pp.current.fraction != 0) && (PartyCharacters[gameState.partyMembers[i] - 1].pp.current.integer > PartyCharacters[gameState.partyMembers[i] - 1].pp.target)) {
			PartyCharacters[gameState.partyMembers[i] - 1].pp.target = PartyCharacters[gameState.partyMembers[i] - 1].pp.current.integer;
		}
	}
	Unknown7E9696 = 1;
}

/// $C21034
short UnknownC21034() {
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if ((PartyCharacters[gameState.partyMembers[i] - 1].hp.current.fraction != 0)
			|| (PartyCharacters[gameState.partyMembers[i] - 1].pp.current.fraction != 0)
			|| (PartyCharacters[gameState.partyMembers[i] - 1].hp.current.integer != PartyCharacters[gameState.partyMembers[i] - 1].hp.target)
			|| (PartyCharacters[gameState.partyMembers[i] - 1].pp.current.integer != PartyCharacters[gameState.partyMembers[i] - 1].pp.target)) {
			return 0;
		}
	}
	return 1;
}

/// $C2108C
short UnknownC2108C() {
	short a = UnknownC21034();
	if (a != 0) {
		Unknown7E9696 = 0;
	}
	return a;
}

/// $C2109F
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

/// $C213AC
void UnknownC213AC();

/// $C21628
short getEventFlag(short flag) {
	flag--;
	if ((PowersOfTwo8Bit[flag % 8] & EventFlags[flag / 8]) != 0) {
		return 1;
	}
	return 0;
}

/// $C2165E
short setEventFlag(short flag, short value) {
	flag--;
	if (value == 1) {
		EventFlags[flag / 8] |= PowersOfTwo8Bit[flag % 8];
	} else {
		EventFlags[flag / 8] &= (PowersOfTwo8Bit[flag % 8] ^ 0xFF);
	}
	return EventFlags[flag / 8];
}

/// $C216DB
void UnknownC216DB() {
	ubyte x18 = 0;
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		PartyCharacter* x15 = &PartyCharacters[gameState.partyMembers[i]];
		for (short j = 0; (j < 14) && (x15.items[j] != 0); j++) {
			if (ItemData[x15.items[j]].type != 4) {
				continue;
			}
			if (x18 != 0) {
				if (ItemData[x18].parameters.ep > ItemData[x15.items[j]].parameters.ep) {
					x18 = x15.items[j];
				}
			}
		}
	}
	if (x18 != 0) {
		if (UnknownC2239D(ItemData[x18].parameters.strength) != 0) {
			return;
		}
		RemoveCharFromParty(PartyMember.TeddyBear);
		RemoveCharFromParty(PartyMember.PlushTeddyBear);
		AddCharToParty(ItemData[x18].parameters.strength);
	} else {
		RemoveCharFromParty(PartyMember.TeddyBear);
		RemoveCharFromParty(PartyMember.PlushTeddyBear);
	}
}

/// $C21857
void RecalcCharacterPostmathOffense(short id) {
	short total = PartyCharacters[id - 1].base_offense;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] - 1]].parameters.raw[((id - 1) == 3) ? 1 : 0];
	}
	if (0 >= total) {
		total = 0;
	} else if (total > 0xFF) {
		total = 0xFF;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	PartyCharacters[id - 1].offense = cast(ubyte)total;
}

/// $C2192B
void RecalcCharacterPostmathDefense(short id) {
	short total = PartyCharacters[id - 1].base_defense;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].parameters.raw[((id - 1) == 3) ? 1 : 0];
	}
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] - 1]].parameters.raw[((id - 1) == 3) ? 1 : 0];
	}
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].parameters.raw[((id - 1) == 3) ? 1 : 0];
	}
	if (0 >= total) {
		total = 0;
	} else if (total > 0xFF) {
		total = 0xFF;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	PartyCharacters[id - 1].defense = cast(ubyte)total;
}

/// $C21AEB
void RecalcCharacterPostmathSpeed(short id) {
	short total = PartyCharacters[id - 1].base_speed;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].parameters.ep;
	}
	total += PartyCharacters[id - 1].boosted_speed;
	if (0 >= total) {
		total = 0;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	PartyCharacters[id - 1].speed = cast(ubyte)total;
}

/// $C21BA4
void RecalcCharacterPostmathGuts(short id) {
	short total = PartyCharacters[id - 1].base_guts;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] - 1]].parameters.ep;
	}
	total += PartyCharacters[id - 1].boosted_guts;
	if (0 >= total) {
		total = 0;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	PartyCharacters[id - 1].guts = cast(ubyte)total;
}

/// $C21C5D
void RecalcCharacterPostmathLuck(short id) {
	short total = PartyCharacters[id - 1].base_luck;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] - 1]].parameters.ep;
	}
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].parameters.ep;
	}
	total += PartyCharacters[id - 1].boosted_luck;
	if (0 >= total) {
		total = 0;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	PartyCharacters[id - 1].luck = cast(ubyte)total;
}

/// $C21D65
void RecalcCharacterPostmathVitality(short id) {
	PartyCharacters[id - 1].vitality = cast(ubyte)(PartyCharacters[id - 1].base_vitality + PartyCharacters[id - 1].boosted_vitality);
}

/// $C21D7D
void RecalcCharacterPostmathIQ(short id) {
	PartyCharacters[id - 1].iq = cast(ubyte)(PartyCharacters[id - 1].base_iq + PartyCharacters[id - 1].boosted_iq);
}

/// $C21D7D
void RecalcCharacterMissRate(short id) {
	PartyCharacters[id - 1].miss_rate = cast(ubyte)((PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] != 0) ? ItemData[PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] - 1].parameters.special : 0);
}

/// $C21E03
void CalcResistances(short id) {
	short total;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].parameters.special & 3 : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].parameters.special & 3 : 0;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].fireResist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].parameters.special & 0xC : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].parameters.special & 0xC : 0;
	total >>= 2;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].freezeResist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].parameters.special & 0x30 : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].parameters.special & 0x30 : 0;
	total >>= 4;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].flashResist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].parameters.special & 0xC0 : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].parameters.special & 0xC0 : 0;
	total >>= 6;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].paralysisResist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] - 1]].parameters.special : 0;
	PartyCharacters[id - 1].hypnosisBrainshockResist = cast(ubyte)total;
}

/// $C2239D
short UnknownC2239D(short id) {
	for (short i = 0; i < gameState.partyCount; i++) {
		if (gameState.partyMembers[i] == id) {
			return id;
		}
	}
	return 0;
}

/// $C223D9
short UnknownC223D9(ubyte* arg1, short arg2) {
	short x0E;
	if (arg1[0] != 0) {
		x0E = 0;
	} else {
		if (arg1[3] != 0) {
			x0E = 3;
		} else {
			for (x0E = 1; x0E < 7; x0E++) {
				if (arg1[x0E] != 0) {
					goto lx;
				}
			}
			if (arg2 == 0) {
				return 32;
			} else {
				return 7;
			}
		}
	}
	lx:
	if (arg2 != 0) {
		return StatusEquipWindowText[x0E][arg2 - 1];
	} else {
		return StatusEquipWindowText2[x0E][arg2 - 1];
	}
}

/// $C22474
short UnknownC22474(ubyte* arg1) {
	short x0E;
	if (arg1[0] != 0) {
		x0E = 0;
	} else if (arg1[3] != 0) {
		x0E = 3;
	} else {
		for (x0E = 1; x0E < 7; x0E++) {
			if (arg1[x0E] != 0) {
				goto found;
			}
		}
		return 4;
	}
	found:
	return StatusEquipWindowText3[x0E][arg1[x0E] - 1];
}

/// $C227C8
void LearnSpecialPSI(short id) {
	switch (id) {
		case 1:
			gameState.partyPSI |= PartyPSIFlags.TeleportAlpha;
			break;
		case 2:
			gameState.partyPSI |= PartyPSIFlags.TeleportBeta;
			break;
		case 3:
			gameState.partyPSI |= PartyPSIFlags.StarstormAlpha;
			break;
		case 4:
			gameState.partyPSI |= PartyPSIFlags.StarstormBeta;
			break;
		default: break;
	}
}

/// $C2281D - Deposits money into your bank account
/// Returns: amount of money successfully deposited
uint DepositIntoATM(uint amount) {
	uint x0A = gameState.bankBalance + amount;
	uint x06 = 9999999;
	if (x0A <= x06) {
		x06 = x0A;
	}
	gameState.bankBalance = x06;
	return amount - (x0A - gameState.bankBalance);
}

/// $C228F8
void AddCharToParty(short id) {
	for (short i = 0; 6 > i; i++) {
		if (gameState.partyMembers[i] == id) {
			return;
		}
		if ((gameState.partyMembers[i] <= id) && (gameState.partyMembers[i] != 0)) {
			continue;
		}
		short j;
		for (j = i; gameState.partyMembers[j] != 0; j++) {
			if (6 <= j) {
				return;
			}
		}
		while(j > i) {
			gameState.partyMembers[j] = gameState.partyMembers[--j];
		}
		gameState.partyMembers[i] = cast(ubyte)id;
		EntityTickCallbackFlags[UnknownC0369B(id)] |= (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
		if (id <= 4) {
			UnknownC216DB();
			UnknownC3EBCA();
		}
		return;
	}
}

/// $C229BB
void RemoveCharFromParty(short id) {
	for (short i = 0; gameState.partyCount > i; i++) {
		if (gameState.partyMembers[i] != id) {
			continue;
		}
		while (6 > i) {
			gameState.partyMembers[i] = gameState.partyMembers[i + 1];
			i++;
		}
		i--;
		gameState.partyMembers[i] = 0;
		UnknownC03903(id);
		if (id <= 4) {
			UnknownC216DB();
			UnknownC3EBCA();
		}
		return;
	}
}

/// $C22A2C
void SaveCurrentGame() {
	SaveGameSlot(CurrentSaveSlot - 1);
}

/// $C23109
immutable ConsolationPrize[2] ConsolationItemTable = [
	ConsolationPrize(EnemyID.CuteLilUFO, [ItemID.Cookie,ItemID.BagOfFries, ItemID.Hamburger, ItemID.BoiledEgg, ItemID.FreshEgg, ItemID.PicnicLunch, ItemID.Pizza, 0]),
	ConsolationPrize(EnemyID.BeautifulUFO, [ItemID.CanOfFruitJuice, ItemID.RoyalIcedTea, ItemID.ProteinDrink, ItemID.KrakenSoup, ItemID.BottleOfWater, ItemID.ColdRemedy, ItemID.VialOfSerum, 0]),
];

/// $C2311B
short BattleSelectionMenu(short, short);

/// $C23B66
ubyte* CopyEnemyName(const(ubyte)* arg1, ubyte* arg2, short arg3) {
	while (arg3-- != 0) {
		if (arg1[0] == 0) {
			break;
		}
		if (arg1[0] == EBChar('|')) {
			for (short i = 0; i < PartyCharacter.name.length; i++) {
				(arg2++)[0] = PartyCharacters[0].name[i];
			}
		} else {
			(arg2++)[0] = arg1[0];
		}
		arg1++;
	}
	arg2[0] = 0;
	return arg2;
}

/// $C23BCF
void FixAttackerName(short arg1) {
	Unknown7E5E77 = 0;
	memset(&AttackerNameAdjustScratch[0], 0, 28);
	if ((currentAttacker.allyOrEnemy == 1) || (currentAttacker.npcID != 0)) {
		ubyte* x14 = CopyEnemyName(&EnemyConfigurationTable[currentAttacker.id].name[0], &AttackerNameAdjustScratch[0], 25);
		if ((currentAttacker.allyOrEnemy == 1) && (arg1 == 0)) {
			if ((currentAttacker.theFlag != 1) || (UnknownC2B66A(currentAttacker.unknown76) != 2)) {
				x14[0] = EBChar(' ');
				Unknown7E5E77 = 1;
				x14[1] = cast(ubyte)(currentAttacker.theFlag + 0x70);
			}
		}
		if (currentAttacker.id == EnemyID.MyPet) {
			memcpy(&AttackerNameAdjustScratch[0], &gameState.petName[0], 6);
			AttackerNameAdjustScratch[6] = 0;
		}
		UnknownC1AC4AF(&AttackerNameAdjustScratch[0], 27);
		Unknown7E9658 = currentAttacker.id;
	} else {
		if (currentAttacker.id <= 4) {
			UnknownC1AC4AF(&PartyCharacters[currentTarget.row].name[0], PartyCharacter.name.length);
		}
	}
}

/// $C23D05
void FixTargetName() {
	Unknown7E5E78 = 0;
	memset(&TargetNameAdjustScratch[0], 0, TargetNameAdjustScratch.length);
	if ((currentTarget.allyOrEnemy == 1) || (currentTarget.npcID != 0)) {
		ubyte* x14 = CopyEnemyName(&EnemyConfigurationTable[currentTarget.id].name[0], &TargetNameAdjustScratch[0], 25);
		if ((currentTarget.allyOrEnemy == 1) && ((currentTarget.theFlag != 1)  ||(UnknownC2B66A(currentTarget.unknown76) != 2))) {
			x14[0] = EBChar(' ');
			Unknown7E5E78 = 1;
			x14[1] = cast(ubyte)(currentTarget.theFlag + 0x70);
		}
		if (currentTarget.id == EnemyID.MyPet) {
			memcpy(&TargetNameAdjustScratch[0], &gameState.petName[0], gameState.petName.length);
			TargetNameAdjustScratch[gameState.petName.length] = 0;
		}
		UnknownC1ACA1F(&TargetNameAdjustScratch[0], 27);
		Unknown7E965A = currentTarget.id;
	} else {
		if (currentTarget.id <= 4) {
			UnknownC1ACA1F(&PartyCharacters[currentTarget.row].name[0], PartyCharacter.name.length);
		}
	}
}

/// $C23E32
void UnknownC23E32() {
	if (BattlerTargetFlags == 0) {
		return;
	}
	short i;
	for (i = 0; i < BattlersTable.length; i++) {
		if (IsCharacterTargetted(i) != 0) {
			break;
		}
	}
	currentTarget = &BattlersTable[i];
	FixTargetName();
}

/// $C23FEA
short GetShieldTargetting(short arg1, Battler* battler) {
	if ((arg1 == BattleActions.PSIShieldSigma) || (arg1 == BattleActions.PSIShieldOmega) || (arg1 == BattleActions.PSIPSIShieldSigma) || (arg1 == BattleActions.PSIPSIShieldOmega)) {
		return 1;
	}
	return 0;
}

/// $C24009
void FeelingStrangeRetargetting() {
	BattlerTargetFlags = 0;
	switch (currentAttacker.unknown9 & 7) {
		case 1:
			TargetAll();
			BattlerTargetFlags = RandomTargetting(BattlerTargetFlags);
			break;
		case 2:
			TargetRow(rand() % 3);
			break;
		case 4:
			if ((rand() & 1) != 0) {
				TargetAllies();
			} else {
				TargetAllEnemies();
			}
			if ((GetShieldTargetting(currentAttacker.currentAction, currentAttacker) == 0) && (currentAttacker.allyOrEnemy == 0)) {
				RemoveNPCTargetting();
			}
			break;
		default: break;
	}
}

/// $C240A4
void UnknownC240A4(void function() action) {
	while (UnknownC2EACF() != 0) {
		Win_Tick();
	}
	for (short i = 8; i < BattlersTable.length; i++) {
		currentTarget = &BattlersTable[i];
		if (IsCharacterTargetted(i) == 0) {
			continue;
		}
		FixTargetName();
		if (action is null) {
			continue;
		}
		action();
	}
	for (short i = 0; i < 8; i++) {
		currentTarget = &BattlersTable[i];
		if (IsCharacterTargetted(i) == 0) {
			continue;
		}
		FixTargetName();
		if (action is null) {
			continue;
		}
		action();
	}
}

/// $C2416F
void RemoveStatusUntargettableTargets() {
	for (short i = 0; DeadTargettableActions[i] != 0; i++) {
		if (currentAttacker.currentAction == DeadTargettableActions[i]) {
			return;
		}
	}
	for (short i = 0; i < BattlersTable.length; i++) {
		if (IsCharacterTargetted(i) == 0) {
			continue;
		}
		if ((BattlersTable[i].consciousness == 0) || (BattlersTable[i].afflictions[0] == Status0.Unconscious) || (BattlersTable[i].afflictions[0] == Status0.Diamondized)) {
			RemoveTarget(i);
		}
	}
}

/// $C241DC
ubyte FindStealableItems() {
	ubyte x18 = 0;
	for (short i = 0; i < 6; i++) {
		short x14 = gameState.partyMembers[i];
		if (x14 < 1) {
			continue;
		}
		if (x14 >= 4) {
			continue;
		}
		short x10;
		for (short j = 0; j < 6; j++) {
			if (BattlersTable[j].consciousness == 0) {
				continue;
			}
			if (BattlersTable[j].id == x14) {
				continue;
			}
			if (BattlersTable[j].npcID != 0) {
				continue;
			}
			x10 = BattlersTable[i].unknown7;
		}
		for (short j = 0; j < 14; j++) {
			if (j + 1 == x10) {
				continue;
			}
			if (PartyCharacters[x14 - 1].items[j] == 0) {
				continue;
			}
			if (ItemData[PartyCharacters[x14 - 1].items[j]].cost == 0) {
				continue;
			}
			if (ItemData[PartyCharacters[x14 - 1].items[j]].cost >= 290) {
				continue;
			}
			if ((ItemData[PartyCharacters[x14 - 1].items[j]].type & 0x30) != 0x20) {
				continue;
			}
			if (PartyCharacters[x14 - 1].equipment[0] == j + 1) {
				continue;
			}
			if (PartyCharacters[x14 - 1].equipment[1] == j + 1) {
				continue;
			}
			if (PartyCharacters[x14 - 1].equipment[2] == j + 1) {
				continue;
			}
			if (PartyCharacters[x14 - 1].equipment[3] == j + 1) {
				continue;
			}
			Unknown7EA9D4[x18] = PartyCharacters[x14 - 1].items[j];
			x18++;
		}
	}
	return x18;
}

/// $C24316
ubyte SelectStealableItem() {
	short x0E = FindStealableItems();
	if (x0E == 0) {
		return 0;
	}
	if ((rand() & 0x80) != 0) {
		return 0;
	}
	return Unknown7EA9D4[RandLimit(x0E)];
}

/// $C24348
short UnknownC24348(short arg1) {
	short x02 = FindStealableItems();
	for (short i = 0; i < x02; i++) {
		if (Unknown7EA9D4[i] != arg1) {
			continue;
		}
		return 1;
	}
	return 0;
}

/// $C2437E
void UnknownC2437E() {
	if (currentAttacker.allyOrEnemy != 0) {
		return;
	}
	if (currentAttacker.npcID != 0) {
		return;
	}
	if (currentAttacker.unknown7 == 0) {
		return;
	}
	if (PartyCharacters[currentAttacker.id].items[currentAttacker.unknown7] != currentAttacker.currentActionArgument) {
		return;
	}
	if ((ItemData[PartyCharacters[currentAttacker.id].items[currentAttacker.unknown7]].flags & ItemFlags.ConsumedOnUse) == 0) {
		return;
	}
	if (UnknownC3EE14(currentAttacker.id, currentAttacker.currentActionArgument) == 0) {
		return;
	}
	RemoveItemFromInventoryF(currentAttacker.id, currentAttacker.unknown7);
}

/// $C24477
void ChooseTarget(Battler*);

/// $C24703
void UnknownC24703(Battler* battler) {
	BattlerTargetFlags = 0;
	switch (battler.unknown9) {
		case 1:
			TargetBattler(battler.currentTarget - 1);
			break;
		case 2:
		case 4:
			TargetAllies();
			if ((GetShieldTargetting(battler.currentAction, battler) == 0) && (battler.allyOrEnemy == 0)) {
				RemoveNPCTargetting();
			}
			RemoveStatusUntargettableTargets();
			break;
		case 11:
			if (battler.currentTarget > Unknown7EAD56) {
				TargetBattler(Unknown7EAD82[battler.currentTarget - Unknown7EAD56 - 1]);
			} else {
				TargetBattler(Unknown7EAD7A[battler.currentTarget - 1]);
			}
			if (battler.currentAction == BattleActions.PSIHealingOmega) {
				for (short i = 8; i < BattlersTable.length; i++) {
					if (BattlersTable[i].consciousness == 0) {
						continue;
					}
					if (BattlersTable[i].afflictions[0] == Status0.Unconscious) {
						continue;
					}
					BattlerTargetFlags = 0;
					TargetBattler(i);
					break;
				}
			}
			break;
		case 12:
			TargetRow(battler.currentTarget);
			RemoveNPCTargetting();
			RemoveStatusUntargettableTargets();
			break;
		case 14:
			TargetAllEnemies();
			if (battler.allyOrEnemy == 0) {
				RemoveNPCTargetting();
			}
			RemoveStatusUntargettableTargets();
			break;
		default: break;
	}
}

/// $C24821
short BattleRoutine() {
	short x17;
	ushort x23;
	ushort x25;
	ushort x27;
	ushort x29;
	ushort x2B;
	ushort x2D;
	short x33;
	short x35;
	if (BattleDebug == 0) {
		x35 = 1;
		x33 = 1;
		gameState.playerControlledPartyMemberCount = 1;
		memset(&gameState.partyMembers[0], 0, 6);
		memset(&gameState.unknown96[0], 0, 6);
		gameState.partyMembers[0] = 1;
		gameState.unknown96[0] = 1;
		EnemiesInBattle = 1;
		CurrentBattleGroup = 1;
		Unknown7E9F8C[0] = BattleEntryPointerTable[0].enemies[0].enemyID;
	}
	CurrentGiygasPhase = 0;
	if (CurrentBattleGroup == 0x1DB) {
		CurrentGiygasPhase = GiygasPhase.BattleStarted;
	}
	x2D = BattleEntryBGTable[CurrentBattleGroup].layer1;
	x2B = BattleEntryBGTable[CurrentBattleGroup].layer2;
	x29 = cast(ushort)BattleEntryPointerTable[CurrentBattleGroup].letterboxStyle;
	infiniteBattleLoop: do {
		ushort x1D;
		MirrorEnemy = 0;
		x27 = 0;
		Unknown7EA97C = 0;
		x25 = 0;
		BattleMoneyScratch = 0;
		BattleEXPScratch = 0;
		UnknownC08726();
		UnknownC2E0E7();
		LoadEnemyBattleSprites();
		LoadWindowGraphics();
		UnknownC44963(1);
		LoadBattleBG(x2D, x2B, x29);
		UnknownC2EEE7();
		for (short i = 0; i < BattlersTable.length; i++) {
			memset(&BattlersTable[i], 0, Battler.sizeof);
		}
		Unknown7EAA0C = 0;
		x23 = 0;
		for (short i = 0; i < 6; i++ ) {
			if ((gameState.partyMembers[i] != 0) && (gameState.partyMembers[i] <= 4)) {
				BattleInitPlayerStats(gameState.partyMembers[i], &BattlersTable[i]);
			} else if (gameState.partyMembers[i] >= 5) {
				BattleInitEnemyStats(NPCAITable[gameState.partyMembers[i]].enemyID, &BattlersTable[i]);
				BattlersTable[i].allyOrEnemy = 0;
				BattlersTable[i].npcID = gameState.partyMembers[i];
				BattlersTable[i].row = cast(ubyte)x23;
				BattlersTable[i].hpTarget = gameState.partyNPCHP[x23];
				BattlersTable[i].hp = gameState.partyNPCHP[x23];
				BattlersTable[i].ppTarget = 0;
				BattlersTable[i].pp = 0;
				x23++;
			}
		}
		UnknownC2F0D1();
		for (short i = 0; i < EnemiesInBattle; i++) {
			BattleInitEnemyStats(Unknown7E9F8C[i], &BattlersTable[i + 8]);
		}
		UnknownC2F121();
		UnknownC2F8F9();
		UnknownC47F87();
		UnknownC0856B(0x18);
		BattleModeFlag = 1;
		ChangeMusic(EnemyConfigurationTable[Unknown7E9F8C[0]].music);
		UnknownC08744();
		FadeIn(1, 1);
		if (BattleDebug == 0) {
			UnknownC1DCCB(x35);
			short x02 = 0;
			for (short i = 0; i < 6; i++) {
				if ((gameState.partyMembers[i] != 0) && (gameState.partyMembers[i] <= 4)) {
					BattleInitPlayerStats(gameState.partyMembers[i], &BattlersTable[i]);
				} else if (gameState.partyMembers[i] >= 5) {
					if ((NPCAITable[gameState.partyMembers[i]].targettability & 1) != 0) {
						BattleInitEnemyStats(NPCAITable[gameState.partyMembers[i]].enemyID, &BattlersTable[i]);
						BattlersTable[i].row = cast(ubyte)x02;
						BattlersTable[i].hpTarget = gameState.partyNPCHP[x02];
						BattlersTable[i].hp = gameState.partyNPCHP[x02];
						BattlersTable[i].ppTarget = 0;
						BattlersTable[i].pp = 0;
						BattlersTable[i].allyOrEnemy = 0;
						BattlersTable[i].npcID = gameState.partyMembers[i];
					}
				}
			}
			ShowHPPPWindowsF();
			Win_Tick();
			while (true) {
				WaitUntilNextFrame();
				UnknownC2DB3F();
				if ((pad_press[0] & PAD_START) != 0) {
					break;
				}
				if ((pad_press[0] & PAD_SELECT) != 0) {
					CurrentBattleGroup = EnemySelectMode(CurrentBattleGroup);
					x2D = BattleEntryBGTable[CurrentBattleGroup].layer1;
					x2B = BattleEntryBGTable[CurrentBattleGroup].layer2;
					x29 = cast(ushort)BattleEntryPointerTable[CurrentBattleGroup].letterboxStyle;
				} else if (((pad_held[0] & PAD_RIGHT) != 0) && (x33 < 0xF)) {
					x33++;
				} else if (((pad_held[0] & PAD_LEFT) != 0) && (x33 > 1)) {
					x33--;
				} else if (((pad_held[0] & PAD_DOWN) != 0) && (x35 > 1)) {
					x35--;
				} else if (((pad_held[0] & PAD_UP) != 0) && (x35 < 99)) {
					x35++;
				} else if ((pad_press[0] & PAD_X) != 0) {
					x35 = Unknown7EAA0C;
				} else {
					if ((pad_press[0] & PAD_A) != 0) {
						ShowPSIAnimation(Unknown7EAA70);
						if (++Unknown7EAA70 == 0x22) {
							Unknown7EAA70 = 0;
						}
					}
					if ((pad_press[0] & PAD_B) != 0) {
						UnknownC4A67E(Unknown7EAA72, Unknown7EAA74);
						if (++Unknown7EAA72 == 8) {
							Unknown7EAA72 = 0;
							Unknown7EAA74 = (Unknown7EAA74 + 1) & 3;
						}
					}
					continue;
				}
				short x = 0;
				if ((x33 & 1) != 0) {
					gameState.partyMembers[x] = 1;
					x = 1;
				}
				if ((x33 & 2) != 0) {
					gameState.partyMembers[x] = 2;
					x++;
				}
				if ((x33 & 4) != 0) {
					gameState.partyMembers[x] = 3;
					x++;
				}
				if ((x33 & 8) != 0) {
					gameState.partyMembers[x] = 4;
					x++;
				}
				gameState.playerControlledPartyMemberCount = cast(ubyte)x;
				for (short i = x; i < 6; i++) {
					gameState.partyMembers[i] = 0;
				}
			}
			ChangeMusic(EnemyConfigurationTable[Unknown7E9F8C[0]].music);
		}
		if (getEventFlag(EventFlag.BUZZ_BUZZ_IN_PARTY) != 0) {
			BattleInitEnemyStats(EnemyID.BuzzBuzz, &BattlersTable[6]);
			BattlersTable[6].row = 1;
			BattlersTable[6].allyOrEnemy = 0;
			BattlersTable[6].npcID = EnemyID.BuzzBuzz;
		}
		for (short i = 0; i < 6; i++) {
			if ((gameState.partyMembers[i] != 0) && (gameState.partyMembers[i] <= 4)) {
				if (PartyCharacters[gameState.partyMembers[i] - 1].afflictions[1] == Status1.Possessed) {
					BattleInitEnemyStats(EnemyID.TinyLilGhost, &BattlersTable[6]);
					BattlersTable[6].npcID = EnemyID.TinyLilGhost;
				}
			}
		}
		ShowHPPPWindowsF();
		short x2F = Unknown7E9F8C[RandLimit(EnemiesInBattle)];
		ItemDropped = EnemyConfigurationTable[x2F].itemDropped;
		switch (EnemyConfigurationTable[x2F].itemDropRate) {
			case 0:
				if ((rand() & 0x7F) != 0) {
					ItemDropped = 0;
				}
				break;
			case 1:
				if ((rand() & 0x3F) != 0) {
					ItemDropped = 0;
				}
				break;
			case 2:
				if ((rand() & 0x1F) != 0) {
					ItemDropped = 0;
				}
				break;
			case 3:
				if ((rand() & 0x0F) != 0) {
					ItemDropped = 0;
				}
				break;
			case 5:
				if ((rand() & 0x03) != 0) {
					ItemDropped = 0;
				}
				break;
			case 6:
				if ((rand() & 0x01) != 0) {
					ItemDropped = 0;
				}
				break;
			default: break;
		}
		if (ItemDropped == 0) {
			for (short i = 0; i < ConsolationItemTable.length; i++) {
				for (short j = 8; j < BattlersTable.length; j++) {
					if (BattlersTable[j].consciousness == 0) {
						continue;
					}
					if (ConsolationItemTable[i].enemy != BattlersTable[j].id) {
						continue;
					}
					ItemDropped = ConsolationItemTable[i].items[RandLimit(7)];
				}
			}
		}
		x1D = Initiative.Normal;
		switch (BattleInitiative) {
			case 0:
				break;
			case 1:
				x1D = Initiative.PartyFirst;
				break;
			case 2:
				x1D = Initiative.EnemiesFirst;
				break;
			default: break;
		}
		BattleInitiative = 0;
		CreateWindow(Window.TextBattle);
		currentAttacker = &BattlersTable[8];
		FixAttackerName(1);
		DisplayInBattleText(EnemyConfigurationTable[Unknown7E9F8C[0]].encounterTextPointer);
		if (x1D == Initiative.PartyFirst) {
			DisplayInBattleText(TextBattleSurpriseOpeningAttack);
		}
		for (short i = 0; i < EnemiesInBattle; i++) {
			currentTarget = &BattlersTable[i];
			FixTargetName();
			if (currentTarget.afflictions[2] == Status2.Asleep) {
				DisplayInBattleText(TextBattleFallenAsleepIndirect);
			}
			if (currentTarget.afflictions[4] != 0) {
				DisplayInBattleText(TextBattleStoppedBeingAbleToConcentrate);
			}
			if (currentTarget.afflictions[3] == Status3.Strange) {
				DisplayInBattleText(TextBattleActingALittleStrange);
			}
		}
		CloseFocusWindow();
		x23 = 0;
		Unknown7EAA0E = x23;
		turnLoop: while (x23 == 0) {
			x25++;
			UnknownC2F917();
			for (short i = 0; i < BattlersTable.length; i++) {
				BattlersTable[i].hasTakenTurn = 0;
				if (BattlersTable[i].consciousness == 0) {
					continue;
				}
				BattlersTable[i].initiative = cast(ubyte)FiftyPercentVariance(BattlersTable[i].speed);
				if (BattlersTable[i].initiative == 0) {
					BattlersTable[i].initiative = 1;
				}
			}
			for (short i = 0; i < 4; i++) {
				PartyCharacters[i].unknown94 = 0;
			}
			short x19 = 0;
			for (short i = 0; i < 6; i++) {
				short x1F;
				CheckDeadPlayers();
				if (CountChars(0) == 0) {
					CreateWindow(Window.TextBattle);
					goto Unknown225;
				}
				if ((gameState.partyMembers[i] != 0) && (gameState.partyMembers[i] <= 4)) {
					if ((x1D != Initiative.EnemiesFirst) && (x1D != Initiative.RunningAway) && (x1D != Initiative.RunningAlwaysSuccessful)) {
						if ((gameState.partyMembers[i] != 4) || (MirrorEnemy == 0)) {
							if ((PartyCharacters[gameState.partyMembers[i]].afflictions[0] == Status0.Unconscious) || (PartyCharacters[gameState.partyMembers[i]].afflictions[0] == Status0.Diamondized) || (PartyCharacters[gameState.partyMembers[i]].afflictions[2] == Status2.Asleep) || (PartyCharacters[gameState.partyMembers[i]].afflictions[2] == Status2.Solidified)) {
								x1F = BattleActions.NoEffect;
								Unknown7EA97C = 0;
							}
						}
					} else {
						UnknownC43573F(i);
						x1F = BattleSelectionMenu(gameState.partyMembers[i], x19);
						UnknownC3E6F8F();
						CloseFocusWindow();
						if ((BattleDebug != 0) && (x1F == -1)) {
							x17 = 0;
							break turnLoop;
						}
						if (x1F == BattleActions.RunAway) {
							x1F = BattleActions.UseNoEffect;
							if (x1D == Initiative.PartyFirst) {
								x1D = Initiative.RunningAlwaysSuccessful;
							} else {
								x1D = Initiative.RunningAway;
							}
							x27 = 1;
						}
						if (x1F == -1) {
							continue infiniteBattleLoop;
						}
						if (x1F == 0) {
							if (i == 0) {
								continue;
							}
							x19--;
							i = Unknown7EAA66[x19];
							continue;
						}
						Unknown7EAA66[x19] = i;
						x19++;
						if (x1F == 1) {
							x1F = 0;
						}
					}
					for (short j = 0; j < BattlersTable.length; j++) {
						if (BattlersTable[j].consciousness == 0) {
							continue;
						}
						if (BattlersTable[j].allyOrEnemy == 0) {
							continue;
						}
						if (gameState.partyMembers[i] == BattlersTable[j].id) {
							continue;
						}
						BattlersTable[j].currentAction = x1F;
						if (Unknown7EA97C != 0) {
							BattlersTable[j].unknown7 = Unknown7EA97D.unknown1;
							BattlersTable[j].currentActionArgument = Unknown7EA97C;
						} else {
							BattlersTable[j].unknown7 = 0;
							BattlersTable[j].currentActionArgument = Unknown7EA97D.unknown1;
						}
						BattlersTable[j].unknown9 = Unknown7EA97D.unknown4;
						BattlersTable[j].currentTarget = Unknown7EA97D.unknown5;
						if (Unknown7EA97D.unknown4 == 1) {
							for (short k = 0; k < 6; k++) {
								if (BattlersTable[k].consciousness == 0) {
									continue;
								}
								if (Unknown7EA97D.unknown5 == BattlersTable[k].id) {
									continue;
								}
								BattlersTable[j].currentTarget = cast(ubyte)k;
								break;
							}
						}
						if (BattlersTable[j].currentAction == BattleActions.Guard) {
							BattlersTable[j].guarding = 1;
						} else {
							BattlersTable[j].guarding = 0;
						}
						break;
					}
				}
			}
			for (short i = 0; i < BattlersTable.length; i++) {
				if (((BattlersTable[i].consciousness == 0) || (BattlersTable[i].allyOrEnemy != 1)) && (BattlersTable[i].npcID == 0)) {
					if (BattlersTable[i].id != 4) {
						continue;
					}
					if (MirrorEnemy == 0) {
						continue;
					}
				}
				if (((x1D != Initiative.PartyFirst) || (x1D != Initiative.RunningAlwaysSuccessful)) && (BattlersTable[i].allyOrEnemy == 1)) {
					BattlersTable[i].currentAction = 0;
					continue;
				}
				if ((x1D == 2) && (BattlersTable[i].allyOrEnemy == 0)) {
					BattlersTable[i].currentAction = 0;
					continue;
				}
				while (true) {
					const(Enemy)* x06;
					if ((BattlersTable[i].allyOrEnemy == 0) && (BattlersTable[i].id == 4)) {
						x06 = &EnemyConfigurationTable[MirrorEnemy];
					} else {
						x06 = &EnemyConfigurationTable[BattlersTable[i].id];
					}
					short x21;
					switch (x06.actionOrder) {
						case 0:
							x21 = rand() & 3;
							break;
						case 1:
							switch (rand() & 7) {
								case 0:
									x21 = 3;
									break;
								case 1:
									x21 = 2;
									break;
								case 2:
								case 3:
									x21 = 1;
									break;
								default:
									x21 = 0;
									break;
							}
							break;
						case 2:
							x21 = BattlersTable[i].actionOrderVar;
							BattlersTable[i].actionOrderVar = (BattlersTable[i].actionOrderVar + 1) & 3;
							break;
						case 3:
							x21 = (BattlersTable[i].actionOrderVar * 2) + (rand() & 1);
							BattlersTable[i].actionOrderVar = (BattlersTable[i].actionOrderVar + 1) & 1;
							break;
						default: break;
					}
					BattlersTable[i].currentAction = x06.actions[x21];
					BattlersTable[i].currentActionArgument = x06.actionArgs[x21];
					if (BattlersTable[i].currentAction != BattleActions.EnemyExtender) {
						break;
					}
					if ((BattlersTable[i].allyOrEnemy == 0) && (BattlersTable[i].id == 4)) {
						MirrorEnemy = BattlersTable[i].currentActionArgument;
						continue;
					}
					BattlersTable[i].id = BattlersTable[i].currentActionArgument;
				}
				if (BattlersTable[i].currentAction == BattleActions.Steal) {
					BattlersTable[i].currentActionArgument = SelectStealableItem();
					BattlersTable[i].initiative = 0;
				}
				if (BattlersTable[i].currentAction == BattleActions.Guard) {
					BattlersTable[i].guarding = 1;
				} else {
					BattlersTable[i].guarding = 0;
				}
				ChooseTarget(&BattlersTable[i]);
			}
			CreateWindow(Window.TextBattle);
			if (x1D == Initiative.EnemiesFirst) {
				DisplayInBattleText(TextBattleEnemysOpeningAttack);
			}
			if (x27 != 0) {
				short x04;
				short x1B;
				for (short i = 0; i < BattlersTable.length; i++) {
					if (BattlersTable[i].consciousness == 0) {
						continue;
					}
					if (BattlersTable[i].npcID != 0) {
						continue;
					}
					if (BattlersTable[i].allyOrEnemy == 1) {
						if (EnemyConfigurationTable[BattlersTable[i].id].boss == 0) {
							goto RunFailure;
						}
						if (BattlersTable[i].afflictions[0] == Status0.Unconscious) {
							continue;
						}
						if (BattlersTable[i].afflictions[0] == Status0.Diamondized) {
							continue;
						}
						if (BattlersTable[i].afflictions[0] == Status0.Paralyzed) {
							continue;
						}
						if (BattlersTable[i].afflictions[2] == Status2.Asleep) {
							continue;
						}
						if (BattlersTable[i].afflictions[2] == Status2.Immobilized) {
							continue;
						}
						if (BattlersTable[i].afflictions[2] == Status2.Solidified) {
							continue;
						}
						if (BattlersTable[i].speed > x04) {
							x04 = BattlersTable[i].speed;
						}
					} else {
						if (BattlersTable[i].speed > x1B) {
							x1B = BattlersTable[i].speed;
						}
					}
				}
				if ((x04 == 0) || (x1D == 4) || ((x25 * 10 + x1B >= x04) && (RandLimit(100) < (x25 * 10 + x1B - x04)))) {
					x17 = 0;
					DisplayInBattleText(TextBattleRunSuccess);
					break turnLoop;
				} else {
					RunFailure:
					x27 = 0;
					DisplayInBattleText(TextBattleRunFailure);
				}
			}
			x1D = 0;
			while (x23 == 0) {
				CheckDeadPlayers();
				if ((CountChars(0) != 0) && (CountChars(1) != 0)) {
					short x04 = -1;
					short x = 0;
					for (short i = 0; i < BattlersTable.length; i++) {
						if (BattlersTable[i].consciousness == 0) {
							continue;
						}
						if (BattlersTable[i].hasTakenTurn != 0) {
							continue;
						}
						if (BattlersTable[i].initiative < x) {
							continue;
						}
						x04 = i;
						x = BattlersTable[i].initiative;
					}
					if (x04 == -1) {
						break;
					}
					currentAttacker = &BattlersTable[x04];
					currentAttacker.hasTakenTurn = 1;
					if ((currentAttacker.afflictions[0] == Status0.Unconscious) || (currentAttacker.afflictions[0] == Status0.Diamondized)) {
						continue;
					}
					if ((currentAttacker.afflictions[0] == Status0.Paralyzed) || (currentAttacker.afflictions[2] == Status2.Immobilized)) {
						if ((BattleActionTable[currentAttacker.currentAction].type != ActionType.PSI) &&
						(currentAttacker.currentAction != BattleActions.Pray) &&
						(currentAttacker.currentAction != BattleActions.FinalPrayer1) &&
						(currentAttacker.currentAction != BattleActions.FinalPrayer2) &&
						(currentAttacker.currentAction != BattleActions.FinalPrayer3) &&
						(currentAttacker.currentAction != BattleActions.FinalPrayer4) &&
						(currentAttacker.currentAction != BattleActions.FinalPrayer5) &&
						(currentAttacker.currentAction != BattleActions.FinalPrayer6) &&
						(currentAttacker.currentAction != BattleActions.FinalPrayer7) &&
						(currentAttacker.currentAction != BattleActions.FinalPrayer8) &&
						(currentAttacker.currentAction != BattleActions.FinalPrayer9) &&
						(currentAttacker.currentAction != BattleActions.Spy) &&
						(currentAttacker.currentAction != BattleActions.Mirror) &&
						(currentAttacker.currentAction != BattleActions.NoEffect)) {
							if (currentAttacker.afflictions[0] == Status0.Paralyzed) {
								currentAttacker.currentAction = BattleActions.Action252;
							} else {
								currentAttacker.currentAction = BattleActions.Action254;
							}
						}
					}
					if ((currentAttacker.afflictions[2] == Status2.Asleep) && (currentAttacker.currentAction != 0)) {
						currentAttacker.currentAction = BattleActions.Action253;
						currentAttacker.unknown7 = 0;
					}
					if ((currentAttacker.afflictions[2] == Status2.Solidified) && (currentAttacker.currentAction != 0)) {
						currentAttacker.currentAction = BattleActions.Action255;
						currentAttacker.afflictions[2] = 0;
						currentAttacker.unknown7 = 0;
					}
					if ((currentAttacker.afflictions[4] != 0) && (BattleActionTable[currentAttacker.currentAction].type == ActionType.PSI) && (currentAttacker.currentAction != 0)) {
						currentAttacker.currentAction = BattleActions.Action256;
					}
					if ((currentAttacker.afflictions[5] == Status5.Homesick) && (currentAttacker.currentAction != 0) && ((rand() & 7) == 0)) {
						currentAttacker.currentAction = BattleActions.Action251;
						currentAttacker.unknown7 = 0;
					}
					if ((BattleActionTable[currentAttacker.currentAction].direction == ActionDirection.Enemy) && (BattleActionTable[currentAttacker.currentAction].target == 0)) {
						currentAttacker.unknown9 = 1;
						currentAttacker.currentTarget = cast(ubyte)((currentAttacker - &BattlersTable[0]) / Battler.sizeof);
					} else {
						currentAttacker.unknown9 = 17;
						UnknownC4A228(currentAttacker, cast(short)((currentAttacker - &BattlersTable[0]) / Battler.sizeof));
					}
					x2F = 0;
					currentTarget = currentAttacker;
					FixAttackerName(0);
					FixTargetName();
					switch (currentAttacker.afflictions[0]) {
						case Status0.Nauseous:
							x2F = TwentyFivePercentVariance(20);
							DisplayTextWait(TextBattleFeltSickAndTookDamage, x2F);
							break;
						case Status0.Poisoned:
							x2F = TwentyFivePercentVariance(20);
							DisplayTextWait(TextBattleFeltPainFromPoison, x2F);
							break;
						case Status0.Sunstroke:
							x2F = TwentyFivePercentVariance(4);
							DisplayTextWait(TextBattleFeltDizzyAndWeak, x2F);
							break;
						case Status0.Cold:
							x2F = TwentyFivePercentVariance(4);
							DisplayTextWait(TextBattleSneezedAndReceivedDamage, x2F);
							break;
						default: break;
					}
					LoseHPStatus(currentAttacker, x2F);
					if (currentAttacker.hp == 0) {
						KOTarget(currentAttacker);
						if (CountChars(0) == 0) {
							goto Unknown225;
						}
						if (CountChars(1) != 0) {
							continue;
						}
						goto Unknown225;
					}
					if (currentAttacker.allyOrEnemy == 1) {
						ChooseTarget(currentAttacker);
						if (currentAttacker.currentAction == BattleActions.Steal) {
							currentAttacker.currentActionArgument = SelectStealableItem();
						}
					}
					UnknownC24703(currentAttacker);
					if ((currentAttacker.allyOrEnemy == 0) && (BattleActionTable[currentAttacker.currentAction].direction == 0)) {
						RemoveStatusUntargettableTargets();
						if (BattlerTargetFlags == 0) {
							ChooseTarget(currentAttacker);
							UnknownC24703(currentAttacker);
							RemoveStatusUntargettableTargets();
						}
					}
					short x31 = 0;
					if (((currentAttacker.afflictions[1] == Status1.Mushroomized) && (RandLimit(100) < 25)) || (currentAttacker.afflictions[3] == Status3.Strange)) {
						if (BattleActionTable[currentAttacker.currentAction].target != 0) {
							x31 = 1;
							while (BattlerTargetFlags == 0) {
								FeelingStrangeRetargetting();
								RemoveStatusUntargettableTargets();
							}
						}
					}
					if (currentAttacker.currentAction == BattleActions.Steal) {
						if (UnknownC24348(currentAttacker.currentActionArgument) != 0) {
							currentAttacker.currentActionArgument = 0;
						}
					}
					FixAttackerName(0);
					UnknownC1ACF8F(currentAttacker.currentActionArgument);
					UnknownC23E32();
					if ((currentAttacker.allyOrEnemy == 0) && (currentAttacker.id <= 4)) {
						for (short i = 0; i < 6; i++) {
							if (gameState.partyMembers[i] == currentAttacker.id) {
								UnknownC43573F(i);
								break;
							}
						}
					}
					if (BattleActionTable[currentAttacker.currentAction].ppCost != 0) {
						if (BattleActionTable[currentAttacker.currentAction].ppCost > currentAttacker.ppTarget) {
							DisplayInBattleText(TextBattleUsedPSI);
							goto Unknown215;
						} else {
							UnknownC2BCB9(currentAttacker, BattleActionTable[currentAttacker.currentAction].ppCost);
						}
					}
					if ((currentAttacker.allyOrEnemy == 1) && (currentAttacker.currentAction != 0)) {
						switch (BattleActionTable[currentAttacker.currentAction].type) {
							case ActionType.Physical:
							case ActionType.PiercingPhysical:
								UnknownC2FEF9(1);
								break;
							case ActionType.PSI:
								UnknownC2FEF9(2);
								break;
							case ActionType.Other:
								UnknownC2FEF9(3);
								break;
							default: break;
						}
						currentAttacker.unknown73 = 12;
						for (short i = 0; i < 12; i++) {
							Win_Tick();
						}
					}
					if (x31 != 0) {
						if (currentAttacker.afflictions[3] == Status3.Strange) {
							DisplayInBattleText(TextBattleActingABitUnusual);
						}
						if (currentAttacker.afflictions[1] == Status1.Mushroomized) {
							DisplayInBattleText(TextBattleFeelingFunky);
						}
					}
					UnknownC1DD9F(BattleActionTable[currentAttacker.currentAction].text);
					if (currentAttacker.currentAction != 0) {
						while (UnknownC2EACF() != 0) {
							Win_Tick();
						}
						for (short i = 0; i < BattlersTable.length; i++) {
							if (IsCharacterTargetted(i) == 0) {
								continue;
							}
							currentTarget = &BattlersTable[i];
							FixTargetName();
							if (currentTarget.afflictions[0] == Status0.Unconscious) {
								for (short j = 0; DeadTargettableActions[j] != 0; j++) {
									if (currentAttacker.currentAction == DeadTargettableActions[j]) {
										goto Unknown204;
									}
								}
								DisplayInBattleText(TextBattleWasAlreadyGone);
								break;
							}
							Unknown204:
							if (BattleActionTable[currentAttacker.currentAction].func is null) {
								continue;
							}
							// we don't need this kinda help
							//Unknown7E00BC = BattleActionTable[currentAttacker.currentAction].func;
							//UnknownC09279();
							BattleActionTable[currentAttacker.currentAction].func();
							CheckDeadPlayers();
							Unknown7E9623 = 1;
							if ((CountChars(0) == 0) || (CountChars(1) == 0)) {
								UnknownC2437E();
								goto Unknown225;
							}
							switch (Unknown7EAA0E) {
								case 3:
									x17 = 0;
									break turnLoop;
								case 2:
									UnknownC2437E();
									goto EnemiesAreDead;
								case 1:
									x17 = 2;
									break turnLoop;
								default:
									while(Unknown7EAD90 != 0) {
										Win_Tick();
									}
									break;
							}
						}
					}
					Unknown215:
					if (currentAttacker.allyOrEnemy == 0) {
						UnknownC2437E();
						if ((MirrorEnemy != 0) && (currentAttacker.id == 4) && (--MirrorTurnTimer == 0)) {
							MirrorEnemy = 0;
							CopyMirrorData(currentAttacker, &Unknown7EAA14);
							DisplayInBattleText(TextBattleReturnedOriginalForm);
						}
						UnknownC3E6F8F();
					}
					CheckDeadPlayers();
					currentTarget = currentAttacker;
					FixTargetName();
					switch (currentAttacker.afflictions[2]) {
						case Status2.Asleep:
							if ((rand() & 3) == 0) {
								DisplayInBattleText(TextBattleWokeUp);
								currentAttacker.afflictions[2] = 0;
							}
							break;
						case Status2.Immobilized:
							if (RandLimit(100) < 85) {
								DisplayInBattleText(TextBattleBodyAgainMovedFreely);
								currentAttacker.afflictions[2] = 0;
							}
							break;
						case Status2.Solidified:
							DisplayInBattleText(TextBattleAbleToMove);
							currentAttacker.afflictions[2] = 0;
							break;
						default: break;
					}
					if (currentAttacker.afflictions[4] != 0) {
						currentAttacker.afflictions[4]--;
						if (currentAttacker.afflictions[4] == 0) {
							DisplayInBattleText(TextBattleAbleToConcentrate);
						}
					}
					for (short i = 0; i < BattlersTable.length; i++) {
						BattlersTable[i].id2 = 0;
					}
					CheckDeadPlayers();
					ShowHPPPWindowsF();
				}
				Unknown225:
				if (CountChars(0) == 0) {
					x17 = 1;
					ResetRolling();
					DisplayInBattleText(TextBattleLostTheBattle);
					x23 = 1;
				}
				if (CountChars(1) == 0) {
					EnemiesAreDead:
					x17 = 0;
					ResetRolling();
					Unknown7EADB6 = 1;
					Unknown7EADD0 = 0;
					DepositIntoATM(BattleMoneyScratch);
					gameState.unknownC4 += BattleMoneyScratch;
					BattleEXPScratch += CountChars(0) - 1;
					BattleEXPScratch /= CountChars(0); //Bug! if party is dead, this is division by 0
					if (CurrentBattleGroup >= 0x1C0) {
						DisplayTextWait(TextBattleYouWonBoss, BattleEXPScratch);
					} else {
						DisplayTextWait(TextBattleYouWon, BattleEXPScratch);
					}
					if (ItemDropped != 0) {
						UnknownC1ACF8F(ItemDropped);
						DisplayInBattleText(TextBattleEnemyLeftPresent);
					}
					for (short i = 0; i < BattlersTable.length; i++) {
						if (BattlersTable[i].consciousness == 0) {
							continue;
						}
						if (BattlersTable[i].allyOrEnemy != 0) {
							continue;
						}
						if (BattlersTable[i].npcID != 0) {
							continue;
						}
						if ((BattlersTable[i].afflictions[0] == Status0.Unconscious) || (BattlersTable[i].afflictions[0] == Status0.Diamondized)) {
							continue;
						}
						GainEXP(BattlersTable[i].id, 1, BattleEXPScratch);
					}
				}
			}
			CloseFocusWindow();
		}
		ResetRolling();
		do {
			Win_Tick();
		} while (UnknownC2108C() == 0);
		if (MirrorEnemy != 0) {
			for (short i = 0; i < BattlersTable.length; i++) {
				if (BattlersTable[i].consciousness == 0) {
					continue;
				}
				if (BattlersTable[i].allyOrEnemy != 0) {
					continue;
				}
				if (BattlersTable[i].id != 4) {
					continue;
				}
				MirrorEnemy = 0;
				ubyte persistentEasyAffliction = BattlersTable[i].afflictions[0];
				CopyMirrorData(&BattlersTable[i], &Unknown7EAA14);
				BattlersTable[i].afflictions[0] = persistentEasyAffliction;
				CheckDeadPlayers();
				break;
			}
		}
		ResetPostBattleStats();
		gameState.autoFightEnable = 0;
		BattleModeFlag = 0;
	} while (BattleDebug == 0);
	FadeOut(1, 1);
	do {
		WaitUntilNextFrame();
		UnknownC2DB3F();
	} while (Unknown7E0028 != 0);
	UnknownC20293();
	UnknownC08726();
	UnknownC1DD5F();
	UnknownC2E0E7();
	return x17;
}

/// $C261BD
void InstantWinHandler();

/// $C26634
short InstantWinCheck();

/// $C2698B
short GetBattleActionType(short id) {
	return BattleActionTable[id].type;
}

/// $C2698B
short GetEnemyType(short id) {
	return EnemyConfigurationTable[id].type;
}

/// $C269DE
void UnknownC269DE() {
	while (Unknown7E0028 != 0) {
		Win_Tick();
	}
}

/// $C269BE
void Wait(short frames) {
	while (--frames != 0) {
		Win_Tick();
	}
}

/// $C269EF
short RandLong() {
	return rand();
}

/// $C269F8
short Truncate16To8(short arg1, short arg2) {
	return cast(short)((arg1 * arg2) >> 8);
}

/// $C26A2D
short RandLimit(short arg1) {
	return Truncate16To8(RandLong(), arg1);
}

/// $C26A44
short FiftyPercentVariance(short arg1) {
	ubyte x12 = RandLong() & 0xFF;
	ubyte x10 = RandLong() & 0xFF;
	short x0E = (x12 - 128 < 0) ? (-cast(int)(x12 - 0x80)) : (x12 - 0x80);
	short x0E2 = (x10 - 128 < 0) ? (-cast(int)(x10 - 0x80)) : (x10 - 0x80);

	if (x0E > x0E2) {
		x12 = x10;
		x0E = x0E2;
	}
	if (x12 < 0x80) {
		arg1 -= Truncate16To8(arg1, x0E);
	} else if (x12 > 0x80) {
		arg1 += Truncate16To8(arg1, x0E);
	}
	return arg1;
}

/// $C26AFD
short TwentyFivePercentVariance(short arg1) {
	ubyte x12 = RandLong() & 0xFF;
	ubyte x10 = RandLong() & 0xFF;
	short x0E = (x12 - 128 < 0) ? (-cast(int)(x12 - 0x80)) : (x12 - 0x80);
	short x0E2 = (x10 - 128 < 0) ? (-cast(int)(x10 - 0x80)) : (x10 - 0x80);

	if (x0E > x0E2) {
		x12 = x10;
		x0E = x0E2;
	}
	if (x12 < 0x80) {
		arg1 -= Truncate16To8(arg1, x0E) / 2;
	} else if (x12 > 0x80) {
		arg1 += Truncate16To8(arg1, x0E) / 2;
	}
	return arg1;
}

/// $C26BB8
short Success255(short arg) {
	if (RandLong() < arg) {
		return 1;
	}
	return 0;
}

/// $C26BDB
short Success500(short arg) {
	if (RandLimit(500) < arg) {
		return 1;
	}
	return 0;
}

/// $C26BFB
void TargetAllies() {
	BattlerTargetFlags = 0;
	for (short i = 0; i < BattlersTable.length; i++) {
		if ((BattlersTable[i].consciousness != 0) && ((BattlersTable[i].allyOrEnemy == 0) || (BattlersTable[i].npcID != 0))) {
			BattlerTargetFlags |= PowersOfTwo32Bit[i];
		}
	}
}

/// $C26C82
void TargetAllEnemies() {
	BattlerTargetFlags = 0;
	for (short i = 0; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		if (BattlersTable[i].allyOrEnemy != 1) {
			continue;
		}
		BattlerTargetFlags |= PowersOfTwo32Bit[i];
	}
}

/// $C26D04
void TargetRow(ubyte arg1)  {
	BattlerTargetFlags = 0;
	for (short i = 0; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		switch (arg1) {
			case 0:
				if (BattlersTable[i].allyOrEnemy == 0) {
					BattlerTargetFlags |= PowersOfTwo32Bit[i];
				}
				break;
			case 1:
			case 2:
				if ((BattlersTable[i].allyOrEnemy == 1) && (BattlersTable[i].row == arg1)) {
					BattlerTargetFlags |= PowersOfTwo32Bit[i];
				}
				break;
			default: break;
		}
	}
}

/// $C26E00
void TargetAll() {
	BattlerTargetFlags = 0;
	for (short i = 0; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		BattlerTargetFlags |= PowersOfTwo32Bit[i];
	}
}

/// $C26E77
void RemoveNPCTargetting() {
	for (short i = 0; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		if (BattlersTable[i].npcID == 0) {
			continue;
		}
		BattlerTargetFlags &= (0xFFFFFFFF ^ PowersOfTwo32Bit[i]);
	}
}

/// $C26EF8
uint RandomTargetting(uint arg1) {
	if (arg1 == 0) {
		return arg1;
	}
	short x10 = 0;
	short x0E = (RandLong() % BattlersTable.length) + 1;
	while (x0E-- != 0) {
		do {
			if (++x10 == 32) {
				x10 = 0;
			}
		} while ((PowersOfTwo32Bit[x10] & arg1) == 0);
	}
	return PowersOfTwo32Bit[x10];
}

/// $C26FDC
void TargetBattler(short arg1) {
	BattlerTargetFlags |= PowersOfTwo32Bit[arg1];
}

/// $C27029
short IsCharacterTargetted(short arg1) {
	if ((BattlerTargetFlags & PowersOfTwo32Bit[arg1]) != 0) {
		return 1;
	}
	return 0;
}

/// $C27089
void RemoveTarget(short arg1) {
	BattlerTargetFlags &= (0xFFFFFFFF ^ PowersOfTwo32Bit[arg1]);
}

/// $C270E4
void RemoveDeadTargetting() {
	for (short i = 0; i < BattlersTable.length; i ++) {
		if (IsCharacterTargetted(i) == 0) {
			continue;
		}
		if (BattlersTable[i].afflictions[0] == Status0.Unconscious) {
			RemoveTarget(i);
		}
	}
}

/// $C27126
void SetHP(Battler* battler, short arg2) {
	ushort x10 = (arg2 > battler.hpMax) ? battler.hpMax : arg2;
	if (battler.allyOrEnemy == 0) {
		if (battler.npcID == 0) {
			battler.hpTarget = x10;
			PartyCharacters[battler.row].hp.target = x10;
		} else {
			battler.hp = x10;
			battler.hpTarget = x10;
			gameState.partyNPCHP[battler.row] = x10;
		}
	} else {
		battler.hp = x10;
		battler.hpTarget = x10;
	}
}

/// $C27191
void SetPP(Battler* battler, short arg2) {
	ushort x10 = (arg2 > battler.ppMax) ? battler.ppMax : arg2;
	if (battler.allyOrEnemy == 0) {
		if (battler.npcID == 0) {
			battler.ppTarget = x10;
			PartyCharacters[battler.row].pp.target = x10;
		} else {
			battler.pp = x10;
			battler.ppTarget = x10;
		}
	} else {
		battler.pp = x10;
		battler.ppTarget = x10;
	}
}

/// $C271F0
void ReduceHP(Battler* battler, short arg2) {
	SetHP(battler, (arg2 > battler.hpTarget) ? 0 : cast(short)(battler.hpTarget - arg2));
}

/// $C2724A
short InflictStatusBattle(Battler* target, short statusGroup, short status) {
	if (target.npcID != 0) {
		return 0;
	}
	if ((target.afflictions[statusGroup] == 0) || (target.afflictions[statusGroup] > status)) {
		target.afflictions[statusGroup] = cast(ubyte)status;
		return 1;
	}
	return 0;
}

/// $C27294
void RecoverHP(Battler* battler, short amount) {
	if (battler.consciousness != 1) {
		return;
	}
	if (battler.afflictions[0] != Status0.Unconscious) {
		SetHP(battler, cast(short)(amount + battler.hpTarget));
		if (battler.hpMax >= amount + battler.hpTarget) {
			DisplayInBattleText(TextBattleHPAreMaxedOut);
		} else {
			DisplayTextWait(TextBattleRecoveredHP, amount);
		}
	} else {
		DisplayInBattleText(TextBattleNoVisibleEffect);
	}
}

/// $C27318
void RecoverPP(Battler* battler, short amount) {
	if (battler.consciousness != 1) {
		return;
	}
	if (battler.afflictions[0] == Status0.Unconscious) {
		return;
	}
	short x16 = (battler.ppTarget + amount >= battler.ppMax) ? cast(short)(battler.ppMax - battler.ppTarget) : amount;
	SetPP(battler, cast(short)(battler.ppTarget + amount));
	DisplayTextWait(TextBattleRecoveredPP, x16);
}

/// $C27397
void ReviveTarget(Battler*, short);

/// $C27550
void KOTarget(Battler*);

/// $C27D28
void IncreaseOffense16th(Battler* battler) {
	battler.offense += (battler.offense / 16 != 0) ? (battler.offense / 16) : 1;
	if (battler.offense > (battler.baseOffense * 5) / 4) {
		battler.offense = (battler.baseOffense * 5) / 4;
	}
}

/// $C27D82
void IncreaseDefense16th(Battler* battler) {
	battler.defense += (battler.defense / 16 != 0) ? (battler.defense / 16) : 1;
	if (battler.defense > (battler.baseDefense * 5) / 4) {
		battler.defense = (battler.baseDefense * 5) / 4;
	}
}

/// $C27E8A
void SwapAttackerWithTarget() {
	Battler* tmp = currentAttacker;
	currentAttacker = currentTarget;
	currentTarget = tmp;
	FixAttackerName(0);
	FixTargetName();
}

/// $C27C96
short SuccessLuck80() {
	if (RandLimit(80) < currentTarget.luck) {
		return 0;
	}
	return 1;
}

/// $C27CAF
short SuccessSpeed(short amount) {
	short x10 = (currentTarget.speed < currentAttacker.speed) ? 0 : cast(short)(currentTarget.speed - currentAttacker.speed);
	if (RandLimit(amount) >= x10) {
		return 1;
	}
	return 0;
}

/// $C27CFD
short FailAttackOnNPCs() {
	if (currentTarget.npcID != 0) {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
		return 1;
	}
	return 0;
}

/// $C27DDC
void HexadecimateOffense(Battler* target) {
	target.offense -= (target.offense / 16 != 0) ? (target.offense / 16) : 1;
	if (target.offense < (target.baseOffense * 3) / 4) {
		target.offense = (target.baseOffense * 3) / 4;
	}
}

/// $C27E33
void HexadecimateDefense(Battler* target) {
	target.defense -= (target.defense / 16 != 0) ? (target.defense / 16) : 1;
	if (target.defense < (target.baseDefense * 3) / 4) {
		target.defense = (target.baseDefense * 3) / 4;
	}
}

/// $C27EAF
short CalcDamage(Battler* target, short damage) {
	short x18 = 0;
	Battler* x16;
	if (damage == 0) {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
		return 0;
	}
	if ((target.allyOrEnemy == 1) && (target.id == EnemyID.Giygas2)) {
		x18 = 1;
		x16 = currentTarget;
		do {
			currentTarget = &BattlersTable[rand() & 3];
		} while ((currentTarget.consciousness == 0) || (currentTarget.npcID != 0) || (currentTarget.afflictions[0] == Status0.Unconscious) || (currentTarget.afflictions[0] == Status0.Diamondized));
		FixTargetName();
		target = currentTarget;
		Unknown7EADA8 = 16;
		PlaySfx(Sfx.ReflectDamage);
		Wait(1 * 30);
	}
	short x02 = target.hpTarget;
	if ((target.allyOrEnemy == 0) || ((target.id != EnemyID.MasterBelch1) && (target.id != EnemyID.MasterBelch3) && (target.id != EnemyID.Giygas2) && (target.id != EnemyID.Giygas3) && (target.id != EnemyID.Giygas5) && (target.id != EnemyID.Giygas6))) {
		ReduceHP(target, damage);
	}
	if (target.allyOrEnemy == 0) {
		if ((target.hpTarget == 0) && (x02 > 1)) {
			if (Success500((target.guts < 25) ? 25 : target.guts) != 0) {
				SetHP(target, 1);
			}
		}
		if ((Unknown7EAA90 != 0) && (CountChars(1) == 1) && (CountChars(0) == 1)) {
			SetHP(target, 1);
		}
	}
	if (target.allyOrEnemy == 1) {
		if ((target.id == EnemyID.Giygas3) || (target.id == EnemyID.Giygas4) || (target.id == EnemyID.Giygas5) || (target.id == EnemyID.Giygas6)) {
			Unknown7EADAA = 16;
		}
		target.unknown72 = 21;
		if (Unknown7EAA8E != 0) {
			DisplayTextWait(TextBattleXHPOfDamageTaken2, damage);
			Unknown7EAA8E = 0;
		} else {
			DisplayTextWait(TextBattleXHPOfDamageTaken, damage);
		}
	} else {
		if ((target.npcID == 0) && (HPPPBoxBlinkDuration == 0)) {
			HPPPBoxBlinkDuration = 21;
			for (short i = 0; i < 6; i++) {
				if (gameState.partyMembers[i] != target.id) {
					continue;
				}
				HPPPBoxBlinkTarget = i;
				break;
			}
		}
		if (target.hpTarget == 0) {
			VerticalShakeDuration = 1 * 60;
			VerticalShakeHoldDuration = 1 * 12;
			DisplayTextWait(TextBattleTookMortalDamage, damage);
		} else if (Unknown7EAA8E != 0) {
			VerticalShakeDuration = 1 * 60;
			DisplayTextWait(TextBattleXHPOfDamageTaken3, damage);
			VerticalShakeHoldDuration = 0;
			Unknown7EAA8E = 0;
		} else {
			VerticalShakeDuration = 7 * 6;
			DisplayTextWait(TextBattleXHPOfDamageTaken4, damage);
			VerticalShakeHoldDuration = 0;
		}
		Unknown7EAD90 = 40;
	}
	if (x18 != 0) {
		currentTarget = x16;
		FixTargetName();
	}
	return 1;
}

/// $C28125
short CalcResistDamage(short damage, short arg2) {
	if (damage <= 0) {
		damage = 0;
	}
	if (arg2 < 0xFF) {
		damage = Truncate16To8(arg2, damage);
	}
	if (currentTarget.consciousness != 1) {
		return damage;
	}
	if (currentTarget.afflictions[0] == Status0.Unconscious) {
		return damage;
	}
	if (currentAttacker.guarding == 1) {
		if (GetBattleActionType(currentAttacker.currentAction) == ActionType.Physical) {
			damage /= 2;
		}
	}
	if (GetBattleActionType(currentAttacker.currentAction) == ActionType.Physical) {
		if ((currentTarget.afflictions[6] == Status6.ShieldPower) || (currentTarget.afflictions[6] == Status6.Shield)) {
			damage /= 2;
		}
	}
	if (damage == 0) {
		damage = 1;
	}
	if (CalcDamage(currentTarget, damage) != 0) {
		if (currentTarget.hp == 0) {
			KOTarget(currentTarget);
		}
	}
	// damage hasn't changed at all since the last check, so this seems unnecessary
	if (damage == 0) {
		damage = 1;
	}
	if (Unknown7EAA94 == 0) {
		switch (currentTarget.afflictions[6]) {
			case Status6.ShieldPower:
				if (Unknown7EAA90 != 0) {
					goto case;
				}
				damage /= 2;
				if (damage == 0) {
					damage = 1;
				}
				DisplayInBattleText(TextBattlePowerShieldDeflected);
				SwapAttackerWithTarget();
				CalcDamage(currentTarget, damage);
				if (currentTarget.hp == 0) {
					KOTarget(currentTarget);
				}
				SwapAttackerWithTarget();
				goto case;
			case Status6.Shield:
				if (--currentTarget.shieldHP == 0) {
					currentTarget.afflictions[6] = 0;
					DisplayInBattleText(TextBattleShieldDisappeared);
				}
				break;
			default: break;
		}
	}
	if ((currentTarget.allyOrEnemy == 0) && (currentTarget.npcID == 0) && (PartyCharacters[currentTarget.row].hp.current.integer == 0)) {
		return damage;
	}
	if ((currentTarget.afflictions[2] == Status2.Asleep) && (Success255(128) != 0)) {
		currentTarget.currentAction = 0;
		currentTarget.afflictions[2] = 0;
		DisplayInBattleText(TextBattleWokeUp);
	}
	return damage;
}

/// $C282F8
short MissCalc(short arg1) {
	short x12;
	if ((currentAttacker.allyOrEnemy == 0) && (currentAttacker.npcID == 0)) {
		if (PartyCharacters[currentAttacker.row].equipment[0] != 0) {
			x12 = ItemData[PartyCharacters[currentAttacker.row].items[PartyCharacters[currentAttacker.row].equipment[0] - 1]].parameters.special;
		} else {
			x12 = 1;
		}
		if ((currentAttacker.afflictions[2] == Status2.Crying) | (currentAttacker.afflictions[0] == Status0.Nauseous)) {
			x12 += 8;
		}
	} else {
		x12 = EnemyConfigurationTable[currentAttacker.id].missRate;
	}
	if (x12 == 0) {
		return 0;
	}
	if (x12 < RandLimit(16)) {
		return 0;
	}
	if (arg1 != 0) {
		DisplayInBattleText(TextBattleNarrowlyMissed);
	} else {
		DisplayInBattleText(TextBattleJustMissed);
	}
	return 1;
}

/// $C283F8
short Smaaaash() {
	Unknown7EAA8E = 0;
	short guts = currentAttacker.guts;
	if ((currentAttacker.allyOrEnemy == 0) && (guts < 25)) {
		guts = 25;
	}
	if (Success500(guts) == 0) {
		return 0;
	}
	if (currentAttacker.allyOrEnemy == 0) {
		GreenFlashDuration = 60;
		DisplayInBattleText(TextBattleSmaaaash);
	} else {
		RedFlashDuration = 60;
		DisplayInBattleText(TextBattleSmaaaashReceived);
	}
	if ((currentTarget.afflictions[6] == Status6.ShieldPower) || (currentTarget.afflictions[6] == Status6.Shield)) {
		currentTarget.shieldHP = 1;
	}
	Unknown7EAA8E = 1;
	CalcResistDamage(cast(short)(currentAttacker.offense * 4 - currentTarget.defense), 0xFF);
	return 1;
}

/// $C284AD
short DetermineDodge() {
	if (currentTarget.afflictions[0] == Status0.Paralyzed) {
		return 0;
	}
	if (currentTarget.afflictions[2] == Status2.Asleep) {
		return 0;
	}
	if (currentTarget.afflictions[2] == Status2.Immobilized) {
		return 0;
	}
	if (currentTarget.afflictions[2] == Status2.Solidified) {
		return 0;
	}
	if (0 > currentTarget.speed * 2 - currentAttacker.speed) {
		return 0;
	}
	if (Success500(cast(short)(currentTarget.speed * 2 - currentAttacker.speed)) == 0) {
		return 1;
	}
	return 0;
}

/// $C28523
void BattleActionLevel2Attack() {
	short damageDone = cast(short)(currentAttacker.offense * 2 - currentTarget.defense);
	if (damageDone > 0) {
		damageDone = TwentyFivePercentVariance(damageDone);
	}
	if (damageDone <= 0) {
		damageDone = 1;
	}
	CalcResistDamage(damageDone, 0xFF);
}

/// $C2856B
void HealStrangeness() {
	if (currentTarget.afflictions[3] == Status3.Strange) {
		currentTarget.afflictions[3] = 0;
		DisplayInBattleText(TextBattleBackToNormal);
	}
}

/// $C2859F
void BattleActionBash() {
	if ((MissCalc(0) != 0) || (Smaaaash() != 0)) {
		return;
	}
	if (DetermineDodge() == 0) {
		BattleActionLevel2Attack();
		HealStrangeness();
	} else {
		DisplayInBattleText(TextBattleDodged);
	}
}

/// $C285DA
void BattleActionLevel4Attack() {
	if (MissCalc(0) != 0) {
		return;
	}
	if (Smaaaash() != 0) {
		return;
	}
	if (DetermineDodge() == 0) {
		short damageDone = cast(short)(currentAttacker.offense * 4 - currentTarget.defense);
		if (damageDone > 0) {
			damageDone = TwentyFivePercentVariance(damageDone);
		}
		if (damageDone <= 0) {
			damageDone = 1;
		}
		CalcResistDamage(damageDone, 0xFF);
		HealStrangeness();
	} else {
		DisplayInBattleText(TextBattleDodged);
	}
}

/// $C28651
void BattleActionLevel3Attack() {
	if (MissCalc(0) != 0) {
		return;
	}
	if (Smaaaash() != 0) {
		return;
	}
	if (DetermineDodge() == 0) {
		short damageDone = cast(short)(currentAttacker.offense * 3 - currentTarget.defense);
		if (damageDone > 0) {
			damageDone = TwentyFivePercentVariance(damageDone);
		}
		if (damageDone <= 0) {
			damageDone = 1;
		}
		CalcResistDamage(damageDone, 0xFF);
		HealStrangeness();
	} else {
		DisplayInBattleText(TextBattleDodged);
	}
}

/// $C286CB
void BattleActionLevel1Attack() {
	if (MissCalc(0) != 0) {
		return;
	}
	if (Smaaaash() != 0) {
		return;
	}
	if (DetermineDodge() == 0) {
		short damageDone = cast(short)(currentAttacker.offense - currentTarget.defense);
		if (damageDone > 0) {
			damageDone = TwentyFivePercentVariance(damageDone);
		}
		if (damageDone <= 0) {
			damageDone = 1;
		}
		CalcResistDamage(damageDone, 0xFF);
		HealStrangeness();
	} else {
		DisplayInBattleText(TextBattleDodged);
	}
}

/// $C28740
void BattleActionShoot() {
	if (MissCalc(0) != 0) {
		return;
	}
	if (DetermineDodge() == 0) {
		BattleActionLevel2Attack();
	} else {
		DisplayInBattleText(TextBattleDodgedShoot);
	}
}

/// $C28770
void BattleActionSpy() {
	DisplayTextWait(TextBattleSpyOffense, currentTarget.offense);
	DisplayTextWait(TextBattleSpyDefense, currentTarget.defense);
	if (currentTarget.fireResist == 0xFF) {
		DisplayInBattleText(TextBattleSpyVulnerableToFire);
	}
	if (currentTarget.freezeResist == 0xFF) {
		DisplayInBattleText(TextBattleSpyVulnerableToIce);
	}
	if (currentTarget.flashResist == 0xFF) {
		DisplayInBattleText(TextBattleSpyVulnerableToFlash);
	}
	if (currentTarget.paralysisResist == 0xFF) {
		DisplayInBattleText(TextBattleSpyVulnerableToParalysis);
	}
	if (currentTarget.hypnosisResist == 0xFF) {
		DisplayInBattleText(TextBattleSpyVulnerableToHypnosis);
	}
	if (currentTarget.brainshockResist == 0xFF) {
		DisplayInBattleText(TextBattleSpyVulnerableToBrainshock);
	}
	if ((currentTarget.allyOrEnemy == 1) && (FindInventorySpace2(3) != 0) && (ItemDropped != 0)) {
		UnknownC1ACF8F(ItemDropped);
		DisplayInBattleText(TextBattleSpyFoundItem);
		ItemDropped = 0;
	}
}

/// $C2889B
void BattleActionNull() {
	//nothing
}

/// $C2889E
void BattleActionSteal() {
	if (currentTarget.allyOrEnemy == 1) {
		return;
	}
	if (currentTarget.npcID != 0) {
		return;
	}
	if ((MirrorEnemy == 0) || (currentAttacker.allyOrEnemy != 0) || (currentAttacker.id != 4)) {
		if (currentAttacker.currentActionArgument != 0) {
			TakeItemFromCharacter(0xFF, currentAttacker.currentActionArgument);
		}
	}
}

/// $C288EB
void BattleActionFreezeTime() {
	PauseMusic();
	short x02 = cast(short)(RandLimit(4) + 1);
	uint x16 = BattlerTargetFlags;
	for (short i = 0; i < x02; i++) {
		RemoveStatusUntargettableTargets();
		if (BattlerTargetFlags == 0) {
			break;
		}
		BattlerTargetFlags = RandomTargetting(x16);
		short j;
		for (j = 0; j < BattlersTable.length; j++) {
			if (IsCharacterTargetted(j) != 0) {
				break;
			}
		}
		currentTarget = &BattlersTable[j];
		FixTargetName();
		BattleActionBash();
	}
	ResumeMusic();
	DisplayInBattleText(TextBattleTimeStartedAgain);
	BattlerTargetFlags = 0;
}

/// $C289CE
void BattleActionDiamondize();

/// $C28A92
void BattleActionParalyze();

/// $C28AEB
void BattleActionNauseate();

/// $C28B2C
void BattleActionPoison();

/// $C28B6D
void BattleActionCold();

/// $C28BBE
void BattleActionMushroomize();

/// $C28BFD
void BattleActionPossess();

/// $C28C69
void BattleActionCrying();

/// $C28CB8
void BattleActionImmobilize();

/// $C28CF1
void BattleActionSolidify();

/// $C28D3A
void BattleActionBrainshockAlphaCopy() {
	BattleActionBrainshockAlpha();
}

/// $C28D41
short SuccessLuck40() {
	if (RandLimit(40) < currentTarget.luck) {
		return 0;
	}
	return 1;
}

/// $C28D5A
void BattleActionDistract();

/// $C28D8B
void BattleActionFeelStrange();

/// $C28DFC
void BattleActionCrying2();

/// $C28E3B
void BattleActionHypnosisAlphaCopy() {
	BattleActionHypnosisAlpha();
}

/// $C28E42
void BattleActionReducePP();

/// $C28EAE
void BattleActionCutGuts() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	short tmp = currentTarget.guts;
	currentTarget.guts = cast(short)((currentTarget.guts * 3) / 2);
	if (currentTarget.guts < currentTarget.baseGuts / 2) {
		currentTarget.guts = currentTarget.baseGuts / 2;
	}
	DisplayTextWait(TextBattleGutsWentDown, tmp - currentTarget.guts);
}

/// $C28F21
void BattleActionReduceOffenseDefense() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	short x16 = currentTarget.offense;
	HexadecimateOffense(currentTarget);
	DisplayTextWait(TextBattleOffenseWentDown, x16 - currentTarget.offense);
	x16 = currentTarget.defense;
	HexadecimateDefense(currentTarget);
	DisplayTextWait(TextBattleDefenseWentDown, x16 - currentTarget.defense);
}

/// $C28F97
void BattleActionLevel2AttackPoison();

/// $C28FF9
void BattleActionDoubleBash() {
	BattleActionBash();
	BattleActionBash();
}

/// $C2900B
void BattleAction350FireDamage() {
	CalcResistDamage(TwentyFivePercentVariance(350), currentTarget.fireResist);
}

/// $C2902C
void BattleActionLevel3AttackCopy() {
	BattleActionLevel3Attack();
}

/// $C29033
void BattleActionNull2() {
	//nothing
}

/// $C29036
void BattleActionNull3() {
	//nothing
}

/// $C29039
void BattleActionNull4() {
	//nothing
}

/// $C2903C
void BattleActionNull5() {
	//nothing
}

/// $C2903F
void BattleActionNull6() {
	//nothing
}

/// $C29042
void BattleActionNull7() {
	//nothing
}

/// $C29045
void BattleActionNull8() {
	//nothing
}

/// $C29048
void BattleActionNull9() {
	//nothing
}

/// $C2904B
void BattleActionNull10() {
	//nothing
}

/// $C2904E
void BattleActionNull11() {
	//nothing
}

/// $C29051
void BattleActionNeutralize() {
	currentTarget.offense = currentTarget.baseOffense;
	currentTarget.defense = currentTarget.baseDefense;
	currentTarget.speed = currentTarget.baseSpeed;
	currentTarget.guts = currentTarget.baseGuts;
	currentTarget.luck = currentTarget.baseLuck;
	currentTarget.shieldHP = 0;
	currentTarget.afflictions[6] = 0;
	DisplayInBattleText(TextBattleEffectsOfPSIAreGone);
}

/// $C290C6
void UnknownC290C6() {
	if (MirrorEnemy != 0) {
		for (short i = 0; i < BattlersTable.length; i++) {
			if (BattlersTable[i].consciousness == 0) {
				continue;
			}
			if (BattlersTable[i].allyOrEnemy != 0) {
				continue;
			}
			if (BattlersTable[i].id != 4) {
				continue;
			}
			MirrorEnemy = 0;
			CopyMirrorData(&BattlersTable[i], &Unknown7EAA14);
			BattlersTable[i].currentAction = 0;
			DisplayInBattleText(TextBattleReturnedOriginalForm);
			break;
		}
	}
	TargetAll();
	RemoveDeadTargetting();
	UnknownC240A4(&BattleActionNeutralize);
	BattlerTargetFlags = 0;
}

/// $C2916E
void BattleActionLevel2AttackDiamondize() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (MissCalc(0) != 0) {
		return;
	}
	if (Smaaaash() != 0) {
		return;
	}
	if (DetermineDodge() == 0) {
		BattleActionLevel2Attack();
		HealStrangeness();
		if (SuccessLuck80() != 0) {
			if (InflictStatusBattle(currentTarget, 0, Status0.Diamondized) != 0) {
				currentTarget.afflictions[6] = 0;
				currentTarget.afflictions[5] = 0;
				currentTarget.afflictions[4] = 0;
				currentTarget.afflictions[3] = 0;
				currentTarget.afflictions[2] = 0;
				currentTarget.afflictions[1] = 0;
				BattleEXPScratch += currentTarget.exp;
				BattleMoneyScratch += currentTarget.money;
				DisplayInBattleText(TextBattleWasDiamondized);
			}
		}
	} else {
		DisplayInBattleText(TextBattleDodged);
	}
}

/// $C29254
void BattleActionReduceOffense();

/// $C29298
void BattleActionClumsyRobotDeath() {
	if (getEventFlag(PSITeleportDestinationTable[13].eventFlag) != 0) {
		DisplayInBattleText(TextBattleRunawayFiveDefeatClumsyRobot);
		SetTeleportState(15, TeleportStyle.Instant);
	} else {
		DisplayInBattleText(TextBattleBlackSmokePouredOut);
		SetTeleportState(13, TeleportStyle.Instant);
		Unknown7EAA0E = 1;
	}
}

/// $C292EB
void BattleActionEnemyExtend() {
	//nothing
}

/// $C292EE
void BattleActionMasterBarfDeath();

/// $C2941D
short PSIShieldNullify() {
	Unknown7EAA94 = 1;
	UnknownC1ACF8F(currentAttacker.currentActionArgument);
	if (BattleActionTable[currentAttacker.currentAction].type != ActionType.PSI) {
		return 0;
	}
	if (currentTarget.afflictions[6] != Status6.PSIShieldPower) {
		DisplayInBattleText(TextBattlePsychicPowerShieldDeflected);
		Unknown7EAA96 = 1;
		SwapAttackerWithTarget();
	} else if (currentTarget.afflictions[6] != Status6.PSIShield) {
		DisplayInBattleText(TextBattlePsychicPowerShieldBlocked);
		if (--currentTarget.shieldHP == 0) {
			currentTarget.afflictions[6] = 0;
			DisplayInBattleText(TextBattleShieldDisappeared);
		}
		return 1;
	}
	return 0;
}

/// $C294CE
void WeakenShield() {
	Unknown7EAA94 = 0;
	if (Unknown7EAA96 == 0) {
		return;
	}
	SwapAttackerWithTarget();
	currentTarget.shieldHP--;
	if (currentTarget.shieldHP == 0) {
		currentTarget.afflictions[6] = 0;
		DisplayInBattleText(TextBattleShieldDisappeared);
	}
	Unknown7EAA96 = 0;
}

/// $C29516
void PSIRockinCommon(short baseDamage) {
	if (PSIShieldNullify() != 0) {
		return;
	}
	if (DetermineDodge() != 0) {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	} else {
		CalcResistDamage(FiftyPercentVariance(baseDamage), 0xFF);
	}
	WeakenShield();
}

/// $C29556
void BattleActionPSIRockinAlpha() {
	PSIRockinCommon(80);
}

/// $C2955F
void BattleActionPSIRockinBeta() {
	PSIRockinCommon(180);
}

/// $C29568
void BattleActionPSIRockinGamma() {
	PSIRockinCommon(540);
}

/// $C29568
void BattleActionPSIRockinOmega() {
	PSIRockinCommon(720);
}

/// $C2957A
void PSIFireCommon(short baseDamage);

/// $C295AB
void BattleActionPSIFireAlpha() {
	PSIFireCommon(80);
}

/// $C295B4
void BattleActionPSIFireBeta() {
	PSIFireCommon(160);
}

/// $C295BD
void BattleActionPSIFireGamma() {
	PSIFireCommon(240);
}

/// $C295C6
void BattleActionPSIFireOmega() {
	PSIFireCommon(320);
}

/// $C295CF
void PSIFreezeCommon(short baseDamage) {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (PSIShieldNullify() != 0) {
		return;
	}
	short damageDone = CalcResistDamage(TwentyFivePercentVariance(baseDamage), currentTarget.freezeResist);
	if ((currentTarget.afflictions[0] != Status0.Unconscious) && (damageDone != 0) && (RandLimit(100) < 25)) {
		if (InflictStatusBattle(currentTarget, 2, Status2.Solidified) != 0) {
			DisplayInBattleText(TextBattleBodySolidified);
		}
	}
	WeakenShield();
}

/// $C29647
void BattleActionPSIFreezeAlpha() {
	PSIFreezeCommon(180);
}

/// $C29650
void BattleActionPSIFreezeBeta() {
	PSIFreezeCommon(360);
}

/// $C29659
void BattleActionPSIFreezeGamma() {
	PSIFreezeCommon(540);
}

/// $C29662
void BattleActionPSIFreezeOmega() {
	PSIFreezeCommon(720);
}

/// $C2966B
void PSIThunderCommon(short baseDamage, short strikes);

/// $C29871
void BattleActionPSIThunderAlpha() {
	PSIThunderCommon(120, 1);
}

/// $C2987D
void BattleActionPSIThunderBeta() {
	PSIThunderCommon(120, 2);
}

/// $C29889
void BattleActionPSIThunderGamma() {
	PSIThunderCommon(200, 3);
}

/// $C29895
void BattleActionPSIThunderOmega() {
	PSIThunderCommon(200, 4);
}

/// $C298A1
short FlashImmunityTest() {
	if (PSIShieldNullify() != 0) {
		return 0;
	}
	if (Success255(currentTarget.flashResist) != 0) {
		return 1;
	}
	DisplayInBattleText(TextBattleItDidntWorkOnX);
	return 0;
}

/// $C298DE
void FlashInflictFeelingStrange() {
	if (InflictStatusBattle(currentTarget, 3, Status3.Strange) != 0) {
		DisplayInBattleText(TextBattleFeltALittleStrange);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C29917
void FlashInflictParalysis()  {
	if (InflictStatusBattle(currentTarget, 0, Status0.Paralyzed) != 0) {
		DisplayInBattleText(TextBattleBecameNumb);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C29950
void FlashInflictCrying() {
	if (InflictStatusBattle(currentTarget, 2, Status2.Crying) != 0) {
		DisplayInBattleText(TextBattleCouldNotStopCrying);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C29987
void BattleActionPSIFlashAlpha() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (FlashImmunityTest() != 0) {
		if ((rand() & 7) == 0) {
			FlashInflictFeelingStrange();
		} else {
			FlashInflictCrying();
		}
	}
	WeakenShield();
}

/// $C299AE
void BattleActionPSIFlashBeta() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (FlashImmunityTest() != 0) {
		switch (rand() & 7) {
			case 0:
				KOTarget(currentTarget);
				break;
			case 1:
				FlashInflictParalysis();
				break;
			case 2:
				FlashInflictFeelingStrange();
				break;
			default:
				FlashInflictCrying();
				break;
		}
	}
	WeakenShield();
}

/// $C299EF
void BattleActionPSIFlashGamma() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (FlashImmunityTest() != 0) {
		switch (rand() & 7) {
			case 0:
			case 1:
				KOTarget(currentTarget);
				break;
			case 2:
				FlashInflictParalysis();
				break;
			case 3:
				FlashInflictFeelingStrange();
				break;
			default:
				FlashInflictCrying();
				break;
		}
	}
	WeakenShield();
}

/// $C29A35
void BattleActionPSIFlashOmega() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (FlashImmunityTest() != 0) {
		switch (rand() & 7) {
			case 0:
			case 1:
			case 2:
				KOTarget(currentTarget);
				break;
			case 3:
				FlashInflictParalysis();
				break;
			case 4:
				FlashInflictFeelingStrange();
				break;
			default:
				FlashInflictCrying();
				break;
		}
	}
	WeakenShield();
}

/// $C29A80
void PSIStarstormCommon(short baseDamage) {
	if (PSIShieldNullify() != 0) {
		return;
	}
	CalcResistDamage(TwentyFivePercentVariance(baseDamage), 0xFF);
	WeakenShield();
}

/// $C29AA6
void BattleActionPSIStarstormAlpha() {
	PSIStarstormCommon(360);
}

/// $C29AAF
void BattleActionPSIStarstormOmega() {
	PSIStarstormCommon(720);
}

/// $C29AB8
void LifeupCommon(short baseHealing);

/// $C29AC6
void BattleActionLifeupAlpha() {
	LifeupCommon(100);
}

/// $C29ACF
void BattleActionLifeupBeta() {
	LifeupCommon(300);
}

/// $C29AD8
void BattleActionLifeupGamma() {
	LifeupCommon(10000);
}

/// $C29AE1
void BattleActionLifeupOmega() {
	LifeupCommon(400);
}

/// $C29AEA
void BattleActionHealingAlpha() {
	switch (currentTarget.afflictions[0]) {
		case Status0.Cold:
			currentTarget.afflictions[0] = 0;
			DisplayInBattleText(TextBattleGotOverCold);
			break;
		case Status0.Sunstroke:
			currentTarget.afflictions[0] = 0;
			DisplayInBattleText(TextBattleSunstrokeCured);
			break;
		default:
			if (currentTarget.afflictions[2] == Status2.Asleep) {
				currentTarget.afflictions[2] = 0;
				DisplayInBattleText(TextBattleWokeUp);
			} else {
				DisplayInBattleText(TextBattleNoVisibleEffect);
			}
			break;
	}
}

/// $C29B7A
void BattleActionHealingBeta() {
	switch (currentTarget.afflictions[0]) {
		case Status0.Poisoned:
			currentTarget.afflictions[0] = 0;
			DisplayInBattleText(TextBattlePoisonWasRemoved);
			break;
		case Status0.Nauseous:
			currentTarget.afflictions[0] = 0;
			DisplayInBattleText(TextBattleFeltMuchBetter);
			break;
		default:
			if (currentTarget.afflictions[2] == Status2.Crying) {
				currentTarget.afflictions[2] = 0;
				DisplayInBattleText(TextBattleStoppedCrying);
			} else if (currentTarget.afflictions[3] == Status3.Strange) {
				currentTarget.afflictions[3] = 0;
				DisplayInBattleText(TextBattleBackToNormal);
			} else {
				BattleActionHealingAlpha();
			}
			break;
	}
}

/// $C29C2C
void BattleActionHealingGamma() {
	switch (currentTarget.afflictions[0]) {
		case Status0.Paralyzed:
			currentTarget.afflictions[0] = 0;
			DisplayInBattleText(TextBattleNumbnessGone);
			break;
		case Status0.Diamondized:
			currentTarget.afflictions[0] = 0;
			DisplayInBattleText(TextBattleBodyReturnedToNormal);
			break;
		case Status0.Unconscious:
			if (Success255(192) != 0) {
				ReviveTarget(currentTarget, currentTarget.hpMax / 4);
			} else {
				DisplayInBattleText(TextBattleReviveDidntWork);
			}
			break;
		default:
			BattleActionHealingBeta();
			break;
	}
}

/// $C29CB8
void BattleActionHealingOmega() {
	if (currentTarget.afflictions[0] == Status0.Unconscious) {
		ReviveTarget(currentTarget, currentTarget.hpMax);
	} else {
		BattleActionHealingGamma();
	}
}

/// $C29CDC
short ShieldsCommon(Battler* target, ubyte status) {
	if (target.afflictions[6] == status) {
		target.shieldHP += 3;
		if (target.shieldHP > 8) {
			target.shieldHP = 8;
		}
		return 1;
	}
	target.afflictions[6] = status;
	target.shieldHP = 3;
	return 0;
}

/// $C29D44
void BattleActionShieldAlpha() {
	if (ShieldsCommon(currentTarget, Status6.Shield) == 1) {
		DisplayInBattleText(TextBattleShieldGotStronger);
	} else {
		DisplayInBattleText(TextBattleProtectedByShield);
	}
}

/// $C29D7A
void BattleActionShieldSigma() {
	BattleActionShieldAlpha();
}

/// $C29D81
void BattleActionShieldBeta() {
	if (ShieldsCommon(currentTarget, Status6.ShieldPower) == 1) {
		DisplayInBattleText(TextBattlePowerShieldGotStronger);
	} else {
		DisplayInBattleText(TextBattleProtectedByPowerShield);
	}
}

/// $C29DB7
void BattleActionShieldOmega() {
	BattleActionShieldBeta();
}

/// $C29DBE
void BattleActionPSIShieldAlpha() {
	if (ShieldsCommon(currentTarget, Status6.PSIShield) == 1) {
		DisplayInBattleText(TextBattlePsychicShieldGotStronger);
	} else {
		DisplayInBattleText(TextBattleProtectedByPsychicShield);
	}
}

/// $C29DF4
void BattleActionPSIShieldSigma() {
	BattleActionPSIShieldAlpha();
}

/// $C29DFB
void BattleActionPSIShieldBeta() {
	if (ShieldsCommon(currentTarget, Status6.PSIShieldPower) == 1) {
		DisplayInBattleText(TextBattlePsychicPowerShieldGotStronger);
	} else {
		DisplayInBattleText(TextBattleProtectedByPsychicPowerShield);
	}
}

/// $C29E31
void BattleActionPSIShieldOmega() {
	BattleActionPSIShieldBeta();
}

/// $C29E38
void BattleActionOffenseUpAlpha() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	short x16 = currentTarget.offense;
	IncreaseOffense16th(currentTarget);
	DisplayTextWait(TextBattleOffenseWentUp, currentTarget.offense - x16);
}

/// $C29E7F
void BattleActionOffenseUpOmega() {
	BattleActionOffenseUpAlpha();
}

/// $C29F06
void BattleActionHypnosisAlpha() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if ((Success255(currentTarget.hypnosisResist) != 0) && (InflictStatusBattle(currentTarget, 2, Status2.Asleep) != 0)) {
		DisplayInBattleText(TextBattleFellAsleep);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C29F57
void BattleActionHypnosisOmega() {
	BattleActionHypnosisAlpha();
}

/// $C29E86
void BattleActionDefenseDownAlpha() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (SuccessLuck80() != 0) {
		short x16 = currentTarget.defense;
		HexadecimateDefense(currentTarget);
		DisplayTextWait(TextBattleDefenseWentDown, x16 - currentTarget.defense);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C29EFF
void BattleActionDefenseDownOmega() {
	BattleActionDefenseDownAlpha();
}

/// $C29F5E
void BattleActionPSIMagnetAlpha();

/// $C29FE1
void BattleActionPSIMagnetOmega() {
	if ((currentTarget.allyOrEnemy != 0) || (currentTarget.id != 3)) {
		BattleActionPSIMagnetAlpha();
	}
}

/// $C29FFE
void BattleActionParalysisAlpha() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if ((Success255(currentTarget.paralysisResist) != 0) && (InflictStatusBattle(currentTarget, 0, Status0.Paralyzed) != 0)) {
		DisplayInBattleText(TextBattleBecameNumb);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A04F
void BattleActionParalysisOmega() {
	BattleActionParalysisAlpha();
}

/// $C2A056
void BattleActionBrainshockAlpha() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if ((Success255(currentTarget.brainshockResist) != 0) && (InflictStatusBattle(currentTarget, 3, Status3.Strange) != 0)) {
		DisplayInBattleText(TextBattleFeltALittleStrange);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A0A7
void BattleActionBrainshockOmega() {
	BattleActionBrainshockAlpha();
}

/// $C2A0AE
void BattleActionHPRecovery1d4() {
	RecoverHP(currentTarget, RandLimit(4));
}

/// $C2A0BF
void BattleActionHPRecovery50() {
	RecoverHP(currentTarget, TwentyFivePercentVariance(50));
}

/// $C2A0CF
void BattleActionHPRecovery200() {
	RecoverHP(currentTarget, TwentyFivePercentVariance(200));
}

/// $C2A0DF
void BattleActionPPRecovery20() {
	RecoverPP(currentTarget, TwentyFivePercentVariance(20));
}

/// $C2A0EF
void BattleActionPPRecovery80() {
	RecoverPP(currentTarget, TwentyFivePercentVariance(80));
}

/// $C2A0FF
void BattleActionIQUp1d4() {
	short x16 = cast(short)(RandLimit(4) + 1);
	currentTarget.iq += cast(ubyte)x16;
	DisplayTextWait(TextBattleIQWentUp, x16);
}

/// $C2A14B
void BattleActionGutsUp1d4() {
	short x16 = cast(short)(RandLimit(4) + 1);
	currentTarget.guts += x16;
	DisplayTextWait(TextBattleGutsWentUp, x16);
}

/// $C2A193
void BattleActionSpeedUp1d4() {
	short x16 = cast(short)(RandLimit(4) + 1);
	currentTarget.speed += x16;
	DisplayTextWait(TextBattleSpeedWentUp, x16);
}

/// $C2A1DB
void BattleActionVitalityUp1d4() {
	short x16 = cast(short)(RandLimit(4) + 1);
	currentTarget.vitality += cast(ubyte)x16;
	DisplayTextWait(TextBattleVitalityWentUp, x16);
}

/// $C2A227
void BattleActionLuckUp1d4() {
	short x16 = cast(short)(RandLimit(4) + 1);
	currentTarget.luck += x16;
	DisplayTextWait(TextBattleLuckWentUp, x16);
}

/// $C2A26F
void BattleActionHPRecovery300() {
	RecoverHP(currentTarget, TwentyFivePercentVariance(300));
}

/// $C2A27F
void BattleActionRandomStatUp1d4() {
	switch (RandLimit(7)) {
		case 0:
			short x16 = cast(short)(RandLimit(4) + 1);
			currentTarget.defense += x16;
			DisplayTextWait(TextBattleDefenseWentUp, x16);
			break;
		case 1:
			short x16 = cast(short)(RandLimit(4) + 1);
			currentTarget.offense += x16;
			DisplayTextWait(TextBattleOffenseWentUp, x16);
			break;
		case 2:
			BattleActionSpeedUp1d4();
			break;
		case 3:
			BattleActionGutsUp1d4();
			break;
		case 4:
			BattleActionVitalityUp1d4();
			break;
		case 5:
			BattleActionIQUp1d4();
			break;
		case 6:
			BattleActionLuckUp1d4();
			break;
		default: break;
	}
}

/// $C2A2F9
immutable ubyte[16] PrayerList = [0, 0, 0, 0, 0, 1, 1, 2, 3, 4, 5, 5, 6, 7, 8, 9];

/// $C2A2F9
immutable const(ubyte)*[10] PrayerTextPointers = [
	null /+TextSubtleLight+/,
	null /+TextWarmLight+/,
	null /+TextMysteriousLight+/,
	null /+TextGoldenLight+/,
	null /+TextDazzlingLightChased+/,
	null /+TextDazzlingLightEnveloped+/,
	null /+TextRainbowLight+/,
	null /+TextMysteriousAroma+/,
	null /+TextHeavenRendingSound+/,
	null /+TextHeavyAir+/,
];

/// $C2A360
void BattleActionHPRecovery10() {
	RecoverHP(currentTarget, TwentyFivePercentVariance(10));
}

/// $C2A370
void BattleActionHPRecovery100() {
	RecoverHP(currentTarget, TwentyFivePercentVariance(100));
}

/// $C2A380
void BattleActionHPRecovery10000() {
	if (currentTarget.id != 4) {
		RecoverHP(currentTarget, 10000);
	} else {
		BattleActionHPRecovery1d4();
	}
}

/// $C2A3D1
void BattleActionCounterPSI() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if ((SuccessLuck40() != 0) &&(currentTarget.afflictions[4] == 0)) {
		currentTarget.afflictions[4] = 4;
		DisplayInBattleText(TextBattleWasNotAbleToConcentrate);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A39D
void HealPoison() {
	if (currentTarget.afflictions[0] == Status0.Poisoned) {
		currentTarget.afflictions[0] = 0;
		DisplayInBattleText(TextBattlePoisonWasRemoved);
	}
}

/// $C2A422
void BattleActionShieldKiller() {
	if ((SuccessLuck80() != 0) && (currentTarget.afflictions[6] != 0)) {
		currentTarget.afflictions[6] = 0;
		DisplayInBattleText(TextBattleShieldDisappeared);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A46B
void BattleActionHPSucker() {
	if ((SuccessLuck80() != 0) && (currentAttacker.hpTarget != 0)) {
		if (currentTarget is currentAttacker) {
			DisplayInBattleText(TextBattleDrainedOwnHP);
		} else {
			short x16 = FiftyPercentVariance(currentTarget.hpMax) / 8;
			ReduceHP(currentTarget, x16);
			DisplayTextWait(TextBattleDrainedHP, x16);
			SetHP(currentAttacker, cast(short)(currentAttacker.hp + x16));
			if (currentTarget.hp == 0) {
				KOTarget(currentTarget);
			}
		}
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A507
void BattleActionHungryHPSucker() {
	BattleActionHPSucker();
}

/// $C2A50E
void BattleActionMummyWrap() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (SuccessSpeed(250) != 0) {
		short damageDone = cast(short)(400 - currentTarget.defense);
		if (damageDone > 0) {
			CalcResistDamage(damageDone, 0xFF);
		}
		if (InflictStatusBattle(currentTarget, 2, Status2.Solidified) != 0) {
			DisplayInBattleText(TextBattleBodySolidified);
		}
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A57A
void BottleRocketCommon(short count) {
	short x14 = 0;
	for (short i = 0; i < count; i++) {
		if (SuccessSpeed(100) == 0) {
			continue;
		}
		x14++;
	}
	if (x14 != 0) {
		CalcResistDamage(TwentyFivePercentVariance(cast(short)(120 * x14)), 0xFF);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A5D1
void BattleActionBottleRocket() {
	BottleRocketCommon(1);
}

/// $C2A5DA
void BattleActionBigBottleRocket() {
	BottleRocketCommon(5);
}

/// $C2A5E3
void BattleActionMultiBottleRocket() {
	BottleRocketCommon(20);
}

/// $C2A5EC
void BattleActionHandbagStrap() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if ((SuccessSpeed(250) != 0) && (100 - currentTarget.defense > 0)) {
		CalcResistDamage(cast(short)(100 - currentTarget.defense), 0xFF);
		if (InflictStatusBattle(currentTarget, 2, Status2.Solidified) != 0) {
			DisplayInBattleText(TextBattleBodySolidified);
		}
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A658
void BombCommon(short baseDamage) {
	Battler* x18 = null;
	Battler* x04 = null;
	CalcResistDamage(FiftyPercentVariance(baseDamage), 0xFF);
	if (currentTarget.allyOrEnemy == 0) {
		short x16;
		for (x16 = 0; x16 < 6; x16++) {
			if (currentTarget.id == gameState.partyMembers[x16]) {
				break;
			}
		}
		if (x16 != 0) {
			x04 = &BattlersTable[x16 - 1];
		}
		if ((1 <= gameState.partyMembers[x16 + 1]) && (gameState.partyMembers[x16 + 1] <= 4)) {
			x18 = &BattlersTable[x16 + 1];
		}
	} else {
		for (short i = 8; i < BattlersTable.length; i++) {
			if (&BattlersTable[i] is currentTarget) {
				continue;
			}
			if (BattlersTable[i].allyOrEnemy != 1) {
				continue;
			}
			if (BattlersTable[i].row != currentTarget.row) {
				continue;
			}
			if (BattlersTable[i].spriteX < currentTarget.spriteX) {
				if (currentTarget.spriteX - BattlersTable[i].spriteX <= (((GetBattleSpriteWidth(BattlersTable[i].sprite) + GetBattleSpriteWidth(currentTarget.sprite)) * 4) + 8)) {
					x04 = &BattlersTable[i];
				}
			} else {
				if (BattlersTable[i].spriteX - currentTarget.spriteX <= (((GetBattleSpriteWidth(BattlersTable[i].sprite) + GetBattleSpriteWidth(currentTarget.sprite)) * 4) + 8)) {
					x18 = &BattlersTable[i];
				}
			}
		}
	}
	Battler* x14 = currentTarget;
	if (x04 !is null) {
		currentTarget = x04;
		FixTargetName();
		CalcResistDamage(FiftyPercentVariance(baseDamage / 2), 0xFF);
	}
	if (x18 !is null) {
		currentTarget = x18;
		FixTargetName();
		CalcResistDamage(FiftyPercentVariance(baseDamage / 2), 0xFF);
	}
	currentTarget = x14;
	FixTargetName();
}

/// $C2A818
void BattleActionBomb() {
	BombCommon(90);
}

/// $C2A821
void BattleActionSuperBomb() {
	BombCommon(270);
}

/// $C2A86B
void BattleActionYogurtDispenser() {
	if (SuccessSpeed(250) != 0) {
		CalcResistDamage(RandLimit(4), 0xFF);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A89D
void BattleActionSnake() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (SuccessSpeed(250) != 0) {
		CalcResistDamage(RandLimit(4), 0xFF);
		if (Success255(128) == 0) {
			return;
		}
		if (InflictStatusBattle(currentTarget, 0, Status0.Poisoned) == 0) {
			return;
		}
		DisplayInBattleText(TextBattleGotPoisoned);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2A99C
void BattleActionBagOfDragonite() {
	CalcResistDamage(TwentyFivePercentVariance(800), currentTarget.fireResist);
}

/// $C2A9BD
void InsectSprayCommon(short baseDamage) {
	if ((SuccessLuck80() != 0) && (currentTarget.allyOrEnemy == 1) && (GetEnemyType(currentTarget.id) == EnemyType.Insect)) {
		CalcResistDamage(FiftyPercentVariance(baseDamage), 0xFF);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2AA0C
void BattleActionInsecticideSpray() {
	InsectSprayCommon(100);
}

/// $C2AA15
void BattleActionXterminatorSpray() {
	InsectSprayCommon(200);
}

/// $C2AA1E
void RustSprayCommon(short baseDamage) {
	if ((SuccessLuck80() != 0) && (currentTarget.allyOrEnemy == 1) && (GetEnemyType(currentTarget.id) == EnemyType.Metal)) {
		CalcResistDamage(FiftyPercentVariance(baseDamage), 0xFF);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2AA6D
void BattleActionRustPromoter() {
	RustSprayCommon(200);
}

/// $C2AA76
void BattleActionRustPromoterDX() {
	RustSprayCommon(400);
}

/// $C2AA7F
void BattleActionSuddenGutsPill() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	currentTarget.guts = (currentTarget.guts * 2 >= 255) ? 255 : cast(ubyte)(currentTarget.guts * 2);
	DisplayTextWait(TextBattleGutsBecame, currentTarget.guts);
}

/// $C2AAC6
void BattleActionDefenseSpray() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	short x16 = currentTarget.defense;
	IncreaseDefense16th(currentTarget);
	DisplayTextWait(TextBattleDefenseWentUp, currentTarget.defense - x16);
}

/// $C2AB0D
void BattleActionDefenseShower() {
	BattleActionDefenseSpray();
}

/// $C2AB14 - returns 0 if there's a boss in the battle
short BossBattleCheck() {
	for (short i = 0; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		if (BattlersTable[i].allyOrEnemy != 1) {
			continue;
		}
		if (EnemyConfigurationTable[BattlersTable[i].id].boss == 0) {
			continue;
		}
		return 0;
	}
	return 1;
}

/// $C2AB71
void BattleActionTeleportBox() {
	if ((LoadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & 0x80) == 0) {
		if ((BattleModeFlag == 0) || ((RandLimit(100) < ItemData[currentAttacker.currentActionArgument].parameters.strength) && (BossBattleCheck() != 0))) {
			RemoveItemFromInventoryF(currentAttacker.id, currentAttacker.unknown7);
			DisplayInBattleText(TextBattleTeleportBoxExploded);
			SetTeleportState(gameState.unknownC3, TeleportStyle.Instant);
			Unknown7EAA0E = 1;
		} else {
			DisplayInBattleText(TextBattleTeleportBoxFailed);
		}
	} else {
		DisplayInBattleText(TextBattleTeleportBoxCannotBeUsedHere);
	}
}

/// $C2AC2A
void BattleActionPraySubtle() {
	RecoverHP(currentTarget, currentTarget.hpMax / 16);
}

/// $C2AC3E
void BattleActionPrayWarm() {
	RecoverHP(currentTarget, currentTarget.hpMax / 8);
}

/// $C2AC51
void BattleActionPrayGolden() {
	RecoverHP(currentTarget, cast(short)(currentTarget.hpMax - currentAttacker.hpTarget));
}

/// $C2AC68
void BattleActionPrayMysterious() {
	short x = FiftyPercentVariance(5);
	if (x == 0) {
		x++;
	}
	RecoverPP(currentTarget, x);
}

/// $C2AC7B
void BattleActionPrayRainbow() {
	if (currentTarget.afflictions[0] == Status0.Unconscious) {
		ReviveTarget(currentTarget, currentTarget.hpMax);
	}
}

/// $C2AC99
void BattleActionPrayAroma() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (InflictStatusBattle(currentTarget, 2, Status2.Asleep) != 0) {
		DisplayInBattleText(TextBattleFellAsleep);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2ACDA
void BattleActionPrayRendingSound() {
	if (FailAttackOnNPCs() != 0) {
		return;
	}
	if (InflictStatusBattle(currentTarget, 3, Status3.Strange) != 0) {
		DisplayInBattleText(TextBattleFeltALittleStrange);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

/// $C2AD1B
void BattleActionPray() {
	short x16 = PrayerList[RandLimit(16)];
	DisplayInBattleText(PrayerTextPointers[x16]);
	void function() x12;
	switch (x16) {
		case 0:
			TargetAllies();
			RemoveNPCTargetting();
			x12 = &BattleActionPraySubtle;
			break;
		case 1:
			TargetAllies();
			RemoveNPCTargetting();
			x12 = &BattleActionPrayWarm;
			break;
		case 2:
			TargetAllies();
			RemoveNPCTargetting();
			x12 = &BattleActionPrayMysterious;
			break;
		case 3:
			TargetAllies();
			RemoveNPCTargetting();
			RemoveDeadTargetting();
			BattlerTargetFlags = RandomTargetting(BattlerTargetFlags);
			x12 = &BattleActionPrayGolden;
			break;
		case 4:
			TargetAllEnemies();
			RemoveNPCTargetting();
			BattlerTargetFlags = RandomTargetting(BattlerTargetFlags);
			x12 = &BattleActionPSIRockinBeta;
			break;
		case 5:
			TargetAll();
			x12 = &BattleActionPSIFlashAlpha;
			break;
		case 6:
			TargetAll();
			x12 = &BattleActionPrayRainbow;
			break;
		case 7:
			TargetAll();
			x12 = &BattleActionPrayAroma;
			break;
		case 8:
			TargetAll();
			x12 = &BattleActionPrayRendingSound;
			break;
		case 9:
			TargetAll();
			x12 = &BattleActionDefenseDownAlpha;
			break;
		default: break;
	}
	if (x16 != 6) {
		RemoveDeadTargetting();
	}
	UnknownC240A4(x12);
	BattlerTargetFlags = 0;
}

/// $C2AF1F
void CopyMirrorData(Battler* arg1, Battler* arg2) {
	short x44 = arg1.hp;
	short x3E = arg1.pp;
	short x38 = arg1.hpTarget;
	short x32 = arg1.ppTarget;
	short x2C = arg1.hpMax;
	short x26 = arg1.ppMax;
	ubyte x04 = arg1.allyOrEnemy;
	ubyte x02 = arg1.row;
	short x18 = arg1.id;
	ubyte x16 = arg1.hasTakenTurn;

	memcpy(arg1, arg2, Battler.sizeof);

	arg1.hp = x44;
	arg1.pp = x3E;
	arg1.hpTarget = x38;
	arg1.ppTarget = x32;
	arg1.hpMax = x2C;
	arg1.ppMax = x26;
	arg1.allyOrEnemy = x04;
	arg1.row = x02;
	arg1.id = x18;
	arg1.hasTakenTurn = x16;
}

/// $C2B0A1
void BattleActionMirror() {
	if ((currentTarget.allyOrEnemy != 0) && (currentTarget.npcID == 0) && (RandLimit(100) < EnemyConfigurationTable[currentTarget.id].mirrorSuccess)) {
		MirrorEnemy = currentTarget.id;
		MirrorTurnTimer = 16;
		memcpy(&Unknown7EAA14, currentAttacker, Battler.sizeof);
		CopyMirrorData(currentAttacker, currentTarget);
		DisplayInBattleText(TextBattleTurnedIntoEnemy);
	} else {
		DisplayInBattleText(TextBattleDidntTurnIntoEnemy);
	}
}

/// $C2B172
const(ItemParameters)* ApplyCondiment() {
	short x16 = currentAttacker.currentActionArgument;
	short x02 = FindCondiment(cast(ubyte)x16);
	if (x02 != 0) {
		TakeItemFromCharacter(currentAttacker.id, x02);
		for (short i = 0; CondimentTable[i].item != 0; i++) {
			if (CondimentTable[i].item != x16) {
				continue;
			}
			if ((CondimentTable[i].goodCondiments[0] != x02) && (CondimentTable[i].goodCondiments[1] != x02)) {
				break;
			}
			DisplayInBattleText(TextBattleItWasPrettyGood);
			return &CondimentTable[i].parameters;
		}
		DisplayInBattleText(TextBattleItDidntTasteVeryGood);
	}
	return &ItemData[x16].parameters;
}

/// $C2B27D
void EatFood() {
	short x1C = currentTarget.id;
	if (PartyCharacters[x1C - 1].afflictions[0] == Status0.Unconscious) {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
		return;
	}
	const(ItemParameters)* x18 = ApplyCondiment();
	ubyte x16 = x18.raw[(x1C == 4) ? 2 : 1];
	switch (x18.raw[0]) {
		case 0:
			RecoverHP(currentTarget, (x16 != 0) ? TwentyFivePercentVariance(x16 * 6) : 30000);
			break;
		case 1:
			RecoverPP(currentTarget, (x16 != 0) ? TwentyFivePercentVariance(x16) : 30000);
			break;
		case 2:
			RecoverHP(currentTarget, (x16 != 0) ? TwentyFivePercentVariance(x16 * 6) : 30000);
			RecoverPP(currentTarget, (x16 != 0) ? TwentyFivePercentVariance(x16) : 30000);
			break;
		case 3:
			switch (RandLimit(4)) {
				case 0:
					goto BoostIQ;
				case 1:
					goto BoostGuts;
				case 2:
					goto BoostSpeed;
				case 3:
					goto BoostVitality;
				case 4:
					goto BoostLuck;
				default: break;
			}
			break;
		case 4:
		BoostIQ:
			currentTarget.iq += cast(ubyte)x16;
			PartyCharacters[x1C - 1].boosted_iq += cast(ubyte)x16;
			RecalcCharacterPostmathIQ(x1C);
			DisplayTextWait(TextBattleIQWentUp, x16);
			break;
		case 5:
		BoostGuts:
			currentTarget.guts += x16;
			PartyCharacters[x1C - 1].boosted_guts += cast(ubyte)x16;
			RecalcCharacterPostmathGuts(x1C);
			DisplayTextWait(TextBattleGutsWentUp, x16);
			break;
		case 6:
		BoostSpeed:
			currentTarget.speed += x16;
			PartyCharacters[x1C - 1].boosted_speed += cast(ubyte)x16;
			RecalcCharacterPostmathSpeed(x1C);
			DisplayTextWait(TextBattleSpeedWentUp, x16);
			break;
		case 7:
		BoostVitality:
			currentTarget.vitality += cast(ubyte)x16;
			PartyCharacters[x1C - 1].boosted_vitality += cast(ubyte)x16;
			RecalcCharacterPostmathVitality(x1C);
			DisplayTextWait(TextBattleVitalityWentUp, x16);
			break;
		case 8:
		BoostLuck:
			currentTarget.luck += x16;
			PartyCharacters[x1C - 1].boosted_luck += cast(ubyte)x16;
			RecalcCharacterPostmathLuck(x1C);
			DisplayTextWait(TextBattleLuckWentUp, x16);
			break;
		case 9:
			BattleActionHealingAlpha();
			break;
		case 10:
			HealPoison();
			break;
		default: break;
	}
	if (x18.ep != 0) {
		UnknownC076C8(x18.ep);
	}
}

/// $C2B608
ubyte CalcPSIDamageModifiers(ubyte arg1) {
	switch (arg1) {
		case 0: return 255;
		case 1: return 179;
		case 2: return 102;
		case 3: return 13;
		default: return arg1;
	}
}
/// $C2B639
ubyte CalcPSIResistanceModifiers(ubyte arg1) {
	switch (arg1) {
		case 0: return 255;
		case 1: return 128;
		case 2: return 26;
		case 3: return 0;
		default: return arg1;
	}
}

/// $C2B66A
ubyte UnknownC2B66A(short arg1) {
	memset(&Unknown7EAA98, 0, 26);
	for (short i = 0; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		if (BattlersTable[i].allyOrEnemy != 1) {
			continue;
		}
		if (BattlersTable[i].id2 != arg1) {
			continue;
		}
		Unknown7EAA98[BattlersTable[i].theFlag - 1] = 1;
	}
	for (short i = 0; i < 26; i++) {
		if (Unknown7EAA98[i] != 0) {
			continue;
		}
		return cast(ubyte)(i + 1);
	}
	return 0;
}

/// $C2B6EB
void BattleInitEnemyStats(short arg1, Battler* battler) {
	memset(battler, 0, Battler.sizeof);
	if (EnemyConfigurationTable[arg1].level > Unknown7EAA0C) {
		Unknown7EAA0C = EnemyConfigurationTable[arg1].level;
	}
	battler.id = cast(ubyte)arg1;
	battler.id2 = cast(ubyte)arg1;
	battler.sprite = cast(ubyte)EnemyConfigurationTable[arg1].battleSprite;
	battler.theFlag = UnknownC2B66A(arg1);
	battler.consciousness = 1;
	battler.allyOrEnemy = 1;
	battler.npcID = 0;
	battler.row = EnemyConfigurationTable[arg1].row;
	battler.hp = battler.hpTarget = battler.hpMax = EnemyConfigurationTable[arg1].hp;
	battler.pp = battler.ppTarget = battler.ppMax = EnemyConfigurationTable[arg1].pp;
	battler.offense = battler.baseOffense = cast(ubyte)EnemyConfigurationTable[arg1].offense;
	battler.defense = battler.baseDefense = cast(ubyte)EnemyConfigurationTable[arg1].defense;
	battler.speed = battler.baseSpeed = EnemyConfigurationTable[arg1].speed;
	battler.guts = battler.baseGuts = EnemyConfigurationTable[arg1].guts;
	battler.luck = battler.baseLuck = EnemyConfigurationTable[arg1].luck;
	battler.vitality = 0;
	battler.iq = EnemyConfigurationTable[arg1].iq;
	battler.fireResist = CalcPSIDamageModifiers(EnemyConfigurationTable[arg1].fireResist);
	battler.freezeResist = CalcPSIDamageModifiers(EnemyConfigurationTable[arg1].freezeResist);
	battler.flashResist = CalcPSIResistanceModifiers(EnemyConfigurationTable[arg1].flashResist);
	battler.paralysisResist = CalcPSIResistanceModifiers(EnemyConfigurationTable[arg1].paralysisResist);
	battler.hypnosisResist = CalcPSIResistanceModifiers(EnemyConfigurationTable[arg1].hypnosisBrainshockResist);
	battler.brainshockResist = CalcPSIResistanceModifiers(cast(ubyte)(3 - EnemyConfigurationTable[arg1].hypnosisBrainshockResist));
	battler.money = EnemyConfigurationTable[arg1].money;
	battler.exp = EnemyConfigurationTable[arg1].exp;
	switch (EnemyConfigurationTable[arg1].initialStatus) {
		case InitialStatus.PSIShield:
			ShieldsCommon(battler, Status6.PSIShield);
			break;
		case InitialStatus.PSIShieldPower:
			ShieldsCommon(battler, Status6.PSIShieldPower);
			break;
		case InitialStatus.Shield:
			ShieldsCommon(battler, Status6.Shield);
			break;
		case InitialStatus.ShieldPower:
			ShieldsCommon(battler, Status6.ShieldPower);
			break;
		case InitialStatus.Asleep:
			battler.afflictions[2] = Status2.Asleep;
			break;
		case InitialStatus.CantConcentrate:
			battler.afflictions[4] = Status4.CantConcentrate4;
			break;
		case InitialStatus.Strange:
			battler.afflictions[3] = Status3.Strange;
			break;
		default: break;
	}
}

/// $C2B930
void BattleInitPlayerStats(short arg1, Battler* battler) {
	memset(battler, 0, Battler.sizeof);
	battler.id = cast(ubyte)arg1;
	battler.sprite = 0;
	battler.consciousness = 1;
	battler.allyOrEnemy = 0;
	battler.npcID = 0;
	battler.hp = PartyCharacters[arg1 - 1].hp.current.integer;
	battler.hpTarget = PartyCharacters[arg1 - 1].hp.target;
	battler.hpMax = PartyCharacters[arg1 - 1].maxHP;
	battler.pp = PartyCharacters[arg1 - 1].pp.current.integer;
	battler.ppTarget = PartyCharacters[arg1 - 1].pp.target;
	battler.ppMax = PartyCharacters[arg1 - 1].maxPP;
	memcpy(&battler.afflictions[0], &PartyCharacters[arg1 - 1].afflictions[0], battler.afflictions.length);
	battler.offense = battler.baseOffense = PartyCharacters[arg1 - 1].offense;
	battler.defense = battler.baseDefense = PartyCharacters[arg1 - 1].defense;
	battler.speed = battler.baseSpeed = PartyCharacters[arg1 - 1].speed;
	battler.guts = battler.baseGuts = PartyCharacters[arg1 - 1].guts;
	battler.luck = battler.baseLuck = PartyCharacters[arg1 - 1].luck;
	battler.vitality = PartyCharacters[arg1 - 1].vitality;
	battler.iq = PartyCharacters[arg1 - 1].iq;
	battler.fireResist = CalcPSIDamageModifiers(PartyCharacters[arg1 - 1].fireResist);
	battler.freezeResist = CalcPSIDamageModifiers(PartyCharacters[arg1 - 1].freezeResist);
	battler.flashResist = CalcPSIResistanceModifiers(PartyCharacters[arg1 - 1].flashResist);
	battler.paralysisResist = CalcPSIResistanceModifiers(PartyCharacters[arg1 - 1].paralysisResist);
	battler.hypnosisResist = CalcPSIResistanceModifiers(PartyCharacters[arg1 - 1].hypnosisBrainshockResist);
	battler.brainshockResist = CalcPSIResistanceModifiers(cast(ubyte)(3 - PartyCharacters[arg1 - 1].hypnosisBrainshockResist));
	battler.row = cast(ubyte)(arg1 - 1);
}

/// $C2BAC5
short CountChars(short arg1) {
	short result = 0;
	for (short i = 0; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		if (BattlersTable[i].allyOrEnemy != arg1) {
			continue;
		}
		if (BattlersTable[i].npcID != 0) {
			continue;
		}
		if ((BattlersTable[i].afflictions[0] == Status0.Unconscious) || (BattlersTable[i].afflictions[0] == Status0.Diamondized)) {
			continue;
		}
		result++;
	}
	return result;
}

/// $C2BB18
void CheckDeadPlayers() {
	for (short i = 0; i < 6; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		if (BattlersTable[i].allyOrEnemy != 0) {
			continue;
		}
		if (BattlersTable[i].npcID != 0) {
			continue;
		}
		BattlersTable[i].hp = PartyCharacters[BattlersTable[i].row].hp.current.integer;
		BattlersTable[i].pp = PartyCharacters[BattlersTable[i].row].pp.current.integer;
		if ((PartyCharacters[BattlersTable[i].row].hp.current.integer == 0) && (BattlersTable[i].afflictions[0] != Status0.Unconscious)) {
			currentTarget = &BattlersTable[i];
			currentTarget.afflictions[0] = Status0.Unconscious;
			currentTarget.afflictions[6] = 0;
			currentTarget.afflictions[5] = 0;
			currentTarget.afflictions[4] = 0;
			currentTarget.afflictions[3] = 0;
			currentTarget.afflictions[2] = 0;
			currentTarget.afflictions[1] = 0;
			FixTargetName();
			short x16 = WindowTable[Window.TextBattle];
			CreateWindow(Window.TextBattle);
			DisplayInBattleText(TextBattleGotHurtAndCollapsed);
			if (x16 == -1) {
				CloseFocusWindow();
			}
		}
		for (short j = 0; j < 7; j++) {
			PartyCharacters[BattlersTable[i].row].afflictions[j] = BattlersTable[i].afflictions[j];
		}
		if (PartyCharacters[BattlersTable[i].row].afflictions[4] != 0) {
			PartyCharacters[BattlersTable[i].row].afflictions[4] = Status4.CantConcentrate4;
		}
		UpdateParty();
	}
}

/// $C2BC5C
void ResetPostBattleStats() {
	for (short i = 0; i < 6; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		if (BattlersTable[i].allyOrEnemy != 0) {
			continue;
		}
		if (BattlersTable[i].npcID != 0) {
			continue;
		}
		PartyCharacters[BattlersTable[i].row].afflictions[6] = 0;
		PartyCharacters[BattlersTable[i].row].afflictions[4] = 0;
		PartyCharacters[BattlersTable[i].row].afflictions[3] = 0;
		PartyCharacters[BattlersTable[i].row].afflictions[2] = 0;
	}
}

/// $C2BCB9
void UnknownC2BCB9(Battler* battler, short arg2) {
	SetPP(battler, (arg2 > battler.ppTarget) ? 0 : cast(ushort)(battler.ppTarget - arg2));
}

/// $C2BCE6
void LoseHPStatus(Battler* battler, short arg2) {
	SetHP(battler, (arg2 > battler.hpTarget) ? 0 : cast(ushort)(battler.hpTarget - arg2));
}

/// $C2BD13
short UnknownC2BD13() {
	short x02 = 0;
	for (short i = 8; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness != 1) {
			continue;
		}
		x02 += GetBattleSpriteWidth(BattlersTable[i].sprite);
	}
	return x02;
}

/// $C2BD5E
void CallForHelpCommon(short sowingSeeds) {
	if (currentAttacker.allyOrEnemy != 0) {
		const(BattleGroupEnemy)* x06 = &BattleEntryPointerTable[CurrentBattleGroup].enemies[0];
		while (x06.count != 0xFF) {
			if (x06.enemyID == currentAttacker.currentActionArgument) {
				goto Success;
			}
			x06++;
		}
	}
	Failure:
	if (sowingSeeds != 0) {
		DisplayInBattleText(TextBattleSeedSproutFailure);
	} else {
		DisplayInBattleText(TextBattleNobodyCame);
	}
	return;
	Success:
	short x24 = 0;
	for (short i = 8; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness != 1) {
			continue;
		}
		if (BattlersTable[i].afflictions[0] == Status0.Unconscious) {
			continue;
		}
		if (BattlersTable[i].unknown76 != currentAttacker.currentActionArgument) {
			continue;
		}
		x24++;
	}
	if (Success255(cast(short)(((EnemyConfigurationTable[currentAttacker.currentActionArgument].maxCalled - x24) * 205) / EnemyConfigurationTable[currentAttacker.currentActionArgument].maxCalled)) == 0) {
		goto Failure;
	}
	short x1E = cast(short)((GetBattleSpriteWidth(EnemyConfigurationTable[currentAttacker.currentActionArgument].battleSprite) * 8) + 16);
	short x1C = EnemyConfigurationTable[currentAttacker.currentActionArgument].row;
	if (GetBattleSpriteWidth(EnemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) + UnknownC2BD13() < 32) {
		short x1A = 0x80;
		short x18 = 0x80;
		short x04 = 0x80;
		short x16 = 0x80;
		for (short i = 8; i < BattlersTable.length; i++) {
			if (BattlersTable[i].consciousness == 0) {
				continue;
			}
			if (BattlersTable[i].row == EnemyConfigurationTable[currentTarget.currentActionArgument].row) {
				if (BattlersTable[i].spriteX - ((GetBattleSpriteWidth(EnemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2) < x16) {
					x16 = cast(short)(BattlersTable[i].spriteX - ((GetBattleSpriteWidth(EnemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2));
				}
				if (BattlersTable[i].spriteX + ((GetBattleSpriteWidth(EnemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2) > x04) {
					x04 = cast(short)(BattlersTable[i].spriteX + ((GetBattleSpriteWidth(EnemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2));
				}
			} else {
				if (BattlersTable[i].spriteX - ((GetBattleSpriteWidth(EnemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2) < x18) {
					x18 = cast(short)(BattlersTable[i].spriteX - ((GetBattleSpriteWidth(EnemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2));
				}
				if (BattlersTable[i].spriteX + ((GetBattleSpriteWidth(EnemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2) > x1A) {
					x1A = cast(short)(BattlersTable[i].spriteX + ((GetBattleSpriteWidth(EnemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2));
				}
			}
		}
		if ((0x80 - x16 < x04 - 0x80)) {
			if (x16 > x1E) {
				x24 = cast(short)(x16 - x1E / 2);
				goto Unknown25;
			}
		} else if (x04 + x1E < 0x100) {
			x24 = cast(short)(x04 + x1E / 2);
			goto Unknown25;
		}
		x1C = cast(short)(1 - x1C);
		if (0x80 - x18 < x1A - 0x80) {
			if (x18 > x1E) {
				x24 = cast(short)(x18 - x1E / 2);
				goto Unknown25;
			}
		} else if (x1A + x1E < 0x100) {
			x24 = cast(short)(x1A + x1E / 2);
			goto Unknown25;
		}
	}
	for (short i = 8; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness != 1) {
			continue;
		}
		if (BattlersTable[i].afflictions[0] != Status0.Unconscious) {
			continue;
		}
		if (GetBattleSpriteWidth(EnemyConfigurationTable[currentAttacker.currentActionArgument].battleSprite) != GetBattleSpriteWidth(BattlersTable[i].sprite)) {
			continue;
		}
		BattlersTable[i].consciousness = 0;
		x24 = BattlersTable[i].spriteX;
		x1C = BattlersTable[i].row;
	}
	Unknown25:
	if (GetBattleSpriteWidth(EnemyConfigurationTable[currentAttacker.currentActionArgument].battleSprite) + UnknownC2BD13() >= BattlersTable.length) {
		goto Failure;
	}
	Battler* x22 = &BattlersTable[8];
	for (short i = 8; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			break;
		}
		x22++;
	}
	currentTarget = x22;
	BattleInitEnemyStats(currentAttacker.currentActionArgument, currentTarget);
	currentTarget.spriteX = cast(ubyte)x24;
	currentTarget.row = cast(ubyte)x1C;
	if (currentTarget.row != 0) {
		currentTarget.spriteY = 0x80;
	} else {
		currentTarget.spriteY = 0x90;
	}
	currentTarget.vramSpriteIndex = UnknownC2F09F(currentAttacker.currentActionArgument);
	currentTarget.hasTakenTurn = 1;
	FixTargetName();
	if (sowingSeeds != 0) {
		DisplayInBattleText(TextBattleStartedGrowing);
	} else {
		DisplayInBattleText(TextBattleJoinedBattle);
	}
}

/// $C2C13C
void BattleActionSowSeeds() {
	CallForHelpCommon(1);
}

/// $C2C145
void BattleActionCallForHelp() {
	CallForHelpCommon(0);
}

/// $C2C14E
void BattleActionRainbowOfColours() {
	ubyte x02 = currentAttacker.spriteX;
	ubyte x10 = currentAttacker.spriteY;
	BattleInitEnemyStats(currentAttacker.currentActionArgument, currentAttacker);
	currentAttacker.spriteX = x02;
	currentAttacker.spriteY = x10;
	currentAttacker.vramSpriteIndex = UnknownC2F09F(currentAttacker.id);
	currentAttacker.hasTakenTurn = 1;
	Unknown7EAA92 = 1;
}

/// $C2C1BD
void BattleActionFlyHoney() {
	for (short i = 8; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		if (BattlersTable[i].allyOrEnemy != 1) {
			continue;
		}
		if ((BattlersTable[i].id == EnemyID.MasterBelch3) || (BattlersTable[i].id == EnemyID.MasterBelch1)) {
			BattlersTable[i].id = EnemyID.MasterBelch2;
			DisplayInBattleText(TextBattleFlyHoneyBelch);
		}
	}
	DisplayInBattleText(TextBattleFlyHoneyNormal);
}

/// $C2C21F
void UnknownC2C21F(short group, short music) {
	short x10 = 0;
	if ((BattleModeFlag != 0) || (group == 483)) {
		x10 = 1;
	}
	if (x10 == 0) {
		UnknownC2E8C4(6, 1, 30);
		while (UnknownC2E9C8() != 0) {
			Win_Tick();
		}
	}
	CurrentBattleGroup = group;
	UnknownC08726();
	LoadEnemyBattleSprites();
	LoadWindowGraphics();
	UnknownC44963(1);
	LoadBattleBG(BattleEntryBGTable[CurrentBattleGroup].layer1, BattleEntryBGTable[CurrentBattleGroup].layer2, cast(ushort)BattleEntryPointerTable[CurrentBattleGroup].letterboxStyle);
	UnknownC2EEE7();
	UnknownC0856B(0x18);
	UnknownC2F8F9();
	BattleModeFlag = 1;
	if (music != 0) {
		ChangeMusic(music);
	}
	UnknownC08744();
	if (x10 != 0) {
		FadeIn(1, 4);
		UnknownC269DE();
		return;
	}
	FadeIn(15, 1);
	if (group == 483) {
		return;
	}
	UnknownC2E8C4(6, 0, 5);
	while (UnknownC2E9C8() != 0) {
		Win_Tick();
	}
}

/// $C2C32C
void UnknownC2C32C(short arg1) {
	ubyte x10 = BattlersTable[8].spriteX;
	ubyte x04 = BattlersTable[8].spriteY;
	BattleInitEnemyStats(arg1, &BattlersTable[8]);
	BattlersTable[8].spriteX = x10;
	BattlersTable[8].spriteY = x04;
	BattlersTable[8].hasTakenTurn = 1;
}

/// $C2C37A
void UnknownC2C37A(short arg1, short arg2, const(ubyte)* arg3) {
	FadeOut(1, 4);
	UnknownC269DE();
	BattleModeFlag = 0;
	Unknown7E5DD4 = 0;
	UnknownC1DD5F();
	DisplayInBattleText(arg3);
	FadeOut(1, 2);
	UnknownC269DE();
	UnknownC2C21F(arg1, arg2);
	BattleModeFlag = 1;
	ShowHPPPWindowsF();
	CreateWindow(Window.TextBattle);
	Wait(1 * 60);
}

/// $C2C3E2
void GiygasHurtPrayer(short damage) {
	Wait(1 * 60);
	currentTarget = &BattlersTable[8];
	FixTargetName();
	GreenFlashDuration = 1 * 60;
	Unknown7EAA8E = 1;
	CalcResistDamage(TwentyFivePercentVariance(damage), 0xFF);
	Wait(1 * 60);
}

/// $C2C41F
void UnknownC2C41F(short arg1, const(ubyte)* arg2) {
	FadeOut(1, 1);
	UnknownC0AC0C(2);
	UnknownC269DE();
	BattleModeFlag = 0;
	UnknownC1DD5F();
	TM_MIRROR = 4;
	ChangeMusic(Music.GiygasWeakened);
	FadeIn(1, 1);
	UnknownC269DE();
	Wait(20);
	DisplayInBattleText(arg2);
	BattleModeFlag = 1;
	Wait(20);
	UnknownC0AC0C(2);
	FadeOut(1, 1);
	UnknownC269DE();
	ShowHPPPWindowsF();
	CreateWindow(Window.TextBattle);
	TM_MIRROR = 0x17;
	ChangeMusic(arg1);
	FadeIn(1, 1);
	UnknownC269DE();
}

/// $C2C4C0
void BattleActionPokeySpeech() {
	CurrentGiygasPhase = GiygasPhase.DevilsMachineOff;
	UnknownC2C32C(EnemyID.Giygas3);
	UnknownC2C21F(476, Music.GiygasPhase1);
	DisplayInBattleText(TextPokeySpeech3);
	BattlersTable[9].consciousness = 0;
	CurrentGiygasPhase = GiygasPhase.GiygasStartsAttacking;
	UnknownC3FDC5();
	UnknownC2C32C(EnemyID.Giygas4);
	UnknownC2C21F(477, Music.GiygasPhase2);
	Unknown7EAA92 = 1;
}

/// $C2C513
void BattleActionNull12() {
	//nothing
}

/// $C2C516
void BattleActionPokeySpeech2() {
	CurrentGiygasPhase = GiygasPhase.StartPraying;
	Wait(2 * 60);
	BattlersTable[9].consciousness = 1;
	UnknownC2F8F9();
	DisplayInBattleText(TextPokeySpeech4);
	BattlersTable[9].consciousness = 0;
	UnknownC2F8F9();
	Wait(1 * 60);
	UnknownC2C32C(EnemyID.Giygas5);
	UnknownC2C21F(478, Music.GiygasPhase3);
	Unknown7EAA92 = 1;
}

/// $C2C572
void BattleActionGiygasPrayer1() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer1);
	Wait(2 * 60);
	PlaySfx(Sfx.PSIStarstorm);
	Wait(1 * 60);
	VerticalShakeDuration = 1 * 60;
	VerticalShakeHoldDuration = 12;
	DisplayInBattleText(TextBattleGiygasDefensesUnstable);
	CurrentGiygasPhase = GiygasPhase.Prayer1Used;
	UnknownC2C32C(229);
	UnknownC2C21F(479, Music.None);
}

/// $C2C5D1
void BattleActionGiygasPrayer2() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer2);
	GiygasHurtPrayer(50);
	CurrentGiygasPhase = GiygasPhase.Prayer2Used;
}

/// $C2C5FA
void BattleActionGiygasPrayer3() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer3);
	GiygasHurtPrayer(100);
	CurrentGiygasPhase = GiygasPhase.Prayer3Used;
}

/// $C2C623
void BattleActionGiygasPrayer4() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer4);
	GiygasHurtPrayer(200);
	CurrentGiygasPhase = GiygasPhase.Prayer4Used;
}

/// $C2C64C
void BattleActionGiygasPrayer5() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer5);
	GiygasHurtPrayer(400);
	CurrentGiygasPhase = GiygasPhase.Prayer5Used;
}

/// $C2C675
void BattleActionGiygasPrayer6() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer6);
	GiygasHurtPrayer(800);
	CurrentGiygasPhase = GiygasPhase.Prayer6Used;
}

/// $C2C69E
void BattleActionGiygasPrayer7() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer7);
	GiygasHurtPrayer(1600);
	CurrentGiygasPhase = GiygasPhase.Prayer7Used;
	UnknownC2C21F(480, Music.GiygasWeakened2);
}

/// $C2C6D0
void BattleActionGiygasPrayer8() {
	UnknownC2C41F(74, TextBattleGiygasPrayer8);
	CurrentGiygasPhase = GiygasPhase.Prayer8Used;
}

/// $C2C6F0
void BattleActionGiygasPrayer9() {
	ResetRolling();
	UnknownC2C41F(74, TextBattleGiygasPrayer91);
	GiygasHurtPrayer(3200);
	UnknownC2C41F(74, TextBattleGiygasPrayer92);
	GiygasHurtPrayer(6400);
	UnknownC2C41F(74, TextBattleGiygasPrayer93);
	GiygasHurtPrayer(12800);
	UnknownC2C41F(74, TextBattleGiygasPrayer94);
	GiygasHurtPrayer(25600);
	CloseFocusWindow();
	BattleModeFlag = 0;
	Win_Tick();
	CurrentGiygasPhase = GiygasPhase.Defeated;
	ChangeMusic(Music.GiygasDeath);
	short x18 = 0;
	while (true) {
		PlaySfx(FinalGiygasPrayerNoiseTable[x18].sfx);
		if (FinalGiygasPrayerNoiseTable[x18].duration == 0) {
			break;
		}
		Wait(FinalGiygasPrayerNoiseTable[x18++].duration);
	}
	ChangeMusic(Music.GiygasDeath2);
	CurrentGiygasPhase = 0;
	Wait(8 * 60);
	BattlersTable[9].consciousness = 1;
	UnknownC2F8F9();
	DisplayInBattleText(TextBattlePokeyFlees);
	BattlersTable[9].consciousness = 0;
	UnknownC2F8F9();
	Wait(1 * 60);
	short x14 = 2;
	short x04 = x14;
	short x02 = 45;
	VerticalShakeDuration = 1 * 60;
	for (short i = 0; GiygasDeathStaticTransitionDelays[i] != 0; i++) {
		for (short j = 0; j < GiygasDeathStaticTransitionDelays[i]; j++) {
			Win_Tick();
			if (x04 == 0) {
				continue;
			}
			if (--x02 != 0) {
				continue;
			}
			x04--;
			x02 = 45;
			VerticalShakeDuration = 1 * 60;
		}
		UnknownC2DAE3();
		UnknownC0AC3A(x14);
		if (x14 == 2) {
			x14 = 1;
		} else {
			x14 = 2;
		}
	}
	ChangeMusic(Music.GiygasStatic);
	Wait(10 * 60);
	PlaySfx(Sfx.PSIThunderDamage);
	StopMusic();
	UnknownC2E8C4(5, 0, 5);
	while (UnknownC2E9C8() != 0) {
		Win_Tick();
	}
	StopMusic();
	UnknownC2C21F(Music.None, 483);
	Wait(8 * 60);
	Unknown7EAA0E = 3;
}

/// $C2C8C8
void LoadEnemyBattleSprites() {
	UnknownC08D79(9);
	SetBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
	SetBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x1000);
	SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	SetOAMSize(0x61);
	CopyToVram(3, 0x800, 0x7C00, &Unknown7F8000[0]);
}

/// $C2C92D
void GenerateBattleBGFrame(LoadedBackgroundData* arg1, short layer);

/// $C2CFE5
void UnknownC2CFE5(LoadedBackgroundData* target, const(AnimatedBackground)* bg) {
	memset(target, 0, LoadedBackgroundData.sizeof);
	target.Bitdepth = bg.bitsPerPixel;
	target.PaletteShiftingStyle = bg.paletteShiftingStyle;
	target.PaletteCycle1First = bg.paletteCycle1First;
	target.PaletteCycle1Last = bg.paletteCycle1Last;
	target.PaletteCycle2First = bg.paletteCycle2First;
	target.PaletteCycle2Last = bg.paletteCycle2Last;
	target.PaletteChangeSpeed = bg.paletteChangeSpeed;
	memcpy(&target.ScrollingMovements[0], &bg.scrollingMovements[0], LoadedBackgroundData.ScrollingMovements.sizeof);
	memcpy(&target.DistortionStyles[0], &bg.distortionStyles[0], LoadedBackgroundData.DistortionStyles.sizeof);
	target.ScrollingDurationLeft = 1;
	target.DistortionDurationLeft = 1;
	target.PaletteChangeDurationLeft = 1;
}

/// $C2D0AC
void UnknownC2D0AC() {
	HDMAWordTransfer* x = &Unknown7EADB8[0];

	x.scanlines = cast(ubyte)Unknown7EADB2;
	x.value = Unknown7EADB0;
	x++;

	short i;
	for (i = cast(short)(Unknown7EADB4 - Unknown7EADB2); i >= 0x80; i -= 0x7F) {
		x.scanlines = 0x7F;
		x.value = Unknown7EADAE;
		x++;
	}

	x.scanlines = cast(ubyte)i;
	x.value = Unknown7EADAE;
	x++;

	x.scanlines = 1;
	x.value = Unknown7EADB0;
	x++;

	x.scanlines = 0;
}

/// $C2D121
// check this one over later
void LoadBattleBG(ushort layer1, ushort layer2, ushort letterbox) {
	RedFlashDuration = 0;
	GreenFlashDuration = 0;
	ShakeDuration = 0;
	WobbleDuration = 0;
	Unknown7EAD90 = 0;
	VerticalShakeHoldDuration = 0;
	VerticalShakeDuration = 0;
	switch (letterbox) {
		case LetterboxStyle.None:
			Unknown7EADB2 = 0;
			Unknown7EADB4 = 224;
			break;
		case LetterboxStyle.Large:
			Unknown7EADB2 = 48 - 1;
			Unknown7EADB4 = 224 - 48;
			break;
		case LetterboxStyle.Medium:
			Unknown7EADB2 = 58 - 1;
			Unknown7EADB4 = 224 - 58;
			break;
		case LetterboxStyle.Small:
			Unknown7EADB2 = 68 - 1;
			Unknown7EADB4 = 224 - 68;
			break;
		default: break;
	}
	Unknown7EADB6 = 0;
	Unknown7EADCE = 0x7000;
	Unknown7EADCC = 0x7000;
	Unknown7EADD0 = 0;
	Unknown7EADD2 = -1;
	Decomp(&BattleBGGraphicsPointers[animatedBackgrounds[layer1].graphics][0], &Unknown7F0000[0]);
	if (CurrentBattleGroup == 0x1DE) {
		SetBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x3000);
		CopyToVram(0, 0x5000, 0x3000, &Unknown7F0000[0]);
	} else {
		CopyToVram(0, 0x2000, 0x1000, &Unknown7F0000[0]);
	}
	Unknown7F0000[0] = 0;
	CopyToVram(3, 0x800, 0x5800, &Unknown7F0000[0]);
	CopyToVram(3, 0x800, 0, &Unknown7F0000[0]);
	Decomp(&BattleBGArrangementPointers[animatedBackgrounds[layer1].graphics][0], &Unknown7F0000[0]);
	if (animatedBackgrounds[layer1].bitsPerPixel == 4) {
		UnknownC08D79(9);
		for (short i = 0; i < 0x800; i += 2) {
			Unknown7F0000[i + 1] = (Unknown7F0000[i + 1] & 0xDF) | 8;
		}
		CopyToVram(0, 0x800, 0x5C00, &Unknown7F0000[0]);
		UnknownC2CFE5(&LoadedBGDataLayer1, &animatedBackgrounds[layer1]);
		LoadedBGDataLayer1.PalettePointer = &palettes[2];
		memcpy(&LoadedBGDataLayer1.Palette[0], &BattleBGPalettePointers[animatedBackgrounds[layer1].palette][0], 32);
		memcpy(&LoadedBGDataLayer1.Palette2[0], &BattleBGPalettePointers[animatedBackgrounds[layer1].palette][0], 32);
		memcpy(LoadedBGDataLayer1.PalettePointer, &LoadedBGDataLayer1.Palette[0], 32);
		LoadedBGDataLayer1.TargetLayer = 2;
		GenerateBattleBGFrame(&LoadedBGDataLayer1, 0);
		LoadedBGDataLayer2.TargetLayer = 0;
		Unknown7EAD8A = 1;
		UnknownC0AFCD(Unknown7EAD8A);
		Unknown7EADAE = 0x17;
		Unknown7EADB0 = 0x15;
		if (layer2 != 0) {
			if ((letterbox & 4) != 0) {
				Unknown7EAD8A = 7;
				UnknownC0AFCD(Unknown7EAD8A);
				Decomp(&BattleBGGraphicsPointers[animatedBackgrounds[layer2].graphics][0], &Unknown7F0000[0]);
				CopyToVram(0, 0x2000, 0, &Unknown7F0000[0]);
				Decomp(&BattleBGArrangementPointers[animatedBackgrounds[layer2].graphics][0], &Unknown7F0000[0]);
				for (short i = 0; i < 0x800; i += 2) {
					Unknown7F0000[i + 1] = (Unknown7F0000[i + 1] & 0xDF) | 8;
				}
				CopyToVram(0, 0x800, 0x5800, &Unknown7F0000[0]);
				UnknownC2CFE5(&LoadedBGDataLayer2, &animatedBackgrounds[layer2]);
				LoadedBGDataLayer2.PalettePointer = &palettes[4];
				LoadedBGDataLayer2.TargetLayer = 1;
				memcpy(&LoadedBGDataLayer2.Palette[0], &BattleBGPalettePointers[animatedBackgrounds[layer2].palette][0], 32);
				memcpy(&LoadedBGDataLayer2.Palette2[0], &BattleBGPalettePointers[animatedBackgrounds[layer2].palette][0], 32);
				memcpy(LoadedBGDataLayer2.PalettePointer, &LoadedBGDataLayer2.Palette[0], 32);
				GenerateBattleBGFrame(&LoadedBGDataLayer2, 1);
				Unknown7EADAE = 0x215;
				Unknown7EADB0 = 0x14;
			} else {
				UnknownC2CFE5(&LoadedBGDataLayer2, &animatedBackgrounds[layer2]);
				LoadedBGDataLayer2.Unknown2 = 1;
				LoadedBGDataLayer2.TargetLayer = 2;
			}
		}
	} else {
		UnknownC08D79(8);
		SetBG1VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
		SetBG2VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
		SetBG3VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x1000);
		SetBG4VRAMLocation(BGTileMapSize.normal, 0xC00, 0x3000);
		for (short i = 0; i < 0x800; i++) {
			Unknown7F0000[i + 1] = Unknown7F0000[i + 1] & 0xDF;
		}
		CopyToVram(0, 0x800, 0x5C00, &Unknown7F0000[0]);
		UnknownC2CFE5(&LoadedBGDataLayer1, &animatedBackgrounds[layer1]);
		LoadedBGDataLayer1.PalettePointer = &palettes[4];
		memcpy(&LoadedBGDataLayer1.Palette[0], &BattleBGPalettePointers[animatedBackgrounds[layer1].palette][0], 32);
		memcpy(&LoadedBGDataLayer1.Palette2[0], &BattleBGPalettePointers[animatedBackgrounds[layer1].palette][0], 32);
		memcpy(LoadedBGDataLayer1.PalettePointer, &LoadedBGDataLayer1.Palette[0], 32);
		LoadedBGDataLayer1.TargetLayer = 3;
		if (layer2 != 0) {
			Unknown7EAD8A = 3;
			UnknownC0AFCD(Unknown7EAD8A);

			Decomp(&BattleBGGraphicsPointers[animatedBackgrounds[layer2].graphics][0], &Unknown7F0000[0]);
			CopyToVram(0, 0x1800, 0x3000, &Unknown7F0000[0]);
			Decomp(&BattleBGArrangementPointers[animatedBackgrounds[layer2].graphics][0], &Unknown7F0000[0]);
			for (short i = 0; i < 0x800; i += 2) {
				Unknown7F0000[i + 1] = (Unknown7F0000[i + 1] & 0xDF);
			}
			CopyToVram(0, 0x800, 0xC00, &Unknown7F0000[0]);
			UnknownC2CFE5(&LoadedBGDataLayer2 ,&animatedBackgrounds[layer2]);
			LoadedBGDataLayer2.PalettePointer = &palettes[6];
			memcpy(&LoadedBGDataLayer2.Palette[0], &BattleBGPalettePointers[animatedBackgrounds[layer2].palette][0], 32);
			memcpy(&LoadedBGDataLayer2.Palette2[0], &BattleBGPalettePointers[animatedBackgrounds[layer2].palette][0], 32);
			memcpy(LoadedBGDataLayer2.PalettePointer, &LoadedBGDataLayer2.Palette[0], 32);
			LoadedBGDataLayer2.TargetLayer = 4;
		} else {
			LoadedBGDataLayer2.TargetLayer = 0;
		}
		Unknown7EADAE = 0x817;
		Unknown7EADB0 = 0x13;
	}
	Unknown7EADAC = 0;
	if ((LoadedBGDataLayer2.TargetLayer != 0) && (LoadedBGDataLayer2.DistortionStyles[0] != 0)) {
		Unknown7EADAC = 1;
	}
	UnknownC2D0AC();
	if (Unknown7EADB2 != 0) {
		UnknownC429E8(2);
	}
	UnknownC2E9ED();
}

/// $C2DAE3
void UnknownC2DAE3() {
	ubyte x0E = LoadedBGDataLayer1.DistortionStyles[0];
	LoadedBGDataLayer1.DistortionStyles[0] = LoadedBGDataLayer1.DistortionStyles[3];
	LoadedBGDataLayer1.DistortionStyles[1] = 0;
	LoadedBGDataLayer1.DistortionDurationLeft = 1;
	LoadedBGDataLayer1.DistortionStyles[3] = x0E;
}

/// $C2DB14
void UnknownC2DB14() {
	memcpy(&LoadedBGDataLayer1.Palette[0], LoadedBGDataLayer1.PalettePointer, LoadedBGDataLayer1.Palette[0].sizeof);
}

/// $C2DB3F
void UnknownC2DB3F() {
	if (Unknown7EADD0 != 0) {
		Unknown7EADD2 -= 0x555;
		if (Unknown7EADD2 > 0x6000) {
			Unknown7EADD2 = 0x6000;
			Unknown7EADD0 = 0;
		}
		UnknownC2E08E(Unknown7EADD2 >> 8);
	}
	if (Unknown7EADA8 != 0) {
		if ((--Unknown7EADA8 & 2) == 0) {
			UnknownC2E08E(-1);
		} else {
			UnknownC2E08E(0x100);
		}
	}
	if (Unknown7EADAA != 0) {
		palettes[0][0] = 0;
		switch (Unknown7EADAA) {
			case 3:
				palettes[0][0] = 0x3E0;
				goto case;
			case 2:
				UnknownC0856B(0x18);
				break;
			default: break;
		}
		if ((--Unknown7EADAA & 2) != 0) {
			UnknownC2E08E(0);
		} else {
			UnknownC2E08E(0x100);
		}
	}
	if (VerticalShakeDuration == 0) {
		Unknown7EAD98 = 0;
	} else {
		Unknown7EAD98 = UnknownC4A591[(1 * 60) - VerticalShakeDuration];
		if ((--VerticalShakeDuration == 0) && (VerticalShakeHoldDuration != 0)) {
			VerticalShakeHoldDuration--;
			VerticalShakeDuration = 10;
		}
	}
	Unknown7EAD96 = 0;
	if (WobbleDuration != 0) {
		Unknown7EAD96 = (cast(short)(SineLookupTable[((WobbleDuration-- % 72) << 8) / 72]) * 64) / 256;
	}
	if (ShakeDuration != 0) {
		switch (ShakeDuration-- & 3) {
			case 0:
			case 2:
				Unknown7EAD96 = 0;
				break;
			case 1:
				Unknown7EAD96 = 2;
				break;
			case 3:
				Unknown7EAD96 = -2;
				break;
			default: break;
		}
	}
	if (LoadedBGDataLayer1.Bitdepth == 2) {
		BG1_X_POS = Unknown7EAD96;
		BG1_Y_POS = Unknown7EAD98;
	} else if (BattleModeFlag != 0) {
		BG3_X_POS = Unknown7EAD96;
		BG3_Y_POS = Unknown7EAD98;
	}
	if (Unknown7EAD90 != 0) {
		Unknown7EAD90--;
	}
	if (BattleModeFlag != 0) {
		UnknownC2F8F9();
	}
	GenerateBattleBGFrame(&LoadedBGDataLayer1, 0);
	if (LoadedBGDataLayer2.TargetLayer != 0) {
		GenerateBattleBGFrame(&LoadedBGDataLayer2, 1);
	}
	UnknownC2E6B6();
	if (RedFlashDuration != 0) {
		if (((--RedFlashDuration / 12) & 1) != 0) {
			SetColData(31, 0, 4);
			SetColourAddSubMode(0, 0x3F);
		} else {
			SetColData(0, 0, 0);
			UnknownC0AFCD(Unknown7EAD8A);
		}
	}
	if (GreenFlashDuration != 0) {
		if (((--GreenFlashDuration / 12) & 1) != 0) {
			SetColData(0, 31, 4);
			SetColourAddSubMode(0, 0x3F);
		} else {
			SetColData(0, 0, 0);
			UnknownC0AFCD(Unknown7EAD8A);
		}
	}
	if (HPPPBoxBlinkDuration != 0) {
		if (((--HPPPBoxBlinkDuration / 3) & 1) != 0) {
			UndrawHPPPWindow(HPPPBoxBlinkTarget);
		} else {
			UnknownC207B6(HPPPBoxBlinkTarget);
		}
	}
	UnknownC4A7B0();
	UnknownC2FD99();
	if ((Unknown7EADB6 != 0) && (Unknown7EADB2 != 0)) {
		if (Unknown7EADCC < 0x3BB) {
			Unknown7EADCC = 0;
			Unknown7EADCE = 0xE0;
			Unknown7EADB6 = 0;
		} else {
			Unknown7EADCC -= 0x3BB;
			Unknown7EADCE += 0x3BB;
		}
		if ((Unknown7EADCC >> 8) < Unknown7EADB2) {
			Unknown7EADB2 = Unknown7EADCC >> 8;
		}
		if ((Unknown7EADCE >> 8) > Unknown7EADB4) {
			Unknown7EADB4 = Unknown7EADCE >> 8;
		}
		UnknownC2D0AC();
	}
}

/// $C2DE43
void BattleActionSwitchWeapons();

/// $C2DE96
void UnknownC2DE96() {
	memcpy(&LoadedBGDataLayer1.Palette[0], &LoadedBGDataLayer1.Palette2[0], LoadedBGDataLayer1.Palette.sizeof);
	memcpy(&LoadedBGDataLayer2.Palette[0], &LoadedBGDataLayer2.Palette2[0], LoadedBGDataLayer2.Palette.sizeof);
	memcpy(LoadedBGDataLayer1.PalettePointer, &LoadedBGDataLayer1.Palette[0], LoadedBGDataLayer1.Palette.sizeof);
	memcpy(LoadedBGDataLayer2.PalettePointer, &LoadedBGDataLayer2.Palette[0], LoadedBGDataLayer2.Palette.sizeof);
}

/// $C2E00F
void BattleActionSwitchArmor();

/// $C2E08E
void UnknownC2E08E(short);

/// $C2E0E7
void UnknownC2E0E7() {
	GreenFlashDuration = 0;
	RedFlashDuration = 0;
	Unknown7EAEC2 = 0;
	if (HPPPBoxBlinkDuration != 0) {
		UnknownC207B6(HPPPBoxBlinkTarget);
		HPPPBoxBlinkDuration = 0;
	}
	SetColData(0, 0, 0);
	UnknownC0AFCD(1);
}

/// $C2E116
void ShowPSIAnimation(short);

/// $C2E6B6
void UnknownC2E6B6();

/// $C2E8C4
void UnknownC2E8C4(short arg1, short arg2, short arg3) {
	UnknownC4A67E(arg1, arg2);
	Unknown7EAECA = cast(ubyte)arg3;
}

/// $C2E8E0
void BattleSwirlSequence() {
	short x16 = 1;
	short swirlRed = 4;
	short swirlGreen = 4;
	short swirlBlue = 0;
	short swirlMusic;
	short x0E;
	switch (BattleInitiative) {
		case Initiative.Normal:
			swirlMusic = Music.BattleSwirl4;
			x0E = 14;
			break;
		case Initiative.PartyFirst:
			swirlMusic = Music.BattleSwirl4;
			swirlRed = 28;
			swirlGreen = 5;
			swirlBlue = 12;
			x0E = 6;
			break;
		case Initiative.EnemiesFirst:
			swirlMusic = Music.BattleSwirl2;
			swirlRed = 0;
			swirlGreen = 31;
			swirlBlue = 31;
			x0E = 6;
			break;
		default: break;
	}
	if (CurrentBattleGroup >= 448) {
		x16 = 3;
		x0E = 14;
		swirlMusic = Music.BattleSwirl1;
	}
	ChangeMusic(swirlMusic);
	UnknownC04F47();
	if ((x0E & 4) != 0) {
		SetColData(cast(ubyte)swirlRed, cast(ubyte)swirlGreen, cast(ubyte)swirlBlue);
	}
	if ((x0E & 8) != 0) {
		SetColourAddSubMode(
			CGWSELFlags.ColourMathEnableMathWin | CGWSELFlags.MainScreenBlackNever | CGWSELFlags.SubscreenBGOBJDisable | CGWSELFlags.UsePalette,
			CGADSUBFlags.ColourMathAddsub | CGADSUBFlags.ColourMathDiv2 | CGADSUBFlags.ColourMathMainIsBackdrop | CGADSUBFlags.ColourMathMainIsOBJ47 | CGADSUBFlags.ColourMathMainIsBG4 | CGADSUBFlags.ColourMathMainIsBG3 | CGADSUBFlags.ColourMathMainIsBG2 | CGADSUBFlags.ColourMathMainIsBG1
		);
	} else {
		SetColourAddSubMode(
			CGWSELFlags.ColourMathEnableMathWin | CGWSELFlags.MainScreenBlackNever | CGWSELFlags.SubscreenBGOBJDisable | CGWSELFlags.UsePalette,
			CGADSUBFlags.ColourMathAddsub | CGADSUBFlags.ColourMathMainIsBackdrop | CGADSUBFlags.ColourMathMainIsOBJ47 | CGADSUBFlags.ColourMathMainIsBG4 | CGADSUBFlags.ColourMathMainIsBG3 | CGADSUBFlags.ColourMathMainIsBG2 | CGADSUBFlags.ColourMathMainIsBG1
		);
	}
	UnknownC2E8C4(x16, x0E, 30);
	if ((x0E & 4) != 0) {
		Unknown7EAEC8 = 0x20;
	} else {
		Unknown7EAEC8 = 0x0F;
	}
	Unknown7EAECB = 0;
}

/// $C2E9C8
short UnknownC2E9C8() {
	if ((Unknown7EAEC2 != 0) && (4 > Unknown7EAECA)) {
		return 1;
	}
	return 0;
}

/// $C2E9ED
void UnknownC2E9ED() {
	Unknown7EAEC2 = 0;
	UnknownC0AE34(Unknown7EAEC9 + 3);
	SetColData(0, 0, 0);
	SetWindowMask(0, 0);
}

/// $C2EA15
void UnknownC2EA15(short arg1) {
	Unknown7EAEEF = cast(ubyte)arg1;
	UnknownC4A67E(0, 0);
	Unknown7EAEC8 = 0x13;
	switch (arg1) {
		case 2:
			Unknown7EAECC = &UnknownC3F819[0];
			break;
		case 1:
			Unknown7EAECC = &UnknownC4A5FA[0];
			break;
		default:
			Unknown7EAECC = &UnknownC4A5CE[0];
			break;
	}
}

/// $C2EA74
void UnknownC2EA74() {
	UnknownC4A67E(0, 0);
	Unknown7EAEC8 = 0x13;
	if (Unknown7EAEEF != 0) {
		Unknown7EAECC = &UnknownC4A652[0];
	} else {
		Unknown7EAECC = &UnknownC4A626[0];
	}
}

/// $C2EAAA
void UnknownC2EAAA() {
	Unknown7EAEC2 = 0;
	Unknown7EAECC = null;
	UnknownC0AE34(3);
	SetWindowMask(0, 0);
}

/// $C2EACF
short UnknownC2EACF() {
	if (Unknown7E1B9E != 0) {
		return 1;
	}
	if (Unknown7EAEC2 == 0) {
		return 0;
	}
	return 1;
}

/// $C2EAEA
void UnknownC2EAEA(short arg1) {
	Unknown7EAAB6[Unknown7EAAB4] = cast(ubyte)Unknown7EAAB2;
	SpriteMap* x26 = &Unknown7EAAD6[Unknown7EAAB4][0];
	arg1--;
	short x24 = 1;
	short x22 = 1;
	for (short i = 0; i < 16; i++) {
		x26[i].unknown0 = 0xE0;
		//weird. why is it done like this?
		x26[i].unknown10 = cast(ubyte)((UnknownC3F8B1[i + Unknown7EAAB2]));
		x26[i].unknown11 = cast(ubyte)((UnknownC3F8B1[i + Unknown7EAAB2] >> 8) + (Unknown7EAAB4 * 2) + 32);
		x26[i].unknown3 = 0xF0;
		x26[i].unknown4 = 1;
	}
	switch (BattleSpritePointers[arg1].size) {
		case 2:
			x22 = 2;
			x26.unknown3 = 0xE0;
			x26[1].unknown3 = 0;
			break;
		case 3:
			x24 = 2;
			x26.unknown0 = 0xC0;
			break;
		case 4:
			x24 = 2;
			x22 = 2;
			x26[1].unknown0 = 0xC0;
			x26[0].unknown0 = 0xC0;
			x26[2].unknown3 = 0xE0;
			x26[0].unknown3 = 0xE0;
			x26[3].unknown3 = 0;
			x26[1].unknown3 = 0;
			break;
		case 5:
			x22 = 4;
			x24 = 2;
			x26[3].unknown0 = 0xC0;
			x26[2].unknown0 = 0xC0;
			x26[1].unknown0 = 0xC0;
			x26[0].unknown0 = 0xC0;
			x26[4].unknown3 = 0xC0;
			x26[0].unknown3 = 0xC0;
			x26[5].unknown3 = 0xE0;
			x26[1].unknown3 = 0xE0;
			x26[6].unknown3 = 0;
			x26[2].unknown3 = 0;
			x26[7].unknown3 = 0x20;
			x26[3].unknown3 = 0x20;
			break;
		case 6:
			x24 = 4;
			x22 = 4;
			x26[3].unknown0 = 0xA0;
			x26[2].unknown0 = 0xA0;
			x26[1].unknown0 = 0xA0;
			x26[0].unknown0 = 0xA0;
			x26[7].unknown0 = 0xC0;
			x26[6].unknown0 = 0xC0;
			x26[5].unknown0 = 0xC0;
			x26[4].unknown0 = 0xC0;
			x26[15].unknown0 = 0;
			x26[14].unknown0 = 0;
			x26[13].unknown0 = 0;
			x26[12].unknown0 = 0;
			x26[12].unknown3 = 0xC0;
			x26[8].unknown3 = 0xC0;
			x26[4].unknown3 = 0xC0;
			x26[0].unknown3 = 0xC0;
			x26[13].unknown3 = 0xE0;
			x26[9].unknown3 = 0xE0;
			x26[5].unknown3 = 0xE0;
			x26[1].unknown3 = 0xE0;
			x26[14].unknown3 = 0;
			x26[10].unknown3 = 0;
			x26[6].unknown3 = 0;
			x26[2].unknown3 = 0;
			x26[15].unknown3 = 0x20;
			x26[11].unknown3 = 0x20;
			x26[7].unknown3 = 0x20;
			x26[3].unknown3 = 0x20;
			break;
		default: break;
	}
	x26[(x24 * x22) - 1].unknown4 = 0x81;
	memcpy(&Unknown7EAC16[Unknown7EAAB4][0], &Unknown7EAAD6[Unknown7EAAB4][0], 80);
	for (short i = 0; i < 16; i++) {
		Unknown7EAC16[Unknown7EAAB4][0].unknown11 += 8;
	}
	Unknown7EAAC6[Unknown7EAAB4] = cast(ubyte)x22;
	Unknown7EAACE[Unknown7EAAB4] = cast(ubyte)x24;
	Unknown7EAAB4++;
	ubyte* x1A = &Unknown7F8000[0];
	Decomp(&BattleSpritePointers[arg1].sprite[0], x1A);
	short y = cast(short)(x24 * x22);
	while (--y != 0) {
		ubyte* x0A = &Unknown7F0000[UnknownC3F871[Unknown7EAAB2++]];
		for (short i = 0; i < 4; i++) {
			ubyte* x16 = x0A;
			for (short j = 0; j < 0x80; j++) {
				*(x16++) = *(x1A++);
			}
			x0A += 0x200;
		}
	}
}

/// $C2EFFD
short GetBattleSpriteWidth(short arg1) {
	switch (BattleSpritePointers[arg1 - 1].size) {
		case BattleSpriteSize._32X32:
		case BattleSpriteSize._32X64:
			return 4;
		case BattleSpriteSize._64X32:
		case BattleSpriteSize._64X64:
			return 8;
		case BattleSpriteSize._128X64:
		case BattleSpriteSize._128X128:
			return 16;
		default:
			return 0;
	}
}

/// $C2EEE7
void UnknownC2EEE7() {
	Unknown7EAAB4 = 0;
	Unknown7EAAB2 = 0;
	const(BattleGroupEnemy)* x1A = &BattleEntryPointerTable[CurrentBattleGroup].enemies[0];
	while (x1A.count != 0xFF) {
		memcpy(&palettes[8 + Unknown7EAAB4][0], &BattleSpritePalettes[EnemyConfigurationTable[x1A.enemyID].battleSpritePalette][0], 32);
		Unknown7EAABE[Unknown7EAAB4] = x1A.enemyID;
		UnknownC2EAEA(EnemyConfigurationTable[x1A.enemyID].battleSprite);
		x1A++;
	}
	CopyToVram(0, (Unknown7EAAB2 > 16) ? 0x3000 : 0x2000, 0x2000, &Unknown7F0000[0]);
}

/// $C2F09F
ubyte UnknownC2F09F(short arg1) {
	for (ubyte i = 0; i < 4; i++) {
		if (Unknown7EAABE[i] == arg1) {
			return i;
		}
	}
	return 0;
}

/// $C2F0D1
void UnknownC2F0D1() {
	short y = 0;
	for (short i = 0; i < EnemiesInBattle; i++) {
		y += GetBattleSpriteWidth(EnemyConfigurationTable[Unknown7E9F8C[i]].battleSprite);
		if (y > 32) {
			EnemiesInBattle = i;
			return;
		}
	}
}

/// $C2F121
void UnknownC2F121();

/// $C2F724
void UnknownC2F724(short arg1) {
	for (short i = 8; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		if (BattlersTable[i].afflictions[0] == Status0.Unconscious) {
			continue;
		}
		if (BattlersTable[i].allyOrEnemy != 1) {
			continue;
		}
		if (BattlersTable[i].row != arg1) {
			continue;
		}
		if (BattlersTable[i].sprite == 0) {
			continue;
		}
		if ((BattlersTable[i].unknown72 != 0) && (((--BattlersTable[i].unknown72 / 3) & 1) != 0)) {
			continue;
		}
		if ((BattlersTable[i].unknown73 != 0) && ((--BattlersTable[i].unknown73 & 4) == 0)) {
			UnknownC08CD5(&Unknown7EAC16[BattlersTable[i].vramSpriteIndex][0], cast(short)(BattlersTable[i].spriteX - Unknown7EAD96), cast(short)(BattlersTable[i].spriteY - Unknown7EAD98));
		} else if (BattlersTable[i].unknown75 != 0) {
			UnknownC08CD5(&Unknown7EAC16[BattlersTable[i].vramSpriteIndex][0], cast(short)(BattlersTable[i].spriteX - Unknown7EAD96), cast(short)(BattlersTable[i].spriteY - Unknown7EAD98));
		} else if ((Unknown7EADA2 != 0) && ((BattlersTable[i].unknown74 == 0) || ((Unknown7E0002 & 8) != 0))) {
			UnknownC08CD5(&Unknown7EAC16[BattlersTable[i].vramSpriteIndex][0], cast(short)(BattlersTable[i].spriteX - Unknown7EAD96), cast(short)(BattlersTable[i].spriteY - Unknown7EAD98));
		} else {
			UnknownC08CD5(&Unknown7EAAD6[BattlersTable[i].vramSpriteIndex][0], cast(short)(BattlersTable[i].spriteX - Unknown7EAD96), cast(short)(BattlersTable[i].spriteY - Unknown7EAD98));
		}
	}
}

/// $C2F8F9
void UnknownC2F8F9() {
	UnknownC088A5(0x7E);
	OAMClear();
	UnknownC2F724(0);
	UnknownC2F724(1);
	UpdateScreen();
}

/// $C2F917
void UnknownC2F917();

/// $C2FD99
void UnknownC2FD99();

/// $C2FEF9
void UnknownC2FEF9(short type) {
	if (type - 1 != 0) {
		memcpy(&palettes[8][0], &UnknownC3F8F1[type - 1][0], 32);
		memcpy(&palettes[13][0], &UnknownC3F8F1[type - 1][0], 32);
		memcpy(&palettes[14][0], &UnknownC3F8F1[type - 1][0], 32);
		memcpy(&palettes[15][0], &UnknownC3F8F1[type - 1][0], 32);
		UnknownC0856B(16);
		return;
	}
	for (short i = 32 * 4; i < 32 * 6; i++) {
		palettes[(i / 32) + 4][i % 32] = (palettes[i / 32][i % 32] >> 2) & ((7 << 10) | (7 << 5) | 7);
	}
	UnknownC0856B(16);
}
