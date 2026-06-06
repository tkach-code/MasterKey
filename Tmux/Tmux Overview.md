# Tmux Overview

Tmux (terminal multiplexer) lets you run multiple terminal sessions inside a single window, detach from them, and reattach later — even after disconnecting from SSH.

## Why Tmux?

- **Persistence** — sessions survive disconnection; pick up exactly where you left off
- **Multiplexing** — split one terminal into many panes and windows
- **Remote work** — essential for long-running tasks over SSH
- **Collaboration** — multiple users can attach to the same session

## Core Hierarchy

```
Server
└── Session (named workspace)
    └── Window (like a browser tab)
        └── Pane (split region with a shell)
```

A server runs in the background. Every session, window, and pane lives inside it.

## Installation

```bash
# Debian / Ubuntu / Raspberry Pi OS
sudo apt install tmux

# macOS (Homebrew)
brew install tmux

# Verify
tmux -V
```

## The Prefix Key

Almost every Tmux shortcut starts with the **prefix key**: `Ctrl-b` by default.

```
Ctrl-b  →  release  →  type command key
```

For example: `Ctrl-b c` creates a new window.

> The prefix can be rebound to `Ctrl-a` in `.tmux.conf` — a common choice.

## Quick Start

```bash
# Start a new named session
tmux new -s work

# Detach from session (leave it running)
Ctrl-b d

# List sessions
tmux ls

# Reattach
tmux attach -t work
```

## Learning Path

1. [[Tmux Sessions]] — create, attach, and manage sessions
2. [[Tmux Windows]] — tabs inside a session
3. [[Tmux Panes]] — split screens inside a window
4. [[Tmux Key Bindings]] — full shortcut reference
5. [[Tmux Copy Mode]] — scroll and copy terminal output
6. [[Tmux Configuration]] — customize `.tmux.conf`
7. [[Tmux Plugins]] — extend with TPM
8. [[Tmux Advanced Techniques]] — scripting and automation

## Related

- [[Home]]

#tmux #beginner
