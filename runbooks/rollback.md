# Rollback runbook

Use this runbook if the latest deployment is unhealthy.

## Inputs
- Current failed tag: `vX.Y.Z`
- Previous stable tag: `vX.Y.(Z-1)` (or last known good)

## 1. Identify failure scope
- Frontend only
- Strapi/API
- Data integrity issue

## 2. Fast rollback (code only)
1. Point service/symlink back to previous release.
2. Restart frontend and affected services.

Example:
```bash
ln -sfn /opt/law-site/releases/vX.Y.(Z-1) /opt/law-site/current
# restart systemd/pm2 service here
```

## 3. Data rollback (if needed)
If migration or data mutation caused issue:
1. Stop write traffic.
2. Restore Postgres from pre-deploy backup.
3. Restore MinIO from pre-deploy backup.
4. Restart services.

## 4. Verification after rollback
- Main pages open.
- API health is normal.
- Admin login works.
- Media loads correctly.

## 5. Follow-up
1. Open `hotfix/<name>` from `main`.
2. Fix root cause.
3. Release patch tag (`vX.Y.(Z+1)`).
4. Merge hotfix back to `develop`.
