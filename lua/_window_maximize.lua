local map = require('_utils').map
local keycodes = require('_keymap').maximizer

require('windows').setup({
   autowidth = {
      enable = false,
      winwidth = 1,
      filetype = {},
   },
   animation = {
      enable = true,
      duration = 200,
      fps = 60,
      easing = 'in_out_sine',
   }
})

map('n', keycodes.toggle_max, ':WindowsMaximize<CR>')
map('n', keycodes.toggle_max_vertical, ':WindowsMaximizeVertically<CR>')
