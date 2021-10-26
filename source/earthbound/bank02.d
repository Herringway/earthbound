module earthbound.bank02;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.bank0A;
import earthbound.bank15;
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
	PartyCharacters[id - 1].fire_resist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].special & 0xC : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].special & 0xC : 0;
	total >>= 2;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].freeze_resist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].special & 0x30 : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].special & 0x30 : 0;
	total >>= 4;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].flash_resist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Body] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Body] - 1]].special & 0xC0 : 0;
	total += (PartyCharacters[id - 1].equipment[EquipmentSlot.Other] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Other] - 1]].special & 0xC0 : 0;
	total >>= 6;
	if (total >= 3) {
		total = 3;
	}
	PartyCharacters[id - 1].paralysis_resist = cast(ubyte)total;

	total = (PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] != 0) ? ItemData[PartyCharacters[id - 1].items[PartyCharacters[id - 1].equipment[EquipmentSlot.Arms] - 1]].special : 0;
	PartyCharacters[id - 1].hypnosis_brainshock_resist = cast(ubyte)total;
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

// $C2C92D
void GenerateBattleBGFrame(LoadedBackgroundData* arg1, short layer);

// $C2CFE5
void UnknownC2CFE5(LoadedBackgroundData* arg1, const(AnimatedBackground)* arg2);

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
	Decomp(BattleBGGraphicsPointers[animatedBackgrounds[layer1].graphics], &Unknown7F0000[0]);
	if (CurrentBattleGroup == 0x1DE) {
		SetBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x3000);
		CopyToVram(0, 0x5000, 0x3000, &Unknown7F0000[0]);
	} else {
		CopyToVram(0, 0x2000, 0x1000, &Unknown7F0000[0]);
	}
	Unknown7F0000[0] = 0;
	CopyToVram(3, 0x800, 0x5800, &Unknown7F0000[0]);
	CopyToVram(3, 0x800, 0, &Unknown7F0000[0]);
	Decomp(BattleBGArrangementPointers[animatedBackgrounds[layer1].graphics], &Unknown7F0000[0]);
	if (animatedBackgrounds[layer1].bitsPerPixel == 4) {
		UnknownC08D79(9);
		for (short i = 0; i < 0x800; i += 2) {
			Unknown7F0000[i + 1] = (Unknown7F0000[i + 1] & 0xDF) | 8;
		}
		CopyToVram(0, 0x800, 0x5C00, &Unknown7F0000[0]);
		UnknownC2CFE5(&LoadedBGDataLayer1, &animatedBackgrounds[layer1]);
		LoadedBGDataLayer1.PalettePointer = &palettes[2];
		memcpy(&LoadedBGDataLayer1.Palette[0], BattleBGPalettePointers[animatedBackgrounds[layer1].palette], 32);
		memcpy(&LoadedBGDataLayer1.Palette2[0], BattleBGPalettePointers[animatedBackgrounds[layer1].palette], 32);
		memcpy(LoadedBGDataLayer1.PalettePointer, &LoadedBGDataLayer1.Palette[0], 32);
		LoadedBGDataLayer1.TargetLayer = 2;
		GenerateBattleBGFrame(&LoadedBGDataLayer1, 0);
		LoadedBGDataLayer2.TargetLayer = 0;
		Unknown7EAD8A = 1;
		UnknownC0AFCD();
		Unknown7EADAE = 0x17;
		Unknown7EADB0 = 0x15;
		if (layer2 != 0) {
			if ((letterbox & 4) != 0) {
				Unknown7EAD8A = 7;
				UnknownC0AFCD();
				Decomp(BattleBGGraphicsPointers[animatedBackgrounds[layer2].graphics], &Unknown7F0000[0]);
				CopyToVram(0, 0x2000, 0, &Unknown7F0000[0]);
				Decomp(BattleBGArrangementPointers[animatedBackgrounds[layer2].graphics], &Unknown7F0000[0]);
				for (short i = 0; i < 0x800; i += 2) {
					Unknown7F0000[i + 1] = (Unknown7F0000[i + 1] & 0xDF) | 8;
				}
				CopyToVram(0, 0x800, 0x5800, &Unknown7F0000[0]);
				UnknownC2CFE5(&LoadedBGDataLayer2, &animatedBackgrounds[layer2]);
				LoadedBGDataLayer2.PalettePointer = &palettes[4];
				LoadedBGDataLayer2.TargetLayer = 1;
				memcpy(&LoadedBGDataLayer2.Palette[0], BattleBGPalettePointers[animatedBackgrounds[layer2].palette], 32);
				memcpy(&LoadedBGDataLayer2.Palette2[0], BattleBGPalettePointers[animatedBackgrounds[layer2].palette], 32);
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
		memcpy(&LoadedBGDataLayer1.Palette[0], BattleBGPalettePointers[animatedBackgrounds[layer1].palette], 32);
		memcpy(&LoadedBGDataLayer1.Palette2[0], BattleBGPalettePointers[animatedBackgrounds[layer1].palette], 32);
		memcpy(LoadedBGDataLayer1.PalettePointer, &LoadedBGDataLayer1.Palette[0], 32);
		LoadedBGDataLayer1.TargetLayer = 3;
		if (layer2 != 0) {
			Unknown7EAD8A = 3;
			UnknownC0AFCD();

			Decomp(BattleBGGraphicsPointers[animatedBackgrounds[layer2].graphics], &Unknown7F0000[0]);
			CopyToVram(0, 0x1800, 0x3000, &Unknown7F0000[0]);
			Decomp(BattleBGArrangementPointers[animatedBackgrounds[layer2].graphics], &Unknown7F0000[0]);
			for (short i = 0; i < 0x800; i += 2) {
				Unknown7F0000[i + 1] = (Unknown7F0000[i + 1] & 0xDF);
			}
			CopyToVram(0, 0x800, 0xC00, &Unknown7F0000[0]);
			UnknownC2CFE5(&LoadedBGDataLayer2 ,&animatedBackgrounds[layer2]);
			LoadedBGDataLayer2.PalettePointer = &palettes[6];
			memcpy(&LoadedBGDataLayer2.Palette[0], BattleBGPalettePointers[animatedBackgrounds[layer2].palette], 32);
			memcpy(&LoadedBGDataLayer2.Palette2[0], BattleBGPalettePointers[animatedBackgrounds[layer2].palette], 32);
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

// $C2DB3F
void UnknownC2DB3F();

// $C2E9ED
void UnknownC2E9ED();
