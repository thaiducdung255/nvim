local map        = require('_utils').map
local actions    = require('telescope.actions')
local previewers = require('telescope.previewers')
local telescope  = require('telescope')
local sorters    = require('telescope.sorters')
local keycodes   = require('_keymap').telescope

if pcall(require, 'plenary') then
   RELOAD = require('plenary.reload').reload_module

   R = function(name)
      RELOAD(name)
      return require(name)
   end
end

local vertical_default_conf = {
   layout_strategy = 'vertical',
   layout_config = {
      preview_height = 0.65,
   },
}

local horizontal_default_conf = {
   layout_strategy = 'horizontal',
   layout_config = {
      preview_width = 0.45,
   },
}

telescope.setup {
   defaults = {
      find_command           = {
         'ag', '--ignore', '--hidden', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'
      },
      file_ignore_patterns   = {
         '.git/', 'node_modules/', '.package-lock.json', '.pnpm-lock.yaml', '.yarn-lock.json',
         'dist/', 'debug-adapters/', '.next/', '.cache/', '.cargo/', '.gnupg/', '.oh-my-zsh/plugins/',
         '__init__.py', 'target', '@generated'
      },
      prompt_prefix          = '-> ',
      selection_caret        = '-> ',
      entry_prefix           = '   ',
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
      set_env                = { ['COLORTERM'] = 'truecolor' },
      file_previewer         = previewers.vim_buffer_cat.new,
      grep_previewer         = previewers.vim_buffer_vimgrep.new,
      qflist_previewer       = previewers.vim_buffer_qflist.new,
      layout_config          = { width = 0.999, height = 0.999 },
      buffer_previewer_maker = previewers.buffer_previewer_maker,

      mappings               = {
         i = {
            ['<C-n>'] = actions.move_selection_next,
            ['<C-e>'] = actions.move_selection_previous,
            ['<C-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
            ['<ESC>'] = actions.close,
            ['<C-i>'] = R('telescope').extensions.hop.hop,
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
      grep_string              = vertical_default_conf,
      live_grep                = vertical_default_conf,
      lsp_document_diagnostics = vertical_default_conf,
      find_files               = horizontal_default_conf,
      oldfiles                 = vertical_default_conf,
      buffers                  = horizontal_default_conf,
      lsp_definitions          = {
         file_ignore_patterns = { '.git/', '.dist/' },
      },
   },
   extensions = {
      undo = {
         use_delta = true,
         layout_strategy = 'vertical',
         layout_config = {
            preview_height = 0.8
         },
         side_by_side = true,
         mappings = {
            i = {
               ['<cr>'] = require('telescope-undo.actions').restore,
            }
         }
      },
      hop = {
         keys               = {
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
      fzy_native = {
         override_generic_sorter = true,
         override_file_sorter    = false,
      },
   }
}

telescope.load_extension('hop')
telescope.load_extension('fzy_native')
telescope.load_extension('repo')
telescope.load_extension('undo')

map('n', keycodes.files, ':Telescope find_files hidden=true<CR>')
map('n', keycodes.old_files, ':Telescope oldfiles hidden=true no_ignore=true<CR>')
map('n', keycodes.bufs, ':Telescope buffers<CR>')
map('n', keycodes.str_grep, ':Telescope grep_string hidden=true no_ignore=trueg<CR>')
map('n', keycodes.live_grep, ':Telescope live_grep hidden=true no_ignore=true<CR>')

map('n', keycodes.buf_fuzzy_find, ':Telescope current_buffer_fuzzy_find<CR>')
map('n', keycodes.lsp_type_def, ':Telescope lsp_type_definitions<CR>')

map('n', keycodes.cmd, ':Telescope commands<CR>')
map('n', keycodes.cmd_his, ':Telescope command_history<CR>')
map('n', keycodes.keymap, ':Telescope keymaps<CR>')
map('n', keycodes.highlight, ':Telescope highlights<CR>')
map('n', keycodes.lsp_doc_sym, ':Telescope lsp_document_symbols<CR>')
map('n', keycodes.lsp_doc_diag, ':Telescope lsp_document_diagnostics<CR>')
map('n', keycodes.lsp_ref, ':Telescope lsp_references<CR>')
map('n', keycodes.git_branch, ':Telescope git_branches<CR>')

local repo_dirs = [[{'~/Projects','~/Downloads','~/.config'}]]

map('n', keycodes.repo,
   [[:lua require'telescope'.extensions.repo.list{fd_opts={'--no-ignore-vcs'},search_dirs=]] .. repo_dirs .. [[}<CR>]]
)

map('n', keycodes.undo, [[:lua require'telescope'.extensions.undo.undo()<CR>]])
