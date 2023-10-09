module rendering;

import core.time;
import std.exception;
import std.experimental.logger;
import std.string;

import bindbc.sdl;

import earthbound.hardware;

import debugging;
import misc;
import ppu;

import imgui.sdl;
import imgui.sdlrenderer;
import d_imgui.imgui_h;
import ImGui = d_imgui;

public enum ImgW = 256;
public enum ImgH = 224;

PPU renderer;

ubyte layersDisabled;
private uint frameTotal;
private char[30] frameRateStringBuffer;
private uint frameCounter;
const(char)[] frameRateString;
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

HDMAWrite[4*8*240] hdmaData;
ushort numHDMA;

private SDL_Window* appWin;
private SDL_Renderer* sdlRenderer;
private SDL_Texture* drawTexture;
private int lastTime;
private int gameX = 0;
private int gameY = 0;
private int gameWidth;
private int gameHeight;

void loadRenderer() {
    enforceSDLLoaded!("SDL", SDL_GetVersion, libName)(loadSDL());
	renderer.reset();
	renderer.extraLeftRight = (ImgW - 256) / 2;
	renderer.setExtraSideSpace((ImgW - 256) / 2, (ImgW - 256) / 2, (ImgH - 224) / 2);
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
	gameWidth = ImgW * zoom;
	gameHeight = ImgH * zoom;
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
		SDL_PIXELFORMAT_ARGB8888,
		SDL_TEXTUREACCESS_STREAMING,
		ImgW,
		ImgH
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
	renderFrame(drawBuffer, drawPitch);
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
}

void setFixedColourData(ubyte val) {
	const intensity = val & 0x1F;
	if (val & 0x80) {
		renderer.fixedColorB = intensity;
	}
	if (val & 0x40) {
		renderer.fixedColorG = intensity;
	}
	if (val & 0x20) {
		renderer.fixedColorR = intensity;
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
	const xScale = gameWidth / float(ImgW);
	const yScale = gameHeight / float(ImgH);
	const dim = SDL_Rect(cast(int)(gameX + rect.x * xScale), cast(int)(gameY + rect.y * yScale), cast(int)(rect.w * xScale), cast(int)(rect.h * yScale));
	assert(SDL_SetRenderDrawColor(sdlRenderer, rect.r, rect.g, rect.b, rect.a) >= 0);
	assert(SDL_RenderFillRect(sdlRenderer, &dim) >= 0);
}

SDL_Texture* createTexture(scope const ubyte[] data, int width, int height) {
	auto surface = SDL_CreateRGBSurfaceFrom(cast(void*)&data[0], width, height, 16, 2 * width, BGR555Mask.Red, BGR555Mask.Green, BGR555Mask.Blue, 0);
	enforceSDL(surface != null, "Failed to create surface");
	assert(sdlRenderer, "No renderer");
	auto tex = SDL_CreateTextureFromSurface(sdlRenderer, surface);
	enforceSDL(tex != null, "Failed to create texture");
	return tex;
}

void dumpScreen(string path) {
	auto frame = new ubyte[](ImgW * ImgH * 4);
	renderFrame(&frame[0], ImgW * uint.sizeof);
	auto surface = SDL_CreateRGBSurfaceFrom(&frame[0], ImgW, ImgH, 32, ImgW * uint.sizeof, 0xFF << 16, 0xFF << 8, 0xFF, 0xFF << 24);
	enforceSDL(surface != null, "Failed to create surface");
	SDL_SaveBMP(surface, path.toStringz);

	SDL_FreeSurface(surface);
}

void renderFrame(ubyte* drawBuffer, size_t pitch) {
	renderer.beginDrawing(drawBuffer, pitch, KPPURenderFlags.newRenderer);
	HDMAWrite[] hdmaTemp = hdmaData[0 .. numHDMA];
	foreach (i; 0 .. ImgH) {
		while ((hdmaTemp.length > 0) && (hdmaTemp[0].vcounter == i)) {
			renderer.write(hdmaTemp[0].addr, hdmaTemp[0].value);
			hdmaTemp = hdmaTemp[1 .. $];
		}
		renderer.runLine(i);
	}
}
