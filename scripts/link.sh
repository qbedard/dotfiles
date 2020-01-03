#!/bin/bash

DOTPATH="$(git rev-parse --show-toplevel)"
CONFIG_DIR="$HOME/.config"

echo "Linking config files..."

# make .config dir if it doesn't exist
mkdir -p "$CONFIG_DIR"

# kitty
mkdir -p "$CONFIG_DIR/kitty"
ln -sfn  "$DOTPATH/kitty.conf" "$CONFIG_DIR/kitty/kitty.conf"

# zsh
ln -sfn  "$DOTPATH/shell/zshrc" "$HOME/.zshrc"

# bash
ln -sfn  "$DOTPATH/shell/bashrc" "$HOME/.bashrc"

# fish
mkdir -p "$CONFIG_DIR/fish"
# mkdir -p "$CONFIG_DIR/fish/functions"
ln -sfn  "$DOTPATH/shell/fish/config.fish" "$CONFIG_DIR/fish/config.fish"
# ln -sfn  "$DOTPATH/shell/fish/functions/gruvbox_colors.fish" "$CONFIG_DIR/fish/functions/gruvbox_colors.fish"

# tmux
mkdir -p "$CONFIG_DIR/tmux"
ln -sfn  "$DOTPATH/tmux.conf" "$CONFIG_DIR/tmux/tmux.conf"
ln -sfn  "$DOTPATH/tmux.conf" "$HOME/.tmux.conf"

# direnv
mkdir -p "$CONFIG_DIR/direnv"
ln -sfn  "$DOTPATH/direnvrc" "$CONFIG_DIR/direnv/direnvrc"

# neovim
ln -sfn "$DOTPATH/vim" "$CONFIG_DIR/nvim"  # just link the whole dir
ln -sfn "$DOTPATH/vim" "$HOME/.vim"  # also for other vims

# eslint
ln -sfn "$DOTPATH/eslintrc.yml" "$HOME/.eslintrc.yml"
