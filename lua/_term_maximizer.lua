local map = require('_utils').map
local keycodes = require('_keymap')

map('n', keycodes.maximizer.toggle_max, ':MaximizerToggle<CR>')
