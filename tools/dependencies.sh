#!/usr/bin/env bash

set -e

# Installing dependencies
./scripts/zsh.sh
./scripts/xcode.sh
./scripts/brew.sh
./scripts/npm.sh
./scripts/other.sh
