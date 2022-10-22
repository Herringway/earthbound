/// Every one of Earthbound's global variables
module earthbound.globals;

import earthbound.commondefs;
import earthbound.hardware;

__gshared ubyte dmaQueueIndex; /// $0000
__gshared ubyte unknown7E0001; /// $0001
__gshared ubyte unknown7E0002; /// $0002
__gshared OAMEntry* oamAddr; /// $0003
__gshared OAMEntry* oamEndAddr; /// $0005
__gshared ubyte* oamHighTableAddr; /// $0007
__gshared ubyte unknown7E0009; /// $0009
__gshared ubyte unknown7E000A; /// $000A
__gshared ushort spritemapBank; /// $000B
__gshared ubyte mirrorINIDISP; /// $000D
__gshared ubyte mirrorOBSEL; /// $000E
__gshared ubyte unknown7E000F; /// $000F
__gshared ubyte mirrorMOSAIC; /// $0010
__gshared ubyte unknown7E0011; /// $0011
__gshared ubyte unknown7E0012; /// $0012
__gshared ubyte unknown7E0013; /// $0013
__gshared ubyte unknown7E0014; /// $0014
__gshared ubyte mirrorBG12NBA; /// $0015
__gshared ubyte unknown7E0016; /// $0016
__gshared ubyte mirrorWH2; /// $0017
__gshared ushort unknown7E0018; /// $0018
__gshared ubyte mirrorTM; /// $001A
__gshared ubyte mirrorTD; /// $001B

__gshared ubyte unknown7E001D; /// $001D
__gshared ubyte unknown7E001E; /// $001E
__gshared ubyte mirrorHDMAEN; /// $001F
__gshared void function() irqCallback; /// $0020
__gshared ubyte unknown7E0022; /// $0022
__gshared ubyte unknown7E0023; /// $0023
__gshared ushort randA; /// $0024
__gshared ushort randB; /// $0026
__gshared Unknown7E0028Union unknown7E0028; /// $0028
__gshared byte unknown7E002A; /// $002A
__gshared ubyte unknown7E002B; /// $002B
//the ID of the frame being/about to be displayed, multiplied by 2
__gshared ubyte nextFrameDisplayID; /// $002C
__gshared ubyte unknown7E002D; /// $002D
//the ID of the next frame to buffer as a byte offset - 0 for buffer 0, 2 for buffer 1
__gshared ubyte nextFrameBufferID; /// $002E
__gshared ubyte unknown7E002F; /// $002F
//DMA table offset?
__gshared ubyte unknown7E0030; /// $0030
__gshared ushort bg1XPosition; /// $0031
__gshared ushort bg1YPosition; /// $0033
__gshared ushort bg2XPosition; /// $0035
__gshared ushort bg2YPosition; /// $0037
__gshared ushort bg3XPosition; /// $0039
__gshared ushort bg3YPosition; /// $003B
__gshared ushort bg4XPosition; /// $003D
__gshared ushort bg4YPosition; /// $003F
__gshared ushort[2] bg1XPositionBuffer; /// $0041
__gshared ushort[2] bg1YPositionBuffer; /// $0045
__gshared ushort[2] bg2XPositionBuffer; /// $0049
__gshared ushort[2] bg2YPositionBuffer; /// $004D
__gshared ushort[2] bg3XPositionBuffer; /// $0051
__gshared ushort[2] bg3YPositionBuffer; /// $0055
__gshared ushort[2] bg4XPositionBuffer; /// $0059
__gshared ushort[2] bg4YPositionBuffer; /// $005D
__gshared ushort unknown7E0061; /// $0061
__gshared ushort unknown7E0063; /// $0063

__gshared ushort[2] padState; /// $0065
__gshared ushort[2] padHeld; /// $0069 - Held buttons on Controllers
__gshared ushort[2] padPress; /// $006D - Pressed buttons on Controllers
__gshared ushort[2] padTimer; /// $0071 - Timer for Controller auto-repeat
__gshared ushort padTemp; /// $0075 - Temp var, used only when reading Controllers
__gshared ushort[2] padRaw; /// $0077 - Controller "raw" state (how exactly is this different from padState?)
__gshared ushort unknown7E007B; /// $007B
__gshared Unknown7E007DEntry* unknown7E007D; /// $007D
__gshared ubyte unknown7E007F; /// $007F
__gshared ubyte unknown7E0080; /// $0080
__gshared short unknown7E0081; /// $0081
__gshared short unknown7E0083; /// $0083
__gshared Unknown7E007DEntry* unknown7E0085; /// $0085
__gshared short unknown7E0087; /// $0087
__gshared short unknown7E0089; /// $0089
__gshared short unknown7E008B; /// $008B
__gshared short unknown7E008D; /// $008D
__gshared short unknown7E008F; /// $008F
__gshared ubyte dmaCopyMode; /// $0091
__gshared ushort dmaCopySize; /// $0092
__gshared const(void)* dmaCopyRAMSource; /// $0094
__gshared ushort dmaCopyVRAMDestination; /// $0097
__gshared short unknown7E0099; /// $0099
__gshared short unknown7E009B; /// $009B
__gshared short unknown7E009D; /// $009D
__gshared short unknown7E009F; /// $009F
__gshared void* currentHeapAddress; /// $00A1
__gshared void* heapBaseAddress; /// $00A3
__gshared ubyte unknown7E00A5; /// $00A5
__gshared ubyte unknown7E00A6; /// $00A6
__gshared uint timer; /// $00A7
__gshared ubyte unknown7E00AB; /// $00AB
__gshared ubyte unknown7E00AC; /// $00AC
__gshared ubyte unknown7E00AD; /// $00AD
__gshared short unknown7E00AE; /// $00AE

__gshared ubyte unknown7E00B0; /// $00B0
__gshared ubyte unknown7E00B1; /// $00B1
__gshared short unknown7E00B2; /// $00B2
__gshared ubyte tempDividend; /// $00B4
__gshared ubyte unknown7E00B5; /// $00B5
__gshared ubyte unknown7E00B6; /// $00B6
__gshared ubyte unknown7E00B7; /// $00B7
__gshared ubyte unknown7E00B8; /// $00B8
__gshared ubyte unknown7E00B9; /// $00B9
__gshared short unknown7E00BA; /// $00BA
__gshared short unknown7E00BC; /// $00BC
__gshared short unknown7E00BE; /// $00BE
__gshared short unknown7E00C0; /// $00C0

__gshared short unknown7E00C4; /// $00C4
__gshared const(ubyte)* spcDataPointer; /// $00C6
__gshared short unknown7E00C8; /// $00C8
__gshared ubyte soundEffectQueueEndIndex; /// $00CA
__gshared ubyte soundEffectQueueIndex; /// $00CB
__gshared short unknown7E00CC; /// $00CC
__gshared ubyte unknown7E00CE; /// $00CE
__gshared short unknown7E00CF; /// $00CF
__gshared ubyte unknown7E00D1; /// $00D1
__gshared ubyte unknown7E00D2; /// $00D2
__gshared short unknown7E00D3; /// $00D3

