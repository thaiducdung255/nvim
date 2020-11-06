call plug#begin('/home/df/.vim/autoload')
  Plug 'Valloric/YouCompleteMe'
  Plug 'mbbill/undotree'
  Plug 'dense-analysis/ale'
	Plug 'RRethy/vim-illuminate'
	Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
	Plug 'APZelos/blamer.nvim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'rhysd/clever-f.vim'
  Plug 'szw/vim-maximizer'
  Plug 'tpope/vim-commentary'
  Plug 'liuchengxu/vim-which-key'

	" FZF integration
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'

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

  " folder + tab management
  Plug 'preservim/nerdtree'
  Plug 'kien/tabman.vim'

  " snippets plugs
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'

  Plug 'ervandew/supertab'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'Yggdroot/indentLine'

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
