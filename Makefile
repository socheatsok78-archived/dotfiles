STOW ?= stow
HOMEDIR := "$(shell echo ${HOME})"
DOTDIR = $(shell pwd)
DIRS ?= zsh ssh etc
IGNORE = .DS_Store

setup: executable configure dependencies

install: link post-install

configure:
	@echo ">>> Configuring dotfile environment..."
	./scripts/dotfile.sh

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
	chmod +x ./template/*.sh
	@echo ">>> All scripts & tools are executable!"
web-server:
	@echo ">>> Installing Web Server"
	./template/web-server.sh

dependencies:
	./tools/dependencies.sh

