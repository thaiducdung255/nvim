local utils = require('_utils')

local map   = utils.map

DATA_PATH   = vim.fn.stdpath('data')
CACHE_PATH  = vim.fn.stdpath('cache')

map('nvo', 'k', 'i')
map('nvo', 'K', 'I')
map('vo', 'W', 'w')
map('vo', 'w', 'e')

map('nv', 'n', 'j')
map('nv', 'e', 'k')
map('nv', 'i', 'l')
