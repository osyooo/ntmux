return {
	"mfussenegger/nvim-dap",
	dependencies = {
    "rcarriga/nvim-dap-ui",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		local dap = require("dap")
    local dap_ui = require("dap.ui.widgets")
    -- vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })

		-- keymaps
		vim.keymap.set("n", "<F5>", function() dap.continue() end)
		vim.keymap.set("n", "<F10>", function() dap.step_over() end)
		vim.keymap.set("n", "<F11>", function() dap.step_into() end)
		vim.keymap.set("n", "<F12>", function() dap.step_out() end)
		vim.keymap.set("n", "<Leader>b", function() dap.toggle_breakpoint() end)
		vim.keymap.set("n", "<Leader>B", function() dap.set_breakpoint() end)
		vim.keymap.set("n", "<Leader>lp", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
		vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end)
		vim.keymap.set("n", "<Leader>dl", function() dap.run_last() end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function() dap_ui.hover() end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function() dap_ui.preview() end)
		vim.keymap.set("n", "<Leader>df", function() local widgets = dap_ui.widgets widgets.centered_float(widgets.frames) end)
		vim.keymap.set("n", "<Leader>ds", function() local widgets = dap_ui widgets.centered_float(widgets.scopes) end)
    -- vim.keymap.set("n"," <leader>dn", )

    -- nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
    -- nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
    -- vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>
      -- Python dap
    require('dap-python').setup()

    local test_runners = require('dap-python').test_runners

-- `test_runners` is a table. The keys are the runner names like `unittest` or `pytest`.
-- The value is a function that takes three arguments:
-- The classname, a methodname and the opts
-- (The `opts` are coming passed through from either `test_method` or `test_class`)
-- The function must return a module name and the arguments passed to the module as list.
    test_runners.your_runner = function(classname, methodname, opts)
      local args = {classname, methodname}
      return 'modulename', args
    end

		dap.adapters.python = function(cb, config)
			if config.request == "attach" then
				-- @diagnostic disable-next-line: undefined-field
				local port = (config.connect or config).port
				-- @diagnostic disable-next-line: undefined-field
				local host = (config.connect or config).host or "127.0.0.1"
				cb({
					type = "server",
					port = 53000,
					host = host,
					options = {
						source_filetype = "python",
					},
				})
			else
				cb({
					type = "executable",
					command = "/Users/kuznetsov.p/.config/devenv/bin/python",
					args = { "-m", "debugpy.adapter" },
					options = {
						source_filetype = "python",
					},
				})
			end
		end
	end,
}
