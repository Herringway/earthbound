/// Every one of Earthbound's global variables
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
__gshared ushort Unknown7E000B;
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
__gshared void function() IRQCallback;
__gshared ubyte Unknown7E0022;
__gshared ubyte Unknown7E0023;
__gshared ushort RandA;
__gshared ushort RandB;
__gshared Unknown7E0028Union Unknown7E0028;
__gshared byte Unknown7E002A;
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
__gshared ushort[2] pad_held; /// $0069 - Held buttons on Controllers
__gshared ushort[2] pad_press; /// $006D - Pressed buttons on Controllers
__gshared ushort[2] Unknown7E0071;
__gshared ushort Unknown7E0075;
__gshared ushort[2] Unknown7E0077;
__gshared ushort Unknown7E007B;
__gshared Unknown7E007DEntry* Unknown7E007D;
__gshared ubyte Unknown7E007F;
__gshared ubyte Unknown7E0080;
__gshared short Unknown7E0081;
__gshared short Unknown7E0083;
__gshared Unknown7E007DEntry* Unknown7E0085;
__gshared short Unknown7E0087;
__gshared short Unknown7E0089;
__gshared short Unknown7E008B;
__gshared short Unknown7E008D;
__gshared short Unknown7E008F;
__gshared ubyte Unknown7E0091; /// $0091
__gshared ubyte DMA_COPY_MODE;
__gshared ushort DMA_COPY_SIZE;
__gshared const(void)* DMA_COPY_RAM_SRC;
__gshared ushort DMA_COPY_VRAM_DEST;
__gshared short Unknown7E0099;
__gshared short Unknown7E009B;
__gshared short Unknown7E009D;
__gshared short Unknown7E009F;
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

__gshared ushort[16][32] palettes; /// $0200
__gshared DMAQueueEntry[30] DMAQueue; /// $0400

auto ref CurrentTextPalette() { return palettes[0]; }


//OAM data for every odd frame
__gshared OAMEntry[128] OAM1; /// $0500
__gshared ubyte[32] OAM1HighTable; /// $0700
// Same as OAM1, but used for every other frame
__gshared OAMEntry[128] OAM2; /// $0800
__gshared ubyte[32] OAM2HighTable; /// $0A00

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
__gshared short NewEntityPosZ; /// $0A48
__gshared short NewEntityPriority; /// $0A4A
__gshared short EntityAllocationMinSlot; /// $0A4C
__gshared short EntityAllocationMaxSlot; /// $0A4E
__gshared short FirstEntity;
__gshared short Unknown7E0A52;
__gshared short Unknown7E0A54;
__gshared short Unknown7E0A56;
__gshared short Unknown7E0A58;
__gshared void function() Movement42LoadedPtr;
__gshared void function() Unknown7E0A5E;
__gshared short Unknown7E0A60;
__gshared short[MAX_ENTITIES] EntityScriptTable; /// $0A62
__gshared short[MAX_ENTITIES] EntityNextEntityTable; /// $0A9E
__gshared short[MAX_ENTITIES] EntityScriptIndexTable; /// $0ADA
__gshared short[MAX_ENTITIES] EntityScreenXTable; /// $0B16
__gshared short[MAX_ENTITIES] EntityScreenYTable; /// $0B52
__gshared short[MAX_ENTITIES] EntityAbsXTable; /// $0B8E
__gshared short[MAX_ENTITIES] EntityAbsYTable; /// $0BCA
__gshared short[MAX_ENTITIES] EntityAbsZTable; /// $0C06
__gshared short[MAX_ENTITIES] EntityAbsXFractionTable; /// $0C42
__gshared short[MAX_ENTITIES] EntityAbsYFractionTable; /// $0C7E
__gshared short[MAX_ENTITIES] EntityAbsZFractionTable; /// $0CBA
__gshared short[MAX_ENTITIES] EntityDeltaXTable; /// $0CF6
__gshared short[MAX_ENTITIES] EntityDeltaYTable; /// $0D32
__gshared short[MAX_ENTITIES] EntityDeltaZTable; /// $0D6E
__gshared short[MAX_ENTITIES] EntityDeltaXFractionTable; /// $0DAA
__gshared short[MAX_ENTITIES] EntityDeltaYFractionTable; /// $0DE6
__gshared short[MAX_ENTITIES] EntityDeltaZFractionTable; /// $0E22
__gshared short[MAX_ENTITIES] EntityScriptVar0Table; /// $0E5E
__gshared short[MAX_ENTITIES] EntityScriptVar1Table; /// $0E9A
__gshared short[MAX_ENTITIES] EntityScriptVar2Table; /// $0ED6
__gshared short[MAX_ENTITIES] EntityScriptVar3Table; /// $0F12
__gshared short[MAX_ENTITIES] EntityScriptVar4Table; /// $0F4E
__gshared short[MAX_ENTITIES] EntityScriptVar5Table; /// $0F8A
__gshared short[MAX_ENTITIES] EntityScriptVar6Table; /// $0FC6
__gshared short[MAX_ENTITIES] EntityScriptVar7Table; /// $1002
__gshared ushort[MAX_ENTITIES] EntityDrawPriority; /// $103E

// original code isn't very portable...
/+__gshared short[MAX_ENTITIES] ENTITY_TICK_CALLBACK_LOW; /// $107A
__gshared short[MAX_ENTITIES] ENTITY_TICK_CALLBACK_HIGH; /// $10B6+/

__gshared ushort[MAX_ENTITIES] EntityTickCallbackFlags;
__gshared void function()[MAX_ENTITIES] EntityTickCallbacks;

__gshared short[MAX_ENTITIES] EntityAnimationFrames; /// $10F2

__gshared ushort[MAX_ENTITIES] EntitySpriteMapFlags;
__gshared const(SpriteMap)*[MAX_ENTITIES] EntitySpriteMapPointers;

__gshared void function()[MAX_ENTITIES] EntityScreenPositionCallbacks; /// $11A6
__gshared void function(short, short)[MAX_ENTITIES] EntityDrawCallbacks; /// $11E2
__gshared void function()[MAX_ENTITIES] EntityMoveCallbacks; /// $121E
__gshared short[MAX_SCRIPTS] Unknown7E125A; /// $125A
__gshared short[MAX_SCRIPTS] Unknown7E12E6; /// $12E6
__gshared short[MAX_ENTITIES] EntitySleepFrames; /// $1372
//deprecated __gshared short[MAX_ENTITIES] ENTITY_PROGRAM_COUNTER; /// $13FE
//deprecated __gshared short[MAX_ENTITIES] ENTITY_PROGRAM_COUNTER_BANK; /// $148A

