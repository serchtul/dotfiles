# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Basically ZSH_THEME="spaceship" but using Homebrew
source $HOMEBREW_PREFIX/opt/spaceship/spaceship.zsh

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  elixir        # Elixir section
  php           # PHP section
  rust          # Rust section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  kubectl       # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

# Which plugins would you like to load?
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Neovim btw
alias vim=nvim
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Prioritizes Homebrew's git over Apple's
export PATH=/opt/homebrew/bin/git:$PATH

# fnm
export PATH="$HOME/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

# mise-en-place
eval "$(mise activate zsh)"

# Added by Windsurf
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# gcloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

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

