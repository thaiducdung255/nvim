call plug#begin('/home/df/.vim/autoload')
  Plug 'Valloric/YouCompleteMe'
  Plug 'mbbill/undotree'
  Plug 'dense-analysis/ale'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
"  Plug 'airblade/vim-gitgutter'
  Plug 'diepm/vim-rest-console'
  Plug 'crusoexia/vim-monokai'
  Plug 'easymotion/vim-easymotion'
  Plug 'kien/ctrlp.vim'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ervandew/supertab'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
call plug#end()

nnoremap <LEADER>pi :PlugInstall<CR>
nnoremap <LEADER>pc :PlugClean<CR>
