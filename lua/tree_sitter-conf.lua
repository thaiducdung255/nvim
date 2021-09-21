require'nvim-treesitter.configs'.setup {
   ensure_installed = false,
   ignore_install   = true,
   highlight = {
      enable = true,
   },
   indent = {
      enable = {
         'javascriptreact'
      }
   },
   autotag = {
      enable = true
   },
   rainbow = {
      enable         = true,
      extended_mode  = true,
      max_file_lines = 1000,
   }
}
