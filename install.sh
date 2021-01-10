#!/usr/bin/env bash

#-------------------------------------------------- pre-flight
# string formatters
if [[ -t 1 ]]; then
    tty_escape() { printf "\033[%sm" "$1"; }
else
    tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_yellow="$(tty_mkbold 33)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

shell_join() {
    local arg
    printf "%s" "$1"
    shift
    for arg in "$@"; do
        printf " "
        printf "%s" "${arg// /\ }"
    done
}

chomp() {
    printf "%s" "${1/"$'\n'"/}"
}

ohai() {
    printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

warn() {
    printf "${tty_yellow}Warning${tty_reset}: %s\n" "$(chomp "$1")"
}

error(){
    printf "${tty_red}Error${tty_reset}: %s\n" "$(chomp "$1")" >>/dev/stderr
}

abort() {
  printf "%s\n" "$1"
  exit 1
}

execute() {
  if ! "$@"; then
    abort "$(printf "Failed during: %s" "$(shell_join "$@")")"
  fi
}

# Custom Functions
brewbundle () {
    if [ -n "$CI" ]; then
        execute "brew" "bundle" "--verbose" "--no-lock" "--file" $@
    else
        execute "brew" "bundle" "--no-lock"  "--file" $@
    fi
}

# -------------------------------------------------- setup
echo -e "       __      __  _____ __         "
echo -e "  ____/ /___  / /_/ __(_) /__  _____"
echo -e " / __  / __ \/ __/ /_/ / / _ \/ ___/"
echo -e "/ /_/ / /_/ / /_/ __/ / /  __(__  ) "
echo -e "\__,_/\____/\__/_/ /_/_/\___/____/  "
echo -e "                                    "
