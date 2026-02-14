# Git Basic Commands

The commands you'll use every day.

## Creating a Repository

```bash
# Initialize a new repo
git init

# Clone an existing repo
git clone https://github.com/user/repo.git
git clone git@github.com:user/repo.git
```

## Checking Status

```bash
# See current state
git status

# Short format
git status -s
```

Status short format flags:
| Flag | Meaning |
|------|---------|
| `??` | Untracked |
| `A` | Added to staging |
| `M` | Modified |
| `D` | Deleted |
| `R` | Renamed |

## Staging Changes

```bash
# Stage specific file
git add filename.txt

# Stage all changes in current directory
git add .

# Stage parts of a file interactively
git add -p filename.txt

# Unstage a file
git restore --staged filename.txt
```

## Committing

```bash
# Commit with message
git commit -m "Add feature X"

# Commit with editor (opens vim)
git commit

# Stage all tracked files and commit
git commit -am "Update feature X"

# Amend the last commit
git commit --amend
```

### Writing Good Commit Messages

```
<type>: <short summary> (50 chars max)

<optional body explaining why, not what> (72 chars per line)
```

Common types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`

## Viewing Changes

```bash
# Changes not yet staged
git diff

# Changes staged for commit
git diff --staged

# Diff between branches
git diff main..feature-branch

# Diff specific file
git diff -- filename.txt
```

## Removing and Moving Files

```bash
# Remove file from Git and disk
git rm filename.txt

# Remove from Git but keep on disk
git rm --cached filename.txt

# Rename/move
git mv old_name.txt new_name.txt
```

## Related

- [[Git Overview]] - Core concepts
- [[Git Branching]] - Work with branches
- [[Git Log and History]] - View commit history
- [[Home]]

#git #beginner
