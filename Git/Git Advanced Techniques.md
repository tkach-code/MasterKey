# Git Advanced Techniques

Power-user features for complex scenarios.

## Cherry-Pick

Apply a specific commit from another branch:

```bash
# Pick a single commit
git cherry-pick abc123

# Pick without committing (stage only)
git cherry-pick --no-commit abc123

# Pick a range of commits
git cherry-pick A..B
```

## Reflog

Git's safety net — records every HEAD movement:

```bash
# View reflog
git reflog

# Show reflog for specific branch
git reflog show feature

# Recover a deleted branch
git switch -c recovered-branch HEAD@{5}

# Undo a bad rebase
git reset --hard HEAD@{3}
```

> Reflog entries expire after 90 days by default.

## Tags

```bash
# List tags
git tag

# Lightweight tag
git tag v1.0

# Annotated tag (recommended)
git tag -a v1.0 -m "Release 1.0"

# Tag a specific commit
git tag -a v0.9 abc123

# Push tags
git push origin v1.0
git push origin --tags

# Delete tag
git tag -d v1.0
git push origin --delete v1.0
```

## Submodules

Include another Git repo inside yours:

```bash
# Add submodule
git submodule add https://github.com/user/lib.git libs/lib

# Clone repo with submodules
git clone --recurse-submodules https://github.com/user/repo.git

# Initialize submodules after clone
git submodule init
git submodule update

# Update all submodules
git submodule update --remote
```

## Git Hooks

Scripts that run automatically on Git events. Located in `.git/hooks/`.

| Hook | Trigger |
|------|---------|
| `pre-commit` | Before commit is created |
| `commit-msg` | After commit message is entered |
| `pre-push` | Before push to remote |
| `post-merge` | After a merge completes |
| `pre-rebase` | Before rebase starts |

Example pre-commit hook:
```bash
#!/bin/bash
# .git/hooks/pre-commit
# Run linter before committing
npm run lint
if [ $? -ne 0 ]; then
    echo "Lint failed. Fix errors before committing."
    exit 1
fi
```

## Worktrees

Work on multiple branches simultaneously without stashing:

```bash
# Create a worktree
git worktree add ../feature-dir feature-branch

# List worktrees
git worktree list

# Remove a worktree
git worktree remove ../feature-dir
```

## Related

- [[Git Log and History]] - Inspecting history
- [[Git Merging and Rebasing]] - Interactive rebase
- [[Git Troubleshooting]] - Recovery with reflog
- [[Home]]

#git #advanced
