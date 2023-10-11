/**
 * MIT License

Copyright (c) 2023 Herringway
Copyright (c) 2022 snesrev
Copyright (c) 2021 elzo_d

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE
*/

import std.algorithm.comparison;
import std.algorithm.mutation;

struct BGLayer {
	ushort hScroll = 0;
	ushort vScroll = 0;
	// -- snapshot starts here
	bool tilemapWider = false;
	bool tilemapHigher = false;
	ushort tilemapAdr = 0;
	// -- snapshot ends here
	ushort tileAdr = 0;
}

enum kPpuExtraLeftRight = 88;

enum {
	kPpuXPixels = 256 + kPpuExtraLeftRight * 2,
};

alias PpuZbufType = ushort;

struct PpuPixelPrioBufs {
	// This holds the prio in the upper 8 bits and the color in the lower 8 bits.
	PpuZbufType[kPpuXPixels] data;
}

int IntMin(int a, int b) @safe pure { return a < b ? a : b; }
int IntMax(int a, int b) @safe pure { return a > b ? a : b; }
uint UintMin(uint a, uint b) @safe pure { return a < b ? a : b; }

enum KPPURenderFlags {
	newRenderer = 1,
	// Render mode7 upsampled by 4x4
	mode74x4 = 2,
	// Use 240 height instead of 224
	height240 = 4,
	// Disable sprite render limits
	noSpriteLimits = 8,
}

struct PPU {
	bool lineHasSprites;
	ubyte lastBrightnessMult = 0xff;
	ubyte lastMosaicModulo = 0xff;
	ubyte renderFlags;
	uint renderPitch;
	ubyte[] renderBuffer;
	ubyte extraLeftCur = 0;
	ubyte extraRightCur = 0;
	ubyte extraLeftRight = 0;
	ubyte extraBottomCur = 0;
	float mode7PerspectiveLow, mode7PerspectiveHigh;

	// TMW / TSW etc
	ubyte[2] screenEnabled;
	ubyte[2] screenWindowed;
	ubyte mosaicEnabled;
	ubyte mosaicSize = 1;
	// object/sprites
	ushort objTileAdr1 = 0x4000;
	ushort objTileAdr2 = 0x5000;
	ubyte objSize = 0;
	// Window
	ubyte window1left = 0;
	ubyte window1right = 0;
	ubyte window2left = 0;
	ubyte window2right = 0;
	uint windowsel = 0;

	// color math
	ubyte clipMode = 0;
	ubyte preventMathMode = 0;
	bool addSubscreen = false;
	bool subtractColor = false;
	bool halfColor = false;
	ubyte mathEnabled = 0;
	ubyte fixedColorR = 0;
	ubyte fixedColorG = 0;
	ubyte fixedColorB = 0;
	// settings
	bool forcedBlank = true;
	ubyte brightness = 0;
	ubyte mode = 0;

	// vram access
	ushort vramPointer = 0;
	ushort vramIncrement = 1;
	bool vramIncrementOnHigh = false;
	// cgram access
	ubyte cgramPointer = 0;
	bool cgramSecondWrite = false;
	ubyte cgramBuffer = 0;
	// oam access
	ushort oamAdr = 0;
	bool oamSecondWrite = false;
	ubyte oamBuffer = 0;

	// background layers
	BGLayer[4] bgLayer;
	ubyte scrollPrev = 0;
	ubyte scrollPrev2 = 0;

	// mode 7
	short[8] m7matrix; // a, b, c, d, x, y, h, v
	ubyte m7prev = 0;
	bool m7largeField = true;
	bool m7charFill = false;
	bool m7xFlip = false;
	bool m7yFlip = false;
	bool m7extBg_always_zero = false;
	// mode 7 internal
	int m7startX = 0;
	int m7startY = 0;

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

	int getCurrentRenderScale(uint render_flags) @safe pure {
		bool hq = mode == 7 && !forcedBlank && (render_flags & (KPPURenderFlags.mode74x4 | KPPURenderFlags.newRenderer)) == (KPPURenderFlags.mode74x4 | KPPURenderFlags.newRenderer);
		return hq ? 4 : 1;
	}

	void beginDrawing(ubyte[] pixels, size_t pitch, uint render_flags) @safe pure {
		renderFlags = cast(ubyte)render_flags;
		renderPitch = cast(uint)pitch;
		renderBuffer = pixels;

		// Cache the brightness computation
		if (brightness != lastBrightnessMult) {
			ubyte ppu_brightness = brightness;
			lastBrightnessMult = ppu_brightness;
			for (int i = 0; i < 32; i++) {
				brightnessMultHalf[i * 2] = brightnessMultHalf[i * 2 + 1] = brightnessMult[i] = cast(ubyte)(((i << 3) | (i >> 2)) * ppu_brightness / 15);
			}
			// Store 31 extra entries to remove the need for clamping to 31.
			brightnessMult[32 .. 63] = brightnessMult[31];
		}

		if (getCurrentRenderScale(renderFlags) == 4) {
			for (int i = 0; i < colorMapRgb.length; i++) {
				uint color = cgram[i];
				colorMapRgb[i] = brightnessMult[color & 0x1f] << 16 | brightnessMult[(color >> 5) & 0x1f] << 8 | brightnessMult[(color >> 10) & 0x1f];
			}
		}
	}

	private void ClearBackdrop(ref PpuPixelPrioBufs buf) @safe pure {
		(cast(ulong[])buf.data)[] = 0x0500050005000500;
	}


	void runLine(int line) @safe pure {
		if(line != 0) {
			if (mosaicSize != lastMosaicModulo) {
				int mod = mosaicSize;
				lastMosaicModulo = cast(ubyte)mod;
				for (int i = 0, j = 0; i < mosaicModulo.length; i++) {
					mosaicModulo[i] = cast(ubyte)(i - j);
					j = (j + 1 == mod ? 0 : j + 1);
				}
			}
			// evaluate sprites
			ClearBackdrop(objBuffer);
			lineHasSprites = !forcedBlank && evaluateSprites(line - 1);

			// outside of visible range?
			if (line >= 225 + extraBottomCur) {
				renderBuffer[(line - 1) * renderPitch .. (line - 1) * renderPitch + uint.sizeof * (256 + extraLeftRight * 2)] = 0;
				return;
			}

			if (renderFlags & KPPURenderFlags.newRenderer) {
				drawWholeLine(line);
			} else {
				if (mode == 7) {
					calculateMode7Starts(line);
				}
				for (int x = 0; x < 256; x++) {
					handlePixel(x, line);
				}

				ubyte[] dst = renderBuffer[(line - 1) * renderPitch .. $];
				if (extraLeftRight != 0) {
					dst[0 .. uint.sizeof * extraLeftRight] = 0;
					dst[uint.sizeof * (256 + extraLeftRight) .. uint.sizeof * (257 + extraLeftRight)] = 0;
				}
			}
		}
	}

	private void windowsClear(ref PpuWindows win, uint layer) @safe pure {
		win.edges[0] = -(layer != 2 ? extraLeftCur : 0);
		win.edges[1] = 256 + (layer != 2 ? extraRightCur : 0);
		win.nr = 1;
		win.bits = 0;
	}

