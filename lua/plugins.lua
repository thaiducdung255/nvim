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
      use 'wbthomason/packer.nvim'

      -- LSP
      use { 'neovim/nvim-lspconfig' }
      use { 'tami5/lspsaga.nvim' }
      use { 'b0o/schemastore.nvim' }

      -- outline
      use 'simrat39/symbols-outline.nvim'

      -- telescope
      use { 'nvim-lua/popup.nvim' }
      use { 'nvim-lua/plenary.nvim' }
      use { 'nvim-telescope/telescope.nvim' }
      use { 'nvim-telescope/telescope-hop.nvim' }
      use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
      use { 'nvim-telescope/telescope-media-files.nvim' }
      use { 'TC72/telescope-tele-tabby.nvim' }

      -- vim motions
      use { 'phaazon/hop.nvim' }

      -- auto update root directory
      use { 'ahmedkhalf/lsp-rooter.nvim' }

      -- autocomplete
      use 'windwp/nvim-autopairs'
      use 'github/copilot.vim'

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
            'hrsh7th/cmp-copilot'
         }
      }

      -- line peek
      use 'nacro90/numb.nvim'

      -- highlight current words
      use { 'xiyaowong/nvim-cursorword' }

      -- find and replace
      use { 'windwp/nvim-spectre' }

      -- treesitter
      use { 'nvim-treesitter/nvim-treesitter', run = ':TSInstall lua python go http css typescript javascript tsx make dockerfile css html json bash rasi' }
      use 'nvim-treesitter/playground'
      use { 'windwp/nvim-ts-autotag' }
      use 'nvim-treesitter/nvim-treesitter-refactor'
      use 'nvim-treesitter/nvim-treesitter-textobjects'
      use 'm-demare/hlargs.nvim'

      -- debugger
      use 'mfussenegger/nvim-dap'

      -- db management
      use 'tpope/vim-dadbod'
      use 'kristijanhusak/vim-dadbod-ui'

      -- rainbow parentheses
      use 'p00f/nvim-ts-rainbow'

      -- align text
      use 'junegunn/vim-easy-align'

      -- explorer
      use 'kyazdani42/nvim-tree.lua'

      -- undo tree
      use 'mbbill/undotree'

      -- indent line
      use 'lukas-reineke/indent-blankline.nvim'

      -- maximize window
      use 'szw/vim-maximizer'

      -- text transform
      use 'AndrewRadev/switch.vim'

      -- float terminal
      use { 'akinsho/toggleterm.nvim' }

      -- git
      use { 'lewis6991/gitsigns.nvim' }
      use 'kdheepak/lazygit.nvim'

      -- editorconfig
      use 'editorconfig/editorconfig-vim'

      -- comment
      use { 'numToStr/Comment.nvim' }

      -- Color scheme
      use 'sainnhe/edge'

      -- highlight color value
      use 'norcalli/nvim-colorizer.lua'

      -- icons
      use { 'kyazdani42/nvim-web-devicons' }

      -- Status Line and Bufferline
      use { 'SmiteshP/nvim-gps' }
      use { 'nvim-lualine/lualine.nvim' }

      use {
         'akinsho/bufferline.nvim',
         requires = 'kyazdani42/nvim-web-devicons'
      }

      -- rest api
      use {
         'NTBBloodbath/rest.nvim',
         requires = { 'nvim-lua/plenary.nvim' },
      }

      -- scrollbar
      use {
         'petertriho/nvim-scrollbar',
      }

      -- smart fold
      use {
         'anuvyklack/pretty-fold.nvim',
         requires = { 'anuvyklack/nvim-keymap-amend' },
         config = function()
            require('pretty-fold').setup()
            require('pretty-fold.preview').setup()
         end
      }

   end,

   config = {
      display = {
         open_fn = require('packer.util').float,
      }
   }
})
