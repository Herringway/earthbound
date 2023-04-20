/// mostly text code
module earthbound.bank01;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.bank08;
import earthbound.bank0F;
import earthbound.bank10;
import earthbound.bank15;
import earthbound.bank20;
import earthbound.bank2F;
import earthbound.globals;
import earthbound.text;

import core.stdc.string;
import std.experimental.logger;

/// $C10000
void unknownC10000() {
	hideHPPPWindows();
}

/// $C10004
void unknownC10004(const(ubyte)* arg1) {
	freezeEntities();
	displayText(arg1);
	do {
		windowTick();
	} while (unknown7EB4A8 != -1);
	unfreezeEntities();
}

/// $C10036
void enableBlinkingTriangle(ushort arg1) {
	blinkingTriangleFlag = arg1;
}

/// $C1003C
void clearBlinkingPrompt() {
	blinkingTriangleFlag = 0;
}

/// $C10042
short getBlinkingPrompt() {
	return blinkingTriangleFlag;
}

/// $C10048
void setTextSoundMode(ushort arg1) {
	textSoundMode = arg1;
}

/// $C1004E
void unknownC1004E() {
	if (unknown7E89C9 != 0) {
		unknownC3E450();
	}
	if (battleModeFlag != 0) {
		unknownC43568();
		return;
	}
	oamClear();
	runActionscriptFrame();
	updateScreen();
	waitUntilNextFrame();
}

/// $C1007E - Set the focused window
void setWindowFocus(short id) {
	currentFocusWindow = id;
}

/// $C10084
void closeFocusWindowN() {
	closeWindow(currentFocusWindow);
}

/// $C1008E
void closeAllWindows() {
	unknown7E5E70 = 1;
	while (windowTail != -1) {
		closeWindow(windowStats[windowTail].windowID);
	}
	clearInstantPrinting();
	windowTick();
	unknown7E5E70 = 0;
	unknownC43F53();
}

/// $C100C7
void lockInput() {
	inputLockFlag = 1;
}

/// $C100D0
void unlockInput() {
	inputLockFlag = 0;
}

/// $C100D6
void unknownC100D6(ushort arg1) {
	clearInstantPrinting();
	windowTick();
	while (--arg1 != 0) {
		unknownC12E42();
	}
}

/// $C100FE
void unknownC100FE(short arg1) {
	if ((debugging != 0) && (battleDebug == 0)) {
		while ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) == 0) {
			unknownC12E42();
		}
		return;
	}
	while (inputLockFlag != 0) {
		if (debugging == 0) {
			continue;
		}
		if ((padPress[0] & (Pad.b | Pad.r)) != (Pad.b | Pad.r)) {
			continue;
		}
		inputLockFlag = 0;
	}
	short x0E = (arg1 != 0) ? arg1 : unknown7E964B;
	while ((x0E-- != 0) && ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) == 0)) {
		unknownC12E42();
	}
}

/// $C10166 - CC [03], [13], [14] common code - halt parsing
void cc1314(short arg1, short arg2) {
	while (inputLockFlag) {
		if (debugging == 0) {
			continue;
		}
		if ((padPress[0] & (Pad.b | Pad.r)) == (Pad.b | Pad.r)) {
			inputLockFlag = 0;
			break;
		}
	}
	clearInstantPrinting();
	windowTick();
	if ((arg2 == 0) && (blinkingTriangleFlag != 0) &&(unknown7E964B != 0)) {
		unknownC100FE(0);
		return;
	}
	if (blinkingTriangleFlag != 0) {
		pauseMusic();
	}
	if (arg1 == 0) {
		while ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) == 0) {
			unknownC12E42();
		}
	} else {
		outer: while (true) {
			copyToVRAM(0, 2, cast(short)(0x7C20 + windowStats[windowTable[currentFocusWindow]].width + windowStats[windowTable[currentFocusWindow]].x + (windowStats[windowTable[currentFocusWindow]].y + windowStats[windowTable[currentFocusWindow]].height) * 32), cast(const(ubyte)*)&blinkingTriangleTiles[0]);
			for (short i = 15; i != 0; i--) {
				if ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) != 0) {
					break outer;
				}
				unknownC12E42();
			}
			copyToVRAM(0, 2, cast(short)(0x7C20 + windowStats[windowTable[currentFocusWindow]].width + windowStats[windowTable[currentFocusWindow]].x + (windowStats[windowTable[currentFocusWindow]].y + windowStats[windowTable[currentFocusWindow]].height) * 32), cast(const(ubyte)*)&blinkingTriangleTiles[1]);
			for (short i = 10; i != 0; i--) {
				if ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) != 0) {
					break outer;
				}
				unknownC12E42();
			}
		}
		copyToVRAM(0, 2, cast(short)(0x7C20 + windowStats[windowTable[currentFocusWindow]].width + windowStats[windowTable[currentFocusWindow]].x + (windowStats[windowTable[currentFocusWindow]].y + windowStats[windowTable[currentFocusWindow]].height) * 32), cast(const(ubyte)*)&blinkingTriangleTiles[2]);
	}
	resumeMusic();
}

/// $C102D0
void unknownC102D0() {
	unknown7E9641 = 0;
	clearInstantPrinting();
	windowTick();
	while (unknown7E9641 == 0) {
		if ((debugging != 0) && ((padState[0] & Pad.start) != 0) && ((padState[0] & Pad.select) != 0)) {
			return;
		}
		unknownC1004E();
	}
	unknown7E9641 = 0;
}

/// $C10301
WinStat* getActiveWindowAddress() {
	if (windowHead == -1) {
		return &unknown7E85FE;
	}
	return &windowStats[windowTable[currentFocusWindow]];
}

/// $C10324
void transferActiveMemStorage() {
	WinStat* x0E = getActiveWindowAddress();
	x0E.resultBak = x0E.result;
	x0E.argumentBak = x0E.argument;
	x0E.counterBak = x0E.counter;
}

/// $C10380
void transferStorageMemActive() {
	WinStat* x0E = getActiveWindowAddress();
	x0E.result = x0E.resultBak;
	x0E.argument = x0E.argumentBak;
	x0E.counter = x0E.counterBak;
}

/// $C103DC
uint getArgumentMemory() {
	return getActiveWindowAddress().argument;
}

/// $C10400
ushort getSecondaryMemory() {
	return getActiveWindowAddress().counter;
}

/// $C1040A
WorkingMemory getWorkingMemory() {
	return getActiveWindowAddress().result;
}

/// $C1042E
void incrementSecondaryMemory() {
	getActiveWindowAddress().counter++;
}

/// $C10443
ushort setSecondaryMemory(ushort arg1) {
	getActiveWindowAddress().counter = arg1;
	return arg1;
}

/// $C1045D
WorkingMemory setWorkingMemory(WorkingMemory arg1) {
	getActiveWindowAddress.result = arg1;
	return arg1;
}

/// $C10489
uint setArgumentMemory(uint arg1) {
	getActiveWindowAddress.argument = arg1;
	return arg1;
}

/// $C104B5
short getTextX() {
	if (currentFocusWindow == -1) {
		return 0;
	}
	return windowStats[windowTable[currentFocusWindow]].textX;
}

/// $C104D8
short getTextY() {
	return windowStats[windowTable[currentFocusWindow]].textY;
}

/// $C104EE
void createWindowN(short id) {
	WinStat* x10;
	if (windowTable[id] != -1) {
		currentFocusWindow = id;
		unknownC11383();
		x10 = &windowStats[windowTable[id]];
	} else {
		short x0E = unknownC3E4EF();
		if (x0E == -1) {
			return;
		}
		x10 = &windowStats[x0E];
		if (id == 10) {
			if (windowHead == -1) {
				x10.next = -1;
				windowTail = x0E;
			} else {
				windowStats[windowHead].prev = x0E;
				x10.next = windowHead;
			}
			x10.prev = -1;
			windowHead = x0E;
		} else {
			if (windowHead == -1) {
				x10.prev = -1;
				windowHead = x0E;
			} else {
				x10.prev = windowTail;
				windowStats[windowTail].next = x0E;
			}
			windowTail = x0E;
			x10.next = -1;
		}
		x10.windowID = id;
		windowTable[id] = x0E;
		x10.x = windowConfigurationTable[id].x;
		x10.y = windowConfigurationTable[id].y;
		x10.width = cast(short)(windowConfigurationTable[id].width - 2);
		x10.height = cast(short)(windowConfigurationTable[id].height - 2);
		x10.tilemapBuffer = &unknown7E5E7E[x0E][0];
		currentFocusWindow = id;
	}
	WinStat* x12 = getActiveWindowAddress();
	x10.textY = 0;
	x10.textX = 0;
	x10.numPadding = 0x80;
	x10.tileAttributes = 0;
	x10.font = 0;
	x10.result = x12.result;
	x10.argument = x12.argument;
	x10.resultBak = x12.resultBak;
	x10.argumentBak = x12.argumentBak;
	x10.counter = x12.counter;
	x10.counterBak = x12.counterBak;
	x10.selectedOption = -1;
	x10.optionCount = -1;
	x10.currentOption = -1;
	x10.menuColumns = 1;
	x10.menuPage = 1;
	x10.menuCallback = null;
	for (short i = cast(short)(x10.height * x10.width - 1); i >= 0; i--) {
		if (x10.tilemapBuffer[i] != 0) {
			freeTileSafe(x10.tilemapBuffer[i]);
		}
		x10.tilemapBuffer[i] = 0x40;
	}
	if (x10.titleID != 0) {
		unknown7E894E[x10.titleID - 1] = -1;
	}
	x10.title[0] = 0;
	x10.titleID = 0;
	unknownC45E96();
	unknown7E9623 = 1;
	unknownC07C5B();
}

/// $C1078D
void unknownC1078D() {
	copyToVRAMAlt(0, 0x240, 0x7E40, cast(ubyte*)&bg2Buffer[0x240]);
}

/// $C107AF - Draws a window
void unknownC107AF(short windowID) {
	ushort* x1E = &windowStats[windowID].tilemapBuffer[0];
	ushort* x18 = &bg2Buffer[windowStats[windowID].y * 32 + windowStats[windowID].x];
	short x1C = windowStats[windowID].width;
	short x04 = x1C;
	short x1A = windowStats[windowID].height;
	if ((x18[0] == 0) || (x18[0] == 0x3C10)) {
		(x18++)[0] = 0x3C10;
	} else {
		(x18++)[0] = 0x3C13;
	}
	if (windowStats[windowID].titleID != 0) {
		short x02 = cast(short)((windowStats[windowID].titleID - 1) * 16 + 0x2E0);
		(x18++)[0] = 0x3C16;
		short x12 = cast(short)(x1C - 1);
		for (short i = cast(short)(((strlen(cast(char*)&windowStats[windowID].title[0]) * 6) + 7) / 8); i != 0; i--) {
			(x18++)[0] = cast(ushort)(x02++ + 0x2000);
			x12--;
		}
		(x18++)[0] = 0x7C16;
		x04 = cast(short)(x12 - 1);
	}
	if ((windowStats[windowID].windowID == unknown7E5E7A) && (unknown7E5E7C != -1)) {
		x04 -= 4;
	}
	for (short i = x04; i != 0; i--) {
		(x18++)[0] = 0x3C11;
	}
	if ((windowStats[windowID].windowID == unknown7E5E7A) && (unknown7E5E7C != -1)) {
		for (short i = 0; i < 4; i++) {
			(x18++)[0] = paginationArrowTiles[unknown7E5E7C][i];
		}
	}
	if ((x18[0] == 0) || (x18[0] == 0x7C10)) {
		(x18++)[0] = 0x7C10;
	} else {
		(x18++)[0] = 0x7C13;
	}
	x18 += 32 - x1C - 2;
	for (short i = x1A; i != 0; i--) {
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
void showHPPPWindows() {
	unknownC3E6F8();
	unknown7E89C9 = 1;
	unknown7E9623 = 1;
	unknown7E9647 = -1;
}

/// $C10A1D
void hideHPPPWindows() {
	unknownC3E6F8();
	unknown7E89C9 = 0;
	if (battleModeFlag == 0) {
		for (short i = 0; i != gameState.playerControlledPartyMemberCount; i++) {
			undrawHPPPWindow(i);
			partyCharacters[gameState.partyMembers[i] - 1].hp.current.integer = partyCharacters[gameState.partyMembers[i] - 1].hp.target;
			partyCharacters[gameState.partyMembers[i] - 1].pp.current.integer = partyCharacters[gameState.partyMembers[i] - 1].pp.target;
			partyCharacters[gameState.partyMembers[i] - 1].hp.current.fraction = 0;
			partyCharacters[gameState.partyMembers[i] - 1].pp.current.fraction = 0;
		}
	}
	unknown7E9623 = 1;
}

/// $C10A85
void unknownC10A85(short arg1, short arg2, ushort arg3) {
	if (windowTable[arg1] == -1) {
		return;
	}
	short x10 = windowStats[windowTable[arg1]].textX;
	short x04 = windowStats[windowTable[arg1]].textY;
	if (arg3 == windowStats[windowTable[arg1]].width) {
		if (x04 != (windowStats[windowTable[arg1]].height / 2) - 1) {
			x04++;
		} else {
			unknownC437B8(arg1);
		}
		x10 = 0;
	}
	if ((blinkingTriangleFlag != 0) && (x10 == 0) && ((arg2 == 0x20) || (arg2 == 0x40))) {
		if (blinkingTriangleFlag == 1) {
			goto Unknown9;
		}
		if (blinkingTriangleFlag == 2) {
			arg2 = 0x20;
		}
	}
	windowStats[windowTable[arg1]].tilemapBuffer[(windowStats[windowTable[arg1]].width * x04 * 2) + x10] = cast(ushort)(((arg2 & 0xFFF0) * 2) + (arg2 & 0xF) + ((arg2 == 0x22) ? 0xC00 : arg3));
	windowStats[windowTable[arg1]].tilemapBuffer[(windowStats[windowTable[arg1]].width * x04 * 2) + x10 + windowStats[windowTable[arg1]].width] = cast(ushort)(((arg2 & 0xFFF0) * 2) + (arg2 & 0xF) + ((arg2 == 0x22) ? 0xC00 : arg3) + 0x10);
	x10++;
	Unknown9:
	windowStats[windowTable[arg1]].textX = x10;
	windowStats[windowTable[arg1]].textY = x04;
}

/// $C10BA1
void unknownC10BA1(short arg1) {
	if (currentFocusWindow == -1) {
		return;
	}
	unknownC10A85(currentFocusWindow, arg1, windowStats[windowTable[currentFocusWindow]].tileAttributes);
}

/// $C10BD3
void cc12() {
	clearCurrentTextLine(currentFocusWindow);
	moveCurrentTextCursor(0, windowStats[windowTable[currentFocusWindow]].textY);
}

/// $C10BFE
MenuOpt* unknownC10BFE(short arg1, short x, short y, const(ubyte)* label, string selectedText) {
	return unknownC1153B(arg1, x, y, label, selectedText);
}

/// $C10C49
short unknownC1138DF(short arg1) {
	return unknownC1138D(arg1);
}

/// $C10C55
short unknownC10C55(uint arg1) {
	return unknownC10D7C(arg1);
}

/// $C10C79
void printNewLineF() {
	printNewLine();
}

/// $C10C80
void unknownC10BA1F(short arg1) {
	unknownC10BA1(arg1);
}

/// $C10C86
void printLetterF(short arg1) {
	printLetter(arg1);
}

/// $C10C8C
void printStringF(short arg1, const(ubyte)* arg2) {
	printString(arg1, arg2);
}

/// $C10CAF
void unknownC437B8F(short arg1) {
	unknownC437B8(arg1);
}

/// $C10CB6
void printLetter(short arg1) {
	if (currentFocusWindow == -1) {
		return;
	}
	unknownC44E61(windowStats[windowTable[currentFocusWindow]].font, arg1);
	if (windowTable[currentFocusWindow] != windowTail) {
		unknown7E9623 = 1;
	}
	short x;
	if (textSoundMode == 2) {
		x = 1;
	} else if (textSoundMode == 3) {
		x = 0;
	} else {
		x = 0;
		if (blinkingTriangleFlag == 0) {
			x = 1;
		}
	}
	if ((x != 0) && (instantPrinting == 0) && (arg1 != 0x20) && (arg1 != ebChar(' '))) {
		playSfx(Sfx.textPrint);
	}
	if (instantPrinting == 0) {
		for (short i = cast(short)(selectedTextSpeed + (config.instantSpeedText ? 0 : 1)); i != 0; i--) {
			windowTick();
		}
	}
}

/// $C10D60 - Put a tile on the focused window -- How is this different from "PrintIcon" ($C43F77)?
void unknownC10D60(short tile) {
	unknownC10BA1(tile);
	if (windowTable[currentFocusWindow] != windowTail) {
		unknown7E9623 = 1;
	}
}

/// $C10D7C
short unknownC10D7C(uint arg1) {
	short result = 1;
	ubyte* x = &unknown7E895A[6];
	while (arg1 >= 10) {
		*(x--) = arg1 % 10;
		arg1 /= 10;
		result++;
	}
	x[0] = cast(ubyte)arg1;
	return result;
}

/// $C10DF6
void printNumber(uint arg1) {
	if (currentFocusWindow == -1) {
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
	short x14 = unknownC10D7C(arg1);
	ubyte* x12 = &unknown7E895A[7 - x14];
	byte x16 = windowStats[windowTable[currentFocusWindow]].numPadding;
	if (x16 >= 0) {
		short a = (x16 & 0xF) + 1;
		if (a < x14) {
			a = x14;
		}
		unknownC43D95(cast(short)((a - x14) * 6));
	}
	while (x14 != 0) {
		printLetter(*(x12++) + ebChar('0'));
		x14--;
	}
}

/// $C10EB4
void setCurrentWindowPadding(short arg1) {
	if (currentFocusWindow == -1) {
		return;
	}
	windowStats[windowTable[currentFocusWindow]].numPadding = cast(ubyte)arg1;
}

/// $C10EE3
void unknownC10EE3(short arg1) {
	switch (arg1) {
		case 1:
			unknownC12BF3();
			break;
		case 2:
			unknownC12C36();
			break;
		default: break;
	}
}

/// $C10EFC
void printString(short length, const(ubyte)* text) {
	if (unknown7E5E74 != 0) {
		unknownC43EF8(text, length);
	}
	while ((text[0] != 0) && (length != 0)) {
		length--;
		printLetter((text++)[0]);
	}
}

/// $C10F40
void unknownC10F40(short window) {
	if (window == -1) {
		return;
	}
	ushort* x0E = &windowStats[windowTable[window]].tilemapBuffer[0];
	for (short i = cast(short)(windowStats[windowTable[window]].height * windowStats[windowTable[window]].width); i != 0; i--) {
		if (x0E[0] != 0) {
			freeTileSafe(x0E[0]);
		}
		x0E[0] = 0x40;
		x0E++;
	}
	unknownC45E96();
	windowStats[windowTable[window]].textY = 0;
	windowStats[windowTable[window]].textX = 0;
}

/// $C10FA3 - Clears the focused window
void clearFocusWindow() {
	unknownC10F40(currentFocusWindow);
}

/// $C10FAC
void changeCurrentWindowFont(short arg1) {
	if (currentFocusWindow == -1) {
		return;
	}
	if (arg1 == 0x30) {
		arg1 = 0;
	} else {
		arg1 = 1;
	}
	windowStats[windowTable[currentFocusWindow]].font = arg1;
}

/// $C10FEA - Sets the text color for the focused window
void windowSetTextColor(short windowID) {
	if (currentFocusWindow == -1) {
		return;
	}
	windowStats[windowTable[currentFocusWindow]].tileAttributes = cast(ushort)(windowID * 0x400);
}

/// $C1101C
int numSelectPrompt(short arg1) {
	if (currentFocusWindow == -1) {
		return 0;
	}
	short x24 = windowStats[windowTable[currentFocusWindow]].textX;
	short x22 = windowStats[windowTable[currentFocusWindow]].textY;
	int x1E = 0;
	short x1C = 1;
	int x18 = 1;
	outer: while (true) {
		setInstantPrinting();
		moveCurrentTextCursor(x24, x22);
		short x02 = unknownC10D7C(x1E);
		ubyte* x04 = &unknown7E895A[7 - x02];
		short x16;
		for (x16 = arg1; x16 > x02; x16--) {
			unknownC43F77((x16 == x1C) ? baseNumberSelectorCharacter1 : baseNumberSelectorCharacter2);
		}
		for (; x16 != 0; x16--) {
			unknownC43F77((x04++)[0] + ((x16 == x1C) ? baseNumberSelectorCharacter1 : baseNumberSelectorCharacter2));
		}
		clearInstantPrinting();
		windowTick();
		while (true) {
			unknownC12E42();
			if (((padPress[0] & Pad.left) != 0) && (x1C < arg1)) {
				playSfx(Sfx.cursor2);
				x1C++;
				x18 *= 10;
				continue outer;
			} else if (((padPress[0] & Pad.right) != 0) && (x1C > 1)) {
				playSfx(Sfx.cursor2);
				x1C--;
				x18 /= 10;
				continue outer;
			} else if ((padHeld[0] & Pad.up) != 0) {
				playSfx(Sfx.cursor3);
				if ((x1E / x18) % 10 != 9) {
					x1E += x18;
				} else {
					x1E -= x18 * 9;
				}
				continue outer;
			} else if ((padHeld[0] & Pad.down) != 0) {
				playSfx(Sfx.cursor3);
				if ((x1E / x18) % 10 != 0) {
					x1E -= x18;
				} else {
					x1E += x18 * 9;
				}
				continue outer;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				playSfx(Sfx.cursor1);
				return x1E;
			} else if ((padPress[0] & (Pad.b | Pad.select)) != 0) {
				playSfx(Sfx.cursor2);
				return -1;
			}
		}
	}
	assert(0, "This should never be reached");
}

/// $C1134B - Opens the HP/PP and wallet windows
void openHpAndWallet() {
	showHPPPWindows();
	unknownC1AA18();
}

/// $C11354
short unknownC11354() {
	for (short i = 0; i < menuOptions.length; i++) {
		if (menuOptions[i].field00 == 0) {
			return i;
		}
	}
	return -1;
}

/// $C11383
void unknownC11383() {
	unknownC3E7E3(currentFocusWindow);
}

/// $C1138D
short unknownC1138D(short arg1) {
	if (arg1 == -1) {
		return 0;
	}
	short i = 1;
	for (MenuOpt* tmp = &menuOptions[arg1]; tmp.next != -1; tmp++) {
		i++;
	}
	return i;
}

/// $C113D1
MenuOpt* unknownC113D1(const(ubyte)* label, string selectedText) {
	if (currentFocusWindow == -1) {
		return &menuOptions[$ - 1];
	}
	short x10 = unknownC11354();
	if (x10 == -1) {
		return &menuOptions[$ - 1];
	}

	if (windowStats[windowTable[currentFocusWindow]].currentOption == -1) {
		menuOptions[x10].prev = -1;
		windowStats[windowTable[currentFocusWindow]].currentOption = x10;
	} else {
		menuOptions[x10].prev = windowStats[windowTable[currentFocusWindow]].optionCount;
		menuOptions[windowStats[windowTable[currentFocusWindow]].optionCount].next = x10;
	}
	windowStats[windowTable[currentFocusWindow]].optionCount = x10;
	menuOptions[x10].next = -1;
	menuOptions[x10].field00 = 1;
	menuOptions[x10].script = selectedText;
	menuOptions[x10].page = 1;
	menuOptions[x10].sfx = Sfx.cursor1;
	ubyte* x = &menuOptions[x10].label[0];
	do {
		(x++)[0] = label[0];
	} while ((label++)[0] != 0);
	return &menuOptions[x10];
}

/// $C114B1
MenuOpt* unknownC114B1(short x, short y, const(ubyte)* label, string selectedText) {
	MenuOpt* x16 = unknownC113D1(label, selectedText);
	x16.pixelAlign = 0;
	if (unknown7E5E71 != 0) {
		x16.pixelAlign = x & 7;
		x = x >> 3;
	}
	x16.textX = x;
	x16.textY = y;
	return x16;
}

/// $C1153B
MenuOpt* unknownC1153B(short arg1, short x, short y, const(ubyte)* label, string selectedText) {
	MenuOpt* X = unknownC114B1(x, y, label, selectedText);
	X.userdata = arg1;
	X.field00 = 2;
	return X;
}

/// $C11596
MenuOpt* unknownC11596(short arg1, short x, short y, const(ubyte)* arg4, string arg5, ubyte arg6) {
	MenuOpt* X = unknownC1153B(arg1, x, y, arg4, arg5);
	X.sfx = arg6;
	return X;
}

/// $C115F4
MenuOpt* unknownC115F4(short arg1, const(ubyte)* arg2, string arg3) {
	MenuOpt* x = unknownC113D1(arg2, arg3);
	x.userdata = arg1;
	x.field00 = 2;
	return x;
}

/// $C1163C - Prints the options into the focused window
void printMenuItems() {
	if (currentFocusWindow == -1) {
		return;
	}
	if (windowStats[windowTable[currentFocusWindow]].currentOption == -1) {
		unknown7E968C = 0xFF;
		return;
	}
	MenuOpt* x02 = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
	setInstantPrinting();
	while (true) {
		if (x02.page == windowStats[windowTable[currentFocusWindow]].menuPage) {
			unknownC43DDB(x02);
			if (x02.page == 0) {
				windowSetTextColor(0);
				unknownC43F77(0x14F);
				nextVWFTile();
				windowSetTextColor(0);
				ubyte* y = &windowStats[windowTable[currentFocusWindow]].title[0];
				if (y[0] != 0) {
					ubyte* x;
					for (x = &unknown7E9C9F[0]; (y[0] != 0) && (y[0] != ebChar('(')); x++) {
						x[0] = (y++)[0];
					}
					(x++)[0] = ebChar('(');
					(x++)[0] = cast(ubyte)(windowStats[windowTable[currentFocusWindow]].menuPage + ebChar('0'));
					(x++)[0] = ebChar(')');
					x[0] = 0;
					nextVWFTile();
					setWindowTitle(currentFocusWindow, -1, &unknown7E9C9F[0]);
					nextVWFTile();
					printString(cast(short)(strlen(cast(char*)&unknown7E9C9F[0]) - 2), &unknown7E9C9F[0]);
					printLetter((windowStats[windowTable[currentFocusWindow]].menuPage == menuOptions[menuOptions[windowStats[windowTable[currentFocusWindow]].optionCount].prev].page) ? ebChar('1') : cast(ubyte)(windowStats[windowTable[currentFocusWindow]].menuPage + ebChar('1')));
					printLetter(ebChar(')'));
				} else {
					printString(-1, &x02.label[0]);
				}
			} else {
				printString(-1, &x02.label[0]);
			}
		}
		if (x02.next == -1) {
			break;
		}
		x02 = &menuOptions[x02.next];
	}
}

/// $C1180D
// third argument unused?
void unknownC1180D(short arg1, short arg2, short) {
	unknownC451FA(arg1, 0, arg2);
	printMenuItems();
}

/// $C1181B
void unknownC1181B(short arg1, short arg2, short arg3) {
	unknownC451FA(arg1, 0, arg2);
	if (arg3 != -1) {
		windowStats[windowTable[currentFocusWindow]].selectedOption = arg3;
		MenuOpt* x = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		while (arg3 != 0) {
			arg3--;
			x = &menuOptions[x.next];
		}
		windowStats[windowTable[currentFocusWindow]].menuPage = x.page;
	}
	printMenuItems();
}

/// $C11887
void unknownC11887(short arg1) {
	windowStats[windowTable[currentFocusWindow]].selectedOption = arg1;
	MenuOpt* x = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
	while (arg1 != 0) {
		arg1--;
		x = &menuOptions[x.next];
	}
	windowStats[windowTable[currentFocusWindow]].menuPage = x.page;
	printMenuItems();
}

/// $C118E7 - Get target X/Y window positions after menu cursor movement
/// Returns: low byte = X, high byte = Y
short moveCursor(short curX, short curY, short deltaX, short deltaY, short sfx, short wrapX, short wrapY) {
	short x12 = unknownC20B65(curX, curY, deltaX, deltaY, -1);
	if (x12 == -1) {
		x12 = unknownC20B65(wrapX, wrapY, deltaX, deltaY, -1);

		if (deltaX == 0) {
			if (((x12 >> 8) & 0xFF) != curY) {
				x12 = -1;
			}
		} else {
			if ((x12 & 0xFF) != curX) {
				x12 = -1;
			}
		}
	}
	if (x12 != -1) {
		playSfx(sfx);
	}
	return x12;
}

/// $C1196A - Handle menu selection on the focused window
short selectionMenu(short cancelable) {
	// $28 = cancelable

	short dp26 = currentFocusWindow;
	if (dp26 == -1) return 0;

	WinStat *dp24 = &windowStats[windowTable[currentFocusWindow]]; // 16-bit pointer

	if (unknown7E5E79) {
		dp24.currentOption = unknown7E9688; // field2B
		dp24.selectedOption = unknown7E968A; // field2F
	}

	short dp20;
	MenuOpt *dp04; // 16-bit pointer
	if (dp24.selectedOption != -1) { // field2F
		short dp22 = dp24.selectedOption;
		dp20 = dp22;

		dp04 = &menuOptions[dp24.currentOption]; // field2B

		while (dp22) {
			dp22--;
			dp04 = &menuOptions[dp04.next]; // field02
		}

		setInstantPrinting();
		unknownC43CD2(dp04, dp04.textX, dp04.textY); // field08, field0A
		unknownC43BB9(0xFFFF, 0, dp04.label.ptr); // field13
	} else {
		dp20 = 0;
		dp04 = &menuOptions[dp24.currentOption]; // field2B
	}

	short dp22;
label1:
	dp22 = 0;
	if (dp04.script) { // field0F
		setInstantPrinting();
		displayText(getTextBlock(dp04.script)); // field0F
	}

	if (dp24.menuCallback) { // field37
		short dp1C = cast(short)((dp04.field00 == 1) ? dp20+1 : dp04.userdata);
		dp24.menuCallback(dp1C);
		setWindowFocus(dp26);
	}

	clearInstantPrinting();
	if (unknown7E5E79) {
		dp04.textX = unknown7E9684; // field08
		dp04.textY = unknown7E9686; // field0A
	}

	unknownC43CD2(dp04, dp04.textX, dp04.textY);
	windowSetTextColor(1);
	unknownC10D60(0x21); // Put cursor on the window maybe?
	windowSetTextColor(0);
	windowTick();

	short dp02 = 1;
label2:
	dp02 ^= 1;
	short dp1A = dp02;

	// x=field06, textX=field0E, textY=field10, y=field08
	short dp1E = cast(short)((dp24.x + dp24.textX) + ((dp24.textY * 2 + dp24.y) * 32) + 0x7C20);
	dp02 = dp1A; // The addition above used dp02 as an intermediary value

	// dp18 = dp02 * 2;
	copyToVRAM(0, 2, cast(ushort)dp1E, cast(ubyte*)&arrC3E406[dp02]); // Implied (dp02 * 2), because arrC3E406 is an array of ushort
	copyToVRAM(0, 2, cast(ushort)(dp1E+32), cast(ubyte*)&arrC3E40A[dp02]); // Implied (dp02 * 2), because arrC3E40A is an array of ushort

	short dp1C;
	for (dp1E = 0; dp1E < 10; dp1E++) {
		unknownC12E42();

		if (padPress[0] & Pad.up) {
			dp1C = moveCursor(dp04.textX, dp04.textY, -1, 0, Sfx.cursor3, dp04.textX, dp24.height / 2);
			goto label3;
		}

		if (padPress[0] & Pad.left) {
			dp1C = moveCursor(dp04.textX, dp04.textY, 0, -1, Sfx.cursor2, dp24.width, dp04.textY);
			goto label3;
		}

		if (padPress[0] & Pad.down) {
			dp1C = moveCursor(dp04.textX, dp04.textY, 1, 0, Sfx.cursor3, dp04.textX, -1);
			goto label3;
		}

		if (padPress[0] & Pad.right) {
			dp1C = moveCursor(dp04.textX, dp04.textY, 0, 1, Sfx.cursor2, -1, dp04.textY);
			goto label3;
		}

		if (padHeld[0] & Pad.up) {
			dp1C = unknownC20B65(dp04.textX, dp04.textY, -1, 0, 3);
			goto label3;
		}

		if (padHeld[0] & Pad.left) {
			dp1C = unknownC20B65(dp04.textX, dp04.textY, 0, -1, 2);
			goto label3;
		}

		if (padHeld[0] & Pad.down) {
			dp1C = unknownC20B65(dp04.textX, dp04.textY, 1, 0, 3);
			goto label3;
		}

		if (padHeld[0] & Pad.right) {
			dp1C = unknownC20B65(dp04.textX, dp04.textY, 0, 1, 2);
		}

		if (padPress[0] & (Pad.a|Pad.l)) {
			setInstantPrinting();
			if (dp04.page) { // field06
				playSfx(dp04.sfx); // field0E
				unknownC43CD2(dp04, dp04.textX, dp04.textY);
				unknownC10D60(0x2F); // Remove cursor from window?
				windowSetTextColor(6);

				if (unknown7E5E6E) {
					if (unknown7EB49D != 1) {
						if (currentFocusWindow == 19) {
							unknownC43B15();
						} else {
							unknownC43BB9(4, 1, dp04.label.ptr); // field13
						}
					} else {
						unknownC43BB9(0xFFFF, 1, dp04.label.ptr); // field13;
					}
				} else {
					unknownC43B15();
				}

				windowSetTextColor(0);
				clearInstantPrinting();

				dp24.selectedOption = cast(short)dp20; // field2F
				return (dp04.field00 == 1) ? cast(short)(dp20+1) : dp04.userdata;
			}

			playSfx(2);
			clearFocusWindow(); // Clear the focused window

			dp1E = dp24.menuPage;
			if (dp1E == menuOptions[dp04.prev].page) { // prev=field04
				dp24.menuPage = 1;
			} else {
				dp24.menuPage = cast(short)(dp1E+1);
			}

			clearInstantPrinting();
			unknownEF0115(cast(short)dp26);
			windowTick();

			printMenuItems(); // Print the options for the new page
			setInstantPrinting();
			goto label1; // Back to the start....
		}

		if ((padPress[0] & (Pad.b|Pad.select)) && cancelable == 1) {
			playSfx(2);
			return 0;
		}

		++dp22;
		if (windowTable[0] == windowTail) { // If the field/overworld commands window is the last opened window...
			if (dp22 > 60) { // If 60 frames have passed
				if (windowTable[10] == -1) { // If the wallet window is not open
					openHpAndWallet();
					setWindowFocus(0);
					// Funky! I didn't expect a goto back to the start here...
					// The reason this is here is because the code path from label1 calls windowTick (draws the HP and wallet windows) and resets dp22.
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
	MenuOpt *dp22_opt = &menuOptions[dp24.currentOption]; // Reuses dp22, 16-bit pointer

	short tmp = dp1C & 0xFF;
	dp1C = dp1C >> 8;

	while ((dp22_opt.textX != tmp) || (dp22_opt.textY != dp1C) || ((dp22_opt.page != dp24.menuPage) && (dp22_opt.page != 0))) {
		++dp02;
		dp22_opt = &menuOptions[dp22_opt.next]; // field02
	}

	unknownC43CD2(dp04, dp04.textX, dp04.textY);
	unknownC10D60(0x2F); // Remove cursor from window?

	dp20 = dp02;
	dp04 = dp22_opt;
	goto label1; // Aaaand back to the start....
}

/// $C11F5A
void unknownC11F5A(void function(short) arg1) {
	windowStats[windowTable[currentFocusWindow]].menuCallback = arg1;
}

/// $C11F8A
void unknownC11F8A() {
	windowStats[windowTable[currentFocusWindow]].menuCallback = null;
}

/// $C11FBC
short unknownC11FBC(short arg1, short arg2) {
	if (arg1 == 0) {
		return unknown7EAD5A[arg2];
	} else {
		return unknown7EAD6A[arg2];
	}
}

/// $C11FD4
short unknownC11FD4(short arg1, short arg2, short arg3) {
	if ((arg1 == 1) && (battleActionTable[arg3].type == 1) && (unknownC2FAD2(arg2) == 0)) {
		return 0;
	}
	return 1;
}

/// $C12012
short unknownC12012(short arg1, short arg2, short arg3) {
	short x0E;
	ubyte* x04;
	if (arg1 == 0) {
		x0E = numBattlersInFrontRow;
		x04 = &unknown7EAD5A[0];
	} else {
		x0E = numBattlersInBackRow;
		x04 = &unknown7EAD6A[0];
	}
	for (short i = 0; i < x0E; i++) {
		if ((x04++)[0] > arg2) {
			if (unknownC11FD4(arg1, i, arg3) != 0) {
				return i;
			}
		}
	}
	return -1;
}

/// $C12070
short unknownC12070(short arg1, short arg2, short arg3) {
	ubyte* x04;
	short x;
	if (arg1 == 0) {
		x = numBattlersInBackRow;
		x04 = &unknown7EAD5A[x - 1];
	} else {
		x = numBattlersInFrontRow;
		x04 = &unknown7EAD6A[x - 1];
	}
	for (short i = cast(short)(x - 1); i + 1 != 0; i--) {
		if ((x04--)[0] < arg2) {
			if (unknownC11FD4(arg1, i, arg3) != 0) {
				return i;
			}
		}
	}
	return -1;
}

/// $C120D6
void unknownC120D6(short arg1, short arg2) {
	setInstantPrinting();
	createWindowN(Window.unknown31);
	printString(battleToText.length, &battleToText[0]);
	if (arg2 != -1) {
		unknownC23E8A(cast(short)(arg1 * numBattlersInBackRow + arg2 + 1));
		unknownC3E75D(0);
		printString(0xFF, returnBattleAttackerAddress());
		ubyte* x12 = (arg1 != 0) ? &battlersTable[frontRowBattlers[arg2]].afflictions[0] : &battlersTable[backRowBattlers[arg2]].afflictions[0];
		moveCurrentTextCursor(0x11, 0);
		unknownC43F77(unknownC223D9(x12, 0));
	} else {
		printString(13, (arg1 != 0) ? &battleBackRowText[0] : &battleFrontRowText[0]);
	}
	clearInstantPrinting();
}

/// $C121B8
short unknownC121B8(short arg1, short arg2) {
	short x0E;
	short x18 = 0;
	short x16 = 0;
	short x04 = (numBattlersInBackRow != 0) ? 0 : 1;
	if (currentGiygasPhase != 0) {
		x04 = 1;
	}
	outer: while (true) {
		short x12;
		short x10;
		short x14 = unknownC11FBC(x04, x16);
		enemyFlashingOn(x04, x16);
		if (x18 == 0) {
			unknownC120D6(x04, x16);
		}
		x18++;
		windowTick();
		Unknown4:
		unknownC12E42();
		if ((((padPress[0] & Pad.up) == 0) || (x04 != 0) || (numBattlersInFrontRow == 0)) && (((padPress[0] & Pad.down) == 0) || (x04 != 1) || (numBattlersInBackRow == 0))) {
			x12 = Sfx.cursor2;
			if ((padPress[0] & Pad.left) != 0) {
				x10 = unknownC12070(x04, x14, arg2);
				if (x10 == -1) {
					x10 = unknownC12070(x04 ^ 1, x14, arg2);
					if (x10 == -1) {
						continue;
					}
				}
			} else if ((padPress[0] & Pad.right) != 0) {
				x10 = unknownC12012(x04, x14, arg2);
				if (x10 == -1) {
					x10 = unknownC12012(x04 ^ 1, x14, arg2);
					if (x10 == -1) {
						continue;
					}
				}
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				enemyFlashingOff();
				x0E = cast(short)(x04 * numBattlersInBackRow + x16 + 1);
				playSfx(Sfx.cursor1);
				break;
			} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (arg1 == 1)) {
				enemyFlashingOff();
				x0E = 0;
				playSfx(Sfx.cursor2);
				break;
			} else {
				continue;
			}
		} else {
			x12 = Sfx.cursor3;
			x10 = unknownC12012(x04 ^ 1, cast(short)(x14 - 1), arg2);
			if (x10 == -1) {
				x10 = unknownC12070(x04 ^ 1, x14, arg2);
				if (x10 == -1) {
					continue;
				}
			}
		}
		x18 = 0;
		clearInstantPrinting();
		createWindowN(Window.unknown31);
		windowTick();
		setInstantPrinting();
		x16 = x10;
		playSfx(x12);
	}
	closeFocusWindowN();
	return x0E;
}

/// $C12362
short unknownC12362(short arg1) {
	short x12 = (numBattlersInBackRow != 0) ? 0 : 1;
	short x10;
	short x0E;
	outer: while (true) {
		unknownC43657(x12);
		clearInstantPrinting();
		unknownC120D6(x12, -1);
		windowTick();
		while (true) {
			unknownC12E42();
			if ((padPress[0] & Pad.up) != 0) {
				x10 = 1;
				x0E = Sfx.cursor3;
			} else if ((padPress[0] & Pad.down) != 0) {
				x10 = 0;
				x0E = Sfx.cursor3;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				unknownC435E4();
				x10 = cast(short)(x12 + 1);
				playSfx(Sfx.cursor1);
				break outer;
			} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (arg1 == 1)) {
				unknownC435E4();
				x10 = 0;
				playSfx(Sfx.cursor2);
				break outer;
			} else {
				continue;
			}
			if (((x10 != 0) || (numBattlersInBackRow == 0)) && ((x10 != 0) || (numBattlersInFrontRow != 0))) {
				playSfx(x0E);
				x12 = x10;
			}
		}
	}
	closeFocusWindowN();
	return x10;
}

/// $C1242E
short unknownC1242E(short arg1, short arg2, short arg3) {
	if (arg1 != 0) {
		return unknownC12362(arg2);
	} else {
		return unknownC121B8(arg2, arg3);
	}
}

/// $C1244C
short unknownC1244C(string* arg1, short arg2, short arg3) {
	short x16;
	WinStat* x22 = getActiveWindowAddress();
	uint x1E = x22.argument;
	if (arg2 == 1) {
		unknownC20A20(&unknown7E9C8A);
		short x1C = gameState.playerControlledPartyMemberCount == 1 ? Window.singleCharacterSelect : cast(short)(gameState.playerControlledPartyMemberCount + Window.characterSelectBase - 1);
		createWindowN(x1C);
		for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
			memcpy(&unknown7E9C9F[0], getPartyCharacterName(gameState.partyMembers[i]), 6);
			unknown7E9C9F[PartyCharacter.name.length] = 0;
			unknownC1153B(gameState.partyMembers[i], cast(short)(i * 6), 0, &unknown7E9C9F[0], arg1[i]);
		}
		printMenuItems();
		x16 = selectionMenu(arg3);
		closeWindow(x1C);
		unknownC20ABC(&unknown7E9C8A);
	} else {
		for (short i = 0; i != 4; i++) {
			unknown7E9631[i] = arg1[i];
		}
		short x04 = (battleMenuCurrentCharacterID == -1) ? 0 : battleMenuCurrentCharacterID;
		string x06 = unknown7E9631[gameState.partyMembers[x04] - 1];
		if (x06 != null) {
			displayText(getTextBlock(x06));
		}
		unknown7E5E7C = 0;
		short x1C = 10;
		while (true) {
			if (arg2 == 0) {
				unknownC43573(x04);
			}
			clearInstantPrinting();
			windowTick();
			WinStat* x1A;
			if ((unknown7E5E7A != -1) && (windowTable[unknown7E5E7A] != -1)) {
				x1A = &windowStats[windowTable[unknown7E5E7A]];
			}
			short y;
			l2: while (true) {
				if ((unknown7E5E7A != -1) && (windowTable[unknown7E5E7A] != -1)) {
					copyToVRAM(0, 8, cast(ushort)((x1A.y * 32) + x1A.x + x1A.width - 3 + 0x7C00), cast(ubyte*)&paginationArrowTiles[unknown7E5E7C][0]);
				}
				for (x16 = 0; x16 < x1C; x16++) {
					unknownC12E42();
					if ((padPress[0] & Pad.left) != 0) {
						x16 = cast(short)(x04 - 1);
						y = (arg2 != 0) ? Sfx.cursor2 : Sfx.menuOpenClose;
						unknown7E5E7C = 2;
						break l2;
					} else if ((padPress[0] & Pad.right) != 0) {
						x16 = cast(short)(x04 + 1);
						y = (arg2 != 0) ? Sfx.cursor2 : Sfx.menuOpenClose;
						unknown7E5E7C = 3;
						break l2;
					} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
						x16 = gameState.partyMembers[x04];
						playSfx(Sfx.cursor1);
						goto Unknown42;
					} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (arg3 == 1)) {
						x16 = 0;
						playSfx((arg2 != 0) ? Sfx.cursor2 : Sfx.menuOpenClose);
						unknownC3E6F8();
						goto Unknown42;
					}
				}
				unknown7E5E7C = (unknown7E5E7C == 0) ? 1 : 0;
				x1C = 10;
			}
			if (gameState.playerControlledPartyMemberCount <= x16) {
				x16 = 0;
			}
			if (0 > x16) {
				x16 = gameState.playerControlledPartyMemberCount - 1;
			}
			if (x16 != x04) {
				playSfx(y);
				x04 = x16;
				if (unknown7E9631[gameState.partyMembers[x16] - 1] != null) {
					displayText(getTextBlock(unknown7E9631[gameState.partyMembers[x16] - 1]));
				}
			}
			x1C = 4;
		}
	}
	Unknown42:
	unknown7E5E7C = -1;
	x22.argument = x1E;
	return x16;
}

/// $C127EF
short charSelectPrompt(short arg1, short arg2, void function(short) arg3, short function(short) checkCharacterValid) {
	short x1E;
	WinStat* x26 = getActiveWindowAddress();
	uint x22 = x26.argument;
	if (arg1 == 1) {
		unknownC20A20(&unknown7E9C8A);
		short x20 = (gameState.playerControlledPartyMemberCount == 1) ? Window.singleCharacterSelect : cast(short)(Window.characterSelectBase + gameState.playerControlledPartyMemberCount);
		createWindowN(x20);
		for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
			memcpy(&unknown7E9C9F[0], getPartyCharacterName(gameState.partyMembers[i]), 6);
			unknown7E9C9F[PartyCharacter.name.length] = 0;
			unknownC1153B(gameState.partyMembers[i], cast(short)(i * 6), 0, &unknown7E9C9F[0], null);
		}
		printMenuItems();
		x1E = selectionMenu(arg2);
		closeWindow(x20);
		unknownC20ABC(&unknown7E9C8A);
	} else {
		short x04 = (battleMenuCurrentCharacterID == -1) ? 0 : battleMenuCurrentCharacterID;
		if (arg3 != null) {
			arg3(gameState.partyMembers[x04]);
		}
		unknown7E5E7C = 0;
		short x20 = 10;
		while (true) {
			if (arg1 == 0) {
				unknownC43573(x04);
			}
			clearInstantPrinting();
			windowTick();
			short x1A = x04;
			WinStat* x18;
			if ((unknown7E5E7A != -1) && (windowTable[unknown7E5E7A] != -1)) {
				x18 = &windowStats[windowTable[unknown7E5E7A]];
			}
			short x16;
			l2: while (true) {
				if ((unknown7E5E7A != -1) && (windowTable[unknown7E5E7A] != -1)) {
					copyToVRAM(0, 8, cast(ushort)((x18.y * 32) + x18.x + x18.width - 3 + 0x7C00), cast(ubyte*)&paginationArrowTiles[unknown7E5E7C][0]);
				}
				for (x1E = 0; x1E < x20; x1E++) {
					unknownC12E42();
					if ((padPress[0] & Pad.left) != 0) {
						x1A--;
						x16 = (arg1 != 0) ? Sfx.cursor2 : Sfx.menuOpenClose;
						unknown7E5E7C = 2;
						break l2;
					} else if ((padPress[0] & Pad.right) != 0) {
						x1A++;
						x16 = (arg1 != 0) ? Sfx.cursor2 : Sfx.menuOpenClose;
						unknown7E5E7C = 3;
						break l2;
					} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
						x1E = gameState.partyMembers[x1A];
						playSfx(Sfx.cursor1);
						goto Unknown44;
					} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (arg2 == 1)) {
						x1E = 0;
						playSfx((arg1 != 0) ? Sfx.cursor2 : Sfx.menuOpenClose);
						unknownC3E6F8();
						goto Unknown44;
					}
				}
				unknown7E5E7C = (unknown7E5E7C == 0) ? 1 : 0;
				x20 = 10;
			}
			x20 = cast(short)(x1A - x04);
			Unknown33:
			x1E = gameState.playerControlledPartyMemberCount;
			if (x1E <= x1A) {
				x1A = 0;
			} else if (0 > x1A) {
				x1A = cast(short)(x1E - 1);
			}
			if (checkCharacterValid != null) {
				if (checkCharacterValid(gameState.partyMembers[x1A]) == 0) {
					x1A += x20;
					goto Unknown33;
				}
			}
			if (x1A != x04) {
				playSfx(x16);
				x04 = x1A;
				if (arg3 != null) {
					arg3(gameState.partyMembers[x04]);
				}
			}
			x20 = 4;
		}
	}
	Unknown44:
	unknown7E5E7C = -1;
	x26.argument = x22;
	return x1E;
}

