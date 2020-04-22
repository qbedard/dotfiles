function __fzf_git_commit_hash
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'echo {} | grep -o "[a-f0-9]\{7,\}" | xargs git show --color=always | head -200' |
  grep -o "[a-f0-9]\{7,\}"
end
