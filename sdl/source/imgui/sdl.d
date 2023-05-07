module imgui.sdl;
// dear imgui: Platform Backend for SDL2
// This needs to be used along with a Renderer (e.g. DirectX11, OpenGL3, Vulkan..)
// (Info: SDL2 is a cross-platform general purpose library for handling windows, inputs, graphics context creation, etc.)
// (Prefer SDL 2.0.5+ for full feature support.)

// Implemented features:
//  [X] Platform: Clipboard support.
//  [X] Platform: Keyboard support. Since 1.87 we are using the io.AddKeyEvent() function. Pass ImGuiKey values to all key functions e.g. ImGui::IsKeyPressed(ImGuiKey_Space). [Legacy SDL_SCANCODE_* values will also be supported unless IMGUI_DISABLE_OBSOLETE_KEYIO is set]
//  [X] Platform: Gamepad support. Enabled with 'io.ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad'.
//  [X] Platform: Mouse cursor shape and visibility. Disable with 'io.ConfigFlags |= ImGuiConfigFlags_NoMouseCursorChange'.
// Missing features:
//  [ ] Platform: SDL2 handling of IME under Windows appears to be broken and it explicitly disable the regular Windows IME. You can restore Windows IME by compiling SDL with SDL_DISABLE_WINDOWS_IME.

// You can use unmodified imgui_impl_* files in your project. See examples/ folder for examples of using this.
// Prefer including the entire imgui/ repository into your project (either as a copy or as a submodule), and only build the backends you need.
// If you are new to Dear ImGui, read documentation from the docs/ folder + read the top of imgui.cpp.
// Read online: https://github.com/ocornut/imgui/tree/master/docs

