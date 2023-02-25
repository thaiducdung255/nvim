local keycodes = require('_keymap').ts

local refactor_config = {
   highlight_definitions = {
      enable = true
   },
   highlight_current_scope = {
      enable = false
   },
   smart_rename = {
      enable = false,
      keymaps = {
         smart_rename = keycodes.rename
      }
   },
   navigation = {
      enable = false,
      keymaps = {
         goto_definition      = keycodes.def_nav,
         list_definitions     = keycodes.list_defs,
         list_definitions_toc = keycodes.list_defs_toc,
         goto_next_usage      = keycodes.usage_next,
         goto_previous_usage  = keycodes.usage_prev,
      }
   }
}

require 'nvim-treesitter.configs'.setup {
   ensure_installed = false,
   ignore_install   = true,
   refactor         = refactor_config,
   highlight        = {
      enable  = true,
      disable = { 'http' },
   },
   indent           = {
      enable = {
         'javascriptreact'
      }
   },
   autotag          = {
      enable = true
   },
   rainbow          = {
      enable         = true,
      extended_mode  = true,
      max_file_lines = 1000,
   },
}

vim.api.nvim_create_autocmd(
   'FileType',
   {
      pattern  = 'tsplayground',
      callback = function()
         vim.bo.sw = 2
      end
   }
)
