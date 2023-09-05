local map                          = require('_utils').map

local keycodes                     = {
   toggle = 'T',
   nav = {
      exit  = '<ESC>',
      close = 'h'
   },
   fs = {
      rename        = 'R',
      rename_base   = 'r',
      create        = 'a',
      remove        = 'd',
      cut           = 'x',
      paste         = 'p',
      copy          = 'c',
      copy_name     = 'y',
      copy_rel_path = '<C-y>',
      copy_abs_path = '<C-Y>',
   },
   tree = {
      exit                 = '<ESC>',
      toggle_help          = '?',
      cd                   = '<C-CR>',
      toggle_gitignore     = 'I',
      toggle_dotfiles      = 'Z',
      toggle_custom_hidden = 'C',
      refresh              = 'L',
      search               = 'ss'
   },
   open = {
      edit    = '<CR>',
      expand  = 'i',
      tab     = 't',
      preview = '<TAB>',
      hsplit  = 'sn',
      vsplit  = 'se',
      info    = '<LEADER>.',
   },
   filter = {
      start = 'f',
      close = 'z'
   },
}

vim.g.nvim_tree_auto_ignore_ft     = 'startify'
vim.g.nvim_tree_icon_symlink_arrow = '->'

local function on_attach(bufnr)
   local api = require('nvim-tree.api')

   local function opts(desc)
      return {
         desc    = desc,
         buffer  = bufnr,
         noremap = true,
         silent  = true,
         nowait  = true,
      }
   end

   vim.keymap.set('n', keycodes.fs.rename, api.fs.rename, opts('rename'))
   vim.keymap.set('n', keycodes.fs.rename_base, api.fs.rename_basename, opts('rename basename'))
   vim.keymap.set('n', keycodes.fs.create, api.fs.create, opts('create'))
   vim.keymap.set('n', keycodes.fs.remove, api.fs.remove, opts('remove'))
   vim.keymap.set('n', keycodes.fs.cut, api.fs.cut, opts('cut'))
   vim.keymap.set('n', keycodes.fs.paste, api.fs.paste, opts('paste'))
   vim.keymap.set('n', keycodes.fs.copy, api.fs.copy.node, opts('copy file'))
   vim.keymap.set('n', keycodes.fs.copy_name, api.fs.copy.filename, opts('copy file'))
   vim.keymap.set('n', keycodes.fs.copy_abs_path, api.fs.copy.absolute_path, opts('copy abs path'))
   vim.keymap.set('n', keycodes.fs.copy_rel_path, api.fs.copy.relative_path, opts('copy rel path'))

   vim.keymap.set('n', keycodes.tree.toggle_help, api.tree.toggle_help, opts('help'))
   vim.keymap.set('n', keycodes.tree.cd, api.tree.change_root_to_node, opts('cd'))
   vim.keymap.set('n', keycodes.tree.toggle_dotfiles, api.tree.toggle_hidden_filter, opts('toggle dotfiles'))
   vim.keymap.set('n', keycodes.tree.toggle_gitignore, api.tree.toggle_gitignore_filter, opts('toggle git ignore'))
   vim.keymap.set('n', keycodes.tree.toggle_custom_hidden, api.tree.toggle_custom_filter, opts('toggle custom hidden'))
   vim.keymap.set('n', keycodes.tree.refresh, api.tree.reload, opts('reload'))
   vim.keymap.set('n', keycodes.tree.search, api.tree.search_node, opts('search'))
   vim.keymap.set('n', keycodes.tree.exit, api.tree.close, opts('exit'))

   vim.keymap.set('n', keycodes.open.edit, api.node.open.edit, opts('edit'))
   vim.keymap.set('n', keycodes.open.expand, api.node.open.edit, opts('expand'))
   vim.keymap.set('n', keycodes.open.tab, api.node.open.tab, opts('open in new tab'))
   vim.keymap.set('n', keycodes.open.preview, api.node.open.preview, opts('preview'))
   vim.keymap.set('n', keycodes.open.hsplit, api.node.open.horizontal, opts('open horizontal split'))
   vim.keymap.set('n', keycodes.open.vsplit, api.node.open.vertical, opts('open vertical split'))
   vim.keymap.set('n', keycodes.open.info, api.node.show_info_popup, opts('info'))
   vim.keymap.set('n', keycodes.nav.close, api.node.navigate.parent_close, opts('close'))
end

