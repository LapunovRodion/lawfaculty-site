# Git workflow and versioning policy

This repository follows a release-branch model with semantic versioning.

## Branches
- `main` - production-ready code only.
- `develop` - integration branch for upcoming release.
- `feature/<name>` - feature branches, merge to `develop`.
- `release/<version>` - release hardening branch (e.g. `release/0.2.0`).
- `hotfix/<name>` - urgent production fixes, merge to `main` and `develop`.

## Merge rules
1. `feature/*` -> `develop` via PR.
2. `develop` -> `release/<version>` when release freeze starts.
3. `release/<version>` -> `main` when accepted.
4. Tag release in `main` as `vX.Y.Z`.
5. Merge release/hotfix back into `develop`.

## Versioning (SemVer)
- `MAJOR`: breaking changes.
- `MINOR`: new backward-compatible features.
- `PATCH`: backward-compatible fixes.

## Commit convention
- `feat: ...`
- `fix: ...`
- `refactor: ...`
- `docs: ...`
- `chore: ...`

## Pull request checklist
- Scope and risk are described.
- Migration/data impact is described.
- Rollback strategy is described.
- Build/check commands pass.

## Required release artifacts
Every release must have:
1. Git tag (`vX.Y.Z`).
2. Release notes/changelog.
3. Backup references taken before deploy.
