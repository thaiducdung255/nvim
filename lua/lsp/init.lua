local signs = { Error = "✕", Warn = "⚠", Hint = "", Info = "" }

for type, icon in pairs(signs) do
   local hl = "DiagnosticSign" .. type
   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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
