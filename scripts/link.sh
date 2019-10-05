#!/bin/bash

DOTPATH="$(git rev-parse --show-toplevel)"
CONFIG_DIR="$HOME/.config"

echo "Linking config files..."

# make .config dir if it doesn't exist
mkdir -p "$CONFIG_DIR"

# alacritty
mkdir -p "$CONFIG_DIR/alacritty"
ln -sfn  "$DOTPATH/alacritty.yml" "$CONFIG_DIR/alacritty/alacritty.yml"

# alacritty
mkdir -p "$CONFIG_DIR/kitty"
ln -sfn  "$DOTPATH/kitty.conf" "$CONFIG_DIR/kitty/kitty.conf"

# zsh
ln -sfn  "$DOTPATH/shell/zshrc" "$HOME/.zshrc"

# bash
ln -sfn  "$DOTPATH/shell/bashrc" "$HOME/.bashrc"

# tmux
mkdir -p "$CONFIG_DIR/tmux"
ln -sfn  "$DOTPATH/tmux.conf" "$CONFIG_DIR/tmux/tmux.conf"
ln -sfn  "$DOTPATH/tmux.conf" "$HOME/.tmux.conf"

# neovim
ln -sfn "$DOTPATH/vim" "$CONFIG_DIR/nvim"  # just link the whole dir
ln -sfn "$DOTPATH/vim" "$HOME/.vim"  # also for other vims

# ranger
mkdir -p "$CONFIG_DIR/ranger"
ln -sfn "$DOTPATH/ranger/rc.conf" "$CONFIG_DIR/ranger/rc.conf"
ln -sfn "$DOTPATH/ranger/rifle.conf" "$CONFIG_DIR/ranger/rifle.conf"
ln -sfn "$DOTPATH/ranger/scope.sh" "$CONFIG_DIR/ranger/scope.sh"
ln -sfn "$DOTPATH/ranger/commands.py" "$CONFIG_DIR/ranger/commands.py"

# eslint
ln -sfn "$DOTPATH/eslintrc.yml" "$HOME/.eslintrc.yml"
