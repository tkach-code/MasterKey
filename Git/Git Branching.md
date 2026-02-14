# Git Branching

Branches let you diverge from the main line of development and work independently.

## How Branches Work

A branch is simply a pointer to a commit. `HEAD` points to the branch you're currently on.

```
main:      A---B---C
                    \
feature:             D---E
```

## Branch Commands

| Command | Description |
|---------|-------------|
| `git branch` | List local branches |
| `git branch -a` | List all branches (including remote) |
| `git branch feature` | Create new branch |
| `git switch feature` | Switch to branch |
| `git switch -c feature` | Create and switch |
| `git branch -d feature` | Delete branch (safe) |
| `git branch -D feature` | Delete branch (force) |
| `git branch -m old new` | Rename branch |

## Switching Branches

```bash
# Modern way (Git 2.23+)
git switch feature
git switch -c new-feature    # create + switch

# Classic way
git checkout feature
git checkout -b new-feature  # create + switch
```

> `git switch` is preferred over `git checkout` for branches — it's clearer and safer.

## Viewing Branch Info

```bash
# Branches with last commit
git branch -v

# Branches merged into current
git branch --merged

# Branches not yet merged
git branch --no-merged

# Which branch contains a commit
git branch --contains abc123
```

## Best Practices

- Keep `main` deployable at all times
- Use descriptive branch names: `fix/login-bug`, `feat/user-profile`
- Delete branches after merging
- Pull latest `main` before creating a new branch

## Related

- [[Git Merging and Rebasing]] - Combine branches
- [[Git Basic Commands]] - Daily commands
- [[Git Workflows]] - Branching strategies
- [[Home]]

#git #beginner #intermediate
