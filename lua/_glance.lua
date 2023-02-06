local glance = require('glance')
local actions = glance.actions
local keycodes = require('_keymap').glance
local map = require('_utils').map
local get_key_code = require('_utils').get_key_code

glance.setup({
   height = 18, -- Height of the window
   zindex = 45,
   preview_win_opts = { -- Configure preview window options
      cursorline = true,
      number     = true,
      wrap       = true,
   },
   border = {
      enable = false, -- Show window borders. Only horizontal borders allowed
      top_char = '―',
      bottom_char = '―',
   },
   list = {
      position = 'right', -- Position of the list window 'left'|'right'
      width = 0.3, -- 30% width relative to the active window, min 0.1, max 0.5
   },
   theme = { -- This feature might not work properly in nvim-0.7.2
      enable = true, -- Will generate colors for the plugin based on your current colorscheme
      mode   = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
   },
   mappings = {
      list = {
         [get_key_code(keycodes.actions.next)]            = actions.next,
         [get_key_code(keycodes.actions.prev)]            = actions.previous,
         [get_key_code(keycodes.actions.n_loc)]           = actions.next_location,
         [get_key_code(keycodes.actions.p_loc)]           = actions.previous_location,
         [get_key_code(keycodes.actions.enter_win)]       = actions.enter_win('preview'),
         [get_key_code(keycodes.actions.close_win)]       = actions.close,
         [get_key_code(keycodes.actions.close_win_alt)]   = actions.close,
         [get_key_code(keycodes.actions.open_vsplit)]     = actions.jump_vsplit,
         [get_key_code(keycodes.actions.open_hsplit)]     = actions.jump_hsplit,
         [get_key_code(keycodes.actions.open_tab)]        = actions.jump_tab,
         [get_key_code(keycodes.actions.open)]            = actions.jump,
         [get_key_code(keycodes.actions.scroll_down_win)] = actions.preview_scroll_win(-5),
         [get_key_code(keycodes.actions.scroll_up_win)]   = actions.preview_scroll_win(5),
      },
      preview = {
         [get_key_code(keycodes.actions.close_win_alt)] = actions.close,
         [get_key_code(keycodes.actions.close_win)]     = actions.close,
         [get_key_code(keycodes.actions.n_loc)]         = actions.next_location,
         [get_key_code(keycodes.actions.p_loc)]         = actions.previous_location,
         [get_key_code(keycodes.actions.enter_win)]     = actions.enter_win('preview'),
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

map('n', keycodes.go_to_def, '<CMD>Glance definitions<CR>')
map('n', keycodes.go_to_impl, '<CMD>Glance implementations<CR>')
map('n', keycodes.go_to_type_def, '<CMD>Glance type_definitions<CR>')
map('n', keycodes.go_to_ref, '<CMD>Glance references<CR>')
