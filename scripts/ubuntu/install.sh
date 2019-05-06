#!/bin/bash

echo "Adding repositories..."
sudo apt-get install software-properties-common
REPOSITORIES=(
    ppa:neovim-ppa/stable
    ppa:aacebedo/fasd
)
for repo in "${REPOSITORIES[@]}"; do
    sudo add-apt-repository "$repo"
    echo "$repo"
done
echo 'deb http://download.opensuse.org/repositories/shells:/zsh-users:/zsh-completions/xUbuntu_16.04/ /' | sudo tee -a "/etc/apt/sources.list.d/zsh-completions.list" > /dev/null

# Update apt-get
echo "Updating apt-get..."
sudo apt-get update

echo "Installing packages..."
PACKAGES=(
    alacritty
    autoconf
    awscli
    ctags
    direnv
    fasd
    git
    lua
    neovim
    nodejs
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

echo "Installing fzf..."
git clone --depth 1 "https://github.com/junegunn/fzf.git $HOME/.fzf"
pushd "$HOME/.fzf" || exit
sudo install || echo "Failed.";
popd || exit

echo "Installing hub..."
wget --progress=bar:force https://github.com/github/hub/releases/download/v2.3.0-pre10/hub-linux-amd64-2.3.0-pre10.tgz
tar -xvzf hub-linux-amd64-2.3.0-pre10.tgz /bin/hub
rm hub-linux-amd64-2.3.0-pre10.tgz

echo "Installing Oh My Zsh..."
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

echo "Installion complete."