// CHANGELOG
// (minor and older changes stripped away, please see git history for details)
//  2022-10-11: Using 'nullptr' instead of 'NULL' as per our switch to C++11.
//  2022-09-26: Inputs: Disable SDL 2.0.22 new "auto capture" (SDL_HINT_MOUSE_AUTO_CAPTURE) which prevents drag and drop across windows for multi-viewport support + don't capture when drag and dropping. (#5710)
//  2022-09-26: Inputs: Renamed ImGuiKey_ModXXX introduced in 1.87 to ImGuiMod_XXX (old names still supported).
//  2022-03-22: Inputs: Fix mouse position issues when dragging outside of boundaries. SDL_CaptureMouse() erroneously still gives out LEAVE events when hovering OS decorations.
//  2022-03-22: Inputs: Added support for extra mouse buttons (SDL_BUTTON_X1/SDL_BUTTON_X2).
//  2022-02-04: Added SDL_Renderer* parameter to ImGui_ImplSDL2_InitForSDLRenderer(), so we can use SDL_GetRendererOutputSize() instead of SDL_GL_GetDrawableSize() when bound to a SDL_Renderer.
//  2022-01-26: Inputs: replaced short-lived io.AddKeyModsEvent() (added two weeks ago) with io.AddKeyEvent() using ImGuiKey_ModXXX flags. Sorry for the confusion.
//  2021-01-20: Inputs: calling new io.AddKeyAnalogEvent() for gamepad support, instead of writing directly to io.NavInputs[].
//  2022-01-17: Inputs: calling new io.AddMousePosEvent(), io.AddMouseButtonEvent(), io.AddMouseWheelEvent() API (1.87+).
//  2022-01-17: Inputs: always update key mods next and before key event (not in NewFrame) to fix input queue with very low framerates.
//  2022-01-12: Update mouse inputs using SDL_MOUSEMOTION/SDL_WINDOWEVENT_LEAVE + fallback to provide it when focused but not hovered/captured. More standard and will allow us to pass it to future input queue API.
//  2022-01-12: Maintain our own copy of MouseButtonsDown mask instead of using ImGui::IsAnyMouseDown() which will be obsoleted.
//  2022-01-10: Inputs: calling new io.AddKeyEvent(), io.AddKeyModsEvent() + io.SetKeyEventNativeData() API (1.87+). Support for full ImGuiKey range.
//  2021-08-17: Calling io.AddFocusEvent() on SDL_WINDOWEVENT_FOCUS_GAINED/SDL_WINDOWEVENT_FOCUS_LOST.
//  2021-07-29: Inputs: MousePos is correctly reported when the host platform window is hovered but not focused (using SDL_GetMouseFocus() + SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH, requires SDL 2.0.5+)
//  2021-06-29: *BREAKING CHANGE* Removed 'SDL_Window* window' parameter to ImGui_ImplSDL2_NewFrame() which was unnecessary.
//  2021-06-29: Reorganized backend to pull data from a single structure to facilitate usage with multiple-contexts (all g_XXXX access changed to bd->XXXX).
//  2021-03-22: Rework global mouse pos availability check listing supported platforms explicitly, effectively fixing mouse access on Raspberry Pi. (#2837, #3950)
//  2020-05-25: Misc: Report a zero display-size when window is minimized, to be consistent with other backends.
//  2020-02-20: Inputs: Fixed mapping for ImGuiKey_KeyPadEnter (using SDL_SCANCODE_KP_ENTER instead of SDL_SCANCODE_RETURN2).
//  2019-12-17: Inputs: On Wayland, use SDL_GetMouseState (because there is no global mouse state).
//  2019-12-05: Inputs: Added support for ImGuiMouseCursor_NotAllowed mouse cursor.
//  2019-07-21: Inputs: Added mapping for ImGuiKey_KeyPadEnter.
//  2019-04-23: Inputs: Added support for SDL_GameController (if ImGuiConfigFlags_NavEnableGamepad is set by user application).
//  2019-03-12: Misc: Preserve DisplayFramebufferScale when main window is minimized.
//  2018-12-21: Inputs: Workaround for Android/iOS which don't seem to handle focus related calls.
//  2018-11-30: Misc: Setting up io.BackendPlatformName so it can be displayed in the About Window.
//  2018-11-14: Changed the signature of ImGui_ImplSDL2_ProcessEvent() to take a 'const SDL_Event*'.
//  2018-08-01: Inputs: Workaround for Emscripten which doesn't seem to handle focus related calls.
//  2018-06-29: Inputs: Added support for the ImGuiMouseCursor_Hand cursor.
//  2018-06-08: Misc: Extracted imgui_impl_sdl.cpp/.h away from the old combined SDL2+OpenGL/Vulkan examples.
//  2018-06-08: Misc: ImGui_ImplSDL2_InitForOpenGL() now takes a SDL_GLContext parameter.
//  2018-05-09: Misc: Fixed clipboard paste memory leak (we didn't call SDL_FreeMemory on the data returned by SDL_GetClipboardText).
//  2018-03-20: Misc: Setup io.BackendFlags ImGuiBackendFlags_HasMouseCursors flag + honor ImGuiConfigFlags_NoMouseCursorChange flag.
//  2018-02-16: Inputs: Added support for mouse cursors, honoring ImGui::GetMouseCursor() value.
//  2018-02-06: Misc: Removed call to ImGui::Shutdown() which is not available from 1.60 WIP, user needs to call CreateContext/DestroyContext themselves.
//  2018-02-06: Inputs: Added mapping for ImGuiKey_Space.
//  2018-02-05: Misc: Using SDL_GetPerformanceCounter() instead of SDL_GetTicks() to be able to handle very high framerate (1000+ FPS).
//  2018-02-05: Inputs: Keyboard mapping is using scancodes everywhere instead of a confusing mixture of keycodes and scancodes.
//  2018-01-20: Inputs: Added Horizontal Mouse Wheel support.
//  2018-01-19: Inputs: When available (SDL 2.0.4+) using SDL_CaptureMouse() to retrieve coordinates outside of client area when dragging. Otherwise (SDL 2.0.3 and before) testing for SDL_WINDOW_INPUT_FOCUS instead of SDL_WINDOW_MOUSE_FOCUS.
//  2018-01-18: Inputs: Added mapping for ImGuiKey_Insert.
//  2017-08-25: Inputs: MousePos set to -FLT_MAX,-FLT_MAX when mouse is unavailable/missing (instead of -1,-1).
//  2016-10-15: Misc: Added a void* user_data parameter to Clipboard function handlers.

import ImGui = d_imgui.imgui;
import d_imgui.imgui_h;

import core.stdc.stdint;

// SDL
import bindbc.sdl;

enum SDL_HAS_CAPTURE_AND_GLOBAL_MOUSE = 1;

// SDL Data
struct ImGui_ImplSDL2_Data
{
    SDL_Window*     Window;
    SDL_Renderer*   Renderer;
    Uint64          Time;
    int             MouseButtonsDown;
    SDL_Cursor*[ImGuiMouseCursor.COUNT] MouseCursors;
    int             PendingMouseLeaveFrame;
    char*           ClipboardTextData;
    bool            MouseCanUseGlobalState;
};

// Backend data stored in io.BackendPlatformUserData to allow support for multiple Dear ImGui contexts
// It is STRONGLY preferred that you use docking branch with multi-viewports (== single Dear ImGui context + multiple windows) instead of multiple Dear ImGui contexts.
// FIXME: multi-context support is not well tested and probably dysfunctional in this backend.
// FIXME: some shared resources (mouse cursor shape, gamepad) are mishandled when using multi-context.
static ImGui_ImplSDL2_Data* ImGui_ImplSDL2_GetBackendData() nothrow @nogc
{
    return ImGui.GetCurrentContext() ? cast(ImGui_ImplSDL2_Data*)ImGui.GetIO().BackendPlatformUserData : null;
}

