local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local finders = require('telescope.finders')
local builtin = require('telescope.builtin')
local E = {}

local function get_delta_previewer(action)
   return previewers.new_termopen_previewer {
      get_command = function(entry)
      if action == 'diff' then
         return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=true', 'diff', entry.value }
      end

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

local function reformat_eslint_diagnostics(str, delimiter)
   local filenames = {}
   local line_diagnostics = {}
   local index = 1

   if str:sub(0, 6) == '\nOops!' then
      return str, nil, nil
   end

   for diagnostic_record in (str):gmatch('(.-)'..delimiter) do
      local pre = diagnostic_record:sub(0, 1)

      if pre == '\n' or pre == '/' then
         if (pre == '\n') then
            diagnostic_record = diagnostic_record:sub(2)
         end

         local file_name = diagnostic_record:match('^[a-zA-Z0-9\\s/%.%-_]+'):sub(vim.fn.getcwd():len()+2)
         local file_diagnostics = diagnostic_record:match('\n.*'):sub(2)
         table.insert(filenames, file_name)
         line_diagnostics[index] = file_diagnostics
         index = index + 1
      end
   end

   return nil, filenames, line_diagnostics
end

E.eslint_diagnostics = function()
   local raw_eslint_diagnostics = vim.fn.system('eslint .')
   local err, filenames, lines = reformat_eslint_diagnostics(raw_eslint_diagnostics, '\n\n')

   if err ~= nil then
      return print(err)
   end

   local otps = {
      layout_config = {
         preview_width = 0.76
      }
   }

   pickers.new(otps, {
      prompt_title = 'Eslint diagnostics',
      previewer = previewers.new_termopen_previewer{
         get_command = function(entry)
            local index = entry.index

            return { 'echo', lines[index] }
         end
      },
      finder = finders.new_table{
         results = filenames,
      },
      sorter = sorters.fuzzy_with_index_bias(),
   }):find(otps)
end

return E
