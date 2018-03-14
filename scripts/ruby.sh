#!/bin/bash

echo "Updating gem..."
gem update

echo "Installing Ruby gems..."
RUBY_GEMS=(
    bundler
    filewatcher
    jekyll
    neovim
    sqlint
)
gem install "${RUBY_GEMS[@]}"

echo "Ruby package installation completed."
