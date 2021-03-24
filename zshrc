#!/bin/zsh

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="kolo"
plugins=(
  aws
  cargo
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
  web-search  # perform web searches ('google pictures of cats')
  # zsh-autosuggestions
  zsh-completions
  # zsh-nvm  # takes crazy long
  # zsh-syntax-highlighting
)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh

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

# starship prompt
if command -v starship > /dev/null; then
  starship init fish | source
fi