// Functions
static string ImGui_ImplSDL2_GetClipboardText(void*) nothrow @nogc
{
    ImGui_ImplSDL2_Data* bd = ImGui_ImplSDL2_GetBackendData();
    if (bd.ClipboardTextData)
        SDL_free(bd.ClipboardTextData);
    bd.ClipboardTextData = SDL_GetClipboardText();
    return ImGui.ImCstring(bd.ClipboardTextData);
}

static void ImGui_ImplSDL2_SetClipboardText(void*, string text) nothrow @nogc
{
    SDL_SetClipboardText(text.ptr);
}

static ImGuiKey ImGui_ImplSDL2_KeycodeToImGuiKey(int keycode)
{
    switch (keycode)
    {
        case SDLK_TAB: return ImGuiKey.Tab;
        case SDLK_LEFT: return ImGuiKey.LeftArrow;
        case SDLK_RIGHT: return ImGuiKey.RightArrow;
        case SDLK_UP: return ImGuiKey.UpArrow;
        case SDLK_DOWN: return ImGuiKey.DownArrow;
        case SDLK_PAGEUP: return ImGuiKey.PageUp;
        case SDLK_PAGEDOWN: return ImGuiKey.PageDown;
        case SDLK_HOME: return ImGuiKey.Home;
        case SDLK_END: return ImGuiKey.End;
        case SDLK_INSERT: return ImGuiKey.Insert;
        case SDLK_DELETE: return ImGuiKey.Delete;
        case SDLK_BACKSPACE: return ImGuiKey.Backspace;
        case SDLK_SPACE: return ImGuiKey.Space;
        case SDLK_RETURN: return ImGuiKey.Enter;
        case SDLK_ESCAPE: return ImGuiKey.Escape;
        case SDLK_QUOTE: return ImGuiKey.Apostrophe;
        case SDLK_COMMA: return ImGuiKey.Comma;
        case SDLK_MINUS: return ImGuiKey.Minus;
        case SDLK_PERIOD: return ImGuiKey.Period;
        case SDLK_SLASH: return ImGuiKey.Slash;
        case SDLK_SEMICOLON: return ImGuiKey.Semicolon;
        case SDLK_EQUALS: return ImGuiKey.Equal;
        case SDLK_LEFTBRACKET: return ImGuiKey.LeftBracket;
        case SDLK_BACKSLASH: return ImGuiKey.Backslash;
        case SDLK_RIGHTBRACKET: return ImGuiKey.RightBracket;
        case SDLK_BACKQUOTE: return ImGuiKey.GraveAccent;
        case SDLK_CAPSLOCK: return ImGuiKey.CapsLock;
        case SDLK_SCROLLLOCK: return ImGuiKey.ScrollLock;
        case SDLK_NUMLOCKCLEAR: return ImGuiKey.NumLock;
        case SDLK_PRINTSCREEN: return ImGuiKey.PrintScreen;
        case SDLK_PAUSE: return ImGuiKey.Pause;
        case SDLK_KP_0: return ImGuiKey.Keypad0;
        case SDLK_KP_1: return ImGuiKey.Keypad1;
        case SDLK_KP_2: return ImGuiKey.Keypad2;
        case SDLK_KP_3: return ImGuiKey.Keypad3;
        case SDLK_KP_4: return ImGuiKey.Keypad4;
        case SDLK_KP_5: return ImGuiKey.Keypad5;
        case SDLK_KP_6: return ImGuiKey.Keypad6;
        case SDLK_KP_7: return ImGuiKey.Keypad7;
        case SDLK_KP_8: return ImGuiKey.Keypad8;
        case SDLK_KP_9: return ImGuiKey.Keypad9;
        case SDLK_KP_PERIOD: return ImGuiKey.KeypadDecimal;
        case SDLK_KP_DIVIDE: return ImGuiKey.KeypadDivide;
        case SDLK_KP_MULTIPLY: return ImGuiKey.KeypadMultiply;
        case SDLK_KP_MINUS: return ImGuiKey.KeypadSubtract;
        case SDLK_KP_PLUS: return ImGuiKey.KeypadAdd;
        case SDLK_KP_ENTER: return ImGuiKey.KeypadEnter;
        case SDLK_KP_EQUALS: return ImGuiKey.KeypadEqual;
        case SDLK_LCTRL: return ImGuiKey.LeftCtrl;
        case SDLK_LSHIFT: return ImGuiKey.LeftShift;
        case SDLK_LALT: return ImGuiKey.LeftAlt;
        case SDLK_LGUI: return ImGuiKey.LeftSuper;
        case SDLK_RCTRL: return ImGuiKey.RightCtrl;
        case SDLK_RSHIFT: return ImGuiKey.RightShift;
        case SDLK_RALT: return ImGuiKey.RightAlt;
        case SDLK_RGUI: return ImGuiKey.RightSuper;
        case SDLK_APPLICATION: return ImGuiKey.Menu;
        case SDLK_0: return ImGuiKey._0;
        case SDLK_1: return ImGuiKey._1;
        case SDLK_2: return ImGuiKey._2;
        case SDLK_3: return ImGuiKey._3;
        case SDLK_4: return ImGuiKey._4;
        case SDLK_5: return ImGuiKey._5;
        case SDLK_6: return ImGuiKey._6;
        case SDLK_7: return ImGuiKey._7;
        case SDLK_8: return ImGuiKey._8;
        case SDLK_9: return ImGuiKey._9;
        case SDLK_a: return ImGuiKey.A;
        case SDLK_b: return ImGuiKey.B;
        case SDLK_c: return ImGuiKey.C;
        case SDLK_d: return ImGuiKey.D;
        case SDLK_e: return ImGuiKey.E;
        case SDLK_f: return ImGuiKey.F;
        case SDLK_g: return ImGuiKey.G;
        case SDLK_h: return ImGuiKey.H;
        case SDLK_i: return ImGuiKey.I;
        case SDLK_j: return ImGuiKey.J;
        case SDLK_k: return ImGuiKey.K;
        case SDLK_l: return ImGuiKey.L;
        case SDLK_m: return ImGuiKey.M;
        case SDLK_n: return ImGuiKey.N;
        case SDLK_o: return ImGuiKey.O;
        case SDLK_p: return ImGuiKey.P;
        case SDLK_q: return ImGuiKey.Q;
        case SDLK_r: return ImGuiKey.R;
        case SDLK_s: return ImGuiKey.S;
        case SDLK_t: return ImGuiKey.T;
        case SDLK_u: return ImGuiKey.U;
        case SDLK_v: return ImGuiKey.V;
        case SDLK_w: return ImGuiKey.W;
        case SDLK_x: return ImGuiKey.X;
        case SDLK_y: return ImGuiKey.Y;
        case SDLK_z: return ImGuiKey.Z;
        case SDLK_F1: return ImGuiKey.F1;
        case SDLK_F2: return ImGuiKey.F2;
        case SDLK_F3: return ImGuiKey.F3;
        case SDLK_F4: return ImGuiKey.F4;
        case SDLK_F5: return ImGuiKey.F5;
        case SDLK_F6: return ImGuiKey.F6;
        case SDLK_F7: return ImGuiKey.F7;
        case SDLK_F8: return ImGuiKey.F8;
        case SDLK_F9: return ImGuiKey.F9;
        case SDLK_F10: return ImGuiKey.F10;
        case SDLK_F11: return ImGuiKey.F11;
        case SDLK_F12: return ImGuiKey.F12;
        default: break;
    }
    return ImGuiKey.None;
}