/// $C12BD5
short unknownC12BD5(short arg1) {
	return unknownC1138D(windowStats[windowTable[arg1 == 0 ? currentFocusWindow : arg1]].currentOption);
}

/// $C12BF3
void unknownC12BF3() {
	windowSetTextColor(3);
	const(ushort)* x06 = &unknownC3E84E[0];
	while (x06[0] != 0) {
		unknownC10D60(*(x06++));
		for (short i = 1; i-- != 0;) {
			windowTick();
		}
	}
	windowSetTextColor(0);
}

/// $C12C36
void unknownC12C36() {
	windowSetTextColor(3);
	const(ushort)* x06 = &unknownC3E862[0];
	for (short i = 0; i < 4; i++) {
		unknownC10D60(*(x06++));
		for (short j = 1; j-- != 0;) {
			windowTick();
		}
	}
	for (short i = 8; i-- != 0;) {
		unknownC12E42();
	}
	for (short i = 0; i < 5; i++) {
		unknownC10D60(*(x06++));
		for (short j = 1; j-- != 0;) {
			windowTick();
		}
	}
	windowSetTextColor(0);
}

/// $C12D17
void unknownC12D17(short arg1) {
	if ((unknown7E9698 == 0) && (arg1 != 0)) {
		for (short i = 0; 4 > i; i++) {
			unknown7E969A[i] = partyCharacters[i].hp.target;
			partyCharacters[i].hp.target = 999;
			partyCharacters[i].hp.current.integer = 999;
			unknown7E96A2[i] = partyCharacters[i].pp.target;
			partyCharacters[i].pp.target = 0;
			partyCharacters[i].pp.current.integer = 0;
		}
	} else {
		if ((unknown7E9698 != 0) && (arg1 == 0)) {
			for (short i = 0; 4 > i; i++) {
				partyCharacters[i].hp.target = unknown7E969A[i];
				partyCharacters[i].pp.target = unknown7E96A2[i];
			}
		}
	}
	unknown7E9698 = arg1;
	resumeMusic();
}

/// $C12DD5 - Tick windows (draw windows if necessary, roll HP/PP, advance RNG, wait a frame)
void windowTick() {
	rand();
	if (unknown7E968C != 0) {
		unknown7E968C = 0;
		return;
	}
	if (instantPrinting != 0) {
		return;
	}
	if (unknown7E9623 == 0) {
		if (windowHead != -1) {
			unknownC107AF(windowTail);
		}
	} else {
		unknownC2087C();
		unknown7E9623 = 0;
	}
	hpPPRoller();
	unknown7E9624 = 1;
	updateHPPPMeterTiles();
	if (unknown7EB4B6 == 0) {
		if (unknownC1FF2C() != 0) {
			loadTextPalette();
		}
	}
	unknown7E9649 = 0;
	unknownC2038B();
	unknownC1004E();
}

/// $C12E42 - Looks like a "minimal" window tick function, doesn't advance RNG
void unknownC12E42() {
	hpPPRoller();
	if (unknown7E9649 != 0) {
		unknownC1078D();
		unknown7E9649 = 0;
		unknown7E9624 = 1;
	}
	updateHPPPMeterTiles();
	unknownC1004E();
}

/// $C12E63
void debugYButtonMenu() {
	freezeEntities();
	playSfx(Sfx.cursor1);
	showHPPPWindows();
	const(ubyte)* x1A = null;
	loop: while (x1A is null) {
		createWindowN(Window.phoneMenu);
		for (short i = 0; debugMenuText[i][0] != 0; i++) {
			unknownC113D1(&debugMenuText[i][0], null);
		}
		unknownC1180D(1, 0, 0);
		switch (selectionMenu(1)) {
			case 1:
				debugYButtonFlag();
				break;
			case 2:
				debugYButtonGoods();
				break;
			case 3:
				saveCurrentGame();
				respawnX = gameState.leaderX.integer;
				respawnY = gameState.leaderY.integer;
				break;
			case 4:
				x1A = getTextBlock("textDebugAppleMenu");
				break;
			case 5:
				x1A = getTextBlock("textDebugBananaMenu");
				break;
			case 6:
				x1A = getTextBlock("textDebugUnknownMenu");
				break;
			case 7:
				x1A = getTextBlock("textDebugUnknownMenu2");
				break;
			case 8:
				for (short i = 0; i < 30; i++) {
					undrawHPPPWindow(0);
					unknownC12E42();
					unknownC12E42();
					unknownC207B6(0);
					unknownC12E42();
					unknownC12E42();
				}
				fadeOut(1, 1);
				loadMapAtPosition(7696, 2280);
				unknownC03FA9(7696, 2280, 0);
				fadeIn(1, 1);
				break;
			case 9:
				coffeeTeaScene(rand()&1);
				break;
			case 10:
				learnSpecialPSI(1);
				break;
			case 11:
				learnSpecialPSI(2);
				break;
			case 12:
				learnSpecialPSI(3);
				learnSpecialPSI(4);
				break;
			case 13:
				enterYourNamePlease(0);
				break;
			case 14:
				enterYourNamePlease(1);
				break;
			case 15:
				townMapDebug();
				break;
			case 16:
				debugYButtonGuide();
				break;
			case 17:
				playCastScene();
				teleport(1);
				break;
			case 18:
				useSoundStone(1);
				break;
			case 19:
				playCredits();
				teleport(1);
				break;
			case 20:
				unknownC12D17(unknown7E9698 == 0 ? 1 : 0);
				break;
			case 21:
				startReplay();
				goto Unknown56;
			case 22:
				x1A = getTextBlock("textBattleGiygasPrayer91");
				break;
			case 23:
				x1A = getTextBlock("textEndOfGamePickyEvent");
				closeAllWindows();
				hideHPPPWindows();
				displayText(x1A);
				goto Unknown56;
			default:
				endReplay();
				goto Unknown56;
		}
	}
	closeFocusWindow();
	createWindowN(Window.textStandard);
	displayText(x1A);
	Unknown56:
	closeAllWindows();
	hideHPPPWindows();
	do {
		windowTick();
	} while (unknown7EB4A8 != -1);
	unfreezeEntities();
}

/// $C13187
const(ubyte)* talkTo() {
	const(ubyte)* x0A = null;
	createWindowN(Window.textStandard);
	findNearbyTalkableTPTEntry();
	if (currentTPTEntry == 0) {
		return null;
	}
	if (currentTPTEntry == -1) {
		return null;
	}
	if (currentTPTEntry == -2) {
		x0A = getTextBlock(unknown7E5DDE);
	} else {
		switch (npcConfig[currentTPTEntry].type) {
			case NPCType.person:
				faceOppositeLeader(unknown7E5D64);
				x0A = getTextBlock(npcConfig[currentTPTEntry].talkText);
				break;
			case NPCType.itemBox:
			case NPCType.object:
			default: break;
		}
	}
	return x0A;
}

/// $C1323B
const(ubyte)* check() {
	createWindowN(Window.textStandard);
	findNearbyCheckableTPTEntry();
	if (currentTPTEntry == 0) {
		return null;
	}
	if (currentTPTEntry == -1) {
		return null;
	}
	if (currentTPTEntry == -2) {
		return getTextBlock(unknown7E5DDE);
	}
	switch (npcConfig[currentTPTEntry].type) {
		case NPCType.person:
			return null;
		case NPCType.itemBox:
			if (npcConfig[currentTPTEntry].item < 0x100) {
				setWorkingMemory(WorkingMemory(npcConfig[currentTPTEntry].item));
			} else {
				setWorkingMemory(WorkingMemory(0));
				setArgumentMemory(npcConfig[currentTPTEntry].item - 0x100);
			}
			currentInteractingEventFlag = npcConfig[currentTPTEntry].eventFlag;
			return getTextBlock(npcConfig[currentTPTEntry].talkText);
		case NPCType.object:
			return getTextBlock(npcConfig[currentTPTEntry].talkText);
		default: break;
	}
	return null;
}

/// $C1339E
void unknownC1339E(short arg1) {
	return inventoryGetItemName(arg1, Window.inventory);
}

/// $C133A7
void unknownC133A7(short arg1) {
	return inventoryGetItemName(arg1, Window.unknown2c);
}

/// $C133B0
void unknownC133B0() {
	if (unknown7E5E6C == 0) {
		for (short i = 1; i < 7; i++) {
			if ((i == 3) && (unknownC1C373() == 0)) {
				continue;
			}
			short y = ((i == 1) || (i == 5) || ((i == 2) && (gameState.playerControlledPartyMemberCount == 1) && (getCharacterItem(gameState.partyMembers[0], 1) == 0))) ? Sfx.cursor1 : Sfx.menuOpenClose;
			unknownC11596(i, debugMenuElementSpacingData[i - 1].unknown0, debugMenuElementSpacingData[i - 1].unknown1, &commandWindowText[i - 1][0], null, cast(ubyte)y);
		}
	}
	unknown7E5E6C = 0;
	printMenuItems();
}

