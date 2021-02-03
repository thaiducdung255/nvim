" using system copy/paste shortcuts
vnoremap <C-v> "+p<ESC>
vnoremap <C-c> "+y<ESC>

" auto pair bracket fix
vnoremap [ di[]<ESC>hpf[
vnoremap $ di${}<ESC>hpf}
vnoremap ( di()<ESC>hpF(i
vnoremap ' di''<ESC>hpF'
vnoremap " di""<ESC>hpf"
vnoremap ` di``<ESC>hpf`
vnoremap { di{<SPACE><SPACE>}<ESC>hhpll

nnoremap <LEADER>' hf`r'f`r'F'
nnoremap <LEADER>` hf'r`f'r`F`
nnoremap ) f)xF(x
nnoremap ] f]xF[x
nnoremap } f}hxxF{xx

" toggle upper/lower case
imap <A-u> <ESC>vbUea
imap <A-i> <ESC>vbuea

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
nnoremap <S-y> y$

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
