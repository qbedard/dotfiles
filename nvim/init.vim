"-----------------------------------------------------------------------------"
"    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    "
"                           Tim Bedard's Vim Config                           "
"    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~    "
"-----------------------------------------------------------------------------"

"     "Make for yourself a definition or description of the thing which is
"  presented to you, so as to see distinctly what kind of a thing it is in its
"   substance, in its nudity, in its complete entirety, and tell yourself its
"   proper name, and the names of the things of which it has been compounded,
" and into which it will be resolved. For nothing is so productive of elevation
" of mind as to be able to examine methodically and truly every object that is
"  presented to you in life, and always to look at things so as to see at the
"   same time what kind of universe this is, and what kind of use everything
"  performs in it, and what value everything has with reference to the whole."
"
"                               - Marcus Aurelius, Meditations, iii. 11.

"-----------------------------------------------------------------------------"
"                                   General                                   "
"-----------------------------------------------------------------------------"
let $RUNTIME_DIR = $HOME . '/.dotfiles/nvim'
let $DATA_DIR = $HOME . '/.local/share/nvim'

"------------------------------ Neovim Defaults ------------------------------"
" If we're not in Neovim, make sure all the defaults are the same.
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
  set listchars=tab:>\ ,trail:-,nbsp:+
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

"-------------------------------- The Basics ---------------------------------"
let g:mapleader=' '

" set autochdir  " automatically set working directory

if executable('zsh')
  set shell=zsh
endif

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

" speed up screen updating
set updatetime=100

" persistent undo
if has('persistent_undo')
  set undofile
endif

" no netrwhist
let g:netrw_dirhistmax = 0

"---------------------------- Tabs & Indentation -----------------------------"
set smartindent
set expandtab  " tab inserts spaces
set shiftwidth=4
set softtabstop=4

" Wrap a line around visually if it's too long.
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

"----------------------------- Line Numbers, Etc -----------------------------"
set number relativenumber

augroup numbertoggle
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
if has('syntax')
  syntax enable
endif

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

"-------------------------------- Navigation ---------------------------------"
set mouse=a  " let the mouse wheel scroll page, etc

"---------------------------------- Editing ----------------------------------"
set viewoptions-=options  " keep from saving cur dir in view

" yank to system clipboard
set clipboard=unnamed

set completeopt-=preview  " preview in a buffer?! No.

"--------------------------------- Languages ---------------------------------"
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

"-----------------------------------------------------------------------------"
"                                  Commands                                   "
"-----------------------------------------------------------------------------"
" I'm bad at typing.
:command! Q q
:command! W w
:command! WQ wq
:command! Wq wq

"------------------------------ vimrc Shortcuts ------------------------------"
" shortcut to edit vimrc
cnoreabbrev vr :e $RUNTIME_DIR/init.vim

" reload vimrc
cnoreabbrev vrr :source $MYVIMRC

"----------------------------------- Misc ------------------------------------"
cnoreabbrev trim :TrimTrailingWhitespace

"-----------------------------------------------------------------------------"
"                                  Mappings                                   "
"-----------------------------------------------------------------------------"
"--------------------------------- Searching ---------------------------------"
nnoremap <cr> :nohlsearch<cr>:echo ''<cr>

"--------------------------------- Navigation --------------------------------"
" faster exiting from insert mode
inoremap jj <Esc>

" faster exiting from terminal mode
tnoremap kk <C-\><C-n>

" faster command entry
nnoremap ; :
vnoremap ; :
" but still keep the ; functionality
" nnoremap : ;
" vnoremap : ;

" easier nav in insert mode (Ctrl)
" NOTE: <C-h> doesn't work thanks to <C-h> sending <bs> in most terminals
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" nav to begin and end of line (rather than buffer) with H/L
nnoremap H ^
nnoremap L $

" buffer switching (Shift + j/k)
nnoremap K :bn<cr>
nnoremap J :bp<cr>
vnoremap K :bn<cr>
vnoremap J :bp<cr>

" window switching (Ctrl)
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" tab switching (Ctrl+Tab)
map  <C-Tab>  :tabnext<cr>
imap <C-Tab>  <C-O>:tabnext<cr>
map  <M-Tab>  :tabprev<cr>
imap <M-Tab>  <C-O>:tabprev<cr>

