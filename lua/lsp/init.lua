-- lsp sign diagnostic for nvim 0.6
local signs = { Error = '✕', Warn = '⚠', Hint = '', Info = '' }

for type, icon in pairs(signs) do
   local hl = 'DiagnosticSign' .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.cmd('nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>')
-- vim.cmd('nnoremap <silent> g. <cmd>lua vim.lsp.buf.hover()<CR>')
-- vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')
vim.cmd('nnoremap <silent> gR <cmd>lua vim.lsp.buf.rename()<CR>')
-- vim.cmd('nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>')
-- vim.cmd('nnoremap <silent> sH <cmd>lua vim.lsp.buf.signature_help()<CR>')
-- vim.cmd('nnoremap <silent> <Leader>fj <cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
-- vim.cmd('nnoremap <silent> <Leader>fk <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')

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
