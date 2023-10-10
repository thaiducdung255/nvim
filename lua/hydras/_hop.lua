local hydra = require('_hydra')
local hop   = require('hop')
local cmd   = require('hydra.keymap-util').cmd

local function hint_pairs()
   return hop.hint_patterns(
      {
         current_line_only = true
      },
      '(\\|\\[\\|{\\|<\\|\'\\|"\\|`'
   )
end

local function custom_actions(action, startinsert)
   local current_line = vim.api.nvim_get_current_line()
   local current_index = vim.api.nvim_win_get_cursor(0)[2] + 1
   local current_char = current_line:sub(current_index, current_index)
   local keys = { '(', '[', '{', '<', '\'', '"' }

   for _, key in pairs(keys) do
      if current_char == key then
         local _cmd = 'normal ' .. action .. current_char
         vim.cmd(_cmd)

         if startinsert then
            vim.cmd('startinsert')
         end

         return
      end
   end

   if pcall(hint_pairs) then
      current_index = vim.api.nvim_win_get_cursor(0)[2] + 1
      current_char = current_line:sub(current_index, current_index)
      local _cmd = 'normal ' .. action .. current_char
      vim.cmd(_cmd)

      if startinsert then
         vim.cmd('startinsert')
      end
   end
end

local keymap = {
   body  = 's',
   heads = {
      word  = { key = 's', fn = cmd 'HopWordCurrentLine' },
      Word  = { key = 'w', fn = cmd 'HopWordMW' },
      char  = { key = 'f', fn = cmd 'HopChar1CurrentLine' },
      line  = { key = 'l', fn = cmd 'HopLineMW' },
      any   = { key = '.', fn = cmd 'HopPatternMW' },
      char2 = { key = '<space>', fn = cmd 'HopChar2MW' },
      pairs = { key = 'o', fn = hint_pairs },
      yi    = { key = 'y', fn = function() custom_actions('yi') end },
      vi    = { key = 'v', fn = function() custom_actions('vk') end },
      ci    = { key = 'c', fn = function() custom_actions('di', true) end },
      di    = { key = 'd', fn = function() custom_actions('di') end },
      ya    = { key = 'Y', fn = function() custom_actions('ya') end },
      va    = { key = 'V', fn = function() custom_actions('va') end },
      ca    = { key = 'C', fn = function() custom_actions('da', true) end },
      da    = { key = 'D', fn = function() custom_actions('da') end },
      save  = { key = '<cr>', fn = cmd 'write' }
   }
}

hydra.create({
   name = 'Hop',
   keymap = keymap,
   conf = { timeout = 8000 }
})
