module imgui.hexeditor;
// Mini memory editor for Dear ImGui (to embed in your game/tools)
// Get latest version at http://www.github.com/ocornut/imgui_club
//
// Right-click anywhere to access the Options menu!
// You can adjust the keyboard repeat delay/rate in ImGuiIO.
// The code assume a mono-space font for simplicity!
// If you don't use the default font, use ImGui::PushFont()/PopFont() to switch to a mono-space font before calling this.
//
// Usage:
//   // Create a window and draw memory editor inside it:
//   static MemoryEditor mem_edit_1;
//   static char data[0x10000];
//   size_t data_size = 0x10000;
//   mem_edit_1.DrawWindow("Memory Editor", data, data_size);
//
// Usage:
//   // If you already have a window, use DrawContents() instead:
//   static MemoryEditor mem_edit_2;
//   ImGui::Begin("MyWindow")
//   mem_edit_2.DrawContents(this, sizeof(*this), (size_t)this);
//   ImGui::End();
//
// Changelog:
// - v0.10: initial version
// - v0.23 (2017/08/17): added to github. fixed right-arrow triggering a byte write.
// - v0.24 (2018/06/02): changed DragInt("Rows" to use a %d data format (which is desirable since imgui 1.61).
// - v0.25 (2018/07/11): fixed wording: all occurrences of "Rows" renamed to "Columns".
// - v0.26 (2018/08/02): fixed clicking on hex region
// - v0.30 (2018/08/02): added data preview for common data types
// - v0.31 (2018/10/10): added OptUpperCaseHex option to select lower/upper casing display [@samhocevar]
// - v0.32 (2018/10/10): changed signatures to use void* instead of unsigned char*
// - v0.33 (2018/10/10): added OptShowOptions option to hide all the interactive option setting.
// - v0.34 (2019/05/07): binary preview now applies endianness setting [@nicolasnoble]
// - v0.35 (2020/01/29): using ImGuiDataType available since Dear ImGui 1.69.
// - v0.36 (2020/05/05): minor tweaks, minor refactor.
// - v0.40 (2020/10/04): fix misuse of ImGuiListClipper API, broke with Dear ImGui 1.79. made cursor position appears on left-side of edit box. option popup appears on mouse release. fix MSVC warnings where _CRT_SECURE_NO_WARNINGS wasn't working in recent versions.
// - v0.41 (2020/10/05): fix when using with keyboard/gamepad navigation enabled.
// - v0.42 (2020/10/14): fix for . character in ASCII view always being greyed out.
// - v0.43 (2021/03/12): added OptFooterExtraHeight to allow for custom drawing at the bottom of the editor [@leiradel]
// - v0.44 (2021/03/12): use ImGuiInputTextFlags.AlwaysOverwrite in 1.82 + fix hardcoded width.
// - v0.50 (2021/11/12): various fixes for recent dear imgui versions (fixed misuse of clipper, relying on SetKeyboardFocusHere() handling scrolling from 1.85). added default size.
//
// Todo/Bugs:
// - This is generally old/crappy code, it should work but isn't very good.. to be rewritten some day.
// - PageUp/PageDown are supported because we use _NoNav. This is a good test scenario for working out idioms of how to mix natural nav and our own...
// - Arrows are being sent to the InputText() about to disappear which for LeftArrow makes the text cursor appear at position 1 for one frame.
// - Using InputText() is awkward and maybe overkill here, consider implementing something custom.

import ImGui = d_imgui.imgui;
import d_imgui.imgui_h;
import d_imgui.imgui_widgets : AlignTextToFramePadding, BeginCombo, Button, Checkbox, Combo, DragInt, EndCombo, InputText, InvisibleButton, Selectable, Separator, Text, TextDisabled, TextUnformatted; // not sure why this is needed. should be accessible via ImGui

import core.stdc.stdio;      // sprintf, scanf
import core.stdc.stdint;     // uint8_t, etc.
import std.format : format;
import std.string : toStringz;

enum _PRISizeT = "z";
alias ImSnprintf = snprintf;

struct MemoryEditor {
    enum DataFormat
    {
        Bin = 0,
        Dec = 1,
        Hex = 2,
        COUNT
    };

