return {
    "Pocco81/auto-save.nvim",
    config = function()
        local auto_save = require("auto-save")
        auto_save.setup({
        enabled = true,
        execution_message = {
            message = function()
                return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
            end
        }
    })
    end
}
