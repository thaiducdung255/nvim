vim.g.nvim_tree_auto_ignore_ft         = 'startify'
vim.g.nvim_tree_git_hl                 = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_icon_symlink_arrow     = '->'
vim.g.nvim_tree_show_icons             = { git = 1, folders = 1, files = 1, folder_arrows = 1 }

vim.g.nvim_tree_icons = {
   default = '',
   symlink = '',
   git     = { unstaged  = '', staged  = '✓', unmerged   = '', renamed    = '➜', untracked  = '' },
   folder  = { default   = '', open    = '', empty      = '', empty_open = '', symlink    = '' }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local list = {
   { key = Get_key_code(Keycodes.nvim_tree.edit),               cb = tree_cb('edit') },
   { key = Get_key_code(Keycodes.nvim_tree.cd),                 cb = tree_cb('cd') },
   { key = Get_key_code(Keycodes.nvim_tree.vsplit),             cb = tree_cb('vsplit') },
   { key = Get_key_code(Keycodes.nvim_tree.split),              cb = tree_cb('split') },
   { key = Get_key_code(Keycodes.nvim_tree.tabnew),             cb = tree_cb('tabnew') },
   { key = Get_key_code(Keycodes.nvim_tree.prev_sibling),       cb = tree_cb('prev_sibling') },
   { key = Get_key_code(Keycodes.nvim_tree.next_sibling),       cb = tree_cb('next_sibling') },
   { key = Get_key_code(Keycodes.nvim_tree.parent_node),        cb = tree_cb('parent_node') },
   { key = Get_key_code(Keycodes.nvim_tree.close_node),         cb = tree_cb('close_node') },
   { key = Get_key_code(Keycodes.nvim_tree.preview),            cb = tree_cb('preview') },
   { key = Get_key_code(Keycodes.nvim_tree.first_sibling),      cb = tree_cb('first_sibling') },
   { key = Get_key_code(Keycodes.nvim_tree.last_sibling),       cb = tree_cb('last_sibling') },
   { key = Get_key_code(Keycodes.nvim_tree.toggle_ignored),     cb = tree_cb('toggle_ignored') },
   { key = Get_key_code(Keycodes.nvim_tree.toggle_dotfiles),    cb = tree_cb('toggle_dotfiles') },
   { key = Get_key_code(Keycodes.nvim_tree.refresh),            cb = tree_cb('refresh') },
   { key = Get_key_code(Keycodes.nvim_tree.create),             cb = tree_cb('create') },
   { key = Get_key_code(Keycodes.nvim_tree.remove),             cb = tree_cb('remove') },
   { key = Get_key_code(Keycodes.nvim_tree.rename),             cb = tree_cb('rename') },
   { key = Get_key_code(Keycodes.nvim_tree.full_rename),        cb = tree_cb('full_rename') },
   { key = Get_key_code(Keycodes.nvim_tree.cut),                cb = tree_cb('cut') },
   { key = Get_key_code(Keycodes.nvim_tree.copy),               cb = tree_cb('copy') },
   { key = Get_key_code(Keycodes.nvim_tree.paste),              cb = tree_cb('paste') },
   { key = Get_key_code(Keycodes.nvim_tree.copy_name),          cb = tree_cb('copy_name') },
   { key = Get_key_code(Keycodes.nvim_tree.copy_path),          cb = tree_cb('copy_path') },
   { key = Get_key_code(Keycodes.nvim_tree.copy_absolute_path), cb = tree_cb('copy_absolute_path') },
   { key = Get_key_code(Keycodes.nvim_tree.prev_git_item),      cb = tree_cb('prev_git_item') },
   { key = Get_key_code(Keycodes.nvim_tree.next_git_item),      cb = tree_cb('next_git_item') },
   { key = Get_key_code(Keycodes.nvim_tree.dir_up),             cb = tree_cb('dir_up') },
   { key = Get_key_code(Keycodes.nvim_tree.close),              cb = tree_cb('close') },
   { key = Get_key_code(Keycodes.nvim_tree.toggle_help),        cb = tree_cb('toggle_help') },
}

vim.cmd([[hi link NvimTreeGitMerge Red]])
vim.cmd([[hi link NvimTreeFolderIcon Blue]])

Nmap(Keycodes.nvim_tree.toggle_open, ':NvimTreeToggle<CR>')
Nmap(Keycodes.nvim_tree.toggle_refresh, ':NvimTreeRefresh<CR>')

require'nvim-tree'.setup {
   -- nvim_tree_indent_markers = 1,
   disable_netrw      = true,
   hijack_netrw       = true,
   open_on_setup      = false,
   ignore_ft_on_setup = {},
   open_on_tab        = false,
   hijack_cursor      = false,
   update_cwd         = true,
   -- update_to_buf_dir = {
   --    enable    = true,
   --    auto_open = true,
   -- },
   diagnostics = {
      enable = true,
   },
   update_focused_file = {
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
   },
   system_open = {
      cmd  = nil,
      args = {}
   },
   view = {
      width       = 30,
      side        = 'left',
      -- auto_resize = true,
      mappings = {
         custom_only = false,
         list        = list
      }
   },
   -- filter = {
   --    dotfiles = true,
   --    custom   = { '.gitignore', 'node_modules/', 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml' }
   -- },
   git = {
      ignore = false,
   },
}
