local hydra = require('hydra')
local conf  = require('_hydra')
local cmd   = require('hydra.keymap-util').cmd

local hint  = [[
_e_ =
_c_ ,
_d_ .
_u_ _
_p_ *
_s_ < >
]]

hydra {
   name   = 'Easy Align',
   hint   = hint,
   config = conf.conf({ wait = true }),
   mode   = 'x',
   body   = 'a',
   heads  = {
      { 'e', cmd 'EasyAlign=', conf.head_conf() },
      { 'c', cmd 'EasyAlign,', conf.head_conf() },
      { 'd', cmd 'EasyAlign.', conf.head_conf() },
      { 'u', cmd 'EasyAlign_', conf.head_conf() },
      { 'p', cmd 'EasyAlign',  conf.head_conf() },
      { 's', cmd 'EasyAlign ', conf.head_conf() },
   }
}
