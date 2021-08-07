function _G.customMotions(motionKey, targetKey, repeatCount)
   local targets = {
      j    = '(',
      J    = ')',
      k    = '[',
      K    = ']',
      l    = '{',
      L    = '}',
      h    = '<',
      H    = '>',
      i    = '\'',
      I    = '"',
      o   = '`',
   }

   local motions = {
      g    = 'f',
      s    = 'v',
      d    = 'd',
      c    = 'c',
      z    = 'c',
   }

   local prevY = vim.api.nvim_win_get_cursor(0)[2]

   while (repeatCount > 0) do
      local cmd = ':normal ' .. motions[motionKey] .. targets[targetKey]
      vim.cmd(cmd)
      repeatCount = repeatCount - 1
   end

   local currentY = vim.api.nvim_win_get_cursor(0)[2]

   if prevY == currentY then
      
   end

   print('hello world: ', prevY, currentY)
end

Nmap('nn', [[:lua customMotions('g', 'j', 1)<CR>]])
