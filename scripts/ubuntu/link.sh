#!/bin/bash
DOTPATH="$HOME/.dotfiles"

echo "Linking config files..."
# zsh
ln -sfn  $DOTPATH/shell/zsh/zshrc $HOME/.zshrc

# bash
ln -sfn  $DOTPATH/shell/bash/bashrc $HOME/.bashrc

# neovim
mkdir -p $HOME/.config/nvim
ln -sfn $DOTPATH/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sfn $DOTPATH/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sfn $DOTPATH/nvim/plugins.vim $HOME/.config/nvim/plugins.vim
ln -sfn $DOTPATH/nvim/after $HOME/.config/nvim/after
ln -sfn $DOTPATH/nvim/ftplugin $HOME/.config/nvim/ftplugin

# ranger
mkdir -p $HOME/.config/ranger
ln -sfn $DOTPATH/ranger/rc.conf $HOME/.config/ranger/rc.conf
ln -sfn $DOTPATH/ranger/rifle.conf $HOME/.config/ranger/rifle.conf
ln -sfn $DOTPATH/ranger/scope.sh $HOME/.config/ranger/scope.sh
ln -sfn $DOTPATH/ranger/commands.py $HOME/.config/ranger/commands.py
