# Shell Basics

The shell is the command-line interpreter between you and the OS. Common shells: `bash` (default on most Linux), `zsh` (default on macOS), `fish`, `sh`.

## Identify Your Current Shell

| Command | What it shows |
|---------|--------------|
| `echo $SHELL` | Default login shell (set in `/etc/passwd`) |
| `echo $0` | Currently active shell in this session |
| `ps -p $$` | Process name of the running shell — most reliable |

```bash
# Example output on Raspberry Pi OS
$ echo $SHELL
/bin/bash

$ echo $0
bash

$ ps -p $$
  PID TTY          TIME CMD
 1234 pts/0    00:00:00 bash
```

> `$SHELL` reflects the login default even if you switched shells mid-session. Use `echo $0` or `ps -p $$` to see what's actually running.

## Config Files

Each shell loads a different file on startup. Edit the file for your shell to set aliases, environment variables, and functions.

| Shell | Interactive config | Login config |
|-------|--------------------|--------------|
| `bash` | `~/.bashrc` | `~/.bash_profile` or `~/.profile` |
| `zsh` | `~/.zshrc` | `~/.zprofile` |
| `fish` | `~/.config/fish/config.fish` | same file |

> **Rule of thumb:** edit `~/.bashrc` (bash) or `~/.zshrc` (zsh) for anything you want in every terminal session. The login file is only sourced once at login (e.g. SSH, TTY).

### Which file am I actually using?

```bash
# Check if a login shell
echo $-          # contains 'l' if login shell

# Trace which files bash loads (run at startup)
bash --login -x 2>&1 | grep "^+" | head -20
```

### Find your config file quickly

```bash
# Bash
ls -la ~/.bashrc ~/.bash_profile ~/.profile 2>/dev/null

# Zsh
ls -la ~/.zshrc ~/.zprofile 2>/dev/null

# Fish
ls -la ~/.config/fish/config.fish 2>/dev/null
```

## Reload Config After Changes

There is no need to restart the terminal — source the file directly:

```bash
# Bash
source ~/.bashrc
# shorthand
. ~/.bashrc

# Zsh
source ~/.zshrc

# Fish
source ~/.config/fish/config.fish
```

> `source` (or `.`) runs the file in the **current** shell process, so new aliases and variables take effect immediately.

## Common Things to Put in Your Config

```bash
# Aliases
alias ll='ls -lah'
alias gs='git status'

# Environment variables
export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"

# Prompt customization (bash)
export PS1='\u@\h:\w\$ '
```

## Change Your Default Shell

```bash
# List available shells
cat /etc/shells

# Change login shell (takes effect on next login)
chsh -s /bin/zsh

# Temporarily switch for current session only
bash
zsh
```

## Related

- [[Tmux Overview]] - Running shells inside Tmux
- [[Home]]

#beginner
