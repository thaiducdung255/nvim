require('global')
require('configs')
require('plugins')
require('themes')
require('mappings')
require('key_modifiers')

require('lsp')
require('lsp.ts-js')

require('compe-conf')
require('vsnip-conf')
require('numb-conf')
require('telescope-conf')
require('hop-conf')
require('auto_pairs-conf')
require('tree_sitter-conf')
require('galaxy_line-conf')
require('nvim_tree-conf')
require('git_signs-conf')
require('dashboard-conf')
require('nvim-ts-autotag')
require('bar_bar-conf')
require('vim_rest_console-conf')
require('git_blamer-conf')
require('undo_tree-conf')
require('vim_float_term-conf')
require('vim_maximizer-conf')
require('indent_blank_line-conf')
require('packer-conf')
require('comment-conf')
require('symbols_outline-conf')
require('shade-conf')
require('vgit-conf')
require('spectre-conf')
vim.cmd('source ~/.config/nvim/vim/switch-conf.vim')
