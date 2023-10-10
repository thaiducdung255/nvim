local map                            = require('_utils').map

vim.g.db_ui_force_echo_notifications = true
vim.db_ui_use_nerd_fonts             = true
vim.db_ui_icons                      = true
vim.db_ui_show_database_icon         = true

local keycodes                       = {
   show_connections = '<LEADER>db',
}

map('n', keycodes.show_connections, ':DBUI<CR>')
