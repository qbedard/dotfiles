# ~/.config/fish/config.fish

# Oh My Fish
# if not functions -q omf
#     curl -L https://get.oh-my.fish | fish
# end

# Modify the terminal's 256 color palette to use the gruvbox theme
# set -l GRUVBOX_SCRIPT "$HOME/.local/share/nvim/site/plugged/gruvbox/gruvbox_256palette.sh"
# if test -f $GRUVBOX_SCRIPT
#   bash $GRUVBOX_SCRIPT
# end

set -g theme_nerd_fonts yes
set theme_color_scheme gruvbox
set -g theme_date_format "+%a %b %d %l:%M%p"

# disable greeting
function fish_greeting; end

if functions -q fzf_key_bindings
    fzf_key_bindings
end

# ----- PATH ----- #
# add openssl to path for compilers
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
# add poetry to PATH
export PATH="$HOME/.poetry/bin:$PATH"

# ----- Aliases ----- #
alias vi "nvim"
alias vim "nvim"
alias ls "exa --group-directories-first"
alias cat "bat"
# alias git "hub"

alias rg='rg --smart-case'

alias glog "git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

alias j 'fasd_cd -d'
alias v 'f -e vim'
alias o 'a -e open'

# ----- Abbreviations ----- #

# --- General ---
abbr -a c clear
abbr -a q exit

# ls
abbr -a l "ls -1"
abbr -a la "l -a"
abbr -a ll "ls -lh --git"
abbr -a llg "ll --grid"
abbr -a lt "ls -T"
abbr -a llt "ll -T"

abbr -a mk "make"
abbr -a r "ranger"

# --- Docker Compose ---
abbr -a dc "docker-compose"
abbr -a dcu "docker-compose up"
abbr -a dcd "docker-compose down"
abbr -a ld "lazydocker"

# --- Git ---
abbr -a gs "git status -sb"
abbr -a ga "git add"
abbr -a gaa "git add ."
abbr -a gc "git commit -v"
abbr -a gcm "git commit -m"
abbr -a gca "git commit -av"
abbr -a gcam "git commit -am"
abbr -a gr "git reset"
abbr -a gb "git branch"
abbr -a gbc "git checkout -b"
abbr -a gco "git checkout"
abbr -a gd "git diff"
abbr -a gdtv "git difftool"
abbr -a gm "git merge"
abbr -a gp "git push"
abbr -a gl "git pull"
abbr -a gt "git tag"

# --- Python ---
abbr -a pup "pip install --upgrade pip"
abbr -a pup2 "pip2 install --upgrade pip"
abbr -a pup3 "pip3 install --upgrade pip"
abbr -a pe "pipenv"
abbr -a pei "pipenv install"

# --- ripgrep ---
abbr -a rgp "rg -g '*.py'"

# --- Vagrant --- #
abbr -a vu "vagrant up"
abbr -a vd "vagrant destroy"
abbr -a vh "vagrant halt"
abbr -a vss "vagrant ssh"

# ----- Misc ----- #
# vim
export VISUAL=nvim
export EDITOR="$VISUAL"

# use rg with fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# --- python ---
export PYTHONDONTWRITEBYTECODE=1  # prevent .pyc files
