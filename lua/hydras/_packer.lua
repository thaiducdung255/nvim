local hydra  = require('_hydra')
local cmd    = require('hydra.keymap-util').cmd

local keymap = {
   body = '<LEADER>p',
   heads = {
      install = { key = 'i', fn = cmd 'PackerInstall' },
      sync    = { key = 's', fn = cmd 'PackerSync' },
      update  = { key = 'u', fn = cmd 'PackerUpdate' },
      clean   = { key = 'c', fn = cmd 'PackerClean' },
   }
}


hydra.create({
   name   = 'Ext',
   keymap = keymap,
})
