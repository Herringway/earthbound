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
import earthbound.hardware;
import earthbound.text;

import core.stdc.string;
import std.logger;

/** Displays text for interactions.
 *
 * In addition to displaying the text, this also freezes entities until the script is done and waits for any fading entities to disappear.
 * Params:
 * 	script = Text script to display
 * Original_Address: $(DOLLAR)C10004
 */
void displayInteractionText(const(ubyte)* script) {
	freezeEntities();
	displayText(script);
	do {
		windowTick();
	} while (entityFadeEntity != -1);
	unfreezeEntities();
}

/** Sets the text prompt mode. See TextPromptMode for useful values
 * Params:
 * 	mode = TextPromptMode to switch to
 * Original_Address: $(DOLLAR)C10036
 */
void setTextPromptMode(ushort mode) {
	textPromptMode = mode;
}

/** Resets the text prompt mode to default (TextPromptMode.normal)
 * Original_Address: $(DOLLAR)C1003C
 */
void setTextPromptModeDefault() {
	textPromptMode = TextPromptMode.normal;
}

/** Gets the active text prompt mode
 * Returns: Active TextPromptMode
 * Original_Address: $(DOLLAR)C10042
 */
short getTextPromptMode() {
	return textPromptMode;
}

/** Sets the text sound mode. See TextSoundMode for useful values
 * Params:
 * 	mode = TextSoundMode to switch to
 * Original_Address: $(DOLLAR)C10048
 */
void setTextSoundMode(ushort mode) {
	textSoundMode = mode;
}

/// $C1004E
void finishFrame() {
	if (renderHPPPWindows != 0) {
		unknownC3E450();
	}
	if (battleModeFlag != 0) {
		finishBattleFrame();
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
void closeFocusWindow() {
	closeWindow(currentFocusWindow);
}

/// $C1008E
void closeAllWindows() {
	extraTickOnWindowClose = 1;
	while (windowTail != -1) {
		closeWindow(windowStats[windowTail].windowID);
	}
	clearInstantPrinting();
	windowTick();
	extraTickOnWindowClose = 0;
	initializeUsedBG2TileMap();
}

/** Locks player input for text scripts, preventing any waits for player input from proceeding.
 *
 * Any input prompts occurring after this WILL softlock the game with no chance of recovery! Be careful!
 * Original_Address: $(DOLLAR)C100C7
 */
void lockInput() {
	textPromptWaitingForInput = 1;
}

/** Unlocks player input for text scripts.
 * Original_Address: $(DOLLAR)C100D0
 */
void unlockInput() {
	textPromptWaitingForInput = 0;
}

/** Waits the specified number of frames while running the window tick function.
 * Params:
 * 	frames = Number of frames to wait
 * Original_Address: $(DOLLAR)C100D6
 */
void textWait(ushort frames) {
	clearInstantPrinting();
	windowTick();
	while (--frames != 0) {
		windowTickMinimal();
	}
}

/** Waits the specified number of frames while running the window tick function. Can be cancelled by user input.
 * Params:
 * 	frames = Number of frames to wait, or 0 for a number of frames appropriate for the current text speed
 * Original_Address: $(DOLLAR)C100FE
 */
void textWaitCancellable(short frames) {
	if ((debugging != 0) && (battleMode == BattleMode.noBattle)) {
		while ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) == 0) {
			windowTickMinimal();
		}
		return;
	}
	// this loop will never exit if entered outside of debug mode. make sure the condition is never true!
	while (textPromptWaitingForInput) {
		if (debugging == 0) {
			continue;
		}
		if ((padPress[0] & (Pad.b | Pad.r)) != (Pad.b | Pad.r)) {
			continue;
		}
		textPromptWaitingForInput = 0;
	}
	short framesLeft = (frames != 0) ? frames : textSpeedBasedWait;
	while ((framesLeft-- != 0) && ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) == 0)) {
		windowTickMinimal();
	}
}

/** Prompt for user input during text scripts
 *
 * Will softlock if textPromptWaitingForInput is set (through [1F 50], for example) outside of debug mode
 * CC [03], [13], [14] common code.
 * Params:
 * 	displayPrompt = Set to 1 to display a little blinking triangle in the corner of the window
 * 	dontUseSpeedBasedWait = If 0, also wait at least a number of frames equal to textSpeedBasedWait. Ignores displayPrompt = 1. Only has an effect if textPromptMode is non-zero
 * Original_Address: $(DOLLAR)C10166
 */
void cc1314(short displayPrompt, short dontUseSpeedBasedWait) {
	// this loop will never exit if the condition is true outside of debug mode
	while (textPromptWaitingForInput) {
		if (debugging == 0) {
			continue;
		}
		if ((padPress[0] & (Pad.b | Pad.r)) == (Pad.b | Pad.r)) {
			textPromptWaitingForInput = 0;
			break;
		}
	}
	clearInstantPrinting();
	windowTick();
	if ((dontUseSpeedBasedWait == 0) && (textPromptMode != TextPromptMode.normal) && (textSpeedBasedWait != 0)) {
		textWaitCancellable(0);
		return;
	}
	if (textPromptMode != TextPromptMode.normal) {
		stopHPPPRolling();
	}
	if (displayPrompt == 0) {
		while ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) == 0) {
			windowTickMinimal();
		}
	} else {
		outer: while (true) {
			copyToVRAM(VRAMCopyMode.unknown00, 2, cast(short)(0x7C20 + windowStats[windowTable[currentFocusWindow]].width + windowStats[windowTable[currentFocusWindow]].x + (windowStats[windowTable[currentFocusWindow]].y + windowStats[windowTable[currentFocusWindow]].height) * 32), cast(const(ubyte)*)&blinkingTriangleTiles[0]);
			for (short i = 15; i != 0; i--) {
				if ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) != 0) {
					break outer;
				}
				windowTickMinimal();
			}
			copyToVRAM(VRAMCopyMode.unknown00, 2, cast(short)(0x7C20 + windowStats[windowTable[currentFocusWindow]].width + windowStats[windowTable[currentFocusWindow]].x + (windowStats[windowTable[currentFocusWindow]].y + windowStats[windowTable[currentFocusWindow]].height) * 32), cast(const(ubyte)*)&blinkingTriangleTiles[1]);
			for (short i = 10; i != 0; i--) {
				if ((padPress[0] & (Pad.b | Pad.select | Pad.a | Pad.l)) != 0) {
					break outer;
				}
				windowTickMinimal();
			}
		}
		copyToVRAM(VRAMCopyMode.unknown00, 2, cast(short)(0x7C20 + windowStats[windowTable[currentFocusWindow]].width + windowStats[windowTable[currentFocusWindow]].x + (windowStats[windowTable[currentFocusWindow]].y + windowStats[windowTable[currentFocusWindow]].height) * 32), cast(const(ubyte)*)&blinkingTriangleTiles[2]);
	}
	resumeHPPPRolling();
}

/// $C102D0
void waitForActionscript() {
	actionScriptState = ActionScriptState.running;
	clearInstantPrinting();
	windowTick();
	while (actionScriptState == ActionScriptState.running) {
		if ((debugging != 0) && ((padState[0] & Pad.start) != 0) && ((padState[0] & Pad.select) != 0)) {
			return;
		}
		finishFrame();
	}
	actionScriptState = ActionScriptState.running;
}

/// $C10301
WinStat* getActiveWindowAddress() {
	if (windowHead == -1) {
		return &dummyWindow;
	}
	return &windowStats[windowTable[currentFocusWindow]];
}

/// $C10324
void transferActiveMemStorage() {
	WinStat* x0E = getActiveWindowAddress();
	x0E.mainRegisterBackup = x0E.mainRegister;
	x0E.subRegisterBackup = x0E.subRegister;
	x0E.loopRegisterBackup = x0E.loopRegister;
}

/// $C10380
void transferStorageMemActive() {
	WinStat* x0E = getActiveWindowAddress();
	x0E.mainRegister = x0E.mainRegisterBackup;
	x0E.subRegister = x0E.subRegisterBackup;
	x0E.loopRegister = x0E.loopRegisterBackup;
}

/** Gets the sub register for the active window. Used by control codes in the same way as the main register when two values are needed
 * See_Also: setSubRegister
 * Original_Address: $(DOLLAR)C103DC
 */
uint getSubRegister() {
	return getActiveWindowAddress().subRegister;
}

/** Gets the loop register for the active window. Used mostly by control codes that are intended to be used with loops
 * See_Also: setLoopRegister
 * Original_Address: $(DOLLAR)C10400
 */
ushort getLoopRegister() {
	return getActiveWindowAddress().loopRegister;
}

/** Gets the main register for the active window. Used to store large values or temporary non-constant values
 * See_Also: setMainRegister
 * Original_Address: $(DOLLAR)C1040A
 */
MainRegister getMainRegister() {
	return getActiveWindowAddress().mainRegister;
}

/** Increases the active window's loop register by 1.
 * Original_Address: $(DOLLAR)C1042E
 */
void incrementLoopRegister() {
	getActiveWindowAddress().loopRegister++;
}

/** Sets the loop register for the active window
 * See_Also: getLoopRegister
 * Original_Address: $(DOLLAR)C10443
 */
ushort setLoopRegister(ushort arg1) {
	getActiveWindowAddress().loopRegister = arg1;
	return arg1;
}

/** Sets the mainRegister for the active window
 * See_Also: getMainRegister
 * Original_Address: $(DOLLAR)C1045D
 */
MainRegister setMainRegister(MainRegister arg1) {
	getActiveWindowAddress().mainRegister = arg1;
	return arg1;
}

/** Sets the sub register for the active window
 * See_Also: getSubRegister
 * Original_Address: $(DOLLAR)C10489
 */
