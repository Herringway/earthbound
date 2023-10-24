/// Every one of Earthbound's global variables
module earthbound.globals;

import earthbound.commondefs;
import earthbound.hardware;

/** The index of the last item added to the DMA queue
 * Original_Address: $(DOLLAR)0000
 */
__gshared ubyte dmaQueueIndex;
/** The index of the last item completed in the DMA queue
 * Original_Address: $(DOLLAR)0001
 */
__gshared ubyte lastCompletedDMAIndex;
/** A frame counter. Value increases every frame, useful for "every X frame" effects
 *  Original_Address: $(DOLLAR)0002
 */
__gshared ubyte frameCounter;
/** Address of the OAM table mirror being used this frame
 * Original_Address: $(DOLLAR)0003
 */
__gshared OAMEntry* oamAddr;
/** End of the OAM table mirror being used this frame
 * Original_Address: $(DOLLAR)0005
 */
__gshared OAMEntry* oamEndAddr;
/** Address of the OAM high table mirror being used this frame
 * Original_Address: $(DOLLAR)0007
 */
__gshared ubyte* oamHighTableAddr;
/** Unclear. Never read, only initialized to zero on the first rendered frame
 * Original_Address: $(DOLLAR)0009
 */
__gshared ubyte unknown7E0009;
/** Buffer used for the OAM high table sprites, holds upper bits for four sprites at a time
 * Original_Address: $(DOLLAR)000A
 */
__gshared ubyte oamHighTableBuffer;
/** The bank address for the currently-rendered spritemap. Spritemaps normally use near pointers with the bank stored separately, seemingly to save a few bytes of RAM
 * Original_Address: $(DOLLAR)000B
 */
__gshared ushort spritemapBank;
/** Mirror of the INIDISP register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)000D
 */
__gshared ubyte mirrorINIDISP;
/** Mirror of the OBSEL register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)000E
 */
__gshared ubyte mirrorOBSEL;
/** Mirror of the BGMODE register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)000F
 */
__gshared ubyte mirrorBGMODE;
/** Mirror of the MOSAIC register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)0010
 */
__gshared ubyte mirrorMOSAIC;
/** Mirror of the BG1SC register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)0011
 */
__gshared ubyte mirrorBG1SC;
/** Mirror of the BG2SC register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)0012
 */
__gshared ubyte mirrorBG2SC;
/** Mirror of the BG3SC register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)0013
 */
__gshared ubyte mirrorBG3SC;
/** Mirror of the BG4SC register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)0014
 */
__gshared ubyte mirrorBG4SC;
/** Mirror of the BG12NBA register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)0015
 */
__gshared ubyte mirrorBG12NBA;
/** Mirror of the BG34NBA register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)0016
 */
__gshared ubyte mirrorBG34NBA;
/** Mirror of the WH2 register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)0017
 */
__gshared ushort mirrorWH2;
/** Mirror of the TM register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)001A
 */
__gshared ubyte mirrorTM;
/** Mirror of the TD register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)001B
 */
__gshared ubyte mirrorTD;

/** Unknown, but likely another register mirror. Not used
 * Original_Address: $(DOLLAR)001D
 */
__gshared ubyte unknown7E001D;
/** Mirror of the NMITIMEN register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)001E
 */
__gshared ubyte mirrorNMITIMEN;
/** Mirror of the HDMAEN register, copied to the real register during NMI
 * Original_Address: $(DOLLAR)001F
 */
__gshared ubyte mirrorHDMAEN;
/** A function pointer to be called during interrupts
 * Original_Address: $(DOLLAR)0020
 */
__gshared void function() irqCallback;
/** A flag set when the IRQ callback has been called and cleared when it returns
 * Original_Address: $(DOLLAR)0022
 */
__gshared ubyte inIRQCallback;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)0023
 */
__gshared ubyte unknown7E0023;
/** Random number generator state
 * Original_Address: $(DOLLAR)0024
 */
__gshared ushort randA;
/** More random number generator state
 * Original_Address: $(DOLLAR)0026
 */
__gshared ushort randB;
/** Parameters used for fading the entire screen to/from black
 * Original_Address: $(DOLLAR)0028
 */
__gshared FadeParameters fadeParameters;
/** Number of frames left in a fullscreen fade.
 * Original_Address: $(DOLLAR)002A
 */
__gshared byte fadeDelayFramesLeft;
/** Set to 0 at the start of a new frame, 1 at the end of one
 * Original_Address: $(DOLLAR)002B
 */
__gshared ubyte newFrameStarted;
/** The ID of the frame being/about to be displayed, multiplied by 2
 * Original_Address: $(DOLLAR)002C
 */
__gshared ubyte nextFrameDisplayID;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)002D
 */
__gshared ubyte unknown7E002D;
/** The ID of the next frame to buffer as a byte offset - 0 for buffer 0, 2 for buffer 1
 * Original_Address: $(DOLLAR)002E
 */
__gshared ubyte nextFrameBufferID;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)002F
 */
__gshared ubyte unknown7E002F;
/** Palette upload mode.
 * See_Also: earthbound.commondefs.PaletteUpload
 * Original_Address: $(DOLLAR)0030
 */
__gshared ubyte paletteUploadMode;
/** The X offset for background layer 1
 * Original_Address: $(DOLLAR)0031
 */
__gshared ushort bg1XPosition;
/** The Y offset for background layer 1
 * Original_Address: $(DOLLAR)0033
 */
__gshared ushort bg1YPosition;
/** The X offset for background layer 2
 * Original_Address: $(DOLLAR)0035
 */
__gshared ushort bg2XPosition;
/** The Y offset for background layer 2
 * Original_Address: $(DOLLAR)0037
 */
__gshared ushort bg2YPosition;
/** The X offset for background layer 3
 * Original_Address: $(DOLLAR)0039
 */
__gshared ushort bg3XPosition;
/** The Y offset for background layer 3
 * Original_Address: $(DOLLAR)003B
 */
__gshared ushort bg3YPosition;
/** The X offset for background layer 4
 * Original_Address: $(DOLLAR)003D
 */
__gshared ushort bg4XPosition;
/** The Y offset for background layer 4
 * Original_Address: $(DOLLAR)003F
 */
__gshared ushort bg4YPosition;
/** Two frames worth of X offsets for background layer 1
 * Original_Address: $(DOLLAR)0041
 */
__gshared ushort[2] bg1XPositionBuffer;
/** Two frames worth of Y offsets for background layer 1
 * Original_Address: $(DOLLAR)0045
 */
__gshared ushort[2] bg1YPositionBuffer;
/** Two frames worth of X offsets for background layer 2
 * Original_Address: $(DOLLAR)0049
 */
__gshared ushort[2] bg2XPositionBuffer;
/** Two frames worth of Y offsets for background layer 2
 * Original_Address: $(DOLLAR)004D
 */
__gshared ushort[2] bg2YPositionBuffer;
/** Two frames worth of X offsets for background layer 3
 * Original_Address: $(DOLLAR)0051
 */
__gshared ushort[2] bg3XPositionBuffer;
/** Two frames worth of Y offsets for background layer 3
 * Original_Address: $(DOLLAR)0055
 */
__gshared ushort[2] bg3YPositionBuffer;
/** Two frames worth of X offsets for background layer 4
 * Original_Address: $(DOLLAR)0059
 */
__gshared ushort[2] bg4XPositionBuffer;
/** Two frames worth of Y offsets for background layer 4
 * Original_Address: $(DOLLAR)005D
 */
__gshared ushort[2] bg4YPositionBuffer;
/** The X offset of background layer 1 on the last even(?) frame. Only written, never read
 * Original_Address: $(DOLLAR)0061
 */
__gshared ushort evenBG1XPosition;
/** The Y offset of background layer 1 on the last even(?) frame. Only written, never read
 * Original_Address: $(DOLLAR)0063
 */
__gshared ushort evenBG1YPosition;

/** The current state of the two controllers
 * Original_Address: $(DOLLAR)0065
 */
__gshared ushort[2] padState;
/** Held buttons on both controllers
 * Original_Address: $(DOLLAR)0069
 */
__gshared ushort[2] padHeld;
/** Pressed buttons on both controllers
 * Original_Address: $(DOLLAR)006D
 */
__gshared ushort[2] padPress;
/** Timer for both controllers's auto-repeat
 * Original_Address: $(DOLLAR)0071
 */
__gshared ushort[2] padTimer;
/** Temp var for masking off nonexistent controller buttons
 * Original_Address: $(DOLLAR)0075
 */
__gshared ushort padTemp;
/** Controller "raw" state (how exactly is this different from padState?)
 * Original_Address: $(DOLLAR)0077
 */
__gshared ushort[2] padRaw;
/** The current mode flags for the demo recording and playback system.
 * Original_Address: $(DOLLAR)007B
 * See_Also: earthbound.commondefs.DemoRecordingFlags
 */
__gshared ushort demoRecordingFlags;
/** The address of a demo being replayed
 * Original_Address: $(DOLLAR)007D
 */
__gshared DemoEntry* demoReadSource;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)007F
 */
__gshared ubyte unknown7E007F;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)0080
 */
__gshared ubyte unknown7E0080;
/** Number of frames left in the currently playing demo
 * Original_Address: $(DOLLAR)0081
 */
__gshared short demoFramesLeft;
/** Initial controller state from the first frame of the demo
 * Original_Address: $(DOLLAR)0083
 */
__gshared short demoInitialPadState;
/** Address of the demo being recorded to
 * Original_Address: $(DOLLAR)0085
 */
__gshared DemoEntry* demoWriteDestination;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)0087
 */
__gshared short unknown7E0087;
/** Number of frames since the last controller input changed
 * Original_Address: $(DOLLAR)0089
 */
__gshared short demoSameInputFrames;
/** The last recorded controller input
 * Original_Address: $(DOLLAR)008B
 */
__gshared short demoLastInput;
/** Unknown. Only used in unused function C08573.
 * Original_Address: $(DOLLAR)008D
 */
__gshared const(void)* unknown7E008D;
/** DMA copy mode. Used as an index for earthbound.bank00.dmaTable.
 * Original_Address: $(DOLLAR)0091
 */
__gshared ubyte dmaCopyMode;
/** Size of DMA copy in bytes
 * Original_Address: $(DOLLAR)0092
 */
__gshared ushort dmaCopySize;
/** Where the data for the DMA copy is sourced from
 * Original_Address: $(DOLLAR)0094
 */
__gshared const(void)* dmaCopyRAMSource;
/** Destination in VRAM to copy to. This is word addressing, not byte addressing
 * Original_Address: $(DOLLAR)0097
 */
__gshared ushort dmaCopyVRAMDestination;
/** Number of bytes copied by DMA this frame
 * Original_Address: $(DOLLAR)0099
 */
__gshared short dmaBytesCopied;
/** Base X coordinate for the current sprite being drawn
 * Original_Address: $(DOLLAR)009B
 */
__gshared short currentSpriteXBase;
/** Base Y coordinate for the current sprite being drawn
 * Original_Address: $(DOLLAR)009D
 */
__gshared short currentSpriteYBase;
/** Y coordinate of the current hardware sprite being drawn
 * Original_Address: $(DOLLAR)009F
 */
__gshared short currentSpriteY;
/** The end of the currently allocated heap, where the next allocation will start.
 * Original_Address: $(DOLLAR)00A1
 */
__gshared void* currentHeapAddress;
/** The base address of the currently active heap, where dynamic allocations are made
 * Original_Address: $(DOLLAR)00A3
 */
__gshared void* heapBaseAddress;
/** Number of words left to copy in the memcpy16 intrinsic
 * Original_Address: $(DOLLAR)00A5
 */
__gshared ubyte memcpyWordsLeft;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)00A6
 */
__gshared ubyte unknown7E00A6;
/** Number of frames of play since the game file was created. Overflows after about 2 years, 98 days, 12 hours, 6 minutes and 28.27 seconds
 * Original_Address: $(DOLLAR)00A7
 */
__gshared uint timer;
/** Unknown. Only set to zero after an interrupt is done
 * Original_Address: $(DOLLAR)00AB
 */
__gshared ubyte unknown7E00AB;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)00AC
 */
__gshared ubyte unknown7E00AC;
/** Unknown. Only written to by actionscript #894, which seems to be unused and does nothing else. Possibly related to the wandering photographer, as it is grouped with them
 * Original_Address: $(DOLLAR)00AD
 */
__gshared ubyte unknown7E00AD;

// compiler-generated pseudoglobals
/// Original_Address: $(DOLLAR)00AE
//__gshared short unknown7E00AE;
/// Original_Address: $(DOLLAR)00B0
//__gshared ubyte unknown7E00B0;
/// Original_Address: $(DOLLAR)00B1
//__gshared ubyte unknown7E00B1;
/// Original_Address: $(DOLLAR)00B2
//__gshared short unknown7E00B2;
/// Original_Address: $(DOLLAR)00B4
//__gshared ubyte tempDividend;
/// Original_Address: $(DOLLAR)00B5
//__gshared ubyte unknown7E00B5;
/// Original_Address: $(DOLLAR)00B6
//__gshared ubyte unknown7E00B6;
/// Original_Address: $(DOLLAR)00B7
//__gshared ubyte unknown7E00B7;
/// Original_Address: $(DOLLAR)00B8
//__gshared ubyte unknown7E00B8;
/// Original_Address: $(DOLLAR)00B9
//__gshared ubyte unknown7E00B9;
/// Original_Address: $(DOLLAR)00BA
//__gshared short unknown7E00BA;
/// Original_Address: $(DOLLAR)00BC
//__gshared short unknown7E00BC;
/// Original_Address: $(DOLLAR)00BE
//__gshared short unknown7E00BE;
/// Original_Address: $(DOLLAR)00C0
//__gshared short unknown7E00C0;

/** Number of times the mult16 intrinsic has been called
 * Original_Address: $(DOLLAR)00C4
 */
__gshared short mult16NumCalls;
/** Temporary source buffer location for decomp assembly
 * Original_Address: $(DOLLAR)00CC
 */
__gshared const(void)* decompSourceBuffer;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)00CE
 */
__gshared ubyte unknown7E00CE;
/** Temporary destination buffer location for decomp assembly
 * Original_Address: $(DOLLAR)00CF
 */
__gshared void* decompDestBuffer;
/** Temporary variable used by decomp assembly
 * Original_Address: $(DOLLAR)00D1
 */
__gshared ubyte decompTemp1;
/** Temporary variable used by decomp assembly
 * Original_Address: $(DOLLAR)00D2
 */
__gshared ubyte decompTemp2;
/** Temporary variable used by decomp assembly
 * Original_Address: $(DOLLAR)00D3
 */
__gshared short decompTemp3;

/** A mirror of the ppu's CGRAM. Stores palette data for backgrounds and sprites
 * Original_Address: $(DOLLAR)0200
 */
