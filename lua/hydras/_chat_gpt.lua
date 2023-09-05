local hydra  = require('_hydra')
local cmd    = require('hydra.keymap-util').cmd

local keymap = {
   body  = 'l',
   heads = {
      prompt            = { key = 'l', fn = cmd 'ChatGPT' },
      ['act-as']        = { key = 'a', fn = cmd 'ChatGPTActAs' },
      ['complete-code'] = { key = 'f', fn = cmd 'ChatGPTCompleteCode' },
      edit              = { key = 'e', fn = cmd 'ChatGPTEditWithInstructions' },
      test              = { key = 't', fn = cmd 'ChatGPTRun add_tests' },
      optimize          = { key = 'o', fn = cmd 'ChatGPTRun optimize_code' },
      readability       = { key = 'r', fn = cmd 'ChatGPTRun code_readability_analysis' },
      ['code-lens']     = { key = 'c', fn = cmd 'ChatGPTRun fix_bugs' },
      summarize         = { key = 's', fn = cmd 'ChatGPTRun summarize' },
   }
}

hydra.create({
   name = 'ChatGPT',
   keymap = keymap,
   conf = { timeout = 5000 }
})
