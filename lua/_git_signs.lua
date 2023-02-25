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

   signs                             = {
      -- TODO add hl to colorscheme
      add          = {
         hl     = 'GitSignsAdd',
         text   = '▎',
         numhl  = 'GitSignsAddNr',
         linehl = 'GitSignsAddLn',
      },
      change       = {
         hl     = 'GitSignsChange',
         text   = '▎',
         numhl  = 'GitSignsChangeNr',
         linehl = 'GitSignsChangeLn',
      },
      topdelete    = {
         hl     = 'GitSignsDelete',
         text   = '▎',
         numhl  = 'GitSignsDeleteNr',
         linehl = 'GitSignsDeleteNr',
      },
      changedelete = {
         hl     = 'GitSignsChange',
         text   = '▎',
         numhl  = 'GitSignsChangeNr',
         linehl = 'GitSignsChangeLn',
      },
      delete       = {
         hl     = 'GitSignsDelete',
         text   = '▎',
         numhl  = 'GitSignsDeleteNr',
         linehl = 'GitSignsDeleteLn',
      },
      untracked    = {
         hl     = 'Grey',
         text   = '▎',
         numhl  = 'Grey',
         linehl = 'Grey',
      }
   },

   keymaps                           = {
      noremap                         = true,

      ['n ' .. keycodes.next_hunk]    = { expr = true,
         "&diff ? '' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n ' .. keycodes.prev_hunk]    = { expr = true,
         "&diff ? '' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      ['n ' .. keycodes.reset_hunk]   = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['v ' .. keycodes.reset_hunk]   = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n ' .. keycodes.reset_buf]    = '<cmd>lua require"gitsigns".reset_buffer()<CR>',

      ['n ' .. keycodes.preview_hunk] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n ' .. keycodes.diff_this]    = '<cmd>lua require"gitsigns".diffthis()<CR>',

      ['n ' .. keycodes.set_loc_list] = '<cmd>lua require"gitsigns".setloclist()<CR>',

      ['o ' .. keycodes.select_hunk]  = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
      ['x ' .. keycodes.select_hunk]  = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
   },
}
