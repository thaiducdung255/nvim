require('_themes/' .. vim.g.theme)

vim.cmd [[function! SynStack()
   if !exists("*synstack")
      return
   endif

   echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
   endfunc

   nnoremap <LEADER>sy :call SynStack()<CR>
]]

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
vim.cmd('hi Visual gui=None guibg=#838383')
vim.cmd('hi VirtualTextInfo gui=italic guifg=#dfe4ed')
vim.cmd('hi VirtualTextHint gui=None guifg=#dfe4ed')

-- vim.cmd('hi TabLine gui=None guibg=Red guifg=Red ctermbg=Red ctermfg=Red')
-- vim.cmd('hi TabLineFill gui=None guibg=Blue guifg=Blue ctermbg=Blue ctermfg=Blue')
-- vim.cmd('hi TabLineSel gui=None guibg=Green guifg=Green ctermbg=Green ctermfg=Green')

-- tsserver custom highlight
vim.cmd('hi TSBoolean guifg=#deb974')

-- cursor line highlight
vim.cmd('hi CursorLineNr guifg=Red')
vim.cmd('hi CursorLine guibg=#0a0a0a')