uint setSubRegister(uint arg1) {
	getActiveWindowAddress().subRegister = arg1;
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
void createWindow(short id) {
	WinStat* newWindow;
	if (windowTable[id] != -1) {
		currentFocusWindow = id;
		resetCurrentWindowMenu();
		newWindow = &windowStats[windowTable[id]];
	} else {
		short x0E = unknownC3E4EF();
		if (x0E == -1) {
			return;
		}
		newWindow = &windowStats[x0E];
		if (id == 10) {
			if (windowHead == -1) {
				newWindow.next = -1;
				windowTail = x0E;
			} else {
				windowStats[windowHead].previous = x0E;
				newWindow.next = windowHead;
			}
			newWindow.previous = -1;
			windowHead = x0E;
		} else {
			if (windowHead == -1) {
				newWindow.previous = -1;
				windowHead = x0E;
			} else {
				newWindow.previous = windowTail;
				windowStats[windowTail].next = x0E;
			}
			windowTail = x0E;
			newWindow.next = -1;
		}
		newWindow.windowID = id;
		windowTable[id] = x0E;
		newWindow.x = windowConfigurationTable[id].x;
		newWindow.y = windowConfigurationTable[id].y;
		newWindow.width = cast(short)(windowConfigurationTable[id].width - 2);
		newWindow.height = cast(short)(windowConfigurationTable[id].height - 2);
		newWindow.tilemapBuffer = &textTilemapBuffer[x0E][0];
		currentFocusWindow = id;
	}
	WinStat* activeWindow = getActiveWindowAddress();
	newWindow.textY = 0;
	newWindow.textX = 0;
	newWindow.numPadding = 0x80;
	newWindow.tileAttributes = 0;
	newWindow.font = 0;
	newWindow.mainRegister = activeWindow.mainRegister;
	newWindow.subRegister = activeWindow.subRegister;
	newWindow.mainRegisterBackup = activeWindow.mainRegisterBackup;
	newWindow.subRegisterBackup = activeWindow.subRegisterBackup;
	newWindow.loopRegister = activeWindow.loopRegister;
	newWindow.loopRegisterBackup = activeWindow.loopRegisterBackup;
	newWindow.selectedOption = -1;
	newWindow.optionCount = -1;
	newWindow.currentOption = -1;
	newWindow.menuColumns = 1;
	newWindow.menuPage = 1;
	newWindow.menuCallback = null;
	for (short i = cast(short)(newWindow.height * newWindow.width - 1); i >= 0; i--) {
		if (newWindow.tilemapBuffer[i] != 0) {
			freeTileSafe(newWindow.tilemapBuffer[i]);
		}
		newWindow.tilemapBuffer[i] = 0x40;
	}
	if (newWindow.titleID != 0) {
		titledWindows[newWindow.titleID - 1] = -1;
	}
	newWindow.title[0] = 0;
	newWindow.titleID = 0;
	resetVWFState();
	redrawAllWindows = 1;
	playerIntangibilityFlash();
}

/** Uploads the entire 8 rows of tiles that make up the HP/PP meters into VRAM
 * Original_Address: $(DOLLAR)C1078D
 */
void uploadHPPPMeterArea() {
	copyToVRAMAlt(VRAMCopyMode.unknown00, 0x240, 0x7E40, cast(ubyte*)&bg2Buffer[0x240]);
}

/// $C107AF - Draws a window
void drawWindow(short windowID) {
	ushort* windowContents = &windowStats[windowID].tilemapBuffer[0];
	ushort* dest = &bg2Buffer[windowStats[windowID].y * 32 + windowStats[windowID].x];
	short windowWidth = windowStats[windowID].width;
	short borderWidthWithoutDecorations = windowWidth;
	short windowHeight = windowStats[windowID].height;
	// if there's nothing or another transparent window corner behind this corner, use the transparent corner. otherwise use the non-transparent one
	if ((dest[0] == 0) || (dest[0] == (VRAMTextTile.thinWindowCorner | TilemapFlag.priority | TilemapFlag.palette7))) {
		(dest++)[0] = VRAMTextTile.thinWindowCorner | TilemapFlag.priority | TilemapFlag.palette7;
	} else {
		(dest++)[0] = VRAMTextTile.thinWindowCornerNoTransparency | TilemapFlag.priority | TilemapFlag.palette7;
	}
	// handle title tiles if any
	if (windowStats[windowID].titleID != 0) {
		short titleTile = cast(short)((windowStats[windowID].titleID - 1) * 16 + 0x2E0);
		(dest++)[0] = VRAMTextTile.thinWindowVBorderTruncated | TilemapFlag.priority | TilemapFlag.palette7;
		short nonTitleBorderWidth = cast(short)(windowWidth - 1);
		for (short i = cast(short)(((strlen(cast(char*)&windowStats[windowID].title[0]) * 6) + 7) / 8); i != 0; i--) {
			(dest++)[0] = cast(ushort)(titleTile++ + TilemapFlag.priority);
			nonTitleBorderWidth--;
		}
		(dest++)[0] = VRAMTextTile.thinWindowVBorderTruncated | TilemapFlag.priority | TilemapFlag.hFlip | TilemapFlag.palette7;
		borderWidthWithoutDecorations = cast(short)(nonTitleBorderWidth - 1);
	}
	// reserve space for pagination arrows
	if ((windowStats[windowID].windowID == paginationWindow) && (paginationAnimationFrame != -1)) {
		borderWidthWithoutDecorations -= 4;
	}
	// fill in the non-decoration upper border tiles
	for (short i = borderWidthWithoutDecorations; i != 0; i--) {
		(dest++)[0] = VRAMTextTile.thinWindowHBorder | TilemapFlag.priority | TilemapFlag.palette7;
	}
	// pagination arrows
	if ((windowStats[windowID].windowID == paginationWindow) && (paginationAnimationFrame != -1)) {
		for (short i = 0; i < 4; i++) {
			(dest++)[0] = paginationArrowTiles[paginationAnimationFrame][i];
		}
	}
	// upper-right corner, same logic as upper-left
	if ((dest[0] == 0) || (dest[0] == (VRAMTextTile.thinWindowCorner | TilemapFlag.priority | TilemapFlag.hFlip | TilemapFlag.palette7))) {
		(dest++)[0] = VRAMTextTile.thinWindowCorner | TilemapFlag.priority | TilemapFlag.hFlip | TilemapFlag.palette7;
	} else {
		(dest++)[0] = VRAMTextTile.thinWindowCornerNoTransparency | TilemapFlag.priority | TilemapFlag.hFlip | TilemapFlag.palette7;
	}
	// move to next line
	dest += 32 - windowWidth - 2;
	// vertical border, window contents, vertical border
	for (short i = windowHeight; i != 0; i--) {
		(dest++)[0] = VRAMTextTile.thinWindowVBorder | TilemapFlag.priority | TilemapFlag.palette7;
		for (short j = windowWidth; j != 0; j--) {
			(dest++)[0] = cast(ushort)((windowContents++)[0] + TilemapFlag.priority);
		}
		(dest++)[0] = VRAMTextTile.thinWindowVBorder | TilemapFlag.priority | TilemapFlag.hFlip | TilemapFlag.palette7;
		// next line
		dest += 32 - windowWidth - 2;
	}
	// bottom-left corner, same logic as upper-left
	if ((dest[0] == 0) || (dest[0] == (VRAMTextTile.thinWindowCorner | TilemapFlag.priority | TilemapFlag.vFlip | TilemapFlag.palette7))) {
		(dest++)[0] = VRAMTextTile.thinWindowCorner | TilemapFlag.priority | TilemapFlag.vFlip | TilemapFlag.palette7;
	} else {
		(dest++)[0] = VRAMTextTile.thinWindowCornerNoTransparency | TilemapFlag.priority | TilemapFlag.vFlip | TilemapFlag.palette7;
	}
	// bottom border
	for (short i = windowWidth; i != 0; i--) {
		(dest++)[0] = VRAMTextTile.thinWindowHBorder | TilemapFlag.priority | TilemapFlag.vFlip | TilemapFlag.palette7;
	}
	// bottom-right corner, same logic as upper-left
	if ((dest[0] == 0) || (dest[0] == (VRAMTextTile.thinWindowCorner | TilemapFlag.priority | TilemapFlag.vFlip | TilemapFlag.hFlip | TilemapFlag.palette7))) {
		(dest++)[0] = VRAMTextTile.thinWindowCorner | TilemapFlag.priority | TilemapFlag.vFlip | TilemapFlag.hFlip | TilemapFlag.palette7;
	} else {
		(dest++)[0] = VRAMTextTile.thinWindowCornerNoTransparency | TilemapFlag.priority | TilemapFlag.vFlip | TilemapFlag.hFlip | TilemapFlag.palette7;
	}
}

/// $C10A04
void showHPPPWindows() {
	resetActivePartyMemberHPPPWindow();
	renderHPPPWindows = 1;
	redrawAllWindows = 1;
	currentlyDrawnHPPPWindows = -1;
}

/// $C10A1D
void hideHPPPWindows() {
	resetActivePartyMemberHPPPWindow();
	renderHPPPWindows = 0;
	if (battleModeFlag == 0) {
		for (short i = 0; i != gameState.playerControlledPartyMemberCount; i++) {
			undrawHPPPWindow(i);
			partyCharacters[gameState.partyMembers[i] - 1].hp.current.integer = partyCharacters[gameState.partyMembers[i] - 1].hp.target;
			partyCharacters[gameState.partyMembers[i] - 1].pp.current.integer = partyCharacters[gameState.partyMembers[i] - 1].pp.target;
			partyCharacters[gameState.partyMembers[i] - 1].hp.current.fraction = 0;
			partyCharacters[gameState.partyMembers[i] - 1].pp.current.fraction = 0;
		}
	}
	redrawAllWindows = 1;
}

/** Draws a tall text tile into a window at the current cursor position.
 *
 * If tile == TallTextTile.equipped, attributes will be overridden to always use palette 3. This does NOT handle VWF text at all!
 * Params:
 * 	window = Window ID to draw to
 * 	tile = The TallTextTile to draw
 * 	attributes = Attributes to apply to the text (See TileMapFlag for values)
 * Original_Address: $(DOLLAR)C10A85
 */
void drawTallTextTile(short window, short tile, ushort attributes) {
	if (windowTable[window] == -1) {
		return;
	}
	short x = windowStats[windowTable[window]].textX;
	short y = windowStats[windowTable[window]].textY;
	// handle wrapping
	if (x == windowStats[windowTable[window]].width) {
		if (y != (windowStats[windowTable[window]].height / 2) - 1) {
			y++;
		} else {
			moveTextUpOneLine(window);
		}
		x = 0;
	}
	{
		// drawing a start-of-line tile at the start of the line with textPromptMode set?
		if ((textPromptMode != TextPromptMode.normal) && (x == 0) && ((tile == TallTextTile.windowBackground) || (tile == TallTextTile.textBullet))) {
			if (textPromptMode == TextPromptMode.fast1) {
				// don't actually draw anything, just skip ahead to moving the cursor
				goto skipDrawing;
			}
			if (textPromptMode == TextPromptMode.fast2) {
				tile = TallTextTile.windowBackground;
			}
		}
		const baseTileID = ((tile & 0xFFF0) * 2) + (tile & 0xF) + ((tile == TallTextTile.equipped) ? TilemapFlag.palette3 : attributes);
		const tilemapBase = (windowStats[windowTable[window]].width * y * 2) + x;
		windowStats[windowTable[window]].tilemapBuffer[tilemapBase] = cast(ushort)baseTileID;
		windowStats[windowTable[window]].tilemapBuffer[tilemapBase + windowStats[windowTable[window]].width] = cast(ushort)(baseTileID + 0x10);
		x++;
	}
	skipDrawing:
	windowStats[windowTable[window]].textX = x;
	windowStats[windowTable[window]].textY = y;
}

/// $C10BA1
void drawTallTextTileFocused(short tile) {
	if (currentFocusWindow == -1) {
		return;
	}
	drawTallTextTile(currentFocusWindow, tile, windowStats[windowTable[currentFocusWindow]].tileAttributes);
}

/// $C10BD3
void cc12() {
	clearCurrentTextLine(currentFocusWindow);
	moveCurrentTextCursor(0, windowStats[windowTable[currentFocusWindow]].textY);
}

/// $C10BFE
MenuOption* createNewMenuOptionAtPositionWithUserdataF(short userdata, short x, short y, const(ubyte)* label, string selectedText) {
	return createNewMenuOptionAtPositionWithUserdata(userdata, x, y, label, selectedText);
}

/// $C10C49
short getMenuOptionCountF(short arg1) {
	return getMenuOptionCount(arg1);
}

/// $C10C55
short unknownC10C55(uint arg1) {
	return splitDecimalByDigits(arg1);
}

/// $C10C79
void printNewLineF() {
	printNewLine();
}

/// $C10C80
void drawTallTextTileFocusedF(short tile) {
	drawTallTextTileFocused(tile);
}

/// $C10C86
void printLetterVWFF(short arg1) {
	printLetterVWF(arg1);
}

/// $C10C8C
void printStringF(short length, const(ubyte)* text) {
	printString(length, text);
}

/// $C10CAF
void moveTextUpOneLineF(short arg1) {
	moveTextUpOneLine(arg1);
}

/// $C10CB6
void printLetterVWF(short letter) {
	if (currentFocusWindow == -1) {
		return;
	}
	renderVWFCharacterToWindow(windowStats[windowTable[currentFocusWindow]].font, letter);
	if (windowTable[currentFocusWindow] != windowTail) {
		redrawAllWindows = 1;
	}
	bool playSound;
	if (textSoundMode == TextSoundMode.always) {
		playSound = true;
	} else if (textSoundMode == TextSoundMode.never) {
		playSound = false;
	} else {
		playSound = false;
		if (textPromptMode == TextPromptMode.normal) {
			playSound = true;
		}
	}
	// play a sound for each letter printed
	if (playSound && (instantPrinting == 0) && (letter != 0x20) && (letter != ebChar(' '))) {
		playSfx(Sfx.textPrint);
	}
	if (instantPrinting == 0) {
		for (short i = cast(short)(selectedTextSpeed + (config.instantSpeedText ? 0 : 1)); i != 0; i--) {
			windowTick();
		}
	}
}

/// $C10D60 - Put a tile on the focused window -- How is this different from "PrintIcon" ($C43F77)?
void drawTallTextTileFocusedRedraw(short tile) {
	drawTallTextTileFocused(tile);
	if (windowTable[currentFocusWindow] != windowTail) {
		redrawAllWindows = 1;
	}
}

/// $C10D7C
short splitDecimalByDigits(uint value) {
	short result = 1;
	ubyte* dest = &numberTextBuffer[6];
	while (value >= 10) {
		*(dest--) = value % 10;
		value /= 10;
		result++;
	}
	dest[0] = cast(ubyte)value;
	return result;
}

/// $C10DF6
void printNumber(uint value) {
	if (currentFocusWindow == -1) {
		return;
	}
	version(bugfix) {
		enum limit = 9_999_999;
	} else {
		//C enums can only be ints, and 9,999,999 does not fit in a 16-bit int
		enum limit = cast(short)9_999_999;
	}
	if (limit < value) {
		value = limit;
	}
	// split number into digits and print each individually
	short numberOfDigits = splitDecimalByDigits(value);
	ubyte* numberBuffer = &numberTextBuffer[7 - numberOfDigits];
	// pad digits if applicable
	byte numberPadding = windowStats[windowTable[currentFocusWindow]].numPadding;
	if (numberPadding >= 0) {
		short paddingPixels = (numberPadding & 0xF) + 1;
		if (paddingPixels < numberOfDigits) {
			paddingPixels = numberOfDigits;
		}
		alignNumber(cast(short)((paddingPixels - numberOfDigits) * 6));
	}
	while (numberOfDigits != 0) {
		printLetterVWF(*(numberBuffer++) + ebChar('0'));
		numberOfDigits--;
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
void printSpecialGraphics(short arg1) {
	switch (arg1) {
		case 1:
			printSMAAAASH();
			break;
		case 2:
			printYouWon();
			break;
		default: break;
	}
}

/// $C10EFC
void printString(short length, const(ubyte)* text) {
	if (forceCentreTextAlignment != 0) {
		setCentreAlignment(text, length);
	}
	while ((text[0] != 0) && (length != 0)) {
		length--;
		printLetterVWF((text++)[0]);
	}
}

/// $C10F40
void unknownC10F40(short window) {
	if (window == -1) {
		return;
	}
	ushort* buffer = &windowStats[windowTable[window]].tilemapBuffer[0];
	// free and clear all tiles in window
	for (short i = cast(short)(windowStats[windowTable[window]].height * windowStats[windowTable[window]].width); i != 0; i--) {
		if (buffer[0] != 0) {
			freeTileSafe(buffer[0]);
		}
		buffer[0] = 0x40;
		buffer++;
	}
	resetVWFState();
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
	windowStats[windowTable[currentFocusWindow]].tileAttributes = cast(ushort)(windowID * TilemapFlag.palette1);
}

/// $C1101C
int numSelectPrompt(short digits) {
	if (currentFocusWindow == -1) {
		return 0;
	}
	short x = windowStats[windowTable[currentFocusWindow]].textX;
	short y = windowStats[windowTable[currentFocusWindow]].textY;
	int value = 0;
	short cursorPosition = 1;
	int valueAdd = 1;
	outer: while (true) {
		setInstantPrinting();
		moveCurrentTextCursor(x, y);
		const short numberOfDigits = splitDecimalByDigits(value);
		// lowest value is at the end of the buffer
		const(ubyte)* numberBuffer = &numberTextBuffer[7 - numberOfDigits];
		short currentDigitPositionPrinted;
		// handle leading zeros
		for (currentDigitPositionPrinted = digits; currentDigitPositionPrinted > numberOfDigits; currentDigitPositionPrinted--) {
			printLetter((currentDigitPositionPrinted == cursorPosition) ? baseNumberSelectorCharacter1 : baseNumberSelectorCharacter2 + 0);
		}
		// print number
		for (; currentDigitPositionPrinted != 0; currentDigitPositionPrinted--) {
			printLetter((numberBuffer++)[0] + ((currentDigitPositionPrinted == cursorPosition) ? baseNumberSelectorCharacter1 : baseNumberSelectorCharacter2));
		}
		clearInstantPrinting();
		windowTick();
		while (true) {
			windowTickMinimal();
			if (((padPress[0] & Pad.left) != 0) && (cursorPosition < digits)) {
				playSfx(Sfx.cursor2);
				cursorPosition++;
				valueAdd *= 10;
				continue outer;
			} else if (((padPress[0] & Pad.right) != 0) && (cursorPosition > 1)) {
				playSfx(Sfx.cursor2);
				cursorPosition--;
				valueAdd /= 10;
				continue outer;
			} else if ((padHeld[0] & Pad.up) != 0) {
				playSfx(Sfx.cursor3);
				if ((value / valueAdd) % 10 != 9) {
					value += valueAdd;
				} else {
					value -= valueAdd * 9;
				}
				continue outer;
			} else if ((padHeld[0] & Pad.down) != 0) {
				playSfx(Sfx.cursor3);
				if ((value / valueAdd) % 10 != 0) {
					value -= valueAdd;
				} else {
					value += valueAdd * 9;
				}
				continue outer;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				playSfx(Sfx.cursor1);
				return value;
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
	openWalletWindow();
}

/** Finds an unused menu option and returns its index
 * Returns: The index of the first free menu option, or -1 if none available
 * Original_Address: $(DOLLAR)C11354
 */
short findFreeMenuOption() {
	for (short i = 0; i < menuOptions.length; i++) {
		if (menuOptions[i].type == MenuOptionType.available) {
			return i;
		}
	}
	return -1;
}

/** Resets the menu state for the currently active window.
 * See_Also: earthbound.bank03.resetWindowMenu
 * Original_Address: $(DOLLAR)C11383
 */
void resetCurrentWindowMenu() {
	resetWindowMenu(currentFocusWindow);
}

/// $C1138D
short getMenuOptionCount(short firstOption) {
	if (firstOption == -1) {
		return 0;
	}
	short count = 1;
	for (MenuOption* tmp = &menuOptions[firstOption]; tmp.next != -1; tmp++) {
		count++;
	}
	return count;
}

/** Creates a new menu option for the currently active window using the specified label and script
 * Params:
 * 	label = The null-terminated text label for the menu option
 * 	selectedText = The text script to run when the menu option is chosen
 * Returns: A pointer to the newly-created menu option
 * Original_Address: $(DOLLAR)C113D1
 */
MenuOption* createNewMenuOptionActive(const(ubyte)* label, string selectedText) {
	// in case of no open window or no free menu options, just return the last one in the array
	if (currentFocusWindow == Window.invalid) {
		return &menuOptions[$ - 1];
	}
	short newOptionIndex = findFreeMenuOption();
	if (newOptionIndex == -1) {
		return &menuOptions[$ - 1];
	}

	if (windowStats[windowTable[currentFocusWindow]].currentOption == -1) {
		// first new option for window
		menuOptions[newOptionIndex].previous = -1;
		windowStats[windowTable[currentFocusWindow]].currentOption = newOptionIndex;
	} else {
		menuOptions[newOptionIndex].previous = windowStats[windowTable[currentFocusWindow]].optionCount;
		menuOptions[windowStats[windowTable[currentFocusWindow]].optionCount].next = newOptionIndex;
	}
	windowStats[windowTable[currentFocusWindow]].optionCount = newOptionIndex;
	menuOptions[newOptionIndex].next = -1;
	menuOptions[newOptionIndex].type = MenuOptionType.standard;
	menuOptions[newOptionIndex].script = selectedText;
	menuOptions[newOptionIndex].page = 1;
	menuOptions[newOptionIndex].sfx = Sfx.cursor1;
	// set the label
	ubyte* labelBuffer = &menuOptions[newOptionIndex].label[0];
	do {
		(labelBuffer++)[0] = label[0];
	} while ((label++)[0] != 0);
	return &menuOptions[newOptionIndex];
}

/** Creates a new menu option for the currently active window at specific coordinates
 * Params:
 * 	x = Tile X coordinate to place the menu option at
 * 	y = Tile Y coordinate to place the menu option at
 * 	label = The null-terminated text label for the menu option
 * 	selectedText = The text script to run when the menu option is chosen
 * Returns: A pointer to the newly-created menu option
 * See_Also: createNewMenuOptionActive
 * Original_Address: $(DOLLAR)C114B1
 */
MenuOption* createNewMenuOptionAtPosition(short x, short y, const(ubyte)* label, string selectedText) {
	MenuOption* newOption = createNewMenuOptionActive(label, selectedText);
	newOption.pixelAlign = 0;
	if (forceLeftTextAlignment != 0) {
		newOption.pixelAlign = x & 7;
		x = x >> 3;
	}
	newOption.textX = x;
	newOption.textY = y;
	return newOption;
}

/** Create a new menu option for the currently active window at specific coordinates with userdata attached
 * Params:
 * 	userdata = The userdata to attach to the menu option
 * 	x = Tile X coordinate to place the menu option at
 * 	y = Tile Y coordinate to place the menu option at
 * 	label = The null-terminated text label for the menu option
 * 	selectedText = The text script to run when the menu option is chosen
 * Returns: A pointer to the newly-created menu option
 * See_Also: createNewMenuOptionAtPosition
 * Original_Address: $(DOLLAR)C1153B
 */
MenuOption* createNewMenuOptionAtPositionWithUserdata(short userdata, short x, short y, const(ubyte)* label, string selectedText) {
	MenuOption* option = createNewMenuOptionAtPosition(x, y, label, selectedText);
	option.userdata = userdata;
	option.type = MenuOptionType.hasUserdata;
	return option;
}

/** Create a new menu option for the currently active window at specific coordinates with userdata and SFX attached
 * Params:
 * 	userdata = The userdata to attach to the menu option
 * 	x = Tile X coordinate to place the menu option at
 * 	y = Tile Y coordinate to place the menu option at
 * 	label = The null-terminated text label for the menu option
 * 	selectedText = The text script to run when the menu option is chosen
 * 	sfx = The sound effect to play when chosen
 * Returns: A pointer to the newly-created menu option
 * See_Also: createNewMenuOptionAtPositionWithUserdata
 * Original_Address: $(DOLLAR)C11596
 */
MenuOption* createNewMenuOptionAtPositionWithUserdataSFX(short userdata, short x, short y, const(ubyte)* label, string selectedText, ubyte sfx) {
	MenuOption* option = createNewMenuOptionAtPositionWithUserdata(userdata, x, y, label, selectedText);
	option.sfx = sfx;
	return option;
}

/** Create a new menu option for the currently active window with userdata attached
 * Params:
 * 	userdata = The userdata to attach to the menu option
 * 	label = The null-terminated text label for the menu option
 * 	selectedText = The text script to run when the menu option is chosen
 * Returns: A pointer to the newly-created menu option
 * See_Also: createNewMenuOptionActive
 * Original_Address: $(DOLLAR)C115F4
 */
MenuOption* createNewMenuOptionWithUserdata(short userdata, const(ubyte)* label, string selectedText) {
	MenuOption* x = createNewMenuOptionActive(label, selectedText);
	x.userdata = userdata;
	x.type = MenuOptionType.hasUserdata;
	return x;
}

/** Prints the options into the active window
 * Original_Address: $(DOLLAR)C1163C
 */
void printMenuItems() {
	if (currentFocusWindow == -1) {
		return;
	}
	if (windowStats[windowTable[currentFocusWindow]].currentOption == -1) {
		earlyTickExit = 0xFF;
		return;
	}
	MenuOption* option = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
	setInstantPrinting();
	while (true) {
		if ((option.page == windowStats[windowTable[currentFocusWindow]].menuPage) || (option.page == 0)) {
			printOptionStart(option);
			if (option.page == 0) {
				windowSetTextColor(TextPalette.normal);
				printLetter(TallTextTile.rightArrowLargeBlue);
				nextVWFTile();
				windowSetTextColor(TextPalette.normal);
				ubyte* src = &windowStats[windowTable[currentFocusWindow]].title[0];
				if (src[0] != 0) {
					ubyte* dest;
					for (dest = &temporaryTextBuffer[0]; (src[0] != 0) && (src[0] != ebChar('(')); dest++) {
						dest[0] = (src++)[0];
					}
					(dest++)[0] = ebChar('(');
					(dest++)[0] = cast(ubyte)(windowStats[windowTable[currentFocusWindow]].menuPage + ebChar('0'));
					(dest++)[0] = ebChar(')');
					dest[0] = 0;
					nextVWFTile();
					setWindowTitle(currentFocusWindow, -1, &temporaryTextBuffer[0]);
					nextVWFTile();
					printString(cast(short)(strlen(cast(char*)&temporaryTextBuffer[0]) - 2), &temporaryTextBuffer[0]);
					printLetterVWF((windowStats[windowTable[currentFocusWindow]].menuPage == menuOptions[menuOptions[windowStats[windowTable[currentFocusWindow]].optionCount].previous].page) ? ebChar('1') : cast(ubyte)(windowStats[windowTable[currentFocusWindow]].menuPage + ebChar('1')));
					printLetterVWF(ebChar(')'));
				} else {
					printString(-1, &option.label[0]);
				}
			} else {
				printString(-1, &option.label[0]);
			}
		}
		if (option.next == -1) {
			break;
		}
		option = &menuOptions[option.next];
	}
}

/** Prints a table of menu options into the current active window
 * Params:
 * 	columns = Number of columns of menu options to create
 * 	altSpacingMode = unclear
 * 	unused = Unused
 * Original_Address: $(DOLLAR)C1180D
 */
void printMenuOptionTable(short columns, short altSpacingMode, short unused) {
	createMenuOptionTable(columns, 0, altSpacingMode);
	printMenuItems();
}

/** Prints a table of menu options into the current active window with a specified option preselected
 * Params:
 * 	columns = Number of columns of menu options to create
 * 	altSpacingMode = unclear
 * 	preselected = The index of the option to preselect
 * Original_Address: $(DOLLAR)C1181B
 */
void printMenuOptionTablePreselected(short columns, short altSpacingMode, short preselected) {
	createMenuOptionTable(columns, 0, altSpacingMode);
	if (preselected != -1) {
		windowStats[windowTable[currentFocusWindow]].selectedOption = preselected;
		MenuOption* option = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		while (preselected != 0) {
			preselected--;
			option = &menuOptions[option.next];
		}
		windowStats[windowTable[currentFocusWindow]].menuPage = option.page;
	}
	printMenuItems();
}

/** Prints a list menu with a preselected option
 * Params:
 * 	optionIndex = The index of the option to select
 * Original_Address: $(DOLLAR)C11887
 */
void printMenuItemsPreselected(short optionIndex) {
	windowStats[windowTable[currentFocusWindow]].selectedOption = optionIndex;
	MenuOption* option = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
	while (optionIndex != 0) {
		optionIndex--;
		option = &menuOptions[option.next];
	}
	windowStats[windowTable[currentFocusWindow]].menuPage = option.page;
	printMenuItems();
}

/** Get target X/Y window positions after menu cursor movement
 * Original_Address: $(DOLLAR)C118E7
 * Returns: low byte = X, high byte = Y or -1 if no valid options
 */
short moveCursorWrap(short curX, short curY, short deltaX, short deltaY, short sfx, short wrapX, short wrapY) {
	short result = moveCursor(curX, curY, deltaX, deltaY, -1);
	if (result == -1) {
		result = moveCursor(wrapX, wrapY, deltaX, deltaY, -1);

		if (deltaX == 0) {
			if (((result >> 8) & 0xFF) != curY) {
				result = -1;
			}
		} else {
			if ((result & 0xFF) != curX) {
				result = -1;
			}
		}
	}
	if (result != -1) {
		playSfx(sfx);
	}
	return result;
}

/** Handle player input for text window menus until a choice is made
 * Params:
 * 	cancelable = 1 if the player may exit the menu without making a selection, 0 otherwise
 * Returns: Either the userdata/index associated with a menu option or 0 if no choice was made
 * Original_Address: $(DOLLAR)C1196A
 */
short selectionMenu(short cancelable) {
	short windowID = currentFocusWindow;
	if (windowID == Window.invalid) return 0;

	WinStat* window = &windowStats[windowTable[currentFocusWindow]];

	if (restoreMenuBackup) {
		window.currentOption = menuBackupCurrentOption;
		window.selectedOption = menuBackupSelectedOption;
	}

	short selectedOptionIndex;
	MenuOption* highlightedOption;
	if (window.selectedOption != -1) { // player chose an option
		short count = window.selectedOption;
		selectedOptionIndex = count;

		highlightedOption = &menuOptions[window.currentOption];
		// we have an option index, iterate through that many options
		while (count) {
			count--;
			highlightedOption = &menuOptions[highlightedOption.next];
		}

		// remove highlighting
		setInstantPrinting();
		moveCurrentTextCursorOption(highlightedOption, highlightedOption.textX, highlightedOption.textY);
		setTextHighlighting(0xFFFF, 0, highlightedOption.label.ptr);
	} else { // no option chosen yet
		selectedOptionIndex = 0;
		highlightedOption = &menuOptions[window.currentOption];
	}

	short idleTimer;
	short cursorPosition;
	outer: while (true) {
		idleTimer = 0;
		if (highlightedOption.script) {
			setInstantPrinting();
			displayText(getTextBlock(highlightedOption.script));
		}

		if (window.menuCallback) {
			short index = cast(short)((highlightedOption.type == MenuOptionType.standard) ? selectedOptionIndex+1 : highlightedOption.userdata);
			window.menuCallback(index);
			setWindowFocus(windowID);
		}

		clearInstantPrinting();
		if (restoreMenuBackup) {
			highlightedOption.textX = menuBackupSelectedTextX;
			highlightedOption.textY = menuBackupSelectedTextY;
		}

		moveCurrentTextCursorOption(highlightedOption, highlightedOption.textX, highlightedOption.textY);
		windowSetTextColor(TextPalette.miscUIElements);
		drawTallTextTileFocusedRedraw(TallTextTile.menuCursor);
		windowSetTextColor(TextPalette.normal);
		windowTick();

		short cursorFrame = 1;
		inner: while (true) {
			cursorFrame ^= 1;

			ushort vramAddress = cast(ushort)((window.x + window.textX) + ((window.textY * 2 + window.y) * 32) + 0x7C20);

			copyToVRAM(VRAMCopyMode.unknown00, 2, vramAddress, cast(const(ubyte)*)&selectionCursorFramesUpper[cursorFrame]);
			copyToVRAM(VRAMCopyMode.unknown00, 2, cast(ushort)(vramAddress+32), cast(const(ubyte)*)&selectionCursorFramesLower[cursorFrame]);

			for (short i = 0; i < 10; i++) { // wait a maximum of ten frames for input
				windowTickMinimal();

				if (padPress[0] & Pad.up) {
					cursorPosition = moveCursorWrap(highlightedOption.textX, highlightedOption.textY, -1, 0, Sfx.cursor3, highlightedOption.textX, window.height / 2);
					break inner;
				}

				if (padPress[0] & Pad.left) {
					cursorPosition = moveCursorWrap(highlightedOption.textX, highlightedOption.textY, 0, -1, Sfx.cursor2, window.width, highlightedOption.textY);
					break inner;
				}

				if (padPress[0] & Pad.down) {
					cursorPosition = moveCursorWrap(highlightedOption.textX, highlightedOption.textY, 1, 0, Sfx.cursor3, highlightedOption.textX, -1);
					break inner;
				}

				if (padPress[0] & Pad.right) {
					cursorPosition = moveCursorWrap(highlightedOption.textX, highlightedOption.textY, 0, 1, Sfx.cursor2, -1, highlightedOption.textY);
					break inner;
				}

				if (padHeld[0] & Pad.up) {
					cursorPosition = moveCursor(highlightedOption.textX, highlightedOption.textY, -1, 0, 3);
					break inner;
				}

				if (padHeld[0] & Pad.left) {
					cursorPosition = moveCursor(highlightedOption.textX, highlightedOption.textY, 0, -1, 2);
					break inner;
				}

				if (padHeld[0] & Pad.down) {
					cursorPosition = moveCursor(highlightedOption.textX, highlightedOption.textY, 1, 0, 3);
					break inner;
				}

				if (padHeld[0] & Pad.right) {
					cursorPosition = moveCursor(highlightedOption.textX, highlightedOption.textY, 0, 1, 2);
				}

				if (padPress[0] & (Pad.a|Pad.l)) {
					setInstantPrinting();
					if (highlightedOption.page) {
						playSfx(highlightedOption.sfx);
						moveCurrentTextCursorOption(highlightedOption, highlightedOption.textX, highlightedOption.textY);
						drawTallTextTileFocusedRedraw(TallTextTile.nonBreakingSpace);
						windowSetTextColor(TextPalette.highlighted);

						if (enableWordWrap) {
							if (allowTextOverflow != 1) {
								if (currentFocusWindow == Window.fileSelectMain) {
									fillRestOfWindowLine();
								} else {
									setTextHighlighting(4, 1, highlightedOption.label.ptr);
								}
							} else {
								setTextHighlighting(0xFFFF, 1, highlightedOption.label.ptr);
							}
						} else {
							fillRestOfWindowLine();
						}

						windowSetTextColor(TextPalette.normal);
						clearInstantPrinting();

						window.selectedOption = selectedOptionIndex;
						return (highlightedOption.type == MenuOptionType.standard) ? cast(short)(selectedOptionIndex+1) : highlightedOption.userdata;
					}

					playSfx(Sfx.cursor2);
					clearFocusWindow(); // Clear the focused window

					if (window.menuPage == menuOptions[highlightedOption.previous].page) {
						window.menuPage = 1;
					} else {
						window.menuPage++;
					}

					clearInstantPrinting();
					removeWindowFromScreen(windowID);
					windowTick();

					printMenuItems(); // Print the options for the new page
					setInstantPrinting();
					continue outer; // Back to the start....
				}

				if ((padPress[0] & (Pad.b|Pad.select)) && cancelable == 1) { // exiting without choosing anything
					playSfx(Sfx.cursor2);
					return 0;
				}

				++idleTimer;
				if (windowTable[0] == windowTail) { // If the field/overworld commands window is the last opened window...
					if (idleTimer > 60) { // If 60 frames have passed
						if (windowTable[10] == -1) { // If the wallet window is not open
							openHpAndWallet();
							setWindowFocus(0);
							// Funky! I didn't expect a goto back to the start here...
							// The reason this is here is because the code path from label1 calls windowTick (draws the HP and wallet windows) and resets idleTimer.
							// Why they didn't just do that here, I have no idea. This has the "side-effect" of acting as if the player
							// moved the cursor into the same option again, calling the option select script and the window menu callback
							continue outer; // Back to the start...
						}
					}
				}
			}
		}
		if (cursorPosition == -1) {
			continue;
		}

		short optionIndex = 0;
		MenuOption *tmpOption = &menuOptions[window.currentOption];

		short tmp = cursorPosition & 0xFF;
		cursorPosition = cursorPosition >> 8;

		while ((tmpOption.textX != tmp) || (tmpOption.textY != cursorPosition) || ((tmpOption.page != window.menuPage) && (tmpOption.page != 0))) {
			++optionIndex;
			tmpOption = &menuOptions[tmpOption.next];
		}

		moveCurrentTextCursorOption(highlightedOption, highlightedOption.textX, highlightedOption.textY);
		drawTallTextTileFocusedRedraw(TallTextTile.nonBreakingSpace);

		selectedOptionIndex = optionIndex;
		highlightedOption = tmpOption;
	}
	assert(0, "This should never be reached");
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
short getBattlerPositionX(short row, short arg2) {
	if (row == Row.front) {
		return battlerFrontRowXPositions[arg2];
	} else {
		return battlerBackRowXPositions[arg2];
	}
}

/// $C11FD4
short getTargettingAllowed(short row, short arg2, short action) {
	if ((row == Row.back) && (battleActionTable[action].type == ActionType.physical) && (getPhysicalTargettingAllowed(arg2) == 0)) {
		return 0;
	}
	return 1;
}

/// $C12012
short getNextTargetRight(short row, short position, short action) {
	short numBattlersInRow;
	ubyte* rowBattlerXPositions;
	// which row are we targetting?
	if (row == Row.front) {
		numBattlersInRow = numBattlersInFrontRow;
		rowBattlerXPositions = &battlerFrontRowXPositions[0];
	} else {
		numBattlersInRow = numBattlersInBackRow;
		rowBattlerXPositions = &battlerBackRowXPositions[0];
	}
	// find first battler in row with a greater X position
	for (short i = 0; i < numBattlersInRow; i++) {
		if ((rowBattlerXPositions++)[0] > position) {
			if (getTargettingAllowed(row, i, action) != 0) {
				return i;
			}
		}
	}
	return -1;
}

/// $C12070
short getNextTargetLeft(short row, short position, short action) {
	version(noUndefinedBehaviour) {
		short numBattlersInRow;
		ubyte[] battlerRowXPositions;
		if (row == Row.front) {
			numBattlersInRow = numBattlersInFrontRow;
			battlerRowXPositions = battlerFrontRowXPositions;
		} else {
			numBattlersInRow = numBattlersInBackRow;
			battlerRowXPositions = battlerBackRowXPositions;
		}
		for (short i = cast(short)(numBattlersInRow - 1); i >= 0; i--) {
			if (battlerRowXPositions[i] < position) {
				if (getTargettingAllowed(row, i, action) != 0) {
					return i;
				}
			}
		}
		return -1;
	} else {
		short numBattlersInRow;
		ubyte* rowBattlerXPositions;
		// which row are we targetting?
		// note that we start looking at the END of the row, not the start
		if (row == Row.front) {
			numBattlersInRow = numBattlersInFrontRow;
			rowBattlerXPositions = &battlerFrontRowXPositions[numBattlersInRow - 1];
		} else {
			numBattlersInRow = numBattlersInBackRow;
			rowBattlerXPositions = &battlerBackRowXPositions[numBattlersInRow - 1];
		}
		// find first battler in row with a lesser X position
		for (short i = cast(short)(numBattlersInRow - 1); i + 1 != 0; i--) {
			if ((rowBattlerXPositions--)[0] < position) {
				if (getTargettingAllowed(row, i, action) != 0) {
					return i;
				}
			}
		}
		return -1;
	}
}

/// $C120D6
void printTargetName(short row, short target) {
	setInstantPrinting();
	createWindow(Window.unknown31);
	printString(battleToText.length, &battleToText[0]);
	if (target != -1) {
		unknownC23E8A(cast(short)(row * numBattlersInFrontRow + target + 1));
		printBattlerArticle(0);
		printString(255, getBattleAttackerName());
		ubyte* afflictions = (row != Row.front) ? &battlersTable[backRowBattlers[target]].afflictions[0] : &battlersTable[frontRowBattlers[target]].afflictions[0];
		moveCurrentTextCursor(17, 0);
		printLetter(unknownC223D9(afflictions, 0));
	} else {
		printString(battleBackRowText.length, (row != Row.front) ? &battleBackRowText[0] : &battleFrontRowText[0]);
	}
	clearInstantPrinting();
}

/// $C121B8
short pickTargetSingle(short cancellable, short action) {
	short result;
	short dontUpdateTargetName = 0;
	short targetSelected = 0;
	short row = (numBattlersInFrontRow != 0) ? Row.front : Row.back;
	if (currentGiygasPhase != 0) {
		row = Row.back;
	}
	outer: while (true) {
		short cursorSFX;
		short newTarget;
		short tmpRow;
		short targetPosition = getBattlerPositionX(row, targetSelected);
		singleEnemyFlashingOn(row, targetSelected);
		if (dontUpdateTargetName == 0) {
			printTargetName(row, targetSelected);
		}
		dontUpdateTargetName++;
		windowTick();
		NoButtonPressed:
		windowTickMinimal();
		if ((((padPress[0] & Pad.up) == 0) || (row != Row.front) || (numBattlersInBackRow == 0)) && (((padPress[0] & Pad.down) == 0) || (row != Row.back) || (numBattlersInFrontRow == 0))) {
			cursorSFX = Sfx.cursor2;
			if ((padPress[0] & Pad.left) != 0) {
				tmpRow = row;
				newTarget = getNextTargetLeft(tmpRow, targetPosition, action);
				if (newTarget == -1) {
					tmpRow = row ^ 1;
					newTarget = getNextTargetLeft(tmpRow, targetPosition, action);
					if (newTarget == -1) {
						continue;
					}
				}
			} else if ((padPress[0] & Pad.right) != 0) {
				tmpRow = row;
				newTarget = getNextTargetRight(tmpRow, targetPosition, action);
				if (newTarget == -1) {
					tmpRow = row ^ 1;
					newTarget = getNextTargetRight(tmpRow, targetPosition, action);
					if (newTarget == -1) {
						continue;
					}
				}
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				singleEnemyFlashingOff();
				result = cast(short)(row * numBattlersInFrontRow + targetSelected + 1);
				playSfx(Sfx.cursor1);
				break;
			} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (cancellable == 1)) {
				singleEnemyFlashingOff();
				result = 0;
				playSfx(Sfx.cursor2);
				break;
			} else {
				goto NoButtonPressed;
			}
		} else {
			cursorSFX = Sfx.cursor3;
			tmpRow = row ^ 1;
			newTarget = getNextTargetRight(tmpRow, cast(short)(targetPosition - 1), action);
			if (newTarget == -1) {
				newTarget = getNextTargetLeft(tmpRow, targetPosition, action);
				if (newTarget == -1) {
					continue;
				}
			}
		}
		dontUpdateTargetName = 0;
		clearInstantPrinting();
		createWindow(Window.unknown31);
		windowTick();
		setInstantPrinting();
		targetSelected = newTarget;
		row = tmpRow;
		playSfx(cursorSFX);
	}
	closeFocusWindow();
	return result;
}

/// $C12362
short pickTargetRow(short cancellable) {
	short row = (numBattlersInFrontRow != 0) ? Row.front : Row.back;
	short result;
	short cursorSFX;
	outer: while (true) {
		rowEnemyFlashingOn(row);
		clearInstantPrinting();
		printTargetName(row, -1);
		windowTick();
		while (true) {
			windowTickMinimal();
			if ((padPress[0] & Pad.up) != 0) {
				result = 1;
				cursorSFX = Sfx.cursor3;
			} else if ((padPress[0] & Pad.down) != 0) {
				result = 0;
				cursorSFX = Sfx.cursor3;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				rowEnemyFlashingOff();
				result = cast(short)(row + 1);
				playSfx(Sfx.cursor1);
				break outer;
			} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (cancellable == 1)) {
				rowEnemyFlashingOff();
				result = 0;
				playSfx(Sfx.cursor2);
				break outer;
			} else {
				continue;
			}
			if (((result != 0) || (numBattlersInFrontRow == 0)) && ((result != 0) || (numBattlersInBackRow != 0))) {
				playSfx(cursorSFX);
				row = result;
			}
		}
	}
	closeFocusWindow();
	return result;
}

/// $C1242E
short pickTarget(short rowTargetting, short cancellable, short action) {
	if (rowTargetting != 0) {
		return pickTargetRow(cancellable);
	} else {
		return pickTargetSingle(cancellable, action);
	}
}

/// $C1244C
short unknownC1244C(string* scripts, short mode, short cancellable) {
	short chosenCharacter;
	WinStat* window = getActiveWindowAddress();
	// backup sub register to restore later
	uint tempSubRegister = window.subRegister;
	if (mode == 1) {
		backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
		short windowID = gameState.playerControlledPartyMemberCount == 1 ? Window.singleCharacterSelect : cast(short)(gameState.playerControlledPartyMemberCount + Window.characterSelectBase - 1);
		createWindow(windowID);
		for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
			memcpy(&temporaryTextBuffer[0], getPartyCharacterName(gameState.partyMembers[i]), 6);
			temporaryTextBuffer[PartyCharacter.name.length] = 0;
			createNewMenuOptionAtPositionWithUserdata(gameState.partyMembers[i], cast(short)(i * 6), 0, &temporaryTextBuffer[0], scripts[i]);
		}
		printMenuItems();
		chosenCharacter = selectionMenu(cancellable);
		closeWindow(windowID);
		restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
	} else {
		for (short i = 0; i != 4; i++) {
			partyMemberSelectionScripts[i] = scripts[i];
		}
		short currentCharacter = (battleMenuCurrentCharacterID == -1) ? 0 : battleMenuCurrentCharacterID;
		string selectedScript = partyMemberSelectionScripts[gameState.partyMembers[currentCharacter] - 1];
		if (selectedScript != null) {
			displayText(getTextBlock(selectedScript));
		}
		paginationAnimationFrame = 0;
		short frameWait = 10;
		while (true) {
			if (mode == 0) {
				swapRaisedHPPPWindow(currentCharacter);
			}
			clearInstantPrinting();
			windowTick();
			WinStat* paginationWindowStat;
			if ((paginationWindow != Window.invalid) && (windowTable[paginationWindow] != -1)) {
				paginationWindowStat = &windowStats[windowTable[paginationWindow]];
			}
			short sfx;
			l2: while (true) {
				if ((paginationWindow != Window.invalid) && (windowTable[paginationWindow] != -1)) {
					copyToVRAM(VRAMCopyMode.unknown00, 8, cast(ushort)((paginationWindowStat.y * 32) + paginationWindowStat.x + paginationWindowStat.width - 3 + 0x7C00), cast(ubyte*)&paginationArrowTiles[paginationAnimationFrame][0]);
				}
				for (short i = 0; i < frameWait; i++) {
					windowTickMinimal();
					if ((padPress[0] & Pad.left) != 0) {
						chosenCharacter = cast(short)(currentCharacter - 1);
						sfx = (mode != 0) ? Sfx.cursor2 : Sfx.menuOpenClose;
						paginationAnimationFrame = 2;
						break l2;
					} else if ((padPress[0] & Pad.right) != 0) {
						chosenCharacter = cast(short)(currentCharacter + 1);
						sfx = (mode != 0) ? Sfx.cursor2 : Sfx.menuOpenClose;
						paginationAnimationFrame = 3;
						break l2;
					} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
						chosenCharacter = gameState.partyMembers[currentCharacter];
						playSfx(Sfx.cursor1);
						goto Unknown42;
					} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (cancellable == 1)) {
						chosenCharacter = 0;
						playSfx((mode != 0) ? Sfx.cursor2 : Sfx.menuOpenClose);
						resetActivePartyMemberHPPPWindow();
						goto Unknown42;
					}
				}
				paginationAnimationFrame = (paginationAnimationFrame == 0) ? 1 : 0;
				frameWait = 10;
			}
			if (gameState.playerControlledPartyMemberCount <= chosenCharacter) {
				chosenCharacter = 0;
			}
			if (0 > chosenCharacter) {
				chosenCharacter = gameState.playerControlledPartyMemberCount - 1;
			}
			if (chosenCharacter != currentCharacter) {
				playSfx(sfx);
				currentCharacter = chosenCharacter;
				if (partyMemberSelectionScripts[gameState.partyMembers[chosenCharacter] - 1] != null) {
					displayText(getTextBlock(partyMemberSelectionScripts[gameState.partyMembers[chosenCharacter] - 1]));
				}
			}
			frameWait = 4;
		}
	}
	Unknown42:
	paginationAnimationFrame = -1;
	window.subRegister = tempSubRegister;
	return chosenCharacter;
}

/// $C127EF
short charSelectPrompt(short arg1, short arg2, void function(short) arg3, short function(short) checkCharacterValid) {
	short x1E;
	WinStat* x26 = getActiveWindowAddress();
	uint x22 = x26.subRegister;
	if (arg1 == 1) {
		backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
		short x20 = (gameState.playerControlledPartyMemberCount == 1) ? Window.singleCharacterSelect : cast(short)(Window.characterSelectBase + gameState.playerControlledPartyMemberCount - 1);
		createWindow(x20);
		for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
			memcpy(&temporaryTextBuffer[0], getPartyCharacterName(gameState.partyMembers[i]), 6);
			temporaryTextBuffer[PartyCharacter.name.length] = 0;
			createNewMenuOptionAtPositionWithUserdata(gameState.partyMembers[i], cast(short)(i * 6), 0, &temporaryTextBuffer[0], null);
		}
		printMenuItems();
		x1E = selectionMenu(arg2);
		closeWindow(x20);
		restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
	} else {
		short currentCharacter = (battleMenuCurrentCharacterID == -1) ? 0 : battleMenuCurrentCharacterID;
		if (arg3 != null) {
			arg3(gameState.partyMembers[currentCharacter]);
		}
		paginationAnimationFrame = 0;
		short x20 = 10;
		while (true) {
			if (arg1 == 0) {
				swapRaisedHPPPWindow(currentCharacter);
			}
			clearInstantPrinting();
			windowTick();
			short x1A = currentCharacter;
			WinStat* x18;
			if ((paginationWindow != Window.invalid) && (windowTable[paginationWindow] != -1)) {
				x18 = &windowStats[windowTable[paginationWindow]];
			}
			short x16;
			l2: while (true) {
				if ((paginationWindow != Window.invalid) && (windowTable[paginationWindow] != -1)) {
					copyToVRAM(VRAMCopyMode.unknown00, 8, cast(ushort)((x18.y * 32) + x18.x + x18.width - 3 + 0x7C00), cast(ubyte*)&paginationArrowTiles[paginationAnimationFrame][0]);
				}
				for (x1E = 0; x1E < x20; x1E++) {
					windowTickMinimal();
					if ((padPress[0] & Pad.left) != 0) {
						x1A--;
						x16 = (arg1 != 0) ? Sfx.cursor2 : Sfx.menuOpenClose;
						paginationAnimationFrame = 2;
						break l2;
					} else if ((padPress[0] & Pad.right) != 0) {
						x1A++;
						x16 = (arg1 != 0) ? Sfx.cursor2 : Sfx.menuOpenClose;
						paginationAnimationFrame = 3;
						break l2;
					} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
						x1E = gameState.partyMembers[x1A];
						playSfx(Sfx.cursor1);
						goto Unknown44;
					} else if (((padPress[0] & (Pad.b | Pad.select)) != 0) && (arg2 == 1)) {
						x1E = 0;
						playSfx((arg1 != 0) ? Sfx.cursor2 : Sfx.menuOpenClose);
						resetActivePartyMemberHPPPWindow();
						goto Unknown44;
					}
				}
				paginationAnimationFrame = (paginationAnimationFrame == 0) ? 1 : 0;
				x20 = 10;
			}
			x20 = cast(short)(x1A - currentCharacter);
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
			if (x1A != currentCharacter) {
				playSfx(x16);
				currentCharacter = x1A;
				if (arg3 != null) {
					arg3(gameState.partyMembers[currentCharacter]);
				}
			}
			x20 = 4;
		}
	}
	Unknown44:
	paginationAnimationFrame = -1;
	x26.subRegister = x22;
	return x1E;
}

