local actions      = require('telescope.actions')
local previewers   = require('telescope.previewers')
local telescope    = require('telescope')
local action_state = require('telescope.actions.state')
local sorters      = require('telescope.sorters')

P = function(v)
   print(vim.inspect(v))
   return v
end

if pcall(require, 'plenary') then
   RELOAD = require('plenary.reload').reload_module

   R = function(name)
      RELOAD(name)
      return require(name)
   end
end

local vertical_default_conf = {
   layout_strategy = 'vertical',

   layout_config   = {
      preview_height = 0.7,
   },
}

local horizontal_default_conf = {
   layout_config = {
      preview_width = 0.75,
   },
}

local function fzf_multi_select(prompt_bufnr)
   local picker = action_state.get_current_picker(prompt_bufnr)
   local num_selections = table.getn(picker:get_multi_selection())

   if num_selections > 1 then
      picker = action_state.get_current_picker(prompt_bufnr)

      for _, entry in ipairs(picker:get_multi_selection()) do
         vim.cmd(string.format("%s %s", ":e!", entry.value))
      end

      vim.cmd('stopinsert')
   else
      actions.file_edit(prompt_bufnr)
   end
end

telescope.setup {
   defaults = {
      find_command           = { 'ag', '--ignore', '--hidden', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
      file_ignore_patterns   = { '.git/', 'node_modules/', '.package-lock.json','.pnpm-lock.json','.yarn-lock.json', 'dist/', 'debug-adapters/' },
      prompt_prefix          = '> ',
      selection_caret        = '> ',
      entry_prefix           = '  ',
      initial_mode           = 'insert',
      selection_strategy     = 'reset',
      sorting_strategy       = 'descending',
      layout_strategy        = 'horizontal',
      file_sorter            = sorters.get_fuzzy_file,
      generic_sorter         = sorters.get_generic_fuzzy_sorter,
      path_display           = { 'absolute' },
      winblend               = 0,
      border                 = {},
      borderchars            = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons         = true,
      use_less               = true,
      set_env                = { ['COLORTERM'] = 'truecolor'  },
      file_previewer         = previewers.vim_buffer_cat.new,
      grep_previewer         = previewers.vim_buffer_vimgrep.new,
      qflist_previewer       = previewers.vim_buffer_qflist.new,
      layout_config          = { width  = 0.98, height = 0.95 },
      buffer_previewer_maker = previewers.buffer_previewer_maker,

      mappings = {
         i = {
            -- ['<CR>'] = actions.select_default + actions.center
            ['<CR>'] = fzf_multi_select,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<ESC>'] = actions.close,
            ['<M-\'>'] = R('telescope').extensions.hop.hop,
         },

         n = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-o>'] = actions.smart_send_to_qflist + actions.open_qflist,
         }
      }
   },
   pickers = {
      lsp_references           = vertical_default_conf,
      lsp_document_diagnostics = vertical_default_conf,
      find_files               = horizontal_default_conf,
      oldfiles                 = horizontal_default_conf,
      buffers                  = horizontal_default_conf,
      lsp_definitions          = {
         file_ignore_patterns = { '.git/', '.dist/' },
      },
   },
   extensions = {
      hop = {
         keys = {
            'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';',
            'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p',
            'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/',
            'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ':',
            'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P',
         },

         sign_hl            = { 'WarningMsg', 'Title' },
         line_hl            = { 'CursorLine', 'Normal' },
         clear_selection_hl = false,
         trace_entry        = true,
         reset_selection    = true,
      },
      fzf = {
         fuzzy                   = true,
         override_generic_sorter = true,
         override_file_sorter    = true,
         case_mode               = 'smart_case',
      },
      media_files = {
         find_cmd = 'ag',
         filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'pdf' },
      }
   }
}

telescope.load_extension('hop')
telescope.load_extension('fzf')
telescope.load_extension('media_files')

Nmap('<LEADER>ff', ':Telescope find_files hidden=true no_ignore=true<CR>')
Nmap('<LEADER>fr', ':Telescope oldfiles hidden=true no_ignore=true<CR>')
Nmap('<LEADER>fb', ':Telescope buffers<CR>')
Nmap('<LEADER>fS', ':Telescope grep_string hidden=true no_ignore=trueg<CR>')
Nmap('<LEADER>fs', ':Telescope live_grep hidden=true no_ignore=true<CR>')

Nmap('<LEADER>cm', ':Telescope commands<CR>')
Nmap('<LEADER>ch', ':Telescope command_history<CR>')
Nmap('<LEADER>mp', ':Telescope keymaps<CR>')
Nmap('<LEADER>cs', ':Telescope colorscheme<CR>')
Nmap('<LEADER>sc', ':Telescope highlights<CR>')
Nmap('<LEADER>/',  ':Telescope current_buffer_fuzzy_find<CR>')

Nmap('gD',           ':Telescope lsp_document_diagnostics<CR>')
Nmap('gr',           ':Telescope lsp_references<CR>')
Nmap('<LEADER>gb',   ':Telescope git_branches<CR>')
Nmap('<LEADER>gd',   [[<cmd>lua require('telescope_custom-conf').delta_git_diff()<CR>]])
Nmap('<LEADER>gv',   [[<cmd>lua require('telescope_custom-conf').delta_git_bcommits()<CR>]])
Nmap('<LEADER>gc',   [[<cmd>lua require('telescope_custom-conf').delta_git_commits()<CR>]])
Nmap('<LEADER>gs',   [[<cmd>lua require('telescope_custom-conf').delta_git_status()<CR>]])
Nmap('<LEADER>zz',   [[<cmd>lua require('telescope_custom-conf').eslint_diagnostics()<CR>]])
Nmap('<LEADER>fm',   [[:lua require('telescope').extensions.media_files.media_files()<CR>]])