__gshared const(ubyte)*[MAX_ENTITIES] EntityProgramCounters;

__gshared short[MAX_SCRIPTS] EntityTempvars; /// $1516

__gshared ActionLoopCallState[5][MAX_SCRIPTS] Unknown7E15A2; /// $15A2
__gshared short[4] Unknown7E1A02; /// $1A02
__gshared short[4] Unknown7E1A0A; /// $1A0A
__gshared short[4] Unknown7E1A12; /// $1A12
__gshared short[4] Unknown7E1A1A; /// $1A1A
__gshared short[4] Unknown7E1A22; /// $1A22
__gshared short[4] Unknown7E1A2A; /// $1A2A
__gshared short[4] Unknown7E1A32; /// $1A32
__gshared short[4] Unknown7E1A3A; /// $1A3A
__gshared short CurrentEntitySlot; /// $1A42
__gshared short CurrentEntityOffset; /// $1A44
__gshared short CurrentScriptSlot; /// $1A46
__gshared short CurrentScriptOffset; /// $1A48
__gshared short[MAX_ENTITIES] Unknown7E1A4A; //$1A4A
__gshared short[MAX_ENTITIES] Unknown7E1A86; /// $1A86
__gshared ubyte[8] SoundEffectQueue; /// $1AC2
__gshared ubyte Unknown7E1ACA; /// $1ACA
__gshared ubyte Unknown7E1ACB; /// $1ACB
__gshared short Unknown7E1ACC; /// $1ACC
__gshared short Unknown7E1ACE; /// $1ACE

__gshared short Unknown7E1AD2; /// $1AD2
__gshared short Unknown7E1AD4; /// $1AD4
__gshared short[64] Unknown7E1AD6; /// $1AD6


__gshared ubyte[24] Unknown7E1B56; /// $1B56
__gshared ubyte[24] Unknown7E1B6E; /// $1B6E
__gshared ubyte[24] Unknown7E1B86; /// $1B86
__gshared ubyte Unknown7E1B9E; /// $1B9E
__gshared ubyte Unknown7E1B9F; /// $1B9F
__gshared ubyte Unknown7E1BA0; /// $1BA0
__gshared const(ubyte)* Unknown7E1BA1; /// $1BA1
__gshared ubyte Unknown7E1BA5; /// $1BA5
__gshared ubyte Unknown7E1BA6; /// $1BA6
__gshared ubyte Unknown7E1BA7; /// $1BA7
__gshared ubyte Unknown7E1BA8; /// $1BA8
__gshared ubyte Unknown7E1BA9; /// $1BA9
__gshared ushort[16] Unknown7E1BAA; /// $1BAA
__gshared ushort* Unknown7E1BCA; /// $1BCA
__gshared short Unknown7E1BCC; /// $1BCC
__gshared short Unknown7E1BCE; /// $1BCE
__gshared short Unknown7E1BD0; /// $1BD0
__gshared short Unknown7E1BD2; /// $1BD2
__gshared short Unknown7E1BD4; /// $1BD4

__gshared ubyte[0x200][2] heap; /// $2000

__gshared ushort Unknown7E2400; /// $2400
__gshared ushort Unknown7E2402; /// $2402
__gshared const(SpriteMap)*[32] Unknown7E2404; /// $2404
__gshared short[32] Unknown7E2444; /// $2444
__gshared short[32] Unknown7E2484; /// $2484
__gshared ushort[32] Unknown7E24C4; /// $24C4
__gshared short Unknown7E2504; /// $2504
__gshared const(SpriteMap)*[32] Unknown7E2506; /// $2506
__gshared short[32] Unknown7E2546; /// $2546
__gshared short[32] Unknown7E2586; /// $2586
__gshared ushort[32] Unknown7E25C6; /// $25C6
__gshared short Unknown7E2606; /// $2606
__gshared const(SpriteMap)*[32] Unknown7E2608; /// $2608
__gshared short[32] Unknown7E2648; /// $2648
__gshared short[32] Unknown7E2688; /// $2688
__gshared ushort[32] Unknown7E26C8; /// $26C8
__gshared short Unknown7E2708; /// $2708
__gshared const(SpriteMap)*[32] Unknown7E270A; /// $270A
__gshared short[32] Unknown7E274A; /// $274A
__gshared short[32] Unknown7E278A; /// $278A
__gshared ushort[32] Unknown7E27CA; /// $27CA
__gshared short Unknown7E280A; /// $280A
__gshared short[MAX_ENTITIES] EntityDrawSorting; /// $280C
__gshared short Unknown7E2848; /// $2848
__gshared short Unknown7E284A; /// $284A
__gshared ushort[MAX_ENTITIES] EntityUnknown284C; /// $284C
__gshared short Unknown7E2888; /// $2888
__gshared short Unknown7E288A; /// $288A
__gshared short Unknown7E288C; /// $288C
__gshared short Unknown7E288E; /// $288E
__gshared short Unknown7E2890; /// $2890
__gshared short Unknown7E2892; /// $2892
__gshared short Unknown7E2894; /// $2894
__gshared short Unknown7E2896; /// $2896
__gshared short Unknown7E2898; /// $2898
__gshared short FootstepSoundID; /// $289A
__gshared short FootstepSoundIDOverride; /// $289C
__gshared ushort[MAX_ENTITIES] EntityCollidedObjects; /// $289E
__gshared ushort[MAX_ENTITIES] EntityObstacleFlags; /// $28DA
__gshared ushort[MAX_ENTITIES] EntityUnknown2916; /// $2916
__gshared ushort[MAX_ENTITIES] EntityUnknown2952; /// $2952
__gshared ushort[MAX_ENTITIES] EntityVramAddresses; /// $298E
//__gshared ushort[MAX_ENTITIES] EntityGraphicsPointersLow; /// $29CA
//__gshared ushort[MAX_ENTITIES] EntityGraphicsPointersHigh; /// $2A06
__gshared OverworldSpriteGraphics*[MAX_ENTITIES] EntityGraphicsPointers; /// $29CA
//__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_31; /// $2A42
__gshared short[MAX_ENTITIES] EntityByteWidths; /// $2A7E
__gshared short[MAX_ENTITIES] EntityTileHeights; /// $2ABA
__gshared short[MAX_ENTITIES] EntityDirections; /// $2AF6
__gshared short[MAX_ENTITIES] UNKNOWN_30X2_TABLE_35; /// $2B32
__gshared short[MAX_ENTITIES] EntitySizes; /// $2B6E
__gshared ushort[MAX_ENTITIES] EntitySurfaceFlags; /// $2BAA
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_38; /// $2BE6
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_40; /// $2C22
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_41; /// $2C5E
__gshared ushort[MAX_ENTITIES] EntityTPTEntries; /// $2C9A
__gshared short[MAX_ENTITIES] EntityTPTEntrySprites; /// $2CD6
__gshared short[MAX_ENTITIES] EntityEnemyIDs; /// $2D12
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_43; /// $2D4E
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_44; /// $2D8A
__gshared ushort[MAX_ENTITIES] UNKNOWN_30X2_TABLE_45; /// $2DC6
__gshared VecYX*[MAX_ENTITIES] UNKNOWN_30X2_TABLE_46; /// $2E02
__gshared ushort[MAX_ENTITIES] Unknown7E2E3E; /// $2E3E
__gshared ushort[MAX_ENTITIES] Unknown7E2E7A; /// $2E7A
__gshared const(OverlayScript)*[MAX_ENTITIES] EntityMushroomizedOverlayPtrs; //$2EB6
__gshared ushort[MAX_ENTITIES] Unknown7E2EF2; //$2EF2
__gshared const(SpriteMap)*[MAX_ENTITIES] Unknown7E2F2E; //$2F2E
__gshared const(OverlayScript)*[MAX_ENTITIES] EntitySweatingOverlayPtrs; //$2F6A
__gshared ushort[MAX_ENTITIES] Unknown7E2FA6; //$2FA6
__gshared const(SpriteMap)*[MAX_ENTITIES] Unknown7E2FE2; //$2FE2
__gshared const(OverlayScript)*[MAX_ENTITIES] EntityRippleOverlayPtrs; //$301E
__gshared ushort[MAX_ENTITIES] Unknown7E305A; //$305A
__gshared const(SpriteMap)*[MAX_ENTITIES] Unknown7E3096; //$3096
__gshared const(OverlayScript)*[MAX_ENTITIES] EntityBigRippleOverlayPtrs; //$30D2
__gshared ushort[MAX_ENTITIES] Unknown7E310E; //$310E
__gshared const(SpriteMap)*[MAX_ENTITIES] Unknown7E314A; //$314A
__gshared short[MAX_ENTITIES] Unknown7E3186; //$3186

