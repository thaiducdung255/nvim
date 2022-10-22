vim.g.edge_style                     = 'aura'
vim.g.edge_enable_italic             = 1
vim.g.edge_dim_foreground            = 1
vim.g.edge_disable_italic_comment    = 1
vim.g.edge_better_performance        = 1
vim.g.edge_disable_terminal_colors   = 1
vim.g.edge_menu_selection_background = 'red'

vim.g.edge_colors_override = {
   none       = { 'NONE', 'NONE' },
   black      = { '#202023', '232' }, -- window border bg color
   bg0        = { '#0a0a0a', '235' }, -- bg color
   bg1        = { '#33353f', '235' }, -- status bar > empty bg color
   bg2        = { '#202023', '236' }, -- auto complete window bg color
   bg4        = { '#202023', '236' }, -- status bar > file name bg color
   cyan       = { '#5dbbc1', '100' }, -- ts bracket color
   purple     = { '#d38aea', '100' }, -- ts import color
   bg_grey    = { '#33353f', '100' }, -- lsp auto complete window scrollbar
   bg3        = { '#ec0000', '236' },
   green      = { '#a0c980', '100' },
   bg_green   = { '#a0c980', '100' },
   diff_green = { '#394634', '100' },
   blue       = { '#6cb6eb', '100' },
   bg_blue    = { '#6cb6eb', '100' },
   diff_blue  = { '#354157', '100' },
   -- red         = {},
   -- bg_red      = {},
   -- diff_red    = {},
   -- yellow      = {},
   -- diff_yellow = {},
}

vim.cmd('colorscheme edge')

vim.cmd('hi BufferLineFill guibg=#33353f') -- buffer line empty space

vim.cmd('hi BufferLineBackground guibg=#070707 guifg=#33353f') -- bufferline not visible
vim.cmd('hi BufferLineSeparator guibg=#070707 guifg=#33353f') -- bufferline sep not visible

vim.cmd('hi BufferLineSeparatorSelected guifg=#33353f') -- bufferline sep selected
vim.cmd('hi BufferLineSeparatorVisible guifg=#33353f guibg=#070707') -- bufferline sep selected

vim.cmd('hi BufferLineBufferVisible guibg=#070707 guifg=White') -- bufferline visible
vim.cmd('hi BufferLineBufferSelected guifg=#6cb6eb') -- bufferline selected

vim.cmd('hi BufferLineTab guibg=#202023 guifg=#33353f') -- buffer tab index indicator
vim.cmd('hi BufferLineTabSeparator guibg=#33353f guifg=#202023') -- buffer tab index indicator
vim.cmd('hi BufferLineTabSeparatorSelected guibg=#33353f guifg=#0a0a0a') -- buffer tab index indicator
vim.cmd('hi BufferLineTabSelected guifg=#6cb6eb') -- buffer tab index indicator

vim.cmd('hi PmenuSel guibg=#33353f') -- completion menu custom
