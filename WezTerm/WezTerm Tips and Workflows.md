# WezTerm Tips and Workflows

Day-to-day productivity features beyond basic config: copy mode, quick select, search, the launcher, and shell/Vim integration.

## Copy Mode

Enter a Vim-like mode for navigating and selecting scrollback without the mouse.

| Action | Shortcut |
|--------|----------|
| Enter copy mode | `Ctrl-Shift-X` |
| Move | `h j k l` / arrows |
| Jump to start/end of line | `0` / `$` |
| Page up/down | `Ctrl-u` / `Ctrl-d` |
| Start selection | `v` (or `V` for line mode) |
| Copy selection & exit | `y` |
| Exit without copying | `Escape` / `q` |

## Quick Select

Highlights likely-useful tokens (URLs, hashes, paths, IPs) on screen and lets you grab one with a couple of keystrokes — no manual dragging.

| Action | Shortcut |
|--------|----------|
| Activate quick select | `Ctrl-Shift-Space` |
| Jump to a highlighted match | type its label, then `Enter` to copy |

Customize what it matches:

```lua
return {
  quick_select_patterns = {
    -- Add a pattern for matching, e.g. Jira-style ticket IDs
    "[A-Z]{2,}-\\d+",
  },
}
```

## Search Mode

```lua
-- Default: Ctrl-Shift-F opens scrollback search
```

| Action | Shortcut |
|--------|----------|
| Open search | `Ctrl-Shift-F` |
| Next/previous match | `Enter` / `Shift-Enter` |
| Toggle regex mode | depends on version — check the search bar UI |

## The Launcher (Command Palette)

A fuzzy-searchable menu for spawning tabs, switching workspaces, attaching domains, and more.

```lua
local act = wezterm.action

keys = {
  { key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
  { key = "9", mods = "CTRL|SHIFT", action = act.ShowLauncherArgs{ flags = "FUZZY|WORKSPACES|DOMAINS|TABS" } },
}
```

## Shell Integration

WezTerm can track the current working directory, command status, and "zones" (per-command output) if the shell reports it via OSC escape sequences.

```bash
# Bash/Zsh: source the official integration script
# (see https://wezterm.org/shell-integration.html for the snippet)
```

For **PowerShell** (this vault's `default_prog`), shell integration mostly comes via the prompt theme (e.g. Starship/Oh My Posh) emitting OSC 133 sequences — check your prompt's docs for a WezTerm/OSC133 flag.

With integration active:

| Action | Shortcut |
|--------|----------|
| Jump to previous/next shell prompt | `Ctrl-Shift-Z` family (mux-dependent) / scroll markers |
| `QuickSelectArgs` for command output zones | configurable |

## Hyperlinks

WezTerm auto-detects and underlines URLs; `Ctrl-click` (or plain click depending on config) opens them in the default browser. Customize detection:

```lua
return {
  hyperlink_rules = wezterm.default_hyperlink_rules(),
}
```

## Status Bar (right side)

Show custom info like the time or git branch using the `update-status` event:

```lua
wezterm.on('update-status', function(window, pane)
  window:set_right_status(wezterm.format({
    { Text = wezterm.strftime('%Y-%m-%d %H:%M') },
  }))
end)
```

## Pairing with Vim

Set `ALT-Enter` (already bound in this vault's config) to toggle fullscreen for distraction-free editing, and let WezTerm's true-color support pass through Vim's colorscheme accurately — no `t_8f`/`t_8b` true-color hacks needed in `.vimrc` since WezTerm advertises full RGB support.

## Exercises

1. Open copy mode, select a line with `V`, and copy it with `y`.
2. Trigger quick select and copy a URL or path from your scrollback using only the keyboard.
3. Add the `update-status` snippet above and confirm the clock appears in the tab bar.
4. Bind `Ctrl-Shift-P` to the command palette and use it to spawn a new tab.

## Related

- [[WezTerm Key Bindings]] - shortcuts referenced throughout this note
- [[WezTerm Multiplexing and Workspaces]] - launcher's workspace/domain integration
- [[Tmux Copy Mode]] - the Tmux equivalent of copy mode
- [[Vim Registers and Macros]] - Vim-side copy/paste this complements
- [[Home]]

#wezterm #intermediate
