" window navigation configs
nnoremap <silent> <LEADER>h :wincmd h<CR>
nnoremap <silent> <LEADER>j :wincmd j<CR>
nnoremap <silent> <LEADER>k :wincmd k<CR>
nnoremap <silent> <LEADER>l :wincmd l<CR>

" window resize configs
nnoremap <silent> <C-h> :vertical resize -2<CR>
nnoremap <silent> <C-j> :resize -2<CR>
nnoremap <silent> <C-k> :resize +2<CR>
nnoremap <silent> <C-l> :vertical resize +2<CR>

" splits and tab create/close configs
nnoremap <silent> <LEADER>n :vsplit<CR>:wincmd l<CR>
nnoremap <silent> <LEADER>m :split<CR>:wincmd j<CR>
