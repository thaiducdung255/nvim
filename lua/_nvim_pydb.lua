local map      = require('_utils').map

local keycodes = {
   show_connections  = '<LEADER>db',
   show_query_window = '<LEADER>dq'
}

map('n', keycodes.show_connections, ':VDToggleDatabase<CR>')
map('n', keycodes.show_query_window, ':VDToggleQuery<CR>')
