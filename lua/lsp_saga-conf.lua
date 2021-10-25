local saga = require 'lspsaga'

saga.init_lsp_saga {
   use_saga_diagnostic_sign = false,
   error_sign               = '✕',
   warn_sign                = '⚠',
   hint_sign                = '',
   infor_sign               = '',
   dianostic_header_icon    = '   ',
   code_action_icon         = '',
   finder_definition_icon   = '  ',
   finder_reference_icon    = '  ',
   max_preview_lines        = 10,
   definition_preview_icon  = '  ',
   border_style             = "single",
   rename_prompt_prefix     = '➤',
   server_filetype_map      = {},
   finder_action_keys = {
     open = '<CR>', vsplit = 'sn',split = 'sm',quit = '<ESC>',scroll_down = 'n', scroll_up = 'm'
   },
   code_action_keys = {
     quit = 'q',exec = '<CR>'
   },
   rename_action_keys = {
     quit = '<C-c>',exec = '<CR>'
   },
   code_action_prompt = {
     enable = true,
     sign = true,
     sign_priority = 20,
     virtual_text = true,
   },
}

Nmap('dp', ':Lspsaga preview_definition<CR>')
Nmap('gi', ':Lspsaga lsp_finder<CR>')
Nmap('fj', ':Lspsaga diagnostic_jump_next<CR>')
Nmap('fk', ':Lspsaga diagnostic_jump_prev<CR>')
