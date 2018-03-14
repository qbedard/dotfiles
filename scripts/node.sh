#!/bin/bash

echo "Installing Node.js packages..."
PACKAGES=(
    eslint
    htmlhint
)
npm install -g "${PACKAGES[@]}"

echo "Setting up eslint config..."
eslint --init

echo "Node.js package installation completed."
