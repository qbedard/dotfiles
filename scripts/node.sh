#!/bin/bash

echo "Updating npm..."
npm update -g

echo "Installing Node.js packages..."
PACKAGES=(
    csslint
    eslint
    htmlhint
    instant-markdown-d
    jsonlint
    # markdownlint-cli  # noisy and slow
    neovim
)
npm install -g "${PACKAGES[@]}"

echo "Node.js package installation completed."
