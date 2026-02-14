# Vim Modes

Vim is a **modal editor** — keys do different things depending on the current mode.

## The Four Main Modes

### Normal Mode (default)
For navigating and manipulating text. This is where you spend most of your time.

Press `Esc` to return here from any other mode.

### Insert Mode
For typing text, like a regular editor.

| Key | Enter Insert Mode... |
|-----|---------------------|
| `i` | Before cursor |
| `I` | Beginning of line |
| `a` | After cursor |
| `A` | End of line |
| `o` | New line below |
| `O` | New line above |
| `s` | Delete char and insert |
| `S` | Delete line and insert |
| `c{motion}` | Change (delete + insert) |

### Visual Mode
For selecting text, then applying operations.

| Key | Visual Mode Type |
|-----|-----------------|
| `v` | Character-wise selection |
| `V` | Line-wise selection |
| `Ctrl-v` | Block (column) selection |

In Visual mode, use Normal mode motions to extend selection, then apply an operator:
- `d` — delete selection
- `y` — yank (copy) selection
- `c` — change (replace) selection
- `>` / `<` — indent / unindent
- `U` / `u` — uppercase / lowercase
- `:` — run command on selection

### Command-Line Mode
For running Ex commands. Enter with `:`, `/`, or `?`.

```vim
:w              " save
:e filename     " open file
:s/old/new/g    " substitute
:!ls            " run shell command
```

## Mode Indicators

Most Vim configurations show the current mode at the bottom:
- `-- INSERT --`
- `-- VISUAL --`
- `-- VISUAL LINE --`
- `-- VISUAL BLOCK --`
- (nothing) = Normal mode

## Key Principle

> Stay in Normal mode. Enter Insert mode briefly to type, then return to Normal mode with `Esc`.

Tips:
- Map `jk` or `jj` to `Esc` for faster mode switching
- `Ctrl-[` is equivalent to `Esc`
- `Ctrl-c` also exits Insert mode (but skips some autocommands)

## Related

- [[Vim Overview]] - Why Vim
- [[Vim Navigation]] - Moving in Normal mode
- [[Vim Editing]] - Operators in Normal mode
- [[Home]]

#vim #beginner
