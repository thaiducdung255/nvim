local get_key_code = require('_utils').get_key_code
local keycodes = require('_keymap').easy_align

vim.cmd('xmap ' .. get_key_code(keycodes.align) .. ' <Plug>(EasyAlign)')
vim.cmd('xmap ' .. get_key_code(keycodes.eq_align) .. ' <Plug>(EasyAlign)=')
