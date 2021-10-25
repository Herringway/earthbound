module earthbound.bank04;

import earthbound.commondefs;
import earthbound.hardware;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank0F;
import earthbound.bank15;
import earthbound.bank18;
import earthbound.bank20;
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.globals;
import core.stdc.string;

// $C40B51
void UnknownC40B51() {
    StopMusic();
    UnknownC08D79(1);
    SetBG3VRAMLocation(BGTileMapSize.normal, 0x4000, 0);
    TM_MIRROR = 4;
    UnknownC08726();
}

// $C40B75
noreturn UnknownC40B75() {
    CopyToVram(0, 0xA00, 0, &Unknown7F0000[0]);
    CopyToVram(0, 0x800, 0x4000, &Unknown7F0000[0x4000]);
    memcpy(&palettes[0][0], &WarningPalette[0], 0x10);
    UnknownC0856B(0x18);
    FadeInWithMosaic(1, 1, 0);
    while (true) {}
}

// $C40BE8
immutable ubyte[512] UnknownC40BE8 = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

// $C41A9E
short Decomp(const(void)*, void*);

// $C41EFF
short UnknownC41EFF(short, short, short, short);

// $C429E8
void UnknownC429E8(short);

// $C42A1F
immutable short[17] UnknownC42A1F = [
    0x0008,
    0x0008,
    0x000C,
    0x0010,
    0x0018,
    0x0008,
    0x000C,
    0x0008,
    0x0010,
    0x0018,
    0x000C,
    0x0008,
    0x0010,
    0x0018,
    0x0020,
    0x0020,
    0x0020,
];

// $C42A41
immutable short[17] UnknownC42A41 = [
    0x0008,
    0x0008,
    0x0008,
    0x0008,
    0x0008,
    0x0018,
    0x0018,
    0x0018,
    0x0018,
    0x0018,
    0x0020,
    0x0028,
    0x0028,
    0x0028,
    0x0028,
    0x0038,
    0x0048,
];

// $C42AEB
immutable short[17] UnknownC42AEB = [
    0x000A,
    0x0000,
    0x000A,
    0x000A,
    0x000A,
    0x0018,
    0x0018,
    0x0018,
    0x0010,
    0x0010,
    0x0000,
    0x0028,
    0x0020,
    0x0020,
    0x0020,
    0x0000,
    0x0041,
];

// $C42B0D
immutable UnknownC42B0DEntry*[17] UnknownC42B0D;

// $C42F45
void SetPartyTickCallbacks(short leaderEntityID, void function() leaderCallback, void function() partyCallback) {
    EntityTickCallbacks[leaderEntityID] = leaderCallback;
    for (int i = 6; i > 0; i--) {
        EntityTickCallbacks[leaderEntityID++] = partyCallback;
    }
}

// $C42F8C
immutable ushort[88] UnknownC42F8C = [
    0x0000,
    0x0020,
    0x0040,
    0x0060,
    0x0080,
    0x00A0,
    0x00C0,
    0x00E0,
    0x0200,
    0x0220,
    0x0240,
    0x0260,
    0x0280,
    0x02A0,
    0x02C0,
    0x02E0,
    0x0400,
    0x0420,
    0x0440,
    0x0460,
    0x0480,
    0x04A0,
    0x04C0,
    0x04E0,
    0x0600,
    0x0620,
    0x0640,
    0x0660,
    0x0680,
    0x06A0,
    0x06C0,
    0x06E0,
    0x0800,
    0x0820,
    0x0840,
    0x0860,
    0x0880,
    0x08A0,
    0x08C0,
    0x08E0,
    0x0A00,
    0x0A20,
    0x0A40,
    0x0A60,
    0x0A80,
    0x0AA0,
    0x0AC0,
    0x0AE0,
    0x0C00,
    0x0C20,
    0x0C40,
    0x0C60,
    0x0C80,
    0x0CA0,
    0x0CC0,
    0x0CE0,
    0x0E00,
    0x0E20,
    0x0E40,
    0x0E60,
    0x0E80,
    0x0EA0,
    0x0EC0,
    0x0EE0,
    0x1000,
    0x1020,
    0x1040,
    0x1060,
    0x1080,
    0x10A0,
    0x10C0,
    0x10E0,
    0x1200,
    0x1220,
    0x1240,
    0x1260,
    0x1280,
    0x12A0,
    0x12C0,
    0x12E0,
    0x1400,
    0x1420,
    0x1440,
    0x1460,
    0x1480,
    0x14A0,
    0x14C0,
    0x14E0,
];

// $C430EC
void VelocityStore() {
    for (short i = 0; i < 14; i++) {
        horizontalMovementSpeeds[i].down.combined = 0;
        horizontalMovementSpeeds[i].up.combined = 0;
        verticalMovementSpeeds[i].left.combined = 0;
        verticalMovementSpeeds[i].right.combined = 0;
        verticalMovementSpeeds[i].down.combined = 0;
        horizontalMovementSpeeds[i].right.combined = 0;

        verticalMovementSpeeds[i].up.combined = -defaultMovementSpeeds[i].combined;
        horizontalMovementSpeeds[i].left.combined = -defaultMovementSpeeds[i].combined;

        verticalMovementSpeeds[i].downLeft.combined = defaultMovementSpeedsDiagonal[i].combined;
        verticalMovementSpeeds[i].downRight.combined = defaultMovementSpeedsDiagonal[i].combined;
        horizontalMovementSpeeds[i].downRight.combined = defaultMovementSpeedsDiagonal[i].combined;
        horizontalMovementSpeeds[i].upRight.combined = defaultMovementSpeedsDiagonal[i].combined;

        verticalMovementSpeeds[i].upLeft.combined = -defaultMovementSpeedsDiagonal[i].combined;
        verticalMovementSpeeds[i].upRight.combined = -defaultMovementSpeedsDiagonal[i].combined;
        horizontalMovementSpeeds[i].downLeft.combined = -defaultMovementSpeedsDiagonal[i].combined;
        horizontalMovementSpeeds[i].upLeft.combined = -defaultMovementSpeedsDiagonal[i].combined;
    }
}

// $C432B1
void UnknownC432B1() {
    for (short i = 0; i < 0x1E; i++) {
        EntitySurfaceFlags[i] = 0;
    }
    for (short i = 0; i < 6; i++) {
        for (short j = 0; j < 7; j++) {
            PartyCharacters[i].afflictions[j] = 0;
        }
    }
    gameState.partyStatus = 0;
}

// $C43317
void UnknownC43317() {
    for (short i = 0; i < 6; i++) {
        ChosenFourPtrs[i] = &PartyCharacters[i];
    }
}
// $C43568
void UnknownC43568() {
    WaitUntilNextFrame();
    UnknownC2DB3F();
}

// $C43B15 - Unknown, but looks like it resets the color of existing text in the focused window
void UnknownC43B15() {
    WinStat* x12 = &WindowStats[WindowTable[CurrentFocusWindow]];
    ushort* y = &x12.tilemapBuffer[x12.width * x12.text_y * 2];
    ushort x0E;
    for (x0E = cast(ushort)(x12.width - 1); y[x0E] == 0x40; x0E--) {}
    ushort x12_2 = x12.text_x;
    ushort* x = &y[x12_2];
    while (x12_2 < x0E) {
        x[0] &= (x[0] & 0x3FF) | x12.tileAttributes;
        x[x12.width] = (x[x12.width] & 0x3FF) | x12.tileAttributes;
        x++;
        x12_2++;
    }
}

// $C43874
void UnknownC43874(short arg1, short arg2, short arg3) {
    UnknownC43CAA();
    WindowStats[WindowTable[arg1]].text_x = arg2;
    WindowStats[WindowTable[arg1]].text_y = arg3;
}

// $C438A5
void UnknownC438A5(short arg1, short arg2) {
    UnknownC43874(CurrentFocusWindow, arg1, arg2);
}

// $C43BB9 - Unknown, but looks like it prints optionally highlighted text
void UnknownC43BB9(short maxLength, short highlighted, ubyte* text) {
    if (WindowTable[CurrentFocusWindow] == -1) {
        return;
    }
    if ((CurrentFocusWindow != 0x18) && (CurrentFocusWindow != 0x19) && (CurrentFocusWindow != 0x14) && (CurrentFocusWindow != 0x24)) {
        return;
    }
    WinStat* x14 = &WindowStats[WindowTable[CurrentFocusWindow]];
    short x12 = WindowStats[WindowTable[CurrentFocusWindow]].tileAttributes;
    short x10 = WindowStats[WindowTable[CurrentFocusWindow]].text_x;
    ushort* x04 = &WindowStats[WindowTable[CurrentFocusWindow]].tilemapBuffer[WindowStats[WindowTable[CurrentFocusWindow]].text_y * WindowStats[WindowTable[CurrentFocusWindow]].width * 2 + x10];
    while ((*text != 0) && (maxLength != 0)) {
        if (*x04 == 0x40) {
            break;
        }
        if (highlighted != 0) {
            UnknownEF00E6(x04, x14.width, x12);
        } else {
            UnknownEF00BB(x04, x14.width, x12);
        }
        x10++;
        x04++;
        text++;
        maxLength--;
    }
    x14.text_x = x10;
    Unknown7E9622 = 0;
}

