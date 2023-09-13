/// Every one of Earthbound's global variables
module earthbound.globals;

import earthbound.commondefs;
import earthbound.hardware;

__gshared ubyte dmaQueueIndex; /// $(DOLLAR)0000
__gshared ubyte lastCompletedDMAIndex; /// $(DOLLAR)0001
__gshared ubyte frameCounter; /// $(DOLLAR)0002
__gshared OAMEntry* oamAddr; /// $(DOLLAR)0003
__gshared OAMEntry* oamEndAddr; /// $(DOLLAR)0005
__gshared ubyte* oamHighTableAddr; /// $(DOLLAR)0007
__gshared ubyte unknown7E0009; /// $(DOLLAR)0009 - never read, only written once
__gshared ubyte unknown7E000A; /// $(DOLLAR)000A
__gshared ushort spritemapBank; /// $(DOLLAR)000B
__gshared ubyte mirrorINIDISP; /// $(DOLLAR)000D
__gshared ubyte mirrorOBSEL; /// $(DOLLAR)000E
__gshared ubyte mirrorBGMODE; /// $(DOLLAR)000F
__gshared ubyte mirrorMOSAIC; /// $(DOLLAR)0010
__gshared ubyte mirrorBG1SC; /// $(DOLLAR)0011
__gshared ubyte mirrorBG2SC; /// $(DOLLAR)0012
__gshared ubyte mirrorBG3SC; /// $(DOLLAR)0013
__gshared ubyte mirrorBG4SC; /// $(DOLLAR)0014
__gshared ubyte mirrorBG12NBA; /// $(DOLLAR)0015
__gshared ubyte mirrorBG34NBA; /// $(DOLLAR)0016
__gshared ushort mirrorWH2; /// $(DOLLAR)0017
__gshared ubyte mirrorTM; /// $(DOLLAR)001A
__gshared ubyte mirrorTD; /// $(DOLLAR)001B

__gshared ubyte unknown7E001D; /// $(DOLLAR)001D
__gshared ubyte mirrorNMITIMEN; /// $(DOLLAR)001E
__gshared ubyte mirrorHDMAEN; /// $(DOLLAR)001F
__gshared void function() irqCallback; /// $(DOLLAR)0020
__gshared ubyte inIRQCallback; /// $(DOLLAR)0022
__gshared ubyte unknown7E0023; /// $(DOLLAR)0023
__gshared ushort randA; /// $(DOLLAR)0024
__gshared ushort randB; /// $(DOLLAR)0026
__gshared FadeParameters fadeParameters; /// $(DOLLAR)0028
__gshared byte fadeDelayFramesLeft; /// $(DOLLAR)002A
__gshared ubyte newFrameStarted; /// $(DOLLAR)002B
//the ID of the frame being/about to be displayed, multiplied by 2
__gshared ubyte nextFrameDisplayID; /// $(DOLLAR)002C
__gshared ubyte unknown7E002D; /// $(DOLLAR)002D
//the ID of the next frame to buffer as a byte offset - 0 for buffer 0, 2 for buffer 1
__gshared ubyte nextFrameBufferID; /// $(DOLLAR)002E
__gshared ubyte unknown7E002F; /// $(DOLLAR)002F
//DMA table offset?
__gshared ubyte paletteUploadMode; /// $(DOLLAR)0030
__gshared ushort bg1XPosition; /// $(DOLLAR)0031
__gshared ushort bg1YPosition; /// $(DOLLAR)0033
__gshared ushort bg2XPosition; /// $(DOLLAR)0035
__gshared ushort bg2YPosition; /// $(DOLLAR)0037
__gshared ushort bg3XPosition; /// $(DOLLAR)0039
__gshared ushort bg3YPosition; /// $(DOLLAR)003B
__gshared ushort bg4XPosition; /// $(DOLLAR)003D
__gshared ushort bg4YPosition; /// $(DOLLAR)003F
__gshared ushort[2] bg1XPositionBuffer; /// $(DOLLAR)0041
__gshared ushort[2] bg1YPositionBuffer; /// $(DOLLAR)0045
__gshared ushort[2] bg2XPositionBuffer; /// $(DOLLAR)0049
__gshared ushort[2] bg2YPositionBuffer; /// $(DOLLAR)004D
__gshared ushort[2] bg3XPositionBuffer; /// $(DOLLAR)0051
__gshared ushort[2] bg3YPositionBuffer; /// $(DOLLAR)0055
__gshared ushort[2] bg4XPositionBuffer; /// $(DOLLAR)0059
__gshared ushort[2] bg4YPositionBuffer; /// $(DOLLAR)005D
__gshared ushort unknown7E0061; /// $(DOLLAR)0061
__gshared ushort unknown7E0063; /// $(DOLLAR)0063

__gshared ushort[2] padState; /// $(DOLLAR)0065
__gshared ushort[2] padHeld; /// $(DOLLAR)0069 - Held buttons on Controllers
__gshared ushort[2] padPress; /// $(DOLLAR)006D - Pressed buttons on Controllers
__gshared ushort[2] padTimer; /// $(DOLLAR)0071 - Timer for Controller auto-repeat
__gshared ushort padTemp; /// $(DOLLAR)0075 - Temp var, used only when reading Controllers
__gshared ushort[2] padRaw; /// $(DOLLAR)0077 - Controller "raw" state (how exactly is this different from padState?)
__gshared ushort demoRecordingFlags; /// $(DOLLAR)007B
__gshared DemoEntry* demoReadSource; /// $(DOLLAR)007D
__gshared ubyte unknown7E007F; /// $(DOLLAR)007F
__gshared ubyte unknown7E0080; /// $(DOLLAR)0080
__gshared short demoFramesLeft; /// $(DOLLAR)0081
__gshared short unknown7E0083; /// $(DOLLAR)0083
__gshared DemoEntry* demoWriteDestination; /// $(DOLLAR)0085
__gshared short unknown7E0087; /// $(DOLLAR)0087
__gshared short unknown7E0089; /// $(DOLLAR)0089
__gshared short unknown7E008B; /// $(DOLLAR)008B
__gshared short unknown7E008D; /// $(DOLLAR)008D
__gshared short unknown7E008F; /// $(DOLLAR)008F
__gshared ubyte dmaCopyMode; /// $(DOLLAR)0091
__gshared ushort dmaCopySize; /// $(DOLLAR)0092
__gshared const(void)* dmaCopyRAMSource; /// $(DOLLAR)0094
__gshared ushort dmaCopyVRAMDestination; /// $(DOLLAR)0097
__gshared short unknown7E0099; /// $(DOLLAR)0099
__gshared short unknown7E009B; /// $(DOLLAR)009B
__gshared short unknown7E009D; /// $(DOLLAR)009D
__gshared short unknown7E009F; /// $(DOLLAR)009F
__gshared void* currentHeapAddress; /// $(DOLLAR)00A1
__gshared void* heapBaseAddress; /// $(DOLLAR)00A3
__gshared ubyte unknown7E00A5; /// $(DOLLAR)00A5
__gshared ubyte unknown7E00A6; /// $(DOLLAR)00A6
__gshared uint timer; /// $(DOLLAR)00A7
__gshared ubyte unknown7E00AB; /// $(DOLLAR)00AB
__gshared ubyte unknown7E00AC; /// $(DOLLAR)00AC
__gshared ubyte unknown7E00AD; /// $(DOLLAR)00AD

// compiler-generated pseudoglobals
//__gshared short unknown7E00AE; /// $(DOLLAR)00AE
//__gshared ubyte unknown7E00B0; /// $(DOLLAR)00B0
//__gshared ubyte unknown7E00B1; /// $(DOLLAR)00B1
//__gshared short unknown7E00B2; /// $(DOLLAR)00B2
//__gshared ubyte tempDividend; /// $(DOLLAR)00B4
//__gshared ubyte unknown7E00B5; /// $(DOLLAR)00B5
//__gshared ubyte unknown7E00B6; /// $(DOLLAR)00B6
//__gshared ubyte unknown7E00B7; /// $(DOLLAR)00B7
//__gshared ubyte unknown7E00B8; /// $(DOLLAR)00B8
//__gshared ubyte unknown7E00B9; /// $(DOLLAR)00B9
//__gshared short unknown7E00BA; /// $(DOLLAR)00BA
//__gshared short unknown7E00BC; /// $(DOLLAR)00BC
//__gshared short unknown7E00BE; /// $(DOLLAR)00BE
//__gshared short unknown7E00C0; /// $(DOLLAR)00C0

__gshared short unknown7E00C4; /// $(DOLLAR)00C4
__gshared short unknown7E00C8; /// $(DOLLAR)00C8
__gshared short unknown7E00CC; /// $(DOLLAR)00CC
__gshared ubyte unknown7E00CE; /// $(DOLLAR)00CE
__gshared short unknown7E00CF; /// $(DOLLAR)00CF
__gshared ubyte unknown7E00D1; /// $(DOLLAR)00D1
__gshared ubyte unknown7E00D2; /// $(DOLLAR)00D2
__gshared short unknown7E00D3; /// $(DOLLAR)00D3

__gshared ushort[16][16] palettes; /// $(DOLLAR)0200
__gshared DMAQueueEntry[30] dmaQueue; /// $(DOLLAR)0400


