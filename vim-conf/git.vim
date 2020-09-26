let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap <LEADER>gj <plug>(signify-next-hunk)
nmap <LEADER>gk <plug>(signify-prev-hunk)
nmap <LEADER>gJ 9999<leader>gJ
nmap <LEADER>gK 9999<leader>gk

" Custom shortcuts
nmap <LEADER>gad :Git add<SPACE>.<CR>
nmap <LEADER>gco :Git commit<SPACE>-m<SPACE>
nmap <LEADER>gps :Git push<CR>
nmap <LEADER>gpl :Git pull<CR>
nmap <LEADER>gdi :Git diff<CR>
nmap <LEADER>glo :Git log<CR>
nmap <LEADER>gbl :Git blame<CR>

nmap <LEADER>gvf :GV<CR>
nmap <LEADER>gva :GV!<CR>

nmap <LEADER>gh :SignifyToggleHighlight<CR>

" If you like colors instead
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00
