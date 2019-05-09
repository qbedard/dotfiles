set colorcolumn=80

" enable ale linters
let b:ale_linters = {'python': ['flake8']}
let b:ale_fixers = {'python': ['black', 'isort']}

" splitjoin
let b:splitjoin_python_brackets_on_separate_lines = 1
let b:splitjoin_trailing_comma = 1
