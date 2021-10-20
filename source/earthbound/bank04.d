module earthbound.bank04;

import earthbound.commondefs;
import earthbound.bank02;
import earthbound.globals;

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

// $C42F45
void SetPartyTickCallbacks(short leaderEntityID, void function() leaderCallback, void function() partyCallback) {
    EntityTickCallbacks[leaderEntityID] = leaderCallback;
    for (int i = 6; i > 0; i--) {
        EntityTickCallbacks[leaderEntityID++] = partyCallback;
    }
}

// $C43317
void UnknownC43317() {
    for (short i = 0; i < 6; i++) {
        ChosenFourPtrs[i] = &PartyCharacters[i];
    }
}

// $C43B15 - Unknown, but looks like it resets the color of existing text in the focused window
void UnknownC43B15();

// $C43BB9 - Unknown, but looks like it prints optionally highlighted text
void UnknownC43BB9(short maxLength, short highlighted, ubyte* text);

// $C43CD2 - Set text position on focused window (for menu options)
void UnknownC43CD2(MenuOpt* opt, short x, short y);

//$C43DDB
void UnknownC43DDB(MenuOpt* menuEntry) {}

immutable ubyte[0x400] UnknownC43915 = [0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

// $C43F53
void UnknownC43F53() {
    for (short i = 0; i < 0x20; i++) {
        Unknown7E1AD6[i] = UnknownC20958[i];
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

// $C47F87
void UnknownC47F87();

// $C48FC4
void UnknownC48FC4();

// $C490EE
void UnknownC490EE();

//$C49EC4
void UnknownC49EC4(short id) {}

//$C4A7B0
short UnknownC4A7B0();

//$C4C718
short Spawn();

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

void ChangeMusic(Music track);

