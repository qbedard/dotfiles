function __fzf_git_tag

  __is_in_git_repo || return

  set -l commandline (__fzf_parse_commandline)
  set -l fzf_query $commandline[2]

  git tag --sort -taggerdate |
  fzf --height=50% --reverse --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -200' \
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

