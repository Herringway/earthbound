import std.stdio;
import std.experimental.logger;
import std.file : exists;
import std.getopt;
import std.string : fromStringz, format;
import core.thread : Fiber;

import siryul;

import bindbc.loader;
import bindbc.sdl;

import earthbound.bank00 : start, NMI;
import earthbound.commondefs;
import earthbound.hardware : JOYPAD_1_DATA, JOYPAD_2_DATA;

import snesdrawframe;
import snesdrawframedata;

private enum WindowScale = 1;

struct Settings {
    Controller[SDL_GameControllerButton] gamepadMapping;
    Controller[SDL_Scancode] keyboardMapping;
}

void saveGraphicsStateToFile(string filename) {
    File file = File(filename, "wb");
    file.rawWrite([g_frameData]);
}

void main(string[] args) {
    if (!"settings.yml".exists) {
        getDefaultSettings().toFile!YAML("settings.yml");
    }
    const settings = fromFile!(Settings, YAML)("settings.yml");
    bool verbose;
    auto help = getopt(args,
        "verbose|v", "Print extra information", &verbose
    );
    if (help.helpWanted) {
        defaultGetoptPrinter("Earthbound.", help.options);
        return;
    }
    if (!verbose) {
        sharedLog = new FileLogger(stdout, LogLevel.info);
    }
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
    info("SnesDrawFrame initialized");

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

    bool run = true, dumpVram = false, pause = false, step = false, fastForward = false, printRegisters = false;
    int dumpVramCount = 0;

    void handleSNESButton(ushort val, bool pressed, uint playerID) {
        if (pressed) {
            if (playerID == 1) {
                JOYPAD_1_DATA |= val;
            } else {
                JOYPAD_2_DATA |= val;
            }
        } else {
            if (playerID == 1) {
                JOYPAD_1_DATA &= cast(ushort)~cast(uint)val;
            } else {
                JOYPAD_2_DATA &= cast(ushort)~cast(uint)val;
            }
        }
    }
    void handleButton(Controller button, bool pressed, uint playerID) {
        final switch (button) {
            case Controller.up:
                handleSNESButton(PAD_UP, pressed, playerID);
                break;
            case Controller.down:
                handleSNESButton(PAD_DOWN, pressed, playerID);
                break;
            case Controller.left:
                handleSNESButton(PAD_LEFT, pressed, playerID);
                break;
            case Controller.right:
                handleSNESButton(PAD_RIGHT, pressed, playerID);
                break;
            case Controller.l:
                handleSNESButton(PAD_L, pressed, playerID);
                break;
            case Controller.r:
                handleSNESButton(PAD_R, pressed, playerID);
                break;
            case Controller.select:
                handleSNESButton(PAD_SELECT, pressed, playerID);
                break;
            case Controller.start:
                handleSNESButton(PAD_START, pressed, playerID);
                break;
            case Controller.a:
                handleSNESButton(PAD_A, pressed, playerID);
                break;
            case Controller.b:
                handleSNESButton(PAD_B, pressed, playerID);
                break;
            case Controller.x:
                handleSNESButton(PAD_X, pressed, playerID);
                break;
            case Controller.y:
                handleSNESButton(PAD_Y, pressed, playerID);
                break;
            case Controller.fastForward:
                fastForward = pressed;
                break;
            case Controller.pause:
                if (pressed) {
                    pause = !pause;
                }
                break;
            case Controller.dumpVRAM:
                dumpVram = pressed;
                break;
            case Controller.printRegisters:
                printRegisters = pressed;
                break;
            case Controller.skipFrame:
                step = pressed;
                break;
            case Controller.exit:
                run = pressed;
                break;
        }
    }

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
                case SDL_EventType.SDL_KEYUP:
                    if (auto button = event.key.keysym.scancode in settings.keyboardMapping) {
                        handleButton(*button, event.type == SDL_KEYDOWN, 1);
                    }
                    break;
                case SDL_CONTROLLERBUTTONUP:
                case SDL_CONTROLLERBUTTONDOWN:
                    if (auto button = cast(SDL_GameControllerButton)event.cbutton.button in settings.gamepadMapping) {
                        handleButton(*button, event.type == SDL_CONTROLLERBUTTONDOWN, SDL_GameControllerGetPlayerIndex(SDL_GameControllerFromInstanceID(event.cbutton.which)));
                    }
                    break;
                case SDL_CONTROLLERDEVICEADDED:
                    connectGamepad(event.cdevice.which);
                    break;

                case SDL_CONTROLLERDEVICEREMOVED:
                    disconnectGamepad(event.cdevice.which);
                    break;
                default: break;
            }
        }

        lastTime = SDL_GetTicks();

        ushort* drawBuffer;
        int drawPitch;
        SDL_LockTexture(drawTexture, null, cast(void**)&drawBuffer, &drawPitch);

        if (step) {
            Throwable t = game.call(Fiber.Rethrow.no);
            if(t) {
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
        if (printRegisters) {
            writeln(g_frameData);
            printRegisters = false;
        }

        SDL_UnlockTexture(drawTexture);

        SDL_SetRenderDrawColor(renderer, 120, 140, 230, 255);
        SDL_RenderClear(renderer);
        SDL_RenderCopy(renderer, drawTexture, null, null);
        SDL_RenderPresent(renderer);

        int drawTime = SDL_GetTicks() - lastTime;
        if(!fastForward && drawTime < 16) {
            SDL_Delay(16 - drawTime);
        }
    }
}

