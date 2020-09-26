let g:vrc_trigger='<C-SPACE>'

let s:vrc_auto_format_response_patterns = {
\ 'json': 'python -m json.tool',
\ 'xml': 'xmllint --format -',
\}

nnoremap <silent> <LEADER>prt :set modifiable<CR>3dd:%!python -m json.tool<CR>
nnoremap <silent> <LEADER>une :UltiSnipsEdit<CR>
