" --------------------
"  Tim Bedard's vimrc
" --------------------

let $DOTFILES_DIR = $HOME . '/.dotfiles/vim'
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
  set formatoptions=tcqj
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
  set tags=$CONFIG_DIR/tags  " ./tags;,tags
  set ttyfast
  set undodir=$DATA_DIR/undo
  set viminfo=!,'100,<50,s10,h  " +=!
  set wildmenu
endif


" ----- General -----
let mapleader=" "

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
set wildignore+=*/tmp/*,/var/*,*.so,*.swp,*.zip,*.tar  " macOS/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe            " Windows

nnoremap <cr> :nohlsearch<cr>

set path+=**  " add current file location to path

" use ag instead of grep if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif


" ----- Appearance -----
if has('syntax')
  syntax enable
endif

set guifont=Menlo\ for\ Powerline
set cursorline
set lazyredraw

set t_Co=256
set background=dark
set guioptions=  " remove scrollbars, etc
autocmd VimResized * wincmd =

" start scrolling when near the last line/col
set scrolloff=1
set sidescrolloff=5

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif


" ----- vimrc -----

" reload vimrc
cnoreabbrev vrr :source $MYVIMRC

" shortcut to edit vimrc
cnoreabbrev vr :e $DOTFILES_DIR/init.vim

" shortcut to edit plugins.vim
cnoreabbrev vp :e $DOTFILES_DIR/plugins.vim


" ----- Navigation -----
set mouse=a  " let the mouse wheel scroll page, etc

" nav to begin and end of line (rather than buffer) with H/L
nnoremap H ^
nnoremap L $

" faster exiting from insert mode
inoremap jj <Esc>
tnoremap kk <C-\><C-n>
tnoremap <Esc> <C-\><C-n>

" easier nav in insert mode (Ctrl)
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" faster command entry
map ; :
" but still keep the ; functionality
nnoremap ;; ;

" window switching (Ctrl)
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" buffer switching (Shift + j/k)
nnoremap K :bn<cr>
nnoremap J :bp<cr>
vnoremap K :bn<cr>
vnoremap J :bp<cr>

" tab switching (Ctrl+Tab)
map  <C-Tab>  :tabnext<cr>
imap <C-Tab>  <C-O>:tabnext<cr>
map  <M-Tab>  :tabprev<cr>
imap <M-Tab>  <C-O>:tabprev<cr>

" I'm bad at typing.
:command! Q q
:command! W w
:command! WQ wq
:command! Wq wq


" ----- Editing -----
set foldmethod=manual

" auto view saving (to keep folds)
set viewoptions-=options  " keep from saving cur dir
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent! loadview

" yank to system clipboard
set clipboard=unnamed

" redo
nnoremap U <C-R>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" insert a single character
nnoremap  <leader>i i<Space><Esc>r
nnoremap  <leader>a a<Space><Esc>r

" trim white space
cnoreabbrev trim  :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <cr>

" ----- Completion -----
" <cr> to select completion
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

set completeopt-=preview  " preview in a buffer?! No.

" ----- Languages -----
if has('nvim')
  let g:python_host_prog  = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
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
  autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
endif

" syntax hightling for .nat files
autocmd BufNewFile,BufRead *.nat  set syntax=natural

" ----- Plugins -----
if filereadable(expand('$DOTFILES_DIR/plugins.vim'))
  source $DOTFILES_DIR/plugins.vim
endif
