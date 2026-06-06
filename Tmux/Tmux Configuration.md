# Tmux Configuration

Tmux is configured in `~/.tmux.conf`. Changes take effect after reloading the config or starting a new session.

## Reloading Config

```bash
# From inside Tmux
Ctrl-b :source-file ~/.tmux.conf

# Add a shortcut to reload
bind r source-file ~/.tmux.conf \; display "Config reloaded"
```

## Minimal Sensible Config

```bash
# ~/.tmux.conf

# --- Prefix key ---
# Remap prefix from Ctrl-b to Ctrl-a (screen-style)
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# --- General ---
set -g history-limit 10000          # Scrollback lines
set -g base-index 1                 # Windows start at 1 (easier keyboard reach)
setw -g pane-base-index 1           # Panes start at 1
set -g renumber-windows on          # Renumber on window close
set -g mouse on                     # Enable mouse support
set -s escape-time 0                # No delay for Escape key

# --- Vi mode ---
setw -g mode-keys vi                # Use vi keys in copy mode

# --- Reload shortcut ---
bind r source-file ~/.tmux.conf \; display "Reloaded!"

# --- Intuitive splits ---
bind | split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"
unbind '"'
unbind %

# --- Vim-style pane navigation ---
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
```

## Status Bar

```bash
# --- Status bar ---
set -g status-position bottom
set -g status-interval 5            # Refresh every 5 seconds
set -g status-left-length 30
set -g status-right-length 60

set -g status-style "bg=colour235,fg=colour136"
set -g status-left "#[fg=green][#S] "
set -g status-right "#[fg=yellow]%Y-%m-%d %H:%M"

# Window list colors
setw -g window-status-style "fg=colour244"
setw -g window-status-current-style "fg=colour166,bold"
```

## Pane Borders

```bash
set -g pane-border-style "fg=colour238"
set -g pane-active-border-style "fg=colour51"
```

## Copy Mode (Vi)

```bash
# Vi copy mode bindings
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
bind-key -T copy-mode-vi r send-keys -X rectangle-toggle

# Linux clipboard
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -in"
```

## Mouse Support

```bash
set -g mouse on
```

With mouse on you can: click to select panes/windows, drag to resize panes, and scroll to enter copy mode automatically.

## Useful Options Reference

| Option | Effect |
|--------|--------|
| `set -g mouse on` | Enable mouse |
| `set -g history-limit 50000` | Scrollback buffer size |
| `set -g base-index 1` | Start window numbering at 1 |
| `set -g renumber-windows on` | Auto-renumber on close |
| `set -s escape-time 0` | Instant Escape key response |
| `setw -g mode-keys vi` | Vi keys in copy mode |
| `set -g status-interval 5` | Status bar refresh rate |
| `set -g default-terminal "tmux-256color"` | 256-color support |

## True Color (if needed)

```bash
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"
```

## Exercises

1. Create `~/.tmux.conf` with the minimal config above and reload it.
2. Remap the prefix to `Ctrl-a` and verify it works.
3. Add the intuitive split bindings (`|` and `-`) and test them.
4. Customize your status bar to show the session name and current time.

## Related

- [[Tmux Key Bindings]] - Default shortcuts to remap
- [[Tmux Copy Mode]] - Vi copy mode bindings
- [[Tmux Plugins]] - TPM plugin manager
- [[Home]]

#tmux #intermediate
