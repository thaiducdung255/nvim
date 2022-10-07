local map = require('_utils').map
local keycodes = require('_keymap').maximizer

map('n', keycodes.toggle_max, ':MaximizerToggle<CR>')
