#!/bin/bash

DOTFILES="$HOME/.dotfiles"

. "$DOTFILES/scripts/ubuntu/config.sh"
. "$DOTFILES/scripts/ubuntu/install.sh"
sudo . "$DOTFILES/scripts/python.sh"
sudo . "$DOTFILES/scripts/ruby.sh"
sudo . "$DOTFILES/scripts/node.sh"
sudo . "$DOTFILES/scripts/lua.sh"
. "$DOTFILES/scripts/link.sh"
. "$DOTFILES/scripts/git.sh"
