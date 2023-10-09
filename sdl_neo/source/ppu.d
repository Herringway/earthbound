import core.stdc.stdio;
import core.stdc.stdlib;
import core.stdc.string;
import core.stdc.stdint;
import core.stdc.stddef;
import core.stdc.assert_;

struct BgLayer {
  ushort hScroll;
  ushort vScroll;
  // -- snapshot starts here
  bool tilemapWider;
  bool tilemapHigher;
  ushort tilemapAdr;
  // -- snapshot ends here
  ushort tileAdr;
}

enum kPpuExtraLeftRight = 0;

enum {
  kPpuXPixels = 256 + kPpuExtraLeftRight * 2,
};

alias PpuZbufType = ushort;

struct PpuPixelPrioBufs {
  // This holds the prio in the upper 8 bits and the color in the lower 8 bits.
  PpuZbufType[kPpuXPixels] data;
}

int IntMin(int a, int b) { return a < b ? a : b; }
int IntMax(int a, int b) { return a > b ? a : b; }
uint UintMin(uint a, uint b) { return a < b ? a : b; }

enum {
  kPpuRenderFlags_NewRenderer = 1,
  // Render mode7 upsampled by 4x4
  kPpuRenderFlags_4x4Mode7 = 2,
  // Use 240 height instead of 224
  kPpuRenderFlags_Height240 = 4,
  // Disable sprite render limits
  kPpuRenderFlags_NoSpriteLimits = 8,
}

struct Ppu {
  bool lineHasSprites;
  ubyte lastBrightnessMult;
  ubyte lastMosaicModulo;
  ubyte renderFlags;
  uint renderPitch;
  ubyte *renderBuffer;
  ubyte extraLeftCur, extraRightCur, extraLeftRight, extraBottomCur;
  float mode7PerspectiveLow, mode7PerspectiveHigh;

  // TMW / TSW etc
  ubyte[2] screenEnabled;
  ubyte[2] screenWindowed;
  ubyte mosaicEnabled;
  ubyte mosaicSize;
  // object/sprites
  ushort objTileAdr1;
  ushort objTileAdr2;
  ubyte objSize;
  // Window
  ubyte window1left;
  ubyte window1right;
  ubyte window2left;
  ubyte window2right;
  uint windowsel;

  // color math
  ubyte clipMode;
  ubyte preventMathMode;
  bool addSubscreen;
  bool subtractColor;
  bool halfColor;
  ubyte mathEnabled;
  ubyte fixedColorR, fixedColorG, fixedColorB;
  // settings
  bool forcedBlank;
  ubyte brightness;
  ubyte mode;

  // vram access
  ushort vramPointer;
  ushort vramIncrement;
  bool vramIncrementOnHigh;
  // cgram access
  ubyte cgramPointer;
  bool cgramSecondWrite;
  ubyte cgramBuffer;
  // oam access
  ushort oamAdr;
  bool oamSecondWrite;
  ubyte oamBuffer;

  // background layers
  BgLayer[4] bgLayer;
  ubyte scrollPrev;
  ubyte scrollPrev2;
  
  // mode 7
  short[8] m7matrix; // a, b, c, d, x, y, h, v
  ubyte m7prev;
  bool m7largeField;
  bool m7charFill;
  bool m7xFlip;
  bool m7yFlip;
  bool m7extBg_always_zero;
  // mode 7 internal
  int m7startX;
  int m7startY;

  ushort[0x110] oam;
  
  // store 31 extra entries to remove the need for clamp
  ubyte[32 + 31] brightnessMult;
  ubyte[32 * 2] brightnessMultHalf;
  ushort[0x100] cgram;
  ubyte[kPpuXPixels] mosaicModulo;
  uint[256] colorMapRgb;
  PpuPixelPrioBufs[2] bgBuffers;
  PpuPixelPrioBufs objBuffer;
  ushort[0x8000] vram;
  void INIDISP(ubyte val) {
    ppu_write(&this, 0x00, val);
  }
  void OBSEL(ubyte val) {
    ppu_write(&this, 0x01, val);
  }
  void BGMODE(ubyte val) {
    ppu_write(&this, 0x05, val);
  }
  void MOSAIC(ubyte val) {
    ppu_write(&this, 0x06, val);
  }
  void BG1SC(ubyte val) {
    ppu_write(&this, 0x07, val);
  }
  void BG2SC(ubyte val) {
    ppu_write(&this, 0x08, val);
  }
  void BG3SC(ubyte val) {
    ppu_write(&this, 0x09, val);
  }
  void BG4SC(ubyte val) {
    ppu_write(&this, 0x0A, val);
  }
  void BG12NBA(ubyte val) {
    ppu_write(&this, 0x0B, val);
  }
  void BG34NBA(ubyte val) {
    ppu_write(&this, 0x0C, val);
  }
  void BG1HOFS(ushort val) {
    ppu_write(&this, 0x0D, val & 0xFF);
    ppu_write(&this, 0x0D, val >> 8);
  }
  void BG1VOFS(ushort val) {
    ppu_write(&this, 0x0E, val & 0xFF);
    ppu_write(&this, 0x0E, val >> 8);
  }
  void BG2HOFS(ushort val) {
    ppu_write(&this, 0x0F, val & 0xFF);
    ppu_write(&this, 0x0F, val >> 8);
  }
  void BG2VOFS(ushort val) {
    ppu_write(&this, 0x10, val & 0xFF);
    ppu_write(&this, 0x10, val >> 8);
  }
  void BG3HOFS(ushort val) {
    ppu_write(&this, 0x11, val & 0xFF);
    ppu_write(&this, 0x11, val >> 8);
  }
  void BG3VOFS(ushort val) {
    ppu_write(&this, 0x12, val & 0xFF);
    ppu_write(&this, 0x12, val >> 8);
  }
  void BG4HOFS(ushort val) {
    ppu_write(&this, 0x13, val & 0xFF);
    ppu_write(&this, 0x13, val >> 8);
  }
  void BG4VOFS(ushort val) {
    ppu_write(&this, 0x14, val & 0xFF);
    ppu_write(&this, 0x14, val >> 8);
  }
  void W12SEL(ubyte val) {
    ppu_write(&this, 0x23, val);
  }
  void W34SEL(ubyte val) {
    ppu_write(&this, 0x24, val);
  }
  void WOBJSEL(ubyte val) {
    ppu_write(&this, 0x25, val);
  }
  void WH0(ubyte val) {
    ppu_write(&this, 0x26, val);
  }
  void WH1(ubyte val) {
    ppu_write(&this, 0x27, val);
  }
  void WH2(ubyte val) {
    ppu_write(&this, 0x28, val);
  }
  void WH3(ubyte val) {
    ppu_write(&this, 0x29, val);
  }
  void WBGLOG(ubyte val) {
    ppu_write(&this, 0x2A, val);
  }
  void WOBJLOG(ubyte val) {
    ppu_write(&this, 0x2B, val);
  }
  void TM(ubyte val) {
    ppu_write(&this, 0x2C, val);
  }
  void TS(ubyte val) {
    ppu_write(&this, 0x2D, val);
  }
  void TMW(ubyte val) {
    ppu_write(&this, 0x2E, val);
  }
  void TSW(ubyte val) {
    ppu_write(&this, 0x2F, val);
  }
  void CGWSEL(ubyte val) {
    ppu_write(&this, 0x30, val);
  }
  void CGADSUB(ubyte val) {
    ppu_write(&this, 0x31, val);
  }
}

immutable ubyte[2][8] kSpriteSizes = [
  [8, 16], [8, 32], [8, 64], [16, 32],
  [16, 64], [32, 64], [16, 32], [16, 32]
];

bool IS_SCREEN_ENABLED(Ppu* ppu, uint sub, uint layer) { return !!(ppu.screenEnabled[sub] & (1 << layer)); }
bool IS_SCREEN_WINDOWED(Ppu* ppu, uint sub, uint layer) { return !!(ppu.screenWindowed[sub] & (1 << layer)); }
bool IS_MOSAIC_ENABLED(Ppu* ppu, uint layer) { return !!(ppu.mosaicEnabled & (1 << layer)); }
bool GET_WINDOW_FLAGS(Ppu* ppu, uint layer){ return !!(ppu.windowsel >> (layer * 4)); }
enum {
  kWindow1Inversed = 1,
  kWindow1Enabled = 2,
  kWindow2Inversed = 4,
  kWindow2Enabled = 8,
}

Ppu* ppu_init() {
  Ppu* ppu = cast(Ppu * )malloc(Ppu.sizeof);
  ppu.extraLeftRight = kPpuExtraLeftRight;
  return ppu;
}

void ppu_free(Ppu* ppu) {
  free(ppu);
}

void ppu_reset(Ppu* ppu) {
  memset(&ppu.vram[0], 0, ppu.vram.sizeof);
  ppu.lastBrightnessMult = 0xff;
  ppu.lastMosaicModulo = 0xff;
  ppu.extraLeftCur = 0;
  ppu.extraRightCur = 0;
  ppu.extraBottomCur = 0;
  ppu.vramPointer = 0;
  ppu.vramIncrementOnHigh = false;
  ppu.vramIncrement = 1;
  memset(&ppu.cgram[0], 0, ppu.cgram.sizeof);
  ppu.cgramPointer = 0;
  ppu.cgramSecondWrite = false;
  ppu.cgramBuffer = 0;
  memset(&ppu.oam[0], 0, ppu.oam.sizeof);
  ppu.oamAdr = 0;
  ppu.oamSecondWrite = false;
  ppu.oamBuffer = 0;
  ppu.objTileAdr1 = 0x4000;
  ppu.objTileAdr2 = 0x5000;
  ppu.objSize = 0;
  memset(&ppu.objBuffer, 0, ppu.objBuffer.sizeof);
  for(int i = 0; i < 4; i++) {
    ppu.bgLayer[i].hScroll = 0;
    ppu.bgLayer[i].vScroll = 0;
    ppu.bgLayer[i].tilemapWider = false;
    ppu.bgLayer[i].tilemapHigher = false;
    ppu.bgLayer[i].tilemapAdr = 0;
    ppu.bgLayer[i].tileAdr = 0;
  }
  ppu.scrollPrev = 0;
  ppu.scrollPrev2 = 0;
  ppu.mosaicSize = 1;
  ppu.screenEnabled[0] = ppu.screenEnabled[1] = 0;
  ppu.screenWindowed[0] = ppu.screenWindowed[1] = 0;
  memset(&ppu.m7matrix[0], 0, ppu.m7matrix.sizeof);
  ppu.m7prev = 0;
  ppu.m7largeField = true;
  ppu.m7charFill = false;
  ppu.m7xFlip = false;
  ppu.m7yFlip = false;
  ppu.m7extBg_always_zero = false;
  ppu.m7startX = 0;
  ppu.m7startY = 0;
  ppu.windowsel = 0;
  ppu.window1left = 0;
  ppu.window1right = 0;
  ppu.window2left = 0;
  ppu.window2right = 0;
  ppu.clipMode = 0;
  ppu.preventMathMode = 0;
  ppu.addSubscreen = false;
  ppu.subtractColor = false;
  ppu.halfColor = false;
  ppu.mathEnabled = 0;
  ppu.fixedColorR = 0;
  ppu.fixedColorG = 0;
  ppu.fixedColorB = 0;
  ppu.forcedBlank = true;
  ppu.brightness = 0;
  ppu.mode = 0;
}

