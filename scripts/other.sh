#!/usr/bin/env bash

set -e

source ./scripts/helper

# Install cheat.sh CLI tool
function install_cheat_sh () {
    log_install "cht.sh"
    curl -s -o "$LOCAL_BIN/cht.sh" https://cht.sh/:cht.sh && \
        chmod +x "$LOCAL_BIN/cht.sh"
}

# Install GitIgnore Command Line
function install_gitignore () {
    log_install "git-ignore alias"
    git config --global alias.ignore '!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi'

    log_install "git-accept-ours alias"
    git config --global alias.accept-ours '!f() { [ -z "$@" ] && set - '.'; git checkout --ours -- "$@"; git add -u -- "$@"; }; f'

    log_install "git-accept-theirs alias"
    git config --global alias.accept-theirs '!f() { [ -z "$@" ] && set - '.'; git checkout --theirs -- "$@"; git add -u -- "$@"; }; f'
}

function main () {
    c.warn "Installing Third-party libraries & tools..."
    make_local_bin

    install_gitignore
    install_cheat_sh

    c.success "Third-party libraries & tools successfully installed!"
}

# Entrypoint
main;
