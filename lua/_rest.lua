local map = require('_utils').map
local keycodes = require('_keymap')

require('rest-nvim').setup({
   result_split_horizontal  = false,
   skip_ssl_verification    = true,
   jump_to_request          = true,
   env_file                 = '.env',
   custom_dynamic_variables = {},
   highlight                = {
      enabled = false,
      timeout = 150,
   },
   result                   = {
      show_url       = true,
      show_http_info = true,
      show_header    = false,
   },
})

map('n', keycodes.rest.run, [[:lua require('rest-nvim').run()<CR>]])
map('n', keycodes.rest.curl, [[:lua require('rest-nvim').run(true)<CR>]])

vim.api.nvim_create_autocmd(
   'FileType',
   {
      pattern  = 'httpResult,tsplayground',
      callback = function()
         vim.bo.sw = 2
      end
   }
)
