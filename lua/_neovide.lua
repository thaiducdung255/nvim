local map      = require('_utils').map
local keycodes = require('_keymap')

if vim.g.neovide then
   vim.g.neovide_scroll_animation_length = 0.2
   vim.g.neovide_cursor_trail_size       = 0.2
   vim.g.neovide_cursor_animation_length = 0.07
   vim.g.neovide_hide_mouse_when_typing  = true
   vim.g.neovide_refresh_rate_idle       = 5
   vim.g.neovide_refresh_rate            = 60
   vim.g.neovide_cursor_antialiasing     = true
   vim.cmd([[set guifont=FiraCode\ Nerd\ Font\ Mono:h11.8]])

   vim.g.maximizer_set_default_mapping = false
   map('n', keycodes.maximizer.toggle_max, ':MaximizerToggle<CR>')
   map('n', keycodes.toggle_term.neovide_v_open, ':ToggleTerm direction=vertical<CR>')
else
   require('_window_maximize')
end
