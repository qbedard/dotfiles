function __fzf_git_stash

    __is_in_git_repo || return

    set -l commandline (__fzf_parse_commandline)
    set -l fzf_query $commandline[2]

    git stash list |
        fzf --reverse -d: --preview 'git show --color=always {1}' --query $fzf_query |
        cut -d: -f1 |
        while read -l s
            set results $results $s
        end

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