__gshared short[MAX_ENTITIES] Unknown7E332A; /// $332A
__gshared short[MAX_ENTITIES] Unknown7E3366; /// $3366
__gshared short[MAX_ENTITIES] Unknown7E33A2; /// $33A2
__gshared short[MAX_ENTITIES] Unknown7E33DE; /// $33DE
__gshared short[MAX_ENTITIES] Unknown7E341A; /// $331A
__gshared short[MAX_ENTITIES] Unknown7E3456; /// $3356
__gshared ubyte[32][52] VWFBuffer; /// $3492


__gshared short Unknown7E3C14; /// $3C14
__gshared short Unknown7E3C16; /// $3C16
__gshared short Unknown7E3C18; /// $3C18
__gshared short Unknown7E3C1A; /// $3C1A
__gshared short Unknown7E3C1C; /// $3C1C
__gshared short Unknown7E3C1E; /// $3C1E
__gshared short Unknown7E3C20; /// $3C20
__gshared short Unknown7E3C22; /// $3C22
__gshared short Unknown7E3C24; /// $3C24
__gshared short Unknown7E3C26; /// $3C26
__gshared short Unknown7E3C28; /// $3C28
__gshared short Unknown7E3C2A; /// $3C2A
__gshared short Unknown7E3C2C; /// $3C2C
__gshared short Unknown7E3C2E; /// $3C2E
__gshared short Unknown7E3C30; /// $3C30
__gshared ubyte[6] Unknown7E3C32; /// $3C32

__gshared ubyte[6] Unknown7E3C3C; /// $3C3C

__gshared ushort[448] Unknown7E3C46; /// $3C46
__gshared HDMATableEntry[3] Unknown7E3FC6; /// $3FC6

__gshared ubyte[200] Unknown7E3FD0; /// $3FD0
__gshared ubyte[200] Unknown7E4098; /// $4098
__gshared ubyte[200] Unknown7E4160; /// $4160

__gshared short Debug; /// $436C
__gshared short Unknown7E436E; /// $436E
__gshared short Unknown7E4370; /// $4370
__gshared short Unknown7E4372; /// $4372
__gshared short Unknown7E4374; /// $4374
__gshared short Unknown7E4376; /// $4376

__gshared short Unknown7E437C; /// $437C
__gshared short Unknown7E437E; /// $437E

__gshared short Unknown7E4380; /// $4380
__gshared short Unknown7E4382; /// $4382

__gshared short Unknown7E4386; /// $4386
__gshared short Unknown7E4388; /// $4388

__gshared short Unknown7E438A; /// $438A
__gshared short Unknown7E438C; /// $438C
__gshared short CurrentSectorAttributes; /// $438E
__gshared byte[16] Unknown7E4390; /// $4390
__gshared byte[16] Unknown7E43A0; /// $43A0
__gshared byte[16] Unknown7E43B0; /// $43B0
__gshared byte[16] Unknown7E43C0; /// $43C0
__gshared ushort Unknown7E43D0; /// $43D0
__gshared ushort Unknown7E43D2; /// $43D2
__gshared ushort Unknown7E43D4; /// $43D4
__gshared ushort Unknown7E43D6; /// $43D6
__gshared ushort Unknown7E43D8; /// $43D8
__gshared ushort Unknown7E43DA; /// $43DA
__gshared LoadedAnimatedTiles[8] OverworldTilesetAnim; //$43DC
__gshared LoadedOverworldPaletteAnimation OverworldPaletteAnim; //$445C
__gshared short LoadedAnimatedTileCount; /// $4472
__gshared short Unknown7E4474; /// $4474
__gshared ushort[16][16] Unknown7E4476; /// $4476
__gshared short Unknown7E4676; /// $4676

__gshared short Unknown7E467A; /// $467A
__gshared short Unknown7E467C; /// $467C
__gshared SpriteMap[179] SpriteTable7E467E; /// $467E

