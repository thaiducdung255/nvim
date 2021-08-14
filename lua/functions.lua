local targets = {
   j      = '%(',
   J      = ')',
   k      = '%[',
   K      = ']',
   l      = '{',
   L      = '}',
   h      = '<',
   H      = '>',
   [';']  = '\'',
   [':']  = '"',
   ['\''] = '`',
}

local function findTarget(target)
   -- print('findTarget')
   local prevX = vim.api.nvim_win_get_cursor(0)[2]
   local currentLine = vim.fn.getline('.')
   -- print(currentLine, target, prevX)
   local nextFound, _ = currentLine:find(target, prevX+2)
   -- print(nextFound , prevX)

   if nextFound == nil then
      nextFound, _ = currentLine:find(target, 0)
      -- print(nextFound)

      if nextFound == nil then
         return false
      end
   end

   local moveDiff = nextFound - 1 - prevX
   local move = 'l'

   if moveDiff < 0 then
      move = 'h'
      moveDiff = moveDiff * -1
   else if moveDiff == 0 then
      return true
   end
   end

   -- print(moveDiff, move)
   vim.cmd(':normal ' .. moveDiff .. move)
   return true
end

local function reformatTarget(targetKey)
   -- print(targetKey)
   if targetKey == 'j' or targetKey == 'k' then
      return string.sub(targets[targetKey], 2)
   end

   return targets[targetKey]
end

function _G.deleteBrackets(targetKey, repeatCount)
   if targetKey == ';' or targetKey == ':' or targetKey == '\'' then
      repeatCount = repeatCount * 2 - 1
   end

   while repeatCount > 0 do
      local isTargetFound = findTarget(targets[targetKey])
      repeatCount = repeatCount - 1

      if isTargetFound == false then
         return
      end
   end

   vim.cmd(':normal di' .. reformatTarget(targetKey))
   local prevX = vim.api.nvim_win_get_cursor(0)[2]
   vim.cmd(':normal p')
   local currentX = vim.api.nvim_win_get_cursor(0)[2]
   local contentLength = currentX - prevX
   vim.cmd(':normal ' .. contentLength + 1 .. 'hxx')
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

   while (motionKey ~= 'Z' and motionKey ~= 'z' and repeatCount > 0) do
      local isTargetFound = findTarget(targets[targetKey])

      if isTargetFound == false then
         -- print('target not found')
         return
      end

      repeatCount = repeatCount - 1
   end

   if motionKey == 'g' then
      return
   end

   -- print('exec motion', ':normal ' .. motions[motionKey] .. target)
   local target = reformatTarget(targetKey)
   vim.cmd(':normal ' .. motions[motionKey] .. target)

   if motionKey == 'c' or motionKey == 'z' or motionKey == 'Z' then

      if motionKey == 'z' then
         local prevX = vim.api.nvim_win_get_cursor(0)[2]
         vim.cmd('normal f'..target)
         local currentX = vim.api.nvim_win_get_cursor(0)[2]

         if prevX == currentX then
            return
         end

      else if motionKey == 'Z' then
         local prevX = vim.api.nvim_win_get_cursor(0)[2]
         vim.cmd('normal F'..target)
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

local function serialMap(fnName, motion, keymap, times)
   local postKey = keymap

   if keymap == '\'' then
      postKey = '\\\''
   end

   local mappingPrefix = ''
   for mappingLv = 1, times, 1 do
      if motion ~= '' then
         Nmap(mappingPrefix .. motion .. keymap, ':lua ' .. fnName .. '(\'' .. motion .. '\', \'' .. postKey .. '\', ' .. mappingLv .. ')<CR>')
      else
         Nmap(mappingPrefix .. ';' .. keymap, ':lua ' .. fnName .. '(\'' .. postKey .. '\', ' .. mappingLv .. ')<CR>')
      end
      mappingPrefix = mappingLv + 1
   end
end

local bracketKeys = { 'j', 'k', 'l', 'h', 'J', 'K', 'L', 'H', ';', ':', '\'' }
local motions = { 'g', 's', 'd', 'c', 'z', 'Z' }

for _, motion in ipairs(motions) do
   for _, key in ipairs(bracketKeys) do
      if motion == 'g' and (key == 'J' or key == 'H' or key == 'L') then
      else
         serialMap('customMotions', motion, key, 5)
      end
   end
end

local openBracketKeys = { 'j', 'k', 'l', 'h', ';', ':', '\'' }

for _, key in ipairs(openBracketKeys) do
   serialMap('deleteBrackets', '', key, 5)
end