// $C43CAA
void UnknownC43CAA() {
    if (++Unknown7E9E25 > 0x33) {
        Unknown7E9E25 = 0;
        Unknown7E9E23 = 0;
    } else {
        Unknown7E9E23 = cast(ushort)(Unknown7E9E25 * 8);
    }
    Unknown7E9654 = 0;
    Unknown7E9652 = Unknown7E9E23;
}

// $C43CD2 - Set text position on focused window (for menu options)
void UnknownC43CD2(MenuOpt* opt, short x, short y) {
    UnknownC438A5F(x, y);
    if (opt.pixel_align != 0) {
        Unknown7E9E23 += opt.pixel_align;
        memset(&Unknown7E3492[Unknown7E9E25][0], 0xFF, 0x20);
    }
    Unknown7E5E79 = 0;
}

//$C43DDB
void UnknownC43DDB(MenuOpt* menuEntry) {
    UnknownC438A5F(menuEntry.text_x, menuEntry.text_y);
    UnknownC43F77(0x2F);
    UnknownC43CAA();
    if (menuEntry.pixel_align != 0) {
        UnknownC43CD2(menuEntry, menuEntry.text_x, menuEntry.text_y);
    }
}

immutable ubyte[0x400] UnknownC43915 = [0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

// $C43D24
void UnknownC43D24(ushort arg1, short arg2) {
    UnknownC438A5F(arg1, arg2);
    if (Unknown7E5E72 == 0) {
        return;
    }
    Unknown7E9E23 += Unknown7E5E72;
    memset(&Unknown7E3492[Unknown7E9E25][0], 0xFF, 0x20);
    Unknown7E5E73 = Unknown7E5E72;
    Unknown7E5E72 = 0;
}

// $C43D75
void UnknownC43D75(ushort arg1, short arg2) {
    Unknown7E5E72 = cast(ubyte)(arg1 & 7);
    UnknownC43D24(arg1 / 8, arg2);
}

// $C43F53
void UnknownC43F53() {
    for (short i = 0; i < 0x20; i++) {
        Unknown7E1AD6[i] = UnknownC20958[i];
    }
}

// $C43F77
void UnknownC43F77(short arg1) {
    if (CurrentFocusWindow == -1) {
        return;
    }
    ushort* x0E = &WindowStats[WindowTable[CurrentFocusWindow]].tilemapBuffer[WindowStats[WindowTable[CurrentFocusWindow]].text_x * WindowStats[WindowTable[CurrentFocusWindow]].text_y];
    UnknownC44E4D(x0E[0]);
    UnknownC44E4D(x0E[WindowStats[WindowTable[CurrentFocusWindow]].width]);
    if (arg1 == 0x2F) {
        Unknown7E5E75 = 0;
    }
    UnknownC10BA1F(arg1);
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
    if ((x != 0) && (Unknown7E9622 == 0) && (arg1 != 0x20)) {
        PlaySfx(Sfx.TextPrint);
    }
    if (Unknown7E9622 == 0) {
        for (short i = cast(short)(SelectedTextSpeed + 1); i != 0; i--) {
            Win_Tick();
        }
    }
}

//$C44963
void UnknownC44963(short arg1) {
    switch (arg1) {
        case 1:
            CopyToVram(0, 0x1800, 0x7000, &Unknown7F0000[0x2000]);
            goto case;
        case 0:
            CopyToVram(0, 0x450, 0x6000, &Unknown7F0000[0]);
            CopyToVram(0, 0x60, 0x6278, &Unknown7F0000[0x4F0]);
            CopyToVram(0, 0xB0, 0x62F8, &Unknown7F0000[0x5F0]);
            CopyToVram(0, 0xA0, 0x6380, &Unknown7F0000[0x700]);
            CopyToVram(0, 0x10, 0x6400, &Unknown7F0000[0x800]);
            CopyToVram(0, 0x10, 0x6480, &Unknown7F0000[0x900]);
            break;
        case 2:
            CopyToVram(0, 0x450, 0x6000, &Unknown7F0000[0]);
            CopyToVram(0, 0x60, 0x6278, &Unknown7F0000[0x4F0]);
            CopyToVram(0, 0xB0, 0x62F8, &Unknown7F0000[0x5F0]);
            CopyToVram(0, 0xA0, 0x6380, &Unknown7F0000[0x700]);
            CopyToVram(0, 0x10, 0x6400, &Unknown7F0000[0x800]);
            CopyToVram(0, 0x10, 0x6480, &Unknown7F0000[0x900]);
            CopyToVram(0, 0x1800, 0x7000, &Unknown7F0000[0x2000]);
            break;
        default: break;
    }
}

immutable ushort[16] UnknownC44AD7 = [
    0xFFFE,
    0xFFFD,
    0xFFFB,
    0xFFF7,
    0xFFEF,
    0xFFDF,
    0xFFBF,
    0xFF7F,
    0xFEFF,
    0xFDFF,
    0xFBFF,
    0xF7FF,
    0xEFFF,
    0xDFFF,
    0xBFFF,
    0x7FFF,
];

// $C44AF7
void UnknownC44AF7(short arg1) {
    short x10 = arg1 & 0x3FF;
    if (UnknownC43915[x10] != 0) {
        return;
    }
    Unknown7E1AD6[x10 >> 4] &= UnknownC44AD7[x10 & 0xF];
}

// $C44B3A
void UnknownC44B3A(short, short, const(void)*);

// $C44E44
void UnknownC44E44() {
    Unknown7E9654 = 0;
    Unknown7E9652 = 0;
}

// $C44E4D
void UnknownC44E4D(short arg1) {
    if ((arg1 & 0x3FF) == 0x40) {
        return;
    }
    if ((arg1 & 0x3FF) == 0x00) {
        return;
    }
    UnknownC44AF7(arg1);
}

// $C44FF3
short UnknownC44FF3(short arg1, short fontID, ubyte* arg3) {
    short result;
    for (short i = 0; i < arg1; i++) {
        // is this really what's happening? what's the point???
        result = cast(short)(Unknown7E5E6D + FontConfigTable[fontID].data[(*(arg3++) - 0x50) & 0x7F] + i);
    }
    return result;
}

// $C4507A
void UnknownC4507A(uint* arg1) {
    ubyte[8] x12;
    if (CurrentFocusWindow == -1) {
        return;
    }
    ubyte Unknown7E5E75Copy = Unknown7E5E75;
    Unknown7E5E75 = 0;
    short x24 = UnknownC10C55(arg1);
    ubyte* x22 = &Unknown7E895A[7 - x24];
    ubyte* x20 = x22;
    short x1E = WindowStats[WindowTable[CurrentFocusWindow]].text_x;
    short x1C = WindowStats[WindowTable[CurrentFocusWindow]].text_y;
    short x04 = Unknown7E5E6D + FontConfigTable[WindowStats[WindowTable[CurrentFocusWindow]].font].data[4];

    for (short i = 0; i < x24; i++) {
        x12[i] = cast(ubyte)(*x22 + 0x60);
        x22++;
    }
    short x18 = cast(short)(x04 + UnknownC44FF3(x24, WindowStats[WindowTable[CurrentFocusWindow]].font, &x12[0]));
    x18 += Unknown7E5E6D;
    Unknown7E5E71 =1;
    UnknownC43D75(cast(short)((WindowStats[WindowTable[CurrentFocusWindow]].width - 1) * 8 - x18), WindowStats[WindowTable[CurrentFocusWindow]].text_y);
    PrintLetterF(0x54);
    while (x24 != 0) {
        PrintLetterF(*(x20++) + 0x60);
        x24--;
    }
    Unknown7E5E71 = 0;
    UnknownC438A5F(cast(short)(WindowStats[WindowTable[CurrentFocusWindow]].width - 1), WindowStats[WindowTable[CurrentFocusWindow]].text_y);
    UnknownC43F77(0x24);
    UnknownC438A5F(x1E, x1C);
    Unknown7E5E75 = Unknown7E5E75Copy;
}

//$C4562F
immutable ubyte[8] PowersOfTwo8Bit = [1 << 0, 1 << 1, 1 << 2, 1 << 3, 1 << 4, 1 << 5, 1 << 6, 1 << 7];

//$C45637
ubyte FindItemInInventory(short arg1, short arg2) {
    for (int i = 0; i < 14; i++) {
        if (PartyCharacters[arg1 - 1].items[i] == arg2) {
            return cast(ubyte)arg1;
        }
    }
    return 0;
}

//$C45683
ubyte FindItemInInventory2(short arg1, short arg2) {
    if (arg1 == 0xFF) {
        for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
            if (FindItemInInventory(gameState.partyMembers[i], arg2) != 0) {
                return gameState.partyMembers[i];
            }
        }
        return 0;
    } else {
        return FindItemInInventory(arg1, arg2);
    }
}

