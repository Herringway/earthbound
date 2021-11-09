module earthbound.globals;

import earthbound.commondefs;
import earthbound.hardware;

__gshared ubyte DMAQueueIndex;
__gshared ubyte Unknown7E0001;
__gshared ubyte Unknown7E0002;
__gshared OAMEntry* OAMAddr;
__gshared OAMEntry* OAMEndAddr;
__gshared ubyte* OAMHighTableAddr;
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
__gshared ushort RandA;
__gshared ushort RandB;
__gshared ubyte Unknown7E0028;
__gshared ubyte Unknown7E0029;
__gshared ubyte Unknown7E002A;
__gshared ubyte Unknown7E002B;
//the ID of the frame being/about to be displayed, multiplied by 2
__gshared ubyte NextFrameDisplayID;
__gshared ubyte Unknown7E002D;
//the ID of the next frame to buffer as a byte offset - 0 for buffer 0, 2 for buffer 1
__gshared ubyte NextFrameBufferID;
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

__gshared ushort[2] pad_state;
__gshared ushort[2] pad_held;       // $0069 - Held buttons on Controllers
__gshared ushort[2] pad_press;        // $006D - Pressed buttons on Controllers
__gshared ushort[2] Unknown7E0071;
__gshared ushort Unknown7E0075;
__gshared ushort[2] Unknown7E0077;
__gshared ubyte Unknown7E007B;
__gshared ubyte Unknown7E007C;
__gshared Unknown7E007DEntry* Unknown7E007D;
__gshared ubyte Unknown7E007F;
__gshared ubyte Unknown7E0080;
__gshared short Unknown7E0081;
__gshared short Unknown7E0083;
__gshared ubyte* Unknown7E0085;
__gshared short Unknown7E0087;
__gshared short Unknown7E0089;
__gshared short Unknown7E008B;
__gshared short Unknown7E008D;
__gshared short Unknown7E008F;
__gshared ubyte Unknown7E0091; //$0091
__gshared ubyte DMA_COPY_MODE;
__gshared short DMA_COPY_SIZE;
__gshared const(void)* DMA_COPY_RAM_SRC;
__gshared short DMA_COPY_VRAM_DEST;
__gshared short Unknown7E0099;

__gshared short Unknown7E009C;
__gshared short Unknown7E009E;
__gshared ubyte Unknown7E00A0;
__gshared void* CurrentHeapAddress;
__gshared void* HeapBaseAddress;
__gshared ubyte Unknown7E00A5;
__gshared ubyte Unknown7E00A6;
__gshared uint Timer;
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
__gshared const(ubyte)* SPC_DATA_PTR;
__gshared short Unknown7E00C8;
__gshared ubyte SoundEffectQueueEndIndex;
__gshared ubyte SoundEffectQueueIndex;
__gshared short Unknown7E00CC;
__gshared ubyte Unknown7E00CE;
__gshared short Unknown7E00CF;
__gshared ubyte Unknown7E00D1;
__gshared ubyte Unknown7E00D2;
__gshared short Unknown7E00D3;

__gshared ushort[16][32] palettes; //$0200
__gshared DMAQueueEntry[30] DMAQueue;

auto ref CurrentTextPalette() { return palettes[0]; }


//OAM data for every odd frame
__gshared OAMEntry[128] OAM1; //$0500
__gshared ubyte[32] OAM1HighTable; //$0700
// Same as OAM1, but used for every other frame
__gshared OAMEntry[128] OAM2; //$0800
__gshared ubyte[32] OAM2HighTable; //$0A00

