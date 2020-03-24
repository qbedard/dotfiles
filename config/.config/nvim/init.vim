scriptencoding utf-8
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
"-------------------------------- Directories --------------------------------"
if $XDG_CONFIG_HOME ==? ''
  let $XDG_CONFIG_HOME = expand('$HOME/.config')
endif
let $RUNTIME_DIR = expand('$XDG_CONFIG_HOME/nvim')  " ~/.config/nvim

if $XDG_DATA_HOME ==? ''
  let $XDG_DATA_HOME = expand('$HOME/.local/share')
endif
let $DATA_DIR = expand('$XDG_DATA_HOME/nvim')  " ~/.local/share/nvim

"----------------------------------- Python ----------------------------------"
set pyxversion=3
" TODO: find equivalent setting for Vim8
if has('nvim')
  let $VENV_DIR = expand('$DATA_DIR/venv')
  let $NODE_VENV_DIR = expand('$VENV_DIR/node')
  let $PYTHON2_VENV_DIR = expand('$VENV_DIR/python2')
  let $PYTHON3_VENV_DIR = expand('$VENV_DIR/python3')
  " if isdirectory($VENV_DIR)
  "   " dedicated vim venvs
  "   let g:python_host_prog  = expand('$PYTHON2_VENV_DIR/bin/python')
  "   let g:python3_host_prog = expand('$PYTHON3_VENV_DIR/bin/python')
  "   add python3 bins to PATH
  "   let $PATH = expand('$PATH:$PYTHON3_VENV_DIR/bin')
  " endif
endif

"------------------------------ Neovim Defaults ------------------------------"
" If we're not in Neovim, make sure all the defaults are the same.
if !has('nvim')
  runtime! neovim-defaults.vim
  let &runtimepath.=expand(',$DATA_DIR/site')
endif

"-------------------------------- The Basics ---------------------------------"
let g:mapleader=' '

" TODO: find out what this breaks
" set autochdir  " automatically set working directory

if executable('fish')
  set shell=fish  " only needed for vim
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

" Wrap a line around visually if it's too long.
set wrap
set linebreak
set textwidth=0
set wrapmargin=0

" TODO: find out why the setting doesn't stick unless in an autocmd
set list
augroup set_listchars
  autocmd VimEnter * :set listchars=tab:→\ ,extends:›,precedes:‹,nbsp:·,trail:·
augroup END

set foldlevel=99  " for SimplyFold

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
if has('syntax')
  syntax enable
endif

set noshowmode  " hide the mode (airline will show instead)

set termguicolors  " true color support
let $NVIM_TERM = 1

set guioptions=  " remove scrollbars, etc

set cursorline
" set lazyredraw  " causes flickering

set background=dark

augroup win_resize
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

" Go away, netrw!
augroup hide_netrw
  autocmd FileType netrw setl bufhidden=wipe
augroup END

" fix italics with tmux
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"

"-------------------------------- Navigation ---------------------------------"
set mouse=a  " let the mouse wheel scroll page, etc

"---------------------------------- Editing ----------------------------------"
set viewoptions-=options  " keep from saving cur dir in view

set clipboard=unnamed  " yank to system clipboard

set completeopt-=preview  " preview in a buffer?! No.

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

"-----------------------------------------------------------------------------"
"                                  Mappings                                   "
"-----------------------------------------------------------------------------"

"--------------------------------- Navigation --------------------------------"
" faster exiting from insert mode (-noremap to allow for abbrevs to work)
imap jj <Esc>
" TODO: find out why <C-i> doesn't work
inoremap <C-i> <Esc>
inoremap <C-l> <Esc>

" faster exiting from terminal mode
tnoremap kk <C-\><C-n>

" faster command entry
nnoremap ; :
xnoremap ; :
" but still keep the ; functionality
" nnoremap : ;
" xnoremap : ;

