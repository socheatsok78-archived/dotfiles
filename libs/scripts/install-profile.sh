#!/usr/bin/env bash
set -e

source "libs/shared/homebrew.env"

ohai "Installing ZSH Profile..."
stow --target ${HOME} --ignore .DS_Store -Rv home
