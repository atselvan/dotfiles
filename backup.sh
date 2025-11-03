#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Backup script: copies config files from the user's home locations into a
# timestamped `backups/` folder inside this repo. This is the inverse of
# `load.sh` which copies from repo -> home.

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

copy_backup() {
  local src="$1" dest_rel="$2"
  local dest="$REPO_DIR/$dest_rel"

  if [[ ! -e "$src" && ! -L "$src" ]]; then
    printf "${YELLOW}WARN: source not found, skipping: %s${NC}\n" "$src"
    return 0
  fi

  local dest_dir
  dest_dir="$(dirname "$dest")"
  mkdir -p "$dest_dir"

  printf "${BLUE}Backup: %s -> %s${NC}\n" "$src" "$dest"
  # preserve attributes where possible
  cp -p "$src" "$dest"
}

echo -e "${GREEN}Repo dir: $REPO_DIR${NC}"

# zsh
echo -e "${BLUE}Backing up zsh configuration files...${NC}"
copy_backup "$HOME/.zshrc" "zsh/.zshrc"
copy_backup "$HOME/.zsh_profile" "zsh/.zsh_profile"
copy_backup "$HOME/.p10k.zsh" "zsh/.p10k.zsh"

# git
echo -e "${BLUE}Backing up git configuration files...${NC}"
copy_backup "$HOME/.gitconfig" "git/gitconfig"

# jj
echo -e "${BLUE}Backing up jj configuration files...${NC}"
copy_backup "$HOME/.config/jj/config.toml" "jj/config.toml"

# ghostty (macOS Application Support path)
echo -e "${BLUE}Backing up ghostty configuration files...${NC}"
copy_backup "$HOME/Library/Application Support/com.mitchellh.ghostty/config" "ghostty/config"

# nushell
echo -e "${BLUE}Backing up nushell configuration files...${NC}"
copy_backup "$HOME/.config/nushell/config.nu" "nushell/config.nu"

# starship
echo -e "${BLUE}Backing up starship configuration files...${NC}"
copy_backup "$HOME/.config/starship.toml" "starship/starship.toml"

echo -e "${GREEN}Backup completed.${NC}"
