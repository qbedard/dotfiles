# Oh My Fish
# if not functions -q omf
#     curl -L https://get.oh-my.fish | fish
# end

# Modify the terminal's 256 color palette to use the gruvbox theme
set -l GRUVBOX_SCRIPT "$HOME/.local/share/nvim/site/plugged/gruvbox/gruvbox_256palette.sh"
if test -f $GRUVBOX_SCRIPT
  bash $GRUVBOX_SCRIPT
end

set -g theme_nerd_fonts yes
set theme_color_scheme gruvbox
