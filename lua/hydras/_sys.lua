local hydra  = require('_hydra')
local cmd    = require('hydra.keymap-util').cmd

local keymap = {
   body = '<LEADER>w',
   heads = {
      ['v-shrink'] = { key = 'n', fn = cmd 'resize +2', exit = false },
      ['v-grow']   = { key = 'e', fn = cmd 'resize -2', exit = false },
      ['h-shrink'] = { key = 'h', fn = cmd 'vertical resize -2', exit = false },
      ['h-grow']   = { key = 'i', fn = cmd 'vertical resize +2', exit = false },
   }
}

hydra.create({
   name   = 'Win',
   keymap = keymap
})
