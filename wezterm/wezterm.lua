local wezterm = require 'wezterm';
-- local dracula = require 'dracula';
local dark_plus = require 'dark_plus';
-- local scheme = wezterm.get_builtin_color_schemes()["Dark+"];
-- scheme.background = "#1e1e1e";

return {
  font = wezterm.font("JetBrains Mono Semibold"),
  font_size = 13,
  freetype_render_target = "Normal",
  font_antialias = "Subpixel",
  custom_block_glyphs = true,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",
  colors = dark_plus,
  -- color_schemes = {
  --   -- Override the builtin Gruvbox Light scheme with our modification.
  --   ["Dark+"] = scheme,
  -- },
  -- color_scheme = "Dark+",
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = false,
  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 1.0,
  },
  keys = {
    {key="m", mods="CMD", action="DisableDefaultAssignment"},
    {key="h", mods="CMD", action="DisableDefaultAssignment"},
    {key="w", mods="CMD", action="DisableDefaultAssignment"},
    {key="t", mods="CMD", action="DisableDefaultAssignment"},
    {key="h", mods="CMD", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="j", mods="CMD", action=wezterm.action{ActivatePaneDirection="Down"}},
    {key="k", mods="CMD", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="l", mods="CMD", action=wezterm.action{ActivatePaneDirection="Right"}},
    {key="w", mods="CMD", action=wezterm.action{CloseCurrentPane={confirm=false}}},
    {key="5", mods="CMD|CTRL", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="t", mods="CMD", action=wezterm.action{SpawnTab="DefaultDomain"}},
    {key="'", mods="CMD|CTRL", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="]", mods="CMD", action="ActivateCopyMode"},
  },
}
