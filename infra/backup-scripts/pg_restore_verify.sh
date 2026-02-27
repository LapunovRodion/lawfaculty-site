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
PGHOST=${PGHOST:-localhost}
PGPORT=${PGPORT:-5432}
PGUSER=${POSTGRES_USER:-law_site}
PGPASSWORD=${POSTGRES_PASSWORD:-}
PG_CONTAINER=${PG_CONTAINER:-law_postgres}

export PGPASSWORD

LATEST_DUMP=$(ls -1t "$BACKUP_DIR"/*.dump 2>/dev/null | head -n 1 || true)
if [[ -z "$LATEST_DUMP" ]]; then
  echo "No dumps found in $BACKUP_DIR"
  exit 1
fi

TMP_DB="restore_verify_$(date +%s)"
echo "Using dump: $LATEST_DUMP"
echo "Creating temp DB: $TMP_DB"

if command -v createdb >/dev/null 2>&1 && command -v pg_restore >/dev/null 2>&1; then
  createdb -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" "$TMP_DB"
  trap 'dropdb -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" --if-exists "$TMP_DB" >/dev/null 2>&1 || true' EXIT

  pg_restore -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$TMP_DB" "$LATEST_DUMP" >/dev/null
  TABLE_COUNT=$(psql -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" -d "$TMP_DB" -tAc "select count(*) from information_schema.tables where table_schema='public';")
  echo "Restore check OK. public tables: $TABLE_COUNT"

  dropdb -h "$PGHOST" -p "$PGPORT" -U "$PGUSER" "$TMP_DB"
  trap - EXIT
elif command -v docker >/dev/null 2>&1; then
  docker exec -e PGPASSWORD="$PGPASSWORD" "$PG_CONTAINER" psql -U "$PGUSER" -d postgres -c "CREATE DATABASE $TMP_DB;" >/dev/null
  trap 'docker exec -e PGPASSWORD="$PGPASSWORD" "$PG_CONTAINER" psql -U "$PGUSER" -d postgres -c "DROP DATABASE IF EXISTS '"'"'"$TMP_DB"'"'"';" >/dev/null 2>&1 || true' EXIT

  docker exec -i -e PGPASSWORD="$PGPASSWORD" "$PG_CONTAINER" pg_restore -U "$PGUSER" -d "$TMP_DB" <"$LATEST_DUMP"
  TABLE_COUNT=$(docker exec -e PGPASSWORD="$PGPASSWORD" "$PG_CONTAINER" psql -U "$PGUSER" -d "$TMP_DB" -tAc "select count(*) from information_schema.tables where table_schema='public';")
  echo "Restore check OK (docker fallback). public tables: $TABLE_COUNT"

  docker exec -e PGPASSWORD="$PGPASSWORD" "$PG_CONTAINER" psql -U "$PGUSER" -d postgres -c "DROP DATABASE IF EXISTS $TMP_DB;" >/dev/null
  trap - EXIT
else
  echo "No restore tools available (createdb/pg_restore or docker required)"
  exit 1
fi
