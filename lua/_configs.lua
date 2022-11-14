vim.g.theme             = 'edge'
vim.g.mapleader         = ' '
vim.g.python_host_prog  = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.ruby_host_prog    = '/usr/bin/neovim-ruby-host'

vim.cmd('syntax enable')
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')
vim.cmd('set wildignore+=*/tmp/*,*/node_modules/*,*/.git/*,*/dist/*,*/debug-adapters/*')
vim.cmd('set complete-=5')

vim.o.foldcolumn     = '0'
vim.o.foldlevel      = 99
vim.o.foldlevelstart = 99
vim.o.foldenable     = true
vim.o.laststatus     = 3
vim.o.shell          = 'zsh'
vim.o.hidden         = true
vim.o.encoding       = 'utf-8'
vim.o.lazyredraw     = true
vim.o.updatetime     = 200
vim.o.ignorecase     = true
vim.o.smartcase      = true
vim.o.splitbelow     = true
vim.o.splitright     = true
vim.o.cmdheight      = 1
vim.o.backup         = false
vim.o.termguicolors  = true
vim.o.writebackup    = false
vim.o.timeoutlen     = 750
vim.o.clipboard      = 'unnamedplus'
vim.o.showmode       = false
vim.o.fileformat     = 'unix'
vim.o.undodir        = os.getenv('HOME') .. '/.nvim/undodir'
vim.o.undofile       = true
vim.o.incsearch      = true
vim.o.autoread       = true
vim.o.autowrite      = true
vim.o.hlsearch       = false
vim.o.history        = 100
vim.o.tabstop        = 3
vim.o.softtabstop    = 3
vim.o.shiftwidth     = 3
vim.o.expandtab      = true
vim.o.smartindent    = true
vim.o.autoindent     = true
vim.o.copyindent     = true
vim.o.swapfile       = false
vim.o.cmdheight      = 0

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
   'FileType',
   {
      pattern = 'make',

      callback = function()
         vim.o.expandtab = false
      end
   }
)
