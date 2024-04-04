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
			vim.keymap.set(
				"n",
				"<leader>tr",
				"<cmd>lua require('neotest').run.run()<CR>",
				{ desc = "[T]est [R]un Nearest" }
			),

			-- Run the current file
			vim.keymap.set(
				"n",
				"<leader>tf",
				"<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
				{ desc = "[T]est Run [F]ile" }
			),

			--Debug the nearest test (requires nvim-dap and adapter support)
			vim.keymap.set(
				"n",
				"<leader>td",
				"<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
				{ desc = "[T]est [D]ebug" }
			),

			--Stop the nearest test, see :h neotest.run.stop()
			vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').run.stop()<CR>", { desc = "[T]est [S]top" }),
			--
			--Attach to the nearest test, see :h neotest.run.attach()
			--require("neotest").run.attach()

			-- neotest.Config.output_pannel({ enabled = true }), --, 'lua require("neotest").output_panel.open()')

			adapters = {
				require("neotest-python")({
					-- Extra arguments for nvim-dap configuration
					-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
					dap = { justMyCode = false },
					-- Command line arguments for runner
					-- Can also be a function to return dynamic values
					args = { "-sv" },  -- alluredir
					args = { "-sv", "--alluredir=./results" },
					-- Runner to use. Will use pytest if available by default.
					-- Can be a function to return dynamic value.
					runner = "pytest",
					-- Custom python path for the runner.
					-- Can be a string or a list of strings.
					-- Can also be a function to return dynamic value.
					-- If not provided, the path will be inferred by checking for
					-- virtual envs in the local directory and for Pipenev/Poetry configs

					-- Returns if a given file path is a test file.
					-- NB: This function is called a lot so don't perform any heavy tasks within it.
					-- is_test_file = function(file_path)
					--   ...
					-- end,
					-- -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
					-- instances for files containing a parametrize mark (default: false)
					pytest_discover_instances = true,
				}),
			},
		})
	end,
}