alias SaveLoadFunc = void function(void*, void*, size_t);

void ppu_saveload(Ppu *ppu, SaveLoadFunc func, void *ctx) {
  ubyte[556] tmp;

  func(ctx, &ppu.vram[0], 0x8000 * 2);
  func(ctx, &tmp[0], 10);
  func(ctx, &ppu.cgram[0], 512);
  func(ctx, &tmp[0], 556);
  func(ctx, &tmp[0], 520);
  for (int i = 0; i < 4; i++) {
    func(ctx, &tmp[0], 4);
    func(ctx, &ppu.bgLayer[i].tilemapWider, 4);
    func(ctx, &tmp[0], 4);
  }
  func(ctx, &tmp[0], 123);
}

int PpuGetCurrentRenderScale(Ppu *ppu, uint render_flags) {
  bool hq = ppu.mode == 7 && !ppu.forcedBlank &&
    (render_flags & (kPpuRenderFlags_4x4Mode7 | kPpuRenderFlags_NewRenderer)) == (kPpuRenderFlags_4x4Mode7 | kPpuRenderFlags_NewRenderer);
  return hq ? 4 : 1;
}

void PpuBeginDrawing(Ppu *ppu, ubyte *pixels, size_t pitch, uint render_flags) {
  ppu.renderFlags = cast(ubyte)render_flags;
  ppu.renderPitch = cast(uint)pitch;
  ppu.renderBuffer = pixels;

  // Cache the brightness computation
  if (ppu.brightness != ppu.lastBrightnessMult) {
    ubyte ppu_brightness = ppu.brightness;
    ppu.lastBrightnessMult = ppu_brightness;
    for (int i = 0; i < 32; i++)
      ppu.brightnessMultHalf[i * 2] = ppu.brightnessMultHalf[i * 2 + 1] = ppu.brightnessMult[i] =
      cast(ubyte)(((i << 3) | (i >> 2)) * ppu_brightness / 15);
    // Store 31 extra entries to remove the need for clamping to 31.
    memset(&ppu.brightnessMult[32], ppu.brightnessMult[31], 31);
  }

  if (PpuGetCurrentRenderScale(ppu, ppu.renderFlags) == 4) {
    for (int i = 0; i < 256; i++) {
      uint color = ppu.cgram[i];
      ppu.colorMapRgb[i] = ppu.brightnessMult[color & 0x1f] << 16 | ppu.brightnessMult[(color >> 5) & 0x1f] << 8 | ppu.brightnessMult[(color >> 10) & 0x1f];
    }
  }
}

private void ClearBackdrop(PpuPixelPrioBufs *buf) {
  for (size_t i = 0; i != buf.data.length; i += 4)
    *cast(ulong*)&buf.data[i] = 0x0500050005000500;
}


void ppu_runLine(Ppu *ppu, int line) {
  if(line != 0) {
    if (ppu.mosaicSize != ppu.lastMosaicModulo) {
      int mod = ppu.mosaicSize;
      ppu.lastMosaicModulo = cast(ubyte)mod;
      for (int i = 0, j = 0; i < ppu.mosaicModulo.length; i++) {
        ppu.mosaicModulo[i] = cast(ubyte)(i - j);
        j = (j + 1 == mod ? 0 : j + 1);
      }
    }
    // evaluate sprites
    ClearBackdrop(&ppu.objBuffer);
    ppu.lineHasSprites = !ppu.forcedBlank && ppu_evaluateSprites(ppu, line - 1);

    // outside of visible range?
    if (line >= 225 + ppu.extraBottomCur) {
      memset(&ppu.renderBuffer[(line - 1) * ppu.renderPitch], 0, uint.sizeof * (256 + ppu.extraLeftRight * 2));
      return;
    }

    if (ppu.renderFlags & kPpuRenderFlags_NewRenderer) {
      PpuDrawWholeLine(ppu, line);
    } else {
      if (ppu.mode == 7)
        ppu_calculateMode7Starts(ppu, line);
      for (int x = 0; x < 256; x++)
        ppu_handlePixel(ppu, x, line);

      ubyte *dst = ppu.renderBuffer + ((line - 1) * ppu.renderPitch);
      if (ppu.extraLeftRight != 0) {
        memset(dst, 0, uint.sizeof * ppu.extraLeftRight);
        memset(dst + uint.sizeof * (256 + ppu.extraLeftRight), 0, uint.sizeof * ppu.extraLeftRight);
      }
    }
  }
}

struct PpuWindows {
  short[6] edges;
  ubyte nr;
  ubyte bits;
}

private void PpuWindows_Clear(PpuWindows *win, Ppu *ppu, uint layer) {
  win.edges[0] = -(layer != 2 ? ppu.extraLeftCur : 0);
  win.edges[1] = 256 + (layer != 2 ? ppu.extraRightCur : 0);
  win.nr = 1;
  win.bits = 0;
}

private void PpuWindows_Calc(PpuWindows *win, Ppu *ppu, uint layer) {
  // Evaluate which spans to render based on the window settings.
  // There are at most 5 windows.
  // Algorithm from Snes9x
  uint winflags = GET_WINDOW_FLAGS(ppu, layer);
  uint nr = 1;
  int window_right = 256 + (layer != 2 ? ppu.extraRightCur : 0);
  win.edges[0] = - (layer != 2 ? ppu.extraLeftCur : 0);
  win.edges[1] = cast(short)window_right;
  uint i, j;
  int t;
  bool w1_ena = (winflags & kWindow1Enabled) && ppu.window1left <= ppu.window1right;
  if (w1_ena) {
    if (ppu.window1left > win.edges[0]) {
      win.edges[nr] = ppu.window1left;
      win.edges[++nr] = cast(short)window_right;
    }
    if (ppu.window1right + 1 < window_right) {
      win.edges[nr] = ppu.window1right + 1;
      win.edges[++nr] = cast(short)window_right;
    }
  }
  bool w2_ena = (winflags & kWindow2Enabled) && ppu.window2left <= ppu.window2right;
  if (w2_ena) {
    for (i = 0; i <= nr && (t = ppu.window2left) != win.edges[i]; i++) {
      if (t < win.edges[i]) {
        for (j = nr++; j >= i; j--)
          win.edges[j + 1] = win.edges[j];
        win.edges[i] = cast(short)t;
        break;
      }
    }
    for (; i <= nr && (t = ppu.window2right + 1) != win.edges[i]; i++) {
      if (t < win.edges[i]) {
        for (j = nr++; j >= i; j--)
          win.edges[j + 1] = win.edges[j];
        win.edges[i] = cast(short)t;
        break;
      }
    }
  }
  win.nr = cast(ubyte)nr;
  // get a bitmap of how regions map to windows
  ubyte w1_bits = 0, w2_bits = 0;
  if (w1_ena) {
    for (i = 0; win.edges[i] != ppu.window1left; i++) {}
    for (j = i; win.edges[j] != ppu.window1right + 1; j++) {}
    w1_bits = cast(ubyte)(((1 << (j - i)) - 1) << i);
  }
  if ((winflags & (kWindow1Enabled | kWindow1Inversed)) == (kWindow1Enabled | kWindow1Inversed))
    w1_bits = cast(ubyte)~w1_bits;
  if (w2_ena) {
    for (i = 0; win.edges[i] != ppu.window2left; i++) {}
    for (j = i; win.edges[j] != ppu.window2right + 1; j++) {}
    w2_bits = cast(ubyte)(((1 << (j - i)) - 1) << i);
  }
  if ((winflags & (kWindow2Enabled | kWindow2Inversed)) == (kWindow2Enabled | kWindow2Inversed))
    w2_bits = cast(ubyte)~w2_bits;
  win.bits = w1_bits | w2_bits;
}

