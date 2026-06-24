" ============================================================
" sample.vimrc — Vim config for programming
" ============================================================

" ── General ──────────────────────────────────────────────────
set nocompatible            " disable Vi compatibility
filetype plugin indent on   " enable filetype detection + plugins + indent
syntax on                   " syntax highlighting

" ── Line Numbers ─────────────────────────────────────────────
set number                  " absolute line numbers
set relativenumber          " relative numbers (hybrid mode with 'number')

" ── Indentation ──────────────────────────────────────────────
set tabstop=4               " tab = 4 visual spaces
set softtabstop=4           " tab in insert mode = 4 spaces
set shiftwidth=4            " >> / << indent by 4 spaces
set expandtab               " convert tabs to spaces
set autoindent              " copy indent from previous line
set smartindent             " smarter indent for C-like languages

" ── Search ───────────────────────────────────────────────────
set hlsearch                " highlight all matches
set incsearch               " highlight as you type
set ignorecase              " case-insensitive search...
set smartcase               " ...unless pattern has uppercase

" ── UI / Appearance ──────────────────────────────────────────
set cursorline              " highlight current line
set colorcolumn=80          " ruler at column 80
set signcolumn=yes          " always show sign column (git, linting)
set laststatus=2            " always show status bar
set showcmd                 " show partial command in bottom bar
set ruler                   " show cursor position
set wildmenu                " enhanced command-line completion
set wildmode=list:longest   " list all matches, complete to longest common
set scrolloff=8             " keep 8 lines above/below cursor
set sidescrolloff=8         " keep 8 columns left/right of cursor

" ── Editing Behaviour ────────────────────────────────────────
set backspace=indent,eol,start  " backspace over everything in insert mode
set clipboard=unnamedplus       " use system clipboard (Linux)
set mouse=a                     " enable mouse in all modes
set wrap                        " wrap long lines
set linebreak                   " wrap at word boundary
set hidden                      " allow switching buffers without saving
set confirm                     " prompt instead of failing on unsaved changes
set updatetime=300              " faster CursorHold (good for plugins)

" ── Splits ───────────────────────────────────────────────────
set splitright              " vertical split opens on the right
set splitbelow              " horizontal split opens below

" ── Files ────────────────────────────────────────────────────
set encoding=utf-8
set fileencoding=utf-8
set nobackup                " don't create backup files
set nowritebackup
set noswapfile              " no .swp files — use version control instead

" ── Key Mappings ─────────────────────────────────────────────
let mapleader = " "         " <Space> as leader key

" clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" quick save / quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" navigate splits with Ctrl+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move selected lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" keep cursor centred when jumping
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" indent/unindent and stay in visual mode
vnoremap < <gv
vnoremap > >gv

" toggle relative numbers
nnoremap <leader>rn :set relativenumber!<CR>

" ── Filetype-specific settings ───────────────────────────────
autocmd FileType python     setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType html       setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType css        setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yaml       setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType go         setlocal shiftwidth=4 tabstop=4 noexpandtab

" ── Plugins (vim-plug) ───────────────────────────────────────
" Tested with Neovim. Install vim-plug for Neovim:
"   curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
"     --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" For classic Vim instead:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" After installing vim-plug, open Neovim and run :PlugInstall

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'           " Git integration
Plug 'tpope/vim-surround'           " surround text objects
Plug 'tpope/vim-commentary'         " gc to toggle comments
Plug 'airblade/vim-gitgutter'       " git diff in sign column
Plug 'preservim/nerdtree'           " file tree explorer
Plug 'ctrlpvim/ctrlp.vim'           " fuzzy file finder
Plug 'vim-airline/vim-airline'      " status line
Plug 'morhetz/gruvbox'              " colour scheme

call plug#end()

" ── Colour scheme ────────────────────────────────────────────
set background=dark
silent! colorscheme gruvbox         " falls back gracefully if not installed

" ── NERDTree ─────────────────────────────────────────────────
nnoremap <leader>e :NERDTreeToggle<CR>
let NERDTreeShowHidden=1            " show dotfiles

" ── CtrlP ────────────────────────────────────────────────────
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
