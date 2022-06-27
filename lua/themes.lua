vim.cmd [[function! SynStack()
   if !exists("*synstack")
      return
   endif

   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
   endfunc

   nnoremap <LEADER>sy :call SynStack()<CR>
]]

require('themes/' .. vim.g.theme)

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
