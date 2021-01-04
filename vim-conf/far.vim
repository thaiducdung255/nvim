set lazyredraw            " improve scrolling performance when navigating through large results
set regexpengine=1        " use old regexp engine
set ignorecase smartcase  " ignore case only when the pattern contains no capital letters

" " shortcut for far.vim find
" nnoremap <silent> <Find-Shortcut>  :Farf<cr>
" vnoremap <silent> <Find-Shortcut>  :Farf<cr>

" " shortcut for far.vim replace
" nnoremap <silent> <Replace-Shortcut>  :Farr<cr>
" vnoremap <silent> <Replace-Shortcut>  :Farr<cr>

function! GlobalFindAndReplace()
  call inputsave()
  let originalText = input('Global Replace: ')
  let ext = tolower(expand('%:e'))
  call inputrestore()
  call inputsave()
  let finalText = input('By: ')
  call inputrestore()
  execute('Far ' . originalText . ' ' . finalText . ' **/*.' . ext)
endfunction

nnoremap <silent><LEADER>gr :call GlobalFindAndReplace()<CR>
