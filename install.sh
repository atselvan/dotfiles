#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Color definitions
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Very simple loader: copies config files from the repo into the user's
# home directory and overwrites any existing files.

USER=$(whoami)
echo $"Current user is: $USER"

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

copy_overwrite() {
  local src="$1" dest="$2"
  if [[ ! -e "$src" && ! -L "$src" ]]; then
    printf "${YELLOW}WARN: source not found: %s${NC}\n" "$src"
    return 0
  fi

  local dest_dir
  dest_dir="$(dirname "$dest")"
  mkdir -p "$dest_dir"

  printf "${BLUE}Copy: %s -> %s${NC}\n" "$src" "$dest"
  cp -f "$src" "$dest"
}

echo -e "${GREEN}Repo dir: $REPO_DIR${NC}"
echo -e "${GREEN}User: $USER${NC}"

# zsh
echo -e "${BLUE}Checking Oh My Zsh installation...${NC}"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${GREEN}Installing Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
    echo -e "${YELLOW}Oh My Zsh already installed, skipping installation...${NC}"
fi

echo -e "${BLUE}Checking Powerlevel10k installation...${NC}"
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo -e "${GREEN}Installing Powerlevel10k theme...${NC}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
fi

echo -e "${GREEN}Copying zsh configuration files...${NC}"
copy_overwrite "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"
copy_overwrite "$REPO_DIR/zsh/.zsh_profile" "$HOME/.zsh_profile"
copy_overwrite "$REPO_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

# git
echo -e "${GREEN}Copying git configuration files...${NC}"
copy_overwrite "$REPO_DIR/git/gitconfig" "$HOME/.gitconfig"

# jj
echo -e "${GREEN}Copying jj configuration files...${NC}"
copy_overwrite "$REPO_DIR/jj/config.toml" "$HOME/.config/jj/config.toml"

# ghostty
echo -e "${GREEN}Copying ghostty configuration files...${NC}"
copy_overwrite "$REPO_DIR/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# nushell
echo -e "${GREEN}Copying nushell configuration files...${NC}"
copy_overwrite "$REPO_DIR/nushell/config.nu" "$HOME/Library/Application Support/nushell/config.nu"

# starship
echo -e "${GREEN}Copying starship configuration files...${NC}"
copy_overwrite "$REPO_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

echo -e "${GREEN}Done.${NC}"
