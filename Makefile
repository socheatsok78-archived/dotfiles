STOW ?= stow
HOME := "$(shell echo ${HOME})"
DOTDIR = $(shell pwd)
DIRS ?= etc git tmux gpg ssh bash alacritty zsh
IGNORE = .DS_Store

setup: configure dependencies

install:
	@echo Installing dotfile into ${HOME}/ folder...

configure:
	@echo "Making scripts executable..."
	chmod +x ./scripts/*.sh

dependencies:
	./scripts/xcode.sh
	./scripts/brew.sh
	./scripts/other.sh

