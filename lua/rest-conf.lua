local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.http = {
   install_info = {
      url = "https://github.com/NTBBloodbath/tree-sitter-http",
      files = { "src/parser.c" },
      branch = "main",
   },
}

Nmap('<LEADER><CR>', [[:lua require('rest-nvim').run()<CR>]])
Nmap('<LEADER><TAB>', [[:lua require('rest-nvim').run(true)<CR>]])

vim.cmd([[autocmd FileType httpResult lua vim.bo.sw=2]])