//OAM data for every odd frame
__gshared FullOAMTable oam1; /// $(DOLLAR)0500
// Same as OAM1, but used for every other frame
__gshared FullOAMTable oam2; /// $(DOLLAR)0800

__gshared short unknown7E0A34; /// $(DOLLAR)0A34
__gshared short unknown7E0A36; /// $(DOLLAR)0A36
__gshared short newEntityVar0; /// $(DOLLAR)0A38
__gshared short newEntityVar1; /// $(DOLLAR)0A3A
__gshared short newEntityVar2; /// $(DOLLAR)0A3C
__gshared short newEntityVar3; /// $(DOLLAR)0A3E
__gshared short newEntityVar4; /// $(DOLLAR)0A40
__gshared short newEntityVar5; /// $(DOLLAR)0A42
__gshared short newEntityVar6; /// $(DOLLAR)0A44
__gshared short newEntityVar7; /// $(DOLLAR)0A46
__gshared short newEntityPosZ; /// $(DOLLAR)0A48
__gshared short newEntityPriority; /// $(DOLLAR)0A4A
__gshared short entityAllocationMinSlot; /// $(DOLLAR)0A4C
__gshared short entityAllocationMaxSlot; /// $(DOLLAR)0A4E
__gshared short firstEntity = -1; /// $(DOLLAR)0A50
__gshared short unknown7E0A52; /// $(DOLLAR)0A52
__gshared short unknown7E0A54; /// $(DOLLAR)0A54
__gshared short unknown7E0A56; /// $(DOLLAR)0A56
__gshared short actionScriptCurrentScript; /// $(DOLLAR)0A58
__gshared void function() movement42LoadedPtr; /// $(DOLLAR)0A5A
__gshared void function() actionScriptDrawFunction; /// $(DOLLAR)0A5E
__gshared short unknown7E0A60; /// $(DOLLAR)0A60
__gshared short[maxEntities] entityScriptTable; /// $(DOLLAR)0A62
__gshared short[maxEntities] entityNextEntityTable; /// $(DOLLAR)0A9E
__gshared short[maxEntities] entityScriptIndexTable; /// $(DOLLAR)0ADA
__gshared short[maxEntities] entityScreenXTable; /// $(DOLLAR)0B16
__gshared short[maxEntities] entityScreenYTable; /// $(DOLLAR)0B52
__gshared short[maxEntities] entityAbsXTable; /// $(DOLLAR)0B8E
__gshared short[maxEntities] entityAbsYTable; /// $(DOLLAR)0BCA
__gshared short[maxEntities] entityAbsZTable; /// $(DOLLAR)0C06
__gshared ushort[maxEntities] entityAbsXFractionTable; /// $(DOLLAR)0C42
__gshared ushort[maxEntities] entityAbsYFractionTable; /// $(DOLLAR)0C7E
__gshared ushort[maxEntities] entityAbsZFractionTable; /// $(DOLLAR)0CBA
const(FixedPoint1616) fullEntityAbsX(size_t idx) {
	return FixedPoint1616(entityAbsXFractionTable[idx], entityAbsXTable[idx]);
}
const(FixedPoint1616) fullEntityAbsY(size_t idx) {
	return FixedPoint1616(entityAbsYFractionTable[idx], entityAbsYTable[idx]);
}
const(FixedPoint1616) fullEntityAbsZ(size_t idx) {
	return FixedPoint1616(entityAbsZFractionTable[idx], entityAbsZTable[idx]);
}
__gshared short[maxEntities] entityDeltaXTable; /// $(DOLLAR)0CF6
__gshared short[maxEntities] entityDeltaYTable; /// $(DOLLAR)0D32
__gshared short[maxEntities] entityDeltaZTable; /// $(DOLLAR)0D6E
__gshared ushort[maxEntities] entityDeltaXFractionTable; /// $(DOLLAR)0DAA
__gshared ushort[maxEntities] entityDeltaYFractionTable; /// $(DOLLAR)0DE6
__gshared ushort[maxEntities] entityDeltaZFractionTable; /// $(DOLLAR)0E22
const(FixedPoint1616) fullEntityDeltaX(size_t idx) {
	return FixedPoint1616(entityDeltaXFractionTable[idx], entityDeltaXTable[idx]);
}
const(FixedPoint1616) fullEntityDeltaY(size_t idx) {
	return FixedPoint1616(entityDeltaYFractionTable[idx], entityDeltaYTable[idx]);
}
const(FixedPoint1616) fullEntityDeltaZ(size_t idx) {
	return FixedPoint1616(entityDeltaZFractionTable[idx], entityDeltaZTable[idx]);
}
__gshared short[maxEntities] entityScriptVar0Table; /// $(DOLLAR)0E5E
__gshared short[maxEntities] entityScriptVar1Table; /// $(DOLLAR)0E9A
__gshared short[maxEntities] entityScriptVar2Table; /// $(DOLLAR)0ED6
__gshared short[maxEntities] entityScriptVar3Table; /// $(DOLLAR)0F12
__gshared short[maxEntities] entityScriptVar4Table; /// $(DOLLAR)0F4E
__gshared short[maxEntities] entityScriptVar5Table; /// $(DOLLAR)0F8A
__gshared short[maxEntities] entityScriptVar6Table; /// $(DOLLAR)0FC6
__gshared short[maxEntities] entityScriptVar7Table; /// $(DOLLAR)1002
__gshared ushort[maxEntities] entityDrawPriority; /// $(DOLLAR)103E

// original code isn't very portable...
__gshared ushort[maxEntities] entityTickCallbackFlags; /// $(DOLLAR)107A and $(DOLLAR)10B6
__gshared void function()[maxEntities] entityTickCallbacks; /// $(DOLLAR)107A and $(DOLLAR)10B6

__gshared short[maxEntities] entityAnimationFrames; /// $(DOLLAR)10F2

__gshared ushort[maxEntities] entitySpriteMapFlags; /// $(DOLLAR)112E and $(DOLLAR)116A
__gshared const(SpriteMap)*[maxEntities] entitySpriteMapPointers; /// $(DOLLAR)112E and $(DOLLAR)116A
__gshared const(SpriteMap*)*[maxEntities] entitySpriteMapPointersDptr; /// $(DOLLAR)112E and $(DOLLAR)116A

__gshared void function()[maxEntities] entityScreenPositionCallbacks; /// $(DOLLAR)11A6
__gshared void function(short, short)[maxEntities] entityDrawCallbacks; /// $(DOLLAR)11E2
__gshared void function()[maxEntities] entityMoveCallbacks; /// $(DOLLAR)121E
__gshared short[maxScripts] entityScriptNextScripts; /// $(DOLLAR)125A
__gshared short[maxScripts] entityScriptStackPosition; /// $(DOLLAR)12E6
__gshared short[maxScripts] entityScriptSleepFrames; /// $(DOLLAR)1372
__gshared const(ubyte)*[maxScripts] entityProgramCounters; /// $(DOLLAR)13FE and $(DOLLAR)148A
__gshared short[maxScripts] entityTempvars; /// $(DOLLAR)1516
__gshared ActionLoopCallState[5][maxScripts] unknown7E15A2; /// $(DOLLAR)15A2

// used for actionscript commands 0x31 - 0x3A, which go unused in Earthbound.
// although the commands make use of them, nothing else does. Their functions are only known because of their presence in HyperZone.
__gshared short[4] actionScriptBGHorizontalOffsetLow; /// $(DOLLAR)1A02
__gshared short[4] actionScriptBGVerticalOffsetLow; /// $(DOLLAR)1A0A
__gshared short[4] actionScriptBGHorizontalOffsetHigh; /// $(DOLLAR)1A12
__gshared short[4] actionScriptBGVerticalOffsetHigh; /// $(DOLLAR)1A1A
__gshared short[4] actionScriptBGHorizontalVelocityLow; /// $(DOLLAR)1A22
__gshared short[4] actionScriptBGVerticalVelocityLow; /// $(DOLLAR)1A2A
__gshared short[4] actionScriptBGHorizontalVelocityHigh; /// $(DOLLAR)1A32
__gshared short[4] actionScriptBGVerticalVelocityHigh; /// $(DOLLAR)1A3A

__gshared short currentEntitySlot; /// $(DOLLAR)1A42
__gshared short currentEntityOffset; /// $(DOLLAR)1A44
__gshared short currentScriptSlot; /// $(DOLLAR)1A46
__gshared short currentScriptOffset; /// $(DOLLAR)1A48
__gshared short[maxEntities] entityHitboxLeftRightHeight; /// $(DOLLAR)1A4A
__gshared short[maxEntities] entityMovingDirection; /// $(DOLLAR)1A86
__gshared short backgroundDistortionStyle; /// $(DOLLAR)1ACC
__gshared short backgroundDistortionTargetLayer; /// $(DOLLAR)1ACE

__gshared short backgroundDistortSecondLayer; /// $(DOLLAR)1AD2
__gshared short backgroundDistortionCompressionRate; /// $(DOLLAR)1AD4
__gshared short[64] unknown7E1AD6; /// $(DOLLAR)1AD6


