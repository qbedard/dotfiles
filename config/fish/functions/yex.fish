function yex
    yq e -j $argv | jq -r \
        '.[] | keys[] as $c | .[] | keys[] as $k | "\($c) \($k) \(.[$k] | @sh)"' \
        | fish
end
