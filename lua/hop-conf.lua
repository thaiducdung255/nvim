local map = require('utils').map
local keycodes = require('keymap')

local hop = require('hop')

hop.setup({
   multi_windows = true,
   keys = 'arstdhneioqwfpluy'
})

map('no', keycodes.hop.char1_line, ':HopChar1CurrentLine<CR>')
map('no', keycodes.hop.word, ':HopWordMW<CR>')
map('no', keycodes.hop.char2, ':HopChar2MW<CR>')
map('no', keycodes.hop.line, ':HopLineMW<CR>')
map('no', keycodes.hop.word_line, ':HopWordCurrentLine<CR>')
map('no', keycodes.hop.pattern, ':HopPatternMW<CR>')

-- custom highlights
vim.cmd('hi HopNextKey guifg=Red')
vim.cmd('hi HopNextKey1 guifg=Red')
vim.cmd('hi HopNextKey2 guifg=Red')