__gshared ubyte[24] unknown7E1B56; /// $(DOLLAR)1B56
__gshared ubyte[24] unknown7E1B6E; /// $(DOLLAR)1B6E
__gshared ubyte[24] unknown7E1B86; /// $(DOLLAR)1B86
__gshared ubyte unknown7E1B9E; /// $(DOLLAR)1B9E
__gshared ubyte unknown7E1B9F; /// $(DOLLAR)1B9F
__gshared ubyte unknown7E1BA0; /// $(DOLLAR)1BA0
__gshared const(ubyte)* unknown7E1BA1; /// $(DOLLAR)1BA1
__gshared ubyte unknown7E1BA5; /// $(DOLLAR)1BA5
__gshared ubyte unknown7E1BA6; /// $(DOLLAR)1BA6
__gshared ubyte unknown7E1BA7; /// $(DOLLAR)1BA7
__gshared ubyte unknown7E1BA8; /// $(DOLLAR)1BA8
__gshared ubyte unknown7E1BA9; /// $(DOLLAR)1BA9
__gshared ushort[16] unknown7E1BAA; /// $(DOLLAR)1BAA
__gshared ushort* unknown7E1BCA; /// $(DOLLAR)1BCA
__gshared short unknown7E1BCC; /// $(DOLLAR)1BCC
__gshared short unknown7E1BCE; /// $(DOLLAR)1BCE
__gshared short unknown7E1BD0; /// $(DOLLAR)1BD0
__gshared short unknown7E1BD2; /// $(DOLLAR)1BD2
__gshared short unknown7E1BD4; /// $(DOLLAR)1BD4

__gshared ubyte[0x200][2] heap; /// $(DOLLAR)2000

__gshared ushort currentSpriteDrawingPriority; /// $(DOLLAR)2400
__gshared short unknown7E2402; /// $(DOLLAR)2402
__gshared const(SpriteMap)*[32] priority0SpriteMaps; /// $(DOLLAR)2404
__gshared short[32] priority0SpriteX; /// $(DOLLAR)2444
__gshared short[32] priority0SpriteY; /// $(DOLLAR)2484
__gshared ushort[32] priority0SpriteMapBanks; /// $(DOLLAR)24C4
__gshared short priority0SpriteOffset; /// $(DOLLAR)2504
__gshared const(SpriteMap)*[32] priority1SpriteMaps; /// $(DOLLAR)2506
__gshared short[32] priority1SpriteX; /// $(DOLLAR)2546
__gshared short[32] priority1SpriteY; /// $(DOLLAR)2586
__gshared ushort[32] priority1SpriteMapBanks; /// $(DOLLAR)25C6
__gshared short priority1SpriteOffset; /// $(DOLLAR)2606
__gshared const(SpriteMap)*[32] priority2SpriteMaps; /// $(DOLLAR)2608
__gshared short[32] priority2SpriteX; /// $(DOLLAR)2648
__gshared short[32] priority2SpriteY; /// $(DOLLAR)2688
__gshared ushort[32] priority2SpriteMapBanks; /// $(DOLLAR)26C8
__gshared short priority2SpriteOffset; /// $(DOLLAR)2708
__gshared const(SpriteMap)*[32] priority3SpriteMaps; /// $(DOLLAR)270A
__gshared short[32] priority3SpriteX; /// $(DOLLAR)274A
__gshared short[32] priority3SpriteY; /// $(DOLLAR)278A
__gshared ushort[32] priority3SpriteMapBanks; /// $(DOLLAR)27CA
__gshared short priority3SpriteOffset; /// $(DOLLAR)280A
__gshared short[maxEntities] entityDrawSorting; /// $(DOLLAR)280C
__gshared short unknown7E2848; /// $(DOLLAR)2848
__gshared short unknown7E284A; /// $(DOLLAR)284A
__gshared ushort[maxEntities] entityUnknown284C; /// $(DOLLAR)284C
__gshared short unknown7E2888; /// $(DOLLAR)2888
__gshared short unknown7E288A; /// $(DOLLAR)288A
__gshared short unknown7E288C; /// $(DOLLAR)288C
__gshared short unknown7E288E; /// $(DOLLAR)288E
__gshared short unknown7E2890; /// $(DOLLAR)2890
__gshared short useSecondSpriteFrame; /// $(DOLLAR)2892
__gshared short unknown7E2894; /// $(DOLLAR)2894
__gshared short spriteUpdateEntityOffset; /// $(DOLLAR)2896
__gshared short unknown7E2898; /// $(DOLLAR)2898
__gshared short footstepSoundID; /// $(DOLLAR)289A
__gshared short footstepSoundIDOverride; /// $(DOLLAR)289C
__gshared ushort[maxEntities] entityCollidedObjects; /// $(DOLLAR)289E
__gshared ushort[maxEntities] entityObstacleFlags; /// $(DOLLAR)28DA
__gshared ushort[maxEntities] entitySpriteMapSizes; /// $(DOLLAR)2916
__gshared ushort[maxEntities] entitySpriteMapBeginningIndices; /// $(DOLLAR)2952
__gshared ushort[maxEntities] entityVramAddresses; /// $(DOLLAR)298E
//__gshared ushort[maxEntities] EntityGraphicsPointersLow; /// $(DOLLAR)29CA
//__gshared ushort[maxEntities] EntityGraphicsPointersHigh; /// $(DOLLAR)2A06
__gshared OverworldSpriteGraphics*[maxEntities] entityGraphicsPointers; /// $(DOLLAR)29CA
//__gshared short[maxEntities] UNKNOWN_30X2_TABLE_31; /// $(DOLLAR)2A42
__gshared short[maxEntities] entityByteWidths; /// $(DOLLAR)2A7E
__gshared short[maxEntities] entityTileHeights; /// $(DOLLAR)2ABA
__gshared short[maxEntities] entityDirections; /// $(DOLLAR)2AF6
__gshared short[maxEntities] entityMovementSpeed; /// $(DOLLAR)2B32
__gshared short[maxEntities] entitySizes; /// $(DOLLAR)2B6E
__gshared ushort[maxEntities] entitySurfaceFlags; /// $(DOLLAR)2BAA
__gshared ushort[maxEntities] entityUnknown2BE6; /// $(DOLLAR)2BE6
__gshared ushort[maxEntities] entityUnknown2C22; /// $(DOLLAR)2C22
__gshared short[maxEntities] entityUnknown2C5E; /// $(DOLLAR)2C5E
__gshared ushort[maxEntities] entityTPTEntries; /// $(DOLLAR)2C9A
__gshared short[maxEntities] entityTPTEntrySprites; /// $(DOLLAR)2CD6
__gshared short[maxEntities] entityEnemyIDs; /// $(DOLLAR)2D12
__gshared ushort[maxEntities] entityEnemySpawnTiles; /// $(DOLLAR)2D4E
__gshared ushort[maxEntities] entityUnknown2D8A; /// $(DOLLAR)2D8A
__gshared ushort[maxEntities] entityUnknown2DC6; /// $(DOLLAR)2DC6
__gshared VecYX*[maxEntities] entityPathPoints; /// $(DOLLAR)2E02
__gshared ushort[maxEntities] entityPathPointsCount; /// $(DOLLAR)2E3E
__gshared ushort[maxEntities] entityOverlayFlags; /// $(DOLLAR)2E7A
__gshared const(OverlayScript)*[maxEntities] entityMushroomizedOverlayPtrs; /// $(DOLLAR)2EB6
__gshared ushort[maxEntities] entityMushroomizedNextUpdateFrames; /// $(DOLLAR)2EF2
__gshared const(SpriteMap)*[maxEntities] entityMushroomizedSpritemaps; /// $(DOLLAR)2F2E
__gshared const(OverlayScript)*[maxEntities] entitySweatingOverlayPtrs; /// $(DOLLAR)2F6A
__gshared ushort[maxEntities] entitySweatingNextUpdateFrames; /// $(DOLLAR)2FA6
__gshared const(SpriteMap)*[maxEntities] entitySweatingSpritemaps; /// $(DOLLAR)2FE2
__gshared const(OverlayScript)*[maxEntities] entityRippleOverlayPtrs; /// $(DOLLAR)301E
__gshared ushort[maxEntities] entityRippleNextUpdateFrames; /// $(DOLLAR)305A
__gshared const(SpriteMap)*[maxEntities] entityRippleSpritemaps; /// $(DOLLAR)3096
__gshared const(OverlayScript)*[maxEntities] entityBigRippleOverlayPtrs; /// $(DOLLAR)30D2
__gshared ushort[maxEntities] entityBigRippleNextUpdateFrames; /// $(DOLLAR)310E
__gshared const(SpriteMap)*[maxEntities] entityBigRippleSpritemaps; /// $(DOLLAR)314A
/++ $(DOLLAR)3186 - Random number generated to determine if enemy is 'weak'.
+ If >= 192, will be considered weak if total party level is 8x the enemy level.
+ If >= 128, will be considered weak if total party level is 6x the enemy level.
+ Otherwise, it will only be considered weak if total party level is 10x the enemy level.
+/
__gshared short[maxEntities] entityWeakEnemyValue;

