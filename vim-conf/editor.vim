" using system copy/paste shortcuts
vnoremap <C-v> "+p<ESC>
vnoremap <C-c> "+y<ESC>

" auto pair bracket fix
vnoremap sk di[]<ESC>hpf[
vnoremap sj di()<ESC>hpF(i
vnoremap s; di''<ESC>hpF'
vnoremap s: di""<ESC>hpf"
vnoremap s' di``<ESC>hpf`
vnoremap sl di{<SPACE><SPACE>}<ESC>hhpll
vnoremap sh di<><ESC>hpf<

" brackets motions
" go to brackets
nnoremap gj f(
nnoremap gk f[
nnoremap gl f{
nnoremap g; f'
nnoremap g: f"
nnoremap g' f`
nnoremap gh f<

nnoremap gJ f)
nnoremap gK f]
nnoremap gL f}
nnoremap gH f>

" edit bracket motions with t/T
nnoremap zj ct)
nnoremap zk ct]
nnoremap zl ct}
nnoremap z; ct'
nnoremap z: ct"
nnoremap z' ct`
nnoremap zh ct>

nnoremap zJ cT(
nnoremap zK cT[
nnoremap zL cT{
nnoremap zH cT<

" edit inside brackets
nnoremap cj f(ci(
nnoremap ck f[ci[
nnoremap cl f{ci{
nnoremap c; ci'
nnoremap c: ci"
nnoremap c' ci`
nnoremap ch f<ci<

" delete inside brackets
nnoremap dj f(di(
nnoremap dk f[di[
nnoremap dl f{di{
nnoremap d; di'
nnoremap d: di"
nnoremap d' di`
nnoremap dh f<di<

" select inside brackets
nnoremap sj f(vi(
nnoremap sk f[vi[
nnoremap sl f{vi{
nnoremap s; vi'
nnoremap s: vi"
nnoremap s' vi`
nnoremap sh f<si<

" brackets "/` modifications
nnoremap :; f`r'f`r'F'
nnoremap :' f'r`f'r`F`
nnoremap '; f'xf'x
nnoremap ': f"xf"x
nnoremap '' f`xf`x
nnoremap 'j f)xF(x
nnoremap 'k f]xF[x
nnoremap 'l f}hxxF{xx
nnoremap 'h f>xF<x

" toggle upper/lower case
inoremap <C-z> <ESC>vbUea
inoremap <C-x> <ESC>vbuea
inoremap <C-c> <ESC>b~ea

" jump in line configs
nnoremap ga ^
nnoremap gf $

vnoremap ga ^
vnoremap gf $

" edit visual mode behavior
nnoremap <LEADER>v v$h
nnoremap <LEADER>y y$

" remap scroll configs
nnoremap N <C-d>
nnoremap M <C-u>

" prev/next position nav
nnoremap gn <C-o>
nnoremap gm <C-i>

" remap redo command
nnoremap U <C-r>

" other
inoremap kk <ESC>la
inoremap jj <ESC>i
nnoremap <silent><LEADER>w :w<CR>
nnoremap <silent><LEADER>q :q<CR>
nnoremap <silent><LEADER>Q :q!<CR>

nnoremap <LEADER>ec :e ~/.config/nvim/vim-conf/
nnoremap <silent><LEADER>ei :e ~/.config/nvim/init.vim<CR>
nnoremap <silent><LEADER>es :w<CR>:source %<CR>

function! s:findAndReplace()
  call inputsave()
  let originalText = input('Replace: ')
  call inputrestore()
  call inputsave()
  let finalText = input('By: ')
  call inputrestore()
  execute('%s/' . originalText . '/' . finalText . '/gc')
endfunction

command! Frr call <SID>findAndReplace()
