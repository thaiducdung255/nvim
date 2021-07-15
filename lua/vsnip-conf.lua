-- NOTE: You can use other key to expand snippet.
vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'
-- Expand
vim.cmd([[imap <expr> <LEADER>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<LEADER>']])
vim.cmd([[smap <expr> <LEADER>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<LEADER>']])

-- Expand or jump
-- vim.cmd([[imap <expr> <tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
-- vim.cmd([[smap <expr> <tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])

-- Jump forward or backward
--vim.cmd([[imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']])
--vim.cmd([[smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']])
--vim.cmd([[imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']])
--vim.cmd([[smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>']])

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
vim.cmd([[nmap        s   <Plug>(vsnip-select-text)]])
vim.cmd([[xmap        s   <Plug>(vsnip-select-text)]])
vim.cmd([[nmap        S   <Plug>(vsnip-cut-text)]])
vim.cmd([[xmap        S   <Plug>(vsnip-cut-text)]])

-- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
vim.cmd([[let g:vsnip_filetypes = {}]])
vim.g.vsnip_filetypes.javascriptreact = {'javascript'}
vim.g.vsnip_filetypes.typescriptreact = {'typescript'}
