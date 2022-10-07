local keycodes = require('_keymap').toggle_term
local utils = require('_utils')

local map = utils.map
local get_key_code = utils.get_key_code

require('toggleterm').setup {
   open_mapping    = get_key_code(keycodes.h_open),
   hide_numbers    = true,
   shade_filetypes = {},
   shade_terminals = true,
   shading_factor  = '1',
   start_in_insert = true,
   insert_mappings = false,
   persist_size    = true,
   direction       = 'horizontal',
   close_on_exit   = true,
   shell           = vim.o.shell,
   size            = function(term)
      if term.direction == 'horizontal' then
         return 15
      elseif term.direction == 'vertical' then
         return vim.o.columns * 0.4
      end
   end,
   float_opts      = {
      border     = 'single',
      width      = 200,
      height     = 100,
      winblend   = 3,
      highlights = {
         border     = 'Normal',
         background = 'Normal',
      }
   }
}

map('n', keycodes.v_open, ':ToggleTerm direction=vertical<CR>')
