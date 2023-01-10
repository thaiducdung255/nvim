local get_key_code = require('_utils').get_key_code
local keycodes = require('_keymap').switch

vim.g.switch_mapping = get_key_code(keycodes.exec)

vim.api.nvim_create_autocmd(
   'FileType',
   {
      pattern = '*',

      callback = function()
         vim.g.switch_custom_definitions = {
            { '||', '&&' },
            { '|', '&' },
            { '==', '!=' },
            { ' >', ' <' },
            { ' >=', ' <=' },
            { 'true', 'false' },
         }
      end
   }
)

vim.api.nvim_create_autocmd(
   'FileType',
   {
      pattern = 'javascript,typescript,typescriptreact,javascriptreact',

      callback = function()
         vim.g.switch_custom_definitions = {
            { 'string', 'String', 'Promise<string>', 'Promise<String>' },
            { 'number', 'Number', 'Promise<number>', 'Promise<Number>' },
            { 'boolean', 'Boolean', 'Promise<boolean>', 'Promise<Boolean>' },
            { 'string', 'String', 'Promise<string>', 'Promise<String>' },
            { 'object', 'Object', 'Promise<object>', 'Promise<Object>' },
            { '.map', '.reduce', '.filter', '.forEach' },
            { 'null', 'undefined', 'NaN' },
            { 'toUpperCase', 'toLowerCase' },
            { 'toString', 'toISOString' },
            { 'new Date()', 'Date.now()' },
            { 'resolve', 'reject' },
            { '===', '!==' },
            { 'let ', 'const ' },
            { '++', ' += 1' },
            { '--', ' -= 1' },
            { 'function', 'async function' },
            { 'export', 'export default' },
            { 'console.log', 'process.stdout.write' },
            { 'JSON.parse', 'JSON.stringify' },
         }
      end
   }
)

vim.api.nvim_create_autocmd(
   'FileType',
   {
      pattern = 'go',

      callback = function()
         vim.g.switch_custom_definitions = {
            { 'int8', 'int16', 'int32', 'int64' },
            { 'uint8', 'uint16', 'uint32', 'uint64' },
            { 'float32', 'float64' },
            { 'var ', 'const ' },
            { '++', '--' },
         }
      end
   }
)
