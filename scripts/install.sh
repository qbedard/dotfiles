#!/bin/bash

# Note: This script requires that the following be done before running:
# 1. Install Xcode.
# 2. Install Command Line Tools.
# 3. Accept the CLT agreement.

# Things this script does not install:
# - Magnet

# Homebrew
if test ! $(which brew); then
    echo "Installing Homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update recipes
echo "Updating Homebrew..."
brew update

echo "Installing packages..."
PACKAGES=(
    autoconf
    awscli
    ctags
    direnv
    fasd
    fzf
    git
    hub
    neovim
    node
    npm
    python
    python3
    ranger
    ruby
    sequel-pro
    the_silver_searcher
    tree
    zsh
    zsh-completions
)
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing Cask..."
brew tap caskroom/cask

echo "Installing Cask apps..."
CASKS=(
    alfred
    firefox
    insomnia
    iterm2
    slack
    virtualbox
)
brew cask install ${CASKS[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-source-code-pro-for-powerline
)
brew cask install ${FONTS[@]}

echo "Installing Python 2 packages..."
PYTHON2_PACKAGES=(
    ipython
    jedi
    neovim
)
pip2 install ${PYTHON2_PACKAGES[@]}

echo "Installing Python 3 packages..."
PYTHON3_PACKAGES=(
    ipython
    jedi
    neovim
    virtualenv
    virtualenvwrapper
)
pip3 install ${PYTHON3_PACKAGES[@]}

# echo "Installing Ruby gems..."
# RUBY_GEMS=(
#     bundler
#     filewatcher
#     jekyll
# )
# sudo gem install ${RUBY_GEMS[@]}

# echo "Installing global npm packages..."
# npm install marked -g

echo "Installing Oh My Zsh..."
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Installion complete."