__gshared ushort[16][16] palettes;
/** DMA transfers to perform during the next interrupt
 * Original_Address: $(DOLLAR)0400
 */
__gshared DMAQueueEntry[30] dmaQueue;


/** OAM mirror for every odd frame. Holds hardware sprite data. Aligned to 0x100 bytes for performance reasons
 * Original_Address: $(DOLLAR)0500
 */
__gshared FullOAMTable oam1;
/** OAM mirror for every even frame. Holds hardware sprite data. Aligned to 0x100 bytes for performance reasons
 * Original_Address: $(DOLLAR)0800
 */
__gshared FullOAMTable oam2;

/** Flag set when the player has done something this frame. Prevents door transitions if not set
 * Original_Address: $(DOLLAR)0A34
 */
__gshared short playerHasDoneSomethingThisFrame;
/** Last SRAM bank tested by testSRAMSize. Is either 0x30 (retail) or 0x32 (dev?).
 * Original_Address: $(DOLLAR)0A36
 */
__gshared short lastSRAMBank;
/** Value to initialize a new entity's var 0 with.
 * Original_Address: $(DOLLAR)0A38
 */
__gshared short newEntityVar0;
/** Value to initialize a new entity's var 1 with.
 * Original_Address: $(DOLLAR)0A3A
 */
__gshared short newEntityVar1;
/** Value to initialize a new entity's var 2 with.
 * Original_Address: $(DOLLAR)0A3C
 */
__gshared short newEntityVar2;
/** Value to initialize a new entity's var 3 with.
 * Original_Address: $(DOLLAR)0A3E
 */
__gshared short newEntityVar3;
/** Value to initialize a new entity's var 4 with.
 * Original_Address: $(DOLLAR)0A40
 */
__gshared short newEntityVar4;
/** Value to initialize a new entity's var 5 with.
 * Original_Address: $(DOLLAR)0A42
 */
__gshared short newEntityVar5;
/** Value to initialize a new entity's var 6 with.
 * Original_Address: $(DOLLAR)0A44
 */
__gshared short newEntityVar6;
/** Value to initialize a new entity's var 7 with.
 * Original_Address: $(DOLLAR)0A46
 */
__gshared short newEntityVar7;
/** Value to initialize a new entity's Z coordinate with.
 * Original_Address: $(DOLLAR)0A48
 */
__gshared short newEntityPosZ;
/** Value to initialize a new entity's priority with.
 * Original_Address: $(DOLLAR)0A4A
 */
__gshared short newEntityPriority;
/** Lowest slot to allocate entities in
 * Original_Address: $(DOLLAR)0A4C
 */
__gshared short entityAllocationMinSlot;
/** Highest slot to allocate entities in
 * Original_Address: $(DOLLAR)0A4E
 */
__gshared short entityAllocationMaxSlot;
/** First allocated entity's ID, or -1 if none allocated
 * Original_Address: $(DOLLAR)0A50
 */
__gshared short firstEntity = -1;
/** Last allocated entity's ID, or -1 if none allocated
 * Original_Address: $(DOLLAR)0A52
 */
__gshared short lastEntity;
/** Last allocated script's offset, or 0 if none allocated
 * Original_Address: $(DOLLAR)0A54
 */
__gshared short lastAllocatedScript;
/** The next active entity (offset) to process, if any
 * Original_Address: $(DOLLAR)0A56
 */
__gshared short nextActiveEntity;
/** The script ID for the active entity, or -1 if none/completed
 * Original_Address: $(DOLLAR)0A58
 */
__gshared short actionScriptCurrentScript;
/** The active entity's tick callback
 * Original_Address: $(DOLLAR)0A5A
 */
__gshared void function() currentEntityTickCallback;
/** The active entity's draw callback
 * Original_Address: $(DOLLAR)0A5E
 */
__gshared void function() actionScriptDrawCallback;
/** Disables actionscript execution while non-zero. Used to prevent accidental actionscript frame generation recursion
 * Original_Address: $(DOLLAR)0A60
 */
__gshared short disableActionscript;
/** IDs of all entities currently loaded
 * Original_Address: $(DOLLAR)0A62
 */
__gshared short[maxEntities] entityScriptTable;
/** IDs for the next active entity to process for each loaded entity
 * Original_Address: $(DOLLAR)0A9E
 */
__gshared short[maxEntities] entityNextEntityTable;
/** Loaded script ID for currently loaded entities
 * Original_Address: $(DOLLAR)0ADA
 */
__gshared short[maxEntities] entityScriptIndexTable;
/** X screen coordinates for active entities. Typically updated by draw callbacks
 * Original_Address: $(DOLLAR)0B16
 */
__gshared short[maxEntities] entityScreenXTable;
/** Y screen coordinates for active entities. Typically updated by draw callbacks
 * Original_Address: $(DOLLAR)0B52
 */
__gshared short[maxEntities] entityScreenYTable;
/** X coordinates for active entities. Typically updated by move callbacks
 * Original_Address: $(DOLLAR)0B8E
 */
__gshared short[maxEntities] entityAbsXTable;
/** Y coordinates for active entities. Typically updated by move callbacks
 * Original_Address: $(DOLLAR)0BCA
 */
__gshared short[maxEntities] entityAbsYTable;
/** Z coordinates for active entities. Typically updated by move callbacks
 * Original_Address: $(DOLLAR)0C06
 */
__gshared short[maxEntities] entityAbsZTable;
/** Fractional X coordinates for active entities. Typically updated by move callbacks
 * Original_Address: $(DOLLAR)0C42
 */
__gshared ushort[maxEntities] entityAbsXFractionTable;
/** Fractional Y coordinates for active entities. Typically updated by move callbacks
 * Original_Address: $(DOLLAR)0C7E
 */
__gshared ushort[maxEntities] entityAbsYFractionTable;
/** Fractional Z coordinates for active entities. Typically updated by move callbacks
 * Original_Address: $(DOLLAR)0CBA
 */
__gshared ushort[maxEntities] entityAbsZFractionTable;
/// Just a convenience function for getting full X coordinates for an active entity
const(FixedPoint1616) fullEntityAbsX(size_t idx) {
	return FixedPoint1616(entityAbsXFractionTable[idx], entityAbsXTable[idx]);
}
/// Just a convenience function for getting full Y coordinates for an active entity
const(FixedPoint1616) fullEntityAbsY(size_t idx) {
	return FixedPoint1616(entityAbsYFractionTable[idx], entityAbsYTable[idx]);
}
/// Just a convenience function for getting full Z coordinates for an active entity
const(FixedPoint1616) fullEntityAbsZ(size_t idx) {
	return FixedPoint1616(entityAbsZFractionTable[idx], entityAbsZTable[idx]);
}
/** X coordinate deltas for active entities. Determines how much movement along a particular axis is happening this frame with typical move callbacks
 * Original_Address: $(DOLLAR)0CF6
 */
__gshared short[maxEntities] entityDeltaXTable;
/** Y coordinate deltas for active entities. Determines how much movement along a particular axis is happening this frame with typical move callbacks
 * Original_Address: $(DOLLAR)0D32
 */
__gshared short[maxEntities] entityDeltaYTable;
/** Z coordinate deltas for active entities. Determines how much movement along a particular axis is happening this frame with typical move callbacks. Not always used
 * Original_Address: $(DOLLAR)0D6E
 */
__gshared short[maxEntities] entityDeltaZTable;
/** Fractional X coordinate deltas for active entities. Determines how much movement along a particular axis is happening this frame with typical move callbacks
 * Original_Address: $(DOLLAR)0DAA
 */
__gshared ushort[maxEntities] entityDeltaXFractionTable;
/** Fractional Y coordinate deltas for active entities. Determines how much movement along a particular axis is happening this frame with typical move callbacks
 * Original_Address: $(DOLLAR)0DE6
 */
__gshared ushort[maxEntities] entityDeltaYFractionTable;
/** Fractional Z coordinate deltas for active entities. Determines how much movement along a particular axis is happening this frame with typical move callbacks. Not always used
 * Original_Address: $(DOLLAR)0E22
 */
__gshared ushort[maxEntities] entityDeltaZFractionTable;
/// Just a convenience function for getting full X deltas for an active entity
const(FixedPoint1616) fullEntityDeltaX(size_t idx) {
	return FixedPoint1616(entityDeltaXFractionTable[idx], entityDeltaXTable[idx]);
}
/// Just a convenience function for getting full Y deltas for an active entity
const(FixedPoint1616) fullEntityDeltaY(size_t idx) {
	return FixedPoint1616(entityDeltaYFractionTable[idx], entityDeltaYTable[idx]);
}
/// Just a convenience function for getting full Z deltas for an active entity
const(FixedPoint1616) fullEntityDeltaZ(size_t idx) {
	return FixedPoint1616(entityDeltaZFractionTable[idx], entityDeltaZTable[idx]);
}
/** Temporary variable 0 for active entities
 * Original_Address: $(DOLLAR)0E5E
 */
__gshared short[maxEntities] entityScriptVar0Table;
/** Temporary variable 1 for active entities
 * Original_Address: $(DOLLAR)0E9A
 */
__gshared short[maxEntities] entityScriptVar1Table;
/** Temporary variable 2 for active entities
 * Original_Address: $(DOLLAR)0ED6
 */
__gshared short[maxEntities] entityScriptVar2Table;
/** Temporary variable 3 for active entities
 * Original_Address: $(DOLLAR)0F12
 */
__gshared short[maxEntities] entityScriptVar3Table;
/** Temporary variable 4 for active entities
 * Original_Address: $(DOLLAR)0F4E
 */
__gshared short[maxEntities] entityScriptVar4Table;
/** Temporary variable 5 for active entities
 * Original_Address: $(DOLLAR)0F8A
 */
__gshared short[maxEntities] entityScriptVar5Table;
/** Temporary variable 6 for active entities. Often paired with variable 7 for some extra coordinate data
 * Original_Address: $(DOLLAR)0FC6
 */
__gshared short[maxEntities] entityScriptVar6Table;
/** Temporary variable 7 for active entities. Often paired with variable 6 for some extra coordinate data
 * Original_Address: $(DOLLAR)1002
 */
__gshared short[maxEntities] entityScriptVar7Table;
/** Draw priorities for active entities
 * Original_Address: $(DOLLAR)103E
 */
__gshared ushort[maxEntities] entityDrawPriority;

/** Entity callback flags for active entities. Can disable tick callbacks and/or move callbacks.
 * Original_Address: $(DOLLAR)107A and $(DOLLAR)10B6
 */
__gshared ushort[maxEntities] entityCallbackFlags;
/** Tick callbacks for active entities. These are called once per frame to do some script-specific task
 * Original_Address: $(DOLLAR)107A and $(DOLLAR)10B6
 */
__gshared void function()[maxEntities] entityTickCallbacks;

/** The current animation frame for active entities. May be -1, if no frame is selected. Exact meaning depends on the draw callback used
 * Original_Address: $(DOLLAR)10F2
 */
__gshared short[maxEntities] entityAnimationFrames;

/** Drawing flags for active entities
 * Original_Address: $(DOLLAR)112E and $(DOLLAR)116A
 */
__gshared ushort[maxEntities] entitySpriteMapFlags;
/** Spritemap pointers for active entities
 * Original_Address: $(DOLLAR)112E and $(DOLLAR)116A
 */
__gshared const(SpriteMap)*[maxEntities] entitySpriteMapPointers;
/** Spritemap pointers for active entities
 * Original_Address: $(DOLLAR)112E and $(DOLLAR)116A
 */
__gshared const(SpriteMap*)*[maxEntities] entitySpriteMapPointersDptr;

/** Screen position callbacks for active entities. Called on each frame after the tick callbacks and move callbacks, but before drawing callbacks.
 * Typically used to translate absolute positioning to screen positioning
 * Original_Address: $(DOLLAR)11A6
 */
__gshared void function()[maxEntities] entityScreenPositionCallbacks;
/** Draw callbacks for active entities. Called at the end of actionscript processing, this typically does whatever rendering is necessary for the entity to be visible
 * Original_Address: $(DOLLAR)11E2
 */
__gshared void function(short, short)[maxEntities] entityDrawCallbacks;
/** Move callbacks for active entities. Called after all tick callbacks are complete, this typically moves entities around in the game world
 * Original_Address: $(DOLLAR)121E
 */
__gshared void function()[maxEntities] entityMoveCallbacks;
/** The next scripts in line to be executed. Entry indices are in the entityScriptTable
 * Original_Address: $(DOLLAR)125A
 */
__gshared short[maxScripts] entityScriptNextScripts;
/** Stack frame indices for active scripts. Although the frames are (void*).sizeof + 1 bytes each, this will always be a multiple of 3 like the original 65816 implementation
 * Original_Address: $(DOLLAR)12E6
 */
__gshared short[maxScripts] entityScriptStackPosition;
/** Number of frames until each active script starts executing again. This will be -1 if the script is disabled, but will still count down if not also disabled some other way
 * Original_Address: $(DOLLAR)1372
 */
__gshared short[maxScripts] entityScriptSleepFrames;
/** Current script position for active scripts
 * Original_Address: $(DOLLAR)13FE and $(DOLLAR)148A
 */
__gshared const(ubyte)*[maxScripts] entityProgramCounters;
/** The 'tempvar' for all active scripts. This is the value returned by and passed to every function called from actionscript, as well as several script commands
 * Original_Address: $(DOLLAR)1516
 */
__gshared short[maxScripts] entityScriptTempvars;
/** The full stacks for every active script. Each stack frame consists of a counter and a script pointer
 * Original_Address: $(DOLLAR)15A2
 */
__gshared ActionLoopCallState[5][maxScripts] entityScriptStacks;

/** Written to by actionscript commands 0x31 and 0x37, which go unused in Earthbound.
 *
 * Although the commands make use of them, nothing else does. Their functions are only known because of their presence in HyperZone
 * Original_Address: $(DOLLAR)1A02
 */
__gshared short[4] entityBGHorizontalOffsetLow;
/** Written to by actionscript commands 0x32 and 0x38, which go unused in Earthbound.
 *
 * Although the commands make use of them, nothing else does. Their functions are only known because of their presence in HyperZone
 * Original_Address: $(DOLLAR)1A0A
 */
__gshared short[4] entityBGVerticalOffsetLow;
/** Written to by actionscript command 0x31, which goes unused in Earthbound.
 *
 * Although the commands make use of them, nothing else does. Their functions are only known because of their presence in HyperZone
 * Original_Address: $(DOLLAR)1A12
 */
__gshared short[4] entityBGHorizontalOffsetHigh;
/** Written to by actionscript command 0x32, which goes unused in Earthbound.
 *
 * Although the commands make use of them, nothing else does. Their functions are only known because of their presence in HyperZone
 * Original_Address: $(DOLLAR)1A1A
 */
