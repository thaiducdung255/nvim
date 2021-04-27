-- Move to previous/next
-- Goto buffer in position...
Nmap('<leader><leader>q', ':BufferGoto 1<CR>')
Nmap('<leader><leader>w', ':BufferGoto 2<CR>')
Nmap('<leader><leader>e', ':BufferGoto 3<CR>')
Nmap('<leader><leader>r', ':BufferGoto 4<CR>')
Nmap('<leader><leader>t', ':BufferGoto 5<CR>')
Nmap('<leader><leader>a', ':BufferGoto 6<CR>')
Nmap('<leader><leader>s', ':BufferGoto 7<CR>')
Nmap('<leader><leader>d', ':BufferGoto 8<CR>')
Nmap('<leader><leader>f', ':BufferGoto 9<CR>')
Nmap('<leader><leader>g', ':BufferGoto 10<CR>')
-- Wipeout buffer
--                          :BufferWipeout<CR>
-- Close commands
--                          :BufferCloseAllButCurrent<CR>
--                          :BufferCloseBuffersLeft<CR>
--                          :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
Nmap('<C-s>', ':BufferPick<CR>')
-- Sort automatically by...
Nmap('<leader>bd', ':BufferOrderByDirectory<CR>')
Nmap('<leader>bl', ':BufferOrderByLanguage<CR>')
