#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Very simple loader: copies config files from the repo into the user's
# home directory and overwrites any existing files.

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

copy_overwrite() {
  local src="$1" dest="$2"
  if [[ ! -e "$src" && ! -L "$src" ]]; then
    printf "WARN: source not found: %s\n" "$src"
    return 0
  fi

  local dest_dir
  dest_dir="$(dirname "$dest")"
  mkdir -p "$dest_dir"

  printf "Copy: %s -> %s\n" "$src" "$dest"
  cp -f "$src" "$dest"
}

echo "Repo dir: $REPO_DIR"

# git
copy_overwrite "$REPO_DIR/git/gitconfig" "$HOME/.gitconfig"

# jj
copy_overwrite "$REPO_DIR/jj/config.toml" "$HOME/.config/jj/config.toml"

# ghostty
copy_overwrite "$REPO_DIR/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# nushell
copy_overwrite "$REPO_DIR/nushell/config.nu" "$HOME/.config/nushell/config.nu"

# starship
copy_overwrite "$REPO_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

echo "Done."