__gshared short Unknown7E0A34;
__gshared short Unknown7E0A36;
__gshared short NewEntityVar0;
__gshared short NewEntityVar1;
__gshared short NewEntityVar2;
__gshared short NewEntityVar3;
__gshared short NewEntityVar4;
__gshared short NewEntityVar5;
__gshared short NewEntityVar6;
__gshared short NewEntityVar7;
__gshared short NewEntityPosZ; //$0A48
__gshared short NewEntityPriority; //$0A4A
__gshared short EntityAllocationMinSlot; //$0A4C
__gshared short EntityAllocationMaxSlot; //$0A4E
__gshared short FirstEntity;
__gshared short Unknown7E0A52;
__gshared short Unknown7E0A54;
__gshared short Unknown7E0A56;
__gshared short Unknown7E0A58;
__gshared void* MOVEMENT_42_LOADED_PTR;
__gshared void function() Unknown7E0A5E;
__gshared short Unknown7E0A60;
__gshared short[MAX_ENTITIES] EntityScriptTable; //$0A62
__gshared short[MAX_ENTITIES] EntityNextEntityTable; //$0A9E
__gshared short[MAX_ENTITIES] EntityScriptIndexTable; //$0ADA
__gshared short[MAX_ENTITIES] EntityScreenXTable; //$0B16
__gshared short[MAX_ENTITIES] EntityScreenYTable; //$0B52
__gshared short[MAX_ENTITIES] EntityAbsXTable; //$0B8E
__gshared short[MAX_ENTITIES] EntityAbsYTable; //$0BCA
__gshared short[MAX_ENTITIES] EntityAbsZTable; //$0C06
__gshared short[MAX_ENTITIES] EntityAbsXFractionTable; //$0C42
__gshared short[MAX_ENTITIES] EntityAbsYFractionTable; //$0C7E
__gshared short[MAX_ENTITIES] EntityAbsZFractionTable; //$0CBA
__gshared short[MAX_ENTITIES] EntityDeltaXTable; //$0CF6
__gshared short[MAX_ENTITIES] EntityDeltaYTable; //$0D32
__gshared short[MAX_ENTITIES] EntityDeltaZTable; //$0D6E
__gshared short[MAX_ENTITIES] EntityDeltaXFractionTable; //$0DAA
__gshared short[MAX_ENTITIES] EntityDeltaYFractionTable; //$0DE6
__gshared short[MAX_ENTITIES] EntityDeltaZFractionTable; //$0E22
__gshared short[MAX_ENTITIES] EntityScriptVar0Table; //$0E5E
__gshared short[MAX_ENTITIES] EntityScriptVar1Table; //$0E9A
__gshared short[MAX_ENTITIES] EntityScriptVar2Table; //$0ED6
__gshared short[MAX_ENTITIES] EntityScriptVar3Table; //$0F12
__gshared short[MAX_ENTITIES] EntityScriptVar4Table; //$0F4E
__gshared short[MAX_ENTITIES] EntityScriptVar5Table; //$0F8A
__gshared short[MAX_ENTITIES] EntityScriptVar6Table; //$0FC6
__gshared short[MAX_ENTITIES] EntityScriptVar7Table; //$1002
__gshared short[MAX_ENTITIES] EntityDrawPriority; //$103E

// original code isn't very portable...
/+__gshared short[MAX_ENTITIES] ENTITY_TICK_CALLBACK_LOW; //$107A
__gshared short[MAX_ENTITIES] ENTITY_TICK_CALLBACK_HIGH; //$10B6+/

__gshared ushort[MAX_ENTITIES] EntityTickCallbackFlags;
__gshared void function()[MAX_ENTITIES] EntityTickCallbacks;

__gshared short[MAX_ENTITIES] EntityAnimationFrames; //$10F2

__gshared ushort[MAX_ENTITIES] EntitySpriteMapFlags;
__gshared const(SpriteMap)*[MAX_ENTITIES] EntitySpriteMapPointers;

__gshared void function()[MAX_ENTITIES] EntityScreenPositionCallbacks; //$11A6
__gshared void function(short)[MAX_ENTITIES] EntityDrawCallbacks; //$11E2
__gshared void function()[MAX_ENTITIES] EntityMoveCallbacks; //$121E
__gshared short[MAX_SCRIPTS] Unknown7E125A; //$125A
__gshared short[MAX_SCRIPTS] Unknown7E12E6; //$12E6
__gshared short[MAX_ENTITIES] EntitySleepFrames; //$1372
//deprecated __gshared short[MAX_ENTITIES] ENTITY_PROGRAM_COUNTER; //$13FE
//deprecated __gshared short[MAX_ENTITIES] ENTITY_PROGRAM_COUNTER_BANK; //$148A

__gshared const(void)*[MAX_ENTITIES] EntityProgramCounters;

__gshared ubyte[8] Unknown7E1A02; //$1A02
__gshared ubyte[8] Unknown7E1A0A; //$1A0A
__gshared ubyte[8] Unknown7E1A12; //$1A12
__gshared ubyte[8] Unknown7E1A1A; //$1A1A
__gshared ubyte[8] Unknown7E1A22; //$1A22
__gshared ubyte[8] Unknown7E1A2A; //$1A2A
__gshared ubyte[8] Unknown7E1A32; //$1A32
__gshared ubyte[8] Unknown7E1A3A; //$1A3A
__gshared short CurrentEntitySlot; //$1A42
__gshared short CurrentEntityOffset; //$1A44
__gshared short CurrentScriptSlot; //$1A46
__gshared short CurrentScriptOffset; //$1A48
__gshared short[MAX_ENTITIES] Unknown7E1A4A;


