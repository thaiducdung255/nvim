vim.g.db_ui_show_help          = 0
vim.g.db_ui_use_nerd_fonts     = 1
vim.g.db_ui_show_database_icon = 1

vim.cmd([[map zz normal V | execute 'normal \<Plug>(DBUI_ExecuteQuery)']])
vim.cmd([[nmap sf <Plug>(DBUI_SaveQuery)]])

vim.cmd([[au BufEnter [0-9].json set ft=mongodoc]])
vim.cmd([[au BufEnter [0-9][0-9].json set ft=mongodoc]])

vim.cmd([[au BufEnter,BufNew [0-9].json LspStop]])
vim.cmd([[au BufEnter,BufNew [0-9][0-9].json LspStop]])
vim.cmd([[au BufLeave [0-9].json LspStart]])
vim.cmd([[au BufLeave [0-9][0-9].json LspStart]])

vim.cmd([[au BufEnter,BufNew *b-query-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]* set ft=mongodb]])
vim.cmd([[au BufEnter *MongoDb set ft=mongodb]])
