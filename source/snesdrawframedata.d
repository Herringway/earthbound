module snesdrawframedata;

import earthbound.hardware;

public struct HDMAWrite {
    ushort vcounter;
    byte addr;
    byte value;
}

public struct SnesDrawFrameData {
align:
    ubyte INIDISP;
    ubyte OBSEL;
    ushort OAMADDR;
    ubyte BGMODE;
    ubyte MOSAIC;
    ubyte BG1SC;
    ubyte BG2SC;
    ubyte BG3SC;
    ubyte BG4SC;
    ubyte BG12NBA;
    ubyte BG34NBA;
    ushort BG1HOFS;
    ushort BG1VOFS;
    ushort BG2HOFS;
    ushort BG2VOFS;
    ushort BG3HOFS;
    ushort BG3VOFS;
    ushort BG4HOFS;
    ushort BG4VOFS;
    ubyte M7SEL;
    ushort M7A;
    ushort M7B;
    ushort M7C;
    ushort M7D;
    ushort M7X;
    ushort M7Y;
    ubyte W12SEL;
    ubyte W34SEL;
    ubyte WOBJSEL;
    ubyte WH0;
    ubyte WH1;
    ubyte WH2;
    ubyte WH3;
    ubyte WBGLOG;
    ubyte WOBJLOG;
    ubyte TM;
    ubyte TS;
    ubyte TMW;
    ubyte TSW;
    ubyte CGWSEL;
    ubyte CGADSUB;
    ubyte FIXED_COLOR_DATA_R;
    ubyte FIXED_COLOR_DATA_G;
    ubyte FIXED_COLOR_DATA_B;
    ubyte SETINI;

    ushort[0x8000] vram;
    ushort[0x100] cgram;
    OAMEntry[128] oam1;
    ubyte[32] oam2;
    
    ushort numHdmaWrites;
    HDMAWrite[4*8*240] hdmaData;
}

public __gshared SnesDrawFrameData g_frameData;

void copyGlobalsToFrameData() {
    g_frameData.INIDISP = INIDISP;
    g_frameData.OBSEL = OBSEL;
    g_frameData.OAMADDR = OAMADDL | OAMADDH << 8;
    g_frameData.BGMODE = BGMODE;
    g_frameData.MOSAIC = MOSAIC;
    g_frameData.BG1SC = BG1SC;
    g_frameData.BG2SC = BG2SC;
    g_frameData.BG3SC = BG3SC;
    g_frameData.BG4SC = BG4SC;
    g_frameData.BG12NBA = BG12NBA;
    g_frameData.BG34NBA = BG34NBA;
    g_frameData.BG1HOFS = BG1HOFS;
    g_frameData.BG1VOFS = BG1VOFS;
    g_frameData.BG2HOFS = BG2HOFS;
    g_frameData.BG2VOFS = BG2VOFS;
    g_frameData.BG3HOFS = BG3HOFS;
    g_frameData.BG3VOFS = BG3VOFS;
    g_frameData.BG4HOFS = BG4HOFS;
    g_frameData.BG4VOFS = BG4VOFS;
    g_frameData.M7SEL = M7SEL;
    g_frameData.M7A = M7A;
    g_frameData.M7B = M7B;
    g_frameData.M7C = M7C;
    g_frameData.M7D = M7D;
    g_frameData.M7X = M7X;
    g_frameData.M7Y = M7Y;
    g_frameData.W12SEL = W12SEL;
    g_frameData.W34SEL = W34SEL;
    g_frameData.WOBJSEL = WOBJSEL;
    g_frameData.WH0 = WH0;
    g_frameData.WH1 = WH1;
    g_frameData.WH2 = WH2;
    g_frameData.WH3 = WH3;
    g_frameData.WBGLOG = WBGLOG;
    g_frameData.WOBJLOG = WOBJLOG;
    g_frameData.TM = TM;
    g_frameData.TS = TD;
    g_frameData.TMW = TMW;
    g_frameData.TSW = TSW;
    g_frameData.CGWSEL = CGWSEL;
    g_frameData.CGADSUB = CGADSUB;
    g_frameData.SETINI = SETINI;
}
