#!/usr/bin/env bash

source ./scripts/helper

function install_npm_packages () {
    npm install -g http-server  # serve all everything
    npm install -g ndb          # improved debugging experience for Node.js
    # npm install -g tiny-care-terminal    # A little dashboard that tries to take care of you when you're using your terminal.
}

function main () {
    if [ `command -v npm` ]; then
        c.info "Installing NPM Packages..."
        install_npm_packages
        c.success "NPM Packages is installed!"
    else
        c.error "[SKIP]: NPM not found!"
    fi
}

# Entrypoint
main;
