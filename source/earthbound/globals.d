module earthbound.globals;

import earthbound.commondefs;

__gshared ubyte Unknown7E0000;
__gshared ubyte Unknown7E0001;
__gshared ubyte Unknown7E0002;
__gshared ushort Unknown7E0003;
__gshared ushort Unknown7E0005;
//Some kind of pointer?
__gshared ushort Unknown7E0007;
__gshared ubyte Unknown7E0009;
__gshared ubyte Unknown7E000A;
__gshared ubyte Unknown7E000B;
__gshared ubyte Unknown7E000C;
__gshared ubyte INIDISP_MIRROR;
__gshared ubyte OBSEL_MIRROR;
__gshared ubyte Unknown7E000F;
__gshared ubyte MOSAIC_MIRROR;
__gshared ubyte Unknown7E0011;
__gshared ubyte Unknown7E0012;
__gshared ubyte Unknown7E0013;
__gshared ubyte Unknown7E0014;
__gshared ubyte BG12NBA_MIRROR;
__gshared ubyte Unknown7E0016;
__gshared ubyte UNUSED_WH2_MIRROR;
__gshared ushort Unknown7E0018;
__gshared ubyte TM_MIRROR;
__gshared ubyte TD_MIRROR;

__gshared ubyte Unknown7E001D;
__gshared ubyte Unknown7E001E;
__gshared ubyte HDMAEN_MIRROR;
__gshared ushort Unknown7E0020;
__gshared ubyte Unknown7E0022;
__gshared ubyte Unknown7E0023;
__gshared ushort RAND_A;
__gshared ushort RAND_B;
__gshared ubyte Unknown7E0028;
__gshared ubyte Unknown7E0029;
__gshared ubyte Unknown7E002A;
__gshared ubyte Unknown7E002B;
//the ID of the frame being/about to be displayed, multiplied by 2
__gshared ubyte NEXT_FRAME_DISPLAY_ID;
__gshared ubyte Unknown7E002D;
//the ID of the next frame to buffer as a byte offset - 0 for buffer 0, 2 for buffer 1
__gshared ubyte NEXT_FRAME_BUF_ID;
__gshared ubyte Unknown7E002F;
//DMA table offset?
__gshared ubyte Unknown7E0030;
__gshared ushort BG1_X_POS;
__gshared ushort BG1_Y_POS;
__gshared ushort BG2_X_POS;
__gshared ushort BG2_Y_POS;
__gshared ushort BG3_X_POS;
__gshared ushort BG3_Y_POS;
__gshared ushort BG4_X_POS;
__gshared ushort BG4_Y_POS;
__gshared ushort[2] BG1_X_POS_BUF;
__gshared ushort[2] BG1_Y_POS_BUF;
__gshared ushort[2] BG2_X_POS_BUF;
__gshared ushort[2] BG2_Y_POS_BUF;
__gshared ushort[2] BG3_X_POS_BUF;
__gshared ushort[2] BG3_Y_POS_BUF;
__gshared ushort[2] BG4_X_POS_BUF;
__gshared ushort[2] BG4_Y_POS_BUF;
__gshared ushort Unknown7E0061;
__gshared ushort Unknown7E0063;

__gshared ushort pad1_state;
__gshared ushort pad2_state;
__gshared ushort pad1_repeat;       // $0069 - Repeated buttons on Controller 1
__gshared ushort pad2_repeat;       // $006B - Repeated buttons on Controller 2
__gshared ushort pad1_press;        // $006D - Pressed buttons on Controller 1
__gshared ushort pad2_press;        // $006F - Pressed buttons on Controller 2


__gshared ubyte Unknown7E0077;
__gshared ubyte Unknown7E0078;
__gshared ubyte Unknown7E0079;
__gshared ubyte Unknown7E007A;
__gshared ubyte Unknown7E007B;
__gshared ubyte Unknown7E007C;
__gshared ubyte Unknown7E007D;
__gshared ubyte Unknown7E007E;
__gshared ubyte Unknown7E007F;
__gshared ubyte Unknown7E0080;
__gshared short Unknown7E0081;
__gshared short Unknown7E0083;
__gshared short Unknown7E0085;
__gshared short Unknown7E0087;
__gshared short Unknown7E0089;
__gshared short Unknown7E008B;
__gshared short Unknown7E008D;
__gshared short Unknown7E008F;
__gshared ubyte Unknown7E0091;
__gshared short DMA_COPY_SIZE;
__gshared ubyte[3] DMA_COPY_RAM_SRC;
__gshared short DMA_COPY_VRAM_DEST;
__gshared short Unknown7E0099;