__gshared short[maxEntities] entityHitboxEnabled; /// $(DOLLAR)332A - It's unclear what this one once meant. It now only disables hitboxes if zero.
__gshared short[maxEntities] entityHitboxUpDownWidth; /// $(DOLLAR)3366
__gshared short[maxEntities] entityHitboxUpDownHeight; /// $(DOLLAR)33A2
__gshared short[maxEntities] entityHitboxLeftRightWidth; /// $(DOLLAR)33DE
__gshared const(OverworldSpriteGraphics)*[maxEntities] entityUnknown341A; /// $(DOLLAR)331A
__gshared short[maxEntities] entityUnknown3456; /// $(DOLLAR)3356
__gshared ubyte[32][52] vwfBuffer; /// $(DOLLAR)3492


__gshared short unknown7E3C14; /// $(DOLLAR)3C14
__gshared short unknown7E3C16; /// $(DOLLAR)3C16
__gshared short unknown7E3C18; /// $(DOLLAR)3C18
__gshared short unknown7E3C1A; /// $(DOLLAR)3C1A
__gshared short unknown7E3C1C; /// $(DOLLAR)3C1C
__gshared short unknown7E3C1E; /// $(DOLLAR)3C1E
__gshared short unknown7E3C20; /// $(DOLLAR)3C20
__gshared short unknown7E3C22; /// $(DOLLAR)3C22
__gshared short unknown7E3C24; /// $(DOLLAR)3C24
__gshared short unknown7E3C26; /// $(DOLLAR)3C26
__gshared short unknown7E3C28; /// $(DOLLAR)3C28
__gshared short unknown7E3C2A; /// $(DOLLAR)3C2A
__gshared short unknown7E3C2C; /// $(DOLLAR)3C2C
__gshared short unknown7E3C2E; /// $(DOLLAR)3C2E
__gshared short unknown7E3C30; /// $(DOLLAR)3C30
__gshared ubyte[HDMAIndirectTableEntry.sizeof * 2 + 1] unknown7E3C32; /// $(DOLLAR)3C32

__gshared ubyte[HDMAIndirectTableEntry.sizeof * 2 + 1] unknown7E3C3C; /// $(DOLLAR)3C3C

__gshared ushort[448] backgroundHDMABuffer; /// $(DOLLAR)3C46
__gshared HDMAIndirectTableEntry[3] attractModeWindowHDMATable; /// $(DOLLAR)3FC6

//based on our known RAM maps, this has 924 bytes of space allocated
//but only a maximum of 896 bytes (4 bytes * 224 lines) can be
//displayed to the screen
//however, only 448 bytes are used by the final game
__gshared ubyte[924] attractModeWindowHDMAData; /// $(DOLLAR)3FD0

__gshared short debugging; /// $(DOLLAR)436C
__gshared short unknown7E436E; /// $(DOLLAR)436E
__gshared short unknown7E4370; /// $(DOLLAR)4370
__gshared short unknown7E4372; /// $(DOLLAR)4372
__gshared short screenLeftX; /// $(DOLLAR)4374 - The X coordinate of the top left corner of the screen
__gshared short screenTopY; /// $(DOLLAR)4376 - The Y coordinate of the top left corner of the screen

__gshared short unknown7E437C; /// $(DOLLAR)437C
__gshared short unknown7E437E; /// $(DOLLAR)437E

__gshared short unknown7E4380; /// $(DOLLAR)4380
__gshared short unknown7E4382; /// $(DOLLAR)4382

__gshared short unknown7E4386; /// $(DOLLAR)4386
__gshared short unknown7E4388; /// $(DOLLAR)4388

__gshared short unknown7E438A; /// $(DOLLAR)438A
__gshared short unknown7E438C; /// $(DOLLAR)438C
__gshared short currentSectorAttributes; /// $(DOLLAR)438E
__gshared byte[16] loadedRowsX; /// $(DOLLAR)4390 - X coordinates for rows that have been loaded? This is only written to, never read
__gshared byte[16] loadedRowsY; /// $(DOLLAR)43A0 - Y coordinates for rows that have been loaded? This is only written to, never read
__gshared byte[16] loadedColumnsX; /// $(DOLLAR)43B0 - X coordinates for columns that have been loaded? This is only written to, never read
__gshared byte[16] loadedColumnsY; /// $(DOLLAR)43C0 - Y coordinates for columns that have been loaded? This is only written to, never read
__gshared ushort colourAverageRed; /// $(DOLLAR)43D0
__gshared ushort colourAverageGreen; /// $(DOLLAR)43D2
__gshared ushort colourAverageBlue; /// $(DOLLAR)43D4
__gshared ushort savedColourAverageRed; /// $(DOLLAR)43D6
__gshared ushort savedColourAverageGreen; /// $(DOLLAR)43D8
__gshared ushort savedColourAverageBlue; /// $(DOLLAR)43DA
__gshared LoadedAnimatedTiles[8] overworldTilesetAnim; /// $(DOLLAR)43DC
__gshared LoadedOverworldPaletteAnimation overworldPaletteAnim; /// $(DOLLAR)445C
__gshared short loadedAnimatedTileCount; /// $(DOLLAR)4472
__gshared short unknown7E4474; /// $(DOLLAR)4474
__gshared ushort[16][16] unknown7E4476; /// $(DOLLAR)4476
__gshared short unknown7E4676; /// $(DOLLAR)4676

__gshared short newSpriteTileWidth; /// $(DOLLAR)467A
__gshared short newSpriteTileHeight; /// $(DOLLAR)467C
__gshared SpriteMap[179] overworldSpriteMaps; /// $(DOLLAR)467E

__gshared ubyte[88] spriteVramTable; /// $(DOLLAR)4A00
__gshared short unknown7E4A58; /// $(DOLLAR)4A58
__gshared short enemySpawnsEnabled; /// $(DOLLAR)4A5A
__gshared short overworldEnemyCount; /// $(DOLLAR)4A5C
__gshared short overworldEnemyMaximum; /// $(DOLLAR)4A5E
__gshared short magicButterfly; /// $(DOLLAR)4A60
__gshared short enemySpawnRangeWidth; /// $(DOLLAR)4A62
__gshared short enemySpawnRangeHeight; /// $(DOLLAR)4A64
__gshared short showNPCFlag; /// $(DOLLAR)4A66
__gshared short enemySpawnTooManyEnemiesFailureCount; /// $(DOLLAR)4A68
__gshared short unknown7E4A6A; /// $(DOLLAR)4A6A
__gshared short enemySpawnEncounterID; /// $(DOLLAR)4A6C
__gshared short enemySpawnRemainingEnemyCount; /// $(DOLLAR)4A6E
__gshared short enemySpawnChance; /// $(DOLLAR)4A70
__gshared short spawningEnemyGroup; /// $(DOLLAR)4A72
__gshared short spawningEnemySprite; /// $(DOLLAR)4A74
__gshared const(ubyte)* spawningEnemyName; /// $(DOLLAR)4A76
__gshared short unknown7E4A7A; /// $(DOLLAR)4A7A
__gshared short[4] unknown7E4A7C; /// $(DOLLAR)4A7C
__gshared short[4] unknown7E4A84; /// $(DOLLAR)4A84
__gshared short currentBattleGroup; /// $(DOLLAR)4A8C
__gshared short unknown7E4A8E; /// $(DOLLAR)4A8E
__gshared short unknown7E4A90; /// $(DOLLAR)4A90
__gshared short unknown7E4A92; /// $(DOLLAR)4A92
__gshared short unknown7E4A94; /// $(DOLLAR)4A94
__gshared VecYX[20][10] deliveryPaths; /// $(DOLLAR)4A96

__gshared short touchedEnemy; /// $(DOLLAR)4D86

__gshared short unknown7E4DB8; /// $(DOLLAR)4DB8
__gshared short battleSwirlFlag; /// $(DOLLAR)4DBA
__gshared short battleInitiative; /// $(DOLLAR)4DBC
__gshared short unknown7E4DBE; /// $(DOLLAR)4DBE
__gshared short unknown7E4DC0; /// $(DOLLAR)4DC0
__gshared short battleDebug; /// $(DOLLAR)4DC2
__gshared short unknown7E4DC4; /// $(DOLLAR)4DC4
__gshared PartyCharacter* currentPartyMemberTick; /// $(DOLLAR)4DC6
__gshared PartyCharacter*[6] chosenFourPtrs; /// $(DOLLAR)4DC8

__gshared short unknown7E4DD4; /// $(DOLLAR)4DD4
__gshared MovementSpeeds[14] horizontalMovementSpeeds; /// $(DOLLAR)4DD6
__gshared MovementSpeeds[14] verticalMovementSpeeds; /// $(DOLLAR)4F96

