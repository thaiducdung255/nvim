let g:signify_sign_add='+'
let g:signify_sign_delete='_'
let g:signify_sign_delete_first_line='‾'
let g:signify_sign_change='~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1

" Jump though hunks
nmap gj <plug>(signify-next-hunk)
nmap gk <plug>(signify-prev-hunk)
nmap gJ 9999<leader>gJ
nmap gK 9999<leader>gk

" Custom shortcuts
nnoremap <silent><LEADER>gs :Git status<CR>
nnoremap <silent><LEADER>gb :Git branch<CR>
nnoremap <silent><LEADER>gt :call GitCheckout()<CR>
nnoremap <silent><LEADER>ga :Git add<SPACE>.<CR>
nnoremap <silent><LEADER>gc :call GitCommit()<CR>
nnoremap <silent><LEADER>gh :Git push<CR>
nnoremap <silent><LEADER>gl :Git pull<CR>
nnoremap <silent><LEADER>gd :Git diff<CR>
nnoremap <silent><LEADER>go :Git log<CR>
nnoremap <silent><LEADER>gm :Git blame<CR>
nnoremap <silent><LEADER>gu :call GitUltimate()<CR>
nnoremap <silent><LEADER>gf :GV<CR>
nnoremap <silent><LEADER>gp :GV!<CR>

nnoremap <silent><LEADER>gv :SignifyToggleHighlight<CR>

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
