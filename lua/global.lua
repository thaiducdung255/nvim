local utils = require('utils')

local map = utils.map
local keyboard_layout = utils.keyboard_layout

DATA_PATH  = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

if keyboard_layout == 'colemak' then
   map('nvo', 'k', 'i')
   map('nvo', 'K', 'I')
   map('nvo', 'W', 'w')
   map('nvo', 'w', 'e')

   map('nv', 'n', 'j')
   map('nv', 'e', 'k')
   map('nv', 'i', 'l')
end
