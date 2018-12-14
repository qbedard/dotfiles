# set global gitignore
git config --global core.excludesfile ~/.dotfiles/ggitignore

# set difftool to neovim
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
git config --global mergetool.vimdiff.cmd \
    "nvim -d \$BASE \$LOCAL \$REMOTE \$MERGED -c '\$wincmd w' -c 'wincmd J'"
