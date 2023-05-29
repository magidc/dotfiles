let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd /mnt/data/Proxectos/dotfiles/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +168 ~/.ideavimrc
badd +1 /mnt/data/Proxectos/dotfiles/.vimrc
badd +67 ~/.tmux.conf
badd +1 /mnt/data/Proxectos/dotfiles/.vrapperrc
badd +51 lua/mappings.lua
badd +1 lua/plugins/configs/treesitter.lua
argglobal
%argdel
edit lua/mappings.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
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
exe 'vert 1resize ' . ((&columns * 105 + 159) / 318)
exe 'vert 2resize ' . ((&columns * 106 + 159) / 318)
exe 'vert 3resize ' . ((&columns * 105 + 159) / 318)
argglobal
balt lua/plugins/configs/treesitter.lua
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
3,4fold
12,17fold
96,110fold
114,120fold
131,132fold
133,134fold
124,143fold
158,159fold
148,159fold
163,168fold
172,175fold
179,185fold
188,190fold
20,191fold
195,200fold
203,212fold
216,221fold
223,240fold
245,250fold
252,254fold
258,263fold
265,269fold
let &fdl = &fdl
let s:l = 51 - ((14 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 51
normal! 088|
wincmd w
argglobal
if bufexists(fnamemodify("~/.ideavimrc", ":p")) | buffer ~/.ideavimrc | else | edit ~/.ideavimrc | endif
if &buftype ==# 'terminal'
  silent file ~/.ideavimrc
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
let &fdl = &fdl
let s:l = 168 - ((37 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 168
normal! 038|
lcd /mnt/data/Proxectos/dotfiles
wincmd w
argglobal
if bufexists(fnamemodify("~/.tmux.conf", ":p")) | buffer ~/.tmux.conf | else | edit ~/.tmux.conf | endif
if &buftype ==# 'terminal'
  silent file ~/.tmux.conf
endif
balt /mnt/data/Proxectos/dotfiles/.vrapperrc
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 73 - ((5 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 73
normal! 027|
lcd /mnt/data/Proxectos/dotfiles
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 105 + 159) / 318)
exe 'vert 2resize ' . ((&columns * 106 + 159) / 318)
exe 'vert 3resize ' . ((&columns * 105 + 159) / 318)
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
