function __fzf_ripgrep
    set -l rg_cmd "rg -l --hidden --no-ignore-vcs --glob '!.git/*' --glob '!.direnv/*'"

    set -l results (
        FZF_DEFAULT_COMMAND="rg --files" fzf \
            -m \
            -e \
            --phony \
            --reverse \
            --bind "ctrl-a:select-all" \
            --bind "change:reload:$rg_cmd {q} || true" \
            --preview "rg -i --pretty --context 2 {q} {}" \
        | cut -d":" -f1,2
    )

    if test -n "$results"
        for result in $results
            commandline -it -- (string escape $result)
            commandline -it -- " "
        end
        commandline -f repaint
    end
end
