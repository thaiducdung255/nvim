local hop = require('hop')

hop.setup({
   multi_windows    = true,
   uppercase_labels = true,
   keys             = 'arstdhneioqwfpluy;zxcvkm,.',
})

-- custom highlights
vim.cmd('hi HopNextKey guifg=Red')
vim.cmd('hi HopNextKey1 guifg=Red')
vim.cmd('hi HopNextKey2 guifg=Red')
