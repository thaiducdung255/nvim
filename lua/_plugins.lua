local execute      = vim.api.nvim_command
local fn           = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
   execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
   execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

return require('packer').startup({
   function(use)
      use { 'wbthomason/packer.nvim' }
      use { 'nvim-lua/popup.nvim' }
      use { 'nvim-lua/plenary.nvim' }

      -- LSP
      use { 'neovim/nvim-lspconfig' }
      use { 'b0o/schemastore.nvim' }
      use { 'dnlhc/glance.nvim' }
      use { 'lvimuser/lsp-inlayhints.nvim' }

      -- telescope
      use { 'nvim-telescope/telescope.nvim' }
      use { 'nvim-telescope/telescope-hop.nvim' }

      use {
         'nvim-telescope/telescope-fzy-native.nvim',
         run = 'make'
      }

      use { 'nvim-telescope/telescope-media-files.nvim' }
      use { 'cljoly/telescope-repo.nvim' }
      use { 'debugloop/telescope-undo.nvim' }

      -- vim motions
      use { 'phaazon/hop.nvim' }

      -- auto update root directory
      use { 'ahmedkhalf/lsp-rooter.nvim' }

      -- autocomplete
      use {
         'Exafunction/codeium.vim',
      }

      use {
         'hrsh7th/nvim-cmp',
         requires = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'dmitmel/cmp-cmdline-history',
            'lukas-reineke/cmp-under-comparator',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lsp',
         }
      }

      -- line peek
      use 'nacro90/numb.nvim'

      -- find and replace
      use { 'windwp/nvim-spectre' }

      -- smooth scroll
      use 'karb94/neoscroll.nvim'

      -- treesitter
      use {
         'nvim-treesitter/nvim-treesitter',
         -- run = ':TSInstall lua python go http css typescript javascript tsx make dockerfile css html json bash rasi yaml rust prisma'
         run = ':TSUpdateSync'
      }
      use { 'windwp/nvim-ts-autotag' }
      use 'nvim-treesitter/nvim-treesitter-refactor'
      use 'm-demare/hlargs.nvim'

      -- debugger
      use 'mfussenegger/nvim-dap'

      -- ssh
      use {
         'chipsenkbeil/distant.nvim',
         config = function()
            require('distant').setup {
               ['*'] = require('distant.settings').chip_default()
            }
         end
      }

      -- db management
      -- use 'tpope/vim-dadbod'
      -- use 'kristijanhusak/vim-dadbod-ui'
      -- use 'kristijanhusak/vim-dadbod-completion'

      -- use 'dinhhuy258/vim-database'
      use 'thaiducdung255/nvim-pydb'

      -- rainbow parentheses
      use 'p00f/nvim-ts-rainbow'

      -- align text
      use 'junegunn/vim-easy-align'

      -- explorer
      use 'kyazdani42/nvim-tree.lua'

      -- indent line
      use 'lukas-reineke/indent-blankline.nvim'

      -- maximize window
      use { 'anuvyklack/windows.nvim',
         requires = {
            'anuvyklack/middleclass',
            'anuvyklack/animation.nvim'
         },
      }

      use { 'szw/vim-maximizer' }

      -- float terminal
      use { 'akinsho/toggleterm.nvim' }

      -- git
      use { 'lewis6991/gitsigns.nvim' }
      use 'kdheepak/lazygit.nvim'

      use {
         'sindrets/diffview.nvim',
         requires = 'nvim-lua/plenary.nvim'
      }

      -- editorconfig
      use 'editorconfig/editorconfig-vim'

      -- macro
      use 'chrisgrieser/nvim-recorder'

      -- comment
      use { 'numToStr/Comment.nvim' }

      -- Color scheme
      use {
         'sainnhe/edge',
         commit = 'd48ab6039d0f0e4170f921f5e48f4d3e9f0898db'
      }

      -- highlight color value
      use 'norcalli/nvim-colorizer.lua'

      -- icons
      use { 'kyazdani42/nvim-web-devicons' }

      -- Status Line and Bufferline
      use { 'SmiteshP/nvim-gps' }
      use { 'nvim-lualine/lualine.nvim' }

      -- Rest client
      use {
         'teto/rest.nvim',
         branch = 'always-send-string',
         requires = { 'nvim-lua/plenary.nvim' },
      }

      -- smart fold
      use {
         'kevinhwang91/nvim-ufo',
         requires = {
            'kevinhwang91/promise-async',
            'anuvyklack/pretty-fold.nvim',
         }
      }

      -- cache plugins
      use 'lewis6991/impatient.nvim'

      -- split/join lines
      use 'AndrewRadev/splitjoin.vim'
   end,
   config = {
      display = {
         open_fn = require('packer.util').float,
      }
   }
})