__gshared ubyte[8] SoundEffectQueue; //$1AC2
__gshared ubyte Unknown7E1ACA; //$1ACA
__gshared ubyte Unknown7E1ACB; //$1ACB
__gshared short Unknown7E1ACC; //$1ACC
__gshared short Unknown7E1ACE; //$1ACE

__gshared short[64] Unknown7E1AD6; //$1AD6


__gshared ubyte[24] Unknown7E1B6E; //$1B6E
__gshared ubyte[24] Unknown7E1B86; //$1B86
__gshared short Unknown7E1B9E; //$1B9E
__gshared ubyte Unknown7E1BA0; //$1BA0
__gshared short Unknown7E1BA1; //$1BA1
__gshared short Unknown7E1BA3; //$1BA3
__gshared ubyte Unknown7E1BA5; //$1BA5
__gshared ubyte Unknown7E1BA6; //$1BA6
__gshared ubyte Unknown7E1BA7; //$1BA7
__gshared ubyte Unknown7E1BA8; //$1BA8
__gshared ubyte Unknown7E1BA9; //$1BA9
//UNKNOWN_7E1BAA: ;$7E1BAA

__gshared short Unknown7E1BCA; //$1BCA
__gshared short Unknown7E1BCC; //$1BCC
__gshared short Unknown7E1BCE; //$1BCE
__gshared short Unknown7E1BD0; //$1BD0
__gshared short Unknown7E1BD2; //$1BD2
//UNKNOWN_7E1BD4: ;$7E1BD4

__gshared ubyte[0x200] heap; // $2000

__gshared ushort Unknown7E2400; //$2400
__gshared ushort Unknown7E2402; //$2402
__gshared const(SpriteMap)*[32] Unknown7E2404; //$2404
__gshared short[32] Unknown7E2444; //$2444
__gshared short[32] Unknown7E2484; //$2484
__gshared short[32] Unknown7E24C4; //$24C4
__gshared short Unknown7E2504; //$2504
__gshared const(SpriteMap)*[32] Unknown7E2506; //$2506
__gshared short[32] Unknown7E2546; //$2546
__gshared short[32] Unknown7E2586; //$2586
__gshared short[32] Unknown7E25C6; //$25C6
__gshared short Unknown7E2606; //$2606
__gshared const(SpriteMap)*[32] Unknown7E2608; //$2608
__gshared short[32] Unknown7E2648; //$2648
__gshared short[32] Unknown7E2688; //$2688
__gshared short[32] Unknown7E26C8; //$26C8
__gshared short Unknown7E2708; //$2708
__gshared const(SpriteMap)*[32] Unknown7E270A; //$270A
__gshared short[32] Unknown7E274A; //$274A
__gshared short[32] Unknown7E278A; //$278A
__gshared short[32] Unknown7E27CA; //$27CA
__gshared short Unknown7E280A; //$280A
__gshared short[MAX_ENTITIES] EntityDrawSorting; //$280C
__gshared short Unknown7E2848; //$2848
__gshared short Unknown7E284A; //$284A
__gshared ushort[MAX_ENTITIES] EntityUnknown284C; //$284C
__gshared short Unknown7E2888; //$2888
__gshared short Unknown7E288A; //$288A
__gshared short Unknown7E288C; //$288C
__gshared short Unknown7E288E; //$288E
__gshared short Unknown7E2890; //$2890
__gshared short Unknown7E2892; //$2892
__gshared short Unknown7E2894; //$2894
__gshared short Unknown7E2896; //$2896
__gshared short Unknown7E2898; //$2898
__gshared short FootstepSoundID; //$289A
__gshared short FootstepSoundIDOverride; //$289C
__gshared ushort[MAX_ENTITIES] EntityCollidedObjects; //$289E
__gshared ushort[MAX_ENTITIES] EntityObstacleFlags; //$28DA
__gshared ushort[MAX_ENTITIES] EntityUnknown2916; //$2916
__gshared ushort[MAX_ENTITIES] EntityUnknown2952; //$2952
__gshared ushort[MAX_ENTITIES] EntityVramAddresses; //$298E
//__gshared ushort[MAX_ENTITIES] EntityGraphicsPointersLow; //$29CA
//__gshared ushort[MAX_ENTITIES] EntityGraphicsPointersHigh; //$2A06
__gshared void*[MAX_ENTITIES] EntityGraphicsPointers; //$29CA
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_31; //$2A42
__gshared short[MAX_ENTITIES] EntityByteWidths; //$2A7E
__gshared short[MAX_ENTITIES] EntityTileHeights; //$2ABA
__gshared short[MAX_ENTITIES] EntityDirections; //$2AF6
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_35; //$2B32
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_36; //$2B6E
__gshared ushort[MAX_ENTITIES] EntitySurfaceFlags; //$2BAA
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_38; //$2BE6
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_40; //$2C22
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_41; //$2C5E
__gshared ushort[MAX_ENTITIES] EntityTPTEntries; //$2C9A
__gshared short[MAX_ENTITIES] EntityTPTEntrySprites; //$2CD6
__gshared short[MAX_ENTITIES] EntityEnemyIDs; //$2D12
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_43; //$2D4E
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_44; //$2D8A
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_45; //$2DC6
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_46; //$2E02
__gshared ushort[MAX_ENTITIES] Unknown7E2E3E; //$2E3E
__gshared ushort[MAX_ENTITIES] Unknown7E2E7A; //$2E7A

