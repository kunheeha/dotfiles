
autoload -U promptinit; promptinit
prompt pure


# Path to your oh-my-zsh installation.
export ZSH="/Users/kunheeha/.oh-my-zsh"

DISABLE_LS_COLORS="true"


# Plugins
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
)


source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit
# User configuration

# subl to open Sublime Text
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
