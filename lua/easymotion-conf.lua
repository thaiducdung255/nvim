vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1

vim.cmd('nmap <LEADER>g <plug>(easymotion-bd-jk)')
vim.cmd('map <LEADER>g <plug>(easymotion-overwin-line)')

vim.cmd('map <LEADER>i <plug>(easymotion-bd-f2)')
vim.cmd('nmap <LEADER>i <plug>(easymotion-overwin-f2)')

vim.cmd('map <LEADER>o <plug>(easymotion-bd-f)')
vim.cmd('nmap <LEADER>o <plug>(easymotion-overwin-f)')

vim.cmd('map <LEADER><LEADER> <plug>(easymotion-bd-w)')
vim.cmd('nmap <LEADER><LEADER> <plug>(easymotion-overwin-w)')
