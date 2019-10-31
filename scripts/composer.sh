#!/usr/bin/env bash

set -e

source ./scripts/helper

function composer_install_global () {
    log_install "$1"
    composer global require "$1"
}

function main () {
    if [ `command -v composer` ]; then
        c.warn "Installing Composer Packages..."

        composer_install_global "laravel/installer"
        composer_install_global "laravel/valet"
        composer_install_global "squizlabs/php_codesniffer"

        c.success "Composer Packages is installed!"
    else
        c.error "[SKIP]: Composer not found!"
    fi
}

# Entrypoint
main;
