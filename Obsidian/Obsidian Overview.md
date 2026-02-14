# Obsidian Overview

Obsidian is a knowledge management application that works on top of local Markdown files. It turns a folder of `.md` files into a connected knowledge base.

## Core Philosophy

- **Local-first** — your files live on your machine, not in the cloud
- **Plain text** — everything is Markdown, no vendor lock-in
- **Link-based thinking** — connect ideas with `[[wiki-links]]`
- **Future-proof** — files are readable by any text editor

## Key Features

| Feature | Description |
|---------|-------------|
| Wiki-links | `[[Note Name]]` to connect notes |
| Graph view | Visual map of all note connections |
| Backlinks | See which notes link to the current one |
| Tags | Organize with `#tags` |
| Search | Full-text search across the vault |
| Templates | Reusable note structures |
| Plugins | Extend with community plugins |
| Themes | Customize appearance |
| Split panes | View multiple notes side by side |

## Vault Structure

A vault is just a folder. Obsidian reads all `.md` files inside it and tracks their links.

```
MyVault/
├── .obsidian/          ← settings (auto-managed)
├── Folder A/
│   ├── Note 1.md
│   └── Note 2.md
├── Folder B/
│   └── Note 3.md
└── Home.md
```

## Getting Started

1. Download Obsidian from [obsidian.md](https://obsidian.md)
2. Open a folder as a vault (or create a new one)
3. Start creating notes with Markdown
4. Link notes together with `[[wiki-links]]`
5. Explore connections in the Graph view

## Obsidian vs Other Tools

| Feature | Obsidian | Notion | Roam |
|---------|----------|--------|------|
| Local files | Yes | No | No |
| Offline access | Full | Limited | Limited |
| Free | Yes (personal) | Freemium | Paid |
| Markdown | Native | Export only | No |
| Customization | Plugins + CSS | Limited | Limited |
| Data ownership | Full | Cloud-dependent | Cloud-dependent |

## Related

- [[Obsidian Markdown and Linking]] - Wiki-links, embeds, formatting
- [[Obsidian Navigation and Search]] - Finding and moving between notes
- [[Obsidian Organization]] - Folders, tags, MOCs
- [[Obsidian Plugins]] - Core and community plugins
- [[Obsidian Tips and Workflows]] - Productivity patterns
- [[Home]]

#obsidian #beginner
