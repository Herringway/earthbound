/// mostly text code
module earthbound.bank01;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.bank05;
import earthbound.bank07;
import earthbound.bank08;
import earthbound.bank09;
import earthbound.bank0F;
import earthbound.bank10;
import earthbound.bank15;
import earthbound.bank20;
import earthbound.bank2F;
import earthbound.globals;

import core.stdc.string;

/// $C10000
void UnknownC10000() {
	HideHPPPWindows();
}

/// $C10004
void UnknownC10004(const(ubyte)* arg1) {
	UnknownC0943C();
	DisplayText(arg1);
	do {
		WindowTick();
	} while (Unknown7EB4A8 != -1);
	UnknownC09451();
}

/// $C10036
void EnableBlinkingTriangle(ushort arg1) {
	BlinkingTriangleFlag = arg1;
}

/// $C1003C
void ClearBlinkingPrompt() {
	BlinkingTriangleFlag = 0;
}

/// $C10042
short GetBlinkingPrompt() {
	return BlinkingTriangleFlag;
}

/// $C10048
void SetTextSoundMode(ushort arg1) {
	TextSoundMode = arg1;
}

/// $C1004E
void UnknownC1004E() {
	if (Unknown7E89C9 != 0) {
		UnknownC3E450();
	}
	if (BattleModeFlag != 0) {
		UnknownC43568();
	}
	OAMClear();
	UnknownC09466();
	UpdateScreen();
	WaitUntilNextFrame();
}

/// $C1007E - Set the focused window
void SetWindowFocus(short id) {
	CurrentFocusWindow = id;
}

/// $C10084
void CloseFocusWindowN() {
	CloseWindow(CurrentFocusWindow);
}

/// $C1008E
void UnknownC1008E() {
	Unknown7E5E70 = 1;
	while (window_tail != -1) {
		CloseWindow(WindowStats[window_tail].window_id);
	}
	ClearInstantPrinting();
	WindowTick();
	Unknown7E5E70 = 0;
	UnknownC43F53();
}

/// $C100C7
void LockInput() {
	InputLockFlag = 1;
}

/// $C100D0
void UnlockInput() {
	InputLockFlag = 0;
}

/// $C100D6
void UnknownC100D6(ushort arg1) {
	ClearInstantPrinting();
	WindowTick();
	while (--arg1 != 0) {
		UnknownC12E42();
	}
}

/// $C100FE
void UnknownC100FE(short arg1) {
	if ((Debug != 0) && (BattleDebug == 0)) {
		while ((pad_press[0] & (PAD_B | PAD_SELECT | PAD_A | PAD_L)) == 0) {
			UnknownC12E42();
		}
		return;
	}
	while (InputLockFlag != 0) {
		if (Debug == 0) {
			continue;
		}
		if ((pad_press[0] & (PAD_B | PAD_R)) != (PAD_B | PAD_R)) {
			continue;
		}
		InputLockFlag = 0;
	}
	short x0E = (arg1 != 0) ? arg1 : Unknown7E964B;
	while ((x0E-- != 0) && ((pad_press[0] & (PAD_B | PAD_SELECT | PAD_A | PAD_L)) == 0)) {
		UnknownC12E42();
	}
}

/// $C10166 - CC [03], [13], [14] common code - halt parsing
void CC1314(short arg1, short arg2) {
	while (InputLockFlag) {
		if (Debug == 0) {
			continue;
		}
		if ((pad_press[0] & (PAD_B | PAD_R)) == (PAD_B | PAD_R)) {
			InputLockFlag = 0;
			break;
		}
	}
	ClearInstantPrinting();
	WindowTick();
	if ((arg2 == 0) && (BlinkingTriangleFlag != 0) &&(Unknown7E964B != 0)) {
		UnknownC100FE(0);
		return;
	}
	if (BlinkingTriangleFlag != 0) {
		PauseMusic();
	}
	if (arg1 == 0) {
		while ((pad_press[0] & (PAD_B | PAD_SELECT | PAD_A | PAD_L)) == 0) {
			UnknownC12E42();
		}
	} else {
		outer: while (true) {
			CopyToVram(0, 2, cast(short)(0x7C20 + WindowStats[WindowTable[CurrentFocusWindow]].width + WindowStats[WindowTable[CurrentFocusWindow]].x + (WindowStats[WindowTable[CurrentFocusWindow]].height + WindowStats[WindowTable[CurrentFocusWindow]].height) * 32), cast(const(ubyte)*)&BlinkingTriangleTiles[0]);
			for (short i = 15; i != 0; i--) {
				if ((pad_press[0] & (PAD_B | PAD_SELECT | PAD_A | PAD_L)) != 0) {
					break outer;
				}
				UnknownC12E42();
			}
			CopyToVram(0, 2, cast(short)(0x7C20 + WindowStats[WindowTable[CurrentFocusWindow]].width + WindowStats[WindowTable[CurrentFocusWindow]].x + (WindowStats[WindowTable[CurrentFocusWindow]].height + WindowStats[WindowTable[CurrentFocusWindow]].height) * 32), cast(const(ubyte)*)&BlinkingTriangleTiles[1]);
			for (short i = 10; i != 0; i--) {
				if ((pad_press[0] & (PAD_B | PAD_SELECT | PAD_A | PAD_L)) != 0) {
					break outer;
				}
				UnknownC12E42();
			}
		}
		CopyToVram(0, 2, cast(short)(0x7C20 + WindowStats[WindowTable[CurrentFocusWindow]].width + WindowStats[WindowTable[CurrentFocusWindow]].x + (WindowStats[WindowTable[CurrentFocusWindow]].height + WindowStats[WindowTable[CurrentFocusWindow]].height) * 32), cast(const(ubyte)*)&BlinkingTriangleTiles[2]);
	}
	ResumeMusic();
}

/// $C102D0
void UnknownC102D0() {
	Unknown7E9641 = 0;
	ClearInstantPrinting();
	WindowTick();
	while (Unknown7E9641 == 0) {
		if ((Debug != 0) && ((pad_state[0] & PAD_START) != 0) && ((pad_state[0] & PAD_SELECT) != 0)) {
			return;
		}
		UnknownC1004E();
	}
	Unknown7E9641 = 0;
}

/// $C10301
WinStat* GetActiveWindowAddress() {
	if (window_head == -1) {
		return &Unknown7E85FE;
	}
	return &WindowStats[WindowTable[CurrentFocusWindow]];
}

/// $C10324
void TransferActiveMemStorage() {
	WinStat* x0E = GetActiveWindowAddress();
	x0E.result_bak = x0E.result;
	x0E.argument_bak = x0E.argument;
	x0E.counter_bak = x0E.counter;
}

/// $C10380
void TransferStorageMemActive() {
	WinStat* x0E = GetActiveWindowAddress();
	x0E.result = x0E.result_bak;
	x0E.argument = x0E.argument_bak;
	x0E.counter = x0E.counter_bak;
}

/// $C103DC
uint GetArgumentMemory() {
	return GetActiveWindowAddress().argument;
}

/// $C10400
ushort GetSecondaryMemory() {
	return GetActiveWindowAddress().counter;
}

/// $C1040A
WorkingMemory GetWorkingMemory() {
	return GetActiveWindowAddress().result;
}

/// $C1042E
void IncrementSecondaryMemory() {
	GetActiveWindowAddress().counter++;
}

/// $C10443
ushort SetSecondaryMemory(ushort arg1) {
	GetActiveWindowAddress().counter = arg1;
	return arg1;
}

/// $C1045D
WorkingMemory SetWorkingMemory(WorkingMemory arg1) {
	GetActiveWindowAddress.result = arg1;
	return arg1;
}

/// $C10489
uint SetArgumentMemory(uint arg1) {
	GetActiveWindowAddress.argument = arg1;
	return arg1;
}

/// $C104B5
short GetTextX() {
	if (CurrentFocusWindow == -1) {
		return 0;
	}
	return WindowStats[WindowTable[CurrentFocusWindow]].text_x;
}

/// $C104D8
short GetTextY() {
	return WindowStats[WindowTable[CurrentFocusWindow]].text_y;
}

/// $C104EE
void CreateWindowN(short id) {
	WinStat* x10;
	if (WindowTable[id] != -1) {
		CurrentFocusWindow = id;
		UnknownC11383();
		x10 = &WindowStats[WindowTable[id]];
	} else {
		short x0E = UnknownC3E4EF();
		if (x0E == -1) {
			return;
		}
		x10 = &WindowStats[x0E];
		if (id == 10) {
			if (window_head == -1) {
				x10.next = -1;
				window_tail = x0E;
			} else {
				WindowStats[window_head].prev = x0E;
				x10.next = window_head;
			}
			x10.prev = -1;
			window_head = x0E;
		} else {
			if (window_head == -1) {
				x10.prev = -1;
				window_head = x0E;
			} else {
				x10.prev = window_tail;
				WindowStats[window_tail].next = x0E;
			}
			window_tail = x0E;
			x10.next = -1;
		}
		x10.window_id = id;
		WindowStats[id].next = x0E;
		x10.x = WindowConfigurationTable[id].x;
		x10.y = WindowConfigurationTable[id].y;
		x10.width = WindowConfigurationTable[id].width;
		x10.height = WindowConfigurationTable[id].height;
		x10.tilemapBuffer = &Unknown7E5E7E[x0E][0];
		CurrentFocusWindow = id;
	}
	WinStat* x12 = GetActiveWindowAddress();
	x10.text_y = 0;
	x10.text_x = 0;
	x10.num_padding = 0x80;
	x10.tileAttributes = 0;
	x10.font = 0;
	x10.result = x12.result;
	x10.argument = x12.argument;
	x10.result_bak = x12.result_bak;
	x10.argument_bak = x12.argument_bak;
	x10.counter = x12.counter;
	x10.counter_bak = x12.counter_bak;
	x10.selected_option = -1;
	x10.option_count = -1;
	x10.current_option = -1;
	x10.menu_columns = 1;
	x10.menu_page = 1;
	x10.menu_callback = null;
	for (short i = cast(short)(x10.height * x10.width); i != 0; i--) {
		if (x10.tilemapBuffer[i] != 0) {
			UnknownC44E4D(x10.tilemapBuffer[i]);
		}
		x10.tilemapBuffer[i] = 0x40;
	}
	if (x10.title_id != 0) {
		Unknown7E894E[x10.title_id - 1] = -1;
	}
	x10.title[0] = 0;
	x10.title_id = 0;
	UnknownC45E96();
	Unknown7E9623 = 1;
	UnknownC07C5B();
}

/// $C1078D
void UnknownC1078D() {
	CopyToVramAlt(0, 0x240, 0x7E40, cast(ubyte*)&Unknown7E827E[0]);
}

/// $C107AF - Draws a window
void UnknownC107AF(short windowID) {
	ushort* x1E = &WindowStats[windowID].tilemapBuffer[0];
	ushort* x18 = &bg2Buffer[WindowStats[windowID].y * 32 + WindowStats[windowID].x];
	short x1C = WindowStats[windowID].width;
	short x04 = x1C;
	short x1A = WindowStats[windowID].height;
	if ((x18[0] == 0) || (x18[0] == 0x3C10)) {
		(x18++)[0] = 0x3C10;
	} else {
		(x18++)[0] = 0x3C13;
	}
	if (WindowStats[windowID].title_id != 0) {
		short x02 = cast(short)((WindowStats[windowID].title_id - 1) * 16 + 0x2E0);
		(x18++)[0] = 0x3C16;
		short x12 = cast(short)(x1C - 1);
		for (short i = cast(short)(((strlen(cast(char*)&WindowStats[windowID].title[0]) * 6) + 7) / 8); i != 0; i--) {
			(x18++)[0] = cast(ushort)(x02 + 0x2000);
			x12--;
		}
		(x18++)[0] = 0x7C16;
		x04 = cast(short)(x12 - 1);
	}
	if ((WindowStats[windowID].window_id == Unknown7E5E7A) && (Unknown7E5E7C != -1)) {
		x04 -= 4;
	}
	for (short i = x04; i != 0; i--) {
		(x18++)[0] = 0x3C11;
	}
	if ((WindowStats[windowID].window_id == Unknown7E5E7A) && (Unknown7E5E7C != -1)) {
		for (short i = 0; i < 4; i++) {
			(x18++)[0] = UnknownC3E41CPointerTable[Unknown7E5E7C][i];
		}
	}
	if ((x18[0] == 0) || (x18[0] == 0x7C10)) {
		(x18++)[0] = 0x7C10;
	} else {
		(x18++)[0] = 0x7C13;
	}
	x18 += 32 - x1C - 2;
	for (short i = x1A; i != 0; i++) {
		(x18++)[0] = 0x3C12;
		for (short j = x1C; j != 0; j--) {
			(x18++)[0] = cast(ushort)((x1E++)[0] + 0x2000);
		}
		(x18++)[0] = 0x7C12;
		x18 += 32 - x1C - 2;
	}
	if ((x18[0] == 0) || (x18[0] == 0xBC10)) {
		(x18++)[0] = 0xBC10;
	} else {
		(x18++)[0] = 0xBC13;
	}
	for (short i = x1C; i != 0; i--) {
		(x18++)[0] = 0xBC11;
	}
	if ((x18[0] == 0) || (x18[0] == 0xFC10)) {
		(x18++)[0] = 0xFC10;
	} else {
		(x18++)[0] = 0xFC13;
	}
}

/// $C10A04
void ShowHPPPWindows() {
	UnknownC3E6F8();
	Unknown7E89C9 = 1;
	Unknown7E9623 = 1;
	Unknown7E9647 = -1;
}

/// $C10A1D
void HideHPPPWindows() {
	UnknownC3E6F8();
	Unknown7E89C9 = 0;
	if (BattleModeFlag == 0) {
		for (short i = 0; i != gameState.playerControlledPartyMemberCount; i++) {
			UndrawHPPPWindow(i);
			PartyCharacters[gameState.partyMembers[i] - 1].hp.current.integer = PartyCharacters[gameState.partyMembers[i] - 1].hp.target;
			PartyCharacters[gameState.partyMembers[i] - 1].pp.current.integer = PartyCharacters[gameState.partyMembers[i] - 1].pp.target;
			PartyCharacters[gameState.partyMembers[i] - 1].hp.current.fraction = 0;
			PartyCharacters[gameState.partyMembers[i] - 1].pp.current.fraction = 0;
		}
	}
	Unknown7E9623 = 1;
}

/// $C10A85
void UnknownC10A85(short arg1, short arg2, ushort arg3) {
	if (WindowTable[arg1] == -1) {
		return;
	}
	short x10 = WindowStats[WindowTable[arg1]].text_x;
	short x04 = WindowStats[WindowTable[arg1]].text_y;
	if (arg3 == WindowStats[WindowTable[arg1]].width) {
		if (x04 != (WindowStats[WindowTable[arg1]].height / 2) - 1) {
			x04++;
		} else {
			UnknownC437B8(arg1);
		}
		x10 = 0;
	}
	if ((BlinkingTriangleFlag != 0) && (x10 == 0) && ((arg2 == 0x20) || (arg2 == 0x40))) {
		if (BlinkingTriangleFlag == 1) {
			goto Unknown9;
		}
		if (BlinkingTriangleFlag == 2) {
			arg2 = 0x20;
		}
	}
	WindowStats[WindowTable[arg1]].tilemapBuffer[(WindowStats[WindowTable[arg1]].width * x04 * 2) + x10] = cast(ushort)(((arg2 & 0xFFF0) * 2) + (arg2 & 0xF) + ((arg2 == 0x22) ? 0xC00 : arg3));
	WindowStats[WindowTable[arg1]].tilemapBuffer[(WindowStats[WindowTable[arg1]].width * x04 * 2) + x10 + WindowStats[WindowTable[arg1]].width] = cast(ushort)(((arg2 & 0xFFF0) * 2) + (arg2 & 0xF) + ((arg2 == 0x22) ? 0xC00 : arg3) + 0x10);
	x10++;
	Unknown9:
	WindowStats[WindowTable[arg1]].text_x = x10;
	WindowStats[WindowTable[arg1]].text_y = x04;
}

/// $C10BA1
void UnknownC10BA1(short arg1) {
	if (CurrentFocusWindow == -1) {
		return;
	}
	UnknownC10A85(CurrentFocusWindow, arg1, WindowStats[WindowTable[CurrentFocusWindow]].tileAttributes);
}

/// $C10BD3
void CC12() {
	UnknownC43739(CurrentFocusWindow);
	UnknownC438A5(0, WindowStats[WindowTable[CurrentFocusWindow]].text_y);
}

/// $C10BFE
MenuOpt* UnknownC10BFE(short arg1, short x, short y, const(ubyte)* label, const(ubyte)* selectedText) {
	return UnknownC1153B(arg1, x, y, label, selectedText);
}

/// $C10C49
short UnknownC1138DF(short arg1) {
	return UnknownC1138D(arg1);
}

/// $C10C55
short UnknownC10C55(uint arg1) {
	return UnknownC10D7C(arg1);
}

/// $C10C72
void UnknownC438A5F(short arg1, short arg2) {
	UnknownC438A5(arg1, arg2);
}

/// $C10C79
void PrintNewLineF() {
	PrintNewLine();
}

/// $C10C80
void UnknownC10BA1F(short arg1) {
	UnknownC10BA1(arg1);
}

/// $C10C86
void PrintLetterF(short arg1) {
	PrintLetter(arg1);
}

/// $C10C8C
void PrintStringF(short arg1, const(ubyte)* arg2) {
	PrintString(arg1, arg2);
}

/// $C10CAF
void UnknownC437B8F(short arg1) {
	UnknownC437B8(arg1);
}

/// $C10CB6
void PrintLetter(short arg1) {
	if (CurrentFocusWindow == -1) {
		return;
	}
	UnknownC44E61(WindowStats[WindowTable[CurrentFocusWindow]].font, arg1);
	if (WindowTable[CurrentFocusWindow] != window_tail) {
		Unknown7E9623 = 1;
	}
	short x;
	if (TextSoundMode == 2) {
		x = 1;
	} else if (TextSoundMode == 3) {
		x = 0;
	} else {
		x = 0;
		if (BlinkingTriangleFlag == 0) {
			x = 1;
		}
	}
	if ((x != 0) && (InstantPrinting == 0) && (arg1 != 0x20) && (arg1 != EBChar(' '))) {
		PlaySfx(Sfx.TextPrint);
	}
	if (InstantPrinting == 0) {
		for (short i = SelectedTextSpeed; i != 0; i--) {
			WindowTick();
		}
	}
}

/// $C10D60 - Put a tile on the focused window -- How is this different from "PrintIcon" ($C43F77)?
void UnknownC10D60(short tile) {
	UnknownC10BA1(tile);
	if (WindowTable[CurrentFocusWindow] != window_tail) {
		Unknown7E9623 = 1;
	}
}

/// $C10D7C
short UnknownC10D7C(uint arg1) {
	short result = 1;
	ubyte* x = &Unknown7E895A[6];
	while (arg1 >= 10) {
		*(x--) = arg1 % 10;
		arg1 /= 10;
		result++;
	}
	return result;
}

/// $C10DF6
void PrintNumber(uint arg1) {
	if (CurrentFocusWindow == -1) {
		return;
	}
	version(bugfix) {
		enum limit = 9_999_999;
	} else {
		//C enums can only be ints, and 9,999,999 does not fit in a 16-bit int
		enum limit = cast(short)9_999_999;
	}
	if (limit < arg1) {
		arg1 = limit;
	}
	short x14 = UnknownC10D7C(arg1);
	ubyte* x12 = &Unknown7E895A[7 - x14];
	short x16 = WindowStats[WindowTable[CurrentFocusWindow]].num_padding;
	if (x16 == 0) {
		short a = (x16 & 0xF) + 1;
		if (a < x14) {
			a = x14;
		}
		UnknownC43D95(cast(short)((x14 - a) * 6));
		while (x14 != 0) {
			PrintLetter(*(x12++) + EBChar('0'));
			x14--;
		}
	}
}

/// $C10EB4
void UnknownC10EB4(short arg1) {
	if (CurrentFocusWindow == -1) {
		return;
	}
	WindowStats[WindowTable[CurrentFocusWindow]].num_padding = cast(ubyte)arg1;
}

/// $C10EE3
void UnknownC10EE3(short arg1) {
	switch (arg1) {
		case 1:
			UnknownC12BF3();
			break;
		case 2:
			UnknownC12C36();
			break;
		default: break;
	}
}

/// $C10EFC
void PrintString(short length, const(ubyte)* text) {
	if (Unknown7E5E74 != 0) {
		UnknownC43EF8(text, length);
	}
	while ((text[0] != 0) && (length != 0)) {
		length--;
		PrintLetter((text++)[0]);
	}
}

/// $C10F40
void UnknownC10F40(short window) {
	if (window == -1) {
		return;
	}
	ushort* x0E = &WindowStats[WindowTable[window]].tilemapBuffer[0];
	for (short i = cast(short)(WindowStats[WindowTable[window]].height * WindowStats[WindowTable[window]].width); i != 0; i--) {
		if (x0E[0] != 0) {
			UnknownC44E4D(x0E[0]);
		}
		x0E[0] = 0x40;
		x0E++;
	}
	UnknownC45E96();
	WindowStats[WindowTable[window]].text_y = 0;
	WindowStats[WindowTable[window]].text_x = 0;
}

/// $C10FA3 - Clears the focused window
void ClearFocusWindow() {
	UnknownC10F40(CurrentFocusWindow);
}

/// $C10FAC
void ChangeCurrentWindowFont(short arg1) {
	if (CurrentFocusWindow == -1) {
		return;
	}
	if (arg1 == 0x30) {
		arg1 = 0;
	} else {
		arg1 = 1;
	}
	WindowStats[WindowTable[CurrentFocusWindow]].font = arg1;
}

/// $C10FEA - Sets the text color for the focused window
void Win_SetTextColor(short window_id) {
	if (window_id == -1) {
		return;
	}
	WindowStats[WindowTable[window_id]].tileAttributes = cast(ushort)(window_id * 0x400);
}
deprecated alias UnknownC10FEA = Win_SetTextColor;


/// $C1101C
int NumSelectPrompt(short arg1) {
	if (CurrentFocusWindow == -1) {
		return 0;
	}
	short x24 = WindowStats[WindowTable[CurrentFocusWindow]].text_x;
	short x22 = WindowStats[WindowTable[CurrentFocusWindow]].text_y;
	int x1E = 0;
	short x1C = 1;
	int x18 = 1;
	outer: while (true) {
		SetInstantPrinting();
		UnknownC438A5(x24, x22);
		short x02 = UnknownC10D7C(x1E);
		ubyte* x04 = &Unknown7E895A[7 - x02];
		short x16;
		for (x16 = arg1; x16 > x02; x16--) {
			version(bugfix) {
				UnknownC43F77((x16 == x1C) ? 0x10 : EBChar('0'));
			} else {
				UnknownC43F77((x16 == x1C) ? 0x10 : 0x30);
			}
		}
		for (; x16 != 0; x16--) {
			version(bugfix) {
				UnknownC43F77((x04++)[0] + ((x16 == x1C) ? 0x10 : EBChar('0')));
			 } else {
				UnknownC43F77((x04++)[0] + ((x16 == x1C) ? 0x10 : 0x30));
			 }
		}
		ClearInstantPrinting();
		WindowTick();
		while (true) {
			UnknownC12E42();
			if (((pad_press[0] & PAD_LEFT) != 0) && (x1C < arg1)) {
				PlaySfx(Sfx.Cursor2);
				x1C++;
				x18 *= 10;
			} else if (((pad_press[0] & PAD_RIGHT) != 0) && (x1C > 1)) {
				PlaySfx(Sfx.Cursor2);
				x1C--;
				x18 /= 10;
			} else if ((pad_held[0] & PAD_UP) != 0) {
				PlaySfx(Sfx.Cursor3);
				if ((x1E / x18) % 10 == 9) {
					x1E += x18;
				} else {
					x1E -= x18 * 9;
				}
			} else if ((pad_held[0] & PAD_DOWN) != 0) {
				PlaySfx(Sfx.Cursor3);
				if ((x1E / x18) % 10 == 0) {
					x1E -= x18;
				} else {
					x1E += x18 * 9;
				}
			} else if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
				PlaySfx(Sfx.Cursor1);
				return x1E;
			} else if ((pad_press[0] & (PAD_B | PAD_SELECT)) != 0) {
				PlaySfx(Sfx.Cursor2);
				return -1;
			}
		}
	}
}

/// $C1134B - Opens the HP/PP and wallet windows
void OpenHpAndWallet() {
	ShowHPPPWindows();
	UnknownC1AA18();
}

/// $C11354
short UnknownC11354() {
	for (short i = 0; i < MenuOptions.length; i++) {
		if (MenuOptions[i].field00 == 0) {
			return i;
		}
	}
	return -1;
}

/// $C11383
void UnknownC11383() {
	UnknownC3E7E3(CurrentFocusWindow);
}

/// $C1138D
short UnknownC1138D(short arg1) {
	if (arg1 == -1) {
		return 0;
	}
	short i = 1;
	for (MenuOpt* tmp = &MenuOptions[arg1]; tmp.next != -1; tmp++) {
		i++;
	}
	return i;
}

/// $C113D1
MenuOpt* UnknownC113D1(const(ubyte)* label, const(ubyte)* selectedText) {
	if (CurrentFocusWindow == -1) {
		return &MenuOptions[$ - 1];
	}
	short x10 = UnknownC11354();
	if (x10 == -1) {
		return &MenuOptions[$ - 1];
	}

	if (WindowStats[WindowTable[CurrentFocusWindow]].current_option == -1) {
		MenuOptions[x10].prev = -1;
		WindowStats[WindowTable[CurrentFocusWindow]].current_option = x10;
	} else {
		MenuOptions[x10].prev = WindowStats[WindowTable[CurrentFocusWindow]].option_count;
		MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].option_count].next = x10;
	}
	WindowStats[WindowTable[CurrentFocusWindow]].option_count = x10;
	MenuOptions[x10].next = -1;
	MenuOptions[x10].field00 = 1;
	MenuOptions[x10].script = selectedText;
	MenuOptions[x10].sfx = Sfx.Cursor1;
	ubyte* x = &MenuOptions[x10].label[0];
	do {
		(x++)[0] = label[0];
	} while ((label++)[0] != 0);
	return &MenuOptions[x10];
}

/// $C114B1
MenuOpt* UnknownC114B1(short x, short y, const(ubyte)* label, const(ubyte)* selectedText) {
	MenuOpt* x16 = UnknownC113D1(label, selectedText);
	x16.pixel_align = 0;
	if (Unknown7E5E71 != 0) {
		x16.pixel_align = x & 7;
		x = x >> 3;
	}
	x16.text_x = x;
	x16.text_y = y;
	return x16;
}

/// $C1153B
MenuOpt* UnknownC1153B(short arg1, short x, short y, const(ubyte)* label, const(ubyte)* selectedText) {
	MenuOpt* X = UnknownC114B1(x, y, label, selectedText);
	X.userdata = arg1;
	X.field00 = 2;
	return X;
}

/// $C11596
MenuOpt* UnknownC11596(short arg1, short x, short y, const(ubyte)* arg4, const(ubyte)* arg5, ubyte arg6) {
	MenuOpt* X = UnknownC1153B(arg1, x, y, arg4, arg5);
	X.sfx = arg6;
	return X;
}

/// $C115F4
MenuOpt* UnknownC115F4(short arg1, const(ubyte)* arg2, const(ubyte)* arg3) {
	MenuOpt* x = UnknownC113D1(arg2, arg3);
	x.userdata = arg1;
	x.next = 2;
	return x;
}

/// $C1163C - Prints the options into the focused window
void PrintMenuItems() {
	if (CurrentFocusWindow == -1) {
		return;
	}
	if (WindowStats[WindowTable[CurrentFocusWindow]].current_option == -1) {
		Unknown7E968C = 0xFF;
		return;
	}
	MenuOpt* x02 = &MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option];
	SetInstantPrinting();
	while (true) {
		if (x02.page == WindowStats[WindowTable[CurrentFocusWindow]].menu_page) {
			UnknownC43DDB(x02);
			if (x02.page == 0) {
				Win_SetTextColor(0);
				UnknownC43F77(0x14F);
				UnknownC43CAA();
				Win_SetTextColor(0);
				ubyte* y = &WindowStats[WindowTable[CurrentFocusWindow]].title[0];
				if (y[0] != 0) {
					ubyte* x;
					for (x = &Unknown7E9C9F[0]; (y[0] != 0) && (y[0] != EBChar('(')); x++) {
						x[0] = (y++)[0];
					}
					(x++)[0] = EBChar('(');
					(x++)[0] = cast(ubyte)(WindowStats[WindowTable[CurrentFocusWindow]].menu_page + EBChar('0'));
					(x++)[0] = EBChar(')');
					x[0] = 0;
					UnknownC43CAA();
					SetWindowTitle(CurrentFocusWindow, -1, &Unknown7E9C9F[0]);
					UnknownC43CAA();
					PrintString(cast(short)(strlen(cast(char*)&Unknown7E9C9F[0]) - 2), &Unknown7E9C9F[0]);
					PrintLetter((WindowStats[WindowTable[CurrentFocusWindow]].menu_page == MenuOptions[MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].option_count].prev].page) ? EBChar('1') : cast(ubyte)(WindowStats[WindowTable[CurrentFocusWindow]].menu_page + EBChar('1')));
					PrintLetter(EBChar(')'));
				} else {
					PrintString(-1, &x02.label[0]);
				}
			} else {
				PrintString(-1, &x02.label[0]);
			}
		}
		if (x02.next == -1) {
			break;
		}
		x02 = &MenuOptions[x02.next];
	}
}

/// $C1180D
// third argument unused?
void UnknownC1180D(short arg1, short arg2, short) {
	UnknownC451FA(arg1, 0, arg2);
	PrintMenuItems();
}

/// $C1181B
void UnknownC1181B(short arg1, short arg2, short arg3) {
	UnknownC451FA(arg1, 0, arg2);
	if (arg3 != -1) {
		WindowStats[WindowTable[CurrentFocusWindow]].selected_option = arg3;
		MenuOpt* x = &MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option];
		while (arg3 != 0) {
			arg3--;
			x = &MenuOptions[x.next];
		}
		WindowStats[WindowTable[CurrentFocusWindow]].menu_page = x.page;
	}
	PrintMenuItems();
}

/// $C11887
void UnknownC11887(short arg1) {
	WindowStats[WindowTable[CurrentFocusWindow]].selected_option = arg1;
	MenuOpt* x = &MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option];
	while (arg1 != 0) {
		arg1--;
		x = &MenuOptions[x.next];
	}
	WindowStats[WindowTable[CurrentFocusWindow]].menu_page = x.page;
	PrintMenuItems();
}

