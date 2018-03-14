#!/bin/bash

echo "Installing Node.js packages..."
PACKAGES=(
    eslint
    htmlhint
)
npm install -g "${PACKAGES[@]}"

echo "Node.js package installation completed."
