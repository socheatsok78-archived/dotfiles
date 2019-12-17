#!/usr/bin/env bash

set -e

source ./scripts/helper

function composer_install_global () {
    log_install "$1"
    composer global require "$1"
}

function main_old () {
    if [ `command -v composer` ]; then
        c.warn "Installing Composer Packages..."

        composer_install_global "laravel/installer"
        composer_install_global "laravel/valet"
        composer_install_global "laravel/envoy"

        composer_install_global "laravel-zero/installer"

        composer_install_global "squizlabs/php_codesniffer"

        c.success "Composer Packages is installed!"
    else
        c.error "[SKIP]: Composer not found!"
    fi
}

function is_lock_exists () {
    local composer_lock_file="$HOME/.composer/composer.lock"

    if [ -f "$composer_lock_file" ]; then
        return 0
    fi

    return 1
}

function main () {
    if [ `command -v composer` ]; then
        if is_lock_exists; then
            c.warn "Updating Composer Packages..."
            composer global update
        else
            c.warn "Installing Composer Packages..."
            composer global install
        fi

        c.success "Composer Packages is installed!"
    else
        c.error "[SKIP]: Composer not found!"
    fi
}

# Entrypoint
main;
