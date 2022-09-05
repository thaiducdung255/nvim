local utils = require('utils')

local map             = utils.map
local keyboard_layout = utils.keyboard_layout

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
      i      = '{',
      I      = '}',
      h      = '<',
      H      = '>',
      [';']  = '\'',
      [':']  = '"',
      ['\''] = '`',
   }
end

local function find_target(target)
   local prev_x = vim.api.nvim_win_get_cursor(0)[2]
   local prev_y = vim.api.nvim_win_get_cursor(0)[1]
   local current_line = vim.fn.getline('.')

   local next_found = current_line:find(target, prev_x + 2)

   if next_found == nil then
      next_found = current_line:find(target, 0)

      if next_found == nil then
         return false
      end
   end

   vim.fn.cursor(prev_y, next_found)
   return true
end

local function reformat_target(target_key)
   local result = targets[target_key]

   if #(result) > 1 then
      return string.sub(result, 2)
   end

   return result
end

function _G.delete_brackets(target_key, repeat_count)
   if target_key == ';' or target_key == ':' or target_key == '\'' then
      repeat_count = repeat_count * 2 - 1
   end

   while repeat_count > 0 do
      local isTargetFound = find_target(targets[target_key])
      repeat_count = repeat_count - 1

      if isTargetFound == false then
         return
      end
   end

   local norm_cmd = ':normal di'

   if keyboard_layout == 'colemak' then
      norm_cmd = ':normal dk'
   end

   vim.cmd(norm_cmd .. reformat_target(target_key))
   local prev_x = vim.api.nvim_win_get_cursor(0)[2]
   vim.cmd(':normal p')
   local current_x = vim.api.nvim_win_get_cursor(0)[2]
   local content_length = current_x - prev_x
   vim.cmd(':normal ' .. content_length + 1 .. 'hxx')
end

function _G.custom_motions(motion_key, target_key, repeat_count)
   local motions = {
      g = 'f',
      s = 'vi',
      d = 'di',
      c = 'di',
      y = 'yi',
      z = 'dt',
      Z = 'dT',
   }

   if keyboard_layout == 'colemak' then
      motions = {
         g = 'f',
         s = 'vk',
         d = 'dk',
         c = 'dk',
         y = 'yk',
         z = 'dt',
         Z = 'dT',
      }
   end

   if target_key == ';' or target_key == ':' or target_key == '\'' then
      if motion_key == 's' or motion_key == 'd' or motion_key == 'c' then
         repeat_count = repeat_count * 2 - 1
      end
   end

   while (motion_key ~= 'Z' and motion_key ~= 'z' and repeat_count > 0) do
      local isTargetFound = find_target(targets[target_key])

      if isTargetFound == false then
         return
      end

      repeat_count = repeat_count - 1
   end

   if motion_key == 'g' then
      return
   end

   if motion_key == 'z' then
      target_key = target_key:upper()
   end

   local target = reformat_target(target_key)
   local exec_cmd = ':normal ' .. motions[motion_key] .. target
   vim.cmd(exec_cmd)

   if motion_key == 'c' or motion_key == 'z' or motion_key == 'Z' then
      vim.cmd(':startinsert')
   end
end

local function serial_map(fn_name, motion, keymap, times)
   local post_key = keymap

   if keymap == '\'' then
      post_key = '\\\''
   end

   local mapping_prefix = ''

   for mapping_lv = 1, times, 1 do
      if motion ~= '' then
         map('n', mapping_prefix .. motion .. keymap,
            ':lua ' .. fn_name .. '(\'' .. motion .. '\', \'' .. post_key .. '\', ' .. mapping_lv .. ')<CR>')
      else
         map('n', mapping_prefix .. ';' .. keymap,
            ':lua ' .. fn_name .. '(\'' .. post_key .. '\', ' .. mapping_lv .. ')<CR>')
      end

      mapping_prefix = mapping_lv .. 1
   end
end

local bracket_keys = { 'j', 'k', 'l', 'h', 'J', 'K', 'L', 'H', ';', ':', '\'' }

if keyboard_layout == 'colemak' then
   bracket_keys = { 'n', 'e', 'i', 'h', 'N', 'E', 'I', 'H', ';', ':', '\'' }
end

local motions = { 'g', 's', 'd', 'c', 'y', 'z', 'Z' }

for _, motion in ipairs(motions) do
   for _, key in ipairs(bracket_keys) do
      if motion ~= 'g' and (key == 'J' or key == 'H' or key == 'L') then
      else
         serial_map('custom_motions', motion, key, 5)
      end
   end
end

local open_bracket_keys = { 'j', 'k', 'l', 'h', ';', ':', '\'' }

if keyboard_layout == 'colemak' then
   open_bracket_keys = { 'n', 'e', 'i', 'h', ';', ':', '\'' }
end

for _, key in ipairs(open_bracket_keys) do
   serial_map('delete_brackets', '', key, 5)
end
