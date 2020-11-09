syntax enable
set encoding=utf-8
set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set copyindent
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set autoread
set nohls
set colorcolumn=100
set number relativenumber
set completeopt-=preview
set splitbelow
set splitright
set fileformat=unix
filetype indent on
filetype plugin indent on
highlight ColorColumn ctermbg=0 guibg=lightgrey
set cursorline
set wildignore+=*/tmp/*,*/node_modules/*,*/.git/*,*/dist/*
set complete-=5
set lazyredraw
set termguicolors
let mapleader=" "
set backspace=indent,eol,start
let g:python_host_prog="/usr/bin/python"
let g:python3_host_prog="/usr/bin/python3"

" ignore x to last register
" noremap x "_x
vnoremap p "_dP

let t:is_transparent = 0
function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=#111111 ctermbg=black
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 0
  endif
endfunction
nnoremap <silent> <C-b> :call Toggle_transparent_background()<CR>

map [[ :silent! eval search('{', 'b')<CR>w99[{

map ][ :silent! eval search('}')<CR>b99]}

map ]] j0[[%:silent! eval search('{')<CR>

map [] k$][%:silent! eval search('}', 'b')<CR>