    // Settings
    bool            Open = true;                                       // = true   // set to false when DrawWindow() was closed. ignore if not using DrawWindow().
    bool            ReadOnly = false;                                   // = false  // disable any editing.
    int             Cols = 16;                                       // = 16     // number of columns to display.
    bool            OptShowOptions = true;                             // = true   // display options button/context menu. when disabled, options will be locked unless you provide your own UI for them.
    bool            OptShowDataPreview = false;                         // = false  // display a footer previewing the decimal/binary/hex/float representation of the currently selected bytes.
    bool            OptShowHexII = false;                               // = false  // display values in HexII representation instead of regular hexadecimal: hide null/zero bytes, ascii values as ".X".
    bool            OptShowAscii = true;                               // = true   // display ASCII representation on the right side.
    bool            OptGreyOutZeroes = true;                           // = true   // display null/zero bytes using the TextDisabled color.
    bool            OptUpperCaseHex = true;                            // = true   // display hexadecimal values as "FF" instead of "ff".
    int             OptMidColsCount = 8;                            // = 8      // set to 0 to disable extra spacing between every mid-cols.
    int             OptAddrDigitsCount = 0;                         // = 0      // number of addr digits to display (default calculated based on maximum displayed addr).
    float           OptFooterExtraHeight = 0.0f;                       // = 0      // space to reserve at the bottom of the widget to add custom widgets
    ImU32           HighlightColor = IM_COL32(255, 255, 255, 50);                             //          // background color of highlighted bytes.
    ImU8            function(const ImU8* data, size_t off) ReadFn;    // = 0      // optional handler to read bytes.
    void            function(ImU8* data, size_t off, ImU8 d) WriteFn; // = 0      // optional handler to write bytes.
    bool            function(const ImU8* data, size_t off) HighlightFn;//= 0      // optional handler to return Highlight property (to support non-contiguous highlighting).

    // [Internal State]
    bool            ContentsWidthChanged = false;
    size_t          DataPreviewAddr = cast(size_t)-1;
    size_t          DataEditingAddr = cast(size_t)-1;
    bool            DataEditingTakeFocus = false;
    char[32]            DataInputBuf = 0;
    char[32]            AddrInputBuf = 0;
    size_t          GotoAddr = cast(size_t)-1;
    size_t          HighlightMin = cast(size_t)-1;
    size_t          HighlightMax = cast(size_t)-1;
    int             PreviewEndianess = 0;
    ImGuiDataType   PreviewDataType = ImGuiDataType.S32;

    void GotoAddrAndHighlight(size_t addr_min, size_t addr_max)
    {
        GotoAddr = addr_min;
        HighlightMin = addr_min;
        HighlightMax = addr_max;
    }

    struct Sizes
    {
        int     AddrDigitsCount;
        float   LineHeight = 0.0;
        float   GlyphWidth = 0.0;
        float   HexCellWidth = 0.0;
        float   SpacingBetweenMidCols = 0.0;
        float   PosHexStart = 0.0;
        float   PosHexEnd = 0.0;
        float   PosAsciiStart = 0.0;
        float   PosAsciiEnd = 0.0;
        float   WindowWidth = 0.0;

    };

    void CalcSizes(ref Sizes s, size_t mem_size, size_t base_display_addr)
    {
        ImGuiStyle* style = &ImGui.GetStyle();
        s.AddrDigitsCount = OptAddrDigitsCount;
        if (s.AddrDigitsCount == 0)
            for (size_t n = base_display_addr + mem_size - 1; n > 0; n >>= 4)
                s.AddrDigitsCount++;
        s.LineHeight = ImGui.GetTextLineHeight();
        s.GlyphWidth = ImGui.CalcTextSize("F").x + 1;                  // We assume the font is mono-space
        s.HexCellWidth = cast(float)cast(int)(s.GlyphWidth * 2.5f);             // "FF " we include trailing space in the width to easily catch clicks everywhere
        s.SpacingBetweenMidCols = cast(float)cast(int)(s.HexCellWidth * 0.25f); // Every OptMidColsCount columns we add a bit of extra spacing
        s.PosHexStart = (s.AddrDigitsCount + 2) * s.GlyphWidth;
        s.PosHexEnd = s.PosHexStart + (s.HexCellWidth * Cols);
        s.PosAsciiStart = s.PosAsciiEnd = s.PosHexEnd;
        if (OptShowAscii)
        {
            s.PosAsciiStart = s.PosHexEnd + s.GlyphWidth * 1;
            if (OptMidColsCount > 0)
                s.PosAsciiStart += cast(float)((Cols + OptMidColsCount - 1) / OptMidColsCount) * s.SpacingBetweenMidCols;
            s.PosAsciiEnd = s.PosAsciiStart + Cols * s.GlyphWidth;
        }
        s.WindowWidth = s.PosAsciiEnd + style.ScrollbarSize + style.WindowPadding.x * 2 + s.GlyphWidth;
    }

