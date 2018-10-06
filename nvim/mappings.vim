" --------------------
"       Commands
" --------------------

" ----- Searching -----
nnoremap <cr> :nohlsearch<cr>


" ----- Navigation -----
" faster exiting from insert mode
inoremap jj <Esc>

" faster exiting from terminal mode
tnoremap kk <C-\><C-n>
" tnoremap <Esc> <C-\><C-n>  " breaks fzf.vim

" faster command entry
nnoremap ; :
vnoremap ; :
" but still keep the ; functionality
nnoremap : ;
vnoremap : ;

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


" ----- Editing -----
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

" ----- Completion -----
" <cr> to select completion
imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<cr>"
