vim.g.nvim_tree_auto_ignore_ft     = 'startify'
vim.g.nvim_tree_icon_symlink_arrow = '->'

local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

local list = {
   { key = Get_key_code(Keycodes.nvim_tree.edit), cb = tree_cb('edit') },
   { key = Get_key_code(Keycodes.nvim_tree.cd), cb = tree_cb('cd') },
   { key = Get_key_code(Keycodes.nvim_tree.vsplit), cb = tree_cb('vsplit') },
   { key = Get_key_code(Keycodes.nvim_tree.split), cb = tree_cb('split') },
   { key = Get_key_code(Keycodes.nvim_tree.tabnew), cb = tree_cb('tabnew') },
   { key = Get_key_code(Keycodes.nvim_tree.prev_sibling), cb = tree_cb('prev_sibling') },
   { key = Get_key_code(Keycodes.nvim_tree.next_sibling), cb = tree_cb('next_sibling') },
   { key = Get_key_code(Keycodes.nvim_tree.parent_node), cb = tree_cb('parent_node') },
   { key = Get_key_code(Keycodes.nvim_tree.close_node), cb = tree_cb('close_node') },
   { key = Get_key_code(Keycodes.nvim_tree.preview), cb = tree_cb('preview') },
   { key = Get_key_code(Keycodes.nvim_tree.first_sibling), cb = tree_cb('first_sibling') },
   { key = Get_key_code(Keycodes.nvim_tree.last_sibling), cb = tree_cb('last_sibling') },
   { key = Get_key_code(Keycodes.nvim_tree.toggle_ignored), cb = tree_cb('toggle_ignored') },
   { key = Get_key_code(Keycodes.nvim_tree.toggle_dotfiles), cb = tree_cb('toggle_dotfiles') },
   { key = Get_key_code(Keycodes.nvim_tree.refresh), cb = tree_cb('refresh') },
   { key = Get_key_code(Keycodes.nvim_tree.create), cb = tree_cb('create') },
   { key = Get_key_code(Keycodes.nvim_tree.remove), cb = tree_cb('remove') },
   { key = Get_key_code(Keycodes.nvim_tree.rename), cb = tree_cb('rename') },
   { key = Get_key_code(Keycodes.nvim_tree.full_rename), cb = tree_cb('full_rename') },
   { key = Get_key_code(Keycodes.nvim_tree.cut), cb = tree_cb('cut') },
   { key = Get_key_code(Keycodes.nvim_tree.copy), cb = tree_cb('copy') },
   { key = Get_key_code(Keycodes.nvim_tree.paste), cb = tree_cb('paste') },
   { key = Get_key_code(Keycodes.nvim_tree.copy_name), cb = tree_cb('copy_name') },
   { key = Get_key_code(Keycodes.nvim_tree.copy_path), cb = tree_cb('copy_path') },
   { key = Get_key_code(Keycodes.nvim_tree.copy_absolute_path), cb = tree_cb('copy_absolute_path') },
   { key = Get_key_code(Keycodes.nvim_tree.prev_git_item), cb = tree_cb('prev_git_item') },
   { key = Get_key_code(Keycodes.nvim_tree.next_git_item), cb = tree_cb('next_git_item') },
   { key = Get_key_code(Keycodes.nvim_tree.dir_up), cb = tree_cb('dir_up') },
   { key = Get_key_code(Keycodes.nvim_tree.close), cb = tree_cb('close') },
   { key = Get_key_code(Keycodes.nvim_tree.toggle_help), cb = tree_cb('toggle_help') },
}

vim.cmd([[hi link NvimTreeGitMerge Red]])
vim.cmd([[hi link NvimTreeFolderIcon Blue]])

Nmap(Keycodes.nvim_tree.toggle_open, ':NvimTreeToggle<CR>')
Nmap(Keycodes.nvim_tree.toggle_refresh, ':NvimTreeRefresh<CR>')

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
