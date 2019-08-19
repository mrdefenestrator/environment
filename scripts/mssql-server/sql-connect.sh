#!/usr/bin/env bash
# Docker MSSQL

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/vars.sh

# Login to SQL Server on image
docker exec -it "${NAME}" /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "${PASSWORD}"

