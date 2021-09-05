local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local E = {}

local function get_delta_previewer(action)
   return previewers.new_termopen_previewer {
      get_command = function(entry)
      -- this is for status
      if action == 'diff' then
         return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=true', 'diff', entry.value }
      end

      -- this is for git diff, git (b)commits
      return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=true', 'diff', entry.value .. '^!' }

      end
   }
end

local layout_config = {
   preview_height = 0.65
}

E.delta_git_diff = function(opts)
   opts = opts or {}
   opts.previewer = get_delta_previewer('diff')
   opts.layout_config = layout_config
   opts.layout_strategy = 'vertical'

   -- builtin.git_commits(opts)
   builtin.git_commits(opts)
end

E.delta_git_commits = function(opts)
   opts = opts or {}
   opts.previewer = get_delta_previewer('commit')
   opts.layout_config = layout_config
   opts.layout_strategy = 'vertical'

   builtin.git_commits(opts)
end

E.delta_git_bcommits = function(opts)
   opts = opts or {}
   opts.previewer = get_delta_previewer('commit')
   opts.layout_config = layout_config
   opts.layout_strategy = 'vertical'

   builtin.git_bcommits(opts)
end

E.delta_git_status = function(opts)
   opts = opts or {}
   opts.previewer = get_delta_previewer('diff')
   opts.layout_config = layout_config
   opts.layout_strategy = 'vertical'

   builtin.git_status(opts)
end

return E
