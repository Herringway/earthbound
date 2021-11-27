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
import earthbound.bank15;
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
        Win_Tick();
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

/// $C10048
void UnknownC10048(ushort arg1) {
    Unknown7E964F = arg1;
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
    ClearInstaprint();
    Win_Tick();
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
    ClearInstaprint();
    Win_Tick();
    while (--arg1 != 0) {
        UnknownC12E42();
    }
}

/// $C100FE
void UnknownC100FE(short arg1);

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
    ClearInstaprint();
    Win_Tick();
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
void UnknownC102D0();

/// $C10301
WinStat* GetActiveWindowAddress() {
    if (window_head == -1) {
        return &Unknown7E85FE;
    }
    return &WindowStats[WindowTable[CurrentFocusWindow]];
}

/// $C10324
uint TransferActiveMemStorage();

/// $C10380
uint TransferStorageMemActive();

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

/// $C107AF
void UnknownC107AF(short window_id);

/// $C10A04
void ShowHPPPWindows() {
    UnknownC3E6F8();
    Unknown7E89C9 = 1;
    Unknown7E9623 = 1;
    Unknown7E9647 = -1;
}

/// $C10A1D
void HideHPPPWindows();

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
    if ((BlinkingTriangleFlag != 0) && (x10 == 0) && ((arg2 == 0x20) || (arg2 == 0x40)))  {
        if (BlinkingTriangleFlag != 1) {
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
short UnknownC10C55(uint*);

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
    if (Unknown7E964F == 2) {
        x = 1;
    } else if (Unknown7E964F == 3) {
        x = 0;
    } else {
        x = 0;
        if (BlinkingTriangleFlag == 0) {
            x = 1;
        }
    }
    if ((x != 0) && (Unknown7E9622 == 0) && (arg1 != 0x20) && (arg1 != EBChar(' '))) {
        PlaySfx(Sfx.TextPrint);
    }
    if (Unknown7E9622 == 0) {
        for (short i = SelectedTextSpeed; i != 0; i--) {
            Win_Tick();
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
void ChangeCurrentWindowFont(short);

/// $C10FEA - Sets the text color for the focused window
void Win_SetTextColor(short window_id) {
    if (window_id == -1) {
        return;
    }
    WindowStats[WindowTable[window_id]].tileAttributes = cast(ushort)(window_id * 0x400);
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
    X.field0C = arg1;
    X.field00 = 2;
    return X;
}

/// $C1163C - Prints the options into the focused window
void PrintMenuItems();

/// $C1180D
void UnknownC1180D(short arg1, short arg2) {
    UnknownC451FA(arg1, 0, arg2);
    PrintMenuItems();
}

/// $C118E7 - Get target X/Y window positions after menu cursor movement
///           Returns low byte = X, high byte = Y
///           (arguments unknown)
ushort UnknownC118E7(short, short, short, short, short, short, short);

/// $C1196A - Handle menu selection on the focused window
int SelectionMenu(int cancelable) {
    // $28 = cancelable

    int dp26 = CurrentFocusWindow;
    if (dp26 == -1) return 0;

    WinStat *dp24 = &WindowStats[WindowTable[CurrentFocusWindow]]; // 16-bit pointer

    if (Unknown7E5E79) {
        dp24.current_option = Unknown7E9688;  // field2B
        dp24.selected_option = Unknown7E968A; // field2F
    }

    int dp20;
    MenuOpt *dp04; // 16-bit pointer
    if (dp24.selected_option != -1) { // field2F
        int dp22 = dp24.selected_option;
        dp20 = dp22;

        dp04 = &MenuOptions[dp24.current_option]; // field2B

        while (dp22) {
            dp22--;
            dp04 = &MenuOptions[dp04.next]; // field02
        }

        SetInstaprint();
        UnknownC43CD2(dp04, dp04.text_x, dp04.text_y); // field08, field0A
        UnknownC43BB9(-1, 0, dp04.label.ptr); // field13
    } else {
        dp20 = 0;
        dp04 = &MenuOptions[dp24.current_option]; // field2B
    }

    int dp22;
label1:
    dp22 = 0;
    if (dp04.script) { // field0F
        SetInstaprint();
        DisplayText(dp04.script); // field0F
    }

    if (dp24.menu_callback) { // field37
        /* "Why a ternary operator?"
         *   LDX $04
         *   LDA $0000,X
         *   CMP #$0001
         *   BNE False
         *   LDA $20
         *   INC
         *   BRA SetDp1C
         * False:
         *   LDX $04
         *   LDA $000C,X
         * SetDp1C:
         *   STA $1C
         */
        int dp1C = (dp04.field00 == 1) ? dp20+1 : dp04.field0C;
        dp24.menu_callback(cast(short)dp1C);
        SetWindowFocus(cast(short)dp26);
    }

    ClearInstaprint();
    if (Unknown7E5E79) {
        dp04.text_x = Unknown7E9684; // field08
        dp04.text_y = Unknown7E9686; // field0A
    }

    UnknownC43CD2(dp04, dp04.text_x, dp04.text_y);
    Win_SetTextColor(1);
    UnknownC10D60(0x21);   // Put cursor on the window maybe?
    Win_SetTextColor(0);
    Win_Tick();

    int dp02 = 1;
label2:
    dp02 ^= 1;
    int dp1A = dp02;

    // x=field06, text_x=field0E, text_y=field10, y=field08
    int dp1E =  (dp24.x + dp24.text_x) + ((dp24.text_y * 2) + (dp24.y * 32)) + 0x7C20;
    dp02 = dp1A; // The addition above used dp02 as an intermediary value

    // dp18 = dp02 * 2;
    CopyToVram(0*3, 2, cast(ushort)dp1E,    cast(ubyte*)(arrC3E406.ptr + dp02)); // Implied (dp02 * 2), because arrC3E406 is an array of ushort
    CopyToVram(0*3, 2, cast(ushort)(dp1E+32), cast(ubyte*)(arrC3E40A.ptr + dp02)); // Implied (dp02 * 2), because arrC3E40A is an array of ushort

    int dp1C;
    for (dp1E = 0; dp1E < 10; dp1E++) {
        UnknownC12E42();

        if (pad_press[0] & PAD_UP) {
            dp1C = UnknownC118E7(dp04.text_x, dp04.text_y, -1, 0, 3, dp04.text_x, dp24.height);
            goto label3;
        }

        if (pad_press[0] & PAD_LEFT) {
            dp1C = UnknownC118E7(dp04.text_x, dp04.text_y, 0, -1, 2, dp24.width, dp04.text_y);
            goto label3;
        }

        if (pad_press[0] & PAD_DOWN) {
            dp1C = UnknownC118E7(dp04.text_x, dp04.text_y, 1, 0, 3, dp04.text_x, -1);
            goto label3;
        }

        if (pad_press[0] & PAD_RIGHT) {
            dp1C = UnknownC118E7(dp04.text_x, dp04.text_y, 0, 1, 2, -1, dp04.text_y);
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
            SetInstaprint();
            if (dp04.page) {        // field06
                PlaySfx(dp04.sfx);  // field0E
                UnknownC43CD2(dp04, dp04.text_x, dp04.text_y);
                UnknownC10D60(0x2F);   // Remove cursor from window?
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
                ClearInstaprint();

                dp24.selected_option = cast(short)dp20; // field2F
                return (dp04.field00 == 1) ? dp20+1 : dp04.field0C;
            }

            PlaySfx(2);
            ClearFocusWindow(); // Clear the focused window

            dp1E = dp24.menu_page;
            if (dp1E == MenuOptions[dp04.prev].page) { // prev=field04
                dp24.menu_page = 1;
            } else {
                dp24.menu_page = cast(short)(dp1E+1);
            }

            ClearInstaprint();
            UnknownEF0115(cast(short)dp26);
            Win_Tick();

            PrintMenuItems(); // Print the options for the new page
            SetInstaprint();
            goto label1;        // Back to the start....
        }

        if ((pad_press[0] & (PAD_B|PAD_SELECT)) && cancelable == 1) {
            PlaySfx(2);
            return 0;
        }

        ++dp22;
        if (WindowTable[0] == window_tail) { // If the field/overworld commands window is the last opened window...
            if (dp22 > 60) {                  // If 60 frames have passed
                if (WindowTable[10] == -1) { // If the wallet window is not open
                    OpenHpAndWallet();
                    SetWindowFocus(0);
                    // Funky! I didn't expect a goto back to the start here...
                    // The reason this is here is because the code path from label1 calls Win_Tick (draws the HP and wallet windows) and resets dp22.
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

    int tmp = dp1C & 0xFF;
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
void Win_Tick() {
    rand();
    if (Unknown7E968C != 0) {
        Unknown7E968C = 0;
        return;
    }
    if (Unknown7E9622 != 0) {
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
        UnknownC1180D(1, 0);
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
                x1A = TextDebugAppleMenu;
                break;
            case 5:
                x1A = TextDebugBananaMenu;
                break;
            case 6:
                x1A = TextDebugUnknownMenu;
                break;
            case 7:
                x1A = TextDebugUnknownMenu2;
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
                x1A = TextBattleGiygasPrayer91;
                break;
            case 23:
                x1A = TextEndOfGamePickyEvent;
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
        Win_Tick();
    } while (Unknown7EB4A8 != -1);
    UnknownC09451();
}

/// $C13187
const(ubyte)* TalkTo();

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
            return NPCConfig[CurrentTPTEntry].talkText;
        case NPCType.Object:
            return NPCConfig[CurrentTPTEntry].talkText;
        default: break;
    }
    return null;
}

/// $C133B0
void OpenMenuButton();

/// $C13---
void OpenMenuButtonCheckTalk() {
    UnknownC0943C();
    PlaySfx(Sfx.Cursor1);
    const(ubyte)* textPtr;
    textPtr = TalkTo();
    if (textPtr is null) {
        textPtr = Check();
        if (textPtr is null) {
            textPtr = TextNoProblemHere;
        }
    }
    DisplayText(textPtr);
    ClearInstaprint();
    HideHPPPWindows();
    UnknownC1008E();
    do {
        Win_Tick();
    } while (Unknown7EB4A8 != -1);
    UnknownC09451();
}

/// $C10C72
void UnknownC438A5F(short arg1, short arg2) {
    UnknownC438A5(arg1, arg2);
}

/// $C13CA1
void OpenHPPPDisplay() {
    UnknownC0943C();
    PlaySfx(Sfx.Cursor1);
    OpenHpAndWallet();
    do {
        Win_Tick();
        if ((pad_press[0] & (PAD_A | PAD_L)) != 0) {
            OpenMenuButton();
            return;
        }
    } while ((pad_press[0] & (PAD_B | PAD_SELECT)) != 0);
    PlaySfx(Sfx.Cursor2);
    ClearInstaprint();
    HideHPPPWindows();
    UnknownC1008E();
    Win_Tick();
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
void DebugYButtonFlag();

/// $C13E0E
void DebugYButtonGuide();

/// $C13EE7
void DebugYButtonGoods();

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
short UnknownC14070(ubyte*, ubyte*);

/// $C140B0
void* CC1C01(DisplayTextState* arg1, ushort arg2);

/// $C140CF
void* CC1C11(DisplayTextState* arg1, ushort arg2);

/// $C140EF
void* CC1C09(DisplayTextState* arg1, ushort arg2);

/// $C140F9
void* CC1C00(DisplayTextState* arg1, ushort arg2);

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
        CCArgumentStorage[CCArgumentGatheringLoopCounter++] = arg1.textptr[0];
        return &CC04;
    } else {
        setEventFlag(((cast(ushort)arg1.textptr[0]) << 8) || (CCArgumentStorage[0]), 1);
        return null;
    }
}

/// $C142AD - [05 XX XX] clear flag
void* CC05(DisplayTextState* arg1, ushort arg2) {
    if (CCArgumentGatheringLoopCounter == 0) {
        CCArgumentStorage[CCArgumentGatheringLoopCounter++] = arg1.textptr[0];
        return &CC05;
    } else {
        setEventFlag(((cast(ushort)arg1.textptr[0]) << 8) || (CCArgumentStorage[0]), 0);
        return null;
    }
}

/// $C142F5 - [06 XX XX ptr] - jump if flag set
void* CC06(DisplayTextState* arg1, ushort arg2) {
    if (CCArgumentGatheringLoopCounter == 0) {
        CCArgumentStorage[CCArgumentGatheringLoopCounter++] = arg1.textptr[0];
        return &CC06;
    } else if (getEventFlag(((cast(ushort)arg1.textptr[0]) << 8) || (CCArgumentStorage[0])) != 0) {
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
        CCArgumentStorage[CCArgumentGatheringLoopCounter++] = arg1.textptr[0];
        return &CC07;
    } else {
        SetWorkingMemory(WorkingMemory(getEventFlag(((cast(ushort)arg1.textptr[0]) << 8) || (CCArgumentStorage[0]))));
        return null;
    }
}

/// $C143B8
void* CC1C08(DisplayTextState* arg1, ushort arg2);

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
void* CC1F52(DisplayTextState* arg1, ushort arg2);

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
void* CC1C07(DisplayTextState* arg1, ushort arg2);

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
void* CC1A00(DisplayTextState* arg1, ushort arg2);

/// $C1467D
void* CC1A01(DisplayTextState* arg1, ushort arg2);

/// $C146BF
void* CC1C05(DisplayTextState* arg1, ushort arg2);

/// $C146DE
void* CC1C06(DisplayTextState* arg1, ushort arg2);

/// $C14723
void* CC1910(DisplayTextState* arg1, ushort arg2);

/// $C14751
void* CC1F00(DisplayTextState* arg1, ushort arg2);

/// $C147A0
void* CC1F01(DisplayTextState* arg1, ushort arg2);

/// $C147AB
void* CC1F02(DisplayTextState* arg1, ushort arg2);

/// $C147CC
void* CC1911(DisplayTextState* arg1, ushort arg2);

/// $C14819
void* CC1928(DisplayTextState* arg1, ushort arg2);

/// $C1488D
void* CC1C03(DisplayTextState* arg1, ushort arg2);

/// $C148AC
void* CC1D02(DisplayTextState* arg1, ushort arg2);

/// $C148E9
void* CC1D08(DisplayTextState* arg1, ushort arg2);

/// $C1494A
void* CC1D09(DisplayTextState* arg1, ushort arg2);

/// $C149B6
void* CC1E00(DisplayTextState* arg1, ushort arg2);

/// $C14A03
void* CC1E01(DisplayTextState* arg1, ushort arg2);

/// $C14A50
void* CC1E02(DisplayTextState* arg1, ushort arg2);

/// $C14A9D
void* CC1E03(DisplayTextState* arg1, ushort arg2);

/// $C14AEA
void* CC1E04(DisplayTextState* arg1, ushort arg2);

/// $C14B37
void* CC1E05(DisplayTextState* arg1, ushort arg2);

/// $C14B84
void* CC1E06(DisplayTextState* arg1, ushort arg2);

/// $C14BD1
void* CC1E07(DisplayTextState* arg1, ushort arg2);

/// $C14C1E
void* CC1D00(DisplayTextState* arg1, ushort arg2);

/// $C14C86
void* CC1D01(DisplayTextState* arg1, ushort arg2);

/// $C14CEE
void* CC1D03(DisplayTextState* arg1, ushort arg2);

/// $C14D24
void* CC1D04(DisplayTextState* arg1, ushort arg2);

/// $C14D93
void* CC1D05(DisplayTextState* arg1, ushort arg2);

/// $C14DFB
void* CC1F20(DisplayTextState* arg1, ushort arg2);

/// $C14E8C
void* CC1F21(DisplayTextState* arg1, ushort arg2);

/// $C14EAB
void* CC10(DisplayTextState* arg1, ushort arg2) {
    UnknownC100D6(arg2);
    return null;
}

/// $C14EB5
void* CC1A06(DisplayTextState* arg1, ushort arg2);

/// $C14EF8
void* CC1D0A(DisplayTextState* arg1, ushort arg2);

/// $C14F33
void* CC1D0B(DisplayTextState* arg1, ushort arg2);

/// $C14F6F
void* CC1F81(DisplayTextState* arg1, ushort arg2);

/// $C14FD7
void* CC1C02(DisplayTextState* arg1, ushort arg2);

/// $C15007
void* CC1916(DisplayTextState* arg1, ushort arg2);

/// $C1506F
void* CC1905(DisplayTextState* arg1, ushort arg2);

/// $C150E4
void* CC1D0D(DisplayTextState* arg1, ushort arg2);

/// $C1516B
void* CC1C14(DisplayTextState* arg1, ushort arg2);

/// $C151FC
void* CC1C15(DisplayTextState* arg1, ushort arg2);

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
void* CC1C0A(DisplayTextState* arg1, ushort arg2);

/// $C15384
void* CC1918(DisplayTextState* arg1, ushort arg2);

/// $C15494
void* CC1F60(DisplayTextState* arg1, ushort arg2);

/// $C1549E
void* CC1A05(DisplayTextState* arg1, ushort arg2);

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
void* CC1C0B(DisplayTextState* arg1, ushort arg2);

/// $C15659
void* CC1D0E(DisplayTextState* arg1, ushort arg2);

/// $C156DB
void* CC1D0F(DisplayTextState* arg1, ushort arg2);

/// $C1575D
void* CC1D10(DisplayTextState* arg1, ushort arg2);

/// $C157CD
void* CC1D11(DisplayTextState* arg1, ushort arg2);

/// $C15838
void* CC1F83(DisplayTextState* arg1, ushort arg2);

/// $C158A5
void* CC1D12(DisplayTextState* arg1, ushort arg2);

/// $C158FE
void* CC1D13(DisplayTextState* arg1, ushort arg2);

/// $C1597F
void* CC1919(DisplayTextState* arg1, ushort arg2);

/// $C159F9
void* CC1D14(DisplayTextState* arg1, ushort arg2);

/// $C15B0E
void* CC191A(DisplayTextState* arg1, ushort arg2);

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
void* CC1C0C(DisplayTextState* arg1, ushort arg2);

/// $C15BCA
void* CC1D15(DisplayTextState* arg1, ushort arg2);

/// $C15C36
void* CC191B(DisplayTextState* arg1, ushort arg2);

/// $C15C58
void* CC1F71(DisplayTextState* arg1, ushort arg2);

/// $C15C85
void* CC1D06(DisplayTextState* arg1, ushort arg2);

/// $C15D6B
void* CC1D07(DisplayTextState* arg1, ushort arg2);

/// $C15E5C
void* CC1D17(DisplayTextState* arg1, ushort arg2);

/// $C15F71
void* CC1F11(DisplayTextState* arg1, ushort arg2);

/// $C15F91
void* CC1F12(DisplayTextState* arg1, ushort arg2);

/// $C15FF7
void* CC191C(DisplayTextState* arg1, ushort arg2);

/// $C16080
void* CC191D(DisplayTextState* arg1, ushort arg2);

/// $C16124
void* CC1D18(DisplayTextState* arg1, ushort arg2);

/// $C16143
void* CC1921(DisplayTextState* arg1, ushort arg2);

/// $C16172
void* CC1D19(DisplayTextState* arg1, ushort arg2);

/// $C161D1
void* CC1C12(DisplayTextState* arg1, ushort arg2);

/// $C161F0
void* CC1D21(DisplayTextState* arg1, ushort arg2);

/// $C16308
void* CC1FC0(DisplayTextState* arg1, ushort arg2);

/// $C163A7
void* CC1FD0(DisplayTextState* arg1, ushort arg2);

/// $C163FD
void* CC1F13(DisplayTextState* arg1, ushort arg2);

/// $C1646E
void* CC1F14(DisplayTextState* arg1, ushort arg2);

/// $C16490
void* CC1F16(DisplayTextState* arg1, ushort arg2);

/// $C16509
void* CC1F17(DisplayTextState* arg1, ushort arg2);

/// $C16582
void* CC1F18(DisplayTextState* arg1, ushort arg2);

/// $C165AA
void* CC1F19(DisplayTextState* arg1, ushort arg2);

/// $C165D2
void* CC1F1A(DisplayTextState* arg1, ushort arg2);

/// $C1662A
void* CC1F1B(DisplayTextState* arg1, ushort arg2);

/// $C1666D
void* CC1F1C(DisplayTextState* arg1, ushort arg2);

/// $C166DD
void* CC1F1D(DisplayTextState* arg1, ushort arg2);

/// $C166FE
void* CC1FE1(DisplayTextState* arg1, ushort arg2);

/// $C16744
void* CC1F15(DisplayTextState* arg1, ushort arg2);

/// $C167D6
void* CC1F1E(DisplayTextState* arg1, ushort arg2);

/// $C1683B
void* CC1F1F(DisplayTextState* arg1, ushort arg2);

/// $C168A0
void* CC1922(DisplayTextState* arg1, ushort arg2);

/// $C16947
void* CC1923(DisplayTextState* arg1, ushort arg2);

/// $C169F7
void* CC1F62(DisplayTextState* arg1, ushort arg2);

/// $C16A01
void* CC1E08(DisplayTextState* arg1, ushort arg2);

/// $C16A7B
void* CC1924(DisplayTextState* arg1, ushort arg2);

/// $C16B2B
void* CC1FE4(DisplayTextState* arg1, ushort arg2);

/// $C16BA4
void* CC1FE5(DisplayTextState* arg1, ushort arg2);

/// $C16BAF
void* CC1FE6(DisplayTextState* arg1, ushort arg2);

/// $C16BF2
void* CC1FE7(DisplayTextState* arg1, ushort arg2);

/// $C16C35
void* CC1FE8(DisplayTextState* arg1, ushort arg2);

/// $C16C40
void* CC1FE9(DisplayTextState* arg1, ushort arg2);

/// $C16C83
void* CC1FEA(DisplayTextState* arg1, ushort arg2);

/// $C16CC6
void* CC1FEB(DisplayTextState* arg1, ushort arg2);

/// $C16D14
void* CC1FEC(DisplayTextState* arg1, ushort arg2);

/// $C16D62
void* CC1FEE(DisplayTextState* arg1, ushort arg2);

/// $C16DA5
void* CC1FEF(DisplayTextState* arg1, ushort arg2);

/// $C16DE8
void* CC1F63(DisplayTextState* arg1, ushort arg2);

/// $C16EBF
void* CC1FF1(DisplayTextState* arg1, ushort arg2);

/// $C16F2F
void* CC1FF2(DisplayTextState* arg1, ushort arg2);

/// $C16F9F
void* CC1925(DisplayTextState* arg1, ushort arg2);

/// $C16FD1
void* CC1F23(DisplayTextState* arg1, ushort arg2);

/// $C17037
void* CC1926(DisplayTextState* arg1, ushort arg2);

/// $C17058
void* CC1D0C(DisplayTextState* arg1, ushort arg2);

/// $C1711C
void* CC1F66(DisplayTextState* arg1, ushort arg2);

/// $C17233
void* CC1F67(DisplayTextState* arg1, ushort arg2);

/// $C17254
void* CC1F04(DisplayTextState* arg1, ushort arg2);

/// $C17274
void* CC1D24(DisplayTextState* arg1, ushort arg2);

/// $C172BC
void* CC1F40(DisplayTextState* arg1, ushort arg2);

/// $C172DA
void* CC1F41(DisplayTextState* arg1, ushort arg2);

/// $C17304
void* CC1FD2(DisplayTextState* arg1, ushort arg2);

/// $C17325
void* CC1FF3(DisplayTextState* arg1, ushort arg2);

/// $C1737D
void* CC1FF4(DisplayTextState* arg1, ushort arg2);

/// $C173C0
void* CC1C13(DisplayTextState* arg1, ushort arg2);

/// $C1741F
void* CC1F07(DisplayTextState* arg1, ushort arg2);

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
            Win_Tick();
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

/// $C19441
ushort UnknownC19441();

/// $C1952F
void UnknownC1952F(short);

/// $C19A11
uint UnknownC19A11(short, short);

/// $C19A43
ushort UnknownC19A43();

/// $C1AA18
void UnknownC1AA18() {
    UnknownC20A20(&Unknown7E9C8A);
    CreateWindowN(Window.CarriedMoney);
    UnknownC10EB4(5);
    SetInstaprint();
    ClearFocusWindow();
    UnknownC4507A(&gameState.moneyCarried);
    ClearInstaprint();
    UnknownC20ABC(&Unknown7E9C8A);
}

/// $C1AAFA
ushort UnknownC1AAFA();

/// $C1AC00
ushort UnknownC1AC00();

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
void UnknownC1ACF8(ubyte arg1) {
    Unknown7E9D11 = arg1;
}

/// $C1AD02
ubyte UnknownC1AD02() {
    return Unknown7E9D11;
}

/// $C1AD26
uint UnknownC1AD26() {
    return Unknown7E9D12;
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

/// $C1BEC6
void GetOffBicycle() {
    CreateWindowN(Window.TextStandard);
    SetWorkingMemory(WorkingMemory(1));
    DisplayText(TextGotOffBike);
    CloseFocusWindowN();
    Win_Tick();
    UnknownC03CFD();
}

/// $C1D109
void LevelUpChar(short, short);

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
    DisplayText(TextAlertConditionCritical);
    CloseFocusWindowN();
    Win_Tick();
    UnknownC09451();
    currentAttacker = x02;
}

/// $C1DC66
void DisplayTextWait(const(ubyte)*, uint);

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
void UnknownC1DCCB(short);

/// $C1DCCC
void UnknownC43573F(short);

/// $C1DD3B
void ShowHPPPWindowsF();

/// $C1DD47
void CreateWindow(short id) {
    CreateWindowN(id);
}

/// $C1DD59
void CloseFocusWindow() {
    CloseFocusWindowN();
}

/// $C1DD5F
void UnknownC1DD5F();

/// $C1DD70
void UnknownC1AC4AF(ubyte* arg1, short arg2) {
    UnknownC1AC4A(arg1, arg2);
}

/// $C1DD76
void UnknownC1ACA1F(ubyte* arg1, short arg2) {
    UnknownC1ACA1(arg1, arg2);
}

/// $C1DD7C
void UnknownC1ACF8F(short);

/// $C1DD9F
void UnknownC1DD9F(const(ubyte)*);

/// $C1DDC6
ushort RemoveItemFromInventoryF(ushort character, ushort id) {
    return RemoveItemFromInventory(character, id);
}

/// $C1DDD3
void UnknownC3E6F8F();

/// $C1E1A5
short EnemySelectMode(short);

/// $C1EAA6
short EnterYourNamePlease(short);

/// $C1F805
void FileMenuLoop();

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
    ClearInstaprint();
    Win_Tick();
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
