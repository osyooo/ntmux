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
    "sidebar-nvim/sidebar.nvim",
    -- For code
    "tpope/vim-surround",
    "tpope/vim-commentary",
    "nvim-lualine/lualine.nvim",
    "windwp/nvim-autopairs",
    "akinsho/bufferline.nvim",
    "christoomey/vim-tmux-navigator",
    "Pocco81/auto-save.nvim",
    "airblade/vim-gitgutter",

    -- Helpers
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    },
    "rhysd/vim-grammarous",
    "tpope/vim-fugitive",
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {
        "gennaro-tedesco/nvim-possession",
        dependencies = {
            "ibhagwan/fzf-lua",
        config = true,
        init = function()
            local possession = require("nvim-possession")
            vim.keymap.set("n", "<leader>sl", function()
                possession.list()
            end)
            vim.keymap.set("n", "<leader>sn", function()
                possession.new()
            end)
            vim.keymap.set("n", "<leader>su", function()
                possession.update()
            end)
            vim.keymap.set("n", "<leader>sd", function()
                possession.delete()
            end)
        end,
        },
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- DAP
    {
        "mfussenegger/nvim-dap",
        -- config = function (_, opts)
        --     require("postr.init").load_mappings("dap")
        -- end
    },
    {
        "mfussenegger/nvim-dap-python",
        -- tf = 'python',
        -- dependencies = {
        --     "mfussenegger/nvim-dap",
        --     "rcarriga/nvim-dap-ui"
        -- },
        -- config = function (_, opts)
        --     local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        --     require("dap-python").setup(path)
        --     -- require("postr.init").load_mappings("dap")
        -- end
    },
    {
        "rcarriga/nvim-dap-ui",
        -- dependencies = "mfussenegger/nvim-dap",
        -- config = function ()
        --     local dap = require("dap")
        --     local dapui = require("dapui")
        --     dapui.setup()
        --     dap.listeners.after.event_initialized["dapui_config"] = function ()
        --         dapui.open()
        --     end
        --     dap.listeners.before.event_terminated["dapui_config"] = function ()
        --         dapui.close()
        --     end
        --     dap.listeners.before.event_exited["dapui_config"] = function ()
        --         dapui.close()
        --     end
        -- end
    },


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
