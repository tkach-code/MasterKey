# WezTerm Panes and Tabs

WezTerm has built-in multiplexing — panes (split regions) and tabs (like browser tabs) — without needing Tmux, though the two can also be combined.

## Hierarchy

```
Window
└── Tab
    └── Pane (split region with a shell)
```

A window can hold multiple tabs; each tab can be split into multiple panes.

## Tabs

| Shortcut | Action |
|----------|--------|
| `Ctrl-Shift-T` | New tab |
| `Ctrl-Shift-W` | Close current tab |
| `Ctrl-Tab` | Next tab |
| `Ctrl-Shift-Tab` | Previous tab |
| `Alt-1`…`Alt-9` | Jump to tab N |
| Double-click tab bar | Rename tab |

```lua
-- Hide the tab bar entirely when there's only one tab
hide_tab_bar_if_only_one_tab = true,

-- Use the classic flat tab bar instead of the fancy GPU-styled one
use_fancy_tab_bar = false,
```

## Panes

Split the current pane vertically or horizontally, then navigate and resize with the keyboard.

| Action | Default-ish shortcut* |
|--------|------------------------|
| Split horizontal | `Ctrl-Shift-Alt-"` |
| Split vertical | `Ctrl-Shift-Alt-%` |
| Move focus | `Ctrl-Shift-←↑→↓` |
| Zoom/unzoom pane | `Ctrl-Shift-Z` |
| Close pane | `Ctrl-Shift-W` (closes tab) / custom binding for pane-only close |

\* Defaults vary by platform and version — most users remap these (see [[WezTerm Key Bindings]]).

### Custom Split Bindings

```lua
local act = wezterm.action

keys = {
  { key = "|", mods = "CTRL|SHIFT", action = act.SplitHorizontal{ domain = "CurrentPaneDomain" } },
  { key = "-", mods = "CTRL|SHIFT", action = act.SplitVertical{ domain = "CurrentPaneDomain" } },
  { key = "z", mods = "CTRL|SHIFT", action = act.TogglePaneZoomState },
  { key = "x", mods = "CTRL|SHIFT", action = act.CloseCurrentPane{ confirm = false } },
}
```

### Resizing Panes

```lua
keys = {
  { key = "LeftArrow",  mods = "CTRL|SHIFT|ALT", action = act.AdjustPaneSize{ "Left", 5 } },
  { key = "RightArrow", mods = "CTRL|SHIFT|ALT", action = act.AdjustPaneSize{ "Right", 5 } },
  { key = "UpArrow",    mods = "CTRL|SHIFT|ALT", action = act.AdjustPaneSize{ "Up", 5 } },
  { key = "DownArrow",  mods = "CTRL|SHIFT|ALT", action = act.AdjustPaneSize{ "Down", 5 } },
}
```

## Dimming Inactive Panes

```lua
inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
},
```

This makes it easy to spot which pane has focus — already set in this vault's config.

## Panes vs. Tmux Panes

Both follow the same window → tab/window → pane hierarchy, but WezTerm's panes are native (no extra process) and respect the GUI's GPU rendering, fonts, and color scheme directly — no `default-terminal` / `tmux-256color` color quirks to fight with. See [[WezTerm Multiplexing and Workspaces]] for when Tmux still adds value (session persistence, remote attach/detach) on top of WezTerm.

## Exercises

1. Split your current pane both horizontally and vertically and navigate between the three resulting panes with the keyboard.
2. Zoom a pane, confirm it temporarily fills the tab, then unzoom.
3. Add the resize-pane bindings above and resize a pane without using the mouse.

## Related

- [[WezTerm Key Bindings]] - bindings that drive these actions
- [[WezTerm Multiplexing and Workspaces]] - domains, workspaces, and Tmux comparison
- [[Tmux Panes]] - the Tmux equivalent
- [[Home]]

#wezterm #intermediate
