#!/usr/bin/env bash

source ./scripts/helper

function npm_install_global () {
    c.info "Installing $1..."
    npm install -g "$1"
    c.success "$1 successfully installed!"
}


function install_npm_packages () {
    npm_install_global http-server  # serve all everything
    npm_install_global ndb          # improved debugging experience for Node.js
    # npm_install_global tiny-care-terminal    # A little dashboard that tries to take care of you when you're using your terminal.
}

function main () {
    if [ `command -v npm` ]; then
        c.warn "Installing NPM Packages..."
        install_npm_packages
        c.success "NPM Packages is installed!"
    else
        c.error "[SKIP]: NPM not found!"
    fi
}

# Entrypoint
main;