__gshared PlayerPositionBufferEntry[256] playerPositionBuffer; /// $(DOLLAR)5156
//normally this occupies the same position as the player position buffer, but we're not so constrained
__gshared CreditsDMAQueueEntry[128] creditsDMAQueue; /// $(DOLLAR)5156
__gshared short miscDebugFlags; /// $(DOLLAR)5D56
__gshared short playerIntangibilityFrames; /// $(DOLLAR)5D58
__gshared short unknown7E5D5A; /// $(DOLLAR)5D5A
__gshared short lastSectorX; /// $(DOLLAR)5D5C
__gshared short lastSectorY; /// $(DOLLAR)5D5E
__gshared short battleSwirlCountdown; /// $(DOLLAR)5D60
__gshared short currentTPTEntry; /// $(DOLLAR)5D62
__gshared short unknown7E5D64; /// $(DOLLAR)5D64
__gshared short[6] overworldDamageCountdownFrames; /// $(DOLLAR)5D66
__gshared short backgroundColourBackup; /// $(DOLLAR)5D72
__gshared short inputDisableFrameCounter; /// $(DOLLAR)5D74
__gshared short unknown7E5D76; /// $(DOLLAR)5D76
__gshared short unknown7E5D78; /// $(DOLLAR)5D78
__gshared short unknown7E5D7A; /// $(DOLLAR)5D7A
__gshared short unknown7E5D7C; /// $(DOLLAR)5D7C
__gshared short unknown7E5D7E; /// $(DOLLAR)5D7E

__gshared short[6] hpAlertShown; /// $(DOLLAR)5D8C
__gshared short overworldStatusSuppression; /// $(DOLLAR)5D98
__gshared short pendingInteractions; /// $(DOLLAR)5D9A
__gshared ushort mushroomizationTimer; /// $(DOLLAR)5D9C - Time left until next direction swap in frames
__gshared ushort mushroomizationModifier; /// $(DOLLAR)5D9E - Which set of swapped directions to use
__gshared ushort mushroomizedWalkingFlag; /// $(DOLLAR)5DA0 - Whether or not to use mushroomized movement logic
__gshared ushort unknown7E5DA2; /// $(DOLLAR)5DA2
__gshared ushort tempEntitySurfaceFlags; /// $(DOLLAR)5DA4
__gshared ushort unknown7E5DA6; /// $(DOLLAR)5DA6
__gshared ushort ladderStairsTileX; /// $(DOLLAR)5DA8
__gshared ushort ladderStairsTileY; /// $(DOLLAR)5DAA
__gshared ushort checkedCollisionLeftX; /// $(DOLLAR)5DAC
__gshared short checkedCollisionTopY; /// $(DOLLAR)5DAE

__gshared short unknown7E5DB4; /// $(DOLLAR)5DB4
__gshared short unknown7E5DB6; /// $(DOLLAR)5DB6
__gshared short unknown7E5DB8; /// $(DOLLAR)5DB8
__gshared short unknown7E5DBA; /// $(DOLLAR)5DBA
__gshared DoorPtr unknown7E5DBC; /// $(DOLLAR)5DBC
__gshared short unknown7E5DBE; /// $(DOLLAR)5DBC
__gshared short currentQueuedInteractionType; /// $(DOLLAR)5DC0
__gshared ushort unknown7E5DC2; /// $(DOLLAR)5DC2
__gshared short unknown7E5DC4; /// $(DOLLAR)5DC4
__gshared short escalatorEntranceDirection; /// $(DOLLAR)5DC6

__gshared short unknown7E5DCA; /// $(DOLLAR)5DCA
__gshared short stairsNewX; /// $(DOLLAR)5DCC
__gshared short stairsNewY; /// $(DOLLAR)5DCE
__gshared short escalatorNewX; /// $(DOLLAR)5DD0
__gshared short escalatorNewY; /// $(DOLLAR)5DD2
__gshared short currentMapMusicTrack; /// $(DOLLAR)5DD4
__gshared short nextMapMusicTrack; /// $(DOLLAR)5DD6
__gshared short disableMusicChanges; /// $(DOLLAR)5DD8
__gshared short doMapMusicFade; /// $(DOLLAR)5DDA
__gshared short unknown7E5DDC; /// $(DOLLAR)5DDC
__gshared string unknown7E5DDE; /// $(DOLLAR)5DDE

__gshared QueuedInteraction[4] queuedInteractions; /// $(DOLLAR)5DEA
__gshared short currentQueuedInteraction; /// $(DOLLAR)5E02
__gshared short nextQueuedInteraction; /// $(DOLLAR)5E04
__gshared Unknown7E5E06Entry[24] unknown7E5E06; /// $(DOLLAR)5E06

__gshared short unknown7E5E36; /// $(DOLLAR)5E36
__gshared const(OverworldEventMusic)* loadedMapMusicEntry; /// $(DOLLAR)5E38
__gshared ActiveHotspot[2] activeHotspots; /// $(DOLLAR)5E3C
__gshared QueuedInteractionPtr[5] unknown7E5E58; /// $(DOLLAR)5E58
__gshared ubyte unknown7E5E6C; /// $(DOLLAR)5E6C
__gshared ubyte characterPadding; /// $(DOLLAR)5E6D
__gshared short unknown7E5E6E; /// $(DOLLAR)5E6E - "word-wrap flag"?
__gshared ubyte unknown7E5E70; /// $(DOLLAR)5E70
__gshared ubyte unknown7E5E71; /// $(DOLLAR)5E71
__gshared ubyte unknown7E5E72; /// $(DOLLAR)5E72
__gshared ubyte unknown7E5E73; /// $(DOLLAR)5E73
__gshared ubyte unknown7E5E74; /// $(DOLLAR)5E74
__gshared ubyte unknown7E5E75; /// $(DOLLAR)5E75
__gshared ubyte lastPrintedCharacter; /// $(DOLLAR)5E76
__gshared ubyte printAttackerArticle; /// $(DOLLAR)5E77
__gshared ubyte printTargetArticle; /// $(DOLLAR)5E78
__gshared ubyte unknown7E5E79; /// $(DOLLAR)5E79 - Mystery flag
__gshared short unknown7E5E7A; /// $(DOLLAR)5E7A
__gshared short unknown7E5E7C; /// $(DOLLAR)5E7C

__gshared ushort[0x1F8][8] unknown7E5E7E; /// $(DOLLAR)5E7E

__gshared ushort[0x400] bg2Buffer; /// $(DOLLAR)7DFE

__gshared WinStat unknown7E85FE; /// $(DOLLAR)85FE
__gshared WinStat[9] windowStats; /// $(DOLLAR)8650
__gshared short windowHead; /// $(DOLLAR)88E0 - Head of the window linked list
__gshared short windowTail; /// $(DOLLAR)88E2 - Tail of the window linked list
__gshared short[53] windowTable; /// $(DOLLAR)88E4 - Index: Window ID; Value: Index to windowStats
__gshared short[5] unknown7E894E; /// $(DOLLAR)894E
__gshared short currentFocusWindow; /// $(DOLLAR)8958 - Window ID of the focused window
__gshared ubyte[12] unknown7E895A; /// $(DOLLAR)895A

__gshared ubyte[3] hpPPWindowDigitBuffer; /// $(DOLLAR)8966
__gshared ushort[12][4] hpPPWindowBuffer; /// $(DOLLAR)8969

__gshared ubyte unknown7E89C9; /// $(DOLLAR)89C9
__gshared short battleMenuCurrentCharacterID; /// $(DOLLAR)89CA

__gshared short unknown7E89CC; /// $(DOLLAR)89CC
__gshared short unknown7E89CE; /// $(DOLLAR)89CE
__gshared short unknown7E89D0; /// $(DOLLAR)89D0
__gshared short unknown7E89D2; /// $(DOLLAR)89D2
__gshared MenuOpt[70] menuOptions; /// $(DOLLAR)89D4 - Window menu options

__gshared ubyte instantPrinting; /// $(DOLLAR)9622
__gshared ubyte redrawAllWindows; /// $(DOLLAR)9623
__gshared ubyte unknown7E9624; /// $(DOLLAR)9624
__gshared ushort selectedTextSpeed; /// $(DOLLAR)9625
__gshared uint unknown7E9627; /// $(DOLLAR)9627

__gshared string[4] unknown7E9631; /// $(DOLLAR)9631
__gshared short unknown7E9641; /// $(DOLLAR)9641
__gshared short battleModeFlag; /// $(DOLLAR)9643
__gshared short inputLockFlag; /// $(DOLLAR)9645
__gshared short unknown7E9647; /// $(DOLLAR)9647
__gshared short unknown7E9649; /// $(DOLLAR)9649
__gshared short unknown7E964B; /// $(DOLLAR)964B
__gshared ushort blinkingTriangleFlag; /// $(DOLLAR)964D
__gshared ushort textSoundMode; /// $(DOLLAR)964F
__gshared ubyte unknown7E9651; /// $(DOLLAR)9651
__gshared TextRenderState textRenderState; /// $(DOLLAR)9652
__gshared short attackerEnemyID; /// $(DOLLAR)9658
__gshared short targetEnemyID; /// $(DOLLAR)965A

