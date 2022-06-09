local map = require('utils').map
local keycodes = require('keymap')

local hop = require('hop')

hop.setup({
   multi_windows = true,
   keys = 'arstdhneioqwfpluy'
})

local function word_line()
   return hop.hint_char2(
      {
         current_line_only = true,
         inclusive_jump = true
      }
   )
end

map('no', keycodes.hop.char1_line, ':HopChar1CurrentLine<CR>')
map('no', keycodes.hop.word, ':HopWord<CR>')
map('no', keycodes.hop.char2, ':HopChar2<CR>')
map('no', keycodes.hop.line, ':HopLine<CR>')
map('no', keycodes.hop.pattern, ':HopPattern<CR>')
-- Nmap('no', keycodes.hop.word_line, word_line)
