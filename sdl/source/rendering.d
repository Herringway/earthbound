module rendering;

import core.time;
import std.experimental.logger;
import std.string;

import bindbc.sdl;

import earthbound.hardware;

import misc;
import snesdrawframe;

ubyte layersDisabled;

public struct HDMAWrite {
	ushort vcounter;
	ubyte addr;
	ubyte value;
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
	ubyte FIXED_COLOUR_DATA_R;
	ubyte FIXED_COLOUR_DATA_G;
	ubyte FIXED_COLOUR_DATA_B;
	ubyte SETINI;

	ushort[0x8000] vram;
	ushort[0x100] cgram;
	OAMEntry[128] oam1;
	ubyte[32] oam2;

	ushort numHdmaWrites;
	HDMAWrite[4*8*240] hdmaData;
	void toString(T)(T sink) const {
		import std.format : format, formattedWrite;
		import std.range : chunks, enumerate, put;
		static immutable sprite1Widths = [8, 8, 8, 16, 16, 32, 16, 16];
		static immutable sprite1Heights = [8, 8, 8, 16, 16, 32, 32, 32];
		static immutable sprite2Widths = [16, 32, 64, 32, 64, 64, 32, 32];
		static immutable sprite2Heights = [16, 32, 64, 32, 64, 64, 64, 32];
		sink.formattedWrite!"Display: Mode %s, screen %s (brightness: %s)\n"(BGMODE & 0b00000111, INIDISP & 0b10000000 ? "Enabled" : "Disabled", INIDISP & 0b00001111);
		sink.formattedWrite!"BG1 - Tilemap: $%04X, Tiles: $%04X, Tile size: %s\n"((BG1SC & 0b11111100) << 9, (BG12NBA & 0b00001111) << 13, !!(BGMODE & 0b10000000) ? "8x8" : "16x16");
		sink.formattedWrite!"BG2 - Tilemap: $%04X, Tiles: $%04X, Tile size: %s\n"((BG2SC & 0b11111100) << 9, (BG12NBA & 0b11110000) << 9, !!(BGMODE & 0b01000000) ? "8x8" : "16x16");
		sink.formattedWrite!"BG3 - Tilemap: $%04X, Tiles: $%04X, Tile size: %s\n"((BG3SC & 0b11111100) << 9, (BG34NBA & 0b00001111) << 13, !!(BGMODE & 0b00100000) ? "8x8" : "16x16");
		sink.formattedWrite!"BG4 - Tilemap: $%04X, Tiles: $%04X, Tile size: %s\n"((BG4SC & 0b11111100) << 9, (BG34NBA & 0b11110000) << 9, !!(BGMODE & 0b00010000) ? "8x8" : "16x16");
		string spriteSize1 = format!"%sx%s"(sprite1Widths[(OBSEL & 0b11100000) >> 5], sprite1Heights[(OBSEL & 0b11100000) >> 5]);
		string spriteSize2 = format!"%sx%s"(sprite2Widths[(OBSEL & 0b11100000) >> 5], sprite2Heights[(OBSEL & 0b11100000) >> 5]);
		sink.formattedWrite!"OAM: $%04X (name $%04X), table: $%04X (priority: %s), Sprite sizes: %s, %s\n"(
			(OBSEL & 0b00000111) << 14,
			(OBSEL & 0b00011000) >> 3,
			OAMADDR & 0b0000000111111111,
			!!(OAMADDR & 0b1000000000000000),
			spriteSize1,
			spriteSize2
		);
		sink.formattedWrite!"OAM Table: \n"();
		foreach (id, entry; oam1) {
			const uint upperX = !!(oam2[id/4] & (1 << ((id % 4) * 2)));
			const size = !!(oam2[id/4] & (1 << ((id % 4) * 2 + 1)));
			if (entry.yCoord < 0xE0) {
				sink.formattedWrite!"\t% d: %s (%d, %d) palette: %s, flip vertical: %s, flip horizontal: %s, priority: %s, nametable: %s, size: %s\n"(id, entry.startingTile, entry.xCoord + (upperX << 8), entry.yCoord, entry.palette, entry.flipVertical, entry.flipHorizontal, entry.priority, entry.nameTable, size ? spriteSize2 : spriteSize1);
			}
		}
		foreach (idx, palette; cgram[].chunks(16).enumerate) {
			if (idx >= 8) {
				sink.formattedWrite!"Sprite palette %s "(idx - 8);
			} else {
				sink.formattedWrite!"BG palette %s "(idx);
			}
			foreach (colour; palette) {
				ubyte red = cast(ubyte)(((colour >> 0) & 0x1F) * 8);
				ubyte green = cast(ubyte)(((colour >> 5) & 0x1F) * 8);
				ubyte blue = cast(ubyte)(((colour >> 10) & 0x1F) * 8);
				sink.formattedWrite("\x1B[38;2;%d;%d;%dm█\x1B[0m", red, green, blue);
			}
			put(sink, "\n");
		}
	}
}

