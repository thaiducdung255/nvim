Nmap('<LEADER><CR>', [[:lua require('rest-nvim').run()<CR>]])
Nmap('<LEADER><TAB>', [[:lua require('rest-nvim').run(true)<CR>]])
vim.cmd([[autocmd FileType httpResult lua vim.bo.sw=2]])
