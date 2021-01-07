let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1
let b:ale_fixers = ['prettier', 'eslint']

let g:ale_fixers = {
\   'javascript': ['remove_trailing_lines', 'trim_whitespace', 'eslint'],
\   'golang': ['remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_linters = {}
let g:ale_linters.typescript = ['eslint', 'tsserver']
let g:ale_linters.javascript = ['eslint']
" let g:ale_linters.go = ['gopls']
let g:ale_typescript_prettier_use_local_config=1
let g:ale_fix_on_save=1
let g:ale_linters_explicit=1
let g:ale_sign_error = '➤'
let g:ale_sign_warning = '●'
nmap <silent> <LEADER>nk <Plug>(ale_previous_wrap)
nmap <silent> <LEADER>nj <Plug>(ale_next_wrap)
