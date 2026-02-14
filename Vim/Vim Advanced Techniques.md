# Vim Advanced Techniques

Master-level features for power users.

## Marks

Marks save cursor positions for quick jumping.

| Mark | Description |
|------|-------------|
| `ma` | Set mark `a` at cursor |
| `'a` | Jump to line of mark `a` |
| `` `a `` | Jump to exact position of mark `a` |
| `'0`-`'9` | Position when last exited Vim |
| `''` | Position before last jump |
| `'.` | Position of last change |
| `'^` | Position of last insert |
| `:marks` | List all marks |
| `:delmarks a` | Delete mark `a` |

Lowercase marks (`a`-`z`) are per-buffer. Uppercase marks (`A`-`Z`) are global across files.

## Folds

Collapse sections of code to focus on structure.

```vim
" Manual folding
zf{motion}      " Create fold
zo              " Open fold
zc              " Close fold
za              " Toggle fold
zR              " Open all folds
zM              " Close all folds
zd              " Delete fold

" Set fold method
:set foldmethod=manual      " Create folds manually
:set foldmethod=indent      " Fold by indentation
:set foldmethod=syntax      " Fold by syntax
:set foldmethod=marker      " Fold by markers {{{ }}}
```

## Autocommands

Execute commands automatically on events:

```vim
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Set filetype-specific settings
autocmd FileType python setlocal tabstop=4 shiftwidth=4
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2

" Auto-source vimrc on save
autocmd BufWritePost ~/.vimrc source ~/.vimrc

" Return to last edit position
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
```

### Autocommand Groups (prevent duplicates)

```vim
augroup mygroup
  autocmd!       " Clear existing commands in group
  autocmd BufWritePre * %s/\s\+$//e
augroup END
```

## Command-Line Tricks

```vim
" Run current file
:!python %          " % = current filename

" Read command output into buffer
:r !date            " Insert current date
:r !ls              " Insert directory listing

" Filter text through external command
:%!sort             " Sort entire file
:'<,'>!sort -u      " Sort selection, remove duplicates
:%!python -m json.tool   " Format JSON

" Repeat last Ex command
@:

" Edit command history
q:
```

## Multiple Cursors (without plugins)

Vim's native approach using `gn`:

```vim
/pattern            " Search for text
cgn                 " Change the match
.                   " Repeat on next match (dot command)
n                   " Skip a match
.                   " Change the next match
```

Or using `:s` with `c` flag:
```vim
:%s/old/new/gc      " Replace with confirmation
```

## Abbreviations

```vim
" Insert mode abbreviations
:iab teh the
:iab @@ user@example.com
:iab sig -- \rJohn Doe\rjohn@example.com

" Command mode abbreviations
:cab W w
:cab Q q
```

## Sessions

Save and restore your entire workspace:

```vim
" Save session
:mksession! ~/.vim/sessions/project.vim

" Restore session
:source ~/.vim/sessions/project.vim

" From command line
vim -S ~/.vim/sessions/project.vim
```

## Expression Register

Calculate expressions in Insert mode:

```vim
" In Insert mode:
Ctrl-r =          " Enter expression register
2 + 2 Enter       " Inserts "4"
system('date')     " Inserts command output
```

## Related

- [[Vim Registers and Macros]] - Macro recording
- [[Vim Configuration]] - Autocommands in vimrc
- [[Vim Search and Replace]] - Global command
- [[Home]]

#vim #advanced
