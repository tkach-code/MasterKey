# Vim Registers and Macros

Registers store text. Macros record and replay sequences of commands.

## Registers

Every yank, delete, and change stores text in a register.

### Types of Registers

| Register | Description |
|----------|-------------|
| `""` | Unnamed (default) — last delete/yank |
| `"0` | Yank register — last yank only |
| `"1`-`"9` | Numbered — last 9 deletes (shifting) |
| `"a`-`"z` | Named — you choose where to store |
| `"A`-`"Z` | Named append — appends to a-z |
| `"+` | System clipboard |
| `"*` | Primary selection (Linux) |
| `"_` | Black hole — delete without storing |
| `"/` | Last search pattern |
| `":` | Last command |
| `".` | Last inserted text |
| `"%` | Current filename |
| `"#` | Alternate filename |

### Using Registers

```vim
" Yank into register a
"ayy

" Paste from register a
"ap

" Delete into black hole (don't affect other registers)
"_dd

" Yank to system clipboard
"+yy

" Paste from system clipboard
"+p

" View all registers
:registers
" or
:reg
```

### Practical Example

```vim
" Copy a line into register a, another into register b
"ayy        → yank line into a
j"byy       → move down, yank line into b

" Now paste them wherever needed
"ap         → paste from a
"bp         → paste from b
```

## Macros

Macros record a sequence of commands into a register and replay them.

### Recording

```vim
q{register}     " Start recording into register (e.g., qa)
... commands ...
q               " Stop recording
```

### Playing Back

```vim
@{register}     " Play macro (e.g., @a)
@@              " Replay last macro
5@a             " Play macro 5 times
```

### Practical Macro Example

Task: Add semicolons to the end of multiple lines.

```vim
qa          " Start recording into register a
A;          " Go to end of line, enter Insert mode, type ;
Esc         " Return to Normal mode
j           " Move to next line
q           " Stop recording

10@a        " Replay on next 10 lines
```

### Tips

- Macros are just text in registers — you can edit them:
  ```vim
  " Paste macro a into buffer
  "ap
  " Edit it, then yank back
  "ayy
  ```

- Use recursive macros for complex tasks:
  ```vim
  qaq         " Clear register a
  qa          " Start recording
  ... commands ...
  @a          " Call itself
  q           " Stop recording
  @a          " Execute (stops at end of file or on error)
  ```

- Run macro on visual selection:
  ```vim
  :'<,'>normal @a
  ```

## Related

- [[Vim Editing]] - Operators that fill registers
- [[Vim Modes]] - Normal mode for macros
- [[Vim Advanced Techniques]] - Complex workflows
- [[Home]]

#vim #intermediate #advanced
