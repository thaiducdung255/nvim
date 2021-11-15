local file_name = {
   'filename',
   file_status     = true,
   path            = 1,
   shorting_target = 40
}

local diff = {
   'diff',
   colored = true,
   symbols = { added = ' ', modified = ' ', removed = ' ' },
}

local file_format = {
   'fileformat',
   symbols = {
      unix = 'Unix',
      dos  = 'Dos',
      mac  = 'Mac',
   }
}

require'lualine'.setup {
   tabline    = {},
   extensions = {},
   options = {
      icons_enabled        = true,
      theme                = 'auto',
      component_separators = { left = '', right = '' },
      section_separators   = { left = '', right = '' },
      disabled_filetypes   = { 'NvimTree', 'toggleterm' },
      always_divide_middle = true,
   },
   sections = {
      lualine_a = { 'mode' },
      lualine_b = { file_name, 'filesize' },
      lualine_c = { {'diagnostics', sources = { 'nvim_lsp' } } },

      lualine_x = {},
      lualine_y = { 'branch', diff, file_format },
      lualine_z = { 'location', 'progress' }
   },
   inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
   },
}
