vim.lsp.set_log_level('debug')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require 'lspconfig'
local js_tools = require 'lsp/utils/js_tools'

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

local js_formatter = js_tools.get_js_formatter()

local js_config = {
   lintCommand = js_tools.should_use_eslint() and 'eslint_d -f unix --stdin --stdin-filename ${INPUT}' or '',
   lintStdin = true,
   lintFormats = { '%f:%l:%c: %m' },
   lintIgnoreExitCode = true,
   formatCommand = js_formatter,
   formatStdin = true,
   rootMarkers = {'package.json'}
}

local pyright_config = {
   lintCommand = 'python3 -m pylint --output-format text --score no --msg-template {path}:{line}:{column}:{C}:{msg} ${INPUT}',
   lintStdin = true,
   lintFormats = { '%f:%l:%c:%t:%m' },
}

local function is_javascript(ft)
   return vim.startswith(ft, 'javascript') or vim.startswith(ft, 'typescript')
end

local function check_efm_formatter(set_document_formatting)
   if is_javascript(vim.bo.filetype) then
      if vim.startswith(js_formatter, 'eslint') then
         js_tools.check_eslint_config(function(exit_code)
            set_document_formatting(exit_code == 0)
         end)
         return
      end

      set_document_formatting(js_formatter ~= '')
   end

   return set_document_formatting(true)
end

lspconfig.tsserver.setup {
   init_options = {
      hostInfo = 'neovim',
      maxTsServerMemory = 2048,
      preferences = {
         includeCompletionForImportStatements = false,
         includeCompletionsForModuleExports = false
      }
   },
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      check_efm_formatter(
         function(ok)
            client.resolved_capabilities.document_formatting = not ok
         end
      )
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

lspconfig.efm.setup {
   on_attach = function(client, bufnr)
      check_efm_formatter(
         function(ok)
            client.resolved_capabilities.document_formatting = ok
         end
      )

      set_lsp_config(client, bufnr)
   end,
   root_dir = function(client, bufnr)
      if vim.api.nvim_buf_get_name(bufnr):match('node_modules') == nil then
         return vim.fn.getcwd()
      end
   end,
   default_config = {
      cmd = {
         'efm-langserver',
         '-c',
         [['$HOME/.config/efm-langserver/config.yaml']]
      }
   },
   settings = {
      languages = {
         javascript           = { js_config },
         javascriptreact      = { js_config },
         ['javascript.jsx']   = { js_config },
         typescript           = { js_config },
         ['typescript.tsx']   = { js_config },
         typescriptreact      = { js_config },
         python               = { pyright_config },
      }
   },
   filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'markdown'
   },
   commands = {
      EfmLog = {
         function()
            local logfile = '$HOME/efmlangserver.log'
            local cmd = string.format('tail -1000 %s | grep -E \'^[0-9]{4}/[0-9]{2}/[0-9]{2}\'', logfile)
            vim.cmd('split new')
            vim.cmd('10wincmd _')
            vim.cmd('set bt=nofile')
            vim.cmd('setlocal nowrap')
            vim.cmd('setlocal bufhidden=wipe')
            vim.cmd(string.format('r ++edit !%s', cmd))
         end
      }
   }
}
