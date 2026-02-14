# Vim Search and Replace

Finding and replacing text efficiently.

## Search

```vim
/pattern        " Search forward
?pattern        " Search backward
n               " Next match
N               " Previous match
*               " Search forward for word under cursor
#               " Search backward for word under cursor
```

### Search Options

```vim
:set hlsearch       " Highlight all matches
:set incsearch      " Show matches as you type
:nohlsearch         " Clear current highlights (or :noh)
:set ignorecase     " Case-insensitive search
:set smartcase      " Case-sensitive if pattern has uppercase
```

### Regex in Search

| Pattern | Matches |
|---------|---------|
| `.` | Any single character |
| `\d` | Digit |
| `\w` | Word character |
| `\s` | Whitespace |
| `^` | Start of line |
| `$` | End of line |
| `\<` | Start of word |
| `\>` | End of word |
| `*` | 0 or more of previous |
| `\+` | 1 or more of previous |
| `\{n,m}` | n to m of previous |
| `\|` | OR |
| `\(…\)` | Group |

> Use `\v` (very magic) to avoid excessive escaping: `/\v(foo|bar)\d+`

## Substitute (Replace)

```vim
" Basic syntax
:s/old/new/         " Replace first on current line
:s/old/new/g        " Replace all on current line
:%s/old/new/g       " Replace all in file
:%s/old/new/gc      " Replace all with confirmation

" Range
:10,20s/old/new/g   " Lines 10-20
:'<,'>s/old/new/g   " Visual selection (auto-filled)
:.,$s/old/new/g     " Current line to end of file
```

### Substitute Flags

| Flag | Description |
|------|-------------|
| `g` | Replace all occurrences on the line |
| `c` | Confirm each replacement |
| `i` | Case-insensitive |
| `I` | Case-sensitive |
| `n` | Count matches, don't replace |

### Confirmation Responses

When using `c` flag:
| Key | Action |
|-----|--------|
| `y` | Replace this match |
| `n` | Skip this match |
| `a` | Replace all remaining |
| `q` | Quit |
| `l` | Replace this and quit |

### Useful Substitute Patterns

```vim
" Delete trailing whitespace
:%s/\s\+$//g

" Delete blank lines
:g/^$/d

" Add text to beginning of every line
:%s/^/prefix /

" Add text to end of every line
:%s/$/ suffix/

" Swap two words
:%s/\(word1\)\(.*\)\(word2\)/\3\2\1/g

" Use captured groups
:%s/\(\w\+\), \(\w\+\)/\2 \1/g
```

## Global Command

`:g` executes a command on all lines matching a pattern:

```vim
:g/pattern/d            " Delete all lines matching pattern
:g!/pattern/d           " Delete all lines NOT matching
:g/TODO/t$              " Copy all TODO lines to end of file
:g/^$/d                 " Delete all empty lines
:g/pattern/norm A;      " Append ; to matching lines
```

## Related

- [[Vim Navigation]] - Finding your way around
- [[Vim Editing]] - Operators and motions
- [[Vim Advanced Techniques]] - Complex patterns
- [[Home]]

#vim #intermediate