    // Standalone Memory Editor window
    void DrawWindow(string title, void[] mem_data, size_t base_display_addr = 0x0000)
    {
        Sizes s;
        CalcSizes(s, mem_data.length, base_display_addr);
        ImGui.SetNextWindowSize(ImVec2(s.WindowWidth, s.WindowWidth * 0.60f), ImGuiCond.FirstUseEver);
        ImGui.SetNextWindowSizeConstraints(ImVec2(0.0f, 0.0f), ImVec2(s.WindowWidth, FLT_MAX));

        Open = true;
        if (ImGui.Begin(title, &Open, ImGuiWindowFlags.NoScrollbar))
        {
            if (ImGui.IsWindowHovered(ImGuiHoveredFlags.RootAndChildWindows) && ImGui.IsMouseReleased(ImGuiMouseButton.Right))
                ImGui.OpenPopup("context");
            DrawContents(mem_data, base_display_addr);
            if (ContentsWidthChanged)
            {
                CalcSizes(s, mem_data.length, base_display_addr);
                ImGui.SetWindowSize(ImVec2(s.WindowWidth, ImGui.GetWindowSize().y));
            }
        }
        ImGui.End();
    }

    // Memory Editor contents only
    void DrawContents(void[] mem_data_void, size_t base_display_addr = 0x0000)
    {
        if (Cols < 1)
            Cols = 1;

        ImU8[] mem_data = cast(ImU8[])mem_data_void;
        Sizes s;
        CalcSizes(s, mem_data_void.length, base_display_addr);
        ImGuiStyle* style = &ImGui.GetStyle();

        // We begin into our scrolling region with the 'ImGuiWindowFlags.NoMove' in order to prevent click from moving the window.
        // This is used as a facility since our main click detection code doesn't assign an ActiveId so the click would normally be caught as a window-move.
        const float height_separator = style.ItemSpacing.y;
        float footer_height = OptFooterExtraHeight;
        if (OptShowOptions)
            footer_height += height_separator + ImGui.GetFrameHeightWithSpacing() * 1;
        if (OptShowDataPreview)
            footer_height += height_separator + ImGui.GetFrameHeightWithSpacing() * 1 + ImGui.GetTextLineHeightWithSpacing() * 3;
        ImGui.BeginChild("##scrolling", ImVec2(0, -footer_height), false, ImGuiWindowFlags.NoMove | ImGuiWindowFlags.NoNav);
        ImDrawList* draw_list = ImGui.GetWindowDrawList();

        ImGui.PushStyleVar(ImGuiStyleVar.FramePadding, ImVec2(0, 0));
        ImGui.PushStyleVar(ImGuiStyleVar.ItemSpacing, ImVec2(0, 0));

        // We are not really using the clipper API correctly here, because we rely on visible_start_addr/visible_end_addr for our scrolling function.
        const int line_total_count = cast(int)((mem_data_void.length + Cols - 1) / Cols);
        auto clipper = ImGuiListClipper(false);
        clipper.Begin(line_total_count, s.LineHeight);

        bool data_next = false;

        if (ReadOnly || DataEditingAddr >= mem_data_void.length)
            DataEditingAddr = cast(size_t)-1;
        if (DataPreviewAddr >= mem_data_void.length)
            DataPreviewAddr = cast(size_t)-1;

        size_t preview_data_type_size = OptShowDataPreview ? DataTypeGetSize(PreviewDataType) : 0;

        size_t data_editing_addr_next = cast(size_t)-1;
        if (DataEditingAddr != cast(size_t)-1)
        {
            // Move cursor but only apply on next frame so scrolling with be synchronized (because currently we can't change the scrolling while the window is being rendered)
            if (ImGui.IsKeyPressed(ImGui.GetKeyIndex(ImGuiKey.UpArrow)) && cast(ptrdiff_t)DataEditingAddr >= cast(ptrdiff_t)Cols)                     { data_editing_addr_next = DataEditingAddr - Cols; }
            else if (ImGui.IsKeyPressed(ImGui.GetKeyIndex(ImGuiKey.DownArrow)) && cast(ptrdiff_t)DataEditingAddr < cast(ptrdiff_t)mem_data_void.length - Cols)    { data_editing_addr_next = DataEditingAddr + Cols; }
            else if (ImGui.IsKeyPressed(ImGui.GetKeyIndex(ImGuiKey.LeftArrow)) && cast(ptrdiff_t)DataEditingAddr > cast(ptrdiff_t)0)                  { data_editing_addr_next = DataEditingAddr - 1; }
            else if (ImGui.IsKeyPressed(ImGui.GetKeyIndex(ImGuiKey.RightArrow)) && cast(ptrdiff_t)DataEditingAddr < cast(ptrdiff_t)mem_data_void.length - 1)      { data_editing_addr_next = DataEditingAddr + 1; }
        }

        // Draw vertical separator
        ImVec2 window_pos = ImGui.GetWindowPos();
        if (OptShowAscii)
            draw_list.AddLine(ImVec2(window_pos.x + s.PosAsciiStart - s.GlyphWidth, window_pos.y), ImVec2(window_pos.x + s.PosAsciiStart - s.GlyphWidth, window_pos.y + 9999), ImGui.GetColorU32(ImGuiCol.Border));

        const ImU32 color_text = ImGui.GetColorU32(ImGuiCol.Text);
        const ImU32 color_disabled = OptGreyOutZeroes ? ImGui.GetColorU32(ImGuiCol.TextDisabled) : color_text;

        string format_address = OptUpperCaseHex ? "%0*" ~_PRISizeT~ "X: " : "%0*" ~_PRISizeT~ "x: ";
        string format_data = OptUpperCaseHex ? "%0*" ~_PRISizeT~ "X" : "%0*" ~_PRISizeT~ "x";
        string format_byte = OptUpperCaseHex ? "%02X" : "%02x";
        string format_byte_space = OptUpperCaseHex ? "%02X " : "%02x ";

        while (clipper.Step())
            for (int line_i = clipper.DisplayStart; line_i < clipper.DisplayEnd; line_i++) // display only visible lines
            {
                size_t addr = cast(size_t)(line_i * Cols);
                Text(format_address, s.AddrDigitsCount, base_display_addr + addr);

                // Draw Hexadecimal
                for (int n = 0; n < Cols && addr < mem_data_void.length; n++, addr++)
                {
                    float byte_pos_x = s.PosHexStart + s.HexCellWidth * n;
                    if (OptMidColsCount > 0)
                        byte_pos_x += cast(float)(n / OptMidColsCount) * s.SpacingBetweenMidCols;
                    ImGui.SameLine(byte_pos_x);

                    // Draw highlight
                    bool is_highlight_from_user_range = (addr >= HighlightMin && addr < HighlightMax);
                    bool is_highlight_from_user_func = (HighlightFn && HighlightFn(&mem_data[0], addr));
                    bool is_highlight_from_preview = (addr >= DataPreviewAddr && addr < DataPreviewAddr + preview_data_type_size);
                    if (is_highlight_from_user_range || is_highlight_from_user_func || is_highlight_from_preview)
                    {
                        ImVec2 pos = ImGui.GetCursorScreenPos();
                        float highlight_width = s.GlyphWidth * 2;
                        bool is_next_byte_highlighted = (addr + 1 < mem_data_void.length) && ((HighlightMax != cast(size_t)-1 && addr + 1 < HighlightMax) || (HighlightFn && HighlightFn(&mem_data[0], addr + 1)));
                        if (is_next_byte_highlighted || (n + 1 == Cols))
                        {
                            highlight_width = s.HexCellWidth;
                            if (OptMidColsCount > 0 && n > 0 && (n + 1) < Cols && ((n + 1) % OptMidColsCount) == 0)
                                highlight_width += s.SpacingBetweenMidCols;
                        }
                        draw_list.AddRectFilled(pos, ImVec2(pos.x + highlight_width, pos.y + s.LineHeight), HighlightColor);
                    }

                    if (DataEditingAddr == addr)
                    {
                        // Display text input on current byte
                        bool data_write = false;
                        ImGui.PushID(cast(void*)addr);
                        if (DataEditingTakeFocus)
                        {
                            ImGui.SetKeyboardFocusHere(0);
                            sprintf(&AddrInputBuf[0], format_data.toStringz, s.AddrDigitsCount, base_display_addr + addr);
                            sprintf(&DataInputBuf[0], format_byte.toStringz, ReadFn ? ReadFn(&mem_data[0], addr) : mem_data[addr]);
                        }
                        static struct UserData
                        {
                            // FIXME: We should have a way to retrieve the text edit cursor position more easily in the API, this is rather tedious. This is such a ugly mess we may be better off not using InputText() at all here.
                            static int Callback(ImGuiInputTextCallbackData* data) nothrow @nogc
                            {
                                UserData* user_data = cast(UserData*)data.UserData;
                                if (!data.HasSelection())
                                    user_data.CursorPos = data.CursorPos;
                                if (data.SelectionStart == 0 && data.SelectionEnd == data.BufTextLen)
                                {
                                    // When not editing a byte, always refresh its InputText content pulled from underlying memory data
                                    // (this is a bit tricky, since InputText technically "owns" the master copy of the buffer we edit it in there)
                                    data.DeleteChars(0, data.BufTextLen);
                                    data.InsertChars(0, user_data.CurrentBufOverwrite);
                                    data.SelectionStart = 0;
                                    data.SelectionEnd = 2;
                                    data.CursorPos = 0;
                                }
                                return 0;
                            }
                            string   CurrentBufOverwrite;  // Input
                            int    CursorPos;               // Output
                        }
                        UserData user_data;
                        user_data.CursorPos = -1;
                        user_data.CurrentBufOverwrite = format(format_byte, ReadFn ? ReadFn(&mem_data[0], addr) : mem_data[addr]);
                        ImGuiInputTextFlags flags = ImGuiInputTextFlags.CharsHexadecimal | ImGuiInputTextFlags.EnterReturnsTrue | ImGuiInputTextFlags.AutoSelectAll | ImGuiInputTextFlags.NoHorizontalScroll | ImGuiInputTextFlags.CallbackAlways;
                        flags |= ImGuiInputTextFlags.AlwaysOverwrite;
                        ImGui.SetNextItemWidth(s.GlyphWidth * 2);
                        if (InputText("##data", DataInputBuf, flags, &UserData.Callback, &user_data))
                            data_write = data_next = true;
                        else if (!DataEditingTakeFocus && !ImGui.IsItemActive())
                            DataEditingAddr = data_editing_addr_next = cast(size_t)-1;
                        DataEditingTakeFocus = false;
                        if (user_data.CursorPos >= 2)
                            data_write = data_next = true;
                        if (data_editing_addr_next != cast(size_t)-1)
                            data_write = data_next = false;
                        uint data_input_value = 0;
                        if (data_write && sscanf(&DataInputBuf[0], "%X", &data_input_value) == 1)
                        {
                            if (WriteFn)
                                WriteFn(&mem_data[0], addr, cast(ImU8)data_input_value);
                            else
                                mem_data[addr] = cast(ImU8)data_input_value;
                        }
                        ImGui.PopID();
                    }
                    else
                    {
                        // NB: The trailing space is not visible but ensure there's no gap that the mouse cannot click on.
                        ImU8 b = ReadFn ? ReadFn(&mem_data[0], addr) : mem_data[addr];

                        if (OptShowHexII)
                        {
                            if ((b >= 32 && b < 128))
                                Text(".%c ", b);
                            else if (b == 0xFF && OptGreyOutZeroes)
                                TextDisabled("## ");
                            else if (b == 0x00)
                                Text("   ");
                            else
                                Text(format_byte_space, b);
                        }
                        else
                        {
                            if (b == 0 && OptGreyOutZeroes)
                                TextDisabled("00 ");
                            else
                                Text(format_byte_space, b);
                        }
                        if (!ReadOnly && ImGui.IsItemHovered() && ImGui.IsMouseClicked(ImGuiMouseButton.Left))
                        {
                            DataEditingTakeFocus = true;
                            data_editing_addr_next = addr;
                        }
                    }
                }

                if (OptShowAscii)
                {
                    // Draw ASCII values
                    ImGui.SameLine(s.PosAsciiStart);
                    ImVec2 pos = ImGui.GetCursorScreenPos();
                    addr = line_i * Cols;
                    ImGui.PushID(line_i);
                    if (InvisibleButton("ascii", ImVec2(s.PosAsciiEnd - s.PosAsciiStart, s.LineHeight)))
                    {
                        DataEditingAddr = DataPreviewAddr = addr + cast(size_t)((ImGui.GetIO().MousePos.x - pos.x) / s.GlyphWidth);
                        DataEditingTakeFocus = true;
                    }
                    ImGui.PopID();
                    for (int n = 0; n < Cols && addr < mem_data_void.length; n++, addr++)
                    {
                        if (addr == DataEditingAddr)
                        {
                            draw_list.AddRectFilled(pos, ImVec2(pos.x + s.GlyphWidth, pos.y + s.LineHeight), ImGui.GetColorU32(ImGuiCol.FrameBg));
                            draw_list.AddRectFilled(pos, ImVec2(pos.x + s.GlyphWidth, pos.y + s.LineHeight), ImGui.GetColorU32(ImGuiCol.TextSelectedBg));
                        }
                        ubyte c = ReadFn ? ReadFn(&mem_data[0], addr) : mem_data[addr];
                        char display_c = (c < 32 || c >= 128) ? '.' : c;
                        draw_list.AddText(pos, (display_c == c) ? color_text : color_disabled, [display_c]);
                        pos.x += s.GlyphWidth;
                    }
                }
            }
        ImGui.PopStyleVar(2);
        ImGui.EndChild();

        // Notify the main window of our ideal child content size (FIXME: we are missing an API to get the contents size from the child)
        ImGui.SetCursorPosX(s.WindowWidth);

        if (data_next && DataEditingAddr + 1 < mem_data_void.length)
        {
            DataEditingAddr = DataPreviewAddr = DataEditingAddr + 1;
            DataEditingTakeFocus = true;
        }
        else if (data_editing_addr_next != cast(size_t)-1)
        {
            DataEditingAddr = DataPreviewAddr = data_editing_addr_next;
            DataEditingTakeFocus = true;
        }

        const bool lock_show_data_preview = OptShowDataPreview;
        if (OptShowOptions)
        {
            Separator();
            DrawOptionsLine(s, mem_data, base_display_addr);
        }

        if (lock_show_data_preview)
        {
            Separator();
            DrawPreviewLine(s, mem_data, base_display_addr);
        }
    }