/// $C118E7 - Get target X/Y window positions after menu cursor movement
/// Returns: low byte = X, high byte = Y
short MoveCursor(short arg1, short arg2, short arg3, short arg4, short arg5, short arg6, short arg7) {
	short x12 = UnknownC20B65(arg1, arg2, arg3, arg4, -1);
	if (x12 == -1) {
		x12 = UnknownC20B65(arg6, arg7, arg3, arg4, -1);
		if ((arg3 == 0) && (((x12 >> 8) & 0xFF) != arg2)) {
			x12 = -1;
		} else if ((x12 & 0xFF) != arg1) {
			x12 = -1;
		}
	}
	if (x12 != -1) {
		PlaySfx(arg5);
	}
	return x12;
}

/// $C1196A - Handle menu selection on the focused window
short SelectionMenu(short cancelable) {
	// $28 = cancelable

	short dp26 = CurrentFocusWindow;
	if (dp26 == -1) return 0;

	WinStat *dp24 = &WindowStats[WindowTable[CurrentFocusWindow]]; // 16-bit pointer

	if (Unknown7E5E79) {
		dp24.current_option = Unknown7E9688; // field2B
		dp24.selected_option = Unknown7E968A; // field2F
	}

	short dp20;
	MenuOpt *dp04; // 16-bit pointer
	if (dp24.selected_option != -1) { // field2F
		short dp22 = dp24.selected_option;
		dp20 = dp22;

		dp04 = &MenuOptions[dp24.current_option]; // field2B

		while (dp22) {
			dp22--;
			dp04 = &MenuOptions[dp04.next]; // field02
		}

		SetInstantPrinting();
		UnknownC43CD2(dp04, dp04.text_x, dp04.text_y); // field08, field0A
		UnknownC43BB9(-1, 0, dp04.label.ptr); // field13
	} else {
		dp20 = 0;
		dp04 = &MenuOptions[dp24.current_option]; // field2B
	}

	short dp22;
label1:
	dp22 = 0;
	if (dp04.script) { // field0F
		SetInstantPrinting();
		DisplayText(dp04.script); // field0F
	}

	if (dp24.menu_callback) { // field37
		short dp1C = cast(short)((dp04.field00 == 1) ? dp20+1 : dp04.userdata);
		dp24.menu_callback(dp1C);
		SetWindowFocus(dp26);
	}

	ClearInstantPrinting();
	if (Unknown7E5E79) {
		dp04.text_x = Unknown7E9684; // field08
		dp04.text_y = Unknown7E9686; // field0A
	}

	UnknownC43CD2(dp04, dp04.text_x, dp04.text_y);
	Win_SetTextColor(1);
	UnknownC10D60(0x21); // Put cursor on the window maybe?
	Win_SetTextColor(0);
	WindowTick();

	short dp02 = 1;
label2:
	dp02 ^= 1;
	short dp1A = dp02;

	// x=field06, text_x=field0E, text_y=field10, y=field08
	short dp1E = cast(short)((dp24.x + dp24.text_x) + ((dp24.text_y * 2) + (dp24.y * 32)) + 0x7C20);
	dp02 = dp1A; // The addition above used dp02 as an intermediary value

	// dp18 = dp02 * 2;
	CopyToVram(0*3, 2, cast(ushort)dp1E, cast(ubyte*)(arrC3E406.ptr + dp02)); // Implied (dp02 * 2), because arrC3E406 is an array of ushort
	CopyToVram(0*3, 2, cast(ushort)(dp1E+32), cast(ubyte*)(arrC3E40A.ptr + dp02)); // Implied (dp02 * 2), because arrC3E40A is an array of ushort

	short dp1C;
	for (dp1E = 0; dp1E < 10; dp1E++) {
		UnknownC12E42();

		if (pad_press[0] & PAD_UP) {
			dp1C = MoveCursor(dp04.text_x, dp04.text_y, -1, 0, Sfx.Cursor3, dp04.text_x, dp24.height);
			goto label3;
		}

		if (pad_press[0] & PAD_LEFT) {
			dp1C = MoveCursor(dp04.text_x, dp04.text_y, 0, -1, Sfx.Cursor2, dp24.width, dp04.text_y);
			goto label3;
		}

		if (pad_press[0] & PAD_DOWN) {
			dp1C = MoveCursor(dp04.text_x, dp04.text_y, 1, 0, Sfx.Cursor3, dp04.text_x, -1);
			goto label3;
		}

		if (pad_press[0] & PAD_RIGHT) {
			dp1C = MoveCursor(dp04.text_x, dp04.text_y, 0, 1, Sfx.Cursor2, -1, dp04.text_y);
			goto label3;
		}

		if (pad_held[0] & PAD_UP) {
			dp1C = UnknownC20B65(dp04.text_x, dp04.text_y, -1, 0, 3);
			goto label3;
		}

		if (pad_held[0] & PAD_LEFT) {
			dp1C = UnknownC20B65(dp04.text_x, dp04.text_y, 0, -1, 2);
			goto label3;
		}

		if (pad_held[0] & PAD_DOWN) {
			dp1C = UnknownC20B65(dp04.text_x, dp04.text_y, 1, 0, 3);
			goto label3;
		}

		if (pad_held[0] & PAD_RIGHT) {
			dp1C = UnknownC20B65(dp04.text_x, dp04.text_y, 0, 1, 2);
		}

		if (pad_press[0] & (PAD_A|PAD_L)) {
			SetInstantPrinting();
			if (dp04.page) { // field06
				PlaySfx(dp04.sfx); // field0E
				UnknownC43CD2(dp04, dp04.text_x, dp04.text_y);
				UnknownC10D60(0x2F); // Remove cursor from window?
				Win_SetTextColor(6);

				if (Unknown7E5E6E) {
					if (Unknown7EB49D != 1) {
						if (CurrentFocusWindow == 19) {
							UnknownC43B15();
						} else {
							UnknownC43BB9(4, 1, dp04.label.ptr); // field13
						}
					} else {
						UnknownC43BB9(-1, 1, dp04.label.ptr); // field13;
					}
				} else {
					UnknownC43B15();
				}

				Win_SetTextColor(0);
				ClearInstantPrinting();

				dp24.selected_option = cast(short)dp20; // field2F
				return (dp04.field00 == 1) ? cast(short)(dp20+1) : dp04.userdata;
			}

			PlaySfx(2);
			ClearFocusWindow(); // Clear the focused window

			dp1E = dp24.menu_page;
			if (dp1E == MenuOptions[dp04.prev].page) { // prev=field04
				dp24.menu_page = 1;
			} else {
				dp24.menu_page = cast(short)(dp1E+1);
			}

			ClearInstantPrinting();
			UnknownEF0115(cast(short)dp26);
			WindowTick();

			PrintMenuItems(); // Print the options for the new page
			SetInstantPrinting();
			goto label1; // Back to the start....
		}

		if ((pad_press[0] & (PAD_B|PAD_SELECT)) && cancelable == 1) {
			PlaySfx(2);
			return 0;
		}

		++dp22;
		if (WindowTable[0] == window_tail) { // If the field/overworld commands window is the last opened window...
			if (dp22 > 60) { // If 60 frames have passed
				if (WindowTable[10] == -1) { // If the wallet window is not open
					OpenHpAndWallet();
					SetWindowFocus(0);
					// Funky! I didn't expect a goto back to the start here...
					// The reason this is here is because the code path from label1 calls WindowTick (draws the HP and wallet windows) and resets dp22.
					// Why they didn't just do that here, I have no idea. This has the "side-effect" of acting as if the player
					// moved the cursor into the same option again, calling the option select script and the window menu callback
					goto label1; // Back to the start...
				}
			}
		}
	} // for (dp1E = 0; dp1E < 10; dp1E++);
	goto label2; // 10 frames have passed without player input, change cursor frame and start over again

	// Okay, so this is an interesting one... The code just does "CMP #$FFFF" without an "LDA $1C",
	// however, the code always stores the Accumulator into dp1C before gotoing here
label3:
	if (dp1C == -1) goto label1; // Back to the start...

	dp02 = 0;
	MenuOpt *dp22_opt = &MenuOptions[dp24.current_option]; // Reuses dp22, 16-bit pointer

	short tmp = dp1C & 0xFF;
	dp1C = dp1C >> 8;

	while ((dp22_opt.text_x != tmp) || (dp22_opt.text_y != dp1C) || ((dp22_opt.page != dp24.menu_page) && (dp22_opt.page != 0))) {
		++dp02;
		dp22_opt = &MenuOptions[dp22_opt.next]; // field02
	}

	UnknownC43CD2(dp04, dp04.text_x, dp04.text_y);
	UnknownC10D60(0x2F); // Remove cursor from window?

	dp20 = dp02;
	dp04 = dp22_opt;
	goto label1; // Aaaand back to the start....
}

/// $C11F5A
void UnknownC11F5A(void function(short) arg1) {
	WindowStats[WindowTable[CurrentFocusWindow]].menu_callback = arg1;
}

/// $C11F8A
void UnknownC11F8A() {
	WindowStats[WindowTable[CurrentFocusWindow]].menu_callback = null;
}

/// $C11FBC
short UnknownC11FBC(short arg1, short arg2) {
	if (arg1 == 0) {
		return Unknown7EAD5A[arg2];
	} else {
		return Unknown7EAD6A[arg2];
	}
}

/// $C11FD4
short UnknownC11FD4(short arg1, short arg2, short arg3) {
	if ((arg1 == 1) && (BattleActionTable[arg3].type == 1) && (UnknownC2FAD2(arg2) == 0)) {
		return 0;
	}
	return 1;
}

/// $C12012
short UnknownC12012(short arg1, short arg2, short arg3) {
	short x0E;
	ubyte* x04;
	if (arg1 == 0) {
		x0E = Unknown7EAD58;
		x04 = &Unknown7EAD5A[0];
	} else {
		x0E = Unknown7EAD56;
		x04 = &Unknown7EAD6A[0];
	}
	for (short i = 0; i < x0E; i++) {
		if ((x04++)[0] > arg2) {
			if (UnknownC11FD4(arg1, i, arg3) != 0) {
				return i;
			}
		}
	}
	return -1;
}

/// $C12070
short UnknownC12070(short arg1, short arg2, short arg3) {
	ubyte* x04;
	short x;
	if (arg1 == 0) {
		x = Unknown7EAD56;
		x04 = &Unknown7EAD5A[x - 1];
	} else {
		x = Unknown7EAD58;
		x04 = &Unknown7EAD6A[x - 1];
	}
	for (short i = cast(short)(x - 1); i + 1 != 0; i--) {
		if ((x04--)[0] < arg2) {
			if (UnknownC11FD4(arg1, i, arg3) != 0) {
				return i;
			}
		}
	}
	return -1;
}

/// $C120D6
void UnknownC120D6(short arg1, short arg2) {
	SetInstantPrinting();
	CreateWindowN(Window.Unknown31);
	PrintString(BattleToText.length, &BattleToText[0]);
	if (arg2 != -1) {
		UnknownC23E8A(cast(short)(arg1 * Unknown7EAD56 + arg2 + 1));
		UnknownC3E75D(0);
		PrintString(0xFF, ReturnBattleAttackerAddress());
		ubyte* x12 = (arg1 != 0) ? &BattlersTable[Unknown7EAD82[arg2]].afflictions[0] : &BattlersTable[Unknown7EAD7A[arg2]].afflictions[0];
		UnknownC438A5(0x11, 0);
		UnknownC43F77(UnknownC223D9(x12, 0));
	} else {
		PrintString(13, (arg1 != 0) ? &BattleBackRowText[0] : &BattleFrontRowText[0]);
	}
	ClearInstantPrinting();
}

/// $C121B8
short UnknownC121B8(short arg1, short arg2) {
	short x0E;
	short x18 = 0;
	short x16 = 0;
	short x04 = (Unknown7EAD56 != 0) ? 0 : 1;
	if (CurrentGiygasPhase != 0) {
		x04 = 1;
	}
	outer: while (true) {
		short x12;
		short x10;
		short x14 = UnknownC11FBC(x04, x16);
		EnemyFlashingOn(x04, x16);
		if (x18 == 0) {
			UnknownC120D6(x04, x16);
		}
		x18++;
		WindowTick();
		Unknown4:
		UnknownC12E42();
		if ((((pad_press[0] & PAD_UP) == 0) || (x04 != 0) || (Unknown7EAD58 == 0)) && (((pad_press[0] & PAD_DOWN) == 0) || (x04 != 1) || (Unknown7EAD56 == 0))) {
			x12 = Sfx.Cursor2;
			if ((pad_press[0] & PAD_LEFT) != 0) {
				x10 = UnknownC12070(x04, x14, arg2);
				if (x10 == -1) {
					x10 = UnknownC12070(x04 ^ 1, x14, arg2);
					if (x10 == -1) {
						continue;
					}
				}
			} else if ((pad_press[0] & PAD_RIGHT) != 0) {
				x10 = UnknownC12012(x04, x14, arg2);
				if (x10 == -1) {
					x10 = UnknownC12012(x04 ^ 1, x14, arg2);
					if (x10 == -1) {
						continue;
					}
				}
			} else if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
				EnemyFlashingOff();
				x0E = cast(short)(x04 * Unknown7EAD56 + x16 + 1);
				PlaySfx(Sfx.Cursor1);
				break;
			} else if (((pad_press[0] & (PAD_B | PAD_SELECT)) != 0) && (arg1 == 1)) {
				EnemyFlashingOff();
				x0E = 0;
				PlaySfx(Sfx.Cursor2);
				break;
			} else {
				continue;
			}
		} else {
			x12 = Sfx.Cursor3;
			x10 = UnknownC12012(x04 ^ 1, cast(short)(x14 - 1), arg2);
			if (x10 == -1) {
				x10 = UnknownC12070(x04 ^ 1, x14, arg2);
				if (x10 == -1) {
					continue;
				}
			}
		}
		x18 = 0;
		ClearInstantPrinting();
		CreateWindowN(Window.Unknown31);
		WindowTick();
		SetInstantPrinting();
		x16 = x10;
		PlaySfx(x12);
	}
	CloseFocusWindowN();
	return x0E;
}

/// $C12362
short UnknownC12362(short arg1) {
	short x12 = (Unknown7EAD56 != 0) ? 0 : 1;
	short x10;
	short x0E;
	outer: while (true) {
		UnknownC43657(x12);
		ClearInstantPrinting();
		UnknownC120D6(x12, -1);
		WindowTick();
		while (true) {
			UnknownC12E42();
			if ((pad_press[0] & PAD_UP) != 0) {
				x10 = 1;
				x0E = Sfx.Cursor3;
			} else if ((pad_press[0] & PAD_DOWN) != 0) {
				x10 = 0;
				x0E = Sfx.Cursor3;
			} else if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
				UnknownC435E4();
				x10 = cast(short)(x12 + 1);
				PlaySfx(Sfx.Cursor1);
				break outer;
			} else if (((pad_press[0] & (PAD_B | PAD_SELECT)) != 0) && (arg1 == 1)) {
				UnknownC435E4();
				x10 = 0;
				PlaySfx(Sfx.Cursor2);
				break outer;
			} else {
				continue;
			}
			if (((x10 != 0) || (Unknown7EAD56 == 0)) && ((x10 != 0) || (Unknown7EAD58 != 0))) {
				PlaySfx(x0E);
				x12 = x10;
			}
		}
	}
	CloseFocusWindowN();
	return x10;
}

/// $C1242E
short UnknownC1242E(short arg1, short arg2, short arg3) {
	if (arg1 != 0) {
		return UnknownC12362(arg2);
	} else {
		return UnknownC121B8(arg2, arg3);
	}
}

/// $C1244C
short UnknownC1244C(ubyte** arg1, short arg2, short arg3) {
	short x16;
	WinStat* x22 = GetActiveWindowAddress();
	uint x1E = x22.argument;
	if (arg2 == 1) {
		UnknownC20A20(&Unknown7E9C8A);
		short x1C = gameState.playerControlledPartyMemberCount == 1 ? Window.Unknown33 : cast(short)(gameState.playerControlledPartyMemberCount + Window.Unknown28 - 1);
		CreateWindowN(x1C);
		for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
			memcpy(&Unknown7E9C9F[0], GetPartyCharacterName(gameState.partyMembers[i]), 6);
			Unknown7E9C9F[PartyCharacter.name.length] = 0;
			UnknownC1153B(gameState.partyMembers[i], cast(short)(i * 6), 0, &Unknown7E9C9F[0], arg1[i]);
		}
		PrintMenuItems();
		x16 = SelectionMenu(arg3);
		CloseWindow(x1C);
		UnknownC20ABC(&Unknown7E9C8A);
	} else {
		for (short i = 0; i != 4; i++) {
			Unknown7E9631[i] = arg1[i];
		}
		short x04 = (BattleMenuCurrentCharacterID == -1) ? 0 : BattleMenuCurrentCharacterID;
		const(ubyte)* x06 = Unknown7E9631[gameState.partyMembers[x04] - 1];
		if (x06 != null) {
			DisplayText(x06);
		}
		Unknown7E5E7C = 0;
		short x1C = 10;
		while (true) {
			if (arg2 == 0) {
				UnknownC43573(x04);
			}
			ClearInstantPrinting();
			WindowTick();
			WinStat* x1A;
			if ((Unknown7E5E7A != -1) && (WindowTable[Unknown7E5E7A] != -1)) {
				x1A = &WindowStats[WindowTable[Unknown7E5E7A]];
			}
			short y;
			l2: while (true) {
				if ((Unknown7E5E7A != -1) && (WindowTable[Unknown7E5E7A] != -1)) {
					CopyToVram(0, 8, cast(ushort)((x1A.y * 32) + x1A.x + x1A.width - 3 + 0x7C00), cast(ubyte*)&UnknownC3E41CPointerTable[Unknown7E5E7C]);
				}
				for (x16 = 0; x16 < x1C; x16++) {
					UnknownC12E42();
					if ((pad_press[0] & PAD_LEFT) != 0) {
						x16 = cast(short)(x04 - 1);
						y = (arg2 != 0) ? Sfx.Cursor2 : Sfx.MenuOpenClose;
						Unknown7E5E7C = 2;
						break l2;
					} else if ((pad_press[0] & PAD_RIGHT) != 0) {
						x16 = cast(short)(x04 + 1);
						y = (arg2 != 0) ? Sfx.Cursor2 : Sfx.MenuOpenClose;
						Unknown7E5E7C = 3;
						break l2;
					} else if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
						x16 = gameState.partyMembers[x04];
						PlaySfx(Sfx.Cursor1);
						goto Unknown42;
					} else if (((pad_press[0] & (PAD_B | PAD_SELECT)) != 0) && (arg3 == 1)) {
						x16 = 0;
						PlaySfx((arg2 != 0) ? Sfx.Cursor2 : Sfx.MenuOpenClose);
						UnknownC3E6F8();
						goto Unknown42;
					}
				}
				Unknown7E5E7C = (Unknown7E5E7C == 0) ? 1 : 0;
				x1C = 10;
			}
			if (gameState.playerControlledPartyMemberCount > x16) {
				x16 = 0;
			}
			if (0 <= x16) {
				x16 = gameState.playerControlledPartyMemberCount - 1;
			}
			if (x16 != x04) {
				PlaySfx(y);
				if (Unknown7E9631[gameState.partyMembers[x16] - 1] != null) {
					DisplayText(Unknown7E9631[gameState.partyMembers[x16] - 1]);
				}
			}
			x1C = 4;
		}
	}
	Unknown42:
	Unknown7E5E7C = -1;
	x22.argument = x1E;
	return x16;
}

/// $C127EF
short CharSelectPrompt(short arg1, short arg2, void function(short) arg3, short function(short) arg4) {
	short x1E;
	WinStat* x26 = GetActiveWindowAddress();
	uint x22 = x26.argument;
	if (arg1 == 0) {
		UnknownC20A20(&Unknown7E9C8A);
		short x20 = (gameState.playerControlledPartyMemberCount == 1) ? Window.Unknown33 : cast(short)(Window.Unknown28 + gameState.playerControlledPartyMemberCount);
		CreateWindowN(x20);
		for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
			memcpy(&Unknown7E9C9F[0], GetPartyCharacterName(gameState.partyMembers[i]), 6);
			Unknown7E9C9F[PartyCharacter.name.length] = 0;
			UnknownC1153B(gameState.partyMembers[i], cast(short)(i * 6), 0, &Unknown7E9C9F[0], null);
		}
		PrintMenuItems();
		x1E = SelectionMenu(arg2);
		CloseWindow(x20);
		UnknownC20ABC(&Unknown7E9C8A);
	} else {
		short x04 = (BattleMenuCurrentCharacterID == -1) ? 0 : BattleMenuCurrentCharacterID;
		if (arg3 != null) {
			arg3(gameState.partyMembers[x04]);
		}
		Unknown7E5E7C = 0;
		short x20 = 10;
		while (true) {
			if (arg2 == 0) {
				UnknownC43573(x04);
			}
			ClearInstantPrinting();
			WindowTick();
			short x1A = x04;
			WinStat* x18;
			if ((Unknown7E5E7A != -1) && (WindowTable[Unknown7E5E7A] != -1)) {
				x18 = &WindowStats[WindowTable[Unknown7E5E7A]];
			}
			short x16;
			l2: while (true) {
				if ((Unknown7E5E7A != -1) && (WindowTable[Unknown7E5E7A] != -1)) {
					CopyToVram(0, 8, cast(ushort)((x18.y * 32) + x18.x + x18.width - 3 + 0x7C00), cast(ubyte*)&UnknownC3E41CPointerTable[Unknown7E5E7C]);
				}
				for (x1E = 0; x1E < x20; x1E++) {
					UnknownC12E42();
					if ((pad_press[0] & PAD_LEFT) != 0) {
						x1A--;
						x16 = (arg1 != 0) ? Sfx.Cursor2 : Sfx.MenuOpenClose;
						Unknown7E5E7C = 2;
						break l2;
					} else if ((pad_press[0] & PAD_RIGHT) != 0) {
						x1A++;
						x16 = (arg1 != 0) ? Sfx.Cursor2 : Sfx.MenuOpenClose;
						Unknown7E5E7C = 3;
						break l2;
					} else if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
						x1E = gameState.partyMembers[x1A];
						PlaySfx(Sfx.Cursor1);
						goto Unknown44;
					} else if (((pad_press[0] & (PAD_B | PAD_SELECT)) != 0) && (arg2 == 1)) {
						x1E = 0;
						PlaySfx((arg1 != 0) ? Sfx.Cursor2 : Sfx.MenuOpenClose);
						UnknownC3E6F8();
						goto Unknown44;
					}
				}
				Unknown7E5E7C = (Unknown7E5E7C == 0) ? 1 : 0;
				x20 = 10;
			}
			x20 = cast(short)(x1A - x04);
			Unknown33:
			x1E = gameState.playerControlledPartyMemberCount;
			if (x1E > x1A) {
				x1A = 0;
			} else if (0 <= x1A) {
				x1A = cast(short)(x1E - 1);
			}
			if (arg4 != null) {
				if (arg4(gameState.partyMembers[x1A]) == 0) {
					x1A -= x20;
					goto Unknown33;
				}
			}
			if (x1A != x04) {
				PlaySfx(x16);
				if (arg3 != null) {
					arg3(gameState.partyMembers[x04]);
				}
			}
			x20 = 4;
		}
	}
	Unknown44:
	Unknown7E5E7C = -1;
	x26.argument = x22;
	return x1E;
}

/// $C12BD5
short UnknownC12BD5(short arg1) {
	return UnknownC1138D(WindowStats[WindowTable[arg1 == 0 ? CurrentFocusWindow : arg1]].current_option);
}

/// $C12BF3
void UnknownC12BF3() {
	Win_SetTextColor(3);
	const(ushort)* x06 = &UnknownC3E84E[0];
	while (x06[0] != 0) {
		UnknownC10D60(*(x06++));
		for (short i = 1; i-- != 0;) {
			WindowTick();
		}
	}
	Win_SetTextColor(0);
}

/// $C12C36
void UnknownC12C36() {
	Win_SetTextColor(3);
	const(ushort)* x06 = &UnknownC3E862[0];
	for (short i = 0; i < 4; i++) {
		UnknownC10D60(*(x06++));
		for (short j = 1; j-- != 0;) {
			WindowTick();
		}
	}
	for (short i = 8; i-- != 0;) {
		UnknownC12E42();
	}
	for (short i = 0; i < 5; i++) {
		UnknownC10D60(*(x06++));
		for (short j = 1; j-- != 0;) {
			WindowTick();
		}
	}
	Win_SetTextColor(0);
}

/// $C12D17
void UnknownC12D17(short arg1) {
	if ((Unknown7E9698 == 0) && (arg1 != 0)) {
		for (short i = 0; 4 > i; i++) {
			Unknown7E969A[i] = PartyCharacters[i].hp.target;
			PartyCharacters[i].hp.target = 999;
			PartyCharacters[i].hp.current.integer = 999;
			Unknown7E96A2[i] = PartyCharacters[i].pp.target;
			PartyCharacters[i].pp.target = 0;
			PartyCharacters[i].pp.current.integer = 0;
		}
	} else {
		if ((Unknown7E9698 != 0) && (arg1 == 0)) {
			for (short i = 0; 4 > i; i++) {
				PartyCharacters[i].hp.target = Unknown7E969A[i];
				PartyCharacters[i].pp.target = Unknown7E96A2[i];
			}
		}
	}
	Unknown7E9698 = arg1;
	ResumeMusic();
}

/// $C12DD5 - Tick windows (draw windows if necessary, roll HP/PP, advance RNG, wait a frame)
void WindowTick() {
	rand();
	if (Unknown7E968C != 0) {
		Unknown7E968C = 0;
		return;
	}
	if (InstantPrinting != 0) {
		return;
	}
	if (Unknown7E9623 == 0) {
		if (window_head != 0xFFFF) {
			UnknownC107AF(window_tail);
		}
	} else {
		UnknownC2087C();
		Unknown7E9623 = 0;
	}
	HPPPRoller();
	Unknown7E9624 = 1;
	UnknownC213AC();
	if (Unknown7EB4B6 == 0) {
		if (UnknownC1FF2C() != 0) {
			UnknownC47F87();
		}
	}
	Unknown7E9649 = 0;
	UnknownC2038B();
	UnknownC1004E();
}

/// $C12E42 - Looks like a "minimal" window tick function, doesn't advance RNG
void UnknownC12E42() {
	HPPPRoller();
	if (Unknown7E9649 != 0) {
		UnknownC1078D();
		Unknown7E9649 = 0;
		Unknown7E9624 = 1;
	}
	UnknownC213AC();
	UnknownC1004E();
}

/// $C12E63
void DebugYButtonMenu() {
	UnknownC0943C();
	PlaySfx(Sfx.Cursor1);
	ShowHPPPWindows();
	const(ubyte)* x1A = null;
	loop: while (x1A is null) {
		CreateWindowN(Window.PhoneMenu);
		for (short i = 0; DebugMenuText[i][0] != 0; i++) {
			UnknownC113D1(&DebugMenuText[i][0], null);
		}
		UnknownC1180D(1, 0, 0);
		switch (SelectionMenu(1)) {
			case 1:
				DebugYButtonFlag();
				break;
			case 2:
				DebugYButtonGoods();
				break;
			case 3:
				SaveCurrentGame();
				RespawnX = gameState.leaderX.integer;
				RespawnY = gameState.leaderY.integer;
				break;
			case 4:
				x1A = TextDebugAppleMenu.ptr;
				break;
			case 5:
				x1A = TextDebugBananaMenu.ptr;
				break;
			case 6:
				x1A = TextDebugUnknownMenu.ptr;
				break;
			case 7:
				x1A = TextDebugUnknownMenu2.ptr;
				break;
			case 8:
				for (short i = 0; i < 30; i++) {
					UndrawHPPPWindow(0);
					UnknownC12E42();
					UnknownC12E42();
					UnknownC207B6(0);
					UnknownC12E42();
					UnknownC12E42();
				}
				FadeOut(1, 1);
				LoadMapAtPosition(7696, 2280);
				UnknownC03FA9(7696, 2280, 0);
				FadeIn(1, 1);
				break;
			case 9:
				CoffeeTeaScene(rand()&1);
				break;
			case 10:
				LearnSpecialPSI(1);
				break;
			case 11:
				LearnSpecialPSI(2);
				break;
			case 12:
				LearnSpecialPSI(3);
				LearnSpecialPSI(4);
				break;
			case 13:
				EnterYourNamePlease(0);
				break;
			case 14:
				EnterYourNamePlease(1);
				break;
			case 15:
				UnknownC4D744();
				break;
			case 16:
				DebugYButtonGuide();
				break;
			case 17:
				UnknownC4ED0E();
				Teleport(1);
				break;
			case 18:
				UseSoundStone(1);
				break;
			case 19:
				PlayCredits();
				Teleport(1);
				break;
			case 20:
				UnknownC12D17(Unknown7E9698 == 0 ? 1 : 0);
				break;
			case 21:
				UnknownEFEA4A();
				goto Unknown56;
			case 22:
				x1A = TextBattleGiygasPrayer91.ptr;
				break;
			case 23:
				x1A = TextEndOfGamePickyEvent.ptr;
				UnknownC1008E();
				HideHPPPWindows();
				DisplayText(x1A);
				goto Unknown56;
			default:
				UnknownEFEA9E();
				goto Unknown56;
		}
	}
	CloseFocusWindow();
	CreateWindowN(Window.TextStandard);
	DisplayText(x1A);
	Unknown56:
	UnknownC1008E();
	HideHPPPWindows();
	do {
		WindowTick();
	} while (Unknown7EB4A8 != -1);
	UnknownC09451();
}

/// $C13187
const(ubyte)* TalkTo() {
	const(ubyte)* x0A = null;
	CreateWindowN(Window.TextStandard);
	FindNearbyTalkableTPTEntry();
	if (CurrentTPTEntry == 0) {
		return null;
	}
	if (CurrentTPTEntry == -1) {
		return null;
	}
	if (CurrentTPTEntry == -2) {
		x0A = Unknown7E5DDE;
	} else {
		switch (NPCConfig[CurrentTPTEntry].type) {
			case NPCType.Person:
				UnknownC042C2(Unknown7E5D64);
				x0A = &NPCConfig[CurrentTPTEntry].talkText[0];
				break;
			case NPCType.ItemBox:
			case NPCType.Object:
			default: break;
		}
	}
	return x0A;
}