" easier nav in insert mode (Ctrl)
" NOTE: <C-h> doesn't work thanks to <C-h> sending <bs> in most terminals
" inoremap <C-k> <C-o>gk
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>
" inoremap <C-j> <C-o>gj

" nav to begin and end of line (rather than buffer) with H/L
nnoremap H ^
nnoremap L $

" buffer switching (Shift + j/k)
nnoremap K :bn<CR>
nnoremap J :bp<CR>
xnoremap K :bn<CR>
xnoremap J :bp<CR>

" tab switching (Ctrl+Tab)
noremap  <C-Tab>  :tabnext<CR>
inoremap <C-Tab>  <C-O>:tabnext<CR>
noremap  <M-Tab>  :tabprev<CR>
inoremap <M-Tab>  <C-O>:tabprev<CR>

"---------------------------------- Editing ----------------------------------"
" redo
nnoremap U <C-R>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" insert a single character
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
" <CR> to select completion (must be double quotes!)
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"-----------------------------------------------------------------------------"
"                                   Plugins                                   "
"-----------------------------------------------------------------------------"
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
" /----------------------------- Start Plugins ------------------------------\
" Note: On-demand loading breaks the conditional config approach,
" so the options are:
" 1) on-demand load, unconditional config
" 2) always load, conditional config

Plug 'junegunn/vim-plug'  " add docs

" ----------- GUI -----------
Plug 'morhetz/gruvbox'  " excellent theme
" Plug 'lifepillar/vim-gruvbox8'  " 'better' (simpler) gruvbox
Plug 'vim-airline/vim-airline'  " adds metadata at the bottom
Plug 'vim-airline/vim-airline-themes'  " themes for airline
Plug 'justinmk/vim-dirvish'  " file browser
Plug 'ryanoasis/vim-devicons'  " fancy Nerd Font icons
Plug 'Yggdroot/indentLine'  " nice indentation lines (mucks with conceal, maybe JSON)
" Plug 'benknoble/vim-auto-origami'  " auto-show foldcolumn
Plug 'romainl/vim-cool'  " nohls after searching
" Plug 'liuchengxu/vim-which-key'  " show key bindings while typing  TODO: set up

" TODO: Fidget with these guys. They're neat.
" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'

" ---------- Tags -----------
if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'  " manages tag files
  Plug 'majutsushi/tagbar'  " neat tag nav UI
endif

" ------ Fuzzy Search -------
if executable('fzf')
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
endif

" --------- Motion ----------
Plug 'christoomey/vim-tmux-navigator'  " tmux nav integration
" TODO: adjust mappings to support this
" Plug 'RyanMillerC/better-vim-tmux-resizer'  " resizing like vim-tmux-navigator
Plug 'easymotion/vim-easymotion'  " fast finding tool
Plug 'kshenoy/vim-signature'  " show marks in the sign column
"Plug 'rhysd/clever-f.vim'  " fast f/t repetition (instead of ;)
Plug 'tpope/vim-unimpaired'  " handy ]x/[x mappings
Plug 'unblevable/quick-scope'  " highlight unique letters in words for f/t

" --------- Editing ---------
Plug 'ntpeters/vim-better-whitespace'  " better whitespace stripping
Plug 'zhimsel/vim-stay'  " persist editing state when switching buffers, etc
" Plug 'cometsong/CommentFrame.vim'  " fancy comment title frame generator
Plug 'tpope/vim-commentary'  " commenting shortcuts
Plug 'tpope/vim-eunuch'  " unix cmds (Move, Delete, etc)
Plug 'tpope/vim-surround'  " quoting, etc
Plug 'tpope/vim-repeat'  " repeat supported plugin maps
Plug 'tpope/vim-abolish'  " abbreviation, substitution, coercion
Plug 'wellle/targets.vim'  " next/last surround pair text object
Plug 'michaeljsmith/vim-indent-object'  " indentation level text object
" Plug 'Valloric/MatchTagAlways'  " show matching tags <- bugging out
Plug 'jiangmiao/auto-pairs'  " insert closing quotes, parens, etc
Plug 'junegunn/vim-easy-align'  " line stuff up
Plug 'junegunn/vim-peekaboo'  " show preview of registers
Plug 'AndrewRadev/splitjoin.vim'  " single-line <-> multi-line
Plug 'AndrewRadev/switch.vim'  " true <-> false, etc
Plug 'AndrewRadev/sideways.vim'  " SidewaysLeft/SidewaysRight to swap arguments
" Plug 'AndrewRadev/whitespaste.vim'  " auto-fix whitespace lines when pasting
Plug 'stefandtw/quickfix-reflector.vim'  " editable quickfix
" Plug 'kkoomen/vim-doge'  " doc generator, TODO: set mappings
Plug 'godlygeek/tabular'  " align tabular data

