local get_key_code = require('_utils').get_key_code
local keycodes = require('_keymap').git_signs

require('gitsigns').setup {
   numhl                             = false,
   linehl                            = false,
   word_diff                         = false,
   signcolumn                        = true,
   watch_gitdir                      = { interval = 1000 },
   sign_priority                     = 6,
   update_debounce                   = 200,
   status_formatter                  = nil,
   current_line_blame                = true,
   current_line_blame_formatter_opts = { relative_time = true },

   signs = {
      -- TODO add hl to colorscheme
      add          = { hl = 'GitSignsAdd', text = ' ▎', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change       = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      changedelete = { hl = 'GitSignsChange', text = ' ▎', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      delete       = { hl = 'GitSignsDelete', text = ' ▎', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
   },

   keymaps = {
      noremap = true,

      ['n ' .. get_key_code(keycodes.next_hunk)] = { expr = true,
         "&diff ? '' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n ' .. get_key_code(keycodes.prev_hunk)] = { expr = true,
         "&diff ? '' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      ['n ' .. get_key_code(keycodes.reset_hunk)] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['v ' .. get_key_code(keycodes.reset_hunk)] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n ' .. get_key_code(keycodes.reset_buf)] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',

      ['n ' .. get_key_code(keycodes.preview_hunk)] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n ' .. get_key_code(keycodes.diff_this)] = '<cmd>lua require"gitsigns".diffthis()<CR>',

      ['n ' .. get_key_code(keycodes.set_loc_list)] = '<cmd>lua require"gitsigns".setloclist()<CR>',

      ['o ' .. get_key_code(keycodes.select_hunk)] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
      ['x ' .. get_key_code(keycodes.select_hunk)] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
   },
}