/// $C1323B
const(ubyte)* Check() {
	CreateWindowN(Window.TextStandard);
	FindNearbyCheckableTPTEntry();
	if (CurrentTPTEntry == 0) {
		return null;
	}
	if (CurrentTPTEntry == -1) {
		return null;
	}
	if (CurrentTPTEntry == -2) {
		return Unknown7E5DDE;
	}
	switch (NPCConfig[CurrentTPTEntry].type) {
		case NPCType.Person:
			return null;
		case NPCType.ItemBox:
			if (NPCConfig[CurrentTPTEntry].item < 0x100) {
				SetWorkingMemory(WorkingMemory(NPCConfig[CurrentTPTEntry].item));
			} else {
				SetWorkingMemory(WorkingMemory(0));
				SetArgumentMemory(NPCConfig[CurrentTPTEntry].item - 0x100);
			}
			CurrentInteractingEventFlag = NPCConfig[CurrentTPTEntry].eventFlag;
			return &NPCConfig[CurrentTPTEntry].talkText[0];
		case NPCType.Object:
			return &NPCConfig[CurrentTPTEntry].talkText[0];
		default: break;
	}
	return null;
}

/// $C1339E
void UnknownC1339E(short arg1) {
	return InventoryGetItemName(arg1, Window.Inventory);
}

/// $C133A7
void UnknownC133A7(short arg1) {
	return InventoryGetItemName(arg1, Window.Unknown2c);
}

/// $C133B0
void UnknownC133B0() {
	if (Unknown7E5E6C == -1) {
		for (short i = 1; i < 7; i++) {
			if ((i == 3) && (UnknownC1C373() == 0)) {
				continue;
			}
			short y = ((i == 1) || (i == 5) || ((i == 2) && (gameState.playerControlledPartyMemberCount == 1) && (GetCharacterItem(gameState.partyMembers[0], 1) == 0))) ? Sfx.Cursor1 : Sfx.MenuOpenClose;
			UnknownC11596(i, DebugMenuElementSpacingData[i - 1].unknown0, DebugMenuElementSpacingData[i - 1].unknown1, &CommandWindowText[i - 1][0], null, cast(ubyte)y);
		}
	}
	Unknown7E5E6C = 0;
	PrintMenuItems();
}

/// $C134A7
void OpenMenuButton() {
	UnknownC0943C();
	PlaySfx(Sfx.Cursor1);
	CreateWindowN(Window.unknown00);
	Unknown7E5E6C = 0;
	UnknownC133B0();
	Unknown7E5E79 = 0;
	mainLoop: while (true) {
		SetWindowFocus(0);
		uint x06 = SelectionMenu(1);
		switch (cast(short)x06) {
			case MainMenuOptions.TalkTo:
				const(ubyte)* textPtr = TalkTo();
				if (textPtr == null) {
					textPtr = TextWhoAreYouTalkingTo.ptr;
				}
				DisplayText(textPtr);
				break mainLoop;
			case MainMenuOptions.Goods:
				OpenHpAndWallet();
				L2: while (true) {
					uint x1F;
					if (gameState.playerControlledPartyMemberCount == 1) {
						if (GetCharacterItem(gameState.partyMembers[0], 1) == 0) {
							continue mainLoop;
						}
						InventoryGetItemName(gameState.partyMembers[0], 2);
						x1F = gameState.partyMembers[0];
						UnknownC43573(0);
					} else {
						UnknownC193E7(0);
						x1F = CharSelectPrompt(0, 1, &UnknownC1339E, null);
					}
					if (x1F == 0) {
						CloseWindow(Window.Inventory);
						UnknownC19437();
						continue mainLoop;
					}
					if (GetCharacterItem(cast(short)x1F, 1) == 0) {
						continue;
					}
					while (true) {
						UnknownC193E7(1);
						SetWindowFocus(Window.Inventory);
						short x1D = SelectionMenu(1);
						UnknownEF016F();
						UnknownC19437();
						if (x1D == 0) {
							if (gameState.playerControlledPartyMemberCount != 1) {
								continue L2;
							}
							if (GetCharacterItem(gameState.partyMembers[0], 1) != 0) {
								PlaySfx(Sfx.MenuOpenClose);
								UnknownC3E6F8();
							}
							CloseWindow(Window.Inventory);
							continue mainLoop;
						}
						CreateWindowN(Window.InventoryMenu);
						short x23 = ((PartyCharacters[x1F].afflictions[0] != 0) && (Status0.Nauseous > PartyCharacters[x1F].afflictions[0])) ? 1 : 0;
						UnknownC438A5(0, x23);
						while (x23 < 4) {
							short x1B = cast(short)(x23 + 1);
							UnknownC115F4(x1B, &ItemUseMenuStrings[x23][0], null);
							x23 = x1B;
						}
						UnknownC451FA(1, 0, 0);
						short x02 = 0;
						short x1A;
						L4: while (true) {
							if (x02 != 0) {
								SetWindowFocus(Window.Inventory);
								if (cast(ubyte)x1A != 0) {
									PrintMenuItems();
								}
							} else {
								SetWindowFocus(Window.InventoryMenu);
								PrintMenuItems();
							}
							SetWindowFocus(Window.InventoryMenu);
							switch (SelectionMenu(1)) {
								case 0: //didn't choose anything
									CloseFocusWindow();
									SetWindowFocus(Window.Inventory);
									break L4;
								case 1: //use
									x02 = 1;
									if (OverworldUseItem(cast(short)x1F, x1D, 0) != 0) {
										break mainLoop;
									}
									x1A = 0;
									continue;
								case 4: //help
									UnknownC10F40(0);
									UnknownC10F40(2);
									Unknown7E5E79 = 0xFF;
									CreateWindowN(Window.TextStandard);
									DisplayText(&ItemData[GetCharacterItem(cast(short)x1F, x1D)].helpText[0]);
									CloseWindow(Window.TextStandard);
									SetWindowFocus(0);
									Unknown7E5E6C = 1;
									UnknownC133B0();
									InventoryGetItemName(cast(short)x1F, 2);
									CloseWindow(Window.InventoryMenu);
									SetWindowFocus(Window.Inventory);
									break L4;
								case 2: //give
									SetWindowFocus(Window.Inventory);
									ClearFocusWindow();
									x02 = 1;
									UnknownC193E7(3);
									short x18 = CharSelectPrompt(2, 1, &UnknownC133A7, null);
									UnknownC19437();
									CloseWindow(Window.Unknown2c);
									if (x18 == 0) {
										x1A = 1;
										continue;
									}
									if ((x1F != x18) && ((ItemData[GetCharacterItem(cast(short)x1F, x1D)].flags & ItemFlags.CannotGive) != 0)) {
										CreateWindowN(Window.TextStandard);
										SetWorkingMemory(WorkingMemory(x1F));
										SetArgumentMemory(x1D);
										DisplayText(TextOnlyOneWhoShouldCarryThis.ptr);
										CloseWindow(Window.TextStandard);
										x1A = 0;
										continue;
									}
									short x16 = 0;
									if ((PartyCharacters[x1F - 1].afflictions[0] == Status0.Unconscious) || (PartyCharacters[x1F - 1].afflictions[0] == Status0.Diamondized)) {
										x16 = 5;
									}
									if (x18 != x1F) {
										x16++;
										if (FindInventorySpace2(x18) != 0) {
											x16 += 2;
										}
										if ((PartyCharacters[x18 - 1].afflictions[0] == Status0.Unconscious) || (PartyCharacters[x18 - 1].afflictions[0] == Status0.Diamondized)) {
											x16++;
										}
									}
									CreateWindowN(Window.TextStandard);
									GetActiveWindowAddress().result.integer = x1F;
									GetActiveWindowAddress().result_bak.integer = x18;
									GetActiveWindowAddress().argument = x1D;
									switch (x16) {
										case 0: //give to self, alive
											DisplayText(TextRearrangedOwnItems.ptr);
											UnknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 1: //give to other, alive, inventory full
											DisplayText(TextCouldntGiveAliveInventoryFull.ptr);
											break;
										case 2: //give to other, dead, inventory full
											DisplayText(TextCouldntGiveDeadInventoryFull.ptr);
											break;
										case 3: //give to other, alive
											DisplayText(TextGaveItemAlive.ptr);
											UnknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 4: //give to other, dead
											DisplayText(TextGaveItemDead.ptr);
											UnknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 5: //give to self, dead
											DisplayText(TextRearrangedOwnItemsDead.ptr);
											UnknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 6: //give to other, self dead, other alive, inventory full
											DisplayText(TextCouldntTakeFromCharInventoryFull.ptr);
											break;
										case 7: //give to other, self dead, other dead, inventory full
											DisplayText(TextCouldntGiveToCharInventoryFull.ptr);
											break;
										case 8: //give to other, self dead, other alive
											DisplayText(TextTookItemFromDead.ptr);
											UnknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 9: //give to other, self dead, other dead
											DisplayText(TextTookItemFromDeadGaveToDead.ptr);
											UnknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										default: //invalid
											while (true) {}
									}
									CloseWindow(Window.TextStandard);
									CloseWindow(Window.InventoryMenu);
									CloseWindow(Window.Inventory);
									continue mainLoop;
								case 3: //drop
									CreateWindowN(Window.TextStandard);
									SetWorkingMemory(WorkingMemory(x1F));
									SetArgumentMemory(x1D);
									DisplayText(TextGotRidOfOwnItem.ptr);
									CloseWindow(Window.TextStandard);
									CloseWindow(Window.InventoryMenu);
									CloseWindow(Window.Inventory);
									continue mainLoop;
								default:
									break mainLoop;
							}
						}
					}
				}
				break;
			case MainMenuOptions.PSI:
				OpenHpAndWallet();
				uint x06_2 = UnknownC1C373();
				if (x06_2 != 0) {
					UnknownC43573(cast(short)(cast(short)(x06_2) - 1));
				}
				if (UnknownC1B5B6() != 0) {
					break mainLoop;
				}
				if (UnknownC1C3B6() == 1) {
					PlaySfx(Sfx.MenuOpenClose);
					UnknownC3E6F8();
				}
				break;
			case MainMenuOptions.Equip:
				OpenHpAndWallet();
				UnknownC1AA5D();
				if (gameState.playerControlledPartyMemberCount == 1) {
					PlaySfx(Sfx.MenuOpenClose);
					UnknownC3E6F8();
				}
				break;
			case MainMenuOptions.Check:
				const(ubyte)* textPtr = Check();
				if (textPtr == null) {
					textPtr = TextNoProblemHere.ptr;
				}
				DisplayText(textPtr);
				break mainLoop;
			case MainMenuOptions.Status:
				OpenHpAndWallet();
				Unknown7E5E71 = 1;
				UnknownC1BB71();
				Unknown7E5E71 = 0;
				break;
			default: break mainLoop;
		}
	}
	ClearInstantPrinting();
	HideHPPPWindows();
	UnknownC1008E();
	do {
		WindowTick();
	} while (Unknown7EB4A8 != -1);
	UnknownC09451();
}

/// $C13---
void OpenMenuButtonCheckTalk() {
	UnknownC0943C();
	PlaySfx(Sfx.Cursor1);
	const(ubyte)* textPtr;
	textPtr = TalkTo();
	if (textPtr is null) {
		textPtr = Check();
		if (textPtr is null) {
			textPtr = TextNoProblemHere.ptr;
		}
	}
	DisplayText(textPtr);
	ClearInstantPrinting();
	HideHPPPWindows();
	UnknownC1008E();
	do {
		WindowTick();
	} while (Unknown7EB4A8 != -1);
	UnknownC09451();
}

/// $C13CA1
void OpenHPPPDisplay() {
	UnknownC0943C();
	PlaySfx(Sfx.Cursor1);
	OpenHpAndWallet();
	do {
		WindowTick();
		if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
			OpenMenuButton();
			return;
		}
	} while ((pad_press[0] & (PAD_B | PAD_SELECT)) != 0);
	PlaySfx(Sfx.Cursor2);
	ClearInstantPrinting();
	HideHPPPWindows();
	UnknownC1008E();
	WindowTick();
	UnknownC09451();
}

/// $C13CE5
void ShowTownMap() {
	if (FindItemInInventory(0xFF, ItemID.TOWN_MAP) == 0) {
		return;
	}
	UnknownC0943C();
	DisplayTownMap();
	UnknownC09451();
}

/// $C13D03
void DebugYButtonFlag() {
	short x02 = EventFlag.UNKNOWN_DEBUG_001;
	while (true) {
		SetInstantPrinting();
		CreateWindowN(Window.FileSelectMenu);
		UnknownC10EB4(3);
		PrintNumber(x02);
		UnknownC43F77(0x20);
		UnknownC43CAA();
		PrintString(0x100, (getEventFlag(x02) != 0) ? &DebugOnText[0] : &DebugOffText[0]);
		ClearInstantPrinting();
		WindowTick();
		short x12 = x02;
		while(true) {
			WaitUntilNextFrame();
			if ((pad_held[0] & PAD_UP) != 0) {
				x12++;
			} else if ((pad_held[0] & PAD_DOWN) != 0) {
				x12--;
			} else if ((pad_held[0] & PAD_RIGHT) != 0) {
				x12 += 10;
			} else if ((pad_held[0] & PAD_LEFT) != 0) {
				x12 -= 10;
			} else if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
				setEventFlag(x02, (getEventFlag(x02) != 0) ? 0 : 1);
			} else if ((pad_press[0] & (PAD_B | PAD_SELECT)) != 0) {
				CloseWindow(Window.FileSelectMenu);
				return;
			}
			if ((x12 < 2000) && (x12 != 0)) {
				x02 = x12;
			}
		}
	}
}

/// $C13E0E
void DebugYButtonGuide() {
	short x14 = 0;
	for (short i = 0; i < MAX_ENTITIES; i++) {
		if (EntityScriptTable[i] != -1) {
			x14++;
		}
	}
	SetInstantPrinting();
	CreateWindowN(Window.FileSelectMenu);
	UnknownC10EB4(3);
	PrintNumber(x14);
	ClearInstantPrinting();
	WindowTick();
	while ((pad_press[0] & (PAD_B | PAD_SELECT)) == 0) {
		WaitUntilNextFrame();
	}
	CloseWindow(Window.FileSelectMenu);
}

/// $C13EE7
void DebugYButtonGoods() {
	short x04 = 0;
	outer: while (true) {
		SetInstantPrinting();
		CreateWindowN(Window.FileSelectMenu);
		UnknownC10EB4(0x02);
		UnknownC10EB4(0x82);
		UnknownC438A5(0, 0);
		PrintNumber(x04);
		UnknownC438A5(3, 0);
		UnknownC19216(x04);
		ClearInstantPrinting();
		WindowTick();
		short x02 = x04;
		while (true) {
			WaitUntilNextFrame();
			if ((pad_held[0] & PAD_UP) != 0) {
				x02++;
			} else if ((pad_held[0] & PAD_DOWN) != 0) {
				x02--;
			} else if ((pad_held[0] & PAD_RIGHT) != 0) {
				x02 += 10;
			} else if ((pad_held[0] & PAD_LEFT) != 0) {
				x02 -= 10;
			} else if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
				short x16 = CharSelectPrompt(1, 1, null, null);
				if ((x16 != 0) && (FindInventorySpace2(x16) != 0)) {
					GiveItemToCharacter(x16, cast(ubyte)x04);
					if (UnknownC3EE14(x16, x04) == 0) {
						break outer;
					}
					if (GetItemType(x04) != 2) {
						break outer;
					}
					EquipItem(x16, UnknownC22351(x16));
				}
			} else if ((pad_press[0] & (PAD_B | PAD_SELECT)) != 0) {
				break outer;
			}
		}
		if (x02 < 0x100) {
			break;
		} else {
			x04 = x02;
		}
	}
	CloseWindow(0x14);
}

/// $C14012
DisplayTextState* UnknownC14012() {
	Unknown7E97B8++;
	if (Unknown7E97B8 > 10) {
		Unknown7E97B8 = 0;
	}
	return &DisplayTextStates[Unknown7E97B8];
}

/// $C14049
void UnknownC14049() {
	Unknown7E97B8--;
	if (Unknown7E97B8 > 10) {
		Unknown7E97B8 = 9;
	}
}

/// $C14070
short UnknownC14070(ubyte* arg1, ubyte* arg2) {
	while (arg1[0] != 0) {
		if (arg1[0] != arg2[0]) {
			break;
		}
		arg1++;
		arg2++;
	}
	return arg2[0] - arg1[0];
}

/// $C140B0
void* CC1C01(DisplayTextState* arg1, ushort arg2) {
	UnknownC19249(arg2 == 0 ? cast(short)GetArgumentMemory() : arg2);
	return null;
}

/// $C140CF
void* CC1C11(DisplayTextState* arg1, ushort arg2) {
	UnknownEF01D2(arg2 == 0 ? cast(short)GetArgumentMemory() : arg2);
	return null;
}

/// $C140EF
void* CC1C09(DisplayTextState* arg1, ushort arg2) {
	UnknownC10EB4(arg2);
	return null;
}

/// $C140F9
void* CC1C00(DisplayTextState* arg1, ushort arg2) {
	Win_SetTextColor(arg2);
	return null;
}

/// $C14103
void* CC0A(DisplayTextState* arg1, ushort arg2) {
	if ((const(ubyte)*).sizeof - 1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC0A;
	}
	//original code is not portable
	//arg1.textptr = cast(const(ubyte)*)((arg2 << 24) | (CCArgumentStorage[2] << 16) | (CCArgumentStorage[1] << 8) | CCArgumentStorage[0]);
	arg1.textptr = cast(const(ubyte)*)
		((cast(size_t)arg2 << (((const(ubyte)*).sizeof - 1) * 8)) |
		(*cast(size_t*)(&CCArgumentStorage[0])) & ~(cast(size_t)0xFF << (((const(ubyte)*).sizeof - 1) * 8)));
	return null;
}

/// $C141D0
void* CC09(DisplayTextState* arg1, ushort arg2) {
	if ((GetWorkingMemory().integer != 0) && (GetWorkingMemory().integer < arg2)) {
		arg1.textptr = cast(const(ubyte)*)&arg1.textptr[(GetWorkingMemory().integer - 1) * (const(ubyte)*).sizeof];
		CCArgumentGatheringLoopCounter = 0;
		return &CC09;
	} else {
		arg1.textptr = cast(const(ubyte)*)&arg1.textptr[arg2 * (const(ubyte)*).sizeof];
		return null;
	}
}

/// $C14265
void* CC04(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC04;
	} else {
		setEventFlag(cast(short)(arg2 << 8) | (CCArgumentStorage[0]), 1);
		return null;
	}
}

/// $C142AD - [05 XX XX] clear flag
void* CC05(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC05;
	} else {
		setEventFlag(cast(short)(arg2 << 8) | (CCArgumentStorage[0]), 0);
		return null;
	}
}

/// $C142F5 - [06 XX XX ptr] - jump if flag set
void* CC06(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC06;
	} else if (getEventFlag(cast(short)(arg2 << 8) | (CCArgumentStorage[0])) != 0) {
		CCArgumentGatheringLoopCounter = 0;
		return &CC0A;
	} else {
		arg1.textptr += (const(ubyte)*).sizeof;
		return null;
	}
}

/// $C1435F - [07 XX XX] get event flag
void* CC07(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC07;
	} else {
		SetWorkingMemory(WorkingMemory(getEventFlag(cast(short)(arg2 << 8) | (CCArgumentStorage[0]))));
		return null;
	}
}

/// $C143B8
void* CC1C08(DisplayTextState* arg1, ushort arg2) {
	UnknownC10EE3(arg2);
	return null;
}

/// $C143C2 - [18 01 XX] open window
void* CC1801(DisplayTextState* arg1, ushort arg2) {
	CreateWindowN(arg2);
	return null;
}

/// $C143CC - [18 03 XX] switch to window
void* CC1803(DisplayTextState* arg1, ushort arg2) {
	SetWindowFocus(arg2);
	return null;
}

/// $C143D6 - [08 ptr] call
void* CC08(DisplayTextState* arg1, ushort arg2) {
	if ((const(ubyte)*).sizeof - 1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC08;
	}
	//original code is not portable
	//DisplayText(cast(const(ubyte)*)((arg2 << 24) | (CCArgumentStorage[2] << 16) | (CCArgumentStorage[1] << 8) | CCArgumentStorage[0]));
	DisplayText(cast(const(ubyte)*)
		((cast(size_t)arg2 << (((const(ubyte)*).sizeof - 1) * 8)) |
		(*cast(size_t*)(&CCArgumentStorage[0])) & ~(cast(size_t)0xFF << (((const(ubyte)*).sizeof - 1) * 8))));
	return null;
}

/// $C144A3
void* CC1F52(DisplayTextState* arg1, ushort arg2) {
	int x06 = NumSelectPrompt(arg2);
	if (x06 == -1) {
		SetWorkingMemory(WorkingMemory(0));
		SetArgumentMemory(0);
	} else {
		SetWorkingMemory(WorkingMemory(x06));
	}
	return null;
}

/// $C14509 - [18 05 XX YY] force text alignment
void* CC1805(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1805;
	}
	if (Unknown7E5E71 != 0) {
		UnknownC43D75(CCArgumentStorage[0], arg2);
	} else {
		UnknownC438A5(CCArgumentStorage[0], arg2);
	}
	return null;
}

/// $C14558
void* CC0B(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(GetWorkingMemory().integer == arg2 ? 1 : 0));
	return null;
}

/// $C14591
void* CC0C(DisplayTextState* arg, ushort arg2) {
	SetWorkingMemory(WorkingMemory(GetWorkingMemory().integer != arg2 ? 1 : 0));
	return null;
}

/// $C145CA
void* CC1C07(DisplayTextState* arg1, ushort arg2) {
	UnknownC1180D(arg2 == 0 ? cast(short)GetArgumentMemory() : arg2, 1, 0);
	return null;
}

/// $C145EF
void* CC0D(DisplayTextState* arg1, ushort arg2) {
	SetArgumentMemory((arg2 != 0) ? GetSecondaryMemory() : GetWorkingMemory().integer);
	return null;
}

/// $C1461A
void* CC0E(DisplayTextState* arg1, ushort arg2) {
	SetSecondaryMemory(arg2 == 0 ? GetArgumentMemory() & 0xFF : arg2);
	return null;
}

/// $C1463B
void* CC1A00(DisplayTextState* arg1, ushort arg2) {
	if ((ubyte*).sizeof * 4 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1A00;
	}
	SetWorkingMemory(WorkingMemory(UnknownC1244C(cast(ubyte**)&CCArgumentStorage[0], arg2, 0)));
	return null;
}

/// $C1467D
void* CC1A01(DisplayTextState* arg1, ushort arg2) {
	if ((ubyte*).sizeof * 4 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1A01;
	}
	SetWorkingMemory(WorkingMemory(UnknownC1244C(cast(ubyte**)&CCArgumentStorage[0], arg2, 1)));
	return null;
}

/// $C146BF
void* CC1C05(DisplayTextState* arg1, ushort arg2) {
	UnknownC19216(arg2 == 0 ? cast(short)GetArgumentMemory() : arg2);
	return null;
}

/// $C146DE
void* CC1C06(DisplayTextState* arg1, ushort arg2) {
	UnknownC447FB(PSITeleportDestination.name.length, &PSITeleportDestinationTable[arg2 == 0 ? cast(short)GetArgumentMemory() : arg2].name[0]);
	return null;
}

/// $C14723
void* CC1910(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(UnknownC190E6(arg2 == 0 ? cast(short)GetArgumentMemory() : arg2)));
	return null;
}

/// $C14751
void* CC1F00(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F00;
	}
	UnknownC216AD(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory(), CCArgumentStorage[0]);
	return null;
}

/// $C147A0
void* CC1F01(DisplayTextState* arg1, ushort arg2) {
	StopMusicF(arg2);
	return null;
}

/// $C147AB
void* CC1F02(DisplayTextState* arg1, ushort arg2) {
	PlaySfxAndUnknown(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	return null;
}

/// $C147CC
void* CC1911(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(GetPartyCharacterName(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory())[cast(short)-cast(int)(1 - GetSecondaryMemory())]));
	return null;
}

/// $C14819
void* CC1928(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory((CC1C01Table[arg2].size < GetSecondaryMemory()) ? 0 : (cast(ubyte*)CC1C01Table[arg2].address)[GetSecondaryMemory() - 1]));
	return null;
}

/// $C1488D
void* CC1C03(DisplayTextState* arg1, ushort arg2) {
	PrintLetter(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	return null;
}

/// $C148AC
void* CC1D02(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory((GetItemType(cast(short)GetArgumentMemory()) == arg2) ? 1 : 0));
	return null;
}

/// $C148E9
void* CC1D08(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D08;
	}
	SetWorkingMemory(WorkingMemory(IncreaseWalletBalance(((arg2 << 8 | CCArgumentStorage[0]) != 0) ? (arg2 << 8 | CCArgumentStorage[0]) : cast(short)GetArgumentMemory())));
	return null;
}

/// $C1494A
void* CC1D09(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D09;
	}
	SetWorkingMemory(WorkingMemory(DecreaseWalletBalance(((arg2 << 8 | CCArgumentStorage[0]) != 0) ? (arg2 << 8 | CCArgumentStorage[0]) : cast(short)GetArgumentMemory())));
	return null;
}

/// $C149B6
void* CC1E00(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E00;
	}
	RecoverHPAmtPercent(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(short)GetArgumentMemory(), arg2, 0);
	return null;
}

/// $C14A03
void* CC1E01(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E01;
	}
	ReduceHPAmtPercent(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(short)GetArgumentMemory(), arg2, 0);
	return null;
}

/// $C14A50
void* CC1E02(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E02;
	}
	RecoverHPAmtPercent(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(short)GetArgumentMemory(), arg2, 1);
	return null;
}

/// $C14A9D
void* CC1E03(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E03;
	}
	ReduceHPAmtPercent(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(short)GetArgumentMemory(), arg2, 1);
	return null;
}

/// $C14AEA
void* CC1E04(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E04;
	}
	RecoverPPAmtPercent(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(short)GetArgumentMemory(), arg2, 0);
	return null;
}

/// $C14B37
void* CC1E05(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E05;
	}
	ReducePPAmtPercent(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(short)GetArgumentMemory(), arg2, 0);
	return null;
}

/// $C14B84
void* CC1E06(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E06;
	}
	RecoverPPAmtPercent(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(short)GetArgumentMemory(), arg2, 1);
	return null;
}

/// $C14BD1
void* CC1E07(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E07;
	}
	ReducePPAmtPercent(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(short)GetArgumentMemory(), arg2, 1);
	return null;
}

/// $C14C1E
void* CC1D00(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D00;
	}
	SetWorkingMemory(WorkingMemory(GiveItemToCharacter((CCArgumentStorage[0] == 0) ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0], cast(ubyte)((arg2 != 0) ? arg2 : cast(short)GetArgumentMemory()))));
	return null;
}

/// $C14C86
void* CC1D01(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D01;
	}
	SetWorkingMemory(WorkingMemory(TakeItemFromCharacter((CCArgumentStorage[0] == 0) ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0], cast(ubyte)((arg2 != 0) ? arg2 : cast(short)GetArgumentMemory()))));
	return null;
}

/// $C14CEE
void* CC1D03(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(FindInventorySpace2(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory())));
	return null;
}

/// $C14D24
void* CC1D04(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D04;
	}
	SetWorkingMemory(WorkingMemory(UnknownC3E9F7((CCArgumentStorage[0] == 0) ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0], cast(ubyte)((arg2 != 0) ? arg2 : cast(short)GetArgumentMemory()))));
	return null;
}

/// $C14D93
void* CC1D05(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D05;
	}
	SetWorkingMemory(WorkingMemory(FindItemInInventory2((CCArgumentStorage[0] == 0) ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0], cast(ubyte)((arg2 != 0) ? arg2 : cast(short)GetArgumentMemory()))));
	return null;
}

/// $C14DFB
void* CC1F20(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F20;
	}
	SetTeleportState(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(ubyte)GetWorkingMemory().integer, cast(TeleportStyle)(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory()));
	return null;
}

/// $C14E8C
void* CC1F21(DisplayTextState* arg1, ushort arg2) {
	Teleport(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	return null;
}

/// $C14EAB
void* CC10(DisplayTextState* arg1, ushort arg2) {
	UnknownC100D6(arg2);
	return null;
}

/// $C14EB5
void* CC1A06(DisplayTextState* arg1, ushort arg2) {
	ClearInstantPrinting();
	CreateWindowN(CurrentFocusWindow);
	WindowTick();
	SetWorkingMemory(WorkingMemory(UnknownC19DB5(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory())));
	SetWindowFocus(CurrentFocusWindow);
	return null;
}

/// $C14EF8
void* CC1D0A(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(ItemData[arg2 != 0 ? arg2 : cast(short)GetArgumentMemory()].cost));
	return null;
}

/// $C14F33
void* CC1D0B(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(ItemData[arg2 != 0 ? arg2 : cast(short)GetArgumentMemory()].cost / 2));
	return null;
}

/// $C14F6F
void* CC1F81(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F81;
	}
	SetWorkingMemory(WorkingMemory(UnknownC3EE14(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(ubyte)GetWorkingMemory().integer, arg2 != 0 ? arg2 : cast(short)GetArgumentMemory())));
	return null;
}

/// $C14FD7
void* CC1C02(DisplayTextState* arg1, ushort arg2) {
	if (arg2 == 0xFF) {
		UnknownC1931B(cast(short)GetActiveWindowAddress().result.integer);
	} else {
		UnknownC1931B(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	}
	return null;
}

/// $C15007
void* CC1916(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1916;
	}
	SetWorkingMemory(WorkingMemory(CheckStatusGroup(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(ubyte)GetWorkingMemory().integer, arg2 != 0 ? arg2 : cast(short)GetArgumentMemory())));
	return null;
}

/// $C1506F
void* CC1905(DisplayTextState* arg1, ushort arg2) {
	if (2 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1905;
	}
	SetWorkingMemory(WorkingMemory(InflictStatusNonBattle(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(ubyte)GetWorkingMemory().integer, CCArgumentStorage[1] != 0 ? CCArgumentStorage[1] : cast(short)GetArgumentMemory(), arg2)));
	return null;
}

/// $C150E4
void* CC1D0D(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D0D;
	}
	SetWorkingMemory(WorkingMemory(CheckStatusGroup(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(ubyte)GetWorkingMemory().integer, CCArgumentStorage[1] != 0 ? CCArgumentStorage[1] : cast(short)GetArgumentMemory()) == arg2 ? 1 : 0));
	return null;
}

