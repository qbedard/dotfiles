function vim_last_rg --description "Create command to open the last rg matches in vim"
    commandline -r "vim " && commandline -a (
        history search --prefix --max 1 rg |
        sed "s/^rg \(.*\)/\(rg -l \1\)/"
    )
end
