module earthbound.bank01;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.bank15;
import earthbound.bank2F;
import earthbound.globals;

void UnknownC10004(ubyte* arg1) {
    UnknownC0943C();
    DisplayText(arg1);
    do {
        Win_Tick();
    } while (Unknown7EB4A8 != -1);
    UnknownC09451();
}

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
void Win_SetFocus(short window_id);

// $C10084
void CloseFocusWindowN() {
    CloseWindow(CurrentFocusWindow);
}

// $C104EE
void CreateWindowN(short id);

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

// $C10EB4
void UnknownC10EB4(short);

// $C10C55
short UnknownC10C55(uint*);

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

        dp04 = &menu_options[dp24.current_option]; // field2B

        while (dp22) {
            dp22--;
            dp04 = &menu_options[dp04.next]; // field02
        }

        SetInstaprint();
        UnknownC43CD2(dp04, dp04.text_x, dp04.text_y); // field08, field0A
        UnknownC43BB9(-1, 0, dp04.label.ptr); // field13
    } else {
        dp20 = 0;
        dp04 = &menu_options[dp24.current_option]; // field2B
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
            if (dp1E == menu_options[dp04.prev].page) { // prev=field04
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
    MenuOpt *dp22_opt = &menu_options[dp24.current_option]; // Reuses dp22, 16-bit pointer

    int tmp = dp1C & 0xFF;
    dp1C = dp1C >> 8;

    while ((dp22_opt.text_x != tmp) || (dp22_opt.text_y != dp1C) || ((dp22_opt.page != dp24.menu_page) && (dp22_opt.page != 0))) {
        ++dp02;
        dp22_opt = &menu_options[dp22_opt.next]; // field02
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

// $C13CA1
void UnknownC438A5F(short arg1, short arg2) {
    UnknownC438A5(arg1, arg2);
}
// $C13CA1
void OpenHPPPDisplay();

// $C13CE5
void ShowTownMap() {
    if (FindItemInInventory(0xFF, ItemID.TOWN_MAP) == 0) {
        return;
    }
    UnknownC0943C();
    DisplayTownMap();
    UnknownC09451();
}

// $C186B1 - Call a text script (script_ptr)
void DisplayText(ubyte* script_ptr);

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
void GainEXP(ubyte, short, uint);

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
    //DisplayText(TextAlertConditionCritical);
    CloseFocusWindowN();
    Win_Tick();
    UnknownC09451();
    currentAttacker = x02;
}

// $C1DCCB
void DisplayInBattleText(const(ubyte)*);

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

// $C1DD7C
void UnknownC1ACF8F(short);

// $C1DD9F
void UnknownC1DD9F(const(ubyte)*);

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
