#!/usr/bin/env bash
# Docker MSSQL

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source ${DIR}/vars.sh

# Download the container
docker pull microsoft/mssql-server-linux:2017-latest

# Run the container
docker run -e 'ACCEPT_EULA=Y' -e "MSSQL_SA_PASSWORD=${PASSWORD}" \
   -p 1401:1433 --name "${NAME}" \
   -d microsoft/mssql-server-linux:2017-latest

# List containers
docker ps -a

# Add mssql tools to path
docker exec -it "${NAME}" sh -c 'echo export PATH="$PATH:/opt/mssql-tools/bin" >> ${HOME}/.bashrc'

# Allow access to server outside the container
docker exec -it "${NAME}" /opt/mssql-tools/bin/sqlcmd -S "${EN0_IP},1401" -U SA -P "${PASSWORD}"