// Draw a whole line of a 4bpp background layer into bgBuffers
private void PpuDrawBackground_4bpp(Ppu *ppu, uint y, bool sub, uint layer, PpuZbufType zhi, PpuZbufType zlo) {
  enum { kPaletteShift = 6 };
  if (!IS_SCREEN_ENABLED(ppu, sub, layer))
    return;  // layer is completely hidden
  PpuWindows win;
  IS_SCREEN_WINDOWED(ppu, sub, layer) ? PpuWindows_Calc(&win, ppu, layer) : PpuWindows_Clear(&win, ppu, layer);
  BgLayer *bglayer = &ppu.bgLayer[layer];
  y += bglayer.vScroll;
  int sc_offs = bglayer.tilemapAdr + (((y >> 3) & 0x1f) << 5);
  if ((y & 0x100) && bglayer.tilemapHigher)
    sc_offs += bglayer.tilemapWider ? 0x800 : 0x400;
  const(ushort)*[2] tps = [
    &ppu.vram[sc_offs & 0x7fff],
    &ppu.vram[sc_offs + (bglayer.tilemapWider ? 0x400 : 0) & 0x7fff]
  ];
  int tileadr = ppu.bgLayer[layer].tileAdr, pixel;
  int tileadr1 = tileadr + 7 - (y & 0x7), tileadr0 = tileadr + (y & 0x7);
  const(ushort) *addr;
  uint READ_BITS(int ta, uint tile) { addr = &ppu.vram[((ta) + (tile) * 16) & 0x7fff]; return addr[0] | addr[8] << 16; }
  for (size_t windex = 0; windex < win.nr; windex++) {
    if (win.bits & (1 << windex))
      continue;  // layer is disabled for this window part
    uint x = win.edges[windex] + bglayer.hScroll;
    uint w = win.edges[windex + 1] - win.edges[windex];
    PpuZbufType *dstz = &ppu.bgBuffers[sub].data[win.edges[windex] + kPpuExtraLeftRight];
    const(ushort) *tp = tps[x >> 8 & 1] + ((x >> 3) & 0x1f);
    const(ushort) *tp_last = tps[x >> 8 & 1] + 31;
    const(ushort) *tp_next = tps[(x >> 8 & 1) ^ 1];
//#define NEXT_TP() if (tp != tp_last) tp += 1; else tp = tp_next, tp_next = tp_last - 31, tp_last = tp + 31;
uint bits;
PpuZbufType z;
void DO_PIXEL(int i)() {
  do {
    pixel = (bits >> i) & 1 | (bits >> (7 + i)) & 2 | (bits >> (14 + i)) & 4 | (bits >> (21 + i)) & 8;
    if ((bits & (0x01010101 << i)) && z > dstz[i]) dstz[i] = cast(ushort)(z + pixel);
  } while (0);
}
void DO_PIXEL_HFLIP(int i)() {
  do {
    pixel = (bits >> (7 - i)) & 1 | (bits >> (14 - i)) & 2 | (bits >> (21 - i)) & 4 | (bits >> (28 - i)) & 8;
    if ((bits & (0x80808080 >> i)) && z > dstz[i]) dstz[i] = cast(ushort)(z + pixel);
  } while (0);
}
    // Handle clipped pixels on left side
    if (x & 7) {
      int curw = IntMin(8 - (x & 7), w);
      w -= curw;
      uint tile = *tp;
      if (tp != tp_last) tp += 1; else tp = tp_next, tp_next = tp_last - 31, tp_last = tp + 31;
      int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
      z = (tile & 0x2000) ? zhi : zlo;
      bits = READ_BITS(ta, tile & 0x3ff);
      if (bits) {
        z += ((tile & 0x1c00) >> kPaletteShift);
        if (tile & 0x4000) {
          bits >>= (x & 7), x += curw;
          do DO_PIXEL!(0); while (() { bits >>= 1; dstz++; return --curw;}());
        } else {
          bits <<= (x & 7), x += curw;
          do DO_PIXEL_HFLIP!(0); while (() { bits <<= 1; dstz++; return --curw;}());
        }
      } else {
        dstz += curw;
      }
    }
    // Handle full tiles in the middle
    while (w >= 8) {
      uint tile = *tp;
      if (tp != tp_last) tp += 1; else tp = tp_next, tp_next = tp_last - 31, tp_last = tp + 31;
      int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
      z = (tile & 0x2000) ? zhi : zlo;
      bits = READ_BITS(ta, tile & 0x3ff);
      if (bits) {
        z += ((tile & 0x1c00) >> kPaletteShift);
        if (tile & 0x4000) {
          DO_PIXEL!(0); DO_PIXEL!(1); DO_PIXEL!(2); DO_PIXEL!(3);
          DO_PIXEL!(4); DO_PIXEL!(5); DO_PIXEL!(6); DO_PIXEL!(7);
        } else {
          DO_PIXEL_HFLIP!(0); DO_PIXEL_HFLIP!(1); DO_PIXEL_HFLIP!(2); DO_PIXEL_HFLIP!(3);
          DO_PIXEL_HFLIP!(4); DO_PIXEL_HFLIP!(5); DO_PIXEL_HFLIP!(6); DO_PIXEL_HFLIP!(7);
        }
      }
      dstz += 8, w -= 8;
    }
    // Handle remaining clipped part
    if (w) {
      uint tile = *tp;
      int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
      z = (tile & 0x2000) ? zhi : zlo;
      bits = READ_BITS(ta, tile & 0x3ff);
      if (bits) {
        z += ((tile & 0x1c00) >> kPaletteShift);
        if (tile & 0x4000) {
          do DO_PIXEL!(0); while (() { bits >>= 1; dstz++; return --w; }());
        } else {
          do DO_PIXEL_HFLIP!(0); while (() { bits <<= 1; dstz++; return --w; }());
        }
      }
    }
  }
}

// Draw a whole line of a 2bpp background layer into bgBuffers
private void PpuDrawBackground_2bpp(Ppu *ppu, uint y, bool sub, uint layer, PpuZbufType zhi, PpuZbufType zlo) {
  enum { kPaletteShift = 8 };
  if (!IS_SCREEN_ENABLED(ppu, sub, layer))
    return;  // layer is completely hidden
  PpuWindows win;
  IS_SCREEN_WINDOWED(ppu, sub, layer) ? PpuWindows_Calc(&win, ppu, layer) : PpuWindows_Clear(&win, ppu, layer);
  BgLayer *bglayer = &ppu.bgLayer[layer];
  y += bglayer.vScroll;
  int sc_offs = bglayer.tilemapAdr + (((y >> 3) & 0x1f) << 5);
  if ((y & 0x100) && bglayer.tilemapHigher)
    sc_offs += bglayer.tilemapWider ? 0x800 : 0x400;
  const ushort*[2] tps = [
    &ppu.vram[sc_offs & 0x7fff],
    &ppu.vram[sc_offs + (bglayer.tilemapWider ? 0x400 : 0) & 0x7fff]
  ];
  int tileadr = ppu.bgLayer[layer].tileAdr, pixel;
  int tileadr1 = tileadr + 7 - (y & 0x7), tileadr0 = tileadr + (y & 0x7);

  const(ushort) *addr;
  for (size_t windex = 0; windex < win.nr; windex++) {
    if (win.bits & (1 << windex))
      continue;  // layer is disabled for this window part
    uint x = win.edges[windex] + bglayer.hScroll;
    uint w = win.edges[windex + 1] - win.edges[windex];
    PpuZbufType *dstz = &ppu.bgBuffers[sub].data[win.edges[windex] + kPpuExtraLeftRight];
    const(ushort) *tp = tps[x >> 8 & 1] + ((x >> 3) & 0x1f);
    const(ushort) *tp_last = tps[x >> 8 & 1] + 31;
    const(ushort) *tp_next = tps[(x >> 8 & 1) ^ 1];

//#define NEXT_TP() if (tp != tp_last) tp += 1; else tp = tp_next, tp_next = tp_last - 31, tp_last = tp + 31;
  uint READ_BITS(int ta, uint tile) { addr = &ppu.vram[(ta) + (tile) * 8 & 0x7fff]; return addr[0]; }
    PpuZbufType z;
    uint bits;
void DO_PIXEL(int i)() {
 do {
    pixel = (bits >> i) & 1 | (bits >> (7 + i)) & 2;
    if (pixel && z > dstz[i]) dstz[i] = cast(ushort)(z + pixel);
  } while (0);
}
void DO_PIXEL_HFLIP(int i)() {
  do {
    pixel = (bits >> (7 - i)) & 1 | (bits >> (14 - i)) & 2;
    if (pixel && z > dstz[i]) dstz[i] = cast(ushort)(z + pixel);
  } while (0);
}
    // Handle clipped pixels on left side
    if (x & 7) {
      int curw = IntMin(8 - (x & 7), w);
      w -= curw;
      uint tile = *tp;
      if (tp != tp_last) tp += 1; else tp = tp_next, tp_next = tp_last - 31, tp_last = tp + 31;
      int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
      z = (tile & 0x2000) ? zhi : zlo;
      bits = READ_BITS(ta, tile & 0x3ff);
      if (bits) {
        z += ((tile & 0x1c00) >> kPaletteShift);
        if (tile & 0x4000) {
          bits >>= (x & 7), x += curw;
          do DO_PIXEL!(0); while (() { bits >>= 1; dstz++; return --curw; }());
        } else {
          bits <<= (x & 7), x += curw;
          do DO_PIXEL_HFLIP!(0); while (() { bits <<= 1; dstz++; return --curw; }());
        }
      } else {
        dstz += curw;
      }
    }
    // Handle full tiles in the middle
    while (w >= 8) {
      uint tile = *tp;
      if (tp != tp_last) tp += 1; else tp = tp_next, tp_next = tp_last - 31, tp_last = tp + 31;
      int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
      z = (tile & 0x2000) ? zhi : zlo;
      bits = READ_BITS(ta, tile & 0x3ff);
      if (bits) {
        z += ((tile & 0x1c00) >> kPaletteShift);
        if (tile & 0x4000) {
          DO_PIXEL!(0); DO_PIXEL!(1); DO_PIXEL!(2); DO_PIXEL!(3);
          DO_PIXEL!(4); DO_PIXEL!(5); DO_PIXEL!(6); DO_PIXEL!(7);
        } else {
          DO_PIXEL_HFLIP!(0); DO_PIXEL_HFLIP!(1); DO_PIXEL_HFLIP!(2); DO_PIXEL_HFLIP!(3);
          DO_PIXEL_HFLIP!(4); DO_PIXEL_HFLIP!(5); DO_PIXEL_HFLIP!(6); DO_PIXEL_HFLIP!(7);
        }
      }
      dstz += 8, w -= 8;
    }
    // Handle remaining clipped part
    if (w) {
      uint tile = *tp;
      int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
      z = (tile & 0x2000) ? zhi : zlo;
      bits = READ_BITS(ta, tile & 0x3ff);
      if (bits) {
        z += ((tile & 0x1c00) >> kPaletteShift);
        if (tile & 0x4000) {
          do DO_PIXEL!(0); while (() { bits >>= 1; dstz++; return --w; }());
        } else {
          do DO_PIXEL_HFLIP!(0); while (() { bits <<= 1; dstz++; return --w; }());
        }
      }
    }
  }
}

// Draw a whole line of a 4bpp background layer into bgBuffers, with mosaic applied
private void PpuDrawBackground_4bpp_mosaic(Ppu *ppu, uint y, bool sub, uint layer, PpuZbufType zhi, PpuZbufType zlo) {
  enum { kPaletteShift = 6 };
  if (!IS_SCREEN_ENABLED(ppu, sub, layer))
    return;  // layer is completely hidden
  PpuWindows win;
  IS_SCREEN_WINDOWED(ppu, sub, layer) ? PpuWindows_Calc(&win, ppu, layer) : PpuWindows_Clear(&win, ppu, layer);
  BgLayer *bglayer = &ppu.bgLayer[layer];
  y = ppu.mosaicModulo[y] + bglayer.vScroll;
  int sc_offs = bglayer.tilemapAdr + (((y >> 3) & 0x1f) << 5);
  if ((y & 0x100) && bglayer.tilemapHigher)
    sc_offs += bglayer.tilemapWider ? 0x800 : 0x400;
  const(ushort)*[2] tps = [
    &ppu.vram[sc_offs & 0x7fff],
    &ppu.vram[sc_offs + (bglayer.tilemapWider ? 0x400 : 0) & 0x7fff]
  ];
  int tileadr = ppu.bgLayer[layer].tileAdr, pixel;
  uint bits;
  int tileadr1 = tileadr + 7 - (y & 0x7), tileadr0 = tileadr + (y & 0x7);
  const(ushort) *addr;
  void GET_PIXEL() { pixel = (bits) & 1 | (bits >> 7) & 2 | (bits >> 14) & 4 | (bits >> 21) & 8; }
  void GET_PIXEL_HFLIP() { pixel = (bits >> 7) & 1 | (bits >> 14) & 2 | (bits >> 21) & 4 | (bits >> 28) & 8; }
  uint READ_BITS(uint ta, uint tile) { addr = &ppu.vram[((ta) + (tile) * 16) & 0x7fff]; return addr[0] | addr[8] << 16; }
  for (size_t windex = 0; windex < win.nr; windex++) {
    if (win.bits & (1 << windex))
      continue;  // layer is disabled for this window part
    int sx = win.edges[windex];
    PpuZbufType *dstz = &ppu.bgBuffers[sub].data[sx + kPpuExtraLeftRight];
    PpuZbufType *dstz_end = &ppu.bgBuffers[sub].data.ptr[win.edges[windex + 1] + kPpuExtraLeftRight];
    uint x = sx + bglayer.hScroll;
    const(ushort) *tp = tps[x >> 8 & 1] + ((x >> 3) & 0x1f);
    const(ushort) *tp_last = tps[x >> 8 & 1] + 31;
    const(ushort)* tp_next = tps[(x >> 8 & 1) ^ 1];
    x &= 7;
    int w = ppu.mosaicSize - (sx - ppu.mosaicModulo[sx]);
    do {
      w = IntMin(w, cast(int)(dstz_end - dstz));
      uint tile = *tp;
      int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
      PpuZbufType z = (tile & 0x2000) ? zhi : zlo;
      bits = READ_BITS(ta, tile & 0x3ff);
      if (tile & 0x4000) bits >>= x, GET_PIXEL(); else bits <<= x, GET_PIXEL_HFLIP();
      if (pixel) {
        pixel += (tile & 0x1c00) >> kPaletteShift;
        int i = 0;
        do {
          if (z > dstz[i])
            dstz[i] = cast(ushort)(pixel + z);
        } while (++i != w);
      }
      dstz += w, x += w;
      for (; x >= 8; x -= 8)
        tp = (tp != tp_last) ? tp + 1 : tp_next;
      w = ppu.mosaicSize;
    } while (dstz_end - dstz != 0);
  }
}