" ----------- Git -----------
Plug 'tpope/vim-fugitive'  " the defacto git standard
Plug 'tpope/vim-rhubarb'  " GitHub support for fugitive
" Plug 'airblade/vim-gitgutter'  " way more than just gutter signs
Plug 'mhinz/vim-signify'  " scm gutter signs
Plug 'junegunn/gv.vim'  " badass commit browser
Plug 'sodapopcan/vim-twiggy'  " branch manager
Plug 'APZelos/blamer.nvim'  " inline blame (virtual text)
Plug 'rhysd/git-messenger.vim'  " popup commit message for cursor (:GitMessenger)

" --------- Testing ---------
Plug 'janko-m/vim-test'  " TODO: figure this out
Plug 'junegunn/vader.vim'  " TODO: figure this out

" --------- Environments ---------
Plug 'timbedard/vim-envelop'  " virtualenv management

" ----- Language/Syntax -----
" General "
Plug 'sheerun/vim-polyglot'  " a ton of language support
Plug 'tpope/vim-sleuth'  " detect shiftwidth and expandtab automagically
Plug 'Konfekt/FastFold'  " more intuitive folding
Plug 'pseewald/vim-anyfold'  " faster folding by ignoring manual folding
Plug 'tpope/vim-characterize'  " extend character metadata for `ga`

" XML/HTML "
" Plug 'alvan/vim-closetag'  " auto-close XML tags <- adds flicker

" CSS "
Plug 'hail2u/vim-css3-syntax'
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}  " show hex/rgba colors

" JavaScript "
Plug 'mxw/vim-jsx'  " jsx for React

" Python "
" Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}  " fixes python indent issues
Plug 'tmhedberg/simpylfold'  " python folding
Plug 'raimon49/requirements.txt.vim'  " syntax highlighting for requirements.txt

" Misc "
Plug 'tmux-plugins/vim-tmux'  " tmux.conf syntax
Plug 'tpope/vim-liquid'  " jekyll templates

" --------- Linting ---------
" Plug 'dense-analysis/ale'  " linting/building

" ------- Completion --------
Plug 'neovim/nvim-lsp'
" Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
" if !has('nvim')
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" Plug 'Shougo/deoplete-lsp'
" Plug 'Shougo/neco-vim'  " VimL
" Plug 'fszymanski/deoplete-emoji'  " deoplete support for emoji
" Plug 'deoplete-plugins/deoplete-jedi', {'do': 'git submodule update --init'}  " python
" " Plug 'tbodt/deoplete-tabnine', {'do': './install.sh'}  " machine learning autocompletion
" Plug 'carlitux/deoplete-ternjs', {'do': 'yarn global add tern'}  " js autocompletion
" Plug 'Shougo/echodoc.vim'  " show func sig

" Plug 'davidhalter/jedi-vim'  " python completion

" TODO: put together a decent setup for this
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'ervandew/supertab'  " use tab for insert completions

" -------- Snippets ---------
" Plug 'mattn/emmet-vim'  " fast HTML pseudo-coding

" ---------- Notes ----------
Plug 'vimwiki/vimwiki', {'branch': 'dev'}