__gshared ubyte[88] Unknown7E4A00; /// $4A00
__gshared short Unknown7E4A58; /// $4A58
__gshared short Unknown7E4A5A; /// $4A5A
__gshared short OverworldEnemyCount; /// $4A5C
__gshared short Unknown7E4A5E; /// $4A5E
__gshared short MagicButterfly; /// $4A60
__gshared short Unknown7E4A62; /// $4A62
__gshared short Unknown7E4A64; /// $4A64
__gshared short ShowNPCFlag; /// $4A66
__gshared short Unknown7E4A68; /// $4A68
__gshared short Unknown7E4A6A; /// $4A6A
__gshared short Unknown7E4A6C; /// $4A6C
__gshared short Unknown7E4A6E; /// $4A6E
__gshared short Unknown7E4A70; /// $4A70
__gshared short Unknown7E4A72; /// $4A72
__gshared short Unknown7E4A74; /// $4A74
__gshared int Unknown7E4A76; /// $4A76
__gshared short Unknown7E4A7A; /// $4A7A
__gshared short[4] Unknown7E4A7C; /// $4A7C
__gshared short[4] Unknown7E4A84; /// $4A84
__gshared short CurrentBattleGroup; /// $4A8C
__gshared short Unknown7E4A8E; //$4A8E
__gshared short Unknown7E4A90; //$4A90
__gshared short Unknown7E4A92; //$4A92
__gshared short Unknown7E4A94; //$4A94
__gshared VecYX[20][10] Unknown7E4A96; //$4A96

__gshared short TouchedEnemy; /// $4D86

__gshared short Unknown7E4DB8; /// $4DB8
__gshared short BattleSwirlFlag; /// $4DBA
__gshared short BattleInitiative; /// $4DBC
__gshared short Unknown7E4DBE; /// $4DBE
__gshared short Unknown7E4DC0; /// $4DC0
__gshared short BattleDebug; /// $4DC2
__gshared short Unknown7E4DC4; /// $4DC4
__gshared PartyCharacter* Unknown7E4DC6; /// $4DC6
__gshared PartyCharacter*[6] ChosenFourPtrs; /// $4DC8

__gshared short Unknown7E4DD4; /// $4DD4
__gshared MovementSpeeds[14] horizontalMovementSpeeds; /// $4DD6
__gshared MovementSpeeds[14] verticalMovementSpeeds; /// $4F96

__gshared PlayerPositionBufferEntry[256] PlayerPositionBuffer; /// $5156
//normally this occupies the same position as the player position buffer, but we're not so constrained
__gshared Unknown7E5156CreditsEntry[128] Unknown7E5156Credits; /// $5156
__gshared short MiscDebugFlags; /// $5D56
__gshared short Unknown7E5D58; /// $5D58
__gshared short Unknown7E5D5A; /// $5D5A
__gshared short Unknown7E5D5C; /// $5D5C
__gshared short Unknown7E5D5E; /// $5D5E
__gshared short BattleSwirlCountdown; /// $5D60
__gshared short CurrentTPTEntry; /// $5D62
__gshared short Unknown7E5D64; /// $5D64
__gshared short[6] Unknown7E5D66; /// $5D66
__gshared short Unknown7E5D72; /// $5D72
__gshared short Unknown7E5D74; /// $5D74
__gshared short Unknown7E5D76; /// $5D76
__gshared short Unknown7E5D78; /// $5D78
__gshared short Unknown7E5D7A; /// $5D7A
__gshared short Unknown7E5D7C; /// $5D7C
__gshared short Unknown7E5D7E; /// $5D7E

__gshared short[6] Unknown7E5D8C; /// $5D8C
__gshared short OverworldStatusSuppression; /// $5D98
__gshared short Unknown7E5D9A; /// $5D9A
__gshared ushort MushroomizationTimer; /// $5D9C - Time left until next direction swap in frames
__gshared ushort MushroomizationModifier; /// $5D9E - Which set of swapped directions to use
__gshared ushort MushroomizedWalkingFlag; /// $5DA0 - Whether or not to use mushroomized movement logic
__gshared ushort Unknown7E5DA2; /// $5DA2
__gshared ushort Unknown7E5DA4; /// $5DA4
__gshared ushort Unknown7E5DA6; /// $5DA6
__gshared ushort Unknown7E5DA8; /// $5DA8
__gshared ushort Unknown7E5DAA; /// $5DAA
__gshared ushort Unknown7E5DAC; /// $5DAC
__gshared short Unknown7E5DAE; /// $5DAE

__gshared short Unknown7E5DB4; /// $5DB4
__gshared short Unknown7E5DB6; /// $5DB6
__gshared short Unknown7E5DB8; /// $5DB8
__gshared short Unknown7E5DBA; /// $5DBA
__gshared DoorPtr Unknown7E5DBC; /// $5DBC
__gshared short Unknown7E5DBE; /// $5DBC
__gshared short CurrentQueuedInteractionType; /// $5DC0
__gshared ushort Unknown7E5DC2; /// $5DC2
__gshared short Unknown7E5DC4; /// $5DC4
__gshared short Unknown7E5DC6; /// $5DC6

__gshared short Unknown7E5DCA; /// $5DCA
__gshared short Unknown7E5DCC; /// $5DCC
__gshared short Unknown7E5DCE; /// $5DCE
__gshared short Unknown7E5DD0; /// $5DD0
__gshared short Unknown7E5DD2; /// $5DD2
__gshared short Unknown7E5DD4; /// $5DD4
__gshared short Unknown7E5DD6; /// $5DD6
__gshared short Unknown7E5DD8; /// $5DD8
__gshared short Unknown7E5DDA; /// $5DDA
__gshared short Unknown7E5DDC; /// $5DDC
__gshared const(ubyte)* Unknown7E5DDE; /// $5DDE

__gshared QueuedInteraction[4] QueuedInteractions; /// $5DEA
__gshared short CurrentQueuedInteraction; /// $5E02
__gshared short NextQueuedInteraction; /// $5E04
__gshared Unknown7E5E06Entry[24] Unknown7E5E06; /// $5E06