//$C4577D
ubyte ChangeEquippedWeapon(ushort character, ubyte slot) {
    PartyCharacters[character - 1].equipment[EquipmentSlot.Weapon] = slot;
    RecalcCharacterPostmathOffense(character);
    RecalcCharacterPostmathGuts(character);
    RecalcCharacterMissRate(character);
    return PartyCharacters[character - 1].equipment[EquipmentSlot.Weapon];
}

//$C457CA
ubyte ChangeEquippedBody(ushort character, ubyte slot) {
    PartyCharacters[character - 1].equipment[EquipmentSlot.Body] = slot;
    RecalcCharacterPostmathDefense(character);
    RecalcCharacterPostmathSpeed(character);
    CalcResistances(character);
    return PartyCharacters[character - 1].equipment[EquipmentSlot.Body];
}

//$C45815
ubyte ChangeEquippedArms(ushort character, ubyte slot) {
    PartyCharacters[character - 1].equipment[EquipmentSlot.Arms] = slot;
    RecalcCharacterPostmathDefense(character);
    RecalcCharacterPostmathLuck(character);
    CalcResistances(character);
    return PartyCharacters[character - 1].equipment[EquipmentSlot.Arms];
}

//$C45860
ubyte ChangeEquippedOther(ushort character, ubyte slot) {
    PartyCharacters[character - 1].equipment[EquipmentSlot.Other] = slot;
    RecalcCharacterPostmathDefense(character);
    RecalcCharacterPostmathLuck(character);
    CalcResistances(character);
    return PartyCharacters[character - 1].equipment[EquipmentSlot.Other];
}


// wrong name
immutable ushort[7][7] StatusEquipWindowText = [
    [0x0007, 0x0160, 0x0161, 0x0162, 0x0163, 0x0164, 0x0165],
    [0x0166, 0x0167, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0168, 0x0169, 0x0007, 0x0007, 0x0007, 0x0000, 0x0000],
    [0x016A, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0007, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0007, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0007, 0x0007, 0x0007, 0x0007, 0x0000, 0x0000, 0x0000]
];

// ditto
immutable ushort[7][7] StatusEquipWindowText2 = [
    [0x0020, 0x000D, 0x000E, 0x000F, 0x001D, 0x001E, 0x001F],
    [0x001C, 0x012F, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x000C, 0x013F, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x000B, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0000]
];

// $C45E96
void UnknownC45E96() {
    while (DMATransferFlag != 0) {}
    for (short i =0; i < 0x20; i++) {
        Unknown7E9D23[i][0] = 0xFF;
    }
    Unknown7E9E25 = 0;
    Unknown7E9E23 = 0;
    if (++Unknown7E9E27 >= 0x30) {
        Unknown7E9E27 = 0;
    }
    Unknown7E9E29 = 0;
    UnknownC44E44();
}

// $C45F7B
ubyte randMod(ubyte arg1) {
    return cast(ubyte)(rand() % (arg1 + 1));
}

// $C46028
short UnknownC46028(short arg1) {
    for (short i = 0; i < 0x1E; i++) {
        if (EntityTPTEntrySprites[i] == arg1) {
            return i;
        }
    }
    return -1;
}

// $C464B5
short CreatePreparedEntityNPC(short npcID, short actionScript) {
    short result = CreateEntity(NPCConfig[npcID].sprite, actionScript, -1, EntityPreparedXCoordinate, EntityPreparedYCoordinate);
    EntityDirections[result] = EntityPreparedDirection;
    EntityTPTEntries[result] = npcID;
    return result;
}

// $C46507
short CreatePreparedEntitySprite(short sprite, short actionScript) {
    short result = CreateEntity(sprite, actionScript, -1, EntityPreparedXCoordinate, EntityPreparedYCoordinate);
    EntityDirections[result] = EntityPreparedDirection;
    return result;
}

// $C47370
void LoadBackgroundAnimation(short bg, short arg2) {
    UnknownC08726();
    UnknownC08D79(9);
    SetBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0x0000);
    SetBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x1000);
    LoadBattleBG(bg, arg2, 4);
    UnknownC08744();
}

// $C47C3F
//definitely need to check this one over
void LoadWindowGraphics() {
    Decomp(&TextWindowGraphics[0], &Unknown7F0000[0]);
    memcpy(&Unknown7F0000[0x2000], &Unknown7F0000[0x1000], 0x2A00);
    memset(&Unknown7F0000[0x3200], 0, 0x600);
    if (TextWindowProperties[gameState.textFlavour - 1].unknown == 8) {
        Decomp(&FlavouredTextGraphics[0], &Unknown7F0000[0x100]);
    }
    ushort* x24 = cast(ushort*)&Unknown7F0000[0x2A00];
    for (short i = 0; i < 4; i++) {
        Unknown7E9E25 = 0;
        Unknown7E9E23 = 0;
        memset(&Unknown7E3492[0][0], 0xFF, 0x340);
        Unknown7E9654 = 0;
        Unknown7E9652 = 0;
        ubyte* x0A = &PartyCharacters[i].name[0];
        Unknown7E9E23 = 2;
        for (short j = 0; x0A[0] != 0; j++) {
            UnknownC44B3A(6, FontConfigTable[Font.Battle].width, &FontConfigTable[Font.Battle].graphics[FontConfigTable[Font.Battle].height * ((*x0A - 0x50) & 0x7F)]);
            x0A++;
        }
        for (short j = 0; j < 4; j++) {
            memcpy(&Unknown7F0000[0x2A00 + j * 16 + i * 64], &Unknown7E3492[j][0], 0x10);
            memcpy(&Unknown7F0000[0x2A00 + j * 16 + i * 64 + 0x100], &Unknown7E3492[j][16], 0x10);
        }
    }
    for (short i = 0; i < 0x20; i++) {
        ubyte* x1A = &Unknown7F0000[0x70];
        for (short j = 0; j < 8; j++) {
            x24[0] = (x24[0] & 0xFF00) | ((x24[0] >> 8) ^ 0xFF) | x1A[0];
            x24++;
            x1A++;
        }
    }
    ushort* x16 = cast(ushort*)&Unknown7F0000[0x2C00];

    for (const(ushort)* x24_2 = &StatusEquipWindowText2[0][0]; *x24_2 != 0; x24_2++) {
        if (*x24_2 == 0x20) {
            continue;
        }
        ushort* x0A = cast(ushort*)(&Unknown7F0000[(*x24_2 & 0xFFF0) + *x24_2]);
        ubyte* x1A = &Unknown7F0000[0x70];
        for (short i = 0; i < 8; i++) {
            x16[0] = (x0A[0] & 0xFF00) | ((x0A[0] >> 8) ^ 0xFF) | x1A[0];
            x16[0x100] = (x0A[0x100] & 0xFF00) | ((x0A[0x100] >> 8) ^ 0xFF) | x1A[0x100];
            x16++;
            x0A++;
            x1A += 2;
        }
    }
}

// $C47F87
void UnknownC47F87() {
    switch(ChosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0]) {
        case 0:
        case 1:
            if (Unknown7EB4B6 != 0) {
                goto default;
            }
            memcpy(palettes.ptr, TextWindowDeathPalette.ptr, 0x40);
            break;
        default:
            memcpy(palettes.ptr, (cast(void*)TextWindowFlavourPalettes.ptr) + TextWindowProperties[gameState.textFlavour].offset, 0x40);
            break;
    }
    CurrentTextPalette[0] = 0;
    UnknownC0856B(8);
}

// $C4800B
void UndrawFlyoverText();

// $C48ECE
short IsValidItemTransformation(short arg1) {
    if (LoadedItemTransformations[arg1].transformationCountdown != 0) {
        return 1;
    }
    if (LoadedItemTransformations[arg1].sfxFrequency != 0) {
        return 1;
    }
    return 0;
}

