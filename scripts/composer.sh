#!/usr/bin/env bash

set -e

source ./scripts/helper

function composer_install_global () {
    c.info "Installing $1..."
    composer global require "$1"
    c.success "$1 successfully installed!"
}

function main () {
    if [ `command -v composer` ]; then
        composer_install_global "laravel/installer"
        composer_install_global "laravel/valet"
    else
        c.error "[SKIP]: Composer not found!"
    fi
}

# Entrypoint
main;
