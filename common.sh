# ----- PATH ----- #
if [[ "$OSTYPE" == "darwin"* ]]; then
  # add brew's local bins
  export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

  # add openssl to path for compilers
  export LDFLAGS="-L/usr/local/opt/openssl/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl/include"
fi

export PATH="$HOME/bin:$PATH"        # custom binaries
export PATH="$HOME/.cargo/bin:$PATH" # rust
export PATH="$HOME/go/bin"           # go

# XDG_DATA_HOME
if [ -z "$XDG_DATA_HOME" ]; then
  XDG_DATA_HOME="$HOME/.local/share"
fi

# ----- Aliases ----- #
alias vim="nvim"
alias vi="nvim"

# --- General ---
alias c="clear"
alias q="exit"
alias quit="exit"

alias ls="eza --group-directories-first"
alias l="ls -1"
alias la="l -a"
alias ll="ls -lh --git"
alias llg="ll --grid"
alias lt="ls -T"
alias llt="ll -T"

alias cat="bat"

# --- Docker Compose --- #
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias ld="lazydocker"

# --- Git ---
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit -v"
alias gcm="git commit -m"
alias gca="git commit -av"
alias gcam="git commit -am"
alias gr="git reset"
alias gb="git branch"
alias gbc="git checkout -b"
alias gco="git checkout"
alias gd="git diff"
alias gdtv="git difftool"
alias gm="git merge"
alias gp="git push"
alias gl="git pull"
alias gt="git tag"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# ----- Tool Config ----- #
export VISUAL=nvim
export EDITOR=nvim

# 10ms for key sequences
export KEYTIMEOUT=1

# --- gruvbox Colors --- #
# . "$HOME/.local/share/nvim/site/plugged/gruvbox/gruvbox_256palette.sh"

# --- Base16 Theme ---
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#   [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#     eval "$("$BASE16_SHELL/profile_helper.sh")"

# --- cheat ---
export CHEATCOLORS=true

# use rg with fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# --- python ---
export PYTHONDONTWRITEBYTECODE=1 # prevent .pyc files
