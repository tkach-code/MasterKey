# Obsidian Tips and Workflows

Practical patterns for getting the most out of Obsidian.

## Daily Notes Workflow

Use daily notes as an inbox for thoughts and tasks:

1. Enable Daily notes core plugin
2. Set a template:

```markdown
# {{date:YYYY-MM-DD}}

## Tasks
- [ ]

## Notes

## Links Created
```

3. Open today's note with `Ctrl+Alt+D` (or click calendar)
4. Throughout the day, dump thoughts here
5. At end of day, process: move items to permanent notes, create links

## Progressive Summarization

A method for distilling knowledge over time:

1. **Layer 1** — Save the source material
2. **Layer 2** — Bold the key passages
3. **Layer 3** — Highlight the boldest parts with `==highlight==`
4. **Layer 4** — Write a summary in your own words at the top
5. **Layer 5** — Remix into your own work

Each time you revisit a note, add another layer.

## Linking Best Practices

- **Link as you write** — don't batch-link later
- **Use aliases** for natural reading: `[[Git Branching|branching]]`
- **Check unlinked mentions** regularly in the backlinks pane
- **Create hub notes (MOCs)** when a topic accumulates 5+ notes
- **Link bidirectionally** — if A links to B, consider linking B to A

## Keyboard-Driven Workflow

Minimize mouse usage for speed:

```
Ctrl+O          → open note (quick switcher)
Ctrl+P          → run any command
Ctrl+N          → new note
Ctrl+E          → toggle preview
Ctrl+Shift+F    → vault-wide search
Alt+Left/Right  → navigate back/forward
Ctrl+Click      → open in new pane
```

## Using Obsidian with Vim Mode

Obsidian has a built-in Vim mode:

1. Settings > Editor > Vim key bindings > Enable
2. Now you can use Vim motions in the editor:
   - `hjkl` navigation
   - `d`, `c`, `y` operators
   - `/` search
   - Visual mode selections
   - `:w` to save

> Combine your [[Vim Overview|Vim skills]] with Obsidian for maximum efficiency.

### Useful Vim Commands in Obsidian

| Command | Action |
|---------|--------|
| `gg` | Top of note |
| `G` | Bottom of note |
| `ciw` | Change word |
| `yy` / `p` | Copy/paste line |
| `/pattern` | Search in note |
| `:%s/old/new/g` | Replace in note |

## Using Obsidian with Git

This vault is designed for Git practice. Recommended workflow:

```bash
# Initialize (first time)
cd /path/to/vault
git init
echo ".obsidian/workspace.json" >> .gitignore
git add -A
git commit -m "Initial commit"

# Daily workflow
git add -A
git commit -m "vault: daily update"

# Or use the obsidian-git plugin for automatic backups
```

See [[Git Basic Commands]] and [[Obsidian Plugins|obsidian-git plugin]].

### Recommended .gitignore for Obsidian

```
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.trash/
```

## Spaced Repetition

Use the Spaced Repetition community plugin to review notes:

- Add flashcard syntax to notes:
  ```markdown
  What does `git rebase` do?
  ::
  Replays commits on top of another branch, creating linear history.
  ```
- Review cards on a schedule to reinforce learning

## Quick Capture Tips

- Use the Quick Add community plugin for rapid note creation
- Create hotkeys for common templates
- Use the Inbox pattern: capture first, organize later
- Mobile app for capturing on the go

## Vault Maintenance

Periodic tasks to keep your vault healthy:

- [ ] Review orphan notes (no incoming/outgoing links) in Graph view
- [ ] Process unlinked mentions into proper links
- [ ] Update MOC notes with new entries
- [ ] Archive completed project notes
- [ ] Clean up unused tags

## Related

- [[Obsidian Overview]] - Getting started
- [[Obsidian Plugins]] - Extend functionality
- [[Obsidian Organization]] - Structure strategies
- [[Vim Overview]] - Vim mode in Obsidian
- [[Git Basic Commands]] - Version control for vault
- [[Home]]

#obsidian #intermediate #advanced
