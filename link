#!/usr/bin/env bash
# Create symlinks
set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function backup_and_link {
  if [[ -L "${HOME}/$1" ]]
  then
    echo "$1 already done"
  else
    cp -r "${HOME}/$1" "${HOME}/$1.bak"
    ln -sf "${DIR}/$1" "${HOME}/$1"
    echo "linked $1"
  fi
}

backup_and_link .profile
backup_and_link .git-status
backup_and_link .nanorc
backup_and_link .gitconfig
