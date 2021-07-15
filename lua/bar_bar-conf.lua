-- Move to previous/next
-- Goto buffer in position...
Nmap('<LEADER><LEADER>q', ':BufferGoto 1<CR>')
Nmap('<LEADER><LEADER>w', ':BufferGoto 2<CR>')
Nmap('<LEADER><LEADER>e', ':BufferGoto 3<CR>')
Nmap('<LEADER><LEADER>r', ':BufferGoto 4<CR>')
Nmap('<LEADER><LEADER>t', ':BufferGoto 5<CR>')
Nmap('<LEADER><LEADER>a', ':BufferGoto 6<CR>')
Nmap('<LEADER><LEADER>s', ':BufferGoto 7<CR>')
Nmap('<LEADER><LEADER>d', ':BufferGoto 8<CR>')
Nmap('<LEADER><LEADER>f', ':BufferGoto 9<CR>')
Nmap('<LEADER><LEADER>g', ':BufferGoto 10<CR>')
-- Wipeout buffer
--                          :BufferWipeout<CR>
-- Close commands
--                          :BufferCloseAllButCurrent<CR>
--                          :BufferCloseBuffersLeft<CR>
--                          :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
Nmap('<C-s>', ':BufferPick<CR>')

-- Sort automatically by...
Nmap('<LEADER>bd', ':BufferOrderByDirectory<CR>')
Nmap('<LEADER>bl', ':BufferOrderByLanguage<CR>')
