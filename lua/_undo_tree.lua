local map = require('_utils').map
local keycodes = require('_keymap')

map('n', keycodes.undo_tree.show, ':UndotreeShow<CR>')