	private void windowsCalc(ref PpuWindows win, uint layer) @safe pure {
		// Evaluate which spans to render based on the window settings.
		// There are at most 5 windows.
		// Algorithm from Snes9x
		uint winflags = GET_WINDOW_FLAGS(layer);
		uint nr = 1;
		int window_right = 256 + (layer != 2 ? extraRightCur : 0);
		win.edges[0] = - (layer != 2 ? extraLeftCur : 0);
		win.edges[1] = cast(short)window_right;
		uint i, j;
		int t;
		bool w1_ena = (winflags & kWindow1Enabled) && window1left <= window1right;
		if (w1_ena) {
			if (window1left > win.edges[0]) {
				win.edges[nr] = window1left;
				win.edges[++nr] = cast(short)window_right;
			}
			if (window1right + 1 < window_right) {
				win.edges[nr] = window1right + 1;
				win.edges[++nr] = cast(short)window_right;
			}
		}
		bool w2_ena = (winflags & kWindow2Enabled) && window2left <= window2right;
		if (w2_ena) {
			for (i = 0; i <= nr && (t = window2left) != win.edges[i]; i++) {
				if (t < win.edges[i]) {
					for (j = nr++; j >= i; j--) {
						win.edges[j + 1] = win.edges[j];
					}
					win.edges[i] = cast(short)t;
					break;
				}
			}
			for (; i <= nr && (t = window2right + 1) != win.edges[i]; i++) {
				if (t < win.edges[i]) {
					for (j = nr++; j >= i; j--) {
						win.edges[j + 1] = win.edges[j];
					}
					win.edges[i] = cast(short)t;
					break;
				}
			}
		}
		win.nr = cast(ubyte)nr;
		// get a bitmap of how regions map to windows
		ubyte w1_bits = 0, w2_bits = 0;
		if (w1_ena) {
			for (i = 0; win.edges[i] != window1left; i++) {}
			for (j = i; win.edges[j] != window1right + 1; j++) {}
			w1_bits = cast(ubyte)(((1 << (j - i)) - 1) << i);
		}
		if ((winflags & (kWindow1Enabled | kWindow1Inversed)) == (kWindow1Enabled | kWindow1Inversed)) {
			w1_bits = cast(ubyte)~w1_bits;
		}
		if (w2_ena) {
			for (i = 0; win.edges[i] != window2left; i++) {}
			for (j = i; win.edges[j] != window2right + 1; j++) {}
			w2_bits = cast(ubyte)(((1 << (j - i)) - 1) << i);
		}
		if ((winflags & (kWindow2Enabled | kWindow2Inversed)) == (kWindow2Enabled | kWindow2Inversed)) {
			w2_bits = cast(ubyte)~w2_bits;
		}
		win.bits = w1_bits | w2_bits;
	}
	// Draw a whole line of a 4bpp background layer into bgBuffers
	private void drawBackground4BPP(uint y, bool sub, uint layer, PpuZbufType zhi, PpuZbufType zlo) @safe pure {
		enum kPaletteShift = 6;
		if (!IS_SCREEN_ENABLED(sub, layer)) {
			return; // layer is completely hidden
		}
		PpuWindows win;
		IS_SCREEN_WINDOWED(sub, layer) ? windowsCalc(win, layer) : windowsClear(win, layer);
		BGLayer *bglayer = &bgLayer[layer];
		y += bglayer.vScroll;
		int sc_offs = bglayer.tilemapAdr + (((y >> 3) & 0x1f) << 5);
		if ((y & 0x100) && bglayer.tilemapHigher) {
			sc_offs += bglayer.tilemapWider ? 0x800 : 0x400;
		}
		const(ushort)[] tps(uint i) {
			return [
				vram[sc_offs & 0x7fff .. $],
				vram[sc_offs + (bglayer.tilemapWider ? 0x400 : 0) & 0x7fff .. $]
			][i];
		}
		int tileadr = bgLayer[layer].tileAdr, pixel;
		int tileadr1 = tileadr + 7 - (y & 0x7);
		int tileadr0 = tileadr + (y & 0x7);
		const(ushort)[] addr;
		uint READ_BITS(int ta, uint tile) {
			addr = vram[((ta) + (tile) * 16) & 0x7fff .. $];
			return addr[0] | addr[8] << 16;
		}
		for (size_t windex = 0; windex < win.nr; windex++) {
			if (win.bits & (1 << windex)) {
				continue; // layer is disabled for this window part
			}
			uint x = win.edges[windex] + bglayer.hScroll;
			uint w = win.edges[windex + 1] - win.edges[windex];
			PpuZbufType[] dstz = bgBuffers[sub].data[win.edges[windex] + kPpuExtraLeftRight .. $];
			const(ushort)[] tp_start = tps(x >> 8 & 1);
			const(ushort)[] tp_next = tps((x >> 8 & 1) ^ 1);
			const(ushort)[] tp = tp_start[(x >> 3) & 0x1f .. 32];
			uint bits;
			PpuZbufType z;
			void DO_PIXEL(int i)() {
				pixel = (bits >> i) & 1 | (bits >> (7 + i)) & 2 | (bits >> (14 + i)) & 4 | (bits >> (21 + i)) & 8;
				if ((bits & (0x01010101 << i)) && z > dstz[i]) {
					dstz[i] = cast(ushort)(z + pixel);
				}
			}
			void DO_PIXEL_HFLIP(int i)() {
				pixel = (bits >> (7 - i)) & 1 | (bits >> (14 - i)) & 2 | (bits >> (21 - i)) & 4 | (bits >> (28 - i)) & 8;
				if ((bits & (0x80808080 >> i)) && z > dstz[i]) {
					dstz[i] = cast(ushort)(z + pixel);
				}
			}
			// Handle clipped pixels on left side
			if (x & 7) {
				int curw = IntMin(8 - (x & 7), w);
				w -= curw;
				uint tile = tp[0];
				if (tp.length > 1) {
					tp = tp[1 .. $];
				} else {
					tp = tp_next[0 .. 32];
					swap(tp_next, tp_start);
				}
				int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
				z = (tile & 0x2000) ? zhi : zlo;
				bits = READ_BITS(ta, tile & 0x3ff);
				if (bits) {
					z += ((tile & 0x1c00) >> kPaletteShift);
					if (tile & 0x4000) {
						bits >>= (x & 7), x += curw;
						do {
							DO_PIXEL!(0);
							bits >>= 1;
							dstz = dstz[1 .. $];
						} while (--curw);
					} else {
						bits <<= (x & 7), x += curw;
						do {
							DO_PIXEL_HFLIP!(0);
							bits <<= 1;
							dstz = dstz[1 .. $];
						} while (--curw);
					}
				} else {
					dstz = dstz[curw .. $];
				}
			}
			// Handle full tiles in the middle
			while (w >= 8) {
				uint tile = tp[0];
				if (tp.length > 1) {
					tp = tp[1 .. $];
				} else {
					tp = tp_next[0 .. 32];
					swap(tp_next, tp_start);
				}
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
				dstz = dstz[8 .. $];
				w -= 8;
			}
			// Handle remaining clipped part
			if (w) {
				uint tile = tp[0];
				int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
				z = (tile & 0x2000) ? zhi : zlo;
				bits = READ_BITS(ta, tile & 0x3ff);
				if (bits) {
					z += ((tile & 0x1c00) >> kPaletteShift);
					if (tile & 0x4000) {
						do {
							DO_PIXEL!(0);
							bits >>= 1;
							dstz = dstz[1 .. $];
						} while (--w);
					} else {
						do {
							DO_PIXEL_HFLIP!(0);
							bits <<= 1;
							dstz = dstz[1 .. $];
						} while (--w);
					}
				}
			}
		}
	}

	// Draw a whole line of a 2bpp background layer into bgBuffers
	private void drawBackground2BPP(uint y, bool sub, uint layer, PpuZbufType zhi, PpuZbufType zlo) @safe pure {
		enum kPaletteShift = 8;
		if (!IS_SCREEN_ENABLED(sub, layer)) {
			return; // layer is completely hidden
		}
		PpuWindows win;
		IS_SCREEN_WINDOWED(sub, layer) ? windowsCalc(win, layer) : windowsClear(win, layer);
		BGLayer *bglayer = &bgLayer[layer];
		y += bglayer.vScroll;
		int sc_offs = bglayer.tilemapAdr + (((y >> 3) & 0x1f) << 5);
		if ((y & 0x100) && bglayer.tilemapHigher) {
			sc_offs += bglayer.tilemapWider ? 0x800 : 0x400;
		}
		const ushort[] tps(uint i) {
			return  [
				vram[sc_offs & 0x7fff .. $],
				vram[sc_offs + (bglayer.tilemapWider ? 0x400 : 0) & 0x7fff .. $]
			][i];
		}
		int tileadr = bgLayer[layer].tileAdr, pixel;
		int tileadr1 = tileadr + 7 - (y & 0x7), tileadr0 = tileadr + (y & 0x7);

		const(ushort)[] addr;
		for (size_t windex = 0; windex < win.nr; windex++) {
			if (win.bits & (1 << windex)) {
				continue; // layer is disabled for this window part
			}
			uint x = win.edges[windex] + bglayer.hScroll;
			uint w = win.edges[windex + 1] - win.edges[windex];
			PpuZbufType[] dstz = bgBuffers[sub].data[win.edges[windex] + kPpuExtraLeftRight .. $];
			const(ushort)[] tp_start = tps(x >> 8 & 1);
			const(ushort)[] tp_next = tps((x >> 8 & 1) ^ 1);
			const(ushort)[] tp = tp_start[(x >> 3) & 0x1f .. 32];

			uint READ_BITS(int ta, uint tile) {
				addr = vram[(ta) + (tile) * 8 & 0x7fff .. $];
				return addr[0];
			}
			PpuZbufType z;
			uint bits;
			void DO_PIXEL(int i)() {
				pixel = (bits >> i) & 1 | (bits >> (7 + i)) & 2;
				if (pixel && z > dstz[i]) {
					dstz[i] = cast(ushort)(z + pixel);
				}
			}
			void DO_PIXEL_HFLIP(int i)() {
				pixel = (bits >> (7 - i)) & 1 | (bits >> (14 - i)) & 2;
				if (pixel && z > dstz[i]) {
					dstz[i] = cast(ushort)(z + pixel);
				}
			}
			// Handle clipped pixels on left side
			if (x & 7) {
				int curw = IntMin(8 - (x & 7), w);
				w -= curw;
				uint tile = tp[0];
				if (tp.length > 1) {
					tp = tp[1 .. $];
				} else {
					tp = tp_next[0 .. 32];
					swap(tp_next, tp_start);
				}
				int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
				z = (tile & 0x2000) ? zhi : zlo;
				bits = READ_BITS(ta, tile & 0x3ff);
				if (bits) {
					z += ((tile & 0x1c00) >> kPaletteShift);
					if (tile & 0x4000) {
						bits >>= (x & 7), x += curw;
						do {
							DO_PIXEL!(0);
							bits >>= 1;
							dstz = dstz[1 .. $];
						} while (--curw);
					} else {
						bits <<= (x & 7), x += curw;
						do {
							DO_PIXEL_HFLIP!(0);
							bits <<= 1;
							dstz = dstz[1 .. $];
						} while (--curw);
					}
				} else {
					dstz = dstz[curw .. $];
				}
			}
			// Handle full tiles in the middle
			while (w >= 8) {
				uint tile = tp[0];
				if (tp.length > 1) {
					tp = tp[1 .. $];
				} else {
					tp = tp_next[0 .. 32];
					swap(tp_next, tp_start);
				}
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
				dstz = dstz[8 .. $];
				w -= 8;
			}
			// Handle remaining clipped part
			if (w) {
				uint tile = tp[0];
				int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
				z = (tile & 0x2000) ? zhi : zlo;
				bits = READ_BITS(ta, tile & 0x3ff);
				if (bits) {
					z += ((tile & 0x1c00) >> kPaletteShift);
					if (tile & 0x4000) {
						do {
							DO_PIXEL!(0);
							bits >>= 1;
							dstz = dstz[1 .. $];
						} while (--w);
					} else {
						do {
							DO_PIXEL_HFLIP!(0);
							bits <<= 1;
							dstz = dstz[1 .. $];
						} while (--w);
					}
				}
			}
		}
	}