" --------- Preview ---------
Plug 'iamcco/markdown-preview.nvim', {'do': ':call mkdp#util#install()'}
" Plug 'suan/vim-instant-markdown'
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
" function! BuildMDComposer(info)
"   if a:info.status !=? 'unchanged' || a:info.force
"     if has('nvim')
"       !cargo build --release
"     else
"       !cargo build --release --no-default-features --features json-rpc
"     endif
"   endif
" endfunction
" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildMDComposer') }

" --------- Writing ---------
Plug 'junegunn/goyo.vim'  " no-distractions editing
Plug 'junegunn/limelight.vim'  " highlight current block

" --------- Misc ---------
Plug 'ChristianChiarulli/codi.vim'  " inline REPL eval

" \------------------------------ End Plugins -------------------------------/

call plug#end()

if has('autocmd')
  filetype plugin indent on
endif


"----------------------------- Configure Plugins -----------------------------"

" --- airline ---
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" --- ALE ---
if &runtimepath =~? 'ale'
  " Commands
  command! Fix ALEFix

  " Mappings
  nmap <silent> ]w <Plug>(ale_next_wrap)
  nmap <silent> [w <Plug>(ale_previous_wrap)
  nmap <silent> gf <Plug>(ale_fix)
  " nmap <silent> gd <Plug>(ale_go_to_definition)
  " nmap <silent> gy <Plug>(ale_go_to_type_definition)
  " nmap <silent> gr <Plug>(ale_find_references)

  " General
  let g:airline#extensions#ale#enabled = 1
  " set omnifunc=ale#completion#OmniFunc
  " let g:ale_completion_enabled = 1
  " let g:ale_set_balloons = 1
  " let g:ale_set_highlights = 0
  let g:ale_virtualtext_cursor = 1

  " venv detection of direnv venvs
  let g:ale_virtualenv_dir_names = [
    \ '.direnv',
    \ '.env',
    \ '.venv',
    \ 'env',
    \ 've',
    \ 've-py3',
    \ 'venv',
    \ 'virtualenv',
    \ ]

  " Signs
  " let g:ale_sign_error = '✖'
  " let g:ale_sign_warning = '⚠'
  " let g:ale_sign_info = '➤'
  let g:ale_sign_error = ''
  let g:ale_sign_warning = ''
  let g:ale_sign_info = ''
endif

" --- auto-pairs ---
let g:AutoPairsMapSpace = 0

" --- blamer.nvim ---
if &runtimepath =~? 'blamer.nvim'
  nnoremap <Leader>b :BlamerToggle<CR>
  vnoremap <Leader>b :BlamerToggle<CR>
  let g:blamer_delay = 0
  let g:blamer_template = '<author>, <committer-time> • <summary>'
endif

" --- deoplete ---
if &runtimepath =~? 'deoplete.nvim'
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#option({
    \ 'auto_refresh_delay': 5,
    \ 'num_processes': 0,
    \ 'omni_patterns': {
      \ 'complete_method': 'omnifunc',
      \ 'terraform': '[^ *\t"{=$]\w*',
      \ },
    \ 'sources': {
      \ 'python': ['jedi'],
      \ 'javascript': ['tern'],
      \ 'javascript.jsx': ['tern']
      \ }
    \ })
endif

" --- EasyMotion ---
if &runtimepath =~? 'vim-easymotion'
  noremap \ <Plug>(easymotion-prefix)

  " <Leader>f{char} to move to {char}
  noremap  <Leader>f <Plug>(easymotion-bd-f)
  nnoremap <Leader>f <Plug>(easymotion-overwin-f)
endif

" --- echodoc ---
let g:echodoc#enable_at_startup = 1
let g:echodoc#enable_force_overwrite = 1

" --- Emmet ---
" default is <C-Y>  " TODO: find a better mapping
" let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 1

