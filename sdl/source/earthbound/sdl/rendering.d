module earthbound.sdl.rendering;

import core.time;
import std.exception;
import std.experimental.logger;
import std.string;

import bindbc.sdl;

import earthbound.hardware;

import earthbound.sdl.debugging;
import earthbound.sdl.misc;
import earthbound.sdl.snesdrawframe;
import earthbound.sdl.ppu;

import imgui.sdl;
import imgui.sdlrenderer;
import d_imgui.imgui_h;
import ImGui = d_imgui;

enum nativeFormat = SDL_PIXELFORMAT_RGB555;

ubyte layersDisabled;
private uint frameTotal;
private char[30] frameRateStringBuffer;
private uint frameCounter;
const(char)[] frameRateString = "??";
void updateFrameRate() {
	frameTotal += timeSinceFrameStart.total!"msecs";
	if (frameCounter++ == 60) {
		frameRateString = sformat(frameRateStringBuffer, "%.4s FPS", 1000.0 / (cast(double)frameTotal / 60.0));
		frameCounter = 0;
		frameTotal = 0;
	}
}

version(Windows) {
	enum libName = "SDL2.dll";
} else version (OSX) {
	enum libName = "libSDL2.dylib";
} else version (Posix) {
	enum libName = "libSDL2.so";
}

public struct HDMAWrite {
	ushort vcounter;
	ubyte addr;
	ubyte value;
}

enum Renderer {
	bsnes,
	neo,
}

SNESRenderer renderer;

