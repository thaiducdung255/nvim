local M = {}

M.keyboard_layout = os.getenv('KEYBOARD_LAYOUT')

function M.get_key_code(lhsDict)
   if lhsDict.ascii and lhsDict.colemak then
      if M.keyboard_layout == 'colemak' then
         return lhsDict.colemak
      end

      return lhsDict.ascii
   end

   if lhsDict.ascii then
      return lhsDict.ascii
   end

   return lhsDict

end

function M.map(mode_str, lhsDict, rhs, isSilent)
   local modes = {}
   local lhs = M.get_key_code(lhsDict)

   for i = 1, #mode_str do
      local mode = mode_str:sub(i, i)
      table.insert(modes, mode)
   end

   local opts = {
      noremap = true,
      silent = isSilent == true
   }

   if (isSilent == nil) then opts.silent = true end

   vim.keymap.set(modes, lhs, rhs, opts)
end

return M
