"----------------------------------- Python ----------------------------------"
set pyxversion=3

"-------------------------------- The Basics ---------------------------------"
let g:mapleader=' '

if executable('fish')
  set shell=fish  " only needed for vim
endif

set hidden  " switch buffers without saving
set splitbelow
set splitright

filetype plugin indent on

" prevent delay when changing modes
set ttimeout
set ttimeoutlen=50
"
" speed up screen updating
set updatetime=100

" persistent undo
set undofile

" no netrwhist
let g:netrw_dirhistmax = 0
"
"---------------------------- Tabs & Indentation -----------------------------"
set smartindent
set expandtab  " tab inserts spaces

" Wrap a line around visually if it's too long.
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

set list
augroup set_listchars
  autocmd VimEnter * :set listchars=tab:→\ ,extends:›,precedes:‹,nbsp:·,trail:·
augroup END

" set foldlevel=99

"----------------------------- Line Numbers, Etc -----------------------------"
set number relativenumber

augroup number_toggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"--------------------------------- Searching ---------------------------------"
set ignorecase smartcase

set wildmode=longest:full,full
set wildignore+=*/tmp/*,/var/*,*.so,*.swp,*.zip,*.tar,*.pyc  " macOS/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe                  " Windows

set path+=**  " add current file location to path

" use rg instead of grep if available
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
endif

"-------------------------------- Appearance ---------------------------------"
syntax enable

set noshowmode  " hide the mode

set termguicolors  " true color support
let $NVIM_TERM = 1

set guioptions=  " remove scrollbars, etc

set cursorline

set background=dark

augroup win_resize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" start scrolling when near the last line/col
set scrolloff=1
set sidescrolloff=5

" Go away, netrw!
augroup hide_netrw
  autocmd FileType netrw setl bufhidden=wipe
augroup END

" fix italics with tmux
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

set foldlevel=99

"-------------------------------- Navigation ---------------------------------"
set mouse=a  " let the mouse wheel scroll page, etc

"---------------------------------- Editing ----------------------------------"
set viewoptions-=options  " keep from saving cur dir in view

set clipboard=unnamed  " yank to system clipboard

set completeopt-=preview  " preview in a buffer?! No.

set nojoinspaces  " only insert one space after punction when joining lines

"---------------------------------- Commands ----------------------------------"
" I'm bad at typing.
:command! Q q
:command! W w
:command! WQ wq
:command! Wq wq

"-----------------------------------------------------------------------------"
"                                  Mappings                                   "
"-----------------------------------------------------------------------------"

"--------------------------------- Navigation --------------------------------"
" faster exiting from insert mode (-noremap to allow for abbrevs to work)
imap jj <Esc>

" faster exiting from terminal mode
tnoremap kk <C-\><C-n>

" faster command entry
nnoremap ; :
xnoremap ; :

" nav to begin and end of line (rather than buffer) with H/L
nnoremap H ^
nnoremap L $

" buffer switching similar to Vimium (Shift + j/k)
nnoremap K :BufferNext<CR>
nnoremap J :BufferPrevious<CR>
xnoremap K :BufferNext<CR>
xnoremap J :BufferPrevious<CR>

" tab switching (Ctrl + Tab)
noremap  <C-Tab>  :tabnext<CR>
inoremap <C-Tab>  <C-O>:tabnext<CR>
noremap  <M-Tab>  :tabprev<CR>
inoremap <M-Tab>  <C-O>:tabprev<CR>

"---------------------------------- Editing ----------------------------------"
" redo
nnoremap U <C-R>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" insert a single character  TODO: make repeatable
nnoremap  <leader>i i<Space><Esc>r
nnoremap  <leader>a a<Space><Esc>r

"--- some brilliant line movement mappings from junegunn ---"
" move current line up/down
nnoremap <silent> <M-k> :move-2<CR>
nnoremap <silent> <M-j> :move+<CR>
"indent/outdent current line
nnoremap <silent> <M-h> <<
nnoremap <silent> <M-l> >>
" move selection up/down
xnoremap <silent> <M-k> :move-2<CR>gv
xnoremap <silent> <M-j> :move'>+<CR>gv
" indent/outdent selection (and keep selection)
xnoremap <silent> <M-h> <gv
xnoremap <silent> <M-l> >gv
xnoremap < <gv
xnoremap > >gv

"-------------------------------- Completion ---------------------------------"
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" <CR> to select completion (must be double quotes!)
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"------------------------------------ Lua ------------------------------------"
lua require'init'
let g:fzf_colors = {'bg+': ['bg', 'Normal']}

function s:recompile_plugins()
  luafile %
  PackerCompile
endfunction
augroup recompile_plugins
  autocmd BufWritePost plugins.lua call <SID>recompile_plugins()
augroup END
