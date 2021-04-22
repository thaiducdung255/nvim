vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- explorer
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '-', ':RnvimrToggle<CR>', {noremap = true, silent = true})

-- better window movement
vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', {silent = true})

-- TODO fix this
-- Terminal window navigation
vim.cmd([[
  tnoremap ;;h <C-\><C-N><C-w>h
  tnoremap ;;j <C-\><C-N><C-w>j
  tnoremap ;;k <C-\><C-N><C-w>k
  tnoremap ;;l <C-\><C-N><C-w>l
  inoremap ;;h <C-\><C-N><C-w>h
  inoremap ;;j <C-\><C-N><C-w>j
  inoremap ;;k <C-\><C-N><C-w>k
  inoremap ;;l <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>
]])

-- TODO fix this
-- resize with arrows
vim.cmd([[
  nnoremap <silent> <C-k>    :resize -1<CR>
  nnoremap <silent> <C-j>  :resize +1<CR>
  nnoremap <silent> <C-h>  :vertical resize -2<CR>
  nnoremap <silent> <C-l> :vertical resize +2<CR>
]])

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- I hate escape
vim.api.nvim_set_keymap('i', 'kk', '<Right>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', 'jj', '<Left>', {noremap = true, silent = true})

-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<S-l>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-h>', ':bprevious<CR>', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
-- vim.cmd('inoremap <expr> <TAB> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <S-TAB> (\"\\<C-p>\")')

-- vim.api.nvim_set_keymap('i', '<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true})

-- vim.cmd([[
-- map p <Plug>(miniyank-autoput)
-- map P <Plug>(miniyank-autoPut)
-- map <leader>n <Plug>(miniyank-cycle)
-- map <leader>N <Plug>(miniyank-cycleback)
-- ]])