static void ImGui_ImplSDL2_UpdateKeyModifiers(SDL_Keymod sdl_key_mods)
{
    ImGuiIO* io = &ImGui.GetIO();
    io.AddKeyEvent(ImGuiMod.Ctrl, (sdl_key_mods & KMOD_CTRL) != 0);
    io.AddKeyEvent(ImGuiMod.Shift, (sdl_key_mods & KMOD_SHIFT) != 0);
    io.AddKeyEvent(ImGuiMod.Alt, (sdl_key_mods & KMOD_ALT) != 0);
    io.AddKeyEvent(ImGuiMod.Super, (sdl_key_mods & KMOD_GUI) != 0);
}

// You can read the io.WantCaptureMouse, io.WantCaptureKeyboard flags to tell if dear imgui wants to use your inputs.
// - When io.WantCaptureMouse is true, do not dispatch mouse input data to your main application, or clear/overwrite your copy of the mouse data.
// - When io.WantCaptureKeyboard is true, do not dispatch keyboard input data to your main application, or clear/overwrite your copy of the keyboard data.
// Generally you may always pass all inputs to dear imgui, and hide them from your application based on those two flags.
// If you have multiple SDL events and some of them are not meant to be used by dear imgui, you may need to filter events based on their windowID field.
bool ImGui_ImplSDL2_ProcessEvent(const SDL_Event* event)
{
    ImGuiIO* io = &ImGui.GetIO();
    ImGui_ImplSDL2_Data* bd = ImGui_ImplSDL2_GetBackendData();

    switch (event.type)
    {
        case SDL_MOUSEMOTION:
        {
            io.AddMousePosEvent(event.motion.x, event.motion.y);
            return true;
        }
        case SDL_MOUSEWHEEL:
        {
            float wheel_x = (event.wheel.x > 0) ? 1.0f : (event.wheel.x < 0) ? -1.0f : 0.0f;
            float wheel_y = (event.wheel.y > 0) ? 1.0f : (event.wheel.y < 0) ? -1.0f : 0.0f;
            io.AddMouseWheelEvent(wheel_x, wheel_y);
            return true;
        }
        case SDL_MOUSEBUTTONDOWN:
        case SDL_MOUSEBUTTONUP:
        {
            int mouse_button = -1;
            if (event.button.button == SDL_BUTTON_LEFT) { mouse_button = 0; }
            if (event.button.button == SDL_BUTTON_RIGHT) { mouse_button = 1; }
            if (event.button.button == SDL_BUTTON_MIDDLE) { mouse_button = 2; }
            if (event.button.button == SDL_BUTTON_X1) { mouse_button = 3; }
            if (event.button.button == SDL_BUTTON_X2) { mouse_button = 4; }
            if (mouse_button == -1)
                break;
            io.AddMouseButtonEvent(mouse_button, (event.type == SDL_MOUSEBUTTONDOWN));
            bd.MouseButtonsDown = (event.type == SDL_MOUSEBUTTONDOWN) ? (bd.MouseButtonsDown | (1 << mouse_button)) : (bd.MouseButtonsDown & ~(1 << mouse_button));
            return true;
        }
        case SDL_TEXTINPUT:
        {
        	foreach (c; event.text.text) {
                if (c == '\0') {
                    break;
                }
                io.AddInputCharacter(c);
        	}
            return true;
        }
        case SDL_KEYDOWN:
        case SDL_KEYUP:
        {
            ImGui_ImplSDL2_UpdateKeyModifiers(cast(SDL_Keymod)event.key.keysym.mod);
            ImGuiKey key = ImGui_ImplSDL2_KeycodeToImGuiKey(event.key.keysym.sym);
            io.AddKeyEvent(key, (event.type == SDL_KEYDOWN));
            io.SetKeyEventNativeData(key, event.key.keysym.sym, event.key.keysym.scancode, event.key.keysym.scancode); // To support legacy indexing (<1.87 user code). Legacy backend uses SDLK_*** as indices to IsKeyXXX() functions.
            return true;
        }
        case SDL_WINDOWEVENT:
        {
            // - When capturing mouse, SDL will send a bunch of conflicting LEAVE/ENTER event on every mouse move, but the final ENTER tends to be right.
            // - However we won't get a correct LEAVE event for a captured window.
            // - In some cases, when detaching a window from main viewport SDL may send SDL_WINDOWEVENT_ENTER one frame too late,
            //   causing SDL_WINDOWEVENT_LEAVE on previous frame to interrupt drag operation by clear mouse position. This is why
            //   we delay process the SDL_WINDOWEVENT_LEAVE events by one frame. See issue #5012 for details.
            Uint8 window_event = event.window.event;
            if (window_event == SDL_WINDOWEVENT_ENTER)
                bd.PendingMouseLeaveFrame = 0;
            if (window_event == SDL_WINDOWEVENT_LEAVE)
                bd.PendingMouseLeaveFrame = ImGui.GetFrameCount() + 1;
            if (window_event == SDL_WINDOWEVENT_FOCUS_GAINED)
                io.AddFocusEvent(true);
            else if (event.window.event == SDL_WINDOWEVENT_FOCUS_LOST)
                io.AddFocusEvent(false);
            return true;
        }
        default: break;
    }
    return false;
}

