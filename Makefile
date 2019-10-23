STOW ?= stow
HOMEDIR := "$(shell echo ${HOME})"
DOTDIR = $(shell pwd)
DIRS ?= zsh ssh etc
IGNORE = .DS_Store

setup: executable configure dependencies

install: link post-install

configure:
	@echo ">>> Configuring dotfile environment..."
	mkdir -p $(HOMEDIR)/.dotfile.conf.d
	@echo ">>> $(HOMEDIR)/.dotfile.conf.d created!"

link:
	@echo ">>> Installing dotfile into $(HOMEDIR)/ folder...\n"
	@$(STOW) --target=$(HOMEDIR) --ignore=$(IGNORE) -Rv $(DIRS)
	@echo ">>> Successfully installed dotfile to your system!"

post-install:
	@echo "\n>>> Executing Post-install Script"
	./tools/post-install.sh

uninstall:
	@echo Uninstalling dotfile from ${HOMEDIR}/ folder...
	@$(STOW) --target=$(HOMEDIR) --ignore=$(IGNORE) -Dv $(DIRS)
	@echo ">>> Successfully uninstalled dotfile from your system!"

executable:
	@echo ">>> Making scripts executable..."
	chmod +x ./scripts/*.sh
	chmod +x ./tools/*.sh
	chmod +x ./etc/.bin/*
	@echo ">>> All scripts & tools are executable!"

dependencies:
	./tools/dependencies.sh

