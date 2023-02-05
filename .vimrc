
"" Settings ========================================================
set scrolloff=10
set showmode
set showcmd
set smartcase
set incsearch
set hlsearch
set visualbell
set clipboard+=unnamed   
set number          " Enable line numbers
set relativenumber  " Enable relative line numbers

let mapleader = " "

"" Key mappings ========================================================
" NORMAL MODE
"Edit
"Replace word with paste
nnoremap <a-p> "_diwP

nnoremap <a-j> :m .+1<cr>==
nnoremap <a-k> :m .-2<cr>==

nnoremap <a-d> "_diw
nnoremap <a-c> "_ciw
nnoremap <a-z> "_ci"
nnoremap <a-x> "_ci(

nnoremap <a-o> o<ESC>
nnoremap <a-O> O<ESC>

" Motions
nnoremap E ge
nnoremap m ]m
nnoremap M [m
nnoremap H ^
nnoremap L $
nnoremap <C-o> <c-i>
nnoremap <C-i> <c-o>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz

" Windows and buffers
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <a-right> <cmd>bn<cr>
nnoremap <a-left> <cmd>bp<cr>
nnoremap <a-t> <cmd>ene<cr>
nnoremap WQ <cmd>wqall<cr>
nnoremap W <cmd>wall<cr>
nnoremap Q <cmd>qall!<cr>
nnoremap <a-q> <cmd>bd!<cr>
nnoremap <a-w> <cmd>%bd!|e#|bd#<cr>

" Folds
nnoremap | zM
nnoremap -- zR

" Macros and registers
" Execute macro saved in 'q' register
nnoremap qj @q
" Repeat las command
nnoremap , @:
nnoremap "_ 
" Find
" Clean search highlights
nnoremap ;; <cmd>noh<cr>

" INSERT MODE
inoremap jk <Esc>
inoremap <a-s> <Del>
inoremap <a-d> <C-o>"_diw
inoremap <a-c> <C-o>"_ciw
inoremap <a-e> <C-o>"_de
inoremap <a-w> <C-o>w
inoremap <a-b> <C-o>b
inoremap <a-j> <ESC>:m .+1<cr>==gi
inoremap <a-k> <ESC>:m .-2<cr>==gi 

" VISUAL MODE
vnoremap jk <Esc>
" Easy visual indentation
vnoremap < <gv
vnoremap > >gv
" Select all
nnoremap <c-s> ggVG
vnoremap <c-s> ggOG
