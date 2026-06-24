# WezTerm Color Schemes and Appearance

WezTerm bundles hundreds of built-in color schemes and gives fine-grained control over fonts, transparency, padding, and window chrome — all via Lua.

## Color Schemes

```lua
return {
  color_scheme = "Tokyo Night",
}
```

```bash
# List every built-in scheme name
wezterm color-schemes

# Preview schemes interactively
wezterm color-schemes --preview
```

Popular choices: `Tokyo Night`, `Catppuccin Mocha`, `Dracula`, `Gruvbox Dark`, `Nord`, `OneDark`.

### Custom / Inline Colors

```lua
return {
  colors = {
    foreground = "#c0caf5",
    background = "#1a1b26",
    cursor_bg = "#c0caf5",
    cursor_border = "#c0caf5",
    selection_bg = "#33467c",
  },
}
```

## Fonts

```lua
local wezterm = require 'wezterm'

return {
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 12,
  line_height = 1.1,

  -- Fall back gracefully if the primary font is missing glyphs
  font_rules = {
    {
      intensity = "Bold",
      font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" }),
    },
  },
}
```

```bash
# List fonts WezTerm can see
wezterm ls-fonts
```

> Nerd Fonts add the glyphs many shell prompts (Starship, Powerlevel10k) and status bars rely on for icons.

## Window Transparency and Backdrop

```lua
return {
  window_background_opacity = 0.94,   -- 0.0 fully transparent, 1.0 opaque
  win32_system_backdrop = "Acrylic",  -- Windows 11 only: "Acrylic", "Mica", "Tabbed"
}
```

`win32_system_backdrop` is Windows-specific; on macOS, transparency + blur is achieved via `macos_window_background_blur`.

## Window Chrome and Padding

```lua
return {
  window_decorations = "RESIZE",     -- no title bar, keep resizable borders
  -- window_decorations = "NONE",     -- fully borderless
  -- window_decorations = "TITLE | RESIZE", -- default look

  window_padding = {
    left = 10,
    right = 10,
    top = 10,
    bottom = 10,
  },

  adjust_window_size_when_changing_font_size = false,
  enable_scroll_bar = true,
}
```

## Tab Bar Style

```lua
return {
  use_fancy_tab_bar = false,              -- classic flat tab bar
  hide_tab_bar_if_only_one_tab = true,    -- declutter single-tab windows
}
```

## Dimming Inactive Panes

```lua
return {
  inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
  },
}
```

## Reference Table

| Option | Purpose |
|--------|---------|
| `color_scheme` | Built-in theme name |
| `colors` | Inline color overrides |
| `font` / `font_size` | Typeface and size |
| `line_height` | Vertical line spacing |
| `window_background_opacity` | Transparency |
| `win32_system_backdrop` | Windows blur effect |
| `window_decorations` | Title bar / border behavior |
| `window_padding` | Inner content padding |
| `use_fancy_tab_bar` | Tab bar rendering style |
| `inactive_pane_hsb` | Dim unfocused panes |

## Exercises

1. Run `wezterm color-schemes --preview` and pick a scheme you like; set it in your config.
2. Install a Nerd Font and switch `font` to use it; confirm prompt icons render.
3. Try `window_decorations = "NONE"` for a fully chromeless window, then revert.

## Related

- [[WezTerm Configuration]] - where these options live
- [[WezTerm Overview]] - install and first config
- [[Obsidian Tips and Workflows]] - similar theming concerns in Obsidian
- [[Home]]

#wezterm #beginner
