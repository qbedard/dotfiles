function __aws_complete
    set -lx COMP_SHELL fish
    set -lx COMP_LINE (commandline)
    aws_completer | command sed 's/ $//'
end

complete --command aws --no-files --arguments '(__aws_complete)'
