#!/usr/bin/env bash
# Docker MSSQL

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/vars.sh

# Stop the container
docker stop ${NAME}

# Remove the container
docker rm ${NAME}
