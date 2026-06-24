# Vim Setup on Debian

#vim #beginner

A step-by-step guide for setting up Neovim with the [[sample.vimrc]] programming config on Debian-based systems (Debian, Ubuntu, Kali, Mint, Pop!_OS, etc.).

---

## 1. Install Neovim

Debian's default repos ship an old Neovim. Install a current version:

```bash
sudo apt update
sudo apt install neovim
nvim --version   # check: should be 0.9+ ideally
```

If the packaged version is too old (< 0.9), install from the official release instead:

```bash
# Download the latest stable AppImage
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage

# Move it to a directory on your PATH
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
```

---

## 2. Install vim-plug (plugin manager)

vim-plug must be placed where Neovim can find it at startup:

```bash
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
  --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

> For classic Vim (not Neovim), use this path instead:
> ```bash
> curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
>   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
> ```

---

## 3. Place the config file

Neovim reads its config from `~/.config/nvim/init.vim` (not `~/.vimrc`).

```bash
mkdir -p ~/.config/nvim
cp /path/to/sample.vimrc ~/.config/nvim/init.vim
```

> If you also use classic Vim and want both to share the config:
> ```bash
> cp /path/to/sample.vimrc ~/.vimrc
> echo 'source ~/.vimrc' > ~/.config/nvim/init.vim
> ```

---

## 4. Install plugins

Open Neovim and run the install command:

```bash
nvim
```

Inside Neovim:

```vim
:PlugInstall
```

A split window will open showing each plugin being cloned. Wait for all plugins to finish, then close the window:

```vim
:q
```

Restart Neovim — the config and all plugins are now active.

---

## 5. Verify everything works

| Check | Command inside nvim |
|---|---|
| Line numbers active | `:set number?` → should print `number` |
| Colour scheme loaded | `:colorscheme` → should print `gruvbox` |
| File tree | `<Space>e` (leader + e) |
| Fuzzy file finder | `<C-p>` |
| Plugin list | `:PlugStatus` |

---

## 6. Update plugins later

```vim
:PlugUpdate
```

To remove a plugin: delete its `Plug '...'` line from `init.vim`, then run:

```vim
:PlugClean
```

---

## Troubleshooting

| Error | Cause | Fix |
|---|---|---|
| `E117: Unknown function: plug#begin` | vim-plug not installed | Re-run the curl command in step 2 |
| `E185: Cannot find color scheme 'gruvbox'` | Plugins not yet installed | Run `:PlugInstall` |
| Config not loading | File is at `~/.vimrc` not `~/.config/nvim/init.vim` | Move to the correct path (step 3) |
| Old Neovim version warnings | System Neovim < 0.9 | Use the AppImage method in step 1 |

---

## Related

- [[Vim Configuration]]
- [[Vim Plugins]]
- [[Vim Overview]]
