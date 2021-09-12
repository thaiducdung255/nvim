local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
   execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
   execute 'packadd packer.nvim'
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
   local plugin_prefix = fn.stdpath('data') .. '/site/pack/packer/opt/'
   local plugin_path = plugin_prefix .. plugin .. '/'
   local ok, err, code = os.rename(plugin_path, plugin_path)

   if not ok then
      if code == 13 then
         return true
      end
   end

   if ok then
      vim.cmd('packadd ' .. plugin)
   end

   return ok, err, code
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup({
   function(use)
      -- Packer can manage itself as an optional plugin
      use 'wbthomason/packer.nvim'

      -- LSP
      use { 'neovim/nvim-lspconfig' }
      use { 'glepnir/lspsaga.nvim' }
      use { 'kabouzeid/nvim-lspinstall' }
      use { 'alexaandru/nvim-lspupdate' }

      -- signature help
      use 'ray-x/lsp_signature.nvim'

      -- Telescope
      use { 'nvim-lua/popup.nvim' }
      use { 'nvim-lua/plenary.nvim' }
      use { 'nvim-telescope/telescope.nvim' }
      use {'nvim-telescope/telescope-hop.nvim'}

      -- vim motions
      use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
          -- you can configure Hop the way you like here; see :h hop-config
          require'hop'.setup { keys = 'asdfghjkl;qwertyuiop' }
        end
      }

      -- auto update root directory
      use {
         "ahmedkhalf/lsp-rooter.nvim",
         config = function()
            require("lsp-rooter").setup {}
         end
      }

      -- Autocomplete
      -- use 'kristijanhusak/vim-dadbod-completion'
      use { 'hrsh7th/vim-vsnip' }
      use 'windwp/nvim-autopairs'
      use {
         'hrsh7th/nvim-cmp',
         requires = {
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-buffer',
            'tzachar/cmp-tabnine',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
         }
      }

      -- line peek
      use 'nacro90/numb.nvim'

      -- high all current words
      use { 'xiyaowong/nvim-cursorword', otp = true }

      -- Find and replace
      use { 'windwp/nvim-spectre' }

      -- Treesitter
      use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
      use 'nvim-treesitter/playground'
      use { 'windwp/nvim-ts-autotag' }
      use 'romgrk/nvim-treesitter-context'

      -- debugger
      -- use 'puremourning/vimspector'
      use 'mfussenegger/nvim-dap'

      -- db ui
      use 'tpope/vim-dadbod'
      use 'kristijanhusak/vim-dadbod-ui'

      -- rainbow parentheses
      use 'p00f/nvim-ts-rainbow'

      -- swap args
      use 'mizlan/iswap.nvim'

      -- align text
      use 'junegunn/vim-easy-align'

      -- Explorer
      use 'kyazdani42/nvim-tree.lua'

      -- Undo tree
      use 'mbbill/undotree'

      -- indent line
      use 'lukas-reineke/indent-blankline.nvim'

      -- maximize window
      use 'szw/vim-maximizer'

      -- text transform
      use 'AndrewRadev/switch.vim'

      -- float terminal
      use 'voldikss/vim-floaterm'

      -- Git
      use { 'lewis6991/gitsigns.nvim' }
      use 'kdheepak/lazygit.nvim'
      use 'APZelos/blamer.nvim'

      -- home page
      use { 'ChristianChiarulli/dashboard-nvim' }

      -- editorconfig
      use 'editorconfig/editorconfig-vim'

      -- comment
      use { 'terrortylor/nvim-comment' }

      -- Color scheme
      use 'sainnhe/edge'
      use 'norcalli/nvim-colorizer.lua'

      -- icons
      use { 'kyazdani42/nvim-web-devicons' }

      -- Status Line and Bufferline
      use { 'glepnir/galaxyline.nvim' }
      use { 'romgrk/barbar.nvim' }

      -- Rest api
      use {
         'NTBBloodbath/rest.nvim',
         requires = { 'nvim-lua/plenary.nvim' },
         config = function()
            require('rest-nvim').setup()
         end
      }
   end,
   config = {
      display = {
         open_fn = require('packer.util').float,
      }
   }
})
