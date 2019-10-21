#!/usr/bin/env bash

# \033 or \e as an Escape character starts the escape sequence, 
# which in this case contains the controls to change colors.

# https://www.shellhacks.com/bash-colors/
# https://misc.flogisoft.com/bash/tip_colors_and_formatting

function c.log() {
    echo -e ">>> $@"
}

function c.line() {
    echo -e "\033[92m>>> $@\033[0m"
}

function c.warning() {
    echo -e "\033[33m>>> $@\033[0m"
}

function c.info() {
    echo -e "\033[94m>>> $@\033[0m"
}

function c.success() {
    echo -e "\033[92m>>> $@\033[0m"
}

function c.danger() {
    echo -e "\033[1;31m>>> $@\033[0m"
}

function c.error () {
    c.danger "$@"
}

