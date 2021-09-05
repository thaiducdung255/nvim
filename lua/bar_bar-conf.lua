Nmap('<Tab>', ':BufferPick<CR>')
Nmap('<LEADER>bs', ':BufferOrderByBufferNumber<CR>')

vim.g.bufferline = {
   animation        = true,
   auto_hide        = false,
   tabpages         = true,
   closable         = false,
   clickable        = false,
   icons            = true,
   insert_at_end    = true,
   maximum_padding  = 1,
   maximum_length   = 20,
   semantic_letters = true,
   no_name_title    = '<unnamed>',
}
