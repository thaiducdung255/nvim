local gl        = require('galaxyline')
local gls       = gl.section
local condition = require('galaxyline.condition')
local fileinfo  = require('galaxyline.provider_fileinfo')

gl.short_line_list = {'plug', 'fugitive', 'NvimTree', 'vista', 'dbui', 'packer', 'startify', 'coc'}

local icons = {
   sep = {
      right = '',
      left  = ''
   },
   diagnostic = {
      error = ' ',
      warn  = ' ',
      info  = ' '
   },
   diff = {
      added    = ' ',
      modified = ' ',
      removed  = ' '
   },
   git     = '',
   line_nr = '||',
   file = {
     modified  = '✎',
     read_only = '',
   },
   normal       = '',
   insert       = '',
   command      = '',
   visual       = '',
   replace      = '',
   selection    = '',
   terminal     = '',
   visual_block = ''
}

local colors = {
   main          = '#ff87ff',
   bg_alt        = '#0B0C15',
   main_bg       = '#262626',
   lightbg       = '#21252B',
   commented     = '#5c6370',
   grey          = '#3c4048',
   line_bg       = '#282c34',
   creamydark    = '#282c34',
   purple        = '#252930',
   cyan          = '#00FFFF',
   nord          = '#81A1C1',
   lightblue     = '#81a1c1',
   darkblue      = '#61afef',
   blue          = '#61afef',
   limegreen     = '#bbe67e',
   green         = '#7ed491',
   fg_green      = '#65a380',
   creamygreen   = '#a3be8c',
   yellow        = '#cccc00',
   creamyorange  = '#ff8800',
   orange        = '#FF8800',
   bg            = '#000B0C15',
   fg            = '#D8DEE9',
   magenta       = '#c678dd',
   red           = '#df8890',
   crimsonRed    = '#990000',
   crimsonRed2   = '#ff4d4d',
   greenYel      = '#EBCB8B',
   white         = '#d8dee9',
   brown         = '#91684a',
   teal          = '#23D4AC',
   blue2         = '#5c5c81',
   icon_inactive = '#9896AA'
}

local mode_map = {
   n      = { icons.normal    .. ' NOR  ',   colors.crimsonRed2 },
   no     = { icons.normal    .. ' NOR  ',   colors.crimsonRed2 },
   i      = { icons.insert    .. ' INS  ',   colors.green },
   ic     = { icons.insert    .. ' INS  ',   colors.green },
   c      = { icons.command   .. ' CMD  ',   colors.orange },
   ce     = { icons.command   .. ' CMD  ',   colors.orange },
   cv     = { icons.command   .. ' CMD  ',   colors.orange },
   v      = { icons.visual    .. ' VIS  ',   colors.lightblue },
   V      = { icons.visual    .. ' VIS  ',   colors.lightblue },
   [''] = { icons.visual    .. ' VIS  '    .. icons.visual_block .. ' ', colors.brown },
   R      = { icons.replace   .. ' REP  ',   colors.crimsonRed2 },
   ['r?'] = { icons.replace   .. ' REP  ',   colors.lightblue },
   Rv     = { icons.replace   .. ' REP  ',   colors.crimsonRed2 },
   r      = { icons.replace   .. ' REP  ',   colors.blue2 },
   rm     = { icons.replace   .. ' REP  ',   colors.blue2 },
   s      = { icons.selection .. ' SEL  ',   colors.greenYelenYel },
   S      = { icons.selection .. ' SEL  ',   colors.greenYelenYel },
   [''] = { icons.selection .. ' SEL  ',   colors.greenYelenYel },
   t      = { icons.terminal  .. ' TER  ',   colors.magenta },
   ['!']  = {              '  !      ',     colors.crimsonRed }
}

----------------------------=== Funcs ===--------------------------

local function mode_label() return mode_map[vim.fn.mode()][1] or 'N/A' end
local function mode_hl() return mode_map[vim.fn.mode()][2] or colors.main end

local function highlight1(group, fg, gui)
   local cmd = string.format('highlight %s guifg=%s', group, fg)
   if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
   vim.cmd(cmd)
end

local function highlight2(group, bg, fg, gui)
   local cmd = string.format('highlight %s guibg=%s guifg=%s', group, bg, fg)
   if gui ~= nil then cmd = cmd .. ' gui=' .. gui end
   vim.cmd(cmd)
end

local checkwidth = function()
   local squeeze_width  = vim.fn.winwidth(0) / 2

   if squeeze_width > 40 then
      return true
   end

   return false