__gshared ushort[16][16] palettes; /// $0200
__gshared DMAQueueEntry[30] dmaQueue; /// $0400


//OAM data for every odd frame
__gshared FullOAMTable oam1; /// $0500
// Same as OAM1, but used for every other frame
__gshared FullOAMTable oam2; /// $0800

__gshared short unknown7E0A34; /// $0A34
__gshared short unknown7E0A36; /// $0A36
__gshared short newEntityVar0; /// $0A38
__gshared short newEntityVar1; /// $0A3A
__gshared short newEntityVar2; /// $0A3C
__gshared short newEntityVar3; /// $0A3E
__gshared short newEntityVar4; /// $0A40
__gshared short newEntityVar5; /// $0A42
__gshared short newEntityVar6; /// $0A44
__gshared short newEntityVar7; /// $0A46
__gshared short newEntityPosZ; /// $0A48
__gshared short newEntityPriority; /// $0A4A
__gshared short entityAllocationMinSlot; /// $0A4C
__gshared short entityAllocationMaxSlot; /// $0A4E
__gshared short firstEntity; /// $0A50
__gshared short unknown7E0A52; /// $0A52
__gshared short unknown7E0A54; /// $0A54
__gshared short unknown7E0A56; /// $0A56
__gshared short unknown7E0A58; /// $0A58
__gshared void function() movement42LoadedPtr; /// $0A5A
__gshared void function() unknown7E0A5E; /// $0A5E
__gshared short unknown7E0A60; /// $0A60
__gshared short[maxEntities] entityScriptTable; /// $0A62
__gshared short[maxEntities] entityNextEntityTable; /// $0A9E
__gshared short[maxEntities] entityScriptIndexTable; /// $0ADA
__gshared short[maxEntities] entityScreenXTable; /// $0B16
__gshared short[maxEntities] entityScreenYTable; /// $0B52
__gshared short[maxEntities] entityAbsXTable; /// $0B8E
__gshared short[maxEntities] entityAbsYTable; /// $0BCA
__gshared short[maxEntities] entityAbsZTable; /// $0C06
__gshared ushort[maxEntities] entityAbsXFractionTable; /// $0C42
__gshared ushort[maxEntities] entityAbsYFractionTable; /// $0C7E
__gshared ushort[maxEntities] entityAbsZFractionTable; /// $0CBA
const(FixedPoint1616) fullEntityAbsX(size_t idx) {
	return FixedPoint1616(entityAbsXFractionTable[idx], entityAbsXTable[idx]);
}
const(FixedPoint1616) fullEntityAbsY(size_t idx) {
	return FixedPoint1616(entityAbsYFractionTable[idx], entityAbsYTable[idx]);
}
const(FixedPoint1616) fullEntityAbsZ(size_t idx) {
	return FixedPoint1616(entityAbsZFractionTable[idx], entityAbsZTable[idx]);
}
__gshared short[maxEntities] entityDeltaXTable; /// $0CF6
__gshared short[maxEntities] entityDeltaYTable; /// $0D32
__gshared short[maxEntities] entityDeltaZTable; /// $0D6E
__gshared ushort[maxEntities] entityDeltaXFractionTable; /// $0DAA
__gshared ushort[maxEntities] entityDeltaYFractionTable; /// $0DE6
__gshared ushort[maxEntities] entityDeltaZFractionTable; /// $0E22
const(FixedPoint1616) fullEntityDeltaX(size_t idx) {
	return FixedPoint1616(entityDeltaXFractionTable[idx], entityDeltaXTable[idx]);
}
const(FixedPoint1616) fullEntityDeltaY(size_t idx) {
	return FixedPoint1616(entityDeltaYFractionTable[idx], entityDeltaYTable[idx]);
}
const(FixedPoint1616) fullEntityDeltaZ(size_t idx) {
	return FixedPoint1616(entityDeltaZFractionTable[idx], entityDeltaZTable[idx]);
}
__gshared short[maxEntities] entityScriptVar0Table; /// $0E5E
__gshared short[maxEntities] entityScriptVar1Table; /// $0E9A
__gshared short[maxEntities] entityScriptVar2Table; /// $0ED6
__gshared short[maxEntities] entityScriptVar3Table; /// $0F12
__gshared short[maxEntities] entityScriptVar4Table; /// $0F4E
__gshared short[maxEntities] entityScriptVar5Table; /// $0F8A
__gshared short[maxEntities] entityScriptVar6Table; /// $0FC6
__gshared short[maxEntities] entityScriptVar7Table; /// $1002
__gshared ushort[maxEntities] entityDrawPriority; /// $103E

// original code isn't very portable...
__gshared ushort[maxEntities] entityTickCallbackFlags; /// $107A and $10B6
__gshared void function()[maxEntities] entityTickCallbacks; /// $107A and $10B6

__gshared short[maxEntities] entityAnimationFrames; /// $10F2

__gshared ushort[maxEntities] entitySpriteMapFlags; /// $112E and $116A
__gshared const(SpriteMap)*[maxEntities] entitySpriteMapPointers; /// $112E and $116A
__gshared const(SpriteMap*)*[maxEntities] entitySpriteMapPointersDptr; /// $112E and $116A

__gshared void function()[maxEntities] entityScreenPositionCallbacks; /// $11A6
__gshared void function(short, short)[maxEntities] entityDrawCallbacks; /// $11E2
__gshared void function()[maxEntities] entityMoveCallbacks; /// $121E
__gshared short[maxScripts] entityScriptUnknown125A; /// $125A
__gshared short[maxScripts] entityScriptUnknown12E6; /// $12E6
__gshared short[maxScripts] entityScriptSleepFrames; /// $1372

__gshared const(ubyte)*[maxScripts] entityProgramCounters; /// $13FE and $148A

__gshared short[maxScripts] entityTempvars; /// $1516

__gshared ActionLoopCallState[5][maxScripts] unknown7E15A2; /// $15A2
__gshared short[4] unknown7E1A02; /// $1A02
__gshared short[4] unknown7E1A0A; /// $1A0A
__gshared short[4] unknown7E1A12; /// $1A12
__gshared short[4] unknown7E1A1A; /// $1A1A
__gshared short[4] unknown7E1A22; /// $1A22
__gshared short[4] unknown7E1A2A; /// $1A2A
__gshared short[4] unknown7E1A32; /// $1A32
__gshared short[4] unknown7E1A3A; /// $1A3A
__gshared short currentEntitySlot; /// $1A42
__gshared short currentEntityOffset; /// $1A44
__gshared short currentScriptSlot; /// $1A46
__gshared short currentScriptOffset; /// $1A48
__gshared short[maxEntities] entityUnknown1A4A; /// $1A4A
__gshared short[maxEntities] entityUnknown1A86; /// $1A86
__gshared ubyte[8] soundEffectQueue; /// $1AC2
__gshared ubyte unknown7E1ACA; /// $1ACA
__gshared ubyte unknown7E1ACB; /// $1ACB
__gshared short backgroundDistortionStyle; /// $1ACC
__gshared short backgroundDistortionTargetLayer; /// $1ACE

