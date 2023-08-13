local M = {}

function M.map(mode_str, lhs, rhs, isSilent)
   local modes = {}

   for i = 1, #mode_str do
      local mode = mode_str:sub(i, i)
      table.insert(modes, mode)
   end

   local opts = {
      noremap = true,
      silent  = isSilent == true,
      nowait  = true,
   }

   if (isSilent == nil) then opts.silent = true end

   vim.keymap.set(modes, lhs, rhs, opts)
end

function M.plug_cmd(cmd, mode)
   local _mode = mode or 'n'
   local _cmd = '<Plug>(' .. cmd .. ')'
   local raw_cmd = vim.api.nvim_replace_termcodes(_cmd, true, true, true)
   return vim.api.nvim_feedkeys(raw_cmd, _mode, true)
end

return M
