syntax on
set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set nohlsearch
set incsearch
set colorcolumn=100
set number relativenumber
set completeopt-=preview
set splitbelow
set splitright
set fileformat=unix
highlight ColorColumn ctermbg=0 guibg=lightgrey
set nocursorline
set wildignore+=*/tmp/*,*/node_modules/*,*/.git/*,*/dist/*
set complete-=5
set lazyredraw
set termguicolors
let mapleader=" "
set backspace=indent,eol,start
let g:python_host_prog="/usr/bin/python"
let g:python3_host_prog="/usr/bin/python3"
let g:ctrlp_show_hidden=1

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