__gshared short backgroundDistortSecondLayer; /// $1AD2
__gshared short backgroundDistortionCompressionRate; /// $1AD4
__gshared short[64] unknown7E1AD6; /// $1AD6


__gshared ubyte[24] unknown7E1B56; /// $1B56
__gshared ubyte[24] unknown7E1B6E; /// $1B6E
__gshared ubyte[24] unknown7E1B86; /// $1B86
__gshared ubyte unknown7E1B9E; /// $1B9E
__gshared ubyte unknown7E1B9F; /// $1B9F
__gshared ubyte unknown7E1BA0; /// $1BA0
__gshared const(ubyte)* unknown7E1BA1; /// $1BA1
__gshared ubyte unknown7E1BA5; /// $1BA5
__gshared ubyte unknown7E1BA6; /// $1BA6
__gshared ubyte unknown7E1BA7; /// $1BA7
__gshared ubyte unknown7E1BA8; /// $1BA8
__gshared ubyte unknown7E1BA9; /// $1BA9
__gshared ushort[16] unknown7E1BAA; /// $1BAA
__gshared ushort* unknown7E1BCA; /// $1BCA
__gshared short unknown7E1BCC; /// $1BCC
__gshared short unknown7E1BCE; /// $1BCE
__gshared short unknown7E1BD0; /// $1BD0
__gshared short unknown7E1BD2; /// $1BD2
__gshared short unknown7E1BD4; /// $1BD4

__gshared ubyte[0x200][2] heap; /// $2000

__gshared ushort unknown7E2400; /// $2400
__gshared ushort unknown7E2402; /// $2402
__gshared const(SpriteMap)*[32] unknown7E2404; /// $2404
__gshared short[32] unknown7E2444; /// $2444
__gshared short[32] unknown7E2484; /// $2484
__gshared ushort[32] unknown7E24C4; /// $24C4
__gshared short unknown7E2504; /// $2504
__gshared const(SpriteMap)*[32] unknown7E2506; /// $2506
__gshared short[32] unknown7E2546; /// $2546
__gshared short[32] unknown7E2586; /// $2586
__gshared ushort[32] unknown7E25C6; /// $25C6
__gshared short unknown7E2606; /// $2606
__gshared const(SpriteMap)*[32] unknown7E2608; /// $2608
__gshared short[32] unknown7E2648; /// $2648
__gshared short[32] unknown7E2688; /// $2688
__gshared ushort[32] unknown7E26C8; /// $26C8
__gshared short unknown7E2708; /// $2708
__gshared const(SpriteMap)*[32] unknown7E270A; /// $270A
__gshared short[32] unknown7E274A; /// $274A
__gshared short[32] unknown7E278A; /// $278A
__gshared ushort[32] unknown7E27CA; /// $27CA
__gshared short unknown7E280A; /// $280A
__gshared short[maxEntities] entityDrawSorting; /// $280C
__gshared short unknown7E2848; /// $2848
__gshared short unknown7E284A; /// $284A
__gshared ushort[maxEntities] entityUnknown284C; /// $284C
__gshared short unknown7E2888; /// $2888
__gshared short unknown7E288A; /// $288A
__gshared short unknown7E288C; /// $288C
__gshared short unknown7E288E; /// $288E
__gshared short unknown7E2890; /// $2890
__gshared short unknown7E2892; /// $2892
__gshared short unknown7E2894; /// $2894
__gshared short unknown7E2896; /// $2896
__gshared short unknown7E2898; /// $2898
__gshared short footstepSoundID; /// $289A
__gshared short footstepSoundIDOverride; /// $289C
__gshared ushort[maxEntities] entityCollidedObjects; /// $289E
__gshared ushort[maxEntities] entityObstacleFlags; /// $28DA
__gshared ushort[maxEntities] entityUnknown2916; /// $2916
__gshared ushort[maxEntities] entityUnknown2952; /// $2952
__gshared ushort[maxEntities] entityVramAddresses; /// $298E
//__gshared ushort[maxEntities] EntityGraphicsPointersLow; /// $29CA
//__gshared ushort[maxEntities] EntityGraphicsPointersHigh; /// $2A06
__gshared OverworldSpriteGraphics*[maxEntities] entityGraphicsPointers; /// $29CA
//__gshared short[maxEntities] UNKNOWN_30X2_TABLE_31; /// $2A42
__gshared short[maxEntities] entityByteWidths; /// $2A7E
__gshared short[maxEntities] entityTileHeights; /// $2ABA
__gshared short[maxEntities] entityDirections; /// $2AF6
__gshared short[maxEntities] entityUnknown2B32; /// $2B32
__gshared short[maxEntities] entitySizes; /// $2B6E
__gshared ushort[maxEntities] entitySurfaceFlags; /// $2BAA
__gshared ushort[maxEntities] entityUnknown2BE6; /// $2BE6
__gshared ushort[maxEntities] entityUnknown2C22; /// $2C22
__gshared ushort[maxEntities] entityUnknown2C5E; /// $2C5E
__gshared ushort[maxEntities] entityTPTEntries; /// $2C9A
__gshared short[maxEntities] entityTPTEntrySprites; /// $2CD6
__gshared short[maxEntities] entityEnemyIDs; /// $2D12
__gshared ushort[maxEntities] entityUnknown2D4E; /// $2D4E
__gshared ushort[maxEntities] entityUnknown2D8A; /// $2D8A
__gshared ushort[maxEntities] entityUnknown2DC6; /// $2DC6
__gshared VecYX*[maxEntities] entityUnknown2E02; /// $2E02
__gshared ushort[maxEntities] entityUnknown2E3E; /// $2E3E
__gshared ushort[maxEntities] entityUnknown2E7A; /// $2E7A
__gshared const(OverlayScript)*[maxEntities] entityMushroomizedOverlayPtrs; /// $2EB6
__gshared ushort[maxEntities] entityUnknown2EF2; /// $2EF2
__gshared const(SpriteMap)*[maxEntities] entityUnknown2F2E; /// $2F2E
__gshared const(OverlayScript)*[maxEntities] entitySweatingOverlayPtrs; /// $2F6A
__gshared ushort[maxEntities] entityUnknown2FA6; /// $2FA6
__gshared const(SpriteMap)*[maxEntities] entityUnknown2FE2; /// $2FE2
__gshared const(OverlayScript)*[maxEntities] entityRippleOverlayPtrs; /// $301E
__gshared ushort[maxEntities] entityUnknown305A; /// $305A
__gshared const(SpriteMap)*[maxEntities] entityUnknown3096; /// $3096
__gshared const(OverlayScript)*[maxEntities] entityBigRippleOverlayPtrs; /// $30D2
__gshared ushort[maxEntities] entityUnknown310E; /// $310E
__gshared const(SpriteMap)*[maxEntities] entityUnknown314A; /// $314A
__gshared short[maxEntities] entityUnknown3186; /// $3186