static bool ImGui_ImplSDL2_Init(SDL_Window* window, SDL_Renderer* renderer)
{
    ImGuiIO* io = &ImGui.GetIO();
    IM_ASSERT(io.BackendPlatformUserData == null && "Already initialized a platform backend!");

    // Check and store if we are on a SDL backend that supports global mouse position
    // ("wayland" and "rpi" don't support it, but we chose to use a white-list instead of a black-list)
    bool mouse_can_use_global_state = false;
static if (SDL_HAS_CAPTURE_AND_GLOBAL_MOUSE) {
    const char* sdl_backend = SDL_GetCurrentVideoDriver();
    const char[][] global_mouse_whitelist = [ "windows", "cocoa", "x11", "DIVE", "VMAN" ];
    for (int n = 0; n < global_mouse_whitelist.length; n++)
        if (strncmp(sdl_backend, global_mouse_whitelist[n].ptr, strlen(global_mouse_whitelist[n])) == 0)
            mouse_can_use_global_state = true;
}

    // Setup backend capabilities flags
    ImGui_ImplSDL2_Data* bd = IM_NEW!(ImGui_ImplSDL2_Data)();
    io.BackendPlatformUserData = cast(void*)bd;
    io.BackendPlatformName = "imgui_impl_sdl";
    io.BackendFlags |= ImGuiBackendFlags.HasMouseCursors;       // We can honor GetMouseCursor() values (optional)
    io.BackendFlags |= ImGuiBackendFlags.HasSetMousePos;        // We can honor io.WantSetMousePos requests (optional, rarely used)

    bd.Window = window;
    bd.Renderer = renderer;
    bd.MouseCanUseGlobalState = mouse_can_use_global_state;

    io.SetClipboardTextFn = &ImGui_ImplSDL2_SetClipboardText;
    io.GetClipboardTextFn = &ImGui_ImplSDL2_GetClipboardText;
    io.ClipboardUserData = null;

    // Load mouse cursors
    bd.MouseCursors[ImGuiMouseCursor.Arrow] = SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_ARROW);
    bd.MouseCursors[ImGuiMouseCursor.TextInput] = SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_IBEAM);
    bd.MouseCursors[ImGuiMouseCursor.ResizeAll] = SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZEALL);
    bd.MouseCursors[ImGuiMouseCursor.ResizeNS] = SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZENS);
    bd.MouseCursors[ImGuiMouseCursor.ResizeEW] = SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZEWE);
    bd.MouseCursors[ImGuiMouseCursor.ResizeNESW] = SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZENESW);
    bd.MouseCursors[ImGuiMouseCursor.ResizeNWSE] = SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZENWSE);
    bd.MouseCursors[ImGuiMouseCursor.Hand] = SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_HAND);
    bd.MouseCursors[ImGuiMouseCursor.NotAllowed] = SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_NO);

    // Set platform dependent data in viewport
