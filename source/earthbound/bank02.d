/// mostly battle code
module earthbound.bank02;

import earthbound.commondefs;
import earthbound.hardware;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.text;
import earthbound.bank0A;
import earthbound.bank0B;
import earthbound.bank0C;
import earthbound.bank0E;
import earthbound.bank10;
import earthbound.bank15;
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.globals;

import core.stdc.string;
import std.logger;

/// $C20000
void inflictSunstrokeCheck() {
	if (overworldStatusSuppression) {
		return;
	}
	if ((gameState.troddenTileType & 0xC) != 4) {
		return;
	}
	for (short i = 0 ; i < 6; i++) {
		if (gameState.partyMemberIndex[i] == 0) {
			return;
		}
		if (gameState.partyMemberIndex[i] > 4) {
			return;
		}
		currentPartyMemberTick = chosenFourPtrs[gameState.playerControlledPartyMembers[i]];
		if (currentPartyMemberTick.afflictions[0] != 0 && currentPartyMemberTick.afflictions[0] == Status0.cold) {
			continue;
		}
		if (((30 - currentPartyMemberTick.guts > 0) ? (30 - currentPartyMemberTick.guts) : 1) * 256 / 100 < rand()) {
			currentPartyMemberTick.afflictions[0] = Status0.sunstroke;
		}
	}
}

/// $C200B9
immutable short[6] collisionTestCoordDiffsX = [-8, 0, 7, -8, 0, 7];

/// $C200C5
immutable short[6] collisionTestCoordDiffsY = [0, 0, 0, 7, 7, 7];

/// $C200D1
immutable ushort[4] unknownC200D1 = [0b011110, 0b110011, 0b011110, 0b110011];

/// $C200D9
void initializeTextSystem() {
	renderHPPPWindows = 0;
	currentFlashingEnemyRow = -1;
	currentFlashingEnemy = -1;
	currentFlashingRow = -1;
	unread7E89CC = -1;
	battleMenuCurrentCharacterID = -1;
	instantPrinting = 0;
	redrawAllWindows = 0;
	actionscriptState = ActionScriptState.running;
	uploadHPPPMeterTiles = 0;
	windowHead = -1;
	windowTail = -1;
	for (short i = 0; i != 8; i++) {
		windowStats[i].windowID = -1;
	}
	for (short i = 0; i != 0x35; i++) {
		windowTable[i] = -1;
	}
	for (short i = 0; i != 5; i++) {
		titledWindows[i] = -1;
	}
	paginationWindow = Window.invalid;
	paginationAnimationFrame = -1;
	for (short i = 0x380; i != 0; i--) {
		bg2Buffer[0x380 - i] = 0;
	}
	for (short i = 0; i != menuOptions.length; i++) {
		menuOptions[i].type = MenuOptionType.available;
	}
	for (short i = 0; i < 8; i++) {
		for (short j = 0; j < 0x20; j++) {
			unread7E9D23[j][i] = 0xFF;
		}
	}
	unread7E9E29 = 0;
	unused7E9E27 = 0;
	vwfTile = 0;
	vwfX = 0;
	blinkingTriangleFlag = 0;
	textSoundMode = TextSoundMode.unknown1;
	battleModeFlag = 0;
	textPromptWaitingForInput = 0;
	currentFocusWindow = -1;
	characterPadding = 1;
	initializeUsedBG2TileMap();
	unread7E9651 = 0xFF;
	enableWordWrap = 0xFF;
	extraTickOnWindowClose = 0;
	vwfIndentNewLine = 0;
	// uhhhhh
	//menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption].pixelAlign = 0;

	forceLeftTextAlignment = 0;
	newTextPixelOffset = 0;
	lastTextPixelOffsetSet = 0;
	forceCentreTextAlignment = 0;
	lastPrintedCharacter = 0;
	printTargetArticle = 0;
	printAttackerArticle = 0;
	forceNormalFontForLengthCalculation = 0;
	skipAddingCommandText = 0;
}

/// $C20266
void drawAutoFightIcon() {
	for (short i = 0; i < 4; i++) {
		bg2Buffer[0x23A + i] = autoBattleArrangement[i];
	}
}

/// $C20293
void clearAutoFightIcon() {
	for (short i = 0; i < 4; i++) {
		bg2Buffer[0x23A + i] = 0;
	}
}

/// $C202AC
void unknownC202AC(short arg1) {
	if (windowStats[windowTable[arg1]].titleID == 0) {
		short i;
		for (i = 0; i != 5; i++) {
			if (titledWindows[i] == -1) {
				goto Unknown2;
			}
		}
		return;
		Unknown2:
		titledWindows[i] = windowTable[arg1];
		windowStats[windowTable[arg1]].titleID = cast(ubyte)(i + 1);
	}
	renderSmallTextToVRAM(&windowStats[windowTable[arg1]].title[0], cast(ushort)(0x7700 + (windowStats[windowTable[arg1]].titleID - 1) * 128));
}

/// $C2032B
void setWindowTitle(short arg1, short arg2, const(ubyte)* arg3) {
	ubyte* y = &windowStats[windowTable[arg1]].title[0];
	while ((*arg3 != 0) && (arg2-- != 0)) {
		*(y++) = *(arg3++);
	}
	*y = 0;
	unknownC202AC(arg1);
}

/// $C2038B
void unknownC2038B() {
	copyToVRAMAlt(0, 0x700, 0x7C00, cast(ubyte*)&bg2Buffer[0]);
	copyToVRAM(0, 0x40, 0x7F80, &blankTiles[0]);
}

/// $C203C3
void drawHPPPWindow(short id) {
	PartyCharacter* character = &partyCharacters[gameState.partyMembers[id] - 1];
	short x22 = unknownC223D9(&character.afflictions[0], 1);
	short x04 = unknownC223D9(&character.afflictions[0], 1);
	short x20 = cast(short)((x22 & 0xFFF0) + x04);
	ushort x1E = character.hpPPWindowOptions;
	ushort x18;
	ushort x1A;
	ushort namePalette;
	if (x1E == 0xC00) {
		namePalette = 3 << 10;
		x22 = 3 << 10;
		x1A = 2 << 10;
	} else {
		namePalette = cast(short)(getStatusNamePalette(&character.afflictions[0]) << 10);
		x22 = 4 << 10;
		x1A = 0 << 10;
	}
	if (battleMenuCurrentCharacterID == id) {
		x18 = 18;
	} else {
		x18 = 19;
	}
	ushort* dest = &bg2Buffer[16 - (gameState.playerControlledPartyMemberCount * 7) / 2 + (id * 7) + x18 * 32];
	dest[0] = cast(ushort)(x1E + 4 + TilemapFlag.priority);
	dest++;
	for (short i = 5; i != 0; i--) {
		dest[0] = cast(ushort)(x1E + 5 + TilemapFlag.priority);
		dest++;
	}
	dest[0] = cast(ushort)(x1E + 0x6004);
	dest++;
	dest += 25;

	(dest++)[0] = cast(ushort)(x1E + 6 + TilemapFlag.priority);
	short x14 = (gameState.partyMembers[id] - 1) * 4 + 0x2A0 + TilemapFlag.priority;
	short x12 = cast(short)((strlen(cast(char*)&character.name[0]) * 6 + 9) / 8);
	for (short i = 0; i != 4; i++) {
		if (x12 != 0) {
			dest[0] = cast(ushort)(x14 + namePalette);
			dest++;
			x14++;
			x12--;
		} else {
			dest[0] = cast(ushort)(namePalette + 7 + TilemapFlag.priority);
			dest++;
		}
	}
	dest[0] = cast(ushort)(namePalette + x20 + TilemapFlag.priority);
	dest++;
	dest[0] = cast(ushort)(x1E + 0x4006 + TilemapFlag.priority);
	dest++;
	dest += 25;

	dest[0] = cast(ushort)(x1E + 6 + TilemapFlag.priority);
	dest++;
	x14 = ((gameState.partyMembers[id] - 1) * 4) + 0x2B0 + TilemapFlag.priority;
	x12 = cast(short)((strlen(cast(char*)&character.name[0]) * 6 + 9) / 8);
	for (short i =0 ; i != 4; i++) {
		if (x12 != 0) {
			dest[0] = cast(ushort)(x14 + namePalette);
			dest++;
			x14++;
			x12--;
		} else {
			dest[0] = cast(ushort)(namePalette + 23 + TilemapFlag.priority);
			dest++;
		}
	}
	dest[0] = cast(ushort)(namePalette + x20 + 16 + TilemapFlag.priority);
	dest++;
	dest[0] = cast(ushort)(x1E + 0x4006 + TilemapFlag.priority);
	dest++;
	dest+= 25;

	fillCharacterHPTileBuffer(id, character.hp.current.integer, character.hp.current.fraction);
	const(ubyte)* x06 = &unknownC3E3F8[0];
	ushort* y = &hpPPWindowBuffer[id][0];
	for (short i = 2; i != 0; i--) {
		dest[0] = cast(ushort)(x1E + 6 + TilemapFlag.priority);
		dest++;
		for (short j = 2;j != 0; j--) {
			dest[0] = cast(ushort)(x06[0] + x22 + TilemapFlag.priority);
			x06++;
			dest++;
		}
		for (short j = 3; j != 0; j--) {
			dest[0] = cast(ushort)(y[0] + x1A);
			y++;
			dest++;
		}
		dest[0] = cast(ushort)(x1E + 0x4006 + TilemapFlag.priority);
		dest++;
		dest += 25;
	}

	fillCharacterPPTileBuffer(id, &character.afflictions[0], character.pp.current.integer, character.pp.current.fraction);
	y = &hpPPWindowBuffer[id][6];
	for (short i = 2; i != 0; i--) {
		dest[0] = cast(ushort)(x1E + 6 + TilemapFlag.priority);
		dest++;
		for (short j = 2; j != 0; j--) {
			dest[0] = cast(ushort)(x06[0] + x22 + TilemapFlag.priority);
			x06++;
			dest++;
		}
		for (short j = 3; j != 0; j--) {
			dest[0] = cast(ushort)(y[0] + x1A);
			y++;
			dest++;
		}
		dest[0] = cast(ushort)(x1E + 0x4006 + TilemapFlag.priority);
		dest++;
		dest += 25;
	}
	dest[0] = cast(ushort)(x1E + 0x8004 + TilemapFlag.priority);
	dest++;
	for (short i = 5; i != 0; i--) {
		dest[0] = cast(ushort)(x1E + 0x8005 + TilemapFlag.priority);
		dest++;
	}
	dest[0] = cast(ushort)(x1E + 0xC004 + TilemapFlag.priority);
}

/// $C2077D
void drawHPPPWindows() {
	ushort x10 = currentlyDrawnHPPPWindows;
	for (short i = 0; i != gameState.playerControlledPartyMemberCount; i++) {
		if ((x10 & 1) != 0) {
			drawHPPPWindow(i);
		}
		x10 >>= 1;
	}
}

/// $C207B6
void unknownC207B6(short arg1) {
	currentlyDrawnHPPPWindows |= (1 << arg1);
	drawHPPPWindow(arg1);
	hpPPMeterAreaNeedsUpdate = 1;
}

/// $C207E1
void undrawHPPPWindow(short arg1) {
	hpPPMeterAreaNeedsUpdate = 1;
	currentlyDrawnHPPPWindows &= cast(short)(0xFFFF ^ (1 << arg1));
	short x0E;
	if (arg1 == battleMenuCurrentCharacterID) {
		x0E = 18;
	} else {
		x0E = 19;
	}
	ushort* x = &bg2Buffer[(x0E * 32) + (16 - ((gameState.playerControlledPartyMemberCount * hpPPWindowWidth) / 2) + (arg1 * hpPPWindowWidth))];
	for (short i = hpPPWindowHeight; i != 0; i--) {
		for (short j = hpPPWindowWidth; j != 0; j--) {
			(x++)[0] = 0;
		}
		x += 32 - hpPPWindowWidth;
	}
}

/// $C2087C
void drawOpenWindows() {
	if (renderHPPPWindows != 0) {
		drawHPPPWindows();
	}
	if (windowHead == -1) {
		return;
	}
	short x0E = windowHead;
	do {
		drawWindow(x0E);
		x0E = windowStats[x0E].next;
	} while(x0E != -1);
}

/// $C208B8
short unknownC208B8(short arg1, short arg2) {
	short a = windowStats[windowTable[currentFocusWindow]].tilemapBuffer[(windowStats[windowTable[currentFocusWindow]].width * arg2 * 2) + arg1];
	if (((a & 0x3FF) == 0x4F) || (a & 0x3FF) == 0x41) {
		return 0x2F;
	}
	return 0x40;
}

/// $C20912
immutable ubyte[14][5] nameEntryGridCharacterOffsetTable = [
	[0x05, 0x07, 0x09, 0x0B, 0x0D, 0x0F, 0x11, 0x13, 0x15, 0xFF, 0xFF, 0x1B, 0x1D, 0xFF],
	[0x23, 0x25, 0x27, 0x29, 0x2B, 0x2D, 0x2F, 0x31, 0x33, 0xFF, 0xFF, 0x39, 0x3B, 0xFF],
	[0x41, 0x43, 0x45, 0x47, 0x49, 0x4B, 0x4D, 0x4F, 0x51, 0xFF, 0xFF, 0x57, 0x59, 0xFF],
	[0x5F, 0x61, 0x63, 0x65, 0x67, 0x69, 0x6B, 0x6D, 0x6F, 0x71, 0xFF, 0x77, 0x79, 0xFF],
	[0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F, 0x81, 0xFF],
];

/// $C20958
immutable ushort[32] reservedBG2TileMap = [
	0b1111111111111111,
	0b1111111111111111,
	0b1111111111111111,
	0b1111111111111111,
	0b1000111111111111,
	0b1000000000011111,
	0b0000001111111111,
	0b0000001111111111,
	0b0000000000000001,
	0b0000000000000001,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
];

immutable ubyte[4][2] thethe = [
	ebString!4("The "),
	ebString!4("the "),
];

/// $C20A20
void backupCurrentWindowTextAttributes(WindowTextAttributesCopy* buf) {
	buf.id = currentFocusWindow;
	if (currentFocusWindow == -1) {
		return;
	}
	buf.textX = windowStats[windowTable[currentFocusWindow]].textX;
	buf.textY = windowStats[windowTable[currentFocusWindow]].textY;
	buf.numberPadding = windowStats[windowTable[currentFocusWindow]].numPadding;
	buf.currTileAttributes = windowStats[windowTable[currentFocusWindow]].tileAttributes;
	buf.font = windowStats[windowTable[currentFocusWindow]].font;
}

/// $C20ABC
void restoreCurrentWindowTextAttributes(WindowTextAttributesCopy* buf) {
	if (buf.id == -1) {
		return;
	}
	if (windowTable[buf.id] == -1) {
		return;
	}
	currentFocusWindow = buf.id;
	windowStats[windowTable[currentFocusWindow]].textX = buf.textX;
	windowStats[windowTable[currentFocusWindow]].textY = buf.textY;
	windowStats[windowTable[currentFocusWindow]].numPadding = buf.numberPadding;
	windowStats[windowTable[currentFocusWindow]].tileAttributes = buf.currTileAttributes;
	windowStats[windowTable[currentFocusWindow]].font = buf.font;
}

/// $C20B65 - Similar to $C118E7, but doesn't wrap around window edges (arguments unknown)
short moveCursor(short curX, short curY, short deltaX, short deltaY, short sfx) {
	ushort x0E = curY;
	ushort x02 = curX;
	if (deltaX != 0) {
		for (x0E = cast(short)(curY + deltaX); x0E < windowStats[windowTable[currentFocusWindow]].height / 2; x0E += deltaX) {
			if (unknownC208B8(curX, x0E) == 0x2F) {
				goto Unknown27;
			}
		}
		for (x0E = cast(short)(curY + deltaX); x0E < windowStats[windowTable[currentFocusWindow]].height / 2; x0E += deltaX) {
			for (x02 = cast(short)(curX - 1); x02 < windowStats[windowTable[currentFocusWindow]].width; x02--) {
				if (unknownC208B8(x02, x0E) == 0x2F) {
					goto Unknown27;
				}
			}
		}
		for (x0E = cast(short)(curY + deltaX); x0E < windowStats[windowTable[currentFocusWindow]].height / 2; x0E += deltaX) {
			for (x02 = cast(short)(curX + 1); x02 < windowStats[windowTable[currentFocusWindow]].width; x02++) {
				if (unknownC208B8(x02, x0E) == 0x2F) {
					goto Unknown27;
				}
			}
		}
		return -1;
	} else {
		for (x02 = cast(short)(curX + deltaY); x02 < windowStats[windowTable[currentFocusWindow]].width; x02 += deltaY) {
			if (unknownC208B8(x02, x0E) == 0x2F) {
				goto Unknown27;
			}
		}
		for (x02 = cast(short)(curX + deltaY); x02 < windowStats[windowTable[currentFocusWindow]].width; x02 += deltaY) {
			for (x0E = cast(short)(curY - 1); x0E < windowStats[windowTable[currentFocusWindow]].height / 2; x0E--) {
				if (unknownC208B8(x02, x0E) == 0x2F) {
					goto Unknown27;
				}
			}
		}
		for (x02 = cast(short)(curX + deltaY); x02 < windowStats[windowTable[currentFocusWindow]].width; x02 += deltaY) {
			for (x0E = cast(short)(curY + 1); x0E < windowStats[windowTable[currentFocusWindow]].height / 2; x0E++) {
				if (unknownC208B8(x02, x0E) == 0x2F) {
					goto Unknown27;
				}
			}
		}
		return -1;
	}
	Unknown27:
	if (sfx != -1) {
		playSfx(sfx);
	}
	return cast(short)(((x0E << 8) & 0xFF00) + x02);
}

/// $C20D3F
void separateDecimalDigits(short arg1) {
	ubyte* x = &hpPPWindowDigitBuffer[2];
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
void fillHPPPTileBufferX(short arg1) {
	ushort* x = &hpPPWindowBuffer[arg1][6];
	for (short i = 0; i < 3; i++) {
		x[0] = cast(ushort)(i + 0x264C);
		x[3] = cast(ushort)(i + 0x265C);
		x++;
	}
}
/// $C20DC5
void fillHPPPTileBuffer(short arg1, short arg2, short fraction) {
	ushort y = cast(ushort)(((fraction >= 0x3000) ? (fraction - 0x3000) : 0) / 0x3400);
	ushort* x = &hpPPWindowBuffer[arg1][arg2 * 6 + 3 - 1];

	//100s digit
	x[0] = cast(ushort)(((hpPPWindowDigitBuffer[2] >> 2) * 16) + (hpPPWindowDigitBuffer[2] * 4) + y + 0x2600);
	x[3] = cast(ushort)(x[0] + 0x10);
	x--;

	//10s digit
	if ((hpPPWindowDigitBuffer[2] != 9) || (y == 0)) {
		y = 0;
	}
	x[0] = cast(ushort)(((hpPPWindowDigitBuffer[1] >> 2) * 16) + (hpPPWindowDigitBuffer[1] * 4) + y + (((hpPPWindowDigitBuffer[1] != 0) || (hpPPWindowDigitBuffer[0] != 0)) ? 0x200 : 0x248) + 0x2400);
	x[3] = cast(ushort)(x[0] + 0x10);
	x--;

	//1s digit
	if ((hpPPWindowDigitBuffer[1] != 9) || (y == 0)) {
		y = 0;
	}
	x[0] = cast(ushort)(((hpPPWindowDigitBuffer[0] >> 2) * 16) + (hpPPWindowDigitBuffer[0] * 4) + y + ((hpPPWindowDigitBuffer[0] != 0) ? 0x200 : 0x248) + 0x2400);
	x[3] = cast(ushort)(x[0] + 0x10);
}

/// $C20F08
void fillCharacterHPTileBuffer(short arg1, short integer, short fraction) {
	separateDecimalDigits(integer);
	fillHPPPTileBuffer(arg1, 0, fraction);
}

/// $C20F26
void fillCharacterPPTileBuffer(short arg1, ubyte* afflictions, short integer, short fraction) {
	if (afflictions[4] != 0) {
		fillHPPPTileBufferX(arg1);
		return;
	}
	separateDecimalDigits(integer);
	fillHPPPTileBuffer(arg1, 1, fraction);
}

/// $C20F58
uint getHPPPMeterSpeed() {
	if (halfHPMeterSpeed != 0) {
		return hpMeterSpeed >> 1;
	} else {
		return hpMeterSpeed;
	}
}

/// $C20F9A
void resetRolling() {
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if ((partyCharacters[gameState.partyMembers[i] - 1].afflictions[0] != Status0.unconscious) && (partyCharacters[gameState.partyMembers[i] - 1].hp.current.integer == 0)) {
			partyCharacters[gameState.partyMembers[i] - 1].hp.target = 1;
		}
		if ((partyCharacters[gameState.partyMembers[i] - 1].hp.current.fraction != 0) && (partyCharacters[gameState.partyMembers[i] - 1].hp.current.integer > partyCharacters[gameState.partyMembers[i] - 1].hp.target)) {
			partyCharacters[gameState.partyMembers[i] - 1].hp.target = partyCharacters[gameState.partyMembers[i] - 1].hp.current.integer;
		}
		if ((partyCharacters[gameState.partyMembers[i] - 1].pp.current.fraction != 0) && (partyCharacters[gameState.partyMembers[i] - 1].pp.current.integer > partyCharacters[gameState.partyMembers[i] - 1].pp.target)) {
			partyCharacters[gameState.partyMembers[i] - 1].pp.target = partyCharacters[gameState.partyMembers[i] - 1].pp.current.integer;
		}
	}
	fastestHPMeterSpeed = 1;
}

/// $C21034
short unknownC21034() {
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if ((partyCharacters[gameState.partyMembers[i] - 1].hp.current.fraction != 0)
			|| (partyCharacters[gameState.partyMembers[i] - 1].pp.current.fraction != 0)
			|| (partyCharacters[gameState.partyMembers[i] - 1].hp.current.integer != partyCharacters[gameState.partyMembers[i] - 1].hp.target)
			|| (partyCharacters[gameState.partyMembers[i] - 1].pp.current.integer != partyCharacters[gameState.partyMembers[i] - 1].pp.target)) {
			return 0;
		}
	}
	return 1;
}

/// $C2108C
short unknownC2108C() {
	short a = unknownC21034();
	if (a != 0) {
		fastestHPMeterSpeed = 0;
	}
	return a;
}

/// $C2109F
void hpPPRoller() {
	if (disableHPPPRolling != 0) {
		return;
	}
	if (gameState.partyMembers[frameCounter & 3] == 0) {
		return;
	}
	if (gameState.partyMembers[frameCounter & 3] > 4) {
		return;
	}
	PartyCharacter* x10 = &partyCharacters[gameState.partyMembers[frameCounter & 3] - 1];
	if ((hpPPMeterFlipoutMode != 0) || ((x10.hp.current.fraction & 1) != 0)) {
		if (x10.hp.current.integer < x10.hp.target) {
			x10.hp.current.combined += ((fastestHPMeterSpeed == 0) && (hpPPMeterFlipoutMode != 0)) ? 0x64000 : getHPPPMeterSpeed();
			if (x10.hp.current.integer >= x10.hp.target) {
				x10.hp.current.integer = x10.hp.target;
				x10.hp.current.fraction = 1;
			}
		} else if ((x10.hp.current.integer == x10.hp.target) && (x10.hp.current.fraction == 1)) {
			x10.hp.current.fraction = 0;
		} else {
			x10.hp.current.combined -= (hpPPMeterFlipoutMode != 0) ? 0x64000 : getHPPPMeterSpeed();
			if ((x10.hp.current.integer < x10.hp.target) || (x10.hp.current.integer > 0x1000)) {
				x10.hp.current.integer = x10.hp.target;
				x10.hp.current.fraction = 1;
			}
		}
	} else if (x10.hp.current.integer != x10.hp.target) {
		x10.hp.current.fraction = 1;
	}
	if ((hpPPMeterFlipoutMode != 0) || ((x10.pp.current.fraction & 1) != 0)) {
		if (x10.pp.current.integer < x10.pp.target) {
			x10.pp.current.combined += (hpPPMeterFlipoutMode != 0) ? 0x64000 : 0x19000;
			if (x10.pp.current.integer >= x10.pp.target) {
				x10.pp.current.integer = x10.pp.target;
				x10.hp.current.fraction = 1;
			}
		} else if ((x10.pp.current.integer == x10.pp.target) && (x10.pp.current.fraction == 1)) {
			x10.pp.current.fraction = 0;
		} else {
			x10.pp.current.combined -= (hpPPMeterFlipoutMode != 0) ? 0x64000 : 0x19000;
			if ((x10.pp.current.integer < x10.pp.target) || (x10.pp.current.integer > 0x1000)) {
				x10.pp.current.integer = x10.pp.target;
				x10.pp.current.fraction = 1;
			}
		}
	} else if (x10.pp.current.integer != x10.pp.target) {
		x10.pp.current.fraction = 1;
	}
	if (hpPPMeterFlipoutMode == 0) {
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
void updateHPPPMeterTiles() {
	if (renderHPPPWindows == 0) {
		return;
	}
	if (gameState.partyMembers[frameCounter & 3] == 0) {
		return;
	}
	if (gameState.partyMembers[frameCounter & 3] > 4) {
		return;
	}
	if ((currentlyDrawnHPPPWindows >> (frameCounter & 3) & 1) == 0) {
		return;
	}
	short x1C = 16 - (gameState.playerControlledPartyMemberCount * 7 )/ 2 + ((battleMenuCurrentCharacterID == (frameCounter & 3)) ? 18 : 19) * 32 + 96 + 3 + ((frameCounter & 3) * 7);
	ushort* x1A = &bg2Buffer[x1C];
	//x1C = 0x7C00[x1C];
	if ((partyCharacters[gameState.partyMembers[frameCounter & 3] - 1].hp.current.fraction & 1) != 0) {
		fillCharacterHPTileBuffer(frameCounter & 3, partyCharacters[gameState.partyMembers[frameCounter & 3] - 1].hp.current.integer, partyCharacters[gameState.partyMembers[frameCounter & 3] - 1].hp.current.fraction);
		if (uploadHPPPMeterTiles == 0) {
			copyToVRAMAlt(0, 6, cast(ushort)(0x7C00 + x1C), cast(ubyte*)&hpPPWindowBuffer[frameCounter & 3][0]);
			copyToVRAMAlt(0, 6, cast(ushort)(0x7C20 + x1C), cast(ubyte*)&hpPPWindowBuffer[frameCounter & 3][3]);
		}
		ushort* y = &hpPPWindowBuffer[frameCounter & 3][0];
		for (short i = 0; i != 3; i++) {
			(x1A++)[0] = (y++)[0];
		}
		ushort* x1E = x1A + 29;
		for (short i = 0; i != 3; i++) {
			(x1E++)[0] = (y++)[0];
		}
		x1A = x1E + 29;
	} else {
		x1A += 64;
	}
	if ((partyCharacters[gameState.partyMembers[frameCounter & 3] - 1].pp.current.fraction & 1) != 0) {
		fillCharacterPPTileBuffer(frameCounter & 3, &partyCharacters[gameState.partyMembers[frameCounter & 3] - 1].afflictions[0], partyCharacters[gameState.partyMembers[frameCounter & 3] - 1].pp.current.integer, partyCharacters[gameState.partyMembers[frameCounter & 3] - 1].pp.current.fraction);
		if (uploadHPPPMeterTiles == 0) {
			copyToVRAMAlt(0, 6, cast(ushort)(0x7C40 + x1C), cast(ubyte*)&hpPPWindowBuffer[frameCounter & 3][6]);
			copyToVRAMAlt(0, 6, cast(ushort)(0x7C60 + x1C), cast(ubyte*)&hpPPWindowBuffer[frameCounter & 3][9]);
		}
		ushort* x12 = &hpPPWindowBuffer[frameCounter & 3][6];
		for (short i = 0; i != 3; i++) {
			(x1A++)[0] = (x12++)[0];
		}
		ushort* y = x1A + 29;
		for (short i = 0; i != 3; i++) {
			(y++)[0] = (x12++)[0];
		}
	}
	if (uploadHPPPMeterTiles != 0) {
		uploadHPPPMeterTiles = 0;
	}
}

/// $C21628
short getEventFlag(short flag) {
	flag--;
	if ((powersOfTwo8Bit[flag % 8] & eventFlags[flag / 8]) != 0) {
		return 1;
	}
	return 0;
}

/// $C2165E
short setEventFlag(short flag, short value) {
	debug(printTextTrace) tracef("Setting event flag %s: %s", cast(EventFlag)flag, value);
	flag--;
	if (value == 1) {
		eventFlags[flag / 8] |= powersOfTwo8Bit[flag % 8];
	} else {
		eventFlags[flag / 8] &= (powersOfTwo8Bit[flag % 8] ^ 0xFF);
	}
	return eventFlags[flag / 8];
}

/// $C216AD
void unknownC216AD(short arg1, short) {
	changeMusic(arg1);
	currentMapMusicTrack = arg1;
	nextMapMusicTrack = arg1;
}

/// $C216C9
void stopMusicF(short arg1) {
	stopMusic();
}

/// $C216D0
void playSfxAndTickMinimal(short arg1) {
	playSfx(arg1);
	windowTickMinimal();
}

/// $C216DB
void unknownC216DB() {
	ubyte x18 = 0;
	for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
		PartyCharacter* x15 = &partyCharacters[gameState.partyMembers[i]];
		for (short j = 0; (j < 14) && (x15.items[j] != 0); j++) {
			if (itemData[x15.items[j]].type != 4) {
				continue;
			}
			if ((x18 == 0) || (itemData[x18].parameters.ep > itemData[x15.items[j]].parameters.ep)) {
				x18 = x15.items[j];
			}
		}
	}
	if (x18 != 0) {
		if (unknownC2239D(itemData[x18].parameters.strength) != 0) {
			return;
		}
		removeCharFromParty(PartyMember.teddyBear);
		removeCharFromParty(PartyMember.plushTeddyBear);
		addCharToParty(itemData[x18].parameters.strength);
	} else {
		removeCharFromParty(PartyMember.teddyBear);
		removeCharFromParty(PartyMember.plushTeddyBear);
	}
}

/// $C21857
void recalcCharacterPostmathOffense(short id) {
	short total = partyCharacters[id - 1].baseOffense;
	if (partyCharacters[id - 1].equipment[EquipmentSlot.weapon] != 0) {
		total += itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.weapon] - 1]].parameters.raw[((id - 1) == 3) ? 1 : 0];
	}
	if (0 >= total) {
		total = 0;
	} else if (total > 0xFF) {
		total = 0xFF;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	partyCharacters[id - 1].offense = cast(ubyte)total;
}

/// $C2192B
void recalcCharacterPostmathDefense(short id) {
	short total = partyCharacters[id - 1].baseDefense;
	if (partyCharacters[id - 1].equipment[EquipmentSlot.body] != 0) {
		total += itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.body] - 1]].parameters.raw[((id - 1) == 3) ? 1 : 0];
	}
	if (partyCharacters[id - 1].equipment[EquipmentSlot.arms] != 0) {
		total += itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.arms] - 1]].parameters.raw[((id - 1) == 3) ? 1 : 0];
	}
	if (partyCharacters[id - 1].equipment[EquipmentSlot.other] != 0) {
		total += itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.other] - 1]].parameters.raw[((id - 1) == 3) ? 1 : 0];
	}
	if (0 >= total) {
		total = 0;
	} else if (total > 0xFF) {
		total = 0xFF;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	partyCharacters[id - 1].defense = cast(ubyte)total;
}

/// $C21AEB
void recalcCharacterPostmathSpeed(short id) {
	short total = partyCharacters[id - 1].baseSpeed;
	if (partyCharacters[id - 1].equipment[EquipmentSlot.body] != 0) {
		total += itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.body] - 1]].parameters.ep;
	}
	total += partyCharacters[id - 1].boostedSpeed;
	if (0 >= total) {
		total = 0;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	partyCharacters[id - 1].speed = cast(ubyte)total;
}

/// $C21BA4
void recalcCharacterPostmathGuts(short id) {
	short total = partyCharacters[id - 1].baseGuts;
	if (partyCharacters[id - 1].equipment[EquipmentSlot.weapon] != 0) {
		total += itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.weapon] - 1]].parameters.ep;
	}
	total += partyCharacters[id - 1].boostedGuts;
	if (0 >= total) {
		total = 0;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	partyCharacters[id - 1].guts = cast(ubyte)total;
}

/// $C21C5D
void recalcCharacterPostmathLuck(short id) {
	short total = partyCharacters[id - 1].baseLuck;
	if (partyCharacters[id - 1].equipment[EquipmentSlot.arms] != 0) {
		total += itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.arms] - 1]].parameters.ep;
	}
	if (partyCharacters[id - 1].equipment[EquipmentSlot.other] != 0) {
		total += itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.other] - 1]].parameters.ep;
	}
	total += partyCharacters[id - 1].boostedLuck;
	if (0 >= total) {
		total = 0;
	} else { //why would they explicitly do this...?
		total = (total & 0xFF);
	}
	partyCharacters[id - 1].luck = cast(ubyte)total;
}

/// $C21D65
void recalcCharacterPostmathVitality(short id) {
	partyCharacters[id - 1].vitality = cast(ubyte)(partyCharacters[id - 1].baseVitality + partyCharacters[id - 1].boostedVitality);
}

/// $C21D7D
void recalcCharacterPostmathIQ(short id) {
	partyCharacters[id - 1].iq = cast(ubyte)(partyCharacters[id - 1].baseIQ + partyCharacters[id - 1].boostedIQ);
}

/// $C21D7D
void recalcCharacterMissRate(short id) {
	partyCharacters[id - 1].missRate = cast(ubyte)((partyCharacters[id - 1].equipment[EquipmentSlot.weapon] != 0) ? itemData[partyCharacters[id - 1].equipment[EquipmentSlot.weapon] - 1].parameters.special : 0);
}

/// $C21E03
void calcResistances(short id) {
	short total;
	total += (partyCharacters[id - 1].equipment[EquipmentSlot.body] != 0) ? itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.body] - 1]].parameters.special & 3 : 0;
	total += (partyCharacters[id - 1].equipment[EquipmentSlot.other] != 0) ? itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.other] - 1]].parameters.special & 3 : 0;
	if (total >= 3) {
		total = 3;
	}
	partyCharacters[id - 1].fireResist = cast(ubyte)total;

	total = (partyCharacters[id - 1].equipment[EquipmentSlot.body] != 0) ? itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.body] - 1]].parameters.special & 0xC : 0;
	total += (partyCharacters[id - 1].equipment[EquipmentSlot.other] != 0) ? itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.other] - 1]].parameters.special & 0xC : 0;
	total >>= 2;
	if (total >= 3) {
		total = 3;
	}
	partyCharacters[id - 1].freezeResist = cast(ubyte)total;

	total = (partyCharacters[id - 1].equipment[EquipmentSlot.body] != 0) ? itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.body] - 1]].parameters.special & 0x30 : 0;
	total += (partyCharacters[id - 1].equipment[EquipmentSlot.other] != 0) ? itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.other] - 1]].parameters.special & 0x30 : 0;
	total >>= 4;
	if (total >= 3) {
		total = 3;
	}
	partyCharacters[id - 1].flashResist = cast(ubyte)total;

	total = (partyCharacters[id - 1].equipment[EquipmentSlot.body] != 0) ? itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.body] - 1]].parameters.special & 0xC0 : 0;
	total += (partyCharacters[id - 1].equipment[EquipmentSlot.other] != 0) ? itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.other] - 1]].parameters.special & 0xC0 : 0;
	total >>= 6;
	if (total >= 3) {
		total = 3;
	}
	partyCharacters[id - 1].paralysisResist = cast(ubyte)total;

	total = (partyCharacters[id - 1].equipment[EquipmentSlot.arms] != 0) ? itemData[partyCharacters[id - 1].items[partyCharacters[id - 1].equipment[EquipmentSlot.arms] - 1]].parameters.special : 0;
	partyCharacters[id - 1].hypnosisBrainshockResist = cast(ubyte)total;
}

/// $C22214
int increaseWalletBalance(int arg1) {
	gameState.moneyCarried = (gameState.moneyCarried + arg1 > 99_999) ? 99_999 : gameState.moneyCarried + arg1;
	return gameState.moneyCarried;
}

/// $C22272
short decreaseWalletBalance(int arg1) {
	if (0 > gameState.moneyCarried - arg1) {
		return 1;
	}
	gameState.moneyCarried -= arg1;
	return 0;
}

/// $C222D3
const(ubyte)* getPartyCharacterName(short arg1) {
	if (arg1 > PartyMember.poo) {
		if (arg1 == PartyMember.king) {
			return &gameState.petName[0];
		}
		return &enemyConfigurationTable[npcAITable[arg1].enemyID].name[0];
	}
	return &partyCharacters[arg1 - 1].name[0];
}

/// $C22351
short getInventoryCount(short character) {
	character--;
	short x0E;
	for (x0E = 0; (14 > x0E) && (partyCharacters[character].items[x0E] != 0); x0E++) {}
	return x0E;
}

/// $C2239D
short unknownC2239D(short id) {
	for (short i = 0; i < gameState.partyCount; i++) {
		if (gameState.partyMembers[i] == id) {
			return id;
		}
	}
	return 0;
}

/// $C223D9
short unknownC223D9(ubyte* arg1, short arg2) {
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
				return TextTile.windowBackground;
			} else {
				return TextTile.checker;
			}
		}
	}
	lx:
	if (arg2 != 0) {
		return statusIconsCheckered[x0E][arg1[x0E] - 1];
	} else {
		return statusIcons[x0E][arg1[x0E] - 1];
	}
}

/** Gets the name palette for a given status array
 * Original_Address: $(DOLLAR)C22474
 */
short getStatusNamePalette(ubyte* afflictions) {
	short firstFoundGroup;
	if (afflictions[0] != 0) { // status group 0 takes priority
		firstFoundGroup = 0;
	} else if (afflictions[3] != 0) { // status group 3 is next-highest priority
		firstFoundGroup = 3;
	} else {
		for (firstFoundGroup = 1; firstFoundGroup < 7; firstFoundGroup++) {
			if (afflictions[firstFoundGroup] != 0) {
				goto found;
			}
		}
		return 4; // no statuses found
	}
	found:
	return statusNamePalettes[firstFoundGroup][afflictions[firstFoundGroup] - 1];
}

/// $C224E1
short getItemSubtype(short arg1) {
	switch (itemData[arg1].type & 0xC) {
		case 0:
			return 1;
		case 4:
			return 2;
		case 8:
			return 3;
		case 0xC:
			return 4;
		default: break;
	}
	return 0;
}

/// $C22524
short getItemSubtype2(short arg1) {
	switch (itemData[arg1].type & 0xC) {
		case 0:
		case 0xC: return 1;
		case 0x4: return 2;
		case 0x8: return 3;
		default: return 0;
	}
}

/// $C22562
void unknownC22562(short arg1) {
	temporaryWeapon = cast(ubyte)((arg1 == -1) ? 0 : arg1);
	temporaryBodyGear = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.body];
	temporaryArmsGear = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.arms];
	temporaryOtherGear = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.other];
	printEquipmentStats(characterForEquipMenu);
}

/// $C225AC
void unknownC225AC(short arg1) {
	temporaryWeapon = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.weapon];
	temporaryBodyGear = cast(ubyte)((arg1 == -1) ? 0 : arg1);
	temporaryArmsGear = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.arms];
	temporaryOtherGear = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.other];
	printEquipmentStats(characterForEquipMenu);
}