__gshared short[4] entityBGVerticalOffsetHigh;
/** Written to by actionscript commands 0x33, 0x35 and 0x3A, which go unused in Earthbound.
 *
 * Although the commands make use of them, nothing else does. Their functions are only known because of their presence in HyperZone
 * Original_Address: $(DOLLAR)1A22
 */
__gshared short[4] entityBGHorizontalVelocityLow;
/** Written to by actionscript commands 0x34, 0x36 and 0x3A, which go unused in Earthbound.
 *
 * Although the commands make use of them, nothing else does. Their functions are only known because of their presence in HyperZone
 * Original_Address: $(DOLLAR)1A2A
 */
__gshared short[4] entityBGVerticalVelocityLow;
/** Written to by actionscript commands 0x33, 0x35 and 0x3A, which go unused in Earthbound.
 *
 * Although the commands make use of them, nothing else does. Their functions are only known because of their presence in HyperZone
 * Original_Address: $(DOLLAR)1A32
 */
__gshared short[4] entityBGHorizontalVelocityHigh;
/** Written to by actionscript commands 0x34, 0x36 and 0x3A, which go unused in Earthbound.
 *
 * Although the commands make use of them, nothing else does. Their functions are only known because of their presence in HyperZone
 * Original_Address: $(DOLLAR)1A3A
 */
__gshared short[4] entityBGVerticalVelocityHigh;

/** The slot for the active entity. This is an index for most of the entity* arrays
 * Original_Address: $(DOLLAR)1A42
 */
__gshared short currentEntitySlot;
/** The offset for the active entity. This is essentially the same as currentEntitySlot, but multiplied by 2. Not suitable for array indexing
 * Original_Address: $(DOLLAR)1A44
 */
__gshared short currentEntityOffset;
/** The slot for the active script. This is an index for most of the entityScript* arrays
 * Original_Address: $(DOLLAR)1A46
 */
__gshared short currentScriptSlot;
/** The offset for the active script. This is essentially the same as currentScriptSlot, but multiplied by 2. Not suitable for array indexing
 * Original_Address: $(DOLLAR)1A48
 */
__gshared short currentScriptOffset;
/** Left/right movement hitbox heights for active entities. These are used for entity collision detection when the subject is moving straight left or right, not the entities being compared to it
 * Original_Address: $(DOLLAR)1A4A
 */
__gshared short[maxEntities] entityHitboxLeftRightHeight;
/** The current directions that active entities are moving in. Undefined when entity is not moving
 * Original_Address: $(DOLLAR)1A86
 */
__gshared short[maxEntities] entityMovingDirection;
/** The active distortion style for HDMA-animated backgrounds
 * Original_Address: $(DOLLAR)1ACC
 */
__gshared short backgroundDistortionStyle;
/** The active layer being distorted for HDMA-animated backgrounds
 * Original_Address: $(DOLLAR)1ACE
 */
__gshared short backgroundDistortionTargetLayer;
/** A flag set when we are distorting a secondary background. Ensures that the HDMA table generated does not overwrite the first layer's table.
 * Original_Address: $(DOLLAR)1AD2
 */
__gshared short backgroundDistortSecondLayer;
/** The rate at which the compression is increased each frame
 * Original_Address: $(DOLLAR)1AD4
 */
__gshared short backgroundDistortionCompressionRate;
/** A bitmap of used/available BG2 tiles. 0x400 tiles, 1 bit each.
 * Original_Address: $(DOLLAR)1AD6
 */
__gshared ushort[64] usedBG2TileMap;
/** Offsets into the font graphics for each pre-filled character in text entry windows
 * Original_Address: $(DOLLAR)1B56
 */
__gshared ubyte[24] keyboardInputCharacterOffsets;
/** Character widths in pixels for each pre-filled character in text entry windows
 * Original_Address: $(DOLLAR)1B6E
 */
__gshared ubyte[24] keyboardInputCharacterWidths;
/** The original character for each pre-filled character in text entry windows
 * Original_Address: $(DOLLAR)1B86
 */
__gshared ubyte[24] keyboardInputCharacters;
/** Number of display frames until the next frame of the PSI animation
 * Original_Address: $(DOLLAR)1B9E
 */
__gshared ubyte psiAnimationTimeUntilNextFrame;
/** Number of display frames to hold the current frame of the PSI animation being displayed
 * Original_Address: $(DOLLAR)1B9F
 */
__gshared ubyte psiAnimationFrameHoldFrames;
/** Total number of frames (not display frames) in the current displayed PSI animation
 * Original_Address: $(DOLLAR)1BA0
 */
__gshared ubyte psiAnimationTotalFrames;
/** Tile arrangement data for the current displayed PSI animation frame
 * Original_Address: $(DOLLAR)1BA1
 */
__gshared const(ubyte)* psiAnimationFrameData;
/** The lower range of palette colours affected by the currently displayed PSI animation's palette animation
 * Original_Address: $(DOLLAR)1BA5
 */
__gshared ubyte psiAnimationPaletteAnimationLowerRange;
/** The upper range of palette colours affected by the currently displayed PSI animation's palette animation
 * Original_Address: $(DOLLAR)1BA6
 */
__gshared ubyte psiAnimationPaletteAnimationUpperRange;
/** Current offset for the PSI animation's palette animation
 * Original_Address: $(DOLLAR)1BA7
 */
__gshared ubyte psiAnimationCurrentPaletteOffset;
/** Number of display frames until the next PSI animation palette change
 * Original_Address: $(DOLLAR)1BA8
 */
__gshared ubyte psiAnimationPaletteFrames;
/** Number of display frames left until next palette change for the currently displayed PSI animation
 * Original_Address: $(DOLLAR)1BA9
 */
__gshared ubyte psiAnimationPaletteTimeUntilNextFrame;
/** Full palette for the currently displayed PSI animation, including colours that will be shifted in
 * Original_Address: $(DOLLAR)1BAA
 */
__gshared ushort[16] psiAnimationFullLoadedPalette;
/** The currently-displayed palette for the PSI animation onscreen
 * Original_Address: $(DOLLAR)1BCA
 */
__gshared ushort* psiAnimationPalette;
/** Frames left until targetted enemies start changing colour
 * Original_Address: $(DOLLAR)1BCC
 */
__gshared short psiAnimationEnemyColourChangeStartFramesLeft;
/** Frames left until targetted enemies colour change ends
 * Original_Address: $(DOLLAR)1BCE
 */
__gshared short psiAnimationEnemyColourChangeFramesLeft;
/** Red component of the enemy colour change for the currently displayed PSI animation
 * Original_Address: $(DOLLAR)1BD0
 */
__gshared short psiAnimationEnemyColourChangeRed;
/** Green component of the enemy colour change for the currently displayed PSI animation
 * Original_Address: $(DOLLAR)1BD2
 */
__gshared short psiAnimationEnemyColourChangeGreen;
/** Blue component of the enemy colour change for the currently displayed PSI animation
 * Original_Address: $(DOLLAR)1BD4
 */
__gshared short psiAnimationEnemyColourChangeBlue;

/** The heaps, where dynamically-allocated memory comes from. There are two heaps, which are swapped each frame
 * Original_Address: $(DOLLAR)2000
 */
__gshared ubyte[0x200][2] heap;

/** The drawing priority for the current sprite being queued
 * Original_Address: $(DOLLAR)2400
 */
__gshared ushort currentSpriteDrawingPriority;
/** Unknown. Initialized to -1, checked for 0-3 values. May have been a removed debugging function
 * Original_Address: $(DOLLAR)2402
 */
__gshared short unknown7E2402;
/** Priority 0 (first) spritemaps queued for drawing this frame
 * Original_Address: $(DOLLAR)2404
 */
__gshared const(SpriteMap)*[32] priority0SpriteMaps;
/** The X coordinate for the associated priority 0 sprite being drawn this frame
 * Original_Address: $(DOLLAR)2444
 */
__gshared short[32] priority0SpriteX;
/** The Y coordinate for the associated priority 0 sprite being drawn this frame
 * Original_Address: $(DOLLAR)2484
 */
__gshared short[32] priority0SpriteY;
/** The bank portion of the associated priority 0 spritemap
 * Original_Address: $(DOLLAR)24C4
 */
__gshared ushort[32] priority0SpriteMapBanks;
/** Offset of the last priority 0 sprite being drawn this frame
 * Original_Address: $(DOLLAR)2504
 */
__gshared short priority0SpriteOffset;
/** Priority 1 (second) spritemaps queued for drawing this frame
 * Original_Address: $(DOLLAR)2506
 */
__gshared const(SpriteMap)*[32] priority1SpriteMaps;
/** The X coordinate for the associated priority 1 sprite being drawn this frame
 * Original_Address: $(DOLLAR)2546
 */
__gshared short[32] priority1SpriteX;
/** The Y coordinate for the associated priority 1 sprite being drawn this frame
 * Original_Address: $(DOLLAR)2586
 */
__gshared short[32] priority1SpriteY;
/** The bank portion of the associated priority 1 spritemap
 * Original_Address: $(DOLLAR)25C6
 */
__gshared ushort[32] priority1SpriteMapBanks;
/** Offset of the last priority 1 sprite being drawn this frame
 * Original_Address: $(DOLLAR)2606
 */
__gshared short priority1SpriteOffset;
/** Priority 2 (second-last) spritemaps queued for drawing this frame
 * Original_Address: $(DOLLAR)2608
 */
__gshared const(SpriteMap)*[32] priority2SpriteMaps;
/** The X coordinate for the associated priority 2 sprite being drawn this frame
 * Original_Address: $(DOLLAR)2648
 */
__gshared short[32] priority2SpriteX;
/** The Y coordinate for the associated priority 2 sprite being drawn this frame
 * Original_Address: $(DOLLAR)2688
 */
__gshared short[32] priority2SpriteY;
/** The bank portion of the associated priority 2 spritemap
 * Original_Address: $(DOLLAR)26C8
 */
__gshared ushort[32] priority2SpriteMapBanks;
/** Offset of the last priority 2 sprite being drawn this frame
 * Original_Address: $(DOLLAR)2708
 */
__gshared short priority2SpriteOffset;
/** Priority 3 (last) spritemaps queued for drawing this frame
 * Original_Address: $(DOLLAR)270A
 */
__gshared const(SpriteMap)*[32] priority3SpriteMaps;
/** The X coordinate for the associated priority 3 sprite being drawn this frame
 * Original_Address: $(DOLLAR)274A
 */
__gshared short[32] priority3SpriteX;
/** The Y coordinate for the associated priority 3 sprite being drawn this frame
 * Original_Address: $(DOLLAR)278A
 */
__gshared short[32] priority3SpriteY;
/** The bank portion of the associated priority 3 spritemap
 * Original_Address: $(DOLLAR)27CA
 */
__gshared ushort[32] priority3SpriteMapBanks;
/** Offset of the last priority 3 sprite being drawn this frame
 * Original_Address: $(DOLLAR)280A
 */
__gshared short priority3SpriteOffset;
/** Order in which active entities will be drawn
 * Original_Address: $(DOLLAR)280C
 */
__gshared short[maxEntities] entityDrawSorting;
/** X coordinate that the active entity is attempting to move to this frame
 * Original_Address: $(DOLLAR)2848
 */
__gshared short entityMovementProspectX;
/** Y coordinate that the active entity is attempting to move to this frame
 * Original_Address: $(DOLLAR)284A
 */
__gshared short entityMovementProspectY;
/** Backup of active entity callback flags. Used by fades in actionscripts
 * Original_Address: $(DOLLAR)284C
 */
__gshared ushort[maxEntities] entityCallbackFlagsBackup;
/** The X coordinate of the cached map block
 * Original_Address: $(DOLLAR)2888
 */
__gshared short cachedMapBlockX;
/** The Y coordinate of the cached map block
 * Original_Address: $(DOLLAR)288A
 */
__gshared short cachedMapBlockY;
/** The cached map block returned on repeated calls to loadMapBlock() with the same parameters
 * Original_Address: $(DOLLAR)288C
 */
__gshared short cachedMapBlock;
/** The first free bit in the usedBG2TileMap array, only used by unknownC40085
 * Original_Address: $(DOLLAR)288E
 */
__gshared short usedBG2TileMapFirstFreeBit;
/** Whether or not the player has moved at all since using a door or teleporting. Non-zero if the player has moved, zero otherwise
 * Original_Address: $(DOLLAR)2890
 */
__gshared short playerHasMovedSinceMapLoad;
/** Signals to the sprite queuing system that the sprite adjacent to the one requested should be used
 * Original_Address: $(DOLLAR)2892
 */
__gshared short useSecondSpriteFrame;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)2894
 */
__gshared short unknown7E2894;
/** The ID of the active entity being rendered
 * Original_Address: $(DOLLAR)2896
 */
__gshared short spriteUpdateEntityOffset;
/** An entity slot to be ignored when trying to play footstep sounds
 * Original_Address: $(DOLLAR)2898
 */
__gshared short footstepSoundIgnoreEntity;
/** An index into the footstepSoundTable for the sound to play when moving around the map. Usually based on sector properties or gameState.specialGameState
 * Original_Address: $(DOLLAR)289A
 */
__gshared short footstepSoundID;
/** Does the same thing as footstepSoundID, but is prioritized when set to anything but zero
 * Original_Address: $(DOLLAR)289C
 */
__gshared short footstepSoundIDOverride;
/** The IDs of entities that have collided with active entities. May be 0x8000 to disable entity collision, or 0xFFFF if no collisions have been detected
 * Original_Address: $(DOLLAR)289E
 */
__gshared ushort[maxEntities] entityCollidedObjects;
/** The surface flags of whatever tiles active entities are standing on
 * Original_Address: $(DOLLAR)28DA
 */
__gshared ushort[maxEntities] entityObstacleFlags;
/** The sizes of the spritemaps used by active entities in bytes
 * Original_Address: $(DOLLAR)2916
 */
__gshared ushort[maxEntities] entitySpriteMapSizes;
/** Indices into overworldSpriteVRAMOffsets for active entities's first spritemaps. Is written to, but never used
 * Original_Address: $(DOLLAR)2952
 */
__gshared ushort[maxEntities] entitySpriteMapBeginningIndices;
/** The VRAM addresses corresponding to active entities's spritemaps. Uses word addressing
 * Original_Address: $(DOLLAR)298E
 */
__gshared ushort[maxEntities] entityVramAddresses;
/** Pointers to the sprite tiles used by active entities
 * Original_Address: $(DOLLAR)29CA, $(DOLLAR)2A06
 */
__gshared OverworldSpriteGraphics*[maxEntities] entityGraphicsPointers;
//__gshared short[maxEntities] UNKNOWN_30X2_TABLE_31; /// Original_Address: $(DOLLAR)2A42
/** The byte sizes of a row of sprite tiles for active entities. Sprites are uploaded to VRAM one row of tiles at a time
 * Original_Address: $(DOLLAR)2A7E
 */
