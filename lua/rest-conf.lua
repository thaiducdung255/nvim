Nmap('<LEADER><CR>', ':lua require(\'rest-nvim\').run()<CR>')
Nmap('<LEADER><TAB>', ':lua require(\'rest-nvim\').run(true)<CR>')
vim.cmd('autocmd BufEnter,BufNew *.http set ft=http')
vim.cmd('autocmd FileType httpResult set sw=2')
