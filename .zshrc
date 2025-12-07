# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
plugins=(git mise)

zstyle ':omz:update' mode auto
zstyle ':omz:update' verbose minimal

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

# User configuration

# Neovim btw
alias vim=nvim
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#
# Aliases
#

# These make git operations on dotfiles' bare repo easier
function dotfiles() {
  export GIT_DIR="$HOME/dotfiles/"
  export GIT_WORK_TREE=$HOME
}

function undotfiles() {
  unset GIT_DIR
  unset GIT_WORK_TREE
}


# Added by Antigravity
export PATH="/Users/sgarcia/.antigravity/antigravity/bin:$PATH"