	// Draw a whole line of a 4bpp background layer into bgBuffers, with mosaic applied
	private void drawBackground4BPPMosaic(uint y, bool sub, uint layer, PpuZbufType zhi, PpuZbufType zlo) @safe pure {
		enum kPaletteShift = 6;
		if (!IS_SCREEN_ENABLED(sub, layer)) {
			return; // layer is completely hidden
		}
		PpuWindows win;
		IS_SCREEN_WINDOWED(sub, layer) ? windowsCalc(win, layer) : windowsClear(win, layer);
		BGLayer *bglayer = &bgLayer[layer];
		y = mosaicModulo[y] + bglayer.vScroll;
		int sc_offs = bglayer.tilemapAdr + (((y >> 3) & 0x1f) << 5);
		if ((y & 0x100) && bglayer.tilemapHigher) {
			sc_offs += bglayer.tilemapWider ? 0x800 : 0x400;
		}
		const(ushort)[] tps(uint i) {
			return [
				vram[sc_offs & 0x7fff .. $],
				vram[sc_offs + (bglayer.tilemapWider ? 0x400 : 0) & 0x7fff .. $]
			][i];
		}
		int tileadr = bgLayer[layer].tileAdr, pixel;
		uint bits;
		int tileadr1 = tileadr + 7 - (y & 0x7);
		int tileadr0 = tileadr + (y & 0x7);
		const(ushort)[] addr;
		void GET_PIXEL() {
			pixel = (bits) & 1 | (bits >> 7) & 2 | (bits >> 14) & 4 | (bits >> 21) & 8;
		}
		void GET_PIXEL_HFLIP() {
			pixel = (bits >> 7) & 1 | (bits >> 14) & 2 | (bits >> 21) & 4 | (bits >> 28) & 8;
		}
		uint READ_BITS(uint ta, uint tile) {
			addr = vram[((ta) + (tile) * 16) & 0x7fff .. $];
			return addr[0] | addr[8] << 16;
		}
		for (size_t windex = 0; windex < win.nr; windex++) {
			if (win.bits & (1 << windex)) {
				continue; // layer is disabled for this window part
			}
			int sx = win.edges[windex];
			PpuZbufType[] dstz = bgBuffers[sub].data[sx + kPpuExtraLeftRight .. win.edges[windex + 1] + kPpuExtraLeftRight];
			uint x = sx + bglayer.hScroll;
			const(ushort)[] tp_next = tps((x >> 8 & 1) ^ 1);
			const(ushort)[] tp = tps(x >> 8 & 1)[(x >> 3) & 0x1f .. 32];
			x &= 7;
			int w = mosaicSize - (sx - mosaicModulo[sx]);
			do {
				w = IntMin(w, cast(int)dstz.length);
				uint tile = tp[0];
				int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
				PpuZbufType z = (tile & 0x2000) ? zhi : zlo;
				bits = READ_BITS(ta, tile & 0x3ff);
				if (tile & 0x4000) {
					bits >>= x, GET_PIXEL();
				} else {
					bits <<= x, GET_PIXEL_HFLIP();
				}
				if (pixel) {
					pixel += (tile & 0x1c00) >> kPaletteShift;
					int i = 0;
					do {
						if (z > dstz[i]) {
							dstz[i] = cast(ushort)(pixel + z);
						}
					} while (++i != w);
				}
				dstz = dstz[w .. $];
				x += w;
				for (; x >= 8; x -= 8) {
					tp = (tp.length > 1) ? tp[1 .. $] : tp_next;
				}
				w = mosaicSize;
			} while (dstz.length != 0);
		}
	}

	// Draw a whole line of a 2bpp background layer into bgBuffers, with mosaic applied
	private void drawBackground2BPPMosaic(int y, bool sub, uint layer, PpuZbufType zhi, PpuZbufType zlo) @safe pure {
		enum kPaletteShift = 8;
		if (!IS_SCREEN_ENABLED(sub, layer)) {
			return; // layer is completely hidden
		}
		PpuWindows win;
		IS_SCREEN_WINDOWED(sub, layer) ? windowsCalc(win, layer) : windowsClear(win, layer);
		BGLayer *bglayer = &bgLayer[layer];
		y = mosaicModulo[y] + bglayer.vScroll;
		int sc_offs = bglayer.tilemapAdr + (((y >> 3) & 0x1f) << 5);
		if ((y & 0x100) && bglayer.tilemapHigher) {
			sc_offs += bglayer.tilemapWider ? 0x800 : 0x400;
		}
		const(ushort)[] tps(uint i){
			return [
				vram[sc_offs & 0x7fff .. $],
				vram[sc_offs + (bglayer.tilemapWider ? 0x400 : 0) & 0x7fff .. $]
			][i];
		}
		int tileadr = bgLayer[layer].tileAdr, pixel;
		int tileadr1 = tileadr + 7 - (y & 0x7);
		int tileadr0 = tileadr + (y & 0x7);
		const(ushort)[] addr;
		uint bits;
		void GET_PIXEL() {
			pixel = (bits) & 1 | (bits >> 7) & 2;
		}
		void GET_PIXEL_HFLIP() {
			pixel = (bits >> 7) & 1 | (bits >> 14) & 2;
		}
		uint READ_BITS(uint ta, uint tile) {
			addr = vram[((ta) + (tile) * 8) & 0x7fff .. $];
			return addr[0];
		}
		for (size_t windex = 0; windex < win.nr; windex++) {
			if (win.bits & (1 << windex)) {
				continue; // layer is disabled for this window part
			}
			int sx = win.edges[windex];
			PpuZbufType[] dstz = bgBuffers[sub].data[sx + kPpuExtraLeftRight .. win.edges[windex + 1] + kPpuExtraLeftRight];
			uint x = sx + bglayer.hScroll;
			const(ushort)[] tp_next = tps((x >> 8 & 1) ^ 1);
			const(ushort)[] tp = tps(x >> 8 & 1)[(x >> 3) & 0x1f .. 32];
			x &= 7;
			int w = mosaicSize - (sx - mosaicModulo[sx]);
			do {
				w = IntMin(w, cast(int)dstz.length);
				uint tile = tp[0];
				int ta = (tile & 0x8000) ? tileadr1 : tileadr0;
				PpuZbufType z = (tile & 0x2000) ? zhi : zlo;
				bits = READ_BITS(ta, tile & 0x3ff);
				if (tile & 0x4000) {
					bits >>= x, GET_PIXEL();
				} else {
					bits <<= x, GET_PIXEL_HFLIP();
				}
				if (pixel) {
					pixel += (tile & 0x1c00) >> kPaletteShift;
					uint i = 0;
					do {
						if (z > dstz[i]) {
							dstz[i] = cast(ushort)(pixel + z);
						}
					} while (++i != w);
				}
				dstz = dstz[w .. $];
				x += w;
				for (; x >= 8; x -= 8) {
					tp = (tp.length > 1) ? tp[1 .. $] : tp_next;
				}
				w = mosaicSize;
			} while (dstz.length != 0);
		}
	}


	// level6 should be set if it's from palette 0xc0 which means color math is not applied
	uint SPRITE_PRIO_TO_PRIO(uint prio, bool level6) @safe pure {
		return (prio * 4 + 2) * 16 + 4 + (level6 ? 2 : 0);
	}
	uint SPRITE_PRIO_TO_PRIO_HI(uint prio) @safe pure {
		return prio * 4 + 2;
	}