__gshared short unknown7E9660; /// $(DOLLAR)9660
__gshared short unknown7E9662; /// $(DOLLAR)9662
__gshared ubyte[32] unknown7E9664; /// $(DOLLAR)9664
__gshared short unknown7E9684; /// $(DOLLAR)9684
__gshared short unknown7E9686; /// $(DOLLAR)9686
__gshared short unknown7E9688; /// $(DOLLAR)9688
__gshared short unknown7E968A; /// $(DOLLAR)968A
__gshared short unknown7E968C; /// $(DOLLAR)968C
__gshared ubyte[4] unknown7E968D; /// $(DOLLAR)968D
__gshared ubyte[4] unknown7E9691; /// $(DOLLAR)9691
__gshared ubyte unknown7E9695; /// $(DOLLAR)9695
__gshared ubyte unknown7E9696; /// $(DOLLAR)9696
__gshared ubyte unknown7E9697; /// $(DOLLAR)9697
__gshared short unknown7E9698; /// $(DOLLAR)9698
__gshared short[4] unknown7E969A; /// $(DOLLAR)969A
__gshared short[4] unknown7E96A2; /// $(DOLLAR)96A2
__gshared DisplayTextState[10] displayTextStates; /// $(DOLLAR)96AA
__gshared ushort unknown7E97B8; /// $(DOLLAR)97B8
__gshared ubyte[65] ccArgumentStorage; /// $(DOLLAR)97BA
__gshared ushort ccArgumentGatheringLoopCounter; /// $(DOLLAR)97CA
__gshared WorkingMemory wramScriptWorkMemory; /// $(DOLLAR)97CC
__gshared uint wramScriptArgMemory; /// $(DOLLAR)97D0
__gshared ubyte wramScriptSecMemory; /// $(DOLLAR)97D4
__gshared short unknown7E97D5; /// $(DOLLAR)97D5
__gshared ubyte[30] unknown7E97D7; /// $(DOLLAR)97D7

__gshared GameState gameState; /// $(DOLLAR)97F5
__gshared PartyCharacter[totalPartyCount] partyCharacters; /// $(DOLLAR)99CE
__gshared ubyte[eventFlagCount / 8] eventFlags; /// $(DOLLAR)9C08
__gshared ushort currentInteractingEventFlag; /// $(DOLLAR)9C88
__gshared WindowTextAttributesCopy windowTextAttributesBackup; /// $(DOLLAR)9C8A
__gshared ubyte[49] unknown7E9C9F; /// $(DOLLAR)9C9F
__gshared ubyte unknown7E9CD0; /// $(DOLLAR)9CD0
__gshared ubyte unknown7E9CD1; /// $(DOLLAR)9CD1
__gshared ubyte unknown7E9CD2; /// $(DOLLAR)9CD2
__gshared ubyte unknown7E9CD3; /// $(DOLLAR)9CD3
__gshared short unknown7E9CD4; /// $(DOLLAR)9CD4
__gshared ubyte unknown7E9CD6; /// $(DOLLAR)9CD6
__gshared ubyte[30] battleAttackerName; /// $(DOLLAR)9CD7
__gshared ubyte[28] battleTargetName; /// $(DOLLAR)9CF5
__gshared ubyte cItem; /// $(DOLLAR)9D11
__gshared uint cNum; /// $(DOLLAR)9D12
__gshared short unknown7E9D16; /// $(DOLLAR)9D16
__gshared ubyte unknown7E9D18; /// $(DOLLAR)9D18
__gshared short unknown7E9D19; /// $(DOLLAR)9D19
__gshared void function() unknown7E9D1B; /// $(DOLLAR)9D1B
__gshared short respawnX; /// $(DOLLAR)9D1F
__gshared short respawnY; /// $(DOLLAR)9D21
// is this the actual size? maybe it's 0x100?
__gshared ubyte[8][0x20] unknown7E9D23; /// $(DOLLAR)9D23

__gshared ushort vwfX; /// $(DOLLAR)9E23
__gshared ushort vwfTile; /// $(DOLLAR)9E25
__gshared ushort unknown7E9E27; /// $(DOLLAR)9E27
__gshared ushort unknown7E9E29; /// $(DOLLAR)9E29

__gshared ushort dmaTransferFlag; /// $(DOLLAR)9E2B
__gshared ushort entityPreparedXCoordinate; /// $(DOLLAR)9E2D
__gshared ushort entityPreparedYCoordinate; /// $(DOLLAR)9E2F
__gshared ushort entityPreparedDirection; /// $(DOLLAR)9E31
__gshared ushort cameraFocusEntity; /// $(DOLLAR)9E33
__gshared short unknown7E9E35; /// $(DOLLAR)9E35
__gshared ubyte unknown7E9E37; /// $(DOLLAR)9E37
__gshared ubyte unknown7E9E38; /// $(DOLLAR)9E38
__gshared ubyte unknown7E9E39; /// $(DOLLAR)9E39
__gshared short rectangleWindowBufferIndex; /// $(DOLLAR)9E3A
__gshared OverworldTask[4] overworldTasks; /// $(DOLLAR)9E3C

__gshared ushort dadPhoneTimer; /// $(DOLLAR)9E54
__gshared short unknown7E9E56; /// $(DOLLAR)9E56
__gshared DemoEntry[64] autoMovementDemoBuffer; /// $(DOLLAR)9E58

__gshared short autoMovementDemoPosition; /// $(DOLLAR)9E56
__gshared LoadedItemTransformation[4] loadedItemTransformations; /// $(DOLLAR)9F1A

__gshared short unknown7E9F2A; /// $(DOLLAR)9F2A
__gshared ubyte unknown7E9F2C; /// $(DOLLAR)9F2C
__gshared short unknown7E9F2D; /// $(DOLLAR)9F2D
__gshared short unknown7E9F2F; /// $(DOLLAR)9F2F
__gshared short unknown7E9F31; /// $(DOLLAR)9F31
__gshared short unknown7E9F33; /// $(DOLLAR)9F33
__gshared short unknown7E9F35; /// $(DOLLAR)9F35

__gshared short unknown7E9F39; /// $(DOLLAR)9F39
__gshared short unknown7E9F3B; /// $(DOLLAR)9F3B
__gshared short unknown7E9F3D; /// $(DOLLAR)9F3D
__gshared short teleportDestination; /// $(DOLLAR)9F3F
__gshared TeleportStyle teleportStyle; /// $(DOLLAR)9F41
__gshared short teleportState; /// $(DOLLAR)9F43
__gshared FixedPoint1616 unknown7E9F45; /// $(DOLLAR)9F45
__gshared FixedPoint1616 unknown7E9F49; /// $(DOLLAR)9F49
__gshared FixedPoint1616 unknown7E9F4D; /// $(DOLLAR)9F4D
__gshared FixedPoint1616 unknown7E9F51; /// $(DOLLAR)9F51
__gshared FixedPoint1616 unknown7E9F55; /// $(DOLLAR)9F55
__gshared short unknown7E9F59; /// $(DOLLAR)9F59
__gshared short unknown7E9F5B; /// $(DOLLAR)9F5B
__gshared short unknown7E9F5D; /// $(DOLLAR)9F5D
__gshared short unknown7E9F5F; /// $(DOLLAR)9F5F
__gshared short unknown7E9F61; /// $(DOLLAR)9F61
__gshared short unknown7E9F63; /// $(DOLLAR)9F63
__gshared short unknown7E9F65; /// $(DOLLAR)9F65
__gshared short unknown7E9F67; /// $(DOLLAR)9F67
__gshared short unknown7E9F69; /// $(DOLLAR)9F69
__gshared short unknown7E9F6B; /// $(DOLLAR)9F6B
__gshared short unknown7E9F6D; /// $(DOLLAR)9F6D
__gshared short unknown7E9F6F; /// $(DOLLAR)9F6F
__gshared short pajamaFlag; /// $(DOLLAR)9F71
__gshared short unknown7E9F73; /// $(DOLLAR)9F73
__gshared short unknown7E9F75; /// $(DOLLAR)9F75
__gshared short unknown7E9F77; /// $(DOLLAR)9F77
__gshared ubyte unknown7E9F79; /// $(DOLLAR)9F79
__gshared short unknown7E9F7A; /// $(DOLLAR)9F7A
__gshared short unknown7E9F7C; /// $(DOLLAR)9F7C
__gshared short unknown7E9F7E; /// $(DOLLAR)9F7E
__gshared short unknown7E9F80; /// $(DOLLAR)9F80
__gshared short unknown7E9F82; /// $(DOLLAR)9F82
__gshared short unknown7E9F84; /// $(DOLLAR)9F84
__gshared ushort* unknown7E9F86; /// $(DOLLAR)9F86
__gshared short unknown7E9F88; /// $(DOLLAR)9F88
__gshared short enemiesInBattle; /// $(DOLLAR)9F8A
__gshared short[16] enemiesInBattleIDs; /// $(DOLLAR)9F8C
__gshared Battler[32] battlersTable; /// $(DOLLAR)9FAC
__gshared uint battlerTargetFlags; /// $(DOLLAR)A96C
__gshared Battler* currentAttacker; /// $(DOLLAR)A970
__gshared Battler* currentTarget; /// $(DOLLAR)A972
__gshared uint battleEXPScratch; /// $(DOLLAR)A974
__gshared ushort battleMoneyScratch; /// $(DOLLAR)A978
__gshared ushort currentGiygasPhase; /// $(DOLLAR)A97A
__gshared ubyte unknown7EA97C; /// $(DOLLAR)A97C
__gshared BattleMenuSelection battleMenuSelection; /// $(DOLLAR)A97D
__gshared ubyte[27] attackerNameAdjustScratch; /// $(DOLLAR)A983
__gshared ubyte[27] targetNameAdjustScratch; /// $(DOLLAR)A99E
__gshared ubyte[27] unknown7EA9B9; /// $(DOLLAR)A9B9
__gshared ubyte[4*14] stealableItemCandidates; /// $(DOLLAR)A9D4

