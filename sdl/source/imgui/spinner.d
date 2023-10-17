module imgui.spinner;

import std.math;

import ImGui = d_imgui.imgui;
import d_imgui.imgui_h;
import d_imgui.imgui;
import d_imgui.imgui_widgets;
import d_imgui.imgui_draw;
import d_imgui.imgui_internal;

bool Spinner(const string label, float radius, int thickness, ImU32 color) {
    ImGuiWindow* window = GetCurrentWindow();
    if (window.SkipItems)
        return false;

    ImGuiContext* g = GImGui;
    const style = g.Style;
    const ImGuiID id = window.GetID(label);

    ImVec2 pos = window.DC.CursorPos;
    ImVec2 size = ImVec2((radius )*2, (radius + style.FramePadding.y)*2);

    const ImRect bb = ImRect(pos, ImVec2(pos.x + size.x, pos.y + size.y));
    ItemSize(bb, style.FramePadding.y);
    if (!ItemAdd(bb, id))
        return false;

    // Render
    window.DrawList.PathClear();

    int num_segments = 30;
    int start = cast(int)abs(ImSin(g.Time*1.8f)*(num_segments-5));

    const float a_min = IM_PI*2.0f * (cast(float)start) / cast(float)num_segments;
    const float a_max = IM_PI*2.0f * (cast(float)num_segments-3) / cast(float)num_segments;

    const ImVec2 centre = ImVec2(pos.x+radius, pos.y+radius+style.FramePadding.y);

    for (int i = 0; i < num_segments; i++) {
        const float a = a_min + (cast(float)i / cast(float)num_segments) * (a_max - a_min);
        window.DrawList.PathLineTo(ImVec2(centre.x + ImCos(a+g.Time*8) * radius, centre.y + ImSin(a+g.Time*8) * radius));
    }

    window.DrawList.PathStroke(color, ImDrawFlags.None, thickness);
    return false;
}