__gshared short[MAX_ENTITIES] Unknown7E332A; //$332A
__gshared short[MAX_ENTITIES] Unknown7E3366; //$3366
__gshared short[MAX_ENTITIES] Unknown7E33A2; //$33A2
__gshared short[MAX_ENTITIES] Unknown7E33DE; //$33DE
__gshared short[MAX_ENTITIES] Unknown7E341A; //$331A
__gshared short[MAX_ENTITIES] Unknown7E3456; //$3356
__gshared ubyte[32][52] VWFBuffer; //$3492


__gshared short Unknown7E3C14; //$3C14
__gshared short Unknown7E3C16; //$3C16
__gshared short Unknown7E3C18; //$3C18
__gshared short Unknown7E3C1A; //$3C1A
__gshared short Unknown7E3C1C; //$3C1C
__gshared short Unknown7E3C1E; //$3C1E
__gshared short Unknown7E3C20; //$3C20
__gshared ubyte Unknown7E3C22; //$3C22
__gshared ubyte Unknown7E3C23; //$3C23
__gshared short Unknown7E3C24; //$3C24
__gshared ubyte Unknown7E3C26; //$3C26
__gshared ubyte Unknown7E3C27; //$3C27
__gshared short Unknown7E3C28; //$3C28
__gshared short Unknown7E3C2A; //$3C2A
__gshared short Unknown7E3C2C; //$3C2C
__gshared short Unknown7E3C2E; //$3C2E
__gshared short Unknown7E3C30; //$3C30
__gshared short Unknown7E3C32; //$3C32

__gshared short Debug; //$436C
__gshared short Unknown7E436E; //$436E
__gshared short Unknown7E4370; //$4370
__gshared short Unknown7E4372; //$4372
__gshared short Unknown7E4374; //$4374

__gshared short Unknown7E4380; //$4380

__gshared short Unknown7E438A; //$438A
__gshared short Unknown7E438C; //$438C
__gshared short CurrentSectorAttributes; //$438E

__gshared short Unknown7E4472; //$4472
__gshared short Unknown7E4474; //$4474
__gshared short[16] Unknown7E4476; //$4476 - might be more

__gshared short Unknown7E4676; //$4676

__gshared short Unknown7E467A; //$467A
__gshared short Unknown7E467C; //$467C
__gshared SpriteMap[0] SpriteTable7E467E; //$467E

__gshared short TouchedEnemy; // $4D86

__gshared ubyte[88] Unknown7E4A00; // $4A00
__gshared short Unknown7E4A58; // $4A58
__gshared short Unknown7E4A5A; // $4A5A
__gshared short OverworldEnemyCount; // $4A5C
__gshared short Unknown7E4A5E; // $4A5E
__gshared short MagicButterfly; // $4A60
__gshared short Unknown7E4A62; //$4A62
__gshared short Unknown7E4A64; //$4A64
__gshared short ShowNPCFlag; //$4A66
__gshared short Unknown7E4A68; //$4A68
__gshared short Unknown7E4A6A; //$4A6A
__gshared short Unknown7E4A6C; //$4A6C
__gshared short Unknown7E4A6E; //$4A6E
__gshared short Unknown7E4A70; //$4A70
__gshared short Unknown7E4A72; //$4A72
__gshared short Unknown7E4A74; //$4A74
__gshared int Unknown7E4A76; //$4A76
__gshared short Unknown7E4A7A; //$4A7A

__gshared short CurrentBattleGroup; // $4A8C

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
__gshared MovementSpeeds[14] horizontalMovementSpeeds; //$4DD6
__gshared MovementSpeeds[14] verticalMovementSpeeds; //$4F96

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

__gshared short Unknown7E5D7E;           // $5D7E