__gshared short[maxEntities] entityUnknown332A; /// $332A
__gshared short[maxEntities] entityUnknown3366; /// $3366
__gshared short[maxEntities] entityUnknown33A2; /// $33A2
__gshared short[maxEntities] entityUnknown33DE; /// $33DE
__gshared const(OverworldSpriteGraphics)*[maxEntities] entityUnknown341A; /// $331A
__gshared short[maxEntities] entityUnknown3456; /// $3356
__gshared ubyte[32][52] vwfBuffer; /// $3492


__gshared short unknown7E3C14; /// $3C14
__gshared short unknown7E3C16; /// $3C16
__gshared short unknown7E3C18; /// $3C18
__gshared short unknown7E3C1A; /// $3C1A
__gshared short unknown7E3C1C; /// $3C1C
__gshared short unknown7E3C1E; /// $3C1E
__gshared short unknown7E3C20; /// $3C20
__gshared short unknown7E3C22; /// $3C22
__gshared short unknown7E3C24; /// $3C24
__gshared short unknown7E3C26; /// $3C26
__gshared short unknown7E3C28; /// $3C28
__gshared short unknown7E3C2A; /// $3C2A
__gshared short unknown7E3C2C; /// $3C2C
__gshared short unknown7E3C2E; /// $3C2E
__gshared short unknown7E3C30; /// $3C30
__gshared ubyte[HDMAIndirectTableEntry.sizeof * 2 + 1] unknown7E3C32; /// $3C32

__gshared ubyte[HDMAIndirectTableEntry.sizeof * 2 + 1] unknown7E3C3C; /// $3C3C

__gshared ushort[448] backgroundHDMABuffer; /// $3C46
__gshared HDMAIndirectTableEntry[3] attractModeWindowHDMATable; /// $3FC6

//based on our known RAM maps, this has 924 bytes of space allocated
//but only a maximum of 896 bytes (4 bytes * 224 lines) can be
//displayed to the screen
//however, only 448 bytes are used by the final game
__gshared ubyte[924] attractModeWindowHDMAData; /// $3FD0

__gshared short debugging; /// $436C
__gshared short unknown7E436E; /// $436E
__gshared short unknown7E4370; /// $4370
__gshared short unknown7E4372; /// $4372
__gshared short screenLeftX; /// $4374
__gshared short screenTopY; /// $4376

__gshared short unknown7E437C; /// $437C
__gshared short unknown7E437E; /// $437E

__gshared short unknown7E4380; /// $4380
__gshared short unknown7E4382; /// $4382

__gshared short unknown7E4386; /// $4386
__gshared short unknown7E4388; /// $4388

__gshared short unknown7E438A; /// $438A
__gshared short unknown7E438C; /// $438C
__gshared short currentSectorAttributes; /// $438E
__gshared byte[16] unknown7E4390; /// $4390
__gshared byte[16] unknown7E43A0; /// $43A0
__gshared byte[16] unknown7E43B0; /// $43B0
__gshared byte[16] unknown7E43C0; /// $43C0
__gshared ushort unknown7E43D0; /// $43D0
__gshared ushort unknown7E43D2; /// $43D2
__gshared ushort unknown7E43D4; /// $43D4
__gshared ushort unknown7E43D6; /// $43D6
__gshared ushort unknown7E43D8; /// $43D8
__gshared ushort unknown7E43DA; /// $43DA
__gshared LoadedAnimatedTiles[8] overworldTilesetAnim; /// $43DC
__gshared LoadedOverworldPaletteAnimation overworldPaletteAnim; /// $445C
__gshared short loadedAnimatedTileCount; /// $4472
__gshared short unknown7E4474; /// $4474
__gshared ushort[16][16] unknown7E4476; /// $4476
__gshared short unknown7E4676; /// $4676

__gshared short unknown7E467A; /// $467A
__gshared short unknown7E467C; /// $467C
__gshared SpriteMap[179] spriteTable7E467E; /// $467E

__gshared ubyte[88] unknown7E4A00; /// $4A00
__gshared short unknown7E4A58; /// $4A58
__gshared short unknown7E4A5A; /// $4A5A
__gshared short overworldEnemyCount; /// $4A5C
__gshared short unknown7E4A5E; /// $4A5E
__gshared short magicButterfly; /// $4A60
__gshared short unknown7E4A62; /// $4A62
__gshared short unknown7E4A64; /// $4A64
__gshared short showNPCFlag; /// $4A66
__gshared short unknown7E4A68; /// $4A68
__gshared short unknown7E4A6A; /// $4A6A
__gshared short unknown7E4A6C; /// $4A6C
__gshared short unknown7E4A6E; /// $4A6E
__gshared short unknown7E4A70; /// $4A70
__gshared short unknown7E4A72; /// $4A72
__gshared short unknown7E4A74; /// $4A74
__gshared const(ubyte)* unknown7E4A76; /// $4A76
__gshared short unknown7E4A7A; /// $4A7A
__gshared short[4] unknown7E4A7C; /// $4A7C
__gshared short[4] unknown7E4A84; /// $4A84
__gshared short currentBattleGroup; /// $4A8C
__gshared short unknown7E4A8E; /// $4A8E
__gshared short unknown7E4A90; /// $4A90
__gshared short unknown7E4A92; /// $4A92
__gshared short unknown7E4A94; /// $4A94
__gshared VecYX[20][10] unknown7E4A96; /// $4A96

__gshared short touchedEnemy; /// $4D86

__gshared short unknown7E4DB8; /// $4DB8
__gshared short battleSwirlFlag; /// $4DBA
__gshared short battleInitiative; /// $4DBC
__gshared short unknown7E4DBE; /// $4DBE
__gshared short unknown7E4DC0; /// $4DC0
__gshared short battleDebug; /// $4DC2
__gshared short unknown7E4DC4; /// $4DC4
__gshared PartyCharacter* unknown7E4DC6; /// $4DC6
__gshared PartyCharacter*[6] chosenFourPtrs; /// $4DC8

__gshared short unknown7E4DD4; /// $4DD4
__gshared MovementSpeeds[14] horizontalMovementSpeeds; /// $4DD6
__gshared MovementSpeeds[14] verticalMovementSpeeds; /// $4F96

__gshared PlayerPositionBufferEntry[256] playerPositionBuffer; /// $5156
//normally this occupies the same position as the player position buffer, but we're not so constrained
__gshared Unknown7E5156CreditsEntry[128] unknown7E5156Credits; /// $5156
__gshared short miscDebugFlags; /// $5D56
__gshared short unknown7E5D58; /// $5D58
__gshared short unknown7E5D5A; /// $5D5A
__gshared short unknown7E5D5C; /// $5D5C
__gshared short unknown7E5D5E; /// $5D5E
__gshared short battleSwirlCountdown; /// $5D60
__gshared short currentTPTEntry; /// $5D62
__gshared short unknown7E5D64; /// $5D64
__gshared short[6] unknown7E5D66; /// $5D66
__gshared short unknown7E5D72; /// $5D72
__gshared short inputDisableFrameCounter; /// $5D74
__gshared short unknown7E5D76; /// $5D76
__gshared short unknown7E5D78; /// $5D78
__gshared short unknown7E5D7A; /// $5D7A
__gshared short unknown7E5D7C; /// $5D7C
__gshared short unknown7E5D7E; /// $5D7E

