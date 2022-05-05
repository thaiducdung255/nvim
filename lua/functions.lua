local keyboard_layout = os.getenv('KEYBOARD_LAYOUT')

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

if keyboard_layout == 'colemak' then
   targets = {
      n      = '%(',
      N      = ')',
      e      = '%[',
      E      = ']',
      o      = '{',
      O      = '}',
      h      = '<',
      H      = '>',
      [';']  = '\'',
      [':']  = '"',
      ['\''] = '`',
   }
end

local function findTarget(target)
   local prevX = vim.api.nvim_win_get_cursor(0)[2]
   local prevY = vim.api.nvim_win_get_cursor(0)[1]
   local currentLine = vim.fn.getline('.')

   local nextFound = currentLine:find(target, prevX+2)

   if nextFound == nil then
      nextFound = currentLine:find(target, 0)

      if nextFound == nil then
         return false
      end
   end

   vim.fn.cursor(prevY, nextFound)
   return true
end

local function reformatTarget(targetKey)
   if targetKey == 'j' or targetKey == 'k' or targetKey == 'n' or targetKey == 'e' then
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
   local motions = {
      g    = 'f',
      s    = 'vi',
      d    = 'di',
      c    = 'di',
      y    = 'yi',
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
         return
      end

      repeatCount = repeatCount - 1
   end

   if motionKey == 'g' then
      return
   end

   if motionKey == 'z' then
      targetKey = targetKey:upper()
   end

   local target = reformatTarget(targetKey)
   vim.cmd(':normal ' .. motions[motionKey] .. target)

   if motionKey == 'c' or motionKey == 'z' or motionKey == 'Z' then
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

if keyboard_layout == 'colemak' then
   bracketKeys = { 'n', 'e', 'o', 'h', 'N', 'E', 'I', 'H', ';', ':', '\'' }
end

local motions = { 'g', 's', 'd', 'c', 'y', 'z', 'Z' }

for _, motion in ipairs(motions) do
   for _, key in ipairs(bracketKeys) do
      if motion ~= 'g' and (key == 'J' or key == 'H' or key == 'L') then
      else
         serialMap('customMotions', motion, key, 5)
      end
   end
end

local openBracketKeys = { 'j', 'k', 'l', 'h', ';', ':', '\'' }

if keyboard_layout == 'colemak' then
   openBracketKeys = { 'n', 'e', 'o', 'h', ';', ':', '\'' }
end

for _, key in ipairs(openBracketKeys) do
   serialMap('deleteBrackets', '', key, 5)
end
