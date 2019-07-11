#!/usr/bin/env bash
# Script for posting deployment keys to github repos
# Args:
#  namespace/repo
#  key-title
#  key-value
set -eu

hub api \
  -X POST "/repos/${1}/keys"
  -F title="${2}" \
  -F read_only=true \
  -F key="${3}"