// Draw a whole line of a 2bpp background layer into bgBuffers, with mosaic applied
private void PpuDrawBackground_2bpp_mosaic(Ppu *ppu, int y, bool sub, uint layer, PpuZbufType zhi, PpuZbufType zlo) {
  enum { kPaletteShift = 8 };
  if (!IS_SCREEN_ENABLED(ppu, sub, layer))
    return;  // layer is completely hidden
  PpuWindows win;
  IS_SCREEN_WINDOWED(ppu, sub, layer) ? PpuWindows_Calc(&win, ppu, layer) : PpuWindows_Clear(&win, ppu, layer);
  BgLayer *bglayer = &ppu.bgLayer[layer];
  y = ppu.mosaicModulo[y] + bglayer.vScroll;
  int sc_offs = bglayer.tilemapAdr + (((y >> 3) & 0x1f) << 5);
  if ((y & 0x100) && bglayer.tilemapHigher)
    sc_offs += bglayer.tilemapWider ? 0x800 : 0x400;
  const(ushort)*[2] tps = [
    &ppu.vram[sc_offs & 0x7fff],
    &ppu.vram[sc_offs + (bglayer.tilemapWider ? 0x400 : 0) & 0x7fff]
  ];
  int tileadr = ppu.bgLayer[layer].tileAdr, pixel;
  int tileadr1 = tileadr + 7 - (y & 0x7), tileadr0 = tileadr + (y & 0x7);
  const(ushort) *addr;
  uint bits;
  void GET_PIXEL() { pixel = (bits) & 1 | (bits >> 7) & 2; }
  void GET_PIXEL_HFLIP() { pixel = (bits >> 7) & 1 | (bits >> 14) & 2; }
  uint READ_BITS(uint ta, uint tile) { addr = &ppu.vram[((ta) + (tile) * 8) & 0x7fff]; return addr[0]; }
  for (size_t windex = 0; windex < win.nr; windex++) {
    if (win.bits & (1 << windex))
      continue;  // layer is disabled for this window part
    int sx = win.edges[windex];
    PpuZbufType *dstz = &ppu.bgBuffers[sub].data[sx + kPpuExtraLeftRight];
    PpuZbufType *dstz_end = &ppu.bgBuffers[sub].data.ptr[win.edges[windex + 1] + kPpuExtraLeftRight];
    uint x = sx + bglayer.hScroll;
    const(ushort) *tp = tps[x >> 8 & 1] + ((x >> 3) & 0x1f);
    const(ushort) *tp_last = tps[x >> 8 & 1] + 31;
    const(ushort) *tp_next = tps[(x >> 8 & 1) ^ 1];
    x &= 7;
    int w = ppu.mosaicSize - (sx - ppu.mosaicModulo[sx]);
    do {
      w = IntMin(w, cast(int)(dstz_end - dstz));
      uint tile = *tp;
      int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
      PpuZbufType z = (tile & 0x2000) ? zhi : zlo;
      bits = READ_BITS(ta, tile & 0x3ff);
      if (tile & 0x4000) bits >>= x, GET_PIXEL(); else bits <<= x, GET_PIXEL_HFLIP();
      if (pixel) {
        pixel += (tile & 0x1c00) >> kPaletteShift;
        uint i = 0;
        do {
          if (z > dstz[i])
            dstz[i] = cast(ushort)(pixel + z);
        } while (++i != w);
      }
      dstz += w, x += w;
      for (; x >= 8; x -= 8)
        tp = (tp != tp_last) ? tp + 1 : tp_next;
      w = ppu.mosaicSize;
    } while (dstz_end - dstz != 0);
  }
}


// level6 should be set if it's from palette 0xc0 which means color math is not applied
uint SPRITE_PRIO_TO_PRIO(uint prio, bool level6) { return ((prio) * 4 + 2) * 16 + 4 + (level6 ? 2 : 0); }
uint SPRITE_PRIO_TO_PRIO_HI(uint prio) { return (prio) * 4 + 2; }

private void PpuDrawSprites(Ppu *ppu, uint y, uint sub, bool clear_backdrop) {
  int layer = 4;
  if (!IS_SCREEN_ENABLED(ppu, sub, layer))
    return;  // layer is completely hidden
  PpuWindows win;
  IS_SCREEN_WINDOWED(ppu, sub, layer) ? PpuWindows_Calc(&win, ppu, layer) : PpuWindows_Clear(&win, ppu, layer);
  for (size_t windex = 0; windex < win.nr; windex++) {
    if (win.bits & (1 << windex))
      continue;  // layer is disabled for this window part
    int left = win.edges[windex];
    int width = win.edges[windex + 1] - left;
    PpuZbufType *src = &ppu.objBuffer.data[left + kPpuExtraLeftRight];
    PpuZbufType *dst = &ppu.bgBuffers[sub].data[left + kPpuExtraLeftRight];
    if (clear_backdrop) {
      memcpy(dst, src, width * ushort.sizeof);
    } else {
      do {
        if (src[0] > dst[0])
          dst[0] = src[0];
      } while (() { src++; dst++; return --width; }());
    }
  }
}

// Assumes it's drawn on an empty backdrop
private void PpuDrawBackground_mode7(Ppu *ppu, uint y, bool sub, PpuZbufType z) {
  int layer = 0;
  if (!IS_SCREEN_ENABLED(ppu, sub, layer))
    return;  // layer is completely hidden
  PpuWindows win;
  IS_SCREEN_WINDOWED(ppu, sub, layer) ? PpuWindows_Calc(&win, ppu, layer) : PpuWindows_Clear(&win, ppu, layer);

  // expand 13-bit values to signed values
  int hScroll = (cast(short)(ppu.m7matrix[6] << 3)) >> 3;
  int vScroll = (cast(short)(ppu.m7matrix[7] << 3)) >> 3;
  int xCenter = (cast(short)(ppu.m7matrix[4] << 3)) >> 3;
  int yCenter = (cast(short)(ppu.m7matrix[5] << 3)) >> 3;
  int clippedH = hScroll - xCenter;
  int clippedV = vScroll - yCenter;
  clippedH = (clippedH & 0x2000) ? (clippedH | ~1023) : (clippedH & 1023);
  clippedV = (clippedV & 0x2000) ? (clippedV | ~1023) : (clippedV & 1023);
  bool mosaic_enabled = IS_MOSAIC_ENABLED(ppu, 0);
  if (mosaic_enabled)
    y = ppu.mosaicModulo[y];
  uint ry = ppu.m7yFlip ? 255 - y : y;
  uint m7startX = (ppu.m7matrix[0] * clippedH & ~63) + (ppu.m7matrix[1] * ry & ~63) +
    (ppu.m7matrix[1] * clippedV & ~63) + (xCenter << 8);
  uint m7startY = (ppu.m7matrix[2] * clippedH & ~63) + (ppu.m7matrix[3] * ry & ~63) +
    (ppu.m7matrix[3] * clippedV & ~63) + (yCenter << 8);
  for (size_t windex = 0; windex < win.nr; windex++) {
    if (win.bits & (1 << windex))
      continue;  // layer is disabled for this window part
    int x = win.edges[windex], x2 = win.edges[windex + 1], tile;
    PpuZbufType *dstz = &ppu.bgBuffers[sub].data[x + kPpuExtraLeftRight];
    PpuZbufType *dstz_end = &ppu.bgBuffers[sub].data.ptr[x2 + kPpuExtraLeftRight];
    uint rx = ppu.m7xFlip ? 255 - x : x;
    uint xpos = m7startX + ppu.m7matrix[0] * rx;
    uint ypos = m7startY + ppu.m7matrix[2] * rx;
    uint dx = ppu.m7xFlip ? -ppu.m7matrix[0] : ppu.m7matrix[0];
    uint dy = ppu.m7xFlip ? -ppu.m7matrix[2] : ppu.m7matrix[2];
    uint outside_value = ppu.m7largeField ? 0x3ffff : 0xffffffff;
    bool char_fill = ppu.m7charFill;
    if (mosaic_enabled) {
      int w = ppu.mosaicSize - (x - ppu.mosaicModulo[x]);
      do {
        w = IntMin(w, cast(int)(dstz_end - dstz));
        if ((uint)(xpos | ypos) > outside_value) {
          if (!char_fill)
            continue;
          tile = 0;
        } else {
          tile = ppu.vram[(ypos >> 11 & 0x7f) * 128 + (xpos >> 11 & 0x7f)] & 0xff;
        }
        ubyte pixel = ppu.vram[tile * 64 + (ypos >> 8 & 7) * 8 + (xpos >> 8 & 7)] >> 8;
        if (pixel) {
          int i = 0;
          do dstz[i] = cast(ushort)(pixel + z); while (++i != w);
        }
      } while (() { xpos += dx * w; ypos += dy * w; dstz += w; w = ppu.mosaicSize; return dstz_end - dstz != 0; }());
    } else {
      do {
        if ((uint)(xpos | ypos) > outside_value) {
          if (!char_fill)
            continue;
          tile = 0;
        } else {
          tile = ppu.vram[(ypos >> 11 & 0x7f) * 128 + (xpos >> 11 & 0x7f)] & 0xff;
        }
        ubyte pixel = ppu.vram[tile * 64 + (ypos >> 8 & 7) * 8 + (xpos >> 8 & 7)] >> 8;
        if (pixel)
          dstz[0] = cast(ushort)(pixel + z);
      } while (() { xpos += dx; ypos += dy; return ++dstz != dstz_end; }());
    }
  }
}

