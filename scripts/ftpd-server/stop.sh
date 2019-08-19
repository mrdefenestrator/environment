#!/usr/bin/env bash
# Tears down the ftp server the setup script created
set -eu

docker stop ftpd_server
docker rm ftpd_server
exit 0
