local _recorder        = require('recorder')
local _lsp             = require('dr-lsp')
local navic            = require('nvim-navic')

local colors           = {
   bg1     = '#101010',
   bg2     = '#202020',
   bg3     = '#303030',
   fg      = '#e0e0e0',
   green   = 'Green',
   orange  = 'Orange',
   red     = 'Red',
   cyan    = 'Cyan',
   comment = '#444444',
}

local theme            = {
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
   terminal = {
      a = { bg = colors.bg1, fg = colors.cyan },
   },
}

local shorten_filename = function(str)
   local found_current_idx = str:find('%.', 1)

   if found_current_idx == nil or found_current_idx == 1 then
      return str
   end

   -- remove file's extensions
   local last_found_idx = found_current_idx

   while found_current_idx ~= nil do
      last_found_idx = found_current_idx
      found_current_idx = str:find('%.', last_found_idx + 1)
   end

   return str:sub(1, last_found_idx - 1)
end

local file_name        = {
   'filename',
   file_status     = true,
   path            = 0,
   shorting_target = 20,
}

local tabs             = {
   'tabs',
   mode = 1,
   fmt  = shorten_filename,
}

local mode             = {
   'mode',
   icons_enabled = true,
   icon          = '',
   fmt           = function(str)
      return str:sub(1, 3)
   end,
}

local diff             = {
   'diff',
   colored = false,
   symbols = { added = ' ', modified = ' ', removed = ' ' },
}

local branch           = {
   'branch',
   icon = '',
   fmt = function(str)
      if str:len() > 18 then
         return str:sub(1, 18) .. '...'
      end

      return str
   end,
}

local diagnostics      = {
   'diagnostics',
   sources = { 'nvim_diagnostic' },
   colored = false,
}

local progress         = {
   'progress',
}

local windows          = {
   'windows',
   show_filename_only   = true,
   show_modified_status = true,
   mode                 = 0,
   fmt                  = shorten_filename,
   disabled_buftypes    = { 'terminal', 'nofile' },
   filetype_names       = {
      NvimTree   = 'NTree',
      toggleterm = 'term',
   }
}

local nav              = {
   function()
      return navic.get_location()
   end,
   cond = function()
      return navic.is_available()
   end
}

require 'lualine'.setup {
   tabline    = {
      lualine_a = { windows },
      lualine_b = {},
      lualine_c = { nav },
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
      always_divide_middle = true,
   },
   sections   = {
      lualine_a = { mode },
      lualine_b = { file_name },
      lualine_c = { diagnostics },
      lualine_x = {},
      lualine_y = { _recorder.recordingStatus, _recorder.displaySlots, diff },
      lualine_z = { branch, progress, _lsp.lspProgress }
   },
}
