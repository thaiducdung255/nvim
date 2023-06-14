local hop = require('hop')

hop.setup({
   multi_windows = true,
   case_insensitive = true,
})

-- custom highlights
vim.cmd('hi HopNextKey guifg=Red')
vim.cmd('hi HopNextKey1 guifg=Red')
vim.cmd('hi HopNextKey2 guifg=Red')