/// $C134A7
void openMenuButton() {
	freezeEntities();
	playSfx(Sfx.cursor1);
	createWindowN(Window.unknown00);
	unknown7E5E6C = 0;
	unknownC133B0();
	unknown7E5E79 = 0;
	mainLoop: while (true) {
		setWindowFocus(0);
		uint x06 = selectionMenu(1);
		switch (cast(short)x06) {
			case MainMenuOptions.talkTo:
				const(ubyte)* textPtr = talkTo();
				if (textPtr == null) {
					textPtr = getTextBlock("textWhoAreYouTalkingTo");
				}
				displayText(textPtr);
				break mainLoop;
			case MainMenuOptions.goods:
				openHpAndWallet();
				L2: while (true) {
					uint x1F;
					if (gameState.playerControlledPartyMemberCount == 1) {
						if (getCharacterItem(gameState.partyMembers[0], 1) == 0) {
							continue mainLoop;
						}
						inventoryGetItemName(gameState.partyMembers[0], Window.inventory);
						x1F = gameState.partyMembers[0];
						unknownC43573(0);
					} else {
						openEquipSelectWindow(0);
						x1F = charSelectPrompt(0, 1, &unknownC1339E, null);
					}
					if (x1F == 0) {
						closeWindow(Window.inventory);
						closeEquipSelectWindow();
						continue mainLoop;
					}
					if (getCharacterItem(cast(short)x1F, 1) == 0) {
						continue;
					}
					while (true) {
						openEquipSelectWindow(1);
						setWindowFocus(Window.inventory);
						short x1D = selectionMenu(1);
						unknownEF016F();
						closeEquipSelectWindow();
						if (x1D == 0) {
							if (gameState.playerControlledPartyMemberCount != 1) {
								continue L2;
							}
							if (getCharacterItem(gameState.partyMembers[0], 1) != 0) {
								playSfx(Sfx.menuOpenClose);
								unknownC3E6F8();
							}
							closeWindow(Window.inventory);
							continue mainLoop;
						}
						createWindowN(Window.inventoryMenu);
						short x23 = ((partyCharacters[x1F].afflictions[0] != 0) && (Status0.nauseous > partyCharacters[x1F].afflictions[0])) ? 1 : 0;
						moveCurrentTextCursor(0, x23);
						while (x23 < 4) {
							short x1B = cast(short)(x23 + 1);
							unknownC115F4(x1B, &itemUseMenuStrings[x23][0], null);
							x23 = x1B;
						}
						unknownC451FA(1, 0, 0);
						short x02 = 0;
						short x1A;
						L4: while (true) {
							if (x02 != 0) {
								setWindowFocus(Window.inventory);
								if (cast(ubyte)x1A != 0) {
									printMenuItems();
								}
							} else {
								setWindowFocus(Window.inventoryMenu);
								printMenuItems();
							}
							setWindowFocus(Window.inventoryMenu);
							switch (selectionMenu(1)) {
								case 0: //didn't choose anything
									closeFocusWindow();
									setWindowFocus(Window.inventory);
									break L4;
								case 1: //use
									x02 = 1;
									if (overworldUseItem(cast(short)x1F, x1D, 0) != 0) {
										break mainLoop;
									}
									x1A = 0;
									continue;
								case 4: //help
									unknownC10F40(0);
									unknownC10F40(2);
									unknown7E5E79 = 0xFF;
									createWindowN(Window.textStandard);
									displayText(getTextBlock(itemData[getCharacterItem(cast(short)x1F, x1D)].helpText));
									closeWindow(Window.textStandard);
									setWindowFocus(0);
									unknown7E5E6C = 1;
									unknownC133B0();
									inventoryGetItemName(cast(short)x1F, Window.inventory);
									closeWindow(Window.inventoryMenu);
									setWindowFocus(Window.inventory);
									break L4;
								case 2: //give
									setWindowFocus(Window.inventory);
									clearFocusWindow();
									x02 = 1;
									openEquipSelectWindow(3);
									short x18 = charSelectPrompt(2, 1, &unknownC133A7, null);
									closeEquipSelectWindow();
									closeWindow(Window.unknown2c);
									if (x18 == 0) {
										x1A = 1;
										continue;
									}
									if ((x1F != x18) && ((itemData[getCharacterItem(cast(short)x1F, x1D)].flags & ItemFlags.cannotGive) != 0)) {
										createWindowN(Window.textStandard);
										setWorkingMemory(WorkingMemory(x1F));
										setArgumentMemory(x1D);
										displayText(getTextBlock("textOnlyOneWhoShouldCarryThis"));
										closeWindow(Window.textStandard);
										x1A = 0;
										continue;
									}
									short x16 = 0;
									if ((partyCharacters[x1F - 1].afflictions[0] == Status0.unconscious) || (partyCharacters[x1F - 1].afflictions[0] == Status0.diamondized)) {
										x16 = 5;
									}
									if (x18 != x1F) {
										x16++;
										if (findInventorySpace2(x18) != 0) {
											x16 += 2;
										}
										if ((partyCharacters[x18 - 1].afflictions[0] == Status0.unconscious) || (partyCharacters[x18 - 1].afflictions[0] == Status0.diamondized)) {
											x16++;
										}
									}
									createWindowN(Window.textStandard);
									getActiveWindowAddress().result.integer = x1F;
									getActiveWindowAddress().resultBak.integer = x18;
									getActiveWindowAddress().argument = x1D;
									switch (x16) {
										case 0: //give to self, alive
											displayText(getTextBlock("textRearrangedOwnItems"));
											unknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 1: //give to other, alive, inventory full
											displayText(getTextBlock("textCouldntGiveAliveInventoryFull"));
											break;
										case 2: //give to other, dead, inventory full
											displayText(getTextBlock("textCouldntGiveDeadInventoryFull"));
											break;
										case 3: //give to other, alive
											displayText(getTextBlock("textGaveItemAlive"));
											unknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 4: //give to other, dead
											displayText(getTextBlock("textGaveItemDead"));
											unknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 5: //give to self, dead
											displayText(getTextBlock("textRearrangedOwnItemsDead"));
											unknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 6: //give to other, self dead, other alive, inventory full
											displayText(getTextBlock("textCouldntTakeFromCharInventoryFull"));
											break;
										case 7: //give to other, self dead, other dead, inventory full
											displayText(getTextBlock("textCouldntGiveToCharInventoryFull"));
											break;
										case 8: //give to other, self dead, other alive
											displayText(getTextBlock("textTookItemFromDead"));
											unknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										case 9: //give to other, self dead, other dead
											displayText(getTextBlock("textTookItemFromDeadGaveToDead"));
											unknownC22A3A(x18, cast(short)x1F, x1D);
											break;
										default: //invalid
											assert(0);
									}
									closeWindow(Window.textStandard);
									closeWindow(Window.inventoryMenu);
									closeWindow(Window.inventory);
									continue mainLoop;
								case 3: //drop
									createWindowN(Window.textStandard);
									setWorkingMemory(WorkingMemory(x1F));
									setArgumentMemory(x1D);
									displayText(getTextBlock("textGotRidOfOwnItem"));
									closeWindow(Window.textStandard);
									closeWindow(Window.inventoryMenu);
									closeWindow(Window.inventory);
									continue mainLoop;
								default:
									break mainLoop;
							}
						}
					}
				}
				break;
			case MainMenuOptions.psi:
				openHpAndWallet();
				uint x06_2 = unknownC1C373();
				if (x06_2 != 0) {
					unknownC43573(cast(short)(cast(short)(x06_2) - 1));
				}
				if (unknownC1B5B6() != 0) {
					break mainLoop;
				}
				if (unknownC1C3B6() == 1) {
					playSfx(Sfx.menuOpenClose);
					unknownC3E6F8();
				}
				break;
			case MainMenuOptions.equip:
				openHpAndWallet();
				unknownC1AA5D();
				if (gameState.playerControlledPartyMemberCount == 1) {
					playSfx(Sfx.menuOpenClose);
					unknownC3E6F8();
				}
				break;
			case MainMenuOptions.check:
				const(ubyte)* textPtr = check();
				if (textPtr == null) {
					textPtr = getTextBlock("textNoProblemHere");
				}
				displayText(textPtr);
				break mainLoop;
			case MainMenuOptions.status:
				openHpAndWallet();
				unknown7E5E71 = 1;
				unknownC1BB71();
				unknown7E5E71 = 0;
				break;
			default: break mainLoop;
		}
	}
	clearInstantPrinting();
	hideHPPPWindows();
	closeAllWindows();
	do {
		windowTick();
	} while (unknown7EB4A8 != -1);
	unfreezeEntities();
}

/// $C13---
void openMenuButtonCheckTalk() {
	freezeEntities();
	playSfx(Sfx.cursor1);
	const(ubyte)* textPtr;
	textPtr = talkTo();
	if (textPtr is null) {
		textPtr = check();
		if (textPtr is null) {
			textPtr = getTextBlock("textNoProblemHere");
		}
	}
	displayText(textPtr);
	clearInstantPrinting();
	hideHPPPWindows();
	closeAllWindows();
	do {
		windowTick();
	} while (unknown7EB4A8 != -1);
	unfreezeEntities();
}

/// $C13CA1
void openHPPPDisplay() {
	freezeEntities();
	playSfx(Sfx.cursor1);
	openHpAndWallet();
	do {
		windowTick();
		if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
			openMenuButton();
			return;
		}
	} while ((padPress[0] & (Pad.b | Pad.select)) == 0);
	playSfx(Sfx.cursor2);
	clearInstantPrinting();
	hideHPPPWindows();
	closeAllWindows();
	windowTick();
	unfreezeEntities();
}

/// $C13CE5
void showTownMap() {
	if (findItemInInventory2(0xFF, ItemID.townMap) == 0) {
		return;
	}
	freezeEntities();
	displayTownMap();
	unfreezeEntities();
}

/// $C13D03
void debugYButtonFlag() {
	short x02 = EventFlag.temp0;
	while (true) {
		setInstantPrinting();
		createWindowN(Window.fileSelectMenu);
		setCurrentWindowPadding(3);
		printNumber(x02);
		unknownC43F77(0x20);
		nextVWFTile();
		printString(0x100, (getEventFlag(x02) != 0) ? &debugOnText[0] : &debugOffText[0]);
		clearInstantPrinting();
		windowTick();
		short x12 = x02;
		while(true) {
			waitUntilNextFrame();
			if ((padHeld[0] & Pad.up) != 0) {
				x12++;
			} else if ((padHeld[0] & Pad.down) != 0) {
				x12--;
			} else if ((padHeld[0] & Pad.right) != 0) {
				x12 += 10;
			} else if ((padHeld[0] & Pad.left) != 0) {
				x12 -= 10;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				setEventFlag(x02, (getEventFlag(x02) != 0) ? 0 : 1);
			} else if ((padPress[0] & (Pad.b | Pad.select)) != 0) {
				closeWindow(Window.fileSelectMenu);
				return;
			}
			if ((x12 < 2000) && (x12 != 0)) {
				x02 = x12;
			}
		}
	}
}

/// $C13E0E
void debugYButtonGuide() {
	short x14 = 0;
	for (short i = 0; i < maxEntities; i++) {
		if (entityScriptTable[i] != -1) {
			x14++;
		}
	}
	setInstantPrinting();
	createWindowN(Window.fileSelectMenu);
	setCurrentWindowPadding(3);
	printNumber(x14);
	clearInstantPrinting();
	windowTick();
	while ((padPress[0] & (Pad.b | Pad.select)) == 0) {
		waitUntilNextFrame();
	}
	closeWindow(Window.fileSelectMenu);
}

/// $C13E7A
void debugSetCharacterLevel() {
	setInstantPrinting();
	createWindowN(Window.fileSelectMenu);
	short x04 = cast(short)numSelectPrompt(2);
	short x02 = charSelectPrompt(1, 1, null, null);
	if (x02 != 0) {
		resetCharLevelOne(x02, x04, 1);
		recoverHPAmtPercent(x02, 100, 0);
		recoverPPAmtPercent(x02, 100, 0);
	}
	closeWindow(Window.fileSelectMenu);
}

/// $C13EE7
void debugYButtonGoods() {
	short x04 = 0;
	outer: while (true) {
		setInstantPrinting();
		createWindowN(Window.fileSelectMenu);
		setCurrentWindowPadding(0x02);
		setCurrentWindowPadding(0x82);
		moveCurrentTextCursor(0, 0);
		printNumber(x04);
		moveCurrentTextCursor(3, 0);
		printItemName(x04);
		clearInstantPrinting();
		windowTick();
		short x02 = x04;
		while (true) {
			waitUntilNextFrame();
			if ((padHeld[0] & Pad.up) != 0) {
				x02++;
			} else if ((padHeld[0] & Pad.down) != 0) {
				x02--;
			} else if ((padHeld[0] & Pad.right) != 0) {
				x02 += 10;
			} else if ((padHeld[0] & Pad.left) != 0) {
				x02 -= 10;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				short x16 = charSelectPrompt(1, 1, null, null);
				if ((x16 != 0) && (findInventorySpace2(x16) != 0)) {
					giveItemToCharacter(x16, cast(ubyte)x04);
					if (canCharacterEquip(x16, x04) == 0) {
						break outer;
					}
					if (getItemType(x04) != 2) {
						break outer;
					}
					equipItem(x16, getInventoryCount(x16));
				}
			} else if ((padPress[0] & (Pad.b | Pad.select)) != 0) {
				break outer;
			}
		}
		if (x02 < 0x100) {
			break;
		} else {
			x04 = x02;
		}
	}
	closeWindow(Window.fileSelectMenu);
}

/// $C14012
DisplayTextState* unknownC14012() {
	unknown7E97B8++;
	if (unknown7E97B8 > 10) {
		unknown7E97B8 = 0;
	}
	return &displayTextStates[unknown7E97B8];
}

/// $C14049
void unknownC14049() {
	unknown7E97B8--;
	if (unknown7E97B8 > 10) {
		unknown7E97B8 = 9;
	}
}

/// $C14070
short unknownC14070(ubyte* arg1, ubyte* arg2) {
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
void* cc1C01(DisplayTextState* arg1, ubyte arg2) {
	unknownC19249(arg2 == 0 ? cast(short)getArgumentMemory() : arg2);
	return null;
}

/// $C140CF
void* cc1C11(DisplayTextState* arg1, ubyte arg2) {
	unknownEF01D2(arg2 == 0 ? cast(short)getArgumentMemory() : arg2);
	return null;
}

/// $C140EF
void* cc1C09(DisplayTextState* arg1, ubyte arg2) {
	setCurrentWindowPadding(arg2);
	return null;
}

/// $C140F9
void* cc1C00(DisplayTextState* arg1, ubyte arg2) {
	windowSetTextColor(arg2);
	return null;
}

/// $C14103
void* cc0A(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!string);
	arg1.textptr = getTextBlock(getCCParameters!ArgType(arg2));
	return null;
}

/// $C141D0
void* cc09(DisplayTextState* arg1, ubyte arg2) {
	if ((getWorkingMemory().integer != 0) && (getWorkingMemory().integer <= arg2)) {
		arg1.textptr += string.sizeof * (getWorkingMemory().integer - 1);
		ccArgumentGatheringLoopCounter = 0;
		return &cc0A;
	} else {
		arg1.textptr += string.sizeof * arg2;
		return null;
	}
}

/// $C14265
void* cc04(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!short);
	setEventFlag(getCCParameters!ArgType(arg2), 1);
	return null;
}

/// $C142AD - [05 XX XX] clear flag
void* cc05(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!short);
	setEventFlag(getCCParameters!ArgType(arg2), 0);
	return null;
}

/// $C142F5 - [06 XX XX ptr] - jump if flag set
void* cc06(DisplayTextState* arg1, ubyte arg2) {
	if (ccArgumentGatheringLoopCounter == 0) {
		ccArgumentStorage[ccArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
		return &cc06;
	} else if (getEventFlag(getCCParameters!short(cast(ubyte)arg2)) != 0) {
		ccArgumentGatheringLoopCounter = 0;
		return &cc0A;
	} else {
		arg1.textptr += string.sizeof;
		return null;
	}
}

/// $C1435F - [07 XX XX] get event flag
void* cc07(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!short);
	setWorkingMemory(WorkingMemory(getEventFlag(getCCParameters!ArgType(arg2))));
	return null;
}

/// $C143B8
void* cc1C08(DisplayTextState* arg1, ubyte arg2) {
	unknownC10EE3(arg2);
	return null;
}

/// $C143C2 - [18 01 XX] open window
void* cc1801(DisplayTextState* arg1, ubyte arg2) {
	createWindowN(arg2);
	return null;
}

/// $C143CC - [18 03 XX] switch to window
void* cc1803(DisplayTextState* arg1, ubyte arg2) {
	setWindowFocus(arg2);
	return null;
}

/// $C143D6 - [08 ptr] call
void* cc08(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!string);
	displayText(getTextBlock(getCCParameters!ArgType(arg2)));
	return null;
}

/// $C144A3
void* cc1F52(DisplayTextState* arg1, ubyte arg2) {
	int x06 = numSelectPrompt(arg2);
	if (x06 == -1) {
		setWorkingMemory(WorkingMemory(0));
		setArgumentMemory(0);
	} else {
		setWorkingMemory(WorkingMemory(x06));
	}
	return null;
}

/// $C14509 - [18 05 XX YY] force text alignment
void* cc1805(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1805Arguments);
	if (unknown7E5E71 != 0) {
		unknownC43D75(getCCParameters!ArgType(arg2).alignment, arg2);
	} else {
		moveCurrentTextCursor(getCCParameters!ArgType(arg2).alignment, arg2);
	}
	return null;
}

/// $C14558
void* cc0B(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(getWorkingMemory().integer == arg2 ? 1 : 0));
	return null;
}

/// $C14591
void* cc0C(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(getWorkingMemory().integer != arg2 ? 1 : 0));
	return null;
}

/// $C145CA
void* cc1C07(DisplayTextState* arg1, ubyte arg2) {
	unknownC1180D(arg2 == 0 ? cast(short)getArgumentMemory() : arg2, 1, 0);
	return null;
}

/// $C145EF
void* cc0D(DisplayTextState* arg1, ubyte arg2) {
	setArgumentMemory((arg2 != 0) ? getSecondaryMemory() : getWorkingMemory().integer);
	return null;
}

/// $C1461A
void* cc0E(DisplayTextState* arg1, ubyte arg2) {
	setSecondaryMemory(arg2 == 0 ? getArgumentMemory() & 0xFF : arg2);
	return null;
}

/// $C1463B
void* cc1A00(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1A00Arguments);
	setWorkingMemory(WorkingMemory(unknownC1244C(&getCCParameters!ArgType(arg2).partyScripts[0], getCCParameters!ArgType(arg2).display, 0)));
	return null;
}

/// $C1467D
void* cc1A01(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1A00Arguments);
	setWorkingMemory(WorkingMemory(unknownC1244C(&getCCParameters!ArgType(arg2).partyScripts[0], getCCParameters!ArgType(arg2).display, 1)));
	return null;
}

/// $C146BF
void* cc1C05(DisplayTextState* arg1, ubyte arg2) {
	printItemName(arg2 == 0 ? cast(short)getArgumentMemory() : arg2);
	return null;
}

/// $C146DE
void* cc1C06(DisplayTextState* arg1, ubyte arg2) {
	printWrappableString(PSITeleportDestination.name.length, &psiTeleportDestinationTable[arg2 == 0 ? cast(short)getArgumentMemory() : arg2].name[0]);
	return null;
}

/// $C14723
void* cc1910(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(unknownC190E6(arg2 == 0 ? cast(short)getArgumentMemory() : arg2)));
	return null;
}

/// $C14751
void* cc1F00(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F00Arguments);
	unknownC216AD(getCCParameters!ArgType(arg2).unused.useVariableIfZero(getArgumentMemory()), getCCParameters!ArgType(arg2).track);
	return null;
}

/// $C147A0
void* cc1F01(DisplayTextState* arg1, ubyte arg2) {
	stopMusicF(arg2);
	return null;
}

/// $C147AB
void* cc1F02(DisplayTextState* arg1, ubyte arg2) {
	playSfxAndUnknown(arg2 != 0 ? arg2 : cast(short)getArgumentMemory());
	return null;
}

/// $C147CC
void* cc1911(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(getPartyCharacterName(arg2 != 0 ? arg2 : cast(short)getArgumentMemory())[cast(short)-cast(int)(1 - getSecondaryMemory())]));
	return null;
}

/// $C14819
void* cc1928(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory((cc1C01Table[arg2].size < getSecondaryMemory()) ? 0 : (cast(ubyte*)cc1C01Table[arg2].address)[getSecondaryMemory() - 1]));
	return null;
}

/// $C1488D
void* cc1C03(DisplayTextState* arg1, ubyte arg2) {
	printLetter(arg2 != 0 ? arg2 : cast(short)getArgumentMemory());
	return null;
}

/// $C148AC
void* cc1D02(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory((getItemType(cast(short)getArgumentMemory()) == arg2) ? 1 : 0));
	return null;
}

/// $C148E9
void* cc1D08(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!short);
	setWorkingMemory(WorkingMemory(increaseWalletBalance(getCCParameters!ArgType(arg2).useVariableIfZero(getArgumentMemory()))));
	return null;
}

/// $C1494A
void* cc1D09(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!short);
	setWorkingMemory(WorkingMemory(decreaseWalletBalance(getCCParameters!ArgType(arg2).useVariableIfZero(getArgumentMemory()))));
	return null;
}

/// $C149B6
void* cc1E00(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	recoverHPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).amount,
		0
	);
	return null;
}

/// $C14A03
void* cc1E01(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	reduceHPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).amount,
		0
	);
	return null;
}
/// $C14A50
void* cc1E02(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	recoverHPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).amount,
		1
	);
	return null;
}

/// $C14A9D
void* cc1E03(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	reduceHPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).amount,
		1
	);
	return null;
}

/// $C14AEA
void* cc1E04(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	recoverPPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).amount,
		0
	);
	return null;
}

/// $C14B37
void* cc1E05(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	reducePPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).amount,
		0
	);
	return null;
}

/// $C14B84
void* cc1E06(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	recoverPPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).amount,
		1
	);
	return null;
}

/// $C14BD1
void* cc1E07(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	reducePPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).amount,
		1
	);
	return null;
}

/// $C14C1E
void* cc1D00(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setWorkingMemory(WorkingMemory(giveItemToCharacter(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	)));
	return null;
}

/// $C14C86
void* cc1D01(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setWorkingMemory(WorkingMemory(takeItemFromCharacter(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	)));
	return null;
}

/// $C14CEE
void* cc1D03(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(findInventorySpace2(arg2 != 0 ? arg2 : cast(short)getArgumentMemory())));
	return null;
}

/// $C14D24
void* cc1D04(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setWorkingMemory(WorkingMemory(unknownC3E9F7(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	)));
	return null;
}

/// $C14D93
void* cc1D05(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setWorkingMemory(WorkingMemory(findItemInInventory2(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	)));
	return null;
}

/// $C14DFB
void* cc1F20(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F20Arguments);
	setTeleportState(
		getCCParameters!ArgType(arg2).p1.useVariableIfZero(getWorkingMemory().integer),
		cast(TeleportStyle)getCCParameters!ArgType(arg2).p2.useVariableIfZero(getArgumentMemory())
	);
	return null;
}

/// $C14E8C
void* cc1F21(DisplayTextState* arg1, ubyte arg2) {
	teleport(arg2 != 0 ? arg2 : cast(short)getArgumentMemory());
	return null;
}

/// $C14EAB
void* cc10(DisplayTextState* arg1, ubyte arg2) {
	unknownC100D6(arg2);
	return null;
}

/// $C14EB5
void* cc1A06(DisplayTextState* arg1, ubyte arg2) {
	clearInstantPrinting();
	createWindowN(currentFocusWindow);
	windowTick();
	setWorkingMemory(WorkingMemory(unknownC19DB5(arg2 != 0 ? arg2 : cast(short)getArgumentMemory())));
	setWindowFocus(currentFocusWindow);
	return null;
}

/// $C14EF8
void* cc1D0A(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(itemData[arg2 != 0 ? arg2 : cast(short)getArgumentMemory()].cost));
	return null;
}

/// $C14F33
void* cc1D0B(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(itemData[arg2 != 0 ? arg2 : cast(short)getArgumentMemory()].cost / 2));
	return null;
}

/// $C14F6F
void* cc1F81(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setWorkingMemory(WorkingMemory(canCharacterEquip(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	)));
	return null;
}

/// $C14FD7
void* cc1C02(DisplayTextState* arg1, ubyte arg2) {
	if (arg2 == 0xFF) {
		unknownC1931B(cast(short)getActiveWindowAddress().result.integer);
	} else {
		unknownC1931B(arg2 != 0 ? arg2 : cast(short)getArgumentMemory());
	}
	return null;
}

/// $C15007
void* cc1916(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1916Arguments);
	setWorkingMemory(WorkingMemory(checkStatusGroup(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).statusGroup.useVariableIfZero(getArgumentMemory())
	)));
	return null;
}

/// $C1506F
void* cc1905(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1905Arguments);
	setWorkingMemory(WorkingMemory(inflictStatusNonBattle(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).statusGroup.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).status
	)));
	return null;
}

/// $C150E4
void* cc1D0D(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1905Arguments);
	setWorkingMemory(WorkingMemory(checkStatusGroup(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).statusGroup.useVariableIfZero(getArgumentMemory())) == getCCParameters!ArgType(arg2).status ? 1 : 0));
	return null;
}

/// $C1516B
void* cc1C14(DisplayTextState* arg1, ubyte arg2) {
	ushort a;
	if (currentAttacker.side == BattleSide.foes) {
		if (arg2 != 1) {
			if (enemiesInBattle > 3) {
				a = 3;
			} else {
				a = enemiesInBattle;
			}
		} else {
			a = enemyConfigurationTable[currentAttacker.id].gender;
		}
	} else {
		if (arg2 != 1) {
			short x = unknownC2272F();
			if (x > 3) {
				a = 3;
			} else {
				a = x;
			}
		} else {
			a = (currentAttacker.id == 2) ? 2 : 1;
		}
	}
	setWorkingMemory(WorkingMemory(a));
	return null;
}

/// $C151FC
void* cc1C15(DisplayTextState* arg1, ubyte arg2) {
	ushort a;
	if (currentTarget.side == BattleSide.foes) {
		if (arg2 != 1) {
			if (enemiesInBattle > 3) {
				a = 3;
			} else {
				a = enemiesInBattle;
			}
		} else {
			a = enemyConfigurationTable[currentTarget.id].gender;
		}
	} else {
		if (arg2 != 1) {
			short x = unknownC2272F();
			if (x > 3) {
				a = 3;
			} else {
				a = x;
			}
		} else {
			a = (currentTarget.id == 2) ? 2 : 1;
		}
	}
	setWorkingMemory(WorkingMemory(a));
	return null;
}

/// $C1528D - [18 07 XX XX XX XX YY]
void* cc1807(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1807Arguments);
	uint x0A = getCCParameters!ArgType(arg2).value;
	uint x06 = (getCCParameters!ArgType(arg2).register == 0) ? getWorkingMemory().integer : (getCCParameters!ArgType(arg2).register == 1) ? getArgumentMemory() : getSecondaryMemory;
	short tmp;
	if (x06 < x0A) {
		tmp = 0;
	} else if (x06 == x0A) {
		tmp = 1;
	} else {
		tmp = 2;
	}
	setWorkingMemory(WorkingMemory(tmp));
	return null;
}

/// $C153AF
void* cc1C0A(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	printNumber(getCCParameters!ArgType(arg2).useVariableIfZero(getArgumentMemory()));
	return null;
}

/// $C15384
void* cc1918(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(getRequiredEXP(arg2.useVariableIfZero(getArgumentMemory()))));
	return null;
}

/// $C15494
void* cc1F60(DisplayTextState* arg1, ubyte arg2) {
	unknownC100FE(arg2);
	return null;
}

/// $C1549E
void* cc1A05(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1A05Arguments);
	if (currentFocusWindow == 1) {
		unknownEF0115(1);
		windowStats[windowTable[currentFocusWindow]].textY = 0;
		windowStats[windowTable[currentFocusWindow]].textX = 0;
		unknownC20A20(&arg1.savedTextAttributes);
		unknown7E5E71 = 0;
	}
	inventoryGetItemName(getCCParameters!ArgType(arg2).window, getCCParameters!ArgType(arg2).character.useVariableIfZero(getArgumentMemory()));
	return null;
}

/// $C15529 - [18 08 XX] selection menu, no cancelling
void* cc1808(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(unknownC19A11(0, arg2)));
	return null;
}

/// $C1554E - [18 09 XX] selection menu
void* cc1809(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(unknownC19A11(1, arg2)));
	return null;
}

/// $C15573
void* cc1C0B(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	unknownC4507A(getCCParameters!ArgType(arg2).useVariableIfZero(getArgumentMemory()));
	return null;
}

/// $C15659
void* cc1D0E(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short x12 = giveItemToCharacter(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	);
	setArgumentMemory(getInventoryCount(x12));
	setWorkingMemory(WorkingMemory(x12));
	return null;
}

/// $C156DB
void* cc1D0F(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short x02 = getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer);
	short x12 = getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory());
	setArgumentMemory(getCharacterItem(x02, x12));
	setWorkingMemory(WorkingMemory(removeItemFromInventory(x02, x12)));
	return null;
}

/// $C1575D
void* cc1D10(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setWorkingMemory(WorkingMemory(checkItemEquipped(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	)));
	return null;
}

/// $C157CD
void* cc1D11(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short x02 = getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer);
	setWorkingMemory(WorkingMemory(canCharacterEquip(x02, getCharacterItem(x02, getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())))));
	return null;
}

/// $C1583D
void* cc1F83(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setArgumentMemory(equipItem(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	));
	return null;
}

/// $C158A5
void* cc1D12(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	escargoExpressMove(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	);
	return null;
}

/// $C158FE
void* cc1D13(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short x12 = giveStoredItemToCharacter(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())
	);
	setArgumentMemory(getInventoryCount(x12));
	setWorkingMemory(WorkingMemory(x12));
	return null;
}

/// $C1597F
void* cc1919(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short x02 = getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer);
	setArgumentMemory(getCharacterItem(x02, getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory())));
	setWorkingMemory(WorkingMemory(x02));
	return null;
}

/// $C159F9
void* cc1D14(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	uint x06 = getCCParameters!ArgType(arg2);
	setWorkingMemory(WorkingMemory((x06.useVariableIfZero(getArgumentMemory()) < gameState.moneyCarried) ? 1 : 0));
	return null;
}

/// $C15B0E
void* cc191A(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(gameState.escargoExpressItems[(arg2 != 0 ? arg2 : getArgumentMemory()) - 1]));
	return null;
}

/// $C15B46 - [18 0D XX YY] print character status info
void* cc180D(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC180DArguments);
	short tmp = getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer);
	switch (getCCParameters!ArgType(arg2).unknown) {
		case 1:
			unknownC1952F(tmp);
			break;
		case 2:
			nullC3EF23(tmp);
			break;
		default: break;
	}
	return null;
}

/// $C15BA7
void* cc1C0C(DisplayTextState* arg1, ubyte arg2) {
	unknownC1180D(arg2 != 0 ? arg2 : cast(ushort)getArgumentMemory(), 0, 0);
	return null;
}

/// $C15BCA
void* cc1D15(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	setWorkingMemory(WorkingMemory(getCCParameters!ArgType(arg2).useVariableIfZero(getArgumentMemory()) * unknownC226F0()));
	return null;
}

/// $C15C36
void* cc191B(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(unknownC12BD5(arg2)));
	return null;
}

/// $C15C58
void* cc1F71(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	learnSpecialPSI(getCCParameters!ArgType(arg2));
	return null;
}

/// $C15C85
void* cc1D06(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	uint x06 = getCCParameters!ArgType(arg2);
	depositIntoATM((x06 == 0) ? getArgumentMemory() : x06);
	return null;
}

