#!/bin/bash

echo "Configuring macOS..."

# enable home and end keys to work as expected
mkdir -p "$HOME/Library/KeyBindings"
echo '{
    "\UF729"  = moveToBeginningOfParagraph:; // home
    "\UF72B"  = moveToEndOfParagraph:; // end
    "$\UF729" = moveToBeginningOfParagraphAndModifySelection:; // shift-home
    "$\UF72B" = moveToEndOfParagraphAndModifySelection:; // shift-end
    "^\UF729" = moveToBeginningOfDocument:; // ctrl-home
    "^\UF72B" = moveToEndOfDocument:; // ctrl-end
    "^$\UF729" = moveToBeginningOfDocumentAndModifySelection:; // ctrl-shift-home
    "^$\UF72B" = moveToEndOfDocumentAndModifySelection:; // ctrl-shift-end
}' >"$HOME/Library/KeyBindings/DefaultKeyBindings.dict"

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

# Hammerspoon's default init location is ~/.hammerspoon
defaults write org.hammerspoon.Hammerspoon MJConfigFile "$HOME/.config/hammerspoon/init.lua"
#
# Hide Dock
defaults write com.apple.dock autohide -bool true && killall Dock
defaults write com.apple.dock autohide-delay -float 1000 && killall Dock
defaults write com.apple.dock no-bouncing -bool TRUE && killall Dock

echo "Changing shell to fish..."
# TODO: make this avoid repetitive additions if re-run
sudo echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

echo "Configuration complete."
