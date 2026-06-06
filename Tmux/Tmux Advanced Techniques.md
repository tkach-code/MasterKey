# Tmux Advanced Techniques

Scripting, automation, and power-user patterns for heavy Tmux users.

## Scripting Sessions

Create reproducible workspace layouts with shell scripts:

```bash
#!/usr/bin/env bash
# start-dev.sh — launch a full dev environment

SESSION="dev"

# Don't create a duplicate session
tmux has-session -t $SESSION 2>/dev/null && tmux attach -t $SESSION && exit

tmux new-session -d -s $SESSION -n editor -c ~/projects/myapp

# Window 1: editor
tmux send-keys -t $SESSION:1 "vim ." Enter

# Window 2: server
tmux new-window -t $SESSION -n server -c ~/projects/myapp
tmux send-keys -t $SESSION:2 "npm run dev" Enter

# Window 3: two panes — shell + logs
tmux new-window -t $SESSION -n ops -c ~/projects/myapp
tmux split-window -t $SESSION:3 -h
tmux send-keys -t $SESSION:3.2 "tail -f logs/app.log" Enter

tmux select-window -t $SESSION:1
tmux attach -t $SESSION
```

```bash
chmod +x start-dev.sh
./start-dev.sh
```

## send-keys

Run commands in panes non-interactively:

```bash
# Send a command to a specific pane
tmux send-keys -t mysession:window.pane "ls -la" Enter

# Send to all panes in a window
tmux list-panes -t mysession:1 -F '#P' | \
  xargs -I{} tmux send-keys -t "mysession:1.{}" "uptime" Enter
```

## Named Pane Layouts

Save and reuse a custom layout:

```bash
# Get the current layout string
tmux display-message -p "#{window_layout}"
# e.g.: 178x47,0,0[178x23,0,0,0,178x23,0,24,1]

# Apply a saved layout
tmux select-layout "178x47,0,0[178x23,0,0,0,178x23,0,24,1]"
```

## Hooks

Run commands automatically on Tmux events:

```bash
# Auto-rename window to the running command
set-hook -g window-linked "run-shell 'tmux rename-window #{pane_current_command}'"

# Notify when a long-running command finishes (pane exits)
set-hook -g pane-exited "run-shell 'notify-send Tmux \"Pane finished in #{session_name}\"'"
```

Common hooks: `session-created`, `session-closed`, `window-linked`, `pane-exited`, `client-attached`.

## Conditional Config

```bash
# Apply settings only in nested Tmux (SSH inside Tmux)
if-shell '[ -n "$SSH_CLIENT" ]' \
  'set -g status-style "bg=colour124,fg=white"'

# Different config per host
if-shell "[ $(hostname) = 'myserver' ]" \
  'source-file ~/.tmux.server.conf'
```

## Nested Tmux (SSH workflows)

When SSHing into a remote machine that also runs Tmux, you need a way to send prefix to the inner session:

```bash
# Press prefix twice to send it to the inner session
# This works automatically — Ctrl-b Ctrl-b reaches the inner session

# Alternatively bind F12 to toggle the outer prefix off
bind -T root F12 \
  set prefix None \;\
  set key-table off \;\
  set status-style "bg=colour245,fg=black" \;\
  refresh-client -S
```

## Tmux + Vim Integration

Navigate seamlessly between Vim splits and Tmux panes with the same keys.

Add to `.tmux.conf`:

```bash
# Smart pane switching — works with vim-tmux-navigator plugin
is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE 'vim|nvim'"
bind-key -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind-key -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind-key -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind-key -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
```

Also install the `vim-tmux-navigator` Vim plugin to complete the bridge.

## Useful One-Liners

```bash
# Kill all sessions with a name matching a pattern
tmux ls | grep '^test' | cut -d: -f1 | xargs -I{} tmux kill-session -t {}

# Run a command in every pane of every window in a session
for w in $(tmux list-windows -t mysession -F '#I'); do
  for p in $(tmux list-panes -t "mysession:$w" -F '#P'); do
    tmux send-keys -t "mysession:$w.$p" "uptime" Enter
  done
done

# Capture pane content to a file
tmux capture-pane -t mysession:1.0 -p > pane-output.txt
```

## Exercises

1. Write a `start-dev.sh` script that creates a three-window session for a project you work on.
2. Use `tmux send-keys` to run `ls` in a pane without switching to it.
3. Set up a hook that changes the status bar color when SSH is detected.
4. Capture a pane's content to a file using `tmux capture-pane`.

## Related

- [[Tmux Configuration]] - Hooks and conditional config
- [[Tmux Sessions]] - Sessions used in scripts
- [[Tmux Plugins]] - tmux-resurrect for session persistence
- [[Vim Configuration]] - Vim-side of Tmux+Vim integration
- [[Home]]

#tmux #advanced