    void DrawOptionsLine(const ref Sizes s, void[] mem_data, size_t base_display_addr)
    {
        ImGuiStyle* style = &ImGui.GetStyle();
        string format_range = OptUpperCaseHex ? "Range %0*" ~ _PRISizeT ~ "X..%0*" ~ _PRISizeT ~ "X" : "Range %0*" ~ _PRISizeT ~ "x..%0*" ~ _PRISizeT ~ "x";

        // Options menu
        if (Button("Options"))
            ImGui.OpenPopup("context");
        if (ImGui.BeginPopup("context"))
        {
            ImGui.SetNextItemWidth(s.GlyphWidth * 7 + style.FramePadding.x * 2.0f);
            if (DragInt("##cols", &Cols, 0.2f, 4, 32, "%d cols")) { ContentsWidthChanged = true; if (Cols < 1) Cols = 1; }
            Checkbox("Show Data Preview", &OptShowDataPreview);
            Checkbox("Show HexII", &OptShowHexII);
            if (Checkbox("Show Ascii", &OptShowAscii)) { ContentsWidthChanged = true; }
            Checkbox("Grey out zeroes", &OptGreyOutZeroes);
            Checkbox("Uppercase Hex", &OptUpperCaseHex);

            ImGui.EndPopup();
        }

        ImGui.SameLine();
        Text(format_range, s.AddrDigitsCount, base_display_addr, s.AddrDigitsCount, base_display_addr + mem_data.length - 1);
        ImGui.SameLine();
        ImGui.SetNextItemWidth((s.AddrDigitsCount + 1) * s.GlyphWidth + style.FramePadding.x * 2.0f);
        if (InputText("##addr", AddrInputBuf, ImGuiInputTextFlags.CharsHexadecimal | ImGuiInputTextFlags.EnterReturnsTrue))
        {
            size_t goto_addr;
            if (sscanf(&AddrInputBuf[0], "%" ~ _PRISizeT ~ "X", &goto_addr) == 1)
            {
                GotoAddr = goto_addr - base_display_addr;
                HighlightMin = HighlightMax = cast(size_t)-1;
            }
        }

        if (GotoAddr != cast(size_t)-1)
        {
            if (GotoAddr < mem_data.length)
            {
                ImGui.BeginChild("##scrolling");
                ImGui.SetScrollFromPosY(ImGui.GetCursorStartPos().y + (GotoAddr / Cols) * ImGui.GetTextLineHeight());
                ImGui.EndChild();
                DataEditingAddr = DataPreviewAddr = GotoAddr;
                DataEditingTakeFocus = true;
            }
            GotoAddr = cast(size_t)-1;
        }
    }

