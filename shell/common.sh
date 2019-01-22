# ----- PATH ----- #
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# add python 2 to path
export PATH="/usr/local/opt/python@2/bin:$PATH"

# add cargo binaries to path
export PATH="/Users/tim/.cargo/bin:$PATH"

# ----- Aliases ----- #
alias vim="nvim"
alias vi="nvim"

# --- General ---
alias ls="exa --group-directories-first"
alias l="ls -1"
alias la="l -a"
alias ll="ls -lh --git"
alias llg="ll --grid"
alias lt="ls -T"
alias llt="ll -T"
alias q="exit"
alias quit="exit"
alias r="ranger"
alias vzs="vim ~/.zshrc"
alias rzs="source ~/.zshrc"
alias vbs="vim ~/.bashrc"
alias rbs="source ~/.bashrc"
alias vr="vim ~/.dotfiles/vim/init.vim"
alias vp="vim ~/.dotfiles/vim/plugins.vim"

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

# --- GitVersion ---
alias gv="gitversion"
alias gvv="gitversion /showvariable semver"

# --- Python ---
alias pup="pip install --upgrade pip"
alias pup2="pip2 install --upgrade pip"
alias pup3="pip3 install --upgrade pip"

# ----- Vagrant ----- #
alias vu="vagrant up"
alias vd="vagrant destroy"
alias vh="vagrant halt"
alias vss="vagrant ssh"

# ----- Docker Compose ----- #
alias dc="docker-compose"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# ----- UT PyPE  ----- #
# alias pw="pype_workon"
# alias pw2.8="pype_workon 27.8.0"
# alias pw2.11="pype_workon 27.11.0"
# alias pw3.11="pype_workon 36.11.0"
# alias dj="python manage.py"
# alias djrs="python manage.py runserver"
# alias djrss="python manage.py runsslserver"
# alias djsh="python manage.py shell"
# alias djsu="python manage.py createsuperuser"
# alias djm="python manage.py migrate"
# alias djmm="python manage.py makemigrations"
# alias vs="vim settings.py"
# alias vl="vim local_settings.py"

# ----- Tool Config ----- #
export VISUAL=nvim
export EDITOR=nvim

# 10ms for key sequences
export KEYTIMEOUT=1

# --- cheat ---
export CHEATCOLORS=true

# --- direnv ---
# append a nice env identifier if we're in a direnv venv
function show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ] && [ "$(basename $(dirname $VIRTUAL_ENV))" = '.direnv' ]; then
    direnv_parent="$(dirname $(dirname $VIRTUAL_ENV))"
    echo "(d:$(basename $direnv_parent)) "
  fi
}
PS1='$(show_virtual_env)'$PS1

# --- fasd ---
fasd_cache="$HOME/.fasd-init-sh"
if [ "$(command -v fasd)" -nt "$fasd_cache" ] || [ ! -s "$fasd_cache" ]; then
  fasd --init auto >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

alias j='fasd_cd -d'
alias v='f -e vim'
alias o='a -e open'

# --- fzf ---
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use rg with fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# --- hub ---
if which hub > /dev/null; then
  eval "$(hub alias -s)"
fi

# --- neomutt ---
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

# --- nvm ---
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# --- python ---
export PYTHONDONTWRITEBYTECODE=1  # prevent .pyc files

# --- ripgrep ---
alias rg='rg --smart-case'

# --- rtv ---
export RTV_EDITOR=vim
