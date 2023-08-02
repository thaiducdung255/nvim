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
      }
   },
   navigation = {
      enable = false,
      keymaps = {
      }
   }
}

require 'nvim-treesitter.configs'.setup {
   sync_install   = true,
   auto_install   = true,
   ignore_install = true,
   refactor       = refactor_config,
   highlight      = {
      enable  = true,
      disable = { 'http' },
   },
   indent         = {
      enable = {
         'javascriptreact'
      }
   },
   autotag        = {
      enable = true
   },
   rainbow        = {
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
