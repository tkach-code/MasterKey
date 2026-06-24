# WezTerm Multiplexing and Workspaces

Beyond panes and tabs in a single window, WezTerm has two more multiplexing layers: **workspaces** (grouping tabs by project/context) and **domains** (local, SSH, or WezTerm-mux connections that panes can live in).

## Workspaces

A workspace is a named collection of windows/tabs — useful for separating contexts like "work" and "personal" without closing anything.

| Action | Default-ish key |
|--------|------------------|
| Show workspace switcher | `Ctrl-Shift-9` (varies) — or bind explicitly, see below |

```lua
local act = wezterm.action

keys = {
  { key = "w", mods = "CTRL|SHIFT|ALT", action = act.ShowLauncherArgs{ flags = "FUZZY|WORKSPACES" } },
}
```

```lua
-- Switch to (creating if needed) a named workspace
act.SwitchToWorkspace{ name = "work" }

-- Rename current workspace
act.RenameWorkspace
```

## Domains

A **domain** is where a pane's process actually runs:

| Domain type | Use case |
|-------------|----------|
| `local` | Normal panes on this machine (the default) |
| SSH domain | Spawn panes directly into a remote host over SSH |
| WezTerm mux (`unix`/TLS) | Reconnect to a persistent multiplexer server — survives the GUI closing |

### SSH Domains

```lua
return {
  ssh_domains = {
    {
      name = "mybox",
      remote_address = "myserver.example.com",
      username = "andrii",
    },
  },
}
```

```lua
-- Connect via the command palette / launcher, or bind a key:
{ key = "s", mods = "CTRL|SHIFT|ALT", action = wezterm.action.AttachDomain("mybox") }
```

### Multiplexer (mux) Domains — Persistent Sessions

Running `wezterm-mux-server` (or `wezterm cli` against a unix domain) lets panes **survive closing the GUI window**, similar to Tmux detach/reattach:

```lua
return {
  unix_domains = {
    { name = "unix" },
  },

  -- Automatically connect to it and spawn a tab there at startup
  default_gui_startup_args = { "connect", "unix" },
}
```

```bash
# Start the mux server standalone (e.g. on a remote box or in the background)
wezterm-mux-server --daemonize
```

## WezTerm vs. Tmux — When to Use Which

| Need | Best tool |
|------|-----------|
| Fast local panes/tabs with GPU rendering, fonts, true color | WezTerm native multiplexing |
| Detach/reattach a session that survives SSH disconnects on a **remote** machine | Tmux (running on that remote machine) |
| Reconnect to local panes after closing the WezTerm GUI | WezTerm mux domain |
| Scriptable session layouts, plugins, status bar ecosystem | Tmux |

They're complementary, not exclusive: many people run Tmux *inside* a WezTerm pane on remote servers, while using WezTerm's own panes/tabs/workspaces for everything local.

## CLI Control

```bash
wezterm cli list                      # list panes across windows/tabs
wezterm cli split-pane --right        # split from a script
wezterm cli send-text "echo hi" --pane-id 3
```

This makes WezTerm scriptable from outside the GUI too — useful for startup scripts that lay out a project's panes automatically.

## Exercises

1. Create a second workspace named `personal`, switch to it, open a tab, then switch back to `default`.
2. Configure an `ssh_domains` entry for a host you can reach and connect to it from the launcher.
3. Run `wezterm cli list` and identify the pane IDs of your currently open panes.

## Related

- [[WezTerm Panes and Tabs]] - the local multiplexing layer this builds on
- [[Tmux Sessions]] - persistent remote sessions, the classic approach
- [[WezTerm Tips and Workflows]] - launcher and fuzzy-finder usage
- [[Home]]

#wezterm #advanced