__gshared short[maxEntities] entityByteWidths;
/** The heights of the sprites of active entities in terms of 8x8 tiles
 * Original_Address: $(DOLLAR)2ABA
 */
__gshared short[maxEntities] entityTileHeights;
/** The directions in which active entities are facing
 * Original_Address: $(DOLLAR)2AF6
 */
__gshared short[maxEntities] entityDirections;
/** The normal velocity of active entities. Used by certain actionscript functions to move entities around
 * Original_Address: $(DOLLAR)2B32
 */
__gshared short[maxEntities] entityMovementSpeed;
/** The physical size of active entities. Affects hitboxes, sprite attachments, etc
 * Original_Address: $(DOLLAR)2B6E
 */
__gshared short[maxEntities] entitySizes;
/** The surface flags of whatever area the active entities are standing on
 * Original_Address: $(DOLLAR)2BAA
 */
__gshared ushort[maxEntities] entitySurfaceFlags;
/** The numbers of spritemap pairs in the upper and lower halves of the active entities's bodies. Upper 8 bits are the upper body count, lower 8 bits are the lower body count
 * Original_Address: $(DOLLAR)2BE6
 */
__gshared ushort[maxEntities] entityUpperLowerBodyDivide;
/** The walking styles for active entities. Usually 0, unless it's a party member entity
 * Original_Address: $(DOLLAR)2C22
 */
__gshared ushort[maxEntities] entityWalkingStyles;
//TODO: document meanings of values
/** Pathfinding movement state for active entities. Valid values are -1, 0, 1
 * Original_Address: $(DOLLAR)2C5E
 */
__gshared short[maxEntities] entityPathfindingState;
/** NPC config table indices for active entities, or 0xFFFF if none
 * Original_Address: $(DOLLAR)2C9A
 */
__gshared ushort[maxEntities] entityNPCIDs;
/** Sprite IDs for active entities, or -1 if none
 * Original_Address: $(DOLLAR)2CD6
 */
__gshared short[maxEntities] entitySpriteIDs;
/** Enemy IDs for active entities, or -1 if none
 * Original_Address: $(DOLLAR)2D12
 */
__gshared short[maxEntities] entityEnemyIDs;
/** The tile offset on which randomly spawned enemy entities were spawned
 * Original_Address: $(DOLLAR)2D4E
 */
__gshared ushort[maxEntities] entityEnemySpawnTiles;
/** Unknown. Initialized to zero on entity creation and never read or written otherwise
 * Original_Address: $(DOLLAR)2D8A
 */
__gshared ushort[maxEntities] entityUnknown2D8A;
/** Unclear. Only used for actionscript 27 and 597. Every active entity has a value of either 0 or 0xFFFF. Affects movement angle with C0CD50 movement
 * Original_Address: $(DOLLAR)2DC6
 */
__gshared ushort[maxEntities] entityUnknown2DC6;
/** Pathfinding paths for active entities. Values undefined for entities not actively involved in pathfinding
 * Original_Address: $(DOLLAR)2E02
 */
__gshared VecYX*[maxEntities] entityPathPoints;
/** Number of points in created pathfinder paths for active entities. Values undefined for entities not actively involved in pathfinding
 * Original_Address: $(DOLLAR)2E3E
 */
__gshared ushort[maxEntities] entityPathPointsCount;
/** Sprite overlays active for each entity
 * See_Also: earthbound.commondefs.EntityOverlayFlags for possible values
 * Original_Address: $(DOLLAR)2E7A
 */
__gshared ushort[maxEntities] entityOverlayFlags;
/** Overlay script pointer for mushroomization overlays for active entities
 * Original_Address: $(DOLLAR)2EB6
 */
__gshared const(OverlayScript)*[maxEntities] entityMushroomizedOverlayPtrs;
/** Frames until the next mushroomization overlay script command runs for each active entity
 * Original_Address: $(DOLLAR)2EF2
 */
__gshared ushort[maxEntities] entityMushroomizedNextUpdateFrames;
/** Current mushroomization spritemap being overlayed on active entities
 * Original_Address: $(DOLLAR)2F2E
 */
__gshared const(SpriteMap)*[maxEntities] entityMushroomizedSpritemaps;
/** Overlay script pointer for sweating overlays for active entities
 * Original_Address: $(DOLLAR)2F6A
 */
__gshared const(OverlayScript)*[maxEntities] entitySweatingOverlayPtrs;
/** Frames until the next sweating overlay script command runs for each active entity
 * Original_Address: $(DOLLAR)2FA6
 */
__gshared ushort[maxEntities] entitySweatingNextUpdateFrames;
/** Current sweating spritemap being overlayed on active entities
 * Original_Address: $(DOLLAR)2FE2
 */
__gshared const(SpriteMap)*[maxEntities] entitySweatingSpritemaps;
/** Overlay script pointer for ripple overlays for active entities
 * Original_Address: $(DOLLAR)301E
 */
__gshared const(OverlayScript)*[maxEntities] entityRippleOverlayPtrs;
/** Frames until the next ripple overlay script command runs for each active entity
 * Original_Address: $(DOLLAR)305A
 */
__gshared ushort[maxEntities] entityRippleNextUpdateFrames;
/** Current ripple spritemap being overlayed on active entities
 * Original_Address: $(DOLLAR)3096
 */
__gshared const(SpriteMap)*[maxEntities] entityRippleSpritemaps;
/** Overlay script pointer for big ripple overlays for active entities
 * Original_Address: $(DOLLAR)30D2
 */
__gshared const(OverlayScript)*[maxEntities] entityBigRippleOverlayPtrs;
/** Frames until the next big ripple overlay script command runs for each active entity
 * Original_Address: $(DOLLAR)310E
 */
__gshared ushort[maxEntities] entityBigRippleNextUpdateFrames;
/** Current big ripple spritemap being overlayed on active entities
 * Original_Address: $(DOLLAR)314A
 */
__gshared const(SpriteMap)*[maxEntities] entityBigRippleSpritemaps;
/** Random numbers generated to determine if enemies are 'weak'. Entries are only valid for entities that are randomly spawned enemies
*
* If >= 192, will be considered weak if total party level is 8x the enemy level.
* If >= 128, will be considered weak if total party level is 6x the enemy level.
* Otherwise, it will only be considered weak if total party level is 10x the enemy level.
* Original_Address: $(DOLLAR)3186
*/
__gshared short[maxEntities] entityWeakEnemyValue;

/** Whether or not hitboxes are enabled for active entities.
 *
 * It seems as if this once had some other meaning, but it's gone now.
 * Original_Address: $(DOLLAR)332A
 */
__gshared short[maxEntities] entityHitboxEnabled;
/** Up/down movement hitbox heights for active entities.
 * These are used for entity collision detection when the subject is moving up or down at all, not the entities being compared to it
 * Original_Address: $(DOLLAR)3366
 */
__gshared short[maxEntities] entityHitboxUpDownWidth;
/** Up/down movement hitbox widths for active entities.
 * These are used for entity collision detection when the subject is moving up or down at all, not the entities being compared to it
 * Original_Address: $(DOLLAR)33A2
 */
__gshared short[maxEntities] entityHitboxUpDownHeight;
/** Left/right movement hitbox widths for active entities.
 * These are used for entity collision detection when the subject is moving straight left or right, not the entities being compared to it
 * Original_Address: $(DOLLAR)33DE
 */
__gshared short[maxEntities] entityHitboxLeftRightWidth;
/** The currently-displayed sprite graphics for active entities
 * Original_Address: $(DOLLAR)331A
 */
__gshared const(OverworldSpriteGraphics)*[maxEntities] entityCurrentDisplayedSprites;
/** Active entity animation fingerprints. Effectively just a combination of walking style and direction. Used to determine when an entity sprite needs updating
 * Original_Address: $(DOLLAR)3356
 */
__gshared short[maxEntities] entityAnimationFingerprints;
/** Buffer for rendered text tiles
 * Original_Address: $(DOLLAR)3492
 */
__gshared ubyte[32][52] vwfBuffer;


/** Unknown. May have served a purpose in Mother 2, but is vestigial in Earthbound. Only set to 0
 * Original_Address: $(DOLLAR)3C14
 */
__gshared short unknown7E3C14;
/** Unsure. Related to scrolling for flyovers.
 * Original_Address: $(DOLLAR)3C16
 */
__gshared short unknown7E3C16;
/** Unknown. Set to 0x1A and only read in C41DB6, which is vestigial
 * Original_Address: $(DOLLAR)3C18
 */
__gshared short unknown7E3C18;
/** Unknown. Not used
 * Original_Address: $(DOLLAR)3C1A
 */
__gshared short unknown7E3C1A;
/** Unknown. Always zero
 * Original_Address: $(DOLLAR)3C1C
 */
__gshared short unknown7E3C1C;
/** Unknown. Set to -1 and only read in C41EE9, which is vestigial
 * Original_Address: $(DOLLAR)3C1E
 */
__gshared short unknown7E3C1E;
/** Unknown. Set to 0 and only read in C41EF4, which is vestigial
 * Original_Address: $(DOLLAR)3C20
 */
__gshared short unknown7E3C20;
/** Unknown. Technically used, but is only added to an otherwise vestigial variable
 * Original_Address: $(DOLLAR)3C22
 */
__gshared short unknown7E3C22;
/**  Velocity (in pixels/frame) at which the background scrolls horizontally during a screen transition
 * Original_Address: $(DOLLAR)3C24
 */
__gshared short transitionBackgroundXVelocity;
/** Unknown. Technically used, but is only added to an otherwise vestigial variable
 * Original_Address: $(DOLLAR)3C26
 */
__gshared short unknown7E3C26;
/** Velocity (in pixels/frame) at which the background scrolls vertically during a screen transition
 * Original_Address: $(DOLLAR)3C28
 */
__gshared short transitionBackgroundYVelocity;
/** Unknown. Set to zero, increases at the rate of unknown7E3C22, but never read
 * Original_Address: $(DOLLAR)3C2A
 */
__gshared short unknown7E3C2A;
/** X coordinate of the background during a screen transition
 * Original_Address: $(DOLLAR)3C2C
 */
__gshared short transitionBackgroundX;
/** Unknown. Technically used, but is only added to an otherwise vestigial variable
 * Original_Address: $(DOLLAR)3C2E
 */
__gshared short unknown7E3C2E;
/** Y coordinate of the background during a screen transition
 * Original_Address: $(DOLLAR)3C30
 */
__gshared short transitionBackgroundY;
/** HDMA table generated for animated background layer 1
 * Original_Address: $(DOLLAR)3C32
 */
__gshared ubyte[HDMAIndirectTableEntry.sizeof * 2 + 1] animatedBackgroundLayer1HDMATable;

/** HDMA table generated for animated background layer 2
 * Original_Address: $(DOLLAR)3C3C
 */
__gshared ubyte[HDMAIndirectTableEntry.sizeof * 2 + 1] animatedBackgroundLayer2HDMATable;

/** Buffer for animated background HDMA table data
 * Original_Address: $(DOLLAR)3C46
 */
__gshared ushort[448] backgroundHDMABuffer;
/** HDMA table generated for attract mode screen effects
 * Original_Address: $(DOLLAR)3FC6
 */
__gshared HDMAIndirectTableEntry[3] attractModeWindowHDMATable;

/** HDMA data for attract mode screen effects. Large enough to hold data for 231 lines of HDMA data, just enough to cover overscan
 * Original_Address: $(DOLLAR)3FD0
 */
__gshared ubyte[924] attractModeWindowHDMAData;

/** Enables some debugging features when non-zero
 * Original_Address: $(DOLLAR)436C
 */
__gshared short debugging;
/** The currently loaded map tileset/palette combo
 * Original_Address: $(DOLLAR)436E
 */
__gshared short loadedMapTileCombo;
/** The currently loaded map palette
 * Original_Address: $(DOLLAR)4370
 */
__gshared short loadedMapPalette;
/** The currently loaded map tileset
 * Original_Address: $(DOLLAR)4372
 */
__gshared short loadedMapTileset;
/** The X coordinate of the top left corner of the screen
 * Original_Address: $(DOLLAR)4374
 */
__gshared short screenLeftX;
/** The Y coordinate of the top left corner of the screen
 * Original_Address: $(DOLLAR)4376
 */
__gshared short screenTopY;

/** Duplicate of screenXPixels. Only read by some vestigial code
 * Original_Address: $(DOLLAR)437C
 */
__gshared short screenXPixelsCopy;
/** Duplicate of screenYPixels. Only read by some vestigial code
 * Original_Address: $(DOLLAR)437E
 */
__gshared short screenYPixelsCopy;

/** X coordinate of the centre of the screen's current position on the overworld
 * Original_Address: $(DOLLAR)4380
 */
__gshared short screenXPixels;
/** Y coordinate of the centre of the screen's current position on the overworld
 * Original_Address: $(DOLLAR)4382
 */
__gshared short screenYPixels;

/** A copy of either bg1PositionX or bg2PositionX. Written but not read
 * Original_Address: $(DOLLAR)4386
 */
__gshared short bg12PositionXCopy;
/** A copy of either bg1PositionY or bg2PositionY. Written but not read
 * Original_Address: $(DOLLAR)4388
 */
__gshared short bg12PositionYCopy;

/** Current teleport destination X coordinate, or 0 if not teleporting
 * Original_Address: $(DOLLAR)438A
 */
__gshared short currentTeleportDestinationX;
/** Current teleport destination Y coordinate, or 0 if not teleporting
 * Original_Address: $(DOLLAR)438C
 */
__gshared short currentTeleportDestinationY;
/** Sector attributes for the currently loaded sector
 * Original_Address: $(DOLLAR)438E
 */
__gshared short currentSectorAttributes;
/** X coordinates for rows that have been loaded? This is only written to, never read
 * Original_Address: $(DOLLAR)4390
 */
__gshared byte[16] loadedRowsX;
/** Y coordinates for rows that have been loaded? This is only written to, never read
 * Original_Address: $(DOLLAR)43A0
 */
__gshared byte[16] loadedRowsY;
/** X coordinates for columns that have been loaded? This is only written to, never read
 * Original_Address: $(DOLLAR)43B0
 */
__gshared byte[16] loadedColumnsX;
/** Y coordinates for columns that have been loaded? This is only written to, never read
 * Original_Address: $(DOLLAR)43C0
 */
__gshared byte[16] loadedColumnsY;
/** Average red component of the currently loaded map palette. Used for calculating sprite lighting
 * Original_Address: $(DOLLAR)43D0
 */
__gshared ushort colourAverageRed;
/** Average green component of the currently loaded map palette. Used for calculating sprite lighting
 * Original_Address: $(DOLLAR)43D2
 */
__gshared ushort colourAverageGreen;
/** Average blue component of the currently loaded map palette. Used for calculating sprite lighting
 * Original_Address: $(DOLLAR)43D4
 */
