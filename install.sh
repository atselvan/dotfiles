#!/bin/bash

# Install Process
# This script will initiate for the setup/update of this Macbook.
# What will the script do?
# 1. Install Homebrew
# 2. Install and configure Git
# 3. Configure Terminal
# 4. Install required software using brew bundle

# Variables
export MAC_USER=""

# Git configuration
# If the varible is not set git configuration step will be skipped.
GIT_CONFIG='[user]
    name = 
    email = 
[alias]
	permission-reset = !git diff -p -R --no-ext-diff --no-color | grep -E \"^(diff|(old|new) mode)\" --color=never | git apply
[core]
	autocrlf = input
'

# ***** Do not change the script beyond this point *****

GIT_CONFIG_PATH="~/.gitconfig"

# Create base folder structure

mkdir /Users/$MAC_USER/workspace /Users/$MAC_USER/workspace/code /Users/$MAC_USER/workspace/code/gh /Users/$MAC_USER/workspace/code/lo /Users/$MAC_USER/workspace/code/lo/py /Users/$MAC_USER/workspace/code/bb /Users/$MAC_USER/workspace/code/ag

# Install Homebrew
# Homebrew is the open source package manager of choice for the Mac.
if ! command -v brew > /dev/null
then
    echo "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install and configure Git
if ! command -v git > /dev/null
then
    echo "Installing git using homebrew"
    brew install git
fi

if [ -z "$GIT_CONFIG" ]
then
      echo "\$GIT_CONFIG is null hence skipping git configuration!"
else
      echo "Configuring Git"
      echo "$GIT_CONFIG" > ~/.gitconfig
fi

# Configure Terminal

echo "Configuring terminal"

brew install zsh
brew install zsh-completions
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying .zsh files to ~"
cp -rp .zsh* ~

echo "Copying servers.conf file"
cp -r -p servers.conf ~/.servers

echo "Installing powerlevel9k theme for ohmyzsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "Installing powerline fonts"
git clone https://github.com/powerline/fonts
./fonts/install.sh
rm -rf fonts

# Brew Bundle
echo "Installing brew bundle"
brew bundle -v
brew install hudochenkov/sshpass/sshpass

unset HTTP_PROXY HTTPS_PROXY

# END
