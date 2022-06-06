local commentConf = require('Comment')
local commentFt = require('Comment.ft')

commentConf.setup({
   padding  = true,
   sticky   = true,
   ignore   = nil,
   toggler  = {
      line = Get_key_code(Keycodes.comment.line),
      block = Get_key_code(Keycodes.comment.block),
   },
   opleader = {
      line = Get_key_code(Keycodes.comment.vline),
      block = Get_key_code(Keycodes.comment.vblock),
   },
   mappings = {
      basic = true,
      extended = false,
      extra = false
   },
})

commentFt.set('env', '#%s')
commentFt.set('http', '#%s')
