return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-python",
	},
	event = "VeryLazy",
	config = function()
		local neotest = require("neotest")

		neotest.setup({

			-- Run the nearest test
			vim.keymap.set( "n", "<leader>tr", "<cmd>lua require('neotest').run.run()<CR>", { desc = "[T]est [R]un Nearest" }),

			-- Run the current file
			vim.keymap.set( "n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "[T]est Run [F]ile" }),

			--Debug the nearest test (requires nvim-dap and adapter support)
			vim.keymap.set( "n", "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", { desc = "[T]est [D]ebug" }),

			--Stop the nearest test, see :h neotest.run.stop()
			vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').run.stop()<CR>", { desc = "[T]est [S]top" }),

			--Attach to the nearest test, see :h neotest.run.attach()
			--require("neotest").run.attach()
      --
      --
      --
    -- lua require("neotest").output_panel.toggle()

    -- lua require("neotest").output_panel.clear()
			-- Test output panel
			vim.keymap.set( "n", "<leader>to", "<cmd>lua require('neotest').output_panel.toggle()<CR>", { desc = "[T]est [O]tput" }),

			-- Test output panel clear
			vim.keymap.set( "n", "<leader>tx", "<cmd>lua require('neotest').output_panel.clear()<CR>", { desc = "[T]est Clear" }),


			output = {
				enabled = false,
        quiet = true,
        last_run = true,
        auto_close = true,
				-- open_on_run = "short",
			},
			output_panel = {
				enabled = true,
				open = "bot split | resize 15",
			},
			adapters = {
				require("neotest-python")({
					-- Extra arguments for nvim-dap configuration
					-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
					dap = {
            justMyCode = false,
            console = "integratedTerminal",
          },
					args = { "-sv" },
          python = require('venv-selector').get_active_path(),
					runner = "pytest",
					-- -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
					-- instances for files containing a parametrize mark (default: false)
					pytest_discover_instances = true,
				}),
			},
		})
	end,
}