__gshared short Unknown7E5E36; /// $5E36
__gshared const(OverworldEventMusic)* Unknown7E5E38; /// $5E38
__gshared Unknown7E5E3CEntry[2] Unknown7E5E3C; /// $5E3C
__gshared QueuedInteractionPtr[5] Unknown7E5E58; /// $5E58
__gshared ubyte Unknown7E5E6C; /// $5E6C
__gshared ubyte Unknown7E5E6D; /// $5E6D
__gshared short Unknown7E5E6E; /// $5E6E - "word-wrap flag"?
__gshared ubyte Unknown7E5E70; /// $5E70
__gshared ubyte Unknown7E5E71; /// $5E71
__gshared ubyte Unknown7E5E72; /// $5E72
__gshared ubyte Unknown7E5E73; /// $5E73
__gshared ubyte Unknown7E5E74; /// $5E74
__gshared ubyte Unknown7E5E75; /// $5E75
__gshared ubyte Unknown7E5E76; /// $5E76
__gshared ubyte Unknown7E5E77; /// $5E77
__gshared ubyte Unknown7E5E78; /// $5E78
__gshared ubyte Unknown7E5E79; /// $5E79 - Mystery flag
__gshared short Unknown7E5E7A; /// $5E7A
__gshared short Unknown7E5E7C; /// $5E7C

__gshared ushort[0x1F8][8] Unknown7E5E7E; /// $5E7E

__gshared ushort[0x380] bg2Buffer; /// $7DFE

__gshared ushort[0x100] Unknown7E827E; /// $827E
__gshared ushort[192] Unknown7E847E; /// $847E
__gshared WinStat Unknown7E85FE; /// $85FE
__gshared WinStat[9] WindowStats; /// $8650
__gshared short window_head; /// $88E0 - Head of the window linked list
__gshared short window_tail; /// $88E2 - Tail of the window linked list
__gshared short[53] WindowTable; /// $88E4 - Index: Window ID; Value: Index to WindowStats
__gshared short[5] Unknown7E894E; /// $894E
__gshared short CurrentFocusWindow; /// $8958 - Window ID of the focused window
__gshared ubyte[12] Unknown7E895A; /// $895A

__gshared ubyte[3] HPPPWindowDigitBuffer; /// $8966
__gshared ushort[12][4] HPPPWindowBuffer; /// $8969

__gshared ubyte Unknown7E89C9; /// $89C9
__gshared short BattleMenuCurrentCharacterID; /// $89CA

__gshared short Unknown7E89CC; /// $89CC
__gshared short Unknown7E89CE; /// $89CE
__gshared short Unknown7E89D0; /// $89D0
__gshared short Unknown7E89D2; /// $89D2
__gshared MenuOpt[70] MenuOptions; /// $89D4 - Window menu options

__gshared ubyte InstantPrinting; /// $9622
__gshared ubyte Unknown7E9623; /// $9623
__gshared ubyte Unknown7E9624; /// $9624
__gshared ushort SelectedTextSpeed; /// $9625
__gshared uint Unknown7E9627; /// $9627

__gshared const(ubyte)*[4] Unknown7E9631; /// $9631
__gshared short Unknown7E9641; /// $9641
__gshared short BattleModeFlag; /// $9643
__gshared short InputLockFlag; /// $9645
__gshared short Unknown7E9647; /// $9647
__gshared short Unknown7E9649; /// $9649
__gshared short Unknown7E964B; /// $964B
__gshared ushort BlinkingTriangleFlag; /// $964D
__gshared ushort TextSoundMode; /// $964F
__gshared ubyte Unknown7E9651; /// $9651
__gshared ushort Unknown7E9652; /// $9652
__gshared ushort Unknown7E9654; /// $9654

__gshared short Unknown7E9658; /// $9658
__gshared short Unknown7E965A; /// $965A

__gshared short Unknown7E9660; /// $9660
__gshared short Unknown7E9662; /// $9662
__gshared ubyte[32] Unknown7E9664; /// $9664
__gshared short Unknown7E9684; /// $9684
__gshared short Unknown7E9686; /// $9686
__gshared short Unknown7E9688; /// $9688
__gshared short Unknown7E968A; /// $968A
__gshared short Unknown7E968C; /// $968C
__gshared ubyte[4] Unknown7E968D; /// $968D
__gshared ubyte[4] Unknown7E9691; /// $9691
__gshared ubyte Unknown7E9695; /// $9695
__gshared ubyte Unknown7E9696; /// $9696
__gshared ubyte Unknown7E9697; /// $9697
__gshared short Unknown7E9698; /// $9698
__gshared short[4] Unknown7E969A; /// $969A
__gshared short[4] Unknown7E96A2; /// $96A2
__gshared DisplayTextState[10] DisplayTextStates; /// $96AA
__gshared ushort Unknown7E97B8; /// $97B8
__gshared ubyte[10] CCArgumentStorage; /// $97BA
__gshared ushort CCArgumentGatheringLoopCounter; /// $97CA
__gshared WorkingMemory WRAMScriptWorkMemory; //$97CC
__gshared uint WRAMScriptArgMemory; //$97D0
__gshared ubyte WRAMScriptSecMemory; //$97D4
__gshared short Unknown7E97D5; //$97D5
__gshared ubyte[3] Unknown7E97D7; //$97D7

__gshared Game_State gameState; /// $97F5
__gshared PartyCharacter[TOTAL_PARTY_COUNT] PartyCharacters; /// $99CE
__gshared ubyte[EVENT_FLAG_COUNT / 8] EventFlags; /// $9C08
__gshared ushort CurrentInteractingEventFlag; /// $9C88
__gshared WindowTextAttributesCopy Unknown7E9C8A; /// $9C8A
__gshared ubyte[49] Unknown7E9C9F; /// $9C9F
__gshared ubyte Unknown7E9CD0; /// $9CD0
__gshared ubyte Unknown7E9CD1; /// $9CD1
__gshared ubyte Unknown7E9CD2; /// $9CD2
__gshared ubyte Unknown7E9CD3; /// $9CD3
__gshared short Unknown7E9CD4; /// $9CD4
__gshared ubyte Unknown7E9CD6; /// $9CD6
__gshared ubyte[30] Unknown7E9CD7; /// $9CD7
__gshared ubyte[28] Unknown7E9CF5; /// $9CF5
__gshared ubyte Unknown7E9D11; /// $9D11
__gshared uint Unknown7E9D12; /// $9D12
__gshared short Unknown7E9D16; /// $9D16
__gshared ubyte Unknown7E9D18; /// $9D18
__gshared short Unknown7E9D19; /// $9D19
__gshared void function() Unknown7E9D1B; /// $9D1B
__gshared short RespawnX; /// $9D1F
__gshared short RespawnY; /// $9D21
// is this the actual size? maybe it's 0x100?
__gshared ubyte[8][0x20] Unknown7E9D23; /// $9D23

