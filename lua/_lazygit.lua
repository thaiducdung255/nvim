local map = require('_utils').map
local keycodes = require('_keymap')

vim.g.lazygit_floating_window_winblend       = 0
vim.g.lazygit_floating_window_scaling_factor = 0.92
vim.g.lazygit_floating_window_corner_chars   = { '╭', '╮', '╰', '╯' }
vim.g.lazygit_floating_window_use_plenary    = 1
vim.g.lazygit_use_neovim_remote              = 1

map('n', keycodes.lazy_git.exec, ':LazyGit<CR>')