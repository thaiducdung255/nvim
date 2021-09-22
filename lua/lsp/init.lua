-- TODO figure out why this don't work
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

vim.cmd('nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>')
vim.cmd('nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>')
vim.cmd('nnoremap <silent> ca :Lspsaga code_action<CR>')
vim.cmd('nnoremap <silent> gR :Lspsaga rename<CR>')
vim.cmd('nnoremap <silent> g. :Lspsaga hover_doc<CR>')
vim.cmd('nnoremap <silent> dp :Lspsaga preview_definition<CR>')
vim.cmd('nnoremap <silent> <Leader>fj :Lspsaga diagnostic_jump_next<CR>')
vim.cmd('nnoremap <silent> <Leader>fk :Lspsaga diagnostic_jump_prev<CR>')
vim.cmd('nnoremap <silent> sH  :Lspsaga signature_help<CR>')
vim.cmd('nnoremap <silent> N <cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
vim.cmd('nnoremap <silent> M <cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')