void PpuSetMode7PerspectiveCorrection(Ppu *ppu, int low, int high) {
  ppu.mode7PerspectiveLow = low ? 1.0f / low : 0.0f;
  ppu.mode7PerspectiveHigh = 1.0f / high;
}

void PpuSetExtraSideSpace(Ppu *ppu, int left, int right, int bottom) {
  ppu.extraLeftCur = cast(ubyte)UintMin(left, ppu.extraLeftRight);
  ppu.extraRightCur = cast(ubyte)UintMin(right, ppu.extraLeftRight);
  ppu.extraBottomCur = cast(ubyte)UintMin(bottom, 16);
}

private float FloatInterpolate(float x, float xmin, float xmax, float ymin, float ymax) {
  return ymin + (ymax - ymin) * (x - xmin) * (1.0f / (xmax - xmin));
}

// Upsampled version of mode7 rendering. Draws everything in 4x the normal resolution.
// Draws directly to the pixel buffer and bypasses any math, and supports only
// a subset of the normal features (all that zelda needs)
private void PpuDrawMode7Upsampled(Ppu *ppu, uint y) {
  // expand 13-bit values to signed values
  uint xCenter = (cast(short)(ppu.m7matrix[4] << 3)) >> 3, yCenter = (cast(short)(ppu.m7matrix[5] << 3)) >> 3;
  uint clippedH = ((cast(short)(ppu.m7matrix[6] << 3)) >> 3) - xCenter;
  uint clippedV = ((cast(short)(ppu.m7matrix[7] << 3)) >> 3) - yCenter;
  int[4] m0v;
  if (*cast(uint*)&ppu.mode7PerspectiveLow == 0) {
    m0v[0] = m0v[1] = m0v[2] = m0v[3] = ppu.m7matrix[0] << 12;
  } else {
    static const float[4] kInterpolateOffsets = [ -1, -1 + 0.25f, -1 + 0.5f, -1 + 0.75f ];
    for (int i = 0; i < 4; i++)
      m0v[i] = cast(int)(4096.0f / FloatInterpolate(cast(int)y + kInterpolateOffsets[i], 0, 223, ppu.mode7PerspectiveLow, ppu.mode7PerspectiveHigh));
  }
  size_t pitch = ppu.renderPitch;
  ubyte *render_buffer_ptr = &ppu.renderBuffer[(y - 1) * 4 * pitch];
  ubyte *dst_start = render_buffer_ptr + (ppu.extraLeftRight - ppu.extraLeftCur) * 16;
  size_t draw_width = 256 + ppu.extraLeftCur + ppu.extraRightCur;
  ubyte *dst_curline = dst_start;
  uint m1 = ppu.m7matrix[1] << 12;  // xpos increment per vert movement
  uint m2 = ppu.m7matrix[2] << 12;  // ypos increment per horiz movement
  for (int j = 0; j < 4; j++) {
    uint m0 = m0v[j], m3 = m0;
    uint xpos = m0 * clippedH + m1 * (clippedV + y) + (xCenter << 20), xcur;
    uint ypos = m2 * clippedH + m3 * (clippedV + y) + (yCenter << 20), ycur;

    uint tile, pixel;
    xpos -= (m0 + m1) >> 1;
    ypos -= (m2 + m3) >> 1;
    xcur = (xpos << 2) + j * m1;
    ycur = (ypos << 2) + j * m3;

    xcur -= ppu.extraLeftCur * 4 * m0;
    ycur -= ppu.extraLeftCur * 4 * m2;

    ubyte *dst = dst_curline;
    ubyte *dst_end = dst_curline + draw_width * 16;

void DRAW_PIXEL(int mode) {
    tile = ppu.vram[(ycur >> 25 & 0x7f) * 128 + (xcur >> 25 & 0x7f)] & 0xff;
    pixel = ppu.vram[tile * 64 + (ycur >> 22 & 7) * 8 + (xcur >> 22 & 7)] >> 8;
    pixel = (xcur & 0x80000000) ? 0 : pixel;
    *cast(uint*)dst = (mode ? (ppu.colorMapRgb[pixel] & 0xfefefe) >> 1 : ppu.colorMapRgb[pixel]);
    xcur += m0;
    ycur += m2;
    dst += 4;
  }

    if (!ppu.halfColor) {
      do {
        DRAW_PIXEL(0);
        DRAW_PIXEL(0);
        DRAW_PIXEL(0);
        DRAW_PIXEL(0);
      } while (dst != dst_end);
    } else {
      do {
        DRAW_PIXEL(1);
        DRAW_PIXEL(1);
        DRAW_PIXEL(1);
        DRAW_PIXEL(1);
      } while (dst != dst_end);
    }

    dst_curline += pitch;
  }

  if (ppu.lineHasSprites) {
    ubyte *dst = dst_start;
    PpuZbufType *pixels = &ppu.objBuffer.data[kPpuExtraLeftRight - ppu.extraLeftCur];
    for (size_t i = 0; i < draw_width; i++, dst += 16) {
      uint pixel = pixels[i] & 0xff;
      if (pixel) {
        uint color = ppu.colorMapRgb[pixel];
        (cast(uint *)dst)[3] = (cast(uint *)dst)[2] = (cast(uint *)dst)[1] = (cast(uint *)dst)[0] = color;
        (cast(uint *)(dst + pitch * 1))[3] = (cast(uint *)(dst + pitch * 1))[2] = (cast(uint *)(dst + pitch * 1))[1] = (cast(uint *)(dst + pitch * 1))[0] = color;
        (cast(uint *)(dst + pitch * 2))[3] = (cast(uint *)(dst + pitch * 2))[2] = (cast(uint *)(dst + pitch * 2))[1] = (cast(uint *)(dst + pitch * 2))[0] = color;
        (cast(uint *)(dst + pitch * 3))[3] = (cast(uint *)(dst + pitch * 3))[2] = (cast(uint *)(dst + pitch * 3))[1] = (cast(uint *)(dst + pitch * 3))[0] = color;
      }
    }
  }

  if (ppu.extraLeftRight - ppu.extraLeftCur != 0) {
    size_t n = 4 * uint.sizeof * (ppu.extraLeftRight - ppu.extraLeftCur);
    for(int i = 0; i < 4; i++)
      memset(render_buffer_ptr + pitch * i, 0, n);
  }
  if (ppu.extraLeftRight - ppu.extraRightCur != 0) {
    size_t n = 4 * uint.sizeof * (ppu.extraLeftRight - ppu.extraRightCur);
    for (int i = 0; i < 4; i++)
      memset(render_buffer_ptr + pitch * i + (256 + ppu.extraLeftRight * 2 - (ppu.extraLeftRight - ppu.extraRightCur)) * 4 * uint.sizeof, 0, n);
  }
}

private void PpuDrawBackgrounds(Ppu *ppu, int y, bool sub) {
// Top 4 bits contain the prio level, and bottom 4 bits the layer type.
// SPRITE_PRIO_TO_PRIO can be used to convert from obj prio to this prio.
//  15: BG3 tiles with priority 1 if bit 3 of $2105 is set
//  14: Sprites with priority 3 (4 * sprite_prio + 2)
//  12: BG1 tiles with priority 1
//  11: BG2 tiles with priority 1
//  10: Sprites with priority 2 (4 * sprite_prio + 2)
//  8: BG1 tiles with priority 0
//  7: BG2 tiles with priority 0
//  6: Sprites with priority 1 (4 * sprite_prio + 2)
//  3: BG3 tiles with priority 1 if bit 3 of $2105 is clear
//  2: Sprites with priority 0 (4 * sprite_prio + 2)
//  1: BG3 tiles with priority 0
//  0: backdrop

  if (ppu.mode == 1) {
    if (ppu.lineHasSprites)
      PpuDrawSprites(ppu, y, sub, true);

    if (IS_MOSAIC_ENABLED(ppu, 0))
      PpuDrawBackground_4bpp_mosaic(ppu, y, sub, 0, 0xc000, 0x8000);
    else
      PpuDrawBackground_4bpp(ppu, y, sub, 0, 0xc000, 0x8000);

    if (IS_MOSAIC_ENABLED(ppu, 1))
      PpuDrawBackground_4bpp_mosaic(ppu, y, sub, 1, 0xb100, 0x7100);
    else
      PpuDrawBackground_4bpp(ppu, y, sub, 1, 0xb100, 0x7100);

    if (IS_MOSAIC_ENABLED(ppu, 2))
      PpuDrawBackground_2bpp_mosaic(ppu, y, sub, 2, 0xf200, 0x1200);
    else
      PpuDrawBackground_2bpp(ppu, y, sub, 2, 0xf200, 0x1200);
  } else {
    // mode 7
    PpuDrawBackground_mode7(ppu, y, sub, 0xc000);
    if (ppu.lineHasSprites)
      PpuDrawSprites(ppu, y, sub, false);
  }
}