vim.cmd([[hi link NvimTreeGitMerge Red]])
vim.cmd([[hi link NvimTreeFolderIcon Blue]])

map('n', keycodes.toggle, ':NvimTreeToggle<CR>')

require 'nvim-tree'.setup {
   on_attach                          = on_attach,
   auto_reload_on_write               = true,
   disable_netrw                      = true,
   hijack_cursor                      = false,
   hijack_netrw                       = true,
   hijack_unnamed_buffer_when_opening = false,
   sort_by                            = 'modification_time',
   root_dirs                          = {},
   prefer_startup_root                = true,
   sync_root_with_cwd                 = true,
   reload_on_bufenter                 = false,
   respect_buf_cwd                    = true,
   select_prompts                     = false,
   open_on_tab                        = false,
   update_cwd                         = true,
   renderer                           = {
      add_trailing           = false,
      group_empty            = false,
      highlight_git          = false,
      full_name              = false,
      highlight_opened_files = 'none',
      highlight_modified     = 'none',
      root_folder_modifier   = ':~',
      indent_width           = 3,
      indent_markers         = {
         enable = true,
         icons = {
            corner = '└ ',
            edge   = '│ ',
            item   = "│",
            bottom = "─",
            none   = '  ',
         },
      },
      icons                  = {
         webdev_colors      = true,
         git_placement      = 'before',
         modified_placement = 'after',
         padding            = ' ',
         symlink_arrow      = ' ➛ ',
         show               = {
            file         = true,
            folder       = true,
            folder_arrow = true,
            git          = true,
            modified     = true,
         },
         glyphs             = {
            default = '',
            symlink = '',
            bookmark = '',
            modified = '●',
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
               unstaged  = "✗",
               staged    = "✓",
               unmerged  = "",
               renamed   = "➜",
               untracked = "★",
               deleted   = "",
               ignored   = "◌",
            },
         },
      },
      special_files          = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
      symlink_destination    = true,
   },
   diagnostics                        = {
      enable            = true,
      show_on_dirs      = true,
      show_on_open_dirs = true,
      debounce_delay    = 100,
      severity          = {
         min = vim.diagnostic.severity.HINT,
         max = vim.diagnostic.severity.ERROR,
      },
      icons             = {
         hint = "",
         info = "",
         warning = "",
         error = "",
      }
   },
   update_focused_file                = {
      update_root = true,
      enable      = true,
      update_cwd  = true,
      ignore_list = {}
   },
   system_open                        = {
      cmd  = nil,
      args = {}
   },
   view                               = {
      centralize_selection        = false,
      cursorline                  = true,
      debounce_delay              = 20,
      hide_root_folder            = false,
      preserve_window_proportions = false,
      number                      = false,
      width                       = 45,
      side                        = 'left',
      -- mappings                    = {
      --    custom_only = true,
      --    list        = mappings
      -- }
   },
   filters                            = {
      dotfiles  = true,
      git_clean = false,
      no_buffer = false,
      custom    = { '.gitignore', 'node_modules/', 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml' },
      exclude   = {},
   },
   git                                = {
      enable            = true,
      ignore            = false,
      show_on_dirs      = true,
      show_on_open_dirs = true,
      timeout           = 300,
   },
   modified                           = {
      enable            = true,
      show_on_dirs      = true,
      show_on_open_dirs = true,
   },
   actions                            = {
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
      expand_all           = {
         max_folder_discovery = 300,
         exclude              = {},
      },
      file_popup           = {
         open_win_config = {
            col      = 1,
            row      = 1,
            relative = 'cursor',
            border   = 'shadow',
            style    = 'minimal',
         }
      },
      remove_file          = {
         close_window = false,
      },
   },
   trash                              = {
      cmd = 'gio trash'
   },
   live_filter                        = {
      prefix              = '[FILTER]: ',
      always_show_folders = true,
   },
   tab                                = {
      sync = {
         open   = false,
         close  = false,
         ignore = {},
      },
   },
   notify                             = {
      threshold = vim.log.levels.INFO,
   },
   ui                                 = {
      confirm = {
         remove = true,
         trash  = false,
      }
   },
   experimental                       = {
      git = {
         async = true
      }
   },
   log                                = {
      enable   = false,
      truncate = false,
      types    = {
         all         = false,
         config      = false,
         copy_paste  = false,
         dev         = false,
         diagnostics = false,
         git         = false,
         profile     = false,
         watcher     = false,
      },
   },
}