__gshared short[6] Unknown7E5D8C;           // $5D8C
__gshared short OverworldStatusSuppression;           // $5D98
__gshared short Unknown7E5D9A;           // $5D9A

__gshared short Unknown7E5DA4;           // $5DA4

__gshared short Unknown7E5DAC;           // $5DAC
__gshared short Unknown7E5DAE;           // $5DAE

__gshared short Unknown7E5DBA;           // $5DBA

__gshared short CurrentQueuedInteractionType;           // $5DC0

__gshared short Unknown7E5DD4;           // $5DD4
__gshared short Unknown7E5DD6;           // $5DD6
__gshared short Unknown7E5DD8;           // $5DD8

__gshared short Unknown7E5DDA;           // $5DDA

__gshared short CurrentQueuedInteraction;           // $5E02
__gshared short NextQueuedInteraction;           // $5E04

__gshared const(OverworldEventMusic)* Unknown7E5E38;           // $5E38

__gshared ubyte Unknown7E5E6C;           // $5E6C
__gshared ubyte Unknown7E5E6D;           // $5E6D
__gshared short Unknown7E5E6E;           // $5E6E - I have this labeled as "word-wrap flag"...
__gshared ubyte Unknown7E5E70;           // $5E70
__gshared ubyte Unknown7E5E71;           // $5E71
__gshared ubyte Unknown7E5E72;           // $5E72
__gshared ubyte Unknown7E5E73;           // $5E73
__gshared ubyte Unknown7E5E74;           // $5E74
__gshared ubyte Unknown7E5E75;           // $5E75
__gshared ubyte Unknown7E5E76;           // $5E76
__gshared ubyte Unknown7E5E77;           // $5E77
__gshared ubyte Unknown7E5E78;           // $5E78
__gshared ubyte Unknown7E5E79;           // $5E79 - Mystery flag
__gshared short Unknown7E5E7A;           // $5E7A
__gshared short Unknown7E5E7C;           // $5E7C

__gshared ushort[0x380] bg2Buffer;           // $7DFE

__gshared ushort[0x100] Unknown7E827E;           // $827E

__gshared WinStat[9]  WindowStats;    // $8650

__gshared Game_State gameState;
__gshared PartyCharacter[TOTAL_PARTY_COUNT] PartyCharacters;
__gshared ubyte[EVENT_FLAG_COUNT / 8] EventFlags;


__gshared short  window_head;       // $88E0 - Head of the window linked list
__gshared short  window_tail;       // $88E2 - Tail of the window linked list
__gshared short[53]  WindowTable;  // $88E4 - Index: Window ID; Value: Index to WindowStats
__gshared short[5] Unknown7E894E; //$894E
__gshared short  CurrentFocusWindow; // $8958 - Window ID of the focused window
__gshared ubyte[0] Unknown7E895A; //$895A

__gshared ubyte[3] HPPPWindowDigitBuffer; //$8966
__gshared ushort[12][4] HPPPWindowBuffer; //$8969

__gshared ubyte Unknown7E89C9;           // $89C9
__gshared short BattleMenuCurrentCharacterID;           // $89CA

__gshared short Unknown7E89CC;           // $89CC
__gshared short Unknown7E89CE;           // $89CE
__gshared short Unknown7E89D0;           // $89D0
__gshared short Unknown7E89D2;           // $89D2
__gshared MenuOpt[70]  MenuOptions;  // $89D4 - Window menu options

__gshared ubyte Unknown7E9622;           // $9622
__gshared ubyte Unknown7E9623;           // $9623
__gshared ubyte Unknown7E9624;           // $9624
__gshared ushort SelectedTextSpeed;           // $9625
__gshared uint Unknown7E9627;           // $9627

__gshared void*[4] Unknown7E9631;           // $9631
__gshared short Unknown7E9641;           // $9641
__gshared short BattleModeFlag;           // $9643
__gshared short InputLockFlag;           // $9645
__gshared short Unknown7E9647;           // $9647
__gshared short Unknown7E9649;           // $9649
__gshared short Unknown7E964B;           // $964B
__gshared ushort BlinkingTriangleFlag;           // $964D
__gshared ushort Unknown7E964F;           // $964F
__gshared ubyte Unknown7E9651;           // $9651
__gshared ushort Unknown7E9652;           // $9652
__gshared ushort Unknown7E9654;           // $9654

__gshared short Unknown7E9658;           // $9658
__gshared short Unknown7E965A;           // $965A

__gshared short Unknown7E9684;           // $9684
__gshared short Unknown7E9686;           // $9686
__gshared short Unknown7E9688;           // $9688
__gshared short Unknown7E968A;           // $968A
__gshared short Unknown7E968C;           // $968C

