#!/usr/bin/env bash

set -e

source ./scripts/helper

# dotfile helper functions
function dotfile_config_folder () {
    if ! [ -d "$DOTFILE_CONFIG_HOME" ]; then
        mkdir -p "$DOTFILE_CONFIG_HOME"
    fi

    c.success "$DOTFILE_CONFIG_HOME created!"
}

function dotfile_sdk_folder () {
    if ! [ -d "$DOTFILE_SDK_HOME" ]; then
        mkdir -p "$DOTFILE_SDK_HOME"
    fi

    c.success "$DOTFILE_SDK_HOME created!"
}

function main() {
    dotfile_config_folder
    dotfile_sdk_folder
}

# Entrypoint
main
