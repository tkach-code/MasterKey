# Vim Plugins

Extending Vim with plugins.

## Plugin Managers

### vim-plug (Recommended)

Install:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Usage in `~/.vimrc`:
```vim
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'

call plug#end()
```

Commands:
| Command | Action |
|---------|--------|
| `:PlugInstall` | Install plugins |
| `:PlugUpdate` | Update plugins |
| `:PlugClean` | Remove unused plugins |
| `:PlugStatus` | Check plugin status |

### Neovim: lazy.nvim

The standard plugin manager for Neovim (Lua-based):
```lua
-- ~/.config/nvim/lua/plugins.lua
require("lazy").setup({
  "tpope/vim-surround",
  "numToStr/Comment.nvim",
  "nvim-telescope/telescope.nvim",
})
```

## Essential Plugins

### tpope/vim-surround
Manipulate surrounding characters (quotes, brackets, tags):

```vim
cs"'        → change surrounding " to '
ds"         → delete surrounding "
ysiw"       → surround word with "
S"          → surround selection with " (Visual mode)
```

### tpope/vim-commentary
Comment/uncomment code:

```vim
gcc         → toggle comment on line
gc{motion}  → toggle comment on motion
gcap        → comment a paragraph
```

### tpope/vim-fugitive
Git integration inside Vim:

```vim
:Git status     " or :G
:Git diff
:Git blame
:Git log
:Gwrite         " git add current file
:Gread          " git checkout current file
```

### junegunn/fzf.vim
Fuzzy finder for files, buffers, and more:

```vim
:Files          " Find files
:Buffers        " Switch buffer
:Rg pattern     " Grep in project
:Lines          " Search in current buffer
:History        " Recent files
```

### preservim/nerdtree
File explorer sidebar:

```vim
:NERDTreeToggle     " Open/close file tree
```

### tpope/vim-repeat
Make `.` work with plugin commands (surround, commentary, etc.).

### airblade/vim-gitgutter
Show Git diff markers in the sign column.

## Neovim-Specific Plugins

| Plugin | Description |
|--------|-------------|
| `nvim-treesitter` | Advanced syntax highlighting |
| `nvim-lspconfig` | LSP client configuration |
| `telescope.nvim` | Fuzzy finder (modern fzf alternative) |
| `nvim-cmp` | Auto-completion engine |
| `Comment.nvim` | Commenting (Lua rewrite) |
| `lualine.nvim` | Status line |
| `neo-tree.nvim` | File explorer |

## Related

- [[Vim Configuration]] - vimrc setup
- [[Vim Editing]] - vim-surround extends editing
- [[Git Overview]] - vim-fugitive for Git
- [[Home]]

#vim #intermediate #advanced
