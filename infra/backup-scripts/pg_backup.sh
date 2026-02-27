#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)
if [[ -f "$ROOT_DIR/.env" ]]; then
  set -a
  # shellcheck disable=SC1091
  source "$ROOT_DIR/.env"
  set +a
fi

BACKUP_BASE_DIR=${BACKUP_BASE_DIR:-$ROOT_DIR/.backups}
BACKUP_DIR=${BACKUP_DIR:-$BACKUP_BASE_DIR/postgres}
KEEP_DAYS=${KEEP_DAYS:-7}
TS=$(date +"%Y%m%d_%H%M%S")

mkdir -p "$BACKUP_DIR"

PGHOST=${PGHOST:-localhost}
PGPORT=${PGPORT:-5432}
PGDATABASE=${POSTGRES_DB:-law_site}
PGUSER=${POSTGRES_USER:-law_site}
PG_CONTAINER=${PG_CONTAINER:-law_postgres}

export PGPASSWORD=${POSTGRES_PASSWORD:-}

DUMP_FILE="$BACKUP_DIR/${PGDATABASE}_${TS}.dump"

if command -v pg_dump >/dev/null 2>&1; then
  pg_dump -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -F c -f "$DUMP_FILE" "$PGDATABASE"
elif command -v docker >/dev/null 2>&1; then
  docker exec -e PGPASSWORD="$PGPASSWORD" "$PG_CONTAINER" \
    pg_dump -U "$PGUSER" -F c "$PGDATABASE" >"$DUMP_FILE"
else
  echo "pg_dump not found and docker fallback unavailable"
  exit 1
fi

find "$BACKUP_DIR" -type f -name "*.dump" -mtime +"$KEEP_DAYS" -delete
