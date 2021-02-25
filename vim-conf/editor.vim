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
nnoremap c; hf(ci(
nnoremap co hf{ci{
nnoremap cf hf[ci[
nnoremap cb hf<ci<
nnoremap c' hf'ci'
nnoremap c" hf"ci"
nnoremap ce hf`ci`

nnoremap m; hf(di(
nnoremap mo hf{di{
nnoremap mf hf[di[
nnoremap mb hf<di<
nnoremap m' hf'ci'
nnoremap m" hf"ci"
nnoremap me hf`ci`

nnoremap z; hf(vi(
nnoremap zo hf{vi{
nnoremap zf hf[vi[
nnoremap zb hf<vi<
nnoremap z' hf'ci'
nnoremap z" hf"ci"
nnoremap ze hf`ci`

nnoremap '; hf(vi(p
nnoremap 'o hf{vi{p
nnoremap 'f hf[vi[p
nnoremap 'b hf<vi<p
nnoremap '' hf'ci'
nnoremap '" hf"ci"
nnoremap 'e hf`ci`

" bracket modifications
nnoremap <LEADER>' hf`r'f`r'F'
nnoremap <LEADER>` hf'r`f'r`F`
nnoremap ) f)xF(x
nnoremap ] f]xF[x
nnoremap } f}hxxF{xx

" toggle upper/lower case
imap <A-u> <ESC>vbUea
imap <A-i> <ESC>vbuea

" jump in line configs
nnoremap gh ^
nnoremap gl $

" js auto convert ops
inoremap ,, ,<CR>
inoremap , ,<SPACE>
inoremap : :<SPACE>
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

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
