let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
noremap <silent> <LEADER>gd :YcmCompleter GoTo<CR>
noremap <silent> <LEADER>gi :YcmCompleter GoTo<CR>
nnoremap <silent> <LEADER>gr :YcmCompleter GoToReferences<CR>
