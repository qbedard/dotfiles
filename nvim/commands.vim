" --------------------
"       Commands
" --------------------

" I'm bad at typing.
:command! Q q
:command! W w
:command! WQ wq
:command! Wq wq

" ----- vimrc -----
" reload vimrc
cnoreabbrev vrr :source $MYVIMRC

" shortcut to edit vimrc
cnoreabbrev vr :e $DOTFILES_DIR/init.vim

" shortcut to edit plugins.vim
cnoreabbrev vp :e $DOTFILES_DIR/plugins.vim


" ----- Formatting -----
" trim white space
cnoreabbrev trim :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <cr>

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
