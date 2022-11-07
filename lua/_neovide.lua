local map      = require('_utils').map
local keycodes = require('_keymap').maximizer

if vim.g.neovide then
   vim.g.neovide_scroll_animation_length = 0.2
   vim.g.neovide_cursor_animation_length = 0.09
   vim.g.neovide_hide_mouse_when_typing  = true
   vim.g.neovide_refresh_rate_idle       = 5
   vim.g.neovide_refresh_rate            = 60
   vim.g.neovide_cursor_antialiasing     = true
   vim.cmd([[set guifont=FiraCode\ Nerd\ Font\ Mono:h12]])

   vim.g.maximizer_set_default_mapping = false
   map('n', keycodes.toggle_max, ':MaximizerToggle<CR>')

   -- local cmd = [[lua require'telescope'.extensions.repo.list{fd_opts={'--no-ignore-vcs'},search_dirs={'~/Projects','~/Downloads','~/.config'}}]]
   -- vim.cmd(cmd)
else
   require('_window_maximize')
end
