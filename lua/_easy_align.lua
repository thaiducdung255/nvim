local get_key_code = require('_utils').get_key_code
local keycodes = require('_keymap')

vim.cmd('xmap ' .. get_key_code(keycodes.easy_align.align) .. ' <Plug>(EasyAlign)')
vim.cmd('xmap ' .. get_key_code(keycodes.easy_align.eq_align) .. ' <Plug>(EasyAlign)=')
