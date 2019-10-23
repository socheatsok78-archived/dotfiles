#!/usr/bin/env bash

set -e

source ./scripts/helper

function check_brew_installation () {    
    if [ `command -v brew` ]; then
        c.success "Homebrew is successfully installed!"
    else
        case "$(get_os)" in
            "Darwin")   brew_install_osx    ;;
            "Linux")    brew_install_linux  ;;
            *)          brew_install_osx    ;;
        esac
    fi
}

function brew_install_osx () {
    local ruby_bin="/usr/bin/ruby"
    local brew_install_url="https://raw.githubusercontent.com/Homebrew/install/master/install"

    c.info "Installing Homebrew..."
    $ruby_bin -e "$(curl -fsSL $brew_install_url)"
    check_brew_installation
}

function brew_install_linux () {
    local brew_install_url="https://github.com/Homebrew/brew"

    c.info "Installing Homebrew Linux..."

    git clone $brew_install_url $HOME/.linuxbrew/Homebrew
    mkdir $HOME/.linuxbrew/bin
    ln -s ../Homebrew/bin/brew $HOME/.linuxbrew/bin
    eval $($HOME/.linuxbrew/bin/brew shellenv)

    echo 'eval $($HOME/.linuxbrew/bin/brew shellenv)' >> "$HOME/.zshrc" || true
    echo 'eval $($HOME/.linuxbrew/bin/brew shellenv)' >> "$HOME/.bashrc" || true

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
