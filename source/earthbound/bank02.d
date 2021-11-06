module earthbound.bank02;

import earthbound.commondefs;
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

// $C20293
void UnknownC20293() {
	for (short i = 0; i < 4; i++) {
		(cast(ushort*)(&IntroBG2Buffer[0x272]))[i] = 0;
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

// $C207B6
void UnknownC207B6(short);

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

// $C20958
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

// $C20F08
void FillCharacterHPTileBuffer(short arg1, short integer, short fraction) {
	SeparateDecimalDigits(integer);
	FillHPPPTileBuffer(arg1, 0, fraction);
}

// $C20F26
void FillCharacterPPTileBuffer(short arg1, ubyte* afflictions, short integer, short fraction) {
	if (afflictions[4] != 0) {
		FillHPPPTileBufferX(arg1);
		return;
	}
	SeparateDecimalDigits(integer);
	FillHPPPTileBuffer(arg1, 1, fraction);
}

// $C20F58
uint UnknownC20F58() {
	if (Unknown7E9695 != 0) {
		return Unknown7E9627 >> 1;
	} else {
		return Unknown7E9627;
	}
}

// $C20F9A
void UnknownC20F9A();

// $C2108C
short UnknownC2108C();

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
void UnknownC216DB() {
	ubyte x18 = 0;
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		PartyCharacter* x15 = &PartyCharacters[gameState.partyMembers[i]];
		for (short j = 0; (j < 14) && (x15.items[j] != 0); j++) {
			if (ItemData[x15.items[j]].type != 4) {
				continue;
			}
			if (x18 != 0) {
				if (ItemData[x18].ep > ItemData[x15.items[j]].ep) {
					x18 = x15.items[j];
				}
			}
		}
	}
	if (x18 != 0) {
		if (UnknownC2239D(ItemData[x18].strength) != 0) {
			return;
		}
		RemoveCharFromParty(PartyMember.TeddyBear);
		RemoveCharFromParty(PartyMember.PlushTeddyBear);
		AddCharToParty(ItemData[x18].strength);
	} else {
		RemoveCharFromParty(PartyMember.TeddyBear);
		RemoveCharFromParty(PartyMember.PlushTeddyBear);
	}
}

// $C21857
void RecalcCharacterPostmathOffense(short id) {
	short total = PartyCharacters[id - 1].base_offense;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] - 1]].parameters[((id - 1) == 3) ? 1 : 0];
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

// $C21AEB
void RecalcCharacterPostmathSpeed(short id) {
	short total = PartyCharacters[id - 1].base_speed;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].ep;
	}
	total += PartyCharacters[id - 1].boosted_speed;
	if (0 >= total) {
		total = 0;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	PartyCharacters[id - 1].speed = cast(ubyte)total;
}

// $C21BA4
void RecalcCharacterPostmathGuts(short id) {
	short total = PartyCharacters[id - 1].base_guts;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] - 1]].ep;
	}
	total += PartyCharacters[id - 1].boosted_guts;
	if (0 >= total) {
		total = 0;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	PartyCharacters[id - 1].guts = cast(ubyte)total;
}

// $C21C5D
void RecalcCharacterPostmathLuck(short id) {
	short total = PartyCharacters[id - 1].base_luck;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] - 1]].ep;
	}
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].ep;
	}
	total += PartyCharacters[id - 1].boosted_luck;
	if (0 >= total) {
		total = 0;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	PartyCharacters[id - 1].luck = cast(ubyte)total;
}

// $C21D65
void RecalcCharacterPostmathVitality(short id) {
	PartyCharacters[id - 1].vitality = cast(ubyte)(PartyCharacters[id - 1].base_vitality + PartyCharacters[id - 1].boosted_vitality);
}

// $C21D7D
void RecalcCharacterPostmathIQ(short id) {
	PartyCharacters[id - 1].iq = cast(ubyte)(PartyCharacters[id - 1].base_iq + PartyCharacters[id - 1].boosted_iq);
}

// $C21D7D
void RecalcCharacterMissRate(short id) {
	PartyCharacters[id - 1].miss_rate = cast(ubyte)((PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] != 0) ? ItemData[PartyCharacters[id - 1].equipment[EquipmentSlot.Weapon] - 1].special : 0);
}