__gshared short[6] unknown7E5D8C; /// $5D8C
__gshared short overworldStatusSuppression; /// $5D98
__gshared short unknown7E5D9A; /// $5D9A
__gshared ushort mushroomizationTimer; /// $5D9C - Time left until next direction swap in frames
__gshared ushort mushroomizationModifier; /// $5D9E - Which set of swapped directions to use
__gshared ushort mushroomizedWalkingFlag; /// $5DA0 - Whether or not to use mushroomized movement logic
__gshared ushort unknown7E5DA2; /// $5DA2
__gshared ushort unknown7E5DA4; /// $5DA4
__gshared ushort unknown7E5DA6; /// $5DA6
__gshared ushort unknown7E5DA8; /// $5DA8
__gshared ushort unknown7E5DAA; /// $5DAA
__gshared ushort unknown7E5DAC; /// $5DAC
__gshared short unknown7E5DAE; /// $5DAE

__gshared short unknown7E5DB4; /// $5DB4
__gshared short unknown7E5DB6; /// $5DB6
__gshared short unknown7E5DB8; /// $5DB8
__gshared short unknown7E5DBA; /// $5DBA
__gshared DoorPtr unknown7E5DBC; /// $5DBC
__gshared short unknown7E5DBE; /// $5DBC
__gshared short currentQueuedInteractionType; /// $5DC0
__gshared ushort unknown7E5DC2; /// $5DC2
__gshared short unknown7E5DC4; /// $5DC4
__gshared short unknown7E5DC6; /// $5DC6

__gshared short unknown7E5DCA; /// $5DCA
__gshared short unknown7E5DCC; /// $5DCC
__gshared short unknown7E5DCE; /// $5DCE
__gshared short unknown7E5DD0; /// $5DD0
__gshared short unknown7E5DD2; /// $5DD2
__gshared short currentMapMusicTrack; /// $5DD4
__gshared short nextMapMusicTrack; /// $5DD6
__gshared short unknown7E5DD8; /// $5DD8
__gshared short unknown7E5DDA; /// $5DDA
__gshared short unknown7E5DDC; /// $5DDC
__gshared string unknown7E5DDE; /// $5DDE

__gshared QueuedInteraction[4] queuedInteractions; /// $5DEA
__gshared short currentQueuedInteraction; /// $5E02
__gshared short nextQueuedInteraction; /// $5E04
__gshared Unknown7E5E06Entry[24] unknown7E5E06; /// $5E06

__gshared short unknown7E5E36; /// $5E36
__gshared const(OverworldEventMusic)* loadedMapMusicEntry; /// $5E38
__gshared ActiveHotspot[2] activeHotspots; /// $5E3C
__gshared QueuedInteractionPtr[5] unknown7E5E58; /// $5E58
__gshared ubyte unknown7E5E6C; /// $5E6C
__gshared ubyte unknown7E5E6D; /// $5E6D
__gshared short unknown7E5E6E; /// $5E6E - "word-wrap flag"?
__gshared ubyte unknown7E5E70; /// $5E70
__gshared ubyte unknown7E5E71; /// $5E71
__gshared ubyte unknown7E5E72; /// $5E72
__gshared ubyte unknown7E5E73; /// $5E73
__gshared ubyte unknown7E5E74; /// $5E74
__gshared ubyte unknown7E5E75; /// $5E75
__gshared ubyte unknown7E5E76; /// $5E76
__gshared ubyte unknown7E5E77; /// $5E77
__gshared ubyte unknown7E5E78; /// $5E78
__gshared ubyte unknown7E5E79; /// $5E79 - Mystery flag
__gshared short unknown7E5E7A; /// $5E7A
__gshared short unknown7E5E7C; /// $5E7C

__gshared ushort[0x1F8][8] unknown7E5E7E; /// $5E7E

__gshared ushort[0x400] bg2Buffer; /// $7DFE

__gshared WinStat unknown7E85FE; /// $85FE
__gshared WinStat[9] windowStats; /// $8650
__gshared short windowHead; /// $88E0 - Head of the window linked list
__gshared short windowTail; /// $88E2 - Tail of the window linked list
__gshared short[53] windowTable; /// $88E4 - Index: Window ID; Value: Index to windowStats
__gshared short[5] unknown7E894E; /// $894E
__gshared short currentFocusWindow; /// $8958 - Window ID of the focused window
__gshared ubyte[12] unknown7E895A; /// $895A

__gshared ubyte[3] hpPPWindowDigitBuffer; /// $8966
__gshared ushort[12][4] hpPPWindowBuffer; /// $8969

__gshared ubyte unknown7E89C9; /// $89C9
__gshared short battleMenuCurrentCharacterID; /// $89CA

__gshared short unknown7E89CC; /// $89CC
__gshared short unknown7E89CE; /// $89CE
__gshared short unknown7E89D0; /// $89D0
__gshared short unknown7E89D2; /// $89D2
__gshared MenuOpt[70] menuOptions; /// $89D4 - Window menu options

__gshared ubyte instantPrinting; /// $9622
__gshared ubyte unknown7E9623; /// $9623
__gshared ubyte unknown7E9624; /// $9624
__gshared ushort selectedTextSpeed; /// $9625
__gshared uint unknown7E9627; /// $9627

__gshared const(ubyte)*[4] unknown7E9631; /// $9631
__gshared short unknown7E9641; /// $9641
__gshared short battleModeFlag; /// $9643
__gshared short inputLockFlag; /// $9645
__gshared short unknown7E9647; /// $9647
__gshared short unknown7E9649; /// $9649
__gshared short unknown7E964B; /// $964B
__gshared ushort blinkingTriangleFlag; /// $964D
__gshared ushort textSoundMode; /// $964F
__gshared ubyte unknown7E9651; /// $9651
__gshared Unknown7E9652Data unknown7E9652; /// $9652
__gshared short unknown7E9658; /// $9658
__gshared short unknown7E965A; /// $965A

__gshared short unknown7E9660; /// $9660
__gshared short unknown7E9662; /// $9662
__gshared ubyte[32] unknown7E9664; /// $9664
__gshared short unknown7E9684; /// $9684
__gshared short unknown7E9686; /// $9686
__gshared short unknown7E9688; /// $9688
__gshared short unknown7E968A; /// $968A
__gshared short unknown7E968C; /// $968C
__gshared ubyte[4] unknown7E968D; /// $968D
__gshared ubyte[4] unknown7E9691; /// $9691
__gshared ubyte unknown7E9695; /// $9695
__gshared ubyte unknown7E9696; /// $9696
__gshared ubyte unknown7E9697; /// $9697
__gshared short unknown7E9698; /// $9698
__gshared short[4] unknown7E969A; /// $969A
__gshared short[4] unknown7E96A2; /// $96A2
__gshared DisplayTextState[10] displayTextStates; /// $96AA
__gshared ushort unknown7E97B8; /// $97B8
__gshared ubyte[33] ccArgumentStorage; /// $97BA
__gshared ushort ccArgumentGatheringLoopCounter; /// $97CA
__gshared WorkingMemory wramScriptWorkMemory; /// $97CC
__gshared uint wramScriptArgMemory; /// $97D0
__gshared ubyte wramScriptSecMemory; /// $97D4
__gshared short unknown7E97D5; /// $97D5
__gshared ubyte[30] unknown7E97D7; /// $97D7