__gshared ubyte Unknown7E9695;           // $9695

__gshared ubyte Unknown7E9696;           // $9696
__gshared ubyte Unknown7E9697;           // $9697
__gshared ubyte Unknown7E9698;           // $9698

__gshared WindowTextAttributesCopy Unknown7E9C8A;           // $9C8A

__gshared short RespawnX;           // $9D1F
__gshared short RespawnY;           // $9D21
// is this the actual size? maybe it's 0x100?
__gshared ubyte[0x20][8] Unknown7E9D23;           // $9D23

__gshared ushort VWFX;           // $9E23
__gshared ushort VWFTile;           // $9E25
__gshared ushort Unknown7E9E27;           // $9E27
__gshared ushort Unknown7E9E29;           // $9E29

__gshared ushort DMATransferFlag;           // $9E2B
__gshared ushort EntityPreparedXCoordinate;           // $9E2D
__gshared ushort EntityPreparedYCoordinate;           // $9E2F
__gshared ushort EntityPreparedDirection;           // $9E31

__gshared Unknown7E9E3CEntry[4] Unknown7E9E3C;           // $9E3C

__gshared ushort DadPhoneTimer;           // $9E54
__gshared short Unknown7E9E56;           // $9E56

__gshared LoadedItemTransformation[4] LoadedItemTransformations;           // $9F1A

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
__gshared FixedPoint1616 Unknown7E9F45;           // $9F45
//__gshared short Unknown7E9F47;           // $9F47
__gshared FixedPoint1616 Unknown7E9F49;           // $9F49
__gshared FixedPoint1616 Unknown7E9F4D;           // $9F4D
__gshared FixedPoint1616 Unknown7E9F51;           // $9F51
__gshared FixedPoint1616 Unknown7E9F55;           // $9F55
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
__gshared short Unknown7E9F7A; //$9F7A
__gshared short Unknown7E9F7C; //$9F7C
__gshared short Unknown7E9F7E; //$9F7E
__gshared short Unknown7E9F80; //$9F80
__gshared short Unknown7E9F82; //$9F82
__gshared short Unknown7E9F84; //$9F84
__gshared short Unknown7E9F86; //$9F86
__gshared short Unknown7E9F88; //$9F88
__gshared short EnemiesInBattle; //$9F8A
__gshared short[16] Unknown7E9F8C; //$9F8C
__gshared Battler[32] BattlersTable; //$9FAC
__gshared uint BattlerTargetFlags; //$A96C
__gshared Battler* currentAttacker;           // $A970
__gshared Battler* currentTarget;           // $A972
__gshared uint BattleEXPScratch;           // $A974
__gshared ushort BattleMoneyScratch;           // $A978
__gshared ushort CurrentGiygasPhase;           // $A97A
__gshared ubyte Unknown7EA97C; //$A97C
__gshared UnknownA97D Unknown7EA97D; //$A97D
__gshared ubyte[27] AttackerNameAdjustScratch; //$A983
__gshared ubyte[27] TargetNameAdjustScratch; //$A99E
__gshared ubyte[27] Unknown7EA9B9; //$A9B9
//UNKNOWN_7EA9D4: ;$7EA9D4

__gshared short Unknown7EAA0C; //$AA0C
__gshared short Unknown7EAA0E; //$AA0E
__gshared short ItemDropped; //$AA10
__gshared short MirrorEnemy; //$AA12
__gshared Battler Unknown7EAA14; //$AA14