/// $C1516B
void* CC1C14(DisplayTextState* arg1, ushort arg2) {
	ushort a;
	if (currentAttacker.allyOrEnemy == 1) {
		if (arg2 != 1) {
			if (EnemiesInBattle > 3) {
				a = 3;
			} else {
				a = EnemiesInBattle;
			}
		} else {
			a = EnemyConfigurationTable[currentAttacker.id].gender;
		}
	} else {
		if (arg2 != 1) {
			short x = UnknownC2272F();
			if (x > 3) {
				a = 3;
			} else {
				a = x;
			}
		} else {
			a = (currentAttacker.id == 2) ? 2 : 1;
		}
	}
	SetWorkingMemory(WorkingMemory(a));
	return null;
}

/// $C151FC
void* CC1C15(DisplayTextState* arg1, ushort arg2) {
	ushort a;
	if (currentTarget.allyOrEnemy == 1) {
		if (arg2 != 1) {
			if (EnemiesInBattle > 3) {
				a = 3;
			} else {
				a = EnemiesInBattle;
			}
		} else {
			a = EnemyConfigurationTable[currentTarget.id].gender;
		}
	} else {
		if (arg2 != 1) {
			short x = UnknownC2272F();
			if (x > 3) {
				a = 3;
			} else {
				a = x;
			}
		} else {
			a = (currentTarget.id == 2) ? 2 : 1;
		}
	}
	SetWorkingMemory(WorkingMemory(a));
	return null;
}

/// $C1528D - [18 07 XX XX XX XX YY]
void* CC1807(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter < 4) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1807;
	}
	uint x0A = (cast(uint)CCArgumentStorage[1] << 8) | (CCArgumentStorage[0]) | (cast(uint)CCArgumentStorage[2] << 16) | (cast(uint)CCArgumentStorage[3] << 24);
	uint x06 = (arg2 == 0) ? GetWorkingMemory().integer : (arg2 == 1) ? GetArgumentMemory() : GetSecondaryMemory;
	short tmp;
	if (x06 < x0A) {
		tmp = 0;
	} else if (x06 == x0A) {
		tmp = 1;
	} else {
		tmp = 2;
	}
	SetWorkingMemory(WorkingMemory(tmp));
	return null;
}

/// $C153AF
void* CC1C0A(DisplayTextState* arg1, ushort arg2) {
	if (3 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1C0A;
	}
	uint x06 = (CCArgumentStorage[0]) | (cast(uint)CCArgumentStorage[1] << 8) | (cast(uint)CCArgumentStorage[2] << 16) | (cast(uint)arg2 << 24);
	PrintNumber(x06 == 0 ? GetArgumentMemory() : x06);
	return null;
}

/// $C15384
void* CC1918(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(GetRequiredEXP(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory())));
	return null;
}

/// $C15494
void* CC1F60(DisplayTextState* arg1, ushort arg2) {
	UnknownC100FE(arg2);
	return null;
}

/// $C1549E
void* CC1A05(DisplayTextState* arg1, ushort arg2) {
	if (1 < CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1A05;
	}
	if (CurrentFocusWindow == 1) {
		UnknownEF0115(1);
		WindowStats[WindowTable[CurrentFocusWindow]].text_y = 0;
		WindowStats[WindowTable[CurrentFocusWindow]].text_x = 0;
		UnknownC20A20(&arg1.savedTextAttributes);
		Unknown7E5E71 = 0;
	}
	InventoryGetItemName(CCArgumentStorage[0], arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	return null;
}

/// $C15529 - [18 08 XX] selection menu, no cancelling
void* CC1808(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(UnknownC19A11(0, arg2)));
	return null;
}

/// $C1554E - [18 09 XX] selection menu
void* CC1809(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(UnknownC19A11(1, arg2)));
	return null;
}

/// $C15573
void* CC1C0B(DisplayTextState* arg1, ushort arg2) {
	if (3 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1C0B;
	}
	uint x06 = (CCArgumentStorage[0]) | (cast(uint)CCArgumentStorage[1] << 8) | (cast(uint)CCArgumentStorage[2] << 16) | (cast(uint)arg2 << 24);
	UnknownC4507A(x06 == 0 ? GetArgumentMemory() : x06);
	return null;
}

/// $C15659
void* CC1D0E(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D0E;
	}
	short x12 = GiveItemToCharacter(CCArgumentStorage[0] == 0 ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0], cast(ubyte)(arg2 != 0 ? arg2 : GetArgumentMemory()));
	SetArgumentMemory(UnknownC22351(x12));
	SetWorkingMemory(WorkingMemory(x12));
	return null;
}

/// $C156DB
void* CC1D0F(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D0F;
	}
	short x02 = CCArgumentStorage[0] == 0 ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0];
	short x12 = cast(ubyte)(arg2 != 0 ? arg2 : GetArgumentMemory());
	SetArgumentMemory(GetCharacterItem(x02, x12));
	SetWorkingMemory(WorkingMemory(RemoveItemFromInventory(x02, x12)));
	return null;
}

/// $C1575D
void* CC1D10(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D10;
	}
	SetWorkingMemory(WorkingMemory(CheckItemEquipped(CCArgumentStorage[0] == 0 ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0], cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()))));
	return null;
}

/// $C157CD
void* CC1D11(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D11;
	}
	short x02 = CCArgumentStorage[0] == 0 ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0];
	SetWorkingMemory(WorkingMemory(UnknownC3EE14(x02, GetCharacterItem(x02, cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory())))));
	return null;
}

/// $C1583D
void* CC1F83(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F83;
	}
	SetArgumentMemory(EquipItem(CCArgumentStorage[0] == 0 ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0], cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory())));
	return null;
}

/// $C158A5
void* CC1D12(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D12;
	}
	EscargoExpressMove(CCArgumentStorage[0] == 0 ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0], cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()));
	return null;
}

/// $C158FE
void* CC1D13(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D13;
	}
	short x12 = UnknownC191F8(CCArgumentStorage[0] == 0 ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0], cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()));
	SetArgumentMemory(UnknownC22351(x12));
	SetWorkingMemory(WorkingMemory(x12));
	return null;
}

/// $C1597F
void* CC1919(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1919;
	}
	short x02 = CCArgumentStorage[0] == 0 ? cast(short)GetWorkingMemory().integer : CCArgumentStorage[0];
	SetArgumentMemory(GetCharacterItem(x02, cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory())));
	SetWorkingMemory(WorkingMemory(x02));
	return null;
}

/// $C159F9
void* CC1D14(DisplayTextState* arg1, ushort arg2) {
	if (3 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D14;
	}
	uint x06 = (CCArgumentStorage[0]) | (cast(uint)CCArgumentStorage[1] << 8) | (cast(uint)CCArgumentStorage[2] << 16) | (cast(uint)arg2 << 24);
	SetWorkingMemory(WorkingMemory((((x06 == 0 ? GetArgumentMemory() : x06) < gameState.moneyCarried) ? 1 : 0)));
	return null;
}

/// $C15B0E
void* CC191A(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(gameState.escargoExpressItems[(arg2 != 0 ? arg2 : GetArgumentMemory()) - 1]));
	return null;
}

/// $C15B46 - [18 0D XX YY] print character status info
void* CC180D(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC180D;
	}
	short tmp = (CCArgumentStorage[0] != 0) ? CCArgumentStorage[0] : cast(short)GetWorkingMemory().integer;
	switch (arg2) {
		case 1:
			UnknownC1952F(tmp);
			break;
		case 2:
			NullC3EF23(tmp);
			break;
		default: break;
	}
	return null;
}

/// $C15BA7
void* CC1C0C(DisplayTextState* arg1, ushort arg2) {
	UnknownC1180D(arg2 != 0 ? arg2 : cast(ushort)GetArgumentMemory(), 0, 0);
	return null;
}

/// $C15BCA
void* CC1D15(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D15;
	}
	SetWorkingMemory(WorkingMemory((((arg2 << 8) | CCArgumentStorage[0]) == 0 ? cast(ushort)GetArgumentMemory() : (arg2 << 8) | CCArgumentStorage[0]) * UnknownC226F0()));
	return null;
}

/// $C15C36
void* CC191B(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(UnknownC12BD5(arg2)));
	return null;
}

/// $C15C58
void* CC1F71(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F71;
	}
	LearnSpecialPSI(arg2);
	return null;
}

/// $C15C85
void* CC1D06(DisplayTextState* arg1, ushort arg2) {
	if (3 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D06;
	}
	uint x06 = (CCArgumentStorage[0]) | (cast(uint)CCArgumentStorage[1] << 8) | (cast(uint)CCArgumentStorage[2] << 16) | (cast(uint)arg2 << 24);
	DepositIntoATM((x06 == 0) ? GetArgumentMemory() : x06);
	return null;
}

/// $C15D6B
void* CC1D07(DisplayTextState* arg1, ushort arg2) {
	if (3 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D07;
	}
	uint x06 = (CCArgumentStorage[0]) | (cast(uint)CCArgumentStorage[1] << 8) | (cast(uint)CCArgumentStorage[2] << 16) | (cast(uint)arg2 << 24);
	uint amount = (x06 == 0) ? GetArgumentMemory() : x06;
	WithdrawFromATM(amount);
	SetWorkingMemory(WorkingMemory(amount));
	return null;
}

/// $C15E5C
void* CC1D17(DisplayTextState* arg1, ushort arg2) {
	if (3 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D17;
	}
	uint x06 = (CCArgumentStorage[0]) | (cast(uint)CCArgumentStorage[1] << 8) | (cast(uint)CCArgumentStorage[2] << 16) | (cast(uint)arg2 << 24);
	SetWorkingMemory(WorkingMemory(gameState.bankBalance > x06 ? 0 : 1));
	return null;
}

/// $C15F71
void* CC1F11(DisplayTextState* arg1, ushort arg2) {
	AddCharToParty(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	return null;
}

/// $C15F91
void* CC1F12(DisplayTextState* arg1, ushort arg2) {
	RemoveCharFromParty(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	return null;
}

/// $C15FB1
void UnknownC15FB1(short arg1, short arg2) {
	for (short i = 0; i < 3; i++) {
		if (gameState.unknownB6[i] != 0) {
			continue;
		}
		gameState.unknownB6[i] = cast(ubyte)arg2;
		gameState.unknownB8[i] = cast(ubyte)arg1;
	}
}

/// $C15FF7
void* CC191C(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC191C;
	}
	short x04 = cast(short)(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : GetWorkingMemory().integer);
	short x0E = arg2 != 0 ? arg2 : cast(short)GetArgumentMemory();
	short x02;
	if (x04 == 0xFF) {
		x02 = UnknownC191B0(x0E);
	} else {
		x02 = GetCharacterItem(x04, x0E);
		RemoveItemFromInventory(x04, x0E);
	}
	UnknownC15FB1(x04, x02);
	return null;
}

/// $C16080
void* CC191D(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC191D;
	}
	short tmp = cast(short)((CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : cast(short)GetWorkingMemory().integer) - 1);
	SetWorkingMemory(WorkingMemory(gameState.unknownB8[tmp]));
	SetArgumentMemory(gameState.unknownB6[tmp]);
	if (arg2 != 0) {
		gameState.unknownB6[tmp] = 0;
		gameState.unknownB8[tmp] = 0;
	}
	return null;
}

/// $C16124
void* CC1D18(DisplayTextState* arg1, ushort arg2) {
	EscargoExpressStore(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	return null;
}

/// $C16143
void* CC1921(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(GetItemSubtype2(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory())));
	return null;
}

/// $C16172
void* CC1D19(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory((gameState.playerControlledPartyMemberCount < (arg2 != 0 ? arg2 : cast(short)GetArgumentMemory())) ? 1 : 0));
	return null;
}

/// $C161D1
void* CC1C12(DisplayTextState* arg1, ushort arg2) {
	UnknownC1CA06(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	return null;
}

/// $C161F0
void* CC1D21(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(randMod(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory())));
	return null;
}

/// $C1621F
void* UnknownC1621F(DisplayTextState* arg1, ushort arg2) {
	if ((const(ubyte)*).sizeof - 1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &UnknownC1621F;
	}
	DisplayText(cast(const(ubyte)*)
		((cast(size_t)arg2 << (((const(ubyte)*).sizeof - 1) * 8)) |
		(*cast(size_t*)(&CCArgumentStorage[0])) & ~(cast(size_t)0xFF << (((const(ubyte)*).sizeof - 1) * 8))));
	arg1.textptr += Unknown7E97D5 * (const(ubyte)*).sizeof;
	return null;
}

/// $C16308
void* CC1FC0(DisplayTextState* arg1, ushort arg2) {
	if ((GetWorkingMemory().integer != 0) && (GetWorkingMemory().integer < arg2)) {
		Unknown7E97D5 = cast(short)(arg2 - cast(short)GetWorkingMemory().integer);
		arg1.textptr += (cast(short)GetWorkingMemory().integer - 1) * (const(ubyte)*).sizeof;
		CCArgumentGatheringLoopCounter = 0;
		return &UnknownC1621F;
	} else {
		arg1.textptr += arg2 * (const(ubyte)*).sizeof;
		return null;
	}
}

/// $C163A7
void* CC1FD0(DisplayTextState* arg1, ushort arg2) {
	short x12 = UnknownC3F1EC(arg2 != 0 ? arg2 : cast(short)GetArgumentMemory());
	SetWorkingMemory(WorkingMemory(x12 != 0 ? UnknownC1D038(x12) : 0));
	SetArgumentMemory(x12);
	return null;
}

/// $C163FD
void* CC1F13(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F13;
	}
	UnknownC46363(cast(ubyte)(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : GetWorkingMemory().integer), cast(short)((arg2 != 0 ? arg2 : GetArgumentMemory()) - 1));
	return null;
}

/// $C1646E
void* CC1F14(DisplayTextState* arg1, ushort arg2) {
	UnknownC46397(cast(short)((arg2 != 0 ? arg2 : GetArgumentMemory()) - 1));
	return null;
}

/// $C16490
void* CC1F16(DisplayTextState* arg1, ushort arg2) {
	if (2 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F16;
	}
	short x02 = cast(short)(cast(short)CCArgumentStorage[1] << 8 | CCArgumentStorage[0]);
	UnknownC462FF(cast(short)(x02 != 0 ? x02 : GetWorkingMemory().integer), cast(short)((arg2 != 0 ? arg2 : GetArgumentMemory()) - 1));
	return null;
}

/// $C16509
void* CC1F17(DisplayTextState* arg1, ushort arg2) {
	if (4 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F17;
	}
	UnknownC4C91A(CreatePreparedEntityNPC(cast(short)(CCArgumentStorage[1] << 8 | CCArgumentStorage[0]), cast(short)(CCArgumentStorage[3] << 8 | CCArgumentStorage[2])), arg2);
	return null;
}

/// $C16582
void* CC1F18(DisplayTextState* arg1, ushort arg2) {
	if (6 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F18;
	}
	return null;
}

/// $C165AA
void* CC1F19(DisplayTextState* arg1, ushort arg2) {
	if (6 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F19;
	}
	return null;
}

/// $C165D2
void* CC1F1A(DisplayTextState* arg1, ushort arg2) {
	if (2 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F1A;
	}
	UnknownC4B524(cast(short)(CCArgumentStorage[1] << 8 | CCArgumentStorage[0]), arg2);
	return null;
}

/// $C1662A
void* CC1F1B(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F1A;
	}
	UnknownC4B53F(cast(short)(arg2 << 8 | CCArgumentStorage[0]));
	return null;
}

/// $C1666D
void* CC1F1C(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F1C;
	}
	UnknownC4B4FE(cast(ubyte)(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : GetWorkingMemory().integer), cast(short)((arg2 != 0 ? arg2 : GetArgumentMemory()) - 1));
	return null;
}

/// $C166DD
void* CC1F1D(DisplayTextState* arg1, ushort arg2) {
	UnknownC4B519(cast(ushort)(arg2 != 0 ? arg2 : GetWorkingMemory().integer));
	return null;
}

/// $C166FE
void* CC1FE1(DisplayTextState* arg1, ushort arg2) {
	if (2 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FE1;
	}
	UnknownC4939C(CCArgumentStorage[0], CCArgumentStorage[1], cast(ubyte)arg2);
	return null;
}

/// $C16744
void* CC1F15(DisplayTextState* arg1, ushort arg2) {
	if (4 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F15;
	}
	if (arg2 == 0xFF) {
		UnknownC06578(cast(short)(CCArgumentStorage[1] << 8 | CCArgumentStorage[0]), cast(short)(CCArgumentStorage[3] << 8 | CCArgumentStorage[2]));
	} else {
		UnknownC4C91A(CreatePreparedEntityNPC(cast(short)(CCArgumentStorage[1] << 8 | CCArgumentStorage[0]), cast(short)(CCArgumentStorage[3] << 8 | CCArgumentStorage[2])), arg2);
	}
	return null;
}

/// $C167D6
void* CC1F1E(DisplayTextState* arg1, ushort arg2) {
	if (2 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F1E;
	}
	UnknownC4C91A(UnknownC4605A(cast(short)(cast(ushort)CCArgumentStorage[1] << 8 | CCArgumentStorage[0])), arg2);
	UnknownC460CE(cast(short)(cast(ushort)CCArgumentStorage[1] << 8 | CCArgumentStorage[0]), arg2);
	return null;
}

/// $C1683B
void* CC1F1F(DisplayTextState* arg1, ushort arg2) {
	if (2 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F1F;
	}
	UnknownC4C91A(UnknownC46028(cast(short)(cast(ushort)CCArgumentStorage[1] << 8 | CCArgumentStorage[0])), arg2);
	UnknownC46125(cast(short)(cast(ushort)CCArgumentStorage[1] << 8 | CCArgumentStorage[0]), arg2);
	return null;
}

/// $C168A0
void* CC1922(DisplayTextState* arg1, ushort arg2) {
	if (3 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1922;
	}
	SetArgumentMemory(UnknownC462E4(cast(ubyte)(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : GetWorkingMemory().integer), cast(short)(CCArgumentStorage[1] - 1), cast(short)((((arg2 << 8) | CCArgumentStorage[2]) != 0) ? ((arg2 << 8) | CCArgumentStorage[2]) : GetArgumentMemory())) + 1);
	return null;
}

/// $C16947
void* CC1923(DisplayTextState* arg1, ushort arg2) {
	if (4 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1923;
	}
	SetArgumentMemory(UnknownC462AE(cast(short)((CCArgumentStorage[1] << 8 | CCArgumentStorage[0]) != 0 ? (CCArgumentStorage[1] << 8 | CCArgumentStorage[0]) : GetWorkingMemory().integer), cast(short)(CCArgumentStorage[2] - 1), cast(short)((((arg2 << 8) | CCArgumentStorage[3]) != 0) ? ((arg2 << 8) | CCArgumentStorage[3]) : GetArgumentMemory())) + 1);
	return null;
}

/// $C169F7
void* CC1F62(DisplayTextState* arg1, ushort arg2) {
	EnableBlinkingTriangle(arg2);
	return null;
}

/// $C16A01
void* CC1E08(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E08;
	}
	ResetCharLevelOne(cast(short)(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : GetWorkingMemory().integer), cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()), 1);
	return null;
}

/// $C16A7B
void* CC1924(DisplayTextState* arg1, ushort arg2) {
	if (4 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1924;
	}
	SetArgumentMemory(UnknownC462C9(cast(short)((CCArgumentStorage[1] << 8 | CCArgumentStorage[0]) != 0 ? (CCArgumentStorage[1] << 8 | CCArgumentStorage[0]) : GetWorkingMemory().integer), cast(short)(CCArgumentStorage[2] - 1), cast(short)((((arg2 << 8) | CCArgumentStorage[3]) != 0) ? ((arg2 << 8) | CCArgumentStorage[3]) : GetArgumentMemory())) + 1);
	return null;
}

/// $C16B2B
void* CC1FE4(DisplayTextState* arg1, ushort arg2) {
	if (2 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FE4;
	}
	UnknownC46331(cast(short)((CCArgumentStorage[1] << 8 | CCArgumentStorage[0]) != 0 ? (CCArgumentStorage[1] << 8 | CCArgumentStorage[0]) : GetWorkingMemory().integer), cast(short)((arg2 != 0) ? arg2 : GetArgumentMemory()));
	return null;
}

/// $C16BA4
void* CC1FE5(DisplayTextState* arg1, ushort arg2) {
	UnknownC46594(arg2);
	return null;
}

/// $C16BAF
void* CC1FE6(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FE6;
	}
	UnknownC4655E(cast(short)((arg2 << 8) | CCArgumentStorage[0]));
	return null;
}

/// $C16BF2
void* CC1FE7(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FE7;
	}
	UnknownC46579(cast(short)((arg2 << 8) | CCArgumentStorage[0]));
	return null;
}

/// $C16C35
void* CC1FE8(DisplayTextState* arg1, ushort arg2) {
	UnknownC46631(arg2);
	return null;
}

/// $C16C40
void* CC1FE9(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FE9;
	}
	UnknownC465FB(cast(short)((arg2 << 8) | CCArgumentStorage[0]));
	return null;
}

/// $C16C83
void* CC1FEA(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FEA;
	}
	UnknownC46616(cast(short)((arg2 << 8) | CCArgumentStorage[0]));
	return null;
}

/// $C16CC6
void* CC1FEB(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FEB;
	}
	UnknownC4C91A(UnknownC4608C(CCArgumentStorage[0]), arg2);
	UnknownC463F4(CCArgumentStorage[0]);
	return null;
}

/// $C16D14
void* CC1FEC(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FEC;
	}
	UnknownC4C91A(UnknownC4608C(CCArgumentStorage[0]), arg2);
	UnknownC4645A(CCArgumentStorage[0]);
	return null;
}

/// $C16D62
void* CC1FEE(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FEE;
	}
	UnknownC46698(cast(short)((arg2 << 8) | CCArgumentStorage[0]));
	return null;
}

/// $C16DA5
void* CC1FEF(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FEF;
	}
	UnknownC466A8(cast(short)((arg2 << 8) | CCArgumentStorage[0]));
	return null;
}

/// $C16DE8
void* CC1F63(DisplayTextState* arg1, ushort arg2) {
	if ((const(ubyte)*).sizeof - 1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F63;
	}
	UnknownC46594(0xFF);
	UnknownC064E3(10, QueuedInteractionPtr(cast(const(ubyte)*)
		((cast(size_t)arg2 << (((const(ubyte)*).sizeof - 1) * 8)) |
		(*cast(size_t*)(&CCArgumentStorage[0])) & ~(cast(size_t)0xFF << (((const(ubyte)*).sizeof - 1) * 8)))));
	return null;
}

/// $C16EBF
void* CC1FF1(DisplayTextState* arg1, ushort arg2) {
	if (3 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FF1;
	}
	UnknownC4617C(cast(short)((CCArgumentStorage[1] << 8) | CCArgumentStorage[0]), cast(short)((arg2 << 8) | CCArgumentStorage[2]));
	return null;
}

/// $C16F2F
void* CC1FF2(DisplayTextState* arg1, ushort arg2) {
	if (3 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FF2;
	}
	UnknownC461CC(cast(short)((CCArgumentStorage[1] << 8) | CCArgumentStorage[0]), cast(short)((arg2 << 8) | CCArgumentStorage[2]));
	return null;
}

/// $C16F9F
void* CC1925(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(FindCondiment(cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()))));
	return null;
}

/// $C16FD1
void* CC1F23(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F23;
	}
	SetWorkingMemory(WorkingMemory(InitBattleScripted(cast(short)(((arg2 << 8) | CCArgumentStorage[0]) != 0 ? ((arg2 << 8) | CCArgumentStorage[0]) : GetArgumentMemory()))));
	return null;
}

/// $C17037
void* CC1926(DisplayTextState* arg1, ushort arg2) {
	SetTeleportBoxDestination(cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()));
	return null;
}

/// $C17058
void* CC1D0C(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1D0C;
	}
	SetWorkingMemory(WorkingMemory((UnknownC190F1() != 0 ? 2 : 0) | ((ItemData[PartyCharacters[arg2 != 0 ? arg2 : GetArgumentMemory() - 1].items[cast(short)(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : GetWorkingMemory().integer)]].flags & ItemFlags.Unknown) != 0 ? 1 : 0)));
	return null;
}

/// $C1711C
void* CC1F66(DisplayTextState* arg1, ushort arg2) {
	if ((const(ubyte)*).sizeof + 1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F66;
	}
	UnknownC072CF(cast(ubyte)(CCArgumentStorage[0] != 0 ? CCArgumentStorage[0] : GetArgumentMemory()), cast(ubyte)(CCArgumentStorage[1] != 0 ? CCArgumentStorage[1] : GetWorkingMemory().integer), cast(const(ubyte)*)
		((cast(size_t)arg2 << (((const(ubyte)*).sizeof - 1) * 8)) |
		(*cast(size_t*)(&CCArgumentStorage[2])) & ~(cast(size_t)0xFF << (((const(ubyte)*).sizeof - 1) * 8))));
	return null;
}

/// $C17233
void* CC1F67(DisplayTextState* arg1, ushort arg2) {
	UnknownC071E5(cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()));
	return null;
}

/// $C17254
void* CC1F04(DisplayTextState* arg1, ushort arg2) {
	SetTextSoundMode(cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()));
	return null;
}

/// $C17274
void* CC1D24(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(gameState.unknownC4));
	if (arg2 == 2) {
		gameState.unknownC4 = 0;
	}
	return null;
}

/// $C172BC
void* CC1F40(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1F40;
	}
	return null;
}

/// $C172DA
void* CC1F41(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(WorkingMemory(UnknownC1BEFC(arg2)));
	return null;
}

/// $C17304
void* CC1FD2(DisplayTextState* arg1, ushort arg2) {
	UnknownC466C1(cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()));
	return null;
}

/// $C17325
void* CC1FF3(DisplayTextState* arg1, ushort arg2) {
	if (2 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FF3;
	}
	UnknownC4B54A(cast(short)(CCArgumentStorage[1] << 8 | CCArgumentStorage[0]), arg2);
	return null;
}

/// $C1737D
void* CC1FF4(DisplayTextState* arg1, ushort arg2) {
	if (CCArgumentGatheringLoopCounter == 0) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1FF4;
	}
	UnknownC4B565(cast(short)(arg2 << 8 | CCArgumentStorage[0]));
	return null;
}

/// $C173C0
void* CC1C13(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1C13;
	}
	if (GetBlinkingPrompt() != 0) {
		SetWorkingMemory(WorkingMemory(UnknownC3FAC9(cast(short)(CCArgumentStorage[0] - 1), cast(short)(arg2 - 1))));
	}
	return null;
}

/// $C1741F
void* CC1F07(DisplayTextState* arg1, ushort arg2) {
	UnknownC0AC0C(cast(short)(arg2 != 0 ? arg2 : GetArgumentMemory()));
	return null;
}

/// $C17440
void* CC1FD3(DisplayTextState* arg1, ushort arg2) {
	GetDeliverySpriteAndPlaceholder(arg2);
	return null;
}

/// $C1744B
void* CC1E09(DisplayTextState* arg1, ushort arg2) {
	if (4 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E0E;
	}
	GainEXP(CCArgumentStorage[0], 1, (arg2 << 24) | (CCArgumentStorage[3] << 16) | (CCArgumentStorage[2] << 8) | CCArgumentStorage[1]);
	return null;
}

/// $C17523
void* CC1E0A(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E0E;
	}
	PartyCharacters[CCArgumentStorage[0] - 1].boosted_iq += arg2;
	RecalcCharacterPostmathIQ(CCArgumentStorage[0]);
	return null;
}

/// $C17584
void* CC1E0B(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E0E;
	}
	PartyCharacters[CCArgumentStorage[0] - 1].boosted_guts += arg2;
	RecalcCharacterPostmathGuts(CCArgumentStorage[0]);
	return null;
}

/// $C175E5
void* CC1E0C(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E0E;
	}
	PartyCharacters[CCArgumentStorage[0] - 1].boosted_speed += arg2;
	RecalcCharacterPostmathSpeed(CCArgumentStorage[0]);
	return null;
}

/// $C17646
void* CC1E0D(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E0E;
	}
	PartyCharacters[CCArgumentStorage[0] - 1].boosted_vitality += arg2;
	RecalcCharacterPostmathVitality(CCArgumentStorage[0]);
	return null;
}

/// $C176A7
void* CC1E0E(DisplayTextState* arg1, ushort arg2) {
	if (1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &CC1E0E;
	}
	PartyCharacters[CCArgumentStorage[0] - 1].boosted_luck += cast(ubyte)arg2;
	RecalcCharacterPostmathLuck(CCArgumentStorage[0]);
	return null;
}

/// $C17708
void* CC1D23(DisplayTextState* arg1, ushort arg2) {
	int x06;
	switch (ItemData[cast(ushort)((arg2 != 0) ? arg2 : GetArgumentMemory())].type & 0xC) {
		case 0:
			x06 = 1;
			break;
		case 4:
		case 8:
		case 12:
			x06 = 2;
			break;
		default:
			x06 = 0;
			break;
	}
	SetWorkingMemory(WorkingMemory(x06));
	return null;
}

/// $C1776A
void* CC1927(DisplayTextState* arg1, ushort arg2) {
	SetWorkingMemory(UnknownC3EE7A(cast(ushort)((arg2 != 0) ? arg2 : GetArgumentMemory())));
	return null;
}

