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
alias l="ls -1"
alias q="exit"
alias quit="exit"
alias r="ranger"
alias vzs="vim ~/.zshrc"
alias rzs="source ~/.zshrc"
alias vbs="vim ~/.bashrc"
alias rbs="source ~/.bashrc"
alias vr="vim ~/.dotfiles/nvim/init.vim"
alias vp="vim ~/.dotfiles/nvim/plugins.vim"

# --- Git ---
alias gs="git status -sb"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit -a"
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
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

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

# ----- Misc ----- #

export VISUAL=nvim
export EDITOR=nvim

# 10ms for key sequences
export KEYTIMEOUT=1

# git -> hub
if which hub > /dev/null; then
  eval "$(hub alias -s)"
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use rg with fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# vimpager
# export PAGER=vimpager

# ripgrep default settings alias
alias rg='rg --smart-case'

 #rtv
export RTV_EDITOR=vim

# fasd
fasd_cache="$HOME/.fasd-init-sh"
if [ "$(command -v fasd)" -nt "$fasd_cache" ] || [ ! -s "$fasd_cache" ]; then
  fasd --init auto >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# fasd aliases
alias j='fasd_cd -d'
alias v='f -e vim'
alias o='a -e open'

# neomutt
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

# cheat
export CHEATCOLORS=true

# python
export PYTHONDONTWRITEBYTECODE=1  # prevent .pyc files
