vim.g.edge_style                   = 'aura'
vim.g.edge_enable_italic           = 1
vim.g.edge_dim_foreground          = 1
vim.g.edge_disable_italic_comment  = 1
vim.g.edge_better_performance      = 1
vim.g.edge_disable_terminal_colors = 1

vim.cmd [[let g:edge_colors_override = { 'black': ['#333333', '232'], 'bg0': ['#202120', '235'], 'bg2': ['#1e1e1e', '236'] }]]
vim.cmd('colorscheme edge')
