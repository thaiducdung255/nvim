local map      = require('_utils').map
local ufo      = require('ufo')

local keycodes = {
   open_all  = 'zA',
   close_all = 'zF',
}
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
map('n', keycodes.close_all, ufo.closeAllFolds)
map('n', keycodes.open_all, ufo.openAllFolds)

ufo.setup({
   provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
   end
})

vim.cmd('hi default link UfoPreviewSbar PmenuSbar')
vim.cmd('hi default link UfoPreviewThumb PmenuThumb')
vim.cmd('hi default link UfoPreviewWinBar UfoFoldedBg')
vim.cmd('hi default link UfoPreviewCursorLine Visual')
vim.cmd('hi default link UfoFoldedEllipsis Comment')
vim.cmd('hi UfoFoldedBg guibg=None')
vim.cmd('hi clear Folded')
