# Git Log and History

Inspecting and navigating the commit history.

## Git Log

```bash
# Basic log
git log

# One line per commit
git log --oneline

# Graph view
git log --oneline --graph --all --decorate

# Last N commits
git log -5

# Log for specific file
git log -- filename.txt

# Log with diff
git log -p

# Log with stats
git log --stat
```

## Formatting Log Output

```bash
# Custom format
git log --pretty=format:"%h %an %ar - %s"
```

| Placeholder | Description |
|-------------|-------------|
| `%H` | Full commit hash |
| `%h` | Short commit hash |
| `%an` | Author name |
| `%ae` | Author email |
| `%ar` | Author date (relative) |
| `%ad` | Author date |
| `%s` | Subject (commit message) |
| `%d` | Ref names (branches, tags) |

## Filtering Log

```bash
# By author
git log --author="Name"

# By date
git log --since="2024-01-01" --until="2024-12-31"

# By commit message
git log --grep="fix"

# Commits that changed a string
git log -S "function_name"

# Commits between two refs
git log main..feature
```

## Blame

See who last modified each line of a file:

```bash
# Full blame
git blame filename.txt

# Blame specific lines
git blame -L 10,20 filename.txt

# Ignore whitespace changes
git blame -w filename.txt
```

## Bisect

Find the commit that introduced a bug using binary search:

```bash
git bisect start
git bisect bad              # current commit is broken
git bisect good abc123      # this commit was working

# Git checks out a middle commit — test it, then:
git bisect good    # or
git bisect bad

# Repeat until Git finds the culprit
# When done:
git bisect reset
```

## Show

```bash
# Show a specific commit
git show abc123

# Show a file at a specific commit
git show HEAD~3:filename.txt

# Show a tag
git show v1.0
```

## Related

- [[Git Basic Commands]] - Core commands
- [[Git Advanced Techniques]] - Reflog and more
- [[Git Troubleshooting]] - Finding bugs
- [[Home]]

#git #intermediate
