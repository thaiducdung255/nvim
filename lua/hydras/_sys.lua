local hydra       = require('hydra')
local conf        = require('_hydra')
local cmd         = require('hydra.keymap-util').cmd

local keymap      = {
   body = '<LEADER>w'
}

local window_hint = [[
---[Win]---

_n_ v-shrink
_e_ v-grow
_i_ h-grow
_h_ h-shrink
]]

hydra {
   name   = 'Window',
   hint   = window_hint,
   config = conf.conf(),
   mode   = 'n',
   body   = keymap.body,
   heads  = {
      { 'n', cmd 'resize +2',          conf.head_conf(false) },
      { 'e', cmd 'resize -2',          conf.head_conf(false) },
      { 'i', cmd 'vertical resize -2', conf.head_conf(false) },
      { 'h', cmd 'vertical resize +2', conf.head_conf(false) },
   }
}
