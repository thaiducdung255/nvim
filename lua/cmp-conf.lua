local cmp = require 'cmp'
vim.opt.completeopt = 'menuone,noselect'

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
            path        = '[DIR]',
            vsnip       = '[SNP]',
            buffer      = '[BUF]',
         })[entry.source.name]

         if entry.source.name == 'nvim_lsp' then
            vim_item.dup = 0
         end
         
         return vim_item
      end
   },
   sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'path' },
      {
         name = 'buffer',
         opts = {
            get_bufnrs = function()
               return vim.api.nvim_list_bufs()
            end
         }
      },
   },
}
