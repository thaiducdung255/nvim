require('nvim-autopairs').setup()
local npairs = require('nvim-autopairs')

_G.MUtils = {}

-- TEST
vim.g.completion_confirm_key = ''

MUtils.completion_confirm = function()
   if vim.fn.pumvisible() ~= 0 then
      if vim.fn.complete_info()['selected'] ~= -1 then
         vim.fn['compe#confirm']()
         -- return npairs.esc('<c-y>')
         return npairs.esc('')
      else
         vim.defer_fn(function()
            vim.fn['compe#confirm']('<cr>')
         end, 20)
         return npairs.esc('<c-n>')
      end
   else
      return npairs.check_break_line_char()
   end
end
-- TEST

MUtils.completion_confirm = function()
   if vim.fn.pumvisible() ~= 0 then
      if vim.fn.complete_info()['selected'] ~= -1 then
         vim.fn['compe#confirm']()
         return npairs.esc('')
      else
         vim.api.nvim_select_popupmenu_item(0, false, false, {})
         vim.fn['compe#confirm']()
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
      if vim.fn['vsnip#available'](1) ~= 0 then
         vim.fn.feedkeys(string.format('%c%c%c(vsnip-expand-or-jump)', 0x80, 253, 83))
         return npairs.esc('')
      else
         return npairs.esc('<Tab>')
      end
   end
end

MUtils.s_tab = function()
   if vim.fn.pumvisible() ~= 0 then
      return npairs.esc('<C-p>')
   else
      if vim.fn['vsnip#jumpable'](-1) ~= 0 then
         vim.fn.feedkeys(string.format('%c%c%c(vsnip-jump-prev)', 0x80, 253, 83))
         return npairs.esc('')
      else
         return npairs.esc('<C-h>')
      end
   end
end

-- Autocompletion and snippets
Imap('<CR>',      'v:lua.MUtils.completion_confirm()', { noremap = true, expr = true})
Imap('<Tab>',     'v:lua.MUtils.tab()', { noremap = true, expr = true})
Imap('<S-Tab>',   'v:lua.MUtils.s_tab()', { noremap = true, expr = true})
-- Imap('<CR>', 'v:lua.MUtils.completion_confirm()')
