# Tmux Windows

Windows are like browser tabs inside a session. Each window has its own layout of panes and appears in the status bar at the bottom.

## Creating Windows

| Command    | Description                        |
| ---------- | ---------------------------------- |
| `Ctrl-b c` | Create a new window                |
| `Ctrl-b C` | Create a new window (some configs) |

```bash
# Create named window from command line
tmux new-window -n logs
```

## Navigating Windows

| Command | Description |
|---------|-------------|
| `Ctrl-b n` | Next window |
| `Ctrl-b p` | Previous window |
| `Ctrl-b l` | Last (most recently used) window |
| `Ctrl-b 0`–`9` | Jump to window by number |
| `Ctrl-b '` | Prompt for window index |
| `Ctrl-b w` | Interactive window chooser |
| `Ctrl-b f` | Find window by name (search) |

## Renaming Windows

| Command | Description |
|---------|-------------|
| `Ctrl-b ,` | Rename current window |

> Tip: name windows after what's running in them (`editor`, `server`, `logs`).

## Closing Windows

| Command | Description |
|---------|-------------|
| `Ctrl-b &` | Kill current window (prompts) |
| `exit` | Close the shell, window closes automatically |

```bash
# Kill a specific window
tmux kill-window -t mysession:1
```

## Moving and Swapping Windows

| Command | Description |
|---------|-------------|
| `Ctrl-b .` | Move window to a new index (prompts) |
| `Ctrl-b :swap-window -s 2 -t 1` | Swap windows 2 and 1 |

```bash
# Move current window to index 3
tmux move-window -t 3

# Reorder all windows to fill gaps
tmux move-window -r
```

## The Status Bar

The bottom status bar shows all windows in the current session:

```
[session-name]  0:bash  1:editor* 2:logs-
                                  ^       ^
                         * = active   - = last used
```

You can customize colors and content in [[Tmux Configuration]].

## Exercises

1. Create a session with three windows named `editor`, `server`, and `logs`.
2. Navigate between them using number shortcuts (`Ctrl-b 0`, `Ctrl-b 1`, `Ctrl-b 2`).
3. Move the `logs` window to index 0.
4. Kill the `server` window and confirm the others remain.

## Related

- [[Tmux Sessions]] - Sessions that contain windows
- [[Tmux Panes]] - Splits inside a window
- [[Tmux Configuration]] - Status bar customization
- [[Home]]

#tmux #beginner
