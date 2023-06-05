return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local widgets = require("dap.ui.widgets")

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebugger toggle [B]reakpoint" })

			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end, { desc = "[D]ebugger [C]ontinue" })

			vim.keymap.set("n", "<leader>dl", function()
				dap.run_last()
			end, { desc = "[D]ebugger [L]ast" })

			vim.keymap.set("n", "<leader>dT", function()
				dap.terminate()
			end, { desc = "[D]ebugger [T]erminate" })

			vim.keymap.set("n", "<leader>dss", function()
				dap.step_over()
			end, { desc = "[D]ebugger [S]tep Over" })

			vim.keymap.set("n", "<leader>dsi", function()
				dap.step_into()
			end, { desc = "[D]ebugger [S]tep [I]nto" })

			vim.keymap.set("n", "<leader>dso", function()
				dap.step_out()
			end, { desc = "[D]ebugger [S]tep [O]ut" })

			vim.keymap.set("n", "<leader>duh", function()
				widgets.hover()
			end, { desc = "[D]ebugger [U]I [H]over" })
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		opts = {},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>dut", function()
				dapui.toggle()
			end, { desc = "[D]ebugger [U]I [T]oggle" })
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			{ "mfussenegger/nvim-dap" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	},
}
