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
      -- Package manager + misc
      use { 'wbthomason/packer.nvim' }
      use { 'nvim-lua/popup.nvim' }
      use { 'nvim-lua/plenary.nvim' }

      use {
         'axkirillov/hbac.nvim',
         config = function()
            require('hbac').setup({
               autoclose = true,
               threshold = 10
            })
         end
      }

      -- LSP
      use { 'neovim/nvim-lspconfig' }
      use { 'b0o/schemastore.nvim' }
      use { 'dnlhc/glance.nvim' }

      -- telescope
      use {
         'nvim-telescope/telescope.nvim',
         requires = {
            'nvim-telescope/telescope-hop.nvim',
            'cljoly/telescope-repo.nvim',
            'debugloop/telescope-undo.nvim',
            'ahmedkhalf/lsp-rooter.nvim'
         }
      }
      use {
         'nvim-telescope/telescope-fzf-native.nvim',
         run = 'make',
      }

      -- vim motions
      use { 'phaazon/hop.nvim' }

      use {
         'hrsh7th/nvim-cmp',
         requires = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-nvim-lua',
            'FelipeLema/cmp-async-path',
            'hrsh7th/cmp-cmdline',
            'dmitmel/cmp-cmdline-history',
            'lukas-reineke/cmp-under-comparator',
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lsp-document-symbol',
            'windwp/nvim-autopairs'
         }
      }

      -- line peek
      use 'nacro90/numb.nvim'

      -- smooth scroll
      use 'karb94/neoscroll.nvim'

      -- treesitter
      use {
         'nvim-treesitter/nvim-treesitter',
         requires = {
            'windwp/nvim-ts-autotag',
            'nvim-treesitter/nvim-treesitter-refactor',
            'm-demare/hlargs.nvim',
            'nvim-treesitter/nvim-treesitter-textobjects'
         }
      }

      -- rainbow parentheses
      use 'HiPhish/rainbow-delimiters.nvim'

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

      use {
         'sindrets/diffview.nvim',
         requires = 'nvim-lua/plenary.nvim'
      }

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
      use {
         'nvim-lualine/lualine.nvim',
         requires = {
            'SmiteshP/nvim-navic'
         }
      }

      use {
         'j-hui/fidget.nvim',
         tag = 'legacy',
         config = function()
            require('fidget').setup({
            })
         end
      }

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

      -- split/join lines
      use 'AndrewRadev/splitjoin.vim'

      -- database ui
      use {
         'thaiducdung255/nvim-pydb',
      }

      -- cache plugins
      use 'lewis6991/impatient.nvim'

      -- hydra
      use 'anuvyklack/hydra.nvim'
   end,
   config = {
      display = {
         open_fn = require('packer.util').float,
      }
   }
})