/// $C17796
void* UnknownC17796(DisplayTextState* arg1, ushort arg2) {
	if ((const(ubyte)*).sizeof - 1 > CCArgumentGatheringLoopCounter) {
		CCArgumentStorage[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &UnknownC17796;
	}
	UnknownC113D1(&Unknown7E97D7[0], cast(const(ubyte)*)
		((cast(size_t)arg2 << (((const(ubyte)*).sizeof - 1) * 8)) |
		(*cast(size_t*)(&CCArgumentStorage[0])) & ~(cast(size_t)0xFF << (((const(ubyte)*).sizeof - 1) * 8))));
	return null;
}

/// $C17889
void* UnknownC17889(DisplayTextState* arg1, ushort arg2) {
	switch (arg2) {
		case 1:
			Unknown7E97D7[CCArgumentGatheringLoopCounter] = 0;
			CCArgumentGatheringLoopCounter = 0;
			return &UnknownC17796;
		case 2:
			Unknown7E97D7[CCArgumentGatheringLoopCounter] = 0;
			UnknownC113D1(&Unknown7E97D7[0], null);
			return null;
		default:
			Unknown7E97D7[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
			return &UnknownC17889;
	}
}

/// $C1790B
void* CC18Tree(DisplayTextState* arg1, ushort arg2) {
	switch (arg2) {
		case 0x00:
			CloseFocusWindow();
			break;
		case 0x01:
			return &CC1801;
		case 0x02:
			UnknownC20A20(&arg1.savedTextAttributes);
			arg1.unknown4 = 1;
			break;
		case 0x03:
			return &CC1803;
		case 0x04:
			UnknownC1008E();
			HideHPPPWindows();
			WindowTick();
			break;
		case 0x05:
			return &CC1805;
		case 0x06:
			ClearFocusWindow();
			break;
		case 0x07:
			return &CC1807;
		case 0x08:
			return &CC1808;
		case 0x09:
			return &CC1809;
		case 0x0A:
			UnknownC1AA18();
			break;
		case 0x0D:
			return &CC180D;
		default: break;
	}
	return null;
}

/// $C178F7
void* CC1902(DisplayTextState* arg1, ushort arg2) {
	Unknown7E97D7[CCArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
	return &UnknownC17889;
}

/// $C179AA
void* CC19Tree(DisplayTextState* arg1, ushort arg2) {
	switch (arg2) {
		case 0x02:
			return &CC1902;
		case 0x04:
			UnknownC11383();
			break;
		case 0x05:
			return &CC1905;
		case 0x10:
			return &CC1910;
		case 0x11:
			return &CC1911;
		case 0x14:
			SetWorkingMemory(WorkingMemory(gameState.escargoExpressItems[GetSecondaryMemory() - 1]));
			IncrementSecondaryMemory();
			break;
		case 0x16:
			return &CC1916;
		case 0x18:
			return &CC1918;
		case 0x19:
			return &CC1919;
		case 0x1A:
			return &CC191A;
		case 0x1B:
			return &CC191B;
		case 0x1C:
			return &CC191C;
		case 0x1D:
			return &CC191D;
		case 0x1E:
			SetWorkingMemory(WorkingMemory(UnknownC1AD26()));
			break;
		case 0x1F:
			SetWorkingMemory(WorkingMemory(UnknownC1AD02()));
			break;
		case 0x20:
			SetWorkingMemory(WorkingMemory(gameState.playerControlledPartyMemberCount));
			break;
		case 0x21:
			return &CC1921;
		case 0x22:
			return &CC1922;
		case 0x23:
			return &CC1923;
		case 0x24:
			return &CC1924;
		case 0x25:
			return &CC1925;
		case 0x26:
			return &CC1926;
		case 0x27:
			return &CC1927;
		case 0x28:
			return &CC1928;
		default: break;
	}
	return null;
}

/// $C17B56
void* CC1ATree(DisplayTextState* arg1, ushort arg2) {
	switch (arg2) {
		case 0x00:
			return &CC1A00;
		case 0x01:
			return &CC1A01;
		case 0x04:
			SetWorkingMemory(WorkingMemory(SelectionMenu(0)));
			UnknownC11383();
			break;
		case 0x05:
			return &CC1A05;
		case 0x06:
			return &CC1A06;
		case 0x07:
			SetWorkingMemory(WorkingMemory(UnknownC19A43()));
			break;
		case 0x08:
			SetWorkingMemory(WorkingMemory(SelectionMenu(0)));
			break;
		case 0x09:
			SetWorkingMemory(WorkingMemory(SelectionMenu(1)));
			break;
		case 0x0A:
			SetWorkingMemory(WorkingMemory(UnknownC1AC00()));
			break;
		case 0x0B:
			SetWorkingMemory(WorkingMemory(UnknownC1AAFA()));
			break;
		default: break;
	}
	return null;
}

/// $C17C36
void* CC1BTree(DisplayTextState* arg1, ushort arg2) {
	switch (arg2) {
		case 0x00:
			TransferActiveMemStorage();
			break;
		case 0x01:
			TransferStorageMemActive();
			break;
		case 0x02:
			if (GetWorkingMemory().integer == 0) {
				return &CC0A;
			} else {
				arg1.textptr += (const(ubyte)*).sizeof;
			}
			break;
		case 0x03:
			if (GetWorkingMemory().integer != 0) {
				return &CC0A;
			} else {
				arg1.textptr += (const(ubyte)*).sizeof;
			}
			break;
		case 0x04:
			uint x12 = GetWorkingMemory().integer;
			SetWorkingMemory(WorkingMemory(GetArgumentMemory()));
			SetArgumentMemory(x12);
			break;
		case 0x05:
			WRAMScriptWorkMemory = GetWorkingMemory();
			WRAMScriptArgMemory = GetArgumentMemory();
			WRAMScriptSecMemory = cast(ubyte)GetSecondaryMemory();
			break;
		case 0x06:
			SetWorkingMemory(WRAMScriptWorkMemory);
			SetArgumentMemory(WRAMScriptArgMemory);
			SetSecondaryMemory(WRAMScriptSecMemory);
			break;
		default: break;
	}
	return null;
}

/// $C17D94
void* CC1CTree(DisplayTextState* arg1, ushort arg2) {
	switch (arg2) {
		case 0x00:
			return &CC1C00;
		case 0x01:
			return &CC1C01;
		case 0x02:
			return &CC1C02;
		case 0x03:
			return &CC1C03;
		case 0x04:
			ShowHPPPWindows();
			break;
		case 0x05:
			return &CC1C05;
		case 0x06:
			return &CC1C06;
		case 0x07:
			return &CC1C07;
		case 0x08:
			return &CC1C08;
		case 0x09:
			return &CC1C09;
		case 0x0A:
			return &CC1C0A;
		case 0x0B:
			return &CC1C0B;
		case 0x0C:
			return &CC1C0C;
		case 0x14:
			return &CC1C14;
		case 0x15:
			return &CC1C15;
		case 0x0D:
			UnknownC3E75D(0);
			UnknownC447FB(0x50, ReturnBattleAttackerAddress());
			break;
		case 0x0E:
			UnknownC3E75D(1);
			UnknownC447FB(0x50, ReturnBattleTargetAddress());
			break;
		case 0x0F:
			PrintNumber(UnknownC1AD26());
			break;
		case 0x11:
			return &CC1C11;
		case 0x12:
			return &CC1C12;
		case 0x13:
			return &CC1C13;
		default: break;
	}
	return null;
}

/// $C17F11
void* CC1DTree(DisplayTextState* arg1, ushort arg2) {
	switch (arg2) {
		case 0x00:
			return &CC1D00;
		case 0x01:
			return &CC1D01;
		case 0x02:
			return &CC1D02;
		case 0x03:
			return &CC1D03;
		case 0x04:
			return &CC1D04;
		case 0x05:
			return &CC1D05;
		case 0x06:
			return &CC1D06;
		case 0x07:
			return &CC1D07;
		case 0x08:
			return &CC1D08;
		case 0x09:
			return &CC1D09;
		case 0x0A:
			return &CC1D0A;
		case 0x0B:
			return &CC1D0B;
		case 0x0C:
			return &CC1D0C;
		case 0x0D:
			return &CC1D0D;
		case 0x0E:
			return &CC1D0E;
		case 0x0F:
			return &CC1D0F;
		case 0x10:
			return &CC1D10;
		case 0x11:
			return &CC1D11;
		case 0x12:
			return &CC1D12;
		case 0x13:
			return &CC1D13;
		case 0x14:
			return &CC1D14;
		case 0x15:
			return &CC1D15;
		case 0x17:
			return &CC1D17;
		case 0x18:
			return &CC1D18;
		case 0x19:
			return &CC1D19;
		case 0x20:
			short x14 = 0;
			if (UnknownC14070(ReturnBattleTargetAddress(), ReturnBattleAttackerAddress()) == 0) {
				x14 = 1;
			}
			SetWorkingMemory(WorkingMemory(x14));
			break;
		case 0x21:
			return &CC1D21;
		case 0x22:
			short x14 = 0;
			if ((LoadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & 7) == 2) {
				x14 = 1;
			}
			SetWorkingMemory(WorkingMemory(x14));
			break;
		case 0x23:
			return &CC1D23;
		case 0x24:
			return &CC1D24;
		default: break;
	}
	return null;
}

/// $C1811F
void* CC1ETree(DisplayTextState* arg1, ushort arg2) {
	switch (arg2) {
		case 0x00:
			return &CC1E00;
		case 0x01:
			return &CC1E01;
		case 0x02:
			return &CC1E02;
		case 0x03:
			return &CC1E03;
		case 0x04:
			return &CC1E04;
		case 0x05:
			return &CC1E05;
		case 0x06:
			return &CC1E06;
		case 0x07:
			return &CC1E07;
		case 0x08:
			return &CC1E08;
		case 0x09:
			return &CC1E09;
		case 0x0A:
			return &CC1E0A;
		case 0x0B:
			return &CC1E0B;
		case 0x0C:
			return &CC1E0C;
		case 0x0D:
			return &CC1E0D;
		case 0x0E:
			return &CC1E0E;
		default: break;
	}
	return null;
}

/// $C181BB
void* CC1FTree(DisplayTextState* arg1, ushort arg2) {
	switch (arg2) {
		case 0x00:
			return &CC1F00;
		case 0x01:
			return &CC1F01;
		case 0x02:
			return &CC1F02;
		case 0x03:
			UnknownC216AD(UnknownC069F7(), 0);
			break;
		case 0x04:
			return &CC1F04;
		case 0x05:
			SetBoundaryBehaviour(0);
			break;
		case 0x06:
			SetBoundaryBehaviour(1);
			break;
		case 0x07:
			return &CC1F07;
		case 0x11:
			return &CC1F11;
		case 0x12:
			return &CC1F12;
		case 0x13:
			return &CC1F13;
		case 0x14:
			return &CC1F14;
		case 0x15:
			return &CC1F15;
		case 0x16:
			return &CC1F16;
		case 0x17:
			return &CC1F17;
		case 0x18:
			return &CC1F18;
		case 0x19:
			return &CC1F19;
		case 0x1A:
			return &CC1F1A;
		case 0x1B:
			return &CC1F1B;
		case 0x1C:
			return &CC1F1C;
		case 0x1D:
			return &CC1F1D;
		case 0x1E:
			return &CC1F1E;
		case 0x1F:
			return &CC1F1F;
		case 0x20:
			return &CC1F20;
		case 0x21:
			return &CC1F21;
		case 0x23:
			return &CC1F23;
		case 0x30:
		case 0x31: //yes, these are both the same
			ChangeCurrentWindowFont(arg2);
			break;
		case 0x40:
			return &CC1F40;
		case 0x41:
			return &CC1F41;
		case 0x50:
			LockInput();
			break;
		case 0x51:
			UnlockInput();
			break;
		case 0x52:
			return &CC1F52;
		case 0x60:
			return &CC1F60;
		case 0x61:
			UnknownC102D0();
			break;
		case 0x62:
			return &CC1F62;
		case 0x63:
			return &CC1F63;
		case 0x64:
			UnknownC23008();
			break;
		case 0x65:
			UnknownC2307B();
			break;
		case 0x66:
			return &CC1F66;
		case 0x67:
			return &CC1F67;
		case 0x68:
			gameState.exitMouseXCoordinate = gameState.leaderX.integer;
			gameState.exitMouseYCoordinate = gameState.leaderY.integer;
			break;
		case 0x69:
			for (short i = 1; i <= 10; i++) {
				setEventFlag(i, 0);
			}
			FadeOut(1, 1);
			PlaySfx(Sfx.EquippedItem);
			LoadMapAtPosition(gameState.exitMouseYCoordinate, gameState.exitMouseYCoordinate);
			Unknown7E2890 = 0;
			UnknownC03FA9(gameState.exitMouseXCoordinate, gameState.exitMouseYCoordinate, 4);
			FadeIn(1, 1);
			Unknown7E5DC4 = -1;
			break;
		case 0x71:
			return &CC1F71;
		case 0x81:
			return &CC1F81;
		case 0x83:
			return &CC1F83;
		case 0x90:
			SetWorkingMemory(WorkingMemory(UnknownC19441()));
			break;
		case 0xA0:
			UnknownC226C5(1);
			break;
		case 0xA1:
			UnknownC226C5(0);
			break;
		case 0xA2:
			SetWorkingMemory(WorkingMemory(UnknownC226E6()));
			break;
		case 0xB0:
			SaveCurrentGame();
			break;
		case 0xC0:
			return &CC1FC0;
		case 0xD0:
			return &CC1FD0;
		case 0xD1:
			SetWorkingMemory(WorkingMemory(UnknownC490EE()));
			break;
		case 0xD2:
			return &CC1FD2;
		case 0xD3:
			return &CC1FD3;
		case 0xE1:
			return &CC1FE1;
		case 0xE4:
			return &CC1FE4;
		case 0xE5:
			return &CC1FE5;
		case 0xE6:
			return &CC1FE6;
		case 0xE7:
			return &CC1FE7;
		case 0xE8:
			return &CC1FE8;
		case 0xE9:
			return &CC1FE9;
		case 0xEA:
			return &CC1FEA;
		case 0xEB:
			return &CC1FEB;
		case 0xEC:
			return &CC1FEC;
		case 0xED:
			UnknownC466B8();
			break;
		case 0xEE:
			return &CC1FEE;
		case 0xEF:
			return &CC1FEF;
		case 0xF0:
			GetOnBicycle();
			break;
		case 0xF1:
			return &CC1FF1;
		case 0xF2:
			return &CC1FF2;
		case 0xF3:
			return &CC1FF3;
		case 0xF4:
			return &CC1FF4;
		default: break;
	}
	return null;
}

/// $C1866D
DisplayTextState* UnknownC1866D(DisplayTextState* arg1, const(ubyte)* arg2) {
	if (arg1 is null) {
		return null;
	}
	arg1.unknown4 = 0;
	arg1.textptr = arg2;
	return arg1;
}

/// $C1869D
void UnknownC1869D(DisplayTextState* arg1) {
	if (arg1 is null) {
		return;
	}
	if (arg1.unknown4 == 0) {
		return;
	}
	UnknownC20ABC(&arg1.savedTextAttributes);
}

/// $C186B1 - Call a text script (script_ptr)
const(ubyte)* DisplayText(const(ubyte)* script_ptr) {
	void* function(DisplayTextState*, ushort) x1E = null;
	ushort x14;
	const(ubyte)* x1A = &BattleBackRowText[12];
	if (script_ptr is null) {
		return script_ptr;
	}
	DisplayTextState* x12 = UnknownC1866D(UnknownC14012(), script_ptr);
	if (x12 is null) {
		return null;
	}
	loop: while (true) {
		if ((Unknown7E5E6E != 0) && (x1E is null)) {
			if (Unknown7E9660 == 0) {
				UnknownC445E1(x12, x1A);
			} else {
				Unknown7E9660--;
			}
		}
		if (x1A[0] != 0) {
			x14 = x1A[0];
			x1A++;
		} else {
			x14 = x12.textptr[0];
			x12.textptr++;
		}
		if (x1E !is null) {
			x1E = cast(typeof(x1E))x1E(x12, x14);
			continue;
		}
		switch (x14) {
			case 0x15:
				const(ubyte)* tmp = &compressedText[0][x12.textptr[0]][0];
				x12.textptr++;
				x14 = tmp[0];
				tmp++;
				break;
			case 0x16:
				const(ubyte)* tmp = &compressedText[1][x12.textptr[0]][0];
				x12.textptr++;
				x14 = tmp[0];
				tmp++;
				break;
			case 0x17:
				const(ubyte)* tmp = &compressedText[2][x12.textptr[0]][0];
				x12.textptr++;
				x14 = tmp[0];
				tmp++;
				break;
			default: break;
		}
		if (x14 < 0x20) {
			CCArgumentGatheringLoopCounter = 0;
			switch (x14) {
				case 0x00:
					PrintNewLine();
					break;
				case 0x01:
					if (GetTextX() != 0) {
						PrintNewLine();
					}
					break;
				case 0x02:
					break loop;
				case 0x03:
					CC1314(1, 0);
					break;
				case 0x04:
					x1E = &CC04;
					break;
				case 0x05:
					x1E = &CC05;
					break;
				case 0x06:
					x1E = &CC06;
					break;
				case 0x07:
					x1E = &CC07;
					break;
				case 0x08:
					x1E = &CC08;
					break;
				case 0x09:
					x1E = &CC09;
					break;
				case 0x0A:
					x1E = &CC0A;
					break;
				case 0x0B:
					x1E = &CC0B;
					break;
				case 0x0C:
					x1E = &CC0C;
					break;
				case 0x0D:
					x1E = &CC0D;
					break;
				case 0x0E:
					x1E = &CC0E;
					break;
				case 0x0F:
					IncrementSecondaryMemory();
					break;
				case 0x10:
					x1E = &CC10;
					break;
				case 0x11:
					SetWorkingMemory(WorkingMemory(SelectionMenu(1)));
					UnknownC11383();
					break;
				case 0x12:
					CC12();
					break;
				case 0x13:
					CC1314(0, 0);
					break;
				case 0x14:
					CC1314(1, 1);
					break;
				case 0x18:
					x1E = &CC18Tree;
					break;
				case 0x19:
					x1E = &CC19Tree;
					break;
				case 0x1A:
					x1E = &CC1ATree;
					break;
				case 0x1B:
					x1E = &CC1BTree;
					break;
				case 0x1C:
					x1E = &CC1CTree;
					break;
				case 0x1D:
					x1E = &CC1DTree;
					break;
				case 0x1E:
					x1E = &CC1ETree;
					break;
				case 0x1F:
					x1E = &CC1FTree;
					break;
				default: break;
			}
		} else {
			PrintLetter(x14);
		}
	}
	UnknownC1869D(x12);
	UnknownC14049();
	return x12.textptr;
}

/// $C18B2C
ushort GiveItemToSpecificCharacter(ushort character, ubyte item) {
	character--;
	for (short i = 0; i < 14; i++) {
		if (PartyCharacters[character].items[i] != 0) {
			continue;
		}
		PartyCharacters[character].items[i] = item;
		if (ItemData[item].type == ItemType.TeddyBear) {
			UnknownC216DB();
		}
		if ((ItemData[item].flags & ItemFlags.Transform) != 0) {
			UnknownC3EAD0(item);
		}
		return cast(ushort)(character + 1);
	}
	return 0;
}

/// $C18BC6
ushort GiveItemToCharacter(ushort character, ubyte item) {
	if (character == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (GiveItemToSpecificCharacter(gameState.partyMembers[i], item) == 0) {
				continue;
			}
			return gameState.partyMembers[i];
		}
		return 0;
	} else {
		return GiveItemToSpecificCharacter(character, item);
	}
}

/// $C18E5B
ushort RemoveItemFromInventory(ushort character, ushort slot) {
	if (slot == PartyCharacters[character - 1].equipment[EquipmentSlot.Weapon]) {
		ChangeEquippedWeapon(character, 0);
	} else if (slot == PartyCharacters[character - 1].equipment[EquipmentSlot.Body]) {
		ChangeEquippedBody(character, 0);
	} else if (slot == PartyCharacters[character - 1].equipment[EquipmentSlot.Arms]) {
		ChangeEquippedArms(character, 0);
	} else if (slot == PartyCharacters[character - 1].equipment[EquipmentSlot.Other]) {
		ChangeEquippedOther(character, 0);
	}
	if (slot >= PartyCharacters[character - 1].equipment[EquipmentSlot.Weapon]) {
		PartyCharacters[character - 1].equipment[EquipmentSlot.Weapon]--;
	}
	if (slot >= PartyCharacters[character - 1].equipment[EquipmentSlot.Body]) {
		PartyCharacters[character - 1].equipment[EquipmentSlot.Body]--;
	}
	if (slot >= PartyCharacters[character - 1].equipment[EquipmentSlot.Arms]) {
		PartyCharacters[character - 1].equipment[EquipmentSlot.Arms]--;
	}
	if (slot >= PartyCharacters[character - 1].equipment[EquipmentSlot.Other]) {
		PartyCharacters[character - 1].equipment[EquipmentSlot.Other]--;
	}
	short x00 = PartyCharacters[character - 1].items[slot - 1];
	ushort i;
	for (i = slot; (i < 14) && (PartyCharacters[character - 1].items[i] != 0); i++) {
		PartyCharacters[character - 1].items[i - 1] = PartyCharacters[character - 1].items[i];
	}
	PartyCharacters[character - 1].items[i - 1] = 0;
	if (ItemData[i].type == ItemType.TeddyBear) {
		RemoveCharFromParty(ItemData[i].parameters.strength);
		UnknownC216DB();
	}
	if ((ItemData[i].flags & ItemFlags.Transform) != 0) {
		UnknownC3EB1C(i);
	}
	return character;
}

/// $C18E5B
ushort TakeItemFromSpecificCharacter(ushort character, ushort item) {
	for (short i = 0; 14 > i; i++) {
		if (PartyCharacters[character - 1].items[i] == item) {
			return RemoveItemFromInventory(character, i);
		}
	}
	return 0;
}

/// $C18EAD
ushort TakeItemFromCharacter(ushort character, ushort item) {
	if (character != 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (TakeItemFromSpecificCharacter(gameState.partyMembers[i], item) == 0) {
				continue;
			}
			return gameState.partyMembers[i];
		}
		return 0;
	} else {
		return TakeItemFromSpecificCharacter(character, item);
	}
}

/// $C18F0E
void ReduceHPAmtPercent(short arg1, short arg2, short arg3) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			UnknownC3EC1F(gameState.partyMembers[i], arg2, arg3);
		}
	} else {
		UnknownC3EC1F(arg1, arg2, arg3);
	}
}

/// $C18F64
void RecoverHPAmtPercent(short arg1, short arg2, short arg3) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			UnknownC3EC8B(gameState.partyMembers[i], arg2, arg3);
		}
	} else {
		UnknownC3EC8B(arg1, arg2, arg3);
	}
}

/// $C18FBA
void ReducePPAmtPercent(short arg1, short arg2, short arg3) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			UnknownC3ED2C(gameState.partyMembers[i], arg2, arg3);
		}
	} else {
		UnknownC3ED2C(arg1, arg2, arg3);
	}
}

/// $C19010
void RecoverPPAmtPercent(short arg1, short arg2, short arg3) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			UnknownC3ED98(gameState.partyMembers[i], arg2, arg3);
		}
	} else {
		UnknownC3ED98(arg1, arg2, arg3);
	}
}

/// $C19066
short EquipItem(short arg1, short arg2) {
	switch (ItemData[PartyCharacters[arg1 - 1].items[arg2 - 1]].type & EquipmentSlot.All<<2) {
		case EquipmentSlot.Weapon<<2:
			return ChangeEquippedWeapon(arg1, arg2);
		case EquipmentSlot.Body<<2:
			return ChangeEquippedBody(arg1, arg2);
		case EquipmentSlot.Arms<<2:
			return ChangeEquippedArms(arg1, arg2);
		case EquipmentSlot.Other<<2:
			return ChangeEquippedOther(arg1, arg2);
		default:
			return 0;
	}
}

/// $C190E6
short UnknownC190E6(short arg1) {
	return gameState.unknown96[arg1 - 1];
}

/// $C190F1
short UnknownC190F1() {
	short x0E = 36;
	for (short i = 0; i < 3; i++) {
		if (gameState.unknownB6[i] != 0) {
			x0E--;
		}
	}
	for (short i = 0; x0E > i; i++) {
		if (gameState.escargoExpressItems[i] == 0) {
			return 0;
		}
	}
	return 1;
}

/// $C1913D
short EscargoExpressStore(short arg1) {
	for (short i = 0; gameState.escargoExpressItems.length > i; i++) {
		if (gameState.escargoExpressItems[i] != 0) {
			continue;
		}
		gameState.escargoExpressItems[i] = cast(ubyte)arg1;
		return arg1;
	}
	return 0;
}

/// $C19183
short EscargoExpressMove(short arg1, short arg2) {
	if (EscargoExpressStore(GetCharacterItem(arg1, arg2)) != 0) {
		return RemoveItemFromInventory(arg1, arg2);
	}
	return 0;
}

/// $C191B0
short UnknownC191B0(short arg1) {
	arg1--;
	ubyte x01 = gameState.escargoExpressItems[arg1];
	while ((gameState.escargoExpressItems[arg1 + 1] != 0) && (arg1++ < gameState.escargoExpressItems.length)) {
		gameState.escargoExpressItems[arg1] = gameState.escargoExpressItems[arg1 + 1];
	}
	gameState.escargoExpressItems[arg1] = 0;
	return x01;
}

/// $C191F8
short UnknownC191F8(short arg1, short arg2) {
	GiveItemToCharacter(arg1, cast(ubyte)UnknownC191B0(arg2));
	return arg1;
}

/// $C19216
void UnknownC19216(short arg1) {
	UnknownC4487C(Item.name.length, &ItemData[arg1].name[0]);
}

/// $C19249
void UnknownC19249(short arg1) {
	if ((CC1C01Table[arg1].size & 0x80) != 0) {
		switch (CC1C01Table[arg1].size & 0x7F) {
			case 1:
				PrintNumber(*cast(ubyte*)CC1C01Table[arg1].address);
				break;
			case 2:
				PrintNumber(*cast(short*)CC1C01Table[arg1].address);
				break;
			default:
				PrintNumber(*cast(int*)CC1C01Table[arg1].address);
				break;
		}
	} else {
		UnknownC447FB(CC1C01Table[arg1].size, cast(ubyte*)CC1C01Table[arg1].address);
	}
}

/// $C1931B
void UnknownC1931B(short arg1) {
	if (arg1 > 4) {
		if (arg1 == PartyMember.King) {
			if (Unknown7EB49D != 0) {
				PrintString(gameState.petName.length, &gameState.petName[0]);
			} else {
				UnknownC447FB(gameState.petName.length, &gameState.petName[0]);
			}
		} else {
			UnknownC447FB(Enemy.name.length, &EnemyConfigurationTable[NPCAITable[arg1].enemyID].name[0]);
		}
	} else {
		if (Unknown7EB49D != 0) {
			PrintString(PartyCharacter.name.length, &PartyCharacters[arg1 -1].name[0]);
		} else {
			UnknownC447FB(PartyCharacter.name.length, &PartyCharacters[arg1 - 1].name[0]);
		}
	}
}

/// $C193E7
void UnknownC193E7(short arg1) {
	UnknownC20A20(&Unknown7E9C8A);
	SetInstantPrinting();
	CreateWindowN(Window.Unknown28);
	PrintString(10, &MiscTargetText[arg1][0]);
	ClearInstantPrinting();
	UnknownC20ABC(&Unknown7E9C8A);
}

/// $C19437
void UnknownC19437() {
	CloseWindow(Window.Unknown28);
}

/// $C19441
ushort UnknownC19441() {
	ushort x02 = 0;
	UnknownC20A20(&Unknown7E9C8A);
	CreateWindowN(Window.EquipMenuItemlist);
	SetWindowTitle(7, 5, &PhoneCallText[0]);
	for (short i = 1; TelephoneContacts[i].title[0] != 0; i++) {
		if (getEventFlag(TelephoneContacts[i].eventFlag) == 0) {
			continue;
		}
		memcpy(&Unknown7E9C9F[0], &TelephoneContacts[i].title[0], TelephoneContact.title.length);
		Unknown7E9C9F[TelephoneContact.title.length] = 0;
		UnknownC115F4(i, &Unknown7E9C9F[0], null);
	}
	if (UnknownC12BD5(0) != 0) {
		UnknownC1180D(1, 0, 1);
		x02 = SelectionMenu(1);
	}
	CloseFocusWindowN();
	UnknownC20ABC(&Unknown7E9C8A);
	return x02;
}

/// $C1952F
void UnknownC1952F(short arg1) {
	arg1--;
	SetInstantPrinting();
	CreateWindowN(Window.StatusMenu);
	WindowTickWithoutInstantPrinting();
	Unknown7E5E71 = 1;
	DisplayText(StatusWindowText.ptr);
	Unknown7E5E71 = 0;
	if (gameState.playerControlledPartyMemberCount != 1) {
		Unknown7E5E7A = 8;
	}
	SetWindowTitle(8, PartyCharacter.name.length, &PartyCharacters[arg1].name[0]);
	Unknown7E5E71 = 1;
	UnknownC10EB4(1);
	UnknownC43D75(38, 0);
	PrintNumber(PartyCharacters[arg1].level);
	UnknownC10EB4(2);
	UnknownC43D75(94, 3);
	PrintNumber(PartyCharacters[arg1].hp.current.integer);
	UnknownC43D75(114, 3);
	PrintLetter(EBChar('\\'));
	UnknownC43D75(121, 3);
	PrintNumber(PartyCharacters[arg1].maxHP);
	UnknownC43D75(94, 4);
	PrintNumber(PartyCharacters[arg1].pp.current.integer);
	UnknownC43D75(114, 4);
	PrintLetter(EBChar('\\'));
	UnknownC43D75(121, 4);
	PrintNumber(PartyCharacters[arg1].maxPP);
	UnknownC43D75(199, 0);
	PrintNumber(PartyCharacters[arg1].offense);
	UnknownC43D75(199, 1);
	PrintNumber(PartyCharacters[arg1].defense);
	UnknownC43D75(199, 2);
	PrintNumber(PartyCharacters[arg1].speed);
	UnknownC43D75(199, 3);
	PrintNumber(PartyCharacters[arg1].guts);
	UnknownC43D75(199, 4);
	PrintNumber(PartyCharacters[arg1].vitality);
	UnknownC43D75(199, 5);
	PrintNumber(PartyCharacters[arg1].iq);
	UnknownC43D75(199, 6);
	PrintNumber(PartyCharacters[arg1].luck);
	UnknownC10EB4(6);
	UnknownC43D75(97, 5);
	PrintNumber((PartyCharacters[arg1].exp > 9_999_999) ? 9_999_999 : PartyCharacters[arg1].exp);
	UnknownC43D75(10, 6);
	PrintNumber(GetRequiredEXP(arg1));
	Unknown7E5E71 = 0;
	loop: for (short i = 0; i < 7; i++) {
		ubyte x12 = PartyCharacters[arg1].afflictions[i];
		if (x12 == 0) {
			continue;
		}
		const(ubyte)* x06;
		switch (i) {
			case 0:
				x06 = &StatusEquipWindowText5[x12 - 1][0];
				break;
			case 1:
				x06 = &StatusEquipWindowText5[6 + x12][0];
				break;
			case 5:
				x06 = &StatusEquipWindowText6[0];
				break;
			default: break loop;
		}
		UnknownC438A5(1, 1);
		PrintString(0x100, x06);
		break;
	}
	UnknownC438A5(11, 1);
	UnknownC43F77(UnknownC223D9(&PartyCharacters[arg1].afflictions[0], 0));
	if (arg1 != 2) {
		Unknown7E5E71 = 1;
		UnknownC43D75(36, 7);
		PrintString(0x23, &StatusEquipWindowText4[0]);
		Unknown7E5E71 = 0;
	}
	ClearInstantPrinting();
}