version(Windows) {
    SDL_SysWMinfo info;
    SDL_VERSION(&info.version_);
    if (SDL_GetWindowWMInfo(window, &info))
        ImGui.GetMainViewport().PlatformHandleRaw = cast(void*)info.info.win.window;
} else {
}

    // From 2.0.5: Set SDL hint to receive mouse click events on window focus, otherwise SDL doesn't emit the event.
    // Without this, when clicking to gain focus, our widgets wouldn't activate even though they showed as hovered.
    // (This is unfortunately a global SDL setting, so enabling it might have a side-effect on your application.
    // It is unlikely to make a difference, but if your app absolutely needs to ignore the initial on-focus click:
    // you can ignore SDL_MOUSEBUTTONDOWN events coming right after a SDL_WINDOWEVENT_FOCUS_GAINED)
    SDL_SetHint(SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH, "1");

    // From 2.0.22: Disable auto-capture, this is preventing drag and drop across multiple windows (see #5710)
//#ifdef SDL_HINT_MOUSE_AUTO_CAPTURE
//    SDL_SetHint(SDL_HINT_MOUSE_AUTO_CAPTURE, "0");
//#endif

    return true;
}

bool ImGui_ImplSDL2_InitForSDLRenderer(SDL_Window* window, SDL_Renderer* renderer)
{
    return ImGui_ImplSDL2_Init(window, renderer);
}

void ImGui_ImplSDL2_Shutdown()
{
    ImGui_ImplSDL2_Data* bd = ImGui_ImplSDL2_GetBackendData();
    IM_ASSERT(bd != null && "No platform backend to shutdown, or already shutdown?");
    ImGuiIO* io = &ImGui.GetIO();

    if (bd.ClipboardTextData)
        SDL_free(bd.ClipboardTextData);
    for (ImGuiMouseCursor cursor_n = ImGuiMouseCursor.Arrow; cursor_n < ImGuiMouseCursor.COUNT; cursor_n++)
        SDL_FreeCursor(bd.MouseCursors[cursor_n]);

    io.BackendPlatformName = null;
    io.BackendPlatformUserData = null;
    IM_DELETE(bd);
}

