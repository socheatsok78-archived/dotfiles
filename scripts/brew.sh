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
    local brew_install_url="https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh"

    c.info "Installing Homebrew Linux..."
    sh -c "$(curl -fsSL $brew_install_url)"

    eval $($HOME/.linuxbrew/bin/brew shellenv)
    check_brew_installation
}

function brew_install_cask () {
    case "$(get_os)" in
        "Darwin")
            if [ -f "Brewfile" ]; then
                log_install "Brew Cask Packages via Cask.Brewfile..."
                if [ -n "$CI" ]; then
                    # Install Brew Packages via Brewfile
                    brew bundle \
                        --no-lock \
                        --verbose \
                        --file="./homebrew/Cask.Brewfile"
                else
                    # Install Brew Packages via Brewfile
                    brew bundle \
                        --no-lock \
                        --file="./homebrew/Cask.Brewfile"
                fi

                c.success "Brew Packages is installed!"
            else
                c.error "Brewfile not found!"
            fi
        ;;
        *)  return ;;
    esac
}

function brew_update () {
    c.info "Updating Homebrew..."
    brew update
}

function main () {
    check_brew_installation
    brew_update
    brew_install_bundle
    brew_install_cask
}

# Entrypoint
main;
