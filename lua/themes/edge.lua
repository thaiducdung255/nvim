vim.g.edge_style                   = 'aura'
vim.g.edge_enable_italic           = 1
vim.g.edge_dim_foreground          = 1
vim.g.edge_disable_italic_comment  = 1
vim.g.edge_better_performance      = 1
vim.g.edge_disable_terminal_colors = 1
vim.cmd('colorscheme edge')

-- custom highlight colorscheme
-- vim.cmd('hi TabLineSel guibg=grey')
vim.cmd('hi link TSConstructor TSVariable')

-- custom LSP highlight
vim.cmd('hi LspDiagnosticsDefaultError gui=None guifg=Red')
vim.cmd('hi LspDiagnosticsDefaultWarning gui=None guifg=Orange')
vim.cmd('hi LspDiagnosticsDefaultHint gui=None')

-- custom LSP virtual text highlight
vim.cmd('hi VirtualTextError gui=None guifg=Red')
vim.cmd('hi VirtualTextWarning gui=None guifg=Orange')
vim.cmd('hi VirtualTextInfo gui=italic guifg=#dfe4ed')
vim.cmd('hi VirtualTextHint gui=None guifg=#dfe4ed')

-- tsserver custom highlight
vim.cmd('hi TSBoolean guifg=#deb974')

-- cursor line highlight
vim.cmd('hi CursorLine guibg=#2c2e42')
