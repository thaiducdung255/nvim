local hydra  = require('_hydra')
local cmd    = require('hydra.keymap-util').cmd

local keymap = {
   body  = 'l',
   heads = {
      prompt       = { key = 'l', fn = cmd 'ChatGPT' },
      actAs        = { key = 'a', fn = cmd 'ChatGPTActAs' },
      completeCode = { key = 'f', fn = cmd 'ChatGPTCompleteCode' },
      run          = { key = 'r', fn = cmd 'ChatGPTRun' },
      edit         = { key = 'e', fn = cmd 'ChatGPTEditWithInstructions' },
   }
}

hydra.create({
   name = 'ChatGPT',
   keymap = keymap,
   conf = { timeout = 5000 }
})
