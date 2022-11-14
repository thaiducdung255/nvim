local map      = require('_utils').map
local keycodes = require('_keymap').ufo
local ufo      = require('ufo')

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
map('n', keycodes.close_all, ufo.closeAllFolds)
map('n', keycodes.open_all, ufo.openAllFolds)

ufo.setup({
   provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
   end
})
