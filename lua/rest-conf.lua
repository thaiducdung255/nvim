require('rest-nvim').setup({
   result_split_horizontal = false,
   skip_ssl_verification = true,
   highlight = {
      enabled = false,
      timeout = 150,
   },
   result = {
      show_url = true,
      show_http_info = true,
      show_header = false,
   },
   jump_to_request = true,
   env_file = '.env',
   custom_dynamic_variables = {},
})

Nmap(Keycodes.rest.run, [[:lua require('rest-nvim').run()<CR>]])
Nmap(Keycodes.rest.curl, [[:lua require('rest-nvim').run(true)<CR>]])

vim.api.nvim_create_autocmd(
   'FileType',
   {
      pattern  = 'httpResult,tsplayground',
      callback = function()
         vim.bo.sw = 2
      end
   }
)
