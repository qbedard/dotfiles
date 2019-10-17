#!/bin/bash

# Note: This script requires that the following be done before running:
# 1. Install Xcode.
# 2. Install Command Line Tools.
# 3. Accept the CLT agreement.

# Things this script does not install:
# - Magnet

# Homebrew
if test ! "$(which brew)"; then
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update recipes
echo "Updating Homebrew..."
brew update

echo "Installing packages..."
PACKAGES=(
    awscli
    bat  # cat replacement
    # ctags
    direnv
    docker-completions
    docker-compose-completions
    exa  # ls replacement
    fasd  # fast dir nav
    fd  # find replacement
    fzf  # fuzzy
    git
    hub  # GitHub tools
    lazydocker  # docker term UI
    lua
    neovim
    python@2
    python3
    ranger  # terminal file browser
    reattach-to-user-namespace  # fix tmux mac issues
    ripgrep  # awesome grep
    ruby
    shellcheck  # sh linter
    tmux
    zsh
    zsh-completions
)
brew install "${PACKAGES[@]}"

echo "Installing universal-ctags..."
brew install --HEAD universal-ctags/universal-ctags/universal-ctags

echo "Cleaning up..."
brew cleanup

echo "Installing Cask..."
brew tap homebrew/cask
brew tap homebrew/cask-versions

echo "Installing Cask apps..."
CASKS=(
    alacritty
    alfred
    docker
    firefox-developer-edition
    insomnia
    # iterm2
    # slack
    tableplus
    virtualbox
)
brew cask install "${CASKS[@]}"

echo "Installing fonts..."
brew tap homebrew/cask-fonts
FONTS=(
    font-hack-nerd-font
    font-hack-nerd-font-mono
)
brew cask install "${FONTS[@]}"

echo "Installing Oh My Zsh..."
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Installing zsh-users/zsh-completions..."
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions

# echo "Installing zsh-nvm..."
# git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

echo "Installing fzf shell extensions..."
/usr/local/opt/fzf/install

echo "Installing tpm (Tmux Plugin Manager)..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# echo "Installing base16 theme shell script..."
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

echo "Installion complete."