// $C21E03
void CalcResistances(short id) {
	short total;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].special & 3 : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].special & 3 : 0;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].fireResist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].special & 0xC : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].special & 0xC : 0;
	total >>= 2;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].freezeResist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].special & 0x30 : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].special & 0x30 : 0;
	total >>= 4;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].flashResist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].special & 0xC0 : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].special & 0xC0 : 0;
	total >>= 6;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].paralysisResist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] - 1]].special : 0;
	PartyCharacters[id - 1].hypnosisBrainshockResist = cast(ubyte)total;
}

// $C2239D
void RecalcCharacterPostmathDefense(short id) {
	short total = PartyCharacters[id - 1].base_defense;
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].parameters[((id - 1) == 3) ? 1 : 0];
	}
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] - 1]].parameters[((id - 1) == 3) ? 1 : 0];
	}
	if (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) {
		total += ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].parameters[((id - 1) == 3) ? 1 : 0];
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

// $C2239D
short UnknownC2239D(short id) {
	for (short i = 0; i < gameState.partyCount; i++) {
		if (gameState.partyMembers[i] == id) {
			return id;
		}
	}
	return 0;
}

// $C223D9
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

// $C2281D
void DepositIntoATM(ushort);

// $C228F8
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

// $C229BB
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

// $C22474
short UnknownC22474(ubyte*);

// $C23109
immutable ConsolationPrize[2] ConsolationItemTable = [
	ConsolationPrize(EnemyID.CuteLilUFO, [ItemID.Cookie,ItemID.BagOfFries, ItemID.Hamburger, ItemID.BoiledEgg, ItemID.FreshEgg, ItemID.PicnicLunch, ItemID.Pizza, 0]),
	ConsolationPrize(EnemyID.BeautifulUFO, [ItemID.CanOfFruitJuice, ItemID.RoyalIcedTea, ItemID.ProteinDrink, ItemID.KrakenSoup, ItemID.BottleOfWater, ItemID.ColdRemedy, ItemID.VialOfSerum, 0]),
];

// $C2311B
short BattleSelectionMenu(short, short);

// $C23BCF
void FixAttackerName(short);

// $C23D05
void FixTargetName();

// $C23E32
void UnknownC23E32();

// $C23FEA
short GetShieldTargetting(short, Battler*);

// $C24009
void FeelingStrangeRetargetting();

// $C240A4
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

// $C2416F
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

// $C24348
ubyte SelectStealableItem();

// $C24348
short UnknownC24348(short);

// $C2437E
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

// $C24477
void ChooseTarget(Battler*);

// $C24703
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

