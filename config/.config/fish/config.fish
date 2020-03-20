# ~/.config/fish/config.fish

# Oh My Fish
# if not functions -q omf
#     curl -L https://get.oh-my.fish | fish
# end

set theme_color_scheme gruvbox
set -g theme_nerd_fonts yes
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
# add python3 bins to PATH
export PATH="$HOME/Library/Python/3.7/bin:$PATH"
# add poetry to PATH
export PATH="$HOME/.poetry/bin:$PATH"
# add ruby gems to path
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
# add rust tools to path
export PATH="$HOME/.cargo/bin:$PATH"

set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

# ----- Aliases ----- #
# TODO: Test these
alias e "nvim"
alias v "nvim"
alias vi "nvim"
alias vim "nvim"

alias ls "exa --group-directories-first"
alias cat "bat"

alias rg='rg --smart-case'

alias glog "git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# fasd
alias j 'fasd_cd -d'
# alias v 'f -e vim'
alias o 'a -e open'

# ----- Abbreviations ----- #

# --- General ---
abbr -a c clear
abbr -a q exit

abbr -a popd prevd

# faster traversal up dirs
abbr -a ... "../../"
abbr -a .... "../../../"
abbr -a ..... "../../../../"
abbr -a ...... "../../../../../"

# ls
abbr -a lsa "ls -a"
abbr -a l "ls -1"
abbr -a la "ls -1a"
abbr -a ll "ls -lh --git"
abbr -a lla "ls -lh --git -a"
abbr -a llg "ll --grid"
abbr -a llga "ll --grid -a"
abbr -a lt "ls -T"
abbr -a lta "ls -T -a"
abbr -a llt "ll -T"
abbr -a llta "ll -T -a"

abbr -a mk "make"

# --- Docker Compose ---
abbr -a dc "docker-compose"
abbr -a dcu "docker-compose up"
abbr -a dcd "docker-compose down"
abbr -a ld "env TERM=screen-256color lazydocker"

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
abbr -a gf "git fetch"
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
abbr -a rgl "rg -l"

# --- Vagrant --- #
abbr -a vu "vagrant up"
abbr -a vd "vagrant destroy"
abbr -a vh "vagrant halt"
abbr -a vss "vagrant ssh"

# ----- Misc ----- #
# vim
export VISUAL=nvim
export EDITOR="$VISUAL"

# fzf
function __fzf_file_preview -a file
    bat --line-range :100 --color=always $file
end

function __fzf_dir_preview -a dir
    exa --tree --level 1 --all --color=always $dir
end

function __fzf_either_preview -a file
    if test -d $file
        __fzf_dir_preview $file
    else if test -e $file
        __fzf_file_preview $file
    end
end

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND='fd --hidden --follow --no-ignore-vcs --exclude ".git" --exclude ".direnv"'
export FZF_CTRL_T_OPTS='--preview "__fzf_either_preview {}"'
export FZF_ALT_C_COMMAND='fd --type directory --hidden --follow --no-ignore-vcs --exclude ".git"'
export FZF_ALT_C_OPTS='--preview "__fzf_dir_preview {}"'
export FZF_OPEN_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_OPEN_OPTS='--height 40% --reverse'

# for some reason, this isn't getting set via omf
bind \co '__fzf_open --editor'

function fco -d "Fuzzy-find and checkout a branch"
    git branch --all | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
end

# --- python ---
export PYTHONDONTWRITEBYTECODE=1  # prevent .pyc files

# --- direnv ---
direnv hook fish | source

# color test
function colortest
    awk 'BEGIN{
        s="/\\\\/\\\\/\\\\/\\\\/\\\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "\n";
    }'
end

if status is-interactive
and not set -q TMUX
    # TODO: Find out why the hell this borks fzf when not inside this conditional
    bash "$HOME/.local/share/nvim/site/plugged/gruvbox/gruvbox_256palette.sh"
    # attach to session "main" if it exists, otherwise create it
    # TODO: Attach only if none attached
    # exec tmux new-session -A -s main
end
