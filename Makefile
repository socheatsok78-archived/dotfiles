STOW ?= stow
HOMEDIR := "$(shell echo ${HOME})"
DOTDIR = $(shell pwd)
DIRS ?= zsh ssh
IGNORE = .DS_Store

setup: configure dependencies

install: link post-install

link:
	@echo ">>> Installing dotfile into $(HOMEDIR)/ folder...\n"
	@$(STOW) --target=$(HOMEDIR) --ignore=$(IGNORE) -Rv $(DIRS)

post-install:
	@echo "\n>>> Executing Post-install Script"
	./scripts/post_install.sh

uninstall:
	@echo Uninstalling dotfile from ${HOMEDIR}/ folder...
	@$(STOW) --target=$(HOMEDIR) --ignore=$(IGNORE) -Dv $(DIRS)

configure:
	@echo ">>> Making scripts executable..."
	chmod +x ./scripts/*.sh

dependencies:
	./scripts/install.sh

