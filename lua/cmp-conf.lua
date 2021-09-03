local cmp = require'cmp'

cmp.setup {
   snippet = {
      expand = function(args)
         vim.fn['vsnip#anonymous'](args.body)
      end
   },
   sorting = {
      priority_weight = 2.,
      comparators = {},
   },
   mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<S-Tab>'] = cmp.mapping.select_prev_item(),
   },
   formatting = {
      format = function(entry, vim_item)
         vim_item.menu = ({
            nvim_lsp    = '[LS]',
            nvim_lua    = '[LS]',
            path        = '[DIR]',
            vsnip       = '[SNP]',
            buffer      = '[BUF]',
            cmp_tabnine = '[TN]'
         })[entry.source.name]

         if entry.source.name == 'nvim_lsp' then
            vim_item.dup = 0
         end

         return vim_item
      end
   },
   sources = {
      { name = 'vsnip' },
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'cmp_tabnine' },
      { name = 'path' },
      {
         name = 'buffer',
         opts = {
--             get_bufnrs = function()
--                local bufs = {}
-- 
--                for _, win in ipairs(vim.api.nvim_list_wins()) do
--                   bufs[vim.api.nvim_win_get_buf(win)] = true
--                   end
--                return vim.tbl_keys(bufs) 
--             end
         }
      },
   },
}
