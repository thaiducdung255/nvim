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

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
   '   (Text) ',
   '   (Method)',
   '   (Function)',
   '   (Constructor)',
   ' ﴲ  (Field)',
   '[] (Variable)',
   '   (Class)',
   ' ﰮ  (Interface)',
   '   (Module)',
   ' 襁 (Property)',
   '   (Unit)',
   '   (Value)',
   ' 練 (Enum)',
   '   (Keyword)',
   ' ﬌  (Snippet)',
   '   (Color)',
   '   (File)',
   '   (Reference)',
   '   (Folder)',
   '   (EnumMember)',
   ' ﲀ  (Constant)',
   ' ﳤ  (Struct)',
   '   (Event)',
   '   (Operator)',
   '   (TypeParameter)'
}

--[[ ' autoformat
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100) ]]
-- Java
-- autocmd FileType java nnoremap ca <Cmd>lua require('jdtls').code_action()<CR>

local function documentHighlight(client, bufnr)
   if client.resolved_capabilities.document_highlight then
      vim.api.nvim_exec(
         [[
            hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
            hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
            hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
            augroup lsp_document_highlight
               autocmd! * <buffer>
               autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
               autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
         ]],
         false
      )
   end
end

local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
   documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
   lsp_config.common_on_attach(client, bufnr)
   client.resolved_capabilities.document_formatting = false
end

return lsp_config
