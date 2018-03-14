#!/bin/bash

echo "Upgrading pip..."
pip2 install --upgrade pip
pip3 install --upgrade pip

echo "Updating pip..."
pip2 update
pip3 update

echo "Installing Python 2 packages..."
PYTHON2_PACKAGES=(
    flake8
    ipython
    jedi
    neovim
)
pip2 install "${PYTHON2_PACKAGES[@]}"

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
pip3 install "${PYTHON3_PACKAGES[@]}"

echo "Python package installation completed."
