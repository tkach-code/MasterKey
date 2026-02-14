# Git Merging and Rebasing

Two ways to integrate changes from one branch into another.

## Merge

Merge creates a new commit that combines two branches.

```bash
# Merge feature into main
git switch main
git merge feature

# Merge with no fast-forward (always create merge commit)
git merge --no-ff feature

# Abort a merge in progress
git merge --abort
```

### Fast-Forward Merge
When there's a direct path, Git just moves the pointer forward:
```
Before:  main: A---B
                    \
         feat:       C---D

After:   main: A---B---C---D
```

### Three-Way Merge
When branches have diverged, Git creates a merge commit:
```
Before:  main: A---B---E
                    \
         feat:       C---D

After:   main: A---B---E---M
                    \      /
         feat:       C---D
```

## Rebase

Rebase replays your commits on top of another branch, creating a linear history.

```bash
# Rebase feature onto main
git switch feature
git rebase main

# Interactive rebase (edit, squash, reorder commits)
git rebase -i HEAD~3

# Abort a rebase
git rebase --abort

# Continue after resolving conflicts
git rebase --continue
```

### Interactive Rebase Commands

| Command | Description |
|---------|-------------|
| `pick` | Keep the commit as-is |
| `reword` | Change the commit message |
| `edit` | Stop to amend the commit |
| `squash` | Meld into previous commit, keep message |
| `fixup` | Meld into previous commit, discard message |
| `drop` | Remove the commit |

## Resolving Conflicts

When Git can't auto-merge, it marks conflicts in the file:

```
<<<<<<< HEAD
your changes
=======
their changes
>>>>>>> feature
```

Steps to resolve:
1. Open the conflicted file
2. Edit to keep the desired code (remove markers)
3. `git add <file>`
4. `git commit` (for merge) or `git rebase --continue` (for rebase)

## Merge vs Rebase

| | Merge | Rebase |
|---|-------|--------|
| History | Preserves true history | Creates linear history |
| Merge commits | Yes | No |
| Safe for shared branches | Yes | No (rewrites history) |
| Conflict resolution | Once | Per commit |

> **Golden rule**: Never rebase commits that have been pushed to a shared branch.

## Related

- [[Git Branching]] - Branch basics
- [[Git Troubleshooting]] - Fixing merge issues
- [[Git Workflows]] - When to merge vs rebase
- [[Home]]

#git #intermediate
