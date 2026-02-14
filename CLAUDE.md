# MasterKey - Second Brain for Git, Vim & Obsidian

## Purpose

This is a personal knowledge base (second brain) for learning and practicing Git, Vim, and Obsidian skills. It is managed with Obsidian for navigation and cross-linking.

## Structure

```
MasterKey/
├── Home.md              # Dashboard / Map of Content
├── Git/                 # Everything about Git
│   ├── Git Overview.md
│   ├── Git Setup and Config.md
│   ├── Git Basic Commands.md
│   ├── Git Branching.md
│   ├── Git Merging and Rebasing.md
│   ├── Git Remote Repositories.md
│   ├── Git Stash and Clean.md
│   ├── Git Log and History.md
│   ├── Git Advanced Techniques.md
│   ├── Git Workflows.md
│   └── Git Troubleshooting.md
├── Vim/                 # Everything about Vim
│   ├── Vim Overview.md
│   ├── Vim Modes.md
│   ├── Vim Navigation.md
│   ├── Vim Editing.md
│   ├── Vim Search and Replace.md
│   ├── Vim Buffers Windows Tabs.md
│   ├── Vim Registers and Macros.md
│   ├── Vim Configuration.md
│   ├── Vim Plugins.md
│   └── Vim Advanced Techniques.md
├── Obsidian/             # Everything about Obsidian
│   ├── Obsidian Overview.md
│   ├── Obsidian Markdown and Linking.md
│   ├── Obsidian Navigation and Search.md
│   ├── Obsidian Organization.md
│   ├── Obsidian Plugins.md
│   └── Obsidian Tips and Workflows.md
```

## Conventions

- All notes use Obsidian wiki-links `[[Note Name]]` for cross-referencing
- Tags use `#git`, `#vim`, `#obsidian`, `#beginner`, `#intermediate`, `#advanced`
- Code blocks use the appropriate language identifier (```bash, ```vim, etc.)
- Each note starts with a brief summary, then detailed content, then related links
- Command tables use: Command | Description | Example format

## How to Help

When the user asks to:

- **Add a new topic**: Create a `.md` file in the appropriate folder, use the same formatting conventions, and add wiki-links to/from related notes and Home.md
- **Update a note**: Preserve existing wiki-links and tag conventions
- **Add practice exercises**: Add an `## Exercises` section at the bottom of the relevant note
- **Create cheat sheets**: Use compact table format with Command | Description columns
- **Reorganize**: Keep the folder structure flat within Git/, Vim/, and Obsidian/ — avoid deep nesting

## Git Repository

This vault is intended to also be a Git repository for practicing Git commands. When initializing:

```bash
git init
git add -A
git commit -m "Initial commit: MasterKey vault structure"
```

## Important

- Do NOT modify `.obsidian/` config files unless explicitly asked
- Keep filenames human-readable with spaces (Obsidian handles this well)
- Always maintain cross-links between related notes
