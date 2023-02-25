local keycodes = require('_keymap').easy_align

vim.cmd('xmap ' .. keycodes.align .. ' <Plug>(EasyAlign)')
vim.cmd('xmap ' .. keycodes.eq_align .. ' <Plug>(EasyAlign)=')
