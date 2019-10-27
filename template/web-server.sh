#!/usr/bin/env bash

set -e

source ./scripts/helper

function install_web_server () {
    c.log "Installing Web Server Service..."
    cd ./template/web-server

    brew update
    brew bundle
}

