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

lspconfig.tsserver.setup {
   -- init_options = {
   --    hostInfo = 'neovim',
   --    maxTsServerMemory = 2048,
   --    preferences = {
   --       includeCompletionForImportStatements = false,
   --       includeCompletionsForModuleExports = false
   --    }
   -- },
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      set_lsp_config(client, bufnr)
   end
}

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

local sumneko_root_path = '/home/df/Apps/lua-language-server'
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
   end
}

local eslint = {
   lintCommand = 'eslint_d --stdin --stdin-filename ${INPUT} -f unix',
   lintStdin = true,
   lintIgnoreExitCode = true,
   lintFormats = { '%f:%l:%c: %m' },
   formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
   formatStdin = true,
   rootMarkers = {'package.json'}
}

local prettier = {
   formatCommand = 'prettier_d --find-config-path --stdin-filepath ${INPUT}',
   formatStdin = true
}

local efm_config = os.getenv('HOME') .. '/.config/nvim/lua/lsp/efm-config.yaml'
-- local efm_log_dir = os.getenv('HOME') .. '/.cache/nvim/'
local efm_root_markers = { 'package.json', '.git/', '.zshrc' }

local efm_languages = {
   yaml            = { prettier },
   json            = { prettier },
   markdown        = { prettier },
   javascript      = { eslint },
   javascriptreact = { eslint },
   typescript      = { eslint },
   typescriptreact = { eslint },
   css             = { prettier },
   scss            = { prettier },
   sass            = { prettier },
   less            = { prettier },
   graphql         = { prettier },
   vue             = { prettier },
   html            = { prettier }
}

lspconfig.efm.setup({
   cmd = {
      'efm-langserver',
      '-c',
      efm_config,
      -- '-logfile',
      -- efm_log_dir .. 'efm-lsp.log'
   },
   filetype = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact'
   },
   on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
         vim.cmd('augroup Format')
         vim.cmd('autocmd! * <buffer>')
         vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 300)')
         vim.cmd('augroup END')
      end
   end,
   -- root_dir = lspconfig.util.root_pattern(unpack(efm_root_markers)),
   init_options = {
      documentFormatting = true
   },
   settings = {
      rootMarkers = efm_root_markers,
      languages = efm_languages
   }
})
