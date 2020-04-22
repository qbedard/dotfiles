# TODO: Confirm that this shows remote branches.
function __fzf_git_branch
  is_in_git_repo || return
  git branch --color=always --sort committerdate | grep -v '/HEAD\s' --color=always |
  sed 's/^..//' | cut -d' ' -f1 |
  # sed 's#remotes/##' |
  fzf --height=50% --reverse --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" (echo {} | sed s/^..// | cut -d" " -f1) | head -200'
end