/// $C198DE
void InventoryGetItemName(short arg1, short arg2) {
	arg1--;
	CreateWindowN(arg2);
	if (gameState.playerControlledPartyMemberCount != 1) {
		Unknown7E5E7A = arg2;
	}
	SetWindowTitle(arg2, PartyCharacter.name.length, &PartyCharacters[arg1].name[0]);
	for (short i = 0; PartyCharacter.items.length > i; i++) {
		short x16 = PartyCharacters[arg1].items[i];
		if (CheckItemEquipped(cast(short)(arg1 + 1), i) != 0) {
			Unknown7E9C9F[0] = 0x22;
			memcpy(&Unknown7E9C9F[1], &ItemData[x16].name[0], Item.name.length);
		} else {
			memcpy(&Unknown7E9C9F[0], &ItemData[x16].name[0], Item.name.length);
		}
		Unknown7E9C9F[Item.name.length] = 0;
		if (x16 != 0) {
			UnknownC113D1(&Unknown7E9C9F[0], null);
		}
	}
	WindowTickWithoutInstantPrinting();
	UnknownC1180D(2, 0, 0);
}

/// $C19A11
short UnknownC19A11(short arg1, short arg2) {
	UnknownC20A20(&Unknown7E9C8A);
	SetWindowFocus(arg1);
	short x0E = SelectionMenu(arg2);
	UnknownC20ABC(&Unknown7E9C8A);
	return x0E;
}

/// $C19A43
ushort UnknownC19A43() {
	ubyte* x18 = &Unknown7E9C9F[StatusEquipWindowText7.length];
	UnknownC20A20(&Unknown7E9C8A);
	CreateWindowN(Window.Unknown0d);
	memcpy(&Unknown7E9C9F[0], &StatusEquipWindowText7[0], 12);
	(x18++)[0] = EBChar('(');
	(x18++)[0] = EBChar('1');
	(x18++)[0] = EBChar(')');
	(x18++)[0] = 0;
	SetWindowTitle(13, -1, &Unknown7E9C9F[0]);
	for (short i = 0; i < gameState.escargoExpressItems.length; i++) {
		memcpy(&Unknown7E9C9F[0], &ItemData[gameState.escargoExpressItems[i]].name[0], Item.name.sizeof);
		Unknown7E9C9F[Item.name.sizeof] = 0;
		if (gameState.escargoExpressItems[i] != 0) {
			UnknownC113D1(&Unknown7E9C9F[0], null);
		}
	}
	UnknownC1180D(2, 0, 1);
	short x18_2 = SelectionMenu(1);
	UnknownEF0115(13);
	Unknown7E5E71 = 0;
	UnknownC20ABC(&Unknown7E9C8A);
	return x18_2;
}

/// $C19B4E
void SetHPPPWindowModeItem(short arg1) {
	short x10;
	for (short i = 0; i < 4; i++) {
		if (UnknownC3EE14(cast(short)(i +1), arg1) == 0) {
			x10 = 0xC00;
		} else if (GetItemType(arg1) != 2) {
			x10 = 0x400;
		} else {
			short x0E;
			switch (ItemData[arg1].type & 0xC) {
				case 0x0:
					x0E = PartyCharacters[i].equipment[EquipmentSlot.Weapon];
					break;
				case 0x4:
					x0E = PartyCharacters[i].equipment[EquipmentSlot.Body];
					break;
				case 0x8:
					x0E = PartyCharacters[i].equipment[EquipmentSlot.Arms];
					break;
				case 0xC:
					x0E = PartyCharacters[i].equipment[EquipmentSlot.Other];
					break;
				default: break;
			}
			x10 = (ItemData[arg1].parameters.raw[(i == 3) ? 1 : 0] > ((x0E != 0) ? ItemData[PartyCharacters[i].items[x0E - 1]].parameters.raw[(i == 3) ? 1 : 0] : 0)) ? 0x1400 : 0x400;
		}
		PartyCharacters[i].hp_pp_window_options = x10;
	}
	Unknown7E9623 = 1;
}

/// $C19CDD
void UnknownC19CDD() {
	for (short i = 0; i < 4; i++) {
		PartyCharacters[i].hp_pp_window_options = 0x400;
	}
	memcpy(&palettes[0][12], &TextWindowFlavourPalettes[TextWindowProperties[gameState.textFlavour - 1].offset / 0x40][20], 8);
	Unknown7E0030 = 0x18;
	Unknown7E9623 = 1;
}

/// $C19D49
void UnknownC19D49() {
	for (short i = 0; i < 4; i++) {
		PartyCharacters[i].hp_pp_window_options = 0x400;
	}
	memcpy(&palettes[0][12], &TextWindowFlavourPalettes[TextWindowProperties[gameState.textFlavour - 1].offset / 0x40][12], 8);
	Unknown7E0030 = 0x18;
	Unknown7E9623 = 1;
}

/// $C19DB5
ushort UnknownC19DB5(short arg1) {
	UnknownC1AA18();
	SetInstantPrinting();
	UnknownC20A20(&Unknown7E9C8A);
	CreateWindowN(Window.Unknown0c);
	UnknownC10EB4(5);
	for (short i = 0; i < 7; i++) {
		short x1A = StoreTable[arg1][i];
		if (x1A == ItemID.None) {
			continue;
		}
		memcpy(&Unknown7E9C9F[0], &ItemData[x1A].name[0], Item.name.length);
		Unknown7E9C9F[Item.name.length] = 0;
		UnknownC115F4(x1A, &Unknown7E9C9F[0], null);
		UnknownC4507A(ItemData[x1A].cost);
	}
	UnknownC438A5(0, 0);
	UnknownC1180D(1, 0, 0);
	UnknownC11F5A(&SetHPPPWindowModeItem);
	UnknownC19CDD();
	ushort x1A = SelectionMenu(1);
	UnknownC19D49();
	CloseFocusWindow();
	UnknownC20ABC(&Unknown7E9C8A);
	ClearInstantPrinting();
	return x1A;
}

/// $C19EE6
short GetItemType(short arg1) {
	switch (ItemData[arg1].type & 0x30) {
		case 0x00:
			return 1;
		case 0x10:
			return 2;
		case 0x20:
			return 3;
		case 0x30:
			return 4;
		default:
			return 0;
	}
}

/// $C19F29
void UnknownC19F29(short arg1) {
	arg1--;
	CreateWindowN(Window.EquipMenu);
	WindowTickWithoutInstantPrinting();
	if (gameState.playerControlledPartyMemberCount != 1) {
		Unknown7E5E7A = 6;
	}
	SetWindowTitle(6, PartyCharacter.name.length, &PartyCharacters[arg1].name[0]);
	for (short i = 0; 4 > i; i++) {
		Unknown7E5E71 = 1;
		short x18;
		switch (i) {
			case 0:
				UnknownC114B1(0, i, &StatusEquipWindowText10[i][0], null);
				x18 = PartyCharacters[i].equipment[EquipmentSlot.Weapon];
				break;
			case 1:
				UnknownC114B1(0, i, &StatusEquipWindowText10[i][0], null);
				x18 = PartyCharacters[i].equipment[EquipmentSlot.Body];
				break;
			case 2:
				UnknownC114B1(0, i, &StatusEquipWindowText10[i][0], null);
				x18 = PartyCharacters[i].equipment[EquipmentSlot.Arms];
				break;
			case 3:
				UnknownC114B1(0, i, &StatusEquipWindowText10[i][0], null);
				x18 = PartyCharacters[i].equipment[EquipmentSlot.Other];
				break;
			default: break;
		}
		if (x18 != 0) {
			if (CheckItemEquipped(cast(short)(arg1 + 1), x18) != 0) {
				Unknown7E9C9F[0] = 0x22;
				memcpy(&Unknown7E9C9F[1], &ItemData[PartyCharacters[arg1].items[x18 - 1]].name[0], Item.name.length);
			} else {
				memcpy(&Unknown7E9C9F[0], &ItemData[PartyCharacters[arg1].items[x18 - 1]].name[0], Item.name.length);
			}
			Unknown7E9C9F[Item.name.length] = 0;
		} else {
			memcpy(&Unknown7E9C9F[0], &StatusEquipWindowText12[0], StatusEquipWindowText12.length);
			Unknown7E9C9F[StatusEquipWindowText12.length] = 0;
		}
		UnknownC438A5(6, i);
		PrintLetter(EBChar(':'));
		PrintLetter(EBChar(' '));
		PrintString(49, &Unknown7E9C9F[0]);
	}
	PrintMenuItems();
	Unknown7E5E71 = 0;
	ClearInstantPrinting();
}

/// $C1A1D8
void UnknownC1A1D8(short arg1) {
	arg1--;
	CreateWindowN(Window.Unknown2d);
	WindowTickWithoutInstantPrinting();
	UnknownC10EB4(2);
	UnknownC438A5(0, 0);
	PrintString(StatusEquipWindowText8.length, &StatusEquipWindowText8[0]);
	short x16 = PartyCharacters[arg1].base_offense;
	if (PartyCharacters[arg1].equipment[EquipmentSlot.Weapon] != 0) {
		short x14 = 0;
		if (arg1 == 3) {
			x14 = 1;
		}
		x16 += ItemData[PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Weapon] - 1]].parameters.raw[x14];
	}
	Unknown7E5E71 = 1;
	UnknownC43D75(55, 0);
	short a;
	//probably a clamp macro
	if (0 > x16) {
		a = 0;
	} else {
		if (x16 > 255) {
			a = 255;
		} else {
			a = cast(ubyte)x16;
		}
	}
	PrintNumber(a);
	Unknown7E5E71 = 0;
	UnknownC438A5(0, 1);
	PrintString(StatusEquipWindowText9.length, &StatusEquipWindowText9[0]);
	x16 = PartyCharacters[arg1].base_defense;
	if (PartyCharacters[arg1].equipment[EquipmentSlot.Body] != 0) {
		short x14 = 0;
		if (arg1 == 3) {
			x14 = 1;
		}
		x16 += ItemData[PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Body] - 1]].parameters.raw[x14];
	}
	if (PartyCharacters[arg1].equipment[EquipmentSlot.Arms] != 0) {
		short x14 = 0;
		if (arg1 == 3) {
			x14 = 1;
		}
		x16 += ItemData[PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Arms] - 1]].parameters.raw[x14];
	}
	if (PartyCharacters[arg1].equipment[EquipmentSlot.Other] != 0) {
		short x14 = 0;
		if (arg1 == 3) {
			x14 = 1;
		}
		x16 += ItemData[PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Other] - 1]].parameters.raw[x14];
	}
	Unknown7E5E71 = 1;
	UnknownC43D75(55, 1);
	//same as above
	if (0 > x16) {
		a = 0;
	} else {
		if (x16 > 255) {
			a = 255;
		} else {
			a = cast(ubyte)x16;
		}
	}
	PrintNumber(a);
	Unknown7E5E71 = 0;
	if (Unknown7E9CD4 != 0) {
		UnknownC43D75(76, 0);
		Win_SetTextColor(1);
		UnknownC43F77(0x14E);
		Win_SetTextColor(0);
		short x14_2 = PartyCharacters[arg1].base_offense;
		if (Unknown7E9CD0 != 0) {
			short x16_2 = 0;
			if (arg1 == 3) {
				x16_2 = 1;
			}
			x14_2 += ItemData[PartyCharacters[arg1].items[Unknown7E9CD0 - 1]].parameters.raw[x16_2];
		}
		Unknown7E5E71 = 1;
		//yes, again
		if (0 > x14_2) {
			a = 0;
		} else {
			if (x14_2 > 255) {
				a = 255;
			} else {
				a = cast(ubyte)x14_2;
			}
		}
		PrintNumber(a);
		Unknown7E5E71 = 0;
		UnknownC43D75(76, 1);
		Win_SetTextColor(1);
		UnknownC43F77(0x14E);

		x16 = PartyCharacters[arg1].base_defense;
		if (Unknown7E9CD1 != 0) {
			short x14 = 0;
			if (arg1 == 3) {
				x14 = 1;
			}
			x16 += ItemData[PartyCharacters[arg1].items[Unknown7E9CD1 - 1]].parameters.raw[x14];
		}
		if (Unknown7E9CD2 != 0) {
			short x14 = 0;
			if (arg1 == 3) {
				x14 = 1;
			}
			x16 += ItemData[PartyCharacters[arg1].items[Unknown7E9CD2 - 1]].parameters.raw[x14];
		}
		if (Unknown7E9CD3 != 0) {
			short x14 = 0;
			if (arg1 == 3) {
				x14 = 1;
			}
			x16 += ItemData[PartyCharacters[arg1].items[Unknown7E9CD3 - 1]].parameters.raw[x14];
		}
		Unknown7E5E71 = 1;
		//see the pattern yet?
		if (0 > x16) {
			a = 0;
		} else {
			if (x16 > 255) {
				a = 255;
			} else {
				a = cast(ubyte)x16;
			}
		}
		PrintNumber(a);
		Unknown7E5E71 = 0;
	}
	ClearInstantPrinting();
}

/// $C1A778
void UnknownC1A778(short arg1) {
	Unknown7E9CD4 = 0;
	UnknownC19F29(arg1);
	UnknownC1A1D8(arg1);
}

/// $C1A795
void UnknownC1A795(short arg1) {
	arg1--;
	while (true) {
		UnknownC193E7(4);
		SetWindowFocus(Window.EquipMenu);
		short x1C = SelectionMenu(1);
		UnknownC19437();
		if (x1C == 0) {
			break;
		}
		CreateWindowN(Window.EquipMenuItemlist);
		SetWindowTitle(Window.EquipMenuItemlist, cast(short)strlen(cast(const(char)*)&StatusEquipWindowText11[x1C - 1][0]), &StatusEquipWindowText11[x1C - 1][0]);
		short x04 = 0;
		short x18 = -1;
		for (short i = 0; i < 14; i++) {
			short x16 = PartyCharacters[arg1].items[i];
			if (x16 == 0) {
				continue;
			}
			if (GetItemType(x16) != 2) {
				continue;
			}
			if (GetItemSubtype(x16) != x1C) {
				continue;
			}
			if (UnknownC3EE14(cast(short)(arg1 + 1), x16) == 0) {
				continue;
			}
			if (CheckItemEquipped(cast(short)(arg1 + 1), cast(short)(i + 1)) != 0) {
				Unknown7E9C9F = 0x22;
				memcpy(&Unknown7E9C9F[1], &ItemData[x16].name, Item.name.length);
				x18 = x04;
			} else {
				memcpy(&Unknown7E9C9F[0], &ItemData[x16].name, Item.name.length);
			}
			Unknown7E9C9F[Item.name.length] = 0;
			UnknownC115F4(cast(short)(i + 1), &Unknown7E9C9F[0], null).sfx = Sfx.EquippedItem;
			x04++;
		}
		UnknownC115F4(-1, &StatusEquipWindowText13[0], null);
		UnknownC1181B(1, 0, x18);
		Unknown7E9CD6 = cast(ubyte)(arg1 + 1);
		switch (x1C) {
			case 1:
				UnknownC11F5A(&UnknownC22562);
				break;
			case 2:
				UnknownC11F5A(&UnknownC225AC);
				break;
			case 3:
				UnknownC11F5A(&UnknownC2260D);
				break;
			case 4:
				UnknownC11F5A(&UnknownC22673);
				break;
			default: break;
		}
		Unknown7E9CD4 = 1;
		UnknownC193E7(1);
		short x18_2 = SelectionMenu(1);
		UnknownC19437();
		UnknownC11F8A();
		if (x18_2 == -1) {
			switch (x1C) {
				case 1:
					ChangeEquippedWeapon(cast(short)(arg1 + 1), 0);
					break;
				case 2:
					ChangeEquippedBody(cast(short)(arg1 + 1), 0);
					break;
				case 3:
					ChangeEquippedArms(cast(short)(arg1 + 1), 0);
					break;
				case 4:
					ChangeEquippedOther(cast(short)(arg1 + 1), 0);
					break;
				default: break;
			}
		} else {
			EquipItem(cast(short)(arg1 + 1), x18_2);
		}
		CloseWindow(Window.EquipMenuItemlist);
		UnknownC1A778(cast(short)(arg1 + 1));
	}
}

/// $C1AA18
void UnknownC1AA18() {
	UnknownC20A20(&Unknown7E9C8A);
	CreateWindowN(Window.CarriedMoney);
	UnknownC10EB4(5);
	SetInstantPrinting();
	ClearFocusWindow();
	UnknownC4507A(gameState.moneyCarried);
	ClearInstantPrinting();
	UnknownC20ABC(&Unknown7E9C8A);
}

/// $C1AA5D
short UnknownC1AA5D() {
	UnknownC20A20(&Unknown7E9C8A);
	short x16 = gameState.partyMembers[0];
	while (true) {
		if (gameState.playerControlledPartyMemberCount == 1) {
			UnknownC1A778(x16);
		}
		if (gameState.playerControlledPartyMemberCount != 1) {
			UnknownC193E7(0);
			x16 = CharSelectPrompt(0, 1, &UnknownC1A778, null);
			UnknownC19437();
		} else {
			x16 = gameState.partyMembers[0];
			UnknownC43573(0);
		}
		if (x16 == 0) {
			break;
		}
		UnknownC1A795(x16);
		if (gameState.playerControlledPartyMemberCount == 1) {
			break;
		}
	}
	CloseWindow(Window.Unknown2d);
	CloseWindow(Window.EquipMenu);
	UnknownC20ABC(&Unknown7E9C8A);
	return x16;
}

/// $C1AAFA
ushort UnknownC1AAFA() {
	short x02 = 0;
	UnknownC193E7(2);
	UnknownC20A20(&Unknown7E9C8A);
	CreateWindowN(Window.PhoneMenu);
	SetWindowTitle(5, 3, &StatusEquipWindowText14[0]);
	for (short i = 0; PSITeleportDestinationTable[i].name[0] != 0; i++) {
		if (PSITeleportDestinationTable[i].name[0] == 0) {
			continue;
		}
		if (getEventFlag(PSITeleportDestinationTable[i].eventFlag) == 0) {
			continue;
		}
		memcpy(&Unknown7E9C9F[0], &PSITeleportDestinationTable[i].name[0], PSITeleportDestination.name.length);
		Unknown7E9C9F[PSITeleportDestination.name.length] = 0;
		UnknownC115F4(i, &Unknown7E9C9F[0], null);
	}
	if (UnknownC12BD5(0) != 0) {
		UnknownC1180D(1, 0, 1);
		x02 = cast(short)SelectionMenu(1);
	}
	CloseFocusWindowN();
	UnknownC19437();
	UnknownC20ABC(&Unknown7E9C8A);
	return x02;
}

/// $C1AC00
ushort UnknownC1AC00() {
	ushort x12 = UnknownC19441();
	if (x12 != 0) {
		DisplayText(&TelephoneContacts[x12].text[0]);
	}
	return x12;
}

/// $C1AC4A
void UnknownC1AC4A(ubyte* arg1, short arg2) {
	memcpy(&Unknown7E9CD7[0], arg1, arg2);
	Unknown7E9CD7[arg2] = 0;
	Unknown7E9658 = -1;
}

/// $C1ACA1
void UnknownC1ACA1(ubyte* arg1, short arg2) {
	memcpy(&Unknown7E9CF5[0], arg1, arg2);
	Unknown7E9CF5[arg2] = 0;
	Unknown7E965A = -1;
}

/// $C1AC9B
ubyte* ReturnBattleAttackerAddress() {
	return &Unknown7E9CD7[0];
}

/// $C1ACF2
ubyte* ReturnBattleTargetAddress() {
	return &Unknown7E9CF5[0];
}

/// $C1ACF8
void UnknownC1ACF8(short arg1) {
	Unknown7E9D11 = cast(ubyte)arg1;
}

/// $C1AD02
ubyte UnknownC1AD02() {
	return Unknown7E9D11;
}

/// $C1AD0A
void UnknownC1AD0A(int arg) {
	Unknown7E9D12 = arg;
}

/// $C1AD26
uint UnknownC1AD26() {
	return Unknown7E9D12;
}

/// $C1ADB4
short DetermineTargetting(short arg1, short arg2) {
	ubyte x16;
	ubyte x01 = 0xFF;
	switch (BattleActionTable[arg1].direction) {
		case 0:
			x16 = 0x10;
			switch (BattleActionTable[arg1].target) {
				case 0:
					x16 = 0x11;
					x01 = cast(ubyte)arg2;
					break;
				case 1:
					x16 = 0x11;
					x01 = cast(ubyte)UnknownC1242E(0, 1, arg1);
					break;
				case 2:
					x16 = 0x11;
					x01 = cast(ubyte)(randMod(cast(short)(CountChars(1) - 1)) + 1);
					break;
				case 3:
					x16 = 0x12;
					x01 = cast(ubyte)UnknownC1242E(1, 1, arg1);
					break;
				case 4:
				default:
					x16 |= 4;
					break;
			}
			break;
		case 1:
			x16 = 0x00;
			switch (BattleActionTable[arg1].target) {
				case 0:
					x16 = 1;
					x01 = cast(ubyte)arg2;
					break;
				case 1:
					x16 = 1;
					if (gameState.playerControlledPartyMemberCount != 1) {
						UnknownC193E7(3);
						x01 = cast(ubyte)CharSelectPrompt(1, 1, null, null);
						UnknownC19437();
					} else {
						x01 = cast(ubyte)arg2;
					}
					break;
				case 2:
					x16 = 1;
					x01 = cast(ubyte)gameState.unknown96[randMod(cast(short)(CountChars(0) - 1))];
					break;
				case 3:
				case 4:
				default:
					x16 |= 4;
					break;
			}
			break;
		default: break;
	}
	short x02 = x01;
	return cast(short)((cast(short)x16 << 8) | x02);
}

/// $C1AF74
short OverworldUseItem(short arg1, short arg2, short arg3);

/// $C1B5B6
short UnknownC1B5B6() {
	ubyte x01 = 0xFF;
	ubyte x00;
	short x27 = 0;
	Unknown7E9D18 = 0;
	while (x27 != 0) {
		ubyte x26;
		if (UnknownC1C3B6() == 1) {
			if (x01 == 0) {
				break;
			}
			x26 = gameState.partyMembers[UnknownC1C373() - 1];
			UnknownC1C853(x26);
			Unknown7E9D18 = 1;
		} else {
			UnknownC193E7(0);
			x26 = cast(ubyte)CharSelectPrompt(0, 1, &UnknownC1C853, &UnknownC1C367);
			UnknownC19437();
		}
		Unknown7E9D16 = x26;
		if (x26 == 0) {
			break;
		}
		x01 = 0xFF;
		do {
			SetWindowFocus(Window.TextStandard);
			if (x01 != 0xFF) {
				UnknownC1CA72(x01, 0);
				PrintMenuItems();
			}
			UnknownC11F5A(&UnknownC1C8BC);
			x01 = cast(ubyte)SelectionMenu(1);
			UnknownC11F8A();
			if (x01 != 0) {
				if (Unknown7E9D18 == 0) {
					UnknownC1CA72(x01, 6);
				}
				if (BattleActionTable[PSIAbilityTable[x01].battleAction].ppCost > PartyCharacters[x26 - 1].pp.current.integer) {
					CreateWindowN(Window.TextBattle);
					DisplayText(TextNotEnoughPP.ptr);
					CloseFocusWindowN();
					x00 = 0;
				} else {
					if (PSIAbilityTable[x01].type == 8) {
						if ((gameState.partyNPC1 != PartyMember.DungeonMan) && (gameState.partyNPC2 != PartyMember.DungeonMan) && (getEventFlag(EventFlag.NPCDelivery) == 0) && (gameState.walkingStyle != WalkingStyle.Ladder) && (gameState.walkingStyle != WalkingStyle.Rope) && (gameState.walkingStyle != WalkingStyle.Escalator) && (gameState.walkingStyle != WalkingStyle.Stairs) && ((LoadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & MapSectorConfig.CANNOT_TELEPORT) == 0)) {
							x00 = cast(ubyte)UnknownC1AAFA();
						} else {
							CreateWindowN(Window.TextBattle);
							DisplayText(TextCannotTeleportHere.ptr);
							CloseFocusWindowN();
							x00 = 0;
						}
					} else {
						x00 = cast(ubyte)DetermineTargetting(PSIAbilityTable[x01].battleAction, x26);
					}
				}
			} else {
				x00 = 1;
			}
		} while (x00 == 0);
		CloseWindow(Window.unknown04);
		if (x01 == 0) {
			continue;
		}
		UnknownC3ED2C(x26, BattleActionTable[PSIAbilityTable[x01].battleAction].ppCost, 1);
		if (PSIAbilityTable[x01].type == 8) {
			SetTeleportState(x00, cast(TeleportStyle)PSIAbilityTable[x01].level);
		} else {
			currentAttacker = &BattlersTable[0];
			BattleInitPlayerStats(x26, currentAttacker);
			UnknownC1AC4A(&PartyCharacters[x26 - 1].name[0], PartyCharacter.name.length);
			if (x00 != 0xFF) {
				UnknownC1ACA1(&PartyCharacters[x00 - 1].name[0], PartyCharacter.name.length);
			}
			UnknownC1ACF8(x01);
			CreateWindowN(Window.TextStandard);
			DisplayText(BattleActionTable[PSIAbilityTable[x01].battleAction].text.ptr);
		}
		if (BattleActionTable[PSIAbilityTable[x01].battleAction].func !is null) {
			currentTarget = &BattlersTable[1];
			if (x00 == 0xFF) {
				for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
					UnknownC1ACA1(&PartyCharacters[gameState.partyMembers[i] - 1].name[0], PartyCharacter.name.length);
					BattleInitPlayerStats(gameState.partyMembers[i] - 1, &BattlersTable[1]);
					BattleActionTable[PSIAbilityTable[x01].battleAction].func();
					for (short j = 0; AFFLICTION_GROUP_COUNT > j; j++) {
						version(bugfix) {
							PartyCharacters[gameState.partyMembers[i] - 1].afflictions[j] = currentTarget.afflictions[j];
						} else {
							PartyCharacters[i].afflictions[j] = currentTarget.afflictions[j];
						}
					}
				}
			} else {
				BattleInitPlayerStats(x00, currentTarget);
				BattleActionTable[PSIAbilityTable[x01].battleAction].func();
				for (short i = 0; AFFLICTION_GROUP_COUNT > i; i++) {
					PartyCharacters[x00].afflictions[i] = currentTarget.afflictions[i];
				}
			}
			UnknownC3EE4D();
		}
		x27 = 1;
	}
	CloseWindow(Window.TextStandard);
	return x27;
}

/// $C1BB06
void UnknownC1BB06(short arg1) {
	if ((Unknown7E9D19 == 0xFF) || (arg1 == Unknown7E9D19)) {
		UnknownC1C8BC(arg1);
		CreateWindowN(Window.Unknown2f);
		WindowTickWithoutInstantPrinting();
		Unknown7E9D19 = arg1;
		DisplayText(&PSIAbilityTable[arg1].text[0]);
		ClearInstantPrinting();
	}
}

/// $C1BB71
void UnknownC1BB71() {
	short x16;
	while (true) {
		Unknown7E5E71 = 1;
		Unknown1:
		short x = CharSelectPrompt(0, 1, &UnknownC1952F, null);
		if (x == 0) {
			break;
		}
		if (x == 3) {
			continue;
		}
		short x02 = 0;
		CreateWindowN(Window.Unknown2e);
		for (short i = 0; i < 4; i++) {
			UnknownC115F4(cast(short)(i + 1), &PSICategories[i + 1][0], null);
		}
		UnknownC1180D(1, 0, 0);
		while (true) {
			SetWindowFocus(Window.Unknown2e);
			if (x02 == 0) {
				PrintMenuItems();
				WindowTickWithoutInstantPrinting();
				x02++;
			}
			CreateWindowN(Window.StatusMenu);
			CurrentFocusWindow = Window.Unknown2e;
			Unknown7E5E71 = 0;
			UnknownC11F5A(&UnknownC1CAF5);
			x16 = SelectionMenu(1);
			UnknownC11F8A();
			if (x16 == 0) {
				break;
			}
			if (UnknownC12BD5(1) == 0) {
				continue;
			}
			SetWindowFocus(Window.TextStandard);
			Unknown7E9D19 = 0xFF;
			UnknownC11F5A(&UnknownC1BB06);
			while (SelectionMenu(1) != 0) {}
			UnknownC11F8A();
			CloseWindow(Window.unknown04);
			CloseWindow(Window.Unknown2f);
			Unknown7E9D19 = 0xFF;
		}
		CloseWindow(Window.Unknown2e);
		CloseWindow(Window.TextStandard);
		CurrentFocusWindow = Window.StatusMenu;
		Unknown7E5E71 = 1;
		if (x16 == 0) {
			goto Unknown1;
		}
		break;
	}
	CloseWindow(Window.StatusMenu);
}

/// $C1BCAB
void Teleport(short arg1) {
	short x16 = OverworldStatusSuppression;
	OverworldStatusSuppression = 1;
	for (short i = 1; i <= 10; i++) {
		setEventFlag(i, 0);
	}
	UnknownC06B3D();
	PlaySfx(GetScreenTransitionSoundEffect(TeleportDestinationTable[arg1].screenTransition, 1));
	if (Unknown7EB4B6 != 0) {
		FadeOut(1, 1);
	} else {
		ScreenTransition(TeleportDestinationTable[arg1].screenTransition, 1);
	}
	LoadMapAtPosition(cast(short)(TeleportDestinationTable[arg1].x * 8), cast(short)(TeleportDestinationTable[arg1].y * 8));
	Unknown7E2890 = 0;
	UnknownC03FA9(cast(short)(TeleportDestinationTable[arg1].x * 8), cast(short)(TeleportDestinationTable[arg1].y * 8), cast(short)((TeleportDestinationTable[arg1].direction & 0x7F) - 1));
	if ((TeleportDestinationTable[arg1].direction & 0x80) != 0) {
		UnknownC052D4(cast(short)((TeleportDestinationTable[arg1].direction & 0x7F) - 1));
	}
	UnknownC068F4(cast(short)(TeleportDestinationTable[arg1].x * 8), cast(short)(TeleportDestinationTable[arg1].y * 8));
	UnknownC069AF();
	if (Unknown7E9D1B !is null) {
		Unknown7E9D1B();
		Unknown7E9D1B = null;
	}
	UnknownC065A3();
	PlaySfx(GetScreenTransitionSoundEffect(TeleportDestinationTable[arg1].screenTransition, 0));
	if (Unknown7EB4B6 != 0) {
		FadeIn(1, 1);
	} else {
		ScreenTransition(TeleportDestinationTable[arg1].screenTransition, 0);
	}
	Unknown7E5DC4 = -1;
	OverworldStatusSuppression = x16;
}

