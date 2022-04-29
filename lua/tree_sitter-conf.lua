local refactor_config = {
   highlight_definitions = {
      enable = false
   },
   highlight_current_scope = {
      enable = false
   },
   smart_rename = {
      enable = false,
      keymaps = {
         smart_rename = Get_key_code(Keycodes.ts.rename)
      }
   },
   navigation = {
      enable = false,
      keymaps = {
         goto_definition = Get_key_code(Keycodes.ts.def_nav),
         list_definitions = Get_key_code(Keycodes.ts.list_defs),
         list_definitions_toc = Get_key_code(Keycodes.ts.list_defs_toc),
         goto_next_usage = Get_key_code(Keycodes.ts.usage_next),
         goto_previous_usage = Get_key_code(Keycodes.ts.usage_prev),
      }
   }
}

local text_objects_config = {
   select = {
      enable = true,
      lookahead = true,
      keymaps = {
         [Get_key_code(Keycodes.ts.outer_block)] = '@block.outer',
         [Get_key_code(Keycodes.ts.inner_block)] = '@block.inner',
         [Get_key_code(Keycodes.ts.outer_class)] = '@class.inner',
         [Get_key_code(Keycodes.ts.inner_class)] = '@class.outer',
      },
   },
}

require'nvim-treesitter.configs'.setup {
   ensure_installed = false,
   ignore_install   = true,
   refactor         = refactor_config,
   textobjects      = text_objects_config,
   highlight = {
      enable  = true,
      disable = { 'http' },
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
}