struct SNESRenderer {
	private enum defaultWidth = 256;
	private enum defaultHeight = 224;
	private SnesDrawFrameData bsnesFrame;
	private PPU neoRenderer;
	private HDMAWrite[4*8*240] neoHDMAData;
	private ushort neoNumHDMA;
	ushort width = defaultWidth;
	ushort height = defaultHeight;
	private Renderer renderer;
	uint textureType;
	void initialize(Renderer renderer) {
		this.renderer = renderer;
		final switch (renderer) {
			case Renderer.bsnes:
				textureType = SDL_PIXELFORMAT_RGB555;
				width = defaultWidth * 2;
				height = defaultHeight * 2;
				enforce(loadSnesDrawFrame(), "Could not load SnesDrawFrame");
				enforce(initSnesDrawFrame(), "Could not initialize SnesDrawFrame");
				info("SnesDrawFrame initialized");
				break;
			case Renderer.neo:
				textureType = SDL_PIXELFORMAT_ARGB8888;
				neoRenderer.extraLeftRight = (defaultWidth - 256) / 2;
				neoRenderer.setExtraSideSpace((defaultWidth - 256) / 2, (defaultWidth - 256) / 2, (defaultHeight - 224) / 2);
				info("Neo initialized");
				break;
		}
	}
	void draw(ubyte[] texture, int pitch) {
		final switch (renderer) {
			case Renderer.bsnes:
				.drawFrame(cast(ushort*)&texture[0], pitch, &bsnesFrame);
				break;
			case Renderer.neo:
				neoRenderer.beginDrawing(texture, pitch, KPPURenderFlags.newRenderer);
				HDMAWrite[] hdmaTemp = neoHDMAData[0 .. neoNumHDMA];
				foreach (i; 0 .. height) {
					while ((hdmaTemp.length > 0) && (hdmaTemp[0].vcounter == i)) {
						neoRenderer.write(hdmaTemp[0].addr, hdmaTemp[0].value);
						hdmaTemp = hdmaTemp[1 .. $];
					}
					neoRenderer.runLine(i);
				}
				break;
		}
	}
	ushort[] getFrameData() {
		uint _;
		return getFrameData(_);
	}
	ushort[] getFrameData(out uint pitch) {
		final switch (renderer) {
			case Renderer.bsnes:
				pitch = 256 * 4;
				return .getFrameData(&bsnesFrame);
			case Renderer.neo:
				auto frame = new ubyte[](width * height * 4);
				pitch = width * 4;
				draw(frame, width * 4);
				return cast(ushort[])frame;
		}
	}
	ref inout(ushort) numHDMA() inout {
		final switch (renderer) {
			case Renderer.bsnes:
				return bsnesFrame.numHdmaWrites;
			case Renderer.neo:
				return neoNumHDMA;
		}
	}
	inout(HDMAWrite)[] hdmaData() inout {
		final switch (renderer) {
			case Renderer.bsnes:
				return bsnesFrame.hdmaData[];
			case Renderer.neo:
				return neoHDMAData[];
			}
	}
	ubyte[] vram() {
		final switch (renderer) {
			case Renderer.bsnes:
				return cast(ubyte[])bsnesFrame.vram[];
			case Renderer.neo:
				return cast(ubyte[])(neoRenderer.vram[]);
		}
	}
	ushort[] cgram() {
		final switch (renderer) {
			case Renderer.bsnes:
				return bsnesFrame.cgram[];
			case Renderer.neo:
				return neoRenderer.cgram[];
		}
	}
	OAMEntry[] oam1() {
		final switch (renderer) {
			case Renderer.bsnes:
				return cast(OAMEntry[])(bsnesFrame.oam1[]);
			case Renderer.neo:
				return cast(OAMEntry[])(neoRenderer.oam[0 .. 0x100]);
		}
	}
	ubyte[] oam2() {
		final switch (renderer) {
			case Renderer.bsnes:
				return bsnesFrame.oam2[];
			case Renderer.neo:
				return cast(ubyte[])(neoRenderer.oam[0x100 .. $]);
		}
	}
	const(ubyte)[] registers() const {
		final switch (renderer) {
			case Renderer.bsnes:
				return bsnesFrame.getRegistersConst;
			case Renderer.neo:
				return []; // unsupported
		}
	}
	const(HDMAWrite[]) allHDMAData() const {
		return hdmaData[0 .. numHDMA];
	}
	private  template Register(ubyte addr, string Reg) {
		alias T = typeof(__traits(getMember, bsnesFrame, Reg));
		static T remembered;
		T Register() {
			final switch (renderer) {
				case Renderer.bsnes:
					return __traits(getMember, bsnesFrame, Reg);
				case Renderer.neo:
					return remembered;
			}
		}
		void Register(T newValue) {
			final switch (renderer) {
				case Renderer.bsnes:
					__traits(getMember, bsnesFrame, Reg) = newValue;
					break;
				case Renderer.neo:
					remembered = newValue;
					static if (is(T : ubyte)) {
						neoRenderer.write(addr, newValue);
					} else {
						neoRenderer.write(addr, newValue & 0xFF);
						neoRenderer.write(addr, newValue >> 8);
					}
					break;
			}
		}
	}
	alias INIDISP = Register!(0x00, "INIDISP");
	alias OBSEL = Register!(0x01, "OBSEL");
	alias BGMODE = Register!(0x05, "BGMODE");
	ushort OAMADDR() {
		return bsnesFrame.OAMADDR;
	}
	alias MOSAIC = Register!(0x06, "MOSAIC");
	alias BG1SC = Register!(0x07, "BG1SC");
	alias BG2SC = Register!(0x08, "BG2SC");
	alias BG3SC = Register!(0x09, "BG3SC");
	alias BG4SC = Register!(0x0A, "BG4SC");
	alias BG12NBA = Register!(0x0B, "BG12NBA");
	alias BG34NBA = Register!(0x0C, "BG34NBA");
	alias BG1HOFS = Register!(0x0D, "BG1HOFS");
	alias BG1VOFS = Register!(0x0E, "BG1VOFS");
	alias BG2HOFS = Register!(0x0F, "BG2HOFS");
	alias BG2VOFS = Register!(0x10, "BG2VOFS");
	alias BG3HOFS = Register!(0x11, "BG3HOFS");
	alias BG3VOFS = Register!(0x12, "BG3VOFS");
	alias BG4HOFS = Register!(0x13, "BG4HOFS");
	alias BG4VOFS = Register!(0x14, "BG4VOFS");
	alias M7SEL = Register!(0x1A, "M7SEL");
	alias M7A = Register!(0x1B, "M7A");
	alias M7B = Register!(0x1C, "M7B");
	alias M7C = Register!(0x1D, "M7C");
	alias M7D = Register!(0x1E, "M7D");
	alias M7X = Register!(0x1F, "M7X");
	alias M7Y = Register!(0x20, "M7Y");
	alias W12SEL = Register!(0x23, "W12SEL");
	alias W34SEL = Register!(0x24, "W34SEL");
	alias WOBJSEL = Register!(0x25, "WOBJSEL");
	alias WH0 = Register!(0x26, "WH0");
	alias WH1 = Register!(0x27, "WH1");
	alias WH2 = Register!(0x28, "WH2");
	alias WH3 = Register!(0x29, "WH3");
	alias WBGLOG = Register!(0x2A, "WBGLOG");
	alias WOBJLOG = Register!(0x2B, "WOBJLOG");
	alias TM = Register!(0x2C, "TM");
	alias TS = Register!(0x2D, "TS");
	alias TMW = Register!(0x2E, "TMW");
	alias TSW = Register!(0x2F, "TSW");
	alias CGWSEL = Register!(0x30, "CGWSEL");
	alias CGADSUB = Register!(0x31, "CGADSUB");
	alias SETINI = Register!(0x33, "SETINI");
	ubyte FIXED_COLOUR_DATA_B() {
		return bsnesFrame.FIXED_COLOUR_DATA_B;
	}
	ubyte FIXED_COLOUR_DATA_G() {
		return bsnesFrame.FIXED_COLOUR_DATA_G;
	}
	ubyte FIXED_COLOUR_DATA_R() {
		return bsnesFrame.FIXED_COLOUR_DATA_R;
	}
	void FIXED_COLOUR_DATA_B(ubyte i) {
		bsnesFrame.FIXED_COLOUR_DATA_B = i;
	}
	void FIXED_COLOUR_DATA_G(ubyte i) {
		bsnesFrame.FIXED_COLOUR_DATA_G = i;
	}
	void FIXED_COLOUR_DATA_R(ubyte i) {
		bsnesFrame.FIXED_COLOUR_DATA_R = i;
	}
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
	const(ubyte[]) getRegistersConst() const {
		const ubyte* first = cast(const ubyte*)(&INIDISP);
		const ubyte* last  = cast(const ubyte*)(&SETINI);
		return first[0..(last-first+1)];
	}
}