/// $C15D6B
void* cc1D07(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	uint x06 = getCCParameters!ArgType(arg2);
	uint amount = (x06 == 0) ? getArgumentMemory() : x06;
	withdrawFromATM(amount);
	setWorkingMemory(WorkingMemory(amount));
	return null;
}

/// $C15E5C
void* cc1D17(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	uint x06 = getCCParameters!ArgType(arg2);
	setWorkingMemory(WorkingMemory(gameState.bankBalance > x06 ? 0 : 1));
	return null;
}

/// $C15F71
void* cc1F11(DisplayTextState* arg1, ubyte arg2) {
	addCharToParty(arg2 != 0 ? arg2 : cast(short)getArgumentMemory());
	return null;
}

/// $C15F91
void* cc1F12(DisplayTextState* arg1, ubyte arg2) {
	removeCharFromParty(arg2 != 0 ? arg2 : cast(short)getArgumentMemory());
	return null;
}

/// $C15FB1
void queueItemForDelivery(short character, short item) {
	for (short i = 0; i < 3; i++) {
		if (gameState.deliveryQueueItem[i] != 0) {
			continue;
		}
		gameState.deliveryQueueItem[i] = cast(ubyte)item;
		gameState.deliveryQueueCharacter[i] = cast(ubyte)character;
	}
}

/// $C15FF7
void* cc191C(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC191CArguments);
	short x04 = getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer);
	short x0E = getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory());
	short x02;
	if (x04 == 0xFF) {
		x02 = escargoExpressRemove(x0E);
	} else {
		x02 = getCharacterItem(x04, x0E);
		removeItemFromInventory(x04, x0E);
	}
	queueItemForDelivery(x04, x02);
	return null;
}

/// $C16080
void* cc191D(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC191DArguments);
	short tmp = getCCParameters!ArgType(arg2).queuedItem.useVariableIfZero(getWorkingMemory().integer) - 1;
	setWorkingMemory(WorkingMemory(gameState.deliveryQueueCharacter[tmp]));
	setArgumentMemory(gameState.deliveryQueueItem[tmp]);
	if (getCCParameters!ArgType(arg2).remove != 0) {
		gameState.deliveryQueueItem[tmp] = 0;
		gameState.deliveryQueueCharacter[tmp] = 0;
	}
	return null;
}

/// $C16124
void* cc1D18(DisplayTextState* arg1, ubyte arg2) {
	escargoExpressStore(arg2 != 0 ? arg2 : cast(short)getArgumentMemory());
	return null;
}

/// $C16143
void* cc1921(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(getItemSubtype2(arg2.useVariableIfZero(getArgumentMemory()))));
	return null;
}

/// $C16172
void* cc1D19(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory((gameState.playerControlledPartyMemberCount < (arg2.useVariableIfZero(getArgumentMemory()))) ? 1 : 0));
	return null;
}

/// $C161D1
void* cc1C12(DisplayTextState* arg1, ubyte arg2) {
	printPSIName(arg2 != 0 ? arg2 : cast(short)getArgumentMemory());
	return null;
}

/// $C161F0
void* cc1D21(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(randMod(arg2 != 0 ? arg2 : cast(short)getArgumentMemory())));
	return null;
}

/// $C1621F
void* unknownC1621F(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!string);
	displayText(getTextBlock(getCCParameters!ArgType(arg2)));
	arg1.textptr += unknown7E97D5 * string.sizeof;
	return null;
}

/// $C16308
void* cc1FC0(DisplayTextState* arg1, ubyte arg2) {
	if ((getWorkingMemory().integer != 0) && (getWorkingMemory().integer < arg2)) {
		unknown7E97D5 = cast(short)(arg2 - cast(short)getWorkingMemory().integer);
		arg1.textptr += (cast(short)getWorkingMemory().integer - 1) * string.sizeof;
		ccArgumentGatheringLoopCounter = 0;
		return &unknownC1621F;
	} else {
		arg1.textptr += arg2 * string.sizeof;
		return null;
	}
}

/// $C163A7
void* cc1FD0(DisplayTextState* arg1, ubyte arg2) {
	short x12 = unknownC3F1EC(arg2.useVariableIfZero(getArgumentMemory()));
	setWorkingMemory(WorkingMemory(x12 != 0 ? unknownC1D038(x12) : 0));
	setArgumentMemory(x12);
	return null;
}

/// $C163FD
void* cc1F13(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F13Arguments);
	unknownC46363(
		getCCParameters!ArgType(arg2).arg1.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).arg2.useVariableIfZero(getArgumentMemory()) - 1
	);
	return null;
}

/// $C1646E
void* cc1F14(DisplayTextState* arg1, ubyte arg2) {
	unknownC46397(cast(short)((arg2 != 0 ? arg2 : getArgumentMemory()) - 1));
	return null;
}

/// $C16490
void* cc1F16(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F16Arguments);
	unknownC462FF(
		getCCParameters!ArgType(arg2).arg1.useVariableIfZero(getWorkingMemory().integer),
		cast(short)(getCCParameters!ArgType(arg2).arg1.useVariableIfZero(getArgumentMemory()) - 1)
	);
	return null;
}

/// $C16509
void* cc1F17(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F17Arguments);
	unknownC4C91A(
		createPreparedEntityNPC(
			getCCParameters!ArgType(arg2).arg1,
			getCCParameters!ArgType(arg2).arg2
		),
		getCCParameters!ArgType(arg2).arg3);
	return null;
}

/// $C16582
void* cc1F18(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F18Arguments);
	return null;
}

/// $C165AA
void* cc1F19(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F19Arguments);
	return null;
}

/// $C165D2
void* cc1F1A(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F1AArguments);
	unknownC4B524(
		getCCParameters!ArgType(arg2).tpt,
		getCCParameters!ArgType(arg2).sprite
	);
	return null;
}

/// $C1662A
void* cc1F1B(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	unknownC4B53F(getCCParameters!ArgType(arg2));
	return null;
}

/// $C1666D
void* cc1F1C(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F1CArguments);
	unknownC4B4FE(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		cast(short)(getCCParameters!ArgType(arg2).sprite.useVariableIfZero(getArgumentMemory()) - 1)
	);
	return null;
}

/// $C166DD
void* cc1F1D(DisplayTextState* arg1, ubyte arg2) {
	unknownC4B519(cast(ushort)(arg2 != 0 ? arg2 : getWorkingMemory().integer));
	return null;
}

/// $C166FE
void* cc1FE1(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FE1Arguments);
	changeMapPalette(
		getCCParameters!ArgType(arg2).tileset,
		getCCParameters!ArgType(arg2).palette,
		getCCParameters!ArgType(arg2).speed
	);
	return null;
}

/// $C16744
void* cc1F15(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F15Arguments);
	if (getCCParameters!ArgType(arg2).style == 0xFF) {
		unknownC06578(
			getCCParameters!ArgType(arg2).sprite,
			getCCParameters!ArgType(arg2).actionScript
		);
	} else {
		unknownC4C91A(
			createPreparedEntitySprite(
				getCCParameters!ArgType(arg2).sprite,
				getCCParameters!ArgType(arg2).actionScript
			),
			getCCParameters!ArgType(arg2).style
		);
	}
	return null;
}

/// $C167D6
void* cc1F1E(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F1EArguments);
	unknownC4C91A(findEntityByTPT(getCCParameters!ArgType(arg2).tpt), getCCParameters!ArgType(arg2).style);
	unknownC460CE(getCCParameters!ArgType(arg2).tpt, getCCParameters!ArgType(arg2).style);
	return null;
}

/// $C1683B
void* cc1F1F(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F1EArguments);
	unknownC4C91A(findEntityBySprite(getCCParameters!ArgType(arg2).tpt), getCCParameters!ArgType(arg2).style);
	unknownC46125(getCCParameters!ArgType(arg2).tpt, getCCParameters!ArgType(arg2).style);
	return null;
}

/// $C168A0
void* cc1922(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1922Arguments);
	setArgumentMemory(
		unknownC462E4(
			getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
			getCCParameters!ArgType(arg2).type - 1,
			getCCParameters!ArgType(arg2).target.useVariableIfZero(getArgumentMemory())
		) + 1
	);
	return null;
}

/// $C16947
void* cc1923(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1923Arguments);
	setArgumentMemory(
		unknownC462AE(
			getCCParameters!ArgType(arg2).npc.useVariableIfZero(getWorkingMemory().integer),
			getCCParameters!ArgType(arg2).type - 1,
			getCCParameters!ArgType(arg2).target.useVariableIfZero(getArgumentMemory())
		) + 1
	);
	return null;
}

/// $C169F7
void* cc1F62(DisplayTextState* arg1, ubyte arg2) {
	enableBlinkingTriangle(arg2);
	return null;
}

/// $C16A01
void* cc1E08(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1E08Arguments);
	resetCharLevelOne(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).level.useVariableIfZero(getArgumentMemory()),
		1
	);
	return null;
}

/// $C16A7B
void* cc1924(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1924Arguments);
	setArgumentMemory(
		unknownC462C9(
			getCCParameters!ArgType(arg2).entity.useVariableIfZero(getWorkingMemory().integer),
			getCCParameters!ArgType(arg2).type - 1,
			getCCParameters!ArgType(arg2).target.useVariableIfZero(getArgumentMemory())
		) + 1
	);
	return null;
}

/// $C16B2B
void* cc1FE4(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FE4Arguments);
	unknownC46331(
		getCCParameters!ArgType(arg2).arg1.useVariableIfZero(getWorkingMemory().integer),
		getCCParameters!ArgType(arg2).arg2.useVariableIfZero(getArgumentMemory())
	);
	return null;
}

/// $C16BA4
void* cc1FE5(DisplayTextState* arg1, ubyte arg2) {
	disableEntityByCharacterOrParty(arg2);
	return null;
}

/// $C16BAF
void* cc1FE6(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	disableEntityByTPT(getCCParameters!ArgType(arg2));
	return null;
}

/// $C16BF2
void* cc1FE7(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	disableEntityBySprite(getCCParameters!ArgType(arg2));
	return null;
}

/// $C16C35
void* cc1FE8(DisplayTextState* arg1, ubyte arg2) {
	enableEntityByCharacterOrParty(arg2);
	return null;
}

/// $C16C40
void* cc1FE9(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	enableEntityByTPT(getCCParameters!ArgType(arg2));
	return null;
}

/// $C16C83
void* cc1FEA(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	enableEntityBySprite(getCCParameters!ArgType(arg2));
	return null;
}

/// $C16CC6
void* cc1FEB(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FEBArguments);
	unknownC4C91A(findEntityByPartyMemberID(getCCParameters!ArgType(arg2).arg1), getCCParameters!ArgType(arg2).arg2);
	hideCharacterOrParty(getCCParameters!ArgType(arg2).arg1);
	return null;
}

/// $C16D14
void* cc1FEC(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FECArguments);
	unknownC4C91A(findEntityByPartyMemberID(getCCParameters!ArgType(arg2).arg1), getCCParameters!ArgType(arg2).arg2);
	unhideCharacterOrParty(getCCParameters!ArgType(arg2).arg1);
	return null;
}

/// $C16D62
void* cc1FEE(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	focusCameraOnTPT(getCCParameters!ArgType(arg2));
	return null;
}

/// $C16DA5
void* cc1FEF(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	focusCameraOnSprite(getCCParameters!ArgType(arg2));
	return null;
}

/// $C16DE8
void* cc1F63(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!string);
	disableEntityByCharacterOrParty(0xFF);
	unknownC064E3(10, QueuedInteractionPtr(getTextBlock(getCCParameters!ArgType(arg2))));
	return null;
}

/// $C16EBF
void* cc1FF1(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FF1Arguments);
	changeScriptForEntityByTPT(getCCParameters!ArgType(arg2).arg1, getCCParameters!ArgType(arg2).arg2);
	return null;
}

/// $C16F2F
void* cc1FF2(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FF2Arguments);
	changeScriptForEntityBySprite(getCCParameters!ArgType(arg2).arg1, getCCParameters!ArgType(arg2).arg2);
	return null;
}

/// $C16F9F
void* cc1925(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(findCondiment(cast(short)(arg2 != 0 ? arg2 : getArgumentMemory()))));
	return null;
}

/// $C16FD1
void* cc1F23(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	setWorkingMemory(WorkingMemory(initBattleScripted(getCCParameters!ArgType(arg2).useVariableIfZero(getArgumentMemory()))));
	return null;
}

/// $C17037
void* cc1926(DisplayTextState* arg1, ubyte arg2) {
	setTeleportBoxDestination(arg2.useVariableIfZero(getArgumentMemory()));
	return null;
}

/// $C17058
void* cc1D0C(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D0CArguments);
	setWorkingMemory(WorkingMemory((unknownC190F1() != 0 ? 2 : 0) | ((itemData[partyCharacters[getCCParameters!ArgType(arg2).item.useVariableIfZero(getArgumentMemory()) - 1].items[getCCParameters!ArgType(arg2).character.useVariableIfZero(getWorkingMemory().integer)]].flags & ItemFlags.unknown) != 0 ? 1 : 0)));
	return null;
}

/// $C1711C
void* cc1F66(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F66Arguments);
	activateHotspot(
		getCCParameters!ArgType(arg2).arg1.useVariableIfZero(getArgumentMemory()),
		getCCParameters!ArgType(arg2).arg2.useVariableIfZero(getWorkingMemory().integer),
		getTextBlock(getCCParameters!ArgType(arg2).arg3)
	);
	return null;
}

/// $C17233
void* cc1F67(DisplayTextState* arg1, ubyte arg2) {
	disableHotspot(cast(short)(arg2 != 0 ? arg2 : getArgumentMemory()));
	return null;
}

/// $C17254
void* cc1F04(DisplayTextState* arg1, ubyte arg2) {
	setTextSoundMode(cast(short)(arg2 != 0 ? arg2 : getArgumentMemory()));
	return null;
}

/// $C17274
void* cc1D24(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(gameState.unknownC4));
	if (arg2 == 2) {
		gameState.unknownC4 = 0;
	}
	return null;
}

/// $C172BC
void* cc1F40(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	return null;
}

/// $C172DA - [1F 41 XX] Trigger special event
void* cc1F41(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(WorkingMemory(triggerSpecialEvent(arg2)));
	return null;
}

/// $C17304 - [1F D2 XX] Summon travelling photographer
void* cc1FD2(DisplayTextState* arg1, ubyte arg2) {
	spawnTravellingPhotographer(cast(short)(arg2 != 0 ? arg2 : getArgumentMemory()));
	return null;
}

/// $C17325
void* cc1FF3(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FF3Arguments);
	unknownC4B54A(getCCParameters!ArgType(arg2).arg1, getCCParameters!ArgType(arg2).arg2);
	return null;
}

/// $C1737D
void* cc1FF4(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	unknownC4B565(getCCParameters!ArgType(arg2));
	return null;
}

/// $C173C0
void* cc1C13(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1C13Arguments);
	if (getBlinkingPrompt() != 0) {
		setWorkingMemory(
			WorkingMemory(
				unknownC3FAC9(
					cast(short)(getCCParameters!ArgType(arg2).allyAnimation - 1),
					cast(short)(getCCParameters!ArgType(arg2).enemyAnimation - 1)
				)
			)
		);
	}
	return null;
}

/// $C1741F
void* cc1F07(DisplayTextState* arg1, ubyte arg2) {
	musicEffect(cast(short)(arg2 != 0 ? arg2 : getArgumentMemory()));
	return null;
}

/// $C17440
void* cc1FD3(DisplayTextState* arg1, ubyte arg2) {
	getDeliverySpriteAndPlaceholder(arg2);
	return null;
}

/// $C1744B
void* cc1E09(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1E09Arguments);
	gainEXP(getCCParameters!ArgType(arg2).character, 1, getCCParameters!ArgType(arg2).amount);
	return null;
}

/// $C17523
void* cc1E0A(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	partyCharacters[getCCParameters!ArgType(arg2).character - 1].boostedIQ += getCCParameters!ArgType(arg2).amount;
	recalcCharacterPostmathIQ(getCCParameters!ArgType(arg2).character);
	return null;
}

/// $C17584
void* cc1E0B(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	partyCharacters[getCCParameters!ArgType(arg2).character - 1].boostedGuts += getCCParameters!ArgType(arg2).amount;
	recalcCharacterPostmathGuts(getCCParameters!ArgType(arg2).character);
	return null;
}

/// $C175E5
void* cc1E0C(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	partyCharacters[getCCParameters!ArgType(arg2).character - 1].boostedSpeed += getCCParameters!ArgType(arg2).amount;
	recalcCharacterPostmathSpeed(getCCParameters!ArgType(arg2).character);
	return null;
}

/// $C17646
void* cc1E0D(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	partyCharacters[getCCParameters!ArgType(arg2).character - 1].boostedVitality += getCCParameters!ArgType(arg2).amount;
	recalcCharacterPostmathVitality(getCCParameters!ArgType(arg2).character);
	return null;
}

/// $C176A7
void* cc1E0E(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	partyCharacters[getCCParameters!ArgType(arg2).character - 1].boostedLuck += getCCParameters!ArgType(arg2).amount;
	recalcCharacterPostmathLuck(getCCParameters!ArgType(arg2).character);
	return null;
}

/// $C17708
void* cc1D23(DisplayTextState* arg1, ubyte arg2) {
	int x06;
	switch (itemData[cast(ushort)((arg2 != 0) ? arg2 : getArgumentMemory())].type & 0xC) {
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
	setWorkingMemory(WorkingMemory(x06));
	return null;
}

/// $C1776A
void* cc1927(DisplayTextState* arg1, ubyte arg2) {
	setWorkingMemory(unknownC3EE7A(cast(ushort)((arg2 != 0) ? arg2 : getArgumentMemory())));
	return null;
}

/// $C17796
void* unknownC17796(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!string);
	unknownC113D1(&unknown7E97D7[0], getCCParameters!ArgType(arg2));
	return null;
}

/// $C17889
void* unknownC17889(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 1:
			unknown7E97D7[ccArgumentGatheringLoopCounter] = 0;
			ccArgumentGatheringLoopCounter = 0;
			return &unknownC17796;
		case 2:
			unknown7E97D7[ccArgumentGatheringLoopCounter] = 0;
			unknownC113D1(&unknown7E97D7[0], null);
			return null;
		default:
			unknown7E97D7[ccArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
			return &unknownC17889;
	}
}

/// $C1790B
void* cc18Tree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x00:
			closeFocusWindow();
			break;
		case 0x01:
			return &cc1801;
		case 0x02:
			unknownC20A20(&arg1.savedTextAttributes);
			arg1.unknown4 = 1;
			break;
		case 0x03:
			return &cc1803;
		case 0x04:
			closeAllWindows();
			hideHPPPWindows();
			windowTick();
			break;
		case 0x05:
			return &cc1805;
		case 0x06:
			clearFocusWindow();
			break;
		case 0x07:
			return &cc1807;
		case 0x08:
			return &cc1808;
		case 0x09:
			return &cc1809;
		case 0x0A:
			unknownC1AA18();
			break;
		case 0x0D:
			return &cc180D;
		default: break;
	}
	return null;
}

/// $C178F7
void* cc1902(DisplayTextState* arg1, ubyte arg2) {
	unknown7E97D7[ccArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
	return &unknownC17889;
}

/// $C179AA
void* cc19Tree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x02:
			return &cc1902;
		case 0x04:
			unknownC11383();
			break;
		case 0x05:
			return &cc1905;
		case 0x10:
			return &cc1910;
		case 0x11:
			return &cc1911;
		case 0x14:
			setWorkingMemory(WorkingMemory(gameState.escargoExpressItems[getSecondaryMemory() - 1]));
			incrementSecondaryMemory();
			break;
		case 0x16:
			return &cc1916;
		case 0x18:
			return &cc1918;
		case 0x19:
			return &cc1919;
		case 0x1A:
			return &cc191A;
		case 0x1B:
			return &cc191B;
		case 0x1C:
			return &cc191C;
		case 0x1D:
			return &cc191D;
		case 0x1E:
			setWorkingMemory(WorkingMemory(unknownC1AD26()));
			break;
		case 0x1F:
			setWorkingMemory(WorkingMemory(unknownC1AD02()));
			break;
		case 0x20:
			setWorkingMemory(WorkingMemory(gameState.playerControlledPartyMemberCount));
			break;
		case 0x21:
			return &cc1921;
		case 0x22:
			return &cc1922;
		case 0x23:
			return &cc1923;
		case 0x24:
			return &cc1924;
		case 0x25:
			return &cc1925;
		case 0x26:
			return &cc1926;
		case 0x27:
			return &cc1927;
		case 0x28:
			return &cc1928;
		default: break;
	}
	return null;
}

/// $C17B56
void* cc1ATree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x00:
			return &cc1A00;
		case 0x01:
			return &cc1A01;
		case 0x04:
			setWorkingMemory(WorkingMemory(selectionMenu(0)));
			unknownC11383();
			break;
		case 0x05:
			return &cc1A05;
		case 0x06:
			return &cc1A06;
		case 0x07:
			setWorkingMemory(WorkingMemory(unknownC19A43()));
			break;
		case 0x08:
			setWorkingMemory(WorkingMemory(selectionMenu(0)));
			break;
		case 0x09:
			setWorkingMemory(WorkingMemory(selectionMenu(1)));
			break;
		case 0x0A:
			setWorkingMemory(WorkingMemory(unknownC1AC00()));
			break;
		case 0x0B:
			setWorkingMemory(WorkingMemory(unknownC1AAFA()));
			break;
		default: break;
	}
	return null;
}

/// $C17C36
void* cc1BTree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x00:
			transferActiveMemStorage();
			break;
		case 0x01:
			transferStorageMemActive();
			break;
		case 0x02:
			if (getWorkingMemory().integer == 0) {
				return &cc0A;
			} else {
				arg1.textptr += string.sizeof;
			}
			break;
		case 0x03:
			if (getWorkingMemory().integer != 0) {
				return &cc0A;
			} else {
				arg1.textptr += string.sizeof;
			}
			break;
		case 0x04:
			uint x12 = getWorkingMemory().integer;
			setWorkingMemory(WorkingMemory(getArgumentMemory()));
			setArgumentMemory(x12);
			break;
		case 0x05:
			wramScriptWorkMemory = getWorkingMemory();
			wramScriptArgMemory = getArgumentMemory();
			wramScriptSecMemory = cast(ubyte)getSecondaryMemory();
			break;
		case 0x06:
			setWorkingMemory(wramScriptWorkMemory);
			setArgumentMemory(wramScriptArgMemory);
			setSecondaryMemory(wramScriptSecMemory);
			break;
		default: break;
	}
	return null;
}

/// $C17D94
void* cc1CTree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x00:
			return &cc1C00;
		case 0x01:
			return &cc1C01;
		case 0x02:
			return &cc1C02;
		case 0x03:
			return &cc1C03;
		case 0x04:
			showHPPPWindows();
			break;
		case 0x05:
			return &cc1C05;
		case 0x06:
			return &cc1C06;
		case 0x07:
			return &cc1C07;
		case 0x08:
			return &cc1C08;
		case 0x09:
			return &cc1C09;
		case 0x0A:
			return &cc1C0A;
		case 0x0B:
			return &cc1C0B;
		case 0x0C:
			return &cc1C0C;
		case 0x14:
			return &cc1C14;
		case 0x15:
			return &cc1C15;
		case 0x0D:
			unknownC3E75D(0);
			printWrappableString(0x50, returnBattleAttackerAddress());
			break;
		case 0x0E:
			unknownC3E75D(1);
			printWrappableString(0x50, returnBattleTargetAddress());
			break;
		case 0x0F:
			printNumber(unknownC1AD26());
			break;
		case 0x11:
			return &cc1C11;
		case 0x12:
			return &cc1C12;
		case 0x13:
			return &cc1C13;
		default: break;
	}
	return null;
}

/// $C17F11
void* cc1DTree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x00:
			return &cc1D00;
		case 0x01:
			return &cc1D01;
		case 0x02:
			return &cc1D02;
		case 0x03:
			return &cc1D03;
		case 0x04:
			return &cc1D04;
		case 0x05:
			return &cc1D05;
		case 0x06:
			return &cc1D06;
		case 0x07:
			return &cc1D07;
		case 0x08:
			return &cc1D08;
		case 0x09:
			return &cc1D09;
		case 0x0A:
			return &cc1D0A;
		case 0x0B:
			return &cc1D0B;
		case 0x0C:
			return &cc1D0C;
		case 0x0D:
			return &cc1D0D;
		case 0x0E:
			return &cc1D0E;
		case 0x0F:
			return &cc1D0F;
		case 0x10:
			return &cc1D10;
		case 0x11:
			return &cc1D11;
		case 0x12:
			return &cc1D12;
		case 0x13:
			return &cc1D13;
		case 0x14:
			return &cc1D14;
		case 0x15:
			return &cc1D15;
		case 0x17:
			return &cc1D17;
		case 0x18:
			return &cc1D18;
		case 0x19:
			return &cc1D19;
		case 0x20:
			short x14 = 0;
			if (unknownC14070(returnBattleTargetAddress(), returnBattleAttackerAddress()) == 0) {
				x14 = 1;
			}
			setWorkingMemory(WorkingMemory(x14));
			break;
		case 0x21:
			return &cc1D21;
		case 0x22:
			short x14 = 0;
			if ((loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & 7) == 2) {
				x14 = 1;
			}
			setWorkingMemory(WorkingMemory(x14));
			break;
		case 0x23:
			return &cc1D23;
		case 0x24:
			return &cc1D24;
		default: break;
	}
	return null;
}

/// $C1811F
void* cc1ETree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x00:
			return &cc1E00;
		case 0x01:
			return &cc1E01;
		case 0x02:
			return &cc1E02;
		case 0x03:
			return &cc1E03;
		case 0x04:
			return &cc1E04;
		case 0x05:
			return &cc1E05;
		case 0x06:
			return &cc1E06;
		case 0x07:
			return &cc1E07;
		case 0x08:
			return &cc1E08;
		case 0x09:
			return &cc1E09;
		case 0x0A:
			return &cc1E0A;
		case 0x0B:
			return &cc1E0B;
		case 0x0C:
			return &cc1E0C;
		case 0x0D:
			return &cc1E0D;
		case 0x0E:
			return &cc1E0E;
		default: break;
	}
	return null;
}

/// $C181BB
void* cc1FTree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x00:
			return &cc1F00;
		case 0x01:
			return &cc1F01;
		case 0x02:
			return &cc1F02;
		case 0x03:
			unknownC216AD(unknownC069F7(), 0);
			break;
		case 0x04:
			return &cc1F04;
		case 0x05:
			setBoundaryBehaviour(0);
			break;
		case 0x06:
			setBoundaryBehaviour(1);
			break;
		case 0x07:
			return &cc1F07;
		case 0x11:
			return &cc1F11;
		case 0x12:
			return &cc1F12;
		case 0x13:
			return &cc1F13;
		case 0x14:
			return &cc1F14;
		case 0x15:
			return &cc1F15;
		case 0x16:
			return &cc1F16;
		case 0x17:
			return &cc1F17;
		case 0x18:
			return &cc1F18;
		case 0x19:
			return &cc1F19;
		case 0x1A:
			return &cc1F1A;
		case 0x1B:
			return &cc1F1B;
		case 0x1C:
			return &cc1F1C;
		case 0x1D:
			return &cc1F1D;
		case 0x1E:
			return &cc1F1E;
		case 0x1F:
			return &cc1F1F;
		case 0x20:
			return &cc1F20;
		case 0x21:
			return &cc1F21;
		case 0x23:
			return &cc1F23;
		case 0x30:
		case 0x31: //yes, these are both the same
			changeCurrentWindowFont(arg2);
			break;
		case 0x40:
			return &cc1F40;
		case 0x41:
			return &cc1F41;
		case 0x50:
			lockInput();
			break;
		case 0x51:
			unlockInput();
			break;
		case 0x52:
			return &cc1F52;
		case 0x60:
			return &cc1F60;
		case 0x61:
			unknownC102D0();
			break;
		case 0x62:
			return &cc1F62;
		case 0x63:
			return &cc1F63;
		case 0x64:
			unknownC23008();
			break;
		case 0x65:
			unknownC2307B();
			break;
		case 0x66:
			return &cc1F66;
		case 0x67:
			return &cc1F67;
		case 0x68:
			gameState.exitMouseXCoordinate = gameState.leaderX.integer;
			gameState.exitMouseYCoordinate = gameState.leaderY.integer;
			break;
		case 0x69:
			for (short i = 1; i <= 10; i++) {
				setEventFlag(i, 0);
			}
			fadeOut(1, 1);
			playSfx(Sfx.equippedItem);
			loadMapAtPosition(gameState.exitMouseYCoordinate, gameState.exitMouseYCoordinate);
			unknown7E2890 = 0;
			unknownC03FA9(gameState.exitMouseXCoordinate, gameState.exitMouseYCoordinate, 4);
			fadeIn(1, 1);
			unknown7E5DC4 = -1;
			break;
		case 0x71:
			return &cc1F71;
		case 0x81:
			return &cc1F81;
		case 0x83:
			return &cc1F83;
		case 0x90:
			setWorkingMemory(WorkingMemory(unknownC19441()));
			break;
		case 0xA0:
			unknownC226C5(1);
			break;
		case 0xA1:
			unknownC226C5(0);
			break;
		case 0xA2:
			setWorkingMemory(WorkingMemory(unknownC226E6()));
			break;
		case 0xB0:
			saveCurrentGame();
			break;
		case 0xC0:
			return &cc1FC0;
		case 0xD0:
			return &cc1FD0;
		case 0xD1:
			setWorkingMemory(WorkingMemory(getDistanceToMagicTruffle()));
			break;
		case 0xD2:
			return &cc1FD2;
		case 0xD3:
			return &cc1FD3;
		case 0xE1:
			return &cc1FE1;
		case 0xE4:
			return &cc1FE4;
		case 0xE5:
			return &cc1FE5;
		case 0xE6:
			return &cc1FE6;
		case 0xE7:
			return &cc1FE7;
		case 0xE8:
			return &cc1FE8;
		case 0xE9:
			return &cc1FE9;
		case 0xEA:
			return &cc1FEA;
		case 0xEB:
			return &cc1FEB;
		case 0xEC:
			return &cc1FEC;
		case 0xED:
			clearCameraFocus();
			break;
		case 0xEE:
			return &cc1FEE;
		case 0xEF:
			return &cc1FEF;
		case 0xF0:
			getOnBicycle();
			break;
		case 0xF1:
			return &cc1FF1;
		case 0xF2:
			return &cc1FF2;
		case 0xF3:
			return &cc1FF3;
		case 0xF4:
			return &cc1FF4;
		default: break;
	}
	return null;
}

