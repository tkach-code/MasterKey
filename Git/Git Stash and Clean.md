# Git Stash and Clean

Temporarily shelve changes or clean up untracked files.

## Stash

Stash saves your uncommitted changes and reverts to a clean working directory.

```bash
# Stash current changes
git stash

# Stash with a message
git stash push -m "work in progress on login"

# Stash including untracked files
git stash -u

# Stash including ignored files
git stash -a
```

### Managing Stashes

```bash
# List all stashes
git stash list

# Apply most recent stash (keep in stash list)
git stash apply

# Apply specific stash
git stash apply stash@{2}

# Apply and remove from stash list
git stash pop

# View stash contents
git stash show -p stash@{0}

# Drop a specific stash
git stash drop stash@{1}

# Clear all stashes
git stash clear
```

### Stash to a New Branch

```bash
# Create branch from stash (useful for conflicts)
git stash branch new-feature stash@{0}
```

## Clean

Remove untracked files from the working directory.

```bash
# Preview what would be removed (dry run)
git clean -n

# Remove untracked files
git clean -f

# Remove untracked files and directories
git clean -fd

# Remove ignored files too
git clean -fX

# Remove everything not tracked
git clean -fdx

# Interactive mode
git clean -i
```

> Always run `git clean -n` first to preview what will be deleted.

## Restoring Files

```bash
# Discard changes in working directory
git restore filename.txt

# Restore file from specific commit
git restore --source=HEAD~2 filename.txt

# Unstage a file
git restore --staged filename.txt
```

## Related

- [[Git Basic Commands]] - Core commands
- [[Git Branching]] - Stash before switching
- [[Git Troubleshooting]] - Recovery tips
- [[Home]]

#git #intermediate
