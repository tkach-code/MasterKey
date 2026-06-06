# Tmux Sessions

A session is a persistent workspace managed by the Tmux server. Detaching leaves it running; reattaching brings it back exactly as you left it.

## Creating Sessions

```bash
# New session (auto-named: 0, 1, 2…)
tmux

# New session with a name
tmux new -s mysession
tmux new-session -s mysession

# New session, start in a directory
tmux new -s work -c ~/projects/myapp

# New session without attaching
tmux new -s background -d
```

## Listing Sessions

```bash
# In terminal
tmux ls
tmux list-sessions

# Inside Tmux
Ctrl-b s        # interactive session chooser
```

## Attaching

```bash
# Attach to most recent session
tmux attach
tmux a

# Attach to named session
tmux attach -t mysession
tmux a -t mysession

# Attach and detach any other client first
tmux attach -t mysession -d
```

## Detaching

| Shortcut | Description |
|----------|-------------|
| `Ctrl-b d` | Detach from current session |
| `Ctrl-b D` | Choose which client to detach |

```bash
# Detach from outside
tmux detach -t mysession
```

## Renaming and Switching

| Command | Description |
|---------|-------------|
| `Ctrl-b $` | Rename current session |
| `Ctrl-b s` | Switch between sessions (interactive) |
| `Ctrl-b (` | Switch to previous session |
| `Ctrl-b )` | Switch to next session |

## Killing Sessions

```bash
# Kill named session
tmux kill-session -t mysession

# Kill all sessions except current
tmux kill-session -a

# Kill the Tmux server (all sessions)
tmux kill-server
```

| Shortcut | Description |
|----------|-------------|
| `Ctrl-b :kill-session` | Kill current session from inside Tmux |

## Exercises

1. Start a session named `practice`, detach, then reattach to it.
2. Create three sessions: `dev`, `logs`, `ssh`. Switch between them with `Ctrl-b s`.
3. Rename the `dev` session to `backend` without killing it.
4. Kill only the `logs` session while leaving the others running.

## Related

- [[Tmux Overview]] - Core concepts
- [[Tmux Windows]] - Windows inside a session
- [[Home]]

#tmux #beginner