/// $C1866D
DisplayTextState* unknownC1866D(DisplayTextState* arg1, const(ubyte)* arg2) {
	if (arg1 is null) {
		return null;
	}
	arg1.unknown4 = 0;
	arg1.textptr = arg2;
	return arg1;
}

/// $C1869D
void unknownC1869D(DisplayTextState* arg1) {
	if (arg1 is null) {
		return;
	}
	if (arg1.unknown4 == 0) {
		return;
	}
	unknownC20ABC(&arg1.savedTextAttributes);
}

/// $C186B1 - Call a text script (script_ptr)
const(ubyte)* displayText(const(ubyte)* script_ptr) {
	void* function(DisplayTextState*, ubyte) x1E = null;
	ubyte x14;
	const(ubyte)* x1A = &battleBackRowText[12];
	if (script_ptr is null) {
		return script_ptr;
	}
	DisplayTextState* x12 = unknownC1866D(unknownC14012(), script_ptr);
	if (x12 is null) {
		return null;
	}
	size_t waitBytes = 0;
	loop: while (true) {
		debug(printTextTrace) if (x1E is null) {
			auto str = getFullCC(x1A[0] ? x1A : x12.textptr);
			tracef("Next text: [%(%02X %)]", str);
		}
		if ((unknown7E5E6E != 0) && (x1E is null)) {
			if (unknown7E9660 == 0) {
				unknownC445E1(x12, x1A);
			} else {
				unknown7E9660--;
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
				x1A = tmp;
				break;
			case 0x16:
				const(ubyte)* tmp = &compressedText[1][x12.textptr[0]][0];
				x12.textptr++;
				x14 = tmp[0];
				tmp++;
				x1A = tmp;
				break;
			case 0x17:
				const(ubyte)* tmp = &compressedText[2][x12.textptr[0]][0];
				x12.textptr++;
				x14 = tmp[0];
				tmp++;
				x1A = tmp;
				break;
			default: break;
		}
		if (x14 < 0x20) {
			ccArgumentGatheringLoopCounter = 0;
			switch (x14) {
				case 0x00:
					printNewLine();
					break;
				case 0x01:
					if (getTextX() != 0) {
						printNewLine();
					}
					break;
				case 0x02:
					break loop;
				case 0x03:
					cc1314(1, 0);
					break;
				case 0x04:
					x1E = &cc04;
					break;
				case 0x05:
					x1E = &cc05;
					break;
				case 0x06:
					x1E = &cc06;
					break;
				case 0x07:
					x1E = &cc07;
					break;
				case 0x08:
					x1E = &cc08;
					break;
				case 0x09:
					x1E = &cc09;
					break;
				case 0x0A:
					x1E = &cc0A;
					break;
				case 0x0B:
					x1E = &cc0B;
					break;
				case 0x0C:
					x1E = &cc0C;
					break;
				case 0x0D:
					x1E = &cc0D;
					break;
				case 0x0E:
					x1E = &cc0E;
					break;
				case 0x0F:
					incrementSecondaryMemory();
					break;
				case 0x10:
					x1E = &cc10;
					break;
				case 0x11:
					setWorkingMemory(WorkingMemory(selectionMenu(1)));
					unknownC11383();
					break;
				case 0x12:
					cc12();
					break;
				case 0x13:
					cc1314(0, 0);
					break;
				case 0x14:
					cc1314(1, 1);
					break;
				case 0x18:
					x1E = &cc18Tree;
					break;
				case 0x19:
					x1E = &cc19Tree;
					break;
				case 0x1A:
					x1E = &cc1ATree;
					break;
				case 0x1B:
					x1E = &cc1BTree;
					break;
				case 0x1C:
					x1E = &cc1CTree;
					break;
				case 0x1D:
					x1E = &cc1DTree;
					break;
				case 0x1E:
					x1E = &cc1ETree;
					break;
				case 0x1F:
					x1E = &cc1FTree;
					break;
				default: break;
			}
		} else {
			printLetter(x14);
		}
	}
	unknownC1869D(x12);
	unknownC14049();
	return x12.textptr;
}

/// $C18B2C
ushort giveItemToSpecificCharacter(ushort character, ubyte item) {
	character--;
	for (short i = 0; i < 14; i++) {
		if (partyCharacters[character].items[i] != 0) {
			continue;
		}
		partyCharacters[character].items[i] = item;
		if (itemData[item].type == ItemType.teddyBear) {
			unknownC216DB();
		}
		if ((itemData[item].flags & ItemFlags.transform) != 0) {
			unknownC3EAD0(item);
		}
		return cast(ushort)(character + 1);
	}
	return 0;
}

/// $C18BC6
ushort giveItemToCharacter(ushort character, ubyte item) {
	if (character == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (giveItemToSpecificCharacter(gameState.partyMembers[i], item) == 0) {
				continue;
			}
			return gameState.partyMembers[i];
		}
		return 0;
	} else {
		return giveItemToSpecificCharacter(character, item);
	}
}

/// $C18E5B
ushort removeItemFromInventory(ushort character, ushort slot) {
	if (slot == partyCharacters[character - 1].equipment[EquipmentSlot.weapon]) {
		changeEquippedWeapon(character, 0);
	} else if (slot == partyCharacters[character - 1].equipment[EquipmentSlot.body]) {
		changeEquippedBody(character, 0);
	} else if (slot == partyCharacters[character - 1].equipment[EquipmentSlot.arms]) {
		changeEquippedArms(character, 0);
	} else if (slot == partyCharacters[character - 1].equipment[EquipmentSlot.other]) {
		changeEquippedOther(character, 0);
	}
	if (slot >= partyCharacters[character - 1].equipment[EquipmentSlot.weapon]) {
		partyCharacters[character - 1].equipment[EquipmentSlot.weapon]--;
	}
	if (slot >= partyCharacters[character - 1].equipment[EquipmentSlot.body]) {
		partyCharacters[character - 1].equipment[EquipmentSlot.body]--;
	}
	if (slot >= partyCharacters[character - 1].equipment[EquipmentSlot.arms]) {
		partyCharacters[character - 1].equipment[EquipmentSlot.arms]--;
	}
	if (slot >= partyCharacters[character - 1].equipment[EquipmentSlot.other]) {
		partyCharacters[character - 1].equipment[EquipmentSlot.other]--;
	}
	short x00 = partyCharacters[character - 1].items[slot - 1];
	ushort i;
	for (i = slot; (i < 14) && (partyCharacters[character - 1].items[i] != 0); i++) {
		partyCharacters[character - 1].items[i - 1] = partyCharacters[character - 1].items[i];
	}
	partyCharacters[character - 1].items[i - 1] = 0;
	if (itemData[i].type == ItemType.teddyBear) {
		removeCharFromParty(itemData[i].parameters.strength);
		unknownC216DB();
	}
	if ((itemData[i].flags & ItemFlags.transform) != 0) {
		unknownC3EB1C(i);
	}
	return character;
}

/// $C18E5B
ushort takeItemFromSpecificCharacter(ushort character, ushort item) {
	for (short i = 0; 14 > i; i++) {
		if (partyCharacters[character - 1].items[i] == item) {
			return removeItemFromInventory(character, i);
		}
	}
	return 0;
}

/// $C18EAD
ushort takeItemFromCharacter(ushort character, ushort item) {
	if (character == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			if (takeItemFromSpecificCharacter(gameState.partyMembers[i], item) == 0) {
				continue;
			}
			return gameState.partyMembers[i];
		}
		return 0;
	} else {
		return takeItemFromSpecificCharacter(character, item);
	}
}

/// $C18F0E
void reduceHPAmtPercent(short arg1, short arg2, short arg3) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			unknownC3EC1F(gameState.partyMembers[i], arg2, arg3);
		}
	} else {
		unknownC3EC1F(arg1, arg2, arg3);
	}
}

/// $C18F64
void recoverHPAmtPercent(short arg1, short arg2, short arg3) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			unknownC3EC8B(gameState.partyMembers[i], arg2, arg3);
		}
	} else {
		unknownC3EC8B(arg1, arg2, arg3);
	}
}

/// $C18FBA
void reducePPAmtPercent(short arg1, short arg2, short arg3) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			unknownC3ED2C(gameState.partyMembers[i], arg2, arg3);
		}
	} else {
		unknownC3ED2C(arg1, arg2, arg3);
	}
}

/// $C19010
void recoverPPAmtPercent(short arg1, short arg2, short arg3) {
	if (arg1 == 0xFF) {
		for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
			unknownC3ED98(gameState.partyMembers[i], arg2, arg3);
		}
	} else {
		unknownC3ED98(arg1, arg2, arg3);
	}
}

/// $C19066
short equipItem(short arg1, short arg2) {
	switch (itemData[partyCharacters[arg1 - 1].items[arg2 - 1]].type & EquipmentSlot.all<<2) {
		case EquipmentSlot.weapon<<2:
			return changeEquippedWeapon(arg1, arg2);
		case EquipmentSlot.body<<2:
			return changeEquippedBody(arg1, arg2);
		case EquipmentSlot.arms<<2:
			return changeEquippedArms(arg1, arg2);
		case EquipmentSlot.other<<2:
			return changeEquippedOther(arg1, arg2);
		default:
			return 0;
	}
}

/// $C190E6
short unknownC190E6(short arg1) {
	return gameState.unknown96[arg1 - 1];
}

