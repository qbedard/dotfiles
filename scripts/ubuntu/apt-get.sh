#!/bin/bash

echo "Adding repositories..."
sudo apt-get install software-properties-common
REPOSITORIES=(
    ppa:neovim-ppa/stable
    ppa:aacebedo/fasd
)
sudo add-apt-repository "${REPOSITORIES[@]}"
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_16.04/ /' | sudo tee -a "/etc/apt/sources.list.d/zsh-completions.list" > /dev/null

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
    python-pip
    python3
    python3-pip
    ranger
    ruby
    shellcheck
    silversearcher-ag
    tree
    zsh
    zsh-completions
)
sudo apt-get install "${PACKAGES[@]}"

echo "Cleaning up..."
sudo apt-get cleanup

echo "Installing Oh My Zsh..."
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Installing fzf..."
/usr/local/opt/fzf/install || echo "Failed."; exit

echo "Installion complete."
