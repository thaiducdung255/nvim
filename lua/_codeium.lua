local keycodes = require('_keymap').codeium
local get_key_code = require('_utils').get_key_code
local map = require('_utils').map

map('i', keycodes.cycle_next, '<Plug>(codeium-next)')
map('i', keycodes.cycle_prev, '<Plug>(codeium-previous)')
map('i', keycodes.clear, '<Plug>(codeium-dismiss)')
vim.keymap.set('i', get_key_code(keycodes.accept), function() return vim.fn['codeium#Accept']() end, { expr = true })
