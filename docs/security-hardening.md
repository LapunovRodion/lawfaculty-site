# Security Hardening (Stage 7)

## 1) Reduce network exposure
- All compose service ports are bound to localhost (`127.0.0.1:*`).
- For external access, place a reverse proxy in front and keep direct container ports private.

## 2) Restrict Strapi admin access
- `ADMIN_ALLOWLIST` controls allowed source IPs/CIDRs for `/admin`.
- Optional break-glass token: `ADMIN_ACCESS_TOKEN`.
- Header name: `x-admin-access-token`.
- Middleware: `strapi/src/middlewares/admin-guard.js`.

## 3) Strict CORS and request limits
- `CORS_ORIGINS` defines browser origins allowed to call Strapi.
- Body limits:
  - `BODY_JSON_LIMIT`
  - `BODY_FORM_LIMIT`
  - `BODY_TEXT_LIMIT`
- Upload max size:
  - `UPLOAD_MAX_FILE_SIZE_BYTES`
- Config files:
  - `strapi/config/middlewares.js`
  - `strapi/config/plugins.js`

## 4) Audit logging
- Middleware `strapi/src/middlewares/audit-log.js` logs:
  - auth attempts (`/api/auth/local`)
  - portal operations (`/api/portal/*`)
  - non-GET admin/content-manager calls
  - slow requests above `AUDIT_LOG_SLOW_MS`
- Logs are written to container stdout (`docker logs`).

## 5) Log retention
- Docker logging rotation is enabled in `infra/compose.yml` using `json-file`:
  - `max-size`
  - `max-file`

## 6) Backups and restore verification
- Backup scripts:
  - `infra/backup-scripts/pg_backup.sh`
  - `infra/backup-scripts/minio_backup.sh`
  - `infra/backup-scripts/config_backup.sh`
  - `infra/backup-scripts/backup_all.sh`
- Restore verification:
  - `infra/backup-scripts/pg_restore_verify.sh`
- Restore runbook:
  - `runbooks/restore.md`
- Default backup location: `/home/arch/site/.backups` (override: `BACKUP_BASE_DIR`)

## 7) Secrets rotation policy
- Rotate these secrets periodically and after incidents:
  - `APP_KEYS`
  - `JWT_SECRET`
  - `ADMIN_JWT_SECRET`
  - `API_TOKEN_SALT`
  - `TRANSFER_TOKEN_SALT`
  - `ENCRYPTION_KEY`
  - `MEILI_MASTER_KEY`
  - `MINIO_ROOT_PASSWORD` / `S3_SECRET_ACCESS_KEY`
- After rotation:
  1. Update `.env`
  2. Restart services (`docker compose up -d`)
  3. Revalidate login, upload, portal API, and worker indexing