__gshared ushort MirrorTurnTimer; //$AA64
__gshared ushort[5] Unknown7EAA66; //$AA66
__gshared ushort Unknown7EAA70; //$AA70
__gshared ushort Unknown7EAA72; //$AA72
__gshared ushort Unknown7EAA74; //$AA74
__gshared ushort[4] Unknown7EAA76; //$AA76
__gshared ushort[4] Unknown7EAA7E; //$AA7E
__gshared ushort[4] Unknown7EAA86; //$AA86
__gshared ushort Unknown7EAA8E; //$AA8E
__gshared ushort Unknown7EAA90; //$AA90
__gshared ushort Unknown7EAA92; //$AA92
__gshared ushort Unknown7EAA94; //$AA94
__gshared ushort Unknown7EAA96; //$AA96
__gshared ubyte[26] Unknown7EAA98; //$AA98
__gshared ushort Unknown7EAAB2; //$AAB2
__gshared ushort Unknown7EAAB4; //$AAB4
__gshared ubyte[8] Unknown7EAAB6; //$AAB6
__gshared ushort[4] Unknown7EAABE; //$AABE
__gshared ubyte[8] Unknown7EAAC6; //$AAC6
__gshared ubyte[8] Unknown7EAACE; //$AACE
//UNKNOWN_7EAAD6: ;$7EAAD6
//	.RES 80 * 4
//UNKNOWN_7EAC16: ;$7EAC16
//	.RES 80 * 4
__gshared ushort Unknown7EAD56; //$AD56
__gshared ushort Unknown7EAD58; //$AD58
__gshared ubyte[8] Unknown7EAD5A; //$AD5A
__gshared ubyte[8] Unknown7EAD62; //$AD62
__gshared ubyte[8] Unknown7EAD6A; //$AD6A
__gshared ubyte[8] Unknown7EAD72; //$AD72
__gshared ubyte[8] Unknown7EAD7A; //$AD7A
__gshared ubyte[8] Unknown7EAD82; //$AD82
__gshared short Unknown7EAD8A; //$AD8A
__gshared short VerticalShakeDuration; //$AD8C
__gshared short VerticalShakeHoldDuration; //$AD8E
__gshared short Unknown7EAD90; //$AD90
__gshared short WobbleDuration; //$AD92
__gshared short ShakeDuration; //$AD94
__gshared short Unknown7EAD96; //$AD96
__gshared short Unknown7EAD98; //$AD98
__gshared short Unknown7EAD9A; //$AD9A
__gshared short Unknown7EAD9C; //$AD9C
__gshared short GreenFlashDuration; //$AD9E
__gshared short RedFlashDuration; //$ADA0
__gshared short Unknown7EADA2; //$ADA2
__gshared short HPPPBoxBlinkDuration; //$ADA4
__gshared short HPPPBoxBlinkTarget; //$ADA6
__gshared short Unknown7EADA8; //$ADA8
__gshared short Unknown7EADAA; //$ADAA
__gshared short Unknown7EADAC; //$ADAC
__gshared short Unknown7EADAE; //$ADAE
__gshared short Unknown7EADB0; //$ADB0
__gshared short Unknown7EADB2; //$ADB2
__gshared short Unknown7EADB4; //$ADB4
__gshared short Unknown7EADB6; //$ADB6
__gshared HDMAWordTransfer[6] Unknown7EADB8; //$ADB8

__gshared short Unknown7EADCC; // $ADCC
__gshared short Unknown7EADCE; // $ADCE
__gshared short Unknown7EADD0; // $ADD0
__gshared short Unknown7EADD2; // $ADD2
__gshared LoadedBackgroundData LoadedBGDataLayer1; // $ADD4
__gshared LoadedBackgroundData LoadedBGDataLayer2; // $AE4B
__gshared ubyte Unknown7EAEC2; // $AEC2
__gshared ubyte Unknown7EAEC3; // $AEC3
__gshared ubyte Unknown7EAEC4; // $AEC4
__gshared ubyte Unknown7EAEC5; //$AEC5
__gshared ubyte Unknown7EAEC6; //$AEC6
__gshared ubyte Unknown7EAEC7; //$AEC7
__gshared ubyte Unknown7EAEC8; //$AEC8
__gshared ubyte Unknown7EAEC9; //$AEC9
__gshared ubyte Unknown7EAECA; //$AECA
__gshared ubyte Unknown7EAECB; //$AECB
__gshared const(Unknown7EAECCEntry)* Unknown7EAECC; // $AECC
__gshared short Unknown7EAED0; //$AED0
__gshared short Unknown7EAED2; //$AED2
__gshared short Unknown7EAED4; //$AED4
__gshared short Unknown7EAED6; //$AED6
__gshared short Unknown7EAED8; //$AED8
__gshared short Unknown7EAEDA; //$AEDA
__gshared short Unknown7EAEDC; //$AEDC
__gshared short Unknown7EAEDE; //$AEDE
__gshared short Unknown7EAEE0; //$AEE0
__gshared short Unknown7EAEE2; //$AEE2
__gshared ubyte Unknown7EAEE4; //$AEE4
__gshared ubyte Unknown7EAEE5; //$AEE5
__gshared ubyte Unknown7EAEE6; //$AEE6
__gshared ushort[4] Unknown7EAEE7; //$AEE7
__gshared ubyte Unknown7EAEEF; //$AEEF
__gshared ushort Unknown7EAEF0; //$AEF0
__gshared ushort Unknown7EAEF2; //$AEF2
__gshared ushort[4] Unknown7EAEF4; //$AEF4
//UNKNOWN_7EAEFC: ;$7EAEFC

