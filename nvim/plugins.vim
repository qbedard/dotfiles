" --------------------
"       Plugins
" --------------------

" ----- Install vim-plug -----
let $PLUG_LOC = expand('$DATA_DIR/site/autoload/plug.vim')
if empty(glob($PLUG_LOC))
  silent !curl -fLo $PLUG_LOC --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup autopluginstall
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    autocmd VimEnter * UpdateRemotePlugins --sync | source $MYVIMRC
  augroup END
endif

" ----- Install Plugins -----
filetype off
call plug#begin('$DATA_DIR/site/plugged')

" /--- Start Plugins ---\

" - GUI -
Plug 'morhetz/gruvbox'  " excellent theme
Plug 'vim-airline/vim-airline'  " adds metadata at the bottom
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'  " fancy Nerd Font icons
Plug 'easymotion/vim-easymotion'  " fast finding tool
Plug 'mhinz/vim-startify'  " fancy start screen
Plug 'Yggdroot/indentLine'  " nice indentation lines (note: mucks with conceal, might affect JSON)
" Plug 'nathanaelkane/vim-indent-guides'  " nice indentation fill
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " file browser
" Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
" if has('nvim')
"   Plug 'rbgrouleff/bclose.vim'  " required for ranger.vim in neovim
" endif
" Plug 'francoiscabrol/ranger.vim'  " , { 'on': 'Ranger' }
" Plug 'tpope/vim-vinegar'  " inline buffer file browser (extends netrw)

" - Fuzzy Search & Tags -
" Plug 'haya14busa/incsearch.vim'  " incremental highlighting, breaking nvim
" Plug 'haya14busa/is.vim'  " successor to incsearch, not sure if nvim supported yet
Plug 'ctrlpvim/ctrlp.vim'  " FUZZY
if executable('ctags')
  Plug 'ludovicchabant/vim-gutentags'  " manages tag files
  Plug 'majutsushi/tagbar'  " neat tag nav UI
endif
"" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " alternate terminal fuzzy
"" Plug 'junegunn/fzf.vim'
"" Plug 'sunaku/vim-shortcut'  " discoverable shortcut system

" - Editing -
Plug 'zhimsel/vim-stay'  " persist editing state when switching buffers, etc
Plug 'tpope/vim-eunuch'  " unix cmds (Move, Delete, etc)
Plug 'tpope/vim-commentary'  " commenting shortcuts
Plug 'tpope/vim-surround'  " quoting, etc
Plug 'tpope/vim-repeat'  " repeat supported plugin maps
Plug 'editorconfig/editorconfig-vim'  " support for .editorconfig files
Plug 'Valloric/MatchTagAlways'  " show matching tags
Plug 'jiangmiao/auto-pairs'  " insert closing quotes, parens, etc
" Plug 'junegunn/vim-easy-align'  " line stuff up
Plug 'junegunn/vim-peekaboo'  " show preview of registers
Plug 'ap/vim-css-color'  " preview color hex, words, etc (for CSS mostly)

" - Git -
Plug 'tpope/vim-fugitive'  " the defacto git standard
Plug 'tpope/vim-rhubarb'  " GitHub support for fugitive
Plug 'airblade/vim-gitgutter'  " way more than just gutter signs
Plug 'junegunn/gv.vim'  " commit browser

" - Language -
Plug 'sheerun/vim-polyglot'  " a ton of language support
Plug 'tpope/vim-sleuth'  " detect shiftwidth and expandtab automagically
Plug 'gabrielelana/vim-markdown'  " better markdown
" Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'Vimjas/vim-python-pep8-indent'  " fixes python indentation issues
Plug 'raimon49/requirements.txt.vim'  " syntax highlighting for requirements.txt
Plug 'tmhedberg/simpylfold'  " python folding
Plug 'Konfekt/FastFold'  " faster folding by ignoring manual folding
" Plug 'tweekmonster/django-plus.vim'  " better django detection/support
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-liquid'  " jekyll templates
" Plug 'chrisbra/csv.vim'  " strong csv toolset
Plug 'hashivim/vim-vagrant'  " Vagrant support
Plug 'ekalinin/Dockerfile.vim'  " Dockerfile support
" Plug 'sophacles/vim-bundle-mako'  " mako template support
" Plug 'junegunn/vim-emoji'  " support for emoji
Plug 'tpope/vim-characterize'  " extend character metadata for `ga`

" - Linting -
Plug 'neomake/neomake'  " linting/building
" Plug 'w0rp/ale'  " linting/building

" - Completion -
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
else
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neco-vim'  " VimL
" TODO: figure out how to check if jedi is installed
Plug 'zchee/deoplete-jedi'  " python
" This seems cool to get working...
" Plug 'Shougo/echodoc.vim'  " show function defs
Plug 'fszymanski/deoplete-emoji'  " deoplete support for emoji

" if has('nvim') || v:version >= 705
"   Plug 'valloric/youcompleteme'
" else
"   Plug 'ajh17/VimCompletesMe'
" endif
"" Plug 'scrooloose/syntastic'

Plug 'ervandew/supertab'  " use tab for insert completions

" - Snippets -
" Plug 'sirver/ultisnips'
" vvv This is breaking right now for some reason.
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'  " fast HTML pseudo-coding

" - Notes -
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" - Preview -
"" Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'suan/vim-instant-markdown'

" - Writing -
Plug 'junegunn/goyo.vim'  " no-distractions editing
Plug 'junegunn/limelight.vim'  " highlight current block

" \---- End Plugins ----/

call plug#end()

if has('autocmd')
  filetype plugin indent on
endif


" ----- Plugin Config -----

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
  "" let g:user_emmet_leader_key=','
endif

" --- Fugitive ---
if &runtimepath =~? 'vim-fugitive'
  "" :command Gadd Git add %
endif

" --- GitGutter ---
if &runtimepath =~? 'vim-gitgutter'
  if exists('&signcolumn')  " Vim 7.4.2201
    set signcolumn=yes
  else
    let g:gitgutter_sign_column_always = 1
  endif
  highlight clear SignColumn
endif

" --- gruvbox ---
if &runtimepath =~? 'gruvbox'
  let g:gruvbox_italic=1
  colorscheme gruvbox
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

" --- NERDTree ---
if &runtimepath =~? 'nerdtree'
  map <C-n> :NERDTreeToggle<cr>
  map ˜ :NERDTreeFind<cr>
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
