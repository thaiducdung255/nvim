let g:ale_lint_on_insert_leave=1
let g:ale_disable_lsp=1
let g:ale_sign_column_always = 1

let g:ale_fixers = {
\   'javascript|go|typescript': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'go': ['gofmt'],
\}

let g:ale_linters = {}
let g:ale_linters.typescript = ['eslint', 'tsserver']
let g:ale_linters.javascript = ['eslint']
let g:ale_linters.go = ['golint', 'gofmt']
let g:ale_typescript_prettier_use_local_config=1
let g:ale_completion_autoimport = 1
let g:ale_fix_on_save=1
let g:ale_linters_explicit=1
let g:ale_sign_error = '➤'
let g:ale_sign_warning = '●'
nmap <silent> <LEADER>lk <Plug>(ale_previous_wrap)
nmap <silent> <LEADER>lj <Plug>(ale_next_wrap)
