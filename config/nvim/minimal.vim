"---------------------------------- General ----------------------------------"
set noshowmode
set number
set signcolumn=yes
inoremap jj <Esc>
nnoremap ; :
let g:mapleader=' '

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
  augroup auto_pluginstall
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC | UpdateRemotePlugins
  augroup END
endif

"------------------------------ Install Plugins ------------------------------"
filetype off
call plug#begin('$DATA_DIR/site/plugged')

" plugins
Plug 'morhetz/gruvbox'  " excellent theme

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

call plug#end()
filetype plugin indent on

"----------------------------- Configure Plugins -----------------------------"
" plugin config

" --- gruvbox ---
if &runtimepath =~? 'plugged/gruvbox'
  let g:gruvbox_italic = 1
  let g:gruvbox_sign_column='bg0'
  let g:airline_theme='gruvbox'

  colorscheme gruvbox  " must come after gruvbox_italic

  " match the fold column colors to the line number column
  " must come after colorscheme gruvbox
  highlight clear FoldColumn
  highlight! link FoldColumn LineNr
endif

lua require'init'.setup_nvim_treesitter()
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
