function! s:trim_trailing_whitespace()
  let _s=@/
  %s/\s\+$//e
  let @/=_s
  nohl
  unlet _s
endfunction
command! TrimTrailingWhitespace :call s:trim_trailing_whitespace()
