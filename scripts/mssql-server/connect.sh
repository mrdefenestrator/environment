#!/usr/bin/env bash
# Docker MSSQL

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/vars.sh

# Connect to container image
docker exec -it ${NAME} "bash"
