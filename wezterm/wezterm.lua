local wezterm = require 'wezterm';
local dark_plus = require 'dark_plus';

return {
  -- font = wezterm.font('iA Writer Mono S', {stretch="ExtraExpanded", weight="DemiBold"} ),
  font = wezterm.font('JetBrains Mono', {stretch="ExtraExpanded", weight="DemiBold"}),
  harfbuzz_features={"calt=0", "clig=0", "liga=0"},
  font_size = 13,
  custom_block_glyphs = true,
  hide_tab_bar_if_only_one_tab = true,
  bold_brightens_ansi_colors = false,
  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",
  colors = dark_plus,
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = false,
  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 1.0,
  },
  keys = {
    {key="m", mods="CMD", action="DisableDefaultAssignment"},
    {key="h", mods="CMD", action="DisableDefaultAssignment"},
    -- {key="w", mods="CMD", action="DisableDefaultAssignment"},
    {key="t", mods="CMD", action="DisableDefaultAssignment"},
    {key="{", mods="SHIFT|CMD", action=wezterm.action{MoveTabRelative=-1}},
    {key="}", mods="SHIFT|CMD", action=wezterm.action{MoveTabRelative=1}},
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
