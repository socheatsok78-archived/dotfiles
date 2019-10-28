#!/usr/bin/env bash

set -e

source ./scripts/helper

VSCODE_EXTENSION_FILE="template/vscode/extensions.txt"

function check_vscode_installation () {
    command -v code 1> /dev/null
}

function remove_logs () {
    if [ -f "vscode-install.log" ]; then
        rm vscode-install.log
    fi
}


function install_extension () {
    log_install "$1"
    code --install-extension "$1" >> vscode-install.log
}

function uninstall_extension () {
    log_uninstall "$1"
    code --uninstall-extension "$1" >> vscode-install.log
}

function install_vscode_extensions () {
    remove_logs

    cat "$VSCODE_EXTENSION_FILE" | while read line
    do
        install_extension $line
    done
}

function uninstall_vscode_extensions () {
    remove_logs

    cat "$VSCODE_EXTENSION_FILE" | while read line
    do
        uninstall_extension $line
    done
}

function main () {
    if check_vscode_installation; then
        c.info "Installing Visual Studio Code extensions"
        case "$1" in
            "install")      uninstall_vscode_extensions ;;
            "uninstall")    uninstall_vscode_extensions ;;
            *)              install_vscode_extensions   ;;
        esac
        c.success "Visual Studio Code extensions successfully installed!"
    else
        c.warn "[SKIP]: Visual Studio Code is not installed!"
    fi
}

# Entrypoint
main;

