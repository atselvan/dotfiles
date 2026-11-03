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
    - [Terminal Application](#terminal-application)
    - [Shell Configurations](#shell-configurations)
    - [Steps](#steps)
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

Review the `Brewfile` here: [Brewfile](https://github.com/atselvan/dotfiles/blob/master/brew/Brewfile)

To install all the tools listed in the `Brewfile`, run the following command:

```bash
brew bundle -v
```

## Terminal Setup

All the tools required to configure the terminal will be installed via the brew bundle. After installation, you need to load the configuration files to customize your terminal setup.

As a starting point, you can use the settings provided in this repository and then customize them to your liking.

### Terminal Application

The terminal of choice for this setup is Ghostty.

### Shell Configurations

The terminal setup includes configurations for the following shells:

- ZSH: Installed with ohmyzsh and customized with powerlevel10k.
- Nushell: Configured with starship for prompt customization.

By default, macOS uses ZSH as the default shell. If you'd like to change your default shell to Nushell, follow the instructions provided in Step 4 below.

### Steps

1. Before running the installation script, update your Git configuration [git/gitconfig](https://github.com/atselvan/dotfiles/blob/master/git/gitconfig) and Jujitsu configuration [jj/config.toml](https://github.com/atselvan/dotfiles/blob/master/jj/config.toml) with your username and email.
2. Review the `install.sh` script: [scripts/install.sh](https://github.com/atselvan/dotfiles/blob/master/scripts/install.sh)
3. Make the script executable and run it:

  ```bash
  chmod +x ./scripts/install.sh
  ./scripts/install.sh
  ```

4. Default Shell Configuration

   Add ZSH to your allowed shells list::

   ```bash
   which zsh | sudo tee -a /etc/shells
   ```

   Then change your shell:

   ```bash
   chsh -s $(which zsh)
   ```

   Log out and log back in. You’re now in Nu.

Feel free to modify the configurations to better suit your preferences.

## Overview of Installed Applications

| Application                   | Homepage                                                  | Purpose                                                                            |
|-------------------------------|-----------------------------------------------------------|------------------------------------------------------------------------------------|
| zsh                           | https://www.zsh.org                                       | A powerful shell for interactive use and scripting.                                |
| zsh-autosuggestions           | https://github.com/zsh-users/zsh-autosuggestions          | Suggests commands as you type based on history and completions.                    |
| zsh-completions               | https://github.com/zsh-users/zsh-completions              | Additional completion definitions for Zsh.                                         |
| zsh-syntax-highlighting       | https://github.com/zsh-users/zsh-syntax-highlighting      | Provides syntax highlighting for Zsh commands.                                     |
| powerlevel10k                 | https://github.com/romkatv/powerlevel10k                  | A fast and customizable Zsh theme.                                                 |
| nushell                       | https://www.nushell.sh                                    | A modern shell with a focus on structured data.                                    |
| starship                      | https://starship.rs                                       | A minimal, fast, and customizable prompt for any shell.                            |
| carapace                      | https://github.com/rsteube/carapace                       | A command argument completion generator.                                           |
| git                           | https://git-scm.com                                       | A distributed version control system.                                              |
| jj                            | https://jj-vcs.github.io/jj/                              | A Git-compatible version control system.                                           |
| go                            | https://go.dev                                            | A programming language for building fast and reliable software.                    |
| tdl                           | https://github.com/ThreeDotsLabs                          | A command-line tool from the Three Dots Labs Homebrew tap.                         |
| protobuf                      | https://protobuf.dev                                      | A language-neutral format for serializing structured data.                         |
| python                        | https://www.python.org                                    | A versatile programming language for scripting and application development.        |
| nvm                           | https://github.com/nvm-sh/nvm                             | Node Version Manager for managing multiple Node.js versions.                       |
| node                          | https://nodejs.org                                        | JavaScript runtime for server-side and command-line applications.                  |
| azure-cli                     | https://learn.microsoft.com/cli/azure                     | Command-line tools for managing Azure resources.                                   |
| jq                            | https://jqlang.org                                        | A lightweight and flexible command-line JSON processor.                            |
| mas                           | https://github.com/mas-cli/mas                            | A CLI for managing macOS App Store applications.                                   |
| gpg                           | https://gnupg.org                                         | A tool for secure communication and data storage.                                  |
| tree                          | https://oldmanprogrammer.net/source.php?dir=projects/tree | Displays directory structures in a tree-like format.                               |
| thebrowsercompany-dia         | https://diabrowser.com                                    | A web browser from The Browser Company.                                            |
| docker-desktop                | https://www.docker.com/products/docker-desktop            | A GUI for managing Docker containers and images.                                   |
| ghostty                       | https://ghostty.org                                       | A terminal emulator with modern features.                                          |
| notion                        | https://www.notion.so                                     | A workspace for notes, tasks, and collaboration.                                   |
| postman                       | https://www.postman.com                                   | A platform for API development and testing.                                        |
| rectangle                     | https://rectangleapp.com                                  | A window management app for macOS.                                                 |
| tableplus                     | https://tableplus.com                                     | A modern database management tool.                                                 |
| jetbrains-toolbox             | https://www.jetbrains.com/toolbox-app                     | A manager for JetBrains IDEs.                                                      |
| font-jetbrains-mono           | https://www.jetbrains.com/lp/mono                         | A developer-friendly font.                                                         |
| font-jetbrains-mono-nerd-font | https://www.nerdfonts.com                                 | JetBrains Mono patched with additional developer-focused glyphs.                   |
| visual-studio-code            | https://code.visualstudio.com                             | A popular code editor for developers.                                              |
| git-credential-manager        | https://github.com/git-ecosystem/git-credential-manager   | A secure Git credential storage solution.                                          |
| logi-options+                 | https://www.logitech.com                                  | Software for customizing Logitech devices.                                         |
| zulu                          | https://www.azul.com/downloads/                           | A Java Development Kit distribution.                                               |
| steam                         | https://store.steampowered.com                            | A platform for gaming and game management.                                         |
| raycast                       | https://www.raycast.com                                   | A productivity tool for launching apps and performing tasks.                       |
| iina                          | https://iina.io                                           | A modern media player for macOS.                                                   |
| monitorcontrol                | https://github.com/MonitorControl/MonitorControl          | A tool for controlling external monitor brightness and volume.                     |
| affinity                      | https://affinity.serif.com                                | A suite of professional creative software.                                         |
| aldente                       | https://apphousekitchen.com/aldente                       | A tool for managing MacBook battery charging.                                      |
| syncthing-app                 | https://syncthing.net/                                    | A GUI wrapper for Syncthing file synchronization across devices.                   |
| keyboardcleantool             | https://folivora.ai/keyboardcleantool                     | A small utility to lock the keyboard for cleaning.                                 |
| discord                       | https://discord.com                                       | A communication app for voice, video, and text chat.                               |
| tailscale-app                 | https://tailscale.com                                     | A mesh VPN for connecting devices securely.                                        |
| onlyoffice                    | https://www.onlyoffice.com                                | An office suite for viewing and editing documents.                                 |
| raspberry-pi-imager           | https://www.raspberrypi.com/software/                     | Writes Raspberry Pi OS and other images to storage devices.                        |
| sony-ps-remote-play           | https://remoteplay.dl.playstation.net/remoteplay/         | Streams PlayStation gameplay to a Mac.                                             |
| HP                            | https://www.hp.com                                        | Software and utilities for HP devices.                                             |
| Notion Web Clipper            | https://www.notion.so/web-clipper                         | Saves web pages to Notion.                                                         |
| WhatsApp Messenger            | https://www.whatsapp.com                                  | Messaging and calling app.                                                         |
| Pandan                        | https://apps.apple.com/us/app/pandan/id1569600264         | Tracks active computer use to support time awareness.                              |
| Pastel                        | https://apps.apple.com/us/app/pastel/id413897608          | A macOS app for creating and managing color palettes.                              |
| Amphetamine                   | https://apphousekitchen.com/amphetamine/                  | Prevents your Mac from going to sleep.                                             |
