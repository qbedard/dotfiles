#!/bin/bash

. "$HOME/.common.sh"

# starship prompt
if command -v starship >/dev/null; then
	eval "$(starship init bash)"
fi