__gshared short unknown7EAA0C; /// $(DOLLAR)AA0C
__gshared short specialDefeat; /// $(DOLLAR)AA0E
__gshared short itemDropped; /// $(DOLLAR)AA10
__gshared short mirrorEnemy; /// $(DOLLAR)AA12
__gshared Battler unknown7EAA14; /// $(DOLLAR)AA14

__gshared ushort mirrorTurnTimer; /// $(DOLLAR)AA64
__gshared ushort[5] unknown7EAA66; /// $(DOLLAR)AA66
__gshared ushort unknown7EAA70; /// $(DOLLAR)AA70
__gshared ushort unknown7EAA72; /// $(DOLLAR)AA72
__gshared ushort unknown7EAA74; /// $(DOLLAR)AA74
__gshared ushort[4] unknown7EAA76; /// $(DOLLAR)AA76
__gshared ushort[4] unknown7EAA7E; /// $(DOLLAR)AA7E
__gshared ushort[4] unknown7EAA86; /// $(DOLLAR)AA86
__gshared ushort unknown7EAA8E; /// $(DOLLAR)AA8E
__gshared ushort unknown7EAA90; /// $(DOLLAR)AA90
__gshared ushort unknown7EAA92; /// $(DOLLAR)AA92
__gshared ushort unknown7EAA94; /// $(DOLLAR)AA94
__gshared ushort unknown7EAA96; /// $(DOLLAR)AA96
__gshared ubyte[26] unknown7EAA98; /// $(DOLLAR)AA98
__gshared ushort unknown7EAAB2; /// $(DOLLAR)AAB2
__gshared ushort unknown7EAAB4; /// $(DOLLAR)AAB4
__gshared ubyte[8] unknown7EAAB6; /// $(DOLLAR)AAB6
__gshared ushort[4] unknown7EAABE; /// $(DOLLAR)AABE
__gshared ubyte[8] unknown7EAAC6; /// $(DOLLAR)AAC6
__gshared ubyte[8] unknown7EAACE; /// $(DOLLAR)AACE
__gshared SpriteMap[16][4] battleSpritemaps; /// $(DOLLAR)AAD6
__gshared SpriteMap[16][4] altBattleSpritemaps; /// $(DOLLAR)AC16
__gshared ushort numBattlersInFrontRow; /// $(DOLLAR)AD56
__gshared ushort numBattlersInBackRow; /// $(DOLLAR)AD58
__gshared ubyte[8] battlerFrontRowXPositions; /// $(DOLLAR)AD5A
__gshared ubyte[8] battlerFrontRowYPositions; /// $(DOLLAR)AD62
__gshared ubyte[8] battlerBackRowXPositions; /// $(DOLLAR)AD6A
__gshared ubyte[8] battlerBackRowYPositions; /// $(DOLLAR)AD72
__gshared ubyte[8] backRowBattlers; /// $(DOLLAR)AD7A
__gshared ubyte[8] frontRowBattlers; /// $(DOLLAR)AD82
__gshared short currentLayerConfig; /// $(DOLLAR)AD8A
__gshared short verticalShakeDuration; /// $(DOLLAR)AD8C
__gshared short verticalShakeHoldDuration; /// $(DOLLAR)AD8E
__gshared short unknown7EAD90; /// $(DOLLAR)AD90
__gshared short wobbleDuration; /// $(DOLLAR)AD92
__gshared short shakeDuration; /// $(DOLLAR)AD94
__gshared short unknown7EAD96; /// $(DOLLAR)AD96
__gshared short unknown7EAD98; /// $(DOLLAR)AD98
__gshared short unknown7EAD9A; /// $(DOLLAR)AD9A
__gshared short unknown7EAD9C; /// $(DOLLAR)AD9C
__gshared short greenFlashDuration; /// $(DOLLAR)AD9E
__gshared short redFlashDuration; /// $(DOLLAR)ADA0
__gshared short enemyTargettingFlashing; /// $(DOLLAR)ADA2
__gshared short hpPPBoxBlinkDuration; /// $(DOLLAR)ADA4
__gshared short hpPPBoxBlinkTarget; /// $(DOLLAR)ADA6
__gshared short unknown7EADA8; /// $(DOLLAR)ADA8
__gshared short unknown7EADAA; /// $(DOLLAR)ADAA
__gshared short unknown7EADAC; /// $(DOLLAR)ADAC
__gshared short unknown7EADAE; /// $(DOLLAR)ADAE
__gshared short unknown7EADB0; /// $(DOLLAR)ADB0
__gshared short letterboxTopEnd; /// $(DOLLAR)ADB2
__gshared short letterboxBottomStart; /// $(DOLLAR)ADB4
__gshared short letterboxEffectEnding; /// $(DOLLAR)ADB6
__gshared HDMAWordTransfer[6] unknown7EADB8; /// $(DOLLAR)ADB8

__gshared short letterboxEffectEndingTop; /// $(DOLLAR)ADCC
__gshared short letterboxEffectEndingBottom; /// $(DOLLAR)ADCE
__gshared short unknown7EADD0; /// $(DOLLAR)ADD0
__gshared short unknown7EADD2; /// $(DOLLAR)ADD2
__gshared LoadedBackgroundData loadedBGDataLayer1; /// $(DOLLAR)ADD4
__gshared LoadedBackgroundData loadedBGDataLayer2; /// $(DOLLAR)AE4B
__gshared ubyte unknown7EAEC2; /// $(DOLLAR)AEC2
__gshared ubyte framesUntilNextSwirlFrame; /// $(DOLLAR)AEC3
__gshared ubyte swirlFramesLeft; /// $(DOLLAR)AEC4
__gshared ubyte swirlHDMATableID; /// $(DOLLAR)AEC5
__gshared ubyte swirlInvertEnabled; /// $(DOLLAR)AEC6
__gshared ubyte swirlReversed; /// $(DOLLAR)AEC7
__gshared ubyte swirlMaskSettings; /// $(DOLLAR)AEC8
__gshared ubyte unknown7EAEC9; /// $(DOLLAR)AEC9
__gshared ubyte unknown7EAECA; /// $(DOLLAR)AECA
__gshared ubyte unknown7EAECB; /// $(DOLLAR)AECB
__gshared const(AttractModeParameters)* loadedComputedSwirl; /// $(DOLLAR)AECC
__gshared short unknown7EAED0; /// $(DOLLAR)AED0
__gshared short unknown7EAED2; /// $(DOLLAR)AED2
__gshared short unknown7EAED4; /// $(DOLLAR)AED4
__gshared short unknown7EAED6; /// $(DOLLAR)AED6
__gshared short unknown7EAED8; /// $(DOLLAR)AED8
__gshared short unknown7EAEDA; /// $(DOLLAR)AEDA
__gshared short unknown7EAEDC; /// $(DOLLAR)AEDC
__gshared short unknown7EAEDE; /// $(DOLLAR)AEDE
__gshared short unknown7EAEE0; /// $(DOLLAR)AEE0
__gshared short unknown7EAEE2; /// $(DOLLAR)AEE2
__gshared ubyte unknown7EAEE4; /// $(DOLLAR)AEE4
__gshared ubyte unknown7EAEE5; /// $(DOLLAR)AEE5
__gshared ubyte unknown7EAEE6; /// $(DOLLAR)AEE6
__gshared ushort[4] unknown7EAEE7; /// $(DOLLAR)AEE7
__gshared ubyte unknown7EAEEF; /// $(DOLLAR)AEEF
__gshared ushort[2] unknown7EAEF0; /// $(DOLLAR)AEF0
__gshared ushort[4] battleSpritePaletteEffectFramesLeft; /// $(DOLLAR)AEF4
__gshared short[3 * 16 * 4] battleSpritePaletteEffectDeltas; /// $(DOLLAR)AEFC
__gshared short[3 * 16 * 4] battleSpritePaletteEffectCounters; /// $(DOLLAR)B07C
__gshared short[3 * 16 * 4] battleSpritePaletteEffectSteps; /// $(DOLLAR)B1FC
__gshared short battleSpritePaletteEffectSpeed; /// $(DOLLAR)B37C
__gshared SoundStoneMelodyState[8] soundStonePlaybackState; /// $(DOLLAR)B37E
__gshared SpriteMap soundStoneSpriteTilemap1; /// $(DOLLAR)B3EE
__gshared SpriteMap soundStoneSpriteTilemap2; /// $(DOLLAR)B3F3
__gshared short unknown7EB3F8; /// $(DOLLAR)B3F8
__gshared short unknown7EB3FA; /// $(DOLLAR)B3FA
__gshared ubyte* pathMatrixBuffer; /// $(DOLLAR)B3FC - Matrix buffer
__gshared ushort pathMatrixRows; /// $(DOLLAR)B400 - Matrix rows
__gshared ushort pathMatrixCols; /// $(DOLLAR)B402 - Matrix columns
__gshared ushort pathMatrixBorder; /// $(DOLLAR)B404 - Matrix start point border size (for offscreen deliverymen)
__gshared ushort pathMatrixSize; /// $(DOLLAR)B406 - Matrix size (path_matrix_rows * path_matrix_cols)
__gshared ushort* pathB408; /// $(DOLLAR)B408 - Pathfinder unknown int array start pointer
__gshared ushort* pathB40A; /// $(DOLLAR)B40A - Pathfinder unknown int array end pointer
__gshared ushort* pathB40C; /// $(DOLLAR)B40C - Pathfinder unknown int array curr pointer #1
__gshared ushort* pathB40E; /// $(DOLLAR)B40E - Pathfinder unknown int array curr pointer #2
__gshared short[4] pathCardinalOffset; /// $(DOLLAR)B410 - Pathfinder matrix offset increments for each cardinal (N/E/S/W) direction
__gshared VecYX[4] pathCardinalIndex; /// $(DOLLAR)B418 - Pathfinder matrix index increments for each cardinal direction
__gshared VecYX[4] pathDiagonalIndex; /// $(DOLLAR)B428 - Pathfinder matrix index increments for each ordinal (NE/SE/SW/NW) direction
__gshared void* pathHeapStart; /// $(DOLLAR)B438 - Pathfinder heap start pointer
__gshared void* pathHeapCurrent; /// $(DOLLAR)B43A - Pathfinder heap current pointer
__gshared void* pathHeapEnd; /// $(DOLLAR)B43C - Pathfinder heap end pointer

