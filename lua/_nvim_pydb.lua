local map      = require('_utils').map
local keycodes = require('_keymap').nvim_pydb

map('n', keycodes.show_connections, ':VDToggleDatabase<CR>')
map('n', keycodes.show_query_window, ':VDToggleQuery<CR>')