    void DrawPreviewLine(const ref Sizes s, void[] mem_data_void, size_t base_display_addr)
    {
        IM_UNUSED(base_display_addr);
        ImU8[] mem_data = cast(ImU8[])mem_data_void;
        ImGuiStyle* style = &ImGui.GetStyle();
        AlignTextToFramePadding();
        Text("Preview as:");
        ImGui.SameLine();
        ImGui.SetNextItemWidth((s.GlyphWidth * 10.0f) + style.FramePadding.x * 2.0f + style.ItemInnerSpacing.x);
        if (BeginCombo("##combo_type", DataTypeGetDesc(PreviewDataType), ImGuiComboFlags.HeightLargest))
        {
            for (int n = 0; n < ImGuiDataType.COUNT; n++)
                if (Selectable(DataTypeGetDesc(cast(ImGuiDataType)n), PreviewDataType == n))
                    PreviewDataType = cast(ImGuiDataType)n;
            EndCombo();
        }
        ImGui.SameLine();
        ImGui.SetNextItemWidth((s.GlyphWidth * 6.0f) + style.FramePadding.x * 2.0f + style.ItemInnerSpacing.x);
        Combo("##combo_endianess", &PreviewEndianess, "LE\0BE\0\0");

        char[128] buf = "";
        float x = s.GlyphWidth * 6.0f;
        bool has_value = DataPreviewAddr != cast(size_t)-1;
        if (has_value)
            DrawPreviewData(DataPreviewAddr, mem_data, PreviewDataType, DataFormat.Dec, &buf[0], cast(size_t)IM_ARRAYSIZE(buf));
        Text("Dec"); ImGui.SameLine(x); TextUnformatted(has_value ? buf.idup : "N/A");
        if (has_value)
            DrawPreviewData(DataPreviewAddr, mem_data, PreviewDataType, DataFormat.Hex, &buf[0], cast(size_t)IM_ARRAYSIZE(buf));
        Text("Hex"); ImGui.SameLine(x); TextUnformatted(has_value ? buf.idup : "N/A");
        if (has_value)
            DrawPreviewData(DataPreviewAddr, mem_data, PreviewDataType, DataFormat.Bin, &buf[0], cast(size_t)IM_ARRAYSIZE(buf));
        buf[IM_ARRAYSIZE(buf) - 1] = 0;
        Text("Bin"); ImGui.SameLine(x); TextUnformatted(has_value ? buf.idup : "N/A");
    }

