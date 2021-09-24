require'nvim-treesitter.configs'.setup {
   ensure_installed = false,
   ignore_install   = true,
   highlight = {
      enable = true,
   },
   indent = {
      enable = {
         'javascriptreact'
      }
   },
   autotag = {
      enable = true
   },
   rainbow = {
      enable         = true,
      extended_mode  = true,
      max_file_lines = 1000,
   },
   refactor = {
      highlight_definitions = {
         enable = false
      },
      highlight_current_scope = {
         enable = false
      },
      smart_rename = {
         enable = false,
         keymaps = {
            smart_rename = 'grr'
         }
      },
      navigation = {
         enable = false,
         keymaps = {
            goto_definition = 'gnd',
            list_definitions = 'gnD',
            list_definitions_toc = 'gO',
            goto_next_usage = 'grn',
            goto_previous_usage = 'grm',
         }
      }
   }
}

-- local query = require('vim.treesitter.query')
-- local indentifier_query = '(identifier) @operator'
-- query.set_query('javascript', 'highlights', indentifier_query)
