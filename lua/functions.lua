local function findTarget(target, skipIfTargetFound)
   local prevX = vim.api.nvim_win_get_cursor(0)[2]
   local currentChar = vim.fn.getline('.'):sub(prevX + 1, prevX + 1)

   if skipIfTargetFound == true and currentChar == target then
      return true
   end

   -- print('find forward', ':normal f' .. target)
   vim.cmd(':normal f' .. target)
   local currentX = vim.api.nvim_win_get_cursor(0)[2]

   if prevX == currentX then
      -- print('find backward', ':normal F' .. target)
      vim.cmd(':normal F' .. target)
      currentX = vim.api.nvim_win_get_cursor(0)[2]
   end

   if prevX == currentX then
      return false
   end

   return true
end

local targets = {
   j    = '(',
   J    = ')',
   k    = '[',
   K    = ']',
   l    = '{',
   L    = '}',
   h    = '<',
   H    = '>',
   [';']    = '\'',
   [':']    = '"',
   ['\'']    = '`',
}

function _G.insertBrackets(targetKey)
   vim.cmd(':normal d')
   vim.cmd(':startinsert')
   vim.cmd(targets[targetKey])
   vim.cmd(':normal hp')
end

function _G.customMotions(motionKey, targetKey, repeatCount)
   -- print(repeatCount)
   local motions = {
      g    = 'f',
      s    = 'vi',
      d    = 'di',
      c    = 'di',
      z    = 'dt',
      Z    = 'dT',
   }

   if targetKey == ';' or targetKey == ':' or targetKey == '\'' then
      if motionKey == 's' or motionKey == 'd' or motionKey == 'c' then
         repeatCount = repeatCount * 2 - 1
      end
   end

   local skipIfTargetFound = true

   if repeatCount > 1 then
      skipIfTargetFound = false
   end

   while (motionKey ~= 'Z' and motionKey ~= 'z' and repeatCount > 0) do
      local isTargetFound = findTarget(targets[targetKey], skipIfTargetFound)

      if isTargetFound == false then
         -- print('target not found')
         return
      end

      repeatCount = repeatCount - 1
   end

   if motionKey ~= 'g' then
      -- print('exec motion', ':normal ' .. motions[motionKey] .. targets[targetKey])
      vim.cmd(':normal ' .. motions[motionKey] .. targets[targetKey])

      if motionKey == 'c' or motionKey == 'z' then

         if motionKey == 'z' then
            local prevX = vim.api.nvim_win_get_cursor(0)[2]
            vim.cmd('normal f'..targets[targetKey])
            local currentX = vim.api.nvim_win_get_cursor(0)[2]

            if prevX == currentX then
               return
            end

            else if motionKey == 'Z' then
               local prevX = vim.api.nvim_win_get_cursor(0)[2]
               vim.cmd('normal F'..targets[targetKey])
               local currentX = vim.api.nvim_win_get_cursor(0)[2]

               if prevX == currentX then
                  return
               end

            end
         end

         -- print('insert')
         vim.cmd(':startinsert')
      end
   end
end

local bracketKeys = { 'j', 'k', 'l', 'h', 'J', 'K', 'L', 'H', ';', ':', '\'' }
local motions = { 'g', 's', 'd', 'c', 'z', 'Z' }

for _, motion in ipairs(motions) do
   for _, key in ipairs(bracketKeys) do
      if motion == 'g' and (key == 'J' or key == 'H' or key == 'L') then
      end

      local postKey = key

      if key == '\'' then
         postKey = '\\\''
      end

      Nmap(motion .. key, ':lua customMotions(\'' .. motion .. '\', \'' .. postKey .. '\', 1)<CR>')
      Nmap('2' .. motion .. key, ':lua customMotions(\'' .. motion .. '\', \'' .. postKey .. '\', 2)<CR>')
      Nmap('3' .. motion .. key, ':lua customMotions(\'' .. motion .. '\', \'' .. postKey .. '\', 3)<CR>')
   end
end

local openBracketKeys = { 'j', 'k', 'l', 'h', ';', ':', '\'' }

for _, key in ipairs(openBracketKeys) do
   local postKey = key

   if key == '\'' then
      postKey = '\\\''
   end

   Nmap(';' .. key, ':lua deleteBrackets(\'' .. postKey .. '\')<CR>')
end
