#!/bin/zsh

# This script makes a backup of :
# - ~/.zsh*
# - ~/.servers

files=("zshrc" "zsh_theme_conf" "zsh_profile")

for file in "${files[@]}"; do
    cp -rp ~/.${file} ./
done

cp -rp ~/.servers ./servers.conf
