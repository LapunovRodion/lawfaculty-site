# Restore Runbook

## Preconditions
- Backups exist on disk:
  - Postgres dumps in `/home/arch/site/.backups/postgres`
  - MinIO mirrors in `/home/arch/site/.backups/minio`
  - Config archives in `/home/arch/site/.backups/config`
- `.env` file is present for target environment.

Load env once before commands:
```bash
set -a
source /home/arch/site/.env
set +a
```

## 1) Stop write traffic
1. Disable public entrypoint/reverse proxy or maintenance mode.
2. Stop app services that write data:
   ```bash
   cd /home/arch/site/infra
   docker compose --env-file ../.env -f compose.yml stop strapi pdf-indexer
   ```

## 2) Restore Postgres
1. Pick a dump:
   ```bash
   ls -1t /home/arch/site/.backups/postgres/*.dump | head -n 5
   ```
2. Recreate database:
   ```bash
   docker exec -i law_postgres psql -U "$POSTGRES_USER" -d postgres -c "DROP DATABASE IF EXISTS $POSTGRES_DB;"
   docker exec -i law_postgres psql -U "$POSTGRES_USER" -d postgres -c "CREATE DATABASE $POSTGRES_DB;"
   ```
3. Restore:
   ```bash
   DUMP=/home/arch/site/.backups/postgres/<your_dump>.dump
   docker exec -i law_postgres pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" < "$DUMP"
   ```

## 3) Restore MinIO objects
1. Pick a snapshot directory:
   ```bash
   ls -1dt /home/arch/site/.backups/minio/* | head -n 5
   ```
2. Mirror into bucket:
   ```bash
   SNAPSHOT=/home/arch/site/.backups/minio/<timestamp>
   mc alias set local "$S3_ENDPOINT" "$S3_ACCESS_KEY_ID" "$S3_SECRET_ACCESS_KEY"
   mc mirror --overwrite "$SNAPSHOT" "local/$S3_BUCKET"
   ```

## 4) Bring services back
```bash
cd /home/arch/site/infra
docker compose --env-file ../.env -f compose.yml up -d
```

## 5) Verify
1. Containers healthy:
   ```bash
   docker ps --format 'table {{.Names}}\t{{.Status}}'
   ```
2. API basic checks:
   ```bash
   curl -s -o /dev/null -w '%{http_code}\n' http://127.0.0.1:1337/admin
   curl -s -o /dev/null -w '%{http_code}\n' http://127.0.0.1:8080/health
   ```
3. App checks:
   - portal login
   - open news/material pages
   - file download from MinIO-backed storage

## 6) Post-restore actions
- Trigger full index rebuild (if needed) via pdf-indexer `/reindex`.
- Re-enable traffic.
- Record incident details and restored backup timestamps.
