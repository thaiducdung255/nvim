local utils = require('_utils')
local keycodes = require('_keymap').nvim_tree

local map = utils.map
local get_key_code = utils.get_key_code

vim.g.nvim_tree_auto_ignore_ft     = 'startify'
vim.g.nvim_tree_icon_symlink_arrow = '->'

local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

local list = {
   { key = get_key_code(keycodes.edit), cb = tree_cb('edit') },
   { key = get_key_code(keycodes.cd), cb = tree_cb('cd') },
   { key = get_key_code(keycodes.vsplit), cb = tree_cb('vsplit') },
   { key = get_key_code(keycodes.split), cb = tree_cb('split') },
   { key = get_key_code(keycodes.tabnew), cb = tree_cb('tabnew') },
   { key = get_key_code(keycodes.prev_sibling), cb = tree_cb('prev_sibling') },
   { key = get_key_code(keycodes.next_sibling), cb = tree_cb('next_sibling') },
   { key = get_key_code(keycodes.parent_node), cb = tree_cb('parent_node') },
   { key = get_key_code(keycodes.close_node), cb = tree_cb('close_node') },
   { key = get_key_code(keycodes.preview), cb = tree_cb('preview') },
   { key = get_key_code(keycodes.first_sibling), cb = tree_cb('first_sibling') },
   { key = get_key_code(keycodes.last_sibling), cb = tree_cb('last_sibling') },
   { key = get_key_code(keycodes.toggle_ignored), cb = tree_cb('toggle_ignored') },
   { key = get_key_code(keycodes.toggle_dotfiles), cb = tree_cb('toggle_dotfiles') },
   { key = get_key_code(keycodes.refresh), cb = tree_cb('refresh') },
   { key = get_key_code(keycodes.create), cb = tree_cb('create') },
   { key = get_key_code(keycodes.remove), cb = tree_cb('remove') },
   { key = get_key_code(keycodes.rename), cb = tree_cb('rename') },
   { key = get_key_code(keycodes.full_rename), cb = tree_cb('full_rename') },
   { key = get_key_code(keycodes.cut), cb = tree_cb('cut') },
   { key = get_key_code(keycodes.copy), cb = tree_cb('copy') },
   { key = get_key_code(keycodes.paste), cb = tree_cb('paste') },
   { key = get_key_code(keycodes.copy_name), cb = tree_cb('copy_name') },
   { key = get_key_code(keycodes.copy_path), cb = tree_cb('copy_path') },
   { key = get_key_code(keycodes.copy_absolute_path), cb = tree_cb('copy_absolute_path') },
   { key = get_key_code(keycodes.prev_git_item), cb = tree_cb('prev_git_item') },
   { key = get_key_code(keycodes.next_git_item), cb = tree_cb('next_git_item') },
   { key = get_key_code(keycodes.dir_up), cb = tree_cb('dir_up') },
   { key = get_key_code(keycodes.close), cb = tree_cb('close') },
   { key = get_key_code(keycodes.toggle_help), cb = tree_cb('toggle_help') },
}

vim.cmd([[hi link NvimTreeGitMerge Red]])
vim.cmd([[hi link NvimTreeFolderIcon Blue]])

map('n', keycodes.toggle_open, ':NvimTreeToggle<CR>')
map('n', keycodes.toggle_refresh, ':NvimTreeRefresh<CR>')

require 'nvim-tree'.setup {
   auto_reload_on_write = true,
   sort_by              = 'modification_time',
   disable_netrw        = true,
   hijack_netrw         = true,
   open_on_setup        = false,
   ignore_ft_on_setup   = {},
   open_on_tab          = false,
   hijack_cursor        = false,
   update_cwd           = true,
   renderer             = {
      add_trailing           = false,
      group_empty            = false,
      highlight_git          = false,
      highlight_opened_files = 'none',
      root_folder_modifier   = ':~',
      indent_markers         = {
         enable = true,
         icons = {
            corner = '└ ',
            edge = '│ ',
            none = '  ',
         },
      },
      icons                  = {
         webdev_colors = true,
         git_placement = 'before',
         padding       = ' ',
         symlink_arrow = ' ➛ ',
         show          = {
            file         = true,
            folder       = true,
            folder_arrow = true,
            git          = true,
         },
         glyphs        = {
            default = '',
            symlink = '',
            folder = {
               arrow_closed = '',
               arrow_open   = '',
               default      = '',
               open         = '',
               empty        = '',
               empty_open   = '',
               symlink      = '',
               symlink_open = '',
            },
            git = {
               unstaged  = '',
               staged    = '✓',
               unmerged  = '',
               renamed   = '➜',
               untracked = '',
            },
         },
      },
      special_files          = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
   },
   diagnostics          = {
      enable       = true,
      show_on_dirs = true,
   },
   update_focused_file  = {
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
   },
   system_open          = {
      cmd  = nil,
      args = {}
   },
   view                 = {
      width    = 30,
      side     = 'left',
      mappings = {
         custom_only = false,
         list        = list
      }
   },
   filters              = {
      dotfiles = false,
      custom   = { '.gitignore', 'node_modules/', 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml' },
      exclude  = {},
   },
   git                  = {
      ignore  = false,
      enable  = true,
      timeout = 300,
   },
   actions              = {
      use_system_clipboard = true,
      change_dir           = {
         enable             = true,
         global             = false,
         restrict_above_cwd = false,
      },
      open_file            = {
         quit_on_open  = false,
         resize_window = true,
         window_picker = {
            enable  = true,
            chars   = 'ANRESITO',
            exclude = {
               filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
               buftype = { 'nofile', 'terminal', 'help' },
            },
         },
      },
   },
   log                  = {
      enable   = false,
      truncate = false,
      types    = {
         all         = false,
         config      = false,
         copy_paste  = false,
         diagnostics = false,
         git         = false,
         profile     = false,
      },
   },
}
