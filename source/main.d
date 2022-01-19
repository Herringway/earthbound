import std.stdio;
import std.string : fromStringz, format;
import core.thread : Fiber;

import bindbc.loader;
import bindbc.sdl;

import earthbound.bank00 : start, NMI;
import earthbound.hardware : JOYPAD_1_DATA, JOYPAD_2_DATA;

import snesdrawframe;
import snesdrawframedata;

private enum WindowScale = 1;

void saveGraphicsStateToFile(string filename) {
    File file = File(filename, "wb");
    file.rawWrite([g_frameData]);
}

void setJoypad() {
    auto state = SDL_GetKeyboardState(null);
    ushort joy1 = 0;
    if (state[SDL_Scancode.SDL_SCANCODE_S]) joy1 |= 0x8000; // B
    if (state[SDL_Scancode.SDL_SCANCODE_A]) joy1 |= 0x4000; // Y
    if (state[SDL_Scancode.SDL_SCANCODE_X]) joy1 |= 0x2000; // Select
    if (state[SDL_Scancode.SDL_SCANCODE_Z]) joy1 |= 0x1000; // Start
    if (state[SDL_Scancode.SDL_SCANCODE_UP]) joy1 |= 0x0800; // Up
    if (state[SDL_Scancode.SDL_SCANCODE_DOWN]) joy1 |= 0x0400; // Down
    if (state[SDL_Scancode.SDL_SCANCODE_LEFT]) joy1 |= 0x0200; // Left
    if (state[SDL_Scancode.SDL_SCANCODE_RIGHT]) joy1 |= 0x0100; // Right
    if (state[SDL_Scancode.SDL_SCANCODE_D]) joy1 |= 0x0080; // A
    if (state[SDL_Scancode.SDL_SCANCODE_W]) joy1 |= 0x0040; // X
    if (state[SDL_Scancode.SDL_SCANCODE_Q]) joy1 |= 0x0020; // L
    if (state[SDL_Scancode.SDL_SCANCODE_E]) joy1 |= 0x0010; // R
    JOYPAD_1_DATA = joy1;
    JOYPAD_2_DATA = 0;
}

void main() {
    if(!loadSnesDrawFrame()) {
        writeln("Can't load SnesDrawFrame!");
        return;
    }
    if(loadSDL() < sdlSupport) {
        writeln("Can't load SDL!");
        return;
    }
    if(!initSnesDrawFrame()) {
        writeln("Error initializing SnesDrawFrame!");
        return;
    }

    if(SDL_Init(SDL_INIT_VIDEO) != 0) {
        writeln("Error initializing SDL: ", fromStringz(SDL_GetError()));
        return;
    }
    scope(exit) {
      SDL_Quit();
    }

    const windowFlags = SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE;
    SDL_Window* appWin = SDL_CreateWindow(
        "SDL Window",
        SDL_WINDOWPOS_UNDEFINED,
        SDL_WINDOWPOS_UNDEFINED,
        ImgW * WindowScale,
        ImgH * WindowScale,
        windowFlags
    );
    if(appWin is null) {
        writeln("Error creating SDL window: ", fromStringz(SDL_GetError()));
        return;
    }
    scope(exit) {
        // Close and destroy the window
        if (appWin !is null) {
            SDL_DestroyWindow(appWin);
        }
    }

    const rendererFlags = SDL_RENDERER_ACCELERATED;
    SDL_Renderer* renderer = SDL_CreateRenderer(
        appWin, -1, rendererFlags
    );
    if(renderer is null) {
        writeln("Error creating SDL renderer: ", fromStringz(SDL_GetError()));
        return;
    }
    scope(exit) {
        // Close and destroy the renderer
        if (renderer !is null) {
            SDL_DestroyRenderer(renderer);
        }
    }

    SDL_Texture* drawTexture = SDL_CreateTexture(
        renderer,
        SDL_PIXELFORMAT_RGB555,
        SDL_TEXTUREACCESS_STREAMING,
        ImgW,
        ImgH
    );
    if(drawTexture is null) {
        writeln("Error creating SDL texture: ", fromStringz(SDL_GetError()));
        return;
    }
    scope(exit) {
        // Close and destroy the texture
        if (drawTexture !is null) {
            SDL_DestroyTexture(drawTexture);
        }
    }

    bool run = true, dumpVram = false, pause = false, step = false;
    int dumpVramCount = 0;

    int lastTime;
    auto game = new Fiber(&start);
    while(run) {
        step = !pause;
        SDL_Event event;
        while(SDL_PollEvent(&event)) {
            if (event.type == SDL_QUIT) {
                run = false;
            }
            if (event.type == SDL_EventType.SDL_KEYDOWN) {
                switch (event.key.keysym.scancode) {
                    case SDL_Scancode.SDL_SCANCODE_0:
                        dumpVram = true;
                        break;
                    case SDL_Scancode.SDL_SCANCODE_P:
                        pause = !pause;
                        break;
                    case SDL_Scancode.SDL_SCANCODE_BACKSLASH:
                        step = true;
                        break;
                    default: break;
                }
            }
        }
        auto kbdstate = SDL_GetKeyboardState(null);


        lastTime = SDL_GetTicks();

        ushort* drawBuffer;
        int drawPitch;
        SDL_LockTexture(drawTexture, null, cast(void**)&drawBuffer, &drawPitch);

        if (step) {
            setJoypad();
            Throwable t = game.call(Fiber.Rethrow.no);
            if(t) {
                writeln(t);
                throw t;
            }
            NMI();
            copyGlobalsToFrameData();
        }
        drawFrame(drawBuffer, drawPitch, &g_frameData);
        if (dumpVram) {
            saveGraphicsStateToFile(format!"gfxstate%03d.bin"(dumpVramCount));
            dumpVram = false;
            dumpVramCount += 1;
        }

        SDL_UnlockTexture(drawTexture);

        SDL_SetRenderDrawColor(renderer, 120, 140, 230, 255);
        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, drawTexture, null, null);
        SDL_RenderPresent(renderer);

        int drawTime = SDL_GetTicks() - lastTime;
        if(!(kbdstate[SDL_Scancode.SDL_SCANCODE_GRAVE]) && drawTime < 16) {
            SDL_Delay(16 - drawTime);
        }
    }
}
