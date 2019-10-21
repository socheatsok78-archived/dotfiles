#!/usr/bin/env bash

set -e

source ./scripts/helper

function check_brew_installation () {
    local OS=$(uname -s)
    
    if [ `command -v brew` ]; then
        case "$OS" in
            "Darwin")
                brew_install_osx
            ;;
            "Linux")
                brew_install_linux
            ;;
            *)
                # Drawin
                brew_install_osx
            ;;
        esac
    else
        c.success "Homebrew is successfully installed!"
    fi
}

function brew_install_osx () {
    local ruby_bin="/usr/bin/ruby"
    local brew_install_url="https://raw.githubusercontent.com/Homebrew/install/master/install"

    c.log "Installing Homebrew..."
    $ruby_bin -e "$(curl -fsSL $brew_install_url)"
    check_brew_installation
}

function brew_install_linux () {
    local brew_install_url="https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh"

    c.log "Installing Homebrew Linux..."
    sh -c "$(curl -fsSL $brew_install_url)"
    check_brew_installation
}

function brew_update () {
    c.info "Updating Homebrew..."
    brew update
}


function brew_install_bundle () {
    if [ -f "Brewfile" ]; then
        c.info "Installing Brew Packages via Brewfile..."
       brew bundle # Install Brew Packages via Brewfile
       c.success "Brew Packages is installed!"
    else
        c.error "Brewfile not found!"
    fi
}

function main () {
    check_brew_installation
    brew_update
    brew_install_bundle
}

# Entrypoint
main;
