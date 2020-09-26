if executable('rg')
  let g:rg_derive_root='true'
endif

noremap <silent> <LEADER>pv :wincmd v<BAR> :Ex <BAR> :vertical resize 30<CR>
nnoremap <LEADER>u :UndotreeShow<CR>
nnoremap <LEADER>ps :Rg<SPACE>
