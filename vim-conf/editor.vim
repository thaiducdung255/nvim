" navigation shortcuts
inoremap <C-a> <ESC>A
inoremap <C-l> <ESC>la
inoremap <C-j> <ESC>ja
inoremap <C-k> <ESC>ka
inoremap <C-h> <ESC>i
inoremap <C-e> <ESC>ea
inoremap <C-b> <ESC>bi

" using system copy/paste shortcuts
vnoremap <C-v> "+p<ESC>
vnoremap <C-c> "+y<ESC>

" auto pair bracket fix
vnoremap [ di[]<ESC>hpl
vnoremap ( di()<ESC>hpl
vnoremap ' di''<ESC>hpl
vnoremap " di""<ESC>hpl
vnoremap ` di``<ESC>hpl
vnoremap { di{<SPACE><SPACE>}<ESC>hhpll

" toggle upper/lower case
inoremap <A-u> <ESC>vb<S-u>A
inoremap <C-u> <ESC>vbuA

" js auto convert ops
inoremap --<SPACE> <SPACE>-=<SPACE>1
inoremap ++<SPACE> <SPACE>+=<SPACE>1
inoremap ==<SPACE> <SPACE>===<SPACE>
inoremap ,, ,<CR>
inoremap , ,<SPACE>

" edit visual mode behavior
nnoremap  <A-v> v$h
nnoremap <S-y> y$

" remap scroll configs
nnoremap <A-d> <C-d>
nnoremap <A-u> <C-u>

" back to prev line
nnoremap gn <C-o>
nnoremap gm <C-i>

" other
inoremap jj <ESC>la
nnoremap <silent><LEADER>wq :wq<CR>
nnoremap <silent><LEADER>s :w<CR>
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