__gshared ushort colourAverageBlue;
/** Average red component of the last loaded map palette. Used for calculating sprite lighting
 * Original_Address: $(DOLLAR)43D6
 */
__gshared ushort savedColourAverageRed;
/** Average green component of the last loaded map palette. Used for calculating sprite lighting
 * Original_Address: $(DOLLAR)43D8
 */
__gshared ushort savedColourAverageGreen;
/** Average blue component of the last loaded map palette. Used for calculating sprite lighting
 * Original_Address: $(DOLLAR)43DA
 */
__gshared ushort savedColourAverageBlue;
/** Loaded tileset animations. Each one updates a portion of the loaded tileset graphics at a configurable interval
 * Original_Address: $(DOLLAR)43DC
 */
__gshared LoadedAnimatedTiles[8] overworldTilesetAnim;
/** Loaded tileset animation configuration
 * Original_Address: $(DOLLAR)445C
 */
__gshared LoadedOverworldPaletteAnimation overworldPaletteAnim;
/** The number of currently-loaded animated tiles
 * Original_Address: $(DOLLAR)4472
 */
__gshared short loadedAnimatedTileCount;
/** Set to 1 when an animated map palette has been loaded
 * Original_Address: $(DOLLAR)4474
 */
__gshared short mapPaletteAnimationLoaded;
/** A backup of palette memory, used for temporary palette effects
 * Original_Address: $(DOLLAR)4476
 */
__gshared ushort[16][16] mapPaletteBackup;
/** When set, all colours in all palettes will be set to white when a map load completes
 * Original_Address: $(DOLLAR)4676
 */
__gshared short wipePalettesOnMapLoad;

/** Sprite width in tiles of the entity being created
 * Original_Address: $(DOLLAR)467A
 */
__gshared short newSpriteTileWidth;
/** Sprite height in tiles of the entity being created
 * Original_Address: $(DOLLAR)467C
 */
__gshared short newSpriteTileHeight;
/** Allocated spritemaps for overworld entities. Spritemaps must be adjacent to each other. Make sure all spritemaps allocated are deallocated!
 * The game will only clear this during attract mode, file select and loading a new file!
 * Original_Address: $(DOLLAR)467E
 */
__gshared SpriteMap[179] overworldSpriteMaps;
/** Keeps track of allocations in overworldSpriteMaps. Entries are 0 if unallocated, 0x80 | x otherwise.
 * Index corresponds with overworldSpriteOAMTileNumbers and overworldSpriteVRAMOffsets
 * Original_Address: $(DOLLAR)4A00
 */
__gshared ubyte[88] spriteVramTable;
/** Controls when NPCs are spawned
 * See_Also: earthbound.commondefs.SpawnControl
 * Original_Address: $(DOLLAR)4A58
 */
__gshared short npcSpawnsEnabled;
/** Controls when enemies are spawned. Note that enemies will ONLY spawn offscreen, so offscreenOnly and allEnabled behave identically
 * See_Also: earthbound.commondefs.SpawnControl
 * Original_Address: $(DOLLAR)4A5A
 */
__gshared short enemySpawnsEnabled;
/** Number of randomly spawned enemy entities currently active
 * Original_Address: $(DOLLAR)4A5C
 */
__gshared short overworldEnemyCount;
/** Maximum number of enemy entities allowed to be active. Always set to 10
 * Original_Address: $(DOLLAR)4A5E
 */
__gshared short overworldEnemyMaximum;
/** Set to 1 if a magic butterfly is onscreen. Disables further magic butterfly spawning
 * Original_Address: $(DOLLAR)4A60
 */
__gshared short magicButterfly;
/** The horizontal range in which enemies can spawn. Usually set just before spawning a set of enemies
 * Original_Address: $(DOLLAR)4A62
 */
__gshared short enemySpawnRangeWidth;
/** The vertical range in which enemies can spawn. Usually set just before spawning a set of enemies
 * Original_Address: $(DOLLAR)4A64
 */
__gshared short enemySpawnRangeHeight;
/** Blocks NPCs from spawning, unless they are type 3 or are part of a photograph
 * Original_Address: $(DOLLAR)4A66
 */
__gshared short showNPCFlag;
/** The number of times enemy spawning has failed due to too many onscreen enemies. Only used for debugging
 * Original_Address: $(DOLLAR)4A68
 */
__gshared short enemySpawnTooManyEnemiesFailureCount;
/** Unknown. Seems to be set to the number of free spritemaps last searched for, but not used. Probably for debugging
 * Original_Address: $(DOLLAR)4A6A
 */
__gshared short unknown7E4A6A;
/** Set to the ID of the last enemy group attempting to spawn. Never read, possibly used by an obsolete debugging feature
 * Original_Address: $(DOLLAR)4A6C
 */
__gshared short enemySpawnEncounterID;
/** Number of enemies left to spawn in the enemy group. Outside of spawnEnemiesFromGroup, should always be zero
 * Original_Address: $(DOLLAR)4A6E
 */
__gshared short enemySpawnRemainingEnemyCount;
/** The selected spawn chance of the enemy group currently attempting to spawn. Normal range is 0-100(%)
 * Original_Address: $(DOLLAR)4A70
 */
__gshared short enemySpawnChance;
/** Similar to enemySpawnEncounterID, but only set if spawn roll is successful
 * Original_Address: $(DOLLAR)4A72
 */
__gshared short spawningEnemyGroup;
/** Sprite ID of the most recent enemy attempting to spawn. Set but not read
 * Original_Address: $(DOLLAR)4A74
 */
__gshared short spawningEnemySprite;
/** Name of the most recent enemy attempting to spawn. Set but not read
 * Original_Address: $(DOLLAR)4A76
 */
__gshared const(ubyte)* spawningEnemyName;
/** Number of enemy spawn attempts made so far. Magic butterfly spawning happens every 16 attempts
 * Original_Address: $(DOLLAR)4A7A
 */
__gshared short enemySpawnCounter;
/** Enemy IDs involved in the active enemy pathfinding attempt
 * Original_Address: $(DOLLAR)4A7C
 */
__gshared short[4] pathfindingEnemyIDs;
/** Amounts of each enemy involved in the active enemy pathfinding attempt
 * Original_Address: $(DOLLAR)4A84
 */
__gshared short[4] pathfindingEnemyCounts;
/** The enemy group ID about to be faced in battle
 * Original_Address: $(DOLLAR)4A8C
 */
__gshared short currentBattleGroup;
/** X coordinate to pathfind towards
 * Original_Address: $(DOLLAR)4A8E
 */
__gshared short pathfindingTargetCenterX;
/** Y coordinate to pathfind towards
 * Original_Address: $(DOLLAR)4A90
 */
__gshared short pathfindingTargetCenterY;
/** The width of the target being pathfinded towards
 * Original_Address: $(DOLLAR)4A92
 */
__gshared short pathfindingTargetWidth;
/** The height of the target being pathfinded towards
 * Original_Address: $(DOLLAR)4A94
 */
__gshared short pathfindingTargetHeight;
/** The entry or exit path generated for delivery NPCs. Does not appear to be read at any point
 * Original_Address: $(DOLLAR)4A96
 */
__gshared VecYX[20][10] deliveryPaths;
/** The ID of the enemy entity that is in contact with the party, starting a battle
 * Original_Address: $(DOLLAR)4D86
 */
__gshared short touchedEnemy;
/** The entity that touched an enemy (or the party member in front if the special leader entity was touched)
 * Original_Address: $(DOLLAR)4DB8
 */
__gshared short enemyPathfindingTargetEntity;
/** Set to 1 if enemy has just been touched and a swirl hasn't started up yet, 0 otherwise
 * Original_Address: $(DOLLAR)4DBA
 */
__gshared short enemyHasBeenTouched;
/** Who gets the surprise round in the battle that's about to start
 * Original_Address: $(DOLLAR)4DBC
 */
__gshared short battleInitiative;
/** X coordinate backup used for transferring coordinates between entities, the magic butterfly in particular
 * Original_Address: $(DOLLAR)4DBE
 */
__gshared short actionScriptBackupX;
/** Y coordinate backup used for transferring coordinates between entities, the magic butterfly in particular
 * Original_Address: $(DOLLAR)4DC0
 */
__gshared short actionScriptBackupY;
/** The active battle mode. Note that if a battle starts while set to BattleMode.noBattle, then a debugging battle begins
 * See_Also: earthbound.commondefs.BattleMode
 * Original_Address: $(DOLLAR)4DC2
 */
__gshared short battleMode;
/** Set to 0 if a party member died on the overworld this frame
 * Original_Address: $(DOLLAR)4DC4
 */
__gshared short partyMembersAliveOverworld;
/** Set to the party member currently active (in movement, party health checks, etc)
 * Original_Address: $(DOLLAR)4DC6
 */
__gshared PartyCharacter* currentPartyMemberTick;
/** Pointers to the four party members
 * Original_Address: $(DOLLAR)4DC8
 */
__gshared PartyCharacter*[6] chosenFourPtrs;
/** Unknown. Set to 1 if the party leader has moved this frame, 0 otherwise. Never read
 * Original_Address: $(DOLLAR)4DD4
 */
__gshared short unknown7E4DD4;
/** Horizontal movement speeds for every walking style
 * Original_Address: $(DOLLAR)4DD6
 */
__gshared MovementSpeeds[14] horizontalMovementSpeeds;
/** Vertical movement speeds for every walking style
 * Original_Address: $(DOLLAR)4F96
 */
__gshared MovementSpeeds[14] verticalMovementSpeeds;

/** A ring buffer that records position and direction as the player moves around
 * Original_Address: $(DOLLAR)5156
 */
__gshared PlayerPositionBufferEntry[256] playerPositionBuffer;
//normally this occupies the same position as the player position buffer, but we're not so constrained
/** DMA queue used for the credits to transfer the tile arrangement to VRAM
 * Original_Address: $(DOLLAR)5156
 */
__gshared CreditsDMAQueueEntry[128] creditsDMAQueue;
/** Movement flags for the player characters. Can disable collision and changing direction
 * See_Also: earthbound.commondefs.PlayerMovementFlags
 * Original_Address: $(DOLLAR)5D56
 */
__gshared short playerMovementFlags;
/** The number of frames of intangibility remaining for the player, during which battles will not start
 * Original_Address: $(DOLLAR)5D58
 */
__gshared short playerIntangibilityFrames;
/** Number of frames of input required before the bicycle can turn. Only used if currently moving diagonally
 * Original_Address: $(DOLLAR)5D5A
 */
__gshared short bicycleDiagonalTurnCounter;
/** The X coordinate of the last sector. Used for determining when music needs to change
 * Original_Address: $(DOLLAR)5D5C
 */
__gshared short lastSectorX;
/** The Y coordinate of the last sector. Used for determining when music needs to change
 * Original_Address: $(DOLLAR)5D5E
 */
__gshared short lastSectorY;
/** Number of frames left until a battle starts. Will be 0 if in battle or no battle is starting
 * Original_Address: $(DOLLAR)5D60
 */
__gshared short battleSwirlCountdown;
/** The NPC ID of whatever's currently being interacted with, -1 if no valid NPCs found, or -2 if interacting with map objects
 * Original_Address: $(DOLLAR)5D62
 */
__gshared short interactingNPCID;
/** The NPC entity ID of whatever's currently being interacted with. -1 if no valid NPCs found
 * Original_Address: $(DOLLAR)5D64
 */
__gshared short interactingNPCEntity;
/** Number of frames left until periodic status damage is inflicted on a party member
 * Original_Address: $(DOLLAR)5D66
 */
__gshared short[6] overworldDamageCountdownFrames;
/** Background colour backup. Full-screen colour flash effects only need to set palette 0's transparent colour and turn off all backgrounds, so palette 0's transparent colour is saved here when needed
 * Original_Address: $(DOLLAR)5D72
 */
__gshared short backgroundColourBackup;
/** When set, ignore all input from the player for that number of frames
 * Original_Address: $(DOLLAR)5D74
 */
__gshared short inputDisableFrameCounter;
/** A copy of the direction currently faced by the party leader
 * Original_Address: $(DOLLAR)5D76
 */
__gshared short currentLeaderDirection;
/** A copy of the current leading party member entity offset
 * Original_Address: $(DOLLAR)5D78
 */
__gshared short currentLeadingPartyMemberEntity;
/** A backup of the current camera mode, made when switching to camera mode 3 and restored when switching back
 * Original_Address: $(DOLLAR)5D7A
 */
__gshared short cameraModeBackup;
/** Number of frames left until camera mode 3 ends
 * Original_Address: $(DOLLAR)5D7C
 */
__gshared short cameraMode3FramesLeft;
/** Unknown. Set to 1 for a short period while initial loading of party character data occurs. Never read
 * Original_Address: $(DOLLAR)5D7E
 */
__gshared short unknown7E5D7E;
/** Whether or not the HP alert has been shown for each party member recently
 * Original_Address: $(DOLLAR)5D8C
 */
__gshared short[6] hpAlertShown;
/** Disables party health checks, sunstroke infliction and deliveries when non-zero. Will be cleared upon entering a battle or by text including [1F 41 05]
 * Original_Address: $(DOLLAR)5D98
 */
__gshared short overworldStatusSuppression;
/** Flag set whenever an interaction is queued up (such as text or a door), prevents most game input from being processed
 * Original_Address: $(DOLLAR)5D9A
 */
__gshared short pendingInteractions;
/** Time left until next mushroomization direction swap in frames
 * Original_Address: $(DOLLAR)5D9C
 */
__gshared ushort mushroomizationTimer;
/** Which set of rotated directions to use. Valid values are 0 (rotate 90 degrees clockwise), 1 (rotate 180 degrees) and 2 (rotate 90 degrees counterclockwise)
 * Original_Address: $(DOLLAR)5D9E
 */
__gshared ushort mushroomizationModifier;
/** Whether or not to use mushroomized movement logic
 * Original_Address: $(DOLLAR)5DA0
 */
__gshared ushort mushroomizedWalkingFlag;
/** Unknown. Never read, but holds a copy of the direction moved by the party this frame, if any
 * Original_Address: $(DOLLAR)5DA2
 */
__gshared ushort unknown7E5DA2;
/** Surface flags for the active entity as they are being put together by the various collision functions
 * Original_Address: $(DOLLAR)5DA4
 */
__gshared ushort tempEntitySurfaceFlags;
/** The actual direction the party ends up moving in, if any
 * Original_Address: $(DOLLAR)5DA6
 */
__gshared ushort finalMovementDirection;
/** X coordinate of the entry point of the ladder or stairs that the player is currently using
 * Original_Address: $(DOLLAR)5DA8
 */
__gshared ushort ladderStairsTileX;
/** Y coordinate of the entry point of the ladder or stairs that the player is currently using
 * Original_Address: $(DOLLAR)5DAA
 */