/// $C190F1
short unknownC190F1() {
	short x0E = 36;
	for (short i = 0; i < 3; i++) {
		if (gameState.deliveryQueueItem[i] != 0) {
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
short escargoExpressStore(short arg1) {
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
short escargoExpressMove(short arg1, short arg2) {
	if (escargoExpressStore(getCharacterItem(arg1, arg2)) != 0) {
		return removeItemFromInventory(arg1, arg2);
	}
	return 0;
}

/// $C191B0
short escargoExpressRemove(short arg1) {
	arg1--;
	ubyte x01 = gameState.escargoExpressItems[arg1];
	while ((gameState.escargoExpressItems[arg1 + 1] != 0) && (arg1++ < gameState.escargoExpressItems.length)) {
		gameState.escargoExpressItems[arg1] = gameState.escargoExpressItems[arg1 + 1];
	}
	gameState.escargoExpressItems[arg1] = 0;
	return x01;
}

/// $C191F8
short giveStoredItemToCharacter(short character, short itemSlot) {
	giveItemToCharacter(character, cast(ubyte)escargoExpressRemove(itemSlot));
	return character;
}

/// $C19216
void printItemName(short arg1) {
	unknownC4487C(Item.name.length, &itemData[arg1].name[0]);
}

/// $C19249
void unknownC19249(short arg1) {
	if ((cc1C01Table[arg1].size & 0x80) != 0) {
		switch (cc1C01Table[arg1].size & 0x7F) {
			case 1:
				printNumber(*cast(ubyte*)cc1C01Table[arg1].address);
				break;
			case 2:
				printNumber(*cast(short*)cc1C01Table[arg1].address);
				break;
			default:
				printNumber(*cast(int*)cc1C01Table[arg1].address);
				break;
		}
	} else {
		printWrappableString(cc1C01Table[arg1].size, cast(ubyte*)cc1C01Table[arg1].address);
	}
}

/// $C1931B
void unknownC1931B(short arg1) {
	if (arg1 > 4) {
		if (arg1 == PartyMember.king) {
			if (unknown7EB49D != 0) {
				printString(gameState.petName.length, &gameState.petName[0]);
			} else {
				printWrappableString(gameState.petName.length, &gameState.petName[0]);
			}
		} else {
			printWrappableString(Enemy.name.length, &enemyConfigurationTable[npcAITable[arg1].enemyID].name[0]);
		}
	} else {
		if (unknown7EB49D != 0) {
			printString(PartyCharacter.name.length, &partyCharacters[arg1 -1].name[0]);
		} else {
			printWrappableString(PartyCharacter.name.length, &partyCharacters[arg1 - 1].name[0]);
		}
	}
}

/// $C193E7
void openEquipSelectWindow(short arg1) {
	unknownC20A20(&unknown7E9C8A);
	setInstantPrinting();
	createWindowN(Window.equipSelectItem);
	printString(10, &miscTargetText[arg1][0]);
	clearInstantPrinting();
	unknownC20ABC(&unknown7E9C8A);
}

/// $C19437
void closeEquipSelectWindow() {
	closeWindow(Window.equipSelectItem);
}

/// $C19441
ushort unknownC19441() {
	ushort x02 = 0;
	unknownC20A20(&unknown7E9C8A);
	createWindowN(Window.equipMenuItemlist);
	setWindowTitle(7, 5, &phoneCallText[0]);
	for (short i = 1; telephoneContacts[i].title[0] != 0; i++) {
		if (getEventFlag(telephoneContacts[i].eventFlag) == 0) {
			continue;
		}
		memcpy(&unknown7E9C9F[0], &telephoneContacts[i].title[0], TelephoneContact.title.length);
		unknown7E9C9F[TelephoneContact.title.length] = 0;
		unknownC115F4(i, &unknown7E9C9F[0], null);
	}
	if (unknownC12BD5(0) != 0) {
		unknownC1180D(1, 0, 1);
		x02 = selectionMenu(1);
	}
	closeFocusWindowN();
	unknownC20ABC(&unknown7E9C8A);
	return x02;
}

/// $C1952F
void unknownC1952F(short arg1) {
	arg1--;
	setInstantPrinting();
	createWindowN(Window.statusMenu);
	windowTickWithoutInstantPrinting();
	unknown7E5E71 = 1;
	displayText(&statusWindowText[0]);
	unknown7E5E71 = 0;
	if (gameState.playerControlledPartyMemberCount != 1) {
		unknown7E5E7A = 8;
	}
	setWindowTitle(8, PartyCharacter.name.length, &partyCharacters[arg1].name[0]);
	unknown7E5E71 = 1;
	setCurrentWindowPadding(1);
	unknownC43D75(38, 0);
	printNumber(partyCharacters[arg1].level);
	setCurrentWindowPadding(2);
	unknownC43D75(94, 3);
	printNumber(partyCharacters[arg1].hp.current.integer);
	unknownC43D75(114, 3);
	printLetter(ebChar('/'));
	unknownC43D75(121, 3);
	printNumber(partyCharacters[arg1].maxHP);
	unknownC43D75(94, 4);
	printNumber(partyCharacters[arg1].pp.current.integer);
	unknownC43D75(114, 4);
	printLetter(ebChar('/'));
	unknownC43D75(121, 4);
	printNumber(partyCharacters[arg1].maxPP);
	unknownC43D75(199, 0);
	printNumber(partyCharacters[arg1].offense);
	unknownC43D75(199, 1);
	printNumber(partyCharacters[arg1].defense);
	unknownC43D75(199, 2);
	printNumber(partyCharacters[arg1].speed);
	unknownC43D75(199, 3);
	printNumber(partyCharacters[arg1].guts);
	unknownC43D75(199, 4);
	printNumber(partyCharacters[arg1].vitality);
	unknownC43D75(199, 5);
	printNumber(partyCharacters[arg1].iq);
	unknownC43D75(199, 6);
	printNumber(partyCharacters[arg1].luck);
	setCurrentWindowPadding(6);
	unknownC43D75(97, 5);
	printNumber((partyCharacters[arg1].exp > 9_999_999) ? 9_999_999 : partyCharacters[arg1].exp);
	unknownC43D75(10, 6);
	printNumber(getRequiredEXP(cast(short)(arg1 + 1)));
	unknown7E5E71 = 0;
	loop: for (short i = 0; i < 7; i++) {
		ubyte x12 = partyCharacters[arg1].afflictions[i];
		if (x12 == 0) {
			continue;
		}
		const(ubyte)* x06;
		switch (i) {
			case 0:
				x06 = &statusEquipWindowText5[x12 - 1][0];
				break;
			case 1:
				x06 = &statusEquipWindowText5[6 + x12][0];
				break;
			case 5:
				x06 = &statusEquipWindowText6[0];
				break;
			default: break loop;
		}
		moveCurrentTextCursor(1, 1);
		printString(0x100, x06);
		break;
	}
	moveCurrentTextCursor(11, 1);
	unknownC43F77(unknownC223D9(&partyCharacters[arg1].afflictions[0], 0));
	if (arg1 != 2) {
		unknown7E5E71 = 1;
		unknownC43D75(36, 7);
		printString(0x23, &statusEquipWindowText4[0]);
		unknown7E5E71 = 0;
	}
	clearInstantPrinting();
}

/// $C198DE
void inventoryGetItemName(short arg1, short arg2) {
	arg1--;
	createWindowN(arg2);
	if (gameState.playerControlledPartyMemberCount != 1) {
		unknown7E5E7A = arg2;
	}
	setWindowTitle(arg2, PartyCharacter.name.length, &partyCharacters[arg1].name[0]);
	for (short i = 0; PartyCharacter.items.length > i; i++) {
		short x16 = partyCharacters[arg1].items[i];
		if (checkItemEquipped(cast(short)(arg1 + 1), cast(short)(i + 1)) != 0) {
			unknown7E9C9F[0] = 0x22;
			memcpy(&unknown7E9C9F[1], &itemData[x16].name[0], Item.name.length);
		} else {
			memcpy(&unknown7E9C9F[0], &itemData[x16].name[0], Item.name.length);
		}
		unknown7E9C9F[Item.name.length] = 0;
		if (x16 != 0) {
			unknownC113D1(&unknown7E9C9F[0], null);
		}
	}
	windowTickWithoutInstantPrinting();
	unknownC1180D(2, 0, 0);
}

/// $C19A11
short unknownC19A11(short arg1, short arg2) {
	unknownC20A20(&unknown7E9C8A);
	setWindowFocus(arg1);
	short x0E = selectionMenu(arg2);
	unknownC20ABC(&unknown7E9C8A);
	return x0E;
}

/// $C19A43
ushort unknownC19A43() {
	ubyte* x18 = &unknown7E9C9F[statusEquipWindowText7.length];
	unknownC20A20(&unknown7E9C8A);
	createWindowN(Window.unknown0d);
	memcpy(&unknown7E9C9F[0], &statusEquipWindowText7[0], 12);
	(x18++)[0] = ebChar('(');
	(x18++)[0] = ebChar('1');
	(x18++)[0] = ebChar(')');
	(x18++)[0] = 0;
	setWindowTitle(13, -1, &unknown7E9C9F[0]);
	for (short i = 0; i < gameState.escargoExpressItems.length; i++) {
		memcpy(&unknown7E9C9F[0], &itemData[gameState.escargoExpressItems[i]].name[0], Item.name.sizeof);
		unknown7E9C9F[Item.name.sizeof] = 0;
		if (gameState.escargoExpressItems[i] != 0) {
			unknownC113D1(&unknown7E9C9F[0], null);
		}
	}
	unknownC1180D(2, 0, 1);
	short x18_2 = selectionMenu(1);
	unknownEF0115(13);
	unknown7E5E71 = 0;
	unknownC20ABC(&unknown7E9C8A);
	return x18_2;
}

/// $C19B4E
void setHPPPWindowModeItem(short arg1) {
	short x10;
	for (short i = 0; i < 4; i++) {
		if (canCharacterEquip(cast(short)(i +1), arg1) == 0) {
			x10 = 0xC00;
		} else if (getItemType(arg1) != 2) {
			x10 = 0x400;
		} else {
			short x0E;
			switch (itemData[arg1].type & 0xC) {
				case 0x0:
					x0E = partyCharacters[i].equipment[EquipmentSlot.weapon];
					break;
				case 0x4:
					x0E = partyCharacters[i].equipment[EquipmentSlot.body];
					break;
				case 0x8:
					x0E = partyCharacters[i].equipment[EquipmentSlot.arms];
					break;
				case 0xC:
					x0E = partyCharacters[i].equipment[EquipmentSlot.other];
					break;
				default: break;
			}
			x10 = (itemData[arg1].parameters.raw[(i == 3) ? 1 : 0] > ((x0E != 0) ? itemData[partyCharacters[i].items[x0E - 1]].parameters.raw[(i == 3) ? 1 : 0] : 0)) ? 0x1400 : 0x400;
		}
		partyCharacters[i].hpPPWindowOptions = x10;
	}
	unknown7E9623 = 1;
}

/// $C19CDD
void unknownC19CDD() {
	for (short i = 0; i < 4; i++) {
		partyCharacters[i].hpPPWindowOptions = 0x400;
	}
	memcpy(&palettes[0][12], &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][20], 8);
	unknown7E0030 = 0x18;
	unknown7E9623 = 1;
}

/// $C19D49
void unknownC19D49() {
	for (short i = 0; i < 4; i++) {
		partyCharacters[i].hpPPWindowOptions = 0x400;
	}
	memcpy(&palettes[0][12], &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][12], 8);
	unknown7E0030 = 0x18;
	unknown7E9623 = 1;
}

/// $C19DB5
ushort unknownC19DB5(short arg1) {
	unknownC1AA18();
	setInstantPrinting();
	unknownC20A20(&unknown7E9C8A);
	createWindowN(Window.unknown0c);
	setCurrentWindowPadding(5);
	for (short i = 0; i < 7; i++) {
		short x1A = storeTable[arg1][i];
		if (x1A == ItemID.none) {
			continue;
		}
		memcpy(&unknown7E9C9F[0], &itemData[x1A].name[0], Item.name.length);
		unknown7E9C9F[Item.name.length] = 0;
		unknownC115F4(x1A, &unknown7E9C9F[0], null);
		unknownC4507A(itemData[x1A].cost);
	}
	moveCurrentTextCursor(0, 0);
	unknownC1180D(1, 0, 0);
	unknownC11F5A(&setHPPPWindowModeItem);
	unknownC19CDD();
	ushort x1A = selectionMenu(1);
	unknownC19D49();
	closeFocusWindow();
	unknownC20ABC(&unknown7E9C8A);
	clearInstantPrinting();
	return x1A;
}

/// $C19EE6
short getItemType(short arg1) {
	switch (itemData[arg1].type & 0x30) {
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
void printEquipment(short arg1) {
	arg1--;
	createWindowN(Window.equipMenu);
	windowTickWithoutInstantPrinting();
	if (gameState.playerControlledPartyMemberCount != 1) {
		unknown7E5E7A = 6;
	}
	setWindowTitle(6, PartyCharacter.name.length, &partyCharacters[arg1].name[0]);
	for (short i = 0; 4 > i; i++) {
		unknown7E5E71 = 1;
		short x18;
		switch (i) {
			case 0:
				unknownC114B1(0, i, &statusEquipWindowText10[i][0], null);
				x18 = partyCharacters[arg1].equipment[EquipmentSlot.weapon];
				break;
			case 1:
				unknownC114B1(0, i, &statusEquipWindowText10[i][0], null);
				x18 = partyCharacters[arg1].equipment[EquipmentSlot.body];
				break;
			case 2:
				unknownC114B1(0, i, &statusEquipWindowText10[i][0], null);
				x18 = partyCharacters[arg1].equipment[EquipmentSlot.arms];
				break;
			case 3:
				unknownC114B1(0, i, &statusEquipWindowText10[i][0], null);
				x18 = partyCharacters[arg1].equipment[EquipmentSlot.other];
				break;
			default: break;
		}
		if (x18 != 0) {
			if (checkItemEquipped(cast(short)(arg1 + 1), x18) != 0) {
				unknown7E9C9F[0] = 0x22;
				memcpy(&unknown7E9C9F[1], &itemData[partyCharacters[arg1].items[x18 - 1]].name[0], Item.name.length);
			} else {
				memcpy(&unknown7E9C9F[0], &itemData[partyCharacters[arg1].items[x18 - 1]].name[0], Item.name.length);
			}
			unknown7E9C9F[Item.name.length] = 0;
		} else {
			memcpy(&unknown7E9C9F[0], &statusEquipWindowText12[0], statusEquipWindowText12.length);
			unknown7E9C9F[statusEquipWindowText12.length] = 0;
		}
		moveCurrentTextCursor(6, i);
		printLetter(ebChar(':'));
		printLetter(ebChar(' '));
		printString(49, &unknown7E9C9F[0]);
	}
	printMenuItems();
	unknown7E5E71 = 0;
	clearInstantPrinting();
}

/// $C1A1D8
void printEquipmentStats(short arg1) {
	arg1--;
	createWindowN(Window.equipMenuStats);
	windowTickWithoutInstantPrinting();
	setCurrentWindowPadding(2);
	moveCurrentTextCursor(0, 0);
	printString(statusEquipWindowText8.length, &statusEquipWindowText8[0]);
	short x16 = partyCharacters[arg1].baseOffense;
	if (partyCharacters[arg1].equipment[EquipmentSlot.weapon] != 0) {
		short x14 = 0;
		if (arg1 == 3) {
			x14 = 1;
		}
		x16 += itemData[partyCharacters[arg1].items[partyCharacters[arg1].equipment[EquipmentSlot.weapon] - 1]].parameters.raw[x14];
	}
	unknown7E5E71 = 1;
	unknownC43D75(55, 0);
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
	printNumber(a);
	unknown7E5E71 = 0;
	moveCurrentTextCursor(0, 1);
	printString(statusEquipWindowText9.length, &statusEquipWindowText9[0]);
	x16 = partyCharacters[arg1].baseDefense;
	if (partyCharacters[arg1].equipment[EquipmentSlot.body] != 0) {
		short x14 = 0;
		if (arg1 == 3) {
			x14 = 1;
		}
		x16 += itemData[partyCharacters[arg1].items[partyCharacters[arg1].equipment[EquipmentSlot.body] - 1]].parameters.raw[x14];
	}
	if (partyCharacters[arg1].equipment[EquipmentSlot.arms] != 0) {
		short x14 = 0;
		if (arg1 == 3) {
			x14 = 1;
		}
		x16 += itemData[partyCharacters[arg1].items[partyCharacters[arg1].equipment[EquipmentSlot.arms] - 1]].parameters.raw[x14];
	}
	if (partyCharacters[arg1].equipment[EquipmentSlot.other] != 0) {
		short x14 = 0;
		if (arg1 == 3) {
			x14 = 1;
		}
		x16 += itemData[partyCharacters[arg1].items[partyCharacters[arg1].equipment[EquipmentSlot.other] - 1]].parameters.raw[x14];
	}
	unknown7E5E71 = 1;
	unknownC43D75(55, 1);
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
	printNumber(a);
	unknown7E5E71 = 0;
	if (unknown7E9CD4 != 0) {
		unknownC43D75(76, 0);
		windowSetTextColor(1);
		unknownC43F77(0x14E);
		windowSetTextColor(0);
		short x14_2 = partyCharacters[arg1].baseOffense;
		if (unknown7E9CD0 != 0) {
			short x16_2 = 0;
			if (arg1 == 3) {
				x16_2 = 1;
			}
			x14_2 += itemData[partyCharacters[arg1].items[unknown7E9CD0 - 1]].parameters.raw[x16_2];
		}
		unknown7E5E71 = 1;
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
		printNumber(a);
		unknown7E5E71 = 0;
		unknownC43D75(76, 1);
		windowSetTextColor(1);
		unknownC43F77(0x14E);

		x16 = partyCharacters[arg1].baseDefense;
		if (unknown7E9CD1 != 0) {
			short x14 = 0;
			if (arg1 == 3) {
				x14 = 1;
			}
			x16 += itemData[partyCharacters[arg1].items[unknown7E9CD1 - 1]].parameters.raw[x14];
		}
		if (unknown7E9CD2 != 0) {
			short x14 = 0;
			if (arg1 == 3) {
				x14 = 1;
			}
			x16 += itemData[partyCharacters[arg1].items[unknown7E9CD2 - 1]].parameters.raw[x14];
		}
		if (unknown7E9CD3 != 0) {
			short x14 = 0;
			if (arg1 == 3) {
				x14 = 1;
			}
			x16 += itemData[partyCharacters[arg1].items[unknown7E9CD3 - 1]].parameters.raw[x14];
		}
		unknown7E5E71 = 1;
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
		printNumber(a);
		unknown7E5E71 = 0;
	}
	clearInstantPrinting();
}

/// $C1A778
void unknownC1A778(short arg1) {
	unknown7E9CD4 = 0;
	printEquipment(arg1);
	printEquipmentStats(arg1);
}

/// $C1A795
void unknownC1A795(short arg1) {
	arg1--;
	while (true) {
		openEquipSelectWindow(4);
		setWindowFocus(Window.equipMenu);
		short x1C = selectionMenu(1);
		closeEquipSelectWindow();
		if (x1C == 0) {
			break;
		}
		createWindowN(Window.equipMenuItemlist);
		setWindowTitle(Window.equipMenuItemlist, cast(short)strlen(cast(const(char)*)&statusEquipWindowText11[x1C - 1][0]), &statusEquipWindowText11[x1C - 1][0]);
		short x04 = 0;
		short x18 = -1;
		for (short i = 0; i < 14; i++) {
			short x16 = partyCharacters[arg1].items[i];
			if (x16 == 0) {
				continue;
			}
			if (getItemType(x16) != 2) {
				continue;
			}
			if (getItemSubtype(x16) != x1C) {
				continue;
			}
			if (canCharacterEquip(cast(short)(arg1 + 1), x16) == 0) {
				continue;
			}
			if (checkItemEquipped(cast(short)(arg1 + 1), cast(short)(i + 1)) != 0) {
				unknown7E9C9F = 0x22;
				memcpy(&unknown7E9C9F[1], &itemData[x16].name, Item.name.length);
				x18 = x04;
			} else {
				memcpy(&unknown7E9C9F[0], &itemData[x16].name, Item.name.length);
			}
			unknown7E9C9F[Item.name.length] = 0;
			unknownC115F4(cast(short)(i + 1), &unknown7E9C9F[0], null).sfx = Sfx.equippedItem;
			x04++;
		}
		unknownC115F4(-1, &statusEquipWindowText13[0], null);
		unknownC1181B(1, 0, x18);
		unknown7E9CD6 = cast(ubyte)(arg1 + 1);
		switch (x1C) {
			case 1:
				unknownC11F5A(&unknownC22562);
				break;
			case 2:
				unknownC11F5A(&unknownC225AC);
				break;
			case 3:
				unknownC11F5A(&unknownC2260D);
				break;
			case 4:
				unknownC11F5A(&unknownC22673);
				break;
			default: break;
		}
		unknown7E9CD4 = 1;
		openEquipSelectWindow(1);
		short x18_2 = selectionMenu(1);
		closeEquipSelectWindow();
		unknownC11F8A();
		if (x18_2 == -1) {
			switch (x1C) {
				case 1:
					changeEquippedWeapon(cast(short)(arg1 + 1), 0);
					break;
				case 2:
					changeEquippedBody(cast(short)(arg1 + 1), 0);
					break;
				case 3:
					changeEquippedArms(cast(short)(arg1 + 1), 0);
					break;
				case 4:
					changeEquippedOther(cast(short)(arg1 + 1), 0);
					break;
				default: break;
			}
		} else if (x18_2 != 0) {
			equipItem(cast(short)(arg1 + 1), x18_2);
		}
		closeWindow(Window.equipMenuItemlist);
		unknownC1A778(cast(short)(arg1 + 1));
	}
}

/// $C1AA18
void unknownC1AA18() {
	unknownC20A20(&unknown7E9C8A);
	createWindowN(Window.carriedMoney);
	setCurrentWindowPadding(5);
	setInstantPrinting();
	clearFocusWindow();
	unknownC4507A(gameState.moneyCarried);
	clearInstantPrinting();
	unknownC20ABC(&unknown7E9C8A);
}

/// $C1AA5D
short unknownC1AA5D() {
	unknownC20A20(&unknown7E9C8A);
	short x16 = gameState.partyMembers[0];
	while (true) {
		if (gameState.playerControlledPartyMemberCount == 1) {
			unknownC1A778(x16);
		}
		if (gameState.playerControlledPartyMemberCount != 1) {
			openEquipSelectWindow(0);
			x16 = charSelectPrompt(0, 1, &unknownC1A778, null);
			closeEquipSelectWindow();
		} else {
			x16 = gameState.partyMembers[0];
			unknownC43573(0);
		}
		if (x16 == 0) {
			break;
		}
		unknownC1A795(x16);
		if (gameState.playerControlledPartyMemberCount == 1) {
			break;
		}
	}
	closeWindow(Window.equipMenuStats);
	closeWindow(Window.equipMenu);
	unknownC20ABC(&unknown7E9C8A);
	return x16;
}

/// $C1AAFA
ushort unknownC1AAFA() {
	short x02 = 0;
	openEquipSelectWindow(2);
	unknownC20A20(&unknown7E9C8A);
	createWindowN(Window.phoneMenu);
	setWindowTitle(5, 3, &statusEquipWindowText14[0]);
	for (short i = 0; psiTeleportDestinationTable[i].name[0] != 0; i++) {
		if (psiTeleportDestinationTable[i].name[0] == 0) {
			continue;
		}
		if (getEventFlag(psiTeleportDestinationTable[i].eventFlag) == 0) {
			continue;
		}
		memcpy(&unknown7E9C9F[0], &psiTeleportDestinationTable[i].name[0], PSITeleportDestination.name.length);
		unknown7E9C9F[PSITeleportDestination.name.length] = 0;
		unknownC115F4(i, &unknown7E9C9F[0], null);
	}
	if (unknownC12BD5(0) != 0) {
		unknownC1180D(1, 0, 1);
		x02 = cast(short)selectionMenu(1);
	}
	closeFocusWindowN();
	closeEquipSelectWindow();
	unknownC20ABC(&unknown7E9C8A);
	return x02;
}

/// $C1AC00
ushort unknownC1AC00() {
	ushort x12 = unknownC19441();
	if (x12 != 0) {
		displayText(getTextBlock(telephoneContacts[x12].text));
	}
	return x12;
}

/// $C1AC4A
void unknownC1AC4A(ubyte* arg1, short arg2) {
	memcpy(&unknown7E9CD7[0], arg1, arg2);
	unknown7E9CD7[arg2] = 0;
	unknown7E9658 = -1;
}

/// $C1ACA1
void unknownC1ACA1(ubyte* arg1, short arg2) {
	memcpy(&unknown7E9CF5[0], arg1, arg2);
	unknown7E9CF5[arg2] = 0;
	unknown7E965A = -1;
}

/// $C1AC9B
ubyte* returnBattleAttackerAddress() {
	return &unknown7E9CD7[0];
}

/// $C1ACF2
ubyte* returnBattleTargetAddress() {
	return &unknown7E9CF5[0];
}

/// $C1ACF8
void unknownC1ACF8(short arg1) {
	unknown7E9D11 = cast(ubyte)arg1;
}

/// $C1AD02
ubyte unknownC1AD02() {
	return unknown7E9D11;
}

/// $C1AD0A
void unknownC1AD0A(int arg) {
	unknown7E9D12 = arg;
}

/// $C1AD26
uint unknownC1AD26() {
	return unknown7E9D12;
}

/// $C1AD42
short unknownC1AD42() {
	findNearbyCheckableTPTEntry();
	if ((currentTPTEntry == 0) || (currentTPTEntry == -1) || (currentTPTEntry == -2)) {
		return 0;
	} else {
		return npcConfig[currentTPTEntry].type;
	}
}

/// $C1AD71
short unknownC1AD7D() {
	short x0E = loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer);
	if ((getEventFlag(EventFlag.winGiegu != 0) && ((x0E & 7) == 0))) {
		return ItemID.bicycle;
	} else {
		return x0E >> 8;
	}
}

/// $C1ADB4
short determineTargetting(short arg1, short arg2) {
	ubyte x16;
	ubyte x01 = 0xFF;
	switch (battleActionTable[arg1].direction) {
		case 0:
			x16 = 0x10;
			switch (battleActionTable[arg1].target) {
				case 0:
					x16 = 0x11;
					x01 = cast(ubyte)arg2;
					break;
				case 1:
					x16 = 0x11;
					x01 = cast(ubyte)unknownC1242E(0, 1, arg1);
					break;
				case 2:
					x16 = 0x11;
					x01 = cast(ubyte)(randMod(cast(short)(countChars(BattleSide.foes) - 1)) + 1);
					break;
				case 3:
					x16 = 0x12;
					x01 = cast(ubyte)unknownC1242E(1, 1, arg1);
					break;
				case 4:
				default:
					x16 |= 4;
					break;
			}
			break;
		case 1:
			x16 = 0x00;
			switch (battleActionTable[arg1].target) {
				case 0:
					x16 = 1;
					x01 = cast(ubyte)arg2;
					break;
				case 1:
					x16 = 1;
					if (gameState.playerControlledPartyMemberCount != 1) {
						openEquipSelectWindow(3);
						x01 = cast(ubyte)charSelectPrompt(1, 1, null, null);
						closeEquipSelectWindow();
					} else {
						x01 = cast(ubyte)arg2;
					}
					break;
				case 2:
					x16 = 1;
					x01 = cast(ubyte)gameState.unknown96[randMod(cast(short)(countChars(BattleSide.friends) - 1))];
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
short overworldUseItem(short arg1, short arg2, short) {
	const(ubyte)* x26 = null;
	short x24 = 0;
	ubyte x01 = cast(ubyte)getCharacterItem(arg1, arg2);
	switch (itemData[x01].type & (ItemType.equippable | ItemType.edible)) {
		case 0:
			x24 = 1;
			x26 = getTextBlock(battleActionTable[itemData[x01].battleAction].text);
			break;
		case ItemType.equippable:
			x26 = getTextBlock("textItemCanBeEquipped");
			break;
		case ItemType.edible:
			x24 = 1;
			x26 = getTextBlock(battleActionTable[itemData[x01].battleAction].text);
			break;
		case ItemType.healingItem:
			if ((itemData[x01].flags & itemUsableFlags[arg1 - 1]) == 0) {
				x26 = getTextBlock("textCouldNotUseVeryWell");
			} else {
				switch (itemData[x01].type & 0xC) {
					case 0:
						x24 = 1;
						x26 = getTextBlock(battleActionTable[itemData[x01].battleAction].text);
						break;
					case 4:
						x26 = getTextBlock("textCantBeUsedHere");
						break;
					case 8:
						switch(itemData[x01].type & 3) {
							case 0:
							case 1:
								x24 = 1;
								x26 = getTextBlock(battleActionTable[itemData[x01].battleAction].text);
								break;
							case 2:
								if (unknownC1AD7D() == x01) {
									if ((x01 == ItemID.bicycle) && (unknownC03C4B() != 0)) {
										x26 = getTextBlock("textCantRideBikeHere");
									} else {
										x24 = 1;
										x26 = getTextBlock(battleActionTable[itemData[x01].battleAction].text);
									}
								} else {
									x26 = getTextBlock("textCantBeUsedHere");
								}
								break;
							case 3:
								x24 = 1;
								short tmp = unknownC1AD42();
								if ((tmp == 1) || (tmp == 3)) {
									x26 = getTextBlock(npcConfig[currentTPTEntry].checkText);
								}
								if (x26 == null) {
									x26 = getTextBlock(battleActionTable[itemData[x01].battleAction].text);
								}
								break;
							default: break;
						}
						break;
					default: break;
				}
			}
			break;
		default: break;
	}
	ubyte x00 = cast(ubyte)arg1;
	if (x24 != 0) {
		x00 = cast(ubyte)determineTargetting(itemData[x01].battleAction, arg1);
		if (x00 == 0) {
			return 0;
		}
		if ((itemData[x01].flags & ItemFlags.consumedOnUse) != 0) {
			removeItemFromInventory(arg1, arg2);
		}
	}
	closeWindow(Window.inventoryMenu);
	closeWindow(Window.inventory);
	unknownC1AC4A(&partyCharacters[arg1 - 1].name[0], PartyCharacter.name.sizeof);
	unknownC1ACF8(x01);
	createWindowN(Window.textStandard);
	setArgumentMemory(arg1);
	if (x00 != 0xFF) {
		unknownC1ACA1(&partyCharacters[x00 - 1].name[0], PartyCharacter.name.sizeof);
	}
	if (x26 == null) {
		x26 = getTextBlock("textCantUseItem");
	}
	if ((x24 != 0) && (battleActionTable[itemData[x01].battleAction].func != null)) {
		currentAttacker = &battlersTable[0];
		battleInitPlayerStats(arg1, currentAttacker);
		currentAttacker.currentActionArgument = x01;
		currentAttacker.actionItemSlot = cast(ubyte)arg2;
		displayText(x26);
		unknownC1ACF8(x01);
		currentTarget = &battlersTable[1];
		if (x00 == 0) {
			for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
				unknownC1ACA1(&partyCharacters[gameState.partyMembers[i] - 1].name[0], PartyCharacter.name.sizeof);
				battleInitPlayerStats(gameState.partyMembers[i], currentTarget);
				battleActionTable[itemData[x01].battleAction].func();
				for (short j = 0; 7 > j; j++) {
					partyCharacters[i].afflictions[j] = currentTarget.afflictions[j];
				}
			}
		} else {
			battleInitPlayerStats(x00, currentTarget);
			battleActionTable[itemData[x01].battleAction].func();
			for (short j = 0; PartyCharacter.afflictions.length > j; j++) {
				partyCharacters[x00 - 1].afflictions[j] = currentTarget.afflictions[j];
			}
		}
		unknownC3EE4D();
	} else {
		displayText(x26);
	}
	closeWindow(Window.textStandard);
	return 1;
}

/// $C1B5B6
short unknownC1B5B6() {
	ubyte x01 = 0xFF;
	ubyte x00;
	short x27 = 0;
	unknown7E9D18 = 0;
	while (true) {
		ubyte x26;
		if (unknownC1C3B6() == 1) {
			if (x01 == 0) {
				break;
			}
			x26 = gameState.partyMembers[unknownC1C373() - 1];
			unknownC1C853(x26);
			unknown7E9D18 = 1;
		} else {
			openEquipSelectWindow(0);
			x26 = cast(ubyte)charSelectPrompt(0, 1, &unknownC1C853, &unknownC1C367);
			closeEquipSelectWindow();
		}
		unknown7E9D16 = x26;
		if (x26 == 0) {
			break;
		}
		x01 = 0xFF;
		do {
			setWindowFocus(Window.textStandard);
			if (x01 != 0xFF) {
				unknownC1CA72(x01, 0);
				printMenuItems();
			}
			unknownC11F5A(&unknownC1C8BC);
			x01 = cast(ubyte)selectionMenu(1);
			unknownC11F8A();
			if (x01 != 0) {
				if (unknown7E9D18 == 0) {
					unknownC1CA72(x01, 6);
				}
				if (battleActionTable[psiAbilityTable[x01].battleAction].ppCost > partyCharacters[x26 - 1].pp.current.integer) {
					createWindowN(Window.textBattle);
					displayText(getTextBlock("textNotEnoughPP"));
					closeFocusWindowN();
					x00 = 0;
				} else {
					if (psiAbilityTable[x01].type == 8) {
						if ((gameState.partyNPCs[0] != PartyMember.dungeonMan) && (gameState.partyNPCs[1] != PartyMember.dungeonMan) && (getEventFlag(EventFlag.sysDistlpt) == 0) && (gameState.walkingStyle != WalkingStyle.ladder) && (gameState.walkingStyle != WalkingStyle.rope) && (gameState.walkingStyle != WalkingStyle.escalator) && (gameState.walkingStyle != WalkingStyle.stairs) && ((loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & MapSectorConfig.cannotTeleport) == 0)) {
							x00 = cast(ubyte)unknownC1AAFA();
						} else {
							createWindowN(Window.textBattle);
							displayText(getTextBlock("textCannotTeleportHere"));
							closeFocusWindowN();
							x00 = 0;
						}
					} else {
						x00 = cast(ubyte)determineTargetting(psiAbilityTable[x01].battleAction, x26);
					}
				}
			} else {
				x00 = 1;
			}
		} while (x00 == 0);
		closeWindow(Window.unknown04);
		if (x01 == 0) {
			continue;
		}
		unknownC3ED2C(x26, battleActionTable[psiAbilityTable[x01].battleAction].ppCost, 1);
		if (psiAbilityTable[x01].type == 8) {
			setTeleportState(x00, cast(TeleportStyle)psiAbilityTable[x01].level);
		} else {
			currentAttacker = &battlersTable[0];
			battleInitPlayerStats(x26, currentAttacker);
			unknownC1AC4A(&partyCharacters[x26 - 1].name[0], PartyCharacter.name.length);
			if (x00 != 0xFF) {
				unknownC1ACA1(&partyCharacters[x00 - 1].name[0], PartyCharacter.name.length);
			}
			unknownC1ACF8(x01);
			createWindowN(Window.textStandard);
			displayText(getTextBlock(battleActionTable[psiAbilityTable[x01].battleAction].text));
		}
		if (battleActionTable[psiAbilityTable[x01].battleAction].func !is null) {
			currentTarget = &battlersTable[1];
			if (x00 == 0xFF) {
				for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
					unknownC1ACA1(&partyCharacters[gameState.partyMembers[i] - 1].name[0], PartyCharacter.name.length);
					battleInitPlayerStats(gameState.partyMembers[i] - 1, &battlersTable[1]);
					battleActionTable[psiAbilityTable[x01].battleAction].func();
					for (short j = 0; PartyCharacter.afflictions.length > j; j++) {
						version(bugfix) {
							partyCharacters[gameState.partyMembers[i] - 1].afflictions[j] = currentTarget.afflictions[j];
						} else {
							partyCharacters[i].afflictions[j] = currentTarget.afflictions[j];
						}
					}
				}
			} else {
				battleInitPlayerStats(x00, currentTarget);
				battleActionTable[psiAbilityTable[x01].battleAction].func();
				for (short i = 0; PartyCharacter.afflictions.length > i; i++) {
					partyCharacters[x00].afflictions[i] = currentTarget.afflictions[i];
				}
			}
			unknownC3EE4D();
		}
		x27 = 1;
	}
	closeWindow(Window.textStandard);
	return x27;
}

/// $C1BB06
void unknownC1BB06(short arg1) {
	if ((unknown7E9D19 == 0xFF) || (arg1 == unknown7E9D19)) {
		unknownC1C8BC(arg1);
		createWindowN(Window.unknown2f);
		windowTickWithoutInstantPrinting();
		unknown7E9D19 = arg1;
		displayText(getTextBlock(psiAbilityTable[arg1].text));
		clearInstantPrinting();
	}
}

/// $C1BB71
void unknownC1BB71() {
	short x16;
	while (true) {
		unknown7E5E71 = 1;
		Unknown1:
		short x = charSelectPrompt(0, 1, &unknownC1952F, null);
		if (x == 0) {
			break;
		}
		if (x == 3) {
			continue;
		}
		short x02 = 0;
		createWindowN(Window.unknown2e);
		for (short i = 0; i < 4; i++) {
			unknownC115F4(cast(short)(i + 1), &psiCategories[i][0], null);
		}
		unknownC1180D(1, 0, 0);
		while (true) {
			setWindowFocus(Window.unknown2e);
			if (x02 == 0) {
				printMenuItems();
				windowTickWithoutInstantPrinting();
				x02++;
			}
			createWindowN(Window.statusMenu);
			currentFocusWindow = Window.unknown2e;
			unknown7E5E71 = 0;
			unknownC11F5A(&unknownC1CAF5);
			x16 = selectionMenu(1);
			unknownC11F8A();
			if (x16 == 0) {
				break;
			}
			if (unknownC12BD5(1) == 0) {
				continue;
			}
			setWindowFocus(Window.textStandard);
			unknown7E9D19 = 0xFF;
			unknownC11F5A(&unknownC1BB06);
			while (selectionMenu(1) != 0) {}
			unknownC11F8A();
			closeWindow(Window.unknown04);
			closeWindow(Window.unknown2f);
			unknown7E9D19 = 0xFF;
		}
		closeWindow(Window.unknown2e);
		closeWindow(Window.textStandard);
		currentFocusWindow = Window.statusMenu;
		unknown7E5E71 = 1;
		if (x16 == 0) {
			goto Unknown1;
		}
		break;
	}
	closeWindow(Window.statusMenu);
}

/// $C1BCAB
void teleport(short arg1) {
	short x16 = overworldStatusSuppression;
	overworldStatusSuppression = 1;
	for (short i = 1; i <= 10; i++) {
		setEventFlag(i, 0);
	}
	unknownC06B3D();
	playSfx(getScreenTransitionSoundEffect(teleportDestinationTable[arg1].screenTransition, 1));
	if (unknown7EB4B6 != 0) {
		fadeOut(1, 1);
	} else {
		screenTransition(teleportDestinationTable[arg1].screenTransition, 1);
	}
	loadMapAtPosition(cast(short)(teleportDestinationTable[arg1].x * 8), cast(short)(teleportDestinationTable[arg1].y * 8));
	unknown7E2890 = 0;
	unknownC03FA9(cast(short)(teleportDestinationTable[arg1].x * 8), cast(short)(teleportDestinationTable[arg1].y * 8), cast(short)((teleportDestinationTable[arg1].direction & 0x7F) - 1));
	if ((teleportDestinationTable[arg1].direction & 0x80) != 0) {
		unknownC052D4(cast(short)((teleportDestinationTable[arg1].direction & 0x7F) - 1));
	}
	loadSectorMusic(cast(short)(teleportDestinationTable[arg1].x * 8), cast(short)(teleportDestinationTable[arg1].y * 8));
	changeMapMusic();
	if (unknown7E9D1B !is null) {
		unknown7E9D1B();
		unknown7E9D1B = null;
	}
	unknownC065A3();
	playSfx(getScreenTransitionSoundEffect(teleportDestinationTable[arg1].screenTransition, 0));
	if (unknown7EB4B6 != 0) {
		fadeIn(1, 1);
	} else {
		screenTransition(teleportDestinationTable[arg1].screenTransition, 0);
	}
	unknown7E5DC4 = -1;
	overworldStatusSuppression = x16;
}

/// $C1BE4D
short attemptHomesickness() {
	if (partyCharacters[0].afflictions[0] != Status0.unconscious) {
		short x0E = 15;
		for (short x = 0; 6 > x; x++, x0E += 15) {
			if (partyCharacters[0].level <= x0E) {
				if ((homesicknessProbabilities[x] != 0) && (randMod(homesicknessProbabilities[x]) == 0)) {
					return inflictStatusNonBattle(1, 5 + 1, Status5.homesick + 1);
				}
				return 0;
			}
		}
	}
	return 0;
}

/// $C1BEC6
void getOffBicycle() {
	createWindowN(Window.textStandard);
	setWorkingMemory(WorkingMemory(1));
	displayText(getTextBlock("textGotOffBike"));
	closeFocusWindowN();
	windowTick();
	unknownC03CFD();
}

/// $C1BEFC
short triggerSpecialEvent(short arg1) {
	switch (arg1) {
		case 1:
			coffeeTeaScene(0);
			break;
		case 2:
			coffeeTeaScene(1);
			break;
		case 3:
			enterYourNamePlease(0);
			break;
		case 4:
			enterYourNamePlease(1);
			break;
		case 5:
			unknownC43344(1);
			break;
		case 6:
			unknownC43344(getEventFlag(EventFlag.winGiegu));
			break;
		case 7:
			return displayTownMap();
		case 8:
			return unknownC3FB09();
		case 9:
			useSoundStone(1);
			break;
		case 10:
			showTitleScreen(1);
			break;
		case 11:
			playCastScene();
			break;
		case 12:
			playCredits();
			break;
		case 13:
			unknownC12D17(1);
			break;
		case 14:
			unknownC12D17(0);
			break;
		case 15:
			for (short i = 0; i < eventFlags.length; i++) {
				eventFlags[i] = 0;
			}
			break;
		case 16:
			useSoundStone(0);
			break;
		case 17:
			return attemptHomesickness();
		case 18:
			if (gameState.walkingStyle == 3) {
				unknownC03CFD();
				return 1;
			}
			return 0;
		default: break;
	}
	return 0;
}

/// $C1C165
short unknownC1C165(short arg1) {
	ubyte* y = &partyCharacters[arg1 - 1].afflictions[0];
	for (short i = 0; i < 7; i++, y++) {
		if (y[0] == 0) {
			continue;
		}
		if (unknownC3F0B0[i][y[0] - 1] != 0) {
			return 0;
		}
		return 1;
	}
	return 1;
}

/// $C1C1BA
short unknownC1C1BA(short character, ushort categories, ushort types) {
	if (character == 3) {
		return 0;
	}
	short x13 = cast(short)(character - 1);
	for (short i = 1; psiAbilityTable[i].name != 0; i++) {
		ubyte x10 = 0;
		switch (x13) {
			case 0:
				x10 = psiAbilityTable[i].nessLevel;
				break;
			case 1:
				x10 = psiAbilityTable[i].paulaLevel;
				break;
			case 3:
				x10 = psiAbilityTable[i].pooLevel;
				break;
			default: break;
		}
		if ((x10 != 0) && ((psiAbilityTable[i].target & categories) != 0) && (x10 <= partyCharacters[x13].level)) {
			if ((psiAbilityTable[i].type & types) != 0) {
				return 1;
			}
		}
	}
	if ((x13 == 0) && ((categories & 1) != 0) && ((gameState.partyPSI & 1) != 0) && ((types & 8) != 0)) {
		return 1;
	}
	if ((x13 == 3) && ((categories & 2) != 0) && ((gameState.partyPSI & 6) != 0) && ((types & 1) != 0)) {
		return 1;
	}
	return 0;
}

/// $C1C32A
short unknownC1C32A(short arg1, short arg2, short arg3) {
	short x04 = 0;
	if ((arg1 != 3) && (unknownC1C165(arg1) != 0) && (unknownC1C1BA(arg1, arg2, arg3) != 0)) {
		x04 = 1;
	}
	return x04;
}

/// $C1C367
short unknownC1C367(short arg1) {
	return unknownC1C32A(arg1, 1, 0xF);
}

/// $C1C373
short unknownC1C373() {
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if (unknownC1C32A(gameState.partyMembers[i], 1, 0xF) != 0) {
			return cast(short)(i + 1);
		}
	}
	return 0;
}

/// $C1C3B6
short unknownC1C3B6() {
	short x04 =0;
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if (unknownC1C32A(gameState.partyMembers[i], 1, 0xF) != 0) {
			x04++;
		}
	}
	return x04;
}

/// $C1C403
void getPSIName(short arg1) {
	const(ubyte)* x06;
	if (arg1 == 1) {
		x06 = &gameState.favouriteThing[0];
	} else {
		x06 = &psiNameTable[arg1 - 1][0];
	}
	printWrappableString(-1, x06);
}

/// $C1C452
void generatePSIList(short arg1, ubyte arg2, ubyte arg3) {
	arg1--;
	setInstantPrinting();
	unknownC11383();
	short x1F = 0;
	if ((arg1 == 3) && ((arg2 & 2) != 0) && ((arg3 & 1) != 0)) {
		if ((gameState.partyPSI & 2) != 0) {
			moveCurrentTextCursor(0, psiAbilityTable[21].menuY);
			getPSIName(psiAbilityTable[21].name);
			unknownC1153B(21, psiAbilityTable[21].menuX, psiAbilityTable[21].menuY, &psiSuffixes[psiAbilityTable[21].level - 1][0], null);
		}
		if ((gameState.partyPSI & 4) != 0) {
			unknownC1153B(22, psiAbilityTable[22].menuX, psiAbilityTable[22].menuY, &psiSuffixes[psiAbilityTable[22].level - 1][0], null);
		}
	}
	for (short i = 1; psiAbilityTable[i].name != 0; i++) {
		ubyte x18;
		switch (arg1) {
			case 0:
				x18 = psiAbilityTable[i].nessLevel;
				break;
			case 1:
				x18 = psiAbilityTable[i].paulaLevel;
				break;
			case 3:
				x18 = psiAbilityTable[i].pooLevel;
				break;
			default: break;
		}
		if (x18 == 0) {
			continue;
		}
		if ((psiAbilityTable[i].target & arg2) == 0) {
			continue;
		}
		if (x18 > partyCharacters[arg1].level) {
			continue;
		}
		if ((psiAbilityTable[i].type & arg3) == 0) {
			continue;
		}
		if (psiAbilityTable[i].name != x1F) {
			moveCurrentTextCursor(0, psiAbilityTable[i].menuY);
			getPSIName(psiAbilityTable[i].name);
			x1F = psiAbilityTable[i].name;
		}
		unknownC1153B(i, psiAbilityTable[i].menuX, psiAbilityTable[i].menuY, &psiSuffixes[psiAbilityTable[i].level - 1][0], null);
	}
	if ((arg1 == 0) && ((arg2 & 1) != 0) && ((arg3 & 8) != 0)) {
		if ((gameState.partyPSI & 1) != 0) {
			moveCurrentTextCursor(0, psiAbilityTable[51].menuY);
			getPSIName(psiAbilityTable[51].name);
			unknownC1153B(51, psiAbilityTable[51].menuX, psiAbilityTable[51].menuY, &psiSuffixes[psiAbilityTable[51].level - 1][0], null);
		}
		if ((gameState.partyPSI & 8) != 0) {
			unknownC1153B(52, psiAbilityTable[52].menuX, psiAbilityTable[52].menuY, &psiSuffixes[psiAbilityTable[52].level - 1][0], null);
		}
	}
	printMenuItems();
	clearInstantPrinting();
}

/// $C1C853
void unknownC1C853(short arg1) {
	createWindowN(Window.textStandard);
	windowTickWithoutInstantPrinting();
	if (gameState.playerControlledPartyMemberCount != 1) {
		unknown7E5E7A = 1;
	}
	setWindowTitle(1, PartyCharacter.name.length, &partyCharacters[arg1 - 1].name[0]);
	generatePSIList(arg1, 1, 0xF);
}

/// $C1C8BC
void unknownC1C8BC(short arg1) {
	const(ubyte)* x06;
	createWindowN(Window.unknown04);
	windowTickWithoutInstantPrinting();
	unknown7E5E6E = 0;
	if (psiAbilityTable[arg1].name == 4) {
		x06 = &psiTargetText[0][0][0];
	} else {
		x06 = &psiTargetText[battleActionTable[psiAbilityTable[arg1].battleAction].direction][battleActionTable[psiAbilityTable[arg1].battleAction].target][0];
	}
	printString(psiTargetText[0][0].length, x06);
	unknown7E5E6E = 0xFF;
	moveCurrentTextCursor(0, 1);
	printString(ppCostText.length, &ppCostText[0]);
	printLetter(ebChar(' '));
	setCurrentWindowPadding(0x81);
	unknownC43D75(0x28, 0x1);
	printNumber(battleActionTable[psiAbilityTable[arg1].battleAction].ppCost);
	clearInstantPrinting();
}

/// $C1CA06
void printPSIName(short id) {
	getPSIName(psiAbilityTable[id].name);
	printWrappableString(-1, &psiSuffixes[psiAbilityTable[id].level - 1][0]);
}

/// $C1CA72
void unknownC1CA72(short arg1, short arg2) {
	setInstantPrinting();
	short x0E = windowStats[windowTable[currentFocusWindow]].textY;
	unknownEF0115(currentFocusWindow);
	windowTickWithoutInstantPrinting();
	unknownC1C853(unknown7E9D16);
	printMenuItems();
	windowStats[windowTable[currentFocusWindow]].textY = x0E;
	moveCurrentTextCursor(0, getTextY());
	windowSetTextColor(arg2);
	getPSIName(psiAbilityTable[arg1].name);
	windowSetTextColor(0);
	clearInstantPrinting();
}

/// $C1CAF5
void unknownC1CAF5(short arg1) {
	short x10 = gameState.partyMembers[battleMenuCurrentCharacterID];
	createWindowN(Window.textStandard);
	windowTickWithoutInstantPrinting();
	switch (arg1) {
		case 1:
			generatePSIList(x10, 2, 1);
			break;
		case 2:
			generatePSIList(x10, 2, 2);
			break;
		case 3:
			generatePSIList(x10, 2, 4);
			break;
		case 4:
			generatePSIList(x10, 3, 8);
			break;
		default: break;
	}
}

/// $C1CB7F
short unknownC1CB7F(short arg1, short arg2) {
	short x0E = void;
	switch (arg1) {
		case 1:
			x0E = unknownC1C1BA(arg2, 2, 1);
			break;
		case 2:
			x0E = unknownC1C1BA(arg2, 2, 2);
			break;
		case 3:
			x0E = unknownC1C1BA(arg2, 2, 4);
			break;
		default: break;
	}
	return x0E;
}

/// $C1CBCD
short battlePSIMenu(UnknownA97D* arg1) {
	short x1E = 0;
	short x02;
	short x16;
	outer: while (true) {
		createWindowN(Window.unknown10);
		for (short i = 0; i < 3; i++) {
			unknownC115F4(cast(short)(i + 1), &psiCategories[i][0], null);
		}
		unknownC1180D(1, 0, 0);
		while (true) {
			setWindowFocus(Window.unknown10);
			if (x1E == 0) {
				printMenuItems();
			}
			x1E++;
			unknownC11F5A(&unknownC1CAF5);
			x02 = selectionMenu(1);
			unknownC11F8A();
			if (x02 == 0) {
				break outer;
			}
			if (unknownC1CB7F(x02, arg1.unknown0) == 0) {
				continue;
			}
			short x1C;
			while (true) {
				createWindowN(Window.textStandard);
				unknownC1CAF5(x02);
				unknownC11F5A(&unknownC1C8BC);
				x1C = selectionMenu(1);
				unknownC11F8A();
				if (x1C == 0) {
					break;
				}
				if (battleActionTable[psiAbilityTable[x1C].battleAction].ppCost > partyCharacters[arg1.unknown0 - 1].pp.target) {
					createWindowN(Window.textBattle);
					enableBlinkingTriangle(2);
					displayText(getTextBlock("textNotEnoughPP"));
					clearBlinkingPrompt();
					closeFocusWindowN();
					x16 = 0;
					goto Unknown15;
				}
				if ((battleActionTable[psiAbilityTable[x1C].battleAction].target == 1) || (battleActionTable[psiAbilityTable[x1C].battleAction].target == 3)) {
					if (battleActionTable[psiAbilityTable[x1C].battleAction].direction == 0) {
						closeWindow(Window.unknown10);
						closeWindow(Window.unknown04);
						closeWindow(Window.textStandard);
						createWindowN(Window.unknown26);
						setInstantPrinting();
						windowSetTextColor(6);
						printPSIName(x1C);
						windowSetTextColor(0);
					}
					x16 = determineTargetting(psiAbilityTable[x1C].battleAction, arg1.unknown0);
					if (battleActionTable[psiAbilityTable[x1C].battleAction].direction == 0) {
						closeWindow(Window.unknown26);
					} else {
						closeWindow(Window.unknown10);
						closeWindow(Window.unknown04);
						closeWindow(Window.textStandard);
					}
					if (x16 != 0) {
						goto Unknown15;
					}
				}
			}
			x16 = 1;
			Unknown15:
			if (x16 == 0) {
				continue;
			}
			closeWindow(Window.unknown04);
			if (x1C == 0) {
				break;
			}
			arg1.unknown1 = cast(ubyte)x1C;
			arg1.unknown2 = psiAbilityTable[x1C].battleAction;
			arg1.unknown4 = cast(ubyte)(x16 >> 8);
			arg1.unknown5 = cast(ubyte)x16;
			x02 = 1;
			break outer;
		}
	}
	closeWindow(Window.textStandard);
	closeWindow(Window.unknown10);
	return x02;
}

/// $C1CE85
short unknownC1CE85(UnknownA97D* arg1) {
	short x02 = 0xFF;
	arg1.unknown2 = BattleActions.action002;
	arg1.unknown4 = 1;
	arg1.unknown5 = arg1.unknown0;
	const(Item)* x06 = &itemData[getCharacterItem(arg1.unknown0, arg1.unknown1)];
	short x12 = x06.type;
	switch (x12 & 0x30) {
		case 0x10:
		case 0x20:
			x02 = determineTargetting(x06.battleAction, arg1.unknown0);
			if (x02 == 0) {
				return 0;
			}
			arg1.unknown2 = x06.battleAction;
			arg1.unknown4 = cast(ubyte)(x02 >> 8);
			arg1.unknown5 = cast(ubyte)x02;
			break;
		case 0x30:
			if (((x12 & 0xC) == 0) || ((x12 & 0xC) == 4)) {
				if ((x06.flags & itemUsableFlags[arg1.unknown0 - 1]) != 0) {
					x02 = determineTargetting(x06.battleAction, arg1.unknown0);
					if (x02 == 0) {
						return 0;
					}
					arg1.unknown2 = x06.battleAction;
					arg1.unknown4 = cast(ubyte)(x02 >> 8);
					arg1.unknown5 = cast(ubyte)x02;
				} else {
					arg1.unknown2 = 3;
				}
			}
			break;
		default: break;
	}
	return x02;
}

/// $C1CFC6
short unknownC1CFC6(UnknownA97D* arg1) {
	short x0E = 0;
	if (partyCharacters[arg1.unknown0 - 1].items[0] != 0) {
		while (true) {
			createWindowN(Window.inventory);
			inventoryGetItemName(arg1.unknown0, Window.inventory);
			x0E = selectionMenu(1);
			setInstantPrinting();
			closeFocusWindow();
			if (x0E == 0) {
				break;
			}
			arg1.unknown1 = cast(ubyte)x0E;
			x0E = unknownC1CE85(arg1);
			closeWindow(Window.unknown26);
			if (x0E != 0) {
				break;
			}
		}
	}
	return x0E;
}

/// $C1D038 - Get fixed version of an item
/// Returns: Fixed item id, or 0 if nonexistant
short unknownC1D038(short arg1) {
	if (itemData[arg1].type == 8) {
		return itemData[arg1].parameters.ep;
	}
	return 0;
}

/// $C1D08B
short unknownC1D08B(short arg1, short arg2, short arg3) {
	short x0E = cast(short)((arg1 * arg2) - ((arg3 - 2) * 10));
	short x02 = (x0E <= 0) ? 0 : randMod(3);
	return cast(short)(((unknownC3F2B1[(arg1 + 1) % unknownC3F2B1.length] + x02 - 1) * x0E) / 50);
}

/// $C1D109
void levelUpChar(short arg1, short arg2) {
	arg1--;
	short x16 = partyCharacters[arg1].level;
	partyCharacters[arg1].level++;
	if (arg2 != 0) {
		enableBlinkingTriangle(1);
		unknownC1ACA1(&partyCharacters[arg1].name[0], 5);
		unknownC1AD0A(partyCharacters[arg1].level);
		displayText(getTextBlock("textLevelIsNowX"));
		enableBlinkingTriangle(2);
	}
	short x02 = unknownC1D08B(x16, statsGrowthVars[arg2].offense, partyCharacters[arg1].baseOffense);
	if (x02 > 0) {
		partyCharacters[arg1].baseOffense += x02;
		recalcCharacterPostmathOffense(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			unknownC1AD0A(x02);
			displayText(getTextBlock("textLevelUpOffense"));
		}
	}
	x02 = unknownC1D08B(x16, statsGrowthVars[arg2].defense, partyCharacters[arg1].baseDefense);
	if (x02 > 0) {
		partyCharacters[arg1].baseDefense += x02;
		recalcCharacterPostmathDefense(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			unknownC1AD0A(x02);
			displayText(getTextBlock("textLevelUpDefense"));
		}
	}
	x02 = unknownC1D08B(x16, statsGrowthVars[arg2].speed, partyCharacters[arg1].baseSpeed);
	if (x02 > 0) {
		partyCharacters[arg1].baseSpeed += x02;
		recalcCharacterPostmathSpeed(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			unknownC1AD0A(x02);
			displayText(getTextBlock("textLevelUpSpeed"));
		}
	}
	x02 = unknownC1D08B(x16, statsGrowthVars[arg2].guts, partyCharacters[arg1].baseGuts);
	if (x02 > 0) {
		partyCharacters[arg1].baseGuts += x02;
		recalcCharacterPostmathGuts(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			unknownC1AD0A(x02);
			displayText(getTextBlock("textLevelUpGuts"));
		}
	}
	if (10 > x16) {
		x02 = cast(short)(((statsGrowthVars[arg1].vitality * x16) - (partyCharacters[arg1].baseVitality - 2) * 10) / 10);
	} else {
		x02 = unknownC1D08B(x16, statsGrowthVars[arg1].vitality, partyCharacters[arg1].baseVitality);
	}
	if (x02 > 0) {
		partyCharacters[arg1].baseVitality += x02;
		recalcCharacterPostmathVitality(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			unknownC1AD0A(x02);
			displayText(getTextBlock("textLevelUpVitality"));
		}
	}
	if (10 > x16) {
		x02 = cast(short)(((statsGrowthVars[arg1].iq * x16) - (partyCharacters[arg1].baseIQ - 2) * 10) / 10);
	} else {
		x02 = unknownC1D08B(x16, statsGrowthVars[arg1].iq, partyCharacters[arg1].baseIQ);
	}
	if (x02 > 0) {
		partyCharacters[arg1].baseIQ += x02;
		recalcCharacterPostmathIQ(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			unknownC1AD0A(x02);
			displayText(getTextBlock("textLevelUpIQ"));
		}
	}
	x02 = unknownC1D08B(x16, statsGrowthVars[arg2].luck, partyCharacters[arg1].baseLuck);
	if (x02 > 0) {
		partyCharacters[arg1].baseLuck += x02;
		recalcCharacterPostmathLuck(cast(short)(arg1 + 1));
		if (arg2 != 0) {
			unknownC1AD0A(x02);
			displayText(getTextBlock("textLevelUpLuck"));
		}
	}
	short x14 = cast(short)(partyCharacters[arg1].vitality * 15 - partyCharacters[arg1].maxHP);
	x02 = (x14 > 1) ? x14 : cast(short)(randMod(2) + 1);
	partyCharacters[arg1].maxHP += x02;
	partyCharacters[arg1].hp.target += x02;
	if (arg2 != 0) {
		unknownC1AD0A(x02);
		displayText(getTextBlock("textLevelUpMaxHP"));
	}
	if (arg1 != 2) {
		short x12 = ((arg1 == 0) && (getEventFlag(EventFlag.winOscar) != 0)) ? partyCharacters[arg1].iq * 2 : partyCharacters[arg1].iq;
		x14 = cast(short)(x12 * 5 - partyCharacters[arg1].maxPP);
		x14 = (x14 > 1) ? x14 : (randMod(2));
		if (x14 != 0) {
			partyCharacters[arg1].maxPP += x14;
			partyCharacters[arg1].pp.target += x14;
			if (arg2 != 0) {
				unknownC1AD0A(x14);
				displayText(getTextBlock("textLevelUpMaxPP"));
			}
		}
		if (arg2 != 0) {
			x02 = x16;
			x02++;
			switch (arg1) {
				case 0:
					for (short i = 1; psiAbilityTable[i].name != 0; i++) {
						if (psiAbilityTable[i].nessLevel == x02) {
							unknownC1ACF8(i);
							displayText(getTextBlock("textLevelUpPSILearned"));
						}
					}
					break;
				case 1:
					for (short i = 1; psiAbilityTable[i].name != 0; i++) {
						if (psiAbilityTable[i].paulaLevel == x02) {
							unknownC1ACF8(i);
							displayText(getTextBlock("textLevelUpPSILearned"));
						}
					}
					break;
				case 3:
					for (short i = 1; psiAbilityTable[i].name != 0; i++) {
						if (psiAbilityTable[i].pooLevel == x02) {
							unknownC1ACF8(i);
							displayText(getTextBlock("textLevelUpPSILearned"));
						}
					}
					break;
				default: break;
			}
		}
	}
	if (arg2 != 0) {
		clearBlinkingPrompt();
	}
}

/// $C1D9E9
void gainEXP(short arg1, short arg2, uint exp) {
	partyCharacters[arg1 - 1].exp += exp;
	if (partyCharacters[arg1 - 1].level > 99) {
		return;
	}
	if (expTable[arg1 - 1][partyCharacters[arg1 - 1].level + 1] < partyCharacters[arg1 - 1].exp) {
		if (arg2 != 0) {
			changeMusic(Music.levelUp);
		}
		while (expTable[arg1 - 1][partyCharacters[arg1 - 1].level + 1] < partyCharacters[arg1 - 1].exp) {
			levelUpChar(arg1, arg2);
			if (partyCharacters[arg1 - 1].level > 99) {
				return;
			}
		}
	}
}

/// $C1DB33
short findCondiment(short item) {
	if ((itemData[item].type & 0x3C) == 0x20) {
		for (short i = 0; (i < 14) && (partyCharacters[currentAttacker.id - 1].items[i] != 0xFF); i++) {
			if ((itemData[partyCharacters[currentAttacker.id - 1].items[i]].type & 0x3C) == 0x28) {
				return partyCharacters[currentAttacker.id - 1].items[i];
			}
		}
	}
	return 0;
}

/// $C1DBBB
void showHPAlert(short arg1) {
	Battler battler;
	Battler* x02 = currentAttacker;
	battler.side = BattleSide.friends;
	battler.id = cast(ubyte)arg1;
	currentAttacker = &battler;
	freezeEntities();
	createWindowN(Window.textStandard);
	unknownC1AC4A(&partyCharacters[arg1].name[0], 5);
	displayText(getTextBlock("textAlertConditionCritical"));
	closeFocusWindowN();
	windowTick();
	unfreezeEntities();
	currentAttacker = x02;
}

/// $C1D8D0
void resetCharLevelOne(short arg1, short arg2, short arg3) {
	tracef("Setting char %s level to %s", arg1, arg2);
	partyCharacters[arg1 - 1].level = 1;
	partyCharacters[arg1 - 1].baseOffense = 2;
	partyCharacters[arg1 - 1].baseDefense = 2;
	partyCharacters[arg1 - 1].baseSpeed = 2;
	partyCharacters[arg1 - 1].baseGuts = 2;
	partyCharacters[arg1 - 1].baseLuck = 2;
	partyCharacters[arg1 - 1].baseVitality = 2;
	partyCharacters[arg1 - 1].baseIQ = 2;
	partyCharacters[arg1 - 1].maxHP = 30;
	partyCharacters[arg1 - 1].hp.target = 30;
	partyCharacters[arg1 - 1].hp.current.integer = 30;
	short x10;
	if (arg1 - 1 != 2) {
		x10 = 10;
	} else {
		x10 = 0;
	}
	partyCharacters[arg1 - 1].maxPP = x10;
	partyCharacters[arg1 - 1].pp.target = x10;
	partyCharacters[arg1 - 1].pp.current.integer = x10;
	recalcCharacterPostmathOffense(arg1);
	recalcCharacterPostmathDefense(arg1);
	recalcCharacterPostmathSpeed(arg1);
	recalcCharacterPostmathGuts(arg1);
	recalcCharacterPostmathLuck(arg1);
	recalcCharacterPostmathVitality(arg1);
	recalcCharacterPostmathIQ(arg1);
	while (--arg2 != 0) {
		levelUpChar(arg1, 0);
	}
	if (arg3 != 0) {
		partyCharacters[arg1 - 1].exp = expTable[arg1 - 1][partyCharacters[arg1 - 1].level];
	}
}

/// $C1DC66
void displayTextWait(const(ubyte)* arg1, int arg2) {
	if ((gameState.autoFightEnable != 0) && ((padState[0] & Pad.b) != 0)) {
		gameState.autoFightEnable = 0;
		unknownC20293();
	}
	unknownC1AD0A(arg2);
	if (battleModeFlag != 0) {
		enableBlinkingTriangle(2);
	}
	displayText(arg1);
	clearBlinkingPrompt();
}

/// $C1DCCB
void displayInBattleText(const(ubyte)* ptr) {
	if ((gameState.autoFightEnable != 0) && ((padState[0] & Pad.b) != 0)) {
		gameState.autoFightEnable = 0;
		unknownC20293();
	}
	if (battleModeFlag != 0) {
		enableBlinkingTriangle(2);
	}
	displayText(ptr);
	clearBlinkingPrompt();
}

/// $C1DCCB
void unknownC1DCCB(short arg1) {
	initializeTextSystem();
	battleModeFlag = 1;
	for (short i = 1; i <= 4; i++) {
		resetCharLevelOne(i, arg1, 1);
		recoverHPAmtPercent(i, 100, 0);
		recoverPPAmtPercent(i, 100, 0);
		partyCharacters[i - 1].hp.current.integer = partyCharacters[i - 1].hp.target;
		partyCharacters[i - 1].pp.current.integer = partyCharacters[i - 1].pp.target;
		memset(&partyCharacters[i - 1].afflictions[0], 0, PartyCharacter.afflictions.length);
	}
}

/// $C1DD3B
void showHPPPWindowsF() {
	showHPPPWindows();
}

/// $C1DD41
void hideHPPPWindowsF() {
	hideHPPPWindows();
}

/// $C1DD47
void createWindow(short id) {
	createWindowN(id);
}

/// $C1DD4D
void setWindowFocusF(short id) {
	setWindowFocus(id);
}

/// $C1DD59
void closeFocusWindow() {
	closeFocusWindowN();
}

/// $C1DD5F
void unknownC1DD5F() {
	closeAllWindows();
	windowTick();
	hideHPPPWindows();
	windowTick();
}

/// $C1DD70
void unknownC1AC4AF(ubyte* arg1, short arg2) {
	unknownC1AC4A(arg1, arg2);
}

/// $C1DD76
void unknownC1ACA1F(ubyte* arg1, short arg2) {
	unknownC1ACA1(arg1, arg2);
}

/// $C1DD7C
void unknownC1ACF8F(short arg1) {
	unknownC1ACF8(arg1);
}

/// $C1DD9F
void unknownC1DD9F(const(ubyte)* arg1) {
	enableBlinkingTriangle(1);
	displayText(arg1);
	clearBlinkingPrompt();
}

/// $C1DDCC
void unknownC43573F(short arg1) {
	unknownC43573(arg1);
}

/// $C1DDC6
ushort removeItemFromInventoryF(ushort character, ushort id) {
	return removeItemFromInventory(character, id);
}

/// $C1DDD3
void unknownC3E6F8F() {
	unknownC3E6F8();
}

/// $C1DDD3
void selectionMenuItemSetup(short arg1, short arg2, short arg3, const(ubyte)* arg4, string arg5) {
	unknownC1153B(arg1, arg2, arg3, arg4, arg5);
}

/// $C1DE25
void printMenuItemsF() {
	printMenuItems();
}

/// $C1DE25
short selectionMenuF(short id) {
	return selectionMenu(id);
}

/// $C1DE31
short unknownC1CFC6F(UnknownA97D* arg1) {
	return unknownC1CFC6(arg1);
}

/// $C1DE37
short unknownC1242EF(short arg1, short arg2, short arg3) {
	return unknownC1242E(arg1, arg2, arg3);
}

/// $C1DE3D
short battlePSIMenuF(UnknownA97D* arg1) {
	return battlePSIMenu(arg1);
}

/// $C1DE43
void battleActionSwitchWeapons() {
	enableBlinkingTriangle(1);
	if (canCharacterEquip(currentAttacker.id, currentAttacker.currentActionArgument) != 0) {
		short x18 = cast(short)(currentAttacker.offense - currentAttacker.baseOffense);
		short x04 = cast(short)(currentAttacker.guts - currentAttacker.baseGuts);
		equipItem(currentAttacker.id, currentAttacker.actionItemSlot);
		currentAttacker.baseOffense = partyCharacters[currentAttacker.id - 1].offense;
		currentAttacker.offense = cast(short)(currentAttacker.baseOffense + x18);
		currentAttacker.baseGuts = partyCharacters[currentAttacker.id - 1].guts;
		currentAttacker.guts = cast(short)(currentAttacker.baseGuts + x04);
		displayText(getTextBlock("textBattleEquipXInstead"));
	} else {
		displayText(getTextBlock("textBattleCouldNotEquipAttackAnyway"));
	}
	short tmp = partyCharacters[currentAttacker.id - 1].items[partyCharacters[currentAttacker.id - 1].equipment[EquipmentSlot.weapon] - 1];
	if ((tmp != 0) && ((itemData[tmp].type & 3) == 1)) {
		displayText(getTextBlock(battleActionTable[5].text));
		battleActionTable[5].func();
	} else {
		displayText(getTextBlock(battleActionTable[4].text));
		battleActionTable[4].func();
	}
	clearBlinkingPrompt();
}

/// $C1E00F
void battleActionSwitchArmor() {
	enableBlinkingTriangle(1);
	if (canCharacterEquip(currentAttacker.id, currentAttacker.currentActionArgument) != 0) {
		short x16 = cast(short)(currentAttacker.defense - currentAttacker.baseDefense);
		short x04 = cast(short)(currentAttacker.speed - currentAttacker.baseSpeed);
		short x02 = cast(short)(currentAttacker.luck - currentAttacker.baseLuck);
		equipItem(currentAttacker.id, currentAttacker.actionItemSlot);
		displayText(getTextBlock("textBattleEquipXInstead"));
		currentAttacker.baseDefense = partyCharacters[currentAttacker.id - 1].defense;
		currentAttacker.defense = cast(short)(currentAttacker.baseDefense + x16);
		currentAttacker.baseSpeed = partyCharacters[currentAttacker.id - 1].speed;
		currentAttacker.speed = cast(short)(currentAttacker.baseSpeed + x04);
		currentAttacker.baseLuck = partyCharacters[currentAttacker.id - 1].luck;
		currentAttacker.luck = cast(short)(currentAttacker.baseLuck + x02);
		currentAttacker.fireResist = calcPSIDamageModifiers(partyCharacters[currentAttacker.id - 1].fireResist);
		currentAttacker.freezeResist = calcPSIDamageModifiers(partyCharacters[currentAttacker.id - 1].freezeResist);
		currentAttacker.flashResist = calcPSIResistanceModifiers(partyCharacters[currentAttacker.id - 1].flashResist);
		currentAttacker.paralysisResist = calcPSIResistanceModifiers(partyCharacters[currentAttacker.id - 1].paralysisResist);
		currentAttacker.hypnosisResist = calcPSIResistanceModifiers(partyCharacters[currentAttacker.id - 1].hypnosisBrainshockResist);
		currentAttacker.brainshockResist = calcPSIResistanceModifiers(cast(ubyte)(3 - partyCharacters[currentAttacker.id - 1].hypnosisBrainshockResist));
	} else {
		displayText(getTextBlock("textBattleCouldNotEquipAttackAnyway"));
	}
	clearBlinkingPrompt();
}

/// $C1E1A2
void nullC1E1A2(Battler* arg1) {
	//nothing!
}

/// $C1E1A5
short enemySelectMode(short arg1) {
	short x16;
	short x24 = arg1;
	setInstantPrinting();
	createWindowN(Window.textBattle);
	short x1C = 1;
	short x1A = 1;
	short savedX = windowStats[windowTable[Window.textBattle]].textX;
	short savedY = windowStats[windowTable[Window.textBattle]].textY;
	outer: while (true) {
		setInstantPrinting();
		moveCurrentTextCursor(savedX, savedY);
		short x02 = unknownC10D7C(x24);
		ubyte* x18 = &unknown7E895A[7 - x02];
			version(bugfix) {
				alias printLetterFunc = unknownC43F77;
			} else {
				alias printLetterFunc = printLetter;
			}
		for (short i = 3; i > x02; i--) {
			printLetterFunc((i == x1C) ? baseNumberSelectorCharacter1 : baseNumberSelectorCharacter2);
		}
		for (short i = x02; i != 0; i--) {
			printLetterFunc(((i == x1C) ? baseNumberSelectorCharacter1 : baseNumberSelectorCharacter2) + (x18++)[0]);
		}
		clearInstantPrinting();
		windowTick();
		while (true) {
			windowTick();
			if (((padPress[0] & Pad.left) != 0) && (x1C < 3)) {
				x1C++;
				x1A *= 10;
				continue outer;
			} else if (((padPress[0] & Pad.right) != 0) && (x1C > 1)) {
				x1C--;
				x1A /= 10;
				continue outer;
			} else if ((padHeld[0] & Pad.up) != 0) {
				if ((x24 / x1A) % 10 != 9) {
					x24 += x1A;
				} else {
					x24 -= x1A * 9;
				}
				break;
			} else if ((padHeld[0] & Pad.down) != 0) {
				if ((x24 / x1A) % 10 != 0) {
					x24 -= x1A;
				} else {
					x24 += x1A * 9;
				}
				break;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				x16 = x24;
				break outer;
			} else if ((padPress[0] & (Pad.b | Pad.select)) != 0) {
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
		currentBattleGroup = x24;
		const(BattleGroupEnemy)* x06 = &battleEntryPointerTable[x24].enemies[0];
		enemiesInBattle = 0;
		while (x06[0].count != 0xFF) {
			short x14 = x06[0].count;
			while (x14-- != 0) {
				unknown7E9F8C[enemiesInBattle++] = x06[0].enemyID;
			}
			x06++;
		}
		prepareForImmediateDMA();
		unknownC2EEE7();
		for (short i = 8; i < battlersTable.length; i++) {
			memset(&battlersTable[i], 0, Battler.sizeof);
		}
		for (short i = 0; i < enemiesInBattle; i++) {
			battleInitEnemyStats(unknown7E9F8C[i], &battlersTable[8 + i]);
		}
		unknownC2F121();
		unknownC0856B(0x18);
		setForceBlank();
		fadeIn(1, 1);
	}
	setWindowFocus(Window.textBattle);
	closeFocusWindow();
	return x16;
}

/// $C1E48D
short unknownC1E48D(short arg1, short arg2, short arg3) {
	setInstantPrinting();
	setWindowFocus(arg1);
	short x0E = unknownC442AC(arg1, arg2, arg3);
	setWindowFocus(Window.fileSelectNamingKeyboard);
	return x0E;
}

/// $C1E4BE
short unknownC1E4BE(short arg1, short arg2, short arg3) {
	setInstantPrinting();
	createWindowN(arg1);
	short x10 = (4 > arg2) ? 5 : 6;
	unknownC441B7(x10);
	moveCurrentTextCursor(0, windowStats[windowTable[currentFocusWindow]].textY);
	short x12 = (arg3 == 6) ? 0 : cast(short)(arg3 + 1);
	// Huh. The vanilla game happily just indexes out of bounds here.
	for (short i = 0; i < dontCareNames[arg2][x12].length && dontCareNames[arg2][x12][i] != 0; i++) {
		unknownC442AC(arg1, x10, dontCareNames[arg2][x12][i]);
	}
	setWindowFocus(Window.fileSelectNamingKeyboard);
	return x12;
}

/// $C1E57F
short textInputDialog(short arg1, short arg2, ubyte* arg3, short arg4, short arg5) {
	short x24 = -1;
	short x22 = 0;
	short x20 = 0;
	short x1E = arg4;
	short x04;
	short x16;
	setInstantPrinting();
	createWindowN(Window.fileSelectNamingKeyboard);
	if (arg5 == -1) {
		displayText(&nameInputWindowSelectionLayoutPointers[5][0]);
	} else {
		displayText(&nameInputWindowSelectionLayoutPointers[4][0]);
	}
	unknown7E5E6D = 0;
	if (arg5 == -1) {
		displayText(&nameInputWindowSelectionLayoutPointers[2 + arg4][0]);
	} else {
		displayText(&nameInputWindowSelectionLayoutPointers[arg4][0]);
	}
	unknown7E5E6D = 1;
	l0: while (true) {
		setInstantPrinting();
		if (x1E != arg4) {
			createWindowN(Window.fileSelectNamingKeyboard);
			windowTickWithoutInstantPrinting();
			if (arg5 == -1) {
				displayText(&nameInputWindowSelectionLayoutPointers[5][0]);
			} else {
				displayText(&nameInputWindowSelectionLayoutPointers[4][0]);
			}
			unknown7E5E6D = 0;
			if (arg5 == -1) {
				displayText(&nameInputWindowSelectionLayoutPointers[2 + arg4][0]);
			} else {
				displayText(&nameInputWindowSelectionLayoutPointers[arg4][0]);
			}
			unknown7E5E6D = 1;
		}
		l1: while (true) {
			clearInstantPrinting();
			moveCurrentTextCursor(x20, x22);
			windowSetTextColor(1);
			unknownC10D60(33);
			windowSetTextColor(0);
			windowTick();
			x04 = 1;
			l2: while (true) {
				x04 ^= 1;
				copyToVRAM(0, 2, cast(ushort)((windowStats[windowTable[currentFocusWindow]].textY * 2 + windowStats[windowTable[currentFocusWindow]].y) * 32 + windowStats[windowTable[currentFocusWindow]].x + windowStats[windowTable[currentFocusWindow]].textX + 0x7C20), cast(const(ubyte)*)&arrC3E406[x04]);
				copyToVRAM(0, 2, cast(ushort)((windowStats[windowTable[currentFocusWindow]].textY * 2 + windowStats[windowTable[currentFocusWindow]].y) * 32 + windowStats[windowTable[currentFocusWindow]].x + windowStats[windowTable[currentFocusWindow]].textX + 0x7C40), cast(const(ubyte)*)&arrC3E40A[x04]);
				for (short i = 0; 10 > i; i++) {
					unknownC1004E();
					if ((padPress[0] & Pad.up) != 0) {
						x16 = moveCursor(x20, x22, -1, 0, Sfx.unknown7C, x20, windowStats[windowTable[currentFocusWindow]].height / 2);
						break l2;
					}
					if ((padPress[0] & Pad.left) != 0) {
						x16 = moveCursor(x20, x22, 0, -1, Sfx.unknown7B, windowStats[windowTable[currentFocusWindow]].width, x22);
						break l2;
					}
					if ((padPress[0] & Pad.down) != 0) {
						x16 = moveCursor(x20, x22, 1, 0, Sfx.unknown7C, x20, -1);
						break l2;
					}
					if ((padPress[0] & Pad.right) != 0) {
						x16 = moveCursor(x20, x22, 0, 1, Sfx.unknown7B, -1, x22);
						break l2;
					}
					if ((padHeld[0] & Pad.up) != 0) {
						x16 = unknownC20B65(x20, x22, -1, 0, Sfx.unknown7C);
						break l2;
					}
					if ((padHeld[0] & Pad.down) != 0) {
						x16 = unknownC20B65(x20, x22, 1, 0, Sfx.unknown7C);
						break l2;
					}
					if ((padHeld[0] & Pad.left) != 0) {
						x16 = unknownC20B65(x20, x22, 0, -1, Sfx.unknown7B);
						break l2;
					}
					if ((padHeld[0] & Pad.right) != 0) {
						x16 = unknownC20B65(x20, x22, 0, 1, Sfx.unknown7B);
						break l2;
					}
					if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
						if (x22 == 6) {
							switch (x20) {
								case 0: //don't care
									playSfx(Sfx.textInput);
									x24 = unknownC1E4BE(arg1, arg5, x24);
									continue l1;
								case 17: //backspace
									playSfx(Sfx.textInput);
									if ((unknownC1E48D(arg1, arg2, -1) != 0) && (arg5 != -1)) {
										return 1;
									}
									continue l1;
								case 25: //OK
									playSfx(Sfx.unknown5E);
									goto Unknown42;
								default: break;
							}
						} else {
							playSfx(Sfx.textInput);
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
							unknownC1E48D(arg1, arg2, getCharacterAtCursorPosition(x20 / 2, x22, arg4));
							continue l1;
						}
					} else if ((padPress[0] & (Pad.b | Pad.select)) != 0) {
						playSfx(Sfx.unknown7D);
						if ((unknownC1E48D(arg1, arg2, -1) != 0) && (arg5 != -1)) {
							return 1;
						}
					} else if ((padPress[0] & Pad.start) != 0) {
						playSfx(Sfx.unknown7E);
						goto Unknown42;
					}
				}
			}
			moveCurrentTextCursor(x20, x22);
			unknownC10D60(0x2F);
			if (x16 != -1) {
				x20 = x16 & 0xFF;
				x22 = x16 >> 8;
			}
			continue;
			Unknown42:
			if (strlen(cast(char*)&unknown7E1B86[0]) != 0) {
				setWindowFocus(arg1);
				short i;
				for(i = 0; (unknown7E1B86[i] != 0) && (i < arg2); i++) {
					(arg3++)[0] = unknown7E1B86[i];
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
short enterYourNamePlease(short arg1) {
	short result;
	unknown7E5E6E = 0;
	unknown7EB49D = 1;
	setInstantPrinting();
	createWindowN(Window.unknown27);
	if (arg1 != 0) {
		moveCurrentTextCursor(0, 0);
		printString(24, &gameState.earthboundPlayerName[0]);
		moveCurrentTextCursor(0, 1);
		unknownC441B7(12);
		if (gameState.mother2PlayerName[0] != 0) {
			printString(12, &gameState.mother2PlayerName[0]);
		}
		moveCurrentTextCursor(0, 1);
		result = textInputDialog(Window.unknown27, 12, &gameState.mother2PlayerName[0], 0, -1);
	} else {
		moveCurrentTextCursor(0, 0);
		printString(26, &nameRegistryRequestString[0]);
		waitDMAFinished();
		moveCurrentTextCursor(0, 1);
		unknownC441B7(24);
		moveCurrentTextCursor(0, 1);
		if (gameState.earthboundPlayerName[0] != 0) {
			unknownC440B5(&gameState.earthboundPlayerName[0], 24);
		}
		moveCurrentTextCursor(0, 1);
		result = textInputDialog(Window.unknown27, 24, &gameState.earthboundPlayerName[0], 0, -1);
		unknownC4D065(&unknown7E9C9F[0], &gameState.earthboundPlayerName[0]);
		memcpy(&gameState.mother2PlayerName[0], &unknown7E9C9F[0], 12);
	}
	closeWindow(Window.fileSelectNamingKeyboard);
	closeWindow(Window.unknown27);
	unknown7E5E6E = 0xFF;
	unknown7EB49D = 0;
	return result;
}

/// $C1EC04
short nameACharacter(short arg1, ubyte* arg2, short arg3, const(ubyte)* arg4, short arg5) {
	createWindowN(Window.fileSelectNamingNameBox);
	windowTickWithoutInstantPrinting();
	if (arg2[0] != 0) {
		unknownC440B5(arg2, arg1);
	} else {
		unknownC441B7(arg1);
	}
	moveCurrentTextCursor(0, 0);
	createWindowN(Window.fileSelectNamingMessage);
	windowTickWithoutInstantPrinting();
	printString(arg5, arg4);
	cc1314(1, 0);
	short x14 = textInputDialog(Window.fileSelectNamingNameBox, arg1, arg2, 0, arg3);
	closeWindow(Window.fileSelectNamingKeyboard);
	return x14;
}

/// $C1EC8F
void unknownC1EC8F(short arg1) {
	ubyte x00 = gameState.textFlavour;
	gameState.textFlavour = cast(ubyte)arg1;
	prepareWindowGraphics();
	loadWindowGraphics(WindowGraphicsToLoad.all2);
	loadTextPalette();
	unknown7E0030 = 0x18;
	gameState.textFlavour = x00;
}

/// $C1ECD1
void unknownC1ECD1(short arg1) {
	unknownC1EC8F(arg1 >> 8);
}

/// $C1ECDC
void corruptionCheck() {
	if (unknown7E9F79 == 0) {
		return;
	}
	unknownC20A20(&unknown7E9C8A);
	createWindowN(Window.unknown2f);
	for (short i = 0; 3 > i; i++) {
		if ((unknownEF05A6[i] & unknown7E9F79) == 0) {
			continue;
		}
		unknownC1AD0A(i + 1);
		displayText(getTextBlock("textSaveFileLost"));
	}
	closeFocusWindowN();
	unknown7E9F79 = 0;
	unknownC20ABC(&unknown7E9C8A);
}

/// $C1ED5B
short fileSelectMenu(short arg1) {
	short x1C;
	createWindowN(Window.fileSelectMain);
	for (short i = 0; i < 3; i++, unknownC115F4(x1C | i, &unknown7E9C9F[0], null)) {
		loadGameSlot(i);
		if (gameState.favouriteThing[1] != 0) {
			memset(&unknown7E9C9F[0], 0, 0x20);
			unknown7E9C9F[0] = cast(ubyte)(ebChar('1') + i);
			unknown7E9C9F[1] = ebChar(':');
			unknown7E9C9F[2] = ebChar(' ');
			for (short j = 0; j < PartyCharacter.name.length; j++) {
				if ((partyCharacters[0].name[j] == 0) || (j >= PartyCharacter.name.length)) {
					unknown7E9C9F[j + 3] = 0;
				} else if (j < PartyCharacter.name.length) {
					unknown7E9C9F[j + 3] = partyCharacters[0].name[j];
				}
			}
			unknown7EB49E[i] = 1;
			x1C = cast(short)(gameState.textFlavour << 8);
		} else {
			unknown7E9C9F[0] = cast(ubyte)(ebChar('1') + i);
			memcpy(&unknown7E9C9F[1], &fileSelectTextStartNewGame[0], fileSelectTextStartNewGame.length);
			unknown7E9C9F[17] = 0;
			unknown7EB49E[i] = 0;
			x1C = 0x100;
		}
	}
	unknownC1180D(1, 0, 0);
	for (short i = 0; i < 3; i++) {
		loadGameSlot(i);
		if (gameState.favouriteThing[1] != 0) {
			memcpy(&unknown7E9C9F[0], &fileSelectTextLevel[0], fileSelectTextLevel.length);
			unknown7E9C9F[6] = 0;
			moveCurrentTextCursor(9, i);
			printString(0x20, &unknown7E9C9F[0]);
			const levelCharsPrinted = unknownC10D7C(partyCharacters[0].level);
			unknown7E9C9F[0] = (levelCharsPrinted == 1) ? ebChar(' ') : (cast(ubyte)(unknown7E895A[7 - levelCharsPrinted] + ebChar('0')));
			unknown7E9C9F[1] = cast(ubyte)(unknown7E895A[6] + ebChar('0'));
			unknown7E9C9F[2] = 0;
			moveCurrentTextCursor(13, i);
			printString(0x20, &unknown7E9C9F[0]);
			memcpy(&unknown7E9C9F[0], &fileSelectTextTextSpeed[0], fileSelectTextTextSpeed.length);
			unknown7E9C9F[11] = ebChar(' ');
			version(configurable) {
				const ubyte nameOffset = !config.instantSpeedText;
			} else {
				enum nameOffset = 0;
			}
			memcpy(&unknown7E9C9F[12], &fileSelectTextTextSpeedStrings[gameState.textSpeed + nameOffset - 1][0], fileSelectTextTextSpeedStrings[gameState.textSpeed + nameOffset - 1].length);
			moveCurrentTextCursor(16, i);
			printString(0x20, &unknown7E9C9F[0]);
		}
	}
	if (arg1 != 0) {
		MenuOpt* x1C_2 = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		for (short i = cast(short)(currentSaveSlot - 1); i != 0; i--) {
			x1C_2 = &menuOptions[x1C_2.next];
		}
		windowSetTextColor(6);
		moveCurrentTextCursor(cast(short)(x1C_2.textX + 1), x1C_2.textY);
		unknown7E5E6E = 0;
		unknownC43B15();
		windowSetTextColor(0);
	} else {
		corruptionCheck();
		while (unknown7E0028.a != 0) { waitForInterrupt(); }
		changeMusic(Music.setupScreen);
		unknownC11F5A(&unknownC1ECD1);
		currentSaveSlot = cast(ubyte)selectionMenu(0);
		unknownC11F8A();
	}
	loadGameSlot(cast(short)(currentSaveSlot - 1));
	return currentSaveSlot;
}

/// $C1F07E
short unknownC1F07E() {
	createWindowN(Window.fileSelectMenu);
	unknownC1153B(1, 0, 0, &fileSelectTextContinue[0], null);
	for (short i = 0; 3 > i; i++) {
		if (currentSaveSlot -1 == i) {
			continue;
		}
		if (unknown7EB49E[i] != 0) {
			continue;
		}
		unknownC1153B(2, 6, 0, &fileSelectTextCopy[0], null);
	}
	unknownC1153B(3, 10, 0, &fileSelectTextDelete[0], null);
	unknownC1153B(4, 15, 0, &fileSelectTextSetUp[0], null);
	printMenuItems();
	unknown7E5E6E = 0xFF;
	return selectionMenu(1);
}

/// $C3F090
immutable ubyte[8][4] psiCategories = [
	ebString!8("Offense"),
	ebString!8("Defense"),
	ebString!8("Assist"),
	ebString!8("Other"),
];

/// $C3F0B0
immutable short[7][7] unknownC3F0B0 = [
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
short unknownC1F14F() {
	short y;
	for (short i = 0; 3 > i; i++) {
		if (unknown7EB49E[i] == 0) {
			y++;
		}
	}
	if (y == 1) {
		createWindowN(Window.fileSelectCopyMenuOneFile);
		setInstantPrinting();
		printString(fileSelectTextCopyToWhere.length, &fileSelectTextCopyToWhere[0]);
		for (short i = 0; 3 > i; i++) {
			if (unknown7EB49E[i] == 0) {
				unknown7E9C9F[0] = cast(ubyte)(ebChar('1') + i);
				unknown7E9C9F[1] = ebChar(':');
				unknown7E9C9F[2] = 0;
				unknownC1153B(cast(short)(i + 1), 0, 1, &unknown7E9C9F[0], null);
			}
		}
	} else {
		createWindowN(Window.fileSelectCopyMenuTwoFiles);
		setInstantPrinting();
		printString(fileSelectTextCopyToWhere.length, &fileSelectTextCopyToWhere[0]);
		short x04 = 1;
		for (short i = 0; 3 > i; i++) {
			if (unknown7EB49E[i] == 0) {
				unknown7E9C9F[0] = cast(ubyte)(ebChar('1') + i);
				unknown7E9C9F[1] = ebChar(':');
				unknown7E9C9F[2] = 0;
				unknownC1153B(cast(short)(i + 1), 0, x04++, &unknown7E9C9F[0], null);
			}
		}
	}
	printMenuItems();
	short x16 = selectionMenu(1);
	if (x16 != 0) {
		copySaveSlot(cast(short)(x16 - 1), cast(short)(currentSaveSlot - 1));
	}
	unknown7E5E6E = 0;
	closeFocusWindowN();
	return x16;
}

/// $C1F2A8
short unknownC1F2A8() {
	createWindowN(Window.fileSelectDeleteConfirmation);
	setInstantPrinting();
	setCurrentWindowPadding(0);
	moveCurrentTextCursor(0, 0);
	printString(fileSelectTextAreYouSureDelete.length, &fileSelectTextAreYouSureDelete[0]);
	unknownC43D75(0, 1);
	moveCurrentTextCursor(0, 1);
	printNumber(currentSaveSlot);
	printLetter(ebChar(':'));
	moveCurrentTextCursor(2, 1);
	unknownC1931B(1);
	moveCurrentTextCursor(8, 1);
	printString(fileSelectTextLevel.length, &fileSelectTextLevel[0]);
	moveCurrentTextCursor(12, 1);
	printNumber(partyCharacters[0].level);
	unknownC1153B(0, 0, 2, &fileSelectTextAreYouSureDeleteNo[0], null);
	unknownC1153B(1, 0, 3, &fileSelectTextAreYouSureDeleteYes[0], null);
	printMenuItems();
	short x16 = selectionMenu(1);
	if (x16 != 0) {
		eraseSaveSlot(currentSaveSlot - 1);
	}
	unknown7E5E6E = 0;
	closeFocusWindowN();
	return x16;
}

/// $C1F3C2
void openTextSpeedMenu() {
	createWindowN(Window.fileSelectTextSpeed);
	setInstantPrinting();
	printString(fileSelectTextSelectTextSpeed.length, &fileSelectTextSelectTextSpeed[0]);
	version(configurable) {
		const ubyte nameOffset = !config.instantSpeedText;
	} else {
		enum nameOffset = 0;
	}
	unknownC114B1(0, 1, &fileSelectTextTextSpeedStrings[0 + nameOffset][0], null);
	unknownC114B1(0, 2, &fileSelectTextTextSpeedStrings[1 + nameOffset][0], null);
	unknownC114B1(0, 3, &fileSelectTextTextSpeedStrings[2 + nameOffset][0], null);
	version(configurable) {
		if (config.instantSpeedText) {
			unknownC114B1(0, 4, &fileSelectTextTextSpeedStrings[3][0], null);
		}
	}
	unknownC11887(gameState.textSpeed != 0 ? gameState.textSpeed - 1 : 1);
}

/// $C1F497
short unknownC1F497(short arg1) {
	short x12;
	currentFocusWindow = Window.fileSelectTextSpeed;
	setInstantPrinting();
	if (arg1 != 0) {
		openTextSpeedMenu();
		MenuOpt* x14 = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		for (short i = cast(short)(gameState.textSpeed - 1); i != 0; i--) {
			x14 = &menuOptions[menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption].next];
		}
		windowSetTextColor(6);
		moveCurrentTextCursor(cast(short)(x14.textX + 1), x14.textY);
		unknownC43BB9(0xFFFF, 1, &x14.label[0]);
		windowSetTextColor(0);
		x12 = gameState.textSpeed;
	} else {
		unknown7E5E6E = 0;
		x12 = selectionMenu(1);
		if (x12 != 0) {
			gameState.textSpeed = cast(ubyte)x12;
			saveGameSlot(cast(short)(currentSaveSlot - 1));
		}
	}
	return x12;
}

/// $C1F568
void openSoundMenu() {
	createWindowN(Window.fileSelectMusicMode);
	setInstantPrinting();
	printString(fileSelectTextSelectSoundSetting.length, &fileSelectTextSelectSoundSetting[0]);
	unknownC114B1(0, 1, &fileSelectTextSoundSettingStrings[0][0], null);
	unknownC114B1(0, 2, &fileSelectTextSoundSettingStrings[1][0], null);
	unknownC11887(gameState.soundSetting != 0 ? gameState.soundSetting - 1 : 0);
}

/// $C1F616
short unknownC1F616(short arg1) {
	short x12;
	currentFocusWindow = Window.fileSelectMusicMode;
	setInstantPrinting();
	if (arg1 != 0) {
		openSoundMenu();
		MenuOpt* x14 = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		for (short i = gameState.soundSetting; i != 0; i--) {
			x14 = &menuOptions[menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption].next];
		}
		windowSetTextColor(6);
		moveCurrentTextCursor(cast(short)(x14.textX + 1), x14.textY);
		unknownC43BB9(0xFFFF, 1, &x14.label[0]);
		windowSetTextColor(0);
		x12 = gameState.soundSetting;
	} else {
		x12 = selectionMenu(1);
		if (x12 != 0) {
			gameState.soundSetting = cast(ubyte)x12;
		}
		saveGameSlot(cast(short)(currentSaveSlot - 1));
	}
	return x12;
}

/// $C1F6E3
short openFlavourMenu() {
	createWindowN(Window.fileSelectFlavourChoice);
	setInstantPrinting();
	printString(fileSelectTextWhichStyle.length, &fileSelectTextWhichStyle[0]);
	unknownC114B1(0, 2, &fileSelectTextFlavorPlain[0], null);
	unknownC114B1(0, 3, &fileSelectTextFlavorMint[0], null);
	unknownC114B1(0, 4, &fileSelectTextFlavorStrawberry[0], null);
	unknownC114B1(0, 5, &fileSelectTextFlavorBanana[0], null);
	unknownC114B1(0, 6, &fileSelectTextFlavorPeanut[0], null);
	version(bugfix) {
		if (gameState.textFlavour == 0) {
			gameState.textFlavour = 1;
		}
	}
	unknownC11887(gameState.textFlavour - 1);
	unknownC11F5A(&unknownC1EC8F);
	short x16 = selectionMenu(1);
	if (x16 != 0) {
		gameState.textFlavour = cast(ubyte)x16;
	} else {
		unknownC1EC8F((gameState.textFlavour != 0) ? gameState.textFlavour : 1);
	}
	saveGameSlot(currentSaveSlot - 1);
	return x16;
}

/// $C1F805
void fileMenuLoop() {
	if (!config.autoLoadFile.isNull) {
		currentSaveSlot = cast(ubyte)(config.autoLoadFile.get + 1);
		loadGameSlot(config.autoLoadFile.get);
		if (gameState.favouriteThing[1] != 0) {
			unknownC064D4();
			reloadHotspots();
			respawnX = gameState.leaderX.integer;
			respawnY = gameState.leaderY.integer;
		} else {
			gameState.textSpeed = 1;
			foreach (idx, ref character; partyCharacters) {
				character.name = dontCareNames[idx][0][0 .. character.name.length];
			}
			gameState.petName = dontCareNames[4][0];
			gameState.favouriteFood = dontCareNames[5][0];
			gameState.favouriteThing[4 .. 10] = dontCareNames[6][0];
			unknownC021E6();
			for (short i = 0; 4 > i; i++) {
				resetCharLevelOne(cast(short)(i + 1), initialStats[i].level, 0);
				if (initialStats[i].exp != 0) {
					gainEXP(cast(short)(i + 1), 0, initialStats[i].exp);
				}
				partyCharacters[i].hp.target = partyCharacters[i].hp.current.integer = partyCharacters[i].maxHP;
				partyCharacters[i].pp.target = partyCharacters[i].pp.current.integer = partyCharacters[i].maxPP;
				partyCharacters[i].pp.current.fraction = 0;
				partyCharacters[i].hp.current.fraction = 0;
				memset(&partyCharacters[i].items[0], 0, PartyCharacter.items.length);
				memcpy(&partyCharacters[i].items[0], &initialStats[i].items[0], PartyCharacter.items.length);
				partyCharacters[i].hpPPWindowOptions = 0x400;
			}
			gameState.moneyCarried = initialStats[0].money;
			setLeaderLocation(initialStats[0].unknown0, initialStats[0].unknown2);
			gameState.favouriteThing[0] = ebChar('P');
			gameState.favouriteThing[1] = ebChar('S');
			gameState.favouriteThing[2] = ebChar('I');
			gameState.favouriteThing[3] = ebChar(' ');
			for (short i = 4; gameState.favouriteThing.length - 1 > i; i++) {
				if (gameState.favouriteThing[i] == 0) {
					gameState.favouriteThing[i] = ebChar(' ');
					break;
				}
			}
			gameState.unknownC3 = 1;
			respawnX = gameState.leaderX.integer;
			respawnY = gameState.leaderY.integer;
			unknownC064D4();
			setLeaderLocation(0x840, 0x6E8);
			unknownC46881(getTextBlock("textFileSelectScreen1"));
			setEventFlag(EventFlag.sysMonsterOff, 1);
			showNPCFlag = 1;
		}
	} else {
		outermost: while (true) {
			setInstantPrinting();
			const fileMenuResult = fileSelectMenu(0);
			if ((fileMenuResult == 0) || (unknown7EB49E[fileMenuResult - 1] != 0)) {
				ValidFileSelected:
				switch (unknownC1F07E()) {
					case 0: //B pressed
						closeFocusWindow();
						continue;
					case 1: //Start Game
						unknownC064D4();
						reloadHotspots();
						respawnX = gameState.leaderX.integer;
						respawnY = gameState.leaderY.integer;
						break outermost;
					case 2: //Copy
						if (unknownC1F14F() == 0) {
							goto ValidFileSelected;
						}
						break;
					case 3: //Delete
						if (unknownC1F2A8() == 0) {
							goto ValidFileSelected;
						}
						break;
					case 4: //Setup
						openTextSpeedMenu();
						while (true) {
							if (unknownC1F497(0) == 0) {
								closeWindow(Window.fileSelectTextSpeed);
								goto ValidFileSelected;
							}
							openSoundMenu();
							while (true) {
								if (unknownC1F616(0) == 0) {
									closeWindow(Window.fileSelectMusicMode);
									break;
								}
								if (openFlavourMenu() == 0) {
									closeWindow(Window.fileSelectFlavourChoice);
								}
							}
						}
						break;
					default: break;
				}
				closeAllWindows();
			} else {
				openTextSpeedMenu();
				while (true) {
					if (unknownC1F497(0) == 0) {
						closeWindow(Window.fileSelectTextSpeed);
						break;
					}
					openSoundMenu();
					while (true) {
						if (unknownC1F616(0) == 0) {
							closeWindow(Window.fileSelectMusicMode);
							break;
						}
						Unknown16:
						if (openFlavourMenu() == 0) {
							closeWindow(Window.fileSelectFlavourChoice);
						} else {
							changeMusic(Music.namingScreen);
							nameLoop: while (true) {
								closeAllWindows();
								short x20;
								for (short i = 0; 7 > i; unknownC4D830(i), i += x20) {
									if (i == -1) {
										closeAllWindows();
										fileSelectMenu(1);
										unknownC1F497(1);
										unknownC1F616(1);
										changeMusic(Music.setupScreen);
										goto Unknown16;
									}
									displayAnimatedNamingSprite(i);
									if (i < ThingsToName.dog) {
										if (nameACharacter(PartyCharacter.name.length, &partyCharacters[i].name[0], i, &fileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
											x20 = -1;
											continue;
										}
										x20 = 1;
										continue;
									}
									if (i == ThingsToName.dog) {
										if (nameACharacter(gameState.petName.length, &gameState.petName[0], i, &fileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
											x20 = -1;
											continue;
										}
										x20 = 1;
										continue;
									}
									if (i == ThingsToName.favoriteFood) {
										if (nameACharacter(gameState.favouriteFood.length, &gameState.favouriteFood[0], i, &fileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
											x20 = -1;
											continue;
										}
										x20 = 1;
										continue;
									}
									if (i == ThingsToName.favoriteThing) {
										if (nameACharacter(gameState.favouriteThing.length, &gameState.favouriteThing[4], i, &fileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
											x20 = -1;
											continue;
										}
										x20 = 1;
										continue;
									}
								}
								closeAllWindows();
								setInstantPrinting();
								for (short i = 0; 4 > i; i++, unknownC1931B(i)) {
									createWindowN(cast(short)(Window.fileSelectNamingConfirmationNess + i));
								}
								createWindowN(Window.fileSelectNamingConfirmationKing);
								unknownC1931B(7);
								createWindowN(Window.fileSelectNamingConfirmationFood);
								printString(fileSelectTextFavoriteFood.length, &fileSelectTextFavoriteFood[0]);
								short x = unknownC44FF3(cast(short)strlen(cast(char*)&gameState.favouriteFood[0]), 0, &gameState.favouriteFood[0]);
								moveCurrentTextCursor(cast(short)(windowStats[windowTable[Window.fileSelectNamingConfirmationFood]].width - (((x % 8) != 0) || ((x / 8) == 6) ? ((x / 8) + 1) : (x / 8))), 1);
								printString(cast(short)strlen(cast(char*)&gameState.favouriteFood[0]), &gameState.favouriteFood[0]);

								createWindowN(Window.fileSelectNamingConfirmationThing);
								printString(fileSelectTextCoolestThing.length, &fileSelectTextCoolestThing[0]);
								x = unknownC44FF3(cast(short)strlen(cast(char*)&gameState.favouriteThing[4]), 0, &gameState.favouriteThing[4]);
								moveCurrentTextCursor(cast(short)(windowStats[windowTable[Window.fileSelectNamingConfirmationThing]].width - (((x % 8) != 0) || ((x / 8) == 6) ? ((x / 8) + 1) : (x / 8))), 1);
								printString(cast(short)strlen(cast(char*)&gameState.favouriteThing[4]), &gameState.favouriteThing[4]);

								createWindowN(Window.fileSelectNamingConfirmationMessage);
								printString(fileSelectTextAreYouSure.length, &fileSelectTextAreYouSure[0]);

								unknownC1153B(1, 14, 0, &fileSelectTextAreYouSureYep[0], null);
								unknownC1153B(0, 18, 0, &fileSelectTextAreYouSureNope[0], null);
								printMenuItems();
								unknownC4D8FA();
								unknown7E5E6E = 0xFF;
								if (selectionMenu(1) == 0) {
									unknownC021E6();
									continue nameLoop;
								}
								changeMusic(Music.nameConfirmation);
								windowTick();
								for (short i = 0; 180 > i; i++) {
									unknownC1004E();
								}
								unknownC021E6();
								for (short i = 0; 4 > i; i++) {
									resetCharLevelOne(cast(short)(i + 1), initialStats[i].level, 0);
									if (initialStats[i].exp != 0) {
										gainEXP(cast(short)(i + 1), 0, initialStats[i].exp);
									}
									partyCharacters[i].hp.target = partyCharacters[i].hp.current.integer = partyCharacters[i].maxHP;
									partyCharacters[i].pp.target = partyCharacters[i].pp.current.integer = partyCharacters[i].maxPP;
									partyCharacters[i].pp.current.fraction = 0;
									partyCharacters[i].hp.current.fraction = 0;
									memset(&partyCharacters[i].items[0], 0, PartyCharacter.items.length);
									memcpy(&partyCharacters[i].items[0], &initialStats[i].items[0], PartyCharacter.items.length);
									partyCharacters[i].hpPPWindowOptions = 0x400;
								}
								gameState.moneyCarried = initialStats[0].money;
								setLeaderLocation(initialStats[0].unknown0, initialStats[0].unknown2);
								gameState.favouriteThing[0] = ebChar('P');
								gameState.favouriteThing[1] = ebChar('S');
								gameState.favouriteThing[2] = ebChar('I');
								gameState.favouriteThing[3] = ebChar(' ');
								for (short i = 4; gameState.favouriteThing.length - 1 > i; i++) {
									if (gameState.favouriteThing[i] == 0) {
										gameState.favouriteThing[i] = ebChar(' ');
										break;
									}
								}
								gameState.unknownC3 = 1;
								respawnX = gameState.leaderX.integer;
								respawnY = gameState.leaderY.integer;
								unknownC064D4();
								setLeaderLocation(0x840, 0x6E8);
								unknownC46881(getTextBlock("textFileSelectScreen1"));
								setEventFlag(EventFlag.sysMonsterOff, 1);
								showNPCFlag = 1;
								break outermost;
							}
						}
					}
				}
			}
		}
	}
	closeAllWindows();
	unknown7E9627 = unknownC3FB1F[gameState.textSpeed - 1];
	selectedTextSpeed = cast(ushort)(gameState.textSpeed - 1);
	unknown7E964B = (gameState.textSpeed == 3) ? 0 : 30;
	unknown7E5DBA = 0;
	displayText(getTextBlock("textFileSelectScreen2"));
}

/// $C1FF2C
short unknownC1FF2C() {
	short result;
	ubyte xX = 0;
	version(bugfix) {
		if (chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]] == null){
			return 1;
		}
	}
	switch(chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0]) {
		case 1:
		case 2:
			xX = 1;
			goto default;
		default:
			result = 0;
			if (xX != unknown7EB4A2) {
				result = 1;
			}
			break;
	}
	unknown7EB4A2 = xX;
	return result;
}

/// $C1FF6B
short unknownC1FF6B() {
	unknown7E5E6E = 0;
	unknown7EB49D = 1;
	fileMenuLoop();
	clearInstantPrinting();
	windowTick();
	unknown7EB4B6 = 0;
	unknown7EB4A2 = 0;
	unknown7E5E6E = 0xFF;
	unknown7EB49D = 0;
	return 0;
}

/// $C1FF99
void unknownC1FF99(short arg1, short arg2, ubyte* arg3) {
	vwfX = cast(ushort)((arg2 *8 - unknownC43E31(arg3, arg1)) / 2);
	vwfTile = vwfX / 8;
}

short sramCheckRoutineChecksum(short, ref const(ubyte)*) {
	return 0;
}
