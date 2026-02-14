# Vim Buffers Windows Tabs

Managing multiple files in Vim.

## Buffers

A buffer is a file loaded into memory. You can have many buffers open.

```vim
:e filename         " Open file in new buffer
:ls                 " List all buffers
:b {number}         " Switch to buffer by number
:b {name}           " Switch to buffer by partial name
:bn                 " Next buffer
:bp                 " Previous buffer
:bd                 " Delete (close) current buffer
:bd 3               " Delete buffer 3
:%bd                " Delete all buffers
:bufdo %s/old/new/g " Run command on all buffers
```

### Buffer States

| Flag | Meaning |
|------|---------|
| `%` | Current buffer |
| `#` | Alternate buffer (switch with `Ctrl-^`) |
| `a` | Active (visible in a window) |
| `h` | Hidden (loaded but not visible) |
| `+` | Modified |

## Windows (Splits)

Windows are viewports into buffers. Multiple windows can show the same or different buffers.

### Creating Splits

| Command | Action |
|---------|--------|
| `:split` or `Ctrl-w s` | Horizontal split |
| `:vsplit` or `Ctrl-w v` | Vertical split |
| `:split filename` | Split and open file |
| `:new` | Horizontal split with new buffer |
| `:vnew` | Vertical split with new buffer |

### Navigating Splits

| Key | Action |
|-----|--------|
| `Ctrl-w h` | Move to left window |
| `Ctrl-w j` | Move to window below |
| `Ctrl-w k` | Move to window above |
| `Ctrl-w l` | Move to right window |
| `Ctrl-w w` | Cycle through windows |
| `Ctrl-w p` | Previous window |

### Resizing Splits

| Key | Action |
|-----|--------|
| `Ctrl-w =` | Make all windows equal size |
| `Ctrl-w _` | Maximize height |
| `Ctrl-w \|` | Maximize width |
| `Ctrl-w +` | Increase height |
| `Ctrl-w -` | Decrease height |
| `Ctrl-w >` | Increase width |
| `Ctrl-w <` | Decrease width |
| `:resize 20` | Set height to 20 |

### Closing & Rearranging

| Key | Action |
|-----|--------|
| `Ctrl-w q` | Close window |
| `Ctrl-w o` | Close all other windows |
| `Ctrl-w r` | Rotate windows |
| `Ctrl-w H` | Move window to far left |
| `Ctrl-w J` | Move window to bottom |
| `Ctrl-w K` | Move window to top |
| `Ctrl-w L` | Move window to far right |

## Tabs

Tabs are collections of windows (like workspaces).

```vim
:tabnew             " New tab
:tabnew filename    " New tab with file
:tabn               " Next tab (or gt)
:tabp               " Previous tab (or gT)
:tabc               " Close current tab
:tabo               " Close all other tabs
:tabm {n}           " Move tab to position n
:tabdo command      " Run command in all tabs
```

## Practical Workflow

```vim
" Open project files
:e src/main.py
:split src/utils.py
:vsplit tests/test_main.py

" Navigate between them
Ctrl-w h/j/k/l

" Quick switch to alternate buffer
Ctrl-^
```

## Related

- [[Vim Navigation]] - Moving within a file
- [[Vim Configuration]] - Default split settings
- [[Vim Plugins]] - File explorers like NERDTree
- [[Home]]

#vim #intermediate
