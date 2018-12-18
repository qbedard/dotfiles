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
cnoreabbrev vr :e $RUNTIME_DIR/init.vim

" shortcut to edit plugins.vim
cnoreabbrev vp :e $RUNTIME_DIR/plugins.vim

" ----- Formatting -----
cnoreabbrev trim :TrimTrailingWhitespace