// $C48EEB
void InitializeItemTransformation(short arg1) {
    if (IsValidItemTransformation(arg1) == 0) {
        Unknown7E9F2C = 0x3C;
        Unknown7E9F2A++;
    }
    LoadedItemTransformations[arg1].sfx = TimedItemTransformationTable[arg1].sfx;
    LoadedItemTransformations[arg1].sfxFrequency = TimedItemTransformationTable[arg1].sfxFrequency;
    LoadedItemTransformations[arg1].sfxCountdown = cast(ubyte)(TimedItemTransformationTable[arg1].sfxFrequency + randMod(2) - 1);
    LoadedItemTransformations[arg1].transformationCountdown = TimedItemTransformationTable[arg1].transformationTime;
}

// $C48F98
void UnknownC48F98(short arg1) {
    if (IsValidItemTransformation(arg1) == 0) {
        return;
    }
    Unknown7E9F2A--;
    LoadedItemTransformations[arg1].sfxFrequency = 0;
    LoadedItemTransformations[arg1].transformationCountdown = 0;
}

// $C48FC4
void ProcessItemTransformations() {
    if (BattleSwirlFlag + BattleSwirlCountdown != 0) {
        return;
    }
    if (Unknown7EB4B6 != 0) {
        return;
    }
    if (gameState.unknownB0 == 2) {
        return;
    }
    if (--Unknown7E9F2C != 0) {
        return;
    }
    Unknown7E9F2C = 0x3C;
    LoadedItemTransformation* x02 = LoadedItemTransformations.ptr;
    short x14 = 1;
    short x12 = 0;
    for (short i = 0; i < 4; i++) {
        if ((x14 != 0) && (x02.sfxFrequency != 0) && (x02.sfxCountdown-- == 0)) {
            x02.sfxCountdown = cast(ubyte)(x02.sfxFrequency + randMod(2) - 1);
            PlaySfx(x02.sfx);
            x14 = 0;
        }
        if (x02.transformationCountdown != 0) {
            if (x02.transformationCountdown-- == 0) {
                GiveItemToCharacter(TakeItemFromCharacter(0xFF, TimedItemTransformationTable[i].item), TimedItemTransformationTable[i].targetItem);
            }
        }
        x02++;
    }
}

// $C490EE
short UnknownC490EE() {
    short x04 = UnknownC46028(0x178);
    if (x04 == -1) {
        return 0;
    }
    if (EntityAbsXTable[x04] < gameState.leaderXCoordinate - 0x40) {
        return 1;
    }
    if (EntityAbsXTable[x04] == gameState.leaderXCoordinate + 0x40) {
        if (EntityAbsYTable[x04] < gameState.leaderYCoordinate - 0x40) {
            return 1;
        }
        if (EntityAbsYTable[x04] > gameState.leaderYCoordinate + 0x40) {
            return 1;
        }
    } else {
        return 1;
    }
    short x10 = cast(short)(EntityAbsYTable[x04] - gameState.leaderYCoordinate);
    if (x10 < 0) {
        x10 = cast(short)-cast(int)x10;
    }
    short x12 = cast(short)(EntityAbsXTable[x04] - gameState.leaderXCoordinate);
    if (x12 < 0) {
        x12 = cast(short)-cast(int)x12;
    }
    if (x10 + x12 < 16) {
        return 10;
    }
    return ((UnknownC41EFF(gameState.leaderXCoordinate, gameState.leaderYCoordinate, EntityAbsXTable[x04], EntityAbsYTable[x04]) + 0x1000) / 0x2000) + 2;
}

immutable ubyte*[8] FlyoverTextPointers;

//$C4984B
void UnknownC4984B();

//$C49740
void UnknownC49740() {
    memcpy(palettes.ptr, Unknown7F0000.ptr, 0x200);
    UnknownC0856B(0x18);
}

//$C49A56
void UnknownC49A56();

//$C49B6E
void UnknownC49B6E(short arg1) {
    UnknownC4984B();
    //x14 = Unknown7E9F2D * 0x1A0
    if (Unknown7E9F2D * 0x1A0 + 0x4E0 > 0x3400) {
        if (0x3400 - Unknown7E9F2D * 0x1A0 != 0) {
            CopyToVram(0, cast(short)(0x3400 - Unknown7E9F2D * 0x1A0), cast(ushort)(0xD0 * Unknown7E9F2D + 0x6150), &Unknown7E3492[0][0]);
        }
        if (Unknown7E9F2D * 0x1A0 + 0x4E0 - 0x3400 != 0) {
            //CopyToVram(0, Unknown7E9F2D * 0x1A0 + 0x4E0 - 0x3400, 0x6150, 0x6892 - Unknown7E9F2D * 0x1A0);
        }
    } else {
        CopyToVram(0, 0x4E0, cast(ushort)(0xD0 * Unknown7E9F2D + 0x6150), &Unknown7E3492[0][0]);
    }
    Unknown7E3C1E = -1;
    Unknown7E3C20 = 0;
    WaitUntilNextFrame();
}

//$C49C56
void UnknownC49C56(short);

//$C49CA8
void UnknownC49CA8(ubyte);

//$C49CC3
void UnknownC49CC3(ubyte, short);

//$C49D16
void UnknownC49D16(ubyte, short, short);

//$C49EC4
void UnknownC49EC4(short id) {
    ushort x02 = EntityTickCallbackFlags[23];
    EntityTickCallbackFlags[23] |= 0xC000;
    UnknownC49A56();
    immutable(ubyte)* x06 = FlyoverTextPointers[id];
    Unknown7E5E6E = 0;
    while (true) {
        switch(*(x06++)) {
            case 0:
                TM_MIRROR = 4;
                FadeInWithMosaic(1, 3, 0);
                for (short i = 0; i < 0xB4; i++) {
                    WaitUntilNextFrame();
                }
                FadeOutWithMosaic(1, 3, 0);
                TM_MIRROR = 0x17;
                ushort* buf = bg2Buffer.ptr;
                for (short i = 0x380; i != 0; i--) {
                    *(buf++) = 0;
                }
                Unknown7E5E6E = 0xFF;
                UnknownC08726();
                UndrawFlyoverText();
                EntityTickCallbackFlags[23] = x02;
                UnknownC08744();
                return;
            case 2:
                Unknown7E9F2D = *(x06++);
                break;
            case 9:
                UnknownC49B6E(0x18);
                WaitUntilNextFrame();
                UnknownC49C56(0x18);
                break;
            case 1:
                UnknownC49CA8(*(x06++));
                break;
            case 8:
                UnknownC49CC3(*(x06++), 0xC);
                break;
            default:
                UnknownC49D16(*(x06 - 1), 0, 0xC);
                break;
        }
    }
}

//$C4A7B0
short UnknownC4A7B0();

//$C4C2DE
void UnknownC4C2DE();

//$C4C58F
void UnknownC4C58F(short);

//$C4C60E
void UnknownC4C60E(short);

//$C4C64D
short UnknownC4C64D();

//$C4C718
short Spawn() {
    UnknownC0943C();
    UnknownC4C2DE();
    short result = UnknownC4C64D();
    if (result != 0) {
        FadeOutWithMosaic(2, 1, 0);
        UnknownC09451();
        return result;
    }
    UnknownC4C58F(0x20);
    UnknownC0AC0C(2);
    TM_MIRROR = 0x17;
    Unknown7E436E = -1;
    Unknown7E5DD4 = -1;
    CurrentMusicTrack = 0xFFFF;
    Unknown7E4676 = 1;
    WaitUntilNextFrame();
    InitializeMap(RespawnX, RespawnY, 6);
    Unknown7E4DC6 = &PartyCharacters[gameState.partyMembers[0]];
    for (short i = 0; i < 6; i++) {
        Unknown7E4DC6.afflictions[i] = 0;
    }
    Unknown7E4DC6.hp.target = Unknown7E4DC6.max_hp;
    Unknown7E4DC6.hp.current.integer = Unknown7E4DC6.max_hp;
    Unknown7E4DC6.pp.target = 0;
    Unknown7E4DC6.pp.current.integer = 0;
    gameState.moneyCarried = (gameState.moneyCarried & 1) + gameState.moneyCarried / 2;
    UnknownC07B52();
    for (short i = 1; 10 < i; i++) {
        setEventFlag(i, 0);
    }
    for (short i = 0; i < 0x1E; i++) {
        EntityCollidedObjects[i] = 0xFFFF;
    }
    UnknownC064D4();
    Unknown7E9E56 = 0;
    Unknown7E5D58 = 0;
    SpawnBuzzBuzz();
    OAMClear();
    UnknownC09451();
    UnknownC4C60E(0x20);
    return result;
}

//$C4D274
ubyte GetTownMapID(short x, short y) {
    return MapDataPerSectorTownMapData[(x >> 8) * 3 + (y / 0x80) * 96];
}

//$C4D43F
void UnknownC4D43F(short);