/// $C2260D
void unknownC2260D(short arg1) {
	temporaryWeapon = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.weapon];
	temporaryBodyGear = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.body];
	temporaryArmsGear = cast(ubyte)((arg1 == -1) ? 0 : arg1);
	temporaryOtherGear = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.other];
	printEquipmentStats(characterForEquipMenu);
}

/// $C22673
void unknownC22673(short arg1) {
	temporaryWeapon = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.weapon];
	temporaryBodyGear = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.body];
	temporaryArmsGear = partyCharacters[characterForEquipMenu - 1].equipment[EquipmentSlot.arms];
	temporaryOtherGear = cast(ubyte)((arg1 == -1) ? 0 : arg1);
	printEquipmentStats(characterForEquipMenu);
}

/** Sets the state of the current interacting gift box.
 * Params:
 * 	state = 0 for closed, 1 for open
 * Returns: State of the flag and its 7 neighbours
 * Original_Address: $(DOLLAR)C226C5
 */
short setGiftBoxState(short state) {
	short result = setEventFlag(currentInteractingEventFlag, state);
	updateGiftBoxState(interactingNPCEntity);
	return result;
}

/** Gets the state of the event flag associated with the active NPC
 * Returns: 0 if clear, 1 if set
 * Original_Address: $(DOLLAR)C226E6
 */
short getActiveNPCFlagState() {
	return getEventFlag(currentInteractingEventFlag);
}

/// $C226F0
ushort getActivePartyCharacterCount() {
	ushort i;
	for (i = 0; (i < gameState.playerControlledPartyMemberCount) && (partyCharacters[gameState.partyMemberIndex[i] - 1].afflictions[0] == 0); i++) {}
	return i;
}

/// $C2272F
short unknownC2272F() {
	short x10 = 0;
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if ((partyCharacters[gameState.partyMemberIndex[i] - 1].afflictions[0] != Status0.unconscious) && (partyCharacters[gameState.partyMemberIndex[i] - 1].afflictions[0] != Status0.diamondized)) {
			x10++;
		}
	}
	return x10;
}

/// $C227C8
void learnSpecialPSI(short id) {
	switch (id) {
		case 1:
			gameState.partyPSI |= PartyPSIFlags.teleportAlpha;
			break;
		case 2:
			gameState.partyPSI |= PartyPSIFlags.starstormAlpha;
			break;
		case 3:
			gameState.partyPSI |= PartyPSIFlags.starstormBeta;
			break;
		case 4:
			gameState.partyPSI |= PartyPSIFlags.teleportBeta;
			break;
		default: break;
	}
}

/** Deposits money into your bank account
 * Returns: amount of money successfully deposited
 * Original_Address: $(DOLLAR)C2281D
 */
uint depositIntoATM(uint amount) {
	uint x0A = gameState.bankBalance + amount;
	uint x06 = 9999999;
	if (x0A <= x06) {
		x06 = x0A;
	}
	gameState.bankBalance = x06;
	return amount - (x0A - gameState.bankBalance);
}

/// $C228B7 - Withdraws money from your bank account
void withdrawFromATM(uint amount) {
	if (gameState.bankBalance >= amount) {
		gameState.bankBalance -= amount;
	}
}

/// $C228F8
void addCharToParty(short id) {
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
		entityCallbackFlags[unknownC0369B(id)] |= (EntityCallbackFlags.tickDisabled | EntityCallbackFlags.moveDisabled);
		if (id <= 4) {
			unknownC216DB();
			unknownC3EBCA();
		}
		return;
	}
}

/// $C229BB
void removeCharFromParty(short id) {
	for (short i = 0; gameState.partyCount > i; i++) {
		if (gameState.partyMembers[i] != id) {
			continue;
		}
		version(bugfix) { // vanilla game has an off-by-one error here, but it normally goes unnoticed
			enum limit = gameState.partyMembers.length - 1;
		} else {
			enum limit = gameState.partyMembers.length;
		}
		while (i < limit) {
			gameState.partyMembers[i] = gameState.partyMembers[i + 1];
			i++;
		}
		i--;
		gameState.partyMembers[i] = 0;
		unknownC03903(id);
		if (id <= 4) {
			unknownC216DB();
			unknownC3EBCA();
		}
		return;
	}
}

/// $C22A2C
void saveCurrentGame() {
	saveGameSlot(currentSaveSlot - 1);
}

/// $C22A3A
void unknownC22A3A(short arg1, short arg2, short arg3) {
	arg2--;
	short x17 = partyCharacters[arg2].items[arg3 - 1];
	short x15;
	for (x15 = arg3; (x15 < 14) && (partyCharacters[arg2].items[x15] != 0); x15++) {
		partyCharacters[arg2].items[x15 - 1] = partyCharacters[arg2].items[x15];
	}
	partyCharacters[arg2].items[x15 - 1] = 0;
	giveItemToCharacter(arg1, cast(ubyte)x17);
	short x13 = cast(short)(arg2 + 1);
	ubyte x0E;
	if (arg1 == x13) {
		x0E = partyCharacters[arg2].equipment[EquipmentSlot.weapon];
		x17 = x0E;
		if (arg3 == x17) {
			partyCharacters[arg2].equipment[EquipmentSlot.weapon] = cast(ubyte)getInventoryCount(arg1);
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.body];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.body] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.arms];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.arms] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.other];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.other] = cast(ubyte)(x0E - 1);
			}
		} else if (arg3 == partyCharacters[arg2].equipment[EquipmentSlot.body]) {
			partyCharacters[arg2].equipment[EquipmentSlot.body] = cast(ubyte)getInventoryCount(arg1);
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.weapon];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.weapon] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.arms];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.arms] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.other];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.other] = cast(ubyte)(x0E - 1);
			}
		} else if (arg3 == partyCharacters[arg2].equipment[EquipmentSlot.arms]) {
			partyCharacters[arg2].equipment[EquipmentSlot.arms] = cast(ubyte)getInventoryCount(arg1);
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.weapon];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.weapon] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.body];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.body] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.other];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.other] = cast(ubyte)(x0E - 1);
			}
		} else if (arg3 == partyCharacters[arg2].equipment[EquipmentSlot.other]) {
			partyCharacters[arg2].equipment[EquipmentSlot.other] = cast(ubyte)getInventoryCount(arg1);
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.weapon];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.weapon] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.body];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.body] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.arms];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.arms] = cast(ubyte)(x0E - 1);
			}
		} else {
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.weapon] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.body];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.body] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.arms];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.arms] = cast(ubyte)(x0E - 1);
			}
			x0E = partyCharacters[arg2].equipment[EquipmentSlot.other];
			if (arg3 < x0E) {
				partyCharacters[arg2].equipment[EquipmentSlot.other] = cast(ubyte)(x0E - 1);
			}
		}
	} else {
		if (arg3 == partyCharacters[arg2].equipment[EquipmentSlot.weapon]) {
			changeEquippedWeapon(x13, 0);
		} else if (arg3 == partyCharacters[arg2].equipment[EquipmentSlot.body]) {
			changeEquippedBody(x13, 0);
		} else if (arg3 == partyCharacters[arg2].equipment[EquipmentSlot.arms]) {
			changeEquippedArms(x13, 0);
		} else if (arg3 == partyCharacters[arg2].equipment[EquipmentSlot.other]) {
			changeEquippedOther(x13, 0);
		}
		x0E = partyCharacters[arg2].equipment[EquipmentSlot.weapon];
		if (arg3 < x0E) {
			partyCharacters[arg2].equipment[EquipmentSlot.weapon] = cast(ubyte)(x0E - 1);
		}
		x0E = partyCharacters[arg2].equipment[EquipmentSlot.body];
		if (arg3 < x0E) {
			partyCharacters[arg2].equipment[EquipmentSlot.body] = cast(ubyte)(x0E - 1);
		}
		x0E = partyCharacters[arg2].equipment[EquipmentSlot.arms];
		if (arg3 < x0E) {
			partyCharacters[arg2].equipment[EquipmentSlot.arms] = cast(ubyte)(x0E - 1);
		}
		x0E = partyCharacters[arg2].equipment[EquipmentSlot.other];
		if (arg3 < x0E) {
			partyCharacters[arg2].equipment[EquipmentSlot.other] = cast(ubyte)(x0E - 1);
		}
	}
}

/// $C22F38
short initBattleScripted(short arg1) {
	currentBattleGroup = arg1;
	const(BattleGroupEnemy)* x06 = &battleEntryPointerTable[arg1].enemies[0];
	enemiesInBattle = 0;
	while (x06.count != 0xFF) {
		short x0E = x06.count;
		while (x0E-- != 0) {
			enemiesInBattleIDs[enemiesInBattle++] = x06.enemyID;
		}
		x06++;
	}
	battleMode = BattleMode.inBattle;
	battleSwirlSequence();
	while (unknownC2E9C8() != 0) {
		waitUntilNextFrame();
		updateSwirlFrame();
	}
	short battleResult = initBattleCommon();
	if (psiTeleportDestination == 0) {
		if (battleResult != BattleResult.won) {
			return 1;
		}
		reloadMap();
		fadeIn(1, 1);
	} else {
		teleportMainLoop();
		if (battleResult != BattleResult.won) {
			return 1;
		}
		unknownC3EE4D();
		if (currentBattleGroup < 0x1C0) {
			playerIntangibilityFrames = 120;
		}
	}
	return 0;
}

/** Backs up and removes party NPCs and money carried
 * Original_Address: $(DOLLAR)C23008
 */
void backupClearPartyNPCsMoney() {
	gameState.partyNPC1Copy = gameState.partyNPCs[0];
	gameState.partyNPC1HPCopy = gameState.partyNPCHP[0];
	gameState.partyNPC2Copy = gameState.partyNPCs[1];
	gameState.partyNPC2HPCopy = gameState.partyNPCHP[1];
	removeCharFromParty(gameState.partyNPCs[1]);
	removeCharFromParty(gameState.partyNPCs[0]);
	gameState.walletBackup = gameState.moneyCarried;
	gameState.moneyCarried = 0;
}

/** Restores the party NPCs and carried money from the backup
 * Original_Address: $(DOLLAR)C2307B
 */
void restorePartyBackup() {
	removeCharFromParty(gameState.partyNPCs[0]);
	removeCharFromParty(gameState.partyNPCs[1]);
	if (gameState.partyNPC1Copy != 0) {
		gameState.partyNPCs[0] = gameState.partyNPC1Copy;
		addCharToParty(gameState.partyNPC1Copy);
		gameState.partyNPCHP[0] = gameState.partyNPC1HPCopy;
		if (gameState.partyNPC2Copy != 0) {
			gameState.partyNPCs[1] = gameState.partyNPC2Copy;
			addCharToParty(gameState.partyNPC2Copy);
			gameState.partyNPCHP[1] = gameState.partyNPC2HPCopy;
		}
	}
	gameState.moneyCarried = gameState.walletBackup;
}

/// $C230F3
void setTeleportBoxDestination(short arg1) {
	gameState.unknownC3 = cast(ubyte)arg1;
	respawnX = gameState.leaderX.integer;
	respawnY = gameState.leaderY.integer;
}

/// $C23109
immutable ConsolationPrize[2] consolationItemTable = [
	ConsolationPrize(EnemyID.cuteLilUFO, [ItemID.cookie, ItemID.bagOfFries, ItemID.hamburger, ItemID.boiledEgg, ItemID.freshEgg, ItemID.picnicLunch, ItemID.pizza, 0]),
	ConsolationPrize(EnemyID.beautifulUFO, [ItemID.canOfFruitJuice, ItemID.royalIcedTea, ItemID.proteinDrink, ItemID.krakenSoup, ItemID.bottleOfWater, ItemID.coldRemedy, ItemID.vialOfSerum, 0]),
];

/// $C2311B
short battleSelectionMenu(short partyMemberID, short partyMemberOrder) {
	short x24 = 0;
	short x20;
	unknownC2FEF9(0);
	PartyCharacter* character = &partyCharacters[partyMemberID - 1];
	if ((character.afflictions[0] == Status0.paralyzed) || (character.afflictions[2] == Status2.immobilized)) {
		x20 = 2;
	}
	short a = character.equipment[EquipmentSlot.weapon];
	if (a != 0) {
		a = character.items[a];
	}
	if ((a != 0) && ((itemData[a].type & 3) == 1)) {
		x20 = 1;
	} else {
		x20 = 0;
	}
	if (gameState.autoFightEnable != 0) {
		if ((character.afflictions[4] == 0) && (character.afflictions[3] != Status3.strange) && (character.afflictions[1] != Status1.mushroomized) && ((partyMemberID == PartyMember.ness) || (partyMemberID == PartyMember.poo))) {
			battleMenuSelection.targetting = Targetted.allies | Targetted.single;
			battleMenuSelection.param1 = 26;
			battleMenuSelection.selectedAction = BattleActions.psiLifeupOmega;
			if ((checkIfPSIKnown(partyMemberID, 26) != 0) && (battleActionTable[BattleActions.psiLifeupOmega].ppCost <= character.pp.target) && (countChars(BattleSide.friends) >= 2)) {
					for (short i = 0; i < 6; i++) {
						if (gameState.partyMembers[i] < 1) {
							continue;
						}
						if (gameState.partyMembers[i] > 4) {
							continue;
						}
						if (partyCharacters[gameState.partyMembers[i]].maxHP / 4 <= partyCharacters[gameState.partyMembers[i]].hp.target) {
							goto Unknown15;
						}
					}
					battleMenuSelection.targetting = Targetted.allies | Targetted.all;
					goto Unknown21;

					Unknown15:
			}
			battleMenuSelection.param1 = 25;
			battleMenuSelection.selectedAction = BattleActions.psiLifeupGamma;
			if ((checkIfPSIKnown(partyMemberID, 25) != 0) && (battleActionTable[BattleActions.psiLifeupGamma].ppCost <= character.pp.target)) {
				battleMenuSelection.selectedTarget = cast(ubyte)autoLifeup();
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
			}
			battleMenuSelection.param1 = 24;
			battleMenuSelection.selectedAction = BattleActions.psiLifeupBeta;
			if ((checkIfPSIKnown(partyMemberID, 24) != 0) && (battleActionTable[BattleActions.psiLifeupBeta].ppCost <= character.pp.target)) {
				battleMenuSelection.selectedTarget = cast(ubyte)autoLifeup();
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
			}
			battleMenuSelection.param1 = 23;
			battleMenuSelection.selectedAction = BattleActions.psiLifeupAlpha;
			if ((checkIfPSIKnown(partyMemberID, 23) != 0) && (battleActionTable[BattleActions.psiLifeupAlpha].ppCost <= character.pp.target)) {
				battleMenuSelection.selectedTarget = cast(ubyte)autoLifeup();
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
			}
			goto Unknown22;

			Unknown21:
			battleMenuSelection.user = cast(ubyte)partyMemberID;
			return battleMenuSelection.selectedAction;

			Unknown22:
			battleMenuSelection.param1 = 30;
			battleMenuSelection.selectedAction = BattleActions.psiHealingOmega;
			if ((checkIfPSIKnown(partyMemberID, 30) != 0) && (battleActionTable[BattleActions.psiHealingOmega].ppCost <= character.pp.target)) {
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(0, Status0.unconscious);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
			}
			battleMenuSelection.param1 = 29;
			battleMenuSelection.selectedAction = BattleActions.psiHealingGamma;
			if ((checkIfPSIKnown(partyMemberID, 29) != 0) && (battleActionTable[BattleActions.psiHealingGamma].ppCost <= character.pp.target)) {
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(0, Status0.paralyzed);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(0, Status0.diamondized);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(0, Status0.unconscious);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
			}
			battleMenuSelection.param1 = 28;
			battleMenuSelection.selectedAction = BattleActions.psiHealingBeta;
			if ((checkIfPSIKnown(partyMemberID, 28) != 0) && (battleActionTable[BattleActions.psiHealingBeta].ppCost <= character.pp.target)) {
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(0, Status0.poisoned);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(0, Status0.nauseous);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(2, Status2.crying);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(3, Status3.strange);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
			}
			battleMenuSelection.param1 = 27;
			battleMenuSelection.selectedAction = BattleActions.psiHealingAlpha;
			if ((checkIfPSIKnown(partyMemberID, 27) != 0) && (battleActionTable[BattleActions.psiHealingAlpha].ppCost <= character.pp.target)) {
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(0, Status0.cold);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(0, Status0.sunstroke);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
				battleMenuSelection.selectedTarget = cast(ubyte)autoHealing(2, Status2.asleep);
				if (battleMenuSelection.selectedTarget != 0) {
					goto Unknown21;
				}
			}
		}
		short x1A;
		switch (x20) {
			case 0:
				x1A = BattleActions.bash;
				break;
			case 1:
				x1A = BattleActions.shoot;
				break;
			case 2:
				return BattleActions.useNoEffect;
			default: break;
		}
		battleMenuSelection.user = cast(ubyte)partyMemberID;
		battleMenuSelection.param1 = 0;
		battleMenuSelection.selectedAction = x1A;
		battleMenuSelection.targetting = Targetted.enemies | Targetted.single;
		battleMenuSelection.selectedTarget = cast(ubyte)(randLimit(cast(short)(numBattlersInFrontRow + numBattlersInBackRow)) + 1);
		return x1A;
	}
	enableHalfHPMeterSpeed();
	short x1A;
	if ((partyMemberID == PartyMember.paula) || (partyMemberID == PartyMember.poo)) {
		x1A = 1;
	} else {
		x1A = 0;
	}
	if (partyMemberOrder == 0) {
		x1A++;
	}
	createWindow(battleWindows[x1A]);
	setWindowTitle(battleWindows[x1A], PartyCharacter.name.length, &partyCharacters[partyMemberID - 1].name[0]);
	switch (x20) {
		case 0:
			selectionMenuItemSetup(BattleMenuOptions.attack, 0, 0, &battleMenuText[0][0], null);
			break;
		case 1:
			selectionMenuItemSetup(BattleMenuOptions.attack, 0, 0, &battleMenuText[6][0], null);
			break;
		case 2:
			selectionMenuItemSetup(BattleMenuOptions.attack, 0, 0, &battleMenuTextDoNothing[0], null);
			break;
		default: break;
	}
	if (x20 != 2) {
		selectionMenuItemSetup(BattleMenuOptions.goods, 6, 0, &battleMenuText[1][0], null);
		selectionMenuItemSetup(BattleMenuOptions.defend, 6, 1, &battleMenuText[4][0], null);
	}
	if (partyMemberOrder == 0) {
		short x04 = (x1A == 2) ? 16 : 11;
		if ((partyMemberID == PartyMember.paula) || (partyMemberID == PartyMember.poo)) {
			x04 += 2;
		}
		selectionMenuItemSetup(BattleMenuOptions.autoFight, x04, 0, &battleMenuText[2][0], null);
		selectionMenuItemSetup(BattleMenuOptions.runAway, x04, 1, &battleMenuText[8][0], null);
	}
	if (partyMemberID == PartyMember.jeff) {
		selectionMenuItemSetup(BattleMenuOptions.spyPSI, 0, 1, &battleMenuText[7][0], null);
	} else if (character.afflictions[4] == 0) {
		selectionMenuItemSetup(BattleMenuOptions.spyPSI, 0, 1, &battleMenuText[3][0], null);
	}
	if (partyMemberID == PartyMember.paula) {
		selectionMenuItemSetup(BattleMenuOptions.prayMirror, 11, 0, &battleMenuText[5][0], null);
	}
	if (partyMemberID == PartyMember.poo) {
		selectionMenuItemSetup(BattleMenuOptions.prayMirror, 13, 0, &battleMenuText[9][0], null);
	}
	short chosenAction;
	while (true) {
		setWindowFocusF(battleWindows[x1A]);
		if (x24 == 0) {
			printMenuItemsF();
		}
		x24++;
		short tmp = selectionMenuF(1);
		if (tmp == 0) {
			if (debugging != 0) {
				if ((padState[0] & (Pad.select | Pad.start)) == (Pad.select | Pad.start)) {
					resumeHPPPRolling();
					return -1;
				} else if ((padState[0] & Pad.r) != 0){
					debugBattlerInfo();
					continue;
				}
			}
			if (battleMode == BattleMode.noBattle) {
				if ((padState[0] & Pad.l) != 0) {
					debugSetCharacterLevel();
					for (short i = 0; i < 6; i++) {
						if (gameState.partyMembers[i] == 0) {
							continue;
						}
						if (gameState.partyMembers[i] > 4) {
							continue;
						}
						battleInitPlayerStats(gameState.partyMembers[i], &battlersTable[i]);
					}
					continue;
				} else if ((padState[0] & Pad.select) != 0) {
					debugYButtonGoods();
					continue;
				}
				resumeHPPPRolling();
				return 0;
			}
		}
		battleItemUsed = 0;
		switch (tmp) {
			case BattleMenuOptions.attack:
				switch (x20) {
					case 0:
						chosenAction = BattleActions.bash;
						break;
					case 1:
						chosenAction = BattleActions.shoot;
						break;
					case 2:
						chosenAction = BattleActions.useNoEffect;
						break;
					default: break;
				}
				battleMenuSelection.selectedAction = chosenAction;
				battleMenuSelection.targetting = Targetted.enemies | Targetted.single;
				if (x20 != 2) {
					battleMenuSelection.selectedTarget = cast(ubyte)pickTargetF(0, 1, chosenAction);
					if (battleMenuSelection.selectedTarget == 0) {
						continue;
					}
				}
				break;
			case BattleMenuOptions.goods:
				battleMenuSelection.user = cast(ubyte)partyMemberID;
				if (battleSelectItemF(&battleMenuSelection) == 0) {
					continue;
				}
				battleItemUsed = cast(ubyte)getCharacterItem(partyMemberID, battleMenuSelection.param1);
				chosenAction = battleMenuSelection.selectedAction;
				break;
			case BattleMenuOptions.autoFight:
				gameState.autoFightEnable = 1;
				drawAutoFightIcon();
				chosenAction = BattleActions.noEffect;
				break;
			case BattleMenuOptions.spyPSI:
				if (partyMemberID == PartyMember.jeff) {
					chosenAction = BattleActions.spy;
					battleMenuSelection.selectedAction = chosenAction;
					battleMenuSelection.targetting = Targetted.enemies | Targetted.single;
					battleMenuSelection.selectedTarget = cast(ubyte)pickTargetF(0, 1, chosenAction);
					if (battleMenuSelection.selectedTarget == 0) {
						continue;
					}
				}
				battleMenuSelection.user = cast(ubyte)partyMemberID;
				if (battlePSIMenuF(&battleMenuSelection) == 0) {
					continue;
				}
				battleItemUsed = 0;
				chosenAction = battleMenuSelection.selectedAction;
				break;
			case BattleMenuOptions.defend:
				chosenAction = BattleActions.guard;
				battleMenuSelection.selectedAction = chosenAction;
				battleMenuSelection.targetting = Targetted.allies;
				break;
			case BattleMenuOptions.runAway:
				battleMenuSelection.targetting = Targetted.allies | Targetted.single;
				battleMenuSelection.selectedTarget = cast(ubyte)partyMemberID;
				chosenAction = BattleActions.runAway;
				battleMenuSelection.selectedAction = chosenAction;
				break;
			case BattleMenuOptions.prayMirror:
				battleMenuSelection.targetting = Targetted.allies | Targetted.single;
				battleMenuSelection.selectedTarget = cast(ubyte)partyMemberID;
				switch (partyMemberID) {
					case PartyMember.paula:
						switch (currentGiygasPhase) {
							case GiygasPhase.startPraying:
								chosenAction = BattleActions.finalPrayer1;
								break;
							case GiygasPhase.prayer1Used:
								chosenAction = BattleActions.finalPrayer2;
								break;
							case GiygasPhase.prayer2Used:
								chosenAction = BattleActions.finalPrayer3;
								break;
							case GiygasPhase.prayer3Used:
								chosenAction = BattleActions.finalPrayer4;
								break;
							case GiygasPhase.prayer4Used:
								chosenAction = BattleActions.finalPrayer5;
								break;
							case GiygasPhase.prayer5Used:
								chosenAction = BattleActions.finalPrayer6;
								break;
							case GiygasPhase.prayer6Used:
								chosenAction = BattleActions.finalPrayer7;
								break;
							case GiygasPhase.prayer7Used:
								chosenAction = BattleActions.finalPrayer8;
								break;
							case GiygasPhase.prayer8Used:
								chosenAction = BattleActions.finalPrayer9;
								break;
							default:
								chosenAction = BattleActions.pray;
								break;
						}
						battleMenuSelection.selectedAction = chosenAction;
						break;
					case PartyMember.poo:
						chosenAction = BattleActions.mirror;
						battleMenuSelection.selectedAction = chosenAction;
						battleMenuSelection.targetting = Targetted.enemies | Targetted.single;
						battleMenuSelection.selectedTarget = cast(ubyte)pickTargetF(0, 1, chosenAction);
						if (battleMenuSelection.selectedTarget == 0) {
							continue;
						}
						break;
					default: break;
				}
				break;
			default: break;
		}
		break;
	}
	setWindowFocusF(battleWindows[x1A]);
	resumeHPPPRolling();
	return chosenAction;
}

