# Tmux Copy Mode

Copy mode lets you scroll through terminal history, search output, and copy text — all without leaving Tmux.

## Entering and Exiting

| Command | Description |
|---------|-------------|
| `Ctrl-b [` | Enter copy mode |
| `Ctrl-b PgUp` | Enter copy mode and scroll up one page |
| `q` or `Escape` | Exit copy mode |

## Navigation in Copy Mode

By default Tmux uses Emacs-style keys. After `set-window-option -g mode-keys vi` in `.tmux.conf`, vi keys become active.

### Emacs keys (default)

| Key | Action |
|-----|--------|
| `↑` / `↓` | Scroll line by line |
| `PgUp` / `PgDn` | Scroll page by page |
| `Ctrl-u` / `Ctrl-d` | Half-page up / down |
| `g` | Jump to top |
| `G` | Jump to bottom |

### Vi keys (after `mode-keys vi`)

| Key | Action |
|-----|--------|
| `h j k l` | Move cursor |
| `Ctrl-u` / `Ctrl-d` | Half-page up / down |
| `Ctrl-b` / `Ctrl-f` | Page up / down |
| `g` | Top of history |
| `G` | Bottom |
| `w` / `b` | Word forward / back |
| `0` / `$` | Start / end of line |

## Searching

| Key | Action |
|-----|--------|
| `/pattern` | Search forward (vi mode) |
| `?pattern` | Search backward (vi mode) |
| `Ctrl-s` | Search forward (emacs mode) |
| `Ctrl-r` | Search backward (emacs mode) |
| `n` | Next match |
| `N` | Previous match |

## Copying Text

### Vi mode workflow

```
Ctrl-b [            # enter copy mode
Space               # start selection
move to end         # expand selection with motion keys
Enter               # copy selection, exit copy mode
Ctrl-b ]            # paste
```

### Emacs mode workflow

```
Ctrl-b [            # enter copy mode
Ctrl-Space          # start selection
move to end
Alt-w               # copy selection
Ctrl-b ]            # paste
```

## Paste Buffers

Tmux maintains a stack of copied text:

| Command | Description |
|---------|-------------|
| `Ctrl-b ]` | Paste top of buffer stack |
| `Ctrl-b =` | Choose buffer to paste (interactive) |

```bash
# List buffers from command line
tmux list-buffers

# Show buffer content
tmux show-buffer -b 0

# Save buffer to file
tmux save-buffer ~/clipboard.txt

# Load file into buffer
tmux load-buffer ~/clipboard.txt
```

## Integration with System Clipboard

Add to `.tmux.conf` for automatic clipboard sync:

```bash
# Linux (requires xclip or xsel)
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -in"

# macOS
bind-key -T copy-mode-vi Enter send-keys -X copy-pipe-and-cancel "pbcopy"
```

Or use the `tmux-yank` plugin from [[Tmux Plugins]] for a simpler setup.

## Scrollback History

The default scrollback is 2000 lines. Increase it in `.tmux.conf`:

```bash
set-option -g history-limit 10000
```

## Exercises

1. Run `git log --oneline` to produce output, then enter copy mode and scroll up to find an old commit hash.
2. Search for a word in the scrollback using `/` (vi mode) or `Ctrl-s` (emacs mode).
3. Copy a line of output and paste it into a new pane.
4. List your paste buffers with `tmux list-buffers`.

## Related

- [[Tmux Key Bindings]] - All shortcuts
- [[Tmux Configuration]] - Setting `mode-keys vi`
- [[Tmux Plugins]] - tmux-yank for clipboard integration
- [[Home]]

#tmux #intermediate
