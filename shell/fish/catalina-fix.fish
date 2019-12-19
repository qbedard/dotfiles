# https://github.com/fish-shell/fish-shell/issues/6270

# Just run these commands and do these things for now.
# We can automate it later if the fish or macOS teams don't fix it.

funced __fish_describe_command
# comment out the function
funcsave __fish_describe_command
