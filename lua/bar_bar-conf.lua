Nmap('<Tab>', ':BufferPick<CR>')
Nmap('<LEADER>bs', ':BufferOrderByBufferNumber<CR>')

vim.g.bufferline = {
   animation        = false,
   auto_hide        = false,
   tabpages         = true,
   closable         = false,
   clickable        = false,
   icons            = false,
   insert_at_end    = true,
   maximum_padding  = 1,
   maximum_length   = 40,
   semantic_letters = true,
   no_name_title    = '<unnamed>',
}

vim.cmd([[hi BufferCurrent guibg=#002966]])
vim.cmd([[hi BufferCurrentSign guibg=#002966]])
vim.cmd([[hi BufferCurrentMod guibg=#002966 gui=bold,italic guifg=#deb974]])

vim.cmd([[hi BufferVisible guibg=#808080]])
vim.cmd([[hi BufferVisibleSign guibg=#808080]])
vim.cmd([[hi BufferVisibleMod guibg=#808080 gui=bold,italic guifg=#2c2e34]])

vim.cmd([[hi BufferInactiveMod gui=bold,italic guifg=#deb974]])
vim.cmd([[hi BufferInactive gui=none]])
