"---------------------------------- General ----------------------------------"
set noshowmode
set signcolumn=yes
inoremap jj <Esc>
nnoremap ; :

"-------------------------------- Directories --------------------------------"
let $XDG_DATA_HOME = expand('$HOME/.local/share')
let $DATA_DIR = $XDG_DATA_HOME . '/nvim'  " ~/.local/share/nvim

"---------------------------------- Python -----------------------------------"
let g:python_host_prog  = expand('$DATA_DIR/venv/python2/bin/python')
let g:python3_host_prog = expand('$DATA_DIR/venv/python3/bin/python')

"----------------------------- Install vim-plug ------------------------------"
let $PLUG_LOC = expand('$DATA_DIR/site/autoload/plug.vim')
if empty(glob($PLUG_LOC))
  silent !curl -fLo $PLUG_LOC --create-dirs
    \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  augroup autopluginstall
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | UpdateRemotePlugins
  augroup END
endif

"------------------------------ Install Plugins ------------------------------"
filetype off
call plug#begin('$DATA_DIR/site/plugged')

Plug 'w0rp/ale'  " linting/building

call plug#end()
filetype plugin indent on

"----------------------------- Configure Plugins -----------------------------"
" --- ALE ---
if &runtimepath =~? 'ale'
  let g:airline#extensions#ale#enabled = 1
  let g:ale_completion_enabled = 1
  let g:ale_cursor_detail = 0
  let g:ale_set_balloons = 1
  let g:ale_virtualtext_cursor = 1
endif
