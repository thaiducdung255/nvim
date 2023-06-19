require('gitsigns').setup {
   numhl                             = false,
   linehl                            = false,
   word_diff                         = false,
   signcolumn                        = true,
   watch_gitdir                      = { interval = 1000 },
   sign_priority                     = 6,
   update_debounce                   = 200,
   status_formatter                  = nil,
   current_line_blame                = true,
   current_line_blame_formatter_opts = { relative_time = true },

   signs                             = {
      -- TODO add hl to colorscheme
      add          = {
         hl     = 'GitSignsAdd',
         text   = '▎',
         numhl  = 'GitSignsAddNr',
         linehl = 'GitSignsAddLn',
      },
      change       = {
         hl     = 'GitSignsChange',
         text   = '▎',
         numhl  = 'GitSignsChangeNr',
         linehl = 'GitSignsChangeLn',
      },
      topdelete    = {
         hl     = 'GitSignsDelete',
         text   = '▎',
         numhl  = 'GitSignsDeleteNr',
         linehl = 'GitSignsDeleteNr',
      },
      changedelete = {
         hl     = 'GitSignsChange',
         text   = '▎',
         numhl  = 'GitSignsChangeNr',
         linehl = 'GitSignsChangeLn',
      },
      delete       = {
         hl     = 'GitSignsDelete',
         text   = '▎',
         numhl  = 'GitSignsDeleteNr',
         linehl = 'GitSignsDeleteLn',
      },
      untracked    = {
         hl     = 'Grey',
         text   = '▎',
         numhl  = 'Grey',
         linehl = 'Grey',
      }
   },
}
