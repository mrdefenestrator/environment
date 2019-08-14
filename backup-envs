#!/usr/bin/env bash
# Backs up .env files to an external directory with a timestamp
set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUP_PATH=~/backup-envs
DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
BASE_PATH="${BACKUP_PATH}/${DATE}"

(
  cd ${DIR}
  find . -name .env -exec bash -c \
    "mkdir -p \"${BASE_PATH}/"'$(dirname {})'"\"; cp \"{}\" \"${BASE_PATH}/"'$(dirname {})'"\"" \;
)

echo "Backed up to ${BASE_PATH}"
