local hydra  = require('_hydra')
local cmd    = require('hydra.keymap-util').cmd

local keymap = {
   body = 'l',
   heads = {
      ['n-diag'] = { key = 'n', fn = vim.diagnostic.goto_next, exit = false },
      ['p-diag'] = { key = 'e', fn = vim.diagnostic.goto_prev, exit = false },
      impl       = { key = 'i', fn = cmd 'Glance implementations' },
      rename     = { key = 'r', fn = vim.lsp.buf.rename },
      ref        = { key = 'f', fn = cmd 'Glance references' },
      def        = { key = 'd', fn = cmd 'Glance definitions' },
      hover      = { key = 'h', fn = vim.lsp.buf.hover },
      sig        = { key = 's', fn = vim.lsp.buf.signature_help },
      help       = { key = 'c', fn = vim.lsp.buf.code_action },
   }
}

hydra.create({
   name = 'LSP',
   keymap = keymap,
})
