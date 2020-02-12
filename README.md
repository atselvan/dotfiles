# Dot files

This repo consists of dot files that can be used to enhance your terminal experience

## Installing required software's

### MacOS

```console
brew cask install iterm2
```

```console
brew install zsh
```

```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Configuring alias's and a custom theme for ohh-my-zsh + iterm2

### Update the home path in the .zshrc file

```console
# Path to your oh-my-zsh installation.
export ZSH="/Users/allanselvan/.oh-my-zsh"
```

### Copy the files .zshrc, .zsh_profile and .zsh_theme_conf to your home directory

```console
cp -r -p .zsh* ~
```

### Install the powerlevek9K theme

```console
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

### Install additional fonts

```console
git clone https://github.com/powerline/fonts
cd fonts
./install.sh
```

### Load custom profile in iterm2

Load the profile [iterm2-mono-profile.json](./iterm2-mono-profile.json) in iterm2

### Source the .zshrc file

```console
source ~/.zshrc
```
