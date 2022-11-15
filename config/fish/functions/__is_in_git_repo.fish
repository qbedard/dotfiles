function __is_in_git_repo --description "Determine if current dir is in a git repo"
    git rev-parse HEAD >/dev/null 2>&1
end
