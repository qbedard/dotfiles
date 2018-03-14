#!/bin/bash

echo "Updating npm..."
npm update -g

echo "Installing Node.js packages..."
PACKAGES=(
    csslint
    eslint
    htmlhint
    jsonlint
    markdownlint-cli
)
npm install -g "${PACKAGES[@]}"

echo "Node.js package installation completed."
