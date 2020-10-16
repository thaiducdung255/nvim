" window navigation configs
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent> <A-j> :wincmd j<CR>
nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-l> :wincmd l<CR>

" window resize configs
nnoremap <silent> <C-h> :vertical resize -2<CR>
nnoremap <silent> <C-j> :resize -2<CR>
nnoremap <silent> <C-k> :resize +2<CR>
nnoremap <silent> <C-l> :vertical resize +2<CR>

" splits and tab create/close configs
nnoremap <silent> <A-p> :vsplit<CR>:wincmd l<CR>
nnoremap <silent> <A-o> :split<CR>:wincmd j<CR>

" maximize window
nnoremap <silent> <LEADER>wm <C-w>_<C-w>\|
nnoremap <silent> <LEADER>wn <C-w>=
