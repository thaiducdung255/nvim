local hydra    = require('_hydra')
local plug_cmd = require('_utils').plug_cmd
local cmd      = require('hydra.keymap-util').cmd

local function show_docs()
   local cw = vim.fn.expand('<cword>')
   if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
   elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
   else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
   end
end

local keymap = {
   body = 't',
   heads = {
      ndiag  = { key = 'n', fn = function() plug_cmd('coc-diagnostic-next') end },
      pdiag  = { key = 'e', fn = function() plug_cmd('coc-diagnostic-prev') end },
      diag   = { key = 'd', fn = cmd 'Telescope coc diagnostics' },
      cmd    = { key = '<cr>', fn = cmd 'Telescope coc commands' },
      impl   = { key = 'i', fn = function() plug_cmd('coc-diagnostic-implementation') end },
      rename = { key = 'r', fn = function() plug_cmd('coc-rename') end },
      ref    = { key = 'f', fn = cmd 'Telescope coc references' },
      def    = { key = 't', fn = function() plug_cmd('coc-definition') end },
      hover  = { key = 'h', fn = function() plug_cmd('coc-type-definition') end },
      sig    = { key = 's', fn = show_docs },
      help   = { key = 'c', fn = function() plug_cmd('coc-codeaction-cursor') end },
   }
}

hydra.create({
   name = 'LSP',
   keymap = keymap,
})
