# Vim Overview

Vim (Vi IMproved) is a modal text editor designed for efficient text editing. It's available on virtually every Unix system.

## Why Vim?

- **Speed** — edit text without leaving the keyboard
- **Ubiquity** — available on every server and system
- **Efficiency** — commands compose like a language
- **Customizable** — extensive configuration and plugin ecosystem
- **Lightweight** — starts instantly, works over SSH

## Getting Started

```bash
# Open vim
vim

# Open a file
vim filename.txt

# Open multiple files
vim file1.txt file2.txt

# Open at specific line
vim +42 filename.txt

# Open in read-only mode
vim -R filename.txt
# or
view filename.txt
```

## Exiting Vim

| Command | Description |
|---------|-------------|
| `:q` | Quit (fails if unsaved changes) |
| `:q!` | Quit without saving |
| `:w` | Save (write) |
| `:wq` | Save and quit |
| `:x` | Save and quit (only writes if changes exist) |
| `ZZ` | Save and quit (Normal mode shortcut) |
| `ZQ` | Quit without saving (Normal mode shortcut) |

## The Vim Language

Vim commands follow a grammar: **verb + modifier + noun**

```
d  2  w      →  delete 2 words
c  i  "      →  change inside quotes
y  a  p      →  yank (copy) a paragraph
```

This composability means learning a few verbs and nouns gives you hundreds of commands.

## Learning Path

1. [[Vim Modes]] — understand modal editing
2. [[Vim Navigation]] — move efficiently
3. [[Vim Editing]] — operators and text objects
4. [[Vim Search and Replace]] — find and change text
5. [[Vim Buffers Windows Tabs]] — manage files
6. [[Vim Registers and Macros]] — power features
7. [[Vim Configuration]] — customize your setup
8. [[Vim Plugins]] — extend functionality
9. [[Vim Advanced Techniques]] — master-level features

> Run `vimtutor` in your terminal for a built-in interactive tutorial.

## Related

- [[Vim Modes]] - Start here
- [[Home]]

#vim #beginner
