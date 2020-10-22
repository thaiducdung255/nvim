let g:incsearch#auto_nohlsearch=1
" map / <Plug>(incserach-easymotion-/)
" map ? <Plug>(incserach-easymotion-?)
" map \ <Plug>(incserach-easymotion-stay)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <M-f> incsearch#go(<SID>config_easyfuzzymotion())
nnoremap <silent>z :call incsearch#call(incsearch#config#easymotion#make())<CR>
nnoremap <silent>/ :call incsearch#call(incsearch#config#fuzzy#make())<CR>