/// $C12BD5
short unknownC12BD5(short arg1) {
	return getMenuOptionCount(windowStats[windowTable[arg1 == 0 ? currentFocusWindow : arg1]].currentOption);
}

/// $C12BF3
void printSMAAAASH() {
	windowSetTextColor(TextPalette.specialGraphics);
	const(ushort)* x06 = &smaaaashTiles[0];
	while (x06[0] != 0) {
		drawTallTextTileFocusedRedraw(*(x06++));
		for (short i = 1; i-- != 0;) {
			windowTick();
		}
	}
	windowSetTextColor(TextPalette.normal);
}

/// $C12C36
void printYouWon() {
	windowSetTextColor(TextPalette.specialGraphics);
	const(ushort)* x06 = &youWonTiles[0];
	for (short i = 0; i < 4; i++) {
		drawTallTextTileFocusedRedraw(*(x06++));
		for (short j = 1; j-- != 0;) {
			windowTick();
		}
	}
	for (short i = 8; i-- != 0;) {
		windowTickMinimal();
	}
	for (short i = 0; i < 5; i++) {
		drawTallTextTileFocusedRedraw(*(x06++));
		for (short j = 1; j-- != 0;) {
			windowTick();
		}
	}
	windowSetTextColor(TextPalette.normal);
}

/// $C12D17
void unknownC12D17(short arg1) {
	if ((hpPPMeterFlipoutMode == 0) && (arg1 != 0)) {
		for (short i = 0; 4 > i; i++) {
			hpPPMeterFlipoutModeHPBackups[i] = partyCharacters[i].hp.target;
			partyCharacters[i].hp.target = 999;
			partyCharacters[i].hp.current.integer = 999;
			hpPPMeterFlipoutModePPBackups[i] = partyCharacters[i].pp.target;
			partyCharacters[i].pp.target = 0;
			partyCharacters[i].pp.current.integer = 0;
		}
	} else {
		if ((hpPPMeterFlipoutMode != 0) && (arg1 == 0)) {
			for (short i = 0; 4 > i; i++) {
				partyCharacters[i].hp.target = hpPPMeterFlipoutModeHPBackups[i];
				partyCharacters[i].pp.target = hpPPMeterFlipoutModePPBackups[i];
			}
		}
	}
	hpPPMeterFlipoutMode = arg1;
	resumeHPPPRolling();
}

/// $C12DD5 - Tick windows (draw windows if necessary, roll HP/PP, advance RNG, wait a frame)
void windowTick() {
	rand();
	if (earlyTickExit != 0) {
		earlyTickExit = 0;
		return;
	}
	if (instantPrinting != 0) {
		return;
	}
	if (redrawAllWindows == 0) {
		if (windowHead != -1) {
			drawWindow(windowTail);
		}
	} else {
		drawOpenWindows();
		redrawAllWindows = 0;
	}
	hpPPRoller();
	uploadHPPPMeterTiles = 1;
	updateHPPPMeterTiles();
	if (disabledTransitions == 0) {
		if (checkTextPaletteReloadRequired() != 0) {
			loadTextPalette();
		}
	}
	hpPPMeterAreaNeedsUpdate = 0;
	unknownC2038B();
	finishFrame();
}

/// $C12E42 - Looks like a "minimal" window tick function, doesn't advance RNG
void windowTickMinimal() {
	hpPPRoller();
	if (hpPPMeterAreaNeedsUpdate != 0) {
		uploadHPPPMeterArea();
		hpPPMeterAreaNeedsUpdate = 0;
		uploadHPPPMeterTiles = 1;
	}
	updateHPPPMeterTiles();
	finishFrame();
}

/// $C12E63
void debugYButtonMenu() {
	freezeEntities();
	playSfx(Sfx.cursor1);
	showHPPPWindows();
	const(ubyte)* x1A = null;
	loop: while (x1A is null) {
		createWindow(Window.phoneMenu);
		for (short i = 0; debugMenuText[i][0] != 0; i++) {
			createNewMenuOptionActive(&debugMenuText[i][0], null);
		}
		printMenuOptionTable(1, 0, 0);
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
				x1A = getTextBlock("MSG_DEBUG_00");
				break;
			case 5:
				x1A = getTextBlock("MSG_DEBUG_01");
				break;
			case 6:
				x1A = getTextBlock("MSG_DEBUG_02");
				break;
			case 7:
				x1A = getTextBlock("TEXT_DEBUG_UNKNOWN_MENU_2");
				break;
			case 8:
				for (short i = 0; i < 30; i++) {
					undrawHPPPWindow(0);
					windowTickMinimal();
					windowTickMinimal();
					unknownC207B6(0);
					windowTickMinimal();
					windowTickMinimal();
				}
				fadeOut(1, 1);
				loadMapAtPosition(7696, 2280);
				setLeaderPosition(7696, 2280, 0);
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
				teleport(WarpPreset.debugWarp);
				break;
			case 18:
				useSoundStone(1);
				break;
			case 19:
				playCredits();
				teleport(WarpPreset.debugWarp);
				break;
			case 20:
				unknownC12D17(hpPPMeterFlipoutMode == 0 ? 1 : 0);
				break;
			case 21:
				startReplay();
				goto Unknown56;
			case 22:
				x1A = getTextBlock("MSG_BTL_INORU_BACK_TO_PC_9");
				break;
			case 23:
				x1A = getTextBlock("MSG_EVT_TO_BE_CONTINUED");
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
	createWindow(Window.textStandard);
	displayText(x1A);
	Unknown56:
	closeAllWindows();
	hideHPPPWindows();
	do {
		windowTick();
	} while (entityFadeEntity != -1);
	unfreezeEntities();
}

/// $C13187
const(ubyte)* talkTo() {
	const(ubyte)* x0A = null;
	createWindow(Window.textStandard);
	findNearbyTalkableNPC();
	if (interactingNPCID == 0) {
		return null;
	}
	if (interactingNPCID == -1) {
		return null;
	}
	if (interactingNPCID == -2) {
		x0A = getTextBlock(mapObjectText);
	} else {
		switch (npcConfig[interactingNPCID].type) {
			case NPCType.person:
				faceOppositeLeader(interactingNPCEntity);
				x0A = getTextBlock(npcConfig[interactingNPCID].talkText);
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
	createWindow(Window.textStandard);
	findNearbyCheckableNPC();
	if (interactingNPCID == 0) {
		return null;
	}
	if (interactingNPCID == -1) {
		return null;
	}
	if (interactingNPCID == -2) {
		return getTextBlock(mapObjectText);
	}
	switch (npcConfig[interactingNPCID].type) {
		case NPCType.person:
			return null;
		case NPCType.itemBox:
			if (npcConfig[interactingNPCID].item < 0x100) {
				setMainRegister(MainRegister(npcConfig[interactingNPCID].item));
			} else {
				setMainRegister(MainRegister(0));
				setSubRegister(npcConfig[interactingNPCID].item - 0x100);
			}
			currentInteractingEventFlag = npcConfig[interactingNPCID].eventFlag;
			return getTextBlock(npcConfig[interactingNPCID].talkText);
		case NPCType.object:
			return getTextBlock(npcConfig[interactingNPCID].talkText);
		default: break;
	}
	return null;
}

/// $C1339E
void unknownC1339E(short arg1) {
	return addCharacterInventoryToWindow(arg1, Window.inventory);
}

/// $C133A7
void unknownC133A7(short arg1) {
	return addCharacterInventoryToWindow(arg1, Window.unknown2c);
}

/// $C133B0
void populateCommandMenu() {
	if (skipAddingCommandText == 0) {
		for (short i = 1; i < 7; i++) {
			if ((i == CommandMenuOption.psi) && (getFirstPartyMemberWithPSI() == 0)) {
				continue;
			}
			short sfx = // use menu open sound unless talking to, checking, or opening inventory with no items, which use the cursor sound instead
				((i == CommandMenuOption.talkTo) ||
				(i == CommandMenuOption.check) ||
				((i == CommandMenuOption.goods) && (gameState.playerControlledPartyMemberCount == 1) && (getCharacterItem(gameState.partyMembers[0], 1) == 0))) ? Sfx.cursor1 : Sfx.menuOpenClose;
			createNewMenuOptionAtPositionWithUserdataSFX(i, commandMenuOptionPositioning[i - 1].x, commandMenuOptionPositioning[i - 1].y, &commandMenuText[i - 1][0], null, cast(ubyte)sfx);
		}
	}
	skipAddingCommandText = 0;
	printMenuItems();
}

/// $C134A7
void openMenuButton() {
	freezeEntities();
	playSfx(Sfx.cursor1);
	createWindow(Window.unknown00);
	skipAddingCommandText = 0;
	populateCommandMenu();
	restoreMenuBackup = 0;
	mainLoop: while (true) {
		setWindowFocus(0);
		uint x06 = selectionMenu(1);
		switch (cast(short)x06) {
			case CommandMenuOption.talkTo:
				const(ubyte)* textPtr = talkTo();
				if (textPtr == null) {
					textPtr = getTextBlock("MSG_SYS_HANASU_NG");
				}
				displayText(textPtr);
				break mainLoop;
			case CommandMenuOption.goods:
				openHpAndWallet();
				L2: while (true) {
					uint character;
					// if there's only one character, pop up the window immediately. otherwise prompt the player to select a character
					if (gameState.playerControlledPartyMemberCount == 1) {
						// character has no items?
						if (getCharacterItem(gameState.partyMembers[0], 1) == 0) {
							// go back to main menu
							continue mainLoop;
						}
						addCharacterInventoryToWindow(gameState.partyMembers[0], Window.inventory);
						character = gameState.partyMembers[0];
						swapRaisedHPPPWindow(0);
					} else {
						openEquipSelectWindow(0);
						character = charSelectPrompt(0, 1, &unknownC1339E, null);
					}
					// no character chosen, go back to main menu
					if (character == 0) {
						closeWindow(Window.inventory);
						closeEquipSelectWindow();
						continue mainLoop;
					}
					// selected character has no items?
					if (getCharacterItem(cast(short)character, 1) == 0) {
						// pick another character
						continue;
					}
					while (true) {
						openEquipSelectWindow(1);
						setWindowFocus(Window.inventory);
						short x1D = selectionMenu(1);
						backupMenuSelection();
						closeEquipSelectWindow();
						if (x1D == 0) {
							if (gameState.playerControlledPartyMemberCount != 1) {
								continue L2;
							}
							if (getCharacterItem(gameState.partyMembers[0], 1) != 0) {
								playSfx(Sfx.menuOpenClose);
								resetActivePartyMemberHPPPWindow();
							}
							closeWindow(Window.inventory);
							continue mainLoop;
						}
						createWindow(Window.inventoryMenu);
						short x23 = ((partyCharacters[character].afflictions[0] != 0) && (Status0.nauseous > partyCharacters[character].afflictions[0])) ? 1 : 0;
						moveCurrentTextCursor(0, x23);
						while (x23 < 4) {
							short x1B = cast(short)(x23 + 1);
							createNewMenuOptionWithUserdata(x1B, &itemUseMenuStrings[x23][0], null);
							x23 = x1B;
						}
						createMenuOptionTable(1, 0, 0);
						short restoreFocusToInventory = 0;
						short x1A;
						L4: while (true) {
							if (restoreFocusToInventory != 0) {
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
									restoreFocusToInventory = 1;
									if (overworldUseItem(cast(short)character, x1D, 0) != 0) {
										break mainLoop;
									}
									x1A = 0;
									continue;
								case 4: //help
									unknownC10F40(0);
									unknownC10F40(2);
									restoreMenuBackup = 0xFF;
									createWindow(Window.textStandard);
									displayText(getTextBlock(itemData[getCharacterItem(cast(short)character, x1D)].helpText));
									closeWindow(Window.textStandard);
									setWindowFocus(0);
									skipAddingCommandText = 1;
									populateCommandMenu();
									addCharacterInventoryToWindow(cast(short)character, Window.inventory);
									closeWindow(Window.inventoryMenu);
									setWindowFocus(Window.inventory);
									break L4;
								case 2: //give
									setWindowFocus(Window.inventory);
									clearFocusWindow();
									restoreFocusToInventory = 1;
									openEquipSelectWindow(3);
									short x18 = charSelectPrompt(2, 1, &unknownC133A7, null);
									closeEquipSelectWindow();
									closeWindow(Window.unknown2c);
									if (x18 == 0) {
										x1A = 1;
										continue;
									}
									if ((character != x18) && ((itemData[getCharacterItem(cast(short)character, x1D)].flags & ItemFlags.cannotGive) != 0)) {
										createWindow(Window.textStandard);
										setMainRegister(MainRegister(character));
										setSubRegister(x1D);
										displayText(getTextBlock("MSG_SYS_GOODS_NOCARRY"));
										closeWindow(Window.textStandard);
										x1A = 0;
										continue;
									}
									short x16 = 0;
									if ((partyCharacters[character - 1].afflictions[0] == Status0.unconscious) || (partyCharacters[character - 1].afflictions[0] == Status0.diamondized)) {
										x16 = 5;
									}
									if (x18 != character) {
										x16++;
										if (testPartyHasInventorySpace(x18) != 0) {
											x16 += 2;
										}
										if ((partyCharacters[x18 - 1].afflictions[0] == Status0.unconscious) || (partyCharacters[x18 - 1].afflictions[0] == Status0.diamondized)) {
											x16++;
										}
									}
									createWindow(Window.textStandard);
									getActiveWindowAddress().mainRegister.integer = character;
									getActiveWindowAddress().mainRegisterBackup.integer = x18;
									getActiveWindowAddress().subRegister = x1D;
									switch (x16) {
										case 0: //give to self, alive
											displayText(getTextBlock("MSG_SYS_CARRY_SELF_ALIVE"));
											unknownC22A3A(x18, cast(short)character, x1D);
											break;
										case 1: //give to other, alive, inventory full
											displayText(getTextBlock("MSG_SYS_CARRY_FAIL_OTHER_ALIVE_ALIVE"));
											break;
										case 2: //give to other, dead, inventory full
											displayText(getTextBlock("MSG_SYS_CARRY_FAIL_OTHER_ALIVE_DEAD"));
											break;
										case 3: //give to other, alive
											displayText(getTextBlock("MSG_SYS_CARRY_OTHER_ALIVE_ALIVE"));
											unknownC22A3A(x18, cast(short)character, x1D);
											break;
										case 4: //give to other, dead
											displayText(getTextBlock("MSG_SYS_CARRY_OTHER_ALIVE_DEAD"));
											unknownC22A3A(x18, cast(short)character, x1D);
											break;
										case 5: //give to self, dead
											displayText(getTextBlock("MSG_SYS_CARRY_SELF_DEAD"));
											unknownC22A3A(x18, cast(short)character, x1D);
											break;
										case 6: //give to other, self dead, other alive, inventory full
											displayText(getTextBlock("MSG_SYS_CARRY_FAIL_OTHER_DEAD_ALIVE"));
											break;
										case 7: //give to other, self dead, other dead, inventory full
											displayText(getTextBlock("MSG_SYS_CARRY_FAIL_OTHER_DEAD_DEAD"));
											break;
										case 8: //give to other, self dead, other alive
											displayText(getTextBlock("MSG_SYS_CARRY_OTHER_DEAD_ALIVE"));
											unknownC22A3A(x18, cast(short)character, x1D);
											break;
										case 9: //give to other, self dead, other dead
											displayText(getTextBlock("MSG_SYS_CARRY_OTHER_DEAD_DEAD"));
											unknownC22A3A(x18, cast(short)character, x1D);
											break;
										default: //invalid
											assert(0);
									}
									closeWindow(Window.textStandard);
									closeWindow(Window.inventoryMenu);
									closeWindow(Window.inventory);
									continue mainLoop;
								case 3: //drop
									createWindow(Window.textStandard);
									setMainRegister(MainRegister(character));
									setSubRegister(x1D);
									displayText(getTextBlock("MSG_SYS_GOODS_DROP"));
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
			case CommandMenuOption.psi:
				openHpAndWallet();
				uint x06_2 = getFirstPartyMemberWithPSI();
				if (x06_2 != 0) {
					swapRaisedHPPPWindow(cast(short)(cast(short)(x06_2) - 1));
				}
				if (overworldPSIMenu() != 0) {
					break mainLoop;
				}
				if (getPartyMemberCountWithPSI() == 1) {
					playSfx(Sfx.menuOpenClose);
					resetActivePartyMemberHPPPWindow();
				}
				break;
			case CommandMenuOption.equip:
				openHpAndWallet();
				unknownC1AA5D();
				if (gameState.playerControlledPartyMemberCount == 1) {
					playSfx(Sfx.menuOpenClose);
					resetActivePartyMemberHPPPWindow();
				}
				break;
			case CommandMenuOption.check:
				const(ubyte)* textPtr = check();
				if (textPtr == null) {
					textPtr = getTextBlock("MSG_SYS_NOPROBLEM");
				}
				displayText(textPtr);
				break mainLoop;
			case CommandMenuOption.status:
				openHpAndWallet();
				forceLeftTextAlignment = 1;
				unknownC1BB71();
				forceLeftTextAlignment = 0;
				break;
			default: break mainLoop;
		}
	}
	clearInstantPrinting();
	hideHPPPWindows();
	closeAllWindows();
	do {
		windowTick();
	} while (entityFadeEntity != -1);
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
			textPtr = getTextBlock("MSG_SYS_NOPROBLEM");
		}
	}
	displayText(textPtr);
	clearInstantPrinting();
	hideHPPPWindows();
	closeAllWindows();
	do {
		windowTick();
	} while (entityFadeEntity != -1);
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
	if (testPartyHasItem(PartyMember.any, ItemID.townMap) == 0) {
		return;
	}
	freezeEntities();
	displayTownMap();
	unfreezeEntities();
}

/// $C13D03
void debugYButtonFlag() {
	short flag = EventFlag.temp0;
	while (true) {
		setInstantPrinting();
		createWindow(Window.fileSelectMenu);
		setCurrentWindowPadding(3);
		printNumber(flag);
		printLetter(TallTextTile.windowBackground);
		nextVWFTile();
		printString(0x100, (getEventFlag(flag) != 0) ? &debugOnText[0] : &debugOffText[0]);
		clearInstantPrinting();
		windowTick();
		short flagNew = flag;
		while(true) {
			waitUntilNextFrame();
			if ((padHeld[0] & Pad.up) != 0) {
				flagNew++;
			} else if ((padHeld[0] & Pad.down) != 0) {
				flagNew--;
			} else if ((padHeld[0] & Pad.right) != 0) {
				flagNew += 10;
			} else if ((padHeld[0] & Pad.left) != 0) {
				flagNew -= 10;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				setEventFlag(flag, (getEventFlag(flag) != 0) ? 0 : 1);
			} else if ((padPress[0] & (Pad.b | Pad.select)) != 0) {
				closeWindow(Window.fileSelectMenu);
				return;
			}
			// make sure flag is between 1-1999 (didn't bother to figure out the actual upper limit?)
			if ((flagNew < 2000) && (flagNew != 0)) {
				flag = flagNew;
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
	createWindow(Window.fileSelectMenu);
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
	createWindow(Window.fileSelectMenu);
	short level = cast(short)numSelectPrompt(2);
	short character = charSelectPrompt(1, 1, null, null);
	if (character != 0) {
		resetCharLevelOne(character, level, 1);
		recoverHPAmtPercent(character, 100, 0);
		recoverPPAmtPercent(character, 100, 0);
	}
	closeWindow(Window.fileSelectMenu);
}

/// $C13EE7
void debugYButtonGoods() {
	short item = 0;
	outer: while (true) {
		setInstantPrinting();
		createWindow(Window.fileSelectMenu);
		setCurrentWindowPadding(0x02);
		setCurrentWindowPadding(0x82);
		moveCurrentTextCursor(0, 0);
		printNumber(item);
		moveCurrentTextCursor(3, 0);
		printItemName(item);
		clearInstantPrinting();
		windowTick();
		short itemInput = item;
		while (true) {
			waitUntilNextFrame();
			if ((padHeld[0] & Pad.up) != 0) {
				itemInput++;
			} else if ((padHeld[0] & Pad.down) != 0) {
				itemInput--;
			} else if ((padHeld[0] & Pad.right) != 0) {
				itemInput += 10;
			} else if ((padHeld[0] & Pad.left) != 0) {
				itemInput -= 10;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				short character = charSelectPrompt(1, 1, null, null);
				if ((character != 0) && (testPartyHasInventorySpace(character) != 0)) {
					giveItemToCharacter(character, cast(ubyte)item);
					if (canCharacterEquip(character, item) == 0) {
						break outer;
					}
					if (getItemType(item) != 2) {
						break outer;
					}
					equipItem(character, getInventoryCount(character));
				}
			} else if ((padPress[0] & (Pad.b | Pad.select)) != 0) {
				break outer;
			}
		}
		// make sure item stays in range
		if (itemInput < 0x100) {
			break;
		} else {
			item = itemInput;
		}
	}
	closeWindow(Window.fileSelectMenu);
}

/** Pushes a new text state onto the stack and returns it
 * Original_Address: $(DOLLAR)C14012
 */
DisplayTextState* pushPeekTextStack() {
	nextTextStackFrame++;
	if (nextTextStackFrame > 10) {
		nextTextStackFrame = 0;
	}
	return &displayTextStates[nextTextStackFrame];
}

/** Deallocates a text state from the stack
 * Original_Address: $(DOLLAR)C14049
 */
void popTextStack() {
	nextTextStackFrame--;
	if (nextTextStackFrame > 10) {
		nextTextStackFrame = 9;
	}
}

/** Similar to strcmp(), but the result is negated
 * Params:
 * 	ptr1 = First null-terminated string to compare
 * 	ptr2 = Second null-terminated string to compare
 * Original_Address: $(DOLLAR)C14070
 */
short ebStrcmp(ubyte* ptr1, ubyte* ptr2) {
	while (ptr1[0] != 0) {
		if (ptr1[0] != ptr2[0]) {
			break;
		}
		ptr1++;
		ptr2++;
	}
	return ptr2[0] - ptr1[0];
}

/// $C140B0
void* cc1C01(DisplayTextState* arg1, ubyte arg2) {
	unknownC19249(arg2 == 0 ? cast(short)getSubRegister() : arg2);
	return null;
}

/// $C140CF
void* cc1C11(DisplayTextState* arg1, ubyte arg2) {
	printNewLineIfNeeded(arg2 == 0 ? cast(short)getSubRegister() : arg2);
	return null;
}

/// $C140EF
void* cc1C09(DisplayTextState* arg1, ubyte arg2) {
	setCurrentWindowPadding(arg2);
	return null;
}

/// $C140F9
void* cc1C00(DisplayTextState* arg1, ubyte palette) {
	windowSetTextColor(palette);
	return null;
}

/// $C14103
void* cc0A(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!string);
	arg1.script = getTextBlock(getCCParameters!ArgType(arg2));
	return null;
}

/// $C141D0
void* cc09(DisplayTextState* arg1, ubyte arg2) {
	if ((getMainRegister().integer != 0) && (getMainRegister().integer <= arg2)) {
		arg1.script += string.sizeof * (getMainRegister().integer - 1);
		ccArgumentGatheringLoopCounter = 0;
		return &cc0A;
	} else {
		arg1.script += string.sizeof * arg2;
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
		arg1.script += string.sizeof;
		return null;
	}
}

/// $C1435F - [07 XX XX] get event flag
void* cc07(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!short);
	setMainRegister(MainRegister(getEventFlag(getCCParameters!ArgType(arg2))));
	return null;
}

/// $C143B8
void* cc1C08(DisplayTextState* arg1, ubyte arg2) {
	printSpecialGraphics(arg2);
	return null;
}

/// $C143C2 - [18 01 XX] open window
void* cc1801(DisplayTextState* arg1, ubyte arg2) {
	createWindow(arg2);
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
		setMainRegister(MainRegister(0));
		setSubRegister(0);
	} else {
		setMainRegister(MainRegister(x06));
	}
	return null;
}

/// $C14509 - [18 05 XX YY] force text alignment
void* cc1805(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1805Arguments);
	if (forceLeftTextAlignment != 0) {
		forcePixelAlignment(getCCParameters!ArgType(arg2).alignment, arg2);
	} else {
		moveCurrentTextCursor(getCCParameters!ArgType(arg2).alignment, arg2);
	}
	return null;
}

/// $C14558
void* cc0B(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(getMainRegister().integer == arg2 ? 1 : 0));
	return null;
}

/// $C14591
void* cc0C(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(getMainRegister().integer != arg2 ? 1 : 0));
	return null;
}

/// $C145CA
void* cc1C07(DisplayTextState* arg1, ubyte arg2) {
	printMenuOptionTable(arg2 == 0 ? cast(short)getSubRegister() : arg2, 1, 0);
	return null;
}

/// $C145EF
void* cc0D(DisplayTextState* arg1, ubyte arg2) {
	setSubRegister((arg2 != 0) ? getLoopRegister() : getMainRegister().integer);
	return null;
}

/// $C1461A
void* cc0E(DisplayTextState* arg1, ubyte arg2) {
	setLoopRegister(arg2 == 0 ? getSubRegister() & 0xFF : arg2);
	return null;
}

/// $C1463B
void* cc1A00(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1A00Arguments);
	setMainRegister(MainRegister(unknownC1244C(&getCCParameters!ArgType(arg2).partyScripts[0], getCCParameters!ArgType(arg2).display, 0)));
	return null;
}

/// $C1467D
void* cc1A01(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1A00Arguments);
	setMainRegister(MainRegister(unknownC1244C(&getCCParameters!ArgType(arg2).partyScripts[0], getCCParameters!ArgType(arg2).display, 1)));
	return null;
}

/// $C146BF
void* cc1C05(DisplayTextState* arg1, ubyte arg2) {
	printItemName(arg2 == 0 ? cast(short)getSubRegister() : arg2);
	return null;
}

