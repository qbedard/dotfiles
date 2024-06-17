# ~/.config/fish/config.fish
# --------------------------------- General ---------------------------------- #
set -gx PAGER less --tabs=4 -RFX
set -gx PYTHONDONTWRITEBYTECODE 1 # prevent .pyc files
set -gx SAM_CLI_TELEMETRY 0
set -gx SHELL fish

set -g theme_nerd_fonts yes
set -g theme_date_format "+%a %b %d %l:%M%p"
set -g theme_date_timezone America/Chicago

# disable greeting
function fish_greeting
end

fish_add_path "$HOME/bin" # custom binaries
fish_add_path "$HOME/.local/bin" # local binaries
fish_add_path "$HOME/.cargo/bin" # rust
fish_add_path "$HOME/go/bin" # go

# faster traversal up dirs
abbr -a ... "../../"
abbr -a .... "../../../"
abbr -a ..... "../../../../"
abbr -a ...... "../../../../../"

abbr -a l "ls -1"
abbr -a la "ls -1a"
abbr -a ll "ls -lh"
abbr -a lla "ls -lh -a"
abbr -a lsa "ls -a"
abbr -a popd prevd
abbr -a q exit

# --- Docker --- #
abbr -a dc "docker compose"
abbr -a dcb "docker compose build"
abbr -a dcu "docker compose up"
abbr -a dcud "docker compose up -d"
abbr -a dcd "docker compose down"
abbr -a dcr "docker compose run"

abbr -a ld lazydocker

# --- Git --- #
abbr -a ga "git add"
abbr -a gaa "git add ."
abbr -a gb "git branch"
abbr -a gbc "git checkout -b"
abbr -a gc "git commit -v"
abbr -a gca "git commit -av"
abbr -a gcam "git commit -am"
abbr -a gcm "git commit -m"
abbr -a gco "git checkout"
abbr -a gd "git diff"
abbr -a gdtv "git difftool"
abbr -a gf "git fetch"
abbr -a gl "git pull"
abbr -a gm "git merge"
abbr -a gp "git push"
abbr -a gpu "git push -u"
abbr -a gr "git reset"
abbr -a gs "git status -sb"
abbr -a gt "git tag"

alias glog "\
    git log --color --graph --abbrev-commit --date=relative \
        --pretty=format:'%Cred%h%Creset %s%C(yellow)%d %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

# --- Python --- #
abbr -a poi "poetry install"
abbr -a pup "pip install --upgrade pip"
abbr -a pup2 "pip2 install --upgrade pip"
abbr -a pup3 "pip3 install --upgrade pip"

# -------------------------------- App Config -------------------------------- #
if command -q brew
    brew shellenv | source

    # Install casks to ~/Applications
    set -gx HOMEBREW_CASK_OPTS "--appdir=$HOME/Applications"

    # add openssl for compilers
    set -gx CPPFLAGS -I$HOMEBREW_PREFIX/opt/openssl/include
    set -gx LDFLAGS -L$HOMEBREW_PREFIX/opt/openssl/lib
end

if command -q bat
    alias cat bat
    set -gx MANPAGER "sh -c 'col -bx | bat --language man --plain'"
end

if command -q eza
    set -gx EZA_ICONS_AUTO 1
    alias eza "eza --group-directories-first"
    alias ls "eza"
    abbr -a ll "ls -lh --git"
    abbr -a lla "ls -lh --git -a"
    abbr -a llg "ll --grid"
    abbr -a llga "ll --grid -a"
    abbr -a llt "ll -T"
    abbr -a llta "ll -T -a"
    abbr -a lt "ls -T"
    abbr -a lta "ls -T -a"
end

if command -q kitty
    alias hg 'kitty +kitten hyperlinked_grep'
end

if command -q nvim
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    abbr -a vim nvim
end

if command -q procs
    alias ps procs
end

if command -q rg
    set -gx RIPGREP_CONFIG_PATH "$HOME/.ripgreprc"
    abbr -a rge vim_last_rg
    abbr -a rgl "rg -l"
    abbr -a rgm "rg -g '*.mako'"
    abbr -a rgp "rg -g '*.py'"
    abbr -a rgv "rg -g '*.vim'"
end

# use sccache for cargo
if command -q sccache
    set -gx RUSTC_WRAPPER sccache
end

if command -q terraform
    abbr -a tf "terraform"
end

# ----------------------------------- fzf ------------------------------------ #
if command -q bat
    set -gx FZF_FILE_PREVIEW_CMD "bat --line-range :100 --color=always"
else
    set -gx FZF_FILE_PREVIEW_CMD "head -n 100"
end

if command -q fd
    set -gx FZF_CTRL_T_COMMAND "fd --strip-cwd-prefix --hidden --follow --no-ignore-vcs"
    set -gx FZF_ALT_C_COMMAND \
        "fd --strip-cwd-prefix --type directory --hidden --follow --no-ignore-vcs"
end

if command -q eza
    set -gx FZF_DIR_PREVIEW_CMD \
        "eza --tree --level 1 --all --icons --color=always --group-directories-first"
else
    set -gx FZF_DIR_PREVIEW_CMD "ls -1 -a"
end

if command -q rg
    set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow"
end

function __fzf_file_preview -a file
    fish -c "$FZF_FILE_PREVIEW_CMD $file"
end

function __fzf_dir_preview -a dir
    # strip leading spaces/numbers
    fish -c "$FZF_DIR_PREVIEW_CMD (echo $dir | sed 's/^[ 0-9]*//' )"
end

function __fzf_either_preview -a file
    if test -d $file
        __fzf_dir_preview $file
    else if test -e $file
        __fzf_file_preview $file
    end
end

set -gx FZF_CTRL_T_OPTS '--preview "__fzf_either_preview {}"'
set -gx FZF_ALT_C_OPTS '--preview "__fzf_dir_preview {}"'
set -gx FZF_OPEN_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_OPEN_OPTS '--height 40% --reverse --preview "__fzf_file_preview {}"'

set -gx _ZO_FZF_OPTS '--height=50% --reverse --preview "__fzf_dir_preview {}"'

bind \cs __fzf_ripgrep

bind \cg\cf __fzf_git_diff_file
bind \cg\cb __fzf_git_branch
bind \cg\ct __fzf_git_tag
bind \cg\cc __fzf_git_commit_hash # bound to c instead of h because C-h = bkspc
bind \cg\cr __fzf_git_remote
bind \cg\cs __fzf_git_stash

function fco -d "Fuzzy-find and checkout a branch"
    git branch --all | grep -v HEAD | string trim | fzf | read -l result
    git checkout "$result"
end

function rg-deps -d "Find missing Python dependencies"
    rg -INoP '^\s*(import|from) \K(\w*)' | sort | uniq | awk \
        '{if( system("echo \'import " $0 "\' | python >/dev/null 2>&1") ) {print $0}}'
end

# ---------------------------------- Hooks ----------------------------------- #
# if command -q mise
#     mise activate fish | source
# end

if command -q pdm
    pdm --pep582 fish | source
end

if command -q direnv
    direnv hook fish | source
end

if command -q starship
    starship init fish | source
end

if command -q zoxide
    zoxide init fish | source
end

# ----------------------------- Hooks Dependent ------------------------------ #
if command -q devmoji
    alias glog "\
        git log --color --graph --abbrev-commit --date=relative \
            --pretty=format:'%Cred%h%Creset %s%C(yellow)%d %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
            | devmoji --log --color | $PAGER"
end
