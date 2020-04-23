function __fzf_git_diff_file
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf --reverse -m --ansi --nth 2..,.. \
    --preview 'git diff --color=always -- {-1} | sed 1,4d; cat {-1} | head -500' |
  cut -c4- | sed 's/.* -> //'
end
