#!/usr/bin/env bash

set -e

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
    c.info "Installing ZSH..."
    brew install zsh zsh-completions
    check_zsh_installation
}

function zsh_install_linux () {
    c.info "Installing ZSH Linux..."
    sudo apt-get install zsh
    check_zsh_installation
}

function set_default_shell () {
    if ! echo $SHELL | grep zsh 1>/dev/null; then
        c.info "Set ZSH as Default Shell..."

        sudo sh -c "yes | chsh -s $(which zsh)"
    fi
}

function install_ohmyzsh () {
    if [ -z "$ZSH" ]; then
        c.info "Installing Oh My ZSH..."

        if [ -n "$CI" ]; then
            export CHSH="no"
            export RUNZSH="no"
        fi

        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
}


function main () {
    check_zsh_installation
    set_default_shell
    install_ohmyzsh
}

# Entrypoint
main;
