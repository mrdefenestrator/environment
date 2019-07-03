#!/usr/bin/env bash
# Provides output like linux netstat -tulpn
set -eu

#netstat -anv | grep LISTEN
sudo lsof -iTCP -sTCP:LISTEN -n -P
