return {
	{
		"leoluz/nvim-dap-go",
		ft = "go",
		dependencies = {
			"mfussenegger/nvim-dap"
		},
		opts = {},
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		build = function()
			vim.cmd [[silent! GoInstallDeps]]
		end,
		opts = {},
	},
}
