vim.g.edge_style = 'default'
vim.g.edge_enable_italic = 1
vim.g.edge_disable_italic_comment = 1
vim.cmd('colorscheme edge')

vim.cmd[[function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap si :call SynStack()<CR>
]]

-- custom highlight
-- highlight .http files
-- vim.cmd('hi httpComment gui=italic guifg=#7f8490')
-- vim.cmd('hi httpMethod gui=bold guifg=#cc6600')
-- vim.cmd('hi httpPath guifg=#00cc66')

-- custom highlight colorscheme
vim.cmd('hi TabLineSel guibg=grey')
vim.cmd('hi link TSConstructor TSVariable')

-- custom LSP highlight
vim.cmd('hi LspDiagnosticsDefaultError gui=None guifg=Red')
vim.cmd('hi LspDiagnosticsDefaultWarning gui=None guifg=Orange')
vim.cmd('hi LspDiagnosticsDefaultHint gui=None')

-- custom LSP virtual text highlight
vim.cmd('hi VirtualTextError gui=None guifg=Red')
vim.cmd('hi VirtualTextWarning gui=None guifg=Orange')
vim.cmd('hi VirtualTextInfo gui=None guifg=White')
vim.cmd('hi VirtualTextHint gui=None guifg=White')

-- tsserver custom highlight
vim.cmd('hi TSBoolean guifg=#deb974')

-- cursor line highlight
vim.cmd('hi CursorLine guibg=#2c2e39')
