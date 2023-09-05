local map = require('_utils').map

local keycodes = {
   run       = '<LEADER><LEADER>',
   variables = '<LEADER><CR>',
   headers   = '<LEADER><TAB>'
}

local function map_gql_key()
   map('n', keycodes.run, ':GraphQLExecute<CR>')
   map('n', keycodes.variables, ':GraphQLEditHttpHeader<CR>')
   map('n', keycodes.headers, [[:GraphQLEdit<CR>]])
end

vim.api.nvim_create_autocmd(
   'BufEnter',
   {
      pattern  = '*.graphql',
      callback = map_gql_key
   }
)

vim.api.nvim_create_autocmd(
   'BufEnter',
   {
      pattern  = '*.gql',
      callback = map_gql_key
   }
)
