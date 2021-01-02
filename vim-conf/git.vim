let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap gj <plug>(signify-next-hunk)
nmap gk <plug>(signify-prev-hunk)
nmap gJ 9999<leader>gJ
nmap gK 9999<leader>gk

" Custom shortcuts
nmap <silent><LEADER>gs :Git status<CR>
nmap <silent><LEADER>gb :Git branch<CR>
nmap <silent><LEADER>gt :call GitCheckout()<CR>
nmap <silent><LEADER>ga :Git add<SPACE>.<CR>
nmap <silent><LEADER>gc :call GitCommit()<CR>
nmap <silent><LEADER>gh :Git push<CR>
nmap <silent><LEADER>gl :Git pull<CR>
nmap <silent><LEADER>gd :Git diff<CR>
nmap <silent><LEADER>go :Git log<CR>
nmap <silent><LEADER>gm :Git blame<CR>
nmap <silent><LEADER>gu :call GitUltimate()<CR>
nmap <silent><LEADER>gf :GV<CR>
nmap <silent><LEADER>gp :GV!<CR>

nmap <silent><LEADER>gv :SignifyToggleHighlight<CR>

" If you like colors instead
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

function! GitCommit()
  call inputsave()
  let message = input('Commit message: ')
  call inputrestore()
  execute(':Git commit -m "' . message . '"')
endfunction

function! GitUltimate()
  call inputsave()
  let message = input('Commit message: ')
  call inputrestore()
  execute(':Git add .')
  execute(':Git commit -m "' . message . '"')
  execute(':Git push')
endfunction

function! GitCheckout()
  call inputsave()
  let branch = input('Branch: ')
  call inputrestore()
  execute(':Git checkout '.branch)
endfunction