" --- fzf ---
if &runtimepath =~? 'fzf.vim'
  augroup hide_fzf_statusline
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noruler
      \| autocmd BufLeave <buffer> set laststatus=2 ruler
  augroup END

  " mappings
  nnoremap <C-f> :BLines<CR>
  nnoremap <C-b> :Buffers<CR>
  nnoremap <C-c> :Commands<CR>

  " show files in a git project root (or current dir if not project)
  command! ProjectFiles execute 'Files' FindGitRoot()
  nnoremap <C-p> :ProjectFiles<CR>

  " don't highlight the current line and selection column
  let g:fzf_colors = {'bg+': ['bg', 'Normal']}
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

" --- Goyo ---
let g:goyo_width = 100
let g:goyo_height = '100%'

"- from junegunn ---
let g:limelight_paragraph_span = 1
let g:limelight_priority = -1

function! s:goyo_enter()
  if has('gui_running')
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight
  let &l:statusline = '%M'
  highlight StatusLine ctermfg=red guifg=red cterm=NONE gui=NONE
endfunction

function! s:goyo_leave()
  if has('gui_running')
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
endfunction

augroup goyo_enter_leave
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

nnoremap <Leader>G :Goyo<CR>
"- end from junegunn ---

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

" --- gruvbox8 ---
if &runtimepath =~? 'vim-gruvbox8'
  let g:airline_theme='gruvbox'
  let g:gruvbox_filetype_hi_groups = 1
  let g:gruvbox_plugin_hi_groups = 1

  colorscheme gruvbox8

  " match the fold column colors to the line number column
  " must come after colorscheme gruvbox
  highlight clear FoldColumn
  highlight! link FoldColumn LineNr
endif

" --- Gutentags ---
let g:gutentags_cache_dir = expand('$DATA_DIR/tags')
let g:gutentags_exclude_filetypes = [
  \ 'git',
  \ 'gitcommit',
  \ 'gitconfig',
  \ 'gitrebase',
  \ 'gitsendemail',
  \ ]

" --- hexokinase ---
let g:Hexokinase_ftEnabled = ['css', 'less', 'scss', 'xml']

" --- indentLine ---
let g:indentLine_char = '│'
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_fileTypeExclude = ['text', 'markdown']

" --- Instant Markdown ---
let g:instant_markdown_autostart = 0
let g:instant_markdown_python = 1

" --- jedi-vim ---
let g:jedi#completions_enabled = 0
let g:jedi#documentation_command = '<leader>k'

" --- LimeLight ---
if &runtimepath =~? 'limelight.vim'
  nnoremap <Leader>l <Plug>(Limelight)
  xnoremap <Leader>l <Plug>(Limelight)
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_guifg = 'DarkGray'
endif

" --- MatchTagAlways ---
if &runtimepath =~? 'MatchTagAlways'
  " Jump to matching tags
  nnoremap <leader>% :MtaJumpToOtherTag<CR>

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

" --- vim-quickscope --- "
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" --- vim-envelop --- "
let g:envelop_node_link = [
  \ '/node_modules/.bin/eslint',
  \ '/node_modules/.bin/prettier',
  \ '/node_modules/.bin/stylelint',
  \ '/node_modules/.bin/vim-language-server',
  \ ]
let g:envelop_node_packages = [
  \ 'eslint',
  \ 'neovim',
  \ 'prettier',
  \ 'stylelint',
  \ 'stylelint-config-standard',
  \ 'vim-language-server',
  \ ]
let g:envelop_python3_link = [
  \ 'bin/black',
  \ 'bin/flake8',
  \ 'bin/isort',
  \ 'bin/pip3',
  \ 'bin/pyls',
  \ 'bin/python3',
  \ 'bin/vint',
  \ ]
let g:envelop_python3_packages = [
  \ 'black',
  \ 'flake8',
  \ 'flake8-bugbear',
  \ 'isort',
  \ 'pep8-naming',
  \ 'pip',
  \ 'pynvim',
  \ 'python-language-server[all]',
  \ 'vim-vint',
  \ ]

