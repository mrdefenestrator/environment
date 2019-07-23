#!/usr/bin/env bash
# Prints the MD5 Hex representation of the specified ssh public key file
set -eu

ssh-keygen -l -E md5 -f "${1}"
