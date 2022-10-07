local get_key_code = require('_utils').get_key_code
local keycodes = require('_keymap').comment

local commentConf = require('Comment')
local commentFt = require('Comment.ft')

commentConf.setup({
   padding  = true,
   sticky   = true,
   ignore   = nil,
   toggler  = {
      line = get_key_code(keycodes.line),
      block = get_key_code(keycodes.block),
   },
   opleader = {
      line = get_key_code(keycodes.vline),
      block = get_key_code(keycodes.vblock),
   },
   mappings = {
      basic = true,
      extended = false,
      extra = false
   },
})

commentFt.set('env', '#%s')
commentFt.set('http', '#%s')
