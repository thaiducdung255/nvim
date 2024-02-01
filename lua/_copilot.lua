require('copilot').setup({
   panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
         jump_prev = "gp",
         jump_next = "gn",
         accept = "<CR>",
         refresh = "R",
         open = "<M-CR>",
      },
      layout = {
         position = "bottom",
         ratio = 0.5,
      },
   },
   suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
         accept = "<C-CR>",
         next = "<C-N>",
         prev = "<C-E>",
         dismiss = "<C-O>",
      },
   },
   filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = true,
   },
   copilot_node_command = 'node',
   server_opts_overrides = {},
})
