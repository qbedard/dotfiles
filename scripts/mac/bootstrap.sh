#!/bin/bash

DOTPATH="$(git rev-parse --show-toplevel)"
CONFIG_DIR="$HOME/.config"

. "$DOTPATH/scripts/mac/config.sh"
. "$DOTPATH/scripts/mac/install.sh"
# . "$DOTPATH/scripts/python.sh"
# . "$DOTPATH/scripts/ruby.sh"
# . "$DOTPATH/scripts/node.sh"
. "$DOTPATH/scripts/git.sh"
