.PHONY: help

help:
	@echo "dotfiles's Help"
	@echo
	@echo "Commands:"
	@echo "- pre-flight: Do a pre-flight check"


pre-flight:
	@echo "Performing pre-flight check..."
	@echo " - Updating submodules..."
	@git submodule init
	@git submodule update
	@echo " - Checking file mods..."
	@chmod +x *.sh
	@echo " - Pre-flight check completed!"
