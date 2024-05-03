return {
	"akinsho/bufferline.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
				options = {
					separator_style = "thin",
					style_preset = bufferline.style_preset.default,
				},
		})
	end,
}
