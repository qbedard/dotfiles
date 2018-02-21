#!/bin/bash
DOTPATH=$HOME/.dotfiles

echo "Configuring macOS..."

# enable home and end keys to work as expected
mkdir -p $HOME/Library/KeyBindings
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
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2

# Require password as soon as screensaver or sleep mode starts
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show filename extensions by default
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# I find tap-to-click awful. I will never enable it.

echo "Configuration complete."
