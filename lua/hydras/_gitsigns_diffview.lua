local hydra    = require('hydra')
local conf     = require('_hydra')
local cmd      = require('hydra.keymap-util').cmd
local gitsigns = require('gitsigns')


local keymap = {
   body = '<LEADER>g'
}

local hint   = [[
---[Git]---

_n_ n-hunk
_e_ p-hunk
_u_ reset
_U_ Reset
_s_ stage
_S_ Stage
_>_ m-zen
_._ preview
_<CR>_ Open
_<TAB>_ Log
]]

local config = conf.conf({ wait = true })

local function on_exit()
   gitsigns.toggle_linehl(false)
   gitsigns.toggle_deleted(false)
end

config['on_exit'] = on_exit

local function toggle_zen_mode()
   gitsigns.toggle_linehl()
   gitsigns.toggle_deleted()
end

hydra {
   name   = 'Git',
   hint   = hint,
   config = config,
   mode   = 'n',
   body   = keymap.body,
   heads  = {
      { 'n',     gitsigns.next_hunk,           conf.head_conf(false) },
      { 'e',     gitsigns.prev_hunk,           conf.head_conf(false) },
      { 'u',     gitsigns.reset_hunk,          conf.head_conf(false) },
      { 'U',     gitsigns.reset_buffer,        conf.head_conf() },
      { 's',     gitsigns.stage_hunk,          conf.head_conf(false) },
      { 'S',     gitsigns.stage_buffer,        conf.head_conf() },
      { '>',     toggle_zen_mode,              conf.head_conf(false) },
      { '.',     gitsigns.preview_hunk_inline, conf.head_conf(false) },
      { '<CR>',  cmd 'DiffviewOpen',           conf.head_conf() },
      { '<TAB>', cmd 'DiffviewFileHistory',    conf.head_conf() },
   }
}
