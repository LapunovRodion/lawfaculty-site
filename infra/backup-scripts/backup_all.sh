#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)
cd "$ROOT_DIR"

./infra/backup-scripts/pg_backup.sh
./infra/backup-scripts/minio_backup.sh
./infra/backup-scripts/config_backup.sh

echo "All backups completed"
