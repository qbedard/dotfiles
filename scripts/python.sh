#!/bin/bash

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

echo "Python package installation completed."
