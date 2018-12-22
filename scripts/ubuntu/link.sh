#!/bin/bash
DOTPATH="$HOME/.dotfiles"

echo "Linking config files..."

# make .config dir if it doesn't exist
mkdir -p "$HOME/.config"

# zsh
ln -sfn  "$DOTPATH/shell/zsh/zshrc" "$HOME/.zshrc"

# bash
ln -sfn  "$DOTPATH/shell/bash/bashrc" "$HOME/.bashrc"

# neovim
ln -sfn "$DOTPATH/vim" "$HOME/.config/nvim"  # just link the whole dir
ln -sfn "$DOTPATH/vim" "$HOME/.vim"  # also for other vims

# TODO: This needs some attention to get vim to see neovim's local data.
# ln -sfn "$HOME/.local/share/nvim/site" "/usr/share/vim/vimfiles"  # share the share files

# mkdir -p "$HOME/.config/nvim"
# ln -sfn "$DOTPATH/vim/init.vim" "$HOME/.config/nvim/init.vim"
# ln -sfn "$DOTPATH/vim/plugins.vim" "$HOME/.config/nvim/plugins.vim"
# ln -sfn "$DOTPATH/vim/after" "$HOME/.config/nvim/after"
# ln -sfn "$DOTPATH/vim/ftplugin" "$HOME/.config/nvim/ftplugin"

# ranger
mkdir -p "$HOME/.config/ranger"
ln -sfn "$DOTPATH/ranger/rc.conf" "$HOME/.config/ranger/rc.conf"
ln -sfn "$DOTPATH/ranger/rifle.conf" "$HOME/.config/ranger/rifle.conf"
ln -sfn "$DOTPATH/ranger/scope.sh" "$HOME/.config/ranger/scope.sh"
ln -sfn "$DOTPATH/ranger/commands.py" "$HOME/.config/ranger/commands.py"

# eslint
ln -sfn "$DOTPATH/eslintrc.yml" "$HOME/.eslintrc.yml"
