STOW ?= stow
HOMEDIR := "$(shell echo ${HOME})"
DOTDIR = $(shell pwd)
DIRS ?= zsh ssh bin
IGNORE = .DS_Store

setup: executable dependencies

install: link post-install

link:
	@echo ">>> Installing dotfile into $(HOMEDIR)/ folder...\n"
	@$(STOW) --target=$(HOMEDIR) --ignore=$(IGNORE) -Rv $(DIRS)

post-install:
	@echo "\n>>> Executing Post-install Script"
	./tools/post-install.sh

uninstall:
	@echo Uninstalling dotfile from ${HOMEDIR}/ folder...
	@$(STOW) --target=$(HOMEDIR) --ignore=$(IGNORE) -Dv $(DIRS)

executable:
	@echo ">>> Making scripts executable..."
	chmod +x ./scripts/*.sh
	chmod +x ./tools/*.sh
	chmod +x ./bin/.bin/*
	@echo ">>> All scripts & tools are executable!"

dependencies:
	./tools/dependencies.sh

