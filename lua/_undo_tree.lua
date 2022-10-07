local map = require('_utils').map
local keycodes = require('_keymap').undo_tree

map('n', keycodes.show, ':UndotreeShow<CR>')
