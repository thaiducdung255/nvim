local keycodes = require('_keymap').codeium
local get_key_code = require('_utils').get_key_code
local map = require('_utils').map

map('i', keycodes.cycle_next, function() return vim.fn['codeium#CycleCompletions'](1) end)
map('i', keycodes.cycle_prev, function() return vim.fn['codeium#CycleCompletions'](-1) end)
map('i', keycodes.clear, function() return vim.fn['codeium#Clear']() end)
vim.keymap.set('i', get_key_code(keycodes.accept), function() return vim.fn['codeium#Accept']() end, { expr = true })
