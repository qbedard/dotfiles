set colorcolumn=80

" ALE
let b:ale_linters = {'python': ['flake8', 'pyls']}
let b:ale_fixers = {'python': ['black', 'isort']}
" let b:ale_fix_on_save = 1
let b:ale_fix_on_save_ignore = {'python': ['black']}

" splitjoin
let b:splitjoin_python_brackets_on_separate_lines = 1
let b:splitjoin_trailing_comma = 1
