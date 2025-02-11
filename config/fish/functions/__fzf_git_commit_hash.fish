function __fzf_git_commit_hash --description "fzf git commit hash"

    __is_in_git_repo || return

    set -l commandline (__fzf_parse_commandline)
    set -l fzf_query $commandline[2]

    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
        fzf --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
            --header 'Press CTRL-S to toggle sort' \
            --preview 'echo {} | grep -o "[a-f0-9]\{7,\}" | xargs git show --color=always | head -200' \
            --query (string unescape $fzf_query) |
        grep -o "[a-f0-9]\{7,\}" |
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
