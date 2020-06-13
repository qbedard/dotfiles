function! s:start_profile()
  :profile start profile.log
  :profile func *
  :profile file *
endfunction
command! StartProfile :call s:start_profile()

function! s:end_profile()
  :profile pause
  :noautocmd qall!
endfunction
command! EndProfile :call s:end_profile()
