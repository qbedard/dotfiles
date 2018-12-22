"-----------------------------------------------------------------------------"
"                               Neovim Defaults                               "
"-----------------------------------------------------------------------------"
" These are Neovim's default settings, ready to be sourced for non-Neovim Vims.

if $XDG_DATA_HOME ==? ''
  let $XDG_DATA_HOME = $HOME . '/.local/share'
endif
let $DATA_DIR = $XDG_DATA_HOME . '/nvim'

set nocompatible
set autoindent
set autoread
set backspace=indent,eol,start
set backupdir=.,$DATA_DIR/backup
set belloff=all
set complete=.,w,b,u,t  " -=i
set cscopeverbose  " deprecated in nvim
set directory=$DATA_DIR/swap//
set display+=lastline  " msgsep not available in Vim
set encoding=utf-8
set fillchars=vert:│,fold:·
set nofsync
set formatoptions=tcqj  " +=j
set history=10000
set hlsearch
set incsearch
set nolangremap
set laststatus=2
set listchars=tab:>\ ,trail:-,nbsp:+
set nrformats=bin,hex  " -=octal
set ruler
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize  " -=options
set shortmess=filnxtToOF  " +=F
set showcmd
set sidescroll=1
set smarttab
set tabpagemax=50
set tags=./tags;,tags
set tags=$DATA_DIR/tags  " ./tags;,tags
set ttyfast
set undodir=$DATA_DIR/undo
set viminfo=!,'100,<50,s10,h  " +=!
set wildmenu
