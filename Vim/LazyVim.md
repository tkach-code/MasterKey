# LazyVim

A Neovim configuration framework that turns Neovim into a full IDE with sane defaults.

## What is LazyVim

LazyVim is a pre-configured Neovim distro built on top of [[Vim Plugins|lazy.nvim]]. Instead of configuring every plugin from scratch, LazyVim ships with a curated set of plugins, keymaps, and options — while remaining fully customizable.

- **Not a plugin** — it's a starter config you own and extend
- Uses `lazy.nvim` for plugin management
- Ships with LSP, Treesitter, Telescope, and more out of the box
- Leader key defaults to `<Space>`

## Installation

Requirements: Neovim >= 0.9, Git, a Nerd Font (for icons).

```bash
# Back up existing config
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak

# Clone starter template
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Remove git history so it's yours
rm -rf ~/.config/nvim/.git

# Launch Neovim — plugins install automatically
nvim
```

## Directory Structure

```
~/.config/nvim/
├── lua/
│   ├── config/
│   │   ├── autocmds.lua     # Custom autocommands
│   │   ├── keymaps.lua      # Custom keymaps
│   │   ├── lazy.lua         # Bootstraps lazy.nvim
│   │   └── options.lua      # Vim options overrides
│   └── plugins/             # Your plugin customizations
│       └── example.lua
└── init.lua                 # Entry point
```

All customization lives in `lua/config/` and `lua/plugins/` — never edit LazyVim's own files directly.

## Essential Keymaps

### General

| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<Space><Space>` | Find files (Telescope) |
| `<Space>/` | Grep in project |
| `<Space>e` | File explorer (Neo-tree) |
| `<Space>gg` | Open Lazygit |
| `<Space>bd` | Delete buffer |
| `<Space>qq` | Quit all |

### Code / LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |
| `<Space>ca` | Code action |
| `<Space>cr` | Rename symbol |
| `<Space>cf` | Format file |
| `[d` / `]d` | Previous / next diagnostic |

### Windows & Buffers

| Key | Action |
|-----|--------|
| `<Space>-` | Split window horizontally |
| `<Space>\|` | Split window vertically |
| `<C-h/j/k/l>` | Navigate between windows |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `<Space>bb` | Switch buffer |

### UI Toggles

| Key | Action |
|-----|--------|
| `<Space>uf` | Toggle auto-format |
| `<Space>us` | Toggle spell check |
| `<Space>uw` | Toggle word wrap |
| `<Space>ul` | Toggle line numbers |
| `<Space>ud` | Toggle diagnostics |

## Adding Plugins

Create a file in `lua/plugins/` — any `.lua` file there is auto-loaded:

```lua
-- lua/plugins/my-plugins.lua
return {
  -- Add a new plugin
  { "folke/zen-mode.nvim", opts = {} },

  -- Extend an existing LazyVim plugin
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
      },
    },
  },
}
```

## Overriding Options and Keymaps

```lua
-- lua/config/options.lua
vim.opt.relativenumber = true
vim.opt.tabstop = 4

-- lua/config/keymaps.lua
vim.keymap.set("n", "<leader>W", ":w!<CR>", { desc = "Force save" })
```

## Enabling Language Support (Extras)

LazyVim ships with optional language packs called **extras**:

```lua
-- lua/config/lazy.lua  (inside LazyVim spec)
{ import = "lazyvim.plugins.extras.lang.python" },
{ import = "lazyvim.plugins.extras.lang.typescript" },
{ import = "lazyvim.plugins.extras.lang.go" },
{ import = "lazyvim.plugins.extras.ui.mini-animate" },
```

Or enable via the interactive UI: `:LazyExtras`

## Useful Commands

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager UI |
| `:LazyExtras` | Browse and enable extras |
| `:LazyHealth` | Check setup health |
| `:Mason` | Manage LSP servers / formatters |
| `:MasonInstall <name>` | Install a language server |
| `:checkhealth` | Full Neovim health check |

## Key Bundled Plugins

| Plugin | Role |
|--------|------|
| `lazy.nvim` | Plugin manager |
| `telescope.nvim` | Fuzzy finder |
| `nvim-treesitter` | Syntax highlighting / text objects |
| `nvim-lspconfig` | LSP client |
| `nvim-cmp` | Auto-completion |
| `neo-tree.nvim` | File explorer |
| `which-key.nvim` | Keymap hints on `<Space>` |
| `gitsigns.nvim` | Git diff in sign column |
| `lazygit.nvim` | Lazygit terminal UI |
| `noice.nvim` | Enhanced UI for messages/cmdline |
| `lualine.nvim` | Status line |
| `flash.nvim` | Enhanced `f`/`t` motion + leap |

## Compared to Plain Neovim

| | Plain Neovim | LazyVim |
|-|-------------|---------|
| Setup time | Hours/days | Minutes |
| LSP config | Manual per-language | Mason auto-install |
| Plugins | You choose all | Curated + extensible |
| Learning curve | Steep | Gradual |
| Control | Full | Full (you own the config) |

## Related

- [[Vim Plugins]] - lazy.nvim and plugin concepts
- [[Vim Configuration]] - options and keymaps fundamentals
- [[Vim Advanced Techniques]] - extend with Lua scripting
- [[Home]]

#vim #neovim #lazyvim #intermediate #advanced