" --- nvim-lsp ---
if &runtimepath =~? 'nvim-lsp'
lua << EOF
require'nvim_lsp'.bashls.setup{}
require'nvim_lsp'.pyls.setup{}
require'nvim_lsp'.vimls.setup{}
EOF
  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
  nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  " nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  " nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

  " Use LSP omni-completion in Python files.
  autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
  autocmd Filetype vim setlocal omnifunc=v:lua.vim.lsp.omnifunc
endif

" --- vim-polyglot ---
let g:polyglot_disabled = ['helm']

" --- SimplyFold ---
let g:SimpylFold_docstring_preview = 1

" --- SuperTab ---
" Tabbing goes bottom-to-top and for some reason this fixes it.
let g:SuperTabDefaultCompletionType = '<C-n>'

" --- Tagbar ---
if &runtimepath =~? 'tagbar'
  nnoremap <leader>t :TagbarToggle<CR>
endif

" --- Vimwiki ---
if &runtimepath =~? 'fzf.vim'
  " going for maximum GitHub compatibility here
  let g:vimwiki_list = [
    \ {
      \ 'path': '~/.vimwiki',
      \ 'syntax': 'markdown', 'ext': '.md',
      \ 'auto_diary_index': 1,
      \ 'automatic_nested_syntaxes': 1,
      \ 'index': 'home',
      \ 'links_space_char': '-'
      \ },
    \ {
      \ 'path': '~/.vimwiki-personal',
      \ 'syntax': 'markdown', 'ext': '.md',
      \ 'auto_diary_index': 1,
      \ 'automatic_nested_syntaxes': 1,
      \ 'index': 'home',
      \ 'links_space_char': '-'
      \ }
    \ ]
  let g:vimwiki_global_ext = 0
  let g:vimwiki_auto_chdir = 1
  let g:vimwiki_hl_headers = 1
  " let g:vimwiki_folding = 'syntax:quick'  " not working
  " let g:vimwiki_listsyms = ' ○◐●✓'

  command! Wiki :Files ~/.vimwiki
endif

" --- vim-anyfold ---
if &runtimepath =~? 'vim-anyfold'
  let g:anyfold_motion = 0
  augroup anyfold_activate
    autocmd! Filetype * AnyFoldActivate
  augroup END
endif

" --- vim-auto-origami ---
if &runtimepath =~? 'vim-auto-origami'
  let g:auto_origami_foldcolumn = 3
  augroup auto_fold_column
    autocmd! CursorHold,BufWinEnter,WinEnter * AutoOrigamiFoldColumn
  augroup END
endif

" --- vim-better-whitespace ---
if &runtimepath =~? 'vim-better-whitespace'
  let g:better_whitespace_enabled = 0
  let g:strip_whitelines_at_eof = 1
  command! Trim StripWhitespace
endif

" --- vim-devicons ---
let g:webdevicons_enable_ctrlp = 1

" --- vim-easy-align ---
if &runtimepath =~? 'vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xnoremap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nnoremap ga <Plug>(EasyAlign)
endif

" --- vim-markdown (polyglot) ---
let g:vim_markdown_new_list_item_indent = 2
" --- vim-signature ---
let g:SignatureMarkTextHLDynamic = 1


" --- vim-signify ---
if &runtimepath =~? 'vim-signify'
  set signcolumn=yes
  let g:signify_priority = 0

  let g:signify_sign_add = ''
  let g:signify_sign_delete = ''
  let g:signify_sign_delete_first_line = ''
  let g:signify_sign_change = ''

  " let g:signify_sign_change = '~'
  highlight! link SignifySignChange GruvboxBlueSign

  " nifty hunk motions
  omap ic <plug>(signify-motion-inner-pending)
  xmap ic <plug>(signify-motion-inner-visual)
  omap ac <plug>(signify-motion-outer-pending)
  xmap ac <plug>(signify-motion-outer-visual)
endif
