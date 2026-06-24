# WezTerm Key Bindings

WezTerm ships with a large set of default key bindings (tabs, panes, copy mode, font size) and lets you add or override any of them in the `keys` table of `.wezterm.lua`.

## Default Bindings (selected highlights)

| Shortcut                        | Action                                |
| ------------------------------- | ------------------------------------- |
| `Ctrl-Shift-N`                  | New window                            |
| `Ctrl-Shift-T`                  | New tab                               |
| `Ctrl-Shift-W`                  | Close current tab                     |
| `Ctrl-Tab` / `Ctrl-Shift-Tab`   | Next / previous tab                   |
| `Alt-1`…`Alt-9`                 | Jump to tab by number                 |
| `Ctrl-Shift-Alt-←/→`            | Split pane vertically / horizontally* |
| `Ctrl-Shift-←↑→↓`               | Move focus between panes              |
| `Ctrl-Shift-Z`                  | Toggle pane zoom                      |
| `Ctrl-Shift-X`                  | Activate copy mode                    |
| `Ctrl-Shift-Space`              | Activate quick select mode            |
| `Ctrl-Shift-R`                  | Reload configuration                  |
| `Ctrl-Shift-L`                  | Show debug overlay                    |
| `Ctrl-Shift-=` / `Ctrl-Shift--` | Increase / decrease font size         |
| `Ctrl-Shift-0`                  | Reset font size                       |
| `Ctrl-Shift-F`                  | Search scrollback                     |
| `Ctrl-Shift-V` / `Ctrl-Shift-C` | Paste / Copy                          |

\* Default split bindings vary by platform; many users override them (see below).

> Run `wezterm show-keys` (or check the debug overlay) for the complete, version-accurate list — defaults change between releases.

## Overriding and Adding Keys

The `keys` table entries take `key`, `mods`, and `action`:

```lua
local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    -- Already in this vault's config: Alt+Enter toggles fullscreen
    { key = "Enter", mods = "ALT", action = act.ToggleFullScreen },

    -- Intuitive splits (like Tmux's | and -)
    { key = "|", mods = "CTRL|SHIFT", action = act.SplitHorizontal{ domain = "CurrentPaneDomain" } },
    { key = "-", mods = "CTRL|SHIFT", action = act.SplitVertical{ domain = "CurrentPaneDomain" } },

    -- Vim-style pane navigation
    { key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },

    -- Close pane without confirmation prompt
    { key = "w", mods = "CTRL|SHIFT", action = act.CloseCurrentPane{ confirm = false } },
  },
}
```

## Disabling a Default Binding

Set `disable_default_key_bindings = true` to start from a blank slate, or unbind a single key by mapping it to `act.DisableDefaultAssignment`:

```lua
keys = {
  { key = "Enter", mods = "ALT", action = wezterm.action.DisableDefaultAssignment },
}
```

## Leader Key (Tmux-style prefix)

WezTerm supports a "leader" modifier so you can build Tmux-like prefix sequences:

```lua
return {
  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    -- Ctrl-a then c → new tab
    { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    -- Ctrl-a then | → split horizontal
    { key = "|", mods = "LEADER", action = wezterm.action.SplitHorizontal{ domain = "CurrentPaneDomain" } },
  },
}
```

## Common `mods` Values

| Value | Meaning |
|-------|---------|
| `CTRL` | Control |
| `SHIFT` | Shift |
| `ALT` | Alt / Option |
| `SUPER` | Windows key / Cmd |
| `LEADER` | The configured leader key |
| `CTRL\|SHIFT` | Combine with `\|` |

## Viewing Bindings

```bash
wezterm show-keys
```

## Exercises

1. Add the Vim-style pane navigation bindings (`Ctrl-Shift-h/j/k/l`) and verify they move focus.
2. Set up a `leader` key and bind `LEADER c` to open a new tab.
3. Run `wezterm show-keys` and compare it against the table above for your installed version.

## Related

- [[WezTerm Configuration]] - where the `keys` table lives
- [[WezTerm Panes and Tabs]] - actions these bindings control
- [[Tmux Key Bindings]] - the prefix-key equivalent in Tmux
- [[Home]]

#wezterm #intermediate
