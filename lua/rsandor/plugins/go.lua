return {
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("dap-go").setup({})
		end,
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
		opts = {},
		keys = require("rsandor.keymap").go,
	},
}
