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
inoremap <C-u> <ESC>vb<S-u>A
inoremap <A-u> <ESC>vbuA

" auto pair bracket
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap ` ``<ESC>i
inoremap " ""<ESC>i
inoremap ,, ,<CR>
inoremap {<CR> {<CR>}<ESC>O

" scroll shortcut
nnoremap <silent> <S-j> :vertical +10<CR>
nnoremap <silent> <S-k> :vertical -10<CR>

" other
inoremap jj {<SPACE><SPACE>}<ESC>hi
inoremap kk <ESC>

nnoremap <LEADER>wq :wq<CR>
nnoremap <LEADER>s :w<CR>
nnoremap <LEADER>q :q<CR>

nnoremap <LEADER>ecf :e ~/.config/nvim/
nnoremap <LEADER>rcf :source %<CR>
