.PHONY: help

help:
	@echo "dotfiles's Help"
	@echo
	@echo "Commands:"
	@echo "- pre-flight: Do a pre-flight check"
	@echo "- executable: Ensure scripts are executable"
	@echo "- update: Fast-forward dotfiles history"


pre-flight: update-submodule executable

executable:
	@echo " ---> Checking file mods..."
	@chmod +x *.sh

dirty-clean:
	@echo " ---> Cleaning up dirty files and directories..."
	@git clean -df

update: dirty-clean update-submodule
	@echo " ---> Updating dotfiles..."
	@git pull --rebase --stat origin main

update-submodule:
	@echo " ---> Updating submodules..."
	@git submodule init
	@git submodule update