/// $C23B66
ubyte* copyEnemyName(const(ubyte)* arg1, ubyte* arg2, short arg3) {
	while (arg3-- != 0) {
		if (arg1[0] == 0) {
			break;
		}
		if (arg1[0] == ebChar('♪')) {
			for (short i = 0; i < PartyCharacter.name.length; i++) {
				(arg2++)[0] = partyCharacters[0].name[i];
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
void fixAttackerName(short arg1) {
	printAttackerArticle = 0;
	memset(&attackerNameAdjustScratch[0], 0, 28);
	if ((currentAttacker.side == BattleSide.foes) || (currentAttacker.npcID != 0)) {
		ubyte* x14 = copyEnemyName(&enemyConfigurationTable[currentAttacker.id].name[0], &attackerNameAdjustScratch[0], 25);
		if ((currentAttacker.side == BattleSide.foes) && (arg1 == 0)) {
			if ((currentAttacker.suffixLetter != 1) || (getNextAvailableEnemyLetter(currentAttacker.originalID) != 2)) {
				x14[0] = ebChar(' ');
				printAttackerArticle = 1;
				x14[1] = cast(ubyte)(currentAttacker.suffixLetter + 0x70);
			}
		}
		if (currentAttacker.id == EnemyID.myPet) {
			memcpy(&attackerNameAdjustScratch[0], &gameState.petName[0], 6);
			attackerNameAdjustScratch[6] = 0;
		}
		setBattleAttackerNameF(&attackerNameAdjustScratch[0], 27);
		attackerEnemyID = currentAttacker.id;
	} else {
		if (currentAttacker.id <= 4) {
			setBattleAttackerNameF(&partyCharacters[currentAttacker.row].name[0], PartyCharacter.name.length);
		}
	}
}

unittest {
	battleInitEnemyStats(EnemyID.insaneCultist1, &battlersTable[0]);
	currentAttacker = &battlersTable[0];
	fixAttackerName(0);
	assert(printable(battleAttackerName) == "Insane Cultist");

	battleInitEnemyStats(EnemyID.insaneCultist1, &battlersTable[1]);
	currentAttacker = &battlersTable[1];
	fixAttackerName(0);
	assert(printable(battleAttackerName) == "Insane Cultist B");
	fixAttackerName(1);
	assert(printable(battleAttackerName) == "Insane Cultist");

	gameState.petName = ebString!6("Pupper");
	battleInitEnemyStats(EnemyID.myPet, &battlersTable[2]);
	currentAttacker = &battlersTable[2];
	fixAttackerName(0);
	assert(printable(battleAttackerName) == "Pupper");

	partyCharacters[0].name = ebString!5("Ness");
	battleInitPlayerStats(PartyMember.ness, &battlersTable[3]);
	currentAttacker = &battlersTable[3];
	fixAttackerName(0);
	assert(printable(battleAttackerName) == "Ness");

	currentAttacker = null;
	gameState = gameState.init;
	battlersTable = battlersTable.init;
}

/// $C23D05
void fixTargetName() {
	printTargetArticle = 0;
	memset(&targetNameAdjustScratch[0], 0, targetNameAdjustScratch.length);
	if ((currentTarget.side == BattleSide.foes) || (currentTarget.npcID != 0)) {
		ubyte* x14 = copyEnemyName(&enemyConfigurationTable[currentTarget.id].name[0], &targetNameAdjustScratch[0], 25);
		if ((currentTarget.side == BattleSide.foes) && ((currentTarget.suffixLetter != 1) || (getNextAvailableEnemyLetter(currentTarget.originalID) != 2))) {
			x14[0] = ebChar(' ');
			printTargetArticle = 1;
			x14[1] = cast(ubyte)(currentTarget.suffixLetter + 0x70);
		}
		if (currentTarget.id == EnemyID.myPet) {
			memcpy(&targetNameAdjustScratch[0], &gameState.petName[0], gameState.petName.length);
			targetNameAdjustScratch[gameState.petName.length] = 0;
		}
		setBattleTargetNameF(&targetNameAdjustScratch[0], 27);
		targetEnemyID = currentTarget.id;
	} else {
		if (currentTarget.id <= 4) {
			setBattleTargetNameF(&partyCharacters[currentTarget.row].name[0], PartyCharacter.name.length);
		}
	}
}

unittest {
	battleInitEnemyStats(EnemyID.insaneCultist1, &battlersTable[0]);
	currentTarget = &battlersTable[0];
	fixTargetName();
	assert(printable(battleTargetName) == "Insane Cultist");

	battleInitEnemyStats(EnemyID.insaneCultist1, &battlersTable[1]);
	currentTarget = &battlersTable[1];
	fixTargetName();
	assert(printable(battleTargetName) == "Insane Cultist B");

	gameState.petName = ebString!6("Pupper");
	battleInitEnemyStats(EnemyID.myPet, &battlersTable[2]);
	currentTarget = &battlersTable[2];
	fixTargetName();
	assert(printable(battleTargetName) == "Pupper");

	partyCharacters[0].name = ebString!5("Ness");
	battleInitPlayerStats(PartyMember.ness, &battlersTable[3]);
	currentTarget = &battlersTable[3];
	fixTargetName();
	assert(printable(battleTargetName) == "Ness");

	currentTarget = null;
	gameState = gameState.init;
	battlersTable = battlersTable.init;
}

/// $C23E32
void unknownC23E32() {
	if (battlerTargetFlags == 0) {
		return;
	}
	short i;
	for (i = 0; i < battlersTable.length; i++) {
		if (isCharacterTargetted(i) != 0) {
			break;
		}
	}
	currentTarget = &battlersTable[i];
	fixTargetName();
}

/// $C23E8A
void unknownC23E8A(short arg1) {
	printAttackerArticle = 0;
	short x02;
	memset(&targetNameBuffer[0], 0, targetNameBuffer.length);
	if (arg1 > numBattlersInFrontRow) {
		x02 = backRowBattlers[arg1 - numBattlersInFrontRow - 1];
	} else {
		x02 = frontRowBattlers[arg1 - 1];
	}
	ubyte* x12 = copyEnemyName(&enemyConfigurationTable[battlersTable[x02].id].name[0], &targetNameBuffer[0], targetNameBuffer.length);
	if ((battlersTable[x02].suffixLetter != 1) || (getNextAvailableEnemyLetter(battlersTable[x02].originalID) != 2)) {
		(x12++)[0] = ebChar(' ');
		(x12++)[0] = cast(ubyte)(ebChar('A') + battlersTable[x02].suffixLetter);
		printAttackerArticle = 1;
	}
	setBattleAttackerNameF(&targetNameBuffer[0], targetNameBuffer.length - 1);
	attackerEnemyID = battlersTable[x02].id;
}

/// $C23F6C
short findTargettableNPC() {
	if ((rand() & 3) == 0) {
		return 0;
	}
	for (short i = 0; i < gameState.partyMembers.length; i++) {
		if (gameState.partyMembers[i] < PartyMember.pokey) {
			continue;
		}
		if ((npcAITable[gameState.partyMembers[i]].targettability & NPCTargettability.untargettable) == 0) {
			continue;
		}
		for (short j = 0; j < gameState.partyMembers.length; j++) {
			if (battlersTable[j].consciousness == 0) {
				continue;
			}
			if (battlersTable[j].npcID != gameState.partyMembers[i]) {
				continue;
			}
			return j;
		}
	}
	return 0;
}

/// $C23FEA
short getShieldTargetting(short arg1, Battler* battler) {
	if ((arg1 == BattleActions.psiShieldSigma) || (arg1 == BattleActions.psiShieldOmega) || (arg1 == BattleActions.psiPSIShieldSigma) || (arg1 == BattleActions.psiPSIShieldOmega)) {
		return 1;
	}
	return 0;
}

/// $C24009
void feelingStrangeRetargetting() {
	battlerTargetFlags = 0;
	switch (currentAttacker.actionTargetting & (Targetted.single | Targetted.row | Targetted.all)) {
		case Targetted.single:
			targetAll();
			battlerTargetFlags = randomTargetting(battlerTargetFlags);
			break;
		case Targetted.row:
			targetRow(rand() % 3);
			break;
		case Targetted.all:
			if ((rand() & 1) != 0) {
				targetAllies();
			} else {
				targetAllEnemies();
			}
			if ((getShieldTargetting(currentAttacker.currentAction, currentAttacker) == 0) && (currentAttacker.side == BattleSide.friends)) {
				removeNPCTargetting();
			}
			break;
		default: break;
	}
}

/// $C240A4
void unknownC240A4(void function() action) {
	while (unknownC2EACF() != 0) {
		windowTick();
	}
	for (short i = 8; i < battlersTable.length; i++) {
		currentTarget = &battlersTable[i];
		if (isCharacterTargetted(i) == 0) {
			continue;
		}
		fixTargetName();
		if (action is null) {
			continue;
		}
		action();
	}
	for (short i = 0; i < 8; i++) {
		currentTarget = &battlersTable[i];
		if (isCharacterTargetted(i) == 0) {
			continue;
		}
		fixTargetName();
		if (action is null) {
			continue;
		}
		action();
	}
}

/// $C2416F
void removeStatusUntargettableTargets() {
	for (short i = 0; deadTargettableActions[i] != 0; i++) {
		if (currentAttacker.currentAction == deadTargettableActions[i]) {
			return;
		}
	}
	for (short i = 0; i < battlersTable.length; i++) {
		if (isCharacterTargetted(i) == 0) {
			continue;
		}
		if ((battlersTable[i].consciousness == 0) || (battlersTable[i].afflictions[0] == Status0.unconscious) || (battlersTable[i].afflictions[0] == Status0.diamondized)) {
			removeTarget(i);
		}
	}
}

/// $C241DC
ubyte findStealableItems() {
	ubyte x18 = 0;
	for (short i = 0; i < 6; i++) {
		short x14 = gameState.partyMembers[i];
		if ((x14 < 1) || (x14 > 4)) {
			continue;
		}
		short x10;
		for (short j = 0; j < 6; j++) {
			if (battlersTable[j].consciousness == 0) {
				continue;
			}
			if (battlersTable[j].id == x14) {
				continue;
			}
			if (battlersTable[j].npcID != 0) {
				continue;
			}
			x10 = battlersTable[i].actionItemSlot;
		}
		for (short j = 0; j < 14; j++) {
			if (j + 1 == x10) {
				continue;
			}
			if (partyCharacters[x14 - 1].items[j] == 0) {
				continue;
			}
			if (itemData[partyCharacters[x14 - 1].items[j]].cost == 0) {
				continue;
			}
			if (itemData[partyCharacters[x14 - 1].items[j]].cost >= 290) {
				continue;
			}
			if ((itemData[partyCharacters[x14 - 1].items[j]].type & 0x30) != 0x20) {
				continue;
			}
			if (partyCharacters[x14 - 1].equipment[0] == j + 1) {
				continue;
			}
			if (partyCharacters[x14 - 1].equipment[1] == j + 1) {
				continue;
			}
			if (partyCharacters[x14 - 1].equipment[2] == j + 1) {
				continue;
			}
			if (partyCharacters[x14 - 1].equipment[3] == j + 1) {
				continue;
			}
			stealableItemCandidates[x18] = partyCharacters[x14 - 1].items[j];
			x18++;
		}
	}
	return x18;
}

/// $C24316
ubyte selectStealableItem() {
	short x0E = findStealableItems();
	if (x0E == 0) {
		return 0;
	}
	if ((rand() & 0x80) != 0) {
		return 0;
	}
	return stealableItemCandidates[randLimit(x0E)];
}

/// $C24348
short unknownC24348(short arg1) {
	short x02 = findStealableItems();
	for (short i = 0; i < x02; i++) {
		if (stealableItemCandidates[i] != arg1) {
			continue;
		}
		return 1;
	}
	return 0;
}

/// $C2437E
void removeUsedItem() {
	if (currentAttacker.side != BattleSide.friends) {
		return;
	}
	if (currentAttacker.npcID != 0) {
		return;
	}
	if (currentAttacker.actionItemSlot == 0) {
		return;
	}
	if (partyCharacters[currentAttacker.id].items[currentAttacker.actionItemSlot] != currentAttacker.currentActionArgument) {
		return;
	}
	if ((itemData[partyCharacters[currentAttacker.id].items[currentAttacker.actionItemSlot]].flags & ItemFlags.consumedOnUse) == 0) {
		return;
	}
	if (canCharacterEquip(currentAttacker.id, currentAttacker.currentActionArgument) == 0) {
		return;
	}
	removeItemFromInventoryF(currentAttacker.id, currentAttacker.actionItemSlot);
}

/// $C24434
short unknownC24434(Battler* arg1) {
	arg1.currentTarget = cast(ubyte)(randLimit(cast(short)(numBattlersInFrontRow + numBattlersInBackRow)) + 1);
	if (arg1.currentTarget > numBattlersInFrontRow) {
		return backRowBattlers[arg1.currentTarget - numBattlersInFrontRow - 1];
	}
	return frontRowBattlers[arg1.currentTarget - 1];
}

/// $C24477
void chooseTarget(Battler* arg1) {
	for (short i = 0; i < numBattlersInFrontRow; i++) {
		if (checkIfValidTarget(frontRowBattlers[i]) == 0) {
			goto Unknown4;
		}
	}
	for (short i = 0; i < numBattlersInBackRow; i++) {
		if (checkIfValidTarget(backRowBattlers[i]) == 0) {
			goto Unknown4;
		}
	}
	unknownC2F917();
	Unknown4:
	if (battleActionTable[arg1.currentAction].direction == ActionDirection.enemy) {
		if (arg1.side == BattleSide.foes) {
			arg1.actionTargetting = Targetted.allies;
		} else {
			arg1.actionTargetting = Targetted.enemies;
		}
	} else {
		if (arg1.side == BattleSide.foes) {
			arg1.actionTargetting = Targetted.enemies;
		} else {
			arg1.actionTargetting = Targetted.allies;
		}
	}
	switch (battleActionTable[arg1.currentAction].target) {
		case ActionTarget.none:
			arg1.actionTargetting |= Targetted.single;
			if (arg1.side == BattleSide.foes) {
				targetEnemyByBattlerIndex(arg1, cast(short)((arg1 - &battlersTable[0]) / Battler.sizeof));
			} else {
				arg1.currentTarget = cast(ubyte)(((arg1 - &battlersTable[0]) / Battler.sizeof) + 1);
			}
			break;
		case ActionTarget.one:
		case ActionTarget.random:
			arg1.actionTargetting |= Targetted.single;
			if (arg1.side == BattleSide.foes) {
				if (battleActionTable[arg1.currentAction].direction == ActionDirection.enemy) {
					arg1.currentTarget = cast(ubyte)findTargettableNPC();
					if (arg1.currentTarget != 0) {
						return;
					}
					while (true) {
						arg1.currentTarget = (rand() & 7) + 1;
						if (checkIfValidTarget(arg1.currentTarget - 1) != 0) {
							return;
						}
					}
				} else {
					while (true) {
						if (checkIfValidTarget(unknownC24434(arg1)) != 0) {
							return;
						}
					}
				}
			} else {
				if (battleActionTable[arg1.currentAction].direction == ActionDirection.enemy) {
					while (true) {
						if (checkIfValidTarget(unknownC24434(arg1)) != 0) {
							return;
						}
					}
				} else {
					while (true) {
						arg1.currentTarget = (rand() & 7) + 1;
						if (checkIfValidTarget(arg1.currentTarget - 1) != 0) {
							return;
						}
					}
				}
			}
		case ActionTarget.row:
			arg1.actionTargetting |= Targetted.row;
			if (arg1.side == BattleSide.foes) {
				arg1.currentTarget = 1;
			} else if (numBattlersInFrontRow == 0) {
				arg1.currentTarget = 2;
			} else if (numBattlersInBackRow == 0) {
				arg1.currentTarget = 1;
			} else {
				arg1.currentTarget = (rand() & 1) + 1;
			}
			break;
		case ActionTarget.all:
			arg1.actionTargetting |= Targetted.all;
			arg1.currentTarget = 1;
			break;
		default: break;
	}
}

/// $C24703
void resolveTargetting(Battler* battler) {
	battlerTargetFlags = 0;
	switch (battler.actionTargetting) {
		case Targetted.allies | Targetted.single:
			targetBattler(battler.currentTarget - 1);
			break;
		case Targetted.allies | Targetted.row:
		case Targetted.allies | Targetted.all:
			targetAllies();
			if ((getShieldTargetting(battler.currentAction, battler) == 0) && (battler.side == BattleSide.friends)) {
				removeNPCTargetting();
			}
			removeStatusUntargettableTargets();
			break;
		case Targetted.enemies | Targetted.single:
			if (battler.currentTarget > numBattlersInFrontRow) {
				targetBattler(backRowBattlers[battler.currentTarget - numBattlersInFrontRow - 1]);
			} else {
				targetBattler(frontRowBattlers[battler.currentTarget - 1]);
			}
			if (battler.currentAction == BattleActions.psiHealingOmega) {
				for (short i = 8; i < battlersTable.length; i++) {
					if (battlersTable[i].consciousness == 0) {
						continue;
					}
					if (battlersTable[i].afflictions[0] == Status0.unconscious) {
						continue;
					}
					battlerTargetFlags = 0;
					targetBattler(i);
					break;
				}
			}
			break;
		case Targetted.enemies | Targetted.row:
			targetRow(battler.currentTarget);
			removeNPCTargetting();
			removeStatusUntargettableTargets();
			break;
		case Targetted.enemies | Targetted.all:
			targetAllEnemies();
			if (battler.side == BattleSide.friends) {
				removeNPCTargetting();
			}
			removeStatusUntargettableTargets();
			break;
		default: break;
	}
	tracef("Target flags: %032b", battlerTargetFlags);
}

/// $C24821
short battleRoutine() {
	short battleResult;
	ushort battleOver;
	ushort turnCount;
	ushort runningAway;
	ushort letterboxStyle;
	ushort layer2;
	ushort layer1;
	short debugPartyMembersSelected;
	short debugNumberInput;
	if (battleMode == BattleMode.noBattle) {
		debugNumberInput = 1;
		debugPartyMembersSelected = 1;
		gameState.playerControlledPartyMemberCount = 1;
		memset(&gameState.partyMembers[0], 0, 6);
		memset(&gameState.partyMemberIndex[0], 0, 6);
		gameState.partyMembers[0] = 1;
		gameState.partyMemberIndex[0] = 1;
		enemiesInBattle = 1;
		currentBattleGroup = 1;
		enemiesInBattleIDs[0] = battleEntryPointerTable[0].enemies[0].enemyID;
	}
	currentGiygasPhase = 0;
	if (currentBattleGroup == 0x1DB) {
		currentGiygasPhase = GiygasPhase.battleStarted;
	}
	layer1 = battleEntryBGTable[currentBattleGroup].layer1;
	layer2 = battleEntryBGTable[currentBattleGroup].layer2;
	letterboxStyle = cast(ushort)battleEntryPointerTable[currentBattleGroup].letterboxStyle;
	infiniteBattleLoop: do {
		ushort initiative;
		mirrorEnemy = 0;
		runningAway = 0;
		battleItemUsed = 0;
		turnCount = 0;
		battleMoneyScratch = 0;
		battleEXPScratch = 0;
		prepareForImmediateDMA();
		unknownC2E0E7();
		setBattleModeLayerConfig();
		prepareWindowGraphics();
		loadWindowGraphics(WindowGraphicsToLoad.all);
		loadBattleBG(layer1, layer2, letterboxStyle);
		unknownC2EEE7();
		for (short i = 0; i < battlersTable.length; i++) {
			memset(&battlersTable[i], 0, Battler.sizeof);
		}
		highestEnemyLevelInBattle = 0;
		ushort row = 0;
		for (short i = 0; i < 6; i++ ) {
			if ((gameState.partyMembers[i] != 0) && (gameState.partyMembers[i] <= 4)) {
				battleInitPlayerStats(gameState.partyMembers[i], &battlersTable[i]);
			} else if (gameState.partyMembers[i] >= 5) {
				battleInitEnemyStats(npcAITable[gameState.partyMembers[i]].enemyID, &battlersTable[i]);
				battlersTable[i].side = BattleSide.friends;
				battlersTable[i].npcID = gameState.partyMembers[i];
				battlersTable[i].row = cast(ubyte)row;
				battlersTable[i].hpTarget = gameState.partyNPCHP[row];
				battlersTable[i].hp = gameState.partyNPCHP[row];
				battlersTable[i].ppTarget = 0;
				battlersTable[i].pp = 0;
				row++;
			}
		}
		unknownC2F0D1();
		for (short i = 0; i < enemiesInBattle; i++) {
			battleInitEnemyStats(enemiesInBattleIDs[i], &battlersTable[i + 8]);
		}
		unknownC2F121();
		drawBattleSprites();
		loadTextPalette();
		preparePaletteUpload(PaletteUpload.full);
		battleModeFlag = 1;
		changeMusic(enemyConfigurationTable[enemiesInBattleIDs[0]].music);
		setForceBlank();
		fadeIn(1, 1);
		if (battleMode == BattleMode.noBattle) {
			unknownC1DCCB(debugNumberInput);
			short x02 = 0;
			for (short i = 0; i < 6; i++) {
				if ((gameState.partyMembers[i] != 0) && (gameState.partyMembers[i] <= 4)) {
					battleInitPlayerStats(gameState.partyMembers[i], &battlersTable[i]);
				} else if (gameState.partyMembers[i] >= 5) {
					if ((npcAITable[gameState.partyMembers[i]].targettability & 1) != 0) {
						battleInitEnemyStats(npcAITable[gameState.partyMembers[i]].enemyID, &battlersTable[i]);
						battlersTable[i].row = cast(ubyte)x02;
						battlersTable[i].hpTarget = gameState.partyNPCHP[x02];
						battlersTable[i].hp = gameState.partyNPCHP[x02];
						battlersTable[i].ppTarget = 0;
						battlersTable[i].pp = 0;
						battlersTable[i].side = BattleSide.friends;
						battlersTable[i].npcID = gameState.partyMembers[i];
					}
				}
			}
			showHPPPWindowsF();
			windowTick();
			while (true) {
				waitUntilNextFrame();
				drawBattleFrame();
				if ((padPress[0] & Pad.start) != 0) {
					break;
				}
				if ((padPress[0] & Pad.select) != 0) {
					currentBattleGroup = enemySelectMode(currentBattleGroup);
					layer1 = battleEntryBGTable[currentBattleGroup].layer1;
					layer2 = battleEntryBGTable[currentBattleGroup].layer2;
					letterboxStyle = cast(ushort)battleEntryPointerTable[currentBattleGroup].letterboxStyle;
				} else if (((padHeld[0] & Pad.right) != 0) && (debugPartyMembersSelected < 0xF)) {
					debugPartyMembersSelected++;
				} else if (((padHeld[0] & Pad.left) != 0) && (debugPartyMembersSelected > 1)) {
					debugPartyMembersSelected--;
				} else if (((padHeld[0] & Pad.down) != 0) && (debugNumberInput > 1)) {
					debugNumberInput--;
				} else if (((padHeld[0] & Pad.up) != 0) && (debugNumberInput < 99)) {
					debugNumberInput++;
				} else if ((padPress[0] & Pad.x) != 0) {
					debugNumberInput = highestEnemyLevelInBattle;
				} else {
					if ((padPress[0] & Pad.a) != 0) {
						showPSIAnimation(debuggingCurrentPSIAnimation);
						if (++debuggingCurrentPSIAnimation == 0x22) {
							debuggingCurrentPSIAnimation = 0;
						}
					}
					if ((padPress[0] & Pad.b) != 0) {
						startSwirl(debuggingCurrentSwirl, debuggingCurrentSwirlFlags);
						if (++debuggingCurrentSwirl == 8) {
							debuggingCurrentSwirl = Swirl.ovalWindow;
							debuggingCurrentSwirlFlags = (debuggingCurrentSwirlFlags + 1) & 3;
						}
					}
					continue;
				}
				short x = 0;
				if ((debugPartyMembersSelected & 1) != 0) {
					gameState.partyMembers[x] = 1;
					x = 1;
				}
				if ((debugPartyMembersSelected & 2) != 0) {
					gameState.partyMembers[x] = 2;
					x++;
				}
				if ((debugPartyMembersSelected & 4) != 0) {
					gameState.partyMembers[x] = 3;
					x++;
				}
				if ((debugPartyMembersSelected & 8) != 0) {
					gameState.partyMembers[x] = 4;
					x++;
				}
				gameState.playerControlledPartyMemberCount = cast(ubyte)x;
				for (short i = x; i < 6; i++) {
					gameState.partyMembers[i] = 0;
				}
			}
			changeMusic(enemyConfigurationTable[enemiesInBattleIDs[0]].music);
		}
		if (getEventFlag(EventFlag.bunbun) != 0) {
			battleInitEnemyStats(EnemyID.buzzBuzz, &battlersTable[6]);
			battlersTable[6].row = 1;
			battlersTable[6].side = BattleSide.friends;
			battlersTable[6].npcID = EnemyID.buzzBuzz;
		}
		for (short i = 0; i < 6; i++) {
			if ((gameState.partyMembers[i] != 0) && (gameState.partyMembers[i] <= 4)) {
				if (partyCharacters[gameState.partyMembers[i] - 1].afflictions[1] == Status1.possessed) {
					battleInitEnemyStats(EnemyID.tinyLilGhost, &battlersTable[6]);
					battlersTable[6].npcID = EnemyID.tinyLilGhost;
				}
			}
		}
		showHPPPWindowsF();
		short enemyDropSelected = enemiesInBattleIDs[randLimit(enemiesInBattle)];
		itemDropped = enemyConfigurationTable[enemyDropSelected].itemDropped;
		switch (enemyConfigurationTable[enemyDropSelected].itemDropRate) {
			case 0:
				if ((rand() & 0x7F) != 0) {
					itemDropped = 0;
				}
				break;
			case 1:
				if ((rand() & 0x3F) != 0) {
					itemDropped = 0;
				}
				break;
			case 2:
				if ((rand() & 0x1F) != 0) {
					itemDropped = 0;
				}
				break;
			case 3:
				if ((rand() & 0x0F) != 0) {
					itemDropped = 0;
				}
				break;
			case 5:
				if ((rand() & 0x03) != 0) {
					itemDropped = 0;
				}
				break;
			case 6:
				if ((rand() & 0x01) != 0) {
					itemDropped = 0;
				}
				break;
			default: break;
		}
		if (itemDropped == 0) {
			for (short i = 0; i < consolationItemTable.length; i++) {
				for (short j = 8; j < battlersTable.length; j++) {
					if (battlersTable[j].consciousness == 0) {
						continue;
					}
					if (consolationItemTable[i].enemy != battlersTable[j].id) {
						continue;
					}
					itemDropped = consolationItemTable[i].items[randLimit(7)];
				}
			}
		}
		initiative = Initiative.normal;
		switch (battleInitiative) {
			case 0:
				break;
			case 1:
				initiative = Initiative.partyFirst;
				break;
			case 2:
				initiative = Initiative.enemiesFirst;
				break;
			default: break;
		}
		battleInitiative = 0;
		createWindow(Window.textBattle);
		currentAttacker = &battlersTable[8];
		fixAttackerName(1);
		displayInBattleText(getTextBlock(enemyConfigurationTable[enemiesInBattleIDs[0]].encounterTextPointer));
		if (initiative == Initiative.partyFirst) {
			displayInBattleText(getTextBlock("MSG_BTL_SENSEI_PC"));
		}
		for (short i = 0; i < enemiesInBattle; i++) {
			currentTarget = &battlersTable[i];
			fixTargetName();
			if (currentTarget.afflictions[2] == Status2.asleep) {
				displayInBattleText(getTextBlock("MSG_BTL_AT_START_NEMURI"));
			}
			if (currentTarget.afflictions[4] != 0) {
				displayInBattleText(getTextBlock("MSG_BTL_AT_START_FUUIN"));
			}
			if (currentTarget.afflictions[3] == Status3.strange) {
				displayInBattleText(getTextBlock("MSG_BTL_AT_START_HEN"));
			}
		}
		closeFocusWindow();
		battleOver = 0;
		specialDefeat = battleOver;
		turnLoop: while (battleOver == 0) {
			turnCount++;
			unknownC2F917();
			for (short i = 0; i < battlersTable.length; i++) {
				battlersTable[i].hasTakenTurn = 0;
				if (battlersTable[i].consciousness == 0) {
					continue;
				}
				battlersTable[i].initiative = cast(ubyte)fiftyPercentVariance(battlersTable[i].speed);
				if (battlersTable[i].initiative == 0) {
					battlersTable[i].initiative = 1;
				}
			}
			for (short i = 0; i < 4; i++) {
				partyCharacters[i].isAutoHealed = 0;
			}
			short partyMemberBattleSelectionOrder = 0;
			for (short i = 0; i < 6; i++) {
				short chosenAction;
				checkDeadPlayers();
				if (countChars(BattleSide.friends) == 0) {
					createWindow(Window.textBattle);
					goto TurnOver;
				}
				if ((gameState.partyMembers[i] != 0) && (gameState.partyMembers[i] <= 4)) {
					if ((initiative == Initiative.enemiesFirst) || (initiative == Initiative.runningAway) || (initiative == Initiative.runningAlwaysSuccessful) || ((gameState.partyMembers[i] == 4) && (mirrorEnemy != 0)) || (partyCharacters[gameState.partyMembers[i]].afflictions[0] == Status0.unconscious) || (partyCharacters[gameState.partyMembers[i]].afflictions[0] == Status0.diamondized) || (partyCharacters[gameState.partyMembers[i]].afflictions[2] == Status2.asleep) || (partyCharacters[gameState.partyMembers[i]].afflictions[2] == Status2.solidified)) {
						chosenAction = BattleActions.noEffect;
						battleItemUsed = 0;
					} else {
						swapRaisedHPPPWindowF(i);
						chosenAction = battleSelectionMenu(gameState.partyMembers[i], partyMemberBattleSelectionOrder);
						resetActivePartyMemberHPPPWindowF();
						closeFocusWindow();
						if ((battleMode != BattleMode.noBattle) && (chosenAction == -1)) {
							battleResult = BattleResult.won;
							break turnLoop;
						}
						if (chosenAction == BattleActions.runAway) {
							chosenAction = BattleActions.useNoEffect;
							if (initiative == Initiative.partyFirst) {
								initiative = Initiative.runningAlwaysSuccessful;
							} else {
								initiative = Initiative.runningAway;
							}
							runningAway = 1;
						}
						if (chosenAction == -1) {
							continue infiniteBattleLoop;
						}
						if (chosenAction == BattleActions.noEffect) {
							if (partyMemberBattleSelectionOrder != 0) {
								partyMemberBattleSelectionOrder--;
								i = partyMembersWithSelectedActions[partyMemberBattleSelectionOrder];
							}
							// we don't want i to increase for the next iteration
							i--;
							continue;
						}
						partyMembersWithSelectedActions[partyMemberBattleSelectionOrder] = i;
						partyMemberBattleSelectionOrder++;
						if (chosenAction == 1) {
							chosenAction = 0;
						}
					}
					for (short j = 0; j < battlersTable.length; j++) {
						if (battlersTable[j].consciousness == 0) {
							continue;
						}
						if (battlersTable[j].side != BattleSide.friends) {
							continue;
						}
						if (gameState.partyMembers[i] != battlersTable[j].id) {
							continue;
						}
						battlersTable[j].currentAction = chosenAction;
						if (battleItemUsed != 0) {
							battlersTable[j].actionItemSlot = battleMenuSelection.param1;
							battlersTable[j].currentActionArgument = battleItemUsed;
						} else {
							battlersTable[j].actionItemSlot = 0;
							battlersTable[j].currentActionArgument = battleMenuSelection.param1;
						}
						battlersTable[j].actionTargetting = battleMenuSelection.targetting;
						battlersTable[j].currentTarget = battleMenuSelection.selectedTarget;
						if (battleMenuSelection.targetting == (Targetted.allies | Targetted.single)) {
							for (short k = 0; k < 6; k++) {
								if (battlersTable[k].consciousness == 0) {
									continue;
								}
								if (battlersTable[k].npcID != 0) {
									continue;
								}
								if (battleMenuSelection.selectedTarget != battlersTable[k].id) {
									continue;
								}
								battlersTable[j].currentTarget = cast(ubyte)(k + 1);
								break;
							}
						}
						if (battlersTable[j].currentAction == BattleActions.guard) {
							battlersTable[j].guarding = 1;
						} else {
							battlersTable[j].guarding = 0;
						}
						break;
					}
				}
			}
			for (short i = 0; i < battlersTable.length; i++) {
				if (((battlersTable[i].consciousness == 0) || (battlersTable[i].side != BattleSide.foes)) && (battlersTable[i].npcID == 0)) {
					if (battlersTable[i].id != 4) {
						continue;
					}
					if (mirrorEnemy == 0) {
						continue;
					}
				}
				if (((initiative == Initiative.partyFirst) || (initiative == Initiative.runningAlwaysSuccessful)) && (battlersTable[i].side == BattleSide.foes)) {
					battlersTable[i].currentAction = 0;
					continue;
				}
				if ((initiative == Initiative.enemiesFirst) && (battlersTable[i].side == BattleSide.friends)) {
					battlersTable[i].currentAction = 0;
					continue;
				}
				while (true) {
					const(Enemy)* x06;
					if ((battlersTable[i].side == BattleSide.friends) && (battlersTable[i].id == 4)) {
						x06 = &enemyConfigurationTable[mirrorEnemy];
					} else {
						x06 = &enemyConfigurationTable[battlersTable[i].id];
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
							x21 = battlersTable[i].actionOrderVar;
							battlersTable[i].actionOrderVar = (battlersTable[i].actionOrderVar + 1) & 3;
							break;
						case 3:
							x21 = (battlersTable[i].actionOrderVar * 2) + (rand() & 1);
							battlersTable[i].actionOrderVar = (battlersTable[i].actionOrderVar + 1) & 1;
							break;
						default: break;
					}
					battlersTable[i].currentAction = x06.actions[x21];
					battlersTable[i].currentActionArgument = x06.actionArgs[x21];
					if (battlersTable[i].currentAction != BattleActions.enemyExtender) {
						break;
					}
					if ((battlersTable[i].side == BattleSide.friends) && (battlersTable[i].id == 4)) {
						mirrorEnemy = battlersTable[i].currentActionArgument;
						continue;
					}
					battlersTable[i].id = battlersTable[i].currentActionArgument;
				}
				if (battlersTable[i].currentAction == BattleActions.steal) {
					battlersTable[i].currentActionArgument = selectStealableItem();
					battlersTable[i].initiative = 0;
				}
				if (battlersTable[i].currentAction == BattleActions.guard) {
					battlersTable[i].guarding = 1;
				} else {
					battlersTable[i].guarding = 0;
				}
				chooseTarget(&battlersTable[i]);
			}
			createWindow(Window.textBattle);
			if (initiative == Initiative.enemiesFirst) {
				displayInBattleText(getTextBlock("MSG_BTL_SENSEI_MON"));
			}
			if (runningAway != 0) {
				short highestSpeedEnemy;
				short highestSpeedFriend;
				for (short i = 0; i < battlersTable.length; i++) {
					if (battlersTable[i].consciousness == 0) {
						continue;
					}
					if (battlersTable[i].npcID != 0) {
						continue;
					}
					if (battlersTable[i].side == BattleSide.foes) {
						if (enemyConfigurationTable[battlersTable[i].id].boss != 0) {
							goto RunFailure;
						}
						if (battlersTable[i].afflictions[0] == Status0.unconscious) {
							continue;
						}
						if (battlersTable[i].afflictions[0] == Status0.diamondized) {
							continue;
						}
						if (battlersTable[i].afflictions[0] == Status0.paralyzed) {
							continue;
						}
						if (battlersTable[i].afflictions[2] == Status2.asleep) {
							continue;
						}
						if (battlersTable[i].afflictions[2] == Status2.immobilized) {
							continue;
						}
						if (battlersTable[i].afflictions[2] == Status2.solidified) {
							continue;
						}
						if (battlersTable[i].speed > highestSpeedEnemy) {
							highestSpeedEnemy = battlersTable[i].speed;
						}
					} else {
						if (battlersTable[i].speed > highestSpeedFriend) {
							highestSpeedFriend = battlersTable[i].speed;
						}
					}
				}
				if ((highestSpeedEnemy == 0) || (initiative == Initiative.runningAlwaysSuccessful) || ((turnCount * 10 + highestSpeedFriend >= highestSpeedEnemy) && (randLimit(100) < (turnCount * 10 + highestSpeedFriend - highestSpeedEnemy)))) {
					battleResult = BattleResult.won;
					displayInBattleText(getTextBlock("MSG_BTL_PLAYER_FLEE"));
					break turnLoop;
				} else {
					RunFailure:
					runningAway = 0;
					displayInBattleText(getTextBlock("MSG_BTL_PLAYER_FLEE_NG"));
				}
			}
			initiative = Initiative.normal;
			while (battleOver == 0) {
				checkDeadPlayers();
				if ((countChars(BattleSide.friends) != 0) && (countChars(BattleSide.foes) != 0)) {
					short x04 = -1;
					short x = 0;
					for (short i = 0; i < battlersTable.length; i++) {
						if (battlersTable[i].consciousness == 0) {
							continue;
						}
						if (battlersTable[i].hasTakenTurn != 0) {
							continue;
						}
						if (battlersTable[i].initiative < x) {
							continue;
						}
						x04 = i;
						x = battlersTable[i].initiative;
					}
					if (x04 == -1) {
						break;
					}
					currentAttacker = &battlersTable[x04];
					currentAttacker.hasTakenTurn = 1;
					if ((currentAttacker.afflictions[0] == Status0.unconscious) || (currentAttacker.afflictions[0] == Status0.diamondized)) {
						continue;
					}
					if ((currentAttacker.afflictions[0] == Status0.paralyzed) || (currentAttacker.afflictions[2] == Status2.immobilized)) {
						if ((battleActionTable[currentAttacker.currentAction].type != ActionType.psi) &&
						(currentAttacker.currentAction != BattleActions.pray) &&
						(currentAttacker.currentAction != BattleActions.finalPrayer1) &&
						(currentAttacker.currentAction != BattleActions.finalPrayer2) &&
						(currentAttacker.currentAction != BattleActions.finalPrayer3) &&
						(currentAttacker.currentAction != BattleActions.finalPrayer4) &&
						(currentAttacker.currentAction != BattleActions.finalPrayer5) &&
						(currentAttacker.currentAction != BattleActions.finalPrayer6) &&
						(currentAttacker.currentAction != BattleActions.finalPrayer7) &&
						(currentAttacker.currentAction != BattleActions.finalPrayer8) &&
						(currentAttacker.currentAction != BattleActions.finalPrayer9) &&
						(currentAttacker.currentAction != BattleActions.spy) &&
						(currentAttacker.currentAction != BattleActions.mirror) &&
						(currentAttacker.currentAction != BattleActions.noEffect)) {
							if (currentAttacker.afflictions[0] == Status0.paralyzed) {
								currentAttacker.currentAction = BattleActions.action252;
							} else {
								currentAttacker.currentAction = BattleActions.action254;
							}
						}
					}
					if ((currentAttacker.afflictions[2] == Status2.asleep) && (currentAttacker.currentAction != 0)) {
						currentAttacker.currentAction = BattleActions.action253;
						currentAttacker.actionItemSlot = 0;
					}
					if ((currentAttacker.afflictions[2] == Status2.solidified) && (currentAttacker.currentAction != 0)) {
						currentAttacker.currentAction = BattleActions.action255;
						currentAttacker.afflictions[2] = 0;
						currentAttacker.actionItemSlot = 0;
					}
					if ((currentAttacker.afflictions[4] != 0) && (battleActionTable[currentAttacker.currentAction].type == ActionType.psi) && (currentAttacker.currentAction != 0)) {
						currentAttacker.currentAction = BattleActions.action256;
					}
					if ((currentAttacker.afflictions[5] == Status5.homesick) && (currentAttacker.currentAction != 0) && ((rand() & 7) == 0)) {
						currentAttacker.currentAction = BattleActions.action251;
						currentAttacker.actionItemSlot = 0;
					}
					if ((battleActionTable[currentAttacker.currentAction].direction == ActionDirection.party) && (battleActionTable[currentAttacker.currentAction].target == ActionTarget.none)) {
						if (currentAttacker.side == BattleSide.friends) {
							currentAttacker.actionTargetting = Targetted.allies | Targetted.single;
							currentAttacker.currentTarget = cast(ubyte)((currentAttacker - &battlersTable[0]) / Battler.sizeof + 1);
						} else {
							currentAttacker.actionTargetting = Targetted.enemies | Targetted.single;
							targetEnemyByBattlerIndex(currentAttacker, cast(short)((currentAttacker - &battlersTable[0]) / Battler.sizeof));
						}
					}
					short statusDamage = 0;
					currentTarget = currentAttacker;
					fixAttackerName(0);
					fixTargetName();
					switch (currentAttacker.afflictions[0]) {
						case Status0.nauseous:
							statusDamage = twentyFivePercentVariance(20);
							displayTextWithValue(getTextBlock("MSG_BTL_KIMOCHI_DAMAGE"), statusDamage);
							break;
						case Status0.poisoned:
							statusDamage = twentyFivePercentVariance(20);
							displayTextWithValue(getTextBlock("MSG_BTL_MODOKU_DAMAGE"), statusDamage);
							break;
						case Status0.sunstroke:
							statusDamage = twentyFivePercentVariance(4);
							displayTextWithValue(getTextBlock("MSG_BTL_NISSHA_DAMAGE"), statusDamage);
							break;
						case Status0.cold:
							statusDamage = twentyFivePercentVariance(4);
							displayTextWithValue(getTextBlock("MSG_BTL_KAZE_DAMAGE"), statusDamage);
							break;
						default: break;
					}
					loseHPStatus(currentAttacker, statusDamage);
					if (currentAttacker.hp == 0) {
						koTarget(currentAttacker);
						if (countChars(BattleSide.friends) == 0) {
							goto TurnOver;
						}
						if (countChars(BattleSide.foes) != 0) {
							continue;
						}
						goto TurnOver;
					}
					if (currentAttacker.side == BattleSide.foes) {
						chooseTarget(currentAttacker);
						if (currentAttacker.currentAction == BattleActions.steal) {
							currentAttacker.currentActionArgument = selectStealableItem();
						}
					}
					resolveTargetting(currentAttacker);
					if ((currentAttacker.side == BattleSide.friends) && (battleActionTable[currentAttacker.currentAction].direction == 0)) {
						removeStatusUntargettableTargets();
						if (battlerTargetFlags == 0) {
							chooseTarget(currentAttacker);
							resolveTargetting(currentAttacker);
							removeStatusUntargettableTargets();
						}
					}
					short x31 = 0;
					if (((currentAttacker.afflictions[1] == Status1.mushroomized) && (randLimit(100) < 25)) || (currentAttacker.afflictions[3] == Status3.strange)) {
						if (battleActionTable[currentAttacker.currentAction].target != 0) {
							x31 = 1;
							while (battlerTargetFlags == 0) {
								feelingStrangeRetargetting();
								removeStatusUntargettableTargets();
							}
						}
					}
					if (currentAttacker.currentAction == BattleActions.steal) {
						if (unknownC24348(currentAttacker.currentActionArgument) != 0) {
							currentAttacker.currentActionArgument = 0;
						}
					}
					fixAttackerName(0);
					setCItemF(currentAttacker.currentActionArgument);
					unknownC23E32();
					if ((currentAttacker.side == BattleSide.friends) && (currentAttacker.id <= 4)) {
						for (short i = 0; i < 6; i++) {
							if (gameState.partyMembers[i] == currentAttacker.id) {
								swapRaisedHPPPWindowF(i);
								break;
							}
						}
					}
					if (battleActionTable[currentAttacker.currentAction].ppCost != 0) {
						if (battleActionTable[currentAttacker.currentAction].ppCost > currentAttacker.ppTarget) {
							displayInBattleText(getTextBlock("MSG_BTL_PSI_CANNOT"));
							goto EndOfTurn;
						} else {
							unknownC2BCB9(currentAttacker, battleActionTable[currentAttacker.currentAction].ppCost);
						}
					}
					if ((currentAttacker.side == BattleSide.foes) && (currentAttacker.currentAction != 0)) {
						switch (battleActionTable[currentAttacker.currentAction].type) {
							case ActionType.physical:
							case ActionType.piercingPhysical:
								unknownC2FEF9(1);
								break;
							case ActionType.psi:
								unknownC2FEF9(2);
								break;
							case ActionType.other:
								unknownC2FEF9(3);
								break;
							default: break;
						}
						currentAttacker.unknown73 = 12;
						for (short i = 0; i < 12; i++) {
							windowTick();
						}
					}
					if (x31 != 0) {
						if (currentAttacker.afflictions[3] == Status3.strange) {
							displayInBattleText(getTextBlock("MSG_BTL_RND_ACT_HEN"));
						}
						if (currentAttacker.afflictions[1] == Status1.mushroomized) {
							displayInBattleText(getTextBlock("MSG_BTL_RND_ACT_KINOKO"));
						}
					}
					unknownC1DD9F(getTextBlock(battleActionTable[currentAttacker.currentAction].text));
					if (currentAttacker.currentAction != 0) {
						while (unknownC2EACF() != 0) {
							windowTick();
						}
						for (short i = 0; i < battlersTable.length; i++) {
							if (isCharacterTargetted(i) == 0) {
								continue;
							}
							currentTarget = &battlersTable[i];
							fixTargetName();
							if (currentTarget.afflictions[0] == Status0.unconscious) {
								for (short j = 0; deadTargettableActions[j] != 0; j++) {
									if (currentAttacker.currentAction == deadTargettableActions[j]) {
										goto CurrentTargetOK;
									}
								}
								displayInBattleText(getTextBlock("MSG_BTL_NOT_EXIST"));
								break;
							}
							CurrentTargetOK:
							if (battleActionTable[currentAttacker.currentAction].func is null) {
								continue;
							}
							battleActionTable[currentAttacker.currentAction].func();
							checkDeadPlayers();
							redrawAllWindows = 1;
							if ((countChars(BattleSide.friends) == 0) || (countChars(BattleSide.foes) == 0)) {
								removeUsedItem();
								goto TurnOver;
							}
							switch (specialDefeat) {
								case SpecialDefeat.giygasDefeated:
									battleResult = BattleResult.won;
									break turnLoop;
								case SpecialDefeat.bossDefeated:
									removeUsedItem();
									goto EnemiesAreDead;
								case SpecialDefeat.teleported:
									battleResult = BattleResult.teleported;
									break turnLoop;
								default:
									while(screenEffectMinimumWaitFrames != 0) {
										windowTick();
									}
									break;
							}
						}
					}
					EndOfTurn:
					if (currentAttacker.side == BattleSide.friends) {
						removeUsedItem();
						if ((mirrorEnemy != 0) && (currentAttacker.id == 4) && (--mirrorTurnTimer == 0)) {
							mirrorEnemy = 0;
							copyMirrorData(currentAttacker, &mirrorBattlerBackup);
							displayInBattleText(getTextBlock("MSG_BTL_NEUTRALIZE_METAMORPH"));
						}
						resetActivePartyMemberHPPPWindowF();
					}
					checkDeadPlayers();
					currentTarget = currentAttacker;
					fixTargetName();
					switch (currentAttacker.afflictions[2]) {
						case Status2.asleep:
							if ((rand() & 3) == 0) {
								displayInBattleText(getTextBlock("MSG_BTL_NEMURI_OFF"));
								currentAttacker.afflictions[2] = 0;
							}
							break;
						case Status2.immobilized:
							if (randLimit(100) < 85) {
								displayInBattleText(getTextBlock("MSG_BTL_SHIBARA_OFF"));
								currentAttacker.afflictions[2] = 0;
							}
							break;
						case Status2.solidified:
							displayInBattleText(getTextBlock("MSG_BTL_KOORI_STAT"));
							currentAttacker.afflictions[2] = 0;
							break;
						default: break;
					}
					if (currentAttacker.afflictions[4] != 0) {
						currentAttacker.afflictions[4]--;
						if (currentAttacker.afflictions[4] == 0) {
							displayInBattleText(getTextBlock("MSG_BTL_FUUIN_OFF"));
						}
					}
					for (short i = 0; i < battlersTable.length; i++) {
						battlersTable[i].useAltSpritemap = 0;
					}
					checkDeadPlayers();
					showHPPPWindowsF();
				}
				TurnOver:
				if (countChars(BattleSide.friends) == 0) {
					battleResult = BattleResult.lost;
					resetRolling();
					displayInBattleText(getTextBlock("MSG_BTL_MONSTER_WIN"));
					battleOver = 1;
				}
				// this should be an else if
				if (countChars(BattleSide.foes) == 0) {
					EnemiesAreDead:
					battleResult = BattleResult.won;
					resetRolling();
					letterboxEffectEnding = 1;
					enableBackgroundDarkening = 1;
					depositIntoATM(battleMoneyScratch);
					gameState.moneyEarnedSinceLastCall += battleMoneyScratch;
					battleEXPScratch += countChars(BattleSide.friends) - 1;
					battleEXPScratch /= countChars(BattleSide.friends); //Bug! if party is dead, this is division by 0
					if (currentBattleGroup < 0x1C0) {
						displayTextWithValue(getTextBlock("MSG_BTL_PLAYER_WIN"), battleEXPScratch);
					} else {
						displayTextWithValue(getTextBlock("MSG_BTL_PLAYER_WIN_BOSS"), battleEXPScratch);
					}
					if (itemDropped != 0) {
						setCItemF(itemDropped);
						displayInBattleText(getTextBlock("MSG_BTL_PRESENT"));
					}
					for (short i = 0; i < battlersTable.length; i++) {
						if (battlersTable[i].consciousness == 0) {
							continue;
						}
						if (battlersTable[i].side != BattleSide.friends) {
							continue;
						}
						if (battlersTable[i].npcID != 0) {
							continue;
						}
						if ((battlersTable[i].afflictions[0] == Status0.unconscious) || (battlersTable[i].afflictions[0] == Status0.diamondized)) {
							continue;
						}
						gainEXP(battlersTable[i].id, 1, battleEXPScratch);
					}
					battleOver = 1;
				}
			}
			closeFocusWindow();
		}
		resetRolling();
		do {
			windowTick();
		} while (unknownC2108C() == 0);
		if (mirrorEnemy != 0) {
			for (short i = 0; i < battlersTable.length; i++) {
				if (battlersTable[i].consciousness == 0) {
					continue;
				}
				if (battlersTable[i].side != BattleSide.friends) {
					continue;
				}
				if (battlersTable[i].id != 4) {
					continue;
				}
				mirrorEnemy = 0;
				ubyte persistentEasyAffliction = battlersTable[i].afflictions[0];
				copyMirrorData(&battlersTable[i], &mirrorBattlerBackup);
				battlersTable[i].afflictions[0] = persistentEasyAffliction;
				checkDeadPlayers();
				break;
			}
		}
		resetPostBattleStats();
		gameState.autoFightEnable = 0;
		battleModeFlag = 0;
	} while (battleMode == BattleMode.noBattle);
	fadeOut(1, 1);
	do {
		waitUntilNextFrame();
		drawBattleFrame();
	} while (fadeParameters.step != 0);
	clearAutoFightIcon();
	prepareForImmediateDMA();
	closeAllWindowsAndHPPP();
	unknownC2E0E7();
	return battleResult;
}

/// $C26189
void unknownC26189(ushort arg1) {
	for (short i = 0; i < 0x100; i++) {
		(cast(ushort*)&palettes[0][0])[i] = arg1;
	}
	preparePaletteUpload(PaletteUpload.full);
	waitUntilNextFrame();
}

/// $C261BD
void instantWinHandler() {
	battleInitiative = Initiative.normal;
	changeMusic(Music.suddenVictory);
	unknownC2E9ED();
	for (short i = 0; i < 2; i++) {
		unknownC26189(0x3E0);
		unknownC26189(0x1F);
		unknownC26189(0x7C00);
	}
	unknownC26189(0);
	memcpy(&buffer[0], &buffer[0x2000], 0x200);
	prepareLoadedPaletteFadeTables(6, PaletteMask.all);
	for (short i = 0; i < 6; i++) {
		updatePaletteFade();
		waitUntilNextFrame();
	}
	finishPaletteFade();
	freezeEntities();
	createWindow(Window.textBattle);
	battleMoneyScratch = 0;
	for (short i = 0; i < enemiesInBattle; i++) {
		battleMoneyScratch += enemyConfigurationTable[enemiesInBattleIDs[i]].money;
	}
	gameState.moneyEarnedSinceLastCall += depositIntoATM(battleMoneyScratch);
	for (short i = 0; i < battlersTable.length; i++) {
		memset(&battlersTable[i], 0, Battler.sizeof);
	}
	for (short i = 0; i < 6; i++) {
		if (gameState.partyMembers[i] == 0) {
			continue;
		}
		if (gameState.partyMembers[i] > 4) {
			continue;
		}
		battleInitPlayerStats(gameState.partyMembers[i], &battlersTable[i]);
	}
	battleEXPScratch = 0;
	for (short i = 0; i < enemiesInBattle; i++) {
		battleEXPScratch += enemyConfigurationTable[enemiesInBattleIDs[i]].exp;
	}
	battleEXPScratch += countChars(BattleSide.friends) - 1;
	battleEXPScratch /= countChars(BattleSide.friends);
	displayTextWithValue(getTextBlock("MSG_BTL_PLAYER_WIN_FORCE"), battleEXPScratch);
	for (short i = 0; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.friends) {
			continue;
		}
		if (battlersTable[i].npcID != 0) {
			continue;
		}
		if ((battlersTable[i].afflictions[0] == Status0.unconscious) || (battlersTable[i].afflictions[0] == Status0.diamondized)) {
			continue;
		}
		gainEXP(battlersTable[i].id, 1, battleEXPScratch);
	}
	short enemyDropSelected = enemiesInBattleIDs[randLimit(enemiesInBattle)];
	itemDropped = enemyConfigurationTable[enemyDropSelected].itemDropped;
	switch (enemyConfigurationTable[enemyDropSelected].itemDropRate) {
		case 0:
			if ((rand() & 0x7F) != 0) {
				itemDropped = 0;
			}
			break;
		case 1:
			if ((rand() & 0x3F) != 0) {
				itemDropped = 0;
			}
			break;
		case 2:
			if ((rand() & 0x1F) != 0) {
				itemDropped = 0;
			}
			break;
		case 3:
			if ((rand() & 0x0F) != 0) {
				itemDropped = 0;
			}
			break;
		case 5:
			if ((rand() & 0x03) != 0) {
				itemDropped = 0;
			}
			break;
		case 6:
			if ((rand() & 0x01) != 0) {
				itemDropped = 0;
			}
			break;
		default: break;
	}
	if (itemDropped != 0) {
		setCItemF(itemDropped);
		displayInBattleText(getTextBlock("MSG_BTL_PRESENT"));
	}
	closeAllWindowsAndHPPP();
	if (gameState.walkingStyle == WalkingStyle.bicycle) {
		changeMusic(Music.bicycle);
	} else {
		reloadMapMusic();
	}
	unfreezeEntities();
}

/// $C2654C
void magicButterflyRecovery() {
	playSfx(Sfx.recoverHP);
	for (short i = 0; i < 2; i++) {
		memcpy(&buffer[0], &palettes[0][0], 0x200);
		for (short j = 0; j < 0x100; j++) {
			(cast(ushort*)&palettes[0][0])[j] = 0x5D70;
		}
		prepareLoadedPaletteFadeTables(12, PaletteMask.all);
		for (short j = 0; j < 12; j++) {
			updatePaletteFade();
			waitUntilNextFrame();
		}
		finishPaletteFade();
	}
	for (short i = 0; i < 6; i++) {
		if ((gameState.partyMembers[i] == 1) || (gameState.partyMembers[i] == 2) || (gameState.partyMembers[i] == 4)) {
			partyCharacters[gameState.partyMembers[i] - 1].pp.target += 20;
			if (partyCharacters[gameState.partyMembers[i] - 1].pp.target > partyCharacters[gameState.partyMembers[i] - 1].maxPP) {
				partyCharacters[gameState.partyMembers[i] - 1].pp.target = partyCharacters[gameState.partyMembers[i] - 1].maxPP;
			}
		}
	}
}

unittest {
	gameState.partyMembers = [1, 2, 3, 4, 0, 0];
	partyCharacters[0].maxPP = 300;
	partyCharacters[0].pp.target = 0;
	partyCharacters[1].maxPP = 300;
	partyCharacters[1].pp.target = 0;
	partyCharacters[3].maxPP = 300;
	partyCharacters[3].pp.target = 0;
	magicButterflyRecovery();
	assert(partyCharacters[0].pp.target == 20);
	assert(partyCharacters[1].pp.target == 20);
	assert(partyCharacters[3].pp.target == 20);
}

/// $C26634
short instantWinCheck() {
	if (battleInitiative == Initiative.enemiesFirst) {
		return 0;
	}
	short x22 = 0;
	short x20 = 0;
	ushort x1E = 0xFFFF;
	ushort x04 = 0xFFFF;
	for (short i = 0; i < 6; i++) {
		short x1A = gameState.partyMembers[i];
		if ((x1A < 1) || (x1A > 4)) {
			continue;
		}
		if (partyCharacters[x1A - 1].speed < x04) {
			x04 = partyCharacters[x1A - 1].speed;
		}
		if (partyCharacters[x1A - 1].offense < x1E) {
			x1E = partyCharacters[x1A - 1].offense;
		}
		short x16 = partyCharacters[x1A - 1].afflictions[0];
		if (x16 == Status0.unconscious) {
			continue;
		}
		if (x16 == Status0.diamondized) {
			continue;
		}
		if (x16 == Status0.paralyzed) {
			continue;
		}
		if (x16 == Status0.nauseous) {
			continue;
		}
		if (x16 == Status0.poisoned) {
			continue;
		}
		if (x16 == Status0.sunstroke) {
			continue;
		}
		if (x16 == Status0.cold) {
			continue;
		}
		if ((partyCharacters[x1A - 1].afflictions[1] == Status1.mushroomized) || (partyCharacters[x1A - 1].afflictions[1] == Status1.possessed)) {
			continue;
		}
		instantWinSortedOffense[x20++] = partyCharacters[x1A - 1].offense;
	}
	if (enemiesInBattle > x20) {
		return 0;
	}
	if (battleInitiative == Initiative.normal) {
		for (short i = 0; i < enemiesInBattle; i++) {
			if (enemyConfigurationTable[enemiesInBattleIDs[i]].speed > x22) {
				x22 = enemyConfigurationTable[enemiesInBattleIDs[i]].speed;
			}
		}
		if (x04 < x22) {
			return 0;
		}
		for (short i = 0; i < enemiesInBattle; i++) {
			if (x1E * 2 < enemyConfigurationTable[enemiesInBattleIDs[i]].defense + enemyConfigurationTable[enemiesInBattleIDs[i]].hp) {
				return 0;
			}
		}
		return 1;
	}
	for (short i = 0; i < enemiesInBattle; i++) {
		instantWinSortedHP[i] = enemyConfigurationTable[enemiesInBattleIDs[i]].hp;
		instantWinSortedDefense[i] = enemyConfigurationTable[enemiesInBattleIDs[i]].defense;
	}
	while (true) {
		short y = 1;
		for (short i = 0; i < x20 - 1; i++) {
			for (short j = cast(short)(i + 1); j < x20; j++) {
				short x10 = instantWinSortedOffense[i];
				if (instantWinSortedOffense[j] > x10) {
					y = 0;
					instantWinSortedOffense[i] = instantWinSortedOffense[j];
					instantWinSortedOffense[j] = x10;
				}
			}
		}
		if (y != 0) {
			break;
		}
	}
	while (true) {
		short x1E_2 = 1;
		for (short i = 0; i < enemiesInBattle - 1; i++) {
			for (short j = cast(short)(i + 1); j < enemiesInBattle; j++) {
				short x0E = instantWinSortedHP[i];
				if (instantWinSortedHP[j] > x0E) {
					x1E_2 = 0;
					instantWinSortedHP[i] = instantWinSortedHP[j];
					instantWinSortedHP[j] = x0E;
					short x04_2 = instantWinSortedDefense[j];
					instantWinSortedDefense[i] = instantWinSortedDefense[j];
					instantWinSortedDefense[j] = x04_2;
				}
			}
		}
		if (x1E_2 != 0) {
			break;
		}
	}
	short x22_2 = 0;
	for (short i = 0; i < x20; i++) {
		if (instantWinSortedOffense[i] * 2 < instantWinSortedHP[x22_2] + instantWinSortedDefense[x22_2]) {
			instantWinSortedHP[x22_2] -= instantWinSortedOffense[i] * 2 - instantWinSortedDefense[x22_2];
		} else {
			if (++x22_2 >= enemiesInBattle) {
				return 1;
			}
		}
	}
	return 0;
}

/// $C2698B
short getBattleActionType(short id) {
	return battleActionTable[id].type;
}

/// $C2698B
short getEnemyType(short id) {
	return enemyConfigurationTable[id].type;
}

/// $C269DE
void tickUntilFadeCompletion() {
	while (fadeParameters.step != 0) {
		windowTick();
	}
}

/// $C269BE
void wait(short frames) {
	while (--frames != 0) {
		windowTick();
	}
}

/// $C269EF
short randLong() {
	return rand();
}

/// $C269F8
short truncate16To8(short arg1, short arg2) {
	return cast(short)((arg1 * arg2) >> 8);
}

/// $C26A2D
short randLimit(short arg1) {
	return truncate16To8(randLong(), arg1);
}

/// $C26A44
short fiftyPercentVariance(short arg1) {
	ubyte x12 = randLong() & 0xFF;
	ubyte x10 = randLong() & 0xFF;
	short x0E = (x12 - 128 < 0) ? (-cast(int)(x12 - 0x80)) : (x12 - 0x80);
	short x0E2 = (x10 - 128 < 0) ? (-cast(int)(x10 - 0x80)) : (x10 - 0x80);

	if (x0E > x0E2) {
		x12 = x10;
		x0E = x0E2;
	}
	if (x12 < 0x80) {
		arg1 -= truncate16To8(arg1, x0E);
	} else if (x12 > 0x80) {
		arg1 += truncate16To8(arg1, x0E);
	}
	return arg1;
}

/// $C26AFD
short twentyFivePercentVariance(short arg1) {
	ubyte x12 = randLong() & 0xFF;
	ubyte x10 = randLong() & 0xFF;
	short x0E = (x12 - 128 < 0) ? (-cast(int)(x12 - 0x80)) : (x12 - 0x80);
	short x0E2 = (x10 - 128 < 0) ? (-cast(int)(x10 - 0x80)) : (x10 - 0x80);

	if (x0E > x0E2) {
		x12 = x10;
		x0E = x0E2;
	}
	if (x12 < 0x80) {
		arg1 -= truncate16To8(arg1, x0E) / 2;
	} else if (x12 > 0x80) {
		arg1 += truncate16To8(arg1, x0E) / 2;
	}
	return arg1;
}

/// $C26BB8
short success255(short arg) {
	if (randLong() < arg) {
		return 1;
	}
	return 0;
}

/// $C26BDB
short success500(short arg) {
	if (randLimit(500) < arg) {
		return 1;
	}
	return 0;
}

/// $C26BFB
void targetAllies() {
	battlerTargetFlags = 0;
	for (short i = 0; i < battlersTable.length; i++) {
		if ((battlersTable[i].consciousness != 0) && ((battlersTable[i].side == BattleSide.friends) || (battlersTable[i].npcID != 0))) {
			battlerTargetFlags |= targettingFlagBitmasks[i];
		}
	}
}

/// $C26C82
void targetAllEnemies() {
	battlerTargetFlags = 0;
	for (short i = 0; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		battlerTargetFlags |= targettingFlagBitmasks[i];
	}
}

/// $C26D04
void targetRow(ubyte arg1) {
	battlerTargetFlags = 0;
	for (short i = 0; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		switch (arg1) {
			case 0:
				if (battlersTable[i].side == BattleSide.friends) {
					battlerTargetFlags |= targettingFlagBitmasks[i];
				}
				break;
			case 1:
			case 2:
				if ((battlersTable[i].side == BattleSide.foes) && (battlersTable[i].row == arg1)) {
					battlerTargetFlags |= targettingFlagBitmasks[i];
				}
				break;
			default: break;
		}
	}
}

/// $C26E00
void targetAll() {
	battlerTargetFlags = 0;
	for (short i = 0; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		battlerTargetFlags |= targettingFlagBitmasks[i];
	}
}

/// $C26E77
void removeNPCTargetting() {
	for (short i = 0; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].npcID == 0) {
			continue;
		}
		battlerTargetFlags &= (0xFFFFFFFF ^ targettingFlagBitmasks[i]);
	}
}

/// $C26EF8
uint randomTargetting(uint arg1) {
	if (arg1 == 0) {
		return arg1;
	}
	short x10 = 0;
	short x0E = (randLong() % battlersTable.length) + 1;
	while (x0E-- != 0) {
		do {
			if (++x10 == 32) {
				x10 = 0;
			}
		} while ((targettingFlagBitmasks[x10] & arg1) == 0);
	}
	return targettingFlagBitmasks[x10];
}

/// $C26FDC
void targetBattler(short arg1) {
	battlerTargetFlags |= targettingFlagBitmasks[arg1];
}

/// $C27029
short isCharacterTargetted(short arg1) {
	if ((battlerTargetFlags & targettingFlagBitmasks[arg1]) != 0) {
		return 1;
	}
	return 0;
}

/// $C27089
void removeTarget(short arg1) {
	battlerTargetFlags &= (0xFFFFFFFF ^ targettingFlagBitmasks[arg1]);
}

/// $C270E4
void removeDeadTargetting() {
	for (short i = 0; i < battlersTable.length; i ++) {
		if (isCharacterTargetted(i) == 0) {
			continue;
		}
		if (battlersTable[i].afflictions[0] == Status0.unconscious) {
			removeTarget(i);
		}
	}
}

/// $C27126
void setHP(Battler* battler, short arg2) {
	ushort x10 = (arg2 > battler.hpMax) ? battler.hpMax : arg2;
	if (battler.side == BattleSide.friends) {
		if (battler.npcID == 0) {
			battler.hpTarget = x10;
			partyCharacters[battler.row].hp.target = x10;
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
void setPP(Battler* battler, short arg2) {
	ushort x10 = (arg2 > battler.ppMax) ? battler.ppMax : arg2;
	if (battler.side == BattleSide.friends) {
		if (battler.npcID == 0) {
			battler.ppTarget = x10;
			partyCharacters[battler.row].pp.target = x10;
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
void reduceHP(Battler* battler, short arg2) {
	setHP(battler, (arg2 > battler.hpTarget) ? 0 : cast(short)(battler.hpTarget - arg2));
}

/// $C2721D
void reducePP(Battler* battler, short arg2) {
	setPP(battler, (arg2 > battler.ppTarget) ? 0 : cast(short)(battler.ppTarget - arg2));
}

/// $C2724A
short inflictStatusBattle(Battler* target, short statusGroup, short status) {
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
void recoverHP(Battler* battler, short amount) {
	if (battler.consciousness != 1) {
		return;
	}
	if (battler.afflictions[0] != Status0.unconscious) {
		setHP(battler, cast(short)(amount + battler.hpTarget));
		if (battler.hpMax <= amount + battler.hpTarget) {
			displayInBattleText(getTextBlock("MSG_BTL_HPMAX_KAIFUKU"));
		} else {
			displayTextWithValue(getTextBlock("MSG_BTL_HP_KAIFUKU"), amount);
		}
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_HEAL_NG"));
	}
}

/// $C27318
void recoverPP(Battler* battler, short amount) {
	if (battler.consciousness != 1) {
		return;
	}
	if (battler.afflictions[0] == Status0.unconscious) {
		return;
	}
	short x16 = (battler.ppTarget + amount >= battler.ppMax) ? cast(short)(battler.ppMax - battler.ppTarget) : amount;
	setPP(battler, cast(short)(battler.ppTarget + amount));
	displayTextWithValue(getTextBlock("MSG_BTL_PP_KAIFUKU"), x16);
}

/// $C27397
short reviveTarget(Battler* arg1, short arg2) {
	displayInBattleText(getTextBlock("MSG_BTL_IKIKAERI"));
	arg1.afflictions[6] = 0;
	arg1.afflictions[5] = 0;
	arg1.afflictions[4] = 0;
	arg1.afflictions[3] = 0;
	arg1.afflictions[2] = 0;
	arg1.afflictions[1] = 0;
	arg1.afflictions[0] = 0;
	arg1.currentAction = 0;
	arg1.hasTakenTurn = 1;
	setHP(arg1, arg2);
	if ((arg1.side == BattleSide.friends) && (arg1.npcID == 0)) {
		partyCharacters[arg1.row].hp.target = arg2;
		partyCharacters[arg1.row].hp.current.integer = arg2;
	}
	if ((arg1.side == BattleSide.foes) && (arg1.npcID == 0)) {
		for (short i = 0; i < battlersTable.length; i++) {
			battlersTable[i].useAltSpritemap = 0;
		}
		arg1.useAltSpritemap = 1;
		for (short i = 1; i < 16; i++) {
			palettes[12 + arg1.vramSpriteIndex][i] = 0;
		}
		setBattleSpritePaletteEffectSpeed(10);
		for (short i = 1; i < 16; i++) {
			initializeBattleSpritePaletteEffect(cast(short)(arg1.vramSpriteIndex * 16 + i), 0x1F, 0x1F, 0x1F);
		}
		wait(10);
		setBattleSpritePaletteEffectSpeed(20);
		for (short i = 1; i < 16; i++) {
			initializeBattleSpritePaletteEffect(cast(short)(arg1.vramSpriteIndex * 16 + i), palettes[8 + arg1.vramSpriteIndex][i] & 0x1F, (palettes[8 + arg1.vramSpriteIndex][i] >> 5) & 0x1F, (palettes[8 + arg1.vramSpriteIndex][i] >> 10) & 0x1F);
		}
		wait(20);
	}
	return 1;
}

/// $C27550
void koTarget(Battler* arg1) {
	//x02 = arg1
	skipDeathTextAndCleanup = 0;
	if (arg1.side == BattleSide.friends) {
		if (arg1.afflictions[1] == Status1.possessed) {
			for (short i = 0; i < 6; i++) {
				if (battlersTable[i].consciousness == 0) {
					continue;
				}
				if (battlersTable[i].npcID != 0) {
					continue;
				}
				if (battlersTable[i].afflictions[1] != Status1.possessed) {
					continue;
				}
				if (&battlersTable[i] !is arg1) {
					break;
				}
				if (battlersTable[6].npcID != EnemyID.tinyLilGhost) {
					break;
				}
				battlersTable[6].consciousness = 0;
				while (i < 6) {
					if (battlersTable[i].consciousness == 0) {
						continue;
					}
					if (battlersTable[i].npcID != 0) {
						continue;
					}
					if (battlersTable[i].afflictions[1] != Status1.possessed) {
						continue;
					}
					battleInitEnemyStats(EnemyID.tinyLilGhost, &battlersTable[6]);
					battlersTable[6].npcID = EnemyID.tinyLilGhost;
					battlersTable[6].hasTakenTurn = 1;
				}
				break;
			}
		}
		arg1.afflictions[0] = Status0.unconscious;
		arg1.afflictions[6] = 0;
		arg1.afflictions[5] = 0;
		arg1.afflictions[4] = 0;
		arg1.afflictions[3] = 0;
		arg1.afflictions[2] = 0;
		arg1.afflictions[1] = 0;
		if (arg1.npcID != 0) {
			displayText(getTextBlock(enemyConfigurationTable[arg1.id].deathTextPointer));
			arg1.consciousness = 0;
			if ((arg1.npcID == PartyMember.teddyBear) || (arg1.npcID == PartyMember.plushTeddyBear)) {
				if (gameState.partyNPCs[arg1.row] == 0) {
					return;
				}
				arg1.consciousness = 1;
				arg1.afflictions[0] = 0;
				arg1.hpTarget = gameState.partyNPCHP[arg1.row];
				arg1.hp = gameState.partyNPCHP[arg1.row];
				arg1.npcID = gameState.partyNPCs[arg1.row];
				arg1.id = npcAITable[gameState.partyNPCs[arg1.row]].enemyID;
				return;
			}
			if (gameState.partyNPCs[0] == 0) {
				return;
			}
			for (short i = 0; battlersTable.length > i; i++) {
				if (battlersTable[i].consciousness == 0) {
					continue;
				}
				if (battlersTable[i].side != BattleSide.friends) {
					continue;
				}
				if (battlersTable[i].npcID != gameState.partyNPCs[0]) {
					continue;
				}
				battlersTable[i].row = 0;
				return;
			}
			return;
		}
		arg1.hpTarget = 0;
		partyCharacters[arg1.row].hp.target = 0;
		partyCharacters[arg1.row].hp.current.integer = 1;
		displayInBattleText(getTextBlock("MSG_BTL_KIZETU_ON"));
		return;
	}
	if (arg1.id == EnemyID.giygas2) {
		return;
	}
	if (arg1.id == EnemyID.giygas3) {
		return;
	}
	if (arg1.id == EnemyID.giygas5) {
		return;
	}
	if (arg1.id == EnemyID.giygas6) {
		return;
	}
	if (countChars(BattleSide.foes) == 1) {
		resetRolling();
		for (short i = 0; i < 6; i++) {
			if (battlersTable[i].consciousness == 0) {
				continue;
			}
			if (battlersTable[i].side != BattleSide.friends) {
				continue;
			}
			if (battlersTable[i].afflictions[0] == Status0.unconscious) {
				continue;
			}
			if (battlersTable[i].npcID != 0) {
				continue;
			}
			if (partyCharacters[battlersTable[i].row].hp.current.integer != 0) {
				continue;
			}
			partyCharacters[battlersTable[i].row].hp.target = 1;
		}
	}
	battleEXPScratch += arg1.exp;
	battleMoneyScratch += arg1.money;
	if (enemyConfigurationTable[arg1.id].finalAction != 0) {
		enemyPerformingFinalAttack = 1;
		Battler* x1E = currentAttacker;
		Battler* x16 = currentTarget;
		uint x12 = battlerTargetFlags;
		currentAttacker = arg1;
		arg1.currentAction = enemyConfigurationTable[arg1.id].finalAction;
		arg1.currentActionArgument = enemyConfigurationTable[arg1.id].finalActionArgument;
		chooseTarget(currentAttacker);
		resolveTargetting(currentAttacker);
		fixAttackerName(0);
		unknownC23E32();
		displayInBattleText(getTextBlock(battleActionTable[enemyConfigurationTable[arg1.id].finalAction].text));
		unknownC240A4(battleActionTable[enemyConfigurationTable[arg1.id].finalAction].func);
		enemyPerformingFinalAttack = 0;
		currentAttacker = x1E;
		currentTarget = x16;
		battlerTargetFlags = x12;
		fixAttackerName(0);
		fixTargetName();
		if (specialDefeat != SpecialDefeat.none) {
			return;
		}
	}
	if (skipDeathTextAndCleanup != 0) {
		return;
	}
	displayInBattleText(getTextBlock(enemyConfigurationTable[arg1.id].deathTextPointer));
	for (short i = 0; i < battlersTable.length; i++) {
		battlersTable[i].useAltSpritemap = 0;
	}
	arg1.useAltSpritemap = 1;
	setBattleSpritePaletteEffectSpeed(10);
	for (short i = 1; i < 16; i++) {
		initializeBattleSpritePaletteEffect(cast(short)(arg1.vramSpriteIndex * 16 + i), 0x1F, 0x1F, 0x1F);
	}
	wait(10);
	setBattleSpritePaletteEffectSpeed(20);
	for (short i = 1; i < 16; i++) {
		initializeBattleSpritePaletteEffect(cast(short)(arg1.vramSpriteIndex * 16 + i), 0, 0, 0);
	}
	wait(20);
	arg1.afflictions[0] = Status0.unconscious;
	arg1.afflictions[6] = 0;
	arg1.afflictions[5] = 0;
	arg1.afflictions[4] = 0;
	arg1.afflictions[3] = 0;
	arg1.afflictions[2] = 0;
	arg1.afflictions[1] = 0;
	arg1.hpTarget = 0;
	if (enemyConfigurationTable[arg1.id].deathType != 0) {
		for (short i = 8; i < battlersTable.length; i++) {
			if (battlersTable[i].consciousness == 0) {
				continue;
			}
			battlersTable[i].useAltSpritemap = 1;
		}
		playSfx(Sfx.enemyDefeated);
		setBattleSpritePaletteEffectSpeed(10);
		for (short i = 1; i < 64; i++) {
			if ((i & 0xF) == 0) {
				continue;
			}
			initializeBattleSpritePaletteEffect(i, 0x1F, 0x1F, 0x1F);
		}
		wait(10);
		setBattleSpritePaletteEffectSpeed(20);
		for (short i = 1; i < 64; i++) {
			if ((i & 0xF) == 0) {
				continue;
			}
			initializeBattleSpritePaletteEffect(i, 0, 0, 0);
		}
		wait(20);
		for (short i = 8; i < battlersTable.length; i++) {
			if (battlersTable[i].consciousness == 0) {
				continue;
			}
			battlersTable[i].afflictions[0] = Status0.unconscious;
		}
		specialDefeat = SpecialDefeat.bossDefeated;
	}
	if (arg1.npcID == EnemyID.tinyLilGhost) {
		short x22;
		for (x22 = 0; x22 < 6; x22++) {
			if (battlersTable[x22].consciousness == 0) {
				continue;
			}
			if (battlersTable[x22].npcID != 0) {
				continue;
			}
			if (battlersTable[x22].afflictions[1] != Status1.possessed) {
				continue;
			}
			battlersTable[x22].afflictions[1] = 0;
		}
		for (; x22 < 6; x22++) {
			if (battlersTable[x22].consciousness == 0) {
				continue;
			}
			if (battlersTable[x22].npcID != 0) {
				continue;
			}
			if (battlersTable[x22].afflictions[1] != Status1.possessed) {
				continue;
			}
			battleInitEnemyStats(EnemyID.tinyLilGhost, &battlersTable[6]);
			battlersTable[6].npcID = EnemyID.tinyLilGhost;
			battlersTable[6].hasTakenTurn = 1;
		}
	}
}

/// $C27D28
void increaseOffense16th(Battler* battler) {
	battler.offense += (battler.offense / 16 != 0) ? (battler.offense / 16) : 1;
	if (battler.offense > (battler.baseOffense * 5) / 4) {
		battler.offense = (battler.baseOffense * 5) / 4;
	}
}

/// $C27D82
void increaseDefense16th(Battler* battler) {
	battler.defense += (battler.defense / 16 != 0) ? (battler.defense / 16) : 1;
	if (battler.defense > (battler.baseDefense * 5) / 4) {
		battler.defense = (battler.baseDefense * 5) / 4;
	}
}

/// $C27E8A
void swapAttackerWithTarget() {
	Battler* tmp = currentAttacker;
	currentAttacker = currentTarget;
	currentTarget = tmp;
	fixAttackerName(0);
	fixTargetName();
}

/// $C27C96
short successLuck80() {
	if (randLimit(80) < currentTarget.luck) {
		return 0;
	}
	return 1;
}

/// $C27CAF
short successSpeed(short amount) {
	short x10 = (currentTarget.speed < currentAttacker.speed) ? 0 : cast(short)(currentTarget.speed - currentAttacker.speed);
	if (randLimit(amount) >= x10) {
		return 1;
	}
	return 0;
}

/// $C27CFD
short failAttackOnNPCs() {
	if (currentTarget.npcID != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
		return 1;
	}
	return 0;
}

/// $C27DDC
void hexadecimateOffense(Battler* target) {
	target.offense -= (target.offense / 16 != 0) ? (target.offense / 16) : 1;
	if (target.offense < (target.baseOffense * 3) / 4) {
		target.offense = (target.baseOffense * 3) / 4;
	}
}

/// $C27E33
void hexadecimateDefense(Battler* target) {
	target.defense -= (target.defense / 16 != 0) ? (target.defense / 16) : 1;
	if (target.defense < (target.baseDefense * 3) / 4) {
		target.defense = (target.baseDefense * 3) / 4;
	}
}

/// $C27EAF
short calcDamage(Battler* target, short damage) {
	short x18 = 0;
	Battler* x16;
	if (damage == 0) {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
		return 0;
	}
	if ((target.side == BattleSide.foes) && (target.id == EnemyID.giygas2)) {
		x18 = 1;
		x16 = currentTarget;
		do {
			currentTarget = &battlersTable[rand() & 3];
		} while ((currentTarget.consciousness == 0) || (currentTarget.npcID != 0) || (currentTarget.afflictions[0] == Status0.unconscious) || (currentTarget.afflictions[0] == Status0.diamondized));
		fixTargetName();
		target = currentTarget;
		reflectFlashDuration = 16;
		playSfx(Sfx.reflectDamage);
		wait(1 * 30);
	}
	short x02 = target.hpTarget;
	if ((target.side == BattleSide.friends) || ((target.id != EnemyID.masterBelch1) && (target.id != EnemyID.masterBelch3) && (target.id != EnemyID.giygas2) && (target.id != EnemyID.giygas3) && (target.id != EnemyID.giygas5) && (target.id != EnemyID.giygas6))) {
		reduceHP(target, damage);
	}
	if (target.side == BattleSide.friends) {
		if ((target.hpTarget == 0) && (x02 > 1)) {
			version(bugfix) {
				if (success500((target.guts < 25) ? 25 : target.guts) != 0) {
					setHP(target, 1);
				}
			} else {
				if (success500((currentAttacker.guts < 25) ? 25 : currentAttacker.guts) != 0) {
					setHP(target, 1);
				}
			}
		}
		// yes, even if this damage is non-fatal. but why?
		if ((enemyPerformingFinalAttack != 0) && (countChars(BattleSide.foes) == 1) && (countChars(BattleSide.friends) == 1)) {
			setHP(target, 1);
		}
	}
	if (target.side == BattleSide.foes) {
		if ((target.id == EnemyID.giygas3) || (target.id == EnemyID.giygas4) || (target.id == EnemyID.giygas5) || (target.id == EnemyID.giygas6)) {
			greenBackgroundFlashDuration = 16;
		}
		target.unknown72 = 21;
		if (isSmaaaashAttack != 0) {
			displayTextWithValue(getTextBlock("MSG_BTL_DAMAGE_SMASH_M"), damage);
			isSmaaaashAttack = 0;
		} else {
			displayTextWithValue(getTextBlock("MSG_BTL_DAMAGE_M"), damage);
		}
	} else {
		if ((target.npcID == 0) && (hpPPBoxBlinkDuration == 0)) {
			hpPPBoxBlinkDuration = 21;
			for (short i = 0; i < 6; i++) {
				if (gameState.partyMembers[i] != target.id) {
					continue;
				}
				hpPPBoxBlinkTarget = i;
				break;
			}
		}
		if (target.hpTarget == 0) {
			verticalShakeDuration = 1 * 60;
			verticalShakeHoldDuration = 1 * 12;
			displayTextWithValue(getTextBlock("MSG_BTL_DAMAGE_TO_DEATH"), damage);
		} else if (isSmaaaashAttack != 0) {
			verticalShakeDuration = 1 * 60;
			displayTextWithValue(getTextBlock("MSG_BTL_DAMAGE_SMASH"), damage);
			verticalShakeHoldDuration = 0;
			isSmaaaashAttack = 0;
		} else {
			verticalShakeDuration = 7 * 6;
			displayTextWithValue(getTextBlock("MSG_BTL_DAMAGE"), damage);
			verticalShakeHoldDuration = 0;
		}
		screenEffectMinimumWaitFrames = 40;
	}
	if (x18 != 0) {
		currentTarget = x16;
		fixTargetName();
	}
	return 1;
}

/// $C28125
short calcResistDamage(short damage, short arg2) {
	if (damage <= 0) {
		damage = 0;
	}
	if (arg2 < 0xFF) {
		damage = truncate16To8(arg2, damage);
	}
	if (currentTarget.consciousness != 1) {
		return damage;
	}
	if (currentTarget.afflictions[0] == Status0.unconscious) {
		return damage;
	}
	if (currentAttacker.guarding == 1) {
		if (getBattleActionType(currentAttacker.currentAction) == ActionType.physical) {
			damage /= 2;
		}
	}
	if (getBattleActionType(currentAttacker.currentAction) == ActionType.physical) {
		if ((currentTarget.afflictions[6] == Status6.shieldPower) || (currentTarget.afflictions[6] == Status6.shield)) {
			damage /= 2;
		}
	}
	if (damage == 0) {
		damage = 1;
	}
	if (calcDamage(currentTarget, damage) != 0) {
		if (currentTarget.hp == 0) {
			koTarget(currentTarget);
		}
	}
	// damage hasn't changed at all since the last check, so this seems unnecessary
	if (damage == 0) {
		damage = 1;
	}
	if (shieldHasNullifiedDamage == 0) {
		switch (currentTarget.afflictions[6]) {
			case Status6.shieldPower:
				if (enemyPerformingFinalAttack != 0) {
					goto case;
				}
				damage /= 2;
				if (damage == 0) {
					damage = 1;
				}
				displayInBattleText(getTextBlock("MSG_BTL_POWER_TURN"));
				swapAttackerWithTarget();
				calcDamage(currentTarget, damage);
				if (currentTarget.hp == 0) {
					koTarget(currentTarget);
				}
				swapAttackerWithTarget();
				goto case;
			case Status6.shield:
				if (--currentTarget.shieldHP == 0) {
					currentTarget.afflictions[6] = 0;
					displayInBattleText(getTextBlock("MSG_BTL_SHIELD_OFF"));
				}
				break;
			default: break;
		}
	}
	if ((currentTarget.side == BattleSide.friends) && (currentTarget.npcID == 0) && (partyCharacters[currentTarget.row].hp.current.integer == 0)) {
		return damage;
	}
	if ((currentTarget.afflictions[2] == Status2.asleep) && (success255(128) != 0)) {
		currentTarget.currentAction = 0;
		currentTarget.afflictions[2] = 0;
		displayInBattleText(getTextBlock("MSG_BTL_NEMURI_OFF"));
	}
	return damage;
}

/// $C282F8
short missCalc(short arg1) {
	short x12;
	if ((currentAttacker.side == BattleSide.friends) && (currentAttacker.npcID == 0)) {
		if (partyCharacters[currentAttacker.row].equipment[0] != 0) {
			x12 = itemData[partyCharacters[currentAttacker.row].items[partyCharacters[currentAttacker.row].equipment[0] - 1]].parameters.special;
		} else {
			x12 = 1;
		}
		if ((currentAttacker.afflictions[2] == Status2.crying) | (currentAttacker.afflictions[0] == Status0.nauseous)) {
			x12 += 8;
		}
	} else {
		x12 = enemyConfigurationTable[currentAttacker.id].missRate;
	}
	if (x12 == 0) {
		return 0;
	}
	if (x12 < randLimit(16)) {
		return 0;
	}
	if (arg1 != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_KARABURI_UTSU"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KARABURI"));
	}
	return 1;
}

/// $C283F8
short smaaaash() {
	isSmaaaashAttack = 0;
	short guts = currentAttacker.guts;
	if ((currentAttacker.side == BattleSide.friends) && (guts < 25)) {
		guts = 25;
	}
	if (success500(guts) == 0) {
		return 0;
	}
	if (currentAttacker.side == BattleSide.friends) {
		greenFlashDuration = 60;
		displayInBattleText(getTextBlock("MSG_BTL_SMASH_PLAYER"));
	} else {
		redFlashDuration = 60;
		displayInBattleText(getTextBlock("MSG_BTL_SMASH_MONSTER"));
	}
	if ((currentTarget.afflictions[6] == Status6.shieldPower) || (currentTarget.afflictions[6] == Status6.shield)) {
		currentTarget.shieldHP = 1;
	}
	isSmaaaashAttack = 1;
	calcResistDamage(cast(short)(currentAttacker.offense * 4 - currentTarget.defense), 0xFF);
	return 1;
}

/// $C284AD
short determineDodge() {
	if (currentTarget.afflictions[0] == Status0.paralyzed) {
		return 0;
	}
	if (currentTarget.afflictions[2] == Status2.asleep) {
		return 0;
	}
	if (currentTarget.afflictions[2] == Status2.immobilized) {
		return 0;
	}
	if (currentTarget.afflictions[2] == Status2.solidified) {
		return 0;
	}
	if (0 > currentTarget.speed * 2 - currentAttacker.speed) {
		return 0;
	}
	if (success500(cast(short)(currentTarget.speed * 2 - currentAttacker.speed)) != 0) {
		return 1;
	}
	return 0;
}

/// $C28523
void battleActionLevel2Attack() {
	short damageDone = cast(short)(currentAttacker.offense * 2 - currentTarget.defense);
	if (damageDone > 0) {
		damageDone = twentyFivePercentVariance(damageDone);
	}
	if (damageDone <= 0) {
		damageDone = 1;
	}
	calcResistDamage(damageDone, 0xFF);
}

/// $C2856B
void healStrangeness() {
	if (currentTarget.afflictions[3] == Status3.strange) {
		currentTarget.afflictions[3] = 0;
		displayInBattleText(getTextBlock("MSG_BTL_HEN_OFF"));
	}
}

/// $C2859F
void battleActionBash() {
	if ((missCalc(0) != 0) || (smaaaash() != 0)) {
		return;
	}
	if (determineDodge() == 0) {
		battleActionLevel2Attack();
		healStrangeness();
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_TATAKU_YOKETA"));
	}
}

/// $C285DA
void battleActionLevel4Attack() {
	if (missCalc(0) != 0) {
		return;
	}
	if (smaaaash() != 0) {
		return;
	}
	if (determineDodge() == 0) {
		short damageDone = cast(short)(currentAttacker.offense * 4 - currentTarget.defense);
		if (damageDone > 0) {
			damageDone = twentyFivePercentVariance(damageDone);
		}
		if (damageDone <= 0) {
			damageDone = 1;
		}
		calcResistDamage(damageDone, 0xFF);
		healStrangeness();
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_TATAKU_YOKETA"));
	}
}

/// $C28651
void battleActionLevel3Attack() {
	if (missCalc(0) != 0) {
		return;
	}
	if (smaaaash() != 0) {
		return;
	}
	if (determineDodge() == 0) {
		short damageDone = cast(short)(currentAttacker.offense * 3 - currentTarget.defense);
		if (damageDone > 0) {
			damageDone = twentyFivePercentVariance(damageDone);
		}
		if (damageDone <= 0) {
			damageDone = 1;
		}
		calcResistDamage(damageDone, 0xFF);
		healStrangeness();
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_TATAKU_YOKETA"));
	}
}

/// $C286CB
void battleActionLevel1Attack() {
	if (missCalc(0) != 0) {
		return;
	}
	if (smaaaash() != 0) {
		return;
	}
	if (determineDodge() == 0) {
		short damageDone = cast(short)(currentAttacker.offense - currentTarget.defense);
		if (damageDone > 0) {
			damageDone = twentyFivePercentVariance(damageDone);
		}
		if (damageDone <= 0) {
			damageDone = 1;
		}
		calcResistDamage(damageDone, 0xFF);
		healStrangeness();
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_TATAKU_YOKETA"));
	}
}

/// $C28740
void battleActionShoot() {
	if (missCalc(0) != 0) {
		return;
	}
	if (determineDodge() == 0) {
		battleActionLevel2Attack();
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_UTU_YOKETA"));
	}
}

/// $C28770
void battleActionSpy() {
	displayTextWithValue(getTextBlock("MSG_BTL_CHECK_OFFENSE"), currentTarget.offense);
	displayTextWithValue(getTextBlock("MSG_BTL_CHECK_DEFENSE"), currentTarget.defense);
	if (currentTarget.fireResist == 0xFF) {
		displayInBattleText(getTextBlock("MSG_BTL_CHECK_ANTI_FIRE"));
	}
	if (currentTarget.freezeResist == 0xFF) {
		displayInBattleText(getTextBlock("MSG_BTL_CHECK_ANTI_FREEZE"));
	}
	if (currentTarget.flashResist == 0xFF) {
		displayInBattleText(getTextBlock("MSG_BTL_CHECK_ANTI_FLASH"));
	}
	if (currentTarget.paralysisResist == 0xFF) {
		displayInBattleText(getTextBlock("MSG_BTL_CHECK_ANTI_PARALYSIS"));
	}
	if (currentTarget.hypnosisResist == 0xFF) {
		displayInBattleText(getTextBlock("MSG_BTL_CHECK_BRAIN_LEVEL_0"));
	}
	if (currentTarget.brainshockResist == 0xFF) {
		displayInBattleText(getTextBlock("MSG_BTL_CHECK_BRAIN_LEVEL_3"));
	}
	if ((currentTarget.side == BattleSide.foes) && (findInventorySpace2(3) != 0) && (itemDropped != 0)) {
		setCItemF(itemDropped);
		displayInBattleText(getTextBlock("MSG_BTL_CHECK_PRESENT_GET"));
		itemDropped = 0;
	}
}

/// $C2889B
void battleActionNull() {
	//nothing
}

/// $C2889E
void battleActionSteal() {
	if (currentTarget.side == BattleSide.foes) {
		return;
	}
	if (currentTarget.npcID != 0) {
		return;
	}
	if ((mirrorEnemy == 0) || (currentAttacker.side != BattleSide.friends) || (currentAttacker.id != 4)) {
		if (currentAttacker.currentActionArgument != 0) {
			takeItemFromCharacter(0xFF, currentAttacker.currentActionArgument);
		}
	}
}

/// $C288EB
void battleActionFreezeTime() {
	stopHPPPRolling();
	short x02 = cast(short)(randLimit(4) + 1);
	uint x16 = battlerTargetFlags;
	for (short i = 0; i < x02; i++) {
		removeStatusUntargettableTargets();
		if (battlerTargetFlags == 0) {
			break;
		}
		battlerTargetFlags = randomTargetting(x16);
		short j;
		for (j = 0; j < battlersTable.length; j++) {
			if (isCharacterTargetted(j) != 0) {
				break;
			}
		}
		currentTarget = &battlersTable[j];
		fixTargetName();
		battleActionBash();
	}
	resumeHPPPRolling();
	displayInBattleText(getTextBlock("MSG_BTL_TIMESTOP_RET"));
	battlerTargetFlags = 0;
}

/// $C289CE
void battleActionDiamondize() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if ((success255(currentTarget.paralysisResist) != 0) && (inflictStatusBattle(currentTarget, 0, Status0.diamondized) != 0)) {
		currentTarget.afflictions[6] = 0;
		currentTarget.afflictions[5] = 0;
		currentTarget.afflictions[4] = 0;
		currentTarget.afflictions[3] = 0;
		currentTarget.afflictions[2] = 0;
		currentTarget.afflictions[1] = 0;
		battleEXPScratch += currentTarget.exp;
		battleMoneyScratch += currentTarget.money;
		displayInBattleText(getTextBlock("MSG_BTL_DAIYA_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28A92
void battleActionParalyze() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if ((success255(currentTarget.paralysisResist) != 0) && (inflictStatusBattle(currentTarget, 0, Status0.paralyzed) != 0)) {
		displayInBattleText(getTextBlock("MSG_BTL_SHIBIRE_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28AEB
void battleActionNauseate() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if (inflictStatusBattle(currentTarget, 0, Status0.nauseous) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_KIMOCHI_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28B2C
void battleActionPoison() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if (inflictStatusBattle(currentTarget, 0, Status0.poisoned) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_MODOKU_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28B6D
void battleActionCold() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if ((success255(currentTarget.freezeResist) != 0) && (inflictStatusBattle(currentTarget, 0, Status0.cold) != 0)) {
		displayInBattleText(getTextBlock("MSG_BTL_KAZE_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28BBE
void battleActionMushroomize() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if (inflictStatusBattle(currentTarget, 1, Status1.mushroomized) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_KINOKO_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28BFD
void battleActionPossess() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if ((currentTarget.side == BattleSide.friends) && (inflictStatusBattle(currentTarget, 1, Status1.possessed) != 0)) {
		displayInBattleText(getTextBlock("MSG_BTL_TORITSU_ON"));
		if (battlersTable[6].consciousness == 0) {
			battleInitEnemyStats(EnemyID.tinyLilGhost, &battlersTable[6]);
			battlersTable[6].npcID = EnemyID.tinyLilGhost;
			battlersTable[6].hasTakenTurn = 1;
		}
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28C69
void battleActionCrying() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if ((success255(currentTarget.flashResist) != 0) && (inflictStatusBattle(currentTarget, 2, Status2.crying) != 0)) {
		displayInBattleText(getTextBlock("MSG_BTL_NAMIDA_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28CB8
void battleActionImmobilize() {
	if (inflictStatusBattle(currentTarget, 2, Status2.immobilized) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_SHIBARA_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28CF1
void battleActionSolidify() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if ((successLuck80() != 0) && (inflictStatusBattle(currentTarget, 2, Status2.solidified) != 0)) {
		displayInBattleText(getTextBlock("MSG_BTL_KOORI_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28D3A
void battleActionBrainshockAlphaCopy() {
	battleActionBrainshockAlpha();
}

/// $C28D41
short successLuck40() {
	if (randLimit(40) < currentTarget.luck) {
		return 0;
	}
	return 1;
}

/// $C28D5A
void battleActionDistract() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if ((successLuck40() != 0) && (success255(currentTarget.paralysisResist) != 0) && (currentTarget.afflictions[4] == 0)) {
		currentTarget.afflictions[4] = Status4.cantConcentrate4;
		displayInBattleText(getTextBlock("MSG_BTL_FUUIN_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28D8B
void battleActionFeelStrange() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if (inflictStatusBattle(currentTarget, 3, Status3.strange) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_HEN_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28DFC
void battleActionCrying2() {
	if (failAttackOnNPCs() == 0) {
		return;
	}
	if (inflictStatusBattle(currentTarget, 2, Status2.crying) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_NAMIDA_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C28E3B
void battleActionHypnosisAlphaCopy() {
	battleActionHypnosisAlpha();
}

/// $C28E42
void battleActionReducePP() {
	if (currentTarget.ppTarget == 0) {
		displayInBattleText(getTextBlock("MSG_BTL_PPSUCK_ZERO"));
	} else {
		short x16 = fiftyPercentVariance(currentTarget.ppMax / 16);
		if (x16 != 0) {
			reducePP(currentTarget, x16);
			displayTextWithValue(getTextBlock("MSG_BTL_PPSUCK_OBJ"), x16);
		} else {
			displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
		}
	}
}

/// $C28EAE
void battleActionCutGuts() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	short tmp = currentTarget.guts;
	currentTarget.guts = cast(short)((currentTarget.guts * 3) / 2);
	if (currentTarget.guts < currentTarget.baseGuts / 2) {
		currentTarget.guts = currentTarget.baseGuts / 2;
	}
	displayTextWithValue(getTextBlock("MSG_BTL_GUTS_DOWN"), tmp - currentTarget.guts);
}

/// $C28F21
void battleActionReduceOffenseDefense() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	short x16 = currentTarget.offense;
	hexadecimateOffense(currentTarget);
	displayTextWithValue(getTextBlock("MSG_BTL_OFFENSE_DOWN"), x16 - currentTarget.offense);
	x16 = currentTarget.defense;
	hexadecimateDefense(currentTarget);
	displayTextWithValue(getTextBlock("MSG_BTL_DEFENSE_DOWN"), x16 - currentTarget.defense);
}

/// $C28F97
void battleActionLevel2AttackPoison() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (missCalc(0) != 0) {
		return;
	}
	if (smaaaash() != 0) {
		return;
	}
	if (determineDodge() == 0) {
		battleActionLevel2Attack();
		healStrangeness();
		if (inflictStatusBattle(currentTarget, 0, Status0.poisoned) != 0) {
			displayInBattleText(getTextBlock("MSG_BTL_MODOKU_ON"));
		}
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_TATAKU_YOKETA"));
	}
}

/// $C28FF9
void battleActionDoubleBash() {
	battleActionBash();
	battleActionBash();
}

/// $C2900B
void battleAction350FireDamage() {
	calcResistDamage(twentyFivePercentVariance(350), currentTarget.fireResist);
}

/// $C2902C
void battleActionLevel3AttackCopy() {
	battleActionLevel3Attack();
}

/// $C29033
void battleActionNull2() {
	//nothing
}

/// $C29036
void battleActionNull3() {
	//nothing
}

/// $C29039
void battleActionNull4() {
	//nothing
}

/// $C2903C
void battleActionNull5() {
	//nothing
}

/// $C2903F
void battleActionNull6() {
	//nothing
}

/// $C29042
void battleActionNull7() {
	//nothing
}

/// $C29045
void battleActionNull8() {
	//nothing
}

/// $C29048
void battleActionNull9() {
	//nothing
}

/// $C2904B
void battleActionNull10() {
	//nothing
}

/// $C2904E
void battleActionNull11() {
	//nothing
}

/// $C29051
void battleActionNeutralize() {
	currentTarget.offense = currentTarget.baseOffense;
	currentTarget.defense = currentTarget.baseDefense;
	currentTarget.speed = currentTarget.baseSpeed;
	currentTarget.guts = currentTarget.baseGuts;
	currentTarget.luck = currentTarget.baseLuck;
	currentTarget.shieldHP = 0;
	currentTarget.afflictions[6] = 0;
	displayInBattleText(getTextBlock("MSG_BTL_NEUTRALIZE_RESULT"));
}

/// $C290C6
void unknownC290C6() {
	if (mirrorEnemy != 0) {
		for (short i = 0; i < battlersTable.length; i++) {
			if (battlersTable[i].consciousness == 0) {
				continue;
			}
			if (battlersTable[i].side != BattleSide.friends) {
				continue;
			}
			if (battlersTable[i].id != 4) {
				continue;
			}
			mirrorEnemy = 0;
			copyMirrorData(&battlersTable[i], &mirrorBattlerBackup);
			battlersTable[i].currentAction = 0;
			displayInBattleText(getTextBlock("MSG_BTL_NEUTRALIZE_METAMORPH"));
			break;
		}
	}
	targetAll();
	removeDeadTargetting();
	unknownC240A4(&battleActionNeutralize);
	battlerTargetFlags = 0;
}

/// $C2916E
void battleActionLevel2AttackDiamondize() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (missCalc(0) != 0) {
		return;
	}
	if (smaaaash() != 0) {
		return;
	}
	if (determineDodge() == 0) {
		battleActionLevel2Attack();
		healStrangeness();
		if (successLuck80() != 0) {
			if (inflictStatusBattle(currentTarget, 0, Status0.diamondized) != 0) {
				currentTarget.afflictions[6] = 0;
				currentTarget.afflictions[5] = 0;
				currentTarget.afflictions[4] = 0;
				currentTarget.afflictions[3] = 0;
				currentTarget.afflictions[2] = 0;
				currentTarget.afflictions[1] = 0;
				battleEXPScratch += currentTarget.exp;
				battleMoneyScratch += currentTarget.money;
				displayInBattleText(getTextBlock("MSG_BTL_DAIYA_ON"));
			}
		}
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_TATAKU_YOKETA"));
	}
}

/// $C29254
void battleActionReduceOffense() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	short x16 = currentTarget.offense;
	hexadecimateOffense(currentTarget);
	displayTextWithValue(getTextBlock("MSG_BTL_OFFENSE_DOWN"), x16 - currentTarget.offense);
}

/// $C29298
void battleActionClumsyRobotDeath() {
	if (getEventFlag(psiTeleportDestinationTable[13].eventFlag) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_TONZURA_BREAK_IN_OK"));
		setTeleportState(15, PSITeleportStyle.instant);
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_TONZURA_BREAK_IN_NG"));
		setTeleportState(13, PSITeleportStyle.instant);
		specialDefeat = SpecialDefeat.teleported;
	}
}

/// $C292EB
void battleActionEnemyExtend() {
	//nothing
}

/// $C292EE
void battleActionMasterBarfDeath() {
	Battler* x04 = currentAttacker;
	Battler* x16 = currentTarget;
	hideHPPPWindowsF();
	addCharToParty(PartyMember.poo);
	outer: for (short i = 0; battlersTable.length > i; i++) {
		if (battlersTable[i].consciousness != 0) {
			continue;
		}
		battleInitPlayerStats(PartyMember.poo, &battlersTable[i]);
		currentAttacker = &battlersTable[i];
		showHPPPWindowsF();
		for (short j = 0; 6 > j; j++) {
			if (gameState.partyMembers[j] != 4) {
				continue;
			}
			swapRaisedHPPPWindowF(j);
			break outer;
		}
	}
	displayInBattleText(getTextBlock("MSG_BTL_POO_BREAK_IN_2"));
	fixAttackerName(0);
	setCItemF(0x15); // PSI starstorm alpha ID
	displayInBattleText(getTextBlock(battleActionTable[30].text));
	for (short i = 0; battlersTable.length > i; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		currentTarget = &battlersTable[i];
		fixTargetName();
		calcDamage(currentTarget, twentyFivePercentVariance(360));
	}
	currentAttacker = x04;
	currentTarget = x16;
	fixAttackerName(0);
	fixTargetName();
}

/// $C2941D
short psiShieldNullify() {
	shieldHasNullifiedDamage = 1;
	setCItemF(currentAttacker.currentActionArgument);
	if (battleActionTable[currentAttacker.currentAction].type != ActionType.psi) {
		return 0;
	}
	switch(currentTarget.afflictions[6]) {
		case Status6.psiShieldPower:
			displayInBattleText(getTextBlock("MSG_BTL_PSYPOWER_TURN"));
			damageIsReflected = 1;
			swapAttackerWithTarget();
			break;
		case Status6.psiShield:
			displayInBattleText(getTextBlock("MSG_BTL_PSYCO_TURN"));
			if (--currentTarget.shieldHP == 0) {
				currentTarget.afflictions[6] = 0;
				displayInBattleText(getTextBlock("MSG_BTL_SHIELD_OFF"));
			}
			return 1;
		default: break;
	}
	return 0;
}

/// $C294CE
void weakenShield() {
	shieldHasNullifiedDamage = 0;
	if (damageIsReflected == 0) {
		return;
	}
	swapAttackerWithTarget();
	currentTarget.shieldHP--;
	if (currentTarget.shieldHP == 0) {
		currentTarget.afflictions[6] = 0;
		displayInBattleText(getTextBlock("MSG_BTL_SHIELD_OFF"));
	}
	damageIsReflected = 0;
}

/// $C29516
void psiRockinCommon(short baseDamage) {
	if (psiShieldNullify() != 0) {
		return;
	}
	if (determineDodge() != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	} else {
		calcResistDamage(fiftyPercentVariance(baseDamage), 0xFF);
	}
	weakenShield();
}

/// $C29556
void battleActionPSIRockinAlpha() {
	psiRockinCommon(80);
}

/// $C2955F
void battleActionPSIRockinBeta() {
	psiRockinCommon(180);
}

/// $C29568
void battleActionPSIRockinGamma() {
	psiRockinCommon(540);
}

/// $C29568
void battleActionPSIRockinOmega() {
	psiRockinCommon(720);
}

/// $C2957A
void psiFireCommon(short baseDamage) {
	if (psiShieldNullify() != 0) {
		return;
	}
	calcResistDamage(twentyFivePercentVariance(baseDamage), currentTarget.fireResist);
	weakenShield();
}

/// $C295AB
void battleActionPSIFireAlpha() {
	psiFireCommon(80);
}

/// $C295B4
void battleActionPSIFireBeta() {
	psiFireCommon(160);
}

/// $C295BD
void battleActionPSIFireGamma() {
	psiFireCommon(240);
}

/// $C295C6
void battleActionPSIFireOmega() {
	psiFireCommon(320);
}

/// $C295CF
void psiFreezeCommon(short baseDamage) {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (psiShieldNullify() != 0) {
		return;
	}
	short damageDone = calcResistDamage(twentyFivePercentVariance(baseDamage), currentTarget.freezeResist);
	if ((currentTarget.afflictions[0] != Status0.unconscious) && (damageDone != 0) && (randLimit(100) < 25)) {
		if (inflictStatusBattle(currentTarget, 2, Status2.solidified) != 0) {
			displayInBattleText(getTextBlock("MSG_BTL_KOORI_ON"));
		}
	}
	weakenShield();
}

/// $C29647
void battleActionPSIFreezeAlpha() {
	psiFreezeCommon(180);
}

/// $C29650
void battleActionPSIFreezeBeta() {
	psiFreezeCommon(360);
}

/// $C29659
void battleActionPSIFreezeGamma() {
	psiFreezeCommon(540);
}

/// $C29662
void battleActionPSIFreezeOmega() {
	psiFreezeCommon(720);
}

/// $C2966B
void psiThunderCommon(short baseDamage, short strikes) {
	short x18 = 0;
	for (short i = 0; i < battlersTable.length; i++) {
		if (isCharacterTargetted(i) == 0) {
			continue;
		}
		x18++;
	}
	short x02 = cast(short)(x18 * 64);
	if (x02 >= 0x100) {
		x02 = 0xFF;
	}
	uint x12 = battlerTargetFlags;
	for (short i = 0 ; i < strikes; i++) {
		battlerTargetFlags = x12;
		removeStatusUntargettableTargets();
		if (battlerTargetFlags == 0) {
			break;
		}
		battlerTargetFlags = randomTargetting(battlerTargetFlags);
		short x16;
		for (x16 = 0; x16 < battlersTable.length; x16++) {
			if (isCharacterTargetted(x16) != 0) {
				break;
			}
		}
		currentTarget = &battlersTable[x16];
		fixTargetName();
		if (success255(x02) != 0) {
			if (baseDamage == 120) {
				displayInBattleText(getTextBlock("MSG_BTL_THUNDER_SMALL"));
			} else {
				displayInBattleText(getTextBlock("MSG_BTL_THUNDER_LARGE"));
			}
			while (unknownC2EACF() != 0) {
				windowTick();
			}
			currentTarget.useAltSpritemap = 0;
			if ((currentTarget.side == BattleSide.friends) && (findItemInInventory2(currentTarget.row, ItemID.franklinBadge) != 0)) {
				displayInBattleText(getTextBlock("MSG_BTL_FRANKLIN_TURN"));
				damageIsReflected = 1;
				swapAttackerWithTarget();
			}
			if ((currentTarget.afflictions[6] == Status6.psiShieldPower) || (currentTarget.afflictions[6] == Status6.psiShield)) {
				currentTarget.shieldHP = 1;
			}
			if (psiShieldNullify() == 0) {
				calcResistDamage(fiftyPercentVariance(baseDamage), 0xFF);
			}
			weakenShield();
		} else {
			displayInBattleText(getTextBlock("MSG_BTL_THUNDER_MISS_SE"));
			displayInBattleText(getTextBlock("MSG_BTL_KAMINARI_HAZURE"));
		}
		if (countChars(BattleSide.friends) == 0) {
			break;
		}
		if (countChars(BattleSide.foes) == 0) {
			break;
		}
	}
	battlerTargetFlags = 0;
}

/// $C29871
void battleActionPSIThunderAlpha() {
	psiThunderCommon(120, 1);
}

/// $C2987D
void battleActionPSIThunderBeta() {
	psiThunderCommon(120, 2);
}

/// $C29889
void battleActionPSIThunderGamma() {
	psiThunderCommon(200, 3);
}

/// $C29895
void battleActionPSIThunderOmega() {
	psiThunderCommon(200, 4);
}

/// $C298A1
short flashImmunityTest() {
	if (psiShieldNullify() != 0) {
		return 0;
	}
	if (success255(currentTarget.flashResist) != 0) {
		return 1;
	}
	displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	return 0;
}

/// $C298DE
void flashInflictFeelingStrange() {
	if (inflictStatusBattle(currentTarget, 3, Status3.strange) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_HEN_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C29917
void flashInflictParalysis() {
	if (inflictStatusBattle(currentTarget, 0, Status0.paralyzed) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_SHIBIRE_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C29950
void flashInflictCrying() {
	if (inflictStatusBattle(currentTarget, 2, Status2.crying) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_NAMIDA_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C29987
void battleActionPSIFlashAlpha() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (flashImmunityTest() != 0) {
		if ((rand() & 7) == 0) {
			flashInflictFeelingStrange();
		} else {
			flashInflictCrying();
		}
	}
	weakenShield();
}

/// $C299AE
void battleActionPSIFlashBeta() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (flashImmunityTest() != 0) {
		switch (rand() & 7) {
			case 0:
				koTarget(currentTarget);
				break;
			case 1:
				flashInflictParalysis();
				break;
			case 2:
				flashInflictFeelingStrange();
				break;
			default:
				flashInflictCrying();
				break;
		}
	}
	weakenShield();
}

/// $C299EF
void battleActionPSIFlashGamma() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (flashImmunityTest() != 0) {
		switch (rand() & 7) {
			case 0:
			case 1:
				koTarget(currentTarget);
				break;
			case 2:
				flashInflictParalysis();
				break;
			case 3:
				flashInflictFeelingStrange();
				break;
			default:
				flashInflictCrying();
				break;
		}
	}
	weakenShield();
}

/// $C29A35
void battleActionPSIFlashOmega() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (flashImmunityTest() != 0) {
		switch (rand() & 7) {
			case 0:
			case 1:
			case 2:
				koTarget(currentTarget);
				break;
			case 3:
				flashInflictParalysis();
				break;
			case 4:
				flashInflictFeelingStrange();
				break;
			default:
				flashInflictCrying();
				break;
		}
	}
	weakenShield();
}

/// $C29A80
void psiStarstormCommon(short baseDamage) {
	if (psiShieldNullify() != 0) {
		return;
	}
	calcResistDamage(twentyFivePercentVariance(baseDamage), 0xFF);
	weakenShield();
}

/// $C29AA6
void battleActionPSIStarstormAlpha() {
	psiStarstormCommon(360);
}

/// $C29AAF
void battleActionPSIStarstormOmega() {
	psiStarstormCommon(720);
}

/// $C29AB8
void lifeupCommon(short baseHealing) {
	recoverHP(currentTarget, twentyFivePercentVariance(baseHealing));
}

/// $C29AC6
void battleActionLifeupAlpha() {
	lifeupCommon(100);
}

/// $C29ACF
void battleActionLifeupBeta() {
	lifeupCommon(300);
}

/// $C29AD8
void battleActionLifeupGamma() {
	lifeupCommon(10000);
}

/// $C29AE1
void battleActionLifeupOmega() {
	lifeupCommon(400);
}

/// $C29AEA
void battleActionHealingAlpha() {
	switch (currentTarget.afflictions[0]) {
		case Status0.cold:
			currentTarget.afflictions[0] = 0;
			displayInBattleText(getTextBlock("MSG_BTL_KAZE_OFF"));
			break;
		case Status0.sunstroke:
			currentTarget.afflictions[0] = 0;
			displayInBattleText(getTextBlock("MSG_BTL_NISSYA_OFF"));
			break;
		default:
			if (currentTarget.afflictions[2] == Status2.asleep) {
				currentTarget.afflictions[2] = 0;
				displayInBattleText(getTextBlock("MSG_BTL_NEMURI_OFF"));
			} else {
				displayInBattleText(getTextBlock("MSG_BTL_HEAL_NG"));
			}
			break;
	}
}

/// $C29B7A
void battleActionHealingBeta() {
	switch (currentTarget.afflictions[0]) {
		case Status0.poisoned:
			currentTarget.afflictions[0] = 0;
			displayInBattleText(getTextBlock("MSG_BTL_MODOKU_OFF"));
			break;
		case Status0.nauseous:
			currentTarget.afflictions[0] = 0;
			displayInBattleText(getTextBlock("MSG_BTL_KIMOCHI_OFF"));
			break;
		default:
			if (currentTarget.afflictions[2] == Status2.crying) {
				currentTarget.afflictions[2] = 0;
				displayInBattleText(getTextBlock("MSG_BTL_NAMIDA_OFF"));
			} else if (currentTarget.afflictions[3] == Status3.strange) {
				currentTarget.afflictions[3] = 0;
				displayInBattleText(getTextBlock("MSG_BTL_HEN_OFF"));
			} else {
				battleActionHealingAlpha();
			}
			break;
	}
}

/// $C29C2C
void battleActionHealingGamma() {
	switch (currentTarget.afflictions[0]) {
		case Status0.paralyzed:
			currentTarget.afflictions[0] = 0;
			displayInBattleText(getTextBlock("MSG_BTL_SHIBIRE_OFF"));
			break;
		case Status0.diamondized:
			currentTarget.afflictions[0] = 0;
			displayInBattleText(getTextBlock("MSG_BTL_DAIYA_OFF"));
			break;
		case Status0.unconscious:
			if (success255(192) != 0) {
				reviveTarget(currentTarget, currentTarget.hpMax / 4);
			} else {
				displayInBattleText(getTextBlock("MSG_BTL_IKIKAERI_F"));
			}
			break;
		default:
			battleActionHealingBeta();
			break;
	}
}

/// $C29CB8
void battleActionHealingOmega() {
	if (currentTarget.afflictions[0] == Status0.unconscious) {
		reviveTarget(currentTarget, currentTarget.hpMax);
	} else {
		battleActionHealingGamma();
	}
}

/// $C29CDC
short shieldsCommon(Battler* target, ubyte status) {
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
void battleActionShieldAlpha() {
	if (shieldsCommon(currentTarget, Status6.shield) == 1) {
		displayInBattleText(getTextBlock("MSG_BTL_SHIELD_ADD"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_SHIELD_ON"));
	}
}

/// $C29D7A
void battleActionShieldSigma() {
	battleActionShieldAlpha();
}

/// $C29D81
void battleActionShieldBeta() {
	if (shieldsCommon(currentTarget, Status6.shieldPower) == 1) {
		displayInBattleText(getTextBlock("MSG_BTL_POWER_ADD"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_POWER_ON"));
	}
}

/// $C29DB7
void battleActionShieldOmega() {
	battleActionShieldBeta();
}

/// $C29DBE
void battleActionPSIShieldAlpha() {
	if (shieldsCommon(currentTarget, Status6.psiShield) == 1) {
		displayInBattleText(getTextBlock("MSG_BTL_PSYCO_ADD"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_PSYCO_ON"));
	}
}

/// $C29DF4
void battleActionPSIShieldSigma() {
	battleActionPSIShieldAlpha();
}

/// $C29DFB
void battleActionPSIShieldBeta() {
	if (shieldsCommon(currentTarget, Status6.psiShieldPower) == 1) {
		displayInBattleText(getTextBlock("MSG_BTL_PSYPOWER_ADD"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_PSYPOWER_ON"));
	}
}

/// $C29E31
void battleActionPSIShieldOmega() {
	battleActionPSIShieldBeta();
}

/// $C29E38
void battleActionOffenseUpAlpha() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	short x16 = currentTarget.offense;
	increaseOffense16th(currentTarget);
	displayTextWithValue(getTextBlock("MSG_BTL_OFFENSE_UP"), currentTarget.offense - x16);
}

/// $C29E7F
void battleActionOffenseUpOmega() {
	battleActionOffenseUpAlpha();
}

/// $C29F06
void battleActionHypnosisAlpha() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if ((success255(currentTarget.hypnosisResist) != 0) && (inflictStatusBattle(currentTarget, 2, Status2.asleep) != 0)) {
		displayInBattleText(getTextBlock("MSG_BTL_NEMURI_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C29F57
void battleActionHypnosisOmega() {
	battleActionHypnosisAlpha();
}

/// $C29E86
void battleActionDefenseDownAlpha() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (successLuck80() != 0) {
		short x16 = currentTarget.defense;
		hexadecimateDefense(currentTarget);
		displayTextWithValue(getTextBlock("MSG_BTL_DEFENSE_DOWN"), x16 - currentTarget.defense);
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C29EFF
void battleActionDefenseDownOmega() {
	battleActionDefenseDownAlpha();
}

/// $C29F5E
void battleActionPSIMagnetAlpha() {
	if (currentTarget.ppTarget == 0) {
		displayInBattleText(getTextBlock("MSG_BTL_PPSUCK_ZERO"));
		return;
	}
	short x02 = cast(short)(randLimit(4) + randLimit(4) + 2);
	if (x02 > currentTarget.ppTarget) {
		x02 = currentTarget.ppTarget;
	}
	displayTextWithValue(getTextBlock("MSG_BTL_PPSUCK"), x02);
	reducePP(currentTarget, x02);
	setPP(currentAttacker, cast(short)(x02 + currentAttacker.ppTarget));
}

/// $C29FE1
void battleActionPSIMagnetOmega() {
	if ((currentTarget.side != BattleSide.friends) || (currentTarget.id != 3)) {
		battleActionPSIMagnetAlpha();
	}
}

/// $C29FFE
void battleActionParalysisAlpha() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if ((success255(currentTarget.paralysisResist) != 0) && (inflictStatusBattle(currentTarget, 0, Status0.paralyzed) != 0)) {
		displayInBattleText(getTextBlock("MSG_BTL_SHIBIRE_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A04F
void battleActionParalysisOmega() {
	battleActionParalysisAlpha();
}

/// $C2A056
void battleActionBrainshockAlpha() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if ((success255(currentTarget.brainshockResist) != 0) && (inflictStatusBattle(currentTarget, 3, Status3.strange) != 0)) {
		displayInBattleText(getTextBlock("MSG_BTL_HEN_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A0A7
void battleActionBrainshockOmega() {
	battleActionBrainshockAlpha();
}

/// $C2A0AE
void battleActionHPRecovery1d4() {
	recoverHP(currentTarget, randLimit(4));
}

/// $C2A0BF
void battleActionHPRecovery50() {
	recoverHP(currentTarget, twentyFivePercentVariance(50));
}

/// $C2A0CF
void battleActionHPRecovery200() {
	recoverHP(currentTarget, twentyFivePercentVariance(200));
}

/// $C2A0DF
void battleActionPPRecovery20() {
	recoverPP(currentTarget, twentyFivePercentVariance(20));
}

/// $C2A0EF
void battleActionPPRecovery80() {
	recoverPP(currentTarget, twentyFivePercentVariance(80));
}

/// $C2A0FF
void battleActionIQUp1d4() {
	short x16 = cast(short)(randLimit(4) + 1);
	currentTarget.iq += cast(ubyte)x16;
	displayTextWithValue(getTextBlock("MSG_BTL_IQ_UP"), x16);
}

/// $C2A14B
void battleActionGutsUp1d4() {
	short x16 = cast(short)(randLimit(4) + 1);
	currentTarget.guts += x16;
	displayTextWithValue(getTextBlock("MSG_BTL_GUTS_UP"), x16);
}

/// $C2A193
void battleActionSpeedUp1d4() {
	short x16 = cast(short)(randLimit(4) + 1);
	currentTarget.speed += x16;
	displayTextWithValue(getTextBlock("MSG_BTL_SPEED_UP"), x16);
}

/// $C2A1DB
void battleActionVitalityUp1d4() {
	short x16 = cast(short)(randLimit(4) + 1);
	currentTarget.vitality += cast(ubyte)x16;
	displayTextWithValue(getTextBlock("MSG_BTL_VITA_UP"), x16);
}

/// $C2A227
void battleActionLuckUp1d4() {
	short x16 = cast(short)(randLimit(4) + 1);
	currentTarget.luck += x16;
	displayTextWithValue(getTextBlock("MSG_BTL_LUCK_UP"), x16);
}

/// $C2A26F
void battleActionHPRecovery300() {
	recoverHP(currentTarget, twentyFivePercentVariance(300));
}

/// $C2A27F
void battleActionRandomStatUp1d4() {
	switch (randLimit(7)) {
		case 0:
			short x16 = cast(short)(randLimit(4) + 1);
			currentTarget.defense += x16;
			displayTextWithValue(getTextBlock("MSG_BTL_DEFENSE_UP"), x16);
			break;
		case 1:
			short x16 = cast(short)(randLimit(4) + 1);
			currentTarget.offense += x16;
			displayTextWithValue(getTextBlock("MSG_BTL_OFFENSE_UP"), x16);
			break;
		case 2:
			battleActionSpeedUp1d4();
			break;
		case 3:
			battleActionGutsUp1d4();
			break;
		case 4:
			battleActionVitalityUp1d4();
			break;
		case 5:
			battleActionIQUp1d4();
			break;
		case 6:
			battleActionLuckUp1d4();
			break;
		default: break;
	}
}

/// $C2A2F9
immutable ubyte[16] prayerList = [0, 0, 0, 0, 0, 1, 1, 2, 3, 4, 5, 5, 6, 7, 8, 9];

/// $C2A2F9
immutable const(ubyte)*[10] prayerTextPointers = [
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
void battleActionHPRecovery10() {
	recoverHP(currentTarget, twentyFivePercentVariance(10));
}

/// $C2A370
void battleActionHPRecovery100() {
	recoverHP(currentTarget, twentyFivePercentVariance(100));
}

/// $C2A380
void battleActionHPRecovery10000() {
	if (currentTarget.id != 4) {
		recoverHP(currentTarget, 10000);
	} else {
		battleActionHPRecovery1d4();
	}
}

/// $C2A3D1
void battleActionCounterPSI() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if ((successLuck40() != 0) &&(currentTarget.afflictions[4] == 0)) {
		currentTarget.afflictions[4] = 4;
		displayInBattleText(getTextBlock("MSG_BTL_FUUIN_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A39D
void healPoison() {
	if (currentTarget.afflictions[0] == Status0.poisoned) {
		currentTarget.afflictions[0] = 0;
		displayInBattleText(getTextBlock("MSG_BTL_MODOKU_OFF"));
	}
}

/// $C2A422
void battleActionShieldKiller() {
	if ((successLuck80() != 0) && (currentTarget.afflictions[6] != 0)) {
		currentTarget.afflictions[6] = 0;
		displayInBattleText(getTextBlock("MSG_BTL_SHIELD_OFF"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A46B
void battleActionHPSucker() {
	if ((successLuck80() != 0) && (currentAttacker.hpTarget != 0)) {
		if (currentTarget is currentAttacker) {
			displayInBattleText(getTextBlock("MSG_BTL_HPSUCK_ME"));
		} else {
			short x16 = fiftyPercentVariance(currentTarget.hpMax) / 8;
			reduceHP(currentTarget, x16);
			displayTextWithValue(getTextBlock("MSG_BTL_HPSUCK_ON"), x16);
			setHP(currentAttacker, cast(short)(currentAttacker.hp + x16));
			if (currentTarget.hp == 0) {
				koTarget(currentTarget);
			}
		}
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A507
void battleActionHungryHPSucker() {
	battleActionHPSucker();
}

/// $C2A50E
void battleActionMummyWrap() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (successSpeed(250) != 0) {
		short damageDone = cast(short)(400 - currentTarget.defense);
		if (damageDone > 0) {
			calcResistDamage(damageDone, 0xFF);
		}
		if (inflictStatusBattle(currentTarget, 2, Status2.solidified) != 0) {
			displayInBattleText(getTextBlock("MSG_BTL_KOORI_ON"));
		}
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A57A
void bottleRocketCommon(short count) {
	short x14 = 0;
	for (short i = 0; i < count; i++) {
		if (successSpeed(100) == 0) {
			continue;
		}
		x14++;
	}
	if (x14 != 0) {
		calcResistDamage(twentyFivePercentVariance(cast(short)(120 * x14)), 0xFF);
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A5D1
void battleActionBottleRocket() {
	bottleRocketCommon(1);
}

/// $C2A5DA
void battleActionBigBottleRocket() {
	bottleRocketCommon(5);
}

/// $C2A5E3
void battleActionMultiBottleRocket() {
	bottleRocketCommon(20);
}

/// $C2A5EC
void battleActionHandbagStrap() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if ((successSpeed(250) != 0) && (100 - currentTarget.defense > 0)) {
		calcResistDamage(cast(short)(100 - currentTarget.defense), 0xFF);
		if (inflictStatusBattle(currentTarget, 2, Status2.solidified) != 0) {
			displayInBattleText(getTextBlock("MSG_BTL_KOORI_ON"));
		}
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A658
void bombCommon(short baseDamage) {
	Battler* x18 = null;
	Battler* x04 = null;
	calcResistDamage(fiftyPercentVariance(baseDamage), 0xFF);
	if (currentTarget.side == BattleSide.friends) {
		short x16;
		for (x16 = 0; x16 < 6; x16++) {
			if (currentTarget.id == gameState.partyMembers[x16]) {
				break;
			}
		}
		if (x16 != 0) {
			x04 = &battlersTable[x16 - 1];
		}
		if ((1 <= gameState.partyMembers[x16 + 1]) && (gameState.partyMembers[x16 + 1] <= 4)) {
			x18 = &battlersTable[x16 + 1];
		}
	} else {
		for (short i = 8; i < battlersTable.length; i++) {
			if (&battlersTable[i] is currentTarget) {
				continue;
			}
			if (battlersTable[i].side != BattleSide.foes) {
				continue;
			}
			if (battlersTable[i].row != currentTarget.row) {
				continue;
			}
			if (battlersTable[i].spriteX < currentTarget.spriteX) {
				if (currentTarget.spriteX - battlersTable[i].spriteX <= (((getBattleSpriteWidth(battlersTable[i].sprite) + getBattleSpriteWidth(currentTarget.sprite)) * 4) + 8)) {
					x04 = &battlersTable[i];
				}
			} else {
				if (battlersTable[i].spriteX - currentTarget.spriteX <= (((getBattleSpriteWidth(battlersTable[i].sprite) + getBattleSpriteWidth(currentTarget.sprite)) * 4) + 8)) {
					x18 = &battlersTable[i];
				}
			}
		}
	}
	Battler* x14 = currentTarget;
	if (x04 !is null) {
		currentTarget = x04;
		fixTargetName();
		calcResistDamage(fiftyPercentVariance(baseDamage / 2), 0xFF);
	}
	if (x18 !is null) {
		currentTarget = x18;
		fixTargetName();
		calcResistDamage(fiftyPercentVariance(baseDamage / 2), 0xFF);
	}
	currentTarget = x14;
	fixTargetName();
}

/// $C2A818
void battleActionBomb() {
	bombCommon(90);
}

/// $C2A821
void battleActionSuperBomb() {
	bombCommon(270);
}

/// $C2A86B
void battleActionYogurtDispenser() {
	if (successSpeed(250) != 0) {
		calcResistDamage(randLimit(4), 0xFF);
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A89D
void battleActionSnake() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (successSpeed(250) != 0) {
		calcResistDamage(randLimit(4), 0xFF);
		if (success255(128) == 0) {
			return;
		}
		if (inflictStatusBattle(currentTarget, 0, Status0.poisoned) == 0) {
			return;
		}
		displayInBattleText(getTextBlock("MSG_BTL_MODOKU_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2A99C
void battleActionBagOfDragonite() {
	calcResistDamage(twentyFivePercentVariance(800), currentTarget.fireResist);
}

/// $C2A9BD
void insectSprayCommon(short baseDamage) {
	if ((successLuck80() != 0) && (currentTarget.side == BattleSide.foes) && (getEnemyType(currentTarget.id) == EnemyType.insect)) {
		calcResistDamage(fiftyPercentVariance(baseDamage), 0xFF);
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2AA0C
void battleActionInsecticideSpray() {
	insectSprayCommon(100);
}

/// $C2AA15
void battleActionXterminatorSpray() {
	insectSprayCommon(200);
}

/// $C2AA1E
void rustSprayCommon(short baseDamage) {
	if ((successLuck80() != 0) && (currentTarget.side == BattleSide.foes) && (getEnemyType(currentTarget.id) == EnemyType.metal)) {
		calcResistDamage(fiftyPercentVariance(baseDamage), 0xFF);
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2AA6D
void battleActionRustPromoter() {
	rustSprayCommon(200);
}

/// $C2AA76
void battleActionRustPromoterDX() {
	rustSprayCommon(400);
}

/// $C2AA7F
void battleActionSuddenGutsPill() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	currentTarget.guts = (currentTarget.guts * 2 >= 255) ? 255 : cast(ubyte)(currentTarget.guts * 2);
	displayTextWithValue(getTextBlock("MSG_BTL_2GUTS_UP"), currentTarget.guts);
}

/// $C2AAC6
void battleActionDefenseSpray() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	short x16 = currentTarget.defense;
	increaseDefense16th(currentTarget);
	displayTextWithValue(getTextBlock("MSG_BTL_DEFENSE_UP"), currentTarget.defense - x16);
}

/// $C2AB0D
void battleActionDefenseShower() {
	battleActionDefenseSpray();
}

/// $C2AB14 - returns 0 if there's a boss in the battle
short bossBattleCheck() {
	for (short i = 0; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		if (enemyConfigurationTable[battlersTable[i].id].boss == 0) {
			continue;
		}
		return 0;
	}
	return 1;
}

/// $C2AB71
void battleActionTeleportBox() {
	if ((loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & MapSectorConfig.cannotTeleport) == 0) {
		if ((battleModeFlag == 0) || ((randLimit(100) < itemData[currentAttacker.currentActionArgument].parameters.strength) && (bossBattleCheck() != 0))) {
			removeItemFromInventoryF(currentAttacker.id, currentAttacker.actionItemSlot);
			displayInBattleText(getTextBlock("MSG_BTL_TLPTBOX_OK"));
			setTeleportState(gameState.unknownC3, PSITeleportStyle.instant);
			specialDefeat = SpecialDefeat.teleported;
		} else {
			displayInBattleText(getTextBlock("MSG_BTL_TLPTBOX_NG"));
		}
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_TLPTBOX_CANT"));
	}
}

/// $C2AC2A
void battleActionPraySubtle() {
	recoverHP(currentTarget, currentTarget.hpMax / 16);
}

/// $C2AC3E
void battleActionPrayWarm() {
	recoverHP(currentTarget, currentTarget.hpMax / 8);
}

/// $C2AC51
void battleActionPrayGolden() {
	recoverHP(currentTarget, cast(short)(currentTarget.hpMax - currentAttacker.hpTarget));
}

/// $C2AC68
void battleActionPrayMysterious() {
	short x = fiftyPercentVariance(5);
	if (x == 0) {
		x++;
	}
	recoverPP(currentTarget, x);
}

/// $C2AC7B
void battleActionPrayRainbow() {
	if (currentTarget.afflictions[0] == Status0.unconscious) {
		reviveTarget(currentTarget, currentTarget.hpMax);
	}
}

/// $C2AC99
void battleActionPrayAroma() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (inflictStatusBattle(currentTarget, 2, Status2.asleep) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_NEMURI_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2ACDA
void battleActionPrayRendingSound() {
	if (failAttackOnNPCs() != 0) {
		return;
	}
	if (inflictStatusBattle(currentTarget, 3, Status3.strange) != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_HEN_ON"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
	}
}

/// $C2AD1B
void battleActionPray() {
	short x16 = prayerList[randLimit(16)];
	displayInBattleText(prayerTextPointers[x16]);
	void function() x12;
	switch (x16) {
		case 0:
			targetAllies();
			removeNPCTargetting();
			x12 = &battleActionPraySubtle;
			break;
		case 1:
			targetAllies();
			removeNPCTargetting();
			x12 = &battleActionPrayWarm;
			break;
		case 2:
			targetAllies();
			removeNPCTargetting();
			x12 = &battleActionPrayMysterious;
			break;
		case 3:
			targetAllies();
			removeNPCTargetting();
			removeDeadTargetting();
			battlerTargetFlags = randomTargetting(battlerTargetFlags);
			x12 = &battleActionPrayGolden;
			break;
		case 4:
			targetAllEnemies();
			removeNPCTargetting();
			battlerTargetFlags = randomTargetting(battlerTargetFlags);
			x12 = &battleActionPSIRockinBeta;
			break;
		case 5:
			targetAll();
			x12 = &battleActionPSIFlashAlpha;
			break;
		case 6:
			targetAll();
			x12 = &battleActionPrayRainbow;
			break;
		case 7:
			targetAll();
			x12 = &battleActionPrayAroma;
			break;
		case 8:
			targetAll();
			x12 = &battleActionPrayRendingSound;
			break;
		case 9:
			targetAll();
			x12 = &battleActionDefenseDownAlpha;
			break;
		default: break;
	}
	if (x16 != 6) {
		removeDeadTargetting();
	}
	unknownC240A4(x12);
	battlerTargetFlags = 0;
}

/// $C2AF1F
void copyMirrorData(Battler* arg1, Battler* arg2) {
	short x44 = arg1.hp;
	short x3E = arg1.pp;
	short x38 = arg1.hpTarget;
	short x32 = arg1.ppTarget;
	short x2C = arg1.hpMax;
	short x26 = arg1.ppMax;
	BattleSide x04 = arg1.side;
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
	arg1.side = x04;
	arg1.row = x02;
	arg1.id = x18;
	arg1.hasTakenTurn = x16;
}

/// $C2B0A1
void battleActionMirror() {
	if ((currentTarget.side != BattleSide.friends) && (currentTarget.npcID == 0) && (randLimit(100) < enemyConfigurationTable[currentTarget.id].mirrorSuccess)) {
		mirrorEnemy = currentTarget.id;
		mirrorTurnTimer = 16;
		memcpy(&mirrorBattlerBackup, currentAttacker, Battler.sizeof);
		copyMirrorData(currentAttacker, currentTarget);
		displayInBattleText(getTextBlock("MSG_BTL_METAMORPHOSE_OK"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_METAMORPHOSE_NG"));
	}
}

/// $C2B172
const(ItemParameters)* applyCondiment() {
	short x16 = currentAttacker.currentActionArgument;
	short x02 = findCondiment(cast(ubyte)x16);
	if (x02 != 0) {
		takeItemFromCharacter(currentAttacker.id, x02);
		for (short i = 0; condimentTable[i].item != 0; i++) {
			if (condimentTable[i].item != x16) {
				continue;
			}
			if ((condimentTable[i].goodCondiments[0] != x02) && (condimentTable[i].goodCondiments[1] != x02)) {
				break;
			}
			displayInBattleText(getTextBlock("MSG_BTL_EAT_SPICE_ATARI"));
			return &condimentTable[i].parameters;
		}
		displayInBattleText(getTextBlock("MSG_BTL_EAT_SPICE_HAZURE"));
	}
	return &itemData[x16].parameters;
}

/// $C2B27D
void eatFood() {
	short x1C = currentTarget.id;
	if (partyCharacters[x1C - 1].afflictions[0] == Status0.unconscious) {
		displayInBattleText(getTextBlock("MSG_BTL_KIKANAI"));
		return;
	}
	const(ItemParameters)* x18 = applyCondiment();
	ubyte x16 = x18.raw[(x1C == 4) ? 2 : 1];
	switch (x18.raw[0]) {
		case 0:
			recoverHP(currentTarget, (x16 != 0) ? twentyFivePercentVariance(x16 * 6) : 30000);
			break;
		case 1:
			recoverPP(currentTarget, (x16 != 0) ? twentyFivePercentVariance(x16) : 30000);
			break;
		case 2:
			recoverHP(currentTarget, (x16 != 0) ? twentyFivePercentVariance(x16 * 6) : 30000);
			recoverPP(currentTarget, (x16 != 0) ? twentyFivePercentVariance(x16) : 30000);
			break;
		case 3:
			switch (randLimit(4)) {
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
			partyCharacters[x1C - 1].boostedIQ += cast(ubyte)x16;
			recalcCharacterPostmathIQ(x1C);
			displayTextWithValue(getTextBlock("MSG_BTL_IQ_UP"), x16);
			break;
		case 5:
		BoostGuts:
			currentTarget.guts += x16;
			partyCharacters[x1C - 1].boostedGuts += cast(ubyte)x16;
			recalcCharacterPostmathGuts(x1C);
			displayTextWithValue(getTextBlock("MSG_BTL_GUTS_UP"), x16);
			break;
		case 6:
		BoostSpeed:
			currentTarget.speed += x16;
			partyCharacters[x1C - 1].boostedSpeed += cast(ubyte)x16;
			recalcCharacterPostmathSpeed(x1C);
			displayTextWithValue(getTextBlock("MSG_BTL_SPEED_UP"), x16);
			break;
		case 7:
		BoostVitality:
			currentTarget.vitality += cast(ubyte)x16;
			partyCharacters[x1C - 1].boostedVitality += cast(ubyte)x16;
			recalcCharacterPostmathVitality(x1C);
			displayTextWithValue(getTextBlock("MSG_BTL_VITA_UP"), x16);
			break;
		case 8:
		BoostLuck:
			currentTarget.luck += x16;
			partyCharacters[x1C - 1].boostedLuck += cast(ubyte)x16;
			recalcCharacterPostmathLuck(x1C);
			displayTextWithValue(getTextBlock("MSG_BTL_LUCK_UP"), x16);
			break;
		case 9:
			battleActionHealingAlpha();
			break;
		case 10:
			healPoison();
			break;
		default: break;
	}
	if (x18.special != 0) {
		boostPartySpeed(x18.special * 6);
	}
}

/// $C2B608
ubyte calcPSIDamageModifiers(ubyte arg1) {
	switch (arg1) {
		case 0: return 255;
		case 1: return 179;
		case 2: return 102;
		case 3: return 13;
		default: return arg1;
	}
}
/// $C2B639
ubyte calcPSIResistanceModifiers(ubyte arg1) {
	switch (arg1) {
		case 0: return 255;
		case 1: return 128;
		case 2: return 26;
		case 3: return 0;
		default: return arg1;
	}
}

/// $C2B66A
ubyte getNextAvailableEnemyLetter(short arg1) {
	memset(&usedEnemyLetters[0], 0, usedEnemyLetters.length);
	for (short i = 0; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		if (battlersTable[i].originalID != arg1) {
			continue;
		}
		usedEnemyLetters[battlersTable[i].suffixLetter - 1] = 1;
	}
	for (short i = 0; i < usedEnemyLetters.length; i++) {
		if (usedEnemyLetters[i] != 0) {
			continue;
		}
		return cast(ubyte)(i + 1);
	}
	return 0;
}

unittest {
	battlersTable = battlersTable.init;
	assert(getNextAvailableEnemyLetter(EnemyID.insaneCultist1) == 1);
	battleInitEnemyStats(EnemyID.insaneCultist1, &battlersTable[0]);
	assert(getNextAvailableEnemyLetter(EnemyID.insaneCultist1) == 2);
	battleInitEnemyStats(EnemyID.insaneCultist1, &battlersTable[1]);
	assert(getNextAvailableEnemyLetter(EnemyID.insaneCultist1) == 3);
	battlersTable[0].consciousness = 0;
	assert(getNextAvailableEnemyLetter(EnemyID.insaneCultist1) == 1);
}

/// $C2B6EB
void battleInitEnemyStats(short arg1, Battler* battler) {
	memset(battler, 0, Battler.sizeof);
	if (enemyConfigurationTable[arg1].level > highestEnemyLevelInBattle) {
		highestEnemyLevelInBattle = enemyConfigurationTable[arg1].level;
	}
	battler.id = arg1;
	battler.originalID = arg1;
	battler.sprite = cast(ubyte)enemyConfigurationTable[arg1].battleSprite;
	battler.suffixLetter = getNextAvailableEnemyLetter(arg1);
	battler.consciousness = 1;
	battler.side = BattleSide.foes;
	battler.npcID = 0;
	battler.row = enemyConfigurationTable[arg1].row;
	battler.hp = battler.hpTarget = battler.hpMax = enemyConfigurationTable[arg1].hp;
	battler.pp = battler.ppTarget = battler.ppMax = enemyConfigurationTable[arg1].pp;
	battler.offense = battler.baseOffense = cast(ubyte)enemyConfigurationTable[arg1].offense;
	battler.defense = battler.baseDefense = cast(ubyte)enemyConfigurationTable[arg1].defense;
	battler.speed = battler.baseSpeed = enemyConfigurationTable[arg1].speed;
	battler.guts = battler.baseGuts = enemyConfigurationTable[arg1].guts;
	battler.luck = battler.baseLuck = enemyConfigurationTable[arg1].luck;
	battler.vitality = 0;
	battler.iq = enemyConfigurationTable[arg1].iq;
	battler.fireResist = calcPSIDamageModifiers(enemyConfigurationTable[arg1].fireResist);
	battler.freezeResist = calcPSIDamageModifiers(enemyConfigurationTable[arg1].freezeResist);
	battler.flashResist = calcPSIResistanceModifiers(enemyConfigurationTable[arg1].flashResist);
	battler.paralysisResist = calcPSIResistanceModifiers(enemyConfigurationTable[arg1].paralysisResist);
	battler.hypnosisResist = calcPSIResistanceModifiers(enemyConfigurationTable[arg1].hypnosisBrainshockResist);
	battler.brainshockResist = calcPSIResistanceModifiers(cast(ubyte)(3 - enemyConfigurationTable[arg1].hypnosisBrainshockResist));
	battler.money = enemyConfigurationTable[arg1].money;
	battler.exp = enemyConfigurationTable[arg1].exp;
	switch (enemyConfigurationTable[arg1].initialStatus) {
		case InitialStatus.psiShield:
			shieldsCommon(battler, Status6.psiShield);
			break;
		case InitialStatus.psiShieldPower:
			shieldsCommon(battler, Status6.psiShieldPower);
			break;
		case InitialStatus.shield:
			shieldsCommon(battler, Status6.shield);
			break;
		case InitialStatus.shieldPower:
			shieldsCommon(battler, Status6.shieldPower);
			break;
		case InitialStatus.asleep:
			battler.afflictions[2] = Status2.asleep;
			break;
		case InitialStatus.cantConcentrate:
			battler.afflictions[4] = Status4.cantConcentrate4;
			break;
		case InitialStatus.strange:
			battler.afflictions[3] = Status3.strange;
			break;
		default: break;
	}
}

/// $C2B930
void battleInitPlayerStats(short arg1, Battler* battler) {
	memset(battler, 0, Battler.sizeof);
	battler.id = cast(ubyte)arg1;
	battler.sprite = 0;
	battler.consciousness = 1;
	battler.side = BattleSide.friends;
	battler.npcID = 0;
	battler.hp = partyCharacters[arg1 - 1].hp.current.integer;
	battler.hpTarget = partyCharacters[arg1 - 1].hp.target;
	battler.hpMax = partyCharacters[arg1 - 1].maxHP;
	battler.pp = partyCharacters[arg1 - 1].pp.current.integer;
	battler.ppTarget = partyCharacters[arg1 - 1].pp.target;
	battler.ppMax = partyCharacters[arg1 - 1].maxPP;
	memcpy(&battler.afflictions[0], &partyCharacters[arg1 - 1].afflictions[0], battler.afflictions.length);
	battler.offense = battler.baseOffense = partyCharacters[arg1 - 1].offense;
	battler.defense = battler.baseDefense = partyCharacters[arg1 - 1].defense;
	battler.speed = battler.baseSpeed = partyCharacters[arg1 - 1].speed;
	battler.guts = battler.baseGuts = partyCharacters[arg1 - 1].guts;
	battler.luck = battler.baseLuck = partyCharacters[arg1 - 1].luck;
	battler.vitality = partyCharacters[arg1 - 1].vitality;
	battler.iq = partyCharacters[arg1 - 1].iq;
	battler.fireResist = calcPSIDamageModifiers(partyCharacters[arg1 - 1].fireResist);
	battler.freezeResist = calcPSIDamageModifiers(partyCharacters[arg1 - 1].freezeResist);
	battler.flashResist = calcPSIResistanceModifiers(partyCharacters[arg1 - 1].flashResist);
	battler.paralysisResist = calcPSIResistanceModifiers(partyCharacters[arg1 - 1].paralysisResist);
	battler.hypnosisResist = calcPSIResistanceModifiers(partyCharacters[arg1 - 1].hypnosisBrainshockResist);
	battler.brainshockResist = calcPSIResistanceModifiers(cast(ubyte)(3 - partyCharacters[arg1 - 1].hypnosisBrainshockResist));
	battler.row = cast(ubyte)(arg1 - 1);
}

/// $C2BAC5
short countChars(BattleSide arg1) {
	short result = 0;
	for (short i = 0; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != arg1) {
			continue;
		}
		if (battlersTable[i].npcID != 0) {
			continue;
		}
		if ((battlersTable[i].afflictions[0] == Status0.unconscious) || (battlersTable[i].afflictions[0] == Status0.diamondized)) {
			continue;
		}
		result++;
	}
	return result;
}

/// $C2BB18
void checkDeadPlayers() {
	for (short i = 0; i < 6; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.friends) {
			continue;
		}
		if (battlersTable[i].npcID != 0) {
			continue;
		}
		battlersTable[i].hp = partyCharacters[battlersTable[i].row].hp.current.integer;
		battlersTable[i].pp = partyCharacters[battlersTable[i].row].pp.current.integer;
		if ((partyCharacters[battlersTable[i].row].hp.current.integer == 0) && (battlersTable[i].afflictions[0] != Status0.unconscious)) {
			currentTarget = &battlersTable[i];
			currentTarget.afflictions[0] = Status0.unconscious;
			currentTarget.afflictions[6] = 0;
			currentTarget.afflictions[5] = 0;
			currentTarget.afflictions[4] = 0;
			currentTarget.afflictions[3] = 0;
			currentTarget.afflictions[2] = 0;
			currentTarget.afflictions[1] = 0;
			fixTargetName();
			short x16 = windowTable[Window.textBattle];
			createWindow(Window.textBattle);
			displayInBattleText(getTextBlock("MSG_BTL_KIZETU_ON"));
			if (x16 == -1) {
				closeFocusWindow();
			}
		}
		for (short j = 0; j < 7; j++) {
			partyCharacters[battlersTable[i].row].afflictions[j] = battlersTable[i].afflictions[j];
		}
		if (partyCharacters[battlersTable[i].row].afflictions[4] != 0) {
			partyCharacters[battlersTable[i].row].afflictions[4] = Status4.cantConcentrate4;
		}
		updateParty();
	}
}

/// $C2BC5C
void resetPostBattleStats() {
	for (short i = 0; i < 6; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.friends) {
			continue;
		}
		if (battlersTable[i].npcID != 0) {
			continue;
		}
		partyCharacters[battlersTable[i].row].afflictions[6] = 0;
		partyCharacters[battlersTable[i].row].afflictions[4] = 0;
		partyCharacters[battlersTable[i].row].afflictions[3] = 0;
		partyCharacters[battlersTable[i].row].afflictions[2] = 0;
	}
}

/// $C2BCB9
void unknownC2BCB9(Battler* battler, short arg2) {
	setPP(battler, (arg2 > battler.ppTarget) ? 0 : cast(ushort)(battler.ppTarget - arg2));
}

/// $C2BCE6
void loseHPStatus(Battler* battler, short arg2) {
	setHP(battler, (arg2 > battler.hpTarget) ? 0 : cast(ushort)(battler.hpTarget - arg2));
}

/// $C2BD13
short unknownC2BD13() {
	short x02 = 0;
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness != 1) {
			continue;
		}
		x02 += getBattleSpriteWidth(battlersTable[i].sprite);
	}
	return x02;
}

/// $C2BD5E
void callForHelpCommon(short sowingSeeds) {
	if (currentAttacker.side != BattleSide.friends) {
		const(BattleGroupEnemy)* x06 = &battleEntryPointerTable[currentBattleGroup].enemies[0];
		while (x06.count != 0xFF) {
			if (x06.enemyID == currentAttacker.currentActionArgument) {
				goto Success;
			}
			x06++;
		}
	}
	Failure:
	if (sowingSeeds != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_TANEMAKI_NO"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_NAKAMA_NO"));
	}
	return;
	Success:
	short x24 = 0;
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness != 1) {
			continue;
		}
		if (battlersTable[i].afflictions[0] == Status0.unconscious) {
			continue;
		}
		if (battlersTable[i].originalID != currentAttacker.currentActionArgument) {
			continue;
		}
		x24++;
	}
	if (success255(cast(short)(((enemyConfigurationTable[currentAttacker.currentActionArgument].maxCalled - x24) * 205) / enemyConfigurationTable[currentAttacker.currentActionArgument].maxCalled)) == 0) {
		goto Failure;
	}
	short x1E = cast(short)((getBattleSpriteWidth(enemyConfigurationTable[currentAttacker.currentActionArgument].battleSprite) * 8) + 16);
	short x1C = enemyConfigurationTable[currentAttacker.currentActionArgument].row;
	if (getBattleSpriteWidth(enemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) + unknownC2BD13() <= 32) {
		short x1A = 0x80;
		short x18 = 0x80;
		short x04 = 0x80;
		short x16 = 0x80;
		for (short i = 8; i < battlersTable.length; i++) {
			if (battlersTable[i].consciousness == 0) {
				continue;
			}
			if (battlersTable[i].row == enemyConfigurationTable[currentTarget.currentActionArgument].row) {
				if (battlersTable[i].spriteX - ((getBattleSpriteWidth(enemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2) < x16) {
					x16 = cast(short)(battlersTable[i].spriteX - ((getBattleSpriteWidth(enemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2));
				}
				if (battlersTable[i].spriteX + ((getBattleSpriteWidth(enemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2) > x04) {
					x04 = cast(short)(battlersTable[i].spriteX + ((getBattleSpriteWidth(enemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2));
				}
			} else {
				if (battlersTable[i].spriteX - ((getBattleSpriteWidth(enemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2) < x18) {
					x18 = cast(short)(battlersTable[i].spriteX - ((getBattleSpriteWidth(enemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2));
				}
				if (battlersTable[i].spriteX + ((getBattleSpriteWidth(enemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2) > x1A) {
					x1A = cast(short)(battlersTable[i].spriteX + ((getBattleSpriteWidth(enemyConfigurationTable[currentTarget.currentActionArgument].battleSprite) * 8) / 2));
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
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness != 1) {
			continue;
		}
		if (battlersTable[i].afflictions[0] != Status0.unconscious) {
			continue;
		}
		if (getBattleSpriteWidth(enemyConfigurationTable[currentAttacker.currentActionArgument].battleSprite) != getBattleSpriteWidth(battlersTable[i].sprite)) {
			continue;
		}
		battlersTable[i].consciousness = 0;
		x24 = battlersTable[i].spriteX;
		x1C = battlersTable[i].row;
	}
	Unknown25:
	if (getBattleSpriteWidth(enemyConfigurationTable[currentAttacker.currentActionArgument].battleSprite) + unknownC2BD13() > battlersTable.length) {
		goto Failure;
	}
	Battler* x22 = &battlersTable[8];
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			break;
		}
		x22++;
	}
	currentTarget = x22;
	battleInitEnemyStats(currentAttacker.currentActionArgument, currentTarget);
	currentTarget.spriteX = cast(ubyte)x24;
	currentTarget.row = cast(ubyte)x1C;
	if (currentTarget.row != 0) {
		currentTarget.spriteY = 0x80;
	} else {
		currentTarget.spriteY = 0x90;
	}
	currentTarget.vramSpriteIndex = unknownC2F09F(currentAttacker.currentActionArgument);
	currentTarget.hasTakenTurn = 1;
	fixTargetName();
	if (sowingSeeds != 0) {
		displayInBattleText(getTextBlock("MSG_BTL_TANEMAKI_HAETA"));
	} else {
		displayInBattleText(getTextBlock("MSG_BTL_NAKAMA_KITA"));
	}
}

/// $C2C13C
void battleActionSowSeeds() {
	callForHelpCommon(1);
}

/// $C2C145
void battleActionCallForHelp() {
	callForHelpCommon(0);
}

/// $C2C14E
void battleActionRainbowOfColours() {
	ubyte x02 = currentAttacker.spriteX;
	ubyte x10 = currentAttacker.spriteY;
	battleInitEnemyStats(currentAttacker.currentActionArgument, currentAttacker);
	currentAttacker.spriteX = x02;
	currentAttacker.spriteY = x10;
	currentAttacker.vramSpriteIndex = unknownC2F09F(currentAttacker.id);
	currentAttacker.hasTakenTurn = 1;
	skipDeathTextAndCleanup = 1;
}

/// $C2C1BD
void battleActionFlyHoney() {
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		if ((battlersTable[i].id == EnemyID.masterBelch3) || (battlersTable[i].id == EnemyID.masterBelch1)) {
			battlersTable[i].id = EnemyID.masterBelch2;
			displayInBattleText(getTextBlock("MSG_BTL_G_HAEMITU_G"));
		}
	}
	displayInBattleText(getTextBlock("MSG_BTL_G_HAEMITU_NG"));
}

/// $C2C21F
void switchToNewGiygasBattle(short group, short music) {
	short x10 = 0;
	// skip the static fade for the final giygas transition
	if ((battleModeFlag != 0) || (group == EnemyGroup.bossGiygasPhaseFinal)) {
		x10 = 1;
	}
	if (x10 == 0) {
		startSwirlPadded(Swirl.staticWipe, AnimationFlags.reverse, 30);
		while (unknownC2E9C8() != 0) {
			windowTick();
		}
	}
	currentBattleGroup = group;
	prepareForImmediateDMA();
	setBattleModeLayerConfig();
	prepareWindowGraphics();
	loadWindowGraphics(WindowGraphicsToLoad.all);
	loadBattleBG(battleEntryBGTable[currentBattleGroup].layer1, battleEntryBGTable[currentBattleGroup].layer2, cast(ushort)battleEntryPointerTable[currentBattleGroup].letterboxStyle);
	unknownC2EEE7();
	preparePaletteUpload(PaletteUpload.full);
	drawBattleSprites();
	battleModeFlag = 1;
	if (music != 0) {
		changeMusic(music);
	}
	setForceBlank();
	if (x10 != 0) {
		fadeIn(1, 4);
		tickUntilFadeCompletion();
		return;
	}
	fadeIn(15, 1);
	// skip the static fade for the final giygas transition
	if (group == EnemyGroup.bossGiygasPhaseFinal) {
		return;
	}
	startSwirlPadded(Swirl.staticWipe, AnimationFlags.none, 5);
	while (unknownC2E9C8() != 0) {
		windowTick();
	}
}

/** Transforms battler 8 into a new enemy while preserving its positioning
 * Original_Address: $(DOLLAR)C2C32C
 */
void giygasTransformBattler8(short newEnemy) {
	ubyte x10 = battlersTable[8].spriteX;
	ubyte x04 = battlersTable[8].spriteY;
	battleInitEnemyStats(newEnemy, &battlersTable[8]);
	battlersTable[8].spriteX = x10;
	battlersTable[8].spriteY = x04;
	battlersTable[8].hasTakenTurn = 1;
}

/** Fades out, runs text script (does not open window), fades out, switches to the specified enemy group with specified music then resumes the battle
 * Params:
 * 	group = Enemy group to spawn
 * 	music = Music track to switch to
 * 	text = Text script to run
 * Original_Address: $(DOLLAR)C2C37A
 */
void giygasTextNewPhase(short group, short music, const(ubyte)* text) {
	fadeOut(1, 4);
	tickUntilFadeCompletion();
	battleModeFlag = 0;
	currentMapMusicTrack = 0;
	closeAllWindowsAndHPPP();
	displayInBattleText(text);
	fadeOut(1, 2);
	tickUntilFadeCompletion();
	switchToNewGiygasBattle(group, music);
	battleModeFlag = 1;
	showHPPPWindowsF();
	createWindow(Window.textBattle);
	wait(1 * 60);
}

/// $C2C3E2
void giygasHurtPrayer(short damage) {
	wait(1 * 60);
	currentTarget = &battlersTable[8];
	fixTargetName();
	greenFlashDuration = 1 * 60;
	isSmaaaashAttack = 1;
	calcResistDamage(twentyFivePercentVariance(damage), 0xFF);
	wait(1 * 60);
}

/** Fades to black, cleans up the screen, switches to the quieter 'giygas weakened' music track, opens a standard text window for the specified text, switches to the specified music, then resumes the battle
 * Params:
 * 	finalMusic = The music to start playing after the text script is complete
 * 	textScript = The text script to run after the screen turns black
 * Original_Address: $(DOLLAR)C2C41F
 */
void giygasWeakText(short finalMusic, const(ubyte)* textScript) {
	fadeOut(1, 1);
	musicEffect(MusicEffect.quickFade);
	tickUntilFadeCompletion();
	battleModeFlag = 0;
	closeAllWindowsAndHPPP();
	mirrorTM = TMTD.bg3;
	changeMusic(Music.giygasWeakened);
	fadeIn(1, 1);
	tickUntilFadeCompletion();
	wait(20);
	displayInBattleText(textScript);
	battleModeFlag = 1;
	wait(20);
	musicEffect(MusicEffect.quickFade);
	fadeOut(1, 1);
	tickUntilFadeCompletion();
	showHPPPWindowsF();
	createWindow(Window.textBattle);
	mirrorTM = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
	changeMusic(finalMusic);
	fadeIn(1, 1);
	tickUntilFadeCompletion();
}

/// $C2C4C0
void battleActionPokeySpeech() {
	currentGiygasPhase = GiygasPhase.devilsMachineOff;
	giygasTransformBattler8(EnemyID.giygas3);
	switchToNewGiygasBattle(EnemyGroup.bossGiygasPhase1, Music.giygasPhase1);
	displayInBattleText(getTextBlock("MSG_BTL_MECHPOKEY_1_TALK_B"));
	battlersTable[9].consciousness = 0;
	currentGiygasPhase = GiygasPhase.giygasStartsAttacking;
	nullC3FDC5();
	giygasTransformBattler8(EnemyID.giygas4);
	switchToNewGiygasBattle(EnemyGroup.bossGiygasPhase2, Music.giygasPhase2);
	skipDeathTextAndCleanup = 1;
}

/// $C2C513
void battleActionNull12() {
	//nothing
}

/// $C2C516
void battleActionPokeySpeech2() {
	currentGiygasPhase = GiygasPhase.startPraying;
	wait(2 * 60);
	battlersTable[9].consciousness = 1;
	drawBattleSprites();
	displayInBattleText(getTextBlock("MSG_BTL_MECHPOKEY_2_TALK_2"));
	battlersTable[9].consciousness = 0;
	drawBattleSprites();
	wait(1 * 60);
	giygasTransformBattler8(EnemyID.giygas5);
	switchToNewGiygasBattle(EnemyGroup.bossGiygasPhaseDuringPrayer1, Music.giygasPhase3);
	skipDeathTextAndCleanup = 1;
}

/** The first giygas prayer scene. Plays the scene, then switches the battle to the next giygas phase
 * Original_Address: $(DOLLAR)C2C572
 */
void battleActionGiygasPrayer1() {
	giygasTextNewPhase(EnemyGroup.bossGiygasPhaseAfterPrayer1, Music.giygasPhase3, getTextBlock("MSG_EVT_PRAY_7_DOSEI"));
	wait(2 * 60);
	playSfx(Sfx.psiStarstorm);
	wait(1 * 60);
	verticalShakeDuration = 1 * 60;
	verticalShakeHoldDuration = 12;
	displayInBattleText(getTextBlock("MSG_BTL_INORU_DAMAGE_1"));
	currentGiygasPhase = GiygasPhase.prayer1Used;
	giygasTransformBattler8(EnemyID.giygas6);
	switchToNewGiygasBattle(EnemyGroup.bossGiygasPhaseAfterPrayer1, Music.none);
}

/** The 2nd prayer scene. Reloads the enemies, plays a scene, pretends to do some damage and moves on to the next battle phase
 * Original_Address: $(DOLLAR)C2C5D1
 */
void battleActionGiygasPrayer2() {
	giygasTextNewPhase(EnemyGroup.bossGiygasPhaseAfterPrayer1, Music.giygasPhase3, getTextBlock("MSG_EVT_PRAY_2_TONZURA"));
	giygasHurtPrayer(50);
	currentGiygasPhase = GiygasPhase.prayer2Used;
}

/** The 3rd prayer scene. Reloads the enemies, plays a scene, pretends to do some damage and moves on to the next battle phase
 * Original_Address: $(DOLLAR)C2C5FA
 */
void battleActionGiygasPrayer3() {
	giygasTextNewPhase(EnemyGroup.bossGiygasPhaseAfterPrayer1, Music.giygasPhase3, getTextBlock("MSG_EVT_PRAY_3_PAULA_PAPA"));
	giygasHurtPrayer(100);
	currentGiygasPhase = GiygasPhase.prayer3Used;
}

/** The 4th prayer scene. Reloads the enemies, plays a scene, pretends to do some damage and moves on to the next battle phase
 * Original_Address: $(DOLLAR)C2C623
 */
void battleActionGiygasPrayer4() {
	giygasTextNewPhase(EnemyGroup.bossGiygasPhaseAfterPrayer1, Music.giygasPhase3, getTextBlock("MSG_EVT_PRAY_4_TONY"));
	giygasHurtPrayer(200);
	currentGiygasPhase = GiygasPhase.prayer4Used;
}

/** The 5th prayer scene. Reloads the enemies, plays a scene, pretends to do some damage and moves on to the next battle phase
 * Original_Address: $(DOLLAR)C2C64C
 */
void battleActionGiygasPrayer5() {
	giygasTextNewPhase(EnemyGroup.bossGiygasPhaseAfterPrayer1, Music.giygasPhase3, getTextBlock("MSG_EVT_PRAY_5_RAMA"));
	giygasHurtPrayer(400);
	currentGiygasPhase = GiygasPhase.prayer5Used;
}

/** The 6th prayer scene. Reloads the enemies, plays a scene, pretends to do some damage and moves on to the next battle phase
 * Original_Address: $(DOLLAR)C2C675
 */
void battleActionGiygasPrayer6() {
	giygasTextNewPhase(EnemyGroup.bossGiygasPhaseAfterPrayer1, Music.giygasPhase3, getTextBlock("MSG_EVT_PRAY_6_FRANK"));
	giygasHurtPrayer(800);
	currentGiygasPhase = GiygasPhase.prayer6Used;
}

/** The 7th prayer scene. Reloads the enemies, plays a scene, pretends to do some damage and moves on to the next battle phase. Also switches to a new giygas group
 * Original_Address: $(DOLLAR)C2C69E
 */
void battleActionGiygasPrayer7() {
	giygasTextNewPhase(EnemyGroup.bossGiygasPhaseAfterPrayer1, Music.giygasPhase3, getTextBlock("MSG_EVT_PRAY_1_NES_MAMA"));
	giygasHurtPrayer(1600);
	currentGiygasPhase = GiygasPhase.prayer7Used;
	switchToNewGiygasBattle(EnemyGroup.bossGiygasPhaseAfterPrayer7, Music.giygasWeakened2);
}

/** The 8th prayer scene. Sorry, nobody's left. Nothing happens
 * Original_Address: $(DOLLAR)C2C6D0
 */
void battleActionGiygasPrayer8() {
	giygasWeakText(Music.giygasWeakened2, getTextBlock("MSG_BTL_INORU_BACK_TO_PC_8"));
	currentGiygasPhase = GiygasPhase.prayer8Used;
}

/** The final prayer scene. Pretends to do ridiculous amounts of damage, then starts the giygas death scene
 * Original_Address: $(DOLLAR)C2C6F0
 */
void battleActionGiygasPrayer9() {
	resetRolling();
	giygasWeakText(Music.giygasWeakened2, getTextBlock("MSG_BTL_INORU_BACK_TO_PC_9"));
	giygasHurtPrayer(3200);
	giygasWeakText(Music.giygasWeakened2, getTextBlock("MSG_BTL_INORU_BACK_TO_PC_F_1"));
	giygasHurtPrayer(6400);
	giygasWeakText(Music.giygasWeakened2, getTextBlock("MSG_BTL_INORU_BACK_TO_PC_F_2"));
	giygasHurtPrayer(12800);
	giygasWeakText(Music.giygasWeakened2, getTextBlock("MSG_BTL_INORU_BACK_TO_PC_F_3"));
	giygasHurtPrayer(25600);
	closeFocusWindow();
	battleModeFlag = 0;
	windowTick();
	currentGiygasPhase = GiygasPhase.defeated;
	changeMusic(Music.giygasDeath);
	short x18 = 0;
	while (true) {
		playSfx(finalGiygasPrayerNoiseTable[x18].sfx);
		if (finalGiygasPrayerNoiseTable[x18].duration == 0) {
			break;
		}
		wait(finalGiygasPrayerNoiseTable[x18++].duration);
	}
	changeMusic(Music.giygasDeath2);
	currentGiygasPhase = 0;
	wait(8 * 60);
	battlersTable[9].consciousness = 1;
	drawBattleSprites();
	displayInBattleText(getTextBlock("MSG_BTL_POKEY_RUN_AWAY"));
	battlersTable[9].consciousness = 0;
	drawBattleSprites();
	wait(1 * 60);
	short staticEffect = 2;
	short x04 = 2;
	short x02 = 45;
	verticalShakeDuration = 1 * 60;
	for (short i = 0; giygasDeathStaticTransitionDelays[i] != 0; i++) {
		for (short j = 0; j < giygasDeathStaticTransitionDelays[i]; j++) {
			windowTick();
			if (x04 == 0) {
				continue;
			}
			if (--x02 != 0) {
				continue;
			}
			x04--;
			x02 = 45;
			verticalShakeDuration = 1 * 60;
		}
		giygasSwapDeathDistortion();
		setStatic(staticEffect);
		// switch to the other static effect
		if (staticEffect == 2) {
			staticEffect = 1;
		} else {
			staticEffect = 2;
		}
	}
	changeMusic(Music.giygasStatic);
	wait(10 * 60);
	playSfx(Sfx.psiThunderDamage);
	stopMusic();
	startSwirlPadded(Swirl.enemyAttack, AnimationFlags.none, 5);
	while (unknownC2E9C8() != 0) {
		windowTick();
	}
	stopMusic();
	switchToNewGiygasBattle(EnemyGroup.bossGiygasPhaseFinal, Music.none);
	wait(8 * 60);
	specialDefeat = SpecialDefeat.giygasDefeated;
}

/// $C2C8C8
void setBattleModeLayerConfig() {
	setBGMODE(BGMode.mode1 | BG3Priority);
	setBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
	setBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x1000);
	setBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
	setOAMSize(0x61);
	copyToVRAM(3, 0x800, 0x7C00, &buffer[0x8000]);
}

/// $C2C92D
void generateBattleBGFrame(LoadedBackgroundData* arg1, short layer) {
	short x19 = arg1.targetLayer;
	if (arg1.freezePaletteScrolling == 0) {
		if ((arg1.paletteChangeDurationLeft != 0) && (--arg1.paletteChangeDurationLeft == 0)) {
			arg1.paletteChangeDurationLeft = arg1.paletteChangeSpeed;
			switch (arg1.paletteShiftingStyle) {
				case PaletteShiftingStyle.unknown2:
					short x02 = cast(short)(arg1.paletteCycle2Last - arg1.paletteCycle2First + 1);
					for (short i = 0; i != x02; i++) {
						short x14;
						if (i < arg1.paletteCycle2Step) {
							x14 = cast(short)(i + x02 - arg1.paletteCycle2Step);
						} else {
							x14 = cast(short)(i - arg1.paletteCycle2Step);
						}
						arg1.palettePointer[0][arg1.paletteCycle2First + i] = arg1.palette[arg1.paletteCycle2First + x14];
					}
					if (++arg1.paletteCycle2Step >= x02) {
						arg1.paletteCycle2Step = 0;
					}
					goto case;
				case PaletteShiftingStyle.unknown1:
					short x02 = cast(short)(arg1.paletteCycle1Last - arg1.paletteCycle1First + 1);
					for (short i = 0; i != x02; i++) {
						short x14;
						if (i < arg1.paletteCycle1Step) {
							x14 = cast(short)(i + x02 - arg1.paletteCycle1Step);
						} else {
							x14 = cast(short)(i - arg1.paletteCycle1Step);
						}
						arg1.palettePointer[0][arg1.paletteCycle1First + i] = arg1.palette[arg1.paletteCycle1First + x14];
					}
					if (++arg1.paletteCycle1Step >= x02) {
						arg1.paletteCycle1Step = 0;
					}
					break;
				case PaletteShiftingStyle.unknown3:
					short x10 = cast(short)(arg1.paletteCycle1Last - arg1.paletteCycle1First + 1);
					for (short i = 0; i < x10; i++) {
						short x14 = cast(short)(arg1.paletteCycle1Step + i);
						if (x14 >= x10 * 2) {
							x14 -= x10 * 2;
						}
						if (x14 >= x10) {
							x14 = cast(short)(x10 * 2 - 1 - x14);
						}
						arg1.palettePointer[0][arg1.paletteCycle1First + i] = arg1.palette[arg1.paletteCycle1First + x14];
					}
					arg1.paletteCycle1Step++;
					if (arg1.paletteCycle1Step >= x10 * 2) {
						arg1.paletteCycle1Step = 0;
					}
					break;
				default: break;
			}
			preparePaletteUpload(PaletteUpload.full);
		}
		if (currentGiygasPhase == GiygasPhase.defeated) {
			return;
		}
		if ((arg1.scrollingDurationLeft != 0) && (--arg1.scrollingDurationLeft == 0)) {
			arg1.currentScrollingMovement = (arg1.currentScrollingMovement + 1) & 3;
			short x10 = arg1.scrollingMovements[arg1.currentScrollingMovement];
			if (x10 == 0) {
				arg1.currentScrollingMovement = 0;
				x10 = arg1.scrollingMovements[0];
			}
			if (x10 != 0) {
				tracef("Switching to scrolling movement %s", backgroundScrollingTable[x10]);
				arg1.scrollingDurationLeft = backgroundScrollingTable[x10].duration;
				arg1.horizontalVelocity = backgroundScrollingTable[x10].horizontalVelocity;
				arg1.verticalVelocity = backgroundScrollingTable[x10].verticalVelocity;
				arg1.horizontalAcceleration = backgroundScrollingTable[x10].horizontalAcceleration;
				arg1.verticalAcceleration = backgroundScrollingTable[x10].verticalAcceleration;
			}
		}
		arg1.horizontalVelocity += arg1.horizontalAcceleration;
		arg1.horizontalPosition += arg1.horizontalVelocity;
		arg1.verticalVelocity += arg1.verticalAcceleration;
		arg1.verticalPosition += arg1.verticalVelocity;
		switch (x19) {
			case BGLayer.layer1:
				bg1XPosition = cast(short)((arg1.horizontalPosition >> 8) + screenEffectHorizontalOffset);
				bg1YPosition = cast(short)((arg1.verticalPosition >> 8) + screenEffectVerticalOffset);
				break;
			case BGLayer.layer2:
				bg2XPosition = cast(short)((arg1.horizontalPosition >> 8) + screenEffectHorizontalOffset);
				bg2YPosition = cast(short)((arg1.verticalPosition >> 8) + screenEffectVerticalOffset);
				break;
			case BGLayer.layer3:
				bg3XPosition = cast(short)((arg1.horizontalPosition >> 8) + screenEffectHorizontalOffset);
				bg3YPosition = cast(short)((arg1.verticalPosition >> 8) + screenEffectVerticalOffset);
				break;
			case BGLayer.layer4:
				bg4XPosition = cast(short)((arg1.horizontalPosition >> 8) + screenEffectHorizontalOffset);
				bg4YPosition = cast(short)((arg1.verticalPosition >> 8) + screenEffectVerticalOffset);
				break;
			default: break;
		}
	}
	if ((arg1.distortionDurationLeft != 0) && (--arg1.distortionDurationLeft == 0)) {
		arg1.currentDistortionIndex = (arg1.currentDistortionIndex + 1) & 3;
		short x10 = arg1.distortionStyles[arg1.currentDistortionIndex];
		if (x10 == 0) {
			arg1.currentDistortionIndex = 0;
			x10 = arg1.distortionStyles[0];
		}
		if (x10 != 0) {
			tracef("Switching to distortion %s", backgroundDistortionTable[x10]);
			arg1.distortionDurationLeft = backgroundDistortionTable[x10].duration;
			arg1.distortionType = cast(ubyte)backgroundDistortionTable[x10].style;
			arg1.distortionRippleFrequency = backgroundDistortionTable[x10].rippleFrequency;
			arg1.distortionRippleAmplitude = backgroundDistortionTable[x10].rippleAmplitude;
			arg1.distortionSpeed = backgroundDistortionTable[x10].speed;
			arg1.distortionCompressionRate = backgroundDistortionTable[x10].compressionRate;
			arg1.distortionRippleFrequencyAcceleration = backgroundDistortionTable[x10].rippleFrequencyAcceleration;
			arg1.distortionRippleAmplitudeAcceleration = backgroundDistortionTable[x10].rippleAmplitudeAcceleration;
			arg1.distortionSpeedAcceleration = backgroundDistortionTable[x10].speedAcceleration;
			arg1.distortionCompressionAcceleration = backgroundDistortionTable[x10].compressionRateAcceleration;
			if (arg1.distortionType == DistortionStyle.verticalSmooth) {
				doBackgroundDMA(cast(short)(layer + 5), cast(short)(x19 + 4), layer);
			} else {
				doBackgroundDMA(cast(short)(layer + 5), x19, layer);
			}
		}
	}
	if (arg1.distortionType == 0) {
		return;
	}
	arg1.distortionRippleFrequency += arg1.distortionRippleFrequencyAcceleration;
	arg1.distortionRippleAmplitude += arg1.distortionRippleAmplitudeAcceleration;
	arg1.distortionSpeed += arg1.distortionSpeedAcceleration;
	arg1.distortionCompressionRate += arg1.distortionCompressionAcceleration;
	loadBackgroundOffsetParameters(cast(short)(arg1.distortionType - 1), x19, layer);
	loadBackgroundOffsetParameters2(arg1.distortionCompressionRate);
	if (((frameCounter & 1) == layer) || (distort30FPS == 0)) {
		prepareBackgroundOffsetTables(arg1.distortionRippleFrequency, (cast(ushort)arg1.distortionRippleAmplitude) >> 8, arg1.distortionSpeed);
	}
}

unittest {
	static ushort[16] palette;
	LoadedBackgroundData bgData;
	{
		const baseBG = AnimatedBackground(0x04, 0x04, 4, PaletteShiftingStyle.unknown1, 0x02, 0x0F, 0x00, 0x00, 0x08, [0x46, 0x47, 0x00, 0x00], [0x49, 0x00, 0x00, 0x00]);
		loadBackgroundAnimationInfo(&bgData, &baseBG);
		bgData.palettePointer = &palette;
		bgData.targetLayer = 2;
		generateBattleBGFrame(&bgData, 0);
		assert(backgroundHDMABuffer[0 .. 224] == [0x0001, 0xFFFE, 0x0003, 0xFFFD, 0x0004, 0xFFFB, 0x0006, 0xFFF9, 0x0007, 0xFFF8, 0x0009, 0xFFF6, 0x000A, 0xFFF5, 0x000C, 0xFFF4, 0x000D, 0xFFF2, 0x000F, 0xFFF1, 0x0010, 0xFFEF, 0x0011, 0xFFEE, 0x0013, 0xFFED, 0x0014, 0xFFEC, 0x0015, 0xFFEA, 0x0016, 0xFFE9, 0x0017, 0xFFE8, 0x0018, 0xFFE7, 0x0019, 0xFFE6, 0x001A, 0xFFE5, 0x001B, 0xFFE5, 0x001C, 0xFFE4, 0x001C, 0xFFE3, 0x001D, 0xFFE3, 0x001E, 0xFFE2, 0x001E, 0xFFE2, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE2, 0x001E, 0xFFE2, 0x001E, 0xFFE3, 0x001D, 0xFFE3, 0x001C, 0xFFE4, 0x001C, 0xFFE5, 0x001B, 0xFFE5, 0x001A, 0xFFE6, 0x0019, 0xFFE7, 0x0018, 0xFFE8, 0x0017, 0xFFE9, 0x0016, 0xFFEA, 0x0015, 0xFFEC, 0x0014, 0xFFED, 0x0013, 0xFFEE, 0x0011, 0xFFEF, 0x0010, 0xFFF1, 0x000F, 0xFFF2, 0x000D, 0xFFF4, 0x000C, 0xFFF5, 0x000A, 0xFFF6, 0x0009, 0xFFF8, 0x0007, 0xFFF9, 0x0006, 0xFFFB, 0x0004, 0xFFFD, 0x0003, 0xFFFE, 0x0001, 0x0000, 0x0000, 0x0001, 0xFFFE, 0x0003, 0xFFFD, 0x0004, 0xFFFB, 0x0006, 0xFFFA, 0x0007, 0xFFF8, 0x0009, 0xFFF6, 0x000A, 0xFFF5, 0x000C, 0xFFF4, 0x000D, 0xFFF2, 0x000F, 0xFFF1, 0x0010, 0xFFEF, 0x0011, 0xFFEE, 0x0013, 0xFFED, 0x0014, 0xFFEB, 0x0015, 0xFFEA, 0x0016, 0xFFE9, 0x0017, 0xFFE8, 0x0018, 0xFFE7, 0x0019, 0xFFE6, 0x001A, 0xFFE5, 0x001B, 0xFFE4, 0x001C, 0xFFE4, 0x001D, 0xFFE3, 0x001E, 0xFFE2, 0x001E, 0xFFE2, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE0, 0x0020, 0xFFE0, 0x0020, 0xFFE0, 0x0020, 0xFFE0, 0x0020, 0xFFE0, 0x0020, 0xFFE0, 0x0020, 0xFFE0, 0x0020, 0xFFE0, 0x0020, 0xFFE0, 0x001F, 0xFFE1, 0x001F, 0xFFE1, 0x001F, 0xFFE2, 0x001E, 0xFFE2, 0x001E, 0xFFE3, 0x001D, 0xFFE4, 0x001C, 0xFFE4, 0x001B, 0xFFE5, 0x001A, 0xFFE6, 0x0019, 0xFFE7, 0x0018, 0xFFE8, 0x0017, 0xFFE9, 0x0016]);
	}
	{
		const baseBG = AnimatedBackground(0x04, 0x0A, 4, PaletteShiftingStyle.unknown1, 0x02, 0x0F, 0x00, 0x00, 0x09, [0x30, 0x00, 0x00, 0x00], [0x1E, 0x00, 0x00, 0x00]);
		loadBackgroundAnimationInfo(&bgData, &baseBG);
		bgData.palettePointer = &palette;
		bgData.targetLayer = 2;
		generateBattleBGFrame(&bgData, 0);
		assert(backgroundHDMABuffer[0 .. 224] == [0x0000, 0xFFFF, 0x0002, 0xFFFD, 0x0003, 0xFFFC, 0x0005, 0xFFFA, 0x0006, 0xFFF9, 0x0008, 0xFFF8, 0x0009, 0xFFF6, 0x000A, 0xFFF5, 0x000B, 0xFFF4, 0x000C, 0xFFF3, 0x000D, 0xFFF2, 0x000E, 0xFFF2, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF2, 0x000E, 0xFFF2, 0x000D, 0xFFF3, 0x000C, 0xFFF4, 0x000B, 0xFFF5, 0x000A, 0xFFF6, 0x0009, 0xFFF8, 0x0008, 0xFFF9, 0x0006, 0xFFFA, 0x0005, 0xFFFC, 0x0003, 0xFFFD, 0x0002, 0xFFFF, 0x0000, 0x0000, 0xFFFF, 0x0002, 0xFFFD, 0x0003, 0xFFFC, 0x0005, 0xFFFA, 0x0006, 0xFFF9, 0x0008, 0xFFF7, 0x0009, 0xFFF6, 0x000B, 0xFFF5, 0x000C, 0xFFF4, 0x000D, 0xFFF3, 0x000E, 0xFFF2, 0x000E, 0xFFF1, 0x000F, 0xFFF1, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF1, 0x000F, 0xFFF1, 0x000E, 0xFFF2, 0x000E, 0xFFF3, 0x000D, 0xFFF4, 0x000C, 0xFFF5, 0x000B, 0xFFF6, 0x0009, 0xFFF7, 0x0008, 0xFFF9, 0x0006, 0xFFFA, 0x0005, 0xFFFC, 0x0003, 0xFFFD, 0x0002, 0xFFFF, 0x0000, 0x0000, 0xFFFF, 0x0002, 0xFFFD, 0x0003, 0xFFFC, 0x0005, 0xFFFA, 0x0006, 0xFFF9, 0x0008, 0xFFF8, 0x0009, 0xFFF6, 0x000A, 0xFFF5, 0x000B, 0xFFF4, 0x000C, 0xFFF3, 0x000D, 0xFFF2, 0x000E, 0xFFF2, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF2, 0x000E, 0xFFF2, 0x000D, 0xFFF3, 0x000C, 0xFFF4, 0x000B, 0xFFF5, 0x000A, 0xFFF6, 0x0009, 0xFFF8, 0x0008, 0xFFF9, 0x0006, 0xFFFA, 0x0005, 0xFFFC, 0x0003, 0xFFFD, 0x0002, 0xFFFF, 0x0000, 0x0000, 0xFFFF, 0x0002, 0xFFFD, 0x0003, 0xFFFC, 0x0005, 0xFFFA, 0x0006, 0xFFF9, 0x0008, 0xFFF7, 0x0009, 0xFFF6, 0x000B, 0xFFF5, 0x000C, 0xFFF4, 0x000D, 0xFFF3, 0x000E, 0xFFF2, 0x000E, 0xFFF1, 0x000F, 0xFFF1, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010]);
		generateBattleBGFrame(&bgData, 0);
		assert(backgroundHDMABuffer[0 .. 224] == [0x0001, 0xFFFE, 0x0003, 0xFFFD, 0x0004, 0xFFFB, 0x0006, 0xFFFA, 0x0007, 0xFFF8, 0x0008, 0xFFF7, 0x000A, 0xFFF6, 0x000B, 0xFFF5, 0x000C, 0xFFF4, 0x000D, 0xFFF3, 0x000E, 0xFFF2, 0x000E, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000E, 0xFFF2, 0x000E, 0xFFF3, 0x000D, 0xFFF4, 0x000C, 0xFFF5, 0x000B, 0xFFF6, 0x000A, 0xFFF7, 0x0008, 0xFFF8, 0x0007, 0xFFFA, 0x0006, 0xFFFB, 0x0004, 0xFFFD, 0x0003, 0xFFFE, 0x0001, 0x0000, 0x0000, 0x0001, 0xFFFE, 0x0003, 0xFFFD, 0x0004, 0xFFFB, 0x0006, 0xFFFA, 0x0007, 0xFFF8, 0x0009, 0xFFF7, 0x000A, 0xFFF5, 0x000B, 0xFFF4, 0x000C, 0xFFF3, 0x000D, 0xFFF2, 0x000E, 0xFFF2, 0x000F, 0xFFF1, 0x000F, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x000F, 0xFFF1, 0x000F, 0xFFF2, 0x000E, 0xFFF2, 0x000D, 0xFFF3, 0x000C, 0xFFF4, 0x000B, 0xFFF5, 0x000A, 0xFFF7, 0x0009, 0xFFF8, 0x0007, 0xFFFA, 0x0006, 0xFFFB, 0x0004, 0xFFFD, 0x0003, 0xFFFE, 0x0001, 0x0000, 0x0000, 0x0001, 0xFFFE, 0x0003, 0xFFFD, 0x0004, 0xFFFB, 0x0006, 0xFFFA, 0x0007, 0xFFF8, 0x0008, 0xFFF7, 0x000A, 0xFFF6, 0x000B, 0xFFF5, 0x000C, 0xFFF4, 0x000D, 0xFFF3, 0x000E, 0xFFF2, 0x000E, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000E, 0xFFF2, 0x000E, 0xFFF3, 0x000D, 0xFFF4, 0x000C, 0xFFF5, 0x000B, 0xFFF6, 0x000A, 0xFFF7, 0x0008, 0xFFF8, 0x0007, 0xFFFA, 0x0006, 0xFFFB, 0x0004, 0xFFFD, 0x0003, 0xFFFE, 0x0001, 0x0000, 0x0000, 0x0001, 0xFFFE, 0x0003, 0xFFFD, 0x0004, 0xFFFB, 0x0006, 0xFFFA, 0x0007, 0xFFF8, 0x0009, 0xFFF7, 0x000A, 0xFFF5, 0x000B, 0xFFF4, 0x000C, 0xFFF3, 0x000D, 0xFFF2, 0x000E, 0xFFF2, 0x000F, 0xFFF1, 0x000F, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010]);
		generateBattleBGFrame(&bgData, 0);
		assert(backgroundHDMABuffer[0 .. 224] == [0x0002, 0xFFFD, 0x0003, 0xFFFC, 0x0005, 0xFFFA, 0x0006, 0xFFF9, 0x0008, 0xFFF8, 0x0009, 0xFFF6, 0x000A, 0xFFF5, 0x000B, 0xFFF4, 0x000C, 0xFFF3, 0x000D, 0xFFF2, 0x000E, 0xFFF2, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF2, 0x000E, 0xFFF2, 0x000D, 0xFFF3, 0x000C, 0xFFF4, 0x000B, 0xFFF5, 0x000A, 0xFFF6, 0x0009, 0xFFF8, 0x0008, 0xFFF9, 0x0006, 0xFFFA, 0x0005, 0xFFFC, 0x0003, 0xFFFD, 0x0002, 0xFFFF, 0x0000, 0x0000, 0xFFFF, 0x0002, 0xFFFD, 0x0003, 0xFFFC, 0x0005, 0xFFFA, 0x0006, 0xFFF9, 0x0008, 0xFFF7, 0x0009, 0xFFF6, 0x000B, 0xFFF5, 0x000C, 0xFFF4, 0x000D, 0xFFF3, 0x000E, 0xFFF2, 0x000E, 0xFFF1, 0x000F, 0xFFF1, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF1, 0x000F, 0xFFF1, 0x000E, 0xFFF2, 0x000E, 0xFFF3, 0x000D, 0xFFF4, 0x000C, 0xFFF5, 0x000B, 0xFFF6, 0x0009, 0xFFF7, 0x0008, 0xFFF9, 0x0006, 0xFFFA, 0x0005, 0xFFFC, 0x0003, 0xFFFD, 0x0002, 0xFFFF, 0x0000, 0x0000, 0xFFFF, 0x0002, 0xFFFD, 0x0003, 0xFFFC, 0x0005, 0xFFFA, 0x0006, 0xFFF9, 0x0008, 0xFFF8, 0x0009, 0xFFF6, 0x000A, 0xFFF5, 0x000B, 0xFFF4, 0x000C, 0xFFF3, 0x000D, 0xFFF2, 0x000E, 0xFFF2, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF1, 0x000F, 0xFFF2, 0x000E, 0xFFF2, 0x000D, 0xFFF3, 0x000C, 0xFFF4, 0x000B, 0xFFF5, 0x000A, 0xFFF6, 0x0009, 0xFFF8, 0x0008, 0xFFF9, 0x0006, 0xFFFA, 0x0005, 0xFFFC, 0x0003, 0xFFFD, 0x0002, 0xFFFF, 0x0000, 0x0000, 0xFFFF, 0x0002, 0xFFFD, 0x0003, 0xFFFC, 0x0005, 0xFFFA, 0x0006, 0xFFF9, 0x0008, 0xFFF7, 0x0009, 0xFFF6, 0x000B, 0xFFF5, 0x000C, 0xFFF4, 0x000D, 0xFFF3, 0x000E, 0xFFF2, 0x000E, 0xFFF1, 0x000F, 0xFFF1, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010, 0xFFF0, 0x0010]);
	}
}

/// $C2CFE5
void loadBackgroundAnimationInfo(LoadedBackgroundData* target, const(AnimatedBackground)* bg) {
	memset(target, 0, LoadedBackgroundData.sizeof);
	target.bitDepth = bg.bitsPerPixel;
	target.paletteShiftingStyle = bg.paletteShiftingStyle;
	target.paletteCycle1First = bg.paletteCycle1First;
	target.paletteCycle1Last = bg.paletteCycle1Last;
	target.paletteCycle2First = bg.paletteCycle2First;
	target.paletteCycle2Last = bg.paletteCycle2Last;
	target.paletteChangeSpeed = bg.paletteChangeSpeed;
	memcpy(&target.scrollingMovements[0], &bg.scrollingMovements[0], LoadedBackgroundData.scrollingMovements.sizeof);
	memcpy(&target.distortionStyles[0], &bg.distortionStyles[0], LoadedBackgroundData.distortionStyles.sizeof);
	target.scrollingDurationLeft = 1;
	target.distortionDurationLeft = 1;
	target.paletteChangeDurationLeft = 1;
}

/// $C2D0AC
void updateLetterboxHDMATable() {
	HDMAWordTransfer* x = &letterboxHDMATable[0];

	x.scanlines = cast(ubyte)letterboxTopEnd;
	x.value = letterboxNonvisibleScreenValue;
	x++;

	short i;
	for (i = cast(short)(letterboxBottomStart - letterboxTopEnd); i >= 0x80; i -= 0x7F) {
		x.scanlines = 0x7F;
		x.value = letterboxVisibleScreenValue;
		x++;
	}

	x.scanlines = cast(ubyte)i;
	x.value = letterboxVisibleScreenValue;
	x++;

	x.scanlines = 1;
	x.value = letterboxNonvisibleScreenValue;
	x++;

	x.scanlines = 0;
}

/// $C2D121
// check this one over later
void loadBattleBG(ushort layer1, ushort layer2, ushort letterbox) {
	redFlashDuration = 0;
	greenFlashDuration = 0;
	shakeDuration = 0;
	wobbleDuration = 0;
	screenEffectMinimumWaitFrames = 0;
	verticalShakeHoldDuration = 0;
	verticalShakeDuration = 0;
	switch (letterbox) {
		case LetterboxStyle.none:
			letterboxTopEnd = 0;
			letterboxBottomStart = 224;
			break;
		case LetterboxStyle.large:
			letterboxTopEnd = 48 - 1;
			letterboxBottomStart = 224 - 48;
			break;
		case LetterboxStyle.medium:
			letterboxTopEnd = 58 - 1;
			letterboxBottomStart = 224 - 58;
			break;
		case LetterboxStyle.small:
			letterboxTopEnd = 68 - 1;
			letterboxBottomStart = 224 - 68;
			break;
		default: break;
	}
	letterboxEffectEnding = 0;
	letterboxEffectEndingBottom = 0x7000;
	letterboxEffectEndingTop = 0x7000;
	enableBackgroundDarkening = 0;
	backgroundBrightness = 0xFFFF;
	decomp(&animatedBackgroundTiles[animatedBackgrounds[layer1].graphics][0], &buffer[0]);
	if (currentBattleGroup == 0x1DE) {
		setBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x3000);
		copyToVRAM(0, 0x5000, 0x3000, &buffer[0]);
	} else {
		copyToVRAM(0, 0x2000, 0x1000, &buffer[0]);
	}
	*(cast(ushort*)&buffer[0]) = 0;
	copyToVRAM(3, 0x800, 0x5800, &buffer[0]);
	copyToVRAM(3, 0x800, 0, &buffer[0]);
	decomp(&animatedBackgroundTilemaps[animatedBackgrounds[layer1].graphics][0], &buffer[0]);
	if (animatedBackgrounds[layer1].bitsPerPixel == 4) {
		setBGMODE(BGMode.mode1 | BG3Priority);
		for (short i = 0; i < 0x800; i += 2) {
			buffer[i + 1] = (buffer[i + 1] & 0xDF) | 8;
		}
		copyToVRAM(0, 0x800, 0x5C00, &buffer[0]);
		loadBackgroundAnimationInfo(&loadedBGDataLayer1, &animatedBackgrounds[layer1]);
		loadedBGDataLayer1.palettePointer = &palettes[2];
		memcpy(&loadedBGDataLayer1.palette[0], &animatedBackgroundPalettes[animatedBackgrounds[layer1].palette][0], 32);
		memcpy(&loadedBGDataLayer1.palette2[0], &animatedBackgroundPalettes[animatedBackgrounds[layer1].palette][0], 32);
		memcpy(loadedBGDataLayer1.palettePointer, &loadedBGDataLayer1.palette[0], 32);
		loadedBGDataLayer1.targetLayer = 2;
		generateBattleBGFrame(&loadedBGDataLayer1, 0);
		loadedBGDataLayer2.targetLayer = 0;
		currentLayerConfig = LayerConfig.all;
		setLayerConfig(currentLayerConfig);
		letterboxVisibleScreenValue = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1;
		letterboxNonvisibleScreenValue = TMTD.obj | TMTD.bg3 | TMTD.bg1;
		if (layer2 != 0) {
			if ((letterbox & 4) != 0) {
				currentLayerConfig = LayerConfig.ColourBackdropBG2AddAvg;
				setLayerConfig(currentLayerConfig);
				decomp(&animatedBackgroundTiles[animatedBackgrounds[layer2].graphics][0], &buffer[0]);
				copyToVRAM(0, 0x2000, 0, &buffer[0]);
				decomp(&animatedBackgroundTilemaps[animatedBackgrounds[layer2].graphics][0], &buffer[0]);
				for (short i = 0; i < 0x800; i += 2) {
					buffer[i + 1] = (buffer[i + 1] & 0xDF) | 16;
				}
				copyToVRAM(0, 0x800, 0x5800, &buffer[0]);
				loadBackgroundAnimationInfo(&loadedBGDataLayer2, &animatedBackgrounds[layer2]);
				loadedBGDataLayer2.palettePointer = &palettes[4];
				loadedBGDataLayer2.targetLayer = 1;
				memcpy(&loadedBGDataLayer2.palette[0], &animatedBackgroundPalettes[animatedBackgrounds[layer2].palette][0], 32);
				memcpy(&loadedBGDataLayer2.palette2[0], &animatedBackgroundPalettes[animatedBackgrounds[layer2].palette][0], 32);
				memcpy(loadedBGDataLayer2.palettePointer, &loadedBGDataLayer2.palette[0], 32);
				generateBattleBGFrame(&loadedBGDataLayer2, 1);
				letterboxVisibleScreenValue = TMTD.obj | TMTD.bg3 | TMTD.bg1 | ((TMTD.bg2) << 8);
				letterboxNonvisibleScreenValue = TMTD.obj | TMTD.bg3;
			} else {
				loadBackgroundAnimationInfo(&loadedBGDataLayer2, &animatedBackgrounds[layer2]);
				loadedBGDataLayer2.freezePaletteScrolling = 1;
				loadedBGDataLayer2.targetLayer = 2;
			}
		}
	} else {
		setBGMODE(BGMode.mode0 | BG3Priority);
		setBG1VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
		setBG2VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
		setBG3VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x1000);
		setBG4VRAMLocation(BGTileMapSize.normal, 0xC00, 0x3000);
		for (short i = 0; i < 0x800; i++) {
			buffer[i + 1] = buffer[i + 1] & 0xDF;
		}
		copyToVRAM(0, 0x800, 0x5C00, &buffer[0]);
		loadBackgroundAnimationInfo(&loadedBGDataLayer1, &animatedBackgrounds[layer1]);
		loadedBGDataLayer1.palettePointer = &palettes[4];
		memcpy(&loadedBGDataLayer1.palette[0], &animatedBackgroundPalettes[animatedBackgrounds[layer1].palette][0], 32);
		memcpy(&loadedBGDataLayer1.palette2[0], &animatedBackgroundPalettes[animatedBackgrounds[layer1].palette][0], 32);
		memcpy(loadedBGDataLayer1.palettePointer, &loadedBGDataLayer1.palette[0], 32);
		loadedBGDataLayer1.targetLayer = 3;
		if (layer2 != 0) {
			currentLayerConfig = LayerConfig.ColourBackdropBG4AddAvg;
			setLayerConfig(currentLayerConfig);

			decomp(&animatedBackgroundTiles[animatedBackgrounds[layer2].graphics][0], &buffer[0]);
			copyToVRAM(0, 0x1800, 0x3000, &buffer[0]);
			decomp(&animatedBackgroundTilemaps[animatedBackgrounds[layer2].graphics][0], &buffer[0]);
			for (short i = 0; i < 0x800; i += 2) {
				buffer[i + 1] = (buffer[i + 1] & 0xDF);
			}
			copyToVRAM(0, 0x800, 0xC00, &buffer[0]);
			loadBackgroundAnimationInfo(&loadedBGDataLayer2 ,&animatedBackgrounds[layer2]);
			loadedBGDataLayer2.palettePointer = &palettes[6];
			memcpy(&loadedBGDataLayer2.palette[0], &animatedBackgroundPalettes[animatedBackgrounds[layer2].palette][0], 32);
			memcpy(&loadedBGDataLayer2.palette2[0], &animatedBackgroundPalettes[animatedBackgrounds[layer2].palette][0], 32);
			memcpy(loadedBGDataLayer2.palettePointer, &loadedBGDataLayer2.palette[0], 32);
			loadedBGDataLayer2.targetLayer = 4;
		} else {
			loadedBGDataLayer2.targetLayer = 0;
		}
		letterboxVisibleScreenValue = TMTD.obj | TMTD.bg3 | TMTD.bg2 | TMTD.bg1 | ((TMTD.bg4) << 8);
		letterboxNonvisibleScreenValue = TMTD.obj | TMTD.bg2 | TMTD.bg1;
	}
	distort30FPS = 0;
	if ((loadedBGDataLayer2.targetLayer != 0) && (loadedBGDataLayer2.distortionStyles[0] != 0)) {
		distort30FPS = 1;
	}
	updateLetterboxHDMATable();
	if (letterboxTopEnd != 0) {
		enableLetterboxHDMA(2);
	}
	unknownC2E9ED();
	tracef("Loaded battle bg: %s/%s", loadedBGDataLayer1, loadedBGDataLayer2);
}

/** Enables the final battle's death effect by swapping the 0th loaded distortion style with the 3rd, erasing the 1st and forcing the current distortion to end
 * Original_Address: $(DOLLAR)C2DAE3
 */
void giygasSwapDeathDistortion() {
	ubyte x0E = loadedBGDataLayer1.distortionStyles[0];
	loadedBGDataLayer1.distortionStyles[0] = loadedBGDataLayer1.distortionStyles[3];
	loadedBGDataLayer1.distortionStyles[1] = 0;
	loadedBGDataLayer1.distortionDurationLeft = 1;
	loadedBGDataLayer1.distortionStyles[3] = x0E;
}

/** Replaces the normally-unchanged animated background palette with the rendered background's palette for layer 1
 * Original_Address: $(DOLLAR)C2DB14
 */
void replaceLoadedAnimatedLayer1Palette() {
	memcpy(&loadedBGDataLayer1.palette[0], loadedBGDataLayer1.palettePointer, loadedBGDataLayer1.palette[0].sizeof);
}

/** Renders a single battle frame. Includes screen effects like flashes and shakes, large battle sprites and their palette effects, background animation and letterboxing
 * Original_Address: $(DOLLAR)C2DB3F
 */
void drawBattleFrame() {
	if (enableBackgroundDarkening != 0) {
		backgroundBrightness -= 0x555;
		if (backgroundBrightness > 0x6000) {
			backgroundBrightness = 0x6000;
			enableBackgroundDarkening = 0;
		}
		unknownC2E08E(backgroundBrightness >> 8);
	}
	if (reflectFlashDuration != 0) {
		if ((--reflectFlashDuration & 2) == 0) {
			unknownC2E08E(-1);
		} else {
			unknownC2E08E(0x100);
		}
	}
	if (greenBackgroundFlashDuration != 0) {
		palettes[0][0] = 0;
		switch (greenBackgroundFlashDuration) {
			case 3:
				palettes[0][0] = 0x3E0;
				goto case;
			case 2:
				preparePaletteUpload(PaletteUpload.full);
				break;
			default: break;
		}
		if ((--greenBackgroundFlashDuration & 2) != 0) {
			unknownC2E08E(0);
		} else {
			unknownC2E08E(0x100);
		}
	}
	if (verticalShakeDuration == 0) {
		screenEffectVerticalOffset = 0;
	} else {
		screenEffectVerticalOffset = verticalShakeOffsets[(1 * 60) - verticalShakeDuration];
		if ((--verticalShakeDuration == 0) && (verticalShakeHoldDuration != 0)) {
			verticalShakeHoldDuration--;
			verticalShakeDuration = 10;
		}
	}
	screenEffectHorizontalOffset = 0;
	if (wobbleDuration != 0) {
		screenEffectHorizontalOffset = (cast(short)(sineLookupTable[((wobbleDuration-- % 72) << 8) / 72]) * 64) / 256;
	}
	if (shakeDuration != 0) {
		switch (shakeDuration-- & 3) {
			case 0:
			case 2:
				screenEffectHorizontalOffset = 0;
				break;
			case 1:
				screenEffectHorizontalOffset = 2;
				break;
			case 3:
				screenEffectHorizontalOffset = -2;
				break;
			default: break;
		}
	}
	if (loadedBGDataLayer1.bitDepth == 2) {
		bg1XPosition = screenEffectHorizontalOffset;
		bg1YPosition = screenEffectVerticalOffset;
	} else if (battleModeFlag != 0) {
		bg3XPosition = screenEffectHorizontalOffset;
		bg3YPosition = screenEffectVerticalOffset;
	}
	if (screenEffectMinimumWaitFrames != 0) {
		screenEffectMinimumWaitFrames--;
	}
	if (battleModeFlag != 0) {
		drawBattleSprites();
	}
	generateBattleBGFrame(&loadedBGDataLayer1, 0);
	if (loadedBGDataLayer2.targetLayer != 0) {
		generateBattleBGFrame(&loadedBGDataLayer2, 1);
	}
	unknownC2E6B6();
	if (redFlashDuration != 0) {
		if (((--redFlashDuration / 12) & 1) != 0) {
			setColData(31, 0, 4);
			setColourAddSubMode(0, 0x3F);
		} else {
			setColData(0, 0, 0);
			setLayerConfig(currentLayerConfig);
		}
	}
	if (greenFlashDuration != 0) {
		if (((--greenFlashDuration / 12) & 1) != 0) {
			setColData(0, 31, 4);
			setColourAddSubMode(0, 0x3F);
		} else {
			setColData(0, 0, 0);
			setLayerConfig(currentLayerConfig);
		}
	}
	if (hpPPBoxBlinkDuration != 0) {
		if (((--hpPPBoxBlinkDuration / 3) & 1) != 0) {
			undrawHPPPWindow(hpPPBoxBlinkTarget);
		} else {
			unknownC207B6(hpPPBoxBlinkTarget);
		}
	}
	updateSwirlFrame();
	singleBattleSpritePaletteEffectFrame();
	if ((letterboxEffectEnding != 0) && (letterboxTopEnd != 0)) {
		if (letterboxEffectEndingTop < 0x3BB) { //effect is done
			letterboxEffectEndingTop = 0;
			letterboxEffectEndingBottom = 224;
			letterboxEffectEnding = 0;
		} else { // add about 3.75 lines to top and bottom
			letterboxEffectEndingTop -= 0x3BB;
			letterboxEffectEndingBottom += 0x3BB;
		}
		if ((letterboxEffectEndingTop >> 8) < letterboxTopEnd) {
			letterboxTopEnd = letterboxEffectEndingTop >> 8;
		}
		if ((letterboxEffectEndingBottom >> 8) > letterboxBottomStart) {
			letterboxBottomStart = letterboxEffectEndingBottom >> 8;
		}
		updateLetterboxHDMATable();
	}
}

/** Darkens active animated backgrounds by masking off the MSB of each colour in the palette
 * Original_Address: $(DOLLAR)C2DE0F
 */
void darkenAnimatedBackgrounds() {
	for (short i = 0; i < 16; i++) {
		loadedBGDataLayer1.palette[i] = (loadedBGDataLayer1.palette[i] / 2) & 0x3DEF;
		loadedBGDataLayer2.palette[i] = (loadedBGDataLayer2.palette[i] / 2) & 0x3DEF;
	}
	memcpy(loadedBGDataLayer1.palettePointer, &loadedBGDataLayer1.palette[0], loadedBGDataLayer1.palette.sizeof);
	if (loadedBGDataLayer2.targetLayer != 0) {
		memcpy(loadedBGDataLayer2.palettePointer, &loadedBGDataLayer2.palette[0], loadedBGDataLayer2.palette.sizeof);
	}
}

/** Restore an animated background's colours after they were darkened
 * Original_Address: $(DOLLAR)C2DE96
 */
void restoreAnimatedBackgroundColour() {
	memcpy(&loadedBGDataLayer1.palette[0], &loadedBGDataLayer1.palette2[0], loadedBGDataLayer1.palette.sizeof);
	memcpy(&loadedBGDataLayer2.palette[0], &loadedBGDataLayer2.palette2[0], loadedBGDataLayer2.palette.sizeof);
	memcpy(loadedBGDataLayer1.palettePointer, &loadedBGDataLayer1.palette[0], loadedBGDataLayer1.palette.sizeof);
	if (loadedBGDataLayer2.targetLayer != 0) {
		memcpy(loadedBGDataLayer2.palettePointer, &loadedBGDataLayer2.palette[0], loadedBGDataLayer2.palette.sizeof);
	}
}

/// $C2DF2E
void unknownC2DF2E(LoadedBackgroundData* arg1, short arg2, short arg3) {
	if ((arg2 == -1) || (arg2 == 0)) {
		arg1.palette[arg3] = arg2;
		(*arg1.palettePointer)[arg3] = arg2;
	} else if (arg2 == 0x100) {
		arg1.palette[arg3] = arg1.palette2[arg3];
		(*arg1.palettePointer)[arg3] = arg1.palette2[arg3];
	} else {
		short x12 = arg1.palette2[arg3] & 0x1F;
		short x10 = (arg1.palette2[arg3] >> 5) & 0x1F;
		short x16 = (arg1.palette2[arg3] >> 10) & 0x1F;
		x12 = cast(short)((arg2 * x12) >> 8);
		x10 = cast(short)((arg2 * x10) >> 8);
		x16 = cast(short)((arg2 * x16) >> 8);
		arg1.palette[arg3] = cast(ushort)((x16 << 10) | (x10 << 5) | (x12));
		if ((arg1.paletteShiftingStyle != PaletteShiftingStyle.unknown2) || (arg1.paletteCycle2First > arg3) || (arg1.paletteCycle2Last < arg3)) {
			if ((arg1.paletteShiftingStyle == PaletteShiftingStyle.unknown0) || (arg1.paletteCycle1First > arg3) || (arg1.paletteCycle1Last < arg3)) {
				(*arg1.palettePointer)[arg3] = arg1.palette[arg3];
			}
		}
	}
}

/// $C2E08E
void unknownC2E08E(short arg1) {
	if (loadedBGDataLayer1.bitDepth == 4) {
		for (short i = 1; i < 16; i++) {
			unknownC2DF2E(&loadedBGDataLayer1, arg1, i);
		}
	} else {
		for (short i = 1; i < 4; i++) {
			unknownC2DF2E(&loadedBGDataLayer1, arg1, i);
			unknownC2DF2E(&loadedBGDataLayer2, arg1, i);
		}
	}
}

/// $C2E0E7
void unknownC2E0E7() {
	greenFlashDuration = 0;
	redFlashDuration = 0;
	framesLeftUntilNextSwirlUpdate = 0;
	if (hpPPBoxBlinkDuration != 0) {
		unknownC207B6(hpPPBoxBlinkTarget);
		hpPPBoxBlinkDuration = 0;
	}
	setColData(0, 0, 0);
	setLayerConfig(LayerConfig.all);
}

/// $C2E116
void showPSIAnimation(short arg1) {
	if (loadedBGDataLayer1.bitDepth == 2) {
		decomp(&psiAnimationTilesets[psiAnimationConfig[arg1].graphics][0], &buffer[0x8000]);
		copyToVRAMChunked(0, 0x1000, 0, &buffer[0x8000]);
		psiAnimationPalette = &palettes[3][0];
	} else {
		decomp(&psiAnimationTilesets[psiAnimationConfig[arg1].graphics][0], &buffer[0]);
		ushort* x06 = cast(ushort*)&buffer[0];
		ushort* x0A = cast(ushort*)&buffer[0x8000];
		for (short i = 0; i < 0x100; i++) {
			(x0A++)[0] = (x06++)[0];
			(x0A++)[0] = (x06++)[0];
			(x0A++)[0] = (x06++)[0];
			(x0A++)[0] = (x06++)[0];
			(x0A++)[0] = (x06++)[0];
			(x0A++)[0] = (x06++)[0];
			(x0A++)[0] = (x06++)[0];
			(x0A++)[0] = (x06++)[0];
			(x0A++)[0] = 0;
			(x0A++)[0] = 0;
			(x0A++)[0] = 0;
			(x0A++)[0] = 0;
			(x0A++)[0] = 0;
			(x0A++)[0] = 0;
			(x0A++)[0] = 0;
			(x0A++)[0] = 0;
		}
		copyToVRAMChunked(0, 0x2000, 0, &buffer[0x8000]);
		psiAnimationPalette = &palettes[4][0];
	}
	waitUntilNextFrame();
	memcpy(&psiAnimationFullLoadedPalette[0], &psiAnimationPalettes[arg1][0], 8);
	psiAnimationFrameData = &buffer[0];
	psiAnimationTimeUntilNextFrame = 1;
	psiAnimationFrameHoldFrames = psiAnimationConfig[arg1].frameDuration;
	psiAnimationTotalFrames = psiAnimationConfig[arg1].totalFrames;
	psiAnimationPaletteFrames = psiAnimationConfig[arg1].paletteDuration;
	psiAnimationPaletteAnimationLowerRange = psiAnimationConfig[arg1].paletteLowerRange;
	psiAnimationPaletteAnimationUpperRange = psiAnimationConfig[arg1].paletteUpperRange;
	psiAnimationCurrentPaletteOffset = 0;
	psiAnimationPaletteTimeUntilNextFrame = 1;
	psiAnimationEnemyColourChangeStartFramesLeft = psiAnimationConfig[arg1].enemyColourChangeDelay;
	psiAnimationEnemyColourChangeFramesLeft = psiAnimationConfig[arg1].enemyColourChangeDuration;
	psiAnimationEnemyColourChangeRed = psiAnimationConfig[arg1].enemyColour & 0x1F;
	psiAnimationEnemyColourChangeGreen = (psiAnimationConfig[arg1].enemyColour >> 5) & 0x1F;
	psiAnimationEnemyColourChangeBlue = (psiAnimationConfig[arg1].enemyColour >> 10) & 0x1F;
	decomp(&psiAnimationTilemaps[arg1][0], &buffer[0]);
	darkenAnimatedBackgrounds();
	memcpy(&palettes[12][0], &palettes[8][0], 0x80);
	for (short i = 0; i < 4; i++) {
		psiAnimationEnemyTargets[i] = 0;
	}
	if (currentTarget.consciousness == 0) {
		return;
	}
	if (currentTarget.side != BattleSide.foes) {
		return;
	}
	psiAnimationXOffset = 0;
	switch (psiAnimationConfig[arg1].target) {
		case PSIAnimationTarget.single:
		case PSIAnimationTarget.random:
			psiAnimationXOffset = 0x80 - currentTarget.spriteX;
			psiAnimationYOffset = 0x90 - currentTarget.spriteY;
			if (getBattleSpriteHeight(currentTarget.sprite) == 8) {
				psiAnimationYOffset += 16;
			}
			currentTarget.useAltSpritemap = 1;
			psiAnimationEnemyTargets[currentTarget.vramSpriteIndex] = 1;
			break;
		case PSIAnimationTarget.row:
			psiAnimationYOffset = 0x90 - currentTarget.spriteY;
			short x1A = 0;
			for (short i = 8; i < battlersTable.length; i++) {
				if (battlersTable[i].consciousness == 0) {
					continue;
				}
				if (battlersTable[i].side != BattleSide.foes) {
					continue;
				}
				if (battlersTable[i].afflictions[0] == Status0.unconscious) {
					continue;
				}
				if (battlersTable[i].spriteY != currentTarget.spriteY) {
					continue;
				}
				if (getBattleSpriteHeight(battlersTable[i].sprite) == 8) {
					x1A = 1;
				}
				battlersTable[i].useAltSpritemap = 1;
				psiAnimationEnemyTargets[battlersTable[i].vramSpriteIndex] = 1;
			}
			break;
		case PSIAnimationTarget.allEnemies:
			psiAnimationYOffset = 16;
			for (short i = 8; i < battlersTable.length; i++) {
				if (battlersTable[i].consciousness == 0) {
					continue;
				}
				if (battlersTable[i].side != BattleSide.foes) {
					continue;
				}
				if (battlersTable[i].afflictions[0] == Status0.unconscious) {
					continue;
				}
				battlersTable[i].useAltSpritemap = 1;
				psiAnimationEnemyTargets[battlersTable[i].vramSpriteIndex] = 1;
			}
			break;
		default: break;
	}
	if (loadedBGDataLayer1.bitDepth == 2) {
		bg2XPosition = psiAnimationXOffset;
		bg2YPosition = psiAnimationYOffset;
	} else {
		bg1XPosition = psiAnimationXOffset;
		bg1YPosition = psiAnimationYOffset;
	}
}

immutable ubyte[3] unknownC2E6B3 = [ 0x30, 0, 0 ];

/// $C2E6B6
void unknownC2E6B6() {
	if ((psiAnimationTimeUntilNextFrame != 0) && (--psiAnimationTimeUntilNextFrame == 0)) {
		if (psiAnimationTotalFrames != 0) {
			psiAnimationTimeUntilNextFrame = psiAnimationFrameHoldFrames;
			copyToVRAM(6, 0x400, 0x5800, psiAnimationFrameData);
			copyToVRAM(15, 0x400, 0x5800, &unknownC2E6B3[0]);
			psiAnimationFrameData += 0x400;
			psiAnimationTotalFrames--;
		} else {
			copyToVRAM(3, 0x800, 0x5800, &unknownC2E6B3[1]);
			restoreAnimatedBackgroundColour();
		}
		if ((psiAnimationPaletteTimeUntilNextFrame != 0) && (--psiAnimationPaletteTimeUntilNextFrame == 0)) {
			psiAnimationPaletteTimeUntilNextFrame = psiAnimationPaletteFrames;
			for (short i = 0; i < psiAnimationPaletteAnimationUpperRange - psiAnimationPaletteAnimationLowerRange + 1; i++) {
				short x04 = psiAnimationCurrentPaletteOffset;
				if (i < x04) {
					x04 = cast(short)(i + psiAnimationPaletteAnimationUpperRange - psiAnimationPaletteAnimationLowerRange + 1 - x04);
				} else {
					x04 = cast(short)(i - x04);
				}
				psiAnimationPalette[psiAnimationPaletteAnimationLowerRange + x04] = psiAnimationFullLoadedPalette[x04 + psiAnimationPaletteAnimationLowerRange];
			}
			if (++psiAnimationCurrentPaletteOffset < psiAnimationPaletteAnimationUpperRange - psiAnimationPaletteAnimationLowerRange + 1) {
				psiAnimationCurrentPaletteOffset = 0;
			}
			preparePaletteUpload(PaletteUpload.full);
		}
	}
	if ((psiAnimationEnemyColourChangeStartFramesLeft != 0) && (--psiAnimationEnemyColourChangeStartFramesLeft == 0)) {
		setBattleSpritePaletteEffectSpeed(20);
		for (short i = 0; i < 4; i++) {
			if (psiAnimationEnemyTargets[i] != 0) {
				for (short j = 1; j < 16; j++) {
					initializeBattleSpritePaletteEffect(cast(short)(i * 16 + j), psiAnimationEnemyColourChangeRed, psiAnimationEnemyColourChangeGreen, psiAnimationEnemyColourChangeBlue);
				}
			}
		}
	}
	if ((psiAnimationEnemyColourChangeFramesLeft != 0) && (--psiAnimationEnemyColourChangeFramesLeft == 0)) {
		for (short i = 0; i < 4; i++) {
			if (psiAnimationEnemyTargets[i] != 0) {
				unknownC2FADE(20, i);
			}
		}
	}
}

/** Starts a swirl animation with extra padding frames
 * Params:
 * 	swirl = The ID of the swirl animation to play
 * 	flags = The flags for the swirl animation
 * 	extraFrames = Number of extra frames to pad the animation with
 * Original_Address: $(DOLLAR)C2E8C4
 */
void startSwirlPadded(short swirl, short flags, short extraFrames) {
	startSwirl(swirl, flags);
	swirlLengthPadding = cast(ubyte)extraFrames;
}

/// $C2E8E0
void battleSwirlSequence() {
	short x16 = Swirl.battleStart;
	short swirlRed = 4;
	short swirlGreen = 4;
	short swirlBlue = 0;
	short swirlMusic;
	short x0E;
	switch (battleInitiative) {
		case Initiative.normal:
			swirlMusic = Music.battleSwirl4;
			x0E = AnimationFlags.unknown3 | AnimationFlags.unknown2 | AnimationFlags.invert;
			break;
		case Initiative.partyFirst:
			swirlMusic = Music.battleSwirl4;
			swirlRed = 28;
			swirlGreen = 5;
			swirlBlue = 12;
			x0E = AnimationFlags.unknown2 | AnimationFlags.invert;
			break;
		case Initiative.enemiesFirst:
			swirlMusic = Music.battleSwirl2;
			swirlRed = 0;
			swirlGreen = 31;
			swirlBlue = 31;
			x0E = AnimationFlags.unknown2 | AnimationFlags.invert;
			break;
		default: break;
	}
	if (currentBattleGroup >= EnemyGroup.bossFrank) {
		x16 = Swirl.bossBattleStart;
		x0E = AnimationFlags.unknown3 | AnimationFlags.unknown2 | AnimationFlags.invert;
		swirlMusic = Music.battleSwirl1;
	}
	changeMusic(swirlMusic);
	restoreBackgroundLayers();
	if ((x0E & AnimationFlags.unknown2) != 0) {
		setColData(cast(ubyte)swirlRed, cast(ubyte)swirlGreen, cast(ubyte)swirlBlue);
	}
	if ((x0E & AnimationFlags.unknown3) != 0) {
		setColourAddSubMode(
			CGWSELFlags.ColourMathEnableMathWin | CGWSELFlags.MainScreenBlackNever | CGWSELFlags.SubscreenBGOBJDisable | CGWSELFlags.UsePalette,
			CGADSUBFlags.ColourMathAddsub | CGADSUBFlags.ColourMathDiv2 | CGADSUBFlags.ColourMathMainIsBackdrop | CGADSUBFlags.ColourMathMainIsOBJ47 | CGADSUBFlags.ColourMathMainIsBG4 | CGADSUBFlags.ColourMathMainIsBG3 | CGADSUBFlags.ColourMathMainIsBG2 | CGADSUBFlags.ColourMathMainIsBG1
		);
	} else {
		setColourAddSubMode(
			CGWSELFlags.ColourMathEnableMathWin | CGWSELFlags.MainScreenBlackNever | CGWSELFlags.SubscreenBGOBJDisable | CGWSELFlags.UsePalette,
			CGADSUBFlags.ColourMathAddsub | CGADSUBFlags.ColourMathMainIsBackdrop | CGADSUBFlags.ColourMathMainIsOBJ47 | CGADSUBFlags.ColourMathMainIsBG4 | CGADSUBFlags.ColourMathMainIsBG3 | CGADSUBFlags.ColourMathMainIsBG2 | CGADSUBFlags.ColourMathMainIsBG1
		);
	}
	startSwirlPadded(x16, x0E, 30);
	if ((x0E & AnimationFlags.unknown2) != 0) {
		swirlMaskSettings = SwirlMask.mathMode;
	} else {
		swirlMaskSettings = SwirlMask.bg1 | SwirlMask.bg2 | SwirlMask.bg3 | SwirlMask.bg4;
	}
	swirlAutoRestore = 0;
}

/// $C2E9C8
short unknownC2E9C8() {
	if ((framesLeftUntilNextSwirlUpdate != 0) && (swirlLengthPadding > 4)) {
		return 1;
	}
	return 0;
}

/// $C2E9ED
void unknownC2E9ED() {
	framesLeftUntilNextSwirlUpdate = 0;
	hdmaDisable(swirlHDMAChannelOffset + 3);
	setColData(0, 0, 0);
	setWindowMask(0, 0);
}

/// $C2EA15
void openOvalWindow(short arg1) {
	activeOvalWindow = cast(ubyte)arg1;
	startSwirl(Swirl.ovalWindow, AnimationFlags.none);
	swirlMaskSettings = SwirlMask.bg1 | SwirlMask.bg2 | SwirlMask.obj;
	switch (arg1) {
		case 2:
			loadedOvalWindow = &toBeContOvalClose[0];
			break;
		case 1:
			loadedOvalWindow = &evtPrayOvalWindow[0];
			break;
		default:
			loadedOvalWindow = &ovalWindowSwirl[0];
			break;
	}
}

/// $C2EA74
void closeOvalWindow() {
	startSwirl(Swirl.ovalWindow, AnimationFlags.none);
	swirlMaskSettings = SwirlMask.bg1 | SwirlMask.bg2 | SwirlMask.obj;
	if (activeOvalWindow != 0) {
		loadedOvalWindow = &unknownC4A652[0];
	} else {
		loadedOvalWindow = &unknownC4A626[0];
	}
}

/// $C2EAAA
void disableOvalWindow() {
	framesLeftUntilNextSwirlUpdate = 0;
	loadedOvalWindow = null;
	hdmaDisable(3);
	setWindowMask(0, 0);
}

/// $C2EACF
short unknownC2EACF() {
	if (psiAnimationTimeUntilNextFrame != 0) {
		return 1;
	}
	if (framesLeftUntilNextSwirlUpdate == 0) {
		return 0;
	}
	return 1;
}

/** Loads a battle sprite for an enemy. Includes initializing the alt spritemap and decompressing the graphics
 * Params:
 * 	id = The enemy battle sprite starting at 1, 0 for no sprite
 * Original_Address: $(DOLLAR)C2EAEA
 */
void loadBattleSprite(short id) {
	battleSpritemapAllocationCounts[currentBattleSpritesAllocated] = cast(ubyte)currentBattleSpritemapsAllocated;
	SpriteMap* newSpriteMap = &battleSpritemaps[currentBattleSpritesAllocated][0];
	id--;
	// Numbers of 32x32 hardware sprites used vertically and horizontally
	short spritemapHeight = 1;
	short spritemapWidth = 1;
	for (short i = 0; i < 16; i++) {
		newSpriteMap[i].yOffset = 0xE0;
		//weird. why is it done like this?
		newSpriteMap[i].firstTile = cast(ubyte)((unknownC3F8B1[i + currentBattleSpritemapsAllocated]));
		newSpriteMap[i].flags = cast(ubyte)((unknownC3F8B1[i + currentBattleSpritemapsAllocated] >> 8) + (currentBattleSpritesAllocated * 2) + 32);
		newSpriteMap[i].xOffset = 0xF0;
		newSpriteMap[i].specialFlags = 1;
	}
	version(noUndefinedBehaviour) {
		// sprite 0 aka "no sprite" ends up indexing out of bounds and using *cast(ubyte*)&battleSprites[0] as a size instead, which only works because invalid sizes are ignored
		// so just do the bare minimum and return
		if ((id < 0) || (id >= battleSprites.length)) {
			newSpriteMap[(spritemapHeight * spritemapWidth) - 1].specialFlags = 0x81;
			memcpy(&altBattleSpritemaps[currentBattleSpritesAllocated][0], &battleSpritemaps[currentBattleSpritesAllocated][0], 16 * SpriteMap.sizeof);
			for (short i = 0; i < 16; i++) {
				altBattleSpritemaps[currentBattleSpritesAllocated][i].flags += 8;
			}
			currentBattleSpriteWidths[currentBattleSpritesAllocated] = cast(ubyte)spritemapWidth;
			currentBattleSpriteHeights[currentBattleSpritesAllocated] = cast(ubyte)spritemapHeight;
			currentBattleSpritesAllocated++;
			return;
		}
	}
	switch (battleSprites[id].size) {
		case BattleSpriteSize._64X32:
			spritemapWidth = 2;
			newSpriteMap.xOffset = 0xE0;
			newSpriteMap[1].xOffset = 0;
			break;
		case BattleSpriteSize._32X64:
			spritemapHeight = 2;
			newSpriteMap.yOffset = 0xC0;
			break;
		case BattleSpriteSize._64X64:
			spritemapHeight = 2;
			spritemapWidth = 2;
			newSpriteMap[1].yOffset = 0xC0;
			newSpriteMap[0].yOffset = 0xC0;
			newSpriteMap[2].xOffset = 0xE0;
			newSpriteMap[0].xOffset = 0xE0;
			newSpriteMap[3].xOffset = 0;
			newSpriteMap[1].xOffset = 0;
			break;
		case BattleSpriteSize._128X64:
			spritemapWidth = 4;
			spritemapHeight = 2;
			newSpriteMap[3].yOffset = 0xC0;
			newSpriteMap[2].yOffset = 0xC0;
			newSpriteMap[1].yOffset = 0xC0;
			newSpriteMap[0].yOffset = 0xC0;
			newSpriteMap[4].xOffset = 0xC0;
			newSpriteMap[0].xOffset = 0xC0;
			newSpriteMap[5].xOffset = 0xE0;
			newSpriteMap[1].xOffset = 0xE0;
			newSpriteMap[6].xOffset = 0;
			newSpriteMap[2].xOffset = 0;
			newSpriteMap[7].xOffset = 0x20;
			newSpriteMap[3].xOffset = 0x20;
			break;
		case BattleSpriteSize._128X128:
			spritemapHeight = 4;
			spritemapWidth = 4;
			newSpriteMap[3].yOffset = 0xA0;
			newSpriteMap[2].yOffset = 0xA0;
			newSpriteMap[1].yOffset = 0xA0;
			newSpriteMap[0].yOffset = 0xA0;
			newSpriteMap[7].yOffset = 0xC0;
			newSpriteMap[6].yOffset = 0xC0;
			newSpriteMap[5].yOffset = 0xC0;
			newSpriteMap[4].yOffset = 0xC0;
			newSpriteMap[15].yOffset = 0;
			newSpriteMap[14].yOffset = 0;
			newSpriteMap[13].yOffset = 0;
			newSpriteMap[12].yOffset = 0;
			newSpriteMap[12].xOffset = 0xC0;
			newSpriteMap[8].xOffset = 0xC0;
			newSpriteMap[4].xOffset = 0xC0;
			newSpriteMap[0].xOffset = 0xC0;
			newSpriteMap[13].xOffset = 0xE0;
			newSpriteMap[9].xOffset = 0xE0;
			newSpriteMap[5].xOffset = 0xE0;
			newSpriteMap[1].xOffset = 0xE0;
			newSpriteMap[14].xOffset = 0;
			newSpriteMap[10].xOffset = 0;
			newSpriteMap[6].xOffset = 0;
			newSpriteMap[2].xOffset = 0;
			newSpriteMap[15].xOffset = 0x20;
			newSpriteMap[11].xOffset = 0x20;
			newSpriteMap[7].xOffset = 0x20;
			newSpriteMap[3].xOffset = 0x20;
			break;
		default: break;
	}
	newSpriteMap[(spritemapHeight * spritemapWidth) - 1].specialFlags = 0x81;
	memcpy(&altBattleSpritemaps[currentBattleSpritesAllocated][0], &battleSpritemaps[currentBattleSpritesAllocated][0], 16 * SpriteMap.sizeof);
	for (short i = 0; i < 16; i++) {
		altBattleSpritemaps[currentBattleSpritesAllocated][i].flags += 8;
	}
	currentBattleSpriteWidths[currentBattleSpritesAllocated] = cast(ubyte)spritemapWidth;
	currentBattleSpriteHeights[currentBattleSpritesAllocated] = cast(ubyte)spritemapHeight;
	currentBattleSpritesAllocated++;
	ubyte* spriteSource = &buffer[0x8000];
	decomp(&battleSpriteTiles[battleSprites[id].sprite][0], spriteSource);
	short y = cast(short)(spritemapHeight * spritemapWidth);
	while (y-- != 0) {
		ubyte* dest = &buffer[battleSpritemapVRAMMapping[currentBattleSpritemapsAllocated++]];
		for (short i = 0; i < 4; i++) {
			ubyte* dest2 = dest;
			for (short j = 0; j < 0x80; j++) {
				*(dest2++) = *(spriteSource++);
			}
			dest += 0x200;
		}
	}
}

/// $C2EEE7
void unknownC2EEE7() {
	currentBattleSpritesAllocated = 0;
	currentBattleSpritemapsAllocated = 0;
	const(BattleGroupEnemy)* x1A = &battleEntryPointerTable[currentBattleGroup].enemies[0];
	while (x1A.count != 0xFF) {
		memcpy(&palettes[8 + currentBattleSpritesAllocated][0], &battleSpritePalettes[enemyConfigurationTable[x1A.enemyID].battleSpritePalette][0], 32);
		currentBattleSpriteEnemyIDs[currentBattleSpritesAllocated] = x1A.enemyID;
		loadBattleSprite(enemyConfigurationTable[x1A.enemyID].battleSprite);
		x1A++;
	}
	copyToVRAM(0, (currentBattleSpritemapsAllocated > 16) ? 0x3000 : 0x2000, 0x2000, &buffer[0]);
}

/// $C2EFFD
short getBattleSpriteWidth(short sprite) {
	version(noUndefinedBehaviour) {
		if ((sprite <= 0) || (sprite > battleSprites.length)) {
			return 0;
		}
	}
	switch (battleSprites[sprite - 1].size) {
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

/// $C2F04E
short getBattleSpriteHeight(short sprite) {
	version(noUndefinedBehaviour) {
		if ((sprite <= 0) || (sprite > battleSprites.length)) {
			return 0;
		}
	}
	switch (battleSprites[sprite - 1].size) {
		case BattleSpriteSize._32X32:
		case BattleSpriteSize._64X32:
			return 4;
		case BattleSpriteSize._32X64:
		case BattleSpriteSize._64X64:
		case BattleSpriteSize._128X64:
			return 8;
		case BattleSpriteSize._128X128:
			return 16;
		default:
			return 0;
	}
}

/// $C2F09F
ubyte unknownC2F09F(short arg1) {
	for (ubyte i = 0; i < 4; i++) {
		if (currentBattleSpriteEnemyIDs[i] == arg1) {
			return i;
		}
	}
	return 0;
}

/// $C2F0D1
void unknownC2F0D1() {
	short y = 0;
	for (short i = 0; i < enemiesInBattle; i++) {
		y += getBattleSpriteWidth(enemyConfigurationTable[enemiesInBattleIDs[i]].battleSprite);
		if (y > 32) {
			enemiesInBattle = i;
			return;
		}
	}
}

/// $C2F121
short unknownC2F121() {
	battleSpriteRowWidth[1] = 0;
	battleSpriteRowWidth[0] = 0;
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		battlersTable[i].vramSpriteIndex = unknownC2F09F(battlersTable[i].id);
		short x02 = getBattleSpriteWidth(battlersTable[i].sprite);
		if (battleSpriteRowWidth[battlersTable[i].row] != 0) {
			x02++;
		}
		if (battleSpriteRowWidth[battlersTable[i].row] + x02 <= 30) {
			battleSpriteRowWidth[battlersTable[i].row] += x02;
		} else {
			x02 = getBattleSpriteWidth(battlersTable[i].sprite);
			if (battleSpriteRowWidth[1 - battlersTable[i].row] != 0) {
				x02++;
			}
			if (battleSpriteRowWidth[1 - battlersTable[i].row] + x02 <= 30) {
				battlersTable[i].row = cast(ubyte)(1 - battlersTable[i].row);
				battleSpriteRowWidth[1 - battlersTable[i].row] += x02;
			} else {
				return 0;
			}
		}
	}
	short x1D = 32;
	short x1B = 32;
	short x17;
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		if (battlersTable[i].row != battlersTable[8].row) {
			continue;
		}
		short x19 = getBattleSpriteWidth(battlersTable[i].sprite) / 2;
		if (x1B == x1D) {
			battlersTable[i].spriteX = cast(ubyte)x1B;
			x1B -= x19;
			x1D += x19;
			if ((randLong() & 1) != 0) {
				x17 = x1B;
			} else {
				x17 = x1D;
			}
		} else {
			if ((32 - x1B < x1D - 32) || (((32 - x1B == x1D - 32) && ((randLong() & 1) != 0)))) {
				battlersTable[i].spriteX = cast(ubyte)(x1B - x19 - 1);
				x1B = cast(short)(cast(ubyte)(x1B - x19 - 1) - x19);
			} else {
				battlersTable[i].spriteX = cast(ubyte)(x1D + x19 + 1);
				x1D = cast(short)(cast(ubyte)(x1D + x19 + 1) + x19);
			}
		}
	}
	short x25 = x17;
	short x14 = x17;
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		if (battlersTable[i].row == battlersTable[8].row) {
			continue;
		}
		short x12 = getBattleSpriteWidth(battlersTable[i].sprite) / 2;
		if (x14 == x25) {
			battlersTable[i].spriteX = cast(ubyte)x14;
			x14 -= x12;
			x25 += x12;
		} else {
			if ((x25 > 32) && ((x14 > 32)) || (32 - x14 < x25 - 32) || ((32 - x14 == x25 - 32) && ((randLong() & 1) != 0))) {
				battlersTable[i].spriteX = cast(ubyte)(x14 - x12 - 1);
				x14 = cast(short)(cast(ubyte)(x14 - x12 - 1) - x12);
			} else {
				battlersTable[i].spriteX = cast(ubyte)(x25 + x12 + 1);
				x25 = cast(short)(cast(ubyte)(x25 + x12 + 1) + x12);
			}
		}
	}
	if ((battlersTable[8].row == 1) && (x14 == x25)) {
		for (short i = 8; i < battlersTable.length; i++) {
			if (battlersTable[i].consciousness == 0) {
				continue;
			}
			if (battlersTable[i].side != BattleSide.foes) {
				continue;
			}
			battlersTable[i].row = 0;
		}
	}
	if (x14 < x1B) {
		x1B = x14;
	}
	if (x25 > x1D) {
		x1D = x25;
	}
	x1B = cast(short)(32 - ((x1B + x1D) / 2) - 16);
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		battlersTable[i].spriteX = cast(ubyte)((battlersTable[i].spriteX + x1B) * 8);
		if (battlersTable[i].row != 0) {
			battlersTable[i].spriteY = 0x80;
		} else {
			battlersTable[i].spriteY = 0x90;
		}
	}
	//TODO: don't hardcode this
	if (currentBattleGroup == 0x1DB) {
		battlersTable[8].spriteX = 0x80;
		battlersTable[8].spriteY = 0x80;
		battlersTable[9].spriteX = 0xC8;
		battlersTable[9].spriteY = 0x90;
	}
	while (true) {
		short x21 = 0;
		for (short i = 0; i < enemiesInBattle - 1; i++) {
			for (short j = cast(short)(i + 1); j < enemiesInBattle; j++) {
				if (battlersTable[8 + i].id != battlersTable[8 + j].id) {
					continue;
				}
				if (((battlersTable[8 + i].suffixLetter >= battlersTable[8 + j].suffixLetter) || ((battlersTable[8 + i].spriteY >= battlersTable[8 + j].spriteY) && (battlersTable[8 + i].spriteY != battlersTable[8 + j].spriteY)) || (battlersTable[8 + i].spriteX <= battlersTable[8 + j].spriteX)) &&
				(battlersTable[8 + i].suffixLetter > battlersTable[8 + j].suffixLetter) && ((battlersTable[8 + i].spriteY > battlersTable[8 + j].spriteY) || ((battlersTable[8 + i].spriteY == battlersTable[8 + j].spriteY) && (battlersTable[8 + i].spriteX < battlersTable[8 + j].spriteX)))) {
					x21 = 1;
					short x12 = battlersTable[8 + i].suffixLetter;
					battlersTable[8 + i].suffixLetter = battlersTable[8 + j].suffixLetter;
					battlersTable[8 + j].suffixLetter = cast(ubyte)x12;
					if (battlersTable[8 + i].suffixLetter > battlersTable[8 + j].suffixLetter) {
						memcpy(&battlersTable[battlersTable.length - 1], &battlersTable[8 + i], Battler.sizeof);
						memcpy(&battlersTable[8 + i], &battlersTable[8 + j], Battler.sizeof);
						memcpy(&battlersTable[8 + j], &battlersTable[battlersTable.length - 1], Battler.sizeof);
					}
				}
			}
		}
		if (x21 == 0) {
			break;
		}
	}
	memset(&battlersTable[battlersTable.length - 1], 0, Battler.sizeof);
	return 0;
}

/// $C2F724
void renderBattleSpriteRow(short arg1) {
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].afflictions[0] == Status0.unconscious) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		if (battlersTable[i].row != arg1) {
			continue;
		}
		if (battlersTable[i].sprite == 0) {
			continue;
		}
		if ((battlersTable[i].unknown72 != 0) && (((--battlersTable[i].unknown72 / 3) & 1) != 0)) {
			continue;
		}
		if ((battlersTable[i].unknown73 != 0) && ((--battlersTable[i].unknown73 & 4) == 0)) {
			renderSpriteToOAM(&altBattleSpritemaps[battlersTable[i].vramSpriteIndex][0], cast(short)(battlersTable[i].spriteX - screenEffectHorizontalOffset), cast(short)(battlersTable[i].spriteY - screenEffectVerticalOffset));
		} else if (battlersTable[i].useAltSpritemap != 0) {
			renderSpriteToOAM(&altBattleSpritemaps[battlersTable[i].vramSpriteIndex][0], cast(short)(battlersTable[i].spriteX - screenEffectHorizontalOffset), cast(short)(battlersTable[i].spriteY - screenEffectVerticalOffset));
		} else if ((enemyTargettingFlashing != 0) && ((battlersTable[i].isFlashing == 0) || ((frameCounter & 8) != 0))) {
			//targetted enemies
			renderSpriteToOAM(&altBattleSpritemaps[battlersTable[i].vramSpriteIndex][0], cast(short)(battlersTable[i].spriteX - screenEffectHorizontalOffset), cast(short)(battlersTable[i].spriteY - screenEffectVerticalOffset));
		} else {
			//normal enemies
			renderSpriteToOAM(&battleSpritemaps[battlersTable[i].vramSpriteIndex][0], cast(short)(battlersTable[i].spriteX - screenEffectHorizontalOffset), cast(short)(battlersTable[i].spriteY - screenEffectVerticalOffset));
		}
	}
}

/// $C2F8F9
void drawBattleSprites() {
	setSpritemapBank(0x7E);
	oamClear();
	renderBattleSpriteRow(0);
	renderBattleSpriteRow(1);
	updateScreen();
}

/// $C2F917
void unknownC2F917() {
	short x0E;
	numBattlersInFrontRow = 0;
	numBattlersInBackRow = 0;
	for (short i = 8; i < battlersTable.length; i++) {
		if (battlersTable[i].consciousness == 0) {
			continue;
		}
		if (battlersTable[i].afflictions[0] == 1) {
			continue;
		}
		if (battlersTable[i].side != BattleSide.foes) {
			continue;
		}
		if (battlersTable[i].row != 0) {
			numBattlersInBackRow++;
		} else {
			numBattlersInFrontRow++;
		}
	}
	short x10 = 0;
	for (short i = 0; i < numBattlersInFrontRow; i++) {
		ushort x04 = 0xFFFF;
		for (short j = 8; j < battlersTable.length; j++) {
			if (battlersTable[j].consciousness == 0) {
				continue;
			}
			if (battlersTable[j].afflictions[0] == 1) {
				continue;
			}
			if (battlersTable[j].side != BattleSide.foes) {
				continue;
			}
			if (battlersTable[j].row != Row.front) {
				continue;
			}
			if ((battlersTable[j].spriteX > x10) && (battlersTable[j].spriteX <= x04)) {
				x0E = j;
				x04 = battlersTable[j].spriteX;
			}
		}
		frontRowBattlers[i] = cast(ubyte)(x0E);
		battlerFrontRowXPositions[i] = cast(ubyte)(x04 / 8);
		battlerFrontRowYPositions[i] = cast(ubyte)(18 - getBattleSpriteHeight(battlersTable[x0E].sprite));
		x10 = x04;
	}
	x10 = 0;
	for (short i = 0; i < numBattlersInBackRow; i++) {
		ushort x04 = 0xFFFF;
		for (short j = 8; j < battlersTable.length; j++) {
			if (battlersTable[j].consciousness == 0) {
				continue;
			}
			if (battlersTable[j].afflictions[0] == 1) {
				continue;
			}
			if (battlersTable[j].side != BattleSide.foes) {
				continue;
			}
			if (battlersTable[j].row == Row.front) {
				continue;
			}
			if ((battlersTable[j].spriteX > x10) && (battlersTable[j].spriteX <= x04)) {
				x0E = j;
				x04 = battlersTable[j].spriteX;
			}
		}
		backRowBattlers[i] = cast(ubyte)(x0E);
		battlerBackRowXPositions[i] = cast(ubyte)(x04 / 8);
		battlerBackRowYPositions[i] = cast(ubyte)(18 - getBattleSpriteHeight(battlersTable[x0E].sprite));
		x10 = x04;
	}
}

/// $C2FAD8
short getPhysicalTargettingAllowed(short position) {
	return 1;
}

/// $C2FAD8
void setBattleSpritePaletteEffectSpeed(short arg1) {
	battleSpritePaletteEffectSpeed = arg1;
}

/// $C2FADE
void unknownC2FADE(short speed, short spriteIndex) {
	battleSpritePaletteEffectSpeed = speed;
	battleSpritePaletteEffectFramesLeft[spriteIndex] = battleSpritePaletteEffectSpeed;
	for (short i = 0; i < 48; i++) {
		battleSpritePaletteEffectDeltas[(16 * spriteIndex) * 3 + i] = cast(short)-cast(int)(battleSpritePaletteEffectDeltas[(16 * spriteIndex) * 3 + i]);
		battleSpritePaletteEffectCounters[(16 * spriteIndex) * 3 + i] = 0;
	}
}

/// $C2FB35
void initializeBattleSpritePaletteEffect(short spriteColour, short targetRed, short targetGreen, short targetBlue) {
	battleSpritePaletteEffectFramesLeft[spriteColour / 16] = battleSpritePaletteEffectSpeed;
	ushort colour = (&palettes[12][0])[spriteColour];
	ushort red = colour & 0x1F;
	ushort green = (colour >> 5) & 0x1F;
	ushort blue = (colour >> 10) & 0x1F;
	if (targetRed > red) {
		battleSpritePaletteEffectSteps[spriteColour * 3] = cast(short)(targetRed - red);
		battleSpritePaletteEffectDeltas[spriteColour * 3] = 1;
	} else if (targetRed == red) {
		battleSpritePaletteEffectDeltas[spriteColour * 3] = 0;
	} else {
		battleSpritePaletteEffectSteps[spriteColour * 3] = cast(short)(red - targetRed);
		battleSpritePaletteEffectDeltas[spriteColour * 3] = -1;
	}
	if (targetGreen > green) {
		battleSpritePaletteEffectSteps[spriteColour * 3 + 1] = cast(short)(targetGreen - green);
		battleSpritePaletteEffectDeltas[spriteColour * 3 + 1] = 0x20;
	} else if (targetGreen == green) {
		battleSpritePaletteEffectDeltas[spriteColour * 3 + 1] = 0;
	} else {
		battleSpritePaletteEffectSteps[spriteColour * 3 + 1] = cast(short)(green - targetGreen);
		battleSpritePaletteEffectDeltas[spriteColour * 3 + 1] = -0x20;
	}
	if (targetBlue > blue) {
		battleSpritePaletteEffectSteps[spriteColour * 3 + 2] = cast(short)(targetBlue - blue);
		battleSpritePaletteEffectDeltas[spriteColour * 3 + 2] = 0x400;
	} else if (targetBlue == blue) {
		battleSpritePaletteEffectDeltas[spriteColour * 3 + 2] = 0;
	} else {
		battleSpritePaletteEffectSteps[spriteColour * 3 + 2] = cast(short)(blue - targetBlue);
		battleSpritePaletteEffectDeltas[spriteColour * 3 + 2] = -0x400;
	}
	battleSpritePaletteEffectCounters[spriteColour * 3 + 2] = 0;
	battleSpritePaletteEffectCounters[spriteColour * 3 + 1] = 0;
	battleSpritePaletteEffectCounters[spriteColour * 3 + 0] = 0;
}

/// $C2FD99
void singleBattleSpritePaletteEffectFrame() {
	for (short i = 0; i < 4; i++) {
		if (battleSpritePaletteEffectFramesLeft[i] == 0) {
			continue;
		}
		battleSpritePaletteEffectFramesLeft[i]--;
		short* paletteDeltas = &battleSpritePaletteEffectDeltas[(i * 16 + 1) * 3];
		short* paletteCounters = &battleSpritePaletteEffectCounters[(i * 16 + 1) * 3];
		short* paletteSteps = &battleSpritePaletteEffectSteps[(i * 16 + 1) * 3];
		ushort* targetColour = &palettes[12 + i][1];
		for (short j = 1; j < 16; j++) {
			if (paletteDeltas[0] != 0) {
				paletteCounters[0] += paletteSteps[0];
				while (battleSpritePaletteEffectSpeed <= paletteCounters[0]) {
					paletteCounters[0] -= battleSpritePaletteEffectSpeed;
					targetColour[0] += paletteDeltas[0];
				}
			}
			if (paletteDeltas[1] != 0) {
				paletteCounters[1] += paletteSteps[1];
				while (battleSpritePaletteEffectSpeed <= paletteCounters[1]) {
					paletteCounters[1] -= battleSpritePaletteEffectSpeed;
					targetColour[0] += paletteDeltas[1];
				}
			}
			if (paletteDeltas[2] != 0) {
				paletteCounters[2] += paletteSteps[2];
				while (battleSpritePaletteEffectSpeed <= paletteCounters[2]) {
					paletteCounters[2] -= battleSpritePaletteEffectSpeed;
					targetColour[0] += paletteDeltas[2];
				}
			}
			paletteDeltas += 3;
			paletteCounters += 3;
			paletteSteps += 3;
			targetColour++;
		}
		preparePaletteUpload(PaletteUpload.objOnly);
	}
}

/// $C2FEF9
void unknownC2FEF9(short type) {
	if (type != 0) {
		memcpy(&palettes[12][0], &unknownC3F8F1[type - 1][0], 32);
		memcpy(&palettes[13][0], &unknownC3F8F1[type - 1][0], 32);
		memcpy(&palettes[14][0], &unknownC3F8F1[type - 1][0], 32);
		memcpy(&palettes[15][0], &unknownC3F8F1[type - 1][0], 32);
		preparePaletteUpload(PaletteUpload.objOnly);
		return;
	}
	for (short i = 16 * 8; i < 16 * 12; i++) {
		palettes[(i / 16) + 4][i % 16] = (palettes[i / 16][i % 16] >> 2) & ((7 << 10) | (7 << 5) | 7);
	}
	preparePaletteUpload(PaletteUpload.objOnly);
}

/** ActionScript function - Tests if player is in a big area, like the Lost Underworld
 * Returns: 1 if in big area, 0 otherwise
 * Original_Address: $(DOLLAR)C2FF9A
 */
short actionScriptTestInBigArea() {
	if ((loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & 7) >= SpecialGameState.useMiniSprites) {
		return 1;
	}
	return 0;
}