static void ImGui_ImplSDL2_UpdateMouseData()
{
    ImGui_ImplSDL2_Data* bd = ImGui_ImplSDL2_GetBackendData();
    ImGuiIO* io = &ImGui.GetIO();

    // We forward mouse input when hovered or captured (via SDL_MOUSEMOTION) or when focused (below)
static if (SDL_HAS_CAPTURE_AND_GLOBAL_MOUSE) {
    // SDL_CaptureMouse() let the OS know e.g. that our imgui drag outside the SDL window boundaries shouldn't e.g. trigger other operations outside
    SDL_CaptureMouse((bd.MouseButtonsDown != 0 && ImGui.GetDragDropPayload() == null) ? SDL_TRUE : SDL_FALSE);
    SDL_Window* focused_window = SDL_GetKeyboardFocus();
    const bool is_app_focused = (bd.Window == focused_window);
} else {
    const bool is_app_focused = (SDL_GetWindowFlags(bd.Window) & SDL_WINDOW_INPUT_FOCUS) != 0; // SDL 2.0.3 and non-windowed systems: single-viewport only
}
    if (is_app_focused)
    {
        // (Optional) Set OS mouse position from Dear ImGui if requested (rarely used, only when ImGuiConfigFlags_NavEnableSetMousePos is enabled by user)
        if (io.WantSetMousePos)
            SDL_WarpMouseInWindow(bd.Window, cast(int)io.MousePos.x, cast(int)io.MousePos.y);

        // (Optional) Fallback to provide mouse position when focused (SDL_MOUSEMOTION already provides this when hovered or captured)
        if (bd.MouseCanUseGlobalState && bd.MouseButtonsDown == 0)
        {
            int window_x, window_y, mouse_x_global, mouse_y_global;
            SDL_GetGlobalMouseState(&mouse_x_global, &mouse_y_global);
            SDL_GetWindowPosition(bd.Window, &window_x, &window_y);
            io.AddMousePosEvent(cast(float)(mouse_x_global - window_x), cast(float)(mouse_y_global - window_y));
        }
    }
}

static void ImGui_ImplSDL2_UpdateMouseCursor()
{
    ImGuiIO* io = &ImGui.GetIO();
    if (io.ConfigFlags & ImGuiConfigFlags.NoMouseCursorChange)
        return;
    ImGui_ImplSDL2_Data* bd = ImGui_ImplSDL2_GetBackendData();

    ImGuiMouseCursor imgui_cursor = ImGui.GetMouseCursor();
    if (io.MouseDrawCursor || imgui_cursor == ImGuiMouseCursor.None)
    {
        // Hide OS mouse cursor if imgui is drawing it or if it wants no cursor
        SDL_ShowCursor(SDL_FALSE);
    }
    else
    {
        // Show OS mouse cursor
        SDL_SetCursor(bd.MouseCursors[imgui_cursor] ? bd.MouseCursors[imgui_cursor] : bd.MouseCursors[ImGuiMouseCursor.Arrow]);
        SDL_ShowCursor(SDL_TRUE);
    }
}

