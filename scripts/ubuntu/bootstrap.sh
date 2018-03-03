#!/bin/bash

DOTFILES="$HOME/.dotfiles"

. "$DOTFILES/scripts/ubuntu/config.sh"
. "$DOTFILES/scripts/ubuntu/install.sh"
sudo . "$DOTFILES/scripts/python.sh"
sudo . "$DOTFILES/scripts/ruby.sh"
. "$DOTFILES/scripts/ubuntu/link.sh"
