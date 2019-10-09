# Fisher
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

eval (starship init fish)

# theme_gruvbox dark

# Modify the terminal's 256 color palette to use the gruvbox theme
# set -l GRUVBOX_SCRIPT "$HOME/.local/share/nvim/site/plugged/gruvbox/gruvbox_256palette.sh"
# if test -f $GRUVBOX_SCRIPT
#   bash $GRUVBOX_SCRIPT
# end
