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
BACKUP_DIR=${BACKUP_DIR:-$BACKUP_BASE_DIR/config}
KEEP_DAYS=${KEEP_DAYS:-14}
TS=$(date +"%Y%m%d_%H%M%S")

mkdir -p "$BACKUP_DIR"

ARCHIVE="$BACKUP_DIR/config_${TS}.tar.gz"

tar -czf "$ARCHIVE" \
  -C "$ROOT_DIR" \
  infra/compose.yml \
  .env \
  infra/README-deploy.md 2>/dev/null || true

find "$BACKUP_DIR" -type f -name "config_*.tar.gz" -mtime +"$KEEP_DAYS" -delete
