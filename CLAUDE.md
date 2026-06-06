# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# MasterKey - Second Brain for Git, Vim & Obsidian

## Purpose

This is a personal knowledge base (second brain) for learning and practicing Git, Vim, Obsidian, and Tmux skills. It is managed with Obsidian for navigation and cross-linking. The vault is also a Git repository so the user can practice Git commands directly on it.

## Structure

```
MasterKey/
├── Home.md              # Dashboard / Map of Content (main entry point)
├── Git/                 # 11 notes covering Git from basics to advanced
├── Vim/                 # 10 notes covering Vim from modes to scripting
├── Obsidian/            # 6 notes covering Obsidian features and workflows
└── Tmux/                # Tmux notes (new section, may be empty)
```

`Home.md` contains a reference table linking to every note and serves as the Map of Content (MOC). When adding new notes, update `Home.md` to include the new link.

## Conventions

- All notes use Obsidian wiki-links `[[Note Name]]` for cross-referencing
- Tags: `#git`, `#vim`, `#obsidian`, `#tmux`, `#beginner`, `#intermediate`, `#advanced`
- Code blocks use the appropriate language identifier (` ```bash `, ` ```vim `, ` ```tmux `, etc.)
- Each note starts with a brief summary, then detailed content, then related links
- Command tables use: `Command | Description | Example` format

## How to Help

- **Add a new topic**: Create a `.md` file in the appropriate folder using the same formatting conventions, add wiki-links to/from related notes, and add an entry to `Home.md`
- **Update a note**: Preserve existing wiki-links and tag conventions
- **Add practice exercises**: Add an `## Exercises` section at the bottom of the relevant note
- **Create cheat sheets**: Use compact table format with `Command | Description` columns
- **Reorganize**: Keep the folder structure flat within each topic folder — avoid deep nesting

## Important

- Do NOT modify `.obsidian/` config files unless explicitly asked
- Keep filenames human-readable with spaces (Obsidian handles this well)
- Always maintain cross-links between related notes
