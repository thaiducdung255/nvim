vim.cmd('let g:floaterm_autoinsert = v:false')
vim.g.floaterm_width    = 0.90
vim.g.floaterm_height   = 0.90
vim.cmd('hi Floaterm guibg=#0d0d0d')
vim.cmd('hi FloatermBorder guibg=grey guifg=blue')

Nmap('<LEADER>:',    ':FloatermNew<CR>')
Nmap('<LEADER>,',    ':FloatermPrev<CR>')
Nmap('<LEADER>.',    ':FloatermNext<CR>')
Nmap('<LEADER>\'',   ':FloatermKill<CR>')
Nmap('<LEADER>;',    ':FloatermToggle<CR>')
