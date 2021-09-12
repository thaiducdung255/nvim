local gl = require('galaxyline')
local gps = require('nvim-gps')

local colors = {
   bg             = '#33355b',
   yellow         = '#DCDCAA',
   dark_yellow    = '#D7BA7D',
   cyan           = '#4EC9B0',
   green          = '#608B4E',
   light_green    = '#B5CEA8',
   string_orange  = '#CE9178',
   orange         = '#FF8800',
   purple         = '#C586C0',
   magenta        = '#D16D9E',
   grey           = '#858585',
   blue           = '#569CD6',
   vivid_blue     = '#4FC1FF',
   light_blue     = '#9CDCFE',
   red            = '#D16969',
   error_red      = '#F44747',
   info_yellow    = '#FFCC66'
}

local condition      = require('galaxyline.condition')
local gls            = gl.section
gl.short_line_list   = {'NvimTree', 'vista', 'dbui', 'packer'}

gls.left[1] = {
   ViMode = {
      provider = function()
         -- auto change color according the vim mode
         local mode_color = {
            n      = colors.blue,
            i      = colors.green,
            v      = colors.purple,
            V      = colors.purple,
            c      = colors.magenta,
            no     = colors.blue,
            s      = colors.orange,
            S      = colors.orange,
            ['']   = colors.orange,
            ic     = colors.yellow,
            R      = colors.red,
            Rv     = colors.red,
            cv     = colors.blue,
            ce     = colors.blue,
            r      = colors.cyan,
            rm     = colors.cyan,
            ['r?'] = colors.cyan,
            ['!']  = colors.blue,
            t      = colors.blue
         }

         vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color[vim.fn.mode()])
         return '▊ '
      end,
      highlight      = {colors.red, colors.bg}
   }
}

-- print(vim.fn.getbufvar(0, 'ts'))
-- vim.fn.getbufvar(0, 'ts')

gls.left[2] = {
   GitIcon = {
      provider = function()
         return ' '
      end,
      condition            = condition.check_git_workspace,
      separator            = ' ',
      separator_highlight  = {'NONE', colors.bg},
      highlight            = {colors.orange, colors.bg}
   }
}

gls.left[3] = {
   GitBranch = {
      provider             = 'GitBranch',
      condition            = condition.check_git_workspace,
      separator            = ' ',
      separator_highlight  = {'NONE', colors.bg},
      highlight            = {colors.orange, colors.bg}
   }
}

gls.left[4] = {
   DiffAdd = {
      provider    = 'DiffAdd',
      condition   = condition.hide_in_width,
      icon        = '  ',
      highlight   = {colors.green, colors.bg}
   }
}

gls.left[5] = {
   DiffModified = {
      provider    = 'DiffModified',
      condition   = condition.hide_in_width,
      icon        = '  柳',
      highlight   = {colors.blue, colors.bg}
   }
}

gls.left[6] = {
   DiffRemove = {
      provider    = 'DiffRemove',
      condition   = condition.hide_in_width,
      icon        = '   ',
      highlight   = {colors.red, colors.bg}
   }
}

gls.left[7] = {
   Data = {
      provider             = function()
         local cwdLen      = vim.fn.getcwd():len()
         return '    ' .. vim.api.nvim_buf_get_name(0):sub(cwdLen+2) .. ' '
      end,
      condition            = condition.hide_in_width,
      separator            = ' ',
      separator_highlight  = {'NONE', colors.bg},
      highlight            = {colors.grey, colors.bg}
   }
}

gls.left[8] = {
	nvimGPS = {
		provider = function()
			return gps.get_location()
		end,
		condition = function()
			return gps.is_available()
		end,
      highlight            = {
         colors.blue,
         colors.bg
      }
	}
}

gls.right[1] = {
   DiagnosticError = {
      provider    = 'DiagnosticError',
      icon        = '  ',
      highlight   = {
         colors.error_red,
         colors.bg
      }
   }
}

gls.right[2] = {
   DiagnosticWarn = {
      provider    = 'DiagnosticWarn',
      icon        = '   ',
      highlight   = {
         colors.orange,
         colors.bg
      }
   }
}

gls.right[3] = {
   Space = {
      provider             = function()
         return ' '
      end,
      separator            = ' ',
      separator_highlight  = {
         'NONE',
         colors.bg
      },
      highlight            = {
         colors.orange,
         colors.bg
      }
   }
}

gls.right[4] = {
   DiagnosticHint = {
      provider    = 'DiagnosticHint',
      icon        = '  ',
      highlight   = {
         colors.vivid_blue,
         colors.bg
      }
   }
}

gls.right[5] = {
   Space = {
      provider             = function()
         return ' '
      end,
      separator            = ' ',
      separator_highlight  = {
         'NONE',
         colors.bg
      },
      highlight            = {
         colors.orange,
         colors.bg
      }
   }
}

gls.right[6] = {
   DiagnosticInfo = {
      provider    = 'DiagnosticInfo',
      icon        = '  ',
      highlight   = {
         colors.info_yellow,
         colors.bg
      }
   }
}

gls.right[7] = {
   ShowLspClient = {
      provider       = 'GetLspClient',
      condition      = function()

         local tbl   = {
            ['dashboard']  = true,
            [' ']          = true
         }

         if tbl[vim.bo.filetype] then return false end
         return true
      end,
      icon        = ' ',
      highlight   = {
         colors.yellow,
         colors.bg
      }
   }
}

gls.right[8] = {
   Space = {
      provider             = function()
         return ' '
      end,
      separator            = ' ',
      separator_highlight  = {
         'NONE',
         colors.bg
      },
      highlight            = {
         colors.orange,
         colors.bg
      }
   }
}
gls.right[9] = {
   LineInfo = {
      provider             = 'LineColumn',
      separator            = ' ',
      separator_highlight  = {
         'NONE',
         colors.bg
      },
      highlight            = {
         colors.yellow,
         colors.bg
      }
   }
}

gls.right[10] = {
   PerCent = {
      provider = 'LinePercent',
      separator = ' ',
      separator_highlight= {'NONE', colors.bg},
      highlight = {colors.yellow, colors.bg}
   }
}

gls.right[11] = {
   Space = {
      provider             = function()
         return ' '
      end,
      separator            = '',
      separator_highlight  = {
         'NONE',
         colors.bg
      },
      highlight            = {
         colors.orange,
         colors.bg
      }
   }
}

gls.right[12] = {
   Shiftwidth = {
      provider             = function()
         return 'SW:' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') .. ' '
      end,
      condition            = condition.hide_in_width,
      separator            = ' ',
      separator_highlight  = {'NONE', colors.bg},
      highlight            = {colors.yellow, colors.bg}
   }
}

gls.right[16] = {
   Space = {
      provider             = function()
         return ' '
      end,
      separator            = ' ',
      separator_highlight  = {
         'NONE',
         colors.bg
      },
      highlight            = {
         colors.orange,
         colors.bg
      }
   }
}

gls.short_line_left[1] = {
   Data = {
      provider             = function()
         local cwdLen      = vim.fn.getcwd():len()
         return '   ' .. vim.api.nvim_buf_get_name(0):sub(cwdLen+2) .. ' '
      end,
      condition            = condition.hide_in_width,
      separator            = ' ',
      separator_highlight  = {'NONE', colors.bg},
      highlight            = {colors.grey, colors.bg}
   }
}
