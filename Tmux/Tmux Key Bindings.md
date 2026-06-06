# Tmux Key Bindings

All shortcuts use the prefix key (`Ctrl-b` by default) followed by the command key. This is a full reference — see individual notes for context and examples.

## Sessions

| Command | Description |
|---------|-------------|
| `Ctrl-b d` | Detach from session |
| `Ctrl-b D` | Choose client to detach |
| `Ctrl-b s` | Interactive session switcher |
| `Ctrl-b (` | Previous session |
| `Ctrl-b )` | Next session |
| `Ctrl-b $` | Rename current session |
| `Ctrl-b :new-session` | Create new session |

## Windows

| Command | Description |
|---------|-------------|
| `Ctrl-b c` | New window |
| `Ctrl-b n` | Next window |
| `Ctrl-b p` | Previous window |
| `Ctrl-b l` | Last used window |
| `Ctrl-b 0`–`9` | Go to window by number |
| `Ctrl-b '` | Prompt for window number |
| `Ctrl-b w` | Interactive window chooser |
| `Ctrl-b f` | Find window by name |
| `Ctrl-b ,` | Rename current window |
| `Ctrl-b &` | Kill current window |
| `Ctrl-b .` | Move window to index |

## Panes

| Command | Description |
|---------|-------------|
| `Ctrl-b %` | Split vertically |
| `Ctrl-b "` | Split horizontally |
| `Ctrl-b ←↑→↓` | Navigate to pane |
| `Ctrl-b o` | Next pane |
| `Ctrl-b ;` | Last active pane |
| `Ctrl-b q` | Show pane numbers |
| `Ctrl-b z` | Toggle zoom |
| `Ctrl-b {` | Swap with previous pane |
| `Ctrl-b }` | Swap with next pane |
| `Ctrl-b !` | Break pane into new window |
| `Ctrl-b x` | Kill current pane |
| `Ctrl-b Space` | Cycle layouts |
| `Ctrl-b Ctrl-←↑→↓` | Resize pane by 1 |
| `Ctrl-b Alt-←↑→↓` | Resize pane by 5 |

## Copy Mode

| Command | Description |
|---------|-------------|
| `Ctrl-b [` | Enter copy mode |
| `Ctrl-b ]` | Paste from buffer |
| `Ctrl-b =` | Choose paste buffer |
| `Ctrl-b PgUp` | Enter copy mode and scroll up |

## Miscellaneous

| Command | Description |
|---------|-------------|
| `Ctrl-b ?` | Show all key bindings |
| `Ctrl-b :` | Open command prompt |
| `Ctrl-b t` | Show clock in current pane |
| `Ctrl-b ~` | Show last messages from Tmux |
| `Ctrl-b i` | Show pane info |
| `Ctrl-b r` | Reload config (if mapped in `.tmux.conf`) |

## Command Prompt

Press `Ctrl-b :` to enter the command prompt. Useful commands:

```
:new-session -s name
:kill-session -t name
:rename-session newname
:rename-window newname
:split-window -h
:resize-pane -D 5
:setw synchronize-panes on
:source-file ~/.tmux.conf
:list-keys
```

## Viewing All Bindings

```bash
# Inside Tmux
Ctrl-b ?

# From terminal
tmux list-keys
```

## Related

- [[Tmux Sessions]] - Session commands in context
- [[Tmux Windows]] - Window commands in context
- [[Tmux Panes]] - Pane commands in context
- [[Tmux Copy Mode]] - Copy mode shortcuts
- [[Tmux Configuration]] - Rebinding keys
- [[Home]]

#tmux #intermediate
