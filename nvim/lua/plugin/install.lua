local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
end

--expects the name of the config file
function get_setup(name)
    return string.format('require("setup/%s")', name)
end

return require('packer').startup({
    function(use) --my plugins
    --packer
    use 'wbthomason/packer.nvim'
    --theme
    use 'folke/tokyonight.nvim'
    --file navigation, beautiful and configurable icon
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' --optional, for file icon
        }
    }
    --managing tabs, buffers
    use {
        'akinsho/bufferline.nvim',
        tag = "*",
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }
    --pretty and functional statusline
    use 'feline-nvim/feline.nvim'
    --git diffs and more
    use 'lewis6991/gitsigns.nvim'
    --file searching, previewing image and text files and more
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 
            'nvim-lua/plenary.nvim',
        },
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    --syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate' 
    }
    --alpha
    use 'goolord/alpha-nvim'
    --comment
    use 'numToStr/Comment.nvim'
    --neovim lsp configuration
    use 'andymass/vim-matchup'
    use 'neovim/nvim-lspconfig'
    use 'ray-x/lsp_signature.nvim'
    use 'max397574/better-escape.nvim'
    use 'williamboman/nvim-lsp-installer'
    --autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'windwp/nvim-autopairs' --autoclosing braces and html tags
    use 'lukas-reineke/indent-blankline.nvim' --indentlines
    use 'L3MON4D3/LuaSnip' --useful snippets
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    --automatically set up your configuration after cloning packer.nvim
    --put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end
        },
        profile = {
            enable = true,
            --the amount in ms that a plugins load time must be over for it to be included in the profile
            threshold = 1
        },
    },
})
