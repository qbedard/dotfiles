function __fzf_git_branch

  __is_in_git_repo || return

  set -l commandline (__fzf_parse_commandline)
  set -l fzf_query $commandline[2]

  git branch --all --color=always --sort committerdate | grep -v '/HEAD\s' --color=always |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#remotes/##' |
  fzf --height=50% --reverse --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" (echo {} | sed s/^..// | cut -d" " -f1) | head -200' \
    --query $fzf_query |
  while read -l s; set results $results $s; end

  if test -z "$results"
    commandline -f repaint
    return
  else
    commandline -t ""
  end

  for result in $results
    commandline -it -- (string escape $result)
    commandline -it -- " "
  end
  commandline -f repaint

end
