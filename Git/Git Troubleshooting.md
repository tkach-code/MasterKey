# Git Troubleshooting

Common problems and how to fix them.

## Undo Last Commit

```bash
# Undo commit, keep changes staged
git reset --soft HEAD~1

# Undo commit, keep changes unstaged
git reset HEAD~1

# Undo commit and discard changes (destructive!)
git reset --hard HEAD~1
```

## Accidentally Committed to Wrong Branch

```bash
# Move last commit to correct branch
git switch correct-branch
git cherry-pick main        # grab the commit
git switch main
git reset --hard HEAD~1     # remove from wrong branch
```

## Recover Deleted Branch

```bash
# Find the commit hash in reflog
git reflog

# Recreate the branch
git switch -c recovered-branch abc123
```

## Undo a Merge

```bash
# If not yet pushed
git reset --hard HEAD~1

# If already pushed (creates a revert commit)
git revert -m 1 HEAD
```

## Fix Commit Message

```bash
# Last commit only
git commit --amend -m "New message"

# Older commits (interactive rebase)
git rebase -i HEAD~3
# Change 'pick' to 'reword' for the target commit
```

## Remove File from Git History

```bash
# Remove sensitive file from all history
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch secrets.txt' \
  --prune-empty --tag-name-filter cat -- --all

# Better alternative: use git-filter-repo
pip install git-filter-repo
git filter-repo --path secrets.txt --invert-paths
```

## Resolve "Detached HEAD"

```bash
# You're not on any branch
# Option 1: Create a branch here
git switch -c new-branch

# Option 2: Go back to a branch
git switch main
```

## Fix "You have divergent branches"

```bash
# Choose merge strategy
git config pull.rebase false   # merge (default)
git config pull.rebase true    # rebase
git config pull.ff only        # fast-forward only
```

## Common Error Messages

| Error | Solution |
|-------|----------|
| `fatal: not a git repository` | Run `git init` or cd to repo |
| `error: failed to push` | Pull first: `git pull --rebase` |
| `CONFLICT` | Resolve conflicts, then `git add` + `git commit` |
| `Permission denied (publickey)` | Check SSH key setup: [[Git Setup and Config]] |
| `fatal: refusing to merge unrelated histories` | Add `--allow-unrelated-histories` |

## Nuclear Options (Use with Caution)

```bash
# Discard ALL local changes
git checkout -- .
git clean -fd

# Reset to match remote exactly
git fetch origin
git reset --hard origin/main
```

## Related

- [[Git Advanced Techniques]] - Reflog for recovery
- [[Git Merging and Rebasing]] - Conflict resolution
- [[Git Stash and Clean]] - Saving work temporarily
- [[Home]]

#git #intermediate #advanced
