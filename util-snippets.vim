let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

nnoremap <silent> <LEADER>prt :set modifiable<CR>3dd:%!python -m json.tool<CR>
nnoremap <silent> <LEADER>une :UltiSnipsEdit<CR>
