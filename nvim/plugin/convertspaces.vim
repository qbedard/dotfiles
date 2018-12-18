" convert from A-space indent to B-space indent
function! s:ConvertSpaces(from_width, to_width)
  " convert every [from] spaces to a tab
  :let &tabstop=a:from_width
  :let &softtabstop=a:from_width
  :set noexpandtab
  :retab!
  " convert each tab to [to] spaces
  :let &tabstop=a:to_width
  :let &softtabstop=a:to_width
  :set expandtab
  :retab!
endfunction
command! -nargs=* ConvertSpaces :call s:ConvertSpaces(<f-args>)