//$C4D552
void LoadTownMapData(short arg1) {
    FadeOut(2, 1);
    Decomp(TownMapGraphicsPointerTable[arg1], &Unknown7F0000[0]);
    while (Unknown7E0028 != 0) {}
    memcpy(&palettes[0][0], &Unknown7F0000[0], 0x40);
    memcpy(&palettes[16][0], &TownMapIconPalette[0], 0x100);
    SetBG1VRAMLocation(BGTileMapSize.normal, 0x3000, 0);
    SetOAMSize(3);
    CGADSUB = 0;
    CGWSEL = 0;
    TM_MIRROR = 1;
    TD_MIRROR = 0;
    CopyToVram(0, 0x800, 0x3000, &Unknown7F0000[0x40]);
    CopyToVram2(0, 0x4000, 0, &Unknown7F0000[0x840]);
    CopyToVram(0, 0x2400, 0x6000, &TownMapLabelGfx[0]);
    UnknownC0856B(0x18);
    TM_MIRROR = 0x11;
    BG1_Y_POS = 0;
    BG1_X_POS = 0;
    UpdateScreen();
    FadeIn(2, 1);
}

//$C4D681
short DisplayTownMap() {
    Unknown7EB4AE = 0x3C;
    Unknown7EB4B0 = 0x14;
    Unknown7EB4B2 = 0xC;
    short x10 = GetTownMapID(gameState.leaderXCoordinate, gameState.leaderYCoordinate);
    if (x10 == 0) {
        return 0;
    }
    LoadTownMapData(cast(short)(x10 - 1));
    while(((pad_press[0] & (PAD_A | PAD_L)) == 0) && ((pad_press[0] & (PAD_B | PAD_SELECT)) == 0) && ((pad_press[0] & PAD_L) == 0) && ((pad_press[0] & PAD_X) == 0)) {
        WaitUntilNextFrame();
        OAMClear();
        UnknownC4D43F(cast(short)(x10 - 1));
        UpdateScreen();
    }
    FadeOut(2, 1);
    for (short i = 0; i < 16; i++) {
        WaitUntilNextFrame();
        OAMClear();
        UnknownC4D43F(cast(short)(x10 - 1));
        UpdateScreen();
    }
    Unknown7E5DD8 = 1;
    ReloadMap();
    Unknown7E5DD4 = Unknown7E5DD6;
    UndrawFlyoverText();
    Unknown7E5DD8 = 0;
    TM_MIRROR = 0x17;
    FadeIn(2, 1);
    return x10;
}

//$C4DAD2
void InitIntro();

// $C4E366
void UnknownC4E366();

//$C4????
void* Path_sbrk(size_t inc) {
    void *ptr = path_heap_current;
    path_heap_current = cast(byte*)path_heap_current + inc;
    return ptr;
}

//$C4????
ushort Path_GetHeapSize() {
    return cast(ushort)(cast(byte*)path_heap_current - cast(byte*)path_heap_start);
}


/*
 * Finds a path from pathers to targets
 * Return value is still a mystery
 *
 * heap_size                Size of the heap used for allocation of various temporary arrays/structs
 * heap_start               Pointer to the start of the heap
 * matrix_dim               Pointer to a VecYX struct containing the pathfinding matrix dimensions
 * matrix                   FAR pointer to the pathfinding matrix
 * border_size              Size of the border used for the start positions of deliverymen
 * target_count             Amount of VecYX elements in the `targets_pos` array
 * targets_pos              Array of VecYX containing the positions of the targets
 * pather_count             Amount of Pather elements in the `pathers` array
 * pathers                  Array of Pather for the pathfinding objects
 * unk1                     Unknown (-1 as called from $C0BA35)
 * unk2                     Unknown, always 0xFC
 * search_radius            Just a guess...
 */
ushort Path_Main(ushort heap_size, void *heap_start, VecYX *matrix_dim,
                   ubyte *matrix, ushort border_size, ushort target_count,
                   VecYX* targets_pos, ushort pather_count, Pather* pathers,
                   ushort unk1, ushort unk2, ushort search_radius)
{
    ushort dp20 = 0;

    path_heap_start   = heap_start;
    path_heap_current = heap_start;
    path_heap_end     = cast(byte*)heap_start + heap_size;

    path_matrix_rows   = matrix_dim.y;
    path_matrix_cols   = matrix_dim.x;
    path_matrix_border = border_size;
    path_matrix_size   = cast(ushort)(path_matrix_rows * path_matrix_cols);
    path_matrix_buffer = matrix;

    ushort *ptr = cast(ushort*)Path_sbrk(search_radius*int.sizeof + int.sizeof); // dp1E
    path_B408 = ptr;
    path_B40A = ptr + cast(size_t)heap_start;
    path_B40C = ptr;
    path_B40E = ptr;

    path_cardinal_offset[0] = cast(short)-cast(int)path_matrix_cols; // NORTH
    path_cardinal_offset[1] =  1;                // EAST
    path_cardinal_offset[2] =  path_matrix_cols; // SOUTH
    path_cardinal_offset[3] = -1;                // WEST

    // NORTH
    path_cardinal_index[0].y = -1;
    path_cardinal_index[0].x =  0;
    // EAST
    path_cardinal_index[1].y =  0;
    path_cardinal_index[1].x =  1;
    // SOUTH
    path_cardinal_index[2].y =  1;
    path_cardinal_index[2].x =  0;
    // WEST
    path_cardinal_index[3].y =  0;
    path_cardinal_index[3].x = -1;

    // NORTHEAST
    path_diagonal_index[0].y = -1;
    path_diagonal_index[0].x =  1;
    // SOUTHEAST
    path_diagonal_index[1].y =  1;
    path_diagonal_index[1].x =  1;
    // SOUTHWEST
    path_diagonal_index[2].y =  1;
    path_diagonal_index[2].x = -1;
    // NORTHWEST
    path_diagonal_index[3].y = -1;
    path_diagonal_index[3].x = -1;

    if (unk2 >= PATH_FB) {
        unk2 = PATH_FB;
    }

    Pather **dp1C = cast(Pather**)Path_sbrk(pather_count * (Pather*).sizeof);
    Path_C4B859(pather_count, pathers, dp1C);

    VecYX **dp2A = cast(VecYX**)Path_sbrk(unk2 * (VecYX*).sizeof); // Allocate space on heap for pathfinding tile positions
    Path_InitMatrix();

    ushort dp1A = 0;
    ushort dp18 = 0;
    ushort dp04;
    for (dp04 = 0; dp04 < pather_count; dp04++) {
        ushort dp1E;

        Pather *dp02 = dp1C[dp04];
        Pather *dp32 = dp02;

        if (dp02.hitbox.y != dp1A || dp02.hitbox.x != dp18) {
            ushort dp16 = 1;
            dp1A = dp02.hitbox.y;
            dp18 = dp02.hitbox.x;

            for (dp1E = cast(short)(dp04 + 1); dp1E < pather_count; dp1E++) {
                // X REGISTER = &dp1C[dp1E]

                if (dp1C[dp1E].hitbox.y != dp1A) break;
                if (dp1C[dp1E].hitbox.x != dp18) break;

                dp16++;
            }

            Path_C4B923(dp16, &dp1C[dp04]);
            Path_C4BAF6(target_count, targets_pos, dp02, dp16, unk2, unk1);
        }

        dp02.point_count = Path_C4BD9A(&dp02.origin, unk2, dp2A);
        ushort dp14 = Path_C4BF7F(cast(ushort)dp02.point_count, dp2A);

        VecYX *dp22 = cast(VecYX*)Path_sbrk(dp14 * VecYX.sizeof);

        for (dp1E = 0; dp1E < dp14; ++dp1E) {
            dp22[dp1E].y = dp2A[dp1E].y;
            dp22[dp1E].x = dp2A[dp1E].x;
        }

        dp02 = dp32;
        dp02.field0A = dp14;
        dp02.points = dp22;

        if (dp14) {
            ++dp20;
        }
    }

    return dp20;
}

// Initializes the border around the pathfind matrix to PATH_UNWALKABLE
void Path_InitMatrix() {
    int i;
    for (i = 0; i < path_matrix_rows; ++i) {
        ubyte dp0E = PATH_UNWALKABLE;
        path_matrix_buffer[((path_matrix_cols - 1) * i) + (path_matrix_cols - 1)] = dp0E;
        path_matrix_buffer[(path_matrix_cols - 1) * i] = dp0E;
    }

    for (i = 0; i < path_matrix_cols; ++i) {
        ubyte dp0E = PATH_UNWALKABLE;
        path_matrix_buffer[(path_matrix_rows - 1) + i] = dp0E;
        path_matrix_buffer[i] = dp0E;
    }
}