__gshared GameState gameState; /// $97F5
__gshared PartyCharacter[totalPartyCount] partyCharacters; /// $99CE
__gshared ubyte[eventFlagCount / 8] eventFlags; /// $9C08
__gshared ushort currentInteractingEventFlag; /// $9C88
__gshared WindowTextAttributesCopy unknown7E9C8A; /// $9C8A
__gshared ubyte[49] unknown7E9C9F; /// $9C9F
__gshared ubyte unknown7E9CD0; /// $9CD0
__gshared ubyte unknown7E9CD1; /// $9CD1
__gshared ubyte unknown7E9CD2; /// $9CD2
__gshared ubyte unknown7E9CD3; /// $9CD3
__gshared short unknown7E9CD4; /// $9CD4
__gshared ubyte unknown7E9CD6; /// $9CD6
__gshared ubyte[30] unknown7E9CD7; /// $9CD7
__gshared ubyte[28] unknown7E9CF5; /// $9CF5
__gshared ubyte unknown7E9D11; /// $9D11
__gshared uint unknown7E9D12; /// $9D12
__gshared short unknown7E9D16; /// $9D16
__gshared ubyte unknown7E9D18; /// $9D18
__gshared short unknown7E9D19; /// $9D19
__gshared void function() unknown7E9D1B; /// $9D1B
__gshared short respawnX; /// $9D1F
__gshared short respawnY; /// $9D21
// is this the actual size? maybe it's 0x100?
__gshared ubyte[8][0x20] unknown7E9D23; /// $9D23

__gshared ushort vwfX; /// $9E23
__gshared ushort vwfTile; /// $9E25
__gshared ushort unknown7E9E27; /// $9E27
__gshared ushort unknown7E9E29; /// $9E29

__gshared ushort dmaTransferFlag; /// $9E2B
__gshared ushort entityPreparedXCoordinate; /// $9E2D
__gshared ushort entityPreparedYCoordinate; /// $9E2F
__gshared ushort entityPreparedDirection; /// $9E31
__gshared ushort unknown7E9E33; /// $9E33
__gshared short unknown7E9E35; /// $9E35
__gshared ubyte unknown7E9E37; /// $9E37
__gshared ubyte unknown7E9E38; /// $9E38
__gshared ubyte unknown7E9E39; /// $9E39
__gshared short unknown7E9E3A; /// $9E3A
__gshared OverworldTask[4] overworldTasks; /// $9E3C

__gshared ushort dadPhoneTimer; /// $9E54
__gshared short unknown7E9E56; /// $9E56
__gshared Unknown7E007DEntry[40] unknown7E9E58; /// $9E58

__gshared short unknown7E9F18; /// $9E56
__gshared LoadedItemTransformation[4] loadedItemTransformations; /// $9F1A

__gshared short unknown7E9F2A; /// $9F2A
__gshared ubyte unknown7E9F2C; /// $9F2C
__gshared short unknown7E9F2D; /// $9F2D
__gshared short unknown7E9F2F; /// $9F2F
__gshared short unknown7E9F31; /// $9F31
__gshared short unknown7E9F33; /// $9F33
__gshared short unknown7E9F35; /// $9F35

__gshared short unknown7E9F39; /// $9F39
__gshared short unknown7E9F3B; /// $9F3B
__gshared short unknown7E9F3D; /// $9F3D
__gshared short teleportDestination; /// $9F3F
__gshared TeleportStyle teleportStyle; /// $9F41
__gshared short unknown7E9F43; /// $9F43
__gshared FixedPoint1616 unknown7E9F45; /// $9F45
__gshared FixedPoint1616 unknown7E9F49; /// $9F49
__gshared FixedPoint1616 unknown7E9F4D; /// $9F4D
__gshared FixedPoint1616 unknown7E9F51; /// $9F51
__gshared FixedPoint1616 unknown7E9F55; /// $9F55
__gshared short unknown7E9F59; /// $9F59
__gshared short unknown7E9F5B; /// $9F5B
__gshared short unknown7E9F5D; /// $9F5D
__gshared short unknown7E9F5F; /// $9F5F
__gshared short unknown7E9F61; /// $9F61
__gshared short unknown7E9F63; /// $9F63
__gshared short unknown7E9F65; /// $9F65
__gshared short unknown7E9F67; /// $9F67
__gshared short unknown7E9F69; /// $9F69
__gshared short unknown7E9F6B; /// $9F6B
__gshared short unknown7E9F6D; /// $9F6D
__gshared short unknown7E9F6F; /// $9F6F
__gshared short pajamaFlag; /// $9F71
__gshared short unknown7E9F73; /// $9F73
__gshared short unknown7E9F75; /// $9F75
__gshared short unknown7E9F77; /// $9F77
__gshared ubyte unknown7E9F79; /// $9F79
__gshared short unknown7E9F7A; /// $9F7A
__gshared short unknown7E9F7C; /// $9F7C
__gshared short unknown7E9F7E; /// $9F7E
__gshared short unknown7E9F80; /// $9F80
__gshared short unknown7E9F82; /// $9F82
__gshared short unknown7E9F84; /// $9F84
__gshared ushort* unknown7E9F86; /// $9F86
__gshared short unknown7E9F88; /// $9F88
__gshared short enemiesInBattle; /// $9F8A
__gshared short[16] unknown7E9F8C; /// $9F8C
__gshared Battler[32] battlersTable; /// $9FAC
__gshared uint battlerTargetFlags; /// $A96C
__gshared Battler* currentAttacker; /// $A970
__gshared Battler* currentTarget; /// $A972
__gshared uint battleEXPScratch; /// $A974
__gshared ushort battleMoneyScratch; /// $A978
__gshared ushort currentGiygasPhase; /// $A97A
__gshared ubyte unknown7EA97C; /// $A97C
__gshared UnknownA97D unknown7EA97D; /// $A97D
__gshared ubyte[27] attackerNameAdjustScratch; /// $A983
__gshared ubyte[27] targetNameAdjustScratch; /// $A99E
__gshared ubyte[27] unknown7EA9B9; /// $A9B9
__gshared ubyte[56] unknown7EA9D4; /// $A9D4

__gshared short unknown7EAA0C; /// $AA0C
__gshared short unknown7EAA0E; /// $AA0E
__gshared short itemDropped; /// $AA10
__gshared short mirrorEnemy; /// $AA12
__gshared Battler unknown7EAA14; /// $AA14

