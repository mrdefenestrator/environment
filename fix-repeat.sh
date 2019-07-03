#!/usr/bin/env bash
# Enable key-repeat on hold
set -eu

defaults write -g ApplePressAndHoldEnabled -bool false
