-- ~/.wezterm.lua

local wezterm = require 'wezterm'

return {
  --font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 12,

  color_scheme = "Tokyo Night",

  window_background_opacity = 0.94,
  win32_system_backdrop = "Acrylic",

  window_decorations = "RESIZE",

  --hide_tab_bar_if_only_one_tab = true,

  use_fancy_tab_bar = false,

  adjust_window_size_when_changing_font_size = false,

  line_height = 1.1,

  enable_scroll_bar = true,

  default_prog = { "pwsh.exe" },

  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },

  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },

  keys = {
    {
      key = "Enter",
      mods = "ALT",
      action = wezterm.action.ToggleFullScreen,
    },
  },
}
