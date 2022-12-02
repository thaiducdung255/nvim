local map          = require('_utils').map
local actions      = require('diffview.actions')
local get_key_code = require('_utils').get_key_code
local keycodes     = require('_keymap').diff_view

require('diffview').setup({
   diff_binaries      = false, -- Show diffs for binaries
   enhanced_diff_hl   = false, -- See ':h diffview-config-enhanced_diff_hl'
   git_cmd            = { 'git' }, -- The git executable followed by default args.
   use_icons          = true, -- Requires nvim-web-devicons
   watch_index        = true, -- Update views and index buffers when the git index changes.
   icons              = { -- Only applies when use_icons is true.
      folder_closed = '',
      folder_open   = '',
   },
   signs              = {
      fold_closed = '',
      fold_open   = '',
      done        = '✓',
   },
   view               = {
      -- Configure the layout and behavior of different types of views.
      -- Available layouts:
      --  'diff1_plain'
      --    |'diff2_horizontal'
      --    |'diff2_vertical'
      --    |'diff3_horizontal'
      --    |'diff3_vertical'
      --    |'diff3_mixed'
      --    |'diff4_mixed'
      -- For more info, see ':h diffview-config-view.x.layout'.
      default = {
         -- Config for changed files, and staged files in diff views.
         layout = 'diff2_horizontal',
      },
      merge_tool = {
         -- Config for conflicted files in diff views during a merge or rebase.
         layout              = 'diff3_horizontal',
         disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
      },
      file_history = {
         -- Config for changed files in file history views.
         layout = 'diff2_horizontal',
      },
   },
   file_panel         = {
      listing_style = 'tree', -- One of 'list' or 'tree'
      tree_options  = { -- Only applies when listing_style is 'tree'
         flatten_dirs    = true, -- Flatten dirs that only contain one single dir
         folder_statuses = 'only_folded', -- One of 'never', 'only_folded' or 'always'.
      },
      win_config    = { -- See ':h diffview-config-win_config'
         position = 'left',
         width    = 35,
         win_opts = {}
      },
   },
   file_history_panel = {
      log_options = { -- See ':h diffview-config-log_options'
         single_file = {
            diff_merges = 'combined',
         },
         multi_file  = {
            diff_merges = 'first-parent',
         },
      },
      win_config  = { -- See ':h diffview-config-win_config'
         position = 'bottom',
         height   = 16,
         win_opts = {}
      },
   },
   commit_log_panel   = {
      win_config = { -- See ':h diffview-config-win_config'
         win_opts = {},
      }
   },
   default_args       = { -- Default args prepended to the arg-list for the listed commands
      DiffviewOpen        = {},
      DiffviewFileHistory = {},
   },
   hooks              = {}, -- See ':h diffview-config-hooks'
   keymaps            = {
      disable_defaults = true, -- Disable the default keymaps
      view = {
         -- The `view` bindings are active in the diff buffers, only when the current
         -- tabpage is a Diffview.
         [get_key_code(keycodes.common.select_next_entry)]    = actions.select_next_entry, -- Open the diff for the next file
         [get_key_code(keycodes.common.select_prev_entry)]    = actions.select_prev_entry, -- Open the diff for the previous file
         [get_key_code(keycodes.common.goto_file)]            = actions.goto_file, -- Open the file in a new split in the previous tabpage
         [get_key_code(keycodes.common.goto_file_split)]      = actions.goto_file_split, -- Open the file in a new split
         [get_key_code(keycodes.common.goto_file_tab)]        = actions.goto_file_tab, -- Open the file in a new tabpage
         [get_key_code(keycodes.common.focus_files)]          = actions.focus_files, -- Bring focus to the file panel
         [get_key_code(keycodes.common.toggle_files)]         = actions.toggle_files, -- Toggle the file panel.
         [get_key_code(keycodes.common.cycle_layout)]         = actions.cycle_layout, -- Cycle through available layouts.
         [get_key_code(keycodes.view.prev_conflict)]          = actions.prev_conflict, -- In the merge_tool: jump to the previous conflict
         [get_key_code(keycodes.view.next_conflict)]          = actions.next_conflict, -- In the merge_tool: jump to the next conflict
         [get_key_code(keycodes.view.conflict_choose_ours)]   = actions.conflict_choose('ours'), -- Choose the OURS version of a conflict
         [get_key_code(keycodes.view.conflict_choose_theirs)] = actions.conflict_choose('theirs'), -- Choose the THEIRS version of a conflict
         [get_key_code(keycodes.view.conflict_choose_base)]   = actions.conflict_choose('base'), -- Choose the BASE version of a conflict
         [get_key_code(keycodes.view.conflict_choose_all)]    = actions.conflict_choose('all'), -- Choose all the versions of a conflict
         [get_key_code(keycodes.view.conflict_choose_none)]   = actions.conflict_choose('none'), -- Delete the conflict region
      },
      diff1 = { --[[ Mappings in single window diff layouts ]] },
      diff2 = { --[[ Mappings in 2-way diff layouts ]] },
      diff3 = {
         -- Mappings in 3-way diff layouts
         { { 'n', 'x' }, get_key_code(keycodes.diff3.diff_get_ours), actions.diffget('ours') }, -- Obtain the diff hunk from the OURS version of the file
         { { 'n', 'x' }, get_key_code(keycodes.diff3.diff_get_theirs), actions.diffget('theirs') }, -- Obtain the diff hunk from the THEIRS version of the file
      },
      diff4 = {
         -- Mappings in 4-way diff layouts
         { { 'n', 'x' }, get_key_code(keycodes.diff4.diff_get_base), actions.diffget('base') }, -- Obtain the diff hunk from the BASE version of the file
         { { 'n', 'x' }, get_key_code(keycodes.diff4.diff_get_ours), actions.diffget('ours') }, -- Obtain the diff hunk from the OURS version of the file
         { { 'n', 'x' }, get_key_code(keycodes.diff4.diff_get_theirs), actions.diffget('theirs') }, -- Obtain the diff hunk from the THEIRS version of the file
      },
      file_panel = {
         [get_key_code(keycodes.common.next_entry)]        = actions.next_entry, -- Bring the cursor to the next file entry
         [get_key_code(keycodes.common.prev_entry)]        = actions.prev_entry, -- Bring the cursor to the previous file entry.
         [get_key_code(keycodes.fp.select_entry)]          = actions.select_entry, -- Open the diff for the selected entry.
         [get_key_code(keycodes.fp.toggle_stage_entry)]    = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
         [get_key_code(keycodes.fp.stage_all)]             = actions.stage_all, -- Stage all entries.
         [get_key_code(keycodes.fp.unstage_all)]           = actions.unstage_all, -- Unstage all entries.
         [get_key_code(keycodes.fp.restore_entry)]         = actions.restore_entry, -- Restore entry to the state on the left side.
         [get_key_code(keycodes.fp.open_commit_log)]       = actions.open_commit_log, -- Open the commit log panel.
         [get_key_code(keycodes.common.scroll_view_up)]    = actions.scroll_view(-0.25), -- Scroll the view up
         [get_key_code(keycodes.common.scroll_view_down)]  = actions.scroll_view(0.25), -- Scroll the view down
         [get_key_code(keycodes.common.select_next_entry)] = actions.select_next_entry,
         [get_key_code(keycodes.common.select_prev_entry)] = actions.select_prev_entry,
         [get_key_code(keycodes.common.goto_file)]         = actions.goto_file,
         [get_key_code(keycodes.common.goto_file_split)]   = actions.goto_file_split,
         [get_key_code(keycodes.common.goto_file_tab)]     = actions.goto_file_tab,
         [get_key_code(keycodes.fp.listing_style)]         = actions.listing_style, -- Toggle between 'list' and 'tree' views
         [get_key_code(keycodes.fp.toggle_flatten_dirs)]   = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
         [get_key_code(keycodes.fp.refresh_files)]         = actions.refresh_files, -- Update stats and entries in the file list.
         [get_key_code(keycodes.common.focus_files)]       = actions.focus_files,
         [get_key_code(keycodes.common.toggle_files)]      = actions.toggle_files,
         [get_key_code(keycodes.common.cycle_layout)]      = actions.cycle_layout,
         [get_key_code(keycodes.fp.next_conflict)]         = actions.next_conflict,
      },
      file_history_panel = {
         [get_key_code(keycodes.fhp.opions)]               = actions.options, -- Open the option panel
         [get_key_code(keycodes.fhp.open_in_diffview)]     = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
         [get_key_code(keycodes.fhp.copy_hash)]            = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
         [get_key_code(keycodes.fhp.open_commit_log)]      = actions.open_commit_log,
         [get_key_code(keycodes.fhp.open_all_folds)]       = actions.open_all_folds,
         [get_key_code(keycodes.fhp.close_all_folds)]      = actions.close_all_folds,
         [get_key_code(keycodes.common.next_entry)]        = actions.next_entry,
         [get_key_code(keycodes.common.prev_entry)]        = actions.prev_entry,
         [get_key_code(keycodes.fhp.select_entry)]         = actions.select_entry,
         [get_key_code(keycodes.common.scroll_view_up)]    = actions.scroll_view(-0.25),
         [get_key_code(keycodes.common.scroll_view_down)]  = actions.scroll_view(0.25),
         [get_key_code(keycodes.common.select_next_entry)] = actions.select_next_entry,
         [get_key_code(keycodes.common.select_prev_entry)] = actions.select_prev_entry,
         [get_key_code(keycodes.common.goto_file)]         = actions.goto_file,
         [get_key_code(keycodes.common.goto_file_split)]   = actions.goto_file_split,
         [get_key_code(keycodes.common.goto_file_tab)]     = actions.goto_file_tab,
         [get_key_code(keycodes.common.focus_files)]       = actions.focus_files,
         [get_key_code(keycodes.common.toggle_files)]      = actions.toggle_files,
         [get_key_code(keycodes.common.cycle_layout)]      = actions.cycle_layout,
      },
      option_panel = {
         [get_key_code(keycodes.op.select_entry)] = actions.select_entry,
         [get_key_code(keycodes.op.close)]        = actions.close,
      },
   },
})

map('n', keycodes.open, ':DiffviewOpen<CR><C-w>w')
map('n', keycodes.close, ':DiffviewClose<CR>')
