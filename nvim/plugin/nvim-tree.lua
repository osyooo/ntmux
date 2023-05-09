require("nvim-tree").setup({
    view = {
        width = 40,
        -- float = {
        --     quit_on_focus_loss = false
        -- },
    },
    filters = {
        dotfiles = false,
    },
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

