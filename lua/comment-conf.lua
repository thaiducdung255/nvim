local commentConf = require('Comment')
local commentFt = require('Comment.ft')

commentConf.setup({
   padding = true,
   sticky = true,
   ignore = nil,
   toggler = {
      line = Get_key_code(Keycodes.comment.line),
   },
   opleader = {
      line = Get_key_code(Keycodes.comment.v_mode),
   },
   mappings = {
      basic = true,
   },
})

commentFt.set('env', '#%s')
commentFt.set('http', '#%s')