    // Utilities for Data Preview
    string DataTypeGetDesc(ImGuiDataType data_type) const
    {
        immutable string[] descs = [ "Int8", "Uint8", "Int16", "Uint16", "Int32", "Uint32", "Int64", "Uint64", "Float", "Double" ];
        IM_ASSERT(data_type >= 0 && data_type < ImGuiDataType.COUNT);
        return descs[data_type];
    }

    size_t DataTypeGetSize(ImGuiDataType data_type) const
    {
        const size_t[] sizes = [ 1, 1, 2, 2, 4, 4, 8, 8, float.sizeof, double.sizeof ];
        IM_ASSERT(data_type >= 0 && data_type < ImGuiDataType.COUNT);
        return sizes[data_type];
    }

    const(char)* DataFormatGetDesc(DataFormat data_format) const
    {
        const char*[] descs = [ "Bin", "Dec", "Hex" ];
        IM_ASSERT(data_format >= 0 && data_format < DataFormat.COUNT);
        return descs[data_format];
    }

    bool IsBigEndian() const
    {
        uint16_t x = 1;
        char[2] c;
        memcpy(c, &x, 2);
        return c[0] != 0;
    }

    static void* EndianessCopyBigEndian(void* _dst, void* _src, size_t s, int is_little_endian)
    {
        if (is_little_endian)
        {
            uint8_t* dst = cast(uint8_t*)_dst;
            uint8_t* src = cast(uint8_t*)_src + s - 1;
            for (int i = 0, n = cast(int)s; i < n; ++i)
                memcpy(dst++, src--, 1);
            return _dst;
        }
        else
        {
            return memcpy(_dst, _src, s);
        }
    }

