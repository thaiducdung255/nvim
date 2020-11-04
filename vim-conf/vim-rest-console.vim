let g:vrc_trigger='<LEADER>;'
let g:vrc_response_default_content_type='application/json'
let g:vrc_curl_opts={
			\ '-s': '',
			\}
" set ft=rest
" let g:vrc_output_buffer_name='__VRC_OUTPUT.<filetype>'
" let g:vrc_syntax_highlight_response=1
" let g:vrc_auto_format_response_enabled=1
" let s:vrc_auto_format_response_patterns = {
" \ 'json': 'python -m json.tool',
" \ 'xml': 'xmllint --format -',
" \}

nnoremap <silent> <LEADER>prt :set modifiable<CR>3dd:%!python -m json.tool<CR>