end

local function file_name(is_active, highlight_group)
   local normal_fg = is_active and colors.creamydark or colors.blue2
   local modified_fg = is_active and '#ff0000' or '#cc8800'

   if vim.bo.modifiable then
      if vim.bo.modified then
         vim.api.nvim_command('hi ' .. highlight_group .. ' guifg='.. modified_fg .. ' gui=bold')
      else
         vim.api.nvim_command('hi ' .. highlight_group .. ' guifg='.. normal_fg .. ' gui=NONE')
      end
   end

   local fname = fileinfo.get_current_file_name(icons.file.modified, icons.file.read_only)

   if (condition.check_git_workspace()) and checkwidth() then
      local git_dir = require('galaxyline.provider_vcs').get_git_dir(vim.fn.expand('%:p'))
      local current_dir = vim.fn.expand('%:p:h')

      if git_dir == current_dir .. '/.git' or git_dir == nil then
         return fname
      end

      local get_path_from_git_root = current_dir:sub(#git_dir - 3)
      return get_path_from_git_root .. '/' .. fname
   end

   return fname
end

local white_space = function() return ' ' end

local function trailing_whitespace()
   local trail = vim.fn.search('\\s$', 'nw')

   if trail ~= 0 then
      return ' '
   else
      return nil
   end
end

local function is_filetype_exist()
   local tbl = { ['dashboard'] = true, [''] = true }

   if tbl[vim.bo.filetype] then
      return false
   end

   return true
end

local TrailingWhiteSpace = trailing_whitespace

local check_git_width = function()
   return checkwidth() and condition.check_git_workspace()
end

local check_git_terminal_workspace = function()
   return not (vim.fn.mode() == 't') and condition.check_git_workspace()
end

----------------------------=== Components ===--------------------------

----------------------------=== Left ===--------------------------

local i = 1

gls.left[i] = {
   leftRounded = {
      provider = function()
         return ''
      end,

      highlight = 'GalaxyViModeInv'
   }
}

i = i + 1
gls.left[i] = {
   ViMode = {
      provider = function()
         highlight2('GalaxyViMode', mode_hl(), colors.main_bg, 'bold')
         highlight1('GalaxyViModeInv', mode_hl(), 'bold')
         return string.format(' %s', mode_label())
      end,
   }
}

i = i + 1
gls.left[i] = {
   WhiteSpace = {
      provider = function()
         highlight2('SecondGalaxyViMode', mode_hl(), colors.white, 'bold')
      end,

      separator = '',
      separator_highlight = 'SecondGalaxyViMode'
   }
}

i = i + 1
gls.left[i] = {
	FileIcon = {
      provider            = 'FileIcon',
      separator_highlight = { colors.white, colors.white },
      condition           = condition.buffer_not_empty,
      highlight           = { colors.creamydark, colors.white }
   }
}

i = i + 1
gls.left[i] = {
   FileName = {
      provider  = function() return file_name(true, 'GalaxyFileName') end,
      condition = condition.buffer_not_empty,
      highlight = { colors.creamydark, colors.white },
   }
}

i = i + 1
gls.left[i] = {
   teech = {
      provider = function()
         return ''
      end,

      separator = '',
      highlight = { colors.white, colors.main_bg }
   }
}

i = i + 1
gls.left[i] = {
   Space = {
      provider  = white_space,
      highlight = { colors.bg, colors.main_bg }
   }
}

i = i + 1
gls.left[i] = {
	ShowLspClient = {
		provider            = 'GetLspClient',
		separator           = ' ',
		icon                = '⚹ ',
		condition           = is_filetype_exist,
		highlight           = { colors.white,colors.main_bg, 'italic' },
		separator_highlight = { colors.grey,colors.main_bg },
	}
}
i = i + 1

gls.left[i] = {
   DiagnosticError = {
      provider  = 'DiagnosticError',
      icon      = '  ✕ ',
      highlight = { colors.red, colors.main_bg }
   }
}

i = i + 1
gls.left[i] = {
   Space = {
      provider  = white_space,
      highlight = { colors.bg, colors.main_bg },

      condition = function()
         return require('galaxyline.provider_diagnostic').get_diagnostic_error() ~= ''
      end
   }
}

i = i + 1
gls.left[i] = {
   DiagnosticWarn = {
      provider  = 'DiagnosticWarn',
      icon      = '  ⚠ ',
      highlight = { colors.yellow, colors.main_bg }
   }
}

i = i + 1
gls.left[i] = {
   Space = {
      provider  = white_space,
      highlight = { colors.bg, colors.main_bg },

      condition = function()
         return require('galaxyline.provider_diagnostic').get_diagnostic_warn() ~= ''
      end
   }
}

i = i + 1
gls.left[i] = {
   DiagnosticInfo = {
      provider  = 'DiagnosticInfo',
      icon      = '   ',
      highlight = { colors.blue, colors.main_bg }
   }
}

i = i + 1
gls.left[i] = {
   DiagnosticHint = {
      provider  = 'DiagnosticHint',
      icon      = '   ',
      highlight = { colors.blue, colors.main_bg }
   }
}

i = i + 1
gls.left[i] = {
	LspCloseSign = {
      provider  = function() return '' end,
		highlight = { colors.main_bg,colors.grey },
	}
}

----------------------------=== Right ===--------------------------
i = 1

gls.right[i] = {
	LspOpenSign = {
      provider  = function() return '' end,
		highlight = { colors.main_bg,colors.grey },
	}
}

i = i + 1
gls.right[i] = {
   DiffAdd = {
      provider  = 'DiffAdd',
      condition = check_git_width,
      icon      = '  ' .. icons.diff.added .. '',
      highlight = { colors.teal, colors.main_bg }
   }
}

i = i + 1
gls.right[i] = {
   DiffModified = {
      provider  = 'DiffModified',
      condition = check_git_width,
      icon      = '  ' .. icons.diff.modified .. '',
      highlight = { colors.creamyorange, colors.main_bg }
   }
}

i = i + 1
gls.right[i] = {
   DiffRemove = {
      provider  = 'DiffRemove',
      condition = check_git_width,
      icon      = '  ' .. icons.diff.removed .. '',
      highlight = { colors.crimsonRed2, colors.main_bg }
   }
}

i = i + 1
gls.right[i] = {
   right_LeftRounded1 = {
		separator           = ' ',
      separator_highlight = {colors.main_bg, colors.main_bg},
      provider            = function() return '' end,
      condition           = condition.check_git_workspace,
      highlight           = { colors.blue2, colors.main_bg }
   }
}

i = i + 1
gls.right[i] = {
   GitIcon = {
      provider = function()
         return '  ' .. icons.git .. ' '
      end,

      condition = check_git_terminal_workspace,
      highlight = { colors.greenYel, colors.blue2 }
   }
}

i = i + 1
gls.right[i] = {
   GitBranch = {
      provider  = 'GitBranch',
      condition = condition.check_git_workspace,
      highlight = { colors.greenYel, colors.blue2 },
   }
}

i = i + 1
gls.right[i] = {
   Space2 = {
      provider  = white_space,
      condition = condition.check_git_workspace,
      highlight = { colors.blue2, colors.blue2 },
   }
}

i = i + 1
gls.right[i] = {
   right_LeftRounded = {
      provider = function()
         return ''
      end,

      highlight = function()
         if condition.check_git_workspace() then
            return {colors.grey, colors.blue2}
         else
            return {colors.grey, colors.main_bg}
         end
      end
   }
}

i = i + 1
gls.right[i] = {
   LineInfo = {
      provider  = 'LineColumn',
      icon      = '  ',
      highlight = { colors.white, colors.grey }
   }
}

i = i + 1
gls.right[i] = {
   PerCent = {
      provider            = 'LinePercent',
      separator           = ' ',
      separator_highlight = { colors.white, colors.grey },
      highlight           = { colors.white, colors.grey }
   }
}

i = i + 1
gls.right[i] = {
   rightRounded = {
      provider = function()
         return ''
      end,

      highlight = { colors.grey, colors.bg }
   }
}

-- -------------------------Short status line---------------------------------------

local k = 1
gls.short_line_left[k] = {
  SFirstElement = {
   provider  = function() return icons.sep.right end,
   highlight = { colors.grey, 'NONE' },
  },
}

k = k + 1
gls.short_line_left[k] ={
  SFileIcon = {
   provider  = 'FileIcon',
   highlight = { colors.icon_inactive, colors.grey },
  },
}

k = k + 1
gls.short_line_left[k] = {
  SMyFileName = {
   provider            = function() return file_name(false, 'GalaxySMyFileName') end,
   highlight           = { colors.red, colors.grey },
   separator           = icons.sep.left,
   separator_highlight = { colors.grey, colors.main_bg }
  }
}
