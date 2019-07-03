#!/usr/bin/env bash
# Starts Chrome with CORS protection disabled
set -eu

open -a Google\ Chrome --args --disable-web-security --user-data-dir
