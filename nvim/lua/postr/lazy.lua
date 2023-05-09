local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Beauty
    "EdenEast/nightfox.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua",
    -- For code
    "tpope/vim-surround",
    "tpope/vim-commentary",
    "nvim-lualine/lualine.nvim",
    "windwp/nvim-autopairs",
    "akinsho/bufferline.nvim",
    "christoomey/vim-tmux-navigator",
    "Pocco81/auto-save.nvim",

    -- Helpers
    "rhysd/vim-grammarous",
    "tpope/vim-fugitive",
    {'akinsho/toggleterm.nvim', version = "*", config = true},

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- DAP
    "mfussenegger/nvim-dap-python",

    -- Lsp
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            { "neovim/nvim-lspconfig" },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' },
        }
    }

}


require("lazy").setup(plugins, opts)
require('lualine').setup()
