# Git Overview

Git is a distributed version control system created by Linus Torvalds in 2005. It tracks changes to files and enables collaboration between developers.

## Core Concepts

### Repository
A repository (repo) is a directory tracked by Git. It contains all files, history, and metadata in a hidden `.git/` folder.

### Three Areas
Git has three main areas where files live:

| Area | Description |
|------|-------------|
| **Working Directory** | Your actual files on disk |
| **Staging Area (Index)** | Files marked to be included in the next commit |
| **Repository (.git)** | The committed history |

### Snapshots, Not Diffs
Git stores **snapshots** of your entire project at each commit, not just the differences. Unchanged files are stored as references to previous versions.

### Everything is Local
Most Git operations work offline. The full history lives on your machine.

### Data Integrity
Every file and commit is checksummed with SHA-1. Nothing can change without Git knowing.

## The Basic Workflow

```
1. Modify files         (Working Directory)
2. Stage changes        (git add)
3. Commit snapshot      (git commit)
```

## File States

| State | Meaning |
|-------|---------|
| **Untracked** | Git doesn't know about this file |
| **Unmodified** | File matches the last commit |
| **Modified** | File changed since last commit |
| **Staged** | File is marked for next commit |

## Related

- [[Git Setup and Config]] - Get started with Git
- [[Git Basic Commands]] - Essential daily commands
- [[Home]]

#git #beginner
