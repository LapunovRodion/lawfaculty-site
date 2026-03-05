# Local infrastructure (Docker Compose)

## Services
- Postgres: `127.0.0.1:5432`
- Strapi: `127.0.0.1:1337`
- MinIO: `127.0.0.1:9000` (API), `127.0.0.1:9001` (console)
- Meilisearch: `127.0.0.1:7700`
- PDF indexer worker: `127.0.0.1:8080`

## Notes
- MinIO uses `coollabsio/minio` because the official `minio/minio` Docker Hub images are no longer published.
- Host ports are bound to localhost by default for safer exposure.

## Start
```bash
cd infra
docker compose --env-file ../.env -f compose.yml up -d
```

## Stop
```bash
cd infra
docker compose -f compose.yml down
```

## Hardening env vars
Add these values to `.env` (examples are in repo `.env.example`):
- `CORS_ORIGINS` - allowed browser origins for Strapi API
- `ADMIN_ALLOWLIST` - comma-separated IPs/CIDRs allowed to `/admin`
- `ADMIN_ACCESS_TOKEN` - optional emergency header token (`x-admin-access-token`)
- `UPLOAD_MAX_FILE_SIZE_BYTES` - max upload size in bytes
- `BODY_JSON_LIMIT`, `BODY_FORM_LIMIT`, `BODY_TEXT_LIMIT` - request body limits
- `AUDIT_LOG_ENABLED`, `AUDIT_LOG_SLOW_MS` - audit logging controls

## Media URLs after host/IP change
If old uploaded files still point to a previous host/IP, update `.env` and run the SQL fixer.

1) Set public URL values in `/opt/law-site/.env`:
- `PUBLIC_SERVER_URL=http://<current-host>:1337`
- `STRAPI_URL=http://<current-host>:1337`

2) Restart Strapi:
```bash
cd /opt/law-site/infra
docker compose --env-file ../.env -f compose.yml restart strapi
```

3) Rewrite legacy media URLs in DB (example old -> new IP):
```bash
cd /opt/law-site
docker exec -i law_postgres psql -U law_site -d law_site \
  -v old_host='10.153.1.86' \
  -v new_host='10.153.1.4' \
  -f - < runbooks/fix-upload-urls.sql
```

## Backups
Scripts are in `infra/backup-scripts/`:
- `pg_backup.sh` - Postgres dumps with retention
- `minio_backup.sh` - MinIO bucket mirror with retention
- `config_backup.sh` - compose/env/docs archive
- `backup_all.sh` - run all backups
- `pg_restore_verify.sh` - restore smoke-check into a temp DB

Example manual run:
```bash
cd /home/arch/site
./infra/backup-scripts/backup_all.sh
./infra/backup-scripts/pg_restore_verify.sh
```

By default backups are stored in `/home/arch/site/.backups`.
Override with `BACKUP_BASE_DIR=/path/to/backups`.

Example cron (daily backups + weekly restore check):
```cron
0 2 * * * cd /home/arch/site && ./infra/backup-scripts/backup_all.sh >> /home/arch/site/.backups/backup.log 2>&1
30 3 * * 0 cd /home/arch/site && ./infra/backup-scripts/pg_restore_verify.sh >> /home/arch/site/.backups/restore-check.log 2>&1
```
