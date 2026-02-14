# Vim Navigation

Moving around files efficiently without touching the mouse.

## Basic Movement

| Key | Movement |
|-----|----------|
| `h` | Left |
| `j` | Down |
| `k` | Up |
| `l` | Right |

> Use these instead of arrow keys to keep hands on home row.

## Word Movement

| Key | Movement |
|-----|----------|
| `w` | Next word start |
| `W` | Next WORD start (whitespace-delimited) |
| `b` | Previous word start |
| `B` | Previous WORD start |
| `e` | Next word end |
| `E` | Next WORD end |
| `ge` | Previous word end |

## Line Movement

| Key | Movement |
|-----|----------|
| `0` | Beginning of line |
| `^` | First non-blank character |
| `$` | End of line |
| `g_` | Last non-blank character |
| `f{char}` | Forward to char (inclusive) |
| `F{char}` | Backward to char (inclusive) |
| `t{char}` | Forward to char (exclusive) |
| `T{char}` | Backward to char (exclusive) |
| `;` | Repeat last f/F/t/T |
| `,` | Repeat last f/F/t/T (reverse) |

## Vertical Movement

| Key | Movement |
|-----|----------|
| `gg` | First line of file |
| `G` | Last line of file |
| `{number}G` | Go to line number |
| `:{number}` | Go to line number |
| `{` | Previous paragraph (blank line) |
| `}` | Next paragraph (blank line) |
| `Ctrl-d` | Half page down |
| `Ctrl-u` | Half page up |
| `Ctrl-f` | Full page down |
| `Ctrl-b` | Full page up |
| `H` | Top of screen |
| `M` | Middle of screen |
| `L` | Bottom of screen |

## Screen Positioning

| Key | Effect |
|-----|--------|
| `zz` | Center current line on screen |
| `zt` | Current line to top of screen |
| `zb` | Current line to bottom of screen |

## Jumping

| Key | Movement |
|-----|----------|
| `%` | Matching bracket `(){}[]` |
| `*` | Next occurrence of word under cursor |
| `#` | Previous occurrence of word under cursor |
| `gd` | Go to local definition |
| `gD` | Go to global definition |
| `Ctrl-o` | Jump back (older position) |
| `Ctrl-i` | Jump forward (newer position) |

## Combining with Count

Prefix any motion with a number to repeat it:

```
5j      → move 5 lines down
3w      → move 3 words forward
2}      → move 2 paragraphs down
10G     → go to line 10
```

## Related

- [[Vim Modes]] - Normal mode is for navigation
- [[Vim Editing]] - Combine motions with operators
- [[Vim Search and Replace]] - Find text
- [[Home]]

#vim #beginner #intermediate