public __gshared SnesDrawFrameData g_frameData;
private SDL_Window* appWin;
private SDL_Renderer* renderer;
private SDL_Texture* drawTexture;
private int lastTime;

bool loadRenderer() {
	if(loadSDL() < sdlSupport) {
		info("Can't load SDL!");
		return false;
	}
	if(!loadSnesDrawFrame()) {
		info("Can't load SnesDrawFrame!");
		return false;
	}
	if(!initSnesDrawFrame()) {
		info("Error initializing SnesDrawFrame!");
		return false;
	}
	info("SnesDrawFrame initialized");
	if(SDL_Init(SDL_INIT_VIDEO) != 0) {
		SDLError("Error initializing SDL: %s");
		return false;
	}
	infof("SDL video subsystem initialized (%s)", SDL_GetCurrentVideoDriver().fromStringz);
	return true;
}
void unloadRenderer() {
	SDL_Quit();
}

bool initializeRenderer(uint zoom, WindowMode mode, bool keepAspectRatio) {
	enum windowFlags = SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE;
	appWin = SDL_CreateWindow(
		"Earthbound",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		ImgW * zoom,
		ImgH * zoom,
		windowFlags
	);
	final switch (mode) {
		case WindowMode.windowed:
			break;
		case WindowMode.fullscreen:
			SDL_SetWindowFullscreen(appWin, SDL_WINDOW_FULLSCREEN_DESKTOP);
			break;
		case WindowMode.fullscreenExclusive:
			SDL_SetWindowFullscreen(appWin, SDL_WINDOW_FULLSCREEN);
			break;
	}
	if(appWin is null) {
		SDLError("Error creating SDL window: %s");
		return false;
	}
	const rendererFlags = SDL_RENDERER_ACCELERATED;
	renderer = SDL_CreateRenderer(
		appWin, -1, rendererFlags
	);
	if(renderer is null) {
		SDLError("Error creating SDL renderer: %s");
		return false;
	}
	if (keepAspectRatio) {
		SDL_RenderSetLogicalSize(renderer, ImgW, ImgH);
	}
	SDL_SetRenderDrawBlendMode(renderer, SDL_BLENDMODE_BLEND);
	SDL_RendererInfo renderInfo;
	SDL_GetRendererInfo(renderer, &renderInfo);
	infof("SDL renderer subsystem initialized (%s)", renderInfo.name.fromStringz);
	drawTexture = SDL_CreateTexture(
		renderer,
		SDL_PIXELFORMAT_RGB555,
		SDL_TEXTUREACCESS_STREAMING,
		ImgW,
		ImgH
	);
	if(drawTexture is null) {
		SDLError("Error creating SDL texture: %s");
		return false;
	}
	return true;
}

void uninitializeRenderer() {
	// Close and destroy the window
	if (appWin !is null) {
		SDL_DestroyWindow(appWin);
	}
	// Close and destroy the renderer
	if (renderer !is null) {
		SDL_DestroyRenderer(renderer);
	}
	// Close and destroy the texture
	if (drawTexture !is null) {
		SDL_DestroyTexture(drawTexture);
	}
}

void startFrame() {
	lastTime = SDL_GetTicks();
}

void endFrame() {
	ushort* drawBuffer;
	int drawPitch;
	SDL_LockTexture(drawTexture, null, cast(void**)&drawBuffer, &drawPitch);
	snesdrawframe.drawFrame(drawBuffer, drawPitch, &g_frameData);
	SDL_UnlockTexture(drawTexture);

	SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
	SDL_RenderClear(renderer);
	SDL_RenderCopy(renderer, drawTexture, null, null);
	foreach (rectangle; overlayRectangles) {
		renderRectangle(rectangle);
	}
	overlayRectangles = [];
	SDL_RenderPresent(renderer);
}

