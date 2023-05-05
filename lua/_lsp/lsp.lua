local lspconfig = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- local log = require('vim.lsp.log')
-- vim.lsp.set_log_level('debug')
-- log.set_format_func(vim.inspect)

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
   vim.lsp.diagnostic.on_publish_diagnostics,
   {
      underline = false,
      update_in_insert = false
   }
)

local function set_lsp_config(client, _)
   vim.cmd [[setlocal signcolumn=yes]]

   vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

   if client.server_capabilities.documentFormattingProvider then
      vim.cmd [[command! -buffer Fmt lua vim.lsp.buf.formatting_sync(nil, 1000)]]
      vim.cmd [[augroup LspFormatOnSave]]
      vim.cmd [[autocmd! BufWritePre <buffer> lua vim.lsp.buf.format()]]
      vim.cmd [[augroup END]]
   end
end

local base_servers = { 'dockerls', 'vimls', 'html', 'cssls', 'bashls', 'lua_ls', 'gopls', 'prismals' }

for _, lsp_server in ipairs(base_servers) do
   lspconfig[lsp_server].setup {
      single_file_support = true,
      capabilities = capabilities,
      on_attach = function(client, bufnr)
         set_lsp_config(client, bufnr)
      end
   }
end

lspconfig.eslint.setup({
   runtime = {
      execArgv = { "--max_old_space_size=4096" }
   },
   cmd = { 'vscode-eslint-language-server', '--stdio' },
   on_attach = function(_, bufnr)
      vim.api.nvim_create_autocmd('BufWritePre', {
         buffer = bufnr,
         command = 'EslintFixAll',
      })
   end,
})

lspconfig.tsserver.setup {
   single_file_support = true,
   capabilities = capabilities,
   init_options = {
      codeActionsOnSave = {
         ['source.organizeImports'] = true,
         ['source.removeUnusedImports'] = true,
         ['source.sortImports'] = true,
         ['source.addMissingImports'] = true,
         ['source.removeUnused'] = true,
         ['source.fixAll'] = true
      },
      maxTsServerMemory = 4096,
      tsserver = {
         useSyntaxServer = 'auto'
      },
      preferences = {
         quotesPreference = 'single',
         includeCompletionsForModuleExports = false,
         includeAutomaticOptionalChainCompletion = true,
         includeCompletionsForImportStatements = false
      }
   },
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end,
}

lspconfig.jsonls.setup {
   single_file_support = true,
   capabilities = capabilities,
   cmd = { 'vscode-json-language-server', '--stdio' },
   settings = {
      json = {
         schemas = require('schemastore').json.schemas(),
      }
   }
}

lspconfig.yamlls.setup {
   single_file_support = true,
   capabilities = capabilities,
   settings = {
      yaml = {
         schemas = {
            ['/path/from/root/of/project']                        = '/.github/workflows/*',
            ['../path/relative/to/file.yml']                      = '/.github/workflows/*',
            ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
         },
      },
   }
}

lspconfig.pylsp.setup {
   single_file_support = true,
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
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end,
   filetypes = {
      'html',
      'css',
      'typescriptreact',
      'javascriptreact',
   }
}

lspconfig.rust_analyzer.setup {
   capabilities = capabilities,
   on_attach = function(client, bufnr)
      set_lsp_config(client, bufnr)
   end,
   filetypes = {
      'rust',
   },

}
