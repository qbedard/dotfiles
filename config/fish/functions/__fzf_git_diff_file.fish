function __fzf_git_diff_file

    __is_in_git_repo || return

    set -l commandline (__fzf_parse_commandline)
    set -l fzf_query $commandline[2]

    git -c color.status=always status --short |
        fzf --reverse -m --ansi --nth 2..,.. \
            --preview 'git diff --color=always -- {-1} | sed 1,4d; cat {-1} | head -500' \
            --query $fzf_query |
        cut -c4- | sed 's/.* -> //' |
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