__gshared ushort mirrorTurnTimer; /// $AA64
__gshared ushort[5] unknown7EAA66; /// $AA66
__gshared ushort unknown7EAA70; /// $AA70
__gshared ushort unknown7EAA72; /// $AA72
__gshared ushort unknown7EAA74; /// $AA74
__gshared ushort[4] unknown7EAA76; /// $AA76
__gshared ushort[4] unknown7EAA7E; /// $AA7E
__gshared ushort[4] unknown7EAA86; /// $AA86
__gshared ushort unknown7EAA8E; /// $AA8E
__gshared ushort unknown7EAA90; /// $AA90
__gshared ushort unknown7EAA92; /// $AA92
__gshared ushort unknown7EAA94; /// $AA94
__gshared ushort unknown7EAA96; /// $AA96
__gshared ubyte[26] unknown7EAA98; /// $AA98
__gshared ushort unknown7EAAB2; /// $AAB2
__gshared ushort unknown7EAAB4; /// $AAB4
__gshared ubyte[8] unknown7EAAB6; /// $AAB6
__gshared ushort[4] unknown7EAABE; /// $AABE
__gshared ubyte[8] unknown7EAAC6; /// $AAC6
__gshared ubyte[8] unknown7EAACE; /// $AACE
__gshared SpriteMap[16][4] battleSpritemaps; /// $AAD6
__gshared SpriteMap[16][4] altBattleSpritemaps; /// $AC16
__gshared ushort numBattlersInBackRow; /// $AD56
__gshared ushort numBattlersInFrontRow; /// $AD58
__gshared ubyte[8] unknown7EAD5A; /// $AD5A
__gshared ubyte[8] unknown7EAD62; /// $AD62
__gshared ubyte[8] unknown7EAD6A; /// $AD6A
__gshared ubyte[8] unknown7EAD72; /// $AD72
__gshared ubyte[8] backRowBattlers; /// $AD7A
__gshared ubyte[8] frontRowBattlers; /// $AD82
__gshared short unknown7EAD8A; /// $AD8A
__gshared short verticalShakeDuration; /// $AD8C
__gshared short verticalShakeHoldDuration; /// $AD8E
__gshared short unknown7EAD90; /// $AD90
__gshared short wobbleDuration; /// $AD92
__gshared short shakeDuration; /// $AD94
__gshared short unknown7EAD96; /// $AD96
__gshared short unknown7EAD98; /// $AD98
__gshared short unknown7EAD9A; /// $AD9A
__gshared short unknown7EAD9C; /// $AD9C
__gshared short greenFlashDuration; /// $AD9E
__gshared short redFlashDuration; /// $ADA0
__gshared short unknown7EADA2; /// $ADA2
__gshared short hpPPBoxBlinkDuration; /// $ADA4
__gshared short hpPPBoxBlinkTarget; /// $ADA6
__gshared short unknown7EADA8; /// $ADA8
__gshared short unknown7EADAA; /// $ADAA
__gshared short unknown7EADAC; /// $ADAC
__gshared short unknown7EADAE; /// $ADAE
__gshared short unknown7EADB0; /// $ADB0
__gshared short unknown7EADB2; /// $ADB2
__gshared short unknown7EADB4; /// $ADB4
__gshared short unknown7EADB6; /// $ADB6
__gshared HDMAWordTransfer[6] unknown7EADB8; /// $ADB8

__gshared short unknown7EADCC; /// $ADCC
__gshared short unknown7EADCE; /// $ADCE
__gshared short unknown7EADD0; /// $ADD0
__gshared short unknown7EADD2; /// $ADD2
__gshared LoadedBackgroundData loadedBGDataLayer1; /// $ADD4
__gshared LoadedBackgroundData loadedBGDataLayer2; /// $AE4B
__gshared ubyte unknown7EAEC2; /// $AEC2
__gshared ubyte unknown7EAEC3; /// $AEC3
__gshared ubyte unknown7EAEC4; /// $AEC4
__gshared ubyte unknown7EAEC5; /// $AEC5
__gshared ubyte unknown7EAEC6; /// $AEC6
__gshared ubyte unknown7EAEC7; /// $AEC7
__gshared ubyte unknown7EAEC8; /// $AEC8
__gshared ubyte unknown7EAEC9; /// $AEC9
__gshared ubyte unknown7EAECA; /// $AECA
__gshared ubyte unknown7EAECB; /// $AECB
__gshared const(Unknown7EAECCEntry)* unknown7EAECC; /// $AECC
__gshared short unknown7EAED0; /// $AED0
__gshared short unknown7EAED2; /// $AED2
__gshared short unknown7EAED4; /// $AED4
__gshared short unknown7EAED6; /// $AED6
__gshared short unknown7EAED8; /// $AED8
__gshared short unknown7EAEDA; /// $AEDA
__gshared short unknown7EAEDC; /// $AEDC
__gshared short unknown7EAEDE; /// $AEDE
__gshared short unknown7EAEE0; /// $AEE0
__gshared short unknown7EAEE2; /// $AEE2
__gshared ubyte unknown7EAEE4; /// $AEE4
__gshared ubyte unknown7EAEE5; /// $AEE5
__gshared ubyte unknown7EAEE6; /// $AEE6
__gshared ushort[4] unknown7EAEE7; /// $AEE7
__gshared ubyte unknown7EAEEF; /// $AEEF
__gshared ushort[2] unknown7EAEF0; /// $AEF0
__gshared ushort[4] unknown7EAEF4; /// $AEF4
__gshared short[3 * 16 * 4] unknown7EAEFC; /// $AEFC
__gshared short[3 * 16 * 4] unknown7EB07C; /// $B07C
__gshared short[3 * 16 * 4] unknown7EB1FC; /// $B1FC
__gshared short unknown7EB37C; /// $B37C
__gshared Unknown7EB37EStruct[8] unknown7EB37E; /// $B37E
__gshared SpriteMap unknown7EB3EE; /// $B3EE
__gshared SpriteMap unknown7EB3F3; /// $B3F3
__gshared short unknown7EB3F8; /// $B3F8
__gshared short unknown7EB3FA; /// $B3FA
__gshared ubyte* pathMatrixBuffer; /// $B3FC - Matrix buffer
__gshared ushort pathMatrixRows; /// $B400 - Matrix rows
__gshared ushort pathMatrixCols; /// $B402 - Matrix columns
__gshared ushort pathMatrixBorder; /// $B404 - Matrix start point border size (for offscreen deliverymen)
__gshared ushort pathMatrixSize; /// $B406 - Matrix size (path_matrix_rows * path_matrix_cols)
__gshared ushort* pathB408; /// $B408 - Pathfinder unknown int array start pointer
__gshared ushort* pathB40A; /// $B40A - Pathfinder unknown int array end pointer
__gshared ushort* pathB40C; /// $B40C - Pathfinder unknown int array curr pointer #1
__gshared ushort* pathB40E; /// $B40E - Pathfinder unknown int array curr pointer #2
__gshared short[4] pathCardinalOffset; /// $B410 - Pathfinder matrix offset increments for each cardinal (N/E/S/W) direction
__gshared VecYX[4] pathCardinalIndex; /// $B418 - Pathfinder matrix index increments for each cardinal direction
__gshared VecYX[4] pathDiagonalIndex; /// $B428 - Pathfinder matrix index increments for each ordinal (NE/SE/SW/NW) direction
__gshared void* pathHeapStart; /// $B438 - Pathfinder heap start pointer
__gshared void* pathHeapCurrent; /// $B43A - Pathfinder heap current pointer
__gshared void* pathHeapEnd; /// $B43C - Pathfinder heap end pointer