"---------------------------------- Editing ----------------------------------"
" redo
nnoremap U <C-R>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" insert a single character
nnoremap  <leader>i i<Space><Esc>r
nnoremap  <leader>a a<Space><Esc>r

" https://github.com/google/yapf
if executable('yapf')
  augroup enableyapf
    autocmd!
    autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
  augroup END
endif

"-------------------------------- Completion ---------------------------------"
" <cr> to select completion
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"

"-----------------------------------------------------------------------------"
"                                   Plugins                                   "
"-----------------------------------------------------------------------------"
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

" /----------------------------- Start Plugins ------------------------------\

" ----------- GUI -----------
Plug 'morhetz/gruvbox'  " excellent theme
Plug 'vim-airline/vim-airline'  " adds metadata at the bottom
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'  " fancy Nerd Font icons
" Plug 'mhinz/vim-startify'  " fancy start screen
Plug 'Yggdroot/indentLine'  " nice indentation lines (note: mucks with conceal, might affect JSON)
Plug 'benknoble/vim-auto-origami'  " auto-show foldcolumn
" Plug 'tpope/vim-vinegar'  " inline buffer file browser (extends netrw)

" ---------- Tags -----------
if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'  " manages tag files
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }  " neat tag nav UI
endif

" ------ Fuzzy Search -------
" Plug 'haya14busa/incsearch.vim'  " incremental highlighting, breaking nvim
" Plug 'haya14busa/is.vim'  " successor to incsearch, not sure if nvim supported yet
" Plug 'ctrlpvim/ctrlp.vim'  " FUZZY
if executable('fzf')
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
endif
" Plug 'sunaku/vim-shortcut'  " discoverable shortcut system

" --------- Motion ----------
Plug 'easymotion/vim-easymotion'  " fast finding tool
Plug 'rhysd/clever-f.vim'  " fast f/t repetition (instead of ;)

" --------- Editing ---------
Plug 'zhimsel/vim-stay'  " persist editing state when switching buffers, etc
Plug 'tpope/vim-eunuch'  " unix cmds (Move, Delete, etc)
Plug 'tpope/vim-commentary'  " commenting shortcuts
Plug 'tpope/vim-surround'  " quoting, etc
Plug 'tpope/vim-repeat'  " repeat supported plugin maps
Plug 'wellle/targets.vim'  " next/last surround pair text object
" Plug 'editorconfig/editorconfig-vim'  " support for .editorconfig files
Plug 'Valloric/MatchTagAlways'  " show matching tags
Plug 'jiangmiao/auto-pairs'  " insert closing quotes, parens, etc
Plug 'junegunn/vim-easy-align'  " line stuff up
Plug 'junegunn/vim-peekaboo'  " show preview of registers
" Plug 'ap/vim-css-color'  " preview color hex, words, etc (for CSS mostly), slow

" ----------- Git -----------
Plug 'tpope/vim-fugitive'  " the defacto git standard
Plug 'tpope/vim-rhubarb'  " GitHub support for fugitive
Plug 'airblade/vim-gitgutter'  " way more than just gutter signs
Plug 'junegunn/gv.vim'  " badass commit browser
Plug 'sodapopcan/vim-twiggy'  " branch manager

" ----- Language/Syntax -----
" General "
Plug 'sheerun/vim-polyglot'  " a ton of language support
Plug 'tpope/vim-sleuth'  " detect shiftwidth and expandtab automagically
" Plug 'Konfekt/FastFold'  " faster folding by ignoring manual folding
Plug 'tpope/vim-characterize'  " extend character metadata for `ga`

" CSS "
Plug 'hail2u/vim-css3-syntax'

" Markdown "
Plug 'gabrielelana/vim-markdown'  " better markdown

" Python "
" Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }  " fixes python indentation issues
Plug 'tmhedberg/simpylfold', { 'for': 'python' }  " python folding
Plug 'raimon49/requirements.txt.vim'  " syntax highlighting for requirements.txt
" Plug 'tweekmonster/django-plus.vim'  " better django detection/support

