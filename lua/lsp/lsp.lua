local lspconfig = require 'lspconfig'

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

local function set_lsp_config(client, bufnr)
   vim.cmd [[setlocal signcolumn=yes]]

   vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

   if client.resolved_capabilities.document_formatting then
      vim.cmd [[command! -buffer Fmt lua vim.lsp.buf.formatting_sync(nil, 1000)]]
      vim.cmd [[augroup LspFormatOnSave]]
      vim.cmd [[   autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]]
      vim.cmd [[augroup END]]
   end
end

vim.api.nvim_create_autocmd(
   'BufWritePre',
   {
      pattern = '*.tsx,*.ts,*.jsx,*.js',

      callback = function()
         vim.cmd[[EslintFixAll]]
      end
   }
)

local function isEslintrcFound()
   local is_json_file_found = vim.fn.filereadable('./.eslintrc.json') == 1
   local is_js_file_found = vim.fn.filereadable('./.eslintrc.js') == 1
   local is_yml_file_found = vim.fn.filereadable('./.eslintrc.yml') == 1

   if is_json_file_found or is_js_file_found or is_yml_file_found == 1 then
      return true
   end

   return false
end

lspconfig.tsserver.setup {
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = not isEslintrcFound()
      set_lsp_config(client, bufnr)
   end
}

-- vim.g.markdown_fenced_languages = { 'ts=typescript' }
-- lspconfig.denols.setup {
--    init_options = {
--       enable = true,
--       lint = false,
--       unstable = false
--    }
-- }

lspconfig.gopls.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
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

local sumneko_root_path = os.getenv('HOME') .. '/Apps/lua-language-server'
local sumneko_binary = sumneko_root_path..'/bin/'..system_name..'/lua-language-server'

lspconfig.sumneko_lua.setup {
   cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.pyright.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.bashls.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.jsonls.setup {
   capabilities = capabilities,
   cmd = { 'vscode-json-languageserver', '--stdio' },
   settings = {
      json = {
         schemas = require('schemastore').json.schemas(),
      }
   }
}

lspconfig.dockerls.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.vimls.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.eslint.setup {}

lspconfig.html.setup {
   capabilities = capabilities
}

lspconfig.cssls.setup {
   capabilities = capabilities
}

lspconfig.emmet_ls.setup {
   capabilities = capabilities,
   filetypes = {
      'html',
      'css',
      'typescriptreact',
      'javascriptreact'
   }
}