// $C24821
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
		UnknownC08B6B(0x18);
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
				BattlersTable[i].unknown70 = cast(ubyte)FiftyPercentVariance(BattlersTable[i].speed);
				if (BattlersTable[i].unknown70 == 0) {
					BattlersTable[i].unknown70 = 1;
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
					BattlersTable[i].unknown70 = 0;
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
						if (BattlersTable[i].unknown70 < x) {
							continue;
						}
						x04 = i;
						x = BattlersTable[i].unknown70;
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
					UnknownC20F9A();
					DisplayInBattleText(TextBattleLostTheBattle);
					x23 = 1;
				}
				if (CountChars(1) == 0) {
					EnemiesAreDead:
					x17 = 0;
					UnknownC20F9A();
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
		UnknownC20F9A();
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

// $C261BD
void InstantWinHandler();

// $C26634
short InstantWinCheck();

// $C2698B
short GetBattleActionType(short id) {
	return BattleActionTable[id].type;
}

// $C269DE
void UnknownC269DE() {
	while (Unknown7E0028 != 0) {
		Win_Tick();
	}
}

// $C269BE
void Wait(short frames) {
	while (--frames != 0) {
		Win_Tick();
	}
}

// $C269EF
short RandLong() {
	return rand();
}

// $C269F8
short Truncate16To8(short arg1, short arg2) {
	return cast(short)((arg1 * arg2) >> 8);
}

// $C26A2D
short RandLimit(short arg1) {
	return Truncate16To8(RandLong(), arg1);
}

// $C26A44
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

// $C26AFD
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

// $C26BB8
short Success255(short arg) {
	if (RandLong() < arg) {
		return 1;
	}
	return 0;
}

// $C26BDB
short Success500(short arg) {
	if (RandLimit(500) < arg) {
		return 1;
	}
	return 0;
}

// $C26BFB
void TargetAllies() {
	BattlerTargetFlags = 0;
	for (short i = 0; i < BattlersTable.length; i++) {
		if ((BattlersTable[i].consciousness != 0) && ((BattlersTable[i].allyOrEnemy == 0) || (BattlersTable[i].npcID != 0))) {
			BattlerTargetFlags |= PowersOfTwo32Bit[i];
		}
	}
}

// $C26C82
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

// $C26D04
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

// $C26E00
void TargetAll() {
	BattlerTargetFlags = 0;
	for (short i = 0; i < BattlersTable.length; i++) {
		if (BattlersTable[i].consciousness == 0) {
			continue;
		}
		BattlerTargetFlags |= PowersOfTwo32Bit[i];
	}
}

// $C26E77
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

uint RandomTargetting(uint);

// $C26FDC
void TargetBattler(short arg1) {
	BattlerTargetFlags |= PowersOfTwo32Bit[arg1];
}

// $C27029
short IsCharacterTargetted(short arg1) {
	if ((BattlerTargetFlags & PowersOfTwo32Bit[arg1]) != 0) {
		return 1;
	}
	return 0;
}

// $C27089
void RemoveTarget(short arg1) {
	BattlerTargetFlags &= (0xFFFFFFFF ^ PowersOfTwo32Bit[arg1]);
}

// $C270E4
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

// $C27126
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

// $C27191
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

// $C2724A
short InflictStatusBattle(Battler*, short, short);

// $C27294
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

// $C27397
void ReviveTarget(Battler*, short);

// $C27550
void KOTarget(Battler*);

// $C27E8A
void SwapAttackerWithTarget() {
	Battler* tmp = currentAttacker;
	currentAttacker = currentTarget;
	currentTarget = tmp;
	FixAttackerName(0);
	FixTargetName();
}

// $C27CFD
short FailAttackOnNPCs() {
	if (currentTarget.npcID != 0) {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
		return 1;
	}
	return 0;
}

// $C27EAF
short CalcDamage(Battler* target, short damage);

// $C28125
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

// $C282F8
short MissCalc(short arg1) {
	short x12;
	if ((currentAttacker.allyOrEnemy == 0) && (currentAttacker.npcID == 0)) {
		if (PartyCharacters[currentAttacker.row].equipment[0] != 0) {
			x12 = ItemData[PartyCharacters[currentAttacker.row].items[PartyCharacters[currentAttacker.row].equipment[0] - 1]].special;
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

// $C283F8
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

// $C284AD
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

// $C28523
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

// $C2856B
void HealStrangeness() {
	if (currentTarget.afflictions[3] == Status3.Strange) {
		currentTarget.afflictions[3] = 0;
		DisplayInBattleText(TextBattleBackToNormal);
	}
}

// $C2859F
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

// $C2889B
void BattleActionNull() {
	//nothing
}

// $C2889E
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

// $C288EB
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

// $C29033
void BattleActionNull2() {
	//nothing
}

// $C29036
void BattleActionNull3() {
	//nothing
}

// $C29039
void BattleActionNull4() {
	//nothing
}

// $C2903C
void BattleActionNull5() {
	//nothing
}

// $C2903F
void BattleActionNull6() {
	//nothing
}

// $C29042
void BattleActionNull7() {
	//nothing
}

// $C29045
void BattleActionNull8() {
	//nothing
}

// $C29048
void BattleActionNull9() {
	//nothing
}

// $C2904B
void BattleActionNull10() {
	//nothing
}

// $C2904E
void BattleActionNull11() {
	//nothing
}

// $C29051
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

// $C290C6
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

// $C2941D
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

// $C294CE
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

// $C29516
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

// $C29556
void BattleActionPSIRockinAlpha() {
	PSIRockinCommon(80);
}

// $C2955F
void BattleActionPSIRockinBeta() {
	PSIRockinCommon(180);
}

// $C29568
void BattleActionPSIRockinGamma() {
	PSIRockinCommon(540);
}

// $C29568
void BattleActionPSIRockinOmega() {
	PSIRockinCommon(720);
}

// $C2957A
void PSIFireCommon(short baseDamage);

// $C295AB
void BattleActionPSIFireAlpha() {
	PSIFireCommon(80);
}

// $C295B4
void BattleActionPSIFireBeta() {
	PSIFireCommon(160);
}

// $C295BD
void BattleActionPSIFireGamma() {
	PSIFireCommon(240);
}

// $C295C6
void BattleActionPSIFireOmega() {
	PSIFireCommon(320);
}

// $C295CF
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

// $C29647
void BattleActionPSIFreezeAlpha() {
	PSIFreezeCommon(180);
}

// $C29650
void BattleActionPSIFreezeBeta() {
	PSIFreezeCommon(360);
}

// $C29659
void BattleActionPSIFreezeGamma() {
	PSIFreezeCommon(540);
}

// $C29662
void BattleActionPSIFreezeOmega() {
	PSIFreezeCommon(720);
}

// $C2966B
void PSIThunderCommon(short baseDamage, short strikes);

// $C29871
void BattleActionPSIThunderAlpha() {
	PSIThunderCommon(120, 1);
}

// $C2987D
void BattleActionPSIThunderBeta() {
	PSIThunderCommon(120, 2);
}

// $C29889
void BattleActionPSIThunderGamma() {
	PSIThunderCommon(200, 3);
}

// $C29895
void BattleActionPSIThunderOmega() {
	PSIThunderCommon(200, 4);
}

// $C298A1
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

// $C298DE
void FlashInflictFeelingStrange() {
	if (InflictStatusBattle(currentTarget, 3, Status3.Strange) != 0) {
		DisplayInBattleText(TextBattleFeltALittleStrange);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

// $C29917
void FlashInflictParalysis()  {
	if (InflictStatusBattle(currentTarget, 0, Status0.Paralyzed) != 0) {
		DisplayInBattleText(TextBattleBecameNumb);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

// $C29950
void FlashInflictCrying() {
	if (InflictStatusBattle(currentTarget, 2, Status2.Crying) != 0) {
		DisplayInBattleText(TextBattleCouldNotStopCrying);
	} else {
		DisplayInBattleText(TextBattleItDidntWorkOnX);
	}
}

// $C29987
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

// $C299AE
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

// $C299EF
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

// $C29A35
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

// $C29AB8
void LifeupCommon(short baseHealing);

// $C29AC6
void BattleActionLifeupAlpha() {
	LifeupCommon(100);
}

// $C29ACF
void BattleActionLifeupBeta() {
	LifeupCommon(300);
}

// $C29AD8
void BattleActionLifeupGamma() {
	LifeupCommon(10000);
}

// $C29AE1
void BattleActionLifeupOmega() {
	LifeupCommon(400);
}

// $C29AEA
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

// $C29B7A
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

// $C29C2C
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

// $C29CB8
void BattleActionHealingOmega() {
	if (currentTarget.afflictions[0] == Status0.Unconscious) {
		ReviveTarget(currentTarget, currentTarget.hpMax);
	} else {
		BattleActionHealingGamma();
	}
}

// $C29CDC
short ShieldsCommon(Battler*, ubyte status);

// $C29D44
void BattleActionShieldAlpha() {
	if (ShieldsCommon(currentTarget, Status6.Shield) == 1) {
		DisplayInBattleText(TextBattleShieldGotStronger);
	} else {
		DisplayInBattleText(TextBattleProtectedByShield);
	}
}

// $C29D7A
void BattleActionShieldSigma() {
	BattleActionShieldAlpha();
}

// $C29D81
void BattleActionShieldBeta() {
	if (ShieldsCommon(currentTarget, Status6.ShieldPower) == 1) {
		DisplayInBattleText(TextBattlePowerShieldGotStronger);
	} else {
		DisplayInBattleText(TextBattleProtectedByPowerShield);
	}
}

// $C29DB7
void BattleActionShieldOmega() {
	BattleActionShieldBeta();
}

// $C29DBE
void BattleActionPSIShieldAlpha() {
	if (ShieldsCommon(currentTarget, Status6.PSIShield) == 1) {
		DisplayInBattleText(TextBattlePsychicShieldGotStronger);
	} else {
		DisplayInBattleText(TextBattleProtectedByPsychicShield);
	}
}

// $C29DF4
void BattleActionPSIShieldSigma() {
	BattleActionPSIShieldAlpha();
}

// $C29DFB
void BattleActionPSIShieldBeta() {
	if (ShieldsCommon(currentTarget, Status6.PSIShieldPower) == 1) {
		DisplayInBattleText(TextBattlePsychicPowerShieldGotStronger);
	} else {
		DisplayInBattleText(TextBattleProtectedByPsychicPowerShield);
	}
}

// $C29E31
void BattleActionPSIShieldOmega() {
	BattleActionPSIShieldBeta();
}

// $C2A0AE
void BattleActionHPRecovery1d4() {
	RecoverHP(currentTarget, RandLimit(4));
}

// $C2A380
void BattleActionHPRecovery10000() {
	if (currentTarget.id != 4) {
		RecoverHP(currentTarget, 10000);
	} else {
		BattleActionHPRecovery1d4();
	}
}

// $C2A39D
void HealPoison() {
	if (currentTarget.afflictions[0] == Status0.Poisoned) {
		currentTarget.afflictions[0] = 0;
		DisplayInBattleText(TextBattlePoisonWasRemoved);
	}
}

// $C2AF1F
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

// $C2B0A1
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

// $C2B608
ubyte CalcPSIDamageModifiers(ubyte arg1) {
	switch (arg1) {
		case 0: return 255;
		case 1: return 179;
		case 2: return 102;
		case 3: return 13;
		default: return arg1;
	}
}
// $C2B639
ubyte CalcPSIResistanceModifiers(ubyte arg1) {
	switch (arg1) {
		case 0: return 255;
		case 1: return 128;
		case 2: return 26;
		case 3: return 0;
		default: return arg1;
	}
}

// $C2B66A
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

// $C2B6EB
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

// $C2B930
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

// $C2BAC5
short CountChars(short);

// $C2BB18
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

// $C2BC5C
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

// $C2BCB9
void UnknownC2BCB9(Battler* battler, short arg2) {
	SetPP(battler, (arg2 > battler.ppTarget) ? 0 : cast(ushort)(battler.ppTarget - arg2));
}

// $C2BCE6
void LoseHPStatus(Battler* battler, short arg2) {
	SetHP(battler, (arg2 > battler.hpTarget) ? 0 : cast(ushort)(battler.hpTarget - arg2));
}

// $C2C14E
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

// $C2C1BD
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

// $C2C21F
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

// $C2C32C
void UnknownC2C32C(short arg1) {
	ubyte x10 = BattlersTable[8].spriteX;
	ubyte x04 = BattlersTable[8].spriteY;
	BattleInitEnemyStats(arg1, &BattlersTable[8]);
	BattlersTable[8].spriteX = x10;
	BattlersTable[8].spriteY = x04;
	BattlersTable[8].hasTakenTurn = 1;
}

// $C2C37A
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

// $C2C3E2
void GiygasHurtPrayer(short damage) {
	Wait(1 * 60);
	currentTarget = &BattlersTable[8];
	FixTargetName();
	GreenFlashDuration = 1 * 60;
	Unknown7EAA8E = 1;
	CalcResistDamage(TwentyFivePercentVariance(damage), 0xFF);
	Wait(1 * 60);
}

// $C2C41F
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

// $C2C513
void BattleActionNull12() {
	//nothing
}

// $C2C572
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

// $C2C5D1
void BattleActionGiygasPrayer2() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer2);
	GiygasHurtPrayer(50);
	CurrentGiygasPhase = GiygasPhase.Prayer2Used;
}

// $C2C5FA
void BattleActionGiygasPrayer3() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer3);
	GiygasHurtPrayer(100);
	CurrentGiygasPhase = GiygasPhase.Prayer3Used;
}

// $C2C623
void BattleActionGiygasPrayer4() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer4);
	GiygasHurtPrayer(200);
	CurrentGiygasPhase = GiygasPhase.Prayer4Used;
}

// $C2C64C
void BattleActionGiygasPrayer5() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer5);
	GiygasHurtPrayer(400);
	CurrentGiygasPhase = GiygasPhase.Prayer5Used;
}

