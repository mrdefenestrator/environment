#!/usr/bin/env bash
# Runs ts-node without installing typescript
set -eu

npx -p typescript -p ts-node ts-node
