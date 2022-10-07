local map = require('_utils').map
local keycodes = require('_keymap').lsp

local signs = { Error = '✕', Warn = '⚠', Hint = '', Info = '' }

for type, icon in pairs(signs) do
   local hl = 'DiagnosticSign' .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

map('n', keycodes.def_nav, vim.lsp.buf.definition)
map('n', keycodes.hover, vim.lsp.buf.hover)
map('n', keycodes.code_action, vim.lsp.buf.code_action)
map('n', keycodes.signature_help, vim.lsp.buf.signature_help)
-- map('n', 'gi', vim.buf.implementation)
map('n', keycodes.rename, vim.lsp.buf.rename)

-- lsp sign diagnostic for nvim 0.5
vim.fn.sign_define(
   'LspDiagnosticsSignError',
   { texthl = 'LspDiagnosticsSignError', text = '', numhl = 'LspDiagnosticsSignError' }
)

vim.fn.sign_define(
   'LspDiagnosticsSignWarning',
   { texthl = 'LspDiagnosticsSignWarning', text = '', numhl = 'LspDiagnosticsSignWarning' }
)

vim.fn.sign_define(
   'LspDiagnosticsSignHint',
   { texthl = 'LspDiagnosticsSignHint', text = '', numhl = 'LspDiagnosticsSignHint' }
)

vim.fn.sign_define(
   'LspDiagnosticsSignInformation',
   { texthl = 'LspDiagnosticsSignInformation', text = '', numhl = 'LspDiagnosticsSignInformation' }
)
