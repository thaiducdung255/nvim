local commentConf = require('Comment')
local commentFt = require('Comment.ft')

commentConf.setup({
   padding = true,
   sticky = true,
   ignore = nil,
   toggler = {
      line = ';;',
   },
   opleader = {
      line = 'zz'
   },
   mappings = {
      basic = true,
   }
})

commentFt.set('env', '#%s')
commentFt.set('http', '#%s')
