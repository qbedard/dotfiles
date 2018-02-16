#!/bin/bash
SCRIPTPATH="~/.dotfiles"

# zsh
ln -sfn  $SCRIPTPATH/shell/zsh/zshrc ~/.zshrc

# bash
ln -sfn  $SCRIPTPATH/shell/bash/bashrc ~/.bashrc

# neovim
ln -sfn  $SCRIPTPATH/nvim/init.vim ~/.config/nvim/init.vim
ln -sfn  $SCRIPTPATH/nvim/plugins.vim ~/.config/nvim/plugins.vim
ln -sfn  $SCRIPTPATH/nvim/after ~/.config/nvim/after
ln -sfn  $SCRIPTPATH/nvim/ftplugin ~/.config/nvim/ftplugin

# ranger
ln -sfn  $SCRIPTPATH/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sfn  $SCRIPTPATH/ranger/rifle.conf ~/.config/ranger/rifle.conf
ln -sfn  $SCRIPTPATH/ranger/scope.sh ~/.config/ranger/scope.sh
ln -sfn  $SCRIPTPATH/ranger/commands.py ~/.config/ranger/commands.py
