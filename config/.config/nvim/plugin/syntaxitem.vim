" identify the syntax highlight group under the cursor
function! s:syntax_item()
  echo synIDattr(synID(line('.'), col('.'), 1), 'name')
endfunction
command! SyntaxItem :call s:syntax_item()
