# Vim Configuration

Setting up your `~/.vimrc` for a comfortable editing experience.

## Minimal Sensible vimrc

```vim
" Don't be compatible with vi
set nocompatible

" --- Display ---
set number              " Show line numbers
set relativenumber      " Relative line numbers
set cursorline          " Highlight current line
set showmatch           " Highlight matching brackets
set showcmd             " Show partial commands
set laststatus=2        " Always show status line
set ruler               " Show cursor position
set scrolloff=8         " Keep 8 lines visible above/below cursor
set signcolumn=yes      " Always show sign column

" --- Search ---
set hlsearch            " Highlight search results
set incsearch           " Incremental search
set ignorecase          " Case-insensitive search
set smartcase           " Case-sensitive if uppercase in pattern

" --- Indentation ---
set tabstop=4           " Tab displays as 4 spaces
set shiftwidth=4        " Indent with 4 spaces
set expandtab           " Use spaces instead of tabs
set autoindent          " Copy indent from current line
set smartindent         " Smart auto-indenting

" --- Behavior ---
set hidden              " Allow switching buffers without saving
set wildmenu            " Enhanced command-line completion
set wildmode=list:longest,full
set backspace=indent,eol,start  " Backspace works normally
set clipboard=unnamedplus       " Use system clipboard
set mouse=a             " Enable mouse
set splitbelow          " Horizontal splits open below
set splitright          " Vertical splits open right
set undofile            " Persistent undo
set noswapfile          " No swap files

" --- File Encoding ---
set encoding=utf-8
set fileencoding=utf-8
```

## Key Mappings

```vim
" Set leader key to space
let mapleader = " "

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Escape from Insert mode
inoremap jk <Esc>

" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move lines up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep visual selection when indenting
vnoremap < <gv
vnoremap > >gv

" Clear search highlights
nnoremap <leader>h :nohlsearch<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bd :bdelete<CR>
```

## Neovim Differences

If using Neovim (`nvim`), the config file is `~/.config/nvim/init.vim` or `~/.config/nvim/init.lua`.

Key differences:
- Neovim uses Lua for configuration (`init.lua`)
- Built-in LSP client
- Built-in terminal
- Treesitter for syntax highlighting
- More active plugin ecosystem

### Lua Config Equivalent

```lua
-- init.lua
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>w", ":w<CR>")
```

## Related

- [[Vim Plugins]] - Extend functionality
- [[Vim Modes]] - Understanding modes for mappings
- [[Vim Advanced Techniques]] - Autocommands
- [[Home]]

#vim #intermediate
