local keycodes = {
   line   = ';;',
   vline  = 'go',
   block  = '*',
   vblock = '*',
}

local commentConf = require('Comment')
local commentFt = require('Comment.ft')

commentConf.setup({
   padding  = true,
   sticky   = true,
   ignore   = nil,
   toggler  = {
      line  = keycodes.line,
      block = keycodes.block,
   },
   opleader = {
      line  = keycodes.vline,
      block = keycodes.vblock,
   },
   mappings = {
      basic    = true,
      extra    = false,
      extended = false,
   },
})

commentFt.set('env', '#%s')
commentFt.set('http', '#%s')