	private void drawSprites(uint y, uint sub, bool clear_backdrop) @safe pure {
		int layer = 4;
		if (!IS_SCREEN_ENABLED(sub, layer)) {
			return; // layer is completely hidden
		}
		PpuWindows win;
		IS_SCREEN_WINDOWED(sub, layer) ? windowsCalc(win, layer) : windowsClear(win, layer);
		for (size_t windex = 0; windex < win.nr; windex++) {
			if (win.bits & (1 << windex)) {
				continue; // layer is disabled for this window part
			}
			int left = win.edges[windex];
			int width = win.edges[windex + 1] - left;
			PpuZbufType[] src = objBuffer.data[left + kPpuExtraLeftRight .. $];
			PpuZbufType[] dst = bgBuffers[sub].data[left + kPpuExtraLeftRight .. $];
			if (clear_backdrop) {
				dst[0 .. min($, width * ushort.sizeof)] = src[0 .. min($, width * ushort.sizeof)];
			} else {
				do {
					if (src[0] > dst[0]) {
						dst[0] = src[0];
					}
					src = src[1 .. $];
					dst = dst[1 .. $];
				} while (--width);
			}
		}
	}

	// Assumes it's drawn on an empty backdrop
	private void drawBackgroundMode7(uint y, bool sub, PpuZbufType z) @safe pure {
		int layer = 0;
		if (!IS_SCREEN_ENABLED(sub, layer)) {
			return; // layer is completely hidden
		}
		PpuWindows win;
		IS_SCREEN_WINDOWED(sub, layer) ? windowsCalc(win, layer) : windowsClear(win, layer);

		// expand 13-bit values to signed values
		int hScroll = (cast(short)(m7matrix[6] << 3)) >> 3;
		int vScroll = (cast(short)(m7matrix[7] << 3)) >> 3;
		int xCenter = (cast(short)(m7matrix[4] << 3)) >> 3;
		int yCenter = (cast(short)(m7matrix[5] << 3)) >> 3;
		int clippedH = hScroll - xCenter;
		int clippedV = vScroll - yCenter;
		clippedH = (clippedH & 0x2000) ? (clippedH | ~1023) : (clippedH & 1023);
		clippedV = (clippedV & 0x2000) ? (clippedV | ~1023) : (clippedV & 1023);
		bool mosaic_enabled = IS_MOSAIC_ENABLED(0);
		if (mosaic_enabled) {
			y = mosaicModulo[y];
		}
		uint ry = m7yFlip ? 255 - y : y;
		uint m7startX = (m7matrix[0] * clippedH & ~63) + (m7matrix[1] * ry & ~63) +
			(m7matrix[1] * clippedV & ~63) + (xCenter << 8);
		uint m7startY = (m7matrix[2] * clippedH & ~63) + (m7matrix[3] * ry & ~63) +
			(m7matrix[3] * clippedV & ~63) + (yCenter << 8);
		for (size_t windex = 0; windex < win.nr; windex++) {
			if (win.bits & (1 << windex)) {
				continue; // layer is disabled for this window part
			}
			int x = win.edges[windex], x2 = win.edges[windex + 1], tile;
			PpuZbufType[] dstz = bgBuffers[sub].data[x + kPpuExtraLeftRight .. x2 + kPpuExtraLeftRight];
			uint rx = m7xFlip ? 255 - x : x;
			uint xpos = m7startX + m7matrix[0] * rx;
			uint ypos = m7startY + m7matrix[2] * rx;
			uint dx = m7xFlip ? -m7matrix[0] : m7matrix[0];
			uint dy = m7xFlip ? -m7matrix[2] : m7matrix[2];
			uint outside_value = m7largeField ? 0x3ffff : 0xffffffff;
			bool char_fill = m7charFill;
			if (mosaic_enabled) {
				int w = mosaicSize - (x - mosaicModulo[x]);
				do {
					w = IntMin(w, cast(int)dstz.length);
					if (cast(uint)(xpos | ypos) > outside_value) {
						if (!char_fill) {
							continue;
						}
						tile = 0;
					} else {
						tile = vram[(ypos >> 11 & 0x7f) * 128 + (xpos >> 11 & 0x7f)] & 0xff;
					}
					ubyte pixel = vram[tile * 64 + (ypos >> 8 & 7) * 8 + (xpos >> 8 & 7)] >> 8;
					if (pixel) {
						int i = 0;
						do {
							dstz[i] = cast(ushort)(pixel + z);
						} while (++i != w);
					}
					xpos += dx * w;
					ypos += dy * w;
					dstz = dstz[w .. $];
					w = mosaicSize;
				} while (dstz.length > 0);
			} else {
				do {
					if (cast(uint)(xpos | ypos) > outside_value) {
						if (!char_fill) {
							continue;
						}
						tile = 0;
					} else {
						tile = vram[(ypos >> 11 & 0x7f) * 128 + (xpos >> 11 & 0x7f)] & 0xff;
					}
					ubyte pixel = vram[tile * 64 + (ypos >> 8 & 7) * 8 + (xpos >> 8 & 7)] >> 8;
					if (pixel) {
						dstz[0] = cast(ushort)(pixel + z);
					}
					xpos += dx;
					ypos += dy;
					dstz = dstz[1 .. $];
				} while (dstz.length > 0);
			}
		}
	}

	void setMode7PerspectiveCorrection(int low, int high) @safe pure {
		mode7PerspectiveLow = low ? 1.0f / low : 0.0f;
		mode7PerspectiveHigh = 1.0f / high;
	}

	void setExtraSideSpace(int left, int right, int bottom) @safe pure {
		extraLeftCur = cast(ubyte)UintMin(left, extraLeftRight);
		extraRightCur = cast(ubyte)UintMin(right, extraLeftRight);
		extraBottomCur = cast(ubyte)UintMin(bottom, 16);
	}

	private float FloatInterpolate(float x, float xmin, float xmax, float ymin, float ymax) @safe pure {
		return ymin + (ymax - ymin) * (x - xmin) * (1.0f / (xmax - xmin));
	}

	// Upsampled version of mode7 rendering. Draws everything in 4x the normal resolution.
	// Draws directly to the pixel buffer and bypasses any math, and supports only
	// a subset of the normal features (all that zelda needs)
	private void drawMode7Upsampled(uint y) @safe pure {
		// expand 13-bit values to signed values
		uint xCenter = (cast(short)(m7matrix[4] << 3)) >> 3, yCenter = (cast(short)(m7matrix[5] << 3)) >> 3;
		uint clippedH = ((cast(short)(m7matrix[6] << 3)) >> 3) - xCenter;
		uint clippedV = ((cast(short)(m7matrix[7] << 3)) >> 3) - yCenter;
		int[4] m0v;
		if (*cast(uint*)&mode7PerspectiveLow == 0) {
			m0v[0] = m0v[1] = m0v[2] = m0v[3] = m7matrix[0] << 12;
		} else {
			static const float[4] kInterpolateOffsets = [ -1, -1 + 0.25f, -1 + 0.5f, -1 + 0.75f ];
			for (int i = 0; i < 4; i++) {
				m0v[i] = cast(int)(4096.0f / FloatInterpolate(cast(int)y + kInterpolateOffsets[i], 0, 223, mode7PerspectiveLow, mode7PerspectiveHigh));
			}
		}
		size_t pitch = renderPitch;
		ubyte[] render_buffer_ptr = renderBuffer[(y - 1) * 4 * pitch .. $];
		ubyte[] dst_start = render_buffer_ptr[(extraLeftRight - extraLeftCur) * 16 .. $];
		size_t draw_width = 256 + extraLeftCur + extraRightCur;
		ubyte[] dst_curline = dst_start;
		uint m1 = m7matrix[1] << 12; // xpos increment per vert movement
		uint m2 = m7matrix[2] << 12; // ypos increment per horiz movement
		for (int j = 0; j < 4; j++) {
			uint m0 = m0v[j], m3 = m0;
			uint xpos = m0 * clippedH + m1 * (clippedV + y) + (xCenter << 20), xcur;
			uint ypos = m2 * clippedH + m3 * (clippedV + y) + (yCenter << 20), ycur;

			uint tile, pixel;
			xpos -= (m0 + m1) >> 1;
			ypos -= (m2 + m3) >> 1;
			xcur = (xpos << 2) + j * m1;
			ycur = (ypos << 2) + j * m3;

			xcur -= extraLeftCur * 4 * m0;
			ycur -= extraLeftCur * 4 * m2;

			ubyte[] dst = dst_curline[0 .. draw_width * 16];

			void DRAW_PIXEL(int mode) {
				tile = vram[(ycur >> 25 & 0x7f) * 128 + (xcur >> 25 & 0x7f)] & 0xff;
				pixel = vram[tile * 64 + (ycur >> 22 & 7) * 8 + (xcur >> 22 & 7)] >> 8;
				pixel = (xcur & 0x80000000) ? 0 : pixel;
				(cast(uint[])dst)[0] = (mode ? (colorMapRgb[pixel] & 0xfefefe) >> 1 : colorMapRgb[pixel]);
				xcur += m0;
				ycur += m2;
				dst = dst[4 .. $];
			}

			if (!halfColor) {
				do {
					DRAW_PIXEL(0);
					DRAW_PIXEL(0);
					DRAW_PIXEL(0);
					DRAW_PIXEL(0);
				} while (dst.length > 0);
			} else {
				do {
					DRAW_PIXEL(1);
					DRAW_PIXEL(1);
					DRAW_PIXEL(1);
					DRAW_PIXEL(1);
				} while (dst.length > 0);
			}

			dst_curline = dst_curline[pitch .. $];
		}

		if (lineHasSprites) {
			ubyte[] dst = dst_start;
			PpuZbufType[] pixels = objBuffer.data[kPpuExtraLeftRight - extraLeftCur .. $];
			for (size_t i = 0; i < draw_width; i++, dst = dst[16 .. $]) {
				uint pixel = pixels[i] & 0xff;
				if (pixel) {
					uint color = colorMapRgb[pixel];
					(cast(uint[])(dst[pitch * 0 .. pitch * 0 + 4 * uint.sizeof]))[] = color;
					(cast(uint[])(dst[pitch * 1 .. pitch * 1 + 4 * uint.sizeof]))[] = color;
					(cast(uint[])(dst[pitch * 2 .. pitch * 2 + 4 * uint.sizeof]))[] = color;
					(cast(uint[])(dst[pitch * 3 .. pitch * 3 + 4 * uint.sizeof]))[] = color;
					//(cast(uint *)dst)[3] = (cast(uint *)dst)[2] = (cast(uint *)dst)[1] = (cast(uint *)dst)[0] = color;
					//(cast(uint *)(dst + pitch * 1))[3] = (cast(uint *)(dst + pitch * 1))[2] = (cast(uint *)(dst + pitch * 1))[1] = (cast(uint *)(dst + pitch * 1))[0] = color;
					//(cast(uint *)(dst + pitch * 2))[3] = (cast(uint *)(dst + pitch * 2))[2] = (cast(uint *)(dst + pitch * 2))[1] = (cast(uint *)(dst + pitch * 2))[0] = color;
					//(cast(uint *)(dst + pitch * 3))[3] = (cast(uint *)(dst + pitch * 3))[2] = (cast(uint *)(dst + pitch * 3))[1] = (cast(uint *)(dst + pitch * 3))[0] = color;
				}
			}
		}

		if (extraLeftRight - extraLeftCur != 0) {
			size_t n = 4 * uint.sizeof * (extraLeftRight - extraLeftCur);
			for(int i = 0; i < 4; i++) {
				render_buffer_ptr[pitch * i .. pitch * i + n] = 0;
			}
		}
		if (extraLeftRight - extraRightCur != 0) {
			size_t n = 4 * uint.sizeof * (extraLeftRight - extraRightCur);
			for (int i = 0; i < 4; i++) {
				const start = pitch * i + (256 + extraLeftRight * 2 - (extraLeftRight - extraRightCur)) * 4 * uint.sizeof;
				render_buffer_ptr[start .. start + n] = 0;
			}
		}
	}