/// $C1BE4D
short AttemptHomesickness() {
	if (PartyCharacters[0].afflictions[0] != Status0.Unconscious) {
		short x0E = 15;
		for (short x = 0; 6 > x; x++, x0E += 15) {
			if (PartyCharacters[0].level <= x0E) {
				if ((HomesicknessProbabilities[x] != 0) && (randMod(HomesicknessProbabilities[x]) == 0)) {
					return InflictStatusNonBattle(1, 5 + 1, Status5.Homesick + 1);
				}
				return 0;
			}
		}
	}
	return 0;
}

/// $C1BEC6
void GetOffBicycle() {
	CreateWindowN(Window.TextStandard);
	SetWorkingMemory(WorkingMemory(1));
	DisplayText(TextGotOffBike.ptr);
	CloseFocusWindowN();
	WindowTick();
	UnknownC03CFD();
}

/// $C1BEFC
short UnknownC1BEFC(short arg1) {
	switch (arg1) {
		case 1:
			CoffeeTeaScene(0);
			break;
		case 2:
			CoffeeTeaScene(1);
			break;
		case 3:
			EnterYourNamePlease(0);
			break;
		case 4:
			EnterYourNamePlease(1);
			break;
		case 5:
			UnknownC43344(1);
			break;
		case 6:
			UnknownC43344(getEventFlag(EventFlag.USE_POSTGAME_MUSIC));
			break;
		case 7:
			return DisplayTownMap();
		case 8:
			return UnknownC3FB09();
		case 9:
			UseSoundStone(1);
			break;
		case 10:
			ShowTitleScreen(1);
			break;
		case 11:
			UnknownC4ED0E();
			break;
		case 12:
			PlayCredits();
			break;
		case 13:
			UnknownC12D17(1);
			break;
		case 14:
			UnknownC12D17(0);
			break;
		case 15:
			for (short i = 0; i < EventFlags.length; i++) {
				EventFlags[i] = 0;
			}
			break;
		case 16:
			UseSoundStone(0);
			break;
		case 17:
			return AttemptHomesickness();
		case 18:
			if (gameState.walkingStyle == 3) {
				UnknownC03CFD();
				return 1;
			}
			return 0;
		default: break;
	}
	return 0;
}

/// $C1C165
short UnknownC1C165(short arg1) {
	ubyte* y = &PartyCharacters[arg1 - 1].afflictions[0];
	for (short i = 0; i < 7; i++, y++) {
		if (y[0] == 0) {
			continue;
		}
		if (UnknownC3F0B0[i][y[0] - 1] != 0) {
			return 0;
		}
		return 1;
	}
	return 1;
}

/// $C1C1BA
short UnknownC1C1BA(short arg1, short arg2, short arg3) {
	if (arg1 == 3) {
		return 0;
	}
	short x13 = cast(short)(arg3 - 1);
	for (short i = 1; PSIAbilityTable[i].name != 0; i++) {
		ubyte x10 = 0;
		switch (x13) {
			case 0:
				x10 = PSIAbilityTable[i].nessLevel;
				break;
			case 1:
				x10 = PSIAbilityTable[i].paulaLevel;
				break;
			case 3:
				x10 = PSIAbilityTable[i].pooLevel;
				break;
			default: break;
		}
		if ((x10 != 0) && ((PSIAbilityTable[i].target & arg2) != 0) && (x10 <= PartyCharacters[x13].level)) {
			if ((PSIAbilityTable[i].type & arg3) != 0) {
				return 1;
			}
		}
	}
	if ((x13 == 0) && ((arg2 & 1) != 0) && ((gameState.partyPSI & 1) != 0) && ((arg3 & 8) != 0)) {
		return 1;
	}
	if ((x13 == 3) && ((arg2 & 2) != 0) && ((gameState.partyPSI & 6) != 0) && ((arg3 & 1) != 0)) {
		return 1;
	}
	return 0;
}

/// $C1C32A
short UnknownC1C32A(short arg1, short arg2, short arg3) {
	short x04 = 0;
	if ((arg1 != 3) && (UnknownC1C165(arg1) != 0) && (UnknownC1C1BA(arg1, arg2, arg3) != 0)) {
		x04 = 1;
	}
	return x04;
}

/// $C1C367
short UnknownC1C367(short arg1) {
	return UnknownC1C32A(arg1, 1, 0xF);
}

/// $C1C373
short UnknownC1C373() {
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if (UnknownC1C32A(gameState.partyMembers[i], 1, 0xF) == 0) {
			return cast(short)(i + 1);
		}
	}
	return 0;
}

/// $C1C3B6
short UnknownC1C3B6() {
	short x04 =0;
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if (UnknownC1C32A(gameState.partyMembers[i], 1, 0xF) != 0) {
			x04++;
		}
	}
	return x04;
}

/// $C1C403
void GetPSIName(short arg1) {
	const(ubyte)* x06;
	if (arg1 == 1) {
		x06 = &gameState.favouriteThing[0];
	} else {
		x06 = &PSINameTable[arg1 - 1][0];
	}
	UnknownC447FB(-1, x06);
}

/// $C1C452
void GeneratePSIList(short arg1, ubyte arg2, ubyte arg3) {
	arg1--;
	SetInstantPrinting();
	UnknownC11383();
	short x1F = 0;
	if ((arg1 == 3) && ((arg2 & 2) != 0) && ((arg3 & 1) != 0)) {
		if ((gameState.partyPSI & 2) != 0) {
			UnknownC438A5(0, PSIAbilityTable[21].menuY);
			GetPSIName(PSIAbilityTable[21].name);
			UnknownC1153B(21, PSIAbilityTable[21].menuX, PSIAbilityTable[21].menuY, &PSISuffixes[PSIAbilityTable[21].level - 1][0], null);
		}
		if ((gameState.partyPSI & 4) != 0) {
			UnknownC1153B(22, PSIAbilityTable[22].menuX, PSIAbilityTable[22].menuY, &PSISuffixes[PSIAbilityTable[22].level - 1][0], null);
		}
	}
	for (short i = 1; PSIAbilityTable[i].name != 0; i++) {
		ubyte x18;
		switch (arg1) {
			case 0:
				x18 = PSIAbilityTable[i].nessLevel;
				break;
			case 1:
				x18 = PSIAbilityTable[i].paulaLevel;
				break;
			case 3:
				x18 = PSIAbilityTable[i].pooLevel;
				break;
			default: break;
		}
		if (x18 == 0) {
			continue;
		}
		if ((PSIAbilityTable[i].target & arg2) == 0) {
			continue;
		}
		if (x18 > PartyCharacters[arg1].level) {
			continue;
		}
		if ((PSIAbilityTable[i].type & arg3) == 0) {
			continue;
		}
		if (PSIAbilityTable[i].name != x1F) {
			UnknownC438A5(0, PSIAbilityTable[i].menuY);
			GetPSIName(PSIAbilityTable[i].name);
			x1F = PSIAbilityTable[i].name;
		}
		UnknownC1153B(i, PSIAbilityTable[i].menuX, PSIAbilityTable[i].menuY, &PSISuffixes[PSIAbilityTable[i].level - 1][0], null);
	}
	if ((arg1 == 0) && ((arg2 & 1) != 0) && ((arg3 & 8) != 0)) {
		if ((gameState.partyPSI & 1) != 0) {
			UnknownC438A5(0, PSIAbilityTable[51].menuY);
			GetPSIName(PSIAbilityTable[51].name);
			UnknownC1153B(51, PSIAbilityTable[51].menuX, PSIAbilityTable[51].menuY, &PSISuffixes[PSIAbilityTable[51].level - 1][0], null);
		}
		if ((gameState.partyPSI & 8) != 0) {
			UnknownC1153B(52, PSIAbilityTable[52].menuX, PSIAbilityTable[52].menuY, &PSISuffixes[PSIAbilityTable[52].level - 1][0], null);
		}
	}
	PrintMenuItems();
	ClearInstantPrinting();
}

/// $C1C853
void UnknownC1C853(short arg1) {
	CreateWindowN(Window.TextStandard);
	WindowTickWithoutInstantPrinting();
	if (gameState.playerControlledPartyMemberCount != 1) {
		Unknown7E5E7A = 1;
	}
	SetWindowTitle(1, PartyCharacter.name.length, &PartyCharacters[arg1 - 1].name[0]);
	GeneratePSIList(arg1, 1, 0xF);
}

/// $C1C8BC
void UnknownC1C8BC(short arg1) {
	const(ubyte)* x06;
	CreateWindowN(Window.unknown04);
	WindowTickWithoutInstantPrinting();
	Unknown7E5E6E = 0;
	if (PSIAbilityTable[arg1].name == 4) {
		x06 = &PSITargetText[0][0][0];
	} else {
		x06 = &PSITargetText[BattleActionTable[PSIAbilityTable[arg1].battleAction].direction][BattleActionTable[PSIAbilityTable[arg1].battleAction].target][0];
	}
	PrintString(PSITargetText[0][0].length, x06);
	Unknown7E5E6E = 0xFF;
	UnknownC438A5(0, 1);
	PrintString(PPCostText.length, &PPCostText[0]);
	PrintLetter(EBChar(' '));
	UnknownC10EB4(0x81);
	UnknownC43D75(0x28, 0x1);
	PrintNumber(BattleActionTable[PSIAbilityTable[arg1].battleAction].ppCost);
	ClearInstantPrinting();
}

/// $C1CA06
void UnknownC1CA06(short arg1) {
	GetPSIName(PSIAbilityTable[arg1].name);
	UnknownC447FB(-1, &PSISuffixes[PSIAbilityTable[arg1].level - 1][0]);
}

/// $C1CA72
void UnknownC1CA72(short arg1, short arg2) {
	SetInstantPrinting();
	short x0E = WindowStats[WindowTable[CurrentFocusWindow]].text_y;
	UnknownEF0115(CurrentFocusWindow);
	WindowTickWithoutInstantPrinting();
	UnknownC1C853(Unknown7E9D16);
	PrintMenuItems();
	WindowStats[WindowTable[CurrentFocusWindow]].text_y = x0E;
	UnknownC438A5(0, GetTextY());
	Win_SetTextColor(arg2);
	GetPSIName(PSIAbilityTable[arg1].name);
	Win_SetTextColor(0);
	ClearInstantPrinting();
}

/// $C1CAF5
void UnknownC1CAF5(short arg1) {
	short x10 = gameState.partyMembers[BattleMenuCurrentCharacterID];
	CreateWindowN(Window.TextStandard);
	WindowTickWithoutInstantPrinting();
	switch (arg1) {
		case 1:
			GeneratePSIList(x10, 2, 1);
			break;
		case 2:
			GeneratePSIList(x10, 2, 2);
			break;
		case 3:
			GeneratePSIList(x10, 2, 4);
			break;
		case 4:
			GeneratePSIList(x10, 3, 8);
			break;
		default: break;
	}
}

/// $C1D038 - Get fixed version of an item
/// Returns: Fixed item id, or 0 if nonexistant
short UnknownC1D038(short arg1) {
	if (ItemData[arg1].type == 8) {
		return ItemData[arg1].parameters.ep;
	}
	return 0;
}

/// $C1D08B
short UnknownC1D08B(short arg1, short arg2, short arg3) {
	short x0E = cast(short)((arg1 * arg2) - ((arg3 - 2) * 10));
	short x02 = (x0E <= 0) ? 0 : randMod(3);
	return cast(short)(((UnknownC3F2B1[(arg1 + 1) % 4] + x02 - 1) * x0E) / 50);
}

/// $C1D109
void LevelUpChar(short arg1, short arg2) {
	arg1--;
	short x16 = PartyCharacters[arg1].level;
	PartyCharacters[arg1].level++;
	if (arg2 != 0) {
		EnableBlinkingTriangle(1);
		UnknownC1ACA1(&PartyCharacters[arg1].name[0], 5);
		UnknownC1AD0A(PartyCharacters[arg1].level);
		DisplayText(TextLevelIsNowX.ptr);
		EnableBlinkingTriangle(2);
	}
	short x02 = UnknownC1D08B(x16, StatsGrowthVars[arg2].offense, PartyCharacters[arg1].base_offense);
	if (x02 > 0) {
		PartyCharacters[arg1].base_offense += x02;
		RecalcCharacterPostmathOffense(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			UnknownC1AD0A(x02);
			DisplayText(TextLevelUpOffense.ptr);
		}
	}
	x02 = UnknownC1D08B(x16, StatsGrowthVars[arg2].defense, PartyCharacters[arg1].base_defense);
	if (x02 > 0) {
		PartyCharacters[arg1].base_defense += x02;
		RecalcCharacterPostmathDefense(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			UnknownC1AD0A(x02);
			DisplayText(TextLevelUpDefense.ptr);
		}
	}
	x02 = UnknownC1D08B(x16, StatsGrowthVars[arg2].speed, PartyCharacters[arg1].base_speed);
	if (x02 > 0) {
		PartyCharacters[arg1].base_speed += x02;
		RecalcCharacterPostmathSpeed(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			UnknownC1AD0A(x02);
			DisplayText(TextLevelUpSpeed.ptr);
		}
	}
	x02 = UnknownC1D08B(x16, StatsGrowthVars[arg2].guts, PartyCharacters[arg1].base_guts);
	if (x02 > 0) {
		PartyCharacters[arg1].base_guts += x02;
		RecalcCharacterPostmathGuts(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			UnknownC1AD0A(x02);
			DisplayText(TextLevelUpGuts.ptr);
		}
	}
	if (10 > x16) {
		x02 = cast(short)(((StatsGrowthVars[arg1].vitality * x16) - (PartyCharacters[arg1].base_vitality - 2) * 10) / 10);
	} else {
		x02 = UnknownC1D08B(x16, StatsGrowthVars[arg1].vitality, PartyCharacters[arg1].base_vitality);
	}
	if (x02 > 0) {
		PartyCharacters[arg1].base_vitality += x02;
		RecalcCharacterPostmathVitality(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			UnknownC1AD0A(x02);
			DisplayText(TextLevelUpVitality.ptr);
		}
	}
	if (10 > x16) {
		x02 = cast(short)(((StatsGrowthVars[arg1].iq * x16) - (PartyCharacters[arg1].base_iq - 2) * 10) / 10);
	} else {
		x02 = UnknownC1D08B(x16, StatsGrowthVars[arg1].iq, PartyCharacters[arg1].base_iq);
	}
	if (x02 > 0) {
		PartyCharacters[arg1].base_iq += x02;
		RecalcCharacterPostmathIQ(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			UnknownC1AD0A(x02);
			DisplayText(TextLevelUpIQ.ptr);
		}
	}
	x02 = UnknownC1D08B(x16, StatsGrowthVars[arg2].luck, PartyCharacters[arg1].base_luck);
	if (x02 > 0) {
		PartyCharacters[arg1].base_luck += x02;
		RecalcCharacterPostmathLuck(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			UnknownC1AD0A(x02);
			DisplayText(TextLevelUpLuck.ptr);
		}
	}
	short x14 = cast(short)(PartyCharacters[arg1].vitality * 15 - PartyCharacters[arg1].maxHP);
	x02 = (x14 > 1) ? x14 : cast(short)(randMod(2) + 1);
	PartyCharacters[arg1].maxHP += x02;
	PartyCharacters[arg1].hp.target += x02;
	if (arg2 != 0) {
		UnknownC1AD0A(x02);
		DisplayText(TextLevelUpMaxHP.ptr);
	}
	if (arg1 != 2) {
		short x12 = ((arg1 == 0) && (getEventFlag(EventFlag.MAGICANT_COMPLETED) != 0)) ? PartyCharacters[arg1].iq * 2 : PartyCharacters[arg1].iq;
		x14 = cast(short)(x12 * 5 - PartyCharacters[arg1].maxPP);
		x14 = (x14 > 1) ? x14 : (randMod(2));
		if (x14 != 0) {
			PartyCharacters[arg1].maxPP += x14;
			PartyCharacters[arg1].pp.target += x14;
			if (arg2 != 0) {
				UnknownC1AD0A(x14);
				DisplayText(TextLevelUpMaxPP.ptr);
			}
		}
		if (arg2 != 0) {
			x02 = x16;
			x02++;
			switch (arg1) {
				case 0:
					for (short i = 1; PSIAbilityTable[i].name != 0; i++) {
						if (PSIAbilityTable[i].nessLevel == x02) {
							UnknownC1ACF8(i);
							DisplayText(TextLevelUpPSILearned.ptr);
						}
					}
					break;
				case 1:
					for (short i = 1; PSIAbilityTable[i].name != 0; i++) {
						if (PSIAbilityTable[i].paulaLevel == x02) {
							UnknownC1ACF8(i);
							DisplayText(TextLevelUpPSILearned.ptr);
						}
					}
					break;
				case 3:
					for (short i = 1; PSIAbilityTable[i].name != 0; i++) {
						if (PSIAbilityTable[i].pooLevel == x02) {
							UnknownC1ACF8(i);
							DisplayText(TextLevelUpPSILearned.ptr);
						}
					}
					break;
				default: break;
			}
		}
	}
	if (arg2 != 0) {
		ClearBlinkingPrompt();
	}
}

/// $C1D9E9
void GainEXP(short arg1, short arg2, uint exp) {
	PartyCharacters[arg1 - 1].exp += exp;
	if (PartyCharacters[arg1 - 1].level > 99) {
		return;
	}
	if (EXPTable[arg1 - 1][PartyCharacters[arg1 - 1].level + 1] < PartyCharacters[arg1 - 1].exp) {
		if (arg2 != 0) {
			ChangeMusic(Music.LevelUp);
		}
		while (EXPTable[arg1 - 1][PartyCharacters[arg1 - 1].level + 1] < PartyCharacters[arg1 - 1].exp) {
			LevelUpChar(arg1, arg2);
			if (PartyCharacters[arg1 - 1].level > 99) {
				return;
			}
		}
	}
}

/// $C1DB33
short FindCondiment(short item) {
	if ((ItemData[item].type & 0x3C) == 0x20) {
		for (short i = 0; (i < 14) && (PartyCharacters[currentAttacker.id - 1].items[i] != 0xFF); i++) {
			if ((ItemData[PartyCharacters[currentAttacker.id - 1].items[i]].type & 0x3C) == 0x28) {
				return PartyCharacters[currentAttacker.id - 1].items[i];
			}
		}
	}
	return 0;
}

/// $C1DBBB
void ShowHPAlert(short arg1) {
	Battler battler;
	Battler* x02 = currentAttacker;
	battler.allyOrEnemy = 0;
	battler.id = cast(ubyte)arg1;
	currentAttacker = &battler;
	UnknownC0943C();
	CreateWindowN(Window.TextStandard);
	UnknownC1AC4A(&PartyCharacters[arg1].name[0], 5);
	DisplayText(TextAlertConditionCritical.ptr);
	CloseFocusWindowN();
	WindowTick();
	UnknownC09451();
	currentAttacker = x02;
}

/// $C1D8D0
void ResetCharLevelOne(short, short, short);

/// $C1DC66
void DisplayTextWait(const(ubyte)* arg1, int arg2) {
	if ((gameState.autoFightEnable != 0) && ((pad_state[0] & PAD_B) != 0)) {
		gameState.autoFightEnable = 0;
		UnknownC20293();
	}
	UnknownC1AD0A(arg2);
	if (BattleModeFlag != 0) {
		EnableBlinkingTriangle(2);
	}
	DisplayText(arg1);
	ClearBlinkingPrompt();
}

/// $C1DCCB
void DisplayInBattleText(const(ubyte)* ptr) {
	if ((gameState.autoFightEnable != 0) && ((pad_state[0] & PAD_B) != 0)) {
		gameState.autoFightEnable = 0;
		UnknownC20293();
	}
	if (BattleModeFlag != 0) {
		EnableBlinkingTriangle(2);
	}
	DisplayText(ptr);
	ClearBlinkingPrompt();
}

/// $C1DCCB
void UnknownC1DCCB(short arg1) {
	UnknownC200D9();
	BattleModeFlag = 1;
	for (short i = 1; i <= 4; i++) {
		ResetCharLevelOne(i, arg1, 1);
		RecoverHPAmtPercent(i, 100, 0);
		RecoverPPAmtPercent(i, 100, 0);
		PartyCharacters[i - 1].hp.current.integer = PartyCharacters[i - 1].hp.target;
		PartyCharacters[i - 1].pp.current.integer = PartyCharacters[i - 1].pp.target;
		memset(&PartyCharacters[i - 1].afflictions[0], 0, PartyCharacter.afflictions.length);
	}
}

/// $C1DD3B
void ShowHPPPWindowsF() {
	ShowHPPPWindows();
}

/// $C1DD41
void HideHPPPWindowsF() {
	HideHPPPWindows();
}

/// $C1DD47
void CreateWindow(short id) {
	CreateWindowN(id);
}

/// $C1DD59
void CloseFocusWindow() {
	CloseFocusWindowN();
}

/// $C1DD5F
void UnknownC1DD5F() {
	UnknownC1008E();
	WindowTick();
	HideHPPPWindows();
	WindowTick();
}

/// $C1DD70
void UnknownC1AC4AF(ubyte* arg1, short arg2) {
	UnknownC1AC4A(arg1, arg2);
}

/// $C1DD76
void UnknownC1ACA1F(ubyte* arg1, short arg2) {
	UnknownC1ACA1(arg1, arg2);
}

/// $C1DD7C
void UnknownC1ACF8F(short arg1) {
	UnknownC1ACF8(arg1);
}

/// $C1DD9F
void UnknownC1DD9F(const(ubyte)* arg1) {
	EnableBlinkingTriangle(1);
	DisplayText(arg1);
	ClearBlinkingPrompt();
}

/// $C1DDCC
void UnknownC43573F(short arg1) {
	UnknownC43573(arg1);
}

/// $C1DDC6
ushort RemoveItemFromInventoryF(ushort character, ushort id) {
	return RemoveItemFromInventory(character, id);
}

/// $C1DDD3
void UnknownC3E6F8F() {
	UnknownC3E6F8();
}

/// $C1DE43
void BattleActionSwitchWeapons() {
	EnableBlinkingTriangle(1);
	if (UnknownC3EE14(currentAttacker.id, currentAttacker.currentActionArgument) != 0) {
		short x18 = cast(short)(currentAttacker.offense - currentAttacker.baseOffense);
		short x04 = cast(short)(currentAttacker.guts - currentAttacker.baseGuts);
		EquipItem(currentAttacker.id, currentAttacker.unknown7);
		currentAttacker.baseOffense = PartyCharacters[currentAttacker.id - 1].offense;
		currentAttacker.offense = cast(short)(currentAttacker.baseOffense + x18);
		currentAttacker.baseGuts = PartyCharacters[currentAttacker.id - 1].guts;
		currentAttacker.guts = cast(short)(currentAttacker.baseGuts + x04);
		DisplayText(TextBattleEquipXInstead.ptr);
	} else {
		DisplayText(TextBattleCouldNotEquipAttackAnyway.ptr);
	}
	short tmp = PartyCharacters[currentAttacker.id - 1].items[PartyCharacters[currentAttacker.id - 1].equipment[EquipmentSlot.Weapon] - 1];
	if ((tmp != 0) && ((ItemData[tmp].type & 3) == 1)) {
		DisplayText(&BattleActionTable[5].text[0]);
		BattleActionTable[5].func();
	} else {
		DisplayText(&BattleActionTable[4].text[0]);
		BattleActionTable[4].func();
	}
	ClearBlinkingPrompt();
}

/// $C1E00F
void BattleActionSwitchArmor() {
	EnableBlinkingTriangle(1);
	if (UnknownC3EE14(currentAttacker.id, currentAttacker.currentActionArgument) != 0) {
		short x16 = cast(short)(currentAttacker.defense - currentAttacker.baseDefense);
		short x04 = cast(short)(currentAttacker.speed - currentAttacker.baseSpeed);
		short x02 = cast(short)(currentAttacker.luck - currentAttacker.baseLuck);
		EquipItem(currentAttacker.id, currentAttacker.unknown7);
		DisplayText(TextBattleEquipXInstead.ptr);
		currentAttacker.baseDefense = PartyCharacters[currentAttacker.id - 1].defense;
		currentAttacker.defense = cast(short)(currentAttacker.baseDefense + x16);
		currentAttacker.baseSpeed = PartyCharacters[currentAttacker.id - 1].speed;
		currentAttacker.speed = cast(short)(currentAttacker.baseSpeed + x04);
		currentAttacker.baseLuck = PartyCharacters[currentAttacker.id - 1].luck;
		currentAttacker.luck = cast(short)(currentAttacker.baseLuck + x02);
		currentAttacker.fireResist = CalcPSIDamageModifiers(PartyCharacters[currentAttacker.id - 1].fireResist);
		currentAttacker.freezeResist = CalcPSIDamageModifiers(PartyCharacters[currentAttacker.id - 1].freezeResist);
		currentAttacker.flashResist = CalcPSIResistanceModifiers(PartyCharacters[currentAttacker.id - 1].flashResist);
		currentAttacker.paralysisResist = CalcPSIResistanceModifiers(PartyCharacters[currentAttacker.id - 1].paralysisResist);
		currentAttacker.hypnosisResist = CalcPSIResistanceModifiers(PartyCharacters[currentAttacker.id - 1].hypnosisBrainshockResist);
		currentAttacker.brainshockResist = CalcPSIResistanceModifiers(cast(ubyte)(3 - PartyCharacters[currentAttacker.id - 1].hypnosisBrainshockResist));
	} else {
		DisplayText(TextBattleCouldNotEquipAttackAnyway.ptr);
	}
	ClearBlinkingPrompt();
}

/// $C1E1A5
short EnemySelectMode(short arg1) {
	short x16;
	short x24 = arg1;
	SetInstantPrinting();
	CreateWindowN(Window.TextBattle);
	short x1C = 1;
	short x1A = 1;
	outer: while (true) {
		SetInstantPrinting();
		UnknownC438A5(WindowStats[WindowTable[Window.TextBattle]].text_x, WindowStats[WindowTable[Window.TextBattle]].text_y);
		short x02 = UnknownC10D7C(x24);
		ubyte* x18 = &Unknown7E895A[7 - x02];
		for (short i = 3; i > x02; i--) {
			version(bugfix) {
				PrintLetter((i == x1C) ? EBChar('0') : EBChar('0'));
			} else {
				PrintLetter((i == x1C) ? 0x10 : 0x30);
			}
		}
		for (short i = x02; i != 0; i--) {
			version(bugfix) {
				PrintLetter(((i == x1C) ? EBChar('0') : EBChar('0')) + (x18++)[0]);
			} else {
				PrintLetter(((i == x1C) ? 0x10 : 0x30) + (x18++)[0]);
			}
		}
		ClearInstantPrinting();
		WindowTick();
		while (true) {
			WindowTick();
			if (((pad_press[0] & PAD_LEFT) != 0) && (x1C < 3)) {
				x1C++;
				x1A *= 10;
				continue;
			} else if (((pad_press[0] & PAD_RIGHT) != 0) && (x1C > 1)) {
				x1C--;
				x1A /= 10;
				continue;
			} else if ((pad_held[0] & PAD_UP) != 0) {
				if ((x24 / x1A) % 10 != 9) {
					x24 += x1A;
				} else {
					x24 -= x1A * 9;
				}
				break;
			} else if ((pad_held[0] & PAD_DOWN) != 0) {
				if ((x24 / x1A) % 10 != 0) {
					x24 -= x1A;
				} else {
					x24 += x1A * 9;
				}
				break;
			} else if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
				x16 = x24;
				break outer;
			} else if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
				x16 = arg1;
				break outer;
			}
		}
		if (x24 == 0) {
			continue outer;
		}
		if (x24 > 482) {
			x24 = 482;
		}
		CurrentBattleGroup = x24;
		const(BattleGroupEnemy)* x06 = &BattleEntryPointerTable[x24].enemies[0];
		EnemiesInBattle = 0;
		while (x06[0].count != 0xFF) {
			short x14 = x06[0].count;
			while (x14-- != 0) {
				Unknown7E9F8C[EnemiesInBattle++] = x06[0].enemyID;
			}
			x06++;
		}
		UnknownC08726();
		UnknownC2EEE7();
		for (short i = 8; i < BattlersTable.length; i++) {
			memset(&BattlersTable[i], 0, Battler.sizeof);
		}
		for (short i = 0; i < EnemiesInBattle; i++) {
			BattleInitEnemyStats(Unknown7E9F8C[i], &BattlersTable[8 + i]);
		}
		UnknownC2F121();
		UnknownC0856B(0x18);
		UnknownC08744();
		FadeIn(1, 1);
	}
	SetWindowFocus(Window.TextBattle);
	CloseFocusWindow();
	return x16;
}

/// $C1E48D
short UnknownC1E48D(short arg1, short arg2, short arg3) {
	SetInstantPrinting();
	SetWindowFocus(arg1);
	short x0E = UnknownC442AC(arg1, arg2, arg3);
	SetWindowFocus(Window.FileSelectNamingKeyboard);
	return x0E;
}

/// $C1E4BE
short UnknownC1E4BE(short arg1, short arg2, short arg3) {
	SetInstantPrinting();
	CreateWindowN(arg1);
	short x10 = (4 > arg2) ? 5 : 6;
	UnknownC441B7(x10);
	UnknownC438A5(0, WindowStats[WindowTable[CurrentFocusWindow]].text_y);
	short x12 = (arg3 == 6) ? 0 : cast(short)(arg3 + 1);
	for (short i = 0; dontCareNames[arg2][x12][i] != 0; i++) {
		UnknownC442AC(arg1, x10, dontCareNames[arg2][x12][i]);
	}
	SetWindowFocus(Window.FileSelectNamingKeyboard);
	return x12;
}

