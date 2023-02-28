local map                          = require('_utils').map
local keycodes                     = require('_keymap').nvim_tree

vim.g.nvim_tree_auto_ignore_ft     = 'startify'
vim.g.nvim_tree_icon_symlink_arrow = '->'

local mappings                     = {
   { key = keycodes.edit,               action = 'edit' },
   { key = keycodes.cd,                 action = 'cd' },
   { key = keycodes.vsplit,             action = 'vsplit' },
   { key = keycodes.split,              action = 'split' },
   { key = keycodes.tabnew,             action = 'tabnew' },
   { key = keycodes.prev_sibling,       action = 'prev_sibling' },
   { key = keycodes.next_sibling,       action = 'next_sibling' },
   { key = keycodes.parent_node,        action = 'parent_node' },
   { key = keycodes.close_node,         action = 'close_node' },
   { key = keycodes.preview,            action = 'preview' },
   { key = keycodes.first_sibling,      action = 'first_sibling' },
   { key = keycodes.last_sibling,       action = 'last_sibling' },
   { key = keycodes.toggle_ignored,     action = 'toggle_ignored' },
   { key = keycodes.toggle_dotfiles,    action = 'toggle_dotfiles' },
   { key = keycodes.refresh,            action = 'refresh' },
   { key = keycodes.create,             action = 'create' },
   { key = keycodes.remove,             action = 'remove' },
   { key = keycodes.rename,             action = 'rename' },
   { key = keycodes.rename,             action = 'rename_basename' },
   { key = keycodes.full_rename,        action = 'full_rename' },
   { key = keycodes.cut,                action = 'cut' },
   { key = keycodes.copy,               action = 'copy' },
   { key = keycodes.paste,              action = 'paste' },
   { key = keycodes.copy_name,          action = 'copy_name' },
   { key = keycodes.copy_path,          action = 'copy_path' },
   { key = keycodes.copy_absolute_path, action = 'copy_absolute_path' },
   { key = keycodes.prev_git_item,      action = 'prev_git_item' },
   { key = keycodes.next_git_item,      action = 'next_git_item' },
   { key = keycodes.dir_up,             action = 'dir_up' },
   { key = keycodes.close,              action = 'close' },
   { key = keycodes.toggle_help,        action = 'toggle_help' },
}

vim.cmd([[hi link NvimTreeGitMerge Red]])
vim.cmd([[hi link NvimTreeFolderIcon Blue]])

map('n', keycodes.toggle_open, ':NvimTreeToggle<CR>')
map('n', keycodes.toggle_refresh, ':NvimTreeRefresh<CR>')

require 'nvim-tree'.setup {
   sync_root_with_cwd   = true,
   respect_buf_cwd      = true,
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
            edge   = '│ ',
            none   = '  ',
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
      update_root = true,
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
   },
   system_open          = {
      cmd  = nil,
      args = {}
   },
   view                 = {
      width    = 45,
      side     = 'left',
      mappings = {
         custom_only = true,
         list        = mappings
      }
   },
   filters              = {
      dotfiles = false,
      custom   = { '.gitignore', 'node_modules/', 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', '__init__.py' },
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