__gshared short Unknown7E009C;
__gshared short Unknown7E009E;
__gshared ubyte Unknown7E00A0;
__gshared ubyte Unknown7E00A1;
__gshared ubyte Unknown7E00A2;
__gshared ubyte Unknown7E00A3;
__gshared ubyte Unknown7E00A4;
__gshared ubyte Unknown7E00A5;
__gshared ubyte Unknown7E00A6;
__gshared uint TIMER;
__gshared ubyte Unknown7E00AB;
__gshared ubyte Unknown7E00AC;
__gshared ubyte Unknown7E00AD;
__gshared short Unknown7E00AE;

__gshared ubyte Unknown7E00B0;
__gshared ubyte Unknown7E00B1;
__gshared short Unknown7E00B2;
__gshared ubyte TEMP_DIVIDEND;
__gshared ubyte Unknown7E00B5;
__gshared ubyte Unknown7E00B6;
__gshared ubyte Unknown7E00B7;
__gshared ubyte Unknown7E00B8;
__gshared ubyte Unknown7E00B9;
__gshared short Unknown7E00BA;
__gshared short Unknown7E00BC;
__gshared short Unknown7E00BE;
__gshared short Unknown7E00C0;

__gshared short Unknown7E00C4;
__gshared short SPC_DATA_PTR;
__gshared short Unknown7E00C8;
__gshared ubyte Unknown7E00CA;
__gshared ubyte Unknown7E00CB;
__gshared short Unknown7E00CC;
__gshared ubyte Unknown7E00CE;
__gshared short Unknown7E00CF;
__gshared ubyte Unknown7E00D1;
__gshared ubyte Unknown7E00D2;
__gshared short Unknown7E00D3;

__gshared ushort[16][32] palettes;

auto ref CurrentTextPalette() { return palettes[0]; }


__gshared short Unknown7E0A34;
__gshared short Unknown7E0A36;
__gshared short Unknown7E0A38;
__gshared short Unknown7E0A3A;
__gshared short Unknown7E0A3C;
__gshared short Unknown7E0A3E;
__gshared short Unknown7E0A40;
__gshared short Unknown7E0A42;
__gshared short Unknown7E0A44;
__gshared short Unknown7E0A46;
__gshared short Unknown7E0A48;
__gshared short Unknown7E0A4A;
__gshared short Unknown7E0A4C;
__gshared short Unknown7E0A4E;
__gshared short Unknown7E0A50;
__gshared short Unknown7E0A52;
__gshared short Unknown7E0A54;
__gshared short Unknown7E0A56;
__gshared short Unknown7E0A58;
__gshared void* MOVEMENT_42_LOADED_PTR;
__gshared short Unknown7E0A5E;
__gshared short Unknown7E0A60;
__gshared short[MAX_ENTITIES] EntityScriptTable;
__gshared short[MAX_ENTITIES] Unknown30x2Table1;
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_2;
__gshared short[MAX_ENTITIES] EntityScreenXTable;
__gshared short[MAX_ENTITIES] EntityScreenYTable;
__gshared short[MAX_ENTITIES] EntityAbsXTable;
__gshared short[MAX_ENTITIES] EntityAbsYTable;
__gshared short[MAX_ENTITIES] EntityAbsZTable;
__gshared short[MAX_ENTITIES] ENTITY_ABS_X_FRACTION_TABLE;
__gshared short[MAX_ENTITIES] ENTITY_ABS_Y_FRACTION_TABLE;
__gshared short[MAX_ENTITIES] ENTITY_ABS_Z_FRACTION_TABLE;
__gshared short[MAX_ENTITIES] ENTITY_DELTA_X_TABLE;
__gshared short[MAX_ENTITIES] ENTITY_DELTA_Y_TABLE;
__gshared short[MAX_ENTITIES] ENTITY_DELTA_Z_TABLE;
__gshared short[MAX_ENTITIES] ENTITY_DELTA_X_FRACTION_TABLE;
__gshared short[MAX_ENTITIES] ENTITY_DELTA_Y_FRACTION_TABLE;
__gshared short[MAX_ENTITIES] ENTITY_DELTA_Z_FRACTION_TABLE;
__gshared short[MAX_ENTITIES] EntityScriptVar0Table;
__gshared short[MAX_ENTITIES] EntityScriptVar1Table;
__gshared short[MAX_ENTITIES] EntityScriptVar2Table;
__gshared short[MAX_ENTITIES] EntityScriptVar3Table;
__gshared short[MAX_ENTITIES] EntityScriptVar4Table;
__gshared short[MAX_ENTITIES] EntityScriptVar5Table;
__gshared short[MAX_ENTITIES] EntityScriptVar6Table;
__gshared short[MAX_ENTITIES] EntityScriptVar7Table;
__gshared short[MAX_ENTITIES] Unknown30x2Table11;

