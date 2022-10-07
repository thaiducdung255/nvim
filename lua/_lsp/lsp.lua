local lspconfig = require 'lspconfig'

-- local log = require('vim.lsp.log')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- vim.lsp.set_log_level('debug')
-- log.set_format_func(vim.inspect)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
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
      vim.cmd [[autocmd! BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 500)]]
      vim.cmd [[augroup END]]
   end
end

vim.api.nvim_create_autocmd(
   'BufWritePre',
   {
      pattern = '*.tsx,*.ts,*.jsx,*.js',

      callback = function()
         vim.cmd [[EslintFixAll]]
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

lspconfig.gopls.setup {
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.sumneko_lua.setup {
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

lspconfig.yamlls.setup {
   capabilities = capabilities,
   settings = {
      yaml = {
         schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            ["../path/relative/to/file.yml"] = "/.github/workflows/*",
            ["/path/from/root/of/project"] = "/.github/workflows/*"
         },
      },
   }
}

lspconfig.dockerls.setup {
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.vimls.setup {
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.eslint.setup {
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.html.setup {
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.cssls.setup {
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end
}

lspconfig.pylsp.setup {
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end,
   settings = {
      pylsp = {
         plugins = {
            pylsp_mypy = {
               enabled = true,
               args = { '--strict' },
            },
            pyls_isort = {
               enabled = true
            },
            pyls_memestra = {
               enabled = true
            },
            pydocstyle = {
               enabled = true
            },
            flake8 = {
               enabled = true,
            },
            pylint = {
               enabled = true,
               -- args = { '--load-plugins pylint_quotes' },
            },
            python_lsp_black = {
               enabled = false
            },
            pylsp_rope = {
               enabled = false
            },
            rope_completion = {
               enabled = false
            },
            pyflakes = {
               enabled = false,
            },
            pycodestyle = {
               enabled = false
            },
            autopep8 = {
               enabled = false
            },
            mccabe = {
               enabled = false
            },
            yapf = {
               enabled = false
            },
         }
      }
   }
}

lspconfig.emmet_ls.setup {
   capabilities = capabilities,
   filetypes = {
      'html',
      'css',
      'typescriptreact',
      'javascriptreact',
   }
}