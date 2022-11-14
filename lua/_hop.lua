local map = require('_utils').map
local keycodes = require('_keymap').hop

local hop = require('hop')

hop.setup({
   multi_windows = true,
   case_insensitive = true,
})

map('no', keycodes.char1_line, ':HopChar1CurrentLine<CR>')
map('no', keycodes.word, ':HopWordMW<CR>')
map('no', keycodes.char2, ':HopChar2MW<CR>')
map('no', keycodes.line, ':HopLineMW<CR>')
map('no', keycodes.word_line, ':HopWordCurrentLine<CR>')
map('no', keycodes.pattern, ':HopPatternMW<CR>')

-- custom highlights
vim.cmd('hi HopNextKey guifg=Red')
vim.cmd('hi HopNextKey1 guifg=Red')
vim.cmd('hi HopNextKey2 guifg=Red')
