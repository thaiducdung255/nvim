require('nvim-autopairs').setup()
local npairs = require('nvim-autopairs')

_G.MUtils = {}

MUtils.completion_confirm = function()
   if vim.fn.pumvisible() ~= 0 then
      if vim.fn.complete_info()['selected'] ~= -1 then
         return npairs.esc('')
      else
         vim.api.nvim_select_popupmenu_item(0, false, false, {})
         return npairs.esc('<c-n>')
      end
   else
      return npairs.check_break_line_char()
   end
end

MUtils.tab = function()
   if vim.fn.pumvisible() ~= 0 then
      return npairs.esc('<C-n>')
   else
      return npairs.esc('<Tab>')
   end
end

MUtils.s_tab = function()
   if vim.fn.pumvisible() ~= 0 then
      return npairs.esc('<C-p>')
   else
         return npairs.esc('<C-h>')
   end
end

-- Autocompletion and snippets
Imap('<CR>',      'v:lua.MUtils.completion_confirm()', { noremap = true, expr = true})
Imap('<Tab>',     'v:lua.MUtils.tab()', { noremap = true, expr = true})
Imap('<S-Tab>',   'v:lua.MUtils.s_tab()', { noremap = true, expr = true})