private void PpuDrawWholeLine(Ppu *ppu, uint y) {
  if (ppu.forcedBlank) {
    ubyte *dst = &ppu.renderBuffer[(y - 1) * ppu.renderPitch];
    size_t n = uint.sizeof * (256 + ppu.extraLeftRight * 2);
    memset(dst, 0, n);
    return;
  }

  if (ppu.mode == 7 && (ppu.renderFlags & kPpuRenderFlags_4x4Mode7)) {
    PpuDrawMode7Upsampled(ppu, y);
    return;
  }

  // Default background is backdrop
  ClearBackdrop(&ppu.bgBuffers[0]);

  // Render main screen
  PpuDrawBackgrounds(ppu, y, false);

  // The 6:th bit is automatically zero, math is never applied to the first half of the sprites.
  uint math_enabled = ppu.mathEnabled;

  // Render also the subscreen?
  bool rendered_subscreen = false;
  if (ppu.preventMathMode != 3 && ppu.addSubscreen && math_enabled) {
    ClearBackdrop(&ppu.bgBuffers[1]);
    if (ppu.screenEnabled[1] != 0) {
      PpuDrawBackgrounds(ppu, y, true);
      rendered_subscreen = true;
    }
  }

  // Color window affects the drawing mode in each region
  PpuWindows cwin;
  PpuWindows_Calc(&cwin, ppu, 5);
  static const ubyte[8] kCwBitsMod = [
    0x00, 0xff, 0xff, 0x00,
    0xff, 0x00, 0xff, 0x00,
  ];
  uint cw_clip_math = ((cwin.bits & kCwBitsMod[ppu.clipMode]) ^ kCwBitsMod[ppu.clipMode + 4]) |
                        ((cwin.bits & kCwBitsMod[ppu.preventMathMode]) ^ kCwBitsMod[ppu.preventMathMode + 4]) << 8;

  uint *dst = cast(uint*)&ppu.renderBuffer[(y - 1) * ppu.renderPitch];
  uint* dst_org = dst;
  
  dst += (ppu.extraLeftRight - ppu.extraLeftCur);

  uint windex = 0;
  do {
    uint left = cwin.edges[windex] + kPpuExtraLeftRight, right = cwin.edges[windex + 1] + kPpuExtraLeftRight;
    // If clip is set, then zero out the rgb values from the main screen.
    uint clip_color_mask = (cw_clip_math & 1) ? 0x1f : 0;
    uint math_enabled_cur = (cw_clip_math & 0x100) ? math_enabled : 0;
    uint fixed_color = ppu.fixedColorR | ppu.fixedColorG << 5 | ppu.fixedColorB << 10;
    if (math_enabled_cur == 0 || fixed_color == 0 && !ppu.halfColor && !rendered_subscreen) {
      // Math is disabled (or has no effect), so can avoid the per-pixel maths check
      uint i = left;
      do {
        uint color = ppu.cgram[ppu.bgBuffers[0].data[i] & 0xff];
        dst[0] = ppu.brightnessMult[color & clip_color_mask] << 16 |
                 ppu.brightnessMult[(color >> 5) & clip_color_mask] << 8 |
                 ppu.brightnessMult[(color >> 10) & clip_color_mask];
      } while (() { dst++; return ++i < right; }());
    } else {
      ubyte *half_color_map = ppu.halfColor ? &ppu.brightnessMultHalf[0] : &ppu.brightnessMult[0];
      // Store this in locals
      math_enabled_cur |= ppu.addSubscreen << 8 | ppu.subtractColor << 9;
      // Need to check for each pixel whether to use math or not based on the main screen layer.
      uint i = left;
      do {
        uint color = ppu.cgram[ppu.bgBuffers[0].data[i] & 0xff], color2;
        ubyte main_layer = (ppu.bgBuffers[0].data[i] >> 8) & 0xf;
        uint r = color & clip_color_mask;
        uint g = (color >> 5) & clip_color_mask;
        uint b = (color >> 10) & clip_color_mask;
        ubyte *color_map = &ppu.brightnessMult[0];
        if (math_enabled_cur & (1 << main_layer)) {
          if (math_enabled_cur & 0x100) {  // addSubscreen ?
            if ((ppu.bgBuffers[1].data[i] & 0xff) != 0)
              color2 = ppu.cgram[ppu.bgBuffers[1].data[i] & 0xff], color_map = half_color_map;
            else  // Don't halve if ppu.addSubscreen && backdrop
              color2 = fixed_color;
          } else {
            color2 = fixed_color, color_map = half_color_map;
          }
          uint r2 = (color2 & 0x1f), g2 = ((color2 >> 5) & 0x1f), b2 = ((color2 >> 10) & 0x1f);
          if (math_enabled_cur & 0x200) {  // subtractColor?
            r = (r >= r2) ? r - r2 : 0;
            g = (g >= g2) ? g - g2 : 0;
            b = (b >= b2) ? b - b2 : 0;
          } else {
            r += r2;
            g += g2;
            b += b2;
          }
        }
        dst[0] = color_map[b] | color_map[g] << 8 | color_map[r] << 16;
      } while (() { dst++; return ++i < right; }());
    }
  } while (() { cw_clip_math >>= 1; return ++windex < cwin.nr; }());

  // Clear out stuff on the sides.
  if (ppu.extraLeftRight - ppu.extraLeftCur != 0)
    memset(dst_org, 0, uint.sizeof * (ppu.extraLeftRight - ppu.extraLeftCur));
  if (ppu.extraLeftRight - ppu.extraRightCur != 0)
    memset(dst_org + (256 + ppu.extraLeftRight * 2 - (ppu.extraLeftRight - ppu.extraRightCur)), 0,
        uint.sizeof * (ppu.extraLeftRight - ppu.extraRightCur));
}

private void ppu_handlePixel(Ppu* ppu, int x, int y) {
  int r = 0, r2 = 0;
  int g = 0, g2 = 0;
  int b = 0, b2 = 0;
  if (!ppu.forcedBlank) {
    int mainLayer = ppu_getPixel(ppu, x, y, false, &r, &g, &b);

    bool colorWindowState = ppu_getWindowState(ppu, 5, x);
    if (
      ppu.clipMode == 3 ||
      (ppu.clipMode == 2 && colorWindowState) ||
      (ppu.clipMode == 1 && !colorWindowState)
      ) {
      r = g = b = 0;
    }
    int secondLayer = 5; // backdrop
    bool mathEnabled = mainLayer < 6 && (ppu.mathEnabled & (1 << mainLayer)) && !(
      ppu.preventMathMode == 3 ||
      (ppu.preventMathMode == 2 && colorWindowState) ||
      (ppu.preventMathMode == 1 && !colorWindowState)
      );
    if ((mathEnabled && ppu.addSubscreen) || ppu.mode == 5 || ppu.mode == 6) {
      secondLayer = ppu_getPixel(ppu, x, y, true, &r2, &g2, &b2);
    }
    // TODO: subscreen pixels can be clipped to black as well
    // TODO: math for subscreen pixels (add/sub sub to main)
    if (mathEnabled) {
      if (ppu.subtractColor) {
        r -= (ppu.addSubscreen && secondLayer != 5) ? r2 : ppu.fixedColorR;
        g -= (ppu.addSubscreen && secondLayer != 5) ? g2 : ppu.fixedColorG;
        b -= (ppu.addSubscreen && secondLayer != 5) ? b2 : ppu.fixedColorB;
      } else {
        r += (ppu.addSubscreen && secondLayer != 5) ? r2 : ppu.fixedColorR;
        g += (ppu.addSubscreen && secondLayer != 5) ? g2 : ppu.fixedColorG;
        b += (ppu.addSubscreen && secondLayer != 5) ? b2 : ppu.fixedColorB;
      }
      if (ppu.halfColor && (secondLayer != 5 || !ppu.addSubscreen)) {
        r >>= 1;
        g >>= 1;
        b >>= 1;
      }
      if (r > 31) r = 31;
      if (g > 31) g = 31;
      if (b > 31) b = 31;
      if (r < 0) r = 0;
      if (g < 0) g = 0;
      if (b < 0) b = 0;
    }
    if (!(ppu.mode == 5 || ppu.mode == 6)) {
      r2 = r; g2 = g; b2 = b;
    }
  }
  int row = y - 1;
  ubyte *pixelBuffer = cast(ubyte*) &ppu.renderBuffer[row * ppu.renderPitch + (x + ppu.extraLeftRight) * 4];
  pixelBuffer[0] = cast(ubyte)(((b << 3) | (b >> 2)) * ppu.brightness / 15);
  pixelBuffer[1] = cast(ubyte)(((g << 3) | (g >> 2)) * ppu.brightness / 15);
  pixelBuffer[2] = cast(ubyte)(((r << 3) | (r >> 2)) * ppu.brightness / 15);
  pixelBuffer[3] = 0;
}

immutable int[4][10] bitDepthsPerMode = [
  [2, 2, 2, 2],
  [4, 4, 2, 5],
  [4, 4, 5, 5],
  [8, 4, 5, 5],
  [8, 2, 5, 5],
  [4, 2, 5, 5],
  [4, 5, 5, 5],
  [8, 5, 5, 5],
  [4, 4, 2, 5],
  [8, 7, 5, 5]
];

private int ppu_getPixel(Ppu *ppu, int x, int y, bool sub, int *r, int *g, int *b) {
  // array for layer definitions per mode:
//   0-7: mode 0-7; 8: mode 1 + l3prio; 9: mode 7 + extbg

//   0-3; layers 1-4; 4: sprites; 5: nonexistent
  static immutable int[12][10] layersPerMode = [
    [4, 0, 1, 4, 0, 1, 4, 2, 3, 4, 2, 3],
    [4, 0, 1, 4, 0, 1, 4, 2, 4, 2, 5, 5],
    [4, 0, 4, 1, 4, 0, 4, 1, 5, 5, 5, 5],
    [4, 0, 4, 1, 4, 0, 4, 1, 5, 5, 5, 5],
    [4, 0, 4, 1, 4, 0, 4, 1, 5, 5, 5, 5],
    [4, 0, 4, 1, 4, 0, 4, 1, 5, 5, 5, 5],
    [4, 0, 4, 4, 0, 4, 5, 5, 5, 5, 5, 5],
    [4, 4, 4, 0, 4, 5, 5, 5, 5, 5, 5, 5],
    [2, 4, 0, 1, 4, 0, 1, 4, 4, 2, 5, 5],
    [4, 4, 1, 4, 0, 4, 1, 5, 5, 5, 5, 5]
  ];

  static immutable int[12][10] prioritysPerMode = [
    [3, 1, 1, 2, 0, 0, 1, 1, 1, 0, 0, 0],
    [3, 1, 1, 2, 0, 0, 1, 1, 0, 0, 5, 5],
    [3, 1, 2, 1, 1, 0, 0, 0, 5, 5, 5, 5],
    [3, 1, 2, 1, 1, 0, 0, 0, 5, 5, 5, 5],
    [3, 1, 2, 1, 1, 0, 0, 0, 5, 5, 5, 5],
    [3, 1, 2, 1, 1, 0, 0, 0, 5, 5, 5, 5],
    [3, 1, 2, 1, 0, 0, 5, 5, 5, 5, 5, 5],
    [3, 2, 1, 0, 0, 5, 5, 5, 5, 5, 5, 5],
    [1, 3, 1, 1, 2, 0, 0, 1, 0, 0, 5, 5],
    [3, 2, 1, 1, 0, 0, 0, 5, 5, 5, 5, 5]
  ];

  static immutable int[10] layerCountPerMode = [
    12, 10, 8, 8, 8, 8, 6, 5, 10, 7
  ];

  
  // figure out which color is on this location on main- or subscreen, sets it in r, g, b
  // returns which layer it is: 0-3 for bg layer, 4 or 6 for sprites (depending on palette), 5 for backdrop
  int actMode = ppu.mode == 1 ? 8 : ppu.mode;
  actMode = ppu.mode == 7 && ppu.m7extBg_always_zero ? 9 : actMode;
  int layer = 5;
  int pixel = 0;
  for (int i = 0; i < layerCountPerMode[actMode]; i++) {
    int curLayer = layersPerMode[actMode][i];
    int curPriority = prioritysPerMode[actMode][i];
    bool layerActive = false;
    if (!sub) {
      layerActive = IS_SCREEN_ENABLED(ppu, 0, curLayer) && (
        !IS_SCREEN_WINDOWED(ppu, 0, curLayer) || !ppu_getWindowState(ppu, curLayer, x)
        );
    } else {
      layerActive = IS_SCREEN_ENABLED(ppu, 1, curLayer) && (
        !IS_SCREEN_WINDOWED(ppu, 1, curLayer) || !ppu_getWindowState(ppu, curLayer, x)
        );
    }
    if (layerActive) {
      if (curLayer < 4) {
        // bg layer
        int lx = x;
        int ly = y;
        if (IS_MOSAIC_ENABLED(ppu, curLayer)) {
          lx -= lx % ppu.mosaicSize;
          ly -= (ly - 1) % ppu.mosaicSize;
        }
        if (ppu.mode == 7) {
          pixel = ppu_getPixelForMode7(ppu, lx, curLayer, !!curPriority);
        } else {
          lx += ppu.bgLayer[curLayer].hScroll;
          ly += ppu.bgLayer[curLayer].vScroll;
          pixel = ppu_getPixelForBgLayer(
            ppu, lx & 0x3ff, ly & 0x3ff,
            curLayer, !!curPriority
          );
        }
      } else {
        // get a pixel from the sprite buffer
        pixel = 0;
        if ((ppu.objBuffer.data[x + kPpuExtraLeftRight] >> 12) == SPRITE_PRIO_TO_PRIO_HI(curPriority))
          pixel = ppu.objBuffer.data[x + kPpuExtraLeftRight] & 0xff;
      }
    }
    if (pixel > 0) {
      layer = curLayer;
      break;
    }
  }
  ushort color = ppu.cgram[pixel & 0xff];
  *r = color & 0x1f;
  *g = (color >> 5) & 0x1f;
  *b = (color >> 10) & 0x1f;
  if (layer == 4 && pixel < 0xc0) layer = 6; // sprites with palette color < 0xc0
  return layer;

}