// TODO: Path_InitPathers?
void Path_C4B859(ushort pather_count, Pather *pathers, Pather **pather_table) {
    // X REGISTER = pathers

    ushort dp1A = cast(ushort)(pather_count - 1);

    // Scope for dp18 where it's seen as an ushort
    {
        ushort dp18;
        for (dp18 = 0; dp18 < pather_count; dp18++) {
            // Y REGISTER = dp18 * sizeof(pather_table)
            // dp02 = dp18 * sizeof(Pather)

            pather_table[dp18] = &pathers[dp18];
        }
    }

    if (pather_count <= 1) return;

    ushort dp04;
    for (dp04 = 0; dp04 < dp1A; ++dp04) {
        ushort dp16 = 0xFFFF;
        ushort dp14 = 0xFFFF;
        ushort dp0E;

        ushort dp12;
        for (dp12 = dp04; dp12 < pather_count; dp12++) { // Y REGISTER
            ushort dp10 = pather_table[dp12].hitbox.y;
            ushort dp02 = pather_table[dp12].hitbox.x;

            /* TODO: This is some really odd output code...
             * C4/B8BE: A5 10        LDA $10
             * C4/B8C0: C5 16        CMP $16
             * C4/B8C2: F0 0C        BEQ $B8D0
             * C4/B8C4: A2 00 00     LDX #$0000
             * C4/B8C7: C5 16        CMP $16
             * C4/B8C9: B0 11        BCS $B8DC
             * C4/B8CB: A2 01 00     LDX #$0001
             * C4/B8CE: 80 0C        BRA $B8DC
             * C4/B8D0: A2 00 00     LDX #$0000
             * C4/B8D3: A5 02        LDA $02
             * C4/B8D5: C5 14        CMP $14
             * C4/B8D7: B0 03        BCS $B8DC
             * C4/B8D9: A2 01 00     LDX #$0001
             */
            int tmp; // X REGISTER
            if (dp10 != dp16) {
                tmp = (dp10 < dp16);
            } else {
                tmp = (dp02 < dp14);
            }

            // Should be always true for the first iteration
            if (tmp) {
                dp16 = dp10;
                dp14 = dp02;
                dp0E = dp12;
            }
        }

        Pather *dp18 = pather_table[dp04];
        pather_table[dp04] = pather_table[dp0E];
        pather_table[dp0E] = dp18;
    }
}

// TODO: Finds possible start points?
void Path_C4B923(ushort count, Pather **pathers) {
    ushort dp14;
    for (dp14 = 0; dp14 < path_matrix_size; dp14++) {
        if (path_matrix_buffer[dp14] != PATH_UNWALKABLE) {
            path_matrix_buffer[dp14] = PATH_MAYBE_START;
        }
    }

    ushort dp12; // also dp02
    for (dp12 = 0; dp12 < count; dp12++) {
        Pather *dp10 = pathers[dp12]; // also Y REGISTER

        if (dp10.from_offscreen == 0) {
            // Starting point is the same as current position
            if (path_matrix_buffer[(path_matrix_cols * dp10.origin.y) + dp10.origin.x] != PATH_UNWALKABLE) {
                path_matrix_buffer[(path_matrix_cols * dp10.origin.y) + dp10.origin.x] = PATH_START;
            }
        } else {
            // Starting from offscreen
            ushort dp0E;
            ushort i; // X REGISTER
            for (dp0E = 0; dp0E < path_matrix_border; dp0E++) {
                for (i = 0; i < path_matrix_cols; ++i) {
                    if (path_matrix_buffer[(dp0E * path_matrix_cols) + i] != PATH_UNWALKABLE) {
                        path_matrix_buffer[(dp0E * path_matrix_cols) + i] = PATH_START;
                    }
                }
            }

            for (dp0E = cast(ushort)(path_matrix_rows - path_matrix_border); dp0E < path_matrix_rows; dp0E++) {
                for (i = 0; i < path_matrix_cols; ++i) {
                    if (path_matrix_buffer[(dp0E * path_matrix_cols) + i] != PATH_UNWALKABLE) {
                        path_matrix_buffer[(dp0E * path_matrix_cols) + i] = PATH_START;
                    }
                }
            }

            for (i = 0; i < path_matrix_border; ++i) {
                for (dp14 = 0; dp14 < path_matrix_rows; dp14++) {
                    if (path_matrix_buffer[(dp14 * path_matrix_cols) + i] != PATH_UNWALKABLE) {
                        path_matrix_buffer[(dp14 * path_matrix_cols) + i] = PATH_START;
                    }
                }
            }

            for (i = 0; i < path_matrix_cols - path_matrix_border; ++i) {
                for (dp14 = 0; dp14 < path_matrix_rows; dp14++) {
                    if (path_matrix_buffer[(dp14 * path_matrix_cols) + i] != PATH_UNWALKABLE) {
                        path_matrix_buffer[(dp14 * path_matrix_cols) + i] = PATH_START;
                    }
                }
            }

            dp10.origin.y = 0;
            dp10.origin.x = 0;
        }
    }
}

void Path_C4BAF6(ushort target_count, VecYX *targets_pos, Pather *pather, ushort unk1, ushort unk2, ushort unk3) {
    ushort dp19 = pather.hitbox.y;
    ushort dp17 = pather.hitbox.x;
    ushort dp15 = 0;
    ushort dp13 = 0;

    path_B40E = path_B408;
    path_B40C = path_B408;

    ushort dp11;
    for (dp11 = 0; dp11 < target_count; dp11++) {
        *path_B40E = cast(ushort)((targets_pos[dp11].y * path_matrix_cols) + targets_pos[dp11].x);

        /*
         * C4/BB54: AD 0E B4     LDA $B40E
         * C4/BB57: CD 0A B4     CMP $B40A
         * C4/BB5A: D0 05        BNE $BB61
         * C4/BB5C: AE 08 B4     LDX $B408
         * C4/BB5F: 80 05        BRA $BB66
         * C4/BB61: AE 0E B4     LDX $B40E
         * C4/BB64: E8           INX
         * C4/BB65: E8           INX
         * C4/BB66: 8E 0E B4     STX $B40E
         */
        path_B40E = (path_B40E == path_B40A) ? path_B408 : path_B40E + 1;
    }

    while (path_B40C != path_B40E) {
        ushort dp02 = *path_B40C;

        /*
         * C4/BB81: AD 0C B4     LDA $B40C
         * C4/BB84: CD 0A B4     CMP $B40A
         * C4/BB87: D0 05        BNE $BB8E
         * C4/BB89: AE 08 B4     LDX $B408
         * C4/BB8C: 80 05        BRA $BB93
         * C4/BB8E: AE 0C B4     LDX $B40C
         * C4/BB91: E8           INX
         * C4/BB92: E8           INX
         * C4/BB93: 8E 0C B4     STX $B40C
         */
        path_B40C = (path_B40C == path_B40A) ? path_B408 : path_B40C + 1;

        ubyte dp00 = path_matrix_buffer[dp02];
        if (dp00 < PATH_MAYBE_START) continue; // Ignore PATH_MAYBE_START or PATH_START

        ushort flag = 1;   // Y REGISTER
        ushort tmp = dp02; // X REGISTER
        ushort dp04;

        for (dp11 = 0; dp11 < dp19; tmp += path_matrix_cols, dp11++) {
            for (dp04 = 0; dp04 < dp17; ++dp04) {
                if (path_matrix_buffer[tmp + dp04] == PATH_UNWALKABLE) {
                    flag = 0;
                    goto exit_loop;
                }
            }
        }

exit_loop:
        if (!flag) {
            path_matrix_buffer[dp02] = PATH_FC;
        } else {
            if (dp00 == PATH_START) {
                ++dp15;
                if (pather.from_offscreen == 1) {
                    pather.origin.y = cast(short)(tmp / path_matrix_cols);
                    pather.origin.x = cast(short)(tmp % path_matrix_cols);
                }
            }

            dp00 = PATH_FC;

            ushort dp0F;
            for (dp0F = 0; dp0F < 4; dp0F++) {
                dp11 = cast(ushort)(dp02 + path_cardinal_offset[dp0F]);
                ubyte dp01 = path_matrix_buffer[dp11];
                if (dp01 >= PATH_MAYBE_START) { // if PATH_MAYBE_START or PATH_START
                    /*
                     * C4/BC8C: AD 0C B4     LDA $B40C
                     * C4/BC8F: CD 08 B4     CMP $B408
                     * C4/BC92: D0 10        BNE $BCA4
                     * C4/BC94: A0 00 00     LDY #$0000
                     * C4/BC97: AD 0E B4     LDA $B40E
                     * C4/BC9A: CD 0A B4     CMP $B40A
                     * C4/BC9D: D0 15        BNE $BCB4
                     * C4/BC9F: A0 01 00     LDY #$0001
                     * C4/BCA2: 80 10        BRA $BCB4
                     * C4/BCA4: A0 00 00     LDY #$0000
                     * C4/BCA7: AD 0E B4     LDA $B40E
                     * C4/BCAA: 1A           INC
                     * C4/BCAB: 1A           INC
                     * C4/BCAC: CD 0C B4     CMP $B40C
                     * C4/BCAF: D0 03        BNE $BCB4
                     * C4/BCB1: A0 01 00     LDY #$0001
                     */
                    if (path_B40C == path_B408) {
                        flag = (path_B40E == path_B40A);
                    } else {
                        flag = (path_B40E + 1 == path_B40C);
                    }

                    if (!flag) {
                        *path_B40E = dp11;

                        /*
                         * C4/BCC1: AD 0E B4     LDA $B40E
                         * C4/BCC4: CD 0A B4     CMP $B40A
                         * C4/BCC7: D0 05        BNE $BCCE
                         * C4/BCC9: AC 08 B4     LDY $B408
                         * C4/BCCC: 80 05        BRA $BCD3
                         * C4/BCCE: AC 0E B4     LDY $B40E
                         * C4/BCD1: C8           INY
                         * C4/BCD2: C8           INY
                         * C4/BCD3: 8C 0E B4     STY $B40E
                         */
                        path_B40E = (path_B40E == path_B40A) ? path_B408 : path_B40E + 1;
                    }
                } else if (dp00 > dp01) {
                    dp00 = dp01;
                }
            }

            if (dp00 == PATH_FC) {
                path_matrix_buffer[dp02] = 0;
            } else {
                ubyte dp0E = cast(ubyte)(dp00 + 1);
                path_matrix_buffer[dp02] = dp0E;

                if (dp0E == unk2) {
                    for (dp11 = 0; dp11 < 4; dp11++) {
                        if (path_matrix_buffer[ dp02 + path_cardinal_offset[dp11] ] >= PATH_MAYBE_START) { // if PATH_MAYBE_START or PATH_START
                            path_matrix_buffer[ dp02 + path_cardinal_offset[dp11] ] = PATH_FC;
                        }
                    }
                }
            }

            ++dp13;
            if (unk3 <= dp13 || dp15 == unk1) return;
        }
    }
}

