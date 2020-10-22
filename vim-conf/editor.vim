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
vnoremap [ da[]<ESC>hpl
vnoremap ( da()<ESC>hpl
vnoremap ' da''<ESC>hpl
vnoremap " da""<ESC>hpl
vnoremap ` da``<ESC>hpl
vnoremap { da{<SPACE><SPACE>}<ESC>hhpll
vnoremap $ da${}<ESC>hpl

" toggle upper/lower case
inoremap <A-u> <ESC>vb<S-u>A
inoremap <C-u> <ESC>vbuA

inoremap jj <ESC>la

" js auto convert ops
inoremap --<SPACE> <SPACE>-=<SPACE>1
inoremap ++<SPACE> <SPACE>+=<SPACE>1
inoremap ==<SPACE> <SPACE>===<SPACE>

" remap scroll configs
nnoremap <A-d> <C-d>
nnoremap <A-u> <C-u>

" other
inoremap $<SPACE> ${}<ESC>i
inoremap ,, ,<CR>
inoremap , ,<SPACE>
inoremap :: ()<SPACE>=><SPACE>
inoremap ; ;<CR>
nnoremap <silent><LEADER>wq :wq<CR>
nnoremap <silent><LEADER>s :w<CR>
nnoremap <silent><LEADER>q :q<CR>

nnoremap <LEADER>ecf :e ~/.config/nvim/vim-conf/
nnoremap <silent><LEADER>icf :e ~/.config/nvim/init.vim<CR>
nnoremap <silent><LEADER>rcf :source %<CR>

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