private int ppu_getPixelForBgLayer(Ppu *ppu, int x, int y, int layer, bool priority) {
  BgLayer *layerp = &ppu.bgLayer[layer];
  // figure out address of tilemap word and read it
  bool wideTiles = ppu.mode == 5 || ppu.mode == 6;
  int tileBitsX = wideTiles ? 4 : 3;
  int tileHighBitX = wideTiles ? 0x200 : 0x100;
  int tileBitsY = 3;
  int tileHighBitY = 0x100;
  ushort tilemapAdr = cast(ushort)(layerp.tilemapAdr + (((y >> tileBitsY) & 0x1f) << 5 | ((x >> tileBitsX) & 0x1f)));
  if ((x & tileHighBitX) && layerp.tilemapWider) tilemapAdr += 0x400;
  if ((y & tileHighBitY) && layerp.tilemapHigher) tilemapAdr += layerp.tilemapWider ? 0x800 : 0x400;
  ushort tile = ppu.vram[tilemapAdr & 0x7fff];
  // check priority, get palette
  if ((cast(bool)(tile & 0x2000)) != priority) return 0; // wrong priority
  int paletteNum = (tile & 0x1c00) >> 10;
  // figure out position within tile
  int row = (tile & 0x8000) ? 7 - (y & 0x7) : (y & 0x7);
  int col = (tile & 0x4000) ? (x & 0x7) : 7 - (x & 0x7);
  int tileNum = tile & 0x3ff;
  if (wideTiles) {
    // if unflipped right half of tile, or flipped left half of tile
    if ((cast(bool)(x & 8)) ^ (cast(bool)(tile & 0x4000))) tileNum += 1;
  }
  // read tiledata, ajust palette for mode 0
  int bitDepth = bitDepthsPerMode[ppu.mode][layer];
  if (ppu.mode == 0) paletteNum += 8 * layer;
  // plane 1 (always)
  int paletteSize = 4;
  ushort plane1 = ppu.vram[(layerp.tileAdr + ((tileNum & 0x3ff) * 4 * bitDepth) + row) & 0x7fff];
  int pixel = (plane1 >> col) & 1;
  pixel |= ((plane1 >> (8 + col)) & 1) << 1;
  // plane 2 (for 4bpp, 8bpp)
  if (bitDepth > 2) {
    paletteSize = 16;
    ushort plane2 = ppu.vram[(layerp.tileAdr + ((tileNum & 0x3ff) * 4 * bitDepth) + 8 + row) & 0x7fff];
    pixel |= ((plane2 >> col) & 1) << 2;
    pixel |= ((plane2 >> (8 + col)) & 1) << 3;
  }
  // plane 3 & 4 (for 8bpp)
  if (bitDepth > 4) {
    paletteSize = 256;
    ushort plane3 = ppu.vram[(layerp.tileAdr + ((tileNum & 0x3ff) * 4 * bitDepth) + 16 + row) & 0x7fff];
    pixel |= ((plane3 >> col) & 1) << 4;
    pixel |= ((plane3 >> (8 + col)) & 1) << 5;
    ushort plane4 = ppu.vram[(layerp.tileAdr + ((tileNum & 0x3ff) * 4 * bitDepth) + 24 + row) & 0x7fff];
    pixel |= ((plane4 >> col) & 1) << 6;
    pixel |= ((plane4 >> (8 + col)) & 1) << 7;
  }
  // return cgram index, or 0 if transparent, palette number in bits 10-8 for 8-color layers
  return pixel == 0 ? 0 : paletteSize * paletteNum + pixel;
}

private void ppu_calculateMode7Starts(Ppu* ppu, int y) {
  // expand 13-bit values to signed values
  int hScroll = (cast(short) (ppu.m7matrix[6] << 3)) >> 3;
  int vScroll = (cast(short) (ppu.m7matrix[7] << 3)) >> 3;
  int xCenter = (cast(short) (ppu.m7matrix[4] << 3)) >> 3;
  int yCenter = (cast(short) (ppu.m7matrix[5] << 3)) >> 3;
  // do calculation
  int clippedH = hScroll - xCenter;
  int clippedV = vScroll - yCenter;
  clippedH = (clippedH & 0x2000) ? (clippedH | ~1023) : (clippedH & 1023);
  clippedV = (clippedV & 0x2000) ? (clippedV | ~1023) : (clippedV & 1023);
  if(IS_MOSAIC_ENABLED(ppu, 0)) {
    y -= (y - 1) % ppu.mosaicSize;
  }
  ubyte ry = cast(ubyte)(ppu.m7yFlip ? 255 - y : y);
  ppu.m7startX = (
    ((ppu.m7matrix[0] * clippedH) & ~63) +
    ((ppu.m7matrix[1] * ry) & ~63) +
    ((ppu.m7matrix[1] * clippedV) & ~63) +
    (xCenter << 8)
  );
  ppu.m7startY = (
    ((ppu.m7matrix[2] * clippedH) & ~63) +
    ((ppu.m7matrix[3] * ry) & ~63) +
    ((ppu.m7matrix[3] * clippedV) & ~63) +
    (yCenter << 8)
  );
}

private int ppu_getPixelForMode7(Ppu* ppu, int x, int layer, bool priority) {
  if (IS_MOSAIC_ENABLED(ppu, layer))
    x -= x % ppu.mosaicSize;
  ubyte rx = cast(ubyte)(ppu.m7xFlip ? 255 - x : x);
  int xPos = (ppu.m7startX + ppu.m7matrix[0] * rx) >> 8;
  int yPos = (ppu.m7startY + ppu.m7matrix[2] * rx) >> 8;
  bool outsideMap = xPos < 0 || xPos >= 1024 || yPos < 0 || yPos >= 1024;
  xPos &= 0x3ff;
  yPos &= 0x3ff;
  if(!ppu.m7largeField) outsideMap = false;
  ubyte tile = outsideMap ? 0 : ppu.vram[(yPos >> 3) * 128 + (xPos >> 3)] & 0xff;
  ubyte pixel = outsideMap && !ppu.m7charFill ? 0 : ppu.vram[tile * 64 + (yPos & 7) * 8 + (xPos & 7)] >> 8;
  if(layer == 1) {
    if((cast(bool) (pixel & 0x80)) != priority) return 0;
    return pixel & 0x7f;
  }
  return pixel;
}

private bool ppu_getWindowState(Ppu* ppu, int layer, int x) {
  uint winflags = GET_WINDOW_FLAGS(ppu, layer);
  if (!(winflags & kWindow1Enabled) && !(winflags & kWindow2Enabled)) {
    return false;
  }
  if ((winflags & kWindow1Enabled) && !(winflags & kWindow2Enabled)) {
    bool test = x >= ppu.window1left && x <= ppu.window1right;
    return (winflags & kWindow1Inversed) ? !test : test;
  }
  if (!(winflags & kWindow1Enabled) && (winflags & kWindow2Enabled)) {
    bool test = x >= ppu.window2left && x <= ppu.window2right;
    return (winflags & kWindow2Inversed) ? !test : test;
  }
  bool test1 = x >= ppu.window1left && x <= ppu.window1right;
  bool test2 = x >= ppu.window2left && x <= ppu.window2right;
  if (winflags & kWindow1Inversed) test1 = !test1;
  if (winflags & kWindow2Inversed) test2 = !test2;
  return test1 || test2;
}

