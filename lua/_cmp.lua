local cmp = require 'cmp'
local get_key_code = require('_utils').get_key_code
local keycodes = require('_keymap').cmp

local lspkind = require('lspkind')

-- local source_mapping = {
--    vsnip                   = 'ﬕ',
--    buffer                  = '',
--    nvim_lua                = '',
--    cmdline                 = '',
--    cmdline_history         = '',
--    nvim_lsp_signature_help = '',
--    nvim_lsp                = '',
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
         cmp.config.compare.kind,
         cmp.config.compare.score,
         require 'cmp-under-comparator'.under,
         cmp.config.compare.sort_text,
         cmp.config.compare.length,
         cmp.config.compare.order,
      },
   },
   mapping = {
      [get_key_code(keycodes.select_next_item)] = cmp.mapping(
         cmp.mapping.select_next_item(),
         { 'i', 'c' }
      ),

      [get_key_code(keycodes.select_prev_item)] = cmp.mapping(
         cmp.mapping.select_prev_item(),
         { 'i', 'c' }
      ),

      [get_key_code(keycodes.scroll_docs_up)]   = cmp.mapping.scroll_docs(-4),
      [get_key_code(keycodes.scroll_docs_down)] = cmp.mapping.scroll_docs(4),

      [get_key_code(keycodes.confirm)] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true
      }),
   },
   formatting = {
      format = function(entry, vim_item)

         vim_item.kind = lspkind.presets.default[vim_item.kind]

         -- if entry.source.name == 'buffer' then
         -- vim_item.dup = 0
         -- end
         -- local menu = source_mapping[entry.source.name]

         -- if entry.source.name == 'cmdline' or entry.source.name == 'cmdline_history' then
         -- vim_item.dup = 0
         -- end

         -- vim_item.menu = menu

         return vim_item
      end
   },
   sources = {
      {
         name = 'nvim_lsp_signature_help',
         max_item_count = 13,
      },
      {
         name = 'vim-dadbod-completion',
         max_item_count = 10,
      },
      {
         name = 'vsnip',
         max_item_count = 5,
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
         max_item_count = 7,
         keyword_length = 3,
      },
      {
         name = 'path',
         max_item_count = 25,
      },
      {
         name = 'nvim_lua',
         max_item_count = 20,
      },
      {
         name = 'zsh',
         max_item_count = 10,
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
