let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd /mnt/data/Proxectos/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +16 /mnt/data/Proxectos/nvim/lua/mappings.lua
badd +30 ~/.tmux.conf
badd +342 ~/.ideavimrc
badd +127 .vrapperrc
badd +45 .vimrc
argglobal
%argdel
edit ~/.ideavimrc
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 125 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 128 + 127) / 254)
argglobal
balt .vrapperrc
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 342 - ((44 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 342
normal! 061|
lcd /mnt/data/Proxectos/dotfiles
wincmd w
argglobal
if bufexists(fnamemodify("/mnt/data/Proxectos/nvim/lua/mappings.lua", ":p")) | buffer /mnt/data/Proxectos/nvim/lua/mappings.lua | else | edit /mnt/data/Proxectos/nvim/lua/mappings.lua | endif
if &buftype ==# 'terminal'
  silent file /mnt/data/Proxectos/nvim/lua/mappings.lua
endif
balt ~/.tmux.conf
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
3,5fold
12,18fold
87,102fold
105,112fold
122,123fold
124,125fold
115,136fold
139,150fold
153,159fold
162,166fold
169,176fold
20,177fold
180,186fold
188,198fold
201,207fold
208,217fold
220,226fold
227,230fold
233,239fold
240,245fold
let &fdl = &fdl
let s:l = 19 - ((5 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 0
lcd /mnt/data/Proxectos/dotfiles
wincmd w
exe 'vert 1resize ' . ((&columns * 125 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 128 + 127) / 254)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
