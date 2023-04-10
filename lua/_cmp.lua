local cmp = require 'cmp'
local lspkind = require('lspkind')

local keycodes = require('_keymap').cmp

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
         cmp.config.compare.kind,
         cmp.config.compare.score,
         require 'cmp-under-comparator'.under,
         cmp.config.compare.sort_text,
         cmp.config.compare.length,
         cmp.config.compare.order,
      },
   },
   mapping = cmp.mapping.preset.insert({
      [keycodes.scroll_docs_up] = cmp.mapping(
         cmp.mapping.scroll_docs(-1),
         { 'i', 'c' }
      ),
      [keycodes.scroll_docs_down] = cmp.mapping(
         cmp.mapping.scroll_docs(1),
         { 'i', 'c' }
      ),
      [keycodes.confirm] = cmp.mapping.confirm { select = true },
      [keycodes.select_next_item] = cmp.mapping(
         function(fallback)
            if cmp.visible() then
               cmp.select_next_item()
            else
               fallback()
            end
         end,
         { 'i', 'c' }
      ),
      [keycodes.select_prev_item] = cmp.mapping(
         function(fallback)
            if cmp.visible() then
               cmp.select_prev_item()
            else
               fallback()
            end
         end,
         { 'i', 'c' }
      ),
   }),
   formatting = {
      format = lspkind.cmp_format({
         mode = 'symbol',
         maxwidth = 50,
         ellipsis_char = '...',
         symbol_map = {
            Codeium = '󰛩',
         }
      })
   },
   sources = {
      {
         name           = 'codeium',
         max_item_count = 10,
      },
      {
         name           = 'calc',
         max_item_count = 2,
      },
      {
         name           = 'nvim_lsp_signature_help',
         max_item_count = 13,
      },
      {
         name           = 'nvim_lsp_document_symbol',
         max_item_count = 5,
      },
      {
         name           = 'vsnip',
         max_item_count = 5,
      },
      {
         name           = 'nvim_lsp',
         max_item_count = 20,
      },
      {
         name = 'buffer',
         option = {
            get_bufnrs = function()
               return vim.api.nvim_list_bufs()
            end
         },
         max_item_count = 7,
         keyword_length = 3,
      },
      {
         name           = 'async_path',
         max_item_count = 20,
      },
      {
         name           = 'nvim_lua',
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
      debounce         = 250,
      throttle         = 250,
      fetching_timeout = 5000,
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
      if (cmd_type == '/') then
         cmp.setup.cmdline('/', {
            sources = cmp.config.sources(
               {
                  { name = 'nvim_lsp_document_symbol' }
               },
               {
                  { name = 'buffer' }
               },
               {
                  { name = 'cmdline_history' },
               }
            )
         })
      else
         cmp.setup.cmdline(cmd_type, {
            sources = {
               { name = 'cmdline_history' },
            },
         })
      end
   end
end
