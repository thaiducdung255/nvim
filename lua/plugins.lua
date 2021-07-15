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

return require('packer').startup(
   function(use)
      -- Packer can manage itself as an optional plugin
      use 'wbthomason/packer.nvim'

      -- LSP
      use { 'neovim/nvim-lspconfig', opt = true }
      use { 'glepnir/lspsaga.nvim', opt = true }
      use { 'kabouzeid/nvim-lspinstall', opt = true }
      use { 'ray-x/lsp_signature.nvim', opt = true }

      -- Telescope
      use { 'nvim-lua/popup.nvim', opt = true }
      use { 'nvim-lua/plenary.nvim', opt = true }
      use { 'nvim-telescope/telescope.nvim', opt = true }

      -- vim motions
      use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
          -- you can configure Hop the way you like here; see :h hop-config
          require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
      }

      -- auto update root directory
      use {
        "ahmedkhalf/lsp-rooter.nvim",
        config = function()
          require("lsp-rooter").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
      }

      -- Autocomplete
      use { 'hrsh7th/nvim-compe', opt = true }
      use { 'hrsh7th/vim-vsnip', opt = true }
      use { 'hrsh7th/vim-vsnip-integ', opt = true }

      -- line peek
      use 'nacro90/numb.nvim'

      -- Cursor line
      use { 'xiyaowong/nvim-cursorword', otp = true }

      -- Find and replace
      use { 'windwp/nvim-spectre', opt = true }

      -- Treesitter
      use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
      use { 'windwp/nvim-ts-autotag', opt = true }

      -- rainbow parentheses
      use 'p00f/nvim-ts-rainbow'

      -- swap args
      use 'mizlan/iswap.nvim'

      -- Explorer
      use 'kyazdani42/nvim-tree.lua'
      use 'mbbill/undotree'

      -- use 'Yggdroot/indentLine'
      use 'lukas-reineke/indent-blankline.nvim'
      use 'szw/vim-maximizer'
      use 'AndrewRadev/switch.vim'
      use 'voldikss/vim-floaterm'
      use 'ap/vim-css-color'

      -- Git
      use { 'lewis6991/gitsigns.nvim', opt = true }
      use 'APZelos/blamer.nvim'
      use 'tanvirtin/vgit.nvim'

      use { 'ChristianChiarulli/dashboard-nvim', opt = true }
      use {'windwp/nvim-autopairs', opt = true}
      use { 'terrortylor/nvim-comment', opt = true }

      -- Color scheme
      use { 'christianchiarulli/nvcode-color-schemes.vim', opt = true }

      -- Icons
      use { 'kyazdani42/nvim-web-devicons', opt = true }

      -- Status Line and Bufferline
      use { 'glepnir/galaxyline.nvim', opt = true }
      use { 'romgrk/barbar.nvim', opt = true }

      -- Rest api
      use { 'diepm/vim-rest-console' }

      -- Outline
      use { 'simrat39/symbols-outline.nvim', opt = true }

      -- Dim inactive windows
      use { 'sunjon/shade.nvim', opt = true }

      require_plugin('nvim-spectre')
      require_plugin('nvim-cursorword')
      require_plugin('vgit')
      require_plugin('shade.nvim')
      require_plugin('symbols-outline.nvim')
      require_plugin('lsp_signature.nvim')
      require_plugin('nvim-lspconfig')
      require_plugin('lspsaga.nvim')
      require_plugin('nvim-lspinstall')
      require_plugin('popup.nvim')
      require_plugin('plenary.nvim')
      require_plugin('telescope.nvim')
      require_plugin('vim-easymotion')
      require_plugin('nvim-compe')
      require_plugin('vim-vsnip')
      require_plugin('nvim-treesitter')
      require_plugin('nvim-ts-autotag')
      require_plugin('nvim-tree.lua')
      require_plugin('gitsigns.nvim')
      require_plugin('dashboard-nvim')
      require_plugin('nvim-autopairs')
      require_plugin('vim-rest-console')
      require_plugin('blamer.nvim')
      require_plugin('undotree')
      require_plugin('indentLine')
      require_plugin('vim-maximizer')
      require_plugin('switch.vim')
      require_plugin('vim-floaterm')
      require_plugin('vim-css-color')
      require_plugin('nvim-comment')
      require_plugin('vim-vsnp')
      require_plugin('vim-vsnp-integ')
      require_plugin('nvcode-color-schemes.vim')
      require_plugin('nvim-web-devicons')
      require_plugin('galaxyline.nvim')
      require_plugin('barbar.nvim')
   end
)
