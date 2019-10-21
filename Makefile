STOW ?= stow
HOME := "$(shell echo ${HOME})"
DOTDIR = $(shell pwd)
DIRS ?= etc git tmux gpg ssh bash alacritty zsh
IGNORE = .DS_Store

setup: dependencies

install:
	@echo Installing dotfile into ${HOME}/ folder...

dependencies:
	./scripts/xcode.sh
	./scripts/brew.sh