// original code isn't very portable...
/+__gshared short[MAX_ENTITIES] ENTITY_TICK_CALLBACK_LOW;
__gshared short[MAX_ENTITIES] ENTITY_TICK_CALLBACK_HIGH;+/

__gshared ushort[MAX_ENTITIES] EntityTickCallbackFlags;
__gshared void function()[MAX_ENTITIES] EntityTickCallbacks;

__gshared short[MAX_ENTITIES] EntityAnimationFrames; //$10F2

__gshared ushort[MAX_ENTITIES] EntitySpriteMapFlags;
__gshared void*[MAX_ENTITIES] EntitySpriteMapPointers;

__gshared void function()[MAX_ENTITIES] EntityScreenPositionCallbacks; //$11A6
__gshared void function()[MAX_ENTITIES] EntityDrawCallbacks; //$11E2
__gshared void function()[MAX_ENTITIES] EntityMoveCallbacks; //$121E

__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_14;
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_15;
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_16;
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_17;
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_18;
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_19;
__gshared short UNKNOWN_7E125A;

__gshared short[32] Unknown7E1AD6; //$1AD6

__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_31; //$2A42

__gshared short[MAX_ENTITIES] EntityDirections; //$2AF6

__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_36; //$2B6E


__gshared short[MAX_ENTITIES] EntityDrawSorting; //$280C

__gshared short Debug; //$436C

__gshared short Unknown7E4472; //$4472
__gshared short Unknown7E4474; //$4474

__gshared short Unknown7E4DB8; // $4DB8
__gshared short BattleSwirlFlag; // $4DBA
__gshared short BattleInitiative; // $4DBC
__gshared short Unknown7E4DBE; // $4DBE
__gshared short Unknown7E4DC0; // $4DC0
__gshared short BattleDebug; // $4DC2
__gshared short Unknown7E4DC4; // $4DC4
__gshared PartyCharacter* Unknown7E4DC6; // $4DC6
__gshared PartyCharacter*[6] ChosenFourPtrs; // $4DC8

__gshared short Unknown7E4DD4; //$4DD4
__gshared Unknown4DD6 Unknown7E4DD6; //$4DD6
__gshared Unknown4DD6 Unknown7E4F96; //$4F96

__gshared PlayerPositionBufferEntry[256] PlayerPositionBuffer;           // $5156
__gshared short MiscDebugFlags;           // $5D56
__gshared short Unknown7E5D58;           // $5D58
__gshared short Unknown7E5D5A;           // $5D5A
__gshared short Unknown7E5D5C;           // $5D5C
__gshared short Unknown7E5D5E;           // $5D5E
__gshared short BattleSwirlCountdown;           // $5D60
__gshared short CurrentTPTEntry;           // $5D62
__gshared short Unknown7E5D64;           // $5D64
__gshared short[6] Unknown7E5D66;           // $5D66
__gshared short Unknown7E5D72;           // $5D72
__gshared short Unknown7E5D74;           // $5D74
__gshared short Unknown7E5D76;           // $5D76
__gshared short Unknown7E5D78;           // $5D78

__gshared short[6] Unknown7E5D8C;           // $5D8C
__gshared short OverworldStatusSuppression;           // $5D98
__gshared short Unknown7E5D9A;           // $5D9A

__gshared short Unknown7E5DA4;           // $5DA4

__gshared short Unknown7E5DAC;           // $5DAC
__gshared short Unknown7E5DAE;           // $5DAE

__gshared short Unknown7E5DBA;           // $5DBA

__gshared short Unknown7E5DD4;           // $5DD4
__gshared short Unknown7E5DD6;           // $5DD6

__gshared short Unknown7E5DDA;           // $5DDA

__gshared short Unknown7E5E02;           // $5E02
__gshared short Unknown7E5E04;           // $5E04
__gshared short var5E6E;           // $5E6E - I have this labeled as "word-wrap flag"...

__gshared ubyte  var5E79;           // $5E79 - Mystery flag

__gshared WinStat[9]  WindowStats;    // $8650

__gshared Game_State gameState;
__gshared PartyCharacter[TOTAL_PARTY_COUNT] PartyCharacters;

__gshared short  window_head;       // $88E0 - Head of the window linked list
__gshared short  window_tail;       // $88E2 - Tail of the window linked list
__gshared short[53]  WindowTable;  // $88E4 - Index: Window ID; Value: Index to WindowStats
__gshared short  CurrentFocusWindow; // $8958 - Window ID of the focused window
__gshared WinStat* focused_window_stat;

__gshared MenuOpt[70]  menu_options;  // $89D4 - Window menu options

__gshared ubyte Unknown7E9622;           // $9622
__gshared ubyte Unknown7E9623;           // $9623
__gshared ubyte Unknown7E9624;           // $9624

