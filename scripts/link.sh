#!/bin/bash
DOTPATH="$HOME/.dotfiles"

# zsh
ln -sfn  $DOTPATH/shell/zsh/zshrc ~/.zshrc

# bash
ln -sfn  $DOTPATH/shell/bash/bashrc ~/.bashrc

# neovim
ln -sfn  $DOTPATH/nvim/init.vim ~/.config/nvim/init.vim
ln -sfn  $DOTPATH/nvim/plugins.vim ~/.config/nvim/plugins.vim
ln -sfn  $DOTPATH/nvim/after ~/.config/nvim/after
ln -sfn  $DOTPATH/nvim/ftplugin ~/.config/nvim/ftplugin

# ranger
ln -sfn  $DOTPATH/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sfn  $DOTPATH/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sfn  $DOTPATH/ranger/scope.sh ~/.config/ranger/scope.sh
ln -sfn  $DOTPATH/ranger/commands.py ~/.config/ranger/commands.py
