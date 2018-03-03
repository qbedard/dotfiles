#!/bin/bash

echo "Upgrading pip..."
sudo pip2 install --upgrade pip
sudo pip3 install --upgrade pip

echo "Installing Python 2 packages..."
PYTHON2_PACKAGES=(
    flake8
    ipython
    jedi
    neovim
)
sudo -H pip2 install "${PYTHON2_PACKAGES[@]}"

echo "Installing Python 3 packages..."
PYTHON3_PACKAGES=(
    flake8
    ipython
    jedi
    neovim
    vim-vint
    virtualenv
    virtualenvwrapper
)
sudo -H pip3 install "${PYTHON3_PACKAGES[@]}"

echo "Python package installation completed."
