#!/bin/bash

echo "Installing Node.js packages..."
PACKAGES=(
    csslint
    eslint
    htmlhint
)
npm install -g "${PACKAGES[@]}"

echo "Node.js package installation completed."
