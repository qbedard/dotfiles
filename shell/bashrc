#!/bin/bash

. "$HOME/.dotfiles/shell/common.sh"

if hash direnv 2>/dev/null; then
    eval "$(direnv hook bash)"
fi

# --- hub ---
if command -v hub > /dev/null; then
  eval "$(hub alias -s bash)"
fi
