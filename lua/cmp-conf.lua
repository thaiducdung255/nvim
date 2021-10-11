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
      comparators = {
         function(e1, e2)
            local diff
            diff = cmp.config.compare.offset(e1, e2)
            print()

            if diff ~= nil then
               return diff
            end

            diff = cmp.config.compare.exact(e1, e2)
            if diff ~= nil then
               return diff
            end

            diff = cmp.config.compare.score(e1, e2)

            if diff ~= nil then
               return diff
            end

            diff = cmp.config.compare.kind(e1, e2)

            if diff ~= nil then
               return diff
            end

            diff = cmp.config.compare.sort_text(e1, e2)

            if diff ~= nil then
               return diff
            end

            diff = cmp.config.compare.length(e1, e2)

            if diff ~= nil then
               return diff
            end

            return cmp.config.compare.order(e1, e2)
         end,
      },
   },
   mapping = {
      ['<Tab>']   = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<CR>']    = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
   },
   formatting = {
      format = function(entry, vim_item)
         vim_item.menu = ({
            nvim_lsp    = '[LS]',
            path        = '[DIR]',
            vsnip       = '[SNP]',
            buffer      = '[BUF]',
         })[entry.source.name]

         if entry.source.name == 'buffer' then
            vim_item.dup = 0
         end
         return vim_item
      end
   },
   sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      -- { name = 'path' },
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