__gshared ushort VWFX; /// $9E23
deprecated("VWFX") alias Unknown7E9E23 = VWFX;
__gshared ushort VWFTile; /// $9E25
deprecated("VWFTile") alias Unknown7E9E25 = VWFTile;
__gshared ushort Unknown7E9E27; /// $9E27
__gshared ushort Unknown7E9E29; /// $9E29

__gshared ushort DMATransferFlag; /// $9E2B
__gshared ushort EntityPreparedXCoordinate; /// $9E2D
__gshared ushort EntityPreparedYCoordinate; /// $9E2F
__gshared ushort EntityPreparedDirection; /// $9E31
__gshared ushort Unknown7E9E33; /// $9E33
__gshared short Unknown7E9E35; /// $9E35
__gshared ubyte Unknown7E9E37; /// $9E37
__gshared ubyte Unknown7E9E38; /// $9E38
__gshared ubyte Unknown7E9E39; /// $9E39
__gshared short Unknown7E9E3A; /// $9E3A
__gshared OverworldTask[4] OverworldTasks; /// $9E3C

__gshared ushort DadPhoneTimer; /// $9E54
__gshared short Unknown7E9E56; /// $9E56
__gshared Unknown7E007DEntry[40] Unknown7E9E58; /// $9E58

__gshared short Unknown7E9F18; /// $9E56
__gshared LoadedItemTransformation[4] LoadedItemTransformations; /// $9F1A

__gshared short Unknown7E9F2A; /// $9F2A
__gshared ubyte Unknown7E9F2C; /// $9F2C
__gshared short Unknown7E9F2D; /// $9F2D
__gshared short Unknown7E9F2F; /// $9F2F
__gshared short Unknown7E9F31; /// $9F31
__gshared short Unknown7E9F33; /// $9F33
__gshared short Unknown7E9F35; /// $9F35

__gshared short Unknown7E9F39; /// $9F39
__gshared short Unknown7E9F3B; /// $9F3B
__gshared short Unknown7E9F3D; /// $9F3D
__gshared short teleportDestination; /// $9F3F
__gshared TeleportStyle teleportStyle; /// $9F41
__gshared short Unknown7E9F43; /// $9F43
__gshared FixedPoint1616 Unknown7E9F45; /// $9F45
__gshared FixedPoint1616 Unknown7E9F49; /// $9F49
__gshared FixedPoint1616 Unknown7E9F4D; /// $9F4D
__gshared FixedPoint1616 Unknown7E9F51; /// $9F51
__gshared FixedPoint1616 Unknown7E9F55; /// $9F55
__gshared short Unknown7E9F59; /// $9F59
__gshared short Unknown7E9F5B; /// $9F5B
__gshared short Unknown7E9F5D; /// $9F5D
__gshared short Unknown7E9F5F; /// $9F5F
__gshared short Unknown7E9F61; /// $9F61
__gshared short Unknown7E9F63; /// $9F63
__gshared short Unknown7E9F65; /// $9F65
__gshared short Unknown7E9F67; /// $9F67
__gshared short Unknown7E9F69; /// $9F69
__gshared short Unknown7E9F6B; /// $9F6B
__gshared short Unknown7E9F6D; /// $9F6D
__gshared short Unknown7E9F6F; /// $9F6F
__gshared short PajamaFlag; /// $9F71
__gshared short Unknown7E9F73; /// $9F73
__gshared short Unknown7E9F75; /// $9F75
__gshared short Unknown7E9F77; /// $9F77
__gshared ubyte Unknown7E9F79; /// $9F79
__gshared short Unknown7E9F7A; /// $9F7A
__gshared short Unknown7E9F7C; /// $9F7C
__gshared short Unknown7E9F7E; /// $9F7E
__gshared short Unknown7E9F80; /// $9F80
__gshared short Unknown7E9F82; /// $9F82
__gshared short Unknown7E9F84; /// $9F84
__gshared short Unknown7E9F86; /// $9F86
__gshared short Unknown7E9F88; /// $9F88
__gshared short EnemiesInBattle; /// $9F8A
__gshared short[16] Unknown7E9F8C; /// $9F8C
__gshared Battler[32] BattlersTable; /// $9FAC
__gshared uint BattlerTargetFlags; /// $A96C
__gshared Battler* currentAttacker; /// $A970
__gshared Battler* currentTarget; /// $A972
__gshared uint BattleEXPScratch; /// $A974
__gshared ushort BattleMoneyScratch; /// $A978
__gshared ushort CurrentGiygasPhase; /// $A97A
__gshared ubyte Unknown7EA97C; /// $A97C
__gshared UnknownA97D Unknown7EA97D; /// $A97D
__gshared ubyte[27] AttackerNameAdjustScratch; /// $A983
__gshared ubyte[27] TargetNameAdjustScratch; /// $A99E
__gshared ubyte[27] Unknown7EA9B9; /// $A9B9
__gshared ubyte[56] Unknown7EA9D4; /// $A9D4

__gshared short Unknown7EAA0C; /// $AA0C
__gshared short Unknown7EAA0E; /// $AA0E
__gshared short ItemDropped; /// $AA10
__gshared short MirrorEnemy; /// $AA12
__gshared Battler Unknown7EAA14; /// $AA14

