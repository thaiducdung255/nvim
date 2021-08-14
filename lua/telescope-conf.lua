local actions = require('telescope.actions')
-- Global remapping
------------------------------
-- '--color=never',
require('telescope').setup {
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
      file_ignore_patterns = { '.git', 'node_modules', '.package-lock.json' },
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

      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
      mappings = {
         i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            -- To disable a keymap, put [map] = false
            -- So, to not map '<C-n>', just put
            -- ['<c-x>'] = false,
            ['<ESC>'] = actions.close,

            -- Otherwise, just set the mapping to the function that you want it to be.
            -- ['<C-i>'] = actions.select_horizontal,

            -- Add up multiple actions
            ['<CR>'] = actions.select_default + actions.center

            -- You can perform as many actions in a row as you like
            -- ['<CR>'] = actions.select_default + actions.center + my_cool_custom_action,
         },
         n = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
         }
      }
   }
}

Nmap('<LEADER>ff', ':Telescope find_files hidden=true no_ignore=true<CR>')
Nmap('<LEADER>fr', ':Telescope oldfiles hidden=true no_ignore=true<CR>')
Nmap('<LEADER>fb', ':Telescope buffers<CR>')
Nmap('<LEADER>fS', ':Telescope grep_strin hidden=true no_ignore=trueg<CR>')
Nmap('<LEADER>fs', ':Telescope live_grep hidden=true no_ignore=true<CR>')

Nmap('<LEADER>cm', ':Telescope commands<CR>')
Nmap('<LEADER>ch', ':Telescope command_history<CR>')
Nmap('<LEADER>km', ':Telescope keymaps<CR>')

Nmap('<LEADER>cs', ':Telescope colorscheme<CR>')
Nmap('<LEADER>sc', ':Telescope hilights<CR>')

Nmap('<LEADER>gb', ':Telescope git_branches<CR>')
Nmap('<LEADER>gc', ':Telescope git_commits<CR>')
Nmap('<LEADER>gs', ':Telescope git_status<CR>')
Nmap('gD', ':Telescope lsp_definitions<CR>')
Nmap('gr', ':Telescope lsp_references<CR>')