    static void* EndianessCopyLittleEndian(void* _dst, void* _src, size_t s, int is_little_endian)
    {
        if (is_little_endian)
        {
            return memcpy(_dst, _src, s);
        }
        else
        {
            uint8_t* dst = cast(uint8_t*)_dst;
            uint8_t* src = cast(uint8_t*)_src + s - 1;
            for (int i = 0, n = cast(int)s; i < n; ++i)
                memcpy(dst++, src--, 1);
            return _dst;
        }
    }

    void* EndianessCopy(void* dst, void* src, size_t size) const
    {
        static void* function(void*, void*, size_t, int) fp = NULL;
        if (fp == NULL)
            fp = IsBigEndian() ? &EndianessCopyBigEndian : &EndianessCopyLittleEndian;
        return fp(dst, src, size, PreviewEndianess);
    }

    const(char)* FormatBinary(const uint8_t* buf, int width) const
    {
        IM_ASSERT(width <= 64);
        size_t out_n = 0;
        static char[64 + 8 + 1] out_buf = 0;
        int n = width / 8;
        for (int j = n - 1; j >= 0; --j)
        {
            for (int i = 0; i < 8; ++i)
                out_buf[out_n++] = (buf[j] & (1 << (7 - i))) ? '1' : '0';
            out_buf[out_n++] = ' ';
        }
        IM_ASSERT(out_n < IM_ARRAYSIZE(out_buf));
        out_buf[out_n] = 0;
        return &out_buf[0];
    }

