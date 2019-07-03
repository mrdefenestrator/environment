#!/usr/bin/env bash
# Creates an ftp server for testing function execution against
set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker pull stilliard/pure-ftpd:hardened
docker run -d --name ftpd_server -p 21:21 -p 30000-30009:30000-30009 -e "PUBLICHOST=localhost" stilliard/pure-ftpd:hardened
${DIR}/create-user.exp
exit 0
