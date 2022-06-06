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

Nmap(Keycodes.hop.char1_line, ':HopChar1CurrentLine<CR>')
Nmap(Keycodes.hop.word, ':HopWord<CR>')
Nmap(Keycodes.hop.char2, ':HopChar2<CR>')
Nvmap(Keycodes.hop.line, ':HopLine<CR>')
Nvmap(Keycodes.hop.pattern, ':HopPattern<CR>')
-- Nmap(Keycodes.hop.word_line, word_line)
