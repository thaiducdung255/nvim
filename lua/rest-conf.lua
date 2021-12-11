require('rest-nvim').setup({
   result_split_horizontal = false,
   skip_ssl_verifycation = true,
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

Nmap('<LEADER><CR>', [[:lua require('rest-nvim').run()<CR>]])
Nmap('<LEADER><TAB>', [[:lua require('rest-nvim').run(true)<CR>]])

vim.cmd([[autocmd FileType httpResult,tsplayground lua vim.bo.sw=2]])
vim.cmd([[autocmd FileType http,httpResult TSBufDisable highlight]])
