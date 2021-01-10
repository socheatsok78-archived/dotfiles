.PHONY: help

help:
	@echo "dotfiles's Help"
	@echo
	@echo "Commands:"
	@echo "- install: Install dotfiles to the system"
	@echo "- update: Fast-forward dotfiles history"
	@echo "- pre-flight: Do a pre-flight check"
	@echo "- executable: Ensure scripts are executable"

pre-flight: update-submodule executable

install:
	@echo "Starting dotfiles installer..."
	@./install.sh

update: dirty-clean update-submodule
	@echo " ---> Updating dotfiles..."
	@git pull --rebase --stat origin main

executable:
	@echo " ---> Checking file mods..."
	@chmod +x *.sh

dirty-clean:
	@echo " ---> Cleaning up dirty files and directories..."
	@git clean -df

update-submodule:
	@echo " ---> Updating submodules..."
	@git submodule init
	@git submodule update
