vim.cmd('let g:floaterm_autoinsert = v:false')
vim.g.floaterm_width    = 0.9
vim.g.floaterm_height   = 0.9

Nmap('<leader>:',    ':FloatermNew<CR>')
Nmap('<leader>,',    ':FloatermPrev<CR>')
Nmap('<leader>.',    ':FloatermNext<CR>')
Nmap('<leader>\'',   ':FloatermKill<CR>')
Nmap('<leader>;',    ':FloatermToggle<CR>')
