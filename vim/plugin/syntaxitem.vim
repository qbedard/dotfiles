function! s:SyntaxItem()
  echo synIDattr(synID(line('.'), col('.'), 1), 'name')
endfunction
command! SyntaxItem :call s:SyntaxItem()
