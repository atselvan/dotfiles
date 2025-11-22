
SCRIPTS_DIR := scripts
INSTALL_SCRIPT := $(SCRIPTS_DIR)/install.sh
BACKUP_SCRIPT := $(SCRIPTS_DIR)/backup.sh
BREW_DIR := brew
BREWFILE := $(BREW_DIR)/Brewfile

.PHONY: help install backup bundle

help:
	@printf "Usage: make [target]\n\nTargets:\n  install  Run the install script (scripts/install.sh)\n  backup   Run the backup script (scripts/backup.sh)\n  bundle   Run 'brew bundle -v' using $(BREWFILE)\n"

install:
	@echo "Running install script: $(INSTALL_SCRIPT)"
	@chmod +x $(INSTALL_SCRIPT)
	@./$(INSTALL_SCRIPT)

backup:
	@echo "Running backup script: $(BACKUP_SCRIPT)"
	@chmod +x $(BACKUP_SCRIPT)
	@./$(BACKUP_SCRIPT)

bundle:
	@echo "Running brew bundle from $(BREWFILE)"
	@brew bundle -v --file=$(BREWFILE)

