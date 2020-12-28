let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=120

" NOTE: must be placed before set colorschemes
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
