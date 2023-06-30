vim.g.indent_blankline_filetype_exclude               = {
   'lspinfo', 'text', 'coc-explorer', 'dashboard',
   'packer', 'help', 'toggleterm', ''
}

vim.g.indent_blankline_use_treesitter                 = true
vim.g.indent_blankline_show_current_context           = true
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_char                           = '¦'
vim.g.indent_blankline_context_char                   = '│'
vim.cmd('hi IndentBlanklineContextChar cterm=nocombine ctermfg=100 gui=nocombine guifg=#a8a8a8')