" Misc "
Plug 'ekalinin/Dockerfile.vim'  " Dockerfile support
Plug 'hashivim/vim-vagrant'  " Vagrant support
Plug 'tpope/vim-liquid'  " jekyll templates
" Plug 'sophacles/vim-bundle-mako'  " mako template support
" Plug 'chrisbra/csv.vim'  " strong csv toolset
" Plug 'junegunn/vim-emoji'  " support for emoji

" --------- Linting ---------
Plug 'neomake/neomake'  " linting/building
" Plug 'w0rp/ale'  " linting/building

" ------- Completion --------
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neco-vim'  " VimL
" TODO: figure out how to check if jedi is installed
Plug 'zchee/deoplete-jedi', { 'for': 'python' }  " python
" This seems cool to get working...
" Plug 'Shougo/echodoc.vim'  " show function defs
Plug 'fszymanski/deoplete-emoji'  " deoplete support for emoji

Plug 'ervandew/supertab'  " use tab for insert completions

" -------- Snippets ---------
" Plug 'sirver/ultisnips'
" vvv This is breaking right now for some reason.
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'honza/vim-snippets'

Plug 'mattn/emmet-vim'  " fast HTML pseudo-coding

" ---------- Notes ----------
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" --------- Preview ---------
" Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }

" --------- Writing ---------
Plug 'junegunn/goyo.vim'  " no-distractions editing
Plug 'junegunn/limelight.vim'  " highlight current block

" \------------------------------ End Plugins -------------------------------/

call plug#end()

if has('autocmd')
  filetype plugin indent on
endif


"----------------------------- Configure Plugins -----------------------------"
" TODO: better titles here
" TODO: cleanup

" --- airline ---
if &runtimepath =~? 'vim-airline'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  set noshowmode
  if &runtimepath =~? 'vim-airline-themes'
    let g:airline_theme='gruvbox'
  endif
endif

" --- auto-pairs ---
if &runtimepath =~? 'auto-pairs'
  let g:AutoPairsMapSpace = 0
endif

" --- CtrlP ---
if &runtimepath =~? 'ctrlp.vim'
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_cmd =  'CtrlP'
  let g:ctrlp_extensions = ['buffertag', 'line']

  " ignore some folders and files for CtrlP indexing
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|public|tmp|var|Applications|Library)$',
    \ 'file': '\.so$\|\.dat$|\.DS_Store$|\.zip|\.pdf|\.tar|\.dmg'
    \ }

  " use ag instead of grep if available
  if executable('ag')
    " Use ag in CtrlP for listing files. Lightning fast and [respects .gitignore]<-disabled with -t
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" -t'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
endif

" --- deoplete ---
if &runtimepath =~? 'deoplete.nvim'
  call deoplete#enable()
  " autocmd CompleteDone * pclose  " To close preview window of deoplete automagically
  " tab completion
  " inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " custom marks
  " call deoplete#custom#source('jedi', 'mark', '')
endif

" --- EasyMotion ---
if &runtimepath =~? 'vim-easymotion'
  map \ <Plug>(easymotion-prefix)

  " <Leader>f{char} to move to {char}
  map  <Leader>f <Plug>(easymotion-bd-f)
  nmap <Leader>f <Plug>(easymotion-overwin-f)
endif

" --- Emmet ---
if &runtimepath =~? 'emmet-vim'
  "  default is <C-Y>
  " let g:user_emmet_leader_key=','
  let g:user_emmet_install_global=1
endif

" --- Fugitive ---
if &runtimepath =~? 'vim-fugitive'
  "" :command Gadd Git add %
endif

" --- fzf ---
if &runtimepath =~? 'fzf.vim'
  augroup hidefzfstatusline
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noruler
      \| autocmd BufLeave <buffer> set laststatus=2 ruler
  augroup END

  " mappings
  nnoremap <C-f> :BLines<cr>
  nnoremap <C-b> :Buffers<cr>
  " nnoremap <C-a> :Ag<cr>  " conflicts with increment, temp disabled
  " nnoremap <C-p> :GFiles --exclude-standard --other<cr>

  " show files in a git project root (or current dir if not project)
  command! ProjectFiles execute 'Files' FindGitRoot()
  nnoremap <C-p> :ProjectFiles<cr>
endif

