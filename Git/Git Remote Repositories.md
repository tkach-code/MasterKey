# Git Remote Repositories

Working with remote repositories (GitHub, GitLab, etc.).

## Managing Remotes

```bash
# List remotes
git remote -v

# Add a remote
git remote add origin git@github.com:user/repo.git

# Rename a remote
git remote rename origin upstream

# Remove a remote
git remote remove upstream

# Show remote details
git remote show origin
```

## Fetching and Pulling

```bash
# Fetch (download changes, don't merge)
git fetch origin

# Fetch all remotes
git fetch --all

# Pull (fetch + merge)
git pull origin main

# Pull with rebase instead of merge
git pull --rebase origin main
```

> Prefer `git fetch` + `git merge` over `git pull` for more control.

## Pushing

```bash
# Push to remote
git push origin main

# Push and set upstream tracking
git push -u origin feature

# Push all branches
git push --all origin

# Push tags
git push origin --tags

# Delete remote branch
git push origin --delete feature
```

## Tracking Branches

```bash
# See tracking info
git branch -vv

# Set upstream for current branch
git branch --set-upstream-to=origin/main

# Create local branch tracking remote
git switch --track origin/feature
```

## Forking Workflow

```bash
# 1. Fork repo on GitHub
# 2. Clone your fork
git clone git@github.com:you/repo.git

# 3. Add original repo as upstream
git remote add upstream git@github.com:original/repo.git

# 4. Keep your fork updated
git fetch upstream
git switch main
git merge upstream/main
git push origin main
```

## Related

- [[Git Basic Commands]] - Local commands
- [[Git Branching]] - Branch management
- [[Git Workflows]] - Collaboration patterns
- [[Home]]

#git #intermediate
