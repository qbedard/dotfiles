#!/bin/bash

echo "Installing Ruby gems..."
RUBY_GEMS=(
    bundler
    filewatcher
    jekyll
    neovim
)
gem install "${RUBY_GEMS[@]}"

echo "Ruby package installation completed."
