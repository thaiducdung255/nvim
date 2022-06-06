local signs = { Error = '✕', Warn = '⚠', Hint = '', Info = '' }

for type, icon in pairs(signs) do
   local hl = 'DiagnosticSign' .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

Nmap(Keycodes.lsp.def_nav, vim.lsp.buf.definition)
Nmap(Keycodes.lsp.hover, vim.lsp.buf.hover)
Nmap(Keycodes.lsp.code_action, vim.lsp.buf.code_action)
Nmap(Keycodes.lsp.signature_help, vim.lsp.buf.signature_help)
-- Nmap('gi', vim.lsp.buf.implementation)
Nmap(Keycodes.lsp.rename, vim.lsp.buf.rename)

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
