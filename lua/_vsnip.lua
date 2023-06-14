local keycodes = {
   expand      = '<Space>',
   jump_next   = '<C-e>',
   jump_prev   = '<C-n>',
   select_text = '',
   cut_text    = ''
}

vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'
local jump_next = keycodes.jump_next
local jump_prev = keycodes.jump_prev
local expand = keycodes.expand

vim.cmd('imap <expr> ' .. expand .. ' vsnip#expandable()  ? \'<Plug>(vsnip-expand)\' : \'' .. expand .. '\'')
vim.cmd('smap <expr> ' .. expand .. ' vsnip#expandable()  ? \'<Plug>(vsnip-expand)\' : \'' .. expand .. '\'')

-- Expand or jump
-- vim.cmd([[imap <expr> <space>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<space>']])
-- vim.cmd([[smap <expr> <space>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<space>']])

-- Jump forward or backward
vim.cmd('imap <expr> ' .. jump_next .. ' vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-next)\' : \'' .. jump_next .. '\'')
vim.cmd('smap <expr> ' .. jump_next .. ' vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-next)\' : \'' .. jump_next .. '\'')

vim.cmd('smap <expr> ' .. jump_prev .. ' vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-prev)\' : \'' .. jump_prev .. '\'')
vim.cmd('imap <expr> ' .. jump_prev .. ' vsnip#jumpable(1)  ? \'<Plug>(vsnip-jump-prev)\' : \'' .. jump_prev .. '\'')

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
vim.cmd([[nmap s <Plug>(vsnip-select-text)]])
vim.cmd([[xmap s <Plug>(vsnip-select-text)]])
vim.cmd([[nmap S <Plug>(vsnip-cut-text)]])
vim.cmd([[xmap S <Plug>(vsnip-cut-text)]])

-- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
vim.cmd('let g:vsnip_filetypes = {}')
vim.cmd('let g:vsnip_filetypes.javascriptreact = [\'javascript\']')
vim.cmd('let g:vsnip_filetypes.typescriptreact = [\'typescript\']')
vim.cmd('let g:vsnip_filetypes.javascript = [\'typescript\']')