__gshared ushort ladderStairsTileY;
/** The X coordinate of the left of the player entity's hitbox while it is moving around the map
 * Original_Address: $(DOLLAR)5DAC
 */
__gshared ushort checkedCollisionLeftX;
/** The Y coordinate of the top of the player entity's hitbox while it is moving around the map
 * Original_Address: $(DOLLAR)5DAE
 */
__gshared short checkedCollisionTopY;

/** Whether or not the collision routines should set tempEntitySurfaceFlags. This is only disabled for a very short period where it isn't even checked
 * Original_Address: $(DOLLAR)5DB4
 */
__gshared short setTempEntitySurfaceFlags;
/** A saved copy of the collision check result for north/south map movement collision. Not read anywhere
 * Original_Address: $(DOLLAR)5DB6
 */
__gshared short northSouthCollisionTestResult;
/** Set if the party isn't moving in the same direction that it's facing
 * Original_Address: $(DOLLAR)5DB8
 */
__gshared short notMovingInSameDirectionFaced;
/** Unknown. Never read. Seems to be set to 1 when movement isn't normal?
 * Original_Address: $(DOLLAR)5DBA
 */
__gshared short unknown7E5DBA;
/** Door pointer found by getDoorAt()
 * Original_Address: $(DOLLAR)5DBC
 */
__gshared DoorPtr doorFound;
/** Type of door found by getDoorAt()
 * Original_Address: $(DOLLAR)5DBC
 */
__gshared short doorFoundType;
/** The type of the interaction currently being processed
 * Original_Address: $(DOLLAR)5DC0
 */
__gshared short currentQueuedInteractionType;
/** 1 if a door is currently being used, 0 otherwise
 * Original_Address: $(DOLLAR)5DC2
 */
__gshared ushort usingDoor;
/** The direction towards the other side of the stairs currently in use, or -1 if no stairs are in use
 * Original_Address: $(DOLLAR)5DC4
 */
__gshared short stairsDirection;
/** The direction towards the other side of the escalator currently in use, or 0 if no escalators are in use
 * Original_Address: $(DOLLAR)5DC6
 */
__gshared short escalatorEntranceDirection;

/** Direction to face when a stairs demo is playing
 * Original_Address: $(DOLLAR)5DCA
 */
__gshared short autoMovementDirection;
/** The party's new X coordinate after getting on/off stairs
 * Original_Address: $(DOLLAR)5DCC
 */
__gshared short stairsNewX;
/** The party's new Y coordinate after getting on/off stairs
 * Original_Address: $(DOLLAR)5DCE
 */
__gshared short stairsNewY;
/** The party's new X coordinate after getting on/off an escalator
 * Original_Address: $(DOLLAR)5DD0
 */
__gshared short escalatorNewX;
/** The party's new Y coordinate after getting on/off an escalator
 * Original_Address: $(DOLLAR)5DD2
 */
__gshared short escalatorNewY;
__gshared short currentMapMusicTrack; /// Original_Address: $(DOLLAR)5DD4
__gshared short nextMapMusicTrack; /// Original_Address: $(DOLLAR)5DD6
__gshared short disableMusicChanges; /// Original_Address: $(DOLLAR)5DD8
__gshared short doMapMusicFade; /// Original_Address: $(DOLLAR)5DDA
__gshared short unknown7E5DDC; /// Original_Address: $(DOLLAR)5DDC
__gshared string unknown7E5DDE; /// Original_Address: $(DOLLAR)5DDE

__gshared QueuedInteraction[4] queuedInteractions; /// Original_Address: $(DOLLAR)5DEA
__gshared short currentQueuedInteraction; /// Original_Address: $(DOLLAR)5E02
__gshared short nextQueuedInteraction; /// Original_Address: $(DOLLAR)5E04
__gshared Unknown7E5E06Entry[24] unknown7E5E06; /// Original_Address: $(DOLLAR)5E06

__gshared short unknown7E5E36; /// Original_Address: $(DOLLAR)5E36
__gshared const(OverworldEventMusic)* loadedMapMusicEntry; /// Original_Address: $(DOLLAR)5E38
__gshared ActiveHotspot[2] activeHotspots; /// Original_Address: $(DOLLAR)5E3C
__gshared QueuedInteractionPtr[5] unknown7E5E58; /// Original_Address: $(DOLLAR)5E58
__gshared ubyte unknown7E5E6C; /// Original_Address: $(DOLLAR)5E6C
__gshared ubyte characterPadding; /// Original_Address: $(DOLLAR)5E6D
__gshared short unknown7E5E6E; /// Original_Address: $(DOLLAR)5E6E - "word-wrap flag"?
__gshared ubyte unknown7E5E70; /// Original_Address: $(DOLLAR)5E70
__gshared ubyte unknown7E5E71; /// Original_Address: $(DOLLAR)5E71
__gshared ubyte unknown7E5E72; /// Original_Address: $(DOLLAR)5E72
__gshared ubyte unknown7E5E73; /// Original_Address: $(DOLLAR)5E73
__gshared ubyte unknown7E5E74; /// Original_Address: $(DOLLAR)5E74
__gshared ubyte unknown7E5E75; /// Original_Address: $(DOLLAR)5E75
__gshared ubyte lastPrintedCharacter; /// Original_Address: $(DOLLAR)5E76
__gshared ubyte printAttackerArticle; /// Original_Address: $(DOLLAR)5E77
__gshared ubyte printTargetArticle; /// Original_Address: $(DOLLAR)5E78
__gshared ubyte unknown7E5E79; /// Original_Address: $(DOLLAR)5E79 - Mystery flag
__gshared short unknown7E5E7A; /// Original_Address: $(DOLLAR)5E7A
__gshared short unknown7E5E7C; /// Original_Address: $(DOLLAR)5E7C

__gshared ushort[0x1F8][8] unknown7E5E7E; /// Original_Address: $(DOLLAR)5E7E

__gshared ushort[0x400] bg2Buffer; /// Original_Address: $(DOLLAR)7DFE

__gshared WinStat unknown7E85FE; /// Original_Address: $(DOLLAR)85FE
__gshared WinStat[9] windowStats; /// Original_Address: $(DOLLAR)8650
__gshared short windowHead; /// Original_Address: $(DOLLAR)88E0 - Head of the window linked list
__gshared short windowTail; /// Original_Address: $(DOLLAR)88E2 - Tail of the window linked list
__gshared short[53] windowTable; /// Original_Address: $(DOLLAR)88E4 - Index: Window ID; Value: Index to windowStats
__gshared short[5] unknown7E894E; /// Original_Address: $(DOLLAR)894E
__gshared short currentFocusWindow; /// Original_Address: $(DOLLAR)8958 - Window ID of the focused window
__gshared ubyte[12] unknown7E895A; /// Original_Address: $(DOLLAR)895A

__gshared ubyte[3] hpPPWindowDigitBuffer; /// Original_Address: $(DOLLAR)8966
__gshared ushort[12][4] hpPPWindowBuffer; /// Original_Address: $(DOLLAR)8969

__gshared ubyte unknown7E89C9; /// Original_Address: $(DOLLAR)89C9
__gshared short battleMenuCurrentCharacterID; /// Original_Address: $(DOLLAR)89CA

__gshared short unknown7E89CC; /// Original_Address: $(DOLLAR)89CC
__gshared short unknown7E89CE; /// Original_Address: $(DOLLAR)89CE
__gshared short unknown7E89D0; /// Original_Address: $(DOLLAR)89D0
__gshared short unknown7E89D2; /// Original_Address: $(DOLLAR)89D2
__gshared MenuOpt[70] menuOptions; /// Original_Address: $(DOLLAR)89D4 - Window menu options

__gshared ubyte instantPrinting; /// Original_Address: $(DOLLAR)9622
__gshared ubyte redrawAllWindows; /// Original_Address: $(DOLLAR)9623
__gshared ubyte unknown7E9624; /// Original_Address: $(DOLLAR)9624
__gshared ushort selectedTextSpeed; /// Original_Address: $(DOLLAR)9625
__gshared uint unknown7E9627; /// Original_Address: $(DOLLAR)9627

__gshared string[4] unknown7E9631; /// Original_Address: $(DOLLAR)9631
__gshared short unknown7E9641; /// Original_Address: $(DOLLAR)9641
__gshared short battleModeFlag; /// Original_Address: $(DOLLAR)9643
__gshared short inputLockFlag; /// Original_Address: $(DOLLAR)9645
__gshared short unknown7E9647; /// Original_Address: $(DOLLAR)9647
__gshared short unknown7E9649; /// Original_Address: $(DOLLAR)9649
__gshared short unknown7E964B; /// Original_Address: $(DOLLAR)964B
__gshared ushort blinkingTriangleFlag; /// Original_Address: $(DOLLAR)964D
__gshared ushort textSoundMode; /// Original_Address: $(DOLLAR)964F
__gshared ubyte unknown7E9651; /// Original_Address: $(DOLLAR)9651
__gshared TextRenderState textRenderState; /// Original_Address: $(DOLLAR)9652
__gshared short attackerEnemyID; /// Original_Address: $(DOLLAR)9658
__gshared short targetEnemyID; /// Original_Address: $(DOLLAR)965A

__gshared short unknown7E9660; /// Original_Address: $(DOLLAR)9660
__gshared short unknown7E9662; /// Original_Address: $(DOLLAR)9662
__gshared ubyte[32] unknown7E9664; /// Original_Address: $(DOLLAR)9664
__gshared short unknown7E9684; /// Original_Address: $(DOLLAR)9684
__gshared short unknown7E9686; /// Original_Address: $(DOLLAR)9686
__gshared short unknown7E9688; /// Original_Address: $(DOLLAR)9688
__gshared short unknown7E968A; /// Original_Address: $(DOLLAR)968A
__gshared short unknown7E968C; /// Original_Address: $(DOLLAR)968C
__gshared ubyte[4] unknown7E968D; /// Original_Address: $(DOLLAR)968D
__gshared ubyte[4] unknown7E9691; /// Original_Address: $(DOLLAR)9691
__gshared ubyte unknown7E9695; /// Original_Address: $(DOLLAR)9695
__gshared ubyte unknown7E9696; /// Original_Address: $(DOLLAR)9696
__gshared ubyte unknown7E9697; /// Original_Address: $(DOLLAR)9697
__gshared short unknown7E9698; /// Original_Address: $(DOLLAR)9698
__gshared short[4] unknown7E969A; /// Original_Address: $(DOLLAR)969A
__gshared short[4] unknown7E96A2; /// Original_Address: $(DOLLAR)96A2
__gshared DisplayTextState[10] displayTextStates; /// Original_Address: $(DOLLAR)96AA
__gshared ushort unknown7E97B8; /// Original_Address: $(DOLLAR)97B8
__gshared ubyte[65] ccArgumentStorage; /// Original_Address: $(DOLLAR)97BA
__gshared ushort ccArgumentGatheringLoopCounter; /// Original_Address: $(DOLLAR)97CA
__gshared WorkingMemory wramScriptWorkMemory; /// Original_Address: $(DOLLAR)97CC
__gshared uint wramScriptArgMemory; /// Original_Address: $(DOLLAR)97D0
__gshared ubyte wramScriptSecMemory; /// Original_Address: $(DOLLAR)97D4
__gshared short unknown7E97D5; /// Original_Address: $(DOLLAR)97D5
__gshared ubyte[30] unknown7E97D7; /// Original_Address: $(DOLLAR)97D7

__gshared GameState gameState; /// Original_Address: $(DOLLAR)97F5
__gshared PartyCharacter[totalPartyCount] partyCharacters; /// Original_Address: $(DOLLAR)99CE
__gshared ubyte[eventFlagCount / 8] eventFlags; /// Original_Address: $(DOLLAR)9C08
__gshared ushort currentInteractingEventFlag; /// Original_Address: $(DOLLAR)9C88
__gshared WindowTextAttributesCopy windowTextAttributesBackup; /// Original_Address: $(DOLLAR)9C8A
__gshared ubyte[49] unknown7E9C9F; /// Original_Address: $(DOLLAR)9C9F
__gshared ubyte unknown7E9CD0; /// Original_Address: $(DOLLAR)9CD0
__gshared ubyte unknown7E9CD1; /// Original_Address: $(DOLLAR)9CD1
__gshared ubyte unknown7E9CD2; /// Original_Address: $(DOLLAR)9CD2
__gshared ubyte unknown7E9CD3; /// Original_Address: $(DOLLAR)9CD3
__gshared short unknown7E9CD4; /// Original_Address: $(DOLLAR)9CD4
__gshared ubyte unknown7E9CD6; /// Original_Address: $(DOLLAR)9CD6
__gshared ubyte[30] battleAttackerName; /// Original_Address: $(DOLLAR)9CD7
__gshared ubyte[28] battleTargetName; /// Original_Address: $(DOLLAR)9CF5
__gshared ubyte cItem; /// Original_Address: $(DOLLAR)9D11
__gshared uint cNum; /// Original_Address: $(DOLLAR)9D12
__gshared short unknown7E9D16; /// Original_Address: $(DOLLAR)9D16
__gshared ubyte unknown7E9D18; /// Original_Address: $(DOLLAR)9D18
__gshared short unknown7E9D19; /// Original_Address: $(DOLLAR)9D19
__gshared void function() unknown7E9D1B; /// Original_Address: $(DOLLAR)9D1B
__gshared short respawnX; /// Original_Address: $(DOLLAR)9D1F
__gshared short respawnY; /// Original_Address: $(DOLLAR)9D21
__gshared ubyte[8][0x20] unknown7E9D23; /// Original_Address: $(DOLLAR)9D23

__gshared ushort vwfX; /// Original_Address: $(DOLLAR)9E23
__gshared ushort vwfTile; /// Original_Address: $(DOLLAR)9E25
__gshared ushort unknown7E9E27; /// Original_Address: $(DOLLAR)9E27
__gshared ushort unknown7E9E29; /// Original_Address: $(DOLLAR)9E29

__gshared ushort dmaTransferFlag; /// Original_Address: $(DOLLAR)9E2B
__gshared ushort entityPreparedXCoordinate; /// Original_Address: $(DOLLAR)9E2D
__gshared ushort entityPreparedYCoordinate; /// Original_Address: $(DOLLAR)9E2F
__gshared ushort entityPreparedDirection; /// Original_Address: $(DOLLAR)9E31
__gshared ushort cameraFocusEntity; /// Original_Address: $(DOLLAR)9E33
__gshared short unknown7E9E35; /// Original_Address: $(DOLLAR)9E35
__gshared ubyte unknown7E9E37; /// Original_Address: $(DOLLAR)9E37
__gshared ubyte unknown7E9E38; /// Original_Address: $(DOLLAR)9E38
__gshared ubyte unknown7E9E39; /// Original_Address: $(DOLLAR)9E39
__gshared short rectangleWindowBufferIndex; /// Original_Address: $(DOLLAR)9E3A
__gshared OverworldTask[4] overworldTasks; /// Original_Address: $(DOLLAR)9E3C