__gshared ubyte Unknown7E9649;           // $9649

__gshared short  var9684;           // $9684
__gshared short  var9686;           // $9686
__gshared short  var9688;           // $9688
__gshared short  var968A;           // $968A
__gshared short Unknown7E968C;           // $968C

__gshared ushort DadPhoneTimer;           // $9E54

__gshared short Unknown7E9F2A;           // $9F2A
__gshared ubyte Unknown7E9F2C;           // $9F2C
__gshared short Unknown7E9F2D;           // $9F2D
__gshared short Unknown7E9F2F;           // $9F2F
__gshared short Unknown7E9F31;           // $9F31
__gshared short Unknown7E9F33;           // $9F33
__gshared short Unknown7E9F35;           // $9F35

__gshared short Unknown7E9F39;           // $9F39
__gshared short Unknown7E9F3B;           // $9F3B
__gshared short Unknown7E9F3D;           // $9F3D
__gshared short TeleportDestination;           // $9F3F
__gshared TeleportStyle teleportStyle;           // $9F41
__gshared short Unknown7E9F43;           // $9F43
__gshared short Unknown7E9F45;           // $9F45
__gshared short Unknown7E9F47;           // $9F47
__gshared int Unknown7E9F49;           // $9F49
__gshared int Unknown7E9F4D;           // $9F4D
__gshared int Unknown7E9F51;           // $9F51
__gshared int Unknown7E9F55;           // $9F55
__gshared short Unknown7E9F59;           // $9F59
__gshared short Unknown7E9F5B;           // $9F5B
__gshared short Unknown7E9F5D;           // $9F5D
__gshared short Unknown7E9F5F;           // $9F5F
__gshared short Unknown7E9F61;           // $9F61
__gshared short Unknown7E9F63;           // $9F63
__gshared short Unknown7E9F65;           // $9F65
__gshared short Unknown7E9F67;           // $9F67
__gshared short Unknown7E9F69;           // $9F69
__gshared short Unknown7E9F6B;           // $9F6B
__gshared short Unknown7E9F6D;           // $9F6D
__gshared short Unknown7E9F6F;           // $9F6F
__gshared short PajamaFlag;           // $9F71
__gshared short Unknown7E9F73;           // $9F73
__gshared short Unknown7E9F75;           // $9F75
__gshared short Unknown7E9F77;           // $9F77
__gshared ubyte Unknown7E9F79;           // $9F79

__gshared Battler* currentAttacker;           // $A970
__gshared Battler* currentTarget;           // $A972

__gshared ubyte  *path_matrix_buffer;      // [$B3FC] Matrix buffer
__gshared ushort  path_matrix_rows;        // [$B400] Matrix rows
__gshared ushort  path_matrix_cols;        // [$B402] Matrix columns
__gshared ushort  path_matrix_border;      // [$B404] Matrix start point border size (for offscreen deliverymen)
__gshared ushort  path_matrix_size;        // [$B406] Matrix size (path_matrix_rows * path_matrix_cols)
__gshared ushort *path_B408;               // [$B408] Pathfinder unknown int array start pointer
__gshared ushort *path_B40A;               // [$B40A] Pathfinder unknown int array end pointer
__gshared ushort *path_B40C;               // [$B40C] Pathfinder unknown int array curr pointer #1
__gshared ushort *path_B40E;               // [$B40E] Pathfinder unknown int array curr pointer #2
__gshared short[4]   path_cardinal_offset; // [$B410] Pathfinder matrix offset increments for each cardinal (N/E/S/W) direction
__gshared VecYX[4]     path_cardinal_index;  // [$B418] Pathfinder matrix index increments for each cardinal direction
__gshared VecYX[4]     path_diagonal_index;  // [$B428] Pathfinder matrix index increments for each ordinal (NE/SE/SW/NW) direction
__gshared void     *path_heap_start;         // [$B438] Pathfinder heap start pointer
__gshared void     *path_heap_current;       // [$B43A] Pathfinder heap current pointer
__gshared void     *path_heap_end;           // [$B43C] Pathfinder heap end pointer

__gshared ubyte  var7EB49D;         // $7EB49D - Addressed specifically using long addressing, why??

__gshared ubyte Unknown7EB4A2;         // $7EB4A2

__gshared ubyte Unknown7EB4B6;         // $7EB4B6

__gshared ushort CurrentMusicTrack;         // $B53B

__gshared ushort SectorBoundaryBehaviourFlag;         // $B549

__gshared ushort[0x8000] Unknown7F8000;


// Actionscript stuff. This was originally assembly and relied on some unusual direct page manipulation, which cannot be reproduced exactly

__gshared ushort ActionScript88;         // $88

__gshared void* ActionScript8C;         // $8C
