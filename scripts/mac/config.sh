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

echo "Changing shell to fish..."
# TODO: make this avoid repetitive additions if re-run
sudo echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

echo "Configuration complete."
