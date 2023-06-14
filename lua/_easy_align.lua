local keycodes = {
   eq_align = 'ae',
   align    = 'aa',
}

vim.cmd('xmap ' .. keycodes.align .. ' <Plug>(EasyAlign)')
vim.cmd('xmap ' .. keycodes.eq_align .. ' <Plug>(EasyAlign)=')
