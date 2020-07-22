# function fzf_ripgrep

#   set -l commandline (__fzf_parse_commandline)
#   set -l fzf_query $commandline[2]

#   rg  |
#   fzf --height=50% --reverse --multi --preview-window right:70% \
#     --preview 'git show --color=always {} | head -200' \
#     --query $fzf_query |
#   while read -l s; set results $results $s; end

#   if test -z "$results"
#     commandline -f repaint
#     return
#   else
#     commandline -t ""
#   end

#   for result in $results
#     commandline -it -- (string escape $result)
#     commandline -it -- " "
#   end
#   commandline -f repaint

# end

function __fzf_ripgrep
  set -l rg_cmd "rg -l --hidden --no-ignore-vcs --glob '!.git/*' --glob '!.direnv/*'"

  set -l results (
    FZF_DEFAULT_COMMAND="rg --files" fzf \
      -m \
      -e \
      --ansi \
      --phony \
      --reverse \
      --bind "ctrl-a:select-all" \
      --bind "f12:execute-silent:(subl -b {})" \
      --bind "change:reload:$rg_cmd {q} || true" \
      --preview "rg -i --pretty --context 2 {q} {}" | cut -d":" -f1,2
  )

  if test -n "$results"
    # $EDITOR $results
    for result in $results
      commandline -it -- (string escape $result)
      commandline -it -- " "
    end
    commandline -f repaint
  end
end
