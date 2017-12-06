# ----- PATH ----- #
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:~/.composer/vendor/bin:$PATH

# ----- Aliases ----- #

# --- General ---
alias l="ls -1"
alias q="exit"
alias quit="exit"
alias vzs="vim ~/.zshrc"
alias rzs="source ~/.zshrc"
alias vbs="vim ~/.bashrc"
alias rbs="source ~/.bashrc"
alias vr="vim ~/.vimrc"
alias vb="vim ~/.dotfiles/vim/vimrc.bundles"

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
alias gm="git merge"
alias gp="git push"
alias gl="git pull"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# ----- PyPE  ----- #
alias vu="vagrant up"
alias vh="vagrant halt"
alias vss="vagrant ssh"
alias pw="pype_workon"
alias pw2.8="pype_workon 27.8.0"
alias pw2.11="pype_workon 27.11.0"
alias pw3.11="pype_workon 36.11.0"
alias dj="python manage.py"
alias djrs="python manage.py runserver"
alias djrss="python manage.py runsslserver"
alias djsh="python manage.py shell"
alias djsu="python manage.py createsuperuser"
alias djm="python manage.py migrate"
alias djmm="python manage.py makemigrations"
alias vs="vim settings.py"
alias vl="vim local_settings.py"

# ----- Misc ----- #

# 10ms for key sequences
KEYTIMEOUT=1

# AutoJump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rtv
export RTV_EDITOR=vim