private bool ppu_evaluateSprites(Ppu* ppu, int line) {
  // TODO: iterate over oam normally to determine in-range sprites,
  //   then iterate those in-range sprites in reverse for tile-fetching
  // TODO: rectangular sprites, wierdness with sprites at -256
  int index = 0, index_end = index;
  int spritesLeft = 32 + 1, tilesLeft = 34 + 1;
  ubyte[2] spriteSizes = [ kSpriteSizes[ppu.objSize][0], kSpriteSizes[ppu.objSize][1] ];
  int extra_left_right = ppu.extraLeftRight;
  if (ppu.renderFlags & kPpuRenderFlags_NoSpriteLimits)
    spritesLeft = tilesLeft = 1024;
  int tilesLeftOrg = tilesLeft;

  do {
    int yy = ppu.oam[index] >> 8;
    if (yy == 0xf0)
      continue;  // this works for zelda because sprites are always 8 or 16.
    // check if the sprite is on this line and get the sprite size
    int row = (line - yy) & 0xff;
    int highOam = ppu.oam[0x100 + (index >> 4)] >> (index & 15);
    int spriteSize = spriteSizes[(highOam >> 1) & 1];
    if (row >= spriteSize)
      continue;
    // in y-range, get the x location, using the high bit as well
    int x = (ppu.oam[index] & 0xff) + (highOam & 1) * 256;
    x -= (x >= 256 + extra_left_right) * 512;
    // if in x-range
    if (x <= -(spriteSize + extra_left_right))
      continue;
    // break if we found 32 sprites already
    if (--spritesLeft == 0) {
      break;
    }
    // get some data for the sprite and y-flip row if needed
    int oam1 = ppu.oam[index + 1];
    int objAdr = (oam1 & 0x100) ? ppu.objTileAdr2 : ppu.objTileAdr1;
    if (oam1 & 0x8000)
      row = spriteSize - 1 - row;
    // fetch all tiles in x-range
    int paletteBase = 0x80 + 16 * ((oam1 & 0xe00) >> 9);
    int prio = SPRITE_PRIO_TO_PRIO((oam1 & 0x3000) >> 12, (oam1 & 0x800) == 0);
    PpuZbufType z = cast(ushort)(paletteBase + (prio << 8));
    
    for (int col = 0; col < spriteSize; col += 8) {
      if (col + x > -8 - extra_left_right && col + x < 256 + extra_left_right) {
        // break if we found 34 8*1 slivers already
        if (--tilesLeft == 0) {
          return true;
        }
        // figure out which tile this uses, looping within 16x16 pages, and get it's data
        int usedCol = oam1 & 0x4000 ? spriteSize - 1 - col : col;
        int usedTile = ((((oam1 & 0xff) >> 4) + (row >> 3)) << 4) | (((oam1 & 0xf) + (usedCol >> 3)) & 0xf);
        ushort *addr = &ppu.vram[(objAdr + usedTile * 16 + (row & 0x7)) & 0x7fff];
        uint plane = addr[0] | addr[8] << 16;
        // go over each pixel
        int px_left = IntMax(-(col + x + kPpuExtraLeftRight), 0);
        int px_right = IntMin(256 + kPpuExtraLeftRight - (col + x), 8);
        PpuZbufType *dst = &ppu.objBuffer.data[col + x + px_left + kPpuExtraLeftRight];
        
        for (int px = px_left; px < px_right; px++, dst++) {
          int shift = oam1 & 0x4000 ? px : 7 - px;
          uint bits = plane >> shift;
          int pixel = (bits >> 0) & 1 | (bits >> 7) & 2 | (bits >> 14) & 4 | (bits >> 21) & 8;
          // draw it in the buffer if there is a pixel here, and the buffer there is still empty
          if (pixel != 0 && (dst[0] & 0xff) == 0)
            dst[0] = cast(ushort)(z + pixel);
        }
      }
    }
  } while ((index = (index + 2) & 0xff) != index_end);
  return (tilesLeft != tilesLeftOrg);
}

ubyte ppu_read(Ppu* ppu, ubyte adr) {
  switch (adr) {
  case 0x34:
  case 0x35:
  case 0x36: {
    int result = ppu.m7matrix[0] * (ppu.m7matrix[1] >> 8);
    return (result >> (8 * (adr - 0x34))) & 0xff;
  }
  default: break;
  }
  return 0xff;
}

void ppu_write(Ppu* ppu, ubyte adr, ubyte val) {
  switch(adr) {
    case 0x00: {  // INIDISP
      ppu.brightness = val & 0xf;
      ppu.forcedBlank = !!(val & 0x80);
      break;
    }
    case 0x01: {
      //assert(val == 2);
      break;
    }
    case 0x02: {
      ppu.oamAdr = (ppu.oamAdr & ~0xff) | val;
      ppu.oamSecondWrite = false;
      break;
    }
    case 0x03: {
      //assert((val & 0x80) == 0);
      ppu.oamAdr = (ppu.oamAdr & ~0xff00) | ((val & 1) << 8);
      ppu.oamSecondWrite = false;
      break;
    }
    case 0x04: {
      if (!ppu.oamSecondWrite) {
        ppu.oamBuffer = val;
      } else {
        if (ppu.oamAdr < 0x110)
          ppu.oam[ppu.oamAdr++] = (val << 8) | ppu.oamBuffer;
      }
      ppu.oamSecondWrite = !ppu.oamSecondWrite;
      break;
    }
    case 0x05: {  // BGMODE
      ppu.mode = val & 0x7;
      //assert(val == 7 || val == 9);
      //assert(ppu.mode == 1 || ppu.mode == 7);
      //assert((val & 0xf0) == 0);
      break;
    }
    case 0x06: {  // MOSAIC
      ppu.mosaicSize = (val >> 4) + 1;
      ppu.mosaicEnabled = (ppu.mosaicSize > 1) ? val : 0;
      break;
    }
    case 0x07:  // BG1SC
    case 0x08:
    case 0x09:
    case 0x0a: {
      // small tilemaps are used in attract intro
      ppu.bgLayer[adr - 7].tilemapWider = val & 0x1;
      ppu.bgLayer[adr - 7].tilemapHigher = !!(val & 0x2);
      ppu.bgLayer[adr - 7].tilemapAdr = (val & 0xfc) << 8;
      break;
    }
    case 0x0b: {  // BG12NBA
      ppu.bgLayer[0].tileAdr = (val & 0xf) << 12;
      ppu.bgLayer[1].tileAdr = (val & 0xf0) << 8;
      break;
    }
    case 0x0c: { // BG34NBA
      ppu.bgLayer[2].tileAdr = (val & 0xf) << 12;
      ppu.bgLayer[3].tileAdr = (val & 0xf0) << 8;
      break;
    }
    case 0x0d: { // BG1HOFS
      ppu.m7matrix[6] = ((val << 8) | ppu.m7prev) & 0x1fff;
      ppu.m7prev = val;
      goto case;
    }
    case 0x0f:
    case 0x11:
    case 0x13: {
      ppu.bgLayer[(adr - 0xd) / 2].hScroll = ((val << 8) | (ppu.scrollPrev & 0xf8) | (ppu.scrollPrev2 & 0x7)) & 0x3ff;
      ppu.scrollPrev = val;
      ppu.scrollPrev2 = val;
      break;
    }
    case 0x0e: { // BG1VOFS
      ppu.m7matrix[7] = ((val << 8) | ppu.m7prev) & 0x1fff;
      ppu.m7prev = val;
      goto case;
    }
    case 0x10:
    case 0x12:
    case 0x14: {
      ppu.bgLayer[(adr - 0xe) / 2].vScroll = ((val << 8) | ppu.scrollPrev) & 0x3ff;
      ppu.scrollPrev = val;
      break;
    }
    case 0x15: {  // VMAIN
      if((val & 3) == 0) {
        ppu.vramIncrement = 1;
      } else if((val & 3) == 1) {
        ppu.vramIncrement = 32;
      } else {
        ppu.vramIncrement = 128;
      }
      //assert(((val & 0xc) >> 2) == 0);
      ppu.vramIncrementOnHigh = !!(val & 0x80);
      break;
    }
    case 0x16: {  // VMADDL
      ppu.vramPointer = (ppu.vramPointer & 0xff00) | val;
      break;
    }
    case 0x17: {  // VMADDH
      ppu.vramPointer = (ppu.vramPointer & 0x00ff) | (val << 8);
      break;
    }
    case 0x18: {  // VMDATAL
      ushort vramAdr = ppu.vramPointer;
      ppu.vram[vramAdr & 0x7fff] = (ppu.vram[vramAdr & 0x7fff] & 0xff00) | val;
      if(!ppu.vramIncrementOnHigh) ppu.vramPointer += ppu.vramIncrement;
      break;
    }
    case 0x19: {  // VMDATAH
      ushort vramAdr = ppu.vramPointer;
      ppu.vram[vramAdr & 0x7fff] = (ppu.vram[vramAdr & 0x7fff] & 0x00ff) | (val << 8);
      if(ppu.vramIncrementOnHigh) ppu.vramPointer += ppu.vramIncrement;
      break;
    }
    case 0x1a: {  // M7SEL
      //assert(val == 0x80);
      ppu.m7largeField = !!(val & 0x80);
      ppu.m7charFill = !!(val & 0x40);
      ppu.m7yFlip = !!(val & 0x2);
      ppu.m7xFlip = val & 0x1;
      break;
    }
    case 0x1b:  // M7A etc
    case 0x1c:
    case 0x1d:
    case 0x1e: {
      ppu.m7matrix[adr - 0x1b] = cast(short)((val << 8) | ppu.m7prev);
      ppu.m7prev = val;
      break;
    }
    case 0x1f:
    case 0x20: {
      ppu.m7matrix[adr - 0x1b] = ((val << 8) | ppu.m7prev) & 0x1fff;
      ppu.m7prev = val;
      break;
    }
    case 0x21: {
      ppu.cgramPointer = val;
      ppu.cgramSecondWrite = false;
      break;
    }
    case 0x22: {
      if(!ppu.cgramSecondWrite) {
        ppu.cgramBuffer = val;
      } else {
        ppu.cgram[ppu.cgramPointer++] = (val << 8) | ppu.cgramBuffer;
      }
      ppu.cgramSecondWrite = !ppu.cgramSecondWrite;
      break;
    }
    case 0x23:  // W12SEL
      ppu.windowsel = (ppu.windowsel & ~0xff) | val;
      break;
    case 0x24:  // W34SEL
      ppu.windowsel = (ppu.windowsel & ~0xff00) | (val << 8);
      break;
    case 0x25:  // WOBJSEL
      ppu.windowsel = (ppu.windowsel & ~0xff0000) | (val << 16);
      break;
    case 0x26:
      ppu.window1left = val;
      break;
    case 0x27:
      ppu.window1right = val;
      break;
    case 0x28:
      ppu.window2left = val;
      break;
    case 0x29:
      ppu.window2right = val;
      break;
    case 0x2a:  // WBGLOG
      //assert(val == 0);
      break;
    case 0x2b:  // WOBJLOG
      //assert(val == 0);
      break;
    case 0x2c:  // TM
      ppu.screenEnabled[0] = val;
      break;
    case 0x2d:  // TS
      ppu.screenEnabled[1] = val;
      break;
    case 0x2e: // TMW
      ppu.screenWindowed[0] = val;
      break;
    case 0x2f:  // TSW
      ppu.screenWindowed[1] = val;
      break;
    case 0x30: {  // CGWSEL
      //assert((val & 1) == 0);  // directColor always zero
      ppu.addSubscreen = !!(val & 0x2);
      ppu.preventMathMode = (val & 0x30) >> 4;
      ppu.clipMode = (val & 0xc0) >> 6;
      break;
    }
    case 0x31: {  // CGADSUB
      ppu.subtractColor = !!(val & 0x80);
      ppu.halfColor = !!(val & 0x40);
      ppu.mathEnabled = val & 0x3f;
      break;
    }
    case 0x32: {  // COLDATA
      if(val & 0x80) ppu.fixedColorB = val & 0x1f;
      if(val & 0x40) ppu.fixedColorG = val & 0x1f;
      if(val & 0x20) ppu.fixedColorR = val & 0x1f;
      break;
    }
    case 0x33: {
      //assert(val == 0);
      ppu.m7extBg_always_zero = !!(val & 0x40);
      break;
    }
    default: {
      break;
    }
  }
}
