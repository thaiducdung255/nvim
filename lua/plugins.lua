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

        -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
        use {'neovim/nvim-lspconfig', opt = true}
        use {'glepnir/lspsaga.nvim', opt = true}
        use {'kabouzeid/nvim-lspinstall', opt = true}

        -- Telescope
        use {'nvim-lua/popup.nvim', opt = true}
        use {'nvim-lua/plenary.nvim', opt = true}
        use {'nvim-telescope/telescope.nvim', opt = true}

        -- Debugging
--        use {'mfussenegger/nvim-dap', opt = true}

        -- Autocomplete
        use {'hrsh7th/nvim-compe', opt = true}
        use {'hrsh7th/vim-vsnip', opt = true}
        use {'rafamadriz/friendly-snippets', opt = true}
--        use {'fatih/vim-go', run = ':GoUpdateBiaries'}

        -- Treesitter
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use {'windwp/nvim-ts-autotag', opt = true}

        -- Explorer
        use 'kyazdani42/nvim-tree.lua'
        use 'mbbill/undotree'
        use 'unblevable/quick-scope'
        use 'Yggdroot/indentLine'
        use 'szw/vim-maximizer'
        use 'AndrewRadev/switch.vim'
        use 'voldikss/vim-floaterm'
        use 'ap/vim-css-color'

        -- use {'lukas-reineke/indent-blankline.nvim', opt=true, branch = 'lua'}
        use {'lewis6991/gitsigns.nvim', opt = true}
        use 'APZelos/blamer.nvim'

        use {'ChristianChiarulli/dashboard-nvim', opt = true}
        use {'windwp/nvim-autopairs', opt = true}
--        use {'terrortylor/nvim-comment', opt = true}
--        use {'kevinhwang91/nvim-bqf', opt = true}

        -- Color scheme
        use {'christianchiarulli/nvcode-color-schemes.vim', opt = true}

        -- Icons
        use {'kyazdani42/nvim-web-devicons', opt = true}

        -- Status Line and Bufferline
        use {'glepnir/galaxyline.nvim', opt = true}
        use {'romgrk/barbar.nvim', opt = true}

        -- Rest api
         use {'diepm/vim-rest-console'}

        require_plugin('nvim-lspconfig')
        require_plugin('lspsaga.nvim')
        require_plugin('nvim-lspinstall')
        require_plugin('popup.nvim')
        require_plugin('plenary.nvim')
        require_plugin('telescope.nvim')
--        require_plugin('nvim-dap')
        require_plugin('nvim-compe')
        require_plugin('vim-vsnip')
        require_plugin('nvim-treesitter')
        require_plugin('nvim-ts-autotag')
        require_plugin('nvim-tree.lua')
        require_plugin('gitsigns.nvim')
        require_plugin('dashboard-nvim')
        require_plugin('nvim-autopairs')
        require_plugin('diepm/vim-rest-console')
        require_plugin('APZelos/blamer.nvim')
        require_plugin('mbbill/undotree')
        require_plugin('unblevable/quick-scope')
        require_plugin('Yggdroot/indentLine')
        require_plugin('szw/vim-maximizer')
        require_plugin('AndrewRadev/switch.vim')
        require_plugin('voldikss/vim-floaterm')
        require_plugin('ap/vim-css-color')
--        require_plugin('fatih/vim-go')
--        require_plugin('nvim-comment')
--        require_plugin('nvim-bqf')
        require_plugin('nvcode-color-schemes.vim')
        require_plugin('nvim-web-devicons')
        require_plugin('galaxyline.nvim')
        require_plugin('barbar.nvim')
    end
)