    // [Internal]
    void DrawPreviewData(size_t addr, const ImU8[] mem_data, ImGuiDataType data_type, DataFormat data_format, char* out_buf, size_t out_buf_size) const
    {
        uint8_t[8] buf;
        size_t elem_size = DataTypeGetSize(data_type);
        size_t size = addr + elem_size > mem_data.length ? mem_data.length - addr : elem_size;
        if (ReadFn)
            for (int i = 0, n = cast(int)size; i < n; ++i)
                buf[i] = ReadFn(&mem_data[0], addr + i);
        else
            memcpy(buf, &mem_data[addr], size);

        if (data_format == DataFormat.Bin)
        {
            uint8_t[8] binbuf;
            EndianessCopy(&binbuf[0], &buf[0], size);
            ImSnprintf(out_buf, out_buf_size, "%s", FormatBinary(&binbuf[0], cast(int)size * 8));
            return;
        }

        out_buf[0] = 0;
        switch (data_type)
        {
        case ImGuiDataType.S8:
        {
            int8_t int8 = 0;
            EndianessCopy(&int8, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%hhd", int8); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "0x%02x", int8 & 0xFF); return; }
            break;
        }
        case ImGuiDataType.U8:
        {
            uint8_t uint8 = 0;
            EndianessCopy(&uint8, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%hhu", uint8); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "0x%02x", uint8 & 0XFF); return; }
            break;
        }
        case ImGuiDataType.S16:
        {
            int16_t int16 = 0;
            EndianessCopy(&int16, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%hd", int16); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "0x%04x", int16 & 0xFFFF); return; }
            break;
        }
        case ImGuiDataType.U16:
        {
            uint16_t uint16 = 0;
            EndianessCopy(&uint16, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%hu", uint16); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "0x%04x", uint16 & 0xFFFF); return; }
            break;
        }
        case ImGuiDataType.S32:
        {
            int32_t int32 = 0;
            EndianessCopy(&int32, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%d", int32); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "0x%08x", int32); return; }
            break;
        }
        case ImGuiDataType.U32:
        {
            uint32_t uint32 = 0;
            EndianessCopy(&uint32, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%u", uint32); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "0x%08x", uint32); return; }
            break;
        }
        case ImGuiDataType.S64:
        {
            int64_t int64 = 0;
            EndianessCopy(&int64, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%lld", cast(long)int64); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "0x%016llx", cast(long)int64); return; }
            break;
        }
        case ImGuiDataType.U64:
        {
            uint64_t uint64 = 0;
            EndianessCopy(&uint64, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%llu", cast(long)uint64); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "0x%016llx", cast(long)uint64); return; }
            break;
        }
        case ImGuiDataType.Float:
        {
            float float32 = 0.0f;
            EndianessCopy(&float32, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%f", float32); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "%a", float32); return; }
            break;
        }
        case ImGuiDataType.Double:
        {
            double float64 = 0.0;
            EndianessCopy(&float64, &buf[0], size);
            if (data_format == DataFormat.Dec) { ImSnprintf(out_buf, out_buf_size, "%f", float64); return; }
            if (data_format == DataFormat.Hex) { ImSnprintf(out_buf, out_buf_size, "%a", float64); return; }
            break;
        }
        case ImGuiDataType.COUNT:
            break;
        default: break;
        } // Switch
        IM_ASSERT(0); // Shouldn't reach
    }
};
