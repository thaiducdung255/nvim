local hydra  = require('hydra')
local conf   = require('_hydra')
local cmd    = require('hydra.keymap-util').cmd

local keymap = {
   body = '<LEADER>p',
}


local hint = [[
---[Plug]---

_i_ intall
_s_ sync
_u_ update
_c_ clean
]]

hydra {
   name   = 'Packer',
   hint   = hint,
   config = conf.conf(),
   mode   = 'n',
   body   = keymap.body,
   heads  = {
      { 'i', cmd 'PackerInstall', conf.head_conf() },
      { 's', cmd 'PackerSync',    conf.head_conf() },
      { 'u', cmd 'PackerUpdate',  conf.head_conf() },
      { 'c', cmd 'PackerClean',   conf.head_conf() },
   }
}
