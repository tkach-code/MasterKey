# Tmux Panes

Panes are split regions within a window, each running its own shell. Use them to view multiple things simultaneously — editor + terminal, logs + shell, etc.

## Splitting

| Command | Description |
|---------|-------------|
| `Ctrl-b %` | Split vertically (side by side) |
| `Ctrl-b "` | Split horizontally (top and bottom) |

```bash
# Split from command line
tmux split-window -h      # horizontal split (side by side)
tmux split-window -v      # vertical split (top/bottom)
tmux split-window -h -c "#{pane_current_path}"  # split in same directory
```

> Memory aid: `%` looks like two side-by-side circles → vertical split. `"` looks like two lines stacked → horizontal split.

## Navigating Between Panes

| Command | Description |
|---------|-------------|
| `Ctrl-b ←↑→↓` | Move to pane in that direction |
| `Ctrl-b o` | Cycle to next pane |
| `Ctrl-b ;` | Toggle to last active pane |
| `Ctrl-b q` | Show pane numbers, press number to jump |

## Resizing Panes

| Command | Description |
|---------|-------------|
| `Ctrl-b Ctrl-←↑→↓` | Resize by 1 cell |
| `Ctrl-b Alt-←↑→↓` | Resize by 5 cells |
| `Ctrl-b :resize-pane -D 10` | Resize down 10 lines |
| `Ctrl-b z` | Toggle pane zoom (full screen) |

## Swapping and Moving Panes

| Command | Description |
|---------|-------------|
| `Ctrl-b {` | Swap with previous pane |
| `Ctrl-b }` | Swap with next pane |
| `Ctrl-b !` | Break pane out into its own window |
| `Ctrl-b :join-pane -s 2` | Pull window 2 into a pane here |

## Layouts

Tmux has five built-in layouts you can cycle through:

| Command | Layout |
|---------|--------|
| `Ctrl-b Alt-1` | even-horizontal |
| `Ctrl-b Alt-2` | even-vertical |
| `Ctrl-b Alt-3` | main-horizontal |
| `Ctrl-b Alt-4` | main-vertical |
| `Ctrl-b Alt-5` | tiled |
| `Ctrl-b Space` | Cycle through layouts |

## Closing Panes

| Command | Description |
|---------|-------------|
| `Ctrl-b x` | Kill current pane (prompts) |
| `exit` | Close the shell, pane closes automatically |
| `Ctrl-d` | EOF — closes shell and pane |

## Synchronizing Panes

Type the same command in all panes simultaneously:

```bash
# Enable sync
Ctrl-b :setw synchronize-panes on

# Disable sync
Ctrl-b :setw synchronize-panes off
```

Useful for running the same command on multiple servers at once.

## Exercises

1. Create a window with four panes in a 2×2 grid using splits.
2. Navigate between all four panes using only arrow keys.
3. Zoom into one pane with `Ctrl-b z`, then unzoom.
4. Resize a pane to take up roughly two-thirds of the window.
5. Break a pane out into its own window with `Ctrl-b !`.

## Related

- [[Tmux Windows]] - Windows that contain panes
- [[Tmux Key Bindings]] - Full shortcut reference
- [[Tmux Configuration]] - Custom pane borders and colors
- [[Home]]

#tmux #beginner
