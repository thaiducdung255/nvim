let g:qs_lazy_hilight=1

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary gui=underline cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary gui=undercurl cterm=undercurl
augroup END
