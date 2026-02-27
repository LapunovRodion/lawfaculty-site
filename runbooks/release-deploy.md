# Release deployment runbook

This runbook is for deploying a tagged release to server.

## Inputs
- Release tag: `vX.Y.Z`
- Server path: `/opt/law-site`
- Shared env file: `/opt/law-site/shared/.env`

## 1. Pre-deploy checks
1. Confirm tag exists and points to intended commit.
2. Confirm backups are available or create fresh backups.
3. Confirm release notes are prepared.

## 2. Create backups (mandatory)
```bash
cd /opt/law-site/current
./infra/backup-scripts/backup_all.sh
```

## 3. Prepare release directory
```bash
mkdir -p /opt/law-site/releases/vX.Y.Z
git clone <REPO_URL> /opt/law-site/releases/vX.Y.Z
cd /opt/law-site/releases/vX.Y.Z
git checkout vX.Y.Z
```

## 4. Inject environment
```bash
cp /opt/law-site/shared/.env /opt/law-site/releases/vX.Y.Z/.env
```

## 5. Deploy infrastructure services
```bash
cd /opt/law-site/releases/vX.Y.Z/infra
docker compose --env-file ../.env -f compose.yml up -d
```

## 6. Build and run frontend
```bash
cd /opt/law-site/releases/vX.Y.Z/web
npm ci
npm run build
```
Run with your process manager (systemd/pm2) pointing to this release.

## 7. Switch current symlink
```bash
ln -sfn /opt/law-site/releases/vX.Y.Z /opt/law-site/current
```

## 8. Smoke checks
- `/<locale>`
- `/[locale]/news`
- `/[locale]/departments`
- `/[locale]/persons`
- `/[locale]/persons/[slug]`
- Strapi admin `/admin`
- Media rendering from MinIO

## 9. Post-deploy record
Store in release notes:
- deployed tag
- server timestamp
- backup IDs
- known issues (if any)
