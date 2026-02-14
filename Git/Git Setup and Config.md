# Git Setup and Config

## Installation

```bash
# Debian/Ubuntu
sudo apt install git

# macOS
brew install git

# Verify
git --version
```

## Essential Configuration

Git config has three levels: `--system`, `--global` (user), and `--local` (repo).

```bash
# Identity (required)
git config --global user.name "Your Name"
git config --global user.email "you@example.com"

# Default branch name
git config --global init.defaultBranch main

# Default editor
git config --global core.editor vim

# View all settings
git config --list
git config --list --show-origin
```

## SSH Key Setup

```bash
# Generate key
ssh-keygen -t ed25519 -C "you@example.com"

# Start agent and add key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Copy public key (add to GitHub/GitLab)
cat ~/.ssh/id_ed25519.pub

# Test connection
ssh -T git@github.com
```

## Useful Aliases

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.lg "log --oneline --graph --decorate --all"
```

## .gitignore

Create a `.gitignore` file to exclude files from tracking:

```
# Compiled files
*.o
*.pyc
__pycache__/

# IDE files
.vscode/
.idea/

# OS files
.DS_Store
Thumbs.db

# Environment
.env
node_modules/
```

Global gitignore:
```bash
git config --global core.excludesfile ~/.gitignore_global
```

## Related

- [[Git Overview]] - Core concepts
- [[Git Basic Commands]] - Start using Git
- [[Home]]

#git #beginner
