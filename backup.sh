#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Backup script: copies config files from the user's home locations into a
# timestamped `backups/` folder inside this repo. This is the inverse of
# `load.sh` which copies from repo -> home.

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TS="$(date +%Y%m%d%H%M%S)"
OUT_DIR="$REPO_DIR/backups/$TS"

copy_backup() {
  local src="$1" dest_rel="$2"
  local dest="$OUT_DIR/$dest_rel"

  if [[ ! -e "$src" && ! -L "$src" ]]; then
    printf "WARN: source not found, skipping: %s\n" "$src"
    return 0
  fi

  local dest_dir
  dest_dir="$(dirname "$dest")"
  mkdir -p "$dest_dir"

  printf "Backup: %s -> %s\n" "$src" "$dest"
  # preserve attributes where possible
  cp -p "$src" "$dest"
}

echo "Repo dir: $REPO_DIR"
echo "Backing up to: $OUT_DIR"

# git
copy_backup "$HOME/.gitconfig" "git/gitconfig"

# jj
copy_backup "$HOME/.config/jj/config.toml" "jj/config.toml"

# ghostty (macOS Application Support path)
copy_backup "$HOME/Library/Application Support/com.mitchellh.ghostty/config" "ghostty/config"

# nushell
copy_backup "$HOME/.config/nushell/config.nu" "nushell/config.nu"

# starship
copy_backup "$HOME/.config/starship.toml" "starship/starship.toml"

echo "Done. Backups stored under: $OUT_DIR"
