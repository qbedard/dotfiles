set colorcolumn=120

if has('python3')
  function! s:Isort()
    py3 << EOF
import vim
from isort import SortImports
from isort.settings import WrapModes

old_text = '\n'.join(vim.current.buffer)
sorted = SortImports(
    file_contents=old_text,
    include_trailing_comma=True,
    multi_line_output=WrapModes.VERTICAL_HANGING_INDENT)
new_text = sorted.output
new_lines = new_text.split('\n')
vim.current.buffer[:] = new_lines
EOF
  endfunction
  command! Isort :call s:Isort()
endif
