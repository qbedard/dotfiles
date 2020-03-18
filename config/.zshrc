#!/bin/zsh

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="kolo"
plugins=(
  aws
  cargo
  # django
  docker
  docker-compose
  fasd
  # gem
  git
  git-extras
  # npm
  osx
  pip
  python
  # redis-cli
  # tmux
  # vagrant
  web-search  # perform web searches ('google pictures of cats')
  # zsh-autosuggestions
  zsh-completions
  # zsh-nvm  # takes crazy long
  # zsh-syntax-highlighting
)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

# --- iterm2 integration ---
test -e "$HOME/.iterm2_shell_integration.zsh" && source "$HOME/.iterm2_shell_integration.zsh"

# --- the real business ---
# TODO: Find a way to make this dynamic
source "$HOME/.common.sh"

# --- direnv ---
if hash direnv 2>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# --- hub ---
if command -v hub > /dev/null; then
  eval "$(hub alias -s zsh)"
fi