__gshared ushort dadPhoneTimer; /// Original_Address: $(DOLLAR)9E54
__gshared short unknown7E9E56; /// Original_Address: $(DOLLAR)9E56
__gshared DemoEntry[64] autoMovementDemoBuffer; /// Original_Address: $(DOLLAR)9E58

__gshared short autoMovementDemoPosition; /// Original_Address: $(DOLLAR)9E56
__gshared LoadedItemTransformation[4] loadedItemTransformations; /// Original_Address: $(DOLLAR)9F1A

__gshared short unknown7E9F2A; /// Original_Address: $(DOLLAR)9F2A
__gshared ubyte unknown7E9F2C; /// Original_Address: $(DOLLAR)9F2C
__gshared short unknown7E9F2D; /// Original_Address: $(DOLLAR)9F2D
__gshared short unknown7E9F2F; /// Original_Address: $(DOLLAR)9F2F
__gshared short unknown7E9F31; /// Original_Address: $(DOLLAR)9F31
__gshared short unknown7E9F33; /// Original_Address: $(DOLLAR)9F33
__gshared short unknown7E9F35; /// Original_Address: $(DOLLAR)9F35

__gshared short unknown7E9F39; /// Original_Address: $(DOLLAR)9F39
__gshared short unknown7E9F3B; /// Original_Address: $(DOLLAR)9F3B
__gshared short unknown7E9F3D; /// Original_Address: $(DOLLAR)9F3D
__gshared short teleportDestination; /// Original_Address: $(DOLLAR)9F3F
__gshared TeleportStyle teleportStyle; /// Original_Address: $(DOLLAR)9F41
__gshared short teleportState; /// Original_Address: $(DOLLAR)9F43
__gshared FixedPoint1616 unknown7E9F45; /// Original_Address: $(DOLLAR)9F45
__gshared FixedPoint1616 unknown7E9F49; /// Original_Address: $(DOLLAR)9F49
__gshared FixedPoint1616 unknown7E9F4D; /// Original_Address: $(DOLLAR)9F4D
__gshared FixedPoint1616 unknown7E9F51; /// Original_Address: $(DOLLAR)9F51
__gshared FixedPoint1616 unknown7E9F55; /// Original_Address: $(DOLLAR)9F55
__gshared short unknown7E9F59; /// Original_Address: $(DOLLAR)9F59
__gshared short unknown7E9F5B; /// Original_Address: $(DOLLAR)9F5B
__gshared short unknown7E9F5D; /// Original_Address: $(DOLLAR)9F5D
__gshared short unknown7E9F5F; /// Original_Address: $(DOLLAR)9F5F
__gshared short unknown7E9F61; /// Original_Address: $(DOLLAR)9F61
__gshared short unknown7E9F63; /// Original_Address: $(DOLLAR)9F63
__gshared short unknown7E9F65; /// Original_Address: $(DOLLAR)9F65
__gshared short unknown7E9F67; /// Original_Address: $(DOLLAR)9F67
__gshared short unknown7E9F69; /// Original_Address: $(DOLLAR)9F69
__gshared short unknown7E9F6B; /// Original_Address: $(DOLLAR)9F6B
__gshared short unknown7E9F6D; /// Original_Address: $(DOLLAR)9F6D
__gshared short unknown7E9F6F; /// Original_Address: $(DOLLAR)9F6F
__gshared short pajamaFlag; /// Original_Address: $(DOLLAR)9F71
__gshared short unknown7E9F73; /// Original_Address: $(DOLLAR)9F73
__gshared short unknown7E9F75; /// Original_Address: $(DOLLAR)9F75
__gshared short unknown7E9F77; /// Original_Address: $(DOLLAR)9F77
__gshared ubyte unknown7E9F79; /// Original_Address: $(DOLLAR)9F79
__gshared short unknown7E9F7A; /// Original_Address: $(DOLLAR)9F7A
__gshared short unknown7E9F7C; /// Original_Address: $(DOLLAR)9F7C
__gshared short tilemapUpdateTileCount; /// Original_Address: $(DOLLAR)9F7E
__gshared short unknown7E9F80; /// Original_Address: $(DOLLAR)9F80
__gshared short unknown7E9F82; /// Original_Address: $(DOLLAR)9F82
__gshared short tilemapUpdateBaseAddress; /// Original_Address: $(DOLLAR)9F84
__gshared ushort* tilemapUpdateRemainingTiles; /// Original_Address: $(DOLLAR)9F86
__gshared short unknown7E9F88; /// Original_Address: $(DOLLAR)9F88
__gshared short enemiesInBattle; /// Original_Address: $(DOLLAR)9F8A
__gshared short[16] enemiesInBattleIDs; /// Original_Address: $(DOLLAR)9F8C
__gshared Battler[32] battlersTable; /// Original_Address: $(DOLLAR)9FAC
__gshared uint battlerTargetFlags; /// Original_Address: $(DOLLAR)A96C
__gshared Battler* currentAttacker; /// Original_Address: $(DOLLAR)A970
__gshared Battler* currentTarget; /// Original_Address: $(DOLLAR)A972
__gshared uint battleEXPScratch; /// Original_Address: $(DOLLAR)A974
__gshared ushort battleMoneyScratch; /// Original_Address: $(DOLLAR)A978
__gshared ushort currentGiygasPhase; /// Original_Address: $(DOLLAR)A97A
__gshared ubyte unknown7EA97C; /// Original_Address: $(DOLLAR)A97C
__gshared BattleMenuSelection battleMenuSelection; /// Original_Address: $(DOLLAR)A97D
__gshared ubyte[27] attackerNameAdjustScratch; /// Original_Address: $(DOLLAR)A983
__gshared ubyte[27] targetNameAdjustScratch; /// Original_Address: $(DOLLAR)A99E
__gshared ubyte[27] unknown7EA9B9; /// Original_Address: $(DOLLAR)A9B9
__gshared ubyte[4*14] stealableItemCandidates; /// Original_Address: $(DOLLAR)A9D4

__gshared short unknown7EAA0C; /// Original_Address: $(DOLLAR)AA0C
/** How the battle was won (normal, teleportation, boss defeated, giygas defeated)
 * Original_Address: $(DOLLAR)AA0E
 */
__gshared short specialDefeat;
/** Item dropped by the enemies in this battle
 * Original_Address: $(DOLLAR)AA10
 */
__gshared short itemDropped;
/** The enemy ID being mirrored
 * Original_Address: $(DOLLAR)AA12
 */
__gshared short mirrorEnemy;
/** A backup copy of the mirror-user's stats, restored when mirror expires
 * Original_Address: $(DOLLAR)AA14
 */
__gshared Battler mirrorBattlerBackup;
/** Number of turns left before mirror effect expires
 * Original_Address: $(DOLLAR)AA64
 */
__gshared ushort mirrorTurnTimer;
/**
 * Original_Address: $(DOLLAR)AA66
 */
__gshared ushort[5] unknown7EAA66;
/** For battle debug mode - The current PSI animation ID
 * Original_Address: $(DOLLAR)AA70
 */
__gshared ushort debuggingCurrentPSIAnimation;
/** For battle debug mode - The current swirl animation ID
 * Original_Address: $(DOLLAR)AA72
 */
__gshared ushort debuggingCurrentSwirl;
/** For battle debug mode - The current swirl animation flags
 * Original_Address: $(DOLLAR)AA74
 */
__gshared ushort debuggingCurrentSwirlFlags;
/** A sorted list of party member offense stats
 *  Original_Address: $(DOLLAR)AA76
 */
__gshared ushort[4] instantWinSortedOffense;
/** A sorted list of enemy HP stats
 * Original_Address: $(DOLLAR)AA7E
 */
__gshared ushort[4] instantWinSortedHP;
/** A sorted list of enemy defense stats
 * Original_Address: $(DOLLAR)AA86
 */
__gshared ushort[4] instantWinSortedDefense;
/** A smaaaash attack is being performed. Affects damage text and vertical shake intensity
 * Original_Address: $(DOLLAR)AA8E
 */
__gshared ushort isSmaaaashAttack;
/** Set when enemy is performing a final attack. Affects survivability in 1v1s and disables shield damage reflection
 * Original_Address: $(DOLLAR)AA90
 */
__gshared ushort enemyPerformingFinalAttack;
/** Skips displaying the death text and animation, as well as prevent cleaning up of enemy stats
 * Original_Address: $(DOLLAR)AA92
 */
__gshared ushort skipDeathTextAndCleanup;
/** Flag set when shield text has already been printed. Only set for PSI shields, since they're handled separately
 * Original_Address: $(DOLLAR)AA94
 */
__gshared ushort shieldHasNullifiedDamage;
/** Flag set when damage has been reflected already. Prevents extra reflections
 * Original_Address: $(DOLLAR)AA96
 */
__gshared ushort damageIsReflected;
/** A buffer for determing which enemy letters are in use
 * Original_Address: $(DOLLAR)AA98
 */
__gshared ubyte[26] usedEnemyLetters;
/** Current number of spritemaps (32x32 chunks) allocated
 * Original_Address: $(DOLLAR)AAB2
 */
__gshared ushort currentBattleSpritemapsAllocated;
/** Current number of battle sprites allocated
 * Original_Address: $(DOLLAR)AAB4
 */
__gshared ushort currentBattleSpritesAllocated;
/** The number of spritemaps allocated when this sprite was allocated. Unused
 * Original_Address: $(DOLLAR)AAB6
 */
__gshared ubyte[8] battleSpritemapAllocationCounts;
/** The enemy IDs matching the currently loaded battle sprites
 * Original_Address: $(DOLLAR)AABE
 */
__gshared ushort[4] currentBattleSpriteEnemyIDs;
/** Widths of each loaded battle sprite (in terms of 32x32 hardware sprites). Unused
 * Original_Address: $(DOLLAR)AAC6
 */
__gshared ubyte[8] currentBattleSpriteWidths;
/** Heights of each loaded battle sprite (in terms of 32x32 hardware sprites). Unused
 * Original_Address: $(DOLLAR)AACE
 */
__gshared ubyte[8] currentBattleSpriteHeights;
/** The spritemaps used for enemy battle sprites
 * Original_Address: $(DOLLAR)AAD6
 */
__gshared SpriteMap[16][4] battleSpritemaps;
/** The alternate spritemaps used for enemy battle sprites. Used for palette animations
 * Original_Address: $(DOLLAR)AC16
 */
__gshared SpriteMap[16][4] altBattleSpritemaps;
/** Number of enemies in the front row
 * Original_Address: $(DOLLAR)AD56
 */
__gshared ushort numBattlersInFrontRow;
/** Number of enemies in the back row
 * Original_Address: $(DOLLAR)AD58
 */
__gshared ushort numBattlersInBackRow;
/** The X coordinates of the enemies in the front row
 * Original_Address: $(DOLLAR)AD5A
 */
__gshared ubyte[8] battlerFrontRowXPositions;
/** The Y coordinates of the enemies in the front row
 * Original_Address: $(DOLLAR)AD62
 */
__gshared ubyte[8] battlerFrontRowYPositions;
/** The X coordinates of the enemies in the back row
 * Original_Address: $(DOLLAR)AD6A
 */
__gshared ubyte[8] battlerBackRowXPositions;
/** The Y coordinates of the enemies in the back row
 * Original_Address: $(DOLLAR)AD72
 */
__gshared ubyte[8] battlerBackRowYPositions;
/** The IDs of the enemies in the front row
 * Original_Address: $(DOLLAR)AD7A
 */
__gshared ubyte[8] frontRowBattlers;
/** The IDs of the enemies in the back row
 * Original_Address: $(DOLLAR)AD82
 */
__gshared ubyte[8] backRowBattlers;
/** Current background layer configuration
 * Original_Address: $(DOLLAR)AD8A
 * See_Also: earthbound.commondefs.LayerConfig
 */
__gshared short currentLayerConfig;
__gshared short verticalShakeDuration; /// Original_Address: $(DOLLAR)AD8C
__gshared short verticalShakeHoldDuration; /// Original_Address: $(DOLLAR)AD8E
__gshared short unknown7EAD90; /// Original_Address: $(DOLLAR)AD90
__gshared short wobbleDuration; /// Original_Address: $(DOLLAR)AD92
__gshared short shakeDuration; /// Original_Address: $(DOLLAR)AD94
__gshared short unknown7EAD96; /// Original_Address: $(DOLLAR)AD96
__gshared short unknown7EAD98; /// Original_Address: $(DOLLAR)AD98
__gshared short unknown7EAD9A; /// Original_Address: $(DOLLAR)AD9A
__gshared short unknown7EAD9C; /// Original_Address: $(DOLLAR)AD9C
__gshared short greenFlashDuration; /// Original_Address: $(DOLLAR)AD9E
__gshared short redFlashDuration; /// Original_Address: $(DOLLAR)ADA0
__gshared short enemyTargettingFlashing; /// Original_Address: $(DOLLAR)ADA2
__gshared short hpPPBoxBlinkDuration; /// Original_Address: $(DOLLAR)ADA4
__gshared short hpPPBoxBlinkTarget; /// Original_Address: $(DOLLAR)ADA6
__gshared short unknown7EADA8; /// Original_Address: $(DOLLAR)ADA8
__gshared short unknown7EADAA; /// Original_Address: $(DOLLAR)ADAA
__gshared short unknown7EADAC; /// Original_Address: $(DOLLAR)ADAC
__gshared short unknown7EADAE; /// Original_Address: $(DOLLAR)ADAE
__gshared short unknown7EADB0; /// Original_Address: $(DOLLAR)ADB0
__gshared short letterboxTopEnd; /// Original_Address: $(DOLLAR)ADB2
__gshared short letterboxBottomStart; /// Original_Address: $(DOLLAR)ADB4
__gshared short letterboxEffectEnding; /// Original_Address: $(DOLLAR)ADB6
__gshared HDMAWordTransfer[6] unknown7EADB8; /// Original_Address: $(DOLLAR)ADB8

