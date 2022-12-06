local _gps = require('nvim-gps')

local colors = {
   bg1     = "#101010",
   bg2     = "#202020",
   bg3     = "#303030",
   fg      = "#e0e0e0",
   green   = "Green",
   orange  = 'Orange',
   red     = "Red",
   cyan    = "Cyan",
   comment = "#444444",
}

local theme = {
   normal = {
      a = { bg = colors.bg1, fg = colors.fg },
      b = { bg = colors.bg2, fg = colors.fg },
      c = { bg = colors.bg3, fg = colors.fg },
   },
   insert = {
      a = { bg = colors.bg1, fg = colors.green },
   },
   visual = {
      a = { bg = colors.bg1, fg = colors.orange },
   },
   replace = {
      a = { bg = colors.bg1, fg = colors.red },
   },
   command = {
      a = { bg = colors.bg1, fg = colors.cyan },
   },
   inactive = {
      a = { bg = colors.bg1, fg = colors.comment },
   },
}

_gps.setup {
   separator             = ' -> ',
   depth                 = 0,
   depth_limit_indicator = '..',
   icons                 = {
      ['class-name']     = ' ',
      ['function-name']  = ' ',
      ['method-name']    = ' ',
      ['container-name'] = ' ',
      ['tag-name']       = '炙'
   },
}

local shorten_filename = function(str)
   local last_index = str:find("%.", 0)

   if last_index == nil or last_index == 1 then
      return str
   end

   return str:sub(1, last_index - 1)
end

local gps = {
   _gps.get_location,
   cond = _gps.is_available,
}

local file_name = {
   'filename',
   file_status     = true,
   path            = 1,
   shorting_target = 40,
}

local tabs = {
   'tabs',
   mode = 1,
   fmt  = shorten_filename,
}

local mode = {
   'mode',
   icons_enabled = true,
   icon          = '',
   fmt           = function(str)
      return str:sub(1, 3)
   end,
}

local diff = {
   'diff',
   colored = false,
   symbols = { added = ' ', modified = ' ', removed = ' ' },
}

local branch = {
   'branch',
}

local diagnostics = {
   'diagnostics',
   sources = { 'nvim_diagnostic' },
   colored = false,
}

local progress = {
   'progress',
}

local windows = {
   'windows',
   show_filename_only   = true,
   show_modified_status = true,
   mode                 = 0,
   fmt                  = shorten_filename,
}

require 'lualine'.setup {
   tabline    = {
      lualine_a = { windows },
      lualine_b = {},
      lualine_c = {},

      lualine_x = {},
      lualine_y = {},
      lualine_z = { tabs }
   },
   extensions = {},
   options    = {
      icons_enabled        = true,
      theme                = theme,
      component_separators = { left = '|', right = '|' },
      section_separators   = { left = '', right = '' },
      disabled_filetypes   = { 'NvimTree', 'toggleterm', 'Outline' },
      always_divide_middle = true,
   },
   sections   = {
      lualine_a = { mode },
      lualine_b = { file_name },
      lualine_c = { diagnostics, gps },

      lualine_x = {},
      lualine_y = { diff },
      lualine_z = { branch, progress }
   },
}
