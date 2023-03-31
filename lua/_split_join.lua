local map      = require('_utils').map
local keycodes = require('_keymap').split_join

map('n', keycodes.join, ':SplitjoinJoin<CR>')
map('n', keycodes.split, ':SplitjoinSplit<CR>')
