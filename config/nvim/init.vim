"------------------------------------ Lua ------------------------------------"
lua require("init")

"------------------------------- Autocommands --------------------------------"
augroup recompile_plugins
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup END

augroup number_toggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" TODO: Find out why tf I do this
augroup win_resize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" Go away, netrw!
augroup hide_netrw
  autocmd!
  autocmd FileType netrw setl bufhidden=wipe
augroup END
