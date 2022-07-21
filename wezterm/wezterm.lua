local wezterm = require 'wezterm';
local dark_plus = require 'dark_plus';

return {
  font = wezterm.font({
    family="JetBrains Mono",
    stretch="ExtraExpanded",
    weight="DemiBold",
  }),
  font_size = 13.5,
  custom_block_glyphs = false,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "RESIZE",
  window_close_confirmation = "NeverPrompt",
  colors = dark_plus,
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = true,
  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 1.0,
  },
  keys = {
    {key="m", mods="CMD", action="DisableDefaultAssignment"},
    {key="h", mods="CMD", action="DisableDefaultAssignment"},
    {key="t", mods="CMD", action="DisableDefaultAssignment"},
    {key="t", mods="CMD", action=wezterm.action{SpawnTab="DefaultDomain"}},
    {key="w", mods="CMD", action=wezterm.action{CloseCurrentPane={confirm=false}}},
    {key="[", mods="CMD", action="ActivateCopyMode"},
  },
}
