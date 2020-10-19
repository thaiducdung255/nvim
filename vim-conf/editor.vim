" navigation shortcuts
inoremap <C-a> <ESC>A
inoremap <C-l> <ESC>la
inoremap <C-j> <ESC>ja
inoremap <C-k> <ESC>ka
inoremap <C-h> <ESC>i
inoremap <C-e> <ESC>ea
inoremap <C-b> <ESC>bi

" using system copy/paste shortcuts
vnoremap <C-V> "+p<ESC>
vnoremap <C-C> "+y<ESC>

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

" auto pair bracket
inoremap jj <ESC>la
inoremap ; ;<CR>
inoremap :: ()<SPACE>=><SPACE>
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap ` ``<ESC>i
inoremap " ""<ESC>i
inoremap ,, ,<CR>
inoremap {<CR> {<CR>}<ESC>O

" scroll shortcut
" nnoremap <silent> <A-j> :vertical +10<CR>
" nnoremap <silent> <A-k> :vertical -10<CR>

" other
nnoremap <LEADER>wq :wq<CR>
nnoremap <LEADER>s :w<CR>
nnoremap <LEADER>q :q<CR>

nnoremap <LEADER>ecf :e ~/.config/nvim/vim-conf/
nnoremap <LEADER>icf :e ~/.config/nvim/init.vim<CR>
nnoremap <LEADER>rcf :source %<CR>

function! FindAndReplace()
  call inputsave()
  let originalText = input('Replace: ')
  call inputrestore()
  call inputsave()
  let finalText = input('By: ')
  call inputrestore()
  execute('%s/' . originalText . '/' . finalText . '/gc')
endfunction

nnoremap <C-f> :call FindAndReplace()<CR>
