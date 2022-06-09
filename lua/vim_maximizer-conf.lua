local map = require('utils').map
local keycodes = require('keymap')

map('n', keycodes.maximizer.toggle_max, ':MaximizerToggle<CR>')
