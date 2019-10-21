#!/usr/bin/env bash

set -e

source ./scripts/helper

function install_xcode_commandline_tool () {
    xcode-select --install || true
    sudo xcodebuild -license accept || true
}

function main () {
    if [[ "$(uname -s)" == "Darwin" ]]; then
        # Only run on Mac OS
        install_xcode_commandline_tool
    else
        c.warn "[SKIP]: xCode Command-line tools, not on a mac!"
    fi
}

# Entrypoint
main
