#!/usr/bin/env bash

WORKING_DIR=`dirname $0`

cd $WORKING_DIR
source "libs/shared/homebrew.env"

#-------------------------------------------------- traps
#-------------------------------------------------- pre-flight
#----- Dotfiles Submodules
if [ -f ".gitmodules" ]; then
    ohai "Fetching dotfiles submodules..."
    git submodule init \
    && git submodule update
fi
# -------------------------------------------------- setup
