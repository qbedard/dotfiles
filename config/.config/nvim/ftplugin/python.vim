set colorcolumn=80

" ALE
let b:ale_linters = {'python': ['flake8']}
let b:ale_fixers = {'python': ['black', 'isort']}
" let b:ale_fix_on_save = 1
let b:ale_fix_on_save_ignore = {'python': ['black']}
" let g:ale_python_black_options = '--line-length 88 -S'
" /----- flake8 error codes -----------------\"
" | mcCabe, Error, pyFlakes, Warning,        |
" |   Bugbear, Naming                        |
" | E203 = spaces around ':' for slices      |
" | E501 = line length                       |
" | W503 = line break before binary operator |
" | B950 = >10% line length                  |
" \------------------------------------------/
let b:ale_python_flake8_options =
  \ '--ignore=E203,E501,W503 ' .
  \ '--max-complexity=15 ' .
  \ '--max-line-length=80 ' .
  \ '--select=C,E,F,W,B,N '
let b:ale_python_isort_options =
  \ '--force-grid-wrap=0 ' .
  \ '--line-width=80 ' .
  \ '--lines-after-imports=2 ' .
  \ '--multi-line=3 ' .
  \ '--section-default=THIRDPARTY ' .
  \ '--trailing-comma ' .
  \ '--use-parentheses'

" splitjoin
let b:splitjoin_python_brackets_on_separate_lines = 1
let b:splitjoin_trailing_comma = 1
