#!/usr/bin/env bash

set -e

source ./scripts/helper

ZSHRC_TEMPLATE="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/templates/zshrc.zsh-template"
ZSHRC_PATH="$HOME/.zshrc"

function check_zshrc_exist () {
    c.log "Checking if $ZSHRC_PATH exists"
    test -e $ZSHRC_PATH
}

function generate_zshrc () {
    curl -fsSL "$ZSHRC_TEMPLATE" > $ZSHRC_PATH

    check_zshrc_exist
}

function add_dotfile_source () {
    if ! grep "# socheatsok78/dotfile" < $ZSHRC_PATH 1>/dev/null; then
        c.log "Adding dotfile to $ZSHRC_PATH..."
        echo '# socheatsok78/dotfile' >> $ZSHRC_PATH
        echo 'test -e "$HOME/.zsh_profile" && source "$HOME/.zsh_profile"' >> $ZSHRC_PATH
        c.success "Added dotfile to $ZSHRC_PATH!"
    else
        c.warn "dotfile is already added to your $ZSHRC_PATH"
    fi
}

function main () {
    if ! check_zshrc_exist; then
        generate_zshrc
    fi

    add_dotfile_source
}

# Entrypoint
main;
