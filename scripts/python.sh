#!/bin/bash

echo "Upgrading pip..."
pip2 install --upgrade pip
pip3 install --upgrade pip

echo "Installing Python 2 packages..."
PYTHON2_PACKAGES=(
    neovim
)
pip2 install "${PYTHON2_PACKAGES[@]}"

echo "Installing Python 3 packages..."
PYTHON3_PACKAGES=(
    black
    flake8
    ipython
    isort
    jedi
    neovim
    vim-vint
)
pip3 install "${PYTHON3_PACKAGES[@]}"

echo "Python package installation completed."
