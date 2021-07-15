require'nvim-treesitter.configs'.setup {
   ensure_installed = false, -- one of 'all', 'maintained' (parsers with maintainers), or a list of languages
   ignore_install   = true,
   highlight        = {
      enable = true -- false will disable the whole extension
   },
   -- indent = {enable = true, disable = {'python', 'html', 'javascript'}},
   -- TODO seems to be broken
   indent           = {
      enable = {
         'javascriptreact'
      }
   },
   autotag          = {
      enable = true
   },
   rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {}, -- table of colour name strings
   }
}
