local cmp = require 'cmp'
vim.opt.completeopt = 'menuone,noselect'

local lspkind = require('lspkind')

-- local source_mapping = {
--    vsnip                   = '[Snp]',
--    buffer                  = '[Buf]',
--    nvim_lua                = '[Lua]',
--    cmdline                 = '[Cmd]',
--    cmdline_history         = '[His]',
--    nvim_lsp_signature_help = '[Arg]',
--    nvim_lsp                = '[Lsp]',
-- }

cmp.setup {
   snippet = {
      expand = function(args)
         vim.fn['vsnip#anonymous'](args.body)
      end
   },
   sorting = {
      priority_weight = 2.,
      comparators = {
         cmp.config.compare.offset,
         cmp.config.compare.exact,
         cmp.config.compare.score,
         require 'cmp-under-comparator'.under,
         cmp.config.compare.kind,
         cmp.config.compare.sort_text,
         cmp.config.compare.length,
         cmp.config.compare.order,
      },
   },
   mapping = {
      ['<Tab>']   = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-k>']   = cmp.mapping.scroll_docs(-4),
      ['<C-j>']   = cmp.mapping.scroll_docs(4),
      ['<CR>']    = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
   },
   formatting = {
      format = function(entry, vim_item)
         vim_item.kind = lspkind.presets.default[vim_item.kind]
         -- local menu = source_mapping[entry.source.name]

         if entry.source.name == 'cmdline' or entry.source.name == 'cmdline_history' then
            vim_item.dup = 0
         end

         -- vim_item.menu = menu

         return vim_item
      end
   },
   sources = {
      {
         name = 'nvim_lsp_signature_help',
         max_item_count = 15,
      },
      {
         name = 'vsnip',
         max_item_count = 10,
      },
      {
         name = 'nvim_lsp',
         max_item_count = 20,
      },
      {
         name = 'buffer',
         option = {
            get_bufnrs = function()
               return vim.api.nvim_list_bufs()
            end
         },
         max_item_count = 5,
      },
      {
         name = 'path',
         max_item_count = 5,
      },
      {
         name = 'nvim_lua',
         max_item_count = 20,
      },
   },
   view = {
      -- entries = "native"
   },
   experimental = {
      ghost_text = true
   },
   performance = {
      debounce = 200,
      throttle = 100,
      fetching_timeout = 400,
   },
}

for _, cmd_type in ipairs({ ':', '/', '?', '@', '=' }) do

   if (cmd_type == ':') then
      cmp.setup.cmdline(cmd_type, {
         sources = {
            { name = 'cmdline_history' },
            { name = 'cmdline' },
         },
      })
   else
      cmp.setup.cmdline(cmd_type, {
         sources = {
            { name = 'cmdline_history' },
         },
      })
   end
end
