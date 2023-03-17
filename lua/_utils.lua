local M = {}

M.keyboard_layout = 'colemak'

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

return M