__gshared ushort MirrorTurnTimer; /// $AA64
__gshared ushort[5] Unknown7EAA66; /// $AA66
__gshared ushort Unknown7EAA70; /// $AA70
__gshared ushort Unknown7EAA72; /// $AA72
__gshared ushort Unknown7EAA74; /// $AA74
__gshared ushort[4] Unknown7EAA76; /// $AA76
__gshared ushort[4] Unknown7EAA7E; /// $AA7E
__gshared ushort[4] Unknown7EAA86; /// $AA86
__gshared ushort Unknown7EAA8E; /// $AA8E
__gshared ushort Unknown7EAA90; /// $AA90
__gshared ushort Unknown7EAA92; /// $AA92
__gshared ushort Unknown7EAA94; /// $AA94
__gshared ushort Unknown7EAA96; /// $AA96
__gshared ubyte[26] Unknown7EAA98; /// $AA98
__gshared ushort Unknown7EAAB2; /// $AAB2
__gshared ushort Unknown7EAAB4; /// $AAB4
__gshared ubyte[8] Unknown7EAAB6; /// $AAB6
__gshared ushort[4] Unknown7EAABE; /// $AABE
__gshared ubyte[8] Unknown7EAAC6; /// $AAC6
__gshared ubyte[8] Unknown7EAACE; /// $AACE
__gshared SpriteMap[16][4] Unknown7EAAD6; /// $AAD6
__gshared SpriteMap[16][4] Unknown7EAC16; /// $AC16
__gshared ushort Unknown7EAD56; /// $AD56
__gshared ushort Unknown7EAD58; /// $AD58
__gshared ubyte[8] Unknown7EAD5A; /// $AD5A
__gshared ubyte[8] Unknown7EAD62; /// $AD62
__gshared ubyte[8] Unknown7EAD6A; /// $AD6A
__gshared ubyte[8] Unknown7EAD72; /// $AD72
__gshared ubyte[8] Unknown7EAD7A; /// $AD7A
__gshared ubyte[8] Unknown7EAD82; /// $AD82
__gshared short Unknown7EAD8A; /// $AD8A
__gshared short VerticalShakeDuration; /// $AD8C
__gshared short VerticalShakeHoldDuration; /// $AD8E
__gshared short Unknown7EAD90; /// $AD90
__gshared short WobbleDuration; /// $AD92
__gshared short ShakeDuration; /// $AD94
__gshared short Unknown7EAD96; /// $AD96
__gshared short Unknown7EAD98; /// $AD98
__gshared short Unknown7EAD9A; /// $AD9A
__gshared short Unknown7EAD9C; /// $AD9C
__gshared short GreenFlashDuration; /// $AD9E
__gshared short RedFlashDuration; /// $ADA0
__gshared short Unknown7EADA2; /// $ADA2
__gshared short HPPPBoxBlinkDuration; /// $ADA4
__gshared short HPPPBoxBlinkTarget; /// $ADA6
__gshared short Unknown7EADA8; /// $ADA8
__gshared short Unknown7EADAA; /// $ADAA
__gshared short Unknown7EADAC; /// $ADAC
__gshared short Unknown7EADAE; /// $ADAE
__gshared short Unknown7EADB0; /// $ADB0
__gshared short Unknown7EADB2; /// $ADB2
__gshared short Unknown7EADB4; /// $ADB4
__gshared short Unknown7EADB6; /// $ADB6
__gshared HDMAWordTransfer[6] Unknown7EADB8; /// $ADB8

__gshared short Unknown7EADCC; /// $ADCC
__gshared short Unknown7EADCE; /// $ADCE
__gshared short Unknown7EADD0; /// $ADD0
__gshared short Unknown7EADD2; /// $ADD2
__gshared LoadedBackgroundData LoadedBGDataLayer1; /// $ADD4
__gshared LoadedBackgroundData LoadedBGDataLayer2; /// $AE4B
__gshared ubyte Unknown7EAEC2; /// $AEC2
__gshared ubyte Unknown7EAEC3; /// $AEC3
__gshared ubyte Unknown7EAEC4; /// $AEC4
__gshared ubyte Unknown7EAEC5; /// $AEC5
__gshared ubyte Unknown7EAEC6; /// $AEC6
__gshared ubyte Unknown7EAEC7; /// $AEC7
__gshared ubyte Unknown7EAEC8; /// $AEC8
__gshared ubyte Unknown7EAEC9; /// $AEC9
__gshared ubyte Unknown7EAECA; /// $AECA
__gshared ubyte Unknown7EAECB; /// $AECB
__gshared const(Unknown7EAECCEntry)* Unknown7EAECC; /// $AECC
__gshared short Unknown7EAED0; /// $AED0
__gshared short Unknown7EAED2; /// $AED2
__gshared short Unknown7EAED4; /// $AED4
__gshared short Unknown7EAED6; /// $AED6
__gshared short Unknown7EAED8; /// $AED8
__gshared short Unknown7EAEDA; /// $AEDA
__gshared short Unknown7EAEDC; /// $AEDC
__gshared short Unknown7EAEDE; /// $AEDE
__gshared short Unknown7EAEE0; /// $AEE0
__gshared short Unknown7EAEE2; /// $AEE2
__gshared ubyte Unknown7EAEE4; /// $AEE4
__gshared ubyte Unknown7EAEE5; /// $AEE5
__gshared ubyte Unknown7EAEE6; /// $AEE6
__gshared ushort[4] Unknown7EAEE7; /// $AEE7
__gshared ubyte Unknown7EAEEF; /// $AEEF
__gshared ushort[2] Unknown7EAEF0; /// $AEF0
__gshared ushort[4] Unknown7EAEF4; /// $AEF4
__gshared short[3 * 16 * 4] Unknown7EAEFC; /// $AEFC
__gshared short[3 * 16 * 4] Unknown7EB07C; /// $B07C
__gshared short[3 * 16 * 4] Unknown7EB1FC; /// $B1FC
__gshared short Unknown7EB37C; /// $B37C
__gshared Unknown7EB37EStruct[8] Unknown7EB37E; /// $B37E
__gshared SpriteMap Unknown7EB3EE; /// $B3EE
__gshared SpriteMap Unknown7EB3F3; /// $B3F3
__gshared short Unknown7EB3F8; /// $B3F8
__gshared short Unknown7EB3FA; /// $B3FA
__gshared ubyte* path_matrix_buffer; /// $B3FC - Matrix buffer
__gshared ushort path_matrix_rows; /// $B400 - Matrix rows
__gshared ushort path_matrix_cols; /// $B402 - Matrix columns
__gshared ushort path_matrix_border; /// $B404 - Matrix start point border size (for offscreen deliverymen)
__gshared ushort path_matrix_size; /// $B406 - Matrix size (path_matrix_rows * path_matrix_cols)
__gshared ushort* path_B408; /// $B408 - Pathfinder unknown int array start pointer
__gshared ushort* path_B40A; /// $B40A - Pathfinder unknown int array end pointer
__gshared ushort* path_B40C; /// $B40C - Pathfinder unknown int array curr pointer #1
__gshared ushort* path_B40E; /// $B40E - Pathfinder unknown int array curr pointer #2
__gshared short[4] path_cardinal_offset; /// $B410 - Pathfinder matrix offset increments for each cardinal (N/E/S/W) direction
__gshared VecYX[4] path_cardinal_index; /// $B418 - Pathfinder matrix index increments for each cardinal direction
__gshared VecYX[4] path_diagonal_index; /// $B428 - Pathfinder matrix index increments for each ordinal (NE/SE/SW/NW) direction
__gshared void* path_heap_start; /// $B438 - Pathfinder heap start pointer
__gshared void* path_heap_current; /// $B43A - Pathfinder heap current pointer
__gshared void* path_heap_end; /// $B43C - Pathfinder heap end pointer