" --- GitGutter ---
if &runtimepath =~? 'vim-gitgutter'
  let g:gitgutter_override_sign_column_highlight = 1
  if exists('&signcolumn')  " Vim 7.4.2201
    set signcolumn=yes
  else
    let g:gitgutter_sign_column_always = 1
  endif
endif

" --- gruvbox ---
if &runtimepath =~? 'gruvbox'
  let g:gruvbox_italic=1
  colorscheme gruvbox
  highlight clear SignColumn
  highlight clear FoldColumn
  hi FoldColumn ctermfg=DarkGrey
endif


" --- Gutentags ---
if &runtimepath =~? 'vim-gutentags'
  let g:gutentags_cache_dir = expand('$DATA_DIR/tags')
endif


" --- incsearch ---
if &runtimepath =~? 'incsearch.vim'
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif
"
" --- Indent Guides ---
if &runtimepath =~? 'indentLine'
  let g:indentLine_char = '│'
endif

" --- Instant Markdown ---
if &runtimepath =~? 'vim-instant-markdown'
  let g:instant_markdown_autostart = 0
endif

" --- LimeLight ---
if &runtimepath =~? 'limelight.vim'
  nmap <Leader>l <Plug>(Limelight)
  xmap <Leader>l <Plug>(Limelight)
  " let g:limelight_conceal_ctermfg = 245
  let g:limelight_conceal_ctermfg = 'gray'
  " let g:limelight_conceal_guifg = '#928374'
  let g:limelight_conceal_guifg = 'DarkGray'
endif

" --- Markdown Preview ---
if &runtimepath =~? 'vim-markdown-preview'
  " let vim_markdown_preview_toggle=2
  " let vim_markdown_preview_hotkey='<leader>m'
  " let vim_markdown_preview_github=1
  " let vim_markdown_preview_browser='Google Chrome'
  " let vim_markdown_preview_temp_file=1
endif

" --- MatchTagAlways ---
if &runtimepath =~? 'MatchTagAlways'
  " Jump to matching tags
  nnoremap <leader>% :MtaJumpToOtherTag<cr>

  let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'mako': 1,
    \ 'htmldjango' : 1,
    \ 'liquid': 1,
    \ }
endif

" --- NeoMake ---
if &runtimepath =~? 'neomake'
  " lint when writing a buffer.
  if has('nvim') || v:version >= 800
    call neomake#configure#automake('nrw', 500)
  else
    call neomake#configure#automake('rw')
  endif

  " luacheck (ignore implicit global definitions)
  let g:neomake_lua_luacheck_args = ['--allow-defined', '--no-color', '--formatter=plain', '--ranges', '--codes', '--filename', '%:p']

  let g:neomake_markdown_markdownlint_maker = {
    \ 'args': ['-r', '~MD022,~MD032'],
    \ 'errorformat': '%f: %l: %m'
    \ }

  " pylint is super noisy, so let's stick to flake8.
  let g:neomake_python_flake8_maker = {
    \ 'args': ['--max-line-length=160', '--format=default'],
    \ 'errorformat':
      \ '%E%f:%l: could not compile,%-Z%p^,' .
      \ '%A%f:%l:%c: %t%n %m,' .
      \ '%A%f:%l: %t%n %m,' .
      \ '%-G%.%#',
      \ 'postprocess': function('neomake#makers#ft#python#Flake8EntryProcess')
    \ }
  let g:neomake_python_enabled_makers = ['flake8']
  let g:neomake_python_flake8_args = ['--max-line-length=160', '--format=default']

  function! neomake#makers#ft#zsh#shellcheck() abort
    let l:maker = neomake#makers#ft#sh#shellcheck()
    let l:maker.args += ['--shell', 'zsh']
    let l:maker.args += ['-x']
    return l:maker
  endfunction
endif


" --- neosnippet.vim ---
if &runtimepath =~? 'neosnippet.vim'
  " imap <leader>e <Plug>(neosnippet_expand_or_jump)
  " smap <leader>e <Plug>(neosnippet_expand_or_jump)
  " xmap <leader>e <Plug>(neosnippet_expand_target)
  imap <expr><cr> neosnippet#expandable() ?
    \  "\<Plug>(neosnippet_expand)" : "\<cr>"
  imap <expr><tab> neosnippet#jumpable() ?
    \  "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

  " let g:neosnippet#enable_snipmate_compatibility = 1  " enable snipMate snippets
