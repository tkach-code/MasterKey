# Tmux Plugins

TPM (Tmux Plugin Manager) manages plugins the same way vim-plug manages Vim plugins.

## Installing TPM

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Add to the **bottom** of `~/.tmux.conf`:

```bash
# Plugin list
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Initialize TPM (keep at bottom)
run '~/.tmux/plugins/tpm/tpm'
```

Reload config, then press `Ctrl-b I` to install plugins.

## TPM Key Bindings

| Command | Description |
|---------|-------------|
| `Ctrl-b I` | Install new plugins |
| `Ctrl-b U` | Update all plugins |
| `Ctrl-b Alt-u` | Remove unlisted plugins |

## Essential Plugins

### tmux-sensible
Sane defaults everyone agrees on.

```bash
set -g @plugin 'tmux-plugins/tmux-sensible'
```

Provides: faster Escape, extended scrollback, `utf-8` settings, common key bindings.

---

### tmux-resurrect
Save and restore sessions after reboot.

```bash
set -g @plugin 'tmux-plugins/tmux-resurrect'
```

| Key | Action |
|-----|--------|
| `Ctrl-b Ctrl-s` | Save session |
| `Ctrl-b Ctrl-r` | Restore session |

---

### tmux-continuum
Automatically save sessions every 15 minutes and restore on Tmux start.

```bash
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @continuum-restore 'on'          # Auto-restore on server start
set -g @continuum-save-interval '15'    # Save every 15 minutes
```

Works together with `tmux-resurrect`.

---

### tmux-yank
Copy to system clipboard from copy mode.

```bash
set -g @plugin 'tmux-plugins/tmux-yank'
```

In copy mode (vi keys): press `y` to copy to clipboard, `Y` to copy the current command.

---

### tmux-open
Open files and URLs directly from copy mode.

```bash
set -g @plugin 'tmux-plugins/tmux-open'
```

In copy mode: press `o` to open in default app, `Ctrl-o` to open in `$EDITOR`.

---

### tmux-fzf
Fuzzy-find sessions, windows, panes, and commands.

```bash
set -g @plugin 'sainnhe/tmux-fzf'
```

Trigger with `Ctrl-b F` (capital F).

## Full Example Config with Plugins

```bash
# ~/.tmux.conf (plugins section)
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-open'

set -g @continuum-restore 'on'

run '~/.tmux/plugins/tpm/tpm'
```

## Exercises

1. Install TPM and add `tmux-sensible`. Reload and press `Ctrl-b I`.
2. Install `tmux-resurrect`, save a session with `Ctrl-b Ctrl-s`, kill the server, and restore with `Ctrl-b Ctrl-r`.
3. Install `tmux-yank` and copy a command from terminal history to your system clipboard.

## Related

- [[Tmux Configuration]] - Where plugins are loaded
- [[Tmux Copy Mode]] - Plugin-enhanced copy workflow
- [[Home]]

#tmux #intermediate
