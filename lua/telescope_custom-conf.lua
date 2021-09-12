local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local finders = require('telescope.finders')
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

local function splitFileDiagnostic(str, delimiter)
   local result = {};

   for match in (str):gmatch("(.-)"..delimiter) do
      local pre = match:sub(0, 1)

      if pre == '\n' or pre == '/' then
         if (pre == '\n') then
            match = match:sub(2)
         end

         local file_name = match:match('^[a-zA-Z0-9\\s/%.%-_]+'):sub(vim.fn.getcwd():len()+2)
         local file_diagnostics = match:match('\n.*'):sub(2)
         table.insert(result, { file_name, file_diagnostics })
      end
   end

   return result;
end

E.eslint_diagnostics = function(otps)
   local raw_eslint_diagnostics = vim.fn.system('eslint .')
   local eslint_diagnostics = splitFileDiagnostic(raw_eslint_diagnostics, '\n\n')

   opts = otps or {}

   pickers.new(otps, {
      prompt_title = 'eslint diagnostics',
      finder = finders.new_table{
         results = eslint_diagnostics,
         entry_maker = function(entry)
            return {
               value = entry,
               display = entry[1],
               ordinal = entry[1],
            }
         end
      },
      sorter = sorters.fuzzy_with_index_bias(),
   }):find(otps)
end

return E
