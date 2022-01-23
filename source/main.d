import std.stdio;
import std.experimental.logger;
import std.file : exists;
import std.string : fromStringz, format;
import core.thread : Fiber;

import bindbc.loader;
import bindbc.sdl;

import earthbound.bank00 : start, NMI;
import earthbound.commondefs;
import earthbound.hardware : JOYPAD_1_DATA, JOYPAD_2_DATA;

import snesdrawframe;
import snesdrawframedata;

SDL_GameController* controller;
private enum WindowScale = 1;

void saveGraphicsStateToFile(string filename) {
    File file = File(filename, "wb");
    file.rawWrite([g_frameData]);
}

void main() {
    if(!loadSnesDrawFrame()) {
        info("Can't load SnesDrawFrame!");
        return;
    }
    if(loadSDL() < sdlSupport) {
        info("Can't load SDL!");
        return;
    }
    if(!initSnesDrawFrame()) {
        info("Error initializing SnesDrawFrame!");
        return;
    }

    if(SDL_Init(SDL_INIT_VIDEO) != 0) {
        SDLError("Error initializing SDL: %s");
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
        SDLError("Error creating SDL window: %s");
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
        SDLError("Error creating SDL renderer: %s");
        return;
    }
    scope(exit) {
        // Close and destroy the renderer
        if (renderer !is null) {
            SDL_DestroyRenderer(renderer);
        }
    }
    info("SDL video & renderer subsystem initialized");

    SDL_Texture* drawTexture = SDL_CreateTexture(
        renderer,
        SDL_PIXELFORMAT_RGB555,
        SDL_TEXTUREACCESS_STREAMING,
        ImgW,
        ImgH
    );
    if(drawTexture is null) {
        SDLError("Error creating SDL texture: %s");
        return;
    }
    scope(exit) {
        // Close and destroy the texture
        if (drawTexture !is null) {
            SDL_DestroyTexture(drawTexture);
        }
    }
    if (SDL_InitSubSystem(SDL_INIT_GAMECONTROLLER) < 0) {
        SDLError("Couldn't initialise controller SDL subsystem: %s");
        return;
    }
    if ("gamecontrollerdb.txt".exists) {
        if (SDL_GameControllerAddMappingsFromFile("gamecontrollerdb.txt") < 0) {
            SDLError("Error loading game controller database");
        } else {
            info("Successfully loaded game controller database");
        }
    }
    SDL_GameControllerEventState(SDL_ENABLE);
    info("SDL game controller subsystem initialized");

    bool run = true, dumpVram = false, pause = false, step = false;
    int dumpVramCount = 0;

    int lastTime;
    auto game = new Fiber(&start);
    while(run) {
        step = !pause;
        SDL_Event event;
        while(SDL_PollEvent(&event)) {
            switch (event.type) {
                case SDL_EventType.SDL_QUIT:
                    run = false;
                    break;
                case SDL_EventType.SDL_KEYDOWN:
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
                    goto case;
                case SDL_EventType.SDL_KEYUP:
                    keys: switch (event.key.keysym.scancode) {
                        static foreach (key, mapping; keyboardMap) {
                            case key:
                                if (event.type == SDL_KEYDOWN) {
                                    JOYPAD_1_DATA |= mapping;
                                } else {
                                    JOYPAD_1_DATA &= cast(ushort)~cast(uint)mapping;
                                }
                                break keys;
                        }
                        default: break;
                    }
                    break;
                case SDL_CONTROLLERBUTTONUP:
                case SDL_CONTROLLERBUTTONDOWN:
                    buttons: switch (event.cbutton.button) {
                        static foreach (button, mapping; gamepadMap) {
                            case button:
                                if (event.cbutton.type == SDL_CONTROLLERBUTTONDOWN) {
                                    JOYPAD_1_DATA |= mapping;
                                } else {
                                    JOYPAD_1_DATA &= cast(ushort)~cast(uint)mapping;
                                }
                                break buttons;
                        }
                        default:
                            break;
                    }
                    break;
                case SDL_CONTROLLERDEVICEADDED:
                    connectGamepad(event.jdevice.which);
                    break;

                case SDL_CONTROLLERDEVICEREMOVED:
                    disconnectGamepad(event.jdevice.which);
                    break;
                default: break;
            }
        }
        auto kbdstate = SDL_GetKeyboardState(null);


        lastTime = SDL_GetTicks();

        ushort* drawBuffer;
        int drawPitch;
        SDL_LockTexture(drawTexture, null, cast(void**)&drawBuffer, &drawPitch);

        if (step) {
            Throwable t = game.call(Fiber.Rethrow.no);
            if(t) {
                error(t);
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

enum ushort[SDL_GameControllerButton] gamepadMap = [
    SDL_CONTROLLER_BUTTON_X : PAD_X,
    SDL_CONTROLLER_BUTTON_A : PAD_A,
    SDL_CONTROLLER_BUTTON_B : PAD_B,
    SDL_CONTROLLER_BUTTON_Y : PAD_Y,
    SDL_CONTROLLER_BUTTON_START : PAD_START,
    SDL_CONTROLLER_BUTTON_BACK : PAD_SELECT,
    SDL_CONTROLLER_BUTTON_LEFTSHOULDER : PAD_L,
    SDL_CONTROLLER_BUTTON_RIGHTSHOULDER : PAD_R,
    SDL_CONTROLLER_BUTTON_DPAD_UP : PAD_UP,
    SDL_CONTROLLER_BUTTON_DPAD_DOWN : PAD_DOWN,
    SDL_CONTROLLER_BUTTON_DPAD_LEFT : PAD_LEFT,
    SDL_CONTROLLER_BUTTON_DPAD_RIGHT : PAD_RIGHT,
];

enum ushort[SDL_Scancode] keyboardMap = [
    SDL_Scancode.SDL_SCANCODE_S: PAD_B,
    SDL_Scancode.SDL_SCANCODE_A: PAD_Y,
    SDL_Scancode.SDL_SCANCODE_X: PAD_SELECT,
    SDL_Scancode.SDL_SCANCODE_Z: PAD_START,
    SDL_Scancode.SDL_SCANCODE_UP: PAD_UP,
    SDL_Scancode.SDL_SCANCODE_DOWN: PAD_DOWN,
    SDL_Scancode.SDL_SCANCODE_LEFT: PAD_LEFT,
    SDL_Scancode.SDL_SCANCODE_RIGHT: PAD_RIGHT,
    SDL_Scancode.SDL_SCANCODE_D: PAD_A,
    SDL_Scancode.SDL_SCANCODE_W: PAD_X,
    SDL_Scancode.SDL_SCANCODE_Q: PAD_L,
    SDL_Scancode.SDL_SCANCODE_E: PAD_R,
];

void connectGamepad(int id) {
    if (SDL_IsGameController(id)) {
        if (SDL_GameControllerOpen(id)) {
            const(char)* name = SDL_GameControllerNameForIndex(id);
            infof("Initialized controller: %s", name.fromStringz);
        } else {
            SDLError("Error opening controller: %s");
        }
    }
}
void disconnectGamepad(int id) {
    if (SDL_GameControllerFromInstanceID(id) is controller) {
        infof("Joystick #%d disconnected", id);
        SDL_GameControllerClose(controller);
        controller = null;
    }
}

void SDLError(string fmt) {
    errorf(fmt, SDL_GetError().fromStringz);
}