enum Controller {
    up,
    down,
    left,
    right,
    l,
    r,
    select,
    start,
    a,
    b,
    x,
    y,
    fastForward,
    pause,
    dumpVRAM,
    skipFrame,
    printRegisters,
    exit
}

Settings getDefaultSettings() {
    Settings defaults;
    defaults.gamepadMapping = [
        SDL_CONTROLLER_BUTTON_X : Controller.y,
        SDL_CONTROLLER_BUTTON_A : Controller.b,
        SDL_CONTROLLER_BUTTON_B : Controller.a,
        SDL_CONTROLLER_BUTTON_Y : Controller.x,
        SDL_CONTROLLER_BUTTON_START : Controller.start,
        SDL_CONTROLLER_BUTTON_BACK : Controller.select,
        SDL_CONTROLLER_BUTTON_LEFTSHOULDER : Controller.l,
        SDL_CONTROLLER_BUTTON_RIGHTSHOULDER : Controller.r,
        SDL_CONTROLLER_BUTTON_DPAD_UP : Controller.up,
        SDL_CONTROLLER_BUTTON_DPAD_DOWN : Controller.down,
        SDL_CONTROLLER_BUTTON_DPAD_LEFT : Controller.left,
        SDL_CONTROLLER_BUTTON_DPAD_RIGHT : Controller.right,
    ];

    defaults.keyboardMapping = [
        SDL_Scancode.SDL_SCANCODE_S: Controller.b,
        SDL_Scancode.SDL_SCANCODE_A: Controller.y,
        SDL_Scancode.SDL_SCANCODE_X: Controller.select,
        SDL_Scancode.SDL_SCANCODE_Z: Controller.start,
        SDL_Scancode.SDL_SCANCODE_UP: Controller.up,
        SDL_Scancode.SDL_SCANCODE_DOWN: Controller.down,
        SDL_Scancode.SDL_SCANCODE_LEFT: Controller.left,
        SDL_Scancode.SDL_SCANCODE_RIGHT: Controller.right,
        SDL_Scancode.SDL_SCANCODE_D: Controller.a,
        SDL_Scancode.SDL_SCANCODE_W: Controller.x,
        SDL_Scancode.SDL_SCANCODE_Q: Controller.l,
        SDL_Scancode.SDL_SCANCODE_E: Controller.r,
        SDL_Scancode.SDL_SCANCODE_9: Controller.printRegisters,
        SDL_Scancode.SDL_SCANCODE_0: Controller.dumpVRAM,
        SDL_Scancode.SDL_SCANCODE_P: Controller.pause,
        SDL_Scancode.SDL_SCANCODE_BACKSLASH: Controller.skipFrame,
        SDL_Scancode.SDL_SCANCODE_GRAVE: Controller.fastForward,
        SDL_Scancode.SDL_SCANCODE_ESCAPE: Controller.exit,
    ];
    return defaults;
}


void connectGamepad(int id) {
    if (SDL_IsGameController(id)) {
        if (auto controller = SDL_GameControllerOpen(id)) {
            SDL_GameControllerSetPlayerIndex(controller, 1);
            const(char)* name = SDL_GameControllerNameForIndex(id);
            infof("Initialized controller: %s", name.fromStringz);
        } else {
            SDLError("Error opening controller: %s");
        }
    }
}
void disconnectGamepad(int id) {
    if (auto controller = SDL_GameControllerFromInstanceID(id)) {
        infof("Controller disconnected: %s", SDL_GameControllerName(controller).fromStringz);
        SDL_GameControllerClose(controller);
    }
}

void SDLError(string fmt) {
    errorf(fmt, SDL_GetError().fromStringz);
}
