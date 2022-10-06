local get_key_code = require('_utils').get_key_code
local keycodes = require('_keymap')

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
         smart_rename = get_key_code(keycodes.ts.rename)
      }
   },
   navigation = {
      enable = false,
      keymaps = {
         goto_definition      = get_key_code(keycodes.ts.def_nav),
         list_definitions     = get_key_code(keycodes.ts.list_defs),
         list_definitions_toc = get_key_code(keycodes.ts.list_defs_toc),
         goto_next_usage      = get_key_code(keycodes.ts.usage_next),
         goto_previous_usage  = get_key_code(keycodes.ts.usage_prev),
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