/// $C146DE
void* cc1C06(DisplayTextState* arg1, ubyte arg2) {
	printStringAutoNewline(PSITeleportDestination.name.length, &psiTeleportDestinationTable[arg2 == 0 ? cast(short)getSubRegister() : arg2].name[0]);
	return null;
}

/// $C14723
void* cc1910(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(unknownC190E6(arg2 == 0 ? cast(short)getSubRegister() : arg2)));
	return null;
}

/// $C14751
void* cc1F00(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F00Arguments);
	unknownC216AD(getCCParameters!ArgType(arg2).unused.useVariableIfZero(getSubRegister()), getCCParameters!ArgType(arg2).track);
	return null;
}

/// $C147A0
void* cc1F01(DisplayTextState* arg1, ubyte arg2) {
	stopMusicF(arg2);
	return null;
}

/// $C147AB
void* cc1F02(DisplayTextState* arg1, ubyte arg2) {
	playSfxAndTickMinimal(arg2 != 0 ? arg2 : cast(short)getSubRegister());
	return null;
}

/// $C147CC
void* cc1911(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(getPartyCharacterName(arg2 != 0 ? arg2 : cast(short)getSubRegister())[cast(short)-cast(int)(1 - getLoopRegister())]));
	return null;
}

/// $C14819
void* cc1928(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister((cc1C01Table[arg2].size < getLoopRegister()) ? 0 : (cast(ubyte*)cc1C01Table[arg2].address)[getLoopRegister() - 1]));
	return null;
}

/// $C1488D
void* cc1C03(DisplayTextState* arg1, ubyte arg2) {
	printLetterVWF(arg2 != 0 ? arg2 : cast(short)getSubRegister());
	return null;
}

/// $C148AC
void* cc1D02(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister((getItemType(cast(short)getSubRegister()) == arg2) ? 1 : 0));
	return null;
}

/// $C148E9
void* cc1D08(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!short);
	setMainRegister(MainRegister(increaseWalletBalance(getCCParameters!ArgType(arg2).useVariableIfZero(getSubRegister()))));
	return null;
}

/// $C1494A
void* cc1D09(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!short);
	setMainRegister(MainRegister(decreaseWalletBalance(getCCParameters!ArgType(arg2).useVariableIfZero(getSubRegister()))));
	return null;
}

/// $C149B6
void* cc1E00(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	recoverHPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).amount,
		0
	);
	return null;
}

/// $C14A03
void* cc1E01(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	reduceHPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).amount,
		0
	);
	return null;
}
/// $C14A50
void* cc1E02(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	recoverHPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).amount,
		1
	);
	return null;
}

/// $C14A9D
void* cc1E03(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	reduceHPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).amount,
		1
	);
	return null;
}

/// $C14AEA
void* cc1E04(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	recoverPPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).amount,
		0
	);
	return null;
}

/// $C14B37
void* cc1E05(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	reducePPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).amount,
		0
	);
	return null;
}

/// $C14B84
void* cc1E06(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	recoverPPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).amount,
		1
	);
	return null;
}

/// $C14BD1
void* cc1E07(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1EArguments);
	reducePPAmtPercent(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).amount,
		1
	);
	return null;
}

/// $C14C1E
void* cc1D00(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setMainRegister(MainRegister(giveItemToCharacter(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	)));
	return null;
}

/// $C14C86
void* cc1D01(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setMainRegister(MainRegister(takeItemFromCharacter(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	)));
	return null;
}

/// $C14CEE
void* cc1D03(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(testPartyHasInventorySpace(arg2 != 0 ? arg2 : cast(short)getSubRegister())));
	return null;
}

/// $C14D24
void* cc1D04(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setMainRegister(MainRegister(unknownC3E9F7(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	)));
	return null;
}

/// $C14D93
void* cc1D05(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setMainRegister(MainRegister(testPartyHasItem(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	)));
	return null;
}

/// $C14DFB
void* cc1F20(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F20Arguments);
	setTeleportState(
		getCCParameters!ArgType(arg2).p1.useVariableIfZero(getMainRegister().integer),
		cast(PSITeleportStyle)getCCParameters!ArgType(arg2).p2.useVariableIfZero(getSubRegister())
	);
	return null;
}

/// $C14E8C
void* cc1F21(DisplayTextState* arg1, ubyte arg2) {
	teleport(arg2 != 0 ? arg2 : cast(short)getSubRegister());
	return null;
}

/// $C14EAB
void* cc10(DisplayTextState* arg1, ubyte arg2) {
	textWait(arg2);
	return null;
}

/// $C14EB5
void* cc1A06(DisplayTextState* arg1, ubyte arg2) {
	clearInstantPrinting();
	createWindow(currentFocusWindow);
	windowTick();
	setMainRegister(MainRegister(itemStoreSelection(arg2 != 0 ? arg2 : cast(short)getSubRegister())));
	setWindowFocus(currentFocusWindow);
	return null;
}

/// $C14EF8
void* cc1D0A(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(itemData[arg2 != 0 ? arg2 : cast(short)getSubRegister()].cost));
	return null;
}

/// $C14F33
void* cc1D0B(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(itemData[arg2 != 0 ? arg2 : cast(short)getSubRegister()].cost / 2));
	return null;
}

/// $C14F6F
void* cc1F81(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setMainRegister(MainRegister(canCharacterEquip(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	)));
	return null;
}

/// $C14FD7
void* cc1C02(DisplayTextState* arg1, ubyte arg2) {
	if (arg2 == 0xFF) {
		unknownC1931B(cast(short)getActiveWindowAddress().mainRegister.integer);
	} else {
		unknownC1931B(arg2 != 0 ? arg2 : cast(short)getSubRegister());
	}
	return null;
}

/// $C15007
void* cc1916(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1916Arguments);
	setMainRegister(MainRegister(checkStatusGroup(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).statusGroup.useVariableIfZero(getSubRegister())
	)));
	return null;
}

/// $C1506F
void* cc1905(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1905Arguments);
	setMainRegister(MainRegister(inflictStatusNonBattle(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).statusGroup.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).status
	)));
	return null;
}

/// $C150E4
void* cc1D0D(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1905Arguments);
	setMainRegister(MainRegister(checkStatusGroup(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).statusGroup.useVariableIfZero(getSubRegister())) == getCCParameters!ArgType(arg2).status ? 1 : 0));
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
	setMainRegister(MainRegister(a));
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
	setMainRegister(MainRegister(a));
	return null;
}

/// $C1528D - [18 07 XX XX XX XX YY]
void* cc1807(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1807Arguments);
	uint x0A = getCCParameters!ArgType(arg2).value;
	uint x06 = (getCCParameters!ArgType(arg2).register == 0) ? getMainRegister().integer : (getCCParameters!ArgType(arg2).register == 1) ? getSubRegister() : getLoopRegister;
	short tmp;
	if (x06 < x0A) {
		tmp = 0;
	} else if (x06 == x0A) {
		tmp = 1;
	} else {
		tmp = 2;
	}
	setMainRegister(MainRegister(tmp));
	return null;
}

/// $C153AF
void* cc1C0A(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	printNumber(getCCParameters!ArgType(arg2).useVariableIfZero(getSubRegister()));
	return null;
}

/// $C15384
void* cc1918(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(getRequiredEXP(arg2.useVariableIfZero(getSubRegister()))));
	return null;
}

/// $C15494
void* cc1F60(DisplayTextState* arg1, ubyte arg2) {
	textWaitCancellable(arg2);
	return null;
}

/// $C1549E
void* cc1A05(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1A05Arguments);
	if (currentFocusWindow == 1) {
		removeWindowFromScreen(Window.textStandard);
		windowStats[windowTable[currentFocusWindow]].textY = 0;
		windowStats[windowTable[currentFocusWindow]].textX = 0;
		backupCurrentWindowTextAttributes(&arg1.savedTextAttributes);
		forceLeftTextAlignment = 0;
	}
	addCharacterInventoryToWindow(getCCParameters!ArgType(arg2).character.useVariableIfZero(getSubRegister()), getCCParameters!ArgType(arg2).window);
	return null;
}

/// $C15529 - [18 08 XX] selection menu, no cancelling
void* cc1808(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(unknownC19A11(arg2, 0)));
	return null;
}

/// $C1554E - [18 09 XX] selection menu
void* cc1809(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(unknownC19A11(arg2, 1)));
	return null;
}

/// $C15573
void* cc1C0B(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	printPrice(getCCParameters!ArgType(arg2).useVariableIfZero(getSubRegister()));
	return null;
}

/// $C15659
void* cc1D0E(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short character = giveItemToCharacter(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	);
	setSubRegister(getInventoryCount(character));
	setMainRegister(MainRegister(character));
	return null;
}

/// $C156DB
void* cc1D0F(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short character = getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer);
	short slot = getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister());
	setSubRegister(getCharacterItem(character, slot));
	setMainRegister(MainRegister(removeItemFromInventory(character, slot)));
	return null;
}

/// $C1575D
void* cc1D10(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setMainRegister(MainRegister(checkItemEquipped(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	)));
	return null;
}

/// $C157CD
void* cc1D11(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short character = getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer);
	setMainRegister(MainRegister(canCharacterEquip(character, getCharacterItem(character, getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())))));
	return null;
}

/// $C1583D
void* cc1F83(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	setSubRegister(equipItem(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	));
	return null;
}

/// $C158A5
void* cc1D12(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	escargoExpressMove(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	);
	return null;
}

/// $C158FE
void* cc1D13(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short character = giveStoredItemToCharacter(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())
	);
	setSubRegister(getInventoryCount(character));
	setMainRegister(MainRegister(character));
	return null;
}

/// $C1597F
void* cc1919(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D00Arguments);
	short character = getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer);
	setSubRegister(getCharacterItem(character, getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister())));
	setMainRegister(MainRegister(character));
	return null;
}

/// $C159F9
void* cc1D14(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	uint x06 = getCCParameters!ArgType(arg2);
	setMainRegister(MainRegister((x06.useVariableIfZero(getSubRegister()) <= gameState.moneyCarried) ? 0 : 1));
	return null;
}

/// $C15B0E
void* cc191A(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(gameState.escargoExpressItems[(arg2 != 0 ? arg2 : getSubRegister()) - 1]));
	return null;
}

/// $C15B46 - [18 0D XX YY] print character status info
void* cc180D(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC180DArguments);
	short tmp = getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer);
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
	printMenuOptionTable(arg2 != 0 ? arg2 : cast(ushort)getSubRegister(), 0, 0);
	return null;
}

/// $C15BCA
void* cc1D15(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	setMainRegister(MainRegister(getCCParameters!ArgType(arg2).useVariableIfZero(getSubRegister()) * getActivePartyCharacterCount()));
	return null;
}

/// $C15C36
void* cc191B(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(unknownC12BD5(arg2)));
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
	depositIntoATM((x06 == 0) ? getSubRegister() : x06);
	return null;
}

/// $C15D6B
void* cc1D07(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	uint x06 = getCCParameters!ArgType(arg2);
	uint amount = (x06 == 0) ? getSubRegister() : x06;
	withdrawFromATM(amount);
	setMainRegister(MainRegister(amount));
	return null;
}

/// $C15E5C
void* cc1D17(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!uint);
	uint x06 = getCCParameters!ArgType(arg2);
	setMainRegister(MainRegister(gameState.bankBalance > x06 ? 0 : 1));
	return null;
}

/// $C15F71
void* cc1F11(DisplayTextState* arg1, ubyte arg2) {
	addCharToParty(arg2 != 0 ? arg2 : cast(short)getSubRegister());
	return null;
}

/// $C15F91
void* cc1F12(DisplayTextState* arg1, ubyte arg2) {
	removeCharFromParty(arg2 != 0 ? arg2 : cast(short)getSubRegister());
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
	short character = getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer);
	short itemSlot = getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister());
	short item;
	if (character == 0xFF) {
		item = escargoExpressRemove(itemSlot);
	} else {
		item = getCharacterItem(character, itemSlot);
		removeItemFromInventory(character, itemSlot);
	}
	queueItemForDelivery(character, item);
	return null;
}

/// $C16080
void* cc191D(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC191DArguments);
	short tmp = getCCParameters!ArgType(arg2).queuedItem.useVariableIfZero(getMainRegister().integer) - 1;
	setMainRegister(MainRegister(gameState.deliveryQueueCharacter[tmp]));
	setSubRegister(gameState.deliveryQueueItem[tmp]);
	if (getCCParameters!ArgType(arg2).remove != 0) {
		gameState.deliveryQueueItem[tmp] = 0;
		gameState.deliveryQueueCharacter[tmp] = 0;
	}
	return null;
}

/// $C16124
void* cc1D18(DisplayTextState* arg1, ubyte arg2) {
	escargoExpressStore(arg2 != 0 ? arg2 : cast(short)getSubRegister());
	return null;
}

/// $C16143
void* cc1921(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(getItemSubtype2(arg2.useVariableIfZero(getSubRegister()))));
	return null;
}

/// $C16172
void* cc1D19(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister((gameState.playerControlledPartyMemberCount < (arg2.useVariableIfZero(getSubRegister()))) ? 1 : 0));
	return null;
}

/// $C161D1
void* cc1C12(DisplayTextState* arg1, ubyte arg2) {
	printPSIName(arg2 != 0 ? arg2 : cast(short)getSubRegister());
	return null;
}

/// $C161F0
void* cc1D21(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(randMod(arg2 != 0 ? arg2 : cast(short)getSubRegister())));
	return null;
}

/// $C1621F
void* unknownC1621F(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!string);
	displayText(getTextBlock(getCCParameters!ArgType(arg2)));
	arg1.script += onGoSubOffset * string.sizeof;
	return null;
}

/// $C16308
void* cc1FC0(DisplayTextState* arg1, ubyte arg2) {
	if ((getMainRegister().integer != 0) && (getMainRegister().integer < arg2)) {
		onGoSubOffset = cast(short)(arg2 - cast(short)getMainRegister().integer);
		arg1.script += (cast(short)getMainRegister().integer - 1) * string.sizeof;
		ccArgumentGatheringLoopCounter = 0;
		return &unknownC1621F;
	} else {
		arg1.script += arg2 * string.sizeof;
		return null;
	}
}

/// $C163A7
void* cc1FD0(DisplayTextState* arg1, ubyte arg2) {
	short item = unknownC3F1EC(arg2.useVariableIfZero(getSubRegister()));
	setMainRegister(MainRegister(item != 0 ? getFixedVersionOfItem(item) : 0));
	setSubRegister(item);
	return null;
}

/// $C163FD
void* cc1F13(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F13Arguments);
	setPartyMemberDirection(
		getCCParameters!ArgType(arg2).arg1.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).arg2.useVariableIfZero(getSubRegister()) - 1
	);
	return null;
}

/// $C1646E
void* cc1F14(DisplayTextState* arg1, ubyte arg2) {
	setPartyDirection(cast(short)((arg2 != 0 ? arg2 : getSubRegister()) - 1));
	return null;
}

/// $C16490
void* cc1F16(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F16Arguments);
	setNPCDirection(
		getCCParameters!ArgType(arg2).arg1.useVariableIfZero(getMainRegister().integer),
		cast(short)(getCCParameters!ArgType(arg2).arg2.useVariableIfZero(getSubRegister()) - 1)
	);
	return null;
}

/// $C16509
void* cc1F17(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F17Arguments);
	initializeEntityFade(
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
	createManpuByNPCID(
		getCCParameters!ArgType(arg2).tpt,
		getCCParameters!ArgType(arg2).sprite
	);
	return null;
}

/// $C1662A
void* cc1F1B(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	deleteManpuByNPCID(getCCParameters!ArgType(arg2));
	return null;
}

/// $C1666D
void* cc1F1C(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F1CArguments);
	createManpuByPartyMember(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		cast(short)(getCCParameters!ArgType(arg2).sprite.useVariableIfZero(getSubRegister()))
	);
	return null;
}

/// $C166DD
void* cc1F1D(DisplayTextState* arg1, ubyte arg2) {
	deleteManpuByPartyMember(cast(ushort)(arg2 != 0 ? arg2 : getMainRegister().integer));
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
		queueEntityCreationRequest(
			getCCParameters!ArgType(arg2).sprite,
			getCCParameters!ArgType(arg2).actionScript
		);
	} else {
		initializeEntityFade(
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
	initializeEntityFade(findEntityByNPCID(getCCParameters!ArgType(arg2).tpt), getCCParameters!ArgType(arg2).style);
	fadeNPC(getCCParameters!ArgType(arg2).tpt, getCCParameters!ArgType(arg2).style);
	return null;
}

/// $C1683B
void* cc1F1F(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F1EArguments);
	initializeEntityFade(findEntityBySprite(getCCParameters!ArgType(arg2).tpt), getCCParameters!ArgType(arg2).style);
	fadeSprite(getCCParameters!ArgType(arg2).tpt, getCCParameters!ArgType(arg2).style);
	return null;
}

/// $C168A0
void* cc1922(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1922Arguments);
	setSubRegister(
		getDirectionFromPartyMemberTo(
			getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
			getCCParameters!ArgType(arg2).type - 1,
			getCCParameters!ArgType(arg2).target.useVariableIfZero(getSubRegister())
		) + 1
	);
	return null;
}

/// $C16947
void* cc1923(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1923Arguments);
	setSubRegister(
		getDirectionFromNPCTo(
			getCCParameters!ArgType(arg2).npc.useVariableIfZero(getMainRegister().integer),
			getCCParameters!ArgType(arg2).type - 1,
			getCCParameters!ArgType(arg2).target.useVariableIfZero(getSubRegister())
		) + 1
	);
	return null;
}

/// $C169F7
void* cc1F62(DisplayTextState* arg1, ubyte arg2) {
	setTextPromptMode(arg2);
	return null;
}

/// $C16A01
void* cc1E08(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1E08Arguments);
	resetCharLevelOne(
		getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).level.useVariableIfZero(getSubRegister()),
		1
	);
	return null;
}

/// $C16A7B
void* cc1924(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1924Arguments);
	setSubRegister(
		getDirectionFromSpriteTo(
			getCCParameters!ArgType(arg2).entity.useVariableIfZero(getMainRegister().integer),
			getCCParameters!ArgType(arg2).type - 1,
			getCCParameters!ArgType(arg2).target.useVariableIfZero(getSubRegister())
		) + 1
	);
	return null;
}

/// $C16B2B
void* cc1FE4(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FE4Arguments);
	setSpriteDirection(
		getCCParameters!ArgType(arg2).arg1.useVariableIfZero(getMainRegister().integer),
		getCCParameters!ArgType(arg2).arg2.useVariableIfZero(getSubRegister())
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
	disableEntityByNPCID(getCCParameters!ArgType(arg2));
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
	enableEntityByNPCID(getCCParameters!ArgType(arg2));
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
	initializeEntityFade(findEntityByPartyMemberID(getCCParameters!ArgType(arg2).arg1), getCCParameters!ArgType(arg2).arg2);
	hideCharacterOrParty(getCCParameters!ArgType(arg2).arg1);
	return null;
}

/// $C16D14
void* cc1FEC(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FECArguments);
	initializeEntityFade(findEntityByPartyMemberID(getCCParameters!ArgType(arg2).arg1), getCCParameters!ArgType(arg2).arg2);
	unhideCharacterOrParty(getCCParameters!ArgType(arg2).arg1);
	return null;
}

/// $C16D62
void* cc1FEE(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	focusCameraOnNPCID(getCCParameters!ArgType(arg2));
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
	queueInteraction(InteractionType.textSurvivesDoorTransition, QueuedInteractionPtr(getTextBlock(getCCParameters!ArgType(arg2))));
	return null;
}

/// $C16EBF
void* cc1FF1(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FF1Arguments);
	changeScriptForEntityByNPCID(getCCParameters!ArgType(arg2).arg1, getCCParameters!ArgType(arg2).arg2);
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
	setMainRegister(MainRegister(findCondiment(cast(short)(arg2 != 0 ? arg2 : getSubRegister()))));
	return null;
}

/// $C16FD1
void* cc1F23(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	setMainRegister(MainRegister(initBattleScripted(getCCParameters!ArgType(arg2).useVariableIfZero(getSubRegister()))));
	return null;
}

/// $C17037
void* cc1926(DisplayTextState* arg1, ubyte arg2) {
	setTeleportBoxDestination(arg2.useVariableIfZero(getSubRegister()));
	return null;
}

/// $C17058
void* cc1D0C(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1D0CArguments);
	setMainRegister(MainRegister((unknownC190F1() != 0 ? 2 : 0) | ((itemData[partyCharacters[getCCParameters!ArgType(arg2).item.useVariableIfZero(getSubRegister()) - 1].items[getCCParameters!ArgType(arg2).character.useVariableIfZero(getMainRegister().integer)]].flags & ItemFlags.unknown) != 0 ? 1 : 0)));
	return null;
}

/// $C1711C - [1F 66 XX YY ZZ ZZ ZZ ZZ] Enable hotspot
void* cc1F66(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1F66Arguments);
	activateHotspot(
		getCCParameters!ArgType(arg2).arg1.useVariableIfZero(getSubRegister()),
		getCCParameters!ArgType(arg2).arg2.useVariableIfZero(getMainRegister().integer),
		getTextBlock(getCCParameters!ArgType(arg2).arg3)
	);
	return null;
}

/// $C17233 - [1F 67 XX] Disable hotspot
void* cc1F67(DisplayTextState* arg1, ubyte arg2) {
	disableHotspot(cast(short)(arg2 != 0 ? arg2 : getSubRegister()));
	return null;
}

/// $C17254 - [1F 04 XX] Toggle text sound
void* cc1F04(DisplayTextState* arg1, ubyte arg2) {
	setTextSoundMode(cast(short)(arg2 != 0 ? arg2 : getSubRegister()));
	return null;
}

/// $C17274 - [1D 24 XX] Display money earned since last call, resetting if XX is 2
void* cc1D24(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(gameState.moneyEarnedSinceLastCall));
	if (arg2 == 2) {
		gameState.moneyEarnedSinceLastCall = 0;
	}
	return null;
}

/// $C172BC - [1F 40 XX XX] Do nothing
void* cc1F40(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	return null;
}

/// $C172DA - [1F 41 XX] Trigger special event
void* cc1F41(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(MainRegister(triggerSpecialEvent(arg2)));
	return null;
}

/// $C17304 - [1F D2 XX] Summon travelling photographer
void* cc1FD2(DisplayTextState* arg1, ubyte arg2) {
	spawnTravellingPhotographer(cast(short)(arg2 != 0 ? arg2 : getSubRegister()));
	return null;
}

/// $C17325 - [1F F3 XX XX YY]
void* cc1FF3(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1FF3Arguments);
	createManpuBySprite(getCCParameters!ArgType(arg2).arg1, getCCParameters!ArgType(arg2).arg2);
	return null;
}

/// $C1737D - [1F F4 XX XX]
void* cc1FF4(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!ushort);
	deleteManpuBySprite(getCCParameters!ArgType(arg2));
	return null;
}

