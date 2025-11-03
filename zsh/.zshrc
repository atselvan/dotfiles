# Your Macbook user name
# https://support.apple.com/guide/mac-help/if-you-forgot-your-user-or-account-name-mh35548/mac
export MAC_USER=$(whoami)

# Path to your oh-my-zsh installation.
export ZSH="/Users/$MAC_USER/.oh-my-zsh"

# Update Path variable
GO_BIN_PATH="/Users/$MAC_USER/go/bin"
export PATH="$PATH:$GO_BIN_PATH"

# Import profiles
source ~/.zsh_profile
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    brew
    docker
    encode64
    git
    kubectl
    last-working-dir
    history-substring-search
    macos
    pylint
    virtualenv
    vscode
    zsh-navigation-tools
)

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i
rm -f ~/.zcompdump; compinit

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
