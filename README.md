# Dotfiles

This repo consists of dot files and configuration that I use to enhance my Mac setup

## Table of Contents

- [Dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Mac Setup Guide](#mac-setup-guide)
  - [Install Brew](#install-brew)
  - [Get the Config Files](#get-the-config-files)
  - [Install Applications and Developer Tools](#install-applications-and-developer-tools)
  - [Terminal Setup](#terminal-setup)
  - [Overview of Installed Applications](#overview-of-installed-applications)

## Mac Setup Guide

This [Setup Guide](https://www.notion.so/atselvan/Macbook-Setup-29aa269b953180beab43db6bf0b59000?source=copy_link) lists some settings to make your macbook experience better.

## Install Brew

Homebrew is a package manager for macOS. You can install it by visiting the official website:

[Homebrew Installation Guide](https://brew.sh/)

## Get the Config Files

Clone this repository to your local machine to access the configuration files:

```bash
git clone https://github.com/atselvan/dotfiles.git
```

## Install Applications and Developer Tools

This repository includes a `Brewfile` that lists all the applications and developer tools you might need. You can customize this file to suit your workflow by adding or removing tools.

Review the `Brewfile` here: [Brewfile](https://github.com/atselvan/dotfiles/blob/master/Brewfile)

To install all the tools listed in the `Brewfile`, run the following command:

```bash
brew bundle -v
```

## Terminal Setup

All the tools required to configure the terminal (ghostty) will be installed via the `brew bundle`. After installation, you need to load the configuration files to customize your terminal setup.

As a starting point, you can use the settings provided in this repository and then customize them to your liking.

1. Review the `install.sh` script: [install.sh](https://github.com/atselvan/dotfiles/blob/master/install.sh)
2. Make the script executable and run it:

```bash
chmod +x ./install.sh
./install.sh
```

Feel free to modify the configurations to better suit your preferences.

## Overview of Installed Applications

| Application             | Homepage                                                | Purpose                                                                     |
| ----------------------- | ------------------------------------------------------- | --------------------------------------------------------------------------- |
| zsh                     | https://www.zsh.org                                     | A powerful shell for interactive use and scripting.                         |
| zsh-autosuggestions     | https://github.com/zsh-users/zsh-autosuggestions        | Suggests commands as you type based on history and completions.             |
| zsh-completions         | https://github.com/zsh-users/zsh-completions            | Additional completion definitions for Zsh.                                  |
| zsh-syntax-highlighting | https://github.com/zsh-users/zsh-syntax-highlighting    | Provides syntax highlighting for Zsh commands.                              |
| powerlevel10k           | https://github.com/romkatv/powerlevel10k                | A fast and customizable Zsh theme.                                          |
| nushell                 | https://www.nushell.sh                                  | A modern shell with a focus on structured data.                             |
| starship                | https://starship.rs                                     | A minimal, fast, and customizable prompt for any shell.                     |
| carapace                | https://github.com/rsteube/carapace                     | A command argument completion generator.                                    |
| git                     | https://git-scm.com                                     | A distributed version control system.                                       |
| go                      | https://go.dev                                          | A programming language for building fast and reliable software.             |
| python                  | https://www.python.org                                  | A versatile programming language for scripting and application development. |
| azure-cli               | https://learn.microsoft.com/cli/azure                   | Command-line tools for managing Azure resources.                            |
| jq                      | https://stedolan.github.io/jq                           | A lightweight and flexible command-line JSON processor.                     |
| mas                     | https://github.com/mas-cli/mas                          | A CLI for managing macOS App Store applications.                            |
| nvm                     | https://github.com/nvm-sh/nvm                           | Node Version Manager for managing multiple Node.js versions.                |
| jj                      | https://github.com/jj-vcs/jj                            | A text editor for programmers.                                              |
| gpg                     | https://gnupg.org                                       | A tool for secure communication and data storage.                           |
| arc                     | https://arc.net                                         | A modern web browser.                                                       |
| docker-desktop          | https://www.docker.com/products/docker-desktop          | A GUI for managing Docker containers and images.                            |
| ghostty                 | https://ghostty.org                                     | A terminal emulator with modern features.                                   |
| notion                  | https://www.notion.so                                   | A workspace for notes, tasks, and collaboration.                            |
| postman                 | https://www.postman.com                                 | A platform for API development and testing.                                 |
| rectangle               | https://rectangleapp.com                                | A window management app for macOS.                                          |
| tableplus               | https://tableplus.com                                   | A modern database management tool.                                          |
| jetbrains-toolbox       | https://www.jetbrains.com/toolbox-app                   | A manager for JetBrains IDEs.                                               |
| font-jetbrains-mono     | https://www.jetbrains.com/lp/mono                       | A developer-friendly font.                                                  |
| visual-studio-code      | https://code.visualstudio.com                           | A popular code editor for developers.                                       |
| git-credential-manager  | https://github.com/git-ecosystem/git-credential-manager | A secure Git credential storage solution.                                   |
| logi-options+           | https://www.logitech.com                                | Software for customizing Logitech devices.                                  |
| steam                   | https://store.steampowered.com                          | A platform for gaming and game management.                                  |
| raycast                 | https://www.raycast.com                                 | A productivity tool for launching apps and performing tasks.                |
| iina                    | https://iina.io                                         | A modern media player for macOS.                                            |
| monitorcontrol          | https://github.com/MonitorControl/MonitorControl        | A tool for controlling external monitor brightness and volume.              |
| alt-tab                 | https://alt-tab-macos.netlify.app                       | A Windows-like Alt-Tab switcher for macOS.                                  |
| affinity                | https://affinity.serif.com                              | A suite of professional creative software.                                  |
| archi                   | https://www.archimatetool.com                           | A modeling tool for creating enterprise architecture diagrams.              |
| lulu                    | https://objective-see.org/products/lulu.html            | A firewall for macOS.                                                       |
| aldente                 | https://apphousekitchen.com/aldente                     | A tool for managing MacBook battery charging.                               |
