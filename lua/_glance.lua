local glance = require('glance')
local actions = glance.actions

local keycodes = {
   next            = 'n',
   prev            = 'e',
   n_loc           = '<Tab>',
   p_loc           = '<S-Tab>',
   scroll_up_win   = 'E',
   scroll_down_win = 'N',
   close_win       = '<ESC>',
   close_win_alt   = 'q',
   enter_win       = '<C-CR>',
   open_vsplit     = 'v',
   open_hsplit     = 's',
   open_tab        = 't',
   open            = '<CR>',
}

glance.setup({
   height = 18, -- Height of the window
   zindex = 45,
   preview_win_opts = {
      -- Configure preview window options
      cursorline = true,
      number     = true,
      wrap       = true,
   },
   border = {
      enable      = false, -- Show window borders. Only horizontal borders allowed
      top_char    = '―',
      bottom_char = '―',
   },
   list = {
      position = 'right', -- Position of the list window 'left'|'right'
      width    = 0.3,     -- 30% width relative to the active window, min 0.1, max 0.5
   },
   theme = {
      -- This feature might not work properly in nvim-0.7.2
      enable = true,   -- Will generate colors for the plugin based on your current colorscheme
      mode   = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
   },
   mappings = {
      list = {
         [keycodes.next]            = actions.next,
         [keycodes.prev]            = actions.previous,
         [keycodes.n_loc]           = actions.next_location,
         [keycodes.p_loc]           = actions.previous_location,
         [keycodes.enter_win]       = actions.enter_win('preview'),
         [keycodes.close_win]       = actions.close,
         [keycodes.close_win_alt]   = actions.close,
         [keycodes.open_vsplit]     = actions.jump_vsplit,
         [keycodes.open_hsplit]     = actions.jump_hsplit,
         [keycodes.open_tab]        = actions.jump_tab,
         [keycodes.open]            = actions.jump,
         [keycodes.scroll_down_win] = actions.preview_scroll_win(-5),
         [keycodes.scroll_up_win]   = actions.preview_scroll_win(5),
      },
      preview = {
         [keycodes.close_win_alt] = actions.close,
         [keycodes.close_win]     = actions.close,
         [keycodes.n_loc]         = actions.next_location,
         [keycodes.p_loc]         = actions.previous_location,
         [keycodes.enter_win]     = actions.enter_win('preview'),
      },
   },
   hooks = {},
   folds = {
      fold_closed = '',
      fold_open   = '',
      folded      = true, -- Automatically fold list on startup
   },
   indent_lines = {
      enable = true,
      icon   = '  ',
   },
   winbar = {
      enable = true, -- Available strating from nvim-0.8+
   },
})
