local hydra    = require('hydra')
local conf     = require('_hydra')
local cmd      = require('hydra.keymap-util').cmd

local lsp_hint = [[
---[Lsp]---

_n_ n-diag
_e_ p-diag
_i_ impl
_r_ rename
_f_ ref
_d_ def
_h_ hover
_s_ sig
_c_ help
]]

hydra {
   name   = 'LSP',
   hint   = lsp_hint,
   config = conf.conf(),
   mode   = 'n',
   body   = 'l',
   heads  = {
      { 'n', vim.diagnostic.goto_next,     conf.head_conf(false) },
      { 'e', vim.diagnostic.goto_prev,     conf.head_conf(false) },
      { 'r', vim.lsp.buf.rename,           conf.head_conf() },
      { 'h', vim.lsp.buf.hover,            conf.head_conf() },
      { 's', vim.lsp.buf.signature_help,   conf.head_conf() },
      { 'c', vim.lsp.buf.code_action,      conf.head_conf() },
      { 'i', cmd 'Glance implementations', conf.head_conf() },
      { 'f', cmd 'Glance references',      conf.head_conf() },
      { 'd', cmd 'Glance definitions',     conf.head_conf() },
   }
}
