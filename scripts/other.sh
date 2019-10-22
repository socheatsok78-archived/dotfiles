#!/usr/bin/env bash

set -e

# Install cheat.sh CLI tool
function install_cheat_sh () {
    curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh && \
        chmod +x /usr/local/bin/cht.sh
}

# Install GitIgnore Command Line
function install_gitignore () {
    git config --global alias.ignore \
        '!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi'
}

function main () {
    install_gitignore
    install_cheat_sh
}

# Entrypoint
main;