__gshared ubyte* path_matrix_buffer;      // [$B3FC] Matrix buffer
__gshared ushort path_matrix_rows;        // [$B400] Matrix rows
__gshared ushort path_matrix_cols;        // [$B402] Matrix columns
__gshared ushort path_matrix_border;      // [$B404] Matrix start point border size (for offscreen deliverymen)
__gshared ushort path_matrix_size;        // [$B406] Matrix size (path_matrix_rows * path_matrix_cols)
__gshared ushort* path_B408;               // [$B408] Pathfinder unknown int array start pointer
__gshared ushort* path_B40A;               // [$B40A] Pathfinder unknown int array end pointer
__gshared ushort* path_B40C;               // [$B40C] Pathfinder unknown int array curr pointer #1
__gshared ushort* path_B40E;               // [$B40E] Pathfinder unknown int array curr pointer #2
__gshared short[4] path_cardinal_offset; // [$B410] Pathfinder matrix offset increments for each cardinal (N/E/S/W) direction
__gshared VecYX[4] path_cardinal_index;  // [$B418] Pathfinder matrix index increments for each cardinal direction
__gshared VecYX[4] path_diagonal_index;  // [$B428] Pathfinder matrix index increments for each ordinal (NE/SE/SW/NW) direction
__gshared void* path_heap_start;         // [$B438] Pathfinder heap start pointer
__gshared void* path_heap_current;       // [$B43A] Pathfinder heap current pointer
__gshared void* path_heap_end;           // [$B43C] Pathfinder heap end pointer

__gshared ubyte  Unknown7EB49D;         // $7EB49D - Addressed specifically using long addressing, why??

__gshared ubyte Unknown7EB4A2;         // $7EB4A2

__gshared short Unknown7EB4A8;         // $7EB4A8

__gshared short Unknown7EB4AE;         // $7EB4AE

__gshared short Unknown7EB4B0;         // $7EB4B0
__gshared short Unknown7EB4B2;         // $7EB4B2

__gshared ubyte Unknown7EB4B6;         // $7EB4B6

__gshared ubyte Unknown7EB4CE;         // $7EB4CE

__gshared ushort[11] Unknown7EB525;         // $B525
__gshared ushort CurrentMusicTrack;         // $B53B
__gshared ushort CurrentPrimarySamplePack; //$B53D
__gshared ushort CurrentSecondarySamplePack; //$B53F
__gshared ushort CurrentSequencePack; //$B541
__gshared short Unknown7EB543;         // $B543
__gshared short Unknown7EB545;         // $B545
__gshared short Unknown7EB547;         // $B547
__gshared ushort SectorBoundaryBehaviourFlag;         // $B549
__gshared ushort Unknown7EB54B; //$B54B
__gshared ushort Unknown7EB54D; //$B54D
__gshared ushort Unknown7EB54F; //$B54F
__gshared ushort Unknown7EB551; //$B551
__gshared ushort Unknown7EB553; //$B553
__gshared ushort DebugMenuCursorPosition; //$B555
__gshared ushort Unknown7EB557; //$B557
__gshared ushort DebugModeNumber;         // $B559

__gshared short[38] Unknown7EB511; //$B511

__gshared ushort Unknown7EB55D; //$B55D
__gshared ushort Unknown7EB55F; //$B55F
__gshared ushort DebugStartPositionX; //$B561
__gshared ushort DebugStartPositionY; //$B563
__gshared ushort DebugUnknownB565; //$B565
__gshared ushort Unknown7EB567; //$B567
__gshared ushort Unknown7EB569; //$B569
__gshared ushort Unknown7EB56B; //$B56B
__gshared ushort Unknown7EB56D; //$B56D
__gshared ushort Unknown7EB56F; //$B56F
__gshared ushort Unknown7EB571; //$B571
__gshared ushort Unknown7EB573; //$B573
__gshared ushort Unknown7EB575; //$B575

__gshared ubyte[64][64] Unknown7EE000;
__gshared ubyte[0x8000] Unknown7F0000;
__gshared ubyte[0x8000] Unknown7F8000;

__gshared ubyte[0x8000] IntroBG2Buffer; //$7E8000 - this seems to overlap with other stuff...?


// Actionscript stuff. This was originally assembly and relied on some unusual direct page manipulation, which cannot be reproduced exactly

__gshared ubyte ActionScript00;         // $00
__gshared ubyte ActionScript02;         // $02

__gshared short ActionScript06;         // $06
__gshared short ActionScript08;         // $08

__gshared ushort ActionScript88;         // $88

__gshared const(SpriteMap)* ActionScript8C;         // $8C
__gshared ubyte ActionScript8E;         // $8E

// Other hardware stuff

SRAM sram;
