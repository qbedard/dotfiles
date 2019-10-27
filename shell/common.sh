# ----- PATH ----- #
if [[ "$OSTYPE" == "darwin"* ]]; then
  # add brew's local bins
  export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

  # add openssl to path for compilers
  export LDFLAGS="-L/usr/local/opt/openssl/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl/include"

  # add python 2 to path
  export PATH="/usr/local/opt/python@2/bin:$PATH"

  export PATH="$HOME/.poetry/bin:$PATH"

  # add ruby bins to path
  export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

  # go root
  export GOROOT="$(brew --prefix golang)/libexec"
fi

# add cargo binaries to path
export PATH="$HOME/.cargo/bin:$PATH"

# add go binaries to path
export GOPATH="$HOME/.go"
export PATH="${GOPATH}/bin:${GOROOT}/bin:$PATH"

# add yarn binaries and modules to path
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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

alias ls="exa --group-directories-first"
alias l="ls -1"
alias la="l -a"
alias ll="ls -lh --git"
alias llg="ll --grid"
alias lt="ls -T"
alias llt="ll -T"

alias cat="bat"

alias r="ranger"

alias vzs="vim ~/.zshrc"
alias rzs=". ~/.zshrc"
alias vbs="vim ~/.bashrc"
alias rbs=". ~/.bashrc"
alias vr="vim ~/.dotfiles/vim/init.vim"
alias vp="vim ~/.dotfiles/vim/plugins.vim"

# --- Docker Compose --- #
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
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

# --- Python ---
alias pup="pip install --upgrade pip"
alias pup2="pip2 install --upgrade pip"
alias pup3="pip3 install --upgrade pip"
alias pe="pipenv"
alias pei="pipenv install"

# --- ripgrep ---
alias rgp="rg -g '*.py'"

# --- Vagrant ---
alias vu="vagrant up"
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vss="vagrant ssh"

# ----- Tool Config ----- #
export VISUAL=nvim
export EDITOR=nvim

# 10ms for key sequences
export KEYTIMEOUT=1

# --- gruvbox Colors --- #
. "$HOME/.local/share/nvim/site/plugged/gruvbox/gruvbox_256palette.sh"

# --- Base16 Theme ---
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#   [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#     eval "$("$BASE16_SHELL/profile_helper.sh")"

# --- cheat ---
export CHEATCOLORS=true

# --- direnv ---
# append a nice env identifier if we're in a direnv venv
show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ] && \
     [ "$(basename "$(dirname "$VIRTUAL_ENV")")" = '.direnv' ]
    # regular direnv
  then
    direnv_parent="$(dirname "$(dirname "$VIRTUAL_ENV")")"
    echo "(d:$(basename "$direnv_parent"))"
  elif [ -n "$VIRTUAL_ENV" ] && \
       [ "$(dirname "$VIRTUAL_ENV")" = "$XDG_DATA_HOME/virtualenvs" ]
    # Pipenv (expects global venv dir, not local .venv)
  then
    echo "(p:$(basename "$VIRTUAL_ENV"))"
  fi
}
PS1='$(show_virtual_env)'$PS1

# --- fasd ---
fasd_cache="$HOME/.fasd-init-sh"
if [ "$(command -v fasd)" -nt "$fasd_cache" ] || [ ! -s "$fasd_cache" ]; then
  fasd --init auto >| "$fasd_cache"
fi
. "$fasd_cache"
unset fasd_cache

alias j='fasd_cd -d'
alias v='f -e vim'
alias o='a -e open'

# --- fzf ---
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && . /usr/share/fzf/key-bindings.zsh

# use rg with fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# --- nvm ---
if command -v nvm > /dev/null; then
  # export NVM_DIR="$HOME/.nvm"
  # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  # [ -s "$NVM_DIR/etc/bash_completion" ] && . "$NVM_DIR/etc/bash_completion"  # This loads nvm bash_completion

  # add npm bins to PATH
  for d in "$NVM_DIR/versions/node"/v*/bin; do PATH="$PATH:$d"; done
fi

# --- python ---
export PYTHONDONTWRITEBYTECODE=1  # prevent .pyc files

# --- ripgrep ---
alias rg='rg --smart-case'

# --- rtv ---
export RTV_EDITOR=vim
