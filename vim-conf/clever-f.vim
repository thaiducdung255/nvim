let g:clever_f_chars_match_any_signs=';'
let g:clever_f_smart_case=1
let g:clever_f_repeat_last_char_input=' '

" jump to brackets
nnoremap g; :call clever_f#find("a", "(")<CR>
nnoremap go :call clever_f#find("a", "{")<CR>
nnoremap gf :call clever_f#find("a", "[")<CR>
nnoremap gb :call clever_f#find("a", "<")<CR>
nnoremap g' :call clever_f#find("a", "'")<CR>
nnoremap g" :call clever_f#find("a", """)<CR>
nnoremap ge :call clever_f#find("a", "`")<CR>
