call plug#begin('/home/df/.vim/autoload')
   Plug 'godlygeek/tabular'
   Plug 'unblevable/quick-scope'
   Plug 'Yggdroot/indentLine'
   Plug 'neoclide/coc.nvim'
   Plug 'mbbill/undotree'
   Plug 'dense-analysis/ale'
   Plug 'RRethy/vim-illuminate'
   Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
   Plug 'jiangmiao/auto-pairs'
   Plug 'szw/vim-maximizer'
   Plug 'tpope/vim-commentary'
   Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
   Plug 'diepm/vim-rest-console'
   Plug 'vim-scripts/SearchComplete'
   Plug 'brooth/far.vim'
   Plug 'AndrewRadev/switch.vim'
   Plug 'terryma/vim-expand-region'
   Plug 'editorconfig/editorconfig-vim'
   Plug 'voldikss/vim-floaterm'
   Plug 'wellle/targets.vim'
   Plug 'tpope/vim-dadbod'
   Plug 'pangloss/vim-javascript'
   Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
   Plug 'ap/vim-css-color'

   " color schemes
   Plug 'jacoborus/tender.vim'

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

   " git plugs
   Plug 'mhinz/vim-signify'
   Plug 'tpope/vim-fugitive'
   Plug 'tpope/vim-rhubarb'
   Plug 'junegunn/gv.vim'
   Plug 'APZelos/blamer.nvim'

   call plug#end()

nnoremap <silent><LEADER>pi :w<CR>:source %<CR>:PlugInstall<CR>
nnoremap <silent><LEADER>pc :PlugClean<CR>
nnoremap <silent><LEADER>pu :PlugUpdate<CR>
nnoremap <silent><LEADER>pg :PlugUpgrade<CR>
