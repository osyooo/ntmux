return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = true,
      auto_save_enabled = true,
      auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
      auto_session_suppress_dirs = {
        "~/",
        "~/.config/nvim",
        "~/Downloads",
        "~/Desktop/Autotests"
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
  end,
}