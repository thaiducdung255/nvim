local cmp = require 'cmp'
vim.opt.completeopt = 'menuone,noselect'

local lspkind = require('lspkind')

local tabnine = require('cmp_tabnine.config')

local source_mapping = {
   buffer      = '[Buf]',
   nvim_lsp    = '[Lsp]',
   nvim_lua    = '[Lua]',
   cmp_tabnine = '[Tab]',
   vsnip       = '[Snp]'
}

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
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]

			if entry.source.name == 'cmp_tabnine' then
				-- if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
				-- 	menu = entry.completion_item.data.detail .. ' ' .. menu
				-- end

				vim_item.kind = ''
         elseif entry.source.name == 'buffer' or entry.source.name == 'nvim_lsp' then
            vim_item.dup = 0
         end

			vim_item.menu = menu

			return vim_item
		end
   },
   sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      {
         name = 'buffer',
         opts = {
            get_bufnrs = function()
               return vim.api.nvim_list_bufs()
            end
         }
      },
      { name = 'path' },
      { name = 'cmp_tabnine' },
      { name = 'nvim_lua' },
   },
}

tabnine:setup({
   max_lines              = 1000;
   max_num_results        = 10;
   sort                   = true;
	run_on_every_keystroke = true;
	snippet_placeholder    = '..';
})