__gshared short letterboxEffectEndingTop; /// Original_Address: $(DOLLAR)ADCC
__gshared short letterboxEffectEndingBottom; /// Original_Address: $(DOLLAR)ADCE
__gshared short unknown7EADD0; /// Original_Address: $(DOLLAR)ADD0
__gshared short unknown7EADD2; /// Original_Address: $(DOLLAR)ADD2
__gshared LoadedBackgroundData loadedBGDataLayer1; /// Original_Address: $(DOLLAR)ADD4
__gshared LoadedBackgroundData loadedBGDataLayer2; /// Original_Address: $(DOLLAR)AE4B
__gshared ubyte unknown7EAEC2; /// Original_Address: $(DOLLAR)AEC2
__gshared ubyte framesUntilNextSwirlFrame; /// Original_Address: $(DOLLAR)AEC3
__gshared ubyte swirlFramesLeft; /// Original_Address: $(DOLLAR)AEC4
__gshared ubyte swirlHDMATableID; /// Original_Address: $(DOLLAR)AEC5
__gshared ubyte swirlInvertEnabled; /// Original_Address: $(DOLLAR)AEC6
__gshared ubyte swirlReversed; /// Original_Address: $(DOLLAR)AEC7
__gshared ubyte swirlMaskSettings; /// Original_Address: $(DOLLAR)AEC8
__gshared ubyte unknown7EAEC9; /// Original_Address: $(DOLLAR)AEC9
__gshared ubyte unknown7EAECA; /// Original_Address: $(DOLLAR)AECA
__gshared ubyte unknown7EAECB; /// Original_Address: $(DOLLAR)AECB
__gshared const(AttractModeParameters)* loadedComputedSwirl; /// Original_Address: $(DOLLAR)AECC
__gshared short unknown7EAED0; /// Original_Address: $(DOLLAR)AED0
__gshared short unknown7EAED2; /// Original_Address: $(DOLLAR)AED2
__gshared short unknown7EAED4; /// Original_Address: $(DOLLAR)AED4
__gshared short unknown7EAED6; /// Original_Address: $(DOLLAR)AED6
__gshared short unknown7EAED8; /// Original_Address: $(DOLLAR)AED8
__gshared short unknown7EAEDA; /// Original_Address: $(DOLLAR)AEDA
__gshared short unknown7EAEDC; /// Original_Address: $(DOLLAR)AEDC
__gshared short unknown7EAEDE; /// Original_Address: $(DOLLAR)AEDE
__gshared short unknown7EAEE0; /// Original_Address: $(DOLLAR)AEE0
__gshared short unknown7EAEE2; /// Original_Address: $(DOLLAR)AEE2
__gshared ubyte unknown7EAEE4; /// Original_Address: $(DOLLAR)AEE4
__gshared ubyte unknown7EAEE5; /// Original_Address: $(DOLLAR)AEE5
__gshared ubyte unknown7EAEE6; /// Original_Address: $(DOLLAR)AEE6
__gshared ushort[4] unknown7EAEE7; /// Original_Address: $(DOLLAR)AEE7
__gshared ubyte unknown7EAEEF; /// Original_Address: $(DOLLAR)AEEF
__gshared ushort[2] unknown7EAEF0; /// Original_Address: $(DOLLAR)AEF0
__gshared ushort[4] battleSpritePaletteEffectFramesLeft; /// Original_Address: $(DOLLAR)AEF4
__gshared short[3 * 16 * 4] battleSpritePaletteEffectDeltas; /// Original_Address: $(DOLLAR)AEFC
__gshared short[3 * 16 * 4] battleSpritePaletteEffectCounters; /// Original_Address: $(DOLLAR)B07C
__gshared short[3 * 16 * 4] battleSpritePaletteEffectSteps; /// Original_Address: $(DOLLAR)B1FC
__gshared short battleSpritePaletteEffectSpeed; /// Original_Address: $(DOLLAR)B37C
__gshared SoundStoneMelodyState[8] soundStonePlaybackState; /// Original_Address: $(DOLLAR)B37E
__gshared SpriteMap soundStoneSpriteTilemap1; /// Original_Address: $(DOLLAR)B3EE
__gshared SpriteMap soundStoneSpriteTilemap2; /// Original_Address: $(DOLLAR)B3F3
__gshared short unknown7EB3F8; /// Original_Address: $(DOLLAR)B3F8
__gshared short unknown7EB3FA; /// Original_Address: $(DOLLAR)B3FA
__gshared ubyte* pathMatrixBuffer; /// Original_Address: $(DOLLAR)B3FC - Matrix buffer
__gshared ushort pathMatrixRows; /// Original_Address: $(DOLLAR)B400 - Matrix rows
__gshared ushort pathMatrixCols; /// Original_Address: $(DOLLAR)B402 - Matrix columns
__gshared ushort pathMatrixBorder; /// Original_Address: $(DOLLAR)B404 - Matrix start point border size (for offscreen deliverymen)
__gshared ushort pathMatrixSize; /// Original_Address: $(DOLLAR)B406 - Matrix size (path_matrix_rows * path_matrix_cols)
__gshared ushort* pathB408; /// Original_Address: $(DOLLAR)B408 - Pathfinder unknown int array start pointer
__gshared ushort* pathB40A; /// Original_Address: $(DOLLAR)B40A - Pathfinder unknown int array end pointer
__gshared ushort* pathB40C; /// Original_Address: $(DOLLAR)B40C - Pathfinder unknown int array curr pointer #1
__gshared ushort* pathB40E; /// Original_Address: $(DOLLAR)B40E - Pathfinder unknown int array curr pointer #2
__gshared short[4] pathCardinalOffset; /// Original_Address: $(DOLLAR)B410 - Pathfinder matrix offset increments for each cardinal (N/E/S/W) direction
__gshared VecYX[4] pathCardinalIndex; /// Original_Address: $(DOLLAR)B418 - Pathfinder matrix index increments for each cardinal direction
__gshared VecYX[4] pathDiagonalIndex; /// Original_Address: $(DOLLAR)B428 - Pathfinder matrix index increments for each ordinal (NE/SE/SW/NW) direction
__gshared void* pathHeapStart; /// Original_Address: $(DOLLAR)B438 - Pathfinder heap start pointer
__gshared void* pathHeapCurrent; /// Original_Address: $(DOLLAR)B43A - Pathfinder heap current pointer
__gshared void* pathHeapEnd; /// Original_Address: $(DOLLAR)B43C - Pathfinder heap end pointer

__gshared ubyte unknown7EB49D; /// Original_Address: $(DOLLAR)B49D - Addressed specifically using long addressing, why??
__gshared ubyte[3] unknown7EB49E; /// Original_Address: $(DOLLAR)B49E
__gshared ubyte currentSaveSlot; /// Original_Address: $(DOLLAR)B4A1
__gshared ubyte unknown7EB4A2; /// Original_Address: $(DOLLAR)B4A2

__gshared ubyte* entityFadeStatesBuffer; /// Original_Address: $(DOLLAR)B4A4
__gshared short entityFadeStatesLength; /// Original_Address: $(DOLLAR)B4A6
__gshared short entityFadeEntity; /// Original_Address: $(DOLLAR)B4A8
__gshared SpriteFadeState* entityFadeStates; /// Original_Address: $(DOLLAR)B4AA
__gshared short townMapIconAnimationFrame; /// Original_Address: $(DOLLAR)B4AE
__gshared short townMapPlayerIconAnimationFrame; /// Original_Address: $(DOLLAR)B4B0
__gshared short framesUntilMapIconPaletteUpdate; /// Original_Address: $(DOLLAR)B4B2
__gshared short waitForNamingScreenActionScript; /// Original_Address: $(DOLLAR)B4B4
__gshared ubyte disabledTransitions; /// Original_Address: $(DOLLAR)B4B6
__gshared ubyte nextYourSanctuaryLocationTileIndex; /// Original_Address: $(DOLLAR)B4B8
__gshared ubyte totalYourSanctuaryLoadedTilesetTiles; /// Original_Address: $(DOLLAR)B4BA
__gshared ubyte yourSanctuaryLoadedTilesetTiles; /// Original_Address: $(DOLLAR)B4BC
__gshared ushort[8] loadedYourSanctuaryLocations; /// Original_Address: $(DOLLAR)B4BE
__gshared ubyte unknown7EB4CE; /// Original_Address: $(DOLLAR)B4CE
__gshared short unknown7EB4CF; /// Original_Address: $(DOLLAR)B4CF
__gshared short unknown7EB4D1; /// Original_Address: $(DOLLAR)B4D1
__gshared short unknown7EB4D3; /// Original_Address: $(DOLLAR)B4D3

__gshared ushort creditsNextCreditPosition; /// Original_Address: $(DOLLAR)B4E3
__gshared short creditsRowWipeThreshold; /// Original_Address: $(DOLLAR)B4E5 - Y position where top row gets cleared
__gshared const(ubyte)* creditsSource; /// Original_Address: $(DOLLAR)B4E7
__gshared FixedPoint1616 creditsScrollPosition; /// Original_Address: $(DOLLAR)B4EB
__gshared short photographMapLoadingMode; /// Original_Address: $(DOLLAR)B4EF
__gshared short currentPhotoDisplay; /// Original_Address: $(DOLLAR)B4F1
__gshared short creditsDMAQueueEnd; /// Original_Address: $(DOLLAR)B4F3
__gshared short creditsDMAQueueStart; /// Original_Address: $(DOLLAR)B4F5
__gshared short creditsCurrentRow; /// Original_Address: $(DOLLAR)B4F7
__gshared ubyte[24] creditsPlayerNameBuffer; /// Original_Address: $(DOLLAR)B4F9
__gshared short[10] unknown7EB511; /// Original_Address: $(DOLLAR)B511
__gshared ushort[10] deliveryTimers; /// Original_Address: $(DOLLAR)B525
__gshared short piracyFlag; /// Original_Address: $(DOLLAR)B539
__gshared ushort currentMusicTrack; /// Original_Address: $(DOLLAR)B53B
__gshared short debugSoundMenuInitialBGM; /// Original_Address: $(DOLLAR)B545
__gshared short unknown7EB547; /// Original_Address: $(DOLLAR)B547
__gshared ushort enableAutoSectorMusicChanges; /// Original_Address: $(DOLLAR)B549
__gshared ushort debugSoundMenuSelectedBGM; /// Original_Address: $(DOLLAR)B54B
__gshared ushort debugSoundMenuSelectedSE; /// Original_Address: $(DOLLAR)B54D
__gshared ushort debugSoundMenuSelectedEffect; /// Original_Address: $(DOLLAR)B54F
__gshared ushort unknown7EB551; /// Original_Address: $(DOLLAR)B551
__gshared ushort debugCursorEntity; /// Original_Address: $(DOLLAR)B553
__gshared ushort debugMenuCursorPosition; /// Original_Address: $(DOLLAR)B555
__gshared ushort debugMenuButtonPressed; /// Original_Address: $(DOLLAR)B557
__gshared ushort debugModeNumber; /// Original_Address: $(DOLLAR)B559


__gshared ushort unknown7EB55D; /// Original_Address: $(DOLLAR)B55D
__gshared ushort viewAttributeMode; /// Original_Address: $(DOLLAR)B55F
__gshared ushort debugStartPositionX; /// Original_Address: $(DOLLAR)B561
__gshared ushort debugStartPositionY; /// Original_Address: $(DOLLAR)B563
__gshared ushort debugViewCharacterSprite; /// Original_Address: $(DOLLAR)B565
__gshared ushort replayModeActive; /// Original_Address: $(DOLLAR)B567
__gshared ushort unknown7EB569; /// Original_Address: $(DOLLAR)B569
__gshared ushort unknown7EB56B; /// Original_Address: $(DOLLAR)B56B
__gshared ushort randABackup; /// Original_Address: $(DOLLAR)B56D
__gshared ushort randBBackup; /// Original_Address: $(DOLLAR)B56F
__gshared ushort frameCounterBackup; /// Original_Address: $(DOLLAR)B571
__gshared ushort replayTransitionStyle; /// Original_Address: $(DOLLAR)B573
__gshared ushort debugEnemiesEnabledFlag; /// Original_Address: $(DOLLAR)B575

__gshared ubyte[0x800] animatedMapPaletteBuffer; /// Original_Address: $(DOLLAR)B800
__gshared ubyte[0x2000] unknown7EC000; /// Original_Address: $(DOLLAR)C000

__gshared ubyte[64][64] loadedCollisionTiles; /// Original_Address: $(DOLLAR)E000
__gshared Unknown7EF000Stuff unknown7EF000; /// Original_Address: $(DOLLAR)F000
__gshared ubyte[0x10000] buffer; /// Original_Address: $(DOLLAR)7F0000
ref ushort[0x80] paletteAnimTargetPalette() { return (cast(ushort*)&buffer[0x7800])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimRedSlope() { return (cast(ushort*)&buffer[0x7900])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimGreenSlope() { return (cast(ushort*)&buffer[0x7A00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimBlueSlope() { return (cast(ushort*)&buffer[0x7B00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimRedAccum() { return (cast(ushort*)&buffer[0x7C00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimGreenAccum() { return (cast(ushort*)&buffer[0x7D00])[0 .. 0x80]; }
ref ushort[0x80] paletteAnimBlueAccum() { return (cast(ushort*)&buffer[0x7E00])[0 .. 0x80]; }
__gshared ushort[0x3C00] tileArrangementBuffer; /// Original_Address: $(DOLLAR)7F8000
__gshared const(ubyte[4][4])*[0x400] tileCollisionBuffer; /// Original_Address: $(DOLLAR)7FF800

__gshared ubyte[0x8000] introBG2Buffer; /// Original_Address: $(DOLLAR)8000 - this seems to overlap with other stuff...?


// Actionscript stuff. This was originally assembly and relied on some unusual direct page manipulation, which cannot be reproduced exactly

__gshared ushort actionScriptVar80; /// Original_Address: $(DOLLAR)80

__gshared ActionLoopCallState* actionScriptVar84; /// Original_Address: $(DOLLAR)84
__gshared ushort actionScriptVar86; /// Original_Address: $(DOLLAR)86
__gshared ushort actionScriptVar88; /// Original_Address: $(DOLLAR)88
__gshared ushort currentEntityScriptOffset; /// Original_Address: $(DOLLAR)8A
__gshared const(SpriteMap)* actionScriptVar8C; /// Original_Address: $(DOLLAR)8C
__gshared const(ubyte)* actionScriptVar8CScript; /// Original_Address: $(DOLLAR)8C
__gshared ushort* actionScriptVar8CMemory; /// Original_Address: $(DOLLAR)8C
__gshared ubyte actionScriptVar8E; /// Original_Address: $(DOLLAR)8E

__gshared short actionScriptVar90; /// Original_Address: $(DOLLAR)90

__gshared const(ubyte)* actionScriptVar92; /// Original_Address: $(DOLLAR)92

__gshared const(ubyte)* actionScriptVar94; /// Original_Address: $(DOLLAR)94

// Other hardware stuff

version(savememory) __gshared SRAM sram; /// Original_Address: $(DOLLAR)306000
__gshared SaveDataReplay replaySRAM; /// Original_Address: $(DOLLAR)316000
__gshared DemoEntry[0] sram3; /// Original_Address: $(DOLLAR)326000

// non-SNES stuff
/// Whether ROM data is loaded (for testing)
bool romDataLoaded;

/// Extra entity data
EntityExtra[maxEntities] entityExtra;

bool breakActionscript;
