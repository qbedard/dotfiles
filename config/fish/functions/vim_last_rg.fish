function vim_last_rg
    commandline -r "vim " && commandline -a (
        history search --prefix --max 1 rg |
        sed "s/^rg \(.*\)/\(rg -l \1\)/"
    )
end
