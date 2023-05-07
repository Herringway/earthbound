module d_imgui.imconfig;
//-----------------------------------------------------------------------------
// COMPILE-TIME OPTIONS FOR DEAR IMGUI
// Runtime options (clipboard callbacks, enabling various features, etc.) can generally be set via the ImGuiIO structure.
// You can use ImGui.SetAllocatorFunctions() before calling ImGui.CreateContext() to rewire memory allocation functions.
//-----------------------------------------------------------------------------
// D_IMGUI: The way to change the compile-time options for the D-Port Imgui is by changing the enums in this file.
//
// Some options turn off default-implementations for certain operations (e.q. file reading).
// When you change theese options, you need to provide a replacement here (via function definitions or public imports).
// You will find the nessacary functions below each option.
//
// If DUB or a equivalent package manager is beeing used, just copy this file into a module name "d_imgui" in your codebase.
// Without DUB, just copy this file into the source/d_imgui folder of this library.
//-----------------------------------------------------------------------------

nothrow:
@nogc:

//---- Define assertion handler. Defaults to calling assert().
enum D_IMGUI_USER_DEFINED_ASSERT = false;
// void IM_ASSERT(T)(T expr)
// void IM_ASSERT(T)(T expr, string msg)

//---- Define attributes of all API symbols declarations, e.g. for DLL under Windows
// Using Dear ImGui via a shared library is not recommended, because of function call overhead and because we don't guarantee backward nor forward ABI compatibility.
// DLL users: heaps and globals are not shared across DLL boundaries! You will need to call SetCurrentContext() + SetAllocatorFunctions()
// for each static/DLL boundary you are calling from. Read "Context and Memory Allocators" section of imgui.cpp for more details.
// D_IMGUI: Not supported

//---- Don't define obsolete functions/enums/behaviors. Consider enabling from time to time after updating to avoid using soon-to-be obsolete function/names.
// D_IMGUI: Not all obsolet functions are implemented. Please use their replacment instead.
enum IMGUI_DISABLE_OBSOLETE_FUNCTIONS = false;
enum IMGUI_DISABLE_OBSOLETE_KEYIO = false;                      // 1.87: disable legacy io.KeyMap[]+io.KeysDown[] in favor io.AddKeyEvent(). This will be folded into IMGUI_DISABLE_OBSOLETE_FUNCTIONS in a few versions.

//---- Disable all of Dear ImGui or don't implement standard windows/tools.
// It is very strongly recommended to NOT disable the demo windows and debug tool during development. They are extremely useful in day to day work. Please read comments in imgui_demo.d.
// D_IMGUI: Disabling everything is not supported.
//#define IMGUI_DISABLE                                         // Disable everything: all headers and source files will be empty.
enum IMGUI_DISABLE_DEMO_WINDOWS = false;                        // Disable demo windows: ShowDemoWindow()/ShowStyleEditor() will be empty.
enum IMGUI_DISABLE_DEBUG_TOOLS = false;                         // Disable metrics/debugger and other debug tools: ShowMetricsWindow(), ShowDebugLogWindow() and ShowStackToolWindow() will be empty (this was called IMGUI_DISABLE_METRICS_WINDOW before 1.88).

//---- Don't implement some functions to reduce linkage requirements.
version(Windows) {
	pragma(lib, "user32");
	pragma(lib, "kernel32");
}
enum IMGUI_DISABLE_WIN32_DEFAULT_CLIPBOARD_FUNCTIONS = false;   // [Win32] Don't implement default clipboard handler. Won't use and link with OpenClipboard/GetClipboardData/CloseClipboard etc. (user32.lib/.a, kernel32.lib/.a)
enum IMGUI_DISABLE_WIN32_DEFAULT_IME_FUNCTIONS = false;         // [Win32] Don't implement default IME handler. Won't use and link with ImmGetContext/ImmSetCompositionWindow. (imm32.lib/.a)
enum IMGUI_DISABLE_WIN32_FUNCTIONS = false;                     // [Win32] Won't use and link with any Win32 function (clipboard, ime).
enum IMGUI_ENABLE_OSX_DEFAULT_CLIPBOARD_FUNCTIONS = false;      // [OSX] Implement default OSX clipboard handler (need to link with '-framework ApplicationServices', this is why this is not the default).
//#define IMGUI_DISABLE_SSE                                 // Disable use of SSE intrinsics even if available

//---- Don't provide certain default implementations using the C standard library.

// D_IMGUI: We use the d_snprintf package for formating.
// Since d_snprintf does't use C's va_list and va_start, beeing able to switch implementations is currently not feasible.
// enum IMGUI_DISABLE_DEFAULT_FORMAT_FUNCTIONS = false;            // Don't implement ImFormatString/ImFormatStringV so you can implement them yourself (e.g. if you don't want to link with vsnprintf)
// int ImFormatString(char[] buf, string fmt, ...)
// int ImFormatStringV(char[] buf, string fmt, va_list args)