endif

" --- vim-polyglot ---
if &runtimepath =~? 'vim-polyglot'
  let b:python_version_2 = 1
  let g:polyglot_disabled = ['markdown']  " polyglot seems to futz up markdown indentation
endif

" --- python-mode ---
if &runtimepath =~? 'python-mode'
  let g:pymode_syntax_space_errors = 0
  let g:pymode_rope = 0  " no Rope
  " - Linting -
  let g:pymode_lint = 1  " Let's leave this to neomake for now.
  " let g:pymode_lint_ignore = ["E501"]
  " let g:pymode_syntax_slow_sync = 1
  " " symbols
  " let g:pymode_lint_todo_symbol = 'WW'
  " let g:pymode_lint_comment_symbol = 'CC'
  " let g:pymode_lint_visual_symbol = 'RR'
  " let g:pymode_lint_error_symbol = '✖'
  " let g:pymode_lint_info_symbol = 'ℹ'
  " let g:pymode_lint_pyflakes_symbol = 'FF'
endif

" --- Ranger.vim ---
if &runtimepath =~? 'ranger.vim'
  let g:ranger_map_keys = 0
  nmap <leader>r :Ranger<cr>
endif

" --- shortcut ---
if &runtimepath =~? 'vim-shortcut'
  " Shortcut show shortcut menu and run chosen shortcut
  "       \ noremap <silent> <Leader><Leader> :Shortcuts<Return>
  " Shortcut fallback to shortcut menu on partial entry
  "       \ noremap <silent> <Leader> :Shortcuts<Return>
endif

" --- SimplyFold ---
if &runtimepath =~? 'simpylfold'
  let g:SimpylFold_docstring_preview = 1
  set foldlevel=99
endif

" --- Startify ---
if &runtimepath =~? 'vim-startify'
  let g:startify_change_to_vcs_root = 1
  let g:startify_session_autoload = 1
  let g:startify_custom_header = startify#fortune#boxed()
endif

" --- SuperTab ---
if &runtimepath =~? 'supertab'
  " Tabbing goes bottom-to-top and for some reason this fixes it.
  let g:SuperTabDefaultCompletionType = '<C-n>'
endif

" --- Tagbar ---
if &runtimepath =~? 'tagbar'
  nmap <leader>t :TagbarToggle<cr>
endif

" --- UltiSnips ---
if &runtimepath =~? 'ultisnips'
  " let g:UltiSnipsExpandTrigger="<leader>e"
  " let g:UltiSnipsJumpForwardTrigger="<c-n>"
  " let g:UltiSnipsJumpBackwardTrigger="<c-p>"
endif

" --- Vimwiki ---
if &runtimepath =~? 'vimwiki'
  let g:vimwiki_list = [{'path': '~/.vimwiki',
                       \ 'syntax': 'markdown', 'ext': '.wiki',
                       \ 'automatic_nested_syntaxes': 1}]
  " disable the <tab> mapping provided by vimwiki, which interferes with SuperTab
  let g:vimwiki_table_mappings = 0
endif

" --- vim-auto-origami ---
if &runtimepath =~? 'vim-auto-origami'
  let g:auto_origami_foldcolumn = 3
  augroup autofoldcolumn
    au!
    au CursorHold,BufWinEnter,WinEnter * AutoOrigamiFoldColumn
  augroup END
endif

" --- vim-devicons ---
if &runtimepath =~? 'vim-devicons'
  let g:webdevicons_enable_ctrlp = 1
endif

" --- vim-easy-align ---
if &runtimepath =~? 'vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
endif

" --- vim-emoji ---
if &runtimepath =~? 'vim-emoji'
  set completefunc=emoji#complete
endif

" --- vim-indent-guides ---
if &runtimepath =~? 'vim-indent-guides'
  " let g:indent_guides_guide_size = 1
  " let g:indent_guides_enable_on_vim_startup = 1
endif

" --- YouCompleteMe ---
if &runtimepath =~? 'youcompleteme'
  let g:ycm_autoclose_preview_window_after_completion=1
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
endif
