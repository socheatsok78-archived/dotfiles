STOW ?= stow
HOME := "$(shell echo ${HOME})"
DOTDIR = $(shell pwd)
DIRS ?= zsh ssh
IGNORE = .DS_Store

setup: configure dependencies

install:
	@echo Installing dotfile into ${HOME}/ folder...
	@$(STOW) --target=$(HOME) --ignore=$(IGNORE) -Rv $(DIRS)

uninstall:
	@echo Uninstalling dotfile from ${HOME}/ folder...
	@$(STOW) --target=$(HOME) --ignore=$(IGNORE) -Dv $(DIRS)

configure:
	@echo "Making scripts executable..."
	chmod +x ./scripts/*.sh

dependencies:
	./scripts/install.sh

