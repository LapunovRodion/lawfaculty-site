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
BACKUP_DIR=${BACKUP_DIR:-$BACKUP_BASE_DIR/minio}
KEEP_DAYS=${KEEP_DAYS:-7}

MINIO_ENDPOINT=${MINIO_ENDPOINT:-http://127.0.0.1:9000}
MINIO_ACCESS_KEY=${S3_ACCESS_KEY_ID:-minioadmin}
MINIO_SECRET_KEY=${S3_SECRET_ACCESS_KEY:-}
MINIO_BUCKET=${S3_BUCKET:-law-site}

TS=$(date +"%Y%m%d_%H%M%S")
DEST="$BACKUP_DIR/$TS"
mkdir -p "$DEST"

if command -v mc >/dev/null 2>&1; then
  mc alias set local "$MINIO_ENDPOINT" "$MINIO_ACCESS_KEY" "$MINIO_SECRET_KEY"
  mc mirror --overwrite "local/$MINIO_BUCKET" "$DEST"
elif command -v docker >/dev/null 2>&1; then
  MC_CONFIG_DIR="$BACKUP_DIR/.mc"
  mkdir -p "$MC_CONFIG_DIR"
  docker run --rm --network host -v "$MC_CONFIG_DIR:/root/.mc" minio/mc \
    alias set local "$MINIO_ENDPOINT" "$MINIO_ACCESS_KEY" "$MINIO_SECRET_KEY" >/dev/null
  docker run --rm --network host -v "$MC_CONFIG_DIR:/root/.mc" -v "$BACKUP_DIR:/backup" minio/mc \
    mirror --overwrite "local/$MINIO_BUCKET" "/backup/$TS"
else
  echo "MinIO backup requires either mc or docker"
  exit 1
fi

find "$BACKUP_DIR" -maxdepth 1 -type d -mtime +"$KEEP_DAYS" -exec rm -rf {} +
