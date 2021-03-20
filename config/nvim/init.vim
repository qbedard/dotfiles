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
"------------------------------------ Lua ------------------------------------"
lua require("init")
" lua require'minimal'

function s:recompile_plugins()
  luafile %
  PackerCompile
endfunction

"------------------------------- Autocommands --------------------------------"
augroup recompile_plugins
  autocmd BufWritePost plugins.lua call <SID>recompile_plugins()
augroup END

augroup number_toggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" TODO: Find out why tf I do this
augroup win_resize
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" Go away, netrw!
augroup hide_netrw
  autocmd FileType netrw setl bufhidden=wipe
augroup END

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
" <CR> to select completion (must be double quotes!)
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
