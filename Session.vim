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
badd +30 ~/.ideavimrc
badd +60 ~/.tmux.conf
badd +1 /mnt/data/Proxectos/dotfiles/.vrapperrc
badd +1 lua/mappings.lua
badd +1 /mnt/data/Proxectos/dev/projects
badd +1 /mnt/data/Proxectos/dotfiles/aui_aliases.sh
badd +25 /mnt/data/Proxectos/dotfiles/aliases
badd +81 /mnt/data/Proxectos/dotfiles/.zshrc
argglobal
%argdel
edit lua/mappings.lua
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
exe 'vert 1resize ' . ((&columns * 157 + 159) / 318)
exe 'vert 2resize ' . ((&columns * 160 + 159) / 318)
argglobal
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
96,111fold
114,121fold
131,134fold
135,138fold
124,148fold
162,165fold
151,166fold
169,177fold
180,184fold
187,193fold
195,198fold
21,199fold
202,208fold
210,220fold
223,229fold
230,253fold
256,262fold
263,266fold
269,275fold
276,281fold
let &fdl = &fdl
let s:l = 64 - ((26 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 64
normal! 01|
wincmd w
argglobal
if bufexists(fnamemodify("/mnt/data/Proxectos/dotfiles/.zshrc", ":p")) | buffer /mnt/data/Proxectos/dotfiles/.zshrc | else | edit /mnt/data/Proxectos/dotfiles/.zshrc | endif
if &buftype ==# 'terminal'
  silent file /mnt/data/Proxectos/dotfiles/.zshrc
endif
balt /mnt/data/Proxectos/dotfiles/aliases
setlocal fdm=manual
setlocal fde=nvim_treesitter#foldexpr()
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
4,5fold
102,107fold
131,132fold
135,137fold
156,157fold
159,160fold
161,162fold
158,163fold
let &fdl = &fdl
let s:l = 81 - ((33 * winheight(0) + 34) / 69)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 81
normal! 0
lcd /mnt/data/Proxectos/dotfiles
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 157 + 159) / 318)
exe 'vert 2resize ' . ((&columns * 160 + 159) / 318)
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
