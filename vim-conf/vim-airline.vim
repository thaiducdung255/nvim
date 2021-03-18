" Vim airline configs
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_detect_spelllang=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let airline#extensions#ale#error_symbol = '[E] '
let airline#extensions#ale#warning_symbol = '[W] '
let airline_theme='angr'

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
