#!/usr/bin/env bash

set -e

source ./scripts/helper

if ! grep "socheatsok78/dotfile" < "$HOME/.zshrc" 1>/dev/null; then
    echo '# socheatsok78/dotfile' >> "$HOME/.zshrc"
    echo 'test -e "$HOME/.zsh_profile" && source "$HOME/.zsh_profile"' >> "$HOME/.zshrc"
fi
