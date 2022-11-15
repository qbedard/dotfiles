function __fzf_git_remote --description "fzf git remote"

    __is_in_git_repo || return

    set -l commandline (__fzf_parse_commandline)
    set -l fzf_query $commandline[2]

    git remote -v | awk '{print $1 "\t" $2}' | uniq |
        fzf --height=50% --reverse --tac \
            --preview 'git log --oneline --graph --date=short --color=always \
                --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' \
            --query $fzf_query |
        cut -f1 |
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