__gshared ubyte unknown7EB49D; /// $B49D - Addressed specifically using long addressing, why??
__gshared ubyte[3] unknown7EB49E; /// $B49E
__gshared ubyte currentSaveSlot; /// $B4A1
__gshared ubyte unknown7EB4A2; /// $B4A2

__gshared ubyte* unknown7EB4A4; /// $B4A4
__gshared short unknown7EB4A6; /// $B4A6
__gshared short unknown7EB4A8; /// $B4A8
__gshared Unknown7EB4AAEntry* unknown7EB4AA; /// $B4AA
__gshared short unknown7EB4AE; /// $B4AE
__gshared short unknown7EB4B0; /// $B4B0
__gshared short unknown7EB4B2; /// $B4B2
__gshared short unknown7EB4B4; /// $B4B4
__gshared ubyte unknown7EB4B6; /// $B4B6
__gshared ubyte unknown7EB4B8; /// $B4B8
__gshared ubyte totalYourSanctuaryLoadedTilesetTiles; /// $B4BA
__gshared ubyte yourSanctuaryLoadedTilesetTiles; /// $B4BC
__gshared ushort[8] loadedYourSanctuaryLocations; /// $B4BE
__gshared ubyte unknown7EB4CE; /// $B4CE
__gshared short unknown7EB4CF; /// $B4CF
__gshared short unknown7EB4D1; /// $B4D1
__gshared short unknown7EB4D3; /// $B4D3

__gshared short unknown7EB4E3; /// $B4E3
__gshared short unknown7EB4E5; /// $B4E5
__gshared const(ubyte)* unknown7EB4E7; /// $B4E7
__gshared FixedPoint1616 unknown7EB4EB; /// $B4EB
__gshared short unknown7EB4EF; /// $B4EF
__gshared short currentPhotoDisplay; /// $B4F1
__gshared short unknown7EB4F3; /// $B4F3
__gshared short unknown7EB4F5; /// $B4F5
__gshared short unknown7EB4F7; /// $B4F7
__gshared ubyte[44] unknown7EB4F9; /// $B4F9
__gshared ushort[11] unknown7EB525; /// $B525

__gshared short piracyFlag; /// $B539
__gshared ushort currentMusicTrack; /// $B53B
__gshared ushort currentPrimarySamplePack; /// $B53D
__gshared ushort currentSecondarySamplePack; /// $B53F
__gshared ushort currentSequencePack; /// $B541
__gshared short unknown7EB543; /// $B543
__gshared short unknown7EB545; /// $B545
__gshared short unknown7EB547; /// $B547
__gshared ushort sectorBoundaryBehaviourFlag; /// $B549
__gshared ushort unknown7EB54B; /// $B54B
__gshared ushort unknown7EB54D; /// $B54D
__gshared ushort unknown7EB54F; /// $B54F
__gshared ushort unknown7EB551; /// $B551
__gshared ushort unknown7EB553; /// $B553
__gshared ushort debugMenuCursorPosition; /// $B555
__gshared ushort unknown7EB557; /// $B557
__gshared ushort debugModeNumber; /// $B559

__gshared short[38] unknown7EB511; /// $B511

__gshared ushort unknown7EB55D; /// $B55D
__gshared ushort unknown7EB55F; /// $B55F
__gshared ushort debugStartPositionX; /// $B561
__gshared ushort debugStartPositionY; /// $B563
__gshared ushort debugUnknownB565; /// $B565
__gshared ushort unknown7EB567; /// $B567
__gshared ushort unknown7EB569; /// $B569
__gshared ushort unknown7EB56B; /// $B56B
__gshared ushort unknown7EB56D; /// $B56D
__gshared ushort unknown7EB56F; /// $B56F
__gshared ushort unknown7EB571; /// $B571
__gshared ushort unknown7EB573; /// $B573
__gshared ushort unknown7EB575; /// $B575

__gshared ubyte[0x800] unknown7EB800; /// $B800
__gshared ubyte[0x2000] unknown7EC000; /// $C000

__gshared ubyte[64][64] unknown7EE000; /// $E000
__gshared Unknown7EF000Stuff unknown7EF000; /// $F000
__gshared ubyte[0x10000] unknown7F0000; /// $7F0000
ref ushort[0x80] paletteAnimTargetPalette() { return (cast(ushort*)&unknown7F0000[0x7800])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimRedSlope() { return (cast(ushort*)&unknown7F0000[0x7900])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimGreenSlope() { return (cast(ushort*)&unknown7F0000[0x7A00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimBlueSlope() { return (cast(ushort*)&unknown7F0000[0x7B00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimRedAccum() { return (cast(ushort*)&unknown7F0000[0x7C00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimGreenAccum() { return (cast(ushort*)&unknown7F0000[0x7D00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimBlueAccum() { return (cast(ushort*)&unknown7F0000[0x7E00])[0 .. 0x80]; }
__gshared ushort[0x3C00] tileArrangementBuffer; /// $7F8000
__gshared const(ubyte[4][4])*[0x400] tileCollisionBuffer; /// $7FF800

__gshared ubyte[0x8000] introBG2Buffer; /// $8000 - this seems to overlap with other stuff...?


// Actionscript stuff. This was originally assembly and relied on some unusual direct page manipulation, which cannot be reproduced exactly

__gshared ubyte actionScriptVar00; /// $00
__gshared short actionScriptVar00s; /// $00
__gshared ubyte actionScriptVar02; /// $02
__gshared const(ubyte)* actionScriptVar02p; /// $02
__gshared const(OverlayScript)* actionScriptVar02Overlay; /// $02

__gshared ushort actionScriptVar04; /// $04
__gshared ushort actionScriptVar06; /// $06
__gshared ushort actionScriptVar08; /// $08

__gshared ushort actionScriptVar80; /// $80

__gshared ActionLoopCallState* actionScriptVar84; /// $84
__gshared ushort actionScriptVar86; /// $86
__gshared ushort actionScriptVar88; /// $88
__gshared ushort actionScriptVar8A; /// $8A
__gshared const(SpriteMap)* actionScriptVar8C; /// $8C
__gshared const(ubyte)* actionScriptVar8CScript; /// $8C
__gshared ushort* actionScriptVar8CMemory; /// $8C
__gshared ubyte actionScriptVar8E; /// $8E

__gshared short actionScriptVar90; /// $90

__gshared const(ubyte)* actionScriptVar92; /// $92

__gshared const(ubyte)* actionScriptVar94; /// $94

// Other hardware stuff

version(savememory) __gshared SRAM sram; /// $306000
__gshared SaveDataReplay replaySRAM; /// $316000
__gshared Unknown7E007DEntry[0] sram3; /// $326000
