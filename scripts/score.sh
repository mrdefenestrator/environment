#!/usr/bin/env bash
set -eu
wc -l `find . -name \*.ts | grep -v node_modules | grep -v BACKUP | grep -v BASE | grep -v REMOTE | grep -v LOCAL`
