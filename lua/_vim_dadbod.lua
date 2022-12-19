vim.g.db_ui_show_help          = 0
vim.g.db_ui_use_nerd_fonts     = 1
vim.g.db_ui_show_database_icon = 1

vim.cmd([[au BufLeave [0-9].json LspStart]])
vim.cmd([[au BufLeave [0-9][0-9].json LspStart]])

vim.cmd([[au BufEnter,BufNew *b-query-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]* set ft=mongodb]])
vim.cmd([[au BufEnter *MongoDb set ft=mongodb]])

vim.api.nvim_create_autocmd(
   'BufEnter',
   {
      pattern = '[0-9].json',
      callback = function()
         vim.cmd('set ft=mongodoc')
         vim.cmd('LspStop')
      end
   }
)

vim.api.nvim_create_autocmd(
   'BufEnter',
   {
      pattern = '[0-9][0-9].json',
      callback = function()
         vim.cmd('set ft=mongodoc')
         vim.cmd('LspStop')
      end
   }
)

vim.api.nvim_create_autocmd(
   'BufEnter',
   {
      pattern = '(*-query-*|*.sql)',
      callback = function()
         vim.cmd([[nmap <Space><CR> <Space>v <Plug>(DBUI_ExecuteQuery)]])
         vim.cmd([[nmap <Space><Tab> <Plug>(DBUI_SaveQuery)]])
      end
   }
)
