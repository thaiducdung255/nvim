local get_key_code = require('utils').get_key_code
local keycodes = require('keymap')

local commentConf = require('Comment')
local commentFt = require('Comment.ft')

commentConf.setup({
   padding  = true,
   sticky   = true,
   ignore   = nil,
   toggler  = {
      line = get_key_code(keycodes.comment.line),
      block = get_key_code(keycodes.comment.block),
   },
   opleader = {
      line = get_key_code(keycodes.comment.vline),
      block = get_key_code(keycodes.comment.vblock),
   },
   mappings = {
      basic = true,
      extended = false,
      extra = false
   },
})

commentFt.set('env', '#%s')
commentFt.set('http', '#%s')