Duration waitForNextFrame(bool lockFramerate) {
	int drawTime = SDL_GetTicks() - lastTime;
	if(lockFramerate && (drawTime < 16)) {
		SDL_Delay(16 - drawTime);
	}
	return drawTime.msecs;
}

Duration timeSinceFrameStart() {
	return (SDL_GetTicks() - lastTime).msecs;
}

void setTitle(scope const char[] title) {
	SDL_SetWindowTitle(appWin, title.toStringz);
}

void copyGlobalsToFrameData() {
	g_frameData.INIDISP = INIDISP;
	g_frameData.OBSEL = OBSEL;
	//g_frameData.OAMADDR = OAMADDL | OAMADDH << 8;
	g_frameData.BGMODE = BGMODE;
	g_frameData.MOSAIC = MOSAIC;
	g_frameData.BG1SC = BG1SC;
	g_frameData.BG2SC = BG2SC;
	g_frameData.BG3SC = BG3SC;
	g_frameData.BG4SC = BG4SC;
	g_frameData.BG12NBA = BG12NBA;
	g_frameData.BG34NBA = BG34NBA;
	g_frameData.W12SEL = W12SEL;
	g_frameData.W34SEL = W34SEL;
	g_frameData.WOBJSEL = WOBJSEL;
	g_frameData.WH0 = WH0;
	g_frameData.WH1 = WH1;
	g_frameData.WH2 = WH2;
	g_frameData.WH3 = WH3;
	g_frameData.WBGLOG = WBGLOG;
	g_frameData.WOBJLOG = WOBJLOG;
	g_frameData.TM = TM ^ layersDisabled;
	g_frameData.TS = TD;
	g_frameData.TMW = TMW;
	g_frameData.TSW = TSW;
	g_frameData.CGWSEL = CGWSEL;
	g_frameData.CGADSUB = CGADSUB;
	//g_frameData.SETINI = SETINI;
}

void setFixedColourData(ubyte val) {
	const intensity = val & 0x1F;
	if (val & 0x80) {
		g_frameData.FIXED_COLOUR_DATA_B = intensity;
	}
	if (val & 0x40) {
		g_frameData.FIXED_COLOUR_DATA_G = intensity;
	}
	if (val & 0x20) {
		g_frameData.FIXED_COLOUR_DATA_R = intensity;
	}
}

void setBGOffsetX(ubyte layer, ushort x) {
	switch (layer) {
		case 1:
			g_frameData.BG1HOFS = x;
			break;
		case 2:
			g_frameData.BG2HOFS = x;
			break;
		case 3:
			g_frameData.BG3HOFS = x;
			break;
		case 4:
			g_frameData.BG4HOFS = x;
			break;
		default: assert(0);
	}
}
void setBGOffsetY(ubyte layer, ushort y) {
	switch (layer) {
		case 1:
			g_frameData.BG1VOFS = y;
			break;
		case 2:
			g_frameData.BG2VOFS = y;
			break;
		case 3:
			g_frameData.BG3VOFS = y;
			break;
		case 4:
			g_frameData.BG4VOFS = y;
			break;
		default: assert(0);
	}
}

struct ColouredRectangle {
	short x, y;
	short w, h;
	ubyte r, g, b, a;
}

ColouredRectangle[] overlayRectangles;

void drawRect(short x1, short y1, short x2, short y2, ubyte r, ubyte g, ubyte b, ubyte a) {
	overlayRectangles ~= ColouredRectangle(x1, y1, cast(short)(x2 - x1), cast(short)(y2 - y1), r, g, b, a);
}
void renderRectangle(const ColouredRectangle rect) {
	const dim = SDL_Rect(rect.x * 2, rect.y * 2, rect.w * 2, rect.h * 2);
	assert(SDL_SetRenderDrawColor(renderer, rect.r, rect.g, rect.b, rect.a) >= 0);
	assert(SDL_RenderFillRect(renderer, &dim) >= 0);
}
