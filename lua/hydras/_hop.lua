local hydra  = require('hydra')
local conf   = require('_hydra')
local hop    = require('hop')
local cmd    = require('hydra.keymap-util').cmd

local keymap = {
   body = 's',
}

local hint   = [[
---[Hop]---

_s_ word
_w_ Word
_f_ char
_l_ line
_._ any
_,_ char2

_n_ (
_N_ )
_e_ [
_E_ ]
_i_ {
_I_ }
_h_ <
_H_ >
_o_ '
_O_ "

_y_ yi
_c_ ci
_d_ di
_v_ si
_Y_ yo
_C_ co
_D_ do
_V_ so

_<cr>_ write
]]

local function custom_actions(action)
   local current_line = vim.api.nvim_get_current_line()
   local current_index = vim.api.nvim_win_get_cursor(0)[2] + 1
   local _cmd = 'normal ' .. action .. current_line:sub(current_index, current_index)
   vim.cmd(_cmd)
end

local function custom_hop(pattern)
   return hop.hint_patterns({ current_line_only = true }, pattern)
end

hydra {
   name   = 'Hop',
   hint   = hint,
   config = conf.conf(),
   mode   = 'n',
   body   = keymap.body,
   heads  = {
      { '<cr>', cmd 'write',                         conf.head_conf() },
      { 's',    cmd 'HopWordCurrentLine',            conf.head_conf() },
      { 'f',    cmd 'HopChar1CurrentLine',           conf.head_conf() },
      { 'w',    cmd 'HopWordMW',                     conf.head_conf() },
      { 'l',    cmd 'HopLineMW',                     conf.head_conf() },
      { ',',    cmd 'HopChar2MW',                    conf.head_conf() },
      { '.',    cmd 'HopPatternMW',                  conf.head_conf() },
      { 'n',    function() custom_hop('(') end,      conf.head_conf(false) },
      { 'N',    function() custom_hop(')') end,      conf.head_conf(false) },
      { 'e',    function() custom_hop('[') end,      conf.head_conf(false) },
      { 'E',    function() custom_hop(']') end,      conf.head_conf(false) },
      { 'i',    function() custom_hop('{') end,      conf.head_conf(false) },
      { 'I',    function() custom_hop('}') end,      conf.head_conf(false) },
      { 'h',    function() custom_hop('<') end,      conf.head_conf(false) },
      { 'H',    function() custom_hop('>') end,      conf.head_conf(false) },
      { 'o',    function() custom_hop('\'') end,     conf.head_conf(false) },
      { 'O',    function() custom_hop('"') end,      conf.head_conf(false) },
      { 'y',    function() custom_actions('yi') end, conf.head_conf() },
      { 'Y',    function() custom_actions('ya') end, conf.head_conf() },
      { 'c',    function() custom_actions('ci') end, conf.head_conf() },
      { 'C',    function() custom_actions('ca') end, conf.head_conf() },
      { 'd',    function() custom_actions('di') end, conf.head_conf() },
      { 'D',    function() custom_actions('da') end, conf.head_conf() },
      { 'v',    function() custom_actions('vi') end, conf.head_conf() },
      { 'V',    function() custom_actions('va') end, conf.head_conf() },
   }
}