__gshared ubyte unknown7EB49D; /// $(DOLLAR)B49D - Addressed specifically using long addressing, why??
__gshared ubyte[3] unknown7EB49E; /// $(DOLLAR)B49E
__gshared ubyte currentSaveSlot; /// $(DOLLAR)B4A1
__gshared ubyte unknown7EB4A2; /// $(DOLLAR)B4A2

__gshared ubyte* entityFadeStatesBuffer; /// $(DOLLAR)B4A4
__gshared short entityFadeStatesLength; /// $(DOLLAR)B4A6
__gshared short entityFadeEntity; /// $(DOLLAR)B4A8
__gshared SpriteFadeState* entityFadeStates; /// $(DOLLAR)B4AA
__gshared short townMapIconAnimationFrame; /// $(DOLLAR)B4AE
__gshared short townMapPlayerIconAnimationFrame; /// $(DOLLAR)B4B0
__gshared short framesUntilMapIconPaletteUpdate; /// $(DOLLAR)B4B2
__gshared short waitForNamingScreenActionScript; /// $(DOLLAR)B4B4
__gshared ubyte disabledTransitions; /// $(DOLLAR)B4B6
__gshared ubyte nextYourSanctuaryLocationTileIndex; /// $(DOLLAR)B4B8
__gshared ubyte totalYourSanctuaryLoadedTilesetTiles; /// $(DOLLAR)B4BA
__gshared ubyte yourSanctuaryLoadedTilesetTiles; /// $(DOLLAR)B4BC
__gshared ushort[8] loadedYourSanctuaryLocations; /// $(DOLLAR)B4BE
__gshared ubyte unknown7EB4CE; /// $(DOLLAR)B4CE
__gshared short unknown7EB4CF; /// $(DOLLAR)B4CF
__gshared short unknown7EB4D1; /// $(DOLLAR)B4D1
__gshared short unknown7EB4D3; /// $(DOLLAR)B4D3

__gshared ushort creditsNextCreditPosition; /// $(DOLLAR)B4E3
__gshared short creditsRowWipeThreshold; /// $(DOLLAR)B4E5 - Y position where top row gets cleared
__gshared const(ubyte)* creditsSource; /// $(DOLLAR)B4E7
__gshared FixedPoint1616 creditsScrollPosition; /// $(DOLLAR)B4EB
__gshared short photographMapLoadingMode; /// $(DOLLAR)B4EF
__gshared short currentPhotoDisplay; /// $(DOLLAR)B4F1
__gshared short creditsDMAQueueEnd; /// $(DOLLAR)B4F3
__gshared short creditsDMAQueueStart; /// $(DOLLAR)B4F5
__gshared short creditsCurrentRow; /// $(DOLLAR)B4F7
__gshared ubyte[24] creditsPlayerNameBuffer; /// $(DOLLAR)B4F9
__gshared short[10] unknown7EB511; /// $(DOLLAR)B511
__gshared ushort[10] deliveryTimers; /// $(DOLLAR)B525
__gshared short piracyFlag; /// $(DOLLAR)B539
__gshared ushort currentMusicTrack; /// $(DOLLAR)B53B
__gshared short debugSoundMenuInitialBGM; /// $(DOLLAR)B545
__gshared short unknown7EB547; /// $(DOLLAR)B547
__gshared ushort enableAutoSectorMusicChanges; /// $(DOLLAR)B549
__gshared ushort debugSoundMenuSelectedBGM; /// $(DOLLAR)B54B
__gshared ushort debugSoundMenuSelectedSE; /// $(DOLLAR)B54D
__gshared ushort debugSoundMenuSelectedEffect; /// $(DOLLAR)B54F
__gshared ushort unknown7EB551; /// $(DOLLAR)B551
__gshared ushort debugCursorEntity; /// $(DOLLAR)B553
__gshared ushort debugMenuCursorPosition; /// $(DOLLAR)B555
__gshared ushort debugMenuButtonPressed; /// $(DOLLAR)B557
__gshared ushort debugModeNumber; /// $(DOLLAR)B559


__gshared ushort unknown7EB55D; /// $(DOLLAR)B55D
__gshared ushort viewAttributeMode; /// $(DOLLAR)B55F
__gshared ushort debugStartPositionX; /// $(DOLLAR)B561
__gshared ushort debugStartPositionY; /// $(DOLLAR)B563
__gshared ushort debugViewCharacterSprite; /// $(DOLLAR)B565
__gshared ushort replayModeActive; /// $(DOLLAR)B567
__gshared ushort unknown7EB569; /// $(DOLLAR)B569
__gshared ushort unknown7EB56B; /// $(DOLLAR)B56B
__gshared ushort randABackup; /// $(DOLLAR)B56D
__gshared ushort randBBackup; /// $(DOLLAR)B56F
__gshared ushort frameCounterBackup; /// $(DOLLAR)B571
__gshared ushort replayTransitionStyle; /// $(DOLLAR)B573
__gshared ushort debugEnemiesEnabledFlag; /// $(DOLLAR)B575

__gshared ubyte[0x800] animatedMapPaletteBuffer; /// $(DOLLAR)B800
__gshared ubyte[0x2000] unknown7EC000; /// $(DOLLAR)C000

__gshared ubyte[64][64] loadedCollisionTiles; /// $(DOLLAR)E000
__gshared Unknown7EF000Stuff unknown7EF000; /// $(DOLLAR)F000
__gshared ubyte[0x10000] buffer; /// $(DOLLAR)7F0000
ref ushort[0x80] paletteAnimTargetPalette() { return (cast(ushort*)&buffer[0x7800])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimRedSlope() { return (cast(ushort*)&buffer[0x7900])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimGreenSlope() { return (cast(ushort*)&buffer[0x7A00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimBlueSlope() { return (cast(ushort*)&buffer[0x7B00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimRedAccum() { return (cast(ushort*)&buffer[0x7C00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimGreenAccum() { return (cast(ushort*)&buffer[0x7D00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimBlueAccum() { return (cast(ushort*)&buffer[0x7E00])[0 .. 0x80]; }
__gshared ushort[0x3C00] tileArrangementBuffer; /// $(DOLLAR)7F8000
__gshared const(ubyte[4][4])*[0x400] tileCollisionBuffer; /// $(DOLLAR)7FF800

__gshared ubyte[0x8000] introBG2Buffer; /// $(DOLLAR)8000 - this seems to overlap with other stuff...?


// Actionscript stuff. This was originally assembly and relied on some unusual direct page manipulation, which cannot be reproduced exactly

__gshared ushort actionScriptVar80; /// $(DOLLAR)80

__gshared ActionLoopCallState* actionScriptVar84; /// $(DOLLAR)84
__gshared ushort actionScriptVar86; /// $(DOLLAR)86
__gshared ushort actionScriptVar88; /// $(DOLLAR)88
__gshared ushort currentEntityScriptOffset; /// $(DOLLAR)8A
__gshared const(SpriteMap)* actionScriptVar8C; /// $(DOLLAR)8C
__gshared const(ubyte)* actionScriptVar8CScript; /// $(DOLLAR)8C
__gshared ushort* actionScriptVar8CMemory; /// $(DOLLAR)8C
__gshared ubyte actionScriptVar8E; /// $(DOLLAR)8E

__gshared short actionScriptVar90; /// $(DOLLAR)90

__gshared const(ubyte)* actionScriptVar92; /// $(DOLLAR)92

__gshared const(ubyte)* actionScriptVar94; /// $(DOLLAR)94

// Other hardware stuff

version(savememory) __gshared SRAM sram; /// $(DOLLAR)306000
__gshared SaveDataReplay replaySRAM; /// $(DOLLAR)316000
__gshared DemoEntry[0] sram3; /// $(DOLLAR)326000

/// non-SNES stuff
bool romDataLoaded;
