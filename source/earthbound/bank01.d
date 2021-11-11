module earthbound.bank01;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.bank07;
import earthbound.bank08;
import earthbound.bank15;
import earthbound.bank2F;
import earthbound.globals;

// $C10000
void UnknownC10000() {
    HideHPPPWindows();
}

// $C10004
void UnknownC10004(ubyte* arg1) {
    UnknownC0943C();
    DisplayText(arg1);
    do {
        Win_Tick();
    } while (Unknown7EB4A8 != -1);
    UnknownC09451();
}

// $C10036
void EnableBlinkingTriangle(ushort arg1) {
    BlinkingTriangleFlag = arg1;
}

// $C1003C
void ClearBlinkingPrompt() {
    BlinkingTriangleFlag = 0;
}

// $C10048
void UnknownC10048(ushort arg1) {
    Unknown7E964F = arg1;
}

// $C1004E
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

// $C1007E - Set the focused window
void Win_SetFocus(short id) {
    CurrentFocusWindow = id;
}

// $C10084
void CloseFocusWindowN() {
    CloseWindow(CurrentFocusWindow);
}

// $C1008E
void UnknownC1008E();

// $C10166
void CC1314(short, short);

// $C10301
WinStat* GetActiveWindowAddress() {
    if (window_head == -1) {
        return &Unknown7E85FE;
    }
    return &WindowStats[WindowTable[CurrentFocusWindow]];
}

// $C1042E
void IncrementSecondaryMemory();

// $C1045D
void SetWorkingMemory(uint);

// $C104B5
short GetTextX();

