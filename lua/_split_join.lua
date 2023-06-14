local map      = require('_utils').map

local keycodes = {
   split = '<LEADER>cn',
   join  = '<LEADER>ce',
}

map('n', keycodes.join, ':SplitjoinJoin<CR>')
map('n', keycodes.split, ':SplitjoinSplit<CR>')
