vim.g.mapleader            = ' '
vim.g.python_host_prog     = '/usr/bin/python2'
vim.g.python3_host_prog    = '/usr/bin/python3'
vim.g.ruby_host_prog       = '~/.gem/ruby/2.7.0/bin/neovim-ruby-host'

vim.cmd('syntax enable')
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')
vim.cmd('set wildignore+=*/tmp/*,*/node_modules/*,*/.git/*,*/dist/*')
vim.cmd('set complete-=5')

vim.o.shell             = 'zsh'
vim.o.encoding          = 'utf-8'
vim.o.lazyredraw        = true
vim.o.updatetime        = 200
vim.o.ignorecase        = true
vim.o.smartcase         = true
vim.o.splitbelow        = true
vim.o.splitright        = true
vim.o.cmdheight         = 1
vim.o.backup            = false
vim.o.termguicolors     = true
vim.o.writebackup       = false
vim.o.timeoutlen        = 750
vim.o.clipboard         = 'unnamedplus'
vim.o.showmode          = false
vim.o.fileformat        = 'unix'
vim.o.undodir           = '/home/df/.vim/undodir'
vim.o.undofile          = true
vim.o.incsearch         = true
vim.o.autoread          = true
vim.o.hlsearch          = false
vim.o.history           = 100 

vim.bo.tabstop          = 3
vim.bo.softtabstop      = 3
vim.bo.shiftwidth       = 3
vim.bo.expandtab        = true
vim.bo.smartindent      = true
vim.bo.autoindent       = true
vim.bo.copyindent       = true
vim.bo.swapfile         = false
vim.o.tabstop           = 3
vim.o.softtabstop       = 3
vim.o.shiftwidth        = 3
vim.o.expandtab         = true
vim.o.smartindent       = true
vim.o.autoindent        = true
vim.o.copyindent        = true
vim.o.swapfile          = false

vim.wo.number           = true
vim.wo.cursorline       = true
vim.wo.relativenumber   = true
vim.wo.wrap             = false
vim.wo.signcolumn       = 'yes'
