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

      ['n ' .. Get_key_code(Keycodes.git_signs.next_hunk)] = { expr = true, "&diff ? '' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n ' .. Get_key_code(Keycodes.git_signs.prev_hunk)] = { expr = true, "&diff ? '' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      ['n ' .. Get_key_code(Keycodes.git_signs.reset_hunk)] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['v ' .. Get_key_code(Keycodes.git_signs.reset_hunk)] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n ' .. Get_key_code(Keycodes.git_signs.reset_buf)] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',

      ['n ' .. Get_key_code(Keycodes.git_signs.preview_hunk)] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n ' .. Get_key_code(Keycodes.git_signs.diff_this)] = '<cmd>lua require"gitsigns".diffthis()<CR>',

      ['n ' .. Get_key_code(Keycodes.git_signs.set_loc_list)] = '<cmd>lua require"gitsigns".setloclist()<CR>',

      ['o ' .. Get_key_code(Keycodes.git_signs.select_hunk)] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
      ['x ' .. Get_key_code(Keycodes.git_signs.select_hunk)] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
   },
}
