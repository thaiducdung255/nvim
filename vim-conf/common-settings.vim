syntax on

set updatetime=300
" set shortmess+=c
" set cmdheight=1
" set hidden
" set nowritebackup

set encoding=utf-8
set noerrorbells
set tabstop=3
set softtabstop=3
set shiftwidth=3

" support indent highlight for tab
set list lcs=tab:\∙\ 

" indent type: expand tab is using space to indent
" set expandtab

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
" set colorcolumn=100
set number relativenumber
set completeopt-=preview
set splitbelow
set splitright
set fileformat=unix
filetype on
filetype plugin on
filetype indent on
" highlight ColorColumn ctermbg=0 guibg=lightgrey
set cursorline
set wildignore+=*/tmp/*,*/node_modules/*,*/.git/*,*/dist/*
set complete-=5
set lazyredraw
set termguicolors
let mapleader=" "
set backspace=indent,eol,start
let g:python_host_prog="/usr/bin/python2"
let g:python3_host_prog="/usr/bin/python3"
let g:ruby_host_prog = '~/.gem/ruby/2.7.0/bin/neovim-ruby-host'

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

" support .pdf file
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
