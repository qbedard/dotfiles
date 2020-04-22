function __fzf_git_remote 
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf --height=50% --reverse --tac \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -f1
end
