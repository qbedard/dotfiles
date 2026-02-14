#!/bin/zsh

source "$HOME/.common.sh"

# --- fzf ---
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && . /usr/share/fzf/key-bindings.zsh

# starship prompt
if command -v starship > /dev/null; then
  eval "$(starship init zsh)"
fi
