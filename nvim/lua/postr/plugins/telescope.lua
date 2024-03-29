return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local tb = require("telescope.builtin")

		telescope.setup({
			extensions = {},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "-L", "--hidden", "--glob", "!**/.git/*" },
				},
			},
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		-- set keymaps
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", function()
			tb.live_grep({ additional_args = { "-L" } })
		end, { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", function()
			tb.grep_string({ additional_args = { "-L" } })
		end, { desc = "Find string under cursor in cwd" })

		-- Search visual text
		function vim.getVisualSelection()
			vim.cmd('noau normal! "vy"')
			local text = vim.fn.getreg("v")
			vim.fn.setreg("v", {})

			text = string.gsub(text, "\n", "")
			if #text > 0 then
				return text
			else
				return ""
			end
		end

		local opts = { noremap = true, silent = true }

		keymap.set("n", "<leader>G", function()
			tb.live_grep({ additional_args = { "-L" } })
		end, opts)
		keymap.set("v", "<leader>G", function()
			local text = vim.getVisualSelection()
			tb.live_grep({ default_text = text })
		end, opts)
	end,
}
