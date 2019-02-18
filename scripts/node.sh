#!/bin/bash

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

echo "Installing node..."
nvm install node

echo "Updating npm..."
npm update -g

echo "Installing Node.js packages..."
PACKAGES=(
    csslint
    eslint
    htmlhint
    instant-markdown-d  # vim md preview
    jsonlint
    # markdownlint-cli  # noisy and slow
    neovim
)
npm install -g "${PACKAGES[@]}"

echo "Node.js package installation completed."
