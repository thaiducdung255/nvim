" using system copy/paste shortcuts
vnoremap <C-v> "+p<ESC>
vnoremap <C-c> "+y<ESC>

" auto pair bracket fix
vnoremap [ di[]<ESC>hpf[
vnoremap ( di()<ESC>hpF(i
vnoremap ' di''<ESC>hpF'
vnoremap " di""<ESC>hpf"
vnoremap ` di``<ESC>hpf`
vnoremap { di{<SPACE><SPACE>}<ESC>hhpll

" brackets motions
nnoremap gj f(
nnoremap gk f[
nnoremap gl f{
nnoremap g; f'
nnoremap g: f"
nnoremap g' f`
nnoremap gh f<

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

nnoremap gJ f)
nnoremap gK f]
nnoremap gL f}
nnoremap gH f>

nnoremap cj f(ci(
nnoremap ck f[ci[
nnoremap cl f{ci{
nnoremap c; ci'
nnoremap c: ci"
nnoremap c' ci`
nnoremap ch f<ci<

nnoremap dj f(di(
nnoremap dk f[di[
nnoremap dl f{di{
nnoremap d; di'
nnoremap d: di"
nnoremap d' di`
nnoremap dh f<di<

nnoremap sj f(vi(
nnoremap sk f[vi[
nnoremap sl f{vi{
nnoremap s; vi'
nnoremap s: vi"
nnoremap s' vi`
nnoremap sh f<si<

" bracket modifications
nnoremap y' hf`r'f`r'F'
nnoremap y" hf'r`f'r`F`
nnoremap yj f)xF(x
nnoremap yk f]xF[x
nnoremap yl f}hxxF{xx

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

" other
inoremap jj <ESC>la
nnoremap <silent><LEADER>w :w<CR>
nnoremap <silent><LEADER>q :q<CR>

nnoremap <LEADER>ec :e ~/.config/nvim/vim-conf/
nnoremap <silent><LEADER>ei :e ~/.config/nvim/init.vim<CR>
nnoremap <silent><LEADER>es :w<CR>:source %<CR>

function! FindAndReplace()
  call inputsave()
  let originalText = input('Replace: ')
  call inputrestore()
  call inputsave()
  let finalText = input('By: ')
  call inputrestore()
  execute('%s/' . originalText . '/' . finalText . '/gc')
endfunction

nnoremap <silent><C-f> :call FindAndReplace()<CR>
