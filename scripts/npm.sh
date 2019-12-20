#!/usr/bin/env bash

source ./scripts/helper

node_version () {
    c.info "Node: $(node -v)"
    c.info "NPM: $(npm -v)"
}

function npm_install () {
    log_install "$1"
    npm install -g "$1"
}


function install_npm_packages () {
    npm_install 'http-server'           # serve all everything
    npm_install 'ndb'                   # improved debugging experience for Node.js
    npm_install 'typescript'            # TypeScript CLI
    npm_install '@vue/cli'              # Vue CLI
    npm_install 'insomnia-documenter'   # Tool to create API documentation pages for Insomnia workspace export file.
    # npm_install 'tiny-care-terminal'    # A little dashboard that tries to take care of you when you're using your terminal.
}

function main () {
    if [ `command -v npm` ]; then
        node_version

        c.warn "Installing NPM Packages..."
        install_npm_packages
        c.success "NPM Packages is installed!"
    else
        c.error "[SKIP]: NPM not found!"
    fi
}

# Entrypoint
main;
