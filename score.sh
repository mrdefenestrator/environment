#!/usr/bin/env bash
# Counts lines of code
set -eu

wc -l `find . -name \*.ts | grep -v node_modules | grep -v BACKUP | grep -v BASE | grep -v REMOTE | grep -v LOCAL`
