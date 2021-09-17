require'nvim-treesitter.configs'.setup {
   ensure_installed = false, -- one of 'all', 'maintained' (parsers with maintainers), or a list of languages
   ignore_install   = true,
   highlight        = {
      enable = true,
   },
   indent           = {
      enable = {
         'javascriptreact'
      }
   },
   autotag          = {
      enable = true
   },
   rainbow = {
      enable         = true,
      extended_mode  = true,
      max_file_lines = 1000,
   }
}
