vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_smartcase = 1

vim.cmd('nmap <LEADER>gl <plug>(easymotion-bd-jk)')
vim.cmd('map <LEADER>gl <plug>(easymotion-overwin-line)')

vim.cmd('map <LEADER>gd <plug>(easymotion-bd-f2)')
vim.cmd('nmap <LEADER>gd <plug>(easymotion-overwin-f2)')

vim.cmd('map <LEADER>gs <plug>(easymotion-bd-f)')
vim.cmd('nmap <LEADER>gs <plug>(easymotion-overwin-f)')

vim.cmd('map <LEADER>gw <plug>(easymotion-bd-w)')
vim.cmd('nmap <leader>gw <plug>(easymotion-overwin-w)')
