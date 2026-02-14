# Obsidian Organization

Strategies for structuring your vault so notes are easy to find and connect.

## Organization Methods

### 1. Folders

Traditional hierarchy. Good for clear categories.

```
Vault/
├── Projects/
├── Areas/
├── Resources/
└── Archive/
```

**Pros**: familiar, visual structure, easy to browse
**Cons**: notes can only be in one folder, rigid

### 2. Tags

Flexible categorization. A note can have multiple tags.

```markdown
#project/website
#status/active
#type/reference
```

**Pros**: multiple categories per note, searchable, flexible
**Cons**: can get messy without discipline

### 3. Links (MOC / Map of Content)

Use index notes that link to related notes — no folders needed.

```markdown
# Programming MOC
- [[Python]]
- [[JavaScript]]
- [[Git Overview]]
```

**Pros**: organic connections, flexible structure, discoverable
**Cons**: requires maintenance

### 4. Hybrid (Recommended)

Combine all three:
- **Folders** for broad categories (Git/, Vim/, Obsidian/)
- **Tags** for cross-cutting concerns (#beginner, #intermediate)
- **MOC notes** for curated navigation ([[Home]])

## PARA Method

A popular system by Tiago Forte:

| Folder | Purpose | Example |
|--------|---------|---------|
| **Projects** | Active with a deadline | "Launch website" |
| **Areas** | Ongoing responsibilities | "Health", "Finance" |
| **Resources** | Topics of interest | "Git", "Vim" |
| **Archive** | Completed/inactive items | Old projects |

## Zettelkasten Method

A note-making system focused on atomic, linked notes:

1. **One idea per note** — keep notes small and focused
2. **Write in your own words** — don't just copy-paste
3. **Link generously** — connect every note to related ones
4. **Use unique IDs** — some use timestamps: `202401151430`
5. **Let structure emerge** — don't pre-organize, let links create structure

## Naming Conventions

| Style | Example | Best For |
|-------|---------|----------|
| Descriptive | `Git Branching` | Reference notes |
| Question | `How to resolve merge conflicts` | Q&A notes |
| Timestamp | `2024-01-15 Meeting notes` | Daily/journal notes |
| Prefixed | `MOC - Programming` | Special note types |

## Templates

Create reusable templates for consistent note structure.

1. Create a `Templates/` folder
2. Add template files:

```markdown
<!-- Templates/Reference Note.md -->
# {{title}}

## Summary

## Details

## Related
-

#type/reference
```

3. Enable Templates core plugin
4. Set template folder in settings
5. Use `Ctrl+T` to insert a template

## Frontmatter for Organization

```markdown
---
tags: [git, intermediate]
aliases: [branching, git-branch]
date: 2024-01-15
status: complete
---
```

Use the Dataview plugin to query frontmatter:
```dataview
TABLE status, date
FROM #git
SORT date DESC
```

## Related

- [[Obsidian Overview]] - Core concepts
- [[Obsidian Markdown and Linking]] - Links and tags
- [[Obsidian Tips and Workflows]] - Practical patterns
- [[Home]]

#obsidian #intermediate
