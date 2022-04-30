#!/bin/zsh

# This script makes a backup of :
# - ~/.zsh*
# - ~/.servers

files=("zshrc" "zsh_theme_conf" "zsh_profile" "p10k.zsh")

for file in "${files[@]}"; do
    cp -rp ~/.${file} ./
done