enum IMGUI_DISABLE_DEFAULT_MATH_FUNCTIONS = false;              // Don't implement ImFabs/ImSqrt/ImPow/ImFmod/ImCos/ImSin/ImAcos/ImAtan2 so you can implement them yourself.
// float ImFabs(float x)
// float ImSqrt(float x)
// float ImFmod(float x)
// float ImCos(float x)
// float ImSin(float x)
// float ImAcos(float x)
// float ImAtan2(float x)
// double ImAtof(string str)
// float ImFloorStd(float x)
// float ImCeil(float x)
// float ImPow(float base, float exponent)
// double ImPow(double base, double exponent)
// float ImLog(float x)
// double ImLog(double x)
// int ImAbs(int x)
// float ImAbs(float x)
// double ImAbs(double x)
// float ImSign(float x)
// double ImSign(double x)
// float ImRsqrt(float x)
// double ImRsqrt(double x)

enum IMGUI_DISABLE_DEFAULT_FILE_FUNCTIONS = false;              // Don't implement ImFileOpen/ImFileClose/ImFileRead/ImFileWrite so you can implement them yourself if you don't want to link with fopen/fclose/fread/fwrite. This will also disable the LogToTTY() function.
// alias ImFileHandle = FILE*;
// ImFileHandle ImFileOpen(string filename, string mode)
// bool ImFileClose(ImFileHandle file)
// ulong ImFileGetSize(ImFileHandle file)
// ulong ImFileRead(void* buffer, ulong size, ImFileHandle file)
// ulong ImFileWrite(const void* data, ulong size, ImFileHandle file)
// ImFileHandle ImGetStdout()
// bool ImFlushConsole(ImFileHandle file)

enum IMGUI_DISABLE_DEFAULT_ALLOCATORS = false;                  // Don't implement default allocators calling malloc()/free() to avoid linking with them.
// You will need to call ImGui.SetAllocatorFunctions().

//---- Disable all logging to stdout
enum IMGUI_DISABLE_TTY_FUNCTIONS = false;

//---- Include imgui_user.d at the end of imgui.d as a convenience
// D_IMGUI: Not supported/necessary. Add a public import of your own module below.

//---- Pack colors to BGRA8 instead of RGBA8 (to avoid converting from one to another)
enum IMGUI_USE_BGRA_PACKED_COLOR = false;

//---- Use 32-bit for ImWchar (default is 16-bit) to support unicode planes 1-16. (e.g. point beyond 0xFFFF like emoticons, dingbats, symbols, shapes, ancient languages, etc...)
enum IMGUI_USE_WCHAR32 = false;

//---- Avoid multiple STB libraries implementations, or redefine path/filenames to prioritize another version
// D_IMGUI: Not supported/necessary. D-Imgui will always use its own truetype/reckpack implementation.

//---- Define constructor and implicit cast operators to convert back<>forth between your math types and ImVec2/ImVec4.
// D_IMGUI: Not supported.

//---- Use 32-bit vertex indices (default is 16-bit) is one way to allow large meshes with more than 64K vertices.
// Your renderer backend will need to support it (most example renderer backends support both 16/32-bit indices).
// Another way to allow large meshes while keeping 16-bit indices is to handle ImDrawCmd.VtxOffset in your renderer.
// Read about ImGuiBackendFlags.RendererHasVtxOffset for details.
enum D_IMGUI_USER_DEFINED_DRAW_IDX = false;
// alias ImDrawIdx = uint;

//---- Override ImDrawCallback signature (will need to modify renderer backends accordingly)
enum D_IMGUI_USER_DEFINED_DRAW_CALLBACK = false;
// import d_imgui.imgui_h.d : ImDrawList, ImDrawCmd;
// alias ImDrawCallback = void function(const ImDrawList* draw_list, const ImDrawCmd* cmd, MyType* my_renderer_user_data);

//---- Debug Tools: Macro to break in Debugger
// (use 'Metrics->Tools->Item Picker' to pick widgets with the mouse and break into them for easy debugging.)
enum D_IMGUI_USER_DEFINED_DEBUG_BREAK = false;
// void IM_DEBUG_BREAK()

//---- Debug Tools: Enable slower asserts
enum IMGUI_DEBUG_PARANOID = false;

//-----------------------------------------------------------------------------
// D_IMGUI: Additional compile time options
//-----------------------------------------------------------------------------

//---- Import for your own ImGui widgets
// public import your_app.imgui_extensions;

//---- Don't use \r\n on windows
enum D_IMGUI_NORMAL_NEWLINE_ON_WINDOWS = false;

//---- Define your own backend texture id
alias ImTextureID = void*;

//---- Don't assert on recoverable errors
enum D_IMGUI_USER_DEFINED_RECOVERABLE_ERROR = false;
// void IM_ASSERT_USER_ERROR(bool exp, string msg);