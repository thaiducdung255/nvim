local lspconfig = require 'lspconfig'
local lsp_signature = require('lsp_signature')

local signature_conf = {
   use_lspsaga     = true,
   bind            = true,
   hint_enable     = true,
   floating_window = false,
   fix_pos         = true,
   hint_prefix     = '  ',
   hint_scheme     = 'TSField',
   handle_opts = {
      border = 'single'
   },
}
-- local log = require('vim.lsp.log')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- vim.lsp.set_log_level('debug')
-- log.set_format_func(vim.inspect)

vim.lsp.handlers['textDocument/publishDiagnostics'] =
   vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics,
   {
      underline = false,
      update_in_insert = false
   }
)

local function set_buf_keymap(bufnr, mode, lhs, rhs)
   vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, {noremap = true, silent = true})
end

local function set_lsp_config(client, bufnr)
   vim.cmd [[setlocal signcolumn=yes]]

   vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

   if client.resolved_capabilities.document_formatting then
      vim.cmd [[command! -buffer Fmt lua vim.lsp.buf.formatting_sync(nil, 1000)]]
      vim.cmd [[augroup LspFormatOnSave]]
      vim.cmd [[   autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]]
      vim.cmd [[augroup END]]
   end

   if client.resolved_capabilities.signature_help then
      set_buf_keymap(bufnr, 'i', 'HH', [[<C-o>:lua vim.lsp.buf.signature_help()<CR>]])
   end
end

local function isEslintrcFound()
   if vim.fn.filereadable('./.eslintrc.json') == 1 then
      return true
   end

   if vim.fn.filereadable('./.eslintrc.js') == 1 then
      return true
   end

   if vim.fn.filereadable('./.eslintrc.yaml') == 1 then
      return true
   end

   return false
end

lspconfig.tsserver.setup {
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = not isEslintrcFound()
      set_lsp_config(client, bufnr)
      lsp_signature.on_attach(signature_conf, bufnr)
   end
}

lspconfig.gopls.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
      lsp_signature.on_attach(signature_conf, bufnr)
   end
}

local system_name
if vim.fn.has('mac') == 1 then
  system_name = 'macOS'
elseif vim.fn.has('unix') == 1 then
  system_name = 'Linux'
elseif vim.fn.has('win32') == 1 then
  system_name = 'Windows'
else
  print('Unsupported system for sumneko')
end

local sumneko_root_path = '/home/df/Apps/lua-language-server'
local sumneko_binary = sumneko_root_path..'/bin/'..system_name..'/lua-language-server'

lspconfig.sumneko_lua.setup {
   cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
      lsp_signature.on_attach(signature_conf, bufnr)
   end
}

lspconfig.pyright.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
      lsp_signature.on_attach(signature_conf, bufnr)
   end
}

lspconfig.bashls.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
      lsp_signature.on_attach(signature_conf, bufnr)
   end
}

lspconfig.jsonls.setup {
   cmd = { 'vscode-json-languageserver', '--stdio' },
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.dockerls.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.vimls.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
      lsp_signature.on_attach(signature_conf, bufnr)
   end
}

function _G.eslintFixAll()
   if isEslintrcFound() then
      vim.cmd('EslintFixAll')
      return vim.cmd('call timer_start(200, { tid -> execute(\'write\')})')
   end

   return vim.cmd('write')
end

lspconfig.eslint.setup {}

Nmap('ss', ':lua eslintFixAll()<CR>')
