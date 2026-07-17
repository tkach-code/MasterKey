# WezTerm Overview

WezTerm is a GPU-accelerated, cross-platform terminal emulator and multiplexer written in Rust. It's configured entirely through a Lua file, ships with sane defaults, and works the same way on Windows, macOS, and Linux.

## Why WezTerm?

- **Cross-platform** — identical config and behavior on Windows, macOS, Linux
- **GPU-accelerated rendering** — fast even with large scrollback and ligature-heavy fonts
- **Lua configuration** — full scripting power, not just key-value options
- **Built-in multiplexing** — panes, tabs, and workspaces without needing Tmux
- **Ligatures, true color, image/Sixel support** — modern terminal features out of the box

## Installation

```powershell
# Windows (winget)
winget install wez.wezterm

# Windows (Scoop)
scoop install wezterm

# macOS (Homebrew)
brew install --cask wezterm

# Linux (see https://wezterm.org/installation.html for distro-specific repos)
```

```powershell
# Verify
wezterm --version
```

## Config File Location

| OS | Path |
|----|------|
| Windows | `%USERPROFILE%\.wezterm.lua` |
| macOS / Linux | `~/.wezterm.lua` or `~/.config/wezterm/wezterm.lua` |

WezTerm watches this file and **hot-reloads automatically on save** — no restart needed.

## Minimal Config to Get Started

```lua
-- ~/.wezterm.lua
local wezterm = require 'wezterm'

return {
  font_size = 12,
  color_scheme = "Tokyo Night",
}
```

## Learning Path

1. [[WezTerm Configuration]] — the `.wezterm.lua` file, structure, and reload behavior
2. [[WezTerm Key Bindings]] — default shortcuts and how to remap them
3. [[WezTerm Panes and Tabs]] — splitting and navigating the window
4. [[WezTerm Color Schemes and Appearance]] — fonts, themes, opacity, padding
5. [[WezTerm Multiplexing and Workspaces]] — domains, workspaces, SSH, and Tmux comparison
6. [[WezTerm Tips and Workflows]] — quick select, search mode, launcher, shell integration

## Related

- [[Tmux Overview]] - terminal multiplexing concepts that carry over
- [[Shell Basics]] - the shell WezTerm hosts
- [[Overview\|Chocolatey Overview]] - install WezTerm with `choco install wezterm`
- [[Home]]

#wezterm #beginner