ushort Path_C4BD9A(VecYX *start, ushort max_points, VecYX **points) {
    ushort dp28 = start.y;
    ushort dp26 = start.x;
    ushort dp24 = 0;

    ubyte dp00 = path_matrix_buffer[(dp28 * path_matrix_cols) + dp26];
    if (dp00 > PATH_FB) { // if PATH_FC, PATH_UNWALKABLE, PATH_MAYBE_START, PATH_START
        return 0;
    }

    if (max_points == 0) {
        return 0;
    }

    points[0].y = dp28;
    points[0].x = dp26;


    ushort dp22 = 1;
    while (dp00 != 0) {
        ushort dp20 = 666; // No, really.
        ushort dp1E = 666;

        ushort dp0E;
        ushort dp10;
        ushort dp12;
        ushort dp14;

        dp00--;

        ushort dp1C = dp24; // Also dp02

        for (dp24 = 0; dp24 < 4; ++dp24) {
            ushort tmp = cast(ushort)(path_cardinal_index[dp1C].y + dp28); // X REGISTER
            ushort dp1A = cast(ushort)(path_cardinal_index[dp1C].x + dp26);

            ushort dp04 = dp1C & 3;

            if (path_matrix_buffer[(path_matrix_cols * tmp) + dp1A] == dp00) {
                if (dp20 == 666) {
                    dp20 = dp1C;
                    dp0E = tmp;
                    dp10 = dp1A;
                }

                ushort dp18 = cast(ushort)(path_diagonal_index[dp1C].y + dp28);
                ushort dp16 = cast(ushort)(path_diagonal_index[dp1C].x + dp26);

                if (path_matrix_buffer[(dp18 * path_matrix_cols) + dp16] == dp00 - 1) {
                    ushort dp02 = cast(ushort)(path_cardinal_index[dp04].x + dp26);
                    if (path_matrix_buffer[((path_cardinal_index[dp04].y + dp28) * path_matrix_cols) + dp02] == dp00) {
                        dp1E = dp1C;
                        dp12 = dp18;
                        dp14 = dp16;
                        goto exit_loop;
                    }
                }
            }

            dp1C = dp04;
        }

exit_loop:
        if (dp1E != 666) {
            dp28 = dp12;
            dp26 = dp14;
            dp24 = dp1E;
            dp00--;
        } else {
            if (dp20 == 666) break;

            dp28 = dp0E;
            dp26 = dp10;
            dp24 = dp20;
        }

        if (max_points == dp22) return dp22;

        points[dp22].y = dp28;
        points[dp22].x = dp26;

        ++dp22;
    }

    return dp22;
}

ushort Path_C4BF7F(ushort count, VecYX **points) {
    if (count >= 3) {
        ushort dp04 = points[1].y;
        ushort dp1A = points[1].x; // Also dp02

        ushort dp18 = cast(ushort)(dp04 - points[0].y);
        ushort dp16 = cast(ushort)(dp1A - points[0].x);

        ushort dp14 = 1;
        ushort dp12;

        for (dp12 = 2; dp12 != count; ++dp12) {
            ushort dp10 = points[dp12].y;
            ushort dp0E = points[dp12].x; // Also Y REGISTER

            if (dp04 + dp18 == dp10 && dp1A + dp16 == dp0E) {
                points[dp14].y = dp10;
                points[dp14].x = dp0E;
            } else {
                ++dp14;
                points[dp14].y = dp10;
                points[dp14].x = dp0E;

                dp18 = cast(ushort)(dp10 - dp04);
                dp16 = cast(ushort)(dp0E - dp1A);
            }

            dp04 = dp10;
            dp1A = dp0E;
        }

        count = cast(ushort)(dp14 + 1);
    }

    return count;
}