/// $C173C0
void* cc1C13(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!CC1C13Arguments);
	if (getTextPromptMode() != TextPromptMode.normal) {
		setMainRegister(
			MainRegister(
				startEnemyOrAllyBattleAnimation(
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
	musicEffect(cast(short)(arg2 != 0 ? arg2 : getSubRegister()));
	return null;
}

/// $C17440
void* cc1FD3(DisplayTextState* arg1, ubyte arg2) {
	createDeliveryEntity(arg2);
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
	switch (itemData[cast(ushort)((arg2 != 0) ? arg2 : getSubRegister())].type & 0xC) {
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
	setMainRegister(MainRegister(x06));
	return null;
}

/// $C1776A
void* cc1927(DisplayTextState* arg1, ubyte arg2) {
	setMainRegister(unknownC3EE7A(cast(ushort)((arg2 != 0) ? arg2 : getSubRegister())));
	return null;
}

/// $C17796
void* unknownC17796(DisplayTextState* arg1, ubyte arg2) {
	mixin(ReadParameters!string);
	createNewMenuOptionActive(&textNewMenuOptionBuffer[0], getCCParameters!ArgType(arg2));
	return null;
}

/// $C17889
void* unknownC17889(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 1:
			textNewMenuOptionBuffer[ccArgumentGatheringLoopCounter] = 0;
			ccArgumentGatheringLoopCounter = 0;
			return &unknownC17796;
		case 2:
			textNewMenuOptionBuffer[ccArgumentGatheringLoopCounter] = 0;
			createNewMenuOptionActive(&textNewMenuOptionBuffer[0], null);
			return null;
		default:
			textNewMenuOptionBuffer[ccArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
			return &unknownC17889;
	}
}

/// $C1790B
void* cc18Tree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x00: // close the focused window
			closeFocusWindow();
			break;
		case 0x01: // open a window
			return &cc1801;
		case 0x02: // backup text attributes
			backupCurrentWindowTextAttributes(&arg1.savedTextAttributes);
			arg1.restoreWindowAttributes = 1;
			break;
		case 0x03: // set window focus
			return &cc1803;
		case 0x04: // close all windows
			closeAllWindows();
			hideHPPPWindows();
			windowTick();
			break;
		case 0x05: // set cursor position
			return &cc1805;
		case 0x06: // clear window
			clearFocusWindow();
			break;
		case 0x07: // compare register
			return &cc1807;
		case 0x08: // create menu in window, uncancellable
			return &cc1808;
		case 0x09: // create menu in window, cancellable
			return &cc1809;
		case 0x0A: // open wallet window
			openWalletWindow();
			break;
		case 0x0D: // print character stats?
			return &cc180D;
		default: break;
	}
	return null;
}

/// $C178F7
void* cc1902(DisplayTextState* arg1, ubyte arg2) {
	textNewMenuOptionBuffer[ccArgumentGatheringLoopCounter++] = cast(ubyte)arg2;
	return &unknownC17889;
}

/// $C179AA
void* cc19Tree(DisplayTextState* arg1, ubyte arg2) {
	switch (arg2) {
		case 0x02: // prepare menu option
			return &cc1902;
		case 0x04: // wipe menu options
			resetCurrentWindowMenu();
			break;
		case 0x05:
			return &cc1905;
		case 0x10:
			return &cc1910;
		case 0x11:
			return &cc1911;
		case 0x14:
			setMainRegister(MainRegister(gameState.escargoExpressItems[getLoopRegister() - 1]));
			incrementLoopRegister();
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
			setMainRegister(MainRegister(getCNum()));
			break;
		case 0x1F:
			setMainRegister(MainRegister(getCItem()));
			break;
		case 0x20:
			setMainRegister(MainRegister(gameState.playerControlledPartyMemberCount));
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
			setMainRegister(MainRegister(selectionMenu(0)));
			resetCurrentWindowMenu();
			break;
		case 0x05:
			return &cc1A05;
		case 0x06:
			return &cc1A06;
		case 0x07:
			setMainRegister(MainRegister(unknownC19A43()));
			break;
		case 0x08:
			setMainRegister(MainRegister(selectionMenu(0)));
			break;
		case 0x09:
			setMainRegister(MainRegister(selectionMenu(1)));
			break;
		case 0x0A:
			setMainRegister(MainRegister(makePhoneCall()));
			break;
		case 0x0B:
			setMainRegister(MainRegister(selectPSITeleportDestination()));
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
			if (getMainRegister().integer == 0) {
				return &cc0A;
			} else {
				arg1.script += string.sizeof;
			}
			break;
		case 0x03:
			if (getMainRegister().integer != 0) {
				return &cc0A;
			} else {
				arg1.script += string.sizeof;
			}
			break;
		case 0x04:
			uint value = getMainRegister().integer;
			setMainRegister(MainRegister(getSubRegister()));
			setSubRegister(value);
			break;
		case 0x05:
			textMainRegisterBackup = getMainRegister();
			textSubRegisterBackup = getSubRegister();
			textLoopRegisterBackup = cast(ubyte)getLoopRegister();
			break;
		case 0x06:
			setMainRegister(textMainRegisterBackup);
			setSubRegister(textSubRegisterBackup);
			setLoopRegister(textLoopRegisterBackup);
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
			printBattlerArticle(0);
			printStringAutoNewline(0x50, getBattleAttackerName());
			break;
		case 0x0E:
			printBattlerArticle(1);
			printStringAutoNewline(0x50, getBattleTargetName());
			break;
		case 0x0F:
			printNumber(getCNum());
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
			if (ebStrcmp(getBattleTargetName(), getBattleAttackerName()) == 0) {
				x14 = 1;
			}
			setMainRegister(MainRegister(x14));
			break;
		case 0x21:
			return &cc1D21;
		case 0x22:
			short x14 = 0;
			if ((loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & 7) == SpecialGameState.exitMouseUsable) {
				x14 = 1;
			}
			setMainRegister(MainRegister(x14));
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
			setAutoSectorMusicChanges(0);
			break;
		case 0x06:
			setAutoSectorMusicChanges(1);
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
			waitForActionscript();
			break;
		case 0x62:
			return &cc1F62;
		case 0x63:
			return &cc1F63;
		case 0x64:
			backupClearPartyNPCsMoney();
			break;
		case 0x65:
			restorePartyBackup();
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
			playerHasMovedSinceMapLoad = 0;
			setLeaderPosition(gameState.exitMouseXCoordinate, gameState.exitMouseYCoordinate, 4);
			fadeIn(1, 1);
			stairsDirection = -1;
			break;
		case 0x71:
			return &cc1F71;
		case 0x81:
			return &cc1F81;
		case 0x83:
			return &cc1F83;
		case 0x90:
			setMainRegister(MainRegister(openPhoneMenu()));
			break;
		case 0xA0:
			setGiftBoxState(1);
			break;
		case 0xA1:
			setGiftBoxState(0);
			break;
		case 0xA2:
			setMainRegister(MainRegister(getActiveNPCFlagState()));
			break;
		case 0xB0:
			saveCurrentGame();
			break;
		case 0xC0:
			return &cc1FC0;
		case 0xD0:
			return &cc1FD0;
		case 0xD1:
			setMainRegister(MainRegister(getDistanceToMagicTruffle()));
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

/** Initializes a DisplayTextState
 * Params:
 * 	state = State being initialized
 * 	script = Start of a text script
 * Original_Address: $(DOLLAR)C1866D
 */
DisplayTextState* initializeDisplayTextState(DisplayTextState* state, const(ubyte)* script) {
	if (state is null) {
		return null;
	}
	state.restoreWindowAttributes = 0;
	state.script = script;
	return state;
}

/** Handles cleanup at the end of a text script
 * Original_Address: $(DOLLAR)C1869D
 */
void cleanupTextScript(DisplayTextState* arg1) {
	if (arg1 is null) {
		return;
	}
	if (arg1.restoreWindowAttributes == 0) {
		return;
	}
	restoreCurrentWindowTextAttributes(&arg1.savedTextAttributes);
}

/// $C186B1 - Call a text script
const(ubyte)* displayText(const(ubyte)* script) {
	void* function(DisplayTextState*, ubyte) ccFunction = null;
	ubyte nextChar;
	const(ubyte)* compressedTextPointer = &battleBackRowText[12]; // this seems weird, until you realize that it's pointing directly at a null
	if (script is null) {
		return script;
	}
	DisplayTextState* state = initializeDisplayTextState(pushPeekTextStack(), script);
	if (state is null) {
		return null;
	}
	size_t waitBytes = 0;
	loop: while (true) {
		// just some debugging, not in vanilla
		debug(printTextTrace) if (ccFunction is null) {
			auto str = getFullCC(compressedTextPointer[0] ? compressedTextPointer : state.script);
			tracef("Next text: [%(%02X %)]", str);
		}
		// handle word wrapping
		if ((enableWordWrap != 0) && (ccFunction is null)) {
			if (upcomingWordLength == 0) {
				printAutoNewline(state, compressedTextPointer);
			} else {
				upcomingWordLength--;
			}
		}
		// advance text pointers
		if (compressedTextPointer[0] != 0) {
			nextChar = compressedTextPointer[0];
			compressedTextPointer++;
		} else {
			nextChar = state.script[0];
			state.script++;
		}
		// an earlier character started a CC, so keep calling it until it's done
		if (ccFunction !is null) {
			ccFunction = cast(typeof(ccFunction))ccFunction(state, nextChar);
			continue;
		}
		// handle compressed CCs early, so the normal CC logic can handle the first character
		switch (nextChar) {
			case 0x15:
				const(ubyte)* tmp = &compressedText[0][state.script[0]][0];
				state.script++;
				nextChar = tmp[0];
				tmp++;
				compressedTextPointer = tmp;
				break;
			case 0x16:
				const(ubyte)* tmp = &compressedText[1][state.script[0]][0];
				state.script++;
				nextChar = tmp[0];
				tmp++;
				compressedTextPointer = tmp;
				break;
			case 0x17:
				const(ubyte)* tmp = &compressedText[2][state.script[0]][0];
				state.script++;
				nextChar = tmp[0];
				tmp++;
				compressedTextPointer = tmp;
				break;
			default: break;
		}
		// handle CCs
		if (nextChar < 0x20) {
			ccArgumentGatheringLoopCounter = 0;
			switch (nextChar) {
				case 0x00: // force new line
					printNewLine();
					break;
				case 0x01: // start new line
					if (getTextX() != 0) {
						printNewLine();
					}
					break;
				case 0x02: // end of script
					break loop;
				case 0x03: // halt, with visible prompt, use speed-based wait if textPromptMode is set
					cc1314(1, 0);
					break;
				case 0x04: // set flag
					ccFunction = &cc04;
					break;
				case 0x05: // clear flag
					ccFunction = &cc05;
					break;
				case 0x06: // jump if flag set
					ccFunction = &cc06;
					break;
				case 0x07: // get event flag
					ccFunction = &cc07;
					break;
				case 0x08: // call
					ccFunction = &cc08;
					break;
				case 0x09: // switch
					ccFunction = &cc09;
					break;
				case 0x0A: // goto
					ccFunction = &cc0A;
					break;
				case 0x0B: // eq
					ccFunction = &cc0B;
					break;
				case 0x0C: // not eq
					ccFunction = &cc0C;
					break;
				case 0x0D: // copy to sub register
					ccFunction = &cc0D;
					break;
				case 0x0E: // copy to loop register
					ccFunction = &cc0E;
					break;
				case 0x0F: // increment loop register
					incrementLoopRegister();
					break;
				case 0x10: // pause
					ccFunction = &cc10;
					break;
				case 0x11: // creates a cancellable menu
					setMainRegister(MainRegister(selectionMenu(1)));
					resetCurrentWindowMenu();
					break;
				case 0x12: // clear current line
					cc12();
					break;
				case 0x13: // halt, without visible prompt, use speed-based wait if textPromptMode is set
					cc1314(0, 0);
					break;
				case 0x14: // halt, with visible prompt, don't use speed-based wait
					cc1314(1, 1);
					break;
				case 0x18:
					ccFunction = &cc18Tree;
					break;
				case 0x19:
					ccFunction = &cc19Tree;
					break;
				case 0x1A:
					ccFunction = &cc1ATree;
					break;
				case 0x1B:
					ccFunction = &cc1BTree;
					break;
				case 0x1C:
					ccFunction = &cc1CTree;
					break;
				case 0x1D:
					ccFunction = &cc1DTree;
					break;
				case 0x1E:
					ccFunction = &cc1ETree;
					break;
				case 0x1F:
					ccFunction = &cc1FTree;
					break;
				default: break;
			}
		} else {
			printLetterVWF(nextChar);
		}
	}
	cleanupTextScript(state);
	popTextStack();
	return state.script;
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
	if (slot < partyCharacters[character - 1].equipment[EquipmentSlot.weapon]) {
		partyCharacters[character - 1].equipment[EquipmentSlot.weapon]--;
	}
	if (slot < partyCharacters[character - 1].equipment[EquipmentSlot.body]) {
		partyCharacters[character - 1].equipment[EquipmentSlot.body]--;
	}
	if (slot < partyCharacters[character - 1].equipment[EquipmentSlot.arms]) {
		partyCharacters[character - 1].equipment[EquipmentSlot.arms]--;
	}
	if (slot < partyCharacters[character - 1].equipment[EquipmentSlot.other]) {
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
			return removeItemFromInventory(character, cast(ushort)(i + 1));
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
	return gameState.partyMemberIndex[arg1 - 1];
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
	printWordsAutoNewline(Item.name.length, &itemData[arg1].name[0]);
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
		printStringAutoNewline(cc1C01Table[arg1].size, cast(ubyte*)cc1C01Table[arg1].address);
	}
}

/// $C1931B
void unknownC1931B(short arg1) {
	if (arg1 > 4) {
		if (arg1 == PartyMember.king) {
			if (allowTextOverflow != 0) {
				printString(gameState.petName.length, &gameState.petName[0]);
			} else {
				printStringAutoNewline(gameState.petName.length, &gameState.petName[0]);
			}
		} else {
			printStringAutoNewline(Enemy.name.length, &enemyConfigurationTable[npcAITable[arg1].enemyID].name[0]);
		}
	} else {
		if (allowTextOverflow != 0) {
			printString(PartyCharacter.name.length, &partyCharacters[arg1 -1].name[0]);
		} else {
			printStringAutoNewline(PartyCharacter.name.length, &partyCharacters[arg1 - 1].name[0]);
		}
	}
}

/// $C193E7
void openEquipSelectWindow(short arg1) {
	backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
	setInstantPrinting();
	createWindow(Window.equipSelectItem);
	printString(miscTargetText[arg1].length, &miscTargetText[arg1][0]);
	clearInstantPrinting();
	restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
}

/// $C19437
void closeEquipSelectWindow() {
	closeWindow(Window.equipSelectItem);
}

/// $C19441
ushort openPhoneMenu() {
	ushort selected = 0;
	backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
	createWindow(Window.equipMenuItemlist);
	setWindowTitle(7, 5, &phoneCallText[0]);
	for (short i = 1; telephoneContacts[i].title[0] != 0; i++) {
		if (getEventFlag(telephoneContacts[i].eventFlag) == 0) {
			continue;
		}
		memcpy(&temporaryTextBuffer[0], &telephoneContacts[i].title[0], TelephoneContact.title.length);
		temporaryTextBuffer[TelephoneContact.title.length] = 0;
		createNewMenuOptionWithUserdata(i, &temporaryTextBuffer[0], null);
	}
	if (unknownC12BD5(0) != 0) {
		printMenuOptionTable(1, 0, 1);
		selected = selectionMenu(1);
	}
	closeFocusWindow();
	restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
	return selected;
}

/// $C1952F
void unknownC1952F(short arg1) {
	arg1--;
	setInstantPrinting();
	createWindow(Window.statusMenu);
	windowTickWithoutInstantPrinting();
	forceLeftTextAlignment = 1;
	displayText(getTextBlock("STATUS_WINDOW"));
	forceLeftTextAlignment = 0;
	if (gameState.playerControlledPartyMemberCount != 1) {
		paginationWindow = Window.statusMenu;
	}
	setWindowTitle(Window.statusMenu, PartyCharacter.name.length, &partyCharacters[arg1].name[0]);
	forceLeftTextAlignment = 1;
	setCurrentWindowPadding(1);
	forcePixelAlignment(38, 0);
	printNumber(partyCharacters[arg1].level);
	setCurrentWindowPadding(2);
	forcePixelAlignment(94, 3);
	printNumber(partyCharacters[arg1].hp.current.integer);
	forcePixelAlignment(114, 3);
	printLetterVWF(ebChar('/'));
	forcePixelAlignment(121, 3);
	printNumber(partyCharacters[arg1].maxHP);
	forcePixelAlignment(94, 4);
	printNumber(partyCharacters[arg1].pp.current.integer);
	forcePixelAlignment(114, 4);
	printLetterVWF(ebChar('/'));
	forcePixelAlignment(121, 4);
	printNumber(partyCharacters[arg1].maxPP);
	forcePixelAlignment(199, 0);
	printNumber(partyCharacters[arg1].offense);
	forcePixelAlignment(199, 1);
	printNumber(partyCharacters[arg1].defense);
	forcePixelAlignment(199, 2);
	printNumber(partyCharacters[arg1].speed);
	forcePixelAlignment(199, 3);
	printNumber(partyCharacters[arg1].guts);
	forcePixelAlignment(199, 4);
	printNumber(partyCharacters[arg1].vitality);
	forcePixelAlignment(199, 5);
	printNumber(partyCharacters[arg1].iq);
	forcePixelAlignment(199, 6);
	printNumber(partyCharacters[arg1].luck);
	setCurrentWindowPadding(6);
	forcePixelAlignment(97, 5);
	printNumber((partyCharacters[arg1].exp > 9_999_999) ? 9_999_999 : partyCharacters[arg1].exp);
	forcePixelAlignment(10, 6);
	printNumber(getRequiredEXP(cast(short)(arg1 + 1)));
	forceLeftTextAlignment = 0;
	loop: for (short i = 0; i < 7; i++) {
		ubyte affliction = partyCharacters[arg1].afflictions[i];
		if (affliction == 0) {
			continue;
		}
		const(ubyte)* statusName;
		switch (i) {
			case 0:
				statusName = &statusNamesGroup0[affliction - 1][0];
				break;
			case 1:
				statusName = &statusNamesGroup1[affliction - 1][0];
				break;
			case 5:
				statusName = &statusNamesGroup5[0][0];
				break;
			default: break loop;
		}
		moveCurrentTextCursor(1, 1);
		printString(0x100, statusName);
		break;
	}
	moveCurrentTextCursor(11, 1);
	printLetter(unknownC223D9(&partyCharacters[arg1].afflictions[0], 0));
	if (arg1 != 2) {
		forceLeftTextAlignment = 1;
		forcePixelAlignment(36, 7);
		printString(psiInfoInstruction.length, &psiInfoInstruction[0]);
		forceLeftTextAlignment = 0;
	}
	clearInstantPrinting();
}

/// $C198DE
void addCharacterInventoryToWindow(short character, short window) {
	character--;
	createWindow(window);
	if (gameState.playerControlledPartyMemberCount != 1) {
		paginationWindow = window;
	}
	setWindowTitle(window, PartyCharacter.name.length, &partyCharacters[character].name[0]);
	for (short i = 0; PartyCharacter.items.length > i; i++) {
		short x16 = partyCharacters[character].items[i];
		if (checkItemEquipped(cast(short)(character + 1), cast(short)(i + 1)) != 0) {
			temporaryTextBuffer[0] = TallTextTile.equipped;
			memcpy(&temporaryTextBuffer[1], &itemData[x16].name[0], Item.name.length);
		} else {
			memcpy(&temporaryTextBuffer[0], &itemData[x16].name[0], Item.name.length);
		}
		temporaryTextBuffer[Item.name.length] = 0;
		if (x16 != 0) {
			createNewMenuOptionActive(&temporaryTextBuffer[0], null);
		}
	}
	windowTickWithoutInstantPrinting();
	printMenuOptionTable(2, 0, 0);
}

/// $C19A11
short unknownC19A11(short arg1, short arg2) {
	backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
	setWindowFocus(arg1);
	short x0E = selectionMenu(arg2);
	restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
	return x0E;
}

/// $C19A43
ushort unknownC19A43() {
	ubyte* x18 = &temporaryTextBuffer[statusEquipWindowText7.length];
	backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
	createWindow(Window.unknown0d);
	memcpy(&temporaryTextBuffer[0], &statusEquipWindowText7[0], 12);
	(x18++)[0] = ebChar('(');
	(x18++)[0] = ebChar('1');
	(x18++)[0] = ebChar(')');
	(x18++)[0] = 0;
	setWindowTitle(13, -1, &temporaryTextBuffer[0]);
	for (short i = 0; i < gameState.escargoExpressItems.length; i++) {
		memcpy(&temporaryTextBuffer[0], &itemData[gameState.escargoExpressItems[i]].name[0], Item.name.sizeof);
		temporaryTextBuffer[Item.name.sizeof] = 0;
		if (gameState.escargoExpressItems[i] != 0) {
			createNewMenuOptionActive(&temporaryTextBuffer[0], null);
		}
	}
	printMenuOptionTable(2, 0, 1);
	short x18_2 = selectionMenu(1);
	removeWindowFromScreen(Window.unknown0d);
	forceLeftTextAlignment = 0;
	restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
	return x18_2;
}

/// $C19B4E
void setHPPPWindowModeItem(short arg1) {
	short attributes;
	for (short i = 0; i < 4; i++) {
		if (canCharacterEquip(cast(short)(i +1), arg1) == 0) {
			attributes = TilemapFlag.palette3;
		} else if (getItemType(arg1) != 2) {
			attributes = TilemapFlag.palette1;
		} else {
			short equippedItemSlot;
			switch (itemData[arg1].type & 0xC) {
				case 0x0: // weapon
					equippedItemSlot = partyCharacters[i].equipment[EquipmentSlot.weapon];
					break;
				case 0x4: // body
					equippedItemSlot = partyCharacters[i].equipment[EquipmentSlot.body];
					break;
				case 0x8: // arms
					equippedItemSlot = partyCharacters[i].equipment[EquipmentSlot.arms];
					break;
				case 0xC: // other
					equippedItemSlot = partyCharacters[i].equipment[EquipmentSlot.other];
					break;
				default: break;
			}
			attributes = (itemData[arg1].parameters.raw[(i == 3) ? 1 : 0] > ((equippedItemSlot != 0) ? itemData[partyCharacters[i].items[equippedItemSlot - 1]].parameters.raw[(i == 3) ? 1 : 0] : 0)) ? TilemapFlag.palette5 : TilemapFlag.palette1;
		}
		partyCharacters[i].hpPPWindowOptions = attributes;
	}
	redrawAllWindows = 1;
}

/// $C19CDD
void unknownC19CDD() {
	for (short i = 0; i < 4; i++) {
		partyCharacters[i].hpPPWindowOptions = TilemapFlag.palette1;
	}
	memcpy(&palettes[0][12], &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][20], ushort[4].sizeof);
	paletteUploadMode = PaletteUpload.full;
	redrawAllWindows = 1;
}

/// $C19D49
void unknownC19D49() {
	for (short i = 0; i < 4; i++) {
		partyCharacters[i].hpPPWindowOptions = TilemapFlag.palette1;
	}
	memcpy(&palettes[0][12], &textWindowFlavourPalettes[textWindowProperties[gameState.textFlavour - 1].offset / 0x40][12], ushort[4].sizeof);
	paletteUploadMode = PaletteUpload.full;
	redrawAllWindows = 1;
}

/** Creates a menu for selecting items available for sale at a store
 * Original_Address: $(DOLLAR)C19DB5
 */
ushort itemStoreSelection(short store) {
	openWalletWindow();
	setInstantPrinting();
	backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
	createWindow(Window.unknown0c);
	setCurrentWindowPadding(5);
	for (short i = 0; i < 7; i++) {
		short item = storeTable[store][i];
		if (item == ItemID.none) {
			continue;
		}
		memcpy(&temporaryTextBuffer[0], &itemData[item].name[0], Item.name.length);
		temporaryTextBuffer[Item.name.length] = 0;
		createNewMenuOptionWithUserdata(item, &temporaryTextBuffer[0], null);
		moveCurrentTextCursor(0, i);
		printPrice(itemData[item].cost);
	}
	moveCurrentTextCursor(0, 0);
	printMenuOptionTable(1, 0, 0);
	unknownC11F5A(&setHPPPWindowModeItem);
	unknownC19CDD();
	ushort x1A = selectionMenu(1);
	unknownC19D49();
	closeFocusWindow();
	restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
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
void printEquipment(short character) {
	character--;
	createWindow(Window.equipMenu);
	windowTickWithoutInstantPrinting();
	if (gameState.playerControlledPartyMemberCount != 1) {
		paginationWindow = Window.equipMenu;
	}
	setWindowTitle(6, PartyCharacter.name.length, &partyCharacters[character].name[0]);
	for (short i = 0; 4 > i; i++) {
		forceLeftTextAlignment = 1;
		short itemSlot;
		switch (i) {
			case 0:
				createNewMenuOptionAtPosition(0, i, &equipmentSlotNamesRightAligned[i][0], null);
				itemSlot = partyCharacters[character].equipment[EquipmentSlot.weapon];
				break;
			case 1:
				createNewMenuOptionAtPosition(0, i, &equipmentSlotNamesRightAligned[i][0], null);
				itemSlot = partyCharacters[character].equipment[EquipmentSlot.body];
				break;
			case 2:
				createNewMenuOptionAtPosition(0, i, &equipmentSlotNamesRightAligned[i][0], null);
				itemSlot = partyCharacters[character].equipment[EquipmentSlot.arms];
				break;
			case 3:
				createNewMenuOptionAtPosition(0, i, &equipmentSlotNamesRightAligned[i][0], null);
				itemSlot = partyCharacters[character].equipment[EquipmentSlot.other];
				break;
			default: break;
		}
		if (itemSlot != 0) {
			if (checkItemEquipped(cast(short)(character + 1), itemSlot) != 0) {
				temporaryTextBuffer[0] = TallTextTile.equipped;
				memcpy(&temporaryTextBuffer[1], &itemData[partyCharacters[character].items[itemSlot - 1]].name[0], Item.name.length);
			} else {
				memcpy(&temporaryTextBuffer[0], &itemData[partyCharacters[character].items[itemSlot - 1]].name[0], Item.name.length);
			}
			temporaryTextBuffer[Item.name.length] = 0;
		} else {
			memcpy(&temporaryTextBuffer[0], &nothingEquipped[0], nothingEquipped.length);
			temporaryTextBuffer[nothingEquipped.length] = 0;
		}
		moveCurrentTextCursor(6, i);
		printLetterVWF(ebChar(':'));
		printLetterVWF(ebChar(' '));
		printString(temporaryTextBuffer.length, &temporaryTextBuffer[0]);
	}
	printMenuItems();
	forceLeftTextAlignment = 0;
	clearInstantPrinting();
}

/// $C1A1D8
void printEquipmentStats(short character) {
	character--;
	createWindow(Window.equipMenuStats);
	windowTickWithoutInstantPrinting();
	setCurrentWindowPadding(2);
	moveCurrentTextCursor(0, 0);
	printString(offenseEquip.length, &offenseEquip[0]);
	short offense = partyCharacters[character].baseOffense;
	if (partyCharacters[character].equipment[EquipmentSlot.weapon] != 0) {
		short parameter = 0;
		if (character == PartyMember.poo - 1) {
			parameter = 1;
		}
		offense += itemData[partyCharacters[character].items[partyCharacters[character].equipment[EquipmentSlot.weapon] - 1]].parameters.raw[parameter];
	}
	forceLeftTextAlignment = 1;
	forcePixelAlignment(55, 0);
	printNumber((0 > offense) ? 0 : ((offense > 255) ? 255 : offense));
	forceLeftTextAlignment = 0;
	moveCurrentTextCursor(0, 1);
	printString(defenseEquip.length, &defenseEquip[0]);
	short defense = partyCharacters[character].baseDefense;
	if (partyCharacters[character].equipment[EquipmentSlot.body] != 0) {
		short parameter = 0;
		if (character == PartyMember.poo - 1) {
			parameter = 1;
		}
		defense += itemData[partyCharacters[character].items[partyCharacters[character].equipment[EquipmentSlot.body] - 1]].parameters.raw[parameter];
	}
	if (partyCharacters[character].equipment[EquipmentSlot.arms] != 0) {
		short parameter = 0;
		if (character == PartyMember.poo - 1) {
			parameter = 1;
		}
		defense += itemData[partyCharacters[character].items[partyCharacters[character].equipment[EquipmentSlot.arms] - 1]].parameters.raw[parameter];
	}
	if (partyCharacters[character].equipment[EquipmentSlot.other] != 0) {
		short parameter = 0;
		if (character == PartyMember.poo - 1) {
			parameter = 1;
		}
		defense += itemData[partyCharacters[character].items[partyCharacters[character].equipment[EquipmentSlot.other] - 1]].parameters.raw[parameter];
	}
	forceLeftTextAlignment = 1;
	forcePixelAlignment(55, 1);
	printNumber((0 > defense) ? 0 : ((defense > 255) ? 255 : defense));
	forceLeftTextAlignment = 0;
	if (compareEquipmentMode != 0) {
		forcePixelAlignment(76, 0);
		windowSetTextColor(TextPalette.miscUIElements);
		printLetter(TallTextTile.rightArrowSmallWhite);
		windowSetTextColor(TextPalette.normal);
		short newOffense = partyCharacters[character].baseOffense;
		if (temporaryWeapon != 0) {
			short parameter = 0;
			if (character == PartyMember.poo - 1) {
				parameter = 1;
			}
			newOffense += itemData[partyCharacters[character].items[temporaryWeapon - 1]].parameters.raw[parameter];
		}
		forceLeftTextAlignment = 1;
		printNumber((0 > newOffense) ? 0 : ((newOffense > 255) ? 255 : newOffense));
		forceLeftTextAlignment = 0;
		forcePixelAlignment(76, 1);
		windowSetTextColor(TextPalette.miscUIElements);
		printLetter(TallTextTile.rightArrowSmallWhite);

		short newDefense = partyCharacters[character].baseDefense;
		if (temporaryBodyGear != 0) {
			short parameter = 0;
			if (character == PartyMember.poo - 1) {
				parameter = 1;
			}
			newDefense += itemData[partyCharacters[character].items[temporaryBodyGear - 1]].parameters.raw[parameter];
		}
		if (temporaryArmsGear != 0) {
			short parameter = 0;
			if (character == PartyMember.poo - 1) {
				parameter = 1;
			}
			newDefense += itemData[partyCharacters[character].items[temporaryArmsGear - 1]].parameters.raw[parameter];
		}
		if (temporaryOtherGear != 0) {
			short parameter = 0;
			if (character == PartyMember.poo - 1) {
				parameter = 1;
			}
			newDefense += itemData[partyCharacters[character].items[temporaryOtherGear - 1]].parameters.raw[parameter];
		}
		forceLeftTextAlignment = 1;
		printNumber((0 > newDefense) ? 0 : ((newDefense > 255) ? 255 : newDefense));
		forceLeftTextAlignment = 0;
	}
	clearInstantPrinting();
}

/// $C1A778
void unknownC1A778(short arg1) {
	compareEquipmentMode = 0;
	printEquipment(arg1);
	printEquipmentStats(arg1);
}

/// $C1A795
void handleEquipMenu(short character) {
	character--;
	while (true) {
		openEquipSelectWindow(4);
		setWindowFocus(Window.equipMenu);
		short x1C = selectionMenu(1);
		closeEquipSelectWindow();
		if (x1C == 0) {
			break;
		}
		createWindow(Window.equipMenuItemlist);
		setWindowTitle(Window.equipMenuItemlist, cast(short)strlen(cast(const(char)*)&equipmentSlotNames[x1C - 1][0]), &equipmentSlotNames[x1C - 1][0]);
		// assume we have nothing equippable or equipped until proven otherwise
		short menuOptionsCreated = 0;
		short selectedOption = -1;
		for (short i = 0; i < partyCharacters[character].items.length; i++) {
			short x16 = partyCharacters[character].items[i];
			if (x16 == 0) {
				continue;
			}
			if (getItemType(x16) != 2) {
				continue;
			}
			if (getItemSubtype(x16) != x1C) {
				continue;
			}
			if (canCharacterEquip(cast(short)(character + 1), x16) == 0) {
				continue;
			}
			if (checkItemEquipped(cast(short)(character + 1), cast(short)(i + 1)) != 0) {
				temporaryTextBuffer = TallTextTile.equipped;
				memcpy(&temporaryTextBuffer[1], &itemData[x16].name, Item.name.length);
				selectedOption = menuOptionsCreated;
			} else {
				memcpy(&temporaryTextBuffer[0], &itemData[x16].name, Item.name.length);
			}
			temporaryTextBuffer[Item.name.length] = 0;
			createNewMenuOptionWithUserdata(cast(short)(i + 1), &temporaryTextBuffer[0], null).sfx = Sfx.equippedItem;
			menuOptionsCreated++;
		}
		createNewMenuOptionWithUserdata(-1, &statusEquipWindowText13[0], null);
		printMenuOptionTablePreselected(1, 0, selectedOption);
		characterForEquipMenu = cast(ubyte)(character + 1);
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
		compareEquipmentMode = 1;
		openEquipSelectWindow(1);
		short x18_2 = selectionMenu(1);
		closeEquipSelectWindow();
		unknownC11F8A();
		if (x18_2 == -1) {
			switch (x1C) {
				case 1:
					changeEquippedWeapon(cast(short)(character + 1), 0);
					break;
				case 2:
					changeEquippedBody(cast(short)(character + 1), 0);
					break;
				case 3:
					changeEquippedArms(cast(short)(character + 1), 0);
					break;
				case 4:
					changeEquippedOther(cast(short)(character + 1), 0);
					break;
				default: break;
			}
		} else if (x18_2 != 0) {
			equipItem(cast(short)(character + 1), x18_2);
		}
		closeWindow(Window.equipMenuItemlist);
		unknownC1A778(cast(short)(character + 1));
	}
}

/** Opens the wallet window, displaying the amount of money held by the party.
* Original_Address: $(DOLLAR)C1AA18
*/
void openWalletWindow() {
	backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
	createWindow(Window.carriedMoney);
	setCurrentWindowPadding(5);
	setInstantPrinting();
	clearFocusWindow();
	printPrice(gameState.moneyCarried);
	clearInstantPrinting();
	restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
}

/// $C1AA5D
short unknownC1AA5D() {
	backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
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
			swapRaisedHPPPWindow(0);
		}
		if (x16 == 0) {
			break;
		}
		handleEquipMenu(x16);
		if (gameState.playerControlledPartyMemberCount == 1) {
			break;
		}
	}
	closeWindow(Window.equipMenuStats);
	closeWindow(Window.equipMenu);
	restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
	return x16;
}

/// $C1AAFA
ushort selectPSITeleportDestination() {
	short selected = 0;
	openEquipSelectWindow(2);
	backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
	createWindow(Window.phoneMenu);
	setWindowTitle(5, 3, &statusEquipWindowText14[0]);
	for (short i = 1; psiTeleportDestinationTable[i].name[0] != 0; i++) {
		if (psiTeleportDestinationTable[i].name[0] == 0) {
			continue;
		}
		if (getEventFlag(psiTeleportDestinationTable[i].eventFlag) == 0) {
			continue;
		}
		memcpy(&temporaryTextBuffer[0], &psiTeleportDestinationTable[i].name[0], PSITeleportDestination.name.length);
		temporaryTextBuffer[PSITeleportDestination.name.length] = 0;
		createNewMenuOptionWithUserdata(i, &temporaryTextBuffer[0], null);
	}
	if (unknownC12BD5(0) != 0) {
		printMenuOptionTable(1, 0, 1);
		selected = cast(short)selectionMenu(1);
	}
	closeFocusWindow();
	closeEquipSelectWindow();
	restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
	return selected;
}

/// $C1AC00
ushort makePhoneCall() {
	ushort selectedContact = openPhoneMenu();
	if (selectedContact != 0) {
		displayText(getTextBlock(telephoneContacts[selectedContact].text));
	}
	return selectedContact;
}

/// $C1AC4A
void setBattleAttackerName(ubyte* str, short length) {
	memcpy(&battleAttackerName[0], str, length);
	battleAttackerName[length] = 0;
	attackerEnemyID = -1;
}

/// $C1ACA1
void setBattleTargetName(ubyte* str, short length) {
	memcpy(&battleTargetName[0], str, length);
	battleTargetName[length] = 0;
	targetEnemyID = -1;
}

/// $C1AC9B
ubyte* getBattleAttackerName() {
	return &battleAttackerName[0];
}

/// $C1ACF2
ubyte* getBattleTargetName() {
	return &battleTargetName[0];
}

/// $C1ACF8
void setCItem(short arg1) {
	cItem = cast(ubyte)arg1;
}

/// $C1AD02
ubyte getCItem() {
	return cItem;
}

/// $C1AD0A
void setCNum(int arg) {
	cNum = arg;
}

/// $C1AD26
uint getCNum() {
	return cNum;
}

/// $C1AD42
short findReceiveItemNPC() {
	findNearbyCheckableNPC();
	if ((interactingNPCID == 0) || (interactingNPCID == -1) || (interactingNPCID == -2)) {
		return 0;
	} else {
		return npcConfig[interactingNPCID].type;
	}
}

/// $C1AD71
short getSectorUsableItem() {
	ushort x0E = loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer);
	if ((getEventFlag(EventFlag.winGiegu) != 0) && ((x0E & 7) == SpecialGameState.none)) {
		return ItemID.bicycle;
	} else {
		return x0E >> 8;
	}
}

/// $C1ADB4
short determineTargetting(short action, short user) {
	ubyte targetFlags;
	ubyte extraParam = 0xFF;
	switch (battleActionTable[action].direction) {
		case ActionDirection.enemy:
			targetFlags = Targetted.enemies;
			switch (battleActionTable[action].target) {
				case ActionTarget.none:
					targetFlags = Targetted.enemies | Targetted.single;
					extraParam = cast(ubyte)user;
					break;
				case ActionTarget.one:
					targetFlags = Targetted.enemies | Targetted.single;
					extraParam = cast(ubyte)pickTarget(0, 1, action);
					break;
				case ActionTarget.random:
					targetFlags = Targetted.enemies | Targetted.single;
					extraParam = cast(ubyte)(randMod(cast(short)(countChars(BattleSide.foes) - 1)) + 1);
					break;
				case ActionTarget.row:
					targetFlags = Targetted.enemies | Targetted.row;
					extraParam = cast(ubyte)pickTarget(1, 1, action);
					break;
				case ActionTarget.all:
				default:
					targetFlags |= Targetted.all;
					break;
			}
			break;
		case ActionDirection.party:
			targetFlags = Targetted.allies;
			switch (battleActionTable[action].target) {
				case ActionTarget.none:
					targetFlags = Targetted.allies | Targetted.single;
					extraParam = cast(ubyte)user;
					break;
				case ActionTarget.one:
					targetFlags = Targetted.allies | Targetted.single;
					if (gameState.playerControlledPartyMemberCount != 1) {
						openEquipSelectWindow(3);
						extraParam = cast(ubyte)charSelectPrompt(1, 1, null, null);
						closeEquipSelectWindow();
					} else {
						extraParam = cast(ubyte)user;
					}
					break;
				case ActionTarget.random:
					targetFlags = Targetted.allies | Targetted.single;
					extraParam = cast(ubyte)gameState.partyMemberIndex[randMod(cast(short)(countChars(BattleSide.friends) - 1))];
					break;
				case ActionTarget.row:
				case ActionTarget.all:
				default:
					targetFlags |= Targetted.all;
					break;
			}
			break;
		default: break;
	}
	return cast(short)((cast(short)targetFlags << 8) | extraParam);
}

/// $C1AF74
short overworldUseItem(short character, short slot, short) {
	const(ubyte)* textToPrint = null;
	short itemIsUsable = 0;
	ubyte item = cast(ubyte)getCharacterItem(character, slot);
	switch (itemData[item].type & (ItemType.equippable | ItemType.edible)) {
		case 0:
			itemIsUsable = 1;
			textToPrint = getTextBlock(battleActionTable[itemData[item].battleAction].text);
			break;
		case ItemType.equippable:
			textToPrint = getTextBlock("MSG_SYS_GOODS_EQUIP");
			break;
		case ItemType.edible:
			itemIsUsable = 1;
			textToPrint = getTextBlock(battleActionTable[itemData[item].battleAction].text);
			break;
		case ItemType.healingItem:
			if ((itemData[item].flags & itemUsableFlags[character - 1]) == 0) {
				textToPrint = getTextBlock("MSG_SYS_GOODS_USE_NG_USER");
			} else {
				switch (itemData[item].type & 0xC) {
					case 0:
						itemIsUsable = 1;
						textToPrint = getTextBlock(battleActionTable[itemData[item].battleAction].text);
						break;
					case 4:
						textToPrint = getTextBlock("MSG_SYS_GOODS_USE_NG_HERE");
						break;
					case 8:
						switch(itemData[item].type & 3) {
							case 0:
							case 1:
								itemIsUsable = 1;
								textToPrint = getTextBlock(battleActionTable[itemData[item].battleAction].text);
								break;
							case 2:
								if (getSectorUsableItem() == item) {
									if ((item == ItemID.bicycle) && (checkBicycleCollisionFlags() != 0)) {
										textToPrint = getTextBlock("MSG_SYS_BICYCLE_ATARI_HERE");
									} else {
										itemIsUsable = 1;
										textToPrint = getTextBlock(battleActionTable[itemData[item].battleAction].text);
									}
								} else {
									textToPrint = getTextBlock("MSG_SYS_GOODS_USE_NG_HERE");
								}
								break;
							case 3:
								itemIsUsable = 1;
								short tmp = findReceiveItemNPC();
								if ((tmp == 1) || (tmp == 3)) {
									textToPrint = getTextBlock(npcConfig[interactingNPCID].checkText);
								}
								if (textToPrint == null) {
									textToPrint = getTextBlock(battleActionTable[itemData[item].battleAction].text);
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
	ubyte target = cast(ubyte)character;
	if (itemIsUsable) {
		target = cast(ubyte)determineTargetting(itemData[item].battleAction, character);
		if (target == 0) {
			return 0;
		}
		if ((itemData[item].flags & ItemFlags.consumedOnUse) != 0) {
			removeItemFromInventory(character, slot);
		}
	}
	closeWindow(Window.inventoryMenu);
	closeWindow(Window.inventory);
	setBattleAttackerName(&partyCharacters[character - 1].name[0], PartyCharacter.name.sizeof);
	setCItem(item);
	createWindow(Window.textStandard);
	setMainRegister(MainRegister(character));
	setSubRegister(slot);
	if (target != 0xFF) {
		setBattleTargetName(&partyCharacters[target - 1].name[0], PartyCharacter.name.sizeof);
	}
	if (textToPrint == null) {
		textToPrint = getTextBlock("MSG_SYS_GOODS_USE_NG");
	}
	if (itemIsUsable && (battleActionTable[itemData[item].battleAction].func != null)) {
		currentAttacker = &battlersTable[0];
		battleInitPlayerStats(character, currentAttacker);
		currentAttacker.currentActionArgument = item;
		currentAttacker.actionItemSlot = cast(ubyte)slot;
		displayText(textToPrint);
		setCItem(item);
		currentTarget = &battlersTable[1];
		if (target == 0) {
			for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
				setBattleTargetName(&partyCharacters[gameState.partyMembers[i] - 1].name[0], PartyCharacter.name.sizeof);
				battleInitPlayerStats(gameState.partyMembers[i], currentTarget);
				battleActionTable[itemData[item].battleAction].func();
				for (short j = 0; 7 > j; j++) {
					partyCharacters[i].afflictions[j] = currentTarget.afflictions[j];
				}
			}
		} else {
			battleInitPlayerStats(target, currentTarget);
			battleActionTable[itemData[item].battleAction].func();
			for (short j = 0; PartyCharacter.afflictions.length > j; j++) {
				partyCharacters[target - 1].afflictions[j] = currentTarget.afflictions[j];
			}
		}
		unknownC3EE4D();
	} else {
		displayText(textToPrint);
	}
	closeWindow(Window.textStandard);
	return 1;
}

/// $C1B5B6
short overworldPSIMenu() {
	ubyte psiTarget;
	ubyte psiSelected = 0xFF;
	ubyte psiUser;
	short x27 = 0;
	onlyOneCharacterWithPSI = 0;
	do {
		if (getPartyMemberCountWithPSI() == 1) {
			if (psiSelected == 0) {
				goto end;
			}
			psiUser = gameState.partyMembers[getFirstPartyMemberWithPSI() - 1];
			createOverworldPSIMenuWindow(psiUser);
			onlyOneCharacterWithPSI = 1;
		} else {
			openEquipSelectWindow(0);
			psiUser = cast(ubyte)charSelectPrompt(0, 1, &createOverworldPSIMenuWindow, &psiMenuValidCharacter);
			closeEquipSelectWindow();
		}
		overworldSelectedPSIUser = psiUser;
		if (psiUser == 0) {
			goto end;
		}
		psiSelected = 0xFF;
		do {
			setWindowFocus(Window.textStandard);
			if (psiSelected != 0xFF) {
				unknownC1CA72(psiSelected, TextPalette.normal);
				printMenuItems();
			}
			unknownC11F5A(&unknownC1C8BC);
			psiSelected = cast(ubyte)selectionMenu(1);
			unknownC11F8A();
			if (psiSelected != 0) {
				if (onlyOneCharacterWithPSI == 0) {
					unknownC1CA72(psiSelected, TextPalette.highlighted);
				}
				if (battleActionTable[psiAbilityTable[psiSelected].battleAction].ppCost > partyCharacters[psiUser - 1].pp.current.integer) {
					createWindow(Window.textBattle);
					displayText(getTextBlock("MSG_BTL_PSI_CANNOT_MENU"));
					closeFocusWindow();
					psiTarget = 0;
				} else {
					if (psiAbilityTable[psiSelected].category == PSICategory.other) {
						if ((gameState.partyNPCs[0] != PartyMember.dungeonMan) && (gameState.partyNPCs[1] != PartyMember.dungeonMan) && (getEventFlag(EventFlag.sysDistlpt) == 0) && (gameState.walkingStyle != WalkingStyle.ladder) && (gameState.walkingStyle != WalkingStyle.rope) && (gameState.walkingStyle != WalkingStyle.escalator) && (gameState.walkingStyle != WalkingStyle.stairs) && ((loadSectorAttributes(gameState.leaderX.integer, gameState.leaderY.integer) & MapSectorConfig.cannotTeleport) == 0)) {
							psiTarget = cast(ubyte)selectPSITeleportDestination();
						} else {
							createWindow(Window.textBattle);
							displayText(getTextBlock("MSG_SYS_TLPT_NG"));
							closeFocusWindow();
							psiTarget = 0;
						}
					} else {
						psiTarget = cast(ubyte)determineTargetting(psiAbilityTable[psiSelected].battleAction, psiUser);
					}
				}
			} else {
				psiTarget = 1;
			}
		} while (psiTarget == 0);
		closeWindow(Window.targettingDescription);
	} while (psiSelected == 0);
	unknownC3ED2C(psiUser, battleActionTable[psiAbilityTable[psiSelected].battleAction].ppCost, 1);
	if (psiAbilityTable[psiSelected].category == PSICategory.other) {
		setTeleportState(psiTarget, cast(PSITeleportStyle)psiAbilityTable[psiSelected].level);
	} else {
		currentAttacker = &battlersTable[0];
		battleInitPlayerStats(psiUser, currentAttacker);
		setBattleAttackerName(&partyCharacters[psiUser - 1].name[0], PartyCharacter.name.length);
		if (psiTarget != 0xFF) {
			setBattleTargetName(&partyCharacters[psiTarget - 1].name[0], PartyCharacter.name.length);
		}
		setCItem(psiSelected);
		createWindow(Window.textStandard);
		displayText(getTextBlock(battleActionTable[psiAbilityTable[psiSelected].battleAction].text));
	}
	if (battleActionTable[psiAbilityTable[psiSelected].battleAction].func !is null) {
		currentTarget = &battlersTable[1];
		if (psiTarget == 0xFF) {
			for (short i = 0; gameState.playerControlledPartyMemberCount > i; i++) {
				setBattleTargetName(&partyCharacters[gameState.partyMembers[i] - 1].name[0], PartyCharacter.name.length);
				battleInitPlayerStats(gameState.partyMembers[i], &battlersTable[1]);
				battleActionTable[psiAbilityTable[psiSelected].battleAction].func();
				for (short j = 0; PartyCharacter.afflictions.length > j; j++) {
					version(bugfix) {
						partyCharacters[gameState.partyMembers[i] - 1].afflictions[j] = currentTarget.afflictions[j];
					} else {
						partyCharacters[i].afflictions[j] = currentTarget.afflictions[j];
					}
				}
			}
		} else {
			battleInitPlayerStats(psiTarget, currentTarget);
			battleActionTable[psiAbilityTable[psiSelected].battleAction].func();
			for (short i = 0; PartyCharacter.afflictions.length > i; i++) {
				partyCharacters[psiTarget - 1].afflictions[i] = currentTarget.afflictions[i];
			}
		}
		unknownC3EE4D();
	}
	x27 = 1;
	end:
	closeWindow(Window.textStandard);
	return x27;
}

/// $C1BB06
void unknownC1BB06(short psi) {
	if ((lastSelectedPSIDescription == 0xFF) || (psi != lastSelectedPSIDescription)) {
		unknownC1C8BC(psi);
		createWindow(Window.unknown2f);
		windowTickWithoutInstantPrinting();
		lastSelectedPSIDescription = psi;
		displayText(getTextBlock(psiAbilityTable[psi].text));
		clearInstantPrinting();
	}
}

/// $C1BB71
void unknownC1BB71() {
	short selected;
	while (true) {
		forceLeftTextAlignment = 1;
		SelectCharacter:
		short selectedCharacter = charSelectPrompt(0, 1, &unknownC1952F, null);
		// no character chosen, exit
		if (selectedCharacter == 0) {
			break;
		}
		// Jeff has no PSI
		if (selectedCharacter == PartyMember.jeff) {
			continue;
		}
		bool menuItemsPrinted = false;
		createWindow(Window.unknown2e);
		// print PSI categories
		for (short i = 0; i < psiCategories.length; i++) {
			createNewMenuOptionWithUserdata(cast(short)(i + 1), &psiCategories[i][0], null);
		}
		printMenuOptionTable(1, 0, 0);
		while (true) {
			setWindowFocus(Window.unknown2e);
			// make sure menu items get printed, and only do it once
			if (!menuItemsPrinted) {
				printMenuItems();
				windowTickWithoutInstantPrinting();
				menuItemsPrinted = true;
			}
			createWindow(Window.statusMenu);
			currentFocusWindow = Window.unknown2e;
			forceLeftTextAlignment = 0;
			unknownC11F5A(&prepareBattlePSIMenuOptions);
			selected = selectionMenu(1);
			unknownC11F8A();
			if (selected == 0) {
				break;
			}
			if (unknownC12BD5(1) == 0) {
				continue;
			}
			setWindowFocus(Window.textStandard);
			lastSelectedPSIDescription = 0xFF;
			unknownC11F5A(&unknownC1BB06);
			while (selectionMenu(1) != 0) {}
			unknownC11F8A();
			closeWindow(Window.targettingDescription);
			closeWindow(Window.unknown2f);
			lastSelectedPSIDescription = 0xFF;
		}
		closeWindow(Window.unknown2e);
		closeWindow(Window.textStandard);
		currentFocusWindow = Window.statusMenu;
		forceLeftTextAlignment = 1;
		if (selected == 0) {
			goto SelectCharacter;
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
	removeNonTransitionSurvivingInteractions();
	playSfx(getScreenTransitionSoundEffect(warpPresetTable[arg1].screenTransition, 1));
	if (disabledTransitions != 0) {
		fadeOut(1, 1);
	} else {
		screenTransition(warpPresetTable[arg1].screenTransition, 1);
	}
	loadMapAtPosition(cast(short)(warpPresetTable[arg1].x * 8), cast(short)(warpPresetTable[arg1].y * 8));
	playerHasMovedSinceMapLoad = 0;
	setLeaderPosition(cast(short)(warpPresetTable[arg1].x * 8), cast(short)(warpPresetTable[arg1].y * 8), cast(short)((warpPresetTable[arg1].direction & 0x7F) - 1));
	if ((warpPresetTable[arg1].direction & 0x80) != 0) {
		unknownC052D4(cast(short)((warpPresetTable[arg1].direction & 0x7F) - 1));
	}
	loadSectorMusic(cast(short)(warpPresetTable[arg1].x * 8), cast(short)(warpPresetTable[arg1].y * 8));
	changeMapMusic();
	if (postTeleportCallback !is null) {
		postTeleportCallback();
		postTeleportCallback = null;
	}
	processEntityCreationRequests();
	playSfx(getScreenTransitionSoundEffect(warpPresetTable[arg1].screenTransition, 0));
	if (disabledTransitions != 0) {
		fadeIn(1, 1);
	} else {
		screenTransition(warpPresetTable[arg1].screenTransition, 0);
	}
	stairsDirection = -1;
	overworldStatusSuppression = x16;
}

/// $C1BE4D
short attemptHomesickness() {
	if (partyCharacters[0].afflictions[0] != Status0.unconscious) {
		// there are different homesickness probabilities for every 15 levels
		// at least in theory. in practice, the probabilities are almost all identical due to an oversight
		// actual probabilities are close to [ 0, 3/256, 2/256, 2/256, 2/256, 0 ]
		short targetLevel = 15;
		for (short tier = 0; 6 > tier; tier++, targetLevel += 15) {
			if (partyCharacters[0].level <= targetLevel) {
				if ((homesicknessProbabilities[tier] != 0) && (randMod(homesicknessProbabilities[tier]) == 0)) {
					return inflictStatusNonBattle(1, 5 + 1, Status5.homesick + 1);
				}
				return 0;
			}
		}
	}
	return 0;
}

/// $C1BEC6
void getOffBicycleWithText() {
	createWindow(Window.textStandard);
	setMainRegister(MainRegister(1));
	displayText(getTextBlock("MSG_SYS_BICYCLE_OFF"));
	closeFocusWindow();
	windowTick();
	getOffBicycle();
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
			setOverworldStatusSuppression(1);
			break;
		case 6:
			setOverworldStatusSuppression(getEventFlag(EventFlag.winGiegu));
			break;
		case 7:
			return displayTownMap();
		case 8:
			return attackerIsEnemy();
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
				getOffBicycle();
				return 1;
			}
			return 0;
		default: break;
	}
	return 0;
}

/** Checks whether or not the specified party member has any statuses that block the use of PSI
 * Returns: 0 if the party member has some PSI-blocking status effect, 1 otherwise
 * Params:
 * 	character = The party member ID to check
 * Original_Address: $(DOLLAR)C1C165
 */
short checkCharacterCanUsePSIStatus(short character) {
	ubyte* currentStatus = &partyCharacters[character - 1].afflictions[0];
	for (short statusGroup = 0; statusGroup < 7; statusGroup++, currentStatus++) {
		if (currentStatus[0] == 0) {
			continue;
		}
		if (psiBlockingStatuses[statusGroup][currentStatus[0] - 1] != 0) {
			return 0;
		}
		return 1;
	}
	return 1;
}

/** Test whether or not a character knows any PSI of a particular type
 * Returns: 1 if the character knows any matching PSI
 * Params:
 * 	character = The character whose PSI is being checked
 * 	usability = Where the PSI can be used (bitmask, see earthbound.commondefs.PSIUsability)
 * 	categories = PSI categories to match (bitmask, see earthbound.commondefs.PSICategory)
 * Original_Address: $(DOLLAR)C1C1BA
 */
short characterKnowsPSITypes(short character, ushort usability, ushort categories) {
	if (character == PartyMember.jeff) {
		return 0;
	}
	short adjustedCharacter = cast(short)(character - 1);
	// normal learned PSI
	for (short i = PSI.rockinAlpha; psiAbilityTable[i].name != 0; i++) {
		ubyte targetLevel = 0;
		switch (adjustedCharacter) {
			case PartyMember.ness - 1:
				targetLevel = psiAbilityTable[i].nessLevel;
				break;
			case PartyMember.paula - 1:
				targetLevel = psiAbilityTable[i].paulaLevel;
				break;
			case PartyMember.poo - 1:
				targetLevel = psiAbilityTable[i].pooLevel;
				break;
			default: break;
		}
		if ((targetLevel != 0) && ((psiAbilityTable[i].usability & usability) != 0) && (targetLevel <= partyCharacters[adjustedCharacter].level)) {
			if ((psiAbilityTable[i].category & categories) != 0) {
				return 1;
			}
		}
	}
	// Ness's teleport alpha
	if ((adjustedCharacter == PartyMember.ness - 1) && ((usability & PSIUsability.overworld) != 0) && ((gameState.partyPSI & PartyPSIFlags.teleportAlpha) != 0) && ((categories & PSICategory.other) != 0)) {
		return 1;
	}
	// Poo's starstorm alpha and beta
	if ((adjustedCharacter == PartyMember.poo - 1) && ((usability & PSIUsability.battle) != 0) && ((gameState.partyPSI & (PartyPSIFlags.starstormAlpha | PartyPSIFlags.starstormBeta)) != 0) && ((categories & PSICategory.offense) != 0)) {
		return 1;
	}
	return 0;
}

/** Determine whether or not the specified character can currently use a specific category of PSI
 * Returns: 1 if the character isn't Jeff, doesn't have any statuses blocking PSI usage, and knows any appropriate PSI. 0 otherwise
 * Params:
 * 	character = The character ID being checked
 * 	usability = Where the PSI can be used (bitmask, see earthbound.commondefs.PSIUsability)
 * 	categories = The PSI categories to check for (bitmask, see earthbound.commondefs.PSICategory)
 * Original_Address: $(DOLLAR)C1C32A
 */
short checkCharacterCanCurrentlyUsePSITypes(short character, short usability, short categories) {
	short result = 0;
	if ((character != PartyMember.jeff) && (checkCharacterCanUsePSIStatus(character) != 0) && (characterKnowsPSITypes(character, usability, categories) != 0)) {
		result = 1;
	}
	return result;
}

/** Determine whether or not the specified character can use PSI
 * Returns: 1 if party member can use PSI, 0 otherwise
 * Params:
 * 	character = The character ID to check
 * Original_Address: $(DOLLAR)C1C367
 */
short psiMenuValidCharacter(short character) {
	return checkCharacterCanCurrentlyUsePSITypes(character, PSIUsability.overworld, PSICategory.all);
}

/** Get the ID of the first party member capable of using PSI
 * Returns: Either the ID of the first party member that can use PSI or 0 if none were found
 * Original_Address: $(DOLLAR)C1C373
 */
short getFirstPartyMemberWithPSI() {
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if (checkCharacterCanCurrentlyUsePSITypes(gameState.partyMembers[i], PSIUsability.overworld, PSICategory.all) != 0) {
			return cast(short)(i + 1);
		}
	}
	return 0;
}

/** Get number of party members capable of using PSI
 * Original_Address: $(DOLLAR)C1C3B6
 */
short getPartyMemberCountWithPSI() {
	short count = 0;
	for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
		if (checkCharacterCanCurrentlyUsePSITypes(gameState.partyMembers[i], PSIUsability.overworld, PSICategory.all) != 0) {
			count++;
		}
	}
	return count;
}

/** Prints a PSIID's name
 * Params:
 * 	id = The ID of a PSI name to print (see earthbound.commondefs.PSIID for values)
 * Original_Address: $(DOLLAR)C1C403
 */
void getPSIName(short id) {
	const(ubyte)* text;
	// PSI favouritething is special
	if (id == 1) {
		text = &gameState.favouriteThing[0];
	} else {
		text = &psiNameTable[id - 1][0];
	}
	printStringAutoNewline(-1, text);
}

/** Prepares a selectable menu of PSI for the specified category
 * Params:
 * 	character = The character whose PSI will be listed
 * 	usability = Whether to select from overworld or battle PSI (bitmask, see earthbound.commondefs.PSIUsability for values)
 * 	categories = The categories that should populate the menu (bitmask, see earthbound.commondefs.PSICategory for values)
 * Original_Address: $(DOLLAR)C1C452
 */
void preparePSIMenuOptions(short character, ubyte usability, ubyte categories) {
	character--;
	setInstantPrinting();
	resetCurrentWindowMenu();
	short nameLastPrinted = 0; //note: all PSI with the same name MUST be adjacent to each other for this to work properly
	if ((character == PartyMember.poo - 1) && ((usability & PSIUsability.battle) != 0) && ((categories & PSICategory.offense) != 0)) {
		// Poo can use starstorm alpha?
		if ((gameState.partyPSI & PartyPSIFlags.starstormAlpha) != 0) {
			moveCurrentTextCursor(0, psiAbilityTable[PSI.starstormAlpha].menuY);
			getPSIName(psiAbilityTable[PSI.starstormAlpha].name);
			createNewMenuOptionAtPositionWithUserdata(PSI.starstormAlpha, psiAbilityTable[PSI.starstormAlpha].menuX, psiAbilityTable[PSI.starstormAlpha].menuY, &psiSuffixes[psiAbilityTable[PSI.starstormAlpha].level - 1][0], null);
		}
		// Poo can use starstorm omega?
		if ((gameState.partyPSI & PartyPSIFlags.starstormBeta) != 0) {
			createNewMenuOptionAtPositionWithUserdata(PSI.starstormOmega, psiAbilityTable[PSI.starstormOmega].menuX, psiAbilityTable[PSI.starstormOmega].menuY, &psiSuffixes[psiAbilityTable[PSI.starstormOmega].level - 1][0], null);
		}
	}
	// handle normal learnable PSI
	for (short i = PSI.rockinAlpha; psiAbilityTable[i].name != 0; i++) {
		ubyte targetLevel;
		switch (character) {
			case PartyMember.ness - 1:
				targetLevel = psiAbilityTable[i].nessLevel;
				break;
			case PartyMember.paula - 1:
				targetLevel = psiAbilityTable[i].paulaLevel;
				break;
			case PartyMember.poo - 1:
				targetLevel = psiAbilityTable[i].pooLevel;
				break;
			default: break;
		}
		if (targetLevel == 0) {
			continue;
		}
		if ((psiAbilityTable[i].usability & usability) == 0) {
			continue;
		}
		if (targetLevel > partyCharacters[character].level) {
			continue;
		}
		if ((psiAbilityTable[i].category & categories) == 0) {
			continue;
		}
		if (psiAbilityTable[i].name != nameLastPrinted) {
			moveCurrentTextCursor(0, psiAbilityTable[i].menuY);
			getPSIName(psiAbilityTable[i].name);
			nameLastPrinted = psiAbilityTable[i].name;
		}
		createNewMenuOptionAtPositionWithUserdata(i, psiAbilityTable[i].menuX, psiAbilityTable[i].menuY, &psiSuffixes[psiAbilityTable[i].level - 1][0], null);
	}
	if ((character == PartyMember.ness - 1) && ((usability & PSIUsability.overworld) != 0) && ((categories & PSICategory.other) != 0)) {
		// Ness can use teleport alpha?
		if ((gameState.partyPSI & PartyPSIFlags.teleportAlpha) != 0) {
			moveCurrentTextCursor(0, psiAbilityTable[PSI.teleportAlpha].menuY);
			getPSIName(psiAbilityTable[PSI.teleportAlpha].name);
			createNewMenuOptionAtPositionWithUserdata(PSI.teleportAlpha, psiAbilityTable[PSI.teleportAlpha].menuX, psiAbilityTable[PSI.teleportAlpha].menuY, &psiSuffixes[psiAbilityTable[PSI.teleportAlpha].level - 1][0], null);
		}
		// Ness can use teleport beta?
		if ((gameState.partyPSI & PartyPSIFlags.teleportBeta) != 0) {
			createNewMenuOptionAtPositionWithUserdata(PSI.teleportBeta, psiAbilityTable[PSI.teleportBeta].menuX, psiAbilityTable[PSI.teleportBeta].menuY, &psiSuffixes[psiAbilityTable[PSI.teleportBeta].level - 1][0], null);
		}
	}
	printMenuItems();
	clearInstantPrinting();
}

/// $C1C853
void createOverworldPSIMenuWindow(short character) {
	createWindow(Window.textStandard);
	windowTickWithoutInstantPrinting();
	if (gameState.playerControlledPartyMemberCount != 1) {
		paginationWindow = Window.textStandard;
	}
	setWindowTitle(1, PartyCharacter.name.length, &partyCharacters[character - 1].name[0]);
	preparePSIMenuOptions(character, PSIUsability.overworld, PSICategory.all);
}

/// $C1C8BC
void unknownC1C8BC(short psi) {
	const(ubyte)* x06;
	createWindow(Window.targettingDescription);
	windowTickWithoutInstantPrinting();
	enableWordWrap = 0;
	if (psiAbilityTable[psi].name == 4) {
		x06 = &psiTargetText[0][0][0];
	} else {
		x06 = &psiTargetText[battleActionTable[psiAbilityTable[psi].battleAction].direction][battleActionTable[psiAbilityTable[psi].battleAction].target][0];
	}
	printString(psiTargetText[0][0].length, x06);
	enableWordWrap = 0xFF;
	moveCurrentTextCursor(0, 1);
	printString(ppCostText.length, &ppCostText[0]);
	printLetterVWF(ebChar(' '));
	setCurrentWindowPadding(0x81);
	forcePixelAlignment(0x28, 0x1);
	printNumber(battleActionTable[psiAbilityTable[psi].battleAction].ppCost);
	clearInstantPrinting();
}

/// $C1CA06
void printPSIName(short id) {
	getPSIName(psiAbilityTable[id].name);
	printStringAutoNewline(-1, &psiSuffixes[psiAbilityTable[id].level - 1][0]);
}

/// $C1CA72
void unknownC1CA72(short psi, short palette) {
	setInstantPrinting();
	short x0E = windowStats[windowTable[currentFocusWindow]].textY;
	removeWindowFromScreen(currentFocusWindow);
	windowTickWithoutInstantPrinting();
	createOverworldPSIMenuWindow(overworldSelectedPSIUser);
	printMenuItems();
	windowStats[windowTable[currentFocusWindow]].textY = x0E;
	moveCurrentTextCursor(0, getTextY());
	windowSetTextColor(palette);
	getPSIName(psiAbilityTable[psi].name);
	windowSetTextColor(TextPalette.normal);
	clearInstantPrinting();
}

/** Prepares the menu options for selecting specific PSI abilities in battle PSI menus
 * Original_Address: $(DOLLAR)C1CAF5
 */
void prepareBattlePSIMenuOptions(short category) {
	short character = gameState.partyMembers[battleMenuCurrentCharacterID];
	createWindow(Window.textStandard);
	windowTickWithoutInstantPrinting();
	switch (category) {
		case 1:
			preparePSIMenuOptions(character, PSIUsability.battle, PSICategory.offense);
			break;
		case 2:
			preparePSIMenuOptions(character, PSIUsability.battle, PSICategory.recover);
			break;
		case 3:
			preparePSIMenuOptions(character, PSIUsability.battle, PSICategory.assist);
			break;
		case 4:
			preparePSIMenuOptions(character, PSIUsability.overworld | PSIUsability.battle, PSICategory.other);
			break;
		default: break;
	}
}

/** Checks if the character knows any battle PSI in a particular category
 * Returns: 1 if any appropriate PSI is known, 0 otherwise
 * Original_Address: $(DOLLAR)C1CB7F
 */
short characterKnowsAnyBattlePSIByType(short category, short character) {
	short result = void;
	switch (category) {
		case 1:
			result = characterKnowsPSITypes(character, PSIUsability.battle, PSICategory.offense);
			break;
		case 2:
			result = characterKnowsPSITypes(character, PSIUsability.battle, PSICategory.recover);
			break;
		case 3:
			result = characterKnowsPSITypes(character, PSIUsability.battle, PSICategory.assist);
			break;
		default: break;
	}
	return result;
}

/// $C1CBCD
short battlePSIMenu(BattleMenuSelection* arg1) {
	short psiCategoriesPrinted = 0;
	short selectedPSICategory;
	short psiTargetting;
	outer: while (true) {
		createWindow(Window.psiCategories);
		for (short i = 0; i < 3; i++) {
			createNewMenuOptionWithUserdata(cast(short)(i + 1), &psiCategories[i][0], null);
		}
		printMenuOptionTable(1, 0, 0);
		while (true) { // pick a PSI category
			setWindowFocus(Window.psiCategories);
			if (psiCategoriesPrinted == 0) {
				printMenuItems();
			}
			psiCategoriesPrinted++; //will cause a minor visual glitch after entering and exiting a category menu 65536 times
			unknownC11F5A(&prepareBattlePSIMenuOptions);
			selectedPSICategory = selectionMenu(1);
			unknownC11F8A();
			if (selectedPSICategory == 0) {
				break outer;
			}
			if (characterKnowsAnyBattlePSIByType(selectedPSICategory, arg1.user) == 0) {
				continue;
			}
			short selectedPSI;
			while (true) { // pick a PSI ability
				createWindow(Window.textStandard);
				prepareBattlePSIMenuOptions(selectedPSICategory);
				unknownC11F5A(&unknownC1C8BC);
				selectedPSI = selectionMenu(1);
				unknownC11F8A();
				if (selectedPSI == 0) {
					break;
				}
				// does user have enough PP?
				if (battleActionTable[psiAbilityTable[selectedPSI].battleAction].ppCost > partyCharacters[arg1.user - 1].pp.target) {
					createWindow(Window.textBattle);
					setTextPromptMode(TextPromptMode.fast2);
					displayText(getTextBlock("MSG_BTL_PSI_CANNOT_MENU"));
					setTextPromptModeDefault();
					closeFocusWindow();
					psiTargetting = 0;
					goto Unknown15;
				}
				// figure out targetting
				if ((battleActionTable[psiAbilityTable[selectedPSI].battleAction].target == ActionTarget.one) || (battleActionTable[psiAbilityTable[selectedPSI].battleAction].target == ActionTarget.row)) {
					if (battleActionTable[psiAbilityTable[selectedPSI].battleAction].direction == ActionDirection.enemy) {
						closeWindow(Window.psiCategories);
						closeWindow(Window.targettingDescription);
						closeWindow(Window.textStandard);
						// create a window with the PSI name highlighted
						createWindow(Window.itemPSINameWhileTargetting);
						setInstantPrinting();
						windowSetTextColor(TextPalette.highlighted);
						printPSIName(selectedPSI);
						windowSetTextColor(TextPalette.normal);
					}
				}
				psiTargetting = determineTargetting(psiAbilityTable[selectedPSI].battleAction, arg1.user);
				if (battleActionTable[psiAbilityTable[selectedPSI].battleAction].direction == ActionDirection.enemy) {
					closeWindow(Window.itemPSINameWhileTargetting);
				} else {
					closeWindow(Window.psiCategories);
					closeWindow(Window.targettingDescription);
					closeWindow(Window.textStandard);
				}
				if (psiTargetting != 0) {
					goto Unknown15;
				}
			}
			psiTargetting = 1;
			Unknown15:
			if (psiTargetting == 0) {
				continue;
			}
			closeWindow(Window.targettingDescription);
			if (selectedPSI == 0) {
				break;
			}
			arg1.param1 = cast(ubyte)selectedPSI;
			arg1.selectedAction = psiAbilityTable[selectedPSI].battleAction;
			arg1.targetting = cast(ubyte)(psiTargetting >> 8);
			arg1.selectedTarget = cast(ubyte)psiTargetting;
			selectedPSICategory = 1;
			break outer;
		}
	}
	closeWindow(Window.textStandard);
	closeWindow(Window.psiCategories);
	return selectedPSICategory;
}

/// $C1CE85
short battleSelectItemTargetting(BattleMenuSelection* arg1) {
	short targetting = 0xFF;
	arg1.selectedAction = BattleActions.action002;
	arg1.targetting = 1;
	arg1.selectedTarget = arg1.user;
	const(Item)* item = &itemData[getCharacterItem(arg1.user, arg1.param1)];
	short type = item.type;
	switch (type & 0x30) {
		case 0x10:
		case 0x20:
			targetting = determineTargetting(item.battleAction, arg1.user);
			if (targetting == 0) {
				return 0;
			}
			arg1.selectedAction = item.battleAction;
			arg1.targetting = cast(ubyte)(targetting >> 8);
			arg1.selectedTarget = cast(ubyte)targetting;
			break;
		case 0x30:
			if (((type & 0xC) == 0) || ((type & 0xC) == 4)) {
				if ((item.flags & itemUsableFlags[arg1.user - 1]) != 0) {
					targetting = determineTargetting(item.battleAction, arg1.user);
					if (targetting == 0) {
						return 0;
					}
					arg1.selectedAction = item.battleAction;
					arg1.targetting = cast(ubyte)(targetting >> 8);
					arg1.selectedTarget = cast(ubyte)targetting;
				} else {
					arg1.selectedAction = 3;
				}
			}
			break;
		default: break;
	}
	return targetting;
}

/// $C1CFC6
short battleSelectItem(BattleMenuSelection* arg1) {
	short targetting = 0;
	if (partyCharacters[arg1.user - 1].items[0] != 0) {
		while (true) {
			createWindow(Window.inventory);
			addCharacterInventoryToWindow(arg1.user, Window.inventory);
			short selectedItem = selectionMenu(1);
			setInstantPrinting();
			closeFocusWindow();
			if (selectedItem == 0) {
				break;
			}
			arg1.param1 = cast(ubyte)selectedItem;
			targetting = battleSelectItemTargetting(arg1);
			closeWindow(Window.itemPSINameWhileTargetting); // yes, the window is closed even though it wasn't opened in earthbound
			if (targetting != 0) {
				break;
			}
		}
	}
	return targetting;
}

/** Gets the fixed version of an item, if one exists
 * Params:
 * 	item = Item to fix
 * Returns: Fixed item id, or 0 if nonexistant
 * Original_Address: $(DOLLAR)C1D038
 */
short getFixedVersionOfItem(short item) {
	// is item fixable?
	if (itemData[item].type == 8) {
		return itemData[item].parameters.ep;
	}
	return 0;
}

/** Calculates stat gain for a player character using its growth rate and current stats
 * Params:
 * 	currentLevel = The character's current level, not the new level
 * 	growthRate = The stat's growth rate, in units of level/10
 * 	currentStat = The character's current stat value
 * Returns: Amount to add to stat (may be negative)
 * Original_Address: $(DOLLAR)C1D08B
 */
short calculateStatGain(short currentLevel, short growthRate, short currentStat) {
	short differenceFromExpected = cast(short)((currentLevel * growthRate) - ((currentStat - 2) * 10));
	short randomStatAdd = (differenceFromExpected <= 0) ? 0 : randMod(3);
	return cast(short)(((statGrowthDifferenceFactor[(currentLevel + 1) % $] + randomStatAdd - 1) * differenceFromExpected) / 50);
}

/// $C1D109
void levelUpChar(short character, short printMessages) {
	character--;
	short oldLevel = partyCharacters[character].level;
	partyCharacters[character].level++;
	// print gained a level message
	if (printMessages != 0) {
		setTextPromptMode(TextPromptMode.fast1);
		setBattleTargetName(&partyCharacters[character].name[0], 5);
		setCNum(partyCharacters[character].level);
		displayText(getTextBlock("MSG_BTL_LEVEL_UP"));
		setTextPromptMode(TextPromptMode.fast2);
	}
	// gain offense
	short offenseGained = calculateStatGain(oldLevel, statsGrowthVars[printMessages].offense, partyCharacters[character].baseOffense);
	if (offenseGained > 0) {
		partyCharacters[character].baseOffense += offenseGained;
		recalcCharacterPostmathOffense(cast(short)(character + 1));
		if (printMessages != 0) {
			setCNum(offenseGained);
			displayText(getTextBlock("MSG_BTL_LV_OFFENSE_UP"));
		}
	}
	// gain defense
	short defenseGained = calculateStatGain(oldLevel, statsGrowthVars[printMessages].defense, partyCharacters[character].baseDefense);
	if (defenseGained > 0) {
		partyCharacters[character].baseDefense += defenseGained;
		recalcCharacterPostmathDefense(cast(short)(character + 1));
		if (printMessages != 0) {
			setCNum(defenseGained);
			displayText(getTextBlock("MSG_BTL_LV_DEFENSE_UP"));
		}
	}
	// gain speed
	short speedGained = calculateStatGain(oldLevel, statsGrowthVars[printMessages].speed, partyCharacters[character].baseSpeed);
	if (speedGained > 0) {
		partyCharacters[character].baseSpeed += speedGained;
		recalcCharacterPostmathSpeed(cast(short)(character + 1));
		if (printMessages != 0) {
			setCNum(speedGained);
			displayText(getTextBlock("MSG_BTL_LV_SPEED_UP"));
		}
	}
	// gain guts
	short gutsGained = calculateStatGain(oldLevel, statsGrowthVars[printMessages].guts, partyCharacters[character].baseGuts);
	if (gutsGained > 0) {
		partyCharacters[character].baseGuts += gutsGained;
		recalcCharacterPostmathGuts(cast(short)(character + 1));
		if (printMessages != 0) {
			setCNum(gutsGained);
			displayText(getTextBlock("MSG_BTL_LV_GUTS_UP"));
		}
	}
	// gain vitality
	short vitalityGained;
	if (10 > oldLevel) {
		// vitality growth rate x5 at levels <= 10, without any random increases
		vitalityGained = cast(short)(((statsGrowthVars[character].vitality * oldLevel) - (partyCharacters[character].baseVitality - 2) * 10) / 10);
	} else {
		vitalityGained = calculateStatGain(oldLevel, statsGrowthVars[character].vitality, partyCharacters[character].baseVitality);
	}
	if (vitalityGained > 0) {
		partyCharacters[character].baseVitality += vitalityGained;
		recalcCharacterPostmathVitality(cast(short)(character + 1));
		if (printMessages != 0) {
			setCNum(vitalityGained);
			displayText(getTextBlock("MSG_BTL_LV_VITA_UP"));
		}
	}
	// gain IQ
	short iqGained;
	if (10 > oldLevel) {
		// IQ growth rate x5 at levels <= 10, without any random increases
		iqGained = cast(short)(((statsGrowthVars[character].iq * oldLevel) - (partyCharacters[character].baseIQ - 2) * 10) / 10);
	} else {
		iqGained = calculateStatGain(oldLevel, statsGrowthVars[character].iq, partyCharacters[character].baseIQ);
	}
	if (iqGained > 0) {
		partyCharacters[character].baseIQ += iqGained;
		recalcCharacterPostmathIQ(cast(short)(character + 1));
		if (printMessages != 0) {
			setCNum(iqGained);
			displayText(getTextBlock("MSG_BTL_LV_IQ_UP"));
		}
	}
	// gain luck
	short luckGained = calculateStatGain(oldLevel, statsGrowthVars[printMessages].luck, partyCharacters[character].baseLuck);
	if (luckGained > 0) {
		partyCharacters[character].baseLuck += luckGained;
		recalcCharacterPostmathLuck(cast(short)(character + 1));
		if (printMessages != 0) {
			setCNum(luckGained);
			displayText(getTextBlock("MSG_BTL_LV_LUCK_UP"));
		}
	}
	// gain HP
	// expected HP = vitality * 15
	// if >=, add 1-3 HP. otherwise add the difference
	short expectedHPDifference = cast(short)(partyCharacters[character].vitality * 15 - partyCharacters[character].maxHP);
	short hpGained = (expectedHPDifference > 1) ? expectedHPDifference : cast(short)(randMod(2) + 1);
	partyCharacters[character].maxHP += hpGained;
	partyCharacters[character].hp.target += hpGained;
	if (printMessages != 0) {
		setCNum(hpGained);
		displayText(getTextBlock("MSG_BTL_LV_MAXHP_UP"));
	}
	// gain PP, learn PSI (unless it's jeff)
	if (character != PartyMember.jeff - 1) {
		// expected PP = IQ * 5 (doubled for Ness post-Magicant)
		// if >=, add 0-2 PP. otherwise add the difference
		short expectedPP = ((character == 0) && (getEventFlag(EventFlag.winOscar) != 0)) ? partyCharacters[character].iq * 2 : partyCharacters[character].iq;
		short ppGained = cast(short)(expectedPP * 5 - partyCharacters[character].maxPP);
		ppGained = (ppGained > 1) ? ppGained : (randMod(2));
		if (ppGained != 0) {
			partyCharacters[character].maxPP += ppGained;
			partyCharacters[character].pp.target += ppGained;
			if (printMessages != 0) {
				setCNum(ppGained);
				displayText(getTextBlock("MSG_BTL_LV_MAXPP_UP"));
			}
		}
		if (printMessages != 0) {
			short psiLearnedLevel = cast(short)(oldLevel + 1);
			switch (character) {
				case PartyMember.ness - 1:
					for (short i = 1; psiAbilityTable[i].name != 0; i++) {
						if (psiAbilityTable[i].nessLevel == psiLearnedLevel) {
							setCItem(i);
							displayText(getTextBlock("MSG_BTL_LEARN_PSI"));
						}
					}
					break;
				case PartyMember.paula - 1:
					for (short i = 1; psiAbilityTable[i].name != 0; i++) {
						if (psiAbilityTable[i].paulaLevel == psiLearnedLevel) {
							setCItem(i);
							displayText(getTextBlock("MSG_BTL_LEARN_PSI"));
						}
					}
					break;
				case PartyMember.poo - 1:
					for (short i = 1; psiAbilityTable[i].name != 0; i++) {
						if (psiAbilityTable[i].pooLevel == psiLearnedLevel) {
							setCItem(i);
							displayText(getTextBlock("MSG_BTL_LEARN_PSI"));
						}
					}
					break;
				default: break;
			}
		}
	}
	if (printMessages != 0) {
		setTextPromptModeDefault();
	}
}

/// $C1D9E9
void gainEXP(short character, short printMessages, uint exp) {
	partyCharacters[character - 1].exp += exp;
	if (partyCharacters[character - 1].level >= 99) {
		return;
	}
	if (expTable[character - 1][partyCharacters[character - 1].level + 1] <= partyCharacters[character - 1].exp) {
		if (printMessages != 0) {
			changeMusic(Music.levelUp);
		}
		while (expTable[character - 1][partyCharacters[character - 1].level + 1] <= partyCharacters[character - 1].exp) {
			levelUpChar(character, printMessages);
			if (partyCharacters[character - 1].level >= 99) {
				return;
			}
		}
	}
}

unittest {
	gainEXP(1, 0, 4);
	assert(partyCharacters[0].level == 2);
	gainEXP(1, 0, 99999999);
	assert(partyCharacters[0].level == 99);
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
	Battler* attackerTemp = currentAttacker;
	battler.side = BattleSide.friends;
	battler.id = cast(ubyte)arg1;
	currentAttacker = &battler;
	freezeEntities();
	createWindow(Window.textStandard);
	setBattleAttackerName(&partyCharacters[arg1 - 1].name[0], 5);
	displayText(getTextBlock("MSG_SYS_MAP_CRITICAL_SITUATION"));
	closeFocusWindow();
	windowTick();
	unfreezeEntities();
	currentAttacker = attackerTemp;
}

/// $C1D8D0
void resetCharLevelOne(short character, short level, short setEXP) {
	tracef("Setting char %s level to %s", character, level);
	partyCharacters[character - 1].level = 1;
	partyCharacters[character - 1].baseOffense = 2;
	partyCharacters[character - 1].baseDefense = 2;
	partyCharacters[character - 1].baseSpeed = 2;
	partyCharacters[character - 1].baseGuts = 2;
	partyCharacters[character - 1].baseLuck = 2;
	partyCharacters[character - 1].baseVitality = 2;
	partyCharacters[character - 1].baseIQ = 2;
	partyCharacters[character - 1].maxHP = 30;
	partyCharacters[character - 1].hp.target = 30;
	partyCharacters[character - 1].hp.current.integer = 30;
	short startingPP;
	if (character != PartyMember.jeff) {
		startingPP = 10;
	} else {
		startingPP = 0;
	}
	partyCharacters[character - 1].maxPP = startingPP;
	partyCharacters[character - 1].pp.target = startingPP;
	partyCharacters[character - 1].pp.current.integer = startingPP;
	recalcCharacterPostmathOffense(character);
	recalcCharacterPostmathDefense(character);
	recalcCharacterPostmathSpeed(character);
	recalcCharacterPostmathGuts(character);
	recalcCharacterPostmathLuck(character);
	recalcCharacterPostmathVitality(character);
	recalcCharacterPostmathIQ(character);
	while (--level != 0) {
		levelUpChar(character, 0);
	}
	if (setEXP != 0) {
		partyCharacters[character - 1].exp = expTable[character - 1][partyCharacters[character - 1].level];
	}
}

/** Displays in-battle text with a CNUM value set.
 * See_Also: displayInBattleText
 * Params:
 * 	script = Text script to display
 * 	cNum = Value that script will be able to access with GET_CNUM
 * Original_Address: $(DOLLAR)C1DC66
 */
void displayInBattleTextWithValue(const(ubyte)* script, int cNum) {
	if ((gameState.autoFightEnable != 0) && ((padState[0] & Pad.b) != 0)) {
		gameState.autoFightEnable = 0;
		clearAutoFightIcon();
	}
	setCNum(cNum);
	if (battleModeFlag != 0) {
		setTextPromptMode(TextPromptMode.fast2);
	}
	displayText(script);
	setTextPromptModeDefault();
}

/** Displays in-battle text. Also handles cancelling auto-fight on player input and forces an input prompt while in-battle.
 * Params:
 * 	script = Text script to display
 * Original_Address: $(DOLLAR)C1DCCB
 */
void displayInBattleText(const(ubyte)* script) {
	if ((gameState.autoFightEnable != 0) && ((padState[0] & Pad.b) != 0)) {
		gameState.autoFightEnable = 0;
		clearAutoFightIcon();
	}
	if (battleModeFlag != 0) {
		setTextPromptMode(TextPromptMode.fast2);
	}
	displayText(script);
	setTextPromptModeDefault();
}

/** Sets the entire party's levels
 *
 * For use in battle only! This does NOT level characters up normally. This will reset characters to level one, and add levels from there. Current stats are NOT preserved!
 * Original_Address: $(DOLLAR)C1DCCB
 */
void setPartyLevelInBattle(short level) {
	initializeTextSystem();
	battleModeFlag = 1;
	for (short i = 1; i <= 4; i++) {
		resetCharLevelOne(i, level, 1);
		recoverHPAmtPercent(i, 100, 0);
		recoverPPAmtPercent(i, 100, 0);
		partyCharacters[i - 1].hp.current.integer = partyCharacters[i - 1].hp.target;
		partyCharacters[i - 1].pp.current.integer = partyCharacters[i - 1].pp.target;
		memset(&partyCharacters[i - 1].afflictions[0], 0, PartyCharacter.afflictions.length);
	}
}

/** Closes all windows, including the HP/PP meters
 * Original_Address: $(DOLLAR)C1DD5F
 */
void closeAllWindowsAndHPPP() {
	closeAllWindows();
	windowTick();
	hideHPPPWindows();
	windowTick();
}

/// $C1DD9F
void unknownC1DD9F(const(ubyte)* arg1) {
	setTextPromptMode(TextPromptMode.fast1);
	displayText(arg1);
	setTextPromptModeDefault();
}

/// $C1DE43
void battleActionSwitchWeapons() {
	setTextPromptMode(TextPromptMode.fast1);
	if (canCharacterEquip(currentAttacker.id, currentAttacker.currentActionArgument) != 0) {
		short x18 = cast(short)(currentAttacker.offense - currentAttacker.baseOffense);
		short guts = cast(short)(currentAttacker.guts - currentAttacker.baseGuts);
		equipItem(currentAttacker.id, currentAttacker.actionItemSlot);
		currentAttacker.baseOffense = partyCharacters[currentAttacker.id - 1].offense;
		currentAttacker.offense = cast(short)(currentAttacker.baseOffense + x18);
		currentAttacker.baseGuts = partyCharacters[currentAttacker.id - 1].guts;
		currentAttacker.guts = cast(short)(currentAttacker.baseGuts + guts);
		displayText(getTextBlock("MSG_BTL_EQUIP_OK"));
	} else {
		displayText(getTextBlock("MSG_BTL_EQUIP_NG_WEAPON"));
	}
	short tmp = partyCharacters[currentAttacker.id - 1].items[partyCharacters[currentAttacker.id - 1].equipment[EquipmentSlot.weapon] - 1];
	if ((tmp != 0) && ((itemData[tmp].type & 3) == 1)) {
		displayText(getTextBlock(battleActionTable[5].text));
		battleActionTable[5].func();
	} else {
		displayText(getTextBlock(battleActionTable[4].text));
		battleActionTable[4].func();
	}
	setTextPromptModeDefault();
}

/// $C1E00F
void battleActionSwitchArmor() {
	setTextPromptMode(TextPromptMode.fast1);
	if (canCharacterEquip(currentAttacker.id, currentAttacker.currentActionArgument) != 0) {
		short defense = cast(short)(currentAttacker.defense - currentAttacker.baseDefense);
		short speed = cast(short)(currentAttacker.speed - currentAttacker.baseSpeed);
		short luck = cast(short)(currentAttacker.luck - currentAttacker.baseLuck);
		equipItem(currentAttacker.id, currentAttacker.actionItemSlot);
		displayText(getTextBlock("MSG_BTL_EQUIP_OK"));
		currentAttacker.baseDefense = partyCharacters[currentAttacker.id - 1].defense;
		currentAttacker.defense = cast(short)(currentAttacker.baseDefense + defense);
		currentAttacker.baseSpeed = partyCharacters[currentAttacker.id - 1].speed;
		currentAttacker.speed = cast(short)(currentAttacker.baseSpeed + speed);
		currentAttacker.baseLuck = partyCharacters[currentAttacker.id - 1].luck;
		currentAttacker.luck = cast(short)(currentAttacker.baseLuck + luck);
		currentAttacker.fireResist = calcPSIDamageModifiers(partyCharacters[currentAttacker.id - 1].fireResist);
		currentAttacker.freezeResist = calcPSIDamageModifiers(partyCharacters[currentAttacker.id - 1].freezeResist);
		currentAttacker.flashResist = calcPSIResistanceModifiers(partyCharacters[currentAttacker.id - 1].flashResist);
		currentAttacker.paralysisResist = calcPSIResistanceModifiers(partyCharacters[currentAttacker.id - 1].paralysisResist);
		currentAttacker.hypnosisResist = calcPSIResistanceModifiers(partyCharacters[currentAttacker.id - 1].hypnosisBrainshockResist);
		currentAttacker.brainshockResist = calcPSIResistanceModifiers(cast(ubyte)(3 - partyCharacters[currentAttacker.id - 1].hypnosisBrainshockResist));
	} else {
		displayText(getTextBlock("MSG_BTL_EQUIP_NG_WEAPON"));
	}
	setTextPromptModeDefault();
}

/// $C1E1A2
void nullC1E1A2(Battler* arg1) {
	//nothing!
}

/// $C1E1A5
short enemySelectMode(short arg1) {
	short x16;
	short enemyGroup = arg1;
	setInstantPrinting();
	createWindow(Window.textBattle);
	short cursorPosition = 1;
	short valueAdd = 1;
	short savedX = windowStats[windowTable[Window.textBattle]].textX;
	short savedY = windowStats[windowTable[Window.textBattle]].textY;
	outer: while (true) {
		setInstantPrinting();
		moveCurrentTextCursor(savedX, savedY);
		short numberOfDigits = splitDecimalByDigits(enemyGroup);
		ubyte* numberBuffer = &numberTextBuffer[7 - numberOfDigits];
		version(bugfix) {
			alias printLetterFunc = printLetter;
		} else {
			alias printLetterFunc = printLetterVWF;
		}
		// handle leading 0s
		for (short i = 3; i > numberOfDigits; i--) {
			printLetterFunc((i == cursorPosition) ? baseNumberSelectorCharacter1 : baseNumberSelectorCharacter2);
		}
		// print actual number
		for (short i = numberOfDigits; i != 0; i--) {
			printLetterFunc(((i == cursorPosition) ? baseNumberSelectorCharacter1 : baseNumberSelectorCharacter2) + (numberBuffer++)[0]);
		}
		clearInstantPrinting();
		windowTick();
		while (true) {
			windowTick();
			if (((padPress[0] & Pad.left) != 0) && (cursorPosition < 3)) {
				cursorPosition++;
				valueAdd *= 10;
				continue outer;
			} else if (((padPress[0] & Pad.right) != 0) && (cursorPosition > 1)) {
				cursorPosition--;
				valueAdd /= 10;
				continue outer;
			} else if ((padHeld[0] & Pad.up) != 0) {
				if ((enemyGroup / valueAdd) % 10 != 9) {
					enemyGroup += valueAdd;
				} else {
					enemyGroup -= valueAdd * 9;
				}
				break;
			} else if ((padHeld[0] & Pad.down) != 0) {
				if ((enemyGroup / valueAdd) % 10 != 0) {
					enemyGroup -= valueAdd;
				} else {
					enemyGroup += valueAdd * 9;
				}
				break;
			} else if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
				x16 = enemyGroup;
				break outer;
			} else if ((padPress[0] & (Pad.b | Pad.select)) != 0) {
				x16 = arg1;
				break outer;
			}
		}
		if (enemyGroup == 0) {
			continue outer;
		}
		if (enemyGroup > 482) {
			enemyGroup = 482;
		}
		currentBattleGroup = enemyGroup;
		const(BattleGroupEnemy)* x06 = &battleEntryPointerTable[enemyGroup].enemies[0];
		enemiesInBattle = 0;
		while (x06[0].count != 0xFF) {
			short x14 = x06[0].count;
			while (x14-- != 0) {
				enemiesInBattleIDs[enemiesInBattle++] = x06[0].enemyID;
			}
			x06++;
		}
		prepareForImmediateDMA();
		uploadBattleSprites();
		for (short i = 8; i < battlersTable.length; i++) {
			memset(&battlersTable[i], 0, Battler.sizeof);
		}
		for (short i = 0; i < enemiesInBattle; i++) {
			battleInitEnemyStats(enemiesInBattleIDs[i], &battlersTable[8 + i]);
		}
		setInitialBattleSpritePositioning();
		preparePaletteUpload(PaletteUpload.full);
		setForceBlank();
		fadeIn(1, 1);
	}
	setWindowFocus(Window.textBattle);
	closeFocusWindow();
	return x16;
}

/// $C1E48D
short unknownC1E48D(short window, short length, short character) {
	setInstantPrinting();
	setWindowFocus(window);
	short x0E = keyboardInputSingleCharacter(window, length, character);
	setWindowFocus(Window.fileSelectNamingKeyboard);
	return x0E;
}

/// $C1E4BE
short inputDontCareName(short window, short namingItem, short oldDontCareSelected) {
	setInstantPrinting();
	createWindow(window);
	short length = (4 > namingItem) ? 5 : 6;
	emptyKeyboardInput(length);
	moveCurrentTextCursor(0, windowStats[windowTable[currentFocusWindow]].textY);
	short dontCareNameIndex = (oldDontCareSelected == 6) ? 0 : cast(short)(oldDontCareSelected + 1);
	// Huh. The vanilla game happily just indexes out of bounds here.
	for (short i = 0; i < dontCareNames[namingItem][dontCareNameIndex].length && dontCareNames[namingItem][dontCareNameIndex][i] != 0; i++) {
		keyboardInputSingleCharacter(window, length, dontCareNames[namingItem][dontCareNameIndex][i]);
	}
	setWindowFocus(Window.fileSelectNamingKeyboard);
	return dontCareNameIndex;
}

/// $C1E57F
short textInputDialog(short inputWindow, short arg2, ubyte* arg3, short arg4, short namingItem) {
	short dontCareSelected = -1;
	short y = 0;
	short x = 0;
	short x1E = arg4;
	short selectionCursorFrame;
	short cursorPosition;
	setInstantPrinting();
	createWindow(Window.fileSelectNamingKeyboard);
	if (namingItem == -1) {
		displayText(getTextBlock(keyboardText[5]));
	} else {
		displayText(getTextBlock(keyboardText[4]));
	}
	characterPadding = 0;
	if (namingItem == -1) {
		displayText(getTextBlock(keyboardText[2 + arg4]));
	} else {
		displayText(getTextBlock(keyboardText[arg4]));
	}
	characterPadding = 1;
	l0: while (true) {
		setInstantPrinting();
		if (x1E != arg4) {
			createWindow(Window.fileSelectNamingKeyboard);
			windowTickWithoutInstantPrinting();
			if (namingItem == -1) {
				displayText(getTextBlock(keyboardText[5]));
			} else {
				displayText(getTextBlock(keyboardText[4]));
			}
			characterPadding = 0;
			if (namingItem == -1) {
				displayText(getTextBlock(keyboardText[2 + arg4]));
			} else {
				displayText(getTextBlock(keyboardText[arg4]));
			}
			characterPadding = 1;
		}
		l1: while (true) {
			clearInstantPrinting();
			moveCurrentTextCursor(x, y);
			windowSetTextColor(TextPalette.miscUIElements);
			drawTallTextTileFocusedRedraw(TallTextTile.menuCursor);
			windowSetTextColor(TextPalette.normal);
			windowTick();
			selectionCursorFrame = 1;
			l2: while (true) {
				selectionCursorFrame ^= 1;
				copyToVRAM(VRAMCopyMode.unknown00, 2, cast(ushort)((windowStats[windowTable[currentFocusWindow]].textY * 2 + windowStats[windowTable[currentFocusWindow]].y) * 32 + windowStats[windowTable[currentFocusWindow]].x + windowStats[windowTable[currentFocusWindow]].textX + 0x7C20), cast(const(ubyte)*)&selectionCursorFramesUpper[selectionCursorFrame]);
				copyToVRAM(VRAMCopyMode.unknown00, 2, cast(ushort)((windowStats[windowTable[currentFocusWindow]].textY * 2 + windowStats[windowTable[currentFocusWindow]].y) * 32 + windowStats[windowTable[currentFocusWindow]].x + windowStats[windowTable[currentFocusWindow]].textX + 0x7C40), cast(const(ubyte)*)&selectionCursorFramesLower[selectionCursorFrame]);
				for (short i = 0; 10 > i; i++) {
					finishFrame();
					if ((padPress[0] & Pad.up) != 0) {
						cursorPosition = moveCursorWrap(x, y, -1, 0, Sfx.unknown7C, x, windowStats[windowTable[currentFocusWindow]].height / 2);
						break l2;
					}
					if ((padPress[0] & Pad.left) != 0) {
						cursorPosition = moveCursorWrap(x, y, 0, -1, Sfx.unknown7B, windowStats[windowTable[currentFocusWindow]].width, y);
						break l2;
					}
					if ((padPress[0] & Pad.down) != 0) {
						cursorPosition = moveCursorWrap(x, y, 1, 0, Sfx.unknown7C, x, -1);
						break l2;
					}
					if ((padPress[0] & Pad.right) != 0) {
						cursorPosition = moveCursorWrap(x, y, 0, 1, Sfx.unknown7B, -1, y);
						break l2;
					}
					if ((padHeld[0] & Pad.up) != 0) {
						cursorPosition = moveCursor(x, y, -1, 0, Sfx.unknown7C);
						break l2;
					}
					if ((padHeld[0] & Pad.down) != 0) {
						cursorPosition = moveCursor(x, y, 1, 0, Sfx.unknown7C);
						break l2;
					}
					if ((padHeld[0] & Pad.left) != 0) {
						cursorPosition = moveCursor(x, y, 0, -1, Sfx.unknown7B);
						break l2;
					}
					if ((padHeld[0] & Pad.right) != 0) {
						cursorPosition = moveCursor(x, y, 0, 1, Sfx.unknown7B);
						break l2;
					}
					if ((padPress[0] & (Pad.a | Pad.l)) != 0) {
						if (y == 6) {
							switch (x) {
								case 0: //don't care
									playSfx(Sfx.textInput);
									dontCareSelected = inputDontCareName(inputWindow, namingItem, dontCareSelected);
									continue l1;
								case 17: //backspace
									playSfx(Sfx.textInput);
									if ((unknownC1E48D(inputWindow, arg2, -1) != 0) && (namingItem != -1)) {
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
							if (y == 4) {
								switch (x) {
									case 0:
										arg4 = 0;
										continue l0;
									case 7:
										arg4 = 1;
										continue l0;
									default: break;
								}
							}
							unknownC1E48D(inputWindow, arg2, getCharacterAtCursorPosition(x / 2, y, arg4));
							continue l1;
						}
					} else if ((padPress[0] & (Pad.b | Pad.select)) != 0) {
						playSfx(Sfx.unknown7D);
						if ((unknownC1E48D(inputWindow, arg2, -1) != 0) && (namingItem != -1)) {
							return 1;
						}
					} else if ((padPress[0] & Pad.start) != 0) {
						playSfx(Sfx.unknown7E);
						goto Unknown42;
					}
				}
			}
			moveCurrentTextCursor(x, y);
			drawTallTextTileFocusedRedraw(TallTextTile.nonBreakingSpace);
			if (cursorPosition != -1) {
				x = cursorPosition & 0xFF;
				y = cursorPosition >> 8;
			}
			continue;
			Unknown42:
			if (strlen(cast(char*)&keyboardInputCharacters[0]) != 0) {
				setWindowFocus(inputWindow);
				short i;
				for(i = 0; (keyboardInputCharacters[i] != 0) && (i < arg2); i++) {
					(arg3++)[0] = keyboardInputCharacters[i];
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
	enableWordWrap = 0;
	allowTextOverflow = 1;
	setInstantPrinting();
	createWindow(Window.unknown27);
	if (arg1 != 0) {
		moveCurrentTextCursor(0, 0);
		printString(gameState.earthboundPlayerName.length, &gameState.earthboundPlayerName[0]);
		moveCurrentTextCursor(0, 1);
		emptyKeyboardInput(gameState.mother2PlayerName.length);
		if (gameState.mother2PlayerName[0] != 0) {
			printString(gameState.mother2PlayerName.length, &gameState.mother2PlayerName[0]);
		}
		moveCurrentTextCursor(0, 1);
		result = textInputDialog(Window.unknown27, gameState.mother2PlayerName.length, &gameState.mother2PlayerName[0], 0, -1);
	} else {
		moveCurrentTextCursor(0, 0);
		printString(nameRegistryRequestString.length, &nameRegistryRequestString[0]);
		waitDMAFinished();
		moveCurrentTextCursor(0, 1);
		emptyKeyboardInput(gameState.earthboundPlayerName.length);
		moveCurrentTextCursor(0, 1);
		if (gameState.earthboundPlayerName[0] != 0) {
			prefillKeyboardInput(&gameState.earthboundPlayerName[0], gameState.earthboundPlayerName.length);
		}
		moveCurrentTextCursor(0, 1);
		result = textInputDialog(Window.unknown27, gameState.earthboundPlayerName.length, &gameState.earthboundPlayerName[0], 0, -1);
		transliterateString(&temporaryTextBuffer[0], &gameState.earthboundPlayerName[0]);
		memcpy(&gameState.mother2PlayerName[0], &temporaryTextBuffer[0], 12);
	}
	closeWindow(Window.fileSelectNamingKeyboard);
	closeWindow(Window.unknown27);
	enableWordWrap = 0xFF;
	allowTextOverflow = 0;
	return result;
}

/// $C1EC04
short nameACharacter(short length, ubyte* destination, short namingItem, const(ubyte)* caption, short captionLength) {
	createWindow(Window.fileSelectNamingNameBox);
	windowTickWithoutInstantPrinting();
	if (destination[0] != 0) {
		prefillKeyboardInput(destination, length);
	} else {
		emptyKeyboardInput(length);
	}
	moveCurrentTextCursor(0, 0);
	createWindow(Window.fileSelectNamingMessage);
	windowTickWithoutInstantPrinting();
	printString(captionLength, caption);
	cc1314(1, 0);
	short x14 = textInputDialog(Window.fileSelectNamingNameBox, length, destination, 0, namingItem);
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
	paletteUploadMode = PaletteUpload.full;
	gameState.textFlavour = x00;
}

/// $C1ECD1
void unknownC1ECD1(short arg1) {
	unknownC1EC8F(arg1 >> 8);
}

/// $C1ECDC
void corruptionCheck() {
	if (corruptionCheckResults == 0) {
		return;
	}
	backupCurrentWindowTextAttributes(&windowTextAttributesBackup);
	createWindow(Window.unknown2f);
	for (short i = 0; 3 > i; i++) {
		if ((sramSlotBitmasks[i] & corruptionCheckResults) == 0) {
			continue;
		}
		setCNum(i + 1);
		displayText(getTextBlock("MSG_SYS_SRAM_CRASH"));
	}
	closeFocusWindow();
	corruptionCheckResults = 0;
	restoreCurrentWindowTextAttributes(&windowTextAttributesBackup);
}

/// $C1ED5B
short fileSelectMenu(short arg1) {
	short x1C;
	createWindow(Window.fileSelectMain);
	for (short i = 0; i < 3; i++, createNewMenuOptionWithUserdata(x1C | i, &temporaryTextBuffer[0], null)) {
		loadGameSlot(i);
		if (gameState.favouriteThing[1] != 0) {
			memset(&temporaryTextBuffer[0], 0, 0x20);
			temporaryTextBuffer[0] = cast(ubyte)(ebChar('1') + i);
			temporaryTextBuffer[1] = ebChar(':');
			temporaryTextBuffer[2] = ebChar(' ');
			for (short j = 0; j < PartyCharacter.name.length; j++) {
				if ((partyCharacters[0].name[j] == 0) || (j >= PartyCharacter.name.length)) {
					temporaryTextBuffer[j + 3] = 0;
				} else if (j < PartyCharacter.name.length) {
					temporaryTextBuffer[j + 3] = partyCharacters[0].name[j];
				}
			}
			saveFilesPresent[i] = 1;
			x1C = cast(short)(gameState.textFlavour << 8);
		} else {
			temporaryTextBuffer[0] = cast(ubyte)(ebChar('1') + i);
			memcpy(&temporaryTextBuffer[1], &fileSelectTextStartNewGame[0], fileSelectTextStartNewGame.length);
			temporaryTextBuffer[17] = 0;
			saveFilesPresent[i] = 0;
			x1C = 0x100;
		}
	}
	printMenuOptionTable(1, 0, 0);
	for (short i = 0; i < 3; i++) {
		loadGameSlot(i);
		if (gameState.favouriteThing[1] != 0) {
			memcpy(&temporaryTextBuffer[0], &fileSelectTextLevel[0], fileSelectTextLevel.length);
			temporaryTextBuffer[6] = 0;
			moveCurrentTextCursor(9, i);
			printString(32, &temporaryTextBuffer[0]);
			const levelCharsPrinted = splitDecimalByDigits(partyCharacters[0].level);
			temporaryTextBuffer[0] = (levelCharsPrinted == 1) ? ebChar(' ') : (cast(ubyte)(numberTextBuffer[7 - levelCharsPrinted] + ebChar('0')));
			temporaryTextBuffer[1] = cast(ubyte)(numberTextBuffer[6] + ebChar('0'));
			temporaryTextBuffer[2] = 0;
			moveCurrentTextCursor(13, i);
			printString(32, &temporaryTextBuffer[0]);
			memcpy(&temporaryTextBuffer[0], &fileSelectTextTextSpeed[0], fileSelectTextTextSpeed.length);
			temporaryTextBuffer[11] = ebChar(' ');
			version(configurable) {
				const ubyte nameOffset = !config.instantSpeedText;
			} else {
				enum nameOffset = 0;
			}
			memcpy(&temporaryTextBuffer[12], &fileSelectTextTextSpeedStrings[gameState.textSpeed + nameOffset - 1][0], fileSelectTextTextSpeedStrings[gameState.textSpeed + nameOffset - 1].length);
			moveCurrentTextCursor(16, i);
			printString(32, &temporaryTextBuffer[0]);
		}
	}
	if (arg1 != 0) {
		MenuOption* x1C_2 = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		for (short i = cast(short)(currentSaveSlot - 1); i != 0; i--) {
			x1C_2 = &menuOptions[x1C_2.next];
		}
		windowSetTextColor(TextPalette.highlighted);
		moveCurrentTextCursor(cast(short)(x1C_2.textX + 1), x1C_2.textY);
		enableWordWrap = 0;
		fillRestOfWindowLine();
		windowSetTextColor(TextPalette.normal);
	} else {
		corruptionCheck();
		while (fadeParameters.step != 0) { waitForInterrupt(); }
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
	createWindow(Window.fileSelectMenu);
	createNewMenuOptionAtPositionWithUserdata(1, 0, 0, &fileSelectTextContinue[0], null);
	for (short i = 0; 3 > i; i++) {
		if (currentSaveSlot -1 == i) {
			continue;
		}
		if (saveFilesPresent[i] != 0) {
			continue;
		}
		createNewMenuOptionAtPositionWithUserdata(2, 6, 0, &fileSelectTextCopy[0], null);
	}
	createNewMenuOptionAtPositionWithUserdata(3, 10, 0, &fileSelectTextDelete[0], null);
	createNewMenuOptionAtPositionWithUserdata(4, 15, 0, &fileSelectTextSetUp[0], null);
	printMenuItems();
	enableWordWrap = 0xFF;
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
immutable short[7][7] psiBlockingStatuses = [
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
short handleFileCopyMenu() {
	short fileCount;
	for (short i = 0; 3 > i; i++) {
		if (saveFilesPresent[i] == 0) {
			fileCount++;
		}
	}
	if (fileCount == 1) {
		createWindow(Window.fileSelectCopyMenuOneFile);
		setInstantPrinting();
		printString(fileSelectTextCopyToWhere.length, &fileSelectTextCopyToWhere[0]);
		for (short i = 0; 3 > i; i++) {
			if (saveFilesPresent[i] == 0) {
				temporaryTextBuffer[0] = cast(ubyte)(ebChar('1') + i);
				temporaryTextBuffer[1] = ebChar(':');
				temporaryTextBuffer[2] = 0;
				createNewMenuOptionAtPositionWithUserdata(cast(short)(i + 1), 0, 1, &temporaryTextBuffer[0], null);
			}
		}
	} else {
		createWindow(Window.fileSelectCopyMenuTwoFiles);
		setInstantPrinting();
		printString(fileSelectTextCopyToWhere.length, &fileSelectTextCopyToWhere[0]);
		short y = 1;
		for (short i = 0; 3 > i; i++) {
			if (saveFilesPresent[i] == 0) {
				temporaryTextBuffer[0] = cast(ubyte)(ebChar('1') + i);
				temporaryTextBuffer[1] = ebChar(':');
				temporaryTextBuffer[2] = 0;
				createNewMenuOptionAtPositionWithUserdata(cast(short)(i + 1), 0, y++, &temporaryTextBuffer[0], null);
			}
		}
	}
	printMenuItems();
	short destinationSlot = selectionMenu(1);
	if (destinationSlot != 0) {
		copySaveSlot(cast(short)(destinationSlot - 1), cast(short)(currentSaveSlot - 1));
	}
	enableWordWrap = 0;
	closeFocusWindow();
	return destinationSlot;
}

/// $C1F2A8
short handleFileDeleteMenu() {
	createWindow(Window.fileSelectDeleteConfirmation);
	setInstantPrinting();
	setCurrentWindowPadding(0);
	moveCurrentTextCursor(0, 0);
	printString(fileSelectTextAreYouSureDelete.length, &fileSelectTextAreYouSureDelete[0]);
	forcePixelAlignment(0, 1);
	moveCurrentTextCursor(0, 1);
	printNumber(currentSaveSlot);
	printLetterVWF(ebChar(':'));
	moveCurrentTextCursor(2, 1);
	unknownC1931B(1);
	moveCurrentTextCursor(8, 1);
	printString(fileSelectTextLevel.length, &fileSelectTextLevel[0]);
	moveCurrentTextCursor(12, 1);
	printNumber(partyCharacters[0].level);
	createNewMenuOptionAtPositionWithUserdata(0, 0, 2, &fileSelectTextAreYouSureDeleteNo[0], null);
	createNewMenuOptionAtPositionWithUserdata(1, 0, 3, &fileSelectTextAreYouSureDeleteYes[0], null);
	printMenuItems();
	short targetSlot = selectionMenu(1);
	if (targetSlot != 0) {
		eraseSaveSlot(currentSaveSlot - 1);
	}
	enableWordWrap = 0;
	closeFocusWindow();
	return targetSlot;
}

/// $C1F3C2
void openTextSpeedMenu() {
	createWindow(Window.fileSelectTextSpeed);
	setInstantPrinting();
	printString(fileSelectTextSelectTextSpeed.length, &fileSelectTextSelectTextSpeed[0]);
	version(configurable) {
		const ubyte nameOffset = !config.instantSpeedText;
	} else {
		enum nameOffset = 0;
	}
	createNewMenuOptionAtPosition(0, 1, &fileSelectTextTextSpeedStrings[0 + nameOffset][0], null);
	createNewMenuOptionAtPosition(0, 2, &fileSelectTextTextSpeedStrings[1 + nameOffset][0], null);
	createNewMenuOptionAtPosition(0, 3, &fileSelectTextTextSpeedStrings[2 + nameOffset][0], null);
	version(configurable) {
		if (config.instantSpeedText) {
			createNewMenuOptionAtPosition(0, 4, &fileSelectTextTextSpeedStrings[3][0], null);
		}
	}
	printMenuItemsPreselected(gameState.textSpeed != 0 ? gameState.textSpeed - 1 : 1);
}

/// $C1F497
short unknownC1F497(short openWindow) {
	short textSpeed;
	currentFocusWindow = Window.fileSelectTextSpeed;
	setInstantPrinting();
	if (openWindow != 0) {
		openTextSpeedMenu();
		MenuOption* option = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		for (short i = cast(short)(gameState.textSpeed - 1); i != 0; i--) {
			option = &menuOptions[menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption].next];
		}
		windowSetTextColor(TextPalette.highlighted);
		moveCurrentTextCursor(cast(short)(option.textX + 1), option.textY);
		setTextHighlighting(0xFFFF, 1, &option.label[0]);
		windowSetTextColor(TextPalette.normal);
		textSpeed = gameState.textSpeed;
	} else {
		enableWordWrap = 0;
		textSpeed = selectionMenu(1);
		if (textSpeed != 0) {
			gameState.textSpeed = cast(ubyte)textSpeed;
			saveGameSlot(cast(short)(currentSaveSlot - 1));
		}
	}
	return textSpeed;
}

/// $C1F568
void openSoundMenu() {
	createWindow(Window.fileSelectMusicMode);
	setInstantPrinting();
	printString(fileSelectTextSelectSoundSetting.length, &fileSelectTextSelectSoundSetting[0]);
	createNewMenuOptionAtPosition(0, 1, &fileSelectTextSoundSettingStrings[0][0], null);
	createNewMenuOptionAtPosition(0, 2, &fileSelectTextSoundSettingStrings[1][0], null);
	printMenuItemsPreselected(gameState.soundSetting != 0 ? gameState.soundSetting - 1 : 0);
}

/// $C1F616
short unknownC1F616(short openWindow) {
	short newSoundSetting;
	currentFocusWindow = Window.fileSelectMusicMode;
	setInstantPrinting();
	if (openWindow != 0) {
		openSoundMenu();
		MenuOption* x14 = &menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption];
		for (short i = gameState.soundSetting; i != 0; i--) {
			x14 = &menuOptions[menuOptions[windowStats[windowTable[currentFocusWindow]].currentOption].next];
		}
		windowSetTextColor(TextPalette.highlighted);
		moveCurrentTextCursor(cast(short)(x14.textX + 1), x14.textY);
		setTextHighlighting(0xFFFF, 1, &x14.label[0]);
		windowSetTextColor(TextPalette.normal);
		newSoundSetting = gameState.soundSetting;
	} else {
		newSoundSetting = selectionMenu(1);
		if (newSoundSetting != 0) {
			gameState.soundSetting = cast(ubyte)newSoundSetting;
		}
		saveGameSlot(cast(short)(currentSaveSlot - 1));
	}
	return newSoundSetting;
}

/// $C1F6E3
short openFlavourMenu() {
	createWindow(Window.fileSelectFlavourChoice);
	setInstantPrinting();
	printString(fileSelectTextWhichStyle.length, &fileSelectTextWhichStyle[0]);
	createNewMenuOptionAtPosition(0, 2, &fileSelectTextFlavorPlain[0], null);
	createNewMenuOptionAtPosition(0, 3, &fileSelectTextFlavorMint[0], null);
	createNewMenuOptionAtPosition(0, 4, &fileSelectTextFlavorStrawberry[0], null);
	createNewMenuOptionAtPosition(0, 5, &fileSelectTextFlavorBanana[0], null);
	createNewMenuOptionAtPosition(0, 6, &fileSelectTextFlavorPeanut[0], null);
	version(bugfix) {
		if (gameState.textFlavour == 0) {
			gameState.textFlavour = 1;
		}
	}
	printMenuItemsPreselected(gameState.textFlavour - 1);
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
			setLeaderLocation(initialStats[0].startX, initialStats[0].startY);
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
			displayTextWindowless(getTextBlock("MSG_EVT_PROLOGUE_NEW"));
			setEventFlag(EventFlag.sysMonsterOff, 1);
			showNPCFlag = 1;
		}
	} else {
		outermost: while (true) {
			setInstantPrinting();
			const fileMenuResult = fileSelectMenu(0);
			if ((fileMenuResult == 0) || (saveFilesPresent[fileMenuResult - 1] != 0)) {
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
						if (handleFileCopyMenu() == 0) {
							goto ValidFileSelected;
						}
						break;
					case 3: //Delete
						if (handleFileDeleteMenu() == 0) {
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
								short progressDirection;
								for (short i = 0; 7 > i; unknownC4D830(i), i += progressDirection) {
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
											progressDirection = -1;
											continue;
										}
										progressDirection = 1;
										continue;
									}
									if (i == ThingsToName.dog) {
										if (nameACharacter(gameState.petName.length, &gameState.petName[0], i, &fileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
											progressDirection = -1;
											continue;
										}
										progressDirection = 1;
										continue;
									}
									if (i == ThingsToName.favoriteFood) {
										if (nameACharacter(gameState.favouriteFood.length, &gameState.favouriteFood[0], i, &fileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
											progressDirection = -1;
											continue;
										}
										progressDirection = 1;
										continue;
									}
									if (i == ThingsToName.favoriteThing) {
										if (nameACharacter(gameState.favouriteThing.length, &gameState.favouriteThing[4], i, &fileSelectTextPleaseNameThemStrings[i][0], 40) != 0) {
											progressDirection = -1;
											continue;
										}
										progressDirection = 1;
										continue;
									}
								}
								closeAllWindows();
								setInstantPrinting();
								for (short i = 0; 4 > i; i++, unknownC1931B(i)) {
									createWindow(cast(short)(Window.fileSelectNamingConfirmationNess + i));
								}
								createWindow(Window.fileSelectNamingConfirmationKing);
								unknownC1931B(7);
								createWindow(Window.fileSelectNamingConfirmationFood);
								printString(fileSelectTextFavoriteFood.length, &fileSelectTextFavoriteFood[0]);
								short x = getTextWidth(cast(short)strlen(cast(char*)&gameState.favouriteFood[0]), 0, &gameState.favouriteFood[0]);
								moveCurrentTextCursor(cast(short)(windowStats[windowTable[Window.fileSelectNamingConfirmationFood]].width - (((x % 8) != 0) || ((x / 8) == 6) ? ((x / 8) + 1) : (x / 8))), 1);
								printString(cast(short)strlen(cast(char*)&gameState.favouriteFood[0]), &gameState.favouriteFood[0]);

								createWindow(Window.fileSelectNamingConfirmationThing);
								printString(fileSelectTextCoolestThing.length, &fileSelectTextCoolestThing[0]);
								x = getTextWidth(cast(short)strlen(cast(char*)&gameState.favouriteThing[4]), 0, &gameState.favouriteThing[4]);
								moveCurrentTextCursor(cast(short)(windowStats[windowTable[Window.fileSelectNamingConfirmationThing]].width - (((x % 8) != 0) || ((x / 8) == 6) ? ((x / 8) + 1) : (x / 8))), 1);
								printString(cast(short)strlen(cast(char*)&gameState.favouriteThing[4]), &gameState.favouriteThing[4]);

								createWindow(Window.fileSelectNamingConfirmationMessage);
								printString(fileSelectTextAreYouSure.length, &fileSelectTextAreYouSure[0]);

								createNewMenuOptionAtPositionWithUserdata(1, 14, 0, &fileSelectTextAreYouSureYep[0], null);
								createNewMenuOptionAtPositionWithUserdata(0, 18, 0, &fileSelectTextAreYouSureNope[0], null);
								printMenuItems();
								unknownC4D8FA();
								enableWordWrap = 0xFF;
								if (selectionMenu(1) == 0) {
									unknownC021E6();
									continue nameLoop;
								}
								changeMusic(Music.nameConfirmation);
								windowTick();
								for (short i = 0; 180 > i; i++) {
									finishFrame();
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
								setLeaderLocation(initialStats[0].startX, initialStats[0].startY);
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
								displayTextWindowless(getTextBlock("MSG_EVT_PROLOGUE_NEW"));
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
	hpMeterSpeed = hpMeterSpeeds[gameState.textSpeed - 1];
	selectedTextSpeed = cast(ushort)(gameState.textSpeed - 1);
	textSpeedBasedWait = (gameState.textSpeed == 3) ? 0 : 30;
	unread7E5DBA = 0;
	displayText(getTextBlock("MSG_SYS_PRE_GAMESTART"));
}

/** Test whether or not the text palettes need to be reloaded due to party status changes
 * Returns: 1 if a palette reload is needed, 0 otherwise
 * $(DOLLAR)C1FF2C
 */
short checkTextPaletteReloadRequired() {
	short result;
	ubyte lastPartyMemberStatus = 0;
	version(bugfix) {
		if (chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]] == null){
			return 1;
		}
	}
	// dead party members will always be last, so we only have to check the last one
	switch(chosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0]) {
		case Status0.unconscious:
		case Status0.diamondized:
			lastPartyMemberStatus = 1;
			goto default;
		default:
			result = 0;
			if (lastPartyMemberStatus != lastPartyMemberStatusLastCheck) {
				result = 1;
			}
			break;
	}
	lastPartyMemberStatusLastCheck = lastPartyMemberStatus;
	return result;
}

/// $C1FF6B
short unknownC1FF6B() {
	enableWordWrap = 0;
	allowTextOverflow = 1;
	fileMenuLoop();
	clearInstantPrinting();
	windowTick();
	disabledTransitions = 0;
	lastPartyMemberStatusLastCheck = 0;
	enableWordWrap = 0xFF;
	allowTextOverflow = 0;
	return 0;
}

/// $C1FF99
void unknownC1FF99(short arg1, short arg2, ubyte* arg3) {
	vwfX = cast(ushort)((arg2 *8 - getStringRenderWidth(arg3, arg1)) / 2);
	vwfTile = vwfX / 8;
}

short sramCheckRoutineChecksum(short, ref const(ubyte)*) {
	return 0;
}
