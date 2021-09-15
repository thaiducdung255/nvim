local actions = require('telescope.actions')
local telescope = require('telescope')
local action_state = require('telescope.actions.state')

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
      find_command         = { 'ag', '--ignore', '--hidden', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', },
      prompt_prefix        = '> ',
      selection_caret      = '> ',
      entry_prefix         = '  ',
      initial_mode         = 'insert',
      selection_strategy   = 'reset',
      sorting_strategy     = 'descending',
      layout_strategy      = 'horizontal',
      file_sorter          = require'telescope.sorters'.get_fuzzy_file,
      file_ignore_patterns = { '.git/', 'node_modules/', '.package-lock.json', 'dist/' },
      generic_sorter       = require'telescope.sorters'.get_generic_fuzzy_sorter,
      path_display         = { 'absolute' },
      winblend             = 0,
      border               = {},
      borderchars          = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      color_devicons       = true,
      use_less             = true,
      set_env              = { ['COLORTERM'] = 'truecolor'  }, -- default = nil,
      file_previewer       = require'telescope.previewers'.vim_buffer_cat.new,
      grep_previewer       = require'telescope.previewers'.vim_buffer_vimgrep.new,
      qflist_previewer     = require'telescope.previewers'.vim_buffer_qflist.new,
      layout_config        = {
         width         = 0.98,
         height        = 0.95,
      },

      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
      mappings = {
         i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<ESC>'] = actions.close,
            ['<C-h>'] = R('telescope').extensions.hop.hop,

            -- Add up multiple actions
            -- ['<CR>'] = actions.select_default + actions.center
            ['<CR>'] = fzf_multi_select,
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
      -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
      -- shown keys here are only subset of defaults!
      keys = {
         'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';',
         'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p',
         'z', 'x', 'c', 'v', 'b', 'n', 'm', ',', '.', '/',
         'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ':',
         'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P',
      },

      -- Highlight groups to link to signs and lines; the below configuration refers to demo
      -- sign_hl typically only defines foreground to possibly be combined with line_hl
      sign_hl = { 'WarningMsg', 'Title' },

      -- optional, typically a table of two highlight groups that are alternated between
      line_hl = { 'CursorLine', 'Normal' },

      -- options specific to `hop_loop`
      -- true temporarily disables Telescope selection highlighting
      clear_selection_hl = false,

      -- highlight hopped to entry with telescope selection highlight
      -- note: mutually exclusive with `clear_selection_hl`
      trace_entry = true,

      -- jump to entry where hoop loop was started from
      reset_selection = true,
    },
  }
}

telescope.load_extension('hop')

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



Nmap('gD', ':Telescope lsp_document_diagnostics<CR>')
Nmap('gr', ':Telescope lsp_references<CR>')
Nmap('<LEADER>gb', ':Telescope git_branches<CR>')
Nmap('<LEADER>gd', [[<cmd>lua require('telescope_custom-conf').delta_git_diff()<CR>]])
Nmap('<LEADER>gv', [[<cmd>lua require('telescope_custom-conf').delta_git_bcommits()<CR>]])
Nmap('<LEADER>gc', [[<cmd>lua require('telescope_custom-conf').delta_git_commits()<CR>]])
Nmap('<LEADER>gs', [[<cmd>lua require('telescope_custom-conf').delta_git_status()<CR>]])
Nmap('<LEADER>zz', [[<cmd>lua require('telescope_custom-conf').eslint_diagnostics()<CR>]])
