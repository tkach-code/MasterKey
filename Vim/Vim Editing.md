# Vim Editing

Operators, text objects, and the dot command — the heart of Vim's power.

## Operators

Operators are verbs that act on motions or text objects:

| Operator | Action |
|----------|--------|
| `d` | Delete |
| `c` | Change (delete + enter Insert mode) |
| `y` | Yank (copy) |
| `>` | Indent right |
| `<` | Indent left |
| `=` | Auto-indent |
| `gU` | Uppercase |
| `gu` | Lowercase |
| `g~` | Toggle case |

### Operator + Motion

```
dw      → delete from cursor to next word
d$      → delete to end of line
c3w     → change next 3 words
yy      → yank (copy) entire line
dd      → delete entire line
>>      → indent line
```

> Double an operator to apply it to the whole line: `dd`, `cc`, `yy`, `>>`.

## Text Objects

Text objects define regions of text. They only work with operators or in Visual mode.

| Text Object | Description |
|-------------|-------------|
| `iw` | Inner word |
| `aw` | A word (includes trailing space) |
| `is` | Inner sentence |
| `as` | A sentence |
| `ip` | Inner paragraph |
| `ap` | A paragraph |
| `i"` | Inside double quotes |
| `a"` | Around double quotes |
| `i'` | Inside single quotes |
| `i)` or `ib` | Inside parentheses |
| `a)` or `ab` | Around parentheses |
| `i]` | Inside brackets |
| `i}` or `iB` | Inside braces |
| `it` | Inside HTML/XML tag |
| `at` | Around HTML/XML tag |

### Text Object Examples

```
diw     → delete inner word
ci"     → change inside double quotes
ya)     → yank around parentheses
dit     → delete inside HTML tag
vis     → visually select inner sentence
```

## The Dot Command

`.` repeats the last change. This is one of Vim's most powerful features.

Example workflow:
```
ciw new_name Esc    → change word to "new_name"
n                   → find next occurrence
.                   → repeat the change
n                   → find next
.                   → repeat again
```

## Undo and Redo

| Key | Action |
|-----|--------|
| `u` | Undo |
| `Ctrl-r` | Redo |
| `U` | Undo all changes on current line |

## Put (Paste)

| Key | Action |
|-----|--------|
| `p` | Put after cursor |
| `P` | Put before cursor |
| `gp` | Put after and move cursor after pasted text |

## Other Editing Commands

| Key | Action |
|-----|--------|
| `x` | Delete character under cursor |
| `X` | Delete character before cursor |
| `r{char}` | Replace single character |
| `R` | Enter Replace mode (overwrite) |
| `J` | Join current line with next |
| `~` | Toggle case of character |
| `Ctrl-a` | Increment number |
| `Ctrl-x` | Decrement number |

## Related

- [[Vim Navigation]] - Motions to combine with operators
- [[Vim Modes]] - Insert and Visual modes
- [[Vim Registers and Macros]] - Where deleted/yanked text goes
- [[Home]]

#vim #beginner #intermediate
