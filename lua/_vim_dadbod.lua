local keycodes                 = require('_keymap').dadbod

vim.g.db_ui_show_help          = 0
vim.g.db_ui_use_nerd_fonts     = 1
vim.g.db_ui_show_database_icon = 1

vim.api.nvim_create_autocmd(
   'BufEnter',
   {
      pattern = '(*-query-*|*.query)',
      callback = function()
         vim.cmd('nmap ' .. keycodes.exec_query .. '<Plug>(DBUI_ExecuteQuery)')
         vim.cmd('nmap ' .. keycodes.save_query .. '<Plug>(DBUI_SaveQuery)')
      end
   }
)
