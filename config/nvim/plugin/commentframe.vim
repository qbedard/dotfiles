"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                          CommentFrame function                            {{{"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
" Syntax: CommentFrame(comment char to start line,
"            comment char to end the line,
"            width of line,
"            character to fill space in frame border (e.g. '*', '-', '=', ' '),
"            character to fill space in title line,
"            number of spaces to leave around title string
"            title string in center of line)
function! s:CommentFrame(start_str, end_str, line_width, frame_fill, title_fill, spacing, titlestring)
  " check and mod arg vars
  let l:title_fill = s:CheckNotEmpty(' ', a:title_fill)
  let l:frame_fill = s:CheckNotEmpty(' ', a:frame_fill)

  " prepend/append spacing
  let l:titlestr = repeat(' ', a:spacing) . a:titlestring . repeat(' ', a:spacing)

  " combine and count
  let l:middle_length=a:line_width - len(a:start_str . a:end_str)
  let l:title_left_length=((l:middle_length / 2) - (len(l:titlestr) / 2))
  let l:title_left = repeat(l:title_fill, l:title_left_length)
  let l:title_right_length=l:middle_length - len(l:title_left) - len(l:titlestr)
  let l:title_right = repeat(l:title_fill, l:title_right_length)

  " build border lines
  let l:border=a:start_str . repeat(l:frame_fill, l:middle_length) . a:end_str
  " build title_line
  let l:title_line=a:start_str . l:title_left . l:titlestr . l:title_right . a:end_str

  " add comment lines to doc
  call append(line('.'), l:border)
  call append(line('.'), l:title_line)
  call append(line('.'), l:border)
endfunction
"}}}

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ CheckNotEmpty function   {{{ ~~~~~
function! s:CheckNotEmpty(default_val, arg_val)
  if a:arg_val !=? ''
    return a:arg_val
  else
    return a:default_val
  endif
endfunction
"}}}

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               General Use Setup                           {{{"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Custom Comment Functions {{{ ~~~~~
" commented out to prevent load issue due to function/file name
" function! CommentFrame#Custom(start_str, end_str, line_width,
"                      \frame_fill, title_fill, numspaces, titlestring)
"   call s:CommentFrame(a:start_str, a:end_str, a:line_width,
"                      \a:frame_fill, a:title_fill, a:numspaces, a:titlestring)
" endfunction
"}}}
