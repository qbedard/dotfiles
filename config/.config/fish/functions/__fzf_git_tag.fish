function __fzf_git_tag
  is_in_git_repo || return
  git tag --sort -taggerdate |
  fzf --height=50% --reverse --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -200'
end

