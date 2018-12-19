function s:trim_trailing_whitespace()
  let l = line('.')
  let c = col('.')
  let _s=@/

  execute '%s/\s\+$//e'

  let @/=_s
  call cursor(l, c)
  " nohl
endfunction
command! TrimTrailingWhitespace call s:trim_trailing_whitespace()
