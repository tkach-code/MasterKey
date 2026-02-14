# Git Workflows

Common branching and collaboration strategies.

## Gitflow

A structured workflow with dedicated branch types:

```
main ─────────────────────────────── (production)
  │
  └── develop ────────────────────── (integration)
        │         │
        └── feature/login          (features branch from develop)
        │         │
        └── release/1.0           (prepare release)
        │
  └── hotfix/critical-bug         (urgent fixes from main)
```

| Branch | Purpose |
|--------|---------|
| `main` | Production-ready code |
| `develop` | Integration branch for features |
| `feature/*` | New features (from develop) |
| `release/*` | Release preparation |
| `hotfix/*` | Urgent production fixes |

Best for: large teams, scheduled releases.

## Trunk-Based Development

Everyone commits to `main` (trunk) frequently with short-lived branches.

```
main: A---B---C---D---E---F---G
           \     /
            X---Y  (short feature branch, 1-2 days max)
```

Rules:
- Branches live at most 1-2 days
- Use feature flags for incomplete work
- Continuous integration is essential

Best for: experienced teams, continuous deployment.

## GitHub Flow

Simple workflow used by GitHub:

1. Create a branch from `main`
2. Make changes and commit
3. Open a Pull Request
4. Discuss and review code
5. Merge to `main`
6. Deploy

```bash
git switch -c feature
# work, commit, push
git push -u origin feature
# open PR on GitHub
# after review, merge and delete branch
```

Best for: small teams, continuous deployment.

## Forking Workflow

Each developer has their own server-side fork:

1. Fork the official repo
2. Clone your fork locally
3. Add upstream remote
4. Create feature branch
5. Push to your fork
6. Open PR to official repo

See [[Git Remote Repositories]] for fork setup commands.

Best for: open source projects.

## Related

- [[Git Branching]] - Branch basics
- [[Git Merging and Rebasing]] - Integration strategies
- [[Git Remote Repositories]] - Working with remotes
- [[Home]]

#git #intermediate #advanced
