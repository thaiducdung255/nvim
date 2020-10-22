call plug#begin('/home/df/.vim/autoload')
  Plug 'Valloric/YouCompleteMe'
  Plug 'mbbill/undotree'
  Plug 'dense-analysis/ale'

  " airline plugs
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'diepm/vim-rest-console'
  Plug 'crusoexia/vim-monokai'

  " easymotion + fuzzy-search + incsearch
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'

  Plug 'kien/ctrlp.vim'

  " snippets plugs
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'ervandew/supertab'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'nathanaelkane/vim-indent-guides'

  " git plugs
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'

  Plug 'zxqfl/tabnine-vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'rhysd/clever-f.vim'
  Plug 'dkprice/vim-easygrep'
  Plug 'szw/vim-maximizer'
  Plug 'tpope/vim-commentary'
call plug#end()

nnoremap <silent><LEADER>pi :PlugInstall<CR>
nnoremap <silent><LEADER>pc :PlugClean<CR>
nnoremap <silent><LEADER>pu :PlugUpdate<CR>
nnoremap <silent><LEADER>pg :PlugUpgrade<CR>
