-- NOTE: You can use other key to expand snippet.
vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'
-- Expand
vim.cmd([[imap <expr> <space>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<space>']])
vim.cmd([[smap <expr> <space>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<space>']])

-- Expand or jump
-- vim.cmd([[imap <expr> <space>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<space>']])
-- vim.cmd([[smap <expr> <space>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<space>']])

-- Jump forward or backward
 vim.cmd([[imap <expr> KK vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : 'KK']])
 vim.cmd([[smap <expr> KK vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)' : 'KK']])
 vim.cmd([[imap <expr> JJ vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : 'JJ']])
 vim.cmd([[smap <expr> JJ vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : 'JJ']])

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
vim.cmd([[nmap        s   <Plug>(vsnip-select-text)]])
vim.cmd([[xmap        s   <Plug>(vsnip-select-text)]])
vim.cmd([[nmap        S   <Plug>(vsnip-cut-text)]])
vim.cmd([[xmap        S   <Plug>(vsnip-cut-text)]])

-- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
vim.cmd('let g:vsnip_filetypes = {}')
vim.cmd('let g:vsnip_filetypes.javascriptreact = [\'javascript\']')
vim.cmd('let g:vsnip_filetypes.typescriptreact = [\'typescript\']')
vim.cmd('let g:vsnip_filetypes.javascript = [\'typescript\']')
