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

NOmap(Keycodes.hop.char1_line, ':HopChar1CurrentLine<CR>')
NOmap(Keycodes.hop.word, ':HopWord<CR>')
NOmap(Keycodes.hop.char2, ':HopChar2<CR>')
NOmap(Keycodes.hop.line, ':HopLine<CR>')
NOmap(Keycodes.hop.pattern, ':HopPattern<CR>')
-- Nmap(Keycodes.hop.word_line, word_line)
