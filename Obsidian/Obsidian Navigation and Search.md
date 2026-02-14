# Obsidian Navigation and Search

Finding and moving between notes efficiently.

## Keyboard Shortcuts

### Essential

| Shortcut | Action |
|----------|--------|
| `Ctrl+O` | Open quick switcher (find note by name) |
| `Ctrl+P` | Command palette (search all commands) |
| `Ctrl+Shift+F` | Search across all notes |
| `Ctrl+F` | Search in current note |
| `Ctrl+H` | Search and replace in current note |
| `Ctrl+N` | Create new note |
| `Ctrl+E` | Toggle edit/preview mode |
| `Ctrl+Click` | Open link in new pane |

### Navigation

| Shortcut | Action |
|----------|--------|
| `Alt+Left` | Navigate back |
| `Alt+Right` | Navigate forward |
| `Ctrl+Tab` | Switch to next tab |
| `Ctrl+Shift+Tab` | Switch to previous tab |
| `Ctrl+W` | Close current tab |

### Panes and Splits

| Shortcut | Action |
|----------|--------|
| `Ctrl+\` | Split vertically |
| `Ctrl+Shift+\` | Split horizontally |

### Editing

| Shortcut | Action |
|----------|--------|
| `Ctrl+B` | Bold |
| `Ctrl+I` | Italic |
| `Ctrl+K` | Insert link |
| `Ctrl+]` | Indent |
| `Ctrl+[` | Unindent |
| `Ctrl+Enter` | Toggle checkbox |
| `Ctrl+D` | Delete paragraph |
| `Ctrl+Shift+V` | Paste without formatting |

## Quick Switcher

Open with `Ctrl+O`. The fastest way to navigate:

- Type any part of a note's name
- Use arrow keys + Enter to select
- Create a new note if no match exists

## Search

### Basic Search (`Ctrl+Shift+F`)

Search across all notes in the vault. Supports:

```
word                    → exact word
"exact phrase"          → exact phrase match
/regex pattern/         → regular expression
```

### Search Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `path:` | Search in folder | `path:Git` |
| `file:` | Search by filename | `file:Overview` |
| `tag:` | Search by tag | `tag:beginner` |
| `line:` | Match on same line | `line:(git commit)` |
| `section:` | Match in same section | `section:(## Commands)` |
| `block:` | Match in same block | `block:(add commit)` |
| `-` | Exclude | `-tag:advanced` |

### Combining Operators

```
path:Git tag:beginner           → beginner Git notes
file:Overview -path:Vim         → Overview notes not in Vim folder
tag:intermediate "merge"        → intermediate notes mentioning merge
```

## Backlinks

The backlinks pane shows all notes that link **to** the current note. Open it from the right sidebar.

- **Linked mentions** — explicit `[[wiki-links]]`
- **Unlinked mentions** — text that matches the note's name but isn't linked

Unlinked mentions help you discover connections you missed — click to convert them to links.

## Graph View

Visual map of your vault's connections. Open with the graph icon or Command palette.

### Graph Controls

| Control | Action |
|---------|--------|
| Scroll | Zoom in/out |
| Drag background | Pan |
| Drag node | Move a note |
| Click node | Open the note |

### Graph Filters

- Filter by folder, tag, or search query
- Adjust depth (how many link hops to show)
- Color groups by path or tag
- Toggle orphan notes (no links)

### Local Graph

Shows connections for the current note only. Useful for understanding a note's context without the noise of the full graph.

## Starred / Bookmarked Notes

Star frequently accessed notes for quick access from the sidebar.

## Related

- [[Obsidian Overview]] - Core features
- [[Obsidian Markdown and Linking]] - Creating links
- [[Obsidian Organization]] - Structuring for findability
- [[Home]]

#obsidian #beginner #intermediate
