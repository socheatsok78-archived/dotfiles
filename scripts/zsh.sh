#!/usr/bin/env bash

set -e

sudo -v

source ./scripts/helper

function check_zsh_installation () {
    if [ `command -v zsh` ]; then
        c.success "ZSH is already installed!"
    else
        case "$(get_os)" in
            "Darwin")
                zsh_install_osx
            ;;
            "Linux")
                zsh_install_linux
            ;;
            *)
                # Drawin
                zsh_install_osx
            ;;
        esac
    fi
}

function zsh_install_osx () {
    c.log "Installing ZSH..."
    brew install zsh zsh-completions
    check_zsh_installation
}

function zsh_install_linux () {
    c.log "Installing ZSH Linux..."
    sudo apt-get install zsh
    check_zsh_installation
}

function set_default_shell () {
    if ! echo $SHELL | grep zsh 1>/dev/null; then
        c.log "Set ZSH as Default Shell..."
        sudo chsh -s $(which zsh)
    fi
}


function main () {
    check_zsh_installation
    set_default_shell
}

# Entrypoint
main;
