#!/usr/bin/env bash

set -e

source ./scripts/helper

# Install cheat.sh CLI tool
function install_cheat_sh () {
    c.log "Installing cht.sh..."
    curl -s -o "$LOCAL_BIN/cht.sh" https://cht.sh/:cht.sh && \
        chmod +x "$LOCAL_BIN/cht.sh"
}

# Install GitIgnore Command Line
function install_gitignore () {
    c.log "Installing git ignore alias..."
    git config --global alias.ignore '!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi'
}

function main () {
    c.info "Installing Third-party libraries & tools..."
    make_local_bin

    install_gitignore
    install_cheat_sh

    c.success "Third-party libraries & tools successfully installed!"
}

# Entrypoint
main;
