require('nvim_comment').setup({
   comment_empty   = false,
   marker_padding  = true,
   create_mappings = false,
})

Nvmap('gc', ':CommentToggle<CR>')