immutable MusicDataset[191] MusicDatasetTable = [
    MusicDataset(0x00, 0xFF, 0x01),
    MusicDataset(0x02, 0x03, 0x04),
    MusicDataset(0x02, 0x03, 0x04),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0x06),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0x07),
    MusicDataset(0x05, 0x08, 0x09),
    MusicDataset(0x05, 0x08, 0x0A),
    MusicDataset(0x05, 0x08, 0x0B),
    MusicDataset(0x05, 0x08, 0x0C),
    MusicDataset(0x05, 0x08, 0x0D),
    MusicDataset(0x05, 0x08, 0x0E),
    MusicDataset(0x05, 0x08, 0x0F),
    MusicDataset(0x05, 0x08, 0x10),
    MusicDataset(0x05, 0x08, 0x11),
    MusicDataset(0x05, 0x08, 0x12),
    MusicDataset(0x05, 0x08, 0x13),
    MusicDataset(0x05, 0x08, 0x13),
    MusicDataset(0x05, 0x08, 0x14),
    MusicDataset(0x05, 0x15, 0x16),
    MusicDataset(0x05, 0xFF, 0x17),
    MusicDataset(0x05, 0xFF, 0x17),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x15, 0x1A),
    MusicDataset(0x05, 0x1B, 0x1C),
    MusicDataset(0x05, 0x1B, 0x1D),
    MusicDataset(0x05, 0x1B, 0x1E),
    MusicDataset(0x05, 0x1B, 0x1F),
    MusicDataset(0x05, 0x08, 0x20),
    MusicDataset(0x05, 0x21, 0x22),
    MusicDataset(0x05, 0x23, 0x24),
    MusicDataset(0x05, 0x25, 0x26),
    MusicDataset(0x05, 0x25, 0x27),
    MusicDataset(0x05, 0x28, 0x29),
    MusicDataset(0x05, 0x2A, 0x2B),
    MusicDataset(0x05, 0x2C, 0x2D),
    MusicDataset(0x05, 0x08, 0x2E),
    MusicDataset(0x05, 0x2F, 0x30),
    MusicDataset(0x05, 0x2F, 0x31),
    MusicDataset(0x05, 0x32, 0x33),
    MusicDataset(0x05, 0x34, 0x35),
    MusicDataset(0x05, 0x36, 0x37),
    MusicDataset(0x05, 0x38, 0x39),
    MusicDataset(0x05, 0x3A, 0x3B),
    MusicDataset(0x05, 0x3C, 0x3D),
    MusicDataset(0x05, 0x3C, 0x3E),
    MusicDataset(0x05, 0x3C, 0x3F),
    MusicDataset(0x05, 0x40, 0x41),
    MusicDataset(0x05, 0x42, 0x43),
    MusicDataset(0x05, 0x18, 0x44),
    MusicDataset(0x05, 0x18, 0x45),
    MusicDataset(0x05, 0x46, 0x47),
    MusicDataset(0x05, 0x48, 0x49),
    MusicDataset(0x05, 0x4A, 0x4B),
    MusicDataset(0x05, 0x4C, 0x4D),
    MusicDataset(0x05, 0x4C, 0x4D),
    MusicDataset(0x05, 0x4E, 0x4F),
    MusicDataset(0x05, 0x50, 0x51),
    MusicDataset(0x05, 0x52, 0x53),
    MusicDataset(0x05, 0x54, 0x55),
    MusicDataset(0x05, 0x54, 0x56),
    MusicDataset(0x05, 0x54, 0x57),
    MusicDataset(0x05, 0x46, 0x58),
    MusicDataset(0x05, 0x59, 0x5A),
    MusicDataset(0x05, 0x2C, 0x5B),
    MusicDataset(0x05, 0x5C, 0x5D),
    MusicDataset(0x05, 0x2C, 0x5E),
    MusicDataset(0x05, 0x2C, 0x5E),
    MusicDataset(0x05, 0x5F, 0x60),
    MusicDataset(0x05, 0x2C, 0x61),
    MusicDataset(0x05, 0x62, 0x63),
    MusicDataset(0x05, 0x23, 0x64),
    MusicDataset(0x05, 0xFF, 0x65),
    MusicDataset(0x05, 0xFF, 0x66),
    MusicDataset(0x05, 0xFF, 0x67),
    MusicDataset(0x05, 0x54, 0x68),
    MusicDataset(0x05, 0x69, 0x6A),
    MusicDataset(0x05, 0x54, 0x6B),
    MusicDataset(0x6C, 0xFF, 0x6D),
    MusicDataset(0x05, 0x6E, 0x6F),
    MusicDataset(0x05, 0x6E, 0x70),
    MusicDataset(0x05, 0x6E, 0x71),
    MusicDataset(0x05, 0x72, 0x73),
    MusicDataset(0x05, 0x74, 0x75),
    MusicDataset(0x05, 0x76, 0x77),
    MusicDataset(0x05, 0x76, 0x78),
    MusicDataset(0x05, 0x15, 0x79),
    MusicDataset(0x05, 0x7A, 0x7B),
    MusicDataset(0x05, 0x7C, 0x7D),
    MusicDataset(0x05, 0x7E, 0x7F),
    MusicDataset(0x05, 0x7E, 0x80),
    MusicDataset(0x05, 0x15, 0x81),
    MusicDataset(0x05, 0x2C, 0x5E),
    MusicDataset(0x05, 0x2C, 0x5E),
    MusicDataset(0x05, 0xFF, 0x82),
    MusicDataset(0x05, 0x83, 0x0E),
    MusicDataset(0x05, 0x83, 0x0E),
    MusicDataset(0x05, 0x83, 0x84),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0x83, 0x85),
    MusicDataset(0x05, 0x15, 0x86),
    MusicDataset(0x05, 0x83, 0x84),
    MusicDataset(0x05, 0xFF, 0x87),
    MusicDataset(0x05, 0x08, 0x88),
    MusicDataset(0x05, 0x83, 0x84),
    MusicDataset(0x05, 0x21, 0x22),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0x89),
    MusicDataset(0x05, 0x2F, 0x8A),
    MusicDataset(0x05, 0xFF, 0x67),
    MusicDataset(0x05, 0xFF, 0x67),
    MusicDataset(0x05, 0x8B, 0x8C),
    MusicDataset(0x05, 0x8B, 0x8D),
    MusicDataset(0x05, 0x54, 0x57),
    MusicDataset(0x05, 0x08, 0x8E),
    MusicDataset(0x05, 0xFF, 0x8F),
    MusicDataset(0x05, 0x1B, 0x90),
    MusicDataset(0x05, 0x72, 0x91),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0x25, 0x26),
    MusicDataset(0x05, 0x08, 0x0A),
    MusicDataset(0x05, 0x08, 0x0A),
    MusicDataset(0x05, 0x08, 0x0A),
    MusicDataset(0x05, 0x59, 0x92),
    MusicDataset(0x05, 0x72, 0x73),
    MusicDataset(0x05, 0xFF, 0x93),
    MusicDataset(0x05, 0x18, 0x94),
    MusicDataset(0x05, 0x36, 0x37),
    MusicDataset(0x05, 0x1B, 0x1C),
    MusicDataset(0x05, 0x2C, 0x61),
    MusicDataset(0x05, 0x83, 0x95),
    MusicDataset(0x05, 0x54, 0x96),
    MusicDataset(0x05, 0x54, 0x96),
    MusicDataset(0x05, 0x83, 0x85),
    MusicDataset(0x05, 0x1B, 0x97),
    MusicDataset(0x05, 0x83, 0x95),
    MusicDataset(0x05, 0x83, 0x85),
    MusicDataset(0x05, 0x83, 0x98),
    MusicDataset(0x05, 0xFF, 0x91),
    MusicDataset(0x05, 0x83, 0x95),
    MusicDataset(0x02, 0x99, 0x9A),
    MusicDataset(0x02, 0x03, 0x04),
    MusicDataset(0x05, 0x2C, 0x9B),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x18, 0x9E),
    MusicDataset(0x05, 0x38, 0x9F),
    MusicDataset(0x05, 0x2F, 0xA0),
    MusicDataset(0x05, 0xA1, 0xA2),
    MusicDataset(0x05, 0x08, 0x88),
    MusicDataset(0x00, 0xFF, 0x01),
    MusicDataset(0x02, 0x99, 0xA3),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0x83, 0x85),
    MusicDataset(0x05, 0x3C, 0xA4),
    MusicDataset(0x05, 0xA5, 0xA6),
    MusicDataset(0x05, 0xA1, 0xA2),
    MusicDataset(0x05, 0xFF, 0x66),
    MusicDataset(0x05, 0x52, 0x53),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0x4E, 0x4F),
    MusicDataset(0x05, 0x4C, 0xA7),
    MusicDataset(0x05, 0x4E, 0x4F),
    MusicDataset(0x05, 0x2F, 0xA8),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x52, 0x53),
    MusicDataset(0x05, 0x50, 0x51),
];

immutable MusicPackPointer[169] MusicPackPointerTable;

// $C4FBBD
void ChangeMusic(short track) {
    if (track == CurrentMusicTrack) {
        return;
    }
    if (Unknown7EB4B6 == 0) {
        PlaySfxUnknown();
    }
    if ((track < Music.SoundstoneRecordingGiantStep) || (track > Music.SoundstoneRecordingFireSpring)) {
        UnknownC0AC0C(1);
        StopMusic();
    }
    CurrentMusicTrack = track;
    const(MusicDataset)* dataset = &MusicDatasetTable[track - 1];
    if ((dataset.primarySamplePack != CurrentPrimarySamplePack) || (dataset.primarySamplePack != 0xFF)) {
        CurrentPrimarySamplePack = dataset.primarySamplePack;
        // not using segmented addressing...
        //LoadSPC700Data(MusicPackPointerTable[dataset.primarySamplePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[dataset.primarySamplePack].bank));
        LoadSPC700Data(MusicPackPointerTable[dataset.primarySamplePack].addr);
    }
    if ((dataset.secondarySamplePack != CurrentSecondarySamplePack) || (dataset.secondarySamplePack != 0xFF)) {
        CurrentSecondarySamplePack = dataset.secondarySamplePack;
        //LoadSPC700Data(MusicPackPointerTable[dataset.secondarySamplePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[dataset.secondarySamplePack].bank));
        LoadSPC700Data(MusicPackPointerTable[dataset.secondarySamplePack].addr);
    }
    if ((dataset.sequencePack != CurrentSequencePack) || (dataset.sequencePack != 0xFF)) {
        CurrentSequencePack = dataset.sequencePack;
        //LoadSPC700Data(MusicPackPointerTable[dataset.sequencePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[dataset.sequencePack].bank));
        LoadSPC700Data(MusicPackPointerTable[dataset.sequencePack].addr);
    }
    UnknownC0ABBD(track);
}

// $C4FB58
void InitializeSPC700();

// $C4FD18
void UnknownC4FD18(short arg1) {
    if (arg1 == 0) {
        LoadSPC700Data(&StereoMonoData[7]);
    } else {
        LoadSPC700Data(&StereoMonoData[0]);
    }
}

// $C4FD45
void SetBoundaryBehaviour(short val) {
    SectorBoundaryBehaviourFlag = val;
}