// $C104EE
void CreateWindowN(short id) {
    //x14 = id
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

// $C1078D
void UnknownC1078D() {
    CopyToVramAlt(0, 0x240, 0x7E40, cast(ubyte*)&Unknown7E827E[0]);
}

// $C107AF
void UnknownC107AF(short window_id);

// $C10A04
void ShowHPPPWindows() {
    UnknownC3E6F8();
    Unknown7E89C9 = 1;
    Unknown7E9623 = 1;
    Unknown7E9647 = -1;
}

// $C10A1D
void HideHPPPWindows();

// $C10BD3
void* CC12(const(ubyte)**, ushort);

// $C10EB4
void UnknownC10EB4(short);

// $C10C55
short UnknownC10C55(uint*);

// $C10C79
void PrintNewLineF() {
    PrintNewLine();
}

// $C10C80
void UnknownC10BA1F(short);

// $C10C86
void PrintLetterF(short arg1) {
    PrintLetter(arg1);
}
// $C10CB6
void PrintLetter(short arg1);

// $C10D60 - Put a tile on the focused window -- How is this different from "PrintIcon" ($C43F77)?
void UnknownC10D60(short tile);

// $C10F40
void UnknownC10F40(short window) {
    if (window == -1) {
        return;
    }
    //x10 = WindowStats[WindowTable[window]];
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

// $C10FA3 - Clears the focused window
void Win_ClearFocus() {
    UnknownC10F40(CurrentFocusWindow);
}

// $C10FEA - Sets the text color for the focused window
void Win_SetTextColor(short window_id);

// $C1134B - Opens the HP/PP and wallet windows
void OpenHpAndWallet() {
    ShowHPPPWindows();
    UnknownC1AA18();
}

// $C11383
void UnknownC11383();

// $C1163C - Prints the options into the focused window
void Win_PrintOptions();

// $C118E7 - Get target X/Y window positions after menu cursor movement
//           Returns low byte = X, high byte = Y
//           (arguments unknown)
ushort UnknownC118E7(short, short, short, short, short, short, short);

// $C1196A - Handle menu selection on the focused window
int Win_MenuSelection(int cancelable) {
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
        Win_SetFocus(cast(short)dp26);
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
            Win_ClearFocus(); // Clear the focused window

            dp1E = dp24.menu_page;
            if (dp1E == MenuOptions[dp04.prev].page) { // prev=field04
                dp24.menu_page = 1;
            } else {
                dp24.menu_page = cast(short)(dp1E+1);
            }

            ClearInstaprint();
            UnknownEF0115(cast(short)dp26);
            Win_Tick();

            Win_PrintOptions(); // Print the options for the new page
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
                    Win_SetFocus(0);
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

// $C12DD5 - Tick windows (draw windows if necessary, roll HP/PP, advance RNG, wait a frame)
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

// $C12E42 - Looks like a "minimal" window tick function, doesn't advance RNG
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

// $C12E63
void DebugYButtonMenu();

// $C133B0
void OpenMenuButton();

// $C13---
void OpenMenuButtonCheckTalk();

// $C10C72
void UnknownC438A5F(short arg1, short arg2) {
    UnknownC438A5(arg1, arg2);
}

// $C13CA1
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

// $C13CE5
void ShowTownMap() {
    if (FindItemInInventory(0xFF, ItemID.TOWN_MAP) == 0) {
        return;
    }
    UnknownC0943C();
    DisplayTownMap();
    UnknownC09451();
}

// $C14012
short UnknownC14012();

// $C14049
void UnknownC14049();

// $C14103
void* CC0A(const(ubyte)**, ushort);

// $C141D0
void* CC09(const(ubyte)**, ushort);

// $C14265
void* CC04(const(ubyte)**, ushort);

// $C142AD
void* CC05(const(ubyte)**, ushort);

// $C142F5
void* CC06(const(ubyte)**, ushort);

// $C1435F
void* CC07(const(ubyte)**, ushort);

// $C143D6
void* CC08(const(ubyte)**, ushort);

// $C14558
void* CC0B(const(ubyte)**, ushort);

// $C14591
void* CC0C(const(ubyte)**, ushort);

// $C145EF
void* CC0D(const(ubyte)**, ushort);

// $C1461A
void* CC0E(const(ubyte)**, ushort);

// $C14EAB
void* CC10(const(ubyte)**, ushort);

// $C1790B
void* CC18Tree(const(ubyte)**, ushort);

// $C179AA
void* CC19Tree(const(ubyte)**, ushort);

// $C17B56
void* CC1ATree(const(ubyte)**, ushort);

// $C17C36
void* CC1BTree(const(ubyte)**, ushort);

// $C17D94
void* CC1CTree(const(ubyte)**, ushort);

// $C17F11
void* CC1DTree(const(ubyte)**, ushort);

// $C1811F
void* CC1ETree(const(ubyte)**, ushort);

// $C181BB
void* CC1FTree(const(ubyte)**, ushort);

// $C1866D
const(ubyte)** UnknownC1866D(short, const(ubyte)*);

// $C1869D
void UnknownC1869D(const(ubyte)**, const(ubyte)*);

// $C186B1 - Call a text script (script_ptr)
const(ubyte)* DisplayText(const(ubyte)* script_ptr) {
    void* function(const(ubyte)**, ushort) x1E = null;
    ushort x14;
    const(ubyte)* x1A = &BattleBackRowText[12];
    if (script_ptr is null) {
        return script_ptr;
    }
    const(ubyte)** x12 = UnknownC1866D(UnknownC14012(), script_ptr);
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
            x14 = **x12;
            (*x12)++;
        }
        if (x1E !is null) {
            x1E = cast(typeof(x1E))x1E(x12, x14);
            continue;
        }
        switch (x14) {
            case 0x15:
                const(ubyte)* tmp = &compressedText[0][**x12][0];
                (*x12)++;
                x14 = tmp[0];
                tmp++;
                break;
            case 0x16:
                const(ubyte)* tmp = &compressedText[1][**x12][0];
                (*x12)++;
                x14 = tmp[0];
                tmp++;
                break;
            case 0x17:
                const(ubyte)* tmp = &compressedText[2][**x12][0];
                (*x12)++;
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
                    SetWorkingMemory(Win_MenuSelection(1));
                    UnknownC11383();
                    break;
                case 0x12:
                    x1E = &CC12;
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
    UnknownC1869D(x12, *x12);
    UnknownC14049();
    return *x12;
}

// $C18B2C
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

// $C18BC6
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

// $C18E5B
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
        RemoveCharFromParty(ItemData[i].strength);
        UnknownC216DB();
    }
    if ((ItemData[i].flags & ItemFlags.Transform) != 0) {
        UnknownC3EB1C(i);
    }
    return character;
}

// $C18E5B
ushort TakeItemFromSpecificCharacter(ushort character, ushort item) {
    for (short i = 0; 14 > i; i++) {
        if (PartyCharacters[character - 1].items[i] == item) {
            return RemoveItemFromInventory(character, i);
        }
    }
    return 0;
}
// $C18EAD
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

// $C1AA18
void UnknownC1AA18() {
    UnknownC20A20(&Unknown7E9C8A);
    CreateWindowN(Window.CarriedMoney);
    UnknownC10EB4(5);
    SetInstaprint();
    Win_ClearFocus();
    UnknownC4507A(&gameState.moneyCarried);
    ClearInstaprint();
    UnknownC20ABC(&Unknown7E9C8A);
}

// $C1AC4A
void UnknownC1AC4A(PartyCharacter*, short);

// $C1BEC6
void GetOffBicycle();

// $C1D9E9
void GainEXP(short, short, uint);

// $C1DBBB
void ShowHPAlert(short arg1) {
    Battler battler;
    Battler* x02 = currentAttacker;
    battler.allyOrEnemy = 0;
    battler.id = cast(ubyte)arg1;
    currentAttacker = &battler;
    UnknownC0943C();
    CreateWindowN(Window.TextStandard);
    UnknownC1AC4A(&PartyCharacters[arg1], 5);
    DisplayText(TextAlertConditionCritical);
    CloseFocusWindowN();
    Win_Tick();
    UnknownC09451();
    currentAttacker = x02;
}

// $C1DC66
void DisplayTextWait(const(ubyte)*, uint);

// $C1DCCB
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

// $C1DCCB
void UnknownC1DCCB(short);

// $C1DCCC
void UnknownC43573F(short);

// $C1DDD3
void UnknownC3E6F8F();

// $C1DD47
void CreateWindow(short id) {
    CreateWindowN(id);
}

// $C1DD59
void CloseFocusWindow() {
    CloseFocusWindowN();
}

// $C1DD5F
void UnknownC1DD5F();

// $C1DD3B
void ShowHPPPWindowsF();

// $C1DD76
void UnknownC1ACA1F(ubyte*, short);

// $C1DD7C
void UnknownC1ACF8F(short);

// $C1DD9F
void UnknownC1DD9F(const(ubyte)*);

// $C1DDC6
ushort RemoveItemFromInventoryF(ushort character, ushort id) {
    return RemoveItemFromInventory(character, id);
}

// $C1E1A5
short EnemySelectMode(short);

// $C1F805
void FileMenuLoop();

// $C1FF2C
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

// $C1FF6B
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
