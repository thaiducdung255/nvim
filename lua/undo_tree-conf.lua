local map = require('utils').map
local keycodes = require('keymap')

map('n', keycodes.undo_tree.show, ':UndotreeShow<CR>')
