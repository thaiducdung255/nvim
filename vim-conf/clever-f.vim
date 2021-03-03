let g:clever_f_chars_match_any_signs=';'
let g:clever_f_smart_case=1
let g:clever_f_repeat_last_char_input=' '

" jump to brackets
nnoremap gj :call clever_f#find("a", "(")<CR>
nnoremap gJ :call clever_f#find("a", ")")<CR>
nnoremap gk :call clever_f#find("a", "[")<CR>
nnoremap gK :call clever_f#find("a", "]")<CR>
nnoremap gl :call clever_f#find("a", "{")<CR>
nnoremap gL :call clever_f#find("a", "}")<CR>
nnoremap g; :call clever_f#find("a", "'")<CR>
nnoremap g: :call clever_f#find("a", "\"")<CR>
nnoremap gh :call clever_f#find("a", "`")<CR>
