#!/bin/bash

echo "Adding repositories..."
sudo apt-get install software-properties-common
REPOSITORIES=(
    ppa:neovim-ppa/stable
    ppa:aacebedo/fasd
)
sudo add-apt-repository ${REPOSITORIES}

# Update apt-get
echo "Updating apt-get..."
sudo apt-get update

echo "Installing packages..."
PACKAGES=(
    autoconf
    awscli
    ctags
    direnv
    fasd
    # fzf
    git
    # hub
    neovim
    node
    npm
    python
    python3
    ranger
    ruby
    silversearcher-ag
    tree
    zsh
    # zsh-completions
)
sudo apt-get install ${PACKAGES[@]}

echo "Cleaning up..."
sudo apt-get cleanup

echo "Installing Oh My Zsh..."
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Installing fzf..."
/usr/local/opt/fzf/install || echo "Failed."; exit

echo "Installion complete."
