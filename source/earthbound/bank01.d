module earthbound.bank01;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.bank2F;
import earthbound.globals;

void UNKNOWN_C10004(void* arg1);
	//ubyte[4] unknown;
void UNKNOWN_C10048(ushort arg1);

// $C1007E - Set the focused window
void     Win_SetFocus(short window_id);

// $C10D60 - Put a tile on the focused window -- How is this different from "PrintIcon" ($C43F77)?
void     Func_C10D60(short tile);

// $C10FA3 - Clears the focused window
void     Win_ClearFocus();

// $C10FEA - Sets the text color for the focused window
void     Win_SetTextColor(short window_id);

// $C1134B - Opens the HP/PP and wallet windows
void     OpenHpAndWallet();

// $C1163C - Prints the options into the focused window
void     Win_PrintOptions();

// $C118E7 - Get target X/Y window positions after menu cursor movement
//           Returns low byte = X, high byte = Y
//           (arguments unknown)
ushort Func_C118E7(short, short, short, short, short, short, short);

// $C1196A - Handle menu selection on the focused window
int Win_MenuSelection(int cancelable) {
    // $28 = cancelable

    int dp26 = focused_window_id;
    if (dp26 == -1) return 0;

    WinStat *dp24 = focused_window_stat; // 16-bit pointer

    if (var5E79) {
        dp24.current_option = var9688;  // field2B
        dp24.selected_option = var968A; // field2F
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
        Func_C43CD2(dp04, dp04.text_x, dp04.text_y); // field08, field0A
        Func_C43BB9(-1, 0, dp04.label.ptr); // field13
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
    if (var5E79) {
        dp04.text_x = var9684; // field08
        dp04.text_y = var9686; // field0A
    }

    Func_C43CD2(dp04, dp04.text_x, dp04.text_y);
    Win_SetTextColor(1);
    Func_C10D60(0x21);   // Put cursor on the window maybe?
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
        Func_C12E42();

        if (pad1_press & PAD_UP) {
            dp1C = Func_C118E7(dp04.text_x, dp04.text_y, -1, 0, 3, dp04.text_x, dp24.height);
            goto label3;
        }

        if (pad1_press & PAD_LEFT) {
            dp1C = Func_C118E7(dp04.text_x, dp04.text_y, 0, -1, 2, dp24.width, dp04.text_y);
            goto label3;
        }

        if (pad1_press & PAD_DOWN) {
            dp1C = Func_C118E7(dp04.text_x, dp04.text_y, 1, 0, 3, dp04.text_x, -1);
            goto label3;
        }

        if (pad1_press & PAD_RIGHT) {
            dp1C = Func_C118E7(dp04.text_x, dp04.text_y, 0, 1, 2, -1, dp04.text_y);
            goto label3;
        }

        if (pad1_repeat & PAD_UP) {
            dp1C = Func_C20B65(dp04.text_x, dp04.text_y, -1, 0, 3);
            goto label3;
        }

        if (pad1_repeat & PAD_LEFT) {
            dp1C = Func_C20B65(dp04.text_x, dp04.text_y, 0, -1, 2);
            goto label3;
        }

        if (pad1_repeat & PAD_DOWN) {
            dp1C = Func_C20B65(dp04.text_x, dp04.text_y, 1, 0, 3);
            goto label3;
        }

        if (pad1_repeat & PAD_RIGHT) {
            dp1C = Func_C20B65(dp04.text_x, dp04.text_y, 0, 1, 2);
        }

        if (pad1_press & (PAD_A|PAD_L)) {
            SetInstaprint();
            if (dp04.page) {        // field06
                PlaySfx(dp04.sfx);  // field0E
                Func_C43CD2(dp04, dp04.text_x, dp04.text_y);
                Func_C10D60(0x2F);   // Remove cursor from window?
                Win_SetTextColor(6);

                if (var5E6E) {
                    if (var7EB49D != 1) {
                        if (focused_window_id == 19) {
                            Func_C43B15();
                        } else {
                            Func_C43BB9(4, 1, dp04.label.ptr); // field13
                        }
                    } else {
                        Func_C43BB9(-1, 1, dp04.label.ptr); // field13;
                    }
                } else {
                    Func_C43B15();
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
            Func_EF0115(cast(short)dp26);
            Win_Tick();

            Win_PrintOptions(); // Print the options for the new page
            SetInstaprint();
            goto label1;        // Back to the start....
        }

        if ((pad1_press & (PAD_B|PAD_SELECT)) && cancelable == 1) {
            PlaySfx(2);
            return 0;
        }

        ++dp22;
        if (window_table[0] == window_tail) { // If the field/overworld commands window is the last opened window...
            if (dp22 > 60) {                  // If 60 frames have passed
                if (window_table[10] == -1) { // If the wallet window is not open
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

    Func_C43CD2(dp04, dp04.text_x, dp04.text_y);
    Func_C10D60(0x2F); // Remove cursor from window?

    dp20 = dp02;
    dp04 = dp22_opt;
    goto label1; // Aaaand back to the start....
}

// $C12DD5 - Tick windows (draw windows if necessary, roll HP/PP, advance RNG, wait a frame)
void     Win_Tick();

// $C12E42 - Looks like a "minimal" window tick function, doesn't advance RNG
void     Func_C12E42();

// $C12E63
void DebugYButtonMenu();

// $C133B0
void OpenMenuButton();

// $C13---
void OpenMenuButtonCheckTalk();

// $C13CA1
void OpenHPPPDisplay();

// $C13CE5
void ShowTownMap();

// $C186B1 - Call a text script (script_ptr)
void     DisplayText(ubyte* script_ptr);

// $C1BEC6
void     GetOffBicycle();
