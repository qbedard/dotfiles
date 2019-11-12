#!/bin/bash

echo "Configuring macOS..."

DOTPATH="$(git rev-parse --show-toplevel)"

# enable home and end keys to work as expected
mkdir -p "$HOME/Library/KeyBindings"
echo "{
    "\UF729"  = moveToBeginningOfParagraph:; // home
    "\UF72B"  = moveToEndOfParagraph:; // end
    "$\UF729" = moveToBeginningOfParagraphAndModifySelection:; // shift-home
    "$\UF72B" = moveToEndOfParagraphAndModifySelection:; // shift-end
    "^\UF729" = moveToBeginningOfDocument:; // ctrl-home
    "^\UF72B" = moveToEndOfDocument:; // ctrl-end
    "^$\UF729" = moveToBeginningOfDocumentAndModifySelection:; // ctrl-shift-home
    "^$\UF72B" = moveToEndOfDocumentAndModifySelection:; // ctrl-shift-end
}" > $HOME/Library/KeyBindings/DefaultKeyBindings.dict

# Set fast key repeat rate
defaults write -globalDomain InitialKeyRepeat -int 12
defaults write -globalDomain KeyRepeat -int 1

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write -globalDomain AppleShowAllExtensions -bool true

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles YES

# I find tap-to-click awful. I will never enable it.

# Fix italics in iterm + tmux + vim
# src: https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
tic -x "$DOTPATH/scripts/mac/xterm-256color-italic.terminfo"
tic -x "$DOTPATH/scripts/mac/tmux-256color.terminfo"

echo "Changing shell to fish..."
# TODO: make this avoid repetitive additions if re-run
sudo echo "/usr/local/bin/fish" >> /etc/shells
chsh -s /usr/local/bin/fish

echo "Configuration complete."
