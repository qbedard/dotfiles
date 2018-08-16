" --------------------
"  Tim Bedard's vimrc
" --------------------

let $DOTFILES_DIR = $HOME . '/.dotfiles/nvim'
let $CONFIG_DIR = $HOME . '/.config/nvim'
let $DATA_DIR = $HOME . '/.local/share/nvim'

" ----- Neovim Defaults -----
if !has('nvim')
  set nocompatible
  set autoindent
  set autoread
  set backspace=indent,eol,start
  set backupdir=.,$DATA_DIR/backup
  set belloff=all
  set complete=.,w,b,u,t  " -=i
  set directory=$DATA_DIR/swap//
  set display+=lastline
  set formatoptions=tcqj  " +=j
  set history=10000
  set hlsearch
  set incsearch
  set nolangremap
  set laststatus=2
  set listchars=tab:> ,trail:-,nbsp:+
  set nrformats=bin,hex  " -=octal
  set ruler
  set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize  " -=options
  set showcmd
  set smarttab
  set tabpagemax=50
  set tags=$DATA_DIR/tags  " ./tags;,tags
  set ttyfast
  set undodir=$DATA_DIR/undo
  set viminfo=!,'100,<50,s10,h  " +=!
  set wildmenu
endif


" ----- General -----
let g:mapleader=' '

set hidden  " switch buffers without saving
set splitbelow
set splitright

if has('autocmd')
  filetype plugin indent on
endif

" prevent delay when changing modes
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=50
endif

" persistent undo
if has('persistent_undo')
  set undofile
endif


" ----- Tabs & Indentation -----
set smartindent
set expandtab  " tab inserts spaces
set shiftwidth=4
set softtabstop=4
" set tabstop=4

" Wrap a line around visually if it's too long.
set wrap
set linebreak
set textwidth=0
set wrapmargin=0


" ----- Line Numbers -----
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


" ----- Searching -----
set ignorecase smartcase

set wildmode=longest:full,full
set wildignore+=*/tmp/*,/var/*,*.so,*.swp,*.zip,*.tar,*.pyc  " macOS/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe                  " Windows

set path+=**  " add current file location to path

" use ag instead of grep if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif


" ----- Appearance -----
if has('syntax')
  syntax enable
endif

" set guifont=Menlo\ for\ Powerline
set guioptions=  " remove scrollbars, etc

set cursorline
set lazyredraw

set t_Co=256  " terminal colors
set background=dark
augroup winresize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" start scrolling when near the last line/col
set scrolloff=1
set sidescrolloff=5

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~? 'iTerm'
  let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
endif


" ----- Navigation -----
set mouse=a  " let the mouse wheel scroll page, etc


" ----- Editing -----
" trying out replacing this with vim-stay
" auto view saving (to keep folds)
" set viewoptions-=options  " keep from saving cur dir
" augroup autoviewsave
"   autocmd!
"   autocmd BufWinLeave ?* mkview
"   autocmd BufWinEnter ?* silent! loadview
" augroup END

" yank to system clipboard
set clipboard=unnamed

set completeopt-=preview  " preview in a buffer?! No.

" ----- Languages -----
if has('nvim')
  let g:python_host_prog  = 'python2'
  let g:python3_host_prog = 'python3'
endif

" Python Virtualenv
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

if executable('yapf')
  augroup enableyapf
    autocmd!
    autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
  augroup END
endif

" syntax hightling for .nat files
autocmd BufNewFile,BufRead *.nat  set syntax=natural

" ----- Commands -----
if filereadable(expand('$DOTFILES_DIR/commands.vim'))
  source $DOTFILES_DIR/commands.vim
endif

" ----- Mappings -----
if filereadable(expand('$DOTFILES_DIR/mappings.vim'))
  source $DOTFILES_DIR/mappings.vim
endif

" ----- Plugins -----
if filereadable(expand('$DOTFILES_DIR/plugins.vim'))
  source $DOTFILES_DIR/plugins.vim
endif
