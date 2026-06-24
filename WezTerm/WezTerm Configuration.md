# WezTerm Configuration

WezTerm is configured via a Lua file that returns a single config table. There's no separate plugin system for basic settings — it's all options on that table, optionally built with the fluent `wezterm.config_builder()` API.

## File Location and Reload

| OS | Path |
|----|------|
| Windows | `%USERPROFILE%\.wezterm.lua` |
| macOS / Linux | `~/.wezterm.lua` or `~/.config/wezterm/wezterm.lua` |

Config reloads **automatically on save**. To force it manually:

| Action | Shortcut |
|--------|----------|
| Reload config | `Ctrl-Shift-R` (default `ReloadConfiguration`) |
| Debug overlay (shows reload errors) | `Ctrl-Shift-L` |

## Basic Structure

```lua
local wezterm = require 'wezterm'

return {
  font_size = 12,
  color_scheme = "Tokyo Night",
}
```

The `config_builder()` form is preferred for larger configs because it warns about deprecated keys:

```lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font_size = 12
config.color_scheme = "Tokyo Night"

return config
```

## Annotated Example (this vault's actual config)

```lua
-- ~/.wezterm.lua
local wezterm = require 'wezterm'

return {
  --font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 12,

  color_scheme = "Tokyo Night",

  window_background_opacity = 0.94,      -- slight transparency
  win32_system_backdrop = "Acrylic",     -- Windows 11 blur effect behind the window

  window_decorations = "RESIZE",         -- no title bar, but keep resize borders

  --hide_tab_bar_if_only_one_tab = true,

  use_fancy_tab_bar = false,             -- retro (non-GPU-styled) tab bar

  adjust_window_size_when_changing_font_size = false,

  line_height = 1.1,

  enable_scroll_bar = true,

  default_prog = { "pwsh.exe" },         -- shell launched on startup (Windows: PowerShell 7)

  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },

  inactive_pane_hsb = {                  -- dim unfocused panes
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
```

## Commonly Tweaked Options

| Option | Effect |
|--------|--------|
| `font_size` | Base font size |
| `font` | `wezterm.font("Name")` — set typeface (needs the font installed) |
| `color_scheme` | Built-in theme name, e.g. `"Tokyo Night"`, `"Catppuccin Mocha"` |
| `window_background_opacity` | `0.0`–`1.0` window transparency |
| `window_decorations` | `"RESIZE"`, `"TITLE \| RESIZE"`, `"NONE"` |
| `use_fancy_tab_bar` | `false` for the classic flat tab bar |
| `default_prog` | Shell/program launched in new windows and tabs |
| `default_cwd` | Starting directory for new panes |
| `window_padding` | Inner padding around terminal content |
| `enable_scroll_bar` | Show/hide the scrollbar |
| `inactive_pane_hsb` | Hue/saturation/brightness applied to unfocused panes |
| `win32_system_backdrop` | Windows-only: `"Acrylic"`, `"Mica"`, `"Tabbed"` |

## Splitting Config Across Files

For larger setups, `require` additional Lua modules from the main file:

```lua
-- ~/.wezterm.lua
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

require('keys').apply(config)
require('appearance').apply(config)

return config
```

Place the modules in `~/.config/wezterm/` (added to Lua's search path automatically alongside the main config).

## Listing All Available Options

```bash
wezterm show-config
```

## Exercises

1. Copy the annotated example above into your `.wezterm.lua` and confirm it hot-reloads on save.
2. Change `color_scheme` and watch the window update without restarting.
3. Toggle `use_fancy_tab_bar` and compare the tab bar styles.
4. Split your config into a `keys.lua` module and `require` it from the main file.

## Related

- [[WezTerm Overview]] - installation and learning path
- [[WezTerm Key Bindings]] - the `keys` table in depth
- [[WezTerm Color Schemes and Appearance]] - fonts, themes, opacity
- [[Tmux Configuration]] - equivalent config workflow in Tmux
- [[Home]]

#wezterm #intermediate