	private void drawBackgrounds(int y, bool sub) @safe pure {
	// Top 4 bits contain the prio level, and bottom 4 bits the layer type.
	// SPRITE_PRIO_TO_PRIO can be used to convert from obj prio to this prio.
	// 15: BG3 tiles with priority 1 if bit 3 of $2105 is set
	// 14: Sprites with priority 3 (4 * sprite_prio + 2)
	// 12: BG1 tiles with priority 1
	// 11: BG2 tiles with priority 1
	// 10: Sprites with priority 2 (4 * sprite_prio + 2)
	// 8: BG1 tiles with priority 0
	// 7: BG2 tiles with priority 0
	// 6: Sprites with priority 1 (4 * sprite_prio + 2)
	// 3: BG3 tiles with priority 1 if bit 3 of $2105 is clear
	// 2: Sprites with priority 0 (4 * sprite_prio + 2)
	// 1: BG3 tiles with priority 0
	// 0: backdrop

		if (mode == 1) {
			if (lineHasSprites) {
				drawSprites(y, sub, true);
			}

			if (IS_MOSAIC_ENABLED(0)) {
				drawBackground4BPPMosaic(y, sub, 0, 0xc000, 0x8000);
			} else {
				drawBackground4BPP(y, sub, 0, 0xc000, 0x8000);
			}

			if (IS_MOSAIC_ENABLED(1)) {
				drawBackground4BPPMosaic(y, sub, 1, 0xb100, 0x7100);
			} else {
				drawBackground4BPP(y, sub, 1, 0xb100, 0x7100);
			}

			if (IS_MOSAIC_ENABLED(2)) {
				drawBackground2BPPMosaic(y, sub, 2, 0xf200, 0x1200);
			} else {
				drawBackground2BPP(y, sub, 2, 0xf200, 0x1200);
			}
		} else {
			// mode 7
			drawBackgroundMode7(y, sub, 0xc000);
			if (lineHasSprites) {
				drawSprites(y, sub, false);
			}
		}
	}

