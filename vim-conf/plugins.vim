call plug#begin('/home/df/.vim/autoload')
  Plug 'Valloric/YouCompleteMe'
  Plug 'mbbill/undotree'
  Plug 'dense-analysis/ale'
  Plug 'RRethy/vim-illuminate'
  Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
  Plug 'APZelos/blamer.nvim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'szw/vim-maximizer'
  Plug 'tpope/vim-commentary'
  Plug 'rhysd/clever-f.vim'
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  Plug 'diepm/vim-rest-console'
  Plug 'ervandew/supertab'
  Plug 'luochen1990/rainbow'

  " color schemes
  Plug 'mhartington/oceanic-next'

	" FZF integration
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'

  " airline plugs
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " easymotion + fuzzy-search + incsearch
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'

  " folder + tab management
  Plug 'preservim/nerdtree'
  Plug 'kien/tabman.vim'

  " snippets plugs
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  " plugs for js
  Plug 'pangloss/vim-javascript'
  " Plug 'yuezk/vim-js'

  " plugs for ts
  Plug 'leafgarland/typescript-vim'

  " plugs for go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " git plugs
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'

  call plug#end()

nnoremap <silent><LEADER>pi :PlugInstall<CR>
nnoremap <silent><LEADER>pc :PlugClean<CR>
nnoremap <silent><LEADER>pu :PlugUpdate<CR>
nnoremap <silent><LEADER>pg :PlugUpgrade<CR>