private SDL_Window* appWin;
private SDL_Renderer* sdlRenderer;
private SDL_Texture* drawTexture;
private int lastTime;
private int gameX = 0;
private int gameY = 0;
private int gameWidth;
private int gameHeight;

void loadRenderer(Renderer r) {
    enforceSDLLoaded!("SDL", SDL_GetVersion, libName)(loadSDL());
    renderer.initialize(r);
	enforceSDL(SDL_Init(SDL_INIT_VIDEO) == 0, "Error initializing SDL");
	infof("SDL video subsystem initialized (%s)", SDL_GetCurrentVideoDriver().fromStringz);
}
void unloadRenderer() {
	SDL_Quit();
}

void initializeRenderer(uint zoom, WindowMode mode, bool keepAspectRatio, bool reserveDebugArea) {
	enum windowFlags = SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE;
	const int extraWidth = reserveDebugArea ? debugWindowWidth : 0;
	const int extraHeight = reserveDebugArea ? debugMenuHeight : 0;
	gameX = extraWidth;
	gameY = extraHeight;
	gameWidth = renderer.width * zoom;
	gameHeight = renderer.height * zoom;
	appWin = SDL_CreateWindow(
		"Earthbound",
		SDL_WINDOWPOS_UNDEFINED,
		SDL_WINDOWPOS_UNDEFINED,
		gameWidth + extraWidth,
		gameHeight + extraHeight,
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
	enforceSDL(appWin !is null, "Error creating SDL window");
	const rendererFlags = SDL_RENDERER_ACCELERATED;
	sdlRenderer = SDL_CreateRenderer(
		appWin, -1, rendererFlags
	);
	enforceSDL(sdlRenderer !is null, "Error creating SDL renderer");
	if (keepAspectRatio) {
		SDL_RenderSetLogicalSize(sdlRenderer, gameWidth + extraWidth, gameHeight + extraHeight);
	}
	SDL_SetRenderDrawBlendMode(sdlRenderer, SDL_BLENDMODE_BLEND);
	SDL_RendererInfo renderInfo;
	SDL_GetRendererInfo(sdlRenderer, &renderInfo);
	infof("SDL renderer subsystem initialized (%s)", renderInfo.name.fromStringz);
	drawTexture = SDL_CreateTexture(
		sdlRenderer,
		renderer.textureType,
		SDL_TEXTUREACCESS_STREAMING,
		renderer.width,
		renderer.height
	);
	enforceSDL(drawTexture !is null, "Error creating SDL texture");
}

ImGui.ImGuiContext* imguiContext;

void initializeImgui() {
	IMGUI_CHECKVERSION();
	imguiContext = ImGui.CreateContext();
	ImGuiIO* io = &ImGui.GetIO();

	ImGui.StyleColorsDark();
	io.FontGlobalScale = 1.5;

	ImGui_ImplSDL2_InitForSDLRenderer(appWin, sdlRenderer);
	ImGui_ImplSDLRenderer_Init(sdlRenderer);
}
void uninitializeImgui() {
	ImGui_ImplSDLRenderer_Shutdown();
	ImGui_ImplSDL2_Shutdown();
	ImGui.DestroyContext(imguiContext);
}

void uninitializeRenderer() {
	// Close and destroy the window
	if (appWin !is null) {
		SDL_DestroyWindow(appWin);
	}
	// Close and destroy the renderer
	if (sdlRenderer !is null) {
		SDL_DestroyRenderer(sdlRenderer);
	}
	// Close and destroy the texture
	if (drawTexture !is null) {
		SDL_DestroyTexture(drawTexture);
	}
}

void startFrame() {
	lastTime = SDL_GetTicks();
}
void startUIFrame() {
	ImGui_ImplSDL2_NewFrame();
	ImGui_ImplSDLRenderer_NewFrame();
	ImGui.NewFrame();
}

void renderGame() {
	ubyte* drawBuffer;
	int drawPitch;
	SDL_LockTexture(drawTexture, null, cast(void**)&drawBuffer, &drawPitch);
	renderer.draw(drawBuffer[0 .. renderer.height * drawPitch], drawPitch);
	SDL_UnlockTexture(drawTexture);

	SDL_SetRenderDrawColor(sdlRenderer, 0, 0, 0, 255);
	SDL_RenderClear(sdlRenderer);
	SDL_Rect screen;
	screen.x = gameX;
	screen.y = gameY;
	screen.w = gameWidth;
	screen.h = gameHeight;
	SDL_RenderCopy(sdlRenderer, drawTexture, null, &screen);
}

void renderOverlay() {
	foreach (rectangle; overlayRectangles) {
		renderRectangle(rectangle);
	}
	overlayRectangles = [];
}

void endFrame() {
	SDL_RenderPresent(sdlRenderer);
}

void renderUI() {
	int width, height;
	SDL_GL_GetDrawableSize(appWin, &width, &height);
	prepareDebugUI(width, height);
	ImGui.Render();
	ImGui_ImplSDLRenderer_RenderDrawData(ImGui.GetDrawData());
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
	renderer.INIDISP = INIDISP;
	renderer.OBSEL = OBSEL;
	//renderer.OAMADDR = OAMADDL | OAMADDH << 8;
	renderer.BGMODE = BGMODE;
	renderer.MOSAIC = MOSAIC;
	renderer.BG1SC = BG1SC;
	renderer.BG2SC = BG2SC;
	renderer.BG3SC = BG3SC;
	renderer.BG4SC = BG4SC;
	renderer.BG12NBA = BG12NBA;
	renderer.BG34NBA = BG34NBA;
	renderer.W12SEL = W12SEL;
	renderer.W34SEL = W34SEL;
	renderer.WOBJSEL = WOBJSEL;
	renderer.WH0 = WH0;
	renderer.WH1 = WH1;
	renderer.WH2 = WH2;
	renderer.WH3 = WH3;
	renderer.WBGLOG = WBGLOG;
	renderer.WOBJLOG = WOBJLOG;
	renderer.TM = TM ^ layersDisabled;
	renderer.TS = TD;
	renderer.TMW = TMW;
	renderer.TSW = TSW;
	renderer.CGWSEL = CGWSEL;
	renderer.CGADSUB = CGADSUB;
	//renderer.SETINI = SETINI;
}

void setFixedColourData(ubyte val) {
	const intensity = val & 0x1F;
	if (val & 0x80) {
		renderer.FIXED_COLOUR_DATA_B = intensity;
	}
	if (val & 0x40) {
		renderer.FIXED_COLOUR_DATA_G = intensity;
	}
	if (val & 0x20) {
		renderer.FIXED_COLOUR_DATA_R = intensity;
	}
}

void setBGOffsetX(ubyte layer, ushort x) {
	switch (layer) {
		case 1:
			renderer.BG1HOFS = x;
			break;
		case 2:
			renderer.BG2HOFS = x;
			break;
		case 3:
			renderer.BG3HOFS = x;
			break;
		case 4:
			renderer.BG4HOFS = x;
			break;
		default: assert(0);
	}
}
void setBGOffsetY(ubyte layer, ushort y) {
	switch (layer) {
		case 1:
			renderer.BG1VOFS = y;
			break;
		case 2:
			renderer.BG2VOFS = y;
			break;
		case 3:
			renderer.BG3VOFS = y;
			break;
		case 4:
			renderer.BG4VOFS = y;
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
	const xScale = gameWidth / 256.0;
	const yScale = gameHeight / 224.0;
	const dim = SDL_Rect(cast(int)(gameX + rect.x * xScale), cast(int)(gameY + rect.y * yScale), cast(int)(rect.w * xScale), cast(int)(rect.h * yScale));
	assert(SDL_SetRenderDrawColor(sdlRenderer, rect.r, rect.g, rect.b, rect.a) >= 0);
	assert(SDL_RenderFillRect(sdlRenderer, &dim) >= 0);
}

SDL_Surface* createSurface(scope const ubyte[] data, int width, int height, uint pitch, uint format) {
	assert(sdlRenderer, "No renderer");
	int bpp;
	uint redMask, greenMask, blueMask, alphaMask;
	SDL_PixelFormatEnumToMasks(format, &bpp, &redMask, &greenMask, &blueMask, &alphaMask);
	auto surface = SDL_CreateRGBSurfaceFrom(cast(void*)&data[0], width, height, bpp, pitch, redMask, greenMask, blueMask, alphaMask);
	enforceSDL(surface != null, "Failed to create surface");
	return surface;
}
SDL_Texture* createTexture(scope const ubyte[] data, int width, int height, uint pitch, uint format) {
	auto tex = SDL_CreateTextureFromSurface(sdlRenderer, createSurface(data, width, height, pitch, format));
	enforceSDL(tex != null, "Failed to create texture");
	return tex;
}

void dumpScreen(string path) {
	uint pitch;
	auto frame = renderer.getFrameData(pitch);
	auto surface = createSurface(cast(ubyte[])frame, renderer.width, renderer.height, pitch, renderer.textureType);
	SDL_SaveBMP(surface, path.toStringz);

	SDL_FreeSurface(surface);
}