static void ImGui_ImplSDL2_UpdateGamepads()
{
    ImGuiIO* io = &ImGui.GetIO();
    if ((io.ConfigFlags & ImGuiConfigFlags.NavEnableGamepad) == 0) // FIXME: Technically feeding gamepad shouldn't depend on this now that they are regular inputs.
        return;

    // Get gamepad
    io.BackendFlags &= ~ImGuiBackendFlags.HasGamepad;
    SDL_GameController* game_controller = SDL_GameControllerOpen(0);
    if (!game_controller)
        return;
    io.BackendFlags |= ImGuiBackendFlags.HasGamepad;

    // Update gamepad inputs
    static float IM_SATURATE(float V) { return (V < 0.0f ? 0.0f : V > 1.0f ? 1.0f : V); }
    void MAP_BUTTON(ImGuiKey KEY_NO, SDL_GameControllerButton BUTTON_NO)() { io.AddKeyEvent(KEY_NO, SDL_GameControllerGetButton(game_controller, BUTTON_NO) != 0); }
    void MAP_ANALOG(ImGuiKey KEY_NO, SDL_GameControllerAxis AXIS_NO, float V0, float V1)() { float vn = cast(float)(SDL_GameControllerGetAxis(game_controller, AXIS_NO) - V0) / cast(float)(V1 - V0); vn = IM_SATURATE(vn); io.AddKeyAnalogEvent(KEY_NO, vn > 0.1f, vn); }
    const int thumb_dead_zone = 8000;           // SDL_gamecontroller.h suggests using this value.
    MAP_BUTTON!(ImGuiKey.GamepadStart, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_START);
    MAP_BUTTON!(ImGuiKey.GamepadBack, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_BACK);
    MAP_BUTTON!(ImGuiKey.GamepadFaceLeft, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_X);              // Xbox X, PS Square
    MAP_BUTTON!(ImGuiKey.GamepadFaceRight, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_B);              // Xbox B, PS Circle
    MAP_BUTTON!(ImGuiKey.GamepadFaceUp, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_Y);              // Xbox Y, PS Triangle
    MAP_BUTTON!(ImGuiKey.GamepadFaceDown, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_A);              // Xbox A, PS Cross
    MAP_BUTTON!(ImGuiKey.GamepadDpadLeft, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_DPAD_LEFT);
    MAP_BUTTON!(ImGuiKey.GamepadDpadRight, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_DPAD_RIGHT);
    MAP_BUTTON!(ImGuiKey.GamepadDpadUp, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_DPAD_UP);
    MAP_BUTTON!(ImGuiKey.GamepadDpadDown, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_DPAD_DOWN);
    MAP_BUTTON!(ImGuiKey.GamepadL1, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_LEFTSHOULDER);
    MAP_BUTTON!(ImGuiKey.GamepadR1, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_RIGHTSHOULDER);
    MAP_ANALOG!(ImGuiKey.GamepadL2, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_TRIGGERLEFT,  0.0f, 32767);
    MAP_ANALOG!(ImGuiKey.GamepadR2, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_TRIGGERRIGHT, 0.0f, 32767);
    MAP_BUTTON!(ImGuiKey.GamepadL3, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_LEFTSTICK);
    MAP_BUTTON!(ImGuiKey.GamepadR3, SDL_GameControllerButton.SDL_CONTROLLER_BUTTON_RIGHTSTICK);
    MAP_ANALOG!(ImGuiKey.GamepadLStickLeft, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_LEFTX,  -thumb_dead_zone, -32768);
    MAP_ANALOG!(ImGuiKey.GamepadLStickRight, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_LEFTX,  +thumb_dead_zone, +32767);
    MAP_ANALOG!(ImGuiKey.GamepadLStickUp, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_LEFTY,  -thumb_dead_zone, -32768);
    MAP_ANALOG!(ImGuiKey.GamepadLStickDown, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_LEFTY,  +thumb_dead_zone, +32767);
    MAP_ANALOG!(ImGuiKey.GamepadRStickLeft, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_RIGHTX, -thumb_dead_zone, -32768);
    MAP_ANALOG!(ImGuiKey.GamepadRStickRight, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_RIGHTX, +thumb_dead_zone, +32767);
    MAP_ANALOG!(ImGuiKey.GamepadRStickUp, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_RIGHTY, -thumb_dead_zone, -32768);
    MAP_ANALOG!(ImGuiKey.GamepadRStickDown, SDL_GameControllerAxis.SDL_CONTROLLER_AXIS_RIGHTY, +thumb_dead_zone, +32767);
}

void ImGui_ImplSDL2_NewFrame()
{
    ImGui_ImplSDL2_Data* bd = ImGui_ImplSDL2_GetBackendData();
    IM_ASSERT(bd != null && "Did you call ImGui_ImplSDL2_Init()?");
    ImGuiIO* io = &ImGui.GetIO();

    // Setup display size (every frame to accommodate for window resizing)
    int w, h;
    int display_w, display_h;
    SDL_GetWindowSize(bd.Window, &w, &h);
    if (SDL_GetWindowFlags(bd.Window) & SDL_WINDOW_MINIMIZED)
        w = h = 0;
    if (bd.Renderer != null)
        SDL_GetRendererOutputSize(bd.Renderer, &display_w, &display_h);
    else
        SDL_GL_GetDrawableSize(bd.Window, &display_w, &display_h);
    io.DisplaySize = ImVec2(cast(float)w, cast(float)h);
    if (w > 0 && h > 0)
        io.DisplayFramebufferScale = ImVec2(cast(float)display_w / w, cast(float)display_h / h);

    // Setup time step (we don't use SDL_GetTicks() because it is using millisecond resolution)
    static Uint64 frequency;
    if (frequency == 0) {
	    frequency = SDL_GetPerformanceFrequency();
	}
    Uint64 current_time = SDL_GetPerformanceCounter();
    io.DeltaTime = bd.Time > 0 ? cast(float)(cast(double)(current_time - bd.Time) / frequency) : cast(float)(1.0f / 60.0f);
    bd.Time = current_time;

    if (bd.PendingMouseLeaveFrame && bd.PendingMouseLeaveFrame >= ImGui.GetFrameCount() && bd.MouseButtonsDown == 0)
    {
        io.AddMousePosEvent(-FLT_MAX, -FLT_MAX);
        bd.PendingMouseLeaveFrame = 0;
    }

    ImGui_ImplSDL2_UpdateMouseData();
    ImGui_ImplSDL2_UpdateMouseCursor();

    // Update game controllers (if enabled and available)
    ImGui_ImplSDL2_UpdateGamepads();
}