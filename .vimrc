
"" Settings ========================================================
set scrolloff=10
set showmode
set showcmd
set smartcase
set incsearch
set hlsearch
set visualbell
set clipboard+=unnamed   
let mapleader = " "

"" Key mappings ========================================================
inoremap jk <Esc>
vnoremap jk <Esc>

" Edit (leader p, Bs, x, /, a, o, O)
" Easy visual indentation
vnoremap < <gv
vnoremap > >gv
"Replace word with paste
nnoremap <leader>p "_diwP
nnoremap <leader>Bs diw
nnoremap <leader>x ciw
"Change inside parentheses
nnoremap <leader>/ ci(
"Delete function argument
nnoremap <leader>a daa
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>

" Motions
nnoremap m ]m
nnoremap M [m
nnoremap H ^
nnoremap L $

" Windows and buffers (leader w)
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j
map WQ :wqall<CR>
map W :wall<CR>
map Q :qall!<CR>


" Macros and registers
" Execute macro saved in 'q' register
nnoremap qj @q
" Repeat las command
nnoremap , @:
nnoremap "_ t