/// $C1E57F
short TextInputDialog(short arg1, short arg2, ubyte* arg3, short arg4, short arg5) {
	short x24 = -1;
	short x22 = 0;
	short x20 = 0;
	short x1E = arg4;
	short x04;
	short x16;
	SetInstantPrinting();
	CreateWindowN(Window.FileSelectNamingKeyboard);
	if (arg5 == -1) {
		DisplayText(&NameInputWindowSelectionLayoutPointers[5][0]);
	} else {
		DisplayText(&NameInputWindowSelectionLayoutPointers[4][0]);
	}
	Unknown7E5E6D = 0;
	if (arg5 == -1) {
		DisplayText(&NameInputWindowSelectionLayoutPointers[2 + arg4][0]);
	} else {
		DisplayText(&NameInputWindowSelectionLayoutPointers[arg4][0]);
	}
	Unknown7E5E6D = 1;
	l0: while (true) {
		SetInstantPrinting();
		if (x1E != arg4) {
			CreateWindowN(Window.FileSelectNamingKeyboard);
			WindowTickWithoutInstantPrinting();
			if (arg5 == -1) {
				DisplayText(&NameInputWindowSelectionLayoutPointers[5][0]);
			} else {
				DisplayText(&NameInputWindowSelectionLayoutPointers[4][0]);
			}
			Unknown7E5E6D = 0;
			if (arg5 == -1) {
				DisplayText(&NameInputWindowSelectionLayoutPointers[2 + arg4][0]);
			} else {
				DisplayText(&NameInputWindowSelectionLayoutPointers[arg4][0]);
			}
			Unknown7E5E6D = 1;
		}
		l1: while (true) {
			ClearInstantPrinting();
			UnknownC438A5(x20, x22);
			Win_SetTextColor(1);
			UnknownC10D60(33);
			Win_SetTextColor(0);
			WindowTick();
			x04 = 1;
			l2: while (true) {
				x04 ^= 1;
				CopyToVram(0, 2, cast(ushort)((WindowStats[WindowTable[CurrentFocusWindow]].text_y * 2 + WindowStats[WindowTable[CurrentFocusWindow]].y) * 32 + WindowStats[WindowTable[CurrentFocusWindow]].x + WindowStats[WindowTable[CurrentFocusWindow]].text_x + 0x7C20), cast(const(ubyte)*)&arrC3E406[x04]);
				CopyToVram(0, 2, cast(ushort)((WindowStats[WindowTable[CurrentFocusWindow]].text_y * 2 + WindowStats[WindowTable[CurrentFocusWindow]].y) * 32 + WindowStats[WindowTable[CurrentFocusWindow]].x + WindowStats[WindowTable[CurrentFocusWindow]].text_x + 0x7C40), cast(const(ubyte)*)&arrC3E40A[x04]);
				for (short i = 0; 10 > i; i++) {
					UnknownC1004E();
					if ((pad_press[0] & PAD_UP) != 0) {
						x16 = MoveCursor(x20, x22, -1, 0, Sfx.Unknown7C, x20, WindowStats[WindowTable[CurrentFocusWindow]].height / 2);
						break l2;
					}
					if ((pad_press[0] & PAD_LEFT) != 0) {
						x16 = MoveCursor(x20, x22, 0, -1, Sfx.Unknown7B, WindowStats[WindowTable[CurrentFocusWindow]].width, x22);
						break l2;
					}
					if ((pad_press[0] & PAD_DOWN) != 0) {
						x16 = MoveCursor(x20, x22, 1, 0, Sfx.Unknown7C, x20, -1);
						break l2;
					}
					if ((pad_press[0] & PAD_RIGHT) != 0) {
						x16 = MoveCursor(x20, x22, 0, 1, Sfx.Unknown7B, -1, x22);
						break l2;
					}
					if ((pad_held[0] & PAD_UP) != 0) {
						x16 = UnknownC20B65(x20, x22, -1, 0, Sfx.Unknown7C);
					}
					if ((pad_held[0] & PAD_DOWN) != 0) {
						x16 = UnknownC20B65(x20, x22, 1, 0, Sfx.Unknown7C);
					}
					if ((pad_held[0] & PAD_LEFT) != 0) {
						x16 = UnknownC20B65(x20, x22, 0, -1, Sfx.Unknown7B);
					}
					if ((pad_held[0] & PAD_RIGHT) != 0) {
						x16 = UnknownC20B65(x20, x22, 0, 1, Sfx.Unknown7B);
					}
					if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
						if (x22 == 6) {
							switch (x20) {
								case 0: //don't care
									PlaySfx(Sfx.TextInput);
									x24 = UnknownC1E4BE(arg1, arg5, x24);
									continue l1;
								case 17: //backspace
									PlaySfx(Sfx.TextInput);
									if ((UnknownC1E48D(arg1, arg2, -1) != 0) && (arg5 != -1)) {
										return 1;
									}
									continue l1;
								case 19: //OK
									PlaySfx(Sfx.Unknown5E);
									goto Unknown42;
								default: break;
							}
						} else {
							PlaySfx(Sfx.TextInput);
							if (x22 == 4) {
								switch (x20) {
									case 0:
										arg4 = 0;
										continue l0;
									case 7:
										arg4 = 1;
										continue l0;
									default: break;
								}
							}
							UnknownC1E48D(arg1, arg2, GetCharacterAtCursorPosition(x20 / 2, x22, arg4));
						}
					} else if ((pad_press[0] & (PAD_B | PAD_SELECT)) != 0) {
						PlaySfx(Sfx.Unknown7D);
						if ((UnknownC1E48D(arg1, arg2, -1) != 0) && (arg5 != -1)) {
							return 1;
						}
					} else if ((pad_press[0] & PAD_START) != 0) {
						PlaySfx(Sfx.Unknown7E);
						goto Unknown42;
					}
				}
			}
			UnknownC438A5(x20, x22);
			UnknownC10D60(0x2F);
			if (x16 != -1) {
				x20 = x16 & 0xFF;
				x22 = x16 >> 8;
			}
			continue;
			Unknown42:
			if (strlen(cast(char*)&Unknown7E1B86[0]) != 0) {
				SetWindowFocus(arg1);
				short i;
				for(i = 0; (Unknown7E1B86[i] != 0) && (i < arg2); i++) {
					(arg3++)[0] = Unknown7E1B86[i];
				}
				for(; i < arg2; i++) {
					(arg3++)[0] = 0;
				}
				return 0;
			}
		}
	}
	assert(0); //unreachable
}

/// $C1EAA6
short EnterYourNamePlease(short arg1) {
	short result;
	Unknown7E5E6E = 0;
	Unknown7EB49D = 1;
	SetInstantPrinting();
	CreateWindowN(Window.Unknown27);
	if (arg1 != 0) {
		UnknownC438A5(0, 0);
		PrintString(24, &gameState.earthboundPlayerName[0]);
		UnknownC438A5(0, 1);
		UnknownC441B7(12);
		if (gameState.mother2PlayerName[0] != 0) {
			PrintString(12, &gameState.mother2PlayerName[0]);
		}
		UnknownC438A5(0, 1);
		result = TextInputDialog(Window.Unknown27, 12, &gameState.mother2PlayerName[0], 0, -1);
	} else {
		UnknownC438A5(0, 0);
		PrintString(26, &NameRegistryRequestString[0]);
		UnknownC08F8B();
		UnknownC438A5(0, 1);
		UnknownC441B7(24);
		UnknownC438A5(0, 1);
		if (gameState.earthboundPlayerName[0] != 0) {
			UnknownC440B5(&gameState.earthboundPlayerName[0], 24);
		}
		UnknownC438A5(0, 1);
		result = TextInputDialog(Window.Unknown27, 24, &gameState.earthboundPlayerName[0], 0, -1);
		UnknownC4D065(&Unknown7E9C9F[0], &gameState.earthboundPlayerName[0]);
		memcpy(&gameState.mother2PlayerName[0], &Unknown7E9C9F[0], 12);
	}
	CloseWindow(Window.FileSelectNamingKeyboard);
	CloseWindow(Window.Unknown27);
	Unknown7E5E6E = 0xFF;
	Unknown7EB49D = 0;
	return result;
}

/// $C1EC04
short NameACharacter(short arg1, ubyte* arg2, short arg3, const(ubyte)* arg4, short arg5) {
	CreateWindowN(Window.FileSelectNamingNameBox);
	WindowTickWithoutInstantPrinting();
	if (arg2[0] != 0) {
		UnknownC440B5(arg2, arg1);
	} else {
		UnknownC441B7(arg1);
	}
	UnknownC438A5(0, 0);
	CreateWindowN(Window.FileSelectNamingMessage);
	WindowTickWithoutInstantPrinting();
	PrintString(arg5, arg4);
	CC1314(1, 0);
	short x14 = TextInputDialog(0x1A, arg1, arg2, 0, arg3);
	CloseWindow(Window.FileSelectNamingKeyboard);
	return x14;
}

/// $C1EC8F
void UnknownC1EC8F(short arg1) {
	ubyte x00 = gameState.textFlavour;
	gameState.textFlavour = cast(ubyte)arg1;
	LoadWindowGraphics();
	UnknownC44963(2);
	UnknownC47F87();
	Unknown7E0030 = 0x18;
	gameState.textFlavour = x00;
}

/// $C1ECD1
void UnknownC1ECD1(short arg1) {
	UnknownC1EC8F(arg1 >> 8);
}

/// $C1ECDC
void CorruptionCheck() {
	if (Unknown7E9F79 == 0) {
		return;
	}
	UnknownC20A20(&Unknown7E9C8A);
	CreateWindowN(Window.Unknown2f);
	for (short i = 0; 3 > i; i++) {
		if ((UnknownEF05A6[i] & Unknown7E9F79) == 0) {
			continue;
		}
		UnknownC1AD0A(i + 1);
		DisplayText(TextSaveFileLost.ptr);
	}
	CloseFocusWindowN();
	Unknown7E9F79 = 0;
	UnknownC20ABC(&Unknown7E9C8A);
}

/// $C1ED5B
short FileSelectMenu(short arg1) {
	short x1C;
	CreateWindowN(Window.FileSelectMain);
	for (short i = 0; i < 3; i++, UnknownC115F4(x1C | i, &Unknown7E9C9F[0], null)) {
		LoadGameSlot(i);
		if (gameState.favouriteThing[1] != 0) {
			memset(&Unknown7E9C9F[0], 0, 0x20);
			Unknown7E9C9F[0] = cast(ubyte)(EBChar('1') + i);
			Unknown7E9C9F[1] = EBChar(':');
			Unknown7E9C9F[2] = EBChar(' ');
			for (short j = 0; j < PartyCharacter.name.length; j++) {
				if ((PartyCharacters[0].name[j] == 0) || (j >= PartyCharacter.name.length)) {
					Unknown7E9C9F[j + 3] = 0;
				} else if (j < PartyCharacter.name.length) {
					Unknown7E9C9F[j + 3] = PartyCharacters[0].name[j];
				}
			}
			Unknown7EB49E[i] = 1;
			x1C = cast(short)(gameState.textFlavour << 8);
		} else {
			Unknown7E9C9F[0] = cast(ubyte)(EBChar('1') + i);
			memcpy(&Unknown7E9C9F[1], &FileSelectTextStartNewGame[0], FileSelectTextStartNewGame.length);
			Unknown7E9C9F[17] = 0;
			Unknown7EB49E[i] = 0;
			x1C = 0x100;
		}
	}
	UnknownC1180D(1, 0, 0);
	for (short i = 0; i < 3; i++) {
		LoadGameSlot(i);
		if (gameState.favouriteThing[1] != 0) {
			memcpy(&Unknown7E9C9F[0], &FileSelectTextLevel[0], FileSelectTextLevel.length);
			Unknown7E9C9F[6] = 0;
			UnknownC438A5(9, i);
			PrintString(0x20, &Unknown7E9C9F[0]);
			Unknown7E9C9F[0] = cast(ubyte)(Unknown7E895A[7 - UnknownC10D7C(PartyCharacters[0].level)] + EBChar('0'));
			Unknown7E9C9F[1] = cast(ubyte)(Unknown7E895A[6] + EBChar('0'));
			Unknown7E9C9F[2] = 0;
			UnknownC438A5(13, i);
			PrintString(0x20, &Unknown7E9C9F[0]);
			memcpy(&Unknown7E9C9F[0], &FileSelectTextTextSpeed[0], FileSelectTextTextSpeed.length);
			Unknown7E9C9F[11] = EBChar(' ');
			memcpy(&Unknown7E9C9F[12], &FileSelectTextTextSpeedStrings[gameState.textSpeed - 1][0], FileSelectTextTextSpeedStrings[gameState.textSpeed - 1].length);
			UnknownC438A5(16, i);
			PrintString(0x20, &Unknown7E9C9F[0]);
		}
	}
	if (arg1 != 0) {
		MenuOpt* x1C_2 = &MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option];
		for (short i = cast(short)(CurrentSaveSlot - 1); i != 0; i--) {
			x1C_2 = &MenuOptions[x1C_2.next];
		}
		Win_SetTextColor(6);
		UnknownC438A5(cast(short)(x1C_2.text_x + 1), x1C_2.text_y);
		Unknown7E5E6E = 0;
		UnknownC43B15();
		Win_SetTextColor(0);
	} else {
		CorruptionCheck();
		while (Unknown7E0028 != 0) {}
		ChangeMusic(Music.SetupScreen);
		UnknownC11F5A(&UnknownC1ECD1);
		CurrentSaveSlot = cast(ubyte)SelectionMenu(1);
		UnknownC11F8A();
	}
	LoadGameSlot(cast(short)(CurrentSaveSlot - 1));
	return CurrentSaveSlot;
}

/// $C1F07E
short UnknownC1F07E() {
	CreateWindowN(Window.FileSelectMenu);
	UnknownC1153B(1, 0, 0, &FileSelectTextContinue[0], null);
	for (short i = 0; 3 > i; i++) {
		if (CurrentSaveSlot -1 == i) {
			continue;
		}
		if (Unknown7EB49E[i] != 0) {
			continue;
		}
		UnknownC1153B(2, 6, 0, &FileSelectTextCopy[0], null);
	}
	UnknownC1153B(3, 10, 0, &FileSelectTextDelete[0], null);
	UnknownC1153B(4, 15, 0, &FileSelectTextSetUp[0], null);
	PrintMenuItems();
	Unknown7E5E6E = 0xFF;
	return SelectionMenu(1);
}

/// $C3F090
immutable ubyte[8][4] PSICategories = [
	EBString!8("Offense"),
	EBString!8("Defense"),
	EBString!8("Assist"),
	EBString!8("Other"),
];

/// $C3F0B0
immutable short[7][7] UnknownC3F0B0 = [
	[
		1, //Unconscious
		1, //Diamondized
		0, //Paralyzed
		0, //Nauseous
		0, //Poisoned
		0, //Sunstroke
		0, //Cold
	], [
		0, //Mushroomized
		0, //Possessed
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
	], [
		1, //Asleep
		0, //Crying
		0, //Immobilized
		1, //Solidified
		0, //Unused
		0, //Unused
		0, //Unused
	], [
		0, //Feeling strange
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
	], [
		1, //Can't concentrate
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
	], [
		0, //Homesick
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
	], [
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
		0, //Unused
	]
];

/// $C1F14F
short UnknownC1F14F() {
	short y;
	for (short i = 0; 3 > i; i++) {
		if (Unknown7EB49E[i] == 0) {
			y++;
		}
	}
	if (y == 1) {
		CreateWindowN(Window.FileSelectCopyMenuOneFile);
		SetInstantPrinting();
		PrintString(FileSelectTextCopyToWhere.length, &FileSelectTextCopyToWhere[0]);
		for (short i = 0; 3 > i; i++) {
			if (Unknown7EB49E[i] == 0) {
				Unknown7E9C9F[0] = cast(ubyte)(EBChar('1') + i);
				Unknown7E9C9F[1] = EBChar(':');
				Unknown7E9C9F[2] = 0;
				UnknownC1153B(cast(short)(i + 1), 0, 1, &Unknown7E9C9F[0], null);
			}
		}
	} else {
		CreateWindowN(Window.FileSelectCopyMenuTwoFiles);
		SetInstantPrinting();
		PrintString(FileSelectTextCopyToWhere.length, &FileSelectTextCopyToWhere[0]);
		short x04 = 1;
		for (short i = 0; 3 > i; i++) {
			if (Unknown7EB49E[i] == 0) {
				Unknown7E9C9F[0] = cast(ubyte)(EBChar('1') + i);
				Unknown7E9C9F[1] = EBChar(':');
				Unknown7E9C9F[2] = 0;
				UnknownC1153B(cast(short)(i + 1), 0, x04++, &Unknown7E9C9F[0], null);
			}
		}
	}
	PrintMenuItems();
	short x16 = SelectionMenu(1);
	if (x16 != 0) {
		CopySaveSlot(cast(short)(x16 - 1), cast(short)(CurrentSaveSlot - 1));
	}
	Unknown7E5E6E = 0;
	CloseFocusWindowN();
	return x16;
}

/// $C1F2A8
short UnknownC1F2A8() {
	CreateWindowN(Window.FileSelectDeleteConfirmation);
	SetInstantPrinting();
	UnknownC10EB4(0);
	UnknownC438A5(0, 0);
	PrintString(FileSelectTextAreYouSureDelete.length, &FileSelectTextAreYouSureDelete[0]);
	UnknownC43D75(0, 1);
	UnknownC438A5(0, 1);
	PrintNumber(CurrentSaveSlot);
	PrintLetter(EBChar(':'));
	UnknownC438A5(2, 1);
	UnknownC1931B(1);
	UnknownC438A5(8, 1);
	PrintString(FileSelectTextLevel.length, &FileSelectTextLevel[0]);
	UnknownC438A5(12, 1);
	PrintNumber(PartyCharacters[0].level);
	UnknownC1153B(0, 0, 2, &FileSelectTextAreYouSureDeleteNo[0], null);
	UnknownC1153B(1, 0, 3, &FileSelectTextAreYouSureDeleteYes[0], null);
	PrintMenuItems();
	short x16 = SelectionMenu(1);
	if (x16 != 0) {
		EraseSaveSlot(CurrentSaveSlot - 1);
	}
	Unknown7E5E6E = 0;
	CloseFocusWindowN();
	return x16;
}

/// $C1F3C2
void OpenTextSpeedMenu() {
	CreateWindowN(Window.FileSelectTextSpeed);
	SetInstantPrinting();
	PrintString(FileSelectTextSelectTextSpeed.length, &FileSelectTextSelectTextSpeed[0]);
	UnknownC114B1(0, 1, &FileSelectTextTextSpeedStrings[0][0], null);
	UnknownC114B1(0, 2, &FileSelectTextTextSpeedStrings[1][0], null);
	UnknownC114B1(0, 3, &FileSelectTextTextSpeedStrings[2][0], null);
	UnknownC11887(gameState.textSpeed != 0 ? gameState.textSpeed - 1 : 1);
}

/// $C1F497
short UnknownC1F497(short arg1) {
	short x12;
	CurrentFocusWindow = Window.FileSelectTextSpeed;
	SetInstantPrinting();
	if (arg1 != 0) {
		OpenTextSpeedMenu();
		MenuOpt* x14 = &MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option];
		for (short i = cast(short)(gameState.textSpeed - 1); i != 0; i--) {
			x14 = &MenuOptions[MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option].next];
		}
		Win_SetTextColor(6);
		UnknownC438A5(cast(short)(x14.text_x + 1), x14.text_y);
		UnknownC43BB9(-1, 1, &x14.label[0]);
		Win_SetTextColor(0);
		x12 = gameState.textSpeed;
	} else {
		Unknown7E5E6E = 0;
		x12 = SelectionMenu(1);
		if (x12 != 0) {
			gameState.textSpeed = cast(ubyte)x12;
			SaveGameSlot(cast(short)(CurrentSaveSlot - 1));
		}
	}
	return x12;
}

/// $C1F568
void OpenSoundMenu() {
	CreateWindowN(Window.FileSelectMusicMode);
	SetInstantPrinting();
	PrintString(FileSelectTextSelectSoundSetting.length, &FileSelectTextSelectSoundSetting[0]);
	UnknownC114B1(0, 1, &FileSelectTextSoundSettingStrings[0][0], null);
	UnknownC114B1(0, 2, &FileSelectTextSoundSettingStrings[1][0], null);
	UnknownC11887(gameState.soundSetting != 0 ? gameState.soundSetting - 1 : 0);
}

/// $C1F616
short UnknownC1F616(short arg1) {
	short x12;
	CurrentFocusWindow = Window.FileSelectMusicMode;
	SetInstantPrinting();
	if (arg1 != 0) {
		OpenSoundMenu();
		MenuOpt* x14 = &MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option];
		for (short i = gameState.soundSetting; i != 0; i--) {
			x14 = &MenuOptions[MenuOptions[WindowStats[WindowTable[CurrentFocusWindow]].current_option].next];
		}
		Win_SetTextColor(6);
		UnknownC438A5(cast(short)(x14.text_x + 1), x14.text_y);
		UnknownC43BB9(-1, 1, &x14.label[0]);
		Win_SetTextColor(0);
		x12 = gameState.soundSetting;
	} else {
		x12 = SelectionMenu(1);
		if (x12 != 0) {
			gameState.soundSetting = cast(ubyte)x12;
		}
		SaveGameSlot(cast(short)(CurrentSaveSlot - 1));
	}
	return x12;
}

/// $C1F6E3
short OpenFlavourMenu() {
	CreateWindowN(Window.FileSelectFlavourChoice);
	SetInstantPrinting();
	PrintString(FileSelectTextWhichStyle.length, &FileSelectTextWhichStyle[0]);
	UnknownC114B1(0, 2, &FileSelectTextFlavorPlain[0], null);
	UnknownC114B1(0, 3, &FileSelectTextFlavorMint[0], null);
	UnknownC114B1(0, 4, &FileSelectTextFlavorStrawberry[0], null);
	UnknownC114B1(0, 5, &FileSelectTextFlavorBanana[0], null);
	UnknownC114B1(0, 6, &FileSelectTextFlavorPeanut[0], null);
	if (gameState.textFlavour == 0) {
		gameState.textFlavour = 1;
	}
	UnknownC11887(gameState.textFlavour - 1);
	UnknownC11F5A(&UnknownC1EC8F);
	short x16 = SelectionMenu(1);
	if (x16 != 0) {
		gameState.textFlavour = cast(ubyte)x16;
	} else {
		UnknownC1EC8F((gameState.textFlavour != 0) ? gameState.textFlavour : 1);
	}
	SaveGameSlot(CurrentSaveSlot - 1);
	return x16;
}

/// $C1F805
void FileMenuLoop() {
	outermost: while (true) {
		SetInstantPrinting();
		if (Unknown7EB49E[FileSelectMenu(0) - 1] != 0) {
			ValidFileSelected:
			switch (UnknownC1F07E()) {
				case 0: //B pressed
					CloseFocusWindow();
					continue;
				case 1: //Start Game
					UnknownC064D4();
					UnknownC07213();
					RespawnX = gameState.leaderX.integer;
					RespawnY = gameState.leaderY.integer;
					break outermost;
				case 2: //Copy
					if (UnknownC1F14F() == 0) {
						goto ValidFileSelected;
					}
					break;
				case 3: //Delete
					if (UnknownC1F2A8() == 0) {
						goto ValidFileSelected;
					}
					break;
				case 4: //Setup
					OpenTextSpeedMenu();
					while (true) {
						if (UnknownC1F497(0) == 0) {
							CloseWindow(0x18);
							goto ValidFileSelected;
						}
						OpenSoundMenu();
						while (true) {
							if (UnknownC1F616(0) == 0) {
								CloseWindow(0x19);
								break;
							}
							if (OpenFlavourMenu() == 0) {
								CloseWindow(0x32);
							}
						}
					}
					break;
				default: break;
			}
			UnknownC1008E();
		} else {
			OpenTextSpeedMenu();
			while (true) {
				if (UnknownC1F497(0) == 0) {
					CloseWindow(0x18);
					break;
				}
				OpenSoundMenu();
				while (true) {
					if (UnknownC1F616(0) == 0) {
						CloseWindow(0x19);
						break;
					}
					Unknown16:
					if (OpenFlavourMenu() == 0) {
						CloseWindow(0x32);
					} else {
						ChangeMusic(Music.NamingScreen);
						nameLoop: while (true) {
							UnknownC1008E();
							short x20;
							for (short i = 0; 7 > i; UnknownC4D830(i), i += x20) {
								if (i == -1) {
									UnknownC1008E();
									FileSelectMenu(1);
									UnknownC1F497(1);
									UnknownC1F616(1);
									ChangeMusic(Music.SetupScreen);
									goto Unknown16;
								}
								DisplayAnimatedNamingSprite(i);
								if (ThingsToName.Dog <= i) {
									if (NameACharacter(PartyCharacter.name.length, &PartyCharacters[i].name[0], i, &FileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
										x20 = -1;
										continue;
									}
									x20 = 1;
									continue;
								}
								if (i == ThingsToName.Dog) {
									if (NameACharacter(gameState.petName.length, &gameState.petName[0], i, &FileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
										x20 = -1;
										continue;
									}
									x20 = 1;
									continue;
								}
								if (i == ThingsToName.FavoriteFood) {
									if (NameACharacter(gameState.favouriteFood.length, &gameState.favouriteFood[0], i, &FileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
										x20 = -1;
										continue;
									}
									x20 = 1;
									continue;
								}
								if (i == ThingsToName.FavoriteThing) {
									if (NameACharacter(gameState.favouriteThing.length, &gameState.favouriteThing[4], i, &FileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
										x20 = -1;
										continue;
									}
									x20 = 1;
									continue;
								}
							}
							UnknownC1008E();
							SetInstantPrinting();
							for (short i = 0; 4 > i; i++, UnknownC1931B(i)) {
								CreateWindowN(cast(short)(Window.FileSelectNamingConfirmationNess + i));
							}
							CreateWindowN(Window.FileSelectNamingConfirmationKing);
							UnknownC1931B(7);
							CreateWindowN(Window.FileSelectNamingConfirmationFood);
							PrintString(FileSelectTextFavoriteFood.length, &FileSelectTextFavoriteFood[0]);
							short x = UnknownC44FF3(cast(short)strlen(cast(char*)&gameState.favouriteFood[0]), 0, &gameState.favouriteFood[0]);
							UnknownC438A5(cast(short)((((x % 8) != 0) || ((x / 8) == 6) ? ((x / 8) + 1) : (x / 8)) - WindowStats[WindowTable[Window.FileSelectNamingConfirmationFood]].width), 1);
							PrintString(cast(short)strlen(cast(char*)&gameState.favouriteFood[0]), &gameState.favouriteFood[0]);

							CreateWindowN(Window.FileSelectNamingConfirmationThing);
							PrintString(FileSelectTextCoolestThing.length, &FileSelectTextCoolestThing[0]);
							x = UnknownC44FF3(cast(short)strlen(cast(char*)&gameState.favouriteThing[4]), 0, &gameState.favouriteThing[4]);
							UnknownC438A5(cast(short)((((x % 8) != 0) || ((x / 8) == 6) ? ((x / 8) + 1) : (x / 8)) - WindowStats[WindowTable[Window.FileSelectNamingConfirmationThing]].width), 1);
							PrintString(cast(short)strlen(cast(char*)&gameState.favouriteThing[4]), &gameState.favouriteThing[4]);

							CreateWindowN(Window.FileSelectNamingConfirmationMessage);
							PrintString(FileSelectTextAreYouSure.length, &FileSelectTextAreYouSure[0]);

							UnknownC1153B(1, 14, 0, &FileSelectTextAreYouSureYep[0], null);
							UnknownC1153B(0, 18, 0, &FileSelectTextAreYouSureNope[0], null);
							PrintMenuItems();
							UnknownC4D8FA();
							Unknown7E5E6E = 0xFF;
							if (SelectionMenu(1) == 0) {
								UnknownC021E6();
								continue nameLoop;
							}
							ChangeMusic(Music.NameConfirmation);
							WindowTick();
							for (short i = 0; 180 > i; i++) {
								UnknownC1004E();
							}
							UnknownC021E6();
							for (short i = 0; 4 > i; i++) {
								ResetCharLevelOne(cast(short)(i + 1), InitialStats[i].level, 0);
								if (InitialStats[i].exp != 0) {
									GainEXP(cast(short)(i + 1), 0, InitialStats[i].exp);
								}
								PartyCharacters[i].hp.target = PartyCharacters[i].hp.current.integer = PartyCharacters[i].maxHP;
								PartyCharacters[i].pp.target = PartyCharacters[i].pp.current.integer = PartyCharacters[i].maxPP;
								PartyCharacters[i].pp.current.fraction = 0;
								PartyCharacters[i].hp.current.fraction = 0;
								memset(&PartyCharacters[i].items[0], 0, PartyCharacter.items.length);
								memcpy(&PartyCharacters[i].items[0], &InitialStats[i].items[0], PartyCharacter.items.length);
								PartyCharacters[i].hp_pp_window_options = 0x400;
							}
							gameState.moneyCarried = InitialStats[0].money;
							UnknownC0B65F(InitialStats[0].unknown0, InitialStats[0].unknown2);
							gameState.favouriteThing[0] = EBChar('P');
							gameState.favouriteThing[1] = EBChar('S');
							gameState.favouriteThing[2] = EBChar('I');
							gameState.favouriteThing[3] = EBChar(' ');
							for (short i = 4; gameState.favouriteThing.length - 1 > i; i++) {
								if (gameState.favouriteThing[i] == 0) {
									gameState.favouriteThing[i] = EBChar(' ');
									break;
								}
							}
							gameState.unknownC3 = 1;
							RespawnX = gameState.leaderX.integer;
							RespawnY = gameState.leaderY.integer;
							UnknownC064D4();
							UnknownC0B65F(0x840, 0x6E8);
							UnknownC46881(TextFileSelectScreen1.ptr);
							setEventFlag(EventFlag.UNKNOWN_00B, 1);
							ShowNPCFlag = 1;
							break outermost;
						}
					}
				}
			}
		}
	}
	UnknownC1008E();
	Unknown7E9627 = UnknownC3FB1F[gameState.textSpeed - 1];
	SelectedTextSpeed = cast(ushort)(gameState.textSpeed - 1);
	Unknown7E964B = (gameState.textSpeed == 3) ? 0 : 30;
	Unknown7E5DBA = 0;
	DisplayText(TextFileSelectScreen2.ptr);
}

/// $C1FF2C
short UnknownC1FF2C() {
	short result;
	ubyte xX = 0;
	switch(ChosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0]) {
		case 1:
		case 2:
			xX = 1;
			goto default;
		default:
			result = 0;
			if (xX != Unknown7EB4A2) {
				result = 1;
			}
			break;
	}
	Unknown7EB4A2 = xX;
	return result;
}

/// $C1FF6B
short UnknownC1FF6B() {
	Unknown7E5E6E = 0;
	Unknown7EB49D = 1;
	FileMenuLoop();
	ClearInstantPrinting();
	WindowTick();
	Unknown7EB4B6 = 0;
	Unknown7EB4A2 = 0;
	Unknown7E5E6E = 0xFF;
	Unknown7EB49D = 0;
	return 0;
}

/// $C1FF99
void UnknownC1FF99(short arg1, short arg2, ubyte* arg3) {
	VWFX = cast(ushort)((arg2 *8 - UnknownC43E31(arg3, arg1)) / 2);
	VWFTile = VWFX / 8;
}