// $C2C675
void BattleActionGiygasPrayer6() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer6);
	GiygasHurtPrayer(800);
	CurrentGiygasPhase = GiygasPhase.Prayer6Used;
}

// $C2C69E
void BattleActionGiygasPrayer7() {
	UnknownC2C37A(479, Music.GiygasPhase3, TextBattleGiygasPrayer7);
	GiygasHurtPrayer(1600);
	CurrentGiygasPhase = GiygasPhase.Prayer7Used;
	UnknownC2C21F(480, Music.GiygasWeakened2);
}

// $C2C6D0
void BattleActionGiygasPrayer8() {
	UnknownC2C41F(74, TextBattleGiygasPrayer8);
	CurrentGiygasPhase = GiygasPhase.Prayer8Used;
}

// $C2C6F0
void BattleActionGiygasPrayer9() {
	UnknownC20F9A();
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

// $C2C8C8
void LoadEnemyBattleSprites();

// $C2C92D
void GenerateBattleBGFrame(LoadedBackgroundData* arg1, short layer);

// $C2CFE5
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

// $C2D0AC
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

// $C2D121
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

// $C2DAE3
void UnknownC2DAE3() {
	ubyte x0E = LoadedBGDataLayer1.DistortionStyles[0];
	LoadedBGDataLayer1.DistortionStyles[0] = LoadedBGDataLayer1.DistortionStyles[3];
	LoadedBGDataLayer1.DistortionStyles[1] = 0;
	LoadedBGDataLayer1.DistortionDurationLeft = 1;
	LoadedBGDataLayer1.DistortionStyles[3] = x0E;
}

// $C2DB3F
void UnknownC2DB3F();

// $C2DE96
void UnknownC2DE96() {
	memcpy(&LoadedBGDataLayer1.Palette[0], &LoadedBGDataLayer1.Palette2[0], LoadedBGDataLayer1.Palette.sizeof);
	memcpy(&LoadedBGDataLayer2.Palette[0], &LoadedBGDataLayer2.Palette2[0], LoadedBGDataLayer2.Palette.sizeof);
	memcpy(LoadedBGDataLayer1.PalettePointer, &LoadedBGDataLayer1.Palette[0], LoadedBGDataLayer1.Palette.sizeof);
	memcpy(LoadedBGDataLayer2.PalettePointer, &LoadedBGDataLayer2.Palette[0], LoadedBGDataLayer2.Palette.sizeof);
}

// $C2E0E7
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

// $C2E116
void ShowPSIAnimation(short);

// $C2E8C4
void UnknownC2E8C4(short arg1, short arg2, short arg3) {
	UnknownC4A67E(arg1, arg2);
	Unknown7EAECA = cast(ubyte)arg3;
}

// $C2E9C8
short UnknownC2E9C8() {
	if ((Unknown7EAEC2 != 0) && (4 > Unknown7EAECA)) {
		return 1;
	}
	return 0;
}

// $C2E9ED
void UnknownC2E9ED() {
	Unknown7EAEC2 = 0;
	UnknownC0AE34(Unknown7EAEC9 + 3);
	SetColData(0, 0, 0);
	SetWindowMask(0, 0);
}

// $C2EA15
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

// $C2EA74
void UnknownC2EA74() {
	UnknownC4A67E(0, 0);
	Unknown7EAEC8 = 0x13;
	if (Unknown7EAEEF != 0) {
		Unknown7EAECC = &UnknownC4A652[0];
	} else {
		Unknown7EAECC = &UnknownC4A626[0];
	}
}

// $C2EAAA
void UnknownC2EAAA() {
	Unknown7EAEC2 = 0;
	Unknown7EAECC = null;
	UnknownC0AE34(3);
	SetWindowMask(0, 0);
}

// $C2EACF
short UnknownC2EACF() {
	if (Unknown7E1B9E != 0) {
		return 1;
	}
	if (Unknown7EAEC2 == 0) {
		return 0;
	}
	return 1;
}

// $C2EAEA
void UnknownC2EAEA(short);

// $C2EFFD
short GetBattleSpriteWidth(short);

// $C2EEE7
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

// $C2F09F
ubyte UnknownC2F09F(short arg1) {
	for (ubyte i = 0; i < 4; i++) {
		if (Unknown7EAABE[i] == arg1) {
			return i;
		}
	}
	return 0;
}

// $C2F0D1
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

// $C2F121
void UnknownC2F121();

// $C2F121
void UnknownC2F724(short);

// $C2F8F9
void UnknownC2F8F9() {
	UnknownC088A5(0x7E);
	OAMClear();
	UnknownC2F724(0);
	UnknownC2F724(1);
	UpdateScreen();
}

// $C2F917
void UnknownC2F917();

// $C2FEF9
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
