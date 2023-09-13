vim.g.mapleader          = ' '
vim.g.python_host_prog   = '/usr/bin/python'
vim.g.python3_host_prog  = '/usr/bin/python3'
vim.g.ruby_host_prog     = '~/.local/share/gem/ruby/3.0.0/bin/neovim-ruby-host'
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd('set mouse=')
vim.cmd('syntax enable')
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')
vim.cmd('set wildignore+=*/tmp/*,*/node_modules/*,*/.git/*,*/dist/*,*/debug-adapters/*')
vim.cmd('set complete-=5')

vim.o.completeopt     = 'menuone,noselect,preview'
vim.o.foldcolumn      = '0'
vim.o.foldlevel       = 99
vim.o.foldlevelstart  = 99
vim.o.foldenable      = true
vim.o.laststatus      = 3
vim.o.shell           = 'zsh'
vim.o.hidden          = true
vim.o.encoding        = 'utf-8'
vim.o.lazyredraw      = true
vim.o.updatetime      = 200
vim.o.ignorecase      = true
vim.o.smartcase       = true
vim.o.splitbelow      = true
vim.o.splitright      = true
vim.o.backup          = false
vim.o.termguicolors   = true
vim.o.writebackup     = false
vim.o.timeoutlen      = 750
vim.o.clipboard       = 'unnamedplus'
vim.o.showmode        = false
vim.o.fileformat      = 'unix'
vim.o.undodir         = os.getenv('HOME') .. '/.nvim/undodir'
vim.o.undofile        = true
vim.o.incsearch       = true
vim.o.autoread        = true
vim.o.autowrite       = true
vim.o.hlsearch        = true
vim.o.history         = 100
vim.o.tabstop         = 2
vim.o.softtabstop     = 2
vim.o.shiftwidth      = 2
vim.o.expandtab       = true
vim.o.smartindent     = true
vim.o.autoindent      = true
vim.o.copyindent      = true
vim.o.swapfile        = false
vim.wo.number         = true
vim.wo.cursorline     = true
vim.wo.relativenumber = true
vim.wo.wrap           = false
vim.wo.signcolumn     = 'yes'

vim.api.nvim_create_autocmd(
   'InsertEnter',
   {
      pattern = '*',
      callback = function()
         vim.wo.relativenumber = false
         vim.cmd([[let @/='']])
      end
   }
)

vim.api.nvim_create_autocmd(
   'InsertLeave',
   {
      pattern = '*',
      callback = function()
         vim.wo.relativenumber = true
      end
   }
)

vim.api.nvim_create_autocmd(
   'VimEnter',
   {
      pattern = '*',
      callback = function()
         vim.cmd('set cmdheight=0')
      end
   }
)

vim.api.nvim_create_autocmd(
   'FileType',
   {
      pattern = 'make',
      callback = function()
         vim.o.expandtab = false
      end
   }
)

vim.api.nvim_create_autocmd(
   'FileType',
   {
      pattern = 'dbout',
      callback = function()
         vim.wo.relativenumber = false
         vim.wo.number = false
      end
   }
)
