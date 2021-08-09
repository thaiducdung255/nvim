require('gitsigns').setup {
   signs = {
    -- TODO add hl to colorscheme
      add            = { hl = 'GitSignsAdd'   , text = ' ', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn' },
      change         = { hl = 'GitSignsChange', text = ' 柳', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
      delete         = { hl = 'GitSignsDelete', text = ' ', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
      changedelete   = { hl = 'GitSignsChange', text = ' 柳', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
   },
   numhl             = false,
   linehl            = false,
   keymaps           = {
      -- Default keymap options
      noremap = true,

      ['n gj'] = { expr = true, "&diff ? 'gj' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
      ['n gk'] = { expr = true, "&diff ? 'gk' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

      ['n gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['v gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n gS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',

      ['n gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',

      ['n gv'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['v gv'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n gV'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',

      ['n gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR><C-w>w',

      ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
   },
   watch_index      = {
      interval      = 1000
   },
   sign_priority    = 6,
   update_debounce  = 200,
   status_formatter = nil, -- Use default
   -- use_decoration_api = false
}
