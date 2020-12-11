# ~/.config/fish/config.fish

# Oh My Fish
# if not functions -q omf
#   curl -L https://get.oh-my.fish | fish
# end

# set theme_color_scheme gruvbox
set -g theme_nerd_fonts yes
set -g theme_date_format "+%a %b %d %l:%M%p"
set -g theme_date_timezone America/Chicago

# disable greeting
function fish_greeting; end

# ----- PATH ----- #
set -gp fish_user_paths "$HOME/bin"  # custom binarys
# set -gp fish_user_paths "$HOME/Library/Python/3.7/bin"  # python3
set -gp fish_user_paths "$HOME/.poetry/bin"  # poetry
set -gp fish_user_paths "/usr/local/opt/ruby/bin"  # ruby
set -gp fish_user_paths "/usr/local/lib/ruby/gems/2.7.0/bin"  # ruby gems
set -gp fish_user_paths "$HOME/.cargo/bin"  # rust

# add openssl for compilers
set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"

# use sccache for cargo
if command -v sccache > /dev/null
  set -gx RUSTC_WRAPPER "sccache"
end

# ----- Aliases ----- #
# TODO: Test these
alias e "nvim"
alias v "nvim"
alias vi "nvim"
alias vim "nvim"

if command -v exa > /dev/null
  alias ls "exa --group-directories-first --icons"
end
if command -v bat > /dev/null
  alias cat "bat"
end

# TODO: maybe move this to a ripgreprc (pointed at by setting RIPGREP_CONFIG_PATH)
alias rg 'rg --smart-case --max-columns=120 --max-columns-preview'

alias glog "\
  git log --graph --abbrev-commit --date=relative \
  --pretty=format:'%Cred%h%Creset %an: %s - \
  %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset'"

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
abbr -a la "ls -1a"
abbr -a ll "ls -lh"
abbr -a lla "ls -lh -a"

if command -v exa > /dev/null
  abbr -a ll "ls -lh --git"
  abbr -a lla "ls -lh --git -a"
  abbr -a llg "ll --grid"
  abbr -a llga "ll --grid -a"
  abbr -a lt "ls -T"
  abbr -a lta "ls -T -a"
  abbr -a llt "ll -T"
  abbr -a llta "ll -T -a"
end

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
abbr -a gpu "git push -u"
abbr -a gf "git fetch"
abbr -a gl "git pull"
abbr -a gt "git tag"

# --- Python ---
abbr -a pup "pip install --upgrade pip"
abbr -a pup2 "pip2 install --upgrade pip"
abbr -a pup3 "pip3 install --upgrade pip"

# --- ripgrep ---
abbr -a rgm "rg -g '*.mako'"
abbr -a rgp "rg -g '*.py'"
abbr -a rgv "rg -g '*.vim'"
abbr -a rgl "rg -l"
abbr -a rge vim_last_rg

# --- Vagrant ---
abbr -a vu "vagrant up"
abbr -a vd "vagrant destroy"
abbr -a vh "vagrant halt"
abbr -a vss "vagrant ssh"

# ----- Misc ----- #
# vim
set -gx VISUAL nvim
set -gx EDITOR "$VISUAL"

# bat
# use bat as man pager
set -gx MANPAGER "sh -c 'col -bx | bat --language man --plain'"

# find missing python deps
function rg-deps
  rg -INoP '^\s*(import|from) \K(\w*)' | sort | uniq | awk '{if( system("echo \'import " $0 "\' | python >/dev/null 2>&1") ) {print $0}}'
end

# fzf
if command -v bat > /dev/null
  set -gx FZF_FILE_PREVIEW_CMD "bat --line-range :100 --color=always"
else
  set -gx FZF_FILE_PREVIEW_CMD "head -n 100"
end

function __fzf_file_preview -a file
  fish -c "$FZF_FILE_PREVIEW_CMD $file"
end

if command -v exa > /dev/null
  set -gx FZF_DIR_PREVIEW_CMD "exa --tree --level 1 --all --icons --color=always"
else
  set -gx FZF_DIR_PREVIEW_CMD "ls -1 -a"
end

function __fzf_dir_preview -a dir
  fish -c "$FZF_DIR_PREVIEW_CMD (echo $dir | sed 's/^[ 0-9]*//' )"  # strip leading spaces/numbers
end

function __fzf_either_preview -a file
  if test -d $file
    __fzf_dir_preview $file
  else if test -e $file
    __fzf_file_preview $file
  end
end

if command -v rg > /dev/null
  set -gx FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
end
if command -v rg > /dev/null
  set -gx FZF_CTRL_T_COMMAND '\
    fd --hidden --follow --no-ignore-vcs --exclude ".git" --exclude ".direnv" --exclude ".venv"'
  set -gx FZF_ALT_C_COMMAND '\
    fd --type directory --hidden --follow --no-ignore-vcs --exclude ".git"'
end

set -gx FZF_CTRL_T_OPTS '--preview "__fzf_either_preview {}"'
set -gx FZF_ALT_C_OPTS '--preview "__fzf_dir_preview {}"'
set -gx FZF_OPEN_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_OPEN_OPTS '--height 40% --reverse --preview "__fzf_file_preview {}"'

set -gx _ZO_FZF_OPTS '--height=50% --reverse --preview "__fzf_dir_preview {}"'

# for some reason, this isn't getting set via omf
bind \co '__fzf_open --editor'
# try this out too
bind \ce '__fzf_open --editor'

bind \cs '__fzf_ripgrep'

bind \cg\cf __fzf_git_diff_file
bind \cg\cb __fzf_git_branch
bind \cg\ct __fzf_git_tag
bind \cg\cc __fzf_git_commit_hash  # bound to c instead of h because C-hjkl nav around
bind \cg\cr __fzf_git_remote
bind \cg\cs __fzf_git_stash

function fco -d "Fuzzy-find and checkout a branch"
  git branch --all | grep -v HEAD | string trim | \
    fzf | read -l result; and git checkout "$result"
end

# --- python ---
set -gx PYTHONDONTWRITEBYTECODE 1  # prevent .pyc files

# --- direnv ---
if command -v direnv > /dev/null
  direnv hook fish | source
end

if status is-interactive
and not set -q TMUX
  # TODO: Find out why the hell this borks fzf when not inside this conditional
  bash "$HOME/.local/share/nvim/site/pack/packer/start/gruvbox/gruvbox_256palette.sh"
  # attach to session "main" if it exists, otherwise create it
  # TODO: Attach only if none attached
  # exec tmux new-session -A -s main
end

# zoxide
if command -v zoxide > /dev/null
  zoxide init fish | source
end

# starship prompt
if command -v starship > /dev/null
  starship init fish | source
end
