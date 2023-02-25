local keycodes = require('_keymap').codeium
local map = require('_utils').map

map('i', keycodes.cycle_next, '<Plug>(codeium-next)')
map('i', keycodes.cycle_prev, '<Plug>(codeium-previous)')
map('i', keycodes.clear, '<Plug>(codeium-dismiss)')
vim.keymap.set('i', keycodes.accept, function() return vim.fn['codeium#Accept']() end, { expr = true })