	private void drawWholeLine(uint y) @safe pure {
		if (forcedBlank) {
			ubyte[] dst = renderBuffer[(y - 1) * renderPitch .. $];
			size_t n = uint.sizeof * (256 + extraLeftRight * 2);
			dst[0 .. n] = 0;
			return;
		}

		if (mode == 7 && (renderFlags & KPPURenderFlags.mode74x4)) {
			drawMode7Upsampled(y);
			return;
		}

		// Default background is backdrop
		ClearBackdrop(bgBuffers[0]);

		// Render main screen
		drawBackgrounds(y, false);

		// The 6:th bit is automatically zero, math is never applied to the first half of the sprites.
		uint math_enabled = mathEnabled;

		// Render also the subscreen?
		bool rendered_subscreen = false;
		if (preventMathMode != 3 && addSubscreen && math_enabled) {
			ClearBackdrop(bgBuffers[1]);
			if (screenEnabled[1] != 0) {
				drawBackgrounds(y, true);
				rendered_subscreen = true;
			}
		}

		// Color window affects the drawing mode in each region
		PpuWindows cwin;
		windowsCalc(cwin, 5);
		static const ubyte[8] kCwBitsMod = [
			0x00, 0xff, 0xff, 0x00,
			0xff, 0x00, 0xff, 0x00,
		];
		uint cw_clip_math = ((cwin.bits & kCwBitsMod[clipMode]) ^ kCwBitsMod[clipMode + 4]) |
													((cwin.bits & kCwBitsMod[preventMathMode]) ^ kCwBitsMod[preventMathMode + 4]) << 8;

		uint[] dst = cast(uint[])renderBuffer[(y - 1) * renderPitch .. $];
		uint[] dst_org = dst;

		dst = dst[extraLeftRight - extraLeftCur .. $];

		uint windex = 0;
		do {
			uint left = cwin.edges[windex] + kPpuExtraLeftRight, right = cwin.edges[windex + 1] + kPpuExtraLeftRight;
			// If clip is set, then zero out the rgb values from the main screen.
			uint clip_color_mask = (cw_clip_math & 1) ? 0x1f : 0;
			uint math_enabled_cur = (cw_clip_math & 0x100) ? math_enabled : 0;
			uint fixed_color = fixedColorR | fixedColorG << 5 | fixedColorB << 10;
			if (math_enabled_cur == 0 || fixed_color == 0 && !halfColor && !rendered_subscreen) {
				// Math is disabled (or has no effect), so can avoid the per-pixel maths check
				uint i = left;
				do {
					uint color = cgram[bgBuffers[0].data[i] & 0xff];
					dst[0] = brightnessMult[color & clip_color_mask] << 16 | brightnessMult[(color >> 5) & clip_color_mask] << 8 | brightnessMult[(color >> 10) & clip_color_mask];
					dst = dst[1 .. $];
				} while (++i < right);
			} else {
				ubyte[] half_color_map = halfColor ? brightnessMultHalf : brightnessMult;
				// Store this in locals
				math_enabled_cur |= addSubscreen << 8 | subtractColor << 9;
				// Need to check for each pixel whether to use math or not based on the main screen layer.
				uint i = left;
				do {
					uint color = cgram[bgBuffers[0].data[i] & 0xff], color2;
					ubyte main_layer = (bgBuffers[0].data[i] >> 8) & 0xf;
					uint r = color & clip_color_mask;
					uint g = (color >> 5) & clip_color_mask;
					uint b = (color >> 10) & clip_color_mask;
					ubyte[] color_map = brightnessMult;
					if (math_enabled_cur & (1 << main_layer)) {
						if (math_enabled_cur & 0x100) { // addSubscreen ?
							if ((bgBuffers[1].data[i] & 0xff) != 0) {
								color2 = cgram[bgBuffers[1].data[i] & 0xff];
								color_map = half_color_map;
							} else {// Don't halve if addSubscreen && backdrop
								color2 = fixed_color;
							}
						} else {
							color2 = fixed_color;
							color_map = half_color_map;
						}
						uint r2 = (color2 & 0x1f), g2 = ((color2 >> 5) & 0x1f), b2 = ((color2 >> 10) & 0x1f);
						if (math_enabled_cur & 0x200) { // subtractColor?
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
					dst = dst[1 .. $];
				} while (++i < right);
			}
			cw_clip_math >>= 1;
		} while (++windex < cwin.nr);

		// Clear out stuff on the sides.
		if (extraLeftRight - extraLeftCur != 0) {
			dst_org[0 .. uint.sizeof * (extraLeftRight - extraLeftCur)] = 0;
		}
		if (extraLeftRight - extraRightCur != 0) {
			const start = 256 + extraLeftRight * 2 - (extraLeftRight - extraRightCur);
			dst_org[start .. start + uint.sizeof * (extraLeftRight - extraRightCur)] = 0;
		}
	}

	private void handlePixel(int x, int y) @safe pure {
		int r = 0, r2 = 0;
		int g = 0, g2 = 0;
		int b = 0, b2 = 0;
		if (!forcedBlank) {
			int mainLayer = getPixel(x, y, false, r, g, b);

			bool colorWindowState = getWindowState(5, x);
			if (
				clipMode == 3 ||
				(clipMode == 2 && colorWindowState) ||
				(clipMode == 1 && !colorWindowState)
				) {
				r = g = b = 0;
			}
			int secondLayer = 5; // backdrop
			bool mathEnabled = mainLayer < 6 && (mathEnabled & (1 << mainLayer)) && !(
				preventMathMode == 3 ||
				(preventMathMode == 2 && colorWindowState) ||
				(preventMathMode == 1 && !colorWindowState)
				);
			if ((mathEnabled && addSubscreen) || mode == 5 || mode == 6) {
				secondLayer = getPixel(x, y, true, r2, g2, b2);
			}
			// TODO: subscreen pixels can be clipped to black as well
			// TODO: math for subscreen pixels (add/sub sub to main)
			if (mathEnabled) {
				if (subtractColor) {
					r -= (addSubscreen && secondLayer != 5) ? r2 : fixedColorR;
					g -= (addSubscreen && secondLayer != 5) ? g2 : fixedColorG;
					b -= (addSubscreen && secondLayer != 5) ? b2 : fixedColorB;
				} else {
					r += (addSubscreen && secondLayer != 5) ? r2 : fixedColorR;
					g += (addSubscreen && secondLayer != 5) ? g2 : fixedColorG;
					b += (addSubscreen && secondLayer != 5) ? b2 : fixedColorB;
				}
				if (halfColor && (secondLayer != 5 || !addSubscreen)) {
					r >>= 1;
					g >>= 1;
					b >>= 1;
				}
				if (r > 31) {
					r = 31;
				}
				if (g > 31) {
					g = 31;
				}
				if (b > 31) {
					b = 31;
				}
				if (r < 0) {
					r = 0;
				}
				if (g < 0) {
					g = 0;
				}
				if (b < 0) {
					b = 0;
				}
			}
			if (!(mode == 5 || mode == 6)) {
				r2 = r; g2 = g; b2 = b;
			}
		}
		int row = y - 1;
		ubyte[] pixelBuffer = cast(ubyte[]) renderBuffer[row * renderPitch + (x + extraLeftRight) * 4 .. $];
		pixelBuffer[0] = cast(ubyte)(((b << 3) | (b >> 2)) * brightness / 15);
		pixelBuffer[1] = cast(ubyte)(((g << 3) | (g >> 2)) * brightness / 15);
		pixelBuffer[2] = cast(ubyte)(((r << 3) | (r >> 2)) * brightness / 15);
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

	private int getPixel(int x, int y, bool sub, ref int r, ref int g, ref int b) @safe pure {
		// array for layer definitions per mode:
		// 0-7: mode 0-7; 8: mode 1 + l3prio; 9: mode 7 + extbg
		// 0-3; layers 1-4; 4: sprites; 5: nonexistent
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
		int actMode = mode == 1 ? 8 : mode;
		actMode = mode == 7 && m7extBg_always_zero ? 9 : actMode;
		int layer = 5;
		int pixel = 0;
		for (int i = 0; i < layerCountPerMode[actMode]; i++) {
			int curLayer = layersPerMode[actMode][i];
			int curPriority = prioritysPerMode[actMode][i];
			bool layerActive = false;
			if (!sub) {
				layerActive = IS_SCREEN_ENABLED(0, curLayer) && (
					!IS_SCREEN_WINDOWED(0, curLayer) || !getWindowState(curLayer, x)
					);
			} else {
				layerActive = IS_SCREEN_ENABLED(1, curLayer) && (
					!IS_SCREEN_WINDOWED(1, curLayer) || !getWindowState(curLayer, x)
					);
			}
			if (layerActive) {
				if (curLayer < 4) {
					// bg layer
					int lx = x;
					int ly = y;
					if (IS_MOSAIC_ENABLED(curLayer)) {
						lx -= lx % mosaicSize;
						ly -= (ly - 1) % mosaicSize;
					}
					if (mode == 7) {
						pixel = getPixelForMode7(lx, curLayer, !!curPriority);
					} else {
						lx += bgLayer[curLayer].hScroll;
						ly += bgLayer[curLayer].vScroll;
						pixel = getPixelForBGLayer(
							lx & 0x3ff, ly & 0x3ff,
							curLayer, !!curPriority
						);
					}
				} else {
					// get a pixel from the sprite buffer
					pixel = 0;
					if ((objBuffer.data[x + kPpuExtraLeftRight] >> 12) == SPRITE_PRIO_TO_PRIO_HI(curPriority)) {
						pixel = objBuffer.data[x + kPpuExtraLeftRight] & 0xff;
					}
				}
			}
			if (pixel > 0) {
				layer = curLayer;
				break;
			}
		}
		ushort color = cgram[pixel & 0xff];
		r = color & 0x1f;
		g = (color >> 5) & 0x1f;
		b = (color >> 10) & 0x1f;
		if (layer == 4 && pixel < 0xc0) {
			layer = 6; // sprites with palette color < 0xc0
		}
		return layer;

	}


	private int getPixelForBGLayer(int x, int y, int layer, bool priority) @safe pure {
		BGLayer *layerp = &bgLayer[layer];
		// figure out address of tilemap word and read it
		bool wideTiles = mode == 5 || mode == 6;
		int tileBitsX = wideTiles ? 4 : 3;
		int tileHighBitX = wideTiles ? 0x200 : 0x100;
		int tileBitsY = 3;
		int tileHighBitY = 0x100;
		ushort tilemapAdr = cast(ushort)(layerp.tilemapAdr + (((y >> tileBitsY) & 0x1f) << 5 | ((x >> tileBitsX) & 0x1f)));
		if ((x & tileHighBitX) && layerp.tilemapWider) {
			tilemapAdr += 0x400;
		}
		if ((y & tileHighBitY) && layerp.tilemapHigher) {
			tilemapAdr += layerp.tilemapWider ? 0x800 : 0x400;
		}
		ushort tile = vram[tilemapAdr & 0x7fff];
		// check priority, get palette
		if ((cast(bool)(tile & 0x2000)) != priority) {
			return 0; // wrong priority
		}
		int paletteNum = (tile & 0x1c00) >> 10;
		// figure out position within tile
		int row = (tile & 0x8000) ? 7 - (y & 0x7) : (y & 0x7);
		int col = (tile & 0x4000) ? (x & 0x7) : 7 - (x & 0x7);
		int tileNum = tile & 0x3ff;
		if (wideTiles) {
			// if unflipped right half of tile, or flipped left half of tile
			if ((cast(bool)(x & 8)) ^ (cast(bool)(tile & 0x4000))) {
				tileNum += 1;
			}
		}
		// read tiledata, ajust palette for mode 0
		int bitDepth = bitDepthsPerMode[mode][layer];
		if (mode == 0) {
			paletteNum += 8 * layer;
		}
		// plane 1 (always)
		int paletteSize = 4;
		ushort plane1 = vram[(layerp.tileAdr + ((tileNum & 0x3ff) * 4 * bitDepth) + row) & 0x7fff];
		int pixel = (plane1 >> col) & 1;
		pixel |= ((plane1 >> (8 + col)) & 1) << 1;
		// plane 2 (for 4bpp, 8bpp)
		if (bitDepth > 2) {
			paletteSize = 16;
			ushort plane2 = vram[(layerp.tileAdr + ((tileNum & 0x3ff) * 4 * bitDepth) + 8 + row) & 0x7fff];
			pixel |= ((plane2 >> col) & 1) << 2;
			pixel |= ((plane2 >> (8 + col)) & 1) << 3;
		}
		// plane 3 & 4 (for 8bpp)
		if (bitDepth > 4) {
			paletteSize = 256;
			ushort plane3 = vram[(layerp.tileAdr + ((tileNum & 0x3ff) * 4 * bitDepth) + 16 + row) & 0x7fff];
			pixel |= ((plane3 >> col) & 1) << 4;
			pixel |= ((plane3 >> (8 + col)) & 1) << 5;
			ushort plane4 = vram[(layerp.tileAdr + ((tileNum & 0x3ff) * 4 * bitDepth) + 24 + row) & 0x7fff];
			pixel |= ((plane4 >> col) & 1) << 6;
			pixel |= ((plane4 >> (8 + col)) & 1) << 7;
		}
		// return cgram index, or 0 if transparent, palette number in bits 10-8 for 8-color layers
		return pixel == 0 ? 0 : paletteSize * paletteNum + pixel;
	}

	private void calculateMode7Starts(int y) @safe pure {
		// expand 13-bit values to signed values
		int hScroll = (cast(short) (m7matrix[6] << 3)) >> 3;
		int vScroll = (cast(short) (m7matrix[7] << 3)) >> 3;
		int xCenter = (cast(short) (m7matrix[4] << 3)) >> 3;
		int yCenter = (cast(short) (m7matrix[5] << 3)) >> 3;
		// do calculation
		int clippedH = hScroll - xCenter;
		int clippedV = vScroll - yCenter;
		clippedH = (clippedH & 0x2000) ? (clippedH | ~1023) : (clippedH & 1023);
		clippedV = (clippedV & 0x2000) ? (clippedV | ~1023) : (clippedV & 1023);
		if(IS_MOSAIC_ENABLED(0)) {
			y -= (y - 1) % mosaicSize;
		}
		ubyte ry = cast(ubyte)(m7yFlip ? 255 - y : y);
		m7startX = (
			((m7matrix[0] * clippedH) & ~63) +
			((m7matrix[1] * ry) & ~63) +
			((m7matrix[1] * clippedV) & ~63) +
			(xCenter << 8)
		);
		m7startY = (
			((m7matrix[2] * clippedH) & ~63) +
			((m7matrix[3] * ry) & ~63) +
			((m7matrix[3] * clippedV) & ~63) +
			(yCenter << 8)
		);
	}

	private int getPixelForMode7(int x, int layer, bool priority) @safe pure {
		if (IS_MOSAIC_ENABLED(layer)) {
			x -= x % mosaicSize;
		}
		ubyte rx = cast(ubyte)(m7xFlip ? 255 - x : x);
		int xPos = (m7startX + m7matrix[0] * rx) >> 8;
		int yPos = (m7startY + m7matrix[2] * rx) >> 8;
		bool outsideMap = xPos < 0 || xPos >= 1024 || yPos < 0 || yPos >= 1024;
		xPos &= 0x3ff;
		yPos &= 0x3ff;
		if(!m7largeField) {
			outsideMap = false;
		}
		ubyte tile = outsideMap ? 0 : vram[(yPos >> 3) * 128 + (xPos >> 3)] & 0xff;
		ubyte pixel = outsideMap && !m7charFill ? 0 : vram[tile * 64 + (yPos & 7) * 8 + (xPos & 7)] >> 8;
		if(layer == 1) {
			if((cast(bool) (pixel & 0x80)) != priority) {
				return 0;
			}
			return pixel & 0x7f;
		}
		return pixel;
	}

	private bool getWindowState(int layer, int x) @safe pure {
		uint winflags = GET_WINDOW_FLAGS(layer);
		if (!(winflags & kWindow1Enabled) && !(winflags & kWindow2Enabled)) {
			return false;
		}
		if ((winflags & kWindow1Enabled) && !(winflags & kWindow2Enabled)) {
			bool test = x >= window1left && x <= window1right;
			return (winflags & kWindow1Inversed) ? !test : test;
		}
		if (!(winflags & kWindow1Enabled) && (winflags & kWindow2Enabled)) {
			bool test = x >= window2left && x <= window2right;
			return (winflags & kWindow2Inversed) ? !test : test;
		}
		bool test1 = x >= window1left && x <= window1right;
		bool test2 = x >= window2left && x <= window2right;
		if (winflags & kWindow1Inversed) {
			test1 = !test1;
		}
		if (winflags & kWindow2Inversed) {
			test2 = !test2;
		}
		return test1 || test2;
	}

	private bool evaluateSprites(int line) @safe pure {
		// TODO: iterate over oam normally to determine in-range sprites,
		// then iterate those in-range sprites in reverse for tile-fetching
		// TODO: rectangular sprites, wierdness with sprites at -256
		int index = 0, index_end = index;
		int spritesLeft = 32 + 1, tilesLeft = 34 + 1;
		ubyte[2] spriteSizes = [ kSpriteSizes[objSize][0], kSpriteSizes[objSize][1] ];
		int extra_left_right = extraLeftRight;
		if (renderFlags & KPPURenderFlags.noSpriteLimits) {
			spritesLeft = tilesLeft = 1024;
		}
		int tilesLeftOrg = tilesLeft;

		do {
			int yy = oam[index] >> 8;
			if (yy == 0xf0) {
				continue; // this works for zelda because sprites are always 8 or 16.
			}
			// check if the sprite is on this line and get the sprite size
			int row = (line - yy) & 0xff;
			int highOam = oam[0x100 + (index >> 4)] >> (index & 15);
			int spriteSize = spriteSizes[(highOam >> 1) & 1];
			if (row >= spriteSize) {
				continue;
			}
			// in y-range, get the x location, using the high bit as well
			int x = (oam[index] & 0xff) + (highOam & 1) * 256;
			x -= (x >= 256 + extra_left_right) * 512;
			// if in x-range
			if (x <= -(spriteSize + extra_left_right)) {
				continue;
			}
			// break if we found 32 sprites already
			if (--spritesLeft == 0) {
				break;
			}
			// get some data for the sprite and y-flip row if needed
			int oam1 = oam[index + 1];
			int objAdr = (oam1 & 0x100) ? objTileAdr2 : objTileAdr1;
			if (oam1 & 0x8000) {
				row = spriteSize - 1 - row;
			}
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
					ushort[] addr = vram[(objAdr + usedTile * 16 + (row & 0x7)) & 0x7fff .. $];
					uint plane = addr[0] | addr[8] << 16;
					// go over each pixel
					int px_left = IntMax(-(col + x + kPpuExtraLeftRight), 0);
					int px_right = IntMin(256 + kPpuExtraLeftRight - (col + x), 8);
					PpuZbufType[] dst = objBuffer.data[col + x + px_left + kPpuExtraLeftRight .. $];

					for (int px = px_left; px < px_right; px++, dst = dst[1 .. $]) {
						int shift = oam1 & 0x4000 ? px : 7 - px;
						uint bits = plane >> shift;
						int pixel = (bits >> 0) & 1 | (bits >> 7) & 2 | (bits >> 14) & 4 | (bits >> 21) & 8;
						// draw it in the buffer if there is a pixel here, and the buffer there is still empty
						if (pixel != 0 && (dst[0] & 0xff) == 0) {
							dst[0] = cast(ushort)(z + pixel);
						}
					}
				}
			}
		} while ((index = (index + 2) & 0xff) != index_end);
		return (tilesLeft != tilesLeftOrg);
	}

	ubyte read(ubyte adr) @safe pure {
		switch (adr) {
			case 0x34:
			case 0x35:
			case 0x36:
				int result = m7matrix[0] * (m7matrix[1] >> 8);
				return (result >> (8 * (adr - 0x34))) & 0xff;
			default: break;
		}
		return 0xff;
	}

	void write(ubyte adr, ubyte val) @safe pure {
		switch(adr) {
			case 0x00: // INIDISP
				brightness = val & 0xf;
				forcedBlank = !!(val & 0x80);
				break;
			case 0x01: //OBSEL
				objSize = val >> 5;
				objTileAdr1 = (val & 0b0000_0111) << 13;
				objTileAdr2 = cast(ushort)(objTileAdr1 + ((val & 0b0001_1000) + 1) << 12);
				break;
			case 0x02: //OAMADDL
				oamAdr = (oamAdr & ~0xff) | val;
				oamSecondWrite = false;
				break;
			case 0x03: //OAMADDH
				//assert((val & 0x80) == 0);
				oamAdr = (oamAdr & ~0xff00) | ((val & 1) << 8);
				oamSecondWrite = false;
				break;
			case 0x04: //OAMDATA
				if (!oamSecondWrite) {
					oamBuffer = val;
				} else {
					if (oamAdr < 0x110)
						oam[oamAdr++] = (val << 8) | oamBuffer;
				}
				oamSecondWrite = !oamSecondWrite;
				break;
			case 0x05: // BGMODE
				mode = val & 0x7;
				//assert(val == 7 || val == 9);
				//assert(mode == 1 || mode == 7);
				//assert((val & 0xf0) == 0);
				break;
			case 0x06: // MOSAIC
				mosaicSize = (val >> 4) + 1;
				mosaicEnabled = (mosaicSize > 1) ? val : 0;
				break;
			case 0x07: // BG1SC
			case 0x08: // BG2SC
			case 0x09: // BG3SC
			case 0x0a: //BG4SC
				// small tilemaps are used in attract intro
				bgLayer[adr - 7].tilemapWider = val & 0x1;
				bgLayer[adr - 7].tilemapHigher = !!(val & 0x2);
				bgLayer[adr - 7].tilemapAdr = (val & 0xfc) << 8;
				break;
			case 0x0b: // BG12NBA
				bgLayer[0].tileAdr = (val & 0xf) << 12;
				bgLayer[1].tileAdr = (val & 0xf0) << 8;
				break;
			case 0x0c: // BG34NBA
				bgLayer[2].tileAdr = (val & 0xf) << 12;
				bgLayer[3].tileAdr = (val & 0xf0) << 8;
				break;
			case 0x0d: // BG1HOFS
				m7matrix[6] = ((val << 8) | m7prev) & 0x1fff;
				m7prev = val;
				goto case;
			case 0x0f: //BG2HOFS
			case 0x11: //BG3HOFS
			case 0x13: // BG4HOFS
				bgLayer[(adr - 0xd) / 2].hScroll = ((val << 8) | (scrollPrev & 0xf8) | (scrollPrev2 & 0x7)) & 0x3ff;
				scrollPrev = val;
				scrollPrev2 = val;
				break;
			case 0x0e: // BG1VOFS
				m7matrix[7] = ((val << 8) | m7prev) & 0x1fff;
				m7prev = val;
				goto case;
			case 0x10: // BG2VOFS
			case 0x12: // BG3VOFS
			case 0x14: //BG4VOFS
				bgLayer[(adr - 0xe) / 2].vScroll = ((val << 8) | scrollPrev) & 0x3ff;
				scrollPrev = val;
				break;
			case 0x15: // VMAIN
				if((val & 3) == 0) {
					vramIncrement = 1;
				} else if((val & 3) == 1) {
					vramIncrement = 32;
				} else {
					vramIncrement = 128;
				}
				//assert(((val & 0xc) >> 2) == 0);
				vramIncrementOnHigh = !!(val & 0x80);
				break;
			case 0x16: // VMADDL
				vramPointer = (vramPointer & 0xff00) | val;
				break;
			case 0x17: // VMADDH
				vramPointer = (vramPointer & 0x00ff) | (val << 8);
				break;
			case 0x18: // VMDATAL
				ushort vramAdr = vramPointer;
				vram[vramAdr & 0x7fff] = (vram[vramAdr & 0x7fff] & 0xff00) | val;
				if(!vramIncrementOnHigh) {
					vramPointer += vramIncrement;
				}
				break;
			case 0x19: // VMDATAH
				ushort vramAdr = vramPointer;
				vram[vramAdr & 0x7fff] = (vram[vramAdr & 0x7fff] & 0x00ff) | (val << 8);
				if(vramIncrementOnHigh) {
					vramPointer += vramIncrement;
				}
				break;
			case 0x1a: // M7SEL
				m7largeField = !!(val & 0x80);
				m7charFill = !!(val & 0x40);
				m7yFlip = !!(val & 0x2);
				m7xFlip = val & 0x1;
				break;
			case 0x1b: // M7A etc
			case 0x1c:
			case 0x1d:
			case 0x1e:
				m7matrix[adr - 0x1b] = cast(short)((val << 8) | m7prev);
				m7prev = val;
				break;
			case 0x1f:
			case 0x20:
				m7matrix[adr - 0x1b] = ((val << 8) | m7prev) & 0x1fff;
				m7prev = val;
				break;
			case 0x21:
				cgramPointer = val;
				cgramSecondWrite = false;
				break;
			case 0x22:
				if(!cgramSecondWrite) {
					cgramBuffer = val;
				} else {
					cgram[cgramPointer++] = (val << 8) | cgramBuffer;
				}
				cgramSecondWrite = !cgramSecondWrite;
				break;
			case 0x23: // W12SEL
				windowsel = (windowsel & ~0xff) | val;
				break;
			case 0x24: // W34SEL
				windowsel = (windowsel & ~0xff00) | (val << 8);
				break;
			case 0x25: // WOBJSEL
				windowsel = (windowsel & ~0xff0000) | (val << 16);
				break;
			case 0x26:
				window1left = val;
				break;
			case 0x27:
				window1right = val;
				break;
			case 0x28:
				window2left = val;
				break;
			case 0x29:
				window2right = val;
				break;
			case 0x2a: // WBGLOG
				//assert(val == 0);
				break;
			case 0x2b: // WOBJLOG
				//assert(val == 0);
				break;
			case 0x2c: // TM
				screenEnabled[0] = val;
				break;
			case 0x2d: // TS
				screenEnabled[1] = val;
				break;
			case 0x2e: // TMW
				screenWindowed[0] = val;
				break;
			case 0x2f: // TSW
				screenWindowed[1] = val;
				break;
			case 0x30: // CGWSEL
				//assert((val & 1) == 0); // directColor always zero
				addSubscreen = !!(val & 0x2);
				preventMathMode = (val & 0x30) >> 4;
				clipMode = (val & 0xc0) >> 6;
				break;
			case 0x31: // CGADSUB
				subtractColor = !!(val & 0x80);
				halfColor = !!(val & 0x40);
				mathEnabled = val & 0x3f;
				break;
			case 0x32: // COLDATA
				if(val & 0x80) {
					fixedColorB = val & 0x1f;
				}
				if(val & 0x40) {
					fixedColorG = val & 0x1f;
				}
				if(val & 0x20) {
					fixedColorR = val & 0x1f;
				}
				break;
			case 0x33:
				//assert(val == 0);
				m7extBg_always_zero = !!(val & 0x40);
				break;
			default:
				break;
		}
	}

	void INIDISP(ubyte val) @safe pure {
		write(0x00, val);
	}
	void OBSEL(ubyte val) @safe pure {
		write(0x01, val);
	}
	void BGMODE(ubyte val) @safe pure {
		write(0x05, val);
	}
	void MOSAIC(ubyte val) @safe pure {
		write(0x06, val);
	}
	void BG1SC(ubyte val) @safe pure {
		write(0x07, val);
	}
	void BG2SC(ubyte val) @safe pure {
		write(0x08, val);
	}
	void BG3SC(ubyte val) @safe pure {
		write(0x09, val);
	}
	void BG4SC(ubyte val) @safe pure {
		write(0x0A, val);
	}
	void BG12NBA(ubyte val) @safe pure {
		write(0x0B, val);
	}
	void BG34NBA(ubyte val) @safe pure {
		write(0x0C, val);
	}
	void BG1HOFS(ushort val) @safe pure {
		write(0x0D, val & 0xFF);
		write(0x0D, val >> 8);
	}
	void BG1VOFS(ushort val) @safe pure {
		write(0x0E, val & 0xFF);
		write(0x0E, val >> 8);
	}
	void BG2HOFS(ushort val) @safe pure {
		write(0x0F, val & 0xFF);
		write(0x0F, val >> 8);
	}
	void BG2VOFS(ushort val) @safe pure {
		write(0x10, val & 0xFF);
		write(0x10, val >> 8);
	}
	void BG3HOFS(ushort val) @safe pure {
		write(0x11, val & 0xFF);
		write(0x11, val >> 8);
	}
	void BG3VOFS(ushort val) @safe pure {
		write(0x12, val & 0xFF);
		write(0x12, val >> 8);
	}
	void BG4HOFS(ushort val) @safe pure {
		write(0x13, val & 0xFF);
		write(0x13, val >> 8);
	}
	void BG4VOFS(ushort val) @safe pure {
		write(0x14, val & 0xFF);
		write(0x14, val >> 8);
	}
	void W12SEL(ubyte val) @safe pure {
		write(0x23, val);
	}
	void W34SEL(ubyte val) @safe pure {
		write(0x24, val);
	}
	void WOBJSEL(ubyte val) @safe pure {
		write(0x25, val);
	}
	void WH0(ubyte val) @safe pure {
		write(0x26, val);
	}
	void WH1(ubyte val) @safe pure {
		write(0x27, val);
	}
	void WH2(ubyte val) @safe pure {
		write(0x28, val);
	}
	void WH3(ubyte val) @safe pure {
		write(0x29, val);
	}
	void WBGLOG(ubyte val) @safe pure {
		write(0x2A, val);
	}
	void WOBJLOG(ubyte val) @safe pure {
		write(0x2B, val);
	}
	void TM(ubyte val) @safe pure {
		write(0x2C, val);
	}
	void TS(ubyte val) @safe pure {
		write(0x2D, val);
	}
	void TMW(ubyte val) @safe pure {
		write(0x2E, val);
	}
	void TSW(ubyte val) @safe pure {
		write(0x2F, val);
	}
	void CGWSEL(ubyte val) @safe pure {
		write(0x30, val);
	}
	void CGADSUB(ubyte val) @safe pure {
		write(0x31, val);
	}
	bool IS_SCREEN_ENABLED(uint sub, uint layer) @safe pure { return !!(screenEnabled[sub] & (1 << layer)); }
	bool IS_SCREEN_WINDOWED(uint sub, uint layer) @safe pure { return !!(screenWindowed[sub] & (1 << layer)); }
	bool IS_MOSAIC_ENABLED(uint layer) @safe pure { return !!(mosaicEnabled & (1 << layer)); }
	bool GET_WINDOW_FLAGS(uint layer) @safe pure { return !!(windowsel >> (layer * 4)); }
}

immutable ubyte[2][8] kSpriteSizes = [
	[8, 16], [8, 32], [8, 64], [16, 32],
	[16, 64], [32, 64], [16, 32], [16, 32]
];

enum {
	kWindow1Inversed = 1,
	kWindow1Enabled = 2,
	kWindow2Inversed = 4,
	kWindow2Enabled = 8,
}

alias SaveLoadFunc = void function(void*, void*, size_t);


struct PpuWindows {
	short[6] edges;
	ubyte nr;
	ubyte bits;
}
