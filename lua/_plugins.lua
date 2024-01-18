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
      use { 'smoka7/hop.nvim' }

      -- auto complete
      use {
         'neoclide/coc.nvim',
         branch = 'release',
         requires = {
            'rcarriga/nvim-notify',
            'fannheyward/telescope-coc.nvim',
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

      -- find and replace
      use 'nvim-pack/nvim-spectre'

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
      }

      -- highlight color value
      use 'norcalli/nvim-colorizer.lua'

      -- icons
      use { 'kyazdani42/nvim-web-devicons' }

      -- Status Line and Bufferline
      use {
         'nvim-lualine/lualine.nvim',
      }

      -- Rest client
      use {
         'teto/rest.nvim',
         branch = 'always-send-string',
         requires = { 'nvim-lua/plenary.nvim' },
      }

      -- GraphQL client
      use {
         'thaiducdung255/denops-graphql.vim',
         requires = { 'vim-denops/denops.vim' },
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
         'kristijanhusak/vim-dadbod-ui',
         'tpope/vim-dadbod'
      }

      -- cache plugins
      use 'lewis6991/impatient.nvim'

      -- hydra
      use 'anuvyklack/hydra.nvim'

      -- kitty config
      use 'fladson/vim-kitty'

      -- bard
      use 'deepskyblue86/bard-nvim'
   end,
   config = {
      display = {
         open_fn = require('packer.util').float,
      }
   }
})