__gshared ubyte Unknown7EB49D; /// $B49D - Addressed specifically using long addressing, why??
__gshared ubyte[3] Unknown7EB49E; /// $B49E
__gshared ubyte CurrentSaveSlot; /// $B4A1
__gshared ubyte Unknown7EB4A2; /// $B4A2

__gshared ubyte* Unknown7EB4A4; /// $B4A4
__gshared short Unknown7EB4A6; /// $B4A6
__gshared short Unknown7EB4A8; /// $B4A8
__gshared Unknown7EB4AAEntry* Unknown7EB4AA; /// $B4AA
__gshared short Unknown7EB4AE; /// $B4AE
__gshared short Unknown7EB4B0; /// $B4B0
__gshared short Unknown7EB4B2; /// $B4B2
__gshared short Unknown7EB4B4; /// $B4B4
__gshared ubyte Unknown7EB4B6; /// $B4B6
__gshared ubyte Unknown7EB4B8; /// $B4B8
__gshared ubyte Unknown7EB4BA; /// $B4BA
__gshared ubyte Unknown7EB4BC; /// $B4BC
__gshared short*[8] Unknown7EB4BE; /// $B4BE
__gshared ubyte Unknown7EB4CE; /// $B4CE
__gshared short Unknown7EB4CF; /// $B4CF
__gshared short Unknown7EB4D1; /// $B4D1
__gshared short Unknown7EB4D3; /// $B4D3

__gshared short Unknown7EB4E3; //$B4E3
__gshared short Unknown7EB4E5; //$B4E5
__gshared const(ubyte)* Unknown7EB4E7; //$B4E7
__gshared FixedPoint1616 Unknown7EB4EB; //$B4EB
__gshared short Unknown7EB4EF; //$B4EF
__gshared short CurPhotoDisplay; //$B4F1
__gshared short Unknown7EB4F3; //$B4F3
__gshared short Unknown7EB4F5; //$B4F5
__gshared short Unknown7EB4F7; //$B4F7
__gshared ubyte[44] Unknown7EB4F9; //$B4F9
__gshared ushort[11] Unknown7EB525; /// $B525

__gshared short PiracyFlag; /// $B539
__gshared ushort CurrentMusicTrack; /// $B53B
__gshared ushort CurrentPrimarySamplePack; /// $B53D
__gshared ushort CurrentSecondarySamplePack; /// $B53F
__gshared ushort CurrentSequencePack; /// $B541
__gshared short Unknown7EB543; /// $B543
__gshared short Unknown7EB545; /// $B545
__gshared short Unknown7EB547; /// $B547
__gshared ushort SectorBoundaryBehaviourFlag; /// $B549
__gshared ushort Unknown7EB54B; /// $B54B
__gshared ushort Unknown7EB54D; /// $B54D
__gshared ushort Unknown7EB54F; /// $B54F
__gshared ushort Unknown7EB551; /// $B551
__gshared ushort Unknown7EB553; /// $B553
__gshared ushort DebugMenuCursorPosition; /// $B555
__gshared ushort Unknown7EB557; /// $B557
__gshared ushort DebugModeNumber; /// $B559

__gshared short[38] Unknown7EB511; /// $B511

__gshared ushort Unknown7EB55D; /// $B55D
__gshared ushort Unknown7EB55F; /// $B55F
__gshared ushort DebugStartPositionX; /// $B561
__gshared ushort DebugStartPositionY; /// $B563
__gshared ushort DebugUnknownB565; /// $B565
__gshared ushort Unknown7EB567; /// $B567
__gshared ushort Unknown7EB569; /// $B569
__gshared ushort Unknown7EB56B; /// $B56B
__gshared ushort Unknown7EB56D; /// $B56D
__gshared ushort Unknown7EB56F; /// $B56F
__gshared ushort Unknown7EB571; /// $B571
__gshared ushort Unknown7EB573; /// $B573
__gshared ushort Unknown7EB575; /// $B575

__gshared ubyte[0x800] Unknown7EB800;
__gshared ubyte[0x2000] Unknown7EC000;

__gshared ubyte[64][64] Unknown7EE000;
__gshared Unknown7EF000Stuff Unknown7EF000;
__gshared ubyte[0x10000] Unknown7F0000;
__gshared const(ubyte[4][4])*[0x400] TileCollisionBuffer; /// $7FF800

__gshared ubyte[0x8000] IntroBG2Buffer; /// $8000 - this seems to overlap with other stuff...?


// Actionscript stuff. This was originally assembly and relied on some unusual direct page manipulation, which cannot be reproduced exactly

__gshared ubyte ActionScript00; /// $00
__gshared short ActionScript00s; /// $00
__gshared ubyte ActionScript02; /// $02
__gshared const(ubyte)* ActionScript02p; /// $02
__gshared const(OverlayScript)* ActionScript02Overlay; /// $02

__gshared ushort ActionScript04; /// $04
__gshared ushort ActionScript06; /// $06
__gshared ushort ActionScript08; /// $08

__gshared ushort ActionScript80; /// $80

__gshared ActionLoopCallState* ActionScript84; /// $84
__gshared ushort ActionScript86; /// $86
__gshared ushort ActionScript88; /// $88
__gshared ushort ActionScript8A; /// $8A
__gshared const(SpriteMap)* ActionScript8C; /// $8C
__gshared const(ubyte)* ActionScript8CScript; /// $8C
__gshared ushort* ActionScript8CMemory; /// $8C
__gshared ubyte ActionScript8E; /// $8E

__gshared short ActionScript90; /// $90

__gshared const(ubyte)* ActionScript92; /// $92

__gshared const(ubyte)* ActionScript94; /// $94

// Other hardware stuff

__gshared SRAM sram; //$306000
__gshared SaveDataReplay replaySRAM; //$316000
__gshared Unknown7E007DEntry[0] sram3; //$326000
