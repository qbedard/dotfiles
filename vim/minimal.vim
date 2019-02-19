"---------------------------------- General ----------------------------------"
set noshowmode
set signcolumn=yes
inoremap jj <Esc>
nnoremap ; :

"-------------------------------- Directories --------------------------------"
let $XDG_DATA_HOME = expand('$HOME/.local/share')
let $DATA_DIR = $XDG_DATA_HOME . '/nvim'  " ~/.local/share/nvim

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

" plugins go here

call plug#end()
filetype plugin indent on

"----------------------------- Configure Plugins -----------------------------"
" config options go here
