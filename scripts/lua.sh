#!/bin/bash

echo "Installing luarocks packages..."
LUAROCKS_PACKAGES=(
    luacheck
)
pip2 install "${LUAROCKS_PACKAGES[@]}"

echo "Lua package installation completed."
