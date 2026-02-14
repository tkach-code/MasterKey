# Obsidian Plugins

Obsidian has core plugins (built-in) and community plugins (third-party).

## Core Plugins

Enable/disable in Settings > Core plugins.

| Plugin | Description |
|--------|-------------|
| **Backlinks** | See notes linking to current note |
| **Bookmarks** | Star/bookmark notes for quick access |
| **Canvas** | Visual whiteboard for arranging notes |
| **Command palette** | `Ctrl+P` to search commands |
| **Daily notes** | Create a note for each day |
| **File explorer** | Sidebar file browser |
| **File recovery** | Snapshots for recovering edits |
| **Graph view** | Visual map of note connections |
| **Note composer** | Merge and split notes |
| **Outgoing links** | See links from current note |
| **Outline** | Table of contents for current note |
| **Page preview** | Hover preview on links |
| **Quick switcher** | `Ctrl+O` to jump to notes |
| **Search** | Full-text search across vault |
| **Slash commands** | Type `/` for quick commands |
| **Tags view** | Browse all tags |
| **Templates** | Insert reusable templates |
| **Word count** | Show word/character count |
| **Workspaces** | Save and load pane layouts |

## Installing Community Plugins

1. Settings > Community plugins > Turn off Restricted mode
2. Browse community plugins
3. Install and enable

## Essential Community Plugins

### Dataview

Query your vault like a database:

```dataview
TABLE file.mtime AS "Modified", tags
FROM "Git"
SORT file.mtime DESC
```

```dataview
LIST
FROM #beginner
SORT file.name ASC
```

### Templater

Advanced templates with dynamic content:

```markdown
<%*
const title = await tp.system.prompt("Note title");
-%>
# <% title %>

Created: <% tp.date.now("YYYY-MM-DD") %>
```

### Calendar

Visual calendar in sidebar for navigating daily notes.

### Excalidraw

Draw diagrams and sketches directly in Obsidian.

### Kanban

Create Kanban boards from Markdown:

```markdown
---
kanban-plugin: basic
---
## To Do
- [ ] Learn Git branching
- [ ] Practice Vim macros

## In Progress
- [ ] Read about rebasing

## Done
- [x] Set up vault
```

### Linter

Auto-format Markdown files on save (consistent headings, spacing, etc.).

### Git (obsidian-git)

Automatically backup your vault to a Git repository:

- Auto commit on interval
- Auto push/pull
- View file history
- Diff view

Settings to configure:
| Setting | Recommended |
|---------|-------------|
| Auto backup interval | 10–30 minutes |
| Auto pull on open | Enabled |
| Commit message | `vault backup: {{date}}` |

> This plugin pairs perfectly with this vault's purpose of practicing Git. See [[Git Overview]].

### Advanced Tables

Better table editing — Tab to navigate cells, auto-formatting.

### Various Complements

Auto-complete for words, links, and frontmatter.

## Plugin Tips

- Don't install too many plugins at once — learn each one before adding more
- Check plugin update frequency before relying on it
- Disable unused plugins to keep Obsidian fast
- Some plugins conflict — if something breaks, disable recent additions

## Related

- [[Obsidian Overview]] - Core features
- [[Obsidian Navigation and Search]] - Built-in search
- [[Obsidian Organization]] - Dataview for organization
- [[Obsidian Tips and Workflows]] - Using plugins effectively
- [[Home]]

#obsidian #intermediate #advanced
