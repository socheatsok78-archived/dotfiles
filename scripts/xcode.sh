#!/usr/bin/env bash

set -ev

source ./scripts/helper

function install_xcode_commandline_tool () {
    xcode-select --install || true
}

function main () {
    install_xcode_commandline_tool
}

# Entrypoint
main
